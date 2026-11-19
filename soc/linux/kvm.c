/*
 * A virtual machine on KVM, part of init.c (which includes this file): one
 * hart, RAM and the console of the SBI. It loads the kernel /guest.bin and
 * the device tree /guest.dtb, runs the guest and prints what the guest
 * writes to its console until the guest powers off.
 */
enum {
	KVM_CREATE_VM = 0xae01, KVM_GET_VCPU_MMAP_SIZE = 0xae04,
	KVM_CREATE_VCPU = 0xae41, KVM_RUN = 0xae80,
	KVM_SET_USER_MEMORY_REGION = 0x4020ae46, KVM_SET_ONE_REG = 0x4010aeac,
};
enum { KVM_EXIT_SYSTEM_EVENT = 24, KVM_EXIT_RISCV_SBI = 35 };

/* registers of the guest hart, and the switch for an SBI extension */
#define KVM_REG_CORE(index)	(0x8030000002000000ul + (index))
#define KVM_REG_PC		KVM_REG_CORE(0)
#define KVM_REG_A0		KVM_REG_CORE(10)
#define KVM_REG_A1		KVM_REG_CORE(11)
#define KVM_REG_SBI_DBCN	0x8030000008000009ul

/* The guest physical memory: the kernel image is made for an offset of 2 MiB,
 * the device tree goes to the end. */
#define GUEST_BASE	0x80000000ul
#define GUEST_SIZE	(32ul << 20)
#define GUEST_KERNEL	(2ul << 20)
#define GUEST_DTB	(GUEST_SIZE - (64ul << 10))

/* SBI debug console extension ("DBCN"): KVM hands its calls to this program */
#define SBI_EXT_DBCN	0x4442434eul

struct kvm_run {
	unsigned char request_interrupt_window, immediate_exit, padding[6];
	unsigned int exit_reason;
	unsigned char ready_for_interrupt_injection, if_flag;
	unsigned short flags;
	unsigned long cr8, apic_base;
	union {
		struct {
			unsigned long extension, function, args[6], ret[2];
		} sbi;
		struct {
			unsigned int type, ndata;
			unsigned long data[16];
		} system_event;
	};
};

/* The console output of the guest, written line by line. The guest ends its
 * lines with "\r\n", the terminal of the host adds the '\r' itself. */
static char guest_line[256];
static size_t guest_line_length;

static void guest_flush(void)
{
	syscall(SYS_write, 1, (long)guest_line, (long)guest_line_length, 0, 0, 0);
	guest_line_length = 0;
}

static void guest_output(const char *text, size_t n)
{
	for (size_t i = 0; i < n; i++) {
		if (text[i] == '\r')
			continue;
		guest_line[guest_line_length++] = text[i];
		if (text[i] == '\n' || guest_line_length == sizeof(guest_line))
			guest_flush();
	}
}

static long load_file(const char *path, char *to, size_t limit)
{
	long fd = syscall(SYS_openat, -100, (long)path, 0, 0, 0, 0);
	long total = 0, n;

	if (fd < 0)
		return -1;
	while ((size_t)total < limit &&
	       (n = syscall(SYS_read, fd, (long)(to + total), limit - total, 0, 0, 0)) > 0)
		total += n;
	syscall(SYS_close, fd, 0, 0, 0, 0, 0);
	return total;
}

static long set_register(long vcpu, unsigned long id, unsigned long value)
{
	const unsigned long reg[2] = {id, (unsigned long)&value};

	return syscall(SYS_ioctl, vcpu, KVM_SET_ONE_REG, (long)reg, 0, 0, 0);
}

static int fail(const char *what)
{
	print(what);
	print("\n");
	return 0;
}

static int check_guest(void)
{
	long kvm, vm, vcpu, size;
	struct kvm_run *run;
	char *ram;

	kvm = syscall(SYS_openat, -100, (long)"/dev/kvm", 2, 0, 0, 0);
	if (kvm < 0)
		return fail("no /dev/kvm");
	vm = syscall(SYS_ioctl, kvm, KVM_CREATE_VM, 0, 0, 0, 0);
	if (vm < 0)
		return fail("cannot create a virtual machine");

	ram = (char *)syscall(SYS_mmap, 0, GUEST_SIZE, 3, 0x22, -1, 0);
	if ((long)ram < 0 && (long)ram > -4096)
		return fail("no memory for the guest");
	const unsigned long region[4] = {0, GUEST_BASE, GUEST_SIZE, (unsigned long)ram};
	if (syscall(SYS_ioctl, vm, KVM_SET_USER_MEMORY_REGION, (long)region, 0, 0, 0))
		return fail("cannot give the guest its memory");
	if (load_file("/guest.bin", ram + GUEST_KERNEL, GUEST_DTB - GUEST_KERNEL) <= 0 ||
	    load_file("/guest.dtb", ram + GUEST_DTB, GUEST_SIZE - GUEST_DTB) <= 0)
		return fail("cannot load the guest");

	vcpu = syscall(SYS_ioctl, vm, KVM_CREATE_VCPU, 0, 0, 0, 0);
	size = syscall(SYS_ioctl, kvm, KVM_GET_VCPU_MMAP_SIZE, 0, 0, 0, 0);
	if (vcpu < 0 || size < (long)sizeof(*run))
		return fail("cannot create the hart of the guest");
	run = (struct kvm_run *)syscall(SYS_mmap, 0, size, 3, 1, vcpu, 0);
	if ((long)run < 0 && (long)run > -4096)
		return fail("cannot map the state of the guest hart");

	/* the kernel starts in supervisor mode with the hart number in a0 and
	 * the address of the device tree in a1 */
	if (set_register(vcpu, KVM_REG_SBI_DBCN, 1) ||
	    set_register(vcpu, KVM_REG_PC, GUEST_BASE + GUEST_KERNEL) ||
	    set_register(vcpu, KVM_REG_A0, 0) ||
	    set_register(vcpu, KVM_REG_A1, GUEST_BASE + GUEST_DTB))
		return fail("cannot set the registers of the guest");

	for (;;) {
		const long result = syscall(SYS_ioctl, vcpu, KVM_RUN, 0, 0, 0, 0);

		if (result == -4)	/* interrupted by a signal */
			continue;
		if (result < 0)
			return fail("the guest does not run");

		if (run->exit_reason == KVM_EXIT_SYSTEM_EVENT) {
			guest_flush();
			return run->system_event.type == 1;	/* shutdown */
		}
		if (run->exit_reason != KVM_EXIT_RISCV_SBI) {
			guest_flush();
			print("guest stopped with exit reason ");
			print_number(run->exit_reason);
			return fail("");
		}

		/* an SBI call that KVM leaves to this program; the default
		 * answer is "not supported" */
		const unsigned long *args = run->sbi.args;

		if (run->sbi.extension != SBI_EXT_DBCN)
			continue;
		if (run->sbi.function == 0) {
			/* write args[0] bytes at the guest physical address args[1] */
			if (args[1] >= GUEST_BASE && args[1] - GUEST_BASE < GUEST_SIZE &&
			    args[0] <= GUEST_SIZE - (args[1] - GUEST_BASE)) {
				guest_output(ram + (args[1] - GUEST_BASE), args[0]);
				run->sbi.ret[0] = 0;
				run->sbi.ret[1] = args[0];
			}
		} else if (run->sbi.function == 1) {
			/* read: there is no input */
			run->sbi.ret[0] = 0;
			run->sbi.ret[1] = 0;
		} else if (run->sbi.function == 2) {
			const char byte = (char)args[0];

			guest_output(&byte, 1);
			run->sbi.ret[0] = 0;
		}
	}
}

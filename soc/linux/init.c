/*
 * /init of the NiCore Linux image.
 *
 * A freestanding program (no C library, system calls only) that checks from
 * user space what the kernel needs from the core: system calls, demand paging,
 * copy-on-write, signals from faults, the timer and the atomic instructions.
 * It prints one line per check and powers the machine off, which ends the
 * simulation.
 */
typedef unsigned long size_t;

enum {
	SYS_ioctl = 29, SYS_mkdirat = 34, SYS_mount = 40, SYS_openat = 56,
	SYS_close = 57, SYS_read = 63, SYS_write = 64, SYS_exit = 93,
	SYS_nanosleep = 101, SYS_clock_gettime = 113, SYS_rt_sigaction = 134,
	SYS_reboot = 142, SYS_uname = 160, SYS_munmap = 215, SYS_clone = 220,
	SYS_mmap = 222, SYS_wait4 = 260,
};

static long syscall(long number, long a0, long a1, long a2, long a3, long a4, long a5)
{
	register long r7 __asm__("a7") = number;
	register long r0 __asm__("a0") = a0;
	register long r1 __asm__("a1") = a1;
	register long r2 __asm__("a2") = a2;
	register long r3 __asm__("a3") = a3;
	register long r4 __asm__("a4") = a4;
	register long r5 __asm__("a5") = a5;

	__asm__ volatile("ecall"
			 : "+r"(r0)
			 : "r"(r7), "r"(r1), "r"(r2), "r"(r3), "r"(r4), "r"(r5)
			 : "memory");
	return r0;
}

static size_t length(const char *s)
{
	size_t n = 0;
	while (s[n])
		n++;
	return n;
}

static void print(const char *s)
{
	syscall(SYS_write, 1, (long)s, (long)length(s), 0, 0, 0);
}

static void print_number(unsigned long value)
{
	char buffer[24];
	int i = sizeof(buffer) - 1;

	buffer[i] = 0;
	do {
		buffer[--i] = '0' + value % 10;
		value /= 10;
	} while (value);
	print(buffer + i);
}

static void exit(int code)
{
	for (;;)
		syscall(SYS_exit, code, 0, 0, 0, 0, 0);
}

static long fork(void)
{
	return syscall(SYS_clone, 17 /* SIGCHLD */, 0, 0, 0, 0, 0);
}

/* Wait for a child: its exit code, or 256 + the signal that killed it. */
static int wait_for(long pid)
{
	int status = 0;

	if (syscall(SYS_wait4, pid, (long)&status, 0, 0, 0, 0) != pid)
		return -1;
	return (status & 0x7f) ? 256 + (status & 0x7f) : (status >> 8) & 0xff;
}

static int check_uname(void)
{
	static char name[6][65];

	if (syscall(SYS_uname, (long)name, 0, 0, 0, 0, 0))
		return 0;
	print(name[0]);
	print(" ");
	print(name[2]);
	print(" ");
	print(name[4]);
	print("\n");
	return name[0][0] == 'L' && name[4][0] == 'r';
}

/* The kernel reports the ISA string and the MMU type it found. */
static int check_cpuinfo(void)
{
	static char text[1024];
	long fd, n;
	int lines = 0;

	syscall(SYS_mkdirat, -100, (long)"/proc", 0755, 0, 0, 0);
	if (syscall(SYS_mount, (long)"proc", (long)"/proc", (long)"proc", 0, 0, 0))
		return 0;
	fd = syscall(SYS_openat, -100, (long)"/proc/cpuinfo", 0, 0, 0, 0);
	if (fd < 0)
		return 0;
	n = syscall(SYS_read, fd, (long)text, sizeof(text) - 1, 0, 0, 0);
	syscall(SYS_close, fd, 0, 0, 0, 0, 0);
	if (n <= 0)
		return 0;
	text[n] = 0;
	for (char *line = text; *line; ) {
		char *end = line;
		while (*end && *end != '\n')
			end++;
		if ((line[0] == 'i' && line[1] == 's' && line[2] == 'a') ||
		    (line[0] == 'm' && line[1] == 'm' && line[2] == 'u')) {
			syscall(SYS_write, 1, (long)line, end - line + 1, 0, 0, 0);
			lines++;
		}
		line = *end ? end + 1 : end;
	}
	return lines == 2;
}

static int check_fork(void)
{
	long pid = fork();

	if (pid < 0)
		return 0;
	if (pid == 0)
		exit(42);
	return wait_for(pid) == 42;
}

/* A child gets its own copy of a page once it writes to it. */
static volatile long shared = 1234;

static int check_copy_on_write(void)
{
	long pid = fork();

	if (pid < 0)
		return 0;
	if (pid == 0) {
		shared = 5678;
		exit(shared == 5678 ? 7 : 1);
	}
	return wait_for(pid) == 7 && shared == 1234;
}

/* Anonymous memory is mapped on first touch, one page fault per page. */
static int check_demand_paging(void)
{
	const size_t size = 64 * 4096;
	unsigned long *area = (unsigned long *)syscall(SYS_mmap, 0, size, 3, 0x22, -1, 0);
	int ok = 1;

	if ((long)area < 0 && (long)area > -4096)
		return 0;
	for (size_t i = 0; i < size / sizeof(*area); i += 512)
		ok &= area[i] == 0;
	for (size_t i = 0; i < size / sizeof(*area); i++)
		area[i] = i * 0x9e3779b97f4a7c15ul;
	for (size_t i = 0; i < size / sizeof(*area); i++)
		ok &= area[i] == i * 0x9e3779b97f4a7c15ul;
	return ok && syscall(SYS_munmap, (long)area, size, 0, 0, 0, 0) == 0;
}

/* An illegal instruction and a store to address 0 reach the handlers of
 * SIGILL (4) and SIGSEGV (11) in the child. */
static void on_signal(int number)
{
	exit(100 + number);
}

static int check_signals(void)
{
	const struct {
		void (*handler)(int);
		unsigned long flags;
		unsigned long mask;
	} action = {on_signal, 0, 0};
	long pid = fork();

	if (pid < 0)
		return 0;
	if (pid == 0) {
		syscall(SYS_rt_sigaction, 4, (long)&action, 0, 8, 0, 0);
		__asm__ volatile(".word 0");
		exit(0);
	}
	if (wait_for(pid) != 100 + 4)
		return 0;

	pid = fork();
	if (pid < 0)
		return 0;
	if (pid == 0) {
		syscall(SYS_rt_sigaction, 11, (long)&action, 0, 8, 0, 0);
		*(volatile long *)0 = 1;
		exit(0);
	}
	return wait_for(pid) == 100 + 11;
}

/* Sleeping needs the timer interrupt and the scheduler. */
static int check_sleep(void)
{
	long before[2], after[2], request[2] = {0, 30 * 1000 * 1000};
	long elapsed;

	syscall(SYS_clock_gettime, 1, (long)before, 0, 0, 0, 0);
	if (syscall(SYS_nanosleep, (long)request, 0, 0, 0, 0, 0))
		return 0;
	syscall(SYS_clock_gettime, 1, (long)after, 0, 0, 0, 0);
	elapsed = (after[0] - before[0]) * 1000000000 + after[1] - before[1];
	print("slept ");
	print_number(elapsed / 1000);
	print(" us\n");
	return elapsed >= 30 * 1000 * 1000 && elapsed < 300 * 1000 * 1000;
}

/* Multiply, divide and the atomic instructions in user mode. */
static int check_arithmetic(void)
{
	static unsigned char composite[20000];
	volatile long counter = 0;
	volatile int word = -5;
	unsigned long primes = 0, hash = 14695981039346656037ul;

	for (unsigned long i = 2; i < sizeof(composite); i++) {
		if (composite[i])
			continue;
		primes++;
		for (unsigned long j = i * i; j < sizeof(composite); j += i)
			composite[j] = 1;
	}
	for (unsigned long i = 1; i <= 1000; i++) {
		hash = (hash ^ (i * i % 97)) * 1099511628211ul;
		hash += (long)(hash >> 7) / (long)i;
		__atomic_fetch_add(&counter, (long)i, __ATOMIC_SEQ_CST);
	}
	__atomic_fetch_and(&word, 0xff, __ATOMIC_SEQ_CST);
	__atomic_fetch_xor(&word, 0x0f, __ATOMIC_SEQ_CST);
	return primes == 2262 && counter == 500500 && word == 0xf4 &&
	       hash == 0x88690ca2ee4dd218ul;
}

static const struct {
	const char *name;
	int (*run)(void);
} checks[] = {
	{"uname", check_uname},
	{"cpuinfo", check_cpuinfo},
	{"fork", check_fork},
	{"copy on write", check_copy_on_write},
	{"demand paging", check_demand_paging},
	{"signals", check_signals},
	{"sleep", check_sleep},
	{"arithmetic", check_arithmetic},
};

void main(void)
{
	const int total = sizeof(checks) / sizeof(checks[0]);
	int passed = 0;

	print("\nNiCore Linux init reached\n");
	for (int i = 0; i < total; i++) {
		const int ok = checks[i].run();
		print(ok ? "PASS " : "FAIL ");
		print(checks[i].name);
		print("\n");
		passed += ok;
	}
	print_number(passed);
	print(" of ");
	print_number(total);
	print(" checks passed\n");

	/* TCSBRK with a non-zero argument waits until the console has sent
	 * everything; then LINUX_REBOOT_CMD_POWER_OFF */
	syscall(SYS_ioctl, 1, 0x5409, 1, 0, 0, 0);
	syscall(SYS_reboot, 0xfee1dead, 672274793, 0x4321fedc, 0, 0, 0);
	for (;;)
		syscall(SYS_nanosleep, (long)(long[2]){1, 0}, 0, 0, 0, 0, 0);
}

__asm__(".globl _start\n"
	"_start:\n"
	".option push\n"
	".option norelax\n"
	"	la gp, __global_pointer$\n"
	".option pop\n"
	"	andi sp, sp, -16\n"
	"	call main\n");

## NiCore (A rv64 core with MMU)
  This project contains a RISC-V 5-stage in-order core with an Sv39 MMU, supporting Integer and Multiplication extensions. To debug the core, I also developed an RV64 emulator in C for diﬀerential testing against the core (https://github.com/PorterLu/sustemu).

The core now also has the A and H extensions and S/U mode. In a Verilator simulation it boots OpenSBI and Linux, and Linux starts a guest with KVM.

### Result

OpenSBI and Linux 6.12 booting on NiCore; the last check of `/init` boots a second Linux as a KVM guest:

```text
OpenSBI v1.3
   ____                    _____ ____ _____
  / __ \                  / ____|  _ \_   _|
 | |  | |_ __   ___ _ __ | (___ | |_) || |
 | |  | | '_ \ / _ \ '_ \ \___ \|  _ < | |
 | |__| | |_) |  __/ | | |____) | |_) || |_
  \____/| .__/ \___|_| |_|_____/|___/_____|
        | |
        |_|

Platform Name             : NiCore RV64
Platform Features         : medeleg
Platform HART Count       : 1
Platform IPI Device       : aclint-mswi
Platform Timer Device     : aclint-mtimer @ 10000000Hz
Platform Console Device   : uart8250
Platform HSM Device       : ---
Platform PMU Device       : ---
Platform Reboot Device    : sifive_test
Platform Shutdown Device  : sifive_test
Platform Suspend Device   : ---
Platform CPPC Device      : ---
Firmware Base             : 0x80000000
Firmware Size             : 318 KB
Firmware RW Offset        : 0x40000
Firmware RW Size          : 62 KB
Firmware Heap Offset      : 0x47000
Firmware Heap Size        : 34 KB (total), 2 KB (reserved), 9 KB (used), 22 KB (free)
Firmware Scratch Size     : 4096 B (total), 736 B (used), 3360 B (free)
Runtime SBI Version       : 1.0

Domain0 Name              : root
Domain0 Boot HART         : 0
Domain0 HARTs             : 0*
Domain0 Region00          : 0x0000000002000000-0x000000000200ffff M: (I,R,W) S/U: ()
Domain0 Region01          : 0x0000000080040000-0x000000008004ffff M: (R,W) S/U: ()
Domain0 Region02          : 0x0000000080000000-0x000000008003ffff M: (R,X) S/U: ()
Domain0 Region03          : 0x0000000000000000-0xffffffffffffffff M: (R,W,X) S/U: (R,W,X)
Domain0 Next Address      : 0x0000000080200000
Domain0 Next Arg1         : 0x0000000087e00000
Domain0 Next Mode         : S-mode
Domain0 SysReset          : yes
Domain0 SysSuspend        : yes

Boot HART ID              : 0
Boot HART Domain          : root
Boot HART Priv Version    : v1.12
Boot HART Base ISA        : rv64imah
Boot HART ISA Extensions  : none
Boot HART PMP Count       : 16
Boot HART PMP Granularity : 4
Boot HART PMP Address Bits: 54
Boot HART MHPM Count      : 4
Boot HART MIDELEG         : 0x0000000000000666
Boot HART MEDELEG         : 0x0000000000f0b509
[    0.000000] Linux version 6.12.0-dirty (nicore@nicore) (riscv64-unknown-elf-gcc (gc891d8dc2) 13.2.0, Homebrew LLD 22.1.8) #1 Thu Nov 19 14:31:08 +08 2026
[    0.000000] Machine model: NiCore RV64
[    0.000000] SBI specification v1.0 detected
[    0.000000] SBI implementation ID=0x1 Version=0x10003
[    0.000000] SBI TIME extension detected
[    0.000000] SBI IPI extension detected
[    0.000000] SBI RFENCE extension detected
[    0.000000] SBI SRST extension detected
[    0.000000] earlycon: ns16550a0 at MMIO 0x0000000010000000 (options '')
[    0.000000] printk: legacy bootconsole [ns16550a0] enabled
[    0.000000] OF: reserved mem: 0x0000000080000000..0x000000008003ffff (256 KiB) nomap non-reusable mmode_resv1@80000000
[    0.000000] OF: reserved mem: 0x0000000080040000..0x000000008004ffff (64 KiB) nomap non-reusable mmode_resv0@80040000
[    0.000000] Zone ranges:
[    0.000000]   DMA32    [mem 0x0000000080000000-0x000000008fffffff]
[    0.000000]   Normal   empty
[    0.000000] Movable zone start for each node
[    0.000000] Early memory node ranges
[    0.000000]   node   0: [mem 0x0000000080000000-0x000000008004ffff]
[    0.000000]   node   0: [mem 0x0000000080050000-0x000000008fffffff]
[    0.000000] Initmem setup node 0 [mem 0x0000000080000000-0x000000008fffffff]
[    0.000000] riscv: base ISA extensions ahim
[    0.000000] riscv: ELF capabilities aim
[    0.000000] Kernel command line: console=ttyS0,115200 earlycon
[    0.000000] Dentry cache hash table entries: 32768 (order: 6, 262144 bytes, linear)
[    0.000000] Inode-cache hash table entries: 16384 (order: 5, 131072 bytes, linear)
[    0.000000] Built 1 zonelists, mobility grouping on.  Total pages: 65536
[    0.000000] mem auto-init: stack:all(zero), heap alloc:off, heap free:off
[    0.000000] SLUB: HWalign=64, Order=0-3, MinObjects=0, CPUs=1, Nodes=1
[    0.000000] NR_IRQS: 64, nr_irqs: 64, preallocated irqs: 0
[    0.000000] riscv-intc: 64 local interrupts mapped
[    0.000000] clocksource: riscv_clocksource: mask: 0xffffffffffffffff max_cycles: 0x24e6a1710, max_idle_ns: 440795202120 ns
[    0.000062] sched_clock: 64 bits at 10MHz, resolution 100ns, wraps every 4398046511100ns
[    0.002928] Calibrating delay loop (skipped), value calculated using timer frequency.. 20.00 BogoMIPS (lpj=100000)
[    0.004773] pid_max: default: 32768 minimum: 301
[    0.009038] Mount-cache hash table entries: 512 (order: 0, 4096 bytes, linear)
[    0.010595] Mountpoint-cache hash table entries: 512 (order: 0, 4096 bytes, linear)
[    0.054927] ASID allocator disabled (0 bits)
[    0.059683] Memory: 251912K/262144K available (1343K kernel code, 550K rwdata, 392K rodata, 2496K init, 217K bss, 9352K reserved, 0K cma-reserved)
[    0.069366] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 19112604462750000 ns
[    0.100808] clocksource: Switched to clocksource riscv_clocksource
[    0.115151] kvm [1]: hypervisor extension available
[    0.116120] kvm [1]: using Sv39x4 G-stage page table format
[    0.117190] kvm [1]: VMID 0 bits available
[    0.141775] workingset: timestamp_bits=62 max_order=16 bucket_order=0
[    0.814819] Serial: 8250/16550 driver, 4 ports, IRQ sharing disabled
[    0.835904] of_serial 10000000.uart: error -6: IRQ index 0 not found
[    0.838342] printk: legacy console [ttyS0] disabled
[    0.845183] 10000000.uart: ttyS0 at MMIO 0x10000000 (irq = 0, base_baud = 115200) is a Altera 16550 FIFO128
[    0.847406] printk: legacy console [ttyS0] enabled
[    0.847406] printk: legacy console [ttyS0] enabled
[    0.849214] printk: legacy bootconsole [ns16550a0] disabled
[    0.849214] printk: legacy bootconsole [ns16550a0] disabled
[    1.078114] clk: Disabling unused clocks
[    1.155811] Freeing unused kernel image (initmem) memory: 2496K
[    1.156736] Kernel memory protection not selected by kernel config.
[    1.157553] Run /init as init process

NiCore Linux init reached
Linux 6.12.0-dirty riscv64
PASS uname
isa		: rv64imah_zicsr_zifencei
mmu		: sv39
PASS cpuinfo
PASS fork
PASS copy on write
PASS demand paging
PASS signals
slept 39013 us
PASS sleep
PASS arithmetic
[    0.000000] Linux version 6.12.0-dirty (nicore@nicore) (riscv64-unknown-elf-gcc (gc891d8dc2) 13.2.0, Homebrew LLD 22.1.8) #1 Thu Nov 19 14:30:44 +08 2026
[    0.000000] Machine model: NiCore KVM guest
[    0.000000] SBI specification v2.0 detected
[    0.000000] SBI implementation ID=0x3 Version=0x60c00
[    0.000000] SBI TIME extension detected
[    0.000000] SBI IPI extension detected
[    0.000000] SBI RFENCE extension detected
[    0.000000] SBI SRST extension detected
[    0.000000] SBI DBCN extension detected
[    0.000000] earlycon: sbi0 at I/O port 0x0 (options '')
[    0.000000] printk: legacy bootconsole [sbi0] enabled
[    0.000000] Zone ranges:
[    0.000000]   DMA32    [mem 0x0000000080000000-0x0000000081ffffff]
[    0.000000]   Normal   empty
[    0.000000] Movable zone start for each node
[    0.000000] Early memory node ranges
[    0.000000]   node   0: [mem 0x0000000080000000-0x0000000081ffffff]
[    0.000000] Initmem setup node 0 [mem 0x0000000080000000-0x0000000081ffffff]
[    0.000000] riscv: base ISA extensions aim
[    0.000000] riscv: ELF capabilities aim
[    0.000000] Kernel command line: console=hvc0 earlycon=sbi
[    0.000000] Dentry cache hash table entries: 4096 (order: 3, 32768 bytes, linear)
[    0.000000] Inode-cache hash table entries: 2048 (order: 2, 16384 bytes, linear)
[    0.000000] Built 1 zonelists, mobility grouping on.  Total pages: 8192
[    0.000000] mem auto-init: stack:all(zero), heap alloc:off, heap free:off
[    0.000000] SLUB: HWalign=64, Order=0-3, MinObjects=0, CPUs=1, Nodes=1
[    0.000000] NR_IRQS: 64, nr_irqs: 64, preallocated irqs: 0
[    0.000000] riscv-intc: 64 local interrupts mapped
[    0.000000] clocksource: riscv_clocksource: mask: 0xffffffffffffffff max_cycles: 0x24e6a1710, max_idle_ns: 440795202120 ns
[    0.000065] sched_clock: 64 bits at 10MHz, resolution 100ns, wraps every 4398046511100ns
[    0.006780] Calibrating delay loop (skipped), value calculated using timer frequency.. 20.00 BogoMIPS (lpj=100000)
[    0.009051] pid_max: default: 32768 minimum: 301
[    0.014340] Mount-cache hash table entries: 512 (order: 0, 4096 bytes, linear)
[    0.019881] Mountpoint-cache hash table entries: 512 (order: 0, 4096 bytes, linear)
[    0.128320] ASID allocator disabled (0 bits)
[    0.140934] Memory: 29060K/32768K available (1227K kernel code, 557K rwdata, 362K rodata, 168K init, 213K bss, 3084K reserved, 0K cma-reserved)
[    0.162716] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 19112604462750000 ns
[    0.194802] clocksource: Switched to clocksource riscv_clocksource
[    0.248021] workingset: timestamp_bits=62 max_order=13 bucket_order=0
[    1.022013] printk: legacy console [hvc0] enabled
[    1.022013] printk: legacy console [hvc0] enabled
[    1.026823] printk: legacy bootconsole [sbi0] disabled
[    1.026823] printk: legacy bootconsole [sbi0] disabled
[    1.043294] clk: Disabling unused clocks
[    1.060729] Freeing unused kernel image (initmem) memory: 168K
[    1.063282] Kernel memory protection not selected by kernel config.
[    1.066866] Run /init as init process

NiCore Linux guest init reached
Linux 6.12.0-dirty riscv64
PASS uname
isa		: rv64ima_zicsr_zifencei
mmu		: sv39
PASS cpuinfo
PASS fork
PASS copy on write
PASS demand paging
PASS signals
slept 38926 us
PASS sleep
PASS arithmetic
8 of 8 checks passed
[    1.377857] reboot: Power down
PASS guest
9 of 9 checks passed
[    3.532342] kvm: exiting hardware virtualization
[    3.533082] reboot: Power down
```

### Usage

```bash
cd soc
make                              # simulator: obj_dir/Vnicore
./obj_dir/Vnicore firmware.bin    # OpenSBI

# difftest against SUSTemu
git submodule update --init third_party/sustemu
make difftest
DIFFTEST=../third_party/sustemu/build/sustemu-difftest.so ./obj_dir/Vnicore firmware.bin

# Linux with a KVM guest
make -C linux LINUX=<Linux v6.12 source> OPENSBI=<OpenSBI v1.3 source>
./obj_dir/Vnicore linux/build/linux.bin 1000000000

# hypervisor extension tests
make -C hyp HYP_TESTS=<riscv-hyp-tests source>
./obj_dir/Vnicore hyp/build/rvh_test.bin 100000000
```

### Features
- Sv39 page-based virtual memory
- A extension (LR/SC, AMO)
- H extension (VS/VU mode, two-stage address translation with Sv39x4, HLV/HSV)
- M/S/U mode CSRs (PMP, envcfg, triggers, HPM)
- CLINT timer/software interrupts
- Verilator SoC simulation with UART

### References
- [SUSTemu](https://github.com/PorterLu/sustemu) — RV64 emulator for difftest
- [soc-simulator](https://github.com/cyyself/soc-simulator) — the UART and AXI device models of the testbench follow it
- [OpenSBI](https://github.com/riscv-software-src/opensbi) and [Linux](https://www.kernel.org) — the software that runs
- [riscv-hyp-tests](https://github.com/ninolomata/riscv-hyp-tests) — tests of the H extension

## NiCore (A rv64 core with MMU)
  This project contains a RISC-V 5-stage in-order core with an Sv39 MMU, supporting Integer and Multiplication extensions. To debug the core, I also developed an RV64 emulator in C for diﬀerential testing against the core (https://github.com/PorterLu/sustemu).

The core now also has the A extension and S/U mode. In a Verilator simulation it boots OpenSBI and Linux.

### Result

Linux 6.12 booting on NiCore:

```text
[    0.999821] Run /init as init process

NiCore Linux init reached
Linux 6.12.0-dirty riscv64
PASS uname
isa		: rv64ima_zicsr_zifencei
mmu		: sv39
PASS cpuinfo
PASS fork
PASS copy on write
PASS demand paging
PASS signals
slept 31476 us
PASS sleep
PASS arithmetic
8 of 8 checks passed
[    1.345438] reboot: Power down
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

# Linux
make -C linux LINUX=<Linux v6.12 source> OPENSBI=<OpenSBI v1.3 source>
./obj_dir/Vnicore linux/build/linux.bin 400000000
```

### Features
- Sv39 page-based virtual memory
- A extension (LR/SC, AMO)
- M/S/U mode CSRs (PMP, envcfg, triggers, HPM)
- CLINT timer/software interrupts
- Verilator SoC simulation with UART

### References
- [SUSTemu](https://github.com/PorterLu/sustemu) — RV64 emulator for difftest
- [soc-simulator](https://github.com/cyyself/soc-simulator) — the UART and AXI device models of the testbench follow it
- [OpenSBI](https://github.com/riscv-software-src/opensbi) and [Linux](https://www.kernel.org) — the software that runs

## NiCore (A rv64 core with MMU)

A RISC-V 5-stage in-order core with Sv39 MMU, supporting RV64IMA + Zicsr + Zifencei.

### Differential Testing with SUSTemu

The SoC simulation supports [SUSTemu](https://github.com/PorterLu/sustemu) 
as a functional reference model for differential testing.

#### Setup

```bash
# 1. Clone sustemu
git clone https://github.com/PorterLu/sustemu.git /tmp/sustemu

# 2. Build sustemu difftest shared library
cd /tmp/sustemu
# See doc/soc/README for build instructions (or copy from NiCore doc)
```

#### Usage

```bash
cd soc
# Without difftest
./obj_dir/Vnicore firmware.bin

# With difftest (optional)
DIFFTEST=/tmp/sustemu-difftest.so ./obj_dir/Vnicore test.bin
```

### Features
- Sv39 page-based virtual memory
- A extension (LR/SC, AMO)
- M-mode CSRs (PMP, envcfg, triggers, HPM)
- CLINT timer/software interrupts
- Verilator SoC simulation with UART

### See also
- [SUSTemu](https://github.com/PorterLu/sustemu) — RV64 emulator for difftest

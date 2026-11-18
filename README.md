## NiCore (A rv64 core with MMU)

A RISC-V 5-stage in-order core with Sv39 MMU, supporting RV64IMA + Zicsr + Zifencei.

### Differential Testing with SUSTemu

The SoC simulation supports [SUSTemu](https://github.com/PorterLu/sustemu) 
as a functional reference model for differential testing.

#### Setup

```bash
# 1. Initialize the pinned SUSTemu submodule
git submodule update --init third_party/sustemu
git -C third_party/sustemu checkout nicore

# 2. Build SUSTemu and its difftest library following that repository's README
make -C third_party/sustemu
```

#### Usage

```bash
cd soc
# Without difftest
./obj_dir/Vnicore firmware.bin

# With difftest (optional)
DIFFTEST=../third_party/sustemu/build/sustemu-difftest.so ./obj_dir/Vnicore test.bin
```

### Features
- Sv39 page-based virtual memory
- A extension (LR/SC, AMO)
- M-mode CSRs (PMP, envcfg, triggers, HPM)
- CLINT timer/software interrupts
- Verilator SoC simulation with UART

### See also
- [SUSTemu](https://github.com/PorterLu/sustemu) — RV64 emulator for difftest

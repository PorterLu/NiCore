// Verilator testbench for NiCore.
//
// The testbench owns everything outside the core: the DRAM, a 16550 UART, a
// CLINT and a power-off register, all behind the AXI4 master port.
//
//   Vnicore <image> [max cycles]
//
// Environment variables:
//   DIFFTEST=<library>  compare every retired instruction against the SUSTemu
//                       difftest library (see difftest.h)
//   TRACE_COMMIT=1      print every retired instruction and every trap
//   PROGRESS=<cycles>   report the position and the traps taken so far
//   WAVE=<file>[:<first cycle>[:<last cycle>]]
//                       dump a VCD (simulator built with make TRACE=1)
#include <verilated.h>
#include "Vnicore.h"
#if VM_TRACE
#include <verilated_vcd_c.h>
#endif
#include <cstdint>
#include <cstdio>
#include <cstdlib>
#include <cstring>
#include <poll.h>
#include <unistd.h>
#include "difftest.h"

#define DRAM_BASE   0x80000000ull
#define DRAM_SIZE   (256ull * 1024 * 1024)
#define UART_BASE   0x10000000ull
#define UART_SIZE   0x100ull
#define CLINT_BASE  0x02000000ull
#define CLINT_SIZE  0x10000ull
#define FINISH_BASE 0x00100000ull   // SiFive test device: 0x5555 powers off
#define FINISH_SIZE 0x1000ull
// The core clock is taken as 100 MHz and mtime counts at 10 MHz.
#define CYCLES_PER_MTIME 10

static Vnicore *top;
static uint64_t cycles;
static bool finished;
static int exit_code;
static Difftest diff;
static bool mismatch;

// ---------------------------------------------------------------- DRAM
static uint8_t *dram;

static bool in_dram(uint64_t address, uint64_t size) {
    return address >= DRAM_BASE && address - DRAM_BASE <= DRAM_SIZE - size;
}

// ---------------------------------------------------------------- UART
// 16550 registers after the uart8250 model of soc-simulator
// (https://github.com/cyyself/soc-simulator), without an interrupt line: a
// byte written is printed at once, so the transmitter is always empty, and a
// byte typed on stdin stays in the receive buffer until it is read.
static struct {
    uint8_t ier, lcr = 0x03, mcr, dll, dlm;
    uint8_t rx;
    bool rx_valid;
} uart;

static uint8_t uart_read(unsigned reg) {
    const bool dlab = uart.lcr & 0x80;
    switch (reg) {
    case 0:
        if (dlab) return uart.dll;
        uart.rx_valid = false;
        return uart.rx;
    case 1: return dlab ? uart.dlm : uart.ier;
    case 2: {   // IIR: FIFOs enabled, transmitter empty and data available
        uint8_t iir = 0xc0;
        if (uart.ier & 2) iir |= 0x02;
        if ((uart.ier & 1) && uart.rx_valid) iir |= 0x04;
        return iir & 0x06 ? iir : iir | 0x01;
    }
    case 3: return uart.lcr;
    case 4: return uart.mcr;
    case 5: return 0x60 | (uart.rx_valid ? 0x01 : 0);   // LSR
    case 6: return 0x90;                                // MSR: carrier, clear to send
    }
    return 0;
}

static void uart_write(unsigned reg, uint8_t value) {
    const bool dlab = uart.lcr & 0x80;
    switch (reg) {
    case 0:
        if (dlab) {
            uart.dll = value;
        } else {
            fputc(value, stdout);
            fflush(stdout);
        }
        break;
    case 1: (dlab ? uart.dlm : uart.ier) = value; break;
    case 2: if (value & 2) uart.rx_valid = false; break;   // FCR: clear the receiver
    case 3: uart.lcr = value; break;
    case 4: uart.mcr = value; break;
    }
}

static void uart_poll_stdin() {
    static bool eof;
    struct pollfd fd = {STDIN_FILENO, POLLIN, 0};
    if (eof || uart.rx_valid || poll(&fd, 1, 0) <= 0)
        return;
    if (read(STDIN_FILENO, &uart.rx, 1) == 1)
        uart.rx_valid = true;
    else
        eof = true;
}

// ---------------------------------------------------------------- CLINT
static uint64_t clint_msip;
static uint64_t clint_mtimecmp = ~0ull;
static uint64_t clint_mtime;

static uint64_t *clint_register(uint64_t offset) {
    switch (offset & ~7ull) {
    case 0x0000: return &clint_msip;
    case 0x4000: return &clint_mtimecmp;
    case 0xbff8: return &clint_mtime;
    }
    return nullptr;
}

// ---------------------------------------------------------------- bus
static bool in_range(uint64_t address, uint64_t base, uint64_t size) {
    return address >= base && address < base + size;
}

// Read the 8-byte lane that contains `address`. Only the `size` addressed
// bytes are read from a device, so that a read has no side effect on the
// registers next to it.
static uint64_t bus_read(uint64_t address, unsigned size) {
    const uint64_t lane = address & ~7ull;
    uint64_t data = 0;
    if (in_dram(lane, 8)) {
        memcpy(&data, dram + lane - DRAM_BASE, 8);
    } else if (in_range(address, UART_BASE, UART_SIZE)) {
        for (unsigned i = 0; i < size && (address & 7) + i < 8; i++)
            data |= (uint64_t)uart_read((address + i) & 0xff) << (8 * ((address & 7) + i));
    } else if (in_range(address, CLINT_BASE, CLINT_SIZE)) {
        const uint64_t *reg = clint_register(address - CLINT_BASE);
        data = reg ? *reg : 0;
    }
    return data;
}

static void bus_write(uint64_t address, uint64_t data, uint8_t strobe) {
    const uint64_t lane = address & ~7ull;
    uint64_t mask = 0;
    for (int i = 0; i < 8; i++)
        if (strobe & (1 << i))
            mask |= 0xffull << (8 * i);

    if (in_dram(lane, 8)) {
        uint64_t old;
        memcpy(&old, dram + lane - DRAM_BASE, 8);
        old = (old & ~mask) | (data & mask);
        memcpy(dram + lane - DRAM_BASE, &old, 8);
        if (!diff.writeback(lane, data, strobe))
            mismatch = true;
    } else if (in_range(address, UART_BASE, UART_SIZE)) {
        for (int i = 0; i < 8; i++)
            if (strobe & (1 << i))
                uart_write((lane + i) & 0xff, data >> (8 * i));
    } else if (in_range(address, CLINT_BASE, CLINT_SIZE)) {
        uint64_t *reg = clint_register(address - CLINT_BASE);
        if (reg) {
            *reg = (*reg & ~mask) | (data & mask);
            clint_msip &= 1;
        }
    } else if (in_range(address, FINISH_BASE, FINISH_SIZE)) {
        const uint32_t value = (data & mask) >> (8 * (address & 4));
        finished = true;
        exit_code = (value & 0xffff) == 0x3333 ? (int)(value >> 16) : 0;
    }
}

// AXI4 slave: one read and one write burst at a time, with a fixed latency
// before the first beat.
struct Burst {
    bool busy = false;
    uint64_t address = 0;
    unsigned size = 0;
    int beats = 0;
    int beat = 0;
    int wait = 0;
};

static Burst read_burst, write_burst;

static void axi_step() {
    top->io_master_arready = 1;
    if (top->io_master_arvalid && !read_burst.busy)
        read_burst = {true, top->io_master_araddr, 1u << top->io_master_arsize,
                      top->io_master_arlen + 1, 0, 2};

    top->io_master_rvalid = 0;
    top->io_master_rlast = 0;
    if (read_burst.busy) {
        if (read_burst.wait) {
            read_burst.wait--;
        } else {
            // the data of a beat is fetched once and held until accepted
            static bool held;
            static uint64_t data;
            if (!held) {
                data = bus_read(read_burst.address + 8ull * read_burst.beat, read_burst.size);
                held = true;
            }
            top->io_master_rvalid = 1;
            top->io_master_rdata = data;
            top->io_master_rresp = 0;
            top->io_master_rid = top->io_master_arid;
            top->io_master_rlast = read_burst.beat == read_burst.beats - 1;
            top->eval();
            if (top->io_master_rready) {
                held = false;
                if (++read_burst.beat >= read_burst.beats)
                    read_burst.busy = false;
            }
        }
    }

    top->io_master_awready = 1;
    if (top->io_master_awvalid && !write_burst.busy)
        write_burst = {true, top->io_master_awaddr, 1u << top->io_master_awsize,
                       top->io_master_awlen + 1, 0, 2};

    top->io_master_wready = write_burst.busy && write_burst.wait == 0;
    if (write_burst.busy && write_burst.wait) {
        write_burst.wait--;
    } else if (write_burst.busy && top->io_master_wvalid) {
        bus_write(write_burst.address + 8ull * write_burst.beat, top->io_master_wdata,
                  top->io_master_wstrb);
        if (++write_burst.beat >= write_burst.beats) {
            write_burst.busy = false;
            top->io_master_bvalid = 1;
            top->io_master_bresp = 0;
        }
    }
}

// ---------------------------------------------------------------- main
int main(int argc, char **argv) {
    Verilated::commandArgs(argc, argv);
    if (argc < 2) {
        fprintf(stderr, "usage: %s <image> [max cycles]\n", argv[0]);
        return 2;
    }
    const char *image = argv[1];
    const uint64_t max_cycles = argc > 2 ? strtoull(argv[2], nullptr, 0) : 20000000ull;
    const bool trace_commits = getenv("TRACE_COMMIT") != nullptr;
    // PROGRESS=<cycles> reports the position and the traps taken so far
    const uint64_t progress = getenv("PROGRESS") ? strtoull(getenv("PROGRESS"), nullptr, 0) : 0;
    uint64_t interrupts[32] = {}, exceptions[32] = {}, last_pc = 0;

    dram = static_cast<uint8_t *>(calloc(DRAM_SIZE, 1));
    FILE *file = fopen(image, "rb");
    if (!file) {
        fprintf(stderr, "cannot open %s\n", image);
        return 2;
    }
    const size_t size = fread(dram, 1, DRAM_SIZE, file);
    fclose(file);
    fprintf(stderr, "[soc] loaded %zu bytes from %s\n", size, image);

    if (getenv("DIFFTEST")) {
        if (!diff.load(getenv("DIFFTEST"), DRAM_BASE, DRAM_SIZE, dram, size))
            return 2;
        fprintf(stderr, "[diff] comparing against %s\n", getenv("DIFFTEST"));
    }

    top = new Vnicore;
#if VM_TRACE
    // WAVE=<file>[:<first cycle>[:<last cycle>]] dumps a VCD of that window
    VerilatedVcdC *wave = nullptr;
    uint64_t wave_first = 0, wave_last = ~0ull;
    if (const char *spec = getenv("WAVE")) {
        char path[512];
        unsigned long long first = 0, last = ~0ull;
        sscanf(spec, "%511[^:]:%llu:%llu", path, &first, &last);
        wave_first = first;
        wave_last = last;
        Verilated::traceEverOn(true);
        wave = new VerilatedVcdC;
        top->trace(wave, 99);
        wave->open(path);
    }
#endif

    top->io_master_arready = 0;
    top->io_master_rvalid = 0;
    top->io_master_awready = 0;
    top->io_master_wready = 0;
    top->io_master_bvalid = 0;
    top->io_interrupt = 0;
    top->io_timer_interrupt = 0;
    top->io_soft_interrupt = 0;
    top->reset = 1;
    for (int i = 0; i < 6; i++) {
        top->clock = i & 1;
        top->eval();
    }
    top->reset = 0;

    uint64_t committed = 0;
    uint64_t hw_pending_before = 0;

    while (cycles < max_cycles && !finished && !mismatch && !Verilated::gotFinish()) {
        // BVALID stays up until the edge that sees BREADY
        const bool b_handshake = top->io_master_bvalid && top->io_master_bready;

        top->io_timer_interrupt = clint_mtime >= clint_mtimecmp;
        top->io_soft_interrupt = clint_msip & 1;
        top->eval();
        axi_step();
        top->eval();

        // A store reaches the data cache before its instruction retires.
        if (top->io_store_valid)
            diff.store(top->io_store_addr, top->io_store_data, top->io_store_mask);

        // An instruction that retires in this cycle is older than a trap
        // taken in this cycle.
        if (top->io_commit_valid) {
            const Difftest::Commit commit = {top->io_commit_pc, top->io_commit_inst,
                                             (bool)top->io_commit_wb_en, top->io_commit_wb_addr,
                                             top->io_commit_wb_data};
            if (trace_commits) {
                fprintf(stderr, "[commit] %llu pc=%llx inst=%08x", (unsigned long long)committed,
                        (unsigned long long)commit.pc, commit.inst);
                if (commit.wb_en)
                    fprintf(stderr, " x%u=%llx", commit.wb_addr,
                            (unsigned long long)commit.wb_data);
                fprintf(stderr, "\n");
            }
            committed++;
            last_pc = commit.pc;
            if (!diff.commit(commit) ||
                (commit.inst == 0x0000100f && !diff.flushed(dram))) {
                mismatch = true;
                break;
            }
        }
        // The pending bits wired to the CLINT reach mip one cycle late.
        const uint64_t hw_pending = (top->io_timer_interrupt ? 1ull << 7 : 0) |
                                    (top->io_soft_interrupt ? 1ull << 3 : 0);
        if (top->io_trap_valid) {
            ((top->io_trap_cause >> 63) ? interrupts : exceptions)[top->io_trap_cause & 31]++;
            if (trace_commits)
                fprintf(stderr, "[trap] cause=%llx epc=%llx tval=%llx tval2=%llx tinst=%llx\n",
                        (unsigned long long)top->io_trap_cause,
                        (unsigned long long)top->io_trap_epc,
                        (unsigned long long)top->io_trap_tval,
                        (unsigned long long)top->io_trap_tval2,
                        (unsigned long long)top->io_trap_tinst);
            diff.trap({top->io_trap_cause, top->io_trap_epc, top->io_trap_tval,
                       top->io_trap_tval2, top->io_trap_tinst,
                       hw_pending | hw_pending_before});
        }
        hw_pending_before = hw_pending;

#if VM_TRACE
        if (wave && cycles >= wave_first && cycles <= wave_last) {
            top->clock = 0;
            top->eval();
            wave->dump(2 * cycles);
            top->clock = 1;
            top->eval();
            wave->dump(2 * cycles + 1);
        } else
#endif
        {
            top->clock = 0;
            top->eval();
            top->clock = 1;
            top->eval();
        }
        cycles++;
        if (cycles % CYCLES_PER_MTIME == 0)
            clint_mtime++;
        if (b_handshake)
            top->io_master_bvalid = 0;
        if ((cycles & 0x3fff) == 0)
            uart_poll_stdin();
        if (progress && cycles % progress == 0) {
            fprintf(stderr, "[soc] cycle %llu: %llu instructions, pc=%llx, mtime=%llu mtimecmp=%llu, interrupts",
                    (unsigned long long)cycles, (unsigned long long)committed,
                    (unsigned long long)last_pc, (unsigned long long)clint_mtime,
                    (unsigned long long)clint_mtimecmp);
            for (int i = 0; i < 32; i++)
                if (interrupts[i])
                    fprintf(stderr, " %d:%llu", i, (unsigned long long)interrupts[i]);
            fprintf(stderr, ", exceptions");
            for (int i = 0; i < 32; i++)
                if (exceptions[i])
                    fprintf(stderr, " %d:%llu", i, (unsigned long long)exceptions[i]);
            fprintf(stderr, "\n");
        }
    }

#if VM_TRACE
    if (wave)
        wave->close();
#endif
    fprintf(stderr, "\n[soc] %s after %llu cycles, %llu instructions",
            mismatch ? "difftest mismatch" : finished ? "powered off" : "stopped",
            (unsigned long long)cycles, (unsigned long long)committed);
    if (diff.enabled)
        fprintf(stderr, " (%llu compared)", (unsigned long long)diff.commits);
    fprintf(stderr, "\n");
    return mismatch ? 1 : exit_code;
}

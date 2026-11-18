// Verilator SoC simulation with sustemu difftest
#include <verilated.h>
#include "Vnicore.h"
#include <cstdint>
#include <cstdio>
#include <cstdlib>
#include <cstring>
#include "difftest.h"

static Vnicore *top;
static vluint64_t sim_time = 0;

#define DRAM_BASE 0x80000000ull
#define DRAM_SIZE (128ull * 1024 * 1024)
#define UART_BASE 0x10000000ull

static uint8_t *dram;

static int in_dram(uint64_t a) { return a >= DRAM_BASE && a + 8 <= DRAM_BASE + DRAM_SIZE; }
static uint64_t rd64(uint64_t addr) {
    uint64_t v = 0;
    if (in_dram(addr)) memcpy(&v, dram + (addr - DRAM_BASE), 8);
    return v;
}

static uint8_t uart_regs[0x100];
static void uart_write(uint64_t addr, uint8_t v) {
    int off = addr & 0xff;
    switch (off) {
    case 0: if (!(uart_regs[3] & 0x80)) { fputc(v, stdout); fflush(stdout); } else uart_regs[0] = v; break;
    case 1: case 2: case 3: case 4: case 7: uart_regs[off] = v; break;
    }
}
static uint8_t uart_read(uint64_t addr) {
    switch (addr & 0xff) {
    case 0: return uart_regs[0];
    case 3: return uart_regs[3];
    case 5: return 0x60;
    default: return 0;
    }
}

struct AxiRd { bool busy=false; uint64_t addr=0; int beats=0, beat=0, wait=0; };
struct AxiWr { bool busy=false; uint64_t addr=0; int beats=0, beat=0, wait=0; };
static AxiRd ard;
static AxiWr awr;
static bool is_uart(uint64_t a) { return a >= UART_BASE && a < UART_BASE + 0x100; }

static void tick() {
    top->clock = 0; top->eval(); top->clock = 1; top->eval();
    sim_time++;
}

int main(int argc, char **argv) {
    Verilated::commandArgs(argc, argv);
    const char *img = argc > 1 ? argv[1] : "firmware.bin";
    vluint64_t max_cycles = argc > 2 ? strtoull(argv[2], nullptr, 0) : 20000000ull;

    dram = (uint8_t*)calloc(DRAM_SIZE, 1);
    FILE *f = fopen(img, "rb");
    if (!f) { fprintf(stderr, "cannot open %s\n", img); return 1; }
    size_t n = fread(dram, 1, DRAM_SIZE, f);
    fclose(f);
    fprintf(stderr, "[soc] loaded %zu bytes from %s\n", n, img);

    // Initialize difftest
    if (getenv("DIFFTEST")) {
        diff_setup(getenv("DIFFTEST"));
        if (diff_enabled) {
            diff_load_mem(0x80000000, dram, n);
            fprintf(stderr, "[diff] sustemu ready, memory synced\n");
        }
    }

    top = new Vnicore;
    top->reset = 1;
    top->io_master_arready = 0; top->io_master_rvalid = 0;
    top->io_master_awready = 0; top->io_master_bvalid = 0;
    top->io_interrupt = 0;
    tick(); tick(); tick();
    top->reset = 0;

    uint64_t committed = 0;
    uint32_t last_pc = 0;
    uint32_t last_commit = 0;
    while (sim_time < max_cycles && !Verilated::gotFinish()) {
        // read address
        top->io_master_arready = 1;
        if (top->io_master_arvalid && !ard.busy) {
            ard = {true, top->io_master_araddr, (int)(top->io_master_arlen + 1), 0,
                   is_uart(top->io_master_araddr) ? 1 : 2};
        }
        // read data
        if (ard.busy) {
            if (ard.wait > 0) { ard.wait--; top->io_master_rvalid = 0; }
            else {
                uint64_t a = ard.addr + (uint64_t)ard.beat * 8;
                uint64_t d;
                if (is_uart(a)) { d = 0; for (int b = 7; b >= 0; b--) d = (d << 8) | uart_read(a + b); }
                else d = rd64(a);
                top->io_master_rvalid = 1;
                top->io_master_rdata = d;
                top->io_master_rresp = 0;
                top->io_master_rid = top->io_master_arid;
                top->io_master_rlast = (ard.beat == ard.beats - 1);
                top->eval();
                if (top->io_master_rready) { ard.beat++; if (ard.beat >= ard.beats) ard.busy = false; }
            }
        } else { top->io_master_rvalid = 0; top->io_master_rlast = 0; }

        // write address
        top->io_master_awready = 1;
        if (top->io_master_awvalid && !awr.busy) {
            awr = {true, top->io_master_awaddr, (int)(top->io_master_awlen + 1), 0,
                   is_uart(top->io_master_awaddr) ? 1 : 2};
        }
        // write data
        top->io_master_wready = awr.busy && awr.wait == 0;
        if (awr.busy && top->io_master_wvalid && awr.wait == 0) {
            uint64_t a = awr.addr + (uint64_t)awr.beat * 8;
            if (is_uart(a)) {
                for (int b = 0; b < 8; b++)
                    if (top->io_master_wstrb & (1 << b)) uart_write(a + b, top->io_master_wdata >> (8 * b));
            } else if (in_dram(a)) {
                uint64_t old = rd64(a), nw = 0;
                for (int b = 0; b < 8; b++)
                    nw |= (uint64_t)(top->io_master_wstrb & (1 << b) ?
                        (uint8_t)(top->io_master_wdata >> (8 * b)) : (uint8_t)(old >> (8 * b))) << (8 * b);
                memcpy(dram + (a - DRAM_BASE), &nw, 8);
            }
            awr.beat++;
            if (awr.beat >= awr.beats) { awr.busy = false; top->io_master_bvalid = 1; }
        } else if (awr.busy && awr.wait > 0) awr.wait--;
        // write response
        if (top->io_master_bvalid && top->io_master_bready) top->io_master_bvalid = 0;

        // Commit detection: instruction in MW stage that's not NOP
        uint32_t inst = top->io_commit_inst;
        uint32_t pc = (uint32_t)top->io_pc_debug;
        if (inst != 0 && pc != last_pc) {
            last_pc = pc;
            committed++;
            // Difftest check at each commit
            if (diff_enabled && !diff_step(pc)) {
                fprintf(stderr, "[diff] MISMATCH - stopping\n");
                break;
            }
        }

        tick();
        if ((sim_time & 0xfffff) == 0)
            fprintf(stderr, "[soc] %llu cyc pc=%08x\r", (unsigned long long)sim_time, (uint32_t)top->io_pc_debug);
    }
    fprintf(stderr, "\n[soc] stopped: %llu cycles, pc=%08x, committed=%llu",
            (unsigned long long)sim_time, (uint32_t)top->io_pc_debug, (unsigned long long)committed);
    if (diff_enabled) fprintf(stderr, " (difftest %llu commits)", (unsigned long long)diff_count);
    fprintf(stderr, "\n");
    return 0;
}

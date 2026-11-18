// Verilator SoC simulation: DRAM + UART8250 for the NiCore RV64 core.
#include <verilated.h>
#include "Vysyx_22041812.h"
#include <cstdint>
#include <cstdio>
#include <cstdlib>
#include <cstring>
#include <vector>

static Vysyx_22041812 *top;
static vluint64_t sim_time = 0;

// ---------------- memory map ----------------
// 0x80000000 .. 0x87ffffff  DRAM (128 MB)
// 0x10000000 .. 0x100000ff  UART 8250
// 0x02000000 .. 0x0200ffff  CLINT (handled inside the core at 0x2000000)
#define DRAM_BASE 0x80000000ull
#define DRAM_SIZE (128ull * 1024 * 1024)
#define UART_BASE 0x10000000ull

static uint8_t *dram;

static int in_dram(uint64_t a) { return a >= DRAM_BASE && a + 8 <= DRAM_BASE + DRAM_SIZE; }

static uint64_t rd64(uint64_t addr) {
    uint64_t v = 0;
    if (!in_dram(addr)) {
        static int warned = 0;
        if (!warned) { fprintf(stderr, "[soc] read outside DRAM: %08llx\n", (unsigned long long)addr); warned = 1; }
        return 0;
    }
    memcpy(&v, dram + (addr - DRAM_BASE), 8);
    return v;
}

// ---------------- UART 8250 (output only) ----------------
static uint8_t uart_regs[0x100];
static void uart_write(uint64_t addr, uint8_t v) {
    int off = addr & 0xff;
    switch (off) {
    case 0: // THR (or DLL when DLAB=1)
        if (!(uart_regs[3] & 0x80)) { fputc(v, stdout); fflush(stdout); }
        else uart_regs[0] = v;
        break;
    case 1: case 2: case 3: case 4: case 7:
        uart_regs[off] = v; break;
    default: break;
    }
}
static uint8_t uart_read(uint64_t addr) {
    int off = addr & 0xff;
    switch (off) {
    case 0: return uart_regs[0];
    case 3: return uart_regs[3];
    case 5: return 0x60;  // LSR: THR empty, no data
    default: return 0;
    }
}

// ---------------- AXI slave with a little latency ----------------
struct AxiRd { bool busy=false; uint64_t addr=0; int beats=0, beat=0, wait=0; };
struct AxiWr { bool busy=false; uint64_t addr=0; int beats=0, beat=0, wait=0; uint64_t wdata=0; uint8_t wstrb=0; };
static AxiRd ard;
static AxiWr awr;

static bool is_uart(uint64_t a) { return a >= UART_BASE && a < UART_BASE + 0x100; }

static void tick() {
    top->clock = 0; top->eval(); top->clock = 1; top->eval();
    sim_time++;
}

#include "Vysyx_22041812___024root.h"
static void dump_pipe(Vysyx_22041812 *t) {
    fprintf(stderr, "   FD pc=%08llx inst=%08x | DE pc=%08llx inst=%08x en=%d | EM pc=%08llx inst=%08x en=%d | mode=%d\n",
        (unsigned long long)top->rootp->ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_pc,
        top->rootp->ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst,
        (unsigned long long)top->rootp->ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__de_pipe_reg_pc,
        top->rootp->ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__de_pipe_reg_inst,
        top->rootp->ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__de_pipe_reg_enable,
        (unsigned long long)top->rootp->ysyx_22041812__DOT__datapath__DOT__execute_stage__DOT__em_pipe_reg_pc,
        top->rootp->ysyx_22041812__DOT__datapath__DOT__execute_stage__DOT__em_pipe_reg_inst,
        top->rootp->ysyx_22041812__DOT__datapath__DOT__execute_stage__DOT__em_pipe_reg_enable,
        top->rootp->ysyx_22041812__DOT__datapath__DOT__csr__DOT__mode);
    fprintf(stderr, "   IC req addr=%08llx v=%d | resp data=%016llx ready=%d | sramA=%d cen=%d wen=%d wdata=%016llx%016llx Q=%016llx%016llx\n",
        (unsigned long long)top->rootp->ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__io_icache_cpu_request_addr,
        (int)top->rootp->ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__io_icache_cpu_request_valid,
        (unsigned long long)top->rootp->ysyx_22041812__DOT__icache__DOT__tmp_response_data,
        (int)top->rootp->ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__io_icache_cpu_response_ready,
        (int)top->rootp->ysyx_22041812__DOT__sram0_A,
        (int)top->rootp->ysyx_22041812__DOT__sram0_CEN,
        (int)top->rootp->ysyx_22041812__DOT__sram0_WEN,
        (unsigned long long)top->rootp->ysyx_22041812__DOT__sram0_D[3],
        (unsigned long long)(((uint64_t)top->rootp->ysyx_22041812__DOT__sram0_D[2] << 32) | top->rootp->ysyx_22041812__DOT__sram0_D[1]),
        (unsigned long long)top->rootp->ysyx_22041812__DOT__sram0_Q[3],
        (unsigned long long)(((uint64_t)top->rootp->ysyx_22041812__DOT__sram0_Q[2] << 32) | top->rootp->ysyx_22041812__DOT__sram0_Q[1]));
    for (int w = 0; w < 4; w++) {
        CData cen = top->rootp->ysyx_22041812__DOT__sram0_CEN + 0; // placeholder
    }
    fprintf(stderr, "   ICmem rvalid=%d rlast=%d rdata=%016llx | ",
        (int)top->rootp->ysyx_22041812__DOT__icache_io_mem_io_r_valid,
        (int)top->rootp->ysyx_22041812__DOT__icache_io_mem_io_r_bits_last,
        (unsigned long long)top->rootp->ysyx_22041812__DOT__icache_io_mem_io_r_bits_data);
    fprintf(stderr, "   sram CEN=%d%d%d%d WEN=%d%d%d%d A=%d%d%d%d D1hi=%016llx D3hi=%016llx Q3hi=%016llx\n",
        (int)top->rootp->ysyx_22041812__DOT__sram0_CEN, (int)top->rootp->ysyx_22041812__DOT__sram1_CEN,
        (int)top->rootp->ysyx_22041812__DOT__sram2_CEN, (int)top->rootp->ysyx_22041812__DOT__sram3_CEN,
        (int)top->rootp->ysyx_22041812__DOT__sram0_WEN, (int)top->rootp->ysyx_22041812__DOT__sram1_WEN,
        (int)top->rootp->ysyx_22041812__DOT__sram2_WEN, (int)top->rootp->ysyx_22041812__DOT__sram3_WEN,
        (int)top->rootp->ysyx_22041812__DOT__sram0_A, (int)top->rootp->ysyx_22041812__DOT__sram1_A,
        (int)top->rootp->ysyx_22041812__DOT__sram2_A, (int)top->rootp->ysyx_22041812__DOT__sram3_A,
        (unsigned long long)(((uint64_t)top->rootp->ysyx_22041812__DOT__sram1_D[3] << 32) | top->rootp->ysyx_22041812__DOT__sram1_D[2]),
        (unsigned long long)(((uint64_t)top->rootp->ysyx_22041812__DOT__sram3_D[3] << 32) | top->rootp->ysyx_22041812__DOT__sram3_D[2]),
        (unsigned long long)(((uint64_t)top->rootp->ysyx_22041812__DOT__sram3_Q[3] << 32) | top->rootp->ysyx_22041812__DOT__sram3_Q[2]));
    fprintf(stderr, "   STALL io=%d ics=%d dcs=%d mul=%d div=%d itlb=%d dtlb=%d icS=%d arbS=%d bv=%d br=%d awv=%d wv=%d dcS=%d | ",
        (int)t->io_stall,
        (int)top->rootp->ysyx_22041812__DOT__datapath__DOT__icache_stall,
        (int)top->rootp->ysyx_22041812__DOT__datapath__DOT__dcache_stall,
        (int)top->rootp->ysyx_22041812__DOT__datapath__DOT__execute_stage_io_mul_stall,
        (int)top->rootp->ysyx_22041812__DOT__datapath__DOT__execute_stage_io_div_stall,
        (int)top->rootp->ysyx_22041812__DOT__datapath__DOT__itlb_stall,
        (int)top->rootp->ysyx_22041812__DOT__datapath__DOT__dtlb_stall,
        (int)top->rootp->ysyx_22041812__DOT__icache__DOT__cache_state,
        (int)top->rootp->ysyx_22041812__DOT__arb__DOT__state,
        (int)t->io_master_bvalid, (int)t->io_master_bready,
        (int)t->io_master_awvalid, (int)t->io_master_wvalid,
        (int)top->rootp->ysyx_22041812__DOT__dcache__DOT__cache_state);
    fprintf(stderr, "   EXC cause=%016llx emPC=%08llx emInst=%08x hasExc=%d trap=%d | ",
        (unsigned long long)top->rootp->ysyx_22041812__DOT__datapath__DOT__csr__DOT__cause,
        (unsigned long long)top->rootp->ysyx_22041812__DOT__datapath__DOT__execute_stage__DOT__em_pipe_reg_pc,
        top->rootp->ysyx_22041812__DOT__datapath__DOT__execute_stage__DOT__em_pipe_reg_inst,
        (int)top->rootp->ysyx_22041812__DOT__datapath__DOT__csr__DOT__hasExc,
        (int)top->rootp->ysyx_22041812__DOT__datapath__DOT__csr__DOT__io_trap);
    fprintf(stderr, "   MW pc=%08llx inst=%08x en=%d\n",
        (unsigned long long)top->rootp->ysyx_22041812__DOT__datapath__DOT__memory_stage__DOT__mw_pipe_reg_pc,
        top->rootp->ysyx_22041812__DOT__datapath__DOT__memory_stage__DOT__mw_pipe_reg_inst,
        top->rootp->ysyx_22041812__DOT__datapath__DOT__memory_stage__DOT__mw_pipe_reg_enable);
}
static int mw_enable_flag = 0;
static int mw_enable() { return mw_enable_flag; }
static int t_unused_arb_state(Vysyx_22041812 *t) {
    return top->rootp->ysyx_22041812__DOT__arb__DOT__state;
}
static int t_unused_ic_state(Vysyx_22041812 *t) {
    return top->rootp->ysyx_22041812__DOT__icache__DOT__cache_state;
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

    top = new Vysyx_22041812;
    top->reset = 1;
    top->io_master_arready = 0;
    top->io_master_rvalid = 0;
    top->io_master_awready = 0;
    top->io_master_bvalid = 0;
    top->io_interrupt = 0;
    tick(); tick(); tick();
    top->reset = 0;

    uint64_t committed = 0;
    while (sim_time < max_cycles && !Verilated::gotFinish()) {
        // ---- read address channel ----
        top->io_master_arready = 1;
        if (top->io_master_arvalid && !ard.busy) {
            ard.busy = true;
            ard.addr = top->io_master_araddr;
            ard.beats = top->io_master_arlen + 1;
            ard.beat = 0;
            ard.wait = is_uart(ard.addr) ? 1 : 2;
        }
        // ---- read data channel ----
        if (ard.busy) {
            if (ard.wait > 0) { ard.wait--; top->io_master_rvalid = 0; }
            else {
                uint64_t a = ard.addr + (uint64_t)ard.beat * 8;
                uint64_t d;
                if (is_uart(a)) {
                    d = 0;
                    for (int b = 7; b >= 0; b--) d = (d << 8) | uart_read(a + b);
                } else {
                    d = rd64(a);
                }
                if (getenv("SOC_AXI_RD") && sim_time > 100000)
                    fprintf(stderr, "[rd] %08llx = %016llx\n", (unsigned long long)a, (unsigned long long)d);
                // check if data matches what's currently in dram (it should by definition)
                // the real question is whether dram content is still correct
                top->io_master_rvalid = 1;
                top->io_master_rdata = d;
                if (getenv("SOC_TRACE") && sim_time < 2000) {
                    top->eval();  // settle so rready below reflects this beat
                    fprintf(stderr, "[axi-r] beat=%d/%d data=%016llx last=%d rready=%d arbS=%d icS=%d\n",
                        (int)ard.beat, (int)ard.beats, (unsigned long long)d,
                        (int)top->io_master_rlast, (int)top->io_master_rready,
                        (int)t_unused_arb_state(top), (int)t_unused_ic_state(top));
                }
                top->io_master_rresp = 0;
                top->io_master_rid = top->io_master_arid;
                top->io_master_rlast = (ard.beat == ard.beats - 1);
                // settle and check the handshake: if rready is high now, this
                // beat is consumed at the coming clock edge
                top->eval();
                if (getenv("SOC_TRACE") && sim_time < 2000)
                    fprintf(stderr, "[beat-settle] beat=%d rlast=%d rready=%d arbS=%d icS=%d sramWEN=%d%d%d%d sramD1lo=%016llx\n",
                        (int)ard.beat, (int)top->io_master_rlast, (int)top->io_master_rready,
                        (int)top->rootp->ysyx_22041812__DOT__arb__DOT__state,
                        (int)top->rootp->ysyx_22041812__DOT__icache__DOT__cache_state,
                        (int)top->rootp->ysyx_22041812__DOT__icache_io_sram0_wen,
                        (int)top->rootp->ysyx_22041812__DOT__icache_io_sram1_wen,
                        (int)top->rootp->ysyx_22041812__DOT__icache_io_sram2_wen,
                        (int)top->rootp->ysyx_22041812__DOT__icache_io_sram3_wen,
                        (unsigned long long)((uint64_t)top->rootp->ysyx_22041812__DOT__icache_io_sram1_wdata[1] << 32 | top->rootp->ysyx_22041812__DOT__icache_io_sram1_wdata[0]));
                if (top->io_master_rready) {
                    ard.beat++;
                    // NOTE: do NOT deassert rvalid here: the coming clock edge
                    // must still see this beat; rvalid is cleared on the next
                    // iteration via the !busy branch
                    if (ard.beat >= ard.beats) ard.busy = false;
                }
            }
        } else {
            top->io_master_rvalid = 0;
            top->io_master_rlast = 0;   // do not leave a stale rlast around
        }

        // ---- write address channel ----
        top->io_master_awready = 1;
        if (top->io_master_awvalid && !awr.busy) {
            awr.busy = true;
            awr.addr = top->io_master_awaddr;
            awr.beats = top->io_master_awlen + 1;
            awr.beat = 0;
            awr.wait = is_uart(awr.addr) ? 1 : 2;
        }
        // ---- write data channel ----
        // only accept write beats after the latency expires, otherwise the
        // DUT-side handshake consumes beats my model has not counted yet
        top->io_master_wready = awr.busy && awr.wait == 0;
        // consume the handshake settled in the previous cycle
        if (awr.busy && awr.wait == 0 && top->io_master_wvalid && top->io_master_wready) {
            uint64_t a = awr.addr + (uint64_t)awr.beat * 8;
            if (is_uart(a)) {
                for (int b = 0; b < 8; b++)
                    if (top->io_master_wstrb & (1 << b)) uart_write(a + b, top->io_master_wdata >> (8 * b));
            } else if (in_dram(a)) {
                if (getenv("SOC_WR")) fprintf(stderr, "[wr] %08llx = %016llx (beat %d/%d)\n",
                    (unsigned long long)a, (unsigned long long)top->io_master_wdata, (int)awr.beat, (int)awr.beats);
                uint64_t old = rd64(a);
                uint64_t nw = 0;
                for (int b = 0; b < 8; b++)
                    nw |= (uint64_t)(top->io_master_wstrb & (1 << b) ? (uint8_t)(top->io_master_wdata >> (8 * b)) : (uint8_t)(old >> (8 * b))) << (8 * b);
                memcpy(dram + (a - DRAM_BASE), &nw, 8);
            } else {
                fprintf(stderr, "[soc] write outside DRAM ignored: %08llx\n", (unsigned long long)a);
            }
            awr.beat++;
            if (awr.beat >= awr.beats) { awr.busy = false; top->io_master_bvalid = 1;
                if (getenv("SOC_TRACE")) fprintf(stderr, "[b] burst done, bvalid=1\n"); }
        } else if (awr.busy && awr.wait > 0) awr.wait--;
        // ---- write response ----
        // like the read path: the clock edge must see bvalid&&bready together,
        // so only deassert bvalid one iteration after the handshake settles
        static int b_clear_pending = 0;
        if (b_clear_pending) { top->io_master_bvalid = 0; b_clear_pending = 0;
            if (getenv("SOC_TRACE")) fprintf(stderr, "[b] cleared\n"); }
        if (top->io_master_bvalid && top->io_master_bready) { b_clear_pending = 1;
            if (getenv("SOC_TRACE")) fprintf(stderr, "[b] handshake seen, pending clear\n"); }

        // settle combinational logic so internal signal dumps see this cycle's values
        top->eval();

        if (getenv("SOC_TRACE")) {
            static int axi_n = 0;
            if (top->io_master_arvalid && top->io_master_arready && axi_n < 40) {
                fprintf(stderr, "[axi %d] AR addr=%08llx len=%d\n", axi_n++, (unsigned long long)top->io_master_araddr, (int)top->io_master_arlen);
            }
            if (top->io_master_awvalid && top->io_master_awready && axi_n < 40) {
                fprintf(stderr, "[axi %d] AW addr=%08llx len=%d\n", axi_n++, (unsigned long long)top->io_master_awaddr, (int)top->io_master_awlen);
            }
        }
        if (getenv("SOC_TRACE") && sim_time < 2000) {
            fprintf(stderr, "[cyc %llu] arv=%d arr=%d rv=%d wv=%d stall=%d pc=%08llx arbS=%d icS=%d dcS=%d iarv=%d darv=%d\n",
                (unsigned long long)sim_time,
                (int)top->io_master_arvalid, (int)top->io_master_arready,
                (int)top->io_master_rvalid, (int)top->io_master_wvalid,
                (int)top->io_stall,
                (unsigned long long)top->io_pc_debug,
                (int)top->rootp->ysyx_22041812__DOT__arb__DOT__state,
                (int)top->rootp->ysyx_22041812__DOT__icache__DOT__cache_state,
                (int)top->rootp->ysyx_22041812__DOT__dcache__DOT__cache_state,
                (int)top->rootp->ysyx_22041812__DOT__icache__DOT__io_mem_io_ar_valid,
                (int)top->rootp->ysyx_22041812__DOT__dcache__DOT__io_mem_io_ar_valid);
            dump_pipe(top);
        }
        tick();
        mw_enable_flag = (int)top->rootp->ysyx_22041812__DOT__datapath__DOT__memory_stage__DOT__mw_pipe_reg_enable;
        static uint32_t last_pc = 0xffffffff;
        if (getenv("SOC_TRACE")) {
            if (top->io_pc_debug != last_pc && committed < 40) {
                fprintf(stderr, "[commit] pc=%08llx inst=%08x\n", (unsigned long long)top->io_pc_debug, top->io_commit_inst);
                last_pc = top->io_pc_debug;
            }
        }
        if (getenv("SOC_GPR") && sim_time > 2000000 && (sim_time & 0xfffff) == 0) {
            fprintf(stderr, "[gpr] s6=%016llx s7=%016llx a4=%016llx a5=%016llx\n",
                (unsigned long long)top->rootp->ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__regFile__DOT__reg_22,
                (unsigned long long)top->rootp->ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__regFile__DOT__reg_23,
                (unsigned long long)top->rootp->ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__regFile__DOT__reg_14,
                (unsigned long long)top->rootp->ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__regFile__DOT__reg_15);
        }
        if (getenv("SOC_DC") && top->rootp->ysyx_22041812__DOT__dcache__DOT__cache_state == 12) {
            fprintf(stderr, "[dc-resp] addr=%08x data=%016llx\n",
                (uint32_t)top->rootp->ysyx_22041812__DOT__dcache__DOT__cpu_request_addr_reg,
                (unsigned long long)top->rootp->ysyx_22041812__DOT__dcache__DOT__tmp_response_data);
        }
        // dump regfile state when the LOAD is in FD (about to enter DE)
        static int fdld_count = 0;
        if (getenv("SOC_FDLD") && fdld_count < 5 &&
            (uint32_t)top->rootp->ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_pc == 0x80003928) {
            fdld_count++;
            fprintf(stderr, "[fdld %d] fd_pc=%08x fd_inst=%08x wire_inst=%08x ds_inst=%08x ds_raddr=%d raddrRF=%d rdata0=%016llx reg10=%016llx wen=%d waddr=%d wdata=%016llx stall=%d\n",
                fdld_count,
                (uint32_t)top->rootp->ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_pc,
                (uint32_t)top->rootp->ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst,
                (uint32_t)top->rootp->ysyx_22041812__DOT__datapath__DOT__decode_stage_io_fd_pipe_reg_inst,
                (uint32_t)((top->rootp->ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__io_fd_pipe_reg_inst >> 15) & 0x1F),
                (int)top->rootp->ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__regFile_io_raddr_0,
                (int)top->rootp->ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__regFile__DOT__io_raddr_0,
                (unsigned long long)top->rootp->ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__regFile__DOT__io_rdata_0,
                (unsigned long long)top->rootp->ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__regFile__DOT__reg_10,
                (int)top->rootp->ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__io_regFile_wen,
                (int)top->rootp->ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__io_regFile_waddr,
                (unsigned long long)top->rootp->ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__io_regFile_wdata,
                (int)top->io_stall);
        }
        // watch ALL register file writes around the critical window
        if (getenv("SOC_RF") && sim_time > 1200 && sim_time < 1400 &&
            top->rootp->ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__io_regFile_wen) {
            fprintf(stderr, "[rf-wr] cyc=%llu x%d <= %016llx (pc=%08x)\n",
                (unsigned long long)sim_time,
                (int)top->rootp->ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__io_regFile_waddr,
                (unsigned long long)top->rootp->ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__io_regFile_wdata,
                (uint32_t)top->rootp->ysyx_22041812__DOT__datapath__DOT__memory_stage__DOT__mw_pipe_reg_pc);
        }
        // dump a0/src1 when the LOAD (0x80003928) is in EX (de_pipe_reg)
        static int load_count = 0;
        if (getenv("SOC_LD") && load_count < 5 &&
            (uint32_t)top->rootp->ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__de_pipe_reg_pc == 0x80003928) {
            load_count++;
            fprintf(stderr, "[ld %d] de_pc=%08x de_rs1=%016llx src1=%016llx src2=%016llx alu=%016llx | regfile a0=%016llx wire_inst=%08x ds_inst=%08x ds_raddr=%d raddrRF=%d rdata0=%016llx | EM dest=%d alu_out=%016llx | MW dest=%d wb_data=%016llx wen=%d\n",
                load_count,
                (uint32_t)top->rootp->ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__de_pipe_reg_pc,
                (unsigned long long)top->rootp->ysyx_22041812__DOT__datapath__DOT__decode_stage_io_de_pipe_reg_rs1,
                (unsigned long long)top->rootp->ysyx_22041812__DOT__datapath__DOT__execute_stage__DOT__src1_data,
                (unsigned long long)top->rootp->ysyx_22041812__DOT__datapath__DOT__execute_stage__DOT__src2_data,
                (unsigned long long)top->rootp->ysyx_22041812__DOT__datapath__DOT__execute_stage_io_alu_out,
                (unsigned long long)top->rootp->ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__regFile__DOT__reg_10,
                (int)top->rootp->ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__regFile__DOT__io_raddr_0,
                (unsigned long long)top->rootp->ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__regFile__DOT__io_rdata_0,
                (int)top->rootp->ysyx_22041812__DOT__datapath__DOT__execute_stage__DOT__em_pipe_reg_dest,
                (unsigned long long)top->rootp->ysyx_22041812__DOT__datapath__DOT__execute_stage__DOT__em_pipe_reg_alu_out,
                (int)top->rootp->ysyx_22041812__DOT__datapath__DOT__memory_stage__DOT__mw_pipe_reg_dest,
                (unsigned long long)top->rootp->ysyx_22041812__DOT__datapath__DOT__memory_stage__DOT__mw_pipe_reg_alu_out,
                (int)top->rootp->ysyx_22041812__DOT__datapath__DOT__writeback_stage__DOT__io_regFile_wen);
        }
        // dump forwarded src1 at beqz time (when branch is in EX, not committed yet)
        static int fwd_count = 0;
        if (getenv("SOC_FWD") && fwd_count < 100 &&
            (uint32_t)top->rootp->ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__de_pipe_reg_pc == 0x8000392c) {
            fwd_count++;
            fprintf(stderr, "[fwd %d cyc=%llu] EX-stage: de_pc=%08x src1=%016llx brTaken=%d | EM: pc=%08x dest=%d wb_sel=%d | MW: dest=%d wb_sel=%d load_data=%016llx dc_resp=%016llx dc_tag=%d stall=%d de_en=%d dc_req_addr=%08x em_alu=%016llx\n",
                fwd_count, (unsigned long long)sim_time,
                (uint32_t)top->rootp->ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__de_pipe_reg_pc,
                (unsigned long long)top->rootp->ysyx_22041812__DOT__datapath__DOT__decode_stage_io_de_pipe_reg_rs1,
                (unsigned long long)top->rootp->ysyx_22041812__DOT__datapath__DOT__execute_stage__DOT__src1_data,
                (int)top->rootp->ysyx_22041812__DOT__datapath__DOT__execute_stage__DOT__io_brCond_taken,
                (uint32_t)top->rootp->ysyx_22041812__DOT__datapath__DOT__execute_stage__DOT__em_pipe_reg_pc,
                (int)top->rootp->ysyx_22041812__DOT__datapath__DOT__execute_stage__DOT__em_pipe_reg_dest,
                (int)top->rootp->ysyx_22041812__DOT__datapath__DOT__execute_stage__DOT__em_pipe_reg_wb_sel,
                (int)top->rootp->ysyx_22041812__DOT__datapath__DOT__memory_stage__DOT__mw_pipe_reg_dest,
                (int)top->rootp->ysyx_22041812__DOT__datapath__DOT__memory_stage__DOT__mw_pipe_reg_wb_sel,
                (unsigned long long)top->rootp->ysyx_22041812__DOT__datapath__DOT__memory_stage__DOT__mw_pipe_reg_load_data,
                (unsigned long long)top->rootp->ysyx_22041812__DOT__datapath__DOT__memory_stage__DOT__data_cache_response_data,
                (int)top->rootp->ysyx_22041812__DOT__datapath__DOT__memory_stage__DOT__data_cache_tag,
                (int)top->io_stall,
                (int)top->rootp->ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__de_pipe_reg_enable,
                (uint32_t)top->rootp->ysyx_22041812__DOT__datapath__DOT__memory_stage__DOT__io_dcache_cpu_request_addr,
                (unsigned long long)top->rootp->ysyx_22041812__DOT__datapath__DOT__memory_stage_io_em_pipe_reg_alu_out);
        }
        // dump a5 at the beqz in sbi_strlen
        static int beqz_count = 0;
        if (getenv("SOC_A5") && mw_enable() &&
            (uint32_t)top->io_pc_debug == 0x8000392c && beqz_count < 3) {
            beqz_count++;
            fprintf(stderr, "[beqz %d] a5(x15)=%016llx a0(x10)=%016llx\n",
                beqz_count,
                (unsigned long long)top->rootp->ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__regFile__DOT__reg_15,
                (unsigned long long)top->rootp->ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__regFile__DOT__reg_10);
        }
        // dump a0 when sbi_strlen is entered (first few times)
        static int strlen_count = 0;
        if (getenv("SOC_A0") && mw_enable() &&
            (uint32_t)top->io_pc_debug == 0x8000391c && strlen_count < 5) {
            strlen_count++;
            fprintf(stderr, "[strlen %d] a0(x10)=%016llx a1(x11)=%016llx\n",
                strlen_count,
                (unsigned long long)top->rootp->ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__regFile__DOT__reg_10,
                (unsigned long long)top->rootp->ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__regFile__DOT__reg_11);
        }
        if (top->io_commit_inst != 0 && mw_enable()) {
            committed++;
            if (getenv("SOC_DIFF"))
                fprintf(stderr, "%08x\n", (uint32_t)top->io_pc_debug);
        }
        if ((sim_time & 0xfffff) == 0) {
            fprintf(stderr, "[soc] %llu cycles, pc=%08llx\r", (unsigned long long)sim_time,
                    (unsigned long long)top->io_pc_debug);
        }
    }
    // dump FDT magic check
    {
        uint64_t fdt_addr = 0x80024000;
        if (in_dram(fdt_addr)) {
            uint64_t v = rd64(fdt_addr);
            fprintf(stderr, "[fdt] @%08llx: %016llx (magic should be 00000000d00dfeed)\n",
                (unsigned long long)fdt_addr, (unsigned long long)v);
            v = rd64(fdt_addr + 0x100);
            fprintf(stderr, "[fdt] @%08llx: %016llx\n", (unsigned long long)(fdt_addr+0x100), (unsigned long long)v);
        }
    }
    // verify FDT region wasn't corrupted during execution
    {
        uint64_t fdt = 0x80024000;
        uint64_t orig_magic = 0xd00dfeedULL;
        uint32_t cur = (uint32_t)(rd64(fdt) & 0xffffffffULL);
        fprintf(stderr, "[fdt-check] magic now: %08x (expected %08x) %s\n",
            cur, (uint32_t)orig_magic, cur == (uint32_t)orig_magic ? "OK" : "CORRUPTED");
        // check string region
        for (uint64_t a = fdt + 0x80; a < fdt + 0x100; a += 8) {
            uint64_t v = rd64(a);
            if (v != 0) fprintf(stderr, "[fdt-check] %08llx = %016llx\n", (unsigned long long)a, (unsigned long long)v);
        }
    }
    // check specific addresses
    fprintf(stderr, "[mem] 0x800401f8 = %016llx (orig: 0000200000000080)\n",
        (unsigned long long)rd64(0x800401f8));
    fprintf(stderr, "[mem] 0x80024418 = %016llx (orig: 0000000000000000)\n",
        (unsigned long long)rd64(0x80024418));
    fprintf(stderr, "\n[soc] stopped at %llu cycles, pc=%08llx, committed=%llu CPI=%.2f\n",
            (unsigned long long)sim_time, (unsigned long long)top->io_pc_debug,
            (unsigned long long)committed,
            committed > 0 ? (double)sim_time / (double)committed : 0.0);
    return 0;
}

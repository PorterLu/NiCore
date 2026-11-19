// Commit-time differential testing against SUSTemu (third_party/sustemu).
//
// The testbench reports every trap the core takes and every instruction it
// retires. For each retired instruction the reference executes until it has
// retired one as well, taking exceptions on its own; then the pc and all
// registers must agree. Interrupts are the only events the reference is told
// about, and it checks that the one the core took was pending and enabled.
//
// Stores are checked where they happen, since a wrong one may not show in a
// register for a long time: every store the core hands to its data cache must
// be the one the reference makes, and whatever the data cache later writes to
// the RAM must be what the core stored there.
#ifndef DIFFTEST_H
#define DIFFTEST_H
#include <cstdint>
#include <cstdio>
#include <cstdlib>
#include <cstring>
#include <deque>
#include <dlfcn.h>

struct Difftest {
    struct Regs { uint64_t gpr[32]; uint64_t pc; };
    struct Trap { uint64_t cause, epc, tval, hw_pending; };
    struct Commit { uint64_t pc; uint32_t inst; bool wb_en; unsigned wb_addr; uint64_t wb_data; };
    struct Store { uint64_t addr, data; uint8_t mask; };

    bool enabled = false;
    uint64_t commits = 0;

    bool load(const char *library, uint64_t base, uint64_t ram_bytes, void *image, size_t size) {
        void *handle = dlopen(library, RTLD_LAZY);
        if (!handle) {
            fprintf(stderr, "[diff] %s\n", dlerror());
            return false;
        }
        ref_init = (void (*)(int))dlsym(handle, "difftest_init");
        ref_memcpy = (void (*)(uint64_t, void *, size_t, int))dlsym(handle, "difftest_memcpy");
        ref_regcpy = (void (*)(void *, int))dlsym(handle, "difftest_regcpy");
        ref_step = (int (*)(uint64_t, uint64_t *))dlsym(handle, "difftest_step");
        ref_get_trap = (int (*)(int, void *))dlsym(handle, "difftest_get_trap");
        ref_raise_intr = (int (*)(uint64_t, uint64_t))dlsym(handle, "difftest_raise_intr");
        ref_get_csr = (uint64_t (*)(uint32_t))dlsym(handle, "difftest_get_csr");
        ref_get_priv = (uint64_t (*)(void))dlsym(handle, "difftest_get_priv");
        ref_get_step = (void (*)(void *))dlsym(handle, "difftest_get_step");
        if (!ref_init || !ref_memcpy || !ref_regcpy || !ref_step || !ref_get_trap ||
            !ref_raise_intr || !ref_get_csr || !ref_get_priv || !ref_get_step) {
            fprintf(stderr, "[diff] %s does not export the difftest interface\n", library);
            return false;
        }
        ref_init(0);
        ref_memcpy(base, image, size, 1);
        ram_base = base;
        ram_size = ram_bytes;
        stored = static_cast<uint8_t *>(calloc(ram_size, 1));
        memcpy(stored, image, size);
        enabled = true;
        return true;
    }

    // The core handed a store to its data cache: the 8-byte lane at addr and
    // the mask of the bytes written.
    void store(uint64_t addr, uint64_t data, uint8_t mask) {
        if (!enabled)
            return;
        stores.push_back({addr, data, mask});
        const uint64_t lane = addr & ~7ull;
        if (lane >= ram_base && lane - ram_base <= ram_size - 8)
            for (int i = 0; i < 8; i++)
                if (mask & (1 << i))
                    stored[lane - ram_base + i] = data >> (8 * i);
    }

    // The data cache wrote bytes of a lane back to the RAM. Returns false
    // when they are not the bytes the core stored there.
    bool writeback(uint64_t lane, uint64_t data, uint8_t strobe) {
        if (!enabled || lane < ram_base || lane - ram_base > ram_size - 8)
            return true;
        for (int i = 0; i < 8; i++) {
            const uint8_t byte = data >> (8 * i);
            if ((strobe & (1 << i)) && byte != stored[lane - ram_base + i]) {
                uint64_t expected;
                memcpy(&expected, stored + lane - ram_base, 8);
                fprintf(stderr, "\n[diff] data cache wrote %016llx (strobe %02x) to %llx, "
                                "the core stored %016llx there\n",
                        (unsigned long long)data, strobe, (unsigned long long)lane,
                        (unsigned long long)expected);
                return false;
            }
        }
        return true;
    }

    // The core took a trap. hw_pending holds the pending bits wired to
    // devices (MSIP, MTIP, MEIP) at that moment.
    void trap(uint64_t cause, uint64_t epc, uint64_t tval, uint64_t hw_pending) {
        if (enabled)
            traps.push_back({cause, epc, tval, hw_pending});
    }

    // After FENCE.I the RAM itself must hold everything the core stored: the
    // instruction cache is refilled from there.
    bool flushed(const uint8_t *ram) {
        if (!enabled || !memcmp(ram, stored, ram_size))
            return true;
        for (uint64_t offset = 0; offset < ram_size; offset += 8) {
            if (memcmp(ram + offset, stored + offset, 8)) {
                uint64_t have, expected;
                memcpy(&have, ram + offset, 8);
                memcpy(&expected, stored + offset, 8);
                fprintf(stderr, "\n[diff] after FENCE.I the RAM holds %016llx at %llx, "
                                "the core stored %016llx\n",
                        (unsigned long long)have, (unsigned long long)(ram_base + offset),
                        (unsigned long long)expected);
                break;
            }
        }
        return false;
    }

    // The core retired an instruction. Returns false on a mismatch.
    bool commit(const Commit &c) {
        if (!enabled)
            return true;
        history[commits % HISTORY] = c;
        if (c.wb_en && c.wb_addr)
            dut_gpr[c.wb_addr] = c.wb_data;

        Regs ref;
        ref_regcpy(&ref, 0);
        // An interrupt is taken between two instructions: the reference has
        // reached the interrupted pc once everything older has retired.
        if (!traps.empty() && is_interrupt(traps.front()) && ref.pc == traps.front().epc) {
            const Trap t = traps.front();
            traps.pop_front();
            const int status = ref_raise_intr(t.cause & 0x3f, t.hw_pending);
            if (status) {
                fprintf(stderr, "\n[diff] interrupt %llu taken at %llx is %s in the reference\n",
                        (unsigned long long)(t.cause & 0x3f), (unsigned long long)t.epc,
                        status == 1 ? "not pending and enabled" : "not the one with priority");
                return fail(c);
            }
        }

        uint64_t retired_pc = 0;
        const int taken = ref_step(c.wb_en ? c.wb_data : 0, &retired_pc);
        if (taken < 0) {
            fprintf(stderr, "\n[diff] the reference only takes exceptions, last at %llx\n",
                    (unsigned long long)retired_pc);
            return fail(c);
        }
        for (int i = 0; i < taken; i++) {
            struct { uint64_t cause, epc, tval; } r;
            ref_get_trap(i, &r);
            if (traps.empty() || is_interrupt(traps.front())) {
                fprintf(stderr, "\n[diff] reference took exception %llu at %llx (tval %llx), the core did not\n",
                        (unsigned long long)r.cause, (unsigned long long)r.epc,
                        (unsigned long long)r.tval);
                return fail(c);
            }
            const Trap t = traps.front();
            traps.pop_front();
            if (t.cause != r.cause || t.epc != r.epc || t.tval != r.tval) {
                fprintf(stderr, "\n[diff] exception differs: core cause=%llu epc=%llx tval=%llx, "
                                "reference cause=%llu epc=%llx tval=%llx\n",
                        (unsigned long long)t.cause, (unsigned long long)t.epc,
                        (unsigned long long)t.tval, (unsigned long long)r.cause,
                        (unsigned long long)r.epc, (unsigned long long)r.tval);
                return fail(c);
            }
        }
        if (!traps.empty() && !is_interrupt(traps.front())) {
            const Trap &t = traps.front();
            fprintf(stderr, "\n[diff] core took exception %llu at %llx (tval %llx), the reference did not\n",
                    (unsigned long long)t.cause, (unsigned long long)t.epc,
                    (unsigned long long)t.tval);
            return fail(c);
        }

        if (retired_pc != c.pc) {
            fprintf(stderr, "\n[diff] pc differs: core %llx, reference %llx\n",
                    (unsigned long long)c.pc, (unsigned long long)retired_pc);
            return fail(c);
        }
        struct { uint64_t inst, store_width, store_addr, store_data; } step;
        ref_get_step(&step);
        if ((uint32_t)step.inst != c.inst) {
            fprintf(stderr, "\n[diff] instruction differs: core %08x, reference %08x\n",
                    c.inst, (uint32_t)step.inst);
            return fail(c);
        }
        if (step.store_width) {
            // the reference stored: the oldest store of the core is this one
            const uint64_t lane = step.store_addr & ~7ull;
            const unsigned shift = step.store_addr & 7;
            const uint64_t ref_data = step.store_data << (8 * shift);
            const uint8_t ref_mask = ((1u << step.store_width) - 1) << shift;
            uint64_t bits = 0;
            for (int i = 0; i < 8; i++)
                if (ref_mask & (1 << i))
                    bits |= 0xffull << (8 * i);
            if (stores.empty() || (stores.front().addr & ~7ull) != lane ||
                stores.front().mask != ref_mask ||
                ((stores.front().data ^ ref_data) & bits)) {
                fprintf(stderr, "\n[diff] store differs: reference addr=%llx data=%016llx mask=%02x",
                        (unsigned long long)lane, (unsigned long long)(ref_data & bits), ref_mask);
                if (stores.empty())
                    fprintf(stderr, ", the core stored nothing\n");
                else
                    fprintf(stderr, ", core addr=%llx data=%016llx mask=%02x\n",
                            (unsigned long long)stores.front().addr,
                            (unsigned long long)stores.front().data, stores.front().mask);
                return fail(c);
            }
            stores.pop_front();
        }
        // stores of the two instructions behind this one may already be queued
        if (stores.size() > 2) {
            fprintf(stderr, "\n[diff] the core stored to %llx (data %016llx, mask %02x), "
                            "the reference did not\n",
                    (unsigned long long)stores.front().addr,
                    (unsigned long long)stores.front().data, stores.front().mask);
            return fail(c);
        }
        ref_regcpy(&ref, 0);
        for (int i = 1; i < 32; i++) {
            if (dut_gpr[i] != ref.gpr[i]) {
                fprintf(stderr, "\n[diff] x%d differs: core %llx, reference %llx\n", i,
                        (unsigned long long)dut_gpr[i], (unsigned long long)ref.gpr[i]);
                return fail(c);
            }
        }
        commits++;
        return true;
    }

private:
    static const unsigned HISTORY = 24;
    void (*ref_init)(int) = nullptr;
    void (*ref_memcpy)(uint64_t, void *, size_t, int) = nullptr;
    void (*ref_regcpy)(void *, int) = nullptr;
    int (*ref_step)(uint64_t, uint64_t *) = nullptr;
    int (*ref_get_trap)(int, void *) = nullptr;
    int (*ref_raise_intr)(uint64_t, uint64_t) = nullptr;
    uint64_t (*ref_get_csr)(uint32_t) = nullptr;
    uint64_t (*ref_get_priv)(void) = nullptr;
    void (*ref_get_step)(void *) = nullptr;
    std::deque<Trap> traps;
    std::deque<Store> stores;
    uint64_t ram_base = 0, ram_size = 0;
    uint8_t *stored = nullptr;   // the RAM as the core has stored to it
    uint64_t dut_gpr[32] = {};
    Commit history[HISTORY] = {};

    static bool is_interrupt(const Trap &t) { return (t.cause >> 63) != 0; }

    bool fail(const Commit &c) {
        fprintf(stderr, "[diff] at commit %llu: pc=%llx inst=%08x\n",
                (unsigned long long)commits, (unsigned long long)c.pc, c.inst);
        const uint64_t first = commits >= HISTORY - 1 ? commits - (HISTORY - 1) : 0;
        for (uint64_t n = first; n <= commits; n++) {
            const Commit &h = history[n % HISTORY];
            fprintf(stderr, "[diff]   %llu: pc=%llx inst=%08x", (unsigned long long)n,
                    (unsigned long long)h.pc, h.inst);
            if (h.wb_en)
                fprintf(stderr, " x%u=%llx", h.wb_addr, (unsigned long long)h.wb_data);
            fprintf(stderr, "\n");
        }
        static const struct { const char *name; uint32_t no; } csrs[] = {
            {"mstatus", 0x300}, {"mepc", 0x341}, {"mcause", 0x342}, {"mtval", 0x343},
            {"sepc", 0x141}, {"scause", 0x142}, {"stval", 0x143}, {"satp", 0x180},
            {"mtvec", 0x305}, {"stvec", 0x105}, {"mie", 0x304}, {"mip", 0x344},
            {"mideleg", 0x303}, {"medeleg", 0x302},
        };
        fprintf(stderr, "[diff] reference: priv=%llu", (unsigned long long)ref_get_priv());
        for (const auto &r : csrs)
            fprintf(stderr, " %s=%llx", r.name, (unsigned long long)ref_get_csr(r.no));
        fprintf(stderr, "\n");
        for (const Trap &t : traps)
            fprintf(stderr, "[diff] core trap not yet matched: cause=%llx epc=%llx tval=%llx\n",
                    (unsigned long long)t.cause, (unsigned long long)t.epc,
                    (unsigned long long)t.tval);
        return false;
    }
};

#endif

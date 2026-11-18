#ifndef DIFFTEST_H
#define DIFFTEST_H
#include <stdint.h>
#include <stdio.h>
#include <dlfcn.h>
#include <string.h>

struct DiffRegs { uint64_t gpr[32]; uint64_t pc; };

static void *diff_handle = NULL;
static void (*diff_init)(int) = NULL;
static void (*diff_exec)(uint64_t) = NULL;
static void (*diff_regcpy)(void*, int) = NULL;
static void (*diff_memcpy)(uint64_t, void*, size_t, int) = NULL;
static DiffRegs diff_ref_regs;
static uint64_t diff_dut_gpr[32];
static bool diff_enabled = false;
static uint64_t diff_count = 0;

static void diff_setup(const char *so) {
    diff_handle = dlopen(so, RTLD_LAZY);
    if (!diff_handle) { fprintf(stderr, "[diff] %s\n", dlerror()); return; }
    diff_init = (void(*)(int))dlsym(diff_handle, "difftest_init");
    diff_exec = (void(*)(uint64_t))dlsym(diff_handle, "difftest_exec");
    diff_regcpy = (void(*)(void*,int))dlsym(diff_handle, "difftest_regcpy");
    diff_memcpy = (void(*)(uint64_t,void*,size_t,int))dlsym(diff_handle, "difftest_memcpy");
    if (!diff_init || !diff_exec || !diff_regcpy || !diff_memcpy) { fprintf(stderr, "[diff] symbols\n"); return; }
    diff_init(0);
    diff_enabled = true;
}

static void diff_load_mem(uint64_t addr, void *buf, size_t n) {
    if (diff_enabled) diff_memcpy(addr, buf, n, 1);
}

static bool diff_step(uint64_t dut_pc) {
    if (!diff_enabled) return true;
    // Get reference PC before executing (should match DUT's committed PC)
    diff_regcpy(&diff_ref_regs, 0);
    if (diff_ref_regs.pc != dut_pc) {
        fprintf(stderr, "\n[DIFF] PC #%llu: dut=%llx ref=%llx\n",
            (unsigned long long)diff_count, (unsigned long long)dut_pc, (unsigned long long)diff_ref_regs.pc);
        return false;
    }
    diff_exec(1); // execute the instruction
    diff_count++;
    return true;
}

static bool diff_step_full(uint64_t dut_pc, uint64_t *dut_gpr) {
    if (!diff_enabled) return true;
    diff_exec(1);
    diff_regcpy(&diff_ref_regs, 0);
    if (diff_ref_regs.pc != dut_pc) {
        fprintf(stderr, "\n[DIFF] PC #%llu: dut=%llx ref=%llx\n",
            (unsigned long long)diff_count, (unsigned long long)dut_pc, (unsigned long long)diff_ref_regs.pc);
        return false;
    }
    for (int i = 1; i < 32; i++) {
        if (dut_gpr[i] != diff_ref_regs.gpr[i]) {
            fprintf(stderr, "\n[DIFF] x%d #%llu pc=%llx: dut=%llx ref=%llx\n",
                i, (unsigned long long)diff_count, (unsigned long long)dut_pc,
                (unsigned long long)dut_gpr[i], (unsigned long long)diff_ref_regs.gpr[i]);
            return false;
        }
    }
    diff_count++;
    return true;
}

#endif

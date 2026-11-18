// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Symbol table internal header
//
// Internal details; most calling programs do not need this header,
// unless using verilator public meta comments.

#ifndef VERILATED_VNICORE__SYMS_H_
#define VERILATED_VNICORE__SYMS_H_  // guard

#include "verilated.h"

// INCLUDE MODEL CLASS

#include "Vnicore.h"

// INCLUDE MODULE CLASSES
#include "Vnicore___024root.h"
#include "Vnicore_nicore_tag_cache.h"

// SYMS CLASS (contains all model state)
class alignas(VL_CACHE_LINE_BYTES) Vnicore__Syms final : public VerilatedSyms {
  public:
    // INTERNAL STATE
    Vnicore* const __Vm_modelp;
    VlDeleter __Vm_deleter;
    bool __Vm_didInit = false;

    // MODULE INSTANCE STATE
    Vnicore___024root              TOP;
    Vnicore_nicore_tag_cache       TOP__nicore__DOT__dcache__DOT__tag_mem_0;
    Vnicore_nicore_tag_cache       TOP__nicore__DOT__dcache__DOT__tag_mem_1;
    Vnicore_nicore_tag_cache       TOP__nicore__DOT__dcache__DOT__tag_mem_2;
    Vnicore_nicore_tag_cache       TOP__nicore__DOT__dcache__DOT__tag_mem_3;
    Vnicore_nicore_tag_cache       TOP__nicore__DOT__icache__DOT__tag_mem_0;
    Vnicore_nicore_tag_cache       TOP__nicore__DOT__icache__DOT__tag_mem_1;
    Vnicore_nicore_tag_cache       TOP__nicore__DOT__icache__DOT__tag_mem_2;
    Vnicore_nicore_tag_cache       TOP__nicore__DOT__icache__DOT__tag_mem_3;

    // CONSTRUCTORS
    Vnicore__Syms(VerilatedContext* contextp, const char* namep, Vnicore* modelp);
    ~Vnicore__Syms();

    // METHODS
    const char* name() const { return TOP.vlNamep; }
};

#endif  // guard

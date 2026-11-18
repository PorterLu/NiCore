// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Symbol table internal header
//
// Internal details; most calling programs do not need this header,
// unless using verilator public meta comments.

#ifndef VERILATED_VYSYX_22041812__SYMS_H_
#define VERILATED_VYSYX_22041812__SYMS_H_  // guard

#include "verilated.h"

// INCLUDE MODEL CLASS

#include "Vysyx_22041812.h"

// INCLUDE MODULE CLASSES
#include "Vysyx_22041812___024root.h"
#include "Vysyx_22041812_ysyx_22041812_tag_cache.h"

// SYMS CLASS (contains all model state)
class alignas(VL_CACHE_LINE_BYTES) Vysyx_22041812__Syms final : public VerilatedSyms {
  public:
    // INTERNAL STATE
    Vysyx_22041812* const __Vm_modelp;
    VlDeleter __Vm_deleter;
    bool __Vm_didInit = false;

    // MODULE INSTANCE STATE
    Vysyx_22041812___024root       TOP;
    Vysyx_22041812_ysyx_22041812_tag_cache TOP__ysyx_22041812__DOT__dcache__DOT__tag_mem_0;
    Vysyx_22041812_ysyx_22041812_tag_cache TOP__ysyx_22041812__DOT__dcache__DOT__tag_mem_1;
    Vysyx_22041812_ysyx_22041812_tag_cache TOP__ysyx_22041812__DOT__dcache__DOT__tag_mem_2;
    Vysyx_22041812_ysyx_22041812_tag_cache TOP__ysyx_22041812__DOT__dcache__DOT__tag_mem_3;
    Vysyx_22041812_ysyx_22041812_tag_cache TOP__ysyx_22041812__DOT__icache__DOT__tag_mem_0;
    Vysyx_22041812_ysyx_22041812_tag_cache TOP__ysyx_22041812__DOT__icache__DOT__tag_mem_1;
    Vysyx_22041812_ysyx_22041812_tag_cache TOP__ysyx_22041812__DOT__icache__DOT__tag_mem_2;
    Vysyx_22041812_ysyx_22041812_tag_cache TOP__ysyx_22041812__DOT__icache__DOT__tag_mem_3;

    // CONSTRUCTORS
    Vysyx_22041812__Syms(VerilatedContext* contextp, const char* namep, Vysyx_22041812* modelp);
    ~Vysyx_22041812__Syms();

    // METHODS
    const char* name() const { return TOP.vlNamep; }
};

#endif  // guard

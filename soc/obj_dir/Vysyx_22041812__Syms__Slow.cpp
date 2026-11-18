// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Symbol table implementation internals

#include "Vysyx_22041812__pch.h"

Vysyx_22041812__Syms::Vysyx_22041812__Syms(VerilatedContext* contextp, const char* namep, Vysyx_22041812* modelp)
    : VerilatedSyms{contextp}
    // Setup internal state of the Syms class
    , __Vm_modelp{modelp}
    // Setup top module instance
    , TOP{this, namep}
{
    // Check resources
    Verilated::stackCheck(2772);
    // Setup sub module instances
    TOP__ysyx_22041812__DOT__dcache__DOT__tag_mem_0.ctor(this, "ysyx_22041812.dcache.tag_mem_0");
    TOP__ysyx_22041812__DOT__dcache__DOT__tag_mem_1.ctor(this, "ysyx_22041812.dcache.tag_mem_1");
    TOP__ysyx_22041812__DOT__dcache__DOT__tag_mem_2.ctor(this, "ysyx_22041812.dcache.tag_mem_2");
    TOP__ysyx_22041812__DOT__dcache__DOT__tag_mem_3.ctor(this, "ysyx_22041812.dcache.tag_mem_3");
    TOP__ysyx_22041812__DOT__icache__DOT__tag_mem_0.ctor(this, "ysyx_22041812.icache.tag_mem_0");
    TOP__ysyx_22041812__DOT__icache__DOT__tag_mem_1.ctor(this, "ysyx_22041812.icache.tag_mem_1");
    TOP__ysyx_22041812__DOT__icache__DOT__tag_mem_2.ctor(this, "ysyx_22041812.icache.tag_mem_2");
    TOP__ysyx_22041812__DOT__icache__DOT__tag_mem_3.ctor(this, "ysyx_22041812.icache.tag_mem_3");
    // Configure time unit / time precision
    _vm_contextp__->timeunit(-12);
    _vm_contextp__->timeprecision(-12);
    // Setup each module's pointers to their submodules
    TOP.__PVT__ysyx_22041812__DOT__dcache__DOT__tag_mem_0 = &TOP__ysyx_22041812__DOT__dcache__DOT__tag_mem_0;
    TOP.__PVT__ysyx_22041812__DOT__dcache__DOT__tag_mem_1 = &TOP__ysyx_22041812__DOT__dcache__DOT__tag_mem_1;
    TOP.__PVT__ysyx_22041812__DOT__dcache__DOT__tag_mem_2 = &TOP__ysyx_22041812__DOT__dcache__DOT__tag_mem_2;
    TOP.__PVT__ysyx_22041812__DOT__dcache__DOT__tag_mem_3 = &TOP__ysyx_22041812__DOT__dcache__DOT__tag_mem_3;
    TOP.__PVT__ysyx_22041812__DOT__icache__DOT__tag_mem_0 = &TOP__ysyx_22041812__DOT__icache__DOT__tag_mem_0;
    TOP.__PVT__ysyx_22041812__DOT__icache__DOT__tag_mem_1 = &TOP__ysyx_22041812__DOT__icache__DOT__tag_mem_1;
    TOP.__PVT__ysyx_22041812__DOT__icache__DOT__tag_mem_2 = &TOP__ysyx_22041812__DOT__icache__DOT__tag_mem_2;
    TOP.__PVT__ysyx_22041812__DOT__icache__DOT__tag_mem_3 = &TOP__ysyx_22041812__DOT__icache__DOT__tag_mem_3;
    // Setup each module's pointer back to symbol table (for public functions)
    TOP.__Vconfigure(true);
    TOP__ysyx_22041812__DOT__dcache__DOT__tag_mem_0.__Vconfigure(true);
    TOP__ysyx_22041812__DOT__dcache__DOT__tag_mem_1.__Vconfigure(false);
    TOP__ysyx_22041812__DOT__dcache__DOT__tag_mem_2.__Vconfigure(false);
    TOP__ysyx_22041812__DOT__dcache__DOT__tag_mem_3.__Vconfigure(false);
    TOP__ysyx_22041812__DOT__icache__DOT__tag_mem_0.__Vconfigure(false);
    TOP__ysyx_22041812__DOT__icache__DOT__tag_mem_1.__Vconfigure(false);
    TOP__ysyx_22041812__DOT__icache__DOT__tag_mem_2.__Vconfigure(false);
    TOP__ysyx_22041812__DOT__icache__DOT__tag_mem_3.__Vconfigure(false);
    // Setup scopes
}

Vysyx_22041812__Syms::~Vysyx_22041812__Syms() {
    // Tear down scopes
    // Tear down sub module instances
    TOP__ysyx_22041812__DOT__icache__DOT__tag_mem_3.dtor();
    TOP__ysyx_22041812__DOT__icache__DOT__tag_mem_2.dtor();
    TOP__ysyx_22041812__DOT__icache__DOT__tag_mem_1.dtor();
    TOP__ysyx_22041812__DOT__icache__DOT__tag_mem_0.dtor();
    TOP__ysyx_22041812__DOT__dcache__DOT__tag_mem_3.dtor();
    TOP__ysyx_22041812__DOT__dcache__DOT__tag_mem_2.dtor();
    TOP__ysyx_22041812__DOT__dcache__DOT__tag_mem_1.dtor();
    TOP__ysyx_22041812__DOT__dcache__DOT__tag_mem_0.dtor();
}

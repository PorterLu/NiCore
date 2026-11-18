// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Symbol table implementation internals

#include "Vnicore__pch.h"

Vnicore__Syms::Vnicore__Syms(VerilatedContext* contextp, const char* namep, Vnicore* modelp)
    : VerilatedSyms{contextp}
    // Setup internal state of the Syms class
    , __Vm_modelp{modelp}
    // Setup top module instance
    , TOP{this, namep}
{
    // Check resources
    Verilated::stackCheck(2774);
    // Setup sub module instances
    TOP__nicore__DOT__dcache__DOT__tag_mem_0.ctor(this, "nicore.dcache.tag_mem_0");
    TOP__nicore__DOT__dcache__DOT__tag_mem_1.ctor(this, "nicore.dcache.tag_mem_1");
    TOP__nicore__DOT__dcache__DOT__tag_mem_2.ctor(this, "nicore.dcache.tag_mem_2");
    TOP__nicore__DOT__dcache__DOT__tag_mem_3.ctor(this, "nicore.dcache.tag_mem_3");
    TOP__nicore__DOT__icache__DOT__tag_mem_0.ctor(this, "nicore.icache.tag_mem_0");
    TOP__nicore__DOT__icache__DOT__tag_mem_1.ctor(this, "nicore.icache.tag_mem_1");
    TOP__nicore__DOT__icache__DOT__tag_mem_2.ctor(this, "nicore.icache.tag_mem_2");
    TOP__nicore__DOT__icache__DOT__tag_mem_3.ctor(this, "nicore.icache.tag_mem_3");
    // Configure time unit / time precision
    _vm_contextp__->timeunit(-12);
    _vm_contextp__->timeprecision(-12);
    // Setup each module's pointers to their submodules
    TOP.__PVT__nicore__DOT__dcache__DOT__tag_mem_0 = &TOP__nicore__DOT__dcache__DOT__tag_mem_0;
    TOP.__PVT__nicore__DOT__dcache__DOT__tag_mem_1 = &TOP__nicore__DOT__dcache__DOT__tag_mem_1;
    TOP.__PVT__nicore__DOT__dcache__DOT__tag_mem_2 = &TOP__nicore__DOT__dcache__DOT__tag_mem_2;
    TOP.__PVT__nicore__DOT__dcache__DOT__tag_mem_3 = &TOP__nicore__DOT__dcache__DOT__tag_mem_3;
    TOP.__PVT__nicore__DOT__icache__DOT__tag_mem_0 = &TOP__nicore__DOT__icache__DOT__tag_mem_0;
    TOP.__PVT__nicore__DOT__icache__DOT__tag_mem_1 = &TOP__nicore__DOT__icache__DOT__tag_mem_1;
    TOP.__PVT__nicore__DOT__icache__DOT__tag_mem_2 = &TOP__nicore__DOT__icache__DOT__tag_mem_2;
    TOP.__PVT__nicore__DOT__icache__DOT__tag_mem_3 = &TOP__nicore__DOT__icache__DOT__tag_mem_3;
    // Setup each module's pointer back to symbol table (for public functions)
    TOP.__Vconfigure(true);
    TOP__nicore__DOT__dcache__DOT__tag_mem_0.__Vconfigure(true);
    TOP__nicore__DOT__dcache__DOT__tag_mem_1.__Vconfigure(false);
    TOP__nicore__DOT__dcache__DOT__tag_mem_2.__Vconfigure(false);
    TOP__nicore__DOT__dcache__DOT__tag_mem_3.__Vconfigure(false);
    TOP__nicore__DOT__icache__DOT__tag_mem_0.__Vconfigure(false);
    TOP__nicore__DOT__icache__DOT__tag_mem_1.__Vconfigure(false);
    TOP__nicore__DOT__icache__DOT__tag_mem_2.__Vconfigure(false);
    TOP__nicore__DOT__icache__DOT__tag_mem_3.__Vconfigure(false);
    // Setup scopes
}

Vnicore__Syms::~Vnicore__Syms() {
    // Tear down scopes
    // Tear down sub module instances
    TOP__nicore__DOT__icache__DOT__tag_mem_3.dtor();
    TOP__nicore__DOT__icache__DOT__tag_mem_2.dtor();
    TOP__nicore__DOT__icache__DOT__tag_mem_1.dtor();
    TOP__nicore__DOT__icache__DOT__tag_mem_0.dtor();
    TOP__nicore__DOT__dcache__DOT__tag_mem_3.dtor();
    TOP__nicore__DOT__dcache__DOT__tag_mem_2.dtor();
    TOP__nicore__DOT__dcache__DOT__tag_mem_1.dtor();
    TOP__nicore__DOT__dcache__DOT__tag_mem_0.dtor();
}

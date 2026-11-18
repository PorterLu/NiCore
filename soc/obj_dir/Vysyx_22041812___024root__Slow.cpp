// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See Vysyx_22041812.h for the primary calling header

#include "Vysyx_22041812__pch.h"

void Vysyx_22041812___024root___ctor_var_reset(Vysyx_22041812___024root* vlSelf);

Vysyx_22041812___024root::Vysyx_22041812___024root(Vysyx_22041812__Syms* symsp, const char* namep)
 {
    vlSymsp = symsp;
    vlNamep = strdup(namep);
    // Reset structure values
    Vysyx_22041812___024root___ctor_var_reset(this);
}

void Vysyx_22041812___024root::__Vconfigure(bool first) {
    (void)first;  // Prevent unused variable warning
}

Vysyx_22041812___024root::~Vysyx_22041812___024root() {
    VL_DO_DANGLING(std::free(const_cast<char*>(vlNamep)), vlNamep);
}

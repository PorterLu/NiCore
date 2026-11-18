// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See Vnicore.h for the primary calling header

#include "Vnicore__pch.h"

void Vnicore___024root___ctor_var_reset(Vnicore___024root* vlSelf);

Vnicore___024root::Vnicore___024root(Vnicore__Syms* symsp, const char* namep)
 {
    vlSymsp = symsp;
    vlNamep = strdup(namep);
    // Reset structure values
    Vnicore___024root___ctor_var_reset(this);
}

void Vnicore___024root::__Vconfigure(bool first) {
    (void)first;  // Prevent unused variable warning
}

Vnicore___024root::~Vnicore___024root() {
    VL_DO_DANGLING(std::free(const_cast<char*>(vlNamep)), vlNamep);
}

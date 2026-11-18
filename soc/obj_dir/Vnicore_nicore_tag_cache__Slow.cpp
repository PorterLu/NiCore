// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See Vnicore.h for the primary calling header

#include "Vnicore__pch.h"

void Vnicore_nicore_tag_cache___ctor_var_reset(Vnicore_nicore_tag_cache* vlSelf);

Vnicore_nicore_tag_cache::Vnicore_nicore_tag_cache() = default;
Vnicore_nicore_tag_cache::~Vnicore_nicore_tag_cache() = default;

void Vnicore_nicore_tag_cache::ctor(Vnicore__Syms* symsp, const char* namep) {
    vlSymsp = symsp;
    vlNamep = strdup(Verilated::catName(vlSymsp->name(), namep));
    // Reset structure values
    Vnicore_nicore_tag_cache___ctor_var_reset(this);
}

void Vnicore_nicore_tag_cache::__Vconfigure(bool first) {
    (void)first;  // Prevent unused variable warning
}

void Vnicore_nicore_tag_cache::dtor() {
    VL_DO_DANGLING(std::free(const_cast<char*>(vlNamep)), vlNamep);
}

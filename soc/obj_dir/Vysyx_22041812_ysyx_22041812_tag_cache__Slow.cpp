// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See Vysyx_22041812.h for the primary calling header

#include "Vysyx_22041812__pch.h"

void Vysyx_22041812_ysyx_22041812_tag_cache___ctor_var_reset(Vysyx_22041812_ysyx_22041812_tag_cache* vlSelf);

Vysyx_22041812_ysyx_22041812_tag_cache::Vysyx_22041812_ysyx_22041812_tag_cache() = default;
Vysyx_22041812_ysyx_22041812_tag_cache::~Vysyx_22041812_ysyx_22041812_tag_cache() = default;

void Vysyx_22041812_ysyx_22041812_tag_cache::ctor(Vysyx_22041812__Syms* symsp, const char* namep) {
    vlSymsp = symsp;
    vlNamep = strdup(Verilated::catName(vlSymsp->name(), namep));
    // Reset structure values
    Vysyx_22041812_ysyx_22041812_tag_cache___ctor_var_reset(this);
}

void Vysyx_22041812_ysyx_22041812_tag_cache::__Vconfigure(bool first) {
    (void)first;  // Prevent unused variable warning
}

void Vysyx_22041812_ysyx_22041812_tag_cache::dtor() {
    VL_DO_DANGLING(std::free(const_cast<char*>(vlNamep)), vlNamep);
}

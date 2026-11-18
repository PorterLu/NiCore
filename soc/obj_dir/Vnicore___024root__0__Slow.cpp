// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See Vnicore.h for the primary calling header

#include "Vnicore__pch.h"

VL_ATTR_COLD void Vnicore___024root___eval_static(Vnicore___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vnicore___024root___eval_static\n"); );
    Vnicore__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    vlSelfRef.__Vtrigprevexpr___TOP__clock__0 = vlSelfRef.clock;
    vlSelfRef.__Vtrigprevexpr___TOP__reset__0 = vlSelfRef.reset;
    vlSelfRef.__Vtrigprevexpr___TOP__io_interrupt__0 
        = vlSelfRef.io_interrupt;
    vlSelfRef.__Vtrigprevexpr___TOP__io_master_awready__0 
        = vlSelfRef.io_master_awready;
    vlSelfRef.__Vtrigprevexpr___TOP__io_master_wready__0 
        = vlSelfRef.io_master_wready;
    vlSelfRef.__Vtrigprevexpr___TOP__io_master_bvalid__0 
        = vlSelfRef.io_master_bvalid;
    vlSelfRef.__Vtrigprevexpr___TOP__io_master_bresp__0 
        = vlSelfRef.io_master_bresp;
    vlSelfRef.__Vtrigprevexpr___TOP__io_master_bid__0 
        = vlSelfRef.io_master_bid;
    vlSelfRef.__Vtrigprevexpr___TOP__io_master_arready__0 
        = vlSelfRef.io_master_arready;
    vlSelfRef.__Vtrigprevexpr___TOP__io_master_rvalid__0 
        = vlSelfRef.io_master_rvalid;
    vlSelfRef.__Vtrigprevexpr___TOP__io_master_rresp__0 
        = vlSelfRef.io_master_rresp;
    vlSelfRef.__Vtrigprevexpr___TOP__io_master_rdata__0 
        = vlSelfRef.io_master_rdata;
    vlSelfRef.__Vtrigprevexpr___TOP__io_master_rlast__0 
        = vlSelfRef.io_master_rlast;
    vlSelfRef.__Vtrigprevexpr___TOP__io_master_rid__0 
        = vlSelfRef.io_master_rid;
    vlSelfRef.__Vtrigprevexpr___TOP__io_slave_awvalid__0 
        = vlSelfRef.io_slave_awvalid;
    vlSelfRef.__Vtrigprevexpr___TOP__io_slave_awaddr__0 
        = vlSelfRef.io_slave_awaddr;
    vlSelfRef.__Vtrigprevexpr___TOP__io_slave_awid__0 
        = vlSelfRef.io_slave_awid;
    vlSelfRef.__Vtrigprevexpr___TOP__io_slave_awlen__0 
        = vlSelfRef.io_slave_awlen;
    vlSelfRef.__Vtrigprevexpr___TOP__io_slave_awsize__0 
        = vlSelfRef.io_slave_awsize;
    vlSelfRef.__Vtrigprevexpr___TOP__io_slave_awburst__0 
        = vlSelfRef.io_slave_awburst;
    vlSelfRef.__Vtrigprevexpr___TOP__io_slave_wvalid__0 
        = vlSelfRef.io_slave_wvalid;
    vlSelfRef.__Vtrigprevexpr___TOP__io_slave_wdata__0 
        = vlSelfRef.io_slave_wdata;
    vlSelfRef.__Vtrigprevexpr___TOP__io_slave_wstrb__0 
        = vlSelfRef.io_slave_wstrb;
    vlSelfRef.__Vtrigprevexpr___TOP__io_slave_wlast__0 
        = vlSelfRef.io_slave_wlast;
    vlSelfRef.__Vtrigprevexpr___TOP__io_slave_bready__0 
        = vlSelfRef.io_slave_bready;
    vlSelfRef.__Vtrigprevexpr___TOP__io_slave_arvalid__0 
        = vlSelfRef.io_slave_arvalid;
    vlSelfRef.__Vtrigprevexpr___TOP__io_slave_araddr__0 
        = vlSelfRef.io_slave_araddr;
    vlSelfRef.__Vtrigprevexpr___TOP__io_slave_arid__0 
        = vlSelfRef.io_slave_arid;
    vlSelfRef.__Vtrigprevexpr___TOP__io_slave_arlen__0 
        = vlSelfRef.io_slave_arlen;
    vlSelfRef.__Vtrigprevexpr___TOP__io_slave_arsize__0 
        = vlSelfRef.io_slave_arsize;
    vlSelfRef.__Vtrigprevexpr___TOP__io_slave_arburst__0 
        = vlSelfRef.io_slave_arburst;
    vlSelfRef.__Vtrigprevexpr___TOP__io_slave_rready__0 
        = vlSelfRef.io_slave_rready;
    vlSelfRef.__Vtrigprevexpr___TOP__clock__1 = vlSelfRef.clock;
}

VL_ATTR_COLD void Vnicore___024root___eval_initial__TOP(Vnicore___024root* vlSelf);

VL_ATTR_COLD void Vnicore___024root___eval_initial(Vnicore___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vnicore___024root___eval_initial\n"); );
    Vnicore__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    Vnicore___024root___eval_initial__TOP(vlSelf);
}

VL_ATTR_COLD void Vnicore___024root___eval_initial__TOP(Vnicore___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vnicore___024root___eval_initial__TOP\n"); );
    Vnicore__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    vlSelfRef.io_master_awid = 0U;
    vlSelfRef.io_master_awburst = 1U;
    vlSelfRef.io_master_arid = 0U;
    vlSelfRef.io_master_arburst = 1U;
    vlSelfRef.io_slave_awready = 0U;
    vlSelfRef.io_slave_wready = 0U;
    vlSelfRef.io_slave_bvalid = 0U;
    vlSelfRef.io_slave_bresp = 0U;
    vlSelfRef.io_slave_bid = 0U;
    vlSelfRef.io_slave_arready = 0U;
    vlSelfRef.io_slave_rvalid = 0U;
    vlSelfRef.io_slave_rresp = 0U;
    vlSelfRef.io_slave_rdata = 0ULL;
    vlSelfRef.io_slave_rlast = 0U;
    vlSelfRef.io_slave_rid = 0U;
    vlSelfRef.nicore__DOT__sram0_CEN = 0U;
    vlSelfRef.nicore__DOT__sram1_CEN = 0U;
    vlSelfRef.nicore__DOT__sram2_CEN = 0U;
    vlSelfRef.nicore__DOT__sram3_CEN = 0U;
    vlSelfRef.nicore__DOT__sram4_CEN = 0U;
    vlSelfRef.nicore__DOT__sram5_CEN = 0U;
    vlSelfRef.nicore__DOT__sram6_CEN = 0U;
    vlSelfRef.nicore__DOT__sram7_CEN = 0U;
    vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__gpr_ptr_regfile_0 = 0ULL;
    vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT___pc_T_1 = 0x000000007ffffffcULL;
    vlSelfRef.nicore__DOT__sram7__DOT__i = 0U;
    vlSelfRef.nicore__DOT__sram7__DOT__mem[0U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram7__DOT__mem[0U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram7__DOT__mem[0U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram7__DOT__mem[0U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram7__DOT__i = 1U;
    vlSelfRef.nicore__DOT__sram7__DOT__mem[1U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram7__DOT__mem[1U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram7__DOT__mem[1U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram7__DOT__mem[1U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram7__DOT__i = 2U;
    vlSelfRef.nicore__DOT__sram7__DOT__mem[2U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram7__DOT__mem[2U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram7__DOT__mem[2U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram7__DOT__mem[2U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram7__DOT__i = 3U;
    vlSelfRef.nicore__DOT__sram7__DOT__mem[3U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram7__DOT__mem[3U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram7__DOT__mem[3U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram7__DOT__mem[3U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram7__DOT__i = 4U;
    vlSelfRef.nicore__DOT__sram7__DOT__mem[4U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram7__DOT__mem[4U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram7__DOT__mem[4U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram7__DOT__mem[4U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram7__DOT__i = 5U;
    vlSelfRef.nicore__DOT__sram7__DOT__mem[5U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram7__DOT__mem[5U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram7__DOT__mem[5U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram7__DOT__mem[5U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram7__DOT__i = 6U;
    vlSelfRef.nicore__DOT__sram7__DOT__mem[6U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram7__DOT__mem[6U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram7__DOT__mem[6U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram7__DOT__mem[6U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram7__DOT__i = 7U;
    vlSelfRef.nicore__DOT__sram7__DOT__mem[7U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram7__DOT__mem[7U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram7__DOT__mem[7U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram7__DOT__mem[7U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram7__DOT__i = 8U;
    vlSelfRef.nicore__DOT__sram7__DOT__mem[8U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram7__DOT__mem[8U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram7__DOT__mem[8U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram7__DOT__mem[8U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram7__DOT__i = 9U;
    vlSelfRef.nicore__DOT__sram7__DOT__mem[9U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram7__DOT__mem[9U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram7__DOT__mem[9U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram7__DOT__mem[9U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram7__DOT__i = 0x0000000aU;
    vlSelfRef.nicore__DOT__sram7__DOT__mem[10U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram7__DOT__mem[10U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram7__DOT__mem[10U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram7__DOT__mem[10U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram7__DOT__i = 0x0000000bU;
    vlSelfRef.nicore__DOT__sram7__DOT__mem[11U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram7__DOT__mem[11U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram7__DOT__mem[11U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram7__DOT__mem[11U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram7__DOT__i = 0x0000000cU;
    vlSelfRef.nicore__DOT__sram7__DOT__mem[12U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram7__DOT__mem[12U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram7__DOT__mem[12U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram7__DOT__mem[12U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram7__DOT__i = 0x0000000dU;
    vlSelfRef.nicore__DOT__sram7__DOT__mem[13U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram7__DOT__mem[13U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram7__DOT__mem[13U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram7__DOT__mem[13U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram7__DOT__i = 0x0000000eU;
    vlSelfRef.nicore__DOT__sram7__DOT__mem[14U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram7__DOT__mem[14U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram7__DOT__mem[14U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram7__DOT__mem[14U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram7__DOT__i = 0x0000000fU;
    vlSelfRef.nicore__DOT__sram7__DOT__mem[15U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram7__DOT__mem[15U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram7__DOT__mem[15U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram7__DOT__mem[15U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram7__DOT__i = 0x00000010U;
    vlSelfRef.nicore__DOT__sram7__DOT__mem[16U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram7__DOT__mem[16U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram7__DOT__mem[16U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram7__DOT__mem[16U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram7__DOT__i = 0x00000011U;
    vlSelfRef.nicore__DOT__sram7__DOT__mem[17U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram7__DOT__mem[17U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram7__DOT__mem[17U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram7__DOT__mem[17U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram7__DOT__i = 0x00000012U;
    vlSelfRef.nicore__DOT__sram7__DOT__mem[18U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram7__DOT__mem[18U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram7__DOT__mem[18U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram7__DOT__mem[18U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram7__DOT__i = 0x00000013U;
    vlSelfRef.nicore__DOT__sram7__DOT__mem[19U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram7__DOT__mem[19U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram7__DOT__mem[19U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram7__DOT__mem[19U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram7__DOT__i = 0x00000014U;
    vlSelfRef.nicore__DOT__sram7__DOT__mem[20U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram7__DOT__mem[20U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram7__DOT__mem[20U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram7__DOT__mem[20U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram7__DOT__i = 0x00000015U;
    vlSelfRef.nicore__DOT__sram7__DOT__mem[21U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram7__DOT__mem[21U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram7__DOT__mem[21U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram7__DOT__mem[21U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram7__DOT__i = 0x00000016U;
    vlSelfRef.nicore__DOT__sram7__DOT__mem[22U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram7__DOT__mem[22U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram7__DOT__mem[22U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram7__DOT__mem[22U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram7__DOT__i = 0x00000017U;
    vlSelfRef.nicore__DOT__sram7__DOT__mem[23U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram7__DOT__mem[23U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram7__DOT__mem[23U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram7__DOT__mem[23U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram7__DOT__i = 0x00000018U;
    vlSelfRef.nicore__DOT__sram7__DOT__mem[24U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram7__DOT__mem[24U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram7__DOT__mem[24U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram7__DOT__mem[24U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram7__DOT__i = 0x00000019U;
    vlSelfRef.nicore__DOT__sram7__DOT__mem[25U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram7__DOT__mem[25U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram7__DOT__mem[25U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram7__DOT__mem[25U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram7__DOT__i = 0x0000001aU;
    vlSelfRef.nicore__DOT__sram7__DOT__mem[26U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram7__DOT__mem[26U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram7__DOT__mem[26U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram7__DOT__mem[26U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram7__DOT__i = 0x0000001bU;
    vlSelfRef.nicore__DOT__sram7__DOT__mem[27U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram7__DOT__mem[27U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram7__DOT__mem[27U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram7__DOT__mem[27U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram7__DOT__i = 0x0000001cU;
    vlSelfRef.nicore__DOT__sram7__DOT__mem[28U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram7__DOT__mem[28U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram7__DOT__mem[28U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram7__DOT__mem[28U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram7__DOT__i = 0x0000001dU;
    vlSelfRef.nicore__DOT__sram7__DOT__mem[29U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram7__DOT__mem[29U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram7__DOT__mem[29U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram7__DOT__mem[29U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram7__DOT__i = 0x0000001eU;
    vlSelfRef.nicore__DOT__sram7__DOT__mem[30U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram7__DOT__mem[30U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram7__DOT__mem[30U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram7__DOT__mem[30U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram7__DOT__i = 0x0000001fU;
    vlSelfRef.nicore__DOT__sram7__DOT__mem[31U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram7__DOT__mem[31U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram7__DOT__mem[31U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram7__DOT__mem[31U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram7__DOT__i = 0x00000020U;
    vlSelfRef.nicore__DOT__sram7__DOT__mem[32U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram7__DOT__mem[32U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram7__DOT__mem[32U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram7__DOT__mem[32U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram7__DOT__i = 0x00000021U;
    vlSelfRef.nicore__DOT__sram7__DOT__mem[33U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram7__DOT__mem[33U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram7__DOT__mem[33U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram7__DOT__mem[33U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram7__DOT__i = 0x00000022U;
    vlSelfRef.nicore__DOT__sram7__DOT__mem[34U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram7__DOT__mem[34U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram7__DOT__mem[34U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram7__DOT__mem[34U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram7__DOT__i = 0x00000023U;
    vlSelfRef.nicore__DOT__sram7__DOT__mem[35U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram7__DOT__mem[35U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram7__DOT__mem[35U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram7__DOT__mem[35U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram7__DOT__i = 0x00000024U;
    vlSelfRef.nicore__DOT__sram7__DOT__mem[36U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram7__DOT__mem[36U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram7__DOT__mem[36U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram7__DOT__mem[36U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram7__DOT__i = 0x00000025U;
    vlSelfRef.nicore__DOT__sram7__DOT__mem[37U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram7__DOT__mem[37U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram7__DOT__mem[37U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram7__DOT__mem[37U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram7__DOT__i = 0x00000026U;
    vlSelfRef.nicore__DOT__sram7__DOT__mem[38U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram7__DOT__mem[38U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram7__DOT__mem[38U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram7__DOT__mem[38U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram7__DOT__i = 0x00000027U;
    vlSelfRef.nicore__DOT__sram7__DOT__mem[39U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram7__DOT__mem[39U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram7__DOT__mem[39U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram7__DOT__mem[39U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram7__DOT__i = 0x00000028U;
    vlSelfRef.nicore__DOT__sram7__DOT__mem[40U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram7__DOT__mem[40U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram7__DOT__mem[40U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram7__DOT__mem[40U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram7__DOT__i = 0x00000029U;
    vlSelfRef.nicore__DOT__sram7__DOT__mem[41U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram7__DOT__mem[41U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram7__DOT__mem[41U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram7__DOT__mem[41U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram7__DOT__i = 0x0000002aU;
    vlSelfRef.nicore__DOT__sram7__DOT__mem[42U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram7__DOT__mem[42U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram7__DOT__mem[42U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram7__DOT__mem[42U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram7__DOT__i = 0x0000002bU;
    vlSelfRef.nicore__DOT__sram7__DOT__mem[43U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram7__DOT__mem[43U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram7__DOT__mem[43U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram7__DOT__mem[43U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram7__DOT__i = 0x0000002cU;
    vlSelfRef.nicore__DOT__sram7__DOT__mem[44U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram7__DOT__mem[44U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram7__DOT__mem[44U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram7__DOT__mem[44U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram7__DOT__i = 0x0000002dU;
    vlSelfRef.nicore__DOT__sram7__DOT__mem[45U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram7__DOT__mem[45U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram7__DOT__mem[45U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram7__DOT__mem[45U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram7__DOT__i = 0x0000002eU;
    vlSelfRef.nicore__DOT__sram7__DOT__mem[46U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram7__DOT__mem[46U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram7__DOT__mem[46U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram7__DOT__mem[46U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram7__DOT__i = 0x0000002fU;
    vlSelfRef.nicore__DOT__sram7__DOT__mem[47U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram7__DOT__mem[47U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram7__DOT__mem[47U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram7__DOT__mem[47U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram7__DOT__i = 0x00000030U;
    vlSelfRef.nicore__DOT__sram7__DOT__mem[48U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram7__DOT__mem[48U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram7__DOT__mem[48U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram7__DOT__mem[48U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram7__DOT__i = 0x00000031U;
    vlSelfRef.nicore__DOT__sram7__DOT__mem[49U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram7__DOT__mem[49U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram7__DOT__mem[49U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram7__DOT__mem[49U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram7__DOT__i = 0x00000032U;
    vlSelfRef.nicore__DOT__sram7__DOT__mem[50U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram7__DOT__mem[50U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram7__DOT__mem[50U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram7__DOT__mem[50U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram7__DOT__i = 0x00000033U;
    vlSelfRef.nicore__DOT__sram7__DOT__mem[51U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram7__DOT__mem[51U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram7__DOT__mem[51U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram7__DOT__mem[51U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram7__DOT__i = 0x00000034U;
    vlSelfRef.nicore__DOT__sram7__DOT__mem[52U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram7__DOT__mem[52U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram7__DOT__mem[52U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram7__DOT__mem[52U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram7__DOT__i = 0x00000035U;
    vlSelfRef.nicore__DOT__sram7__DOT__mem[53U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram7__DOT__mem[53U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram7__DOT__mem[53U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram7__DOT__mem[53U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram7__DOT__i = 0x00000036U;
    vlSelfRef.nicore__DOT__sram7__DOT__mem[54U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram7__DOT__mem[54U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram7__DOT__mem[54U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram7__DOT__mem[54U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram7__DOT__i = 0x00000037U;
    vlSelfRef.nicore__DOT__sram7__DOT__mem[55U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram7__DOT__mem[55U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram7__DOT__mem[55U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram7__DOT__mem[55U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram7__DOT__i = 0x00000038U;
    vlSelfRef.nicore__DOT__sram7__DOT__mem[56U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram7__DOT__mem[56U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram7__DOT__mem[56U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram7__DOT__mem[56U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram7__DOT__i = 0x00000039U;
    vlSelfRef.nicore__DOT__sram7__DOT__mem[57U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram7__DOT__mem[57U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram7__DOT__mem[57U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram7__DOT__mem[57U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram7__DOT__i = 0x0000003aU;
    vlSelfRef.nicore__DOT__sram7__DOT__mem[58U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram7__DOT__mem[58U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram7__DOT__mem[58U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram7__DOT__mem[58U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram7__DOT__i = 0x0000003bU;
    vlSelfRef.nicore__DOT__sram7__DOT__mem[59U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram7__DOT__mem[59U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram7__DOT__mem[59U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram7__DOT__mem[59U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram7__DOT__i = 0x0000003cU;
    vlSelfRef.nicore__DOT__sram7__DOT__mem[60U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram7__DOT__mem[60U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram7__DOT__mem[60U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram7__DOT__mem[60U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram7__DOT__i = 0x0000003dU;
    vlSelfRef.nicore__DOT__sram7__DOT__mem[61U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram7__DOT__mem[61U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram7__DOT__mem[61U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram7__DOT__mem[61U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram7__DOT__i = 0x0000003eU;
    vlSelfRef.nicore__DOT__sram7__DOT__mem[62U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram7__DOT__mem[62U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram7__DOT__mem[62U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram7__DOT__mem[62U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram7__DOT__i = 0x0000003fU;
    vlSelfRef.nicore__DOT__sram7__DOT__mem[63U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram7__DOT__mem[63U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram7__DOT__mem[63U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram7__DOT__mem[63U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram7__DOT__i = 0x00000040U;
    vlSelfRef.nicore__DOT__sram7_Q[0U] = 0U;
    vlSelfRef.nicore__DOT__sram7_Q[1U] = 0U;
    vlSelfRef.nicore__DOT__sram7_Q[2U] = 0U;
    vlSelfRef.nicore__DOT__sram7_Q[3U] = 0U;
    vlSelfRef.nicore__DOT__sram6__DOT__i = 0U;
    vlSelfRef.nicore__DOT__sram6__DOT__mem[0U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram6__DOT__mem[0U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram6__DOT__mem[0U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram6__DOT__mem[0U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram6__DOT__i = 1U;
    vlSelfRef.nicore__DOT__sram6__DOT__mem[1U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram6__DOT__mem[1U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram6__DOT__mem[1U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram6__DOT__mem[1U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram6__DOT__i = 2U;
    vlSelfRef.nicore__DOT__sram6__DOT__mem[2U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram6__DOT__mem[2U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram6__DOT__mem[2U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram6__DOT__mem[2U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram6__DOT__i = 3U;
    vlSelfRef.nicore__DOT__sram6__DOT__mem[3U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram6__DOT__mem[3U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram6__DOT__mem[3U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram6__DOT__mem[3U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram6__DOT__i = 4U;
    vlSelfRef.nicore__DOT__sram6__DOT__mem[4U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram6__DOT__mem[4U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram6__DOT__mem[4U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram6__DOT__mem[4U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram6__DOT__i = 5U;
    vlSelfRef.nicore__DOT__sram6__DOT__mem[5U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram6__DOT__mem[5U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram6__DOT__mem[5U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram6__DOT__mem[5U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram6__DOT__i = 6U;
    vlSelfRef.nicore__DOT__sram6__DOT__mem[6U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram6__DOT__mem[6U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram6__DOT__mem[6U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram6__DOT__mem[6U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram6__DOT__i = 7U;
    vlSelfRef.nicore__DOT__sram6__DOT__mem[7U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram6__DOT__mem[7U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram6__DOT__mem[7U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram6__DOT__mem[7U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram6__DOT__i = 8U;
    vlSelfRef.nicore__DOT__sram6__DOT__mem[8U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram6__DOT__mem[8U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram6__DOT__mem[8U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram6__DOT__mem[8U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram6__DOT__i = 9U;
    vlSelfRef.nicore__DOT__sram6__DOT__mem[9U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram6__DOT__mem[9U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram6__DOT__mem[9U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram6__DOT__mem[9U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram6__DOT__i = 0x0000000aU;
    vlSelfRef.nicore__DOT__sram6__DOT__mem[10U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram6__DOT__mem[10U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram6__DOT__mem[10U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram6__DOT__mem[10U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram6__DOT__i = 0x0000000bU;
    vlSelfRef.nicore__DOT__sram6__DOT__mem[11U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram6__DOT__mem[11U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram6__DOT__mem[11U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram6__DOT__mem[11U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram6__DOT__i = 0x0000000cU;
    vlSelfRef.nicore__DOT__sram6__DOT__mem[12U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram6__DOT__mem[12U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram6__DOT__mem[12U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram6__DOT__mem[12U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram6__DOT__i = 0x0000000dU;
    vlSelfRef.nicore__DOT__sram6__DOT__mem[13U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram6__DOT__mem[13U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram6__DOT__mem[13U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram6__DOT__mem[13U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram6__DOT__i = 0x0000000eU;
    vlSelfRef.nicore__DOT__sram6__DOT__mem[14U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram6__DOT__mem[14U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram6__DOT__mem[14U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram6__DOT__mem[14U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram6__DOT__i = 0x0000000fU;
    vlSelfRef.nicore__DOT__sram6__DOT__mem[15U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram6__DOT__mem[15U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram6__DOT__mem[15U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram6__DOT__mem[15U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram6__DOT__i = 0x00000010U;
    vlSelfRef.nicore__DOT__sram6__DOT__mem[16U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram6__DOT__mem[16U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram6__DOT__mem[16U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram6__DOT__mem[16U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram6__DOT__i = 0x00000011U;
    vlSelfRef.nicore__DOT__sram6__DOT__mem[17U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram6__DOT__mem[17U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram6__DOT__mem[17U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram6__DOT__mem[17U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram6__DOT__i = 0x00000012U;
    vlSelfRef.nicore__DOT__sram6__DOT__mem[18U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram6__DOT__mem[18U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram6__DOT__mem[18U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram6__DOT__mem[18U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram6__DOT__i = 0x00000013U;
    vlSelfRef.nicore__DOT__sram6__DOT__mem[19U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram6__DOT__mem[19U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram6__DOT__mem[19U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram6__DOT__mem[19U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram6__DOT__i = 0x00000014U;
    vlSelfRef.nicore__DOT__sram6__DOT__mem[20U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram6__DOT__mem[20U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram6__DOT__mem[20U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram6__DOT__mem[20U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram6__DOT__i = 0x00000015U;
    vlSelfRef.nicore__DOT__sram6__DOT__mem[21U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram6__DOT__mem[21U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram6__DOT__mem[21U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram6__DOT__mem[21U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram6__DOT__i = 0x00000016U;
    vlSelfRef.nicore__DOT__sram6__DOT__mem[22U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram6__DOT__mem[22U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram6__DOT__mem[22U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram6__DOT__mem[22U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram6__DOT__i = 0x00000017U;
    vlSelfRef.nicore__DOT__sram6__DOT__mem[23U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram6__DOT__mem[23U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram6__DOT__mem[23U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram6__DOT__mem[23U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram6__DOT__i = 0x00000018U;
    vlSelfRef.nicore__DOT__sram6__DOT__mem[24U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram6__DOT__mem[24U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram6__DOT__mem[24U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram6__DOT__mem[24U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram6__DOT__i = 0x00000019U;
    vlSelfRef.nicore__DOT__sram6__DOT__mem[25U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram6__DOT__mem[25U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram6__DOT__mem[25U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram6__DOT__mem[25U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram6__DOT__i = 0x0000001aU;
    vlSelfRef.nicore__DOT__sram6__DOT__mem[26U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram6__DOT__mem[26U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram6__DOT__mem[26U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram6__DOT__mem[26U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram6__DOT__i = 0x0000001bU;
    vlSelfRef.nicore__DOT__sram6__DOT__mem[27U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram6__DOT__mem[27U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram6__DOT__mem[27U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram6__DOT__mem[27U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram6__DOT__i = 0x0000001cU;
    vlSelfRef.nicore__DOT__sram6__DOT__mem[28U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram6__DOT__mem[28U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram6__DOT__mem[28U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram6__DOT__mem[28U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram6__DOT__i = 0x0000001dU;
    vlSelfRef.nicore__DOT__sram6__DOT__mem[29U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram6__DOT__mem[29U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram6__DOT__mem[29U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram6__DOT__mem[29U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram6__DOT__i = 0x0000001eU;
    vlSelfRef.nicore__DOT__sram6__DOT__mem[30U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram6__DOT__mem[30U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram6__DOT__mem[30U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram6__DOT__mem[30U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram6__DOT__i = 0x0000001fU;
    vlSelfRef.nicore__DOT__sram6__DOT__mem[31U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram6__DOT__mem[31U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram6__DOT__mem[31U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram6__DOT__mem[31U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram6__DOT__i = 0x00000020U;
    vlSelfRef.nicore__DOT__sram6__DOT__mem[32U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram6__DOT__mem[32U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram6__DOT__mem[32U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram6__DOT__mem[32U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram6__DOT__i = 0x00000021U;
    vlSelfRef.nicore__DOT__sram6__DOT__mem[33U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram6__DOT__mem[33U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram6__DOT__mem[33U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram6__DOT__mem[33U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram6__DOT__i = 0x00000022U;
    vlSelfRef.nicore__DOT__sram6__DOT__mem[34U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram6__DOT__mem[34U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram6__DOT__mem[34U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram6__DOT__mem[34U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram6__DOT__i = 0x00000023U;
    vlSelfRef.nicore__DOT__sram6__DOT__mem[35U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram6__DOT__mem[35U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram6__DOT__mem[35U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram6__DOT__mem[35U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram6__DOT__i = 0x00000024U;
    vlSelfRef.nicore__DOT__sram6__DOT__mem[36U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram6__DOT__mem[36U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram6__DOT__mem[36U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram6__DOT__mem[36U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram6__DOT__i = 0x00000025U;
    vlSelfRef.nicore__DOT__sram6__DOT__mem[37U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram6__DOT__mem[37U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram6__DOT__mem[37U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram6__DOT__mem[37U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram6__DOT__i = 0x00000026U;
    vlSelfRef.nicore__DOT__sram6__DOT__mem[38U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram6__DOT__mem[38U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram6__DOT__mem[38U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram6__DOT__mem[38U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram6__DOT__i = 0x00000027U;
    vlSelfRef.nicore__DOT__sram6__DOT__mem[39U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram6__DOT__mem[39U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram6__DOT__mem[39U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram6__DOT__mem[39U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram6__DOT__i = 0x00000028U;
    vlSelfRef.nicore__DOT__sram6__DOT__mem[40U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram6__DOT__mem[40U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram6__DOT__mem[40U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram6__DOT__mem[40U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram6__DOT__i = 0x00000029U;
    vlSelfRef.nicore__DOT__sram6__DOT__mem[41U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram6__DOT__mem[41U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram6__DOT__mem[41U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram6__DOT__mem[41U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram6__DOT__i = 0x0000002aU;
    vlSelfRef.nicore__DOT__sram6__DOT__mem[42U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram6__DOT__mem[42U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram6__DOT__mem[42U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram6__DOT__mem[42U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram6__DOT__i = 0x0000002bU;
    vlSelfRef.nicore__DOT__sram6__DOT__mem[43U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram6__DOT__mem[43U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram6__DOT__mem[43U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram6__DOT__mem[43U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram6__DOT__i = 0x0000002cU;
    vlSelfRef.nicore__DOT__sram6__DOT__mem[44U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram6__DOT__mem[44U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram6__DOT__mem[44U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram6__DOT__mem[44U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram6__DOT__i = 0x0000002dU;
    vlSelfRef.nicore__DOT__sram6__DOT__mem[45U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram6__DOT__mem[45U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram6__DOT__mem[45U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram6__DOT__mem[45U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram6__DOT__i = 0x0000002eU;
    vlSelfRef.nicore__DOT__sram6__DOT__mem[46U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram6__DOT__mem[46U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram6__DOT__mem[46U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram6__DOT__mem[46U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram6__DOT__i = 0x0000002fU;
    vlSelfRef.nicore__DOT__sram6__DOT__mem[47U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram6__DOT__mem[47U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram6__DOT__mem[47U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram6__DOT__mem[47U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram6__DOT__i = 0x00000030U;
    vlSelfRef.nicore__DOT__sram6__DOT__mem[48U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram6__DOT__mem[48U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram6__DOT__mem[48U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram6__DOT__mem[48U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram6__DOT__i = 0x00000031U;
    vlSelfRef.nicore__DOT__sram6__DOT__mem[49U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram6__DOT__mem[49U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram6__DOT__mem[49U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram6__DOT__mem[49U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram6__DOT__i = 0x00000032U;
    vlSelfRef.nicore__DOT__sram6__DOT__mem[50U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram6__DOT__mem[50U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram6__DOT__mem[50U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram6__DOT__mem[50U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram6__DOT__i = 0x00000033U;
    vlSelfRef.nicore__DOT__sram6__DOT__mem[51U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram6__DOT__mem[51U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram6__DOT__mem[51U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram6__DOT__mem[51U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram6__DOT__i = 0x00000034U;
    vlSelfRef.nicore__DOT__sram6__DOT__mem[52U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram6__DOT__mem[52U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram6__DOT__mem[52U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram6__DOT__mem[52U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram6__DOT__i = 0x00000035U;
    vlSelfRef.nicore__DOT__sram6__DOT__mem[53U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram6__DOT__mem[53U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram6__DOT__mem[53U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram6__DOT__mem[53U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram6__DOT__i = 0x00000036U;
    vlSelfRef.nicore__DOT__sram6__DOT__mem[54U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram6__DOT__mem[54U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram6__DOT__mem[54U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram6__DOT__mem[54U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram6__DOT__i = 0x00000037U;
    vlSelfRef.nicore__DOT__sram6__DOT__mem[55U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram6__DOT__mem[55U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram6__DOT__mem[55U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram6__DOT__mem[55U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram6__DOT__i = 0x00000038U;
    vlSelfRef.nicore__DOT__sram6__DOT__mem[56U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram6__DOT__mem[56U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram6__DOT__mem[56U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram6__DOT__mem[56U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram6__DOT__i = 0x00000039U;
    vlSelfRef.nicore__DOT__sram6__DOT__mem[57U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram6__DOT__mem[57U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram6__DOT__mem[57U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram6__DOT__mem[57U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram6__DOT__i = 0x0000003aU;
    vlSelfRef.nicore__DOT__sram6__DOT__mem[58U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram6__DOT__mem[58U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram6__DOT__mem[58U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram6__DOT__mem[58U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram6__DOT__i = 0x0000003bU;
    vlSelfRef.nicore__DOT__sram6__DOT__mem[59U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram6__DOT__mem[59U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram6__DOT__mem[59U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram6__DOT__mem[59U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram6__DOT__i = 0x0000003cU;
    vlSelfRef.nicore__DOT__sram6__DOT__mem[60U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram6__DOT__mem[60U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram6__DOT__mem[60U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram6__DOT__mem[60U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram6__DOT__i = 0x0000003dU;
    vlSelfRef.nicore__DOT__sram6__DOT__mem[61U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram6__DOT__mem[61U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram6__DOT__mem[61U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram6__DOT__mem[61U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram6__DOT__i = 0x0000003eU;
    vlSelfRef.nicore__DOT__sram6__DOT__mem[62U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram6__DOT__mem[62U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram6__DOT__mem[62U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram6__DOT__mem[62U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram6__DOT__i = 0x0000003fU;
    vlSelfRef.nicore__DOT__sram6__DOT__mem[63U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram6__DOT__mem[63U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram6__DOT__mem[63U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram6__DOT__mem[63U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram6__DOT__i = 0x00000040U;
    vlSelfRef.nicore__DOT__sram6_Q[0U] = 0U;
    vlSelfRef.nicore__DOT__sram6_Q[1U] = 0U;
    vlSelfRef.nicore__DOT__sram6_Q[2U] = 0U;
    vlSelfRef.nicore__DOT__sram6_Q[3U] = 0U;
    vlSelfRef.nicore__DOT__sram5__DOT__i = 0U;
    vlSelfRef.nicore__DOT__sram5__DOT__mem[0U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram5__DOT__mem[0U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram5__DOT__mem[0U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram5__DOT__mem[0U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram5__DOT__i = 1U;
    vlSelfRef.nicore__DOT__sram5__DOT__mem[1U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram5__DOT__mem[1U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram5__DOT__mem[1U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram5__DOT__mem[1U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram5__DOT__i = 2U;
    vlSelfRef.nicore__DOT__sram5__DOT__mem[2U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram5__DOT__mem[2U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram5__DOT__mem[2U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram5__DOT__mem[2U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram5__DOT__i = 3U;
    vlSelfRef.nicore__DOT__sram5__DOT__mem[3U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram5__DOT__mem[3U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram5__DOT__mem[3U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram5__DOT__mem[3U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram5__DOT__i = 4U;
    vlSelfRef.nicore__DOT__sram5__DOT__mem[4U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram5__DOT__mem[4U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram5__DOT__mem[4U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram5__DOT__mem[4U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram5__DOT__i = 5U;
    vlSelfRef.nicore__DOT__sram5__DOT__mem[5U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram5__DOT__mem[5U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram5__DOT__mem[5U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram5__DOT__mem[5U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram5__DOT__i = 6U;
    vlSelfRef.nicore__DOT__sram5__DOT__mem[6U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram5__DOT__mem[6U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram5__DOT__mem[6U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram5__DOT__mem[6U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram5__DOT__i = 7U;
    vlSelfRef.nicore__DOT__sram5__DOT__mem[7U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram5__DOT__mem[7U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram5__DOT__mem[7U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram5__DOT__mem[7U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram5__DOT__i = 8U;
    vlSelfRef.nicore__DOT__sram5__DOT__mem[8U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram5__DOT__mem[8U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram5__DOT__mem[8U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram5__DOT__mem[8U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram5__DOT__i = 9U;
    vlSelfRef.nicore__DOT__sram5__DOT__mem[9U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram5__DOT__mem[9U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram5__DOT__mem[9U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram5__DOT__mem[9U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram5__DOT__i = 0x0000000aU;
    vlSelfRef.nicore__DOT__sram5__DOT__mem[10U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram5__DOT__mem[10U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram5__DOT__mem[10U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram5__DOT__mem[10U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram5__DOT__i = 0x0000000bU;
    vlSelfRef.nicore__DOT__sram5__DOT__mem[11U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram5__DOT__mem[11U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram5__DOT__mem[11U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram5__DOT__mem[11U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram5__DOT__i = 0x0000000cU;
    vlSelfRef.nicore__DOT__sram5__DOT__mem[12U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram5__DOT__mem[12U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram5__DOT__mem[12U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram5__DOT__mem[12U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram5__DOT__i = 0x0000000dU;
    vlSelfRef.nicore__DOT__sram5__DOT__mem[13U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram5__DOT__mem[13U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram5__DOT__mem[13U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram5__DOT__mem[13U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram5__DOT__i = 0x0000000eU;
    vlSelfRef.nicore__DOT__sram5__DOT__mem[14U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram5__DOT__mem[14U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram5__DOT__mem[14U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram5__DOT__mem[14U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram5__DOT__i = 0x0000000fU;
    vlSelfRef.nicore__DOT__sram5__DOT__mem[15U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram5__DOT__mem[15U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram5__DOT__mem[15U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram5__DOT__mem[15U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram5__DOT__i = 0x00000010U;
    vlSelfRef.nicore__DOT__sram5__DOT__mem[16U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram5__DOT__mem[16U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram5__DOT__mem[16U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram5__DOT__mem[16U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram5__DOT__i = 0x00000011U;
    vlSelfRef.nicore__DOT__sram5__DOT__mem[17U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram5__DOT__mem[17U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram5__DOT__mem[17U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram5__DOT__mem[17U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram5__DOT__i = 0x00000012U;
    vlSelfRef.nicore__DOT__sram5__DOT__mem[18U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram5__DOT__mem[18U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram5__DOT__mem[18U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram5__DOT__mem[18U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram5__DOT__i = 0x00000013U;
    vlSelfRef.nicore__DOT__sram5__DOT__mem[19U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram5__DOT__mem[19U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram5__DOT__mem[19U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram5__DOT__mem[19U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram5__DOT__i = 0x00000014U;
    vlSelfRef.nicore__DOT__sram5__DOT__mem[20U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram5__DOT__mem[20U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram5__DOT__mem[20U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram5__DOT__mem[20U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram5__DOT__i = 0x00000015U;
    vlSelfRef.nicore__DOT__sram5__DOT__mem[21U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram5__DOT__mem[21U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram5__DOT__mem[21U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram5__DOT__mem[21U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram5__DOT__i = 0x00000016U;
    vlSelfRef.nicore__DOT__sram5__DOT__mem[22U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram5__DOT__mem[22U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram5__DOT__mem[22U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram5__DOT__mem[22U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram5__DOT__i = 0x00000017U;
    vlSelfRef.nicore__DOT__sram5__DOT__mem[23U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram5__DOT__mem[23U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram5__DOT__mem[23U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram5__DOT__mem[23U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram5__DOT__i = 0x00000018U;
    vlSelfRef.nicore__DOT__sram5__DOT__mem[24U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram5__DOT__mem[24U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram5__DOT__mem[24U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram5__DOT__mem[24U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram5__DOT__i = 0x00000019U;
    vlSelfRef.nicore__DOT__sram5__DOT__mem[25U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram5__DOT__mem[25U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram5__DOT__mem[25U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram5__DOT__mem[25U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram5__DOT__i = 0x0000001aU;
    vlSelfRef.nicore__DOT__sram5__DOT__mem[26U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram5__DOT__mem[26U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram5__DOT__mem[26U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram5__DOT__mem[26U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram5__DOT__i = 0x0000001bU;
    vlSelfRef.nicore__DOT__sram5__DOT__mem[27U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram5__DOT__mem[27U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram5__DOT__mem[27U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram5__DOT__mem[27U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram5__DOT__i = 0x0000001cU;
    vlSelfRef.nicore__DOT__sram5__DOT__mem[28U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram5__DOT__mem[28U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram5__DOT__mem[28U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram5__DOT__mem[28U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram5__DOT__i = 0x0000001dU;
    vlSelfRef.nicore__DOT__sram5__DOT__mem[29U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram5__DOT__mem[29U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram5__DOT__mem[29U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram5__DOT__mem[29U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram5__DOT__i = 0x0000001eU;
    vlSelfRef.nicore__DOT__sram5__DOT__mem[30U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram5__DOT__mem[30U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram5__DOT__mem[30U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram5__DOT__mem[30U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram5__DOT__i = 0x0000001fU;
    vlSelfRef.nicore__DOT__sram5__DOT__mem[31U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram5__DOT__mem[31U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram5__DOT__mem[31U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram5__DOT__mem[31U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram5__DOT__i = 0x00000020U;
    vlSelfRef.nicore__DOT__sram5__DOT__mem[32U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram5__DOT__mem[32U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram5__DOT__mem[32U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram5__DOT__mem[32U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram5__DOT__i = 0x00000021U;
    vlSelfRef.nicore__DOT__sram5__DOT__mem[33U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram5__DOT__mem[33U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram5__DOT__mem[33U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram5__DOT__mem[33U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram5__DOT__i = 0x00000022U;
    vlSelfRef.nicore__DOT__sram5__DOT__mem[34U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram5__DOT__mem[34U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram5__DOT__mem[34U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram5__DOT__mem[34U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram5__DOT__i = 0x00000023U;
    vlSelfRef.nicore__DOT__sram5__DOT__mem[35U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram5__DOT__mem[35U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram5__DOT__mem[35U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram5__DOT__mem[35U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram5__DOT__i = 0x00000024U;
    vlSelfRef.nicore__DOT__sram5__DOT__mem[36U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram5__DOT__mem[36U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram5__DOT__mem[36U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram5__DOT__mem[36U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram5__DOT__i = 0x00000025U;
    vlSelfRef.nicore__DOT__sram5__DOT__mem[37U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram5__DOT__mem[37U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram5__DOT__mem[37U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram5__DOT__mem[37U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram5__DOT__i = 0x00000026U;
    vlSelfRef.nicore__DOT__sram5__DOT__mem[38U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram5__DOT__mem[38U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram5__DOT__mem[38U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram5__DOT__mem[38U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram5__DOT__i = 0x00000027U;
    vlSelfRef.nicore__DOT__sram5__DOT__mem[39U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram5__DOT__mem[39U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram5__DOT__mem[39U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram5__DOT__mem[39U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram5__DOT__i = 0x00000028U;
    vlSelfRef.nicore__DOT__sram5__DOT__mem[40U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram5__DOT__mem[40U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram5__DOT__mem[40U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram5__DOT__mem[40U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram5__DOT__i = 0x00000029U;
    vlSelfRef.nicore__DOT__sram5__DOT__mem[41U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram5__DOT__mem[41U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram5__DOT__mem[41U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram5__DOT__mem[41U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram5__DOT__i = 0x0000002aU;
    vlSelfRef.nicore__DOT__sram5__DOT__mem[42U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram5__DOT__mem[42U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram5__DOT__mem[42U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram5__DOT__mem[42U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram5__DOT__i = 0x0000002bU;
    vlSelfRef.nicore__DOT__sram5__DOT__mem[43U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram5__DOT__mem[43U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram5__DOT__mem[43U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram5__DOT__mem[43U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram5__DOT__i = 0x0000002cU;
    vlSelfRef.nicore__DOT__sram5__DOT__mem[44U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram5__DOT__mem[44U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram5__DOT__mem[44U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram5__DOT__mem[44U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram5__DOT__i = 0x0000002dU;
    vlSelfRef.nicore__DOT__sram5__DOT__mem[45U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram5__DOT__mem[45U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram5__DOT__mem[45U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram5__DOT__mem[45U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram5__DOT__i = 0x0000002eU;
    vlSelfRef.nicore__DOT__sram5__DOT__mem[46U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram5__DOT__mem[46U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram5__DOT__mem[46U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram5__DOT__mem[46U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram5__DOT__i = 0x0000002fU;
    vlSelfRef.nicore__DOT__sram5__DOT__mem[47U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram5__DOT__mem[47U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram5__DOT__mem[47U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram5__DOT__mem[47U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram5__DOT__i = 0x00000030U;
    vlSelfRef.nicore__DOT__sram5__DOT__mem[48U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram5__DOT__mem[48U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram5__DOT__mem[48U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram5__DOT__mem[48U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram5__DOT__i = 0x00000031U;
    vlSelfRef.nicore__DOT__sram5__DOT__mem[49U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram5__DOT__mem[49U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram5__DOT__mem[49U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram5__DOT__mem[49U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram5__DOT__i = 0x00000032U;
    vlSelfRef.nicore__DOT__sram5__DOT__mem[50U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram5__DOT__mem[50U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram5__DOT__mem[50U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram5__DOT__mem[50U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram5__DOT__i = 0x00000033U;
    vlSelfRef.nicore__DOT__sram5__DOT__mem[51U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram5__DOT__mem[51U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram5__DOT__mem[51U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram5__DOT__mem[51U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram5__DOT__i = 0x00000034U;
    vlSelfRef.nicore__DOT__sram5__DOT__mem[52U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram5__DOT__mem[52U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram5__DOT__mem[52U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram5__DOT__mem[52U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram5__DOT__i = 0x00000035U;
    vlSelfRef.nicore__DOT__sram5__DOT__mem[53U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram5__DOT__mem[53U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram5__DOT__mem[53U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram5__DOT__mem[53U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram5__DOT__i = 0x00000036U;
    vlSelfRef.nicore__DOT__sram5__DOT__mem[54U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram5__DOT__mem[54U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram5__DOT__mem[54U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram5__DOT__mem[54U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram5__DOT__i = 0x00000037U;
    vlSelfRef.nicore__DOT__sram5__DOT__mem[55U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram5__DOT__mem[55U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram5__DOT__mem[55U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram5__DOT__mem[55U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram5__DOT__i = 0x00000038U;
    vlSelfRef.nicore__DOT__sram5__DOT__mem[56U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram5__DOT__mem[56U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram5__DOT__mem[56U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram5__DOT__mem[56U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram5__DOT__i = 0x00000039U;
    vlSelfRef.nicore__DOT__sram5__DOT__mem[57U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram5__DOT__mem[57U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram5__DOT__mem[57U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram5__DOT__mem[57U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram5__DOT__i = 0x0000003aU;
    vlSelfRef.nicore__DOT__sram5__DOT__mem[58U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram5__DOT__mem[58U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram5__DOT__mem[58U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram5__DOT__mem[58U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram5__DOT__i = 0x0000003bU;
    vlSelfRef.nicore__DOT__sram5__DOT__mem[59U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram5__DOT__mem[59U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram5__DOT__mem[59U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram5__DOT__mem[59U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram5__DOT__i = 0x0000003cU;
    vlSelfRef.nicore__DOT__sram5__DOT__mem[60U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram5__DOT__mem[60U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram5__DOT__mem[60U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram5__DOT__mem[60U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram5__DOT__i = 0x0000003dU;
    vlSelfRef.nicore__DOT__sram5__DOT__mem[61U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram5__DOT__mem[61U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram5__DOT__mem[61U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram5__DOT__mem[61U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram5__DOT__i = 0x0000003eU;
    vlSelfRef.nicore__DOT__sram5__DOT__mem[62U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram5__DOT__mem[62U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram5__DOT__mem[62U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram5__DOT__mem[62U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram5__DOT__i = 0x0000003fU;
    vlSelfRef.nicore__DOT__sram5__DOT__mem[63U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram5__DOT__mem[63U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram5__DOT__mem[63U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram5__DOT__mem[63U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram5__DOT__i = 0x00000040U;
    vlSelfRef.nicore__DOT__sram5_Q[0U] = 0U;
    vlSelfRef.nicore__DOT__sram5_Q[1U] = 0U;
    vlSelfRef.nicore__DOT__sram5_Q[2U] = 0U;
    vlSelfRef.nicore__DOT__sram5_Q[3U] = 0U;
    vlSelfRef.nicore__DOT__sram4__DOT__i = 0U;
    vlSelfRef.nicore__DOT__sram4__DOT__mem[0U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram4__DOT__mem[0U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram4__DOT__mem[0U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram4__DOT__mem[0U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram4__DOT__i = 1U;
    vlSelfRef.nicore__DOT__sram4__DOT__mem[1U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram4__DOT__mem[1U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram4__DOT__mem[1U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram4__DOT__mem[1U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram4__DOT__i = 2U;
    vlSelfRef.nicore__DOT__sram4__DOT__mem[2U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram4__DOT__mem[2U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram4__DOT__mem[2U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram4__DOT__mem[2U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram4__DOT__i = 3U;
    vlSelfRef.nicore__DOT__sram4__DOT__mem[3U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram4__DOT__mem[3U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram4__DOT__mem[3U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram4__DOT__mem[3U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram4__DOT__i = 4U;
    vlSelfRef.nicore__DOT__sram4__DOT__mem[4U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram4__DOT__mem[4U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram4__DOT__mem[4U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram4__DOT__mem[4U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram4__DOT__i = 5U;
    vlSelfRef.nicore__DOT__sram4__DOT__mem[5U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram4__DOT__mem[5U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram4__DOT__mem[5U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram4__DOT__mem[5U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram4__DOT__i = 6U;
    vlSelfRef.nicore__DOT__sram4__DOT__mem[6U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram4__DOT__mem[6U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram4__DOT__mem[6U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram4__DOT__mem[6U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram4__DOT__i = 7U;
    vlSelfRef.nicore__DOT__sram4__DOT__mem[7U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram4__DOT__mem[7U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram4__DOT__mem[7U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram4__DOT__mem[7U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram4__DOT__i = 8U;
    vlSelfRef.nicore__DOT__sram4__DOT__mem[8U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram4__DOT__mem[8U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram4__DOT__mem[8U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram4__DOT__mem[8U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram4__DOT__i = 9U;
    vlSelfRef.nicore__DOT__sram4__DOT__mem[9U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram4__DOT__mem[9U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram4__DOT__mem[9U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram4__DOT__mem[9U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram4__DOT__i = 0x0000000aU;
    vlSelfRef.nicore__DOT__sram4__DOT__mem[10U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram4__DOT__mem[10U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram4__DOT__mem[10U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram4__DOT__mem[10U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram4__DOT__i = 0x0000000bU;
    vlSelfRef.nicore__DOT__sram4__DOT__mem[11U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram4__DOT__mem[11U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram4__DOT__mem[11U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram4__DOT__mem[11U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram4__DOT__i = 0x0000000cU;
    vlSelfRef.nicore__DOT__sram4__DOT__mem[12U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram4__DOT__mem[12U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram4__DOT__mem[12U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram4__DOT__mem[12U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram4__DOT__i = 0x0000000dU;
    vlSelfRef.nicore__DOT__sram4__DOT__mem[13U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram4__DOT__mem[13U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram4__DOT__mem[13U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram4__DOT__mem[13U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram4__DOT__i = 0x0000000eU;
    vlSelfRef.nicore__DOT__sram4__DOT__mem[14U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram4__DOT__mem[14U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram4__DOT__mem[14U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram4__DOT__mem[14U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram4__DOT__i = 0x0000000fU;
    vlSelfRef.nicore__DOT__sram4__DOT__mem[15U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram4__DOT__mem[15U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram4__DOT__mem[15U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram4__DOT__mem[15U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram4__DOT__i = 0x00000010U;
    vlSelfRef.nicore__DOT__sram4__DOT__mem[16U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram4__DOT__mem[16U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram4__DOT__mem[16U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram4__DOT__mem[16U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram4__DOT__i = 0x00000011U;
    vlSelfRef.nicore__DOT__sram4__DOT__mem[17U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram4__DOT__mem[17U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram4__DOT__mem[17U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram4__DOT__mem[17U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram4__DOT__i = 0x00000012U;
    vlSelfRef.nicore__DOT__sram4__DOT__mem[18U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram4__DOT__mem[18U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram4__DOT__mem[18U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram4__DOT__mem[18U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram4__DOT__i = 0x00000013U;
    vlSelfRef.nicore__DOT__sram4__DOT__mem[19U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram4__DOT__mem[19U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram4__DOT__mem[19U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram4__DOT__mem[19U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram4__DOT__i = 0x00000014U;
    vlSelfRef.nicore__DOT__sram4__DOT__mem[20U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram4__DOT__mem[20U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram4__DOT__mem[20U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram4__DOT__mem[20U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram4__DOT__i = 0x00000015U;
    vlSelfRef.nicore__DOT__sram4__DOT__mem[21U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram4__DOT__mem[21U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram4__DOT__mem[21U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram4__DOT__mem[21U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram4__DOT__i = 0x00000016U;
    vlSelfRef.nicore__DOT__sram4__DOT__mem[22U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram4__DOT__mem[22U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram4__DOT__mem[22U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram4__DOT__mem[22U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram4__DOT__i = 0x00000017U;
    vlSelfRef.nicore__DOT__sram4__DOT__mem[23U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram4__DOT__mem[23U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram4__DOT__mem[23U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram4__DOT__mem[23U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram4__DOT__i = 0x00000018U;
    vlSelfRef.nicore__DOT__sram4__DOT__mem[24U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram4__DOT__mem[24U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram4__DOT__mem[24U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram4__DOT__mem[24U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram4__DOT__i = 0x00000019U;
    vlSelfRef.nicore__DOT__sram4__DOT__mem[25U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram4__DOT__mem[25U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram4__DOT__mem[25U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram4__DOT__mem[25U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram4__DOT__i = 0x0000001aU;
    vlSelfRef.nicore__DOT__sram4__DOT__mem[26U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram4__DOT__mem[26U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram4__DOT__mem[26U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram4__DOT__mem[26U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram4__DOT__i = 0x0000001bU;
    vlSelfRef.nicore__DOT__sram4__DOT__mem[27U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram4__DOT__mem[27U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram4__DOT__mem[27U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram4__DOT__mem[27U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram4__DOT__i = 0x0000001cU;
    vlSelfRef.nicore__DOT__sram4__DOT__mem[28U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram4__DOT__mem[28U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram4__DOT__mem[28U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram4__DOT__mem[28U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram4__DOT__i = 0x0000001dU;
    vlSelfRef.nicore__DOT__sram4__DOT__mem[29U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram4__DOT__mem[29U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram4__DOT__mem[29U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram4__DOT__mem[29U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram4__DOT__i = 0x0000001eU;
    vlSelfRef.nicore__DOT__sram4__DOT__mem[30U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram4__DOT__mem[30U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram4__DOT__mem[30U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram4__DOT__mem[30U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram4__DOT__i = 0x0000001fU;
    vlSelfRef.nicore__DOT__sram4__DOT__mem[31U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram4__DOT__mem[31U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram4__DOT__mem[31U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram4__DOT__mem[31U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram4__DOT__i = 0x00000020U;
    vlSelfRef.nicore__DOT__sram4__DOT__mem[32U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram4__DOT__mem[32U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram4__DOT__mem[32U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram4__DOT__mem[32U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram4__DOT__i = 0x00000021U;
    vlSelfRef.nicore__DOT__sram4__DOT__mem[33U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram4__DOT__mem[33U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram4__DOT__mem[33U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram4__DOT__mem[33U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram4__DOT__i = 0x00000022U;
    vlSelfRef.nicore__DOT__sram4__DOT__mem[34U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram4__DOT__mem[34U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram4__DOT__mem[34U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram4__DOT__mem[34U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram4__DOT__i = 0x00000023U;
    vlSelfRef.nicore__DOT__sram4__DOT__mem[35U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram4__DOT__mem[35U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram4__DOT__mem[35U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram4__DOT__mem[35U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram4__DOT__i = 0x00000024U;
    vlSelfRef.nicore__DOT__sram4__DOT__mem[36U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram4__DOT__mem[36U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram4__DOT__mem[36U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram4__DOT__mem[36U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram4__DOT__i = 0x00000025U;
    vlSelfRef.nicore__DOT__sram4__DOT__mem[37U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram4__DOT__mem[37U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram4__DOT__mem[37U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram4__DOT__mem[37U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram4__DOT__i = 0x00000026U;
    vlSelfRef.nicore__DOT__sram4__DOT__mem[38U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram4__DOT__mem[38U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram4__DOT__mem[38U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram4__DOT__mem[38U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram4__DOT__i = 0x00000027U;
    vlSelfRef.nicore__DOT__sram4__DOT__mem[39U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram4__DOT__mem[39U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram4__DOT__mem[39U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram4__DOT__mem[39U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram4__DOT__i = 0x00000028U;
    vlSelfRef.nicore__DOT__sram4__DOT__mem[40U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram4__DOT__mem[40U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram4__DOT__mem[40U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram4__DOT__mem[40U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram4__DOT__i = 0x00000029U;
    vlSelfRef.nicore__DOT__sram4__DOT__mem[41U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram4__DOT__mem[41U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram4__DOT__mem[41U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram4__DOT__mem[41U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram4__DOT__i = 0x0000002aU;
    vlSelfRef.nicore__DOT__sram4__DOT__mem[42U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram4__DOT__mem[42U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram4__DOT__mem[42U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram4__DOT__mem[42U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram4__DOT__i = 0x0000002bU;
    vlSelfRef.nicore__DOT__sram4__DOT__mem[43U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram4__DOT__mem[43U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram4__DOT__mem[43U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram4__DOT__mem[43U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram4__DOT__i = 0x0000002cU;
    vlSelfRef.nicore__DOT__sram4__DOT__mem[44U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram4__DOT__mem[44U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram4__DOT__mem[44U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram4__DOT__mem[44U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram4__DOT__i = 0x0000002dU;
    vlSelfRef.nicore__DOT__sram4__DOT__mem[45U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram4__DOT__mem[45U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram4__DOT__mem[45U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram4__DOT__mem[45U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram4__DOT__i = 0x0000002eU;
    vlSelfRef.nicore__DOT__sram4__DOT__mem[46U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram4__DOT__mem[46U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram4__DOT__mem[46U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram4__DOT__mem[46U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram4__DOT__i = 0x0000002fU;
    vlSelfRef.nicore__DOT__sram4__DOT__mem[47U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram4__DOT__mem[47U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram4__DOT__mem[47U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram4__DOT__mem[47U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram4__DOT__i = 0x00000030U;
    vlSelfRef.nicore__DOT__sram4__DOT__mem[48U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram4__DOT__mem[48U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram4__DOT__mem[48U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram4__DOT__mem[48U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram4__DOT__i = 0x00000031U;
    vlSelfRef.nicore__DOT__sram4__DOT__mem[49U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram4__DOT__mem[49U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram4__DOT__mem[49U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram4__DOT__mem[49U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram4__DOT__i = 0x00000032U;
    vlSelfRef.nicore__DOT__sram4__DOT__mem[50U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram4__DOT__mem[50U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram4__DOT__mem[50U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram4__DOT__mem[50U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram4__DOT__i = 0x00000033U;
    vlSelfRef.nicore__DOT__sram4__DOT__mem[51U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram4__DOT__mem[51U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram4__DOT__mem[51U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram4__DOT__mem[51U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram4__DOT__i = 0x00000034U;
    vlSelfRef.nicore__DOT__sram4__DOT__mem[52U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram4__DOT__mem[52U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram4__DOT__mem[52U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram4__DOT__mem[52U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram4__DOT__i = 0x00000035U;
    vlSelfRef.nicore__DOT__sram4__DOT__mem[53U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram4__DOT__mem[53U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram4__DOT__mem[53U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram4__DOT__mem[53U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram4__DOT__i = 0x00000036U;
    vlSelfRef.nicore__DOT__sram4__DOT__mem[54U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram4__DOT__mem[54U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram4__DOT__mem[54U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram4__DOT__mem[54U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram4__DOT__i = 0x00000037U;
    vlSelfRef.nicore__DOT__sram4__DOT__mem[55U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram4__DOT__mem[55U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram4__DOT__mem[55U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram4__DOT__mem[55U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram4__DOT__i = 0x00000038U;
    vlSelfRef.nicore__DOT__sram4__DOT__mem[56U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram4__DOT__mem[56U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram4__DOT__mem[56U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram4__DOT__mem[56U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram4__DOT__i = 0x00000039U;
    vlSelfRef.nicore__DOT__sram4__DOT__mem[57U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram4__DOT__mem[57U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram4__DOT__mem[57U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram4__DOT__mem[57U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram4__DOT__i = 0x0000003aU;
    vlSelfRef.nicore__DOT__sram4__DOT__mem[58U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram4__DOT__mem[58U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram4__DOT__mem[58U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram4__DOT__mem[58U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram4__DOT__i = 0x0000003bU;
    vlSelfRef.nicore__DOT__sram4__DOT__mem[59U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram4__DOT__mem[59U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram4__DOT__mem[59U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram4__DOT__mem[59U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram4__DOT__i = 0x0000003cU;
    vlSelfRef.nicore__DOT__sram4__DOT__mem[60U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram4__DOT__mem[60U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram4__DOT__mem[60U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram4__DOT__mem[60U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram4__DOT__i = 0x0000003dU;
    vlSelfRef.nicore__DOT__sram4__DOT__mem[61U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram4__DOT__mem[61U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram4__DOT__mem[61U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram4__DOT__mem[61U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram4__DOT__i = 0x0000003eU;
    vlSelfRef.nicore__DOT__sram4__DOT__mem[62U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram4__DOT__mem[62U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram4__DOT__mem[62U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram4__DOT__mem[62U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram4__DOT__i = 0x0000003fU;
    vlSelfRef.nicore__DOT__sram4__DOT__mem[63U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram4__DOT__mem[63U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram4__DOT__mem[63U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram4__DOT__mem[63U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram4__DOT__i = 0x00000040U;
    vlSelfRef.nicore__DOT__sram4_Q[0U] = 0U;
    vlSelfRef.nicore__DOT__sram4_Q[1U] = 0U;
    vlSelfRef.nicore__DOT__sram4_Q[2U] = 0U;
    vlSelfRef.nicore__DOT__sram4_Q[3U] = 0U;
    vlSelfRef.nicore__DOT__sram3__DOT__i = 0U;
    vlSelfRef.nicore__DOT__sram3__DOT__mem[0U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram3__DOT__mem[0U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram3__DOT__mem[0U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram3__DOT__mem[0U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram3__DOT__i = 1U;
    vlSelfRef.nicore__DOT__sram3__DOT__mem[1U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram3__DOT__mem[1U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram3__DOT__mem[1U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram3__DOT__mem[1U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram3__DOT__i = 2U;
    vlSelfRef.nicore__DOT__sram3__DOT__mem[2U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram3__DOT__mem[2U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram3__DOT__mem[2U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram3__DOT__mem[2U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram3__DOT__i = 3U;
    vlSelfRef.nicore__DOT__sram3__DOT__mem[3U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram3__DOT__mem[3U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram3__DOT__mem[3U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram3__DOT__mem[3U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram3__DOT__i = 4U;
    vlSelfRef.nicore__DOT__sram3__DOT__mem[4U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram3__DOT__mem[4U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram3__DOT__mem[4U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram3__DOT__mem[4U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram3__DOT__i = 5U;
    vlSelfRef.nicore__DOT__sram3__DOT__mem[5U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram3__DOT__mem[5U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram3__DOT__mem[5U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram3__DOT__mem[5U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram3__DOT__i = 6U;
    vlSelfRef.nicore__DOT__sram3__DOT__mem[6U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram3__DOT__mem[6U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram3__DOT__mem[6U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram3__DOT__mem[6U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram3__DOT__i = 7U;
    vlSelfRef.nicore__DOT__sram3__DOT__mem[7U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram3__DOT__mem[7U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram3__DOT__mem[7U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram3__DOT__mem[7U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram3__DOT__i = 8U;
    vlSelfRef.nicore__DOT__sram3__DOT__mem[8U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram3__DOT__mem[8U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram3__DOT__mem[8U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram3__DOT__mem[8U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram3__DOT__i = 9U;
    vlSelfRef.nicore__DOT__sram3__DOT__mem[9U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram3__DOT__mem[9U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram3__DOT__mem[9U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram3__DOT__mem[9U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram3__DOT__i = 0x0000000aU;
    vlSelfRef.nicore__DOT__sram3__DOT__mem[10U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram3__DOT__mem[10U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram3__DOT__mem[10U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram3__DOT__mem[10U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram3__DOT__i = 0x0000000bU;
    vlSelfRef.nicore__DOT__sram3__DOT__mem[11U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram3__DOT__mem[11U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram3__DOT__mem[11U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram3__DOT__mem[11U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram3__DOT__i = 0x0000000cU;
    vlSelfRef.nicore__DOT__sram3__DOT__mem[12U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram3__DOT__mem[12U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram3__DOT__mem[12U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram3__DOT__mem[12U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram3__DOT__i = 0x0000000dU;
    vlSelfRef.nicore__DOT__sram3__DOT__mem[13U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram3__DOT__mem[13U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram3__DOT__mem[13U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram3__DOT__mem[13U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram3__DOT__i = 0x0000000eU;
    vlSelfRef.nicore__DOT__sram3__DOT__mem[14U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram3__DOT__mem[14U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram3__DOT__mem[14U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram3__DOT__mem[14U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram3__DOT__i = 0x0000000fU;
    vlSelfRef.nicore__DOT__sram3__DOT__mem[15U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram3__DOT__mem[15U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram3__DOT__mem[15U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram3__DOT__mem[15U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram3__DOT__i = 0x00000010U;
    vlSelfRef.nicore__DOT__sram3__DOT__mem[16U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram3__DOT__mem[16U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram3__DOT__mem[16U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram3__DOT__mem[16U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram3__DOT__i = 0x00000011U;
    vlSelfRef.nicore__DOT__sram3__DOT__mem[17U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram3__DOT__mem[17U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram3__DOT__mem[17U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram3__DOT__mem[17U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram3__DOT__i = 0x00000012U;
    vlSelfRef.nicore__DOT__sram3__DOT__mem[18U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram3__DOT__mem[18U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram3__DOT__mem[18U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram3__DOT__mem[18U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram3__DOT__i = 0x00000013U;
    vlSelfRef.nicore__DOT__sram3__DOT__mem[19U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram3__DOT__mem[19U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram3__DOT__mem[19U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram3__DOT__mem[19U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram3__DOT__i = 0x00000014U;
    vlSelfRef.nicore__DOT__sram3__DOT__mem[20U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram3__DOT__mem[20U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram3__DOT__mem[20U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram3__DOT__mem[20U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram3__DOT__i = 0x00000015U;
    vlSelfRef.nicore__DOT__sram3__DOT__mem[21U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram3__DOT__mem[21U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram3__DOT__mem[21U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram3__DOT__mem[21U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram3__DOT__i = 0x00000016U;
    vlSelfRef.nicore__DOT__sram3__DOT__mem[22U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram3__DOT__mem[22U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram3__DOT__mem[22U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram3__DOT__mem[22U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram3__DOT__i = 0x00000017U;
    vlSelfRef.nicore__DOT__sram3__DOT__mem[23U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram3__DOT__mem[23U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram3__DOT__mem[23U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram3__DOT__mem[23U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram3__DOT__i = 0x00000018U;
    vlSelfRef.nicore__DOT__sram3__DOT__mem[24U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram3__DOT__mem[24U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram3__DOT__mem[24U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram3__DOT__mem[24U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram3__DOT__i = 0x00000019U;
    vlSelfRef.nicore__DOT__sram3__DOT__mem[25U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram3__DOT__mem[25U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram3__DOT__mem[25U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram3__DOT__mem[25U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram3__DOT__i = 0x0000001aU;
    vlSelfRef.nicore__DOT__sram3__DOT__mem[26U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram3__DOT__mem[26U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram3__DOT__mem[26U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram3__DOT__mem[26U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram3__DOT__i = 0x0000001bU;
    vlSelfRef.nicore__DOT__sram3__DOT__mem[27U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram3__DOT__mem[27U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram3__DOT__mem[27U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram3__DOT__mem[27U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram3__DOT__i = 0x0000001cU;
    vlSelfRef.nicore__DOT__sram3__DOT__mem[28U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram3__DOT__mem[28U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram3__DOT__mem[28U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram3__DOT__mem[28U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram3__DOT__i = 0x0000001dU;
    vlSelfRef.nicore__DOT__sram3__DOT__mem[29U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram3__DOT__mem[29U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram3__DOT__mem[29U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram3__DOT__mem[29U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram3__DOT__i = 0x0000001eU;
    vlSelfRef.nicore__DOT__sram3__DOT__mem[30U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram3__DOT__mem[30U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram3__DOT__mem[30U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram3__DOT__mem[30U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram3__DOT__i = 0x0000001fU;
    vlSelfRef.nicore__DOT__sram3__DOT__mem[31U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram3__DOT__mem[31U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram3__DOT__mem[31U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram3__DOT__mem[31U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram3__DOT__i = 0x00000020U;
    vlSelfRef.nicore__DOT__sram3__DOT__mem[32U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram3__DOT__mem[32U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram3__DOT__mem[32U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram3__DOT__mem[32U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram3__DOT__i = 0x00000021U;
    vlSelfRef.nicore__DOT__sram3__DOT__mem[33U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram3__DOT__mem[33U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram3__DOT__mem[33U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram3__DOT__mem[33U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram3__DOT__i = 0x00000022U;
    vlSelfRef.nicore__DOT__sram3__DOT__mem[34U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram3__DOT__mem[34U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram3__DOT__mem[34U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram3__DOT__mem[34U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram3__DOT__i = 0x00000023U;
    vlSelfRef.nicore__DOT__sram3__DOT__mem[35U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram3__DOT__mem[35U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram3__DOT__mem[35U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram3__DOT__mem[35U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram3__DOT__i = 0x00000024U;
    vlSelfRef.nicore__DOT__sram3__DOT__mem[36U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram3__DOT__mem[36U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram3__DOT__mem[36U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram3__DOT__mem[36U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram3__DOT__i = 0x00000025U;
    vlSelfRef.nicore__DOT__sram3__DOT__mem[37U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram3__DOT__mem[37U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram3__DOT__mem[37U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram3__DOT__mem[37U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram3__DOT__i = 0x00000026U;
    vlSelfRef.nicore__DOT__sram3__DOT__mem[38U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram3__DOT__mem[38U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram3__DOT__mem[38U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram3__DOT__mem[38U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram3__DOT__i = 0x00000027U;
    vlSelfRef.nicore__DOT__sram3__DOT__mem[39U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram3__DOT__mem[39U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram3__DOT__mem[39U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram3__DOT__mem[39U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram3__DOT__i = 0x00000028U;
    vlSelfRef.nicore__DOT__sram3__DOT__mem[40U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram3__DOT__mem[40U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram3__DOT__mem[40U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram3__DOT__mem[40U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram3__DOT__i = 0x00000029U;
    vlSelfRef.nicore__DOT__sram3__DOT__mem[41U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram3__DOT__mem[41U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram3__DOT__mem[41U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram3__DOT__mem[41U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram3__DOT__i = 0x0000002aU;
    vlSelfRef.nicore__DOT__sram3__DOT__mem[42U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram3__DOT__mem[42U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram3__DOT__mem[42U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram3__DOT__mem[42U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram3__DOT__i = 0x0000002bU;
    vlSelfRef.nicore__DOT__sram3__DOT__mem[43U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram3__DOT__mem[43U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram3__DOT__mem[43U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram3__DOT__mem[43U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram3__DOT__i = 0x0000002cU;
    vlSelfRef.nicore__DOT__sram3__DOT__mem[44U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram3__DOT__mem[44U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram3__DOT__mem[44U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram3__DOT__mem[44U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram3__DOT__i = 0x0000002dU;
    vlSelfRef.nicore__DOT__sram3__DOT__mem[45U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram3__DOT__mem[45U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram3__DOT__mem[45U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram3__DOT__mem[45U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram3__DOT__i = 0x0000002eU;
    vlSelfRef.nicore__DOT__sram3__DOT__mem[46U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram3__DOT__mem[46U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram3__DOT__mem[46U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram3__DOT__mem[46U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram3__DOT__i = 0x0000002fU;
    vlSelfRef.nicore__DOT__sram3__DOT__mem[47U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram3__DOT__mem[47U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram3__DOT__mem[47U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram3__DOT__mem[47U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram3__DOT__i = 0x00000030U;
    vlSelfRef.nicore__DOT__sram3__DOT__mem[48U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram3__DOT__mem[48U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram3__DOT__mem[48U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram3__DOT__mem[48U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram3__DOT__i = 0x00000031U;
    vlSelfRef.nicore__DOT__sram3__DOT__mem[49U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram3__DOT__mem[49U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram3__DOT__mem[49U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram3__DOT__mem[49U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram3__DOT__i = 0x00000032U;
    vlSelfRef.nicore__DOT__sram3__DOT__mem[50U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram3__DOT__mem[50U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram3__DOT__mem[50U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram3__DOT__mem[50U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram3__DOT__i = 0x00000033U;
    vlSelfRef.nicore__DOT__sram3__DOT__mem[51U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram3__DOT__mem[51U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram3__DOT__mem[51U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram3__DOT__mem[51U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram3__DOT__i = 0x00000034U;
    vlSelfRef.nicore__DOT__sram3__DOT__mem[52U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram3__DOT__mem[52U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram3__DOT__mem[52U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram3__DOT__mem[52U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram3__DOT__i = 0x00000035U;
    vlSelfRef.nicore__DOT__sram3__DOT__mem[53U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram3__DOT__mem[53U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram3__DOT__mem[53U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram3__DOT__mem[53U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram3__DOT__i = 0x00000036U;
    vlSelfRef.nicore__DOT__sram3__DOT__mem[54U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram3__DOT__mem[54U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram3__DOT__mem[54U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram3__DOT__mem[54U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram3__DOT__i = 0x00000037U;
    vlSelfRef.nicore__DOT__sram3__DOT__mem[55U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram3__DOT__mem[55U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram3__DOT__mem[55U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram3__DOT__mem[55U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram3__DOT__i = 0x00000038U;
    vlSelfRef.nicore__DOT__sram3__DOT__mem[56U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram3__DOT__mem[56U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram3__DOT__mem[56U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram3__DOT__mem[56U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram3__DOT__i = 0x00000039U;
    vlSelfRef.nicore__DOT__sram3__DOT__mem[57U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram3__DOT__mem[57U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram3__DOT__mem[57U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram3__DOT__mem[57U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram3__DOT__i = 0x0000003aU;
    vlSelfRef.nicore__DOT__sram3__DOT__mem[58U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram3__DOT__mem[58U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram3__DOT__mem[58U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram3__DOT__mem[58U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram3__DOT__i = 0x0000003bU;
    vlSelfRef.nicore__DOT__sram3__DOT__mem[59U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram3__DOT__mem[59U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram3__DOT__mem[59U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram3__DOT__mem[59U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram3__DOT__i = 0x0000003cU;
    vlSelfRef.nicore__DOT__sram3__DOT__mem[60U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram3__DOT__mem[60U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram3__DOT__mem[60U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram3__DOT__mem[60U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram3__DOT__i = 0x0000003dU;
    vlSelfRef.nicore__DOT__sram3__DOT__mem[61U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram3__DOT__mem[61U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram3__DOT__mem[61U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram3__DOT__mem[61U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram3__DOT__i = 0x0000003eU;
    vlSelfRef.nicore__DOT__sram3__DOT__mem[62U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram3__DOT__mem[62U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram3__DOT__mem[62U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram3__DOT__mem[62U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram3__DOT__i = 0x0000003fU;
    vlSelfRef.nicore__DOT__sram3__DOT__mem[63U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram3__DOT__mem[63U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram3__DOT__mem[63U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram3__DOT__mem[63U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram3__DOT__i = 0x00000040U;
    vlSelfRef.nicore__DOT__sram3_Q[0U] = 0U;
    vlSelfRef.nicore__DOT__sram3_Q[1U] = 0U;
    vlSelfRef.nicore__DOT__sram3_Q[2U] = 0U;
    vlSelfRef.nicore__DOT__sram3_Q[3U] = 0U;
    vlSelfRef.nicore__DOT__sram2__DOT__i = 0U;
    vlSelfRef.nicore__DOT__sram2__DOT__mem[0U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram2__DOT__mem[0U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram2__DOT__mem[0U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram2__DOT__mem[0U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram2__DOT__i = 1U;
    vlSelfRef.nicore__DOT__sram2__DOT__mem[1U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram2__DOT__mem[1U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram2__DOT__mem[1U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram2__DOT__mem[1U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram2__DOT__i = 2U;
    vlSelfRef.nicore__DOT__sram2__DOT__mem[2U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram2__DOT__mem[2U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram2__DOT__mem[2U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram2__DOT__mem[2U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram2__DOT__i = 3U;
    vlSelfRef.nicore__DOT__sram2__DOT__mem[3U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram2__DOT__mem[3U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram2__DOT__mem[3U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram2__DOT__mem[3U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram2__DOT__i = 4U;
    vlSelfRef.nicore__DOT__sram2__DOT__mem[4U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram2__DOT__mem[4U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram2__DOT__mem[4U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram2__DOT__mem[4U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram2__DOT__i = 5U;
    vlSelfRef.nicore__DOT__sram2__DOT__mem[5U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram2__DOT__mem[5U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram2__DOT__mem[5U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram2__DOT__mem[5U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram2__DOT__i = 6U;
    vlSelfRef.nicore__DOT__sram2__DOT__mem[6U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram2__DOT__mem[6U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram2__DOT__mem[6U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram2__DOT__mem[6U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram2__DOT__i = 7U;
    vlSelfRef.nicore__DOT__sram2__DOT__mem[7U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram2__DOT__mem[7U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram2__DOT__mem[7U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram2__DOT__mem[7U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram2__DOT__i = 8U;
    vlSelfRef.nicore__DOT__sram2__DOT__mem[8U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram2__DOT__mem[8U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram2__DOT__mem[8U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram2__DOT__mem[8U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram2__DOT__i = 9U;
    vlSelfRef.nicore__DOT__sram2__DOT__mem[9U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram2__DOT__mem[9U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram2__DOT__mem[9U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram2__DOT__mem[9U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram2__DOT__i = 0x0000000aU;
    vlSelfRef.nicore__DOT__sram2__DOT__mem[10U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram2__DOT__mem[10U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram2__DOT__mem[10U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram2__DOT__mem[10U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram2__DOT__i = 0x0000000bU;
    vlSelfRef.nicore__DOT__sram2__DOT__mem[11U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram2__DOT__mem[11U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram2__DOT__mem[11U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram2__DOT__mem[11U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram2__DOT__i = 0x0000000cU;
    vlSelfRef.nicore__DOT__sram2__DOT__mem[12U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram2__DOT__mem[12U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram2__DOT__mem[12U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram2__DOT__mem[12U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram2__DOT__i = 0x0000000dU;
    vlSelfRef.nicore__DOT__sram2__DOT__mem[13U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram2__DOT__mem[13U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram2__DOT__mem[13U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram2__DOT__mem[13U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram2__DOT__i = 0x0000000eU;
    vlSelfRef.nicore__DOT__sram2__DOT__mem[14U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram2__DOT__mem[14U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram2__DOT__mem[14U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram2__DOT__mem[14U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram2__DOT__i = 0x0000000fU;
    vlSelfRef.nicore__DOT__sram2__DOT__mem[15U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram2__DOT__mem[15U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram2__DOT__mem[15U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram2__DOT__mem[15U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram2__DOT__i = 0x00000010U;
    vlSelfRef.nicore__DOT__sram2__DOT__mem[16U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram2__DOT__mem[16U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram2__DOT__mem[16U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram2__DOT__mem[16U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram2__DOT__i = 0x00000011U;
    vlSelfRef.nicore__DOT__sram2__DOT__mem[17U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram2__DOT__mem[17U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram2__DOT__mem[17U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram2__DOT__mem[17U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram2__DOT__i = 0x00000012U;
    vlSelfRef.nicore__DOT__sram2__DOT__mem[18U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram2__DOT__mem[18U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram2__DOT__mem[18U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram2__DOT__mem[18U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram2__DOT__i = 0x00000013U;
    vlSelfRef.nicore__DOT__sram2__DOT__mem[19U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram2__DOT__mem[19U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram2__DOT__mem[19U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram2__DOT__mem[19U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram2__DOT__i = 0x00000014U;
    vlSelfRef.nicore__DOT__sram2__DOT__mem[20U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram2__DOT__mem[20U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram2__DOT__mem[20U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram2__DOT__mem[20U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram2__DOT__i = 0x00000015U;
    vlSelfRef.nicore__DOT__sram2__DOT__mem[21U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram2__DOT__mem[21U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram2__DOT__mem[21U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram2__DOT__mem[21U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram2__DOT__i = 0x00000016U;
    vlSelfRef.nicore__DOT__sram2__DOT__mem[22U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram2__DOT__mem[22U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram2__DOT__mem[22U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram2__DOT__mem[22U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram2__DOT__i = 0x00000017U;
    vlSelfRef.nicore__DOT__sram2__DOT__mem[23U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram2__DOT__mem[23U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram2__DOT__mem[23U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram2__DOT__mem[23U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram2__DOT__i = 0x00000018U;
    vlSelfRef.nicore__DOT__sram2__DOT__mem[24U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram2__DOT__mem[24U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram2__DOT__mem[24U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram2__DOT__mem[24U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram2__DOT__i = 0x00000019U;
    vlSelfRef.nicore__DOT__sram2__DOT__mem[25U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram2__DOT__mem[25U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram2__DOT__mem[25U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram2__DOT__mem[25U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram2__DOT__i = 0x0000001aU;
    vlSelfRef.nicore__DOT__sram2__DOT__mem[26U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram2__DOT__mem[26U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram2__DOT__mem[26U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram2__DOT__mem[26U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram2__DOT__i = 0x0000001bU;
    vlSelfRef.nicore__DOT__sram2__DOT__mem[27U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram2__DOT__mem[27U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram2__DOT__mem[27U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram2__DOT__mem[27U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram2__DOT__i = 0x0000001cU;
    vlSelfRef.nicore__DOT__sram2__DOT__mem[28U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram2__DOT__mem[28U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram2__DOT__mem[28U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram2__DOT__mem[28U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram2__DOT__i = 0x0000001dU;
    vlSelfRef.nicore__DOT__sram2__DOT__mem[29U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram2__DOT__mem[29U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram2__DOT__mem[29U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram2__DOT__mem[29U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram2__DOT__i = 0x0000001eU;
    vlSelfRef.nicore__DOT__sram2__DOT__mem[30U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram2__DOT__mem[30U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram2__DOT__mem[30U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram2__DOT__mem[30U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram2__DOT__i = 0x0000001fU;
    vlSelfRef.nicore__DOT__sram2__DOT__mem[31U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram2__DOT__mem[31U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram2__DOT__mem[31U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram2__DOT__mem[31U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram2__DOT__i = 0x00000020U;
    vlSelfRef.nicore__DOT__sram2__DOT__mem[32U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram2__DOT__mem[32U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram2__DOT__mem[32U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram2__DOT__mem[32U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram2__DOT__i = 0x00000021U;
    vlSelfRef.nicore__DOT__sram2__DOT__mem[33U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram2__DOT__mem[33U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram2__DOT__mem[33U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram2__DOT__mem[33U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram2__DOT__i = 0x00000022U;
    vlSelfRef.nicore__DOT__sram2__DOT__mem[34U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram2__DOT__mem[34U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram2__DOT__mem[34U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram2__DOT__mem[34U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram2__DOT__i = 0x00000023U;
    vlSelfRef.nicore__DOT__sram2__DOT__mem[35U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram2__DOT__mem[35U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram2__DOT__mem[35U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram2__DOT__mem[35U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram2__DOT__i = 0x00000024U;
    vlSelfRef.nicore__DOT__sram2__DOT__mem[36U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram2__DOT__mem[36U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram2__DOT__mem[36U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram2__DOT__mem[36U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram2__DOT__i = 0x00000025U;
    vlSelfRef.nicore__DOT__sram2__DOT__mem[37U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram2__DOT__mem[37U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram2__DOT__mem[37U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram2__DOT__mem[37U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram2__DOT__i = 0x00000026U;
    vlSelfRef.nicore__DOT__sram2__DOT__mem[38U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram2__DOT__mem[38U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram2__DOT__mem[38U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram2__DOT__mem[38U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram2__DOT__i = 0x00000027U;
    vlSelfRef.nicore__DOT__sram2__DOT__mem[39U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram2__DOT__mem[39U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram2__DOT__mem[39U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram2__DOT__mem[39U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram2__DOT__i = 0x00000028U;
    vlSelfRef.nicore__DOT__sram2__DOT__mem[40U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram2__DOT__mem[40U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram2__DOT__mem[40U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram2__DOT__mem[40U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram2__DOT__i = 0x00000029U;
    vlSelfRef.nicore__DOT__sram2__DOT__mem[41U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram2__DOT__mem[41U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram2__DOT__mem[41U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram2__DOT__mem[41U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram2__DOT__i = 0x0000002aU;
    vlSelfRef.nicore__DOT__sram2__DOT__mem[42U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram2__DOT__mem[42U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram2__DOT__mem[42U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram2__DOT__mem[42U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram2__DOT__i = 0x0000002bU;
    vlSelfRef.nicore__DOT__sram2__DOT__mem[43U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram2__DOT__mem[43U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram2__DOT__mem[43U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram2__DOT__mem[43U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram2__DOT__i = 0x0000002cU;
    vlSelfRef.nicore__DOT__sram2__DOT__mem[44U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram2__DOT__mem[44U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram2__DOT__mem[44U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram2__DOT__mem[44U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram2__DOT__i = 0x0000002dU;
    vlSelfRef.nicore__DOT__sram2__DOT__mem[45U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram2__DOT__mem[45U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram2__DOT__mem[45U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram2__DOT__mem[45U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram2__DOT__i = 0x0000002eU;
    vlSelfRef.nicore__DOT__sram2__DOT__mem[46U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram2__DOT__mem[46U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram2__DOT__mem[46U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram2__DOT__mem[46U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram2__DOT__i = 0x0000002fU;
    vlSelfRef.nicore__DOT__sram2__DOT__mem[47U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram2__DOT__mem[47U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram2__DOT__mem[47U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram2__DOT__mem[47U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram2__DOT__i = 0x00000030U;
    vlSelfRef.nicore__DOT__sram2__DOT__mem[48U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram2__DOT__mem[48U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram2__DOT__mem[48U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram2__DOT__mem[48U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram2__DOT__i = 0x00000031U;
    vlSelfRef.nicore__DOT__sram2__DOT__mem[49U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram2__DOT__mem[49U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram2__DOT__mem[49U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram2__DOT__mem[49U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram2__DOT__i = 0x00000032U;
    vlSelfRef.nicore__DOT__sram2__DOT__mem[50U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram2__DOT__mem[50U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram2__DOT__mem[50U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram2__DOT__mem[50U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram2__DOT__i = 0x00000033U;
    vlSelfRef.nicore__DOT__sram2__DOT__mem[51U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram2__DOT__mem[51U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram2__DOT__mem[51U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram2__DOT__mem[51U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram2__DOT__i = 0x00000034U;
    vlSelfRef.nicore__DOT__sram2__DOT__mem[52U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram2__DOT__mem[52U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram2__DOT__mem[52U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram2__DOT__mem[52U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram2__DOT__i = 0x00000035U;
    vlSelfRef.nicore__DOT__sram2__DOT__mem[53U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram2__DOT__mem[53U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram2__DOT__mem[53U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram2__DOT__mem[53U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram2__DOT__i = 0x00000036U;
    vlSelfRef.nicore__DOT__sram2__DOT__mem[54U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram2__DOT__mem[54U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram2__DOT__mem[54U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram2__DOT__mem[54U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram2__DOT__i = 0x00000037U;
    vlSelfRef.nicore__DOT__sram2__DOT__mem[55U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram2__DOT__mem[55U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram2__DOT__mem[55U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram2__DOT__mem[55U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram2__DOT__i = 0x00000038U;
    vlSelfRef.nicore__DOT__sram2__DOT__mem[56U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram2__DOT__mem[56U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram2__DOT__mem[56U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram2__DOT__mem[56U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram2__DOT__i = 0x00000039U;
    vlSelfRef.nicore__DOT__sram2__DOT__mem[57U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram2__DOT__mem[57U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram2__DOT__mem[57U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram2__DOT__mem[57U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram2__DOT__i = 0x0000003aU;
    vlSelfRef.nicore__DOT__sram2__DOT__mem[58U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram2__DOT__mem[58U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram2__DOT__mem[58U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram2__DOT__mem[58U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram2__DOT__i = 0x0000003bU;
    vlSelfRef.nicore__DOT__sram2__DOT__mem[59U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram2__DOT__mem[59U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram2__DOT__mem[59U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram2__DOT__mem[59U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram2__DOT__i = 0x0000003cU;
    vlSelfRef.nicore__DOT__sram2__DOT__mem[60U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram2__DOT__mem[60U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram2__DOT__mem[60U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram2__DOT__mem[60U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram2__DOT__i = 0x0000003dU;
    vlSelfRef.nicore__DOT__sram2__DOT__mem[61U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram2__DOT__mem[61U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram2__DOT__mem[61U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram2__DOT__mem[61U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram2__DOT__i = 0x0000003eU;
    vlSelfRef.nicore__DOT__sram2__DOT__mem[62U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram2__DOT__mem[62U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram2__DOT__mem[62U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram2__DOT__mem[62U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram2__DOT__i = 0x0000003fU;
    vlSelfRef.nicore__DOT__sram2__DOT__mem[63U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram2__DOT__mem[63U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram2__DOT__mem[63U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram2__DOT__mem[63U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram2__DOT__i = 0x00000040U;
    vlSelfRef.nicore__DOT__sram2_Q[0U] = 0U;
    vlSelfRef.nicore__DOT__sram2_Q[1U] = 0U;
    vlSelfRef.nicore__DOT__sram2_Q[2U] = 0U;
    vlSelfRef.nicore__DOT__sram2_Q[3U] = 0U;
    vlSelfRef.nicore__DOT__sram1__DOT__i = 0U;
    vlSelfRef.nicore__DOT__sram1__DOT__mem[0U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram1__DOT__mem[0U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram1__DOT__mem[0U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram1__DOT__mem[0U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram1__DOT__i = 1U;
    vlSelfRef.nicore__DOT__sram1__DOT__mem[1U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram1__DOT__mem[1U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram1__DOT__mem[1U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram1__DOT__mem[1U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram1__DOT__i = 2U;
    vlSelfRef.nicore__DOT__sram1__DOT__mem[2U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram1__DOT__mem[2U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram1__DOT__mem[2U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram1__DOT__mem[2U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram1__DOT__i = 3U;
    vlSelfRef.nicore__DOT__sram1__DOT__mem[3U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram1__DOT__mem[3U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram1__DOT__mem[3U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram1__DOT__mem[3U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram1__DOT__i = 4U;
    vlSelfRef.nicore__DOT__sram1__DOT__mem[4U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram1__DOT__mem[4U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram1__DOT__mem[4U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram1__DOT__mem[4U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram1__DOT__i = 5U;
    vlSelfRef.nicore__DOT__sram1__DOT__mem[5U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram1__DOT__mem[5U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram1__DOT__mem[5U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram1__DOT__mem[5U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram1__DOT__i = 6U;
    vlSelfRef.nicore__DOT__sram1__DOT__mem[6U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram1__DOT__mem[6U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram1__DOT__mem[6U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram1__DOT__mem[6U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram1__DOT__i = 7U;
    vlSelfRef.nicore__DOT__sram1__DOT__mem[7U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram1__DOT__mem[7U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram1__DOT__mem[7U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram1__DOT__mem[7U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram1__DOT__i = 8U;
    vlSelfRef.nicore__DOT__sram1__DOT__mem[8U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram1__DOT__mem[8U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram1__DOT__mem[8U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram1__DOT__mem[8U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram1__DOT__i = 9U;
    vlSelfRef.nicore__DOT__sram1__DOT__mem[9U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram1__DOT__mem[9U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram1__DOT__mem[9U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram1__DOT__mem[9U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram1__DOT__i = 0x0000000aU;
    vlSelfRef.nicore__DOT__sram1__DOT__mem[10U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram1__DOT__mem[10U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram1__DOT__mem[10U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram1__DOT__mem[10U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram1__DOT__i = 0x0000000bU;
    vlSelfRef.nicore__DOT__sram1__DOT__mem[11U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram1__DOT__mem[11U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram1__DOT__mem[11U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram1__DOT__mem[11U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram1__DOT__i = 0x0000000cU;
    vlSelfRef.nicore__DOT__sram1__DOT__mem[12U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram1__DOT__mem[12U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram1__DOT__mem[12U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram1__DOT__mem[12U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram1__DOT__i = 0x0000000dU;
    vlSelfRef.nicore__DOT__sram1__DOT__mem[13U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram1__DOT__mem[13U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram1__DOT__mem[13U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram1__DOT__mem[13U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram1__DOT__i = 0x0000000eU;
    vlSelfRef.nicore__DOT__sram1__DOT__mem[14U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram1__DOT__mem[14U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram1__DOT__mem[14U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram1__DOT__mem[14U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram1__DOT__i = 0x0000000fU;
    vlSelfRef.nicore__DOT__sram1__DOT__mem[15U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram1__DOT__mem[15U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram1__DOT__mem[15U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram1__DOT__mem[15U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram1__DOT__i = 0x00000010U;
    vlSelfRef.nicore__DOT__sram1__DOT__mem[16U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram1__DOT__mem[16U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram1__DOT__mem[16U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram1__DOT__mem[16U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram1__DOT__i = 0x00000011U;
    vlSelfRef.nicore__DOT__sram1__DOT__mem[17U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram1__DOT__mem[17U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram1__DOT__mem[17U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram1__DOT__mem[17U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram1__DOT__i = 0x00000012U;
    vlSelfRef.nicore__DOT__sram1__DOT__mem[18U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram1__DOT__mem[18U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram1__DOT__mem[18U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram1__DOT__mem[18U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram1__DOT__i = 0x00000013U;
    vlSelfRef.nicore__DOT__sram1__DOT__mem[19U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram1__DOT__mem[19U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram1__DOT__mem[19U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram1__DOT__mem[19U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram1__DOT__i = 0x00000014U;
    vlSelfRef.nicore__DOT__sram1__DOT__mem[20U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram1__DOT__mem[20U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram1__DOT__mem[20U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram1__DOT__mem[20U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram1__DOT__i = 0x00000015U;
    vlSelfRef.nicore__DOT__sram1__DOT__mem[21U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram1__DOT__mem[21U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram1__DOT__mem[21U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram1__DOT__mem[21U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram1__DOT__i = 0x00000016U;
    vlSelfRef.nicore__DOT__sram1__DOT__mem[22U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram1__DOT__mem[22U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram1__DOT__mem[22U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram1__DOT__mem[22U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram1__DOT__i = 0x00000017U;
    vlSelfRef.nicore__DOT__sram1__DOT__mem[23U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram1__DOT__mem[23U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram1__DOT__mem[23U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram1__DOT__mem[23U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram1__DOT__i = 0x00000018U;
    vlSelfRef.nicore__DOT__sram1__DOT__mem[24U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram1__DOT__mem[24U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram1__DOT__mem[24U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram1__DOT__mem[24U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram1__DOT__i = 0x00000019U;
    vlSelfRef.nicore__DOT__sram1__DOT__mem[25U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram1__DOT__mem[25U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram1__DOT__mem[25U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram1__DOT__mem[25U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram1__DOT__i = 0x0000001aU;
    vlSelfRef.nicore__DOT__sram1__DOT__mem[26U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram1__DOT__mem[26U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram1__DOT__mem[26U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram1__DOT__mem[26U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram1__DOT__i = 0x0000001bU;
    vlSelfRef.nicore__DOT__sram1__DOT__mem[27U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram1__DOT__mem[27U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram1__DOT__mem[27U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram1__DOT__mem[27U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram1__DOT__i = 0x0000001cU;
    vlSelfRef.nicore__DOT__sram1__DOT__mem[28U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram1__DOT__mem[28U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram1__DOT__mem[28U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram1__DOT__mem[28U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram1__DOT__i = 0x0000001dU;
    vlSelfRef.nicore__DOT__sram1__DOT__mem[29U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram1__DOT__mem[29U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram1__DOT__mem[29U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram1__DOT__mem[29U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram1__DOT__i = 0x0000001eU;
    vlSelfRef.nicore__DOT__sram1__DOT__mem[30U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram1__DOT__mem[30U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram1__DOT__mem[30U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram1__DOT__mem[30U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram1__DOT__i = 0x0000001fU;
    vlSelfRef.nicore__DOT__sram1__DOT__mem[31U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram1__DOT__mem[31U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram1__DOT__mem[31U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram1__DOT__mem[31U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram1__DOT__i = 0x00000020U;
    vlSelfRef.nicore__DOT__sram1__DOT__mem[32U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram1__DOT__mem[32U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram1__DOT__mem[32U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram1__DOT__mem[32U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram1__DOT__i = 0x00000021U;
    vlSelfRef.nicore__DOT__sram1__DOT__mem[33U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram1__DOT__mem[33U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram1__DOT__mem[33U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram1__DOT__mem[33U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram1__DOT__i = 0x00000022U;
    vlSelfRef.nicore__DOT__sram1__DOT__mem[34U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram1__DOT__mem[34U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram1__DOT__mem[34U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram1__DOT__mem[34U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram1__DOT__i = 0x00000023U;
    vlSelfRef.nicore__DOT__sram1__DOT__mem[35U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram1__DOT__mem[35U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram1__DOT__mem[35U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram1__DOT__mem[35U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram1__DOT__i = 0x00000024U;
    vlSelfRef.nicore__DOT__sram1__DOT__mem[36U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram1__DOT__mem[36U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram1__DOT__mem[36U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram1__DOT__mem[36U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram1__DOT__i = 0x00000025U;
    vlSelfRef.nicore__DOT__sram1__DOT__mem[37U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram1__DOT__mem[37U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram1__DOT__mem[37U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram1__DOT__mem[37U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram1__DOT__i = 0x00000026U;
    vlSelfRef.nicore__DOT__sram1__DOT__mem[38U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram1__DOT__mem[38U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram1__DOT__mem[38U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram1__DOT__mem[38U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram1__DOT__i = 0x00000027U;
    vlSelfRef.nicore__DOT__sram1__DOT__mem[39U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram1__DOT__mem[39U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram1__DOT__mem[39U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram1__DOT__mem[39U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram1__DOT__i = 0x00000028U;
    vlSelfRef.nicore__DOT__sram1__DOT__mem[40U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram1__DOT__mem[40U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram1__DOT__mem[40U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram1__DOT__mem[40U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram1__DOT__i = 0x00000029U;
    vlSelfRef.nicore__DOT__sram1__DOT__mem[41U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram1__DOT__mem[41U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram1__DOT__mem[41U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram1__DOT__mem[41U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram1__DOT__i = 0x0000002aU;
    vlSelfRef.nicore__DOT__sram1__DOT__mem[42U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram1__DOT__mem[42U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram1__DOT__mem[42U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram1__DOT__mem[42U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram1__DOT__i = 0x0000002bU;
    vlSelfRef.nicore__DOT__sram1__DOT__mem[43U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram1__DOT__mem[43U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram1__DOT__mem[43U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram1__DOT__mem[43U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram1__DOT__i = 0x0000002cU;
    vlSelfRef.nicore__DOT__sram1__DOT__mem[44U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram1__DOT__mem[44U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram1__DOT__mem[44U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram1__DOT__mem[44U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram1__DOT__i = 0x0000002dU;
    vlSelfRef.nicore__DOT__sram1__DOT__mem[45U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram1__DOT__mem[45U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram1__DOT__mem[45U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram1__DOT__mem[45U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram1__DOT__i = 0x0000002eU;
    vlSelfRef.nicore__DOT__sram1__DOT__mem[46U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram1__DOT__mem[46U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram1__DOT__mem[46U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram1__DOT__mem[46U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram1__DOT__i = 0x0000002fU;
    vlSelfRef.nicore__DOT__sram1__DOT__mem[47U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram1__DOT__mem[47U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram1__DOT__mem[47U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram1__DOT__mem[47U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram1__DOT__i = 0x00000030U;
    vlSelfRef.nicore__DOT__sram1__DOT__mem[48U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram1__DOT__mem[48U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram1__DOT__mem[48U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram1__DOT__mem[48U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram1__DOT__i = 0x00000031U;
    vlSelfRef.nicore__DOT__sram1__DOT__mem[49U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram1__DOT__mem[49U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram1__DOT__mem[49U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram1__DOT__mem[49U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram1__DOT__i = 0x00000032U;
    vlSelfRef.nicore__DOT__sram1__DOT__mem[50U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram1__DOT__mem[50U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram1__DOT__mem[50U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram1__DOT__mem[50U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram1__DOT__i = 0x00000033U;
    vlSelfRef.nicore__DOT__sram1__DOT__mem[51U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram1__DOT__mem[51U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram1__DOT__mem[51U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram1__DOT__mem[51U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram1__DOT__i = 0x00000034U;
    vlSelfRef.nicore__DOT__sram1__DOT__mem[52U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram1__DOT__mem[52U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram1__DOT__mem[52U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram1__DOT__mem[52U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram1__DOT__i = 0x00000035U;
    vlSelfRef.nicore__DOT__sram1__DOT__mem[53U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram1__DOT__mem[53U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram1__DOT__mem[53U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram1__DOT__mem[53U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram1__DOT__i = 0x00000036U;
    vlSelfRef.nicore__DOT__sram1__DOT__mem[54U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram1__DOT__mem[54U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram1__DOT__mem[54U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram1__DOT__mem[54U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram1__DOT__i = 0x00000037U;
    vlSelfRef.nicore__DOT__sram1__DOT__mem[55U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram1__DOT__mem[55U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram1__DOT__mem[55U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram1__DOT__mem[55U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram1__DOT__i = 0x00000038U;
    vlSelfRef.nicore__DOT__sram1__DOT__mem[56U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram1__DOT__mem[56U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram1__DOT__mem[56U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram1__DOT__mem[56U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram1__DOT__i = 0x00000039U;
    vlSelfRef.nicore__DOT__sram1__DOT__mem[57U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram1__DOT__mem[57U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram1__DOT__mem[57U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram1__DOT__mem[57U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram1__DOT__i = 0x0000003aU;
    vlSelfRef.nicore__DOT__sram1__DOT__mem[58U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram1__DOT__mem[58U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram1__DOT__mem[58U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram1__DOT__mem[58U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram1__DOT__i = 0x0000003bU;
    vlSelfRef.nicore__DOT__sram1__DOT__mem[59U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram1__DOT__mem[59U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram1__DOT__mem[59U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram1__DOT__mem[59U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram1__DOT__i = 0x0000003cU;
    vlSelfRef.nicore__DOT__sram1__DOT__mem[60U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram1__DOT__mem[60U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram1__DOT__mem[60U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram1__DOT__mem[60U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram1__DOT__i = 0x0000003dU;
    vlSelfRef.nicore__DOT__sram1__DOT__mem[61U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram1__DOT__mem[61U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram1__DOT__mem[61U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram1__DOT__mem[61U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram1__DOT__i = 0x0000003eU;
    vlSelfRef.nicore__DOT__sram1__DOT__mem[62U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram1__DOT__mem[62U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram1__DOT__mem[62U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram1__DOT__mem[62U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram1__DOT__i = 0x0000003fU;
    vlSelfRef.nicore__DOT__sram1__DOT__mem[63U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram1__DOT__mem[63U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram1__DOT__mem[63U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram1__DOT__mem[63U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram1__DOT__i = 0x00000040U;
    vlSelfRef.nicore__DOT__sram1_Q[0U] = 0U;
    vlSelfRef.nicore__DOT__sram1_Q[1U] = 0U;
    vlSelfRef.nicore__DOT__sram1_Q[2U] = 0U;
    vlSelfRef.nicore__DOT__sram1_Q[3U] = 0U;
    vlSelfRef.nicore__DOT__sram0__DOT__i = 0U;
    vlSelfRef.nicore__DOT__sram0__DOT__mem[0U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram0__DOT__mem[0U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram0__DOT__mem[0U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram0__DOT__mem[0U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram0__DOT__i = 1U;
    vlSelfRef.nicore__DOT__sram0__DOT__mem[1U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram0__DOT__mem[1U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram0__DOT__mem[1U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram0__DOT__mem[1U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram0__DOT__i = 2U;
    vlSelfRef.nicore__DOT__sram0__DOT__mem[2U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram0__DOT__mem[2U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram0__DOT__mem[2U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram0__DOT__mem[2U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram0__DOT__i = 3U;
    vlSelfRef.nicore__DOT__sram0__DOT__mem[3U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram0__DOT__mem[3U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram0__DOT__mem[3U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram0__DOT__mem[3U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram0__DOT__i = 4U;
    vlSelfRef.nicore__DOT__sram0__DOT__mem[4U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram0__DOT__mem[4U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram0__DOT__mem[4U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram0__DOT__mem[4U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram0__DOT__i = 5U;
    vlSelfRef.nicore__DOT__sram0__DOT__mem[5U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram0__DOT__mem[5U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram0__DOT__mem[5U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram0__DOT__mem[5U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram0__DOT__i = 6U;
    vlSelfRef.nicore__DOT__sram0__DOT__mem[6U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram0__DOT__mem[6U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram0__DOT__mem[6U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram0__DOT__mem[6U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram0__DOT__i = 7U;
    vlSelfRef.nicore__DOT__sram0__DOT__mem[7U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram0__DOT__mem[7U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram0__DOT__mem[7U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram0__DOT__mem[7U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram0__DOT__i = 8U;
    vlSelfRef.nicore__DOT__sram0__DOT__mem[8U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram0__DOT__mem[8U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram0__DOT__mem[8U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram0__DOT__mem[8U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram0__DOT__i = 9U;
    vlSelfRef.nicore__DOT__sram0__DOT__mem[9U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram0__DOT__mem[9U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram0__DOT__mem[9U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram0__DOT__mem[9U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram0__DOT__i = 0x0000000aU;
    vlSelfRef.nicore__DOT__sram0__DOT__mem[10U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram0__DOT__mem[10U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram0__DOT__mem[10U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram0__DOT__mem[10U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram0__DOT__i = 0x0000000bU;
    vlSelfRef.nicore__DOT__sram0__DOT__mem[11U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram0__DOT__mem[11U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram0__DOT__mem[11U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram0__DOT__mem[11U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram0__DOT__i = 0x0000000cU;
    vlSelfRef.nicore__DOT__sram0__DOT__mem[12U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram0__DOT__mem[12U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram0__DOT__mem[12U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram0__DOT__mem[12U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram0__DOT__i = 0x0000000dU;
    vlSelfRef.nicore__DOT__sram0__DOT__mem[13U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram0__DOT__mem[13U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram0__DOT__mem[13U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram0__DOT__mem[13U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram0__DOT__i = 0x0000000eU;
    vlSelfRef.nicore__DOT__sram0__DOT__mem[14U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram0__DOT__mem[14U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram0__DOT__mem[14U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram0__DOT__mem[14U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram0__DOT__i = 0x0000000fU;
    vlSelfRef.nicore__DOT__sram0__DOT__mem[15U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram0__DOT__mem[15U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram0__DOT__mem[15U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram0__DOT__mem[15U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram0__DOT__i = 0x00000010U;
    vlSelfRef.nicore__DOT__sram0__DOT__mem[16U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram0__DOT__mem[16U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram0__DOT__mem[16U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram0__DOT__mem[16U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram0__DOT__i = 0x00000011U;
    vlSelfRef.nicore__DOT__sram0__DOT__mem[17U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram0__DOT__mem[17U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram0__DOT__mem[17U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram0__DOT__mem[17U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram0__DOT__i = 0x00000012U;
    vlSelfRef.nicore__DOT__sram0__DOT__mem[18U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram0__DOT__mem[18U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram0__DOT__mem[18U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram0__DOT__mem[18U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram0__DOT__i = 0x00000013U;
    vlSelfRef.nicore__DOT__sram0__DOT__mem[19U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram0__DOT__mem[19U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram0__DOT__mem[19U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram0__DOT__mem[19U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram0__DOT__i = 0x00000014U;
    vlSelfRef.nicore__DOT__sram0__DOT__mem[20U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram0__DOT__mem[20U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram0__DOT__mem[20U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram0__DOT__mem[20U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram0__DOT__i = 0x00000015U;
    vlSelfRef.nicore__DOT__sram0__DOT__mem[21U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram0__DOT__mem[21U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram0__DOT__mem[21U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram0__DOT__mem[21U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram0__DOT__i = 0x00000016U;
    vlSelfRef.nicore__DOT__sram0__DOT__mem[22U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram0__DOT__mem[22U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram0__DOT__mem[22U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram0__DOT__mem[22U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram0__DOT__i = 0x00000017U;
    vlSelfRef.nicore__DOT__sram0__DOT__mem[23U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram0__DOT__mem[23U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram0__DOT__mem[23U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram0__DOT__mem[23U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram0__DOT__i = 0x00000018U;
    vlSelfRef.nicore__DOT__sram0__DOT__mem[24U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram0__DOT__mem[24U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram0__DOT__mem[24U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram0__DOT__mem[24U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram0__DOT__i = 0x00000019U;
    vlSelfRef.nicore__DOT__sram0__DOT__mem[25U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram0__DOT__mem[25U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram0__DOT__mem[25U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram0__DOT__mem[25U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram0__DOT__i = 0x0000001aU;
    vlSelfRef.nicore__DOT__sram0__DOT__mem[26U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram0__DOT__mem[26U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram0__DOT__mem[26U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram0__DOT__mem[26U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram0__DOT__i = 0x0000001bU;
    vlSelfRef.nicore__DOT__sram0__DOT__mem[27U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram0__DOT__mem[27U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram0__DOT__mem[27U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram0__DOT__mem[27U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram0__DOT__i = 0x0000001cU;
    vlSelfRef.nicore__DOT__sram0__DOT__mem[28U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram0__DOT__mem[28U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram0__DOT__mem[28U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram0__DOT__mem[28U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram0__DOT__i = 0x0000001dU;
    vlSelfRef.nicore__DOT__sram0__DOT__mem[29U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram0__DOT__mem[29U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram0__DOT__mem[29U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram0__DOT__mem[29U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram0__DOT__i = 0x0000001eU;
    vlSelfRef.nicore__DOT__sram0__DOT__mem[30U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram0__DOT__mem[30U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram0__DOT__mem[30U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram0__DOT__mem[30U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram0__DOT__i = 0x0000001fU;
    vlSelfRef.nicore__DOT__sram0__DOT__mem[31U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram0__DOT__mem[31U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram0__DOT__mem[31U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram0__DOT__mem[31U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram0__DOT__i = 0x00000020U;
    vlSelfRef.nicore__DOT__sram0__DOT__mem[32U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram0__DOT__mem[32U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram0__DOT__mem[32U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram0__DOT__mem[32U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram0__DOT__i = 0x00000021U;
    vlSelfRef.nicore__DOT__sram0__DOT__mem[33U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram0__DOT__mem[33U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram0__DOT__mem[33U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram0__DOT__mem[33U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram0__DOT__i = 0x00000022U;
    vlSelfRef.nicore__DOT__sram0__DOT__mem[34U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram0__DOT__mem[34U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram0__DOT__mem[34U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram0__DOT__mem[34U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram0__DOT__i = 0x00000023U;
    vlSelfRef.nicore__DOT__sram0__DOT__mem[35U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram0__DOT__mem[35U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram0__DOT__mem[35U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram0__DOT__mem[35U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram0__DOT__i = 0x00000024U;
    vlSelfRef.nicore__DOT__sram0__DOT__mem[36U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram0__DOT__mem[36U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram0__DOT__mem[36U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram0__DOT__mem[36U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram0__DOT__i = 0x00000025U;
    vlSelfRef.nicore__DOT__sram0__DOT__mem[37U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram0__DOT__mem[37U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram0__DOT__mem[37U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram0__DOT__mem[37U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram0__DOT__i = 0x00000026U;
    vlSelfRef.nicore__DOT__sram0__DOT__mem[38U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram0__DOT__mem[38U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram0__DOT__mem[38U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram0__DOT__mem[38U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram0__DOT__i = 0x00000027U;
    vlSelfRef.nicore__DOT__sram0__DOT__mem[39U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram0__DOT__mem[39U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram0__DOT__mem[39U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram0__DOT__mem[39U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram0__DOT__i = 0x00000028U;
    vlSelfRef.nicore__DOT__sram0__DOT__mem[40U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram0__DOT__mem[40U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram0__DOT__mem[40U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram0__DOT__mem[40U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram0__DOT__i = 0x00000029U;
    vlSelfRef.nicore__DOT__sram0__DOT__mem[41U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram0__DOT__mem[41U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram0__DOT__mem[41U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram0__DOT__mem[41U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram0__DOT__i = 0x0000002aU;
    vlSelfRef.nicore__DOT__sram0__DOT__mem[42U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram0__DOT__mem[42U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram0__DOT__mem[42U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram0__DOT__mem[42U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram0__DOT__i = 0x0000002bU;
    vlSelfRef.nicore__DOT__sram0__DOT__mem[43U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram0__DOT__mem[43U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram0__DOT__mem[43U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram0__DOT__mem[43U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram0__DOT__i = 0x0000002cU;
    vlSelfRef.nicore__DOT__sram0__DOT__mem[44U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram0__DOT__mem[44U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram0__DOT__mem[44U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram0__DOT__mem[44U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram0__DOT__i = 0x0000002dU;
    vlSelfRef.nicore__DOT__sram0__DOT__mem[45U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram0__DOT__mem[45U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram0__DOT__mem[45U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram0__DOT__mem[45U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram0__DOT__i = 0x0000002eU;
    vlSelfRef.nicore__DOT__sram0__DOT__mem[46U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram0__DOT__mem[46U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram0__DOT__mem[46U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram0__DOT__mem[46U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram0__DOT__i = 0x0000002fU;
    vlSelfRef.nicore__DOT__sram0__DOT__mem[47U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram0__DOT__mem[47U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram0__DOT__mem[47U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram0__DOT__mem[47U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram0__DOT__i = 0x00000030U;
    vlSelfRef.nicore__DOT__sram0__DOT__mem[48U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram0__DOT__mem[48U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram0__DOT__mem[48U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram0__DOT__mem[48U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram0__DOT__i = 0x00000031U;
    vlSelfRef.nicore__DOT__sram0__DOT__mem[49U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram0__DOT__mem[49U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram0__DOT__mem[49U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram0__DOT__mem[49U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram0__DOT__i = 0x00000032U;
    vlSelfRef.nicore__DOT__sram0__DOT__mem[50U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram0__DOT__mem[50U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram0__DOT__mem[50U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram0__DOT__mem[50U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram0__DOT__i = 0x00000033U;
    vlSelfRef.nicore__DOT__sram0__DOT__mem[51U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram0__DOT__mem[51U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram0__DOT__mem[51U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram0__DOT__mem[51U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram0__DOT__i = 0x00000034U;
    vlSelfRef.nicore__DOT__sram0__DOT__mem[52U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram0__DOT__mem[52U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram0__DOT__mem[52U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram0__DOT__mem[52U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram0__DOT__i = 0x00000035U;
    vlSelfRef.nicore__DOT__sram0__DOT__mem[53U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram0__DOT__mem[53U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram0__DOT__mem[53U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram0__DOT__mem[53U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram0__DOT__i = 0x00000036U;
    vlSelfRef.nicore__DOT__sram0__DOT__mem[54U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram0__DOT__mem[54U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram0__DOT__mem[54U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram0__DOT__mem[54U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram0__DOT__i = 0x00000037U;
    vlSelfRef.nicore__DOT__sram0__DOT__mem[55U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram0__DOT__mem[55U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram0__DOT__mem[55U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram0__DOT__mem[55U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram0__DOT__i = 0x00000038U;
    vlSelfRef.nicore__DOT__sram0__DOT__mem[56U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram0__DOT__mem[56U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram0__DOT__mem[56U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram0__DOT__mem[56U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram0__DOT__i = 0x00000039U;
    vlSelfRef.nicore__DOT__sram0__DOT__mem[57U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram0__DOT__mem[57U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram0__DOT__mem[57U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram0__DOT__mem[57U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram0__DOT__i = 0x0000003aU;
    vlSelfRef.nicore__DOT__sram0__DOT__mem[58U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram0__DOT__mem[58U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram0__DOT__mem[58U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram0__DOT__mem[58U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram0__DOT__i = 0x0000003bU;
    vlSelfRef.nicore__DOT__sram0__DOT__mem[59U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram0__DOT__mem[59U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram0__DOT__mem[59U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram0__DOT__mem[59U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram0__DOT__i = 0x0000003cU;
    vlSelfRef.nicore__DOT__sram0__DOT__mem[60U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram0__DOT__mem[60U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram0__DOT__mem[60U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram0__DOT__mem[60U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram0__DOT__i = 0x0000003dU;
    vlSelfRef.nicore__DOT__sram0__DOT__mem[61U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram0__DOT__mem[61U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram0__DOT__mem[61U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram0__DOT__mem[61U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram0__DOT__i = 0x0000003eU;
    vlSelfRef.nicore__DOT__sram0__DOT__mem[62U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram0__DOT__mem[62U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram0__DOT__mem[62U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram0__DOT__mem[62U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram0__DOT__i = 0x0000003fU;
    vlSelfRef.nicore__DOT__sram0__DOT__mem[63U][0U] = 0U;
    vlSelfRef.nicore__DOT__sram0__DOT__mem[63U][1U] = 0U;
    vlSelfRef.nicore__DOT__sram0__DOT__mem[63U][2U] = 0U;
    vlSelfRef.nicore__DOT__sram0__DOT__mem[63U][3U] = 0U;
    vlSelfRef.nicore__DOT__sram0__DOT__i = 0x00000040U;
    vlSelfRef.nicore__DOT__sram0_Q[0U] = 0U;
    vlSelfRef.nicore__DOT__sram0_Q[1U] = 0U;
    vlSelfRef.nicore__DOT__sram0_Q[2U] = 0U;
    vlSelfRef.nicore__DOT__sram0_Q[3U] = 0U;
}

VL_ATTR_COLD void Vnicore___024root___eval_final(Vnicore___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vnicore___024root___eval_final\n"); );
    Vnicore__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
}

#ifdef VL_DEBUG
VL_ATTR_COLD void Vnicore___024root___dump_triggers__stl(const VlUnpacked<QData/*63:0*/, 1> &triggers, const std::string &tag);
#endif  // VL_DEBUG
VL_ATTR_COLD bool Vnicore___024root___eval_phase__stl(Vnicore___024root* vlSelf);

VL_ATTR_COLD void Vnicore___024root___eval_settle(Vnicore___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vnicore___024root___eval_settle\n"); );
    Vnicore__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Locals
    IData/*31:0*/ __VstlIterCount;
    // Body
    __VstlIterCount = 0U;
    vlSelfRef.__VstlFirstIteration = 1U;
    do {
        if (VL_UNLIKELY(((0x00002710U < __VstlIterCount)))) {
#ifdef VL_DEBUG
            Vnicore___024root___dump_triggers__stl(vlSelfRef.__VstlTriggered, "stl"s);
#endif
            VL_FATAL_MT("../nicore.v", 15122, "", "DIDNOTCONVERGE: Settle region did not converge after '--converge-limit' of 10000 tries");
        }
        __VstlIterCount = ((IData)(1U) + __VstlIterCount);
        vlSelfRef.__VstlPhaseResult = Vnicore___024root___eval_phase__stl(vlSelf);
        vlSelfRef.__VstlFirstIteration = 0U;
    } while (vlSelfRef.__VstlPhaseResult);
}

VL_ATTR_COLD bool Vnicore___024root___trigger_anySet__stl(const VlUnpacked<QData/*63:0*/, 1> &in);

#ifdef VL_DEBUG
VL_ATTR_COLD void Vnicore___024root___dump_triggers__stl(const VlUnpacked<QData/*63:0*/, 1> &triggers, const std::string &tag) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vnicore___024root___dump_triggers__stl\n"); );
    // Body
    if ((1U & (~ (IData)(Vnicore___024root___trigger_anySet__stl(triggers))))) {
        VL_DBG_MSGS("         No '" + tag + "' region triggers active\n");
    }
    if ((1U & (IData)(triggers[0U]))) {
        VL_DBG_MSGS("         '" + tag + "' region trigger index 0 is active: Internal 'stl' trigger - first iteration\n");
    }
}
#endif  // VL_DEBUG

VL_ATTR_COLD bool Vnicore___024root___trigger_anySet__stl(const VlUnpacked<QData/*63:0*/, 1> &in) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vnicore___024root___trigger_anySet__stl\n"); );
    // Locals
    IData/*31:0*/ n;
    // Body
    n = 0U;
    do {
        if (in[n]) {
            return (1U);
        }
        n = ((IData)(1U) + n);
    } while ((1U > n));
    return (0U);
}

VL_ATTR_COLD void Vnicore___024root___stl_sequent__TOP__0(Vnicore___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vnicore___024root___stl_sequent__TOP__0\n"); );
    Vnicore__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Locals
    CData/*3:0*/ __VdfgRegularize_hebeb780c_0_129;
    __VdfgRegularize_hebeb780c_0_129 = 0;
    CData/*0:0*/ __VdfgRegularize_hebeb780c_0_219;
    __VdfgRegularize_hebeb780c_0_219 = 0;
    CData/*0:0*/ __VdfgRegularize_hebeb780c_0_315;
    __VdfgRegularize_hebeb780c_0_315 = 0;
    CData/*0:0*/ __VdfgRegularize_hebeb780c_0_321;
    __VdfgRegularize_hebeb780c_0_321 = 0;
    CData/*0:0*/ __VdfgRegularize_hebeb780c_0_324;
    __VdfgRegularize_hebeb780c_0_324 = 0;
    IData/*31:0*/ __VdfgRegularize_hebeb780c_0_403;
    __VdfgRegularize_hebeb780c_0_403 = 0;
    VlWide<4>/*127:0*/ __Vtemp_1;
    VlWide<4>/*127:0*/ __Vtemp_3;
    VlWide<4>/*127:0*/ __Vtemp_4;
    VlWide<4>/*127:0*/ __Vtemp_6;
    VlWide<4>/*127:0*/ __Vtemp_7;
    VlWide<4>/*127:0*/ __Vtemp_8;
    VlWide<3>/*95:0*/ __Vtemp_9;
    VlWide<4>/*127:0*/ __Vtemp_10;
    VlWide<3>/*95:0*/ __Vtemp_12;
    VlWide<3>/*95:0*/ __Vtemp_13;
    VlWide<4>/*127:0*/ __Vtemp_15;
    // Body
    vlSelfRef.io_pc_debug = vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__mw_pipe_reg_pc;
    vlSelfRef.io_inst = vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__em_pipe_reg_inst;
    vlSelfRef.io_commit_inst = vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__mw_pipe_reg_inst;
    vlSelfRef.io_commit_pc = vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__mw_pipe_reg_pc;
    vlSelfRef.io_start = vlSelfRef.nicore__DOT__datapath__DOT__started;
    vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__divider_io_divw 
        = (0U != (IData)(vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__de_pipe_reg_wd_type));
    vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__clint_io_soft_clear 
        = (1U & (~ (IData)(vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__clint__DOT__msip)));
    if ((3U != (IData)(vlSelfRef.nicore__DOT__dcache__DOT__index_in_line))) {
        vlSelfRef.nicore__DOT__dcache__DOT___GEN_17 = 0x10U;
        vlSelfRef.nicore__DOT__dcache__DOT___GEN_19 
            = vlSelfRef.nicore__DOT__dcache__DOT__flush_over;
    } else {
        vlSelfRef.nicore__DOT__dcache__DOT___GEN_17 = 0x0fU;
        vlSelfRef.nicore__DOT__dcache__DOT___GEN_19 
            = ((IData)(vlSelfRef.nicore__DOT__dcache__DOT__flush_over) 
               | (0x3fU == (IData)(vlSelfRef.nicore__DOT__dcache__DOT__flush_loop)));
    }
    vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__amo_key 
        = ((0x000000f8U & (vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst 
                           >> 0x00000018U)) | (7U & 
                                               (vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst 
                                                >> 0x0000000cU)));
    vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT___amo_store_data_T_3 
        = (0x00000038U & ((IData)(vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__em_pipe_reg_alu_out) 
                          << 3U));
    vlSelfRef.nicore__DOT__datapath__DOT__csr__DOT___mcycle_data_T_1 
        = (1ULL + vlSelfRef.nicore__DOT__datapath__DOT__csr__DOT__mcycle_data);
    vlSelfRef.nicore__DOT__datapath__DOT__csr__DOT___sepc_data_T_5 
        = (0xfffffffffffffffcULL & vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__em_pipe_reg_pc);
    vlSelfRef.__VdfgRegularize_hebeb780c_0_83 = ((IData)(vlSelfRef.nicore__DOT__dcache__DOT__flush_loop) 
                                                 << 4U);
    vlSelfRef.__VdfgRegularize_hebeb780c_0_161 = (3U 
                                                  & (- (IData)(
                                                               (0x3fU 
                                                                == (IData)(vlSelfRef.nicore__DOT__dcache__DOT__flush_loop)))));
    vlSelfRef.__VdfgRegularize_hebeb780c_0_215 = (0x01ffffffU 
                                                  & (- (IData)(
                                                               (1U 
                                                                & (vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT__tlbe_0_vpn 
                                                                   >> 0x0000001aU)))));
    vlSelfRef.__VdfgRegularize_hebeb780c_0_217 = (0x01ffffffU 
                                                  & (- (IData)(
                                                               (1U 
                                                                & (vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__iTLB__DOT__tlbe_0_vpn 
                                                                   >> 0x0000001aU)))));
    vlSelfRef.__VdfgRegularize_hebeb780c_0_303 = ((0x0eU 
                                                   == (IData)(vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__de_pipe_reg_alu_op)) 
                                                  | (0x10U 
                                                     == (IData)(vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__de_pipe_reg_alu_op)));
    vlSelfRef.__VdfgRegularize_hebeb780c_0_397 = (- (QData)((IData)(
                                                                    (1U 
                                                                     & (IData)(
                                                                               (vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__multiplier__DOT__multiplier_reg 
                                                                                >> 0x00000020U))))));
    vlSelfRef.__VdfgRegularize_hebeb780c_0_398 = (- (QData)((IData)(
                                                                    (1U 
                                                                     & (IData)(vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__multiplier__DOT__multiplier_reg)))));
    vlSelfRef.__VdfgRegularize_hebeb780c_0_413 = (0x0cU 
                                                  != (IData)(vlSelfRef.nicore__DOT__icache__DOT__cache_state));
    vlSelfRef.__VdfgRegularize_hebeb780c_0_414 = (0x0dU 
                                                  != (IData)(vlSelfRef.nicore__DOT__icache__DOT__cache_state));
    vlSelfRef.__VdfgRegularize_hebeb780c_0_427 = (0x0cU 
                                                  != (IData)(vlSelfRef.nicore__DOT__dcache__DOT__cache_state));
    vlSelfRef.__VdfgRegularize_hebeb780c_0_428 = (0x0dU 
                                                  != (IData)(vlSelfRef.nicore__DOT__dcache__DOT__cache_state));
    vlSelfRef.io_master_awlen = ((0U == (IData)(vlSelfRef.nicore__DOT__dcache__DOT__cache_state)) 
                                 | ((0x0fU == (IData)(vlSelfRef.nicore__DOT__dcache__DOT__cache_state)) 
                                    | ((0x10U == (IData)(vlSelfRef.nicore__DOT__dcache__DOT__cache_state)) 
                                       | ((0x11U == (IData)(vlSelfRef.nicore__DOT__dcache__DOT__cache_state)) 
                                          | ((0x13U 
                                              == (IData)(vlSelfRef.nicore__DOT__dcache__DOT__cache_state)) 
                                             | ((1U 
                                                 == (IData)(vlSelfRef.nicore__DOT__dcache__DOT__cache_state)) 
                                                | ((3U 
                                                    == (IData)(vlSelfRef.nicore__DOT__dcache__DOT__cache_state)) 
                                                   | ((IData)(vlSelfRef.nicore__DOT__dcache__DOT__write_addr_reg) 
                                                      | (4U 
                                                         != (IData)(vlSelfRef.nicore__DOT__dcache__DOT__cache_state))))))))));
    vlSelfRef.io_master_bready = ((7U == (IData)(vlSelfRef.nicore__DOT__arb__DOT__state)) 
                                  & ((0U != (IData)(vlSelfRef.nicore__DOT__dcache__DOT__cache_state)) 
                                     & ((0x0fU != (IData)(vlSelfRef.nicore__DOT__dcache__DOT__cache_state)) 
                                        & ((0x10U != (IData)(vlSelfRef.nicore__DOT__dcache__DOT__cache_state)) 
                                           & ((0x11U 
                                               != (IData)(vlSelfRef.nicore__DOT__dcache__DOT__cache_state)) 
                                              & ((0x13U 
                                                  == (IData)(vlSelfRef.nicore__DOT__dcache__DOT__cache_state)) 
                                                 | ((1U 
                                                     != (IData)(vlSelfRef.nicore__DOT__dcache__DOT__cache_state)) 
                                                    & ((3U 
                                                        != (IData)(vlSelfRef.nicore__DOT__dcache__DOT__cache_state)) 
                                                       & ((4U 
                                                           != (IData)(vlSelfRef.nicore__DOT__dcache__DOT__cache_state)) 
                                                          & ((5U 
                                                              == (IData)(vlSelfRef.nicore__DOT__dcache__DOT__cache_state)) 
                                                             | ((6U 
                                                                 != (IData)(vlSelfRef.nicore__DOT__dcache__DOT__cache_state)) 
                                                                & ((0x0cU 
                                                                    != (IData)(vlSelfRef.nicore__DOT__dcache__DOT__cache_state)) 
                                                                   & ((0x0dU 
                                                                       != (IData)(vlSelfRef.nicore__DOT__dcache__DOT__cache_state)) 
                                                                      & ((9U 
                                                                          != (IData)(vlSelfRef.nicore__DOT__dcache__DOT__cache_state)) 
                                                                         & ((8U 
                                                                             != (IData)(vlSelfRef.nicore__DOT__dcache__DOT__cache_state)) 
                                                                            & ((0x0eU 
                                                                                != (IData)(vlSelfRef.nicore__DOT__dcache__DOT__cache_state)) 
                                                                               & ((0x0bU 
                                                                                == (IData)(vlSelfRef.nicore__DOT__dcache__DOT__cache_state)) 
                                                                                & (7U 
                                                                                != (IData)(vlSelfRef.nicore__DOT__dcache__DOT__cache_state)))))))))))))))))));
    vlSelfRef.nicore__DOT__dcache_io_mem_io_ar_ready 
        = ((IData)(vlSelfRef.io_master_arready) & (5U 
                                                   == (IData)(vlSelfRef.nicore__DOT__arb__DOT__state)));
    vlSelfRef.nicore__DOT__icache_io_mem_io_ar_ready 
        = ((IData)(vlSelfRef.io_master_arready) & (4U 
                                                   == (IData)(vlSelfRef.nicore__DOT__arb__DOT__state)));
    vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__clint_io_timer_valid 
        = (vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__clint__DOT__mtime 
           >= vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__clint__DOT__mtimecmp);
    vlSelfRef.nicore__DOT__icache__DOT___GEN_2 = (0x0000003fU 
                                                  & ((IData)(vlSelfRef.nicore__DOT__icache__DOT__flush_loop) 
                                                     + 
                                                     ((0U 
                                                       != (IData)(vlSelfRef.nicore__DOT__icache__DOT__cache_state)) 
                                                      & ((0x0fU 
                                                          != (IData)(vlSelfRef.nicore__DOT__icache__DOT__cache_state)) 
                                                         & (0x10U 
                                                            == (IData)(vlSelfRef.nicore__DOT__icache__DOT__cache_state))))));
    vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__multiplier__DOT___GEN_0 
        = (0x0000001fU & ((IData)(vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__multiplier__DOT__index) 
                          + (1U == (IData)(vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__multiplier__DOT__mul_state))));
    vlSelfRef.nicore__DOT__datapath__DOT__csr__DOT___GEN_0 
        = (vlSelfRef.nicore__DOT__datapath__DOT__csr__DOT__minstret_data 
           + (QData)((IData)((0x00000013U != vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__mw_pipe_reg_inst))));
    vlSelfRef.__VdfgRegularize_hebeb780c_0_322 = ((IData)(vlSelfRef.nicore__DOT__arb__DOT__write_addr_reg) 
                                                  & (IData)(vlSelfRef.nicore__DOT__arb__DOT__write_data_reg));
    vlSelfRef.__VdfgRegularize_hebeb780c_0_399 = (0x7fffffffffffffffULL 
                                                  & ((QData)((IData)(
                                                                     (vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__multiplier__DOT__multiplicand_reg 
                                                                      >> 0x00000020U))) 
                                                     << (IData)(vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__multiplier__DOT__index)));
    vlSelfRef.__VdfgRegularize_hebeb780c_0_400 = (0x7fffffffffffffffULL 
                                                  & ((QData)((IData)(vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__multiplier__DOT__multiplicand_reg)) 
                                                     << (IData)(vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__multiplier__DOT__index)));
    vlSelfRef.io_master_awsize = (3U & ((- (IData)(
                                                   (0U 
                                                    == (IData)(vlSelfRef.nicore__DOT__dcache__DOT__cache_state)))) 
                                        | ((- (IData)(
                                                      (0x0fU 
                                                       == (IData)(vlSelfRef.nicore__DOT__dcache__DOT__cache_state)))) 
                                           | ((- (IData)(
                                                         (0x10U 
                                                          == (IData)(vlSelfRef.nicore__DOT__dcache__DOT__cache_state)))) 
                                              | ((- (IData)(
                                                            (0x11U 
                                                             == (IData)(vlSelfRef.nicore__DOT__dcache__DOT__cache_state)))) 
                                                 | ((- (IData)(
                                                               (0x13U 
                                                                == (IData)(vlSelfRef.nicore__DOT__dcache__DOT__cache_state)))) 
                                                    | ((- (IData)(
                                                                  (4U 
                                                                   != (IData)(vlSelfRef.nicore__DOT__dcache__DOT__cache_state)))) 
                                                       | ((IData)(vlSelfRef.nicore__DOT__dcache__DOT__cpu_request_accessType) 
                                                          | ((- (IData)(
                                                                        (1U 
                                                                         == (IData)(vlSelfRef.nicore__DOT__dcache__DOT__cache_state)))) 
                                                             | ((- (IData)(
                                                                           (3U 
                                                                            == (IData)(vlSelfRef.nicore__DOT__dcache__DOT__cache_state)))) 
                                                                | (- (IData)((IData)(vlSelfRef.nicore__DOT__dcache__DOT__write_addr_reg)))))))))))));
    vlSelfRef.io_master_wstrb = (0x000000ffU & ((- (IData)(
                                                           (4U 
                                                            != (IData)(vlSelfRef.nicore__DOT__dcache__DOT__cache_state)))) 
                                                | ((IData)(vlSelfRef.nicore__DOT__dcache__DOT__cpu_request_mask) 
                                                   | ((- (IData)(
                                                                 (0U 
                                                                  == (IData)(vlSelfRef.nicore__DOT__dcache__DOT__cache_state)))) 
                                                      | ((- (IData)(
                                                                    (0x0fU 
                                                                     == (IData)(vlSelfRef.nicore__DOT__dcache__DOT__cache_state)))) 
                                                         | ((- (IData)(
                                                                       (0x10U 
                                                                        == (IData)(vlSelfRef.nicore__DOT__dcache__DOT__cache_state)))) 
                                                            | ((- (IData)(
                                                                          (0x11U 
                                                                           == (IData)(vlSelfRef.nicore__DOT__dcache__DOT__cache_state)))) 
                                                               | ((- (IData)(
                                                                             (0x13U 
                                                                              == (IData)(vlSelfRef.nicore__DOT__dcache__DOT__cache_state)))) 
                                                                  | ((- (IData)(
                                                                                (1U 
                                                                                == (IData)(vlSelfRef.nicore__DOT__dcache__DOT__cache_state)))) 
                                                                     | ((- (IData)(
                                                                                (3U 
                                                                                == (IData)(vlSelfRef.nicore__DOT__dcache__DOT__cache_state)))) 
                                                                        | (- (IData)((IData)(vlSelfRef.nicore__DOT__dcache__DOT__write_data_reg)))))))))))));
    if ((5U == (IData)(vlSelfRef.nicore__DOT__arb__DOT__state))) {
        vlSelfRef.io_master_arlen = ((0U == (IData)(vlSelfRef.nicore__DOT__dcache__DOT__cache_state)) 
                                     | ((0x0fU == (IData)(vlSelfRef.nicore__DOT__dcache__DOT__cache_state)) 
                                        | ((0x10U == (IData)(vlSelfRef.nicore__DOT__dcache__DOT__cache_state)) 
                                           | ((0x11U 
                                               == (IData)(vlSelfRef.nicore__DOT__dcache__DOT__cache_state)) 
                                              | ((1U 
                                                  != (IData)(vlSelfRef.nicore__DOT__dcache__DOT__cache_state)) 
                                                 | (0x13U 
                                                    == (IData)(vlSelfRef.nicore__DOT__dcache__DOT__cache_state)))))));
        vlSelfRef.io_master_arsize = (3U & ((- (IData)(
                                                       (0U 
                                                        == (IData)(vlSelfRef.nicore__DOT__dcache__DOT__cache_state)))) 
                                            | ((- (IData)(
                                                          (0x0fU 
                                                           == (IData)(vlSelfRef.nicore__DOT__dcache__DOT__cache_state)))) 
                                               | ((- (IData)(
                                                             (0x10U 
                                                              == (IData)(vlSelfRef.nicore__DOT__dcache__DOT__cache_state)))) 
                                                  | ((- (IData)(
                                                                (0x11U 
                                                                 == (IData)(vlSelfRef.nicore__DOT__dcache__DOT__cache_state)))) 
                                                     | ((- (IData)(
                                                                   (0x13U 
                                                                    == (IData)(vlSelfRef.nicore__DOT__dcache__DOT__cache_state)))) 
                                                        | ((IData)(vlSelfRef.nicore__DOT__dcache__DOT__cpu_request_accessType) 
                                                           | (- (IData)(
                                                                        (1U 
                                                                         != (IData)(vlSelfRef.nicore__DOT__dcache__DOT__cache_state)))))))))));
        vlSelfRef.io_master_araddr = ((0U == (IData)(vlSelfRef.nicore__DOT__dcache__DOT__cache_state))
                                       ? vlSelfRef.nicore__DOT__dcache__DOT__cpu_request_addr_reg
                                       : ((0x0fU == (IData)(vlSelfRef.nicore__DOT__dcache__DOT__cache_state))
                                           ? vlSelfRef.nicore__DOT__dcache__DOT__cpu_request_addr_reg
                                           : ((0x10U 
                                               == (IData)(vlSelfRef.nicore__DOT__dcache__DOT__cache_state))
                                               ? vlSelfRef.nicore__DOT__dcache__DOT__cpu_request_addr_reg
                                               : ((0x11U 
                                                   == (IData)(vlSelfRef.nicore__DOT__dcache__DOT__cache_state))
                                                   ? vlSelfRef.nicore__DOT__dcache__DOT__cpu_request_addr_reg
                                                   : 
                                                  ((0x13U 
                                                    == (IData)(vlSelfRef.nicore__DOT__dcache__DOT__cache_state))
                                                    ? vlSelfRef.nicore__DOT__dcache__DOT__cpu_request_addr_reg
                                                    : 
                                                   ((1U 
                                                     == (IData)(vlSelfRef.nicore__DOT__dcache__DOT__cache_state))
                                                     ? vlSelfRef.nicore__DOT__dcache__DOT__cpu_request_addr_reg_origin
                                                     : 
                                                    ((3U 
                                                      == (IData)(vlSelfRef.nicore__DOT__dcache__DOT__cache_state))
                                                      ? vlSelfRef.nicore__DOT__dcache__DOT__cpu_request_addr_reg
                                                      : 
                                                     ((4U 
                                                       == (IData)(vlSelfRef.nicore__DOT__dcache__DOT__cache_state))
                                                       ? vlSelfRef.nicore__DOT__dcache__DOT__cpu_request_addr_reg
                                                       : 
                                                      ((5U 
                                                        == (IData)(vlSelfRef.nicore__DOT__dcache__DOT__cache_state))
                                                        ? vlSelfRef.nicore__DOT__dcache__DOT__cpu_request_addr_reg
                                                        : 
                                                       ((6U 
                                                         == (IData)(vlSelfRef.nicore__DOT__dcache__DOT__cache_state))
                                                         ? vlSelfRef.nicore__DOT__dcache__DOT__cpu_request_addr_reg
                                                         : 
                                                        ((0x0cU 
                                                          == (IData)(vlSelfRef.nicore__DOT__dcache__DOT__cache_state))
                                                          ? vlSelfRef.nicore__DOT__dcache__DOT__cpu_request_addr_reg
                                                          : 
                                                         ((0x0dU 
                                                           == (IData)(vlSelfRef.nicore__DOT__dcache__DOT__cache_state))
                                                           ? vlSelfRef.nicore__DOT__dcache__DOT__cpu_request_addr_reg
                                                           : 
                                                          ((9U 
                                                            == (IData)(vlSelfRef.nicore__DOT__dcache__DOT__cache_state))
                                                            ? vlSelfRef.nicore__DOT__dcache__DOT__refill_addr
                                                            : vlSelfRef.nicore__DOT__dcache__DOT__cpu_request_addr_reg)))))))))))));
    } else {
        vlSelfRef.io_master_arlen = ((0U == (IData)(vlSelfRef.nicore__DOT__icache__DOT__cache_state)) 
                                     | ((0x0fU == (IData)(vlSelfRef.nicore__DOT__icache__DOT__cache_state)) 
                                        | ((0x10U == (IData)(vlSelfRef.nicore__DOT__icache__DOT__cache_state)) 
                                           | ((0x11U 
                                               == (IData)(vlSelfRef.nicore__DOT__icache__DOT__cache_state)) 
                                              | ((1U 
                                                  != (IData)(vlSelfRef.nicore__DOT__icache__DOT__cache_state)) 
                                                 | (0x13U 
                                                    == (IData)(vlSelfRef.nicore__DOT__icache__DOT__cache_state)))))));
        vlSelfRef.io_master_arsize = (3U & ((- (IData)(
                                                       (0U 
                                                        == (IData)(vlSelfRef.nicore__DOT__icache__DOT__cache_state)))) 
                                            | ((- (IData)(
                                                          (0x0fU 
                                                           == (IData)(vlSelfRef.nicore__DOT__icache__DOT__cache_state)))) 
                                               | ((- (IData)(
                                                             (0x10U 
                                                              == (IData)(vlSelfRef.nicore__DOT__icache__DOT__cache_state)))) 
                                                  | ((- (IData)(
                                                                (0x11U 
                                                                 == (IData)(vlSelfRef.nicore__DOT__icache__DOT__cache_state)))) 
                                                     | ((- (IData)(
                                                                   (0x13U 
                                                                    == (IData)(vlSelfRef.nicore__DOT__icache__DOT__cache_state)))) 
                                                        | ((IData)(vlSelfRef.nicore__DOT__icache__DOT__cpu_request_accessType) 
                                                           | (- (IData)(
                                                                        (1U 
                                                                         != (IData)(vlSelfRef.nicore__DOT__icache__DOT__cache_state)))))))))));
        vlSelfRef.io_master_araddr = ((0U == (IData)(vlSelfRef.nicore__DOT__icache__DOT__cache_state))
                                       ? vlSelfRef.nicore__DOT__icache__DOT__cpu_request_addr_reg
                                       : ((0x0fU == (IData)(vlSelfRef.nicore__DOT__icache__DOT__cache_state))
                                           ? vlSelfRef.nicore__DOT__icache__DOT__cpu_request_addr_reg
                                           : ((0x10U 
                                               == (IData)(vlSelfRef.nicore__DOT__icache__DOT__cache_state))
                                               ? vlSelfRef.nicore__DOT__icache__DOT__cpu_request_addr_reg
                                               : ((0x11U 
                                                   == (IData)(vlSelfRef.nicore__DOT__icache__DOT__cache_state))
                                                   ? vlSelfRef.nicore__DOT__icache__DOT__cpu_request_addr_reg
                                                   : 
                                                  ((0x13U 
                                                    == (IData)(vlSelfRef.nicore__DOT__icache__DOT__cache_state))
                                                    ? vlSelfRef.nicore__DOT__icache__DOT__cpu_request_addr_reg
                                                    : 
                                                   ((1U 
                                                     == (IData)(vlSelfRef.nicore__DOT__icache__DOT__cache_state))
                                                     ? vlSelfRef.nicore__DOT__icache__DOT__cpu_request_addr_reg_origin
                                                     : 
                                                    ((3U 
                                                      == (IData)(vlSelfRef.nicore__DOT__icache__DOT__cache_state))
                                                      ? vlSelfRef.nicore__DOT__icache__DOT__cpu_request_addr_reg
                                                      : 
                                                     ((4U 
                                                       == (IData)(vlSelfRef.nicore__DOT__icache__DOT__cache_state))
                                                       ? vlSelfRef.nicore__DOT__icache__DOT__cpu_request_addr_reg
                                                       : 
                                                      ((5U 
                                                        == (IData)(vlSelfRef.nicore__DOT__icache__DOT__cache_state))
                                                        ? vlSelfRef.nicore__DOT__icache__DOT__cpu_request_addr_reg
                                                        : 
                                                       ((6U 
                                                         == (IData)(vlSelfRef.nicore__DOT__icache__DOT__cache_state))
                                                         ? vlSelfRef.nicore__DOT__icache__DOT__cpu_request_addr_reg
                                                         : 
                                                        ((0x0cU 
                                                          == (IData)(vlSelfRef.nicore__DOT__icache__DOT__cache_state))
                                                          ? vlSelfRef.nicore__DOT__icache__DOT__cpu_request_addr_reg
                                                          : 
                                                         ((0x0dU 
                                                           == (IData)(vlSelfRef.nicore__DOT__icache__DOT__cache_state))
                                                           ? vlSelfRef.nicore__DOT__icache__DOT__cpu_request_addr_reg
                                                           : 
                                                          ((9U 
                                                            == (IData)(vlSelfRef.nicore__DOT__icache__DOT__cache_state))
                                                            ? vlSelfRef.nicore__DOT__icache__DOT__refill_addr
                                                            : vlSelfRef.nicore__DOT__icache__DOT__cpu_request_addr_reg)))))))))))));
    }
    vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT___multiplier_io_mul_op_T 
        = (0xfe00707fU & vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__de_pipe_reg_inst);
    vlSelfRef.nicore__DOT__dcache_io_mem_io_ar_valid 
        = ((0U != (IData)(vlSelfRef.nicore__DOT__dcache__DOT__cache_state)) 
           & ((0x0fU != (IData)(vlSelfRef.nicore__DOT__dcache__DOT__cache_state)) 
              & ((0x10U != (IData)(vlSelfRef.nicore__DOT__dcache__DOT__cache_state)) 
                 & ((0x11U != (IData)(vlSelfRef.nicore__DOT__dcache__DOT__cache_state)) 
                    & ((0x13U != (IData)(vlSelfRef.nicore__DOT__dcache__DOT__cache_state)) 
                       & ((1U == (IData)(vlSelfRef.nicore__DOT__dcache__DOT__cache_state)) 
                          | ((3U != (IData)(vlSelfRef.nicore__DOT__dcache__DOT__cache_state)) 
                             & ((4U != (IData)(vlSelfRef.nicore__DOT__dcache__DOT__cache_state)) 
                                & ((5U != (IData)(vlSelfRef.nicore__DOT__dcache__DOT__cache_state)) 
                                   & ((6U != (IData)(vlSelfRef.nicore__DOT__dcache__DOT__cache_state)) 
                                      & ((0x0cU != (IData)(vlSelfRef.nicore__DOT__dcache__DOT__cache_state)) 
                                         & ((0x0dU 
                                             != (IData)(vlSelfRef.nicore__DOT__dcache__DOT__cache_state)) 
                                            & (9U == (IData)(vlSelfRef.nicore__DOT__dcache__DOT__cache_state))))))))))))));
    vlSelfRef.nicore__DOT__icache_io_mem_io_ar_valid 
        = ((0U != (IData)(vlSelfRef.nicore__DOT__icache__DOT__cache_state)) 
           & ((0x0fU != (IData)(vlSelfRef.nicore__DOT__icache__DOT__cache_state)) 
              & ((0x10U != (IData)(vlSelfRef.nicore__DOT__icache__DOT__cache_state)) 
                 & ((0x11U != (IData)(vlSelfRef.nicore__DOT__icache__DOT__cache_state)) 
                    & ((0x13U != (IData)(vlSelfRef.nicore__DOT__icache__DOT__cache_state)) 
                       & ((1U == (IData)(vlSelfRef.nicore__DOT__icache__DOT__cache_state)) 
                          | ((3U != (IData)(vlSelfRef.nicore__DOT__icache__DOT__cache_state)) 
                             & ((4U != (IData)(vlSelfRef.nicore__DOT__icache__DOT__cache_state)) 
                                & ((5U != (IData)(vlSelfRef.nicore__DOT__icache__DOT__cache_state)) 
                                   & ((6U != (IData)(vlSelfRef.nicore__DOT__icache__DOT__cache_state)) 
                                      & ((0x0cU != (IData)(vlSelfRef.nicore__DOT__icache__DOT__cache_state)) 
                                         & ((0x0dU 
                                             != (IData)(vlSelfRef.nicore__DOT__icache__DOT__cache_state)) 
                                            & (9U == (IData)(vlSelfRef.nicore__DOT__icache__DOT__cache_state))))))))))))));
    vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__divider_io_out_valid 
        = ((2U == (IData)(vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__divider__DOT__div_state)) 
           & ((1U != (IData)(vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__divider__DOT__div_state)) 
              & (0U != (IData)(vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__divider__DOT__div_state))));
    vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__multiplier_io_out_valid 
        = ((2U == (IData)(vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__multiplier__DOT__mul_state)) 
           & ((1U != (IData)(vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__multiplier__DOT__mul_state)) 
              & (0U != (IData)(vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__multiplier__DOT__mul_state))));
    vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__divider__DOT__w_counter_enable 
        = ((IData)(vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__divider__DOT__is_w) 
           & (1U == (IData)(vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__divider__DOT__div_state)));
    vlSelfRef.nicore__DOT__dcache_io_mem_io_aw_ready 
        = ((IData)(vlSelfRef.io_master_awready) & (3U 
                                                   == (IData)(vlSelfRef.nicore__DOT__arb__DOT__state)));
    vlSelfRef.nicore__DOT__dcache__DOT___T_35 = (1U 
                                                 & (~ (IData)(vlSelfRef.nicore__DOT__dcache__DOT__write_addr_reg)));
    vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__divider__DOT___counter_enable_T_1 
        = (1U & (~ (IData)(vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__divider__DOT__is_w)));
    vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__a1 
        = (((QData)((IData)(((- (IData)((1U != (IData)(vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__em_pipe_reg_ld_type)))) 
                             & (IData)((vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__amo_old 
                                        >> 0x00000020U))))) 
            << 0x00000020U) | (QData)((IData)(vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__amo_old)));
    vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__a2 
        = (((QData)((IData)(((- (IData)((1U != (IData)(vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__em_pipe_reg_ld_type)))) 
                             & (IData)((vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__em_pipe_reg_st_data 
                                        >> 0x00000020U))))) 
            << 0x00000020U) | (QData)((IData)(vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__em_pipe_reg_st_data)));
    vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT___divider_io_div_valid_T_2 
        = ((0x0dU == (IData)(vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__de_pipe_reg_alu_op)) 
           | (0x0fU == (IData)(vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__de_pipe_reg_alu_op)));
    if ((0U == (IData)(vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__multiplier__DOT__mul_state))) {
        vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__multiplier__DOT___result_s_T[0U] = 0U;
        vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__multiplier__DOT___result_s_T[1U] = 0U;
        vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__multiplier__DOT___result_s_T[2U] = 0U;
        vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__multiplier__DOT___result_s_T[3U] = 0U;
        vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__multiplier__DOT__result_s[0U] = 0U;
        vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__multiplier__DOT__result_s[1U] = 0U;
        vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__multiplier__DOT__result_s[2U] = 0U;
        vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__multiplier__DOT__result_s[3U] = 0U;
    } else if ((1U == (IData)(vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__multiplier__DOT__mul_state))) {
        vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__multiplier__DOT___result_s_T[0U] = 0U;
        vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__multiplier__DOT___result_s_T[1U] = 0U;
        vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__multiplier__DOT___result_s_T[2U] = 0U;
        vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__multiplier__DOT___result_s_T[3U] = 0U;
        vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__multiplier__DOT__result_s[0U] = 0U;
        vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__multiplier__DOT__result_s[1U] = 0U;
        vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__multiplier__DOT__result_s[2U] = 0U;
        vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__multiplier__DOT__result_s[3U] = 0U;
    } else if ((2U == (IData)(vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__multiplier__DOT__mul_state))) {
        __Vtemp_1[0U] = (IData)(vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__multiplier__DOT__mid_result_0);
        __Vtemp_1[1U] = (IData)((vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__multiplier__DOT__mid_result_0 
                                 >> 0x00000020U));
        __Vtemp_1[2U] = 0U;
        __Vtemp_1[3U] = 0U;
        __Vtemp_3[0U] = 0U;
        __Vtemp_3[1U] = (IData)(vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__multiplier__DOT__mid_result_1);
        __Vtemp_3[2U] = (IData)((vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__multiplier__DOT__mid_result_1 
                                 >> 0x00000020U));
        __Vtemp_3[3U] = 0U;
        __Vtemp_4[0U] = 0U;
        __Vtemp_4[1U] = 0U;
        __Vtemp_4[2U] = (IData)(vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__multiplier__DOT__mid_result_3);
        __Vtemp_4[3U] = (IData)((vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__multiplier__DOT__mid_result_3 
                                 >> 0x00000020U));
        __Vtemp_6[0U] = 0U;
        __Vtemp_6[1U] = (IData)(vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__multiplier__DOT__mid_result_2);
        __Vtemp_6[2U] = (IData)((vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__multiplier__DOT__mid_result_2 
                                 >> 0x00000020U));
        __Vtemp_6[3U] = 0U;
        VL_ADD_W(4, __Vtemp_7, __Vtemp_4, __Vtemp_6);
        VL_ADD_W(4, __Vtemp_8, __Vtemp_3, __Vtemp_7);
        VL_ADD_W(4, vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__multiplier__DOT___result_s_T, __Vtemp_1, __Vtemp_8);
        if (vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__multiplier__DOT__out_sign) {
            VL_NEGATE_W(4, vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__multiplier__DOT__result_s, vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__multiplier__DOT___result_s_T);
        } else {
            vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__multiplier__DOT__result_s[0U] 
                = vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__multiplier__DOT___result_s_T[0U];
            vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__multiplier__DOT__result_s[1U] 
                = vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__multiplier__DOT___result_s_T[1U];
            vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__multiplier__DOT__result_s[2U] 
                = vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__multiplier__DOT___result_s_T[2U];
            vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__multiplier__DOT__result_s[3U] 
                = vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__multiplier__DOT___result_s_T[3U];
        }
    } else {
        vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__multiplier__DOT___result_s_T[0U] = 0U;
        vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__multiplier__DOT___result_s_T[1U] = 0U;
        vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__multiplier__DOT___result_s_T[2U] = 0U;
        vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__multiplier__DOT___result_s_T[3U] = 0U;
        vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__multiplier__DOT__result_s[0U] = 0U;
        vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__multiplier__DOT__result_s[1U] = 0U;
        vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__multiplier__DOT__result_s[2U] = 0U;
        vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__multiplier__DOT__result_s[3U] = 0U;
    }
    vlSelfRef.__VdfgRegularize_hebeb780c_0_30 = ((0x0cU 
                                                  != (IData)(vlSelfRef.nicore__DOT__dcache__DOT__cache_state)) 
                                                 & ((0x0dU 
                                                     != (IData)(vlSelfRef.nicore__DOT__dcache__DOT__cache_state)) 
                                                    & ((8U 
                                                        == (IData)(vlSelfRef.nicore__DOT__dcache__DOT__cache_state)) 
                                                       & (9U 
                                                          != (IData)(vlSelfRef.nicore__DOT__dcache__DOT__cache_state)))));
    vlSelfRef.__VdfgRegularize_hebeb780c_0_36 = ((4U 
                                                  != (IData)(vlSelfRef.nicore__DOT__icache__DOT__cache_state)) 
                                                 & ((5U 
                                                     != (IData)(vlSelfRef.nicore__DOT__icache__DOT__cache_state)) 
                                                    & ((6U 
                                                        != (IData)(vlSelfRef.nicore__DOT__icache__DOT__cache_state)) 
                                                       & ((0x0cU 
                                                           != (IData)(vlSelfRef.nicore__DOT__icache__DOT__cache_state)) 
                                                          & ((0x0dU 
                                                              != (IData)(vlSelfRef.nicore__DOT__icache__DOT__cache_state)) 
                                                             & ((8U 
                                                                 == (IData)(vlSelfRef.nicore__DOT__icache__DOT__cache_state)) 
                                                                & (9U 
                                                                   != (IData)(vlSelfRef.nicore__DOT__icache__DOT__cache_state))))))));
    vlSelfRef.nicore__DOT__dcache__DOT___T_58 = ((IData)(vlSelfRef.nicore__DOT__dcache__DOT__write_data_reg) 
                                                 & (IData)(vlSelfRef.nicore__DOT__dcache__DOT__write_addr_reg));
    VL_SUB_W(4, vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__divider__DOT___mid64_result_T_1, vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__divider__DOT__dividend, vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__divider__DOT__divisor);
    __VdfgRegularize_hebeb780c_0_315 = ((0x0323U == 
                                         (vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst 
                                          >> 0x00000014U)) 
                                        | ((0x0324U 
                                            == (vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst 
                                                >> 0x00000014U)) 
                                           | ((0x0325U 
                                               == (vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst 
                                                   >> 0x00000014U)) 
                                              | ((0x0326U 
                                                  == 
                                                  (vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst 
                                                   >> 0x00000014U)) 
                                                 | ((0x0b03U 
                                                     == 
                                                     (vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst 
                                                      >> 0x00000014U)) 
                                                    | ((0x0b04U 
                                                        == 
                                                        (vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst 
                                                         >> 0x00000014U)) 
                                                       | ((0x0b05U 
                                                           == 
                                                           (vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst 
                                                            >> 0x00000014U)) 
                                                          | ((0x0b06U 
                                                              == 
                                                              (vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst 
                                                               >> 0x00000014U)) 
                                                             | ((0x03b0U 
                                                                 == 
                                                                 (vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst 
                                                                  >> 0x00000014U)) 
                                                                | ((0x03b1U 
                                                                    == 
                                                                    (vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst 
                                                                     >> 0x00000014U)) 
                                                                   | ((0x03b2U 
                                                                       == 
                                                                       (vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst 
                                                                        >> 0x00000014U)) 
                                                                      | ((0x03b3U 
                                                                          == 
                                                                          (vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst 
                                                                           >> 0x00000014U)) 
                                                                         | ((0x03b4U 
                                                                             == 
                                                                             (vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst 
                                                                              >> 0x00000014U)) 
                                                                            | ((0x03b5U 
                                                                                == 
                                                                                (vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst 
                                                                                >> 0x00000014U)) 
                                                                               | ((0x03b6U 
                                                                                == 
                                                                                (vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst 
                                                                                >> 0x00000014U)) 
                                                                                | ((0x03b7U 
                                                                                == 
                                                                                (vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst 
                                                                                >> 0x00000014U)) 
                                                                                | ((0x03b8U 
                                                                                == 
                                                                                (vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst 
                                                                                >> 0x00000014U)) 
                                                                                | ((0x03b9U 
                                                                                == 
                                                                                (vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst 
                                                                                >> 0x00000014U)) 
                                                                                | ((0x03baU 
                                                                                == 
                                                                                (vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst 
                                                                                >> 0x00000014U)) 
                                                                                | ((0x03bbU 
                                                                                == 
                                                                                (vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst 
                                                                                >> 0x00000014U)) 
                                                                                | ((0x03bcU 
                                                                                == 
                                                                                (vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst 
                                                                                >> 0x00000014U)) 
                                                                                | ((0x03bdU 
                                                                                == 
                                                                                (vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst 
                                                                                >> 0x00000014U)) 
                                                                                | ((0x03beU 
                                                                                == 
                                                                                (vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst 
                                                                                >> 0x00000014U)) 
                                                                                | (0x03bfU 
                                                                                == 
                                                                                (vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst 
                                                                                >> 0x00000014U)))))))))))))))))))))))));
    vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__iTLB__DOT___io_tlb_request_addr_T_4 
        = (vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__iTLB__DOT__pte_reg_ppn 
           << 0x0000000cU);
    vlSelfRef.nicore__DOT__datapath__DOT__csr__DOT___T_2 
        = ((vlSelfRef.nicore__DOT__datapath__DOT__csr__DOT__stvec_base 
            << 2U) | (QData)((IData)(vlSelfRef.nicore__DOT__datapath__DOT__csr__DOT__stvec_mode)));
    vlSelfRef.nicore__DOT__datapath__DOT__csr__DOT___T_3 
        = (((QData)((IData)(vlSelfRef.nicore__DOT__datapath__DOT__csr__DOT__scause_int)) 
            << 0x0000003fU) | vlSelfRef.nicore__DOT__datapath__DOT__csr__DOT__scause_code);
    vlSelfRef.nicore__DOT__datapath__DOT__csr__DOT___T_9 
        = ((vlSelfRef.nicore__DOT__datapath__DOT__csr__DOT__mtvec_base 
            << 2U) | (QData)((IData)(vlSelfRef.nicore__DOT__datapath__DOT__csr__DOT__mtvec_mode)));
    vlSelfRef.nicore__DOT__datapath__DOT__csr__DOT___T_10 
        = (((QData)((IData)(vlSelfRef.nicore__DOT__datapath__DOT__csr__DOT__mcause_int)) 
            << 0x0000003fU) | vlSelfRef.nicore__DOT__datapath__DOT__csr__DOT__mcause_code);
    vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__immGen__DOT___Iimm_T_1 
        = (- (IData)((vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst 
                      >> 0x0000001fU)));
    vlSelfRef.nicore__DOT__datapath__DOT__csr__DOT___T 
        = (QData)((IData)((((IData)(vlSelfRef.nicore__DOT__datapath__DOT__csr__DOT__mstatus_sum) 
                            << 0x00000012U) | (((IData)(vlSelfRef.nicore__DOT__datapath__DOT__csr__DOT__mstatus_spp) 
                                                << 8U) 
                                               | (((IData)(vlSelfRef.nicore__DOT__datapath__DOT__csr__DOT__mstatus_spie) 
                                                   << 5U) 
                                                  | ((IData)(vlSelfRef.nicore__DOT__datapath__DOT__csr__DOT__mstatus_sie) 
                                                     << 1U))))));
    vlSelfRef.nicore__DOT__dcache__DOT___GEN_284 = 
        (vlSelfRef.nicore__DOT__dcache__DOT__cpu_request_data 
         & (- (QData)((IData)((1U & (~ (vlSelfRef.nicore__DOT__dcache__DOT__cpu_request_addr_reg 
                                        >> 3U)))))));
    vlSelfRef.nicore__DOT__dcache__DOT___GEN_285 = 
        (vlSelfRef.nicore__DOT__dcache__DOT__cpu_request_data 
         & (- (QData)((IData)((1U & (vlSelfRef.nicore__DOT__dcache__DOT__cpu_request_addr_reg 
                                     >> 3U))))));
    vlSelfRef.nicore__DOT__dcache_io_mem_io_w_ready 
        = ((IData)(vlSelfRef.io_master_wready) & (3U 
                                                  == (IData)(vlSelfRef.nicore__DOT__arb__DOT__state)));
    vlSelfRef.nicore__DOT__datapath__DOT__csr__DOT___sstatus_T 
        = (QData)((IData)(((((IData)(vlSelfRef.nicore__DOT__datapath__DOT__csr__DOT__mstatus_mxr) 
                             << 0x00000013U) | (((IData)(vlSelfRef.nicore__DOT__datapath__DOT__csr__DOT__mstatus_sum) 
                                                 << 0x00000012U) 
                                                | (((IData)(vlSelfRef.nicore__DOT__datapath__DOT__csr__DOT__mstatus_mprv) 
                                                    << 0x00000011U) 
                                                   | ((IData)(vlSelfRef.nicore__DOT__datapath__DOT__csr__DOT__mstatus_mpp) 
                                                      << 0x0000000bU)))) 
                           | ((((IData)(vlSelfRef.nicore__DOT__datapath__DOT__csr__DOT__mstatus_spp) 
                                << 8U) | (((IData)(vlSelfRef.nicore__DOT__datapath__DOT__csr__DOT__mstatus_mpie) 
                                           << 7U) | 
                                          ((IData)(vlSelfRef.nicore__DOT__datapath__DOT__csr__DOT__mstatus_spie) 
                                           << 5U))) 
                              | (((IData)(vlSelfRef.nicore__DOT__datapath__DOT__csr__DOT__mstatus_mie) 
                                  << 3U) | ((IData)(vlSelfRef.nicore__DOT__datapath__DOT__csr__DOT__mstatus_sie) 
                                            << 1U))))));
    vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__iTLB_io_satp 
        = (((QData)((IData)(vlSelfRef.nicore__DOT__datapath__DOT__csr__DOT__satp_mode)) 
            << 0x0000003cU) | vlSelfRef.nicore__DOT__datapath__DOT__csr__DOT__satp_ppn);
    vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_191 
        = (0x0000000fU == (0x0001ffffU & vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst));
    vlSelfRef.nicore__DOT__icache__DOT___GEN_463 = 
        (- (QData)((IData)(vlSelfRef.nicore__DOT__icache__DOT__index)));
    vlSelfRef.nicore__DOT__icache__DOT___GEN_462 = 
        (- (QData)((IData)((1U & (~ (IData)(vlSelfRef.nicore__DOT__icache__DOT__index))))));
    vlSelfRef.__VdfgRegularize_hebeb780c_0_304 = ((IData)(vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__de_pipe_reg_enable) 
                                                  & (1U 
                                                     == (IData)(vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__de_pipe_reg_pc_sel)));
    vlSelfRef.nicore__DOT__datapath__DOT__sfence_em 
        = ((IData)(vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__em_pipe_reg_enable) 
           & (0x12000073U == (0xfe007fffU & vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__em_pipe_reg_inst)));
    vlSelfRef.nicore__DOT__dcache__DOT___GEN_15 = (0x3fU 
                                                   != (IData)(vlSelfRef.nicore__DOT__dcache__DOT__flush_loop));
    vlSelfRef.nicore__DOT__dcache__DOT___GEN_463 = 
        (- (QData)((IData)(vlSelfRef.nicore__DOT__dcache__DOT__index)));
    vlSelfRef.nicore__DOT__dcache__DOT___GEN_462 = 
        (- (QData)((IData)((1U & (~ (IData)(vlSelfRef.nicore__DOT__dcache__DOT__index))))));
    vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__dTLB_io_priv 
        = ((IData)(vlSelfRef.nicore__DOT__datapath__DOT__csr__DOT__mstatus_mprv)
            ? (IData)(vlSelfRef.nicore__DOT__datapath__DOT__csr__DOT__mstatus_mpp)
            : (IData)(vlSelfRef.nicore__DOT__datapath__DOT__csr__DOT__mode));
    vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT___io_tlb_request_addr_T_4 
        = (vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT__pte_reg_ppn 
           << 0x0000000cU);
    vlSelfRef.nicore__DOT__dcache__DOT___wmask_T_24 
        = (((QData)((IData)(((((0x0000ff00U & ((- (IData)(
                                                          (1U 
                                                           & ((IData)(vlSelfRef.nicore__DOT__dcache__DOT__cpu_request_mask) 
                                                              >> 7U)))) 
                                               << 8U)) 
                               | (0x000000ffU & (- (IData)(
                                                           (1U 
                                                            & ((IData)(vlSelfRef.nicore__DOT__dcache__DOT__cpu_request_mask) 
                                                               >> 6U)))))) 
                              << 0x00000010U) | ((0x0000ff00U 
                                                  & ((- (IData)(
                                                                (1U 
                                                                 & ((IData)(vlSelfRef.nicore__DOT__dcache__DOT__cpu_request_mask) 
                                                                    >> 5U)))) 
                                                     << 8U)) 
                                                 | (0x000000ffU 
                                                    & (- (IData)(
                                                                 (1U 
                                                                  & ((IData)(vlSelfRef.nicore__DOT__dcache__DOT__cpu_request_mask) 
                                                                     >> 4U))))))))) 
            << 0x00000020U) | (QData)((IData)(((((0x0000ff00U 
                                                  & ((- (IData)(
                                                                (1U 
                                                                 & ((IData)(vlSelfRef.nicore__DOT__dcache__DOT__cpu_request_mask) 
                                                                    >> 3U)))) 
                                                     << 8U)) 
                                                 | (0x000000ffU 
                                                    & (- (IData)(
                                                                 (1U 
                                                                  & ((IData)(vlSelfRef.nicore__DOT__dcache__DOT__cpu_request_mask) 
                                                                     >> 2U)))))) 
                                                << 0x00000010U) 
                                               | ((0x0000ff00U 
                                                   & ((- (IData)(
                                                                 (1U 
                                                                  & ((IData)(vlSelfRef.nicore__DOT__dcache__DOT__cpu_request_mask) 
                                                                     >> 1U)))) 
                                                      << 8U)) 
                                                  | (0x000000ffU 
                                                     & (- (IData)(
                                                                  (1U 
                                                                   & (IData)(vlSelfRef.nicore__DOT__dcache__DOT__cpu_request_mask))))))))));
    vlSelfRef.nicore__DOT__datapath__DOT__csr__DOT__excCause 
        = ((1U & (IData)(vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__em_pipe_reg_iTLB_fault))
            ? 0x000000000000000cULL : (((IData)(vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__em_pipe_reg_csr_is_illegal)
                                         ? 2ULL : ((IData)(vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__em_pipe_reg_csr_load_misalign)
                                                    ? 4ULL
                                                    : 
                                                   ((IData)(vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__em_pipe_reg_csr_store_misalign)
                                                     ? 6ULL
                                                     : 
                                                    ((0U 
                                                      != (IData)(vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__dTLB_fault_reg))
                                                      ? 
                                                     ((2U 
                                                       == (IData)(vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__dTLB_fault_reg))
                                                       ? 0x000000000000000dULL
                                                       : 0x000000000000000fULL)
                                                      : 
                                                     ((0x00100073U 
                                                       == vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__em_pipe_reg_inst)
                                                       ? 3ULL
                                                       : 
                                                      ((0U 
                                                        == (IData)(vlSelfRef.nicore__DOT__datapath__DOT__csr__DOT__mode))
                                                        ? 8ULL
                                                        : 
                                                       ((1U 
                                                         == (IData)(vlSelfRef.nicore__DOT__datapath__DOT__csr__DOT__mode))
                                                         ? 9ULL
                                                         : 0x000000000000000bULL))))))) 
                                       & (- (QData)((IData)(
                                                            (1U 
                                                             & (~ (IData)(vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__em_pipe_reg_csr_inst_misalign))))))));
    vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__iTLB__DOT__ppn_base 
        = (vlSelfRef.nicore__DOT__datapath__DOT__csr__DOT__satp_ppn 
           << 0x0000000cU);
    vlSelfRef.nicore__DOT__dcache__DOT___T_40 = (1U 
                                                 & (~ (IData)(vlSelfRef.nicore__DOT__dcache__DOT__write_data_reg)));
    vlSelfRef.nicore__DOT__dcache_io_mem_io_b_valid 
        = ((IData)(vlSelfRef.io_master_bvalid) & (7U 
                                                  == (IData)(vlSelfRef.nicore__DOT__arb__DOT__state)));
    vlSelfRef.__VdfgRegularize_hebeb780c_0_411 = ((IData)(vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__dcache_flush_tag) 
                                                  | (IData)(vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__icache_flush_tag));
    vlSelfRef.nicore__DOT__datapath__DOT__csr__DOT___T_356 
        = (0x10200073U != vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__em_pipe_reg_inst);
    vlSelfRef.nicore__DOT__datapath__DOT__csr__DOT___T_358 
        = (0x30200073U != vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__em_pipe_reg_inst);
    vlSelfRef.nicore__DOT__datapath__DOT___csr_atomic_flush_T_1 
        = ((IData)(vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__mw_pipe_reg_enable) 
           & (0U != (IData)(vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__mw_pipe_reg_csr_write_op)));
    vlSelfRef.nicore__DOT__datapath__DOT___csr_atomic_flush_T_3 
        = ((IData)(vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__em_pipe_reg_enable) 
           & (0U != (IData)(vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__em_pipe_reg_csr_write_op)));
    vlSelfRef.nicore__DOT__datapath__DOT___csr_atomic_flush_T_5 
        = ((IData)(vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__de_pipe_reg_enable) 
           & (0U != (IData)(vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__de_pipe_reg_csr_write_op)));
    vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT___T_197 
        = ((- (QData)((IData)((0U != (IData)(vlSelfRef.nicore__DOT__dcache__DOT__cache_state))))) 
           & ((- (QData)((IData)((0x0fU != (IData)(vlSelfRef.nicore__DOT__dcache__DOT__cache_state))))) 
              & ((- (QData)((IData)((0x10U != (IData)(vlSelfRef.nicore__DOT__dcache__DOT__cache_state))))) 
                 & ((- (QData)((IData)((0x11U != (IData)(vlSelfRef.nicore__DOT__dcache__DOT__cache_state))))) 
                    & ((- (QData)((IData)((0x13U != (IData)(vlSelfRef.nicore__DOT__dcache__DOT__cache_state))))) 
                       & (((3U == (IData)(vlSelfRef.nicore__DOT__dcache__DOT__cache_state))
                            ? vlSelfRef.io_master_rdata
                            : ((- (QData)((IData)((4U 
                                                   != (IData)(vlSelfRef.nicore__DOT__dcache__DOT__cache_state))))) 
                               & ((- (QData)((IData)(
                                                     (5U 
                                                      != (IData)(vlSelfRef.nicore__DOT__dcache__DOT__cache_state))))) 
                                  & ((- (QData)((IData)(
                                                        (6U 
                                                         != (IData)(vlSelfRef.nicore__DOT__dcache__DOT__cache_state))))) 
                                     & (vlSelfRef.nicore__DOT__dcache__DOT__tmp_response_data 
                                        & (- (QData)((IData)(
                                                             (0x0cU 
                                                              == (IData)(vlSelfRef.nicore__DOT__dcache__DOT__cache_state)))))))))) 
                          & (- (QData)((IData)((1U 
                                                != (IData)(vlSelfRef.nicore__DOT__dcache__DOT__cache_state)))))))))));
    vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT___is_clint_T_6 
        = ((0U != (IData)(vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__de_pipe_reg_ld_type)) 
           | (0U != (IData)(vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__de_pipe_reg_st_type)));
    vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T 
        = (0x0000007fU & vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst);
    vlSelfRef.nicore__DOT__dcache_io_mem_io_r_valid 
        = ((IData)(vlSelfRef.io_master_rvalid) & (2U 
                                                  == (IData)(vlSelfRef.nicore__DOT__arb__DOT__state)));
    vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_6 
        = (0x0000707fU & vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst);
    vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_42 
        = (0xf9f0707fU & vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst);
    vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_47 
        = (0x3000202fU == (0xf000707fU & vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst));
    vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_49 
        = (0x3000302fU == (0xf000707fU & vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst));
    vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_51 
        = (0x1000202fU == (0xf000707fU & vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst));
    vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_53 
        = (0x1000302fU == (0xf000707fU & vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst));
    vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_55 
        = (0x0000202fU == (0xf000707fU & vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst));
    vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_57 
        = (0x0000302fU == (0xf000707fU & vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst));
    vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_59 
        = (0x4000202fU == (0xf000707fU & vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst));
    vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_61 
        = (0x4000302fU == (0xf000707fU & vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst));
    vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_63 
        = (0xc000202fU == (0xf000707fU & vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst));
    vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_65 
        = (0xc000302fU == (0xf000707fU & vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst));
    vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_67 
        = (0x8000202fU == (0xf000707fU & vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst));
    vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_100 
        = (0xfc00707fU & vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst);
    vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_69 
        = (0x8000302fU == (0xf000707fU & vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst));
    vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_102 
        = (0xfe00707fU & vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst);
    vlSelfRef.__VdfgRegularize_hebeb780c_0_320 = ((0x10200073U 
                                                   == vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__em_pipe_reg_inst) 
                                                  | (0x30200073U 
                                                     == vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__em_pipe_reg_inst));
    vlSelfRef.nicore__DOT__datapath__DOT__csr__DOT___T_1 
        = (QData)((IData)((((IData)(vlSelfRef.nicore__DOT__datapath__DOT__csr__DOT__mie_seie) 
                            << 9U) | (((IData)(vlSelfRef.nicore__DOT__datapath__DOT__csr__DOT__mie_stie) 
                                       << 5U) | ((IData)(vlSelfRef.nicore__DOT__datapath__DOT__csr__DOT__mie_ssie) 
                                                 << 1U)))));
    vlSelfRef.nicore__DOT__datapath__DOT__csr__DOT___T_4 
        = (QData)((IData)((((IData)(vlSelfRef.nicore__DOT__datapath__DOT__csr__DOT__mip_seip) 
                            << 9U) | (((IData)(vlSelfRef.nicore__DOT__datapath__DOT__csr__DOT__mip_stip) 
                                       << 5U) | ((IData)(vlSelfRef.nicore__DOT__datapath__DOT__csr__DOT__mip_ssip) 
                                                 << 1U)))));
    vlSelfRef.nicore__DOT__datapath__DOT__csr__DOT___sie_T 
        = (QData)((IData)(((((((IData)(vlSelfRef.nicore__DOT__datapath__DOT__csr__DOT__mie_meie) 
                               << 5U) | ((IData)(vlSelfRef.nicore__DOT__datapath__DOT__csr__DOT__mie_seie) 
                                         << 3U)) | 
                             ((IData)(vlSelfRef.nicore__DOT__datapath__DOT__csr__DOT__mie_mtie) 
                              << 1U)) << 6U) | ((((IData)(vlSelfRef.nicore__DOT__datapath__DOT__csr__DOT__mie_stie) 
                                                  << 5U) 
                                                 | ((IData)(vlSelfRef.nicore__DOT__datapath__DOT__csr__DOT__mie_msie) 
                                                    << 3U)) 
                                                | ((IData)(vlSelfRef.nicore__DOT__datapath__DOT__csr__DOT__mie_ssie) 
                                                   << 1U)))));
    vlSelfRef.nicore__DOT__datapath__DOT__csr__DOT___sip_T 
        = (QData)((IData)(((((((IData)(vlSelfRef.nicore__DOT__datapath__DOT__csr__DOT__mip_meip) 
                               << 5U) | ((IData)(vlSelfRef.nicore__DOT__datapath__DOT__csr__DOT__mip_seip) 
                                         << 3U)) | 
                             ((IData)(vlSelfRef.nicore__DOT__datapath__DOT__csr__DOT__mip_mtip) 
                              << 1U)) << 6U) | ((((IData)(vlSelfRef.nicore__DOT__datapath__DOT__csr__DOT__mip_stip) 
                                                  << 5U) 
                                                 | ((IData)(vlSelfRef.nicore__DOT__datapath__DOT__csr__DOT__mip_msip) 
                                                    << 3U)) 
                                                | ((IData)(vlSelfRef.nicore__DOT__datapath__DOT__csr__DOT__mip_ssip) 
                                                   << 1U)))));
    vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT___T_31 
        = (vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__de_pipe_reg_src2_addr 
           == (QData)((IData)(vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__mw_pipe_reg_dest)));
    vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT___T_19 
        = (vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__de_pipe_reg_src1_addr 
           == (QData)((IData)(vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__mw_pipe_reg_dest)));
    vlSelfRef.nicore__DOT__datapath__DOT__csr__DOT__writeEn 
        = ((IData)(vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__mw_pipe_reg_enable) 
           & ((2U == (IData)(vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__mw_pipe_reg_csr_write_op)) 
              | ((3U == (IData)(vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__mw_pipe_reg_csr_write_op)) 
                 | ((4U == (IData)(vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__mw_pipe_reg_csr_write_op)) 
                    | (5U == (IData)(vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__mw_pipe_reg_csr_write_op))))));
    vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT___T_12 
        = ((IData)(vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__em_pipe_reg_enable) 
           & (IData)(vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__em_pipe_reg_wb_en));
    vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT___T_18 
        = ((IData)(vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__mw_pipe_reg_wb_en) 
           & (IData)(vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__mw_pipe_reg_enable));
    __Vtemp_9[0U] = ((IData)((7ULL & vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__em_pipe_reg_alu_out)) 
                     << 3U);
    __Vtemp_9[1U] = (((IData)((7ULL & vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__em_pipe_reg_alu_out)) 
                      >> 0x0000001dU) | ((IData)(((7ULL 
                                                   & vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__em_pipe_reg_alu_out) 
                                                  >> 0x00000020U)) 
                                         << 3U));
    __Vtemp_9[2U] = ((IData)(((7ULL & vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__em_pipe_reg_alu_out) 
                              >> 0x00000020U)) >> 0x0000001dU);
    vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT___load_data_hazard_T_3 
        = VL_SHIFTR_QQW(64,64,67, vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__data_cache_response_data, __Vtemp_9);
    vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT___csr_write_data_T_8 
        = (4ULL + vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__mw_pipe_reg_pc);
    vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT___next_pc_T_8 
        = (4ULL + vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__em_pipe_reg_pc);
    vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__sc_fire 
        = ((IData)(vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__resv_valid) 
           & (2U == (IData)(vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__em_pipe_reg_amo_op)));
    vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__is_amo 
        = ((IData)(vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__em_pipe_reg_enable) 
           & (0U != (IData)(vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__em_pipe_reg_amo_op)));
    vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__iTLB__DOT___T_236 
        = ((IData)(vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__iTLB__DOT__pte_reg_X) 
           & ((3U == (IData)(vlSelfRef.nicore__DOT__datapath__DOT__csr__DOT__mode)) 
              | ((1U == (IData)(vlSelfRef.nicore__DOT__datapath__DOT__csr__DOT__mode))
                  ? ((~ (IData)(vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__iTLB__DOT__pte_reg_U)) 
                     | (IData)(vlSelfRef.nicore__DOT__datapath__DOT__csr__DOT__mstatus_sum))
                  : ((IData)(vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__iTLB__DOT__pte_reg_U) 
                     | (0U != (IData)(vlSelfRef.nicore__DOT__datapath__DOT__csr__DOT__mode))))));
    vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__iTLB__DOT__permList_0 
        = ((IData)(vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__iTLB__DOT__matchList_0) 
           & ((IData)(vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__iTLB__DOT__tlbe_0_X) 
              & (((1U == (IData)(vlSelfRef.nicore__DOT__datapath__DOT__csr__DOT__mode))
                   ? ((~ (IData)(vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__iTLB__DOT__tlbe_0_U)) 
                      | (IData)(vlSelfRef.nicore__DOT__datapath__DOT__csr__DOT__mstatus_sum))
                   : ((IData)(vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__iTLB__DOT__tlbe_0_U) 
                      | (0U != (IData)(vlSelfRef.nicore__DOT__datapath__DOT__csr__DOT__mode)))) 
                 | (3U == (IData)(vlSelfRef.nicore__DOT__datapath__DOT__csr__DOT__mode)))));
    vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT___mem_wen_T_1 
        = ((IData)(vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__em_pipe_reg_enable) 
           & (0U != (IData)(vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__em_pipe_reg_st_type)));
    vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT___src_unready_T_1 
        = (vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__de_pipe_reg_src2_addr 
           == (QData)((IData)(vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__em_pipe_reg_dest)));
    vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT___src_unready_T 
        = (vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__de_pipe_reg_src1_addr 
           == (QData)((IData)(vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__em_pipe_reg_dest)));
    vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__divider_io_div_signed 
        = ((0x0eU == (IData)(vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__de_pipe_reg_alu_op)) 
           | (0x0dU == (IData)(vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__de_pipe_reg_alu_op)));
    vlSelfRef.__VdfgRegularize_hebeb780c_0_408 = ((0x0cU 
                                                   == (IData)(vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__de_pipe_reg_alu_op)) 
                                                  & ((~ (IData)(vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__mul_result_enable)) 
                                                     & (IData)(vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__de_pipe_reg_enable)));
    vlSelfRef.__VdfgRegularize_hebeb780c_0_407 = ((~ (IData)(vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__div_result_enable)) 
                                                  & (IData)(vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__de_pipe_reg_enable));
    vlSelfRef.__VdfgRegularize_hebeb780c_0_300 = ((0U 
                                                   != (IData)(vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__em_pipe_reg_ld_type)) 
                                                  | (0U 
                                                     != (IData)(vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__em_pipe_reg_st_type)));
    vlSelfRef.nicore__DOT__icache_io_mem_io_r_valid 
        = ((IData)(vlSelfRef.io_master_rvalid) & (1U 
                                                  == (IData)(vlSelfRef.nicore__DOT__arb__DOT__state)));
    vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__iTLB__DOT___T_197 
        = ((- (QData)((IData)((0U != (IData)(vlSelfRef.nicore__DOT__icache__DOT__cache_state))))) 
           & ((- (QData)((IData)((0x0fU != (IData)(vlSelfRef.nicore__DOT__icache__DOT__cache_state))))) 
              & ((- (QData)((IData)((0x10U != (IData)(vlSelfRef.nicore__DOT__icache__DOT__cache_state))))) 
                 & ((- (QData)((IData)((0x11U != (IData)(vlSelfRef.nicore__DOT__icache__DOT__cache_state))))) 
                    & ((- (QData)((IData)((0x13U != (IData)(vlSelfRef.nicore__DOT__icache__DOT__cache_state))))) 
                       & (((3U == (IData)(vlSelfRef.nicore__DOT__icache__DOT__cache_state))
                            ? vlSelfRef.io_master_rdata
                            : ((- (QData)((IData)((4U 
                                                   != (IData)(vlSelfRef.nicore__DOT__icache__DOT__cache_state))))) 
                               & ((- (QData)((IData)(
                                                     (5U 
                                                      != (IData)(vlSelfRef.nicore__DOT__icache__DOT__cache_state))))) 
                                  & ((- (QData)((IData)(
                                                        (6U 
                                                         != (IData)(vlSelfRef.nicore__DOT__icache__DOT__cache_state))))) 
                                     & (vlSelfRef.nicore__DOT__icache__DOT__tmp_response_data 
                                        & (- (QData)((IData)(
                                                             (0x0cU 
                                                              == (IData)(vlSelfRef.nicore__DOT__icache__DOT__cache_state)))))))))) 
                          & (- (QData)((IData)((1U 
                                                != (IData)(vlSelfRef.nicore__DOT__icache__DOT__cache_state)))))))))));
    vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__iTLB_io_valid 
        = ((~ ((IData)(vlSelfRef.nicore__DOT__datapath__DOT__csr__DOT__mode) 
               >> 1U)) & (8U == (IData)(vlSelfRef.nicore__DOT__datapath__DOT__csr__DOT__satp_mode)));
    vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__multiplier_io_mul_op 
        = (3U & (((0x02001033U == vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT___multiplier_io_mul_op_T)
                   ? 1U : (2U | (- (IData)((0x02002033U 
                                            == vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT___multiplier_io_mul_op_T))))) 
                 & (- (IData)((1U & (~ ((0x02000033U 
                                         == vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT___multiplier_io_mul_op_T) 
                                        | (0x0200003bU 
                                           == vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT___multiplier_io_mul_op_T))))))));
    vlSelfRef.io_master_arvalid = (((5U == (IData)(vlSelfRef.nicore__DOT__arb__DOT__state)) 
                                    | (4U == (IData)(vlSelfRef.nicore__DOT__arb__DOT__state))) 
                                   & ((IData)(vlSelfRef.nicore__DOT__dcache_io_mem_io_ar_valid) 
                                      | (IData)(vlSelfRef.nicore__DOT__icache_io_mem_io_ar_valid)));
    vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__divider__DOT___GEN_4 
        = (0x0000003fU & ((IData)(vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__divider__DOT__w_counter_enable)
                           ? (((IData)(1U) + (IData)(vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__divider__DOT__windex)) 
                              & (- (IData)((0x20U != (IData)(vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__divider__DOT__windex)))))
                           : (IData)(vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__divider__DOT__windex)));
    vlSelfRef.nicore__DOT__dcache_io_mem_io_aw_valid 
        = ((0U != (IData)(vlSelfRef.nicore__DOT__dcache__DOT__cache_state)) 
           & ((0x0fU != (IData)(vlSelfRef.nicore__DOT__dcache__DOT__cache_state)) 
              & ((0x10U != (IData)(vlSelfRef.nicore__DOT__dcache__DOT__cache_state)) 
                 & ((0x11U == (IData)(vlSelfRef.nicore__DOT__dcache__DOT__cache_state))
                     ? (IData)(vlSelfRef.nicore__DOT__dcache__DOT___T_35)
                     : ((0x13U != (IData)(vlSelfRef.nicore__DOT__dcache__DOT__cache_state)) 
                        & ((1U != (IData)(vlSelfRef.nicore__DOT__dcache__DOT__cache_state)) 
                           & ((3U != (IData)(vlSelfRef.nicore__DOT__dcache__DOT__cache_state)) 
                              & ((4U == (IData)(vlSelfRef.nicore__DOT__dcache__DOT__cache_state))
                                  ? (IData)(vlSelfRef.nicore__DOT__dcache__DOT___T_35)
                                  : ((5U != (IData)(vlSelfRef.nicore__DOT__dcache__DOT__cache_state)) 
                                     & ((6U != (IData)(vlSelfRef.nicore__DOT__dcache__DOT__cache_state)) 
                                        & ((0x0cU != (IData)(vlSelfRef.nicore__DOT__dcache__DOT__cache_state)) 
                                           & ((0x0dU 
                                               != (IData)(vlSelfRef.nicore__DOT__dcache__DOT__cache_state)) 
                                              & ((9U 
                                                  != (IData)(vlSelfRef.nicore__DOT__dcache__DOT__cache_state)) 
                                                 & ((8U 
                                                     != (IData)(vlSelfRef.nicore__DOT__dcache__DOT__cache_state)) 
                                                    & ((0x0eU 
                                                        != (IData)(vlSelfRef.nicore__DOT__dcache__DOT__cache_state)) 
                                                       & ((IData)(vlSelfRef.nicore__DOT__dcache__DOT___T_35) 
                                                          & (7U 
                                                             == (IData)(vlSelfRef.nicore__DOT__dcache__DOT__cache_state))))))))))))))))));
    vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__divider__DOT__counter_enable 
        = ((IData)(vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__divider__DOT___counter_enable_T_1) 
           & (1U == (IData)(vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__divider__DOT__div_state)));
    vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__amo_result 
        = ((0x0bU == (IData)(vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__em_pipe_reg_amo_op))
            ? ((vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__a1 
                > vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__a2)
                ? vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__a1
                : vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__a2)
            : ((0x0aU == (IData)(vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__em_pipe_reg_amo_op))
                ? ((vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__a1 
                    < vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__a2)
                    ? vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__a1
                    : vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__a2)
                : ((9U == (IData)(vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__em_pipe_reg_amo_op))
                    ? (((1U == (IData)(vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__em_pipe_reg_ld_type))
                         ? VL_GTS_III(32, (IData)(vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__amo_old), (IData)(vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__em_pipe_reg_st_data))
                         : VL_GTS_IQQ(64, vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__a1, vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__a2))
                        ? vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__a1
                        : vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__a2)
                    : ((8U == (IData)(vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__em_pipe_reg_amo_op))
                        ? (((1U == (IData)(vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__em_pipe_reg_ld_type))
                             ? VL_LTS_III(32, (IData)(vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__amo_old), (IData)(vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__em_pipe_reg_st_data))
                             : VL_LTS_IQQ(64, vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__a1, vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__a2))
                            ? vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__a1
                            : vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__a2)
                        : ((7U == (IData)(vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__em_pipe_reg_amo_op))
                            ? (vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__a2 
                               | vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__a1)
                            : ((6U == (IData)(vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__em_pipe_reg_amo_op))
                                ? (vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__a2 
                                   & vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__a1)
                                : ((5U == (IData)(vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__em_pipe_reg_amo_op))
                                    ? (vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__a2 
                                       ^ vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__a1)
                                    : ((4U == (IData)(vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__em_pipe_reg_amo_op))
                                        ? (vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__a2 
                                           + vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__a1)
                                        : (vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__em_pipe_reg_st_data 
                                           & (- (QData)((IData)(
                                                                (3U 
                                                                 == (IData)(vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__em_pipe_reg_amo_op))))))))))))));
    vlSelfRef.io_master_rready = (((1U == (IData)(vlSelfRef.nicore__DOT__arb__DOT__state)) 
                                   & ((0U != (IData)(vlSelfRef.nicore__DOT__icache__DOT__cache_state)) 
                                      & ((0x0fU != (IData)(vlSelfRef.nicore__DOT__icache__DOT__cache_state)) 
                                         & ((0x10U 
                                             != (IData)(vlSelfRef.nicore__DOT__icache__DOT__cache_state)) 
                                            & ((0x11U 
                                                != (IData)(vlSelfRef.nicore__DOT__icache__DOT__cache_state)) 
                                               & ((0x13U 
                                                   != (IData)(vlSelfRef.nicore__DOT__icache__DOT__cache_state)) 
                                                  & ((1U 
                                                      != (IData)(vlSelfRef.nicore__DOT__icache__DOT__cache_state)) 
                                                     & ((3U 
                                                         == (IData)(vlSelfRef.nicore__DOT__icache__DOT__cache_state)) 
                                                        | (IData)(vlSelfRef.__VdfgRegularize_hebeb780c_0_36))))))))) 
                                  | ((2U == (IData)(vlSelfRef.nicore__DOT__arb__DOT__state)) 
                                     & ((0U != (IData)(vlSelfRef.nicore__DOT__dcache__DOT__cache_state)) 
                                        & ((0x0fU != (IData)(vlSelfRef.nicore__DOT__dcache__DOT__cache_state)) 
                                           & ((0x10U 
                                               != (IData)(vlSelfRef.nicore__DOT__dcache__DOT__cache_state)) 
                                              & ((0x11U 
                                                  != (IData)(vlSelfRef.nicore__DOT__dcache__DOT__cache_state)) 
                                                 & ((0x13U 
                                                     != (IData)(vlSelfRef.nicore__DOT__dcache__DOT__cache_state)) 
                                                    & ((1U 
                                                        != (IData)(vlSelfRef.nicore__DOT__dcache__DOT__cache_state)) 
                                                       & ((3U 
                                                           == (IData)(vlSelfRef.nicore__DOT__dcache__DOT__cache_state)) 
                                                          | ((4U 
                                                              != (IData)(vlSelfRef.nicore__DOT__dcache__DOT__cache_state)) 
                                                             & ((5U 
                                                                 != (IData)(vlSelfRef.nicore__DOT__dcache__DOT__cache_state)) 
                                                                & ((6U 
                                                                    != (IData)(vlSelfRef.nicore__DOT__dcache__DOT__cache_state)) 
                                                                   & (IData)(vlSelfRef.__VdfgRegularize_hebeb780c_0_30)))))))))))));
    vlSelfRef.nicore__DOT__dcache__DOT___GEN_177 = 
        ((~ (IData)(vlSelfRef.nicore__DOT__dcache__DOT___T_58)) 
         & ((IData)(vlSelfRef.nicore__DOT__dcache__DOT__write_addr_reg) 
            | (IData)(vlSelfRef.nicore__DOT__dcache_io_mem_io_aw_ready)));
    if ((0U == (IData)(vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__divider__DOT__div_state))) {
        vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__divider__DOT__mid128_result[0U] = 0U;
        vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__divider__DOT__mid128_result[1U] = 0U;
        vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__divider__DOT__mid128_result[2U] = 0U;
        vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__divider__DOT__mid128_result[3U] = 0U;
    } else if ((1U == (IData)(vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__divider__DOT__div_state))) {
        if (vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__divider__DOT__is_w) {
            vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__divider__DOT__mid128_result[0U] = 0U;
            vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__divider__DOT__mid128_result[1U] = 0U;
            vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__divider__DOT__mid128_result[2U] = 0U;
            vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__divider__DOT__mid128_result[3U] = 0U;
        } else {
            vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__divider__DOT__mid128_result[0U] 
                = vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__divider__DOT___mid64_result_T_1[0U];
            vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__divider__DOT__mid128_result[1U] 
                = vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__divider__DOT___mid64_result_T_1[1U];
            vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__divider__DOT__mid128_result[2U] 
                = vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__divider__DOT___mid64_result_T_1[2U];
            vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__divider__DOT__mid128_result[3U] 
                = vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__divider__DOT___mid64_result_T_1[3U];
        }
    } else {
        vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__divider__DOT__mid128_result[0U] = 0U;
        vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__divider__DOT__mid128_result[1U] = 0U;
        vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__divider__DOT__mid128_result[2U] = 0U;
        vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__divider__DOT__mid128_result[3U] = 0U;
    }
    vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__divider__DOT__mid64_result 
        = ((- (QData)((IData)((0U != (IData)(vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__divider__DOT__div_state))))) 
           & ((- (QData)((IData)((1U == (IData)(vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__divider__DOT__div_state))))) 
              & ((((QData)((IData)(vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__divider__DOT___mid64_result_T_1[1U])) 
                   << 0x00000020U) | (QData)((IData)(vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__divider__DOT___mid64_result_T_1[0U]))) 
                 & (- (QData)((IData)(vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__divider__DOT__is_w))))));
    vlSelfRef.nicore__DOT__datapath__DOT__csr__DOT__readable 
        = ((0x0c00U == (vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst 
                        >> 0x00000014U)) | ((0x0c02U 
                                             == (vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst 
                                                 >> 0x00000014U)) 
                                            | ((0x0100U 
                                                == 
                                                (vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst 
                                                 >> 0x00000014U)) 
                                               | ((0x0104U 
                                                   == 
                                                   (vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst 
                                                    >> 0x00000014U)) 
                                                  | ((0x0105U 
                                                      == 
                                                      (vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst 
                                                       >> 0x00000014U)) 
                                                     | ((0x0106U 
                                                         == 
                                                         (vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst 
                                                          >> 0x00000014U)) 
                                                        | ((0x0140U 
                                                            == 
                                                            (vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst 
                                                             >> 0x00000014U)) 
                                                           | ((0x0141U 
                                                               == 
                                                               (vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst 
                                                                >> 0x00000014U)) 
                                                              | ((0x0142U 
                                                                  == 
                                                                  (vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst 
                                                                   >> 0x00000014U)) 
                                                                 | ((0x0143U 
                                                                     == 
                                                                     (vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst 
                                                                      >> 0x00000014U)) 
                                                                    | ((0x0144U 
                                                                        == 
                                                                        (vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst 
                                                                         >> 0x00000014U)) 
                                                                       | ((0x0180U 
                                                                           == 
                                                                           (vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst 
                                                                            >> 0x00000014U)) 
                                                                          | ((0x0f11U 
                                                                              == 
                                                                              (vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst 
                                                                               >> 0x00000014U)) 
                                                                             | ((0x0f12U 
                                                                                == 
                                                                                (vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst 
                                                                                >> 0x00000014U)) 
                                                                                | ((0x0f13U 
                                                                                == 
                                                                                (vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst 
                                                                                >> 0x00000014U)) 
                                                                                | ((0x0f14U 
                                                                                == 
                                                                                (vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst 
                                                                                >> 0x00000014U)) 
                                                                                | ((0x0300U 
                                                                                == 
                                                                                (vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst 
                                                                                >> 0x00000014U)) 
                                                                                | ((0x0301U 
                                                                                == 
                                                                                (vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst 
                                                                                >> 0x00000014U)) 
                                                                                | ((0x0302U 
                                                                                == 
                                                                                (vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst 
                                                                                >> 0x00000014U)) 
                                                                                | ((0x0303U 
                                                                                == 
                                                                                (vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst 
                                                                                >> 0x00000014U)) 
                                                                                | ((0x0304U 
                                                                                == 
                                                                                (vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst 
                                                                                >> 0x00000014U)) 
                                                                                | ((0x0305U 
                                                                                == 
                                                                                (vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst 
                                                                                >> 0x00000014U)) 
                                                                                | ((0x0306U 
                                                                                == 
                                                                                (vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst 
                                                                                >> 0x00000014U)) 
                                                                                | ((0x0340U 
                                                                                == 
                                                                                (vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst 
                                                                                >> 0x00000014U)) 
                                                                                | ((0x0341U 
                                                                                == 
                                                                                (vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst 
                                                                                >> 0x00000014U)) 
                                                                                | ((0x0342U 
                                                                                == 
                                                                                (vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst 
                                                                                >> 0x00000014U)) 
                                                                                | ((0x0343U 
                                                                                == 
                                                                                (vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst 
                                                                                >> 0x00000014U)) 
                                                                                | ((0x0344U 
                                                                                == 
                                                                                (vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst 
                                                                                >> 0x00000014U)) 
                                                                                | ((0x0b00U 
                                                                                == 
                                                                                (vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst 
                                                                                >> 0x00000014U)) 
                                                                                | ((0x0b02U 
                                                                                == 
                                                                                (vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst 
                                                                                >> 0x00000014U)) 
                                                                                | ((0x03a0U 
                                                                                == 
                                                                                (vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst 
                                                                                >> 0x00000014U)) 
                                                                                | ((0x03a1U 
                                                                                == 
                                                                                (vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst 
                                                                                >> 0x00000014U)) 
                                                                                | ((0x03a2U 
                                                                                == 
                                                                                (vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst 
                                                                                >> 0x00000014U)) 
                                                                                | ((0x03a3U 
                                                                                == 
                                                                                (vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst 
                                                                                >> 0x00000014U)) 
                                                                                | ((0x030aU 
                                                                                == 
                                                                                (vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst 
                                                                                >> 0x00000014U)) 
                                                                                | ((0x010aU 
                                                                                == 
                                                                                (vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst 
                                                                                >> 0x00000014U)) 
                                                                                | ((0x0747U 
                                                                                == 
                                                                                (vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst 
                                                                                >> 0x00000014U)) 
                                                                                | ((0x0f15U 
                                                                                == 
                                                                                (vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst 
                                                                                >> 0x00000014U)) 
                                                                                | ((0x0320U 
                                                                                == 
                                                                                (vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst 
                                                                                >> 0x00000014U)) 
                                                                                | ((0x07a0U 
                                                                                == 
                                                                                (vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst 
                                                                                >> 0x00000014U)) 
                                                                                | ((0x07a1U 
                                                                                == 
                                                                                (vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst 
                                                                                >> 0x00000014U)) 
                                                                                | ((0x07a2U 
                                                                                == 
                                                                                (vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst 
                                                                                >> 0x00000014U)) 
                                                                                | ((0x07a3U 
                                                                                == 
                                                                                (vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst 
                                                                                >> 0x00000014U)) 
                                                                                | ((0x07a8U 
                                                                                == 
                                                                                (vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst 
                                                                                >> 0x00000014U)) 
                                                                                | (IData)(__VdfgRegularize_hebeb780c_0_315)))))))))))))))))))))))))))))))))))))))))))));
    vlSelfRef.nicore__DOT__datapath__DOT__csr__DOT__writable 
        = ((0x0c00U != (vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst 
                        >> 0x00000014U)) & ((0x0c02U 
                                             != (vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst 
                                                 >> 0x00000014U)) 
                                            & ((0x0100U 
                                                == 
                                                (vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst 
                                                 >> 0x00000014U)) 
                                               | ((0x0104U 
                                                   == 
                                                   (vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst 
                                                    >> 0x00000014U)) 
                                                  | ((0x0105U 
                                                      == 
                                                      (vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst 
                                                       >> 0x00000014U)) 
                                                     | ((0x0106U 
                                                         == 
                                                         (vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst 
                                                          >> 0x00000014U)) 
                                                        | ((0x0140U 
                                                            == 
                                                            (vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst 
                                                             >> 0x00000014U)) 
                                                           | ((0x0141U 
                                                               == 
                                                               (vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst 
                                                                >> 0x00000014U)) 
                                                              | ((0x0142U 
                                                                  == 
                                                                  (vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst 
                                                                   >> 0x00000014U)) 
                                                                 | ((0x0143U 
                                                                     == 
                                                                     (vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst 
                                                                      >> 0x00000014U)) 
                                                                    | ((0x0144U 
                                                                        == 
                                                                        (vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst 
                                                                         >> 0x00000014U)) 
                                                                       | ((0x0180U 
                                                                           == 
                                                                           (vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst 
                                                                            >> 0x00000014U)) 
                                                                          | ((0x0f11U 
                                                                              != 
                                                                              (vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst 
                                                                               >> 0x00000014U)) 
                                                                             & ((0x0f12U 
                                                                                != 
                                                                                (vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst 
                                                                                >> 0x00000014U)) 
                                                                                & ((0x0f13U 
                                                                                != 
                                                                                (vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst 
                                                                                >> 0x00000014U)) 
                                                                                & ((0x0f14U 
                                                                                != 
                                                                                (vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst 
                                                                                >> 0x00000014U)) 
                                                                                & ((0x0300U 
                                                                                == 
                                                                                (vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst 
                                                                                >> 0x00000014U)) 
                                                                                | ((0x0301U 
                                                                                != 
                                                                                (vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst 
                                                                                >> 0x00000014U)) 
                                                                                & ((0x0302U 
                                                                                == 
                                                                                (vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst 
                                                                                >> 0x00000014U)) 
                                                                                | ((0x0303U 
                                                                                == 
                                                                                (vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst 
                                                                                >> 0x00000014U)) 
                                                                                | ((0x0304U 
                                                                                == 
                                                                                (vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst 
                                                                                >> 0x00000014U)) 
                                                                                | ((0x0305U 
                                                                                == 
                                                                                (vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst 
                                                                                >> 0x00000014U)) 
                                                                                | ((0x0306U 
                                                                                == 
                                                                                (vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst 
                                                                                >> 0x00000014U)) 
                                                                                | ((0x0340U 
                                                                                == 
                                                                                (vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst 
                                                                                >> 0x00000014U)) 
                                                                                | ((0x0341U 
                                                                                == 
                                                                                (vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst 
                                                                                >> 0x00000014U)) 
                                                                                | ((0x0342U 
                                                                                == 
                                                                                (vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst 
                                                                                >> 0x00000014U)) 
                                                                                | ((0x0343U 
                                                                                == 
                                                                                (vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst 
                                                                                >> 0x00000014U)) 
                                                                                | ((0x0344U 
                                                                                == 
                                                                                (vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst 
                                                                                >> 0x00000014U)) 
                                                                                | ((0x0b00U 
                                                                                == 
                                                                                (vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst 
                                                                                >> 0x00000014U)) 
                                                                                | ((0x0b02U 
                                                                                == 
                                                                                (vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst 
                                                                                >> 0x00000014U)) 
                                                                                | ((0x03a0U 
                                                                                == 
                                                                                (vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst 
                                                                                >> 0x00000014U)) 
                                                                                | ((0x03a1U 
                                                                                == 
                                                                                (vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst 
                                                                                >> 0x00000014U)) 
                                                                                | ((0x03a2U 
                                                                                == 
                                                                                (vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst 
                                                                                >> 0x00000014U)) 
                                                                                | ((0x03a3U 
                                                                                == 
                                                                                (vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst 
                                                                                >> 0x00000014U)) 
                                                                                | ((0x030aU 
                                                                                == 
                                                                                (vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst 
                                                                                >> 0x00000014U)) 
                                                                                | ((0x010aU 
                                                                                == 
                                                                                (vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst 
                                                                                >> 0x00000014U)) 
                                                                                | ((0x0747U 
                                                                                == 
                                                                                (vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst 
                                                                                >> 0x00000014U)) 
                                                                                | ((0x0f15U 
                                                                                != 
                                                                                (vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst 
                                                                                >> 0x00000014U)) 
                                                                                & ((0x0320U 
                                                                                == 
                                                                                (vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst 
                                                                                >> 0x00000014U)) 
                                                                                | ((0x07a0U 
                                                                                != 
                                                                                (vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst 
                                                                                >> 0x00000014U)) 
                                                                                & ((0x07a1U 
                                                                                != 
                                                                                (vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst 
                                                                                >> 0x00000014U)) 
                                                                                & ((0x07a2U 
                                                                                != 
                                                                                (vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst 
                                                                                >> 0x00000014U)) 
                                                                                & ((0x07a3U 
                                                                                != 
                                                                                (vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst 
                                                                                >> 0x00000014U)) 
                                                                                & ((0x07a8U 
                                                                                != 
                                                                                (vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst 
                                                                                >> 0x00000014U)) 
                                                                                & (IData)(__VdfgRegularize_hebeb780c_0_315)))))))))))))))))))))))))))))))))))))))))))));
    vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__immGen__DOT__Iimm 
        = (((QData)((IData)(vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__immGen__DOT___Iimm_T_1)) 
            << 0x0000000cU) | (QData)((IData)((vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst 
                                               >> 0x00000014U))));
    vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT___ok_T_5 
        = ((IData)(vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT__tlbe_0_G) 
           | ((IData)(vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT__tlbe_0_asid) 
              == (0x0001ffffU & (IData)((vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__iTLB_io_satp 
                                         >> 0x0000002cU)))));
    vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__iTLB__DOT___ok_T_5 
        = ((IData)(vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__iTLB__DOT__tlbe_0_G) 
           | ((IData)(vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__iTLB__DOT__tlbe_0_asid) 
              == (0x0001ffffU & (IData)((vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__iTLB_io_satp 
                                         >> 0x0000002cU)))));
    vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_1173 
        = (1U & (~ ((0x30200073U == vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst) 
                    | ((0x10200073U == vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst) 
                       | ((0x00000073U == vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst) 
                          | ((0x00100073U == vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst) 
                             | ((0x0000100fU == vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst) 
                                | ((IData)(vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_191) 
                                   | (0x10500073U == vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst)))))))));
    vlSelfRef.nicore__DOT__icache__DOT___GEN_461 = 
        (vlSelfRef.io_master_rdata & vlSelfRef.nicore__DOT__icache__DOT___GEN_463);
    vlSelfRef.nicore__DOT__icache__DOT___GEN_460 = 
        (vlSelfRef.io_master_rdata & vlSelfRef.nicore__DOT__icache__DOT___GEN_462);
    vlSelfRef.nicore__DOT__dcache__DOT___GEN_20 = ((IData)(vlSelfRef.nicore__DOT__dcache__DOT___GEN_15) 
                                                   & (3U 
                                                      == (IData)(vlSelfRef.nicore__DOT__dcache__DOT__index_in_line)));
    vlSelfRef.nicore__DOT__dcache__DOT___GEN_461 = 
        (vlSelfRef.io_master_rdata & vlSelfRef.nicore__DOT__dcache__DOT___GEN_463);
    vlSelfRef.nicore__DOT__dcache__DOT___GEN_460 = 
        (vlSelfRef.io_master_rdata & vlSelfRef.nicore__DOT__dcache__DOT___GEN_462);
    vlSelfRef.nicore__DOT__dcache__DOT___GEN_253 = 
        (vlSelfRef.nicore__DOT__dcache__DOT___wmask_T_24 
         & (- (QData)((IData)((1U & (~ (vlSelfRef.nicore__DOT__dcache__DOT__cpu_request_addr_reg 
                                        >> 3U)))))));
    vlSelfRef.nicore__DOT__dcache__DOT___GEN_254 = 
        (vlSelfRef.nicore__DOT__dcache__DOT___wmask_T_24 
         & (- (QData)((IData)((1U & (vlSelfRef.nicore__DOT__dcache__DOT__cpu_request_addr_reg 
                                     >> 3U))))));
    vlSelfRef.nicore__DOT__dcache_io_mem_io_w_valid 
        = ((0U != (IData)(vlSelfRef.nicore__DOT__dcache__DOT__cache_state)) 
           & ((0x0fU != (IData)(vlSelfRef.nicore__DOT__dcache__DOT__cache_state)) 
              & ((0x10U != (IData)(vlSelfRef.nicore__DOT__dcache__DOT__cache_state)) 
                 & ((0x11U == (IData)(vlSelfRef.nicore__DOT__dcache__DOT__cache_state))
                     ? (IData)(vlSelfRef.nicore__DOT__dcache__DOT___T_40)
                     : ((0x13U != (IData)(vlSelfRef.nicore__DOT__dcache__DOT__cache_state)) 
                        & ((1U != (IData)(vlSelfRef.nicore__DOT__dcache__DOT__cache_state)) 
                           & ((3U != (IData)(vlSelfRef.nicore__DOT__dcache__DOT__cache_state)) 
                              & ((4U == (IData)(vlSelfRef.nicore__DOT__dcache__DOT__cache_state))
                                  ? (IData)(vlSelfRef.nicore__DOT__dcache__DOT___T_40)
                                  : ((5U != (IData)(vlSelfRef.nicore__DOT__dcache__DOT__cache_state)) 
                                     & ((6U != (IData)(vlSelfRef.nicore__DOT__dcache__DOT__cache_state)) 
                                        & ((0x0cU != (IData)(vlSelfRef.nicore__DOT__dcache__DOT__cache_state)) 
                                           & ((0x0dU 
                                               != (IData)(vlSelfRef.nicore__DOT__dcache__DOT__cache_state)) 
                                              & ((9U 
                                                  != (IData)(vlSelfRef.nicore__DOT__dcache__DOT__cache_state)) 
                                                 & ((8U 
                                                     != (IData)(vlSelfRef.nicore__DOT__dcache__DOT__cache_state)) 
                                                    & ((0x0eU 
                                                        != (IData)(vlSelfRef.nicore__DOT__dcache__DOT__cache_state)) 
                                                       & ((IData)(vlSelfRef.nicore__DOT__dcache__DOT___T_40) 
                                                          & (7U 
                                                             == (IData)(vlSelfRef.nicore__DOT__dcache__DOT__cache_state))))))))))))))))));
    vlSelfRef.nicore__DOT__dcache__DOT___GEN_168 = 
        ((IData)(vlSelfRef.nicore__DOT__dcache__DOT___T_40) 
         & (IData)(vlSelfRef.nicore__DOT__dcache_io_mem_io_w_ready));
    vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT___T_195 
        = (1U & ((~ (IData)(vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT___T_197)) 
                 | (IData)((4ULL == (6ULL & vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT___T_197)))));
    vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT___T_196 
        = (IData)((0ULL != (0x000000000000000aULL & vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT___T_197)));
    vlSelfRef.__VdfgRegularize_hebeb780c_0_429 = ((IData)(vlSelfRef.io_master_rlast) 
                                                  & (IData)(vlSelfRef.nicore__DOT__dcache_io_mem_io_r_valid));
    vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__dTLB_io_cache_response_ready 
        = ((0U != (IData)(vlSelfRef.nicore__DOT__dcache__DOT__cache_state)) 
           & ((0x0fU == (IData)(vlSelfRef.nicore__DOT__dcache__DOT__cache_state))
               ? (IData)(vlSelfRef.nicore__DOT__dcache__DOT__flush_over)
               : ((0x10U != (IData)(vlSelfRef.nicore__DOT__dcache__DOT__cache_state)) 
                  & ((0x11U != (IData)(vlSelfRef.nicore__DOT__dcache__DOT__cache_state)) 
                     & ((0x13U != (IData)(vlSelfRef.nicore__DOT__dcache__DOT__cache_state)) 
                        & ((1U != (IData)(vlSelfRef.nicore__DOT__dcache__DOT__cache_state)) 
                           & ((3U == (IData)(vlSelfRef.nicore__DOT__dcache__DOT__cache_state))
                               ? (IData)(vlSelfRef.nicore__DOT__dcache_io_mem_io_r_valid)
                               : ((4U != (IData)(vlSelfRef.nicore__DOT__dcache__DOT__cache_state)) 
                                  & ((5U == (IData)(vlSelfRef.nicore__DOT__dcache__DOT__cache_state))
                                      ? (IData)(vlSelfRef.nicore__DOT__dcache_io_mem_io_b_valid)
                                      : ((6U != (IData)(vlSelfRef.nicore__DOT__dcache__DOT__cache_state)) 
                                         & ((0x0dU 
                                             == (IData)(vlSelfRef.nicore__DOT__dcache__DOT__cache_state)) 
                                            | (0x0cU 
                                               == (IData)(vlSelfRef.nicore__DOT__dcache__DOT__cache_state)))))))))))));
    vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_1035 
        = (7U & (- (IData)((IData)(vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_69))));
    vlSelfRef.__VdfgRegularize_hebeb780c_0_307 = ((0x00000033U 
                                                   == vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_102) 
                                                  | ((0x0000003bU 
                                                      == vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_102) 
                                                     | ((0x40000033U 
                                                         == vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_102) 
                                                        | ((0x4000003bU 
                                                            == vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_102) 
                                                           | ((0x00001033U 
                                                               == vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_102) 
                                                              | ((0x0000103bU 
                                                                  == vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_102) 
                                                                 | ((0x00002033U 
                                                                     == vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_102) 
                                                                    | ((0x00003033U 
                                                                        == vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_102) 
                                                                       | ((0x00004033U 
                                                                           == vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_102) 
                                                                          | ((0x00005033U 
                                                                              == vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_102) 
                                                                             | ((0x0000503bU 
                                                                                == vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_102) 
                                                                                | ((0x40005033U 
                                                                                == vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_102) 
                                                                                | ((0x4000503bU 
                                                                                == vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_102) 
                                                                                | ((0x00006033U 
                                                                                == vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_102) 
                                                                                | ((0x00007033U 
                                                                                == vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_102) 
                                                                                | ((0x02000033U 
                                                                                == vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_102) 
                                                                                | ((0x0200003bU 
                                                                                == vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_102) 
                                                                                | ((0x02001033U 
                                                                                == vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_102) 
                                                                                | ((0x02003033U 
                                                                                == vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_102) 
                                                                                | ((0x02002033U 
                                                                                == vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_102) 
                                                                                | ((0x02004033U 
                                                                                == vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_102) 
                                                                                | ((0x02005033U 
                                                                                == vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_102) 
                                                                                | ((0x0200403bU 
                                                                                == vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_102) 
                                                                                | ((0x0200503bU 
                                                                                == vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_102) 
                                                                                | ((0x02006033U 
                                                                                == vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_102) 
                                                                                | ((0x02007033U 
                                                                                == vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_102) 
                                                                                | ((0x0200603bU 
                                                                                == vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_102) 
                                                                                | (0x0200703bU 
                                                                                == vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_102))))))))))))))))))))))))))));
    vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__immGen_io_sel 
        = ((0x00000037U == vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T)
            ? 3U : ((0x00000017U == vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T)
                     ? 3U : ((0x0000006fU == vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T)
                              ? 4U : ((0x00000067U 
                                       == vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_6)
                                       ? 1U : ((0x00000063U 
                                                == vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_6)
                                                ? 5U
                                                : (
                                                   (0x00001063U 
                                                    == vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_6)
                                                    ? 5U
                                                    : 
                                                   ((0x00004063U 
                                                     == vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_6)
                                                     ? 5U
                                                     : 
                                                    ((0x00005063U 
                                                      == vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_6)
                                                      ? 5U
                                                      : 
                                                     ((0x00006063U 
                                                       == vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_6)
                                                       ? 5U
                                                       : 
                                                      ((0x00007063U 
                                                        == vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_6)
                                                        ? 5U
                                                        : 
                                                       ((3U 
                                                         == vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_6)
                                                         ? 1U
                                                         : 
                                                        ((0x00001003U 
                                                          == vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_6)
                                                          ? 1U
                                                          : 
                                                         ((0x00002003U 
                                                           == vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_6)
                                                           ? 1U
                                                           : 
                                                          ((0x00004003U 
                                                            == vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_6)
                                                            ? 1U
                                                            : 
                                                           ((0x00005003U 
                                                             == vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_6)
                                                             ? 1U
                                                             : 
                                                            ((0x00006003U 
                                                              == vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_6)
                                                              ? 1U
                                                              : 
                                                             ((0x00003003U 
                                                               == vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_6)
                                                               ? 1U
                                                               : 
                                                              ((0x00000023U 
                                                                == vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_6)
                                                                ? 2U
                                                                : 
                                                               ((0x00001023U 
                                                                 == vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_6)
                                                                 ? 2U
                                                                 : 
                                                                ((0x00002023U 
                                                                  == vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_6)
                                                                  ? 2U
                                                                  : 
                                                                 ((0x00003023U 
                                                                   == vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_6)
                                                                   ? 2U
                                                                   : 
                                                                  ((- (IData)(
                                                                              (0x1000202fU 
                                                                               != vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_42))) 
                                                                   & ((- (IData)(
                                                                                (0x1000302fU 
                                                                                != vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_42))) 
                                                                      & ((- (IData)(
                                                                                (1U 
                                                                                & (~ (IData)(vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_47))))) 
                                                                         & ((- (IData)(
                                                                                (1U 
                                                                                & (~ (IData)(vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_49))))) 
                                                                            & ((- (IData)(
                                                                                (1U 
                                                                                & (~ (IData)(vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_51))))) 
                                                                               & ((- (IData)(
                                                                                (1U 
                                                                                & (~ (IData)(vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_53))))) 
                                                                                & ((- (IData)(
                                                                                (1U 
                                                                                & (~ (IData)(vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_55))))) 
                                                                                & ((- (IData)(
                                                                                (1U 
                                                                                & (~ (IData)(vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_57))))) 
                                                                                & ((- (IData)(
                                                                                (1U 
                                                                                & (~ (IData)(vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_59))))) 
                                                                                & ((- (IData)(
                                                                                (1U 
                                                                                & (~ (IData)(vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_61))))) 
                                                                                & ((- (IData)(
                                                                                (1U 
                                                                                & (~ (IData)(vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_63))))) 
                                                                                & ((- (IData)(
                                                                                (1U 
                                                                                & (~ (IData)(vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_65))))) 
                                                                                & ((- (IData)(
                                                                                (1U 
                                                                                & (~ (IData)(vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_67))))) 
                                                                                & (((0x00000013U 
                                                                                == vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_6)
                                                                                 ? 1U
                                                                                 : 
                                                                                ((0x0000001bU 
                                                                                == vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_6)
                                                                                 ? 1U
                                                                                 : 
                                                                                ((0x00002013U 
                                                                                == vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_6)
                                                                                 ? 1U
                                                                                 : 
                                                                                ((0x00003013U 
                                                                                == vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_6)
                                                                                 ? 1U
                                                                                 : 
                                                                                ((0x00004013U 
                                                                                == vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_6)
                                                                                 ? 1U
                                                                                 : 
                                                                                ((0x00006013U 
                                                                                == vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_6)
                                                                                 ? 1U
                                                                                 : 
                                                                                ((0x00007013U 
                                                                                == vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_6)
                                                                                 ? 1U
                                                                                 : 
                                                                                ((0x00001013U 
                                                                                == vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_100)
                                                                                 ? 1U
                                                                                 : 
                                                                                ((0x0000101bU 
                                                                                == vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_102)
                                                                                 ? 1U
                                                                                 : 
                                                                                ((0x00005013U 
                                                                                == vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_100)
                                                                                 ? 1U
                                                                                 : 
                                                                                ((0x0000501bU 
                                                                                == vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_102)
                                                                                 ? 1U
                                                                                 : 
                                                                                ((0x40005013U 
                                                                                == vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_100)
                                                                                 ? 1U
                                                                                 : 
                                                                                ((0x4000501bU 
                                                                                == vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_102)
                                                                                 ? 1U
                                                                                 : 
                                                                                ((- (IData)(
                                                                                (0x00000033U 
                                                                                != vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_102))) 
                                                                                & ((- (IData)(
                                                                                (0x0000003bU 
                                                                                != vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_102))) 
                                                                                & ((- (IData)(
                                                                                (0x40000033U 
                                                                                != vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_102))) 
                                                                                & ((- (IData)(
                                                                                (0x4000003bU 
                                                                                != vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_102))) 
                                                                                & ((- (IData)(
                                                                                (0x00001033U 
                                                                                != vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_102))) 
                                                                                & ((- (IData)(
                                                                                (0x0000103bU 
                                                                                != vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_102))) 
                                                                                & ((- (IData)(
                                                                                (0x00002033U 
                                                                                != vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_102))) 
                                                                                & ((- (IData)(
                                                                                (0x00003033U 
                                                                                != vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_102))) 
                                                                                & ((- (IData)(
                                                                                (0x00004033U 
                                                                                != vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_102))) 
                                                                                & ((- (IData)(
                                                                                (0x00005033U 
                                                                                != vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_102))) 
                                                                                & ((- (IData)(
                                                                                (0x0000503bU 
                                                                                != vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_102))) 
                                                                                & ((- (IData)(
                                                                                (0x40005033U 
                                                                                != vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_102))) 
                                                                                & ((- (IData)(
                                                                                (0x4000503bU 
                                                                                != vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_102))) 
                                                                                & ((- (IData)(
                                                                                (0x00006033U 
                                                                                != vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_102))) 
                                                                                & ((- (IData)(
                                                                                (0x00007033U 
                                                                                != vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_102))) 
                                                                                & ((- (IData)(
                                                                                (0x02000033U 
                                                                                != vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_102))) 
                                                                                & ((- (IData)(
                                                                                (0x0200003bU 
                                                                                != vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_102))) 
                                                                                & ((- (IData)(
                                                                                (0x02001033U 
                                                                                != vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_102))) 
                                                                                & ((- (IData)(
                                                                                (0x02003033U 
                                                                                != vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_102))) 
                                                                                & ((- (IData)(
                                                                                (0x02002033U 
                                                                                != vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_102))) 
                                                                                & ((- (IData)(
                                                                                (0x02004033U 
                                                                                != vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_102))) 
                                                                                & ((- (IData)(
                                                                                (0x02005033U 
                                                                                != vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_102))) 
                                                                                & ((- (IData)(
                                                                                (0x0200403bU 
                                                                                != vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_102))) 
                                                                                & ((- (IData)(
                                                                                (0x0200503bU 
                                                                                != vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_102))) 
                                                                                & ((- (IData)(
                                                                                (0x02006033U 
                                                                                != vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_102))) 
                                                                                & ((- (IData)(
                                                                                (0x02007033U 
                                                                                != vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_102))) 
                                                                                & ((- (IData)(
                                                                                (0x0200603bU 
                                                                                != vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_102))) 
                                                                                & ((- (IData)(
                                                                                (0x0200703bU 
                                                                                != vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_102))) 
                                                                                & ((- (IData)(
                                                                                (0x00001073U 
                                                                                != vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_6))) 
                                                                                & ((- (IData)(
                                                                                (0x00002073U 
                                                                                != vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_6))) 
                                                                                & (((0x00005073U 
                                                                                == vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_6)
                                                                                 ? 6U
                                                                                 : 
                                                                                ((0x00006073U 
                                                                                == vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_6)
                                                                                 ? 6U
                                                                                 : 
                                                                                ((0x00007073U 
                                                                                == vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_6)
                                                                                 ? 6U
                                                                                 : 
                                                                                (3U 
                                                                                & ((- (IData)(
                                                                                (0x30200073U 
                                                                                != vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst))) 
                                                                                & ((- (IData)(
                                                                                (0x10200073U 
                                                                                != vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst))) 
                                                                                & ((- (IData)(
                                                                                (0x00000073U 
                                                                                != vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst))) 
                                                                                & ((- (IData)(
                                                                                (0x00100073U 
                                                                                != vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst))) 
                                                                                & ((- (IData)(
                                                                                (0x0000100fU 
                                                                                != vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst))) 
                                                                                & ((- (IData)(
                                                                                (1U 
                                                                                & (~ (IData)(vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_191))))) 
                                                                                & (- (IData)(
                                                                                (0x10500073U 
                                                                                != vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst))))))))))))) 
                                                                                & (- (IData)(
                                                                                (0x00003073U 
                                                                                != vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_6))))))))))))))))))))))))))))))))))))))))))))))) 
                                                                                & (- (IData)(
                                                                                (1U 
                                                                                & (~ (IData)(vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_69))))))))))))))))))))))))))))))))))))))));
    vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__control_io_csr_cmd 
        = ((- (IData)((0x00000037U != vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T))) 
           & ((- (IData)((0x00000017U != vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T))) 
              & ((- (IData)((0x0000006fU != vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T))) 
                 & ((- (IData)((0x00000067U != vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_6))) 
                    & ((- (IData)((0x00000063U != vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_6))) 
                       & ((- (IData)((0x00001063U != vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_6))) 
                          & ((- (IData)((0x00004063U 
                                         != vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_6))) 
                             & ((- (IData)((0x00005063U 
                                            != vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_6))) 
                                & ((- (IData)((0x00006063U 
                                               != vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_6))) 
                                   & ((- (IData)((0x00007063U 
                                                  != vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_6))) 
                                      & ((- (IData)(
                                                    (3U 
                                                     != vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_6))) 
                                         & ((- (IData)(
                                                       (0x00001003U 
                                                        != vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_6))) 
                                            & ((- (IData)(
                                                          (0x00002003U 
                                                           != vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_6))) 
                                               & ((- (IData)(
                                                             (0x00004003U 
                                                              != vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_6))) 
                                                  & ((- (IData)(
                                                                (0x00005003U 
                                                                 != vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_6))) 
                                                     & ((- (IData)(
                                                                   (0x00006003U 
                                                                    != vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_6))) 
                                                        & ((- (IData)(
                                                                      (0x00003003U 
                                                                       != vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_6))) 
                                                           & ((- (IData)(
                                                                         (0x00000023U 
                                                                          != vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_6))) 
                                                              & ((- (IData)(
                                                                            (0x00001023U 
                                                                             != vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_6))) 
                                                                 & ((- (IData)(
                                                                               (0x00002023U 
                                                                                != vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_6))) 
                                                                    & ((- (IData)(
                                                                                (0x00003023U 
                                                                                != vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_6))) 
                                                                       & ((- (IData)(
                                                                                (0x1000202fU 
                                                                                != vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_42))) 
                                                                          & ((- (IData)(
                                                                                (0x1000302fU 
                                                                                != vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_42))) 
                                                                             & ((- (IData)(
                                                                                (1U 
                                                                                & (~ (IData)(vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_47))))) 
                                                                                & ((- (IData)(
                                                                                (1U 
                                                                                & (~ (IData)(vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_49))))) 
                                                                                & ((- (IData)(
                                                                                (1U 
                                                                                & (~ (IData)(vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_51))))) 
                                                                                & ((- (IData)(
                                                                                (1U 
                                                                                & (~ (IData)(vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_53))))) 
                                                                                & ((- (IData)(
                                                                                (1U 
                                                                                & (~ (IData)(vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_55))))) 
                                                                                & ((- (IData)(
                                                                                (1U 
                                                                                & (~ (IData)(vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_57))))) 
                                                                                & ((- (IData)(
                                                                                (1U 
                                                                                & (~ (IData)(vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_59))))) 
                                                                                & ((- (IData)(
                                                                                (1U 
                                                                                & (~ (IData)(vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_61))))) 
                                                                                & ((- (IData)(
                                                                                (1U 
                                                                                & (~ (IData)(vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_63))))) 
                                                                                & ((- (IData)(
                                                                                (1U 
                                                                                & (~ (IData)(vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_65))))) 
                                                                                & ((- (IData)(
                                                                                (1U 
                                                                                & (~ (IData)(vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_67))))) 
                                                                                & ((- (IData)(
                                                                                (1U 
                                                                                & (~ (IData)(vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_69))))) 
                                                                                & ((- (IData)(
                                                                                (0x00000033U 
                                                                                != vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_102))) 
                                                                                & ((- (IData)(
                                                                                (0x0000003bU 
                                                                                != vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_102))) 
                                                                                & ((- (IData)(
                                                                                (0x40000033U 
                                                                                != vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_102))) 
                                                                                & ((- (IData)(
                                                                                (0x4000003bU 
                                                                                != vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_102))) 
                                                                                & ((- (IData)(
                                                                                (0x00001033U 
                                                                                != vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_102))) 
                                                                                & ((- (IData)(
                                                                                (0x0000103bU 
                                                                                != vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_102))) 
                                                                                & ((- (IData)(
                                                                                (0x00002033U 
                                                                                != vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_102))) 
                                                                                & ((- (IData)(
                                                                                (0x00003033U 
                                                                                != vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_102))) 
                                                                                & ((- (IData)(
                                                                                (0x00004033U 
                                                                                != vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_102))) 
                                                                                & ((- (IData)(
                                                                                (0x00005033U 
                                                                                != vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_102))) 
                                                                                & ((- (IData)(
                                                                                (0x0000503bU 
                                                                                != vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_102))) 
                                                                                & ((- (IData)(
                                                                                (0x40005033U 
                                                                                != vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_102))) 
                                                                                & ((- (IData)(
                                                                                (0x4000503bU 
                                                                                != vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_102))) 
                                                                                & ((- (IData)(
                                                                                (0x00006033U 
                                                                                != vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_102))) 
                                                                                & ((- (IData)(
                                                                                (0x00007033U 
                                                                                != vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_102))) 
                                                                                & ((- (IData)(
                                                                                (0x02000033U 
                                                                                != vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_102))) 
                                                                                & ((- (IData)(
                                                                                (0x0200003bU 
                                                                                != vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_102))) 
                                                                                & ((- (IData)(
                                                                                (0x02001033U 
                                                                                != vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_102))) 
                                                                                & ((- (IData)(
                                                                                (0x02003033U 
                                                                                != vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_102))) 
                                                                                & ((- (IData)(
                                                                                (0x02002033U 
                                                                                != vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_102))) 
                                                                                & ((- (IData)(
                                                                                (0x02004033U 
                                                                                != vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_102))) 
                                                                                & ((- (IData)(
                                                                                (0x02005033U 
                                                                                != vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_102))) 
                                                                                & ((- (IData)(
                                                                                (0x0200403bU 
                                                                                != vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_102))) 
                                                                                & ((- (IData)(
                                                                                (0x0200503bU 
                                                                                != vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_102))) 
                                                                                & ((- (IData)(
                                                                                (0x02006033U 
                                                                                != vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_102))) 
                                                                                & ((- (IData)(
                                                                                (0x02007033U 
                                                                                != vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_102))) 
                                                                                & ((- (IData)(
                                                                                (0x0200603bU 
                                                                                != vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_102))) 
                                                                                & ((- (IData)(
                                                                                (0x00000013U 
                                                                                != vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_6))) 
                                                                                & ((- (IData)(
                                                                                (0x0000001bU 
                                                                                != vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_6))) 
                                                                                & ((- (IData)(
                                                                                (0x00002013U 
                                                                                != vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_6))) 
                                                                                & ((- (IData)(
                                                                                (0x00003013U 
                                                                                != vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_6))) 
                                                                                & ((- (IData)(
                                                                                (0x00004013U 
                                                                                != vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_6))) 
                                                                                & ((- (IData)(
                                                                                (0x00006013U 
                                                                                != vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_6))) 
                                                                                & ((- (IData)(
                                                                                (0x00007013U 
                                                                                != vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_6))) 
                                                                                & ((- (IData)(
                                                                                (0x00001013U 
                                                                                != vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_100))) 
                                                                                & ((- (IData)(
                                                                                (0x0000101bU 
                                                                                != vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_102))) 
                                                                                & ((- (IData)(
                                                                                (0x00005013U 
                                                                                != vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_100))) 
                                                                                & ((- (IData)(
                                                                                (0x0000501bU 
                                                                                != vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_102))) 
                                                                                & ((- (IData)(
                                                                                (0x40005013U 
                                                                                != vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_100))) 
                                                                                & ((- (IData)(
                                                                                (0x4000501bU 
                                                                                != vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_102))) 
                                                                                & (((0x00001073U 
                                                                                == vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_6)
                                                                                 ? 1U
                                                                                 : 
                                                                                ((0x00002073U 
                                                                                == vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_6)
                                                                                 ? 2U
                                                                                 : 
                                                                                ((0x00003073U 
                                                                                == vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_6)
                                                                                 ? 3U
                                                                                 : 
                                                                                ((0x00005073U 
                                                                                == vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_6)
                                                                                 ? 1U
                                                                                 : 
                                                                                ((0x00006073U 
                                                                                == vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_6)
                                                                                 ? 2U
                                                                                 : 
                                                                                (3U 
                                                                                & (- (IData)(
                                                                                (0x00007073U 
                                                                                == vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_6))))))))) 
                                                                                & (- (IData)(
                                                                                (0x0200703bU 
                                                                                != vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_102)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))));
    vlSelfRef.nicore__DOT__datapath__DOT__csr__DOT__flagIntS 
        = (vlSelfRef.nicore__DOT__datapath__DOT__csr__DOT___T_4 
           & vlSelfRef.nicore__DOT__datapath__DOT__csr__DOT___T_1);
    vlSelfRef.nicore__DOT__datapath__DOT__csr__DOT__csrData 
        = ((0x0c00U == (IData)(vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__mw_pipe_reg_csr_write_addr))
            ? vlSelfRef.nicore__DOT__datapath__DOT__csr__DOT__mcycle_data
            : ((0x0c02U == (IData)(vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__mw_pipe_reg_csr_write_addr))
                ? vlSelfRef.nicore__DOT__datapath__DOT__csr__DOT__minstret_data
                : ((0x0100U == (IData)(vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__mw_pipe_reg_csr_write_addr))
                    ? vlSelfRef.nicore__DOT__datapath__DOT__csr__DOT___T
                    : ((0x0104U == (IData)(vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__mw_pipe_reg_csr_write_addr))
                        ? vlSelfRef.nicore__DOT__datapath__DOT__csr__DOT___T_1
                        : ((0x0105U == (IData)(vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__mw_pipe_reg_csr_write_addr))
                            ? vlSelfRef.nicore__DOT__datapath__DOT__csr__DOT___T_2
                            : (((0x0140U == (IData)(vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__mw_pipe_reg_csr_write_addr))
                                 ? vlSelfRef.nicore__DOT__datapath__DOT__csr__DOT__sscratch_data
                                 : ((0x0141U == (IData)(vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__mw_pipe_reg_csr_write_addr))
                                     ? vlSelfRef.nicore__DOT__datapath__DOT__csr__DOT__sepc_data
                                     : ((0x0142U == (IData)(vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__mw_pipe_reg_csr_write_addr))
                                         ? vlSelfRef.nicore__DOT__datapath__DOT__csr__DOT___T_3
                                         : ((0x0143U 
                                             == (IData)(vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__mw_pipe_reg_csr_write_addr))
                                             ? vlSelfRef.nicore__DOT__datapath__DOT__csr__DOT__stval_data
                                             : ((0x0144U 
                                                 == (IData)(vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__mw_pipe_reg_csr_write_addr))
                                                 ? vlSelfRef.nicore__DOT__datapath__DOT__csr__DOT___T_4
                                                 : 
                                                ((0x0180U 
                                                  == (IData)(vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__mw_pipe_reg_csr_write_addr))
                                                  ? vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__iTLB_io_satp
                                                  : 
                                                 ((- (QData)((IData)(
                                                                     (0x0f11U 
                                                                      != (IData)(vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__mw_pipe_reg_csr_write_addr))))) 
                                                  & ((- (QData)((IData)(
                                                                        (0x0f12U 
                                                                         != (IData)(vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__mw_pipe_reg_csr_write_addr))))) 
                                                     & ((- (QData)((IData)(
                                                                           (0x0f13U 
                                                                            != (IData)(vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__mw_pipe_reg_csr_write_addr))))) 
                                                        & (((0x0300U 
                                                             == (IData)(vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__mw_pipe_reg_csr_write_addr))
                                                             ? vlSelfRef.nicore__DOT__datapath__DOT__csr__DOT___sstatus_T
                                                             : 
                                                            ((0x0301U 
                                                              == (IData)(vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__mw_pipe_reg_csr_write_addr))
                                                              ? 0x8000000000001100ULL
                                                              : 
                                                             ((0x0302U 
                                                               == (IData)(vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__mw_pipe_reg_csr_write_addr))
                                                               ? vlSelfRef.nicore__DOT__datapath__DOT__csr__DOT__medeleg_data
                                                               : 
                                                              ((0x0303U 
                                                                == (IData)(vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__mw_pipe_reg_csr_write_addr))
                                                                ? vlSelfRef.nicore__DOT__datapath__DOT__csr__DOT__mideleg_data
                                                                : 
                                                               ((0x0304U 
                                                                 == (IData)(vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__mw_pipe_reg_csr_write_addr))
                                                                 ? vlSelfRef.nicore__DOT__datapath__DOT__csr__DOT___sie_T
                                                                 : 
                                                                ((0x0305U 
                                                                  == (IData)(vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__mw_pipe_reg_csr_write_addr))
                                                                  ? vlSelfRef.nicore__DOT__datapath__DOT__csr__DOT___T_9
                                                                  : 
                                                                 (((0x0340U 
                                                                    == (IData)(vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__mw_pipe_reg_csr_write_addr))
                                                                    ? vlSelfRef.nicore__DOT__datapath__DOT__csr__DOT__mscratch_data
                                                                    : 
                                                                   ((0x0341U 
                                                                     == (IData)(vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__mw_pipe_reg_csr_write_addr))
                                                                     ? vlSelfRef.nicore__DOT__datapath__DOT__csr__DOT__mepc_data
                                                                     : 
                                                                    ((0x0342U 
                                                                      == (IData)(vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__mw_pipe_reg_csr_write_addr))
                                                                      ? vlSelfRef.nicore__DOT__datapath__DOT__csr__DOT___T_10
                                                                      : 
                                                                     ((0x0343U 
                                                                       == (IData)(vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__mw_pipe_reg_csr_write_addr))
                                                                       ? vlSelfRef.nicore__DOT__datapath__DOT__csr__DOT__mtval_data
                                                                       : 
                                                                      ((0x0344U 
                                                                        == (IData)(vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__mw_pipe_reg_csr_write_addr))
                                                                        ? vlSelfRef.nicore__DOT__datapath__DOT__csr__DOT___sip_T
                                                                        : 
                                                                       ((0x0b00U 
                                                                         == (IData)(vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__mw_pipe_reg_csr_write_addr))
                                                                         ? vlSelfRef.nicore__DOT__datapath__DOT__csr__DOT__mcycle_data
                                                                         : 
                                                                        (vlSelfRef.nicore__DOT__datapath__DOT__csr__DOT__minstret_data 
                                                                         & (- (QData)((IData)(
                                                                                (0x0b02U 
                                                                                == (IData)(vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__mw_pipe_reg_csr_write_addr)))))))))))) 
                                                                  & (- (QData)((IData)(
                                                                                (0x0306U 
                                                                                != (IData)(vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__mw_pipe_reg_csr_write_addr)))))))))))) 
                                                           & (- (QData)((IData)(
                                                                                (0x0f14U 
                                                                                != (IData)(vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__mw_pipe_reg_csr_write_addr))))))))))))))) 
                               & (- (QData)((IData)(
                                                    (0x0106U 
                                                     != (IData)(vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__mw_pipe_reg_csr_write_addr)))))))))));
    vlSelfRef.nicore__DOT__datapath__DOT__csr__DOT__flagIntM 
        = (vlSelfRef.nicore__DOT__datapath__DOT__csr__DOT___sip_T 
           & vlSelfRef.nicore__DOT__datapath__DOT__csr__DOT___sie_T);
    vlSelfRef.nicore__DOT__datapath__DOT__memory_stage_io_tlb_flush_all 
        = ((0x0180U == (IData)(vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__mw_pipe_reg_csr_write_addr)) 
           & (IData)(vlSelfRef.nicore__DOT__datapath__DOT__csr__DOT__writeEn));
    vlSelfRef.nicore__DOT__datapath__DOT__csr__DOT___hasExc_T_16 
        = (1U & (~ (IData)(vlSelfRef.nicore__DOT__datapath__DOT__csr__DOT__writeEn)));
    vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__regFile_io_wen 
        = (((3U == (IData)(vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__mw_pipe_reg_wb_sel)) 
            | ((2U == (IData)(vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__mw_pipe_reg_wb_sel)) 
               | ((0U == (IData)(vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__mw_pipe_reg_wb_sel)) 
                  | (1U == (IData)(vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__mw_pipe_reg_wb_sel))))) 
           & (IData)(vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT___T_18));
    vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__regFile_io_wdata 
        = ((0U == (IData)(vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__mw_pipe_reg_wb_sel))
            ? vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__mw_pipe_reg_alu_out
            : ((2U == (IData)(vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__mw_pipe_reg_wb_sel))
                ? vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT___csr_write_data_T_8
                : ((3U == (IData)(vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__mw_pipe_reg_wb_sel))
                    ? vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__mw_pipe_reg_csr_read_data
                    : vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__mw_pipe_reg_load_data)));
    vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage_io_csr_next_fetch 
        = ((IData)(vlSelfRef.nicore__DOT__datapath__DOT___csr_atomic_flush_T_1)
            ? vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT___csr_write_data_T_8
            : ((IData)(vlSelfRef.nicore__DOT__datapath__DOT___csr_atomic_flush_T_3)
                ? vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT___next_pc_T_8
                : ((IData)(vlSelfRef.nicore__DOT__datapath__DOT___csr_atomic_flush_T_5)
                    ? (4ULL + vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__de_pipe_reg_pc)
                    : (4ULL + vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_pc))));
    vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT___T_4 
        = ((2U != (IData)(vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__em_pipe_reg_amo_op)) 
           & (IData)(vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__is_amo));
    vlSelfRef.__VdfgRegularize_hebeb780c_0_311 = ((IData)(vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__amo_second) 
                                                  & (IData)(vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__is_amo));
    vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__iTLB__DOT___T_186 
        = (1U & (~ (IData)(vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__iTLB__DOT__permList_0)));
    vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__src_unready 
        = ((0U != (IData)(vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__em_pipe_reg_ld_type)) 
           & ((~ (IData)(vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__data_cache_tag)) 
              & ((IData)(vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__em_pipe_reg_enable) 
                 & ((~ (IData)(vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__em_pipe_reg_is_clint)) 
                    & ((IData)(vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__de_pipe_reg_enable) 
                       & ((IData)(vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT___src_unready_T) 
                          | (IData)(vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT___src_unready_T_1)))))));
    vlSelfRef.__VdfgRegularize_hebeb780c_0_415 = ((IData)(vlSelfRef.io_master_rlast) 
                                                  & (IData)(vlSelfRef.nicore__DOT__icache_io_mem_io_r_valid));
    vlSelfRef.nicore__DOT__icache__DOT___GEN_0 = (1U 
                                                  & (((0U 
                                                       != (IData)(vlSelfRef.nicore__DOT__icache__DOT__cache_state)) 
                                                      & ((0x0fU 
                                                          != (IData)(vlSelfRef.nicore__DOT__icache__DOT__cache_state)) 
                                                         & ((0x10U 
                                                             != (IData)(vlSelfRef.nicore__DOT__icache__DOT__cache_state)) 
                                                            & ((0x11U 
                                                                != (IData)(vlSelfRef.nicore__DOT__icache__DOT__cache_state)) 
                                                               & ((0x13U 
                                                                   != (IData)(vlSelfRef.nicore__DOT__icache__DOT__cache_state)) 
                                                                  & ((1U 
                                                                      != (IData)(vlSelfRef.nicore__DOT__icache__DOT__cache_state)) 
                                                                     & ((3U 
                                                                         != (IData)(vlSelfRef.nicore__DOT__icache__DOT__cache_state)) 
                                                                        & ((4U 
                                                                            != (IData)(vlSelfRef.nicore__DOT__icache__DOT__cache_state)) 
                                                                           & ((5U 
                                                                               != (IData)(vlSelfRef.nicore__DOT__icache__DOT__cache_state)) 
                                                                              & ((6U 
                                                                                != (IData)(vlSelfRef.nicore__DOT__icache__DOT__cache_state)) 
                                                                                & ((0x0cU 
                                                                                != (IData)(vlSelfRef.nicore__DOT__icache__DOT__cache_state)) 
                                                                                & ((0x0dU 
                                                                                != (IData)(vlSelfRef.nicore__DOT__icache__DOT__cache_state)) 
                                                                                & ((9U 
                                                                                != (IData)(vlSelfRef.nicore__DOT__icache__DOT__cache_state)) 
                                                                                & ((8U 
                                                                                == (IData)(vlSelfRef.nicore__DOT__icache__DOT__cache_state)) 
                                                                                & (IData)(vlSelfRef.nicore__DOT__icache_io_mem_io_r_valid)))))))))))))))
                                                      ? 
                                                     ((IData)(1U) 
                                                      + (IData)(vlSelfRef.nicore__DOT__icache__DOT__index))
                                                      : (IData)(vlSelfRef.nicore__DOT__icache__DOT__index)));
    __Vtemp_10[0U] = (IData)(((- (QData)((IData)((0U 
                                                  != (IData)(vlSelfRef.nicore__DOT__icache__DOT__cache_state))))) 
                              & ((- (QData)((IData)(
                                                    (0x0fU 
                                                     != (IData)(vlSelfRef.nicore__DOT__icache__DOT__cache_state))))) 
                                 & ((- (QData)((IData)(
                                                       (0x10U 
                                                        != (IData)(vlSelfRef.nicore__DOT__icache__DOT__cache_state))))) 
                                    & ((- (QData)((IData)(
                                                          (0x11U 
                                                           != (IData)(vlSelfRef.nicore__DOT__icache__DOT__cache_state))))) 
                                       & ((- (QData)((IData)(
                                                             (0x13U 
                                                              != (IData)(vlSelfRef.nicore__DOT__icache__DOT__cache_state))))) 
                                          & ((- (QData)((IData)(
                                                                (1U 
                                                                 != (IData)(vlSelfRef.nicore__DOT__icache__DOT__cache_state))))) 
                                             & ((- (QData)((IData)(
                                                                   (3U 
                                                                    != (IData)(vlSelfRef.nicore__DOT__icache__DOT__cache_state))))) 
                                                & ((- (QData)((IData)(
                                                                      (4U 
                                                                       != (IData)(vlSelfRef.nicore__DOT__icache__DOT__cache_state))))) 
                                                   & ((- (QData)((IData)(
                                                                         (5U 
                                                                          != (IData)(vlSelfRef.nicore__DOT__icache__DOT__cache_state))))) 
                                                      & ((- (QData)((IData)(
                                                                            (6U 
                                                                             != (IData)(vlSelfRef.nicore__DOT__icache__DOT__cache_state))))) 
                                                         & ((- (QData)((IData)(
                                                                               (0x0cU 
                                                                                != (IData)(vlSelfRef.nicore__DOT__icache__DOT__cache_state))))) 
                                                            & ((- (QData)((IData)(
                                                                                (0x0dU 
                                                                                != (IData)(vlSelfRef.nicore__DOT__icache__DOT__cache_state))))) 
                                                               & ((- (QData)((IData)(
                                                                                (9U 
                                                                                != (IData)(vlSelfRef.nicore__DOT__icache__DOT__cache_state))))) 
                                                                  & ((- (QData)((IData)(
                                                                                (8U 
                                                                                == (IData)(vlSelfRef.nicore__DOT__icache__DOT__cache_state))))) 
                                                                     & (((3U 
                                                                          == (IData)(vlSelfRef.nicore__DOT__icache__DOT__replace))
                                                                          ? vlSelfRef.nicore__DOT__icache__DOT___GEN_462
                                                                          : 
                                                                         ((2U 
                                                                           == (IData)(vlSelfRef.nicore__DOT__icache__DOT__replace))
                                                                           ? vlSelfRef.nicore__DOT__icache__DOT___GEN_462
                                                                           : 
                                                                          ((1U 
                                                                            == (IData)(vlSelfRef.nicore__DOT__icache__DOT__replace))
                                                                            ? vlSelfRef.nicore__DOT__icache__DOT___GEN_462
                                                                            : 
                                                                           ((- (QData)((IData)(
                                                                                (0U 
                                                                                == (IData)(vlSelfRef.nicore__DOT__icache__DOT__replace))))) 
                                                                            & vlSelfRef.nicore__DOT__icache__DOT___GEN_462)))) 
                                                                        & (- (QData)((IData)(vlSelfRef.nicore__DOT__icache_io_mem_io_r_valid)))))))))))))))))));
    __Vtemp_10[1U] = (IData)((((- (QData)((IData)((0U 
                                                   != (IData)(vlSelfRef.nicore__DOT__icache__DOT__cache_state))))) 
                               & ((- (QData)((IData)(
                                                     (0x0fU 
                                                      != (IData)(vlSelfRef.nicore__DOT__icache__DOT__cache_state))))) 
                                  & ((- (QData)((IData)(
                                                        (0x10U 
                                                         != (IData)(vlSelfRef.nicore__DOT__icache__DOT__cache_state))))) 
                                     & ((- (QData)((IData)(
                                                           (0x11U 
                                                            != (IData)(vlSelfRef.nicore__DOT__icache__DOT__cache_state))))) 
                                        & ((- (QData)((IData)(
                                                              (0x13U 
                                                               != (IData)(vlSelfRef.nicore__DOT__icache__DOT__cache_state))))) 
                                           & ((- (QData)((IData)(
                                                                 (1U 
                                                                  != (IData)(vlSelfRef.nicore__DOT__icache__DOT__cache_state))))) 
                                              & ((- (QData)((IData)(
                                                                    (3U 
                                                                     != (IData)(vlSelfRef.nicore__DOT__icache__DOT__cache_state))))) 
                                                 & ((- (QData)((IData)(
                                                                       (4U 
                                                                        != (IData)(vlSelfRef.nicore__DOT__icache__DOT__cache_state))))) 
                                                    & ((- (QData)((IData)(
                                                                          (5U 
                                                                           != (IData)(vlSelfRef.nicore__DOT__icache__DOT__cache_state))))) 
                                                       & ((- (QData)((IData)(
                                                                             (6U 
                                                                              != (IData)(vlSelfRef.nicore__DOT__icache__DOT__cache_state))))) 
                                                          & ((- (QData)((IData)(
                                                                                (0x0cU 
                                                                                != (IData)(vlSelfRef.nicore__DOT__icache__DOT__cache_state))))) 
                                                             & ((- (QData)((IData)(
                                                                                (0x0dU 
                                                                                != (IData)(vlSelfRef.nicore__DOT__icache__DOT__cache_state))))) 
                                                                & ((- (QData)((IData)(
                                                                                (9U 
                                                                                != (IData)(vlSelfRef.nicore__DOT__icache__DOT__cache_state))))) 
                                                                   & ((- (QData)((IData)(
                                                                                (8U 
                                                                                == (IData)(vlSelfRef.nicore__DOT__icache__DOT__cache_state))))) 
                                                                      & (((3U 
                                                                           == (IData)(vlSelfRef.nicore__DOT__icache__DOT__replace))
                                                                           ? vlSelfRef.nicore__DOT__icache__DOT___GEN_462
                                                                           : 
                                                                          ((2U 
                                                                            == (IData)(vlSelfRef.nicore__DOT__icache__DOT__replace))
                                                                            ? vlSelfRef.nicore__DOT__icache__DOT___GEN_462
                                                                            : 
                                                                           ((1U 
                                                                             == (IData)(vlSelfRef.nicore__DOT__icache__DOT__replace))
                                                                             ? vlSelfRef.nicore__DOT__icache__DOT___GEN_462
                                                                             : 
                                                                            ((- (QData)((IData)(
                                                                                (0U 
                                                                                == (IData)(vlSelfRef.nicore__DOT__icache__DOT__replace))))) 
                                                                             & vlSelfRef.nicore__DOT__icache__DOT___GEN_462)))) 
                                                                         & (- (QData)((IData)(vlSelfRef.nicore__DOT__icache_io_mem_io_r_valid)))))))))))))))))) 
                              >> 0x00000020U));
    __Vtemp_10[2U] = (IData)(((- (QData)((IData)((0U 
                                                  != (IData)(vlSelfRef.nicore__DOT__icache__DOT__cache_state))))) 
                              & ((- (QData)((IData)(
                                                    (0x0fU 
                                                     != (IData)(vlSelfRef.nicore__DOT__icache__DOT__cache_state))))) 
                                 & ((- (QData)((IData)(
                                                       (0x10U 
                                                        != (IData)(vlSelfRef.nicore__DOT__icache__DOT__cache_state))))) 
                                    & ((- (QData)((IData)(
                                                          (0x11U 
                                                           != (IData)(vlSelfRef.nicore__DOT__icache__DOT__cache_state))))) 
                                       & ((- (QData)((IData)(
                                                             (0x13U 
                                                              != (IData)(vlSelfRef.nicore__DOT__icache__DOT__cache_state))))) 
                                          & ((- (QData)((IData)(
                                                                (1U 
                                                                 != (IData)(vlSelfRef.nicore__DOT__icache__DOT__cache_state))))) 
                                             & ((- (QData)((IData)(
                                                                   (3U 
                                                                    != (IData)(vlSelfRef.nicore__DOT__icache__DOT__cache_state))))) 
                                                & ((- (QData)((IData)(
                                                                      (4U 
                                                                       != (IData)(vlSelfRef.nicore__DOT__icache__DOT__cache_state))))) 
                                                   & ((- (QData)((IData)(
                                                                         (5U 
                                                                          != (IData)(vlSelfRef.nicore__DOT__icache__DOT__cache_state))))) 
                                                      & ((- (QData)((IData)(
                                                                            (6U 
                                                                             != (IData)(vlSelfRef.nicore__DOT__icache__DOT__cache_state))))) 
                                                         & ((- (QData)((IData)(
                                                                               (0x0cU 
                                                                                != (IData)(vlSelfRef.nicore__DOT__icache__DOT__cache_state))))) 
                                                            & ((- (QData)((IData)(
                                                                                (0x0dU 
                                                                                != (IData)(vlSelfRef.nicore__DOT__icache__DOT__cache_state))))) 
                                                               & ((- (QData)((IData)(
                                                                                (9U 
                                                                                != (IData)(vlSelfRef.nicore__DOT__icache__DOT__cache_state))))) 
                                                                  & ((- (QData)((IData)(
                                                                                (8U 
                                                                                == (IData)(vlSelfRef.nicore__DOT__icache__DOT__cache_state))))) 
                                                                     & (((3U 
                                                                          == (IData)(vlSelfRef.nicore__DOT__icache__DOT__replace))
                                                                          ? vlSelfRef.nicore__DOT__icache__DOT___GEN_463
                                                                          : 
                                                                         ((2U 
                                                                           == (IData)(vlSelfRef.nicore__DOT__icache__DOT__replace))
                                                                           ? vlSelfRef.nicore__DOT__icache__DOT___GEN_463
                                                                           : 
                                                                          ((1U 
                                                                            == (IData)(vlSelfRef.nicore__DOT__icache__DOT__replace))
                                                                            ? vlSelfRef.nicore__DOT__icache__DOT___GEN_463
                                                                            : 
                                                                           ((- (QData)((IData)(
                                                                                (0U 
                                                                                == (IData)(vlSelfRef.nicore__DOT__icache__DOT__replace))))) 
                                                                            & vlSelfRef.nicore__DOT__icache__DOT___GEN_463)))) 
                                                                        & (- (QData)((IData)(vlSelfRef.nicore__DOT__icache_io_mem_io_r_valid)))))))))))))))))));
    __Vtemp_10[3U] = (IData)((((- (QData)((IData)((0U 
                                                   != (IData)(vlSelfRef.nicore__DOT__icache__DOT__cache_state))))) 
                               & ((- (QData)((IData)(
                                                     (0x0fU 
                                                      != (IData)(vlSelfRef.nicore__DOT__icache__DOT__cache_state))))) 
                                  & ((- (QData)((IData)(
                                                        (0x10U 
                                                         != (IData)(vlSelfRef.nicore__DOT__icache__DOT__cache_state))))) 
                                     & ((- (QData)((IData)(
                                                           (0x11U 
                                                            != (IData)(vlSelfRef.nicore__DOT__icache__DOT__cache_state))))) 
                                        & ((- (QData)((IData)(
                                                              (0x13U 
                                                               != (IData)(vlSelfRef.nicore__DOT__icache__DOT__cache_state))))) 
                                           & ((- (QData)((IData)(
                                                                 (1U 
                                                                  != (IData)(vlSelfRef.nicore__DOT__icache__DOT__cache_state))))) 
                                              & ((- (QData)((IData)(
                                                                    (3U 
                                                                     != (IData)(vlSelfRef.nicore__DOT__icache__DOT__cache_state))))) 
                                                 & ((- (QData)((IData)(
                                                                       (4U 
                                                                        != (IData)(vlSelfRef.nicore__DOT__icache__DOT__cache_state))))) 
                                                    & ((- (QData)((IData)(
                                                                          (5U 
                                                                           != (IData)(vlSelfRef.nicore__DOT__icache__DOT__cache_state))))) 
                                                       & ((- (QData)((IData)(
                                                                             (6U 
                                                                              != (IData)(vlSelfRef.nicore__DOT__icache__DOT__cache_state))))) 
                                                          & ((- (QData)((IData)(
                                                                                (0x0cU 
                                                                                != (IData)(vlSelfRef.nicore__DOT__icache__DOT__cache_state))))) 
                                                             & ((- (QData)((IData)(
                                                                                (0x0dU 
                                                                                != (IData)(vlSelfRef.nicore__DOT__icache__DOT__cache_state))))) 
                                                                & ((- (QData)((IData)(
                                                                                (9U 
                                                                                != (IData)(vlSelfRef.nicore__DOT__icache__DOT__cache_state))))) 
                                                                   & ((- (QData)((IData)(
                                                                                (8U 
                                                                                == (IData)(vlSelfRef.nicore__DOT__icache__DOT__cache_state))))) 
                                                                      & (((3U 
                                                                           == (IData)(vlSelfRef.nicore__DOT__icache__DOT__replace))
                                                                           ? vlSelfRef.nicore__DOT__icache__DOT___GEN_463
                                                                           : 
                                                                          ((2U 
                                                                            == (IData)(vlSelfRef.nicore__DOT__icache__DOT__replace))
                                                                            ? vlSelfRef.nicore__DOT__icache__DOT___GEN_463
                                                                            : 
                                                                           ((1U 
                                                                             == (IData)(vlSelfRef.nicore__DOT__icache__DOT__replace))
                                                                             ? vlSelfRef.nicore__DOT__icache__DOT___GEN_463
                                                                             : 
                                                                            ((- (QData)((IData)(
                                                                                (0U 
                                                                                == (IData)(vlSelfRef.nicore__DOT__icache__DOT__replace))))) 
                                                                             & vlSelfRef.nicore__DOT__icache__DOT___GEN_463)))) 
                                                                         & (- (QData)((IData)(vlSelfRef.nicore__DOT__icache_io_mem_io_r_valid)))))))))))))))))) 
                              >> 0x00000020U));
    vlSelfRef.nicore__DOT__icache__DOT___data_mem_0_io_cache_req_wmask_T_1[0U] 
        = (~ __Vtemp_10[0U]);
    vlSelfRef.nicore__DOT__icache__DOT___data_mem_0_io_cache_req_wmask_T_1[1U] 
        = (~ __Vtemp_10[1U]);
    vlSelfRef.nicore__DOT__icache__DOT___data_mem_0_io_cache_req_wmask_T_1[2U] 
        = (~ __Vtemp_10[2U]);
    vlSelfRef.nicore__DOT__icache__DOT___data_mem_0_io_cache_req_wmask_T_1[3U] 
        = (~ __Vtemp_10[3U]);
    vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__iTLB_io_cache_response_ready 
        = ((0U != (IData)(vlSelfRef.nicore__DOT__icache__DOT__cache_state)) 
           & ((0x0fU == (IData)(vlSelfRef.nicore__DOT__icache__DOT__cache_state))
               ? (IData)(vlSelfRef.nicore__DOT__icache__DOT__flush_over)
               : ((0x10U != (IData)(vlSelfRef.nicore__DOT__icache__DOT__cache_state)) 
                  & ((0x11U != (IData)(vlSelfRef.nicore__DOT__icache__DOT__cache_state)) 
                     & ((0x13U != (IData)(vlSelfRef.nicore__DOT__icache__DOT__cache_state)) 
                        & ((1U != (IData)(vlSelfRef.nicore__DOT__icache__DOT__cache_state)) 
                           & ((3U == (IData)(vlSelfRef.nicore__DOT__icache__DOT__cache_state))
                               ? (IData)(vlSelfRef.nicore__DOT__icache_io_mem_io_r_valid)
                               : ((4U != (IData)(vlSelfRef.nicore__DOT__icache__DOT__cache_state)) 
                                  & ((5U != (IData)(vlSelfRef.nicore__DOT__icache__DOT__cache_state)) 
                                     & ((6U != (IData)(vlSelfRef.nicore__DOT__icache__DOT__cache_state)) 
                                        & ((0x0dU == (IData)(vlSelfRef.nicore__DOT__icache__DOT__cache_state)) 
                                           | (0x0cU 
                                              == (IData)(vlSelfRef.nicore__DOT__icache__DOT__cache_state)))))))))))));
    vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__iTLB__DOT___T_195 
        = (1U & ((~ (IData)(vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__iTLB__DOT___T_197)) 
                 | (IData)((4ULL == (6ULL & vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__iTLB__DOT___T_197)))));
    vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__iTLB__DOT___T_196 
        = (IData)((0ULL != (0x000000000000000aULL & vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__iTLB__DOT___T_197)));
    vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__iTLB__DOT___io_tlb_ready_T 
        = (1U & (~ (IData)(vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__iTLB_io_valid)));
    vlSelfRef.io_master_awvalid = ((3U == (IData)(vlSelfRef.nicore__DOT__arb__DOT__state)) 
                                   & (IData)(vlSelfRef.nicore__DOT__dcache_io_mem_io_aw_valid));
    vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__divider__DOT___GEN_1 
        = (0x0000007fU & ((IData)(vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__divider__DOT__counter_enable)
                           ? (((IData)(1U) + (IData)(vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__divider__DOT__index)) 
                              & (- (IData)((0x40U != (IData)(vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__divider__DOT__index)))))
                           : (IData)(vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__divider__DOT__index)));
    vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__multiplier__DOT___io_result_T_4 
        = ((IData)(vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__multiplier__DOT__out_high)
            ? vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__multiplier__DOT__result_s[1U]
            : vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__multiplier__DOT__result_s[0U]);
    vlSelfRef.nicore__DOT__arb__DOT___GEN_5 = ((IData)(vlSelfRef.nicore__DOT__arb__DOT__state) 
                                               & (- (IData)(
                                                            (1U 
                                                             & (~ 
                                                                ((IData)(vlSelfRef.io_master_rlast) 
                                                                 & ((IData)(vlSelfRef.io_master_rvalid) 
                                                                    & (IData)(vlSelfRef.io_master_rready))))))));
    if (vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__divider__DOT__is_w) {
        if ((1U & (IData)((vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__divider__DOT__mid64_result 
                           >> 0x0000003fU)))) {
            vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__divider__DOT___GEN_23[0U] 
                = vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__divider__DOT__dividend[0U];
            vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__divider__DOT___GEN_23[1U] 
                = vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__divider__DOT__dividend[1U];
            vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__divider__DOT___GEN_23[2U] 
                = vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__divider__DOT__dividend[2U];
            vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__divider__DOT___GEN_23[3U] 
                = vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__divider__DOT__dividend[3U];
        } else {
            vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__divider__DOT___GEN_23[0U] 
                = (IData)(vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__divider__DOT__mid64_result);
            vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__divider__DOT___GEN_23[1U] 
                = (IData)((vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__divider__DOT__mid64_result 
                           >> 0x00000020U));
            vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__divider__DOT___GEN_23[2U] = 0U;
            vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__divider__DOT___GEN_23[3U] = 0U;
        }
    } else {
        vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__divider__DOT___GEN_23[0U] 
            = vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__divider__DOT__dividend[0U];
        vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__divider__DOT___GEN_23[1U] 
            = vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__divider__DOT__dividend[1U];
        vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__divider__DOT___GEN_23[2U] 
            = vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__divider__DOT__dividend[2U];
        vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__divider__DOT___GEN_23[3U] 
            = vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__divider__DOT__dividend[3U];
    }
    vlSelfRef.nicore__DOT__datapath__DOT__csr__DOT___instValid_T 
        = ((IData)(vlSelfRef.nicore__DOT__datapath__DOT__csr__DOT__readable) 
           & (IData)(vlSelfRef.nicore__DOT__datapath__DOT__csr__DOT__writable));
    vlSelfRef.nicore__DOT__icache__DOT___data_mem_0_io_data_write_data_T[0U] 
        = (IData)(((- (QData)((IData)((0U != (IData)(vlSelfRef.nicore__DOT__icache__DOT__cache_state))))) 
                   & ((- (QData)((IData)((0x0fU != (IData)(vlSelfRef.nicore__DOT__icache__DOT__cache_state))))) 
                      & (((0x11U == (IData)(vlSelfRef.nicore__DOT__icache__DOT__cache_state))
                           ? (((QData)((IData)(vlSelfRef.nicore__DOT__sram0_Q[1U])) 
                               << 0x00000020U) | (QData)((IData)(vlSelfRef.nicore__DOT__sram0_Q[0U])))
                           : ((- (QData)((IData)((0x13U 
                                                  != (IData)(vlSelfRef.nicore__DOT__icache__DOT__cache_state))))) 
                              & ((- (QData)((IData)(
                                                    (1U 
                                                     != (IData)(vlSelfRef.nicore__DOT__icache__DOT__cache_state))))) 
                                 & ((- (QData)((IData)(
                                                       (3U 
                                                        != (IData)(vlSelfRef.nicore__DOT__icache__DOT__cache_state))))) 
                                    & ((- (QData)((IData)(
                                                          (4U 
                                                           != (IData)(vlSelfRef.nicore__DOT__icache__DOT__cache_state))))) 
                                       & ((- (QData)((IData)(
                                                             (5U 
                                                              != (IData)(vlSelfRef.nicore__DOT__icache__DOT__cache_state))))) 
                                          & ((- (QData)((IData)(
                                                                (6U 
                                                                 != (IData)(vlSelfRef.nicore__DOT__icache__DOT__cache_state))))) 
                                             & ((- (QData)((IData)(
                                                                   (0x0cU 
                                                                    != (IData)(vlSelfRef.nicore__DOT__icache__DOT__cache_state))))) 
                                                & ((- (QData)((IData)(
                                                                      (0x0dU 
                                                                       != (IData)(vlSelfRef.nicore__DOT__icache__DOT__cache_state))))) 
                                                   & (((8U 
                                                        == (IData)(vlSelfRef.nicore__DOT__icache__DOT__cache_state))
                                                        ? 
                                                       (((3U 
                                                          == (IData)(vlSelfRef.nicore__DOT__icache__DOT__replace))
                                                          ? vlSelfRef.nicore__DOT__icache__DOT___GEN_460
                                                          : 
                                                         ((2U 
                                                           == (IData)(vlSelfRef.nicore__DOT__icache__DOT__replace))
                                                           ? vlSelfRef.nicore__DOT__icache__DOT___GEN_460
                                                           : 
                                                          ((1U 
                                                            == (IData)(vlSelfRef.nicore__DOT__icache__DOT__replace))
                                                            ? vlSelfRef.nicore__DOT__icache__DOT___GEN_460
                                                            : 
                                                           ((- (QData)((IData)(
                                                                               (0U 
                                                                                == (IData)(vlSelfRef.nicore__DOT__icache__DOT__replace))))) 
                                                            & vlSelfRef.nicore__DOT__icache__DOT___GEN_460)))) 
                                                        & (- (QData)((IData)(vlSelfRef.nicore__DOT__icache_io_mem_io_r_valid))))
                                                        : 
                                                       ((- (QData)((IData)(
                                                                           (0x0eU 
                                                                            != (IData)(vlSelfRef.nicore__DOT__icache__DOT__cache_state))))) 
                                                        & (((3U 
                                                             == (IData)(vlSelfRef.nicore__DOT__icache__DOT__replace))
                                                             ? 
                                                            (((QData)((IData)(vlSelfRef.nicore__DOT__sram3_Q[1U])) 
                                                              << 0x00000020U) 
                                                             | (QData)((IData)(vlSelfRef.nicore__DOT__sram3_Q[0U])))
                                                             : 
                                                            ((2U 
                                                              == (IData)(vlSelfRef.nicore__DOT__icache__DOT__replace))
                                                              ? 
                                                             (((QData)((IData)(vlSelfRef.nicore__DOT__sram2_Q[1U])) 
                                                               << 0x00000020U) 
                                                              | (QData)((IData)(vlSelfRef.nicore__DOT__sram2_Q[0U])))
                                                              : 
                                                             ((1U 
                                                               == (IData)(vlSelfRef.nicore__DOT__icache__DOT__replace))
                                                               ? 
                                                              (((QData)((IData)(vlSelfRef.nicore__DOT__sram1_Q[1U])) 
                                                                << 0x00000020U) 
                                                               | (QData)((IData)(vlSelfRef.nicore__DOT__sram1_Q[0U])))
                                                               : 
                                                              ((((QData)((IData)(vlSelfRef.nicore__DOT__sram0_Q[1U])) 
                                                                 << 0x00000020U) 
                                                                | (QData)((IData)(vlSelfRef.nicore__DOT__sram0_Q[0U]))) 
                                                               & (- (QData)((IData)(
                                                                                (0U 
                                                                                == (IData)(vlSelfRef.nicore__DOT__icache__DOT__replace))))))))) 
                                                           & (- (QData)((IData)(
                                                                                (7U 
                                                                                == (IData)(vlSelfRef.nicore__DOT__icache__DOT__cache_state)))))))) 
                                                      & (- (QData)((IData)(
                                                                           (9U 
                                                                            != (IData)(vlSelfRef.nicore__DOT__icache__DOT__cache_state))))))))))))))) 
                         & (- (QData)((IData)((0x10U 
                                               != (IData)(vlSelfRef.nicore__DOT__icache__DOT__cache_state)))))))));
    vlSelfRef.nicore__DOT__icache__DOT___data_mem_0_io_data_write_data_T[1U] 
        = (IData)((((- (QData)((IData)((0U != (IData)(vlSelfRef.nicore__DOT__icache__DOT__cache_state))))) 
                    & ((- (QData)((IData)((0x0fU != (IData)(vlSelfRef.nicore__DOT__icache__DOT__cache_state))))) 
                       & (((0x11U == (IData)(vlSelfRef.nicore__DOT__icache__DOT__cache_state))
                            ? (((QData)((IData)(vlSelfRef.nicore__DOT__sram0_Q[1U])) 
                                << 0x00000020U) | (QData)((IData)(vlSelfRef.nicore__DOT__sram0_Q[0U])))
                            : ((- (QData)((IData)((0x13U 
                                                   != (IData)(vlSelfRef.nicore__DOT__icache__DOT__cache_state))))) 
                               & ((- (QData)((IData)(
                                                     (1U 
                                                      != (IData)(vlSelfRef.nicore__DOT__icache__DOT__cache_state))))) 
                                  & ((- (QData)((IData)(
                                                        (3U 
                                                         != (IData)(vlSelfRef.nicore__DOT__icache__DOT__cache_state))))) 
                                     & ((- (QData)((IData)(
                                                           (4U 
                                                            != (IData)(vlSelfRef.nicore__DOT__icache__DOT__cache_state))))) 
                                        & ((- (QData)((IData)(
                                                              (5U 
                                                               != (IData)(vlSelfRef.nicore__DOT__icache__DOT__cache_state))))) 
                                           & ((- (QData)((IData)(
                                                                 (6U 
                                                                  != (IData)(vlSelfRef.nicore__DOT__icache__DOT__cache_state))))) 
                                              & ((- (QData)((IData)(
                                                                    (0x0cU 
                                                                     != (IData)(vlSelfRef.nicore__DOT__icache__DOT__cache_state))))) 
                                                 & ((- (QData)((IData)(
                                                                       (0x0dU 
                                                                        != (IData)(vlSelfRef.nicore__DOT__icache__DOT__cache_state))))) 
                                                    & (((8U 
                                                         == (IData)(vlSelfRef.nicore__DOT__icache__DOT__cache_state))
                                                         ? 
                                                        (((3U 
                                                           == (IData)(vlSelfRef.nicore__DOT__icache__DOT__replace))
                                                           ? vlSelfRef.nicore__DOT__icache__DOT___GEN_460
                                                           : 
                                                          ((2U 
                                                            == (IData)(vlSelfRef.nicore__DOT__icache__DOT__replace))
                                                            ? vlSelfRef.nicore__DOT__icache__DOT___GEN_460
                                                            : 
                                                           ((1U 
                                                             == (IData)(vlSelfRef.nicore__DOT__icache__DOT__replace))
                                                             ? vlSelfRef.nicore__DOT__icache__DOT___GEN_460
                                                             : 
                                                            ((- (QData)((IData)(
                                                                                (0U 
                                                                                == (IData)(vlSelfRef.nicore__DOT__icache__DOT__replace))))) 
                                                             & vlSelfRef.nicore__DOT__icache__DOT___GEN_460)))) 
                                                         & (- (QData)((IData)(vlSelfRef.nicore__DOT__icache_io_mem_io_r_valid))))
                                                         : 
                                                        ((- (QData)((IData)(
                                                                            (0x0eU 
                                                                             != (IData)(vlSelfRef.nicore__DOT__icache__DOT__cache_state))))) 
                                                         & (((3U 
                                                              == (IData)(vlSelfRef.nicore__DOT__icache__DOT__replace))
                                                              ? 
                                                             (((QData)((IData)(vlSelfRef.nicore__DOT__sram3_Q[1U])) 
                                                               << 0x00000020U) 
                                                              | (QData)((IData)(vlSelfRef.nicore__DOT__sram3_Q[0U])))
                                                              : 
                                                             ((2U 
                                                               == (IData)(vlSelfRef.nicore__DOT__icache__DOT__replace))
                                                               ? 
                                                              (((QData)((IData)(vlSelfRef.nicore__DOT__sram2_Q[1U])) 
                                                                << 0x00000020U) 
                                                               | (QData)((IData)(vlSelfRef.nicore__DOT__sram2_Q[0U])))
                                                               : 
                                                              ((1U 
                                                                == (IData)(vlSelfRef.nicore__DOT__icache__DOT__replace))
                                                                ? 
                                                               (((QData)((IData)(vlSelfRef.nicore__DOT__sram1_Q[1U])) 
                                                                 << 0x00000020U) 
                                                                | (QData)((IData)(vlSelfRef.nicore__DOT__sram1_Q[0U])))
                                                                : 
                                                               ((((QData)((IData)(vlSelfRef.nicore__DOT__sram0_Q[1U])) 
                                                                  << 0x00000020U) 
                                                                 | (QData)((IData)(vlSelfRef.nicore__DOT__sram0_Q[0U]))) 
                                                                & (- (QData)((IData)(
                                                                                (0U 
                                                                                == (IData)(vlSelfRef.nicore__DOT__icache__DOT__replace))))))))) 
                                                            & (- (QData)((IData)(
                                                                                (7U 
                                                                                == (IData)(vlSelfRef.nicore__DOT__icache__DOT__cache_state)))))))) 
                                                       & (- (QData)((IData)(
                                                                            (9U 
                                                                             != (IData)(vlSelfRef.nicore__DOT__icache__DOT__cache_state))))))))))))))) 
                          & (- (QData)((IData)((0x10U 
                                                != (IData)(vlSelfRef.nicore__DOT__icache__DOT__cache_state)))))))) 
                   >> 0x00000020U));
    vlSelfRef.nicore__DOT__icache__DOT___data_mem_0_io_data_write_data_T[2U] 
        = (IData)(((- (QData)((IData)((0U != (IData)(vlSelfRef.nicore__DOT__icache__DOT__cache_state))))) 
                   & ((- (QData)((IData)((0x0fU != (IData)(vlSelfRef.nicore__DOT__icache__DOT__cache_state))))) 
                      & (((0x11U == (IData)(vlSelfRef.nicore__DOT__icache__DOT__cache_state))
                           ? (((QData)((IData)(vlSelfRef.nicore__DOT__sram0_Q[3U])) 
                               << 0x00000020U) | (QData)((IData)(vlSelfRef.nicore__DOT__sram0_Q[2U])))
                           : ((- (QData)((IData)((0x13U 
                                                  != (IData)(vlSelfRef.nicore__DOT__icache__DOT__cache_state))))) 
                              & ((- (QData)((IData)(
                                                    (1U 
                                                     != (IData)(vlSelfRef.nicore__DOT__icache__DOT__cache_state))))) 
                                 & ((- (QData)((IData)(
                                                       (3U 
                                                        != (IData)(vlSelfRef.nicore__DOT__icache__DOT__cache_state))))) 
                                    & ((- (QData)((IData)(
                                                          (4U 
                                                           != (IData)(vlSelfRef.nicore__DOT__icache__DOT__cache_state))))) 
                                       & ((- (QData)((IData)(
                                                             (5U 
                                                              != (IData)(vlSelfRef.nicore__DOT__icache__DOT__cache_state))))) 
                                          & ((- (QData)((IData)(
                                                                (6U 
                                                                 != (IData)(vlSelfRef.nicore__DOT__icache__DOT__cache_state))))) 
                                             & ((- (QData)((IData)(
                                                                   (0x0cU 
                                                                    != (IData)(vlSelfRef.nicore__DOT__icache__DOT__cache_state))))) 
                                                & ((- (QData)((IData)(
                                                                      (0x0dU 
                                                                       != (IData)(vlSelfRef.nicore__DOT__icache__DOT__cache_state))))) 
                                                   & (((8U 
                                                        == (IData)(vlSelfRef.nicore__DOT__icache__DOT__cache_state))
                                                        ? 
                                                       (((3U 
                                                          == (IData)(vlSelfRef.nicore__DOT__icache__DOT__replace))
                                                          ? vlSelfRef.nicore__DOT__icache__DOT___GEN_461
                                                          : 
                                                         ((2U 
                                                           == (IData)(vlSelfRef.nicore__DOT__icache__DOT__replace))
                                                           ? vlSelfRef.nicore__DOT__icache__DOT___GEN_461
                                                           : 
                                                          ((1U 
                                                            == (IData)(vlSelfRef.nicore__DOT__icache__DOT__replace))
                                                            ? vlSelfRef.nicore__DOT__icache__DOT___GEN_461
                                                            : 
                                                           ((- (QData)((IData)(
                                                                               (0U 
                                                                                == (IData)(vlSelfRef.nicore__DOT__icache__DOT__replace))))) 
                                                            & vlSelfRef.nicore__DOT__icache__DOT___GEN_461)))) 
                                                        & (- (QData)((IData)(vlSelfRef.nicore__DOT__icache_io_mem_io_r_valid))))
                                                        : 
                                                       ((- (QData)((IData)(
                                                                           (0x0eU 
                                                                            != (IData)(vlSelfRef.nicore__DOT__icache__DOT__cache_state))))) 
                                                        & (((3U 
                                                             == (IData)(vlSelfRef.nicore__DOT__icache__DOT__replace))
                                                             ? 
                                                            (((QData)((IData)(vlSelfRef.nicore__DOT__sram3_Q[3U])) 
                                                              << 0x00000020U) 
                                                             | (QData)((IData)(vlSelfRef.nicore__DOT__sram3_Q[2U])))
                                                             : 
                                                            ((2U 
                                                              == (IData)(vlSelfRef.nicore__DOT__icache__DOT__replace))
                                                              ? 
                                                             (((QData)((IData)(vlSelfRef.nicore__DOT__sram2_Q[3U])) 
                                                               << 0x00000020U) 
                                                              | (QData)((IData)(vlSelfRef.nicore__DOT__sram2_Q[2U])))
                                                              : 
                                                             ((1U 
                                                               == (IData)(vlSelfRef.nicore__DOT__icache__DOT__replace))
                                                               ? 
                                                              (((QData)((IData)(vlSelfRef.nicore__DOT__sram1_Q[3U])) 
                                                                << 0x00000020U) 
                                                               | (QData)((IData)(vlSelfRef.nicore__DOT__sram1_Q[2U])))
                                                               : 
                                                              ((((QData)((IData)(vlSelfRef.nicore__DOT__sram0_Q[3U])) 
                                                                 << 0x00000020U) 
                                                                | (QData)((IData)(vlSelfRef.nicore__DOT__sram0_Q[2U]))) 
                                                               & (- (QData)((IData)(
                                                                                (0U 
                                                                                == (IData)(vlSelfRef.nicore__DOT__icache__DOT__replace))))))))) 
                                                           & (- (QData)((IData)(
                                                                                (7U 
                                                                                == (IData)(vlSelfRef.nicore__DOT__icache__DOT__cache_state)))))))) 
                                                      & (- (QData)((IData)(
                                                                           (9U 
                                                                            != (IData)(vlSelfRef.nicore__DOT__icache__DOT__cache_state))))))))))))))) 
                         & (- (QData)((IData)((0x10U 
                                               != (IData)(vlSelfRef.nicore__DOT__icache__DOT__cache_state)))))))));
    vlSelfRef.nicore__DOT__icache__DOT___data_mem_0_io_data_write_data_T[3U] 
        = (IData)((((- (QData)((IData)((0U != (IData)(vlSelfRef.nicore__DOT__icache__DOT__cache_state))))) 
                    & ((- (QData)((IData)((0x0fU != (IData)(vlSelfRef.nicore__DOT__icache__DOT__cache_state))))) 
                       & (((0x11U == (IData)(vlSelfRef.nicore__DOT__icache__DOT__cache_state))
                            ? (((QData)((IData)(vlSelfRef.nicore__DOT__sram0_Q[3U])) 
                                << 0x00000020U) | (QData)((IData)(vlSelfRef.nicore__DOT__sram0_Q[2U])))
                            : ((- (QData)((IData)((0x13U 
                                                   != (IData)(vlSelfRef.nicore__DOT__icache__DOT__cache_state))))) 
                               & ((- (QData)((IData)(
                                                     (1U 
                                                      != (IData)(vlSelfRef.nicore__DOT__icache__DOT__cache_state))))) 
                                  & ((- (QData)((IData)(
                                                        (3U 
                                                         != (IData)(vlSelfRef.nicore__DOT__icache__DOT__cache_state))))) 
                                     & ((- (QData)((IData)(
                                                           (4U 
                                                            != (IData)(vlSelfRef.nicore__DOT__icache__DOT__cache_state))))) 
                                        & ((- (QData)((IData)(
                                                              (5U 
                                                               != (IData)(vlSelfRef.nicore__DOT__icache__DOT__cache_state))))) 
                                           & ((- (QData)((IData)(
                                                                 (6U 
                                                                  != (IData)(vlSelfRef.nicore__DOT__icache__DOT__cache_state))))) 
                                              & ((- (QData)((IData)(
                                                                    (0x0cU 
                                                                     != (IData)(vlSelfRef.nicore__DOT__icache__DOT__cache_state))))) 
                                                 & ((- (QData)((IData)(
                                                                       (0x0dU 
                                                                        != (IData)(vlSelfRef.nicore__DOT__icache__DOT__cache_state))))) 
                                                    & (((8U 
                                                         == (IData)(vlSelfRef.nicore__DOT__icache__DOT__cache_state))
                                                         ? 
                                                        (((3U 
                                                           == (IData)(vlSelfRef.nicore__DOT__icache__DOT__replace))
                                                           ? vlSelfRef.nicore__DOT__icache__DOT___GEN_461
                                                           : 
                                                          ((2U 
                                                            == (IData)(vlSelfRef.nicore__DOT__icache__DOT__replace))
                                                            ? vlSelfRef.nicore__DOT__icache__DOT___GEN_461
                                                            : 
                                                           ((1U 
                                                             == (IData)(vlSelfRef.nicore__DOT__icache__DOT__replace))
                                                             ? vlSelfRef.nicore__DOT__icache__DOT___GEN_461
                                                             : 
                                                            ((- (QData)((IData)(
                                                                                (0U 
                                                                                == (IData)(vlSelfRef.nicore__DOT__icache__DOT__replace))))) 
                                                             & vlSelfRef.nicore__DOT__icache__DOT___GEN_461)))) 
                                                         & (- (QData)((IData)(vlSelfRef.nicore__DOT__icache_io_mem_io_r_valid))))
                                                         : 
                                                        ((- (QData)((IData)(
                                                                            (0x0eU 
                                                                             != (IData)(vlSelfRef.nicore__DOT__icache__DOT__cache_state))))) 
                                                         & (((3U 
                                                              == (IData)(vlSelfRef.nicore__DOT__icache__DOT__replace))
                                                              ? 
                                                             (((QData)((IData)(vlSelfRef.nicore__DOT__sram3_Q[3U])) 
                                                               << 0x00000020U) 
                                                              | (QData)((IData)(vlSelfRef.nicore__DOT__sram3_Q[2U])))
                                                              : 
                                                             ((2U 
                                                               == (IData)(vlSelfRef.nicore__DOT__icache__DOT__replace))
                                                               ? 
                                                              (((QData)((IData)(vlSelfRef.nicore__DOT__sram2_Q[3U])) 
                                                                << 0x00000020U) 
                                                               | (QData)((IData)(vlSelfRef.nicore__DOT__sram2_Q[2U])))
                                                               : 
                                                              ((1U 
                                                                == (IData)(vlSelfRef.nicore__DOT__icache__DOT__replace))
                                                                ? 
                                                               (((QData)((IData)(vlSelfRef.nicore__DOT__sram1_Q[3U])) 
                                                                 << 0x00000020U) 
                                                                | (QData)((IData)(vlSelfRef.nicore__DOT__sram1_Q[2U])))
                                                                : 
                                                               ((((QData)((IData)(vlSelfRef.nicore__DOT__sram0_Q[3U])) 
                                                                  << 0x00000020U) 
                                                                 | (QData)((IData)(vlSelfRef.nicore__DOT__sram0_Q[2U]))) 
                                                                & (- (QData)((IData)(
                                                                                (0U 
                                                                                == (IData)(vlSelfRef.nicore__DOT__icache__DOT__replace))))))))) 
                                                            & (- (QData)((IData)(
                                                                                (7U 
                                                                                == (IData)(vlSelfRef.nicore__DOT__icache__DOT__cache_state)))))))) 
                                                       & (- (QData)((IData)(
                                                                            (9U 
                                                                             != (IData)(vlSelfRef.nicore__DOT__icache__DOT__cache_state))))))))))))))) 
                          & (- (QData)((IData)((0x10U 
                                                != (IData)(vlSelfRef.nicore__DOT__icache__DOT__cache_state)))))))) 
                   >> 0x00000020U));
    vlSelfRef.io_master_wvalid = ((3U == (IData)(vlSelfRef.nicore__DOT__arb__DOT__state)) 
                                  & (IData)(vlSelfRef.nicore__DOT__dcache_io_mem_io_w_valid));
    vlSelfRef.nicore__DOT__dcache__DOT__fill_block_en 
        = ((0U != (IData)(vlSelfRef.nicore__DOT__dcache__DOT__cache_state)) 
           & ((0x0fU != (IData)(vlSelfRef.nicore__DOT__dcache__DOT__cache_state)) 
              & (((0x11U == (IData)(vlSelfRef.nicore__DOT__dcache__DOT__cache_state))
                   ? (IData)(vlSelfRef.nicore__DOT__dcache__DOT___GEN_168)
                   : ((0x13U != (IData)(vlSelfRef.nicore__DOT__dcache__DOT__cache_state)) 
                      & ((1U != (IData)(vlSelfRef.nicore__DOT__dcache__DOT__cache_state)) 
                         & ((3U != (IData)(vlSelfRef.nicore__DOT__dcache__DOT__cache_state)) 
                            & ((4U != (IData)(vlSelfRef.nicore__DOT__dcache__DOT__cache_state)) 
                               & ((5U != (IData)(vlSelfRef.nicore__DOT__dcache__DOT__cache_state)) 
                                  & ((6U != (IData)(vlSelfRef.nicore__DOT__dcache__DOT__cache_state)) 
                                     & ((0x0cU != (IData)(vlSelfRef.nicore__DOT__dcache__DOT__cache_state)) 
                                        & ((0x0dU != (IData)(vlSelfRef.nicore__DOT__dcache__DOT__cache_state)) 
                                           & (((8U 
                                                == (IData)(vlSelfRef.nicore__DOT__dcache__DOT__cache_state))
                                                ? (IData)(vlSelfRef.nicore__DOT__dcache_io_mem_io_r_valid)
                                                : (
                                                   (0x0eU 
                                                    != (IData)(vlSelfRef.nicore__DOT__dcache__DOT__cache_state)) 
                                                   & ((7U 
                                                       == (IData)(vlSelfRef.nicore__DOT__dcache__DOT__cache_state)) 
                                                      & (IData)(vlSelfRef.nicore__DOT__dcache__DOT___GEN_168)))) 
                                              & (9U 
                                                 != (IData)(vlSelfRef.nicore__DOT__dcache__DOT__cache_state)))))))))))) 
                 & (0x10U != (IData)(vlSelfRef.nicore__DOT__dcache__DOT__cache_state)))));
    vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT___T_224 
        = (1U & ((~ (IData)(vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT___T_196)) 
                 | (IData)(vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT___T_195)));
    vlSelfRef.__VdfgRegularize_hebeb780c_0_306 = ((0x1000202fU 
                                                   == vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_42) 
                                                  | ((0x1000302fU 
                                                      == vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_42) 
                                                     | ((IData)(vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_47) 
                                                        | ((IData)(vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_49) 
                                                           | ((IData)(vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_51) 
                                                              | ((IData)(vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_53) 
                                                                 | ((IData)(vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_55) 
                                                                    | ((IData)(vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_57) 
                                                                       | ((IData)(vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_59) 
                                                                          | ((IData)(vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_61) 
                                                                             | ((IData)(vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_63) 
                                                                                | ((IData)(vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_65) 
                                                                                | ((IData)(vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_67) 
                                                                                | ((IData)(vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_69) 
                                                                                | ((0x00000013U 
                                                                                == vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_6) 
                                                                                | ((0x0000001bU 
                                                                                == vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_6) 
                                                                                | ((0x00002013U 
                                                                                == vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_6) 
                                                                                | ((0x00003013U 
                                                                                == vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_6) 
                                                                                | ((0x00004013U 
                                                                                == vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_6) 
                                                                                | ((0x00006013U 
                                                                                == vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_6) 
                                                                                | ((0x00007013U 
                                                                                == vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_6) 
                                                                                | ((0x00001013U 
                                                                                == vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_100) 
                                                                                | ((0x0000101bU 
                                                                                == vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_102) 
                                                                                | ((0x00005013U 
                                                                                == vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_100) 
                                                                                | ((0x0000501bU 
                                                                                == vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_102) 
                                                                                | ((0x40005013U 
                                                                                == vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_100) 
                                                                                | ((0x4000501bU 
                                                                                == vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_102) 
                                                                                | ((IData)(vlSelfRef.__VdfgRegularize_hebeb780c_0_307) 
                                                                                | ((0x00001073U 
                                                                                == vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_6) 
                                                                                | ((0x00002073U 
                                                                                == vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_6) 
                                                                                | (0x00003073U 
                                                                                == vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_6)))))))))))))))))))))))))))))));
    vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__immGen__DOT___io_out_T_5 
        = ((2U == (IData)(vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__immGen_io_sel))
            ? (((QData)((IData)(vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__immGen__DOT___Iimm_T_1)) 
                << 0x0000000cU) | (QData)((IData)((
                                                   (0x00000fe0U 
                                                    & (vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst 
                                                       >> 0x00000014U)) 
                                                   | (0x0000001fU 
                                                      & (vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst 
                                                         >> 7U))))))
            : ((1U == (IData)(vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__immGen_io_sel))
                ? vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__immGen__DOT__Iimm
                : (0x00000ffffffffffeULL & vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__immGen__DOT__Iimm)));
    vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT___csr_op_T_14 
        = ((1U == (IData)(vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__control_io_csr_cmd))
            ? 3U : ((IData)(((0U == (0x000f8000U & vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst)) 
                             & (3U == (IData)(vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__control_io_csr_cmd))))
                     ? 1U : ((IData)(((0U == (0x000f8000U 
                                              & vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst)) 
                                      & (2U == (IData)(vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__control_io_csr_cmd))))
                              ? 1U : (4U & (- (IData)(
                                                      (2U 
                                                       == (IData)(vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__control_io_csr_cmd))))))));
    vlSelfRef.nicore__DOT__datapath__DOT___csr_atomic_flush_T_7 
        = ((IData)(vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_enable) 
           & (0U != (IData)(vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__control_io_csr_cmd)));
    vlSelfRef.nicore__DOT__datapath__DOT__csr__DOT__writeData 
        = ((5U == (IData)(vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__mw_pipe_reg_csr_write_op))
            ? ((~ vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__mw_pipe_reg_csr_write_data) 
               & vlSelfRef.nicore__DOT__datapath__DOT__csr__DOT__csrData)
            : ((4U == (IData)(vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__mw_pipe_reg_csr_write_op))
                ? (vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__mw_pipe_reg_csr_write_data 
                   | vlSelfRef.nicore__DOT__datapath__DOT__csr__DOT__csrData)
                : ((3U == (IData)(vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__mw_pipe_reg_csr_write_op))
                    ? vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__mw_pipe_reg_csr_write_data
                    : ((2U == (IData)(vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__mw_pipe_reg_csr_write_op))
                        ? vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__mw_pipe_reg_csr_write_data
                        : vlSelfRef.nicore__DOT__datapath__DOT__csr__DOT__csrData))));
    vlSelfRef.nicore__DOT__datapath__DOT__csr__DOT__hasIntM 
        = ((0U != ((~ vlSelfRef.nicore__DOT__datapath__DOT__csr__DOT__mideleg_data) 
                   & vlSelfRef.nicore__DOT__datapath__DOT__csr__DOT__flagIntM)) 
           & ((IData)(vlSelfRef.nicore__DOT__datapath__DOT__csr__DOT__mstatus_mie) 
              | (1U >= (IData)(vlSelfRef.nicore__DOT__datapath__DOT__csr__DOT__mode))));
    vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__dTLB_io_tlb_flush_vpn 
        = (0x07ffffffU & ((IData)((vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__em_pipe_reg_sfence_rs1 
                                   >> 0x0000000cU)) 
                          & (- (IData)((1U & (~ (IData)(vlSelfRef.nicore__DOT__datapath__DOT__memory_stage_io_tlb_flush_all)))))));
    vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage_io_sfence_rs1 
        = (vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__em_pipe_reg_sfence_rs1 
           & (- (QData)((IData)((1U & (~ (IData)(vlSelfRef.nicore__DOT__datapath__DOT__memory_stage_io_tlb_flush_all)))))));
    vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__iTLB_io_tlb_flush_asid 
        = (0x0000ffffU & ((IData)(vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__em_pipe_reg_sfence_rs2) 
                          & (IData)((- (QData)((IData)(
                                                       (1U 
                                                        & (~ (IData)(vlSelfRef.nicore__DOT__datapath__DOT__memory_stage_io_tlb_flush_all)))))))));
    vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__iTLB_io_flush 
        = ((IData)(vlSelfRef.nicore__DOT__datapath__DOT__memory_stage_io_tlb_flush_all) 
           | (IData)(vlSelfRef.nicore__DOT__datapath__DOT__sfence_em));
    vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT___GEN_19 
        = (((IData)(vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT___T_18) 
            & ((0ULL != vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__de_pipe_reg_src2_addr) 
               & (IData)(vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT___T_31)))
            ? (vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__regFile_io_wdata 
               & (- (QData)((IData)(vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT___T_31))))
            : vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__de_pipe_reg_rs2);
    vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT___GEN_15 
        = (((IData)(vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT___T_18) 
            & ((0ULL != vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__de_pipe_reg_src1_addr) 
               & (IData)(vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT___T_19)))
            ? (vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__regFile_io_wdata 
               & (- (QData)((IData)(vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT___T_19))))
            : vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__de_pipe_reg_rs1);
    vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT___multiplier_io_mul_valid_T_2 
        = (1U & (~ (IData)(vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__src_unready)));
    vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__iTLB__DOT___T_224 
        = (1U & ((~ (IData)(vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__iTLB__DOT___T_196)) 
                 | (IData)(vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__iTLB__DOT___T_195)));
    vlSelfRef.__VdfgRegularize_hebeb780c_0_218 = (1U 
                                                  & (~ 
                                                     ((IData)(vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__iTLB__DOT___io_tlb_ready_T) 
                                                      & ((2U 
                                                          != (IData)(vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__iTLB__DOT__tlb_state)) 
                                                         & (0U 
                                                            != (IData)(vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__iTLB__DOT__tlb_state))))));
    if (vlSelfRef.nicore__DOT__dcache__DOT__fill_block_en) {
        vlSelfRef.nicore__DOT__dcache__DOT___GEN_0 
            = (1U & ((IData)(1U) + (IData)(vlSelfRef.nicore__DOT__dcache__DOT__index)));
        vlSelfRef.nicore__DOT__dcache__DOT__last = vlSelfRef.nicore__DOT__dcache__DOT__index;
    } else {
        vlSelfRef.nicore__DOT__dcache__DOT___GEN_0 
            = (1U & (IData)(vlSelfRef.nicore__DOT__dcache__DOT__index));
        vlSelfRef.nicore__DOT__dcache__DOT__last = 0U;
    }
    vlSelfRef.nicore__DOT__dcache__DOT___GEN_137 = 
        ((IData)(vlSelfRef.nicore__DOT__dcache__DOT__write_addr_reg)
          ? vlSelfRef.nicore__DOT__dcache__DOT__cpu_request_addr_reg
          : vlSelfRef.nicore__DOT__dcache__DOT__writeback_addr);
    vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__immGen__DOT___io_out_T_7 
        = ((5U == (IData)(vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__immGen_io_sel))
            ? (((QData)((IData)(vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__immGen__DOT___Iimm_T_1)) 
                << 0x0000000dU) | (QData)((IData)((
                                                   (((2U 
                                                      & (vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst 
                                                         >> 0x0000001eU)) 
                                                     | (1U 
                                                        & (vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst 
                                                           >> 7U))) 
                                                    << 0x0000000bU) 
                                                   | ((0x000007e0U 
                                                       & (vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst 
                                                          >> 0x00000014U)) 
                                                      | (0x0000001eU 
                                                         & (vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst 
                                                            >> 7U)))))))
            : (((QData)((IData)((1U & (IData)((vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__immGen__DOT___io_out_T_5 
                                               >> 0x0000002bU))))) 
                << 0x0000002cU) | vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__immGen__DOT___io_out_T_5));
    vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__csr_op 
        = ((IData)(((1U == (IData)(vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__control_io_csr_cmd)) 
                    & (0U == (0x00000f80U & vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst))))
            ? 2U : (IData)(vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT___csr_op_T_14));
    vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage_io_csr_atomic 
        = ((IData)(vlSelfRef.nicore__DOT__datapath__DOT___csr_atomic_flush_T_1) 
           | ((IData)(vlSelfRef.nicore__DOT__datapath__DOT___csr_atomic_flush_T_3) 
              | ((IData)(vlSelfRef.nicore__DOT__datapath__DOT___csr_atomic_flush_T_5) 
                 | (IData)(vlSelfRef.nicore__DOT__datapath__DOT___csr_atomic_flush_T_7))));
    vlSelfRef.nicore__DOT__datapath__DOT__csr__DOT___sepc_data_T_1 
        = (0xfffffffffffffffcULL & vlSelfRef.nicore__DOT__datapath__DOT__csr__DOT__writeData);
    vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__multiplier_io_mul_valid 
        = ((IData)(vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT___multiplier_io_mul_valid_T_2) 
           & (IData)(vlSelfRef.__VdfgRegularize_hebeb780c_0_408));
    vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__divider_io_div_valid 
        = ((IData)(vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT___multiplier_io_mul_valid_T_2) 
           & (((0x10U == (IData)(vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__de_pipe_reg_alu_op)) 
               | ((0x0eU == (IData)(vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__de_pipe_reg_alu_op)) 
                  | (IData)(vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT___divider_io_div_valid_T_2))) 
              & (IData)(vlSelfRef.__VdfgRegularize_hebeb780c_0_407)));
    vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage_io_icache_cpu_request_valid 
        = ((IData)(vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__iTLB__DOT___io_tlb_ready_T) 
           | ((IData)(vlSelfRef.__VdfgRegularize_hebeb780c_0_218) 
              & ((0U != (IData)(vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__iTLB__DOT__tlb_state)) 
                 & ((2U != (IData)(vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__iTLB__DOT__tlb_state)) 
                    & (((5U == (IData)(vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__iTLB__DOT__tlb_state)) 
                        | ((4U == (IData)(vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__iTLB__DOT__tlb_state)) 
                           | ((3U == (IData)(vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__iTLB__DOT__tlb_state)) 
                              | ((7U == (IData)(vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__iTLB__DOT__tlb_state)) 
                                 & (6U != (IData)(vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__iTLB__DOT__tlb_state)))))) 
                       & (1U != (IData)(vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__iTLB__DOT__tlb_state)))))));
    vlSelfRef.nicore__DOT__dcache__DOT___GEN_179 = 
        ((~ (IData)(vlSelfRef.nicore__DOT__dcache__DOT___T_58)) 
         & (IData)(vlSelfRef.nicore__DOT__dcache__DOT___GEN_0));
    vlSelfRef.nicore__DOT__dcache__DOT___GEN_178 = 
        ((~ (IData)(vlSelfRef.nicore__DOT__dcache__DOT___T_58)) 
         & ((IData)(vlSelfRef.nicore__DOT__dcache__DOT__write_data_reg) 
            | ((IData)(vlSelfRef.nicore__DOT__dcache_io_mem_io_w_ready) 
               & (IData)(vlSelfRef.nicore__DOT__dcache__DOT__last))));
    vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__iTLB_io_stall 
        = ((IData)(vlSelfRef.__VdfgRegularize_hebeb780c_0_408) 
           | ((((0x0fU == (IData)(vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__de_pipe_reg_alu_op)) 
                | ((0x10U == (IData)(vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__de_pipe_reg_alu_op)) 
                   | (IData)(vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__divider_io_div_signed))) 
               & (IData)(vlSelfRef.__VdfgRegularize_hebeb780c_0_407)) 
              | (((~ (IData)(vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__iTLB_io_cache_response_ready)) 
                  & (IData)(vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage_io_icache_cpu_request_valid)) 
                 | ((IData)(vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__em_pipe_reg_enable) 
                    & ((~ (IData)(vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__em_pipe_reg_is_clint)) 
                       & (((0x0000100fU == vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__em_pipe_reg_inst) 
                           | (IData)(vlSelfRef.__VdfgRegularize_hebeb780c_0_300)) 
                          & ((0U == (IData)(vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__dTLB_fault_reg)) 
                             & ((~ (IData)(vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__data_cache_tag)) 
                                | (IData)(vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__amo_second)))))))));
    vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__iTLB__DOT___T_3 
        = (1U & (~ (IData)(vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__iTLB_io_stall)));
    vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT___T_191 
        = ((IData)(vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__iTLB__DOT___T_3) 
           & (IData)(vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__dTLB_io_cache_response_ready));
    vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__iTLB__DOT___T_191 
        = ((IData)(vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__iTLB__DOT___T_3) 
           & (IData)(vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__iTLB_io_cache_response_ready));
    if (vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT___T_191) {
        vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT___GEN_386 
            = (1U & (IData)(vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT___T_197));
        vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT___GEN_387 
            = (1U & (IData)((vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT___T_197 
                             >> 1U)));
        vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT___GEN_388 
            = (1U & (IData)((vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT___T_197 
                             >> 2U)));
        vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT___GEN_389 
            = (1U & (IData)((vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT___T_197 
                             >> 3U)));
        vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT___GEN_390 
            = (1U & (IData)((vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT___T_197 
                             >> 4U)));
        vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT___GEN_391 
            = (1U & (IData)((vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT___T_197 
                             >> 5U)));
        vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT___GEN_392 
            = (1U & (IData)((vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT___T_197 
                             >> 6U)));
        vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT___GEN_393 
            = (1U & (IData)((vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT___T_197 
                             >> 7U)));
        vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT___GEN_394 
            = (3U & (IData)((vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT___T_197 
                             >> 8U)));
        vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT___GEN_395 
            = (0x00000fffffffffffULL & (vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT___T_197 
                                        >> 0x0000000aU));
    } else {
        vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT___GEN_386 
            = (1U & (IData)(vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT__pte_reg_V));
        vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT___GEN_387 
            = (1U & (IData)(vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT__pte_reg_R));
        vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT___GEN_388 
            = (1U & (IData)(vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT__pte_reg_W));
        vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT___GEN_389 
            = (1U & (IData)(vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT__pte_reg_X));
        vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT___GEN_390 
            = (1U & (IData)(vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT__pte_reg_U));
        vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT___GEN_391 
            = (1U & (IData)(vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT__pte_reg_G));
        vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT___GEN_392 
            = (1U & (IData)(vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT__pte_reg_A));
        vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT___GEN_393 
            = (1U & (IData)(vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT__pte_reg_D));
        vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT___GEN_394 
            = (3U & (IData)(vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT__pte_reg_RSW));
        vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT___GEN_395 
            = (0x00000fffffffffffULL & vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT__pte_reg_ppn);
    }
    if (vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__iTLB__DOT___T_191) {
        vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__iTLB__DOT___GEN_386 
            = (1U & (IData)(vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__iTLB__DOT___T_197));
        vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__iTLB__DOT___GEN_387 
            = (1U & (IData)((vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__iTLB__DOT___T_197 
                             >> 1U)));
        vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__iTLB__DOT___GEN_388 
            = (1U & (IData)((vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__iTLB__DOT___T_197 
                             >> 2U)));
        vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__iTLB__DOT___GEN_389 
            = (1U & (IData)((vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__iTLB__DOT___T_197 
                             >> 3U)));
        vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__iTLB__DOT___GEN_390 
            = (1U & (IData)((vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__iTLB__DOT___T_197 
                             >> 4U)));
        vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__iTLB__DOT___GEN_391 
            = (1U & (IData)((vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__iTLB__DOT___T_197 
                             >> 5U)));
        vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__iTLB__DOT___GEN_392 
            = (1U & (IData)((vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__iTLB__DOT___T_197 
                             >> 6U)));
        vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__iTLB__DOT___GEN_393 
            = (1U & (IData)((vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__iTLB__DOT___T_197 
                             >> 7U)));
        vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__iTLB__DOT___GEN_394 
            = (3U & (IData)((vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__iTLB__DOT___T_197 
                             >> 8U)));
        vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__iTLB__DOT___GEN_395 
            = (0x00000fffffffffffULL & (vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__iTLB__DOT___T_197 
                                        >> 0x0000000aU));
    } else {
        vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__iTLB__DOT___GEN_386 
            = (1U & (IData)(vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__iTLB__DOT__pte_reg_V));
        vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__iTLB__DOT___GEN_387 
            = (1U & (IData)(vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__iTLB__DOT__pte_reg_R));
        vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__iTLB__DOT___GEN_388 
            = (1U & (IData)(vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__iTLB__DOT__pte_reg_W));
        vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__iTLB__DOT___GEN_389 
            = (1U & (IData)(vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__iTLB__DOT__pte_reg_X));
        vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__iTLB__DOT___GEN_390 
            = (1U & (IData)(vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__iTLB__DOT__pte_reg_U));
        vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__iTLB__DOT___GEN_391 
            = (1U & (IData)(vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__iTLB__DOT__pte_reg_G));
        vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__iTLB__DOT___GEN_392 
            = (1U & (IData)(vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__iTLB__DOT__pte_reg_A));
        vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__iTLB__DOT___GEN_393 
            = (1U & (IData)(vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__iTLB__DOT__pte_reg_D));
        vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__iTLB__DOT___GEN_394 
            = (3U & (IData)(vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__iTLB__DOT__pte_reg_RSW));
        vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__iTLB__DOT___GEN_395 
            = (0x00000fffffffffffULL & vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__iTLB__DOT__pte_reg_ppn);
    }
    vlSelfRef.io_stall = (1U & ((IData)(vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__iTLB_io_stall) 
                                | ((~ ((IData)(vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__iTLB__DOT___io_tlb_ready_T) 
                                       | ((0U == (IData)(vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__iTLB__DOT__tlb_state))
                                           ? (IData)(vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__iTLB__DOT___io_tlb_ready_T)
                                           : (((1U 
                                                == (IData)(vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__iTLB__DOT__tlb_state))
                                                ? ((IData)(vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__iTLB__DOT___T_3) 
                                                   & ((IData)(vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__iTLB__DOT___T_186) 
                                                      & (IData)(vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__iTLB__DOT__matchList_0)))
                                                : (
                                                   (5U 
                                                    == (IData)(vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__iTLB__DOT__tlb_state))
                                                    ? 
                                                   ((((IData)(vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__iTLB__DOT___T_196) 
                                                      & (0U 
                                                         != 
                                                         (0x0003ffffU 
                                                          & (IData)(
                                                                    (vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__iTLB__DOT___T_197 
                                                                     >> 0x0000000aU))))) 
                                                     | (IData)(vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__iTLB__DOT___T_195)) 
                                                    & (IData)(vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__iTLB__DOT___T_191))
                                                    : 
                                                   ((4U 
                                                     == (IData)(vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__iTLB__DOT__tlb_state))
                                                     ? 
                                                    ((((IData)(vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__iTLB__DOT___T_196) 
                                                       & (0U 
                                                          != 
                                                          (0x000001ffU 
                                                           & (IData)(
                                                                     (vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__iTLB__DOT___T_197 
                                                                      >> 0x0000000aU))))) 
                                                      | (IData)(vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__iTLB__DOT___T_195)) 
                                                     & (IData)(vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__iTLB__DOT___T_191))
                                                     : 
                                                    ((3U 
                                                      == (IData)(vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__iTLB__DOT__tlb_state))
                                                      ? 
                                                     ((IData)(vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__iTLB__DOT___T_224) 
                                                      & (IData)(vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__iTLB__DOT___T_191))
                                                      : 
                                                     ((6U 
                                                       == (IData)(vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__iTLB__DOT__tlb_state))
                                                       ? 
                                                      (~ 
                                                       ((IData)(vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__iTLB__DOT__pte_reg_A) 
                                                        & (IData)(vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__iTLB__DOT___T_236)))
                                                       : 
                                                      ((7U 
                                                        == (IData)(vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__iTLB__DOT__tlb_state)) 
                                                       & (IData)(vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__iTLB__DOT___T_191))))))) 
                                              | (2U 
                                                 == (IData)(vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__iTLB__DOT__tlb_state)))))) 
                                   | ((~ (IData)(vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__tlb_tag)) 
                                      | (IData)(vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__src_unready)))));
    if (vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__iTLB_io_flush) {
        __Vtemp_12[0U] = (IData)(vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT___next_pc_T_8);
        __Vtemp_12[1U] = (IData)((vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT___next_pc_T_8 
                                  >> 0x00000020U));
        __Vtemp_12[2U] = 0U;
    } else if (((~ (IData)(vlSelfRef.nicore__DOT__datapath__DOT__started)) 
                & (IData)(vlSelfRef.io_stall))) {
        __Vtemp_12[0U] = vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__pc[0U];
        __Vtemp_12[1U] = vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__pc[1U];
        __Vtemp_12[2U] = vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__pc[2U];
    } else {
        __Vtemp_13[0U] = 4U;
        __Vtemp_13[1U] = 0U;
        __Vtemp_13[2U] = 0U;
        VL_ADD_W(3, __Vtemp_12, __Vtemp_13, vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__pc);
    }
    vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT___next_pc_T_12[0U] 
        = __Vtemp_12[0U];
    vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT___next_pc_T_12[1U] 
        = __Vtemp_12[1U];
    vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT___next_pc_T_12[2U] 
        = (1U & __Vtemp_12[2U]);
    vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT___T_1 
        = (1U & (~ (IData)(vlSelfRef.io_stall)));
    vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__dTLB_io_wen 
        = ((IData)(vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__is_amo)
            ? ((2U == (IData)(vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__em_pipe_reg_amo_op))
                ? (IData)(vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__sc_fire)
                : (IData)(vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__amo_second))
            : ((IData)(vlSelfRef.io_stall) ? (IData)(vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT___mem_wen_T_1)
                : ((IData)(vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__de_pipe_reg_enable) 
                   & (0U != (IData)(vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__de_pipe_reg_st_type)))));
    vlSelfRef.io_commit_valid = ((IData)(vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT___T_1) 
                                 & (IData)(vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__mw_pipe_reg_enable));
    vlSelfRef.__VdfgRegularize_hebeb780c_0_409 = ((IData)(vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT___T_1) 
                                                  & (0x0000100fU 
                                                     == vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__de_pipe_reg_inst));
    vlSelfRef.nicore__DOT__datapath__DOT__csr__DOT__hasInt 
        = ((IData)(vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__de_pipe_reg_enable) 
           & ((IData)(vlSelfRef.nicore__DOT__datapath__DOT__csr__DOT___hasExc_T_16) 
              & ((IData)(vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT___T_1) 
                 & ((((1U > (IData)(vlSelfRef.nicore__DOT__datapath__DOT__csr__DOT__mode)) 
                      | ((IData)(vlSelfRef.nicore__DOT__datapath__DOT__csr__DOT__mstatus_sie) 
                         & (1U == (IData)(vlSelfRef.nicore__DOT__datapath__DOT__csr__DOT__mode)))) 
                     & (0U != (vlSelfRef.nicore__DOT__datapath__DOT__csr__DOT__mideleg_data 
                               & vlSelfRef.nicore__DOT__datapath__DOT__csr__DOT__flagIntS))) 
                    | (IData)(vlSelfRef.nicore__DOT__datapath__DOT__csr__DOT__hasIntM)))));
    __VdfgRegularize_hebeb780c_0_219 = ((IData)(vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT___T_1) 
                                        & (IData)(vlSelfRef.nicore__DOT__datapath__DOT__csr__DOT___hasExc_T_16));
    vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT___io_fault_T_4 
        = (3U & (2U | (- (IData)((IData)(vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__dTLB_io_wen)))));
    vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT___T_255 
        = (1U & ((~ (IData)(vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT__pte_reg_A)) 
                 | ((~ (IData)(vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT__pte_reg_D)) 
                    & (IData)(vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__dTLB_io_wen))));
    vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT___T_249 
        = (((3U == (IData)(vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__dTLB_io_priv)) 
            | ((1U == (IData)(vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__dTLB_io_priv))
                ? ((~ (IData)(vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT__pte_reg_U)) 
                   | (IData)(vlSelfRef.nicore__DOT__datapath__DOT__csr__DOT__mstatus_sum))
                : ((IData)(vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT__pte_reg_U) 
                   | (0U != (IData)(vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__dTLB_io_priv))))) 
           & ((IData)(vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__dTLB_io_wen)
               ? (IData)(vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT__pte_reg_W)
               : (IData)(vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT__pte_reg_R)));
    vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT__permList_0 
        = ((IData)(vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT__matchList_0) 
           & (((IData)(vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__dTLB_io_wen)
                ? (IData)(vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT__tlbe_0_W)
                : (IData)(vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT__tlbe_0_R)) 
              & (((1U == (IData)(vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__dTLB_io_priv))
                   ? ((~ (IData)(vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT__tlbe_0_U)) 
                      | (IData)(vlSelfRef.nicore__DOT__datapath__DOT__csr__DOT__mstatus_sum))
                   : ((IData)(vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT__tlbe_0_U) 
                      | (0U != (IData)(vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__dTLB_io_priv)))) 
                 | (3U == (IData)(vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__dTLB_io_priv)))));
    vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__dTLB_io_tlb_request_rw 
        = ((0U != (IData)(vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT__tlb_state)) 
           & ((2U != (IData)(vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT__tlb_state)) 
              & ((1U != (IData)(vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT__tlb_state)) 
                 & ((6U != (IData)(vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT__tlb_state)) 
                    & ((IData)(vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__dTLB_io_wen) 
                       & ((7U == (IData)(vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT__tlb_state)) 
                          & ((5U != (IData)(vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT__tlb_state)) 
                             & ((3U != (IData)(vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT__tlb_state)) 
                                & (4U != (IData)(vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT__tlb_state))))))))));
    if (vlSelfRef.nicore__DOT__datapath__DOT__csr__DOT__hasInt) {
        vlSelfRef.nicore__DOT__datapath__DOT__csr__DOT__handIntS 
            = (1U & (~ (IData)(vlSelfRef.nicore__DOT__datapath__DOT__csr__DOT__hasIntM)));
        vlSelfRef.nicore__DOT__datapath__DOT__csr__DOT__cause 
            = ((1U & (IData)((vlSelfRef.nicore__DOT__datapath__DOT__csr__DOT__flagIntM 
                              >> 0x0000000bU))) ? 0x800000000000000bULL
                : ((1U & (IData)((vlSelfRef.nicore__DOT__datapath__DOT__csr__DOT__flagIntM 
                                  >> 3U))) ? 0x8000000000000003ULL
                    : ((1U & (IData)((vlSelfRef.nicore__DOT__datapath__DOT__csr__DOT__flagIntM 
                                      >> 7U))) ? 0x8000000000000007ULL
                        : ((1U & (IData)((vlSelfRef.nicore__DOT__datapath__DOT__csr__DOT__flagIntS 
                                          >> 9U))) ? 0x8000000000000009ULL
                            : ((1U & (IData)((vlSelfRef.nicore__DOT__datapath__DOT__csr__DOT__flagIntS 
                                              >> 1U)))
                                ? 0x8000000000000001ULL
                                : 0x8000000000000005ULL)))));
    } else {
        vlSelfRef.nicore__DOT__datapath__DOT__csr__DOT__handIntS = 0U;
        vlSelfRef.nicore__DOT__datapath__DOT__csr__DOT__cause 
            = vlSelfRef.nicore__DOT__datapath__DOT__csr__DOT__excCause;
    }
    vlSelfRef.nicore__DOT__datapath__DOT__csr__DOT__hasExc 
        = ((IData)(vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__em_pipe_reg_enable) 
           & (((IData)(vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__em_pipe_reg_csr_is_illegal) 
               | ((IData)(vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__em_pipe_reg_csr_inst_misalign) 
                  | ((IData)(vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__em_pipe_reg_csr_store_misalign) 
                     | ((0U != (IData)(vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__dTLB_fault_reg)) 
                        | ((IData)(vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__em_pipe_reg_csr_load_misalign) 
                           | ((0x00100073U == vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__em_pipe_reg_inst) 
                              | ((0U != (IData)(vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__em_pipe_reg_iTLB_fault)) 
                                 | (0x00000073U == vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__em_pipe_reg_inst)))))))) 
              & (IData)(__VdfgRegularize_hebeb780c_0_219)));
    vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT___T_186 
        = (1U & (~ (IData)(vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT__permList_0)));
    vlSelfRef.nicore__DOT__datapath__DOT__csr__DOT__hasExcS 
        = ((IData)((vlSelfRef.nicore__DOT__datapath__DOT__csr__DOT__medeleg_data 
                    >> (0x0000000fU & (IData)(vlSelfRef.nicore__DOT__datapath__DOT__csr__DOT__excCause)))) 
           & (IData)(vlSelfRef.nicore__DOT__datapath__DOT__csr__DOT__hasExc));
    vlSelfRef.nicore__DOT__datapath__DOT__csr__DOT___T_354 
        = (1U & (~ (IData)(vlSelfRef.nicore__DOT__datapath__DOT__csr__DOT__hasExc)));
    vlSelfRef.nicore__DOT__datapath__DOT__csr__DOT___interrupt_return_addr_T_8 
        = ((IData)(vlSelfRef.nicore__DOT__datapath__DOT__csr__DOT__hasExc) 
           | (IData)(vlSelfRef.__VdfgRegularize_hebeb780c_0_320));
    if (vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__iTLB_io_valid) {
        vlSelfRef.nicore__DOT__datapath__DOT__memory_stage_io_dcache_cpu_request_rw 
            = vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__dTLB_io_tlb_request_rw;
        vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__clint_io_wen 
            = vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__dTLB_io_tlb_request_rw;
    } else {
        vlSelfRef.nicore__DOT__datapath__DOT__memory_stage_io_dcache_cpu_request_rw 
            = vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__dTLB_io_wen;
        vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__clint_io_wen 
            = ((IData)(vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__em_pipe_reg_is_clint) 
               & (IData)(vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT___mem_wen_T_1));
    }
    vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__clint_io_timer_clear 
        = ((IData)(vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__clint_io_wen) 
           & (0x0000000002004000ULL == vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__clint__DOT__addr_reg));
    vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__clint_io_r_data 
        = (((0x0000000002000000ULL == vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__clint__DOT__addr_reg)
             ? vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__clint__DOT__msip
             : ((0x0000000002004000ULL == vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__clint__DOT__addr_reg)
                 ? vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__clint__DOT__mtimecmp
                 : (vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__clint__DOT__mtime 
                    & (- (QData)((IData)((0x000000000200bff8ULL 
                                          == vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__clint__DOT__addr_reg))))))) 
           & (- (QData)((IData)((1U & (~ (IData)(vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__clint_io_wen)))))));
    vlSelfRef.nicore__DOT__datapath__DOT__csr__DOT__handExcS 
        = ((~ ((IData)(vlSelfRef.nicore__DOT__datapath__DOT__csr__DOT__mode) 
               >> 1U)) & (IData)(vlSelfRef.nicore__DOT__datapath__DOT__csr__DOT__hasExcS));
    __VdfgRegularize_hebeb780c_0_324 = ((IData)(vlSelfRef.nicore__DOT__datapath__DOT__csr__DOT___T_354) 
                                        & ((IData)(vlSelfRef.nicore__DOT__datapath__DOT__csr__DOT___T_356) 
                                           & (IData)(vlSelfRef.nicore__DOT__datapath__DOT__csr__DOT___T_358)));
    __VdfgRegularize_hebeb780c_0_321 = ((IData)(vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__em_pipe_reg_enable) 
                                        & (IData)(vlSelfRef.nicore__DOT__datapath__DOT__csr__DOT___interrupt_return_addr_T_8));
    vlSelfRef.nicore__DOT__datapath__DOT__csr__DOT___mip_mtip_T_1 
        = (1U & (~ (IData)(vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__clint_io_timer_clear)));
    vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__load_data 
        = ((IData)(vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__em_pipe_reg_is_clint)
            ? vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__clint_io_r_data
            : (((2U == (IData)(vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__em_pipe_reg_amo_op)) 
                & (IData)(vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__is_amo))
                ? (QData)((IData)((1U & (~ (IData)(vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__sc_success)))))
                : ((IData)(vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT___T_4)
                    ? ((1U == (IData)(vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__em_pipe_reg_amo_op))
                        ? vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT___load_data_hazard_T_3
                        : vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__amo_old)
                    : vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT___load_data_hazard_T_3)));
    vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__load_data_hazard 
        = (((IData)(vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__em_pipe_reg_is_clint) 
            & (IData)(vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__em_pipe_reg_enable))
            ? vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__clint_io_r_data
            : vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT___load_data_hazard_T_3);
    vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage_io_csr_trapVec 
        = (((IData)(vlSelfRef.nicore__DOT__datapath__DOT__csr__DOT__hasInt) 
            | (IData)(vlSelfRef.nicore__DOT__datapath__DOT__csr__DOT__hasExc))
            ? (((IData)(vlSelfRef.nicore__DOT__datapath__DOT__csr__DOT__handExcS) 
                | (IData)(vlSelfRef.nicore__DOT__datapath__DOT__csr__DOT__handIntS))
                ? (((IData)(vlSelfRef.nicore__DOT__datapath__DOT__csr__DOT__stvec_mode) 
                    & (IData)(vlSelfRef.nicore__DOT__datapath__DOT__csr__DOT__hasInt))
                    ? ((vlSelfRef.nicore__DOT__datapath__DOT__csr__DOT__cause 
                        + vlSelfRef.nicore__DOT__datapath__DOT__csr__DOT__stvec_base) 
                       << 2U) : (vlSelfRef.nicore__DOT__datapath__DOT__csr__DOT__stvec_base 
                                 << 2U)) : (((IData)(vlSelfRef.nicore__DOT__datapath__DOT__csr__DOT__mtvec_mode) 
                                             & (IData)(vlSelfRef.nicore__DOT__datapath__DOT__csr__DOT__hasInt))
                                             ? ((vlSelfRef.nicore__DOT__datapath__DOT__csr__DOT__cause 
                                                 + vlSelfRef.nicore__DOT__datapath__DOT__csr__DOT__mtvec_base) 
                                                << 2U)
                                             : (vlSelfRef.nicore__DOT__datapath__DOT__csr__DOT__mtvec_base 
                                                << 2U)))
            : ((0x30200073U == vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__em_pipe_reg_inst)
                ? vlSelfRef.nicore__DOT__datapath__DOT__csr__DOT__mepc_data
                : vlSelfRef.nicore__DOT__datapath__DOT__csr__DOT__sepc_data));
    __VdfgRegularize_hebeb780c_0_129 = (0x0000000fU 
                                        & (((((IData)(vlSelfRef.nicore__DOT__datapath__DOT__csr__DOT__hasInt) 
                                              & (IData)(__VdfgRegularize_hebeb780c_0_324))
                                              ? 7U : 
                                             ((- (IData)(
                                                         ((IData)(vlSelfRef.nicore__DOT__datapath__DOT__csr__DOT___interrupt_return_addr_T_8) 
                                                          & (IData)(vlSelfRef.nicore__DOT__datapath__DOT__csr__DOT__hasInt)))) 
                                              | ((- (IData)((IData)(vlSelfRef.nicore__DOT__datapath__DOT__csr__DOT__hasExc))) 
                                                 | (7U 
                                                    & (- (IData)((IData)(vlSelfRef.__VdfgRegularize_hebeb780c_0_320))))))) 
                                            & (- (IData)((IData)(__VdfgRegularize_hebeb780c_0_219)))) 
                                           | ((- (IData)((IData)(vlSelfRef.nicore__DOT__datapath__DOT___csr_atomic_flush_T_1))) 
                                              | (7U 
                                                 & ((- (IData)((IData)(vlSelfRef.nicore__DOT__datapath__DOT___csr_atomic_flush_T_3))) 
                                                    | (3U 
                                                       & ((- (IData)((IData)(vlSelfRef.nicore__DOT__datapath__DOT___csr_atomic_flush_T_5))) 
                                                          | (IData)(vlSelfRef.nicore__DOT__datapath__DOT___csr_atomic_flush_T_7))))))));
    vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage_io_csr_trap 
        = (((IData)(__VdfgRegularize_hebeb780c_0_321) 
            | (IData)(vlSelfRef.nicore__DOT__datapath__DOT__csr__DOT__hasInt)) 
           & (IData)(__VdfgRegularize_hebeb780c_0_219));
    vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__load_data_ext_hazard 
        = ((((1U == (IData)(vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__em_pipe_reg_ld_type))
              ? (((QData)((IData)((- (IData)((1U & (IData)(
                                                           (vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__load_data_hazard 
                                                            >> 0x0000001fU))))))) 
                  << 0x00000018U) | (QData)((IData)(
                                                    (0x00ffffffU 
                                                     & (IData)(
                                                               (vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__load_data_hazard 
                                                                >> 8U))))))
              : ((6U == (IData)(vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__em_pipe_reg_ld_type))
                  ? (QData)((IData)((0x00ffffffU & (IData)(
                                                           (vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__load_data_hazard 
                                                            >> 8U)))))
                  : ((2U == (IData)(vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__em_pipe_reg_ld_type))
                      ? ((0x00ffffffffffff00ULL & (
                                                   (- (QData)((IData)(
                                                                      (1U 
                                                                       & (IData)(
                                                                                (vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__load_data_hazard 
                                                                                >> 0x0000000fU)))))) 
                                                   << 8U)) 
                         | (QData)((IData)((0x000000ffU 
                                            & (IData)(
                                                      (vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__load_data_hazard 
                                                       >> 8U))))))
                      : ((4U == (IData)(vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__em_pipe_reg_ld_type))
                          ? (QData)((IData)((0x000000ffU 
                                             & (IData)(
                                                       (vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__load_data_hazard 
                                                        >> 8U)))))
                          : ((3U == (IData)(vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__em_pipe_reg_ld_type))
                              ? (- (QData)((IData)(
                                                   (1U 
                                                    & (IData)(
                                                              (vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__load_data_hazard 
                                                               >> 7U))))))
                              : ((- (QData)((IData)(
                                                    (5U 
                                                     != (IData)(vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__em_pipe_reg_ld_type))))) 
                                 & (vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__load_data_hazard 
                                    >> 8U))))))) << 8U) 
           | (QData)((IData)((0x000000ffU & (IData)(vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__load_data_hazard)))));
    vlSelfRef.nicore__DOT__datapath__DOT__memory_stage_io_flush_mw 
        = (1U & ((IData)(__VdfgRegularize_hebeb780c_0_129) 
                 >> 3U));
    vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage_io_flush_em 
        = (1U & (((IData)(__VdfgRegularize_hebeb780c_0_129) 
                  >> 2U) | (IData)(vlSelfRef.__VdfgRegularize_hebeb780c_0_411)));
    vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT___GEN_17 
        = (((0U == (IData)(vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__em_pipe_reg_wb_sel))
             ? vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__em_pipe_reg_alu_out
             : ((2U == (IData)(vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__em_pipe_reg_wb_sel))
                 ? vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT___next_pc_T_8
                 : ((3U == (IData)(vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__em_pipe_reg_wb_sel))
                     ? vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__em_pipe_reg_csr_read_data
                     : ((IData)(vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__data_cache_tag)
                         ? vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__load_data_ext_hazard
                         : vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__de_pipe_reg_rs2)))) 
           & (- (QData)((IData)(vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT___src_unready_T_1))));
    vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT___GEN_13 
        = (((0U == (IData)(vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__em_pipe_reg_wb_sel))
             ? vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__em_pipe_reg_alu_out
             : ((2U == (IData)(vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__em_pipe_reg_wb_sel))
                 ? vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT___next_pc_T_8
                 : ((3U == (IData)(vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__em_pipe_reg_wb_sel))
                     ? vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__em_pipe_reg_csr_read_data
                     : ((IData)(vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__data_cache_tag)
                         ? vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__load_data_ext_hazard
                         : vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__de_pipe_reg_rs1)))) 
           & (- (QData)((IData)(vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT___src_unready_T))));
    vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__brCond_io_rs2 
        = (((IData)(vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT___T_12) 
            & ((IData)(vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT___src_unready_T_1) 
               & (0ULL != vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__de_pipe_reg_src2_addr)))
            ? vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT___GEN_17
            : vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT___GEN_19);
    vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__brCond_io_rs1 
        = (((IData)(vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT___T_12) 
            & ((IData)(vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT___src_unready_T) 
               & (0ULL != vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__de_pipe_reg_src1_addr)))
            ? vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT___GEN_13
            : vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT___GEN_15);
    vlSelfRef.__VdfgRegularize_hebeb780c_0_402 = ((IData)(
                                                          (vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__brCond_io_rs2 
                                                           >> 0x00000020U)) 
                                                  & (- (IData)(
                                                               (0U 
                                                                == (IData)(vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__de_pipe_reg_wd_type)))));
    vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__B_data 
        = ((IData)(vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__de_pipe_reg_B_sel)
            ? vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__brCond_io_rs2
            : vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__de_pipe_reg_imm);
    __VdfgRegularize_hebeb780c_0_403 = ((- (IData)(
                                                   (0U 
                                                    == (IData)(vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__de_pipe_reg_wd_type)))) 
                                        & (IData)((vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__brCond_io_rs1 
                                                   >> 0x00000020U)));
    vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__brCond__DOT__eq 
        = (vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__brCond_io_rs1 
           == vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__brCond_io_rs2);
    vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__brCond__DOT__lt 
        = VL_LTS_IQQ(64, vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__brCond_io_rs1, vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__brCond_io_rs2);
    vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__brCond__DOT__ltu 
        = (vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__brCond_io_rs1 
           < vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__brCond_io_rs2);
    vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__A_data 
        = ((IData)(vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__de_pipe_reg_A_sel)
            ? vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__brCond_io_rs1
            : vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__de_pipe_reg_pc);
    vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__multiplier__DOT__src2 
        = (((QData)((IData)(vlSelfRef.__VdfgRegularize_hebeb780c_0_402)) 
            << 0x00000020U) | (QData)((IData)(vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__brCond_io_rs2)));
    vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__alu_io_B 
        = (((QData)((IData)(((IData)((vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__B_data 
                                      >> 0x00000020U)) 
                             & (- (IData)((1U != (IData)(vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__de_pipe_reg_wd_type))))))) 
            << 0x00000020U) | (QData)((IData)(vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__B_data)));
    vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__alu__DOT__shamt 
        = ((((1U != (IData)(vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__de_pipe_reg_wd_type)) 
             & (IData)((vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__B_data 
                        >> 5U))) << 5U) | (0x0000001fU 
                                           & (IData)(vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__B_data)));
    vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__multiplier__DOT__src1_sign 
        = (1U & ((0U != (IData)(vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__de_pipe_reg_wd_type))
                  ? (IData)((vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__brCond_io_rs1 
                             >> 0x0000001fU)) : (__VdfgRegularize_hebeb780c_0_403 
                                                 >> 0x0000001fU)));
    vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__multiplier__DOT__src1 
        = (((QData)((IData)(__VdfgRegularize_hebeb780c_0_403)) 
            << 0x00000020U) | (QData)((IData)(vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__brCond_io_rs1)));
    vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage_io_brCond_taken 
        = ((IData)(vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT___T_1) 
           & ((IData)(vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__de_pipe_reg_enable) 
              & (((~ (IData)(vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__brCond__DOT__ltu)) 
                  & (4U == (IData)(vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__de_pipe_reg_br_type))) 
                 | (((IData)(vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__brCond__DOT__ltu) 
                     & (1U == (IData)(vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__de_pipe_reg_br_type))) 
                    | (((~ (IData)(vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__brCond__DOT__lt)) 
                        & (5U == (IData)(vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__de_pipe_reg_br_type))) 
                       | (((IData)(vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__brCond__DOT__lt) 
                           & (2U == (IData)(vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__de_pipe_reg_br_type))) 
                          | (((IData)(vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__brCond__DOT__eq) 
                              & (3U == (IData)(vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__de_pipe_reg_br_type))) 
                             | ((~ (IData)(vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__brCond__DOT__eq)) 
                                & (6U == (IData)(vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__de_pipe_reg_br_type))))))))));
    vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__alu_io_A 
        = (((QData)((IData)(((- (IData)((1U != (IData)(vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__de_pipe_reg_wd_type)))) 
                             & (IData)((vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__A_data 
                                        >> 0x00000020U))))) 
            << 0x00000020U) | (QData)((IData)(vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__A_data)));
    vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__multiplier__DOT___multiplicand_reg_T_6 
        = (VL_GTS_IQQ(64, 0ULL, vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__multiplier__DOT__src1)
            ? (- vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__multiplier__DOT__src1)
            : vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__multiplier__DOT__src1);
    vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT___next_pc_T_4 
        = ((IData)(vlSelfRef.__VdfgRegularize_hebeb780c_0_304) 
           | (IData)(vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage_io_brCond_taken));
    vlSelfRef.nicore__DOT__datapath__DOT___flush_fd_T_1 
        = (((IData)(vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT___T_1) 
            & (IData)(vlSelfRef.__VdfgRegularize_hebeb780c_0_304)) 
           | (IData)(vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage_io_brCond_taken));
    vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__alu__DOT___GEN_1[0U] 
        = (IData)(vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__alu_io_A);
    vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__alu__DOT___GEN_1[1U] 
        = (IData)((vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__alu_io_A 
                   >> 0x00000020U));
    vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__alu__DOT___GEN_1[2U] = 0U;
    vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__alu__DOT___GEN_1[3U] = 0U;
    vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage_io_flush_fd 
        = (1U & ((IData)(vlSelfRef.nicore__DOT__datapath__DOT___flush_fd_T_1) 
                 | ((IData)(vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__icache_flush_tag) 
                    | ((IData)(vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__dcache_flush_tag) 
                       | ((IData)(__VdfgRegularize_hebeb780c_0_129) 
                          | (IData)(vlSelfRef.nicore__DOT__datapath__DOT__sfence_em))))));
    vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__multiplier_io_flush 
        = (1U & ((IData)(vlSelfRef.nicore__DOT__datapath__DOT___flush_fd_T_1) 
                 | ((IData)(vlSelfRef.__VdfgRegularize_hebeb780c_0_411) 
                    | (((IData)(__VdfgRegularize_hebeb780c_0_129) 
                        >> 1U) | (IData)(vlSelfRef.nicore__DOT__datapath__DOT__sfence_em)))));
    if ((0x0aU == (0x0000000fU & (IData)(vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__de_pipe_reg_alu_op)))) {
        __Vtemp_15[0U] = vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__alu__DOT___GEN_1[0U];
        __Vtemp_15[1U] = vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__alu__DOT___GEN_1[1U];
        __Vtemp_15[2U] = vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__alu__DOT___GEN_1[2U];
        __Vtemp_15[3U] = vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__alu__DOT___GEN_1[3U];
    } else if ((4U == (0x0000000fU & (IData)(vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__de_pipe_reg_alu_op)))) {
        __Vtemp_15[0U] = (IData)((vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__alu_io_B 
                                  ^ vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__alu_io_A));
        __Vtemp_15[1U] = (IData)(((vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__alu_io_B 
                                   ^ vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__alu_io_A) 
                                  >> 0x00000020U));
        __Vtemp_15[2U] = 0U;
        __Vtemp_15[3U] = 0U;
    } else if ((3U == (0x0000000fU & (IData)(vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__de_pipe_reg_alu_op)))) {
        __Vtemp_15[0U] = (IData)((vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__alu_io_B 
                                  | vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__alu_io_A));
        __Vtemp_15[1U] = (IData)(((vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__alu_io_B 
                                   | vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__alu_io_A) 
                                  >> 0x00000020U));
        __Vtemp_15[2U] = 0U;
        __Vtemp_15[3U] = 0U;
    } else if ((2U == (0x0000000fU & (IData)(vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__de_pipe_reg_alu_op)))) {
        __Vtemp_15[0U] = (IData)((vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__alu_io_B 
                                  & vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__alu_io_A));
        __Vtemp_15[1U] = (IData)(((vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__alu_io_B 
                                   & vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__alu_io_A) 
                                  >> 0x00000020U));
        __Vtemp_15[2U] = 0U;
        __Vtemp_15[3U] = 0U;
    } else if ((7U == (0x0000000fU & (IData)(vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__de_pipe_reg_alu_op)))) {
        __Vtemp_15[0U] = (vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__alu_io_A 
                          < vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__alu_io_B);
        __Vtemp_15[1U] = 0U;
        __Vtemp_15[2U] = 0U;
        __Vtemp_15[3U] = 0U;
    } else if ((5U == (0x0000000fU & (IData)(vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__de_pipe_reg_alu_op)))) {
        __Vtemp_15[0U] = VL_LTS_IQQ(64, vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__alu_io_A, vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__alu_io_B);
        __Vtemp_15[1U] = 0U;
        __Vtemp_15[2U] = 0U;
        __Vtemp_15[3U] = 0U;
    } else if ((6U == (0x0000000fU & (IData)(vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__de_pipe_reg_alu_op)))) {
        VL_SHIFTL_WWI(127,127,6, __Vtemp_15, vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__alu__DOT___GEN_1, (IData)(vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__alu__DOT__shamt));
    } else {
        __Vtemp_15[0U] = (IData)(((8U == (0x0000000fU 
                                          & (IData)(vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__de_pipe_reg_alu_op)))
                                   ? (vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__alu_io_A 
                                      >> (IData)(vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__alu__DOT__shamt))
                                   : ((9U == (0x0000000fU 
                                              & (IData)(vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__de_pipe_reg_alu_op)))
                                       ? VL_SHIFTRS_QQI(64,64,6, 
                                                        (((QData)((IData)(
                                                                          ((1U 
                                                                            == (IData)(vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__de_pipe_reg_wd_type))
                                                                            ? 
                                                                           (- (IData)(
                                                                                (1U 
                                                                                & (IData)(
                                                                                (vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__A_data 
                                                                                >> 0x0000001fU)))))
                                                                            : (IData)(
                                                                                (vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__A_data 
                                                                                >> 0x00000020U))))) 
                                                          << 0x00000020U) 
                                                         | (QData)((IData)(vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__A_data))), (IData)(vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__alu__DOT__shamt))
                                       : ((1U == (0x0000000fU 
                                                  & (IData)(vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__de_pipe_reg_alu_op)))
                                           ? (vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__alu_io_A 
                                              - vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__alu_io_B)
                                           : ((0U == 
                                               (0x0000000fU 
                                                & (IData)(vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__de_pipe_reg_alu_op)))
                                               ? (vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__alu_io_B 
                                                  + vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__alu_io_A)
                                               : vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__alu_io_B)))));
        __Vtemp_15[1U] = (IData)((((8U == (0x0000000fU 
                                           & (IData)(vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__de_pipe_reg_alu_op)))
                                    ? (vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__alu_io_A 
                                       >> (IData)(vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__alu__DOT__shamt))
                                    : ((9U == (0x0000000fU 
                                               & (IData)(vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__de_pipe_reg_alu_op)))
                                        ? VL_SHIFTRS_QQI(64,64,6, 
                                                         (((QData)((IData)(
                                                                           ((1U 
                                                                             == (IData)(vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__de_pipe_reg_wd_type))
                                                                             ? 
                                                                            (- (IData)(
                                                                                (1U 
                                                                                & (IData)(
                                                                                (vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__A_data 
                                                                                >> 0x0000001fU)))))
                                                                             : (IData)(
                                                                                (vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__A_data 
                                                                                >> 0x00000020U))))) 
                                                           << 0x00000020U) 
                                                          | (QData)((IData)(vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__A_data))), (IData)(vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__alu__DOT__shamt))
                                        : ((1U == (0x0000000fU 
                                                   & (IData)(vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__de_pipe_reg_alu_op)))
                                            ? (vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__alu_io_A 
                                               - vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__alu_io_B)
                                            : ((0U 
                                                == 
                                                (0x0000000fU 
                                                 & (IData)(vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__de_pipe_reg_alu_op)))
                                                ? (vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__alu_io_B 
                                                   + vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__alu_io_A)
                                                : vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__alu_io_B)))) 
                                  >> 0x00000020U));
        __Vtemp_15[2U] = 0U;
        __Vtemp_15[3U] = 0U;
    }
    vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__alu__DOT___out_T_41[0U] 
        = __Vtemp_15[0U];
    vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__alu__DOT___out_T_41[1U] 
        = __Vtemp_15[1U];
    vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__alu__DOT___out_T_41[2U] 
        = __Vtemp_15[2U];
    vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__alu__DOT___out_T_41[3U] 
        = (0x7fffffffU & __Vtemp_15[3U]);
    vlSelfRef.__VdfgRegularize_hebeb780c_0_330 = ((IData)(vlSelfRef.io_stall) 
                                                  | (IData)(vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage_io_flush_fd));
    vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__divider__DOT___T_4 
        = ((~ (IData)(vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__multiplier_io_flush)) 
           & (IData)(vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__divider_io_div_valid));
    vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT___GEN_5 
        = ((~ (IData)(vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__multiplier_io_flush)) 
           & ((IData)(vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__mul_result_enable) 
              | (IData)(vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__multiplier_io_out_valid)));
    vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT___GEN_11 
        = ((~ (IData)(vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__multiplier_io_flush)) 
           & ((IData)(vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__div_result_enable) 
              | (IData)(vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__divider_io_out_valid)));
    vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__alu_io_out 
        = (((QData)((IData)(((1U == (IData)(vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__de_pipe_reg_wd_type))
                              ? (- (IData)((vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__alu__DOT___out_T_41[0U] 
                                            >> 0x0000001fU)))
                              : vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__alu__DOT___out_T_41[1U]))) 
            << 0x00000020U) | (QData)((IData)(vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__alu__DOT___out_T_41[0U])));
    if (vlSelfRef.io_stall) {
        vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__st_mask 
            = (0x000000ffU & ((1U == (IData)(vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__em_pipe_reg_st_type))
                               ? 0x0fU : ((2U == (IData)(vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__em_pipe_reg_st_type))
                                           ? 3U : (1U 
                                                   | (- (IData)(
                                                                (3U 
                                                                 != (IData)(vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__em_pipe_reg_st_type))))))));
        vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__dTLB_io_va 
            = vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__em_pipe_reg_alu_out;
    } else {
        vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__st_mask 
            = (0x000000ffU & ((1U == (IData)(vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__de_pipe_reg_st_type))
                               ? 0x0fU : ((2U == (IData)(vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__de_pipe_reg_st_type))
                                           ? 3U : (1U 
                                                   | (- (IData)(
                                                                (3U 
                                                                 != (IData)(vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__de_pipe_reg_st_type))))))));
        vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__dTLB_io_va 
            = vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__alu_io_out;
    }
    vlSelfRef.nicore__DOT__datapath__DOT__csr__DOT__excValue 
        = ((0x000000000000000cULL == vlSelfRef.nicore__DOT__datapath__DOT__csr__DOT__excCause)
            ? vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__em_pipe_reg_pc
            : (((6ULL == vlSelfRef.nicore__DOT__datapath__DOT__csr__DOT__excCause) 
                | ((4ULL == vlSelfRef.nicore__DOT__datapath__DOT__csr__DOT__excCause) 
                   | ((0x000000000000000dULL == vlSelfRef.nicore__DOT__datapath__DOT__csr__DOT__excCause) 
                      | (0x000000000000000fULL == vlSelfRef.nicore__DOT__datapath__DOT__csr__DOT__excCause))))
                ? vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__alu_io_out
                : (((3ULL == vlSelfRef.nicore__DOT__datapath__DOT__csr__DOT__excCause) 
                    | (0ULL == vlSelfRef.nicore__DOT__datapath__DOT__csr__DOT__excCause))
                    ? vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__em_pipe_reg_pc
                    : (QData)((IData)((vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__em_pipe_reg_inst 
                                       & (- (IData)(
                                                    (2ULL 
                                                     == vlSelfRef.nicore__DOT__datapath__DOT__csr__DOT__excCause)))))))));
    vlSelfRef.nicore__DOT__datapath__DOT__csr__DOT___sepc_data_T_3 
        = ((((IData)(vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__em_pipe_reg_enable) 
             & ((IData)(vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__em_pipe_reg_jump_taken) 
                & (IData)(__VdfgRegularize_hebeb780c_0_324)))
             ? (vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__alu_io_out 
                >> 2U) : ((IData)(__VdfgRegularize_hebeb780c_0_321)
                           ? (vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__em_pipe_reg_pc 
                              >> 2U) : (vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__de_pipe_reg_pc 
                                        >> 2U))) << 2U);
    vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT___next_pc_T_6[0U] 
        = ((IData)((vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__alu_io_out 
                    >> 1U)) << 1U);
    vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT___next_pc_T_6[1U] 
        = (((IData)((vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__alu_io_out 
                     >> 1U)) >> 0x0000001fU) | ((IData)(
                                                        ((vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__alu_io_out 
                                                          >> 1U) 
                                                         >> 0x00000020U)) 
                                                << 1U));
    vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT___next_pc_T_6[2U] 
        = ((IData)(((vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__alu_io_out 
                     >> 1U) >> 0x00000020U)) >> 0x0000001fU);
    vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__is_clint 
        = ((IData)(vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__de_pipe_reg_enable) 
           & ((IData)(vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT___is_clint_T_6) 
              & ((0x0000000002000000ULL <= vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__alu_io_out) 
                 & (0x000000000200ffffULL >= vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__alu_io_out))));
    vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__ls_stall 
        = ((IData)(vlSelfRef.io_stall) ? ((IData)(vlSelfRef.__VdfgRegularize_hebeb780c_0_300) 
                                          & ((~ (IData)(vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__em_pipe_reg_is_clint)) 
                                             & (IData)(vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__em_pipe_reg_enable)))
            : ((IData)(vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT___is_clint_T_6) 
               & ((~ ((IData)(vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__is_clint) 
                      | (IData)(vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage_io_flush_em))) 
                  & (IData)(vlSelfRef.nicore__DOT__datapath__DOT__decode_stage__DOT__de_pipe_reg_enable))));
    if (vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage_io_csr_trap) {
        vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__next_pc[0U] 
            = (IData)(vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage_io_csr_trapVec);
        vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__next_pc[1U] 
            = (IData)((vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage_io_csr_trapVec 
                       >> 0x00000020U));
        vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__next_pc[2U] = 0U;
    } else if (vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT___next_pc_T_4) {
        vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__next_pc[0U] 
            = vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT___next_pc_T_6[0U];
        vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__next_pc[1U] 
            = vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT___next_pc_T_6[1U];
        vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__next_pc[2U] 
            = vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT___next_pc_T_6[2U];
    } else if (vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage_io_csr_atomic) {
        vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__next_pc[0U] 
            = (IData)(vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage_io_csr_next_fetch);
        vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__next_pc[1U] 
            = (IData)((vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage_io_csr_next_fetch 
                       >> 0x00000020U));
        vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__next_pc[2U] = 0U;
    } else {
        vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__next_pc[0U] 
            = vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT___next_pc_T_12[0U];
        vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__next_pc[1U] 
            = vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT___next_pc_T_12[1U];
        vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__next_pc[2U] 
            = vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT___next_pc_T_12[2U];
    }
    vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__clint_io_addr 
        = ((IData)(vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__iTLB_io_valid)
            ? (QData)((IData)(((- (IData)((0U != (IData)(vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT__tlb_state)))) 
                               & ((- (IData)((2U != (IData)(vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT__tlb_state)))) 
                                  & (((5U == (IData)(vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT__tlb_state))
                                       ? ((IData)(vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__iTLB__DOT__ppn_base) 
                                          + (0x00000ff8U 
                                             & ((IData)(
                                                        (vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT__va_reg 
                                                         >> 0x0000001eU)) 
                                                << 3U)))
                                       : ((4U == (IData)(vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT__tlb_state))
                                           ? ((IData)(vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT___io_tlb_request_addr_T_4) 
                                              + (0x00000ff8U 
                                                 & ((IData)(
                                                            (vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT__va_reg 
                                                             >> 0x00000015U)) 
                                                    << 3U)))
                                           : ((3U == (IData)(vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT__tlb_state))
                                               ? ((IData)(vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT___io_tlb_request_addr_T_4) 
                                                  + 
                                                  (0x00000ff8U 
                                                   & ((IData)(
                                                              (vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT__va_reg 
                                                               >> 0x0000000cU)) 
                                                      << 3U)))
                                               : ((- (IData)(
                                                             (6U 
                                                              != (IData)(vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT__tlb_state)))) 
                                                  & ((- (IData)(
                                                                (7U 
                                                                 == (IData)(vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT__tlb_state)))) 
                                                     & ((2U 
                                                         == (IData)(vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT__page_size_reg))
                                                         ? 
                                                        (((IData)(
                                                                  (vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT__pte_reg_ppn 
                                                                   >> 0x00000012U)) 
                                                          << 0x0000001eU) 
                                                         | (0x3fffffffU 
                                                            & (IData)(vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT__va_reg)))
                                                         : 
                                                        ((1U 
                                                          == (IData)(vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT__page_size_reg))
                                                          ? 
                                                         (((IData)(
                                                                   (vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT__pte_reg_ppn 
                                                                    >> 9U)) 
                                                           << 0x00000015U) 
                                                          | (0x001fffffU 
                                                             & (IData)(vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT__va_reg)))
                                                          : 
                                                         ((((IData)(vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT__pte_reg_ppn) 
                                                            << 0x0000000cU) 
                                                           | (0x00000fffU 
                                                              & (IData)(vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT__va_reg))) 
                                                          & (IData)(
                                                                    (0x00ffffffffffffffULL 
                                                                     & (- (QData)((IData)(
                                                                                (0U 
                                                                                == (IData)(vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT__page_size_reg))))))))))))))) 
                                     & (- (IData)((1U 
                                                   != (IData)(vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT__tlb_state)))))))))
            : vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__dTLB_io_va);
    if (vlSelfRef.nicore__DOT__dcache__DOT__write_addr_reg) {
        vlSelfRef.nicore__DOT__dcache__DOT___GEN_127 
            = (0x0000003fU & (IData)((vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__clint_io_addr 
                                      >> 4U)));
        vlSelfRef.nicore__DOT__dcache__DOT___GEN_129 
            = (0x0000003fU & (IData)((vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__clint_io_addr 
                                      >> 4U)));
        vlSelfRef.nicore__DOT__dcache__DOT___GEN_131 
            = (0x0000003fU & (IData)((vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__clint_io_addr 
                                      >> 4U)));
        vlSelfRef.nicore__DOT__dcache__DOT___GEN_133 
            = (0x0000003fU & (IData)((vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__clint_io_addr 
                                      >> 4U)));
    } else {
        vlSelfRef.nicore__DOT__dcache__DOT___GEN_127 
            = (0x0000003fU & ((0U == (IData)(vlSelfRef.nicore__DOT__dcache__DOT__index_in_line))
                               ? (IData)(vlSelfRef.nicore__DOT__dcache__DOT__flush_loop)
                               : (IData)((vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__clint_io_addr 
                                          >> 4U))));
        vlSelfRef.nicore__DOT__dcache__DOT___GEN_129 
            = (0x0000003fU & ((1U == (IData)(vlSelfRef.nicore__DOT__dcache__DOT__index_in_line))
                               ? (IData)(vlSelfRef.nicore__DOT__dcache__DOT__flush_loop)
                               : (IData)((vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__clint_io_addr 
                                          >> 4U))));
        vlSelfRef.nicore__DOT__dcache__DOT___GEN_131 
            = (0x0000003fU & ((2U == (IData)(vlSelfRef.nicore__DOT__dcache__DOT__index_in_line))
                               ? (IData)(vlSelfRef.nicore__DOT__dcache__DOT__flush_loop)
                               : (IData)((vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__clint_io_addr 
                                          >> 4U))));
        vlSelfRef.nicore__DOT__dcache__DOT___GEN_133 
            = (0x0000003fU & ((3U == (IData)(vlSelfRef.nicore__DOT__dcache__DOT__index_in_line))
                               ? (IData)(vlSelfRef.nicore__DOT__dcache__DOT__flush_loop)
                               : (IData)((vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__clint_io_addr 
                                          >> 4U))));
    }
    if ((0U == (IData)(vlSelfRef.nicore__DOT__dcache__DOT__cache_state))) {
        vlSelfRef.io_master_awaddr = vlSelfRef.nicore__DOT__dcache__DOT__cpu_request_addr_reg;
        vlSelfRef.io_master_wlast = vlSelfRef.nicore__DOT__dcache__DOT__last;
        vlSelfRef.nicore__DOT__dcache__DOT__data_mem_0_io_cache_req_index 
            = (0x0000003fU & (IData)((vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__clint_io_addr 
                                      >> 4U)));
        vlSelfRef.nicore__DOT__dcache__DOT__data_mem_1_io_cache_req_index 
            = (0x0000003fU & (IData)((vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__clint_io_addr 
                                      >> 4U)));
        vlSelfRef.nicore__DOT__dcache__DOT__data_mem_2_io_cache_req_index 
            = (0x0000003fU & (IData)((vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__clint_io_addr 
                                      >> 4U)));
        vlSelfRef.nicore__DOT__dcache__DOT__data_mem_3_io_cache_req_index 
            = (0x0000003fU & (IData)((vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__clint_io_addr 
                                      >> 4U)));
    } else if ((0x0fU == (IData)(vlSelfRef.nicore__DOT__dcache__DOT__cache_state))) {
        vlSelfRef.io_master_awaddr = vlSelfRef.nicore__DOT__dcache__DOT__cpu_request_addr_reg;
        vlSelfRef.io_master_wlast = vlSelfRef.nicore__DOT__dcache__DOT__last;
        vlSelfRef.nicore__DOT__dcache__DOT__data_mem_0_io_cache_req_index 
            = (0x0000003fU & (IData)((vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__clint_io_addr 
                                      >> 4U)));
        vlSelfRef.nicore__DOT__dcache__DOT__data_mem_1_io_cache_req_index 
            = (0x0000003fU & (IData)((vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__clint_io_addr 
                                      >> 4U)));
        vlSelfRef.nicore__DOT__dcache__DOT__data_mem_2_io_cache_req_index 
            = (0x0000003fU & (IData)((vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__clint_io_addr 
                                      >> 4U)));
        vlSelfRef.nicore__DOT__dcache__DOT__data_mem_3_io_cache_req_index 
            = (0x0000003fU & (IData)((vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__clint_io_addr 
                                      >> 4U)));
    } else if ((0x10U == (IData)(vlSelfRef.nicore__DOT__dcache__DOT__cache_state))) {
        vlSelfRef.io_master_awaddr = vlSelfRef.nicore__DOT__dcache__DOT__cpu_request_addr_reg;
        vlSelfRef.io_master_wlast = vlSelfRef.nicore__DOT__dcache__DOT__last;
        vlSelfRef.nicore__DOT__dcache__DOT__data_mem_0_io_cache_req_index 
            = (0x0000003fU & (IData)((vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__clint_io_addr 
                                      >> 4U)));
        vlSelfRef.nicore__DOT__dcache__DOT__data_mem_1_io_cache_req_index 
            = (0x0000003fU & (IData)((vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__clint_io_addr 
                                      >> 4U)));
        vlSelfRef.nicore__DOT__dcache__DOT__data_mem_2_io_cache_req_index 
            = (0x0000003fU & (IData)((vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__clint_io_addr 
                                      >> 4U)));
        vlSelfRef.nicore__DOT__dcache__DOT__data_mem_3_io_cache_req_index 
            = (0x0000003fU & (IData)((vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__clint_io_addr 
                                      >> 4U)));
    } else if ((0x11U == (IData)(vlSelfRef.nicore__DOT__dcache__DOT__cache_state))) {
        vlSelfRef.io_master_awaddr = vlSelfRef.nicore__DOT__dcache__DOT___GEN_137;
        vlSelfRef.io_master_wlast = vlSelfRef.nicore__DOT__dcache__DOT__last;
        if (vlSelfRef.nicore__DOT__dcache__DOT__write_data_reg) {
            vlSelfRef.nicore__DOT__dcache__DOT__data_mem_0_io_cache_req_index 
                = (0x0000003fU & (IData)(vlSelfRef.nicore__DOT__dcache__DOT___GEN_127));
            vlSelfRef.nicore__DOT__dcache__DOT__data_mem_1_io_cache_req_index 
                = (0x0000003fU & (IData)(vlSelfRef.nicore__DOT__dcache__DOT___GEN_129));
            vlSelfRef.nicore__DOT__dcache__DOT__data_mem_2_io_cache_req_index 
                = (0x0000003fU & (IData)(vlSelfRef.nicore__DOT__dcache__DOT___GEN_131));
            vlSelfRef.nicore__DOT__dcache__DOT__data_mem_3_io_cache_req_index 
                = (0x0000003fU & (IData)(vlSelfRef.nicore__DOT__dcache__DOT___GEN_133));
        } else {
            vlSelfRef.nicore__DOT__dcache__DOT__data_mem_0_io_cache_req_index 
                = (0x0000003fU & ((0U == (IData)(vlSelfRef.nicore__DOT__dcache__DOT__index_in_line))
                                   ? (IData)(vlSelfRef.nicore__DOT__dcache__DOT__flush_loop)
                                   : (IData)(vlSelfRef.nicore__DOT__dcache__DOT___GEN_127)));
            vlSelfRef.nicore__DOT__dcache__DOT__data_mem_1_io_cache_req_index 
                = (0x0000003fU & ((1U == (IData)(vlSelfRef.nicore__DOT__dcache__DOT__index_in_line))
                                   ? (IData)(vlSelfRef.nicore__DOT__dcache__DOT__flush_loop)
                                   : (IData)(vlSelfRef.nicore__DOT__dcache__DOT___GEN_129)));
            vlSelfRef.nicore__DOT__dcache__DOT__data_mem_2_io_cache_req_index 
                = (0x0000003fU & ((2U == (IData)(vlSelfRef.nicore__DOT__dcache__DOT__index_in_line))
                                   ? (IData)(vlSelfRef.nicore__DOT__dcache__DOT__flush_loop)
                                   : (IData)(vlSelfRef.nicore__DOT__dcache__DOT___GEN_131)));
            vlSelfRef.nicore__DOT__dcache__DOT__data_mem_3_io_cache_req_index 
                = (0x0000003fU & ((3U == (IData)(vlSelfRef.nicore__DOT__dcache__DOT__index_in_line))
                                   ? (IData)(vlSelfRef.nicore__DOT__dcache__DOT__flush_loop)
                                   : (IData)(vlSelfRef.nicore__DOT__dcache__DOT___GEN_133)));
        }
    } else {
        if ((0x13U == (IData)(vlSelfRef.nicore__DOT__dcache__DOT__cache_state))) {
            vlSelfRef.io_master_awaddr = vlSelfRef.nicore__DOT__dcache__DOT__cpu_request_addr_reg;
            vlSelfRef.io_master_wlast = vlSelfRef.nicore__DOT__dcache__DOT__last;
        } else if ((1U == (IData)(vlSelfRef.nicore__DOT__dcache__DOT__cache_state))) {
            vlSelfRef.io_master_awaddr = vlSelfRef.nicore__DOT__dcache__DOT__cpu_request_addr_reg;
            vlSelfRef.io_master_wlast = vlSelfRef.nicore__DOT__dcache__DOT__last;
        } else if ((3U == (IData)(vlSelfRef.nicore__DOT__dcache__DOT__cache_state))) {
            vlSelfRef.io_master_awaddr = vlSelfRef.nicore__DOT__dcache__DOT__cpu_request_addr_reg;
            vlSelfRef.io_master_wlast = vlSelfRef.nicore__DOT__dcache__DOT__last;
        } else {
            vlSelfRef.io_master_awaddr = ((4U == (IData)(vlSelfRef.nicore__DOT__dcache__DOT__cache_state))
                                           ? ((IData)(vlSelfRef.nicore__DOT__dcache__DOT__write_addr_reg)
                                               ? vlSelfRef.nicore__DOT__dcache__DOT__cpu_request_addr_reg
                                               : vlSelfRef.nicore__DOT__dcache__DOT__cpu_request_addr_reg_origin)
                                           : ((5U == (IData)(vlSelfRef.nicore__DOT__dcache__DOT__cache_state))
                                               ? vlSelfRef.nicore__DOT__dcache__DOT__cpu_request_addr_reg
                                               : ((6U 
                                                   == (IData)(vlSelfRef.nicore__DOT__dcache__DOT__cache_state))
                                                   ? vlSelfRef.nicore__DOT__dcache__DOT__cpu_request_addr_reg
                                                   : 
                                                  ((0x0cU 
                                                    == (IData)(vlSelfRef.nicore__DOT__dcache__DOT__cache_state))
                                                    ? vlSelfRef.nicore__DOT__dcache__DOT__cpu_request_addr_reg
                                                    : 
                                                   ((0x0dU 
                                                     == (IData)(vlSelfRef.nicore__DOT__dcache__DOT__cache_state))
                                                     ? vlSelfRef.nicore__DOT__dcache__DOT__cpu_request_addr_reg
                                                     : 
                                                    ((9U 
                                                      == (IData)(vlSelfRef.nicore__DOT__dcache__DOT__cache_state))
                                                      ? vlSelfRef.nicore__DOT__dcache__DOT__cpu_request_addr_reg
                                                      : 
                                                     ((8U 
                                                       == (IData)(vlSelfRef.nicore__DOT__dcache__DOT__cache_state))
                                                       ? vlSelfRef.nicore__DOT__dcache__DOT__cpu_request_addr_reg
                                                       : 
                                                      ((0x0eU 
                                                        == (IData)(vlSelfRef.nicore__DOT__dcache__DOT__cache_state))
                                                        ? vlSelfRef.nicore__DOT__dcache__DOT__cpu_request_addr_reg
                                                        : 
                                                       ((7U 
                                                         == (IData)(vlSelfRef.nicore__DOT__dcache__DOT__cache_state))
                                                         ? vlSelfRef.nicore__DOT__dcache__DOT___GEN_137
                                                         : vlSelfRef.nicore__DOT__dcache__DOT__cpu_request_addr_reg)))))))));
            vlSelfRef.io_master_wlast = (((IData)(vlSelfRef.nicore__DOT__dcache__DOT___T_40) 
                                          & (4U == (IData)(vlSelfRef.nicore__DOT__dcache__DOT__cache_state))) 
                                         | (IData)(vlSelfRef.nicore__DOT__dcache__DOT__last));
        }
        vlSelfRef.nicore__DOT__dcache__DOT__data_mem_0_io_cache_req_index 
            = (0x0000003fU & (IData)((vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__clint_io_addr 
                                      >> 4U)));
        vlSelfRef.nicore__DOT__dcache__DOT__data_mem_1_io_cache_req_index 
            = (0x0000003fU & (IData)((vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__clint_io_addr 
                                      >> 4U)));
        vlSelfRef.nicore__DOT__dcache__DOT__data_mem_2_io_cache_req_index 
            = (0x0000003fU & (IData)((vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__clint_io_addr 
                                      >> 4U)));
        vlSelfRef.nicore__DOT__dcache__DOT__data_mem_3_io_cache_req_index 
            = (0x0000003fU & (IData)((vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__clint_io_addr 
                                      >> 4U)));
    }
    if ((0U == (IData)(vlSelfRef.nicore__DOT__icache__DOT__cache_state))) {
        vlSelfRef.nicore__DOT__icache__DOT__data_mem_3_io_cache_req_wmask[0U] = 0U;
        vlSelfRef.nicore__DOT__icache__DOT__data_mem_3_io_cache_req_wmask[1U] = 0U;
        vlSelfRef.nicore__DOT__icache__DOT__data_mem_3_io_cache_req_wmask[2U] = 0U;
        vlSelfRef.nicore__DOT__icache__DOT__data_mem_3_io_cache_req_wmask[3U] = 0U;
        vlSelfRef.nicore__DOT__icache__DOT__data_mem_2_io_cache_req_wmask[0U] = 0U;
        vlSelfRef.nicore__DOT__icache__DOT__data_mem_2_io_cache_req_wmask[1U] = 0U;
        vlSelfRef.nicore__DOT__icache__DOT__data_mem_2_io_cache_req_wmask[2U] = 0U;
        vlSelfRef.nicore__DOT__icache__DOT__data_mem_2_io_cache_req_wmask[3U] = 0U;
        vlSelfRef.nicore__DOT__icache__DOT__data_mem_1_io_cache_req_wmask[0U] = 0U;
        vlSelfRef.nicore__DOT__icache__DOT__data_mem_1_io_cache_req_wmask[1U] = 0U;
        vlSelfRef.nicore__DOT__icache__DOT__data_mem_1_io_cache_req_wmask[2U] = 0U;
        vlSelfRef.nicore__DOT__icache__DOT__data_mem_1_io_cache_req_wmask[3U] = 0U;
        vlSelfRef.nicore__DOT__icache__DOT__data_mem_0_io_cache_req_wmask[0U] = 0U;
        vlSelfRef.nicore__DOT__icache__DOT__data_mem_0_io_cache_req_wmask[1U] = 0U;
        vlSelfRef.nicore__DOT__icache__DOT__data_mem_0_io_cache_req_wmask[2U] = 0U;
        vlSelfRef.nicore__DOT__icache__DOT__data_mem_0_io_cache_req_wmask[3U] = 0U;
    } else if ((0x0fU == (IData)(vlSelfRef.nicore__DOT__icache__DOT__cache_state))) {
        vlSelfRef.nicore__DOT__icache__DOT__data_mem_3_io_cache_req_wmask[0U] = 0U;
        vlSelfRef.nicore__DOT__icache__DOT__data_mem_3_io_cache_req_wmask[1U] = 0U;
        vlSelfRef.nicore__DOT__icache__DOT__data_mem_3_io_cache_req_wmask[2U] = 0U;
        vlSelfRef.nicore__DOT__icache__DOT__data_mem_3_io_cache_req_wmask[3U] = 0U;
        vlSelfRef.nicore__DOT__icache__DOT__data_mem_2_io_cache_req_wmask[0U] = 0U;
        vlSelfRef.nicore__DOT__icache__DOT__data_mem_2_io_cache_req_wmask[1U] = 0U;
        vlSelfRef.nicore__DOT__icache__DOT__data_mem_2_io_cache_req_wmask[2U] = 0U;
        vlSelfRef.nicore__DOT__icache__DOT__data_mem_2_io_cache_req_wmask[3U] = 0U;
        vlSelfRef.nicore__DOT__icache__DOT__data_mem_1_io_cache_req_wmask[0U] = 0U;
        vlSelfRef.nicore__DOT__icache__DOT__data_mem_1_io_cache_req_wmask[1U] = 0U;
        vlSelfRef.nicore__DOT__icache__DOT__data_mem_1_io_cache_req_wmask[2U] = 0U;
        vlSelfRef.nicore__DOT__icache__DOT__data_mem_1_io_cache_req_wmask[3U] = 0U;
        vlSelfRef.nicore__DOT__icache__DOT__data_mem_0_io_cache_req_wmask[0U] = 0U;
        vlSelfRef.nicore__DOT__icache__DOT__data_mem_0_io_cache_req_wmask[1U] = 0U;
        vlSelfRef.nicore__DOT__icache__DOT__data_mem_0_io_cache_req_wmask[2U] = 0U;
        vlSelfRef.nicore__DOT__icache__DOT__data_mem_0_io_cache_req_wmask[3U] = 0U;
    } else if ((0x10U == (IData)(vlSelfRef.nicore__DOT__icache__DOT__cache_state))) {
        vlSelfRef.nicore__DOT__icache__DOT__data_mem_3_io_cache_req_wmask[0U] = 0U;
        vlSelfRef.nicore__DOT__icache__DOT__data_mem_3_io_cache_req_wmask[1U] = 0U;
        vlSelfRef.nicore__DOT__icache__DOT__data_mem_3_io_cache_req_wmask[2U] = 0U;
        vlSelfRef.nicore__DOT__icache__DOT__data_mem_3_io_cache_req_wmask[3U] = 0U;
        vlSelfRef.nicore__DOT__icache__DOT__data_mem_2_io_cache_req_wmask[0U] = 0U;
        vlSelfRef.nicore__DOT__icache__DOT__data_mem_2_io_cache_req_wmask[1U] = 0U;
        vlSelfRef.nicore__DOT__icache__DOT__data_mem_2_io_cache_req_wmask[2U] = 0U;
        vlSelfRef.nicore__DOT__icache__DOT__data_mem_2_io_cache_req_wmask[3U] = 0U;
        vlSelfRef.nicore__DOT__icache__DOT__data_mem_1_io_cache_req_wmask[0U] = 0U;
        vlSelfRef.nicore__DOT__icache__DOT__data_mem_1_io_cache_req_wmask[1U] = 0U;
        vlSelfRef.nicore__DOT__icache__DOT__data_mem_1_io_cache_req_wmask[2U] = 0U;
        vlSelfRef.nicore__DOT__icache__DOT__data_mem_1_io_cache_req_wmask[3U] = 0U;
        vlSelfRef.nicore__DOT__icache__DOT__data_mem_0_io_cache_req_wmask[0U] = 0U;
        vlSelfRef.nicore__DOT__icache__DOT__data_mem_0_io_cache_req_wmask[1U] = 0U;
        vlSelfRef.nicore__DOT__icache__DOT__data_mem_0_io_cache_req_wmask[2U] = 0U;
        vlSelfRef.nicore__DOT__icache__DOT__data_mem_0_io_cache_req_wmask[3U] = 0U;
    } else if ((0x11U == (IData)(vlSelfRef.nicore__DOT__icache__DOT__cache_state))) {
        vlSelfRef.nicore__DOT__icache__DOT__data_mem_3_io_cache_req_wmask[0U] = 0U;
        vlSelfRef.nicore__DOT__icache__DOT__data_mem_3_io_cache_req_wmask[1U] = 0U;
        vlSelfRef.nicore__DOT__icache__DOT__data_mem_3_io_cache_req_wmask[2U] = 0U;
        vlSelfRef.nicore__DOT__icache__DOT__data_mem_3_io_cache_req_wmask[3U] = 0U;
        vlSelfRef.nicore__DOT__icache__DOT__data_mem_2_io_cache_req_wmask[0U] = 0U;
        vlSelfRef.nicore__DOT__icache__DOT__data_mem_2_io_cache_req_wmask[1U] = 0U;
        vlSelfRef.nicore__DOT__icache__DOT__data_mem_2_io_cache_req_wmask[2U] = 0U;
        vlSelfRef.nicore__DOT__icache__DOT__data_mem_2_io_cache_req_wmask[3U] = 0U;
        vlSelfRef.nicore__DOT__icache__DOT__data_mem_1_io_cache_req_wmask[0U] = 0U;
        vlSelfRef.nicore__DOT__icache__DOT__data_mem_1_io_cache_req_wmask[1U] = 0U;
        vlSelfRef.nicore__DOT__icache__DOT__data_mem_1_io_cache_req_wmask[2U] = 0U;
        vlSelfRef.nicore__DOT__icache__DOT__data_mem_1_io_cache_req_wmask[3U] = 0U;
        vlSelfRef.nicore__DOT__icache__DOT__data_mem_0_io_cache_req_wmask[0U] = 0U;
        vlSelfRef.nicore__DOT__icache__DOT__data_mem_0_io_cache_req_wmask[1U] = 0U;
        vlSelfRef.nicore__DOT__icache__DOT__data_mem_0_io_cache_req_wmask[2U] = 0U;
        vlSelfRef.nicore__DOT__icache__DOT__data_mem_0_io_cache_req_wmask[3U] = 0U;
    } else if ((0x13U == (IData)(vlSelfRef.nicore__DOT__icache__DOT__cache_state))) {
        vlSelfRef.nicore__DOT__icache__DOT__data_mem_3_io_cache_req_wmask[0U] = 0U;
        vlSelfRef.nicore__DOT__icache__DOT__data_mem_3_io_cache_req_wmask[1U] = 0U;
        vlSelfRef.nicore__DOT__icache__DOT__data_mem_3_io_cache_req_wmask[2U] = 0U;
        vlSelfRef.nicore__DOT__icache__DOT__data_mem_3_io_cache_req_wmask[3U] = 0U;
        vlSelfRef.nicore__DOT__icache__DOT__data_mem_2_io_cache_req_wmask[0U] = 0U;
        vlSelfRef.nicore__DOT__icache__DOT__data_mem_2_io_cache_req_wmask[1U] = 0U;
        vlSelfRef.nicore__DOT__icache__DOT__data_mem_2_io_cache_req_wmask[2U] = 0U;
        vlSelfRef.nicore__DOT__icache__DOT__data_mem_2_io_cache_req_wmask[3U] = 0U;
        vlSelfRef.nicore__DOT__icache__DOT__data_mem_1_io_cache_req_wmask[0U] = 0U;
        vlSelfRef.nicore__DOT__icache__DOT__data_mem_1_io_cache_req_wmask[1U] = 0U;
        vlSelfRef.nicore__DOT__icache__DOT__data_mem_1_io_cache_req_wmask[2U] = 0U;
        vlSelfRef.nicore__DOT__icache__DOT__data_mem_1_io_cache_req_wmask[3U] = 0U;
        vlSelfRef.nicore__DOT__icache__DOT__data_mem_0_io_cache_req_wmask[0U] = 0U;
        vlSelfRef.nicore__DOT__icache__DOT__data_mem_0_io_cache_req_wmask[1U] = 0U;
        vlSelfRef.nicore__DOT__icache__DOT__data_mem_0_io_cache_req_wmask[2U] = 0U;
        vlSelfRef.nicore__DOT__icache__DOT__data_mem_0_io_cache_req_wmask[3U] = 0U;
    } else if ((1U == (IData)(vlSelfRef.nicore__DOT__icache__DOT__cache_state))) {
        vlSelfRef.nicore__DOT__icache__DOT__data_mem_3_io_cache_req_wmask[0U] = 0U;
        vlSelfRef.nicore__DOT__icache__DOT__data_mem_3_io_cache_req_wmask[1U] = 0U;
        vlSelfRef.nicore__DOT__icache__DOT__data_mem_3_io_cache_req_wmask[2U] = 0U;
        vlSelfRef.nicore__DOT__icache__DOT__data_mem_3_io_cache_req_wmask[3U] = 0U;
        vlSelfRef.nicore__DOT__icache__DOT__data_mem_2_io_cache_req_wmask[0U] = 0U;
        vlSelfRef.nicore__DOT__icache__DOT__data_mem_2_io_cache_req_wmask[1U] = 0U;
        vlSelfRef.nicore__DOT__icache__DOT__data_mem_2_io_cache_req_wmask[2U] = 0U;
        vlSelfRef.nicore__DOT__icache__DOT__data_mem_2_io_cache_req_wmask[3U] = 0U;
        vlSelfRef.nicore__DOT__icache__DOT__data_mem_1_io_cache_req_wmask[0U] = 0U;
        vlSelfRef.nicore__DOT__icache__DOT__data_mem_1_io_cache_req_wmask[1U] = 0U;
        vlSelfRef.nicore__DOT__icache__DOT__data_mem_1_io_cache_req_wmask[2U] = 0U;
        vlSelfRef.nicore__DOT__icache__DOT__data_mem_1_io_cache_req_wmask[3U] = 0U;
        vlSelfRef.nicore__DOT__icache__DOT__data_mem_0_io_cache_req_wmask[0U] = 0U;
        vlSelfRef.nicore__DOT__icache__DOT__data_mem_0_io_cache_req_wmask[1U] = 0U;
        vlSelfRef.nicore__DOT__icache__DOT__data_mem_0_io_cache_req_wmask[2U] = 0U;
        vlSelfRef.nicore__DOT__icache__DOT__data_mem_0_io_cache_req_wmask[3U] = 0U;
    } else if ((3U == (IData)(vlSelfRef.nicore__DOT__icache__DOT__cache_state))) {
        vlSelfRef.nicore__DOT__icache__DOT__data_mem_3_io_cache_req_wmask[0U] = 0U;
        vlSelfRef.nicore__DOT__icache__DOT__data_mem_3_io_cache_req_wmask[1U] = 0U;
        vlSelfRef.nicore__DOT__icache__DOT__data_mem_3_io_cache_req_wmask[2U] = 0U;
        vlSelfRef.nicore__DOT__icache__DOT__data_mem_3_io_cache_req_wmask[3U] = 0U;
        vlSelfRef.nicore__DOT__icache__DOT__data_mem_2_io_cache_req_wmask[0U] = 0U;
        vlSelfRef.nicore__DOT__icache__DOT__data_mem_2_io_cache_req_wmask[1U] = 0U;
        vlSelfRef.nicore__DOT__icache__DOT__data_mem_2_io_cache_req_wmask[2U] = 0U;
        vlSelfRef.nicore__DOT__icache__DOT__data_mem_2_io_cache_req_wmask[3U] = 0U;
        vlSelfRef.nicore__DOT__icache__DOT__data_mem_1_io_cache_req_wmask[0U] = 0U;
        vlSelfRef.nicore__DOT__icache__DOT__data_mem_1_io_cache_req_wmask[1U] = 0U;
        vlSelfRef.nicore__DOT__icache__DOT__data_mem_1_io_cache_req_wmask[2U] = 0U;
        vlSelfRef.nicore__DOT__icache__DOT__data_mem_1_io_cache_req_wmask[3U] = 0U;
        vlSelfRef.nicore__DOT__icache__DOT__data_mem_0_io_cache_req_wmask[0U] = 0U;
        vlSelfRef.nicore__DOT__icache__DOT__data_mem_0_io_cache_req_wmask[1U] = 0U;
        vlSelfRef.nicore__DOT__icache__DOT__data_mem_0_io_cache_req_wmask[2U] = 0U;
        vlSelfRef.nicore__DOT__icache__DOT__data_mem_0_io_cache_req_wmask[3U] = 0U;
    } else if ((4U == (IData)(vlSelfRef.nicore__DOT__icache__DOT__cache_state))) {
        vlSelfRef.nicore__DOT__icache__DOT__data_mem_3_io_cache_req_wmask[0U] = 0U;
        vlSelfRef.nicore__DOT__icache__DOT__data_mem_3_io_cache_req_wmask[1U] = 0U;
        vlSelfRef.nicore__DOT__icache__DOT__data_mem_3_io_cache_req_wmask[2U] = 0U;
        vlSelfRef.nicore__DOT__icache__DOT__data_mem_3_io_cache_req_wmask[3U] = 0U;
        vlSelfRef.nicore__DOT__icache__DOT__data_mem_2_io_cache_req_wmask[0U] = 0U;
        vlSelfRef.nicore__DOT__icache__DOT__data_mem_2_io_cache_req_wmask[1U] = 0U;
        vlSelfRef.nicore__DOT__icache__DOT__data_mem_2_io_cache_req_wmask[2U] = 0U;
        vlSelfRef.nicore__DOT__icache__DOT__data_mem_2_io_cache_req_wmask[3U] = 0U;
        vlSelfRef.nicore__DOT__icache__DOT__data_mem_1_io_cache_req_wmask[0U] = 0U;
        vlSelfRef.nicore__DOT__icache__DOT__data_mem_1_io_cache_req_wmask[1U] = 0U;
        vlSelfRef.nicore__DOT__icache__DOT__data_mem_1_io_cache_req_wmask[2U] = 0U;
        vlSelfRef.nicore__DOT__icache__DOT__data_mem_1_io_cache_req_wmask[3U] = 0U;
        vlSelfRef.nicore__DOT__icache__DOT__data_mem_0_io_cache_req_wmask[0U] = 0U;
        vlSelfRef.nicore__DOT__icache__DOT__data_mem_0_io_cache_req_wmask[1U] = 0U;
        vlSelfRef.nicore__DOT__icache__DOT__data_mem_0_io_cache_req_wmask[2U] = 0U;
        vlSelfRef.nicore__DOT__icache__DOT__data_mem_0_io_cache_req_wmask[3U] = 0U;
    } else if ((5U == (IData)(vlSelfRef.nicore__DOT__icache__DOT__cache_state))) {
        vlSelfRef.nicore__DOT__icache__DOT__data_mem_3_io_cache_req_wmask[0U] = 0U;
        vlSelfRef.nicore__DOT__icache__DOT__data_mem_3_io_cache_req_wmask[1U] = 0U;
        vlSelfRef.nicore__DOT__icache__DOT__data_mem_3_io_cache_req_wmask[2U] = 0U;
        vlSelfRef.nicore__DOT__icache__DOT__data_mem_3_io_cache_req_wmask[3U] = 0U;
        vlSelfRef.nicore__DOT__icache__DOT__data_mem_2_io_cache_req_wmask[0U] = 0U;
        vlSelfRef.nicore__DOT__icache__DOT__data_mem_2_io_cache_req_wmask[1U] = 0U;
        vlSelfRef.nicore__DOT__icache__DOT__data_mem_2_io_cache_req_wmask[2U] = 0U;
        vlSelfRef.nicore__DOT__icache__DOT__data_mem_2_io_cache_req_wmask[3U] = 0U;
        vlSelfRef.nicore__DOT__icache__DOT__data_mem_1_io_cache_req_wmask[0U] = 0U;
        vlSelfRef.nicore__DOT__icache__DOT__data_mem_1_io_cache_req_wmask[1U] = 0U;
        vlSelfRef.nicore__DOT__icache__DOT__data_mem_1_io_cache_req_wmask[2U] = 0U;
        vlSelfRef.nicore__DOT__icache__DOT__data_mem_1_io_cache_req_wmask[3U] = 0U;
        vlSelfRef.nicore__DOT__icache__DOT__data_mem_0_io_cache_req_wmask[0U] = 0U;
        vlSelfRef.nicore__DOT__icache__DOT__data_mem_0_io_cache_req_wmask[1U] = 0U;
        vlSelfRef.nicore__DOT__icache__DOT__data_mem_0_io_cache_req_wmask[2U] = 0U;
        vlSelfRef.nicore__DOT__icache__DOT__data_mem_0_io_cache_req_wmask[3U] = 0U;
    } else if ((6U == (IData)(vlSelfRef.nicore__DOT__icache__DOT__cache_state))) {
        vlSelfRef.nicore__DOT__icache__DOT__data_mem_3_io_cache_req_wmask[0U] = 0U;
        vlSelfRef.nicore__DOT__icache__DOT__data_mem_3_io_cache_req_wmask[1U] = 0U;
        vlSelfRef.nicore__DOT__icache__DOT__data_mem_3_io_cache_req_wmask[2U] = 0U;
        vlSelfRef.nicore__DOT__icache__DOT__data_mem_3_io_cache_req_wmask[3U] = 0U;
        vlSelfRef.nicore__DOT__icache__DOT__data_mem_2_io_cache_req_wmask[0U] = 0U;
        vlSelfRef.nicore__DOT__icache__DOT__data_mem_2_io_cache_req_wmask[1U] = 0U;
        vlSelfRef.nicore__DOT__icache__DOT__data_mem_2_io_cache_req_wmask[2U] = 0U;
        vlSelfRef.nicore__DOT__icache__DOT__data_mem_2_io_cache_req_wmask[3U] = 0U;
        vlSelfRef.nicore__DOT__icache__DOT__data_mem_1_io_cache_req_wmask[0U] = 0U;
        vlSelfRef.nicore__DOT__icache__DOT__data_mem_1_io_cache_req_wmask[1U] = 0U;
        vlSelfRef.nicore__DOT__icache__DOT__data_mem_1_io_cache_req_wmask[2U] = 0U;
        vlSelfRef.nicore__DOT__icache__DOT__data_mem_1_io_cache_req_wmask[3U] = 0U;
        vlSelfRef.nicore__DOT__icache__DOT__data_mem_0_io_cache_req_wmask[0U] = 0U;
        vlSelfRef.nicore__DOT__icache__DOT__data_mem_0_io_cache_req_wmask[1U] = 0U;
        vlSelfRef.nicore__DOT__icache__DOT__data_mem_0_io_cache_req_wmask[2U] = 0U;
        vlSelfRef.nicore__DOT__icache__DOT__data_mem_0_io_cache_req_wmask[3U] = 0U;
    } else if ((0x0cU == (IData)(vlSelfRef.nicore__DOT__icache__DOT__cache_state))) {
        vlSelfRef.nicore__DOT__icache__DOT__data_mem_3_io_cache_req_wmask[0U] = 0U;
        vlSelfRef.nicore__DOT__icache__DOT__data_mem_3_io_cache_req_wmask[1U] = 0U;
        vlSelfRef.nicore__DOT__icache__DOT__data_mem_3_io_cache_req_wmask[2U] = 0U;
        vlSelfRef.nicore__DOT__icache__DOT__data_mem_3_io_cache_req_wmask[3U] = 0U;
        vlSelfRef.nicore__DOT__icache__DOT__data_mem_2_io_cache_req_wmask[0U] = 0U;
        vlSelfRef.nicore__DOT__icache__DOT__data_mem_2_io_cache_req_wmask[1U] = 0U;
        vlSelfRef.nicore__DOT__icache__DOT__data_mem_2_io_cache_req_wmask[2U] = 0U;
        vlSelfRef.nicore__DOT__icache__DOT__data_mem_2_io_cache_req_wmask[3U] = 0U;
        vlSelfRef.nicore__DOT__icache__DOT__data_mem_1_io_cache_req_wmask[0U] = 0U;
        vlSelfRef.nicore__DOT__icache__DOT__data_mem_1_io_cache_req_wmask[1U] = 0U;
        vlSelfRef.nicore__DOT__icache__DOT__data_mem_1_io_cache_req_wmask[2U] = 0U;
        vlSelfRef.nicore__DOT__icache__DOT__data_mem_1_io_cache_req_wmask[3U] = 0U;
        vlSelfRef.nicore__DOT__icache__DOT__data_mem_0_io_cache_req_wmask[0U] = 0U;
        vlSelfRef.nicore__DOT__icache__DOT__data_mem_0_io_cache_req_wmask[1U] = 0U;
        vlSelfRef.nicore__DOT__icache__DOT__data_mem_0_io_cache_req_wmask[2U] = 0U;
        vlSelfRef.nicore__DOT__icache__DOT__data_mem_0_io_cache_req_wmask[3U] = 0U;
    } else if ((0x0dU == (IData)(vlSelfRef.nicore__DOT__icache__DOT__cache_state))) {
        vlSelfRef.nicore__DOT__icache__DOT__data_mem_3_io_cache_req_wmask[0U] = 0U;
        vlSelfRef.nicore__DOT__icache__DOT__data_mem_3_io_cache_req_wmask[1U] = 0U;
        vlSelfRef.nicore__DOT__icache__DOT__data_mem_3_io_cache_req_wmask[2U] = 0U;
        vlSelfRef.nicore__DOT__icache__DOT__data_mem_3_io_cache_req_wmask[3U] = 0U;
        vlSelfRef.nicore__DOT__icache__DOT__data_mem_2_io_cache_req_wmask[0U] = 0U;
        vlSelfRef.nicore__DOT__icache__DOT__data_mem_2_io_cache_req_wmask[1U] = 0U;
        vlSelfRef.nicore__DOT__icache__DOT__data_mem_2_io_cache_req_wmask[2U] = 0U;
        vlSelfRef.nicore__DOT__icache__DOT__data_mem_2_io_cache_req_wmask[3U] = 0U;
        vlSelfRef.nicore__DOT__icache__DOT__data_mem_1_io_cache_req_wmask[0U] = 0U;
        vlSelfRef.nicore__DOT__icache__DOT__data_mem_1_io_cache_req_wmask[1U] = 0U;
        vlSelfRef.nicore__DOT__icache__DOT__data_mem_1_io_cache_req_wmask[2U] = 0U;
        vlSelfRef.nicore__DOT__icache__DOT__data_mem_1_io_cache_req_wmask[3U] = 0U;
        vlSelfRef.nicore__DOT__icache__DOT__data_mem_0_io_cache_req_wmask[0U] = 0U;
        vlSelfRef.nicore__DOT__icache__DOT__data_mem_0_io_cache_req_wmask[1U] = 0U;
        vlSelfRef.nicore__DOT__icache__DOT__data_mem_0_io_cache_req_wmask[2U] = 0U;
        vlSelfRef.nicore__DOT__icache__DOT__data_mem_0_io_cache_req_wmask[3U] = 0U;
    } else if ((9U == (IData)(vlSelfRef.nicore__DOT__icache__DOT__cache_state))) {
        vlSelfRef.nicore__DOT__icache__DOT__data_mem_3_io_cache_req_wmask[0U] = 0U;
        vlSelfRef.nicore__DOT__icache__DOT__data_mem_3_io_cache_req_wmask[1U] = 0U;
        vlSelfRef.nicore__DOT__icache__DOT__data_mem_3_io_cache_req_wmask[2U] = 0U;
        vlSelfRef.nicore__DOT__icache__DOT__data_mem_3_io_cache_req_wmask[3U] = 0U;
        vlSelfRef.nicore__DOT__icache__DOT__data_mem_2_io_cache_req_wmask[0U] = 0U;
        vlSelfRef.nicore__DOT__icache__DOT__data_mem_2_io_cache_req_wmask[1U] = 0U;
        vlSelfRef.nicore__DOT__icache__DOT__data_mem_2_io_cache_req_wmask[2U] = 0U;
        vlSelfRef.nicore__DOT__icache__DOT__data_mem_2_io_cache_req_wmask[3U] = 0U;
        vlSelfRef.nicore__DOT__icache__DOT__data_mem_1_io_cache_req_wmask[0U] = 0U;
        vlSelfRef.nicore__DOT__icache__DOT__data_mem_1_io_cache_req_wmask[1U] = 0U;
        vlSelfRef.nicore__DOT__icache__DOT__data_mem_1_io_cache_req_wmask[2U] = 0U;
        vlSelfRef.nicore__DOT__icache__DOT__data_mem_1_io_cache_req_wmask[3U] = 0U;
        vlSelfRef.nicore__DOT__icache__DOT__data_mem_0_io_cache_req_wmask[0U] = 0U;
        vlSelfRef.nicore__DOT__icache__DOT__data_mem_0_io_cache_req_wmask[1U] = 0U;
        vlSelfRef.nicore__DOT__icache__DOT__data_mem_0_io_cache_req_wmask[2U] = 0U;
        vlSelfRef.nicore__DOT__icache__DOT__data_mem_0_io_cache_req_wmask[3U] = 0U;
    } else if ((8U == (IData)(vlSelfRef.nicore__DOT__icache__DOT__cache_state))) {
        if (vlSelfRef.nicore__DOT__icache_io_mem_io_r_valid) {
            if ((3U == (IData)(vlSelfRef.nicore__DOT__icache__DOT__replace))) {
                vlSelfRef.nicore__DOT__icache__DOT__data_mem_3_io_cache_req_wmask[0U] 
                    = vlSelfRef.nicore__DOT__icache__DOT___data_mem_0_io_cache_req_wmask_T_1[0U];
                vlSelfRef.nicore__DOT__icache__DOT__data_mem_3_io_cache_req_wmask[1U] 
                    = vlSelfRef.nicore__DOT__icache__DOT___data_mem_0_io_cache_req_wmask_T_1[1U];
                vlSelfRef.nicore__DOT__icache__DOT__data_mem_3_io_cache_req_wmask[2U] 
                    = vlSelfRef.nicore__DOT__icache__DOT___data_mem_0_io_cache_req_wmask_T_1[2U];
                vlSelfRef.nicore__DOT__icache__DOT__data_mem_3_io_cache_req_wmask[3U] 
                    = vlSelfRef.nicore__DOT__icache__DOT___data_mem_0_io_cache_req_wmask_T_1[3U];
            } else {
                vlSelfRef.nicore__DOT__icache__DOT__data_mem_3_io_cache_req_wmask[0U] = 0U;
                vlSelfRef.nicore__DOT__icache__DOT__data_mem_3_io_cache_req_wmask[1U] = 0U;
                vlSelfRef.nicore__DOT__icache__DOT__data_mem_3_io_cache_req_wmask[2U] = 0U;
                vlSelfRef.nicore__DOT__icache__DOT__data_mem_3_io_cache_req_wmask[3U] = 0U;
            }
            if ((2U == (IData)(vlSelfRef.nicore__DOT__icache__DOT__replace))) {
                vlSelfRef.nicore__DOT__icache__DOT__data_mem_2_io_cache_req_wmask[0U] 
                    = vlSelfRef.nicore__DOT__icache__DOT___data_mem_0_io_cache_req_wmask_T_1[0U];
                vlSelfRef.nicore__DOT__icache__DOT__data_mem_2_io_cache_req_wmask[1U] 
                    = vlSelfRef.nicore__DOT__icache__DOT___data_mem_0_io_cache_req_wmask_T_1[1U];
                vlSelfRef.nicore__DOT__icache__DOT__data_mem_2_io_cache_req_wmask[2U] 
                    = vlSelfRef.nicore__DOT__icache__DOT___data_mem_0_io_cache_req_wmask_T_1[2U];
                vlSelfRef.nicore__DOT__icache__DOT__data_mem_2_io_cache_req_wmask[3U] 
                    = vlSelfRef.nicore__DOT__icache__DOT___data_mem_0_io_cache_req_wmask_T_1[3U];
            } else {
                vlSelfRef.nicore__DOT__icache__DOT__data_mem_2_io_cache_req_wmask[0U] = 0U;
                vlSelfRef.nicore__DOT__icache__DOT__data_mem_2_io_cache_req_wmask[1U] = 0U;
                vlSelfRef.nicore__DOT__icache__DOT__data_mem_2_io_cache_req_wmask[2U] = 0U;
                vlSelfRef.nicore__DOT__icache__DOT__data_mem_2_io_cache_req_wmask[3U] = 0U;
            }
            if ((1U == (IData)(vlSelfRef.nicore__DOT__icache__DOT__replace))) {
                vlSelfRef.nicore__DOT__icache__DOT__data_mem_1_io_cache_req_wmask[0U] 
                    = vlSelfRef.nicore__DOT__icache__DOT___data_mem_0_io_cache_req_wmask_T_1[0U];
                vlSelfRef.nicore__DOT__icache__DOT__data_mem_1_io_cache_req_wmask[1U] 
                    = vlSelfRef.nicore__DOT__icache__DOT___data_mem_0_io_cache_req_wmask_T_1[1U];
                vlSelfRef.nicore__DOT__icache__DOT__data_mem_1_io_cache_req_wmask[2U] 
                    = vlSelfRef.nicore__DOT__icache__DOT___data_mem_0_io_cache_req_wmask_T_1[2U];
                vlSelfRef.nicore__DOT__icache__DOT__data_mem_1_io_cache_req_wmask[3U] 
                    = vlSelfRef.nicore__DOT__icache__DOT___data_mem_0_io_cache_req_wmask_T_1[3U];
            } else {
                vlSelfRef.nicore__DOT__icache__DOT__data_mem_1_io_cache_req_wmask[0U] = 0U;
                vlSelfRef.nicore__DOT__icache__DOT__data_mem_1_io_cache_req_wmask[1U] = 0U;
                vlSelfRef.nicore__DOT__icache__DOT__data_mem_1_io_cache_req_wmask[2U] = 0U;
                vlSelfRef.nicore__DOT__icache__DOT__data_mem_1_io_cache_req_wmask[3U] = 0U;
            }
            if ((0U == (IData)(vlSelfRef.nicore__DOT__icache__DOT__replace))) {
                vlSelfRef.nicore__DOT__icache__DOT__data_mem_0_io_cache_req_wmask[0U] 
                    = vlSelfRef.nicore__DOT__icache__DOT___data_mem_0_io_cache_req_wmask_T_1[0U];
                vlSelfRef.nicore__DOT__icache__DOT__data_mem_0_io_cache_req_wmask[1U] 
                    = vlSelfRef.nicore__DOT__icache__DOT___data_mem_0_io_cache_req_wmask_T_1[1U];
                vlSelfRef.nicore__DOT__icache__DOT__data_mem_0_io_cache_req_wmask[2U] 
                    = vlSelfRef.nicore__DOT__icache__DOT___data_mem_0_io_cache_req_wmask_T_1[2U];
                vlSelfRef.nicore__DOT__icache__DOT__data_mem_0_io_cache_req_wmask[3U] 
                    = vlSelfRef.nicore__DOT__icache__DOT___data_mem_0_io_cache_req_wmask_T_1[3U];
            } else {
                vlSelfRef.nicore__DOT__icache__DOT__data_mem_0_io_cache_req_wmask[0U] = 0U;
                vlSelfRef.nicore__DOT__icache__DOT__data_mem_0_io_cache_req_wmask[1U] = 0U;
                vlSelfRef.nicore__DOT__icache__DOT__data_mem_0_io_cache_req_wmask[2U] = 0U;
                vlSelfRef.nicore__DOT__icache__DOT__data_mem_0_io_cache_req_wmask[3U] = 0U;
            }
        } else {
            vlSelfRef.nicore__DOT__icache__DOT__data_mem_3_io_cache_req_wmask[0U] = 0U;
            vlSelfRef.nicore__DOT__icache__DOT__data_mem_3_io_cache_req_wmask[1U] = 0U;
            vlSelfRef.nicore__DOT__icache__DOT__data_mem_3_io_cache_req_wmask[2U] = 0U;
            vlSelfRef.nicore__DOT__icache__DOT__data_mem_3_io_cache_req_wmask[3U] = 0U;
            vlSelfRef.nicore__DOT__icache__DOT__data_mem_2_io_cache_req_wmask[0U] = 0U;
            vlSelfRef.nicore__DOT__icache__DOT__data_mem_2_io_cache_req_wmask[1U] = 0U;
            vlSelfRef.nicore__DOT__icache__DOT__data_mem_2_io_cache_req_wmask[2U] = 0U;
            vlSelfRef.nicore__DOT__icache__DOT__data_mem_2_io_cache_req_wmask[3U] = 0U;
            vlSelfRef.nicore__DOT__icache__DOT__data_mem_1_io_cache_req_wmask[0U] = 0U;
            vlSelfRef.nicore__DOT__icache__DOT__data_mem_1_io_cache_req_wmask[1U] = 0U;
            vlSelfRef.nicore__DOT__icache__DOT__data_mem_1_io_cache_req_wmask[2U] = 0U;
            vlSelfRef.nicore__DOT__icache__DOT__data_mem_1_io_cache_req_wmask[3U] = 0U;
            vlSelfRef.nicore__DOT__icache__DOT__data_mem_0_io_cache_req_wmask[0U] = 0U;
            vlSelfRef.nicore__DOT__icache__DOT__data_mem_0_io_cache_req_wmask[1U] = 0U;
            vlSelfRef.nicore__DOT__icache__DOT__data_mem_0_io_cache_req_wmask[2U] = 0U;
            vlSelfRef.nicore__DOT__icache__DOT__data_mem_0_io_cache_req_wmask[3U] = 0U;
        }
    } else {
        vlSelfRef.nicore__DOT__icache__DOT__data_mem_3_io_cache_req_wmask[0U] = 0U;
        vlSelfRef.nicore__DOT__icache__DOT__data_mem_3_io_cache_req_wmask[1U] = 0U;
        vlSelfRef.nicore__DOT__icache__DOT__data_mem_3_io_cache_req_wmask[2U] = 0U;
        vlSelfRef.nicore__DOT__icache__DOT__data_mem_3_io_cache_req_wmask[3U] = 0U;
        vlSelfRef.nicore__DOT__icache__DOT__data_mem_2_io_cache_req_wmask[0U] = 0U;
        vlSelfRef.nicore__DOT__icache__DOT__data_mem_2_io_cache_req_wmask[1U] = 0U;
        vlSelfRef.nicore__DOT__icache__DOT__data_mem_2_io_cache_req_wmask[2U] = 0U;
        vlSelfRef.nicore__DOT__icache__DOT__data_mem_2_io_cache_req_wmask[3U] = 0U;
        vlSelfRef.nicore__DOT__icache__DOT__data_mem_1_io_cache_req_wmask[0U] = 0U;
        vlSelfRef.nicore__DOT__icache__DOT__data_mem_1_io_cache_req_wmask[1U] = 0U;
        vlSelfRef.nicore__DOT__icache__DOT__data_mem_1_io_cache_req_wmask[2U] = 0U;
        vlSelfRef.nicore__DOT__icache__DOT__data_mem_1_io_cache_req_wmask[3U] = 0U;
        vlSelfRef.nicore__DOT__icache__DOT__data_mem_0_io_cache_req_wmask[0U] = 0U;
        vlSelfRef.nicore__DOT__icache__DOT__data_mem_0_io_cache_req_wmask[1U] = 0U;
        vlSelfRef.nicore__DOT__icache__DOT__data_mem_0_io_cache_req_wmask[2U] = 0U;
        vlSelfRef.nicore__DOT__icache__DOT__data_mem_0_io_cache_req_wmask[3U] = 0U;
    }
    if (vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__iTLB_io_valid) {
        vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT___io_icache_cpu_request_addr_T[0U] 
            = ((- (IData)((0U != (IData)(vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__iTLB__DOT__tlb_state)))) 
               & ((- (IData)((2U != (IData)(vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__iTLB__DOT__tlb_state)))) 
                  & (((5U == (IData)(vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__iTLB__DOT__tlb_state))
                       ? ((IData)(vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__iTLB__DOT__ppn_base) 
                          + (0x00000ff8U & ((IData)(
                                                    (vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__iTLB__DOT__va_reg 
                                                     >> 0x0000001eU)) 
                                            << 3U)))
                       : ((4U == (IData)(vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__iTLB__DOT__tlb_state))
                           ? ((IData)(vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__iTLB__DOT___io_tlb_request_addr_T_4) 
                              + (0x00000ff8U & ((IData)(
                                                        (vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__iTLB__DOT__va_reg 
                                                         >> 0x00000015U)) 
                                                << 3U)))
                           : ((3U == (IData)(vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__iTLB__DOT__tlb_state))
                               ? ((IData)(vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__iTLB__DOT___io_tlb_request_addr_T_4) 
                                  + (0x00000ff8U & 
                                     ((IData)((vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__iTLB__DOT__va_reg 
                                               >> 0x0000000cU)) 
                                      << 3U))) : ((- (IData)(
                                                             (6U 
                                                              != (IData)(vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__iTLB__DOT__tlb_state)))) 
                                                  & ((- (IData)(
                                                                (7U 
                                                                 == (IData)(vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__iTLB__DOT__tlb_state)))) 
                                                     & ((2U 
                                                         == (IData)(vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__iTLB__DOT__page_size_reg))
                                                         ? 
                                                        (((IData)(
                                                                  (vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__iTLB__DOT__pte_reg_ppn 
                                                                   >> 0x00000012U)) 
                                                          << 0x0000001eU) 
                                                         | (0x3fffffffU 
                                                            & (IData)(vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__iTLB__DOT__va_reg)))
                                                         : 
                                                        ((1U 
                                                          == (IData)(vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__iTLB__DOT__page_size_reg))
                                                          ? 
                                                         (((IData)(
                                                                   (vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__iTLB__DOT__pte_reg_ppn 
                                                                    >> 9U)) 
                                                           << 0x00000015U) 
                                                          | (0x001fffffU 
                                                             & (IData)(vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__iTLB__DOT__va_reg)))
                                                          : 
                                                         ((((IData)(vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__iTLB__DOT__pte_reg_ppn) 
                                                            << 0x0000000cU) 
                                                           | (0x00000fffU 
                                                              & (IData)(vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__iTLB__DOT__va_reg))) 
                                                          & (IData)(
                                                                    (0x00ffffffffffffffULL 
                                                                     & (- (QData)((IData)(
                                                                                (0U 
                                                                                == (IData)(vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__iTLB__DOT__page_size_reg))))))))))))))) 
                     & (- (IData)((1U != (IData)(vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__iTLB__DOT__tlb_state)))))));
        vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT___io_icache_cpu_request_addr_T[1U] = 0U;
        vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT___io_icache_cpu_request_addr_T[2U] = 0U;
    } else {
        vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT___io_icache_cpu_request_addr_T[0U] 
            = vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__next_pc[0U];
        vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT___io_icache_cpu_request_addr_T[1U] 
            = vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__next_pc[1U];
        vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT___io_icache_cpu_request_addr_T[2U] 
            = vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__next_pc[2U];
    }
    vlSelfRef.nicore__DOT__icache__DOT__data_mem_0_io_cache_req_index 
        = (0x0000003fU & ((0U == (IData)(vlSelfRef.nicore__DOT__icache__DOT__cache_state))
                           ? ((vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT___io_icache_cpu_request_addr_T[0U] 
                               << 0x0000001cU) | (vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT___io_icache_cpu_request_addr_T[0U] 
                                                  >> 4U))
                           : ((0x0fU == (IData)(vlSelfRef.nicore__DOT__icache__DOT__cache_state))
                               ? ((vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT___io_icache_cpu_request_addr_T[0U] 
                                   << 0x0000001cU) 
                                  | (vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT___io_icache_cpu_request_addr_T[0U] 
                                     >> 4U)) : ((0x10U 
                                                 == (IData)(vlSelfRef.nicore__DOT__icache__DOT__cache_state))
                                                 ? 
                                                ((vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT___io_icache_cpu_request_addr_T[0U] 
                                                  << 0x0000001cU) 
                                                 | (vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT___io_icache_cpu_request_addr_T[0U] 
                                                    >> 4U))
                                                 : 
                                                ((0x11U 
                                                  == (IData)(vlSelfRef.nicore__DOT__icache__DOT__cache_state))
                                                  ? (IData)(vlSelfRef.nicore__DOT__icache__DOT__flush_loop)
                                                  : 
                                                 ((vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT___io_icache_cpu_request_addr_T[0U] 
                                                   << 0x0000001cU) 
                                                  | (vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT___io_icache_cpu_request_addr_T[0U] 
                                                     >> 4U)))))));
    vlSelfRef.nicore__DOT__dcache__DOT__align_addr 
        = ((IData)((vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__clint_io_addr 
                    >> 3U)) << 3U);
    vlSelfRef.__VdfgRegularize_hebeb780c_0_339 = ((
                                                   (~ (IData)(vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__data_cache_tag)) 
                                                   | (IData)(vlSelfRef.__VdfgRegularize_hebeb780c_0_311)) 
                                                  & ((IData)(vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__dcache_flush_tag) 
                                                     | (IData)(vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__ls_stall)));
    vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__dTLB_io_valid 
        = ((IData)(vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__ls_stall) 
           & (IData)(vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__iTLB_io_valid));
    vlSelfRef.nicore__DOT__icache__DOT__align_addr 
        = (0xfffffff8U & vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT___io_icache_cpu_request_addr_T[0U]);
    vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT___io_tlb_ready_T 
        = (1U & (~ (IData)(vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__dTLB_io_valid)));
    vlSelfRef.__VdfgRegularize_hebeb780c_0_332 = ((IData)(vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT___io_tlb_ready_T) 
                                                  & ((2U 
                                                      != (IData)(vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT__tlb_state)) 
                                                     & (0U 
                                                        != (IData)(vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT__tlb_state))));
    vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__dTLB_io_fault 
        = ((- (IData)((1U & (~ (IData)(vlSelfRef.__VdfgRegularize_hebeb780c_0_332))))) 
           & ((- (IData)((0U != (IData)(vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT__tlb_state)))) 
              & (((1U == (IData)(vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT__tlb_state))
                   ? ((- (IData)((IData)(vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__iTLB__DOT___T_3))) 
                      & ((- (IData)((IData)(vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT__matchList_0))) 
                         & ((- (IData)((IData)(vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT___T_186))) 
                            & (IData)(vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT___io_fault_T_4))))
                   : ((5U == (IData)(vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT__tlb_state))
                       ? (((IData)(vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT___T_195)
                            ? (IData)(vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT___io_fault_T_4)
                            : ((- (IData)((IData)(vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT___T_196))) 
                               & ((- (IData)((0U != 
                                              (0x0003ffffU 
                                               & (IData)(
                                                         (vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT___T_197 
                                                          >> 0x0000000aU)))))) 
                                  & (IData)(vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT___io_fault_T_4)))) 
                          & (- (IData)((IData)(vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT___T_191))))
                       : ((4U == (IData)(vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT__tlb_state))
                           ? (((IData)(vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT___T_195)
                                ? (IData)(vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT___io_fault_T_4)
                                : ((- (IData)((IData)(vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT___T_196))) 
                                   & ((- (IData)((0U 
                                                  != 
                                                  (0x000001ffU 
                                                   & (IData)(
                                                             (vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT___T_197 
                                                              >> 0x0000000aU)))))) 
                                      & (IData)(vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT___io_fault_T_4)))) 
                              & (- (IData)((IData)(vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT___T_191))))
                           : ((3U == (IData)(vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT__tlb_state))
                               ? ((- (IData)((IData)(vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT___T_191))) 
                                  & ((- (IData)((IData)(vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT___T_224))) 
                                     & (IData)(vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT___io_fault_T_4)))
                               : (((IData)(vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT___T_249)
                                    ? ((- (IData)((IData)(vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT___T_255))) 
                                       & (IData)(vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT___io_fault_T_4))
                                    : (IData)(vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT___io_fault_T_4)) 
                                  & (- (IData)((6U 
                                                == (IData)(vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT__tlb_state))))))))) 
                 & (- (IData)((2U != (IData)(vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT__tlb_state)))))));
    vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__dTLB_io_tlb_request_valid 
        = ((~ (IData)(vlSelfRef.__VdfgRegularize_hebeb780c_0_332)) 
           & ((0U != (IData)(vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT__tlb_state)) 
              & ((2U != (IData)(vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT__tlb_state)) 
                 & (((5U == (IData)(vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT__tlb_state)) 
                     | ((4U == (IData)(vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT__tlb_state)) 
                        | ((3U == (IData)(vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT__tlb_state)) 
                           | ((7U == (IData)(vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT__tlb_state)) 
                              & (6U != (IData)(vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT__tlb_state)))))) 
                    & (1U != (IData)(vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT__tlb_state))))));
    vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__dTLB_io_tlb_ready 
        = (1U & (((0U == (IData)(vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT__tlb_state))
                   ? (IData)(vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT___io_tlb_ready_T)
                   : (((1U == (IData)(vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT__tlb_state))
                        ? ((IData)(vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__iTLB__DOT___T_3) 
                           & ((IData)(vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT___T_186) 
                              & (IData)(vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT__matchList_0)))
                        : ((5U == (IData)(vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT__tlb_state))
                            ? ((((IData)(vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT___T_196) 
                                 & (0U != (0x0003ffffU 
                                           & (IData)(
                                                     (vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT___T_197 
                                                      >> 0x0000000aU))))) 
                                | (IData)(vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT___T_195)) 
                               & (IData)(vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT___T_191))
                            : ((4U == (IData)(vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT__tlb_state))
                                ? ((((IData)(vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT___T_196) 
                                     & (0U != (0x000001ffU 
                                               & (IData)(
                                                         (vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT___T_197 
                                                          >> 0x0000000aU))))) 
                                    | (IData)(vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT___T_195)) 
                                   & (IData)(vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT___T_191))
                                : ((3U == (IData)(vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT__tlb_state))
                                    ? ((IData)(vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT___T_224) 
                                       & (IData)(vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT___T_191))
                                    : ((6U == (IData)(vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT__tlb_state))
                                        ? ((~ (IData)(vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT___T_249)) 
                                           | (IData)(vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT___T_255))
                                        : ((7U == (IData)(vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT__tlb_state)) 
                                           & (IData)(vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT___T_191))))))) 
                      | (2U == (IData)(vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT__tlb_state)))) 
                 | (IData)(vlSelfRef.__VdfgRegularize_hebeb780c_0_332)));
    vlSelfRef.nicore__DOT__datapath__DOT__memory_stage_io_dcache_cpu_request_valid 
        = ((IData)(vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__iTLB_io_valid)
            ? (((~ (IData)(vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__data_cache_tag)) 
                & (IData)(vlSelfRef.nicore__DOT__datapath__DOT__execute_stage__DOT__dcache_flush_tag)) 
               | ((IData)(vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__ls_stall) 
                  & ((~ (IData)(vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__dTLB_io_tlb_ready)) 
                     & (IData)(vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__dTLB_io_tlb_request_valid))))
            : (IData)(vlSelfRef.__VdfgRegularize_hebeb780c_0_339));
    vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__mem_response 
        = (((IData)(vlSelfRef.nicore__DOT__datapath__DOT__fetch_stage__DOT__iTLB_io_valid)
             ? (IData)(vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__dTLB_io_tlb_request_valid)
             : (IData)(vlSelfRef.__VdfgRegularize_hebeb780c_0_339)) 
           & (IData)(vlSelfRef.nicore__DOT__datapath__DOT__memory_stage__DOT__dTLB_io_cache_response_ready));
}

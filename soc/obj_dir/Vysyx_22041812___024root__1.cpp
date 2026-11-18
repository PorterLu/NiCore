// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See Vysyx_22041812.h for the primary calling header

#include "Vysyx_22041812__pch.h"

void Vysyx_22041812___024root___nba_sequent__TOP__1(Vysyx_22041812___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vysyx_22041812___024root___nba_sequent__TOP__1\n"); );
    Vysyx_22041812__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
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
    VlWide<3>/*95:0*/ __Vtemp_2;
    VlWide<3>/*95:0*/ __Vtemp_3;
    VlWide<4>/*127:0*/ __Vtemp_5;
    // Body
    vlSelfRef.ysyx_22041812__DOT__datapath__DOT__memory_stage_io_tlb_flush_all 
        = ((0x0180U == (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__memory_stage__DOT__mw_pipe_reg_csr_write_addr)) 
           & (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__csr__DOT__writeEn));
    if (vlSelfRef.reset) {
        vlSelfRef.ysyx_22041812__DOT__datapath__DOT__execute_stage__DOT__em_pipe_reg_csr_write_addr = 0U;
        vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__de_pipe_reg_csr_write_addr = 0U;
        vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst = 0x00000013U;
        vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__pc[0U] = 0x7ffffffcU;
        vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__pc[1U] = 0U;
        vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__pc[2U] = 0U;
    } else {
        if (((IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage_io_flush_em) 
             & (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT___T_1))) {
            vlSelfRef.ysyx_22041812__DOT__datapath__DOT__execute_stage__DOT__em_pipe_reg_csr_write_addr = 0U;
        } else if (((IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT___T_1) 
                    & (~ (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage_io_flush_em)))) {
            vlSelfRef.ysyx_22041812__DOT__datapath__DOT__execute_stage__DOT__em_pipe_reg_csr_write_addr 
                = vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__de_pipe_reg_csr_write_addr;
        }
        if (((IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__execute_stage__DOT__multiplier_io_flush) 
             & (~ (IData)(vlSelfRef.io_stall)))) {
            vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__de_pipe_reg_csr_write_addr = 0U;
        } else if (((IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT___T_1) 
                    & (~ (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__execute_stage__DOT__multiplier_io_flush)))) {
            vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__de_pipe_reg_csr_write_addr 
                = (vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst 
                   >> 0x14U);
        }
        if (((IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage_io_flush_fd) 
             & (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT___T_1))) {
            vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst = 0x00000013U;
        } else if (((IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT___T_1) 
                    & (~ (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage_io_flush_fd)))) {
            vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst 
                = ((IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__started)
                    ? 0x00000013U : ((4U & vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__pc[0U])
                                      ? (IData)((vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__iTLB__DOT___T_197 
                                                 >> 0x00000020U))
                                      : (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__iTLB__DOT___T_197)));
        }
        if (vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage_io_csr_trap) {
            vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__pc[0U] 
                = (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage_io_csr_trapVec);
            vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__pc[1U] 
                = (IData)((vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage_io_csr_trapVec 
                           >> 0x00000020U));
            vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__pc[2U] = 0U;
        } else if (vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT___next_pc_T_4) {
            vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__pc[0U] 
                = vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT___next_pc_T_6[0U];
            vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__pc[1U] 
                = vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT___next_pc_T_6[1U];
            vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__pc[2U] 
                = vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT___next_pc_T_6[2U];
        } else if (vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage_io_csr_atomic) {
            vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__pc[0U] 
                = (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage_io_csr_next_fetch);
            vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__pc[1U] 
                = (IData)((vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage_io_csr_next_fetch 
                           >> 0x00000020U));
            vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__pc[2U] = 0U;
        } else {
            vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__pc[0U] 
                = vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT___next_pc_T_12[0U];
            vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__pc[1U] 
                = vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT___next_pc_T_12[1U];
            vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__pc[2U] 
                = vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT___next_pc_T_12[2U];
        }
    }
    vlSelfRef.ysyx_22041812__DOT__datapath__DOT__execute_stage__DOT___multiplier_io_mul_valid_T_2 
        = (1U & (~ (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__execute_stage__DOT__src_unready)));
    vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__iTLB__DOT___T_3 
        = (1U & (~ (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__iTLB_io_stall)));
    vlSelfRef.ysyx_22041812__DOT__datapath__DOT__csr__DOT__writeData 
        = ((5U == (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__memory_stage__DOT__mw_pipe_reg_csr_write_op))
            ? ((~ vlSelfRef.ysyx_22041812__DOT__datapath__DOT__memory_stage__DOT__mw_pipe_reg_csr_write_data) 
               & vlSelfRef.ysyx_22041812__DOT__datapath__DOT__csr__DOT__csrData)
            : ((4U == (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__memory_stage__DOT__mw_pipe_reg_csr_write_op))
                ? (vlSelfRef.ysyx_22041812__DOT__datapath__DOT__memory_stage__DOT__mw_pipe_reg_csr_write_data 
                   | vlSelfRef.ysyx_22041812__DOT__datapath__DOT__csr__DOT__csrData)
                : ((3U == (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__memory_stage__DOT__mw_pipe_reg_csr_write_op))
                    ? vlSelfRef.ysyx_22041812__DOT__datapath__DOT__memory_stage__DOT__mw_pipe_reg_csr_write_data
                    : ((2U == (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__memory_stage__DOT__mw_pipe_reg_csr_write_op))
                        ? vlSelfRef.ysyx_22041812__DOT__datapath__DOT__memory_stage__DOT__mw_pipe_reg_csr_write_data
                        : vlSelfRef.ysyx_22041812__DOT__datapath__DOT__csr__DOT__csrData))));
    vlSelfRef.ysyx_22041812__DOT__datapath__DOT__memory_stage__DOT__dTLB_io_tlb_flush_vpn 
        = (0x07ffffffU & ((IData)((vlSelfRef.ysyx_22041812__DOT__datapath__DOT__execute_stage__DOT__em_pipe_reg_sfence_rs1 
                                   >> 0x0000000cU)) 
                          & (- (IData)((1U & (~ (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__memory_stage_io_tlb_flush_all)))))));
    vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage_io_sfence_rs1 
        = (vlSelfRef.ysyx_22041812__DOT__datapath__DOT__execute_stage__DOT__em_pipe_reg_sfence_rs1 
           & (- (QData)((IData)((1U & (~ (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__memory_stage_io_tlb_flush_all)))))));
    vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__iTLB_io_tlb_flush_asid 
        = (0x0000ffffU & ((IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__execute_stage__DOT__em_pipe_reg_sfence_rs2) 
                          & (IData)((- (QData)((IData)(
                                                       (1U 
                                                        & (~ (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__memory_stage_io_tlb_flush_all)))))))));
    vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__iTLB_io_flush 
        = ((IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__memory_stage_io_tlb_flush_all) 
           | (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__sfence_em));
    vlSelfRef.ysyx_22041812__DOT__datapath__DOT__execute_stage__DOT__multiplier_io_mul_valid 
        = ((IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__execute_stage__DOT___multiplier_io_mul_valid_T_2) 
           & (IData)(vlSelfRef.__VdfgRegularize_hebeb780c_0_408));
    vlSelfRef.ysyx_22041812__DOT__datapath__DOT__execute_stage__DOT__divider_io_div_valid 
        = ((IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__execute_stage__DOT___multiplier_io_mul_valid_T_2) 
           & (((0x10U == (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__de_pipe_reg_alu_op)) 
               | ((0x0eU == (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__de_pipe_reg_alu_op)) 
                  | (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__execute_stage__DOT___divider_io_div_valid_T_2))) 
              & (IData)(vlSelfRef.__VdfgRegularize_hebeb780c_0_407)));
    vlSelfRef.ysyx_22041812__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT___T_191 
        = ((IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__iTLB__DOT___T_3) 
           & (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__memory_stage__DOT__dTLB_io_cache_response_ready));
    vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__iTLB__DOT___T_191 
        = ((IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__iTLB__DOT___T_3) 
           & (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__iTLB_io_cache_response_ready));
    vlSelfRef.ysyx_22041812__DOT__datapath__DOT__csr__DOT___sepc_data_T_1 
        = (0xfffffffffffffffcULL & vlSelfRef.ysyx_22041812__DOT__datapath__DOT__csr__DOT__writeData);
    if (vlSelfRef.ysyx_22041812__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT___T_191) {
        vlSelfRef.ysyx_22041812__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT___GEN_386 
            = (1U & (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT___T_197));
        vlSelfRef.ysyx_22041812__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT___GEN_387 
            = (1U & (IData)((vlSelfRef.ysyx_22041812__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT___T_197 
                             >> 1U)));
        vlSelfRef.ysyx_22041812__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT___GEN_388 
            = (1U & (IData)((vlSelfRef.ysyx_22041812__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT___T_197 
                             >> 2U)));
        vlSelfRef.ysyx_22041812__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT___GEN_389 
            = (1U & (IData)((vlSelfRef.ysyx_22041812__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT___T_197 
                             >> 3U)));
        vlSelfRef.ysyx_22041812__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT___GEN_390 
            = (1U & (IData)((vlSelfRef.ysyx_22041812__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT___T_197 
                             >> 4U)));
        vlSelfRef.ysyx_22041812__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT___GEN_391 
            = (1U & (IData)((vlSelfRef.ysyx_22041812__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT___T_197 
                             >> 5U)));
        vlSelfRef.ysyx_22041812__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT___GEN_392 
            = (1U & (IData)((vlSelfRef.ysyx_22041812__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT___T_197 
                             >> 6U)));
        vlSelfRef.ysyx_22041812__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT___GEN_393 
            = (1U & (IData)((vlSelfRef.ysyx_22041812__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT___T_197 
                             >> 7U)));
        vlSelfRef.ysyx_22041812__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT___GEN_394 
            = (3U & (IData)((vlSelfRef.ysyx_22041812__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT___T_197 
                             >> 8U)));
        vlSelfRef.ysyx_22041812__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT___GEN_395 
            = (0x00000fffffffffffULL & (vlSelfRef.ysyx_22041812__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT___T_197 
                                        >> 0x0000000aU));
    } else {
        vlSelfRef.ysyx_22041812__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT___GEN_386 
            = (1U & (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT__pte_reg_V));
        vlSelfRef.ysyx_22041812__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT___GEN_387 
            = (1U & (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT__pte_reg_R));
        vlSelfRef.ysyx_22041812__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT___GEN_388 
            = (1U & (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT__pte_reg_W));
        vlSelfRef.ysyx_22041812__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT___GEN_389 
            = (1U & (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT__pte_reg_X));
        vlSelfRef.ysyx_22041812__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT___GEN_390 
            = (1U & (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT__pte_reg_U));
        vlSelfRef.ysyx_22041812__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT___GEN_391 
            = (1U & (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT__pte_reg_G));
        vlSelfRef.ysyx_22041812__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT___GEN_392 
            = (1U & (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT__pte_reg_A));
        vlSelfRef.ysyx_22041812__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT___GEN_393 
            = (1U & (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT__pte_reg_D));
        vlSelfRef.ysyx_22041812__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT___GEN_394 
            = (3U & (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT__pte_reg_RSW));
        vlSelfRef.ysyx_22041812__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT___GEN_395 
            = (0x00000fffffffffffULL & vlSelfRef.ysyx_22041812__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT__pte_reg_ppn);
    }
    vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__iTLB__DOT___T_197 
        = ((- (QData)((IData)((0U != (IData)(vlSelfRef.ysyx_22041812__DOT__icache__DOT__cache_state))))) 
           & ((- (QData)((IData)((0x0fU != (IData)(vlSelfRef.ysyx_22041812__DOT__icache__DOT__cache_state))))) 
              & ((- (QData)((IData)((0x10U != (IData)(vlSelfRef.ysyx_22041812__DOT__icache__DOT__cache_state))))) 
                 & ((- (QData)((IData)((0x11U != (IData)(vlSelfRef.ysyx_22041812__DOT__icache__DOT__cache_state))))) 
                    & ((- (QData)((IData)((0x13U != (IData)(vlSelfRef.ysyx_22041812__DOT__icache__DOT__cache_state))))) 
                       & (((3U == (IData)(vlSelfRef.ysyx_22041812__DOT__icache__DOT__cache_state))
                            ? vlSelfRef.io_master_rdata
                            : ((- (QData)((IData)((4U 
                                                   != (IData)(vlSelfRef.ysyx_22041812__DOT__icache__DOT__cache_state))))) 
                               & ((- (QData)((IData)(
                                                     (5U 
                                                      != (IData)(vlSelfRef.ysyx_22041812__DOT__icache__DOT__cache_state))))) 
                                  & ((- (QData)((IData)(
                                                        (6U 
                                                         != (IData)(vlSelfRef.ysyx_22041812__DOT__icache__DOT__cache_state))))) 
                                     & (vlSelfRef.ysyx_22041812__DOT__icache__DOT__tmp_response_data 
                                        & (- (QData)((IData)(
                                                             (0x0cU 
                                                              == (IData)(vlSelfRef.ysyx_22041812__DOT__icache__DOT__cache_state)))))))))) 
                          & (- (QData)((IData)((1U 
                                                != (IData)(vlSelfRef.ysyx_22041812__DOT__icache__DOT__cache_state)))))))))));
    vlSelfRef.ysyx_22041812__DOT__datapath__DOT__started 
        = vlSelfRef.reset;
    vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__amo_key 
        = ((0x000000f8U & (vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst 
                           >> 0x00000018U)) | (7U & 
                                               (vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst 
                                                >> 0x0000000cU)));
    __VdfgRegularize_hebeb780c_0_315 = ((0x0323U == 
                                         (vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst 
                                          >> 0x00000014U)) 
                                        | ((0x0324U 
                                            == (vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst 
                                                >> 0x00000014U)) 
                                           | ((0x0325U 
                                               == (vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst 
                                                   >> 0x00000014U)) 
                                              | ((0x0326U 
                                                  == 
                                                  (vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst 
                                                   >> 0x00000014U)) 
                                                 | ((0x0b03U 
                                                     == 
                                                     (vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst 
                                                      >> 0x00000014U)) 
                                                    | ((0x0b04U 
                                                        == 
                                                        (vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst 
                                                         >> 0x00000014U)) 
                                                       | ((0x0b05U 
                                                           == 
                                                           (vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst 
                                                            >> 0x00000014U)) 
                                                          | ((0x0b06U 
                                                              == 
                                                              (vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst 
                                                               >> 0x00000014U)) 
                                                             | ((0x03b0U 
                                                                 == 
                                                                 (vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst 
                                                                  >> 0x00000014U)) 
                                                                | ((0x03b1U 
                                                                    == 
                                                                    (vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst 
                                                                     >> 0x00000014U)) 
                                                                   | ((0x03b2U 
                                                                       == 
                                                                       (vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst 
                                                                        >> 0x00000014U)) 
                                                                      | ((0x03b3U 
                                                                          == 
                                                                          (vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst 
                                                                           >> 0x00000014U)) 
                                                                         | ((0x03b4U 
                                                                             == 
                                                                             (vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst 
                                                                              >> 0x00000014U)) 
                                                                            | ((0x03b5U 
                                                                                == 
                                                                                (vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst 
                                                                                >> 0x00000014U)) 
                                                                               | ((0x03b6U 
                                                                                == 
                                                                                (vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst 
                                                                                >> 0x00000014U)) 
                                                                                | ((0x03b7U 
                                                                                == 
                                                                                (vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst 
                                                                                >> 0x00000014U)) 
                                                                                | ((0x03b8U 
                                                                                == 
                                                                                (vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst 
                                                                                >> 0x00000014U)) 
                                                                                | ((0x03b9U 
                                                                                == 
                                                                                (vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst 
                                                                                >> 0x00000014U)) 
                                                                                | ((0x03baU 
                                                                                == 
                                                                                (vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst 
                                                                                >> 0x00000014U)) 
                                                                                | ((0x03bbU 
                                                                                == 
                                                                                (vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst 
                                                                                >> 0x00000014U)) 
                                                                                | ((0x03bcU 
                                                                                == 
                                                                                (vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst 
                                                                                >> 0x00000014U)) 
                                                                                | ((0x03bdU 
                                                                                == 
                                                                                (vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst 
                                                                                >> 0x00000014U)) 
                                                                                | ((0x03beU 
                                                                                == 
                                                                                (vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst 
                                                                                >> 0x00000014U)) 
                                                                                | (0x03bfU 
                                                                                == 
                                                                                (vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst 
                                                                                >> 0x00000014U)))))))))))))))))))))))));
    vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__immGen__DOT___Iimm_T_1 
        = (- (IData)((vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst 
                      >> 0x0000001fU)));
    vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_191 
        = (0x0000000fU == (0x0001ffffU & vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst));
    vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T 
        = (0x0000007fU & vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst);
    vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_6 
        = (0x0000707fU & vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst);
    vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_42 
        = (0xf9f0707fU & vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst);
    vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_47 
        = (0x3000202fU == (0xf000707fU & vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst));
    vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_49 
        = (0x3000302fU == (0xf000707fU & vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst));
    vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_51 
        = (0x1000202fU == (0xf000707fU & vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst));
    vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_53 
        = (0x1000302fU == (0xf000707fU & vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst));
    vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_55 
        = (0x0000202fU == (0xf000707fU & vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst));
    vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_57 
        = (0x0000302fU == (0xf000707fU & vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst));
    vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_59 
        = (0x4000202fU == (0xf000707fU & vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst));
    vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_61 
        = (0x4000302fU == (0xf000707fU & vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst));
    vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_63 
        = (0xc000202fU == (0xf000707fU & vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst));
    vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_65 
        = (0xc000302fU == (0xf000707fU & vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst));
    vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_67 
        = (0x8000202fU == (0xf000707fU & vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst));
    vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_100 
        = (0xfc00707fU & vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst);
    vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_69 
        = (0x8000302fU == (0xf000707fU & vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst));
    vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_102 
        = (0xfe00707fU & vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst);
    if (vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__iTLB__DOT___T_191) {
        vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__iTLB__DOT___GEN_386 
            = (1U & (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__iTLB__DOT___T_197));
        vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__iTLB__DOT___GEN_387 
            = (1U & (IData)((vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__iTLB__DOT___T_197 
                             >> 1U)));
        vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__iTLB__DOT___GEN_388 
            = (1U & (IData)((vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__iTLB__DOT___T_197 
                             >> 2U)));
        vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__iTLB__DOT___GEN_389 
            = (1U & (IData)((vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__iTLB__DOT___T_197 
                             >> 3U)));
        vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__iTLB__DOT___GEN_390 
            = (1U & (IData)((vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__iTLB__DOT___T_197 
                             >> 4U)));
        vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__iTLB__DOT___GEN_391 
            = (1U & (IData)((vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__iTLB__DOT___T_197 
                             >> 5U)));
        vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__iTLB__DOT___GEN_392 
            = (1U & (IData)((vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__iTLB__DOT___T_197 
                             >> 6U)));
        vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__iTLB__DOT___GEN_393 
            = (1U & (IData)((vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__iTLB__DOT___T_197 
                             >> 7U)));
        vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__iTLB__DOT___GEN_394 
            = (3U & (IData)((vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__iTLB__DOT___T_197 
                             >> 8U)));
        vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__iTLB__DOT___GEN_395 
            = (0x00000fffffffffffULL & (vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__iTLB__DOT___T_197 
                                        >> 0x0000000aU));
    } else {
        vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__iTLB__DOT___GEN_386 
            = (1U & (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__iTLB__DOT__pte_reg_V));
        vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__iTLB__DOT___GEN_387 
            = (1U & (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__iTLB__DOT__pte_reg_R));
        vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__iTLB__DOT___GEN_388 
            = (1U & (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__iTLB__DOT__pte_reg_W));
        vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__iTLB__DOT___GEN_389 
            = (1U & (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__iTLB__DOT__pte_reg_X));
        vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__iTLB__DOT___GEN_390 
            = (1U & (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__iTLB__DOT__pte_reg_U));
        vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__iTLB__DOT___GEN_391 
            = (1U & (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__iTLB__DOT__pte_reg_G));
        vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__iTLB__DOT___GEN_392 
            = (1U & (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__iTLB__DOT__pte_reg_A));
        vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__iTLB__DOT___GEN_393 
            = (1U & (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__iTLB__DOT__pte_reg_D));
        vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__iTLB__DOT___GEN_394 
            = (3U & (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__iTLB__DOT__pte_reg_RSW));
        vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__iTLB__DOT___GEN_395 
            = (0x00000fffffffffffULL & vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__iTLB__DOT__pte_reg_ppn);
    }
    vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__iTLB__DOT___T_195 
        = (1U & ((~ (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__iTLB__DOT___T_197)) 
                 | (IData)((4ULL == (6ULL & vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__iTLB__DOT___T_197)))));
    vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__iTLB__DOT___T_196 
        = (IData)((0ULL != (0x000000000000000aULL & vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__iTLB__DOT___T_197)));
    vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage_io_csr_next_fetch 
        = ((IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT___csr_atomic_flush_T_1)
            ? vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT___csr_write_data_T_8
            : ((IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT___csr_atomic_flush_T_3)
                ? vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT___next_pc_T_8
                : ((IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT___csr_atomic_flush_T_5)
                    ? (4ULL + vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__de_pipe_reg_pc)
                    : (4ULL + vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_pc))));
    vlSelfRef.ysyx_22041812__DOT__datapath__DOT__csr__DOT__readable 
        = ((0x0c00U == (vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst 
                        >> 0x00000014U)) | ((0x0c02U 
                                             == (vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst 
                                                 >> 0x00000014U)) 
                                            | ((0x0100U 
                                                == 
                                                (vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst 
                                                 >> 0x00000014U)) 
                                               | ((0x0104U 
                                                   == 
                                                   (vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst 
                                                    >> 0x00000014U)) 
                                                  | ((0x0105U 
                                                      == 
                                                      (vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst 
                                                       >> 0x00000014U)) 
                                                     | ((0x0106U 
                                                         == 
                                                         (vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst 
                                                          >> 0x00000014U)) 
                                                        | ((0x0140U 
                                                            == 
                                                            (vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst 
                                                             >> 0x00000014U)) 
                                                           | ((0x0141U 
                                                               == 
                                                               (vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst 
                                                                >> 0x00000014U)) 
                                                              | ((0x0142U 
                                                                  == 
                                                                  (vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst 
                                                                   >> 0x00000014U)) 
                                                                 | ((0x0143U 
                                                                     == 
                                                                     (vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst 
                                                                      >> 0x00000014U)) 
                                                                    | ((0x0144U 
                                                                        == 
                                                                        (vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst 
                                                                         >> 0x00000014U)) 
                                                                       | ((0x0180U 
                                                                           == 
                                                                           (vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst 
                                                                            >> 0x00000014U)) 
                                                                          | ((0x0f11U 
                                                                              == 
                                                                              (vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst 
                                                                               >> 0x00000014U)) 
                                                                             | ((0x0f12U 
                                                                                == 
                                                                                (vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst 
                                                                                >> 0x00000014U)) 
                                                                                | ((0x0f13U 
                                                                                == 
                                                                                (vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst 
                                                                                >> 0x00000014U)) 
                                                                                | ((0x0f14U 
                                                                                == 
                                                                                (vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst 
                                                                                >> 0x00000014U)) 
                                                                                | ((0x0300U 
                                                                                == 
                                                                                (vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst 
                                                                                >> 0x00000014U)) 
                                                                                | ((0x0301U 
                                                                                == 
                                                                                (vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst 
                                                                                >> 0x00000014U)) 
                                                                                | ((0x0302U 
                                                                                == 
                                                                                (vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst 
                                                                                >> 0x00000014U)) 
                                                                                | ((0x0303U 
                                                                                == 
                                                                                (vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst 
                                                                                >> 0x00000014U)) 
                                                                                | ((0x0304U 
                                                                                == 
                                                                                (vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst 
                                                                                >> 0x00000014U)) 
                                                                                | ((0x0305U 
                                                                                == 
                                                                                (vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst 
                                                                                >> 0x00000014U)) 
                                                                                | ((0x0306U 
                                                                                == 
                                                                                (vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst 
                                                                                >> 0x00000014U)) 
                                                                                | ((0x0340U 
                                                                                == 
                                                                                (vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst 
                                                                                >> 0x00000014U)) 
                                                                                | ((0x0341U 
                                                                                == 
                                                                                (vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst 
                                                                                >> 0x00000014U)) 
                                                                                | ((0x0342U 
                                                                                == 
                                                                                (vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst 
                                                                                >> 0x00000014U)) 
                                                                                | ((0x0343U 
                                                                                == 
                                                                                (vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst 
                                                                                >> 0x00000014U)) 
                                                                                | ((0x0344U 
                                                                                == 
                                                                                (vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst 
                                                                                >> 0x00000014U)) 
                                                                                | ((0x0b00U 
                                                                                == 
                                                                                (vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst 
                                                                                >> 0x00000014U)) 
                                                                                | ((0x0b02U 
                                                                                == 
                                                                                (vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst 
                                                                                >> 0x00000014U)) 
                                                                                | ((0x03a0U 
                                                                                == 
                                                                                (vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst 
                                                                                >> 0x00000014U)) 
                                                                                | ((0x03a1U 
                                                                                == 
                                                                                (vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst 
                                                                                >> 0x00000014U)) 
                                                                                | ((0x03a2U 
                                                                                == 
                                                                                (vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst 
                                                                                >> 0x00000014U)) 
                                                                                | ((0x03a3U 
                                                                                == 
                                                                                (vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst 
                                                                                >> 0x00000014U)) 
                                                                                | ((0x030aU 
                                                                                == 
                                                                                (vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst 
                                                                                >> 0x00000014U)) 
                                                                                | ((0x010aU 
                                                                                == 
                                                                                (vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst 
                                                                                >> 0x00000014U)) 
                                                                                | ((0x0747U 
                                                                                == 
                                                                                (vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst 
                                                                                >> 0x00000014U)) 
                                                                                | ((0x0f15U 
                                                                                == 
                                                                                (vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst 
                                                                                >> 0x00000014U)) 
                                                                                | ((0x0320U 
                                                                                == 
                                                                                (vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst 
                                                                                >> 0x00000014U)) 
                                                                                | ((0x07a0U 
                                                                                == 
                                                                                (vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst 
                                                                                >> 0x00000014U)) 
                                                                                | ((0x07a1U 
                                                                                == 
                                                                                (vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst 
                                                                                >> 0x00000014U)) 
                                                                                | ((0x07a2U 
                                                                                == 
                                                                                (vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst 
                                                                                >> 0x00000014U)) 
                                                                                | ((0x07a3U 
                                                                                == 
                                                                                (vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst 
                                                                                >> 0x00000014U)) 
                                                                                | ((0x07a8U 
                                                                                == 
                                                                                (vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst 
                                                                                >> 0x00000014U)) 
                                                                                | (IData)(__VdfgRegularize_hebeb780c_0_315)))))))))))))))))))))))))))))))))))))))))))));
    vlSelfRef.ysyx_22041812__DOT__datapath__DOT__csr__DOT__writable 
        = ((0x0c00U != (vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst 
                        >> 0x00000014U)) & ((0x0c02U 
                                             != (vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst 
                                                 >> 0x00000014U)) 
                                            & ((0x0100U 
                                                == 
                                                (vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst 
                                                 >> 0x00000014U)) 
                                               | ((0x0104U 
                                                   == 
                                                   (vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst 
                                                    >> 0x00000014U)) 
                                                  | ((0x0105U 
                                                      == 
                                                      (vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst 
                                                       >> 0x00000014U)) 
                                                     | ((0x0106U 
                                                         == 
                                                         (vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst 
                                                          >> 0x00000014U)) 
                                                        | ((0x0140U 
                                                            == 
                                                            (vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst 
                                                             >> 0x00000014U)) 
                                                           | ((0x0141U 
                                                               == 
                                                               (vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst 
                                                                >> 0x00000014U)) 
                                                              | ((0x0142U 
                                                                  == 
                                                                  (vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst 
                                                                   >> 0x00000014U)) 
                                                                 | ((0x0143U 
                                                                     == 
                                                                     (vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst 
                                                                      >> 0x00000014U)) 
                                                                    | ((0x0144U 
                                                                        == 
                                                                        (vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst 
                                                                         >> 0x00000014U)) 
                                                                       | ((0x0180U 
                                                                           == 
                                                                           (vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst 
                                                                            >> 0x00000014U)) 
                                                                          | ((0x0f11U 
                                                                              != 
                                                                              (vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst 
                                                                               >> 0x00000014U)) 
                                                                             & ((0x0f12U 
                                                                                != 
                                                                                (vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst 
                                                                                >> 0x00000014U)) 
                                                                                & ((0x0f13U 
                                                                                != 
                                                                                (vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst 
                                                                                >> 0x00000014U)) 
                                                                                & ((0x0f14U 
                                                                                != 
                                                                                (vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst 
                                                                                >> 0x00000014U)) 
                                                                                & ((0x0300U 
                                                                                == 
                                                                                (vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst 
                                                                                >> 0x00000014U)) 
                                                                                | ((0x0301U 
                                                                                != 
                                                                                (vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst 
                                                                                >> 0x00000014U)) 
                                                                                & ((0x0302U 
                                                                                == 
                                                                                (vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst 
                                                                                >> 0x00000014U)) 
                                                                                | ((0x0303U 
                                                                                == 
                                                                                (vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst 
                                                                                >> 0x00000014U)) 
                                                                                | ((0x0304U 
                                                                                == 
                                                                                (vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst 
                                                                                >> 0x00000014U)) 
                                                                                | ((0x0305U 
                                                                                == 
                                                                                (vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst 
                                                                                >> 0x00000014U)) 
                                                                                | ((0x0306U 
                                                                                == 
                                                                                (vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst 
                                                                                >> 0x00000014U)) 
                                                                                | ((0x0340U 
                                                                                == 
                                                                                (vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst 
                                                                                >> 0x00000014U)) 
                                                                                | ((0x0341U 
                                                                                == 
                                                                                (vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst 
                                                                                >> 0x00000014U)) 
                                                                                | ((0x0342U 
                                                                                == 
                                                                                (vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst 
                                                                                >> 0x00000014U)) 
                                                                                | ((0x0343U 
                                                                                == 
                                                                                (vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst 
                                                                                >> 0x00000014U)) 
                                                                                | ((0x0344U 
                                                                                == 
                                                                                (vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst 
                                                                                >> 0x00000014U)) 
                                                                                | ((0x0b00U 
                                                                                == 
                                                                                (vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst 
                                                                                >> 0x00000014U)) 
                                                                                | ((0x0b02U 
                                                                                == 
                                                                                (vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst 
                                                                                >> 0x00000014U)) 
                                                                                | ((0x03a0U 
                                                                                == 
                                                                                (vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst 
                                                                                >> 0x00000014U)) 
                                                                                | ((0x03a1U 
                                                                                == 
                                                                                (vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst 
                                                                                >> 0x00000014U)) 
                                                                                | ((0x03a2U 
                                                                                == 
                                                                                (vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst 
                                                                                >> 0x00000014U)) 
                                                                                | ((0x03a3U 
                                                                                == 
                                                                                (vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst 
                                                                                >> 0x00000014U)) 
                                                                                | ((0x030aU 
                                                                                == 
                                                                                (vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst 
                                                                                >> 0x00000014U)) 
                                                                                | ((0x010aU 
                                                                                == 
                                                                                (vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst 
                                                                                >> 0x00000014U)) 
                                                                                | ((0x0747U 
                                                                                == 
                                                                                (vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst 
                                                                                >> 0x00000014U)) 
                                                                                | ((0x0f15U 
                                                                                != 
                                                                                (vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst 
                                                                                >> 0x00000014U)) 
                                                                                & ((0x0320U 
                                                                                == 
                                                                                (vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst 
                                                                                >> 0x00000014U)) 
                                                                                | ((0x07a0U 
                                                                                != 
                                                                                (vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst 
                                                                                >> 0x00000014U)) 
                                                                                & ((0x07a1U 
                                                                                != 
                                                                                (vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst 
                                                                                >> 0x00000014U)) 
                                                                                & ((0x07a2U 
                                                                                != 
                                                                                (vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst 
                                                                                >> 0x00000014U)) 
                                                                                & ((0x07a3U 
                                                                                != 
                                                                                (vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst 
                                                                                >> 0x00000014U)) 
                                                                                & ((0x07a8U 
                                                                                != 
                                                                                (vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst 
                                                                                >> 0x00000014U)) 
                                                                                & (IData)(__VdfgRegularize_hebeb780c_0_315)))))))))))))))))))))))))))))))))))))))))))));
    vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__immGen__DOT__Iimm 
        = (((QData)((IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__immGen__DOT___Iimm_T_1)) 
            << 0x0000000cU) | (QData)((IData)((vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst 
                                               >> 0x00000014U))));
    vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_1173 
        = (1U & (~ ((0x30200073U == vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst) 
                    | ((0x10200073U == vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst) 
                       | ((0x00000073U == vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst) 
                          | ((0x00100073U == vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst) 
                             | ((0x0000100fU == vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst) 
                                | ((IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_191) 
                                   | (0x10500073U == vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst)))))))));
    vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_1035 
        = (7U & (- (IData)((IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_69))));
    vlSelfRef.__VdfgRegularize_hebeb780c_0_307 = ((0x00000033U 
                                                   == vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_102) 
                                                  | ((0x0000003bU 
                                                      == vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_102) 
                                                     | ((0x40000033U 
                                                         == vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_102) 
                                                        | ((0x4000003bU 
                                                            == vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_102) 
                                                           | ((0x00001033U 
                                                               == vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_102) 
                                                              | ((0x0000103bU 
                                                                  == vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_102) 
                                                                 | ((0x00002033U 
                                                                     == vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_102) 
                                                                    | ((0x00003033U 
                                                                        == vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_102) 
                                                                       | ((0x00004033U 
                                                                           == vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_102) 
                                                                          | ((0x00005033U 
                                                                              == vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_102) 
                                                                             | ((0x0000503bU 
                                                                                == vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_102) 
                                                                                | ((0x40005033U 
                                                                                == vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_102) 
                                                                                | ((0x4000503bU 
                                                                                == vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_102) 
                                                                                | ((0x00006033U 
                                                                                == vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_102) 
                                                                                | ((0x00007033U 
                                                                                == vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_102) 
                                                                                | ((0x02000033U 
                                                                                == vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_102) 
                                                                                | ((0x0200003bU 
                                                                                == vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_102) 
                                                                                | ((0x02001033U 
                                                                                == vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_102) 
                                                                                | ((0x02003033U 
                                                                                == vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_102) 
                                                                                | ((0x02002033U 
                                                                                == vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_102) 
                                                                                | ((0x02004033U 
                                                                                == vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_102) 
                                                                                | ((0x02005033U 
                                                                                == vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_102) 
                                                                                | ((0x0200403bU 
                                                                                == vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_102) 
                                                                                | ((0x0200503bU 
                                                                                == vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_102) 
                                                                                | ((0x02006033U 
                                                                                == vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_102) 
                                                                                | ((0x02007033U 
                                                                                == vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_102) 
                                                                                | ((0x0200603bU 
                                                                                == vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_102) 
                                                                                | (0x0200703bU 
                                                                                == vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_102))))))))))))))))))))))))))));
    vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__immGen_io_sel 
        = ((0x00000037U == vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T)
            ? 3U : ((0x00000017U == vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T)
                     ? 3U : ((0x0000006fU == vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T)
                              ? 4U : ((0x00000067U 
                                       == vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_6)
                                       ? 1U : ((0x00000063U 
                                                == vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_6)
                                                ? 5U
                                                : (
                                                   (0x00001063U 
                                                    == vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_6)
                                                    ? 5U
                                                    : 
                                                   ((0x00004063U 
                                                     == vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_6)
                                                     ? 5U
                                                     : 
                                                    ((0x00005063U 
                                                      == vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_6)
                                                      ? 5U
                                                      : 
                                                     ((0x00006063U 
                                                       == vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_6)
                                                       ? 5U
                                                       : 
                                                      ((0x00007063U 
                                                        == vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_6)
                                                        ? 5U
                                                        : 
                                                       ((3U 
                                                         == vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_6)
                                                         ? 1U
                                                         : 
                                                        ((0x00001003U 
                                                          == vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_6)
                                                          ? 1U
                                                          : 
                                                         ((0x00002003U 
                                                           == vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_6)
                                                           ? 1U
                                                           : 
                                                          ((0x00004003U 
                                                            == vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_6)
                                                            ? 1U
                                                            : 
                                                           ((0x00005003U 
                                                             == vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_6)
                                                             ? 1U
                                                             : 
                                                            ((0x00006003U 
                                                              == vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_6)
                                                              ? 1U
                                                              : 
                                                             ((0x00003003U 
                                                               == vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_6)
                                                               ? 1U
                                                               : 
                                                              ((0x00000023U 
                                                                == vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_6)
                                                                ? 2U
                                                                : 
                                                               ((0x00001023U 
                                                                 == vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_6)
                                                                 ? 2U
                                                                 : 
                                                                ((0x00002023U 
                                                                  == vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_6)
                                                                  ? 2U
                                                                  : 
                                                                 ((0x00003023U 
                                                                   == vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_6)
                                                                   ? 2U
                                                                   : 
                                                                  ((- (IData)(
                                                                              (0x1000202fU 
                                                                               != vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_42))) 
                                                                   & ((- (IData)(
                                                                                (0x1000302fU 
                                                                                != vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_42))) 
                                                                      & ((- (IData)(
                                                                                (1U 
                                                                                & (~ (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_47))))) 
                                                                         & ((- (IData)(
                                                                                (1U 
                                                                                & (~ (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_49))))) 
                                                                            & ((- (IData)(
                                                                                (1U 
                                                                                & (~ (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_51))))) 
                                                                               & ((- (IData)(
                                                                                (1U 
                                                                                & (~ (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_53))))) 
                                                                                & ((- (IData)(
                                                                                (1U 
                                                                                & (~ (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_55))))) 
                                                                                & ((- (IData)(
                                                                                (1U 
                                                                                & (~ (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_57))))) 
                                                                                & ((- (IData)(
                                                                                (1U 
                                                                                & (~ (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_59))))) 
                                                                                & ((- (IData)(
                                                                                (1U 
                                                                                & (~ (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_61))))) 
                                                                                & ((- (IData)(
                                                                                (1U 
                                                                                & (~ (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_63))))) 
                                                                                & ((- (IData)(
                                                                                (1U 
                                                                                & (~ (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_65))))) 
                                                                                & ((- (IData)(
                                                                                (1U 
                                                                                & (~ (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_67))))) 
                                                                                & (((0x00000013U 
                                                                                == vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_6)
                                                                                 ? 1U
                                                                                 : 
                                                                                ((0x0000001bU 
                                                                                == vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_6)
                                                                                 ? 1U
                                                                                 : 
                                                                                ((0x00002013U 
                                                                                == vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_6)
                                                                                 ? 1U
                                                                                 : 
                                                                                ((0x00003013U 
                                                                                == vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_6)
                                                                                 ? 1U
                                                                                 : 
                                                                                ((0x00004013U 
                                                                                == vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_6)
                                                                                 ? 1U
                                                                                 : 
                                                                                ((0x00006013U 
                                                                                == vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_6)
                                                                                 ? 1U
                                                                                 : 
                                                                                ((0x00007013U 
                                                                                == vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_6)
                                                                                 ? 1U
                                                                                 : 
                                                                                ((0x00001013U 
                                                                                == vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_100)
                                                                                 ? 1U
                                                                                 : 
                                                                                ((0x0000101bU 
                                                                                == vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_102)
                                                                                 ? 1U
                                                                                 : 
                                                                                ((0x00005013U 
                                                                                == vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_100)
                                                                                 ? 1U
                                                                                 : 
                                                                                ((0x0000501bU 
                                                                                == vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_102)
                                                                                 ? 1U
                                                                                 : 
                                                                                ((0x40005013U 
                                                                                == vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_100)
                                                                                 ? 1U
                                                                                 : 
                                                                                ((0x4000501bU 
                                                                                == vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_102)
                                                                                 ? 1U
                                                                                 : 
                                                                                ((- (IData)(
                                                                                (0x00000033U 
                                                                                != vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_102))) 
                                                                                & ((- (IData)(
                                                                                (0x0000003bU 
                                                                                != vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_102))) 
                                                                                & ((- (IData)(
                                                                                (0x40000033U 
                                                                                != vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_102))) 
                                                                                & ((- (IData)(
                                                                                (0x4000003bU 
                                                                                != vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_102))) 
                                                                                & ((- (IData)(
                                                                                (0x00001033U 
                                                                                != vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_102))) 
                                                                                & ((- (IData)(
                                                                                (0x0000103bU 
                                                                                != vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_102))) 
                                                                                & ((- (IData)(
                                                                                (0x00002033U 
                                                                                != vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_102))) 
                                                                                & ((- (IData)(
                                                                                (0x00003033U 
                                                                                != vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_102))) 
                                                                                & ((- (IData)(
                                                                                (0x00004033U 
                                                                                != vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_102))) 
                                                                                & ((- (IData)(
                                                                                (0x00005033U 
                                                                                != vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_102))) 
                                                                                & ((- (IData)(
                                                                                (0x0000503bU 
                                                                                != vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_102))) 
                                                                                & ((- (IData)(
                                                                                (0x40005033U 
                                                                                != vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_102))) 
                                                                                & ((- (IData)(
                                                                                (0x4000503bU 
                                                                                != vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_102))) 
                                                                                & ((- (IData)(
                                                                                (0x00006033U 
                                                                                != vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_102))) 
                                                                                & ((- (IData)(
                                                                                (0x00007033U 
                                                                                != vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_102))) 
                                                                                & ((- (IData)(
                                                                                (0x02000033U 
                                                                                != vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_102))) 
                                                                                & ((- (IData)(
                                                                                (0x0200003bU 
                                                                                != vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_102))) 
                                                                                & ((- (IData)(
                                                                                (0x02001033U 
                                                                                != vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_102))) 
                                                                                & ((- (IData)(
                                                                                (0x02003033U 
                                                                                != vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_102))) 
                                                                                & ((- (IData)(
                                                                                (0x02002033U 
                                                                                != vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_102))) 
                                                                                & ((- (IData)(
                                                                                (0x02004033U 
                                                                                != vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_102))) 
                                                                                & ((- (IData)(
                                                                                (0x02005033U 
                                                                                != vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_102))) 
                                                                                & ((- (IData)(
                                                                                (0x0200403bU 
                                                                                != vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_102))) 
                                                                                & ((- (IData)(
                                                                                (0x0200503bU 
                                                                                != vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_102))) 
                                                                                & ((- (IData)(
                                                                                (0x02006033U 
                                                                                != vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_102))) 
                                                                                & ((- (IData)(
                                                                                (0x02007033U 
                                                                                != vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_102))) 
                                                                                & ((- (IData)(
                                                                                (0x0200603bU 
                                                                                != vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_102))) 
                                                                                & ((- (IData)(
                                                                                (0x0200703bU 
                                                                                != vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_102))) 
                                                                                & ((- (IData)(
                                                                                (0x00001073U 
                                                                                != vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_6))) 
                                                                                & ((- (IData)(
                                                                                (0x00002073U 
                                                                                != vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_6))) 
                                                                                & (((0x00005073U 
                                                                                == vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_6)
                                                                                 ? 6U
                                                                                 : 
                                                                                ((0x00006073U 
                                                                                == vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_6)
                                                                                 ? 6U
                                                                                 : 
                                                                                ((0x00007073U 
                                                                                == vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_6)
                                                                                 ? 6U
                                                                                 : 
                                                                                (3U 
                                                                                & ((- (IData)(
                                                                                (0x30200073U 
                                                                                != vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst))) 
                                                                                & ((- (IData)(
                                                                                (0x10200073U 
                                                                                != vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst))) 
                                                                                & ((- (IData)(
                                                                                (0x00000073U 
                                                                                != vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst))) 
                                                                                & ((- (IData)(
                                                                                (0x00100073U 
                                                                                != vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst))) 
                                                                                & ((- (IData)(
                                                                                (0x0000100fU 
                                                                                != vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst))) 
                                                                                & ((- (IData)(
                                                                                (1U 
                                                                                & (~ (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_191))))) 
                                                                                & (- (IData)(
                                                                                (0x10500073U 
                                                                                != vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst))))))))))))) 
                                                                                & (- (IData)(
                                                                                (0x00003073U 
                                                                                != vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_6))))))))))))))))))))))))))))))))))))))))))))))) 
                                                                                & (- (IData)(
                                                                                (1U 
                                                                                & (~ (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_69))))))))))))))))))))))))))))))))))))))));
    vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__control_io_csr_cmd 
        = ((- (IData)((0x00000037U != vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T))) 
           & ((- (IData)((0x00000017U != vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T))) 
              & ((- (IData)((0x0000006fU != vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T))) 
                 & ((- (IData)((0x00000067U != vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_6))) 
                    & ((- (IData)((0x00000063U != vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_6))) 
                       & ((- (IData)((0x00001063U != vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_6))) 
                          & ((- (IData)((0x00004063U 
                                         != vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_6))) 
                             & ((- (IData)((0x00005063U 
                                            != vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_6))) 
                                & ((- (IData)((0x00006063U 
                                               != vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_6))) 
                                   & ((- (IData)((0x00007063U 
                                                  != vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_6))) 
                                      & ((- (IData)(
                                                    (3U 
                                                     != vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_6))) 
                                         & ((- (IData)(
                                                       (0x00001003U 
                                                        != vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_6))) 
                                            & ((- (IData)(
                                                          (0x00002003U 
                                                           != vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_6))) 
                                               & ((- (IData)(
                                                             (0x00004003U 
                                                              != vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_6))) 
                                                  & ((- (IData)(
                                                                (0x00005003U 
                                                                 != vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_6))) 
                                                     & ((- (IData)(
                                                                   (0x00006003U 
                                                                    != vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_6))) 
                                                        & ((- (IData)(
                                                                      (0x00003003U 
                                                                       != vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_6))) 
                                                           & ((- (IData)(
                                                                         (0x00000023U 
                                                                          != vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_6))) 
                                                              & ((- (IData)(
                                                                            (0x00001023U 
                                                                             != vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_6))) 
                                                                 & ((- (IData)(
                                                                               (0x00002023U 
                                                                                != vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_6))) 
                                                                    & ((- (IData)(
                                                                                (0x00003023U 
                                                                                != vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_6))) 
                                                                       & ((- (IData)(
                                                                                (0x1000202fU 
                                                                                != vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_42))) 
                                                                          & ((- (IData)(
                                                                                (0x1000302fU 
                                                                                != vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_42))) 
                                                                             & ((- (IData)(
                                                                                (1U 
                                                                                & (~ (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_47))))) 
                                                                                & ((- (IData)(
                                                                                (1U 
                                                                                & (~ (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_49))))) 
                                                                                & ((- (IData)(
                                                                                (1U 
                                                                                & (~ (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_51))))) 
                                                                                & ((- (IData)(
                                                                                (1U 
                                                                                & (~ (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_53))))) 
                                                                                & ((- (IData)(
                                                                                (1U 
                                                                                & (~ (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_55))))) 
                                                                                & ((- (IData)(
                                                                                (1U 
                                                                                & (~ (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_57))))) 
                                                                                & ((- (IData)(
                                                                                (1U 
                                                                                & (~ (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_59))))) 
                                                                                & ((- (IData)(
                                                                                (1U 
                                                                                & (~ (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_61))))) 
                                                                                & ((- (IData)(
                                                                                (1U 
                                                                                & (~ (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_63))))) 
                                                                                & ((- (IData)(
                                                                                (1U 
                                                                                & (~ (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_65))))) 
                                                                                & ((- (IData)(
                                                                                (1U 
                                                                                & (~ (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_67))))) 
                                                                                & ((- (IData)(
                                                                                (1U 
                                                                                & (~ (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_69))))) 
                                                                                & ((- (IData)(
                                                                                (0x00000033U 
                                                                                != vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_102))) 
                                                                                & ((- (IData)(
                                                                                (0x0000003bU 
                                                                                != vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_102))) 
                                                                                & ((- (IData)(
                                                                                (0x40000033U 
                                                                                != vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_102))) 
                                                                                & ((- (IData)(
                                                                                (0x4000003bU 
                                                                                != vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_102))) 
                                                                                & ((- (IData)(
                                                                                (0x00001033U 
                                                                                != vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_102))) 
                                                                                & ((- (IData)(
                                                                                (0x0000103bU 
                                                                                != vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_102))) 
                                                                                & ((- (IData)(
                                                                                (0x00002033U 
                                                                                != vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_102))) 
                                                                                & ((- (IData)(
                                                                                (0x00003033U 
                                                                                != vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_102))) 
                                                                                & ((- (IData)(
                                                                                (0x00004033U 
                                                                                != vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_102))) 
                                                                                & ((- (IData)(
                                                                                (0x00005033U 
                                                                                != vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_102))) 
                                                                                & ((- (IData)(
                                                                                (0x0000503bU 
                                                                                != vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_102))) 
                                                                                & ((- (IData)(
                                                                                (0x40005033U 
                                                                                != vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_102))) 
                                                                                & ((- (IData)(
                                                                                (0x4000503bU 
                                                                                != vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_102))) 
                                                                                & ((- (IData)(
                                                                                (0x00006033U 
                                                                                != vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_102))) 
                                                                                & ((- (IData)(
                                                                                (0x00007033U 
                                                                                != vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_102))) 
                                                                                & ((- (IData)(
                                                                                (0x02000033U 
                                                                                != vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_102))) 
                                                                                & ((- (IData)(
                                                                                (0x0200003bU 
                                                                                != vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_102))) 
                                                                                & ((- (IData)(
                                                                                (0x02001033U 
                                                                                != vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_102))) 
                                                                                & ((- (IData)(
                                                                                (0x02003033U 
                                                                                != vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_102))) 
                                                                                & ((- (IData)(
                                                                                (0x02002033U 
                                                                                != vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_102))) 
                                                                                & ((- (IData)(
                                                                                (0x02004033U 
                                                                                != vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_102))) 
                                                                                & ((- (IData)(
                                                                                (0x02005033U 
                                                                                != vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_102))) 
                                                                                & ((- (IData)(
                                                                                (0x0200403bU 
                                                                                != vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_102))) 
                                                                                & ((- (IData)(
                                                                                (0x0200503bU 
                                                                                != vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_102))) 
                                                                                & ((- (IData)(
                                                                                (0x02006033U 
                                                                                != vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_102))) 
                                                                                & ((- (IData)(
                                                                                (0x02007033U 
                                                                                != vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_102))) 
                                                                                & ((- (IData)(
                                                                                (0x0200603bU 
                                                                                != vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_102))) 
                                                                                & ((- (IData)(
                                                                                (0x00000013U 
                                                                                != vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_6))) 
                                                                                & ((- (IData)(
                                                                                (0x0000001bU 
                                                                                != vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_6))) 
                                                                                & ((- (IData)(
                                                                                (0x00002013U 
                                                                                != vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_6))) 
                                                                                & ((- (IData)(
                                                                                (0x00003013U 
                                                                                != vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_6))) 
                                                                                & ((- (IData)(
                                                                                (0x00004013U 
                                                                                != vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_6))) 
                                                                                & ((- (IData)(
                                                                                (0x00006013U 
                                                                                != vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_6))) 
                                                                                & ((- (IData)(
                                                                                (0x00007013U 
                                                                                != vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_6))) 
                                                                                & ((- (IData)(
                                                                                (0x00001013U 
                                                                                != vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_100))) 
                                                                                & ((- (IData)(
                                                                                (0x0000101bU 
                                                                                != vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_102))) 
                                                                                & ((- (IData)(
                                                                                (0x00005013U 
                                                                                != vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_100))) 
                                                                                & ((- (IData)(
                                                                                (0x0000501bU 
                                                                                != vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_102))) 
                                                                                & ((- (IData)(
                                                                                (0x40005013U 
                                                                                != vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_100))) 
                                                                                & ((- (IData)(
                                                                                (0x4000501bU 
                                                                                != vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_102))) 
                                                                                & (((0x00001073U 
                                                                                == vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_6)
                                                                                 ? 1U
                                                                                 : 
                                                                                ((0x00002073U 
                                                                                == vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_6)
                                                                                 ? 2U
                                                                                 : 
                                                                                ((0x00003073U 
                                                                                == vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_6)
                                                                                 ? 3U
                                                                                 : 
                                                                                ((0x00005073U 
                                                                                == vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_6)
                                                                                 ? 1U
                                                                                 : 
                                                                                ((0x00006073U 
                                                                                == vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_6)
                                                                                 ? 2U
                                                                                 : 
                                                                                (3U 
                                                                                & (- (IData)(
                                                                                (0x00007073U 
                                                                                == vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_6))))))))) 
                                                                                & (- (IData)(
                                                                                (0x0200703bU 
                                                                                != vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_102)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))));
    vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__iTLB__DOT___T_224 
        = (1U & ((~ (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__iTLB__DOT___T_196)) 
                 | (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__iTLB__DOT___T_195)));
    vlSelfRef.io_start = vlSelfRef.ysyx_22041812__DOT__datapath__DOT__started;
    vlSelfRef.ysyx_22041812__DOT__datapath__DOT__csr__DOT___instValid_T 
        = ((IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__csr__DOT__readable) 
           & (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__csr__DOT__writable));
    vlSelfRef.__VdfgRegularize_hebeb780c_0_306 = ((0x1000202fU 
                                                   == vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_42) 
                                                  | ((0x1000302fU 
                                                      == vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_42) 
                                                     | ((IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_47) 
                                                        | ((IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_49) 
                                                           | ((IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_51) 
                                                              | ((IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_53) 
                                                                 | ((IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_55) 
                                                                    | ((IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_57) 
                                                                       | ((IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_59) 
                                                                          | ((IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_61) 
                                                                             | ((IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_63) 
                                                                                | ((IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_65) 
                                                                                | ((IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_67) 
                                                                                | ((IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_69) 
                                                                                | ((0x00000013U 
                                                                                == vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_6) 
                                                                                | ((0x0000001bU 
                                                                                == vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_6) 
                                                                                | ((0x00002013U 
                                                                                == vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_6) 
                                                                                | ((0x00003013U 
                                                                                == vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_6) 
                                                                                | ((0x00004013U 
                                                                                == vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_6) 
                                                                                | ((0x00006013U 
                                                                                == vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_6) 
                                                                                | ((0x00007013U 
                                                                                == vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_6) 
                                                                                | ((0x00001013U 
                                                                                == vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_100) 
                                                                                | ((0x0000101bU 
                                                                                == vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_102) 
                                                                                | ((0x00005013U 
                                                                                == vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_100) 
                                                                                | ((0x0000501bU 
                                                                                == vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_102) 
                                                                                | ((0x40005013U 
                                                                                == vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_100) 
                                                                                | ((0x4000501bU 
                                                                                == vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_102) 
                                                                                | ((IData)(vlSelfRef.__VdfgRegularize_hebeb780c_0_307) 
                                                                                | ((0x00001073U 
                                                                                == vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_6) 
                                                                                | ((0x00002073U 
                                                                                == vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_6) 
                                                                                | (0x00003073U 
                                                                                == vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__control__DOT___ctrlSignals_T_6)))))))))))))))))))))))))))))));
    vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__immGen__DOT___io_out_T_5 
        = ((2U == (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__immGen_io_sel))
            ? (((QData)((IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__immGen__DOT___Iimm_T_1)) 
                << 0x0000000cU) | (QData)((IData)((
                                                   (0x00000fe0U 
                                                    & (vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst 
                                                       >> 0x00000014U)) 
                                                   | (0x0000001fU 
                                                      & (vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst 
                                                         >> 7U))))))
            : ((1U == (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__immGen_io_sel))
                ? vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__immGen__DOT__Iimm
                : (0x00000ffffffffffeULL & vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__immGen__DOT__Iimm)));
    vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT___csr_op_T_14 
        = ((1U == (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__control_io_csr_cmd))
            ? 3U : ((IData)(((0U == (0x000f8000U & vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst)) 
                             & (3U == (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__control_io_csr_cmd))))
                     ? 1U : ((IData)(((0U == (0x000f8000U 
                                              & vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst)) 
                                      & (2U == (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__control_io_csr_cmd))))
                              ? 1U : (4U & (- (IData)(
                                                      (2U 
                                                       == (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__control_io_csr_cmd))))))));
    vlSelfRef.ysyx_22041812__DOT__datapath__DOT___csr_atomic_flush_T_7 
        = ((IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_enable) 
           & (0U != (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__control_io_csr_cmd)));
    vlSelfRef.io_stall = (1U & ((IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__iTLB_io_stall) 
                                | ((~ ((IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__iTLB__DOT___io_tlb_ready_T) 
                                       | ((0U == (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__iTLB__DOT__tlb_state))
                                           ? (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__iTLB__DOT___io_tlb_ready_T)
                                           : (((1U 
                                                == (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__iTLB__DOT__tlb_state))
                                                ? ((IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__iTLB__DOT___T_3) 
                                                   & ((IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__iTLB__DOT___T_186) 
                                                      & (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__iTLB__DOT__matchList_0)))
                                                : (
                                                   (5U 
                                                    == (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__iTLB__DOT__tlb_state))
                                                    ? 
                                                   ((((IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__iTLB__DOT___T_196) 
                                                      & (0U 
                                                         != 
                                                         (0x0003ffffU 
                                                          & (IData)(
                                                                    (vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__iTLB__DOT___T_197 
                                                                     >> 0x0000000aU))))) 
                                                     | (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__iTLB__DOT___T_195)) 
                                                    & (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__iTLB__DOT___T_191))
                                                    : 
                                                   ((4U 
                                                     == (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__iTLB__DOT__tlb_state))
                                                     ? 
                                                    ((((IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__iTLB__DOT___T_196) 
                                                       & (0U 
                                                          != 
                                                          (0x000001ffU 
                                                           & (IData)(
                                                                     (vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__iTLB__DOT___T_197 
                                                                      >> 0x0000000aU))))) 
                                                      | (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__iTLB__DOT___T_195)) 
                                                     & (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__iTLB__DOT___T_191))
                                                     : 
                                                    ((3U 
                                                      == (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__iTLB__DOT__tlb_state))
                                                      ? 
                                                     ((IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__iTLB__DOT___T_224) 
                                                      & (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__iTLB__DOT___T_191))
                                                      : 
                                                     ((6U 
                                                       == (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__iTLB__DOT__tlb_state))
                                                       ? 
                                                      (~ 
                                                       ((IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__iTLB__DOT__pte_reg_A) 
                                                        & (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__iTLB__DOT___T_236)))
                                                       : 
                                                      ((7U 
                                                        == (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__iTLB__DOT__tlb_state)) 
                                                       & (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__iTLB__DOT___T_191))))))) 
                                              | (2U 
                                                 == (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__iTLB__DOT__tlb_state)))))) 
                                   | ((~ (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__memory_stage__DOT__tlb_tag)) 
                                      | (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__execute_stage__DOT__src_unready)))));
    vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__immGen__DOT___io_out_T_7 
        = ((5U == (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__immGen_io_sel))
            ? (((QData)((IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__immGen__DOT___Iimm_T_1)) 
                << 0x0000000dU) | (QData)((IData)((
                                                   (((2U 
                                                      & (vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst 
                                                         >> 0x0000001eU)) 
                                                     | (1U 
                                                        & (vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst 
                                                           >> 7U))) 
                                                    << 0x0000000bU) 
                                                   | ((0x000007e0U 
                                                       & (vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst 
                                                          >> 0x00000014U)) 
                                                      | (0x0000001eU 
                                                         & (vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst 
                                                            >> 7U)))))))
            : (((QData)((IData)((1U & (IData)((vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__immGen__DOT___io_out_T_5 
                                               >> 0x0000002bU))))) 
                << 0x0000002cU) | vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__immGen__DOT___io_out_T_5));
    vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__csr_op 
        = ((IData)(((1U == (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__control_io_csr_cmd)) 
                    & (0U == (0x00000f80U & vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__fd_pipe_reg_inst))))
            ? 2U : (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT___csr_op_T_14));
    vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage_io_csr_atomic 
        = ((IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT___csr_atomic_flush_T_1) 
           | ((IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT___csr_atomic_flush_T_3) 
              | ((IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT___csr_atomic_flush_T_5) 
                 | (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT___csr_atomic_flush_T_7))));
    if (vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__iTLB_io_flush) {
        __Vtemp_2[0U] = (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT___next_pc_T_8);
        __Vtemp_2[1U] = (IData)((vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT___next_pc_T_8 
                                 >> 0x00000020U));
        __Vtemp_2[2U] = 0U;
    } else if (((~ (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__started)) 
                & (IData)(vlSelfRef.io_stall))) {
        __Vtemp_2[0U] = vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__pc[0U];
        __Vtemp_2[1U] = vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__pc[1U];
        __Vtemp_2[2U] = vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__pc[2U];
    } else {
        __Vtemp_3[0U] = 4U;
        __Vtemp_3[1U] = 0U;
        __Vtemp_3[2U] = 0U;
        VL_ADD_W(3, __Vtemp_2, __Vtemp_3, vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__pc);
    }
    vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT___next_pc_T_12[0U] 
        = __Vtemp_2[0U];
    vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT___next_pc_T_12[1U] 
        = __Vtemp_2[1U];
    vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT___next_pc_T_12[2U] 
        = (1U & __Vtemp_2[2U]);
    vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT___T_1 
        = (1U & (~ (IData)(vlSelfRef.io_stall)));
    vlSelfRef.ysyx_22041812__DOT__datapath__DOT__memory_stage__DOT__dTLB_io_wen 
        = ((IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__memory_stage__DOT__is_amo)
            ? ((2U == (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__execute_stage__DOT__em_pipe_reg_amo_op))
                ? (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__memory_stage__DOT__sc_fire)
                : (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__memory_stage__DOT__amo_second))
            : ((IData)(vlSelfRef.io_stall) ? (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__memory_stage__DOT___mem_wen_T_1)
                : ((IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__de_pipe_reg_enable) 
                   & (0U != (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__de_pipe_reg_st_type)))));
    vlSelfRef.__VdfgRegularize_hebeb780c_0_409 = ((IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT___T_1) 
                                                  & (0x0000100fU 
                                                     == vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__de_pipe_reg_inst));
    vlSelfRef.ysyx_22041812__DOT__datapath__DOT__csr__DOT__hasInt 
        = ((IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__de_pipe_reg_enable) 
           & ((IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__csr__DOT___hasExc_T_16) 
              & ((IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT___T_1) 
                 & ((((1U > (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__csr__DOT__mode)) 
                      | ((IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__csr__DOT__mstatus_sie) 
                         & (1U == (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__csr__DOT__mode)))) 
                     & (0U != (vlSelfRef.ysyx_22041812__DOT__datapath__DOT__csr__DOT__mideleg_data 
                               & vlSelfRef.ysyx_22041812__DOT__datapath__DOT__csr__DOT__flagIntS))) 
                    | (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__csr__DOT__hasIntM)))));
    __VdfgRegularize_hebeb780c_0_219 = ((IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT___T_1) 
                                        & (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__csr__DOT___hasExc_T_16));
    vlSelfRef.ysyx_22041812__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT___io_fault_T_4 
        = (3U & (2U | (- (IData)((IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__memory_stage__DOT__dTLB_io_wen)))));
    vlSelfRef.ysyx_22041812__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT___T_255 
        = (1U & ((~ (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT__pte_reg_A)) 
                 | ((~ (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT__pte_reg_D)) 
                    & (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__memory_stage__DOT__dTLB_io_wen))));
    vlSelfRef.ysyx_22041812__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT___T_249 
        = (((3U == (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__memory_stage__DOT__dTLB_io_priv)) 
            | ((1U == (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__memory_stage__DOT__dTLB_io_priv))
                ? ((~ (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT__pte_reg_U)) 
                   | (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__csr__DOT__mstatus_sum))
                : ((IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT__pte_reg_U) 
                   | (0U != (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__memory_stage__DOT__dTLB_io_priv))))) 
           & ((IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__memory_stage__DOT__dTLB_io_wen)
               ? (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT__pte_reg_W)
               : (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT__pte_reg_R)));
    vlSelfRef.ysyx_22041812__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT__permList_0 
        = ((IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT__matchList_0) 
           & (((IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__memory_stage__DOT__dTLB_io_wen)
                ? (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT__tlbe_0_W)
                : (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT__tlbe_0_R)) 
              & (((1U == (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__memory_stage__DOT__dTLB_io_priv))
                   ? ((~ (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT__tlbe_0_U)) 
                      | (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__csr__DOT__mstatus_sum))
                   : ((IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT__tlbe_0_U) 
                      | (0U != (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__memory_stage__DOT__dTLB_io_priv)))) 
                 | (3U == (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__memory_stage__DOT__dTLB_io_priv)))));
    vlSelfRef.ysyx_22041812__DOT__datapath__DOT__memory_stage__DOT__dTLB_io_tlb_request_rw 
        = ((0U != (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT__tlb_state)) 
           & ((2U != (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT__tlb_state)) 
              & ((1U != (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT__tlb_state)) 
                 & ((6U != (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT__tlb_state)) 
                    & ((IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__memory_stage__DOT__dTLB_io_wen) 
                       & ((7U == (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT__tlb_state)) 
                          & ((5U != (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT__tlb_state)) 
                             & ((3U != (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT__tlb_state)) 
                                & (4U != (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT__tlb_state))))))))));
    if (vlSelfRef.ysyx_22041812__DOT__datapath__DOT__csr__DOT__hasInt) {
        vlSelfRef.ysyx_22041812__DOT__datapath__DOT__csr__DOT__handIntS 
            = (1U & (~ (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__csr__DOT__hasIntM)));
        vlSelfRef.ysyx_22041812__DOT__datapath__DOT__csr__DOT__cause 
            = ((1U & (IData)((vlSelfRef.ysyx_22041812__DOT__datapath__DOT__csr__DOT__flagIntM 
                              >> 0x0000000bU))) ? 0x800000000000000bULL
                : ((1U & (IData)((vlSelfRef.ysyx_22041812__DOT__datapath__DOT__csr__DOT__flagIntM 
                                  >> 3U))) ? 0x8000000000000003ULL
                    : ((1U & (IData)((vlSelfRef.ysyx_22041812__DOT__datapath__DOT__csr__DOT__flagIntM 
                                      >> 7U))) ? 0x8000000000000007ULL
                        : ((1U & (IData)((vlSelfRef.ysyx_22041812__DOT__datapath__DOT__csr__DOT__flagIntS 
                                          >> 9U))) ? 0x8000000000000009ULL
                            : ((1U & (IData)((vlSelfRef.ysyx_22041812__DOT__datapath__DOT__csr__DOT__flagIntS 
                                              >> 1U)))
                                ? 0x8000000000000001ULL
                                : 0x8000000000000005ULL)))));
    } else {
        vlSelfRef.ysyx_22041812__DOT__datapath__DOT__csr__DOT__handIntS = 0U;
        vlSelfRef.ysyx_22041812__DOT__datapath__DOT__csr__DOT__cause 
            = vlSelfRef.ysyx_22041812__DOT__datapath__DOT__csr__DOT__excCause;
    }
    vlSelfRef.ysyx_22041812__DOT__datapath__DOT__csr__DOT__hasExc 
        = ((IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__execute_stage__DOT__em_pipe_reg_enable) 
           & (((IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__execute_stage__DOT__em_pipe_reg_csr_is_illegal) 
               | ((IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__execute_stage__DOT__em_pipe_reg_csr_inst_misalign) 
                  | ((IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__execute_stage__DOT__em_pipe_reg_csr_store_misalign) 
                     | ((0U != (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__memory_stage__DOT__dTLB_fault_reg)) 
                        | ((IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__execute_stage__DOT__em_pipe_reg_csr_load_misalign) 
                           | ((0x00100073U == vlSelfRef.ysyx_22041812__DOT__datapath__DOT__execute_stage__DOT__em_pipe_reg_inst) 
                              | ((0U != (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__execute_stage__DOT__em_pipe_reg_iTLB_fault)) 
                                 | (0x00000073U == vlSelfRef.ysyx_22041812__DOT__datapath__DOT__execute_stage__DOT__em_pipe_reg_inst)))))))) 
              & (IData)(__VdfgRegularize_hebeb780c_0_219)));
    vlSelfRef.ysyx_22041812__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT___T_186 
        = (1U & (~ (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT__permList_0)));
    vlSelfRef.ysyx_22041812__DOT__datapath__DOT__csr__DOT__hasExcS 
        = ((IData)((vlSelfRef.ysyx_22041812__DOT__datapath__DOT__csr__DOT__medeleg_data 
                    >> (0x0000000fU & (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__csr__DOT__excCause)))) 
           & (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__csr__DOT__hasExc));
    vlSelfRef.ysyx_22041812__DOT__datapath__DOT__csr__DOT___T_354 
        = (1U & (~ (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__csr__DOT__hasExc)));
    vlSelfRef.ysyx_22041812__DOT__datapath__DOT__csr__DOT___interrupt_return_addr_T_8 
        = ((IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__csr__DOT__hasExc) 
           | (IData)(vlSelfRef.__VdfgRegularize_hebeb780c_0_320));
    if (vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__iTLB_io_valid) {
        vlSelfRef.ysyx_22041812__DOT__datapath__DOT__memory_stage_io_dcache_cpu_request_rw 
            = vlSelfRef.ysyx_22041812__DOT__datapath__DOT__memory_stage__DOT__dTLB_io_tlb_request_rw;
        vlSelfRef.ysyx_22041812__DOT__datapath__DOT__memory_stage__DOT__clint_io_wen 
            = vlSelfRef.ysyx_22041812__DOT__datapath__DOT__memory_stage__DOT__dTLB_io_tlb_request_rw;
    } else {
        vlSelfRef.ysyx_22041812__DOT__datapath__DOT__memory_stage_io_dcache_cpu_request_rw 
            = vlSelfRef.ysyx_22041812__DOT__datapath__DOT__memory_stage__DOT__dTLB_io_wen;
        vlSelfRef.ysyx_22041812__DOT__datapath__DOT__memory_stage__DOT__clint_io_wen 
            = ((IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__execute_stage__DOT__em_pipe_reg_is_clint) 
               & (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__memory_stage__DOT___mem_wen_T_1));
    }
    vlSelfRef.ysyx_22041812__DOT__datapath__DOT__memory_stage__DOT__clint_io_timer_clear 
        = ((IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__memory_stage__DOT__clint_io_wen) 
           & (0x0000000002004000ULL == vlSelfRef.ysyx_22041812__DOT__datapath__DOT__memory_stage__DOT__clint__DOT__addr_reg));
    vlSelfRef.ysyx_22041812__DOT__datapath__DOT__memory_stage__DOT__clint_io_r_data 
        = (((0x0000000002000000ULL == vlSelfRef.ysyx_22041812__DOT__datapath__DOT__memory_stage__DOT__clint__DOT__addr_reg)
             ? vlSelfRef.ysyx_22041812__DOT__datapath__DOT__memory_stage__DOT__clint__DOT__msip
             : ((0x0000000002004000ULL == vlSelfRef.ysyx_22041812__DOT__datapath__DOT__memory_stage__DOT__clint__DOT__addr_reg)
                 ? vlSelfRef.ysyx_22041812__DOT__datapath__DOT__memory_stage__DOT__clint__DOT__mtimecmp
                 : (vlSelfRef.ysyx_22041812__DOT__datapath__DOT__memory_stage__DOT__clint__DOT__mtime 
                    & (- (QData)((IData)((0x000000000200bff8ULL 
                                          == vlSelfRef.ysyx_22041812__DOT__datapath__DOT__memory_stage__DOT__clint__DOT__addr_reg))))))) 
           & (- (QData)((IData)((1U & (~ (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__memory_stage__DOT__clint_io_wen)))))));
    vlSelfRef.ysyx_22041812__DOT__datapath__DOT__csr__DOT__handExcS 
        = ((~ ((IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__csr__DOT__mode) 
               >> 1U)) & (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__csr__DOT__hasExcS));
    __VdfgRegularize_hebeb780c_0_324 = ((IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__csr__DOT___T_354) 
                                        & ((IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__csr__DOT___T_356) 
                                           & (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__csr__DOT___T_358)));
    __VdfgRegularize_hebeb780c_0_321 = ((IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__execute_stage__DOT__em_pipe_reg_enable) 
                                        & (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__csr__DOT___interrupt_return_addr_T_8));
    vlSelfRef.ysyx_22041812__DOT__datapath__DOT__csr__DOT___mip_mtip_T_1 
        = (1U & (~ (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__memory_stage__DOT__clint_io_timer_clear)));
    vlSelfRef.ysyx_22041812__DOT__datapath__DOT__memory_stage__DOT__load_data 
        = ((IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__execute_stage__DOT__em_pipe_reg_is_clint)
            ? vlSelfRef.ysyx_22041812__DOT__datapath__DOT__memory_stage__DOT__clint_io_r_data
            : (((2U == (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__execute_stage__DOT__em_pipe_reg_amo_op)) 
                & (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__memory_stage__DOT__is_amo))
                ? (QData)((IData)((1U & (~ (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__memory_stage__DOT__sc_success)))))
                : ((IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__memory_stage__DOT___T_4)
                    ? ((1U == (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__execute_stage__DOT__em_pipe_reg_amo_op))
                        ? vlSelfRef.ysyx_22041812__DOT__datapath__DOT__execute_stage__DOT___load_data_hazard_T_3
                        : vlSelfRef.ysyx_22041812__DOT__datapath__DOT__memory_stage__DOT__amo_old)
                    : vlSelfRef.ysyx_22041812__DOT__datapath__DOT__execute_stage__DOT___load_data_hazard_T_3)));
    vlSelfRef.ysyx_22041812__DOT__datapath__DOT__execute_stage__DOT__load_data_hazard 
        = (((IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__execute_stage__DOT__em_pipe_reg_is_clint) 
            & (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__execute_stage__DOT__em_pipe_reg_enable))
            ? vlSelfRef.ysyx_22041812__DOT__datapath__DOT__memory_stage__DOT__clint_io_r_data
            : vlSelfRef.ysyx_22041812__DOT__datapath__DOT__execute_stage__DOT___load_data_hazard_T_3);
    vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage_io_csr_trapVec 
        = (((IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__csr__DOT__hasInt) 
            | (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__csr__DOT__hasExc))
            ? (((IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__csr__DOT__handExcS) 
                | (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__csr__DOT__handIntS))
                ? (((IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__csr__DOT__stvec_mode) 
                    & (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__csr__DOT__hasInt))
                    ? ((vlSelfRef.ysyx_22041812__DOT__datapath__DOT__csr__DOT__cause 
                        + vlSelfRef.ysyx_22041812__DOT__datapath__DOT__csr__DOT__stvec_base) 
                       << 2U) : (vlSelfRef.ysyx_22041812__DOT__datapath__DOT__csr__DOT__stvec_base 
                                 << 2U)) : (((IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__csr__DOT__mtvec_mode) 
                                             & (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__csr__DOT__hasInt))
                                             ? ((vlSelfRef.ysyx_22041812__DOT__datapath__DOT__csr__DOT__cause 
                                                 + vlSelfRef.ysyx_22041812__DOT__datapath__DOT__csr__DOT__mtvec_base) 
                                                << 2U)
                                             : (vlSelfRef.ysyx_22041812__DOT__datapath__DOT__csr__DOT__mtvec_base 
                                                << 2U)))
            : ((0x30200073U == vlSelfRef.ysyx_22041812__DOT__datapath__DOT__execute_stage__DOT__em_pipe_reg_inst)
                ? vlSelfRef.ysyx_22041812__DOT__datapath__DOT__csr__DOT__mepc_data
                : vlSelfRef.ysyx_22041812__DOT__datapath__DOT__csr__DOT__sepc_data));
    __VdfgRegularize_hebeb780c_0_129 = (0x0000000fU 
                                        & (((((IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__csr__DOT__hasInt) 
                                              & (IData)(__VdfgRegularize_hebeb780c_0_324))
                                              ? 7U : 
                                             ((- (IData)(
                                                         ((IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__csr__DOT___interrupt_return_addr_T_8) 
                                                          & (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__csr__DOT__hasInt)))) 
                                              | ((- (IData)((IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__csr__DOT__hasExc))) 
                                                 | (7U 
                                                    & (- (IData)((IData)(vlSelfRef.__VdfgRegularize_hebeb780c_0_320))))))) 
                                            & (- (IData)((IData)(__VdfgRegularize_hebeb780c_0_219)))) 
                                           | ((- (IData)((IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT___csr_atomic_flush_T_1))) 
                                              | (7U 
                                                 & ((- (IData)((IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT___csr_atomic_flush_T_3))) 
                                                    | (3U 
                                                       & ((- (IData)((IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT___csr_atomic_flush_T_5))) 
                                                          | (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT___csr_atomic_flush_T_7))))))));
    vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage_io_csr_trap 
        = (((IData)(__VdfgRegularize_hebeb780c_0_321) 
            | (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__csr__DOT__hasInt)) 
           & (IData)(__VdfgRegularize_hebeb780c_0_219));
    vlSelfRef.ysyx_22041812__DOT__datapath__DOT__execute_stage__DOT___src1_data_T_7 
        = ((0U == (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__execute_stage__DOT__em_pipe_reg_wb_sel))
            ? vlSelfRef.ysyx_22041812__DOT__datapath__DOT__execute_stage__DOT__em_pipe_reg_alu_out
            : ((2U == (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__execute_stage__DOT__em_pipe_reg_wb_sel))
                ? vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT___next_pc_T_8
                : ((3U == (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__execute_stage__DOT__em_pipe_reg_wb_sel))
                    ? vlSelfRef.ysyx_22041812__DOT__datapath__DOT__execute_stage__DOT__em_pipe_reg_csr_read_data
                    : ((((1U == (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__execute_stage__DOT__em_pipe_reg_ld_type))
                          ? (((QData)((IData)((- (IData)(
                                                         (1U 
                                                          & (IData)(
                                                                    (vlSelfRef.ysyx_22041812__DOT__datapath__DOT__execute_stage__DOT__load_data_hazard 
                                                                     >> 0x0000001fU))))))) 
                              << 0x00000018U) | (QData)((IData)(
                                                                (0x00ffffffU 
                                                                 & (IData)(
                                                                           (vlSelfRef.ysyx_22041812__DOT__datapath__DOT__execute_stage__DOT__load_data_hazard 
                                                                            >> 8U))))))
                          : ((6U == (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__execute_stage__DOT__em_pipe_reg_ld_type))
                              ? (QData)((IData)((0x00ffffffU 
                                                 & (IData)(
                                                           (vlSelfRef.ysyx_22041812__DOT__datapath__DOT__execute_stage__DOT__load_data_hazard 
                                                            >> 8U)))))
                              : ((2U == (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__execute_stage__DOT__em_pipe_reg_ld_type))
                                  ? ((0x00ffffffffffff00ULL 
                                      & ((- (QData)((IData)(
                                                            (1U 
                                                             & (IData)(
                                                                       (vlSelfRef.ysyx_22041812__DOT__datapath__DOT__execute_stage__DOT__load_data_hazard 
                                                                        >> 0x0000000fU)))))) 
                                         << 8U)) | (QData)((IData)(
                                                                   (0x000000ffU 
                                                                    & (IData)(
                                                                              (vlSelfRef.ysyx_22041812__DOT__datapath__DOT__execute_stage__DOT__load_data_hazard 
                                                                               >> 8U))))))
                                  : ((4U == (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__execute_stage__DOT__em_pipe_reg_ld_type))
                                      ? (QData)((IData)(
                                                        (0x000000ffU 
                                                         & (IData)(
                                                                   (vlSelfRef.ysyx_22041812__DOT__datapath__DOT__execute_stage__DOT__load_data_hazard 
                                                                    >> 8U)))))
                                      : ((3U == (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__execute_stage__DOT__em_pipe_reg_ld_type))
                                          ? (- (QData)((IData)(
                                                               (1U 
                                                                & (IData)(
                                                                          (vlSelfRef.ysyx_22041812__DOT__datapath__DOT__execute_stage__DOT__load_data_hazard 
                                                                           >> 7U))))))
                                          : ((- (QData)((IData)(
                                                                (5U 
                                                                 != (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__execute_stage__DOT__em_pipe_reg_ld_type))))) 
                                             & (vlSelfRef.ysyx_22041812__DOT__datapath__DOT__execute_stage__DOT__load_data_hazard 
                                                >> 8U))))))) 
                        << 8U) | (QData)((IData)((0x000000ffU 
                                                  & (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__execute_stage__DOT__load_data_hazard))))))));
    vlSelfRef.ysyx_22041812__DOT__datapath__DOT__memory_stage_io_flush_mw 
        = (1U & ((IData)(__VdfgRegularize_hebeb780c_0_129) 
                 >> 3U));
    vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage_io_flush_em 
        = (1U & (((IData)(__VdfgRegularize_hebeb780c_0_129) 
                  >> 2U) | (IData)(vlSelfRef.__VdfgRegularize_hebeb780c_0_411)));
    vlSelfRef.ysyx_22041812__DOT__datapath__DOT__execute_stage__DOT___GEN_17 
        = (vlSelfRef.ysyx_22041812__DOT__datapath__DOT__execute_stage__DOT___src1_data_T_7 
           & (- (QData)((IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__execute_stage__DOT___src_unready_T_1))));
    vlSelfRef.ysyx_22041812__DOT__datapath__DOT__execute_stage__DOT___GEN_13 
        = (vlSelfRef.ysyx_22041812__DOT__datapath__DOT__execute_stage__DOT___src1_data_T_7 
           & (- (QData)((IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__execute_stage__DOT___src_unready_T))));
    vlSelfRef.ysyx_22041812__DOT__datapath__DOT__execute_stage__DOT__brCond_io_rs2 
        = (((IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__execute_stage__DOT___T_12) 
            & ((IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__execute_stage__DOT___src_unready_T_1) 
               & (0ULL != vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__de_pipe_reg_src2_addr)))
            ? vlSelfRef.ysyx_22041812__DOT__datapath__DOT__execute_stage__DOT___GEN_17
            : vlSelfRef.ysyx_22041812__DOT__datapath__DOT__execute_stage__DOT___GEN_19);
    vlSelfRef.ysyx_22041812__DOT__datapath__DOT__execute_stage__DOT__brCond_io_rs1 
        = (((IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__execute_stage__DOT___T_12) 
            & ((IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__execute_stage__DOT___src_unready_T) 
               & (0ULL != vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__de_pipe_reg_src1_addr)))
            ? vlSelfRef.ysyx_22041812__DOT__datapath__DOT__execute_stage__DOT___GEN_13
            : vlSelfRef.ysyx_22041812__DOT__datapath__DOT__execute_stage__DOT___GEN_15);
    vlSelfRef.__VdfgRegularize_hebeb780c_0_402 = ((IData)(
                                                          (vlSelfRef.ysyx_22041812__DOT__datapath__DOT__execute_stage__DOT__brCond_io_rs2 
                                                           >> 0x00000020U)) 
                                                  & (- (IData)(
                                                               (0U 
                                                                == (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__de_pipe_reg_wd_type)))));
    vlSelfRef.ysyx_22041812__DOT__datapath__DOT__execute_stage__DOT__B_data 
        = ((IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__de_pipe_reg_B_sel)
            ? vlSelfRef.ysyx_22041812__DOT__datapath__DOT__execute_stage__DOT__brCond_io_rs2
            : vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__de_pipe_reg_imm);
    __VdfgRegularize_hebeb780c_0_403 = ((- (IData)(
                                                   (0U 
                                                    == (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__de_pipe_reg_wd_type)))) 
                                        & (IData)((vlSelfRef.ysyx_22041812__DOT__datapath__DOT__execute_stage__DOT__brCond_io_rs1 
                                                   >> 0x00000020U)));
    vlSelfRef.ysyx_22041812__DOT__datapath__DOT__execute_stage__DOT__brCond__DOT__eq 
        = (vlSelfRef.ysyx_22041812__DOT__datapath__DOT__execute_stage__DOT__brCond_io_rs1 
           == vlSelfRef.ysyx_22041812__DOT__datapath__DOT__execute_stage__DOT__brCond_io_rs2);
    vlSelfRef.ysyx_22041812__DOT__datapath__DOT__execute_stage__DOT__brCond__DOT__lt 
        = VL_LTS_IQQ(64, vlSelfRef.ysyx_22041812__DOT__datapath__DOT__execute_stage__DOT__brCond_io_rs1, vlSelfRef.ysyx_22041812__DOT__datapath__DOT__execute_stage__DOT__brCond_io_rs2);
    vlSelfRef.ysyx_22041812__DOT__datapath__DOT__execute_stage__DOT__brCond__DOT__ltu 
        = (vlSelfRef.ysyx_22041812__DOT__datapath__DOT__execute_stage__DOT__brCond_io_rs1 
           < vlSelfRef.ysyx_22041812__DOT__datapath__DOT__execute_stage__DOT__brCond_io_rs2);
    vlSelfRef.ysyx_22041812__DOT__datapath__DOT__execute_stage__DOT__A_data 
        = ((IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__de_pipe_reg_A_sel)
            ? vlSelfRef.ysyx_22041812__DOT__datapath__DOT__execute_stage__DOT__brCond_io_rs1
            : vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__de_pipe_reg_pc);
    vlSelfRef.ysyx_22041812__DOT__datapath__DOT__execute_stage__DOT__multiplier__DOT__src2 
        = (((QData)((IData)(vlSelfRef.__VdfgRegularize_hebeb780c_0_402)) 
            << 0x00000020U) | (QData)((IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__execute_stage__DOT__brCond_io_rs2)));
    vlSelfRef.ysyx_22041812__DOT__datapath__DOT__execute_stage__DOT__alu_io_B 
        = (((QData)((IData)(((IData)((vlSelfRef.ysyx_22041812__DOT__datapath__DOT__execute_stage__DOT__B_data 
                                      >> 0x00000020U)) 
                             & (- (IData)((1U != (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__de_pipe_reg_wd_type))))))) 
            << 0x00000020U) | (QData)((IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__execute_stage__DOT__B_data)));
    vlSelfRef.ysyx_22041812__DOT__datapath__DOT__execute_stage__DOT__alu__DOT__shamt 
        = ((((1U != (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__de_pipe_reg_wd_type)) 
             & (IData)((vlSelfRef.ysyx_22041812__DOT__datapath__DOT__execute_stage__DOT__B_data 
                        >> 5U))) << 5U) | (0x0000001fU 
                                           & (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__execute_stage__DOT__B_data)));
    vlSelfRef.ysyx_22041812__DOT__datapath__DOT__execute_stage__DOT__multiplier__DOT__src1_sign 
        = (1U & ((0U != (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__de_pipe_reg_wd_type))
                  ? (IData)((vlSelfRef.ysyx_22041812__DOT__datapath__DOT__execute_stage__DOT__brCond_io_rs1 
                             >> 0x0000001fU)) : (__VdfgRegularize_hebeb780c_0_403 
                                                 >> 0x0000001fU)));
    vlSelfRef.ysyx_22041812__DOT__datapath__DOT__execute_stage__DOT__multiplier__DOT__src1 
        = (((QData)((IData)(__VdfgRegularize_hebeb780c_0_403)) 
            << 0x00000020U) | (QData)((IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__execute_stage__DOT__brCond_io_rs1)));
    vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage_io_brCond_taken 
        = ((IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT___T_1) 
           & ((IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__de_pipe_reg_enable) 
              & (((~ (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__execute_stage__DOT__brCond__DOT__ltu)) 
                  & (4U == (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__de_pipe_reg_br_type))) 
                 | (((IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__execute_stage__DOT__brCond__DOT__ltu) 
                     & (1U == (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__de_pipe_reg_br_type))) 
                    | (((~ (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__execute_stage__DOT__brCond__DOT__lt)) 
                        & (5U == (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__de_pipe_reg_br_type))) 
                       | (((IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__execute_stage__DOT__brCond__DOT__lt) 
                           & (2U == (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__de_pipe_reg_br_type))) 
                          | (((IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__execute_stage__DOT__brCond__DOT__eq) 
                              & (3U == (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__de_pipe_reg_br_type))) 
                             | ((~ (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__execute_stage__DOT__brCond__DOT__eq)) 
                                & (6U == (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__de_pipe_reg_br_type))))))))));
    vlSelfRef.ysyx_22041812__DOT__datapath__DOT__execute_stage__DOT__alu_io_A 
        = (((QData)((IData)(((- (IData)((1U != (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__de_pipe_reg_wd_type)))) 
                             & (IData)((vlSelfRef.ysyx_22041812__DOT__datapath__DOT__execute_stage__DOT__A_data 
                                        >> 0x00000020U))))) 
            << 0x00000020U) | (QData)((IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__execute_stage__DOT__A_data)));
    vlSelfRef.ysyx_22041812__DOT__datapath__DOT__execute_stage__DOT__multiplier__DOT___multiplicand_reg_T_6 
        = (VL_GTS_IQQ(64, 0ULL, vlSelfRef.ysyx_22041812__DOT__datapath__DOT__execute_stage__DOT__multiplier__DOT__src1)
            ? (- vlSelfRef.ysyx_22041812__DOT__datapath__DOT__execute_stage__DOT__multiplier__DOT__src1)
            : vlSelfRef.ysyx_22041812__DOT__datapath__DOT__execute_stage__DOT__multiplier__DOT__src1);
    vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT___next_pc_T_4 
        = ((IData)(vlSelfRef.__VdfgRegularize_hebeb780c_0_304) 
           | (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage_io_brCond_taken));
    vlSelfRef.ysyx_22041812__DOT__datapath__DOT___flush_fd_T_1 
        = (((IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT___T_1) 
            & (IData)(vlSelfRef.__VdfgRegularize_hebeb780c_0_304)) 
           | (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage_io_brCond_taken));
    vlSelfRef.ysyx_22041812__DOT__datapath__DOT__execute_stage__DOT__alu__DOT___GEN_1[0U] 
        = (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__execute_stage__DOT__alu_io_A);
    vlSelfRef.ysyx_22041812__DOT__datapath__DOT__execute_stage__DOT__alu__DOT___GEN_1[1U] 
        = (IData)((vlSelfRef.ysyx_22041812__DOT__datapath__DOT__execute_stage__DOT__alu_io_A 
                   >> 0x00000020U));
    vlSelfRef.ysyx_22041812__DOT__datapath__DOT__execute_stage__DOT__alu__DOT___GEN_1[2U] = 0U;
    vlSelfRef.ysyx_22041812__DOT__datapath__DOT__execute_stage__DOT__alu__DOT___GEN_1[3U] = 0U;
    vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage_io_flush_fd 
        = (1U & ((IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT___flush_fd_T_1) 
                 | ((IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__icache_flush_tag) 
                    | ((IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__execute_stage__DOT__dcache_flush_tag) 
                       | ((IData)(__VdfgRegularize_hebeb780c_0_129) 
                          | (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__sfence_em))))));
    vlSelfRef.ysyx_22041812__DOT__datapath__DOT__execute_stage__DOT__multiplier_io_flush 
        = (1U & ((IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT___flush_fd_T_1) 
                 | ((IData)(vlSelfRef.__VdfgRegularize_hebeb780c_0_411) 
                    | (((IData)(__VdfgRegularize_hebeb780c_0_129) 
                        >> 1U) | (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__sfence_em)))));
    if ((0x0aU == (0x0000000fU & (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__de_pipe_reg_alu_op)))) {
        __Vtemp_5[0U] = vlSelfRef.ysyx_22041812__DOT__datapath__DOT__execute_stage__DOT__alu__DOT___GEN_1[0U];
        __Vtemp_5[1U] = vlSelfRef.ysyx_22041812__DOT__datapath__DOT__execute_stage__DOT__alu__DOT___GEN_1[1U];
        __Vtemp_5[2U] = vlSelfRef.ysyx_22041812__DOT__datapath__DOT__execute_stage__DOT__alu__DOT___GEN_1[2U];
        __Vtemp_5[3U] = vlSelfRef.ysyx_22041812__DOT__datapath__DOT__execute_stage__DOT__alu__DOT___GEN_1[3U];
    } else if ((4U == (0x0000000fU & (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__de_pipe_reg_alu_op)))) {
        __Vtemp_5[0U] = (IData)((vlSelfRef.ysyx_22041812__DOT__datapath__DOT__execute_stage__DOT__alu_io_B 
                                 ^ vlSelfRef.ysyx_22041812__DOT__datapath__DOT__execute_stage__DOT__alu_io_A));
        __Vtemp_5[1U] = (IData)(((vlSelfRef.ysyx_22041812__DOT__datapath__DOT__execute_stage__DOT__alu_io_B 
                                  ^ vlSelfRef.ysyx_22041812__DOT__datapath__DOT__execute_stage__DOT__alu_io_A) 
                                 >> 0x00000020U));
        __Vtemp_5[2U] = 0U;
        __Vtemp_5[3U] = 0U;
    } else if ((3U == (0x0000000fU & (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__de_pipe_reg_alu_op)))) {
        __Vtemp_5[0U] = (IData)((vlSelfRef.ysyx_22041812__DOT__datapath__DOT__execute_stage__DOT__alu_io_B 
                                 | vlSelfRef.ysyx_22041812__DOT__datapath__DOT__execute_stage__DOT__alu_io_A));
        __Vtemp_5[1U] = (IData)(((vlSelfRef.ysyx_22041812__DOT__datapath__DOT__execute_stage__DOT__alu_io_B 
                                  | vlSelfRef.ysyx_22041812__DOT__datapath__DOT__execute_stage__DOT__alu_io_A) 
                                 >> 0x00000020U));
        __Vtemp_5[2U] = 0U;
        __Vtemp_5[3U] = 0U;
    } else if ((2U == (0x0000000fU & (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__de_pipe_reg_alu_op)))) {
        __Vtemp_5[0U] = (IData)((vlSelfRef.ysyx_22041812__DOT__datapath__DOT__execute_stage__DOT__alu_io_B 
                                 & vlSelfRef.ysyx_22041812__DOT__datapath__DOT__execute_stage__DOT__alu_io_A));
        __Vtemp_5[1U] = (IData)(((vlSelfRef.ysyx_22041812__DOT__datapath__DOT__execute_stage__DOT__alu_io_B 
                                  & vlSelfRef.ysyx_22041812__DOT__datapath__DOT__execute_stage__DOT__alu_io_A) 
                                 >> 0x00000020U));
        __Vtemp_5[2U] = 0U;
        __Vtemp_5[3U] = 0U;
    } else if ((7U == (0x0000000fU & (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__de_pipe_reg_alu_op)))) {
        __Vtemp_5[0U] = (vlSelfRef.ysyx_22041812__DOT__datapath__DOT__execute_stage__DOT__alu_io_A 
                         < vlSelfRef.ysyx_22041812__DOT__datapath__DOT__execute_stage__DOT__alu_io_B);
        __Vtemp_5[1U] = 0U;
        __Vtemp_5[2U] = 0U;
        __Vtemp_5[3U] = 0U;
    } else if ((5U == (0x0000000fU & (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__de_pipe_reg_alu_op)))) {
        __Vtemp_5[0U] = VL_LTS_IQQ(64, vlSelfRef.ysyx_22041812__DOT__datapath__DOT__execute_stage__DOT__alu_io_A, vlSelfRef.ysyx_22041812__DOT__datapath__DOT__execute_stage__DOT__alu_io_B);
        __Vtemp_5[1U] = 0U;
        __Vtemp_5[2U] = 0U;
        __Vtemp_5[3U] = 0U;
    } else if ((6U == (0x0000000fU & (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__de_pipe_reg_alu_op)))) {
        VL_SHIFTL_WWI(127,127,6, __Vtemp_5, vlSelfRef.ysyx_22041812__DOT__datapath__DOT__execute_stage__DOT__alu__DOT___GEN_1, (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__execute_stage__DOT__alu__DOT__shamt));
    } else {
        __Vtemp_5[0U] = (IData)(((8U == (0x0000000fU 
                                         & (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__de_pipe_reg_alu_op)))
                                  ? (vlSelfRef.ysyx_22041812__DOT__datapath__DOT__execute_stage__DOT__alu_io_A 
                                     >> (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__execute_stage__DOT__alu__DOT__shamt))
                                  : ((9U == (0x0000000fU 
                                             & (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__de_pipe_reg_alu_op)))
                                      ? VL_SHIFTRS_QQI(64,64,6, 
                                                       (((QData)((IData)(
                                                                         ((1U 
                                                                           == (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__de_pipe_reg_wd_type))
                                                                           ? 
                                                                          (- (IData)(
                                                                                (1U 
                                                                                & (IData)(
                                                                                (vlSelfRef.ysyx_22041812__DOT__datapath__DOT__execute_stage__DOT__A_data 
                                                                                >> 0x0000001fU)))))
                                                                           : (IData)(
                                                                                (vlSelfRef.ysyx_22041812__DOT__datapath__DOT__execute_stage__DOT__A_data 
                                                                                >> 0x00000020U))))) 
                                                         << 0x00000020U) 
                                                        | (QData)((IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__execute_stage__DOT__A_data))), (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__execute_stage__DOT__alu__DOT__shamt))
                                      : ((1U == (0x0000000fU 
                                                 & (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__de_pipe_reg_alu_op)))
                                          ? (vlSelfRef.ysyx_22041812__DOT__datapath__DOT__execute_stage__DOT__alu_io_A 
                                             - vlSelfRef.ysyx_22041812__DOT__datapath__DOT__execute_stage__DOT__alu_io_B)
                                          : ((0U == 
                                              (0x0000000fU 
                                               & (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__de_pipe_reg_alu_op)))
                                              ? (vlSelfRef.ysyx_22041812__DOT__datapath__DOT__execute_stage__DOT__alu_io_B 
                                                 + vlSelfRef.ysyx_22041812__DOT__datapath__DOT__execute_stage__DOT__alu_io_A)
                                              : vlSelfRef.ysyx_22041812__DOT__datapath__DOT__execute_stage__DOT__alu_io_B)))));
        __Vtemp_5[1U] = (IData)((((8U == (0x0000000fU 
                                          & (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__de_pipe_reg_alu_op)))
                                   ? (vlSelfRef.ysyx_22041812__DOT__datapath__DOT__execute_stage__DOT__alu_io_A 
                                      >> (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__execute_stage__DOT__alu__DOT__shamt))
                                   : ((9U == (0x0000000fU 
                                              & (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__de_pipe_reg_alu_op)))
                                       ? VL_SHIFTRS_QQI(64,64,6, 
                                                        (((QData)((IData)(
                                                                          ((1U 
                                                                            == (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__de_pipe_reg_wd_type))
                                                                            ? 
                                                                           (- (IData)(
                                                                                (1U 
                                                                                & (IData)(
                                                                                (vlSelfRef.ysyx_22041812__DOT__datapath__DOT__execute_stage__DOT__A_data 
                                                                                >> 0x0000001fU)))))
                                                                            : (IData)(
                                                                                (vlSelfRef.ysyx_22041812__DOT__datapath__DOT__execute_stage__DOT__A_data 
                                                                                >> 0x00000020U))))) 
                                                          << 0x00000020U) 
                                                         | (QData)((IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__execute_stage__DOT__A_data))), (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__execute_stage__DOT__alu__DOT__shamt))
                                       : ((1U == (0x0000000fU 
                                                  & (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__de_pipe_reg_alu_op)))
                                           ? (vlSelfRef.ysyx_22041812__DOT__datapath__DOT__execute_stage__DOT__alu_io_A 
                                              - vlSelfRef.ysyx_22041812__DOT__datapath__DOT__execute_stage__DOT__alu_io_B)
                                           : ((0U == 
                                               (0x0000000fU 
                                                & (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__de_pipe_reg_alu_op)))
                                               ? (vlSelfRef.ysyx_22041812__DOT__datapath__DOT__execute_stage__DOT__alu_io_B 
                                                  + vlSelfRef.ysyx_22041812__DOT__datapath__DOT__execute_stage__DOT__alu_io_A)
                                               : vlSelfRef.ysyx_22041812__DOT__datapath__DOT__execute_stage__DOT__alu_io_B)))) 
                                 >> 0x00000020U));
        __Vtemp_5[2U] = 0U;
        __Vtemp_5[3U] = 0U;
    }
    vlSelfRef.ysyx_22041812__DOT__datapath__DOT__execute_stage__DOT__alu__DOT___out_T_41[0U] 
        = __Vtemp_5[0U];
    vlSelfRef.ysyx_22041812__DOT__datapath__DOT__execute_stage__DOT__alu__DOT___out_T_41[1U] 
        = __Vtemp_5[1U];
    vlSelfRef.ysyx_22041812__DOT__datapath__DOT__execute_stage__DOT__alu__DOT___out_T_41[2U] 
        = __Vtemp_5[2U];
    vlSelfRef.ysyx_22041812__DOT__datapath__DOT__execute_stage__DOT__alu__DOT___out_T_41[3U] 
        = (0x7fffffffU & __Vtemp_5[3U]);
    vlSelfRef.__VdfgRegularize_hebeb780c_0_330 = ((IData)(vlSelfRef.io_stall) 
                                                  | (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage_io_flush_fd));
    vlSelfRef.ysyx_22041812__DOT__datapath__DOT__execute_stage__DOT__divider__DOT___T_4 
        = ((~ (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__execute_stage__DOT__multiplier_io_flush)) 
           & (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__execute_stage__DOT__divider_io_div_valid));
    vlSelfRef.ysyx_22041812__DOT__datapath__DOT__execute_stage__DOT___GEN_5 
        = ((~ (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__execute_stage__DOT__multiplier_io_flush)) 
           & ((IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__execute_stage__DOT__mul_result_enable) 
              | (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__execute_stage__DOT__multiplier_io_out_valid)));
    vlSelfRef.ysyx_22041812__DOT__datapath__DOT__execute_stage__DOT___GEN_11 
        = ((~ (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__execute_stage__DOT__multiplier_io_flush)) 
           & ((IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__execute_stage__DOT__div_result_enable) 
              | (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__execute_stage__DOT__divider_io_out_valid)));
    vlSelfRef.ysyx_22041812__DOT__datapath__DOT__execute_stage__DOT__alu_io_out 
        = (((QData)((IData)(((1U == (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__de_pipe_reg_wd_type))
                              ? (- (IData)((vlSelfRef.ysyx_22041812__DOT__datapath__DOT__execute_stage__DOT__alu__DOT___out_T_41[0U] 
                                            >> 0x0000001fU)))
                              : vlSelfRef.ysyx_22041812__DOT__datapath__DOT__execute_stage__DOT__alu__DOT___out_T_41[1U]))) 
            << 0x00000020U) | (QData)((IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__execute_stage__DOT__alu__DOT___out_T_41[0U])));
    if (vlSelfRef.io_stall) {
        vlSelfRef.ysyx_22041812__DOT__datapath__DOT__memory_stage__DOT__st_mask 
            = (0x000000ffU & ((1U == (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__execute_stage__DOT__em_pipe_reg_st_type))
                               ? 0x0fU : ((2U == (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__execute_stage__DOT__em_pipe_reg_st_type))
                                           ? 3U : (1U 
                                                   | (- (IData)(
                                                                (3U 
                                                                 != (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__execute_stage__DOT__em_pipe_reg_st_type))))))));
        vlSelfRef.ysyx_22041812__DOT__datapath__DOT__memory_stage__DOT__dTLB_io_va 
            = vlSelfRef.ysyx_22041812__DOT__datapath__DOT__execute_stage__DOT__em_pipe_reg_alu_out;
    } else {
        vlSelfRef.ysyx_22041812__DOT__datapath__DOT__memory_stage__DOT__st_mask 
            = (0x000000ffU & ((1U == (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__de_pipe_reg_st_type))
                               ? 0x0fU : ((2U == (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__de_pipe_reg_st_type))
                                           ? 3U : (1U 
                                                   | (- (IData)(
                                                                (3U 
                                                                 != (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__de_pipe_reg_st_type))))))));
        vlSelfRef.ysyx_22041812__DOT__datapath__DOT__memory_stage__DOT__dTLB_io_va 
            = vlSelfRef.ysyx_22041812__DOT__datapath__DOT__execute_stage__DOT__alu_io_out;
    }
    vlSelfRef.ysyx_22041812__DOT__datapath__DOT__csr__DOT__excValue 
        = ((0x000000000000000cULL == vlSelfRef.ysyx_22041812__DOT__datapath__DOT__csr__DOT__excCause)
            ? vlSelfRef.ysyx_22041812__DOT__datapath__DOT__execute_stage__DOT__em_pipe_reg_pc
            : (((6ULL == vlSelfRef.ysyx_22041812__DOT__datapath__DOT__csr__DOT__excCause) 
                | ((4ULL == vlSelfRef.ysyx_22041812__DOT__datapath__DOT__csr__DOT__excCause) 
                   | ((0x000000000000000dULL == vlSelfRef.ysyx_22041812__DOT__datapath__DOT__csr__DOT__excCause) 
                      | (0x000000000000000fULL == vlSelfRef.ysyx_22041812__DOT__datapath__DOT__csr__DOT__excCause))))
                ? vlSelfRef.ysyx_22041812__DOT__datapath__DOT__execute_stage__DOT__alu_io_out
                : (((3ULL == vlSelfRef.ysyx_22041812__DOT__datapath__DOT__csr__DOT__excCause) 
                    | (0ULL == vlSelfRef.ysyx_22041812__DOT__datapath__DOT__csr__DOT__excCause))
                    ? vlSelfRef.ysyx_22041812__DOT__datapath__DOT__execute_stage__DOT__em_pipe_reg_pc
                    : (QData)((IData)((vlSelfRef.ysyx_22041812__DOT__datapath__DOT__execute_stage__DOT__em_pipe_reg_inst 
                                       & (- (IData)(
                                                    (2ULL 
                                                     == vlSelfRef.ysyx_22041812__DOT__datapath__DOT__csr__DOT__excCause)))))))));
    vlSelfRef.ysyx_22041812__DOT__datapath__DOT__csr__DOT___sepc_data_T_3 
        = ((((IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__execute_stage__DOT__em_pipe_reg_enable) 
             & ((IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__execute_stage__DOT__em_pipe_reg_jump_taken) 
                & (IData)(__VdfgRegularize_hebeb780c_0_324)))
             ? (vlSelfRef.ysyx_22041812__DOT__datapath__DOT__execute_stage__DOT__alu_io_out 
                >> 2U) : ((IData)(__VdfgRegularize_hebeb780c_0_321)
                           ? (vlSelfRef.ysyx_22041812__DOT__datapath__DOT__execute_stage__DOT__em_pipe_reg_pc 
                              >> 2U) : (vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__de_pipe_reg_pc 
                                        >> 2U))) << 2U);
    vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT___next_pc_T_6[0U] 
        = ((IData)((vlSelfRef.ysyx_22041812__DOT__datapath__DOT__execute_stage__DOT__alu_io_out 
                    >> 1U)) << 1U);
    vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT___next_pc_T_6[1U] 
        = (((IData)((vlSelfRef.ysyx_22041812__DOT__datapath__DOT__execute_stage__DOT__alu_io_out 
                     >> 1U)) >> 0x0000001fU) | ((IData)(
                                                        ((vlSelfRef.ysyx_22041812__DOT__datapath__DOT__execute_stage__DOT__alu_io_out 
                                                          >> 1U) 
                                                         >> 0x00000020U)) 
                                                << 1U));
    vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT___next_pc_T_6[2U] 
        = ((IData)(((vlSelfRef.ysyx_22041812__DOT__datapath__DOT__execute_stage__DOT__alu_io_out 
                     >> 1U) >> 0x00000020U)) >> 0x0000001fU);
    vlSelfRef.ysyx_22041812__DOT__datapath__DOT__execute_stage__DOT__is_clint 
        = ((IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__de_pipe_reg_enable) 
           & ((IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__execute_stage__DOT___is_clint_T_6) 
              & ((0x0000000002000000ULL <= vlSelfRef.ysyx_22041812__DOT__datapath__DOT__execute_stage__DOT__alu_io_out) 
                 & (0x000000000200ffffULL >= vlSelfRef.ysyx_22041812__DOT__datapath__DOT__execute_stage__DOT__alu_io_out))));
    vlSelfRef.ysyx_22041812__DOT__datapath__DOT__memory_stage__DOT__ls_stall 
        = ((IData)(vlSelfRef.io_stall) ? ((IData)(vlSelfRef.__VdfgRegularize_hebeb780c_0_300) 
                                          & ((~ (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__execute_stage__DOT__em_pipe_reg_is_clint)) 
                                             & (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__execute_stage__DOT__em_pipe_reg_enable)))
            : ((IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__execute_stage__DOT___is_clint_T_6) 
               & ((~ ((IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__execute_stage__DOT__is_clint) 
                      | (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage_io_flush_em))) 
                  & (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__decode_stage__DOT__de_pipe_reg_enable))));
    if (vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage_io_csr_trap) {
        vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__next_pc[0U] 
            = (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage_io_csr_trapVec);
        vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__next_pc[1U] 
            = (IData)((vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage_io_csr_trapVec 
                       >> 0x00000020U));
        vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__next_pc[2U] = 0U;
    } else if (vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT___next_pc_T_4) {
        vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__next_pc[0U] 
            = vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT___next_pc_T_6[0U];
        vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__next_pc[1U] 
            = vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT___next_pc_T_6[1U];
        vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__next_pc[2U] 
            = vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT___next_pc_T_6[2U];
    } else if (vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage_io_csr_atomic) {
        vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__next_pc[0U] 
            = (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage_io_csr_next_fetch);
        vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__next_pc[1U] 
            = (IData)((vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage_io_csr_next_fetch 
                       >> 0x00000020U));
        vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__next_pc[2U] = 0U;
    } else {
        vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__next_pc[0U] 
            = vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT___next_pc_T_12[0U];
        vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__next_pc[1U] 
            = vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT___next_pc_T_12[1U];
        vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__next_pc[2U] 
            = vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT___next_pc_T_12[2U];
    }
    vlSelfRef.ysyx_22041812__DOT__datapath__DOT__memory_stage__DOT__clint_io_addr 
        = ((IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__iTLB_io_valid)
            ? (QData)((IData)(((- (IData)((0U != (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT__tlb_state)))) 
                               & ((- (IData)((2U != (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT__tlb_state)))) 
                                  & (((5U == (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT__tlb_state))
                                       ? ((IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__iTLB__DOT__ppn_base) 
                                          + (0x00000ff8U 
                                             & ((IData)(
                                                        (vlSelfRef.ysyx_22041812__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT__va_reg 
                                                         >> 0x0000001eU)) 
                                                << 3U)))
                                       : ((4U == (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT__tlb_state))
                                           ? ((IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT___io_tlb_request_addr_T_4) 
                                              + (0x00000ff8U 
                                                 & ((IData)(
                                                            (vlSelfRef.ysyx_22041812__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT__va_reg 
                                                             >> 0x00000015U)) 
                                                    << 3U)))
                                           : ((3U == (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT__tlb_state))
                                               ? ((IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT___io_tlb_request_addr_T_4) 
                                                  + 
                                                  (0x00000ff8U 
                                                   & ((IData)(
                                                              (vlSelfRef.ysyx_22041812__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT__va_reg 
                                                               >> 0x0000000cU)) 
                                                      << 3U)))
                                               : ((- (IData)(
                                                             (6U 
                                                              != (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT__tlb_state)))) 
                                                  & ((- (IData)(
                                                                (7U 
                                                                 == (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT__tlb_state)))) 
                                                     & ((2U 
                                                         == (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT__page_size_reg))
                                                         ? 
                                                        (((IData)(
                                                                  (vlSelfRef.ysyx_22041812__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT__pte_reg_ppn 
                                                                   >> 0x00000012U)) 
                                                          << 0x0000001eU) 
                                                         | (0x3fffffffU 
                                                            & (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT__va_reg)))
                                                         : 
                                                        ((1U 
                                                          == (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT__page_size_reg))
                                                          ? 
                                                         (((IData)(
                                                                   (vlSelfRef.ysyx_22041812__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT__pte_reg_ppn 
                                                                    >> 9U)) 
                                                           << 0x00000015U) 
                                                          | (0x001fffffU 
                                                             & (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT__va_reg)))
                                                          : 
                                                         ((((IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT__pte_reg_ppn) 
                                                            << 0x0000000cU) 
                                                           | (0x00000fffU 
                                                              & (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT__va_reg))) 
                                                          & (IData)(
                                                                    (0x00ffffffffffffffULL 
                                                                     & (- (QData)((IData)(
                                                                                (0U 
                                                                                == (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT__page_size_reg))))))))))))))) 
                                     & (- (IData)((1U 
                                                   != (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT__tlb_state)))))))))
            : vlSelfRef.ysyx_22041812__DOT__datapath__DOT__memory_stage__DOT__dTLB_io_va);
    vlSelfRef.ysyx_22041812__DOT__dcache__DOT__align_addr 
        = ((IData)((vlSelfRef.ysyx_22041812__DOT__datapath__DOT__memory_stage__DOT__clint_io_addr 
                    >> 3U)) << 3U);
    if (vlSelfRef.ysyx_22041812__DOT__dcache__DOT__write_addr_reg) {
        vlSelfRef.ysyx_22041812__DOT__dcache__DOT___GEN_127 
            = (0x0000003fU & (IData)((vlSelfRef.ysyx_22041812__DOT__datapath__DOT__memory_stage__DOT__clint_io_addr 
                                      >> 4U)));
        vlSelfRef.ysyx_22041812__DOT__dcache__DOT___GEN_129 
            = (0x0000003fU & (IData)((vlSelfRef.ysyx_22041812__DOT__datapath__DOT__memory_stage__DOT__clint_io_addr 
                                      >> 4U)));
        vlSelfRef.ysyx_22041812__DOT__dcache__DOT___GEN_131 
            = (0x0000003fU & (IData)((vlSelfRef.ysyx_22041812__DOT__datapath__DOT__memory_stage__DOT__clint_io_addr 
                                      >> 4U)));
        vlSelfRef.ysyx_22041812__DOT__dcache__DOT___GEN_133 
            = (0x0000003fU & (IData)((vlSelfRef.ysyx_22041812__DOT__datapath__DOT__memory_stage__DOT__clint_io_addr 
                                      >> 4U)));
    } else {
        vlSelfRef.ysyx_22041812__DOT__dcache__DOT___GEN_127 
            = (0x0000003fU & ((0U == (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__index_in_line))
                               ? (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__flush_loop)
                               : (IData)((vlSelfRef.ysyx_22041812__DOT__datapath__DOT__memory_stage__DOT__clint_io_addr 
                                          >> 4U))));
        vlSelfRef.ysyx_22041812__DOT__dcache__DOT___GEN_129 
            = (0x0000003fU & ((1U == (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__index_in_line))
                               ? (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__flush_loop)
                               : (IData)((vlSelfRef.ysyx_22041812__DOT__datapath__DOT__memory_stage__DOT__clint_io_addr 
                                          >> 4U))));
        vlSelfRef.ysyx_22041812__DOT__dcache__DOT___GEN_131 
            = (0x0000003fU & ((2U == (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__index_in_line))
                               ? (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__flush_loop)
                               : (IData)((vlSelfRef.ysyx_22041812__DOT__datapath__DOT__memory_stage__DOT__clint_io_addr 
                                          >> 4U))));
        vlSelfRef.ysyx_22041812__DOT__dcache__DOT___GEN_133 
            = (0x0000003fU & ((3U == (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__index_in_line))
                               ? (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__flush_loop)
                               : (IData)((vlSelfRef.ysyx_22041812__DOT__datapath__DOT__memory_stage__DOT__clint_io_addr 
                                          >> 4U))));
    }
    vlSelfRef.__VdfgRegularize_hebeb780c_0_339 = ((
                                                   (~ (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__memory_stage__DOT__data_cache_tag)) 
                                                   | (IData)(vlSelfRef.__VdfgRegularize_hebeb780c_0_311)) 
                                                  & ((IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__execute_stage__DOT__dcache_flush_tag) 
                                                     | (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__memory_stage__DOT__ls_stall)));
    if (vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__iTLB_io_valid) {
        vlSelfRef.ysyx_22041812__DOT__datapath__DOT__memory_stage__DOT__dTLB_io_valid 
            = vlSelfRef.ysyx_22041812__DOT__datapath__DOT__memory_stage__DOT__ls_stall;
        vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT___io_icache_cpu_request_addr_T[0U] 
            = ((- (IData)((0U != (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__iTLB__DOT__tlb_state)))) 
               & ((- (IData)((2U != (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__iTLB__DOT__tlb_state)))) 
                  & (((5U == (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__iTLB__DOT__tlb_state))
                       ? ((IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__iTLB__DOT__ppn_base) 
                          + (0x00000ff8U & ((IData)(
                                                    (vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__iTLB__DOT__va_reg 
                                                     >> 0x0000001eU)) 
                                            << 3U)))
                       : ((4U == (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__iTLB__DOT__tlb_state))
                           ? ((IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__iTLB__DOT___io_tlb_request_addr_T_4) 
                              + (0x00000ff8U & ((IData)(
                                                        (vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__iTLB__DOT__va_reg 
                                                         >> 0x00000015U)) 
                                                << 3U)))
                           : ((3U == (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__iTLB__DOT__tlb_state))
                               ? ((IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__iTLB__DOT___io_tlb_request_addr_T_4) 
                                  + (0x00000ff8U & 
                                     ((IData)((vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__iTLB__DOT__va_reg 
                                               >> 0x0000000cU)) 
                                      << 3U))) : ((- (IData)(
                                                             (6U 
                                                              != (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__iTLB__DOT__tlb_state)))) 
                                                  & ((- (IData)(
                                                                (7U 
                                                                 == (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__iTLB__DOT__tlb_state)))) 
                                                     & ((2U 
                                                         == (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__iTLB__DOT__page_size_reg))
                                                         ? 
                                                        (((IData)(
                                                                  (vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__iTLB__DOT__pte_reg_ppn 
                                                                   >> 0x00000012U)) 
                                                          << 0x0000001eU) 
                                                         | (0x3fffffffU 
                                                            & (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__iTLB__DOT__va_reg)))
                                                         : 
                                                        ((1U 
                                                          == (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__iTLB__DOT__page_size_reg))
                                                          ? 
                                                         (((IData)(
                                                                   (vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__iTLB__DOT__pte_reg_ppn 
                                                                    >> 9U)) 
                                                           << 0x00000015U) 
                                                          | (0x001fffffU 
                                                             & (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__iTLB__DOT__va_reg)))
                                                          : 
                                                         ((((IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__iTLB__DOT__pte_reg_ppn) 
                                                            << 0x0000000cU) 
                                                           | (0x00000fffU 
                                                              & (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__iTLB__DOT__va_reg))) 
                                                          & (IData)(
                                                                    (0x00ffffffffffffffULL 
                                                                     & (- (QData)((IData)(
                                                                                (0U 
                                                                                == (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__iTLB__DOT__page_size_reg))))))))))))))) 
                     & (- (IData)((1U != (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__iTLB__DOT__tlb_state)))))));
        vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT___io_icache_cpu_request_addr_T[1U] = 0U;
        vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT___io_icache_cpu_request_addr_T[2U] = 0U;
    } else {
        vlSelfRef.ysyx_22041812__DOT__datapath__DOT__memory_stage__DOT__dTLB_io_valid = 0U;
        vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT___io_icache_cpu_request_addr_T[0U] 
            = vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__next_pc[0U];
        vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT___io_icache_cpu_request_addr_T[1U] 
            = vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__next_pc[1U];
        vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT___io_icache_cpu_request_addr_T[2U] 
            = vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__next_pc[2U];
    }
    vlSelfRef.ysyx_22041812__DOT__icache__DOT__align_addr 
        = (0xfffffff8U & vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT___io_icache_cpu_request_addr_T[0U]);
    vlSelfRef.ysyx_22041812__DOT__icache__DOT__data_mem_0_io_cache_req_index 
        = (0x0000003fU & ((0U == (IData)(vlSelfRef.ysyx_22041812__DOT__icache__DOT__cache_state))
                           ? ((vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT___io_icache_cpu_request_addr_T[0U] 
                               << 0x0000001cU) | (vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT___io_icache_cpu_request_addr_T[0U] 
                                                  >> 4U))
                           : ((0x0fU == (IData)(vlSelfRef.ysyx_22041812__DOT__icache__DOT__cache_state))
                               ? ((vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT___io_icache_cpu_request_addr_T[0U] 
                                   << 0x0000001cU) 
                                  | (vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT___io_icache_cpu_request_addr_T[0U] 
                                     >> 4U)) : ((0x10U 
                                                 == (IData)(vlSelfRef.ysyx_22041812__DOT__icache__DOT__cache_state))
                                                 ? 
                                                ((vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT___io_icache_cpu_request_addr_T[0U] 
                                                  << 0x0000001cU) 
                                                 | (vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT___io_icache_cpu_request_addr_T[0U] 
                                                    >> 4U))
                                                 : 
                                                ((0x11U 
                                                  == (IData)(vlSelfRef.ysyx_22041812__DOT__icache__DOT__cache_state))
                                                  ? (IData)(vlSelfRef.ysyx_22041812__DOT__icache__DOT__flush_loop)
                                                  : 
                                                 ((vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT___io_icache_cpu_request_addr_T[0U] 
                                                   << 0x0000001cU) 
                                                  | (vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT___io_icache_cpu_request_addr_T[0U] 
                                                     >> 4U)))))));
    if ((0U == (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__cache_state))) {
        vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_0_io_cache_req_index 
            = (0x0000003fU & (IData)((vlSelfRef.ysyx_22041812__DOT__datapath__DOT__memory_stage__DOT__clint_io_addr 
                                      >> 4U)));
        vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_1_io_cache_req_index 
            = (0x0000003fU & (IData)((vlSelfRef.ysyx_22041812__DOT__datapath__DOT__memory_stage__DOT__clint_io_addr 
                                      >> 4U)));
        vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_2_io_cache_req_index 
            = (0x0000003fU & (IData)((vlSelfRef.ysyx_22041812__DOT__datapath__DOT__memory_stage__DOT__clint_io_addr 
                                      >> 4U)));
        vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_3_io_cache_req_index 
            = (0x0000003fU & (IData)((vlSelfRef.ysyx_22041812__DOT__datapath__DOT__memory_stage__DOT__clint_io_addr 
                                      >> 4U)));
    } else if ((0x0fU == (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__cache_state))) {
        vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_0_io_cache_req_index 
            = (0x0000003fU & (IData)((vlSelfRef.ysyx_22041812__DOT__datapath__DOT__memory_stage__DOT__clint_io_addr 
                                      >> 4U)));
        vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_1_io_cache_req_index 
            = (0x0000003fU & (IData)((vlSelfRef.ysyx_22041812__DOT__datapath__DOT__memory_stage__DOT__clint_io_addr 
                                      >> 4U)));
        vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_2_io_cache_req_index 
            = (0x0000003fU & (IData)((vlSelfRef.ysyx_22041812__DOT__datapath__DOT__memory_stage__DOT__clint_io_addr 
                                      >> 4U)));
        vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_3_io_cache_req_index 
            = (0x0000003fU & (IData)((vlSelfRef.ysyx_22041812__DOT__datapath__DOT__memory_stage__DOT__clint_io_addr 
                                      >> 4U)));
    } else if ((0x10U == (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__cache_state))) {
        vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_0_io_cache_req_index 
            = (0x0000003fU & (IData)((vlSelfRef.ysyx_22041812__DOT__datapath__DOT__memory_stage__DOT__clint_io_addr 
                                      >> 4U)));
        vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_1_io_cache_req_index 
            = (0x0000003fU & (IData)((vlSelfRef.ysyx_22041812__DOT__datapath__DOT__memory_stage__DOT__clint_io_addr 
                                      >> 4U)));
        vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_2_io_cache_req_index 
            = (0x0000003fU & (IData)((vlSelfRef.ysyx_22041812__DOT__datapath__DOT__memory_stage__DOT__clint_io_addr 
                                      >> 4U)));
        vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_3_io_cache_req_index 
            = (0x0000003fU & (IData)((vlSelfRef.ysyx_22041812__DOT__datapath__DOT__memory_stage__DOT__clint_io_addr 
                                      >> 4U)));
    } else if ((0x11U == (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__cache_state))) {
        if (vlSelfRef.ysyx_22041812__DOT__dcache__DOT__write_data_reg) {
            vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_0_io_cache_req_index 
                = (0x0000003fU & (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT___GEN_127));
            vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_1_io_cache_req_index 
                = (0x0000003fU & (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT___GEN_129));
            vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_2_io_cache_req_index 
                = (0x0000003fU & (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT___GEN_131));
            vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_3_io_cache_req_index 
                = (0x0000003fU & (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT___GEN_133));
        } else {
            vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_0_io_cache_req_index 
                = (0x0000003fU & ((0U == (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__index_in_line))
                                   ? (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__flush_loop)
                                   : (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT___GEN_127)));
            vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_1_io_cache_req_index 
                = (0x0000003fU & ((1U == (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__index_in_line))
                                   ? (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__flush_loop)
                                   : (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT___GEN_129)));
            vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_2_io_cache_req_index 
                = (0x0000003fU & ((2U == (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__index_in_line))
                                   ? (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__flush_loop)
                                   : (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT___GEN_131)));
            vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_3_io_cache_req_index 
                = (0x0000003fU & ((3U == (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__index_in_line))
                                   ? (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__flush_loop)
                                   : (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT___GEN_133)));
        }
    } else {
        vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_0_io_cache_req_index 
            = (0x0000003fU & (IData)((vlSelfRef.ysyx_22041812__DOT__datapath__DOT__memory_stage__DOT__clint_io_addr 
                                      >> 4U)));
        vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_1_io_cache_req_index 
            = (0x0000003fU & (IData)((vlSelfRef.ysyx_22041812__DOT__datapath__DOT__memory_stage__DOT__clint_io_addr 
                                      >> 4U)));
        vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_2_io_cache_req_index 
            = (0x0000003fU & (IData)((vlSelfRef.ysyx_22041812__DOT__datapath__DOT__memory_stage__DOT__clint_io_addr 
                                      >> 4U)));
        vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_3_io_cache_req_index 
            = (0x0000003fU & (IData)((vlSelfRef.ysyx_22041812__DOT__datapath__DOT__memory_stage__DOT__clint_io_addr 
                                      >> 4U)));
    }
    vlSelfRef.ysyx_22041812__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT___io_tlb_ready_T 
        = (1U & (~ (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__memory_stage__DOT__dTLB_io_valid)));
    vlSelfRef.__VdfgRegularize_hebeb780c_0_332 = ((IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT___io_tlb_ready_T) 
                                                  & ((2U 
                                                      != (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT__tlb_state)) 
                                                     & (0U 
                                                        != (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT__tlb_state))));
    vlSelfRef.ysyx_22041812__DOT__datapath__DOT__memory_stage__DOT__dTLB_io_fault 
        = ((- (IData)((1U & (~ (IData)(vlSelfRef.__VdfgRegularize_hebeb780c_0_332))))) 
           & ((- (IData)((0U != (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT__tlb_state)))) 
              & (((1U == (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT__tlb_state))
                   ? ((- (IData)((IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__iTLB__DOT___T_3))) 
                      & ((- (IData)((IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT__matchList_0))) 
                         & ((- (IData)((IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT___T_186))) 
                            & (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT___io_fault_T_4))))
                   : ((5U == (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT__tlb_state))
                       ? (((IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT___T_195)
                            ? (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT___io_fault_T_4)
                            : ((- (IData)((IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT___T_196))) 
                               & ((- (IData)((0U != 
                                              (0x0003ffffU 
                                               & (IData)(
                                                         (vlSelfRef.ysyx_22041812__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT___T_197 
                                                          >> 0x0000000aU)))))) 
                                  & (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT___io_fault_T_4)))) 
                          & (- (IData)((IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT___T_191))))
                       : ((4U == (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT__tlb_state))
                           ? (((IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT___T_195)
                                ? (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT___io_fault_T_4)
                                : ((- (IData)((IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT___T_196))) 
                                   & ((- (IData)((0U 
                                                  != 
                                                  (0x000001ffU 
                                                   & (IData)(
                                                             (vlSelfRef.ysyx_22041812__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT___T_197 
                                                              >> 0x0000000aU)))))) 
                                      & (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT___io_fault_T_4)))) 
                              & (- (IData)((IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT___T_191))))
                           : ((3U == (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT__tlb_state))
                               ? ((- (IData)((IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT___T_191))) 
                                  & ((- (IData)((IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT___T_224))) 
                                     & (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT___io_fault_T_4)))
                               : (((IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT___T_249)
                                    ? ((- (IData)((IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT___T_255))) 
                                       & (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT___io_fault_T_4))
                                    : (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT___io_fault_T_4)) 
                                  & (- (IData)((6U 
                                                == (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT__tlb_state))))))))) 
                 & (- (IData)((2U != (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT__tlb_state)))))));
    vlSelfRef.ysyx_22041812__DOT__datapath__DOT__memory_stage__DOT__dTLB_io_tlb_request_valid 
        = ((~ (IData)(vlSelfRef.__VdfgRegularize_hebeb780c_0_332)) 
           & ((0U != (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT__tlb_state)) 
              & ((2U != (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT__tlb_state)) 
                 & (((5U == (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT__tlb_state)) 
                     | ((4U == (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT__tlb_state)) 
                        | ((3U == (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT__tlb_state)) 
                           | ((7U == (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT__tlb_state)) 
                              & (6U != (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT__tlb_state)))))) 
                    & (1U != (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT__tlb_state))))));
    vlSelfRef.ysyx_22041812__DOT__datapath__DOT__memory_stage__DOT__dTLB_io_tlb_ready 
        = (1U & (((0U == (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT__tlb_state))
                   ? (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT___io_tlb_ready_T)
                   : (((1U == (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT__tlb_state))
                        ? ((IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__iTLB__DOT___T_3) 
                           & ((IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT___T_186) 
                              & (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT__matchList_0)))
                        : ((5U == (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT__tlb_state))
                            ? ((((IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT___T_196) 
                                 & (0U != (0x0003ffffU 
                                           & (IData)(
                                                     (vlSelfRef.ysyx_22041812__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT___T_197 
                                                      >> 0x0000000aU))))) 
                                | (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT___T_195)) 
                               & (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT___T_191))
                            : ((4U == (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT__tlb_state))
                                ? ((((IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT___T_196) 
                                     & (0U != (0x000001ffU 
                                               & (IData)(
                                                         (vlSelfRef.ysyx_22041812__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT___T_197 
                                                          >> 0x0000000aU))))) 
                                    | (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT___T_195)) 
                                   & (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT___T_191))
                                : ((3U == (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT__tlb_state))
                                    ? ((IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT___T_224) 
                                       & (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT___T_191))
                                    : ((6U == (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT__tlb_state))
                                        ? ((~ (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT___T_249)) 
                                           | (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT___T_255))
                                        : ((7U == (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT__tlb_state)) 
                                           & (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT___T_191))))))) 
                      | (2U == (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__memory_stage__DOT__dTLB__DOT__tlb_state)))) 
                 | (IData)(vlSelfRef.__VdfgRegularize_hebeb780c_0_332)));
    vlSelfRef.ysyx_22041812__DOT__datapath__DOT__memory_stage_io_dcache_cpu_request_valid 
        = ((IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__iTLB_io_valid)
            ? (((~ (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__memory_stage__DOT__data_cache_tag)) 
                & (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__execute_stage__DOT__dcache_flush_tag)) 
               | ((IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__memory_stage__DOT__ls_stall) 
                  & ((~ (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__memory_stage__DOT__dTLB_io_tlb_ready)) 
                     & (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__memory_stage__DOT__dTLB_io_tlb_request_valid))))
            : (IData)(vlSelfRef.__VdfgRegularize_hebeb780c_0_339));
    vlSelfRef.ysyx_22041812__DOT__datapath__DOT__memory_stage__DOT__mem_response 
        = (((IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__fetch_stage__DOT__iTLB_io_valid)
             ? (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__memory_stage__DOT__dTLB_io_tlb_request_valid)
             : (IData)(vlSelfRef.__VdfgRegularize_hebeb780c_0_339)) 
           & (IData)(vlSelfRef.ysyx_22041812__DOT__datapath__DOT__memory_stage__DOT__dTLB_io_cache_response_ready));
}

void Vysyx_22041812___024root___nba_sequent__TOP__2(Vysyx_22041812___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vysyx_22041812___024root___nba_sequent__TOP__2\n"); );
    Vysyx_22041812__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Locals
    VlWide<4>/*127:0*/ __Vtemp_1;
    // Body
    vlSelfRef.ysyx_22041812__DOT__dcache__DOT___tag_mem_0_io_tag_write_visit_T_4 
        = (0x000000ffU & ((0U == (0x000000ffU & (~ (IData)(vlSymsp->TOP__ysyx_22041812__DOT__dcache__DOT__tag_mem_0.io_tag_read_visit))))
                           ? (IData)(vlSymsp->TOP__ysyx_22041812__DOT__dcache__DOT__tag_mem_0.io_tag_read_visit)
                           : ((IData)(1U) + (IData)(vlSymsp->TOP__ysyx_22041812__DOT__dcache__DOT__tag_mem_0.io_tag_read_visit))));
    vlSelfRef.ysyx_22041812__DOT__dcache__DOT__is_match_0 
        = ((0U != (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__cache_state)) 
           & ((0x0fU != (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__cache_state)) 
              & ((0x10U == (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__cache_state))
                  ? (IData)(vlSymsp->TOP__ysyx_22041812__DOT__dcache__DOT__tag_mem_0.io_tag_read_valid)
                  : ((0x11U != (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__cache_state)) 
                     & ((0x13U != (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__cache_state)) 
                        & ((1U != (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__cache_state)) 
                           & ((3U != (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__cache_state)) 
                              & ((4U != (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__cache_state)) 
                                 & ((5U != (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__cache_state)) 
                                    & ((6U == (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__cache_state)) 
                                       & ((IData)(vlSymsp->TOP__ysyx_22041812__DOT__dcache__DOT__tag_mem_0.io_tag_read_valid) 
                                          & ((vlSelfRef.ysyx_22041812__DOT__dcache__DOT__cpu_request_addr_reg 
                                              >> 0x0000000aU) 
                                             == vlSymsp->TOP__ysyx_22041812__DOT__dcache__DOT__tag_mem_0.io_tag_read_tag))))))))))));
    vlSelfRef.ysyx_22041812__DOT__icache__DOT___tag_mem_0_io_tag_write_visit_T_4 
        = (0x000000ffU & ((0U == (0x000000ffU & (~ (IData)(vlSymsp->TOP__ysyx_22041812__DOT__icache__DOT__tag_mem_0.io_tag_read_visit))))
                           ? (IData)(vlSymsp->TOP__ysyx_22041812__DOT__icache__DOT__tag_mem_0.io_tag_read_visit)
                           : ((IData)(1U) + (IData)(vlSymsp->TOP__ysyx_22041812__DOT__icache__DOT__tag_mem_0.io_tag_read_visit))));
    vlSelfRef.ysyx_22041812__DOT__icache__DOT__is_match_0 
        = ((0U != (IData)(vlSelfRef.ysyx_22041812__DOT__icache__DOT__cache_state)) 
           & ((0x0fU != (IData)(vlSelfRef.ysyx_22041812__DOT__icache__DOT__cache_state)) 
              & ((0x10U != (IData)(vlSelfRef.ysyx_22041812__DOT__icache__DOT__cache_state)) 
                 & ((0x11U != (IData)(vlSelfRef.ysyx_22041812__DOT__icache__DOT__cache_state)) 
                    & ((0x13U != (IData)(vlSelfRef.ysyx_22041812__DOT__icache__DOT__cache_state)) 
                       & ((1U != (IData)(vlSelfRef.ysyx_22041812__DOT__icache__DOT__cache_state)) 
                          & ((3U != (IData)(vlSelfRef.ysyx_22041812__DOT__icache__DOT__cache_state)) 
                             & ((4U != (IData)(vlSelfRef.ysyx_22041812__DOT__icache__DOT__cache_state)) 
                                & ((5U != (IData)(vlSelfRef.ysyx_22041812__DOT__icache__DOT__cache_state)) 
                                   & ((6U == (IData)(vlSelfRef.ysyx_22041812__DOT__icache__DOT__cache_state)) 
                                      & ((IData)(vlSymsp->TOP__ysyx_22041812__DOT__icache__DOT__tag_mem_0.io_tag_read_valid) 
                                         & ((vlSelfRef.ysyx_22041812__DOT__icache__DOT__cpu_request_addr_reg 
                                             >> 0x0000000aU) 
                                            == vlSymsp->TOP__ysyx_22041812__DOT__icache__DOT__tag_mem_0.io_tag_read_tag))))))))))));
    vlSelfRef.ysyx_22041812__DOT__dcache__DOT___tag_mem_3_io_tag_write_visit_T_4 
        = (0x000000ffU & ((0U == (0x000000ffU & (~ (IData)(vlSymsp->TOP__ysyx_22041812__DOT__dcache__DOT__tag_mem_3.io_tag_read_visit))))
                           ? (IData)(vlSymsp->TOP__ysyx_22041812__DOT__dcache__DOT__tag_mem_3.io_tag_read_visit)
                           : ((IData)(1U) + (IData)(vlSymsp->TOP__ysyx_22041812__DOT__dcache__DOT__tag_mem_3.io_tag_read_visit))));
    vlSelfRef.ysyx_22041812__DOT__dcache__DOT__is_match_3 
        = ((0U != (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__cache_state)) 
           & ((0x0fU != (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__cache_state)) 
              & ((0x10U == (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__cache_state))
                  ? (IData)(vlSymsp->TOP__ysyx_22041812__DOT__dcache__DOT__tag_mem_3.io_tag_read_valid)
                  : ((0x11U != (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__cache_state)) 
                     & ((0x13U != (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__cache_state)) 
                        & ((1U != (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__cache_state)) 
                           & ((3U != (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__cache_state)) 
                              & ((4U != (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__cache_state)) 
                                 & ((5U != (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__cache_state)) 
                                    & ((6U == (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__cache_state)) 
                                       & ((IData)(vlSymsp->TOP__ysyx_22041812__DOT__dcache__DOT__tag_mem_3.io_tag_read_valid) 
                                          & ((vlSelfRef.ysyx_22041812__DOT__dcache__DOT__cpu_request_addr_reg 
                                              >> 0x0000000aU) 
                                             == vlSymsp->TOP__ysyx_22041812__DOT__dcache__DOT__tag_mem_3.io_tag_read_tag))))))))))));
    vlSelfRef.ysyx_22041812__DOT__dcache__DOT___tag_mem_2_io_tag_write_visit_T_4 
        = (0x000000ffU & ((0U == (0x000000ffU & (~ (IData)(vlSymsp->TOP__ysyx_22041812__DOT__dcache__DOT__tag_mem_2.io_tag_read_visit))))
                           ? (IData)(vlSymsp->TOP__ysyx_22041812__DOT__dcache__DOT__tag_mem_2.io_tag_read_visit)
                           : ((IData)(1U) + (IData)(vlSymsp->TOP__ysyx_22041812__DOT__dcache__DOT__tag_mem_2.io_tag_read_visit))));
    vlSelfRef.ysyx_22041812__DOT__dcache__DOT__is_match_2 
        = ((0U != (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__cache_state)) 
           & ((0x0fU != (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__cache_state)) 
              & ((0x10U == (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__cache_state))
                  ? (IData)(vlSymsp->TOP__ysyx_22041812__DOT__dcache__DOT__tag_mem_2.io_tag_read_valid)
                  : ((0x11U != (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__cache_state)) 
                     & ((0x13U != (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__cache_state)) 
                        & ((1U != (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__cache_state)) 
                           & ((3U != (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__cache_state)) 
                              & ((4U != (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__cache_state)) 
                                 & ((5U != (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__cache_state)) 
                                    & ((6U == (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__cache_state)) 
                                       & ((IData)(vlSymsp->TOP__ysyx_22041812__DOT__dcache__DOT__tag_mem_2.io_tag_read_valid) 
                                          & ((vlSelfRef.ysyx_22041812__DOT__dcache__DOT__cpu_request_addr_reg 
                                              >> 0x0000000aU) 
                                             == vlSymsp->TOP__ysyx_22041812__DOT__dcache__DOT__tag_mem_2.io_tag_read_tag))))))))))));
    vlSelfRef.ysyx_22041812__DOT__dcache__DOT___tag_mem_1_io_tag_write_visit_T_4 
        = (0x000000ffU & ((0U == (0x000000ffU & (~ (IData)(vlSymsp->TOP__ysyx_22041812__DOT__dcache__DOT__tag_mem_1.io_tag_read_visit))))
                           ? (IData)(vlSymsp->TOP__ysyx_22041812__DOT__dcache__DOT__tag_mem_1.io_tag_read_visit)
                           : ((IData)(1U) + (IData)(vlSymsp->TOP__ysyx_22041812__DOT__dcache__DOT__tag_mem_1.io_tag_read_visit))));
    vlSelfRef.ysyx_22041812__DOT__dcache__DOT__is_match_1 
        = ((0U != (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__cache_state)) 
           & ((0x0fU != (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__cache_state)) 
              & ((0x10U == (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__cache_state))
                  ? (IData)(vlSymsp->TOP__ysyx_22041812__DOT__dcache__DOT__tag_mem_1.io_tag_read_valid)
                  : ((0x11U != (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__cache_state)) 
                     & ((0x13U != (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__cache_state)) 
                        & ((1U != (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__cache_state)) 
                           & ((3U != (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__cache_state)) 
                              & ((4U != (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__cache_state)) 
                                 & ((5U != (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__cache_state)) 
                                    & ((6U == (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__cache_state)) 
                                       & ((IData)(vlSymsp->TOP__ysyx_22041812__DOT__dcache__DOT__tag_mem_1.io_tag_read_valid) 
                                          & ((vlSelfRef.ysyx_22041812__DOT__dcache__DOT__cpu_request_addr_reg 
                                              >> 0x0000000aU) 
                                             == vlSymsp->TOP__ysyx_22041812__DOT__dcache__DOT__tag_mem_1.io_tag_read_tag))))))))))));
    vlSelfRef.ysyx_22041812__DOT__dcache__DOT___GEN_295 
        = ((IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__cpu_request_rw) 
           & (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__is_match_0));
    vlSelfRef.ysyx_22041812__DOT__dcache__DOT___GEN_223 
        = ((IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__is_match_0) 
           | (IData)(vlSymsp->TOP__ysyx_22041812__DOT__dcache__DOT__tag_mem_0.io_tag_read_valid));
    vlSelfRef.ysyx_22041812__DOT__dcache__DOT___GEN_32 
        = ((0U == (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__index_in_line)) 
           & ((~ (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__is_match_0)) 
              & (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT___GEN_20)));
    vlSelfRef.ysyx_22041812__DOT__dcache__DOT___GEN_30 
        = ((0U == (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__index_in_line)) 
           & ((~ (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__is_match_0)) 
              & (3U != (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__index_in_line))));
    vlSelfRef.ysyx_22041812__DOT__icache__DOT___GEN_223 
        = ((IData)(vlSelfRef.ysyx_22041812__DOT__icache__DOT__is_match_0) 
           | (IData)(vlSymsp->TOP__ysyx_22041812__DOT__icache__DOT__tag_mem_0.io_tag_read_valid));
    vlSelfRef.ysyx_22041812__DOT__dcache__DOT___GEN_308 
        = ((IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__cpu_request_rw) 
           & (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__is_match_3));
    vlSelfRef.ysyx_22041812__DOT__dcache__DOT___GEN_247 
        = ((IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__is_match_3) 
           | (IData)(vlSymsp->TOP__ysyx_22041812__DOT__dcache__DOT__tag_mem_3.io_tag_read_valid));
    vlSelfRef.ysyx_22041812__DOT__dcache__DOT___GEN_305 
        = ((IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__cpu_request_rw) 
           & (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__is_match_2));
    vlSelfRef.ysyx_22041812__DOT__dcache__DOT___GEN_239 
        = ((IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__is_match_2) 
           | (IData)(vlSymsp->TOP__ysyx_22041812__DOT__dcache__DOT__tag_mem_2.io_tag_read_valid));
    vlSelfRef.ysyx_22041812__DOT__dcache__DOT___GEN_302 
        = ((IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__cpu_request_rw) 
           & (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__is_match_1));
    vlSelfRef.ysyx_22041812__DOT__dcache__DOT___GEN_231 
        = ((IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__is_match_1) 
           | (IData)(vlSymsp->TOP__ysyx_22041812__DOT__dcache__DOT__tag_mem_1.io_tag_read_valid));
    vlSelfRef.__VdfgRegularize_hebeb780c_0_0 = ((IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__is_match_0) 
                                                | ((IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__is_match_1) 
                                                   | ((IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__is_match_3) 
                                                      | (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__is_match_2))));
    if ((0U == (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__index_in_line))) {
        if (vlSelfRef.ysyx_22041812__DOT__dcache__DOT__is_match_0) {
            vlSelfRef.ysyx_22041812__DOT__dcache__DOT___GEN_31 
                = vlSelfRef.ysyx_22041812__DOT__dcache__DOT__flush_over;
            vlSelfRef.ysyx_22041812__DOT__dcache__DOT___GEN_29 
                = ((vlSymsp->TOP__ysyx_22041812__DOT__dcache__DOT__tag_mem_0.io_tag_read_tag 
                    << 0x0000000aU) | ((IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__flush_loop) 
                                       << 4U));
        } else {
            vlSelfRef.ysyx_22041812__DOT__dcache__DOT___GEN_31 
                = vlSelfRef.ysyx_22041812__DOT__dcache__DOT___GEN_19;
            vlSelfRef.ysyx_22041812__DOT__dcache__DOT___GEN_29 
                = vlSelfRef.ysyx_22041812__DOT__dcache__DOT__writeback_addr;
        }
    } else {
        vlSelfRef.ysyx_22041812__DOT__dcache__DOT___GEN_31 
            = vlSelfRef.ysyx_22041812__DOT__dcache__DOT__flush_over;
        vlSelfRef.ysyx_22041812__DOT__dcache__DOT___GEN_29 
            = vlSelfRef.ysyx_22041812__DOT__dcache__DOT__writeback_addr;
    }
    vlSelfRef.ysyx_22041812__DOT__dcache__DOT__cache_data_0 
        = ((- (QData)((IData)((0U != (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__cache_state))))) 
           & ((- (QData)((IData)((0x0fU != (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__cache_state))))) 
              & (((0x11U == (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__cache_state))
                   ? (((3U == (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__index_in_line))
                        ? (((QData)((IData)(vlSelfRef.ysyx_22041812__DOT__sram7_Q[1U])) 
                            << 0x00000020U) | (QData)((IData)(vlSelfRef.ysyx_22041812__DOT__sram7_Q[0U])))
                        : ((2U == (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__index_in_line))
                            ? (((QData)((IData)(vlSelfRef.ysyx_22041812__DOT__sram6_Q[1U])) 
                                << 0x00000020U) | (QData)((IData)(vlSelfRef.ysyx_22041812__DOT__sram6_Q[0U])))
                            : ((1U == (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__index_in_line))
                                ? (((QData)((IData)(vlSelfRef.ysyx_22041812__DOT__sram5_Q[1U])) 
                                    << 0x00000020U) 
                                   | (QData)((IData)(vlSelfRef.ysyx_22041812__DOT__sram5_Q[0U])))
                                : ((((QData)((IData)(vlSelfRef.ysyx_22041812__DOT__sram4_Q[1U])) 
                                     << 0x00000020U) 
                                    | (QData)((IData)(vlSelfRef.ysyx_22041812__DOT__sram4_Q[0U]))) 
                                   & (- (QData)((IData)(
                                                        (0U 
                                                         == (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__index_in_line))))))))) 
                      & (- (QData)((IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT___T_40))))
                   : ((- (QData)((IData)((0x13U != (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__cache_state))))) 
                      & ((- (QData)((IData)((1U != (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__cache_state))))) 
                         & ((- (QData)((IData)((3U 
                                                != (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__cache_state))))) 
                            & ((- (QData)((IData)((4U 
                                                   != (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__cache_state))))) 
                               & (((6U == (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__cache_state))
                                    ? ((- (QData)((IData)(vlSelfRef.__VdfgRegularize_hebeb780c_0_0))) 
                                       & (((IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__is_match_3)
                                            ? vlSelfRef.ysyx_22041812__DOT__dcache__DOT___GEN_284
                                            : ((IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__is_match_2)
                                                ? vlSelfRef.ysyx_22041812__DOT__dcache__DOT___GEN_284
                                                : ((IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__is_match_1)
                                                    ? vlSelfRef.ysyx_22041812__DOT__dcache__DOT___GEN_284
                                                    : 
                                                   ((- (QData)((IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__is_match_0))) 
                                                    & vlSelfRef.ysyx_22041812__DOT__dcache__DOT___GEN_284)))) 
                                          & (- (QData)((IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__cpu_request_rw)))))
                                    : ((- (QData)((IData)(
                                                          (0x0cU 
                                                           != (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__cache_state))))) 
                                       & ((- (QData)((IData)(
                                                             (0x0dU 
                                                              != (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__cache_state))))) 
                                          & (((8U == (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__cache_state))
                                               ? ((
                                                   (3U 
                                                    == (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__replace))
                                                    ? vlSelfRef.ysyx_22041812__DOT__dcache__DOT___GEN_460
                                                    : 
                                                   ((2U 
                                                     == (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__replace))
                                                     ? vlSelfRef.ysyx_22041812__DOT__dcache__DOT___GEN_460
                                                     : 
                                                    ((1U 
                                                      == (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__replace))
                                                      ? vlSelfRef.ysyx_22041812__DOT__dcache__DOT___GEN_460
                                                      : 
                                                     ((- (QData)((IData)(
                                                                         (0U 
                                                                          == (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__replace))))) 
                                                      & vlSelfRef.ysyx_22041812__DOT__dcache__DOT___GEN_460)))) 
                                                  & (- (QData)((IData)(vlSelfRef.ysyx_22041812__DOT__dcache_io_mem_io_r_valid))))
                                               : ((- (QData)((IData)(
                                                                     (0x0eU 
                                                                      != (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__cache_state))))) 
                                                  & ((- (QData)((IData)(
                                                                        (7U 
                                                                         == (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__cache_state))))) 
                                                     & (((3U 
                                                          == (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__replace))
                                                          ? 
                                                         (((QData)((IData)(vlSelfRef.ysyx_22041812__DOT__sram7_Q[1U])) 
                                                           << 0x00000020U) 
                                                          | (QData)((IData)(vlSelfRef.ysyx_22041812__DOT__sram7_Q[0U])))
                                                          : 
                                                         ((2U 
                                                           == (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__replace))
                                                           ? 
                                                          (((QData)((IData)(vlSelfRef.ysyx_22041812__DOT__sram6_Q[1U])) 
                                                            << 0x00000020U) 
                                                           | (QData)((IData)(vlSelfRef.ysyx_22041812__DOT__sram6_Q[0U])))
                                                           : 
                                                          ((1U 
                                                            == (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__replace))
                                                            ? 
                                                           (((QData)((IData)(vlSelfRef.ysyx_22041812__DOT__sram5_Q[1U])) 
                                                             << 0x00000020U) 
                                                            | (QData)((IData)(vlSelfRef.ysyx_22041812__DOT__sram5_Q[0U])))
                                                            : 
                                                           ((((QData)((IData)(vlSelfRef.ysyx_22041812__DOT__sram4_Q[1U])) 
                                                              << 0x00000020U) 
                                                             | (QData)((IData)(vlSelfRef.ysyx_22041812__DOT__sram4_Q[0U]))) 
                                                            & (- (QData)((IData)(
                                                                                (0U 
                                                                                == (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__replace))))))))) 
                                                        & (- (QData)((IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT___T_40))))))) 
                                             & (- (QData)((IData)(
                                                                  (9U 
                                                                   != (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__cache_state))))))))) 
                                  & (- (QData)((IData)(
                                                       (5U 
                                                        != (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__cache_state))))))))))) 
                 & (- (QData)((IData)((0x10U != (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__cache_state))))))));
    vlSelfRef.ysyx_22041812__DOT__dcache__DOT__cache_data_1 
        = ((- (QData)((IData)((0U != (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__cache_state))))) 
           & ((- (QData)((IData)((0x0fU != (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__cache_state))))) 
              & (((0x11U == (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__cache_state))
                   ? (((3U == (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__index_in_line))
                        ? (((QData)((IData)(vlSelfRef.ysyx_22041812__DOT__sram7_Q[3U])) 
                            << 0x00000020U) | (QData)((IData)(vlSelfRef.ysyx_22041812__DOT__sram7_Q[2U])))
                        : ((2U == (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__index_in_line))
                            ? (((QData)((IData)(vlSelfRef.ysyx_22041812__DOT__sram6_Q[3U])) 
                                << 0x00000020U) | (QData)((IData)(vlSelfRef.ysyx_22041812__DOT__sram6_Q[2U])))
                            : ((1U == (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__index_in_line))
                                ? (((QData)((IData)(vlSelfRef.ysyx_22041812__DOT__sram5_Q[3U])) 
                                    << 0x00000020U) 
                                   | (QData)((IData)(vlSelfRef.ysyx_22041812__DOT__sram5_Q[2U])))
                                : ((((QData)((IData)(vlSelfRef.ysyx_22041812__DOT__sram4_Q[3U])) 
                                     << 0x00000020U) 
                                    | (QData)((IData)(vlSelfRef.ysyx_22041812__DOT__sram4_Q[2U]))) 
                                   & (- (QData)((IData)(
                                                        (0U 
                                                         == (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__index_in_line))))))))) 
                      & (- (QData)((IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT___T_40))))
                   : ((- (QData)((IData)((0x13U != (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__cache_state))))) 
                      & ((- (QData)((IData)((1U != (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__cache_state))))) 
                         & ((- (QData)((IData)((3U 
                                                != (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__cache_state))))) 
                            & ((- (QData)((IData)((4U 
                                                   != (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__cache_state))))) 
                               & (((6U == (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__cache_state))
                                    ? ((- (QData)((IData)(vlSelfRef.__VdfgRegularize_hebeb780c_0_0))) 
                                       & (((IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__is_match_3)
                                            ? vlSelfRef.ysyx_22041812__DOT__dcache__DOT___GEN_285
                                            : ((IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__is_match_2)
                                                ? vlSelfRef.ysyx_22041812__DOT__dcache__DOT___GEN_285
                                                : ((IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__is_match_1)
                                                    ? vlSelfRef.ysyx_22041812__DOT__dcache__DOT___GEN_285
                                                    : 
                                                   ((- (QData)((IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__is_match_0))) 
                                                    & vlSelfRef.ysyx_22041812__DOT__dcache__DOT___GEN_285)))) 
                                          & (- (QData)((IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__cpu_request_rw)))))
                                    : ((- (QData)((IData)(
                                                          (0x0cU 
                                                           != (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__cache_state))))) 
                                       & ((- (QData)((IData)(
                                                             (0x0dU 
                                                              != (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__cache_state))))) 
                                          & (((8U == (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__cache_state))
                                               ? ((
                                                   (3U 
                                                    == (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__replace))
                                                    ? vlSelfRef.ysyx_22041812__DOT__dcache__DOT___GEN_461
                                                    : 
                                                   ((2U 
                                                     == (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__replace))
                                                     ? vlSelfRef.ysyx_22041812__DOT__dcache__DOT___GEN_461
                                                     : 
                                                    ((1U 
                                                      == (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__replace))
                                                      ? vlSelfRef.ysyx_22041812__DOT__dcache__DOT___GEN_461
                                                      : 
                                                     ((- (QData)((IData)(
                                                                         (0U 
                                                                          == (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__replace))))) 
                                                      & vlSelfRef.ysyx_22041812__DOT__dcache__DOT___GEN_461)))) 
                                                  & (- (QData)((IData)(vlSelfRef.ysyx_22041812__DOT__dcache_io_mem_io_r_valid))))
                                               : ((- (QData)((IData)(
                                                                     (0x0eU 
                                                                      != (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__cache_state))))) 
                                                  & ((- (QData)((IData)(
                                                                        (7U 
                                                                         == (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__cache_state))))) 
                                                     & (((3U 
                                                          == (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__replace))
                                                          ? 
                                                         (((QData)((IData)(vlSelfRef.ysyx_22041812__DOT__sram7_Q[3U])) 
                                                           << 0x00000020U) 
                                                          | (QData)((IData)(vlSelfRef.ysyx_22041812__DOT__sram7_Q[2U])))
                                                          : 
                                                         ((2U 
                                                           == (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__replace))
                                                           ? 
                                                          (((QData)((IData)(vlSelfRef.ysyx_22041812__DOT__sram6_Q[3U])) 
                                                            << 0x00000020U) 
                                                           | (QData)((IData)(vlSelfRef.ysyx_22041812__DOT__sram6_Q[2U])))
                                                           : 
                                                          ((1U 
                                                            == (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__replace))
                                                            ? 
                                                           (((QData)((IData)(vlSelfRef.ysyx_22041812__DOT__sram5_Q[3U])) 
                                                             << 0x00000020U) 
                                                            | (QData)((IData)(vlSelfRef.ysyx_22041812__DOT__sram5_Q[2U])))
                                                            : 
                                                           ((((QData)((IData)(vlSelfRef.ysyx_22041812__DOT__sram4_Q[3U])) 
                                                              << 0x00000020U) 
                                                             | (QData)((IData)(vlSelfRef.ysyx_22041812__DOT__sram4_Q[2U]))) 
                                                            & (- (QData)((IData)(
                                                                                (0U 
                                                                                == (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__replace))))))))) 
                                                        & (- (QData)((IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT___T_40))))))) 
                                             & (- (QData)((IData)(
                                                                  (9U 
                                                                   != (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__cache_state))))))))) 
                                  & (- (QData)((IData)(
                                                       (5U 
                                                        != (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__cache_state))))))))))) 
                 & (- (QData)((IData)((0x10U != (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__cache_state))))))));
    __Vtemp_1[0U] = (IData)(((- (QData)((IData)((0U 
                                                 != (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__cache_state))))) 
                             & ((- (QData)((IData)(
                                                   (0x0fU 
                                                    != (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__cache_state))))) 
                                & ((- (QData)((IData)(
                                                      (0x10U 
                                                       != (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__cache_state))))) 
                                   & ((- (QData)((IData)(
                                                         (0x11U 
                                                          != (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__cache_state))))) 
                                      & ((- (QData)((IData)(
                                                            (0x13U 
                                                             != (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__cache_state))))) 
                                         & ((- (QData)((IData)(
                                                               (1U 
                                                                != (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__cache_state))))) 
                                            & ((- (QData)((IData)(
                                                                  (3U 
                                                                   != (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__cache_state))))) 
                                               & ((- (QData)((IData)(
                                                                     (4U 
                                                                      != (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__cache_state))))) 
                                                  & (((6U 
                                                       == (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__cache_state))
                                                       ? 
                                                      ((- (QData)((IData)(vlSelfRef.__VdfgRegularize_hebeb780c_0_0))) 
                                                       & (((IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__is_match_3)
                                                            ? vlSelfRef.ysyx_22041812__DOT__dcache__DOT___GEN_253
                                                            : 
                                                           ((IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__is_match_2)
                                                             ? vlSelfRef.ysyx_22041812__DOT__dcache__DOT___GEN_253
                                                             : 
                                                            ((IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__is_match_1)
                                                              ? vlSelfRef.ysyx_22041812__DOT__dcache__DOT___GEN_253
                                                              : 
                                                             ((- (QData)((IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__is_match_0))) 
                                                              & vlSelfRef.ysyx_22041812__DOT__dcache__DOT___GEN_253)))) 
                                                          & (- (QData)((IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__cpu_request_rw)))))
                                                       : 
                                                      ((- (QData)((IData)(
                                                                          (0x0cU 
                                                                           != (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__cache_state))))) 
                                                       & ((- (QData)((IData)(
                                                                             (0x0dU 
                                                                              != (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__cache_state))))) 
                                                          & ((- (QData)((IData)(
                                                                                (9U 
                                                                                != (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__cache_state))))) 
                                                             & ((- (QData)((IData)(
                                                                                (8U 
                                                                                == (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__cache_state))))) 
                                                                & (((3U 
                                                                     == (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__replace))
                                                                     ? vlSelfRef.ysyx_22041812__DOT__dcache__DOT___GEN_462
                                                                     : 
                                                                    ((2U 
                                                                      == (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__replace))
                                                                      ? vlSelfRef.ysyx_22041812__DOT__dcache__DOT___GEN_462
                                                                      : 
                                                                     ((1U 
                                                                       == (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__replace))
                                                                       ? vlSelfRef.ysyx_22041812__DOT__dcache__DOT___GEN_462
                                                                       : 
                                                                      ((- (QData)((IData)(
                                                                                (0U 
                                                                                == (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__replace))))) 
                                                                       & vlSelfRef.ysyx_22041812__DOT__dcache__DOT___GEN_462)))) 
                                                                   & (- (QData)((IData)(vlSelfRef.ysyx_22041812__DOT__dcache_io_mem_io_r_valid))))))))) 
                                                     & (- (QData)((IData)(
                                                                          (5U 
                                                                           != (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__cache_state)))))))))))))));
    __Vtemp_1[1U] = (IData)((((- (QData)((IData)((0U 
                                                  != (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__cache_state))))) 
                              & ((- (QData)((IData)(
                                                    (0x0fU 
                                                     != (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__cache_state))))) 
                                 & ((- (QData)((IData)(
                                                       (0x10U 
                                                        != (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__cache_state))))) 
                                    & ((- (QData)((IData)(
                                                          (0x11U 
                                                           != (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__cache_state))))) 
                                       & ((- (QData)((IData)(
                                                             (0x13U 
                                                              != (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__cache_state))))) 
                                          & ((- (QData)((IData)(
                                                                (1U 
                                                                 != (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__cache_state))))) 
                                             & ((- (QData)((IData)(
                                                                   (3U 
                                                                    != (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__cache_state))))) 
                                                & ((- (QData)((IData)(
                                                                      (4U 
                                                                       != (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__cache_state))))) 
                                                   & (((6U 
                                                        == (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__cache_state))
                                                        ? 
                                                       ((- (QData)((IData)(vlSelfRef.__VdfgRegularize_hebeb780c_0_0))) 
                                                        & (((IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__is_match_3)
                                                             ? vlSelfRef.ysyx_22041812__DOT__dcache__DOT___GEN_253
                                                             : 
                                                            ((IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__is_match_2)
                                                              ? vlSelfRef.ysyx_22041812__DOT__dcache__DOT___GEN_253
                                                              : 
                                                             ((IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__is_match_1)
                                                               ? vlSelfRef.ysyx_22041812__DOT__dcache__DOT___GEN_253
                                                               : 
                                                              ((- (QData)((IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__is_match_0))) 
                                                               & vlSelfRef.ysyx_22041812__DOT__dcache__DOT___GEN_253)))) 
                                                           & (- (QData)((IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__cpu_request_rw)))))
                                                        : 
                                                       ((- (QData)((IData)(
                                                                           (0x0cU 
                                                                            != (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__cache_state))))) 
                                                        & ((- (QData)((IData)(
                                                                              (0x0dU 
                                                                               != (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__cache_state))))) 
                                                           & ((- (QData)((IData)(
                                                                                (9U 
                                                                                != (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__cache_state))))) 
                                                              & ((- (QData)((IData)(
                                                                                (8U 
                                                                                == (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__cache_state))))) 
                                                                 & (((3U 
                                                                      == (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__replace))
                                                                      ? vlSelfRef.ysyx_22041812__DOT__dcache__DOT___GEN_462
                                                                      : 
                                                                     ((2U 
                                                                       == (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__replace))
                                                                       ? vlSelfRef.ysyx_22041812__DOT__dcache__DOT___GEN_462
                                                                       : 
                                                                      ((1U 
                                                                        == (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__replace))
                                                                        ? vlSelfRef.ysyx_22041812__DOT__dcache__DOT___GEN_462
                                                                        : 
                                                                       ((- (QData)((IData)(
                                                                                (0U 
                                                                                == (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__replace))))) 
                                                                        & vlSelfRef.ysyx_22041812__DOT__dcache__DOT___GEN_462)))) 
                                                                    & (- (QData)((IData)(vlSelfRef.ysyx_22041812__DOT__dcache_io_mem_io_r_valid))))))))) 
                                                      & (- (QData)((IData)(
                                                                           (5U 
                                                                            != (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__cache_state)))))))))))))) 
                             >> 0x00000020U));
    __Vtemp_1[2U] = (IData)(((- (QData)((IData)((0U 
                                                 != (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__cache_state))))) 
                             & ((- (QData)((IData)(
                                                   (0x0fU 
                                                    != (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__cache_state))))) 
                                & ((- (QData)((IData)(
                                                      (0x10U 
                                                       != (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__cache_state))))) 
                                   & ((- (QData)((IData)(
                                                         (0x11U 
                                                          != (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__cache_state))))) 
                                      & ((- (QData)((IData)(
                                                            (0x13U 
                                                             != (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__cache_state))))) 
                                         & ((- (QData)((IData)(
                                                               (1U 
                                                                != (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__cache_state))))) 
                                            & ((- (QData)((IData)(
                                                                  (3U 
                                                                   != (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__cache_state))))) 
                                               & ((- (QData)((IData)(
                                                                     (4U 
                                                                      != (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__cache_state))))) 
                                                  & (((6U 
                                                       == (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__cache_state))
                                                       ? 
                                                      ((- (QData)((IData)(vlSelfRef.__VdfgRegularize_hebeb780c_0_0))) 
                                                       & (((IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__is_match_3)
                                                            ? vlSelfRef.ysyx_22041812__DOT__dcache__DOT___GEN_254
                                                            : 
                                                           ((IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__is_match_2)
                                                             ? vlSelfRef.ysyx_22041812__DOT__dcache__DOT___GEN_254
                                                             : 
                                                            ((IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__is_match_1)
                                                              ? vlSelfRef.ysyx_22041812__DOT__dcache__DOT___GEN_254
                                                              : 
                                                             ((- (QData)((IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__is_match_0))) 
                                                              & vlSelfRef.ysyx_22041812__DOT__dcache__DOT___GEN_254)))) 
                                                          & (- (QData)((IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__cpu_request_rw)))))
                                                       : 
                                                      ((- (QData)((IData)(
                                                                          (0x0cU 
                                                                           != (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__cache_state))))) 
                                                       & ((- (QData)((IData)(
                                                                             (0x0dU 
                                                                              != (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__cache_state))))) 
                                                          & ((- (QData)((IData)(
                                                                                (9U 
                                                                                != (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__cache_state))))) 
                                                             & ((- (QData)((IData)(
                                                                                (8U 
                                                                                == (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__cache_state))))) 
                                                                & (((3U 
                                                                     == (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__replace))
                                                                     ? vlSelfRef.ysyx_22041812__DOT__dcache__DOT___GEN_463
                                                                     : 
                                                                    ((2U 
                                                                      == (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__replace))
                                                                      ? vlSelfRef.ysyx_22041812__DOT__dcache__DOT___GEN_463
                                                                      : 
                                                                     ((1U 
                                                                       == (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__replace))
                                                                       ? vlSelfRef.ysyx_22041812__DOT__dcache__DOT___GEN_463
                                                                       : 
                                                                      ((- (QData)((IData)(
                                                                                (0U 
                                                                                == (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__replace))))) 
                                                                       & vlSelfRef.ysyx_22041812__DOT__dcache__DOT___GEN_463)))) 
                                                                   & (- (QData)((IData)(vlSelfRef.ysyx_22041812__DOT__dcache_io_mem_io_r_valid))))))))) 
                                                     & (- (QData)((IData)(
                                                                          (5U 
                                                                           != (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__cache_state)))))))))))))));
    __Vtemp_1[3U] = (IData)((((- (QData)((IData)((0U 
                                                  != (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__cache_state))))) 
                              & ((- (QData)((IData)(
                                                    (0x0fU 
                                                     != (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__cache_state))))) 
                                 & ((- (QData)((IData)(
                                                       (0x10U 
                                                        != (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__cache_state))))) 
                                    & ((- (QData)((IData)(
                                                          (0x11U 
                                                           != (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__cache_state))))) 
                                       & ((- (QData)((IData)(
                                                             (0x13U 
                                                              != (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__cache_state))))) 
                                          & ((- (QData)((IData)(
                                                                (1U 
                                                                 != (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__cache_state))))) 
                                             & ((- (QData)((IData)(
                                                                   (3U 
                                                                    != (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__cache_state))))) 
                                                & ((- (QData)((IData)(
                                                                      (4U 
                                                                       != (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__cache_state))))) 
                                                   & (((6U 
                                                        == (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__cache_state))
                                                        ? 
                                                       ((- (QData)((IData)(vlSelfRef.__VdfgRegularize_hebeb780c_0_0))) 
                                                        & (((IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__is_match_3)
                                                             ? vlSelfRef.ysyx_22041812__DOT__dcache__DOT___GEN_254
                                                             : 
                                                            ((IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__is_match_2)
                                                              ? vlSelfRef.ysyx_22041812__DOT__dcache__DOT___GEN_254
                                                              : 
                                                             ((IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__is_match_1)
                                                               ? vlSelfRef.ysyx_22041812__DOT__dcache__DOT___GEN_254
                                                               : 
                                                              ((- (QData)((IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__is_match_0))) 
                                                               & vlSelfRef.ysyx_22041812__DOT__dcache__DOT___GEN_254)))) 
                                                           & (- (QData)((IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__cpu_request_rw)))))
                                                        : 
                                                       ((- (QData)((IData)(
                                                                           (0x0cU 
                                                                            != (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__cache_state))))) 
                                                        & ((- (QData)((IData)(
                                                                              (0x0dU 
                                                                               != (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__cache_state))))) 
                                                           & ((- (QData)((IData)(
                                                                                (9U 
                                                                                != (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__cache_state))))) 
                                                              & ((- (QData)((IData)(
                                                                                (8U 
                                                                                == (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__cache_state))))) 
                                                                 & (((3U 
                                                                      == (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__replace))
                                                                      ? vlSelfRef.ysyx_22041812__DOT__dcache__DOT___GEN_463
                                                                      : 
                                                                     ((2U 
                                                                       == (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__replace))
                                                                       ? vlSelfRef.ysyx_22041812__DOT__dcache__DOT___GEN_463
                                                                       : 
                                                                      ((1U 
                                                                        == (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__replace))
                                                                        ? vlSelfRef.ysyx_22041812__DOT__dcache__DOT___GEN_463
                                                                        : 
                                                                       ((- (QData)((IData)(
                                                                                (0U 
                                                                                == (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__replace))))) 
                                                                        & vlSelfRef.ysyx_22041812__DOT__dcache__DOT___GEN_463)))) 
                                                                    & (- (QData)((IData)(vlSelfRef.ysyx_22041812__DOT__dcache_io_mem_io_r_valid))))))))) 
                                                      & (- (QData)((IData)(
                                                                           (5U 
                                                                            != (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__cache_state)))))))))))))) 
                             >> 0x00000020U));
    vlSelfRef.ysyx_22041812__DOT__dcache__DOT___data_mem_0_io_cache_req_wmask_T_1[0U] 
        = (~ __Vtemp_1[0U]);
    vlSelfRef.ysyx_22041812__DOT__dcache__DOT___data_mem_0_io_cache_req_wmask_T_1[1U] 
        = (~ __Vtemp_1[1U]);
    vlSelfRef.ysyx_22041812__DOT__dcache__DOT___data_mem_0_io_cache_req_wmask_T_1[2U] 
        = (~ __Vtemp_1[2U]);
    vlSelfRef.ysyx_22041812__DOT__dcache__DOT___data_mem_0_io_cache_req_wmask_T_1[3U] 
        = (~ __Vtemp_1[3U]);
    if ((1U == (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__index_in_line))) {
        if (vlSelfRef.ysyx_22041812__DOT__dcache__DOT__is_match_1) {
            vlSelfRef.ysyx_22041812__DOT__dcache__DOT___GEN_51 
                = vlSelfRef.ysyx_22041812__DOT__dcache__DOT___GEN_31;
            vlSelfRef.ysyx_22041812__DOT__dcache__DOT___GEN_49 
                = ((vlSymsp->TOP__ysyx_22041812__DOT__dcache__DOT__tag_mem_1.io_tag_read_tag 
                    << 0x0000000aU) | ((IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__flush_loop) 
                                       << 4U));
            vlSelfRef.ysyx_22041812__DOT__dcache__DOT___GEN_52 
                = vlSelfRef.ysyx_22041812__DOT__dcache__DOT___GEN_32;
            vlSelfRef.ysyx_22041812__DOT__dcache__DOT___GEN_50 
                = vlSelfRef.ysyx_22041812__DOT__dcache__DOT___GEN_30;
        } else {
            if ((3U != (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__index_in_line))) {
                vlSelfRef.ysyx_22041812__DOT__dcache__DOT___GEN_51 
                    = vlSelfRef.ysyx_22041812__DOT__dcache__DOT___GEN_31;
                vlSelfRef.ysyx_22041812__DOT__dcache__DOT___GEN_52 
                    = vlSelfRef.ysyx_22041812__DOT__dcache__DOT___GEN_32;
            } else {
                vlSelfRef.ysyx_22041812__DOT__dcache__DOT___GEN_51 
                    = ((0x3fU == (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__flush_loop)) 
                       | (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT___GEN_31));
                vlSelfRef.ysyx_22041812__DOT__dcache__DOT___GEN_52 
                    = ((IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT___GEN_15) 
                       | (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT___GEN_32));
            }
            vlSelfRef.ysyx_22041812__DOT__dcache__DOT___GEN_49 
                = vlSelfRef.ysyx_22041812__DOT__dcache__DOT___GEN_29;
            vlSelfRef.ysyx_22041812__DOT__dcache__DOT___GEN_50 
                = ((3U != (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__index_in_line)) 
                   | (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT___GEN_30));
        }
    } else {
        vlSelfRef.ysyx_22041812__DOT__dcache__DOT___GEN_51 
            = vlSelfRef.ysyx_22041812__DOT__dcache__DOT___GEN_31;
        vlSelfRef.ysyx_22041812__DOT__dcache__DOT___GEN_49 
            = vlSelfRef.ysyx_22041812__DOT__dcache__DOT___GEN_29;
        vlSelfRef.ysyx_22041812__DOT__dcache__DOT___GEN_52 
            = vlSelfRef.ysyx_22041812__DOT__dcache__DOT___GEN_32;
        vlSelfRef.ysyx_22041812__DOT__dcache__DOT___GEN_50 
            = vlSelfRef.ysyx_22041812__DOT__dcache__DOT___GEN_30;
    }
    vlSelfRef.ysyx_22041812__DOT__dcache__DOT___data_mem_0_io_data_write_data_T[0U] 
        = (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__cache_data_0);
    vlSelfRef.ysyx_22041812__DOT__dcache__DOT___data_mem_0_io_data_write_data_T[1U] 
        = (IData)((vlSelfRef.ysyx_22041812__DOT__dcache__DOT__cache_data_0 
                   >> 0x00000020U));
    vlSelfRef.ysyx_22041812__DOT__dcache__DOT___data_mem_0_io_data_write_data_T[2U] 
        = (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__cache_data_1);
    vlSelfRef.ysyx_22041812__DOT__dcache__DOT___data_mem_0_io_data_write_data_T[3U] 
        = (IData)((vlSelfRef.ysyx_22041812__DOT__dcache__DOT__cache_data_1 
                   >> 0x00000020U));
    vlSelfRef.ysyx_22041812__DOT__dcache__DOT___GEN_147 
        = ((IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__index)
            ? vlSelfRef.ysyx_22041812__DOT__dcache__DOT__cache_data_1
            : vlSelfRef.ysyx_22041812__DOT__dcache__DOT__cache_data_0);
    if ((0U == (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__cache_state))) {
        vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_3_io_cache_req_wmask[0U] = 0U;
        vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_3_io_cache_req_wmask[1U] = 0U;
        vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_3_io_cache_req_wmask[2U] = 0U;
        vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_3_io_cache_req_wmask[3U] = 0U;
        vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_2_io_cache_req_wmask[0U] = 0U;
        vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_2_io_cache_req_wmask[1U] = 0U;
        vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_2_io_cache_req_wmask[2U] = 0U;
        vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_2_io_cache_req_wmask[3U] = 0U;
        vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_1_io_cache_req_wmask[0U] = 0U;
        vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_1_io_cache_req_wmask[1U] = 0U;
        vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_1_io_cache_req_wmask[2U] = 0U;
        vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_1_io_cache_req_wmask[3U] = 0U;
        vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_0_io_cache_req_wmask[0U] = 0U;
        vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_0_io_cache_req_wmask[1U] = 0U;
        vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_0_io_cache_req_wmask[2U] = 0U;
        vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_0_io_cache_req_wmask[3U] = 0U;
    } else if ((0x0fU == (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__cache_state))) {
        vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_3_io_cache_req_wmask[0U] = 0U;
        vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_3_io_cache_req_wmask[1U] = 0U;
        vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_3_io_cache_req_wmask[2U] = 0U;
        vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_3_io_cache_req_wmask[3U] = 0U;
        vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_2_io_cache_req_wmask[0U] = 0U;
        vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_2_io_cache_req_wmask[1U] = 0U;
        vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_2_io_cache_req_wmask[2U] = 0U;
        vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_2_io_cache_req_wmask[3U] = 0U;
        vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_1_io_cache_req_wmask[0U] = 0U;
        vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_1_io_cache_req_wmask[1U] = 0U;
        vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_1_io_cache_req_wmask[2U] = 0U;
        vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_1_io_cache_req_wmask[3U] = 0U;
        vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_0_io_cache_req_wmask[0U] = 0U;
        vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_0_io_cache_req_wmask[1U] = 0U;
        vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_0_io_cache_req_wmask[2U] = 0U;
        vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_0_io_cache_req_wmask[3U] = 0U;
    } else if ((0x10U == (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__cache_state))) {
        vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_3_io_cache_req_wmask[0U] = 0U;
        vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_3_io_cache_req_wmask[1U] = 0U;
        vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_3_io_cache_req_wmask[2U] = 0U;
        vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_3_io_cache_req_wmask[3U] = 0U;
        vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_2_io_cache_req_wmask[0U] = 0U;
        vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_2_io_cache_req_wmask[1U] = 0U;
        vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_2_io_cache_req_wmask[2U] = 0U;
        vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_2_io_cache_req_wmask[3U] = 0U;
        vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_1_io_cache_req_wmask[0U] = 0U;
        vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_1_io_cache_req_wmask[1U] = 0U;
        vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_1_io_cache_req_wmask[2U] = 0U;
        vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_1_io_cache_req_wmask[3U] = 0U;
        vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_0_io_cache_req_wmask[0U] = 0U;
        vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_0_io_cache_req_wmask[1U] = 0U;
        vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_0_io_cache_req_wmask[2U] = 0U;
        vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_0_io_cache_req_wmask[3U] = 0U;
    } else if ((0x11U == (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__cache_state))) {
        vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_3_io_cache_req_wmask[0U] = 0U;
        vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_3_io_cache_req_wmask[1U] = 0U;
        vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_3_io_cache_req_wmask[2U] = 0U;
        vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_3_io_cache_req_wmask[3U] = 0U;
        vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_2_io_cache_req_wmask[0U] = 0U;
        vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_2_io_cache_req_wmask[1U] = 0U;
        vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_2_io_cache_req_wmask[2U] = 0U;
        vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_2_io_cache_req_wmask[3U] = 0U;
        vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_1_io_cache_req_wmask[0U] = 0U;
        vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_1_io_cache_req_wmask[1U] = 0U;
        vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_1_io_cache_req_wmask[2U] = 0U;
        vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_1_io_cache_req_wmask[3U] = 0U;
        vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_0_io_cache_req_wmask[0U] = 0U;
        vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_0_io_cache_req_wmask[1U] = 0U;
        vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_0_io_cache_req_wmask[2U] = 0U;
        vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_0_io_cache_req_wmask[3U] = 0U;
    } else if ((0x13U == (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__cache_state))) {
        vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_3_io_cache_req_wmask[0U] = 0U;
        vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_3_io_cache_req_wmask[1U] = 0U;
        vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_3_io_cache_req_wmask[2U] = 0U;
        vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_3_io_cache_req_wmask[3U] = 0U;
        vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_2_io_cache_req_wmask[0U] = 0U;
        vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_2_io_cache_req_wmask[1U] = 0U;
        vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_2_io_cache_req_wmask[2U] = 0U;
        vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_2_io_cache_req_wmask[3U] = 0U;
        vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_1_io_cache_req_wmask[0U] = 0U;
        vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_1_io_cache_req_wmask[1U] = 0U;
        vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_1_io_cache_req_wmask[2U] = 0U;
        vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_1_io_cache_req_wmask[3U] = 0U;
        vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_0_io_cache_req_wmask[0U] = 0U;
        vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_0_io_cache_req_wmask[1U] = 0U;
        vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_0_io_cache_req_wmask[2U] = 0U;
        vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_0_io_cache_req_wmask[3U] = 0U;
    } else if ((1U == (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__cache_state))) {
        vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_3_io_cache_req_wmask[0U] = 0U;
        vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_3_io_cache_req_wmask[1U] = 0U;
        vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_3_io_cache_req_wmask[2U] = 0U;
        vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_3_io_cache_req_wmask[3U] = 0U;
        vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_2_io_cache_req_wmask[0U] = 0U;
        vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_2_io_cache_req_wmask[1U] = 0U;
        vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_2_io_cache_req_wmask[2U] = 0U;
        vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_2_io_cache_req_wmask[3U] = 0U;
        vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_1_io_cache_req_wmask[0U] = 0U;
        vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_1_io_cache_req_wmask[1U] = 0U;
        vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_1_io_cache_req_wmask[2U] = 0U;
        vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_1_io_cache_req_wmask[3U] = 0U;
        vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_0_io_cache_req_wmask[0U] = 0U;
        vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_0_io_cache_req_wmask[1U] = 0U;
        vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_0_io_cache_req_wmask[2U] = 0U;
        vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_0_io_cache_req_wmask[3U] = 0U;
    } else if ((3U == (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__cache_state))) {
        vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_3_io_cache_req_wmask[0U] = 0U;
        vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_3_io_cache_req_wmask[1U] = 0U;
        vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_3_io_cache_req_wmask[2U] = 0U;
        vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_3_io_cache_req_wmask[3U] = 0U;
        vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_2_io_cache_req_wmask[0U] = 0U;
        vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_2_io_cache_req_wmask[1U] = 0U;
        vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_2_io_cache_req_wmask[2U] = 0U;
        vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_2_io_cache_req_wmask[3U] = 0U;
        vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_1_io_cache_req_wmask[0U] = 0U;
        vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_1_io_cache_req_wmask[1U] = 0U;
        vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_1_io_cache_req_wmask[2U] = 0U;
        vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_1_io_cache_req_wmask[3U] = 0U;
        vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_0_io_cache_req_wmask[0U] = 0U;
        vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_0_io_cache_req_wmask[1U] = 0U;
        vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_0_io_cache_req_wmask[2U] = 0U;
        vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_0_io_cache_req_wmask[3U] = 0U;
    } else if ((4U == (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__cache_state))) {
        vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_3_io_cache_req_wmask[0U] = 0U;
        vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_3_io_cache_req_wmask[1U] = 0U;
        vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_3_io_cache_req_wmask[2U] = 0U;
        vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_3_io_cache_req_wmask[3U] = 0U;
        vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_2_io_cache_req_wmask[0U] = 0U;
        vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_2_io_cache_req_wmask[1U] = 0U;
        vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_2_io_cache_req_wmask[2U] = 0U;
        vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_2_io_cache_req_wmask[3U] = 0U;
        vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_1_io_cache_req_wmask[0U] = 0U;
        vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_1_io_cache_req_wmask[1U] = 0U;
        vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_1_io_cache_req_wmask[2U] = 0U;
        vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_1_io_cache_req_wmask[3U] = 0U;
        vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_0_io_cache_req_wmask[0U] = 0U;
        vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_0_io_cache_req_wmask[1U] = 0U;
        vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_0_io_cache_req_wmask[2U] = 0U;
        vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_0_io_cache_req_wmask[3U] = 0U;
    } else if ((5U == (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__cache_state))) {
        vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_3_io_cache_req_wmask[0U] = 0U;
        vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_3_io_cache_req_wmask[1U] = 0U;
        vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_3_io_cache_req_wmask[2U] = 0U;
        vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_3_io_cache_req_wmask[3U] = 0U;
        vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_2_io_cache_req_wmask[0U] = 0U;
        vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_2_io_cache_req_wmask[1U] = 0U;
        vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_2_io_cache_req_wmask[2U] = 0U;
        vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_2_io_cache_req_wmask[3U] = 0U;
        vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_1_io_cache_req_wmask[0U] = 0U;
        vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_1_io_cache_req_wmask[1U] = 0U;
        vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_1_io_cache_req_wmask[2U] = 0U;
        vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_1_io_cache_req_wmask[3U] = 0U;
        vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_0_io_cache_req_wmask[0U] = 0U;
        vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_0_io_cache_req_wmask[1U] = 0U;
        vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_0_io_cache_req_wmask[2U] = 0U;
        vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_0_io_cache_req_wmask[3U] = 0U;
    } else if ((6U == (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__cache_state))) {
        if (vlSelfRef.__VdfgRegularize_hebeb780c_0_0) {
            if (vlSelfRef.ysyx_22041812__DOT__dcache__DOT__cpu_request_rw) {
                if (vlSelfRef.ysyx_22041812__DOT__dcache__DOT__is_match_3) {
                    vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_3_io_cache_req_wmask[0U] 
                        = vlSelfRef.ysyx_22041812__DOT__dcache__DOT___data_mem_0_io_cache_req_wmask_T_1[0U];
                    vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_3_io_cache_req_wmask[1U] 
                        = vlSelfRef.ysyx_22041812__DOT__dcache__DOT___data_mem_0_io_cache_req_wmask_T_1[1U];
                    vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_3_io_cache_req_wmask[2U] 
                        = vlSelfRef.ysyx_22041812__DOT__dcache__DOT___data_mem_0_io_cache_req_wmask_T_1[2U];
                    vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_3_io_cache_req_wmask[3U] 
                        = vlSelfRef.ysyx_22041812__DOT__dcache__DOT___data_mem_0_io_cache_req_wmask_T_1[3U];
                } else {
                    vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_3_io_cache_req_wmask[0U] = 0U;
                    vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_3_io_cache_req_wmask[1U] = 0U;
                    vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_3_io_cache_req_wmask[2U] = 0U;
                    vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_3_io_cache_req_wmask[3U] = 0U;
                }
                if (vlSelfRef.ysyx_22041812__DOT__dcache__DOT__is_match_2) {
                    vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_2_io_cache_req_wmask[0U] 
                        = vlSelfRef.ysyx_22041812__DOT__dcache__DOT___data_mem_0_io_cache_req_wmask_T_1[0U];
                    vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_2_io_cache_req_wmask[1U] 
                        = vlSelfRef.ysyx_22041812__DOT__dcache__DOT___data_mem_0_io_cache_req_wmask_T_1[1U];
                    vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_2_io_cache_req_wmask[2U] 
                        = vlSelfRef.ysyx_22041812__DOT__dcache__DOT___data_mem_0_io_cache_req_wmask_T_1[2U];
                    vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_2_io_cache_req_wmask[3U] 
                        = vlSelfRef.ysyx_22041812__DOT__dcache__DOT___data_mem_0_io_cache_req_wmask_T_1[3U];
                } else {
                    vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_2_io_cache_req_wmask[0U] = 0U;
                    vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_2_io_cache_req_wmask[1U] = 0U;
                    vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_2_io_cache_req_wmask[2U] = 0U;
                    vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_2_io_cache_req_wmask[3U] = 0U;
                }
                if (vlSelfRef.ysyx_22041812__DOT__dcache__DOT__is_match_1) {
                    vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_1_io_cache_req_wmask[0U] 
                        = vlSelfRef.ysyx_22041812__DOT__dcache__DOT___data_mem_0_io_cache_req_wmask_T_1[0U];
                    vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_1_io_cache_req_wmask[1U] 
                        = vlSelfRef.ysyx_22041812__DOT__dcache__DOT___data_mem_0_io_cache_req_wmask_T_1[1U];
                    vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_1_io_cache_req_wmask[2U] 
                        = vlSelfRef.ysyx_22041812__DOT__dcache__DOT___data_mem_0_io_cache_req_wmask_T_1[2U];
                    vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_1_io_cache_req_wmask[3U] 
                        = vlSelfRef.ysyx_22041812__DOT__dcache__DOT___data_mem_0_io_cache_req_wmask_T_1[3U];
                } else {
                    vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_1_io_cache_req_wmask[0U] = 0U;
                    vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_1_io_cache_req_wmask[1U] = 0U;
                    vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_1_io_cache_req_wmask[2U] = 0U;
                    vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_1_io_cache_req_wmask[3U] = 0U;
                }
                if (vlSelfRef.ysyx_22041812__DOT__dcache__DOT__is_match_0) {
                    vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_0_io_cache_req_wmask[0U] 
                        = vlSelfRef.ysyx_22041812__DOT__dcache__DOT___data_mem_0_io_cache_req_wmask_T_1[0U];
                    vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_0_io_cache_req_wmask[1U] 
                        = vlSelfRef.ysyx_22041812__DOT__dcache__DOT___data_mem_0_io_cache_req_wmask_T_1[1U];
                    vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_0_io_cache_req_wmask[2U] 
                        = vlSelfRef.ysyx_22041812__DOT__dcache__DOT___data_mem_0_io_cache_req_wmask_T_1[2U];
                    vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_0_io_cache_req_wmask[3U] 
                        = vlSelfRef.ysyx_22041812__DOT__dcache__DOT___data_mem_0_io_cache_req_wmask_T_1[3U];
                } else {
                    vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_0_io_cache_req_wmask[0U] = 0U;
                    vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_0_io_cache_req_wmask[1U] = 0U;
                    vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_0_io_cache_req_wmask[2U] = 0U;
                    vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_0_io_cache_req_wmask[3U] = 0U;
                }
            } else {
                vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_3_io_cache_req_wmask[0U] = 0U;
                vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_3_io_cache_req_wmask[1U] = 0U;
                vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_3_io_cache_req_wmask[2U] = 0U;
                vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_3_io_cache_req_wmask[3U] = 0U;
                vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_2_io_cache_req_wmask[0U] = 0U;
                vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_2_io_cache_req_wmask[1U] = 0U;
                vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_2_io_cache_req_wmask[2U] = 0U;
                vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_2_io_cache_req_wmask[3U] = 0U;
                vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_1_io_cache_req_wmask[0U] = 0U;
                vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_1_io_cache_req_wmask[1U] = 0U;
                vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_1_io_cache_req_wmask[2U] = 0U;
                vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_1_io_cache_req_wmask[3U] = 0U;
                vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_0_io_cache_req_wmask[0U] = 0U;
                vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_0_io_cache_req_wmask[1U] = 0U;
                vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_0_io_cache_req_wmask[2U] = 0U;
                vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_0_io_cache_req_wmask[3U] = 0U;
            }
        } else {
            vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_3_io_cache_req_wmask[0U] = 0U;
            vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_3_io_cache_req_wmask[1U] = 0U;
            vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_3_io_cache_req_wmask[2U] = 0U;
            vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_3_io_cache_req_wmask[3U] = 0U;
            vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_2_io_cache_req_wmask[0U] = 0U;
            vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_2_io_cache_req_wmask[1U] = 0U;
            vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_2_io_cache_req_wmask[2U] = 0U;
            vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_2_io_cache_req_wmask[3U] = 0U;
            vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_1_io_cache_req_wmask[0U] = 0U;
            vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_1_io_cache_req_wmask[1U] = 0U;
            vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_1_io_cache_req_wmask[2U] = 0U;
            vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_1_io_cache_req_wmask[3U] = 0U;
            vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_0_io_cache_req_wmask[0U] = 0U;
            vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_0_io_cache_req_wmask[1U] = 0U;
            vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_0_io_cache_req_wmask[2U] = 0U;
            vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_0_io_cache_req_wmask[3U] = 0U;
        }
    } else if ((0x0cU == (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__cache_state))) {
        vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_3_io_cache_req_wmask[0U] = 0U;
        vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_3_io_cache_req_wmask[1U] = 0U;
        vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_3_io_cache_req_wmask[2U] = 0U;
        vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_3_io_cache_req_wmask[3U] = 0U;
        vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_2_io_cache_req_wmask[0U] = 0U;
        vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_2_io_cache_req_wmask[1U] = 0U;
        vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_2_io_cache_req_wmask[2U] = 0U;
        vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_2_io_cache_req_wmask[3U] = 0U;
        vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_1_io_cache_req_wmask[0U] = 0U;
        vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_1_io_cache_req_wmask[1U] = 0U;
        vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_1_io_cache_req_wmask[2U] = 0U;
        vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_1_io_cache_req_wmask[3U] = 0U;
        vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_0_io_cache_req_wmask[0U] = 0U;
        vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_0_io_cache_req_wmask[1U] = 0U;
        vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_0_io_cache_req_wmask[2U] = 0U;
        vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_0_io_cache_req_wmask[3U] = 0U;
    } else if ((0x0dU == (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__cache_state))) {
        vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_3_io_cache_req_wmask[0U] = 0U;
        vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_3_io_cache_req_wmask[1U] = 0U;
        vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_3_io_cache_req_wmask[2U] = 0U;
        vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_3_io_cache_req_wmask[3U] = 0U;
        vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_2_io_cache_req_wmask[0U] = 0U;
        vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_2_io_cache_req_wmask[1U] = 0U;
        vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_2_io_cache_req_wmask[2U] = 0U;
        vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_2_io_cache_req_wmask[3U] = 0U;
        vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_1_io_cache_req_wmask[0U] = 0U;
        vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_1_io_cache_req_wmask[1U] = 0U;
        vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_1_io_cache_req_wmask[2U] = 0U;
        vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_1_io_cache_req_wmask[3U] = 0U;
        vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_0_io_cache_req_wmask[0U] = 0U;
        vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_0_io_cache_req_wmask[1U] = 0U;
        vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_0_io_cache_req_wmask[2U] = 0U;
        vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_0_io_cache_req_wmask[3U] = 0U;
    } else if ((9U == (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__cache_state))) {
        vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_3_io_cache_req_wmask[0U] = 0U;
        vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_3_io_cache_req_wmask[1U] = 0U;
        vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_3_io_cache_req_wmask[2U] = 0U;
        vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_3_io_cache_req_wmask[3U] = 0U;
        vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_2_io_cache_req_wmask[0U] = 0U;
        vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_2_io_cache_req_wmask[1U] = 0U;
        vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_2_io_cache_req_wmask[2U] = 0U;
        vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_2_io_cache_req_wmask[3U] = 0U;
        vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_1_io_cache_req_wmask[0U] = 0U;
        vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_1_io_cache_req_wmask[1U] = 0U;
        vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_1_io_cache_req_wmask[2U] = 0U;
        vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_1_io_cache_req_wmask[3U] = 0U;
        vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_0_io_cache_req_wmask[0U] = 0U;
        vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_0_io_cache_req_wmask[1U] = 0U;
        vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_0_io_cache_req_wmask[2U] = 0U;
        vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_0_io_cache_req_wmask[3U] = 0U;
    } else if ((8U == (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__cache_state))) {
        if (vlSelfRef.ysyx_22041812__DOT__dcache_io_mem_io_r_valid) {
            if ((3U == (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__replace))) {
                vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_3_io_cache_req_wmask[0U] 
                    = vlSelfRef.ysyx_22041812__DOT__dcache__DOT___data_mem_0_io_cache_req_wmask_T_1[0U];
                vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_3_io_cache_req_wmask[1U] 
                    = vlSelfRef.ysyx_22041812__DOT__dcache__DOT___data_mem_0_io_cache_req_wmask_T_1[1U];
                vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_3_io_cache_req_wmask[2U] 
                    = vlSelfRef.ysyx_22041812__DOT__dcache__DOT___data_mem_0_io_cache_req_wmask_T_1[2U];
                vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_3_io_cache_req_wmask[3U] 
                    = vlSelfRef.ysyx_22041812__DOT__dcache__DOT___data_mem_0_io_cache_req_wmask_T_1[3U];
            } else {
                vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_3_io_cache_req_wmask[0U] = 0U;
                vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_3_io_cache_req_wmask[1U] = 0U;
                vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_3_io_cache_req_wmask[2U] = 0U;
                vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_3_io_cache_req_wmask[3U] = 0U;
            }
            if ((2U == (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__replace))) {
                vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_2_io_cache_req_wmask[0U] 
                    = vlSelfRef.ysyx_22041812__DOT__dcache__DOT___data_mem_0_io_cache_req_wmask_T_1[0U];
                vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_2_io_cache_req_wmask[1U] 
                    = vlSelfRef.ysyx_22041812__DOT__dcache__DOT___data_mem_0_io_cache_req_wmask_T_1[1U];
                vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_2_io_cache_req_wmask[2U] 
                    = vlSelfRef.ysyx_22041812__DOT__dcache__DOT___data_mem_0_io_cache_req_wmask_T_1[2U];
                vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_2_io_cache_req_wmask[3U] 
                    = vlSelfRef.ysyx_22041812__DOT__dcache__DOT___data_mem_0_io_cache_req_wmask_T_1[3U];
            } else {
                vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_2_io_cache_req_wmask[0U] = 0U;
                vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_2_io_cache_req_wmask[1U] = 0U;
                vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_2_io_cache_req_wmask[2U] = 0U;
                vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_2_io_cache_req_wmask[3U] = 0U;
            }
            if ((1U == (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__replace))) {
                vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_1_io_cache_req_wmask[0U] 
                    = vlSelfRef.ysyx_22041812__DOT__dcache__DOT___data_mem_0_io_cache_req_wmask_T_1[0U];
                vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_1_io_cache_req_wmask[1U] 
                    = vlSelfRef.ysyx_22041812__DOT__dcache__DOT___data_mem_0_io_cache_req_wmask_T_1[1U];
                vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_1_io_cache_req_wmask[2U] 
                    = vlSelfRef.ysyx_22041812__DOT__dcache__DOT___data_mem_0_io_cache_req_wmask_T_1[2U];
                vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_1_io_cache_req_wmask[3U] 
                    = vlSelfRef.ysyx_22041812__DOT__dcache__DOT___data_mem_0_io_cache_req_wmask_T_1[3U];
            } else {
                vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_1_io_cache_req_wmask[0U] = 0U;
                vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_1_io_cache_req_wmask[1U] = 0U;
                vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_1_io_cache_req_wmask[2U] = 0U;
                vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_1_io_cache_req_wmask[3U] = 0U;
            }
            if ((0U == (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__replace))) {
                vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_0_io_cache_req_wmask[0U] 
                    = vlSelfRef.ysyx_22041812__DOT__dcache__DOT___data_mem_0_io_cache_req_wmask_T_1[0U];
                vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_0_io_cache_req_wmask[1U] 
                    = vlSelfRef.ysyx_22041812__DOT__dcache__DOT___data_mem_0_io_cache_req_wmask_T_1[1U];
                vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_0_io_cache_req_wmask[2U] 
                    = vlSelfRef.ysyx_22041812__DOT__dcache__DOT___data_mem_0_io_cache_req_wmask_T_1[2U];
                vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_0_io_cache_req_wmask[3U] 
                    = vlSelfRef.ysyx_22041812__DOT__dcache__DOT___data_mem_0_io_cache_req_wmask_T_1[3U];
            } else {
                vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_0_io_cache_req_wmask[0U] = 0U;
                vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_0_io_cache_req_wmask[1U] = 0U;
                vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_0_io_cache_req_wmask[2U] = 0U;
                vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_0_io_cache_req_wmask[3U] = 0U;
            }
        } else {
            vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_3_io_cache_req_wmask[0U] = 0U;
            vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_3_io_cache_req_wmask[1U] = 0U;
            vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_3_io_cache_req_wmask[2U] = 0U;
            vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_3_io_cache_req_wmask[3U] = 0U;
            vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_2_io_cache_req_wmask[0U] = 0U;
            vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_2_io_cache_req_wmask[1U] = 0U;
            vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_2_io_cache_req_wmask[2U] = 0U;
            vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_2_io_cache_req_wmask[3U] = 0U;
            vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_1_io_cache_req_wmask[0U] = 0U;
            vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_1_io_cache_req_wmask[1U] = 0U;
            vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_1_io_cache_req_wmask[2U] = 0U;
            vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_1_io_cache_req_wmask[3U] = 0U;
            vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_0_io_cache_req_wmask[0U] = 0U;
            vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_0_io_cache_req_wmask[1U] = 0U;
            vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_0_io_cache_req_wmask[2U] = 0U;
            vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_0_io_cache_req_wmask[3U] = 0U;
        }
    } else {
        vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_3_io_cache_req_wmask[0U] = 0U;
        vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_3_io_cache_req_wmask[1U] = 0U;
        vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_3_io_cache_req_wmask[2U] = 0U;
        vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_3_io_cache_req_wmask[3U] = 0U;
        vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_2_io_cache_req_wmask[0U] = 0U;
        vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_2_io_cache_req_wmask[1U] = 0U;
        vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_2_io_cache_req_wmask[2U] = 0U;
        vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_2_io_cache_req_wmask[3U] = 0U;
        vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_1_io_cache_req_wmask[0U] = 0U;
        vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_1_io_cache_req_wmask[1U] = 0U;
        vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_1_io_cache_req_wmask[2U] = 0U;
        vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_1_io_cache_req_wmask[3U] = 0U;
        vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_0_io_cache_req_wmask[0U] = 0U;
        vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_0_io_cache_req_wmask[1U] = 0U;
        vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_0_io_cache_req_wmask[2U] = 0U;
        vlSelfRef.ysyx_22041812__DOT__dcache__DOT__data_mem_0_io_cache_req_wmask[3U] = 0U;
    }
    if ((2U == (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__index_in_line))) {
        if (vlSelfRef.ysyx_22041812__DOT__dcache__DOT__is_match_2) {
            vlSelfRef.ysyx_22041812__DOT__dcache__DOT___GEN_71 
                = vlSelfRef.ysyx_22041812__DOT__dcache__DOT___GEN_51;
            vlSelfRef.ysyx_22041812__DOT__dcache__DOT___GEN_69 
                = ((vlSymsp->TOP__ysyx_22041812__DOT__dcache__DOT__tag_mem_2.io_tag_read_tag 
                    << 0x0000000aU) | ((IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__flush_loop) 
                                       << 4U));
            vlSelfRef.ysyx_22041812__DOT__dcache__DOT___GEN_72 
                = vlSelfRef.ysyx_22041812__DOT__dcache__DOT___GEN_52;
        } else {
            if ((3U != (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__index_in_line))) {
                vlSelfRef.ysyx_22041812__DOT__dcache__DOT___GEN_71 
                    = vlSelfRef.ysyx_22041812__DOT__dcache__DOT___GEN_51;
                vlSelfRef.ysyx_22041812__DOT__dcache__DOT___GEN_72 
                    = vlSelfRef.ysyx_22041812__DOT__dcache__DOT___GEN_52;
            } else {
                vlSelfRef.ysyx_22041812__DOT__dcache__DOT___GEN_71 
                    = ((0x3fU == (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__flush_loop)) 
                       | (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT___GEN_51));
                vlSelfRef.ysyx_22041812__DOT__dcache__DOT___GEN_72 
                    = ((IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT___GEN_15) 
                       | (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT___GEN_52));
            }
            vlSelfRef.ysyx_22041812__DOT__dcache__DOT___GEN_69 
                = vlSelfRef.ysyx_22041812__DOT__dcache__DOT___GEN_49;
        }
    } else {
        vlSelfRef.ysyx_22041812__DOT__dcache__DOT___GEN_71 
            = vlSelfRef.ysyx_22041812__DOT__dcache__DOT___GEN_51;
        vlSelfRef.ysyx_22041812__DOT__dcache__DOT___GEN_69 
            = vlSelfRef.ysyx_22041812__DOT__dcache__DOT___GEN_49;
        vlSelfRef.ysyx_22041812__DOT__dcache__DOT___GEN_72 
            = vlSelfRef.ysyx_22041812__DOT__dcache__DOT___GEN_52;
    }
    vlSelfRef.ysyx_22041812__DOT__dcache__DOT___GEN_2 
        = (0x0000003fU & ((IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__flush_loop) 
                          + ((0U != (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__cache_state)) 
                             & ((0x0fU != (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__cache_state)) 
                                & ((0x10U == (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__cache_state))
                                    ? ((3U == (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__index_in_line))
                                        ? ((IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__is_match_3)
                                            ? (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT___GEN_72)
                                            : ((3U 
                                                != (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__index_in_line))
                                                ? (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT___GEN_72)
                                                : ((IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT___GEN_15) 
                                                   | (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT___GEN_72))))
                                        : (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT___GEN_72))
                                    : ((0x11U != (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__cache_state)) 
                                       & ((0x13U == (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__cache_state)) 
                                          & ((IData)(vlSelfRef.ysyx_22041812__DOT__dcache_io_mem_io_b_valid) 
                                             & (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT___GEN_20)))))))));
    vlSelfRef.ysyx_22041812__DOT__dcache__DOT___GEN_70 
        = ((2U == (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__index_in_line))
            ? ((IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__is_match_2)
                ? (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT___GEN_50)
                : ((3U != (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__index_in_line)) 
                   | (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT___GEN_50)))
            : (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT___GEN_50));
    vlSelfRef.ysyx_22041812__DOT__dcache__DOT___GEN_4 
        = (3U & ((IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__index_in_line) 
                 + ((0U != (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__cache_state)) 
                    & ((0x0fU != (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__cache_state)) 
                       & ((0x10U == (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__cache_state))
                           ? ((3U == (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__index_in_line))
                               ? ((IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__is_match_3)
                                   ? (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT___GEN_70)
                                   : ((3U != (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__index_in_line)) 
                                      | (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT___GEN_70)))
                               : (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT___GEN_70))
                           : ((0x11U != (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__cache_state)) 
                              & ((0x13U == (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__cache_state)) 
                                 & ((3U != (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__index_in_line)) 
                                    & (IData)(vlSelfRef.ysyx_22041812__DOT__dcache_io_mem_io_b_valid)))))))));
    vlSelfRef.ysyx_22041812__DOT__dcache__DOT___GEN_33 
        = ((0U == (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__index_in_line))
            ? ((IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__is_match_0)
                ? (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT___GEN_4)
                : ((3U != (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__index_in_line))
                    ? (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT___GEN_4)
                    : ((- (IData)((0x3fU == (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__flush_loop)))) 
                       & (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT___GEN_4))))
            : (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT___GEN_4));
    vlSelfRef.ysyx_22041812__DOT__dcache__DOT___GEN_53 
        = ((1U == (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__index_in_line))
            ? ((IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__is_match_1)
                ? (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT___GEN_33)
                : ((3U != (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__index_in_line))
                    ? (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT___GEN_33)
                    : ((IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT___GEN_33) 
                       & (- (IData)((0x3fU == (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__flush_loop)))))))
            : (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT___GEN_33));
    vlSelfRef.ysyx_22041812__DOT__dcache__DOT___GEN_73 
        = ((2U == (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__index_in_line))
            ? ((IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__is_match_2)
                ? (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT___GEN_53)
                : ((3U != (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__index_in_line))
                    ? (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT___GEN_53)
                    : ((IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT___GEN_53) 
                       & (- (IData)((0x3fU == (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__flush_loop)))))))
            : (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT___GEN_53));
    vlSelfRef.io_master_wdata = ((- (QData)((IData)(
                                                    (0U 
                                                     != (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__cache_state))))) 
                                 & ((- (QData)((IData)(
                                                       (0x0fU 
                                                        != (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__cache_state))))) 
                                    & (((0x11U == (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__cache_state))
                                         ? (((3U == (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__index_in_line))
                                              ? vlSelfRef.ysyx_22041812__DOT__dcache__DOT___GEN_147
                                              : ((2U 
                                                  == (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__index_in_line))
                                                  ? vlSelfRef.ysyx_22041812__DOT__dcache__DOT___GEN_147
                                                  : 
                                                 ((1U 
                                                   == (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__index_in_line))
                                                   ? vlSelfRef.ysyx_22041812__DOT__dcache__DOT___GEN_147
                                                   : 
                                                  (vlSelfRef.ysyx_22041812__DOT__dcache__DOT___GEN_147 
                                                   & (- (QData)((IData)(
                                                                        (0U 
                                                                         == (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__index_in_line))))))))) 
                                            & (- (QData)((IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT___T_40))))
                                         : ((- (QData)((IData)(
                                                               (0x13U 
                                                                != (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__cache_state))))) 
                                            & ((- (QData)((IData)(
                                                                  (1U 
                                                                   != (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__cache_state))))) 
                                               & (((4U 
                                                    == (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__cache_state))
                                                    ? 
                                                   (vlSelfRef.ysyx_22041812__DOT__dcache__DOT__cpu_request_data 
                                                    & (- (QData)((IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT___T_40))))
                                                    : 
                                                   ((- (QData)((IData)(
                                                                       (5U 
                                                                        != (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__cache_state))))) 
                                                    & ((- (QData)((IData)(
                                                                          (6U 
                                                                           != (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__cache_state))))) 
                                                       & ((- (QData)((IData)(
                                                                             (0x0cU 
                                                                              != (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__cache_state))))) 
                                                          & ((- (QData)((IData)(
                                                                                (0x0dU 
                                                                                != (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__cache_state))))) 
                                                             & ((- (QData)((IData)(
                                                                                (9U 
                                                                                != (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__cache_state))))) 
                                                                & ((- (QData)((IData)(
                                                                                (0x0eU 
                                                                                != (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__cache_state))))) 
                                                                   & ((- (QData)((IData)(
                                                                                (7U 
                                                                                == (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__cache_state))))) 
                                                                      & ((- (QData)((IData)(
                                                                                (8U 
                                                                                != (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__cache_state))))) 
                                                                         & (((3U 
                                                                              == (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__replace))
                                                                              ? vlSelfRef.ysyx_22041812__DOT__dcache__DOT___GEN_147
                                                                              : 
                                                                             ((2U 
                                                                               == (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__replace))
                                                                               ? vlSelfRef.ysyx_22041812__DOT__dcache__DOT___GEN_147
                                                                               : 
                                                                              ((1U 
                                                                                == (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__replace))
                                                                                ? vlSelfRef.ysyx_22041812__DOT__dcache__DOT___GEN_147
                                                                                : 
                                                                               (vlSelfRef.ysyx_22041812__DOT__dcache__DOT___GEN_147 
                                                                                & (- (QData)((IData)(
                                                                                (0U 
                                                                                == (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__replace))))))))) 
                                                                            & (- (QData)((IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT___T_40))))))))))))) 
                                                  & (- (QData)((IData)(
                                                                       (3U 
                                                                        != (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__cache_state))))))))) 
                                       & (- (QData)((IData)(
                                                            (0x10U 
                                                             != (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__cache_state))))))));
}

void Vysyx_22041812___024root___nba_sequent__TOP__3(Vysyx_22041812___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vysyx_22041812___024root___nba_sequent__TOP__3\n"); );
    Vysyx_22041812__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    vlSelfRef.ysyx_22041812__DOT__icache__DOT___tag_mem_1_io_tag_write_visit_T_4 
        = (0x000000ffU & ((0U == (0x000000ffU & (~ (IData)(vlSymsp->TOP__ysyx_22041812__DOT__icache__DOT__tag_mem_1.io_tag_read_visit))))
                           ? (IData)(vlSymsp->TOP__ysyx_22041812__DOT__icache__DOT__tag_mem_1.io_tag_read_visit)
                           : ((IData)(1U) + (IData)(vlSymsp->TOP__ysyx_22041812__DOT__icache__DOT__tag_mem_1.io_tag_read_visit))));
    vlSelfRef.ysyx_22041812__DOT__icache__DOT__is_match_1 
        = ((0U != (IData)(vlSelfRef.ysyx_22041812__DOT__icache__DOT__cache_state)) 
           & ((0x0fU != (IData)(vlSelfRef.ysyx_22041812__DOT__icache__DOT__cache_state)) 
              & ((0x10U != (IData)(vlSelfRef.ysyx_22041812__DOT__icache__DOT__cache_state)) 
                 & ((0x11U != (IData)(vlSelfRef.ysyx_22041812__DOT__icache__DOT__cache_state)) 
                    & ((0x13U != (IData)(vlSelfRef.ysyx_22041812__DOT__icache__DOT__cache_state)) 
                       & ((1U != (IData)(vlSelfRef.ysyx_22041812__DOT__icache__DOT__cache_state)) 
                          & ((3U != (IData)(vlSelfRef.ysyx_22041812__DOT__icache__DOT__cache_state)) 
                             & ((4U != (IData)(vlSelfRef.ysyx_22041812__DOT__icache__DOT__cache_state)) 
                                & ((5U != (IData)(vlSelfRef.ysyx_22041812__DOT__icache__DOT__cache_state)) 
                                   & ((6U == (IData)(vlSelfRef.ysyx_22041812__DOT__icache__DOT__cache_state)) 
                                      & ((IData)(vlSymsp->TOP__ysyx_22041812__DOT__icache__DOT__tag_mem_1.io_tag_read_valid) 
                                         & ((vlSelfRef.ysyx_22041812__DOT__icache__DOT__cpu_request_addr_reg 
                                             >> 0x0000000aU) 
                                            == vlSymsp->TOP__ysyx_22041812__DOT__icache__DOT__tag_mem_1.io_tag_read_tag))))))))))));
    vlSelfRef.ysyx_22041812__DOT__icache__DOT___tag_mem_2_io_tag_write_visit_T_4 
        = (0x000000ffU & ((0U == (0x000000ffU & (~ (IData)(vlSymsp->TOP__ysyx_22041812__DOT__icache__DOT__tag_mem_2.io_tag_read_visit))))
                           ? (IData)(vlSymsp->TOP__ysyx_22041812__DOT__icache__DOT__tag_mem_2.io_tag_read_visit)
                           : ((IData)(1U) + (IData)(vlSymsp->TOP__ysyx_22041812__DOT__icache__DOT__tag_mem_2.io_tag_read_visit))));
    vlSelfRef.ysyx_22041812__DOT__icache__DOT__is_match_2 
        = ((0U != (IData)(vlSelfRef.ysyx_22041812__DOT__icache__DOT__cache_state)) 
           & ((0x0fU != (IData)(vlSelfRef.ysyx_22041812__DOT__icache__DOT__cache_state)) 
              & ((0x10U != (IData)(vlSelfRef.ysyx_22041812__DOT__icache__DOT__cache_state)) 
                 & ((0x11U != (IData)(vlSelfRef.ysyx_22041812__DOT__icache__DOT__cache_state)) 
                    & ((0x13U != (IData)(vlSelfRef.ysyx_22041812__DOT__icache__DOT__cache_state)) 
                       & ((1U != (IData)(vlSelfRef.ysyx_22041812__DOT__icache__DOT__cache_state)) 
                          & ((3U != (IData)(vlSelfRef.ysyx_22041812__DOT__icache__DOT__cache_state)) 
                             & ((4U != (IData)(vlSelfRef.ysyx_22041812__DOT__icache__DOT__cache_state)) 
                                & ((5U != (IData)(vlSelfRef.ysyx_22041812__DOT__icache__DOT__cache_state)) 
                                   & ((6U == (IData)(vlSelfRef.ysyx_22041812__DOT__icache__DOT__cache_state)) 
                                      & ((IData)(vlSymsp->TOP__ysyx_22041812__DOT__icache__DOT__tag_mem_2.io_tag_read_valid) 
                                         & ((vlSelfRef.ysyx_22041812__DOT__icache__DOT__cpu_request_addr_reg 
                                             >> 0x0000000aU) 
                                            == vlSymsp->TOP__ysyx_22041812__DOT__icache__DOT__tag_mem_2.io_tag_read_tag))))))))))));
    vlSelfRef.ysyx_22041812__DOT__icache__DOT___tag_mem_3_io_tag_write_visit_T_4 
        = (0x000000ffU & ((0U == (0x000000ffU & (~ (IData)(vlSymsp->TOP__ysyx_22041812__DOT__icache__DOT__tag_mem_3.io_tag_read_visit))))
                           ? (IData)(vlSymsp->TOP__ysyx_22041812__DOT__icache__DOT__tag_mem_3.io_tag_read_visit)
                           : ((IData)(1U) + (IData)(vlSymsp->TOP__ysyx_22041812__DOT__icache__DOT__tag_mem_3.io_tag_read_visit))));
    vlSelfRef.ysyx_22041812__DOT__icache__DOT__is_match_3 
        = ((0U != (IData)(vlSelfRef.ysyx_22041812__DOT__icache__DOT__cache_state)) 
           & ((0x0fU != (IData)(vlSelfRef.ysyx_22041812__DOT__icache__DOT__cache_state)) 
              & ((0x10U != (IData)(vlSelfRef.ysyx_22041812__DOT__icache__DOT__cache_state)) 
                 & ((0x11U != (IData)(vlSelfRef.ysyx_22041812__DOT__icache__DOT__cache_state)) 
                    & ((0x13U != (IData)(vlSelfRef.ysyx_22041812__DOT__icache__DOT__cache_state)) 
                       & ((1U != (IData)(vlSelfRef.ysyx_22041812__DOT__icache__DOT__cache_state)) 
                          & ((3U != (IData)(vlSelfRef.ysyx_22041812__DOT__icache__DOT__cache_state)) 
                             & ((4U != (IData)(vlSelfRef.ysyx_22041812__DOT__icache__DOT__cache_state)) 
                                & ((5U != (IData)(vlSelfRef.ysyx_22041812__DOT__icache__DOT__cache_state)) 
                                   & ((6U == (IData)(vlSelfRef.ysyx_22041812__DOT__icache__DOT__cache_state)) 
                                      & ((IData)(vlSymsp->TOP__ysyx_22041812__DOT__icache__DOT__tag_mem_3.io_tag_read_valid) 
                                         & ((vlSelfRef.ysyx_22041812__DOT__icache__DOT__cpu_request_addr_reg 
                                             >> 0x0000000aU) 
                                            == vlSymsp->TOP__ysyx_22041812__DOT__icache__DOT__tag_mem_3.io_tag_read_tag))))))))))));
    vlSelfRef.ysyx_22041812__DOT__dcache__DOT__visit_1 
        = ((- (IData)((0U != (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__cache_state)))) 
           & ((- (IData)((0x0fU != (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__cache_state)))) 
              & ((- (IData)((0x10U != (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__cache_state)))) 
                 & ((- (IData)((0x11U != (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__cache_state)))) 
                    & ((- (IData)((0x13U != (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__cache_state)))) 
                       & ((- (IData)((1U != (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__cache_state)))) 
                          & ((- (IData)((3U != (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__cache_state)))) 
                             & ((- (IData)((4U != (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__cache_state)))) 
                                & ((- (IData)((5U != (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__cache_state)))) 
                                   & ((- (IData)((6U 
                                                  == (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__cache_state)))) 
                                      & ((- (IData)(
                                                    (1U 
                                                     & (~ (IData)(vlSelfRef.__VdfgRegularize_hebeb780c_0_0))))) 
                                         & ((IData)(vlSymsp->TOP__ysyx_22041812__DOT__dcache__DOT__tag_mem_1.io_tag_read_visit) 
                                            & (- (IData)((IData)(vlSymsp->TOP__ysyx_22041812__DOT__dcache__DOT__tag_mem_0.__VdfgRegularize_hebeb780c_0_64)))))))))))))));
    vlSelfRef.ysyx_22041812__DOT__dcache__DOT__visit_0 
        = ((- (IData)((0U != (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__cache_state)))) 
           & ((- (IData)((0x0fU != (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__cache_state)))) 
              & ((- (IData)((0x10U != (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__cache_state)))) 
                 & ((- (IData)((0x11U != (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__cache_state)))) 
                    & ((- (IData)((0x13U != (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__cache_state)))) 
                       & ((- (IData)((1U != (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__cache_state)))) 
                          & ((- (IData)((3U != (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__cache_state)))) 
                             & ((- (IData)((4U != (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__cache_state)))) 
                                & ((- (IData)((5U != (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__cache_state)))) 
                                   & ((- (IData)((6U 
                                                  == (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__cache_state)))) 
                                      & ((- (IData)(
                                                    (1U 
                                                     & (~ (IData)(vlSelfRef.__VdfgRegularize_hebeb780c_0_0))))) 
                                         & ((IData)(vlSymsp->TOP__ysyx_22041812__DOT__dcache__DOT__tag_mem_0.io_tag_read_visit) 
                                            & (- (IData)((IData)(vlSymsp->TOP__ysyx_22041812__DOT__dcache__DOT__tag_mem_0.__VdfgRegularize_hebeb780c_0_64)))))))))))))));
    vlSelfRef.ysyx_22041812__DOT__dcache__DOT__visit_3 
        = ((- (IData)((0U != (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__cache_state)))) 
           & ((- (IData)((0x0fU != (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__cache_state)))) 
              & ((- (IData)((0x10U != (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__cache_state)))) 
                 & ((- (IData)((0x11U != (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__cache_state)))) 
                    & ((- (IData)((0x13U != (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__cache_state)))) 
                       & ((- (IData)((1U != (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__cache_state)))) 
                          & ((- (IData)((3U != (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__cache_state)))) 
                             & ((- (IData)((4U != (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__cache_state)))) 
                                & ((- (IData)((5U != (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__cache_state)))) 
                                   & ((- (IData)((6U 
                                                  == (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__cache_state)))) 
                                      & ((- (IData)(
                                                    (1U 
                                                     & (~ (IData)(vlSelfRef.__VdfgRegularize_hebeb780c_0_0))))) 
                                         & ((IData)(vlSymsp->TOP__ysyx_22041812__DOT__dcache__DOT__tag_mem_3.io_tag_read_visit) 
                                            & (- (IData)((IData)(vlSymsp->TOP__ysyx_22041812__DOT__dcache__DOT__tag_mem_0.__VdfgRegularize_hebeb780c_0_64)))))))))))))));
    vlSelfRef.ysyx_22041812__DOT__dcache__DOT__visit_2 
        = ((- (IData)((0U != (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__cache_state)))) 
           & ((- (IData)((0x0fU != (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__cache_state)))) 
              & ((- (IData)((0x10U != (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__cache_state)))) 
                 & ((- (IData)((0x11U != (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__cache_state)))) 
                    & ((- (IData)((0x13U != (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__cache_state)))) 
                       & ((- (IData)((1U != (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__cache_state)))) 
                          & ((- (IData)((3U != (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__cache_state)))) 
                             & ((- (IData)((4U != (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__cache_state)))) 
                                & ((- (IData)((5U != (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__cache_state)))) 
                                   & ((- (IData)((6U 
                                                  == (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__cache_state)))) 
                                      & ((- (IData)(
                                                    (1U 
                                                     & (~ (IData)(vlSelfRef.__VdfgRegularize_hebeb780c_0_0))))) 
                                         & ((IData)(vlSymsp->TOP__ysyx_22041812__DOT__dcache__DOT__tag_mem_2.io_tag_read_visit) 
                                            & (- (IData)((IData)(vlSymsp->TOP__ysyx_22041812__DOT__dcache__DOT__tag_mem_0.__VdfgRegularize_hebeb780c_0_64)))))))))))))));
    vlSelfRef.ysyx_22041812__DOT__icache__DOT___GEN_231 
        = ((IData)(vlSelfRef.ysyx_22041812__DOT__icache__DOT__is_match_1) 
           | (IData)(vlSymsp->TOP__ysyx_22041812__DOT__icache__DOT__tag_mem_1.io_tag_read_valid));
    vlSelfRef.ysyx_22041812__DOT__icache__DOT___GEN_239 
        = ((IData)(vlSelfRef.ysyx_22041812__DOT__icache__DOT__is_match_2) 
           | (IData)(vlSymsp->TOP__ysyx_22041812__DOT__icache__DOT__tag_mem_2.io_tag_read_valid));
    vlSelfRef.ysyx_22041812__DOT__icache__DOT___GEN_247 
        = ((IData)(vlSelfRef.ysyx_22041812__DOT__icache__DOT__is_match_3) 
           | (IData)(vlSymsp->TOP__ysyx_22041812__DOT__icache__DOT__tag_mem_3.io_tag_read_valid));
    vlSelfRef.__VdfgRegularize_hebeb780c_0_1 = ((IData)(vlSelfRef.ysyx_22041812__DOT__icache__DOT__is_match_0) 
                                                | ((IData)(vlSelfRef.ysyx_22041812__DOT__icache__DOT__is_match_1) 
                                                   | ((IData)(vlSelfRef.ysyx_22041812__DOT__icache__DOT__is_match_3) 
                                                      | (IData)(vlSelfRef.ysyx_22041812__DOT__icache__DOT__is_match_2))));
    vlSelfRef.ysyx_22041812__DOT__dcache__DOT__compare_1_0 
        = ((0U != (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__cache_state)) 
           & ((0x0fU != (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__cache_state)) 
              & ((0x10U != (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__cache_state)) 
                 & ((0x11U != (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__cache_state)) 
                    & ((0x13U != (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__cache_state)) 
                       & ((1U != (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__cache_state)) 
                          & ((3U != (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__cache_state)) 
                             & ((4U != (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__cache_state)) 
                                & ((5U != (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__cache_state)) 
                                   & ((6U == (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__cache_state)) 
                                      & ((~ (IData)(vlSelfRef.__VdfgRegularize_hebeb780c_0_0)) 
                                         & (((IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__visit_1) 
                                             > (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__visit_0)) 
                                            & (IData)(vlSymsp->TOP__ysyx_22041812__DOT__dcache__DOT__tag_mem_0.__VdfgRegularize_hebeb780c_0_64)))))))))))));
    vlSelfRef.ysyx_22041812__DOT__dcache__DOT__compare_2_3 
        = ((0U != (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__cache_state)) 
           & ((0x0fU != (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__cache_state)) 
              & ((0x10U != (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__cache_state)) 
                 & ((0x11U != (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__cache_state)) 
                    & ((0x13U != (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__cache_state)) 
                       & ((1U != (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__cache_state)) 
                          & ((3U != (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__cache_state)) 
                             & ((4U != (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__cache_state)) 
                                & ((5U != (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__cache_state)) 
                                   & ((6U == (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__cache_state)) 
                                      & ((~ (IData)(vlSelfRef.__VdfgRegularize_hebeb780c_0_0)) 
                                         & (((IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__visit_3) 
                                             > (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__visit_2)) 
                                            & (IData)(vlSymsp->TOP__ysyx_22041812__DOT__dcache__DOT__tag_mem_0.__VdfgRegularize_hebeb780c_0_64)))))))))))));
    vlSelfRef.ysyx_22041812__DOT__dcache__DOT__max_01_or_23 
        = ((0U != (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__cache_state)) 
           & ((0x0fU != (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__cache_state)) 
              & ((0x10U != (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__cache_state)) 
                 & ((0x11U != (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__cache_state)) 
                    & ((0x13U != (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__cache_state)) 
                       & ((1U != (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__cache_state)) 
                          & ((3U != (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__cache_state)) 
                             & ((4U != (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__cache_state)) 
                                & ((5U != (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__cache_state)) 
                                   & ((6U == (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__cache_state)) 
                                      & ((~ (IData)(vlSelfRef.__VdfgRegularize_hebeb780c_0_0)) 
                                         & ((((IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__compare_2_3)
                                               ? (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__visit_3)
                                               : (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__visit_2)) 
                                             > ((IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__compare_1_0)
                                                 ? (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__visit_1)
                                                 : (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__visit_0))) 
                                            & (IData)(vlSymsp->TOP__ysyx_22041812__DOT__dcache__DOT__tag_mem_0.__VdfgRegularize_hebeb780c_0_64)))))))))))));
    vlSelfRef.ysyx_22041812__DOT__dcache__DOT__max 
        = (3U & ((- (IData)((1U != (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__cache_state)))) 
                 & ((- (IData)((4U != (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__cache_state)))) 
                    & ((- (IData)((0U != (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__cache_state)))) 
                       & ((- (IData)((0x0fU != (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__cache_state)))) 
                          & ((- (IData)((0x10U != (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__cache_state)))) 
                             & ((- (IData)((0x11U != (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__cache_state)))) 
                                & ((- (IData)((0x13U 
                                               != (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__cache_state)))) 
                                   & ((- (IData)((3U 
                                                  != (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__cache_state)))) 
                                      & ((- (IData)(
                                                    (5U 
                                                     != (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__cache_state)))) 
                                         & ((- (IData)(
                                                       (6U 
                                                        == (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__cache_state)))) 
                                            & (((IData)(vlSymsp->TOP__ysyx_22041812__DOT__dcache__DOT__tag_mem_0.__VdfgRegularize_hebeb780c_0_64)
                                                 ? 
                                                (((IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__max_01_or_23) 
                                                  << 1U) 
                                                 | ((IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__max_01_or_23)
                                                     ? (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__compare_2_3)
                                                     : (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__compare_1_0)))
                                                 : 
                                                ((IData)(vlSymsp->TOP__ysyx_22041812__DOT__dcache__DOT__tag_mem_1.io_tag_read_valid)
                                                  ? 
                                                 ((IData)(vlSymsp->TOP__ysyx_22041812__DOT__dcache__DOT__tag_mem_2.io_tag_read_valid)
                                                   ? 
                                                  (- (IData)(
                                                             (1U 
                                                              & (~ (IData)(vlSymsp->TOP__ysyx_22041812__DOT__dcache__DOT__tag_mem_3.io_tag_read_valid)))))
                                                   : 2U)
                                                  : 1U)) 
                                               & (- (IData)(
                                                            (1U 
                                                             & (~ (IData)(vlSelfRef.__VdfgRegularize_hebeb780c_0_0)))))))))))))))));
    vlSelfRef.ysyx_22041812__DOT__dcache__DOT___GEN_329 
        = ((0U == (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__max))
            ? ((IData)(vlSymsp->TOP__ysyx_22041812__DOT__dcache__DOT__tag_mem_0.__VdfgRegularize_hebeb780c_0_433)
                ? ((vlSymsp->TOP__ysyx_22041812__DOT__dcache__DOT__tag_mem_0.io_tag_read_tag 
                    << 0x0000000aU) | (0x000003f0U 
                                       & vlSelfRef.ysyx_22041812__DOT__dcache__DOT__cpu_request_addr_reg))
                : vlSelfRef.ysyx_22041812__DOT__dcache__DOT__writeback_addr)
            : vlSelfRef.ysyx_22041812__DOT__dcache__DOT__writeback_addr);
    vlSelfRef.ysyx_22041812__DOT__dcache__DOT___GEN_338 
        = ((1U == (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__max))
            ? ((IData)(vlSymsp->TOP__ysyx_22041812__DOT__dcache__DOT__tag_mem_1.__VdfgRegularize_hebeb780c_0_432)
                ? ((vlSymsp->TOP__ysyx_22041812__DOT__dcache__DOT__tag_mem_1.io_tag_read_tag 
                    << 0x0000000aU) | (0x000003f0U 
                                       & vlSelfRef.ysyx_22041812__DOT__dcache__DOT__cpu_request_addr_reg))
                : vlSelfRef.ysyx_22041812__DOT__dcache__DOT___GEN_329)
            : vlSelfRef.ysyx_22041812__DOT__dcache__DOT___GEN_329);
    vlSelfRef.ysyx_22041812__DOT__dcache__DOT___GEN_347 
        = ((2U == (IData)(vlSelfRef.ysyx_22041812__DOT__dcache__DOT__max))
            ? ((IData)(vlSymsp->TOP__ysyx_22041812__DOT__dcache__DOT__tag_mem_2.__VdfgRegularize_hebeb780c_0_431)
                ? ((vlSymsp->TOP__ysyx_22041812__DOT__dcache__DOT__tag_mem_2.io_tag_read_tag 
                    << 0x0000000aU) | (0x000003f0U 
                                       & vlSelfRef.ysyx_22041812__DOT__dcache__DOT__cpu_request_addr_reg))
                : vlSelfRef.ysyx_22041812__DOT__dcache__DOT___GEN_338)
            : vlSelfRef.ysyx_22041812__DOT__dcache__DOT___GEN_338);
}

void Vysyx_22041812___024root___nba_sequent__TOP__4(Vysyx_22041812___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vysyx_22041812___024root___nba_sequent__TOP__4\n"); );
    Vysyx_22041812__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    vlSelfRef.ysyx_22041812__DOT__icache__DOT__visit_1 
        = ((- (IData)((0U != (IData)(vlSelfRef.ysyx_22041812__DOT__icache__DOT__cache_state)))) 
           & ((- (IData)((0x0fU != (IData)(vlSelfRef.ysyx_22041812__DOT__icache__DOT__cache_state)))) 
              & ((- (IData)((0x10U != (IData)(vlSelfRef.ysyx_22041812__DOT__icache__DOT__cache_state)))) 
                 & ((- (IData)((0x11U != (IData)(vlSelfRef.ysyx_22041812__DOT__icache__DOT__cache_state)))) 
                    & ((- (IData)((0x13U != (IData)(vlSelfRef.ysyx_22041812__DOT__icache__DOT__cache_state)))) 
                       & ((- (IData)((1U != (IData)(vlSelfRef.ysyx_22041812__DOT__icache__DOT__cache_state)))) 
                          & ((- (IData)((3U != (IData)(vlSelfRef.ysyx_22041812__DOT__icache__DOT__cache_state)))) 
                             & ((- (IData)((4U != (IData)(vlSelfRef.ysyx_22041812__DOT__icache__DOT__cache_state)))) 
                                & ((- (IData)((5U != (IData)(vlSelfRef.ysyx_22041812__DOT__icache__DOT__cache_state)))) 
                                   & ((- (IData)((6U 
                                                  == (IData)(vlSelfRef.ysyx_22041812__DOT__icache__DOT__cache_state)))) 
                                      & ((- (IData)(
                                                    (1U 
                                                     & (~ (IData)(vlSelfRef.__VdfgRegularize_hebeb780c_0_1))))) 
                                         & ((IData)(vlSymsp->TOP__ysyx_22041812__DOT__icache__DOT__tag_mem_1.io_tag_read_visit) 
                                            & (- (IData)((IData)(vlSymsp->TOP__ysyx_22041812__DOT__icache__DOT__tag_mem_0.__VdfgRegularize_hebeb780c_0_57)))))))))))))));
    vlSelfRef.ysyx_22041812__DOT__icache__DOT__visit_0 
        = ((- (IData)((0U != (IData)(vlSelfRef.ysyx_22041812__DOT__icache__DOT__cache_state)))) 
           & ((- (IData)((0x0fU != (IData)(vlSelfRef.ysyx_22041812__DOT__icache__DOT__cache_state)))) 
              & ((- (IData)((0x10U != (IData)(vlSelfRef.ysyx_22041812__DOT__icache__DOT__cache_state)))) 
                 & ((- (IData)((0x11U != (IData)(vlSelfRef.ysyx_22041812__DOT__icache__DOT__cache_state)))) 
                    & ((- (IData)((0x13U != (IData)(vlSelfRef.ysyx_22041812__DOT__icache__DOT__cache_state)))) 
                       & ((- (IData)((1U != (IData)(vlSelfRef.ysyx_22041812__DOT__icache__DOT__cache_state)))) 
                          & ((- (IData)((3U != (IData)(vlSelfRef.ysyx_22041812__DOT__icache__DOT__cache_state)))) 
                             & ((- (IData)((4U != (IData)(vlSelfRef.ysyx_22041812__DOT__icache__DOT__cache_state)))) 
                                & ((- (IData)((5U != (IData)(vlSelfRef.ysyx_22041812__DOT__icache__DOT__cache_state)))) 
                                   & ((- (IData)((6U 
                                                  == (IData)(vlSelfRef.ysyx_22041812__DOT__icache__DOT__cache_state)))) 
                                      & ((- (IData)(
                                                    (1U 
                                                     & (~ (IData)(vlSelfRef.__VdfgRegularize_hebeb780c_0_1))))) 
                                         & ((IData)(vlSymsp->TOP__ysyx_22041812__DOT__icache__DOT__tag_mem_0.io_tag_read_visit) 
                                            & (- (IData)((IData)(vlSymsp->TOP__ysyx_22041812__DOT__icache__DOT__tag_mem_0.__VdfgRegularize_hebeb780c_0_57)))))))))))))));
    vlSelfRef.ysyx_22041812__DOT__icache__DOT__visit_3 
        = ((- (IData)((0U != (IData)(vlSelfRef.ysyx_22041812__DOT__icache__DOT__cache_state)))) 
           & ((- (IData)((0x0fU != (IData)(vlSelfRef.ysyx_22041812__DOT__icache__DOT__cache_state)))) 
              & ((- (IData)((0x10U != (IData)(vlSelfRef.ysyx_22041812__DOT__icache__DOT__cache_state)))) 
                 & ((- (IData)((0x11U != (IData)(vlSelfRef.ysyx_22041812__DOT__icache__DOT__cache_state)))) 
                    & ((- (IData)((0x13U != (IData)(vlSelfRef.ysyx_22041812__DOT__icache__DOT__cache_state)))) 
                       & ((- (IData)((1U != (IData)(vlSelfRef.ysyx_22041812__DOT__icache__DOT__cache_state)))) 
                          & ((- (IData)((3U != (IData)(vlSelfRef.ysyx_22041812__DOT__icache__DOT__cache_state)))) 
                             & ((- (IData)((4U != (IData)(vlSelfRef.ysyx_22041812__DOT__icache__DOT__cache_state)))) 
                                & ((- (IData)((5U != (IData)(vlSelfRef.ysyx_22041812__DOT__icache__DOT__cache_state)))) 
                                   & ((- (IData)((6U 
                                                  == (IData)(vlSelfRef.ysyx_22041812__DOT__icache__DOT__cache_state)))) 
                                      & ((- (IData)(
                                                    (1U 
                                                     & (~ (IData)(vlSelfRef.__VdfgRegularize_hebeb780c_0_1))))) 
                                         & ((IData)(vlSymsp->TOP__ysyx_22041812__DOT__icache__DOT__tag_mem_3.io_tag_read_visit) 
                                            & (- (IData)((IData)(vlSymsp->TOP__ysyx_22041812__DOT__icache__DOT__tag_mem_0.__VdfgRegularize_hebeb780c_0_57)))))))))))))));
    vlSelfRef.ysyx_22041812__DOT__icache__DOT__visit_2 
        = ((- (IData)((0U != (IData)(vlSelfRef.ysyx_22041812__DOT__icache__DOT__cache_state)))) 
           & ((- (IData)((0x0fU != (IData)(vlSelfRef.ysyx_22041812__DOT__icache__DOT__cache_state)))) 
              & ((- (IData)((0x10U != (IData)(vlSelfRef.ysyx_22041812__DOT__icache__DOT__cache_state)))) 
                 & ((- (IData)((0x11U != (IData)(vlSelfRef.ysyx_22041812__DOT__icache__DOT__cache_state)))) 
                    & ((- (IData)((0x13U != (IData)(vlSelfRef.ysyx_22041812__DOT__icache__DOT__cache_state)))) 
                       & ((- (IData)((1U != (IData)(vlSelfRef.ysyx_22041812__DOT__icache__DOT__cache_state)))) 
                          & ((- (IData)((3U != (IData)(vlSelfRef.ysyx_22041812__DOT__icache__DOT__cache_state)))) 
                             & ((- (IData)((4U != (IData)(vlSelfRef.ysyx_22041812__DOT__icache__DOT__cache_state)))) 
                                & ((- (IData)((5U != (IData)(vlSelfRef.ysyx_22041812__DOT__icache__DOT__cache_state)))) 
                                   & ((- (IData)((6U 
                                                  == (IData)(vlSelfRef.ysyx_22041812__DOT__icache__DOT__cache_state)))) 
                                      & ((- (IData)(
                                                    (1U 
                                                     & (~ (IData)(vlSelfRef.__VdfgRegularize_hebeb780c_0_1))))) 
                                         & ((IData)(vlSymsp->TOP__ysyx_22041812__DOT__icache__DOT__tag_mem_2.io_tag_read_visit) 
                                            & (- (IData)((IData)(vlSymsp->TOP__ysyx_22041812__DOT__icache__DOT__tag_mem_0.__VdfgRegularize_hebeb780c_0_57)))))))))))))));
    vlSelfRef.ysyx_22041812__DOT__icache__DOT__compare_1_0 
        = ((0U != (IData)(vlSelfRef.ysyx_22041812__DOT__icache__DOT__cache_state)) 
           & ((0x0fU != (IData)(vlSelfRef.ysyx_22041812__DOT__icache__DOT__cache_state)) 
              & ((0x10U != (IData)(vlSelfRef.ysyx_22041812__DOT__icache__DOT__cache_state)) 
                 & ((0x11U != (IData)(vlSelfRef.ysyx_22041812__DOT__icache__DOT__cache_state)) 
                    & ((0x13U != (IData)(vlSelfRef.ysyx_22041812__DOT__icache__DOT__cache_state)) 
                       & ((1U != (IData)(vlSelfRef.ysyx_22041812__DOT__icache__DOT__cache_state)) 
                          & ((3U != (IData)(vlSelfRef.ysyx_22041812__DOT__icache__DOT__cache_state)) 
                             & ((4U != (IData)(vlSelfRef.ysyx_22041812__DOT__icache__DOT__cache_state)) 
                                & ((5U != (IData)(vlSelfRef.ysyx_22041812__DOT__icache__DOT__cache_state)) 
                                   & ((6U == (IData)(vlSelfRef.ysyx_22041812__DOT__icache__DOT__cache_state)) 
                                      & ((~ (IData)(vlSelfRef.__VdfgRegularize_hebeb780c_0_1)) 
                                         & (((IData)(vlSelfRef.ysyx_22041812__DOT__icache__DOT__visit_1) 
                                             > (IData)(vlSelfRef.ysyx_22041812__DOT__icache__DOT__visit_0)) 
                                            & (IData)(vlSymsp->TOP__ysyx_22041812__DOT__icache__DOT__tag_mem_0.__VdfgRegularize_hebeb780c_0_57)))))))))))));
    vlSelfRef.ysyx_22041812__DOT__icache__DOT__compare_2_3 
        = ((0U != (IData)(vlSelfRef.ysyx_22041812__DOT__icache__DOT__cache_state)) 
           & ((0x0fU != (IData)(vlSelfRef.ysyx_22041812__DOT__icache__DOT__cache_state)) 
              & ((0x10U != (IData)(vlSelfRef.ysyx_22041812__DOT__icache__DOT__cache_state)) 
                 & ((0x11U != (IData)(vlSelfRef.ysyx_22041812__DOT__icache__DOT__cache_state)) 
                    & ((0x13U != (IData)(vlSelfRef.ysyx_22041812__DOT__icache__DOT__cache_state)) 
                       & ((1U != (IData)(vlSelfRef.ysyx_22041812__DOT__icache__DOT__cache_state)) 
                          & ((3U != (IData)(vlSelfRef.ysyx_22041812__DOT__icache__DOT__cache_state)) 
                             & ((4U != (IData)(vlSelfRef.ysyx_22041812__DOT__icache__DOT__cache_state)) 
                                & ((5U != (IData)(vlSelfRef.ysyx_22041812__DOT__icache__DOT__cache_state)) 
                                   & ((6U == (IData)(vlSelfRef.ysyx_22041812__DOT__icache__DOT__cache_state)) 
                                      & ((~ (IData)(vlSelfRef.__VdfgRegularize_hebeb780c_0_1)) 
                                         & (((IData)(vlSelfRef.ysyx_22041812__DOT__icache__DOT__visit_3) 
                                             > (IData)(vlSelfRef.ysyx_22041812__DOT__icache__DOT__visit_2)) 
                                            & (IData)(vlSymsp->TOP__ysyx_22041812__DOT__icache__DOT__tag_mem_0.__VdfgRegularize_hebeb780c_0_57)))))))))))));
    vlSelfRef.ysyx_22041812__DOT__icache__DOT__max_01_or_23 
        = ((0U != (IData)(vlSelfRef.ysyx_22041812__DOT__icache__DOT__cache_state)) 
           & ((0x0fU != (IData)(vlSelfRef.ysyx_22041812__DOT__icache__DOT__cache_state)) 
              & ((0x10U != (IData)(vlSelfRef.ysyx_22041812__DOT__icache__DOT__cache_state)) 
                 & ((0x11U != (IData)(vlSelfRef.ysyx_22041812__DOT__icache__DOT__cache_state)) 
                    & ((0x13U != (IData)(vlSelfRef.ysyx_22041812__DOT__icache__DOT__cache_state)) 
                       & ((1U != (IData)(vlSelfRef.ysyx_22041812__DOT__icache__DOT__cache_state)) 
                          & ((3U != (IData)(vlSelfRef.ysyx_22041812__DOT__icache__DOT__cache_state)) 
                             & ((4U != (IData)(vlSelfRef.ysyx_22041812__DOT__icache__DOT__cache_state)) 
                                & ((5U != (IData)(vlSelfRef.ysyx_22041812__DOT__icache__DOT__cache_state)) 
                                   & ((6U == (IData)(vlSelfRef.ysyx_22041812__DOT__icache__DOT__cache_state)) 
                                      & ((~ (IData)(vlSelfRef.__VdfgRegularize_hebeb780c_0_1)) 
                                         & ((((IData)(vlSelfRef.ysyx_22041812__DOT__icache__DOT__compare_2_3)
                                               ? (IData)(vlSelfRef.ysyx_22041812__DOT__icache__DOT__visit_3)
                                               : (IData)(vlSelfRef.ysyx_22041812__DOT__icache__DOT__visit_2)) 
                                             > ((IData)(vlSelfRef.ysyx_22041812__DOT__icache__DOT__compare_1_0)
                                                 ? (IData)(vlSelfRef.ysyx_22041812__DOT__icache__DOT__visit_1)
                                                 : (IData)(vlSelfRef.ysyx_22041812__DOT__icache__DOT__visit_0))) 
                                            & (IData)(vlSymsp->TOP__ysyx_22041812__DOT__icache__DOT__tag_mem_0.__VdfgRegularize_hebeb780c_0_57)))))))))))));
    vlSelfRef.ysyx_22041812__DOT__icache__DOT__max 
        = (3U & ((- (IData)((1U != (IData)(vlSelfRef.ysyx_22041812__DOT__icache__DOT__cache_state)))) 
                 & ((- (IData)((0U != (IData)(vlSelfRef.ysyx_22041812__DOT__icache__DOT__cache_state)))) 
                    & ((- (IData)((0x0fU != (IData)(vlSelfRef.ysyx_22041812__DOT__icache__DOT__cache_state)))) 
                       & ((- (IData)((0x10U != (IData)(vlSelfRef.ysyx_22041812__DOT__icache__DOT__cache_state)))) 
                          & ((- (IData)((0x11U != (IData)(vlSelfRef.ysyx_22041812__DOT__icache__DOT__cache_state)))) 
                             & ((- (IData)((0x13U != (IData)(vlSelfRef.ysyx_22041812__DOT__icache__DOT__cache_state)))) 
                                & ((- (IData)((3U != (IData)(vlSelfRef.ysyx_22041812__DOT__icache__DOT__cache_state)))) 
                                   & ((- (IData)((4U 
                                                  != (IData)(vlSelfRef.ysyx_22041812__DOT__icache__DOT__cache_state)))) 
                                      & ((- (IData)(
                                                    (5U 
                                                     != (IData)(vlSelfRef.ysyx_22041812__DOT__icache__DOT__cache_state)))) 
                                         & ((- (IData)(
                                                       (6U 
                                                        == (IData)(vlSelfRef.ysyx_22041812__DOT__icache__DOT__cache_state)))) 
                                            & (((IData)(vlSymsp->TOP__ysyx_22041812__DOT__icache__DOT__tag_mem_0.__VdfgRegularize_hebeb780c_0_57)
                                                 ? 
                                                (((IData)(vlSelfRef.ysyx_22041812__DOT__icache__DOT__max_01_or_23) 
                                                  << 1U) 
                                                 | ((IData)(vlSelfRef.ysyx_22041812__DOT__icache__DOT__max_01_or_23)
                                                     ? (IData)(vlSelfRef.ysyx_22041812__DOT__icache__DOT__compare_2_3)
                                                     : (IData)(vlSelfRef.ysyx_22041812__DOT__icache__DOT__compare_1_0)))
                                                 : 
                                                ((IData)(vlSymsp->TOP__ysyx_22041812__DOT__icache__DOT__tag_mem_1.io_tag_read_valid)
                                                  ? 
                                                 ((IData)(vlSymsp->TOP__ysyx_22041812__DOT__icache__DOT__tag_mem_2.io_tag_read_valid)
                                                   ? 
                                                  (- (IData)(
                                                             (1U 
                                                              & (~ (IData)(vlSymsp->TOP__ysyx_22041812__DOT__icache__DOT__tag_mem_3.io_tag_read_valid)))))
                                                   : 2U)
                                                  : 1U)) 
                                               & (- (IData)(
                                                            (1U 
                                                             & (~ (IData)(vlSelfRef.__VdfgRegularize_hebeb780c_0_1)))))))))))))))));
}

void Vysyx_22041812___024root___trigger_orInto__act_vec_vec(VlUnpacked<QData/*63:0*/, 1> &out, const VlUnpacked<QData/*63:0*/, 1> &in) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vysyx_22041812___024root___trigger_orInto__act_vec_vec\n"); );
    // Locals
    IData/*31:0*/ n;
    // Body
    n = 0U;
    do {
        out[n] = (out[n] | in[n]);
        n = ((IData)(1U) + n);
    } while ((0U >= n));
}

#ifdef VL_DEBUG
VL_ATTR_COLD void Vysyx_22041812___024root___dump_triggers__act(const VlUnpacked<QData/*63:0*/, 1> &triggers, const std::string &tag);
#endif  // VL_DEBUG

bool Vysyx_22041812___024root___eval_phase__act(Vysyx_22041812___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vysyx_22041812___024root___eval_phase__act\n"); );
    Vysyx_22041812__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    {
        // Inlined CFunc: _eval_triggers_vec__act
        vlSelfRef.__VactTriggered[0U] = (QData)((IData)(
                                                        ((IData)(vlSelfRef.clock) 
                                                         & (~ (IData)(vlSelfRef.__Vtrigprevexpr___TOP__clock__1)))));
        vlSelfRef.__Vtrigprevexpr___TOP__clock__1 = vlSelfRef.clock;
    }
#ifdef VL_DEBUG
    if (VL_UNLIKELY(vlSymsp->_vm_contextp__->debug())) {
        Vysyx_22041812___024root___dump_triggers__act(vlSelfRef.__VactTriggered, "act"s);
    }
#endif
    Vysyx_22041812___024root___trigger_orInto__act_vec_vec(vlSelfRef.__VnbaTriggered, vlSelfRef.__VactTriggered);
    return (0U);
}

void Vysyx_22041812___024root___trigger_clear__act(VlUnpacked<QData/*63:0*/, 1> &out) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vysyx_22041812___024root___trigger_clear__act\n"); );
    // Locals
    IData/*31:0*/ n;
    // Body
    n = 0U;
    do {
        out[n] = 0ULL;
        n = ((IData)(1U) + n);
    } while ((1U > n));
}

bool Vysyx_22041812___024root___trigger_anySet__act(const VlUnpacked<QData/*63:0*/, 1> &in);
void Vysyx_22041812___024root___nba_sequent__TOP__0(Vysyx_22041812___024root* vlSelf);
void Vysyx_22041812_ysyx_22041812_tag_cache___nba_sequent__TOP__ysyx_22041812__DOT__icache__DOT__tag_mem_0__0(Vysyx_22041812_ysyx_22041812_tag_cache* vlSelf);
void Vysyx_22041812_ysyx_22041812_tag_cache___nba_sequent__TOP__ysyx_22041812__DOT__icache__DOT__tag_mem_1__0(Vysyx_22041812_ysyx_22041812_tag_cache* vlSelf);
void Vysyx_22041812_ysyx_22041812_tag_cache___nba_sequent__TOP__ysyx_22041812__DOT__dcache__DOT__tag_mem_1__0(Vysyx_22041812_ysyx_22041812_tag_cache* vlSelf);
void Vysyx_22041812_ysyx_22041812_tag_cache___nba_sequent__TOP__ysyx_22041812__DOT__dcache__DOT__tag_mem_0__0(Vysyx_22041812_ysyx_22041812_tag_cache* vlSelf);
void Vysyx_22041812_ysyx_22041812_tag_cache___nba_sequent__TOP__ysyx_22041812__DOT__icache__DOT__tag_mem_0__1(Vysyx_22041812_ysyx_22041812_tag_cache* vlSelf);
void Vysyx_22041812_ysyx_22041812_tag_cache___nba_sequent__TOP__ysyx_22041812__DOT__dcache__DOT__tag_mem_3__1(Vysyx_22041812_ysyx_22041812_tag_cache* vlSelf);
void Vysyx_22041812_ysyx_22041812_tag_cache___nba_sequent__TOP__ysyx_22041812__DOT__dcache__DOT__tag_mem_2__1(Vysyx_22041812_ysyx_22041812_tag_cache* vlSelf);
void Vysyx_22041812_ysyx_22041812_tag_cache___nba_sequent__TOP__ysyx_22041812__DOT__dcache__DOT__tag_mem_1__1(Vysyx_22041812_ysyx_22041812_tag_cache* vlSelf);
void Vysyx_22041812_ysyx_22041812_tag_cache___nba_sequent__TOP__ysyx_22041812__DOT__icache__DOT__tag_mem_1__1(Vysyx_22041812_ysyx_22041812_tag_cache* vlSelf);
void Vysyx_22041812_ysyx_22041812_tag_cache___nba_sequent__TOP__ysyx_22041812__DOT__dcache__DOT__tag_mem_0__1(Vysyx_22041812_ysyx_22041812_tag_cache* vlSelf);
void Vysyx_22041812_ysyx_22041812_tag_cache___nba_sequent__TOP__ysyx_22041812__DOT__icache__DOT__tag_mem_0__2(Vysyx_22041812_ysyx_22041812_tag_cache* vlSelf);
void Vysyx_22041812_ysyx_22041812_tag_cache___nba_sequent__TOP__ysyx_22041812__DOT__dcache__DOT__tag_mem_0__2(Vysyx_22041812_ysyx_22041812_tag_cache* vlSelf);
void Vysyx_22041812_ysyx_22041812_tag_cache___nba_sequent__TOP__ysyx_22041812__DOT__dcache__DOT__tag_mem_1__2(Vysyx_22041812_ysyx_22041812_tag_cache* vlSelf);
void Vysyx_22041812_ysyx_22041812_tag_cache___nba_sequent__TOP__ysyx_22041812__DOT__dcache__DOT__tag_mem_2__2(Vysyx_22041812_ysyx_22041812_tag_cache* vlSelf);
void Vysyx_22041812_ysyx_22041812_tag_cache___nba_sequent__TOP__ysyx_22041812__DOT__dcache__DOT__tag_mem_3__2(Vysyx_22041812_ysyx_22041812_tag_cache* vlSelf);
void Vysyx_22041812_ysyx_22041812_tag_cache___nba_sequent__TOP__ysyx_22041812__DOT__icache__DOT__tag_mem_0__3(Vysyx_22041812_ysyx_22041812_tag_cache* vlSelf);
void Vysyx_22041812_ysyx_22041812_tag_cache___nba_sequent__TOP__ysyx_22041812__DOT__icache__DOT__tag_mem_1__2(Vysyx_22041812_ysyx_22041812_tag_cache* vlSelf);
void Vysyx_22041812_ysyx_22041812_tag_cache___nba_sequent__TOP__ysyx_22041812__DOT__icache__DOT__tag_mem_2__2(Vysyx_22041812_ysyx_22041812_tag_cache* vlSelf);
void Vysyx_22041812_ysyx_22041812_tag_cache___nba_sequent__TOP__ysyx_22041812__DOT__icache__DOT__tag_mem_3__2(Vysyx_22041812_ysyx_22041812_tag_cache* vlSelf);

bool Vysyx_22041812___024root___eval_phase__nba(Vysyx_22041812___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vysyx_22041812___024root___eval_phase__nba\n"); );
    Vysyx_22041812__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Locals
    CData/*0:0*/ __VnbaExecute;
    // Body
    __VnbaExecute = Vysyx_22041812___024root___trigger_anySet__act(vlSelfRef.__VnbaTriggered);
    if (__VnbaExecute) {
        {
            // Inlined CFunc: _eval_nba
            if ((1ULL & vlSelfRef.__VnbaTriggered[0U])) {
                Vysyx_22041812___024root___nba_sequent__TOP__0(vlSelf);
                Vysyx_22041812___024root___nba_sequent__TOP__1(vlSelf);
                Vysyx_22041812_ysyx_22041812_tag_cache___nba_sequent__TOP__ysyx_22041812__DOT__icache__DOT__tag_mem_0__0((&vlSymsp->TOP__ysyx_22041812__DOT__icache__DOT__tag_mem_0));
                Vysyx_22041812_ysyx_22041812_tag_cache___nba_sequent__TOP__ysyx_22041812__DOT__icache__DOT__tag_mem_1__0((&vlSymsp->TOP__ysyx_22041812__DOT__icache__DOT__tag_mem_1));
                Vysyx_22041812_ysyx_22041812_tag_cache___nba_sequent__TOP__ysyx_22041812__DOT__icache__DOT__tag_mem_1__0((&vlSymsp->TOP__ysyx_22041812__DOT__icache__DOT__tag_mem_2));
                Vysyx_22041812_ysyx_22041812_tag_cache___nba_sequent__TOP__ysyx_22041812__DOT__icache__DOT__tag_mem_1__0((&vlSymsp->TOP__ysyx_22041812__DOT__icache__DOT__tag_mem_3));
                Vysyx_22041812_ysyx_22041812_tag_cache___nba_sequent__TOP__ysyx_22041812__DOT__dcache__DOT__tag_mem_1__0((&vlSymsp->TOP__ysyx_22041812__DOT__dcache__DOT__tag_mem_3));
                Vysyx_22041812_ysyx_22041812_tag_cache___nba_sequent__TOP__ysyx_22041812__DOT__dcache__DOT__tag_mem_1__0((&vlSymsp->TOP__ysyx_22041812__DOT__dcache__DOT__tag_mem_2));
                Vysyx_22041812_ysyx_22041812_tag_cache___nba_sequent__TOP__ysyx_22041812__DOT__dcache__DOT__tag_mem_1__0((&vlSymsp->TOP__ysyx_22041812__DOT__dcache__DOT__tag_mem_1));
                Vysyx_22041812_ysyx_22041812_tag_cache___nba_sequent__TOP__ysyx_22041812__DOT__dcache__DOT__tag_mem_0__0((&vlSymsp->TOP__ysyx_22041812__DOT__dcache__DOT__tag_mem_0));
                Vysyx_22041812_ysyx_22041812_tag_cache___nba_sequent__TOP__ysyx_22041812__DOT__icache__DOT__tag_mem_0__1((&vlSymsp->TOP__ysyx_22041812__DOT__icache__DOT__tag_mem_0));
                Vysyx_22041812_ysyx_22041812_tag_cache___nba_sequent__TOP__ysyx_22041812__DOT__dcache__DOT__tag_mem_3__1((&vlSymsp->TOP__ysyx_22041812__DOT__dcache__DOT__tag_mem_3));
                Vysyx_22041812_ysyx_22041812_tag_cache___nba_sequent__TOP__ysyx_22041812__DOT__dcache__DOT__tag_mem_2__1((&vlSymsp->TOP__ysyx_22041812__DOT__dcache__DOT__tag_mem_2));
                Vysyx_22041812_ysyx_22041812_tag_cache___nba_sequent__TOP__ysyx_22041812__DOT__dcache__DOT__tag_mem_1__1((&vlSymsp->TOP__ysyx_22041812__DOT__dcache__DOT__tag_mem_1));
                Vysyx_22041812___024root___nba_sequent__TOP__2(vlSelf);
                Vysyx_22041812_ysyx_22041812_tag_cache___nba_sequent__TOP__ysyx_22041812__DOT__icache__DOT__tag_mem_1__1((&vlSymsp->TOP__ysyx_22041812__DOT__icache__DOT__tag_mem_1));
                Vysyx_22041812_ysyx_22041812_tag_cache___nba_sequent__TOP__ysyx_22041812__DOT__icache__DOT__tag_mem_1__1((&vlSymsp->TOP__ysyx_22041812__DOT__icache__DOT__tag_mem_2));
                Vysyx_22041812_ysyx_22041812_tag_cache___nba_sequent__TOP__ysyx_22041812__DOT__icache__DOT__tag_mem_1__1((&vlSymsp->TOP__ysyx_22041812__DOT__icache__DOT__tag_mem_3));
                Vysyx_22041812_ysyx_22041812_tag_cache___nba_sequent__TOP__ysyx_22041812__DOT__dcache__DOT__tag_mem_0__1((&vlSymsp->TOP__ysyx_22041812__DOT__dcache__DOT__tag_mem_0));
                Vysyx_22041812___024root___nba_sequent__TOP__3(vlSelf);
                Vysyx_22041812_ysyx_22041812_tag_cache___nba_sequent__TOP__ysyx_22041812__DOT__icache__DOT__tag_mem_0__2((&vlSymsp->TOP__ysyx_22041812__DOT__icache__DOT__tag_mem_0));
                Vysyx_22041812_ysyx_22041812_tag_cache___nba_sequent__TOP__ysyx_22041812__DOT__dcache__DOT__tag_mem_0__2((&vlSymsp->TOP__ysyx_22041812__DOT__dcache__DOT__tag_mem_0));
                Vysyx_22041812_ysyx_22041812_tag_cache___nba_sequent__TOP__ysyx_22041812__DOT__dcache__DOT__tag_mem_1__2((&vlSymsp->TOP__ysyx_22041812__DOT__dcache__DOT__tag_mem_1));
                Vysyx_22041812_ysyx_22041812_tag_cache___nba_sequent__TOP__ysyx_22041812__DOT__dcache__DOT__tag_mem_2__2((&vlSymsp->TOP__ysyx_22041812__DOT__dcache__DOT__tag_mem_2));
                Vysyx_22041812_ysyx_22041812_tag_cache___nba_sequent__TOP__ysyx_22041812__DOT__dcache__DOT__tag_mem_3__2((&vlSymsp->TOP__ysyx_22041812__DOT__dcache__DOT__tag_mem_3));
                Vysyx_22041812___024root___nba_sequent__TOP__4(vlSelf);
                Vysyx_22041812_ysyx_22041812_tag_cache___nba_sequent__TOP__ysyx_22041812__DOT__icache__DOT__tag_mem_0__3((&vlSymsp->TOP__ysyx_22041812__DOT__icache__DOT__tag_mem_0));
                Vysyx_22041812_ysyx_22041812_tag_cache___nba_sequent__TOP__ysyx_22041812__DOT__icache__DOT__tag_mem_1__2((&vlSymsp->TOP__ysyx_22041812__DOT__icache__DOT__tag_mem_1));
                Vysyx_22041812_ysyx_22041812_tag_cache___nba_sequent__TOP__ysyx_22041812__DOT__icache__DOT__tag_mem_2__2((&vlSymsp->TOP__ysyx_22041812__DOT__icache__DOT__tag_mem_2));
                Vysyx_22041812_ysyx_22041812_tag_cache___nba_sequent__TOP__ysyx_22041812__DOT__icache__DOT__tag_mem_3__2((&vlSymsp->TOP__ysyx_22041812__DOT__icache__DOT__tag_mem_3));
            }
        }
        Vysyx_22041812___024root___trigger_clear__act(vlSelfRef.__VnbaTriggered);
    }
    return (__VnbaExecute);
}

#ifdef VL_DEBUG
VL_ATTR_COLD void Vysyx_22041812___024root___dump_triggers__ico(const VlUnpacked<QData/*63:0*/, 2> &triggers, const std::string &tag);
#endif  // VL_DEBUG
bool Vysyx_22041812___024root___eval_phase__ico(Vysyx_22041812___024root* vlSelf);

void Vysyx_22041812___024root___eval(Vysyx_22041812___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vysyx_22041812___024root___eval\n"); );
    Vysyx_22041812__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Locals
    IData/*31:0*/ __VicoIterCount;
    IData/*31:0*/ __VnbaIterCount;
    // Body
    __VicoIterCount = 0U;
    do {
        if (VL_UNLIKELY(((0x00002710U < __VicoIterCount)))) {
#ifdef VL_DEBUG
            Vysyx_22041812___024root___dump_triggers__ico(vlSelfRef.__VicoTriggered, "ico"s);
#endif
            VL_FATAL_MT("../ysyx_22041812.v", 15110, "", "DIDNOTCONVERGE: Input combinational region did not converge after '--converge-limit' of 10000 tries");
        }
        __VicoIterCount = ((IData)(1U) + __VicoIterCount);
        vlSelfRef.__VicoPhaseResult = Vysyx_22041812___024root___eval_phase__ico(vlSelf);
    } while (vlSelfRef.__VicoPhaseResult);
    __VnbaIterCount = 0U;
    do {
        if (VL_UNLIKELY(((0x00002710U < __VnbaIterCount)))) {
#ifdef VL_DEBUG
            Vysyx_22041812___024root___dump_triggers__act(vlSelfRef.__VnbaTriggered, "nba"s);
#endif
            VL_FATAL_MT("../ysyx_22041812.v", 15110, "", "DIDNOTCONVERGE: NBA region did not converge after '--converge-limit' of 10000 tries");
        }
        __VnbaIterCount = ((IData)(1U) + __VnbaIterCount);
        vlSelfRef.__VactIterCount = 0U;
        do {
            if (VL_UNLIKELY(((0x00002710U < vlSelfRef.__VactIterCount)))) {
#ifdef VL_DEBUG
                Vysyx_22041812___024root___dump_triggers__act(vlSelfRef.__VactTriggered, "act"s);
#endif
                VL_FATAL_MT("../ysyx_22041812.v", 15110, "", "DIDNOTCONVERGE: Active region did not converge after '--converge-limit' of 10000 tries");
            }
            vlSelfRef.__VactIterCount = ((IData)(1U) 
                                         + vlSelfRef.__VactIterCount);
            vlSelfRef.__VactPhaseResult = Vysyx_22041812___024root___eval_phase__act(vlSelf);
        } while (vlSelfRef.__VactPhaseResult);
        vlSelfRef.__VnbaPhaseResult = Vysyx_22041812___024root___eval_phase__nba(vlSelf);
    } while (vlSelfRef.__VnbaPhaseResult);
}

#ifdef VL_DEBUG
void Vysyx_22041812___024root___eval_debug_assertions(Vysyx_22041812___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vysyx_22041812___024root___eval_debug_assertions\n"); );
    Vysyx_22041812__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    if (VL_UNLIKELY(((vlSelfRef.clock & 0xfeU)))) {
        Verilated::overWidthError("clock");
    }
    if (VL_UNLIKELY(((vlSelfRef.reset & 0xfeU)))) {
        Verilated::overWidthError("reset");
    }
    if (VL_UNLIKELY(((vlSelfRef.io_interrupt & 0xfeU)))) {
        Verilated::overWidthError("io_interrupt");
    }
    if (VL_UNLIKELY(((vlSelfRef.io_master_awready & 0xfeU)))) {
        Verilated::overWidthError("io_master_awready");
    }
    if (VL_UNLIKELY(((vlSelfRef.io_master_wready & 0xfeU)))) {
        Verilated::overWidthError("io_master_wready");
    }
    if (VL_UNLIKELY(((vlSelfRef.io_master_bvalid & 0xfeU)))) {
        Verilated::overWidthError("io_master_bvalid");
    }
    if (VL_UNLIKELY(((vlSelfRef.io_master_bresp & 0xfcU)))) {
        Verilated::overWidthError("io_master_bresp");
    }
    if (VL_UNLIKELY(((vlSelfRef.io_master_bid & 0xf0U)))) {
        Verilated::overWidthError("io_master_bid");
    }
    if (VL_UNLIKELY(((vlSelfRef.io_master_arready & 0xfeU)))) {
        Verilated::overWidthError("io_master_arready");
    }
    if (VL_UNLIKELY(((vlSelfRef.io_master_rvalid & 0xfeU)))) {
        Verilated::overWidthError("io_master_rvalid");
    }
    if (VL_UNLIKELY(((vlSelfRef.io_master_rresp & 0xfcU)))) {
        Verilated::overWidthError("io_master_rresp");
    }
    if (VL_UNLIKELY(((vlSelfRef.io_master_rlast & 0xfeU)))) {
        Verilated::overWidthError("io_master_rlast");
    }
    if (VL_UNLIKELY(((vlSelfRef.io_master_rid & 0xf0U)))) {
        Verilated::overWidthError("io_master_rid");
    }
    if (VL_UNLIKELY(((vlSelfRef.io_slave_awvalid & 0xfeU)))) {
        Verilated::overWidthError("io_slave_awvalid");
    }
    if (VL_UNLIKELY(((vlSelfRef.io_slave_awid & 0xf0U)))) {
        Verilated::overWidthError("io_slave_awid");
    }
    if (VL_UNLIKELY(((vlSelfRef.io_slave_awsize & 0xf8U)))) {
        Verilated::overWidthError("io_slave_awsize");
    }
    if (VL_UNLIKELY(((vlSelfRef.io_slave_awburst & 0xfcU)))) {
        Verilated::overWidthError("io_slave_awburst");
    }
    if (VL_UNLIKELY(((vlSelfRef.io_slave_wvalid & 0xfeU)))) {
        Verilated::overWidthError("io_slave_wvalid");
    }
    if (VL_UNLIKELY(((vlSelfRef.io_slave_wlast & 0xfeU)))) {
        Verilated::overWidthError("io_slave_wlast");
    }
    if (VL_UNLIKELY(((vlSelfRef.io_slave_bready & 0xfeU)))) {
        Verilated::overWidthError("io_slave_bready");
    }
    if (VL_UNLIKELY(((vlSelfRef.io_slave_arvalid & 0xfeU)))) {
        Verilated::overWidthError("io_slave_arvalid");
    }
    if (VL_UNLIKELY(((vlSelfRef.io_slave_arid & 0xf0U)))) {
        Verilated::overWidthError("io_slave_arid");
    }
    if (VL_UNLIKELY(((vlSelfRef.io_slave_arsize & 0xf8U)))) {
        Verilated::overWidthError("io_slave_arsize");
    }
    if (VL_UNLIKELY(((vlSelfRef.io_slave_arburst & 0xfcU)))) {
        Verilated::overWidthError("io_slave_arburst");
    }
    if (VL_UNLIKELY(((vlSelfRef.io_slave_rready & 0xfeU)))) {
        Verilated::overWidthError("io_slave_rready");
    }
}
#endif  // VL_DEBUG

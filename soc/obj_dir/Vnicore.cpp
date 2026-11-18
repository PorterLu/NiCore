// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Model implementation (design independent parts)

#include "Vnicore__pch.h"

//============================================================
// Constructors

Vnicore::Vnicore(VerilatedContext* _vcontextp__, const char* _vcname__)
    : VerilatedModel{*_vcontextp__}
    , vlSymsp{new Vnicore__Syms(contextp(), _vcname__, this)}
    , clock{vlSymsp->TOP.clock}
    , reset{vlSymsp->TOP.reset}
    , io_start{vlSymsp->TOP.io_start}
    , io_stall{vlSymsp->TOP.io_stall}
    , io_interrupt{vlSymsp->TOP.io_interrupt}
    , io_master_awready{vlSymsp->TOP.io_master_awready}
    , io_master_awvalid{vlSymsp->TOP.io_master_awvalid}
    , io_master_awid{vlSymsp->TOP.io_master_awid}
    , io_master_awlen{vlSymsp->TOP.io_master_awlen}
    , io_master_awsize{vlSymsp->TOP.io_master_awsize}
    , io_master_awburst{vlSymsp->TOP.io_master_awburst}
    , io_master_wready{vlSymsp->TOP.io_master_wready}
    , io_master_wvalid{vlSymsp->TOP.io_master_wvalid}
    , io_master_wstrb{vlSymsp->TOP.io_master_wstrb}
    , io_master_wlast{vlSymsp->TOP.io_master_wlast}
    , io_master_bready{vlSymsp->TOP.io_master_bready}
    , io_master_bvalid{vlSymsp->TOP.io_master_bvalid}
    , io_master_bresp{vlSymsp->TOP.io_master_bresp}
    , io_master_bid{vlSymsp->TOP.io_master_bid}
    , io_master_arready{vlSymsp->TOP.io_master_arready}
    , io_master_arvalid{vlSymsp->TOP.io_master_arvalid}
    , io_master_arid{vlSymsp->TOP.io_master_arid}
    , io_master_arlen{vlSymsp->TOP.io_master_arlen}
    , io_master_arsize{vlSymsp->TOP.io_master_arsize}
    , io_master_arburst{vlSymsp->TOP.io_master_arburst}
    , io_master_rready{vlSymsp->TOP.io_master_rready}
    , io_master_rvalid{vlSymsp->TOP.io_master_rvalid}
    , io_master_rresp{vlSymsp->TOP.io_master_rresp}
    , io_master_rlast{vlSymsp->TOP.io_master_rlast}
    , io_master_rid{vlSymsp->TOP.io_master_rid}
    , io_slave_awready{vlSymsp->TOP.io_slave_awready}
    , io_slave_awvalid{vlSymsp->TOP.io_slave_awvalid}
    , io_slave_awid{vlSymsp->TOP.io_slave_awid}
    , io_slave_awlen{vlSymsp->TOP.io_slave_awlen}
    , io_slave_awsize{vlSymsp->TOP.io_slave_awsize}
    , io_slave_awburst{vlSymsp->TOP.io_slave_awburst}
    , io_slave_wready{vlSymsp->TOP.io_slave_wready}
    , io_slave_wvalid{vlSymsp->TOP.io_slave_wvalid}
    , io_slave_wstrb{vlSymsp->TOP.io_slave_wstrb}
    , io_slave_wlast{vlSymsp->TOP.io_slave_wlast}
    , io_slave_bready{vlSymsp->TOP.io_slave_bready}
    , io_slave_bvalid{vlSymsp->TOP.io_slave_bvalid}
    , io_slave_bresp{vlSymsp->TOP.io_slave_bresp}
    , io_slave_bid{vlSymsp->TOP.io_slave_bid}
    , io_slave_arready{vlSymsp->TOP.io_slave_arready}
    , io_slave_arvalid{vlSymsp->TOP.io_slave_arvalid}
    , io_slave_arid{vlSymsp->TOP.io_slave_arid}
    , io_slave_arlen{vlSymsp->TOP.io_slave_arlen}
    , io_slave_arsize{vlSymsp->TOP.io_slave_arsize}
    , io_slave_arburst{vlSymsp->TOP.io_slave_arburst}
    , io_slave_rready{vlSymsp->TOP.io_slave_rready}
    , io_slave_rvalid{vlSymsp->TOP.io_slave_rvalid}
    , io_slave_rresp{vlSymsp->TOP.io_slave_rresp}
    , io_slave_rlast{vlSymsp->TOP.io_slave_rlast}
    , io_slave_rid{vlSymsp->TOP.io_slave_rid}
    , io_inst{vlSymsp->TOP.io_inst}
    , io_commit_inst{vlSymsp->TOP.io_commit_inst}
    , io_master_awaddr{vlSymsp->TOP.io_master_awaddr}
    , io_master_araddr{vlSymsp->TOP.io_master_araddr}
    , io_slave_awaddr{vlSymsp->TOP.io_slave_awaddr}
    , io_slave_araddr{vlSymsp->TOP.io_slave_araddr}
    , io_pc_debug{vlSymsp->TOP.io_pc_debug}
    , io_master_wdata{vlSymsp->TOP.io_master_wdata}
    , io_master_rdata{vlSymsp->TOP.io_master_rdata}
    , io_slave_wdata{vlSymsp->TOP.io_slave_wdata}
    , io_slave_rdata{vlSymsp->TOP.io_slave_rdata}
    , __PVT__nicore__DOT__dcache__DOT__tag_mem_0{vlSymsp->TOP.__PVT__nicore__DOT__dcache__DOT__tag_mem_0}
    , __PVT__nicore__DOT__dcache__DOT__tag_mem_1{vlSymsp->TOP.__PVT__nicore__DOT__dcache__DOT__tag_mem_1}
    , __PVT__nicore__DOT__dcache__DOT__tag_mem_2{vlSymsp->TOP.__PVT__nicore__DOT__dcache__DOT__tag_mem_2}
    , __PVT__nicore__DOT__dcache__DOT__tag_mem_3{vlSymsp->TOP.__PVT__nicore__DOT__dcache__DOT__tag_mem_3}
    , __PVT__nicore__DOT__icache__DOT__tag_mem_0{vlSymsp->TOP.__PVT__nicore__DOT__icache__DOT__tag_mem_0}
    , __PVT__nicore__DOT__icache__DOT__tag_mem_1{vlSymsp->TOP.__PVT__nicore__DOT__icache__DOT__tag_mem_1}
    , __PVT__nicore__DOT__icache__DOT__tag_mem_2{vlSymsp->TOP.__PVT__nicore__DOT__icache__DOT__tag_mem_2}
    , __PVT__nicore__DOT__icache__DOT__tag_mem_3{vlSymsp->TOP.__PVT__nicore__DOT__icache__DOT__tag_mem_3}
    , rootp{&(vlSymsp->TOP)}
{
    // Register model with the context
    contextp()->addModel(this);
}

Vnicore::Vnicore(const char* _vcname__)
    : Vnicore(Verilated::threadContextp(), _vcname__)
{
}

//============================================================
// Destructor

Vnicore::~Vnicore() {
    delete vlSymsp;
}

//============================================================
// Evaluation function

#ifdef VL_DEBUG
void Vnicore___024root___eval_debug_assertions(Vnicore___024root* vlSelf);
#endif  // VL_DEBUG
void Vnicore___024root___eval_static(Vnicore___024root* vlSelf);
void Vnicore___024root___eval_initial(Vnicore___024root* vlSelf);
void Vnicore___024root___eval_settle(Vnicore___024root* vlSelf);
void Vnicore___024root___eval(Vnicore___024root* vlSelf);

void Vnicore::eval_step() {
    VL_DEBUG_IF(VL_DBG_MSGF("+++++TOP Evaluate Vnicore::eval_step\n"); );
#ifdef VL_DEBUG
    // Debug assertions
    Vnicore___024root___eval_debug_assertions(&(vlSymsp->TOP));
#endif  // VL_DEBUG
    vlSymsp->__Vm_deleter.deleteAll();
    if (VL_UNLIKELY(!vlSymsp->__Vm_didInit)) {
        VL_DEBUG_IF(VL_DBG_MSGF("+ Initial\n"););
        Vnicore___024root___eval_static(&(vlSymsp->TOP));
        Vnicore___024root___eval_initial(&(vlSymsp->TOP));
        Vnicore___024root___eval_settle(&(vlSymsp->TOP));
        vlSymsp->__Vm_didInit = true;
    }
    VL_DEBUG_IF(VL_DBG_MSGF("+ Eval\n"););
    Vnicore___024root___eval(&(vlSymsp->TOP));
    // Evaluate cleanup
    Verilated::endOfEval(vlSymsp->__Vm_evalMsgQp);
}

//============================================================
// Events and timing
bool Vnicore::eventsPending() { return false; }

uint64_t Vnicore::nextTimeSlot() {
    VL_FATAL_MT(__FILE__, __LINE__, "", "No delays in the design");
    return 0;
}

//============================================================
// Utilities

const char* Vnicore::name() const {
    return vlSymsp->name();
}

//============================================================
// Invoke final blocks

void Vnicore___024root___eval_final(Vnicore___024root* vlSelf);

VL_ATTR_COLD void Vnicore::final() {
    contextp()->executingFinal(true);
    Vnicore___024root___eval_final(&(vlSymsp->TOP));
    contextp()->executingFinal(false);
}

//============================================================
// Implementations of abstract methods from VerilatedModel

const char* Vnicore::hierName() const { return vlSymsp->name(); }
const char* Vnicore::modelName() const { return "Vnicore"; }
unsigned Vnicore::threads() const { return 1; }
void Vnicore::prepareClone() const { contextp()->prepareClone(); }
void Vnicore::atClone() const {
    contextp()->threadPoolpOnClone();
}

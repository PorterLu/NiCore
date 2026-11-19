package myCPU

import chisel3._
import chisel3.util._
import chisel3.util.BitPat
import chisel3.stage.ChiselStage
import chisel3.experimental.BundleLiterals._
import cacheArbiter._ 
import cache_single_port._ 
import axi4._ 
import mdu._ 
import Control._ 
import Instructions._ 
import CSR_OP._ 
import CSR._ 
import Alu._

class CacheIO extends Bundle{
	val cpu_request = Output(new CPU_Request)
	val cpu_response = Input(new CPU_Response)
	val flush = Output(Bool())
	val accessType = Output(UInt(2.W))
}

class DCacheArbiter extends Module{
	val io = IO(new Bundle{
		val cpu = Flipped(new CacheIO)
		val ptw = Flipped(new CacheIO)
		val out = new CacheIO
	})

	val selecting_cpu = RegInit(true.B)
	val busy = RegInit(false.B)
	val request_cpu = Mux(busy, selecting_cpu, io.cpu.cpu_request.valid)

	when(!busy) {
		busy := io.cpu.cpu_request.valid || io.ptw.cpu_request.valid
		selecting_cpu := io.cpu.cpu_request.valid || !io.ptw.cpu_request.valid
	}.elsewhen(io.out.cpu_response.ready) {
		busy := false.B
	}

	io.out.cpu_request := Mux(request_cpu, io.cpu.cpu_request, io.ptw.cpu_request)
	io.out.flush := request_cpu && io.cpu.flush
	io.out.accessType := Mux(request_cpu, io.cpu.accessType, io.ptw.accessType)

	io.cpu.cpu_response.data := Mux(selecting_cpu, io.out.cpu_response.data, 0.U)
	io.ptw.cpu_response.data := Mux(selecting_cpu, 0.U, io.out.cpu_response.data)
	when(selecting_cpu) {
		io.cpu.cpu_response.ready := io.out.cpu_response.ready
		io.ptw.cpu_response.ready := false.B
	}.otherwise {
		io.cpu.cpu_response.ready := false.B
		io.ptw.cpu_response.ready := io.out.cpu_response.ready
	}
}

class DatapathIO extends Bundle{
	val pc = Output(UInt(64.W))
	val inst = Output(chiselTypeOf(Instructions.NOP))
	val commit_inst = Output(chiselTypeOf(Instructions.NOP))
	val commit_valid = Output(Bool())   // true when an instruction retires this cycle
	val commit_pc = Output(UInt(64.W))  // PC of the retiring instruction
	val commit_wb_en = Output(Bool())
	val commit_wb_addr = Output(UInt(5.W))
	val commit_wb_data = Output(UInt(64.W))
	val trap_valid = Output(Bool())
	val trap_cause = Output(UInt(64.W))
	val trap_epc = Output(UInt(64.W))
	val trap_tval = Output(UInt(64.W))
	val trap_tval2 = Output(UInt(64.W))
	val trap_tinst = Output(UInt(64.W))
	val store_valid = Output(Bool())
	val store_addr = Output(UInt(64.W))
	val store_data = Output(UInt(64.W))
	val store_mask = Output(UInt(8.W))
	val start = Output(Bool())
	val stall = Output(Bool())
	val icache = new CacheIO
	val dcache = new CacheIO
	val interrupt = Input(Bool())
	val timer_interrupt = Input(Bool())
	val soft_interrupt = Input(Bool())
}

class Datapath extends Module{
	val io = IO(new DatapathIO)
	import AccessType._ 
	
	val fetch_stage = Module(new FetchStage)
	val decode_stage = Module(new DecodeStage)
	val execute_stage = Module(new ExecuteStage)
	val memory_stage = Module(new MemoryStage)
	val writeback_stage = Module(new WritebackStage)
	val dcache_arb = Module(new DCacheArbiter)

	val csr = Module(new CSR)							//csr寄存器文件，同时可以用于特权判断，中断和异常处理
	val satp = csr.io.satp
	val mstatus = csr.io.mstatus
	val sstatus = csr.io.sstatus
	val sum = sstatus(18)
	val mxr = sstatus(19)
	// V: the hart runs a guest (VS or VU mode)
	val virt = csr.io.virt
	// Instruction fetch is translated in S/U mode when satp.MODE == 8, and
	// in a guest when vsatp or hgatp select a mode. The memory stage
	// decides the same for each data access.
	val is_page = Mux(virt, csr.io.vsatp(63, 60) === 8.U || csr.io.hgatp(63, 60) === 8.U,
						!csr.io.mode(1) && (satp(63, 60) === 8.U))

	//必须使得enable信号为false时，对应的流水线寄存器中输出的内容不对CPU状态机的运行产生影响
	val icache_flush_tag = fetch_stage.io.icache_flush_tag
	val dcache_flush_tag = execute_stage.io.dcache_flush_tag
	val started = RegInit(true.B)
	val mul_stall = WireInit(false.B)					//multiplier.io.mul_valid && !mul_result_enable
	val div_stall = WireInit(false.B)					//divider.io.div_valid && !div_result_enable
	val data_cache_tag = WireInit(false.B)
	val data_cache_response_data = WireInit(0.U(64.W))
	val dcache_stall = (execute_stage.io.em_pipe_reg.ld_type.orR || execute_stage.io.em_pipe_reg.st_type.orR || 
						execute_stage.io.em_pipe_reg.inst === FENCE_I) && 
						execute_stage.io.em_pipe_reg.enable && (!data_cache_tag || memory_stage.io.amo_busy) && !(execute_stage.io.em_pipe_reg.is_clint) &&
						!memory_stage.io.em_fault
	val icache_stall = !io.icache.cpu_response.ready && fetch_stage.io.icache.cpu_request.valid
	val itlb_stall = !fetch_stage.io.tlb_ready
	val dtlb_stall = !memory_stage.io.tlb_ready
	// load-use hazard: the instruction in EX needs a register being loaded by
	// the instruction in EM, but the load data isn't available yet
	val load_use_stall = execute_stage.io.src_unready
	val stall = icache_stall || dcache_stall || mul_stall || div_stall || itlb_stall || dtlb_stall || load_use_stall		//stall暂时设置为false
	val pipeline_stall = icache_stall || dcache_stall || mul_stall || div_stall

	val jump_addr = WireInit(0.U(64.W))					//要跳转的地址
	val br_flush = WireInit(false.B)
	val jmp_flush = WireInit(false.B)
	val csr_atomic_flush = WireInit(0.U(4.W))

	//csr的刷新，中间不会插入新的指令，那么取指的时候要把地址设为什么，这个地址默认设为当前指令的下一条指令如何，这个判断会复杂很多
	//如何更新下一条指令，可以直接更新pc
	// sfence.vma retires from MEM: flush the younger (already fetched) instructions,
	// they may have used stale TLB entries, and redirect fetch to sfence+4
	// NOTE: must not depend combinationally on stall, otherwise
	// stall -> sfence_em -> tlb_flush -> iTLB abort -> icache_stall -> stall loops
	val sfence_em = memory_stage.io.em_pipe_reg.inst === SFENCE_VMA && memory_stage.io.em_pipe_reg.enable
	// HFENCE.VVMA and HFENCE.GVMA: the translations of guest addresses
	val hfence_v_em = memory_stage.io.em_pipe_reg.inst === HFENCE_VVMA && memory_stage.io.em_pipe_reg.enable
	val hfence_g_em = memory_stage.io.em_pipe_reg.inst === HFENCE_GVMA && memory_stage.io.em_pipe_reg.enable
	val tlb_fence_em = sfence_em || hfence_v_em || hfence_g_em
	// writing satp, vsatp or hgatp changes the root page table: flush the
	// translations made through it from both TLBs
	val csr_wen = (csr.io.w_op === CSR.W || csr.io.w_op === CSR.RW || csr.io.w_op === CSR.RS || csr.io.w_op === CSR.RC) && csr.io.mw_enable
	val satp_flush = csr_wen && (csr.io.w_addr === CSR_SATP || csr.io.w_addr === CSR_VSATP || csr.io.w_addr === CSR_HGATP)
	val tlb_flush = tlb_fence_em || satp_flush
	// The TLBs hold translations of guest addresses apart from the others.
	// SFENCE.VMA drops those of the mode it is executed in, the HFENCEs
	// and vsatp and hgatp those of guests. A fence with an address in rs1
	// only drops that page; HFENCE.GVMA names a guest physical address,
	// which the entries do not record.
	val tlb_flush_virt = Mux(satp_flush, csr.io.w_addr =/= CSR_SATP, !sfence_em || virt)
	val tlb_flush_page = !satp_flush && !hfence_g_em && memory_stage.io.em_pipe_reg.inst(19, 15) =/= 0.U
	val tlb_flush_va = memory_stage.io.em_pipe_reg.sfence_rs1
	// SFENCE.VMA, FENCE.I and a write to satp change how the instructions
	// behind them are fetched: when such an instruction leaves EM (or MW for
	// the CSR write), everything younger is flushed and fetched again from
	// the instruction after it.
	val fence_i_em = execute_stage.io.em_pipe_reg.inst === FENCE_I && execute_stage.io.em_pipe_reg.enable
	val serialize_em = tlb_fence_em || fence_i_em
	val serial_redirect = RegInit(false.B)
	val serial_redirect_pc = RegInit("h80000000".U(64.W))

	val flush_fd = csr.io.flush_mask(0) || (br_flush || jmp_flush) || csr_atomic_flush(0) || serialize_em || satp_flush || serial_redirect
	val flush_de = csr.io.flush_mask(1)	|| (br_flush || jmp_flush) || csr_atomic_flush(1) || serialize_em || satp_flush || serial_redirect	// && !stall
	val flush_em = csr.io.flush_mask(2)	|| csr_atomic_flush(2) || serialize_em || satp_flush || serial_redirect							// && !stall
	val flush_mw = csr.io.flush_mask(3) || csr_atomic_flush(3)

	val brCond_taken = WireInit(false.B)
	val jmp_occur 	 = WireInit(false.B)
	val csr_atomic 	 = WireInit(false.B)

	io.start := started
	csr.io.int_timer_clear := memory_stage.io.clint_timer_clear
	csr.io.int_soft_clear := memory_stage.io.clint_soft_clear
	csr.io.int_timer := io.timer_interrupt
	csr.io.int_soft  := io.soft_interrupt
	csr.io.extern    := io.interrupt
	io.stall := stall

	csr.io.de_enable := decode_stage.io.de_pipe_reg.enable
	csr.io.de_pipe_reg_pc := decode_stage.io.de_pipe_reg.pc
	 
	//向csr寄存器输入是否阻塞，阻塞的过程中无法处理中断异常，并且无法写入csr寄存器
	csr.io.stall := stall

	//flush信号，由csr得到信息后，进行判断要刷新那些流水寄存器	
	//这里如果发生了阻塞，会导致指令本身直接被刷新，但是如果保证了csr的原子性，那么就不会出现问题，因为不会出现阻塞，但是是否有可能被中断打断
	csr_atomic_flush :=  Mux(memory_stage.io.mw_pipe_reg.enable && (memory_stage.io.mw_pipe_reg.csr_write_op =/= CSR.N), "b1111".U,
								Mux(execute_stage.io.em_pipe_reg.enable && (execute_stage.io.em_pipe_reg.csr_write_op =/= CSR.N), "b0111".U,			//&& (em_pipe_reg.csr_write_op =/= CSR.R)
									Mux(decode_stage.io.de_pipe_reg.enable && (decode_stage.io.de_pipe_reg.csr_write_op =/= CSR.N), "b0011".U,	//&& (de_pipe_reg.csr_write_op =/= CSR.R)
										Mux(fetch_stage.io.fd_pipe_reg.enable && (decode_stage.io.csr_cmd =/= CSR_NOP),  "b0001".U, 0.U)
									)		
								)
							)

	val csr_next_fetch = Mux(memory_stage.io.mw_pipe_reg.enable && memory_stage.io.mw_pipe_reg.csr_write_op =/= CSR.N, memory_stage.io.mw_pipe_reg.pc + 4.U,
								Mux(execute_stage.io.em_pipe_reg.enable && execute_stage.io.em_pipe_reg.csr_write_op =/= CSR.N, execute_stage.io.em_pipe_reg.pc + 4.U,
										Mux(decode_stage.io.de_pipe_reg.enable && decode_stage.io.de_pipe_reg.csr_write_op =/= CSR.N, decode_stage.io.de_pipe_reg.pc + 4.U, fetch_stage.io.fd_pipe_reg.pc + 4.U)
									)
							)

	csr_atomic := csr_atomic_flush.orR

	when(started){
		started := false.B
	}

	when(!stall) {
		serial_redirect := (serialize_em || satp_flush) && !csr.io.trap
		when(serialize_em) {
			serial_redirect_pc := execute_stage.io.em_pipe_reg.pc + 4.U
		}.elsewhen(satp_flush) {
			serial_redirect_pc := memory_stage.io.mw_pipe_reg.pc + 4.U
		}
	}

	fetch_stage.io.started := started
	fetch_stage.io.stall := stall 
	fetch_stage.io.pipeline_stall := pipeline_stall
	fetch_stage.io.tlb_valid := is_page
	fetch_stage.io.tlb_flush := tlb_flush
	fetch_stage.io.tlb_flush_virt := tlb_flush_virt
	fetch_stage.io.tlb_flush_page := tlb_flush_page
	fetch_stage.io.tlb_flush_va := tlb_flush_va
	// a guest is translated by vsatp and with SUM and MXR of vsstatus;
	// sstatus.MXR of the hypervisor applies to both stages
	fetch_stage.io.virt := virt
	fetch_stage.io.sum := Mux(virt, csr.io.vs_sum, sum)
	fetch_stage.io.mxr := Mux(virt, csr.io.vs_mxr || mxr, mxr)
	fetch_stage.io.gmxr := mxr
	fetch_stage.io.mode := csr.io.mode
	fetch_stage.io.satp := Mux(virt, csr.io.vsatp, satp)
	fetch_stage.io.hgatp := csr.io.hgatp
	fetch_stage.io.csr_trap := csr.io.trap
	fetch_stage.io.csr_trapVec := csr.io.trapVec
	fetch_stage.io.csr_next_fetch := csr_next_fetch
	fetch_stage.io.serial_redirect := serial_redirect
	fetch_stage.io.serial_redirect_pc := serial_redirect_pc
	fetch_stage.io.icache.cpu_response.ready := io.icache.cpu_response.ready
	fetch_stage.io.icache.cpu_response.data := io.icache.cpu_response.data
	fetch_stage.io.dcache_flush_tag := execute_stage.io.dcache_flush_tag
	fetch_stage.io.flush_fd := flush_fd
	fetch_stage.io.de_pipe_reg_pc_sel := decode_stage.io.de_pipe_reg.pc_sel
	fetch_stage.io.de_pipe_reg_inst := decode_stage.io.de_pipe_reg.inst
	fetch_stage.io.de_pipe_reg_enable := decode_stage.io.de_pipe_reg.enable
	fetch_stage.io.em_pipe_reg_pc := execute_stage.io.em_pipe_reg.pc 
	fetch_stage.io.flush_em := flush_em
	fetch_stage.io.brCond_taken := execute_stage.io.brCond_taken
	fetch_stage.io.jump_addr := execute_stage.io.jump_addr
	fetch_stage.io.icache <> io.icache
	fetch_stage.io.ptw <> dcache_arb.io.ptw
	fetch_stage.io.csr_atomic := csr_atomic
	csr.io.fd_enable := fetch_stage.io.fd_pipe_reg.enable
	csr.io.fd_pipe_reg_pc := fetch_stage.io.fd_pipe_reg.pc	

	decode_stage.io.flush_de := flush_de
	decode_stage.io.stall := stall
	csr.io.r_op := decode_stage.io.csr_r_op
	csr.io.r_addr := decode_stage.io.csr_r_addr
	decode_stage.io.csr_mode := csr.io.mode
	decode_stage.io.csr_r_data := csr.io.r_data
	csr.io.d_inst := fetch_stage.io.fd_pipe_reg.inst
	csr.io.d_hlsv := decode_stage.io.hlsv
	decode_stage.io.csr_illegal := csr.io.d_illegal
	decode_stage.io.csr_virtual := csr.io.d_virtual
	decode_stage.io.csr_target := csr.io.r_target
	decode_stage.io.regFile_wen := writeback_stage.io.regFile_wen
	decode_stage.io.regFile_waddr := writeback_stage.io.regFile_waddr
	decode_stage.io.regFile_wdata := writeback_stage.io.regFile_wdata
	decode_stage.io.mw_pipe_reg_enable := memory_stage.io.mw_pipe_reg.enable
	decode_stage.io.mw_pipe_reg_dest := memory_stage.io.mw_pipe_reg.dest
	decode_stage.io.mw_pipe_reg_wb_en := memory_stage.io.mw_pipe_reg.wb_en
	decode_stage.io.mw_pipe_reg_alu_out := memory_stage.io.mw_pipe_reg.alu_out
	decode_stage.io.mw_pipe_reg_pc := memory_stage.io.mw_pipe_reg.pc
	decode_stage.io.mw_pipe_reg_csr_read_data := memory_stage.io.mw_pipe_reg.csr_read_data
	decode_stage.io.mw_pipe_reg_load_data := memory_stage.io.mw_pipe_reg.load_data
	decode_stage.io.mw_pipe_reg_wb_sel := memory_stage.io.mw_pipe_reg.wb_sel
	decode_stage.io.fd_pipe_reg <> fetch_stage.io.fd_pipe_reg

	execute_stage.io.de_pipe_reg <> decode_stage.io.de_pipe_reg
	mul_stall := execute_stage.io.mul_stall
	div_stall := execute_stage.io.div_stall
	jump_addr := execute_stage.io.jump_addr
	jmp_flush := execute_stage.io.jmp_flush
	jmp_occur := execute_stage.io.jmp_occur
	br_flush := execute_stage.io.br_flush
	brCond_taken := execute_stage.io.brCond_taken
	execute_stage.io.clint_r_data := memory_stage.io.clint_r_data
	execute_stage.io.amo_forward_data := memory_stage.io.amo_forward_data
	execute_stage.io.data_cache_response_data := memory_stage.io.data_cache_response_data
	execute_stage.io.data_cache_tag := memory_stage.io.data_cache_tag
	execute_stage.io.dcache_cpu_response_ready := io.dcache.cpu_response.ready
	execute_stage.io.stall := stall
	execute_stage.io.flush_em := flush_em
	execute_stage.io.flush_de := flush_de
	execute_stage.io.mw_pipe_reg_enable := memory_stage.io.mw_pipe_reg.enable
	execute_stage.io.mw_pipe_reg_wb_en := memory_stage.io.mw_pipe_reg.wb_en
	execute_stage.io.mw_pipe_reg_dest := memory_stage.io.mw_pipe_reg.dest
	execute_stage.io.mw_pipe_reg_alu_out := memory_stage.io.mw_pipe_reg.alu_out
	execute_stage.io.mw_pipe_reg_pc := memory_stage.io.mw_pipe_reg.pc
	execute_stage.io.mw_pipe_reg_csr_read_data := memory_stage.io.mw_pipe_reg.csr_read_data
	execute_stage.io.mw_pipe_reg_load_data := memory_stage.io.mw_pipe_reg.load_data
	execute_stage.io.mw_pipe_reg_wb_sel := memory_stage.io.mw_pipe_reg.wb_sel
	execute_stage.io.dTLB_ready := memory_stage.io.tlb_ready
	execute_stage.io.em_fault := memory_stage.io.em_fault

	memory_stage.io.stall := stall
	memory_stage.io.pipeline_stall := pipeline_stall
	memory_stage.io.sum := sum
	memory_stage.io.mxr := mxr
	memory_stage.io.vs_sum := csr.io.vs_sum
	memory_stage.io.vs_mxr := csr.io.vs_mxr
	memory_stage.io.mode := csr.io.mode
	memory_stage.io.virt := virt
	memory_stage.io.mprv := csr.io.mprv
	memory_stage.io.mpp := csr.io.mpp
	memory_stage.io.mpv := csr.io.mpv
	memory_stage.io.spvp := csr.io.spvp
	memory_stage.io.satp := satp
	memory_stage.io.vsatp := csr.io.vsatp
	memory_stage.io.hgatp := csr.io.hgatp
	memory_stage.io.flush_mw := flush_mw
	memory_stage.io.flush_em := flush_em
	memory_stage.io.alu_out := execute_stage.io.alu_out
	memory_stage.io.src2_data := execute_stage.io.src2_data
	memory_stage.io.is_clint := execute_stage.io.is_clint
	memory_stage.io.de_pipe_reg_st_type := decode_stage.io.de_pipe_reg.st_type
	memory_stage.io.de_pipe_reg_ld_type := decode_stage.io.de_pipe_reg.ld_type
	memory_stage.io.de_pipe_reg_enable := decode_stage.io.de_pipe_reg.enable
	memory_stage.io.de_pipe_reg_hlsv := decode_stage.io.de_pipe_reg.hlsv
	memory_stage.io.de_pipe_reg_hlvx := decode_stage.io.de_pipe_reg.hlvx
	data_cache_tag := memory_stage.io.data_cache_tag
	data_cache_response_data := memory_stage.io.data_cache_response_data
	memory_stage.io.em_pipe_reg <> execute_stage.io.em_pipe_reg
	memory_stage.io.dcache <> dcache_arb.io.cpu
	io.dcache <> dcache_arb.io.out
	csr.io.inst := memory_stage.io.csr_inst
	csr.io.isSret := memory_stage.io.csr_isSret
	csr.io.isMret := memory_stage.io.csr_isMret
	csr.io.excPC := memory_stage.io.csr_excPC
	csr.io.jump_taken := memory_stage.io.csr_jump_taken
	csr.io.jump_addr := memory_stage.io.alu_out
	csr.io.alu_out := memory_stage.io.csr_alu_out
	csr.io.is_illegal := memory_stage.io.csr_is_illegal
	csr.io.is_virtual := memory_stage.io.csr_is_virtual
	csr.io.inst_misalign := memory_stage.io.csr_inst_misalign
	csr.io.store_misalign := memory_stage.io.csr_store_misalign
	csr.io.load_misalign := memory_stage.io.csr_load_misalign
	csr.io.em_enable := memory_stage.io.em_enable
	csr.io.iTLB_fault := memory_stage.io.iTLB_fault
	csr.io.iTLB_guest := memory_stage.io.iTLB_guest
	csr.io.iTLB_gpa := memory_stage.io.iTLB_gpa
	csr.io.iTLB_pte := memory_stage.io.iTLB_pte
	csr.io.dTLB_fault := memory_stage.io.dTLB_fault
	csr.io.dTLB_guest := memory_stage.io.dTLB_guest
	csr.io.dTLB_gpa := memory_stage.io.dTLB_gpa
	csr.io.dTLB_pte := memory_stage.io.dTLB_pte
	csr.io.data_virt := memory_stage.io.data_virt
	memory_stage.io.dcache_flush_tag := dcache_flush_tag
	memory_stage.io.tlb_flush := tlb_flush
	memory_stage.io.tlb_flush_virt := tlb_flush_virt
	memory_stage.io.tlb_flush_page := tlb_flush_page
	memory_stage.io.tlb_flush_va := tlb_flush_va

	writeback_stage.io.mw_pipe_reg <> memory_stage.io.mw_pipe_reg
	writeback_stage.io.stall := stall
	csr.io.mw_enable := writeback_stage.io.mw_enable
	csr.io.retired := writeback_stage.io.retired
	csr.io.w_op := writeback_stage.io.csr_w_op
	csr.io.w_addr := writeback_stage.io.csr_w_addr
	csr.io.w_data := writeback_stage.io.csr_w_data

	io.pc := memory_stage.io.mw_pipe_reg.pc
	io.inst := execute_stage.io.em_pipe_reg.inst
	io.commit_inst := memory_stage.io.mw_pipe_reg.inst
	// commit_fire: true for exactly one cycle per retired instruction
	// (not during stalls when MW holds the same instruction)
	val commit_fire = Wire(Bool())
	commit_fire := memory_stage.io.mw_pipe_reg.enable && !io.stall
	io.commit_valid := commit_fire
	io.commit_pc := memory_stage.io.mw_pipe_reg.pc
	io.commit_wb_en := writeback_stage.io.regFile_wen
	io.commit_wb_addr := writeback_stage.io.regFile_waddr
	io.commit_wb_data := writeback_stage.io.regFile_wdata
	io.trap_valid := csr.io.trap_valid
	io.trap_cause := csr.io.trap_cause
	io.trap_epc := csr.io.trap_epc
	io.trap_tval := csr.io.trap_tval
	io.trap_tval2 := csr.io.trap_tval2
	io.trap_tinst := csr.io.trap_tinst
	io.store_valid := memory_stage.io.store_valid
	io.store_addr := memory_stage.io.store_addr
	io.store_data := memory_stage.io.store_data
	io.store_mask := memory_stage.io.store_mask
}

class S011HD1P_X32Y2D128_BW extends BlackBox{
	val io = IO(new Bundle{
		val CLK = Input(Clock())
		val CEN = Input(Bool())
		val WEN = Input(Bool())
		val BWEN = Input(UInt(128.W))
		val A 	= Input(UInt(6.W))
		val D 	= Input(UInt(128.W))
		val Q 	= Output(UInt(128.W))
	})
}

class myCPU extends Module{
	val io = IO(new Bundle{
		val pc_debug = Output(UInt(64.W))
		val inst = Output(UInt(32.W))
		val commit_inst = Output(UInt(32.W))
		val commit_valid = Output(Bool())
		val commit_pc = Output(UInt(64.W))
		val commit_wb_en = Output(Bool())
		val commit_wb_addr = Output(UInt(5.W))
		val commit_wb_data = Output(UInt(64.W))
		val trap_valid = Output(Bool())
		val trap_cause = Output(UInt(64.W))
		val trap_epc = Output(UInt(64.W))
		val trap_tval = Output(UInt(64.W))
		val trap_tval2 = Output(UInt(64.W))
		val trap_tinst = Output(UInt(64.W))
		val store_valid = Output(Bool())
		val store_addr = Output(UInt(64.W))
		val store_data = Output(UInt(64.W))
		val store_mask = Output(UInt(8.W))
		val start = Output(Bool())
		val stall = Output(Bool())

		val interrupt = Input(Bool())
		val timer_interrupt = Input(Bool())
		val soft_interrupt = Input(Bool())

		//write address channel
		val master_awready = Input(Bool())
		val master_awvalid = Output(Bool())
		val master_awaddr = Output(UInt(32.W))
		val master_awid = Output(UInt(4.W))
		val master_awlen = Output(UInt(8.W))
		val master_awsize = Output(UInt(3.W))
		val master_awburst = Output(UInt(2.W))

		//write data channel
		val master_wready = Input(Bool())
		val master_wvalid = Output(Bool())
		val master_wdata = Output(UInt(64.W))
		val master_wstrb = Output(UInt(8.W))
		val master_wlast = Output(Bool())

		//write response
		val master_bready = Output(Bool())
		val master_bvalid = Input(Bool())
		val master_bresp = Input(UInt(2.W))
		val master_bid = Input(UInt(4.W))

		//read address channel
		val master_arready = Input(Bool())
		val master_arvalid = Output(Bool())
		val master_araddr = Output(UInt(32.W))
		val master_arid = Output(UInt(4.W))
		val master_arlen = Output(UInt(8.W))
		val master_arsize = Output(UInt(3.W))
		val master_arburst = Output(UInt(2.W))

		//read data channel
		val master_rready = Output(Bool())
		val master_rvalid = Input(Bool())
		val master_rresp = Input(UInt(2.W))
		val master_rdata = Input(UInt(64.W))
		val master_rlast = Input(Bool())
		val master_rid = Input(UInt(4.W))

		//slave signals
		//aw channel
		val slave_awready = Output(Bool())
		val slave_awvalid = Input(Bool())
		val slave_awaddr  = Input(UInt(32.W))
		val slave_awid 	  = Input(UInt(4.W))
		val slave_awlen   = Input(UInt(8.W))
		val slave_awsize  = Input(UInt(3.W))
		val slave_awburst = Input(UInt(2.W))

		//w channel
		val slave_wready  = Output(Bool())
		val slave_wvalid  = Input(Bool())
		val slave_wdata   = Input(UInt(64.W))
		val slave_wstrb   = Input(UInt(8.W))
		val slave_wlast   = Input(Bool())

		//write response channel
		val slave_bready  = Input(Bool())
		val slave_bvalid  = Output(Bool())
		val slave_bresp   = Output(UInt(2.W))
		val slave_bid 	  = Output(UInt(4.W))
		
		//ar channel
		val slave_arready = Output(Bool())
		val slave_arvalid = Input(Bool())
		val slave_araddr  = Input(UInt(32.W))
		val slave_arid    = Input(UInt(4.W))
		val slave_arlen   = Input(UInt(8.W))
		val slave_arsize  = Input(UInt(3.W))
		val slave_arburst = Input(UInt(2.W))

		//r channel
		val slave_rready  = Input(Bool())
		val slave_rvalid  = Output(Bool())
		val slave_rresp   = Output(UInt(2.W))
		val slave_rdata   = Output(UInt(64.W))
		val slave_rlast   = Output(Bool())
		val slave_rid     = Output(UInt(4.W))

		//sram接口
		/*val sram0_addr 	  = Output(UInt(6.W))
		val sram0_cen 	  = Output(Bool())
		val sram0_wen 	  = Output(Bool())
		val sram0_wmask   = Output(UInt(128.W))
		val sram0_wdata   = Output(UInt(128.W))
		
		val sram1_addr 	  = Output(UInt(6.W))
		val sram1_cen 	  = Output(Bool())
		val sram1_wen 	  = Output(Bool())
		val sram1_wmask   = Output(UInt(128.W))
		val sram1_wdata   = Output(UInt(128.W))

		val sram2_addr 	  = Output(UInt(6.W))
		val sram2_cen 	  = Output(Bool())
		val sram2_wen 	  = Output(Bool())
		val sram2_wmask   = Output(UInt(128.W))
		val sram2_wdata   = Output(UInt(128.W))

		val sram3_addr 	  = Output(UInt(6.W))
		val sram3_cen 	  = Output(Bool())
		val sram3_wen 	  = Output(Bool())
		val sram3_wmask   = Output(UInt(128.W))
		val sram3_wdata   = Output(UInt(128.W))

		val sram4_addr 	  = Output(UInt(6.W))
		val sram4_cen 	  = Output(Bool())
		val sram4_wen 	  = Output(Bool())
		val sram4_wmask   = Output(UInt(128.W))
		val sram4_wdata   = Output(UInt(128.W))

		val sram5_addr 	  = Output(UInt(6.W))
		val sram5_cen 	  = Output(Bool())
		val sram5_wen 	  = Output(Bool())
		val sram5_wmask   = Output(UInt(128.W))
		val sram5_wdata   = Output(UInt(128.W))

		val sram6_addr 	  = Output(UInt(6.W))
		val sram6_cen 	  = Output(Bool())
		val sram6_wen 	  = Output(Bool())
		val sram6_wmask   = Output(UInt(128.W))
		val sram6_wdata   = Output(UInt(128.W))

		val sram7_addr 	  = Output(UInt(6.W))
		val sram7_cen 	  = Output(Bool())
		val sram7_wen 	  = Output(Bool())
		val sram7_wmask   = Output(UInt(128.W))
		val sram7_wdata   = Output(UInt(128.W))*/
	})

	val datapath = Module(new Datapath) 
	val icache = Module(new Cache("inst_cache"))
	val dcache = Module(new Cache("data_cache"))
	val arb = Module(new CacheArbiter) 

	val sram0 = Module(new S011HD1P_X32Y2D128_BW)
	val sram1 = Module(new S011HD1P_X32Y2D128_BW)
	val sram2 = Module(new S011HD1P_X32Y2D128_BW)
	val sram3 = Module(new S011HD1P_X32Y2D128_BW)
	val sram4 = Module(new S011HD1P_X32Y2D128_BW)
	val sram5 = Module(new S011HD1P_X32Y2D128_BW)
	val sram6 = Module(new S011HD1P_X32Y2D128_BW)
	val sram7 = Module(new S011HD1P_X32Y2D128_BW)

	datapath.io.icache.cpu_request <> icache.io.cpu_request
	datapath.io.dcache.cpu_request <> dcache.io.cpu_request
	datapath.io.icache.cpu_response <> icache.io.cpu_response
	datapath.io.dcache.cpu_response <> dcache.io.cpu_response
	datapath.io.interrupt := io.interrupt
	datapath.io.timer_interrupt := io.timer_interrupt
	datapath.io.soft_interrupt := io.soft_interrupt
	icache.io.flush	:= datapath.io.icache.flush
	dcache.io.flush	:= datapath.io.dcache.flush
	icache.io.accessType := datapath.io.icache.accessType
	dcache.io.accessType := datapath.io.dcache.accessType
	icache.io.mem_io <> arb.io.icache
	dcache.io.mem_io <> arb.io.dcache

	sram0.io.A := icache.io.sram0_addr
	sram0.io.CEN := icache.io.sram0_cen
	sram0.io.WEN := icache.io.sram0_wen
	sram0.io.BWEN := icache.io.sram0_wmask
	sram0.io.D 	  := icache.io.sram0_wdata
	icache.io.sram0_rdata := sram0.io.Q
	sram0.io.CLK := clock 

	sram1.io.A := icache.io.sram1_addr
	sram1.io.CEN := icache.io.sram1_cen
	sram1.io.WEN := icache.io.sram1_wen
	sram1.io.BWEN := icache.io.sram1_wmask
	sram1.io.D 	  := icache.io.sram1_wdata
	icache.io.sram1_rdata := sram1.io.Q
	sram1.io.CLK := clock 

	sram2.io.A := icache.io.sram2_addr
	sram2.io.CEN := icache.io.sram2_cen
	sram2.io.WEN := icache.io.sram2_wen
	sram2.io.BWEN := icache.io.sram2_wmask
	sram2.io.D 	  := icache.io.sram2_wdata
	icache.io.sram2_rdata := sram2.io.Q
	sram2.io.CLK := clock 

	sram3.io.A := icache.io.sram3_addr
	sram3.io.CEN := icache.io.sram3_cen
	sram3.io.WEN := icache.io.sram3_wen
	sram3.io.BWEN := icache.io.sram3_wmask
	sram3.io.D 	  := icache.io.sram3_wdata
	icache.io.sram3_rdata := sram3.io.Q
	sram3.io.CLK := clock

	sram4.io.A := dcache.io.sram0_addr
	sram4.io.CEN := dcache.io.sram0_cen
	sram4.io.WEN := dcache.io.sram0_wen
	sram4.io.BWEN := dcache.io.sram0_wmask
	sram4.io.D 	  := dcache.io.sram0_wdata
	dcache.io.sram0_rdata := sram4.io.Q
	sram4.io.CLK := clock 

	sram5.io.A := dcache.io.sram1_addr
	sram5.io.CEN := dcache.io.sram1_cen
	sram5.io.WEN := dcache.io.sram1_wen
	sram5.io.BWEN := dcache.io.sram1_wmask
	sram5.io.D 	  := dcache.io.sram1_wdata
	dcache.io.sram1_rdata := sram5.io.Q
	sram5.io.CLK := clock 

	sram6.io.A := dcache.io.sram2_addr
	sram6.io.CEN := dcache.io.sram2_cen
	sram6.io.WEN := dcache.io.sram2_wen
	sram6.io.BWEN := dcache.io.sram2_wmask
	sram6.io.D 	  := dcache.io.sram2_wdata
	dcache.io.sram2_rdata := sram6.io.Q
	sram6.io.CLK := clock

	sram7.io.A := dcache.io.sram3_addr
	sram7.io.CEN := dcache.io.sram3_cen
	sram7.io.WEN := dcache.io.sram3_wen
	sram7.io.BWEN := dcache.io.sram3_wmask
	sram7.io.D 	  := dcache.io.sram3_wdata
	dcache.io.sram3_rdata := sram7.io.Q
	sram7.io.CLK := clock 

	arb.io.axi_out.aw.ready := io.master_awready
	io.master_awvalid := arb.io.axi_out.aw.valid
	io.master_awaddr := arb.io.axi_out.aw.bits.addr
	io.master_awid := arb.io.axi_out.aw.bits.id
	io.master_awlen := arb.io.axi_out.aw.bits.len
	io.master_awsize := arb.io.axi_out.aw.bits.size
	io.master_awburst := arb.io.axi_out.aw.bits.burst

	arb.io.axi_out.w.ready := io.master_wready
	io.master_wvalid := arb.io.axi_out.w.valid
	io.master_wdata := arb.io.axi_out.w.bits.data
	io.master_wstrb := arb.io.axi_out.w.bits.strb
	io.master_wlast := arb.io.axi_out.w.bits.last

	io.master_bready := arb.io.axi_out.b.ready
	arb.io.axi_out.b.valid := io.master_bvalid
	arb.io.axi_out.b.bits.resp := io.master_bresp
	arb.io.axi_out.b.bits.id := io.master_bid

	arb.io.axi_out.ar.ready := io.master_arready
	io.master_arvalid := arb.io.axi_out.ar.valid
	io.master_araddr := arb.io.axi_out.ar.bits.addr
	io.master_arid := arb.io.axi_out.ar.bits.id
	io.master_arlen := arb.io.axi_out.ar.bits.len
	io.master_arsize := arb.io.axi_out.ar.bits.size
	io.master_arburst := arb.io.axi_out.ar.bits.burst

	io.master_rready := arb.io.axi_out.r.ready
	arb.io.axi_out.r.valid := io.master_rvalid
	arb.io.axi_out.r.bits.resp := io.master_rresp
	arb.io.axi_out.r.bits.data := io.master_rdata
	arb.io.axi_out.r.bits.last := io.master_rlast
	arb.io.axi_out.r.bits.id := io.master_rid 

	io.inst := datapath.io.inst
	io.commit_inst := datapath.io.commit_inst
	io.commit_valid := datapath.io.commit_valid
	io.commit_pc := datapath.io.commit_pc
	io.commit_wb_en := datapath.io.commit_wb_en
	io.commit_wb_addr := datapath.io.commit_wb_addr
	io.commit_wb_data := datapath.io.commit_wb_data
	io.trap_valid := datapath.io.trap_valid
	io.trap_cause := datapath.io.trap_cause
	io.trap_epc := datapath.io.trap_epc
	io.trap_tval := datapath.io.trap_tval
	io.trap_tval2 := datapath.io.trap_tval2
	io.trap_tinst := datapath.io.trap_tinst
	io.store_valid := datapath.io.store_valid
	io.store_addr := datapath.io.store_addr
	io.store_data := datapath.io.store_data
	io.store_mask := datapath.io.store_mask
	io.pc_debug := datapath.io.pc
	io.start := datapath.io.start
	io.stall := datapath.io.stall

	//slave signals suspension
	io.slave_awready := false.B 
	io.slave_wready  := false.B 
	io.slave_bvalid  := false.B 
	io.slave_bresp   := 0.U 
	io.slave_bid     := 0.U 
	io.slave_arready := false.B
	io.slave_rvalid  := false.B 
	io.slave_rresp   := 0.U 
	io.slave_rdata   := 0.U 
	io.slave_rlast   := false.B 
	io.slave_rid     := 0.U
}

object Driver extends App{
    
	//(new ChiselStage).emitVerilog(new myCPU, args)
	(new chisel3.stage.ChiselStage).execute(args, Seq(
		chisel3.stage.ChiselGeneratorAnnotation(() => new myCPU()),
		firrtl.stage.RunFirrtlTransformAnnotation(new AddModulePrefix()),
		ModulePrefixAnnotation("nicore_")
	))
}

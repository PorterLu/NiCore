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

class DatapathIO extends Bundle{
	val pc = Output(UInt(64.W))
	val inst = Output(chiselTypeOf(Instructions.NOP))
	val commit_inst = Output(chiselTypeOf(Instructions.NOP))
	val start = Output(Bool())
	val stall = Output(Bool())
	val icache = new CacheIO
	val dcache = new CacheIO
	val interrupt = Input(Bool())
}

class Datapath extends Module{
	val io = IO(new DatapathIO)
	import AccessType._ 
	
	val fetch_stage = Module(new FetchStage)
	val decode_stage = Module(new DecodeStage)
	val execute_stage = Module(new ExecuteStage)
	val memory_stage = Module(new MemoryStage)
	val writeback_stage = Module(new WritebackStage)

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
						execute_stage.io.em_pipe_reg.enable && !data_cache_tag && !(execute_stage.io.em_pipe_reg.is_clint) 
	val icache_stall = !io.icache.cpu_response.ready
	val stall = icache_stall || dcache_stall || mul_stall || div_stall						//stall暂时设置为false

	val csr = Module(new CSR)							//csr寄存器文件，同时可以用于特权判断，中断和异常处理
	val jump_addr = WireInit(0.U(64.W))					//要跳转的地址
	val clint  = Module(new clint())
	val br_flush = WireInit(false.B)
	val jmp_flush = WireInit(false.B)
	val csr_atomic_flush = WireInit(0.U(4.W))

	//csr的刷新，中间不会插入新的指令，那么取指的时候要把地址设为什么，这个地址默认设为当前指令的下一条指令如何，这个判断会复杂很多
	//如何更新下一条指令，可以直接更新pc
	val flush_fd = csr.io.flush_mask(0) || (br_flush || jmp_flush) || csr_atomic_flush(0) || icache_flush_tag || dcache_flush_tag
	val flush_de = csr.io.flush_mask(1)	|| (br_flush || jmp_flush) || csr_atomic_flush(1) || icache_flush_tag || dcache_flush_tag	// && !stall
	val flush_em = csr.io.flush_mask(2)	|| csr_atomic_flush(2) || (icache_flush_tag || dcache_flush_tag)							// && !stall
	val flush_mw = csr.io.flush_mask(3) || csr_atomic_flush(3)

	val brCond_taken = WireInit(false.B)
	val jmp_occur 	 = WireInit(false.B)
	val csr_atomic 	 = WireInit(false.B)

	io.start := started
	csr.io.int_timer_clear := clint.io.timer_clear
	csr.io.int_soft_clear := clint.io.soft_clear
	csr.io.int_timer := clint.io.timer_valid
	csr.io.int_soft  := clint.io.soft_valid
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

	fetch_stage.io.started := started
	fetch_stage.io.stall := stall 
	fetch_stage.io.csr_trap := csr.io.trap
	fetch_stage.io.csr_trapVec := csr.io.trapVec
	fetch_stage.io.csr_next_fetch := csr_next_fetch
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

	decode_stage.io.flush_de := flush_de
	decode_stage.io.stall := stall
	csr.io.r_op := decode_stage.io.csr_r_op
	decode_stage.io.csr_r_data := csr.io.r_data
	decode_stage.io.csr_accessType_illegal := csr.io.accessType_illegal
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

	memory_stage.io.stall := stall
	memory_stage.io.flush_mw := flush_mw
	memory_stage.io.flush_em := flush_em
	memory_stage.io.alu_out := execute_stage.io.alu_out
	memory_stage.io.src2_data := execute_stage.io.src2_data
	data_cache_tag := memory_stage.io.data_cache_tag
	data_cache_response_data := memory_stage.io.data_cache_response_data
	memory_stage.io.em_pipe_reg <> execute_stage.io.em_pipe_reg
	io.dcache <> memory_stage.io.dcache
	csr.io.inst := memory_stage.io.csr_inst
	csr.io.isSret := memory_stage.io.csr_isSret
	csr.io.isMret := memory_stage.io.csr_isMret
	csr.io.excPC := memory_stage.io.csr_excPC
	csr.io.jump_taken := memory_stage.io.csr_jump_taken
	csr.io.jump_addr := memory_stage.io.alu_out
	csr.io.is_illegal := memory_stage.io.csr_is_illegal
	csr.io.inst_misalign := memory_stage.io.csr_inst_misalign
	csr.io.store_misalign := memory_stage.io.csr_store_misalign
	csr.io.load_misalign := memory_stage.io.csr_load_misalign
	csr.io.em_enable := memory_stage.io.em_enable
	memory_stage.io.dcache_flush_tag := dcache_flush_tag

	writeback_stage.io.mw_pipe_reg <> memory_stage.io.mw_pipe_reg
	csr.io.mw_enable := writeback_stage.io.mw_enable
	csr.io.retired := writeback_stage.io.retired
	csr.io.w_op := writeback_stage.io.csr_w_op
	csr.io.w_addr := writeback_stage.io.csr_w_addr
	csr.io.w_data := writeback_stage.io.csr_w_data

	io.pc := memory_stage.io.mw_pipe_reg.pc
	io.inst := execute_stage.io.em_pipe_reg.inst
	io.commit_inst := memory_stage.io.mw_pipe_reg.inst
}

class myCPU extends Module{
	val io = IO(new Bundle{
		val pc_debug = Output(UInt(64.W))
		val inst = Output(UInt(32.W))
		val commit_inst = Output(UInt(32.W))
		val start = Output(Bool())
		val stall = Output(Bool())
		
		val interrupt = Input(Bool())

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
	datapath.io.icache.cpu_request <> icache.io.cpu_request
	datapath.io.dcache.cpu_request <> dcache.io.cpu_request
	datapath.io.icache.cpu_response <> icache.io.cpu_response
	datapath.io.dcache.cpu_response <> dcache.io.cpu_response
	datapath.io.interrupt := io.interrupt
	icache.io.flush	:= datapath.io.icache.flush
	dcache.io.flush	:= datapath.io.dcache.flush
	icache.io.accessType := datapath.io.icache.accessType
	dcache.io.accessType := datapath.io.dcache.accessType
	icache.io.mem_io <> arb.io.icache
	dcache.io.mem_io <> arb.io.dcache
	
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
		ModulePrefixAnnotation("ysyx_22041812_")
	))
}

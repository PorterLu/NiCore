package myCPU

import chisel3._ 
import chisel3.util._ 
import cache_single_port._ 
import Instructions._ 
import Control._ 
import AccessType._ 
import chisel3.experimental.BundleLiterals._

class FetchStage extends Module{
	val io = IO(new Bundle{
		val started = Input(Bool())
		val stall = Input(Bool())
		val pipeline_stall = Input(Bool())
		
		val csr_trap = Input(Bool())
		val csr_trapVec = Input(UInt(64.W))
		val csr_atomic = Input(Bool())
		val csr_next_fetch = Input(UInt(64.W))
		val serial_redirect = Input(Bool())
		val serial_redirect_pc = Input(UInt(64.W))

		val dcache_flush_tag = Input(Bool())

		val flush_fd = Input(Bool())

		val de_pipe_reg_pc_sel = Input(UInt(2.W))
		val de_pipe_reg_inst = Input(UInt(32.W))
		val de_pipe_reg_enable = Input(Bool())

		val em_pipe_reg_pc = Input(UInt(64.W))
		val flush_em = Input(Bool())

		val brCond_taken = Input(Bool())
		val jump_addr = Input(UInt(64.W))
		
		val icache = new CacheIO
		val ptw = new CacheIO
		val fd_pipe_reg = Output(new fetch_decode_pipeline_reg)
		val icache_flush_tag = Output(Bool())

		val sfence_rs1 = Input(UInt(64.W))
		val sfence_rs2 = Input(UInt(64.W))
		val tlb_valid = Input(Bool())
		val tlb_ready = Output(Bool())
		val tlb_flush = Input(Bool())
		//val tlb_data = Output(UInt(64.W))
		val sum 	= Input(Bool())
		val mxr 	= Input(Bool())
		val mode 	= Input(UInt(2.W))
		val satp 	= Input(UInt(64.W))
		//val tlb_fault = Output(UInt(2.W))
	})

	val fd_pipe_reg = RegInit(
		(new fetch_decode_pipeline_reg).Lit(
			_.inst -> Instructions.NOP,
			_.pc -> "h80000000".U,
			_.iTLB_fault -> 0.U,
			_.enable -> false.B,
		)
	)

	val icache_flush_tag = RegInit(false.B)

	val pc = RegInit("h80000000".U(64.W) - 4.U)
	// any redirect must take priority over holding pc, so that pc follows the
	// new control flow even while a fetch/translation is still in flight.
	// Redirect sources persist while the pipeline is stalled, and their flush
	// (flush_fd) suppresses capturing the stale in-flight fetch result. No
	// combinational abort of the iTLB is needed (and one would create a loop:
	// stall -> dTLB.wen -> clint -> load forwarding -> brCond -> abort ->
	// icache_stall -> stall).
	val next_pc = MuxCase(
		pc + 4.U,
		IndexedSeq(
			(io.csr_trap) -> io.csr_trapVec,
			io.serial_redirect -> io.serial_redirect_pc,
			// NOTE: the dcache/icache flush tag redirect is removed: when the
			// stall drops before the tag clears, it would redirect pc BACK to
			// em_pc+4 and re-execute already committed instructions
			(((io.de_pipe_reg_pc_sel === PC_ALU) && io.de_pipe_reg_enable) || io.brCond_taken) -> (io.jump_addr >> 1.U << 1.U),
			io.csr_atomic -> io.csr_next_fetch,
			io.tlb_flush -> (io.em_pipe_reg_pc + 4.U),
			(!io.started && io.stall) -> pc
		)
	)

	//printf(p"next_pc_state: ${!io.started && io.stall} ${(io.csr_trap)} ${(((io.de_pipe_reg_pc_sel === PC_ALU) && io.de_pipe_reg_enable) || io.brCond_taken)} ${io.csr_atomic}\n")
	//printf(p"next_pc:${Hexadecimal(next_pc)}\n")

	val iTLB = Module(new TLB("iTLB"))
	iTLB.io.tlb_flush_vpn   := io.sfence_rs1(38, 12)
	iTLB.io.tlb_flush_asid  := io.sfence_rs2
	iTLB.io.flush := io.tlb_flush
	iTLB.io.stall := io.pipeline_stall
	iTLB.io.valid := io.tlb_valid
	iTLB.io.priv := io.mode
	iTLB.io.mprv := false.B 	//没有启用这个特性
	iTLB.io.sum := io.sum
	iTLB.io.mxr := io.mxr
	iTLB.io.wen := false.B 
	iTLB.io.rw := false.B
	iTLB.io.satp := io.satp
	iTLB.io.va := next_pc
	iTLB.io.mask := 0.U 
	iTLB.io.cache_response.data := Mux(iTLB.io.fetch_request.valid,
		io.icache.cpu_response.data, io.ptw.cpu_response.data)
	iTLB.io.cache_response.ready := Mux(iTLB.io.fetch_request.valid,
		io.icache.cpu_response.ready, io.ptw.cpu_response.ready)
	//io.tlb_fault := iTLB.io.

	//io.tlb_ready := iTLB.io.tlb_ready
	//io.tlb_data  := iTLB.io.r_data
	when(!io.tlb_valid){
		io.tlb_ready := true.B
	}.otherwise{
		io.tlb_ready := iTLB.io.tlb_ready
	}

	//val inst = Mux(io.tlb_valid, Mux(pc(2).asBool, iTLB.io.cache_response.data(63, 32), iTLB.io.cache_response.data(31, 0)),
	//				Mux(io.started, Instructions.NOP, Mux(pc(2).asBool, io.icache.cpu_response.data(63, 32), io.icache.cpu_response.data(31, 0))))
	val inst = Mux(io.started, Instructions.NOP, Mux(pc(2).asBool, io.icache.cpu_response.data(63, 32), io.icache.cpu_response.data(31, 0)))

	pc := next_pc

	when(!io.stall && io.flush_em){
		icache_flush_tag := false.B
	}.elsewhen(io.de_pipe_reg_inst === FENCE_I && !io.stall){
		icache_flush_tag := true.B
	}.otherwise{
		when(io.icache.cpu_response.ready){
			icache_flush_tag := false.B
		}
	}

	io.icache_flush_tag := icache_flush_tag

	io.icache.accessType := word.asUInt
	io.icache.flush := icache_flush_tag
	// The cache takes the address of a request from its input in every cycle
	// of the request, so the address must not change before the response.
	// next_pc does change during a request: a jump in execute that waits
	// for its operand (a load in the memory stage) first redirects to a
	// stale target and then to the loaded one. Hold the address of the
	// request in flight; the redirect is still pending when the response
	// comes, which drops the instruction fetched and starts again.
	val fetch_pending = RegInit(false.B)
	val fetch_addr = RegInit(0.U(64.W))
	val direct_addr = Mux(fetch_pending, fetch_addr, next_pc)
	io.icache.cpu_request.addr := Mux(io.tlb_valid, iTLB.io.fetch_request.addr, direct_addr)
	io.icache.cpu_request.valid := Mux(io.tlb_valid, iTLB.io.fetch_request.valid, true.B) && !io.dcache_flush_tag
	when(io.icache.cpu_response.ready || !io.icache.cpu_request.valid){
		fetch_pending := false.B
	}.elsewhen(!fetch_pending){
		fetch_pending := true.B
		fetch_addr := next_pc
	}
	io.icache.cpu_request.data := 0.U 
	io.icache.cpu_request.rw := false.B 
	io.icache.cpu_request.mask := 0.U

	io.ptw.accessType := double.asUInt
	io.ptw.flush := false.B
	io.ptw.cpu_request.addr := iTLB.io.tlb_request.addr
	io.ptw.cpu_request.valid := io.tlb_valid && iTLB.io.tlb_request.valid &&
								!iTLB.io.fetch_request.valid
	io.ptw.cpu_request.data := 0.U
	io.ptw.cpu_request.rw := false.B
	io.ptw.cpu_request.mask := 0.U

	when(io.flush_fd && !io.stall){
		fd_pipe_reg.pc := "h80000000".U
		fd_pipe_reg.inst := Instructions.NOP
		fd_pipe_reg.iTLB_fault := 0.U
		fd_pipe_reg.enable := false.B 
	}.elsewhen(!io.stall && !io.flush_fd){
		fd_pipe_reg.pc := pc 
		fd_pipe_reg.inst := inst 
		fd_pipe_reg.iTLB_fault := iTLB.io.fault
		fd_pipe_reg.enable := true.B
	}

	io.icache_flush_tag := icache_flush_tag
	io.fd_pipe_reg := fd_pipe_reg
}

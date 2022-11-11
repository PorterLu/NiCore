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
		
		val csr_trap = Input(Bool())
		val csr_trapVec = Input(UInt(64.W))
		val csr_atomic = Input(Bool())
		val csr_next_fetch = Input(UInt(64.W))

		val icache_response_ready = Input(Bool())
		val icache_response_data = Input(UInt(64.W))
		val dcache_flush_tag = Input(Bool())

		val flush_fd = Input(Bool())

		val de_pipe_reg_pc_sel = Input(UInt(2.W))
		val de_pipe_reg_inst = Input(UInt(32.W))
		val de_pipe_reg_enable = Input(Bool())

		val em_pipe_reg_pc = Input(UInt(64.W))
		val flush_em = Input(Bool())

		val brCond_taken = Input(Bool())
		val jump_addr = Input(UInt(64.W))
		
		val icache = Flipped(new CacheIO)
		val fd_pipe_reg = Output(new fetch_decode_pipeline_reg)
		val icache_flush_tag = Output(Bool())
	})

	val fd_pipe_reg = RegInit(
		(new fetch_decode_pipeline_reg).Lit(
			_.inst -> Instructions.NOP,
			_.pc -> "80000000".U,
			_.enable -> false.B,
		)
	)

	val icache_flush_tag = RegInit(false.B)
	val pc = RegInit("h80000000".U(64.W) - 4.U)
	val next_pc = MuxCase(
		pc + 4.U,
		IndexedSeq(
			(!io.started && io.stall) -> pc,
			(io.csr_trap) -> io.csr_trapVec,
			(icache_flush_tag || io.dcache_flush_tag) -> (io.em_pipe_reg_pc + 4.U),
			(((io.de_pipe_reg_pc_sel === PC_ALU) && io.de_pipe_reg_enable) || io.brCond_taken) -> (io.jump_addr >> 1.U << 1.U),
			io.csr_atomic -> io.csr_next_fetch
		)
	)
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
	io.icache.cpu_request.addr := next_pc
	io.icache.cpu_request.valid := true.B 
	io.icache.cpu_request.data := 0.U 
	io.icache.cpu_request.rw := false.B 
	io.icache.cpu_request.mask := 0.U

	when(io.flush_fd && !io.stall){
		fd_pipe_reg.pc := "h80000000".U
		fd_pipe_reg.inst := Instructions.NOP
		fd_pipe_reg.enable := false.B 
	}.elsewhen(!io.stall && !io.flush_fd){
		fd_pipe_reg.pc := pc 
		fd_pipe_reg.inst := inst 
		fd_pipe_reg.enable := true.B
	}

	io.icache_flush_tag := icache_flush_tag
	io.fd_pipe_reg := fd_pipe_reg
}
package  myCPU

import chisel3._ 
import chisel3.util._ 
import cache_single_port._
import chisel3.experimental.BundleLiterals._
import Control._
import Alu._

import AccessType._ 
class MemoryStage extends Module{
	val io = IO(new Bundle{
		val stall = Input(Bool())
		val flush_mw = Input(Bool())
		val flush_em = Input(Bool())
		val data_cache_tag = Output(Bool())
		val data_cache_response_data = Output(UInt(64.W))
		val dcache = new CacheIO
		val em_pipe_reg = Input(new execute_mem_pipeline_reg)
		val mw_pipe_reg = Output(new mem_writeback_pipeline_reg)
		val de_pipe_reg_ld_type = Input(UInt(3.W))
		val de_pipe_reg_st_type = Input(UInt(3.W))
		val de_pipe_reg_enable = Input(Bool())
		val dcache_flush_tag = Input(Bool())
		val alu_out = Input(UInt(64.W))
		val src2_data = Input(UInt(64.W))
		val is_clint = Input(Bool())
		val clint_r_data = Output(UInt(64.W))
		val em_enable = Output(Bool())
		val csr_inst = Output(UInt(32.W))
		val csr_alu_out = Output(UInt(64.W))
		val csr_isSret = Output(Bool())
		val csr_isMret = Output(Bool())
		val csr_excPC = Output(UInt(64.W)) 
		val csr_jump_taken = Output(Bool()) 
		val csr_is_illegal = Output(Bool()) 
		val csr_inst_misalign = Output(Bool())
		val csr_store_misalign = Output(Bool())
		val csr_load_misalign = Output(Bool())
		val clint_timer_clear = Output(Bool())
		val clint_soft_clear = Output(Bool())
		val clint_timer_valid = Output(Bool())
		val clint_soft_valid = Output(Bool())
	})

	val mw_pipe_reg = RegInit(
		(new mem_writeback_pipeline_reg).Lit(
			_.inst -> Instructions.NOP,
			_.load_data -> 0.U,
			_.csr_read_data -> 0.U,
			_.st_type -> ST_XXX,
			_.ld_type -> LD_XXX,
			_.wb_sel -> WB_ALU,
			_.wb_en -> false.B,
			_.pc -> "h80000000".U,
			_.csr_write_op -> CSR.N,						//write_op输入，可以写csr寄存器
			_.csr_write_addr -> 0.U,						//csr寄存器地址
			_.csr_write_data -> 0.U,						//要写的数据
			_.enable -> false.B
		)
	)


	val data_cache_tag = RegInit(false.B)
	val clint = Module(new clint)
	val data_cache_response_data = RegInit(0.U(64.W))

	when(!io.stall){
		data_cache_tag := false.B
	}.elsewhen(io.dcache.cpu_request.valid && io.dcache.cpu_response.ready){
		data_cache_tag := true.B
		data_cache_response_data := io.dcache.cpu_response.data
	} 
	io.data_cache_response_data := data_cache_response_data
	io.data_cache_tag := data_cache_tag

	clint.io.addr := io.em_pipe_reg.alu_out
	clint.io.w_data := io.em_pipe_reg.st_data
	clint.io.wen := io.em_pipe_reg.st_type.orR && io.em_pipe_reg.enable && io.em_pipe_reg.is_clint
	io.clint_r_data := clint.io.r_data
	io.clint_timer_clear := clint.io.timer_clear
	io.clint_soft_clear := clint.io.soft_clear
	io.clint_timer_valid := clint.io.timer_valid
	io.clint_soft_valid := clint.io.soft_valid

	io.em_enable := io.em_pipe_reg.enable
	io.dcache.flush := io.dcache_flush_tag
	io.dcache.cpu_request.valid := (Mux(io.stall, (io.em_pipe_reg.ld_type.orR || io.em_pipe_reg.st_type.orR) && io.em_pipe_reg.enable && (!io.em_pipe_reg.is_clint), 
										(io.de_pipe_reg_ld_type.orR || io.de_pipe_reg_st_type.orR) && io.de_pipe_reg_enable && !io.is_clint && !io.flush_em) || 
										(io.dcache_flush_tag)) && (!data_cache_tag)
	io.dcache.cpu_request.rw := Mux(io.stall, io.em_pipe_reg.st_type.orR && io.em_pipe_reg.enable, io.de_pipe_reg_st_type.orR && io.de_pipe_reg_enable) 
	io.dcache.cpu_request.addr := Mux(io.stall, io.em_pipe_reg.alu_out, io.alu_out)
	io.dcache.cpu_request.data := Mux(io.stall, io.em_pipe_reg.st_data << (io.em_pipe_reg.alu_out(2, 0) << 3.U), io.src2_data << (io.alu_out(2, 0) << 3.U))(63, 0)
	val accessType_stall = Mux((io.em_pipe_reg.ld_type === 7.U) || (io.em_pipe_reg.st_type === 4.U), double.asUInt, 
								Mux((io.em_pipe_reg.ld_type === 1.U) || (io.em_pipe_reg.ld_type === 6.U) || (io.em_pipe_reg.st_type === 1.U), word.asUInt, 
									Mux((io.em_pipe_reg.ld_type === 4.U) || (io.em_pipe_reg.ld_type === 2.U) || (io.em_pipe_reg.st_type === 2.U), half.asUInt, byte.asUInt)
								)
							)

	val accessType_direct = Mux((io.de_pipe_reg_ld_type === 7.U) || (io.de_pipe_reg_st_type === 4.U), double.asUInt,
								Mux((io.de_pipe_reg_ld_type === 1.U) || (io.de_pipe_reg_ld_type === 6.U) || (io.de_pipe_reg_st_type === 1.U), word.asUInt,
									Mux((io.de_pipe_reg_ld_type === 4.U) || (io.de_pipe_reg_ld_type === 2.U) || (io.de_pipe_reg_st_type === 2.U), half.asUInt, byte.asUInt)
								)
							)
	
	io.dcache.accessType := Mux(io.stall, accessType_stall, accessType_direct)
	val st_mask = Mux(io.stall, Mux(io.em_pipe_reg.st_type === ST_SW, "b00001111".U, 
								Mux(io.em_pipe_reg.st_type === ST_SH, "b00000011".U,
									Mux(io.em_pipe_reg.st_type === ST_SB, "b00000001".U, "b11111111".U)
								)
							),
							Mux(io.de_pipe_reg_st_type === ST_SW, "b00001111".U, 
								Mux(io.de_pipe_reg_st_type === ST_SH, "b00000011".U,
									Mux(io.de_pipe_reg_st_type === ST_SB, "b00000001".U, "b11111111".U)
								)
							)
						) 

	io.dcache.cpu_request.mask := Mux(st_mask === "b11111111".U, st_mask(7, 0), Mux(io.stall, (st_mask << io.em_pipe_reg.alu_out(2,0))(7, 0), (st_mask << io.alu_out(2,0))(7, 0)))
	val load_data = Mux(io.em_pipe_reg.is_clint, clint.io.r_data, io.data_cache_response_data >> ((io.em_pipe_reg.alu_out & "h07".U) << 3.U)) //(em_pipe_reg.alu_out >= "h2000000".U) && (em_pipe_reg.alu_out <= "h200ffff".U)
	val load_data_ext = Mux(io.em_pipe_reg.ld_type === LD_LW, Cat(Mux(load_data(31).asBool, "hffffffff".U, 0.U(32.W)), load_data(31, 0)),
							Mux(io.em_pipe_reg.ld_type === LD_LWU, Cat(Fill(32, 0.U), load_data(31, 0)),
								Mux(io.em_pipe_reg.ld_type === LD_LH, Cat(Mux(load_data(15).asBool, "hffffffffffff".U, 0.U(48.W)), load_data(15, 0)),
									Mux(io.em_pipe_reg.ld_type === LD_LHU, Cat(Fill(48, 0.U), load_data(15, 0)),
										Mux(io.em_pipe_reg.ld_type === LD_LB, Cat(Mux(load_data(7).asBool, "hffffffffffffff".U, 0.U(56.W)), load_data(7, 0)),
											Mux(io.em_pipe_reg.ld_type === LD_LBU, Cat(Fill(56, 0.U), load_data(7,0)), load_data)
											)
										)
									)
								)
							)

	io.csr_inst := io.em_pipe_reg.inst
	io.csr_isSret := io.em_pipe_reg.inst === Instructions.SRET
	io.csr_isMret := io.em_pipe_reg.inst === Instructions.MRET 
	io.csr_excPC := io.em_pipe_reg.pc 
	io.csr_jump_taken := io.em_pipe_reg.jump_taken
	io.csr_is_illegal := io.em_pipe_reg.csr_is_illegal
	io.csr_inst_misalign := io.em_pipe_reg.csr_inst_misalign
	io.csr_store_misalign := io.em_pipe_reg.csr_store_misalign
	io.csr_load_misalign := io.em_pipe_reg.csr_load_misalign
	io.csr_alu_out := io.em_pipe_reg.alu_out
	
	when(io.flush_mw && !io.stall){
		mw_pipe_reg.load_data := 0.U
		mw_pipe_reg.alu_out := 0.U
		mw_pipe_reg.dest := 0.U
		mw_pipe_reg.wb_sel := WB_ALU
		mw_pipe_reg.wb_en := false.B
		mw_pipe_reg.pc := "h80000000".U
		mw_pipe_reg.inst := Instructions.NOP
		mw_pipe_reg.csr_read_data := 0.U
		mw_pipe_reg.csr_write_op := CSR.N							//write_op输入，可以写csr寄存器
		mw_pipe_reg.csr_write_addr := 0.U  							//csr寄存器地址
		mw_pipe_reg.csr_write_data := 0.U							//要写的数据
		mw_pipe_reg.enable := false.B
	}.elsewhen(!io.stall && !io.flush_mw){
		mw_pipe_reg.load_data := load_data_ext
		mw_pipe_reg.alu_out := io.em_pipe_reg.alu_out
		mw_pipe_reg.dest := io.em_pipe_reg.dest
		mw_pipe_reg.wb_sel := io.em_pipe_reg.wb_sel
		mw_pipe_reg.wb_en := io.em_pipe_reg.wb_en
		mw_pipe_reg.pc := io.em_pipe_reg.pc
		mw_pipe_reg.inst := io.em_pipe_reg.inst
		mw_pipe_reg.csr_read_data := io.em_pipe_reg.csr_read_data
		mw_pipe_reg.csr_write_op := io.em_pipe_reg.csr_write_op			//write_op输入，可以写csr寄存器
		mw_pipe_reg.csr_write_addr := io.em_pipe_reg.csr_write_addr		//csr寄存器地址
		mw_pipe_reg.csr_write_data := io.em_pipe_reg.csr_write_data		//要写的数据
		mw_pipe_reg.enable := io.em_pipe_reg.enable
	}

	io.mw_pipe_reg := mw_pipe_reg
}
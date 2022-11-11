package  myCPU

import CSR._ 
import Control._ 
import Instructions._ 
import chisel3._ 
import chisel3.util._ 
import chisel3.experimental.BundleLiterals._
import mdu._

class ExecuteStage extends Module{
	val io = IO(new Bundle{
		val mul_stall = Output(Bool())
		val div_stall = Output(Bool())
		val jump_addr = Output(UInt(64.W))
		val jmp_flush = Output(Bool())
		val jmp_occur = Output(Bool())
		val br_flush = Output(Bool())
		val brCond_taken = Output(Bool())
		val dcache_flush_tag = Output(Bool())
		val alu_out = Output(UInt(64.W))
		val src2_data = Output(UInt(64.W))

		val stall = Input(Bool())
		val flush_em = Input(Bool())
		val flush_de = Input(Bool())
		val dcache_cpu_response_ready = Input(Bool())
		val data_cache_tag = Input(Bool())
		val clint_r_data = Input(UInt(64.W))
		val data_cache_response_data = Input(UInt(64.W))
		val de_pipe_reg = Input(new decode_execute_pipeline_reg)
		val em_pipe_reg = Output(new execute_mem_pipeline_reg)
		
		val mw_pipe_reg_enable = Input(Bool())
		val mw_pipe_reg_wb_en = Input(Bool())
		val mw_pipe_reg_dest = Input(UInt(5.W))
		val mw_pipe_reg_wb_sel = Input(UInt(2.W))
		val mw_pipe_reg_alu_out = Input(UInt(64.W))
		val mw_pipe_reg_pc = Input(UInt(64.W))
		val mw_pipe_reg_csr_read_data = Input(UInt(64.W))
		val mw_pipe_reg_load_data = Input(UInt(64.W))
	})

	val em_pipe_reg = RegInit(
		(new execute_mem_pipeline_reg).Lit(
			_.inst -> Instructions.NOP,
			_.dest -> 0.U,
			_.alu_out -> 0.U,
			_.alu_sum -> 0.U,
			_.csr_read_data -> 0.U,
			_.csr_write_op -> CSR.N,
			_.csr_write_addr -> 0.U,
			_.csr_write_data -> 0.U,
			_.jump_taken -> false.B,
			_.st_data -> 0.U,
			_.st_type -> ST_XXX,
			_.ld_type -> LD_XXX,
			_.wb_sel -> WB_ALU,
			_.wb_en -> false.B,
			_.pc -> "h80000000".U,
			_.is_clint -> false.B,
			_.csr_inst_mode -> CSR_MODE_U,
			_.csr_is_illegal -> false.B,
			_.csr_inst_misalign -> false.B,
			_.csr_load_misalign -> false.B,
			_.csr_store_misalign -> false.B,
			_.enable -> false.B
		)
	)

	val alu = Module(new AluSimple(64))					
	val brCond = Module(new BrCondSimple(64))			//专门用于跳转判断
	val multiplier = Module(new Multiplier)
	val divider = Module(new Divider)
	val dcache_flush_tag = RegInit(false.B)	
	val alu_out = alu.io.out
	val alu_sum = alu.io.sum

	io.alu_out := alu_out
	
	when(!io.stall && io.flush_em){
		dcache_flush_tag := false.B 
	}.elsewhen(io.de_pipe_reg.inst === FENCE_I && !io.stall){
		dcache_flush_tag := true.B
	}.otherwise{
		when(io.dcache_cpu_response_ready){
			dcache_flush_tag := false.B
		}
	}
	io.dcache_flush_tag := dcache_flush_tag

	val computation_result = WireInit(0.U(64.W))
	val src1_data = WireInit(0.U(64.W))
	val src2_data = WireInit(0.U(64.W))
	val is_clint = alu_out >= "h2000000".U && alu_out <= "h200ffff".U && io.de_pipe_reg.enable && 
					(io.de_pipe_reg.ld_type.orR || io.de_pipe_reg.st_type.orR)
	val load_data_hazard = Mux(em_pipe_reg.is_clint && em_pipe_reg.enable, io.clint_r_data, io.data_cache_response_data >> ((em_pipe_reg.alu_out & "h07".U) << 3.U))
	val load_data_ext_hazard = Mux(em_pipe_reg.ld_type === LD_LW, Cat(Mux(load_data_hazard(31).asBool, "hffffffff".U, 0.U(32.W)), load_data_hazard(31, 0)),
								Mux(em_pipe_reg.ld_type === LD_LWU, Cat(Fill(32, 0.U), load_data_hazard(31, 0)),
									Mux(em_pipe_reg.ld_type === LD_LH, Cat(Mux(load_data_hazard(15).asBool, "hffffffffffff".U, 0.U(48.W)), load_data_hazard(15, 0)),
										Mux(em_pipe_reg.ld_type === LD_LHU, Cat(Fill(48, 0.U), load_data_hazard(15, 0)),
											Mux(em_pipe_reg.ld_type === LD_LB, Cat(Mux(load_data_hazard(7).asBool, "hffffffffffffff".U, 0.U(56.W)), load_data_hazard(7, 0)),
												Mux(em_pipe_reg.ld_type === LD_LBU, Cat(Fill(56, 0.U), load_data_hazard(7,0)), load_data_hazard)
											)
										)
									)
								)
							)

	val src_unready = ((io.de_pipe_reg.src1_addr === em_pipe_reg.dest) 
						|| (io.de_pipe_reg.src2_addr === em_pipe_reg.dest)) && em_pipe_reg.ld_type.orR && !io.data_cache_tag && 
						em_pipe_reg.enable && io.de_pipe_reg.enable && !em_pipe_reg.is_clint

	val mul_result = RegInit(0.U(64.W))
	val mul_result_enable = RegInit(false.B)
	val div_result = RegInit(0.U(64.W))
	val div_result_enable = RegInit(false.B)

	io.mul_stall := io.de_pipe_reg.enable  && !mul_result_enable && (io.de_pipe_reg.alu_op === Alu.ALU_MUL) //&& multiplier.io.mul_valid
	io.div_stall := io.de_pipe_reg.enable  && !div_result_enable && ((io.de_pipe_reg.alu_op === Alu.ALU_REM) 
																|| (io.de_pipe_reg.alu_op === Alu.ALU_DIV) 
																|| (io.de_pipe_reg.alu_op === Alu.ALU_REMU) 
																|| (io.de_pipe_reg.alu_op === Alu.ALU_DIVU)) //divider.io.div_valid//


	multiplier.io.mul_valid := ((io.de_pipe_reg.alu_op === Alu.ALU_MUL) && io.de_pipe_reg.enable) && !src_unready && !mul_result_enable
	multiplier.io.flush := io.flush_de
	multiplier.io.mulw := Mux(io.de_pipe_reg.wd_type === W_D, false.B, true.B)
	multiplier.io.mul_op := Mux(io.de_pipe_reg.inst === MUL || io.de_pipe_reg.inst === MULW, MulOp.mul.asUInt, 
							Mux(io.de_pipe_reg.inst === MULH, MulOp.mulh.asUInt,
								Mux(io.de_pipe_reg.inst === MULHSU, MulOp.mulhsu.asUInt, MulOp.mulhu.asUInt)
							)
						)

	multiplier.io.multilicand := src1_data.asSInt
	multiplier.io.multiplier := src2_data.asSInt

	divider.io.div_valid := ((io.de_pipe_reg.alu_op === Alu.ALU_DIVU) || 
								(io.de_pipe_reg.alu_op === Alu.ALU_DIV) || 
								(io.de_pipe_reg.alu_op === Alu.ALU_REM) || 
								(io.de_pipe_reg.alu_op === Alu.ALU_REMU)) && io.de_pipe_reg.enable && !src_unready && !div_result_enable
	divider.io.flush := io.flush_de
	divider.io.divw := Mux(io.de_pipe_reg.wd_type === W_D, false.B, true.B)
	divider.io.div_signed := (io.de_pipe_reg.alu_op === Alu.ALU_DIV) || (io.de_pipe_reg.alu_op === Alu.ALU_REM)
	divider.io.dividend := src1_data.asSInt
	divider.io.divisor := src2_data.asSInt

	when(io.flush_de){
		mul_result_enable := false.B
	}.elsewhen(multiplier.io.out_valid){
		mul_result := multiplier.io.result.asUInt
		mul_result_enable := true.B
	}

	when(io.flush_de){
		div_result_enable := false.B
	}.elsewhen(divider.io.out_valid){
		div_result_enable := true.B
		when(io.de_pipe_reg.alu_op === Alu.ALU_DIVU || io.de_pipe_reg.alu_op === Alu.ALU_DIV){
			div_result := divider.io.quotient.asUInt
		}.elsewhen(io.de_pipe_reg.alu_op === Alu.ALU_REMU || io.de_pipe_reg.alu_op === Alu.ALU_REM){
			div_result := divider.io.remainder.asUInt
		}
	}

	multiplier.io.out_ready := mul_result_enable
	divider.io.out_ready := div_result_enable

	computation_result := Mux(io.de_pipe_reg.alu_op === Alu.ALU_DIV || io.de_pipe_reg.alu_op === Alu.ALU_DIVU, div_result,
								Mux(io.de_pipe_reg.alu_op === Alu.ALU_REM || io.de_pipe_reg.alu_op === Alu.ALU_REMU, div_result,
									Mux(io.de_pipe_reg.alu_op === Alu.ALU_MUL, mul_result, alu_out)
								)
							)

	when(em_pipe_reg.enable && em_pipe_reg.wb_en && (io.de_pipe_reg.src1_addr === em_pipe_reg.dest) && (io.de_pipe_reg.src1_addr =/= 0.U)){
		when(io.de_pipe_reg.src1_addr === em_pipe_reg.dest){
			src1_data := Mux(em_pipe_reg.wb_sel === WB_ALU, em_pipe_reg.alu_out,
						Mux(em_pipe_reg.wb_sel === WB_PC4, em_pipe_reg.pc + 4.U, 
							Mux(em_pipe_reg.wb_sel === WB_CSR, em_pipe_reg.csr_read_data, load_data_ext_hazard)))
		}
	}.elsewhen(io.mw_pipe_reg_enable && io.mw_pipe_reg_wb_en &&(io.de_pipe_reg.src1_addr === io.mw_pipe_reg_dest) && (io.de_pipe_reg.src1_addr =/= 0.U)){
		when(io.de_pipe_reg.src1_addr === io.mw_pipe_reg_dest){
			src1_data := Mux(io.mw_pipe_reg_wb_sel === WB_ALU, io.mw_pipe_reg_alu_out,
						Mux(io.mw_pipe_reg_wb_sel === WB_PC4, io.mw_pipe_reg_pc + 4.U, 
							Mux(io.mw_pipe_reg_wb_sel === WB_CSR, io.mw_pipe_reg_csr_read_data, io.mw_pipe_reg_load_data)))
		}
	}.otherwise{
		src1_data := io.de_pipe_reg.rs1
	}

	when(em_pipe_reg.enable && em_pipe_reg.wb_en && (io.de_pipe_reg.src2_addr === em_pipe_reg.dest) && (io.de_pipe_reg.src2_addr =/= 0.U)){
		when(io.de_pipe_reg.src2_addr === em_pipe_reg.dest){
			src2_data := Mux(em_pipe_reg.wb_sel === WB_ALU, em_pipe_reg.alu_out,
						Mux(em_pipe_reg.wb_sel === WB_PC4, em_pipe_reg.pc + 4.U, 
							Mux(em_pipe_reg.wb_sel === WB_CSR, em_pipe_reg.csr_read_data, load_data_ext_hazard)))
		}
	}.elsewhen(io.mw_pipe_reg_enable && io.mw_pipe_reg_wb_en &&(io.de_pipe_reg.src2_addr === io.mw_pipe_reg_dest) && 
				(io.de_pipe_reg.src2_addr =/= 0.U)){
		when(io.de_pipe_reg.src2_addr === io.mw_pipe_reg_dest){
			src2_data := Mux(io.mw_pipe_reg_wb_sel === WB_ALU, io.mw_pipe_reg_alu_out,
						Mux(io.mw_pipe_reg_wb_sel === WB_PC4, io.mw_pipe_reg_pc + 4.U, 
							Mux(io.mw_pipe_reg_wb_sel === WB_CSR, io.mw_pipe_reg_csr_read_data, io.mw_pipe_reg_load_data)))
		}
	}.otherwise{
		src2_data := io.de_pipe_reg.rs2
	}

	io.src2_data := src2_data

	alu.io.alu_op := io.de_pipe_reg.alu_op
	alu.io.width_type := io.de_pipe_reg.wd_type
	val A_data = Mux(io.de_pipe_reg.A_sel.asBool, src1_data, io.de_pipe_reg.pc)
	val B_data = Mux(io.de_pipe_reg.B_sel.asBool, src2_data, io.de_pipe_reg.imm)
	alu.io.A := Mux(io.de_pipe_reg.wd_type === W_W, A_data(31, 0), A_data)
	alu.io.B := Mux(io.de_pipe_reg.wd_type === W_W, B_data(31, 0), B_data)
	
	io.jmp_occur := io.de_pipe_reg.enable && (io.de_pipe_reg.pc_sel === PC_ALU)
	io.jmp_flush := io.jmp_occur
	io.jump_addr := alu_out
	brCond.io.br_type := io.de_pipe_reg.br_type 							//思考跳转发生时会发生什么？当跳转发生时，前一个周期的指令直接被刷新为nop
	brCond.io.rs1 := src1_data											//A_data
	brCond.io.rs2 := src2_data											//B_data
	io.brCond_taken := brCond.io.taken && io.de_pipe_reg.enable				//taken需要信号有效时才产生作用
	io.br_flush := io.brCond_taken

	when(io.flush_em && !io.stall){
		em_pipe_reg.inst := Instructions.NOP
		em_pipe_reg.dest := 0.U
		em_pipe_reg.alu_out := 0.U
		em_pipe_reg.alu_sum := 0.U
		em_pipe_reg.csr_read_data := 0.U
		em_pipe_reg.csr_write_op := CSR.N
		em_pipe_reg.csr_write_addr := 0.U
		em_pipe_reg.csr_write_data := 0.U
		em_pipe_reg.jump_taken := false.B
		em_pipe_reg.st_data := 0.U
		em_pipe_reg.st_type := ST_XXX
		em_pipe_reg.ld_type := LD_XXX
		em_pipe_reg.wb_sel := WB_ALU
		em_pipe_reg.wb_en := false.B
		em_pipe_reg.pc := "h80000000".U
		em_pipe_reg.is_clint := false.B
		em_pipe_reg.csr_inst_mode := CSR_MODE_U
		em_pipe_reg.csr_is_illegal := false.B 
		em_pipe_reg.csr_inst_misalign := false.B
		em_pipe_reg.csr_store_misalign := false.B
		em_pipe_reg.csr_load_misalign := false.B
		em_pipe_reg.enable := false.B
	}.elsewhen(!io.stall && !io.flush_em){
		em_pipe_reg.inst := io.de_pipe_reg.inst
		em_pipe_reg.dest := io.de_pipe_reg.dest
		em_pipe_reg.alu_out := computation_result //alu_result
		mul_result_enable := false.B
		div_result_enable := false.B
		em_pipe_reg.alu_sum := alu_sum
		em_pipe_reg.csr_read_data := io.de_pipe_reg.csr_read_data
		em_pipe_reg.csr_write_op := io.de_pipe_reg.csr_write_op
		em_pipe_reg.csr_write_addr := io.de_pipe_reg.csr_write_addr
		em_pipe_reg.csr_write_data := Mux(io.de_pipe_reg.imm_sel === IMM_Z, io.de_pipe_reg.imm, src1_data)
		em_pipe_reg.jump_taken := brCond.io.taken || (io.de_pipe_reg.pc_sel === PC_ALU && io.de_pipe_reg.enable)
		em_pipe_reg.st_data := src2_data
		em_pipe_reg.st_type := io.de_pipe_reg.st_type
		em_pipe_reg.ld_type := io.de_pipe_reg.ld_type
		em_pipe_reg.wb_sel := io.de_pipe_reg.wb_sel
		em_pipe_reg.wb_en := io.de_pipe_reg.wb_en
		em_pipe_reg.pc := io.de_pipe_reg.pc
		em_pipe_reg.is_clint := is_clint
		em_pipe_reg.csr_inst_mode := io.de_pipe_reg.csr_inst_mode
		em_pipe_reg.csr_is_illegal := io.de_pipe_reg.csr_is_illegal
		em_pipe_reg.csr_inst_misalign := io.de_pipe_reg.csr_inst_misalign
		em_pipe_reg.csr_store_misalign := (io.de_pipe_reg.st_type =/= ST_XXX) && 
											MuxCase(false.B,
												IndexedSeq(
													(io.de_pipe_reg.st_type === ST_SB) -> false.B,
													(io.de_pipe_reg.st_type === ST_SH) -> (alu_out(0) =/= 0.U),
													(io.de_pipe_reg.st_type === ST_SW) -> (alu_out(1, 0) =/= 0.U),
													(io.de_pipe_reg.st_type === ST_SD) -> (alu_out(2, 0) =/= 0.U)
												)
											)
		em_pipe_reg.csr_load_misalign := (io.de_pipe_reg.ld_type =/= LD_XXX) && 
											MuxCase(false.B,
												IndexedSeq(
													(io.de_pipe_reg.ld_type === LD_LB || io.de_pipe_reg.ld_type === LD_LBU) -> false.B,
													(io.de_pipe_reg.ld_type === LD_LH || io.de_pipe_reg.ld_type === LD_LHU) -> (alu_out(0) =/= 0.U),
													(io.de_pipe_reg.ld_type === LD_LW || io.de_pipe_reg.ld_type === LWU)	-> (alu_out(1, 0) =/= 0.U),
													(io.de_pipe_reg.ld_type === LD_LD) -> (alu_out(2,0) =/= 0.U)
												)
											) 
		em_pipe_reg.enable := io.de_pipe_reg.enable
	}

	io.em_pipe_reg := em_pipe_reg
}
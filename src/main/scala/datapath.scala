package myCPU

import chisel3._
import chisel3.util._
import chisel3.util.BitPat
import Control._ 
import Instructions._ 
import chisel3.stage.ChiselStage
import chisel3.experimental.BundleLiterals._
import CSR_OP._ 
import CSR._ 

class RegisterFile(readPorts : Int) extends Module{
    require(readPorts >= 0)
    val io = IO(new Bundle{
//		val clock = Input(Clock())
//		val reset = Input(Bool())
        val wen = Input(Bool())
        val waddr = Input(UInt(5.W))
        val wdata = Input(UInt(64.W))
        val raddr = Input(Vec(readPorts, UInt(5.W)))
        val rdata = Output(Vec(readPorts, UInt(64.W)))
    })

    val reg = RegInit(VecInit(Seq.fill(32)(0.U(64.W))))

	//withClockAndReset((~io.clock.asUInt.asBool).asClock, io.reset){
    when(io.wen){
        reg(io.waddr) := io.wdata
	}
	//}

	for(i <- 0 until readPorts)
		io.rdata(i) := 0.U
	//io.rdata := DontCare
	for(i <- 0 until readPorts){
		when(io.raddr(i) === 0.U){              //写zero寄存器做特殊判断
			io.rdata(i) := 0.U
		}.otherwise{
			io.rdata(i) := reg(io.raddr(i))
		}
	}

}

/*
class MemIO extends Bundle{
	val pc_addr = Input(UInt(64.W))
	val pc_data = Output(UInt(64.W))
	val addr = Input(UInt(64.W))
	val wdata = Input(UInt(64.W))
	val mask = Input(UInt(8.W))
	val rdata = Output(UInt(64.W))
	val wen = Input(Bool())
}*/


class Mem extends BlackBox{
	val io = IO(new Bundle{
		val clock = Input(Clock())
		val reset = Input(Bool())
//		val memIO = new MemIO
		val pc_addr = Input(UInt(64.W))
		val pc_data = Output(UInt(64.W))
		val waddr = Input(UInt(64.W))
		val raddr = Input(UInt(64.W))
		val wdata = Input(UInt(64.W))
		val mask = Input(UInt(8.W))
		val rdata = Output(UInt(64.W))
		val enable = Input(Bool())
		val wen = Input(Bool())
	})
}

class gpr_ptr extends BlackBox with HasBlackBoxInline{
	val io = IO(new Bundle{
		val clock = Input(Clock())
		val reset = Input(Bool())
		val regfile = Input(Vec(32,UInt(64.W)))
	})
}

class fetch_decode_pipeline_reg extends Bundle{
	val inst = chiselTypeOf(Instructions.NOP)
	val pc = UInt(64.W)
//	val fetch_misalign = Bool()
}

class decode_execute_pipeline_reg extends Bundle{
	val alu_op = UInt(4.W)
	val pc = UInt(64.W)
	val inst = chiselTypeOf(Instructions.NOP)
	val imm = UInt(64.W)
	val rs1 = UInt(64.W)
	val src1_addr = UInt(64.W)
	val rs2 = UInt(64.W)
	val src2_addr = UInt(64.W)
	val csr_read_data = UInt(64.W)
//	val csr_valid = Bool()
	val csr_write_op = UInt(3.W)
	val csr_write_addr = UInt(12.W)
	val csr_write_data = UInt(64.W)
	val dest = UInt(5.W)
	val A_sel = UInt(1.W)
	val B_sel = UInt(1.W)
	val wd_type = UInt(2.W)
//	val br_type = UInt(3.W)
	val st_type = UInt(3.W)
	val ld_type = UInt(3.W)
	val wb_sel = UInt(2.W)
	val wb_en = Bool()
	val csr_cmd = UInt(3.W)
//	val is_illegal = Bool()
	val is_kill = Bool()
//	val load_misalign = Bool()
//	val store_misalign = Bool()
//	val fetch_misalign = Bool()
	//val extend = UInt(1.W)
}


class  execute_mem_pipeline_reg extends Bundle{
	val alu_out = UInt(64.W)
	val alu_sum = UInt(64.W)
//	val br_type = UInt(3.W)
	val csr_read_data = UInt(64.W)
	val csr_write_op = UInt(3.W)
	val csr_write_addr = UInt(12.W)
	val csr_write_data = UInt(64.W)
	val st_type = UInt(3.W)
	val ld_type = UInt(3.W)
	val wb_sel = UInt(2.W)
	val wb_en = Bool()
	val dest = UInt(5.W)
	//val extend = UInt(1.W)
	val pc = UInt(64.W)
	val inst = chiselTypeOf(Instructions.NOP)
//	val load_misalign = Bool()
//	val store_misalign = Bool()
//	val fetch_misalign = Bool()
	val is_kill = Bool()
//	val is_illegal = Bool()
}

class mem_writeback_pipeline_reg extends Bundle{
	val load_data = UInt(64.W)
	val alu_out = UInt(64.W)
	val dest = UInt(5.W)
//	val br_taken = Bool()
	val csr_read_data = UInt(64.W)
	val csr_write_op = UInt(3.W)
	val csr_write_addr = UInt(12.W)
	val csr_write_data = UInt(64.W)	
	val st_type = UInt(3.W)
	val ld_type = UInt(3.W)
	val wb_sel = UInt(2.W)
	val wb_en = Bool()
	val pc = UInt(64.W)
	val inst = chiselTypeOf(Instructions.NOP)
	//val extend = UInt(1.W)
//	val is_illegal = Bool()
//	val fetch_misalign = Bool()
//	val load_misalign = Bool()
//	val store_misalign = Bool()
}

class DatapathIO extends Bundle{
	val ctrl = Flipped(new ControlSignals)
	val pc = Output(UInt(64.W))
}


class Datapath extends Module{
	val io = IO(new DatapathIO)
	val fd_pipe_reg = RegInit(
		(new fetch_decode_pipeline_reg).Lit(
			_.inst -> Instructions.NOP,
			_.pc -> 0.U,
//			_.fetch_misalign -> false.B
		)
	)

	val de_pipe_reg = RegInit(
		(new decode_execute_pipeline_reg).Lit(
			_.inst -> Instructions.NOP,
			_.alu_op -> 0.U,
			_.A_sel -> A_XXX,
			_.B_sel -> B_XXX,
			_.csr_read_data -> 0.U,
//			_.csr_valid -> false.B,
			_.csr_write_op -> 0.U,
			_.csr_write_addr -> 0.U,
			_.csr_write_data -> 0.U,
			_.pc -> 0.U,
			_.imm -> 0.U,
			_.rs1 -> 0.U,
			_.src1_addr -> 0.U,
			_.rs2 -> 0.U,
			_.src2_addr -> 0.U,
			_.dest -> 0.U,
//			_.br_type -> 0.U,
			_.st_type -> 0.U,
			_.ld_type -> 0.U,
			_.wd_type -> 0.U,
			_.wb_sel -> 0.U,
			_.wb_en -> false.B,
//			_.extend -> 0.U,
//			_.is_illegal -> false.B,
			_.is_kill -> false.B,
//			_.load_misalign -> false.B,
//			_.store_misalign -> false.B,
//			_.fetch_misalign -> false.B
		)
	)

	val em_pipe_reg = RegInit(
		(new execute_mem_pipeline_reg).Lit(
			_.inst -> Instructions.NOP,
			_.dest -> 0.U,
			_.alu_out -> 0.U,
			_.alu_sum -> 0.U,
			_.csr_read_data -> 0.U,
//			_.br_taken -> false.B ,
			_.csr_write_op -> 0.U,
			_.csr_write_addr -> 0.U,
			_.csr_write_data -> 0.U,
			_.st_type -> 0.U,
			_.ld_type -> 0.U,
			_.wb_sel -> 0.U,
			_.wb_en -> false.B,
//			_.extend -> 0.U,
			_.pc -> 0.U,
//			_.is_illegal -> false.B,
			_.is_kill -> false.B,
//			_.load_misalign -> false.B,
//			_.store_misalign -> false.B,
//			_.fetch_misalign -> false.B
		)
	)

	val mw_pipe_reg = RegInit(
		(new mem_writeback_pipeline_reg).Lit(
			_.inst -> Instructions.NOP,
			_.load_data -> 0.U,
//			_.br_taken -> false.B,
			_.csr_read_data -> 0.U,
			_.csr_write_op -> 0.U,
			_.csr_write_addr -> 0.U,
			_.csr_write_data -> 0.U,
			_.st_type -> 0.U,
			_.ld_type -> 0.U,
			_.wb_sel -> 0.U,
			_.wb_en -> false.B,
//			_.extend -> 0.U,
			_.pc -> 0.U,
//			_.load_misalign -> false.B,
//			_.store_misalign -> false.B,
//			_.fetch_misalign -> false.B,
//			_.is_illegal -> false.B
		)
	)
	

	val stall = false.B									//stall暂时设置为false
	val alu = Module(new AluSimple(64))					
	val immGen = Module(new ImmGenWire)
	//val control = Module(new Control)
	val brCond = Module(new BrCondSimple(64))
	val regFile = Module(new RegisterFile(35))
	val imem = Module(new Mem)							//指令mem
	val dmem = Module(new Mem)							//数据mem
	val csr = Module(new CSR)							//csr registers check the privilege and process exceptions and interrupts

	val jump_addr = Wire(UInt(64.W))

	val gpr_ptr = Module(new gpr_ptr)
	regFile.io.raddr(2) := 0.U
	for(i <- 3 until 35){
		regFile.io.raddr(i) := (i-3).U
		gpr_ptr.io.regfile(i-3) := regFile.io.rdata(i)
	}

	gpr_ptr.io.clock := clock
	gpr_ptr.io.reset := reset

	csr.io.extern := false.B
	csr.io.int_timer := false.B
	csr.io.int_soft := false.B

	imem.io.clock := clock								//input mem clock
	imem.io.reset := reset								//input reset
	dmem.io.clock := clock
	dmem.io.reset := reset
	 
	csr.io.stall := stall
	//val pc = RegInit("h80000000".U)
	//val gpr_ptr = Module(new gpr_ptr)

	/*
	val st_type = Reg(io.ctrl.st_type.cloneType)
	val ld_type = Reg(io.ctrl.ld_type.cloneType)
	val wb_sel = Reg(io.ctrl.wb_sel.cloneType)
	val wb_en = Reg(Bool())
	val csr_cmd = Reg(io.ctrl.csr_cmd.cloneType)
	val illegal = Reg(Bool())
	val pc_check = Reg(Bool())
	*/

	val flush_fd = csr.io.flush_mask(0)
	val flush_de = csr.io.flush_mask(1)
	val flush_em = csr.io.flush_mask(2)
	val flush_mw = csr.io.flush_mask(3)

	/***** Fetch ******/
	val started = RegNext(reset.asBool)
	//val stall = 	//don't care about stall at here
	val pc = RegInit("h80000000".U(64.W) - 4.U)
	val next_pc = MuxCase(
		pc + 4.U,
		IndexedSeq(
		csr.io.trap -> csr.io.trapVec,
		(io.ctrl.pc_sel === PC_EPC) -> csr.io.trapVec,
		((io.ctrl.pc_sel === PC_ALU) || (brCond.io.taken)) ->(jump_addr >> 1.U << 1.U),
		(io.ctrl.pc_sel === PC_0) -> pc)
	)

	//如果是跳转，异常和还未开始等情况，那么获取的是一条NOP指令，否则是从指令存储器中读取一条指令
	val inst = Mux(started || io.ctrl.is_kill || brCond.io.taken || csr.io.trap, Instructions.NOP, imem.io.rdata)
//	io.ctrl.inst := inst

	//pc设置为next_pc, 存储的读取地址也设为next_pc
	pc := next_pc 
	imem.io.raddr := next_pc

	//异常抛出
	//csr.io.fetch_misalign := (next_pc & 3.U) === 0.U
	//csr.io.pc_fetch_misalign := next_pc


	when(flush_fd){
		fd_pipe_reg.pc := 0.U
		fd_pipe_reg.inst := Instructions.NOP
//		fd_pipe_reg.fetch_misalign := false.B
	}.elsewhen(!stall){
		fd_pipe_reg.pc := next_pc
		fd_pipe_reg.inst := inst
//		fd_pipe_reg.fetch_misalign := (pc & 3.U) === 0.U
	}

	/***** Decode ******/
	io.ctrl.inst := fd_pipe_reg.inst
	val src1_addr = fd_pipe_reg.inst(19, 15)
	val src2_addr = fd_pipe_reg.inst(24, 20)
	val dest_addr = fd_pipe_reg.inst(11, 7)
	regFile.io.raddr(0) := src1_addr
	regFile.io.raddr(1)	:= src2_addr
	//Mux(mw_pipe_reg.dest === src1_addr, mw_pipe_reg.w_data, regFile.rdata(0))
	//Mux(mw_pipe_reg.dest === src2_addr, mw_pipe_reg.w_data, regFile.rdata(1))

	immGen.io.inst := fd_pipe_reg.inst
	immGen.io.sel := io.ctrl.imm_sel
	//	val imm = immGen.io.out

	brCond.io.br_type := io.ctrl.br_type		//思考跳转发生时会发生什么？当跳转发生时，前一个周期的指令直接被刷新为nop
	brCond.io.rs1 := regFile.io.rdata(0)
	brCond.io.rs2 := regFile.io.rdata(1)
	jump_addr := fd_pipe_reg.pc + Mux(io.ctrl.B_sel === B_RS2, regFile.io.rdata(1), 
										Mux(io.ctrl.B_sel === B_IMM, immGen.io.out, 0.U))
	//	val taken = brCond.io.taken


	//csr read
	val csr_op = Mux(
					(io.ctrl.csr_cmd === CSR_RW) && (dest_addr === 0.U), CSR.W, 
					Mux(io.ctrl.csr_cmd === CSR_RW, CSR.RW, 
						Mux((io.ctrl.csr_cmd === CSR_RC) && (dest_addr === 0.U), CSR.R,
							Mux(io.ctrl.csr_cmd === CSR_RC, CSR.RC,
								Mux((io.ctrl.csr_cmd === CSR_RS) && (dest_addr === 0.U), CSR.R,
									Mux(io.ctrl.csr_cmd === CSR_RS, CSR.RS, CSR.N)
								)
							)
						)
					)
				)

	csr.io.r_op := csr_op
	csr.io.r_addr := de_pipe_reg.inst(31, 20)
	csr.io.inst_mode := io.ctrl.prv
	csr.io.illegal_inst := Mux(io.ctrl.is_illegal, fd_pipe_reg.inst, 0.U)

	csr.io.fetch_misalign := (de_pipe_reg.pc & 3.U) === 0.U
	csr.io.pc_fetch_misalign := de_pipe_reg.pc


	val csr_data = csr.io.r_data
//	val csr_valid = csr.io.valid

	val csr_write_data = regFile.io.rdata(1)
	val csr_write_addr = inst(11, 7)

	when(flush_de){
		de_pipe_reg.inst := Instructions.NOP
		de_pipe_reg.alu_op := 0.U
		de_pipe_reg.A_sel := A_XXX
		de_pipe_reg.B_sel := B_XXX
		de_pipe_reg.csr_read_data := 0.U
//		de_pipe_reg.csr_valid := false.B
		de_pipe_reg.csr_write_op := 0.U
		de_pipe_reg.csr_write_data := 0.U
		de_pipe_reg.csr_write_addr := 0.U
		de_pipe_reg.pc := 0.U
		de_pipe_reg.imm := 0.U
		de_pipe_reg.rs1 := 0.U
		de_pipe_reg.src1_addr := 0.U
		de_pipe_reg.rs2 := 0.U
		de_pipe_reg.src2_addr := 0.U
		de_pipe_reg.dest := 0.U
		de_pipe_reg.st_type := ST_XXX
		de_pipe_reg.ld_type := LD_XXX
		de_pipe_reg.wd_type := W_D
		de_pipe_reg.wb_sel := WB_ALU
		de_pipe_reg.wb_en := false.B
	//	de_pipe_reg.extend := io.ctrl.ext
//		de_pipe_reg.is_illegal := false.B
		de_pipe_reg.is_kill	:= false.B
//		de_pipe_reg.fetch_misalign := false.B

	}.elsewhen(!stall){
		de_pipe_reg.inst := fd_pipe_reg.inst
		de_pipe_reg.alu_op := io.ctrl.alu_op
		de_pipe_reg.A_sel := io.ctrl.A_sel
		de_pipe_reg.B_sel := io.ctrl.B_sel
		de_pipe_reg.csr_read_data := csr_data
//		de_pipe_reg.csr_valid := csr_valid
		de_pipe_reg.csr_write_op := csr_op
		de_pipe_reg.csr_write_data := csr_write_data
		de_pipe_reg.csr_write_addr := csr_write_addr
		de_pipe_reg.pc := fd_pipe_reg.pc
		de_pipe_reg.imm := immGen.io.out
		de_pipe_reg.rs1 := regFile.io.rdata(0)
		de_pipe_reg.src1_addr := src1_addr
		de_pipe_reg.rs2 := regFile.io.rdata(1)
		de_pipe_reg.src2_addr := src2_addr
		de_pipe_reg.dest := dest_addr
		de_pipe_reg.st_type := io.ctrl.st_type
		de_pipe_reg.ld_type := io.ctrl.ld_type
		de_pipe_reg.wd_type := io.ctrl.wd_type
		de_pipe_reg.wb_sel := io.ctrl.wb_sel
		de_pipe_reg.wb_en := io.ctrl.wb_en
	//	de_pipe_reg.extend := io.ctrl.ext
//		de_pipe_reg.is_illegal := io.ctrl.is_illegal
		de_pipe_reg.is_kill	:= io.ctrl.is_kill
//		de_pipe_reg.fetch_misalign := fd_pipe_reg.fetch_misalign
	}


	/****** Execute *****/

	val src1_data = WireInit(0.U(64.W))
	val src2_data = WireInit(0.U(64.W))
	when(em_pipe_reg.wb_en && ((de_pipe_reg.src1_addr === em_pipe_reg.dest) || (de_pipe_reg.src2_addr === em_pipe_reg.dest))){
		when(de_pipe_reg.src1_addr === em_pipe_reg.dest){
			src1_data := Mux(em_pipe_reg.wb_sel === WB_ALU, em_pipe_reg.alu_out,
						Mux(em_pipe_reg.wb_sel === WB_PC4, em_pipe_reg.pc + 4.U, 
							Mux(em_pipe_reg.wb_sel === WB_CSR, em_pipe_reg.csr_read_data, dmem.io.rdata)))
		}
		when(de_pipe_reg.src2_addr === em_pipe_reg.dest){
			src2_data := Mux(em_pipe_reg.wb_sel === WB_ALU, em_pipe_reg.alu_out,
						Mux(em_pipe_reg.wb_sel === WB_PC4, em_pipe_reg.pc + 4.U, 
							Mux(em_pipe_reg.wb_sel === WB_CSR, em_pipe_reg.csr_read_data, dmem.io.rdata)))
		}
	}.elsewhen(mw_pipe_reg.wb_en &&((de_pipe_reg.src1_addr === mw_pipe_reg.dest) || (de_pipe_reg.src2_addr === mw_pipe_reg.dest))){
		when(de_pipe_reg.src1_addr === mw_pipe_reg.dest){
			src1_data := Mux(mw_pipe_reg.wb_sel === WB_ALU, mw_pipe_reg.alu_out,
						Mux(mw_pipe_reg.wb_sel === WB_PC4, mw_pipe_reg.pc + 4.U, 
							Mux(mw_pipe_reg.wb_sel === WB_CSR, mw_pipe_reg.csr_read_data, mw_pipe_reg.load_data)))
		}
		when(de_pipe_reg.src2_addr === mw_pipe_reg.dest){
			src2_data := Mux(mw_pipe_reg.wb_sel === WB_ALU, mw_pipe_reg.alu_out,
						Mux(mw_pipe_reg.wb_sel === WB_PC4, mw_pipe_reg.pc + 4.U, 
							Mux(mw_pipe_reg.wb_sel === WB_CSR, mw_pipe_reg.csr_read_data, mw_pipe_reg.load_data)))
		}
	}.otherwise{
		src1_data := de_pipe_reg.rs1
		src2_data := de_pipe_reg.rs2
	}

	alu.io.alu_op := de_pipe_reg.alu_op
	alu.io.width_type := de_pipe_reg.wd_type
	val A_data = Mux(de_pipe_reg.A_sel.asBool, src1_data, de_pipe_reg.pc)
	val B_data = Mux(de_pipe_reg.B_sel.asBool, src2_data, de_pipe_reg.imm)
	alu.io.A := Mux(de_pipe_reg.wd_type === W_W, A_data(31, 0), A_data)
	alu.io.B := Mux(de_pipe_reg.wd_type === W_W, B_data(31, 0), B_data)

	val alu_out = alu.io.out
	val alu_sum = alu.io.sum
	
	csr.io.store_misalign := (de_pipe_reg.st_type =/= ST_XXX) && 
										MuxCase(false.B,
											IndexedSeq(
											(de_pipe_reg.st_type === ST_SB) -> false.B,
											(de_pipe_reg.st_type === ST_SH) -> (alu_out(0) =/= 0.U),
											(de_pipe_reg.st_type === ST_SW) -> (alu_out(1, 0) =/= 0.U),
											(de_pipe_reg.st_type === ST_SD) -> (alu_out(2, 0) =/= 0.U))
										)

	csr.io.load_misalign := (de_pipe_reg.ld_type =/= LD_XXX) && 
										MuxCase(false.B,
											IndexedSeq(
											(de_pipe_reg.ld_type === LD_LB || de_pipe_reg.ld_type === LD_LBU) -> false.B,
											(de_pipe_reg.ld_type === LD_LH || de_pipe_reg.ld_type === LD_LHU) -> (alu_out(0) =/= 0.U),
											(de_pipe_reg.ld_type === LD_LW || de_pipe_reg.ld_type === LWU)	-> (alu_out(1, 0) =/= 0.U),
											(de_pipe_reg.ld_type === LD_LD) -> (alu_out(2,0) =/= 0.U))
										)
	csr.io.load_misalign_addr := alu_sum
	csr.io.store_misalign_addr := alu_sum

	when(flush_em){
		em_pipe_reg.inst := Instructions.NOP
		em_pipe_reg.dest := 0.U
		em_pipe_reg.alu_out := 0.U
		em_pipe_reg.alu_sum := 0.U
		em_pipe_reg.csr_read_data := 0.U
		em_pipe_reg.csr_write_op := 0.U
		em_pipe_reg.csr_write_addr := 0.U
		em_pipe_reg.csr_write_data := 0.U
		em_pipe_reg.st_type := ST_XXX
		em_pipe_reg.ld_type := LD_XXX
		em_pipe_reg.wb_sel := WB_ALU
		em_pipe_reg.wb_en := false.B
	//	em_pipe_reg.extend := de_pipe_reg.extend
		em_pipe_reg.pc := 0.U
//		em_pipe_reg.is_illegal := false.B
		em_pipe_reg.is_kill := false.B
//		em_pipe_reg.fetch_misalign := false.B
//		em_pipe_reg.load_misalign := false.B
//		em_pipe_reg.store_misalign := false.B
	}.elsewhen(!stall){
		em_pipe_reg.inst := de_pipe_reg.inst
		em_pipe_reg.dest := de_pipe_reg.dest
		em_pipe_reg.alu_out := alu_out
		em_pipe_reg.alu_sum := alu_sum
		em_pipe_reg.csr_read_data := de_pipe_reg.csr_read_data
		em_pipe_reg.csr_write_op := de_pipe_reg.csr_write_op
		em_pipe_reg.csr_write_addr := de_pipe_reg.csr_write_addr
		em_pipe_reg.csr_write_data := de_pipe_reg.csr_write_data
		em_pipe_reg.st_type := de_pipe_reg.st_type
		em_pipe_reg.ld_type := de_pipe_reg.ld_type
		em_pipe_reg.wb_sel := de_pipe_reg.wb_sel
		em_pipe_reg.wb_en := de_pipe_reg.wb_en
	//	em_pipe_reg.extend := de_pipe_reg.extend
		em_pipe_reg.pc := de_pipe_reg.pc
//		em_pipe_reg.is_illegal := de_pipe_reg.is_illegal
		em_pipe_reg.is_kill := de_pipe_reg.is_kill
//		em_pipe_reg.fetch_misalign := de_pipe_reg.fetch_misalign
/*		em_pipe_reg.load_misalign := (de_pipe_reg.ld_type =/= LD_XXX) && 
										MuxCase(false.B,
											IndexedSeq(
											(de_pipe_reg.ld_type === LD_LB || de_pipe_reg.ld_type === LD_LBU) -> false.B,
											(de_pipe_reg.ld_type === LD_LH || de_pipe_reg.ld_type === LD_LHU) -> (alu_out(0) =/= 0.U),
											(de_pipe_reg.ld_type === LD_LW || de_pipe_reg.ld_type === LWU)	-> (alu_out(1, 0) =/= 0.U),
											(de_pipe_reg.ld_type === LD_LD) -> (alu_out(2,0) =/= 0.U))
										)
		em_pipe_reg.store_misalign := (de_pipe_reg.st_type =/= ST_XXX) && 
										MuxCase(false.B,
											IndexedSeq(
											(de_pipe_reg.st_type === ST_SB) -> false.B,
											(de_pipe_reg.st_type === ST_SH) -> (alu_out(0) =/= 0.U),
											(de_pipe_reg.st_type === ST_SW) -> (alu_out(1, 0) =/= 0.U),
											(de_pipe_reg.st_type === ST_SD) -> (alu_out(2, 0) =/= 0.U))
										)*/
	}

	/****** Mem *********/
	dmem.io.enable := (de_pipe_reg.st_type.orR) || (de_pipe_reg.ld_type.orR)
	dmem.io.wen := de_pipe_reg.st_type.orR
	dmem.io.raddr := Mux(!stall, em_pipe_reg.alu_sum, alu_sum)
	dmem.io.waddr := Mux(!stall, em_pipe_reg.alu_sum, alu_sum)
	dmem.io.wdata := (de_pipe_reg.rs2 << (alu_out(2, 0) << 3.U))(63, 0)
	val st_mask = Mux(de_pipe_reg.st_type === ST_SW, "b00001111".U, 
						Mux(de_pipe_reg.st_type === ST_SH, "b00000011".U,
							Mux(de_pipe_reg.st_type === ST_SB, "b00000001".U, "b11111111".U)
						)
					)
	
	dmem.io.mask := Mux(st_mask === "b11111111".U, st_mask(7, 0), (st_mask << alu_out(2,0))(7, 0))
	val load_data = dmem.io.rdata >> ((alu_out & "h07".U) << 3.U)
	val load_data_ext = Mux(em_pipe_reg.ld_type === LD_LW, Cat(Mux(load_data(31).asBool, "hffffffff".U, 0.U(32.W)), load_data(31, 0)),
							Mux(em_pipe_reg.ld_type === LD_LWU, Cat(Fill(32, 0.U), load_data(31, 0)),
								Mux(em_pipe_reg.ld_type === LD_LH, Cat(Mux(load_data(15).asBool, "hffffffffffff".U, 0.U(48.W)), load_data(15, 0)),
									Mux(em_pipe_reg.ld_type === LD_LHU, Cat(Fill(48, 0.U), load_data(15, 0)),
										Mux(em_pipe_reg.ld_type === LD_LB, Cat(Mux(load_data(7).asBool, "hffffffffffffff".U, 0.U(56.W)), load_data(7, 0)),
											Mux(em_pipe_reg.ld_type === LD_LBU, Cat(Fill(56, 0.U), load_data(7,0)), load_data)
											)
										)
									)
								)
							)

	when(flush_mw){
		mw_pipe_reg.load_data := 0.U
		mw_pipe_reg.alu_out := 0.U
		mw_pipe_reg.dest := 0.U
		mw_pipe_reg.wb_sel := WB_ALU
		mw_pipe_reg.wb_en := false.B
		mw_pipe_reg.pc := 0.U
		mw_pipe_reg.inst := Instructions.NOP
		mw_pipe_reg.csr_read_data := 0.U
		mw_pipe_reg.csr_write_op := 0.U
		mw_pipe_reg.csr_write_data := 0.U
		mw_pipe_reg.csr_write_addr := 0.U
	//	mw_pipe_reg.extend := em_pipe_reg.extend
//		mw_pipe_reg.fetch_misalign := false.B					
//		mw_pipe_reg.load_misalign := false.B
//		mw_pipe_reg.store_misalign := false.B
//		mw_pipe_reg.is_illegal := false.B

	}.elsewhen(!stall){
		mw_pipe_reg.load_data := load_data_ext
		mw_pipe_reg.alu_out := em_pipe_reg.alu_out
		mw_pipe_reg.dest := em_pipe_reg.dest
		mw_pipe_reg.wb_sel := em_pipe_reg.wb_sel
		mw_pipe_reg.wb_en := em_pipe_reg.wb_en
		mw_pipe_reg.pc := em_pipe_reg.pc
		mw_pipe_reg.inst := em_pipe_reg.inst
		mw_pipe_reg.csr_read_data := em_pipe_reg.csr_read_data
		mw_pipe_reg.csr_write_op := em_pipe_reg.csr_write_op
		mw_pipe_reg.csr_write_data := em_pipe_reg.csr_write_data
		mw_pipe_reg.csr_write_addr := em_pipe_reg.csr_write_addr
	//	mw_pipe_reg.extend := em_pipe_reg.extend
//		mw_pipe_reg.fetch_misalign := em_pipe_reg.fetch_misalign					
//		mw_pipe_reg.load_misalign := em_pipe_reg.load_misalign
//		mw_pipe_reg.store_misalign := em_pipe_reg.store_misalign
//		mw_pipe_reg.is_illegal := em_pipe_reg.is_illegal
	}

	/****** Writeback ***/

	csr.io.w_op := mw_pipe_reg.csr_write_op
	csr.io.w_addr := mw_pipe_reg.csr_write_addr
	csr.io.w_data := mw_pipe_reg.csr_write_data
	csr.io.inst := mw_pipe_reg.inst
	csr.io.ebreak_addr := mw_pipe_reg.pc
	csr.io.retired := mw_pipe_reg.inst =/= Instructions.NOP
	csr.io.isSret := mw_pipe_reg.inst === Instructions.SRET
	csr.io.isMret := mw_pipe_reg.inst === Instructions.MRET
	csr.io.excPC := mw_pipe_reg.pc
	csr.io.stall := stall 
	io.pc := mw_pipe_reg.pc

	regFile.io.wen := (mw_pipe_reg.wb_sel === WB_ALU ||
						mw_pipe_reg.wb_sel === WB_PC4 ||
						mw_pipe_reg.wb_sel === WB_MEM || mw_pipe_reg.wb_sel === WB_CSR) && (mw_pipe_reg.wb_en)
	regFile.io.waddr := mw_pipe_reg.dest
	regFile.io.wdata := Mux(mw_pipe_reg.wb_sel === WB_ALU, mw_pipe_reg.alu_out,
						Mux(mw_pipe_reg.wb_sel === WB_PC4, mw_pipe_reg.pc + 4.U, 
							Mux(mw_pipe_reg.wb_sel === WB_CSR, mw_pipe_reg.csr_read_data, mw_pipe_reg.load_data)))
}

class myCPU extends Module{
	val io = IO(new Bundle{
		val pc = Output(UInt(64.W))
	})

	val datapath = Module(new Datapath) 
	val control = Module(new Control)
	datapath.io.ctrl <> control.io
	io.pc := datapath.io.pc
}

object Driver extends App{
    (new ChiselStage).emitVerilog(new myCPU, args)
}

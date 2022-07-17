package myCPU

import chisel3._ 
import chisel3.util._ 
import javax.print.event.PrintJobAttributeListener

object Control{
	val Y = true.B
	val N = false.B

	val PC_4 = 0.U(2.W)
	val PC_ALU = 1.U(2.W)
	val PC_0 = 2.U(2.W)

	val A_XXX = 0.U(1.W)
  	val A_PC = 0.U(1.W)
  	val A_RS1 = 1.U(1.W)

	val B_XXX = 0.U(1.W)
  	val B_IMM = 0.U(1.W)
  	val B_RS2 = 1.U(1.W)

	val W_D = 0.U(2.W)
	val W_W = 1.U(2.W)
	val W_H = 2.U(2.W)
	val W_B = 3.U(2.W)
 
	val IMM_X = 0.U(1.W)
	val IMM_I = 1.U(3.W)
	val IMM_S = 2.U(3.W)
	val IMM_U = 3.U(3.W)
	val IMM_J = 4.U(3.W)
	val IMM_B = 5.U(3.W)
	val IMM_Z = 6.U(3.W)

	val BR_XXX = 0.U(3.W)
	val BR_LTU = 1.U(3.W)
	val BR_LT = 2.U(3.W)
	val BR_EQ = 3.U(3.W)
	val BR_GEU = 4.U(3.W)
	val BR_GE = 5.U(3.W)
	val BR_NE = 6.U(3.W)

	val ST_XXX = 0.U(3.W)
	val ST_SW = 1.U(3.W)
	val ST_SH = 2.U(3.W)
	val ST_SB = 3.U(3.W)
	val ST_SD = 4.U(3.W)

	val LD_XXX = 0.U(3.W)
	val LD_LW = 1.U(3.W)
	val LD_LH = 2.U(3.W)
	val LD_LB = 3.U(3.W)
	val LD_LBU = 5.U(3.W)
	val LD_LHU = 4.U(3.W)
	val LD_LWU = 6.U(3.W)
	val LD_LD = 7.U(3.W)

	val WB_ALU = 0.U(2.W)
	val WB_MEM = 1.U(2.W)
	val WB_PC4 = 2.U(2.W)
	val WB_CSR = 3.U(2.W)

	val EX_S = 0.U(1.W)
	val EX_U = 1.U(1.W)

	import Instructions._ 
	import Alu._

	val default = 
		//
		//				PC_SEL		A_SEL	B_SEL	 WIDTH	IMM_SEL 	ALU_OP	 		BR_TYPE		ST_TYPE		LD_TYPE	 	WB_SEL		WB_EN	EXTEND
		//		
			   		List(PC_4,		A_XXX,	B_XXX,	 W_D,	IMM_U,		ALU_COPY_B,	 	BR_XXX, 	ST_XXX, 	LD_XXX,		WB_ALU,		Y,		EX_S)
	val map = Array(
		LUI 	-> 	List(PC_4, 		A_PC,	B_IMM,	 W_D,	IMM_U,	 	ALU_COPY_B,	 	BR_XXX,		ST_XXX, 	LD_XXX,		WB_ALU,		Y,		EX_S),
		AUIPC	->	List(PC_4,		A_PC,	B_IMM,	 W_D,	IMM_U,	 	ALU_ADD,		BR_XXX,		ST_XXX,		LD_XXX,		WB_ALU,		Y,		EX_S),
		JAL 	->	List(PC_ALU,	A_PC,	B_IMM,	 W_D,	IMM_J,	 	ALU_ADD,		BR_XXX,		ST_XXX,		LD_XXX,		WB_PC4,		Y,		EX_S),
		JALR 	->	List(PC_ALU,	A_RS1,	B_IMM,	 W_D,	IMM_I,		ALU_ADD,		BR_XXX,		ST_XXX,		LD_XXX,		WB_PC4,		Y,		EX_S),
		BEQ 	->	List(PC_4,		A_PC,	B_IMM,	 W_D,	IMM_B,		ALU_ADD,		BR_EQ,		ST_XXX,		LD_XXX,		WB_ALU,		N,		EX_S),
		BNE 	->	List(PC_4,		A_PC,	B_IMM,	 W_D,	IMM_B,		ALU_ADD,		BR_NE,		ST_XXX,		LD_XXX,		WB_ALU,		N,		EX_S),
		BLT 	->	List(PC_4,		A_PC,	B_IMM,	 W_D,	IMM_B,		ALU_ADD,		BR_LT,		ST_XXX,		LD_XXX,		WB_ALU,		N,		EX_S),
		BGE 	->	List(PC_4,		A_PC,	B_IMM,	 W_D,	IMM_B,		ALU_ADD,		BR_GE,		ST_XXX,		LD_XXX,		WB_ALU,		N,		EX_S),
		BLTU 	->	List(PC_4,		A_PC,	B_IMM,	 W_D,	IMM_B,		ALU_ADD,		BR_LTU,		ST_XXX,		LD_XXX,		WB_ALU,		N,		EX_S),
		BGEU 	->	List(PC_4,		A_PC,	B_IMM,	 W_D,	IMM_B,		ALU_ADD,		BR_GEU,		ST_XXX,		LD_XXX,		WB_ALU,		N,		EX_S),
		LB 		->	List(PC_4,		A_RS1,	B_IMM,	 W_D,	IMM_I,		ALU_ADD,		BR_XXX,		ST_XXX,		LD_LB,		WB_MEM,		Y,		EX_S),
		LH 		->	List(PC_4,		A_RS1,	B_IMM,	 W_D,	IMM_I,		ALU_ADD,		BR_XXX,		ST_XXX,		LD_LH,		WB_MEM,		Y,		EX_S),
		LW 		->	List(PC_4,		A_RS1,	B_IMM,	 W_D,	IMM_I,		ALU_ADD,		BR_XXX,		ST_XXX,		LD_LW,		WB_MEM,		Y,		EX_S),
		LBU 	->	List(PC_4,		A_RS1,	B_IMM,	 W_D,	IMM_I,		ALU_ADD,		BR_XXX,		ST_XXX,		LD_LBU,		WB_MEM,		Y,		EX_U),
		LHU		->	List(PC_4,		A_RS1,	B_IMM,	 W_D,	IMM_I,		ALU_ADD,		BR_XXX,		ST_XXX,		LD_LHU,		WB_MEM,		Y,		EX_U),
		LWU		->	List(PC_4,		A_RS1,	B_IMM,	 W_D,	IMM_I,		ALU_ADD,		BR_XXX,		ST_XXX,		LD_LWU,		WB_MEM,		Y,		EX_U),
		LD 		-> 	List(PC_4,		A_RS1,	B_IMM,	 W_D,	IMM_I,		ALU_ADD,		BR_XXX,		ST_XXX,		LD_LD,		WB_MEM,		Y,		EX_S),
		SB 		->	List(PC_4,		A_RS1,	B_IMM,	 W_D,	IMM_S,		ALU_ADD,		BR_XXX,		ST_SB,		LD_XXX,		WB_ALU,		N,		EX_S),
		SH 		->	List(PC_4, 		A_RS1,	B_IMM,	 W_D,	IMM_S,		ALU_ADD,		BR_XXX,		ST_SH,		LD_XXX,		WB_ALU,		N,		EX_S),
		SW 		->	List(PC_4,		A_RS1,	B_IMM,	 W_D,	IMM_S,		ALU_ADD,		BR_XXX,		ST_SW,		LD_XXX,		WB_ALU,		N,		EX_S),
		SD 		->	List(PC_4,		A_RS1,	B_IMM,	 W_D,	IMM_S,		ALU_ADD,		BR_XXX,		ST_SD,		LD_XXX,		WB_ALU,		N,		EX_S),
		ADDI	->	List(PC_4,		A_RS1,	B_IMM,	 W_D,	IMM_I,		ALU_ADD,		BR_XXX,		ST_XXX,		LD_XXX,		WB_ALU,		Y,		EX_S),
		ADDIW	->  List(PC_4,		A_RS1,	B_IMM,	 W_W,	IMM_I,		ALU_ADD,		BR_XXX,		ST_XXX,		LD_XXX,		WB_ALU,		Y,		EX_S),
		SLTI	->	List(PC_4,		A_RS1,	B_IMM,	 W_D,	IMM_I,		ALU_SLT,		BR_XXX,		ST_XXX,		LD_XXX,		WB_ALU,		Y,		EX_S),
		SLTIU	->	List(PC_4,		A_RS1,	B_IMM,	 W_D,	IMM_I,		ALU_SLTU,		BR_XXX,		ST_XXX,		LD_XXX,		WB_ALU,		Y,		EX_S),
		XORI	->	List(PC_4,		A_RS1,	B_IMM,	 W_D,	IMM_I,		ALU_XOR,		BR_XXX,		ST_XXX,		LD_XXX,		WB_ALU,		Y,		EX_S),
		ORI		->	List(PC_4,		A_RS1,	B_IMM,	 W_D,	IMM_I,		ALU_OR,			BR_XXX,		ST_XXX,		LD_XXX,		WB_ALU,		Y,		EX_S),
		ANDI	->	List(PC_4,		A_RS1,	B_IMM,	 W_D,	IMM_I,		ALU_AND,		BR_XXX,		ST_XXX,		LD_XXX,		WB_ALU,		Y,		EX_S),
		SLLI 	->	List(PC_4,		A_RS1,	B_IMM,	 W_D,	IMM_I,		ALU_SLL,		BR_XXX,		ST_XXX,		LD_XXX,		WB_ALU,		Y,		EX_S),
		SLLIW	->	List(PC_4,		A_RS1,	B_IMM,	 W_W,	IMM_I,		ALU_SLL,		BR_XXX,		ST_XXX,		LD_XXX,		WB_ALU,		Y,		EX_S),
		SRLI	->	List(PC_4,		A_RS1,	B_IMM,	 W_D,	IMM_I,		ALU_SRL,		BR_XXX,		ST_XXX,		LD_XXX,		WB_ALU,		Y,		EX_S),
		SRLIW	->	List(PC_4,		A_RS1,	B_IMM,	 W_W,	IMM_I,		ALU_SRL,		BR_XXX,		ST_XXX,		LD_XXX,		WB_ALU,		Y,		EX_S),
		SRAI	-> 	List(PC_4,		A_RS1,	B_IMM,	 W_D,	IMM_I,		ALU_SRA,		BR_XXX,		ST_XXX,		LD_XXX,		WB_ALU,		Y,		EX_S),
		SRAIW	->	List(PC_4,		A_RS1,	B_IMM,	 W_W,	IMM_I,		ALU_SRA,		BR_XXX,		ST_XXX,		LD_XXX,		WB_ALU,		Y,		EX_S),
		ADD 	-> 	List(PC_4,		A_RS1,	B_RS2,	 W_D,	IMM_X,		ALU_ADD,		BR_XXX,		ST_XXX,		LD_XXX,		WB_ALU,		Y,		EX_S),
		ADDW	-> 	List(PC_4,		A_RS1,	B_RS2,	 W_W,	IMM_X,		ALU_ADD,		BR_XXX,		ST_XXX,		LD_XXX,		WB_ALU,		Y,		EX_S),
		SUB 	->	List(PC_4,		A_RS1,	B_RS2,	 W_D,	IMM_X,		ALU_SUB,		BR_XXX,		ST_XXX,		LD_XXX,		WB_ALU,		Y,		EX_S),
		SUBW	->	List(PC_4,		A_RS1, 	B_RS2,	 W_W,	IMM_X,		ALU_SUB,		BR_XXX,		ST_XXX,		LD_XXX,		WB_ALU,		Y,		EX_S),
		SLL 	->	List(PC_4,		A_RS1,	B_RS2,	 W_D,	IMM_X,		ALU_SLL,		BR_XXX,		ST_XXX,		LD_XXX,		WB_ALU,		Y,		EX_S),
		SLLW	->	List(PC_4,		A_RS1,	B_RS2,	 W_W,	IMM_X,		ALU_SLL,		BR_XXX,		ST_XXX,		LD_XXX,		WB_ALU,		Y,		EX_S),
		SLT 	->  List(PC_4,		A_RS1,	B_RS2,	 W_D,	IMM_X,		ALU_SLT,		BR_XXX,		ST_XXX,		LD_XXX,		WB_ALU,		Y,		EX_S),
		SLTU 	->	List(PC_4,		A_RS1,	B_RS2,	 W_D,	IMM_X,		ALU_SLTU,		BR_XXX,		ST_XXX,		LD_XXX,		WB_ALU,		Y,		EX_S),
		XOR 	->  List(PC_4,		A_RS1,	B_RS2,	 W_D,	IMM_X,		ALU_XOR,		BR_XXX,		ST_XXX,		LD_XXX,		WB_ALU,		Y,		EX_S),
		SRL 	-> 	List(PC_4,		A_RS1,	B_RS2,	 W_D,	IMM_X,		ALU_SRL,		BR_XXX,		ST_XXX,		LD_XXX,		WB_ALU,		Y,		EX_S),
		SRLW	->	List(PC_4,		A_RS1,	B_RS2,	 W_W,	IMM_X,		ALU_SRL,		BR_XXX,		ST_XXX,		LD_XXX,		WB_ALU,		Y,		EX_S),
		SRA		->	List(PC_4,		A_RS1,	B_RS2,	 W_D,	IMM_X,		ALU_SRA,		BR_XXX,		ST_XXX,		LD_XXX,		WB_ALU,		Y,		EX_S),
		SRAW	->	List(PC_4,		A_RS1,	B_RS2,	 W_W,	IMM_X,		ALU_SRA,		BR_XXX,		ST_XXX,		LD_XXX,		WB_ALU,		Y,		EX_S),
		OR		->	List(PC_4,		A_RS1,	B_RS2,	 W_D,	IMM_X,		ALU_OR,			BR_XXX,		ST_XXX,		LD_XXX,		WB_ALU,		Y,		EX_S),
		AND 	-> 	List(PC_4,		A_RS1,	B_RS2,	 W_D,	IMM_X,		ALU_AND,		BR_XXX,		ST_XXX,		LD_XXX,		WB_ALU,		Y,		EX_S),
		MUL 	->	List(PC_4,		A_RS1,	B_RS2,	 W_D,	IMM_X,		ALU_MUL,		BR_XXX,		ST_XXX,		LD_XXX,		WB_ALU,		Y,		EX_S),
		MULW	->	List(PC_4,		A_RS1,	B_RS2,	 W_W,	IMM_X,		ALU_MUL,		BR_XXX,		ST_XXX,		LD_XXX,		WB_ALU,		Y,		EX_S),
		DIV 	->	List(PC_4,		A_RS1,	B_RS2,	 W_D,	IMM_X,		ALU_DIV,		BR_XXX,		ST_XXX,		LD_XXX,		WB_ALU,		Y,		EX_S),
		DIVW 	-> 	List(PC_4,		A_RS1,	B_RS2,	 W_W,	IMM_X,		ALU_DIV,		BR_XXX,		ST_XXX,		LD_XXX,		WB_ALU,		Y,		EX_S),
		REM		->	List(PC_4,		A_RS1,	B_RS2,	 W_D,	IMM_X,		ALU_REM,		BR_XXX,		ST_XXX,		LD_XXX,		WB_ALU,		Y,		EX_S),
		REMW	->	List(PC_4,		A_RS1,	B_RS2,	 W_W,	IMM_X,		ALU_REM,		BR_XXX,		ST_XXX,		LD_XXX,		WB_ALU,		Y,		EX_S),
		EBREAK 	->	List(PC_4,		A_XXX,	B_XXX,	 W_D,	IMM_X,		ALU_XXX,		BR_XXX,		ST_XXX,		LD_XXX,		WB_CSR,		N,		EX_S)
	)

}


class ControlSignals extends Bundle{
	val inst = Input(UInt(32.W))
	val pc_sel  = Output(UInt(2.W))
	val A_sel = Output(UInt(1.W))
	val B_sel = Output(UInt(1.W))
	val wd_type = Output(UInt(2.W))
	val imm_sel = Output(UInt(3.W))
	val br_type = Output(UInt(3.W))
	val st_type = Output(UInt(3.W))
	val ld_type = Output(UInt(3.W))
	val wb_sel = Output(UInt(2.W))
	val wb_en = Output(Bool())
	val alu_op = Output(UInt(4.W))
}

class Control extends Module{
	val io = IO(new ControlSignals)
	val ctrlSignals = ListLookup(io.inst, Control.default, Control.map)

	io.pc_sel := ctrlSignals(0)

	io.A_sel := ctrlSignals(1)
	io.B_sel := ctrlSignals(2)
	io.wd_type := ctrlSignals(3)
	io.imm_sel := ctrlSignals(4)
	io.alu_op := ctrlSignals(5)
	io.br_type := ctrlSignals(6)
	io.st_type := ctrlSignals(7)
	
	io.ld_type := ctrlSignals(8)
	io.wb_sel := ctrlSignals(9)
	io.wb_en := ctrlSignals(10).asBool

}
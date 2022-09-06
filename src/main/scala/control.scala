package myCPU

import chisel3._ 
import chisel3.util._ 
import CSR._ 
import CSR_OP._ 
import javax.print.event.PrintJobAttributeListener

object Control{
	val Y = true.B
	val N = false.B

	val PC_4 = 0.U(3.W)
	val PC_ALU = 1.U(3.W)
	val PC_0 = 2.U(3.W)
	val PC_EPC = 3.U(3.W)
	val PC_FENCE = 4.U(3.W)

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

//	val CSR_MODE_U = 0.U(1.W)
//	val EX_U = 1.U(1.W)

	import Instructions._ 
	import Alu._

	val default = 
		//
		//				PC_SEL		A_SEL	B_SEL	 WIDTH	IMM_SEL 	ALU_OP	 		BR_TYPE		ST_TYPE		LD_TYPE	 	WB_SEL		WB_EN	PRV			csr_cmd	 	illegal	 kill
		//		
			   		List(PC_4,		A_XXX,	B_XXX,	 W_D,	IMM_U,		ALU_COPY_B,	 	BR_XXX, 	ST_XXX, 	LD_XXX,		WB_ALU,		Y,		CSR_MODE_U,	CSR_NOP,		Y,		N)
	val map = Array(
		LUI 	-> 	List(PC_4, 		A_PC,	B_IMM,	 W_D,	IMM_U,	 	ALU_COPY_B,	 	BR_XXX,		ST_XXX, 	LD_XXX,		WB_ALU,		Y,		CSR_MODE_U,	CSR_NOP,		N,		N),
		AUIPC	->	List(PC_4,		A_PC,	B_IMM,	 W_D,	IMM_U,	 	ALU_ADD,		BR_XXX,		ST_XXX,		LD_XXX,		WB_ALU,		Y,		CSR_MODE_U,	CSR_NOP,		N,		N),
		JAL 	->	List(PC_ALU,	A_PC,	B_IMM,	 W_D,	IMM_J,	 	ALU_ADD,		BR_XXX,		ST_XXX,		LD_XXX,		WB_PC4,		Y,		CSR_MODE_U,	CSR_NOP,		N,		Y),
		JALR 	->	List(PC_ALU,	A_RS1,	B_IMM,	 W_D,	IMM_I,		ALU_ADD,		BR_XXX,		ST_XXX,		LD_XXX,		WB_PC4,		Y,		CSR_MODE_U,	CSR_NOP,		N,		Y),
		BEQ 	->	List(PC_4,		A_PC,	B_IMM,	 W_D,	IMM_B,		ALU_ADD,		BR_EQ,		ST_XXX,		LD_XXX,		WB_ALU,		N,		CSR_MODE_U,	CSR_NOP,		N,		N),
		BNE 	->	List(PC_4,		A_PC,	B_IMM,	 W_D,	IMM_B,		ALU_ADD,		BR_NE,		ST_XXX,		LD_XXX,		WB_ALU,		N,		CSR_MODE_U,	CSR_NOP,		N,		N),
		BLT 	->	List(PC_4,		A_PC,	B_IMM,	 W_D,	IMM_B,		ALU_ADD,		BR_LT,		ST_XXX,		LD_XXX,		WB_ALU,		N,		CSR_MODE_U,	CSR_NOP,		N,		N),
		BGE 	->	List(PC_4,		A_PC,	B_IMM,	 W_D,	IMM_B,		ALU_ADD,		BR_GE,		ST_XXX,		LD_XXX,		WB_ALU,		N,		CSR_MODE_U,	CSR_NOP,		N,		N),
		BLTU 	->	List(PC_4,		A_PC,	B_IMM,	 W_D,	IMM_B,		ALU_ADD,		BR_LTU,		ST_XXX,		LD_XXX,		WB_ALU,		N,		CSR_MODE_U,	CSR_NOP,		N,		N),
		BGEU 	->	List(PC_4,		A_PC,	B_IMM,	 W_D,	IMM_B,		ALU_ADD,		BR_GEU,		ST_XXX,		LD_XXX,		WB_ALU,		N,		CSR_MODE_U,	CSR_NOP,		N,		N),
		LB 		->	List(PC_4,		A_RS1,	B_IMM,	 W_D,	IMM_I,		ALU_ADD,		BR_XXX,		ST_XXX,		LD_LB,		WB_MEM,		Y,		CSR_MODE_U,	CSR_NOP,		N,		N),
		LH 		->	List(PC_4,		A_RS1,	B_IMM,	 W_D,	IMM_I,		ALU_ADD,		BR_XXX,		ST_XXX,		LD_LH,		WB_MEM,		Y,		CSR_MODE_U,	CSR_NOP,		N,		N),
		LW 		->	List(PC_4,		A_RS1,	B_IMM,	 W_D,	IMM_I,		ALU_ADD,		BR_XXX,		ST_XXX,		LD_LW,		WB_MEM,		Y,		CSR_MODE_U,	CSR_NOP,		N,		N),
		LBU 	->	List(PC_4,		A_RS1,	B_IMM,	 W_D,	IMM_I,		ALU_ADD,		BR_XXX,		ST_XXX,		LD_LBU,		WB_MEM,		Y,		CSR_MODE_U,	CSR_NOP,		N,		N),
		LHU		->	List(PC_4,		A_RS1,	B_IMM,	 W_D,	IMM_I,		ALU_ADD,		BR_XXX,		ST_XXX,		LD_LHU,		WB_MEM,		Y,		CSR_MODE_U,	CSR_NOP,		N,		N),
		LWU		->	List(PC_4,		A_RS1,	B_IMM,	 W_D,	IMM_I,		ALU_ADD,		BR_XXX,		ST_XXX,		LD_LWU,		WB_MEM,		Y,		CSR_MODE_U,	CSR_NOP,		N,		N),
		LD 		-> 	List(PC_4,		A_RS1,	B_IMM,	 W_D,	IMM_I,		ALU_ADD,		BR_XXX,		ST_XXX,		LD_LD,		WB_MEM,		Y,		CSR_MODE_U,	CSR_NOP, 		N,		N),
		SB 		->	List(PC_4,		A_RS1,	B_IMM,	 W_D,	IMM_S,		ALU_ADD,		BR_XXX,		ST_SB,		LD_XXX,		WB_ALU,		N,		CSR_MODE_U,	CSR_NOP,		N,		N),
		SH 		->	List(PC_4, 		A_RS1,	B_IMM,	 W_D,	IMM_S,		ALU_ADD,		BR_XXX,		ST_SH,		LD_XXX,		WB_ALU,		N,		CSR_MODE_U,	CSR_NOP,		N,		N),
		SW 		->	List(PC_4,		A_RS1,	B_IMM,	 W_D,	IMM_S,		ALU_ADD,		BR_XXX,		ST_SW,		LD_XXX,		WB_ALU,		N,		CSR_MODE_U,	CSR_NOP,		N,		N),
		SD 		->	List(PC_4,		A_RS1,	B_IMM,	 W_D,	IMM_S,		ALU_ADD,		BR_XXX,		ST_SD,		LD_XXX,		WB_ALU,		N,		CSR_MODE_U,	CSR_NOP, 		N,		N),
		ADDI	->	List(PC_4,		A_RS1,	B_IMM,	 W_D,	IMM_I,		ALU_ADD,		BR_XXX,		ST_XXX,		LD_XXX,		WB_ALU,		Y,		CSR_MODE_U,	CSR_NOP,		N,		N),
		ADDIW	->  List(PC_4,		A_RS1,	B_IMM,	 W_W,	IMM_I,		ALU_ADD,		BR_XXX,		ST_XXX,		LD_XXX,		WB_ALU,		Y,		CSR_MODE_U,	CSR_NOP,		N,		N),
		SLTI	->	List(PC_4,		A_RS1,	B_IMM,	 W_D,	IMM_I,		ALU_SLT,		BR_XXX,		ST_XXX,		LD_XXX,		WB_ALU,		Y,		CSR_MODE_U,	CSR_NOP,		N,		N),
		SLTIU	->	List(PC_4,		A_RS1,	B_IMM,	 W_D,	IMM_I,		ALU_SLTU,		BR_XXX,		ST_XXX,		LD_XXX,		WB_ALU,		Y,		CSR_MODE_U,	CSR_NOP,		N,		N),
		XORI	->	List(PC_4,		A_RS1,	B_IMM,	 W_D,	IMM_I,		ALU_XOR,		BR_XXX,		ST_XXX,		LD_XXX,		WB_ALU,		Y,		CSR_MODE_U,	CSR_NOP,		N,		N),
		ORI		->	List(PC_4,		A_RS1,	B_IMM,	 W_D,	IMM_I,		ALU_OR,			BR_XXX,		ST_XXX,		LD_XXX,		WB_ALU,		Y,		CSR_MODE_U,	CSR_NOP,		N,		N),
		ANDI	->	List(PC_4,		A_RS1,	B_IMM,	 W_D,	IMM_I,		ALU_AND,		BR_XXX,		ST_XXX,		LD_XXX,		WB_ALU,		Y,		CSR_MODE_U,	CSR_NOP,		N,		N),
		SLLI 	->	List(PC_4,		A_RS1,	B_IMM,	 W_D,	IMM_I,		ALU_SLL,		BR_XXX,		ST_XXX,		LD_XXX,		WB_ALU,		Y,		CSR_MODE_U,	CSR_NOP,		N,		N),
		SLLIW	->	List(PC_4,		A_RS1,	B_IMM,	 W_W,	IMM_I,		ALU_SLL,		BR_XXX,		ST_XXX,		LD_XXX,		WB_ALU,		Y,		CSR_MODE_U,	CSR_NOP,		N,		N),
		SRLI	->	List(PC_4,		A_RS1,	B_IMM,	 W_D,	IMM_I,		ALU_SRL,		BR_XXX,		ST_XXX,		LD_XXX,		WB_ALU,		Y,		CSR_MODE_U,	CSR_NOP,		N,		N),
		SRLIW	->	List(PC_4,		A_RS1,	B_IMM,	 W_W,	IMM_I,		ALU_SRL,		BR_XXX,		ST_XXX,		LD_XXX,		WB_ALU,		Y,		CSR_MODE_U,	CSR_NOP,		N,		N),
		SRAI	-> 	List(PC_4,		A_RS1,	B_IMM,	 W_D,	IMM_I,		ALU_SRA,		BR_XXX,		ST_XXX,		LD_XXX,		WB_ALU,		Y,		CSR_MODE_U,	CSR_NOP,		N,		N),
		SRAIW	->	List(PC_4,		A_RS1,	B_IMM,	 W_W,	IMM_I,		ALU_SRA,		BR_XXX,		ST_XXX,		LD_XXX,		WB_ALU,		Y,		CSR_MODE_U,	CSR_NOP,		N,		N),
		ADD 	-> 	List(PC_4,		A_RS1,	B_RS2,	 W_D,	IMM_X,		ALU_ADD,		BR_XXX,		ST_XXX,		LD_XXX,		WB_ALU,		Y,		CSR_MODE_U,	CSR_NOP,		N,		N),
		ADDW	-> 	List(PC_4,		A_RS1,	B_RS2,	 W_W,	IMM_X,		ALU_ADD,		BR_XXX,		ST_XXX,		LD_XXX,		WB_ALU,		Y,		CSR_MODE_U,	CSR_NOP,		N,		N),
		SUB 	->	List(PC_4,		A_RS1,	B_RS2,	 W_D,	IMM_X,		ALU_SUB,		BR_XXX,		ST_XXX,		LD_XXX,		WB_ALU,		Y,		CSR_MODE_U,	CSR_NOP,		N,		N),
		SUBW	->	List(PC_4,		A_RS1, 	B_RS2,	 W_W,	IMM_X,		ALU_SUB,		BR_XXX,		ST_XXX,		LD_XXX,		WB_ALU,		Y,		CSR_MODE_U,	CSR_NOP,		N,		N),
		SLL 	->	List(PC_4,		A_RS1,	B_RS2,	 W_D,	IMM_X,		ALU_SLL,		BR_XXX,		ST_XXX,		LD_XXX,		WB_ALU,		Y,		CSR_MODE_U,	CSR_NOP,		N,		N),
		SLLW	->	List(PC_4,		A_RS1,	B_RS2,	 W_W,	IMM_X,		ALU_SLL,		BR_XXX,		ST_XXX,		LD_XXX,		WB_ALU,		Y,		CSR_MODE_U,	CSR_NOP,		N,		N),
		SLT 	->  List(PC_4,		A_RS1,	B_RS2,	 W_D,	IMM_X,		ALU_SLT,		BR_XXX,		ST_XXX,		LD_XXX,		WB_ALU,		Y,		CSR_MODE_U,	CSR_NOP,		N,		N),
		SLTU 	->	List(PC_4,		A_RS1,	B_RS2,	 W_D,	IMM_X,		ALU_SLTU,		BR_XXX,		ST_XXX,		LD_XXX,		WB_ALU,		Y,		CSR_MODE_U,	CSR_NOP,		N,		N),
		XOR 	->  List(PC_4,		A_RS1,	B_RS2,	 W_D,	IMM_X,		ALU_XOR,		BR_XXX,		ST_XXX,		LD_XXX,		WB_ALU,		Y,		CSR_MODE_U,	CSR_NOP,		N,		N),
		SRL 	-> 	List(PC_4,		A_RS1,	B_RS2,	 W_D,	IMM_X,		ALU_SRL,		BR_XXX,		ST_XXX,		LD_XXX,		WB_ALU,		Y,		CSR_MODE_U,	CSR_NOP,		N,		N),
		SRLW	->	List(PC_4,		A_RS1,	B_RS2,	 W_W,	IMM_X,		ALU_SRL,		BR_XXX,		ST_XXX,		LD_XXX,		WB_ALU,		Y,		CSR_MODE_U,	CSR_NOP,		N,		N),
		SRA		->	List(PC_4,		A_RS1,	B_RS2,	 W_D,	IMM_X,		ALU_SRA,		BR_XXX,		ST_XXX,		LD_XXX,		WB_ALU,		Y,		CSR_MODE_U,	CSR_NOP,		N,		N),
		SRAW	->	List(PC_4,		A_RS1,	B_RS2,	 W_W,	IMM_X,		ALU_SRA,		BR_XXX,		ST_XXX,		LD_XXX,		WB_ALU,		Y,		CSR_MODE_U,	CSR_NOP,		N,		N),
		OR		->	List(PC_4,		A_RS1,	B_RS2,	 W_D,	IMM_X,		ALU_OR,			BR_XXX,		ST_XXX,		LD_XXX,		WB_ALU,		Y,		CSR_MODE_U,	CSR_NOP,		N,		N),
		AND 	-> 	List(PC_4,		A_RS1,	B_RS2,	 W_D,	IMM_X,		ALU_AND,		BR_XXX,		ST_XXX,		LD_XXX,		WB_ALU,		Y,		CSR_MODE_U,	CSR_NOP,		N,		N),
		MUL 	->	List(PC_4,		A_RS1,	B_RS2,	 W_D,	IMM_X,		ALU_MUL,		BR_XXX,		ST_XXX,		LD_XXX,		WB_ALU,		Y,		CSR_MODE_U,	CSR_NOP,		N,		N),
		MULW	->	List(PC_4,		A_RS1,	B_RS2,	 W_W,	IMM_X,		ALU_MUL,		BR_XXX,		ST_XXX,		LD_XXX,		WB_ALU,		Y,		CSR_MODE_U,	CSR_NOP,		N,		N),
		MULH	->	List(PC_4,		A_RS1,  B_RS2,	 W_D,	IMM_X,		ALU_MUL,		BR_XXX,		ST_XXX,		LD_XXX,		WB_ALU,		Y,		CSR_MODE_U,	CSR_NOP,		N,		N),
		MULHU	->	List(PC_4, 		A_RS1,	B_RS2,	 W_D,	IMM_X,		ALU_MUL,		BR_XXX,		ST_XXX,		LD_XXX,		WB_ALU,		Y,		CSR_MODE_U,	CSR_NOP,		N,		N),
		MULHSU	->	List(PC_4,		A_RS1, 	B_RS2,	 W_D,	IMM_X,		ALU_MUL,		BR_XXX,		ST_XXX,		LD_XXX,		WB_ALU,		Y,		CSR_MODE_U,	CSR_NOP,		N,		N),
		DIV 	->	List(PC_4,		A_RS1,	B_RS2,	 W_D,	IMM_X,		ALU_DIV,		BR_XXX,		ST_XXX,		LD_XXX,		WB_ALU,		Y,		CSR_MODE_U,	CSR_NOP,		N,		N),
		DIVU	->  List(PC_4, 		A_RS1, 	B_RS2,	 W_D,	IMM_X,		ALU_DIVU,		BR_XXX,		ST_XXX,		LD_XXX,		WB_ALU,		Y,		CSR_MODE_U,	CSR_NOP,		N,		N),
		DIVW 	-> 	List(PC_4,		A_RS1,	B_RS2,	 W_W,	IMM_X,		ALU_DIV,		BR_XXX,		ST_XXX,		LD_XXX,		WB_ALU,		Y,		CSR_MODE_U,	CSR_NOP,		N,		N),
		DIVUW	->	List(PC_4,		A_RS1,	B_RS2,	 W_W,	IMM_X,		ALU_DIVU,		BR_XXX,		ST_XXX,		LD_XXX,		WB_ALU,		Y,		CSR_MODE_U,	CSR_NOP,		N,		N),
		REM		->	List(PC_4,		A_RS1,	B_RS2,	 W_D,	IMM_X,		ALU_REM,		BR_XXX,		ST_XXX,		LD_XXX,		WB_ALU,		Y,		CSR_MODE_U,	CSR_NOP,		N,		N),
		REMU	->	List(PC_4,		A_RS1,	B_RS2,	 W_D,	IMM_X,		ALU_REMU,		BR_XXX,		ST_XXX,		LD_XXX,		WB_ALU,		Y,		CSR_MODE_U,	CSR_NOP,		N,		N),
		REMW	->	List(PC_4,		A_RS1,	B_RS2,	 W_W,	IMM_X,		ALU_REM,		BR_XXX,		ST_XXX,		LD_XXX,		WB_ALU,		Y,		CSR_MODE_U,	CSR_NOP,		N,		N),
		REMUW	->  List(PC_4,		A_RS1,	B_RS2,	 W_W,	IMM_X,		ALU_REMU,		BR_XXX,		ST_XXX,		LD_XXX,		WB_ALU,		Y,		CSR_MODE_U,	CSR_NOP,		N,		N),
		CSRRW	-> 	List(PC_0,		A_RS1,	B_XXX,	 W_D,	IMM_X,		ALU_COPY_A,		BR_XXX,		ST_XXX,		LD_XXX,		WB_CSR,		Y,		CSR_MODE_U,	CSR_RW,			N,		Y),
		CSRRS	->	List(PC_0,		A_RS1,	B_XXX,	 W_D,	IMM_X,		ALU_COPY_A,		BR_XXX,		ST_XXX,		LD_XXX,		WB_CSR,		Y,		CSR_MODE_U,	CSR.RS,			N,		Y),
		CSRRC	->	List(PC_0,		A_RS1,	B_XXX,	 W_D,	IMM_X,		ALU_COPY_A,		BR_XXX,		ST_XXX,		LD_XXX,		WB_CSR,		Y,		CSR_MODE_U,	CSR.RC,			N,		Y),
		CSRRWI	->	List(PC_0,		A_XXX,	B_XXX,	 W_D,	IMM_Z,		ALU_XXX,		BR_XXX,		ST_XXX,		LD_XXX,		WB_CSR,		Y,		CSR_MODE_U,	CSR.RW,			N,		Y),
		CSRRSI	->	List(PC_0,		A_XXX,	B_XXX,	 W_D,	IMM_Z,		ALU_XXX,		BR_XXX,		ST_XXX,		LD_XXX,		WB_CSR,		Y,		CSR_MODE_U,	CSR.RS,			N,		Y),
		CSRRCI	->	List(PC_0,		A_XXX,	B_XXX,	 W_D,	IMM_Z,		ALU_XXX,		BR_XXX,		ST_XXX,		LD_XXX,		WB_CSR,		Y,		CSR_MODE_U,	CSR.RC,			N,		Y),
		MRET 	-> 	List(PC_EPC,	A_XXX,	B_XXX,	 W_D,	IMM_X,		ALU_XXX,		BR_XXX,		ST_XXX,		LD_XXX,		WB_CSR,		N,		CSR_MODE_M,	CSR_NOP,		N,		Y),
		SRET	-> 	List(PC_EPC,	A_XXX,	B_XXX,	 W_D,	IMM_X,		ALU_XXX,		BR_XXX,		ST_XXX,		LD_XXX,		WB_CSR,		N,		CSR_MODE_S,	CSR_NOP,		N,		Y),
		ECALL 	-> 	List(PC_4,		A_XXX,	B_XXX,	 W_D,	IMM_X,		ALU_XXX,		BR_XXX,		ST_XXX,		LD_XXX,		WB_CSR,		N,		CSR_MODE_U,	CSR_NOP,		N,		N),
		EBREAK 	->	List(PC_4,		A_XXX,	B_XXX,	 W_D,	IMM_X,		ALU_XXX,		BR_XXX,		ST_XXX,		LD_XXX,		WB_CSR,		N,		CSR_MODE_U,	CSR_NOP,		N,		N),
		FENCE_I	->	List(PC_FENCE,	A_XXX,	B_XXX,	 W_D,	IMM_X,		ALU_XXX,		BR_XXX,		ST_XXX,		LD_XXX,		WB_ALU,		N,		CSR_MODE_U,	CSR_NOP,		N,		Y)
//		BitPat(NOP)	->	List(PC_4,		A_RS1,	B_IMM,	 W_D,	IMM_X,		ALU_XXX,		BR_XXX,		ST_XXX,		LD_XXX,		WB_CSR,		N,		CSR_MODE_U,	CSR_NOP,		N,		N)
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
	val alu_op = Output(UInt(5.W))
	val prv = Output(UInt(1.W))
	val csr_cmd = Output(UInt(3.W))
	val is_illegal = Output(Bool())
	val is_kill = Output(Bool())
}

//	PC_SEL		A_SEL	B_SEL	 WIDTH	IMM_SEL 	ALU_OP	 		BR_TYPE		ST_TYPE		LD_TYPE	 	WB_SEL		WB_EN	PRV			csr_cmd	 	illegal	 kill
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
	io.prv := ctrlSignals(11)
	io.csr_cmd := ctrlSignals(12)
	io.is_illegal := ctrlSignals(13)
	io.is_kill := ctrlSignals(14)
}
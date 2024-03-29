package myCPU
import chisel3._ 
import chisel3.util.BitPat

object Instructions {
	//----------------------|-------*****-----***-----*******
	// U means load the unsigned number, while load the signed number in default
	def LB		=   BitPat("b?????????????????000?????0000011")	//byte 
	def LBU		= 	BitPat("b?????????????????100?????0000011")
	def LH		= 	BitPat("b?????????????????001?????0000011")	//half word
	def LHU		= 	BitPat("b?????????????????101?????0000011")
	def LW		= 	BitPat("b?????????????????010?????0000011")	//word
	def LWU		=   BitPat("b?????????????????110?????0000011")
	def LD		= 	BitPat("b?????????????????011?????0000011")	//double word

	def SB		=   BitPat("b?????????????????000?????0100011")
	def SH		=	BitPat("b?????????????????001?????0100011")
	def SW 		=   BitPat("b?????????????????010?????0100011")
	def SD 	 	= 	BitPat("b?????????????????011?????0100011")

	def SLL		= 	BitPat("b0000000??????????001?????0110011")
	def SLLW	=	BitPat("b0000000??????????001?????0111011")	
	def SLLI	=	BitPat("b000000???????????001?????0010011")
	def SLLIW 	= 	BitPat("b0000000??????????001?????0011011")
	def SRL		= 	BitPat("b0000000??????????101?????0110011")
	def SRLW	=	BitPat("b0000000??????????101?????0111011")
	def SRLI	=	BitPat("b000000???????????101?????0010011")
	def SRLIW	=	BitPat("b0000000??????????101?????0011011")
	def SRA 	= 	BitPat("b0100000??????????101?????0110011")
	def SRAW 	=	BitPat("b0100000??????????101?????0111011")
	def SRAI 	=	BitPat("b010000???????????101?????0010011")
	def SRAIW	=	BitPat("b0100000??????????101?????0011011")

	def ADD 	= 	BitPat("b0000000??????????000?????0110011")
	def ADDI	= 	BitPat("b?????????????????000?????0010011")
	def ADDW	= 	BitPat("b0000000??????????000?????0111011")
	def ADDIW	=	BitPat("b?????????????????000?????0011011")
	def SUB		= 	BitPat("b0100000??????????000?????0110011")
	def SUBW	=	BitPat("b0100000??????????000?????0111011")
	def LUI 	= 	BitPat("b?????????????????????????0110111")
	def AUIPC	=	BitPat("b?????????????????????????0010111")

	def MUL 	= 	BitPat("b0000001??????????000?????0110011")
	def MULH	=	BitPat("b0000001??????????001?????0110011") // mul high word
	def MULHSU	=	BitPat("b0000001??????????010?????0110011") 
	def MULHU 	= 	BitPat("b0000001??????????011?????0110011") 
	def MULW	=	BitPat("b0000001??????????000?????0111011")
	def DIV		=	BitPat("b0000001??????????100?????0110011")
	def DIVU	=	BitPat("b0000001??????????101?????0110011")
	def DIVW	=	BitPat("b0000001??????????100?????0111011")
	def DIVUW	=	BitPat("b0000001??????????101?????0111011")
	def REM 	= 	BitPat("b0000001??????????110?????0110011")
	def REMU	=	BitPat("b0000001??????????111?????0110011")
	def REMW	=	BitPat("b0000001??????????110?????0111011")
	def REMUW	=	BitPat("b0000001??????????111?????0111011")

	def XOR		= 	BitPat("b0000000??????????100?????0110011")
	def XORI	=	BitPat("b?????????????????100?????0010011")
	def OR		=	BitPat("b0000000??????????110?????0110011")
	def ORI		= 	BitPat("b?????????????????110?????0010011")
	def AND		=	BitPat("b0000000??????????111?????0110011")
	def ANDI	=	BitPat("b?????????????????111?????0010011")

	def SLT		=	BitPat("b0000000??????????010?????0110011")
	def SLTI	=	BitPat("b?????????????????010?????0010011")
	def SLTU	=	BitPat("b0000000??????????011?????0110011")
	def SLTIU	=	BitPat("b?????????????????011?????0010011")

	def BEQ		=	BitPat("b?????????????????000?????1100011")
	def BNE		=	BitPat("b?????????????????001?????1100011")
	def BLT		=	BitPat("b?????????????????100?????1100011")
	def BGE		=	BitPat("b?????????????????101?????1100011")
	def BLTU	=	BitPat("b?????????????????110?????1100011")
	def BGEU	=	BitPat("b?????????????????111?????1100011")
	
	def JAL  	=	BitPat("b?????????????????????????1101111")
	def JALR 	=	BitPat("b?????????????????000?????1100111")

  	def CSRRW 	= 	BitPat("b?????????????????001?????1110011")
  	def CSRRS 	= 	BitPat("b?????????????????010?????1110011")
 	def CSRRC 	= 	BitPat("b?????????????????011?????1110011")
  	def CSRRWI 	= 	BitPat("b?????????????????101?????1110011")
  	def CSRRSI 	= 	BitPat("b?????????????????110?????1110011")
  	def CSRRCI 	= 	BitPat("b?????????????????111?????1110011")

	def ECALL 	= 	BitPat("b00000000000000000000000001110011")
	def EBREAK 	= 	BitPat("b00000000000100000000000001110011")
	def MRET 	= 	BitPat("b00110000001000000000000001110011")
	def SRET 	= 	BitPat("b00010000001000000000000001110011")
	def FENCE_I = 	BitPat("b00000000000000000001000000001111")
	def SFENCE_VMA = BitPat("b0001001??????????000000001110011")
	def NOP 	=	BitPat.bitPatToUInt(BitPat("b00000000000000000000000000010011"))
}

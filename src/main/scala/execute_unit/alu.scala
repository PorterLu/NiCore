package myCPU

import chisel3._ 
import chisel3.util._
import Control._

object Alu {
	val ALU_ADD = 0.U(5.W)
	val ALU_SUB = 1.U(5.W)
	val ALU_AND = 2.U(5.W)
	val ALU_OR	= 3.U(5.W)
	val ALU_XOR = 4.U(5.W)
	val ALU_SLT = 5.U(5.W)
	val ALU_SLL = 6.U(5.W)
	val ALU_SLTU = 7.U(5.W)
	val ALU_SRL	= 8.U(5.W)
	val ALU_SRA = 9.U(5.W)
	val ALU_COPY_A = 10.U(5.W)
	val ALU_COPY_B = 11.U(5.W)
	val ALU_MUL	= 12.U(5.W)
	val ALU_DIV = 13.U(5.W)
	val ALU_REM = 14.U(5.W)
	val ALU_DIVU = 15.U(5.W)
	val ALU_REMU = 16.U(5.W)
	val ALU_XXX = 17.U(5.W)
}

class AluIO(width: Int) extends Bundle{
	val A = Input(UInt(width.W))
	val B = Input(UInt(width.W))
	val width_type = Input(UInt(2.W))
	val alu_op = Input(UInt(4.W))
	val out = Output(UInt(width.W))
	val sum = Output(UInt(width.W))
}

import myCPU.Alu._ 

trait Alu extends Module{
	def width: Int
	val io: AluIO
}

class AluSimple(val width: Int) extends Alu {
	val io = IO(new AluIO(width))

	val out = WireInit(0.U(64.W))
	val sum = WireInit(0.U(64.W))

	val shamt = Mux(io.width_type === W_W, io.B(4, 0).asUInt, io.B(5, 0).asUInt)
	out := MuxLookup(
		io.alu_op,
		io.B,
		Seq(
			ALU_ADD -> (io.A + io.B),
			ALU_SUB -> (io.A - io.B),
			ALU_SRA -> (Mux(io.width_type === W_W, io.A(31,0).asSInt ,	io.A.asSInt) >> shamt).asUInt,
			ALU_SRL -> (io.A >> shamt),
			ALU_SLL -> (io.A << shamt),
			ALU_SLT -> (io.A.asSInt < io.B.asSInt),
			ALU_SLTU -> (io.A < io.B),
			ALU_AND -> (io.A & io.B),
			ALU_OR -> (io.A | io.B),
			ALU_XOR -> (io.A ^ io.B),
			//ALU_MUL -> (io.A * io.B), 
			//ALU_DIV -> Mux(io.width_type === W_W, ((io.A(31,0).asSInt) / (io.B(31,0).asSInt)).asUInt ,(io.A.asSInt / io.B.asSInt).asUInt),
			//ALU_DIVU -> Mux(io.width_type === W_W, io.A(31,0) / io.B(31,0), io.A / io.B),
			//ALU_REM -> Mux(io.width_type === W_W, ((io.A(31,0).asSInt) % (io.B(31,0).asSInt)).asUInt ,(io.A.asSInt % io.B.asSInt).asUInt),
			//ALU_REMU -> Mux(io.width_type === W_W, io.A(31,0) % io.B(31,0), io.A % io.B),
			ALU_COPY_A -> io.A
		)
	)

	sum := io.A + Mux(io.alu_op(0), -io.B, io.B)

	io.out := Mux(io.width_type === W_W, Cat(Fill(32, out(31)), out(31, 0)), out)
	io.sum := Mux(io.width_type === W_W, Cat(Fill(32, sum(31)), sum(31, 0)), sum)
}

class AluArea(val width: Int) extends Alu {
	val io = IO(new AluIO(width))
	//这里加为0号，减为1号，所以通过alu_op(0)可以判断是加还是减
	val sum = io.A + Mux(io.alu_op(0), -io.B, io.B)

	//同号的话，在slt和sltu的条件下，只用判断最位是否为0；但是异号时，alu_op(1)可以判断是有符号还是无符号指令
	//因为SLT和SLTU一个为5号一个为7号，当作无符号时，A < B, A最高位为1则结果为0，A最高位0则结果为1；所以最终
	//结果变为判断A和B的最高位
	val cmp = Mux(io.A(width - 1) === io.B(width - 1), sum(width - 1), 
									Mux(io.alu_op(1), io.B(width - 1), io.A(width - 1)))
	//操作数最低6用于shift
	val shamt = io.B(5,0).asUInt

	//判断是否右移，如果是右移指令，则取shin取A的正序；反之，取逆序
	//左移先将A逆序
	val shin = Mux(io.alu_op(3), io.A, Reverse(io.A))
	
	//如果是右移，SRL和SRA指令，低位为0则是SRL，1则是SRA，所以判断如果是SRA且最高位1，则推断出高位
	//补1，转化为SInt，chisel会自动补1；
	//这一如果低位为0，也可能是一条SLL指令，我们判断shin的最高位实际判断的是A的最低位，但是这里由于alu_op
	//为0，所以右移高位一定补0，这里左移右移共用一个逻辑
	val shiftr = (Cat(io.alu_op(0) && shin(width - 1), shin).asSInt >> shamt)(width - 1, 0)

	//将结果再次反转，恢复左移的结果
	val shiftl = Reverse(shiftr)

	//这里是MuxCase，这里已经已经将一部分结果计算完毕，可供选通
	val out = 
		Mux(io.alu_op === ALU_ADD || io.alu_op === ALU_SUB,
			sum,
			Mux(
				io.alu_op === ALU_SLT || io.alu_op === ALU_SLTU,
				cmp,
				Mux(
					io.alu_op === ALU_SRA || io.alu_op === ALU_SRL,
					shiftr,
					Mux(
						io.alu_op === ALU_SLL,
						shiftl,
						Mux(
							io.alu_op === ALU_AND,
							io.A & io.B,
							Mux(
								io.alu_op === ALU_OR,
								io.A | io.B,
								Mux(io.alu_op === ALU_XOR, io.A ^ io.B, Mux(io.alu_op === ALU_COPY_A, io.A, io.B))
							)
						)
					)
				)
			)
		)
	
	//out是操作的结果
	io.out := out

	//sum提供做加减法的结果
	io.sum := sum
}
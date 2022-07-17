package myCPU

import chisel3._ 
import myCPU.Control._ 

class BrCondIO(xlen: Int) extends Bundle{
	val rs1 = Input(UInt(xlen.W))
	val rs2 = Input(UInt(xlen.W))
	val br_type = Input(UInt(3.W))
	val taken = Output(Bool())
}


trait BrCond extends Module{
	def xlen: Int
	val io: BrCondIO
}

class BrCondSimple(val xlen: Int) extends BrCond{
	val io = IO(new BrCondIO(xlen))
	val eq = io.rs1 === io.rs2
	val neq = !eq
	val lt = io.rs1.asSInt < io.rs2.asSInt
	val ge = !lt
	val ltu = io.rs1 < io.rs2
	val geu = !ltu
	io.taken := 
		((io.br_type === BR_EQ) && eq) ||
		((io.br_type === BR_NE) && neq) ||
		((io.br_type === BR_LT) && lt) ||
		((io.br_type === BR_GE) && ge) ||
		((io.br_type === BR_LTU) && ltu) ||
		((io.br_type === BR_GEU) && geu)
}


class BrCondArea(val xlen: Int) extends BrCond{
	
	val io = IO(new BrCondIO(xlen))
	val diff = io.rs1 - io.rs2
	
	// 如果减法的结果有一位是1则可以推出这两个数不相等
	val neq = diff.orR
	val eq = !neq

	// 是否同号
	val isSameSign = io.rs1(xlen - 1) === io.rs2(xlen - 1)

	//如果同号，则根据diff做减法获得符号位即可； 如果是异号，则根据rs1的
	//的符号即可以判断，如果rs1是负的。那么小于成立，反之大于等于。
	val lt = Mux(isSameSign, diff(xlen - 1), io.rs1(xlen - 1))

	// 如果是无符号的判断的话，如果高位一致的话，则可以直接判断作减法后的符号位
	// 如果符号不同的话，可以直接通过rs2的高位判断，rs2如果高位为1，则说明rs2
	// 高位为0，小于成立，反之不成立
	val ltu = Mux(isSameSign, diff(xlen - 1), io.rs2(xlen - 1))
	val ge = !lt
	val geu = !ltu

	//只要下面有一个成立直接跳转
	io.taken := 
		((io.br_type === BR_EQ) && eq) ||
      	((io.br_type === BR_NE) && neq) ||
      	((io.br_type === BR_LT) && lt) ||
      	((io.br_type === BR_GE) && ge) ||
      	((io.br_type === BR_LTU) && ltu) ||
      	((io.br_type === BR_GEU) && geu)
}
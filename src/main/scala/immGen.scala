package myCPU

import chisel3._
import chisel3.util._ 
import myCPU.Control._

class ImmGenIO extends Bundle{
	val inst = Input(UInt(32.W))
	val sel  = Input(UInt(3.W))
	val out = Output(UInt(64.W))
}

trait ImmGen extends Module {
	val io: ImmGenIO
}

class ImmGenWire extends ImmGen{
	val io = IO(new ImmGenIO)
	val sign = io.inst(31)
	//printf(p"${sign}\n")
	val Iimm = Cat(Fill(32, sign), io.inst(31, 20).asSInt).asSInt
	val Simm = Cat(Fill(32, sign), Cat(io.inst(31, 25), io.inst(11, 7)).asSInt).asSInt
	val Bimm = Cat(Fill(32, sign), Cat(io.inst(31), io.inst(7), io.inst(30, 25), io.inst(11, 8), 0.U(1.W)).asSInt).asSInt
	val Uimm = Cat(Fill(32, sign), Cat(io.inst(31, 12), 0.U(12.W)).asSInt).asSInt
	val Jimm = Cat(Fill(32, sign), Cat(io.inst(31), io.inst(19, 12), io.inst(20), io.inst(30, 25), io.inst(24, 21), 0.U(1.W)).asSInt).asSInt
	val Zimm = Cat(Fill(59, 0.U), io.inst(19, 15)).asSInt

	//(-2).S意味着，默认是取I型立即数的除最低位外的11位
	io.out := MuxLookup(
		io.sel,
		Iimm & (-2).S,
		Seq(IMM_I -> Iimm, IMM_S -> Simm, IMM_B -> Bimm, IMM_U -> Uimm, IMM_J -> Jimm, IMM_Z -> Zimm)		
	).asUInt
}


class ImmGenMux extends ImmGen{
	val io = IO(new ImmGenIO)

	// 将立即数分解为多个部分进行解析
	
	// 除了IMM_Z指定零扩展外，其他指令都根据最高位进行符号位扩展
	val sign = Mux(io.sel === IMM_Z, 0.S, io.inst(31).asSInt)
	
	// 只有立即数高10位，只有U-type， J-type虽然有20位立即数但是立即数不进行移位
	val b30_20 = Mux(io.sel === IMM_U, io.inst(30, 20).asSInt, sign)

	// 除了J-type和U-type其他立即数只有12位，所以b19_12,只有U和J类型有
	val b19_12 = Mux(io.sel =/= IMM_U && io.sel =/= IMM_J, sign, io.inst(19, 12).asSInt)
	
	// 11位，U为0，J在20位，B在第7位
	val b11 = Mux(
		io.sel === IMM_U || io.sel === IMM_Z,
		0.S,
		Mux(io.sel === IMM_J, io.inst(20).asSInt, Mux(io.sel === IMM_B, io.inst(7).asSInt, sign))
	)

	// 10-5位，如果是U型或者是Z型则一定为0，否则是30-25位
	val b10_5 = Mux(io.sel === IMM_U || io.sel === IMM_Z, 0.U, io.inst(30, 25))
	

	// 4-1位，S和B在11-8，I类型和J类型在24-21位
	val b4_1 = Mux(
		io.sel === IMM_U,
		0.U,
		Mux(io.sel === IMM_S || io.sel === IMM_B, io.inst(11, 8), Mux(io.sel === IMM_Z, io.inst(19, 16), io.inst(24, 21)))
	)
	
	//最低位
	val b0 = 
		Mux(io.sel === IMM_S, io.inst(7), Mux(io.sel === IMM_I, io.inst(20), Mux(io.sel === IMM_Z, io.inst(15), 0.U)))
	
	io.out := Cat(sign, b30_20, b19_12, b11, b10_5, b4_1, b0).asSInt.asUInt
}
/*package multiplier

import chisel3._ 
import chisel3.util._ 
import chisel3.experimental.ChiselEnum

object MduState extends ChiselEnum{
	val sIdle, sCalc, sOver = Value
}

object Mul_op extends ChiselEnum{
	val mul, mulh, mulhu, mulhsu = Value
}

class Mul_io extends Bundle{
	val src1 	= Input(SInt(64.W))
	val src2 	= Input(SInt(64.W))
	val mul_valid = Input(Bool())
	val mul_op 	= Input(UInt(2.W))
	val mulw 	= Input(Bool())
	val out_valid = Output(Bool())
	val out_ready = Output(Bool())
	val result 	= Output(SInt(64.W))
}

class Mul extends Module{
	val io = IO(new MulPort)
	import MduState._
	import Mul_op._ 

	val mul_state = RegInit(sIdle)
	val out32 = Reg(Bool())
	val src1 = Reg(UInt(64.W))
	val src2 = Reg(UInt(64.W))
	val out_sign = Reg(Bool())
	val out_high = Reg(Bool())
	val mid_result = Reg(Vec(4, UInt(64.W)))
	val out = RegInit(0.S(64.W))
	val valid = RegInit(false.B)

	io.out_valid := valid 
	io.result := out 

	when(io.mul_valid){
		switch(state){
			is(sIdle){
				when(!valid || io.out_ready){
					val new_src1 = Mux(io.mulw, io.in1(31, 0).asSInt, io.in1)
					val new_src2 = Mux(io.mulw, io.in2(31, 0).asSInt, io.in2)
					val src1_sign = new_src1(63)
					val src2_sign = new_src2(63)
				}

				switch(io.mul_op){
					is(mul){
						out_sign := false.B
						out_high := false.B
						src1 := new_src1.asUInt
						src2 := new_src2.asUInt
					}
					is(mulh){
						outsign := src1_sign ^ src2_sign
						out_high := true.B 
						src1 := new_src1.abs.asUInt
						src2 := new_src2.abs.asUInt
					}
					is(mulhu){
						out_sign := false.B 
						out_high := true.B 
						src1 := new_src1.asUInt
						src2 := new_src2.asUInt
					}
					is(mulhsu){
						out_sign := src1_sign
						out_high := true.B 
						src1 := new_src1.abs.asUInt
						src2 := new_src2.asUInt
					}
				}
			}

			out32 := io.mulw
			mul_state := sCalc
			valid := false.B
		}
		is(sCalc){
			mid_result(0) := src1(31, 0) * src2(31, 0)
			mid_result(1) := src1(63, 32) * src2(31, 0)
			mid_result(2) := src1(31, 0) * src2(63, 32)
			mid_result(3) := src1(63, 32) * src2(63, 32)
			state := sFINAL
			valid := false.B 
		}
		is(sOver){
			val final_u = (mid_result(3) << 64) + (mid_result(2) << 32) + (mid_result(1) << 32) + mid_result(0)
			val final_s = Mux(out_sign, -(final_u.asSInt), final_u.asSInt)
			out := Mux(out32, Mux(out_high, final_s(63, 32), final_s(32, 0)), Mux(out_high, final_s(127, 64), final_s(63, 0))).asSInt
			valid := true.B 
			state := sIdle
		}
	}.otherwise{
		state := sIdle
		valid := false.B
	}

}*/
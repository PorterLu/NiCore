/*package mdu

import chisel3._ 
import chisel3.util._ 
import chisel3.experimental.ChiselEnum

object MduState extends ChiselEnum{
	val sIdle, sCalc, sOver = Value
}

class Multiplier extends Module{
	val io = IO(new Bundle{
		val mul_valid = Input(Bool())
		val flush = Input(Bool())
		val mulw = Input(Bool())
		val mul_signed = Input(UInt(2.W))
		val multilicand = Input(UInt(64.W))
		val multiplier = Input(UInt(64.W))
		val mul_ready = Output(Bool())
		val out_valid = Output(Bool())
		val result_hi = Output(UInt(64.W))
		val result_lo = Output(UInt(64.W))
	})

	val mdu_state = RegInit(sIdle)
	val multiplicand_reg = RegInit(0.U(128.W))
	val multiplier_reg = RegInit(0.U(64.W))
	val result = RegInit(0.U(128.W))
	val (index, last) = Counter(mdu_state === sCalc, 64)

	val next_state = sIdle
	mdu_state := next_state

	io.out_valid := false.B
	io.out_ready := false.B

	result_hi := result(127, 64)
	result_lo := result(63, 0)

	when(mul_signed === 3.U)
	{
		multiplicand_reg := Cat(0.U(64.W), io.multilicand)
		multiplier_reg := io.multiplier
	}.elsewhen(mul_signed === 2.U){

	}.elsewhen(mul_signed === 1.U){

	}

	switch(state){
		is(sIdle){
			io.out_ready := true.B
			when(mul_valid){
				next_state := sCalc
			}
		}
		is(sCalc){
			when(last || b === 0.U){
				next_state := sOver
			}

			when(!last){
				result := result + Mux(multiplier_reg(0), (multiplicand_reg << index), 0.U) 
			}.otherwise{
				result := result - Mux(multiplier_reg(0), (multiplicand_reg << index), 0.U)
			}

			multiplier_reg := multiplier_reg >> 1.U
		}
		is(sOver){
			next_state := sIdle
			io.out_valid := true.B
		}
	}

}*/
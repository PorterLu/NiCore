package mdu

import chisel3._ 
import chisel3.util._ 
import chisel3.experimental.ChiselEnum

object MulState extends ChiselEnum{
	val sIdle, sCalc, sOver = Value
}

object MulOp extends ChiselEnum{
	val mul, mulh, mulhu, mulhsu = Value
}

class Multiplier extends Module{
	val io = IO(new Bundle{
		val mul_valid = Input(Bool())
		val mul_ready = Output(Bool())
		val flush = Input(Bool())
		val mulw = Input(Bool())
		val mul_op = Input(UInt(2.W))
		val multilicand = Input(SInt(64.W))
		val multiplier = Input(SInt(64.W))
		val out_ready = Input(Bool())
		val out_valid = Output(Bool())
		val result = Output(SInt(64.W))
	})

	import MulState._ 
	import MulOp._ 

	val mul_state = RegInit(sIdle)
	val multiplicand_reg = RegInit(0.U(64.W))
	val multiplier_reg = RegInit(0.U(64.W))
	//val result = RegInit(0.U(128.W))
	val mid_result = RegInit(VecInit(Seq.fill(4)(0.U(64.W))))
	val out_sign = Reg(Bool())
	val out_high = Reg(Bool())
	val is_w = Reg(Bool())
	val (index, last) = Counter(mul_state === sCalc, 32)

	val next_state = WireInit(sIdle)
	mul_state := next_state

	io.out_valid := false.B
	//io.out_ready := false.B

	//result_hi := result(127, 64)
	//result_lo := result(63, 0)
	io.mul_ready := mul_state === sIdle
	io.result := 0.S

	val src1 = Mux(io.mulw, Cat(0.S(32.W), io.multilicand(31, 0).asSInt).asSInt, io.multilicand.asSInt)
	val src2 = Mux(io.mulw, Cat(0.S(32.W), io.multiplier(31, 0).asSInt).asSInt, io.multiplier.asSInt)
	val src1_sign = Mux(io.mulw, src1(31), src1(63))
	val src2_sign = Mux(io.mulw, src1(31), src2(63))
	
	val result_u = WireInit(0.U(128.W))
	val result_s = WireInit(0.S(128.W))

	//next_state := sIdle

	//when(io.flush){
	//	index := 0.U
	//}
	//printf(p"mul_state: ${mul_state.asUInt}\n")

	switch(mul_state){
		is(sIdle){
			//io.out_ready := true.B
			when(io.mul_valid && !io.flush){ 		//&& !io.out_ready 
				next_state := sCalc
				index := 0.U
				for(i <- 0 until 4){
					mid_result(i) := 0.U
				}
			}.otherwise{
				next_state := sIdle
			}

			//printf("sIdle\n")
			//printf(p"op:${io.mul_op.asUInt}\n")
			when(io.mul_op === mul.asUInt)
			{
				//multiplicand_reg := Cat(0.U(64.W), io.multilicand)
				//multiplier_reg := io.multiplier
				out_sign := false.B
				out_high := false.B 
				multiplicand_reg := src1.asUInt
				multiplier_reg := src2.asUInt
			}.elsewhen(io.mul_op === mulh.asUInt){
				out_sign := src1_sign ^ src2_sign
				out_high := true.B 
				multiplicand_reg := src1.abs.asUInt
				multiplier_reg := src2.abs.asUInt
			}.elsewhen(io.mul_op === mulhu.asUInt){
				out_sign := false.B
				out_high := true.B 
				multiplicand_reg := src1.asUInt
				multiplier_reg := src2.asUInt
			}.otherwise{
				out_sign := src1_sign
				out_high := true.B 
				multiplicand_reg := src1.abs.asUInt
				multiplier_reg := src2.asUInt
			}

			is_w := io.mulw
		}
		is(sCalc){
			when(io.flush){
				next_state := sIdle
			}.elsewhen(last){
				next_state := sOver
				//printf("over\n")
				//printf(p"${(mid_result(3) << 64) + (mid_result(2) << 32) + (mid_result(1) << 32) + mid_result(0)}\n")
			}.otherwise{
				next_state := sCalc
			}

			//printf("sCalc\n")
			/*
			when(!last){
				result := result + Mux(multiplier_reg(0), (multiplicand_reg << index), 0.U) 
			}.otherwise{
				result := result - Mux(multiplier_reg(0), (multiplicand_reg << index), 0.U)
			}*/
			//printf(p"index:${index}\n")
			//multiplier_reg := multiplier_reg >> 1.U
			//printf(p"${multiplicand_reg}; ${multiplier_reg}\n")
			mid_result(0) := mid_result(0) + Mux(multiplier_reg(0), multiplicand_reg(31, 0) << index, 0.U(64.W))
			mid_result(1) := mid_result(1) + Mux(multiplier_reg(32), multiplicand_reg(31, 0) << index, 0.U(64.W))
			mid_result(2) := mid_result(2) + Mux(multiplier_reg(0), multiplicand_reg(63, 32) << index, 0.U(64.W))
			mid_result(3) := mid_result(3) + Mux(multiplier_reg(32), multiplicand_reg(63, 32) << index, 0.U(64.W))

			multiplier_reg := Cat(0.U(1.W), multiplier_reg(63, 33), 0.U(1.W), multiplier_reg(31, 1)) 
			
		}
		is(sOver){
			//printf("sOver\n")
			//printf(p"result:${io.result}\n")
			//for(i <- 0 until 4){
			//	mid_result(i) := 0.U
			//}
			next_state := sIdle
			io.out_valid := true.B
			result_u := (mid_result(3) << 64) + (mid_result(2) << 32) + (mid_result(1) << 32) + mid_result(0)
			result_s := Mux(out_sign , -(result_u.asSInt), result_u.asSInt)
			io.result := Mux(is_w, 
								Mux(out_high, result_s(63, 32).asSInt, result_s(31, 0).asSInt), 
								Mux(out_high, result_s(127, 64).asSInt, result_s(63, 0).asSInt)
							)
			//io.result := (result_s(63, 0)).asSInt
			//index := 0.U
		}
	}

}

object DivState extends ChiselEnum{
	val sIdle, sCalc, sOver = Value
}

class Divider extends Module{
	val io = IO(new Bundle{
		val dividend  = Input(SInt(64.W))
		val divisor   = Input(SInt(64.W))
		val div_valid = Input(Bool())
		val div_ready = Output(Bool())
		val divw 	  = Input(Bool())
		val div_signed= Input(Bool())
		val flush 	  = Input(Bool())
		val out_valid = Output(Bool())
		val out_ready = Input(Bool())
		val quotient  = Output(SInt(64.W))
		val remainder = Output(SInt(64.W))
	})

	import DivState._ 

	val dividend = Reg(UInt(128.W))
	val divisor  = Reg(UInt(128.W))
	val result = Reg(UInt(64.W))
	val sign_a = Reg(Bool())
	val sign_b = Reg(Bool())
	val div_state = RegInit(sIdle)
	val is_w = Reg(Bool())
	val is_sign = Reg(Bool())
	val next_state = WireInit(sIdle)

	io.div_ready := div_state === sIdle
	//is_w 	:= io.divw
	//is_sign := io.div_signed
	//sign_a  := Mux(io.divw, io.dividend(31), io.dividend(63))
	//sign_b  := Mux(io.divw, io.divisor(31), divisor(63))
	/*dividend := MuxCase(Cat(0.U(64.W), io.dividend), 
						Array(
							(io.div_signed && !io.divw) -> Cat(Seq.fill(64, io.dividend(63)), io.dividend),
							(io.div_signed && io.divw) -> Cat(Seq.fill(96, io.dividend(31)), io.dividend(31, 0)),
							(!io.div_signed && io.divw) -> Cat(0.U(96.W), io.dividend(31, 0))							
						))*/

	//divisor  := Mux(io.divw, Cat(0.U(64.W), io.divisor(31, 0), 0.U(32.W)), Cat(io.divisor(63, 0), 0.U(64.W)))

	div_state := next_state
	val counter_enable = (div_state === sCalc) && (!is_w)
	val w_counter_enable = (div_state === sCalc) && is_w
	val (index, last_calc) 	= Counter(counter_enable, 65)
	val (windex, w_last_calc) = Counter(w_counter_enable, 33) 
	val mid128_result = WireInit(0.U(128.W))
	val mid64_result = WireInit(0.U(64.W))
	io.out_valid := false.B
	io.quotient := 0.S
	io.remainder := 0.S

	//when(io.flush){
	//	index := 0.U
	//	windex := 0.U
	//}

//	printf(p"state:${div_state.asUInt}\n")
	switch(div_state){
		is(sIdle){
			when(io.div_valid && !io.flush){	// && !io.out_ready
				next_state := sCalc
				result := 0.U
				index := 0.U
				windex := 0.U

				when(io.div_signed){
					dividend := Mux(io.divw, Cat(0.U(96.W), io.dividend(31, 0).asSInt.abs.asUInt), Cat(0.U(64.W), io.dividend.abs.asUInt))
					divisor := Mux(io.divw, Cat(0.U(64.W), io.divisor(31, 0).asSInt.abs.asUInt, 0.U(32.W)), Cat(io.divisor.abs.asUInt, 0.U(64.W)))
				}.otherwise{
					dividend := Mux(io.divw, Cat(0.U(96.W), io.dividend(31,0).asUInt), Cat(0.U(64.W), io.dividend.asUInt))
					divisor := Mux(io.divw, Cat(0.U(64.W), io.divisor(31, 0).asUInt, 0.U(32.W)), Cat(io.divisor.asUInt, 0.U(64.W)))
				}

				is_w := io.divw 
				is_sign := io.div_signed
				sign_a := Mux(io.divw, io.dividend(31), io.dividend(63))
				sign_b := Mux(io.divw, io.divisor(31), io.divisor(63))

			}.otherwise{
				next_state := sIdle
			}
			
		}
		is(sCalc){
			when(io.flush){
				next_state := sIdle
			}.elsewhen(w_last_calc || last_calc){
				next_state := sOver
			}.otherwise{
				next_state := sCalc
			}

			when(is_w){
				mid64_result := (dividend - divisor)(63, 0)
				when(!mid64_result(63)){
					dividend := Cat(0.U(64.W), mid64_result)
					result := (result << 1.U) | 1.U
					//printf(p"dividend:${Cat(0.U(64.W), mid64_result)}; result:${(result << 1.U) | 1.U}\n")
				}.otherwise{
					result := (result << 1.U)
					//printf(p"dividend:${dividend}; result:${(result << 1.U)}\n")

				}
				divisor := Cat(0.U(64.W), divisor(63, 0) >> 1.U)			
				//printf(p"dividend:${Cat(0.U(64.W), mid64_result)}; result:${(result << 1.U) | 1.U}")
			}

			when(!is_w){
				mid128_result := dividend - divisor
				when(!mid128_result(127)){
					dividend := mid128_result
					result := (result << 1.U) | 1.U
					//printf(p"dividend:${mid128_result}; result:${(result << 1.U) | 1.U}\n")
				}.otherwise{
					result := (result << 1.U)
					//printf(p"dividend:${dividend}; result:${(result << 1.U)}\n")
				}
				
				//printf(p"windex: ${windex}\n")
				divisor := divisor >> 1.U
			}
		}
		is(sOver){
			//wlast := 0.U
			//result := Mux(sign_a ^ sign_b, -result, result)
			//dividend := Mux((!sign_a && !sign_b) || (!sign_a && sign_b), -dividend, dividend)
			//printf(p"${Hexadecimal(result)}; ${Hexadecimal(dividend)}\n")
			io.out_valid := true.B
			when(is_sign){
				io.quotient := Mux(sign_a ^ sign_b, -result, result)(63, 0).asSInt
				io.remainder := Mux((sign_a && sign_b) || (sign_a && !sign_b), -dividend, dividend)(63, 0).asSInt
			}.otherwise{
				io.quotient := result(63, 0).asSInt
				io.remainder := dividend(63, 0).asSInt
			}
			next_state := sIdle
		}
	}
	//printf(p"index: ${index}\n")
	//printf(p"div_state: ${div_state.asUInt}\n")
}


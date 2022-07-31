package myCPU

import chisel3._ 
import chisel3.util._ 

class clint extends Module{
	val io = IO(new Bundle{
		val addr = Input(UInt(64.W))
		val w_data = Input(UInt(64.W))
		val wen = Input(Bool())
		val r_data = Output(UInt(64.W))

		val soft_int = Output(Bool())
		val soft_valid = Output(Bool())
		val soft_ready = Input(Bool())

		val timer_int = Output(Bool())
		val timer_valid = Output(Bool())
		val timer_ready = Input(Bool())
	})

	val msip = RegInit(0.U(64.W))
	val mtimecmp = RegInit(0.U(64.W))
	val mtime = RegInit(0.U(64.W))

	when(io.wen){
		when(io.addr === "h2000000".U){
			msip := io.w_data
		}
		
		when(io.addr === "h2004000".U){
			mtimecmp := io.w_data
		}

		when(io.addr === "h200bff8".U){
			mtime := io.w_data
		}
	}.otherwise{
		io.r_data := Mux(io.addr === "h20000000".U , msip,
						Mux(io.addr === "h2004000".U, mtimecmp, 
							Mux(io.addr === "h200bff8".U, mtime, 0.U)))
	}

	when(msip(0).asBool){
		io.soft_valid := true.B
		io.soft_int := true.B
	}.elsewhen(io.soft_ready){
		io.soft_valid := false.B
		io.soft_int := false.B
	}

	when(mtime >= mtimecmp){
		io.timer_int := true.B
		io.timer_valid := true.B
	}.elsewhen(io.timer_ready){
		io.timer_int := false.B
		io.timer_valid := false.B
		mtime := 0.U
	}

	mtime := mtime + 1.U
}
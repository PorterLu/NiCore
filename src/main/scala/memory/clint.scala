package myCPU

import chisel3._ 
import chisel3.util._ 

//内部的clint说明，输入32位的物理地址
class clint extends Module{
	val io = IO(new Bundle{
		val addr = Input(UInt(64.W))
		val w_data = Input(UInt(64.W))
		val wen = Input(Bool())
		val r_data = Output(UInt(64.W))

		val soft_valid = Output(Bool())
		val timer_valid = Output(Bool())

		val timer_clear = Output(Bool())
		val soft_clear = Output(Bool())
	})

	val msip = RegInit(0.U(64.W))
	val mtimecmp = RegInit(0.U(64.W))
	val mtime = RegInit(0.U(64.W))

	io.r_data := 0.U 
	io.soft_valid := false.B 
	io.timer_valid := false.B
	io.timer_clear := false.B
	io.soft_clear := false.B

	when(io.wen){
		when(io.addr === "h2000000".U){
			msip := io.w_data
		}
		
		when(io.addr === "h2004000".U){
			mtimecmp := io.w_data
			io.timer_clear := true.B	
		}

		when(io.addr === "h200bff8".U){
			mtime := io.w_data
		}
	}.otherwise{
		io.r_data := Mux(io.addr === "h2000000".U , msip,
						Mux(io.addr === "h2004000".U, mtimecmp, 
							Mux(io.addr === "h200bff8".U, mtime, 0.U)))
	}

	//如果软件中断的寄存器中存有一个值，那么
	when(msip(0).asBool){
		io.soft_valid := true.B
	}.otherwise{
		io.soft_clear := true.B
	}

	when(mtime >= mtimecmp){
		io.timer_valid := true.B
	}

	mtime := mtime + 1.U
}
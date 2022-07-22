package bundleTest

import chisel3._ 
import chisel3.util._
import chisel3.stage.ChiselStage

class testIO extends Bundle{
	val data = UInt(64.W)
	val addr = UInt(64.W)
}

class test extends Module{
	val io = IO(Flipped((Valid(new testIO))))
	//io.valid := true.B
	//io.bits.addr := 0.U
	//io.bits.data := 0.U
}


object bundleDriver extends App{
	(new ChiselStage).emitVerilog(new test, args)
}
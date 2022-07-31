package test
import chisel3._
import chisel3.util._
import chisel3.experimental._
import chisel3.experimental.BundleLiterals._
import chisel3.stage.ChiselStage

class TypeConvertDemo extends Module {
  val io = IO( new Bundle{
      val in = Input(UInt(4.W))
      val out = Output(UInt(4.W))
  })
  io.out := io.in

  printf(s"${io.getWidth}")
}


object  Drvier extends App{
	(new ChiselStage).emitVerilog(new TypeConvertDemo, args)
}




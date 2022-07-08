package test
import chisel3._
import chisel3.util._
import chisel3.experimental._
import chisel3.experimental.BundleLiterals._

class TypeConvertDemo extends Module {
  val io = IO( new Bundle{
      val in = Input(UInt(4.W))
      val out = Output(SInt(4.W))
  })
  io.out := io.in
}





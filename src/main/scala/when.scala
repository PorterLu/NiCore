import chisel3._
import chisel3.stage.ChiselStage


class A extends Module{
	val io = IO(new Bundle{
		val out = Output(UInt(4.W))
		val in = Input(UInt(4.W))
	})

	//io.out := 0.U
	//when(io.in === 1.U)
	//{
	//	io.out := io.in
	//}
	io.out := 0.U
	when(io.in === 1.U){
		io.out := 2.U
	}
}

object whenDriver extends App{
    (new ChiselStage).emitVerilog(new A, args)
}

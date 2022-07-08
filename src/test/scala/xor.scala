import chisel3._ 
import chiseltest._
import org.scalatest.flatspec.AnyFlatSpec

class xor extends Module {
    val io = IO(new Bundle{
        val in1 = Input(UInt(4.W))
        val in2 = Input(UInt(4.W))
        val out = Output(UInt(4.W))
    })

    io.out := io.in1 ^ io.in2
}

class xortester extends AnyFlatSpec with ChiselScalatestTester{
    behavior of "xor"
    it should "pass test" in {
        test(new xor) { c=>
            c.io.in1.poke(4.U)
            c.io.in2.poke(11.U)
            c.io.out.expect(15.U)
        }
        println("SUCCESS!!")
    }
}


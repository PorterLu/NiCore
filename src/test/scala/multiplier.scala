package mdu

import chisel3._ 
import chiseltest._ 
import org.scalatest.flatspec.AnyFlatSpec
import scala.util.Random

class MulTest extends AnyFlatSpec with ChiselScalatestTester{
	behavior of "Multiplier"
	it should "pass" in{
		test(new Multiplier){ c=>
			println("Start test")

			for(i <- 0 until 100){
				val src1 = Random.nextInt(2147483647)
				val src2 = Random.nextInt(2147483647)
				println(s"src1: $src1; src2: $src2")
				val mul_op = Random.nextInt(4)
				c.io.mul_valid.poke(true.B)
				c.io.multilicand.poke(src1.S)
				c.io.multiplier.poke(src2.S)
				c.io.mul_op.poke(0.U)
				c.io.flush.poke(false.B)
				c.io.mulw.poke(true.B)
				c.io.out_ready.poke(false.B)
				c.clock.step(33)
				c.io.out_valid.expect(true.B)
				
				c.io.result.expect((((src1) * src2)).S)
				println
				c.clock.step()
			}

		}
		println("all pass")
	}
}
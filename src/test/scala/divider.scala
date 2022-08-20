package  mdu

import chisel3._ 
import chiseltest._ 
import org.scalatest.flatspec.AnyFlatSpec
import scala.util.Random


class DividerTest extends AnyFlatSpec with ChiselScalatestTester{
	behavior of "Divider"
	it should "pass" in{
		test(new Divider){ c=>
			//c.clock.setTimeout(0)
			println("Start test")
			for(i <- 0 until 100){
				val src1 = Random.nextInt(2147483647)
				val src2 = Random.nextInt(2147483647)
				println(s"src1: $src1; src2: $src2")
 				c.io.div_valid.poke(true.B)
				c.io.dividend.poke(src1.S)
				c.io.divisor.poke(src2.S)
				c.io.divw.poke(true.B)
				c.io.div_signed.poke(false.B)
				c.io.flush.poke(false.B)
				c.clock.step(34)
				c.io.out_valid.expect(true.B)
				c.io.quotient.expect((src1/src2).S)
				c.io.remainder.expect((src1%src2).S)
				c.clock.step()
				println()
			}

			/*
			for(i <- 0 until 100){
				val src1 = Random.nextInt(2147483647) * (-1)
				val src2 = Random.nextInt(2147483647)
				println(s"src1: $src1; src2: $src2")
 				c.io.div_valid.poke(true.B)
				c.io.dividend.poke(src1.S)
				c.io.divisor.poke(src2.S)
				c.io.divw.poke(true.B)
				c.io.div_signed.poke(false.B)
				c.io.flush.poke(false.B)
				c.clock.step(34)
				c.io.out_valid.expect(true.B)
				c.io.quotient.expect((src1/src2).S)
				c.io.remainder.expect((src1%src2).S)
				c.clock.step()
				println()

			}
		

			for(i <- 0 until 100){
				val src1 = Random.nextInt(2147483647)
				val src2 = Random.nextInt(2147483647 )* (-1)
				println(s"src1: $src1; src2: $src2")
				c.io.div_valid.poke(true.B)
				c.io.dividend.poke(src1.S)
				c.io.divisor.poke(src2.S)
				c.io.divw.poke(true.B)
				c.io.div_signed.poke(false.B)
				c.io.flush.poke(false.B)
				c.clock.step(34)
				c.io.out_valid.expect(true.B)
				c.io.quotient.expect((src1/(src2)).S)
				c.io.remainder.expect((src1%src2).S)
				c.clock.step()
				println()
			}

			for(i <- 0 until 100){
				val src1 = Random.nextInt(2147483647 )* (-1)
				val src2 = Random.nextInt(2147483647 )* (-1)
				println(s"src1: $src1; src2: $src2")
				c.io.div_valid.poke(true.B)
				c.io.dividend.poke(src1.S)
				c.io.divisor.poke(src2.S)
				c.io.divw.poke(true.B)
				c.io.div_signed.poke(false.B)
				c.io.flush.poke(false.B)
				c.clock.step(34)
				c.io.out_valid.expect(true.B)
				c.io.quotient.expect((src1/src2).S)
				c.io.remainder.expect((src1%src2).S)
				c.clock.step()
				println()
			}*/

			println("success divider")
		}
	}
}
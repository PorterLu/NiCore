package exp3

import chisel3._
import chisel3.util._
//import dotvisualizer._
//import chisel3.iotesters._

class Adder extends Module{
    val io = IO( new Bundle{
        val a = Input(SInt(4.W))
        val b = Input(SInt(4.W))
        val op = Input(UInt(3.W))
        val out = Output(SInt(4.W))
        val of = Output(Bool())
        val cf = Output(Bool())
    })

    val add::sub::not::and::or::xor::bl::eq::Nil = Enum(8)
    val result = WireDefault(0.S(4.W))
    io.cf := false.B
    io.of := false.B

    switch(io.op)
    {
        is(add)
        {
            result := io.a + io.b
            io.cf := Mux(io.a.asUInt +& io.b.asUInt > 15.U ,true.B, false.B)
            io.of := (io.a(3) === io.b(3)) & (result(3) =/= io.a(3))
        }
        is(sub)
        {
            result := io.a + (~io.b + 1.S)
            io.cf := Mux(io.a.asUInt +& io.b.asUInt > 15.U, true.B, false.B)
            io.of := (io.a(3) =/= io.b(3)) & (result(3) =/= io.a(3))
        }
        is(not)
        {
            result := ~io.a;
        } 
        is(and)
        {
            result := io.a & io.b
        }
        is(or)
        {
            result := io.a | io.b
        }
        is(xor)
        {
            result := io.a ^ io.b
        }
        is(bl)
        {
            result := (io.a < io.b).asSInt
        }
        is(eq)
        {
            result := (io.a === io.b).asSInt
        }
    } 

    io.out := result

}

/*
object exp3Adder extends App{
    chisel3.Driver.execute(args, ()=> new Adder)
}*/

/*
class checker(dut: Adder) extends PeekPokeTester(dut)
{

    poke(dut.io.a, 1.S)
    poke(dut.io.b, -8.S)
    poke(dut.io.op, 6.U)
    step(1)
    println("\n"+peek(dut.io.a).toString + "-"+ peek(dut.io.b).toString +" = "+ peek(dut.io.out).toString + ", of is "+ peek(dut.io.of).toString + ", cf is " + peek(dut.io.cf).toString) 

}*/

/*
object Adderchecker extends App{
    //chisel3.Driver.execute(args,() => new Adder)
    println(getVerilog(new Adder))
}
*/

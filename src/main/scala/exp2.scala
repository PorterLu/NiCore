package exp2

import bcd7._
import chisel3._
import chisel3.util._
//import dotvisualizer._

class exp2 extends Module{
    val io = IO(new Bundle{
        val in = Input(Vec(8,Bool()))
        val enable = Input(Bool())
        val out_led = Output(UInt(4.W))
        val out_bcd7 = Output(UInt(7.W))
    })

    val max = Wire(UInt(3.W))
    max := 0.U
    when(io.enable)
    {
        for(i <- 0 to 7)
        {
            when(io.in(i))   
            {
                max := i.U
            }
        }
    }.otherwise{
        max := 0.U
    }
    
    io.out_led := Cat(io.enable,max)
    val bcd7_ins = Module(new bcd7())
    bcd7_ins.io.in := max;
    io.out_bcd7 := bcd7_ins.io.out
}

/*
object tester extends App{
    //chisel3.Driver.execute(args, ()=> new exp2)
    println(getVerilog(new exp2))
}
*/

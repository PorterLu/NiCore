package exp6

import chisel3._
import chisel3.util._
import bcd7._
//import dotvisualizer._

class lfsr extends Module{
    val io = IO(new Bundle {
        val enable = Input(Bool())
        val reset = Input(Bool())
        val in = Input(UInt(8.W))
        val out = Output(UInt(8.W))     
    })

    val regLfsr = RegInit(127.U(8.W))
    val stateEnable = RegInit(0.U(3.W))
    val stateRet = RegInit(0.U(3.W))

    stateEnable := Cat(stateEnable(1,0),io.enable)
    stateRet := Cat(stateRet(1,0),io.reset)    

    when(stateRet(2) & (~(stateEnable(1))))
    {
        regLfsr := io.in
    }

    when(stateEnable(2) & (~stateEnable(1)))
    {
        regLfsr := Cat(regLfsr(4,2).xorR ^ regLfsr(0), regLfsr(7,1))
    }

    io.out :=  regLfsr
    
}

class exp6 extends Module{
    val io = IO(new Bundle{
        val enable = Input(Bool())
        val reset = Input(Bool())
        val in = Input(UInt(8.W))
        val out = Output(UInt(14.W))     
    })

    val lfsr = Module(new lfsr())
    val bcd7_1 = Module(new bcd7())
    val bcd7_2 = Module(new bcd7())

    lfsr.io.enable := io. enable
    lfsr.io.reset := io.reset
    lfsr.io.in := io.in

    bcd7_1.io.in := lfsr.io.out(3,0)
    bcd7_2.io.in := lfsr.io.out(7,4)

    io.out := Cat(bcd7_2.io.out,bcd7_1.io.out)
}

/*
object tester extends App{
    //chisel3.Driver.execute(args, () => new exp6)
    println(getVerilog(new exp6))
}
*/

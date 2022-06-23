package bcd7

import chisel3._
import chisel3.util._

class bcd7 extends Module{
	val io = IO( new Bundle{
          val in = Input(UInt(4.W))
          val out = Output(UInt(7.W))
        })

        io.out := 0.U
        switch(io.in)
        {
          is(0.U)
          {  io.out := 64.U}
          is(1.U)
          {  io.out := 121.U}
          is(2.U)
          { io.out := 36.U}
          is(3.U) 
          {  io.out := 48.U}
          is(4.U)
          {  io.out := 25.U}
          is(5.U)
          {  io.out := 18.U}
          is(6.U)
          {  io.out := 2.U}
          is(7.U)
          {  io.out := 120.U}
          is(8.U)
          {  io.out := 0.U}
          is(9.U)
          {  io.out := 16.U}
          is(10.U)
          {  io.out := 8.U}
          is(11.U)
          {  io.out := 3.U}
          is(12.U)
          {  io.out := 70.U}
          is(13.U)
          {  io.out := 33.U}
          is(14.U)
          {  io.out := 6.U}
          is(15.U)
          {  io.out := 14.U}
        }
}

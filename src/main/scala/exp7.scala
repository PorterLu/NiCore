package exp7

import chisel3._
import chisel3.util._
import bcd7._
import chisel3.stage.ChiselStage

//import dotvisualizer._
/*
class keyboard extends Module{
    val io = IO(new Bundle{
        val ps2_clk = Input(Bool())
        val ps2_dat = Input(UInt(1.W))
        val out = Output(UInt(8.W))
        val ready = Output(Bool())
    })

    val buffer = Reg(Vec(10,UInt(1.W)))
    val count = RegInit(0.U(4.W))
    val ps2_clk_sync = RegInit(0.U(3.W))
    val ready = RegInit(false.B)
    ps2_clk_sync := Cat(ps2_clk_sync(1,0), io.ps2_clk)

    when(ps2_clk_sync(2) & (~ps2_clk_sync(1)))
    {
        when(count =/= 10.U)
        {
            buffer(count) := io.ps2_dat
            count := count + 1.U
        }.elsewhen(buffer(0) === 0.U && io.ps2_dat.asBool && (buffer.asUInt).xorR)
        {
            count := 0.U
            ready := true.B
        }
    }

    io.out := buffer.asUInt
    io.ready := ready    
}

class rom extends Module{
    val io = IO(new Bundle {
    val sel = Input(UInt(4.W))
    val out = Output(UInt(8.W))  
  })
 
    val rom = VecInit(48.U,49.U,50.U,51.U,52.U,53.U,54.U,55.U,56.U)
    io.out := rom(io.sel)
}

class show extends Module{
    val io = IO(new Bundle{
        val ps2_clk = Input(Bool())
        val ps2_dat = Input(UInt(1.W))
        val scan_code = Output(Vec(2, UInt(4.W)))
        val ascii = Output(Vec(2, UInt(4.W)))
        val count = Output(UInt(8.W))
    })

    val keyboard = Module(new keyboard)
    val rom = Module(new rom)
    keyboard.io.ps2_clk := io.ps2_clk
    keyboard.io.ps2_dat := io.ps2_dat

    io.count := 0.U

    when(keyboard.io.ready)
    {
        keyboard.io.ready := false.B
        io.scan_code := keyboard.io.out
        rom.io.sel := io.scan_code(0)
        io.ascii(0) := rom.io.out
        rom.io.sel := io.scan_code(1)
        io.ascii(1) := rom.io.out

        when(io.scan_code(0) === "h0".U && io.scan_code(1) === "hf".U)
        {
            io.count := io.count + 1.U    
        }
    }
}


class exp7 extends Module{
    val io = IO(new Bundle{
        val ps2_clk = Input(Bool())
        val ps2_dat = Input(UInt(1.W))
        val bcd_scan = Output(UInt(8.W))
        val bcd_ascii = Output(UInt(8.W))
        val bcd_count = Output(UInt(8.W))
    })

    val bcd_1 = Module(new bcd7)
    val bcd_2 = Module(new bcd7)
    val show = Module(new show)
    show.io.ps2_clk := io.ps2_clk
    show.io.ps2_dat := io.ps2_dat

    bcd_1.io.in := show.io.scan_code(0)
    bcd_2.io.in := show.io.scan_code(1)
    io.bcd_scan := Cat(bcd_2.io.out, bcd_1.io.out)

    bcd_1.io.in := show.io.ascii(0)
    bcd_2.io.out := show.io.ascii(1)
    io.bcd_ascii := Cat(bcd_2.io.out, bcd_1.io.out)

    bcd_1.io.in := show.io.count(3,0)
    bcd_2.io.in := show.io.count(7,4)
    io.bcd_count := Cat(bcd_2.io.out, bcd_1.io.out)
}

object tester extends App{
    chisel3.Driver.execute(args, ()=>new exp7)
}*/


class keyboard extends Module{
    val io = IO(new Bundle{
        val next_data_n = Input(Bool())
        val ps2_clk = Input(Bool())
        val ps2_dat = Input(UInt(1.W))
        val out = Output(UInt(8.W))
        val ready = Output(Bool())
    })

    val buffer = RegInit(0.U(10.W))
    val ready = RegInit(false.B)
    val count = RegInit(0.U(8.W))
    val ps2_clk_sync = RegInit(0.U(3.W))
    val next_data_n = RegInit(false.B)
    val fifo = Reg(Vec(8,UInt(8.W)))
    val w_ptr = RegInit(0.U(3.W))
    val r_ptr = RegInit(0.U(3.W))

    next_data_n := io.next_data_n
    io.out := fifo(r_ptr)
    io.ready := ready

    ps2_clk_sync := Cat(ps2_clk_sync(1,0),io.ps2_clk)

    when(ready)
    {
        
        when(w_ptr === r_ptr + 1.U)
        {
                ready := false.B
        }

            //when(next_data_n && ready)
            //{
            //    r_ptr := r_ptr + 1.U
            //next_data_n := false.B
            //}
    }

    when(next_data_n)
    {

            r_ptr := r_ptr + 1.U
    }
    
    when(ps2_clk_sync(2) && ~ps2_clk_sync(1))
    {
        when(count === 10.U)
        {
            when(io.ps2_dat.asBool && ~buffer(0) && buffer(9,1).xorR)
            {
                fifo(w_ptr) := buffer(8,1)
                w_ptr := w_ptr + 1.U
                ready := true.B
            }
            count := 0.U
            buffer := 0.U
        }.otherwise
        {
            buffer := buffer | io.ps2_dat << count
            count := count + 1.U
        }
    }
}

class exp7 extends Module{
    val io = IO(new Bundle{
        val ps2_clk = Input(Bool())
        val ps2_dat = Input(UInt(1.W))
        val out_scan = Output(UInt(14.W))
        //val out_ascii = Output(UInt(14.W))
        //val out_count = Output(UInt(14.W))
    })

    val keyboard = Module(new keyboard)
    val counter = RegInit(0.U(8.W))
    val out_scan = RegInit(16383.U(14.W))

    val bcd_1 = Module(new bcd7)
    val bcd_2 = Module(new bcd7)
    
    keyboard.io.ps2_clk := io.ps2_clk
    keyboard.io.ps2_dat := io.ps2_dat

    bcd_1.io.in := 0.U
    bcd_2.io.in := 0.U
    keyboard.io.next_data_n := false.B
    io.out_scan := out_scan
    
    //val show = RegInit(true.B)
    //val timer = Module(new timer)
    when(keyboard.io.ready)
    {
        bcd_1.io.in := keyboard.io.out(3,0)
        bcd_2.io.in := keyboard.io.out(7,4)
        keyboard.io.next_data_n := true.B
        printf("scan code %x\n",keyboard.io.out)
        out_scan := Cat(bcd_2.io.out,bcd_1.io.out)
    }

}

class timer extends Module{
    val io = IO(new Bundle{
        val rst = Input(Bool())
        val out = Output(Bool())
    })

    val timer = RegInit(0.U(32.W))
    io.out := false.B
    when(io.rst)
    {
        timer := 0.U
    }

    when(timer < 100000.U)
    {
        timer := timer + 1.U
    }.otherwise{
        timer := 0.U
        io.out := true.B
    }
}


object tester extends App{
    //chisel3.Driver.execute(args, ()=>new exp7)
    //println(getVerilog(new exp7))
    (new ChiselStage).emitVerilog(new exp7, args)

}


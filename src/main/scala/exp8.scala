package exp8

import chisel3._
import chisel3.util._
import chisel3.experimental.ChiselEnum
import chisel3.util.experimental.loadMemoryFromFileInline   // <<-- new import here
import chisel3.stage.ChiselStage


object vga_parameter extends ChiselEnum{
    val v_frontporch = Value(2.U)
    val v_active = Value(35.U)
    val h_frontporch = Value(96.U)
    val h_active = Value(144.U)
    val v_backporch = Value(515.U)
    val v_total = Value(525.U)
    val h_backporch = Value(784.U)
    val h_total = Value(800.U)
}

class vga_ctrl extends Module{
    val io = IO(new Bundle{
        val vga_data = Input(UInt(24.W))
        val h_addr = Output(UInt(10.W))
        val v_addr = Output(UInt(10.W))
        val hsync = Output(Bool())
        val vsync = Output(Bool())
        val valid = Output(Bool())
        val vga_r = Output(UInt(8.W))
        val vga_g = Output(UInt(8.W))
        val vga_b = Output(UInt(8.W))
    })

    val x_cnt = RegInit(0.U(10.W))
    val y_cnt = RegInit(0.U(10.W))
    val h_valid = Wire(Bool())
    val v_valid = Wire(Bool())

    when(x_cnt === vga_parameter.h_total.asUInt)
    {
        x_cnt := 1.U
    }.otherwise
    {
        x_cnt := x_cnt + 1.U
    }

    when(y_cnt === vga_parameter.v_total.asUInt && x_cnt === vga_parameter.h_total.asUInt)
    {
        y_cnt := 1.U
    }.elsewhen(x_cnt === vga_parameter.h_total.asUInt)
    {
        y_cnt := y_cnt + 1.U
    }

    io.hsync := x_cnt > vga_parameter.h_frontporch.asUInt
    io.vsync := y_cnt > vga_parameter.v_frontporch.asUInt
    h_valid := (x_cnt > vga_parameter.h_active.asUInt) && (x_cnt <= vga_parameter.h_backporch.asUInt)
    v_valid := (y_cnt > vga_parameter.v_active.asUInt) && (y_cnt <= vga_parameter.v_backporch.asUInt)
    io.valid := h_valid & v_valid

    io.h_addr := Mux(h_valid, x_cnt - 145.U, 0.U)
    io.v_addr := Mux(v_valid, y_cnt - 36.U, 0.U)

    io.vga_r := io.vga_data(23,16)
    io.vga_g := io.vga_data(15,8)
    io.vga_b := io.vga_data(7,0)
}

class vmem(memoryFile : String ="") extends Module{
    val io = IO(new Bundle{
        val h_addr = Input(UInt(10.W))
        val v_addr = Input(UInt(9.W))
        val vga_data = Output(UInt(24.W))
    })
    
    val mem = SyncReadMem(524288, UInt(24.W))
    if (memoryFile.trim().nonEmpty) {
        loadMemoryFromFileInline(mem, memoryFile)
    }

    val addr = Wire(UInt(19.W))
    addr := Cat(io.h_addr, io.v_addr)
    io.vga_data := mem(addr)
}

class exp8 extends Module{
    val io = IO(new Bundle{
        val hsync = Output(Bool())
        val vsync = Output(Bool())
        val valid = Output(Bool())
        val vga_r = Output(UInt(8.W))
        val vga_g = Output(UInt(8.W))
        val vga_b = Output(UInt(8.W))
    })

    val h_addr = WireInit(0.U(10.W))
    val v_addr = WireInit(0.U(10.W))
    val mem = Module(new vmem("picture.hex"))
    val vga_ctrl = Module(new vga_ctrl)
    
    mem.io.h_addr := vga_ctrl.io.h_addr
    mem.io.v_addr := vga_ctrl.io.v_addr(8,0)
    vga_ctrl.io.vga_data := mem.io.vga_data

    io.hsync := vga_ctrl.io.hsync
    io.vsync := vga_ctrl.io.vsync
    io.valid := vga_ctrl.io.valid
    io.vga_r := vga_ctrl.io.vga_r
    io.vga_g := vga_ctrl.io.vga_g
    io.vga_b := vga_ctrl.io.vga_b
     
}

/*
object tester extends App{
    //chisel3.Driver.execute(args, ()=>new exp8)
    //println(getVerilog(new exp8))
    //(new chisel3.stage.ChiselStage).execute(
    //  Array("-X", "verilog"),
    //  Seq(ChiselGeneratorAnnotation(() => new exp8())))
    println(getVerilog(new exp8))

}*/


object exp8Driver extends App {
  (new ChiselStage).emitVerilog(new exp8, args)
}


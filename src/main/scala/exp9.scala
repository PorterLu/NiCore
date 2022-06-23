import chisel3._ 
import chisel3.util._ 
import chisel3.experimental.ChiselEnum
import chisel3.util.experimental.loadMemoryFromFileInline
import chisel3.stage.ChiselStage
import exp7._           //keyboard 

class map_mem(memoryFile : String = "") extends Module{
    val io = IO(new Bundle{
        val addr = Input(UInt(12.W))
        val out = Output(UInt(12.W))
    })

    val map_mem = SyncReadMem(4096, UInt(12.W))
    if (memoryFile.trim().nonEmpty) {
        loadMemoryFromFileInline(map_mem, memoryFile)
    }

    io.out := map_mem(io.addr)
}


class vmem extends Module{
    val io = IO(new Bundle{
        val h_addr = Input(UInt(7.W))
        val v_addr = Input(UInt(5.W))
        val wr_h_addr = Input(UInt(7.W))
        val wr_v_addr = Input(UInt(5.W))
        val input_dat = Input(UInt(8.W))
        val is_write = Input(Bool())
        val ascii = Output(UInt(8.W))
    })
    
    val mem = SyncReadMem(2200, UInt(8.W))
    val addr = Wire(UInt(12.W))
    val write_addr = Wire(UInt(12.W))
    //addr := (io.v_addr << 6) + (io.v_addr << 2) + (io.v_addr << 1) + io.h_addr
    addr := (io.v_addr * 64.U) + io.h_addr
    write_addr := 0.U
    when(io.is_write)
    {
        //write_addr := (io.wr_v_addr << 6) + (io.wr_v_addr << 2) + (io.wr_v_addr << 1) + io.wr_h_addr
        write_addr := (io.wr_v_addr * 64.U) + io.wr_h_addr
        mem(write_addr) := io.input_dat
        //io.is_write := false.B
    }
    
    io.ascii := mem(addr)
}

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
        val vga_data = Input(UInt(1.W))
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

    when(x_cnt === (vga_parameter.h_total.asUInt - 1.U)) 
    {
        x_cnt := 0.U
    }.otherwise
    {
        x_cnt := x_cnt + 1.U
    }

    when(y_cnt === (vga_parameter.v_total.asUInt - 1.U) && x_cnt === (vga_parameter.h_total.asUInt - 1.U))
    {
        y_cnt := 0.U
    }.elsewhen(x_cnt === vga_parameter.h_total.asUInt - 1.U)
    {
        y_cnt := y_cnt + 1.U
    }

    io.hsync := x_cnt >= vga_parameter.h_frontporch.asUInt
    io.vsync := y_cnt >= vga_parameter.v_frontporch.asUInt
    h_valid := (x_cnt >= vga_parameter.h_active.asUInt) && (x_cnt < vga_parameter.h_backporch.asUInt)
    v_valid := (y_cnt >= vga_parameter.v_active.asUInt) && (y_cnt < vga_parameter.v_backporch.asUInt)
    io.valid := h_valid & v_valid

    io.h_addr := Mux(h_valid, x_cnt - 145.U, 0.U)
    io.v_addr := Mux(v_valid, y_cnt - 36.U, 0.U)
    
    io.vga_r := 0.U 
    io.vga_g := 0.U
    io.vga_b := 0.U
    when(io.vga_data === 0.U)
    {
        io.vga_r := "b11111111".U
        io.vga_g := "b11111111".U
        io.vga_b := "b11111111".U
    }.otherwise
    {
        io.vga_r := "b00000000".U
        io.vga_g := "b00000000".U
        io.vga_b := "b00000000".U
    }
}


class charInput extends Module{
    val io = IO(new Bundle{
        val ps2_clk = Input(Bool())
        val ps2_dat = Input(UInt(1.W))
        val hsync = Output(Bool())
        val vsync = Output(Bool())
        val valid = Output(Bool())
        val vga_r = Output(UInt(8.W))
        val vga_g = Output(UInt(8.W))
        val vga_b = Output(UInt(8.W))
    })
    //记录写指针的位置
    val char_x = RegInit(0.U(10.W))
    val char_y = RegInit(0.U(10.W))

    //字符矩阵
    //val matrix = Reg(Vec(16,UInt(12.W)))

    //字符位置
    val x_tmp = WireInit(0.U(10.W))
    val y_tmp = WireInit(0.U(10.W))

    //vga扫描地址
    val h_addr = WireInit(0.U(10.W))
    val v_addr = WireInit(0.U(10.W))

    val keyboard = Module(new keyboard)
    val vga_ctrl = Module(new vga_ctrl)
    val vmem = Module(new vmem)
    val rom = Module(new rom)
    val map_mem = Module(new map_mem("ascii.hex"))

    keyboard.io.ps2_clk := io.ps2_clk
    keyboard.io.ps2_dat := io.ps2_dat
    keyboard.io.next_data_n := false.B

    //表示是(1/16)+(1/32)+(1/64)+(1/1024)+(1/2048)+(1/4096)+(1/65536)，显存坐标
    //x_tmp := (vga_ctrl.io.h_addr >> 4) + (vga_ctrl.io.h_addr >> 5) + (vga_ctrl.io.h_addr >> 6) + (vga_ctrl.io.h_addr >> 10) + (vga_ctrl.io.h_addr >> 11) + (vga_ctrl.io.h_addr >> 12)
    x_tmp := vga_ctrl.io.h_addr / 10.U(10.W)
    y_tmp := vga_ctrl.io.v_addr >> 4.U
    h_addr := vga_ctrl.io.h_addr - (x_tmp * 10.U)  
    v_addr := vga_ctrl.io.v_addr - (y_tmp << 4.U)

    //printf("%d %d x_tmp = %d,  y_tmp = %d,  h_addr=%d, v_addr=%d\n",vga_ctrl.io.h_addr,vga_ctrl.io.v_addr, x_tmp, y_tmp, h_addr, v_addr)
    vmem.io.is_write := false.B
    vmem.io.wr_h_addr := char_x
    vmem.io.wr_v_addr := char_y
    vmem.io.input_dat := 0.U
    vmem.io.h_addr := x_tmp
    vmem.io.v_addr := y_tmp

    //map_mem.io.addr := vmem.io.ascii << 4
    //for(i <- 0 until 16)
    //{
    //    map_mem.io.addr := ((vmem.io.ascii << 4) + i.U)
    //    matrix(i) := map_mem.io.out
        //printf("%x %x\n",(vmem.io.ascii << 4) + i.U, matrix(i))
    //} 

    //printf("addr in matrix h_addr=%d v_addr=%d\n", h_addr, v_addr)

    map_mem.io.addr := (vmem.io.ascii << 4.U) + v_addr

    vga_ctrl.io.vga_data := map_mem.io.out(h_addr)
    //when(matrix((v_addr << 4) + h_addr) === 1.U)
    //{    printf("1\n");}
    //printf("addr %d\n",(v_addr << 4) + h_addr)
    io.hsync := vga_ctrl.io.hsync
    io.vsync := vga_ctrl.io.vsync
    io.valid := vga_ctrl.io.valid
    io.vga_r := vga_ctrl.io.vga_r
    io.vga_g := vga_ctrl.io.vga_g
    io.vga_b := vga_ctrl.io.vga_b


    rom.io.scan_code := 0.U

    val pre_scancoded = RegInit(0.U(8.W))
    when(keyboard.io.ready)
    {
        rom.io.scan_code := keyboard.io.out
        vmem.io.input_dat := rom.io.ascii
        when(rom.io.ascii =/= 0.U && rom.io.scan_code =/= "hf0".U && pre_scancoded =/= "hf0".U)
        {
            vmem.io.is_write := true.B
            when(char_x === 63.U || rom.io.scan_code === "h5a".U) 
            {
                char_x := 0.U
            }.otherwise
            {
                char_x := char_x + 1.U
            }

            when(char_y === 29.U && (char_x === 70.U||rom.io.scan_code === "h5a".U))
            {
                char_y := 0.U
            }.elsewhen(char_x === 63.U || rom.io.scan_code === "h5a".U)
            {               
                char_y := char_y + 1.U
            }
        }
        pre_scancoded := keyboard.io.out
        keyboard.io.next_data_n := true.B
    }
}

object exp9Driver extends App {
  (new ChiselStage).emitVerilog(new charInput, args)
}

class rom extends Module{
    val io = IO(new Bundle{
        val scan_code = Input(UInt(8.W))
        val ascii = Output(UInt(8.W))
    })

    io.ascii := 0.U
    switch(io.scan_code)
    {
        is("h45".U){io.ascii := 48.U}   //0
        is("h16".U){io.ascii := 49.U}   //1
        is("h1e".U){io.ascii := 50.U}   //2
        is("h26".U){io.ascii := 51.U}   //3
        is("h25".U){io.ascii := 52.U}   //4
        is("h2e".U){io.ascii := 53.U}   //5
        is("h36".U){io.ascii := 54.U}   //6
        is("h3d".U){io.ascii := 55.U}   //7
        is("h3e".U){io.ascii := 56.U}   //8
        is("h46".U){io.ascii := 57.U}   //9
        is("h5a".U){io.ascii := 13.U}   //return
    }
}
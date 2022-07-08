import chisel3._
import chisel3.util._
import chisel3.util.HasBlackBoxInline
import chisel3.experimental._
import chisel3.util.experimental.loadMemoryFromFile
import chisel3.stage.ChiselStage
import chisel3.util.BitPat 

object Instructions {
	//----------------------|-------*****-----***-----*******
	def SD 	 	= 	BitPat("b?????????????????011?????0100011")
	def JAL  	=	BitPat("b?????????????????????????1101111")
	def JALR 	=	BitPat("b?????????????????000?????1100111")
	def ADDI 	= 	BitPat("b?????????????????000?????0010011")
	def AUIPC 	=  	BitPat("b?????????????????????????0010111")
	def LUI  	= 	BitPat("b?????????????????????????0110111")
	def EBREAK 	= 	BitPat("b00000000000100000000000001110011")
}

import Instructions._

class ebreak extends BlackBox with HasBlackBoxInline{
    val io = IO(new Bundle{
		val enable = Input(Bool())
    })

	/*
    setInline("ebreak.v",
             """
             | import "DPI-C" function void halt();
             |
             | module ebreak(input enable);
             | always @(*)
             |  if(enable)
             |      halt();
             | endmodule
             """.stripMargin)*/
}

class gpr_ptr extends BlackBox with HasBlackBoxInline{
	val io = IO(new Bundle{
		val clock = Input(Clock())
		val reset = Input(Bool())
		val regfile = Input(Vec(32,UInt(64.W)))
	})

	/*
	setInline("gpr_ptr.v",
			"""
			|import "DPI-C" function void set_gpr_ptr(input logic [63:0] a[]);
			|initial set_gpr_ptr(io.regfile)
			""".stripMargin)
	*/
}

class RegisterFile(readPorts : Int) extends Module{
    require(readPorts >= 0)
    val io = IO(new Bundle{
        val wen = Input(Bool())
        val waddr = Input(UInt(5.W))
        val wdata = Input(UInt(64.W))
        val raddr = Input(Vec(readPorts, UInt(5.W)))
        val rdata = Output(Vec(readPorts, UInt(64.W)))
    })

    val reg = RegInit(VecInit(Seq.fill(32)(0.U(64.W))))

    when(io.wen){
        reg(io.waddr) := io.wdata
    }

    io.rdata := DontCare
    for(i <- 0 until readPorts){
        when(io.raddr(i) === 0.U){              //写zero寄存器做特殊判断
            io.rdata(i) := 0.U
        }.otherwise{
            io.rdata(i) := reg(io.raddr(i))
        }
    }
}

class mem(memoryFile : String = "") extends Module{
    val io = IO(new Bundle{
        val enable = Input(Bool())
        val write_enable = Input(Bool())
        val addr = Input(UInt(64.W))
        val dataIn = Input(UInt(64.W))
        val dataOut = Output(UInt(64.W))
    })

    val mem = SyncReadMem(0x800000, UInt(8.W))
    if(memoryFile.trim().nonEmpty){
        loadMemoryFromFile(mem, memoryFile)
    }

    io.dataOut := DontCare
    when(io.enable)
    {
        when(io.write_enable)
        {
            for(i <- 0 until 8)
            {
                mem(io.addr + i.U) := io.dataIn(7+i*8, i*8)
            }
        }

        io.dataOut := Cat(mem(io.addr), mem(io.addr + 1.U), mem(io.addr + 2.U), 
                        mem(io.addr + 3.U), mem(io.addr + 4.U), mem(io.addr + 5.U),
                        mem(io.addr + 6.U), mem(io.addr + 7.U))
    }
}

class coreIO extends Bundle{
    val dat_addr = Output(UInt(64.W))
    val pc_addr = Output(UInt(64.W))
    val wen = Output(Bool())
    val wdata = Output(UInt(64.W))
    val rdata = Input(UInt(64.W))
    val instr = Input(UInt(32.W))
	val pc_debug = Output(UInt(64.W))
	//val reg_debug = Output(Vec(32, UInt(64.W)))
}

class myCPU extends Module{
    val io = IO(new coreIO)
    io.wen := false.B 
    io.wdata := 0.U(64.W)
    io.dat_addr := 0.U(64.W)

    val regFile = Module(new RegisterFile(35))
	val is_4 = WireInit(false.B)
	val pc_remote = WireInit("h80000000".U(64.W))
    val pc = RegInit("h80000000".U(64.W))
    val instr = RegInit(0.U(32.W))

	val reg_debug = Module(new gpr_ptr)
	reg_debug.io.clock := clock 
	reg_debug.io.reset := reset
	for(i <- 3 to 34)
	{
		regFile.io.raddr(i) := (i-3).U
		reg_debug.io.regfile(i-3) := regFile.io.rdata(i)
	}
	


	//mask used for get imm
	val mask_ex     = "b11111110000000000000000000000000".U
    val mask_func   = "b00000000000000000111000000000000".U
    val mask_op     = "b00000000000000000000000001111111".U
    val mask_src1   = "b00000000000011111000000000000000".U
    val mask_src2   = "b00000001111100000000000000000000".U
    val mask_dest   = "b00000000000000000000111110000000".U
    val mask_immI   = "b11111111111100000000000000000000".U
	val mask_immU   = "b11111111111111111111000000000000".U
	val mask_immS   = "b11111110000000000011000000000000".U

	//get elements needed for execution
    val op   = WireDefault(instr & mask_op)
    val func = WireDefault(instr & mask_func)
    val imm  = WireInit(0.U(32.W))
	val imm_tmp = WireInit(0.U(32.W))
    val src1 = WireInit(0.U(64.W))
    val src2 = WireInit(0.U(64.W))
    val dest = WireInit(0.U(64.W))

    val ebreak = Module(new ebreak)

	regFile.io.wen := false.B
    regFile.io.waddr := 0.U(5.W)
    regFile.io.wdata := 0.U(64.W)
    for(i <- 0 until 3)
        regFile.io.raddr(i) := 0.U(5.W)

	is_4 := (instr =/= JAL)&&(instr =/= JALR)
    pc := Mux(is_4, pc + 4.U, pc_remote)
    io.pc_addr := pc 
    instr := io.instr

    ebreak.io.enable := false.B

	//op === "b0010011".U && func === 0.U
	when(instr === ADDI)
	{
        regFile.io.raddr(0) := (instr & mask_src1) >> 15.U
        src1 := regFile.io.rdata(0)

        imm := (instr & mask_immI) >> 20.U
        src2 := Mux(imm(11,11).asBool,Cat( Fill(52, 1.U), imm(11,0)), Cat(Fill(52, 0.U), imm(11,0)))

        regFile.io.wen := true.B
        regFile.io.waddr :=  (instr & mask_dest) >> 7.U
        dest := src1 + src2
        regFile.io.wdata := dest

    }.elsewhen(instr === AUIPC)
	{
		imm := (instr & mask_immU) >> 12.U
		src1 := Mux(instr(31,31).asBool, Cat(Fill(32, 1.U), imm << 12.U) , Cat(Fill(32, 0.U), imm << 12.U))
		pc_remote := pc + src1

		regFile.io.wen := true.B
		regFile.io.waddr := (instr & mask_dest) >> 7.U
		dest := pc + 4.U 

	}.elsewhen( instr === LUI)
	{
		imm := (instr & mask_immU) >> 12.U
		src1 := Mux(instr(31,31).asBool, Cat(Fill(32, 1.U), imm << 12.U) , Cat(Fill(32, 0.U), imm << 12.U))

		dest := src1;
		regFile.io.wen := true.B
		regFile.io.waddr := (instr & mask_dest) >> 7.U
		regFile.io.wdata := dest

	}.elsewhen(instr === SD)
	{
		imm_tmp := Cat((instr & mask_immS)(31,25), (instr & mask_immS)(11,7))
		imm := Mux(instr(31,31).asBool, Cat(Fill(42, 1.U), imm_tmp(11, 0)), Cat(Fill(42, 0.U), imm_tmp(11, 0)))
		io.wen := true.B

		regFile.io.raddr(0) := (instr & mask_src1) >> 15.U
		src1 := regFile.io.rdata(0)

		regFile.io.raddr(1) := (instr & mask_src2) >> 22.U
		src2 := regFile.io.rdata(1)

    	io.wdata := src2
    	io.dat_addr := src1 + imm
		io.wen := true.B

	}.elsewhen(instr === JAL)
	{
		imm_tmp := (instr & mask_immU) 
		imm := Cat(imm_tmp(31,31), imm_tmp(19,12), imm_tmp(20,20), imm_tmp(30,21), 0.U)
		src1 := Mux(instr(31,31).asBool, Cat(Fill(43, 1.U), imm(20,0)), Cat(Fill(43, 0.U), imm(20,0)))
		pc_remote := src1 + pc

		dest := pc + 4.U
		regFile.io.wen := true.B
		regFile.io.waddr := (instr & mask_dest) >> 7.U
		regFile.io.wdata := dest 

	}.elsewhen( instr === JALR)
	{
		regFile.io.raddr(0) := (instr & mask_src1) >> 15.U
        src1 := regFile.io.rdata(0)

        imm := (instr & mask_immI) >> 20.U
        src2 := Mux(imm(11,11).asBool,Cat( Fill(52, 1.U), imm(11,0)), Cat(Fill(52, 0.U), imm(11,0)))

		pc_remote := (src1 + src2)&((~1).S.asUInt) 

        regFile.io.wen := true.B
        regFile.io.waddr :=  (instr & mask_dest) >> 7.U
        dest := pc + 4.U
        regFile.io.wdata := dest

	}.elsewhen(instr === EBREAK)
	{
        ebreak.io.enable := true.B
    }

	val pc_tmp = RegNext(pc)
	io.pc_debug := pc_tmp
    //io.pc_debug := pc
    /*
    val pc = RegInit("h80000000".U(64.W))
    val regFile = RegInit(VecInit(Seq.fill(32)(0.U(64.W))))
    val instr = RegInit(0.U(32.W))
    val src1 = RegInit(0.U(5.W))
    val src2 = RegInit(0.U(5.W))
    val dest = RegInit(0.U(5.W))
    val imm_I = RegInit(0.S(64.W))
    val imm_U = RegInit(0.S(64.W))
    val imm_S = RegInit(0.S(64.W))
    val imm_B = RegInit(0.S(64.W))
    val imm_J = RegInit(0.S(64.W))
    val op = RegInit(0.U(16.W))
    val add :: sub :: load :: store :: shift_ll :: shift_lr :: shift_al :: shift_ar :: mul :: div :: rem :: load_i :: Nil = Enum(12)

    val mem = Module(new mem("memfile"))
    io.out := false.B
    mem.io.dataIn := DontCare
    mem.io.write_enable := false.B
    mem.io.enable := true.B
    mem.io.addr := pc
    pc := pc + 4.U
    instr := mem.io.dataOut

    val is_type_R = RegInit(false.B)
    val is_type_I = RegInit(false.B)
    val is_type_S = RegInit(false.B)
    val is_type_B = RegInit(false.B)
    val is_type_U = RegInit(false.B)
    val is_type_J = RegInit(false.B)

    val is_sign_ex = RegInit(false.B)
    val is_unsign_ex = RegInit(false.B)
    val is_src1 = RegInit(false.B)
    val is_src2 = RegInit(false.B)
    val is_dest = RegInit(false.B)
    val is_immI = RegInit(false.B)
    val is_immU = RegInit(false.B)
    val is_immS = RegInit(false.B)
    val is_immJ = RegInit(false.B)
    val is_immB = RegInit(false.B)

    val mask1 = "b11111110000000000000000000000000".U
    val mask2 = "b00000000000000000111000000000000".U
    val mask3 = "b00000000000000000000000001111111".U
    val src1_mask = "b00000000000011111000000000000000".U
    val src2_mask = "b00000001111100000000000000000000".U
    val dest_mask = "b00000000000000000000111110000000".U

    src1 := instr & src1_mask
    src2 := instr & src2_mask
    dest := instr & dest_mask

    imm_I := Cat(instr(31,20).asUInt, Fill(52,0.U)).asSInt 
    imm_S := Cat(instr(11,7).asUInt,instr(31,25).asUInt, Fill(52,0.U)).asSInt 
    imm_B := Cat(0.U(1.W), instr(11,8).asUInt, instr(30,25).asUInt, instr(7,7).asUInt,instr(31,31).asUInt, Fill(51, 0.U)).asSInt 
    imm_U := Cat(instr(31,12).asUInt, Fill(44, 0.U)).asSInt
    imm_J := Cat(0.U(12.W), instr(30,21).asUInt, instr(20,20).asUInt, instr(19,12).asUInt, instr(31,31).asUInt, Fill(32, 0.U)).asSInt

    imm_I := Mux(imm_I(11,11).asBool, Cat(Fill(52, 1.U), imm_I.asUInt), imm_I.asUInt).asSInt
    imm_S := Mux(imm_S(11,11).asBool, Cat(Fill(52, 1.U), imm_S.asUInt), imm_S.asUInt).asSInt
    imm_U := Mux(imm_U(19,19).asBool, Cat(Fill(44, 1.U), imm_U.asUInt), imm_U.asUInt).asSInt
    imm_B := Mux(imm_B(12,12).asBool, Cat(Fill(51, 1.U), imm_B.asUInt), imm_B.asUInt).asSInt
    imm_J := Mux(imm_J(31,31).asBool, Cat(Fill(32, 1.U), imm_J.asSInt), imm_J.asUInt).asSInt

    val instr_op = WireDefault(instr & mask3)
    switch(instr_op)
    {
        is("b0010011".U)
        {
            switch (instr & mask2)
            {
                is("b0".U)
                {
                    is_type_I := true.B
                    is_src1 := true.B
                    is_dest := true.B
                    is_immI := true.B
                    op := add
                }
            }
        }
    }


    val result = RegInit(0.S(64.W))
    switch(op)
    {
        is(add)
        {
            when(is_type_I)
            {
                result := regFile(src1).asSInt + imm_I
            }
        }
    } 


    when(is_dest)
    {
        when(dest =/= 0.U)
        {
            regFile(dest) := result.asUInt
        }
    }*/

    

}

object Driver extends App{
    (new ChiselStage).emitVerilog(new myCPU, args)
}

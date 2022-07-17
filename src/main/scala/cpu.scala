package myCPU

import chisel3._
import chisel3.util._
import chisel3.util.HasBlackBoxInline
import chisel3.experimental._
import chisel3.util.experimental.loadMemoryFromFile
import chisel3.stage.ChiselStage
import chisel3.util.BitPat 
import Control._
/*
object Instructions {
	//----------------------|-------*****-----***-----*******
	def SD 	 	= 	BitPat("b?????????????????011?????0100011")
	def JAL  	=	BitPat("b?????????????????????????1101111")
	def JALR 	=	BitPat("b?????????????????000?????1100111")
	def ADDI 	= 	BitPat("b?????????????????000?????0010011")
	def AUIPC 	=  	BitPat("b?????????????????????????0010111")
	def LUI  	= 	BitPat("b?????????????????????????0110111")
	def EBREAK 	= 	BitPat("b00000000000100000000000001110011")
}*/

import Instructions._

class ebreak extends BlackBox with HasBlackBoxInline{
    val io = IO(new Bundle{
		val clock = Input(Clock())
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
//}

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
		val clock = Input(Clock())
		val reset = Input(Bool())
        val wen = Input(Bool())
        val waddr = Input(UInt(5.W))
        val wdata = Input(UInt(64.W))
        val raddr = Input(Vec(readPorts, UInt(5.W)))
        val rdata = Output(Vec(readPorts, UInt(64.W)))
    })

    val reg = RegInit(VecInit(Seq.fill(32)(0.U(64.W))))

	//withClockAndReset((~io.clock.asUInt.asBool).asClock, io.reset){
    when(io.wen){
        reg(io.waddr) := io.wdata
	}
	//}

	for(i <- 0 until 35)
		io.rdata(i) := 0.U
	//io.rdata := DontCare
	for(i <- 0 until readPorts){
		when(io.raddr(i) === 0.U){              //写zero寄存器做特殊判断
			io.rdata(i) := 0.U
		}.otherwise{
			io.rdata(i) := reg(io.raddr(i))
		}
	}

}

/*
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
}*/



/*
class myCPU extends Module{
    val io = IO(new coreIO)
    io.wen := false.B 
    io.wdata := 0.U(64.W)
    io.dat_addr := 0.U(64.W)

    val regFile = Module(new RegisterFile(35))
	val is_4 = WireInit(false.B)
	val pc_remote = WireInit("h80000000".U(64.W))
    val pc = RegInit("h80000000".U(64.W))
    val instr = WireInit(0.U(32.W))

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
	ebreak.io.clock := clock

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

		regFile.io.wen := true.B
		regFile.io.waddr := (instr & mask_dest) >> 7.U
		regFile.io.wdata := pc + src1

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

		pc_remote := (src1 + src2)&("hfffffffffffffffe".U) 

        regFile.io.wen := true.B
        regFile.io.waddr :=  (instr & mask_dest) >> 7.U
        dest := pc + 4.U
        regFile.io.wdata := dest

	}
 
	ebreak.io.enable := instr === EBREAK 
	io.pc_debug := pc
}
*/

class coreIO extends Bundle{
    //val pc_addr = Output(UInt(64.W))
    //val wen = Output(Bool())
	//val enable = Output(Bool())
	//val addr = Output(UInt(64.W))
    //val wdata = Output(UInt(64.W))
    //val rdata = Input(UInt(64.W))
    //val pc_data = Input(UInt(32.W))
	//val gpr_ptr = Output(Vec(32,UInt(64.W)))
	val pc_debug = Output(UInt(64.W))
	//val instr = Output(UInt(32.W))
	//val reg_debug = Output(Vec(32, UInt(64.W)))
}

class Mem extends BlackBox{
	val io = IO(new Bundle{
		val clock = Input(Clock())
		val reset = Input(Bool())
		val pc_addr = Input(UInt(64.W))
		val pc_data = Output(UInt(64.W))
		val addr = Input(UInt(64.W))
		val wdata = Input(UInt(64.W))
		val mask = Input(UInt(8.W))
		val rdata = Output(UInt(64.W))
		val enable = Input(Bool())
		val wen = Input(Bool())
	})
}

class gpr_ptr extends BlackBox with HasBlackBoxInline{
	val io = IO(new Bundle{
		val clock = Input(Clock())
		val reset = Input(Bool())
		val regfile = Input(Vec(32,UInt(64.W)))
	})
}

class myCPU extends Module{
	val io = IO(new coreIO)

	//BASIC FRAMEWORK
	val alu = Module(new AluSimple(64))
	val immGen = Module(new ImmGenWire)
	val control = Module(new Control)
	val brCond = Module(new BrCondSimple(64))
	val regFile = Module(new RegisterFile(35))
	val mem = Module(new Mem)
	val pc = RegInit("h80000000".U)
	val gpr_ptr = Module(new gpr_ptr)

	//INIT
	regFile.io.raddr(2) := 0.U
	for(i <- 3 until 35){
		regFile.io.raddr(i) := (i-3).U
		gpr_ptr.io.regfile(i-3) := regFile.io.rdata(i)
	}

	regFile.io.clock := clock
	regFile.io.reset := reset
 	gpr_ptr.io.clock := clock 
	gpr_ptr.io.reset := reset
	mem.io.clock := clock
	mem.io.reset := reset
	io.pc_debug := pc

	//wire
	val instr = WireInit(0.U(32.W))
	val src1 = WireInit(0.U(5.W))
	val src2 = WireInit(0.U(5.W))
	val dest = WireInit(0.U(5.W))
	val imm = WireInit(0.U(64.W))
	val alu_out = WireInit(0.U(64.W))
	val alu_sum = WireInit(0.U(64.W))
	val mem_rdata = WireInit(0.U(64.W))
	val taken = WireInit(false.B)
	val pc_4 = WireInit(0.U(64.W))
	val load_data = WireInit(0.U(64.W))
	val load_data_ext = WireInit(0.U(64.W))
	val st_mask = WireInit(0.U(16.W))
	val width_type = WireInit(0.U(2.W))
	val extend_type = WireInit(false.B)
	val A_data = WireInit(0.U(64.W))
	val B_data = WireInit(0.U(64.W))

	//pc
	pc := Mux(control.io.pc_sel === 0.U & !taken, pc + 4.U,
		Mux(control.io.pc_sel === 1.U | taken, alu_out, pc))
	pc_4 := pc + 4.U

	//fetch
	mem.io.pc_addr := pc
	instr := Mux((pc(2) & ~clock.asUInt.asBool) | (~pc(2) & clock.asUInt.asBool) , mem.io.pc_data(63, 32), mem.io.pc_data(31, 0));
	//io.instr := instr
	control.io.inst := instr

	//alu
	alu.io.alu_op := control.io.alu_op
	alu.io.width_type := control.io.wd_type
	A_data := Mux(control.io.A_sel.asBool, regFile.io.rdata(0), pc)
	B_data := Mux(control.io.B_sel.asBool, regFile.io.rdata(1), imm)
	alu.io.A := Mux(control.io.wd_type === W_W, A_data(31,0), A_data)	//暂时不考虑宽度为半字和一个字节
	alu.io.B := Mux(control.io.wd_type === W_W, B_data(31,0), B_data)	
	
	alu_out := alu.io.out
	alu_sum := alu.io.sum

	//printf(p"${regFile.io.rdata(0)} ${regFile.io.rdata(5)}\n")

	//register
	src1 := instr(19, 15)
	src2 := instr(24, 20)
	dest := instr(11, 7)
	regFile.io.raddr(0) := src1 
	regFile.io.raddr(1) := src2

	//imm
	immGen.io.inst := instr
	immGen.io.sel := control.io.imm_sel
	imm := immGen.io.out

	//branch
	brCond.io.br_type := control.io.br_type
	brCond.io.rs1 := regFile.io.rdata(0)
	brCond.io.rs2 := regFile.io.rdata(1)
	taken := brCond.io.taken

	//write back
	mem.io.enable := control.io.st_type.orR || control.io.ld_type.orR
	mem.io.wen := control.io.st_type.orR
	mem.io.addr := alu_out

	mem.io.wdata := (regFile.io.rdata(1) << (alu_out(2,0) << 3.U))(63,0)


	regFile.io.wen := (control.io.wb_sel === WB_ALU ||
					control.io.wb_sel === WB_PC4 || 
					control.io.wb_sel === WB_MEM ) & (control.io.wb_en)


	st_mask := Mux(control.io.st_type === ST_SW, "b00001111".U,
						Mux(control.io.st_type === ST_SH, "b00000011".U,
							Mux(control.io.st_type === ST_SB, "b00000001".U, "b11111111".U)
						)
					)
	
	

	mem.io.mask := Mux(st_mask === "b11111111".U, st_mask(7,0), (st_mask << alu_out(2,0))(7,0)) 

	load_data := mem.io.rdata >> ((alu_out & "h07".U) << 3.U)
	load_data_ext := Mux(control.io.ld_type === LD_LW, Cat(Mux(load_data(31).asBool,"hffffffff".U,0.U(32.W)), load_data(31, 0)),
					Mux(control.io.ld_type === LD_LWU, Cat(Fill(32, 0.U), load_data(31, 0)) ,
						Mux(control.io.ld_type === LD_LH, Cat(Mux(load_data(15).asBool,"hffffffffffff".U,0.U(48.W)), load_data(15, 0)),
							Mux(control.io.ld_type === LD_LHU, Cat(Fill(48, 0.U), load_data(15, 0)),
								Mux(control.io.ld_type === LD_LB, Cat(Mux(load_data(7).asBool,"hffffffffffffff".U,0.U(56.W)), load_data(7, 0)),
									Mux(control.io.ld_type === LD_LBU, Cat(Fill(56, 0.U), load_data(7, 0)), load_data)
								)
							)
						)
					) 
				)

	//在一生一芯中，我作出如下假设，对于在一次访问能处理的非对齐访问交给硬件处理，对于一次访问不能处理的情况，交给软件处理
	//由于这里load_data的地址8字节对齐，这里为了保证和总线对接，我们必须选出返回的数据中我们需要的部分
	/*
	val l_offset = WireInit(UInt(3.W))
	l_offset := alu_out & "h7".U

	load_data := Mux(control.io.ld_type === LD_LW, Cat(Fill(mem.io.rdata(31),32), mem.io.rdata(l_offset*8 + 31, l_offset *8)),
					Mux(control.io.ld_type === LD_LWU, Cat(Fill(0, 32), mem.io.rdata(l_offset*8 + 31, l_offset *8)) ,
						Mux(control.io.ld_type === LD_LH, Cat(Fill(mem.io.rdata(15), 48), mem.io.rdata(l_offset * 8 + 15, l_offset * 8)),
							Mux(control.io.ld_type === LD_LHU, Cat(Fill(0, 48), mem.io.rdata(l_offset * 8 + 15, l_offset * 8)),
								Mux(control.io.ld_type === LD_LB, Cat(Fill(mem.io.rdata(7), 56), mem.io.rdata(l_offset *8 + 7,l_offset * 8)),
									Mux(control.io.ld_type === LD_LBU, Cat(Fill(0, 56), mem.io.rdata(l_offset * 8 + 7, l_offset * 8)), mem.io.rdata)
								)
							)
						)
					) 
				)
	*/

	regFile.io.waddr := dest
	regFile.io.wdata := Mux(control.io.wb_sel === WB_ALU, alu_out, 
						Mux(control.io.wb_sel === WB_PC4, pc_4, load_data_ext))
}


object Driver extends App{
    (new ChiselStage).emitVerilog(new myCPU, args)
}
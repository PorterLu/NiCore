package myCPU
import CSR._ 
import CSR_OP._ 
import Control._ 
import Alu._
import chisel3._ 
import chisel3.util._
import chisel3.experimental.BundleLiterals._

class gpr_ptr extends BlackBox with HasBlackBoxInline{
	val io = IO(new Bundle{
		val clock = Input(Clock())
		val reset = Input(Bool())
		val regfile = Input(Vec(32,UInt(64.W)))
	})
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

	for(i <- 0 until readPorts)
		io.rdata(i) := 0.U

	for(i <- 0 until readPorts){
		when(io.raddr(i) === 0.U){              //写zero寄存器做特殊判断
			io.rdata(i) := 0.U
		}.otherwise{
			io.rdata(i) := reg(io.raddr(i))
		}
	}

}

class DecodeStage extends Module{
	val io = IO(new Bundle{
		val flush_de = Input(Bool())
		val stall = Input(Bool())

		val csr_r_op = Output(UInt(3.W))
		val csr_r_addr = Output(UInt(12.W)) 

		val csr_cmd = Output(UInt(3.W))

		val csr_accessType_illegal = Input(Bool())
		val regFile_wen = Input(Bool())
		val regFile_waddr = Input(UInt(5.W))
		val regFile_wdata = Input(UInt(64.W))
		val csr_mode = Input(UInt(2.W))
		val csr_r_data = Input(UInt(64.W))
		val mw_pipe_reg_enable = Input(Bool())
		val mw_pipe_reg_dest = Input(Bool())
		val mw_pipe_reg_wb_en = Input(Bool())
		val mw_pipe_reg_wb_sel = Input(UInt(2.W))
		val mw_pipe_reg_alu_out = Input(UInt(64.W))
		val mw_pipe_reg_pc = Input(UInt(64.W))
		val mw_pipe_reg_csr_read_data = Input(UInt(64.W))
		val mw_pipe_reg_load_data = Input(UInt(64.W))

		val fd_pipe_reg = Input(new fetch_decode_pipeline_reg)
		val de_pipe_reg = Output(new decode_execute_pipeline_reg)
	})

	val de_pipe_reg = RegInit(
		(new decode_execute_pipeline_reg).Lit(
			_.inst -> Instructions.NOP,
			_.alu_op -> ALU_ADD,
			_.A_sel -> A_XXX,
			_.B_sel -> B_XXX,
			_.csr_read_data -> 0.U,
			_.csr_write_op -> CSR.N,
			_.csr_write_addr -> 0.U,
			_.csr_write_data -> 0.U,
			_.pc -> "h80000000".U,
			_.imm -> 0.U,
			_.imm_sel -> IMM_X,
			_.rs1 -> 0.U,
			_.src1_addr -> 0.U,
			_.rs2 -> 0.U,
			_.src2_addr -> 0.U,
			_.dest -> 0.U,
			_.pc_sel -> PC_4,
			_.br_type -> BR_XXX,
			_.st_type -> ST_XXX,
			_.ld_type -> LD_XXX,
			_.wd_type -> W_D,
			_.wb_sel -> WB_ALU,
			_.wb_en -> false.B,
			_.csr_inst_mode -> CSR_MODE_U,
			_.csr_is_illegal -> false.B,
			_.csr_inst_misalign -> false.B,
			_.enable -> false.B
		)
	)

	val immGen = Module(new ImmGenWire)
	val control = Module(new Control)
	val regFile = Module(new RegisterFile(35))			//有35个读口的寄存器文件

	val gpr_ptr = Module(new gpr_ptr)					//用于向外输出寄存器信息，用于debug
	
	regFile.io.raddr(2) := 0.U
	for(i <- 3 until 35){
		regFile.io.raddr(i) := (i-3).U
		gpr_ptr.io.regfile(i-3) := regFile.io.rdata(i);
	}

	//gpr_ptr向外同步的时机依靠时钟，所以要向外输出时钟
	//gpr_ptr.io.clock := clock
	//gpr_ptr.io.reset := reset


	control.io.inst := io.fd_pipe_reg.inst
	io.csr_cmd := control.io.csr_cmd

	val src1_addr = io.fd_pipe_reg.inst(19, 15)
	val src2_addr = io.fd_pipe_reg.inst(24, 20)
	val dest_addr = io.fd_pipe_reg.inst(11, 7)

	regFile.io.wen := io.regFile_wen
	regFile.io.waddr := io.regFile_waddr
	regFile.io.wdata := io.regFile_wdata
	regFile.io.raddr(0) := src1_addr
	regFile.io.raddr(1) := src2_addr

	immGen.io.inst := io.fd_pipe_reg.inst
	immGen.io.sel := control.io.imm_sel

	val csr_op = Mux((control.io.csr_cmd === CSR_RW) && (dest_addr === 0.U), CSR.W,
					Mux(control.io.csr_cmd === CSR_RW, CSR.RW,
						Mux((control.io.csr_cmd === CSR_RC)&&(src1_addr === 0.U), CSR.R,
							Mux((control.io.csr_cmd === CSR_RS) && (src1_addr === 0.U), CSR.R,
								Mux(control.io.csr_cmd === CSR_RS, CSR.RS, CSR.N)
							)
						)
					)
				)

	io.csr_r_op := csr_op
	io.csr_r_addr := io.fd_pipe_reg.inst(31, 20)
	val mode_illegal = io.fd_pipe_reg.inst(29, 28) > io.csr_mode && (csr_op =/= CSR.N)

	val csr_data = io.csr_r_data
	val csr_write_data = Mux(io.mw_pipe_reg_enable && (io.mw_pipe_reg_dest === src1_addr) && io.mw_pipe_reg_wb_en && (src1_addr =/= 0.U), 
							Mux(io.mw_pipe_reg_wb_sel === WB_ALU, io.mw_pipe_reg_alu_out,
								Mux(io.mw_pipe_reg_wb_sel === WB_PC4, io.mw_pipe_reg_pc + 4.U, 
									Mux(io.mw_pipe_reg_wb_sel === WB_CSR, io.mw_pipe_reg_csr_read_data, io.mw_pipe_reg_load_data))), regFile.io.rdata(0))

	val csr_write_addr = io.fd_pipe_reg.inst(31, 20)

	when(io.flush_de && !io.stall){
		de_pipe_reg.inst := Instructions.NOP
		de_pipe_reg.alu_op := 0.U
		de_pipe_reg.A_sel := A_XXX
		de_pipe_reg.B_sel := B_XXX
		de_pipe_reg.csr_read_data := 0.U
		de_pipe_reg.csr_write_op := CSR.N
		de_pipe_reg.csr_write_data := 0.U
		de_pipe_reg.csr_write_addr := 0.U
		de_pipe_reg.pc := "h80000000".U
		de_pipe_reg.imm := 0.U
		de_pipe_reg.imm_sel := IMM_X
		de_pipe_reg.rs1 := 0.U
		de_pipe_reg.src1_addr := 0.U
		de_pipe_reg.rs2 := 0.U
		de_pipe_reg.src2_addr := 0.U
		de_pipe_reg.dest := 0.U
		de_pipe_reg.pc_sel := PC_4
		de_pipe_reg.br_type := BR_XXX
		de_pipe_reg.st_type := ST_XXX
		de_pipe_reg.ld_type := LD_XXX
		de_pipe_reg.wd_type := W_D
		de_pipe_reg.wb_sel := WB_ALU
		de_pipe_reg.wb_en := false.B
		de_pipe_reg.csr_inst_mode := CSR_MODE_U
		de_pipe_reg.csr_is_illegal := false.B
		de_pipe_reg.csr_inst_misalign := false.B
		de_pipe_reg.enable := false.B
	}.elsewhen(!io.stall && !io.flush_de){			//&& !load_stall
		de_pipe_reg.inst := io.fd_pipe_reg.inst
		de_pipe_reg.alu_op := control.io.alu_op
		de_pipe_reg.A_sel := control.io.A_sel
		de_pipe_reg.B_sel := control.io.B_sel
		de_pipe_reg.csr_read_data := csr_data
		de_pipe_reg.csr_write_op := csr_op
		de_pipe_reg.csr_write_data := csr_write_data
		de_pipe_reg.csr_write_addr := csr_write_addr
		de_pipe_reg.pc := io.fd_pipe_reg.pc
		de_pipe_reg.imm := immGen.io.out
		de_pipe_reg.imm_sel := control.io.imm_sel
		de_pipe_reg.rs1 := Mux(io.mw_pipe_reg_enable && (io.mw_pipe_reg_dest === src1_addr) && io.mw_pipe_reg_wb_en && (src1_addr =/= 0.U), 
							Mux(io.mw_pipe_reg_wb_sel === WB_ALU, io.mw_pipe_reg_alu_out,
								Mux(io.mw_pipe_reg_wb_sel === WB_PC4, io.mw_pipe_reg_pc + 4.U, 
									Mux(io.mw_pipe_reg_wb_sel === WB_CSR, io.mw_pipe_reg_csr_read_data, io.mw_pipe_reg_load_data))),regFile.io.rdata(0))
		de_pipe_reg.src1_addr := src1_addr
		de_pipe_reg.rs2 := Mux(io.mw_pipe_reg_enable && (io.mw_pipe_reg_dest === src2_addr) && io.mw_pipe_reg_wb_en && (src2_addr =/= 0.U), 
							Mux(io.mw_pipe_reg_wb_sel === WB_ALU, io.mw_pipe_reg_alu_out,
								Mux(io.mw_pipe_reg_wb_sel === WB_PC4, io.mw_pipe_reg_pc + 4.U, 
									Mux(io.mw_pipe_reg_wb_sel === WB_CSR, io.mw_pipe_reg_csr_read_data, io.mw_pipe_reg_load_data))),regFile.io.rdata(1))
		de_pipe_reg.src2_addr := src2_addr
		de_pipe_reg.dest := dest_addr
		de_pipe_reg.pc_sel := control.io.pc_sel
		de_pipe_reg.br_type := control.io.br_type
		de_pipe_reg.st_type := control.io.st_type
		de_pipe_reg.ld_type := control.io.ld_type
		de_pipe_reg.wd_type := control.io.wd_type
		de_pipe_reg.wb_sel := control.io.wb_sel
		de_pipe_reg.wb_en := control.io.wb_en
		de_pipe_reg.csr_inst_mode := control.io.prv
		de_pipe_reg.csr_is_illegal := control.io.is_illegal || mode_illegal || io.csr_accessType_illegal || (control.io.prv > io.csr_mode)
		de_pipe_reg.csr_inst_misalign := ((io.fd_pipe_reg.pc & 3.U) =/= 0.U) && io.fd_pipe_reg.enable
		de_pipe_reg.enable := io.fd_pipe_reg.enable
	}

	io.de_pipe_reg := de_pipe_reg
}
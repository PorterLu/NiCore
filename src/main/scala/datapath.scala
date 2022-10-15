package myCPU

import chisel3._
import chisel3.util._
import chisel3.util.BitPat
import chisel3.stage.ChiselStage
import chisel3.experimental.BundleLiterals._
import cacheArbiter._ 
import cache_single_port._ 
import axi4._ 
import mdu._ 
import Control._ 
import Instructions._ 
import CSR_OP._ 
import CSR._ 
import Alu._

class CacheIO extends Bundle{
	val cpu_request = Output(new CPU_Request)
	val cpu_response = Input(new CPU_Response)
	val flush = Output(Bool())
	val accessType = Output(UInt(2.W))
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

class gpr_ptr extends BlackBox with HasBlackBoxInline{
	val io = IO(new Bundle{
		val clock = Input(Clock())
		val reset = Input(Bool())
		val regfile = Input(Vec(32,UInt(64.W)))
	})
}

class fetch_decode_pipeline_reg extends Bundle{
	val inst = chiselTypeOf(Instructions.NOP)
	val pc = UInt(64.W)
	val enable = Bool()
}

class decode_execute_pipeline_reg extends Bundle{
	val alu_op = UInt(5.W)										
	val pc = UInt(64.W)
	val inst = chiselTypeOf(Instructions.NOP)
	val imm = UInt(64.W)
	val imm_sel = UInt(3.W)
	val rs1 = UInt(64.W)
	val src1_addr = UInt(64.W)
	val rs2 = UInt(64.W)
	val src2_addr = UInt(64.W)
	val csr_read_data = UInt(64.W)
	val csr_write_op = UInt(3.W)
	val csr_write_addr = UInt(12.W)
	val csr_write_data = UInt(64.W)
	val dest = UInt(5.W)
	val A_sel = UInt(1.W)
	val B_sel = UInt(1.W)
	val pc_sel = UInt(2.W)
	val br_type = UInt(3.W)
	val wd_type = UInt(2.W)
	val st_type = UInt(3.W)
	val ld_type = UInt(3.W)
	val wb_sel = UInt(2.W)
	val wb_en = Bool()
	val csr_cmd = UInt(3.W)
	val csr_inst_mode = UInt(2.W)
	val csr_is_illegal = Bool()
	val csr_inst_misalign = Bool()
	val enable = Bool()
}


class  execute_mem_pipeline_reg extends Bundle{
	val alu_out = UInt(64.W)
	val alu_sum = UInt(64.W)
	val csr_read_data = UInt(64.W)
	val csr_write_op = UInt(3.W)
	val csr_write_addr = UInt(12.W)
	val csr_write_data = UInt(64.W)
	val jump_taken = Bool()
	val st_data = UInt(64.W)
	val st_type = UInt(3.W)
	val ld_type = UInt(3.W)
	val wb_sel = UInt(2.W)
	val wb_en = Bool()
	val dest = UInt(5.W)
	val pc = UInt(64.W)
	val inst = chiselTypeOf(Instructions.NOP)
	val is_clint = Bool()
	val csr_inst_mode = UInt(2.W)
	val csr_is_illegal = Bool()
	val csr_inst_misalign = Bool()
	val csr_load_misalign = Bool()
	val csr_store_misalign = Bool()
	val enable = Bool()
}

class mem_writeback_pipeline_reg extends Bundle{
	val load_data = UInt(64.W)
	val alu_out = UInt(64.W)
	val dest = UInt(5.W)
	val csr_read_data = UInt(64.W)
	val st_type = UInt(3.W)
	val ld_type = UInt(3.W)
	val wb_sel = UInt(2.W)
	val wb_en = Bool()
	val pc = UInt(64.W)
	val inst = chiselTypeOf(Instructions.NOP)
	val csr_write_op = UInt(3.W)					//write_op输入，可以写csr寄存器
	val csr_write_addr = UInt(12.W)					//csr寄存器地址
	val csr_write_data = UInt(64.W)					//要写的数据
	val enable = Bool()
}

class DatapathIO extends Bundle{
	val ctrl = Flipped(new ControlSignals)
	val pc = Output(UInt(64.W))
	val inst = Output(chiselTypeOf(Instructions.NOP))
	val commit_inst = Output(chiselTypeOf(Instructions.NOP))
	val start = Output(Bool())
	val stall = Output(Bool())
	val icache = new CacheIO
	val dcache = new CacheIO
	val interrupt = Input(Bool())
}


class Datapath extends Module{
	val io = IO(new DatapathIO)
	val fd_pipe_reg = RegInit(
		(new fetch_decode_pipeline_reg).Lit(
			_.inst -> Instructions.NOP,
			_.pc -> "h80000000".U,
			_.enable -> false.B,
		)
	)

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

	val em_pipe_reg = RegInit(
		(new execute_mem_pipeline_reg).Lit(
			_.inst -> Instructions.NOP,
			_.dest -> 0.U,
			_.alu_out -> 0.U,
			_.alu_sum -> 0.U,
			_.csr_read_data -> 0.U,
			_.csr_write_op -> CSR.N,
			_.csr_write_addr -> 0.U,
			_.csr_write_data -> 0.U,
			_.jump_taken -> false.B,
			_.st_data -> 0.U,
			_.st_type -> ST_XXX,
			_.ld_type -> LD_XXX,
			_.wb_sel -> WB_ALU,
			_.wb_en -> false.B,
			_.pc -> "h80000000".U,
			_.is_clint -> false.B,
			_.csr_inst_mode -> CSR_MODE_U,
			_.csr_is_illegal -> false.B,
			_.csr_inst_misalign -> false.B,
			_.csr_load_misalign -> false.B,
			_.csr_store_misalign -> false.B,
			_.enable -> false.B
		)
	)

	val mw_pipe_reg = RegInit(
		(new mem_writeback_pipeline_reg).Lit(
			_.inst -> Instructions.NOP,
			_.load_data -> 0.U,
			_.csr_read_data -> 0.U,
			_.st_type -> ST_XXX,
			_.ld_type -> LD_XXX,
			_.wb_sel -> WB_ALU,
			_.wb_en -> false.B,
			_.pc -> "h80000000".U,
			_.csr_write_op -> CSR.N,						//write_op输入，可以写csr寄存器
			_.csr_write_addr -> 0.U,						//csr寄存器地址
			_.csr_write_data -> 0.U,						//要写的数据
			_.enable -> false.B
		)
	)

	import AccessType._ 
	
	//必须使得enable信号为false时，对应的流水线寄存器中输出的内容不对CPU状态机的运行产生影响
	val alu = Module(new AluSimple(64))					
	val immGen = Module(new ImmGenWire)
	val brCond = Module(new BrCondSimple(64))			//专门用于跳转判断
	val regFile = Module(new RegisterFile(35))			//有35个读口的寄存器文件
	val multiplier = Module(new Multiplier)
	val divider = Module(new Divider)
	val started = RegInit(true.B)
	val icache_flush_tag = RegInit(false.B)
	val dcache_flush_tag = RegInit(false.B)
	val mul_stall = WireInit(false.B)					//multiplier.io.mul_valid && !mul_result_enable
	val div_stall = WireInit(false.B)					//divider.io.div_valid && !div_result_enable
	val data_cache_tag = RegInit(false.B)
	val data_cache_response_data = RegInit(0.U(64.W))
	val dcache_stall = (em_pipe_reg.ld_type.orR || em_pipe_reg.st_type.orR || em_pipe_reg.inst === FENCE_I) && 
						em_pipe_reg.enable && !data_cache_tag && !(em_pipe_reg.is_clint) 
	val icache_stall = !io.icache.cpu_response.ready
	val stall = icache_stall || dcache_stall || mul_stall || div_stall						//stall暂时设置为false

	val csr = Module(new CSR)							//csr寄存器文件，同时可以用于特权判断，中断和异常处理
	val jump_addr = Wire(UInt(64.W))					//要跳转的地址
	val gpr_ptr = Module(new gpr_ptr)					//用于向外输出寄存器信息，用于debug
	val clint  = Module(new clint())
	val br_flush = WireInit(false.B)
	val jmp_flush = WireInit(false.B)
	val csr_atomic_flush = WireInit(0.U(4.W))

	//csr的刷新，中间不会插入新的指令，那么取指的时候要把地址设为什么，这个地址默认设为当前指令的下一条指令如何，这个判断会复杂很多
	//如何更新下一条指令，可以直接更新pc

	val flush_fd = csr.io.flush_mask(0) || (br_flush || jmp_flush) || csr_atomic_flush(0) || icache_flush_tag || dcache_flush_tag
	val flush_de = csr.io.flush_mask(1)	|| (br_flush || jmp_flush) || csr_atomic_flush(1) || icache_flush_tag || dcache_flush_tag	// && !stall
	val flush_em = csr.io.flush_mask(2)	|| csr_atomic_flush(2) || (icache_flush_tag || dcache_flush_tag)							// && !stall
	val flush_mw = csr.io.flush_mask(3) || csr_atomic_flush(3)

	/***** Fetch ******/
	//第一个周期插入一个NOP，因为读内存要一个周期，为了之后流水线的每一个阶段只占用一个周期，采用第一个周期插入NOP的方法
	val brCond_taken = WireInit(false.B)
	val jmp_occur 	 = WireInit(false.B)
	val csr_atomic 	 = WireInit(false.B)

	io.start := started
	csr.io.int_timer_clear := clint.io.timer_clear
	csr.io.int_soft_clear := clint.io.soft_clear
	csr.io.int_timer := clint.io.timer_valid
	csr.io.int_soft  := clint.io.soft_valid
	csr.io.extern    := io.interrupt
	io.stall := stall

	//2号多余，寄存器文件依次读出，输出到gpr_ptr，最后在sim的过程输出寄存器信息用于调试
	regFile.io.raddr(2) := 0.U
	for(i <- 3 until 35){
		regFile.io.raddr(i) := (i-3).U
		gpr_ptr.io.regfile(i-3) := regFile.io.rdata(i);
	}

	//gpr_ptr向外同步的时机依靠时钟，所以要向外输出时钟
	//gpr_ptr.io.clock := clock
	//gpr_ptr.io.reset := reset
	 
	//向csr寄存器输入是否阻塞，阻塞的过程中无法处理中断异常，并且无法写入csr寄存器
	csr.io.stall := stall

	//flush信号，由csr得到信息后，进行判断要刷新那些流水寄存器	
	//这里如果发生了阻塞，会导致指令本身直接被刷新，但是如果保证了csr的原子性，那么就不会出现问题，因为不会出现阻塞，但是是否有可能被中断打断
	csr_atomic_flush :=  Mux(mw_pipe_reg.enable && (mw_pipe_reg.csr_write_op =/= CSR.N), "b1111".U,
								Mux(em_pipe_reg.enable && (em_pipe_reg.csr_write_op =/= CSR.N), "b0111".U,			//&& (em_pipe_reg.csr_write_op =/= CSR.R)
									Mux(de_pipe_reg.enable && (de_pipe_reg.csr_write_op =/= CSR.N), "b0011".U,	//&& (de_pipe_reg.csr_write_op =/= CSR.R)
										Mux(fd_pipe_reg.enable && (io.ctrl.csr_cmd =/= CSR_NOP),  "b0001".U, 0.U)
									)		
								)
							)
	val csr_next_fetch = Mux(mw_pipe_reg.enable && mw_pipe_reg.csr_write_op =/= CSR.N, mw_pipe_reg.pc + 4.U,
								Mux(em_pipe_reg.enable && em_pipe_reg.csr_write_op =/= CSR.N, em_pipe_reg.pc + 4.U,
										Mux(de_pipe_reg.enable && de_pipe_reg.csr_write_op =/= CSR.N, de_pipe_reg.pc + 4.U, fd_pipe_reg.pc + 4.U)
									)
							)

	csr_atomic := csr_atomic_flush.orR
	//下面next_pc默认是pc+4
	val pc = RegInit("h80000000".U(64.W) - 4.U)
	when(started){
		started := false.B
	}

	val next_pc = MuxCase(
		pc + 4.U,
		IndexedSeq(
		(!started && stall) -> pc,	
		csr.io.trap -> csr.io.trapVec,
		(icache_flush_tag || dcache_flush_tag) -> (em_pipe_reg.pc + 4.U),														//csr需要实现原子性
		(((de_pipe_reg.pc_sel === PC_ALU) && de_pipe_reg.enable)|| brCond_taken) ->(jump_addr >> 1.U << 1.U),					//是否jmp和jmp的结果应该和branch一样放在执行阶段 >> 1.U << 1.U
		csr_atomic -> csr_next_fetch)
	)

	//printf(p"next_pc:${Hexadecimal(next_pc)}; pc:${Hexadecimal(pc)}\n")
	//如果是跳转，异常和还未开始等情况，那么获取的是一条NOP指令，否则是从指令存储器中读取一条指令
	val	inst = Mux(started, Instructions.NOP, Mux(pc(2).asBool, io.icache.cpu_response.data(63, 32), io.icache.cpu_response.data(31, 0))) 

	//pc设置为next_pc, 存储的读取地址也设为next_pc
	pc := next_pc

	io.icache.accessType := word.asUInt
	io.icache.flush := icache_flush_tag
	io.icache.cpu_request.addr := next_pc 																						//Mux(stall && !started, pc, next_pc)
	io.icache.cpu_request.valid := true.B   
	io.icache.cpu_request.data := 0.U
	io.icache.cpu_request.rw := false.B
	io.icache.cpu_request.mask := 0.U

	//如何解释enable为false
	when(flush_fd && !stall){
		fd_pipe_reg.pc := "h80000000".U
		fd_pipe_reg.inst := Instructions.NOP
		fd_pipe_reg.enable := false.B
	}.elsewhen(!stall && !flush_fd){				// && !load_stall
		fd_pipe_reg.pc := pc
		fd_pipe_reg.inst := inst
		fd_pipe_reg.enable := true.B
	}

	//printf(p"de_code_stage:\npc:${Hexadecimal(fd_pipe_reg.pc)}; inst:${Hexadecimal(fd_pipe_reg.inst)};\n")
	/***** Decode ******/
	//control模块输入指令
	io.ctrl.inst := fd_pipe_reg.inst

	//地址若存在，则位置固定
	val src1_addr = fd_pipe_reg.inst(19, 15)
	val src2_addr = fd_pipe_reg.inst(24, 20)
	val dest_addr = fd_pipe_reg.inst(11, 7)

	//寄存器输入地址
	regFile.io.raddr(0) := src1_addr
	regFile.io.raddr(1)	:= src2_addr

	//准备实现立即数扩展
	immGen.io.inst := fd_pipe_reg.inst
	immGen.io.sel := io.ctrl.imm_sel

	//csr read
	val csr_op = Mux(
					(io.ctrl.csr_cmd === CSR_RW) && (dest_addr === 0.U), CSR.W, 
					Mux(io.ctrl.csr_cmd === CSR_RW, CSR.RW, 
						Mux((io.ctrl.csr_cmd === CSR_RC) && (src1_addr === 0.U), CSR.R,
							Mux(io.ctrl.csr_cmd === CSR_RC, CSR.RC,
								Mux((io.ctrl.csr_cmd === CSR_RS) && (src1_addr === 0.U), CSR.R,
									Mux(io.ctrl.csr_cmd === CSR_RS, CSR.RS, CSR.N)
								)
							)
						)
					)
				)

	csr.io.r_op := csr_op
	csr.io.r_addr := fd_pipe_reg.inst(31, 20)
	val mode_illegal = fd_pipe_reg.inst(29, 28) > csr.io.mode && (csr_op =/= CSR.N)

	val csr_data = csr.io.r_data
	val csr_write_data = Mux(mw_pipe_reg.enable && (mw_pipe_reg.dest === src1_addr) && mw_pipe_reg.wb_en && (src1_addr =/= 0.U), 
							Mux(mw_pipe_reg.wb_sel === WB_ALU, mw_pipe_reg.alu_out,
								Mux(mw_pipe_reg.wb_sel === WB_PC4, mw_pipe_reg.pc + 4.U, 
									Mux(mw_pipe_reg.wb_sel === WB_CSR, mw_pipe_reg.csr_read_data, mw_pipe_reg.load_data))), regFile.io.rdata(0))
	val csr_write_addr = fd_pipe_reg.inst(31, 20)

	when(flush_de && !stall){
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
	}.elsewhen(!stall && !flush_de){			//&& !load_stall
		de_pipe_reg.inst := fd_pipe_reg.inst
		de_pipe_reg.alu_op := io.ctrl.alu_op
		de_pipe_reg.A_sel := io.ctrl.A_sel
		de_pipe_reg.B_sel := io.ctrl.B_sel
		de_pipe_reg.csr_read_data := csr_data
		de_pipe_reg.csr_write_op := csr_op
		de_pipe_reg.csr_write_data := csr_write_data
		de_pipe_reg.csr_write_addr := csr_write_addr
		de_pipe_reg.pc := fd_pipe_reg.pc
		de_pipe_reg.imm := immGen.io.out
		de_pipe_reg.imm_sel := io.ctrl.imm_sel
		de_pipe_reg.rs1 := Mux(mw_pipe_reg.enable && (mw_pipe_reg.dest === src1_addr) && mw_pipe_reg.wb_en && (src1_addr =/= 0.U), 
							Mux(mw_pipe_reg.wb_sel === WB_ALU, mw_pipe_reg.alu_out,
								Mux(mw_pipe_reg.wb_sel === WB_PC4, mw_pipe_reg.pc + 4.U, 
									Mux(mw_pipe_reg.wb_sel === WB_CSR, mw_pipe_reg.csr_read_data, mw_pipe_reg.load_data))),regFile.io.rdata(0))
		de_pipe_reg.src1_addr := src1_addr
		de_pipe_reg.rs2 := Mux(mw_pipe_reg.enable && (mw_pipe_reg.dest === src2_addr) && mw_pipe_reg.wb_en && (src2_addr =/= 0.U), 
							Mux(mw_pipe_reg.wb_sel === WB_ALU, mw_pipe_reg.alu_out,
								Mux(mw_pipe_reg.wb_sel === WB_PC4, mw_pipe_reg.pc + 4.U, 
									Mux(mw_pipe_reg.wb_sel === WB_CSR, mw_pipe_reg.csr_read_data, mw_pipe_reg.load_data))),regFile.io.rdata(1))
		de_pipe_reg.src2_addr := src2_addr
		de_pipe_reg.dest := dest_addr
		de_pipe_reg.pc_sel := io.ctrl.pc_sel
		de_pipe_reg.br_type := io.ctrl.br_type
		de_pipe_reg.st_type := io.ctrl.st_type
		de_pipe_reg.ld_type := io.ctrl.ld_type
		de_pipe_reg.wd_type := io.ctrl.wd_type
		de_pipe_reg.wb_sel := io.ctrl.wb_sel
		de_pipe_reg.wb_en := io.ctrl.wb_en
		de_pipe_reg.csr_inst_mode := io.ctrl.prv
		de_pipe_reg.csr_is_illegal := io.ctrl.is_illegal || mode_illegal || csr.io.accessType_illegal || (io.ctrl.prv > csr.io.mode)
		de_pipe_reg.csr_inst_misalign := ((fd_pipe_reg.pc & 3.U) =/= 0.U) && fd_pipe_reg.enable
		de_pipe_reg.enable := fd_pipe_reg.enable
	}
	
	/*printf(p"execute_stage:\npc:${Hexadecimal(de_pipe_reg.pc)}; inst:${Hexadecimal(de_pipe_reg.inst)}; alu_op:${de_pipe_reg.alu_op}; csr_write_op:${de_pipe_reg.csr_write_op};" +
  p"ld_type:${de_pipe_reg.ld_type}; st_type:${de_pipe_reg.st_type}; br_type:${de_pipe_reg.br_type}\n")*/
	/****** Execute *****/
	csr.io.de_enable := de_pipe_reg.enable
	csr.io.de_pipe_reg_pc := de_pipe_reg.pc
	when(!stall && flush_em){
		icache_flush_tag := false.B 
		dcache_flush_tag := false.B
	}.elsewhen(de_pipe_reg.inst === FENCE_I && !stall){
		icache_flush_tag := true.B 
		dcache_flush_tag := true.B
	}.otherwise{
		when(io.icache.cpu_response.ready){
			icache_flush_tag := false.B
		}
		when(io.dcache.cpu_response.ready){								//io.dcache.cpu_response.ready
			dcache_flush_tag := false.B
		}
	}

	val computation_result = WireInit(0.U(64.W))
	val src1_data = WireInit(0.U(64.W))
	val src2_data = WireInit(0.U(64.W))
	val alu_out = WireInit(0.U(64.W))
	val alu_sum = WireInit(0.U(64.W))
	val is_clint = alu_out >= "h2000000".U && alu_out <= "h200ffff".U && de_pipe_reg.enable && (de_pipe_reg.ld_type.orR || de_pipe_reg.st_type.orR)

	val load_data_hazard = Mux(em_pipe_reg.is_clint && em_pipe_reg.enable, clint.io.r_data, data_cache_response_data >> ((em_pipe_reg.alu_out & "h07".U) << 3.U))
	val load_data_ext_hazard = Mux(em_pipe_reg.ld_type === LD_LW, Cat(Mux(load_data_hazard(31).asBool, "hffffffff".U, 0.U(32.W)), load_data_hazard(31, 0)),
								Mux(em_pipe_reg.ld_type === LD_LWU, Cat(Fill(32, 0.U), load_data_hazard(31, 0)),
									Mux(em_pipe_reg.ld_type === LD_LH, Cat(Mux(load_data_hazard(15).asBool, "hffffffffffff".U, 0.U(48.W)), load_data_hazard(15, 0)),
										Mux(em_pipe_reg.ld_type === LD_LHU, Cat(Fill(48, 0.U), load_data_hazard(15, 0)),
											Mux(em_pipe_reg.ld_type === LD_LB, Cat(Mux(load_data_hazard(7).asBool, "hffffffffffffff".U, 0.U(56.W)), load_data_hazard(7, 0)),
												Mux(em_pipe_reg.ld_type === LD_LBU, Cat(Fill(56, 0.U), load_data_hazard(7,0)), load_data_hazard)
											)
										)
									)
								)
							)

	val src_unready = ((de_pipe_reg.src1_addr === em_pipe_reg.dest) 
						|| (de_pipe_reg.src2_addr === em_pipe_reg.dest)) && em_pipe_reg.ld_type.orR && !data_cache_tag && em_pipe_reg.enable && de_pipe_reg.enable && !em_pipe_reg.is_clint
	val mul_result = RegInit(0.U(64.W))
	val mul_result_enable = RegInit(false.B)
	val div_result = RegInit(0.U(64.W))
	val div_result_enable = RegInit(false.B)

	alu_out := alu.io.out
	alu_sum := alu.io.sum

	mul_stall := de_pipe_reg.enable  && !mul_result_enable && (de_pipe_reg.alu_op === Alu.ALU_MUL) //&& multiplier.io.mul_valid
	div_stall := de_pipe_reg.enable  && !div_result_enable && ((de_pipe_reg.alu_op === Alu.ALU_REM) 
																|| (de_pipe_reg.alu_op === Alu.ALU_DIV) 
																|| (de_pipe_reg.alu_op === Alu.ALU_REMU) 
																|| (de_pipe_reg.alu_op === Alu.ALU_DIVU)) //divider.io.div_valid//


	multiplier.io.mul_valid := ((de_pipe_reg.alu_op === Alu.ALU_MUL) && de_pipe_reg.enable) && !src_unready && !mul_result_enable
	multiplier.io.flush := flush_de
	multiplier.io.mulw := Mux(de_pipe_reg.wd_type === W_D, false.B, true.B)
	multiplier.io.mul_op := Mux(de_pipe_reg.inst === MUL || de_pipe_reg.inst === MULW, MulOp.mul.asUInt, 
							Mux(de_pipe_reg.inst === MULH, MulOp.mulh.asUInt,
								Mux(de_pipe_reg.inst === MULHSU, MulOp.mulhsu.asUInt, MulOp.mulhu.asUInt)
							)
						)

	multiplier.io.multilicand := src1_data.asSInt
	multiplier.io.multiplier := src2_data.asSInt

	divider.io.div_valid := ((de_pipe_reg.alu_op === Alu.ALU_DIVU) || 
								(de_pipe_reg.alu_op === Alu.ALU_DIV) || 
								(de_pipe_reg.alu_op === Alu.ALU_REM) || 
								(de_pipe_reg.alu_op === Alu.ALU_REMU)) && de_pipe_reg.enable && !src_unready && !div_result_enable
	divider.io.flush := flush_de
	divider.io.divw := Mux(de_pipe_reg.wd_type === W_D, false.B, true.B)
	divider.io.div_signed := (de_pipe_reg.alu_op === Alu.ALU_DIV) || (de_pipe_reg.alu_op === Alu.ALU_REM)
	divider.io.dividend := src1_data.asSInt
	divider.io.divisor := src2_data.asSInt

	when(flush_de){
		mul_result_enable := false.B
	}.elsewhen(multiplier.io.out_valid){
		mul_result := multiplier.io.result.asUInt
		mul_result_enable := true.B
	}

	when(flush_de){
		div_result_enable := false.B
	}.elsewhen(divider.io.out_valid){
		div_result_enable := true.B
		when(de_pipe_reg.alu_op === Alu.ALU_DIVU || de_pipe_reg.alu_op === Alu.ALU_DIV){
			div_result := divider.io.quotient.asUInt
		}.elsewhen(de_pipe_reg.alu_op === Alu.ALU_REMU || de_pipe_reg.alu_op === Alu.ALU_REM){
			div_result := divider.io.remainder.asUInt
		}
	}

	multiplier.io.out_ready := mul_result_enable
	divider.io.out_ready := div_result_enable

	computation_result := Mux(de_pipe_reg.alu_op === Alu.ALU_DIV || de_pipe_reg.alu_op === Alu.ALU_DIVU, div_result,
								Mux(de_pipe_reg.alu_op === Alu.ALU_REM || de_pipe_reg.alu_op === Alu.ALU_REMU, div_result,
									Mux(de_pipe_reg.alu_op === Alu.ALU_MUL, mul_result, alu_out)
								)
							)

	when(em_pipe_reg.enable && em_pipe_reg.wb_en && (de_pipe_reg.src1_addr === em_pipe_reg.dest) && (de_pipe_reg.src1_addr =/= 0.U)){
		when(de_pipe_reg.src1_addr === em_pipe_reg.dest){
			src1_data := Mux(em_pipe_reg.wb_sel === WB_ALU, em_pipe_reg.alu_out,
						Mux(em_pipe_reg.wb_sel === WB_PC4, em_pipe_reg.pc + 4.U, 
							Mux(em_pipe_reg.wb_sel === WB_CSR, em_pipe_reg.csr_read_data, load_data_ext_hazard)))
		}
	}.elsewhen(mw_pipe_reg.enable && mw_pipe_reg.wb_en &&(de_pipe_reg.src1_addr === mw_pipe_reg.dest) && (de_pipe_reg.src1_addr =/= 0.U)){
		when(de_pipe_reg.src1_addr === mw_pipe_reg.dest){
			src1_data := Mux(mw_pipe_reg.wb_sel === WB_ALU, mw_pipe_reg.alu_out,
						Mux(mw_pipe_reg.wb_sel === WB_PC4, mw_pipe_reg.pc + 4.U, 
							Mux(mw_pipe_reg.wb_sel === WB_CSR, mw_pipe_reg.csr_read_data, mw_pipe_reg.load_data)))
		}
	}.otherwise{
		src1_data := de_pipe_reg.rs1
	}

	when(em_pipe_reg.enable && em_pipe_reg.wb_en && (de_pipe_reg.src2_addr === em_pipe_reg.dest) && (de_pipe_reg.src2_addr =/= 0.U)){
		when(de_pipe_reg.src2_addr === em_pipe_reg.dest){
			src2_data := Mux(em_pipe_reg.wb_sel === WB_ALU, em_pipe_reg.alu_out,
						Mux(em_pipe_reg.wb_sel === WB_PC4, em_pipe_reg.pc + 4.U, 
							Mux(em_pipe_reg.wb_sel === WB_CSR, em_pipe_reg.csr_read_data, load_data_ext_hazard)))
		}
	}.elsewhen(mw_pipe_reg.enable && mw_pipe_reg.wb_en &&(de_pipe_reg.src2_addr === mw_pipe_reg.dest) && (de_pipe_reg.src2_addr =/= 0.U)){
		when(de_pipe_reg.src2_addr === mw_pipe_reg.dest){
			src2_data := Mux(mw_pipe_reg.wb_sel === WB_ALU, mw_pipe_reg.alu_out,
						Mux(mw_pipe_reg.wb_sel === WB_PC4, mw_pipe_reg.pc + 4.U, 
							Mux(mw_pipe_reg.wb_sel === WB_CSR, mw_pipe_reg.csr_read_data, mw_pipe_reg.load_data)))
		}
	}.otherwise{
		src2_data := de_pipe_reg.rs2
	}

	alu.io.alu_op := de_pipe_reg.alu_op
	alu.io.width_type := de_pipe_reg.wd_type
	val A_data = Mux(de_pipe_reg.A_sel.asBool, src1_data, de_pipe_reg.pc)
	val B_data = Mux(de_pipe_reg.B_sel.asBool, src2_data, de_pipe_reg.imm)
	alu.io.A := Mux(de_pipe_reg.wd_type === W_W, A_data(31, 0), A_data)
	alu.io.B := Mux(de_pipe_reg.wd_type === W_W, B_data(31, 0), B_data)
	
	jmp_occur := de_pipe_reg.enable && (de_pipe_reg.pc_sel === PC_ALU)
	jmp_flush := jmp_occur
	brCond.io.br_type := de_pipe_reg.br_type 							//思考跳转发生时会发生什么？当跳转发生时，前一个周期的指令直接被刷新为nop
	brCond.io.rs1 := src1_data											//A_data
	brCond.io.rs2 := src2_data											//B_data
	jump_addr := alu_out
	brCond_taken := brCond.io.taken && de_pipe_reg.enable				//taken需要信号有效时才产生作用
	br_flush := brCond_taken

	when(flush_em && !stall){
		em_pipe_reg.inst := Instructions.NOP
		em_pipe_reg.dest := 0.U
		em_pipe_reg.alu_out := 0.U
		em_pipe_reg.alu_sum := 0.U
		em_pipe_reg.csr_read_data := 0.U
		em_pipe_reg.csr_write_op := CSR.N
		em_pipe_reg.csr_write_addr := 0.U
		em_pipe_reg.csr_write_data := 0.U
		em_pipe_reg.jump_taken := false.B
		em_pipe_reg.st_data := 0.U
		em_pipe_reg.st_type := ST_XXX
		em_pipe_reg.ld_type := LD_XXX
		em_pipe_reg.wb_sel := WB_ALU
		em_pipe_reg.wb_en := false.B
		em_pipe_reg.pc := "h80000000".U
		em_pipe_reg.is_clint := false.B
		em_pipe_reg.csr_inst_mode := CSR_MODE_U
		em_pipe_reg.csr_is_illegal := false.B 
		em_pipe_reg.csr_inst_misalign := false.B
		em_pipe_reg.csr_store_misalign := false.B
		em_pipe_reg.csr_load_misalign := false.B
		em_pipe_reg.enable := false.B
	}.elsewhen(!stall && !flush_em){
		em_pipe_reg.inst := de_pipe_reg.inst
		em_pipe_reg.dest := de_pipe_reg.dest
		em_pipe_reg.alu_out := computation_result //alu_result
		mul_result_enable := false.B
		div_result_enable := false.B
		em_pipe_reg.alu_sum := alu_sum
		em_pipe_reg.csr_read_data := de_pipe_reg.csr_read_data
		em_pipe_reg.csr_write_op := de_pipe_reg.csr_write_op
		em_pipe_reg.csr_write_addr := de_pipe_reg.csr_write_addr
		em_pipe_reg.csr_write_data := Mux(de_pipe_reg.imm_sel === IMM_Z, de_pipe_reg.imm, src1_data)
		em_pipe_reg.jump_taken := brCond_taken || (de_pipe_reg.pc_sel === PC_ALU && de_pipe_reg.enable)
		em_pipe_reg.st_data := src2_data
		em_pipe_reg.st_type := de_pipe_reg.st_type
		em_pipe_reg.ld_type := de_pipe_reg.ld_type
		em_pipe_reg.wb_sel := de_pipe_reg.wb_sel
		em_pipe_reg.wb_en := de_pipe_reg.wb_en
		em_pipe_reg.pc := de_pipe_reg.pc
		em_pipe_reg.is_clint := is_clint
		em_pipe_reg.csr_inst_mode := de_pipe_reg.csr_inst_mode
		em_pipe_reg.csr_is_illegal := de_pipe_reg.csr_is_illegal
		em_pipe_reg.csr_inst_misalign := de_pipe_reg.csr_inst_misalign
		em_pipe_reg.csr_store_misalign := (de_pipe_reg.st_type =/= ST_XXX) && 
											MuxCase(false.B,
												IndexedSeq(
													(de_pipe_reg.st_type === ST_SB) -> false.B,
													(de_pipe_reg.st_type === ST_SH) -> (alu_out(0) =/= 0.U),
													(de_pipe_reg.st_type === ST_SW) -> (alu_out(1, 0) =/= 0.U),
													(de_pipe_reg.st_type === ST_SD) -> (alu_out(2, 0) =/= 0.U)
												)
											)
		em_pipe_reg.csr_load_misalign := (de_pipe_reg.ld_type =/= LD_XXX) && 
											MuxCase(false.B,
												IndexedSeq(
													(de_pipe_reg.ld_type === LD_LB || de_pipe_reg.ld_type === LD_LBU) -> false.B,
													(de_pipe_reg.ld_type === LD_LH || de_pipe_reg.ld_type === LD_LHU) -> (alu_out(0) =/= 0.U),
													(de_pipe_reg.ld_type === LD_LW || de_pipe_reg.ld_type === LWU)	-> (alu_out(1, 0) =/= 0.U),
													(de_pipe_reg.ld_type === LD_LD) -> (alu_out(2,0) =/= 0.U)
												)
											) 
		em_pipe_reg.enable := de_pipe_reg.enable
	}
	
	//printf(p"mem_stage:\n inst: ${Hexadecimal(em_pipe_reg.inst)}; pc:${Hexadecimal(em_pipe_reg.pc)}; alu_out:${Hexadecimal{em_pipe_reg.pc}}; ld_type:${em_pipe_reg.ld_type}; st_type:${em_pipe_reg.st_type}\n")
	/****** Mem *********/
	when(!stall){
		data_cache_tag := false.B
	}.elsewhen(io.dcache.cpu_request.valid && io.dcache.cpu_response.ready){
		data_cache_tag := true.B
		data_cache_response_data := io.dcache.cpu_response.data
	} 

	clint.io.addr := em_pipe_reg.alu_out
	clint.io.w_data := em_pipe_reg.st_data
	clint.io.wen := em_pipe_reg.st_type.orR && em_pipe_reg.enable && em_pipe_reg.is_clint
	
	csr.io.em_enable := em_pipe_reg.enable
	io.dcache.flush := dcache_flush_tag
	io.dcache.cpu_request.valid := (Mux(stall, (em_pipe_reg.ld_type.orR || em_pipe_reg.st_type.orR) && em_pipe_reg.enable && (!em_pipe_reg.is_clint), 
										(de_pipe_reg.ld_type.orR || de_pipe_reg.st_type.orR) && de_pipe_reg.enable && !is_clint && !flush_em) || (dcache_flush_tag && flush_em)) && (!data_cache_tag)
	io.dcache.cpu_request.rw := Mux(stall, em_pipe_reg.st_type.orR && em_pipe_reg.enable, de_pipe_reg.st_type.orR && de_pipe_reg.enable) 
	io.dcache.cpu_request.addr := Mux(stall, em_pipe_reg.alu_out, alu_out)
	io.dcache.cpu_request.data := Mux(stall, em_pipe_reg.st_data << (em_pipe_reg.alu_out(2, 0) << 3.U), src2_data << (alu_out(2, 0) << 3.U))(63, 0)
	val accessType_stall = Mux((em_pipe_reg.ld_type === 7.U) || (em_pipe_reg.st_type === 4.U), double.asUInt, 
								Mux((em_pipe_reg.ld_type === 1.U) || (em_pipe_reg.ld_type === 6.U) || (em_pipe_reg.st_type === 1.U), word.asUInt, 
									Mux((em_pipe_reg.ld_type === 4.U) || (em_pipe_reg.ld_type === 2.U) || (em_pipe_reg.st_type === 2.U), half.asUInt, byte.asUInt)
								)
							)

	val accessType_direct = Mux((de_pipe_reg.ld_type === 7.U) || (de_pipe_reg.st_type === 4.U), double.asUInt,
								Mux((de_pipe_reg.ld_type === 1.U) || (de_pipe_reg.ld_type === 6.U) || (de_pipe_reg.st_type === 1.U), word.asUInt,
									Mux((de_pipe_reg.ld_type === 4.U) || (de_pipe_reg.ld_type === 2.U) || (de_pipe_reg.st_type === 2.U), half.asUInt, byte.asUInt)
								)
							)
	
	io.dcache.accessType := Mux(stall, accessType_stall, accessType_direct)
	val st_mask = Mux(stall, Mux(em_pipe_reg.st_type === ST_SW, "b00001111".U, 
								Mux(em_pipe_reg.st_type === ST_SH, "b00000011".U,
									Mux(em_pipe_reg.st_type === ST_SB, "b00000001".U, "b11111111".U)
								)
							),
							Mux(de_pipe_reg.st_type === ST_SW, "b00001111".U, 
								Mux(de_pipe_reg.st_type === ST_SH, "b00000011".U,
									Mux(de_pipe_reg.st_type === ST_SB, "b00000001".U, "b11111111".U)
								)
							)
						) 

	io.dcache.cpu_request.mask := Mux(st_mask === "b11111111".U, st_mask(7, 0), Mux(stall, (st_mask << em_pipe_reg.alu_out(2,0))(7, 0), (st_mask << alu_out(2,0))(7, 0)))
	val load_data = Mux(em_pipe_reg.is_clint, clint.io.r_data, data_cache_response_data >> ((em_pipe_reg.alu_out & "h07".U) << 3.U)) //(em_pipe_reg.alu_out >= "h2000000".U) && (em_pipe_reg.alu_out <= "h200ffff".U)
	val load_data_ext = Mux(em_pipe_reg.ld_type === LD_LW, Cat(Mux(load_data(31).asBool, "hffffffff".U, 0.U(32.W)), load_data(31, 0)),
							Mux(em_pipe_reg.ld_type === LD_LWU, Cat(Fill(32, 0.U), load_data(31, 0)),
								Mux(em_pipe_reg.ld_type === LD_LH, Cat(Mux(load_data(15).asBool, "hffffffffffff".U, 0.U(48.W)), load_data(15, 0)),
									Mux(em_pipe_reg.ld_type === LD_LHU, Cat(Fill(48, 0.U), load_data(15, 0)),
										Mux(em_pipe_reg.ld_type === LD_LB, Cat(Mux(load_data(7).asBool, "hffffffffffffff".U, 0.U(56.W)), load_data(7, 0)),
											Mux(em_pipe_reg.ld_type === LD_LBU, Cat(Fill(56, 0.U), load_data(7,0)), load_data)
											)
										)
									)
								)
							)

	csr.io.inst := em_pipe_reg.inst								//mw中马上要commit的指令
	csr.io.isSret := em_pipe_reg.inst === Instructions.SRET		//sret
	csr.io.isMret := em_pipe_reg.inst === Instructions.MRET		//mret
	csr.io.excPC := em_pipe_reg.pc								//出现异常的pc地址，这个mw_pipe_reg.pc这个是不一定的，可能是其他的异常在最后进行了提交
	csr.io.jump_taken := em_pipe_reg.jump_taken					//可能出现跳转的情况，即中断的下一条地址并不是pc+4，
	//csr.io.inst_mode := em_pipe_reg.csr_inst_mode 
	csr.io.is_illegal := em_pipe_reg.csr_is_illegal
	csr.io.inst_misalign := em_pipe_reg.csr_inst_misalign
	csr.io.store_misalign := em_pipe_reg.csr_store_misalign
	csr.io.load_misalign := em_pipe_reg.csr_load_misalign
	csr.io.alu_out := em_pipe_reg.alu_out
	
	when(flush_mw && !stall){
		mw_pipe_reg.load_data := 0.U
		mw_pipe_reg.alu_out := 0.U
		mw_pipe_reg.dest := 0.U
		mw_pipe_reg.wb_sel := WB_ALU
		mw_pipe_reg.wb_en := false.B
		mw_pipe_reg.pc := "h80000000".U
		mw_pipe_reg.inst := Instructions.NOP
		mw_pipe_reg.csr_read_data := 0.U
		mw_pipe_reg.csr_write_op := CSR.N							//write_op输入，可以写csr寄存器
		mw_pipe_reg.csr_write_addr := 0.U  							//csr寄存器地址
		mw_pipe_reg.csr_write_data := 0.U							//要写的数据
		mw_pipe_reg.enable := false.B
	}.elsewhen(!stall && !flush_mw){
		mw_pipe_reg.load_data := load_data_ext
		mw_pipe_reg.alu_out := em_pipe_reg.alu_out
		mw_pipe_reg.dest := em_pipe_reg.dest
		mw_pipe_reg.wb_sel := em_pipe_reg.wb_sel
		mw_pipe_reg.wb_en := em_pipe_reg.wb_en
		mw_pipe_reg.pc := em_pipe_reg.pc
		mw_pipe_reg.inst := em_pipe_reg.inst
		mw_pipe_reg.csr_read_data := em_pipe_reg.csr_read_data
		mw_pipe_reg.csr_write_op := em_pipe_reg.csr_write_op			//write_op输入，可以写csr寄存器
		mw_pipe_reg.csr_write_addr := em_pipe_reg.csr_write_addr		//csr寄存器地址
		mw_pipe_reg.csr_write_data := em_pipe_reg.csr_write_data		//要写的数据
		mw_pipe_reg.enable := em_pipe_reg.enable
	}

	//printf(p"writeback_stage:\nload_data:${Hexadecimal(load_data_ext)}; pc:${Hexadecimal(mw_pipe_reg.pc)}; inst:${Hexadecimal(mw_pipe_reg.inst)}; csr_op:${Hexadecimal(mw_pipe_reg.csr_write_op)}\n\n\n")
	/****** Writeback ***/
	csr.io.mw_enable := mw_pipe_reg.enable
	csr.io.retired := mw_pipe_reg.inst =/= Instructions.NOP			//指令如果不是nop，则指令计数器要进行加1
	csr.io.w_op := mw_pipe_reg.csr_write_op							//write_op输入，可以写csr寄存器
	csr.io.w_addr := mw_pipe_reg.csr_write_addr						//csr寄存器地址
	csr.io.w_data := mw_pipe_reg.csr_write_data						//要写的数据

	io.pc := mw_pipe_reg.pc
	io.inst := em_pipe_reg.inst
	io.commit_inst := mw_pipe_reg.inst

	regFile.io.wen := ((mw_pipe_reg.wb_sel === WB_ALU ||
						mw_pipe_reg.wb_sel === WB_PC4 ||
						mw_pipe_reg.wb_sel === WB_MEM || mw_pipe_reg.wb_sel === WB_CSR) && (mw_pipe_reg.wb_en)) && mw_pipe_reg.enable && !stall
	regFile.io.waddr := mw_pipe_reg.dest
	regFile.io.wdata := Mux(mw_pipe_reg.wb_sel === WB_ALU, mw_pipe_reg.alu_out,
							Mux(mw_pipe_reg.wb_sel === WB_PC4, mw_pipe_reg.pc + 4.U, 
								Mux(mw_pipe_reg.wb_sel === WB_CSR, mw_pipe_reg.csr_read_data, mw_pipe_reg.load_data)
							)
						)
}

class myCPU extends Module{
	val io = IO(new Bundle{
		val pc_debug = Output(UInt(64.W))
		val inst = Output(UInt(32.W))
		val commit_inst = Output(UInt(32.W))
		val start = Output(Bool())
		val stall = Output(Bool())
		
		val interrupt = Input(Bool())

		//write address channel
		val master_awready = Input(Bool())
		val master_awvalid = Output(Bool())
		val master_awaddr = Output(UInt(32.W))
		val master_awid = Output(UInt(4.W))
		val master_awlen = Output(UInt(8.W))
		val master_awsize = Output(UInt(3.W))
		val master_awburst = Output(UInt(2.W))

		//write data channel
		val master_wready = Input(Bool())
		val master_wvalid = Output(Bool())
		val master_wdata = Output(UInt(64.W))
		val master_wstrb = Output(UInt(8.W))
		val master_wlast = Output(Bool())

		//write response
		val master_bready = Output(Bool())
		val master_bvalid = Input(Bool())
		val master_bresp = Input(UInt(2.W))
		val master_bid = Input(UInt(4.W))

		//read address channel
		val master_arready = Input(Bool())
		val master_arvalid = Output(Bool())
		val master_araddr = Output(UInt(32.W))
		val master_arid = Output(UInt(4.W))
		val master_arlen = Output(UInt(8.W))
		val master_arsize = Output(UInt(3.W))
		val master_arburst = Output(UInt(2.W))

		//read data channel
		val master_rready = Output(Bool())
		val master_rvalid = Input(Bool())
		val master_rresp = Input(UInt(2.W))
		val master_rdata = Input(UInt(64.W))
		val master_rlast = Input(Bool())
		val master_rid = Input(UInt(4.W))

		//slave signals
		//aw channel
		val slave_awready = Output(Bool())
		val slave_awvalid = Input(Bool())
		val slave_awaddr  = Input(UInt(32.W))
		val slave_awid 	  = Input(UInt(4.W))
		val slave_awlen   = Input(UInt(8.W))
		val slave_awsize  = Input(UInt(3.W))
		val slave_awburst = Input(UInt(2.W))

		//w channel
		val slave_wready  = Output(Bool())
		val slave_wvalid  = Input(Bool())
		val slave_wdata   = Input(UInt(64.W))
		val slave_wstrb   = Input(UInt(8.W))
		val slave_wlast   = Input(Bool())

		//write response channel
		val slave_bready  = Input(Bool())
		val slave_bvalid  = Output(Bool())
		val slave_bresp   = Output(UInt(2.W))
		val slave_bid 	  = Output(UInt(4.W))
		
		//ar channel
		val slave_arready = Output(Bool())
		val slave_arvalid = Input(Bool())
		val slave_araddr  = Input(UInt(32.W))
		val slave_arid    = Input(UInt(4.W))
		val slave_arlen   = Input(UInt(8.W))
		val slave_arsize  = Input(UInt(3.W))
		val slave_arburst = Input(UInt(2.W))

		//r channel
		val slave_rready  = Input(Bool())
		val slave_rvalid  = Output(Bool())
		val slave_rresp   = Output(UInt(2.W))
		val slave_rdata   = Output(UInt(64.W))
		val slave_rlast   = Output(Bool())
		val slave_rid     = Output(UInt(4.W))

		//sram接口
		/*val sram0_addr 	  = Output(UInt(6.W))
		val sram0_cen 	  = Output(Bool())
		val sram0_wen 	  = Output(Bool())
		val sram0_wmask   = Output(UInt(128.W))
		val sram0_wdata   = Output(UInt(128.W))
		
		val sram1_addr 	  = Output(UInt(6.W))
		val sram1_cen 	  = Output(Bool())
		val sram1_wen 	  = Output(Bool())
		val sram1_wmask   = Output(UInt(128.W))
		val sram1_wdata   = Output(UInt(128.W))

		val sram2_addr 	  = Output(UInt(6.W))
		val sram2_cen 	  = Output(Bool())
		val sram2_wen 	  = Output(Bool())
		val sram2_wmask   = Output(UInt(128.W))
		val sram2_wdata   = Output(UInt(128.W))

		val sram3_addr 	  = Output(UInt(6.W))
		val sram3_cen 	  = Output(Bool())
		val sram3_wen 	  = Output(Bool())
		val sram3_wmask   = Output(UInt(128.W))
		val sram3_wdata   = Output(UInt(128.W))

		val sram4_addr 	  = Output(UInt(6.W))
		val sram4_cen 	  = Output(Bool())
		val sram4_wen 	  = Output(Bool())
		val sram4_wmask   = Output(UInt(128.W))
		val sram4_wdata   = Output(UInt(128.W))

		val sram5_addr 	  = Output(UInt(6.W))
		val sram5_cen 	  = Output(Bool())
		val sram5_wen 	  = Output(Bool())
		val sram5_wmask   = Output(UInt(128.W))
		val sram5_wdata   = Output(UInt(128.W))

		val sram6_addr 	  = Output(UInt(6.W))
		val sram6_cen 	  = Output(Bool())
		val sram6_wen 	  = Output(Bool())
		val sram6_wmask   = Output(UInt(128.W))
		val sram6_wdata   = Output(UInt(128.W))

		val sram7_addr 	  = Output(UInt(6.W))
		val sram7_cen 	  = Output(Bool())
		val sram7_wen 	  = Output(Bool())
		val sram7_wmask   = Output(UInt(128.W))
		val sram7_wdata   = Output(UInt(128.W))*/
	})

	val datapath = Module(new Datapath) 
	val control = Module(new Control)
	val icache = Module(new Cache("inst_cache"))
	val dcache = Module(new Cache("data_cache"))
	val arb = Module(new CacheArbiter) 
	datapath.io.ctrl <> control.io
	datapath.io.icache.cpu_request <> icache.io.cpu_request
	datapath.io.dcache.cpu_request <> dcache.io.cpu_request
	datapath.io.icache.cpu_response <> icache.io.cpu_response
	datapath.io.dcache.cpu_response <> dcache.io.cpu_response
	datapath.io.interrupt := io.interrupt
	icache.io.flush	:= datapath.io.icache.flush
	dcache.io.flush	:= datapath.io.dcache.flush
	icache.io.accessType := datapath.io.icache.accessType
	dcache.io.accessType := datapath.io.dcache.accessType
	icache.io.mem_io <> arb.io.icache
	dcache.io.mem_io <> arb.io.dcache
	
	arb.io.axi_out.aw.ready := io.master_awready
	io.master_awvalid := arb.io.axi_out.aw.valid
	io.master_awaddr := arb.io.axi_out.aw.bits.addr
	io.master_awid := arb.io.axi_out.aw.bits.id
	io.master_awlen := arb.io.axi_out.aw.bits.len
	io.master_awsize := arb.io.axi_out.aw.bits.size
	io.master_awburst := arb.io.axi_out.aw.bits.burst

	arb.io.axi_out.w.ready := io.master_wready
	io.master_wvalid := arb.io.axi_out.w.valid
	io.master_wdata := arb.io.axi_out.w.bits.data
	io.master_wstrb := arb.io.axi_out.w.bits.strb
	io.master_wlast := arb.io.axi_out.w.bits.last

	io.master_bready := arb.io.axi_out.b.ready
	arb.io.axi_out.b.valid := io.master_bvalid
	arb.io.axi_out.b.bits.resp := io.master_bresp
	arb.io.axi_out.b.bits.id := io.master_bid

	arb.io.axi_out.ar.ready := io.master_arready
	io.master_arvalid := arb.io.axi_out.ar.valid
	io.master_araddr := arb.io.axi_out.ar.bits.addr
	io.master_arid := arb.io.axi_out.ar.bits.id
	io.master_arlen := arb.io.axi_out.ar.bits.len
	io.master_arsize := arb.io.axi_out.ar.bits.size
	io.master_arburst := arb.io.axi_out.ar.bits.burst

	io.master_rready := arb.io.axi_out.r.ready
	arb.io.axi_out.r.valid := io.master_rvalid
	arb.io.axi_out.r.bits.resp := io.master_rresp
	arb.io.axi_out.r.bits.data := io.master_rdata
	arb.io.axi_out.r.bits.last := io.master_rlast
	arb.io.axi_out.r.bits.id := io.master_rid 

	io.inst := datapath.io.inst
	io.commit_inst := datapath.io.commit_inst
	io.pc_debug := datapath.io.pc
	io.start := datapath.io.start
	io.stall := datapath.io.stall

	//slave signals suspension
	io.slave_awready := false.B 
	io.slave_wready  := false.B 
	io.slave_bvalid  := false.B 
	io.slave_bresp   := 0.U 
	io.slave_bid     := 0.U 
	io.slave_arready := false.B
	io.slave_rvalid  := false.B 
	io.slave_rresp   := 0.U 
	io.slave_rdata   := 0.U 
	io.slave_rlast   := false.B 
	io.slave_rid     := 0.U
}

object Driver extends App{
    
	//(new ChiselStage).emitVerilog(new myCPU, args)
	(new chisel3.stage.ChiselStage).execute(args, Seq(
		chisel3.stage.ChiselGeneratorAnnotation(() => new myCPU()),
		firrtl.stage.RunFirrtlTransformAnnotation(new AddModulePrefix()),
		ModulePrefixAnnotation("ysyx_22041812_")
	))
}

package myCPU


import chisel3._
import chisel3.util._
import chisel3.util.BitPat
import Control._ 
import Instructions._ 
import chisel3.stage.ChiselStage
import chisel3.experimental.BundleLiterals._
import cacheArbiter._ 
import cache._
import axi4._ 
import CSR_OP._ 
import CSR._ 

class CacheIO extends Bundle{
	val cpu_request = Output(new CPU_Request)
	val cpu_response = Input(new CPU_Response)
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
		//val valid = Input(Bool())
		//val ready = Output(Bool())
		val wen = Input(Bool())
	})
}

class Memory extends BlackBox{
	val io = IO(new Bundle{
		val clock = Input(Clock())
		val reset = Input(Bool())
		//val pc_addr = Input(UInt(64.W))
		//val pc_data = Output(UInt(64.W))
		val addr = Input(UInt(64.W))
		val wdata = Input(UInt(64.W))
		val mask = Input(UInt(8.W))
		val rdata = Output(UInt(64.W))
		//val enable = Input(Bool())
		val valid = Input(Bool())
		val ready = Output(Bool())
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

class fetch_decode_pipeline_reg extends Bundle{
	val inst = chiselTypeOf(Instructions.NOP)
	val pc = UInt(64.W)
//	val is_illegal = Bool()
	val enable = Bool()
}

class decode_execute_pipeline_reg extends Bundle{
	val alu_op = UInt(4.W)
	val pc = UInt(64.W)
	val inst = chiselTypeOf(Instructions.NOP)
	val imm = UInt(64.W)
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
	val is_kill = Bool()
	val enable = Bool()
}


class  execute_mem_pipeline_reg extends Bundle{
	val alu_out = UInt(64.W)
	val alu_sum = UInt(64.W)
	val csr_read_data = UInt(64.W)
	val csr_write_op = UInt(3.W)
	val csr_write_addr = UInt(12.W)
	val csr_write_data = UInt(64.W)
	val jump_addr = UInt(64.W)
	val jump_taken = Bool()
	val st_data = UInt(64.W)
	val st_type = UInt(3.W)
	val ld_type = UInt(3.W)
	val wb_sel = UInt(2.W)
	val wb_en = Bool()
	val dest = UInt(5.W)
	val pc = UInt(64.W)
	val inst = chiselTypeOf(Instructions.NOP)
	val is_kill = Bool()
	val enable = Bool()
}

class mem_writeback_pipeline_reg extends Bundle{
	val load_data = UInt(64.W)
	val alu_out = UInt(64.W)
	val dest = UInt(5.W)
	val csr_read_data = UInt(64.W)
	val csr_write_op = UInt(3.W)
	val csr_write_addr = UInt(12.W)
	val csr_write_data = UInt(64.W)
	val jump_addr = UInt(64.W)
	val jump_taken = Bool()	
	val st_type = UInt(3.W)
	val ld_type = UInt(3.W)
	val wb_sel = UInt(2.W)
	val wb_en = Bool()
	val pc = UInt(64.W)
	val inst = chiselTypeOf(Instructions.NOP)
	val enable = Bool()
}

class DatapathIO extends Bundle{
	val ctrl = Flipped(new ControlSignals)
	val pc = Output(UInt(64.W))
	val inst = Output(UInt(32.W))
	val start = Output(Bool())
	val icache = new CacheIO
	val dcache = new CacheIO
}


class Datapath extends Module{
	val io = IO(new DatapathIO)
	val fd_pipe_reg = RegInit(
		(new fetch_decode_pipeline_reg).Lit(
			_.inst -> Instructions.NOP,
			_.pc -> "h80000000".U,
			_.enable -> false.B,
//			_.is_illegal -> false.B
		)
	)

	val de_pipe_reg = RegInit(
		(new decode_execute_pipeline_reg).Lit(
			_.inst -> Instructions.NOP,
			_.alu_op -> 0.U,
			_.A_sel -> A_XXX,
			_.B_sel -> B_XXX,
			_.csr_read_data -> 0.U,
			_.csr_write_op -> 0.U,
			_.csr_write_addr -> 0.U,
			_.csr_write_data -> 0.U,
			_.pc -> 0.U,
			_.imm -> 0.U,
			_.rs1 -> 0.U,
			_.src1_addr -> 0.U,
			_.rs2 -> 0.U,
			_.src2_addr -> 0.U,
			_.dest -> 0.U,
			_.pc_sel -> 0.U,
			_.br_type -> 0.U,
			_.st_type -> 0.U,
			_.ld_type -> 0.U,
			_.wd_type -> 0.U,
			_.wb_sel -> 0.U,
			_.wb_en -> false.B,
			_.is_kill -> false.B,
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
			_.csr_write_op -> 0.U,
			_.csr_write_addr -> 0.U,
			_.csr_write_data -> 0.U,
			_.jump_addr -> 0.U,
			_.jump_taken -> false.B,
			_.st_data -> 0.U,
			_.st_type -> 0.U,
			_.ld_type -> 0.U,
			_.wb_sel -> 0.U,
			_.wb_en -> false.B,
			_.pc -> 0.U,
			_.is_kill -> false.B,
			_.enable -> false.B
		)
	)

	val mw_pipe_reg = RegInit(
		(new mem_writeback_pipeline_reg).Lit(
			_.inst -> Instructions.NOP,
			_.load_data -> 0.U,
			_.csr_read_data -> 0.U,
			_.csr_write_op -> 0.U,
			_.csr_write_addr -> 0.U,
			_.csr_write_data -> 0.U,
			_.jump_addr -> 0.U,
			_.jump_taken -> false.B,
			_.st_type -> 0.U,
			_.ld_type -> 0.U,
			_.wb_sel -> 0.U,
			_.wb_en -> false.B,
			_.pc -> 0.U,
			_.enable -> false.B
		)
	)
	
	//必须使得enable信号为false时，对应的流水线寄存器中输出的内容不对CPU状态机的运行产生影响

	val alu = Module(new AluSimple(64))					
	val immGen = Module(new ImmGenWire)
	val brCond = Module(new BrCondSimple(64))			//专门用于跳转判断
	val regFile = Module(new RegisterFile(35))			//有35个读口的寄存器文件
	//val imem = Module(new Memory)							//指令mem
	//val dmem = Module(new Mem)							//数据mem
	//val icache = Module(new Cache)
	//val dcache = Module(new Cache)
	val started = RegNext(reset.asBool)
	val stall = !io.icache.cpu_response.ready || ( (em_pipe_reg.ld_type.orR || em_pipe_reg.st_type.orR) && em_pipe_reg.enable && (!io.dcache.cpu_response.ready))	//stall暂时设置为false
	//val load_stall = em_pipe_reg.enable && em_pipe_reg.ld_type.orR && ((de_pipe_reg.src1_addr === em_pipe_reg.dest) || (de_pipe_reg.src2_addr === em_pipe_reg.dest))

	val csr = Module(new CSR)							//csr寄存器文件，同时可以用于特权判断，中断和异常处理

	val jump_addr = Wire(UInt(64.W))					//要跳转的地址
	val gpr_ptr = Module(new gpr_ptr)					//用于向外输出寄存器信息，用于debug

	//2号多余，寄存器文件依次读出，输出到gpr_ptr，最后在sim的过程输出寄存器信息用于调试
	regFile.io.raddr(2) := 0.U
	for(i <- 3 until 35){
		regFile.io.raddr(i) := (i-3).U
		gpr_ptr.io.regfile(i-3) := regFile.io.rdata(i)
	}

	//gpr_ptr向外同步的时机依靠时钟，所以要向外输出时钟
	gpr_ptr.io.clock := clock
	gpr_ptr.io.reset := reset

	//csr寄存器要处理来自外部的中断，和来自clint的时钟中断和软件中断
	csr.io.extern := false.B
	csr.io.int_timer := false.B
	csr.io.int_soft := false.B

	//mem的始终，mem读取的时机这里也依靠时钟
	//imem.io.clock := clock								//input mem clock
	//imem.io.reset := reset								//input reset
	//dmem.io.clock := clock
	//dmem.io.reset := reset
	 
	//向csr寄存器输入是否阻塞，阻塞的过程中无法处理中断异常，并且无法写入csr寄存器
	csr.io.stall := stall

	//flush信号，由csr得到信息后，进行判断要刷新那些流水寄存器	

	val br_flush = WireInit(false.B)
	val jmp_flush = WireInit(false.B)
	val csr_atomic_flush = WireInit(0.U(4.W))
	csr_atomic_flush := Mux(mw_pipe_reg.enable && mw_pipe_reg.csr_write_op =/= CSR.N, "b1111".U, 
							Mux(em_pipe_reg.enable && em_pipe_reg.csr_write_op =/= CSR.N, "b0111".U,
								Mux(de_pipe_reg.enable && de_pipe_reg.csr_write_op =/= CSR.N, "b0011".U,
									Mux(fd_pipe_reg.enable && io.ctrl.csr_cmd =/= CSR.N, "b0001".U, 0.U)
								)		
							)
						)

	val flush_fd = csr.io.flush_mask(0) || (br_flush || jmp_flush) || csr_atomic_flush(0) 
	val flush_de = csr.io.flush_mask(1)	|| ((br_flush || jmp_flush) && !stall) || csr_atomic_flush(1)
	val flush_em = csr.io.flush_mask(2)	|| csr_atomic_flush(2)
	val flush_mw = csr.io.flush_mask(3) || csr_atomic_flush(3)

	/***** Fetch ******/
	//第一个周期插入一个NOP，因为读内存要一个周期，为了之后流水线的每一个阶段只占用一个周期，采用第一个周期插入NOP的方法
	val brCond_taken = WireInit(false.B)
	val is_kill_inst = WireInit(false.B)
	val jmp_occur = WireInit(false.B)
	val csr_atomic = WireInit(false.B)

	io.start := started
	csr_atomic := csr_atomic_flush.orR

	//下面next_pc默认是pc+4
	//printf(p"${flush_fd}; ${flush_de}; ${flush_em}; ${flush_mw}\n")
	//printf(p"csr.io.trap:${csr.io.trap};  csr_atomic:${csr_atomic};  io.ctrl.pc_sel:${io.ctrl.pc_sel};  brCond_taken:${brCond_taken}")
	val pc = RegInit("h80000000".U(64.W) - 4.U)
	//val next_pc = RegInit("h80000000".U)
	val next_pc = MuxCase(
		pc + 4.U,
		IndexedSeq(
		csr.io.trap -> csr.io.trapVec,
		csr_atomic -> (de_pipe_reg.pc + 4.U),																								//csr需要实现原子性
		(((de_pipe_reg.pc_sel === PC_ALU) && de_pipe_reg.enable)|| brCond_taken) ->(jump_addr >> 1.U << 1.U),							//是否jmp和jmp的结果应该和branch一样放在执行阶段
		(!started && (stall)) -> pc) // || load_stall
//		(io.ctrl.pc_sel === PC_EPC) -> csr.io.trapVec,
	)
//		(io.ctrl.pc_sel === PC_0) -> pc)
	//printf(p"trap:${csr.io.trap}; next_pc:${Hexadecimal(next_pc)}; pc:${Hexadecimal(pc)}; imem.io.rdata:${Hexadecimal(imem.io.rdata)}\n")

	//如果是跳转，异常和还未开始等情况，那么获取的是一条NOP指令，否则是从指令存储器中读取一条指令
	//printf(p"pc(2):${pc(2)} ;rdata: ${Hexadecimal(imem.io.rdata)}\n")
	//val inst = Mux(started || is_kill_inst || brCond_taken || csr.io.trap, Instructions.NOP, Mux(pc(2).asBool, imem.io.rdata(63, 32) ,imem.io.rdata(31, 0)))//这里的br_taken要考虑信号是否有效, 同时kill信号也要判断是否有效
	val	inst = Mux(started || is_kill_inst || brCond_taken || csr.io.trap, Instructions.NOP, Mux(pc(2).asBool, io.icache.cpu_response.data(63, 32), io.icache.cpu_response.data(31, 0))) 

	//pc设置为next_pc, 存储的读取地址也设为next_pc
	pc := next_pc 
	//printf(p"next_pc:${Hexadecimal(next_pc)};  is_trap:${csr.io.trap};  pc_sel:${io.ctrl.pc_sel}\n")

	/*
	imem.io.addr := next_pc
	imem.io.enable := !stall
	imem.io.wen := false.B
	*/

	io.icache.cpu_request.addr := next_pc
	io.icache.cpu_request.valid := true.B
	io.icache.cpu_request.data := 0.U
	io.icache.cpu_request.rw := false.B
	io.icache.cpu_request.mask := 0.U

	//imem.io.addr := icache.io.mem_request.addr
	//imem.io.data := icache.io.mem_request.wdata
	//imem.io.wen  := icache.io.mem_request.rw
	//imem.io.valid := icache.io.mem_request.valid

	//icache.io.mem_response.data := imem.io.rdata
	//icache.io.mem_response.ready := imem.io.ready

	//如何解释enable为false
	when(flush_fd && (!stall)){
		fd_pipe_reg.pc := "h80000000".U
		fd_pipe_reg.inst := Instructions.NOP
		fd_pipe_reg.enable := false.B
	}.elsewhen(!stall){				// && !load_stall
		fd_pipe_reg.pc := pc
		fd_pipe_reg.inst := inst
		fd_pipe_reg.enable := true.B
	}

	/*
	printf(p"ready: ${Hexadecimal(io.dcache.cpu_response.ready)}\n")
	printf(p"pc: ${Hexadecimal(pc)}\n")
	printf(p"next_pc: ${Hexadecimal(next_pc)}\n")
	printf(p"inst: ${Hexadecimal(inst)}\n")
	*/

	//printf(p"pc:${Hexadecimal(fd_pipe_reg.pc)}; inst:${Hexadecimal(fd_pipe_reg.inst)}\n\n")

	printf(p"fetch-decode:\n pc: ${Hexadecimal(fd_pipe_reg.pc)}; fd_pipe_reg.inst: ${Hexadecimal(fd_pipe_reg.inst)}; fd_pipe_reg.enable: ${Hexadecimal(fd_pipe_reg.enable)}\n\n")
	/***** Decode ******/
	//control模块输入指令
	io.ctrl.inst := fd_pipe_reg.inst
	csr.io.fd_enable := fd_pipe_reg.enable

	is_kill_inst := io.ctrl.is_kill && fd_pipe_reg.enable

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

	/*
	brCond也要进行冲突检测，将其移回到执行阶段
	//跳转模块，在译码阶段进行跳转判断，可以解决分支的成本问题
	brCond.io.br_type := io.ctrl.br_type		//思考跳转发生时会发生什么？当跳转发生时，前一个周期的指令直接被刷新为nop
	brCond.io.rs1 := regFile.io.rdata(0)
	brCond.io.rs2 := regFile.io.rdata(1)
	jump_addr := fd_pipe_reg.pc + Mux(io.ctrl.B_sel === B_RS2, regFile.io.rdata(1), 
										Mux(io.ctrl.B_sel === B_IMM, immGen.io.out, 0.U))
	*/

	//csr read
	val csr_op = Mux(
					(io.ctrl.csr_cmd === CSR_RW) && (dest_addr === 0.U), CSR.W, 
					Mux(io.ctrl.csr_cmd === CSR_RW, CSR.RW, 
						Mux((io.ctrl.csr_cmd === CSR_RC) && (dest_addr === 0.U), CSR.R,
							Mux(io.ctrl.csr_cmd === CSR_RC, CSR.RC,
								Mux((io.ctrl.csr_cmd === CSR_RS) && (dest_addr === 0.U), CSR.R,
									Mux(io.ctrl.csr_cmd === CSR_RS, CSR.RS, CSR.N)
								)
							)
						)
					)
				)

	//printf(p"csr_op:${csr_op}\n")
	//printf(p"io.ctrl.is_illegal:${io.ctrl.is_illegal} fd_pipe_pc: ${Hexadecimal(fd_pipe_reg.pc)}; fd_pipe_inst: ${Hexadecimal(fd_pipe_reg.inst)}\n")

	csr.io.r_op := csr_op
	csr.io.r_addr := de_pipe_reg.inst(31, 20)
	csr.io.inst_mode := io.ctrl.prv
	csr.io.illegal_inst := Mux(io.ctrl.is_illegal, fd_pipe_reg.inst, 0.U)

	csr.io.fetch_misalign := (de_pipe_reg.pc & 3.U) =/= 0.U
	csr.io.pc_fetch_misalign := de_pipe_reg.pc

	val csr_data = csr.io.r_data

	val csr_write_data = regFile.io.rdata(1)
	val csr_write_addr = inst(11, 7)


	//printf(p"is_kill:${is_kill_inst}; illegal_inst:${csr.io.illegal_inst} fetch_misalign:${csr.io.fetch_misalign}\n")
	when(flush_de && (!stall)){
		de_pipe_reg.inst := Instructions.NOP
		de_pipe_reg.alu_op := 0.U
		de_pipe_reg.A_sel := A_XXX
		de_pipe_reg.B_sel := B_XXX
		de_pipe_reg.csr_read_data := 0.U
		de_pipe_reg.csr_write_op := 0.U
		de_pipe_reg.csr_write_data := 0.U
		de_pipe_reg.csr_write_addr := 0.U
		de_pipe_reg.pc := 0.U
		de_pipe_reg.imm := 0.U
		de_pipe_reg.rs1 := 0.U
		de_pipe_reg.src1_addr := 0.U
		de_pipe_reg.rs2 := 0.U
		de_pipe_reg.src2_addr := 0.U
		de_pipe_reg.dest := 0.U
		de_pipe_reg.pc_sel := 0.U
		de_pipe_reg.br_type := 0.U
		de_pipe_reg.st_type := ST_XXX
		de_pipe_reg.ld_type := LD_XXX
		de_pipe_reg.wd_type := W_D
		de_pipe_reg.wb_sel := WB_ALU
		de_pipe_reg.wb_en := false.B
		de_pipe_reg.is_kill	:= false.B
		de_pipe_reg.enable := false.B
	}.elsewhen(!stall ){			//&& !load_stall
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
		de_pipe_reg.is_kill	:= io.ctrl.is_kill
		de_pipe_reg.enable := fd_pipe_reg.enable
	}

	
	printf(p"decode-execute: \ninst:${Hexadecimal(de_pipe_reg.inst)}; alu_op:${de_pipe_reg.alu_op}; A_sel:${de_pipe_reg.A_sel}; B_sel:${de_pipe_reg.B_sel}; csr_read_data: ${de_pipe_reg.csr_read_data}\n" +
  			p"write_op:${de_pipe_reg.csr_write_op}; write_data: ${Hexadecimal(de_pipe_reg.csr_write_data)} write_addr: ${Hexadecimal(de_pipe_reg.csr_write_addr)}; pc:${Hexadecimal(de_pipe_reg.pc)}\n" +
			p"imm: ${Hexadecimal(de_pipe_reg.imm)}; rs1: ${Hexadecimal(de_pipe_reg.rs1)}; rs2:${Hexadecimal(de_pipe_reg.rs2)}; src1_addr:${Hexadecimal(de_pipe_reg.src1_addr)}; src2_addr:${Hexadecimal(de_pipe_reg.src2_addr)};" + 
			p"dest: ${Hexadecimal(de_pipe_reg.dest)}; pc_sel: ${de_pipe_reg.pc_sel};  br_type:${de_pipe_reg.br_type}; st_type:${de_pipe_reg.st_type}; ld_type:${de_pipe_reg.ld_type}\n" + 
			p"wd_type: ${de_pipe_reg.wd_type}; wb_sel: ${de_pipe_reg.wb_sel}; wb_en:${de_pipe_reg.wb_en}; is_kill:${de_pipe_reg.is_kill}; enable:${de_pipe_reg.enable}\n\n")
	
	/****** Execute *****/
	csr.io.de_enable := de_pipe_reg.enable
	val src1_data = WireInit(0.U(64.W))
	val src2_data = WireInit(0.U(64.W))
	//val load_data_hazard = dmem.io.rdata >> ((em_pipe_reg.alu_out& "h07".U) << 3.U)
	/*
	val load_data_hazard = io.dcache.cpu_response.data >> ((em_pipe_reg.alu_out & "h07".U) << 3.U)
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
	*/


	when(em_pipe_reg.enable && em_pipe_reg.wb_en && (de_pipe_reg.src1_addr === em_pipe_reg.dest) && (de_pipe_reg.src1_addr =/= 0.U) && (em_pipe_reg.ld_type === 0.U)){
		//printf("\n\n Hazard detect1\n\n")
		when(de_pipe_reg.src1_addr === em_pipe_reg.dest){
			src1_data := Mux(em_pipe_reg.wb_sel === WB_ALU, em_pipe_reg.alu_out,
						Mux(em_pipe_reg.wb_sel === WB_PC4, em_pipe_reg.pc + 4.U, em_pipe_reg.csr_read_data))
							//Mux(em_pipe_reg.wb_sel === WB_CSR, , load_data_ext_hazard)))
		}
	}.elsewhen(mw_pipe_reg.enable && mw_pipe_reg.wb_en &&(de_pipe_reg.src1_addr === mw_pipe_reg.dest) && (de_pipe_reg.src1_addr =/= 0.U)){
		//printf("\n\n Hazard detect2\n\n")
		when(de_pipe_reg.src1_addr === mw_pipe_reg.dest){
			src1_data := Mux(mw_pipe_reg.wb_sel === WB_ALU, mw_pipe_reg.alu_out,
						Mux(mw_pipe_reg.wb_sel === WB_PC4, mw_pipe_reg.pc + 4.U, 
							Mux(mw_pipe_reg.wb_sel === WB_CSR, mw_pipe_reg.csr_read_data, mw_pipe_reg.load_data)))
		}
	}.otherwise{
		src1_data := de_pipe_reg.rs1
	}

	when(em_pipe_reg.enable && em_pipe_reg.wb_en && (de_pipe_reg.src2_addr === em_pipe_reg.dest) && (de_pipe_reg.src2_addr =/= 0.U) && (em_pipe_reg.ld_type === 0.U)){
		//printf("\n\n Hazard detect1\n\n")
		when(de_pipe_reg.src2_addr === em_pipe_reg.dest){
			src2_data := Mux(em_pipe_reg.wb_sel === WB_ALU, em_pipe_reg.alu_out,
						Mux(em_pipe_reg.wb_sel === WB_PC4, em_pipe_reg.pc + 4.U, em_pipe_reg.csr_read_data))
							//Mux(em_pipe_reg.wb_sel === WB_CSR, em_pipe_reg.csr_read_data, load_data_ext_hazard)))
		}
	}.elsewhen(mw_pipe_reg.enable && mw_pipe_reg.wb_en &&(de_pipe_reg.src2_addr === mw_pipe_reg.dest) && (de_pipe_reg.src2_addr =/= 0.U)){
		//printf("\n\n Hazard detect2\n\n")
		when(de_pipe_reg.src2_addr === mw_pipe_reg.dest){
			src2_data := Mux(mw_pipe_reg.wb_sel === WB_ALU, mw_pipe_reg.alu_out,
						Mux(mw_pipe_reg.wb_sel === WB_PC4, mw_pipe_reg.pc + 4.U, 
							Mux(mw_pipe_reg.wb_sel === WB_CSR, mw_pipe_reg.csr_read_data, mw_pipe_reg.load_data)))
		}
	}.otherwise{
		src2_data := de_pipe_reg.rs2
	}




	//printf(p"\n\n src1_data:${Hexadecimal(src1_data)}\n\n")
	//printf(p"src1_data: ${Hexadecimal(src1_data)}; src2_data: ${Hexadecimal(src2_data)}; br_taken:${brCond_taken}; br_type:${de_pipe_reg.br_type}\n")

	alu.io.alu_op := de_pipe_reg.alu_op
	alu.io.width_type := de_pipe_reg.wd_type
	val A_data = Mux(de_pipe_reg.A_sel.asBool, src1_data, de_pipe_reg.pc)
	val B_data = Mux(de_pipe_reg.B_sel.asBool, src2_data, de_pipe_reg.imm)
	alu.io.A := Mux(de_pipe_reg.wd_type === W_W, A_data(31, 0), A_data)
	alu.io.B := Mux(de_pipe_reg.wd_type === W_W, B_data(31, 0), B_data)

	//printf(p"alu.io.A: ${Hexadecimal(alu.io.A)}, alu.io.B: ${Hexadecimal(alu.io.B)}\n")

	val alu_out = alu.io.out
	val alu_sum = alu.io.sum
	
	jmp_occur := de_pipe_reg.enable && (de_pipe_reg.pc_sel === PC_ALU)
	jmp_flush := jmp_occur
	brCond.io.br_type := de_pipe_reg.br_type 		//思考跳转发生时会发生什么？当跳转发生时，前一个周期的指令直接被刷新为nop
	brCond.io.rs1 := src1_data//A_data
	brCond.io.rs2 := src2_data//B_data
	jump_addr := alu_out
	//printf(p"br_type: ${de_pipe_reg.br_type} src1_data:${Hexadecimal(src1_data)} src2_data:${Hexadecimal(src2_data)} alu_out:${Hexadecimal(alu_out)}\n")
	//printf(p"rs1_reg: ${Hexadecimal(de_pipe_reg.rs1)}; rs2_reg: ${Hexadecimal(de_pipe_reg.rs2)}\n\n\n\n")

	/*
	jump_addr := Mux(de_pipe_reg.A_sel, ) 
				+ Mux(de_pipe_reg.B_sel === B_RS2, src2_data, 
				Mux(de_pipe_reg.B_sel === B_IMM, de_pipe_reg.imm, 0.U))
	*/

	brCond_taken := brCond.io.taken && de_pipe_reg.enable	//taken需要信号有效时才产生作用
	br_flush := brCond_taken


	csr.io.store_misalign := (de_pipe_reg.st_type =/= ST_XXX) && 
										MuxCase(false.B,
											IndexedSeq(
											(de_pipe_reg.st_type === ST_SB) -> false.B,
											(de_pipe_reg.st_type === ST_SH) -> (alu_out(0) =/= 0.U),
											(de_pipe_reg.st_type === ST_SW) -> (alu_out(1, 0) =/= 0.U),
											(de_pipe_reg.st_type === ST_SD) -> (alu_out(2, 0) =/= 0.U))
										)

	csr.io.load_misalign := (de_pipe_reg.ld_type =/= LD_XXX) && 
										MuxCase(false.B,
											IndexedSeq(
											(de_pipe_reg.ld_type === LD_LB || de_pipe_reg.ld_type === LD_LBU) -> false.B,
											(de_pipe_reg.ld_type === LD_LH || de_pipe_reg.ld_type === LD_LHU) -> (alu_out(0) =/= 0.U),
											(de_pipe_reg.ld_type === LD_LW || de_pipe_reg.ld_type === LWU)	-> (alu_out(1, 0) =/= 0.U),
											(de_pipe_reg.ld_type === LD_LD) -> (alu_out(2,0) =/= 0.U))
										)
	csr.io.load_misalign_addr := alu_sum
	csr.io.store_misalign_addr := alu_sum

	when((flush_em ) && !stall){			//|| load_stall
		em_pipe_reg.inst := Instructions.NOP
		em_pipe_reg.dest := 0.U
		em_pipe_reg.alu_out := 0.U
		em_pipe_reg.alu_sum := 0.U
		em_pipe_reg.csr_read_data := 0.U
		em_pipe_reg.csr_write_op := 0.U
		em_pipe_reg.csr_write_addr := 0.U
		em_pipe_reg.csr_write_data := 0.U
		em_pipe_reg.jump_addr := 0.U
		em_pipe_reg.jump_taken := false.B
		em_pipe_reg.st_data := 0.U
		em_pipe_reg.st_type := ST_XXX
		em_pipe_reg.ld_type := LD_XXX
		em_pipe_reg.wb_sel := WB_ALU
		em_pipe_reg.wb_en := false.B
		em_pipe_reg.pc := 0.U
		em_pipe_reg.is_kill := false.B
		em_pipe_reg.enable := false.B
	}.elsewhen(!stall){
		em_pipe_reg.inst := de_pipe_reg.inst
		em_pipe_reg.dest := de_pipe_reg.dest
		em_pipe_reg.alu_out := alu_out
		em_pipe_reg.alu_sum := alu_sum
		em_pipe_reg.csr_read_data := de_pipe_reg.csr_read_data
		em_pipe_reg.csr_write_op := de_pipe_reg.csr_write_op
		em_pipe_reg.csr_write_addr := de_pipe_reg.csr_write_addr
		em_pipe_reg.csr_write_data := de_pipe_reg.csr_write_data
		em_pipe_reg.jump_addr := alu_out
		em_pipe_reg.jump_taken := brCond_taken || (de_pipe_reg.pc_sel === PC_ALU && de_pipe_reg.enable)
		em_pipe_reg.st_data := src2_data
		em_pipe_reg.st_type := de_pipe_reg.st_type
		em_pipe_reg.ld_type := de_pipe_reg.ld_type
		em_pipe_reg.wb_sel := de_pipe_reg.wb_sel
		em_pipe_reg.wb_en := de_pipe_reg.wb_en
		em_pipe_reg.pc := de_pipe_reg.pc
		em_pipe_reg.is_kill := de_pipe_reg.is_kill
		em_pipe_reg.enable := de_pipe_reg.enable
	}

	
	printf(p"execute_memory:\ninst: ${Hexadecimal(em_pipe_reg.inst)}; dest:${em_pipe_reg.dest}; alu_out:${Hexadecimal(em_pipe_reg.alu_out)} alu_sum:${Hexadecimal(em_pipe_reg.alu_sum)}\n" +
  			p"csr_read_data: ${Hexadecimal(em_pipe_reg.csr_read_data)}; csr_write_op: ${Hexadecimal(em_pipe_reg.csr_write_op)}; csr_write_addr: ${Hexadecimal(em_pipe_reg.csr_write_addr)}; csr_write_data: ${Hexadecimal(em_pipe_reg.csr_write_data)};\n " +
  			p"st_data: ${Hexadecimal(em_pipe_reg.st_data)}; st_type: ${em_pipe_reg.st_type}; ld_type: ${em_pipe_reg.ld_type}\n " +
  			p"wb_sel: ${em_pipe_reg.wb_sel}; wb_en:${em_pipe_reg.wb_en}; pc:${Hexadecimal(em_pipe_reg.pc)}; is_kill: ${em_pipe_reg.is_kill}; enable:${em_pipe_reg.enable}\n\n")
		

	//printf(p"execute-mem:\n ")
	/****** Mem *********/
	csr.io.em_enable := em_pipe_reg.enable
	//io.dcache.cpu_request.valid := Mux(stall, (em_pipe_reg.ld_type.orR || em_pipe_reg.st_type.orR) && em_pipe_reg.enable, (de_pipe_reg.ld_type.orR || de_pipe_reg.st_type.orR) && de_pipe_reg.enable)
	io.dcache.cpu_request.valid := (de_pipe_reg.ld_type.orR || de_pipe_reg.st_type.orR) && de_pipe_reg.enable
	//dmem.io.enable := Mux(stall, ((de_pipe_reg.st_type.orR) || (de_pipe_reg.ld_type.orR)) && de_pipe_reg.enable, ((em_pipe_reg.st_type.orR) || (em_pipe_reg.st_type.orR)) )
	//dmem.io.enable := Mux(stall, (em_pipe_reg.ld_type.orR || em_pipe_reg.st_type.orR) && em_pipe_reg.enable, (de_pipe_reg.ld_type.orR || de_pipe_reg.st_type.orR) && de_pipe_reg.enable)
	io.dcache.cpu_request.rw := em_pipe_reg.st_type.orR && de_pipe_reg.enable
	//io.dcache.cpu_request.rw := Mux(stall, em_pipe_reg.st_type.orR && em_pipe_reg.enable, de_pipe_reg.st_type.orR && de_pipe_reg.enable)
	//dmem.io.wen := Mux(stall, em_pipe_reg.st_type.orR && em_pipe_reg.enable, de_pipe_reg.st_type.orR && de_pipe_reg.enable)
	io.dcache.cpu_request.addr := alu_out
	//printf(p"io.dcache.cpu_request: ${alu_out}")
	//io.dcache.cpu_request.addr := Mux(stall, em_pipe_reg.alu_out, alu_out)
	//dmem.io.addr := Mux(stall, em_pipe_reg.alu_out, alu_out)					//这里是地址提前一个周期输入，因为访存必定要延后一个周期，提前一个周期输入地址保证每个周期都可以
	//printf(p"\ndmem_addr: ${Hexadecimal(dmem.io.addr)} alu_out:${alu_out}\n\n")
	//dmem.io.wdata := (de_pipe_reg.rs2 << (alu_out(2, 0) << 3.U))(63, 0)
	io.dcache.cpu_request.data := (src2_data << (alu_out(2, 0) << 3.U))(63, 0)
	//io.dcache.cpu_request.data := Mux(stall, em_pipe_reg.st_data << (em_pipe_reg.alu_out(2, 0) << 3.U), src2_data << (alu_out(2, 0) << 3.U))(63, 0)
	//dmem.io.wdata := Mux(stall, em_pipe_reg.st_data << (em_pipe_reg.alu_out(2, 0) << 3.U), src2_data << (alu_out(2, 0) << 3.U))(63, 0)
	/*val st_mask = Mux(stall, Mux(em_pipe_reg.st_type === ST_SW, "b00001111".U, 
								Mux(em_pipe_reg.st_type === ST_SH, "b00000011".U,
									Mux(em_pipe_reg.st_type === ST_SB, "b00000001".U, "b11111111".U)
								)
							),Mux(de_pipe_reg.st_type === ST_SW, "b00001111".U, 
							Mux(de_pipe_reg.st_type === ST_SH, "b00000011".U,
								Mux(de_pipe_reg.st_type === ST_SB, "b00000001".U, "b11111111".U)
							)
						)
					) 
	*/
	
	val st_mask = Mux(de_pipe_reg.st_type === ST_SW, "b00001111".U, 
							Mux(de_pipe_reg.st_type === ST_SH, "b00000011".U,
								Mux(de_pipe_reg.st_type === ST_SB, "b00000001".U, "b11111111".U)
							)
					)
		
		
		
	io.dcache.cpu_request.mask := Mux(st_mask === "b11111111".U, st_mask(7, 0), Mux(stall, (st_mask << em_pipe_reg.alu_out(2,0))(7, 0), (st_mask << alu_out(2,0))(7, 0)))
	//dmem.io.mask := Mux(st_mask === "b11111111".U, st_mask(7, 0), Mux(stall, (st_mask << em_pipe_reg.alu_out(2,0))(7, 0), (st_mask << alu_out(2,0))(7, 0)))
	val load_data = io.dcache.cpu_response.data >> ((em_pipe_reg.alu_out & "h07".U) << 3.U)
	//val load_data = dmem.io.rdata >> ((em_pipe_reg.alu_out & "h07".U) << 3.U)
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

	when(flush_mw && !stall){
		mw_pipe_reg.load_data := 0.U
		mw_pipe_reg.alu_out := 0.U
		mw_pipe_reg.dest := 0.U
		mw_pipe_reg.wb_sel := WB_ALU
		mw_pipe_reg.wb_en := false.B
		mw_pipe_reg.pc := 0.U
		mw_pipe_reg.inst := Instructions.NOP
		mw_pipe_reg.csr_read_data := 0.U
		mw_pipe_reg.csr_write_op := 0.U
		mw_pipe_reg.csr_write_data := 0.U
		mw_pipe_reg.csr_write_addr := 0.U
		mw_pipe_reg.enable := false.B
	}.elsewhen(!stall){
		mw_pipe_reg.load_data := load_data_ext
		mw_pipe_reg.alu_out := em_pipe_reg.alu_out
		mw_pipe_reg.dest := em_pipe_reg.dest
		mw_pipe_reg.wb_sel := em_pipe_reg.wb_sel
		mw_pipe_reg.wb_en := em_pipe_reg.wb_en
		mw_pipe_reg.pc := em_pipe_reg.pc
		mw_pipe_reg.inst := em_pipe_reg.inst
		mw_pipe_reg.jump_addr := em_pipe_reg.jump_addr
		mw_pipe_reg.jump_taken := em_pipe_reg.jump_taken
		mw_pipe_reg.csr_read_data := em_pipe_reg.csr_read_data
		mw_pipe_reg.csr_write_op := em_pipe_reg.csr_write_op
		mw_pipe_reg.csr_write_data := em_pipe_reg.csr_write_data
		mw_pipe_reg.csr_write_addr := em_pipe_reg.csr_write_addr
		mw_pipe_reg.enable := em_pipe_reg.enable
	}

	
	printf(p"memory_writeback:\nload_data: ${Hexadecimal(mw_pipe_reg.load_data)}; alu_out: ${Hexadecimal(mw_pipe_reg.alu_out)}; dest: ${mw_pipe_reg.dest}; wb_sel: ${mw_pipe_reg.wb_sel}; wb_en:${mw_pipe_reg.wb_en}\n " +
  			p"pc:${Hexadecimal(mw_pipe_reg.pc)}; inst:${Hexadecimal(mw_pipe_reg.inst)}; \ncsr_read_data: ${Hexadecimal(mw_pipe_reg.csr_read_data)}; csr_write_op:${mw_pipe_reg.csr_write_op};" +
			p" csr_write_data: ${Hexadecimal(mw_pipe_reg.csr_write_data)}; csr_write_addr:${Hexadecimal(mw_pipe_reg.csr_write_addr)}\n " +
  			p"enable: ${mw_pipe_reg.enable}\n\n\n\n")
	

	/****** Writeback ***/
	csr.io.mw_enable := mw_pipe_reg.enable
	csr.io.w_op := mw_pipe_reg.csr_write_op
	csr.io.w_addr := mw_pipe_reg.csr_write_addr
	csr.io.w_data := mw_pipe_reg.csr_write_data
	csr.io.inst := mw_pipe_reg.inst
	csr.io.ebreak_addr := mw_pipe_reg.pc
	csr.io.retired := mw_pipe_reg.inst =/= Instructions.NOP
	csr.io.isSret := mw_pipe_reg.inst === Instructions.SRET
	csr.io.isMret := mw_pipe_reg.inst === Instructions.MRET
	csr.io.excPC := mw_pipe_reg.pc
	csr.io.jump_taken := mw_pipe_reg.jump_taken
	csr.io.jump_addr := mw_pipe_reg.jump_taken
	//csr.io.stall := stall

	io.pc := mw_pipe_reg.pc
	io.inst := mw_pipe_reg.inst

	regFile.io.wen := ((mw_pipe_reg.wb_sel === WB_ALU ||
						mw_pipe_reg.wb_sel === WB_PC4 ||
						mw_pipe_reg.wb_sel === WB_MEM || mw_pipe_reg.wb_sel === WB_CSR) && (mw_pipe_reg.wb_en)) && mw_pipe_reg.enable
	regFile.io.waddr := mw_pipe_reg.dest
	regFile.io.wdata := Mux(mw_pipe_reg.wb_sel === WB_ALU, mw_pipe_reg.alu_out,
						Mux(mw_pipe_reg.wb_sel === WB_PC4, mw_pipe_reg.pc + 4.U, 
							Mux(mw_pipe_reg.wb_sel === WB_CSR, mw_pipe_reg.csr_read_data, mw_pipe_reg.load_data)))
}

class myCPU extends Module{
	val io = IO(new Bundle{
		val pc_debug = Output(UInt(64.W))
		val inst = Output(UInt(32.W))
		val start = Output(Bool())
		
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
	})

	val datapath = Module(new Datapath) 
	val control = Module(new Control)
	val icache = Module(new Cache)
	val dcache = Module(new Cache)
	val arb = Module(new CacheArbiter) 
	datapath.io.ctrl <> control.io
	datapath.io.icache.cpu_request <> icache.io.cpu_request
	datapath.io.dcache.cpu_request <> dcache.io.cpu_request
	datapath.io.icache.cpu_response <> icache.io.cpu_response
	datapath.io.dcache.cpu_response <> dcache.io.cpu_response
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
	io.pc_debug := datapath.io.pc
	io.start := datapath.io.start
}

object Driver extends App{
    (new ChiselStage).emitVerilog(new myCPU, args)
}

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

class writeback_stage extends Module{
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
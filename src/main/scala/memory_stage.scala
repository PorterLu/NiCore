package  myCPU
class memory_stage extends Module{
	val io = IO(new Bundle{
		val data_cache_tag = Output(Bool())
		val dcache = Flip(new CacheIO)
		val em_pipe_reg = Input(new execute_mem_pipeline_reg)
		val mw_pipe_reg = Output(new mem_writeback_pipeline_reg)
	})
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
}
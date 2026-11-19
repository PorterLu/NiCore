package  myCPU

import chisel3._ 
import chisel3.util._ 
import cache_single_port._
import chisel3.experimental.BundleLiterals._
import Control._
import Alu._

import AccessType._ 
class MemoryStage extends Module{
	val io = IO(new Bundle{
		val stall = Input(Bool())
		val pipeline_stall = Input(Bool())

		val flush_mw = Input(Bool())
		val flush_em = Input(Bool())
		val data_cache_tag = Output(Bool())
		val data_cache_response_data = Output(UInt(64.W))
		val dcache = new CacheIO
		val em_pipe_reg = Input(new execute_mem_pipeline_reg)
		val mw_pipe_reg = Output(new mem_writeback_pipeline_reg)
		val de_pipe_reg_ld_type = Input(UInt(3.W))
		val de_pipe_reg_st_type = Input(UInt(3.W))
		val de_pipe_reg_enable = Input(Bool())
		val dcache_flush_tag = Input(Bool())
		val alu_out = Input(UInt(64.W))
		val src2_data = Input(UInt(64.W))
		val is_clint = Input(Bool())
		val clint_r_data = Output(UInt(64.W))
		val amo_forward_data = Output(UInt(64.W))
		val em_enable = Output(Bool())
		val csr_inst = Output(UInt(32.W))
		val csr_alu_out = Output(UInt(64.W))
		val csr_isSret = Output(Bool())
		val csr_isMret = Output(Bool())
		val csr_excPC = Output(UInt(64.W)) 
		val csr_jump_taken = Output(Bool()) 
		val csr_is_illegal = Output(Bool()) 
		val csr_inst_misalign = Output(Bool())
		val csr_store_misalign = Output(Bool())
		val csr_load_misalign = Output(Bool())
		val clint_timer_clear = Output(Bool())
		val clint_soft_clear = Output(Bool())
		val clint_timer_valid = Output(Bool())
		val clint_soft_valid = Output(Bool())

		val tlb_valid = Input(Bool())
		val tlb_ready = Output(Bool())
		val tlb_flush = Input(Bool())
		val tlb_flush_all = Input(Bool())
		val amo_busy = Output(Bool())
		//val tlb_data = Output(UInt(64.W))
		val sum 	 = Input(Bool())
		val mxr 	 = Input(Bool())
		val mode 	 = Input(UInt(2.W))
		val mprv 	 = Input(Bool())
		val mpp 	 = Input(UInt(2.W))
		val satp 	 = Input(UInt(64.W))
		val iTLB_fault = Output(UInt(2.W))
		val dTLB_fault = Output(UInt(2.W))
		// the instruction in EM raises a data page fault or is misaligned:
		// it gets no data and must not hold the pipeline
		val em_fault = Output(Bool())
		// a store reached the data cache: physical address, the 8-byte
		// lane of data and its byte mask
		val store_valid = Output(Bool())
		val store_addr = Output(UInt(64.W))
		val store_data = Output(UInt(64.W))
		val store_mask = Output(UInt(8.W))
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

	// ---------------- AMO / LR-SC ----------------
	// single core, in-order: an AMO is a load followed by a store while the
	// pipeline stays stalled (dcache_stall held via amo_busy), which also makes
	// it atomic w.r.t. interrupts. SC succeeds only with a valid reservation.
	val is_amo = io.em_pipe_reg.amo_op =/= AMO_NONE && io.em_pipe_reg.enable
	val is_lr  = io.em_pipe_reg.amo_op === AMO_LR
	val is_sc  = io.em_pipe_reg.amo_op === AMO_SC

	val resv_valid = RegInit(false.B)   // reservation set by LR, cleared by any store / SC
	val amo_second = RegInit(false.B)   // true during the store phase of a true AMO
	val amo_old    = RegInit(0.U(64.W)) // old value read by the AMO load phase

	val sc_fire = is_sc && resv_valid
	// latched SC outcome: resv_valid is cleared by the time rd is sampled
	val sc_success = RegInit(false.B)

	// effective write-enable of the current memory transaction:
	//   LR: never writes; SC: writes only with a valid reservation;
	//   AMO: load phase writes nothing, store phase writes the result
	val mem_wen = Mux(io.stall, io.em_pipe_reg.st_type.orR && io.em_pipe_reg.enable,
								 io.de_pipe_reg_st_type.orR && io.de_pipe_reg_enable)
	val wen_final = Mux(is_amo, Mux(is_sc, sc_fire, amo_second), mem_wen)

	// AMO read-modify-write
	val amo_is_word = io.em_pipe_reg.ld_type === LD_LW
	val a1 = Mux(amo_is_word, amo_old(31, 0), amo_old)
	val a2 = Mux(amo_is_word, io.em_pipe_reg.st_data(31, 0), io.em_pipe_reg.st_data)
	val lt_s  = Mux(amo_is_word, a1(31, 0).asSInt < a2(31, 0).asSInt, a1.asSInt < a2.asSInt)
	val gt_s  = Mux(amo_is_word, a1(31, 0).asSInt > a2(31, 0).asSInt, a1.asSInt > a2.asSInt)
	val amo_result = MuxLookup(io.em_pipe_reg.amo_op, 0.U, Seq(
		AMO_SWAP -> io.em_pipe_reg.st_data,
		AMO_ADD  -> (a1 + a2),
		AMO_XOR  -> (a1 ^ a2),
		AMO_AND  -> (a1 & a2),
		AMO_OR   -> (a1 | a2),
		AMO_MIN  -> Mux(lt_s, a1, a2),
		AMO_MAX  -> Mux(gt_s, a1, a2),
		AMO_MINU -> Mux(a1 < a2, a1, a2),
		AMO_MAXU -> Mux(a1 > a2, a1, a2)
	))
	val amo_store_data = (Mux(amo_is_word, amo_result(31, 0), amo_result) << (io.em_pipe_reg.alu_out(2, 0) << 3.U))(63, 0)
	io.amo_busy := amo_second

	val dTLB = Module(new TLB("dTLB"))
	val tlb_store_mask = WireInit(0.U(8.W))
	val de_is_amo = io.de_pipe_reg_ld_type.orR && io.de_pipe_reg_st_type.orR &&
					(io.de_pipe_reg_ld_type =/= LD_XXX) && (io.de_pipe_reg_st_type =/= ST_XXX)
	val em_misalign = io.em_pipe_reg.csr_load_misalign || io.em_pipe_reg.csr_store_misalign
	val de_size = Mux((io.de_pipe_reg_ld_type === 7.U) || (io.de_pipe_reg_st_type === 4.U), 7.U(3.W),
					Mux((io.de_pipe_reg_ld_type === 1.U) || (io.de_pipe_reg_ld_type === 6.U) || (io.de_pipe_reg_st_type === 1.U), 3.U(3.W),
						Mux((io.de_pipe_reg_ld_type === 4.U) || (io.de_pipe_reg_ld_type === 2.U) || (io.de_pipe_reg_st_type === 2.U), 1.U(3.W), 0.U(3.W))))
	val de_misalign = (io.alu_out(2, 0) & de_size) =/= 0.U
	val ls_stall = Mux(io.stall, (io.em_pipe_reg.ld_type.orR || io.em_pipe_reg.st_type.orR) && io.em_pipe_reg.enable && (!io.em_pipe_reg.is_clint) && !em_misalign,
										(io.de_pipe_reg_ld_type.orR || io.de_pipe_reg_st_type.orR) && io.de_pipe_reg_enable && !de_is_amo && !io.is_clint && !io.flush_em && !de_misalign)

	val data_cache_tag = RegInit(false.B)
	val dTLB_fault_reg = RegInit(0.U(2.W))
	// The access of the instruction in EM is complete (or has faulted). The
	// pipeline may stay stalled by another stage after that, so the dTLB must
	// not be started again for the same instruction: the repeated access would
	// still be in flight when the pipeline advances and its response would be
	// taken for the next instruction (and an AMO would be applied twice).
	val mem_done = (data_cache_tag && !amo_second) || dTLB_fault_reg =/= 0.U
	io.em_fault := dTLB_fault_reg =/= 0.U || em_misalign

	dTLB.io.tlb_flush_vpn   := Mux(io.tlb_flush_all, 0.U, io.em_pipe_reg.sfence_rs1(38, 12))
	dTLB.io.tlb_flush_asid  := Mux(io.tlb_flush_all, 0.U, io.em_pipe_reg.sfence_rs2)
	dTLB.io.flush := io.tlb_flush
	// The data TLB must advance while its own translation is the source of the
	// pipeline stall; otherwise a hit can wait for a response forever.
	dTLB.io.stall := false.B
	dTLB.io.valid := io.tlb_valid && ls_stall && !(io.stall && mem_done)
	// MPRV=1: load/store use MPP as privilege level (M-mode proxy)
	dTLB.io.priv  := Mux(io.mprv, io.mpp, io.mode)
	dTLB.io.mprv := false.B 
	dTLB.io.sum	  := io.sum
	dTLB.io.mxr   := io.mxr
	// stores, SC and AMO need store permission even while they only read
	dTLB.io.wen   := Mux(io.stall, io.em_pipe_reg.st_type.orR, io.de_pipe_reg_st_type.orR)
	dTLB.io.rw    := wen_final
	dTLB.io.satp  := io.satp
	dTLB.io.va	  := Mux(io.stall, io.em_pipe_reg.alu_out, io.alu_out)
	dTLB.io.mask  := tlb_store_mask
	dTLB.io.cache_response <> io.dcache.cpu_response

	val tlb_tag = RegInit(false.B)
	when(!io.tlb_valid){
		tlb_tag := true.B
	}.elsewhen(dTLB.io.tlb_ready){
		tlb_tag := true.B
	}.elsewhen(!io.stall){
		tlb_tag := dTLB.io.tlb_ready
	}
	io.tlb_ready := tlb_tag

	// A dTLB fault is one cycle long in the TLB, but the trap is only taken once
	// no other stage stalls the pipeline: hold the fault code until the
	// instruction leaves EM.
	when(dTLB.io.fault =/= 0.U){
		dTLB_fault_reg := dTLB.io.fault
	}.elsewhen(!io.stall){
		dTLB_fault_reg := 0.U
	}
	io.dTLB_fault := dTLB_fault_reg

	val data_cache_response_data = RegInit(0.U(64.W))

	// with paging only the response to the translated access counts, not the
	// responses to the page table reads of the walk
	val mem_response = io.dcache.cpu_response.ready &&
		Mux(io.tlb_valid, dTLB.io.fetch_request.valid || io.dcache_flush_tag, io.dcache.cpu_request.valid)
	when(mem_response){
		data_cache_tag := true.B
		data_cache_response_data := io.dcache.cpu_response.data
	}.elsewhen(!io.stall){
		data_cache_tag := false.B
	}

	when(mem_response){
		when(wen_final){						// any committed store clears the reservation
			resv_valid := false.B
			when(amo_second){
				amo_second := false.B
			}
		}.elsewhen(is_lr){						// LR sets the reservation
			resv_valid := true.B
		}.elsewhen(is_amo && !is_sc){			// AMO load phase done -> store phase
			amo_old := io.dcache.cpu_response.data >> (io.em_pipe_reg.alu_out(2, 0) << 3.U)
			amo_second := true.B
		}
		when(is_sc){							// SC always consumes the reservation
			resv_valid := false.B
			sc_success := sc_fire
		}
	}
	when(!io.stall){
		amo_second := false.B
	}

	io.data_cache_response_data := data_cache_response_data
	io.store_valid := mem_response && wen_final
	io.store_addr := io.dcache.cpu_request.addr
	io.store_data := io.dcache.cpu_request.data
	io.store_mask := io.dcache.cpu_request.mask
	io.amo_forward_data := Mux(is_sc, Mux(sc_success, 0.U, 1.U),
			Mux(is_lr, data_cache_response_data >> ((io.em_pipe_reg.alu_out & "h07".U) << 3.U), amo_old))
	io.data_cache_tag := data_cache_tag

	io.clint_r_data := 0.U
	io.clint_timer_clear := false.B
	io.clint_soft_clear := false.B
	io.clint_timer_valid := false.B
	io.clint_soft_valid := false.B

	io.em_enable := io.em_pipe_reg.enable
	io.dcache.flush := io.dcache_flush_tag
	io.dcache.cpu_request.valid := Mux(io.tlb_valid, (ls_stall && !dTLB.io.tlb_ready && dTLB.io.tlb_request.valid) || (io.dcache_flush_tag)&&(!data_cache_tag) ,(ls_stall || (io.dcache_flush_tag)) && (!data_cache_tag || (is_amo && amo_second)))
	io.dcache.cpu_request.rw := Mux(io.tlb_valid, dTLB.io.tlb_request.rw, wen_final)
	io.dcache.cpu_request.addr := Mux(io.tlb_valid, dTLB.io.tlb_request.addr, Mux(io.stall, io.em_pipe_reg.alu_out, io.alu_out))
	io.dcache.cpu_request.data := Mux(amo_second && is_amo, amo_store_data,
									Mux(io.stall, io.em_pipe_reg.st_data << (io.em_pipe_reg.alu_out(2, 0) << 3.U), io.src2_data << (io.alu_out(2, 0) << 3.U))(63, 0))
	val accessType_stall = Mux((io.em_pipe_reg.ld_type === 7.U) || (io.em_pipe_reg.st_type === 4.U), double.asUInt, 
								Mux((io.em_pipe_reg.ld_type === 1.U) || (io.em_pipe_reg.ld_type === 6.U) || (io.em_pipe_reg.st_type === 1.U), word.asUInt, 
									Mux((io.em_pipe_reg.ld_type === 4.U) || (io.em_pipe_reg.ld_type === 2.U) || (io.em_pipe_reg.st_type === 2.U), half.asUInt, byte.asUInt)
								)
							)

	val accessType_direct = Mux((io.de_pipe_reg_ld_type === 7.U) || (io.de_pipe_reg_st_type === 4.U), double.asUInt,
								Mux((io.de_pipe_reg_ld_type === 1.U) || (io.de_pipe_reg_ld_type === 6.U) || (io.de_pipe_reg_st_type === 1.U), word.asUInt,
									Mux((io.de_pipe_reg_ld_type === 4.U) || (io.de_pipe_reg_ld_type === 2.U) || (io.de_pipe_reg_st_type === 2.U), half.asUInt, byte.asUInt)
								)
							)
	
	io.dcache.accessType := Mux(io.stall, accessType_stall, accessType_direct)
	val st_mask = Mux(io.stall, Mux(io.em_pipe_reg.st_type === ST_SW, "b00001111".U, 
								Mux(io.em_pipe_reg.st_type === ST_SH, "b00000011".U,
									Mux(io.em_pipe_reg.st_type === ST_SB, "b00000001".U, "b11111111".U)
								)
							),
							Mux(io.de_pipe_reg_st_type === ST_SW, "b00001111".U, 
								Mux(io.de_pipe_reg_st_type === ST_SH, "b00000011".U,
									Mux(io.de_pipe_reg_st_type === ST_SB, "b00000001".U, "b11111111".U)
								)
							)
						) 
	tlb_store_mask := st_mask

	io.dcache.cpu_request.mask := Mux(st_mask === "b11111111".U, st_mask(7, 0), Mux(io.stall, (st_mask << io.em_pipe_reg.alu_out(2,0))(7, 0), (st_mask << io.alu_out(2,0))(7, 0)))
	// LR returns the loaded value; a true AMO returns the old value captured in
	// its load phase; SC returns 0 on success and 1 on failure (unshifted)
	// amo_old is latched already aligned to the access; LR shifts the raw response
	val shift = (io.em_pipe_reg.alu_out & "h07".U) << 3.U
	val raw_shifted = Mux(is_amo && !is_sc, Mux(is_lr, data_cache_response_data >> shift, amo_old), data_cache_response_data >> shift)
	val load_data = Mux(is_sc && is_amo, Mux(sc_success, 0.U, 1.U), raw_shifted)
	val load_data_ext = Mux(io.em_pipe_reg.ld_type === LD_LW, Cat(Mux(load_data(31).asBool, "hffffffff".U, 0.U(32.W)), load_data(31, 0)),
							Mux(io.em_pipe_reg.ld_type === LD_LWU, Cat(Fill(32, 0.U), load_data(31, 0)),
								Mux(io.em_pipe_reg.ld_type === LD_LH, Cat(Mux(load_data(15).asBool, "hffffffffffff".U, 0.U(48.W)), load_data(15, 0)),
									Mux(io.em_pipe_reg.ld_type === LD_LHU, Cat(Fill(48, 0.U), load_data(15, 0)),
										Mux(io.em_pipe_reg.ld_type === LD_LB, Cat(Mux(load_data(7).asBool, "hffffffffffffff".U, 0.U(56.W)), load_data(7, 0)),
											Mux(io.em_pipe_reg.ld_type === LD_LBU, Cat(Fill(56, 0.U), load_data(7,0)), load_data)
											)
										)
									)
								)
							)

	io.csr_inst := io.em_pipe_reg.inst
	io.csr_isSret := io.em_pipe_reg.inst === Instructions.SRET
	io.csr_isMret := io.em_pipe_reg.inst === Instructions.MRET 
	io.csr_excPC := io.em_pipe_reg.pc 
	io.csr_jump_taken := io.em_pipe_reg.jump_taken
	io.csr_is_illegal := io.em_pipe_reg.csr_is_illegal
	io.csr_inst_misalign := io.em_pipe_reg.csr_inst_misalign
	io.csr_store_misalign := io.em_pipe_reg.csr_store_misalign
	io.csr_load_misalign := io.em_pipe_reg.csr_load_misalign
	io.iTLB_fault := io.em_pipe_reg.iTLB_fault
	io.csr_alu_out := io.em_pipe_reg.alu_out
	
	when(io.flush_mw && !io.stall){
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
	}.elsewhen(!io.stall && !io.flush_mw){
		mw_pipe_reg.load_data := load_data_ext
		mw_pipe_reg.alu_out := io.em_pipe_reg.alu_out
		mw_pipe_reg.dest := io.em_pipe_reg.dest
		mw_pipe_reg.wb_sel := io.em_pipe_reg.wb_sel
		mw_pipe_reg.wb_en := io.em_pipe_reg.wb_en
		mw_pipe_reg.pc := io.em_pipe_reg.pc
		mw_pipe_reg.inst := io.em_pipe_reg.inst
		mw_pipe_reg.csr_read_data := io.em_pipe_reg.csr_read_data
		mw_pipe_reg.csr_write_op := io.em_pipe_reg.csr_write_op			//write_op输入，可以写csr寄存器
		mw_pipe_reg.csr_write_addr := io.em_pipe_reg.csr_write_addr		//csr寄存器地址
		mw_pipe_reg.csr_write_data := io.em_pipe_reg.csr_write_data		//要写的数据
		mw_pipe_reg.enable := io.em_pipe_reg.enable
	}

	io.mw_pipe_reg := mw_pipe_reg
}

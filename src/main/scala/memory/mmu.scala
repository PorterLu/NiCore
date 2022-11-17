package myCPU

import chisel3._ 
import chisel3.util._ 
import CSR._ 

/*
*	SATP of RV64
*	*****************************************************
*	* 	MODE 	* 	ASID  *  			PPN				*
* 	*****************************************************
* 		4			16					44
*/

object pageSize extends ChiselEnum{
	val PG_4K, PG_2M, PG_1G = Value
}

import pageSize._ 

class PTE extends Bundle{
	val reserved = UInt(10.W)
	val ppn 	 = UInt(44.W)
	val RSW 	 = UInt(2.W)
	val D 		 = Bool()
	val A 		 = Bool()
	val G 		 = Bool()
	val U 		 = Bool()
	val X 		 = Bool()
	val w		 = Bool()
	val R 		 = Bool()
	val V 		 = Bool() 

	def fetchCheck(priv: UInt, sum: Bool) : Bool = {
		val priv_ok = WireDefault(false.B)
		switch(priv){
			is(CSR_MODE_U){
				priv_ok := U
			}

			is(CSR_MODE_S){
				priv_ok := sum && !U || !sum
			}

			is(CSR_MODE_M){
				priv_ok := true.B
			}
		}

		priv_ok && X 
	}

	def lsCheck(priv: UInt, sum: Bool, is_load: Bool, mxr: Bool) : Bool = {
		val priv_ok = WireDefault(false.B)
		switch(priv){
			is(CSR_MODE_U){
				priv_ok := U
			}

			is(CSR_MODE_S){
				priv_ok := sum && !U || !sum
			}

			is(CSR_MODE_M){
				priv_ok := true.B 
			}
		}

		priv_ok && ((is_load &&((R && !X)|| (mxr && (R || X)))) || (!is_load && W)) 
	} 
}

class TLBEntry extends Bundle{
	val vpn		= UInt(27.W)
	val ppn 	= UInt(44.W)
	val asid 	= UInt(16.W)
	val size 	= UInt(2.W)
	val RSW 	= UInt(2.W) 
	val D 		= Bool()
	val A		= Bool()
	val G 		= Bool()
	val U 		= Bool()
	val X		= Bool()
	val W		= Bool()
	val R 		= Bool()
	val V 		= Bool()

	def fromPTE(pte: UInt, va: UInt, satp_asid: UInt, pgsize:  pageSize.Type): Unit = {
		when(pte(0)){													//该页表项是有效的
			RSW := pte(9, 8)
			D := pte(7)													//dirty
			A := pte(6)													//access
			G := pte(5)
			U := pte(4)													
			X := pte(3)
			W := pte(2)
			R := pte(1)
			V := pte(0)
			ppn := pte(53, 10)
			size := pgsize
			asid := satp_asid
			switch(pgsize){
				is(PG_4K){
					vpn := va(38, 12)
				}
				is(PG_2M){
					vpn := Cat(va(38, 21), 0.U(9.W))
				}
				is(PG_1G){
					vpn := Cat(va(38, 30), 0.U(18.W))
				}
			}
		}
	}

	def checkHit(va: UInt): Bool = {
		val ok = WireDefault(false.B)
		switch(size){
			is(size){
				is(PG_4K){
					ok := va(63,12).asSInt === vpn.asSInt
				}
				is(PG_2M){
					ok := va(63, 21).asSInt === vpn(26, 9).asSInt
				}
				is(PG_1G){
					ok := va(63, 30).asSInt === vpn(26, 18).asSInt
				}
			}
		}
		ok && V
	}

	def va2pa(va: UInt): UInt = {
		val pa = WireDefault(0.U)
		switch(size){
			is(PG_4K){
				pa := Cat(ppn, va(11, 0)).asUInt
			}
			is(PG_2M){
				pa := Cat(ppn(43, 9), va(20, 0)).asUInt
			}
			is(PG_4G){
				pa := Cat(ppn(43, 18), va(29, 0)).asUInt
			}
		}
		pa
	}

	def invalidate(): Unit = {
		V = false.B
	}

	def fetchCheck(priv: UInt, sum: Bool) : Bool = {
		val priv_ok = WireDefault(false.B)
		switch(priv){
			is(CSR_MODE_U){
				priv_ok := U
			}

			is(CSR_MODE_S){
				priv_ok := sum && !U || !sum
			}

			is(CSR_MODE_M){
				priv_ok := true.B
			}
		}

		priv_ok && X 
	}

	def lsCheck(priv: UInt, sum: Bool, is_load: Bool, mxr: Bool) : Bool = {
		val priv_ok = WireDefault(false.B)
		switch(priv){
			is(CSR_MODE_U){
				priv_ok := U
			}

			is(CSR_MODE_S){
				priv_ok := sum && !U || !sum
			}

			is(CSR_MODE_M){
				priv_ok := true.B 
			}
		}

		priv_ok && ((is_load &&((R && !X)|| (mxr && (R || X)))) || (!is_load && W)) 
	}
}

/*
def fromPTE(pte: UInt, va: UInt, satp_asid: UInt, pgsize:  pageSize.Type): Unit = {
		when(pte(0)){													//该页表项是有效的
			RSW := pte(9, 8)
			D := pte(7)													//dirty
			A := pte(6)													//access
			G := pte(5)
			U := pte(4)													
			X := pte(3)
			W := pte(2)
			R := pte(1)
			V := pte(0)
			ppn := pte(53, 10)
			size := pgsize
			asid := satp_asid
			switch(pgsize){
				is(PG_4K){
					vpn := va(38, 12)
				}
				is(PG_2M){
					vpn := Cat(va(38, 21), 0.U(9.W))
				}
				is(PG_1G){
					vpn := Cat(va(38, 30), 0.U(18.W))
				}
			}
		}
	}*/

	/*
	val vpn 	= io.va(38, 12)
	val tlbe 	= RegInit(0.U.asTypeOf(Vec(16, TLBEntry)))
	val random 	= Counter(16)
	val vpn_match = VecInit(Seq.fill(16)(false.B))
	val asid_match = VecInit(Seq.fill(16)(false.B))
	val asid = io.satp(60, 44)
	for(i <- 0 until 16){
		vpn_match(i.U) := false.B 
		asid_match(i.U) := false.B
	}
	
	io.falut := no_page_falut
	io.r_entry := 0.U.asTypeOf(new TLBEntry())
	when(io.flush && io.valid){
		for(i <- 0 until 16){
			when(tlbe(i.U).asid === asid || asid === 0.U){
				asid_match(i.U) := true.B
			}.otherwise{
				when(vpn === 0.U && !tlbe.G){
					vpn_match(i.U) := 0.U
				}.elsewhen(!tlbe.G){
					switch(tlbe(i.U).size){
						is(PG_4K){
							when(vpn === tlbe(i.U).vpn){
								vpn_match(i.U) := true.B
							}
						}
						is(PG_2M){
							when(vpn(26, 10) === tlbe(i.U).vpn(26, 10)){
								vpn_match(i.U) := true.B 
							}
						}
						is(PG_1G){
							when(vpn(26, 18) === tlbe(i.U).vpn(26, 18)){
								vpn_match(i.U) := true.B
							}
						}
					}
				}
			}

			when(vpn_match(i.U) && asid_match(i.U)){
				tlbe(i.U).v := false.B
			}
		}
	}.elsewhen(io.wen && io.valid){
		for(i <- 0 until 16){
			when(!tlbe.lsCheck(io.priv, io.sum, false.B, io.mxr)){
				io.fault := store_page_fault
			}.elsewhen(tlbe(i.U).checkHit(io.va)){
				tlbe(i.U).fromPTE(io.w_entry, io.va, io.stap(44, 59), io.pageSize)
			}
		}
	}.elsewhen(io.valid){
		for(i <- 0 until 16){
			if(tlb_name == "iTLB"){
				when(!tlbe.fetchCheck(io.priv, io.sum)){
					io.falut := inst_page_fault
				}.elsewhen(tlbe(i.U).checkHit(io.va)){
					io.r_entry := tlbe(i.U)
				}
			} else {
				when(!tlbe.lsCheck(io.priv, io.sum, true.B, io.mxr)){
					io.r_entry := tlbe(i.U)
				}
			}
		}
	}*/

object Page_fault extends ChiselEnum{
	val no_page_falut, inst_page_fault, load_page_fault, store_page_fault = Value
}

object TLB_state extends ChiselEnum{
	val sIdle, sMatch, sFlush, sFirstLevel, sSecondLevel, sThridLevel, sData = Value
}

import Page_fault._ 
import TLB_state._ 
class TLB(tlb_name: String)extends Moudle{
	val io = IO(new Bundle{
		val priv  = Input(UInt(2.W))
		val mprv = Input(Bool())
		val sum	  = Input(Bool())
		val mxr   = Input(Bool())
		val wen   = Input(Bool())
		val satp  = Input(UInt(64.W))
		val va 	  = Input(UInt(64.W))
		val mask  = Input(UInt(8.W))

		val paddr  = Output(UInt(64.W))
		val fault  = Ouput(UInt(2.W))
		val tlb_ready = Output(Bool())

		val tlb_request = Output(new CPU_Request)
		val cache_response = Input(new CPU_Response)
	})

	val translationLevel = RegInit(3.U(2.W))
	val tlb_type = if(tlb_name == "iTLB") true.B else false.B
 	val tlb_state = RegInit(sIdle)
	val next_state = WireDefault(sIdle)
	val vpn 	= io.va(38, 12)
	val tlbe 	= RegInit(0.U.asTypeOf(Vec(16, TLBEntry)))
	val random 	= Counter(16)
	val vpn_match = VecInit(Seq.fill(16)(false.B))
	val asid_match = VecInit(Seq.fill(16)(false.B))
	val asid = io.satp(60, 44)
	val matchList = VecInit(Seq.fill(16)(false.B))
	val faultList = VecInit(Seq.fill(16)(false.B))
	val pte 	= WireInit(0.U(new PTE))
	val pte_reg = RegInit(0.U(new PTE))
	val ppn_base = Cat(io.satp(43, 0), 0.U(12.W)).asSInt.asUInt
	val ppn2 	= vpn(26, 18)
	val ppn1 	= vpn(17, 9)
	val ppn0	= vpn(8, 0)
	val pageSize = RegInit(PG_4K)
	io.tlb_request.addr  := 0.U 
	io.tlb_request.data  := 0.U 
	io.tlb_request.mask  := 0.U 
	io.tlb_request.rw 	 := false.B 
	io.tlb_request.valid := false.B

	for(i <- 0 until 16){
		vpn_match(i.U) := false.B 
		asid_match(i.U) := false.B
	}

	tlb_state := next_state
	io.fault := no_page_falut

	io.tlb_request.valid := false.B 
	io.tlb_request.data := 0.U 
	io.tlb_request.mask := 0.U 
	io.tlb_request.rw := false.B
	io.tlb_request.addr := "h80000000".U 

	switch(tlb_state){
		is(sIdle){
			next_state := sIdle
			when(!io.stall){
				when(io.flush && io.valid){
					next_state := sFlush
				}.elsewhen(io.valid){
					next_state := sMatch
				}.otherwise{
					next_state := sIdle
				}
			}
		}
		is(sFlush){
			next_state := sFlush
			when(!io.stall){
				for(i <- 0 until 16){
					when(tlbe(i.U).asid === asid || asid === 0.U){
						asid_match(i.U) := true.B
					}
					
					when(vpn === 0.U && !tlbe.G){
						vpn_match(i.U) := 0.U
					}.elsewhen(!tlbe.G){
						switch(tlbe(i.U).size){
							is(PG_4K){
								when(vpn === tlbe(i.U).vpn){
									vpn_match(i.U) := true.B
								}
							}
							is(PG_2M){
								when(vpn(26, 10) === tlbe(i.U).vpn(26, 10)){
									vpn_match(i.U) := true.B 
								}
							}
							is(PG_1G){
								when(vpn(26, 18) === tlbe(i.U).vpn(26, 18)){
									vpn_match(i.U) := true.B
								}
							}
						}
					}

					when(vpn_match(i.U) && asid_match(i.U)){
						tlbe(i.U).v := false.B
					}
				}
				next_state := sIdle
				tlb_ready := true.B
			}
		}
		is(sMatch){
			next_state := sMatch
			when(!io.stall){
				matchList := tlbe.map{k => k.checkHit(io.va)}
				when(matchList.reduce(_|_)){
					when(!io.wen){
						when(tlb_type){
							faultList := tlbe.map{k => k.fetchCheck(io.priv, io.sum)}
							when(faultList.reduce(_|_)){
								io.fault := inst_page_fault
								//next_state := sIdle
							}.otherwise{
								for(i <- 0 until 16){
									when(faultList(i)){
										io.paddr := tlbe(i).va2pa(io.va)
									}
								}
							}
						}.otherwise{
							faultList := tlbe.map{k => k.lsCheck(io.priv, io.sum, true.B, io.mxr)}
							when(faultList.reduce(_|_)){
								io.fault := load_page_fault
								//next_state := sIdle
							}.otherwise{
								for(i <- 0 until 16){
									when(faultList(i)){
										io.paddr := tlbe(i).va2pa(io.va)
									}
								}
							}
						}
					}.otherwise{
						faultList := tlbe.map{k => k.lsCheck(io.priv, io.sum, false.B, io.mxr)}
						when(faultList.reduce(_|_)){
							io.fault := store_page_fault
							//next_state := sIdle
						}.otherwise{
							for(i <- 0 until 16){
								when(faultList(i)){
									io.paddr := tlbe(i).va2pa(io.va)
								}
							}
						}
					}
					next_state := sIdle
					tlb_ready  := true.B
				}.otherwise{				//TLB未名中,未命中需要读些内存，只需要向cache输出访存信号即可
					next_state := sThridLevel	
				}	
			}
		}
		is(sThridLevel){
			next_state := sThridLevel
			tlb_request.addr := io.va
			tlb_request.valid := true.B 
			tlb_request.rw := false.B
			tlb_request.mask := 0.U
			when(!io.stall && cache_response.ready){
				pte := cache_response.data.asTypeOf(pte)
				pte_reg := cache_response.data.asTypeOf(pte)
				next_state := sSecondLevel
				when(!pte.V || (!pte.R && pte.W)){
					when(tlb_type){
						io.fault := inst_page_fault
					}.otherwise{
						when(io.wen){
							io.fault := store_page_fault
						}.otherwise{
							io.fault := load_page_fault
						}
					}
					next_state := sIdle
				}.elsewhen(pte.V && (pte.R || pte.X)){
					pageSize := PG_1G
					next_state := sData
				}
				
			}
		}
		is(sSecondLevel){
			next_state := sSecondLevel
			tlb_request.addr := Cat(pte.ppn, 0.U(12.W)).asSInt.asUInt
			tlb_request.valid := true.B 
			tlb_request.rw 	:= false.B 
			tlb_request.mask := 0.U 			
			when(!io.stall && cache_response.ready){
				pte := cache_response.data.asTypeOf(pte)
				pte_reg := cache_response.data.asTypeOf(pte)
				next_state := sFirstLevel
				when(!pte.V || (!pte.R && pte.W)){
					when(tlb_type){
						io.fault := inst_page_fault
					}.otherwise{
						when(io.wen){
							io.fault := store_page_fault
						}.otherwise{
							io.fault := load_page_fault
						}
					}
					next_state := sIdle
				}.elsewhen(pte.V && (pte.R || pte.X)){
					pageSize := PG_2M
					next_state := sData
				}
			} 
		}
		is(sFirstLevel){
			next_state := sFirstLevel
			tlb_request.addr := Cat(pte.ppn, 0.U(12.W)).asSInt.asUInt
			tlb_request.valid := true.B 
			tlb_request.rw 	  := false.B
			tlb_request.mask  := 0.U
			when(!io.stall && cache_response.ready){
				pte := cache_response.data.asTypeOf(pte)
				pte_reg := cache_response.data.asTypeOf(pte)
				next_state := sData
				when(!pte.V || (!pte.R && pte.W)){
					when(tlb_type){
						io.fault := inst_page_fault
					}.otherwise{
						when(io.wen){
							io.fault := store_page_fault
						}.otherwise{
							io.fault := load_page_fault
						}
					}
					next_state := sIdle
				}.otherwise{
					when(pte.R || pte.X){
						next_state := sData
						pageSize := PG_4K
					}.otherwise{
						when(tlb_type){
							io.fault := inst_page_fault
						}.otherwise{
							when(io.wen){
								io.fault := store_page_fault
							}.otherwise{
								io.fault := load_page_fault
							}
						}
						next_state := sIdle
					}
				}
			}
		}
		is(sData){					//检查访问的合法性
			next_state := sData
			when(tlb_type){

			}.otherwise{
				when(io.wen){

				}.otherwise{
					
				}
			}
			when(!io.stall){
				next_state := sIdle
			} 
		}
	}
}


/* 
		val priv  = Input(UInt(2.W))
		val sum	  = Input(Bool())
		val mxr   = Input(Bool())
		val satp  = Input(UInt(64.W))
		val valid = Input(Bool())
		val wen   = Input(Bool())
		val flush = Input(Bool())
		val w_entry = Input(new PTE)
		val asid   = Input(UInt(16.W))
		val va 	  = Input(UInt(64.W))
		val pageSize = Input(UInt(2.W))

		val r_entry = Output(new PTE)
		val fault  = Ouput(UInt(2.W))
*/

/*
object TLBState extends ChiselEnum{
	val sIdle, sMatch, sReadAddr, sRead, sWriteAddr, sWrite = Value
}


class MMU extends Module{
	val io = IO(new Bundle{
		val stall = Input(Bool())
		val priv  = Input(UInt(2.W))
		val sum   = Input(Bool())
		val mxr	  = Input(Bool())
		val flush = Input(Bool())
		val satp  = Input(UInt(64.W))

		//val ivalid 		= Input(Bool())
		//val iTLB_wen    = Input(Bool())		
		//val iTLB_wentry = Input(new PTE)
		//val iTLB_asid   = Input(UInt(16.W))
		//val iTLB_va 	= Input(UInt(64.W))

		//val dvalid 		= Input(Bool())
		//val dTLB_wen 	= Input(Bool())
		//val dTLB_wentry = Input(new PTE)
		//val dTLB_asid 	= Input(UInt(16.W))
		//val dTLB_va 	= Input(UInt(64.W))		

		val falut 	  = Output(UInt(2.W))
		val iTLB_read_data = Output(UInt(64.W))
		val dTLB_read_data = Output(UInt(64.W))

		val icache_response 	= Input(Bool())
		val icache_response_data = Input(UInt(64.W))
		val icpu_request 		= Output(Bool())
		val icpu_request_addr 	= Output(UInt(64.W))
		val icpu_request_accessType = Ouput(UInt(2.W))
		val icpu_request_mask 	= Output(UInt(8.W))
		val ready 				= Output(Bool())

		
		val dcache_response 	= Input(Bool())
		val dcache_response_data = Input(UInt(64.W))
		val dcpu_request 		= Output(Bool())
		val dcpu_request_addr 	= Output(UInt(64.W))
		val dcpu_request_accessType = Output(UInt(2.W))
		val dcpu_request_mask 	= Output(UInt(8.W))
		val ready 				= Output(Bool())
	})

	val currentLevel = RegInit(3.U(2.W))
	val iTLB = Module(new TLB("iTLB"))
	val dTLB = Module(new TLB("dTLB"))
	
	iTLB.io.priv := io.priv
	iTLB.io.sum  := io.sum
	iTLB.io.mxr  := io.mxr
	iTLB.io.flush := io.flush
	iTLB.io.valid := ivalid
	iTLB.io.wen := false.B 
	iTLB.io.satp := io.satp
}*/

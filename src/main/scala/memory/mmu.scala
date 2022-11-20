package myCPU

import chisel3._ 
import chisel3.util._
import chisel3.experimental.ChiselEnum
import cache_single_port._ 

import CSR._ 

/*
*	SATP of RV64
*	*****************************************************
*	* 	MODE 	* 	ASID  *  			PPN				*
* 	*****************************************************
* 		4			16					44
*/

object pageSize extends ChiselEnum{
	val pg_4k, pg_2m, pg_1g = Value
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
	val W		 = Bool()
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

object TLBEntry{
	def apply(): TLBEntry = {
		val tmp = Wire(new TLBEntry)
		tmp.vpn := 0.U 
		tmp.ppn := 0.U 
		tmp.asid := 0.U 
		tmp.size := 0.U 
		tmp.RSW := 0.U
		tmp.D := false.B
		tmp.A := false.B 
		tmp.G := false.B 
		tmp.U := false.B
		tmp.X := false.B 
		tmp.W := false.B 
		tmp.R := false.B 
		tmp.V := false.B
		tmp
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
			size := pgsize.asUInt
			asid := satp_asid
			switch(pgsize){
				is(pg_4k){
					vpn := va(38, 12)
				}
				is(pg_2m){
					vpn := Cat(va(38, 21), 0.U(9.W))
				}
				is(pg_1g){
					vpn := Cat(va(38, 30), 0.U(18.W))
				}
			}
		}
	}

	def checkHit(va: UInt, access_asid: UInt): Bool = {
		val ok = WireDefault(false.B)
		when(size === pg_4k.asUInt){
			ok := va(63,12).asSInt === vpn.asSInt && asid === access_asid
		}.elsewhen(size === pg_2m.asUInt){
			ok := va(63, 21).asSInt === vpn(26, 9).asSInt && asid === access_asid
		}.elsewhen(size === pg_1g.asUInt){
			ok := va(63, 30).asSInt === vpn(26, 18).asSInt && asid === access_asid
		}
		ok && V
	}

	def va2pa(va: UInt): UInt = {
		val pa = WireDefault(0.U)
		when(size === pg_4k.asUInt){
			pa := Cat(ppn, va(11, 0)).asUInt
		}.elsewhen(size === pg_2m.asUInt){
			pa := Cat(ppn(43, 9), va(20, 0)).asUInt
		}.elsewhen(size === pg_1g.asUInt){
			pa := Cat(ppn(43, 18), va(29, 0)).asUInt
		}
		pa
	}

	def invalidate(): Unit = {
		V := false.B
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


object Page_fault extends ChiselEnum{
	val no_page_falut, inst_page_fault, load_page_fault, store_page_fault = Value
}

object TLB_state extends ChiselEnum{
	val sIdle, sMatch, sFlush, sFirstLevel, sSecondLevel, sThridLevel, sPrivCheck, sData, sWrite = Value
}

import Page_fault._ 
import TLB_state._ 
class TLB(tlb_name: String) extends Module{
	val io = IO(new Bundle{
		val stall = Input(Bool())
		val valid = Input(Bool())
		val priv  = Input(UInt(2.W))
		val mprv = Input(Bool())
		val sum	  = Input(Bool())
		val mxr   = Input(Bool())
		val wen   = Input(Bool())
		val satp  = Input(UInt(64.W))
		val va 	  = Input(UInt(64.W))
		val mask  = Input(UInt(8.W))

		//val r_data  = Output(UInt(64.W))
		val fault  = Output(UInt(2.W))
		val tlb_ready = Output(Bool())
		val tlb_flush_asid = Input(UInt(16.W))
		val tlb_flush_vpn = Input(UInt(27.W))

		val flush = Input(Bool())
		val tlb_request = Output(new CPU_Request)
		val cache_response = Input(new CPU_Response)
	})

	val tlb_type = if(tlb_name == "iTLB") true.B else false.B
 	val tlb_state = RegInit(sIdle)
	val next_state = WireDefault(sIdle)
	val vpn 	= io.va(38, 12)
	val tlbe 	= RegInit(0.U.asTypeOf(Vec(16, new TLBEntry)))
	val random 	= Counter(16)
	val vpn_match = VecInit(Seq.fill(16)(false.B))
	val asid_match = VecInit(Seq.fill(16)(false.B))
	val asid = io.satp(60, 44)
	val matchList = RegInit(VecInit(Seq.fill(16)(false.B)))
	val faultList = VecInit(Seq.fill(16)(false.B))
	val pte 	= WireInit(0.U.asTypeOf(new PTE))
	val pte_reg = RegInit(0.U.asTypeOf(new PTE))
	val ppn_base = Cat(io.satp(43, 0), 0.U(12.W)).asSInt.asUInt
	val ppn2 	= vpn(26, 18)
	val ppn1 	= vpn(17, 9)
	val ppn0	= vpn(8, 0)
	val page_size_reg = RegInit(0.U(2.W))
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
	io.fault := no_page_falut.asUInt

	io.tlb_request.valid := false.B 
	io.tlb_request.data := 0.U 
	io.tlb_request.mask := 0.U 
	io.tlb_request.rw := false.B
	io.tlb_request.addr := "h80000000".U 
	io.tlb_ready := false.B
//	io.r_data := 0.U
	
	def raise_fault(tlb_type: Bool, wen:Bool): UInt = {
		when(tlb_type){
			inst_page_fault.asUInt
		}.otherwise{
			when(wen){
				store_page_fault.asUInt
			}.otherwise{
				load_page_fault.asUInt
			}
		}
		no_page_falut.asUInt
	}

	switch(tlb_state){
		is(sIdle){
			next_state := sIdle
			when(!io.stall){
				when(io.flush && io.valid){
					next_state := sFlush
				}.elsewhen(io.valid){
					matchList := tlbe.map{k => k.checkHit(io.va, asid)}
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
					when(tlbe(i.U).asid === io.tlb_flush_asid || io.tlb_flush_asid === 0.U){
						asid_match(i.U) := true.B
					}
					
					when(io.tlb_flush_vpn === 0.U && !tlbe(i.U).G){
						vpn_match(i.U) := 0.U
					}.elsewhen(!tlbe(i.U).G){
						when(tlbe(i.U).size === pg_4k.asUInt){
							when(io.tlb_flush_vpn === tlbe(i.U).vpn){
								vpn_match(i.U) := true.B
							}
						}.elsewhen(tlbe(i.U).size === pg_2m.asUInt){
							when(io.tlb_flush_vpn(26, 10) === tlbe(i.U).vpn(26, 10)){
								vpn_match(i.U) := true.B 
							}
						}.elsewhen(tlbe(i.U).size === pg_1g.asUInt){
							when(io.tlb_flush_vpn(26, 18) === tlbe(i.U).vpn(26, 18)){
								vpn_match(i.U) := true.B
							}
						}
					}
				}

				//when(vpn_match(i.U) && asid_match(i.U)){
				for(i <- 0 until 16){
					when(vpn_match(i.U) && asid_match(i.U)){
						tlbe(i.U).V := false.B
					}
				}
				//}
			}
			next_state := sIdle
			io.tlb_ready := true.B
		}
		is(sMatch){
			next_state := sMatch
			when(!io.stall){
				when(matchList.reduce(_|_)){
					when(!io.wen){
						when(tlb_type){
							faultList := tlbe.map{k => k.fetchCheck(io.priv, io.sum)}
							when(faultList.reduce(_|_)){
								io.fault := inst_page_fault.asUInt
								//next_state := sIdle
							}.otherwise{
								for(i <- 0 until 16){
									when(matchList(i)){
										//io.paddr := tlbe(i).va2pa(io.va)
										//pte := cache_response.data.asTypeOf(pte)
										pte_reg := Cat(0.U(10.W), tlbe(i.U).ppn, tlbe(i.U)asUInt(9, 0)).asTypeOf(pte)
										page_size_reg := tlbe(i.U).size
										next_state := sPrivCheck 
									}
								}
							}
						}.otherwise{
							faultList := tlbe.map{k => k.lsCheck(io.priv, io.sum, true.B, io.mxr)}
							when(faultList.reduce(_|_)){
								io.fault := load_page_fault.asUInt
								//next_state := sIdle
							}.otherwise{
								for(i <- 0 until 16){
									when(matchList(i)){
										pte_reg := Cat(0.U(10.W), tlbe(i.U).ppn, tlbe(i.U)asUInt(9, 0)).asTypeOf(pte)
										page_size_reg := tlbe(i.U).size
										next_state := sPrivCheck 
									}
								}
							}
						}
					}.otherwise{
						faultList := tlbe.map{k => k.lsCheck(io.priv, io.sum, false.B, io.mxr)}
						when(faultList.reduce(_|_)){
							io.fault := store_page_fault.asUInt
							//next_state := sIdle
						}.otherwise{
							for(i <- 0 until 16){
								when(matchList(i)){
									pte_reg := Cat(0.U(10.W), tlbe(i.U).ppn, tlbe(i.U)asUInt(9, 0)).asTypeOf(pte)
									page_size_reg := tlbe(i.U).size
									next_state := sPrivCheck 
								}
							}
						}
					}
					next_state := sIdle
					io.tlb_ready  := true.B
				}.otherwise{				//TLB未名中,未命中需要读些内存，只需要向cache输出访存信号即可
					next_state := sThridLevel	
				}	
			}
		}
		is(sThridLevel){
			next_state := sThridLevel
			io.tlb_request.addr := ppn_base + ppn2<<3.U
			io.tlb_request.valid := true.B 
			io.tlb_request.rw := false.B
			io.tlb_request.mask := 0.U
			when(!io.stall && io.cache_response.ready){
				pte := io.cache_response.data.asTypeOf(pte)
				pte_reg := io.cache_response.data.asTypeOf(pte)
				next_state := sSecondLevel

				when(!pte.V || (!pte.R && pte.W)){
					io.fault := raise_fault(tlb_type, io.wen)
					next_state := sIdle
				}.elsewhen(pte.V && (pte.R || pte.X)){
					page_size_reg := pg_1g.asUInt
					next_state := sData

					//这里还要进行巨页的非对齐检查
					when(pte.asUInt(27, 10) =/= 0.U){
						io.fault := raise_fault(tlb_type, io.wen)
						next_state := sIdle
					}
				}
			}
		}
		is(sSecondLevel){
			next_state := sSecondLevel
			io.tlb_request.addr := Cat(pte.ppn, 0.U(12.W)).asSInt.asUInt + ppn1<<3.U 
			io.tlb_request.valid := true.B 
			io.tlb_request.rw 	:= false.B 
			io.tlb_request.mask := 0.U 			
			when(!io.stall && io.cache_response.ready){
				pte := io.cache_response.data.asTypeOf(pte)
				pte_reg := io.cache_response.data.asTypeOf(pte)
				next_state := sFirstLevel
				when(!pte.V || (!pte.R && pte.W)){
					io.fault := raise_fault(tlb_type, io.wen)
					next_state := sIdle
				}.elsewhen(pte.V && (pte.R || pte.X)){
					page_size_reg := pg_2m.asUInt
					next_state := sData

					//这里要对大页的非对奇进行检查
					when(pte.asUInt(18, 10) =/= 0.U){
						io.fault := raise_fault(tlb_type, io.wen)
						next_state := sIdle
					}
				}
			} 
		}
		is(sFirstLevel){
			next_state := sFirstLevel
			io.tlb_request.addr := Cat(pte.ppn, 0.U(12.W)).asSInt.asUInt + ppn0<<3.U
			io.tlb_request.valid := true.B 
			io.tlb_request.rw 	  := false.B
			io.tlb_request.mask  := 0.U
			when(!io.stall && io.cache_response.ready){
				pte := io.cache_response.data.asTypeOf(pte)
				pte_reg := io.cache_response.data.asTypeOf(pte)
				next_state := sData

				when(!pte.V || (!pte.R && pte.W)){
					io.fault := raise_fault(tlb_type, io.wen)
					next_state := sIdle
				}.otherwise{
					when(pte.R || pte.X){
						next_state := sData
						page_size_reg := pg_4k.asUInt
					}.otherwise{
						io.fault := raise_fault(tlb_type, io.wen)
						next_state := sIdle
					}
				}
			}
		}
		is(sPrivCheck){
			next_state := sPrivCheck
			when(tlb_type){
				when(!pte_reg.fetchCheck(io.priv, io.sum)){
					io.fault := inst_page_fault.asUInt
					next_state := sIdle
				}.otherwise{
					next_state := sData
					when(!pte_reg.A || (io.wen && !pte_reg.D)){
						io.fault := raise_fault(tlb_type, io.wen)
						next_state := sIdle
					}
				}
			}.otherwise{
				when(io.wen){
					when(!pte_reg.lsCheck(io.priv, io.sum, false.B, io.mxr)){
						io.fault := store_page_fault.asUInt
						next_state := sIdle
					}.otherwise{
						next_state := sData
						when(!pte_reg.A || (io.wen && !pte_reg.D)){
							io.fault := raise_fault(tlb_type, io.wen)
							next_state := sIdle
						}
					}
				}.otherwise{
					when(!pte_reg.lsCheck(io.priv, io.sum, true.B, io.mxr)){
						io.fault := load_page_fault.asUInt
						next_state := sIdle
					}.otherwise{
						next_state := sData
						when(!pte_reg.A || (io.wen && !pte_reg.D)){
							io.fault := raise_fault(tlb_type, io.wen)
							next_state := sIdle
						}
					}
				}
			}
		}
		is(sData){						//检查访问的合法性
			next_state := sData 
			io.tlb_request.valid := true.B 
			io.tlb_request.rw 	  := io.wen
			io.tlb_request.mask  := io.mask
			when(page_size_reg === pg_1g.asUInt){
				io.tlb_request.addr := Cat(pte_reg.asUInt(53, 28), ppn1, ppn0, 0.U(12.W)).asSInt.asUInt + io.va(11, 0)
			}.elsewhen(page_size_reg === pg_2m.asUInt){
				io.tlb_request.addr := Cat(pte_reg.asUInt(53, 19), ppn0, 0.U(12.W)).asSInt.asUInt + io.va(11, 0)
			}.elsewhen(page_size_reg === pg_4k.asUInt){
				io.tlb_request.addr := Cat(pte_reg.asUInt(53, 10), 0.U(12.W)).asSInt.asUInt + io.va(11, 0)	
			}

			//	def fromPTE(pte: UInt, va: UInt, satp_asid: UInt, pgsize:  pageSize.Type): Unit = {
			tlbe(random.value).fromPTE(io.cache_response.data, io.va, asid, page_size_reg.asTypeOf(pg_4k))
			when(!io.stall && io.cache_response.ready){
				next_state := sIdle
				//io.r_data := io.cache_response.data
				io.tlb_ready := true.B
			} 
		}
	}
}

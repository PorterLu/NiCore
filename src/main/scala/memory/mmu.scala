package myCPU

import chisel3._ 
import chisel3.util._
import chisel3.experimental.ChiselEnum
import cache_single_port._ 

import CSR._ 

/*
*	SATP of RV64
*	*****************************************************
*	* 	MODE 	* 	ASID 	*  			PPN				*
*	*****************************************************
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

	def privCheck(priv: UInt, sum: Bool) : Bool = {
		// S mode can access supervisor pages always, and user pages only when SUM is set
		MuxLookup(priv, true.B, Seq(
			CSR_MODE_U -> U,
			CSR_MODE_S -> (!U || sum),
			CSR_MODE_M -> true.B
		))
	}

	def fetchCheck(priv: UInt, sum: Bool) : Bool = {
		privCheck(priv, sum) && X 
	}

	def lsCheck(priv: UInt, sum: Bool, is_load: Bool, mxr: Bool) : Bool = {
		privCheck(priv, sum) && Mux(is_load, R || (mxr && X), W)
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
	val X 		= Bool()
	val W 		= Bool()
	val R 		= Bool()
	val V 		= Bool()

	def fromPTE(src: PTE, va: UInt, satp_asid: UInt, pgsize:  UInt): Unit = {
		when(src.V){												// only fill valid entries
			RSW := src.RSW
			D := src.D
			A := src.A
			G := src.G
			U := src.U
			X := src.X
			W := src.W
			R := src.R
			V := src.V
			ppn := src.ppn
			size := pgsize
			asid := satp_asid
			vpn := Mux(pgsize === pg_4k.asUInt, va(38, 12),
					Mux(pgsize === pg_2m.asUInt, Cat(va(38, 21), 0.U(9.W)),
						Cat(va(38, 30), 0.U(18.W))))
		}
	}

	def checkHit(va: UInt, access_asid: UInt): Bool = {
		val ok = WireDefault(false.B)
		when(size === pg_4k.asUInt){
			ok := va(63,12).asSInt === vpn.asSInt && (asid === access_asid || G)
		}.elsewhen(size === pg_2m.asUInt){
			ok := va(63, 21).asSInt === vpn(26, 9).asSInt && (asid === access_asid || G)
		}.elsewhen(size === pg_1g.asUInt){
			ok := va(63, 30).asSInt === vpn(26, 18).asSInt && (asid === access_asid || G)
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
		privCheck(priv, sum) && X 
	}

	def lsCheck(priv: UInt, sum: Bool, is_load: Bool, mxr: Bool) : Bool = {
		privCheck(priv, sum) && Mux(is_load, R || (mxr && X), W)
	}

	def privCheck(priv: UInt, sum: Bool) : Bool = {
		MuxLookup(priv, true.B, Seq(
			CSR_MODE_U -> U,
			CSR_MODE_S -> (!U || sum),
			CSR_MODE_M -> true.B
		))
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
	val asid = io.satp(60, 44)
	val matchList = RegInit(VecInit(Seq.fill(16)(false.B)))
	val pte_reg = RegInit(0.U.asTypeOf(new PTE))
	// PTE freshly read from memory this cycle (combinational view of cache_response.data)
	val pte_in = io.cache_response.data.asTypeOf(new PTE)
	val ppn_base = Cat(io.satp(43, 0), 0.U(12.W)).asUInt
	val ppn2 	= vpn(26, 18)
	val ppn1 	= vpn(17, 9)
	val ppn0	= vpn(8, 0)
	val page_size_reg = RegInit(0.U(2.W))
	// whether the current translation came from a page walk (and hence should be filled into the TLB)
	val walked = RegInit(false.B)

	io.tlb_request.addr  := 0.U 
	io.tlb_request.data  := 0.U 
	io.tlb_request.mask  := 0.U 
	io.tlb_request.rw 	 := false.B 
	io.tlb_request.valid := false.B
	io.fault := no_page_falut.asUInt
	io.tlb_ready := false.B

	def raise_fault(): UInt = {
		Mux(tlb_type, inst_page_fault.asUInt, Mux(io.wen, store_page_fault.asUInt, load_page_fault.asUInt))
	}

	def permCheck(p : PTE) : Bool = {
		Mux(tlb_type, p.fetchCheck(io.priv, io.sum), p.lsCheck(io.priv, io.sum, !io.wen, io.mxr))
	}

	switch(tlb_state){
		is(sIdle){
			next_state := sIdle
			io.tlb_ready := !io.valid
			when(!io.stall){
				when(io.flush){
					next_state := sFlush
				}.elsewhen(io.valid){
					matchList := tlbe.map{k => k.checkHit(io.va, asid)}
					next_state := sMatch
				}
			}
		}
		is(sFlush){
			next_state := sFlush
			io.tlb_ready := true.B
			when(!io.stall){
				val flush_all_vpn = io.tlb_flush_vpn === 0.U		// sfence rs1 == x0
				val flush_all_asid = io.tlb_flush_asid === 0.U	// sfence rs2 == x0
				for(i <- 0 until 16){
					val e = tlbe(i.U)
					val vpn_cover = Mux(e.size === pg_4k.asUInt, e.vpn === io.tlb_flush_vpn,
									Mux(e.size === pg_2m.asUInt, e.vpn(26, 9) === io.tlb_flush_vpn(26, 9),
										e.vpn(26, 18) === io.tlb_flush_vpn(26, 18)))
					// global entries are only flushed when rs2 == x0 (all ASIDs)
					val asid_cover = flush_all_asid || (e.asid === io.tlb_flush_asid && !e.G)
					when((flush_all_vpn || vpn_cover) && asid_cover){
						e.invalidate()
					}
				}
				next_state := sIdle
			}
		}
		is(sMatch){
			next_state := sMatch
			when(!io.stall){
				when(matchList.reduce(_|_)){
					// check the permission of the matched entries only
					val permList = for(i <- 0 until 16) yield {
						matchList(i) && Mux(tlb_type, tlbe(i.U).fetchCheck(io.priv, io.sum), 
													tlbe(i.U).lsCheck(io.priv, io.sum, !io.wen, io.mxr))
					}
					when(!permList.reduce(_|_)){
						io.fault := raise_fault()
						io.tlb_ready := true.B
						next_state := sIdle
					}.otherwise{
						walked := false.B
						for(i <- 0 until 16){
							when(matchList(i)){
								pte_reg := Cat(0.U(10.W), tlbe(i.U).ppn, tlbe(i.U).asUInt(9, 0)).asTypeOf(new PTE)
								page_size_reg := tlbe(i.U).size
							}
						}
						next_state := sPrivCheck 
					}
				}.otherwise{				// TLB miss, walk the page table in memory
					walked := true.B
					next_state := sThridLevel	
				}	
			}
		}
		is(sThridLevel){
			next_state := sThridLevel
			io.tlb_request.addr := (ppn_base + (ppn2 << 3.U))(31, 0)
			io.tlb_request.valid := true.B 
			io.tlb_request.rw := false.B
			io.tlb_request.mask := 0.U
			when(!io.stall && io.cache_response.ready){
				pte_reg := pte_in
				when(!pte_in.V || (!pte_in.R && pte_in.W)){
					io.fault := raise_fault()
					io.tlb_ready := true.B
					next_state := sIdle
				}.elsewhen(pte_in.R || pte_in.X){			// 1G leaf
					page_size_reg := pg_1g.asUInt
					when(pte_in.asUInt(27, 10) =/= 0.U){	// superpage must be aligned
						io.fault := raise_fault()
						io.tlb_ready := true.B
						next_state := sIdle
					}.otherwise{
						next_state := sPrivCheck
					}
				}.otherwise{
					next_state := sSecondLevel
				}
			}
		}
		is(sSecondLevel){
			next_state := sSecondLevel
			io.tlb_request.addr := (Cat(pte_reg.ppn, 0.U(12.W)) + (ppn1 << 3.U))(31, 0)
			io.tlb_request.valid := true.B 
			io.tlb_request.rw 	:= false.B 
			io.tlb_request.mask := 0.U 			
			when(!io.stall && io.cache_response.ready){
				pte_reg := pte_in
				when(!pte_in.V || (!pte_in.R && pte_in.W)){
					io.fault := raise_fault()
					io.tlb_ready := true.B
					next_state := sIdle
				}.elsewhen(pte_in.R || pte_in.X){			// 2M leaf
					page_size_reg := pg_2m.asUInt
					when(pte_in.asUInt(18, 10) =/= 0.U){	// superpage must be aligned
						io.fault := raise_fault()
						io.tlb_ready := true.B
						next_state := sIdle
					}.otherwise{
						next_state := sPrivCheck
					}
				}.otherwise{
					next_state := sFirstLevel
				}
			} 
		}
		is(sFirstLevel){
			next_state := sFirstLevel
			io.tlb_request.addr := (Cat(pte_reg.ppn, 0.U(12.W)) + (ppn0 << 3.U))(31, 0)
			io.tlb_request.valid := true.B 
			io.tlb_request.rw 	  := false.B
			io.tlb_request.mask  := 0.U
			when(!io.stall && io.cache_response.ready){
				pte_reg := pte_in
				when(!pte_in.V || (!pte_in.R && pte_in.W) || !(pte_in.R || pte_in.X)){	// leaf required at level 0
					io.fault := raise_fault()
					io.tlb_ready := true.B
					next_state := sIdle
				}.otherwise{
					page_size_reg := pg_4k.asUInt
					next_state := sPrivCheck
				}
			}
		}
		is(sPrivCheck){
			next_state := sPrivCheck
			when(!permCheck(pte_reg)){
				io.fault := raise_fault()
				io.tlb_ready := true.B
				next_state := sIdle
			}.elsewhen(!pte_reg.A || (io.wen && !pte_reg.D)){
				io.fault := raise_fault()
				io.tlb_ready := true.B
				next_state := sIdle
			}.otherwise{
				next_state := sData
			}
		}
		is(sData){						// issue the translated memory access
			next_state := sData 
			io.tlb_request.valid := true.B 
			io.tlb_request.rw 	  := io.wen
			io.tlb_request.mask  := io.mask
			val pa = WireDefault(0.U(56.W))
			when(page_size_reg === pg_1g.asUInt){
				pa := Cat(pte_reg.ppn(43, 18), io.va(29, 0))
			}.elsewhen(page_size_reg === pg_2m.asUInt){
				pa := Cat(pte_reg.ppn(43, 9), io.va(20, 0))
			}.elsewhen(page_size_reg === pg_4k.asUInt){
				pa := Cat(pte_reg.ppn, io.va(11, 0))
			}
			io.tlb_request.addr := pa(31, 0)

			// only refill after a page walk; use the PTE from the walk, not the data response
			when(walked){
				tlbe(random.value).fromPTE(pte_reg, io.va, asid, page_size_reg)
			}
			when(!io.stall && io.cache_response.ready){
				next_state := sIdle
				io.tlb_ready := true.B
			} 
		}
	}

	// the request was squashed (e.g. exception/redirect in the pipeline): abandon it
	when(!io.valid && tlb_state =/= sIdle && tlb_state =/= sFlush){
		next_state := sIdle
		io.tlb_ready := true.B
		io.fault := no_page_falut.asUInt
		io.tlb_request.valid := false.B
	}

	tlb_state := next_state
}

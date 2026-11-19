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

// The size of a page is its level in the page table: 0, 1, 2
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
}

// What a leaf permits. `fetch` is an instruction fetch, `execute` a load
// that needs execute instead of read permission (HLVX), `store` an access
// that needs write permission. The A bit is checked when a PTE is read.
object PagePerm{
	// Sv39 by satp, or the VS-stage of a guest by vsatp
	def stage1(R: Bool, W: Bool, X: Bool, U: Bool, D: Bool, priv: UInt, sum: Bool, mxr: Bool,
			   fetch: Bool, execute: Bool, store: Bool): Bool = {
		// S mode reaches user pages only for data and with SUM
		val mode_ok = Mux(priv === CSR_MODE_U, U, Mux(fetch, !U, !U || sum))
		val kind_ok = Mux(fetch || execute, X, Mux(store, W, R || (mxr && X)))
		mode_ok && kind_ok && (!store || D)
	}

	// guest-physical stage: every access counts as a user access
	def guest(R: Bool, W: Bool, X: Bool, D: Bool, mxr: Bool,
			  fetch: Bool, execute: Bool, store: Bool): Bool = {
		Mux(fetch || execute, X, Mux(store, W, R || (mxr && X))) && (!store || D)
	}
}

// One translation, of a virtual address (`virt` clear) or of a guest virtual
// address through both stages (`virt` set) to a physical address. It keeps
// the permissions of each stage; its size is the smaller of the two pages.
class TLBEntry extends Bundle{
	val valid	= Bool()
	val virt	= Bool()
	val vpn		= UInt(52.W)
	val ppn 	= UInt(44.W)
	val size 	= UInt(2.W)
	val s1 		= Bool()		// translated by satp or vsatp (clear: vsatp is bare)
	val D 		= Bool()
	val U 		= Bool()
	val X 		= Bool()
	val W 		= Bool()
	val R 		= Bool()
	val g 		= Bool()		// translated by hgatp
	val gD 		= Bool()
	val gX 		= Bool()
	val gW 		= Bool()
	val gR 		= Bool()

	def covers(page: UInt): Bool = {
		MuxLookup(size, vpn === page, Seq(
			pg_2m.asUInt -> (vpn(51, 9) === page(51, 9)),
			pg_1g.asUInt -> (vpn(51, 18) === page(51, 18))
		))
	}

	def hit(va: UInt, guest: Bool): Bool = {
		valid && virt === guest && covers(va(63, 12))
	}

	def pa(va: UInt): UInt = {
		MuxLookup(size, Cat(ppn, va(11, 0)), Seq(
			pg_2m.asUInt -> Cat(ppn(43, 9), va(20, 0)),
			pg_1g.asUInt -> Cat(ppn(43, 18), va(29, 0))
		))
	}
}

object Page_fault extends ChiselEnum{
	val no_page_falut, inst_page_fault, load_page_fault, store_page_fault = Value
}

object TLB_state extends ChiselEnum{
	val sIdle, sMatch, sFlush, sStage1, sGuest, sData = Value
}

import Page_fault._
import TLB_state._

// Address translation with a 16-entry TLB and the page-table walker.
//
// io.satp selects stage 1: Sv39 by satp, or for a guest (io.virt) the
// VS-stage by vsatp. A guest address then passes the guest-physical stage,
// Sv39x4 by hgatp, and so does the address of every VS-stage page table
// entry the walker reads. The accessed and dirty bits are never updated: a
// leaf with A clear, or with D clear on a store, faults.
class TLB(tlb_name: String) extends Module{
	val io = IO(new Bundle{
		val stall = Input(Bool())
		val valid = Input(Bool())
		val virt  = Input(Bool())		// the address is one of a guest
		val priv  = Input(UInt(2.W))
		val sum	  = Input(Bool())
		val mxr   = Input(Bool())
		val gmxr  = Input(Bool())		// MXR for the guest-physical stage
		val hlvx  = Input(Bool())		// a load that needs execute permission
		val wen   = Input(Bool())		// access needs store permission
		val rw    = Input(Bool())		// direction of the translated request
		val satp  = Input(UInt(64.W))
		val hgatp = Input(UInt(64.W))
		val va 	  = Input(UInt(64.W))
		val mask  = Input(UInt(8.W))

		val fault  = Output(UInt(2.W))
		// a guest-page fault: the guest physical address that has no
		// translation, and whether it is the address of a VS-stage PTE
		val fault_guest = Output(Bool())
		val fault_gpa = Output(UInt(64.W))
		val fault_pte = Output(Bool())
		val tlb_ready = Output(Bool())

		// drop the entries of guests (flush_virt) or the others, all of
		// them or those that translate the page of flush_va
		val flush = Input(Bool())
		val flush_virt = Input(Bool())
		val flush_page = Input(Bool())
		val flush_va = Input(UInt(64.W))

		val tlb_request = Output(new CPU_Request)
		val fetch_request = Output(new CPU_Request)
		val cache_response = Input(new CPU_Response)
	})

	val is_fetch = (tlb_name == "iTLB").B
 	val tlb_state = RegInit(sIdle)
	val next_state = WireDefault(sIdle)
	// latch the virtual address when the translation starts; io.va may change
	// (e.g. fetch redirect) while the walk is in progress
	val va_reg = RegInit(0.U(64.W))
	val tlbe 	= RegInit(0.U.asTypeOf(Vec(16, new TLBEntry)))
	val victim 	= Counter(16)
	// PTE freshly read from memory this cycle (combinational view of cache_response.data)
	val pte_in = io.cache_response.data.asTypeOf(new PTE)

	val s1_on = io.satp(63, 60) === 8.U
	val g_on = io.virt && io.hgatp(63, 60) === 8.U

	// stage 1: level of the PTE being read, its address, and the leaf
	val s1_level = RegInit(0.U(2.W))
	val pte_addr = RegInit(0.U(56.W))
	val s1_pte = RegInit(0.U.asTypeOf(new PTE))
	val s1_size = RegInit(0.U(2.W))
	// guest-physical stage: the guest physical address being translated, the
	// table and level of the PTE being read, and the leaf
	val g_addr = RegInit(0.U(64.W))
	val g_implicit = RegInit(false.B)	// g_addr is the address of a stage 1 PTE
	val g_level = RegInit(0.U(2.W))
	val g_table = RegInit(0.U(44.W))
	val g_pte = RegInit(0.U.asTypeOf(new PTE))
	val g_size = RegInit(0.U(2.W))
	val final_pa = RegInit(0.U(56.W))
	// whether the current translation came from a page walk (and hence should be filled into the TLB)
	val walked = RegInit(false.B)
	val flush_virt = RegInit(false.B)
	val flush_page = RegInit(false.B)
	val flush_vpn = RegInit(0.U(52.W))

	io.tlb_request.addr  := 0.U
	io.tlb_request.data  := 0.U
	io.tlb_request.mask  := 0.U
	io.tlb_request.rw 	 := false.B
	io.tlb_request.valid := false.B
	io.fetch_request.addr := 0.U
	io.fetch_request.data := 0.U
	io.fetch_request.mask := 0.U
	io.fetch_request.rw := false.B
	io.fetch_request.valid := false.B
	io.fault := no_page_falut.asUInt
	io.fault_guest := false.B
	io.fault_gpa := g_addr
	io.fault_pte := g_implicit
	io.tlb_ready := false.B

	def page_fault(): Unit = {
		io.fault := Mux(is_fetch, inst_page_fault.asUInt, Mux(io.wen, store_page_fault.asUInt, load_page_fault.asUInt))
		io.tlb_ready := true.B
		next_state := sIdle
	}

	def guest_fault(): Unit = {
		page_fault()
		io.fault_guest := true.B
	}

	// the address a leaf of `level` maps `addr` to
	def compose(ppn: UInt, level: UInt, addr: UInt): UInt = {
		MuxLookup(level, Cat(ppn, addr(11, 0)), Seq(
			1.U -> Cat(ppn(43, 9), addr(20, 0)),
			2.U -> Cat(ppn(43, 18), addr(29, 0))
		))
	}

	// a superpage must be aligned
	def aligned(ppn: UInt, level: UInt): Bool = {
		MuxLookup(level, true.B, Seq(
			1.U -> (ppn(8, 0) === 0.U),
			2.U -> (ppn(17, 0) === 0.U)
		))
	}

	def start_guest(addr: UInt, for_pte: Bool): Unit = {
		g_addr := addr
		g_implicit := for_pte
		g_level := 2.U
		g_table := io.hgatp(43, 0)
		next_state := sGuest
	}

	// read the stage 1 PTE at `addr`, which for a guest is a guest physical address
	def read_stage1(addr: UInt): Unit = {
		when(g_on){
			start_guest(addr, true.B)
		}.otherwise{
			pte_addr := addr
			next_state := sStage1
		}
	}

	switch(tlb_state){
		is(sIdle){
			next_state := sIdle
			io.tlb_ready := !io.valid
			when(!io.stall){
				when(io.flush){
					flush_virt := io.flush_virt
					flush_page := io.flush_page
					flush_vpn := io.flush_va(63, 12)
					next_state := sFlush
				}.elsewhen(io.valid){
					va_reg := io.va
					next_state := sMatch
				}
			}
		}
		is(sFlush){
			next_state := sFlush
			io.tlb_ready := true.B
			when(!io.stall){
				for(e <- tlbe){
					when(e.virt === flush_virt && (!flush_page || e.covers(flush_vpn))){
						e.valid := false.B
					}
				}
				next_state := sIdle
			}
		}
		is(sMatch){
			next_state := sMatch
			when(!io.stall){
				val hits = VecInit(tlbe.map(_.hit(va_reg, io.virt)))
				val hit = hits.asUInt.orR
				val index = PriorityEncoder(hits)
				val e = tlbe(index)
				val allowed =
					(!e.s1 || PagePerm.stage1(e.R, e.W, e.X, e.U, e.D, io.priv, io.sum, io.mxr, is_fetch, io.hlvx, io.wen)) &&
					(!e.g || PagePerm.guest(e.gR, e.gW, e.gX, e.gD, io.gmxr, is_fetch, io.hlvx, io.wen))
				when(hit && allowed){
					walked := false.B
					final_pa := e.pa(va_reg)
					next_state := sData
				}.otherwise{
					// An entry that does not permit the access is dropped and
					// the page table walked again: the walk finds the fault.
					when(hit){
						tlbe(index).valid := false.B
					}
					walked := true.B
					when(!s1_on){
						// a guest without paging of its own: the address is guest physical
						start_guest(va_reg, false.B)
					}.elsewhen(va_reg(63, 39) =/= Fill(25, va_reg(38))){
						page_fault()
					}.otherwise{
						s1_level := 2.U
						read_stage1(Cat(io.satp(43, 0), 0.U(12.W)) + (va_reg(38, 30) << 3.U))
					}
				}
			}
		}
		is(sStage1){
			next_state := sStage1
			io.tlb_request.addr := pte_addr(31, 0)
			io.tlb_request.valid := true.B
			when(!io.stall && io.cache_response.ready){
				when(!pte_in.V || (!pte_in.R && pte_in.W)){
					page_fault()
				}.elsewhen(!(pte_in.R || pte_in.X)){		// pointer to the next level
					when(s1_level === 0.U){
						page_fault()
					}.otherwise{
						val index = Mux(s1_level === 2.U, va_reg(29, 21), va_reg(20, 12))
						s1_level := s1_level - 1.U
						read_stage1(Cat(pte_in.ppn, 0.U(12.W)) + (index << 3.U))
					}
				}.otherwise{
					val permitted = PagePerm.stage1(pte_in.R, pte_in.W, pte_in.X, pte_in.U, pte_in.D,
						io.priv, io.sum, io.mxr, is_fetch, io.hlvx, io.wen)
					when(!aligned(pte_in.ppn, s1_level) || !permitted || !pte_in.A){
						page_fault()
					}.otherwise{
						val addr = compose(pte_in.ppn, s1_level, va_reg)
						s1_pte := pte_in
						s1_size := s1_level
						when(g_on){
							start_guest(addr, false.B)
						}.otherwise{
							final_pa := addr
							next_state := sData
						}
					}
				}
			}
		}
		is(sGuest){
			next_state := sGuest
			// Sv39x4: 41 address bits, the root table has 2048 entries
			val index = MuxLookup(g_level, g_addr(40, 30), Seq(
				1.U -> g_addr(29, 21),
				0.U -> g_addr(20, 12)
			))
			io.tlb_request.addr := (Cat(g_table, 0.U(12.W)) + (index << 3.U))(31, 0)
			io.tlb_request.valid := g_addr(63, 41) === 0.U
			when(!io.stall){
				when(g_addr(63, 41) =/= 0.U){
					guest_fault()
				}.elsewhen(io.cache_response.ready){
					when(!pte_in.V || (!pte_in.R && pte_in.W)){
						guest_fault()
					}.elsewhen(!(pte_in.R || pte_in.X)){
						when(g_level === 0.U){
							guest_fault()
						}.otherwise{
							g_table := pte_in.ppn
							g_level := g_level - 1.U
						}
					}.otherwise{
						// the page tables of the guest are read, nothing else
						val permitted = Mux(g_implicit, pte_in.R,
							PagePerm.guest(pte_in.R, pte_in.W, pte_in.X, pte_in.D, io.gmxr, is_fetch, io.hlvx, io.wen))
						val addr = compose(pte_in.ppn, g_level, g_addr)
						when(!aligned(pte_in.ppn, g_level) || !pte_in.U || !pte_in.A || !permitted){
							guest_fault()
						}.elsewhen(g_implicit){
							pte_addr := addr
							next_state := sStage1
						}.otherwise{
							g_pte := pte_in
							g_size := g_level
							final_pa := addr
							next_state := sData
						}
					}
				}
			}
		}
		is(sData){						// issue the translated memory access
			next_state := sData
			io.tlb_request.valid := true.B
			io.tlb_request.rw 	  := io.rw
			io.tlb_request.mask  := io.mask
			io.tlb_request.addr := final_pa(31, 0)
			io.fetch_request.addr := final_pa(31, 0)
			io.fetch_request.valid := true.B

			when(!io.stall && io.cache_response.ready){
				next_state := sIdle
				io.tlb_ready := true.B
				// only refill after a page walk; the next walk fills the next entry
				when(walked){
					val e = tlbe(victim.value)
					e.valid := true.B
					e.virt := io.virt
					e.vpn := va_reg(63, 12)
					e.ppn := final_pa(55, 12)
					e.size := Mux(s1_on && g_on, Mux(s1_size < g_size, s1_size, g_size),
								Mux(s1_on, s1_size, g_size))
					e.s1 := s1_on
					e.D := s1_pte.D
					e.U := s1_pte.U
					e.X := s1_pte.X
					e.W := s1_pte.W
					e.R := s1_pte.R
					e.g := g_on
					e.gD := g_pte.D
					e.gX := g_pte.X
					e.gW := g_pte.W
					e.gR := g_pte.R
					victim.inc()
				}
			}
		}
	}

	// the request was squashed (e.g. exception/redirect in the pipeline): abandon it.
	// the dTLB must release its stall so the (flushed) pipeline can move on;
	// the iTLB must NOT pulse ready, otherwise fetch would advance pc past the
	// redirect target without fetching it.
	when(!io.valid && tlb_state =/= sIdle && tlb_state =/= sFlush){
		next_state := sIdle
		if(tlb_name != "iTLB"){
			io.tlb_ready := true.B
		}
		io.fault := no_page_falut.asUInt
		io.fault_guest := false.B
		io.tlb_request.valid := false.B
	}

	tlb_state := next_state
}

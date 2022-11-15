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

	def fetchCheck(priv: UInt, page_is_user: Bool, sum: Bool) : Bool = {
		val priv_ok = WireDefault(false.B)
		switch(priv){
			is(CSR_MODE_U){
				priv_ok := page_is_user
			}

			is(CSR_MODE_S){
				priv_ok := sum && !page_is_user || !sum
			}

			is(CSR_MODE_M){
				priv_ok := true.B
			}
		}

		priv_ok && X 
	}

	def lsCheck(priv: UInt, page_is_user: Bool, sum: Bool, is_load: Bool, mxr: Bool) : Bool = {
		val priv_ok = WireDefault(false.B)
		switch(priv){
			is(CSR_MODE_U){
				priv_ok := page_is_user
			}

			is(CSR_MODE_S){
				priv_ok := sum && !page_is_user || !sum
			}

			is(CSR_MODE_M){
				priv_ok := true.B 
			}
		}

		priv_ok && ((is_load &&((R && !X)|| (mxr && (R || X)))) || (!is_load && W)) 
	}
}

class TLB extends Moudle{
	val io = IO(new Bundle{
		val satp = Input(UInt(64.WW))

	})

	val tlbe 	= RegInit(0.U.asTypeOf(Vec(16, TLBEntry)))
	val random 	= Counter(16)

}

class MMU extends Module{
	val io = IO(new Bundle{

	})

	val currentLevel = RegInit(3.U(2.W))
	val 
}

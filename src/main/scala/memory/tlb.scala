/*package myCPU

import chisel3._ 
import chisel3.util._ 

class TlbEntry extends Bundle{
	val ppn = UInt(44.W)
	val d	= Bool()			//dirty
	val a 	= Bool()			//access
	val g 	= Bool()			//global
	val u 	= Bool()			//user
	val x	= Bool()			//execute
	val w	= Bool()			//write
	val	r	= Bool()			//read
	val v	= Bool()
	val rsw = UInt(2.W)
}

class TLB(val size: Int) extends Module{
	val io = IO(new Bundle{
		val flush = Input(Bool())
		val wen   = Input(Bool())
		val vaddr = Input(UInt(64.W))
		val went  = Input(new TlbEntry)
		val valid = Output(Bool())
		val rent  = Output(new TlbEntry)
	})

	val width = 4												//16个TLB entry
	val valid = RegInit(VecInit(Seq.fill(size){false.B}))		//是否有效
	val data  = Mem(16, new Bundle{							
		val vpn = UInt(44.W)
		val entry = new TlbEntry
	})

	val pointer = RegInit(0.U(4.W))								//tlb指针
	val vpn		= io.vaddr(63, 12)								//虚页号

	when(io.flush){
		valid.foreach(v => v := false.B)						//刷新
	}.elsewhen(io.wen){
		valid(pointer)		:= true.B 							//将valid设置为true
		data(pointer).vpn 	:= io.went							//设置新的虚叶号
		pointer 			:= pointer + 1.U 					//指针移动到下一项
	}

	val found = WireInit(false.B)
	val entry = WrieInit(0.U.asTypeOf(new TlbEntry))
	for(i <- 0 until size){
		when(valid(i) && data(i).vpn === vpn){
			found := true.B 
			entry := data(i).entry
		}
	}

	io.valid := found
	io.rent  := entry
}*/
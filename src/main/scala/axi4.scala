package axi4

import chisel3._ 
import chisel3.util._ 

class AxiAddressBundle extends Bundle{
	val addr = UInt(32.W)
	val id = UInt(4.W)
	val len = UInt(8.W)
	val size = UInt(3.W)
	val burst = UInt(2.W)
}

object AxiAddressBundle{
	def apply(id: UInt, addr: UInt, size: UInt, len: UInt = 0.U): AxiAddressBundle = {
		val aw = Wire(new AxiAddressBundle)
		aw.id := id
		aw.addr := addr
		aw.len := len
		aw.size := size
		aw.burst := 1.U
		aw
	}
}

class AxiWriteDataBundle extends Bundle{
	val data = UInt(64.W)
	val strb = UInt(8.W)
	val last = Bool()
}

object AxiWriteDataBundle{
	def apply(data: UInt, strb: Option[UInt] = None, last: Bool = true.B): AxiWriteDataBundle = {
		val w = Wire(new AxiWriteDataBundle)
		w.strb := strb.getOrElse(Fill(8, 1.U))		//default is all 1
		w.data := data
		w.last := last
		w
	}
}

class AxiReadDataBundle extends Bundle{
	val id = UInt(4.W)
	val data = UInt(64.W)
	val resp = UInt(2.W)
	val last = Bool()
}

object AxiReadDataBundle{
	def apply(id: UInt, data: UInt, last: Bool = true.B, resp: UInt = 0.U): AxiReadDataBundle = {
		val r = Wire(new AxiReadDataBundle)
		r.id := id
		r.data := data
		r.last := last
		r.resp := resp
		r
	}
}

class AxiWriteResponseBundle extends Bundle{
	val resp = UInt(2.W)
	val id = UInt(4.W)
}

object AxiWriteResponseBundle{
	def apply(id: UInt, resp: UInt = 0.U): AxiWriteResponseBundle = {
		val b = Wire(new AxiWriteResponseBundle)
		b.id := id
		b.resp := resp
		b
	}
}

class Axi extends Bundle{
	val aw = Decoupled(new AxiAddressBundle)
	val w = Decoupled(new AxiWriteDataBundle)
	val b = Flipped(Decoupled(new AxiWriteResponseBundle))
	val ar = Decoupled(new AxiAddressBundle)
	val r = Flipped(Decoupled(new AxiReadDataBundle))
	/*write address channel*/
	/*
	val master_awready = Input(Bool())
	val master_awvalid = Output(Bool())
	val master_awaddr = Output(UInt(32.W))
	val master_awid = Output(UInt(4.W))
	val master_awlen = Output(UInt(8.W))
	val master_awsize = Output(UInt(3.W))
	val master_awburst = Output(UInt(2.W))
	*/

	/*write data channel*/
	/*
	val master_wready = Input(Bool())
	val master_wvalid = Output(Bool())
	val master_wdata = Output(UInt(64.W))
	val master_wstrb = Output(UInt(8.W))
	val master_wlast = Output(Bool())
	*/

	/*write response*/
	/*
	val master_bready = Output(Bool())
	val master_bvalid = Input(Bool())
	val master_bresp = Input(Bool())
	val master_bid = Output(UInt(4.W))
	*/

	/*read address channel*/
	/*
	val master_arready = Input(Bool())
	val master_arvalid = Output(Bool())
	val master_araddr = Output(UInt(32.W))
	val master_arid = Output(UInt(4.W))
	val master_arlen = Output(UInt(8.W))
	val master_arsize = Output(UInt(3.W))
	val master_arburst = Output(UInt(2.W))
	*/

	/*read data channel*/
	/*
	val master_rready = Output(Bool())
	val master_rvalid = Input(Bool())
	val master_rresp = Input(UInt(2.W))
	val master_rdata = Input(UInt(64.W))
	val master_rlast = Input(Bool())
	val master_rid = Input(UInt(4.W))
	*/
}
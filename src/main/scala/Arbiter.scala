package cacheArbiter 

import chisel3._ 
import chisel3.util._ 
import chisel3.experimental.ChiselEnum
import axi4._ 

class  ArbiterIO extends Bundle{
	val icache = Flipped(new Axi)
	val dcache = Flipped(new Axi)
	val axi_out = new Axi
}

object ArbiterState extends ChiselEnum {
	val sIdle, sICacheRead, sDCacheRead, sDCacheWrite, sIAddrRead, sDAddrRead, sDAddrWrite, sDCacheAck = Value
}

class CacheArbiter extends Module{

	val io = IO(new ArbiterIO)

	import ArbiterState._ 

	val state = RegInit(sIdle)

	//Write Address
	io.axi_out.aw.bits := io.dcache.aw.bits								//只有dcache会进行写操作
	io.axi_out.aw.valid := io.dcache.aw.valid && state === sDAddrWrite	//在sIdle状态收到dcache的写地址通道的valid，那么axi_out就会向外发出写地址通道的请求
	io.dcache.aw.ready := io.axi_out.aw.ready && state === sDAddrWrite	//dcache受到写地址通道ready响应来自axi写地址通道的ready，因为只有dcache能进行写
	io.icache.aw := DontCare											//icache不需要进行写

	//Write Data
	io.axi_out.w.bits := io.dcache.w.bits								//axi写数据通道的数据来自dcache写数据通道的数据
	io.axi_out.w.valid := io.dcache.w.valid && state === sDCacheWrite	//axi写数据通道的valid，并且写在的状态是sDCacheWrite
	io.dcache.w.ready := io.axi_out.w.ready && state === sDCacheWrite	//dcache写数据通道的ready信号来自axi_out的ready信号，并且现在的状态为sDCacheWrite
	io.icache.w := DontCare												//icache不需要进行写

	//WriteAck
	io.dcache.b.bits := io.axi_out.b.bits								//dcache的写响应通道数据来自axi_out的写响应通道数据
	io.dcache.b.valid := io.axi_out.b.valid && state === sDCacheAck		//dcache的写响应通道valid来自写响应通道valid， 现在的状态为sDCacheAck
	io.axi_out.b.ready := io.dcache.b.ready && state === sDCacheAck		//axi写响应的ready信号来自dcache并且现在的状态为sDCacheAck
	io.icache.b := DontCare												//icache不需要进行写

	//Read Address
	io.axi_out.ar.bits := AxiAddressBundle(										
		Mux(state === sDAddrRead, io.dcache.ar.bits.id, io.icache.ar.bits.id),		//dcache的读优先于icache，id
		Mux(state === sDAddrRead, io.dcache.ar.bits.addr, io.icache.ar.bits.addr),	//addr,指明要读写的地址
		Mux(state === sDAddrRead, io.dcache.ar.bits.size, io.icache.ar.bits.size),	//size，指令beats的大小
		Mux(state === sDAddrRead, io.dcache.ar.bits.len, io.icache.ar.bits.len)		//len，burst长度
	)
	io.axi_out.ar.valid := (io.icache.ar.valid || io.dcache.ar.valid) && (state === sIAddrRead || state === sDAddrRead)	   //读地址通道，只要icache或者dcache中的一个进行valid，并且现在没有进行些，同时要求现在的的状态为valid即现在没有其他的事务 
	io.dcache.ar.ready := io.axi_out.ar.ready && (state === sDAddrRead) 	//dcache的读地址通道的ready，现在没有进行写地址通道，状态为sIdle即没有进行其他的事务
	io.icache.ar.ready := io.axi_out.ar.ready && (state === sIAddrRead)		//dcache的读优先于icache

	//Read Data
	io.icache.r.bits := io.axi_out.r.bits									//icache读的数据来自axi_out
	io.dcache.r.bits := io.axi_out.r.bits									//dcache读的数据来自axi_out
	io.icache.r.valid := io.axi_out.r.valid && state === sICacheRead		//icache读数据的valid来自axi_out, 同时对于现在的状态要求是sICacheRead
	io.dcache.r.valid := io.axi_out.r.valid && state === sDCacheRead		//dcache读数据的valid来自axi_out, 同时对于现在的状态要求是sDCacheRead
	io.axi_out.r.ready := (io.icache.r.ready && state === sICacheRead) ||		//对于axi_out的valid，发出ready响应，这个信号要求现在I或者Dcache的状态为Read并且是拉高了ready响应信号
		(io.dcache.r.ready && state === sDCacheRead)


	//printf(p"addr:${Hexadecimal(io.icache.ar.bits.addr)}; id:${io.icache.ar.bits.id}; len:${io.icache.ar.bits.len}; size:${io.icache.ar.bits.size}; burst:${io.icache.ar.bits.burst}\n")
	//axi状态机，根据地址通道上的ready-valid握手进行判断要转向哪个事务, 如何抬高信号的时间
	switch(state){
		is(sIdle){
			when(io.dcache.aw.valid){
				state := sDAddrWrite
//				io.axi_out.aw.valid := true.B
			}.elsewhen(io.dcache.ar.valid){
				state := sDAddrRead
//				io.axi_out.ar.valid := true.B
			}.elsewhen(io.icache.ar.valid){
				state := sIAddrRead
//				io.axi_out.ar.valid := true.B
			}
			/*
			when(io.dcache.aw.fire){
				state := sDCacheWrite
			}.elsewhen(io.dcache.ar.fire){
				state := sDCacheRead
			}.elsewhen(io.icache.ar.fire){
				state := sICacheRead
			}*/
		}
		is(sIAddrRead){
			when(io.icache.ar.fire){
				state := sICacheRead
			}
		}
		is(sDAddrRead){
			when(io.dcache.ar.fire){
				state := sDCacheRead
			}
		}
		is(sDAddrWrite){
			when(io.dcache.aw.fire){
				state := sDCacheWrite
			}
		}
		is(sICacheRead){
			when(io.axi_out.r.fire && io.axi_out.r.bits.last){
				state := sIdle
//				printf("Read over\n\n\n\n")
			}
		}
		is(sDCacheRead){
			when(io.axi_out.r.fire && io.axi_out.r.bits.last){
				state := sIdle
			}
		}
		is(sDCacheWrite){
			when(io.dcache.w.fire && io.dcache.w.bits.last){
				state := sDCacheAck
			}
		}
		is(sDCacheAck){
			when(io.axi_out.b.fire){
				state := sIdle
			}
		}
	}
}
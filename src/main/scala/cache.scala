/*
package test
import chisel3._
import chisel3.util._
import chisel3.experimental._
import chisel3.experimental.BundleLiterals._
import chisel3.stage.ChiselStage

class TypeConvertDemo extends Module {
  val io = IO( new Bundle{
      val in = Input(UInt(4.W))
      val out = Output(UInt(4.W))
  })
  io.out := io.in

  printf(s"${io.getWidth}")
}


object  Drvier extends App{
	(new ChiselStage).emitVerilog(new TypeConvertDemo, args)
}
*/
/*cache要改为适合总线的格式，最后要输出last用于给总线进行判断*/

package cache

import chisel3._ 
import chisel3.experimental.ChiselEnum
import chisel3.stage.ChiselStage
import axi4._ 
import chisel3.util._ 

class CacheReq extends Bundle{
	val index = UInt(3.W)
	val write_index = UInt(3.W)
	val we = Bool()
}

class CacheTag extends Bundle{
	val valid = Bool()
	val dirty = Bool()
	val visit = UInt(8.W)
	val tag = UInt(22.W)				//ysyx的物理地址只有32位
}

class CacheData extends Bundle{
	val data = UInt(1024.W)
}

class CPU_Request extends Bundle{
	val addr = UInt(32.W)
	val data = UInt(64.W)
	val mask = UInt(8.W)
	val rw = Bool()
	val valid = Bool()
}

class CPU_Response extends Bundle{
	val data = UInt(64.W)
	val ready = Bool()
//	val replay = Bool()
}

/*
class Mem_Request extends Bundle{
	val addr = UInt(32.W)				//ysyx的物理地址只有32位
	val data = UInt(64.W)
	val mask = UInt(8.W)
	val rw = Bool()
	val valid = Bool()
}

class Mem_Response extends Bundle{
	val data = UInt(64.W)
	val ready = Bool()
}*/

object CacheState extends ChiselEnum{
	val sIdle, sUnCacheReadAddr, sUnCacheWriteAddr, sUnCacheReadData, sUnCacheWriteData, sUnCacheWriteAck, sReMatch, sMatch, sWriteback, sRefill, sReadAddr, sWriteAddr, sWriteAck = Value
}

class tag_cache extends Module{
	val io = IO(new Bundle{
		val cache_req = Input(new CacheReq)
		val tag_write = Input(new CacheTag)
		val tag_read = Output(new CacheTag)
	})


	//printf(p"tag_read_this_cycle_index: ${io.cache_req.index}\n")
	val tag_mem = Reg(Vec(8, new CacheTag))
	//io.tag_read := tag_mem(io.cache_req.index)
	io.tag_read := tag_mem(io.cache_req.index)
	//printf(p"tag_read_this_cycle_data: tag:${Hexadecimal(io.tag_read.tag)}; valid:${io.tag_read.valid}\n")
	when(io.cache_req.we){
		//printf(p"tag index: ${io.cache_req.index}\n")
		tag_mem(io.cache_req.index) := io.tag_write
		//tag_mem.write(io.cache_req.index, io.tag_write)
		//for(i <- 0 until 8){
		//	printf(p"${i};  tag:${tag_mem(i).tag}; valid:${tag_mem(i).valid}; visit:${tag_mem(i).visit}; \n")
		//}

	}
}

class data_cache extends Module{
	val io = IO(new Bundle{
		val cache_req = Input(new CacheReq)
		val data_write = Input(new CacheData)
		val data_read = Output(new CacheData)
	})

	val data_mem = SyncReadMem(8, new CacheData)
	val wDataReg = RegNext(io.data_write)
	val doForwardReg = RegNext((io.cache_req.write_index === io.cache_req.index) && io.cache_req.we)
	//val pre_index = RegInit(0.U(3.W))
	//val pre_data = UInt(UInt(1024.W))
	val readData = data_mem.read(io.cache_req.index, true.B)
	io.data_read := Mux(doForwardReg, wDataReg, readData)	
	//io.data_read := data_mem(io.cache_req.index)
	//for(j <- 0 until 8){
	//	printf(p"${Hexadecimal{data_mem(j).data}}\n")
	//}
	//printf("\n")

	when(io.cache_req.we){
		//printf(p"data index: ${io.cache_req.index}\n")
		//data_mem(io.cache_req.index) := io.data_write
		//pre_index := io.cache_req.write_index
		//pre_data := io.data_write
		data_mem.write(io.cache_req.write_index, io.data_write)
		//data_mem.write(io.cache_req.index, io.data_write)
		//printf(p"we: ${io.cache_req.we}; index: ${io.cache_req.index};  write_data: ${Hexadecimal(io.data_write.asUInt)}\n")
		//for(i <- 0 until 8){
		//	printf(p"${i}:\n")
		//	for(j <- 0 until 16){
		//		printf(p"${j}; data:${Hexadecimal(data_mem(i).data((j+1)*64 - 1, j*64))};\n")
		//	}
		//	printf("\n")
		//}
	}
	//for(i <- 0 until 32){
	//	printf(p"data:${Hexadecimal(((data_mem.read(io.cache_req.index)).asUInt)(32*(i+1)-1, 32*i))}\n")
	//}
	//printf("\n")
}

import CacheState._

class Cache(cache_name: String) extends Module{
	val io = IO(new Bundle{
		val cpu_request = Input(new CPU_Request)
		val cpu_response = Output(new CPU_Response)
		//val index = Input(UInt(3.W))
		//val tag = Input(UInt(22.W))
		//val mem_response = Input(new Mem_Response)
		//val mem_request = Output(new Mem_Request)
		val mem_io = new Axi
	})
	//printf(p"${cache_name}\n")
	val bitWidth = 64							//总线上一次传输的宽度
	val addr_len = 32							//地址的宽度
	val blockSize = 128 						//128Bytes
	val word_len = 64							//寄存器宽度
	val nWays = 4								//一个cache组内有几个cache块
	val nSets = 8								//每个set内共几个cacheline
	val groupId_len = log2Ceil(nSets)			//组号要用几位进行表示
	val blockSize_len = log2Ceil(blockSize)		//一个cache块用几位去表示
	val tag_len = addr_len - groupId_len - blockSize_len	//tag长度	
	val data_beats = blockSize / (bitWidth/8)	//一个cache块需要总线的几次传输

	val cache_state = RegInit(sIdle)				//初始状态为Idle
//	val block_buffer = RegInit(0.U(blockSize.W))	由于如果使用block_buffer，将在传输到cache模宽的数据再花费数个周期进行到sram的传输，所以放弃了使用 
	val tag_mem = Seq.fill(nWays)(Module(new tag_cache))	//4个tag_mem, 每一个对应于1个data_mem
	val data_mem = Seq.fill(nWays)(Module(new data_cache))	//4个data_mem, 每一个对应于1个tag_mem

	val fill_block_en = WireInit(false.B)			//计数器使能
	val (index, last) = Counter(fill_block_en, data_beats)	//计数器，index用于计数，last是计数完成的信号

	val index_reg = RegInit(0.U)					//用于index计数
	val next_state = WireInit(sIdle)				//用于更新cache_state
	val replace = RegInit(0.U(2.W))					//记录进行替换或者填入的cache块
	val refill_addr = RegInit(0.U(32.W))			//进行填充的cache块的首地址

	val writeback_addr = RegInit(0.U(32.W))			//进行写回的cache块的首地址

	cache_state := next_state
	//cache_state.foreach(printf(p"${_.asUInt}"))

	val cpu_request_addr_reg = RegInit(0.U(addr_len.W))
	val cpu_request_data = RegInit(0.U(64.W))
	val cpu_request_mask = RegInit(0.U(8.W))
	val cpu_request_rw = RegInit(false.B)
	val cpu_request_valid = RegInit(false.B)
	//val replay_reg = WireInit(false.B)

	//printf(p"addr:${Cat(io.cpu_request.addr(addr_len - 1, 3), 0.U(3.W))}\n")
	cpu_request_addr_reg := Cat(io.cpu_request.addr(addr_len - 1, 3), 0.U(3.W))		//cpu访存地址
	cpu_request_data := io.cpu_request.data
	cpu_request_mask := io.cpu_request.mask
	cpu_request_rw := io.cpu_request.rw
	cpu_request_valid := io.cpu_request.valid

	//io.cpu_response.replay := replay_reg
	//printf(p"request_valid:${io.cpu_request.valid}\n")

	val cpu_request_addr_index = cpu_request_addr_reg(blockSize_len + groupId_len - 1, blockSize_len)	//cache的index号                                  //RegInit(0.U(groupId_len.W))		//寄存器暂存地址中的index,下面是一个tag，用于切断环路
	val cpu_request_addr_tag = cpu_request_addr_reg(addr_len - 1, blockSize_len + groupId_len)			//cache的tag                                      //RegInit(0.U(tag_len.W))	
//	val return_buf = RegInit(0.U(1024.W))
//	val replay = RegInit(false.B)

	//变量外题
	val is_match = VecInit(Seq.fill(4)(false.B))
	val part = VecInit(Seq.fill(8)(0.U(64.W)))							
	val result = WireInit(0.U(64.W))//part.reduce(_|_)
	//val cache_data = VecInit.tabulate(16){ k => data_mem(i).io.data_read.data((k+1)*word_len - 1, k*word_len)}
	val cache_data = VecInit(Seq.fill(16)(0.U(64.W)))
	val reMatch_addr = RegInit(0.U(64.W))

	//printf(p"${Hexadecimal(io.cpu_request.addr)}\n")
	//cpu_request_addr_index := io.cpu_request.addr(blockSize_len + groupId_len - 1, blockSize_len)	
	//cpu_request_addr_tag := io.cpu_request.addr(addr_len - 1, blockSize_len + groupId_len)			

	//printf(p"addr_tag:${Hexadecimal(cpu_request_addr_tag)}; addr_index:${Hexadecimal(cpu_request_addr_index)}\n")
	//printf(p"cpu_request_addr_reg: ${Hexadecimal(cpu_request_addr_reg)}; io.cpu_request_addr:${Hexadecimal(io.cpu_request.addr)}\n")
	
	//is_match := tag_mem.map{k => ((k.io.tag_read.tag === cpu_request_addr_tag)) && (k.io.tag_read.valid)}

	//val is_match_pre = tag_mem.map(k => ((k.io.tag_read.tag === io.cpu_request.addr(addr_len - 1, blockSize_len + groupId_len))))
	//for(i <- 0 until nWays){
	//	when(is_match_pre(i)){
	//		for(j <- 0 until 8){
			//part(j) := Mux(io.cpu_request.mask(j), io.cpu_request.data((j+1)*8-1, j*8) << (j*8), data_mem(i).io.data_read.data((j+1)*8 - 1, j * 8) << (j * 8))
			//(VecInit.tabulate(16){k => io.cpu_request.data((k+1)*word_len - 1, k*word_len)}(cpu_request_addr_reg(blockSize_len-1, log2Ceil(word_len/8))((j+1)*8-1, j*8)) << (j*8))
	//			part(j) := Mux(io.cpu_request.mask(j), io.cpu_request.data((j+1)*8 - 1, j*8) << (j*8), 0.U(64.W))
	//		}
	//	}
	//}
	//result := part.reduce(_|_)

	//val stall_ready_check = RegInit(false.B)
	//val stall = io.cpu_request.valid && ~io.cpu_response.ready
	//stall_ready_check := stall
	//io.cpu_response.replay := stall_ready_check && ~stall

	for(i <- 0 until nWays){
		tag_mem(i).io.cache_req.index := cpu_request_addr_index//io.cpu_request.addr(blockSize_len + groupId_len - 1, blockSize_len)															//每个周期输入地址index
		tag_mem(i).io.cache_req.write_index := 0.U//io.cpu_request.addr(blockSize_len + groupId_len - 1, blockSize_len)
		//data_mem(i).io.cache_req.index := Mux(stall_ready_check && ~stall, cpu_request_addr_index, io.cpu_request.addr(blockSize_len + groupId_len - 1, blockSize_len))														//每个周期输入地址index
		data_mem(i).io.cache_req.index := io.cpu_request.addr(blockSize_len + groupId_len - 1, blockSize_len)
		data_mem(i).io.cache_req.write_index := cpu_request_addr_index
		//tag_mem(i).io.cache_req.index := io.cpu_request.addr(blockSize_len + groupId_len - 1, blockSize_len)			//输入要访问的cache块的tag号
		//data_mem(i).io.cache_req.index := io.cpu_request.addr(blockSize_len + groupId_len - 1, blockSize_len)			
		tag_mem(i).io.cache_req.we := false.B																			//tag_mem, 因为使用的是最近最少访问算法，所以如果每一次命中至少会更新visit位   //tag每次都要更新，因为使用的是最近最少访问算法
		data_mem(i).io.cache_req.we := false.B//is_match_pre(i) && io.cpu_request.rw
		tag_mem(i).io.tag_write := tag_mem(i).io.tag_read																//tag_write, 默认写的是原来的数据，即没有修改
		data_mem(i).io.data_write := data_mem(i).io.data_read															//data_mem, 默认是不用进行修改, Mux(is_match_pre(i), )
	}
	
	//printf(p"addr_tag:${io.cpu_request}\n")
	
	
	//for(i <- 0 until nWays){
	//		printf(p"tag:${tag_mem(i).io.tag_read.tag};\n")
	//		printf(p"valid:${tag_mem(i).io.tag_read.valid};\n")
	//		printf(p"dirty:${tag_mem(i).io.tag_read.dirty}\n")
	//}

	//printf("\n\n");
	

	//val data_read = Mux(io.cpu_request.addr(blockSize_len - 1, 0), )
	
	//init
	io.cpu_response.ready := false.B																	//ready默认是false
	io.cpu_response.data := 0.U																			//data默认是0
	//io.mem_request.valid := false.B
	//io.mem_request.rw := false.B
	//io.mem_request.addr := 0.U
	//io.mem_request.data := 0.U

	io.mem_io.aw.valid := false.B																		//默认不进行访存
	io.mem_io.aw.bits.addr := cpu_request_addr_reg //io.cpu_request.addr(31, 0)							//mem地址
	io.mem_io.aw.bits.len := 15.U																		//突发传送长度为16
	io.mem_io.aw.bits.size := 6.U																		//一次传输的宽度为64
	io.mem_io.aw.bits.burst := 1.U 																		//incr burst模式
	io.mem_io.aw.bits.id := 0.U																			//id，这里不使用

	io.mem_io.ar.valid := false.B
	io.mem_io.ar.bits.addr := cpu_request_addr_reg //io.cpu_request.addr(31, 0)
	io.mem_io.ar.bits.len := 15.U
	io.mem_io.ar.bits.size := 6.U
	io.mem_io.ar.bits.burst := 1.U
	io.mem_io.ar.bits.id := 0.U

	io.mem_io.w.valid := false.B
	io.mem_io.w.bits.strb := "b11111111".U
	io.mem_io.w.bits.data := 0.U
	io.mem_io.w.bits.last := last

	io.mem_io.r.ready := false.B

	io.mem_io.b.ready := false.B

	
	//printf(p"mem_io.ar.bits.addr:${io.mem_io.ar.bits.addr}\n\n")
	//printf(p"\n\nrefill_addr:${Hexadecimal(refill_addr)}\n\n")

	/*
	for(j <- 0 until 4){
		printf(p"num:${j}; cache_data:${Hexadecimal(data_mem(j).io.data_read.data)}\n")
	}*/
	//printf(p"State: ${cache_state}\n")
	//val is_match = RegInit(VecInit(Seq.fill(nWays)(false.B)))											
	//is_match := tag_mem.map{k => ((k.io.tag_read.tag === cpu_request_addr_tag) && (k.io.tag_read.valid))}
	//val tmp_tag_reg = RegNext(cpu_request_addr_tag)
	//val cpu_response_ready = RegInit(false.B)
	//io.cpu_response.ready := cpu_response_ready
	//val 
	//if(cache_)
	//printf(p"${cache_name}\n")
	val response_data = WireInit(0.U(1024.W))
	val max = WireInit(0.U(log2Ceil(nWays).W))
	val visit = VecInit(Seq.fill(4)(0.U(8.W)))//tag_mem.map{k => k.io.tag_read.visit}
	val compare_1_0 = WireInit(false.B)//visit(1) > visit(0)
	val compare_2_3 = WireInit(false.B)//visit(3) > visit(2)
	val max_01_or_23 = WireInit(false.B)//Mux(compare_2_3, visit(3), visit(2)) > Mux(compare_1_0, visit(1), visit(0))				

	switch(cache_state){
		is(sIdle){
			//if(cache_name == "inst_cache"){
			//printf("sIdle\n")}
			when(io.cpu_request.valid && io.cpu_request.addr >= "h80000000".U && io.cpu_request.addr <= "h88000000".U){
				next_state := sMatch
				//printf("Yes\n")
				//is_match := tag_mem.map{k => ((k.io.tag_read.tag === cpu_request_addr_tag) && (k.io.tag_read.valid))}
			}.elsewhen(io.cpu_request.valid){
				when(io.cpu_request.rw){
					next_state := sUnCacheWriteAddr
				}.otherwise{
					next_state := sUnCacheReadAddr
				}
			}.otherwise{
				next_state := sIdle
			}
		}
		is(sUnCacheReadAddr){																						//有的外设不支持突发传送
			//printf(p"${cache_name}\n")
			//printf("UnCacheReadAddr\n")
			io.mem_io.ar.valid := true.B
			io.mem_io.ar.bits.len := 0.U
			next_state := sUnCacheReadAddr
			io.mem_io.ar.bits.addr := cpu_request_addr_reg
			when(io.mem_io.ar.ready){
				//printf(p"UnCacheReadData\n")
				next_state := sUnCacheReadData
			}
		}
		is(sUnCacheWriteAddr){
			//printf(p"UnCacheWriteAddr: ${cpu_request_addr_reg}\n")
			io.mem_io.aw.valid := true.B
			io.mem_io.aw.bits.len := 0.U
			//io.mem_io.aw.bits.strb := cpu_request_mask 
			next_state := sUnCacheWriteAddr
			io.mem_io.aw.bits.addr := cpu_request_addr_reg
			when(io.mem_io.aw.ready){
				next_state := sUnCacheWriteData
			}
		}
		is(sUnCacheReadData){
			//printf("UnCacheReadData\n")
			//io.cpu_response.ready := true.B 
			io.cpu_response.data := io.mem_io.r.bits.data
			io.mem_io.r.ready := true.B
			when(io.mem_io.r.valid){
				next_state := sIdle
				io.cpu_response.ready := true.B
			}.otherwise{
				next_state := sUnCacheReadData
			}			
		}
		is(sUnCacheWriteData){
			//printf("UnCacheWriteData\n")
			io.mem_io.w.valid := true.B
			//io.mem_io.w 
			io.mem_io.w.bits.last := true.B
			io.mem_io.w.bits.data := cpu_request_data
			io.mem_io.w.bits.strb := cpu_request_mask
			when(io.mem_io.w.ready){
				next_state := sUnCacheWriteAck
			}.otherwise{
				next_state := sUnCacheWriteData
			}		
		}
		is(sUnCacheWriteAck){
			//printf("UnCacheWriteAck\n")
			io.mem_io.b.ready := true.B
			when(io.mem_io.b.valid){
				io.cpu_response.ready := true.B
				next_state := sIdle
			}.otherwise{
				next_state := sUnCacheWriteAck
			}
		}
		is(sMatch){
			//printf("sMatch\n");
			for(i <- 0 until nWays){
				tag_mem(i).io.cache_req.index := cpu_request_addr_index
			}

			val is_match = tag_mem.map{k => ((k.io.tag_read.tag === cpu_request_addr_tag)) && (k.io.tag_read.valid)}
			//printf(p"cpu_request_addr_tag: ${cpu_request_addr_tag}\n")
			//for(i <- 0 until 4){
			//	printf(p"${tag_mem(i).io.tag_read}\n")
			//}
			//is_match := tag_mem.map{k => (k.io.tag_read.tag === io.cpu_request.addr(addr_len - 1, blockSize_len + groupId_len)) && (k.io.tag_read.valid)}
			//printf(p"addr: ${Hexadecimal(cpu_request_addr_reg)}\n")
			//for(i <- 0 until nWays){
			//	printf(p"${Hexadecimal(tag_mem(i).io.tag_read.tag)};")
			//	printf(p"${tag_mem(i).io.tag_read.valid}\n")
			//}


			when(is_match.reduce(_|_)){
				//printf("Match\n");
				//val cpu_response_data = RegInit(0.U(64.W))
				//io.cpu_response.data := cpu_response_data
				io.cpu_response.ready := true.B
				//io.cpu_response.data := MuxCase(data_mem(3).io.data_read.data, Array(is_match(0) -> data_mem(0).io.data_read.data, is_match(1) -> data_mem(1).io.data_read.data, is_match(2) -> data_mem(2).io.data_read.data))
				io.cpu_response.data := MuxCase(VecInit.tabulate(16){k => data_mem(3).io.data_read.data((k+1)*word_len - 1, k*word_len)}(cpu_request_addr_reg(blockSize_len-1, log2Ceil(word_len/8))), 
												Array(is_match(0) -> VecInit.tabulate(16){k => data_mem(0).io.data_read.data((k+1)*word_len - 1, k*word_len)}(cpu_request_addr_reg(blockSize_len-1, log2Ceil(word_len/8))), 
													is_match(1) -> VecInit.tabulate(16){k => data_mem(1).io.data_read.data((k+1)*word_len - 1, k*word_len)}(cpu_request_addr_reg(blockSize_len-1, log2Ceil(word_len/8))), 
													is_match(2) -> VecInit.tabulate(16){k => data_mem(2).io.data_read.data((k+1)*word_len - 1, k*word_len)}(cpu_request_addr_reg(blockSize_len-1, log2Ceil(word_len/8)))
													)
												)	
				
//				printf(p"index:${cpu_request_addr_index}\n")
//				for(i <- 0 until 4){
//					printf(p"is match ${i}: ${is_match(i)}; tag: ${Hexadecimal(tag_mem(i).io.tag_read.tag)}\n")
//				}
				//when(!cpu_request_rw){
				//printf(p"request_addr: ${Hexadecimal(io.cpu_request.addr)}\n")
				//printf(p"request_addr_reg: ${Hexadecimal(cpu_request_addr_reg)}\n")
				//printf(p"response_data:${Hexadecimal(io.cpu_response.data)}\n")
				//}
//				printf(p"1 ${Hexadecimal(data_mem(1).io.data_read.data(63, 0))}\n")
//				printf(p"2 ${Hexadecimal(data_mem(2).io.data_read.data(63,0))}\n")
//				printf(p"3 ${Hexadecimal(data_mem(3).io.data_read.data(63,0))}\n")
//				printf(p"0 ${Hexadecimal(data_mem(0).io.data_read.data(63,0))}\n")
				

				for(i <- 0 until nWays){
					tag_mem(i).io.tag_write.dirty := tag_mem(i).io.tag_read.dirty
					tag_mem(i).io.tag_write.tag := tag_mem(i).io.tag_read.tag
					when(is_match(i)){
						tag_mem(i).io.cache_req.we := true.B				//写tag使能
						tag_mem(i).io.tag_write.visit := 0.U 				//将visit重置
						tag_mem(i).io.tag_write.valid := true.B
						//tag_mem(i).io.tag_write.dirty := tag_mem(i).io.tag_read.dirty
						//tag_mem(i).io.tag_write.tag := tag_mem(i).io.tag_read.tag
						when(cpu_request_rw){
							tag_mem(i).io.tag_write.dirty := true.B
						}
					}.elsewhen(tag_mem(i).io.tag_read.valid){
						tag_mem(i).io.cache_req.we := true.B				//写tag使能
						tag_mem(i).io.tag_write.visit := Mux((~tag_mem(i).io.tag_read.visit) === 0.U, tag_mem(i).io.tag_read.visit, tag_mem(i).io.tag_read.visit + 1.U) 
						tag_mem(i).io.tag_write.valid := tag_mem(i).io.tag_read.valid
					}
				}

				//printf("Hit\n")
				//printf("Here 2\n")
				when(cpu_request_rw){
					for(i <- 0 until nWays){
						when(is_match(i)){
							//printf(p"cpu_request_addr: ${cpu_request_addr_reg}\n")
							data_mem(i).io.cache_req.we := true.B					//写数据使能
							//data_mem(i).io.cache_req.index := cpu_request_addr_index
							//tag_mem(i).io.cache_req.we := true.B
							//tag_mem(i).io.tag_write.valid := true.B					//tag的valid设置为1
							//tag_mem(i).io.tag_write.dirty := true.B					//tag的dirty设置为1
							//tag_mem(i).io.tag_write.tag := tag_mem(i).io.tag_read.tag		//io.cpu_request.addr(addr_len - 1, blockSize_len + groupId_len)	//写的tag在请求的地址位中
							response_data := data_mem(i).io.data_read.data
							//part := Wire(Vec(8, UInt(64.W)))							
							for(j <- 0 until 8){
								//part(j) := Mux(io.cpu_request.mask(j), io.cpu_request.data((j+1)*8-1, j*8) << (j*8), data_mem(i).io.data_read.data((j+1)*8 - 1, j * 8) << (j * 8))
								//(VecInit.tabulate(16){k => io.cpu_request.data((k+1)*word_len - 1, k*word_len)}(cpu_request_addr_reg(blockSize_len-1, log2Ceil(word_len/8))((j+1)*8-1, j*8)) << (j*8))
								part(j) := Mux(cpu_request_mask(j), cpu_request_data((j+1)*8 - 1, j*8) << (j*8),
												(VecInit.tabulate(16){k => response_data((k+1)*word_len - 1, k*word_len)}(cpu_request_addr_reg(blockSize_len - 1, log2Ceil(word_len/8)))((j+1)*8-1, j*8)) << (j*8)
											)
							}

							//val result = part(0) | part(1) | part(2) | part(3) | part(4) | part(5) | part(6) | part(7)

							//data_mem(i).io.data_write.data := Mux(io.cpu_request.addr(blockSize_len - 1, 0) === 0.U, Cat(part.reduce(_ | _), data_mem(i).io.data_read.data(word_len-1, 0)), Cat(data_mem(i).io.data_read.data(blockSize - 1, word_len), part.reduce(_ | _)))
							result := part.reduce(_|_)
							//printf(p"result: ${Hexadecimal(result)}\n")
							cache_data :=  VecInit.tabulate(16){k => data_mem(i).io.data_read.data((k+1)*word_len - 1, k*word_len)}
							cache_data(cpu_request_addr_reg(blockSize_len - 1, log2Ceil(word_len/8))) := result
							//printf(p"mask: ${Hexadecimal(cpu_request_mask)}\n")
							//printf(p"cache_data: ${Hexadecimal(cache_data.asUInt)}; result:${Hexadecimal(result)}\n")
							data_mem(i).io.data_write.data := cache_data.asUInt//data_mem(i).io.data_read
						}
					}
				}
				
				when(io.cpu_request.valid && io.cpu_request.addr >= "h80000000".U && io.cpu_request.addr <= "h88000000".U){
					next_state := sMatch
				}.otherwise{
					next_state := sIdle
				}

				//replay_reg := false.B
				//printf("Here 3\n")

			}.otherwise{
				//下面使用使用LRU替换算法找出age最大的cacheline进行替换
				//printf("unMatch\n");
				//val refill_addr_2 = RegInit(0.U(32.W))
				//val cpu_tmp_addr_reg = RegNext(cpu_request_addr_reg)
				//printf(p"request_addr: ${Hexadecimal(io.cpu_request.addr)}\n")
				//printf(p"request_addr_reg: ${Hexadecimal(cpu_request_addr_reg)}\n")

				//max := WireInit(0.U(log2Ceil(nWays).W))

				when(tag_mem.map{k => k.io.tag_read.valid}.reduceLeft(_&_)){
					//printf("replace\n")
					visit := tag_mem.map{k => k.io.tag_read.visit}
					compare_1_0 := visit(1) > visit(0)
					compare_2_3 := visit(3) > visit(2)
					max_01_or_23 := Mux(compare_2_3, visit(3), visit(2)) > Mux(compare_1_0, visit(1), visit(0))				
					max := Cat(max_01_or_23, Mux(max_01_or_23, compare_2_3, compare_1_0))
					replace := max
					//for(i <- 0 until 4){
					//	printf(p"tag_visit:${tag_mem(i).io.tag_read.visit}\n")
					//}
					//printf(p"max:${max}\n")
					
				}.otherwise{
					//for(i <- 0 until nWays){
					max := MuxCase(0.U, Array((tag_mem(1).io.tag_read.valid === 0.U) -> 1.U, (tag_mem(2).io.tag_read.valid === 0.U) -> 2.U, (tag_mem(3).io.tag_read.valid === 0.U) -> 3.U))
					//printf(p"max: ${max}\n")
					replace := max
					//}
				}
				//printf(p"clock:${clock.asUInt}\n")
				//printf(p"0: ${tag_mem(0).io.tag_read.valid}; 1:${tag_mem(1).io.tag_read.valid}; 2: ${tag_mem(2).io.tag_read.valid} 3: ${tag_mem(3).io.tag_read.valid} tag:${cpu_request_addr_tag}\n")
				//printf(p"max:${max}\n")
				//val refill_addr_2 = Reg(UInt(32.W))
				//refill_addr_2 := 0.U
				//refill_addr_2 := cpu_request_addr_reg
				refill_addr := Cat(cpu_request_addr_reg(addr_len - 1, blockSize_len), 0.U(blockSize_len.W))
				//printf(p"cpu_request_addr_reg: ${Hexadecimal(cpu_request_addr_reg)}\n")
				//printf(p"refill_addr: ${Hexadecimal(refill_addr)}\n")
				//printf(p"addr2:${refill_addr_2}\n")
				for(i <- 0 until nWays){
					when(i.U === max){
						//printf(p"max:${i}\n")
						tag_mem(i).io.cache_req.we := true.B
						tag_mem(i).io.tag_write.valid := true.B
						tag_mem(i).io.tag_write.dirty := cpu_request_rw
						tag_mem(i).io.tag_write.tag := cpu_request_addr_tag//io.cpu_request.addr(addr_len - 1, blockSize_len + groupId_len)
						//printf(p"cpu_request_addr_tag:${Hexadecimal(tag_mem(i).io.tag_write.tag)}\n")

						tag_mem(i).io.tag_write.visit := 0.U

						//io.mem_request.addr := io.cpu_request.addr
						//io.mem_request.valid := true.B
						//refill_addr := cpu_request_addr_reg
						//refill_addr_2 := cpu_request_addr_reg
						//printf(p"refill_addr: ${Hexadecimal(refill_addr)};\n")
						//printf(p"addr:${Hexadecimal(cpu_request_addr_reg)}\n")
						when((!tag_mem(i).io.tag_read.valid) || (!tag_mem(i).io.tag_read.dirty)){
							next_state := sReadAddr//sRefill
						}.otherwise{
							//io.mem_request.addr := io.cpu_request.addr
							//io.mem_request.rw := true.B
							//io.mem_request.data := 
							writeback_addr := Cat(tag_mem(i).io.tag_read.tag, cpu_request_addr_index, 0.U(blockSize_len.W)) 
							next_state := sWriteAddr//sWriteback	
						}
					}
				}

				for(i <- 0 until nWays){
					when((i.U =/= max) && tag_mem(i).io.tag_read.valid){
						//printf("I am here")
						tag_mem(i).io.cache_req.we := true.B
						tag_mem(i).io.tag_write.valid := true.B
						tag_mem(i).io.tag_write.dirty := tag_mem(i).io.tag_read.dirty
						tag_mem(i).io.tag_write.visit := Mux((~tag_mem(i).io.tag_read.visit) === 0.U, tag_mem(i).io.tag_read.visit, tag_mem(i).io.tag_read.visit + 1.U) 
						tag_mem(i).io.tag_write.tag := tag_mem(i).io.tag_read.tag
					}
				}
			}
			//如果为命中需要进行清零操作，如果未命中需要进行加1操作
			
		} 
		is(sReadAddr){
			//printf("sReadAddr\n")
			io.mem_io.ar.valid := true.B
			io.mem_io.ar.bits.len := 15.U
			next_state := sReadAddr
			io.mem_io.ar.bits.addr := refill_addr

			//printf(p"cache_name:${cache_name}; refill_addr: ${Hexadecimal(refill_addr)}\n")
			when(io.mem_io.ar.ready){
				next_state := sRefill
			}
		}
		is(sRefill){
			//printf("sRefill\n")
			//index := 0.U
			//fill_block_en : =true.B
			index_reg := index
			io.mem_io.r.ready := true.B
			next_state := sRefill
			when(io.mem_io.r.valid){
				for(i <- 0 until nWays){
					when(i.U === replace){
						//printf(p"${i.U}\n")
						cache_data := VecInit.tabulate(16){k => data_mem(i).io.data_read.data((k+1)*word_len - 1, k*word_len)}
						//printf(p"word_len:${word_len}; index:${index}\n")
						//for(j <- 0 until 16){
						//	printf(p"cache_data${j}: ${Hexadecimal(cache_data(j.U))}\n")
						//}
						//printf("\n")
						cache_data(index) := io.mem_io.r.bits.data 
						
						//for(j <- 0 until 16){
						//	printf(p"num:${j}; cache_data:${Hexadecimal(cache_data(j.U))}\n")
						//}
						//cache_data:${Hexadecimal(cache_data.asUInt)};
						//printf(p"index:${index}; mem_response:${Hexadecimal(io.mem_io.r.bits.data)};  last:${io.mem_io.r.bits.last}\n")
						//for(j <- 0 until 16){
						//	printf(p"cache_data${j}: ${Hexadecimal(cache_data(j.U))}\n")
						//}
						//printf(p"io.data_read.data, ${Hexadecimal(data_mem(i).io.data_read.data)}\n")
						//printf("\n")
						data_mem(i).io.data_write.data := cache_data.asUInt//data_mem(i).io.data_read.data & (~((bitWidth - 1).U << (index << 6.U))) | (io.mem_io.r.bits.data << (index << 6.U))
						data_mem(i).io.cache_req.we := true.B
						//block_buffer := block_buffer & (~((blockSize - 1.U) << (index << 5.U))) | (io.mem_response.data << (index << 5.U))
					}
				}
			}

			//printf(p"mem_response:${Hexadecimal(io.mem_io.r.bits.data)}\n")
			//for(i <- 0 until nWays){
			//	printf(p"${i}_data:${Hexadecimal(data_mem(i).io.data_read.data)};\n")
			//}

			//printf("\n")
 
			fill_block_en := io.mem_io.r.ready

			when(io.mem_io.r.bits.last){
				next_state := sMatch
				//replay_reg := true.B
				index := 0.U
			}
			
			//这里支持突发传送
			/*
			.otherwise{
				io.mem_request.valid := true.B											//valid， 
				io.mem_request.addr := refill_addr + (index << log2Ceil(bitWidth).U)	//
				io.mem_request.rw := false.B											//	
				next_state := sRefill													//
			}*/

			/*
			when(!warp_out && io.mem_response.ready){
				io.mem_request.valid := true.B
				io.mem_request.addr :=  refill_addr + index * word_len
				io.mem_request.rw := false.B
				next_state := sRefill
			}.otherwise{
				next_state := sWriteback
			}*/
		}
		is(sWriteAddr){
			//printf("writeAddr\n")
			io.mem_io.aw.valid := true.B
			io.mem_io.aw.bits.len := 15.U
			next_state := sWriteAddr
			io.mem_io.aw.bits.addr := writeback_addr 
			when(io.mem_io.aw.ready){
				//printf("ready\n")
				next_state := sWriteback
			}
		}
		is(sWriteback){
			//printf("writeback\n")
			//index_reg := index
			//index := 0.U
			//when(io.mem_response.ready){
			//	block_buffer := block_buffer & 
			//}
			/*
			when(warp_out){
				next_state := sReadAddr
				index := 0.U
			}.otherwise{
			*/
			next_state := sWriteback
			fill_block_en := io.mem_io.w.ready
			//io.mem_io.w.bits.strb := "b11111111".U        //这个值在这里是固定的
			io.mem_io.w.valid := true.B
			io.mem_io.w.bits.strb := "b11111111".U
			//io.mem_request.addr := writeback_addr + (index << log2Ceil(bitWidth).U)
			//when(io.mem_io.w.ready){
				for(i <- 0 until nWays){
					when(i.U === replace){
						cache_data := VecInit.tabulate(16){k => data_mem(i).io.data_read.data((k+1)*word_len - 1, k*word_len)}
						io.mem_io.w.bits.data := cache_data(index)
					//io.mem_io.w.bits.data := Mux(index === 0.U, data_mem(i).io.data_read.data(blockSize - 1, word_len), data_mem(i).io.data_read.data(word_len - 1, 0))
					}
				}
				//printf(p"index:${index}\n")
			//}
			
			//io.mem_request.rw := true.B
			when(last){
				next_state := sWriteAck
				index := 0.U
			}
		}
		is(sWriteAck){
			//printf("sWriteAck\n")
			io.mem_io.b.ready := true.B
			next_state := sWriteAck
			when(io.mem_io.b.valid){
				next_state := sReadAddr
			}
		}
	}
	//printf("\n")
}



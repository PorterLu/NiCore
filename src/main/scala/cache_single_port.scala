package cache_single_port

import chisel3._ 
import chisel3.experimental.ChiselEnum
import chisel3.stage.ChiselStage
import axi4._ 
import chisel3.util._ 

class CacheReq extends Bundle{
	val wmask = UInt(128.W)
	val index = UInt(6.W)
	val we = Bool()
}

class CacheTag extends Bundle{
	val valid = Bool()
	val dirty = Bool()
	val visit = UInt(8.W)
	val tag = UInt(22.W)
}

class CacheData extends Bundle{
	val data = UInt(128.W)
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
}

object CacheState extends ChiselEnum{
	val sIdle, sUnCacheReadAddr, sUnCacheWriteAddr, sUnCacheReadData, sUnCacheWriteData, sUnCacheWriteAck, 
	sMatch, sWriteback, sRefill, sReadAddr, sWriteAddr, sWriteAck, sWait_a_cycle_r, sWait_a_cycle_w, sWait_a_cycle_refill, 
	sFlush, sFlushMatch, sFlushWrite, sFlushAddr,sFlushAck = Value
}

object AccessType extends ChiselEnum{
	val byte, half, word, double = Value 
}

class tag_cache extends Module{
	val io = IO(new Bundle{
		val cache_req = Input(new CacheReq)
		val tag_write = Input(new CacheTag)
		val tag_read = Output(new CacheTag)
	})

	val tag_mem = Reg(Vec(64, new CacheTag))
	io.tag_read := tag_mem(io.cache_req.index)

	when(io.cache_req.we){
		tag_mem(io.cache_req.index) := io.tag_write
	}
}

class data_cache extends Module{
	val io = IO(new Bundle{
		val enable = Input(Bool())
		val cache_req = Input(new CacheReq)
		val data_write = Input(new CacheData)
		val data_read = Output(new CacheData) 
		
		val sram_addr = Output(UInt(6.W))
		val sram_cen  = Output(Bool())
		val sram_wen  = Output(Bool())
		val sram_wmask 	  = Output(UInt(128.W))
		val sram_wdata 	  = Output(UInt(128.W))
		val sram_rdata    = Input(UInt(128.W))
	})

	io.sram_cen := false.B
	io.sram_addr := io.cache_req.index
	io.sram_wen := ~io.cache_req.we
	io.sram_wmask := io.cache_req.wmask
	io.sram_wdata := io.data_write.data
	io.data_read := io.sram_rdata.asTypeOf(io.data_read)

}

/*
val data_mem = SyncReadMem(64, new CacheData)
io.data_read := data_mem.read(io.cache_req.index, true.B)
when(io.cache_req.we){
	data_mem.write(io.cache_req.index, io.data_write)
} */

import CacheState._ 

class Cache(cache_name: String) extends Module{
	val io = IO(new Bundle{
		val cpu_request = Input(new CPU_Request)
		val cpu_response = Output(new CPU_Response)
		val mem_io = new Axi
		val flush = Input(Bool())
		val accessType = Input(UInt(2.W))

		val sram0_addr 	  = Output(UInt(6.W))
		val sram0_cen 	  = Output(Bool())
		val sram0_wen 	  = Output(Bool())
		val sram0_wmask   = Output(UInt(128.W))
		val sram0_wdata   = Output(UInt(128.W))
		val sram0_rdata   = Input(UInt(128.W))
		
		val sram1_addr 	  = Output(UInt(6.W))
		val sram1_cen 	  = Output(Bool())
		val sram1_wen 	  = Output(Bool())
		val sram1_wmask   = Output(UInt(128.W))
		val sram1_wdata   = Output(UInt(128.W))
		val sram1_rdata   = Input(UInt(128.W))

		val sram2_addr 	  = Output(UInt(6.W))
		val sram2_cen 	  = Output(Bool())
		val sram2_wen 	  = Output(Bool())
		val sram2_wmask   = Output(UInt(128.W))
		val sram2_wdata   = Output(UInt(128.W))
		val sram2_rdata   = Input(UInt(128.W))

		val sram3_addr 	  = Output(UInt(6.W))
		val sram3_cen 	  = Output(Bool())
		val sram3_wen 	  = Output(Bool())
		val sram3_wmask   = Output(UInt(128.W))
		val sram3_wdata   = Output(UInt(128.W))
		val sram3_rdata   = Input(UInt(128.W))
	})
	val cache_type = if(cache_name == "inst_cache") true.B else false.B

	val bitWidth = 64
	val addr_len = 32
	val blockSize = 16
	val word_len = 64
	val nWays = 4
	val nSets = 64
	val groupId_len = log2Ceil(nSets)
	val blockSize_len = log2Ceil(blockSize)
	val tag_len = addr_len - groupId_len - blockSize_len
	val data_beats = blockSize / (bitWidth/8)

	val cache_state = RegInit(sIdle)
	val tag_mem = Seq.fill(nWays)(Module(new tag_cache))
	val data_mem = Seq.fill(nWays)(Module(new data_cache))

	val fill_block_en = WireInit(false.B)
	val (index, last) = Counter(fill_block_en, data_beats)

	val next_state = WireInit(sIdle)
	val replace = RegInit(0.U(2.W))
	val refill_addr = RegInit(0.U(32.W))
	val writeback_addr = RegInit(0.U(32.W)) 

	cache_state := next_state

	val cpu_request_addr_reg_origin = RegInit(0.U(addr_len.W))
	val cpu_request_addr_reg = RegInit(0.U(addr_len.W))
	val cpu_request_data = RegInit(0.U(64.W))
	val cpu_request_mask = RegInit(0.U(8.W))
	val cpu_request_rw = RegInit(false.B)
	val cpu_request_valid = RegInit(false.B)
	val cpu_request_accessType = RegInit(0.U(2.W))
	
	io.sram0_addr := data_mem(0).io.sram_addr
	io.sram0_cen  := data_mem(0).io.sram_cen
	io.sram0_wen  := data_mem(0).io.sram_wen
	io.sram0_wmask := data_mem(0).io.sram_wmask
	io.sram0_wdata := data_mem(0).io.sram_wdata
	data_mem(0).io.sram_rdata := io.sram0_rdata

	io.sram1_addr := data_mem(1).io.sram_addr
	io.sram1_cen  := data_mem(1).io.sram_cen
	io.sram1_wen  := data_mem(1).io.sram_wen
	io.sram1_wmask := data_mem(1).io.sram_wmask
	io.sram1_wdata := data_mem(1).io.sram_wdata
	data_mem(1).io.sram_rdata := io.sram1_rdata

	io.sram2_addr := data_mem(2).io.sram_addr
	io.sram2_cen  := data_mem(2).io.sram_cen
	io.sram2_wen  := data_mem(2).io.sram_wen
	io.sram2_wmask := data_mem(2).io.sram_wmask
	io.sram2_wdata := data_mem(2).io.sram_wdata
	data_mem(2).io.sram_rdata := io.sram2_rdata

	io.sram3_addr := data_mem(3).io.sram_addr
	io.sram3_cen  := data_mem(3).io.sram_cen
	io.sram3_wen  := data_mem(3).io.sram_wen
	io.sram3_wmask := data_mem(3).io.sram_wmask
	io.sram3_wdata := data_mem(3).io.sram_wdata
	data_mem(3).io.sram_rdata := io.sram3_rdata

	/*when(!cache_type){
		for(i <- 0 until 4){
			when(!data_mem(i).io.sram_wen){
				printf(p"${Hexadecimal(data_mem(i).io.sram_wdata)}; ${Hexadecimal(data_mem(i).io.sram_wmask)}\n")
			}
		}
	}*/

	val align_addr = Cat(io.cpu_request.addr(addr_len - 1, log2Ceil(bitWidth/8)), 0.U((log2Ceil(bitWidth/8)).W))
	cpu_request_addr_reg := align_addr
	cpu_request_addr_reg_origin := io.cpu_request.addr
	cpu_request_data := io.cpu_request.data
	cpu_request_mask := io.cpu_request.mask
	cpu_request_rw := io.cpu_request.rw
	cpu_request_valid := io.cpu_request.valid
	cpu_request_accessType := io.accessType

	val cpu_request_addr_index = cpu_request_addr_reg(blockSize_len + groupId_len - 1, blockSize_len)
	val cpu_request_addr_tag = cpu_request_addr_reg(addr_len - 1, blockSize_len + groupId_len)

	val is_match = VecInit(Seq.fill(4)(false.B))
	val part = VecInit(Seq.fill(8)(0.U(64.W)))
	val result = WireInit(0.U(64.W))
	val cache_data = VecInit(Seq.fill(2)(0.U(64.W)))
	
	for(i <- 0 until nWays){
		tag_mem(i).io.cache_req.index := cpu_request_addr_index
		data_mem(i).io.cache_req.index := io.cpu_request.addr(blockSize_len + groupId_len - 1, blockSize_len)
		tag_mem(i).io.cache_req.we := false.B 
		data_mem(i).io.cache_req.we := false.B 
		tag_mem(i).io.tag_write := tag_mem(i).io.tag_read
		data_mem(i).io.data_write := data_mem(i).io.data_read
		data_mem(i).io.enable := true.B
		data_mem(i).io.cache_req.wmask := 0.U
		tag_mem(i).io.cache_req.wmask := 0.U
	}

	io.cpu_response.ready := false.B 
	io.cpu_response.data := 0.U 

	io.mem_io.aw.valid := false.B 
	io.mem_io.aw.bits.addr := cpu_request_addr_reg
	io.mem_io.aw.bits.len := 1.U 
	io.mem_io.aw.bits.size := 3.U 
	io.mem_io.aw.bits.burst := 1.U 
	io.mem_io.aw.bits.id := 0.U 

	io.mem_io.ar.valid := false.B 
	io.mem_io.ar.bits.addr := cpu_request_addr_reg
	io.mem_io.ar.bits.len := 1.U
	io.mem_io.ar.bits.size := 3.U 
	io.mem_io.ar.bits.burst := 1.U 
	io.mem_io.ar.bits.id := 0.U 

	io.mem_io.w.valid := false.B 
	io.mem_io.w.bits.strb := "b11111111".U 
	io.mem_io.w.bits.data := 0.U 
	io.mem_io.w.bits.last := last

	io.mem_io.r.ready := false.B 

	io.mem_io.b.ready := false.B

	val response_data = WireInit(0.U(128.W))
	val max = WireInit(0.U(log2Ceil(nWays).W))
	val visit = VecInit(Seq.fill(4)(0.U(8.W)))
	val compare_1_0 = WireInit(false.B)
	val compare_2_3 = WireInit(false.B)
	val max_01_or_23 = WireInit(false.B)
	val flush_loop_enable = WireInit(false.B)
	val index_in_line_enable = WireInit(false.B)
	val (flush_loop, flush_last) = Counter(flush_loop_enable, nSets)
	val (index_in_line, line_last) = Counter(index_in_line_enable, nWays)
	val flush_over = RegInit(false.B)
	val wmask = VecInit(Seq.fill(2)(0.U(64.W)))

	flush_loop_enable := false.B
	index_in_line_enable := false.B
	val tmp_response_data = RegInit(0.U(64.W))

	switch(cache_state){
		is(sIdle){
			when(io.flush && io.cpu_request.valid){
				next_state := sFlush
			}.elsewhen(io.cpu_request.valid && 
					align_addr >= "h80000000".U && 
					align_addr <= "h88000000".U){
				
				next_state := sMatch
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
		is(sFlush){
			//将last信号拉到最后一级进行判断
			/*when(!cpu_request_valid){
				next_state := sIdle
			}.otherwise{*/
				when(flush_over){
					next_state := sIdle
					flush_loop := 0.U
					flush_over := false.B
					io.cpu_response.ready := true.B 
				}.otherwise{
					next_state := sFlushMatch
				}
			//}
		}
		is(sFlushMatch){
			//将index加1的操作推迟到最后一个周期
			when(!cache_type){
				for(i <- 0 until nWays){
					tag_mem(i).io.cache_req.index := flush_loop
				}

				is_match := tag_mem.map{k => k.io.tag_read.valid}
				for(i <- 0 until nWays){
					when(i.U === index_in_line){
						when(is_match(i)){
							next_state := sFlushAddr
							writeback_addr := Cat(tag_mem(i).io.tag_read.tag, flush_loop, 0.U(4.W))
						}.elsewhen(!(index_in_line === (nWays - 1).U)){
							next_state := sFlushMatch
							index_in_line_enable := true.B
						}.otherwise{
							next_state := sFlush
							when(flush_loop === (nSets - 1).U){
								flush_over := true.B
							}.otherwise{
								flush_loop_enable := true.B
								index_in_line := 0.U
							}
						}
					}
				}
			}.otherwise{
				for(i <- 0 until nWays){
					tag_mem(i).io.cache_req.index := flush_loop
				}

				for(i <- 0 until nWays){
					tag_mem(i).io.cache_req.we := true.B 
					tag_mem(i).io.tag_write.tag := tag_mem(i).io.tag_read.tag
					tag_mem(i).io.tag_write.visit := 0.U 
					tag_mem(i).io.tag_write.dirty := false.B 
					tag_mem(i).io.tag_write.valid := false.B
				}

				next_state := sFlush
				flush_loop_enable := true.B
				when(flush_loop === (nSets - 1).U){
					flush_over := true.B
				}
			}
		}
		is(sFlushAddr){
			for(i <- 0 until nWays){
				when(i.U === index_in_line){
					data_mem(i).io.cache_req.index := flush_loop
					data_mem(i).io.cache_req.we := false.B
				}
			}

			io.mem_io.aw.valid := true.B 
			io.mem_io.aw.bits.len := 1.U 
			io.mem_io.aw.bits.addr := writeback_addr
			next_state := sFlushAddr
			when(io.mem_io.aw.ready){
				next_state := sFlushWrite
			}
		}
		is(sFlushWrite){
			for(i <- 0 until nWays){
				when(i.U === index_in_line){
					data_mem(i).io.cache_req.index := flush_loop
					data_mem(i).io.cache_req.we := false.B
				}
			}

			next_state := sFlushWrite
			fill_block_en := io.mem_io.w.ready
			io.mem_io.w.bits.strb := "b11111111".U
			io.mem_io.w.valid := true.B
			for(i <- 0 until nWays){
				when(i.U === index_in_line){
					cache_data := VecInit.tabulate(2){k => data_mem(i).io.data_read.data((k+1)*word_len - 1, k*word_len)}
					io.mem_io.w.bits.data := cache_data(index)
				}
			}

			when(last){
				next_state := sFlushAck
				index := 0.U
			}
		}
		is(sFlushAck){
			io.mem_io.b.ready := true.B 
			next_state := sFlushAck
			when(io.mem_io.b.valid){
				when(index_in_line =/= (nWays - 1).U){
					next_state := sFlushMatch
					index_in_line_enable := true.B
				}.otherwise{
					next_state := sFlush
					index_in_line := 0.U
					when(flush_loop === (nSets - 1).U){
						flush_over := true.B
					}.otherwise{
						flush_loop_enable := true.B
					}
				}
			}
		}
		is(sUnCacheReadAddr){
			io.mem_io.ar.valid := true.B //&& cpu_request_valid
			io.mem_io.ar.bits.len := 0.U 
			io.mem_io.ar.bits.size := cpu_request_accessType
			io.mem_io.ar.bits.addr := cpu_request_addr_reg_origin
			next_state := sUnCacheReadAddr
			when(io.mem_io.ar.ready){
				next_state := sUnCacheReadData
			}/*.elsewhen(!cpu_request_valid){
				next_state := sIdle
			}*/
		}
		is(sUnCacheWriteAddr){
			io.mem_io.aw.valid := true.B //&& cpu_request_valid
			io.mem_io.aw.bits.len := 0.U
			io.mem_io.aw.bits.size := cpu_request_accessType
			io.mem_io.aw.bits.addr := cpu_request_addr_reg_origin
			next_state := sUnCacheWriteAddr
			when(io.mem_io.aw.ready){
				next_state := sUnCacheWriteData
			}/*.elsewhen(!cpu_request_valid){
				next_state := sIdle
			}*/
		}
		is(sUnCacheReadData){

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
			io.mem_io.w.valid := true.B 
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
			io.mem_io.b.ready := true.B 
			when(io.mem_io.b.valid){
				io.cpu_response.ready := true.B 
				next_state := sIdle
			}.otherwise{
				next_state := sUnCacheWriteAck
			}
		}
		is(sMatch){
			
			for(i <- 0 until nWays){
				tag_mem(i).io.cache_req.index := cpu_request_addr_index
			}

			is_match := tag_mem.map{k => (k.io.tag_read.tag === cpu_request_addr_tag) && (k.io.tag_read.valid)}

			when(is_match.reduce(_|_)){
				when(!cpu_request_rw){
					
					//io.cpu_response.ready := true.B
					//io.cpu_response.data 
					tmp_response_data := MuxCase(VecInit.tabulate(2){k => data_mem(3).io.data_read.data((k+1)*word_len - 1, k*word_len)}(cpu_request_addr_reg(blockSize_len-1, log2Ceil(word_len/8))),
										Array(
											is_match(0) -> VecInit.tabulate(2){k => data_mem(0).io.data_read.data((k+1)*word_len - 1, k*word_len)}(cpu_request_addr_reg(blockSize_len-1, log2Ceil(word_len/8))),
											is_match(1) -> VecInit.tabulate(2){k => data_mem(1).io.data_read.data((k+1)*word_len - 1, k*word_len)}(cpu_request_addr_reg(blockSize_len-1, log2Ceil(word_len/8))),
											is_match(2) -> VecInit.tabulate(2){k => data_mem(2).io.data_read.data((k+1)*word_len - 1, k*word_len)}(cpu_request_addr_reg(blockSize_len-1, log2Ceil(word_len/8))),
										)
									)

					next_state := sWait_a_cycle_r
				}

				for(i <- 0 until nWays){
					tag_mem(i).io.tag_write.dirty := tag_mem(i).io.tag_read.dirty
					tag_mem(i).io.tag_write.tag := tag_mem(i).io.tag_read.tag
					when(is_match(i)){
						tag_mem(i).io.cache_req.we := true.B 
						tag_mem(i).io.tag_write.visit := 0.U 
						tag_mem(i).io.tag_write.valid := true.B 
						when(cpu_request_rw){
							tag_mem(i).io.tag_write.dirty := true.B			
						}
					}.elsewhen(tag_mem(i).io.tag_read.valid){
						tag_mem(i).io.cache_req.we := true.B 
						tag_mem(i).io.tag_write.visit := Mux((~tag_mem(i).io.tag_read.visit) === 0.U, tag_mem(i).io.tag_read.visit, tag_mem(i).io.tag_read.visit + 1.U) 
						tag_mem(i).io.tag_write.valid := tag_mem(i).io.tag_read.valid
					}
				}

				when(cpu_request_rw){

					for(i <- 0 until nWays){
						when(is_match(i)){
							data_mem(i).io.cache_req.we := true.B 
							//response_data := data_mem(i).io.data_read.data
							/*for(j <- 0 until 8){
								part(j) := Mux(cpu_request_mask(j), cpu_request_data((j+1)*8 - 1, j*8) << (j*8),
									(VecInit.tabulate(2){k => response_data((k+1)*word_len - 1, k*word_len)}(cpu_request_addr_reg(blockSize_len - 1, log2Ceil(word_len/8)))((j+1)*8 - 1, j*8)) << (j*8)
								)
							}*/
							//result := part.reduce(_|_)
							//cache_data := VecInit.tabulate(2){k => data_mem(i).io.data_read.data((k+1)*word_len - 1, k*word_len)}
							cache_data := VecInit.tabulate(2){k => 0.U(64.W)}
							cache_data(cpu_request_addr_reg(blockSize_len - 1, log2Ceil(word_len/8))) := cpu_request_data

							//cache_data(cpu_request_addr_reg(blockSize_len - 1, log2Ceil(word_len/8))) := result
//							when(cpu_request_addr_reg >= "h80000000".U){
//								printf(p"write data:${Hexadecimal(cpu_request_data)}\n")
//							}
							data_mem(i).io.data_write.data := cache_data.asUInt
							wmask := VecInit.tabulate(2){k => 0.U(64.W)}
							wmask(cpu_request_addr_reg(blockSize_len - 1, log2Ceil(word_len/8))) := Cat(Fill(8, cpu_request_mask(7)), Fill(8, cpu_request_mask(6)), Fill(8, cpu_request_mask(5)), Fill(8, cpu_request_mask(4)),
																									Fill(8, cpu_request_mask(3)), Fill(8, cpu_request_mask(2)), Fill(8, cpu_request_mask(1)), Fill(8, cpu_request_mask(0)))
							data_mem(i).io.cache_req.wmask := ~wmask.asUInt
						}
					}
					
					next_state := sWait_a_cycle_w
				}
			}.otherwise{
				when(tag_mem.map{k => k.io.tag_read.valid}.reduceLeft(_&_)){
					visit := tag_mem.map{k => k.io.tag_read.visit}
					compare_1_0 := visit(1) > visit(0)
					compare_2_3 := visit(3) > visit(2)
					max_01_or_23 := Mux(compare_2_3, visit(3), visit(2)) > Mux(compare_1_0, visit(1), visit(0))				
					max := Cat(max_01_or_23, Mux(max_01_or_23, compare_2_3, compare_1_0))
					replace := max					
				}.otherwise{
					max := MuxCase(0.U, Array((tag_mem(1).io.tag_read.valid === 0.U) -> 1.U, (tag_mem(2).io.tag_read.valid === 0.U) -> 2.U, (tag_mem(3).io.tag_read.valid === 0.U) -> 3.U))
					replace := max
				}

				refill_addr := Cat(cpu_request_addr_reg(addr_len - 1, blockSize_len), 0.U(blockSize_len.W))

				for(i <- 0 until nWays){
					when(i.U === max){
						tag_mem(i).io.cache_req.we := true.B 
						tag_mem(i).io.tag_write.valid := true.B 
						tag_mem(i).io.tag_write.dirty := cpu_request_rw
						tag_mem(i).io.tag_write.tag := cpu_request_addr_tag
						tag_mem(i).io.tag_write.visit := 0.U 
						when((!tag_mem(i).io.tag_read.valid)||(!tag_mem(i).io.tag_read.dirty)){
							next_state := sReadAddr
						}.otherwise{
							writeback_addr := Cat(tag_mem(i).io.tag_read.tag, cpu_request_addr_index, 0.U(blockSize_len.W))
							next_state := sWriteAddr
						}
					}
				}

				for(i <- 0 until nWays){
					when((i.U =/= max) && tag_mem(i).io.tag_read.valid){
						tag_mem(i).io.cache_req.we := true.B 
						tag_mem(i).io.tag_write.valid := true.B 
						tag_mem(i).io.tag_write.dirty := tag_mem(i).io.tag_read.dirty
						tag_mem(i).io.tag_write.visit := Mux((~tag_mem(i).io.tag_read.visit) === 0.U, tag_mem(i).io.tag_read.visit, tag_mem(i).io.tag_read.visit + 1.U) 
						tag_mem(i).io.tag_write.tag := tag_mem(i).io.tag_read.tag
					}
				}
			}
		}
		is(sWait_a_cycle_r){
			io.cpu_response.ready := true.B 
			io.cpu_response.data := tmp_response_data
			next_state := sIdle
		}
		is(sWait_a_cycle_w){
			io.cpu_response.ready := true.B
			next_state := sIdle
		}
		is(sReadAddr){
			io.mem_io.ar.valid := true.B //&& cpu_request_valid
			//printf(p"ar_valid:${io.mem_io.ar.valid}\n")
			io.mem_io.ar.bits.len := 1.U
			next_state := sReadAddr
			io.mem_io.ar.bits.addr := refill_addr
			when(io.mem_io.ar.ready){
				next_state := sRefill
			}/*.elsewhen(!cpu_request_valid){
				next_state := sIdle
			}*/
		}
		is(sRefill){
			io.mem_io.r.ready := true.B 
			next_state := sRefill
			when(io.mem_io.r.valid){
				for(i <- 0 until nWays){
					when(i.U === replace){
						//cache_data := VecInit.tabulate(2){k => data_mem(i).io.data_read.data((k+1)*word_len - 1, k*word_len)}
						cache_data := VecInit.tabulate(2){k => 0.U(64.W)}
						wmask := VecInit.tabulate(2){k => 0.U(64.W)}
						cache_data(index) := io.mem_io.r.bits.data
						wmask(index) := "hffffffffffffffff".U
						data_mem(i).io.data_write.data := cache_data.asUInt
						data_mem(i).io.cache_req.wmask := ~wmask.asUInt
						data_mem(i).io.cache_req.we := true.B
//						printf(p"Refill wmask:${Hexadecimal(~wmask.asUInt)}; write_data:${Hexadecimal(cache_data.asUInt)}\n")
					}
				}
			}

			fill_block_en := io.mem_io.r.valid
			
			when(io.mem_io.r.bits.last){
				next_state := sWait_a_cycle_refill
				index := 0.U
			}
		}
		is(sWait_a_cycle_refill){
			next_state := sMatch
		}
		is(sWriteAddr){
			io.mem_io.aw.valid := true.B //&& cpu_request_valid 
			io.mem_io.aw.bits.len := 1.U 
			io.mem_io.aw.bits.addr := writeback_addr
			next_state := sWriteAddr
			when(io.mem_io.aw.ready){
				next_state := sWriteback
			}/*.elsewhen(!cpu_request_valid){
				next_state := sIdle
			}*/
		}
		is(sWriteback){
			next_state := sWriteback
			fill_block_en := io.mem_io.w.ready
			io.mem_io.w.valid := true.B  
			io.mem_io.w.bits.strb := "b11111111".U
			for(i <- 0 until nWays){
				when(i.U === replace){
					cache_data := VecInit.tabulate(2){k => data_mem(i).io.data_read.data((k+1)*word_len - 1, k*word_len)}
					io.mem_io.w.bits.data := cache_data(index)
//					printf(p"writeback:${Hexadecimal(cache_data(index))};\n")
				}
			}
			when(last){
				next_state := sWriteAck
				index := 0.U
			}
		}
		is(sWriteAck){
			io.mem_io.b.ready := true.B 
			next_state := sWriteAck
			when(io.mem_io.b.valid){
				next_state := sReadAddr
			}
		}
	}
}
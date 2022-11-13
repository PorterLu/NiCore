package  myCPU
import chisel3._ 
import chisel3.util._ 
import chisel3.experimental.BundleLiterals._
import Control._

class WritebackStage extends Module{
	val io = IO(new Bundle{
		val stall = Input(Bool())

		val mw_enable = Output(Bool())
		val retired = Output(Bool())
		val csr_w_op = Output(UInt(3.W))
		val csr_w_addr = Output(UInt(12.W))
		val csr_w_data = Output(UInt(64.W))
		val regFile_wen = Output(Bool())
		val regFile_waddr = Output(UInt(5.W))
		val regFile_wdata = Output(UInt(64.W))

		val mw_pipe_reg = Input(new mem_writeback_pipeline_reg)
	})
	
	io.mw_enable := io.mw_pipe_reg.enable
	io.retired := io.mw_pipe_reg.inst =/= Instructions.NOP			//指令如果不是nop，则指令计数器要进行加1
	io.csr_w_op := io.mw_pipe_reg.csr_write_op							//write_op输入，可以写csr寄存器
	io.csr_w_addr := io.mw_pipe_reg.csr_write_addr						//csr寄存器地址
	io.csr_w_data := io.mw_pipe_reg.csr_write_data						//要写的数据

	io.regFile_wen := ((io.mw_pipe_reg.wb_sel === WB_ALU ||
						io.mw_pipe_reg.wb_sel === WB_PC4 ||
						io.mw_pipe_reg.wb_sel === WB_MEM || io.mw_pipe_reg.wb_sel === WB_CSR) && (io.mw_pipe_reg.wb_en)) && io.mw_pipe_reg.enable && !io.stall
	io.regFile_waddr := io.mw_pipe_reg.dest
	io.regFile_wdata := Mux(io.mw_pipe_reg.wb_sel === WB_ALU, io.mw_pipe_reg.alu_out,
							Mux(io.mw_pipe_reg.wb_sel === WB_PC4, io.mw_pipe_reg.pc + 4.U, 
								Mux(io.mw_pipe_reg.wb_sel === WB_CSR, io.mw_pipe_reg.csr_read_data, io.mw_pipe_reg.load_data)
							)
						)
	
	
}
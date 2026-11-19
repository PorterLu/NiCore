package  myCPU
import chisel3._ 

class fetch_decode_pipeline_reg extends Bundle{
	val inst = chiselTypeOf(Instructions.NOP)
	val pc = UInt(64.W)
	val iTLB_fault = UInt(2.W)
	// an instruction guest-page fault: the guest physical address, and whether
	// it is the address of a VS-stage page table entry
	val iTLB_guest = Bool()
	val iTLB_gpa = UInt(64.W)
	val iTLB_pte = Bool()
	val enable = Bool()
}

class decode_execute_pipeline_reg extends Bundle{
	val alu_op = UInt(5.W)										
	val pc = UInt(64.W)
	val inst = chiselTypeOf(Instructions.NOP)
	val imm = UInt(64.W)
	val imm_sel = UInt(3.W)
	val rs1 = UInt(64.W)
	val src1_addr = UInt(64.W)
	val rs2 = UInt(64.W)
	val src2_addr = UInt(64.W)
	val csr_read_data = UInt(64.W)
	val csr_write_op = UInt(3.W)
	val csr_write_addr = UInt(12.W)
	val csr_write_data = UInt(64.W)
	val dest = UInt(5.W)
	val A_sel = UInt(1.W)
	val B_sel = UInt(1.W)
	val pc_sel = UInt(2.W)
	val br_type = UInt(3.W)
	val wd_type = UInt(2.W)
	val st_type = UInt(3.W)
	val ld_type = UInt(3.W)
	val wb_sel = UInt(2.W)
	val wb_en = Bool()
	val csr_cmd = UInt(3.W)
	val csr_inst_mode = UInt(2.W)
	val csr_is_illegal = Bool()
	// raises a virtual-instruction exception: a guest executes what only
	// its hypervisor may
	val csr_is_virtual = Bool()
	val csr_inst_misalign = Bool()
	val iTLB_fault = UInt(2.W)
	// an instruction guest-page fault: the guest physical address, and whether
	// it is the address of a VS-stage page table entry
	val iTLB_guest = Bool()
	val iTLB_gpa = UInt(64.W)
	val iTLB_pte = Bool()
	val amo_op = UInt(4.W)
	// HLV/HSV: the access is one of the guest; HLVX reads executable memory
	val hlsv = Bool()
	val hlvx = Bool()
	val enable = Bool()
}

class  execute_mem_pipeline_reg extends Bundle{
	val alu_out = UInt(64.W)
	val alu_sum = UInt(64.W)
	val csr_read_data = UInt(64.W)
	val csr_write_op = UInt(3.W)
	val csr_write_addr = UInt(12.W)
	val csr_write_data = UInt(64.W)
	val jump_taken = Bool()
	val st_data = UInt(64.W)
	val st_type = UInt(3.W)
	val ld_type = UInt(3.W)
	val wb_sel = UInt(2.W)
	val wb_en = Bool()
	val dest = UInt(5.W)
	val pc = UInt(64.W)
	val inst = chiselTypeOf(Instructions.NOP)
	val is_clint = Bool()
	val csr_inst_mode = UInt(2.W)
	val csr_is_illegal = Bool()
	val csr_is_virtual = Bool()
	val csr_inst_misalign = Bool()
	val csr_load_misalign = Bool()
	val csr_store_misalign = Bool()
	val iTLB_fault = UInt(2.W)
	// an instruction guest-page fault: the guest physical address, and whether
	// it is the address of a VS-stage page table entry
	val iTLB_guest = Bool()
	val iTLB_gpa = UInt(64.W)
	val iTLB_pte = Bool()
	val amo_op = UInt(4.W)
	val hlsv = Bool()
	val hlvx = Bool()
	val sfence_rs1 = UInt(64.W)
	val sfence_rs2 = UInt(64.W)
	val enable = Bool()
}

class mem_writeback_pipeline_reg extends Bundle{
	val load_data = UInt(64.W)
	val alu_out = UInt(64.W)
	val dest = UInt(5.W)
	val csr_read_data = UInt(64.W)
	val st_type = UInt(3.W)
	val ld_type = UInt(3.W)
	val wb_sel = UInt(2.W)
	val wb_en = Bool()
	val pc = UInt(64.W)
	val inst = chiselTypeOf(Instructions.NOP)
	val csr_write_op = UInt(3.W)					//write_op输入，可以写csr寄存器
	val csr_write_addr = UInt(12.W)					//csr寄存器地址
	val csr_write_data = UInt(64.W)					//要写的数据
	val enable = Bool()
}

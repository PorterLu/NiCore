package myCPU
import chisel3._ 
import chisel3.util._ 
import Control._
import CSR_OP._ 
import Page_fault._ 
//design new exception and interrupt response order
object ExceptCause{
	val EXC_S_SOFT_INT = 1.U(63.W)		//s模式软件中断
	val EXC_M_SOFT_INT = 3.U(63.W)		//m模式软件中断
	val EXC_S_TIMER_INT = 5.U(63.W)		//s模式时钟中断，应该是不存在的
	val EXC_M_TIMER_INT = 7.U(63.W)		//m模式时钟中断
	val EXC_S_EXT_INT = 9.U(63.W)		//s模式外部中断
	val EXC_M_EXT_INT = 11.U(63.W)		//m模式外部中断
	// interrupts of a guest: raised by its hypervisor through hvip
	val EXC_VS_SOFT_INT = 2.U(63.W)
	val EXC_VS_TIMER_INT = 6.U(63.W)
	val EXC_VS_EXT_INT = 10.U(63.W)

	val EXC_INST_ADDR = 0.U(63.W)		//取指非对齐异常
	val EXC_ILL_INST = 2.U(63.W)		//非法指令异常
	val EXC_BRK_POINT = 3.U(63.W)		//ebreak异常
	val EXC_LOAD_ADDR = 4.U(63.W)		//load非对齐
	val EXC_STORE_ADDR = 6.U(63.W)		//store非对齐
	val EXC_U_ECALL = 8.U(63.W)			//ecall异常
	val EXC_S_ECALL	= 9.U(63.W)
	val EXC_M_ECALL = 11.U(63.W)
	val EXC_INST_PAGE = 12.U(63.W)
	val EXC_LOAD_PAGE = 13.U(63.W)
	val EXC_STORE_PAGE = 15.U(63.W)
	// hypervisor extension
	val EXC_VS_ECALL = 10.U(63.W)			// ecall from VS mode
	val EXC_INST_GUEST_PAGE = 20.U(63.W)	// guest-page faults: no translation
	val EXC_LOAD_GUEST_PAGE = 21.U(63.W)	// of a guest physical address
	val EXC_VIRT_INST = 22.U(63.W)			// virtual instruction
	val EXC_STORE_GUEST_PAGE = 23.U(63.W)
}

object CSR{
	val N = 0.U(3.W)					//不做操作
	val R = 1.U(3.W)
	val W = 2.U(3.W)
	val RW = 3.U(3.W)					//写操作
	val RS = 4.U(3.W)					//set操作
	val RC = 5.U(3.W)					//clear操作
	val P = 6.U(3.W)					//陷入指令

	//privilege
	val CSR_MODE_WIDTH = 2
	val CSR_MODE_U = "b00".U(2.W)
	val CSR_MODE_S = "b01".U(2.W)
	val CSR_MODE_M = "b11".U(2.W)

	val CSR_ADDR_WIDTH = 12		//说明一个hart最多支持4096个CSR寄存器

	//user counter(read only)
	val CSR_CYCLE 	= 0xc00.U(12.W)
	val CSR_TIME 	= 0xc01.U(12.W)
	val CSR_INSTRET = 0xc02.U(12.W)
	
	//supervisor trap setup
	val CSR_SSTATUS = 0x100.U(12.W)		//status of supervisior
	val CSR_SIE		= 0x104.U(12.W)		//interrupt of supervisior
	val CSR_STVEC	= 0x105.U(12.W)		//trap vector of supervisior
	val CSR_SCOUNTEREN = 0x106.U(12.W)	//supervisior counter enable register

	//supervisor trap handling
	val CSR_SSCRATCH = 0x140.U(12.W)	//scratch is used for a pointer 
	val CSR_SEPC	= 0x141.U(12.W)		//supervisior exception pc
	val CSR_SCAUSE 	= 0x142.U(12.W)		//supervisior cause for exception
	val CSR_STVAL 	= 0x143.U(12.W)		//supervisior trap value
	val CSR_SIP 	= 0x144.U(12.W)		//supervisior interrupt pending

	//supervisor protection and translation
	val CSR_SATP 	= 0x180.U(12.W)
	
	//machine information register(read only)
	val CSR_MVENDERID = 0xf11.U(12.W)	//vender of the processor
	val CSR_MARCHID	= 0xf12.U(12.W)		//architecture id
	val CSR_MIMPID	= 0xf13.U(12.W)		//the unique realization id of processor
	val CSR_MHARTID = 0xf14.U(12.W)		//hart id 

	//machine trap setup
	val CSR_MSTATUS = 0x300.U(12.W)
	val CSR_MISA	= 0x301.U(12.W)		//isa supported by hart
	val CSR_MEDELEG = 0x302.U(12.W)		//machine exception delegation
	val CSR_MIDELEG	= 0x303.U(12.W)		//machine interrupt delegation
	val CSR_MIE 	= 0X304.U(12.W)
	val CSR_MTVEC	= 0x305.U(12.W)
	val CSR_MCOUNTEREN = 0x306.U(12.W)

	//machine trap handling
	val CSR_MSCRATCH = 0x340.U(12.W)
	val CSR_MEPC	= 0x341.U(12.W)
	val CSR_MCAUSE	= 0x342.U(12.W)
	val CSR_MTVAL	= 0x343.U(12.W)
	val CSR_MIP 	= 0x344.U(12.W)

	// machine counters
	val CSR_MCYCLE 		= 0xb00.U(12.W)
	val CSR_MINSTRET	= 0xb02.U(12.W)

	// ---- M-mode CSRs required by OpenSBI ----
	val CSR_MCOUNTINHIBIT = 0x320.U(12.W)
	// mstatus bits 35:32, SXL and UXL: the lower modes are 64 bit
	val MSTATUS_XL = "h0000000a00000000".U(64.W)
	val CSR_MENVCFG    = 0x30a.U(12.W)
	val CSR_MSECCFG   = 0x747.U(12.W)
	val CSR_SENVCFG   = 0x10a.U(12.W)
	val CSR_MCONFIGPTR = 0xf15.U(12.W)
	// trigger CSRs (debug)
	val CSR_TSELECT    = 0x7a0.U(12.W)
	val CSR_TDATA1     = 0x7a1.U(12.W)
	val CSR_TDATA2     = 0x7a2.U(12.W)
	val CSR_TDATA3     = 0x7a3.U(12.W)
	val CSR_MCONTEXT   = 0x7a8.U(12.W)
	// PMP
	val CSR_PMPCFG0    = 0x3a0.U(12.W)
	val CSR_PMPCFG1    = 0x3a1.U(12.W)
	val CSR_PMPCFG2    = 0x3a2.U(12.W)
	val CSR_PMPCFG3    = 0x3a3.U(12.W)
	// performance counters
	val CSR_MHPMEVENT3  = 0x323.U(12.W)
	val CSR_MHPMEVENT4  = 0x324.U(12.W)
	val CSR_MHPMEVENT5  = 0x325.U(12.W)
	val CSR_MHPMEVENT6  = 0x326.U(12.W)
	val CSR_MHPMCOUNTER3 = 0xb03.U(12.W)
	val CSR_MHPMCOUNTER4 = 0xb04.U(12.W)
	val CSR_MHPMCOUNTER5 = 0xb05.U(12.W)
	val CSR_MHPMCOUNTER6 = 0xb06.U(12.W)
	// pmpaddr0-15
	val CSR_PMPADDR0  = 0x3b0.U(12.W)
	val CSR_PMPADDR1  = 0x3b1.U(12.W)
	val CSR_PMPADDR2  = 0x3b2.U(12.W)
	val CSR_PMPADDR3  = 0x3b3.U(12.W)
	val CSR_PMPADDR4  = 0x3b4.U(12.W)
	val CSR_PMPADDR5  = 0x3b5.U(12.W)
	val CSR_PMPADDR6  = 0x3b6.U(12.W)
	val CSR_PMPADDR7  = 0x3b7.U(12.W)
	val CSR_PMPADDR8  = 0x3b8.U(12.W)
	val CSR_PMPADDR9  = 0x3b9.U(12.W)
	val CSR_PMPADDR10 = 0x3ba.U(12.W)
	val CSR_PMPADDR11 = 0x3bb.U(12.W)
	val CSR_PMPADDR12 = 0x3bc.U(12.W)
	val CSR_PMPADDR13 = 0x3bd.U(12.W)
	val CSR_PMPADDR14 = 0x3be.U(12.W)
	val CSR_PMPADDR15 = 0x3bf.U(12.W)

	// hypervisor extension: the CSRs of the hypervisor, ...
	val CSR_HSTATUS    = 0x600.U(12.W)
	val CSR_HEDELEG    = 0x602.U(12.W)
	val CSR_HIDELEG    = 0x603.U(12.W)
	val CSR_HIE        = 0x604.U(12.W)
	val CSR_HCOUNTEREN = 0x606.U(12.W)
	val CSR_HGEIE      = 0x607.U(12.W)
	val CSR_HENVCFG    = 0x60a.U(12.W)
	val CSR_HTVAL      = 0x643.U(12.W)
	val CSR_HIP        = 0x644.U(12.W)
	val CSR_HVIP       = 0x645.U(12.W)
	val CSR_HTINST     = 0x64a.U(12.W)
	val CSR_HGATP      = 0x680.U(12.W)
	val CSR_HGEIP      = 0xe12.U(12.W)
	// ... the two it adds to machine level, ...
	val CSR_MTINST     = 0x34a.U(12.W)
	val CSR_MTVAL2     = 0x34b.U(12.W)
	// ... and the VS copies of the supervisor CSRs, which a guest uses
	// under the supervisor numbers
	val CSR_VSSTATUS   = 0x200.U(12.W)
	val CSR_VSIE       = 0x204.U(12.W)
	val CSR_VSTVEC     = 0x205.U(12.W)
	val CSR_VSSCRATCH  = 0x240.U(12.W)
	val CSR_VSEPC      = 0x241.U(12.W)
	val CSR_VSCAUSE    = 0x242.U(12.W)
	val CSR_VSTVAL     = 0x243.U(12.W)
	val CSR_VSIP       = 0x244.U(12.W)
	val CSR_VSATP      = 0x280.U(12.W)
}

import ExceptCause._
import CSR._ 

//这里要处理不同阶段发生可能的一场，所以这里的信号来自流水线的不同阶段
class CSR extends Module{
	//csr interface
	val io = IO(new Bundle{
		val flush_mask = Output(UInt(4.W))		//输出判断该操作是否合理

		val r_op = Input(UInt(3.W))			//csr_cmd op
		val r_addr = Input(UInt(12.W))		//要读的csr寄存器地址
		val r_data = Output(UInt(64.W))		//读出的数据
		// the CSR that r_addr stands for: in a guest the supervisor CSRs
		// are their VS copies
		val r_target = Output(UInt(12.W))
		// the instruction in decode, and whether the current mode may
		// execute it: illegal instruction, or virtual instruction when a
		// guest tries what its hypervisor may do
		val d_inst = Input(UInt(32.W))
		val d_hlsv = Input(Bool())
		val d_illegal = Output(Bool())
		val d_virtual = Output(Bool())

		val w_op = Input(UInt(3.W))			//csr_cmd op
		val w_addr = Input(UInt(12.W))		//要写的地址
		val w_data = Input(UInt(64.W))		//要些的数据
		val retired = Input(Bool())
		val inst = Input(UInt(32.W))		//指令本身

		val fd_pipe_reg_pc = Input(UInt(64.W))
		val jump_addr = Input(UInt(64.W))

		val int_timer_clear = Input(Bool())
		val int_soft_clear = Input(Bool())
		val int_timer = Input(Bool())		//时钟中断信号
		val int_soft = Input(Bool())		//软件中断信号
		val extern = Input(Bool())			//外部中断信号

		val jump_taken = Input(Bool())

		val isSret = Input(Bool())			//输入的是否是sret的信号
		val isMret = Input(Bool())			//输入的是否是mret的信号

		val de_pipe_reg_pc = Input(UInt(64.W))
		val excPC = Input(UInt(64.W))		//异常pc的输入

		val mstatus = Output(UInt(64.W))
		val sstatus = Output(UInt(64.W))
		val satp    = Output(UInt(64.W))
		val mprv    = Output(Bool())
		val mpp     = Output(UInt(2.W))
		// hypervisor extension: V (the hart runs a guest), the translation
		// CSRs of the guest, SUM and MXR of vsstatus, and the modes that
		// MPRV (MPV) and HLV/HSV (SPVP) access memory in
		val virt    = Output(Bool())
		val vsatp   = Output(UInt(64.W))
		val hgatp   = Output(UInt(64.W))
		val vs_sum  = Output(Bool())
		val vs_mxr  = Output(Bool())
		val mpv     = Output(Bool())
		val spvp    = Output(Bool())
		val trapVec = Output(UInt(64.W))
		val stall = Input(Bool())
		val trap = Output(Bool())
		// trap event for the difftest: the cycle an exception or interrupt is taken
		val trap_valid = Output(Bool())
		val trap_cause = Output(UInt(64.W))
		val trap_epc = Output(UInt(64.W))
		val trap_tval = Output(UInt(64.W))
		val trap_tval2 = Output(UInt(64.W))
		val trap_tinst = Output(UInt(64.W))
		val mode = Output(UInt(2.W))

		val is_illegal = Input(Bool())
		val is_virtual = Input(Bool())
		val inst_misalign = Input(Bool())
		val store_misalign = Input(Bool())
		val load_misalign = Input(Bool())
		val iTLB_fault = Input(UInt(2.W))
		val iTLB_guest = Input(Bool())
		val iTLB_gpa = Input(UInt(64.W))
		val iTLB_pte = Input(Bool())
		val dTLB_fault = Input(UInt(2.W))
		val dTLB_guest = Input(Bool())
		val dTLB_gpa = Input(UInt(64.W))
		val dTLB_pte = Input(Bool())
		// the data address of the instruction in EM is a guest virtual one
		val data_virt = Input(Bool())
		val alu_out = Input(UInt(64.W))
		val mw_enable = Input(Bool())
		val em_enable = Input(Bool())
		val de_enable = Input(Bool())
		val fd_enable = Input(Bool())
	})

	val mode = RegInit(CSR_MODE_M)				//模式寄存器
	// virtualization mode V: set while a guest runs (VS or VU mode)
	val virt = RegInit(false.B)

	val mstatus = RegInit(MstatusCsr.default)
	val misa 	= MisaCsr.default				//misa只用进行读
	val medeleg = RegInit(MedelegCsr.default)
	val mideleg = RegInit(MidelegCsr.default)
	val mie 	= RegInit(MieCsr.default)
	val mtvec	= RegInit(MtvecCsr.default)
	val mscratch= RegInit(MscratchCsr.default)
	val mepc	= RegInit(MepcCsr.default)
	val mcause 	= RegInit(McauseCsr.default)
	val mtval 	= RegInit(MtvalCsr.default)
	val mip		= RegInit(MipCsr.default)
	val mcycle	= RegInit(McycleCsr.default)
	val minstret= RegInit(MinstretCsr.default)
	val sstatus = SstatusCsr(mstatus)
	val stvec	= RegInit(StvecCsr.default)
	val sscratch= RegInit(SscratchCsr.default)
	val sepc	= RegInit(SepcCsr.default)
	val scause 	= RegInit(ScauseCsr.default)
	val stval	= RegInit(StvalCsr.default)
	val satp	= RegInit(SatpCsr.default)

	// ---- hypervisor extension ----
	// hstatus
	val h_vtsr = RegInit(false.B)		// SRET of the guest traps
	val h_vtw  = RegInit(false.B)		// WFI of the guest traps
	val h_vtvm = RegInit(false.B)		// SFENCE.VMA and satp of the guest trap
	val h_hu   = RegInit(false.B)		// HLV/HSV allowed in U mode
	val h_spvp = RegInit(false.B)		// the guest was in VS mode
	val h_spv  = RegInit(false.B)		// the trap came from a guest
	val h_gva  = RegInit(false.B)		// stval holds a guest virtual address
	val hstatus = Cat(0.U(30.W), 2.U(2.W), 0.U(9.W), h_vtsr, h_vtw, h_vtvm, 0.U(10.W),
					h_hu, h_spvp, h_spv, h_gva, 0.U(6.W))
	val hedeleg = RegInit(0.U(64.W))
	val hideleg = RegInit(0.U(64.W))
	val hcounteren = RegInit(0.U(32.W))
	val henvcfg = RegInit(0.U(64.W))
	val htval   = RegInit(0.U(64.W))
	val htinst  = RegInit(0.U(64.W))
	val mtval2  = RegInit(0.U(64.W))
	val mtinst  = RegInit(0.U(64.W))
	// hgatp: Sv39x4 or bare, no VMID; the root page table is 16 KiB
	val hgatp_mode = RegInit(0.U(4.W))
	val hgatp_ppn = RegInit(0.U(44.W))
	val hgatp = Cat(hgatp_mode, 0.U(16.W), hgatp_ppn)
	// vsstatus has the fields of sstatus
	val vs_mxr  = RegInit(false.B)
	val vs_sum  = RegInit(false.B)
	val vs_spp  = RegInit(false.B)
	val vs_spie = RegInit(false.B)
	val vs_sie  = RegInit(false.B)
	val vsstatus = Cat(0.U(30.W), 2.U(2.W), 0.U(12.W), vs_mxr, vs_sum, 0.U(9.W), vs_spp,
					0.U(2.W), vs_spie, 0.U(3.W), vs_sie, 0.U(1.W))
	val vstvec	= RegInit(StvecCsr.default)
	val vsscratch = RegInit(SscratchCsr.default)
	val vsepc	= RegInit(SepcCsr.default)
	val vscause = RegInit(ScauseCsr.default)
	val vstval	= RegInit(StvalCsr.default)
	val vsatp	= RegInit(SatpCsr.default)
	// The VS-level interrupts (bits 10, 6, 2 of mip and mie) are always
	// delegated to HS mode: these bits of mideleg read as one. hip, hie
	// and hvip show those bits; vsip and vsie show the ones hideleg hands
	// to the guest, at the supervisor positions.
	val VS_INTS = "h444".U(64.W)
	val mideleg_all = mideleg.asUInt | VS_INTS
	val vsie_value = (mie.asUInt & hideleg) >> 1
	val vsip_value = (mip.asUInt & hideleg) >> 1

	// PMP registers (no hardware enforcement yet, just storage)
	val pmpcfg0  = RegInit(0.U(64.W))
	val pmpcfg1  = RegInit(0.U(64.W))
	val pmpcfg2  = RegInit(0.U(64.W))
	val pmpcfg3  = RegInit(0.U(64.W))
	val pmpaddr  = RegInit(VecInit(Seq.fill(16)(0.U(64.W))))
	val menvcfg  = RegInit(0.U(64.W))
	val senvcfg  = RegInit(0.U(64.W))
	val mseccfg  = RegInit(0.U(64.W))
	val mcountinhibit = RegInit(0.U(64.W))
	val mcounteren = RegInit(0.U(32.W))
	val scounteren = RegInit(0.U(32.W))
	val mhpmevent = RegInit(VecInit(Seq.fill(4)(0.U(64.W))))
	val mhpmcounter = RegInit(VecInit(Seq.fill(4)(0.U(64.W))))
	val cycle 	= mcycle.asUInt
	val instret = minstret.asUInt

	//																writable
	//														readable |
	val default = 					List(0.U(64.W), false.B, false.B);
	val csrTable = Array(
		BitPat(CSR_CYCLE)		->	List(cycle, 			true.B,	false.B),
		BitPat(CSR_INSTRET) 	->	List(instret, 			true.B,	false.B),
		BitPat(CSR_SSTATUS)		->	List(sstatus.asUInt, 	true.B,	true.B),
		BitPat(CSR_SIE)			->	List(mie.asUInt & mideleg.asUInt,	true.B,	true.B),
		BitPat(CSR_STVEC)		-> 	List(stvec.asUInt,		true.B,	true.B),
		BitPat(CSR_SCOUNTEREN)	-> 	List(scounteren,			true.B,	true.B),
		BitPat(CSR_SSCRATCH)	-> 	List(sscratch.asUInt,	true.B,	true.B),
		BitPat(CSR_SEPC)		->	List(sepc.asUInt,		true.B,	true.B),
		BitPat(CSR_SCAUSE)		-> 	List(scause.asUInt,		true.B,	true.B),
		BitPat(CSR_STVAL)		->	List(stval.asUInt,		true.B,	true.B),
		BitPat(CSR_SIP)			->	List(mip.asUInt & mideleg.asUInt,	true.B,	true.B),
		BitPat(CSR_SATP)		->	List(satp.asUInt,		true.B,	true.B),
		BitPat(CSR_MVENDERID)	->	List(0.U(64.W),				true.B,	false.B),
		BitPat(CSR_MARCHID)		-> 	List(0.U(64.W),				true.B,	false.B),
		BitPat(CSR_MIMPID)		->	List(0.U(64.W),				true.B,	false.B),
		BitPat(CSR_MHARTID)		->	List(0.U(64.W),				true.B,	false.B),
		BitPat(CSR_MSTATUS)		->	List(mstatus.asUInt | MSTATUS_XL,	true.B,	true.B),
		BitPat(CSR_MISA)		->	List(misa.asUInt,		true.B,	true.B),
		BitPat(CSR_MEDELEG)		->	List(medeleg.asUInt,	true.B,	true.B),
		BitPat(CSR_MIDELEG)		->	List(mideleg_all,		true.B,	true.B),
		BitPat(CSR_MIE)			->	List(mie.asUInt,		true.B,	true.B),
		BitPat(CSR_MTVEC)		->	List(mtvec.asUInt,		true.B,	true.B),
		BitPat(CSR_MCOUNTEREN)	->	List(mcounteren,			true.B,	true.B),
		BitPat(CSR_MSCRATCH)	->	List(mscratch.asUInt,	true.B,	true.B),
		BitPat(CSR_MEPC)		->	List(mepc.asUInt,		true.B,	true.B),
		BitPat(CSR_MCAUSE)		-> 	List(mcause.asUInt,		true.B,	true.B),
		BitPat(CSR_MTVAL)		->	List(mtval.asUInt,		true.B,	true.B),
		BitPat(CSR_MIP)			->	List(mip.asUInt,		true.B,	true.B),
		BitPat(CSR_MCYCLE)		->	List(cycle,				true.B,	true.B),
		BitPat(CSR_MINSTRET)	->	List(instret,			true.B,	true.B),
		// PMP
		BitPat(CSR_PMPCFG0)		->	List(pmpcfg0,			true.B,	true.B),
		BitPat(CSR_PMPCFG1)		->	List(pmpcfg1,			true.B,	true.B),
		BitPat(CSR_PMPCFG2)		->	List(pmpcfg2,			true.B,	true.B),
		BitPat(CSR_PMPCFG3)		->	List(pmpcfg3,			true.B,	true.B),
		// envcfg / mconfigptr / counters
		BitPat(CSR_MENVCFG)		->	List(menvcfg,			true.B,	true.B),
		BitPat(CSR_SENVCFG)		->	List(senvcfg,			true.B,	true.B),
		BitPat(CSR_MSECCFG)		->	List(mseccfg,			true.B,	true.B),
		BitPat(CSR_MCONFIGPTR)	->	List(0.U(64.W),				true.B,	false.B),
		BitPat(CSR_MCOUNTINHIBIT)->	List(mcountinhibit,	true.B,	true.B),
		// no debug triggers: the registers read 0 and ignore writes
		BitPat(CSR_TSELECT)		->	List(0.U(64.W),				true.B,	true.B),
		BitPat(CSR_TDATA1)		->	List(0.U(64.W),				true.B,	true.B),
		BitPat(CSR_TDATA2)		->	List(0.U(64.W),				true.B,	true.B),
		BitPat(CSR_TDATA3)		->	List(0.U(64.W),				true.B,	true.B),
		BitPat(CSR_MCONTEXT)	->	List(0.U(64.W),				true.B,	true.B),
		// performance counters
		BitPat(CSR_MHPMEVENT3)	->	List(mhpmevent(0),		true.B,	true.B),
		BitPat(CSR_MHPMEVENT4)	->	List(mhpmevent(1),		true.B,	true.B),
		BitPat(CSR_MHPMEVENT5)	->	List(mhpmevent(2),		true.B,	true.B),
		BitPat(CSR_MHPMEVENT6)	->	List(mhpmevent(3),		true.B,	true.B),
		BitPat(CSR_MHPMCOUNTER3)->	List(mhpmcounter(0),	true.B,	true.B),
		BitPat(CSR_MHPMCOUNTER4)->	List(mhpmcounter(1),	true.B,	true.B),
		BitPat(CSR_MHPMCOUNTER5)->	List(mhpmcounter(2),	true.B,	true.B),
		BitPat(CSR_MHPMCOUNTER6)->	List(mhpmcounter(3),	true.B,	true.B),
		// hypervisor extension. There are no guest external interrupts:
		// hgeie and hgeip read 0.
		BitPat(CSR_HSTATUS)		->	List(hstatus,			true.B,	true.B),
		BitPat(CSR_HEDELEG)		->	List(hedeleg,			true.B,	true.B),
		BitPat(CSR_HIDELEG)		->	List(hideleg,			true.B,	true.B),
		BitPat(CSR_HIE)			->	List(mie.asUInt & VS_INTS,	true.B,	true.B),
		BitPat(CSR_HCOUNTEREN)	->	List(hcounteren,			true.B,	true.B),
		BitPat(CSR_HGEIE)		->	List(0.U(64.W),			true.B,	true.B),
		BitPat(CSR_HENVCFG)		->	List(henvcfg,			true.B,	true.B),
		BitPat(CSR_HTVAL)		->	List(htval,				true.B,	true.B),
		BitPat(CSR_HIP)			->	List(mip.asUInt & VS_INTS,	true.B,	true.B),
		BitPat(CSR_HVIP)		->	List(mip.asUInt & VS_INTS,	true.B,	true.B),
		BitPat(CSR_HTINST)		->	List(htinst,			true.B,	true.B),
		BitPat(CSR_HGATP)		->	List(hgatp,				true.B,	true.B),
		BitPat(CSR_HGEIP)		->	List(0.U(64.W),			true.B,	false.B),
		BitPat(CSR_MTINST)		->	List(mtinst,			true.B,	true.B),
		BitPat(CSR_MTVAL2)		->	List(mtval2,			true.B,	true.B),
		BitPat(CSR_VSSTATUS)	->	List(vsstatus,			true.B,	true.B),
		BitPat(CSR_VSIE)		->	List(vsie_value,		true.B,	true.B),
		BitPat(CSR_VSTVEC)		->	List(vstvec.asUInt,		true.B,	true.B),
		BitPat(CSR_VSSCRATCH)	->	List(vsscratch.asUInt,	true.B,	true.B),
		BitPat(CSR_VSEPC)		->	List(vsepc.asUInt,		true.B,	true.B),
		BitPat(CSR_VSCAUSE)		->	List(vscause.asUInt,	true.B,	true.B),
		BitPat(CSR_VSTVAL)		->	List(vstval.asUInt,		true.B,	true.B),
		BitPat(CSR_VSIP)		->	List(vsip_value,		true.B,	true.B),
		BitPat(CSR_VSATP)		->	List(vsatp.asUInt,		true.B,	true.B),
	) ++ (0 until 16).map(i => BitPat((0x3b0 + i).U(12.W)) -> List(pmpaddr(i), true.B, true.B))

	io.mode := mode
	io.virt := virt
	io.mstatus := mstatus.asUInt | MSTATUS_XL
	io.sstatus := sstatus.asUInt
	io.satp    := satp.asUInt
	io.vsatp   := vsatp.asUInt
	io.hgatp   := hgatp
	io.vs_sum  := vs_sum
	io.vs_mxr  := vs_mxr
	io.mprv    := mstatus.mprv
	io.mpp     := mstatus.mpp
	io.mpv     := mstatus.mpv
	io.spvp    := h_spvp

	// ---------------- the instruction in decode ----------------
	// In VS and VU mode these supervisor CSRs stand for their VS copies,
	// which have the same number with bits 9:8 changed from 1 to 2.
	val vs_alias = virt && (io.r_addr === CSR_SSTATUS || io.r_addr === CSR_SIE || io.r_addr === CSR_STVEC ||
							io.r_addr === CSR_SSCRATCH || io.r_addr === CSR_SEPC || io.r_addr === CSR_SCAUSE ||
							io.r_addr === CSR_STVAL || io.r_addr === CSR_SIP || io.r_addr === CSR_SATP)
	val r_target = Mux(vs_alias, io.r_addr ^ "h300".U(12.W), io.r_addr)
	io.r_target := r_target

	//csr这里要处理enable信号用于提示哪些流水寄存器中的信息不可用，下面每一个从io中得到的信息都要进行有效性判断
	//从csrTable获取，寄存器中存储的信息，并且得知是否可读可写
	val data :: (readable: Bool)  :: (writable: Bool) :: Nil = ListLookup(r_target, default, csrTable)		//读这里不判断有效性，因为不影响之后运行流的处理
	io.r_data := data

	//是否满足了读写寄存器的读要求,
	val instValid = MuxLookup(io.r_op, true.B, Seq(
		R	-> 	readable,
		W	->	writable,
		RW	->	(readable && writable),
		RS	->	(readable && writable),
		RC	->	(readable && writable)
	))

	val is_m = mode === CSR_MODE_M
	val is_u = mode === CSR_MODE_U
	val is_hs = mode === CSR_MODE_S && !virt

	// Bits 9:8 of a CSR number are the level that may access it: 0 user,
	// 1 supervisor, 2 hypervisor (HS mode), 3 machine. What HS mode may do
	// raises a virtual-instruction exception in a guest.
	val csr_level = io.r_addr(9, 8)
	val csr_have = Mux(is_hs, 2.U, mode)
	val csr_native_illegal = csr_level > csr_have ||
		(is_hs && mstatus.tvm && (io.r_addr === CSR_SATP || io.r_addr === CSR_HGATP))
	val csr_guest_illegal = csr_level === 3.U
	val csr_guest_virtual = csr_level === 2.U || (csr_level === 1.U && is_u) ||
		(io.r_addr === CSR_SATP && h_vtvm)
	// the counters are gated by mcounteren, by hcounteren for a guest and
	// by scounteren for user mode
	val counter = io.r_addr(4, 0)
	val is_counter = io.r_addr(11, 5) === "b1100000".U && !is_m
	val counter_virtual = is_counter && mcounteren(counter) && virt && !hcounteren(counter)
	val counter_illegal = is_counter && (!mcounteren(counter) ||
		(!counter_virtual && is_u && !scounteren(counter)))
	val csr_illegal = !instValid || Mux(virt, csr_guest_illegal, csr_native_illegal) || counter_illegal
	val csr_virtual = virt && (csr_guest_virtual || counter_virtual)

	// the privileged instructions
	val d_mret = io.d_inst === Instructions.MRET
	val d_sret = io.d_inst === Instructions.SRET
	val d_wfi = io.d_inst === Instructions.WFI
	val d_sfence = io.d_inst === Instructions.SFENCE_VMA
	val d_hfence_v = io.d_inst === Instructions.HFENCE_VVMA
	val d_hfence_g = io.d_inst === Instructions.HFENCE_GVMA
	val sys_illegal = (d_mret && !is_m) ||
		(d_sret && !virt && (is_u || (is_hs && mstatus.tsr))) ||
		(d_wfi && !is_m && (mstatus.tw || (!virt && is_u))) ||
		(d_sfence && !virt && (is_u || (is_hs && mstatus.tvm))) ||
		(d_hfence_v && !virt && is_u) ||
		(d_hfence_g && !virt && (is_u || (is_hs && mstatus.tvm))) ||
		(io.d_hlsv && !virt && is_u && !h_hu)
	val sys_virtual = virt && (
		(d_sret && (is_u || h_vtsr)) ||
		(d_wfi && (is_u || h_vtw)) ||
		(d_sfence && (is_u || h_vtvm)) ||
		d_hfence_v || d_hfence_g || io.d_hlsv)

	io.d_illegal := Mux(io.r_op =/= CSR.N, csr_illegal, sys_illegal)
	io.d_virtual := Mux(io.r_op =/= CSR.N, csr_virtual, sys_virtual)

	// ---------------- the write of the instruction in writeback ----------------
	//准备要写入csr的数据
	val csrData :: _ :: _ :: Nil = ListLookup(io.w_addr, default, csrTable)
	val csrData64 = csrData(63, 0)
	val writeEn = (io.w_op === W || io.w_op === RW || io.w_op === RC || io.w_op === RS) && io.mw_enable
	val writeData = MuxLookup(io.w_op, csrData64, Seq(
		W 	-> io.w_data,
		RW 	-> io.w_data,
		RS	-> (csrData64 | io.w_data),
		RC 	-> (csrData64 & ~io.w_data)
	))

	/*
	*	异常判断，流水线中会将异常信息前递，在非中断的情况触发异常。
	*	如果异常被委托，那么意味着，低权限在S模式下进行处理
	*	最后作一个判断，现在如果是M模式那么仍然是在M模式下处理
	*/

	//异常具体判断
	val isEcall = io.inst === Instructions.ECALL
	val isEbreak = io.inst === Instructions.EBREAK
	val iFault = io.iTLB_fault =/= 0.U
	val dFault = io.dTLB_fault =/= 0.U
	val hasExc 	= (io.is_illegal || io.is_virtual || io.inst_misalign || io.store_misalign || iFault || dFault ||
					 io.load_misalign || isEcall || isEbreak) && io.em_enable && !io.stall && !writeEn

	val ecallCause = Mux(is_m, EXC_M_ECALL, Mux(is_u, EXC_U_ECALL, Mux(virt, EXC_VS_ECALL, EXC_S_ECALL)))
	// a guest-page fault is the page fault of the guest-physical stage
	val dFaultCause = Mux(io.dTLB_fault === load_page_fault.asUInt,
							Mux(io.dTLB_guest, EXC_LOAD_GUEST_PAGE, EXC_LOAD_PAGE),
							Mux(io.dTLB_guest, EXC_STORE_GUEST_PAGE, EXC_STORE_PAGE))
	val excCause = Mux(iFault, Mux(io.iTLB_guest, EXC_INST_GUEST_PAGE, EXC_INST_PAGE),
						Mux(io.inst_misalign, EXC_INST_ADDR,
							Mux(io.is_illegal, EXC_ILL_INST,
								Mux(io.is_virtual, EXC_VIRT_INST,
									Mux(io.load_misalign, EXC_LOAD_ADDR,
										Mux(io.store_misalign, EXC_STORE_ADDR,
											Mux(dFault, dFaultCause,
												Mux(isEbreak, EXC_BRK_POINT, ecallCause)
											)
										)
									)
								)
							)
						)
					)
	// which address, if any, the exception reports
	val excOfFetch = excCause === EXC_INST_PAGE || excCause === EXC_INST_GUEST_PAGE || excCause === EXC_BRK_POINT
	val excOfData = excCause === EXC_LOAD_PAGE || excCause === EXC_STORE_PAGE ||
					excCause === EXC_LOAD_GUEST_PAGE || excCause === EXC_STORE_GUEST_PAGE ||
					excCause === EXC_LOAD_ADDR || excCause === EXC_STORE_ADDR

	// An exception is handled in M mode unless medeleg hands it to HS mode,
	// and there unless it comes from a guest and hedeleg hands it on to
	// VS mode.
	val excToM = is_m || !medeleg.asUInt(excCause(5, 0))
	val excToVS = !excToM && virt && hedeleg(excCause(5, 0))

	/*
	*	中断的判断: an interrupt is pending in mip and enabled in mie. mideleg
	*	hands it to HS mode and hideleg from there to VS mode. A mode takes
	*	its interrupts when it runs with them enabled, and always while a
	*	less privileged mode runs. M mode comes first, then HS, then VS;
	*	within one mode external, software, timer.
	*/
	val pending = mip.asUInt & mie.asUInt
	val pendingM = pending & ~mideleg_all
	val pendingHS = pending & mideleg_all & ~hideleg
	val pendingVS = pending & mideleg_all & hideleg
	val enableM = !is_m || mstatus.mie
	val enableHS = !is_m && (virt || is_u || mstatus.sie)
	val enableVS = virt && (is_u || vs_sie)
	def firstInt(p: UInt): UInt = PriorityMux(Seq(11, 3, 7, 9, 1, 5, 10, 2, 6).map(i => (p(i), i.U(63.W))))
	val intToM = enableM && pendingM.orR
	val intToHS = !intToM && enableHS && pendingHS.orR
	val intToVS = !intToM && !intToHS && enableVS && pendingVS.orR
	val hasInt = (intToM || intToHS || intToVS) && io.de_enable && !writeEn && !io.stall
	val intNumber = Mux(intToM, firstInt(pendingM), Mux(intToHS, firstInt(pendingHS), firstInt(pendingVS)))
	// the guest sees its interrupts under the supervisor numbers
	val intCause = Mux(intToVS, intNumber - 1.U, intNumber)

	val trapToM = Mux(hasInt, intToM, excToM)
	val trapToVS = Mux(hasInt, intToVS, excToVS)
	val trapToHS = !trapToM && !trapToVS

	//判断原因到底是中断还是异常
	val cause = Mux(hasInt, Cat(true.B, intCause),
							Cat(false.B, excCause))

	val excValue = Mux(hasInt, 0.U, Mux(excOfFetch, io.excPC,
							Mux(excOfData, io.alu_out,
								Mux(excCause === EXC_INST_ADDR, Cat(io.alu_out(63, 1), 0.U(1.W)),
									Mux(excCause === EXC_ILL_INST || excCause === EXC_VIRT_INST, io.inst, 0.U))
							)))
	// A guest-page fault also reports the guest physical address, shifted
	// right by 2, and in the trap instruction register that it occurred
	// on the read of a VS-stage page table entry (a 64-bit load).
	val excGuestFetch = excCause === EXC_INST_GUEST_PAGE
	val excGuestData = excCause === EXC_LOAD_GUEST_PAGE || excCause === EXC_STORE_GUEST_PAGE
	val excValue2 = Mux(hasInt, 0.U, Mux(excGuestFetch, io.iTLB_gpa >> 2,
							Mux(excGuestData, io.dTLB_gpa >> 2, 0.U)))
	val excInst = Mux(!hasInt && ((excGuestFetch && io.iTLB_pte) || (excGuestData && io.dTLB_pte)), "h3000".U(64.W), 0.U)
	// the address reported is a guest virtual address
	val excGva = !hasInt && ((excOfFetch || excCause === EXC_INST_ADDR) && virt || excOfData && io.data_virt)

	//陷入的地址判断，只有一种情况会有偏移，那就是在在向量模式并且是终端，在direct模式下永远是直接进入stvec或者mtvec的地址
	val tvec = Mux(trapToM, mtvec.asUInt, Mux(trapToVS, vstvec.asUInt, stvec.asUInt))
	val trapVec = Cat(tvec(63, 2) + Mux(tvec(0) && hasInt, intCause(61, 0), 0.U), 0.U(2.W))

	//如果有中断，会将相应的位置高, 这里由于sip是线网所以会同步更新
	mip.meip := io.extern
	mip.mtip := io.int_timer
	mip.msip := io.int_soft

	//更新计数寄存器
	mcycle.data := mcycle.data + 1.U
	when(io.retired){
		minstret.data := minstret.data + 1.U
	}

	//根据情况刷新不同阶段的流水线
	io.flush_mask := 0.U
	when(!io.stall && (!writeEn || io.isSret || io.isMret)){
		when(hasInt && !hasExc && !io.isSret && !io.isMret){
			io.flush_mask := "b0111".U
		}.elsewhen(hasInt && (hasExc || io.isMret || io.isSret)){											//&& !hasExc && !io.isMret && !io.isSret
			io.flush_mask := "b1111".U
		}.elsewhen(hasExc){
			io.flush_mask := "b1111".U
		}.elsewhen(io.isSret || io.isMret){
			io.flush_mask := "b0111".U
		}
	}

	//exceptions and interrupts handling
	val interrupt_return_addr = Mux(io.em_enable && !hasExc && !io.isSret && !io.isMret && io.jump_taken, io.jump_addr,
									Mux(io.em_enable && (hasExc || io.isSret || io.isMret), io.excPC, io.de_pipe_reg_pc))
	val trapPC = Mux(hasInt, interrupt_return_addr, io.excPC)

	/*
	*	特权级判断: a trap enters M, HS or VS mode. SRET returns to the mode in
	*	sstatus.SPP and hstatus.SPV, or inside a guest to the one in
	*	vsstatus.SPP; MRET to the mode in mstatus.MPP and MPV.
	* 	优先中断，其次exception，最后是ret
	*/
	when(!io.stall){
		when(writeEn){
			when(io.w_addr === CSR_SSTATUS){
				mstatus.mxr := writeData(19)
				mstatus.sum := writeData(18)
				mstatus.spp := writeData(8)
				mstatus.spie := writeData(5)
				mstatus.sie := writeData(1)
			}
			when(io.w_addr === CSR_SIE){
				when(mideleg.asUInt(9)){ mie.seie := writeData(9) }
				when(mideleg.asUInt(5)){ mie.stie := writeData(5) }
				when(mideleg.asUInt(1)){ mie.ssie := writeData(1) }
			}
			when(io.w_addr === CSR_SIP){
				when(mideleg.asUInt(1)){ mip.ssip := writeData(1) }
			}
			when(io.w_addr === CSR_MCOUNTEREN){ mcounteren := writeData(31, 0) }
			when(io.w_addr === CSR_SCOUNTEREN){ scounteren := writeData(31, 0) }
			when(io.w_addr === CSR_MCYCLE){ mcycle <= writeData }
			when(io.w_addr === CSR_MINSTRET){ minstret <= writeData }
			when(io.w_addr === CSR_STVEC){ stvec <= writeData }
			when(io.w_addr === CSR_SSCRATCH){ sscratch <= writeData }
			when(io.w_addr === CSR_SEPC){ sepc <= writeData }
			when(io.w_addr === CSR_SCAUSE){ scause <= writeData }
			when(io.w_addr === CSR_STVAL){ stval <= writeData }
			when(io.w_addr === CSR_SATP && (writeData(63, 60) === 8.U || writeData(63, 60) === 0.U)){ satp <= writeData }
			when(io.w_addr === CSR_MSTATUS){ mstatus <= writeData }
			when(io.w_addr === CSR_MEDELEG){ medeleg <= writeData }
			when(io.w_addr === CSR_MIDELEG){ mideleg <= writeData }
			when(io.w_addr === CSR_MIE){ mie <= writeData }
			// the machine-level pending bits are driven by the platform; of
			// the VS-level bits only the software interrupt is writable here
			when(io.w_addr === CSR_MIP){
				mip.seip := writeData(9)
				mip.stip := writeData(5)
				mip.vssip := writeData(2)
				mip.ssip := writeData(1)
			}
			when(io.w_addr === CSR_MTVEC){ mtvec <= writeData }
			when(io.w_addr === CSR_MSCRATCH){ mscratch <= writeData }
			when(io.w_addr === CSR_MEPC){ mepc <= writeData }
			when(io.w_addr === CSR_MCAUSE){ mcause <= writeData }
			when(io.w_addr === CSR_MTVAL){ mtval <= writeData }
			when(io.w_addr === CSR_PMPCFG0){ pmpcfg0 := writeData }
			when(io.w_addr === CSR_PMPCFG1){ pmpcfg1 := writeData }
			when(io.w_addr === CSR_PMPCFG2){ pmpcfg2 := writeData }
			when(io.w_addr === CSR_PMPCFG3){ pmpcfg3 := writeData }
			for(i <- 0 until 16){
				when(io.w_addr === ("h3b0".U(12.W) + i.U)){
					pmpaddr(i) := writeData
				}
			}
			when(io.w_addr === CSR_MENVCFG){ menvcfg := writeData }
			when(io.w_addr === CSR_SENVCFG){ senvcfg := writeData }
			when(io.w_addr === CSR_MSECCFG){ mseccfg := writeData }
			when(io.w_addr === CSR_MCOUNTINHIBIT){ mcountinhibit := writeData }
			when(io.w_addr === CSR_MHPMEVENT3){ mhpmevent(0) := writeData }
			when(io.w_addr === CSR_MHPMEVENT4){ mhpmevent(1) := writeData }
			when(io.w_addr === CSR_MHPMEVENT5){ mhpmevent(2) := writeData }
			when(io.w_addr === CSR_MHPMEVENT6){ mhpmevent(3) := writeData }
			when(io.w_addr === CSR_MHPMCOUNTER3){ mhpmcounter(0) := writeData }
			when(io.w_addr === CSR_MHPMCOUNTER4){ mhpmcounter(1) := writeData }
			when(io.w_addr === CSR_MHPMCOUNTER5){ mhpmcounter(2) := writeData }
			when(io.w_addr === CSR_MHPMCOUNTER6){ mhpmcounter(3) := writeData }

			// hypervisor extension
			when(io.w_addr === CSR_HSTATUS){
				h_vtsr := writeData(22)
				h_vtw := writeData(21)
				h_vtvm := writeData(20)
				h_hu := writeData(9)
				h_spvp := writeData(8)
				h_spv := writeData(7)
				h_gva := writeData(6)
			}
			// HS mode keeps its own ecalls, those of VS mode, guest-page
			// faults and virtual-instruction exceptions
			when(io.w_addr === CSR_HEDELEG){ hedeleg := writeData & "hb1ff".U }
			when(io.w_addr === CSR_HIDELEG){ hideleg := writeData & VS_INTS }
			when(io.w_addr === CSR_HIE){
				mie.vseie := writeData(10)
				mie.vstie := writeData(6)
				mie.vssie := writeData(2)
			}
			when(io.w_addr === CSR_VSIE){
				when(hideleg(10)){ mie.vseie := writeData(9) }
				when(hideleg(6)){ mie.vstie := writeData(5) }
				when(hideleg(2)){ mie.vssie := writeData(1) }
			}
			when(io.w_addr === CSR_HIP){ mip.vssip := writeData(2) }
			// hvip is how a hypervisor raises the interrupts of its guest
			when(io.w_addr === CSR_HVIP){
				mip.vseip := writeData(10)
				mip.vstip := writeData(6)
				mip.vssip := writeData(2)
			}
			when(io.w_addr === CSR_VSIP){
				when(hideleg(2)){ mip.vssip := writeData(1) }
			}
			when(io.w_addr === CSR_HCOUNTEREN){ hcounteren := writeData(31, 0) }
			when(io.w_addr === CSR_HENVCFG){ henvcfg := writeData & 1.U }
			when(io.w_addr === CSR_HTVAL){ htval := writeData }
			when(io.w_addr === CSR_HTINST){ htinst := writeData }
			when(io.w_addr === CSR_MTVAL2){ mtval2 := writeData }
			when(io.w_addr === CSR_MTINST){ mtinst := writeData }
			// a write that selects an unsupported mode leaves the mode unchanged
			when(io.w_addr === CSR_HGATP){
				when(writeData(63, 60) === 8.U || writeData(63, 60) === 0.U){ hgatp_mode := writeData(63, 60) }
				hgatp_ppn := Cat(writeData(43, 2), 0.U(2.W))
			}
			when(io.w_addr === CSR_VSSTATUS){
				vs_mxr := writeData(19)
				vs_sum := writeData(18)
				vs_spp := writeData(8)
				vs_spie := writeData(5)
				vs_sie := writeData(1)
			}
			when(io.w_addr === CSR_VSTVEC){ vstvec <= writeData }
			when(io.w_addr === CSR_VSSCRATCH){ vsscratch <= writeData }
			when(io.w_addr === CSR_VSEPC){ vsepc <= writeData }
			when(io.w_addr === CSR_VSCAUSE){ vscause <= writeData }
			when(io.w_addr === CSR_VSTVAL){ vstval <= writeData }
			when(io.w_addr === CSR_VSATP && (writeData(63, 60) === 8.U || writeData(63, 60) === 0.U)){ vsatp <= writeData }
		}.elsewhen(hasInt || hasExc){
			when(trapToVS){
				vsepc 	<= trapPC
				vscause <= cause
				vstval 	<= excValue
				vs_spie := vs_sie
				vs_sie := false.B
				vs_spp := mode(0)
				mode := CSR_MODE_S
			}.elsewhen(trapToHS){
				sepc 	<= trapPC
				scause 	<= cause
				stval 	<= excValue
				htval 	:= excValue2
				htinst 	:= excInst
				mstatus.spie := mstatus.sie
				mstatus.sie := false.B
				mstatus.spp := mode(0)
				h_spv := virt
				h_gva := excGva
				// SPVP follows SPP, but only for a trap that leaves a guest
				when(virt){ h_spvp := mode(0) }
				virt := false.B
				mode := CSR_MODE_S
			}.otherwise{
				mepc 	<= trapPC
				mcause  <= cause
				mtval 	<= excValue
				mtval2 	:= excValue2
				mtinst 	:= excInst
				mstatus.mpie := mstatus.mie
				mstatus.mie := false.B
				mstatus.mpp := mode
				mstatus.mpv := virt
				mstatus.gva := excGva
				virt := false.B
				mode := CSR_MODE_M
			}
		}.elsewhen(io.isSret && io.em_enable){
			when(virt){
				// inside a guest SRET works on vsstatus
				vs_sie := vs_spie
				vs_spie := true.B
				vs_spp := false.B
				mode := Cat(false.B, vs_spp)
			}.otherwise{
				mstatus.sie := mstatus.spie									//
				mstatus.spie := true.B										//
				mstatus.spp	:= false.B										//spp只有一位可以直接赋值为false
				mstatus.mprv := false.B
				mode := Cat(false.B, mstatus.spp)
				virt := h_spv
				h_spv := false.B
			}
		}.elsewhen(io.isMret && io.em_enable){
			mstatus.mie := mstatus.mpie
			mstatus.mpie := true.B
			mstatus.mpp := CSR_MODE_U									//mpp有两位
			mstatus.mpv := false.B
			when(mstatus.mpp =/= CSR_MODE_M){ mstatus.mprv := false.B }
			mode := mstatus.mpp
			virt := mstatus.mpv && mstatus.mpp =/= CSR_MODE_M
		}
	}

	io.trapVec := Mux(hasInt || hasExc, trapVec,
					Mux(io.isMret, mepc.asUInt, Mux(virt, vsepc.asUInt, sepc.asUInt)
						)
					)

	io.trap := (((hasExc && io.em_enable) || hasInt) && !io.stall && !writeEn) ||
				((io.isSret || io.isMret) && io.em_enable && !io.stall)
	io.trap_valid := (hasInt || hasExc) && !io.stall && !writeEn
	io.trap_cause := cause
	io.trap_epc := trapPC
	io.trap_tval := excValue
	io.trap_tval2 := excValue2
	io.trap_tinst := excInst
}

package myCPU
import chisel3._ 
import chisel3.util._ 
import Control._
import CSR_OP._ 

object ExceptCause{

	val EXC_S_SOFT_INT = 1.U(63.W)		//s模式软件中断
	val EXC_M_SOFT_INT = 3.U(63.W)		//m模式软件中断
	val EXC_S_TIMER_INT = 5.U(63.W)		//s模式时钟中断，应该是不存在的
	val EXC_M_TIMER_INT = 7.U(63.W)		//m模式时钟中断
	val EXC_S_EXT_INT = 9.U(63.W)		//s模式外部中断
	val EXC_M_EXT_INT = 11.U(63.W)		//m模式外部中断

	val EXC_INST_ADDR = 0.U(63.W)		//取指非对齐异常
	val EXC_ILL_INST = 2.U(63.W)		//非法指令异常
	val EXC_BRK_POINT = 3.U(63.W)		//ebreak异常
	val EXC_LOAD_ADDR = 4.U(63.W)		//load非对齐
	val EXC_STORE_ADDR = 6.U(63.W)		//store非对齐
	val EXC_U_ECALL = 8.U(63.W)			//ecall异常
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

		val w_op = Input(UInt(3.W))			//csr_cmd op
		val w_addr = Input(UInt(12.W))		//要写的地址
		val w_data = Input(UInt(64.W))		//要些的数据
		val retired = Input(Bool()) 		

//		val hasTrap = Input(Bool())
//		val stall = Input(Bool())			//流水线暂停
//		val csr_cmd = Input(UInt(3.W))			
		val inst = Input(UInt(32.W))		//指令本身

		val illegal_inst = Input(UInt(32.W))
		val inst_mode = Input(UInt(2.W))

		val int_timer = Input(Bool())		//时钟中断信号
		val int_soft = Input(Bool())		//软件中断信号
		val extern = Input(Bool())			//外部中断信号

		val fetch_misalign = Input(Bool())
		val load_misalign = Input(Bool())
		val store_misalign = Input(Bool())
//		val illegal_inst = Input(Bool())		//illeagal异常也包含了特权级的错误，不过为了区分发生的阶段，定义了两个信号
//		val privilege_exception = Input(Bool())

//		val hasException = Input(Bool())	//外部输入的是否陷入的信号

		val jump_addr = Input(UInt(64.W))
		val jump_taken = Input(Bool())

		val isSret = Input(Bool())			//输入的是否是sret的信号
		val isMret = Input(Bool())			//输入的是否是mret的信号

		val pc_fetch_misalign = Input(UInt(64.W))
		val load_misalign_addr = Input(UInt(64.W))
		val store_misalign_addr = Input(UInt(64.W))
		val ebreak_addr = Input(UInt(64.W))
//		val excCause = Input(UInt(63.W))	//异常例外输入
		val excPC = Input(UInt(64.W))		//异常pc的输入
		val excValue = Output(UInt(64.W))	//异常value

		val trapVec = Output(UInt(64.W))
		val stall = Input(Bool())
		val trap = Output(Bool())

		val fd_enable = Input(Bool())
		val de_enable = Input(Bool())
		val em_enable = Input(Bool())
		val mw_enable = Input(Bool())
		//val hasInt = Output(Bool())		//输出是否中断
		//val sepc = Output(Bool())			//输出s模式的exception pc
		//val mepc = Output(Bool())			//输出m模式的exception pc
		//val trapVec = Output(UInt(64.W))	//陷入的向量
	})

	val mode = RegInit(CSR_MODE_M)				//模式寄存器

//	val csr_addr = io.inst(31, 20)			//csr寄存器访问地址
//	val rs1_addr = io.inst(19, 15)			//源寄存器操作数

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
	//val mip 	= MipCsr.default				//mip只是wire
	val mcycle	= RegInit(McycleCsr.default)
	val minstret= RegInit(MinstretCsr.default)
	val sstatus = SstatusCsr(mstatus)
	val sie		= SieCsr(mie)			//sie只是wire
	val sip		= SipCsr(mip)			//sip只是wire
	val stvec	= RegInit(StvecCsr.default)
	val sscratch= RegInit(SscratchCsr.default)
	val sepc	= RegInit(SepcCsr.default)
	val scause 	= RegInit(ScauseCsr.default)
	val stval	= RegInit(StvalCsr.default)
	val satp	= RegInit(SatpCsr.default)
	val cycle 	= mcycle.asUInt
	val instret = minstret.asUInt


	//																writable				
	//														readable |
	val default = 					List(0.U, 				false.B,false.B);
	val csrTable = Array(
		BitPat(CSR_CYCLE)		->	List(cycle, 			true.B,	false.B),
		BitPat(CSR_INSTRET) 	->	List(instret, 			true.B,	false.B),
		BitPat(CSR_SSTATUS)		->	List(sstatus.asUInt, 	true.B,	true.B),
		BitPat(CSR_SIE)			->	List(sie.asUInt,		true.B,	true.B),
		BitPat(CSR_STVEC)		-> 	List(stvec.asUInt,		true.B,	true.B),
		BitPat(CSR_SCOUNTEREN)	-> 	List(0.U,				true.B,	true.B),
		BitPat(CSR_SSCRATCH)	-> 	List(sscratch.asUInt,	true.B,	true.B),
		BitPat(CSR_SEPC)		->	List(sepc.asUInt,		true.B,	true.B),
		BitPat(CSR_SCAUSE)		-> 	List(scause.asUInt,		true.B,	true.B),
		BitPat(CSR_STVAL)		->	List(stval.asUInt,		true.B,	true.B),
		BitPat(CSR_SIP)			->	List(sip.asUInt,		true.B,	true.B),
		BitPat(CSR_SATP)		->	List(satp.asUInt,		true.B,	true.B),
		BitPat(CSR_MVENDERID)	->	List(0.U,				true.B,	false.B),
		BitPat(CSR_MARCHID)		-> 	List(0.U,				true.B,	false.B),
		BitPat(CSR_MIMPID)		->	List(0.U,				true.B,	false.B),
		BitPat(CSR_MHARTID)		->	List(0.U,				true.B,	false.B),
		BitPat(CSR_MSTATUS)		->	List(mstatus.asUInt,	true.B,	true.B),
		BitPat(CSR_MISA)		->	List(misa.asUInt,		true.B,	false.B),
		BitPat(CSR_MEDELEG)		->	List(medeleg.asUInt,	true.B,	true.B),
		BitPat(CSR_MIDELEG)		->	List(mideleg.asUInt,	true.B,	true.B),
		BitPat(CSR_MIE)			->	List(mie.asUInt,		true.B,	true.B),
		BitPat(CSR_MTVEC)		->	List(mtvec.asUInt,		true.B,	true.B),
		BitPat(CSR_MCOUNTEREN)	->	List(0.U,				true.B,	true.B),
		BitPat(CSR_MSCRATCH)	->	List(mscratch.asUInt,	true.B,	true.B),
		BitPat(CSR_MEPC)		->	List(mepc.asUInt,		true.B,	true.B),
		BitPat(CSR_MCAUSE)		-> 	List(mcause.asUInt,		true.B,	true.B),
		BitPat(CSR_MTVAL)		->	List(mtval.asUInt,		true.B,	true.B),
		BitPat(CSR_MIP)			->	List(mip.asUInt,		true.B,	true.B),
		BitPat(CSR_MCYCLE)		->	List(cycle,				true.B,	true.B),
		BitPat(CSR_MINSTRET)	->	List(instret,			true.B,	true.B),
	)

	//csr这里要处理enable信号用于提示哪些流水寄存器中的信息不可用，下面每一个从io中得到的信息都要进行有效性判断

	//从csrTable获取，寄存器中存储的信息，并且得知是否可读可写
	val data :: (readable: Bool)  :: (writable: Bool) :: Nil = ListLookup(io.r_addr, default, csrTable)		//读这里不判断有效性，因为不影响之后运行流的处理

	//是否满足了读写寄存器的读要求, 
	val instValid = MuxLookup(io.r_op, true.B, Seq(
		R	-> 	readable,
		W	->	writable,
		RW	->	(readable && writable),
		RS	->	(readable && writable),
		RC	->	(readable && writable)
	)) || (~io.fd_enable)

	//这个是illegal指令的判断
//	printf(p"csr_mode:${io.r_addr(9, 8)}  inst_mode:${io.inst_mode}\n")
	val modeValid = ((io.r_addr(9,8) <= mode) && (io.inst_mode <= mode)) ||	(~io.fd_enable) //模式判断，总共12位地址8，9两位是特权位
	val valid = instValid && (modeValid || (io.r_op === CSR.N))								//访问方式和权限两重判断
	io.r_data := data

	//准备要写入csr的数据
	val csrData :: _ :: _ :: Nil = ListLookup(io.w_op, default, csrTable)
	val writeEn = (io.w_op === W || io.w_op === RW || io.w_op === RC || io.w_op === RS) && io.mw_enable
	val writeData = MuxLookup(io.w_op, 0.U, Seq(
		W 	-> io.w_data,
		RW 	-> io.w_data,
		RS	-> (csrData | io.w_data),
		RC 	-> (csrData & ~io.w_data)
	))


	//中断的判断
	val flagIntS = sip.asUInt & sie.asUInt 					//s模式中断判断，对应的中断使能并且sip中该位已经挂起
	val flagIntM = mip.asUInt & mie.asUInt 					//M模式中断判断

	/*
	*	是否是s和m模式的中断，还要考虑相关的csr寄存器：
	* 	1. 陷入S，特权级小于S或者在S模式下但是对应的mstatus的全局sie打开 ，最后做一个委托的判断
	* 	2. 陷入M，当前特权级小于M或者在M特权下mie打开，最后作一个非委托判断
	*/

	//判断中断的flag位是否能生效
	val hasIntS  = Mux(mode < CSR_MODE_S || (mode === CSR_MODE_S && mstatus.sie), (flagIntS & mideleg.asUInt).orR, false.B)
	val hasIntM	 = Mux(mode <= CSR_MODE_S || mstatus.mie, (flagIntS & ~mideleg.asUInt).orR, false.B)
	val hasInt = hasIntM || hasIntS
	//是否是S模式的中断
	val handIntS = hasInt && !hasIntM

	/*
	*	异常判断，流水线中会将异常信息前递，在非中断的情况触发异常。
	*	如果异常被委托，那么意味着，低权限在S模式下进行处理
	*	最后作一个判断，现在如果是M模式那么仍然是在M模式下处理
	*/

	//异常具体判断
//	printf(p"valid:${valid} illegal_inst:${(io.illegal_inst.orR || io.fetch_misalign) && io.fd_enable} ls_misalign:${(io.load_misalign || io.store_misalign) && io.de_enable}\n")
	val hasExc 	= !hasInt && ((!valid) || ((io.illegal_inst.orR || io.fetch_misalign) && io.fd_enable)
							|| ((io.load_misalign || io.store_misalign) && io.de_enable) 
							|| ((io.inst === Instructions.ECALL || io.inst === Instructions.EBREAK) && io.mw_enable))


	val excCause = 	Mux(io.inst === Instructions.ECALL, EXC_U_ECALL, 
						Mux(io.inst === Instructions.EBREAK, EXC_BRK_POINT,
							Mux(io.load_misalign, EXC_LOAD_ADDR,  
								Mux(io.store_misalign, EXC_STORE_ADDR,
						 			Mux((!valid) || (io.illegal_inst =/= 0.U), EXC_ILL_INST, io.fetch_misalign)
								)
							)
						)
					)

	val hasExcS = hasExc && medeleg.asUInt(excCause(4,0))
	val handExcS = !mode(1) && hasExcS		//这里是想说明M模式下是无论如何都不会到S模式进行处理的

	/*
	*	作一个仲裁判断，flagIntS，都是sip和sie的想与的结果，优先级为外部中断，大于软件中断，
	*	最后大于时钟中断
	*	M模式作类似的判断，但是M模式的优先级大于S模式
	*/
	val intCauseS = Mux(flagIntS(EXC_S_EXT_INT), EXC_S_EXT_INT,
						Mux(flagIntS(EXC_S_SOFT_INT), EXC_S_SOFT_INT,
													EXC_S_TIMER_INT))
	
	val intCause = Mux(flagIntM(EXC_M_EXT_INT), EXC_M_EXT_INT,
						Mux(flagIntM(EXC_M_SOFT_INT), EXC_M_SOFT_INT,
							Mux(flagIntM(EXC_M_TIMER_INT), EXC_M_TIMER_INT,intCauseS)	
						)
					)

	//判断原因到底是中断还是异常
	val cause = Mux(hasInt, Cat(true.B, intCause),
							Cat(false.B, excCause))

	//根据情况刷新不同阶段的流水线						
	when(hasInt || ((io.isMret || io.isSret) && io.mw_enable)){
		io.flush_mask := "b1111".U
	}.elsewhen(hasExc){
		io.flush_mask := Mux((excCause === EXC_U_ECALL) || (excCause === EXC_BRK_POINT), "b1111".U,
			Mux((excCause === EXC_LOAD_ADDR) || (excCause === EXC_STORE_ADDR), "b0111".U,
				Mux(excCause === EXC_ILL_INST, "b0011".U, 
					Mux(excCause === EXC_INST_ADDR, "b0011".U, "b0".U)
				)
			)		
		)
	}.otherwise{
		io.flush_mask := 0.U
	}
	
	io.excValue := Mux(excCause === EXC_LOAD_ADDR ,io.load_misalign_addr,
						Mux(excCause === EXC_STORE_ADDR, io.store_misalign_addr, 
							Mux(excCause === EXC_BRK_POINT, io.ebreak_addr,
								Mux(excCause === EXC_INST_ADDR, io.pc_fetch_misalign,
									Mux(excCause === EXC_ILL_INST, io.illegal_inst, 0.U))
							)
						)
					) 


	//陷入的地址判断，只有一种情况会有偏移，那就是在在向量模式并且是终端，在direct模式下永远是直接进入stvec或者mtvec的地址
	val trapVecS = Mux(stvec.mode(0) && hasInt, (stvec.base + cause(29, 0)), stvec.base) << 2
	val trapVecM = Mux(mtvec.mode(0) && hasInt, (mtvec.base + cause(29, 0)), mtvec.base) << 2
	val trapVec = Mux(handIntS || handExcS, trapVecS, trapVecM)

	/*
	*	特权级判断， interrput可以陷入s模式和m模式。异常也是如此，s模式的异常进入s模式进行处理，m模式的异常进入m模式进行处理
	* 	sret，可以从spp中获取之前的优先级； mret,可以从mpp中获取之前的特权级。
	* 	最后进入一个仲裁，优先中断，其次ret，最后是exception
	*/

	val intMode = Mux(handIntS, CSR_MODE_S, CSR_MODE_M)
	val sretMode = Cat(false.B, sstatus.spp)
	val mretMode = mstatus.mpp
	val excMode = Mux(handExcS, CSR_MODE_S, CSR_MODE_M)
	val trapMode = Mux(hasInt, intMode, 
					Mux(io.isSret, sretMode,
					Mux(io.isMret, mretMode, excMode)))
	val nextMode = Mux((hasInt || hasExc) & !writeEn, trapMode, mode)
	mode := nextMode

	//如果有中断，会将相应的位置高, 这里由于sip是线网所以会同步更新				
	mip.meip := mip.meip | io.extern		
	mip.seip := mip.seip | io.extern
	mip.mtip := mip.mtip | io.int_timer
	mip.stip := mip.mtip | io.int_timer
	mip.msip := mip.msip | io.int_soft
	mip.ssip := mip.ssip | io.int_soft
	sip.seip := mip.seip
	sip.stip := mip.stip
	sip.ssip := mip.ssip
	sie.castAssign(MieCsr(), mie.asUInt)

	//更新计数寄存器
	mcycle.data := mcycle.data + 1.U 
	when(io.retired){
		minstret.data := minstret.data + 1.U
	}


	//exceptions and interrupts handling
	when(writeEn && !io.stall){
		when(io.w_addr === CSR_SSTATUS){ mstatus.castAssign(SstatusCsr(), writeData)}
		when(io.w_addr === CSR_SIE){ mie.castAssign(SieCsr(), writeData) }
		when(io.w_addr === CSR_SIP){ mip.castAssign(SipCsr(), writeData) }
		when(io.w_addr === CSR_MCYCLE){ mcycle <= writeData }
		when(io.w_addr === CSR_MINSTRET){ minstret <= writeData }
		when(io.w_addr === CSR_STVEC){ stvec <= writeData }
		when(io.w_addr === CSR_SSCRATCH){ sscratch <= writeData }
		when(io.w_addr === CSR_SEPC){ sepc <= writeData }
		when(io.w_addr === CSR_SCAUSE){ scause <= writeData }
		when(io.w_addr === CSR_STVAL){ stval <= writeData }
		//when(io.w_addr === CSR_SATP){ stap := writeData }
		when(io.w_addr === CSR_MSTATUS){ mstatus <= writeData }
		when(io.w_addr === CSR_MEDELEG){ medeleg <= writeData }
		when(io.w_addr === CSR_MIDELEG){ mideleg <= writeData }
		when(io.w_addr === CSR_MIE){ mie <= writeData }
		when(io.w_addr === CSR_MTVEC){ mtvec <= writeData }
		when(io.w_addr === CSR_MSCRATCH){ mscratch <= writeData }
		when(io.w_addr === CSR_MEPC){ mepc <= writeData }
		when(io.w_addr === CSR_MCAUSE){ mcause <= writeData }
		when(io.w_addr === CSR_MTVAL){ mtval <= writeData }
		//when(io.w_addr === CSR_MIP){ mipReal := writeData }
	}.elsewhen((hasExc || hasInt || ((io.isSret || io.isMret) && io.mw_enable)) && !io.stall){
		when(io.isSret){
			mstatus.sie := mstatus.spie
			mstatus.spie := true.B
			mstatus.spp	:= false.B						//spp只有一位可以直接赋值为false
		}.elsewhen(io.isMret){
			mstatus.mie := mstatus.mpie
			mstatus.mpie := true.B
			mstatus.mpp := CSR_MODE_U					//mpp有两位
		}.elsewhen(handIntS || handExcS){
			sepc 	<= Mux(io.jump_taken, io.jump_addr, io.excPC + 4.U)	//考虑跳转指令时发生中断的情况
			scause 	<= cause
			stval 	<= io.excValue
			mstatus.spie := mstatus.sie					//
			mstatus.sie := false.B
			mstatus.spp := mode(0)
		}.otherwise{
			mepc <= io.excPC
			mcause <= cause
			mtval <= io.excValue
			mstatus.mpie := mstatus.mie
			mstatus.mie := false.B
			mstatus.mpp := mode
		}
		
	}

	//io.hasInt := hasInt
	//io.busy := writeEn
	//io.mode := mode
	//io.sepc := sepc.asUInt
	//io.mepc := mepc.asUInt
	io.trapVec := trapVec
//	printf(p"hasExc:${hasExc} hasInt:${hasInt} isSret:${io.isSret} isMret:${io.isMret}\n")
	io.trap := hasExc || hasInt || ((io.isSret || io.isMret) && io.mw_enable)
	//io.pageEn   := !mode(1) && satp.mode
	//io.basePpn  := satp.ppn
	//io.sum      := mstatus.sum
}
//CSR寄存器说明，
package myCPU
import chisel3._
import chisel3.util._ 

//mtime, msip, mtimecmp 在clint里单独实现

//const for base csr command
object CSR_OP{
	val CSR_OP_WIDTH = log2Ceil(4)
	
	val CSR_NOP = 0.U(CSR_OP_WIDTH.W)	//nop
	val CSR_RW  = 1.U(CSR_OP_WIDTH.W)	//read and write
	val CSR_RS 	= 2.U(CSR_OP_WIDTH.W)	//read and set
	val CSR_RC 	= 3.U(CSR_OP_WIDTH.W)	//read and clear
}

abstract class CSR_Bundle extends Bundle{
	//this的getWidth会获取Bundle宽度的和
	protected def requireWidth(data: UInt) = require(data.getWidth == getWidth, "Data width must equal to CSR width")

	//重载操作符
	def <=(data: UInt) = {
		requireWidth(data)
		this := data.asTypeOf(this)		//将UInt转化为对应的bundle
	}

	def castAssign[T <: CSR_Bundle](that: T, data: UInt) = {	//将UInt转化为that类型，最后将其使用重载<=赋值给this
		val tmp = 0.U.asTypeOf(that)		
		tmp <= data
		this <= tmp.asUInt
	}
}

trait CSR_Object[T <: CSR_Bundle]{							//trait
	def apply(): T
	def default():T = 0.U.asTypeOf(apply())					//声明一个为0的初始值

	def apply[U <: Data](data: U): T = {					//工厂方法生成一个对应的CSR寄存器，并初始化赋值
		val init = default()
		init <= data.asUInt
		init
	}
}

class SieCsr extends CSR_Bundle{
	val wpri0 	= UInt(54.W)
	val seie 	= Bool()
	val wpri1 	= UInt(3.W)
	val stie 	= Bool()
	val wpri2 	= UInt(3.W)
	val ssie 	= Bool()
	val wpri3 	= Bool()

	override def <=(data: UInt) = {					//只考虑我们想要的值
		requireWidth(data)
		wpri0	:= 0.U(54.W)
		seie 	:= data(9)
		wpri1 	:= 0.U(3.W)
		stie 	:= data(5)
		wpri2 	:= 0.U(3.W)
		ssie 	:= data(1)
	}
}

object SieCsr extends CSR_Object[SieCsr]{
	def apply() = new SieCsr						//重写了apply方法
}

// supervisor status register
class SstatusCsr extends CSR_Bundle{	//继承了Csr_Bundle会有自动检查宽度的函数requireWidth，在初始化时进行宽度检查
	val sd 		= Bool()
	val wpri0	= UInt(29.W)
	val uxl		= UInt(2.W)
	val wpri1 	= UInt(12.W)
	val mxr 	= Bool()
	val sum 	= Bool()
	val wpri2 	= Bool()
	val xs 		= UInt(2.W)
	val fs 		= UInt(2.W)
	val wpri3 	= UInt(4.W)
	val spp 	= Bool()
	val wpri4	= Bool()
	val ube 	= Bool()
	val spie 	= Bool()
	val wpri5 	= UInt(3.W)
	val sie 	= Bool()
	val wpri6 	= Bool()

	override def <=(data: UInt) = {		//重写<=，只将我们需要的部分赋值
		requireWidth(data)
		sd   	:= data(63)
		wpri0 	:= 0.U(29.W)
		uxl		:= 0.U(1.W)
		wpri1	:= 0.U(12.W)
		mxr 	:= 0.U(1.W)
		sum  	:= data(18)
		wpri2	:= 0.U(1.W)
		xs		:= 0.U(2.W)
		fs		:= 0.U(2.W)
		wpri3	:= 0.U(4.W)
		spp	 	:= data(8)
		wpri4	:= 0.U(1.W)
		ube 	:= 0.U(1.W)
		spie 	:= data(5)
		wpri5 	:= 0.U(3.W)
		sie  	:= data(1)
		wpri6	:= 0.U(1.W)
	}
}

object SstatusCsr extends CSR_Object[SstatusCsr]{
	def apply() = new SstatusCsr					//继承一个trait，重写了apply方法
}


class SipCsr extends CSR_Bundle{
	val wpri0 	= UInt(54.W)
	val seip 	= Bool()
	val wpri1 	= UInt(3.W)
	val stip 	= Bool()
	val wpri2 	= UInt(3.W)
	val ssip 	= Bool()
	val wpri3 	= Bool()

	override def <= (data: UInt) = {				//除了sip使用machine mode的对应位
		requireWidth(data)
		wpri0	:= 0.U(54.W)
		seip 	:= data(9)
		wpri1	:= 0.U(3.W)
		stip 	:= data(5)
		wpri2 	:= 0.U(3.W)
		ssip 	:= data(1)
		wpri3 	:= 0.U(1.W)
	}
}

object SipCsr extends CSR_Object[SipCsr]{			
	def apply() = new SipCsr
}

class StvecCsr extends CSR_Bundle{
	val base 	= UInt(62.W)
	val mode 	= UInt(2.W)

	override def <= (data: UInt) = {
		requireWidth(data)
		base := data(63,2)			
		mode := data(0)							//direct or offset
	}
}

object StvecCsr extends CSR_Object[StvecCsr]{
	def apply() = new StvecCsr
}

class SscratchCsr extends CSR_Bundle{
	val data = UInt(64.W)

	override def <= (d: UInt) = {
		data := d
	}
}

object SscratchCsr extends CSR_Object[SscratchCsr]{
	def apply() = new SscratchCsr
}

class SepcCsr extends CSR_Bundle{
	val data = UInt(64.W)

	override def <= (d: UInt) = {
		data := Cat(d(63,2), 0.U(2.W))		  //sepc将低两位置0
	}
}

object SepcCsr extends CSR_Object[SepcCsr] {
	def apply() = new SepcCsr
}

// supervisor exception cause register
class ScauseCsr extends CSR_Bundle {
  val int   = Bool()
  val code  = UInt(63.W)

  override def <=(data: UInt) = {
    requireWidth(data)
    int   := data(63)
    code  := Cat(0.U(59.W), data(3, 0))
  }
}

object ScauseCsr extends CSR_Object[ScauseCsr] {
  def apply() = new ScauseCsr
}

// supervisor trap value register
class StvalCsr extends CSR_Bundle {
  val data  = UInt(64.W)

  override def <=(d: UInt) = {
	data := d
  }
}

object StvalCsr extends CSR_Object[StvalCsr] {
  def apply() = new StvalCsr
}

// supervisor address translation and protection register
class SatpCsr extends CSR_Bundle {
  val mode  = UInt(4.W)
  val asid  = UInt(16.W)
  val ppn   = UInt(44.W)

  override def <=(data: UInt) = {
    requireWidth(data)
    mode  := data(63, 60)
	asid  := 0.U
    ppn   := data(43, 0)
  }
}

object SatpCsr extends CSR_Object[SatpCsr] {
  def apply() = new SatpCsr
}

// machine status register
class MstatusCsr extends CSR_Bundle {
  val sd    = Bool()
  val wpri0 = UInt(25.W)
  val mbe 	= Bool()
  val sbe 	= Bool()
  val sxl	= UInt(2.W)
  val uxl 	= UInt(2.W)
  val wpri1	= UInt(9.W)
  val tsr   = Bool()
  val tw    = Bool()
  val tvm   = Bool()
  val mxr   = Bool()
  val sum   = Bool()
  val mprv  = Bool()
  val xs    = UInt(2.W)
  val fs    = UInt(2.W)
  val mpp   = UInt(2.W)
  val wpri2 = UInt(2.W)
  val spp   = Bool()
  val mpie  = Bool()
  val ube	= Bool()
  val spie  = Bool()
  val wpri3 = Bool()
  val mie   = Bool()
  val wpri4 = Bool()
  val sie   = Bool()
  val wpri5 = Bool()

  override def <=(data: UInt) = {
    requireWidth(data)
	sd	  := 0.U(1.W)
	wpri0 := 0.U(25.W)
	mbe   := 0.U(1.W)
	sbe   := 0.U(1.W)
	sxl	  := 0.U(2.W)
	uxl   := 0.U(2.W)
	wpri1 := 0.U(9.W)
	tsr   := 0.U(1.W)
	tw 	  := 0.U(1.W)
	tvm   := 0.U(1.W)
	mxr   := 0.U(1.W)
    sum   := data(18)
	mprv  := 0.U(1.W)
	xs	  := 0.U(2.W)
	fs	  := 0.U(2.W)
    mpp   := data(12, 11)
	wpri2 := 0.U(2.W)
    spp   := data(8)
    mpie  := data(7)
	ube   := 0.U(1.W)
    spie  := data(5)
	wpri3 := 0.U(1.W)
    mie   := data(3)
	wpri4 := 0.U(1.W)
    sie   := data(1)
	wpri5 := 0.U(1.W)
  }
}

object MstatusCsr extends CSR_Object[MstatusCsr] {
  def apply() = new MstatusCsr
}

// machine ISA register
class MisaCsr extends CSR_Bundle {
  val mxl   = UInt(2.W)
  val wlrl  = UInt(36.W)
  val ext   = UInt(26.W)

  override def <=(data: UInt) = {}
}

object MisaCsr extends CSR_Object[MisaCsr] {
  def apply() = new MisaCsr
  override def default() = "h8000000000001100".U.asTypeOf(apply())
}

// machine exception delegation register
class MedelegCsr extends CSR_Bundle {
  val data  = UInt(64.W)

  //instruction misaligned; illegal inst; breakpoint,; load misaligned; store misaligned; ecall from u; ecall from s, ecall from m;
  override def <=(d: UInt) = {
    requireWidth(d)
    data  := Cat(0.U(52.W), d(11), 0.U(1.W), d(9, 8),
                 0.U(1.W), d(6), 0.U(1.W), d(4, 2), 0.U(1.W), d(0))
  }
}

object MedelegCsr extends CSR_Object[MedelegCsr] {
  def apply() = new MedelegCsr
}

// machine interrupt delegation register
class MidelegCsr extends CSR_Bundle {
  val data  = UInt(64.W)

  override def <=(d: UInt) = {
    requireWidth(d)
    data  := Cat(0.U(52.W), d(11), 0.U(1.W), d(9), 0.U(1.W), d(7), 0.U(1.W), d(5), 0.U(1.W), d(3), 0.U(1.W), d(1), 0.U(1.W))
  }
}

object MidelegCsr extends CSR_Object[MidelegCsr] {
  def apply() = new MidelegCsr
}

// machine interrupt-enable register
class MieCsr extends CSR_Bundle {
  val wpri0 = UInt(52.W)
  val meie  = Bool()
  val wpri1 = Bool()
  val seie  = Bool()
  val wpri2 = Bool()
  val mtie  = Bool()
  val wpri3 = Bool()
  val stie  = Bool()
  val wpri4 = Bool()
  val msie  = Bool()
  val wpri5 = Bool()
  val ssie  = Bool()
  val wpri6 = Bool()

  override def <=(data: UInt) = {
    requireWidth(data)
	wpri0 := 0.U(52.W)
    meie  := data(11)
	wpri1 := 0.U(1.W)
    seie  := data(9)
	wpri2 := 0.U(1.W)
    mtie  := data(7)
	wpri3 := 0.U(1.W)
    stie  := data(5)
	wpri4 := 0.U(1.W)
    msie  := data(3)
	wpri5 := 0.U(1.W)
    ssie  := data(1)
	wpri6 := 0.U(1.W)
  }
}

object MieCsr extends CSR_Object[MieCsr] {
  def apply() = new MieCsr
}

// machine interrupt-pending register
class MipCsr extends CSR_Bundle {
  val wpri0 = UInt(52.W)
  val meip  = Bool()
  val wpri1 = Bool()
  val seip  = Bool()
  val wpri2 = Bool()
  val mtip  = Bool()
  val wpri3 = Bool()
  val stip  = Bool()
  val wpri4 = Bool()
  val msip  = Bool()
  val wpri5 = Bool()
  val ssip  = Bool()
  val wpri6 = Bool()

  override def <=(data: UInt) = {
    requireWidth(data)
	wpri0 := 0.U(52.W)
	meip  := data(11) 
	wpri1 := 0.U(1.W)
    seip  := data(9)
	wpri2 := 0.U(1.W)
	mtip  := data(7)
	wpri3 := 0.U(1.W)
    stip  := data(5)
	wpri4 := 0.U(1.W)
	msip  := data(3)
	wpri5 := 0.U(1.W)
    ssip  := data(1)
	wpri6 := 0.U(1.W)
  }
}

object MipCsr extends CSR_Object[MipCsr] {
  def apply() = new MipCsr
}

// machine trap vector register
class MtvecCsr extends CSR_Bundle {
  val base  = UInt(62.W)
  val mode  = UInt(2.W)

  override def <=(data: UInt) = {
    requireWidth(data)
    base  := data(63, 2)
    mode  := data(0)
  }
}

object MtvecCsr extends CSR_Object[MtvecCsr] {
  def apply() = new MtvecCsr
}

// machine scratch register
class MscratchCsr extends CSR_Bundle {
  val data  = UInt(64.W)

  override def <=(d:UInt) = {
	data := d
  }
}

object MscratchCsr extends CSR_Object[MscratchCsr] {
  def apply() = new MscratchCsr
}

// machine exception program counter register
class MepcCsr extends CSR_Bundle {
  val data  = UInt(64.W)

  override def <=(d: UInt) = {
    requireWidth(d)
    data  := Cat(d(63, 2), 0.U(2.W))
  }
}

object MepcCsr extends CSR_Object[MepcCsr] {
  def apply() = new MepcCsr
}

// machine exception cause register
class McauseCsr extends CSR_Bundle {
  val int   = Bool()
  val code  = UInt(63.W)

  override def <=(data: UInt) = {
    requireWidth(data)
    int   := data(63)
    code  := Cat(0.U(59.W), data(3, 0))
  }
}

object McauseCsr extends CSR_Object[McauseCsr] {
  def apply() = new McauseCsr
}

// machine trap value register
class MtvalCsr extends CSR_Bundle {
  val data  = UInt(64.W)
  override def <=(d: UInt) = {
	data := d
  }
}

object MtvalCsr extends CSR_Object[MtvalCsr] {
  def apply() = new MtvalCsr
}

// machine cycle counter (64-bit)
class McycleCsr extends CSR_Bundle {
  val data  = UInt(64.W)
  override def <=(d:UInt) = {
	data := d
  }
}

object McycleCsr extends CSR_Object[McycleCsr] {
  def apply() = new McycleCsr
}

// machine instructions-retired counter (64-bit)
class MinstretCsr extends CSR_Bundle {
  val data  = UInt(64.W)
  override def <=(d:UInt) = {
	data := d
  }

}

object MinstretCsr extends CSR_Object[MinstretCsr] {
  def apply() = new MinstretCsr
}

package myCPU

import chisel3._
import myCPU.CSR._
import chiseltest._
import org.scalatest.freespec.AnyFreeSpec

import scala.collection.mutable

class TLBSpec extends AnyFreeSpec with ChiselScalatestTester {

  // PTE flag bits
  final val F_V = 0x001
  final val F_R = 0x002
  final val F_W = 0x004
  final val F_X = 0x008
  final val F_U = 0x010
  final val F_G = 0x020
  final val F_A = 0x040
  final val F_D = 0x080

  def pte(ppn: BigInt, flags: Int): BigInt = (ppn << 10) | flags
  def satp(asid: BigInt, ppn: BigInt): BigInt = (BigInt(8) << 60) | (asid << 44) | ppn

  val ROOT_PPN = BigInt(0x12345)
  val ROOT     = ROOT_PPN << 12          // 0x12345000
  val ASID     = BigInt(1)

  // a small page table: va 0x40001000 -> pa (0x44444 << 12)
  def map4k(va: BigInt, pa_ppn: BigInt, flags: Int, mem: mutable.Map[BigInt, BigInt]): Unit = {
    val vpn = va >> 12
    val vpn2 = (vpn >> 18) & 0x1ff
    val vpn1 = (vpn >> 9) & 0x1ff
    val vpn0 = vpn & 0x1ff
    val l1ppn = BigInt(0x22222); val l0ppn = BigInt(0x33333)
    mem(ROOT + vpn2 * 8) = pte(l1ppn, F_V)                       // pointer
    mem((l1ppn << 12) + vpn1 * 8) = pte(l0ppn, F_V)              // pointer
    mem((l0ppn << 12) + vpn0 * 8) = pte(pa_ppn, flags)           // leaf
  }

  def newMem(): mutable.Map[BigInt, BigInt] = mutable.Map[BigInt, BigInt]()

  def setup(dut: TLB, mem: mutable.Map[BigInt, BigInt],
            va: BigInt = BigInt(0x40001100), wen: Boolean = false,
            priv: BigInt = CSR_MODE_S.litValue, sum: Boolean = false, mxr: Boolean = false): Unit = {
    dut.io.stall.poke(false.B)
    dut.io.valid.poke(false.B)
    dut.io.priv.poke(priv.U)
    dut.io.mprv.poke(false.B)
    dut.io.sum.poke(sum.B)
    dut.io.mxr.poke(mxr.B)
    dut.io.wen.poke(wen.B)
    dut.io.satp.poke(satp(ASID, ROOT_PPN).U)
    dut.io.va.poke(va.U)
    dut.io.mask.poke(0xff.U)
    dut.io.tlb_flush_asid.poke(0.U)
    dut.io.tlb_flush_vpn.poke(0.U)
    dut.io.flush.poke(false.B)
    dut.io.cache_response.data.poke(0.U)
    dut.io.cache_response.ready.poke(false.B)
    dut.clock.step()
  }

  // zero-latency fake memory; records every request as (addr, rw)
  def respond(dut: TLB, mem: mutable.Map[BigInt, BigInt], log: mutable.ArrayBuffer[(BigInt, Boolean)]): Unit = {
    if (dut.io.tlb_request.valid.peek().litToBoolean) {
      val addr = dut.io.tlb_request.addr.peek().litValue
      val rw = dut.io.tlb_request.rw.peek().litToBoolean
      log += ((addr, rw))
      dut.io.cache_response.data.poke(mem.getOrElse(addr, BigInt(0)).U)
      dut.io.cache_response.ready.poke(true.B)
    } else {
      dut.io.cache_response.ready.poke(false.B)
    }
  }

  // returns (completed, fault_code); leaves logs of all requests issued
  def translate(dut: TLB, mem: mutable.Map[BigInt, BigInt],
                log: mutable.ArrayBuffer[(BigInt, Boolean)], maxCycles: Int = 60): (Boolean, BigInt) = {
    dut.io.valid.poke(true.B)
    var cycles = 0
    var fault = BigInt(0)
    var done = false
    while (!done && cycles < maxCycles) {
      respond(dut, mem, log)
      if (dut.io.tlb_ready.peek().litToBoolean) {
        fault = dut.io.fault.peek().litValue
        done = true
      } else {
        dut.clock.step()
        cycles += 1
      }
    }
    dut.clock.step()
    dut.io.valid.poke(false.B)
    dut.clock.step()
    (done, fault)
  }

  def doFlush(dut: TLB, asid: BigInt, vpn: BigInt): Unit = {
    dut.io.tlb_flush_asid.poke(asid.U)
    dut.io.tlb_flush_vpn.poke(vpn.U)
    dut.io.flush.poke(true.B)
    dut.clock.step()   // sIdle -> sFlush
    dut.clock.step()   // sFlush invalidates, back to sIdle
    dut.io.flush.poke(false.B)
    dut.io.tlb_flush_asid.poke(0.U)
    dut.io.tlb_flush_vpn.poke(0.U)
    dut.clock.step()
  }

  val VA4K = BigInt(0x40001100)
  val PA4K = (BigInt(0x44444) << 12) | BigInt(0x100)   // 0x44444100

  "dTLB walks a 4K page and issues the translated load" in {
    test(new TLB("dTLB")) { dut =>
      val mem = newMem()
      map4k(VA4K, 0x44444, F_V | F_R | F_W | F_X | F_A | F_D, mem)
      setup(dut, mem, va = VA4K)
      val log = mutable.ArrayBuffer[(BigInt, Boolean)]()
      val (done, fault) = translate(dut, mem, log)
      assert(done, "translation did not complete")
      assert(fault == 0, s"unexpected fault ${fault}")
      val addrs = log.map(_._1).toList
      assert(addrs == List(ROOT + 1 * 8, 0x22222000L + 0, 0x33333000L + 1 * 8, PA4K),
        s"request sequence wrong: ${addrs.map(_.toLong.toHexString)}")
      assert(log.map(_._2).toList == List(false, false, false, false))
    }
  }

  "dTLB walks a 2M superpage" in {
    test(new TLB("dTLB")) { dut =>
      val mem = newMem()
      val vpn = VA4K >> 12
      val vpn2 = (vpn >> 18) & 0x1ff
      val vpn1 = (vpn >> 9) & 0x1ff
      val l1ppn = BigInt(0x22222)
      val leaf = BigInt(0x22200)              // low 9 ppn bits must be zero
      mem(ROOT + vpn2 * 8) = pte(l1ppn, F_V)
      mem((l1ppn << 12) + vpn1 * 8) = pte(leaf, F_V | F_R | F_W | F_X | F_A | F_D)
      setup(dut, mem, va = VA4K)
      val log = mutable.ArrayBuffer[(BigInt, Boolean)]()
      val (done, fault) = translate(dut, mem, log)
      assert(done, "translation did not complete")
      assert(fault == 0, s"unexpected fault ${fault}")
      val pa = ((leaf >> 9) << 21) | (VA4K & 0x1fffff)
      val addrs = log.map(_._1).toList
      assert(addrs == List(ROOT + vpn2 * 8, (l1ppn << 12) + vpn1 * 8, pa),
        s"request sequence wrong: ${addrs.map(_.toLong.toHexString)}")
    }
  }

  "dTLB hits after fill without rewalking" in {
    test(new TLB("dTLB")) { dut =>
      val mem = newMem()
      map4k(VA4K, 0x44444, F_V | F_R | F_W | F_X | F_A | F_D, mem)
      setup(dut, mem, va = VA4K)
      val log1 = mutable.ArrayBuffer[(BigInt, Boolean)]()
      val (done1, fault1) = translate(dut, mem, log1)
      assert(done1 && fault1 == 0)

      setup(dut, mem, va = VA4K)
      val log2 = mutable.ArrayBuffer[(BigInt, Boolean)]()
      val (done2, fault2) = translate(dut, mem, log2)
      assert(done2, "hit translation did not complete")
      assert(fault2 == 0, s"unexpected fault ${fault2}")
      assert(log2.map(_._1).toList == List(PA4K), s"hit should issue only the data access: ${log2}")
    }
  }

  "invalid leaf raises load page fault" in {
    test(new TLB("dTLB")) { dut =>
      val mem = newMem()
      map4k(VA4K, 0x44444, 0, mem)   // V = 0
      setup(dut, mem, va = VA4K)
      val log = mutable.ArrayBuffer[(BigInt, Boolean)]()
      val (done, fault) = translate(dut, mem, log)
      assert(done, "fault did not complete")
      assert(fault == Page_fault.load_page_fault.litValue, s"fault=${fault}")
      assert(log.length == 3)  // three PTE reads, no data access
    }
  }

  "pointer with W and !R raises page fault" in {
    test(new TLB("dTLB")) { dut =>
      val mem = newMem()
      val vpn = VA4K >> 12
      mem(ROOT + ((vpn >> 18) & 0x1ff) * 8) = pte(0x22222, F_V | F_W)  // reserved combination
      setup(dut, mem, va = VA4K)
      val log = mutable.ArrayBuffer[(BigInt, Boolean)]()
      val (done, fault) = translate(dut, mem, log)
      assert(done)
      assert(fault == Page_fault.load_page_fault.litValue, s"fault=${fault}")
    }
  }

  "misaligned 2M superpage raises page fault" in {
    test(new TLB("dTLB")) { dut =>
      val mem = newMem()
      val vpn = VA4K >> 12
      val vpn2 = (vpn >> 18) & 0x1ff
      val vpn1 = (vpn >> 9) & 0x1ff
      mem(ROOT + vpn2 * 8) = pte(0x22222, F_V)
      mem(0x22222000L + vpn1 * 8) = pte(0x22201, F_V | F_R | F_A | F_D)  // ppn[8:0] != 0
      setup(dut, mem, va = VA4K)
      val log = mutable.ArrayBuffer[(BigInt, Boolean)]()
      val (done, fault) = translate(dut, mem, log)
      assert(done)
      assert(fault == Page_fault.load_page_fault.litValue, s"fault=${fault}")
    }
  }

  "S mode cannot access user page when SUM=0" in {
    test(new TLB("dTLB")) { dut =>
      val mem = newMem()
      map4k(VA4K, 0x44444, F_V | F_R | F_W | F_X | F_A | F_D | F_U, mem)
      setup(dut, mem, va = VA4K, sum = false)
      val log = mutable.ArrayBuffer[(BigInt, Boolean)]()
      val (done, fault) = translate(dut, mem, log)
      assert(done)
      assert(fault == Page_fault.load_page_fault.litValue, s"fault=${fault}")
    }
  }

  "S mode can access user page when SUM=1" in {
    test(new TLB("dTLB")) { dut =>
      val mem = newMem()
      map4k(VA4K, 0x44444, F_V | F_R | F_W | F_X | F_A | F_D | F_U, mem)
      setup(dut, mem, va = VA4K, sum = true)
      val log = mutable.ArrayBuffer[(BigInt, Boolean)]()
      val (done, fault) = translate(dut, mem, log)
      assert(done)
      assert(fault == 0, s"fault=${fault}")
      assert(log.last._1 == PA4K)
    }
  }

  "U mode cannot access supervisor page" in {
    test(new TLB("dTLB")) { dut =>
      val mem = newMem()
      map4k(VA4K, 0x44444, F_V | F_R | F_W | F_X | F_A | F_D, mem)
      setup(dut, mem, va = VA4K, priv = CSR_MODE_U.litValue)
      val log = mutable.ArrayBuffer[(BigInt, Boolean)]()
      val (done, fault) = translate(dut, mem, log)
      assert(done)
      assert(fault == Page_fault.load_page_fault.litValue, s"fault=${fault}")
    }
  }

  "MXR allows loading execute-only page" in {
    test(new TLB("dTLB")) { dut =>
      val mem = newMem()
      map4k(VA4K, 0x44444, F_V | F_X | F_A, mem)
      setup(dut, mem, va = VA4K, mxr = true)
      val log = mutable.ArrayBuffer[(BigInt, Boolean)]()
      val (done, fault) = translate(dut, mem, log)
      assert(done)
      assert(fault == 0, s"fault=${fault}")
      assert(log.last._1 == PA4K)
    }
  }

  "store to read-only page raises store page fault" in {
    test(new TLB("dTLB")) { dut =>
      val mem = newMem()
      map4k(VA4K, 0x44444, F_V | F_R | F_X | F_A | F_D, mem)
      setup(dut, mem, va = VA4K, wen = true)
      val log = mutable.ArrayBuffer[(BigInt, Boolean)]()
      val (done, fault) = translate(dut, mem, log)
      assert(done)
      assert(fault == Page_fault.store_page_fault.litValue, s"fault=${fault}")
    }
  }

  "A=0 leaf raises page fault" in {
    test(new TLB("dTLB")) { dut =>
      val mem = newMem()
      map4k(VA4K, 0x44444, F_V | F_R | F_W | F_X | F_D, mem)
      setup(dut, mem, va = VA4K)
      val log = mutable.ArrayBuffer[(BigInt, Boolean)]()
      val (done, fault) = translate(dut, mem, log)
      assert(done)
      assert(fault == Page_fault.load_page_fault.litValue, s"fault=${fault}")
    }
  }

  "iTLB requires X bit" in {
    test(new TLB("iTLB")) { dut =>
      val mem = newMem()
      map4k(VA4K, 0x44444, F_V | F_R | F_A, mem)   // no X
      setup(dut, mem, va = VA4K)
      val log = mutable.ArrayBuffer[(BigInt, Boolean)]()
      val (done, fault) = translate(dut, mem, log)
      assert(done)
      assert(fault == Page_fault.inst_page_fault.litValue, s"fault=${fault}")
    }
  }

  "sfence with rs1=x0 rs2=x0 flushes everything" in {
    test(new TLB("dTLB")) { dut =>
      val mem = newMem()
      map4k(VA4K, 0x44444, F_V | F_R | F_W | F_X | F_A | F_D, mem)
      setup(dut, mem, va = VA4K)
      val log1 = mutable.ArrayBuffer[(BigInt, Boolean)]()
      assert(translate(dut, mem, log1)._1)

      doFlush(dut, asid = 0, vpn = 0)
      setup(dut, mem, va = VA4K)
      val log2 = mutable.ArrayBuffer[(BigInt, Boolean)]()
      assert(translate(dut, mem, log2)._2 == 0)
      assert(log2.length == 4, "should rewalk after full flush")
    }
  }

  "sfence with matching asid and any vpn flushes non-global entries" in {
    test(new TLB("dTLB")) { dut =>
      val mem = newMem()
      map4k(VA4K, 0x44444, F_V | F_R | F_W | F_X | F_A | F_D, mem)
      setup(dut, mem, va = VA4K)
      val log1 = mutable.ArrayBuffer[(BigInt, Boolean)]()
      assert(translate(dut, mem, log1)._1)

      doFlush(dut, asid = ASID, vpn = 0)
      setup(dut, mem, va = VA4K)
      val log2 = mutable.ArrayBuffer[(BigInt, Boolean)]()
      assert(translate(dut, mem, log2)._2 == 0)
      assert(log2.length == 4, "should rewalk after asid flush")
    }
  }

  "sfence with other asid keeps the entry" in {
    test(new TLB("dTLB")) { dut =>
      val mem = newMem()
      map4k(VA4K, 0x44444, F_V | F_R | F_W | F_X | F_A | F_D, mem)
      setup(dut, mem, va = VA4K)
      val log1 = mutable.ArrayBuffer[(BigInt, Boolean)]()
      assert(translate(dut, mem, log1)._1)

      doFlush(dut, asid = ASID + 1, vpn = 0)
      setup(dut, mem, va = VA4K)
      val log2 = mutable.ArrayBuffer[(BigInt, Boolean)]()
      assert(translate(dut, mem, log2)._2 == 0)
      assert(log2.length == 1, "entry should survive other-asid flush")
    }
  }

  "sfence with matching page but other asid keeps the entry" in {
    test(new TLB("dTLB")) { dut =>
      val mem = newMem()
      map4k(VA4K, 0x44444, F_V | F_R | F_W | F_X | F_A | F_D, mem)
      setup(dut, mem, va = VA4K)
      val log1 = mutable.ArrayBuffer[(BigInt, Boolean)]()
      assert(translate(dut, mem, log1)._1)

      doFlush(dut, asid = ASID + 1, vpn = VA4K >> 12)
      setup(dut, mem, va = VA4K)
      val log2 = mutable.ArrayBuffer[(BigInt, Boolean)]()
      assert(translate(dut, mem, log2)._2 == 0)
      assert(log2.length == 1, "entry should survive other-asid page flush")
    }
  }

  "sfence with matching page and all asid flushes the entry" in {
    test(new TLB("dTLB")) { dut =>
      val mem = newMem()
      map4k(VA4K, 0x44444, F_V | F_R | F_W | F_X | F_A | F_D, mem)
      setup(dut, mem, va = VA4K)
      val log1 = mutable.ArrayBuffer[(BigInt, Boolean)]()
      assert(translate(dut, mem, log1)._1)

      doFlush(dut, asid = 0, vpn = VA4K >> 12)
      setup(dut, mem, va = VA4K)
      val log2 = mutable.ArrayBuffer[(BigInt, Boolean)]()
      assert(translate(dut, mem, log2)._2 == 0)
      assert(log2.length == 4, "should rewalk after page flush")
    }
  }

  "global entry survives asid flush but not full flush" in {
    test(new TLB("dTLB")) { dut =>
      val mem = newMem()
      map4k(VA4K, 0x44444, F_V | F_R | F_W | F_X | F_A | F_D | F_G, mem)
      setup(dut, mem, va = VA4K)
      val log1 = mutable.ArrayBuffer[(BigInt, Boolean)]()
      assert(translate(dut, mem, log1)._1)

      doFlush(dut, asid = ASID, vpn = 0)
      setup(dut, mem, va = VA4K)
      val log2 = mutable.ArrayBuffer[(BigInt, Boolean)]()
      assert(translate(dut, mem, log2)._2 == 0)
      assert(log2.length == 1, "global entry should survive asid flush")

      doFlush(dut, asid = 0, vpn = 0)
      setup(dut, mem, va = VA4K)
      val log3 = mutable.ArrayBuffer[(BigInt, Boolean)]()
      assert(translate(dut, mem, log3)._2 == 0)
      assert(log3.length == 4, "global entry should not survive full flush")
    }
  }
}

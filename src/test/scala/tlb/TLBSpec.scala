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
  final val F_ALL = F_V | F_R | F_W | F_X | F_A | F_D

  def pte(ppn: BigInt, flags: Int): BigInt = (ppn << 10) | flags
  def satp(ppn: BigInt): BigInt = (BigInt(8) << 60) | ppn

  val ROOT_PPN = BigInt(0x12345)
  val ROOT     = ROOT_PPN << 12          // 0x12345000

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

  // The guest: its page tables are at the same guest physical addresses as
  // the tables above, and its first GiB of guest physical memory is the GiB
  // at 0x80000000. The root table of the guest-physical stage is at HROOT.
  val HROOT_PPN = BigInt(0x50000)
  val HROOT     = HROOT_PPN << 12
  val GBASE     = BigInt(0x80000000L)
  def hgatp: BigInt = (BigInt(8) << 60) | HROOT_PPN
  def mapGuest(va: BigInt, gpa_ppn: BigInt, flags: Int, gflags: Int, mem: mutable.Map[BigInt, BigInt]): Unit = {
    val vpn = va >> 12
    mem(HROOT) = pte(GBASE >> 12, gflags)                        // 1 GiB leaf
    mem(GBASE + ROOT + ((vpn >> 18) & 0x1ff) * 8) = pte(0x22222, F_V)
    mem(GBASE + 0x22222000L + ((vpn >> 9) & 0x1ff) * 8) = pte(0x33333, F_V)
    mem(GBASE + 0x33333000L + (vpn & 0x1ff) * 8) = pte(gpa_ppn, flags)
  }

  def newMem(): mutable.Map[BigInt, BigInt] = mutable.Map[BigInt, BigInt]()

  def setup(dut: TLB, mem: mutable.Map[BigInt, BigInt],
            va: BigInt = BigInt(0x40001100), wen: Boolean = false,
            priv: BigInt = CSR_MODE_S.litValue, sum: Boolean = false, mxr: Boolean = false,
            virt: Boolean = false, stage1: Boolean = true, hlvx: Boolean = false): Unit = {
    dut.io.stall.poke(false.B)
    dut.io.valid.poke(false.B)
    dut.io.virt.poke(virt.B)
    dut.io.priv.poke(priv.U)
    dut.io.sum.poke(sum.B)
    dut.io.mxr.poke(mxr.B)
    dut.io.gmxr.poke(false.B)
    dut.io.hlvx.poke(hlvx.B)
    dut.io.wen.poke(wen.B)
    dut.io.rw.poke(false.B)
    dut.io.satp.poke((if (stage1) satp(ROOT_PPN) else BigInt(0)).U)
    dut.io.hgatp.poke((if (virt) hgatp else BigInt(0)).U)
    dut.io.va.poke(va.U)
    dut.io.mask.poke(0xff.U)
    dut.io.flush.poke(false.B)
    dut.io.flush_virt.poke(false.B)
    dut.io.flush_page.poke(false.B)
    dut.io.flush_va.poke(0.U)
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

  // what a translation ended with
  case class Result(done: Boolean, fault: BigInt, guest: Boolean, gpa: BigInt, pte: Boolean)

  // leaves a log of all requests issued
  def run(dut: TLB, mem: mutable.Map[BigInt, BigInt],
          log: mutable.ArrayBuffer[(BigInt, Boolean)], maxCycles: Int = 60): Result = {
    dut.io.valid.poke(true.B)
    var cycles = 0
    var result = Result(false, 0, false, 0, false)
    while (!result.done && cycles < maxCycles) {
      respond(dut, mem, log)
      if (dut.io.tlb_ready.peek().litToBoolean) {
        result = Result(true, dut.io.fault.peek().litValue, dut.io.fault_guest.peek().litToBoolean,
          dut.io.fault_gpa.peek().litValue, dut.io.fault_pte.peek().litToBoolean)
      } else {
        dut.clock.step()
        cycles += 1
      }
    }
    dut.clock.step()
    dut.io.valid.poke(false.B)
    dut.clock.step()
    result
  }

  // returns (completed, fault_code)
  def translate(dut: TLB, mem: mutable.Map[BigInt, BigInt],
                log: mutable.ArrayBuffer[(BigInt, Boolean)]): (Boolean, BigInt) = {
    val r = run(dut, mem, log)
    (r.done, r.fault)
  }

  // drop the entries of guests (virt) or the others: all of them, or with
  // `page` those that translate that address
  def doFlush(dut: TLB, virt: Boolean = false, page: Option[BigInt] = None): Unit = {
    dut.io.flush_virt.poke(virt.B)
    dut.io.flush_page.poke(page.isDefined.B)
    dut.io.flush_va.poke(page.getOrElse(BigInt(0)).U)
    dut.io.flush.poke(true.B)
    dut.clock.step()   // sIdle -> sFlush
    dut.io.flush.poke(false.B)
    dut.clock.step()   // sFlush invalidates, back to sIdle
    dut.clock.step()
  }

  val VA4K = BigInt(0x40001100)
  val PA4K = (BigInt(0x44444) << 12) | BigInt(0x100)   // 0x44444100

  "dTLB walks a 4K page and issues the translated load" in {
    test(new TLB("dTLB")) { dut =>
      val mem = newMem()
      map4k(VA4K, 0x44444, F_ALL, mem)
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
      mem((l1ppn << 12) + vpn1 * 8) = pte(leaf, F_ALL)
      setup(dut, mem, va = VA4K)
      val log = mutable.ArrayBuffer[(BigInt, Boolean)]()
      val (done, fault) = translate(dut, mem, log)
      assert(done, "translation did not complete")
      assert(fault == 0, s"unexpected fault ${fault}")
      val pa = ((leaf >> 9) << 21) | (VA4K & 0x1fffff)
      val addrs = log.map(_._1).toList
      assert(addrs == List(ROOT + vpn2 * 8, (l1ppn << 12) + vpn1 * 8, pa),
        s"request sequence wrong: ${addrs.map(_.toLong.toHexString)}")

      // the entry covers the whole superpage
      val other = VA4K + 0x5000
      setup(dut, mem, va = other)
      val log2 = mutable.ArrayBuffer[(BigInt, Boolean)]()
      assert(translate(dut, mem, log2)._2 == 0)
      assert(log2.map(_._1).toList == List(((leaf >> 9) << 21) | (other & 0x1fffff)),
        s"superpage entry not used: ${log2}")
    }
  }

  "dTLB hits after fill without rewalking" in {
    test(new TLB("dTLB")) { dut =>
      val mem = newMem()
      map4k(VA4K, 0x44444, F_ALL, mem)
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

  "an address that is not canonical raises page fault" in {
    test(new TLB("dTLB")) { dut =>
      val mem = newMem()
      map4k(VA4K, 0x44444, F_ALL, mem)
      setup(dut, mem, va = VA4K | (BigInt(1) << 40))
      val log = mutable.ArrayBuffer[(BigInt, Boolean)]()
      val (done, fault) = translate(dut, mem, log)
      assert(done)
      assert(fault == Page_fault.load_page_fault.litValue, s"fault=${fault}")
      assert(log.isEmpty, "no memory access for such an address")
    }
  }

  "S mode cannot access user page when SUM=0" in {
    test(new TLB("dTLB")) { dut =>
      val mem = newMem()
      map4k(VA4K, 0x44444, F_ALL | F_U, mem)
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
      map4k(VA4K, 0x44444, F_ALL | F_U, mem)
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
      map4k(VA4K, 0x44444, F_ALL, mem)
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

  "an entry that does not permit the access is walked again" in {
    test(new TLB("dTLB")) { dut =>
      val mem = newMem()
      map4k(VA4K, 0x44444, F_V | F_R | F_X | F_A | F_D, mem)
      setup(dut, mem, va = VA4K)
      val log1 = mutable.ArrayBuffer[(BigInt, Boolean)]()
      assert(translate(dut, mem, log1)._2 == 0)

      // the page became writable since the entry was filled
      map4k(VA4K, 0x44444, F_ALL, mem)
      setup(dut, mem, va = VA4K, wen = true)
      val log2 = mutable.ArrayBuffer[(BigInt, Boolean)]()
      assert(translate(dut, mem, log2)._2 == 0, "the walk finds the new permission")
      assert(log2.length == 4, s"the store should walk the page table: ${log2}")
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

  "a flush without an address drops every entry" in {
    test(new TLB("dTLB")) { dut =>
      val mem = newMem()
      map4k(VA4K, 0x44444, F_ALL, mem)
      setup(dut, mem, va = VA4K)
      val log1 = mutable.ArrayBuffer[(BigInt, Boolean)]()
      assert(translate(dut, mem, log1)._1)

      doFlush(dut)
      setup(dut, mem, va = VA4K)
      val log2 = mutable.ArrayBuffer[(BigInt, Boolean)]()
      assert(translate(dut, mem, log2)._2 == 0)
      assert(log2.length == 4, "should rewalk after full flush")
    }
  }

  "a flush of another page keeps the entry" in {
    test(new TLB("dTLB")) { dut =>
      val mem = newMem()
      map4k(VA4K, 0x44444, F_ALL, mem)
      setup(dut, mem, va = VA4K)
      val log1 = mutable.ArrayBuffer[(BigInt, Boolean)]()
      assert(translate(dut, mem, log1)._1)

      doFlush(dut, page = Some(VA4K + 0x1000))
      setup(dut, mem, va = VA4K)
      val log2 = mutable.ArrayBuffer[(BigInt, Boolean)]()
      assert(translate(dut, mem, log2)._2 == 0)
      assert(log2.length == 1, "entry should survive the flush of another page")
    }
  }

  "a flush of its page drops the entry" in {
    test(new TLB("dTLB")) { dut =>
      val mem = newMem()
      map4k(VA4K, 0x44444, F_ALL, mem)
      setup(dut, mem, va = VA4K)
      val log1 = mutable.ArrayBuffer[(BigInt, Boolean)]()
      assert(translate(dut, mem, log1)._1)

      doFlush(dut, page = Some(VA4K & ~BigInt(0xfff)))
      setup(dut, mem, va = VA4K)
      val log2 = mutable.ArrayBuffer[(BigInt, Boolean)]()
      assert(translate(dut, mem, log2)._2 == 0)
      assert(log2.length == 4, "should rewalk after page flush")
    }
  }

  // ---------------- two-stage translation for a guest ----------------
  val GPA = (BigInt(0x4444) << 12) | BigInt(0x100)    // guest physical 0x04444100
  val HPA = GBASE + GPA
  val G_ALL = F_ALL | F_U

  "a guest address passes both stages, and so does every VS-stage PTE address" in {
    test(new TLB("dTLB")) { dut =>
      val mem = newMem()
      mapGuest(VA4K, 0x4444, F_ALL, G_ALL, mem)
      setup(dut, mem, va = VA4K, virt = true)
      val log = mutable.ArrayBuffer[(BigInt, Boolean)]()
      val r = run(dut, mem, log)
      assert(r.done && r.fault == 0, s"result ${r}")
      val addrs = log.map(_._1).toList
      assert(addrs == List(HROOT, GBASE + ROOT + 1 * 8, HROOT, GBASE + 0x22222000L, HROOT,
        GBASE + 0x33333000L + 1 * 8, HROOT, HPA),
        s"request sequence wrong: ${addrs.map(_.toLong.toHexString)}")

      // the entry holds the whole translation
      setup(dut, mem, va = VA4K, virt = true)
      val log2 = mutable.ArrayBuffer[(BigInt, Boolean)]()
      assert(run(dut, mem, log2).fault == 0)
      assert(log2.map(_._1).toList == List(HPA), s"hit should issue only the data access: ${log2}")
    }
  }

  "a guest without paging of its own is translated by the guest-physical stage" in {
    test(new TLB("dTLB")) { dut =>
      val mem = newMem()
      mapGuest(VA4K, 0x4444, F_ALL, G_ALL, mem)
      setup(dut, mem, va = GPA, virt = true, stage1 = false)
      val log = mutable.ArrayBuffer[(BigInt, Boolean)]()
      val r = run(dut, mem, log)
      assert(r.done && r.fault == 0, s"result ${r}")
      assert(log.map(_._1).toList == List(HROOT, HPA), s"request sequence wrong: ${log}")
    }
  }

  "a guest physical address above 41 bits raises a guest-page fault" in {
    test(new TLB("dTLB")) { dut =>
      val mem = newMem()
      mapGuest(VA4K, 0x4444, F_ALL, G_ALL, mem)
      val gpa = GPA | (BigInt(1) << 41)
      setup(dut, mem, va = gpa, virt = true, stage1 = false)
      val log = mutable.ArrayBuffer[(BigInt, Boolean)]()
      val r = run(dut, mem, log)
      assert(r.done && r.fault == Page_fault.load_page_fault.litValue && r.guest, s"result ${r}")
      assert(r.gpa == gpa && !r.pte, s"result ${r}")
      assert(log.isEmpty)
    }
  }

  "a guest physical address without a translation raises a guest-page fault" in {
    test(new TLB("dTLB")) { dut =>
      val mem = newMem()
      // the guest maps the page to its second GiB, which the hypervisor did not map
      mapGuest(VA4K, 0x44444, F_ALL, G_ALL, mem)
      setup(dut, mem, va = VA4K, virt = true)
      val log = mutable.ArrayBuffer[(BigInt, Boolean)]()
      val r = run(dut, mem, log)
      assert(r.done && r.fault == Page_fault.load_page_fault.litValue && r.guest, s"result ${r}")
      assert(r.gpa == PA4K && !r.pte, s"result ${r}")
    }
  }

  "a VS-stage page table that the hypervisor did not map raises a guest-page fault of the PTE" in {
    test(new TLB("dTLB")) { dut =>
      val mem = newMem()
      mapGuest(VA4K, 0x4444, F_ALL, G_ALL, mem)
      mem(HROOT) = 0
      setup(dut, mem, va = VA4K, virt = true)
      val log = mutable.ArrayBuffer[(BigInt, Boolean)]()
      val r = run(dut, mem, log)
      assert(r.done && r.fault == Page_fault.load_page_fault.litValue && r.guest, s"result ${r}")
      assert(r.gpa == ROOT + 1 * 8 && r.pte, s"result ${r}")
    }
  }

  "the guest-physical stage needs user pages" in {
    test(new TLB("dTLB")) { dut =>
      val mem = newMem()
      mapGuest(VA4K, 0x4444, F_ALL, F_ALL, mem)       // no U
      setup(dut, mem, va = VA4K, virt = true)
      val log = mutable.ArrayBuffer[(BigInt, Boolean)]()
      val r = run(dut, mem, log)
      assert(r.done && r.fault != 0 && r.guest && r.pte, s"result ${r}")
    }
  }

  "a page fault of the VS-stage is not a guest-page fault" in {
    test(new TLB("dTLB")) { dut =>
      val mem = newMem()
      mapGuest(VA4K, 0x4444, F_V | F_R | F_A | F_D, G_ALL, mem)
      setup(dut, mem, va = VA4K, virt = true, wen = true)
      val log = mutable.ArrayBuffer[(BigInt, Boolean)]()
      val r = run(dut, mem, log)
      assert(r.done && r.fault == Page_fault.store_page_fault.litValue && !r.guest, s"result ${r}")
    }
  }

  "HLVX needs execute permission in both stages" in {
    test(new TLB("dTLB")) { dut =>
      val mem = newMem()
      mapGuest(VA4K, 0x4444, F_V | F_X | F_A, F_V | F_X | F_A | F_U | F_R, mem)
      setup(dut, mem, va = VA4K, virt = true, hlvx = true)
      val log = mutable.ArrayBuffer[(BigInt, Boolean)]()
      assert(run(dut, mem, log).fault == 0, "execute-only in the VS-stage is enough")

      doFlush(dut, virt = true)
      mapGuest(VA4K, 0x4444, F_ALL, F_V | F_R | F_W | F_A | F_D | F_U, mem)
      setup(dut, mem, va = VA4K, virt = true, hlvx = true)
      val log2 = mutable.ArrayBuffer[(BigInt, Boolean)]()
      val r = run(dut, mem, log2)
      assert(r.fault == Page_fault.load_page_fault.litValue && r.guest && !r.pte, s"result ${r}")
    }
  }

  "the entries of a guest are kept apart from the others" in {
    test(new TLB("dTLB")) { dut =>
      val mem = newMem()
      map4k(VA4K, 0x44444, F_ALL, mem)
      mapGuest(VA4K, 0x4444, F_ALL, G_ALL, mem)
      setup(dut, mem, va = VA4K)
      val log1 = mutable.ArrayBuffer[(BigInt, Boolean)]()
      assert(translate(dut, mem, log1)._2 == 0)
      setup(dut, mem, va = VA4K, virt = true)
      val log2 = mutable.ArrayBuffer[(BigInt, Boolean)]()
      assert(run(dut, mem, log2).fault == 0)
      assert(log2.last._1 == HPA && log2.length == 8, s"the guest walks its own tables: ${log2}")

      // a flush of the guest entries leaves the other one
      doFlush(dut, virt = true)
      setup(dut, mem, va = VA4K)
      val log3 = mutable.ArrayBuffer[(BigInt, Boolean)]()
      assert(translate(dut, mem, log3)._2 == 0)
      assert(log3.map(_._1).toList == List(PA4K), s"entry should survive: ${log3}")
      setup(dut, mem, va = VA4K, virt = true)
      val log4 = mutable.ArrayBuffer[(BigInt, Boolean)]()
      assert(run(dut, mem, log4).fault == 0)
      assert(log4.length == 8, s"the guest entry is gone: ${log4}")

      // and the other way around
      doFlush(dut, virt = false)
      setup(dut, mem, va = VA4K, virt = true)
      val log5 = mutable.ArrayBuffer[(BigInt, Boolean)]()
      assert(run(dut, mem, log5).fault == 0)
      assert(log5.map(_._1).toList == List(HPA), s"guest entry should survive: ${log5}")
    }
  }
}

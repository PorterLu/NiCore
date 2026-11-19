package myCPU

import chisel3._
import chiseltest._
import org.scalatest.freespec.AnyFreeSpec
import chisel3.experimental.BundleLiterals._
import myCPU.CSR._
import myCPU.Control._

import scala.collection.mutable

class StageSpec extends AnyFreeSpec with ChiselScalatestTester {

  final val F_V = 0x001; final val F_R = 0x002; final val F_W = 0x004; final val F_X = 0x008
  final val F_U = 0x010; final val F_G = 0x020; final val F_A = 0x040; final val F_D = 0x080

  def pte(ppn: BigInt, flags: Int): BigInt = (ppn << 10) | flags
  def satp(asid: BigInt, ppn: BigInt): BigInt = (BigInt(8) << 60) | (asid << 44) | ppn

  val ROOT_PPN = BigInt(0x12345)
  val ROOT     = ROOT_PPN << 12
  val ASID     = BigInt(1)
  val VA       = BigInt(0x40001100)
  val PA       = (BigInt(0x44444) << 12) | BigInt(0x100)

  def map4k(va: BigInt, pa_ppn: BigInt, flags: Int, mem: mutable.Map[BigInt, BigInt]): Unit = {
    val vpn = va >> 12
    mem(ROOT + ((vpn >> 18) & 0x1ff) * 8) = pte(0x22222, F_V)
    mem(0x22222000L + ((vpn >> 9) & 0x1ff) * 8) = pte(0x33333, F_V)
    mem(0x33333000L + (vpn & 0x1ff) * 8) = pte(pa_ppn, flags)
  }

  def newMem() = mutable.Map[BigInt, BigInt]()

  // ------------------------------------------------------------------
  // fake caches with one cycle latency: the icache port serves instruction
  // fetches, the ptw port (the data cache) the page-walk reads of the iTLB;
  // pending and walk model an in-flight request on each port
  // ------------------------------------------------------------------
  class FetchMem(mem: mutable.Map[BigInt, BigInt], dataAt: BigInt => BigInt,
                 log: mutable.ArrayBuffer[BigInt]) {
    private var pending: Option[BigInt] = None
    private var walk: Option[BigInt] = None
    def cycle(fetch: FetchStage): Unit = {
      val responding = pending.isDefined
      pending match {
        case Some(a) =>
          fetch.io.icache.cpu_response.data.poke(dataAt(a).U)
          fetch.io.icache.cpu_response.ready.poke(true.B)
          pending = None
        case None =>
          fetch.io.icache.cpu_response.ready.poke(false.B)
      }
      val walking = walk.isDefined
      walk match {
        case Some(a) =>
          fetch.io.ptw.cpu_response.data.poke(dataAt(a).U)
          fetch.io.ptw.cpu_response.ready.poke(true.B)
          walk = None
        case None =>
          fetch.io.ptw.cpu_response.ready.poke(false.B)
      }
      if (!responding && fetch.io.icache.cpu_request.valid.peek().litToBoolean) {
        pending = Some(fetch.io.icache.cpu_request.addr.peek().litValue)
        log += pending.get
      }
      if (!walking && fetch.io.ptw.cpu_request.valid.peek().litToBoolean) {
        walk = Some(fetch.io.ptw.cpu_request.addr.peek().litValue)
        log += walk.get
      }
    }
  }

  def redirectFetch(fetch: FetchStage, fmem: FetchMem, target: BigInt): Unit = {
    // emulate the csr trap like the real datapath: the trap waits for !stall,
    // i.e. it fires in the cycle the in-flight translation completes, and its
    // flush (flush_fd) suppresses capturing the stale result
    fetch.io.csr_trapVec.poke(target.U)
    fetch.io.csr_trap.poke(true.B)
    fetch.io.flush_fd.poke(true.B)
    var fired = false
    for (_ <- 0 until 60 if !fired) {
      fmem.cycle(fetch)
      fetch.io.stall.poke((!fetch.io.tlb_ready.peek().litToBoolean).B)
      fired = fetch.io.tlb_ready.peek().litToBoolean
      fetch.clock.step()
    }
    fetch.io.csr_trap.poke(false.B)
    fetch.io.flush_fd.poke(false.B)
  }

  def setupFetch(fetch: FetchStage, mem: mutable.Map[BigInt, BigInt], paging: Boolean): Unit = {
    fetch.io.started.poke(false.B)
    fetch.io.stall.poke(false.B)
    fetch.io.pipeline_stall.poke(false.B)
    fetch.io.csr_trap.poke(false.B)
    fetch.io.csr_trapVec.poke(0x80000000L.U)
    fetch.io.csr_atomic.poke(false.B)
    fetch.io.csr_next_fetch.poke(0x80000000L.U)
    fetch.io.dcache_flush_tag.poke(false.B)
    fetch.io.flush_fd.poke(false.B)
    fetch.io.de_pipe_reg_pc_sel.poke(PC_4)
    fetch.io.de_pipe_reg_inst.poke(Instructions.NOP)
    fetch.io.de_pipe_reg_enable.poke(false.B)
    fetch.io.em_pipe_reg_pc.poke(0x80000000L.U)
    fetch.io.flush_em.poke(false.B)
    fetch.io.brCond_taken.poke(false.B)
    fetch.io.jump_addr.poke(0x80000000L.U)
    fetch.io.sfence_rs1.poke(0.U)
    fetch.io.sfence_rs2.poke(0.U)
    fetch.io.tlb_valid.poke(paging.B)
    fetch.io.tlb_flush.poke(false.B)
    fetch.io.sum.poke(false.B)
    fetch.io.mxr.poke(false.B)
    fetch.io.mode.poke(CSR_MODE_S.litValue.U)
    fetch.io.satp.poke(satp(ASID, ROOT_PPN).U)
    fetch.io.icache.cpu_response.data.poke(0.U)
    fetch.io.icache.cpu_response.ready.poke(false.B)
    fetch.io.ptw.cpu_response.data.poke(0.U)
    fetch.io.ptw.cpu_response.ready.poke(false.B)
    fetch.io.serial_redirect.poke(false.B)
    fetch.io.serial_redirect_pc.poke(0x80000000L.U)
    fetch.reset.poke(true.B)
    fetch.clock.step()
    fetch.reset.poke(false.B)
    fetch.clock.step()
    fetch.io.started.poke(false.B)
    fetch.clock.step()
  }

  "FetchStage translates pc through iTLB and captures the fetched instruction" in {
    test(new FetchStage) { fetch =>
      val mem = newMem()
      map4k(0x40001100L, 0x44444, F_V | F_R | F_W | F_X | F_A | F_D, mem)
      // the instruction word returned for the translated fetch
      val instWord = BigInt(0xdeadbeefL)
      setupFetch(fetch, mem, paging = true)
      val log = mutable.ArrayBuffer[BigInt]()
      val fmem = new FetchMem(mem, a => if (a == PA) instWord else mem.getOrElse(a, BigInt(0)), log)
      redirectFetch(fetch, fmem, 0x40001100L)

      // run until fd_pipe_reg gets the instruction from the translated fetch
      var got = false
      for (i <- 0 until 60 if !got) {
        fmem.cycle(fetch)
        fetch.io.stall.poke((!fetch.io.tlb_ready.peek().litToBoolean).B)
        fetch.clock.step()
        if (fetch.io.fd_pipe_reg.enable.peek().litToBoolean &&
            fetch.io.fd_pipe_reg.pc.peek().litValue == 0x40001100L) {
          got = true
        }
      }
      assert(got, "fetch through iTLB did not complete")
      assert(fetch.io.fd_pipe_reg.inst.peek().litValue == instWord, "wrong instruction captured")
      assert(fetch.io.fd_pipe_reg.iTLB_fault.peek().litValue == 0)
      assert(log.contains(ROOT + 1 * 8), s"page walk did not happen: ${log.map(x => x.toString(16))}")
      assert(log.contains(PA), s"instruction fetch did not use translated address: ${log.map(x => x.toString(16))}")
    }
  }

  "FetchStage reports iTLB fault without fetching" in {
    test(new FetchStage) { fetch =>
      val mem = newMem()
      map4k(0x40001100L, 0x44444, F_V | F_R | F_A, mem)   // no X
      setupFetch(fetch, mem, paging = true)
      val log = mutable.ArrayBuffer[BigInt]()
      val fmem = new FetchMem(mem, a => mem.getOrElse(a, BigInt(0)), log)
      redirectFetch(fetch, fmem, 0x40001100L)
      var fault = BigInt(0)
      var got = false
      for (_ <- 0 until 60 if !got) {
        fmem.cycle(fetch)
        fetch.io.stall.poke((!fetch.io.tlb_ready.peek().litToBoolean).B)
        fetch.clock.step()
        if (fetch.io.fd_pipe_reg.enable.peek().litToBoolean &&
            fetch.io.fd_pipe_reg.pc.peek().litValue == 0x40001100L &&
            fetch.io.fd_pipe_reg.iTLB_fault.peek().litValue != 0) {
          fault = fetch.io.fd_pipe_reg.iTLB_fault.peek().litValue
          got = true
        }
      }
      assert(got, "fetch fault did not propagate to fd_pipe_reg")
      assert(fault == Page_fault.inst_page_fault.litValue, s"fault=${fault}")
      assert(!log.contains(PA), "no instruction fetch should happen on fault")
    }
  }

  // ------------------------------------------------------------------
  // dTLB + dcache request mux in MemoryStage
  // ------------------------------------------------------------------
  def emLoad(va: BigInt) = {
    val lit = (new execute_mem_pipeline_reg).Lit(
      _.alu_out -> va.U, _.alu_sum -> 0.U, _.csr_read_data -> 0.U,
      _.csr_write_op -> 0.U, _.csr_write_addr -> 0.U, _.csr_write_data -> 0.U,
      _.jump_taken -> false.B, _.st_data -> 0.U, _.st_type -> 0.U,
      _.ld_type -> Control.LD_LW, _.wb_sel -> 0.U, _.wb_en -> true.B,
      _.dest -> 1.U, _.pc -> 0x40001004L.U, _.inst -> Instructions.NOP,
      _.is_clint -> false.B, _.csr_inst_mode -> 0.U, _.csr_is_illegal -> false.B,
      _.csr_inst_misalign -> false.B, _.csr_load_misalign -> false.B,
      _.csr_store_misalign -> false.B, _.iTLB_fault -> 0.U,
      _.sfence_rs1 -> 0.U, _.sfence_rs2 -> 0.U, _.amo_op -> Control.AMO_NONE, _.enable -> true.B)
    lit
  }

  def setupMem(ms: MemoryStage, emLit: execute_mem_pipeline_reg, paging: Boolean): Unit = {
    ms.io.stall.poke(false.B)
    ms.io.pipeline_stall.poke(false.B)
    ms.io.flush_mw.poke(false.B)
    ms.io.flush_em.poke(false.B)
    ms.io.em_pipe_reg.poke(emLit)
    ms.io.de_pipe_reg_ld_type.poke(0.U)
    ms.io.de_pipe_reg_st_type.poke(0.U)
    ms.io.de_pipe_reg_enable.poke(false.B)
    ms.io.dcache_flush_tag.poke(false.B)
    ms.io.alu_out.poke(emLit.alu_out.litValue.U)
    ms.io.src2_data.poke(0.U)
    ms.io.is_clint.poke(false.B)
    ms.io.tlb_valid.poke(paging.B)
    ms.io.tlb_flush.poke(false.B)
    ms.io.tlb_flush_all.poke(false.B)
    ms.io.sum.poke(false.B)
    ms.io.mxr.poke(false.B)
    ms.io.mode.poke(CSR_MODE_S.litValue.U)
    ms.io.satp.poke(satp(ASID, ROOT_PPN).U)
    ms.io.dcache.cpu_response.data.poke(0.U)
    ms.io.dcache.cpu_response.ready.poke(false.B)
    ms.reset.poke(true.B)
    ms.clock.step()
    ms.reset.poke(false.B)
    ms.clock.step()
    ms.io.em_pipe_reg.poke(emLit)
    ms.clock.step()
  }

  def serveMem(ms: MemoryStage, mem: mutable.Map[BigInt, BigInt], log: mutable.ArrayBuffer[BigInt]): Unit = {
    if (ms.io.dcache.cpu_request.valid.peek().litToBoolean) {
      val addr = ms.io.dcache.cpu_request.addr.peek().litValue
      log += addr
      ms.io.dcache.cpu_response.data.poke(mem.getOrElse(addr, BigInt(0)).U)
      ms.io.dcache.cpu_response.ready.poke(true.B)
    } else {
      ms.io.dcache.cpu_response.ready.poke(false.B)
    }
  }

  "MemoryStage issues translated load and captures load data" in {
    test(new MemoryStage) { ms =>
      val mem = newMem()
      map4k(VA, 0x44444, F_V | F_R | F_W | F_X | F_A | F_D, mem)
      mem(PA) = BigInt(0x11223344L)
      setupMem(ms, emLoad(VA), paging = true)
      // while translating, the pipeline is stalled (ls_stall follows the EM instr)
      ms.io.stall.poke(true.B)
      val log = mutable.ArrayBuffer[BigInt]()
      var done = false
      for (_ <- 0 until 60 if !done) {
        serveMem(ms, mem, log)
        if (ms.io.data_cache_tag.peek().litToBoolean && log.contains(PA)) done = true
        ms.clock.step()
      }
      assert(done, "translated load did not complete")
      assert(log.contains(PA), s"load did not use translated address: ${log.map(x => x.toString(16))}")
      assert(log.contains(ROOT + 1 * 8), s"page walk did not happen: ${log.map(x => x.toString(16))}")
      // release the stall so the load result is written into mw_pipe_reg
      ms.io.stall.poke(false.B)
      ms.clock.step()
      // lw at offset 0x100 -> PA word offset 0 -> word 0x11223344
      assert(ms.io.mw_pipe_reg.load_data.peek().litValue == 0x11223344L,
        s"load_data=${ms.io.mw_pipe_reg.load_data.peek().litValue.toString(16)}")
    }
  }

  "MemoryStage holds dTLB fault for the trap" in {
    test(new MemoryStage) { ms =>
      val mem = newMem()
      map4k(VA, 0x44444, F_V | F_R | F_A | F_D | F_U, mem)  // user page, SUM=0
      setupMem(ms, emLoad(VA), paging = true)
      ms.io.stall.poke(true.B)
      val log = mutable.ArrayBuffer[BigInt]()
      var fault = BigInt(0)
      var got = false
      for (_ <- 0 until 60 if !got) {
        serveMem(ms, mem, log)
        if (ms.io.dTLB_fault.peek().litValue != 0 && ms.io.tlb_ready.peek().litToBoolean) {
          fault = ms.io.dTLB_fault.peek().litValue
          got = true
        }
        ms.clock.step()
      }
      assert(got, "dTLB fault did not surface")
      assert(fault == Page_fault.load_page_fault.litValue, s"fault=${fault}")
    }
  }
}

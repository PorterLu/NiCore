package myCPU

import chisel3._
import chiseltest._
import org.scalatest.freespec.AnyFreeSpec
import chisel3.experimental.BundleLiterals._
import myCPU.CSR._
import myCPU.Control._

import scala.collection.mutable

class AMOSpec extends AnyFreeSpec with ChiselScalatestTester {

  val ADDR = BigInt(0x80000100L)

  def emAMO(amoOp: UInt, ld: UInt, st: UInt, va: BigInt = ADDR, stData: BigInt = 0) =
    (new execute_mem_pipeline_reg).Lit(
      _.alu_out -> va.U, _.alu_sum -> 0.U, _.csr_read_data -> 0.U,
      _.csr_write_op -> 0.U, _.csr_write_addr -> 0.U, _.csr_write_data -> 0.U,
      _.jump_taken -> false.B, _.st_data -> stData.U, _.st_type -> st,
      _.ld_type -> ld, _.wb_sel -> WB_MEM, _.wb_en -> true.B,
      _.dest -> 1.U, _.pc -> 0x80001004L.U, _.inst -> Instructions.NOP,
      _.is_clint -> false.B, _.csr_inst_mode -> 0.U, _.csr_is_illegal -> false.B,
      _.csr_inst_misalign -> false.B, _.csr_load_misalign -> false.B,
      _.csr_store_misalign -> false.B, _.iTLB_fault -> 0.U,
      _.sfence_rs1 -> 0.U, _.sfence_rs2 -> 0.U, _.amo_op -> amoOp, _.enable -> true.B)

  def emStore(va: BigInt = ADDR, st: UInt = ST_SD, data: BigInt = 0) =
    emAMO(AMO_NONE, LD_XXX, st, va, data)

  def setupAMO(ms: MemoryStage, em: execute_mem_pipeline_reg, doReset: Boolean = true): Unit = {
    ms.io.stall.poke(false.B)
    ms.io.pipeline_stall.poke(false.B)
    ms.io.flush_mw.poke(false.B)
    ms.io.flush_em.poke(false.B)
    ms.io.em_pipe_reg.poke(em)
    ms.io.de_pipe_reg_ld_type.poke(0.U)
    ms.io.de_pipe_reg_st_type.poke(0.U)
    ms.io.de_pipe_reg_enable.poke(false.B)
    ms.io.dcache_flush_tag.poke(false.B)
    ms.io.alu_out.poke(em.alu_out.litValue.U)
    ms.io.src2_data.poke(0.U)
    ms.io.is_clint.poke(false.B)
    ms.io.tlb_valid.poke(false.B)          // bare mode: no paging
    ms.io.tlb_flush.poke(false.B)
    ms.io.tlb_flush_all.poke(false.B)
    ms.io.sum.poke(false.B)
    ms.io.mxr.poke(false.B)
    ms.io.mode.poke(CSR_MODE_M.litValue.U)
    ms.io.satp.poke(0.U)
    ms.io.dcache.cpu_response.data.poke(0.U)
    ms.io.dcache.cpu_response.ready.poke(false.B)
    if(doReset){
      ms.reset.poke(true.B)
      ms.clock.step()
      ms.reset.poke(false.B)
      ms.clock.step()
    }
    ms.io.em_pipe_reg.poke(em)
    ms.io.stall.poke(true.B)                // pipeline stalled on the memory op
    ms.clock.step()
  }

  // fake dcache with write support; memory holds 8-byte words at aligned addresses
  def serveAMO(ms: MemoryStage, mem: mutable.Map[BigInt, BigInt], log: mutable.ArrayBuffer[(BigInt, Boolean)]): Unit = {
    if (ms.io.dcache.cpu_request.valid.peek().litToBoolean) {
      val addr = ms.io.dcache.cpu_request.addr.peek().litValue
      val rw = ms.io.dcache.cpu_request.rw.peek().litToBoolean
      log += ((addr, rw))
      val mask = ms.io.dcache.cpu_request.mask.peek().litValue
      val data = ms.io.dcache.cpu_request.data.peek().litValue
      val base = addr & ~BigInt(7)
      if (rw) {
        var newv = BigInt(0)
        val old = mem.getOrElse(base, BigInt(0))
        for (b <- 0 until 8) {
          val byte = if (((mask >> b) & 1) == 1) (data >> (8 * b)) & 0xff else (old >> (8 * b)) & 0xff
          newv |= byte << (8 * b)
        }
        mem(base) = newv
        ms.io.dcache.cpu_response.data.poke(0.U)
      } else {
        ms.io.dcache.cpu_response.data.poke(mem.getOrElse(base, BigInt(0)).U)
      }
      ms.io.dcache.cpu_response.ready.poke(true.B)
    } else {
      ms.io.dcache.cpu_response.ready.poke(false.B)
    }
  }

  // run until the op fully completes (incl. the AMO store phase)
  def runAMO(ms: MemoryStage, mem: mutable.Map[BigInt, BigInt],
             log: mutable.ArrayBuffer[(BigInt, Boolean)], max: Int = 60): Boolean = {
    var done = false
    for (_ <- 0 until max if !done) {
      serveAMO(ms, mem, log)
      if (ms.io.data_cache_tag.peek().litToBoolean && !ms.io.amo_busy.peek().litToBoolean) done = true
      ms.clock.step()
    }
    done
  }

  // release the stall for one cycle like the real datapath does between
  // two memory instructions (this also clears data_cache_tag)
  def release(ms: MemoryStage): Unit = {
    ms.io.stall.poke(false.B)
    ms.clock.step()
    ms.io.stall.poke(true.B)
  }

  def rdValue(ms: MemoryStage): BigInt = {
    ms.io.stall.poke(false.B)
    ms.clock.step()
    ms.io.mw_pipe_reg.load_data.peek().litValue
  }

  def word(b: BigInt) = b & BigInt("ffffffff", 16)

  "AMOADD.W adds and returns the old value" in {
    test(new MemoryStage) { ms =>
      val mem = mutable.Map[BigInt, BigInt]((ADDR & ~7) -> BigInt(5))
      setupAMO(ms, emAMO(AMO_ADD, LD_LW, ST_SW, stData = 7))
      val log = mutable.ArrayBuffer[(BigInt, Boolean)]()
      assert(runAMO(ms, mem, log), "AMO did not complete")
      assert(mem(ADDR & ~7) == BigInt(12), s"mem=${mem(ADDR & ~7)}")
      assert(rdValue(ms) == 5, s"rd=${rdValue(ms)}")
      assert(log.map(_._2) == List(false, true), "should be one load then one store")
    }
  }

  "AMOSWAP.D swaps and returns the old value" in {
    test(new MemoryStage) { ms =>
      val mem = mutable.Map[BigInt, BigInt]((ADDR & ~7) -> BigInt(0x1122334455667788L))
      setupAMO(ms, emAMO(AMO_SWAP, LD_LD, ST_SD, stData = BigInt(0xdeadbeefL)))
      val log = mutable.ArrayBuffer[(BigInt, Boolean)]()
      assert(runAMO(ms, mem, log))
      assert(mem(ADDR & ~7) == BigInt(0xdeadbeefL))
      assert(rdValue(ms) == BigInt(0x1122334455667788L))
    }
  }

  "AMOMAX.W picks the signed maximum in 32 bits" in {
    test(new MemoryStage) { ms =>
      val mem = mutable.Map[BigInt, BigInt]((ADDR & ~7) -> BigInt("ffffffff", 16))
      setupAMO(ms, emAMO(AMO_MAX, LD_LW, ST_SW, stData = 1))
      val log = mutable.ArrayBuffer[(BigInt, Boolean)]()
      assert(runAMO(ms, mem, log))
      assert(word(mem(ADDR & ~7)) == BigInt(1), "signed max of -1 and 1 is 1")
      assert(rdValue(ms) == BigInt("ffffffffffffffff", 16))  // LW sign-extends
    }
  }

  "AMOMINU.W picks the unsigned minimum in 32 bits" in {
    test(new MemoryStage) { ms =>
      val mem = mutable.Map[BigInt, BigInt]((ADDR & ~7) -> BigInt(0xffffffffL))
      setupAMO(ms, emAMO(AMO_MINU, LD_LW, ST_SW, stData = 1))
      val log = mutable.ArrayBuffer[(BigInt, Boolean)]()
      assert(runAMO(ms, mem, log))
      assert(word(mem(ADDR & ~7)) == BigInt(1), "unsigned min of 0xffffffff and 1 is 1")
    }
  }

  "LR.D returns the value and SC.D succeeds after it" in {
    test(new MemoryStage) { ms =>
      val mem = mutable.Map[BigInt, BigInt]((ADDR & ~7) -> BigInt(0xcafeL))
      val log1 = mutable.ArrayBuffer[(BigInt, Boolean)]()
      setupAMO(ms, emAMO(AMO_LR, LD_LD, ST_XXX))
      assert(runAMO(ms, mem, log1))
      assert(rdValue(ms) == BigInt(0xcafeL))
      assert(log1.map(_._2) == List(false), "LR must not write")

      release(ms)
      val log2 = mutable.ArrayBuffer[(BigInt, Boolean)]()
      setupAMO(ms, emAMO(AMO_SC, LD_LD, ST_SD, stData = BigInt(0x1234L)), doReset = false)
      assert(runAMO(ms, mem, log2))
      assert(mem(ADDR & ~7) == BigInt(0x1234L), "SC must store on success")
      assert(rdValue(ms) == 0, "SC success returns 0")
      assert(log2.map(_._2) == List(true), "SC issues a single store")
    }
  }

  "SC fails without a reservation" in {
    test(new MemoryStage) { ms =>
      val mem = mutable.Map[BigInt, BigInt]((ADDR & ~7) -> BigInt(5))
      val log = mutable.ArrayBuffer[(BigInt, Boolean)]()
      setupAMO(ms, emAMO(AMO_SC, LD_LD, ST_SD, stData = BigInt(0x1234L)))
      assert(runAMO(ms, mem, log))
      assert(rdValue(ms) == 1, "SC failure returns 1")
      assert(mem(ADDR & ~7) == BigInt(5), "failed SC must not write")
      assert(!log.exists(_._2), "failed SC must not issue a store")
    }
  }

  "a plain store between LR and SC makes the SC fail" in {
    test(new MemoryStage) { ms =>
      val mem = mutable.Map[BigInt, BigInt]((ADDR & ~7) -> BigInt(5))
      setupAMO(ms, emAMO(AMO_LR, LD_LD, ST_XXX))
      assert(runAMO(ms, mem, mutable.ArrayBuffer[(BigInt, Boolean)]()))

      release(ms)
      setupAMO(ms, emStore(st = ST_SD, data = BigInt(9)), doReset = false)
      assert(runAMO(ms, mem, mutable.ArrayBuffer[(BigInt, Boolean)]()))
      assert(mem(ADDR & ~7) == BigInt(9))

      release(ms)
      val log = mutable.ArrayBuffer[(BigInt, Boolean)]()
      setupAMO(ms, emAMO(AMO_SC, LD_LD, ST_SD, stData = BigInt(0x1234L)), doReset = false)
      assert(runAMO(ms, mem, log))
      assert(rdValue(ms) == 1, "SC must fail after an intervening store")
      assert(mem(ADDR & ~7) == BigInt(9))
    }
  }

  "AMO at word offset 4 accesses the upper half" in {
    test(new MemoryStage) { ms =>
      val addr4 = ADDR + 4
      val mem = mutable.Map[BigInt, BigInt]((ADDR & ~7) -> (BigInt(0x88776655L) << 32 | BigInt(0x11223344L)))
      setupAMO(ms, emAMO(AMO_ADD, LD_LW, ST_SW, va = addr4, stData = 1))
      val log = mutable.ArrayBuffer[(BigInt, Boolean)]()
      assert(runAMO(ms, mem, log))
      val v = mem(ADDR & ~7)
      assert(word(v) == BigInt(0x11223344L), "lower half untouched")
      assert(word(v >> 32) == word(BigInt(0x88776655L) + 1), "upper half incremented")
      assert(rdValue(ms) == BigInt("ffffffff88776655", 16),
        s"rd=${rdValue(ms).toString(16)}")
    }
  }
}

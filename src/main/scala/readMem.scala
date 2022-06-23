package mem

import chisel3._ 
import chisel3.util._
import chisel3.util.experimental.loadMemoryFromFileInline
import chisel3.stage.ChiselStage

class mem(memFile : String="") extends Module{

    val mem = SyncReadMem(4096,UInt(12.W))
    if(memFile.trim().nonEmpty)
    {
        loadMemoryFromFileInline(mem, memFile)
    }

    for(i <- 0 to 256)
    {
        printf("%d\n",mem(i))
    }
}

object Driver extends App{
    (new ChiselStage).emitVerilog(new mem("ascii.hex"), args)
}
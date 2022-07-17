

/*
case class CoreConfig(
	xlen:		Int,
	makeAlu: 	Int => Alu = new AluSimple(_),
	makeBrCond: Int => BrCond = new BrCondSimple(_),
	makeImmGen: Int => ImmGen = new ImmGenWire(_))

class Core(val conf: CoreConfig) extends Module{
	val io = IO(new coreIO(conf.xlen))
	val ctrl = Module(new Control)
}*/
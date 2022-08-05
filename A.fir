circuit A :
  module A :
    input clock : Clock
    input reset : UInt<1>
    output io : { out : UInt<4>, flip in : UInt<4>}

    io.out <= UInt<1>("h0") @[when.scala 16:16]
    node _T = eq(io.in, UInt<1>("h1")) @[when.scala 17:20]
    when _T : @[when.scala 17:28]
      io.out <= UInt<2>("h2") @[when.scala 18:24]


circuit test :
  module test :
    input clock : Clock
    input reset : UInt<1>
    input io : { valid : UInt<1>, bits : { data : UInt<64>, addr : UInt<64>}}

    skip


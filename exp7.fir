circuit exp7 :
  module keyboard :
    input clock : Clock
    input reset : Reset
    output io : { flip next_data_n : UInt<1>, flip ps2_clk : UInt<1>, flip ps2_dat : UInt<1>, out : UInt<8>, ready : UInt<1>}

    reg buffer : UInt<10>, clock with :
      reset => (reset, UInt<10>("h0")) @[exp7.scala 126:25]
    reg ready : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[exp7.scala 127:24]
    reg count : UInt<8>, clock with :
      reset => (reset, UInt<8>("h0")) @[exp7.scala 128:24]
    reg ps2_clk_sync : UInt<3>, clock with :
      reset => (reset, UInt<3>("h0")) @[exp7.scala 129:31]
    reg next_data_n : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[exp7.scala 130:30]
    reg fifo : UInt<8>[8], clock with :
      reset => (UInt<1>("h0"), fifo) @[exp7.scala 131:19]
    reg w_ptr : UInt<3>, clock with :
      reset => (reset, UInt<3>("h0")) @[exp7.scala 132:24]
    reg r_ptr : UInt<3>, clock with :
      reset => (reset, UInt<3>("h0")) @[exp7.scala 133:24]
    next_data_n <= io.next_data_n @[exp7.scala 135:17]
    io.out <= fifo[r_ptr] @[exp7.scala 136:12]
    io.ready <= ready @[exp7.scala 137:14]
    node _ps2_clk_sync_T = bits(ps2_clk_sync, 1, 0) @[exp7.scala 139:37]
    node _ps2_clk_sync_T_1 = cat(_ps2_clk_sync_T, io.ps2_clk) @[Cat.scala 31:58]
    ps2_clk_sync <= _ps2_clk_sync_T_1 @[exp7.scala 139:18]
    when ready : @[exp7.scala 142:5]
      node _T = add(r_ptr, UInt<1>("h1")) @[exp7.scala 144:30]
      node _T_1 = tail(_T, 1) @[exp7.scala 144:30]
      node _T_2 = eq(w_ptr, _T_1) @[exp7.scala 144:20]
      when _T_2 : @[exp7.scala 145:9]
        ready <= UInt<1>("h0") @[exp7.scala 146:23]
    when next_data_n : @[exp7.scala 157:5]
      node _r_ptr_T = add(r_ptr, UInt<1>("h1")) @[exp7.scala 159:28]
      node _r_ptr_T_1 = tail(_r_ptr_T, 1) @[exp7.scala 159:28]
      r_ptr <= _r_ptr_T_1 @[exp7.scala 159:19]
    node _T_3 = bits(ps2_clk_sync, 2, 2) @[exp7.scala 162:22]
    node _T_4 = bits(ps2_clk_sync, 1, 1) @[exp7.scala 162:42]
    node _T_5 = not(_T_4) @[exp7.scala 162:29]
    node _T_6 = and(_T_3, _T_5) @[exp7.scala 162:26]
    when _T_6 : @[exp7.scala 163:5]
      node _T_7 = eq(count, UInt<4>("ha")) @[exp7.scala 164:20]
      when _T_7 : @[exp7.scala 165:9]
        node _T_8 = bits(io.ps2_dat, 0, 0) @[exp7.scala 166:29]
        node _T_9 = bits(buffer, 0, 0) @[exp7.scala 166:46]
        node _T_10 = not(_T_9) @[exp7.scala 166:39]
        node _T_11 = and(_T_8, _T_10) @[exp7.scala 166:36]
        node _T_12 = bits(buffer, 9, 1) @[exp7.scala 166:59]
        node _T_13 = xorr(_T_12) @[exp7.scala 166:65]
        node _T_14 = and(_T_11, _T_13) @[exp7.scala 166:50]
        when _T_14 : @[exp7.scala 167:13]
          node _fifo_T = bits(buffer, 8, 1) @[exp7.scala 168:38]
          fifo[w_ptr] <= _fifo_T @[exp7.scala 168:29]
          node _w_ptr_T = add(w_ptr, UInt<1>("h1")) @[exp7.scala 169:32]
          node _w_ptr_T_1 = tail(_w_ptr_T, 1) @[exp7.scala 169:32]
          w_ptr <= _w_ptr_T_1 @[exp7.scala 169:23]
          ready <= UInt<1>("h1") @[exp7.scala 170:23]
        count <= UInt<1>("h0") @[exp7.scala 172:19]
        buffer <= UInt<1>("h0") @[exp7.scala 173:20]
      else :
        node _buffer_T = dshl(io.ps2_dat, count) @[exp7.scala 176:43]
        node _buffer_T_1 = or(buffer, _buffer_T) @[exp7.scala 176:30]
        buffer <= _buffer_T_1 @[exp7.scala 176:20]
        node _count_T = add(count, UInt<1>("h1")) @[exp7.scala 177:28]
        node _count_T_1 = tail(_count_T, 1) @[exp7.scala 177:28]
        count <= _count_T_1 @[exp7.scala 177:19]

  module bcd7 :
    input clock : Clock
    input reset : Reset
    output io : { flip in : UInt<4>, out : UInt<7>}

    io.out <= UInt<1>("h0") @[bcd7seg.scala 12:16]
    node _T = eq(UInt<1>("h0"), io.in) @[bcd7seg.scala 14:9]
    when _T : @[bcd7seg.scala 14:9]
      io.out <= UInt<7>("h40") @[bcd7seg.scala 16:21]
    else :
      node _T_1 = eq(UInt<1>("h1"), io.in) @[bcd7seg.scala 14:9]
      when _T_1 : @[bcd7seg.scala 14:9]
        io.out <= UInt<7>("h79") @[bcd7seg.scala 18:21]
      else :
        node _T_2 = eq(UInt<2>("h2"), io.in) @[bcd7seg.scala 14:9]
        when _T_2 : @[bcd7seg.scala 14:9]
          io.out <= UInt<6>("h24") @[bcd7seg.scala 20:20]
        else :
          node _T_3 = eq(UInt<2>("h3"), io.in) @[bcd7seg.scala 14:9]
          when _T_3 : @[bcd7seg.scala 14:9]
            io.out <= UInt<6>("h30") @[bcd7seg.scala 22:21]
          else :
            node _T_4 = eq(UInt<3>("h4"), io.in) @[bcd7seg.scala 14:9]
            when _T_4 : @[bcd7seg.scala 14:9]
              io.out <= UInt<5>("h19") @[bcd7seg.scala 24:21]
            else :
              node _T_5 = eq(UInt<3>("h5"), io.in) @[bcd7seg.scala 14:9]
              when _T_5 : @[bcd7seg.scala 14:9]
                io.out <= UInt<5>("h12") @[bcd7seg.scala 26:21]
              else :
                node _T_6 = eq(UInt<3>("h6"), io.in) @[bcd7seg.scala 14:9]
                when _T_6 : @[bcd7seg.scala 14:9]
                  io.out <= UInt<2>("h2") @[bcd7seg.scala 28:21]
                else :
                  node _T_7 = eq(UInt<3>("h7"), io.in) @[bcd7seg.scala 14:9]
                  when _T_7 : @[bcd7seg.scala 14:9]
                    io.out <= UInt<7>("h78") @[bcd7seg.scala 30:21]
                  else :
                    node _T_8 = eq(UInt<4>("h8"), io.in) @[bcd7seg.scala 14:9]
                    when _T_8 : @[bcd7seg.scala 14:9]
                      io.out <= UInt<1>("h0") @[bcd7seg.scala 32:21]
                    else :
                      node _T_9 = eq(UInt<4>("h9"), io.in) @[bcd7seg.scala 14:9]
                      when _T_9 : @[bcd7seg.scala 14:9]
                        io.out <= UInt<5>("h10") @[bcd7seg.scala 34:21]
                      else :
                        node _T_10 = eq(UInt<4>("ha"), io.in) @[bcd7seg.scala 14:9]
                        when _T_10 : @[bcd7seg.scala 14:9]
                          io.out <= UInt<4>("h8") @[bcd7seg.scala 36:21]
                        else :
                          node _T_11 = eq(UInt<4>("hb"), io.in) @[bcd7seg.scala 14:9]
                          when _T_11 : @[bcd7seg.scala 14:9]
                            io.out <= UInt<2>("h3") @[bcd7seg.scala 38:21]
                          else :
                            node _T_12 = eq(UInt<4>("hc"), io.in) @[bcd7seg.scala 14:9]
                            when _T_12 : @[bcd7seg.scala 14:9]
                              io.out <= UInt<7>("h46") @[bcd7seg.scala 40:21]
                            else :
                              node _T_13 = eq(UInt<4>("hd"), io.in) @[bcd7seg.scala 14:9]
                              when _T_13 : @[bcd7seg.scala 14:9]
                                io.out <= UInt<6>("h21") @[bcd7seg.scala 42:21]
                              else :
                                node _T_14 = eq(UInt<4>("he"), io.in) @[bcd7seg.scala 14:9]
                                when _T_14 : @[bcd7seg.scala 14:9]
                                  io.out <= UInt<3>("h6") @[bcd7seg.scala 44:21]
                                else :
                                  node _T_15 = eq(UInt<4>("hf"), io.in) @[bcd7seg.scala 14:9]
                                  when _T_15 : @[bcd7seg.scala 14:9]
                                    io.out <= UInt<4>("he") @[bcd7seg.scala 46:21]

  module bcd7_1 :
    input clock : Clock
    input reset : Reset
    output io : { flip in : UInt<4>, out : UInt<7>}

    io.out <= UInt<1>("h0") @[bcd7seg.scala 12:16]
    node _T = eq(UInt<1>("h0"), io.in) @[bcd7seg.scala 14:9]
    when _T : @[bcd7seg.scala 14:9]
      io.out <= UInt<7>("h40") @[bcd7seg.scala 16:21]
    else :
      node _T_1 = eq(UInt<1>("h1"), io.in) @[bcd7seg.scala 14:9]
      when _T_1 : @[bcd7seg.scala 14:9]
        io.out <= UInt<7>("h79") @[bcd7seg.scala 18:21]
      else :
        node _T_2 = eq(UInt<2>("h2"), io.in) @[bcd7seg.scala 14:9]
        when _T_2 : @[bcd7seg.scala 14:9]
          io.out <= UInt<6>("h24") @[bcd7seg.scala 20:20]
        else :
          node _T_3 = eq(UInt<2>("h3"), io.in) @[bcd7seg.scala 14:9]
          when _T_3 : @[bcd7seg.scala 14:9]
            io.out <= UInt<6>("h30") @[bcd7seg.scala 22:21]
          else :
            node _T_4 = eq(UInt<3>("h4"), io.in) @[bcd7seg.scala 14:9]
            when _T_4 : @[bcd7seg.scala 14:9]
              io.out <= UInt<5>("h19") @[bcd7seg.scala 24:21]
            else :
              node _T_5 = eq(UInt<3>("h5"), io.in) @[bcd7seg.scala 14:9]
              when _T_5 : @[bcd7seg.scala 14:9]
                io.out <= UInt<5>("h12") @[bcd7seg.scala 26:21]
              else :
                node _T_6 = eq(UInt<3>("h6"), io.in) @[bcd7seg.scala 14:9]
                when _T_6 : @[bcd7seg.scala 14:9]
                  io.out <= UInt<2>("h2") @[bcd7seg.scala 28:21]
                else :
                  node _T_7 = eq(UInt<3>("h7"), io.in) @[bcd7seg.scala 14:9]
                  when _T_7 : @[bcd7seg.scala 14:9]
                    io.out <= UInt<7>("h78") @[bcd7seg.scala 30:21]
                  else :
                    node _T_8 = eq(UInt<4>("h8"), io.in) @[bcd7seg.scala 14:9]
                    when _T_8 : @[bcd7seg.scala 14:9]
                      io.out <= UInt<1>("h0") @[bcd7seg.scala 32:21]
                    else :
                      node _T_9 = eq(UInt<4>("h9"), io.in) @[bcd7seg.scala 14:9]
                      when _T_9 : @[bcd7seg.scala 14:9]
                        io.out <= UInt<5>("h10") @[bcd7seg.scala 34:21]
                      else :
                        node _T_10 = eq(UInt<4>("ha"), io.in) @[bcd7seg.scala 14:9]
                        when _T_10 : @[bcd7seg.scala 14:9]
                          io.out <= UInt<4>("h8") @[bcd7seg.scala 36:21]
                        else :
                          node _T_11 = eq(UInt<4>("hb"), io.in) @[bcd7seg.scala 14:9]
                          when _T_11 : @[bcd7seg.scala 14:9]
                            io.out <= UInt<2>("h3") @[bcd7seg.scala 38:21]
                          else :
                            node _T_12 = eq(UInt<4>("hc"), io.in) @[bcd7seg.scala 14:9]
                            when _T_12 : @[bcd7seg.scala 14:9]
                              io.out <= UInt<7>("h46") @[bcd7seg.scala 40:21]
                            else :
                              node _T_13 = eq(UInt<4>("hd"), io.in) @[bcd7seg.scala 14:9]
                              when _T_13 : @[bcd7seg.scala 14:9]
                                io.out <= UInt<6>("h21") @[bcd7seg.scala 42:21]
                              else :
                                node _T_14 = eq(UInt<4>("he"), io.in) @[bcd7seg.scala 14:9]
                                when _T_14 : @[bcd7seg.scala 14:9]
                                  io.out <= UInt<3>("h6") @[bcd7seg.scala 44:21]
                                else :
                                  node _T_15 = eq(UInt<4>("hf"), io.in) @[bcd7seg.scala 14:9]
                                  when _T_15 : @[bcd7seg.scala 14:9]
                                    io.out <= UInt<4>("he") @[bcd7seg.scala 46:21]

  module exp7 :
    input clock : Clock
    input reset : UInt<1>
    output io : { flip ps2_clk : UInt<1>, flip ps2_dat : UInt<1>, out_scan : UInt<14>}

    inst keyboard of keyboard @[exp7.scala 191:26]
    keyboard.clock <= clock
    keyboard.reset <= reset
    reg counter : UInt<8>, clock with :
      reset => (reset, UInt<8>("h0")) @[exp7.scala 192:26]
    reg out_scan : UInt<14>, clock with :
      reset => (reset, UInt<14>("h3fff")) @[exp7.scala 193:27]
    inst bcd_1 of bcd7 @[exp7.scala 195:23]
    bcd_1.clock <= clock
    bcd_1.reset <= reset
    inst bcd_2 of bcd7_1 @[exp7.scala 196:23]
    bcd_2.clock <= clock
    bcd_2.reset <= reset
    keyboard.io.ps2_clk <= io.ps2_clk @[exp7.scala 198:25]
    keyboard.io.ps2_dat <= io.ps2_dat @[exp7.scala 199:25]
    bcd_1.io.in <= UInt<1>("h0") @[exp7.scala 201:17]
    bcd_2.io.in <= UInt<1>("h0") @[exp7.scala 202:17]
    keyboard.io.next_data_n <= UInt<1>("h0") @[exp7.scala 203:29]
    io.out_scan <= out_scan @[exp7.scala 204:17]
    when keyboard.io.ready : @[exp7.scala 209:5]
      node _bcd_1_io_in_T = bits(keyboard.io.out, 3, 0) @[exp7.scala 210:39]
      bcd_1.io.in <= _bcd_1_io_in_T @[exp7.scala 210:21]
      node _bcd_2_io_in_T = bits(keyboard.io.out, 7, 4) @[exp7.scala 211:39]
      bcd_2.io.in <= _bcd_2_io_in_T @[exp7.scala 211:21]
      keyboard.io.next_data_n <= UInt<1>("h1") @[exp7.scala 212:33]
      node _T = bits(reset, 0, 0) @[exp7.scala 213:15]
      node _T_1 = eq(_T, UInt<1>("h0")) @[exp7.scala 213:15]
      when _T_1 : @[exp7.scala 213:15]
        printf(clock, UInt<1>("h1"), "scan code %x\n", keyboard.io.out) : printf @[exp7.scala 213:15]
      node _out_scan_T = cat(bcd_2.io.out, bcd_1.io.out) @[Cat.scala 31:58]
      out_scan <= _out_scan_T @[exp7.scala 214:18]


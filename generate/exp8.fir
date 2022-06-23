circuit exp8 :
  module vmem :
    input clock : Clock
    input reset : Reset
    output io : { flip h_addr : UInt<10>, flip v_addr : UInt<9>, vga_data : UInt<24>}

    smem mem : UInt<24> [524288] @[exp8.scala 76:26]
    wire addr : UInt<19> @[exp8.scala 81:20]
    node _addr_T = cat(io.h_addr, io.v_addr) @[Cat.scala 31:58]
    addr <= _addr_T @[exp8.scala 82:10]
    infer mport io_vga_data_MPORT = mem[addr], clock @[exp8.scala 83:23]
    io.vga_data <= io_vga_data_MPORT @[exp8.scala 83:17]

  module vga_ctrl :
    input clock : Clock
    input reset : Reset
    output io : { flip vga_data : UInt<24>, h_addr : UInt<10>, v_addr : UInt<10>, hsync : UInt<1>, vsync : UInt<1>, valid : UInt<1>, vga_r : UInt<8>, vga_g : UInt<8>, vga_b : UInt<8>}

    reg x_cnt : UInt<10>, clock with :
      reset => (reset, UInt<10>("h0")) @[exp8.scala 34:24]
    reg y_cnt : UInt<10>, clock with :
      reset => (reset, UInt<10>("h0")) @[exp8.scala 35:24]
    wire h_valid : UInt<1> @[exp8.scala 36:23]
    wire v_valid : UInt<1> @[exp8.scala 37:23]
    node _T = asUInt(UInt<10>("h320")) @[exp8.scala 39:42]
    node _T_1 = eq(x_cnt, _T) @[exp8.scala 39:16]
    when _T_1 : @[exp8.scala 40:5]
      x_cnt <= UInt<1>("h1") @[exp8.scala 41:15]
    else :
      node _x_cnt_T = add(x_cnt, UInt<1>("h1")) @[exp8.scala 44:24]
      node _x_cnt_T_1 = tail(_x_cnt_T, 1) @[exp8.scala 44:24]
      x_cnt <= _x_cnt_T_1 @[exp8.scala 44:15]
    node _T_2 = asUInt(UInt<10>("h20d")) @[exp8.scala 47:42]
    node _T_3 = eq(y_cnt, _T_2) @[exp8.scala 47:16]
    node _T_4 = asUInt(UInt<10>("h320")) @[exp8.scala 47:84]
    node _T_5 = eq(x_cnt, _T_4) @[exp8.scala 47:58]
    node _T_6 = and(_T_3, _T_5) @[exp8.scala 47:49]
    when _T_6 : @[exp8.scala 48:5]
      y_cnt <= UInt<1>("h1") @[exp8.scala 49:15]
    else :
      node _T_7 = asUInt(UInt<10>("h320")) @[exp8.scala 50:48]
      node _T_8 = eq(x_cnt, _T_7) @[exp8.scala 50:22]
      when _T_8 : @[exp8.scala 51:5]
        node _y_cnt_T = add(y_cnt, UInt<1>("h1")) @[exp8.scala 52:24]
        node _y_cnt_T_1 = tail(_y_cnt_T, 1) @[exp8.scala 52:24]
        y_cnt <= _y_cnt_T_1 @[exp8.scala 52:15]
    node _io_hsync_T = asUInt(UInt<7>("h60")) @[exp8.scala 55:52]
    node _io_hsync_T_1 = gt(x_cnt, _io_hsync_T) @[exp8.scala 55:23]
    io.hsync <= _io_hsync_T_1 @[exp8.scala 55:14]
    node _io_vsync_T = asUInt(UInt<2>("h2")) @[exp8.scala 56:52]
    node _io_vsync_T_1 = gt(y_cnt, _io_vsync_T) @[exp8.scala 56:23]
    io.vsync <= _io_vsync_T_1 @[exp8.scala 56:14]
    node _h_valid_T = asUInt(UInt<8>("h90")) @[exp8.scala 57:48]
    node _h_valid_T_1 = gt(x_cnt, _h_valid_T) @[exp8.scala 57:23]
    node _h_valid_T_2 = asUInt(UInt<10>("h310")) @[exp8.scala 57:95]
    node _h_valid_T_3 = leq(x_cnt, _h_valid_T_2) @[exp8.scala 57:66]
    node _h_valid_T_4 = and(_h_valid_T_1, _h_valid_T_3) @[exp8.scala 57:56]
    h_valid <= _h_valid_T_4 @[exp8.scala 57:13]
    node _v_valid_T = asUInt(UInt<6>("h23")) @[exp8.scala 58:48]
    node _v_valid_T_1 = gt(y_cnt, _v_valid_T) @[exp8.scala 58:23]
    node _v_valid_T_2 = asUInt(UInt<10>("h203")) @[exp8.scala 58:95]
    node _v_valid_T_3 = leq(y_cnt, _v_valid_T_2) @[exp8.scala 58:66]
    node _v_valid_T_4 = and(_v_valid_T_1, _v_valid_T_3) @[exp8.scala 58:56]
    v_valid <= _v_valid_T_4 @[exp8.scala 58:13]
    node _io_valid_T = and(h_valid, v_valid) @[exp8.scala 59:25]
    io.valid <= _io_valid_T @[exp8.scala 59:14]
    node _io_h_addr_T = sub(x_cnt, UInt<8>("h91")) @[exp8.scala 61:37]
    node _io_h_addr_T_1 = tail(_io_h_addr_T, 1) @[exp8.scala 61:37]
    node _io_h_addr_T_2 = mux(h_valid, _io_h_addr_T_1, UInt<1>("h0")) @[exp8.scala 61:21]
    io.h_addr <= _io_h_addr_T_2 @[exp8.scala 61:15]
    node _io_v_addr_T = sub(y_cnt, UInt<6>("h24")) @[exp8.scala 62:37]
    node _io_v_addr_T_1 = tail(_io_v_addr_T, 1) @[exp8.scala 62:37]
    node _io_v_addr_T_2 = mux(v_valid, _io_v_addr_T_1, UInt<1>("h0")) @[exp8.scala 62:21]
    io.v_addr <= _io_v_addr_T_2 @[exp8.scala 62:15]
    node _io_vga_r_T = bits(io.vga_data, 23, 16) @[exp8.scala 64:28]
    io.vga_r <= _io_vga_r_T @[exp8.scala 64:14]
    node _io_vga_g_T = bits(io.vga_data, 15, 8) @[exp8.scala 65:28]
    io.vga_g <= _io_vga_g_T @[exp8.scala 65:14]
    node _io_vga_b_T = bits(io.vga_data, 7, 0) @[exp8.scala 66:28]
    io.vga_b <= _io_vga_b_T @[exp8.scala 66:14]

  module exp8 :
    input clock : Clock
    input reset : UInt<1>
    output io : { hsync : UInt<1>, vsync : UInt<1>, valid : UInt<1>, vga_r : UInt<8>, vga_g : UInt<8>, vga_b : UInt<8>}

    wire h_addr : UInt<10>
    h_addr <= UInt<10>("h0")
    wire v_addr : UInt<10>
    v_addr <= UInt<10>("h0")
    inst mem of vmem @[exp8.scala 98:21]
    mem.clock <= clock
    mem.reset <= reset
    inst vga_ctrl of vga_ctrl @[exp8.scala 99:26]
    vga_ctrl.clock <= clock
    vga_ctrl.reset <= reset
    mem.io.h_addr <= vga_ctrl.io.h_addr @[exp8.scala 101:19]
    node _mem_io_v_addr_T = bits(vga_ctrl.io.v_addr, 8, 0) @[exp8.scala 102:40]
    mem.io.v_addr <= _mem_io_v_addr_T @[exp8.scala 102:19]
    vga_ctrl.io.vga_data <= mem.io.vga_data @[exp8.scala 103:26]
    io.hsync <= vga_ctrl.io.hsync @[exp8.scala 105:14]
    io.vsync <= vga_ctrl.io.vsync @[exp8.scala 106:14]
    io.valid <= vga_ctrl.io.valid @[exp8.scala 107:14]
    io.vga_r <= vga_ctrl.io.vga_r @[exp8.scala 108:14]
    io.vga_g <= vga_ctrl.io.vga_g @[exp8.scala 109:14]
    io.vga_b <= vga_ctrl.io.vga_b @[exp8.scala 110:14]


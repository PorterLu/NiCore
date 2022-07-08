module RegisterFile(
  input         clock,
  input         reset,
  input         io_wen,
  input  [4:0]  io_waddr,
  input  [63:0] io_wdata,
  input  [4:0]  io_raddr_0,
  input  [4:0]  io_raddr_1,
  output [63:0] io_rdata_0,
  output [63:0] io_rdata_1,
  output [63:0] io_rdata_4,
  output [63:0] io_rdata_5,
  output [63:0] io_rdata_6,
  output [63:0] io_rdata_7,
  output [63:0] io_rdata_8,
  output [63:0] io_rdata_9,
  output [63:0] io_rdata_10,
  output [63:0] io_rdata_11,
  output [63:0] io_rdata_12,
  output [63:0] io_rdata_13,
  output [63:0] io_rdata_14,
  output [63:0] io_rdata_15,
  output [63:0] io_rdata_16,
  output [63:0] io_rdata_17,
  output [63:0] io_rdata_18,
  output [63:0] io_rdata_19,
  output [63:0] io_rdata_20,
  output [63:0] io_rdata_21,
  output [63:0] io_rdata_22,
  output [63:0] io_rdata_23,
  output [63:0] io_rdata_24,
  output [63:0] io_rdata_25,
  output [63:0] io_rdata_26,
  output [63:0] io_rdata_27,
  output [63:0] io_rdata_28,
  output [63:0] io_rdata_29,
  output [63:0] io_rdata_30,
  output [63:0] io_rdata_31,
  output [63:0] io_rdata_32,
  output [63:0] io_rdata_33,
  output [63:0] io_rdata_34
);
`ifdef RANDOMIZE_REG_INIT
  reg [63:0] _RAND_0;
  reg [63:0] _RAND_1;
  reg [63:0] _RAND_2;
  reg [63:0] _RAND_3;
  reg [63:0] _RAND_4;
  reg [63:0] _RAND_5;
  reg [63:0] _RAND_6;
  reg [63:0] _RAND_7;
  reg [63:0] _RAND_8;
  reg [63:0] _RAND_9;
  reg [63:0] _RAND_10;
  reg [63:0] _RAND_11;
  reg [63:0] _RAND_12;
  reg [63:0] _RAND_13;
  reg [63:0] _RAND_14;
  reg [63:0] _RAND_15;
  reg [63:0] _RAND_16;
  reg [63:0] _RAND_17;
  reg [63:0] _RAND_18;
  reg [63:0] _RAND_19;
  reg [63:0] _RAND_20;
  reg [63:0] _RAND_21;
  reg [63:0] _RAND_22;
  reg [63:0] _RAND_23;
  reg [63:0] _RAND_24;
  reg [63:0] _RAND_25;
  reg [63:0] _RAND_26;
  reg [63:0] _RAND_27;
  reg [63:0] _RAND_28;
  reg [63:0] _RAND_29;
  reg [63:0] _RAND_30;
  reg [63:0] _RAND_31;
`endif // RANDOMIZE_REG_INIT
  reg [63:0] reg_0; // @[alu.scala 66:22]
  reg [63:0] reg_1; // @[alu.scala 66:22]
  reg [63:0] reg_2; // @[alu.scala 66:22]
  reg [63:0] reg_3; // @[alu.scala 66:22]
  reg [63:0] reg_4; // @[alu.scala 66:22]
  reg [63:0] reg_5; // @[alu.scala 66:22]
  reg [63:0] reg_6; // @[alu.scala 66:22]
  reg [63:0] reg_7; // @[alu.scala 66:22]
  reg [63:0] reg_8; // @[alu.scala 66:22]
  reg [63:0] reg_9; // @[alu.scala 66:22]
  reg [63:0] reg_10; // @[alu.scala 66:22]
  reg [63:0] reg_11; // @[alu.scala 66:22]
  reg [63:0] reg_12; // @[alu.scala 66:22]
  reg [63:0] reg_13; // @[alu.scala 66:22]
  reg [63:0] reg_14; // @[alu.scala 66:22]
  reg [63:0] reg_15; // @[alu.scala 66:22]
  reg [63:0] reg_16; // @[alu.scala 66:22]
  reg [63:0] reg_17; // @[alu.scala 66:22]
  reg [63:0] reg_18; // @[alu.scala 66:22]
  reg [63:0] reg_19; // @[alu.scala 66:22]
  reg [63:0] reg_20; // @[alu.scala 66:22]
  reg [63:0] reg_21; // @[alu.scala 66:22]
  reg [63:0] reg_22; // @[alu.scala 66:22]
  reg [63:0] reg_23; // @[alu.scala 66:22]
  reg [63:0] reg_24; // @[alu.scala 66:22]
  reg [63:0] reg_25; // @[alu.scala 66:22]
  reg [63:0] reg_26; // @[alu.scala 66:22]
  reg [63:0] reg_27; // @[alu.scala 66:22]
  reg [63:0] reg_28; // @[alu.scala 66:22]
  reg [63:0] reg_29; // @[alu.scala 66:22]
  reg [63:0] reg_30; // @[alu.scala 66:22]
  reg [63:0] reg_31; // @[alu.scala 66:22]
  wire [63:0] _GEN_65 = 5'h1 == io_raddr_0 ? reg_1 : reg_0; // @[alu.scala 77:{25,25}]
  wire [63:0] _GEN_66 = 5'h2 == io_raddr_0 ? reg_2 : _GEN_65; // @[alu.scala 77:{25,25}]
  wire [63:0] _GEN_67 = 5'h3 == io_raddr_0 ? reg_3 : _GEN_66; // @[alu.scala 77:{25,25}]
  wire [63:0] _GEN_68 = 5'h4 == io_raddr_0 ? reg_4 : _GEN_67; // @[alu.scala 77:{25,25}]
  wire [63:0] _GEN_69 = 5'h5 == io_raddr_0 ? reg_5 : _GEN_68; // @[alu.scala 77:{25,25}]
  wire [63:0] _GEN_70 = 5'h6 == io_raddr_0 ? reg_6 : _GEN_69; // @[alu.scala 77:{25,25}]
  wire [63:0] _GEN_71 = 5'h7 == io_raddr_0 ? reg_7 : _GEN_70; // @[alu.scala 77:{25,25}]
  wire [63:0] _GEN_72 = 5'h8 == io_raddr_0 ? reg_8 : _GEN_71; // @[alu.scala 77:{25,25}]
  wire [63:0] _GEN_73 = 5'h9 == io_raddr_0 ? reg_9 : _GEN_72; // @[alu.scala 77:{25,25}]
  wire [63:0] _GEN_74 = 5'ha == io_raddr_0 ? reg_10 : _GEN_73; // @[alu.scala 77:{25,25}]
  wire [63:0] _GEN_75 = 5'hb == io_raddr_0 ? reg_11 : _GEN_74; // @[alu.scala 77:{25,25}]
  wire [63:0] _GEN_76 = 5'hc == io_raddr_0 ? reg_12 : _GEN_75; // @[alu.scala 77:{25,25}]
  wire [63:0] _GEN_77 = 5'hd == io_raddr_0 ? reg_13 : _GEN_76; // @[alu.scala 77:{25,25}]
  wire [63:0] _GEN_78 = 5'he == io_raddr_0 ? reg_14 : _GEN_77; // @[alu.scala 77:{25,25}]
  wire [63:0] _GEN_79 = 5'hf == io_raddr_0 ? reg_15 : _GEN_78; // @[alu.scala 77:{25,25}]
  wire [63:0] _GEN_80 = 5'h10 == io_raddr_0 ? reg_16 : _GEN_79; // @[alu.scala 77:{25,25}]
  wire [63:0] _GEN_81 = 5'h11 == io_raddr_0 ? reg_17 : _GEN_80; // @[alu.scala 77:{25,25}]
  wire [63:0] _GEN_82 = 5'h12 == io_raddr_0 ? reg_18 : _GEN_81; // @[alu.scala 77:{25,25}]
  wire [63:0] _GEN_83 = 5'h13 == io_raddr_0 ? reg_19 : _GEN_82; // @[alu.scala 77:{25,25}]
  wire [63:0] _GEN_84 = 5'h14 == io_raddr_0 ? reg_20 : _GEN_83; // @[alu.scala 77:{25,25}]
  wire [63:0] _GEN_85 = 5'h15 == io_raddr_0 ? reg_21 : _GEN_84; // @[alu.scala 77:{25,25}]
  wire [63:0] _GEN_86 = 5'h16 == io_raddr_0 ? reg_22 : _GEN_85; // @[alu.scala 77:{25,25}]
  wire [63:0] _GEN_87 = 5'h17 == io_raddr_0 ? reg_23 : _GEN_86; // @[alu.scala 77:{25,25}]
  wire [63:0] _GEN_88 = 5'h18 == io_raddr_0 ? reg_24 : _GEN_87; // @[alu.scala 77:{25,25}]
  wire [63:0] _GEN_89 = 5'h19 == io_raddr_0 ? reg_25 : _GEN_88; // @[alu.scala 77:{25,25}]
  wire [63:0] _GEN_90 = 5'h1a == io_raddr_0 ? reg_26 : _GEN_89; // @[alu.scala 77:{25,25}]
  wire [63:0] _GEN_91 = 5'h1b == io_raddr_0 ? reg_27 : _GEN_90; // @[alu.scala 77:{25,25}]
  wire [63:0] _GEN_92 = 5'h1c == io_raddr_0 ? reg_28 : _GEN_91; // @[alu.scala 77:{25,25}]
  wire [63:0] _GEN_93 = 5'h1d == io_raddr_0 ? reg_29 : _GEN_92; // @[alu.scala 77:{25,25}]
  wire [63:0] _GEN_94 = 5'h1e == io_raddr_0 ? reg_30 : _GEN_93; // @[alu.scala 77:{25,25}]
  wire [63:0] _GEN_95 = 5'h1f == io_raddr_0 ? reg_31 : _GEN_94; // @[alu.scala 77:{25,25}]
  wire [63:0] _GEN_98 = 5'h1 == io_raddr_1 ? reg_1 : reg_0; // @[alu.scala 77:{25,25}]
  wire [63:0] _GEN_99 = 5'h2 == io_raddr_1 ? reg_2 : _GEN_98; // @[alu.scala 77:{25,25}]
  wire [63:0] _GEN_100 = 5'h3 == io_raddr_1 ? reg_3 : _GEN_99; // @[alu.scala 77:{25,25}]
  wire [63:0] _GEN_101 = 5'h4 == io_raddr_1 ? reg_4 : _GEN_100; // @[alu.scala 77:{25,25}]
  wire [63:0] _GEN_102 = 5'h5 == io_raddr_1 ? reg_5 : _GEN_101; // @[alu.scala 77:{25,25}]
  wire [63:0] _GEN_103 = 5'h6 == io_raddr_1 ? reg_6 : _GEN_102; // @[alu.scala 77:{25,25}]
  wire [63:0] _GEN_104 = 5'h7 == io_raddr_1 ? reg_7 : _GEN_103; // @[alu.scala 77:{25,25}]
  wire [63:0] _GEN_105 = 5'h8 == io_raddr_1 ? reg_8 : _GEN_104; // @[alu.scala 77:{25,25}]
  wire [63:0] _GEN_106 = 5'h9 == io_raddr_1 ? reg_9 : _GEN_105; // @[alu.scala 77:{25,25}]
  wire [63:0] _GEN_107 = 5'ha == io_raddr_1 ? reg_10 : _GEN_106; // @[alu.scala 77:{25,25}]
  wire [63:0] _GEN_108 = 5'hb == io_raddr_1 ? reg_11 : _GEN_107; // @[alu.scala 77:{25,25}]
  wire [63:0] _GEN_109 = 5'hc == io_raddr_1 ? reg_12 : _GEN_108; // @[alu.scala 77:{25,25}]
  wire [63:0] _GEN_110 = 5'hd == io_raddr_1 ? reg_13 : _GEN_109; // @[alu.scala 77:{25,25}]
  wire [63:0] _GEN_111 = 5'he == io_raddr_1 ? reg_14 : _GEN_110; // @[alu.scala 77:{25,25}]
  wire [63:0] _GEN_112 = 5'hf == io_raddr_1 ? reg_15 : _GEN_111; // @[alu.scala 77:{25,25}]
  wire [63:0] _GEN_113 = 5'h10 == io_raddr_1 ? reg_16 : _GEN_112; // @[alu.scala 77:{25,25}]
  wire [63:0] _GEN_114 = 5'h11 == io_raddr_1 ? reg_17 : _GEN_113; // @[alu.scala 77:{25,25}]
  wire [63:0] _GEN_115 = 5'h12 == io_raddr_1 ? reg_18 : _GEN_114; // @[alu.scala 77:{25,25}]
  wire [63:0] _GEN_116 = 5'h13 == io_raddr_1 ? reg_19 : _GEN_115; // @[alu.scala 77:{25,25}]
  wire [63:0] _GEN_117 = 5'h14 == io_raddr_1 ? reg_20 : _GEN_116; // @[alu.scala 77:{25,25}]
  wire [63:0] _GEN_118 = 5'h15 == io_raddr_1 ? reg_21 : _GEN_117; // @[alu.scala 77:{25,25}]
  wire [63:0] _GEN_119 = 5'h16 == io_raddr_1 ? reg_22 : _GEN_118; // @[alu.scala 77:{25,25}]
  wire [63:0] _GEN_120 = 5'h17 == io_raddr_1 ? reg_23 : _GEN_119; // @[alu.scala 77:{25,25}]
  wire [63:0] _GEN_121 = 5'h18 == io_raddr_1 ? reg_24 : _GEN_120; // @[alu.scala 77:{25,25}]
  wire [63:0] _GEN_122 = 5'h19 == io_raddr_1 ? reg_25 : _GEN_121; // @[alu.scala 77:{25,25}]
  wire [63:0] _GEN_123 = 5'h1a == io_raddr_1 ? reg_26 : _GEN_122; // @[alu.scala 77:{25,25}]
  wire [63:0] _GEN_124 = 5'h1b == io_raddr_1 ? reg_27 : _GEN_123; // @[alu.scala 77:{25,25}]
  wire [63:0] _GEN_125 = 5'h1c == io_raddr_1 ? reg_28 : _GEN_124; // @[alu.scala 77:{25,25}]
  wire [63:0] _GEN_126 = 5'h1d == io_raddr_1 ? reg_29 : _GEN_125; // @[alu.scala 77:{25,25}]
  wire [63:0] _GEN_127 = 5'h1e == io_raddr_1 ? reg_30 : _GEN_126; // @[alu.scala 77:{25,25}]
  wire [63:0] _GEN_128 = 5'h1f == io_raddr_1 ? reg_31 : _GEN_127; // @[alu.scala 77:{25,25}]
  assign io_rdata_0 = io_raddr_0 == 5'h0 ? 64'h0 : _GEN_95; // @[alu.scala 74:34 75:25 77:25]
  assign io_rdata_1 = io_raddr_1 == 5'h0 ? 64'h0 : _GEN_128; // @[alu.scala 74:34 75:25 77:25]
  assign io_rdata_4 = reg_1; // @[alu.scala 74:34 75:25 77:25]
  assign io_rdata_5 = reg_2; // @[alu.scala 74:34 75:25 77:25]
  assign io_rdata_6 = reg_3; // @[alu.scala 74:34 75:25 77:25]
  assign io_rdata_7 = reg_4; // @[alu.scala 74:34 75:25 77:25]
  assign io_rdata_8 = reg_5; // @[alu.scala 74:34 75:25 77:25]
  assign io_rdata_9 = reg_6; // @[alu.scala 74:34 75:25 77:25]
  assign io_rdata_10 = reg_7; // @[alu.scala 74:34 75:25 77:25]
  assign io_rdata_11 = reg_8; // @[alu.scala 74:34 75:25 77:25]
  assign io_rdata_12 = reg_9; // @[alu.scala 74:34 75:25 77:25]
  assign io_rdata_13 = reg_10; // @[alu.scala 74:34 75:25 77:25]
  assign io_rdata_14 = reg_11; // @[alu.scala 74:34 75:25 77:25]
  assign io_rdata_15 = reg_12; // @[alu.scala 74:34 75:25 77:25]
  assign io_rdata_16 = reg_13; // @[alu.scala 74:34 75:25 77:25]
  assign io_rdata_17 = reg_14; // @[alu.scala 74:34 75:25 77:25]
  assign io_rdata_18 = reg_15; // @[alu.scala 74:34 75:25 77:25]
  assign io_rdata_19 = reg_16; // @[alu.scala 74:34 75:25 77:25]
  assign io_rdata_20 = reg_17; // @[alu.scala 74:34 75:25 77:25]
  assign io_rdata_21 = reg_18; // @[alu.scala 74:34 75:25 77:25]
  assign io_rdata_22 = reg_19; // @[alu.scala 74:34 75:25 77:25]
  assign io_rdata_23 = reg_20; // @[alu.scala 74:34 75:25 77:25]
  assign io_rdata_24 = reg_21; // @[alu.scala 74:34 75:25 77:25]
  assign io_rdata_25 = reg_22; // @[alu.scala 74:34 75:25 77:25]
  assign io_rdata_26 = reg_23; // @[alu.scala 74:34 75:25 77:25]
  assign io_rdata_27 = reg_24; // @[alu.scala 74:34 75:25 77:25]
  assign io_rdata_28 = reg_25; // @[alu.scala 74:34 75:25 77:25]
  assign io_rdata_29 = reg_26; // @[alu.scala 74:34 75:25 77:25]
  assign io_rdata_30 = reg_27; // @[alu.scala 74:34 75:25 77:25]
  assign io_rdata_31 = reg_28; // @[alu.scala 74:34 75:25 77:25]
  assign io_rdata_32 = reg_29; // @[alu.scala 74:34 75:25 77:25]
  assign io_rdata_33 = reg_30; // @[alu.scala 74:34 75:25 77:25]
  assign io_rdata_34 = reg_31; // @[alu.scala 74:34 75:25 77:25]
  always @(posedge clock) begin
    if (reset) begin // @[alu.scala 66:22]
      reg_0 <= 64'h0; // @[alu.scala 66:22]
    end else if (io_wen) begin // @[alu.scala 68:17]
      if (5'h0 == io_waddr) begin // @[alu.scala 69:23]
        reg_0 <= io_wdata; // @[alu.scala 69:23]
      end
    end
    if (reset) begin // @[alu.scala 66:22]
      reg_1 <= 64'h0; // @[alu.scala 66:22]
    end else if (io_wen) begin // @[alu.scala 68:17]
      if (5'h1 == io_waddr) begin // @[alu.scala 69:23]
        reg_1 <= io_wdata; // @[alu.scala 69:23]
      end
    end
    if (reset) begin // @[alu.scala 66:22]
      reg_2 <= 64'h0; // @[alu.scala 66:22]
    end else if (io_wen) begin // @[alu.scala 68:17]
      if (5'h2 == io_waddr) begin // @[alu.scala 69:23]
        reg_2 <= io_wdata; // @[alu.scala 69:23]
      end
    end
    if (reset) begin // @[alu.scala 66:22]
      reg_3 <= 64'h0; // @[alu.scala 66:22]
    end else if (io_wen) begin // @[alu.scala 68:17]
      if (5'h3 == io_waddr) begin // @[alu.scala 69:23]
        reg_3 <= io_wdata; // @[alu.scala 69:23]
      end
    end
    if (reset) begin // @[alu.scala 66:22]
      reg_4 <= 64'h0; // @[alu.scala 66:22]
    end else if (io_wen) begin // @[alu.scala 68:17]
      if (5'h4 == io_waddr) begin // @[alu.scala 69:23]
        reg_4 <= io_wdata; // @[alu.scala 69:23]
      end
    end
    if (reset) begin // @[alu.scala 66:22]
      reg_5 <= 64'h0; // @[alu.scala 66:22]
    end else if (io_wen) begin // @[alu.scala 68:17]
      if (5'h5 == io_waddr) begin // @[alu.scala 69:23]
        reg_5 <= io_wdata; // @[alu.scala 69:23]
      end
    end
    if (reset) begin // @[alu.scala 66:22]
      reg_6 <= 64'h0; // @[alu.scala 66:22]
    end else if (io_wen) begin // @[alu.scala 68:17]
      if (5'h6 == io_waddr) begin // @[alu.scala 69:23]
        reg_6 <= io_wdata; // @[alu.scala 69:23]
      end
    end
    if (reset) begin // @[alu.scala 66:22]
      reg_7 <= 64'h0; // @[alu.scala 66:22]
    end else if (io_wen) begin // @[alu.scala 68:17]
      if (5'h7 == io_waddr) begin // @[alu.scala 69:23]
        reg_7 <= io_wdata; // @[alu.scala 69:23]
      end
    end
    if (reset) begin // @[alu.scala 66:22]
      reg_8 <= 64'h0; // @[alu.scala 66:22]
    end else if (io_wen) begin // @[alu.scala 68:17]
      if (5'h8 == io_waddr) begin // @[alu.scala 69:23]
        reg_8 <= io_wdata; // @[alu.scala 69:23]
      end
    end
    if (reset) begin // @[alu.scala 66:22]
      reg_9 <= 64'h0; // @[alu.scala 66:22]
    end else if (io_wen) begin // @[alu.scala 68:17]
      if (5'h9 == io_waddr) begin // @[alu.scala 69:23]
        reg_9 <= io_wdata; // @[alu.scala 69:23]
      end
    end
    if (reset) begin // @[alu.scala 66:22]
      reg_10 <= 64'h0; // @[alu.scala 66:22]
    end else if (io_wen) begin // @[alu.scala 68:17]
      if (5'ha == io_waddr) begin // @[alu.scala 69:23]
        reg_10 <= io_wdata; // @[alu.scala 69:23]
      end
    end
    if (reset) begin // @[alu.scala 66:22]
      reg_11 <= 64'h0; // @[alu.scala 66:22]
    end else if (io_wen) begin // @[alu.scala 68:17]
      if (5'hb == io_waddr) begin // @[alu.scala 69:23]
        reg_11 <= io_wdata; // @[alu.scala 69:23]
      end
    end
    if (reset) begin // @[alu.scala 66:22]
      reg_12 <= 64'h0; // @[alu.scala 66:22]
    end else if (io_wen) begin // @[alu.scala 68:17]
      if (5'hc == io_waddr) begin // @[alu.scala 69:23]
        reg_12 <= io_wdata; // @[alu.scala 69:23]
      end
    end
    if (reset) begin // @[alu.scala 66:22]
      reg_13 <= 64'h0; // @[alu.scala 66:22]
    end else if (io_wen) begin // @[alu.scala 68:17]
      if (5'hd == io_waddr) begin // @[alu.scala 69:23]
        reg_13 <= io_wdata; // @[alu.scala 69:23]
      end
    end
    if (reset) begin // @[alu.scala 66:22]
      reg_14 <= 64'h0; // @[alu.scala 66:22]
    end else if (io_wen) begin // @[alu.scala 68:17]
      if (5'he == io_waddr) begin // @[alu.scala 69:23]
        reg_14 <= io_wdata; // @[alu.scala 69:23]
      end
    end
    if (reset) begin // @[alu.scala 66:22]
      reg_15 <= 64'h0; // @[alu.scala 66:22]
    end else if (io_wen) begin // @[alu.scala 68:17]
      if (5'hf == io_waddr) begin // @[alu.scala 69:23]
        reg_15 <= io_wdata; // @[alu.scala 69:23]
      end
    end
    if (reset) begin // @[alu.scala 66:22]
      reg_16 <= 64'h0; // @[alu.scala 66:22]
    end else if (io_wen) begin // @[alu.scala 68:17]
      if (5'h10 == io_waddr) begin // @[alu.scala 69:23]
        reg_16 <= io_wdata; // @[alu.scala 69:23]
      end
    end
    if (reset) begin // @[alu.scala 66:22]
      reg_17 <= 64'h0; // @[alu.scala 66:22]
    end else if (io_wen) begin // @[alu.scala 68:17]
      if (5'h11 == io_waddr) begin // @[alu.scala 69:23]
        reg_17 <= io_wdata; // @[alu.scala 69:23]
      end
    end
    if (reset) begin // @[alu.scala 66:22]
      reg_18 <= 64'h0; // @[alu.scala 66:22]
    end else if (io_wen) begin // @[alu.scala 68:17]
      if (5'h12 == io_waddr) begin // @[alu.scala 69:23]
        reg_18 <= io_wdata; // @[alu.scala 69:23]
      end
    end
    if (reset) begin // @[alu.scala 66:22]
      reg_19 <= 64'h0; // @[alu.scala 66:22]
    end else if (io_wen) begin // @[alu.scala 68:17]
      if (5'h13 == io_waddr) begin // @[alu.scala 69:23]
        reg_19 <= io_wdata; // @[alu.scala 69:23]
      end
    end
    if (reset) begin // @[alu.scala 66:22]
      reg_20 <= 64'h0; // @[alu.scala 66:22]
    end else if (io_wen) begin // @[alu.scala 68:17]
      if (5'h14 == io_waddr) begin // @[alu.scala 69:23]
        reg_20 <= io_wdata; // @[alu.scala 69:23]
      end
    end
    if (reset) begin // @[alu.scala 66:22]
      reg_21 <= 64'h0; // @[alu.scala 66:22]
    end else if (io_wen) begin // @[alu.scala 68:17]
      if (5'h15 == io_waddr) begin // @[alu.scala 69:23]
        reg_21 <= io_wdata; // @[alu.scala 69:23]
      end
    end
    if (reset) begin // @[alu.scala 66:22]
      reg_22 <= 64'h0; // @[alu.scala 66:22]
    end else if (io_wen) begin // @[alu.scala 68:17]
      if (5'h16 == io_waddr) begin // @[alu.scala 69:23]
        reg_22 <= io_wdata; // @[alu.scala 69:23]
      end
    end
    if (reset) begin // @[alu.scala 66:22]
      reg_23 <= 64'h0; // @[alu.scala 66:22]
    end else if (io_wen) begin // @[alu.scala 68:17]
      if (5'h17 == io_waddr) begin // @[alu.scala 69:23]
        reg_23 <= io_wdata; // @[alu.scala 69:23]
      end
    end
    if (reset) begin // @[alu.scala 66:22]
      reg_24 <= 64'h0; // @[alu.scala 66:22]
    end else if (io_wen) begin // @[alu.scala 68:17]
      if (5'h18 == io_waddr) begin // @[alu.scala 69:23]
        reg_24 <= io_wdata; // @[alu.scala 69:23]
      end
    end
    if (reset) begin // @[alu.scala 66:22]
      reg_25 <= 64'h0; // @[alu.scala 66:22]
    end else if (io_wen) begin // @[alu.scala 68:17]
      if (5'h19 == io_waddr) begin // @[alu.scala 69:23]
        reg_25 <= io_wdata; // @[alu.scala 69:23]
      end
    end
    if (reset) begin // @[alu.scala 66:22]
      reg_26 <= 64'h0; // @[alu.scala 66:22]
    end else if (io_wen) begin // @[alu.scala 68:17]
      if (5'h1a == io_waddr) begin // @[alu.scala 69:23]
        reg_26 <= io_wdata; // @[alu.scala 69:23]
      end
    end
    if (reset) begin // @[alu.scala 66:22]
      reg_27 <= 64'h0; // @[alu.scala 66:22]
    end else if (io_wen) begin // @[alu.scala 68:17]
      if (5'h1b == io_waddr) begin // @[alu.scala 69:23]
        reg_27 <= io_wdata; // @[alu.scala 69:23]
      end
    end
    if (reset) begin // @[alu.scala 66:22]
      reg_28 <= 64'h0; // @[alu.scala 66:22]
    end else if (io_wen) begin // @[alu.scala 68:17]
      if (5'h1c == io_waddr) begin // @[alu.scala 69:23]
        reg_28 <= io_wdata; // @[alu.scala 69:23]
      end
    end
    if (reset) begin // @[alu.scala 66:22]
      reg_29 <= 64'h0; // @[alu.scala 66:22]
    end else if (io_wen) begin // @[alu.scala 68:17]
      if (5'h1d == io_waddr) begin // @[alu.scala 69:23]
        reg_29 <= io_wdata; // @[alu.scala 69:23]
      end
    end
    if (reset) begin // @[alu.scala 66:22]
      reg_30 <= 64'h0; // @[alu.scala 66:22]
    end else if (io_wen) begin // @[alu.scala 68:17]
      if (5'h1e == io_waddr) begin // @[alu.scala 69:23]
        reg_30 <= io_wdata; // @[alu.scala 69:23]
      end
    end
    if (reset) begin // @[alu.scala 66:22]
      reg_31 <= 64'h0; // @[alu.scala 66:22]
    end else if (io_wen) begin // @[alu.scala 68:17]
      if (5'h1f == io_waddr) begin // @[alu.scala 69:23]
        reg_31 <= io_wdata; // @[alu.scala 69:23]
      end
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {2{`RANDOM}};
  reg_0 = _RAND_0[63:0];
  _RAND_1 = {2{`RANDOM}};
  reg_1 = _RAND_1[63:0];
  _RAND_2 = {2{`RANDOM}};
  reg_2 = _RAND_2[63:0];
  _RAND_3 = {2{`RANDOM}};
  reg_3 = _RAND_3[63:0];
  _RAND_4 = {2{`RANDOM}};
  reg_4 = _RAND_4[63:0];
  _RAND_5 = {2{`RANDOM}};
  reg_5 = _RAND_5[63:0];
  _RAND_6 = {2{`RANDOM}};
  reg_6 = _RAND_6[63:0];
  _RAND_7 = {2{`RANDOM}};
  reg_7 = _RAND_7[63:0];
  _RAND_8 = {2{`RANDOM}};
  reg_8 = _RAND_8[63:0];
  _RAND_9 = {2{`RANDOM}};
  reg_9 = _RAND_9[63:0];
  _RAND_10 = {2{`RANDOM}};
  reg_10 = _RAND_10[63:0];
  _RAND_11 = {2{`RANDOM}};
  reg_11 = _RAND_11[63:0];
  _RAND_12 = {2{`RANDOM}};
  reg_12 = _RAND_12[63:0];
  _RAND_13 = {2{`RANDOM}};
  reg_13 = _RAND_13[63:0];
  _RAND_14 = {2{`RANDOM}};
  reg_14 = _RAND_14[63:0];
  _RAND_15 = {2{`RANDOM}};
  reg_15 = _RAND_15[63:0];
  _RAND_16 = {2{`RANDOM}};
  reg_16 = _RAND_16[63:0];
  _RAND_17 = {2{`RANDOM}};
  reg_17 = _RAND_17[63:0];
  _RAND_18 = {2{`RANDOM}};
  reg_18 = _RAND_18[63:0];
  _RAND_19 = {2{`RANDOM}};
  reg_19 = _RAND_19[63:0];
  _RAND_20 = {2{`RANDOM}};
  reg_20 = _RAND_20[63:0];
  _RAND_21 = {2{`RANDOM}};
  reg_21 = _RAND_21[63:0];
  _RAND_22 = {2{`RANDOM}};
  reg_22 = _RAND_22[63:0];
  _RAND_23 = {2{`RANDOM}};
  reg_23 = _RAND_23[63:0];
  _RAND_24 = {2{`RANDOM}};
  reg_24 = _RAND_24[63:0];
  _RAND_25 = {2{`RANDOM}};
  reg_25 = _RAND_25[63:0];
  _RAND_26 = {2{`RANDOM}};
  reg_26 = _RAND_26[63:0];
  _RAND_27 = {2{`RANDOM}};
  reg_27 = _RAND_27[63:0];
  _RAND_28 = {2{`RANDOM}};
  reg_28 = _RAND_28[63:0];
  _RAND_29 = {2{`RANDOM}};
  reg_29 = _RAND_29[63:0];
  _RAND_30 = {2{`RANDOM}};
  reg_30 = _RAND_30[63:0];
  _RAND_31 = {2{`RANDOM}};
  reg_31 = _RAND_31[63:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module myCPU(
  input         clock,
  input         reset,
  output [63:0] io_dat_addr,
  output [63:0] io_pc_addr,
  output        io_wen,
  output [63:0] io_wdata,
  input  [63:0] io_rdata,
  input  [31:0] io_instr,
  output [63:0] io_pc_debug
);
`ifdef RANDOMIZE_REG_INIT
  reg [63:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [63:0] _RAND_2;
`endif // RANDOMIZE_REG_INIT
  wire  regFile_clock; // @[alu.scala 130:25]
  wire  regFile_reset; // @[alu.scala 130:25]
  wire  regFile_io_wen; // @[alu.scala 130:25]
  wire [4:0] regFile_io_waddr; // @[alu.scala 130:25]
  wire [63:0] regFile_io_wdata; // @[alu.scala 130:25]
  wire [4:0] regFile_io_raddr_0; // @[alu.scala 130:25]
  wire [4:0] regFile_io_raddr_1; // @[alu.scala 130:25]
  wire [63:0] regFile_io_rdata_0; // @[alu.scala 130:25]
  wire [63:0] regFile_io_rdata_1; // @[alu.scala 130:25]
  wire [63:0] regFile_io_rdata_4; // @[alu.scala 130:25]
  wire [63:0] regFile_io_rdata_5; // @[alu.scala 130:25]
  wire [63:0] regFile_io_rdata_6; // @[alu.scala 130:25]
  wire [63:0] regFile_io_rdata_7; // @[alu.scala 130:25]
  wire [63:0] regFile_io_rdata_8; // @[alu.scala 130:25]
  wire [63:0] regFile_io_rdata_9; // @[alu.scala 130:25]
  wire [63:0] regFile_io_rdata_10; // @[alu.scala 130:25]
  wire [63:0] regFile_io_rdata_11; // @[alu.scala 130:25]
  wire [63:0] regFile_io_rdata_12; // @[alu.scala 130:25]
  wire [63:0] regFile_io_rdata_13; // @[alu.scala 130:25]
  wire [63:0] regFile_io_rdata_14; // @[alu.scala 130:25]
  wire [63:0] regFile_io_rdata_15; // @[alu.scala 130:25]
  wire [63:0] regFile_io_rdata_16; // @[alu.scala 130:25]
  wire [63:0] regFile_io_rdata_17; // @[alu.scala 130:25]
  wire [63:0] regFile_io_rdata_18; // @[alu.scala 130:25]
  wire [63:0] regFile_io_rdata_19; // @[alu.scala 130:25]
  wire [63:0] regFile_io_rdata_20; // @[alu.scala 130:25]
  wire [63:0] regFile_io_rdata_21; // @[alu.scala 130:25]
  wire [63:0] regFile_io_rdata_22; // @[alu.scala 130:25]
  wire [63:0] regFile_io_rdata_23; // @[alu.scala 130:25]
  wire [63:0] regFile_io_rdata_24; // @[alu.scala 130:25]
  wire [63:0] regFile_io_rdata_25; // @[alu.scala 130:25]
  wire [63:0] regFile_io_rdata_26; // @[alu.scala 130:25]
  wire [63:0] regFile_io_rdata_27; // @[alu.scala 130:25]
  wire [63:0] regFile_io_rdata_28; // @[alu.scala 130:25]
  wire [63:0] regFile_io_rdata_29; // @[alu.scala 130:25]
  wire [63:0] regFile_io_rdata_30; // @[alu.scala 130:25]
  wire [63:0] regFile_io_rdata_31; // @[alu.scala 130:25]
  wire [63:0] regFile_io_rdata_32; // @[alu.scala 130:25]
  wire [63:0] regFile_io_rdata_33; // @[alu.scala 130:25]
  wire [63:0] regFile_io_rdata_34; // @[alu.scala 130:25]
  wire  reg_debug_clock; // @[alu.scala 136:31]
  wire  reg_debug_reset; // @[alu.scala 136:31]
  wire [63:0] reg_debug_regfile_0; // @[alu.scala 136:31]
  wire [63:0] reg_debug_regfile_1; // @[alu.scala 136:31]
  wire [63:0] reg_debug_regfile_2; // @[alu.scala 136:31]
  wire [63:0] reg_debug_regfile_3; // @[alu.scala 136:31]
  wire [63:0] reg_debug_regfile_4; // @[alu.scala 136:31]
  wire [63:0] reg_debug_regfile_5; // @[alu.scala 136:31]
  wire [63:0] reg_debug_regfile_6; // @[alu.scala 136:31]
  wire [63:0] reg_debug_regfile_7; // @[alu.scala 136:31]
  wire [63:0] reg_debug_regfile_8; // @[alu.scala 136:31]
  wire [63:0] reg_debug_regfile_9; // @[alu.scala 136:31]
  wire [63:0] reg_debug_regfile_10; // @[alu.scala 136:31]
  wire [63:0] reg_debug_regfile_11; // @[alu.scala 136:31]
  wire [63:0] reg_debug_regfile_12; // @[alu.scala 136:31]
  wire [63:0] reg_debug_regfile_13; // @[alu.scala 136:31]
  wire [63:0] reg_debug_regfile_14; // @[alu.scala 136:31]
  wire [63:0] reg_debug_regfile_15; // @[alu.scala 136:31]
  wire [63:0] reg_debug_regfile_16; // @[alu.scala 136:31]
  wire [63:0] reg_debug_regfile_17; // @[alu.scala 136:31]
  wire [63:0] reg_debug_regfile_18; // @[alu.scala 136:31]
  wire [63:0] reg_debug_regfile_19; // @[alu.scala 136:31]
  wire [63:0] reg_debug_regfile_20; // @[alu.scala 136:31]
  wire [63:0] reg_debug_regfile_21; // @[alu.scala 136:31]
  wire [63:0] reg_debug_regfile_22; // @[alu.scala 136:31]
  wire [63:0] reg_debug_regfile_23; // @[alu.scala 136:31]
  wire [63:0] reg_debug_regfile_24; // @[alu.scala 136:31]
  wire [63:0] reg_debug_regfile_25; // @[alu.scala 136:31]
  wire [63:0] reg_debug_regfile_26; // @[alu.scala 136:31]
  wire [63:0] reg_debug_regfile_27; // @[alu.scala 136:31]
  wire [63:0] reg_debug_regfile_28; // @[alu.scala 136:31]
  wire [63:0] reg_debug_regfile_29; // @[alu.scala 136:31]
  wire [63:0] reg_debug_regfile_30; // @[alu.scala 136:31]
  wire [63:0] reg_debug_regfile_31; // @[alu.scala 136:31]
  wire  ebreak_enable; // @[alu.scala 167:24]
  reg [63:0] pc; // @[alu.scala 133:21]
  reg [31:0] instr; // @[alu.scala 134:24]
  wire [31:0] op = instr & 32'h7f; // @[alu.scala 159:34]
  wire  _is_4_T_1 = 32'h6f == op; // @[alu.scala 175:24]
  wire [31:0] _is_4_T_3 = instr & 32'h707f; // @[alu.scala 175:41]
  wire  _is_4_T_4 = 32'h67 == _is_4_T_3; // @[alu.scala 175:41]
  wire  is_4 = ~(32'h6f == op) & ~(32'h67 == _is_4_T_3); // @[alu.scala 175:32]
  wire [63:0] _pc_T_1 = pc + 64'h4; // @[alu.scala 176:24]
  wire  _T_1 = 32'h13 == _is_4_T_3; // @[alu.scala 183:20]
  wire  _T_3 = 32'h17 == op; // @[alu.scala 196:22]
  wire [31:0] _imm_T = instr & 32'hfff00000; // @[alu.scala 188:23]
  wire [31:0] _imm_T_1 = {{20'd0}, _imm_T[31:20]}; // @[alu.scala 188:36]
  wire [31:0] _imm_T_2 = instr & 32'hfffff000; // @[alu.scala 198:31]
  wire [31:0] _imm_T_3 = {{12'd0}, _imm_T_2[31:12]}; // @[alu.scala 198:44]
  wire  _T_5 = 32'h37 == op; // @[alu.scala 206:27]
  wire  _T_7 = 32'h3023 == _is_4_T_3; // @[alu.scala 216:26]
  wire [31:0] _imm_tmp_T = instr & 32'hfe003000; // @[alu.scala 218:39]
  wire [11:0] _imm_tmp_T_4 = {_imm_tmp_T[31:25],_imm_tmp_T[11:7]}; // @[Cat.scala 31:58]
  wire [31:0] _GEN_11 = _is_4_T_1 ? _imm_T_2 : 32'h0; // @[alu.scala 233:9 234:25]
  wire [31:0] _GEN_22 = _T_7 ? {{20'd0}, _imm_tmp_T_4} : _GEN_11; // @[alu.scala 217:9 218:25]
  wire [31:0] _GEN_43 = _T_5 ? 32'h0 : _GEN_22; // @[alu.scala 207:9]
  wire [31:0] _GEN_59 = _T_3 ? 32'h0 : _GEN_43; // @[alu.scala 197:9]
  wire [31:0] imm_tmp = _T_1 ? 32'h0 : _GEN_59; // @[alu.scala 184:9]
  wire [53:0] _imm_T_10 = {42'h3ffffffffff,imm_tmp[11:0]}; // @[Cat.scala 31:58]
  wire [53:0] _imm_T_13 = {42'h0,imm_tmp[11:0]}; // @[Cat.scala 31:58]
  wire [53:0] _imm_T_14 = instr[31] ? _imm_T_10 : _imm_T_13; // @[alu.scala 219:27]
  wire [20:0] _imm_T_19 = {imm_tmp[31],imm_tmp[19:12],imm_tmp[20],imm_tmp[30:21],1'h0}; // @[Cat.scala 31:58]
  wire [31:0] _GEN_3 = _is_4_T_4 ? _imm_T_1 : 32'h0; // @[alu.scala 245:9 249:13]
  wire [31:0] _GEN_12 = _is_4_T_1 ? {{11'd0}, _imm_T_19} : _GEN_3; // @[alu.scala 233:9 235:21]
  wire [53:0] _GEN_23 = _T_7 ? _imm_T_14 : {{22'd0}, _GEN_12}; // @[alu.scala 217:9 219:21]
  wire [53:0] _GEN_37 = _T_5 ? {{22'd0}, _imm_T_3} : _GEN_23; // @[alu.scala 207:9 208:21]
  wire [53:0] _GEN_52 = _T_3 ? {{22'd0}, _imm_T_3} : _GEN_37; // @[alu.scala 197:9 198:21]
  wire [53:0] _GEN_69 = _T_1 ? {{22'd0}, _imm_T_1} : _GEN_52; // @[alu.scala 184:9 188:13]
  wire [31:0] imm = _GEN_69[31:0];
  wire [43:0] _GEN_86 = {imm, 12'h0}; // @[alu.scala 199:73]
  wire [46:0] _src1_T_3 = {{3'd0}, _GEN_86}; // @[alu.scala 199:73]
  wire [78:0] _src1_T_4 = {32'hffffffff,_src1_T_3}; // @[Cat.scala 31:58]
  wire [78:0] _src1_T_7 = {32'h0,_src1_T_3}; // @[Cat.scala 31:58]
  wire [78:0] _src1_T_8 = instr[31] ? _src1_T_4 : _src1_T_7; // @[alu.scala 199:28]
  wire [63:0] _src1_T_22 = {43'h7ffffffffff,imm[20:0]}; // @[Cat.scala 31:58]
  wire [63:0] _src1_T_25 = {43'h0,imm[20:0]}; // @[Cat.scala 31:58]
  wire [63:0] _src1_T_26 = instr[31] ? _src1_T_22 : _src1_T_25; // @[alu.scala 236:28]
  wire [63:0] _GEN_2 = _is_4_T_4 ? regFile_io_rdata_0 : 64'h0; // @[alu.scala 245:9 247:14]
  wire [63:0] _GEN_13 = _is_4_T_1 ? _src1_T_26 : _GEN_2; // @[alu.scala 233:9 236:22]
  wire [63:0] _GEN_26 = _T_7 ? regFile_io_rdata_0 : _GEN_13; // @[alu.scala 217:9 223:22]
  wire [78:0] _GEN_38 = _T_5 ? _src1_T_8 : {{15'd0}, _GEN_26}; // @[alu.scala 207:9 209:22]
  wire [78:0] _GEN_53 = _T_3 ? _src1_T_8 : _GEN_38; // @[alu.scala 197:9 199:22]
  wire [78:0] _GEN_68 = _T_1 ? {{15'd0}, regFile_io_rdata_0} : _GEN_53; // @[alu.scala 184:9 186:14]
  wire [63:0] src1 = _GEN_68[63:0];
  wire [63:0] _pc_remote_T_1 = pc + src1; // @[alu.scala 200:33]
  wire [63:0] _pc_remote_T_3 = src1 + pc; // @[alu.scala 237:35]
  wire [63:0] _src2_T_4 = {52'hfffffffffffff,imm[11:0]}; // @[Cat.scala 31:58]
  wire [63:0] _src2_T_7 = {52'h0,imm[11:0]}; // @[Cat.scala 31:58]
  wire [63:0] _src2_T_8 = imm[11] ? _src2_T_4 : _src2_T_7; // @[alu.scala 189:20]
  wire [63:0] _GEN_4 = _is_4_T_4 ? _src2_T_8 : 64'h0; // @[alu.scala 245:9 250:14]
  wire [63:0] _GEN_20 = _is_4_T_1 ? 64'h0 : _GEN_4; // @[alu.scala 233:9]
  wire [63:0] _GEN_28 = _T_7 ? regFile_io_rdata_1 : _GEN_20; // @[alu.scala 217:9 226:22]
  wire [63:0] _GEN_47 = _T_5 ? 64'h0 : _GEN_28; // @[alu.scala 207:9]
  wire [63:0] _GEN_63 = _T_3 ? 64'h0 : _GEN_47; // @[alu.scala 197:9]
  wire [63:0] src2 = _T_1 ? _src2_T_8 : _GEN_63; // @[alu.scala 184:9 189:14]
  wire [63:0] _pc_remote_T_5 = src1 + src2; // @[alu.scala 252:36]
  wire [63:0] _pc_remote_T_7 = _pc_remote_T_5 & 64'h2; // @[alu.scala 252:43]
  wire [63:0] _GEN_5 = _is_4_T_4 ? _pc_remote_T_7 : 64'h80000000; // @[alu.scala 245:9 252:27]
  wire [63:0] _GEN_14 = _is_4_T_1 ? _pc_remote_T_3 : _GEN_5; // @[alu.scala 233:9 237:27]
  wire [63:0] _GEN_31 = _T_7 ? 64'h80000000 : _GEN_14; // @[alu.scala 217:9]
  wire [63:0] _GEN_50 = _T_5 ? 64'h80000000 : _GEN_31; // @[alu.scala 207:9]
  wire [31:0] _regFile_io_raddr_0_T = instr & 32'hf8000; // @[alu.scala 185:39]
  wire [31:0] _regFile_io_raddr_0_T_1 = {{15'd0}, _regFile_io_raddr_0_T[31:15]}; // @[alu.scala 185:52]
  wire [31:0] _regFile_io_waddr_T = instr & 32'hf80; // @[alu.scala 192:37]
  wire [31:0] _regFile_io_waddr_T_1 = {{7'd0}, _regFile_io_waddr_T[31:7]}; // @[alu.scala 192:50]
  wire [31:0] _regFile_io_raddr_1_T = instr & 32'h1f00000; // @[alu.scala 225:47]
  wire [31:0] _regFile_io_raddr_1_T_1 = {{22'd0}, _regFile_io_raddr_1_T[31:22]}; // @[alu.scala 225:60]
  wire [63:0] _GEN_96 = {{32'd0}, imm}; // @[alu.scala 229:29]
  wire [63:0] _io_dat_addr_T_1 = src1 + _GEN_96; // @[alu.scala 229:29]
  wire  _T_13 = 32'h100073 == instr; // @[alu.scala 259:26]
  wire [31:0] _GEN_1 = _is_4_T_4 ? _regFile_io_raddr_0_T_1 : 32'h0; // @[alu.scala 173:29 245:9 246:37]
  wire [31:0] _GEN_7 = _is_4_T_4 ? _regFile_io_waddr_T_1 : 32'h0; // @[alu.scala 170:22 245:9 255:26]
  wire [63:0] _GEN_8 = _is_4_T_4 ? _pc_T_1 : 64'h0; // @[alu.scala 245:9 256:14]
  wire [63:0] _GEN_15 = _is_4_T_1 ? _pc_T_1 : _GEN_8; // @[alu.scala 233:9 239:22]
  wire [63:0] _GEN_32 = _T_7 ? 64'h0 : _GEN_15; // @[alu.scala 217:9]
  wire [63:0] _GEN_39 = _T_5 ? src1 : _GEN_32; // @[alu.scala 207:9 211:22]
  wire [63:0] _GEN_57 = _T_3 ? _pc_T_1 : _GEN_39; // @[alu.scala 197:9 204:22]
  wire [63:0] dest = _T_1 ? _pc_remote_T_5 : _GEN_57; // @[alu.scala 184:9 193:14]
  wire [63:0] _GEN_9 = _is_4_T_4 ? dest : 64'h0; // @[alu.scala 171:22 245:9 257:26]
  wire  _GEN_10 = _is_4_T_4 ? 1'h0 : _T_13; // @[alu.scala 180:22 245:9]
  wire  _GEN_16 = _is_4_T_1 | _is_4_T_4; // @[alu.scala 233:9 240:32]
  wire [31:0] _GEN_17 = _is_4_T_1 ? _regFile_io_waddr_T_1 : _GEN_7; // @[alu.scala 233:9 241:34]
  wire [63:0] _GEN_18 = _is_4_T_1 ? dest : _GEN_9; // @[alu.scala 233:9 242:34]
  wire [31:0] _GEN_19 = _is_4_T_1 ? 32'h0 : _GEN_1; // @[alu.scala 173:29 233:9]
  wire  _GEN_21 = _is_4_T_1 ? 1'h0 : _GEN_10; // @[alu.scala 180:22 233:9]
  wire [31:0] _GEN_25 = _T_7 ? _regFile_io_raddr_0_T_1 : _GEN_19; // @[alu.scala 217:9 222:37]
  wire [31:0] _GEN_27 = _T_7 ? _regFile_io_raddr_1_T_1 : 32'h0; // @[alu.scala 173:29 217:9 225:37]
  wire [63:0] _GEN_29 = _T_7 ? src2 : 64'h0; // @[alu.scala 127:14 217:9 228:18]
  wire [63:0] _GEN_30 = _T_7 ? _io_dat_addr_T_1 : 64'h0; // @[alu.scala 128:17 217:9 229:21]
  wire  _GEN_33 = _T_7 ? 1'h0 : _GEN_16; // @[alu.scala 169:24 217:9]
  wire [31:0] _GEN_34 = _T_7 ? 32'h0 : _GEN_17; // @[alu.scala 170:22 217:9]
  wire [63:0] _GEN_35 = _T_7 ? 64'h0 : _GEN_18; // @[alu.scala 171:22 217:9]
  wire  _GEN_36 = _T_7 ? 1'h0 : _GEN_21; // @[alu.scala 180:22 217:9]
  wire  _GEN_40 = _T_5 | _GEN_33; // @[alu.scala 207:9 212:32]
  wire [31:0] _GEN_41 = _T_5 ? _regFile_io_waddr_T_1 : _GEN_34; // @[alu.scala 207:9 213:34]
  wire [63:0] _GEN_42 = _T_5 ? dest : _GEN_35; // @[alu.scala 207:9 214:34]
  wire  _GEN_44 = _T_5 ? 1'h0 : _T_7; // @[alu.scala 126:12 207:9]
  wire [31:0] _GEN_45 = _T_5 ? 32'h0 : _GEN_25; // @[alu.scala 173:29 207:9]
  wire [31:0] _GEN_46 = _T_5 ? 32'h0 : _GEN_27; // @[alu.scala 173:29 207:9]
  wire [63:0] _GEN_48 = _T_5 ? 64'h0 : _GEN_29; // @[alu.scala 127:14 207:9]
  wire [63:0] _GEN_49 = _T_5 ? 64'h0 : _GEN_30; // @[alu.scala 128:17 207:9]
  wire  _GEN_51 = _T_5 ? 1'h0 : _GEN_36; // @[alu.scala 180:22 207:9]
  wire  _GEN_55 = _T_3 | _GEN_40; // @[alu.scala 197:9 202:32]
  wire [31:0] _GEN_56 = _T_3 ? _regFile_io_waddr_T_1 : _GEN_41; // @[alu.scala 197:9 203:34]
  wire [63:0] _GEN_58 = _T_3 ? 64'h0 : _GEN_42; // @[alu.scala 171:22 197:9]
  wire  _GEN_60 = _T_3 ? 1'h0 : _GEN_44; // @[alu.scala 126:12 197:9]
  wire [31:0] _GEN_61 = _T_3 ? 32'h0 : _GEN_45; // @[alu.scala 173:29 197:9]
  wire [31:0] _GEN_62 = _T_3 ? 32'h0 : _GEN_46; // @[alu.scala 173:29 197:9]
  wire [63:0] _GEN_64 = _T_3 ? 64'h0 : _GEN_48; // @[alu.scala 127:14 197:9]
  wire [63:0] _GEN_65 = _T_3 ? 64'h0 : _GEN_49; // @[alu.scala 128:17 197:9]
  wire  _GEN_66 = _T_3 ? 1'h0 : _GEN_51; // @[alu.scala 180:22 197:9]
  wire [31:0] _GEN_67 = _T_1 ? _regFile_io_raddr_0_T_1 : _GEN_61; // @[alu.scala 184:9 185:29]
  wire [31:0] _GEN_72 = _T_1 ? _regFile_io_waddr_T_1 : _GEN_56; // @[alu.scala 184:9 192:26]
  wire [31:0] _GEN_78 = _T_1 ? 32'h0 : _GEN_62; // @[alu.scala 173:29 184:9]
  reg [63:0] pc_tmp; // @[alu.scala 264:29]
  RegisterFile regFile ( // @[alu.scala 130:25]
    .clock(regFile_clock),
    .reset(regFile_reset),
    .io_wen(regFile_io_wen),
    .io_waddr(regFile_io_waddr),
    .io_wdata(regFile_io_wdata),
    .io_raddr_0(regFile_io_raddr_0),
    .io_raddr_1(regFile_io_raddr_1),
    .io_rdata_0(regFile_io_rdata_0),
    .io_rdata_1(regFile_io_rdata_1),
    .io_rdata_4(regFile_io_rdata_4),
    .io_rdata_5(regFile_io_rdata_5),
    .io_rdata_6(regFile_io_rdata_6),
    .io_rdata_7(regFile_io_rdata_7),
    .io_rdata_8(regFile_io_rdata_8),
    .io_rdata_9(regFile_io_rdata_9),
    .io_rdata_10(regFile_io_rdata_10),
    .io_rdata_11(regFile_io_rdata_11),
    .io_rdata_12(regFile_io_rdata_12),
    .io_rdata_13(regFile_io_rdata_13),
    .io_rdata_14(regFile_io_rdata_14),
    .io_rdata_15(regFile_io_rdata_15),
    .io_rdata_16(regFile_io_rdata_16),
    .io_rdata_17(regFile_io_rdata_17),
    .io_rdata_18(regFile_io_rdata_18),
    .io_rdata_19(regFile_io_rdata_19),
    .io_rdata_20(regFile_io_rdata_20),
    .io_rdata_21(regFile_io_rdata_21),
    .io_rdata_22(regFile_io_rdata_22),
    .io_rdata_23(regFile_io_rdata_23),
    .io_rdata_24(regFile_io_rdata_24),
    .io_rdata_25(regFile_io_rdata_25),
    .io_rdata_26(regFile_io_rdata_26),
    .io_rdata_27(regFile_io_rdata_27),
    .io_rdata_28(regFile_io_rdata_28),
    .io_rdata_29(regFile_io_rdata_29),
    .io_rdata_30(regFile_io_rdata_30),
    .io_rdata_31(regFile_io_rdata_31),
    .io_rdata_32(regFile_io_rdata_32),
    .io_rdata_33(regFile_io_rdata_33),
    .io_rdata_34(regFile_io_rdata_34)
  );
  gpr_ptr reg_debug ( // @[alu.scala 136:31]
    .clock(reg_debug_clock),
    .reset(reg_debug_reset),
    .regfile_0(reg_debug_regfile_0),
    .regfile_1(reg_debug_regfile_1),
    .regfile_2(reg_debug_regfile_2),
    .regfile_3(reg_debug_regfile_3),
    .regfile_4(reg_debug_regfile_4),
    .regfile_5(reg_debug_regfile_5),
    .regfile_6(reg_debug_regfile_6),
    .regfile_7(reg_debug_regfile_7),
    .regfile_8(reg_debug_regfile_8),
    .regfile_9(reg_debug_regfile_9),
    .regfile_10(reg_debug_regfile_10),
    .regfile_11(reg_debug_regfile_11),
    .regfile_12(reg_debug_regfile_12),
    .regfile_13(reg_debug_regfile_13),
    .regfile_14(reg_debug_regfile_14),
    .regfile_15(reg_debug_regfile_15),
    .regfile_16(reg_debug_regfile_16),
    .regfile_17(reg_debug_regfile_17),
    .regfile_18(reg_debug_regfile_18),
    .regfile_19(reg_debug_regfile_19),
    .regfile_20(reg_debug_regfile_20),
    .regfile_21(reg_debug_regfile_21),
    .regfile_22(reg_debug_regfile_22),
    .regfile_23(reg_debug_regfile_23),
    .regfile_24(reg_debug_regfile_24),
    .regfile_25(reg_debug_regfile_25),
    .regfile_26(reg_debug_regfile_26),
    .regfile_27(reg_debug_regfile_27),
    .regfile_28(reg_debug_regfile_28),
    .regfile_29(reg_debug_regfile_29),
    .regfile_30(reg_debug_regfile_30),
    .regfile_31(reg_debug_regfile_31)
  );
  ebreak ebreak ( // @[alu.scala 167:24]
    .enable(ebreak_enable)
  );
  assign io_dat_addr = _T_1 ? 64'h0 : _GEN_65; // @[alu.scala 128:17 184:9]
  assign io_pc_addr = pc; // @[alu.scala 177:16]
  assign io_wen = _T_1 ? 1'h0 : _GEN_60; // @[alu.scala 126:12 184:9]
  assign io_wdata = _T_1 ? 64'h0 : _GEN_64; // @[alu.scala 127:14 184:9]
  assign io_pc_debug = pc_tmp; // @[alu.scala 265:21]
  assign regFile_clock = clock;
  assign regFile_reset = reset;
  assign regFile_io_wen = _T_1 | _GEN_55; // @[alu.scala 184:9 191:24]
  assign regFile_io_waddr = _GEN_72[4:0];
  assign regFile_io_wdata = _T_1 ? dest : _GEN_58; // @[alu.scala 184:9 194:26]
  assign regFile_io_raddr_0 = _GEN_67[4:0];
  assign regFile_io_raddr_1 = _GEN_78[4:0];
  assign reg_debug_clock = clock; // @[alu.scala 137:28]
  assign reg_debug_reset = reset; // @[alu.scala 138:28]
  assign reg_debug_regfile_0 = 64'h0; // @[alu.scala 142:43]
  assign reg_debug_regfile_1 = regFile_io_rdata_4; // @[alu.scala 142:43]
  assign reg_debug_regfile_2 = regFile_io_rdata_5; // @[alu.scala 142:43]
  assign reg_debug_regfile_3 = regFile_io_rdata_6; // @[alu.scala 142:43]
  assign reg_debug_regfile_4 = regFile_io_rdata_7; // @[alu.scala 142:43]
  assign reg_debug_regfile_5 = regFile_io_rdata_8; // @[alu.scala 142:43]
  assign reg_debug_regfile_6 = regFile_io_rdata_9; // @[alu.scala 142:43]
  assign reg_debug_regfile_7 = regFile_io_rdata_10; // @[alu.scala 142:43]
  assign reg_debug_regfile_8 = regFile_io_rdata_11; // @[alu.scala 142:43]
  assign reg_debug_regfile_9 = regFile_io_rdata_12; // @[alu.scala 142:43]
  assign reg_debug_regfile_10 = regFile_io_rdata_13; // @[alu.scala 142:43]
  assign reg_debug_regfile_11 = regFile_io_rdata_14; // @[alu.scala 142:43]
  assign reg_debug_regfile_12 = regFile_io_rdata_15; // @[alu.scala 142:43]
  assign reg_debug_regfile_13 = regFile_io_rdata_16; // @[alu.scala 142:43]
  assign reg_debug_regfile_14 = regFile_io_rdata_17; // @[alu.scala 142:43]
  assign reg_debug_regfile_15 = regFile_io_rdata_18; // @[alu.scala 142:43]
  assign reg_debug_regfile_16 = regFile_io_rdata_19; // @[alu.scala 142:43]
  assign reg_debug_regfile_17 = regFile_io_rdata_20; // @[alu.scala 142:43]
  assign reg_debug_regfile_18 = regFile_io_rdata_21; // @[alu.scala 142:43]
  assign reg_debug_regfile_19 = regFile_io_rdata_22; // @[alu.scala 142:43]
  assign reg_debug_regfile_20 = regFile_io_rdata_23; // @[alu.scala 142:43]
  assign reg_debug_regfile_21 = regFile_io_rdata_24; // @[alu.scala 142:43]
  assign reg_debug_regfile_22 = regFile_io_rdata_25; // @[alu.scala 142:43]
  assign reg_debug_regfile_23 = regFile_io_rdata_26; // @[alu.scala 142:43]
  assign reg_debug_regfile_24 = regFile_io_rdata_27; // @[alu.scala 142:43]
  assign reg_debug_regfile_25 = regFile_io_rdata_28; // @[alu.scala 142:43]
  assign reg_debug_regfile_26 = regFile_io_rdata_29; // @[alu.scala 142:43]
  assign reg_debug_regfile_27 = regFile_io_rdata_30; // @[alu.scala 142:43]
  assign reg_debug_regfile_28 = regFile_io_rdata_31; // @[alu.scala 142:43]
  assign reg_debug_regfile_29 = regFile_io_rdata_32; // @[alu.scala 142:43]
  assign reg_debug_regfile_30 = regFile_io_rdata_33; // @[alu.scala 142:43]
  assign reg_debug_regfile_31 = regFile_io_rdata_34; // @[alu.scala 142:43]
  assign ebreak_enable = _T_1 ? 1'h0 : _GEN_66; // @[alu.scala 180:22 184:9]
  always @(posedge clock) begin
    if (reset) begin // @[alu.scala 133:21]
      pc <= 64'h80000000; // @[alu.scala 133:21]
    end else if (is_4) begin // @[alu.scala 176:14]
      pc <= _pc_T_1;
    end else if (_T_1) begin // @[alu.scala 184:9]
      pc <= 64'h80000000;
    end else if (_T_3) begin // @[alu.scala 197:9]
      pc <= _pc_remote_T_1; // @[alu.scala 200:27]
    end else begin
      pc <= _GEN_50;
    end
    if (reset) begin // @[alu.scala 134:24]
      instr <= 32'h0; // @[alu.scala 134:24]
    end else begin
      instr <= io_instr; // @[alu.scala 178:11]
    end
    pc_tmp <= pc; // @[alu.scala 264:29]
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {2{`RANDOM}};
  pc = _RAND_0[63:0];
  _RAND_1 = {1{`RANDOM}};
  instr = _RAND_1[31:0];
  _RAND_2 = {2{`RANDOM}};
  pc_tmp = _RAND_2[63:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule

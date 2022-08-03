module AluSimple(
  input  [63:0] io_A,
  input  [63:0] io_B,
  input  [1:0]  io_width_type,
  input  [3:0]  io_alu_op,
  output [63:0] io_out,
  output [63:0] io_sum
);
  wire  _shamt_T = io_width_type == 2'h1; // @[alu.scala 50:39]
  wire [5:0] shamt = io_width_type == 2'h1 ? {{1'd0}, io_B[4:0]} : io_B[5:0]; // @[alu.scala 50:24]
  wire [63:0] _out_T_1 = io_A + io_B; // @[alu.scala 55:42]
  wire [63:0] _out_T_3 = io_A - io_B; // @[alu.scala 56:42]
  wire [31:0] _out_T_6 = io_A[31:0]; // @[alu.scala 57:75]
  wire [63:0] _out_T_8 = _shamt_T ? $signed({{32{_out_T_6[31]}},_out_T_6}) : $signed(io_A); // @[alu.scala 57:40]
  wire [63:0] _out_T_10 = $signed(_out_T_8) >>> shamt; // @[alu.scala 57:106]
  wire [63:0] _out_T_11 = io_A >> shamt; // @[alu.scala 58:42]
  wire [126:0] _GEN_1 = {{63'd0}, io_A}; // @[alu.scala 59:42]
  wire [126:0] _out_T_12 = _GEN_1 << shamt; // @[alu.scala 59:42]
  wire  _out_T_15 = $signed(io_A) < $signed(io_B); // @[alu.scala 60:49]
  wire  _out_T_16 = io_A < io_B; // @[alu.scala 61:43]
  wire [63:0] _out_T_17 = io_A & io_B; // @[alu.scala 62:42]
  wire [63:0] _out_T_18 = io_A | io_B; // @[alu.scala 63:41]
  wire [63:0] _out_T_19 = io_A ^ io_B; // @[alu.scala 64:42]
  wire [127:0] _out_T_20 = io_A * io_B; // @[alu.scala 65:42]
  wire [31:0] _out_T_25 = io_B[31:0]; // @[alu.scala 66:98]
  wire [32:0] _out_T_27 = $signed(_out_T_6) / $signed(_out_T_25); // @[alu.scala 66:107]
  wire [64:0] _out_T_31 = $signed(io_A) / $signed(io_B); // @[alu.scala 66:143]
  wire [64:0] _out_T_32 = _shamt_T ? {{32'd0}, _out_T_27} : _out_T_31; // @[alu.scala 66:39]
  wire [31:0] _out_T_36 = io_A[31:0] / io_B[31:0]; // @[alu.scala 67:75]
  wire [63:0] _out_T_37 = io_A / io_B; // @[alu.scala 67:94]
  wire [63:0] _out_T_38 = _shamt_T ? {{32'd0}, _out_T_36} : _out_T_37; // @[alu.scala 67:40]
  wire [31:0] _out_T_45 = $signed(_out_T_6) % $signed(_out_T_25); // @[alu.scala 68:107]
  wire [63:0] _out_T_49 = $signed(io_A) % $signed(io_B); // @[alu.scala 68:143]
  wire [63:0] _out_T_50 = _shamt_T ? {{32'd0}, _out_T_45} : _out_T_49; // @[alu.scala 68:39]
  wire [31:0] _GEN_2 = io_A[31:0] % io_B[31:0]; // @[alu.scala 69:75]
  wire [31:0] _out_T_54 = _GEN_2[31:0]; // @[alu.scala 69:75]
  wire [63:0] _GEN_3 = io_A % io_B; // @[alu.scala 69:94]
  wire [63:0] _out_T_55 = _GEN_3[63:0]; // @[alu.scala 69:94]
  wire [63:0] _out_T_56 = _shamt_T ? {{32'd0}, _out_T_54} : _out_T_55; // @[alu.scala 69:40]
  wire [4:0] _GEN_0 = {{1'd0}, io_alu_op}; // @[Mux.scala 81:61]
  wire [63:0] _out_T_58 = 5'h0 == _GEN_0 ? _out_T_1 : io_B; // @[Mux.scala 81:58]
  wire [63:0] _out_T_60 = 5'h1 == _GEN_0 ? _out_T_3 : _out_T_58; // @[Mux.scala 81:58]
  wire [63:0] _out_T_62 = 5'h9 == _GEN_0 ? _out_T_10 : _out_T_60; // @[Mux.scala 81:58]
  wire [63:0] _out_T_64 = 5'h8 == _GEN_0 ? _out_T_11 : _out_T_62; // @[Mux.scala 81:58]
  wire [126:0] _out_T_66 = 5'h6 == _GEN_0 ? _out_T_12 : {{63'd0}, _out_T_64}; // @[Mux.scala 81:58]
  wire [126:0] _out_T_68 = 5'h5 == _GEN_0 ? {{126'd0}, _out_T_15} : _out_T_66; // @[Mux.scala 81:58]
  wire [126:0] _out_T_70 = 5'h7 == _GEN_0 ? {{126'd0}, _out_T_16} : _out_T_68; // @[Mux.scala 81:58]
  wire [126:0] _out_T_72 = 5'h2 == _GEN_0 ? {{63'd0}, _out_T_17} : _out_T_70; // @[Mux.scala 81:58]
  wire [126:0] _out_T_74 = 5'h3 == _GEN_0 ? {{63'd0}, _out_T_18} : _out_T_72; // @[Mux.scala 81:58]
  wire [126:0] _out_T_76 = 5'h4 == _GEN_0 ? {{63'd0}, _out_T_19} : _out_T_74; // @[Mux.scala 81:58]
  wire [127:0] _out_T_78 = 5'hc == _GEN_0 ? _out_T_20 : {{1'd0}, _out_T_76}; // @[Mux.scala 81:58]
  wire [127:0] _out_T_80 = 5'hd == _GEN_0 ? {{63'd0}, _out_T_32} : _out_T_78; // @[Mux.scala 81:58]
  wire [127:0] _out_T_82 = 5'hf == _GEN_0 ? {{64'd0}, _out_T_38} : _out_T_80; // @[Mux.scala 81:58]
  wire [127:0] _out_T_84 = 5'he == _GEN_0 ? {{64'd0}, _out_T_50} : _out_T_82; // @[Mux.scala 81:58]
  wire [127:0] _out_T_86 = 5'h10 == _GEN_0 ? {{64'd0}, _out_T_56} : _out_T_84; // @[Mux.scala 81:58]
  wire [127:0] _out_T_88 = 5'ha == _GEN_0 ? {{64'd0}, io_A} : _out_T_86; // @[Mux.scala 81:58]
  wire [63:0] _sum_T_2 = 64'h0 - io_B; // @[alu.scala 74:41]
  wire [63:0] _sum_T_3 = io_alu_op[0] ? _sum_T_2 : io_B; // @[alu.scala 74:26]
  wire [63:0] sum = io_A + _sum_T_3; // @[alu.scala 74:21]
  wire [63:0] out = _out_T_88[63:0];
  wire [31:0] _io_out_T_3 = out[31] ? 32'hffffffff : 32'h0; // @[Bitwise.scala 74:12]
  wire [63:0] _io_out_T_5 = {_io_out_T_3,out[31:0]}; // @[Cat.scala 31:58]
  wire [31:0] _io_sum_T_3 = sum[31] ? 32'hffffffff : 32'h0; // @[Bitwise.scala 74:12]
  wire [63:0] _io_sum_T_5 = {_io_sum_T_3,sum[31:0]}; // @[Cat.scala 31:58]
  assign io_out = _shamt_T ? _io_out_T_5 : out; // @[alu.scala 76:22]
  assign io_sum = _shamt_T ? _io_sum_T_5 : sum; // @[alu.scala 77:22]
endmodule
module ImmGenWire(
  input  [31:0] io_inst,
  input  [2:0]  io_sel,
  output [63:0] io_out
);
  wire  sign = io_inst[31]; // @[immGen.scala 19:27]
  wire [31:0] _Iimm_T_1 = sign ? 32'hffffffff : 32'h0; // @[Bitwise.scala 74:12]
  wire [11:0] Iimm_lo = io_inst[31:20]; // @[Cat.scala 31:58]
  wire [43:0] Iimm = {_Iimm_T_1,Iimm_lo}; // @[immGen.scala 21:64]
  wire [11:0] Simm_lo = {io_inst[31:25],io_inst[11:7]}; // @[Cat.scala 31:58]
  wire [43:0] Simm = {_Iimm_T_1,Simm_lo}; // @[immGen.scala 22:85]
  wire [12:0] Bimm_lo_1 = {sign,io_inst[7],io_inst[30:25],io_inst[11:8],1'h0}; // @[Cat.scala 31:58]
  wire [44:0] Bimm = {_Iimm_T_1,Bimm_lo_1}; // @[immGen.scala 23:120]
  wire [31:0] Uimm_lo = {io_inst[31:12],12'h0}; // @[Cat.scala 31:58]
  wire [63:0] Uimm = {_Iimm_T_1,Uimm_lo}; // @[immGen.scala 24:80]
  wire [20:0] Jimm_lo_1 = {sign,io_inst[19:12],io_inst[20],io_inst[30:25],io_inst[24:21],1'h0}; // @[Cat.scala 31:58]
  wire [52:0] Jimm = {_Iimm_T_1,Jimm_lo_1}; // @[immGen.scala 25:139]
  wire [5:0] Zimm_lo = {1'b0,$signed(io_inst[19:15])}; // @[Cat.scala 31:58]
  wire [37:0] Zimm = {32'h0,Zimm_lo}; // @[immGen.scala 26:61]
  wire [43:0] _io_out_T_1 = $signed(Iimm) & -44'sh2; // @[immGen.scala 31:22]
  wire [43:0] _io_out_T_3 = 3'h1 == io_sel ? $signed(Iimm) : $signed(_io_out_T_1); // @[Mux.scala 81:58]
  wire [43:0] _io_out_T_5 = 3'h2 == io_sel ? $signed(Simm) : $signed(_io_out_T_3); // @[Mux.scala 81:58]
  wire [44:0] _io_out_T_7 = 3'h5 == io_sel ? $signed(Bimm) : $signed({{1{_io_out_T_5[43]}},_io_out_T_5}); // @[Mux.scala 81:58]
  wire [63:0] _io_out_T_9 = 3'h3 == io_sel ? $signed(Uimm) : $signed({{19{_io_out_T_7[44]}},_io_out_T_7}); // @[Mux.scala 81:58]
  wire [63:0] _io_out_T_11 = 3'h4 == io_sel ? $signed({{11{Jimm[52]}},Jimm}) : $signed(_io_out_T_9); // @[Mux.scala 81:58]
  assign io_out = 3'h6 == io_sel ? $signed({{26{Zimm[37]}},Zimm}) : $signed(_io_out_T_11); // @[immGen.scala 33:11]
endmodule
module BrCondSimple(
  input  [63:0] io_rs1,
  input  [63:0] io_rs2,
  input  [2:0]  io_br_type,
  output        io_taken
);
  wire  eq = io_rs1 == io_rs2; // @[BrCond.scala 21:25]
  wire  neq = ~eq; // @[BrCond.scala 22:19]
  wire  lt = $signed(io_rs1) < $signed(io_rs2); // @[BrCond.scala 23:32]
  wire  ge = ~lt; // @[BrCond.scala 24:18]
  wire  ltu = io_rs1 < io_rs2; // @[BrCond.scala 25:26]
  wire  geu = ~ltu; // @[BrCond.scala 26:19]
  wire  _io_taken_T_3 = io_br_type == 3'h6 & neq; // @[BrCond.scala 29:41]
  wire  _io_taken_T_4 = io_br_type == 3'h3 & eq | _io_taken_T_3; // @[BrCond.scala 28:48]
  wire  _io_taken_T_6 = io_br_type == 3'h2 & lt; // @[BrCond.scala 30:41]
  wire  _io_taken_T_7 = _io_taken_T_4 | _io_taken_T_6; // @[BrCond.scala 29:49]
  wire  _io_taken_T_9 = io_br_type == 3'h5 & ge; // @[BrCond.scala 31:41]
  wire  _io_taken_T_10 = _io_taken_T_7 | _io_taken_T_9; // @[BrCond.scala 30:48]
  wire  _io_taken_T_12 = io_br_type == 3'h1 & ltu; // @[BrCond.scala 32:42]
  wire  _io_taken_T_13 = _io_taken_T_10 | _io_taken_T_12; // @[BrCond.scala 31:48]
  wire  _io_taken_T_15 = io_br_type == 3'h4 & geu; // @[BrCond.scala 33:42]
  assign io_taken = _io_taken_T_13 | _io_taken_T_15; // @[BrCond.scala 32:50]
endmodule
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
  reg [63:0] reg_0; // @[datapath.scala 23:22]
  reg [63:0] reg_1; // @[datapath.scala 23:22]
  reg [63:0] reg_2; // @[datapath.scala 23:22]
  reg [63:0] reg_3; // @[datapath.scala 23:22]
  reg [63:0] reg_4; // @[datapath.scala 23:22]
  reg [63:0] reg_5; // @[datapath.scala 23:22]
  reg [63:0] reg_6; // @[datapath.scala 23:22]
  reg [63:0] reg_7; // @[datapath.scala 23:22]
  reg [63:0] reg_8; // @[datapath.scala 23:22]
  reg [63:0] reg_9; // @[datapath.scala 23:22]
  reg [63:0] reg_10; // @[datapath.scala 23:22]
  reg [63:0] reg_11; // @[datapath.scala 23:22]
  reg [63:0] reg_12; // @[datapath.scala 23:22]
  reg [63:0] reg_13; // @[datapath.scala 23:22]
  reg [63:0] reg_14; // @[datapath.scala 23:22]
  reg [63:0] reg_15; // @[datapath.scala 23:22]
  reg [63:0] reg_16; // @[datapath.scala 23:22]
  reg [63:0] reg_17; // @[datapath.scala 23:22]
  reg [63:0] reg_18; // @[datapath.scala 23:22]
  reg [63:0] reg_19; // @[datapath.scala 23:22]
  reg [63:0] reg_20; // @[datapath.scala 23:22]
  reg [63:0] reg_21; // @[datapath.scala 23:22]
  reg [63:0] reg_22; // @[datapath.scala 23:22]
  reg [63:0] reg_23; // @[datapath.scala 23:22]
  reg [63:0] reg_24; // @[datapath.scala 23:22]
  reg [63:0] reg_25; // @[datapath.scala 23:22]
  reg [63:0] reg_26; // @[datapath.scala 23:22]
  reg [63:0] reg_27; // @[datapath.scala 23:22]
  reg [63:0] reg_28; // @[datapath.scala 23:22]
  reg [63:0] reg_29; // @[datapath.scala 23:22]
  reg [63:0] reg_30; // @[datapath.scala 23:22]
  reg [63:0] reg_31; // @[datapath.scala 23:22]
  wire [63:0] _GEN_65 = 5'h1 == io_raddr_0 ? reg_1 : reg_0; // @[datapath.scala 36:{37,37}]
  wire [63:0] _GEN_66 = 5'h2 == io_raddr_0 ? reg_2 : _GEN_65; // @[datapath.scala 36:{37,37}]
  wire [63:0] _GEN_67 = 5'h3 == io_raddr_0 ? reg_3 : _GEN_66; // @[datapath.scala 36:{37,37}]
  wire [63:0] _GEN_68 = 5'h4 == io_raddr_0 ? reg_4 : _GEN_67; // @[datapath.scala 36:{37,37}]
  wire [63:0] _GEN_69 = 5'h5 == io_raddr_0 ? reg_5 : _GEN_68; // @[datapath.scala 36:{37,37}]
  wire [63:0] _GEN_70 = 5'h6 == io_raddr_0 ? reg_6 : _GEN_69; // @[datapath.scala 36:{37,37}]
  wire [63:0] _GEN_71 = 5'h7 == io_raddr_0 ? reg_7 : _GEN_70; // @[datapath.scala 36:{37,37}]
  wire [63:0] _GEN_72 = 5'h8 == io_raddr_0 ? reg_8 : _GEN_71; // @[datapath.scala 36:{37,37}]
  wire [63:0] _GEN_73 = 5'h9 == io_raddr_0 ? reg_9 : _GEN_72; // @[datapath.scala 36:{37,37}]
  wire [63:0] _GEN_74 = 5'ha == io_raddr_0 ? reg_10 : _GEN_73; // @[datapath.scala 36:{37,37}]
  wire [63:0] _GEN_75 = 5'hb == io_raddr_0 ? reg_11 : _GEN_74; // @[datapath.scala 36:{37,37}]
  wire [63:0] _GEN_76 = 5'hc == io_raddr_0 ? reg_12 : _GEN_75; // @[datapath.scala 36:{37,37}]
  wire [63:0] _GEN_77 = 5'hd == io_raddr_0 ? reg_13 : _GEN_76; // @[datapath.scala 36:{37,37}]
  wire [63:0] _GEN_78 = 5'he == io_raddr_0 ? reg_14 : _GEN_77; // @[datapath.scala 36:{37,37}]
  wire [63:0] _GEN_79 = 5'hf == io_raddr_0 ? reg_15 : _GEN_78; // @[datapath.scala 36:{37,37}]
  wire [63:0] _GEN_80 = 5'h10 == io_raddr_0 ? reg_16 : _GEN_79; // @[datapath.scala 36:{37,37}]
  wire [63:0] _GEN_81 = 5'h11 == io_raddr_0 ? reg_17 : _GEN_80; // @[datapath.scala 36:{37,37}]
  wire [63:0] _GEN_82 = 5'h12 == io_raddr_0 ? reg_18 : _GEN_81; // @[datapath.scala 36:{37,37}]
  wire [63:0] _GEN_83 = 5'h13 == io_raddr_0 ? reg_19 : _GEN_82; // @[datapath.scala 36:{37,37}]
  wire [63:0] _GEN_84 = 5'h14 == io_raddr_0 ? reg_20 : _GEN_83; // @[datapath.scala 36:{37,37}]
  wire [63:0] _GEN_85 = 5'h15 == io_raddr_0 ? reg_21 : _GEN_84; // @[datapath.scala 36:{37,37}]
  wire [63:0] _GEN_86 = 5'h16 == io_raddr_0 ? reg_22 : _GEN_85; // @[datapath.scala 36:{37,37}]
  wire [63:0] _GEN_87 = 5'h17 == io_raddr_0 ? reg_23 : _GEN_86; // @[datapath.scala 36:{37,37}]
  wire [63:0] _GEN_88 = 5'h18 == io_raddr_0 ? reg_24 : _GEN_87; // @[datapath.scala 36:{37,37}]
  wire [63:0] _GEN_89 = 5'h19 == io_raddr_0 ? reg_25 : _GEN_88; // @[datapath.scala 36:{37,37}]
  wire [63:0] _GEN_90 = 5'h1a == io_raddr_0 ? reg_26 : _GEN_89; // @[datapath.scala 36:{37,37}]
  wire [63:0] _GEN_91 = 5'h1b == io_raddr_0 ? reg_27 : _GEN_90; // @[datapath.scala 36:{37,37}]
  wire [63:0] _GEN_92 = 5'h1c == io_raddr_0 ? reg_28 : _GEN_91; // @[datapath.scala 36:{37,37}]
  wire [63:0] _GEN_93 = 5'h1d == io_raddr_0 ? reg_29 : _GEN_92; // @[datapath.scala 36:{37,37}]
  wire [63:0] _GEN_94 = 5'h1e == io_raddr_0 ? reg_30 : _GEN_93; // @[datapath.scala 36:{37,37}]
  wire [63:0] _GEN_95 = 5'h1f == io_raddr_0 ? reg_31 : _GEN_94; // @[datapath.scala 36:{37,37}]
  wire [63:0] _GEN_98 = 5'h1 == io_raddr_1 ? reg_1 : reg_0; // @[datapath.scala 36:{37,37}]
  wire [63:0] _GEN_99 = 5'h2 == io_raddr_1 ? reg_2 : _GEN_98; // @[datapath.scala 36:{37,37}]
  wire [63:0] _GEN_100 = 5'h3 == io_raddr_1 ? reg_3 : _GEN_99; // @[datapath.scala 36:{37,37}]
  wire [63:0] _GEN_101 = 5'h4 == io_raddr_1 ? reg_4 : _GEN_100; // @[datapath.scala 36:{37,37}]
  wire [63:0] _GEN_102 = 5'h5 == io_raddr_1 ? reg_5 : _GEN_101; // @[datapath.scala 36:{37,37}]
  wire [63:0] _GEN_103 = 5'h6 == io_raddr_1 ? reg_6 : _GEN_102; // @[datapath.scala 36:{37,37}]
  wire [63:0] _GEN_104 = 5'h7 == io_raddr_1 ? reg_7 : _GEN_103; // @[datapath.scala 36:{37,37}]
  wire [63:0] _GEN_105 = 5'h8 == io_raddr_1 ? reg_8 : _GEN_104; // @[datapath.scala 36:{37,37}]
  wire [63:0] _GEN_106 = 5'h9 == io_raddr_1 ? reg_9 : _GEN_105; // @[datapath.scala 36:{37,37}]
  wire [63:0] _GEN_107 = 5'ha == io_raddr_1 ? reg_10 : _GEN_106; // @[datapath.scala 36:{37,37}]
  wire [63:0] _GEN_108 = 5'hb == io_raddr_1 ? reg_11 : _GEN_107; // @[datapath.scala 36:{37,37}]
  wire [63:0] _GEN_109 = 5'hc == io_raddr_1 ? reg_12 : _GEN_108; // @[datapath.scala 36:{37,37}]
  wire [63:0] _GEN_110 = 5'hd == io_raddr_1 ? reg_13 : _GEN_109; // @[datapath.scala 36:{37,37}]
  wire [63:0] _GEN_111 = 5'he == io_raddr_1 ? reg_14 : _GEN_110; // @[datapath.scala 36:{37,37}]
  wire [63:0] _GEN_112 = 5'hf == io_raddr_1 ? reg_15 : _GEN_111; // @[datapath.scala 36:{37,37}]
  wire [63:0] _GEN_113 = 5'h10 == io_raddr_1 ? reg_16 : _GEN_112; // @[datapath.scala 36:{37,37}]
  wire [63:0] _GEN_114 = 5'h11 == io_raddr_1 ? reg_17 : _GEN_113; // @[datapath.scala 36:{37,37}]
  wire [63:0] _GEN_115 = 5'h12 == io_raddr_1 ? reg_18 : _GEN_114; // @[datapath.scala 36:{37,37}]
  wire [63:0] _GEN_116 = 5'h13 == io_raddr_1 ? reg_19 : _GEN_115; // @[datapath.scala 36:{37,37}]
  wire [63:0] _GEN_117 = 5'h14 == io_raddr_1 ? reg_20 : _GEN_116; // @[datapath.scala 36:{37,37}]
  wire [63:0] _GEN_118 = 5'h15 == io_raddr_1 ? reg_21 : _GEN_117; // @[datapath.scala 36:{37,37}]
  wire [63:0] _GEN_119 = 5'h16 == io_raddr_1 ? reg_22 : _GEN_118; // @[datapath.scala 36:{37,37}]
  wire [63:0] _GEN_120 = 5'h17 == io_raddr_1 ? reg_23 : _GEN_119; // @[datapath.scala 36:{37,37}]
  wire [63:0] _GEN_121 = 5'h18 == io_raddr_1 ? reg_24 : _GEN_120; // @[datapath.scala 36:{37,37}]
  wire [63:0] _GEN_122 = 5'h19 == io_raddr_1 ? reg_25 : _GEN_121; // @[datapath.scala 36:{37,37}]
  wire [63:0] _GEN_123 = 5'h1a == io_raddr_1 ? reg_26 : _GEN_122; // @[datapath.scala 36:{37,37}]
  wire [63:0] _GEN_124 = 5'h1b == io_raddr_1 ? reg_27 : _GEN_123; // @[datapath.scala 36:{37,37}]
  wire [63:0] _GEN_125 = 5'h1c == io_raddr_1 ? reg_28 : _GEN_124; // @[datapath.scala 36:{37,37}]
  wire [63:0] _GEN_126 = 5'h1d == io_raddr_1 ? reg_29 : _GEN_125; // @[datapath.scala 36:{37,37}]
  wire [63:0] _GEN_127 = 5'h1e == io_raddr_1 ? reg_30 : _GEN_126; // @[datapath.scala 36:{37,37}]
  wire [63:0] _GEN_128 = 5'h1f == io_raddr_1 ? reg_31 : _GEN_127; // @[datapath.scala 36:{37,37}]
  assign io_rdata_0 = io_raddr_0 == 5'h0 ? 64'h0 : _GEN_95; // @[datapath.scala 33:42 34:37 36:37]
  assign io_rdata_1 = io_raddr_1 == 5'h0 ? 64'h0 : _GEN_128; // @[datapath.scala 33:42 34:37 36:37]
  assign io_rdata_4 = reg_1; // @[datapath.scala 33:42 34:37 36:37]
  assign io_rdata_5 = reg_2; // @[datapath.scala 33:42 34:37 36:37]
  assign io_rdata_6 = reg_3; // @[datapath.scala 33:42 34:37 36:37]
  assign io_rdata_7 = reg_4; // @[datapath.scala 33:42 34:37 36:37]
  assign io_rdata_8 = reg_5; // @[datapath.scala 33:42 34:37 36:37]
  assign io_rdata_9 = reg_6; // @[datapath.scala 33:42 34:37 36:37]
  assign io_rdata_10 = reg_7; // @[datapath.scala 33:42 34:37 36:37]
  assign io_rdata_11 = reg_8; // @[datapath.scala 33:42 34:37 36:37]
  assign io_rdata_12 = reg_9; // @[datapath.scala 33:42 34:37 36:37]
  assign io_rdata_13 = reg_10; // @[datapath.scala 33:42 34:37 36:37]
  assign io_rdata_14 = reg_11; // @[datapath.scala 33:42 34:37 36:37]
  assign io_rdata_15 = reg_12; // @[datapath.scala 33:42 34:37 36:37]
  assign io_rdata_16 = reg_13; // @[datapath.scala 33:42 34:37 36:37]
  assign io_rdata_17 = reg_14; // @[datapath.scala 33:42 34:37 36:37]
  assign io_rdata_18 = reg_15; // @[datapath.scala 33:42 34:37 36:37]
  assign io_rdata_19 = reg_16; // @[datapath.scala 33:42 34:37 36:37]
  assign io_rdata_20 = reg_17; // @[datapath.scala 33:42 34:37 36:37]
  assign io_rdata_21 = reg_18; // @[datapath.scala 33:42 34:37 36:37]
  assign io_rdata_22 = reg_19; // @[datapath.scala 33:42 34:37 36:37]
  assign io_rdata_23 = reg_20; // @[datapath.scala 33:42 34:37 36:37]
  assign io_rdata_24 = reg_21; // @[datapath.scala 33:42 34:37 36:37]
  assign io_rdata_25 = reg_22; // @[datapath.scala 33:42 34:37 36:37]
  assign io_rdata_26 = reg_23; // @[datapath.scala 33:42 34:37 36:37]
  assign io_rdata_27 = reg_24; // @[datapath.scala 33:42 34:37 36:37]
  assign io_rdata_28 = reg_25; // @[datapath.scala 33:42 34:37 36:37]
  assign io_rdata_29 = reg_26; // @[datapath.scala 33:42 34:37 36:37]
  assign io_rdata_30 = reg_27; // @[datapath.scala 33:42 34:37 36:37]
  assign io_rdata_31 = reg_28; // @[datapath.scala 33:42 34:37 36:37]
  assign io_rdata_32 = reg_29; // @[datapath.scala 33:42 34:37 36:37]
  assign io_rdata_33 = reg_30; // @[datapath.scala 33:42 34:37 36:37]
  assign io_rdata_34 = reg_31; // @[datapath.scala 33:42 34:37 36:37]
  always @(posedge clock) begin
    if (reset) begin // @[datapath.scala 23:22]
      reg_0 <= 64'h0; // @[datapath.scala 23:22]
    end else if (io_wen) begin // @[datapath.scala 25:17]
      if (5'h0 == io_waddr) begin // @[datapath.scala 26:23]
        reg_0 <= io_wdata; // @[datapath.scala 26:23]
      end
    end
    if (reset) begin // @[datapath.scala 23:22]
      reg_1 <= 64'h0; // @[datapath.scala 23:22]
    end else if (io_wen) begin // @[datapath.scala 25:17]
      if (5'h1 == io_waddr) begin // @[datapath.scala 26:23]
        reg_1 <= io_wdata; // @[datapath.scala 26:23]
      end
    end
    if (reset) begin // @[datapath.scala 23:22]
      reg_2 <= 64'h0; // @[datapath.scala 23:22]
    end else if (io_wen) begin // @[datapath.scala 25:17]
      if (5'h2 == io_waddr) begin // @[datapath.scala 26:23]
        reg_2 <= io_wdata; // @[datapath.scala 26:23]
      end
    end
    if (reset) begin // @[datapath.scala 23:22]
      reg_3 <= 64'h0; // @[datapath.scala 23:22]
    end else if (io_wen) begin // @[datapath.scala 25:17]
      if (5'h3 == io_waddr) begin // @[datapath.scala 26:23]
        reg_3 <= io_wdata; // @[datapath.scala 26:23]
      end
    end
    if (reset) begin // @[datapath.scala 23:22]
      reg_4 <= 64'h0; // @[datapath.scala 23:22]
    end else if (io_wen) begin // @[datapath.scala 25:17]
      if (5'h4 == io_waddr) begin // @[datapath.scala 26:23]
        reg_4 <= io_wdata; // @[datapath.scala 26:23]
      end
    end
    if (reset) begin // @[datapath.scala 23:22]
      reg_5 <= 64'h0; // @[datapath.scala 23:22]
    end else if (io_wen) begin // @[datapath.scala 25:17]
      if (5'h5 == io_waddr) begin // @[datapath.scala 26:23]
        reg_5 <= io_wdata; // @[datapath.scala 26:23]
      end
    end
    if (reset) begin // @[datapath.scala 23:22]
      reg_6 <= 64'h0; // @[datapath.scala 23:22]
    end else if (io_wen) begin // @[datapath.scala 25:17]
      if (5'h6 == io_waddr) begin // @[datapath.scala 26:23]
        reg_6 <= io_wdata; // @[datapath.scala 26:23]
      end
    end
    if (reset) begin // @[datapath.scala 23:22]
      reg_7 <= 64'h0; // @[datapath.scala 23:22]
    end else if (io_wen) begin // @[datapath.scala 25:17]
      if (5'h7 == io_waddr) begin // @[datapath.scala 26:23]
        reg_7 <= io_wdata; // @[datapath.scala 26:23]
      end
    end
    if (reset) begin // @[datapath.scala 23:22]
      reg_8 <= 64'h0; // @[datapath.scala 23:22]
    end else if (io_wen) begin // @[datapath.scala 25:17]
      if (5'h8 == io_waddr) begin // @[datapath.scala 26:23]
        reg_8 <= io_wdata; // @[datapath.scala 26:23]
      end
    end
    if (reset) begin // @[datapath.scala 23:22]
      reg_9 <= 64'h0; // @[datapath.scala 23:22]
    end else if (io_wen) begin // @[datapath.scala 25:17]
      if (5'h9 == io_waddr) begin // @[datapath.scala 26:23]
        reg_9 <= io_wdata; // @[datapath.scala 26:23]
      end
    end
    if (reset) begin // @[datapath.scala 23:22]
      reg_10 <= 64'h0; // @[datapath.scala 23:22]
    end else if (io_wen) begin // @[datapath.scala 25:17]
      if (5'ha == io_waddr) begin // @[datapath.scala 26:23]
        reg_10 <= io_wdata; // @[datapath.scala 26:23]
      end
    end
    if (reset) begin // @[datapath.scala 23:22]
      reg_11 <= 64'h0; // @[datapath.scala 23:22]
    end else if (io_wen) begin // @[datapath.scala 25:17]
      if (5'hb == io_waddr) begin // @[datapath.scala 26:23]
        reg_11 <= io_wdata; // @[datapath.scala 26:23]
      end
    end
    if (reset) begin // @[datapath.scala 23:22]
      reg_12 <= 64'h0; // @[datapath.scala 23:22]
    end else if (io_wen) begin // @[datapath.scala 25:17]
      if (5'hc == io_waddr) begin // @[datapath.scala 26:23]
        reg_12 <= io_wdata; // @[datapath.scala 26:23]
      end
    end
    if (reset) begin // @[datapath.scala 23:22]
      reg_13 <= 64'h0; // @[datapath.scala 23:22]
    end else if (io_wen) begin // @[datapath.scala 25:17]
      if (5'hd == io_waddr) begin // @[datapath.scala 26:23]
        reg_13 <= io_wdata; // @[datapath.scala 26:23]
      end
    end
    if (reset) begin // @[datapath.scala 23:22]
      reg_14 <= 64'h0; // @[datapath.scala 23:22]
    end else if (io_wen) begin // @[datapath.scala 25:17]
      if (5'he == io_waddr) begin // @[datapath.scala 26:23]
        reg_14 <= io_wdata; // @[datapath.scala 26:23]
      end
    end
    if (reset) begin // @[datapath.scala 23:22]
      reg_15 <= 64'h0; // @[datapath.scala 23:22]
    end else if (io_wen) begin // @[datapath.scala 25:17]
      if (5'hf == io_waddr) begin // @[datapath.scala 26:23]
        reg_15 <= io_wdata; // @[datapath.scala 26:23]
      end
    end
    if (reset) begin // @[datapath.scala 23:22]
      reg_16 <= 64'h0; // @[datapath.scala 23:22]
    end else if (io_wen) begin // @[datapath.scala 25:17]
      if (5'h10 == io_waddr) begin // @[datapath.scala 26:23]
        reg_16 <= io_wdata; // @[datapath.scala 26:23]
      end
    end
    if (reset) begin // @[datapath.scala 23:22]
      reg_17 <= 64'h0; // @[datapath.scala 23:22]
    end else if (io_wen) begin // @[datapath.scala 25:17]
      if (5'h11 == io_waddr) begin // @[datapath.scala 26:23]
        reg_17 <= io_wdata; // @[datapath.scala 26:23]
      end
    end
    if (reset) begin // @[datapath.scala 23:22]
      reg_18 <= 64'h0; // @[datapath.scala 23:22]
    end else if (io_wen) begin // @[datapath.scala 25:17]
      if (5'h12 == io_waddr) begin // @[datapath.scala 26:23]
        reg_18 <= io_wdata; // @[datapath.scala 26:23]
      end
    end
    if (reset) begin // @[datapath.scala 23:22]
      reg_19 <= 64'h0; // @[datapath.scala 23:22]
    end else if (io_wen) begin // @[datapath.scala 25:17]
      if (5'h13 == io_waddr) begin // @[datapath.scala 26:23]
        reg_19 <= io_wdata; // @[datapath.scala 26:23]
      end
    end
    if (reset) begin // @[datapath.scala 23:22]
      reg_20 <= 64'h0; // @[datapath.scala 23:22]
    end else if (io_wen) begin // @[datapath.scala 25:17]
      if (5'h14 == io_waddr) begin // @[datapath.scala 26:23]
        reg_20 <= io_wdata; // @[datapath.scala 26:23]
      end
    end
    if (reset) begin // @[datapath.scala 23:22]
      reg_21 <= 64'h0; // @[datapath.scala 23:22]
    end else if (io_wen) begin // @[datapath.scala 25:17]
      if (5'h15 == io_waddr) begin // @[datapath.scala 26:23]
        reg_21 <= io_wdata; // @[datapath.scala 26:23]
      end
    end
    if (reset) begin // @[datapath.scala 23:22]
      reg_22 <= 64'h0; // @[datapath.scala 23:22]
    end else if (io_wen) begin // @[datapath.scala 25:17]
      if (5'h16 == io_waddr) begin // @[datapath.scala 26:23]
        reg_22 <= io_wdata; // @[datapath.scala 26:23]
      end
    end
    if (reset) begin // @[datapath.scala 23:22]
      reg_23 <= 64'h0; // @[datapath.scala 23:22]
    end else if (io_wen) begin // @[datapath.scala 25:17]
      if (5'h17 == io_waddr) begin // @[datapath.scala 26:23]
        reg_23 <= io_wdata; // @[datapath.scala 26:23]
      end
    end
    if (reset) begin // @[datapath.scala 23:22]
      reg_24 <= 64'h0; // @[datapath.scala 23:22]
    end else if (io_wen) begin // @[datapath.scala 25:17]
      if (5'h18 == io_waddr) begin // @[datapath.scala 26:23]
        reg_24 <= io_wdata; // @[datapath.scala 26:23]
      end
    end
    if (reset) begin // @[datapath.scala 23:22]
      reg_25 <= 64'h0; // @[datapath.scala 23:22]
    end else if (io_wen) begin // @[datapath.scala 25:17]
      if (5'h19 == io_waddr) begin // @[datapath.scala 26:23]
        reg_25 <= io_wdata; // @[datapath.scala 26:23]
      end
    end
    if (reset) begin // @[datapath.scala 23:22]
      reg_26 <= 64'h0; // @[datapath.scala 23:22]
    end else if (io_wen) begin // @[datapath.scala 25:17]
      if (5'h1a == io_waddr) begin // @[datapath.scala 26:23]
        reg_26 <= io_wdata; // @[datapath.scala 26:23]
      end
    end
    if (reset) begin // @[datapath.scala 23:22]
      reg_27 <= 64'h0; // @[datapath.scala 23:22]
    end else if (io_wen) begin // @[datapath.scala 25:17]
      if (5'h1b == io_waddr) begin // @[datapath.scala 26:23]
        reg_27 <= io_wdata; // @[datapath.scala 26:23]
      end
    end
    if (reset) begin // @[datapath.scala 23:22]
      reg_28 <= 64'h0; // @[datapath.scala 23:22]
    end else if (io_wen) begin // @[datapath.scala 25:17]
      if (5'h1c == io_waddr) begin // @[datapath.scala 26:23]
        reg_28 <= io_wdata; // @[datapath.scala 26:23]
      end
    end
    if (reset) begin // @[datapath.scala 23:22]
      reg_29 <= 64'h0; // @[datapath.scala 23:22]
    end else if (io_wen) begin // @[datapath.scala 25:17]
      if (5'h1d == io_waddr) begin // @[datapath.scala 26:23]
        reg_29 <= io_wdata; // @[datapath.scala 26:23]
      end
    end
    if (reset) begin // @[datapath.scala 23:22]
      reg_30 <= 64'h0; // @[datapath.scala 23:22]
    end else if (io_wen) begin // @[datapath.scala 25:17]
      if (5'h1e == io_waddr) begin // @[datapath.scala 26:23]
        reg_30 <= io_wdata; // @[datapath.scala 26:23]
      end
    end
    if (reset) begin // @[datapath.scala 23:22]
      reg_31 <= 64'h0; // @[datapath.scala 23:22]
    end else if (io_wen) begin // @[datapath.scala 25:17]
      if (5'h1f == io_waddr) begin // @[datapath.scala 26:23]
        reg_31 <= io_wdata; // @[datapath.scala 26:23]
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
module CSR(
  input         clock,
  input         reset,
  output [3:0]  io_flush_mask,
  input  [2:0]  io_r_op,
  input  [11:0] io_r_addr,
  output [63:0] io_r_data,
  input  [2:0]  io_w_op,
  input  [11:0] io_w_addr,
  input  [63:0] io_w_data,
  input         io_retired,
  input  [31:0] io_inst,
  input  [31:0] io_illegal_inst,
  input  [1:0]  io_inst_mode,
  input         io_fetch_misalign,
  input         io_load_misalign,
  input         io_store_misalign,
  input         io_isSret,
  input         io_isMret,
  input  [63:0] io_pc_fetch_misalign,
  input  [63:0] io_load_misalign_addr,
  input  [63:0] io_store_misalign_addr,
  input  [63:0] io_ebreak_addr,
  input  [63:0] io_excPC,
  output [63:0] io_excValue,
  output [63:0] io_trapVec,
  output        io_trap,
  input         io_fd_enable,
  input         io_de_enable,
  input         io_mw_enable
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
  reg [63:0] _RAND_8;
  reg [63:0] _RAND_9;
  reg [31:0] _RAND_10;
  reg [31:0] _RAND_11;
  reg [31:0] _RAND_12;
  reg [31:0] _RAND_13;
  reg [31:0] _RAND_14;
  reg [31:0] _RAND_15;
  reg [63:0] _RAND_16;
  reg [31:0] _RAND_17;
  reg [63:0] _RAND_18;
  reg [63:0] _RAND_19;
  reg [31:0] _RAND_20;
  reg [63:0] _RAND_21;
  reg [63:0] _RAND_22;
  reg [31:0] _RAND_23;
  reg [31:0] _RAND_24;
  reg [31:0] _RAND_25;
  reg [31:0] _RAND_26;
  reg [31:0] _RAND_27;
  reg [63:0] _RAND_28;
  reg [63:0] _RAND_29;
  reg [63:0] _RAND_30;
  reg [31:0] _RAND_31;
  reg [63:0] _RAND_32;
  reg [63:0] _RAND_33;
  reg [31:0] _RAND_34;
  reg [63:0] _RAND_35;
  reg [63:0] _RAND_36;
`endif // RANDOMIZE_REG_INIT
  reg [1:0] mode; // @[csr.scala 155:27]
  reg  mstatus_sum; // @[csr.scala 160:30]
  reg [1:0] mstatus_mpp; // @[csr.scala 160:30]
  reg  mstatus_spp; // @[csr.scala 160:30]
  reg  mstatus_mpie; // @[csr.scala 160:30]
  reg  mstatus_spie; // @[csr.scala 160:30]
  reg  mstatus_mie; // @[csr.scala 160:30]
  reg  mstatus_sie; // @[csr.scala 160:30]
  reg [63:0] medeleg_data; // @[csr.scala 162:30]
  reg [63:0] mideleg_data; // @[csr.scala 163:30]
  reg  mie_meie; // @[csr.scala 164:34]
  reg  mie_seie; // @[csr.scala 164:34]
  reg  mie_mtie; // @[csr.scala 164:34]
  reg  mie_stie; // @[csr.scala 164:34]
  reg  mie_msie; // @[csr.scala 164:34]
  reg  mie_ssie; // @[csr.scala 164:34]
  reg [61:0] mtvec_base; // @[csr.scala 165:34]
  reg [1:0] mtvec_mode; // @[csr.scala 165:34]
  reg [63:0] mscratch_data; // @[csr.scala 166:30]
  reg [63:0] mepc_data; // @[csr.scala 167:34]
  reg  mcause_int; // @[csr.scala 168:34]
  reg [62:0] mcause_code; // @[csr.scala 168:34]
  reg [63:0] mtval_data; // @[csr.scala 169:34]
  reg  mip_meip; // @[csr.scala 170:34]
  reg  mip_seip; // @[csr.scala 170:34]
  reg  mip_stip; // @[csr.scala 170:34]
  reg  mip_msip; // @[csr.scala 170:34]
  reg  mip_ssip; // @[csr.scala 170:34]
  reg [63:0] mcycle_data; // @[csr.scala 172:34]
  reg [63:0] minstret_data; // @[csr.scala 173:30]
  wire [5:0] sstatus_lo_lo = {mstatus_spie,1'h0,mstatus_mie,1'h0,mstatus_sie,1'h0}; // @[csrFile.scala 47:30]
  wire [16:0] sstatus_lo = {4'h0,mstatus_mpp,2'h0,mstatus_spp,mstatus_mpie,1'h0,sstatus_lo_lo}; // @[csrFile.scala 47:30]
  wire [63:0] _sstatus_T = {41'h0,3'h0,1'h0,mstatus_sum,1'h0,sstatus_lo}; // @[csrFile.scala 47:30]
  wire  sstatus_sum = _sstatus_T[18]; // @[csrFile.scala 96:29]
  wire  sstatus_spp = _sstatus_T[8]; // @[csrFile.scala 97:33]
  wire  sstatus_spie = _sstatus_T[5]; // @[csrFile.scala 98:29]
  wire  sstatus_sie = _sstatus_T[1]; // @[csrFile.scala 99:29]
  wire [5:0] sie_lo = {mie_stie,1'h0,mie_msie,1'h0,mie_ssie,1'h0}; // @[csrFile.scala 47:30]
  wire [63:0] _sie_T = {52'h0,mie_meie,1'h0,mie_seie,1'h0,mie_mtie,1'h0,sie_lo}; // @[csrFile.scala 47:30]
  wire [5:0] sip_lo = {mip_stip,1'h0,mip_msip,1'h0,mip_ssip,1'h0}; // @[csrFile.scala 47:30]
  wire [63:0] _sip_T = {52'h0,mip_meip,1'h0,mip_seip,3'h0,sip_lo}; // @[csrFile.scala 47:30]
  reg [61:0] stvec_base; // @[csr.scala 177:34]
  reg [1:0] stvec_mode; // @[csr.scala 177:34]
  reg [63:0] sscratch_data; // @[csr.scala 178:30]
  reg [63:0] sepc_data; // @[csr.scala 179:34]
  reg  scause_int; // @[csr.scala 180:34]
  reg [62:0] scause_code; // @[csr.scala 180:34]
  reg [63:0] stval_data; // @[csr.scala 181:34]
  wire [12:0] lo = {4'h0,sstatus_spp,2'h0,sstatus_spie,3'h0,sstatus_sie,1'h0}; // @[csr.scala 193:70]
  wire [63:0] _T = {45'h0,sstatus_sum,1'h0,4'h0,lo}; // @[csr.scala 193:70]
  wire  tmp_meie = _sie_T[11]; // @[csrFile.scala 311:18]
  wire  tmp_mtie = _sie_T[7]; // @[csrFile.scala 313:18]
  wire  tmp_msie = _sie_T[3]; // @[csrFile.scala 315:18]
  wire [5:0] lo_7 = {_sie_T[5],1'h0,tmp_msie,1'h0,_sie_T[1],1'h0}; // @[csrFile.scala 37:29]
  wire [63:0] _T_163 = {52'h0,tmp_meie,1'h0,_sie_T[9],1'h0,tmp_mtie,1'h0,lo_7}; // @[csrFile.scala 37:29]
  wire  sie_ssie = _T_163[1]; // @[csrFile.scala 65:29]
  wire  sie_stie = _T_163[5]; // @[csrFile.scala 64:29]
  wire  sie_seie = _T_163[9]; // @[csrFile.scala 63:29]
  wire [63:0] _T_1 = {54'h0,sie_seie,3'h0,sie_stie,3'h0,sie_ssie,1'h0}; // @[csr.scala 194:66]
  wire [63:0] _T_2 = {stvec_base,stvec_mode}; // @[csr.scala 195:68]
  wire [63:0] _T_3 = {scause_int,scause_code}; // @[csr.scala 199:69]
  wire [63:0] _T_4 = {54'h0,mip_seip,3'h0,mip_stip,3'h0,mip_ssip,1'h0}; // @[csr.scala 201:66]
  wire [63:0] _T_9 = {mtvec_base,mtvec_mode}; // @[csr.scala 212:68]
  wire [63:0] _T_10 = {mcause_int,mcause_code}; // @[csr.scala 216:69]
  wire  _T_13 = 12'hc00 == io_r_addr; // @[Lookup.scala 31:38]
  wire  _T_15 = 12'hc02 == io_r_addr; // @[Lookup.scala 31:38]
  wire  _T_17 = 12'h100 == io_r_addr; // @[Lookup.scala 31:38]
  wire  _T_19 = 12'h104 == io_r_addr; // @[Lookup.scala 31:38]
  wire  _T_21 = 12'h105 == io_r_addr; // @[Lookup.scala 31:38]
  wire  _T_23 = 12'h106 == io_r_addr; // @[Lookup.scala 31:38]
  wire  _T_25 = 12'h140 == io_r_addr; // @[Lookup.scala 31:38]
  wire  _T_27 = 12'h141 == io_r_addr; // @[Lookup.scala 31:38]
  wire  _T_29 = 12'h142 == io_r_addr; // @[Lookup.scala 31:38]
  wire  _T_31 = 12'h143 == io_r_addr; // @[Lookup.scala 31:38]
  wire  _T_33 = 12'h144 == io_r_addr; // @[Lookup.scala 31:38]
  wire  _T_35 = 12'h180 == io_r_addr; // @[Lookup.scala 31:38]
  wire  _T_37 = 12'hf11 == io_r_addr; // @[Lookup.scala 31:38]
  wire  _T_39 = 12'hf12 == io_r_addr; // @[Lookup.scala 31:38]
  wire  _T_41 = 12'hf13 == io_r_addr; // @[Lookup.scala 31:38]
  wire  _T_43 = 12'hf14 == io_r_addr; // @[Lookup.scala 31:38]
  wire  _T_45 = 12'h300 == io_r_addr; // @[Lookup.scala 31:38]
  wire  _T_47 = 12'h301 == io_r_addr; // @[Lookup.scala 31:38]
  wire  _T_49 = 12'h302 == io_r_addr; // @[Lookup.scala 31:38]
  wire  _T_51 = 12'h303 == io_r_addr; // @[Lookup.scala 31:38]
  wire  _T_53 = 12'h304 == io_r_addr; // @[Lookup.scala 31:38]
  wire  _T_55 = 12'h305 == io_r_addr; // @[Lookup.scala 31:38]
  wire  _T_57 = 12'h306 == io_r_addr; // @[Lookup.scala 31:38]
  wire  _T_59 = 12'h340 == io_r_addr; // @[Lookup.scala 31:38]
  wire  _T_61 = 12'h341 == io_r_addr; // @[Lookup.scala 31:38]
  wire  _T_63 = 12'h342 == io_r_addr; // @[Lookup.scala 31:38]
  wire  _T_65 = 12'h343 == io_r_addr; // @[Lookup.scala 31:38]
  wire  _T_67 = 12'h344 == io_r_addr; // @[Lookup.scala 31:38]
  wire  _T_69 = 12'hb00 == io_r_addr; // @[Lookup.scala 31:38]
  wire  _T_71 = 12'hb02 == io_r_addr; // @[Lookup.scala 31:38]
  wire [63:0] _T_72 = _T_71 ? minstret_data : 64'h0; // @[Lookup.scala 34:39]
  wire [63:0] _T_73 = _T_69 ? mcycle_data : _T_72; // @[Lookup.scala 34:39]
  wire [63:0] _T_74 = _T_67 ? _sip_T : _T_73; // @[Lookup.scala 34:39]
  wire [63:0] _T_75 = _T_65 ? mtval_data : _T_74; // @[Lookup.scala 34:39]
  wire [63:0] _T_76 = _T_63 ? _T_10 : _T_75; // @[Lookup.scala 34:39]
  wire [63:0] _T_77 = _T_61 ? mepc_data : _T_76; // @[Lookup.scala 34:39]
  wire [63:0] _T_78 = _T_59 ? mscratch_data : _T_77; // @[Lookup.scala 34:39]
  wire [63:0] _T_79 = _T_57 ? 64'h0 : _T_78; // @[Lookup.scala 34:39]
  wire [63:0] _T_80 = _T_55 ? _T_9 : _T_79; // @[Lookup.scala 34:39]
  wire [63:0] _T_81 = _T_53 ? _sie_T : _T_80; // @[Lookup.scala 34:39]
  wire [63:0] _T_82 = _T_51 ? mideleg_data : _T_81; // @[Lookup.scala 34:39]
  wire [63:0] _T_83 = _T_49 ? medeleg_data : _T_82; // @[Lookup.scala 34:39]
  wire [63:0] _T_84 = _T_47 ? 64'h1100 : _T_83; // @[Lookup.scala 34:39]
  wire [63:0] _T_85 = _T_45 ? _sstatus_T : _T_84; // @[Lookup.scala 34:39]
  wire [63:0] _T_86 = _T_43 ? 64'h0 : _T_85; // @[Lookup.scala 34:39]
  wire [63:0] _T_87 = _T_41 ? 64'h0 : _T_86; // @[Lookup.scala 34:39]
  wire [63:0] _T_88 = _T_39 ? 64'h0 : _T_87; // @[Lookup.scala 34:39]
  wire [63:0] _T_89 = _T_37 ? 64'h0 : _T_88; // @[Lookup.scala 34:39]
  wire [63:0] _T_90 = _T_35 ? 64'h0 : _T_89; // @[Lookup.scala 34:39]
  wire [63:0] _T_91 = _T_33 ? _T_4 : _T_90; // @[Lookup.scala 34:39]
  wire [63:0] _T_92 = _T_31 ? stval_data : _T_91; // @[Lookup.scala 34:39]
  wire [63:0] _T_93 = _T_29 ? _T_3 : _T_92; // @[Lookup.scala 34:39]
  wire [63:0] _T_94 = _T_27 ? sepc_data : _T_93; // @[Lookup.scala 34:39]
  wire [63:0] _T_95 = _T_25 ? sscratch_data : _T_94; // @[Lookup.scala 34:39]
  wire [63:0] _T_96 = _T_23 ? 64'h0 : _T_95; // @[Lookup.scala 34:39]
  wire [63:0] _T_97 = _T_21 ? _T_2 : _T_96; // @[Lookup.scala 34:39]
  wire [63:0] _T_98 = _T_19 ? _T_1 : _T_97; // @[Lookup.scala 34:39]
  wire [63:0] _T_99 = _T_17 ? _T : _T_98; // @[Lookup.scala 34:39]
  wire [63:0] _T_100 = _T_15 ? minstret_data : _T_99; // @[Lookup.scala 34:39]
  wire  readable = _T_13 | (_T_15 | (_T_17 | (_T_19 | (_T_21 | (_T_23 | (_T_25 | (_T_27 | (_T_29 | (_T_31 | (_T_33 | (
    _T_35 | (_T_37 | (_T_39 | (_T_41 | (_T_43 | (_T_45 | (_T_47 | (_T_49 | (_T_51 | (_T_53 | (_T_55 | (_T_57 | (_T_59 |
    (_T_61 | (_T_63 | (_T_65 | (_T_67 | (_T_69 | _T_71)))))))))))))))))))))))))))); // @[Lookup.scala 34:39]
  wire  _T_142 = _T_47 ? 1'h0 : _T_49 | (_T_51 | (_T_53 | (_T_55 | (_T_57 | (_T_59 | (_T_61 | (_T_63 | (_T_65 | (_T_67
     | (_T_69 | _T_71)))))))))); // @[Lookup.scala 34:39]
  wire  _T_144 = _T_43 ? 1'h0 : _T_45 | _T_142; // @[Lookup.scala 34:39]
  wire  _T_145 = _T_41 ? 1'h0 : _T_144; // @[Lookup.scala 34:39]
  wire  _T_146 = _T_39 ? 1'h0 : _T_145; // @[Lookup.scala 34:39]
  wire  _T_147 = _T_37 ? 1'h0 : _T_146; // @[Lookup.scala 34:39]
  wire  _T_158 = _T_15 ? 1'h0 : _T_17 | (_T_19 | (_T_21 | (_T_23 | (_T_25 | (_T_27 | (_T_29 | (_T_31 | (_T_33 | (_T_35
     | _T_147))))))))); // @[Lookup.scala 34:39]
  wire  writable = _T_13 ? 1'h0 : _T_158; // @[Lookup.scala 34:39]
  wire  _instValid_T = readable & writable; // @[csr.scala 232:43]
  wire  _instValid_T_4 = 3'h1 == io_r_op ? readable : 1'h1; // @[Mux.scala 81:58]
  wire  _instValid_T_6 = 3'h2 == io_r_op ? writable : _instValid_T_4; // @[Mux.scala 81:58]
  wire  _instValid_T_8 = 3'h3 == io_r_op ? _instValid_T : _instValid_T_6; // @[Mux.scala 81:58]
  wire  _instValid_T_10 = 3'h4 == io_r_op ? _instValid_T : _instValid_T_8; // @[Mux.scala 81:58]
  wire  _instValid_T_12 = 3'h5 == io_r_op ? _instValid_T : _instValid_T_10; // @[Mux.scala 81:58]
  wire  _instValid_T_13 = ~io_fd_enable; // @[csr.scala 235:16]
  wire  instValid = _instValid_T_12 | ~io_fd_enable; // @[csr.scala 235:12]
  wire  modeValid = io_r_addr[9:8] <= mode & io_inst_mode <= mode | _instValid_T_13; // @[csr.scala 239:78]
  wire  valid = instValid & (modeValid | io_r_op == 3'h0); // @[csr.scala 240:31]
  wire [11:0] _csrData_T = {{9'd0}, io_w_op}; // @[Lookup.scala 31:38]
  wire  _csrData_T_1 = 12'hc00 == _csrData_T; // @[Lookup.scala 31:38]
  wire  _csrData_T_3 = 12'hc02 == _csrData_T; // @[Lookup.scala 31:38]
  wire  _csrData_T_5 = 12'h100 == _csrData_T; // @[Lookup.scala 31:38]
  wire  _csrData_T_7 = 12'h104 == _csrData_T; // @[Lookup.scala 31:38]
  wire  _csrData_T_9 = 12'h105 == _csrData_T; // @[Lookup.scala 31:38]
  wire  _csrData_T_11 = 12'h106 == _csrData_T; // @[Lookup.scala 31:38]
  wire  _csrData_T_13 = 12'h140 == _csrData_T; // @[Lookup.scala 31:38]
  wire  _csrData_T_15 = 12'h141 == _csrData_T; // @[Lookup.scala 31:38]
  wire  _csrData_T_17 = 12'h142 == _csrData_T; // @[Lookup.scala 31:38]
  wire  _csrData_T_19 = 12'h143 == _csrData_T; // @[Lookup.scala 31:38]
  wire  _csrData_T_21 = 12'h144 == _csrData_T; // @[Lookup.scala 31:38]
  wire  _csrData_T_23 = 12'h180 == _csrData_T; // @[Lookup.scala 31:38]
  wire  _csrData_T_25 = 12'hf11 == _csrData_T; // @[Lookup.scala 31:38]
  wire  _csrData_T_27 = 12'hf12 == _csrData_T; // @[Lookup.scala 31:38]
  wire  _csrData_T_29 = 12'hf13 == _csrData_T; // @[Lookup.scala 31:38]
  wire  _csrData_T_31 = 12'hf14 == _csrData_T; // @[Lookup.scala 31:38]
  wire  _csrData_T_33 = 12'h300 == _csrData_T; // @[Lookup.scala 31:38]
  wire  _csrData_T_35 = 12'h301 == _csrData_T; // @[Lookup.scala 31:38]
  wire  _csrData_T_37 = 12'h302 == _csrData_T; // @[Lookup.scala 31:38]
  wire  _csrData_T_39 = 12'h303 == _csrData_T; // @[Lookup.scala 31:38]
  wire  _csrData_T_41 = 12'h304 == _csrData_T; // @[Lookup.scala 31:38]
  wire  _csrData_T_43 = 12'h305 == _csrData_T; // @[Lookup.scala 31:38]
  wire  _csrData_T_45 = 12'h306 == _csrData_T; // @[Lookup.scala 31:38]
  wire  _csrData_T_47 = 12'h340 == _csrData_T; // @[Lookup.scala 31:38]
  wire  _csrData_T_49 = 12'h341 == _csrData_T; // @[Lookup.scala 31:38]
  wire  _csrData_T_51 = 12'h342 == _csrData_T; // @[Lookup.scala 31:38]
  wire  _csrData_T_53 = 12'h343 == _csrData_T; // @[Lookup.scala 31:38]
  wire  _csrData_T_55 = 12'h344 == _csrData_T; // @[Lookup.scala 31:38]
  wire  _csrData_T_57 = 12'hb00 == _csrData_T; // @[Lookup.scala 31:38]
  wire  _csrData_T_59 = 12'hb02 == _csrData_T; // @[Lookup.scala 31:38]
  wire [63:0] _csrData_T_60 = _csrData_T_59 ? minstret_data : 64'h0; // @[Lookup.scala 34:39]
  wire [63:0] _csrData_T_61 = _csrData_T_57 ? mcycle_data : _csrData_T_60; // @[Lookup.scala 34:39]
  wire [63:0] _csrData_T_62 = _csrData_T_55 ? _sip_T : _csrData_T_61; // @[Lookup.scala 34:39]
  wire [63:0] _csrData_T_63 = _csrData_T_53 ? mtval_data : _csrData_T_62; // @[Lookup.scala 34:39]
  wire [63:0] _csrData_T_64 = _csrData_T_51 ? _T_10 : _csrData_T_63; // @[Lookup.scala 34:39]
  wire [63:0] _csrData_T_65 = _csrData_T_49 ? mepc_data : _csrData_T_64; // @[Lookup.scala 34:39]
  wire [63:0] _csrData_T_66 = _csrData_T_47 ? mscratch_data : _csrData_T_65; // @[Lookup.scala 34:39]
  wire [63:0] _csrData_T_67 = _csrData_T_45 ? 64'h0 : _csrData_T_66; // @[Lookup.scala 34:39]
  wire [63:0] _csrData_T_68 = _csrData_T_43 ? _T_9 : _csrData_T_67; // @[Lookup.scala 34:39]
  wire [63:0] _csrData_T_69 = _csrData_T_41 ? _sie_T : _csrData_T_68; // @[Lookup.scala 34:39]
  wire [63:0] _csrData_T_70 = _csrData_T_39 ? mideleg_data : _csrData_T_69; // @[Lookup.scala 34:39]
  wire [63:0] _csrData_T_71 = _csrData_T_37 ? medeleg_data : _csrData_T_70; // @[Lookup.scala 34:39]
  wire [63:0] _csrData_T_72 = _csrData_T_35 ? 64'h1100 : _csrData_T_71; // @[Lookup.scala 34:39]
  wire [63:0] _csrData_T_73 = _csrData_T_33 ? _sstatus_T : _csrData_T_72; // @[Lookup.scala 34:39]
  wire [63:0] _csrData_T_74 = _csrData_T_31 ? 64'h0 : _csrData_T_73; // @[Lookup.scala 34:39]
  wire [63:0] _csrData_T_75 = _csrData_T_29 ? 64'h0 : _csrData_T_74; // @[Lookup.scala 34:39]
  wire [63:0] _csrData_T_76 = _csrData_T_27 ? 64'h0 : _csrData_T_75; // @[Lookup.scala 34:39]
  wire [63:0] _csrData_T_77 = _csrData_T_25 ? 64'h0 : _csrData_T_76; // @[Lookup.scala 34:39]
  wire [63:0] _csrData_T_78 = _csrData_T_23 ? 64'h0 : _csrData_T_77; // @[Lookup.scala 34:39]
  wire [63:0] _csrData_T_79 = _csrData_T_21 ? _T_4 : _csrData_T_78; // @[Lookup.scala 34:39]
  wire [63:0] _csrData_T_80 = _csrData_T_19 ? stval_data : _csrData_T_79; // @[Lookup.scala 34:39]
  wire [63:0] _csrData_T_81 = _csrData_T_17 ? _T_3 : _csrData_T_80; // @[Lookup.scala 34:39]
  wire [63:0] _csrData_T_82 = _csrData_T_15 ? sepc_data : _csrData_T_81; // @[Lookup.scala 34:39]
  wire [63:0] _csrData_T_83 = _csrData_T_13 ? sscratch_data : _csrData_T_82; // @[Lookup.scala 34:39]
  wire [63:0] _csrData_T_84 = _csrData_T_11 ? 64'h0 : _csrData_T_83; // @[Lookup.scala 34:39]
  wire [63:0] _csrData_T_85 = _csrData_T_9 ? _T_2 : _csrData_T_84; // @[Lookup.scala 34:39]
  wire [63:0] _csrData_T_86 = _csrData_T_7 ? _T_1 : _csrData_T_85; // @[Lookup.scala 34:39]
  wire [63:0] _csrData_T_87 = _csrData_T_5 ? _T : _csrData_T_86; // @[Lookup.scala 34:39]
  wire [63:0] _csrData_T_88 = _csrData_T_3 ? minstret_data : _csrData_T_87; // @[Lookup.scala 34:39]
  wire [63:0] csrData = _csrData_T_1 ? mcycle_data : _csrData_T_88; // @[Lookup.scala 34:39]
  wire  writeEn = (io_w_op == 3'h2 | io_w_op == 3'h3 | io_w_op == 3'h5 | io_w_op == 3'h4) & io_mw_enable; // @[csr.scala 245:93]
  wire [63:0] _writeData_T = csrData | io_w_data; // @[csr.scala 249:37]
  wire [63:0] _writeData_T_1 = ~io_w_data; // @[csr.scala 250:39]
  wire [63:0] _writeData_T_2 = csrData & _writeData_T_1; // @[csr.scala 250:37]
  wire [63:0] _writeData_T_4 = 3'h2 == io_w_op ? io_w_data : 64'h0; // @[Mux.scala 81:58]
  wire [63:0] _writeData_T_6 = 3'h3 == io_w_op ? io_w_data : _writeData_T_4; // @[Mux.scala 81:58]
  wire [63:0] _writeData_T_8 = 3'h4 == io_w_op ? _writeData_T : _writeData_T_6; // @[Mux.scala 81:58]
  wire [63:0] writeData = 3'h5 == io_w_op ? _writeData_T_2 : _writeData_T_8; // @[Mux.scala 81:58]
  wire [63:0] flagIntS = _T_4 & _T_1; // @[csr.scala 255:35]
  wire [63:0] flagIntM = _sip_T & _sie_T; // @[csr.scala 256:35]
  wire [63:0] _hasIntS_T_4 = flagIntS & mideleg_data; // @[csr.scala 265:97]
  wire  hasIntS = (mode < 2'h1 | mode == 2'h1 & mstatus_sie) & |_hasIntS_T_4; // @[csr.scala 265:27]
  wire [63:0] _hasIntM_T_2 = ~mideleg_data; // @[csr.scala 266:79]
  wire [63:0] _hasIntM_T_3 = flagIntS & _hasIntM_T_2; // @[csr.scala 266:77]
  wire  hasIntM = (mode <= 2'h1 | mstatus_mie) & |_hasIntM_T_3; // @[csr.scala 266:31]
  wire  hasInt = hasIntM | hasIntS; // @[csr.scala 267:30]
  wire  handIntS = hasInt & ~hasIntM; // @[csr.scala 269:31]
  wire  _hasExc_T_1 = ~valid; // @[csr.scala 279:40]
  wire  _hasExc_T_5 = ~valid | (|io_illegal_inst | io_fetch_misalign) & io_fd_enable; // @[csr.scala 279:48]
  wire  _hasExc_T_8 = _hasExc_T_5 | (io_load_misalign | io_store_misalign) & io_de_enable; // @[csr.scala 280:57]
  wire  _hasExc_T_10 = 32'h73 == io_inst; // @[csr.scala 281:70]
  wire  _hasExc_T_12 = 32'h100073 == io_inst; // @[csr.scala 281:104]
  wire  _hasExc_T_15 = _hasExc_T_8 | (32'h73 == io_inst | 32'h100073 == io_inst) & io_mw_enable; // @[csr.scala 281:57]
  wire  hasExc = ~hasInt & _hasExc_T_15; // @[csr.scala 279:35]
  wire [62:0] _excCause_T_7 = _hasExc_T_1 | io_illegal_inst != 32'h0 ? 63'h2 : {{62'd0}, io_fetch_misalign}; // @[csr.scala 288:76]
  wire [62:0] _excCause_T_8 = io_store_misalign ? 63'h6 : _excCause_T_7; // @[csr.scala 287:68]
  wire [62:0] _excCause_T_9 = io_load_misalign ? 63'h4 : _excCause_T_8; // @[csr.scala 286:60]
  wire [62:0] _excCause_T_10 = _hasExc_T_12 ? 63'h3 : _excCause_T_9; // @[csr.scala 285:52]
  wire [62:0] excCause = _hasExc_T_10 ? 63'h8 : _excCause_T_10; // @[csr.scala 284:28]
  wire [63:0] _hasExcS_T_1 = medeleg_data >> excCause[4:0]; // @[csr.scala 294:47]
  wire  hasExcS = hasExc & _hasExcS_T_1[0]; // @[csr.scala 294:30]
  wire  handExcS = ~mode[1] & hasExcS; // @[csr.scala 295:33]
  wire [63:0] _intCauseS_T = {{9'd0}, flagIntS[63:9]}; // @[csr.scala 302:37]
  wire [63:0] _intCauseS_T_2 = {{1'd0}, flagIntS[63:1]}; // @[csr.scala 303:61]
  wire [62:0] _intCauseS_T_4 = _intCauseS_T_2[0] ? 63'h1 : 63'h5; // @[csr.scala 303:52]
  wire [62:0] intCauseS = _intCauseS_T[0] ? 63'h9 : _intCauseS_T_4; // @[csr.scala 302:28]
  wire [63:0] _intCause_T = {{11'd0}, flagIntM[63:11]}; // @[csr.scala 306:36]
  wire [63:0] _intCause_T_2 = {{3'd0}, flagIntM[63:3]}; // @[csr.scala 307:61]
  wire [63:0] _intCause_T_4 = {{7'd0}, flagIntM[63:7]}; // @[csr.scala 308:69]
  wire [62:0] _intCause_T_6 = _intCause_T_4[0] ? 63'h7 : intCauseS; // @[csr.scala 308:60]
  wire [62:0] _intCause_T_7 = _intCause_T_2[0] ? 63'h3 : _intCause_T_6; // @[csr.scala 307:52]
  wire [62:0] intCause = _intCause_T[0] ? 63'hb : _intCause_T_7; // @[csr.scala 306:27]
  wire [63:0] _cause_T = {1'h1,intCause}; // @[Cat.scala 31:58]
  wire [63:0] _cause_T_1 = {1'h0,excCause}; // @[Cat.scala 31:58]
  wire [63:0] cause = hasInt ? _cause_T : _cause_T_1; // @[csr.scala 313:24]
  wire  _io_flush_mask_T_1 = excCause == 63'h3; // @[csr.scala 320:78]
  wire  _io_flush_mask_T_3 = excCause == 63'h4; // @[csr.scala 321:39]
  wire  _io_flush_mask_T_4 = excCause == 63'h6; // @[csr.scala 321:71]
  wire  _io_flush_mask_T_6 = excCause == 63'h2; // @[csr.scala 322:46]
  wire  _io_flush_mask_T_7 = excCause == 63'h0; // @[csr.scala 323:54]
  wire [1:0] _io_flush_mask_T_8 = excCause == 63'h0 ? 2'h3 : 2'h0; // @[csr.scala 323:44]
  wire [1:0] _io_flush_mask_T_9 = excCause == 63'h2 ? 2'h3 : _io_flush_mask_T_8; // @[csr.scala 322:36]
  wire [2:0] _io_flush_mask_T_10 = excCause == 63'h4 | excCause == 63'h6 ? 3'h7 : {{1'd0}, _io_flush_mask_T_9}; // @[csr.scala 321:28]
  wire [3:0] _io_flush_mask_T_11 = excCause == 63'h8 | excCause == 63'h3 ? 4'hf : {{1'd0}, _io_flush_mask_T_10}; // @[csr.scala 320:37]
  wire [3:0] _GEN_0 = hasExc ? _io_flush_mask_T_11 : 4'h0; // @[csr.scala 319:27 320:31 328:31]
  wire [31:0] _io_excValue_T_5 = _io_flush_mask_T_6 ? io_illegal_inst : 32'h0; // @[csr.scala 335:76]
  wire [63:0] _io_excValue_T_6 = _io_flush_mask_T_7 ? io_pc_fetch_misalign : {{32'd0}, _io_excValue_T_5}; // @[csr.scala 334:68]
  wire [63:0] _io_excValue_T_7 = _io_flush_mask_T_1 ? io_ebreak_addr : _io_excValue_T_6; // @[csr.scala 333:60]
  wire [63:0] _io_excValue_T_8 = _io_flush_mask_T_4 ? io_store_misalign_addr : _io_excValue_T_7; // @[csr.scala 332:52]
  wire [61:0] _GEN_149 = {{32'd0}, cause[29:0]}; // @[csr.scala 342:65]
  wire [61:0] _trapVecS_T_4 = stvec_base + _GEN_149; // @[csr.scala 342:65]
  wire [61:0] _trapVecS_T_5 = stvec_mode[0] & hasInt ? _trapVecS_T_4 : stvec_base; // @[csr.scala 342:27]
  wire [63:0] trapVecS = {_trapVecS_T_5, 2'h0}; // @[csr.scala 342:94]
  wire [61:0] _trapVecM_T_4 = mtvec_base + _GEN_149; // @[csr.scala 343:65]
  wire [61:0] _trapVecM_T_5 = mtvec_mode[0] & hasInt ? _trapVecM_T_4 : mtvec_base; // @[csr.scala 343:27]
  wire [63:0] trapVecM = {_trapVecM_T_5, 2'h0}; // @[csr.scala 343:94]
  wire  _trapVec_T = handIntS | handExcS; // @[csr.scala 344:36]
  wire [1:0] sretMode = {1'h0,sstatus_spp}; // @[Cat.scala 31:58]
  wire [1:0] excMode = handExcS ? 2'h1 : 2'h3; // @[csr.scala 355:26]
  wire [1:0] _trapMode_T = io_isMret ? mstatus_mpp : excMode; // @[csr.scala 358:44]
  wire [63:0] _mcycle_data_T_1 = mcycle_data + 64'h1; // @[csr.scala 375:36]
  wire [63:0] _minstret_data_T_1 = minstret_data + 64'h1; // @[csr.scala 377:48]
  wire [63:0] _GEN_2 = io_retired ? _minstret_data_T_1 : minstret_data; // @[csr.scala 376:25 173:30 377:31]
  wire  tmp_1_sum = writeData[18]; // @[csrFile.scala 96:29]
  wire  tmp_1_spp = writeData[8]; // @[csrFile.scala 97:33]
  wire  tmp_1_spie = writeData[5]; // @[csrFile.scala 98:29]
  wire  tmp_1_sie = writeData[1]; // @[csrFile.scala 99:29]
  wire [12:0] lo_8 = {4'h0,tmp_1_spp,2'h0,tmp_1_spie,3'h0,tmp_1_sie,1'h0}; // @[csrFile.scala 37:29]
  wire [63:0] _T_167 = {45'h0,tmp_1_sum,1'h0,4'h0,lo_8}; // @[csrFile.scala 37:29]
  wire  tmp_2_seie = writeData[9]; // @[csrFile.scala 63:29]
  wire [63:0] _T_169 = {54'h0,tmp_2_seie,3'h0,tmp_1_spie,3'h0,tmp_1_sie,1'h0}; // @[csrFile.scala 37:29]
  wire [63:0] _T_171 = {59'h0,3'h0,tmp_1_sie,1'h0}; // @[csrFile.scala 37:29]
  wire  _GEN_18 = io_w_addr == 12'h144 & _T_171[5]; // @[csr.scala 385:44 csrFile.scala 345:11 csr.scala 366:18]
  wire [63:0] _sepc_data_T_1 = {writeData[63:2],2'h0}; // @[Cat.scala 31:58]
  wire [15:0] _medeleg_data_T_5 = {3'h0,writeData[12],2'h0,writeData[9:8],1'h0,writeData[6],1'h0,writeData[4:2],1'h0,
    writeData[0]}; // @[Cat.scala 31:58]
  wire [5:0] mideleg_data_lo = {tmp_1_spie,1'h0,writeData[3],1'h0,tmp_1_sie,1'h0}; // @[Cat.scala 31:58]
  wire [22:0] _mideleg_data_T_6 = {1'h0,writeData[11],11'h0,tmp_2_seie,1'h0,writeData[7],1'h0,mideleg_data_lo}; // @[Cat.scala 31:58]
  wire  _T_188 = hasExc | hasInt; // @[csr.scala 404:28]
  wire  _T_190 = (io_isSret | io_isMret) & io_mw_enable; // @[csr.scala 404:67]
  wire [63:0] _sepc_data_T_3 = {io_excPC[63:2],2'h0}; // @[Cat.scala 31:58]
  wire [63:0] _GEN_52 = _trapVec_T ? _sepc_data_T_3 : sepc_data; // @[csr.scala 413:49 csrFile.scala 154:22 csr.scala 179:34]
  wire  _GEN_53 = _trapVec_T ? cause[63] : scause_int; // @[csr.scala 413:49 csrFile.scala 169:11 csr.scala 180:34]
  wire [62:0] _GEN_54 = _trapVec_T ? {{59'd0}, cause[3:0]} : scause_code; // @[csr.scala 413:49 csrFile.scala 170:11 csr.scala 180:34]
  wire [63:0] _GEN_55 = _trapVec_T ? io_excValue : stval_data; // @[csr.scala 413:49 csrFile.scala 30:22 csr.scala 181:34]
  wire  _GEN_56 = _trapVec_T ? mstatus_sie : mstatus_spie; // @[csr.scala 160:30 413:49 417:38]
  wire  _GEN_57 = _trapVec_T ? 1'h0 : mstatus_sie; // @[csr.scala 160:30 413:49 418:37]
  wire  _GEN_58 = _trapVec_T ? mode[0] : mstatus_spp; // @[csr.scala 160:30 413:49 419:37]
  wire [63:0] _GEN_59 = _trapVec_T ? mepc_data : _sepc_data_T_3; // @[csr.scala 167:34 413:49 csrFile.scala 386:11]
  wire  _GEN_60 = _trapVec_T ? mcause_int : cause[63]; // @[csr.scala 168:34 413:49 csrFile.scala 401:11]
  wire [62:0] _GEN_61 = _trapVec_T ? mcause_code : {{59'd0}, cause[3:0]}; // @[csr.scala 168:34 413:49 csrFile.scala 402:11]
  wire [63:0] _GEN_62 = _trapVec_T ? mtval_data : io_excValue; // @[csr.scala 169:34 413:49 csrFile.scala 30:22]
  wire  _GEN_63 = _trapVec_T ? mstatus_mpie : mstatus_mie; // @[csr.scala 160:30 413:49 424:38]
  wire  _GEN_64 = _trapVec_T & mstatus_mie; // @[csr.scala 160:30 413:49 425:37]
  wire [1:0] _GEN_65 = _trapVec_T ? mstatus_mpp : mode; // @[csr.scala 160:30 413:49 426:37]
  wire  _GEN_66 = io_isMret ? mstatus_mpie : _GEN_64; // @[csr.scala 409:38 410:37]
  wire  _GEN_67 = io_isMret | _GEN_63; // @[csr.scala 409:38 411:38]
  wire [1:0] _GEN_68 = io_isMret ? 2'h0 : _GEN_65; // @[csr.scala 409:38 412:37]
  wire [63:0] _GEN_69 = io_isMret ? sepc_data : _GEN_52; // @[csr.scala 179:34 409:38]
  wire  _GEN_70 = io_isMret ? scause_int : _GEN_53; // @[csr.scala 180:34 409:38]
  wire [62:0] _GEN_71 = io_isMret ? scause_code : _GEN_54; // @[csr.scala 180:34 409:38]
  wire [63:0] _GEN_72 = io_isMret ? stval_data : _GEN_55; // @[csr.scala 181:34 409:38]
  wire  _GEN_73 = io_isMret ? mstatus_spie : _GEN_56; // @[csr.scala 160:30 409:38]
  wire  _GEN_74 = io_isMret ? mstatus_sie : _GEN_57; // @[csr.scala 160:30 409:38]
  wire  _GEN_75 = io_isMret ? mstatus_spp : _GEN_58; // @[csr.scala 160:30 409:38]
  wire [63:0] _GEN_76 = io_isMret ? mepc_data : _GEN_59; // @[csr.scala 167:34 409:38]
  wire  _GEN_77 = io_isMret ? mcause_int : _GEN_60; // @[csr.scala 168:34 409:38]
  wire [62:0] _GEN_78 = io_isMret ? mcause_code : _GEN_61; // @[csr.scala 168:34 409:38]
  wire [63:0] _GEN_79 = io_isMret ? mtval_data : _GEN_62; // @[csr.scala 169:34 409:38]
  wire  _GEN_81 = io_isSret | _GEN_73; // @[csr.scala 405:32 407:38]
  wire  _GEN_123 = writeEn & _GEN_18; // @[csr.scala 366:18 382:35]
  assign io_flush_mask = hasInt | (io_isMret | io_isSret) & io_mw_enable ? 4'hf : _GEN_0; // @[csr.scala 317:67 318:31]
  assign io_r_data = _T_13 ? mcycle_data : _T_100; // @[Lookup.scala 34:39]
  assign io_excValue = _io_flush_mask_T_3 ? io_load_misalign_addr : _io_excValue_T_8; // @[csr.scala 331:27]
  assign io_trapVec = handIntS | handExcS ? trapVecS : trapVecM; // @[csr.scala 344:26]
  assign io_trap = _T_188 | _T_190; // @[csr.scala 438:37]
  always @(posedge clock) begin
    if (reset) begin // @[csr.scala 155:27]
      mode <= 2'h3; // @[csr.scala 155:27]
    end else if ((hasInt | hasExc) & ~writeEn) begin // @[csr.scala 359:27]
      if (hasInt) begin // @[csr.scala 356:27]
        if (handIntS) begin // @[csr.scala 352:26]
          mode <= 2'h1;
        end else begin
          mode <= 2'h3;
        end
      end else if (io_isSret) begin // @[csr.scala 357:44]
        mode <= sretMode;
      end else begin
        mode <= _trapMode_T;
      end
    end
    if (reset) begin // @[csr.scala 160:30]
      mstatus_sum <= 1'h0; // @[csr.scala 160:30]
    end else if (writeEn) begin // @[csr.scala 382:35]
      if (io_w_addr == 12'h300) begin // @[csr.scala 394:48]
        mstatus_sum <= tmp_1_sum; // @[csrFile.scala 235:11]
      end else if (io_w_addr == 12'h100) begin // @[csr.scala 383:48]
        mstatus_sum <= _T_167[18]; // @[csrFile.scala 235:11]
      end
    end
    if (reset) begin // @[csr.scala 160:30]
      mstatus_mpp <= 2'h0; // @[csr.scala 160:30]
    end else if (writeEn) begin // @[csr.scala 382:35]
      if (io_w_addr == 12'h300) begin // @[csr.scala 394:48]
        mstatus_mpp <= writeData[12:11]; // @[csrFile.scala 236:11]
      end else if (io_w_addr == 12'h100) begin // @[csr.scala 383:48]
        mstatus_mpp <= _T_167[12:11]; // @[csrFile.scala 236:11]
      end
    end else if (hasExc | hasInt | (io_isSret | io_isMret) & io_mw_enable) begin // @[csr.scala 404:98]
      if (!(io_isSret)) begin // @[csr.scala 405:32]
        mstatus_mpp <= _GEN_68;
      end
    end
    if (reset) begin // @[csr.scala 160:30]
      mstatus_spp <= 1'h0; // @[csr.scala 160:30]
    end else if (writeEn) begin // @[csr.scala 382:35]
      if (io_w_addr == 12'h300) begin // @[csr.scala 394:48]
        mstatus_spp <= tmp_1_spp; // @[csrFile.scala 237:11]
      end else if (io_w_addr == 12'h100) begin // @[csr.scala 383:48]
        mstatus_spp <= _T_167[8]; // @[csrFile.scala 237:11]
      end
    end else if (hasExc | hasInt | (io_isSret | io_isMret) & io_mw_enable) begin // @[csr.scala 404:98]
      if (io_isSret) begin // @[csr.scala 405:32]
        mstatus_spp <= 1'h0; // @[csr.scala 408:41]
      end else begin
        mstatus_spp <= _GEN_75;
      end
    end
    if (reset) begin // @[csr.scala 160:30]
      mstatus_mpie <= 1'h0; // @[csr.scala 160:30]
    end else if (writeEn) begin // @[csr.scala 382:35]
      if (io_w_addr == 12'h300) begin // @[csr.scala 394:48]
        mstatus_mpie <= writeData[7]; // @[csrFile.scala 238:11]
      end else if (io_w_addr == 12'h100) begin // @[csr.scala 383:48]
        mstatus_mpie <= _T_167[7]; // @[csrFile.scala 238:11]
      end
    end else if (hasExc | hasInt | (io_isSret | io_isMret) & io_mw_enable) begin // @[csr.scala 404:98]
      if (!(io_isSret)) begin // @[csr.scala 405:32]
        mstatus_mpie <= _GEN_67;
      end
    end
    if (reset) begin // @[csr.scala 160:30]
      mstatus_spie <= 1'h0; // @[csr.scala 160:30]
    end else if (writeEn) begin // @[csr.scala 382:35]
      if (io_w_addr == 12'h300) begin // @[csr.scala 394:48]
        mstatus_spie <= tmp_1_spie; // @[csrFile.scala 239:11]
      end else if (io_w_addr == 12'h100) begin // @[csr.scala 383:48]
        mstatus_spie <= _T_167[5]; // @[csrFile.scala 239:11]
      end
    end else if (hasExc | hasInt | (io_isSret | io_isMret) & io_mw_enable) begin // @[csr.scala 404:98]
      mstatus_spie <= _GEN_81;
    end
    if (reset) begin // @[csr.scala 160:30]
      mstatus_mie <= 1'h0; // @[csr.scala 160:30]
    end else if (writeEn) begin // @[csr.scala 382:35]
      if (io_w_addr == 12'h300) begin // @[csr.scala 394:48]
        mstatus_mie <= writeData[3]; // @[csrFile.scala 240:11]
      end else if (io_w_addr == 12'h100) begin // @[csr.scala 383:48]
        mstatus_mie <= _T_167[3]; // @[csrFile.scala 240:11]
      end
    end else if (hasExc | hasInt | (io_isSret | io_isMret) & io_mw_enable) begin // @[csr.scala 404:98]
      if (!(io_isSret)) begin // @[csr.scala 405:32]
        mstatus_mie <= _GEN_66;
      end
    end
    if (reset) begin // @[csr.scala 160:30]
      mstatus_sie <= 1'h0; // @[csr.scala 160:30]
    end else if (writeEn) begin // @[csr.scala 382:35]
      if (io_w_addr == 12'h300) begin // @[csr.scala 394:48]
        mstatus_sie <= tmp_1_sie; // @[csrFile.scala 241:11]
      end else if (io_w_addr == 12'h100) begin // @[csr.scala 383:48]
        mstatus_sie <= _T_167[1]; // @[csrFile.scala 241:11]
      end
    end else if (hasExc | hasInt | (io_isSret | io_isMret) & io_mw_enable) begin // @[csr.scala 404:98]
      if (io_isSret) begin // @[csr.scala 405:32]
        mstatus_sie <= mstatus_spie; // @[csr.scala 406:37]
      end else begin
        mstatus_sie <= _GEN_74;
      end
    end
    if (reset) begin // @[csr.scala 162:30]
      medeleg_data <= 64'h0; // @[csr.scala 162:30]
    end else if (writeEn) begin // @[csr.scala 382:35]
      if (io_w_addr == 12'h302) begin // @[csr.scala 395:48]
        medeleg_data <= {{48'd0}, _medeleg_data_T_5}; // @[csrFile.scala 270:11]
      end
    end
    if (reset) begin // @[csr.scala 163:30]
      mideleg_data <= 64'h0; // @[csr.scala 163:30]
    end else if (writeEn) begin // @[csr.scala 382:35]
      if (io_w_addr == 12'h303) begin // @[csr.scala 396:48]
        mideleg_data <= {{41'd0}, _mideleg_data_T_6}; // @[csrFile.scala 285:11]
      end
    end
    if (reset) begin // @[csr.scala 164:34]
      mie_meie <= 1'h0; // @[csr.scala 164:34]
    end else if (writeEn) begin // @[csr.scala 382:35]
      if (io_w_addr == 12'h304) begin // @[csr.scala 397:44]
        mie_meie <= writeData[11]; // @[csrFile.scala 311:11]
      end else if (io_w_addr == 12'h104) begin // @[csr.scala 384:44]
        mie_meie <= _T_169[11]; // @[csrFile.scala 311:11]
      end
    end
    if (reset) begin // @[csr.scala 164:34]
      mie_seie <= 1'h0; // @[csr.scala 164:34]
    end else if (writeEn) begin // @[csr.scala 382:35]
      if (io_w_addr == 12'h304) begin // @[csr.scala 397:44]
        mie_seie <= tmp_2_seie; // @[csrFile.scala 312:11]
      end else if (io_w_addr == 12'h104) begin // @[csr.scala 384:44]
        mie_seie <= _T_169[9]; // @[csrFile.scala 312:11]
      end
    end
    if (reset) begin // @[csr.scala 164:34]
      mie_mtie <= 1'h0; // @[csr.scala 164:34]
    end else if (writeEn) begin // @[csr.scala 382:35]
      if (io_w_addr == 12'h304) begin // @[csr.scala 397:44]
        mie_mtie <= writeData[7]; // @[csrFile.scala 313:11]
      end else if (io_w_addr == 12'h104) begin // @[csr.scala 384:44]
        mie_mtie <= _T_169[7]; // @[csrFile.scala 313:11]
      end
    end
    if (reset) begin // @[csr.scala 164:34]
      mie_stie <= 1'h0; // @[csr.scala 164:34]
    end else if (writeEn) begin // @[csr.scala 382:35]
      if (io_w_addr == 12'h304) begin // @[csr.scala 397:44]
        mie_stie <= tmp_1_spie; // @[csrFile.scala 314:11]
      end else if (io_w_addr == 12'h104) begin // @[csr.scala 384:44]
        mie_stie <= _T_169[5]; // @[csrFile.scala 314:11]
      end
    end
    if (reset) begin // @[csr.scala 164:34]
      mie_msie <= 1'h0; // @[csr.scala 164:34]
    end else if (writeEn) begin // @[csr.scala 382:35]
      if (io_w_addr == 12'h304) begin // @[csr.scala 397:44]
        mie_msie <= writeData[3]; // @[csrFile.scala 315:11]
      end else if (io_w_addr == 12'h104) begin // @[csr.scala 384:44]
        mie_msie <= _T_169[3]; // @[csrFile.scala 315:11]
      end
    end
    if (reset) begin // @[csr.scala 164:34]
      mie_ssie <= 1'h0; // @[csr.scala 164:34]
    end else if (writeEn) begin // @[csr.scala 382:35]
      if (io_w_addr == 12'h304) begin // @[csr.scala 397:44]
        mie_ssie <= tmp_1_sie; // @[csrFile.scala 316:11]
      end else if (io_w_addr == 12'h104) begin // @[csr.scala 384:44]
        mie_ssie <= _T_169[1]; // @[csrFile.scala 316:11]
      end
    end
    if (reset) begin // @[csr.scala 165:34]
      mtvec_base <= 62'h0; // @[csr.scala 165:34]
    end else if (writeEn) begin // @[csr.scala 382:35]
      if (io_w_addr == 12'h305) begin // @[csr.scala 398:46]
        mtvec_base <= writeData[63:2]; // @[csrFile.scala 362:11]
      end
    end
    if (reset) begin // @[csr.scala 165:34]
      mtvec_mode <= 2'h0; // @[csr.scala 165:34]
    end else if (writeEn) begin // @[csr.scala 382:35]
      if (io_w_addr == 12'h305) begin // @[csr.scala 398:46]
        mtvec_mode <= {{1'd0}, writeData[0]}; // @[csrFile.scala 363:11]
      end
    end
    if (reset) begin // @[csr.scala 166:30]
      mscratch_data <= 64'h0; // @[csr.scala 166:30]
    end else if (writeEn) begin // @[csr.scala 382:35]
      if (io_w_addr == 12'h340) begin // @[csr.scala 399:49]
        if (3'h5 == io_w_op) begin // @[Mux.scala 81:58]
          mscratch_data <= _writeData_T_2;
        end else begin
          mscratch_data <= _writeData_T_8;
        end
      end
    end
    if (reset) begin // @[csr.scala 167:34]
      mepc_data <= 64'h0; // @[csr.scala 167:34]
    end else if (writeEn) begin // @[csr.scala 382:35]
      if (io_w_addr == 12'h341) begin // @[csr.scala 400:45]
        mepc_data <= _sepc_data_T_1; // @[csrFile.scala 386:11]
      end
    end else if (hasExc | hasInt | (io_isSret | io_isMret) & io_mw_enable) begin // @[csr.scala 404:98]
      if (!(io_isSret)) begin // @[csr.scala 405:32]
        mepc_data <= _GEN_76;
      end
    end
    if (reset) begin // @[csr.scala 168:34]
      mcause_int <= 1'h0; // @[csr.scala 168:34]
    end else if (writeEn) begin // @[csr.scala 382:35]
      if (io_w_addr == 12'h342) begin // @[csr.scala 401:47]
        mcause_int <= writeData[63]; // @[csrFile.scala 401:11]
      end
    end else if (hasExc | hasInt | (io_isSret | io_isMret) & io_mw_enable) begin // @[csr.scala 404:98]
      if (!(io_isSret)) begin // @[csr.scala 405:32]
        mcause_int <= _GEN_77;
      end
    end
    if (reset) begin // @[csr.scala 168:34]
      mcause_code <= 63'h0; // @[csr.scala 168:34]
    end else if (writeEn) begin // @[csr.scala 382:35]
      if (io_w_addr == 12'h342) begin // @[csr.scala 401:47]
        mcause_code <= {{59'd0}, writeData[3:0]}; // @[csrFile.scala 402:11]
      end
    end else if (hasExc | hasInt | (io_isSret | io_isMret) & io_mw_enable) begin // @[csr.scala 404:98]
      if (!(io_isSret)) begin // @[csr.scala 405:32]
        mcause_code <= _GEN_78;
      end
    end
    if (reset) begin // @[csr.scala 169:34]
      mtval_data <= 64'h0; // @[csr.scala 169:34]
    end else if (writeEn) begin // @[csr.scala 382:35]
      if (io_w_addr == 12'h343) begin // @[csr.scala 402:46]
        if (3'h5 == io_w_op) begin // @[Mux.scala 81:58]
          mtval_data <= _writeData_T_2;
        end else begin
          mtval_data <= _writeData_T_8;
        end
      end
    end else if (hasExc | hasInt | (io_isSret | io_isMret) & io_mw_enable) begin // @[csr.scala 404:98]
      if (!(io_isSret)) begin // @[csr.scala 405:32]
        mtval_data <= _GEN_79;
      end
    end
    if (reset) begin // @[csr.scala 170:34]
      mip_meip <= 1'h0; // @[csr.scala 170:34]
    end else if (writeEn) begin // @[csr.scala 382:35]
      if (io_w_addr == 12'h144) begin // @[csr.scala 385:44]
        mip_meip <= _T_171[7]; // @[csrFile.scala 344:15]
      end
    end
    if (reset) begin // @[csr.scala 170:34]
      mip_seip <= 1'h0; // @[csr.scala 170:34]
    end else if (writeEn) begin // @[csr.scala 382:35]
      if (io_w_addr == 12'h144) begin // @[csr.scala 385:44]
        mip_seip <= _T_171[9]; // @[csrFile.scala 343:11]
      end
    end
    if (reset) begin // @[csr.scala 170:34]
      mip_stip <= 1'h0; // @[csr.scala 170:34]
    end else begin
      mip_stip <= _GEN_123;
    end
    if (reset) begin // @[csr.scala 170:34]
      mip_msip <= 1'h0; // @[csr.scala 170:34]
    end else if (writeEn) begin // @[csr.scala 382:35]
      if (io_w_addr == 12'h144) begin // @[csr.scala 385:44]
        mip_msip <= _T_171[3]; // @[csrFile.scala 346:15]
      end
    end
    if (reset) begin // @[csr.scala 170:34]
      mip_ssip <= 1'h0; // @[csr.scala 170:34]
    end else if (writeEn) begin // @[csr.scala 382:35]
      if (io_w_addr == 12'h144) begin // @[csr.scala 385:44]
        mip_ssip <= _T_171[1]; // @[csrFile.scala 347:11]
      end
    end
    if (reset) begin // @[csr.scala 172:34]
      mcycle_data <= 64'h0; // @[csr.scala 172:34]
    end else if (writeEn) begin // @[csr.scala 382:35]
      if (io_w_addr == 12'hb00) begin // @[csr.scala 386:47]
        if (3'h5 == io_w_op) begin // @[Mux.scala 81:58]
          mcycle_data <= _writeData_T_2;
        end else begin
          mcycle_data <= _writeData_T_8;
        end
      end else begin
        mcycle_data <= _mcycle_data_T_1; // @[csr.scala 375:21]
      end
    end else begin
      mcycle_data <= _mcycle_data_T_1; // @[csr.scala 375:21]
    end
    if (reset) begin // @[csr.scala 173:30]
      minstret_data <= 64'h0; // @[csr.scala 173:30]
    end else if (writeEn) begin // @[csr.scala 382:35]
      if (io_w_addr == 12'hb02) begin // @[csr.scala 387:49]
        if (3'h5 == io_w_op) begin // @[Mux.scala 81:58]
          minstret_data <= _writeData_T_2;
        end else begin
          minstret_data <= _writeData_T_8;
        end
      end else begin
        minstret_data <= _GEN_2;
      end
    end else begin
      minstret_data <= _GEN_2;
    end
    if (reset) begin // @[csr.scala 177:34]
      stvec_base <= 62'h0; // @[csr.scala 177:34]
    end else if (writeEn) begin // @[csr.scala 382:35]
      if (io_w_addr == 12'h105) begin // @[csr.scala 388:46]
        stvec_base <= writeData[63:2]; // @[csrFile.scala 133:22]
      end
    end
    if (reset) begin // @[csr.scala 177:34]
      stvec_mode <= 2'h0; // @[csr.scala 177:34]
    end else if (writeEn) begin // @[csr.scala 382:35]
      if (io_w_addr == 12'h105) begin // @[csr.scala 388:46]
        stvec_mode <= {{1'd0}, writeData[0]}; // @[csrFile.scala 134:22]
      end
    end
    if (reset) begin // @[csr.scala 178:30]
      sscratch_data <= 64'h0; // @[csr.scala 178:30]
    end else if (writeEn) begin // @[csr.scala 382:35]
      if (io_w_addr == 12'h140) begin // @[csr.scala 389:49]
        if (3'h5 == io_w_op) begin // @[Mux.scala 81:58]
          sscratch_data <= _writeData_T_2;
        end else begin
          sscratch_data <= _writeData_T_8;
        end
      end
    end
    if (reset) begin // @[csr.scala 179:34]
      sepc_data <= 64'h0; // @[csr.scala 179:34]
    end else if (writeEn) begin // @[csr.scala 382:35]
      if (io_w_addr == 12'h141) begin // @[csr.scala 390:45]
        sepc_data <= _sepc_data_T_1; // @[csrFile.scala 154:22]
      end
    end else if (hasExc | hasInt | (io_isSret | io_isMret) & io_mw_enable) begin // @[csr.scala 404:98]
      if (!(io_isSret)) begin // @[csr.scala 405:32]
        sepc_data <= _GEN_69;
      end
    end
    if (reset) begin // @[csr.scala 180:34]
      scause_int <= 1'h0; // @[csr.scala 180:34]
    end else if (writeEn) begin // @[csr.scala 382:35]
      if (io_w_addr == 12'h142) begin // @[csr.scala 391:47]
        scause_int <= writeData[63]; // @[csrFile.scala 169:11]
      end
    end else if (hasExc | hasInt | (io_isSret | io_isMret) & io_mw_enable) begin // @[csr.scala 404:98]
      if (!(io_isSret)) begin // @[csr.scala 405:32]
        scause_int <= _GEN_70;
      end
    end
    if (reset) begin // @[csr.scala 180:34]
      scause_code <= 63'h0; // @[csr.scala 180:34]
    end else if (writeEn) begin // @[csr.scala 382:35]
      if (io_w_addr == 12'h142) begin // @[csr.scala 391:47]
        scause_code <= {{59'd0}, writeData[3:0]}; // @[csrFile.scala 170:11]
      end
    end else if (hasExc | hasInt | (io_isSret | io_isMret) & io_mw_enable) begin // @[csr.scala 404:98]
      if (!(io_isSret)) begin // @[csr.scala 405:32]
        scause_code <= _GEN_71;
      end
    end
    if (reset) begin // @[csr.scala 181:34]
      stval_data <= 64'h0; // @[csr.scala 181:34]
    end else if (writeEn) begin // @[csr.scala 382:35]
      if (io_w_addr == 12'h143) begin // @[csr.scala 392:46]
        if (3'h5 == io_w_op) begin // @[Mux.scala 81:58]
          stval_data <= _writeData_T_2;
        end else begin
          stval_data <= _writeData_T_8;
        end
      end
    end else if (hasExc | hasInt | (io_isSret | io_isMret) & io_mw_enable) begin // @[csr.scala 404:98]
      if (!(io_isSret)) begin // @[csr.scala 405:32]
        stval_data <= _GEN_72;
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
  _RAND_0 = {1{`RANDOM}};
  mode = _RAND_0[1:0];
  _RAND_1 = {1{`RANDOM}};
  mstatus_sum = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  mstatus_mpp = _RAND_2[1:0];
  _RAND_3 = {1{`RANDOM}};
  mstatus_spp = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  mstatus_mpie = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  mstatus_spie = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  mstatus_mie = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  mstatus_sie = _RAND_7[0:0];
  _RAND_8 = {2{`RANDOM}};
  medeleg_data = _RAND_8[63:0];
  _RAND_9 = {2{`RANDOM}};
  mideleg_data = _RAND_9[63:0];
  _RAND_10 = {1{`RANDOM}};
  mie_meie = _RAND_10[0:0];
  _RAND_11 = {1{`RANDOM}};
  mie_seie = _RAND_11[0:0];
  _RAND_12 = {1{`RANDOM}};
  mie_mtie = _RAND_12[0:0];
  _RAND_13 = {1{`RANDOM}};
  mie_stie = _RAND_13[0:0];
  _RAND_14 = {1{`RANDOM}};
  mie_msie = _RAND_14[0:0];
  _RAND_15 = {1{`RANDOM}};
  mie_ssie = _RAND_15[0:0];
  _RAND_16 = {2{`RANDOM}};
  mtvec_base = _RAND_16[61:0];
  _RAND_17 = {1{`RANDOM}};
  mtvec_mode = _RAND_17[1:0];
  _RAND_18 = {2{`RANDOM}};
  mscratch_data = _RAND_18[63:0];
  _RAND_19 = {2{`RANDOM}};
  mepc_data = _RAND_19[63:0];
  _RAND_20 = {1{`RANDOM}};
  mcause_int = _RAND_20[0:0];
  _RAND_21 = {2{`RANDOM}};
  mcause_code = _RAND_21[62:0];
  _RAND_22 = {2{`RANDOM}};
  mtval_data = _RAND_22[63:0];
  _RAND_23 = {1{`RANDOM}};
  mip_meip = _RAND_23[0:0];
  _RAND_24 = {1{`RANDOM}};
  mip_seip = _RAND_24[0:0];
  _RAND_25 = {1{`RANDOM}};
  mip_stip = _RAND_25[0:0];
  _RAND_26 = {1{`RANDOM}};
  mip_msip = _RAND_26[0:0];
  _RAND_27 = {1{`RANDOM}};
  mip_ssip = _RAND_27[0:0];
  _RAND_28 = {2{`RANDOM}};
  mcycle_data = _RAND_28[63:0];
  _RAND_29 = {2{`RANDOM}};
  minstret_data = _RAND_29[63:0];
  _RAND_30 = {2{`RANDOM}};
  stvec_base = _RAND_30[61:0];
  _RAND_31 = {1{`RANDOM}};
  stvec_mode = _RAND_31[1:0];
  _RAND_32 = {2{`RANDOM}};
  sscratch_data = _RAND_32[63:0];
  _RAND_33 = {2{`RANDOM}};
  sepc_data = _RAND_33[63:0];
  _RAND_34 = {1{`RANDOM}};
  scause_int = _RAND_34[0:0];
  _RAND_35 = {2{`RANDOM}};
  scause_code = _RAND_35[62:0];
  _RAND_36 = {2{`RANDOM}};
  stval_data = _RAND_36[63:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module Datapath(
  input         clock,
  input         reset,
  output [31:0] io_ctrl_inst,
  input  [1:0]  io_ctrl_pc_sel,
  input         io_ctrl_A_sel,
  input         io_ctrl_B_sel,
  input  [1:0]  io_ctrl_wd_type,
  input  [2:0]  io_ctrl_imm_sel,
  input  [2:0]  io_ctrl_br_type,
  input  [2:0]  io_ctrl_st_type,
  input  [2:0]  io_ctrl_ld_type,
  input  [1:0]  io_ctrl_wb_sel,
  input         io_ctrl_wb_en,
  input  [3:0]  io_ctrl_alu_op,
  input         io_ctrl_prv,
  input  [2:0]  io_ctrl_csr_cmd,
  input         io_ctrl_is_illegal,
  input         io_ctrl_is_kill,
  output [63:0] io_pc,
  output [31:0] io_inst,
  output        io_start
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [63:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [63:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [63:0] _RAND_6;
  reg [63:0] _RAND_7;
  reg [63:0] _RAND_8;
  reg [63:0] _RAND_9;
  reg [63:0] _RAND_10;
  reg [63:0] _RAND_11;
  reg [31:0] _RAND_12;
  reg [31:0] _RAND_13;
  reg [63:0] _RAND_14;
  reg [31:0] _RAND_15;
  reg [31:0] _RAND_16;
  reg [31:0] _RAND_17;
  reg [31:0] _RAND_18;
  reg [31:0] _RAND_19;
  reg [31:0] _RAND_20;
  reg [31:0] _RAND_21;
  reg [31:0] _RAND_22;
  reg [31:0] _RAND_23;
  reg [31:0] _RAND_24;
  reg [31:0] _RAND_25;
  reg [63:0] _RAND_26;
  reg [63:0] _RAND_27;
  reg [31:0] _RAND_28;
  reg [31:0] _RAND_29;
  reg [63:0] _RAND_30;
  reg [31:0] _RAND_31;
  reg [31:0] _RAND_32;
  reg [31:0] _RAND_33;
  reg [31:0] _RAND_34;
  reg [63:0] _RAND_35;
  reg [31:0] _RAND_36;
  reg [31:0] _RAND_37;
  reg [63:0] _RAND_38;
  reg [63:0] _RAND_39;
  reg [31:0] _RAND_40;
  reg [63:0] _RAND_41;
  reg [31:0] _RAND_42;
  reg [31:0] _RAND_43;
  reg [63:0] _RAND_44;
  reg [31:0] _RAND_45;
  reg [31:0] _RAND_46;
  reg [63:0] _RAND_47;
  reg [31:0] _RAND_48;
  reg [31:0] _RAND_49;
  reg [31:0] _RAND_50;
  reg [95:0] _RAND_51;
`endif // RANDOMIZE_REG_INIT
  wire [63:0] alu_io_A; // @[datapath.scala 226:25]
  wire [63:0] alu_io_B; // @[datapath.scala 226:25]
  wire [1:0] alu_io_width_type; // @[datapath.scala 226:25]
  wire [3:0] alu_io_alu_op; // @[datapath.scala 226:25]
  wire [63:0] alu_io_out; // @[datapath.scala 226:25]
  wire [63:0] alu_io_sum; // @[datapath.scala 226:25]
  wire [31:0] immGen_io_inst; // @[datapath.scala 227:28]
  wire [2:0] immGen_io_sel; // @[datapath.scala 227:28]
  wire [63:0] immGen_io_out; // @[datapath.scala 227:28]
  wire [63:0] brCond_io_rs1; // @[datapath.scala 228:28]
  wire [63:0] brCond_io_rs2; // @[datapath.scala 228:28]
  wire [2:0] brCond_io_br_type; // @[datapath.scala 228:28]
  wire  brCond_io_taken; // @[datapath.scala 228:28]
  wire  regFile_clock; // @[datapath.scala 229:29]
  wire  regFile_reset; // @[datapath.scala 229:29]
  wire  regFile_io_wen; // @[datapath.scala 229:29]
  wire [4:0] regFile_io_waddr; // @[datapath.scala 229:29]
  wire [63:0] regFile_io_wdata; // @[datapath.scala 229:29]
  wire [4:0] regFile_io_raddr_0; // @[datapath.scala 229:29]
  wire [4:0] regFile_io_raddr_1; // @[datapath.scala 229:29]
  wire [63:0] regFile_io_rdata_0; // @[datapath.scala 229:29]
  wire [63:0] regFile_io_rdata_1; // @[datapath.scala 229:29]
  wire [63:0] regFile_io_rdata_4; // @[datapath.scala 229:29]
  wire [63:0] regFile_io_rdata_5; // @[datapath.scala 229:29]
  wire [63:0] regFile_io_rdata_6; // @[datapath.scala 229:29]
  wire [63:0] regFile_io_rdata_7; // @[datapath.scala 229:29]
  wire [63:0] regFile_io_rdata_8; // @[datapath.scala 229:29]
  wire [63:0] regFile_io_rdata_9; // @[datapath.scala 229:29]
  wire [63:0] regFile_io_rdata_10; // @[datapath.scala 229:29]
  wire [63:0] regFile_io_rdata_11; // @[datapath.scala 229:29]
  wire [63:0] regFile_io_rdata_12; // @[datapath.scala 229:29]
  wire [63:0] regFile_io_rdata_13; // @[datapath.scala 229:29]
  wire [63:0] regFile_io_rdata_14; // @[datapath.scala 229:29]
  wire [63:0] regFile_io_rdata_15; // @[datapath.scala 229:29]
  wire [63:0] regFile_io_rdata_16; // @[datapath.scala 229:29]
  wire [63:0] regFile_io_rdata_17; // @[datapath.scala 229:29]
  wire [63:0] regFile_io_rdata_18; // @[datapath.scala 229:29]
  wire [63:0] regFile_io_rdata_19; // @[datapath.scala 229:29]
  wire [63:0] regFile_io_rdata_20; // @[datapath.scala 229:29]
  wire [63:0] regFile_io_rdata_21; // @[datapath.scala 229:29]
  wire [63:0] regFile_io_rdata_22; // @[datapath.scala 229:29]
  wire [63:0] regFile_io_rdata_23; // @[datapath.scala 229:29]
  wire [63:0] regFile_io_rdata_24; // @[datapath.scala 229:29]
  wire [63:0] regFile_io_rdata_25; // @[datapath.scala 229:29]
  wire [63:0] regFile_io_rdata_26; // @[datapath.scala 229:29]
  wire [63:0] regFile_io_rdata_27; // @[datapath.scala 229:29]
  wire [63:0] regFile_io_rdata_28; // @[datapath.scala 229:29]
  wire [63:0] regFile_io_rdata_29; // @[datapath.scala 229:29]
  wire [63:0] regFile_io_rdata_30; // @[datapath.scala 229:29]
  wire [63:0] regFile_io_rdata_31; // @[datapath.scala 229:29]
  wire [63:0] regFile_io_rdata_32; // @[datapath.scala 229:29]
  wire [63:0] regFile_io_rdata_33; // @[datapath.scala 229:29]
  wire [63:0] regFile_io_rdata_34; // @[datapath.scala 229:29]
  wire  imem_clock; // @[datapath.scala 230:26]
  wire  imem_reset; // @[datapath.scala 230:26]
  wire [63:0] imem_pc_addr; // @[datapath.scala 230:26]
  wire [63:0] imem_pc_data; // @[datapath.scala 230:26]
  wire [63:0] imem_addr; // @[datapath.scala 230:26]
  wire [63:0] imem_wdata; // @[datapath.scala 230:26]
  wire [7:0] imem_mask; // @[datapath.scala 230:26]
  wire [63:0] imem_rdata; // @[datapath.scala 230:26]
  wire  imem_enable; // @[datapath.scala 230:26]
  wire  imem_wen; // @[datapath.scala 230:26]
  wire  dmem_clock; // @[datapath.scala 231:26]
  wire  dmem_reset; // @[datapath.scala 231:26]
  wire [63:0] dmem_pc_addr; // @[datapath.scala 231:26]
  wire [63:0] dmem_pc_data; // @[datapath.scala 231:26]
  wire [63:0] dmem_addr; // @[datapath.scala 231:26]
  wire [63:0] dmem_wdata; // @[datapath.scala 231:26]
  wire [7:0] dmem_mask; // @[datapath.scala 231:26]
  wire [63:0] dmem_rdata; // @[datapath.scala 231:26]
  wire  dmem_enable; // @[datapath.scala 231:26]
  wire  dmem_wen; // @[datapath.scala 231:26]
  wire  csr_clock; // @[datapath.scala 232:25]
  wire  csr_reset; // @[datapath.scala 232:25]
  wire [3:0] csr_io_flush_mask; // @[datapath.scala 232:25]
  wire [2:0] csr_io_r_op; // @[datapath.scala 232:25]
  wire [11:0] csr_io_r_addr; // @[datapath.scala 232:25]
  wire [63:0] csr_io_r_data; // @[datapath.scala 232:25]
  wire [2:0] csr_io_w_op; // @[datapath.scala 232:25]
  wire [11:0] csr_io_w_addr; // @[datapath.scala 232:25]
  wire [63:0] csr_io_w_data; // @[datapath.scala 232:25]
  wire  csr_io_retired; // @[datapath.scala 232:25]
  wire [31:0] csr_io_inst; // @[datapath.scala 232:25]
  wire [31:0] csr_io_illegal_inst; // @[datapath.scala 232:25]
  wire [1:0] csr_io_inst_mode; // @[datapath.scala 232:25]
  wire  csr_io_fetch_misalign; // @[datapath.scala 232:25]
  wire  csr_io_load_misalign; // @[datapath.scala 232:25]
  wire  csr_io_store_misalign; // @[datapath.scala 232:25]
  wire  csr_io_isSret; // @[datapath.scala 232:25]
  wire  csr_io_isMret; // @[datapath.scala 232:25]
  wire [63:0] csr_io_pc_fetch_misalign; // @[datapath.scala 232:25]
  wire [63:0] csr_io_load_misalign_addr; // @[datapath.scala 232:25]
  wire [63:0] csr_io_store_misalign_addr; // @[datapath.scala 232:25]
  wire [63:0] csr_io_ebreak_addr; // @[datapath.scala 232:25]
  wire [63:0] csr_io_excPC; // @[datapath.scala 232:25]
  wire [63:0] csr_io_excValue; // @[datapath.scala 232:25]
  wire [63:0] csr_io_trapVec; // @[datapath.scala 232:25]
  wire  csr_io_trap; // @[datapath.scala 232:25]
  wire  csr_io_fd_enable; // @[datapath.scala 232:25]
  wire  csr_io_de_enable; // @[datapath.scala 232:25]
  wire  csr_io_mw_enable; // @[datapath.scala 232:25]
  wire  gpr_ptr_clock; // @[datapath.scala 235:29]
  wire  gpr_ptr_reset; // @[datapath.scala 235:29]
  wire [63:0] gpr_ptr_regfile_0; // @[datapath.scala 235:29]
  wire [63:0] gpr_ptr_regfile_1; // @[datapath.scala 235:29]
  wire [63:0] gpr_ptr_regfile_2; // @[datapath.scala 235:29]
  wire [63:0] gpr_ptr_regfile_3; // @[datapath.scala 235:29]
  wire [63:0] gpr_ptr_regfile_4; // @[datapath.scala 235:29]
  wire [63:0] gpr_ptr_regfile_5; // @[datapath.scala 235:29]
  wire [63:0] gpr_ptr_regfile_6; // @[datapath.scala 235:29]
  wire [63:0] gpr_ptr_regfile_7; // @[datapath.scala 235:29]
  wire [63:0] gpr_ptr_regfile_8; // @[datapath.scala 235:29]
  wire [63:0] gpr_ptr_regfile_9; // @[datapath.scala 235:29]
  wire [63:0] gpr_ptr_regfile_10; // @[datapath.scala 235:29]
  wire [63:0] gpr_ptr_regfile_11; // @[datapath.scala 235:29]
  wire [63:0] gpr_ptr_regfile_12; // @[datapath.scala 235:29]
  wire [63:0] gpr_ptr_regfile_13; // @[datapath.scala 235:29]
  wire [63:0] gpr_ptr_regfile_14; // @[datapath.scala 235:29]
  wire [63:0] gpr_ptr_regfile_15; // @[datapath.scala 235:29]
  wire [63:0] gpr_ptr_regfile_16; // @[datapath.scala 235:29]
  wire [63:0] gpr_ptr_regfile_17; // @[datapath.scala 235:29]
  wire [63:0] gpr_ptr_regfile_18; // @[datapath.scala 235:29]
  wire [63:0] gpr_ptr_regfile_19; // @[datapath.scala 235:29]
  wire [63:0] gpr_ptr_regfile_20; // @[datapath.scala 235:29]
  wire [63:0] gpr_ptr_regfile_21; // @[datapath.scala 235:29]
  wire [63:0] gpr_ptr_regfile_22; // @[datapath.scala 235:29]
  wire [63:0] gpr_ptr_regfile_23; // @[datapath.scala 235:29]
  wire [63:0] gpr_ptr_regfile_24; // @[datapath.scala 235:29]
  wire [63:0] gpr_ptr_regfile_25; // @[datapath.scala 235:29]
  wire [63:0] gpr_ptr_regfile_26; // @[datapath.scala 235:29]
  wire [63:0] gpr_ptr_regfile_27; // @[datapath.scala 235:29]
  wire [63:0] gpr_ptr_regfile_28; // @[datapath.scala 235:29]
  wire [63:0] gpr_ptr_regfile_29; // @[datapath.scala 235:29]
  wire [63:0] gpr_ptr_regfile_30; // @[datapath.scala 235:29]
  wire [63:0] gpr_ptr_regfile_31; // @[datapath.scala 235:29]
  reg [31:0] fd_pipe_reg_inst; // @[datapath.scala 147:34]
  reg [63:0] fd_pipe_reg_pc; // @[datapath.scala 147:34]
  reg  fd_pipe_reg_enable; // @[datapath.scala 147:34]
  reg [3:0] de_pipe_reg_alu_op; // @[datapath.scala 156:34]
  reg [63:0] de_pipe_reg_pc; // @[datapath.scala 156:34]
  reg [31:0] de_pipe_reg_inst; // @[datapath.scala 156:34]
  reg [63:0] de_pipe_reg_imm; // @[datapath.scala 156:34]
  reg [63:0] de_pipe_reg_rs1; // @[datapath.scala 156:34]
  reg [63:0] de_pipe_reg_src1_addr; // @[datapath.scala 156:34]
  reg [63:0] de_pipe_reg_rs2; // @[datapath.scala 156:34]
  reg [63:0] de_pipe_reg_src2_addr; // @[datapath.scala 156:34]
  reg [63:0] de_pipe_reg_csr_read_data; // @[datapath.scala 156:34]
  reg [2:0] de_pipe_reg_csr_write_op; // @[datapath.scala 156:34]
  reg [11:0] de_pipe_reg_csr_write_addr; // @[datapath.scala 156:34]
  reg [63:0] de_pipe_reg_csr_write_data; // @[datapath.scala 156:34]
  reg [4:0] de_pipe_reg_dest; // @[datapath.scala 156:34]
  reg  de_pipe_reg_A_sel; // @[datapath.scala 156:34]
  reg  de_pipe_reg_B_sel; // @[datapath.scala 156:34]
  reg [1:0] de_pipe_reg_pc_sel; // @[datapath.scala 156:34]
  reg [2:0] de_pipe_reg_br_type; // @[datapath.scala 156:34]
  reg [1:0] de_pipe_reg_wd_type; // @[datapath.scala 156:34]
  reg [2:0] de_pipe_reg_st_type; // @[datapath.scala 156:34]
  reg [2:0] de_pipe_reg_ld_type; // @[datapath.scala 156:34]
  reg [1:0] de_pipe_reg_wb_sel; // @[datapath.scala 156:34]
  reg  de_pipe_reg_wb_en; // @[datapath.scala 156:34]
  reg  de_pipe_reg_enable; // @[datapath.scala 156:34]
  reg [63:0] em_pipe_reg_alu_out; // @[datapath.scala 185:34]
  reg [63:0] em_pipe_reg_csr_read_data; // @[datapath.scala 185:34]
  reg [2:0] em_pipe_reg_csr_write_op; // @[datapath.scala 185:34]
  reg [11:0] em_pipe_reg_csr_write_addr; // @[datapath.scala 185:34]
  reg [63:0] em_pipe_reg_csr_write_data; // @[datapath.scala 185:34]
  reg [2:0] em_pipe_reg_ld_type; // @[datapath.scala 185:34]
  reg [1:0] em_pipe_reg_wb_sel; // @[datapath.scala 185:34]
  reg  em_pipe_reg_wb_en; // @[datapath.scala 185:34]
  reg [4:0] em_pipe_reg_dest; // @[datapath.scala 185:34]
  reg [63:0] em_pipe_reg_pc; // @[datapath.scala 185:34]
  reg [31:0] em_pipe_reg_inst; // @[datapath.scala 185:34]
  reg  em_pipe_reg_enable; // @[datapath.scala 185:34]
  reg [63:0] mw_pipe_reg_load_data; // @[datapath.scala 206:34]
  reg [63:0] mw_pipe_reg_alu_out; // @[datapath.scala 206:34]
  reg [4:0] mw_pipe_reg_dest; // @[datapath.scala 206:34]
  reg [63:0] mw_pipe_reg_csr_read_data; // @[datapath.scala 206:34]
  reg [2:0] mw_pipe_reg_csr_write_op; // @[datapath.scala 206:34]
  reg [11:0] mw_pipe_reg_csr_write_addr; // @[datapath.scala 206:34]
  reg [63:0] mw_pipe_reg_csr_write_data; // @[datapath.scala 206:34]
  reg [1:0] mw_pipe_reg_wb_sel; // @[datapath.scala 206:34]
  reg  mw_pipe_reg_wb_en; // @[datapath.scala 206:34]
  reg [63:0] mw_pipe_reg_pc; // @[datapath.scala 206:34]
  reg [31:0] mw_pipe_reg_inst; // @[datapath.scala 206:34]
  reg  mw_pipe_reg_enable; // @[datapath.scala 206:34]
  wire  _csr_atomic_flush_T_7 = fd_pipe_reg_enable & io_ctrl_csr_cmd != 3'h0; // @[datapath.scala 270:96]
  wire [1:0] _csr_atomic_flush_T_9 = de_pipe_reg_enable & de_pipe_reg_csr_write_op != 3'h0 ? 2'h3 : {{1'd0},
    _csr_atomic_flush_T_7}; // @[datapath.scala 269:68]
  wire [2:0] _csr_atomic_flush_T_10 = em_pipe_reg_enable & em_pipe_reg_csr_write_op != 3'h0 ? 3'h7 : {{1'd0},
    _csr_atomic_flush_T_9}; // @[datapath.scala 268:60]
  wire [3:0] csr_atomic_flush = mw_pipe_reg_enable & mw_pipe_reg_csr_write_op != 3'h0 ? 4'hf : {{1'd0},
    _csr_atomic_flush_T_10}; // @[datapath.scala 267:32]
  wire  brCond_taken = brCond_io_taken & de_pipe_reg_enable; // @[datapath.scala 545:41]
  wire  _jmp_occur_T = de_pipe_reg_pc_sel == 2'h1; // @[datapath.scala 530:64]
  wire  jmp_occur = de_pipe_reg_enable & de_pipe_reg_pc_sel == 2'h1; // @[datapath.scala 530:41]
  wire  flush_fd = csr_io_flush_mask[0] | brCond_taken | jmp_occur | csr_atomic_flush[0]; // @[datapath.scala 275:70]
  wire  flush_de = csr_io_flush_mask[1] | brCond_taken | jmp_occur | csr_atomic_flush[1]; // @[datapath.scala 276:78]
  wire  flush_em = csr_io_flush_mask[2] | csr_atomic_flush[2]; // @[datapath.scala 277:49]
  wire  flush_mw = csr_io_flush_mask[3] | csr_atomic_flush[3]; // @[datapath.scala 278:45]
  reg  started; // @[datapath.scala 282:30]
  wire  csr_atomic = |csr_atomic_flush; // @[datapath.scala 289:40]
  wire [63:0] _pc_T_1 = 64'h80000000 - 64'h4; // @[datapath.scala 294:46]
  reg [64:0] pc; // @[datapath.scala 294:25]
  wire [64:0] _next_pc_T_1 = pc + 65'h4; // @[datapath.scala 296:20]
  wire  _next_pc_T_4 = _jmp_occur_T & de_pipe_reg_enable | brCond_taken; // @[datapath.scala 301:73]
  wire [63:0] jump_addr = alu_io_out; // @[datapath.scala 234:29 535:19]
  wire [63:0] _next_pc_T_5 = {{1'd0}, jump_addr[63:1]}; // @[datapath.scala 301:103]
  wire [64:0] _next_pc_T_6 = {_next_pc_T_5, 1'h0}; // @[datapath.scala 301:110]
  wire [64:0] _next_pc_T_7 = _next_pc_T_4 ? _next_pc_T_6 : _next_pc_T_1; // @[Mux.scala 101:16]
  wire [64:0] _next_pc_T_8 = csr_atomic ? pc : _next_pc_T_7; // @[Mux.scala 101:16]
  wire [64:0] next_pc = csr_io_trap ? {{1'd0}, csr_io_trapVec} : _next_pc_T_8; // @[Mux.scala 101:16]
  wire  is_kill_inst = io_ctrl_is_kill & fd_pipe_reg_enable; // @[datapath.scala 336:41]
  wire [31:0] _inst_T_7 = pc[2] ? imem_rdata[63:32] : imem_rdata[31:0]; // @[datapath.scala 308:101]
  wire [31:0] inst = started | is_kill_inst | brCond_taken | csr_io_trap ? 32'h13 : _inst_T_7; // @[datapath.scala 308:23]
  wire [64:0] _GEN_3 = flush_fd ? 65'h80000000 : pc; // @[datapath.scala 318:23 319:32]
  wire [4:0] src1_addr = fd_pipe_reg_inst[19:15]; // @[datapath.scala 339:41]
  wire [4:0] src2_addr = fd_pipe_reg_inst[24:20]; // @[datapath.scala 340:41]
  wire [4:0] dest_addr = fd_pipe_reg_inst[11:7]; // @[datapath.scala 341:41]
  wire  _csr_op_T = io_ctrl_csr_cmd == 3'h1; // @[datapath.scala 363:58]
  wire  _csr_op_T_1 = dest_addr == 5'h0; // @[datapath.scala 363:84]
  wire  _csr_op_T_2 = io_ctrl_csr_cmd == 3'h1 & dest_addr == 5'h0; // @[datapath.scala 363:70]
  wire  _csr_op_T_4 = io_ctrl_csr_cmd == 3'h3; // @[datapath.scala 365:70]
  wire  _csr_op_T_8 = io_ctrl_csr_cmd == 3'h2; // @[datapath.scala 367:86]
  wire [2:0] _csr_op_T_12 = _csr_op_T_8 ? 3'h4 : 3'h0; // @[datapath.scala 368:76]
  wire [2:0] _csr_op_T_13 = io_ctrl_csr_cmd == 3'h2 & _csr_op_T_1 ? 3'h1 : _csr_op_T_12; // @[datapath.scala 367:68]
  wire [2:0] _csr_op_T_14 = _csr_op_T_4 ? 3'h5 : _csr_op_T_13; // @[datapath.scala 366:60]
  wire [2:0] _csr_op_T_15 = io_ctrl_csr_cmd == 3'h3 & _csr_op_T_1 ? 3'h1 : _csr_op_T_14; // @[datapath.scala 365:52]
  wire [2:0] _csr_op_T_16 = _csr_op_T ? 3'h3 : _csr_op_T_15; // @[datapath.scala 364:44]
  wire [63:0] _csr_io_fetch_misalign_T = de_pipe_reg_pc & 64'h3; // @[datapath.scala 383:50]
  wire [4:0] csr_write_addr = inst[11:7]; // @[datapath.scala 389:34]
  wire  _de_pipe_reg_rs1_T_5 = mw_pipe_reg_wb_sel == 2'h0; // @[datapath.scala 430:80]
  wire  _de_pipe_reg_rs1_T_6 = mw_pipe_reg_wb_sel == 2'h2; // @[datapath.scala 431:88]
  wire [63:0] _de_pipe_reg_rs1_T_8 = mw_pipe_reg_pc + 64'h4; // @[datapath.scala 431:115]
  wire  _de_pipe_reg_rs1_T_9 = mw_pipe_reg_wb_sel == 2'h3; // @[datapath.scala 432:96]
  wire [63:0] _de_pipe_reg_rs1_T_10 = mw_pipe_reg_wb_sel == 2'h3 ? mw_pipe_reg_csr_read_data : mw_pipe_reg_load_data; // @[datapath.scala 432:76]
  wire [63:0] _de_pipe_reg_rs1_T_11 = mw_pipe_reg_wb_sel == 2'h2 ? _de_pipe_reg_rs1_T_8 : _de_pipe_reg_rs1_T_10; // @[datapath.scala 431:68]
  wire [63:0] _de_pipe_reg_rs1_T_12 = mw_pipe_reg_wb_sel == 2'h0 ? mw_pipe_reg_alu_out : _de_pipe_reg_rs1_T_11; // @[datapath.scala 430:60]
  wire [63:0] _GEN_10 = csr_io_r_data; // @[datapath.scala 418:27 156:34 423:43]
  wire [63:0] _GEN_12 = regFile_io_rdata_1; // @[datapath.scala 418:27 156:34 425:44]
  wire [11:0] _GEN_13 = {{7'd0}, csr_write_addr}; // @[datapath.scala 418:27 156:34 426:44]
  wire [63:0] _GEN_15 = immGen_io_out; // @[datapath.scala 418:27 428:33 156:34]
  wire [63:0] _GEN_17 = {{59'd0}, src1_addr}; // @[datapath.scala 418:27 156:34 433:39]
  wire [63:0] _GEN_19 = {{59'd0}, src2_addr}; // @[datapath.scala 418:27 156:34 438:39]
  wire [63:0] _load_data_hazard_T = em_pipe_reg_alu_out & 64'h7; // @[datapath.scala 463:70]
  wire [66:0] _load_data_hazard_T_1 = {_load_data_hazard_T, 3'h0}; // @[datapath.scala 463:81]
  wire [63:0] load_data_hazard = dmem_rdata >> _load_data_hazard_T_1; // @[datapath.scala 463:46]
  wire [31:0] _load_data_ext_hazard_T_3 = load_data_hazard[31] ? 32'hffffffff : 32'h0; // @[datapath.scala 464:78]
  wire [63:0] _load_data_ext_hazard_T_5 = {_load_data_ext_hazard_T_3,load_data_hazard[31:0]}; // @[Cat.scala 31:58]
  wire [63:0] _load_data_ext_hazard_T_9 = {32'h0,load_data_hazard[31:0]}; // @[Cat.scala 31:58]
  wire [47:0] _load_data_ext_hazard_T_13 = load_data_hazard[15] ? 48'hffffffffffff : 48'h0; // @[datapath.scala 466:115]
  wire [63:0] _load_data_ext_hazard_T_15 = {_load_data_ext_hazard_T_13,load_data_hazard[15:0]}; // @[Cat.scala 31:58]
  wire [63:0] _load_data_ext_hazard_T_19 = {48'h0,load_data_hazard[15:0]}; // @[Cat.scala 31:58]
  wire [55:0] _load_data_ext_hazard_T_23 = load_data_hazard[7] ? 56'hffffffffffffff : 56'h0; // @[datapath.scala 468:131]
  wire [63:0] _load_data_ext_hazard_T_25 = {_load_data_ext_hazard_T_23,load_data_hazard[7:0]}; // @[Cat.scala 31:58]
  wire [63:0] _load_data_ext_hazard_T_29 = {56'h0,load_data_hazard[7:0]}; // @[Cat.scala 31:58]
  wire [63:0] _load_data_ext_hazard_T_30 = em_pipe_reg_ld_type == 3'h5 ? _load_data_ext_hazard_T_29 : load_data_hazard; // @[datapath.scala 469:100]
  wire [63:0] _load_data_ext_hazard_T_31 = em_pipe_reg_ld_type == 3'h3 ? _load_data_ext_hazard_T_25 :
    _load_data_ext_hazard_T_30; // @[datapath.scala 468:92]
  wire [63:0] _load_data_ext_hazard_T_32 = em_pipe_reg_ld_type == 3'h4 ? _load_data_ext_hazard_T_19 :
    _load_data_ext_hazard_T_31; // @[datapath.scala 467:84]
  wire [63:0] _load_data_ext_hazard_T_33 = em_pipe_reg_ld_type == 3'h2 ? _load_data_ext_hazard_T_15 :
    _load_data_ext_hazard_T_32; // @[datapath.scala 466:76]
  wire [63:0] _load_data_ext_hazard_T_34 = em_pipe_reg_ld_type == 3'h6 ? _load_data_ext_hazard_T_9 :
    _load_data_ext_hazard_T_33; // @[datapath.scala 465:68]
  wire [63:0] load_data_ext_hazard = em_pipe_reg_ld_type == 3'h1 ? _load_data_ext_hazard_T_5 :
    _load_data_ext_hazard_T_34; // @[datapath.scala 464:39]
  wire  _T_2 = em_pipe_reg_enable & em_pipe_reg_wb_en; // @[datapath.scala 476:33]
  wire [63:0] _GEN_119 = {{59'd0}, em_pipe_reg_dest}; // @[datapath.scala 476:80]
  wire  _T_3 = de_pipe_reg_src1_addr == _GEN_119; // @[datapath.scala 476:80]
  wire  _T_5 = de_pipe_reg_src1_addr != 64'h0; // @[datapath.scala 476:128]
  wire [63:0] _src1_data_T_3 = em_pipe_reg_pc + 64'h4; // @[datapath.scala 480:99]
  wire [63:0] _src1_data_T_5 = em_pipe_reg_wb_sel == 2'h3 ? em_pipe_reg_csr_read_data : load_data_ext_hazard; // @[datapath.scala 481:60]
  wire [63:0] _src1_data_T_6 = em_pipe_reg_wb_sel == 2'h2 ? _src1_data_T_3 : _src1_data_T_5; // @[datapath.scala 480:52]
  wire [63:0] _src1_data_T_7 = em_pipe_reg_wb_sel == 2'h0 ? em_pipe_reg_alu_out : _src1_data_T_6; // @[datapath.scala 479:41]
  wire [63:0] _GEN_54 = _T_3 ? _src1_data_T_7 : 64'h0; // @[datapath.scala 478:65 479:35]
  wire  _T_8 = mw_pipe_reg_enable & mw_pipe_reg_wb_en; // @[datapath.scala 483:39]
  wire [63:0] _GEN_121 = {{59'd0}, mw_pipe_reg_dest}; // @[datapath.scala 483:85]
  wire  _T_9 = de_pipe_reg_src1_addr == _GEN_121; // @[datapath.scala 483:85]
  wire [63:0] _GEN_55 = _T_9 ? _de_pipe_reg_rs1_T_12 : 64'h0; // @[datapath.scala 485:65 486:35]
  wire [63:0] _GEN_56 = mw_pipe_reg_enable & mw_pipe_reg_wb_en & de_pipe_reg_src1_addr == _GEN_121 & _T_5 ? _GEN_55 :
    de_pipe_reg_rs1; // @[datapath.scala 483:142 491:27]
  wire [63:0] src1_data = em_pipe_reg_enable & em_pipe_reg_wb_en & de_pipe_reg_src1_addr == _GEN_119 &
    de_pipe_reg_src1_addr != 64'h0 ? _GEN_54 : _GEN_56; // @[datapath.scala 476:137]
  wire  _T_15 = de_pipe_reg_src2_addr == _GEN_119; // @[datapath.scala 494:80]
  wire  _T_17 = de_pipe_reg_src2_addr != 64'h0; // @[datapath.scala 494:128]
  wire [63:0] _GEN_58 = _T_15 ? _src1_data_T_7 : 64'h0; // @[datapath.scala 496:65 497:35]
  wire  _T_21 = de_pipe_reg_src2_addr == _GEN_121; // @[datapath.scala 501:85]
  wire [63:0] _GEN_59 = _T_21 ? _de_pipe_reg_rs1_T_12 : 64'h0; // @[datapath.scala 503:65 504:35]
  wire [63:0] _GEN_60 = _T_8 & de_pipe_reg_src2_addr == _GEN_121 & _T_17 ? _GEN_59 : de_pipe_reg_rs2; // @[datapath.scala 501:142 509:27]
  wire [63:0] src2_data = _T_2 & de_pipe_reg_src2_addr == _GEN_119 & de_pipe_reg_src2_addr != 64'h0 ? _GEN_58 : _GEN_60; // @[datapath.scala 494:137]
  wire [63:0] A_data = de_pipe_reg_A_sel ? src1_data : de_pipe_reg_pc; // @[datapath.scala 520:25]
  wire [63:0] B_data = de_pipe_reg_B_sel ? src2_data : de_pipe_reg_imm; // @[datapath.scala 521:25]
  wire  _alu_io_A_T = de_pipe_reg_wd_type == 2'h1; // @[datapath.scala 522:45]
  wire  _csr_io_store_misalign_T_1 = de_pipe_reg_st_type == 3'h3; // @[datapath.scala 552:110]
  wire  _csr_io_store_misalign_T_2 = de_pipe_reg_st_type == 3'h2; // @[datapath.scala 553:110]
  wire  _csr_io_store_misalign_T_5 = de_pipe_reg_st_type == 3'h1; // @[datapath.scala 554:110]
  wire  _csr_io_store_misalign_T_7 = alu_io_out[1:0] != 2'h0; // @[datapath.scala 554:139]
  wire  _csr_io_store_misalign_T_8 = de_pipe_reg_st_type == 3'h4; // @[datapath.scala 555:110]
  wire  _csr_io_store_misalign_T_10 = alu_io_out[2:0] != 3'h0; // @[datapath.scala 555:139]
  wire  _csr_io_store_misalign_T_12 = _csr_io_store_misalign_T_5 ? _csr_io_store_misalign_T_7 :
    _csr_io_store_misalign_T_8 & _csr_io_store_misalign_T_10; // @[Mux.scala 101:16]
  wire  _csr_io_store_misalign_T_13 = _csr_io_store_misalign_T_2 ? alu_io_out[0] : _csr_io_store_misalign_T_12; // @[Mux.scala 101:16]
  wire  _csr_io_store_misalign_T_14 = _csr_io_store_misalign_T_1 ? 1'h0 : _csr_io_store_misalign_T_13; // @[Mux.scala 101:16]
  wire  _csr_io_load_misalign_T_3 = de_pipe_reg_ld_type == 3'h3 | de_pipe_reg_ld_type == 3'h5; // @[datapath.scala 561:120]
  wire  _csr_io_load_misalign_T_6 = de_pipe_reg_ld_type == 3'h2 | de_pipe_reg_ld_type == 3'h4; // @[datapath.scala 562:120]
  wire [14:0] _GEN_127 = {{12'd0}, de_pipe_reg_ld_type}; // @[datapath.scala 563:143]
  wire [14:0] _csr_io_load_misalign_T_10 = _GEN_127 & 15'h707f; // @[datapath.scala 563:143]
  wire  _csr_io_load_misalign_T_12 = de_pipe_reg_ld_type == 3'h1 | 15'h6003 == _csr_io_load_misalign_T_10; // @[datapath.scala 563:120]
  wire  _csr_io_load_misalign_T_15 = de_pipe_reg_ld_type == 3'h7; // @[datapath.scala 564:110]
  wire  _csr_io_load_misalign_T_19 = _csr_io_load_misalign_T_12 ? _csr_io_store_misalign_T_7 :
    _csr_io_load_misalign_T_15 & _csr_io_store_misalign_T_10; // @[Mux.scala 101:16]
  wire  _csr_io_load_misalign_T_20 = _csr_io_load_misalign_T_6 ? alu_io_out[0] : _csr_io_load_misalign_T_19; // @[Mux.scala 101:16]
  wire  _csr_io_load_misalign_T_21 = _csr_io_load_misalign_T_3 ? 1'h0 : _csr_io_load_misalign_T_20; // @[Mux.scala 101:16]
  wire  _dmem_io_enable_T_5 = |de_pipe_reg_st_type; // @[datapath.scala 615:162]
  wire [5:0] _dmem_io_wdata_T_4 = {alu_io_out[2:0], 3'h0}; // @[datapath.scala 620:124]
  wire [126:0] _GEN_0 = {{63'd0}, src2_data}; // @[datapath.scala 620:106]
  wire [126:0] _dmem_io_wdata_T_5 = _GEN_0 << _dmem_io_wdata_T_4; // @[datapath.scala 620:106]
  wire [7:0] _st_mask_T_9 = _csr_io_store_misalign_T_1 ? 8'h1 : 8'hff; // @[datapath.scala 627:68]
  wire [7:0] _st_mask_T_10 = _csr_io_store_misalign_T_2 ? 8'h3 : _st_mask_T_9; // @[datapath.scala 626:60]
  wire [7:0] st_mask = _csr_io_store_misalign_T_5 ? 8'hf : _st_mask_T_10; // @[datapath.scala 625:62]
  wire [14:0] _GEN_1 = {{7'd0}, st_mask}; // @[datapath.scala 635:136]
  wire [14:0] _dmem_io_mask_T_6 = _GEN_1 << alu_io_out[2:0]; // @[datapath.scala 635:136]
  wire  _regFile_io_wen_T_2 = _de_pipe_reg_rs1_T_5 | _de_pipe_reg_rs1_T_6; // @[datapath.scala 699:59]
  wire  _regFile_io_wen_T_3 = mw_pipe_reg_wb_sel == 2'h1; // @[datapath.scala 701:68]
  wire  _regFile_io_wen_T_4 = _regFile_io_wen_T_2 | _regFile_io_wen_T_3; // @[datapath.scala 700:79]
  wire [64:0] _GEN_128 = reset ? 65'h80000000 : _GEN_3; // @[datapath.scala 147:{34,34}]
  AluSimple alu ( // @[datapath.scala 226:25]
    .io_A(alu_io_A),
    .io_B(alu_io_B),
    .io_width_type(alu_io_width_type),
    .io_alu_op(alu_io_alu_op),
    .io_out(alu_io_out),
    .io_sum(alu_io_sum)
  );
  ImmGenWire immGen ( // @[datapath.scala 227:28]
    .io_inst(immGen_io_inst),
    .io_sel(immGen_io_sel),
    .io_out(immGen_io_out)
  );
  BrCondSimple brCond ( // @[datapath.scala 228:28]
    .io_rs1(brCond_io_rs1),
    .io_rs2(brCond_io_rs2),
    .io_br_type(brCond_io_br_type),
    .io_taken(brCond_io_taken)
  );
  RegisterFile regFile ( // @[datapath.scala 229:29]
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
  Mem imem ( // @[datapath.scala 230:26]
    .clock(imem_clock),
    .reset(imem_reset),
    .pc_addr(imem_pc_addr),
    .pc_data(imem_pc_data),
    .addr(imem_addr),
    .wdata(imem_wdata),
    .mask(imem_mask),
    .rdata(imem_rdata),
    .enable(imem_enable),
    .wen(imem_wen)
  );
  Mem dmem ( // @[datapath.scala 231:26]
    .clock(dmem_clock),
    .reset(dmem_reset),
    .pc_addr(dmem_pc_addr),
    .pc_data(dmem_pc_data),
    .addr(dmem_addr),
    .wdata(dmem_wdata),
    .mask(dmem_mask),
    .rdata(dmem_rdata),
    .enable(dmem_enable),
    .wen(dmem_wen)
  );
  CSR csr ( // @[datapath.scala 232:25]
    .clock(csr_clock),
    .reset(csr_reset),
    .io_flush_mask(csr_io_flush_mask),
    .io_r_op(csr_io_r_op),
    .io_r_addr(csr_io_r_addr),
    .io_r_data(csr_io_r_data),
    .io_w_op(csr_io_w_op),
    .io_w_addr(csr_io_w_addr),
    .io_w_data(csr_io_w_data),
    .io_retired(csr_io_retired),
    .io_inst(csr_io_inst),
    .io_illegal_inst(csr_io_illegal_inst),
    .io_inst_mode(csr_io_inst_mode),
    .io_fetch_misalign(csr_io_fetch_misalign),
    .io_load_misalign(csr_io_load_misalign),
    .io_store_misalign(csr_io_store_misalign),
    .io_isSret(csr_io_isSret),
    .io_isMret(csr_io_isMret),
    .io_pc_fetch_misalign(csr_io_pc_fetch_misalign),
    .io_load_misalign_addr(csr_io_load_misalign_addr),
    .io_store_misalign_addr(csr_io_store_misalign_addr),
    .io_ebreak_addr(csr_io_ebreak_addr),
    .io_excPC(csr_io_excPC),
    .io_excValue(csr_io_excValue),
    .io_trapVec(csr_io_trapVec),
    .io_trap(csr_io_trap),
    .io_fd_enable(csr_io_fd_enable),
    .io_de_enable(csr_io_de_enable),
    .io_mw_enable(csr_io_mw_enable)
  );
  gpr_ptr gpr_ptr ( // @[datapath.scala 235:29]
    .clock(gpr_ptr_clock),
    .reset(gpr_ptr_reset),
    .regfile_0(gpr_ptr_regfile_0),
    .regfile_1(gpr_ptr_regfile_1),
    .regfile_2(gpr_ptr_regfile_2),
    .regfile_3(gpr_ptr_regfile_3),
    .regfile_4(gpr_ptr_regfile_4),
    .regfile_5(gpr_ptr_regfile_5),
    .regfile_6(gpr_ptr_regfile_6),
    .regfile_7(gpr_ptr_regfile_7),
    .regfile_8(gpr_ptr_regfile_8),
    .regfile_9(gpr_ptr_regfile_9),
    .regfile_10(gpr_ptr_regfile_10),
    .regfile_11(gpr_ptr_regfile_11),
    .regfile_12(gpr_ptr_regfile_12),
    .regfile_13(gpr_ptr_regfile_13),
    .regfile_14(gpr_ptr_regfile_14),
    .regfile_15(gpr_ptr_regfile_15),
    .regfile_16(gpr_ptr_regfile_16),
    .regfile_17(gpr_ptr_regfile_17),
    .regfile_18(gpr_ptr_regfile_18),
    .regfile_19(gpr_ptr_regfile_19),
    .regfile_20(gpr_ptr_regfile_20),
    .regfile_21(gpr_ptr_regfile_21),
    .regfile_22(gpr_ptr_regfile_22),
    .regfile_23(gpr_ptr_regfile_23),
    .regfile_24(gpr_ptr_regfile_24),
    .regfile_25(gpr_ptr_regfile_25),
    .regfile_26(gpr_ptr_regfile_26),
    .regfile_27(gpr_ptr_regfile_27),
    .regfile_28(gpr_ptr_regfile_28),
    .regfile_29(gpr_ptr_regfile_29),
    .regfile_30(gpr_ptr_regfile_30),
    .regfile_31(gpr_ptr_regfile_31)
  );
  assign io_ctrl_inst = fd_pipe_reg_inst; // @[datapath.scala 333:22]
  assign io_pc = mw_pipe_reg_pc; // @[datapath.scala 696:15]
  assign io_inst = mw_pipe_reg_inst; // @[datapath.scala 697:17]
  assign io_start = started; // @[datapath.scala 288:18]
  assign alu_io_A = de_pipe_reg_wd_type == 2'h1 ? {{32'd0}, A_data[31:0]} : A_data; // @[datapath.scala 522:24]
  assign alu_io_B = _alu_io_A_T ? {{32'd0}, B_data[31:0]} : B_data; // @[datapath.scala 523:24]
  assign alu_io_width_type = de_pipe_reg_wd_type; // @[datapath.scala 519:27]
  assign alu_io_alu_op = de_pipe_reg_alu_op; // @[datapath.scala 518:23]
  assign immGen_io_inst = fd_pipe_reg_inst; // @[datapath.scala 348:24]
  assign immGen_io_sel = io_ctrl_imm_sel; // @[datapath.scala 349:23]
  assign brCond_io_rs1 = em_pipe_reg_enable & em_pipe_reg_wb_en & de_pipe_reg_src1_addr == _GEN_119 &
    de_pipe_reg_src1_addr != 64'h0 ? _GEN_54 : _GEN_56; // @[datapath.scala 476:137]
  assign brCond_io_rs2 = _T_2 & de_pipe_reg_src2_addr == _GEN_119 & de_pipe_reg_src2_addr != 64'h0 ? _GEN_58 : _GEN_60; // @[datapath.scala 494:137]
  assign brCond_io_br_type = de_pipe_reg_br_type; // @[datapath.scala 532:27]
  assign regFile_clock = clock;
  assign regFile_reset = reset;
  assign regFile_io_wen = (_regFile_io_wen_T_4 | _de_pipe_reg_rs1_T_9) & mw_pipe_reg_wb_en & mw_pipe_reg_enable; // @[datapath.scala 701:137]
  assign regFile_io_waddr = mw_pipe_reg_dest; // @[datapath.scala 702:26]
  assign regFile_io_wdata = _de_pipe_reg_rs1_T_5 ? mw_pipe_reg_alu_out : _de_pipe_reg_rs1_T_11; // @[datapath.scala 703:32]
  assign regFile_io_raddr_0 = fd_pipe_reg_inst[19:15]; // @[datapath.scala 339:41]
  assign regFile_io_raddr_1 = fd_pipe_reg_inst[24:20]; // @[datapath.scala 340:41]
  assign imem_clock = clock; // @[datapath.scala 254:23]
  assign imem_reset = reset; // @[datapath.scala 255:23]
  assign imem_pc_addr = 64'h0;
  assign imem_addr = next_pc[63:0]; // @[datapath.scala 313:22]
  assign imem_wdata = 64'h0;
  assign imem_mask = 8'h0;
  assign imem_enable = 1'h1; // @[datapath.scala 314:27]
  assign imem_wen = 1'h0; // @[datapath.scala 315:21]
  assign dmem_clock = clock; // @[datapath.scala 256:23]
  assign dmem_reset = reset; // @[datapath.scala 257:23]
  assign dmem_pc_addr = 64'h0;
  assign dmem_addr = alu_io_out; // @[datapath.scala 617:28]
  assign dmem_wdata = _dmem_io_wdata_T_5[63:0]; // @[datapath.scala 620:132]
  assign dmem_mask = st_mask == 8'hff ? st_mask : _dmem_io_mask_T_6[7:0]; // @[datapath.scala 635:28]
  assign dmem_enable = (|de_pipe_reg_ld_type | |de_pipe_reg_st_type) & de_pipe_reg_enable; // @[datapath.scala 615:167]
  assign dmem_wen = _dmem_io_enable_T_5 & de_pipe_reg_enable; // @[datapath.scala 616:106]
  assign csr_clock = clock;
  assign csr_reset = reset;
  assign csr_io_r_op = _csr_op_T_2 ? 3'h2 : _csr_op_T_16; // @[datapath.scala 362:25]
  assign csr_io_r_addr = de_pipe_reg_inst[31:20]; // @[datapath.scala 379:42]
  assign csr_io_w_op = mw_pipe_reg_csr_write_op; // @[datapath.scala 685:21]
  assign csr_io_w_addr = mw_pipe_reg_csr_write_addr; // @[datapath.scala 686:23]
  assign csr_io_w_data = mw_pipe_reg_csr_write_data; // @[datapath.scala 687:23]
  assign csr_io_retired = mw_pipe_reg_inst != 32'h13; // @[datapath.scala 690:44]
  assign csr_io_inst = mw_pipe_reg_inst; // @[datapath.scala 688:21]
  assign csr_io_illegal_inst = io_ctrl_is_illegal ? fd_pipe_reg_inst : 32'h0; // @[datapath.scala 381:35]
  assign csr_io_inst_mode = {{1'd0}, io_ctrl_prv}; // @[datapath.scala 380:26]
  assign csr_io_fetch_misalign = _csr_io_fetch_misalign_T != 64'h0; // @[datapath.scala 383:57]
  assign csr_io_load_misalign = de_pipe_reg_ld_type != 3'h0 & _csr_io_load_misalign_T_21; // @[datapath.scala 558:66]
  assign csr_io_store_misalign = de_pipe_reg_st_type != 3'h0 & _csr_io_store_misalign_T_14; // @[datapath.scala 549:67]
  assign csr_io_isSret = 32'h10200073 == mw_pipe_reg_inst; // @[datapath.scala 691:43]
  assign csr_io_isMret = 32'h30200073 == mw_pipe_reg_inst; // @[datapath.scala 692:43]
  assign csr_io_pc_fetch_misalign = de_pipe_reg_pc; // @[datapath.scala 384:34]
  assign csr_io_load_misalign_addr = alu_io_sum; // @[datapath.scala 566:35]
  assign csr_io_store_misalign_addr = alu_io_sum; // @[datapath.scala 567:36]
  assign csr_io_ebreak_addr = mw_pipe_reg_pc; // @[datapath.scala 689:28]
  assign csr_io_excPC = mw_pipe_reg_pc; // @[datapath.scala 693:22]
  assign csr_io_fd_enable = fd_pipe_reg_enable; // @[datapath.scala 334:26]
  assign csr_io_de_enable = de_pipe_reg_enable; // @[datapath.scala 460:26]
  assign csr_io_mw_enable = mw_pipe_reg_enable; // @[datapath.scala 684:26]
  assign gpr_ptr_clock = clock; // @[datapath.scala 245:26]
  assign gpr_ptr_reset = reset; // @[datapath.scala 246:26]
  assign gpr_ptr_regfile_0 = 64'h0; // @[datapath.scala 241:41]
  assign gpr_ptr_regfile_1 = regFile_io_rdata_4; // @[datapath.scala 241:41]
  assign gpr_ptr_regfile_2 = regFile_io_rdata_5; // @[datapath.scala 241:41]
  assign gpr_ptr_regfile_3 = regFile_io_rdata_6; // @[datapath.scala 241:41]
  assign gpr_ptr_regfile_4 = regFile_io_rdata_7; // @[datapath.scala 241:41]
  assign gpr_ptr_regfile_5 = regFile_io_rdata_8; // @[datapath.scala 241:41]
  assign gpr_ptr_regfile_6 = regFile_io_rdata_9; // @[datapath.scala 241:41]
  assign gpr_ptr_regfile_7 = regFile_io_rdata_10; // @[datapath.scala 241:41]
  assign gpr_ptr_regfile_8 = regFile_io_rdata_11; // @[datapath.scala 241:41]
  assign gpr_ptr_regfile_9 = regFile_io_rdata_12; // @[datapath.scala 241:41]
  assign gpr_ptr_regfile_10 = regFile_io_rdata_13; // @[datapath.scala 241:41]
  assign gpr_ptr_regfile_11 = regFile_io_rdata_14; // @[datapath.scala 241:41]
  assign gpr_ptr_regfile_12 = regFile_io_rdata_15; // @[datapath.scala 241:41]
  assign gpr_ptr_regfile_13 = regFile_io_rdata_16; // @[datapath.scala 241:41]
  assign gpr_ptr_regfile_14 = regFile_io_rdata_17; // @[datapath.scala 241:41]
  assign gpr_ptr_regfile_15 = regFile_io_rdata_18; // @[datapath.scala 241:41]
  assign gpr_ptr_regfile_16 = regFile_io_rdata_19; // @[datapath.scala 241:41]
  assign gpr_ptr_regfile_17 = regFile_io_rdata_20; // @[datapath.scala 241:41]
  assign gpr_ptr_regfile_18 = regFile_io_rdata_21; // @[datapath.scala 241:41]
  assign gpr_ptr_regfile_19 = regFile_io_rdata_22; // @[datapath.scala 241:41]
  assign gpr_ptr_regfile_20 = regFile_io_rdata_23; // @[datapath.scala 241:41]
  assign gpr_ptr_regfile_21 = regFile_io_rdata_24; // @[datapath.scala 241:41]
  assign gpr_ptr_regfile_22 = regFile_io_rdata_25; // @[datapath.scala 241:41]
  assign gpr_ptr_regfile_23 = regFile_io_rdata_26; // @[datapath.scala 241:41]
  assign gpr_ptr_regfile_24 = regFile_io_rdata_27; // @[datapath.scala 241:41]
  assign gpr_ptr_regfile_25 = regFile_io_rdata_28; // @[datapath.scala 241:41]
  assign gpr_ptr_regfile_26 = regFile_io_rdata_29; // @[datapath.scala 241:41]
  assign gpr_ptr_regfile_27 = regFile_io_rdata_30; // @[datapath.scala 241:41]
  assign gpr_ptr_regfile_28 = regFile_io_rdata_31; // @[datapath.scala 241:41]
  assign gpr_ptr_regfile_29 = regFile_io_rdata_32; // @[datapath.scala 241:41]
  assign gpr_ptr_regfile_30 = regFile_io_rdata_33; // @[datapath.scala 241:41]
  assign gpr_ptr_regfile_31 = regFile_io_rdata_34; // @[datapath.scala 241:41]
  always @(posedge clock) begin
    if (reset) begin // @[datapath.scala 147:34]
      fd_pipe_reg_inst <= 32'h13; // @[datapath.scala 147:34]
    end else if (flush_fd) begin // @[datapath.scala 318:23]
      fd_pipe_reg_inst <= 32'h13; // @[datapath.scala 320:34]
    end else if (started | is_kill_inst | brCond_taken | csr_io_trap) begin // @[datapath.scala 308:23]
      fd_pipe_reg_inst <= 32'h13;
    end else if (pc[2]) begin // @[datapath.scala 308:101]
      fd_pipe_reg_inst <= imem_rdata[63:32];
    end else begin
      fd_pipe_reg_inst <= imem_rdata[31:0];
    end
    fd_pipe_reg_pc <= _GEN_128[63:0]; // @[datapath.scala 147:{34,34}]
    if (reset) begin // @[datapath.scala 147:34]
      fd_pipe_reg_enable <= 1'h0; // @[datapath.scala 147:34]
    end else if (flush_fd) begin // @[datapath.scala 318:23]
      fd_pipe_reg_enable <= 1'h0; // @[datapath.scala 321:36]
    end else begin
      fd_pipe_reg_enable <= 1'h1;
    end
    if (reset) begin // @[datapath.scala 156:34]
      de_pipe_reg_alu_op <= 4'h0; // @[datapath.scala 156:34]
    end else if (flush_de) begin // @[datapath.scala 393:23]
      de_pipe_reg_alu_op <= 4'h0; // @[datapath.scala 395:36]
    end else begin
      de_pipe_reg_alu_op <= io_ctrl_alu_op;
    end
    if (reset) begin // @[datapath.scala 156:34]
      de_pipe_reg_pc <= 64'h0; // @[datapath.scala 156:34]
    end else if (flush_de) begin // @[datapath.scala 393:23]
      de_pipe_reg_pc <= 64'h0; // @[datapath.scala 402:32]
    end else begin
      de_pipe_reg_pc <= fd_pipe_reg_pc;
    end
    if (reset) begin // @[datapath.scala 156:34]
      de_pipe_reg_inst <= 32'h13; // @[datapath.scala 156:34]
    end else if (flush_de) begin // @[datapath.scala 393:23]
      de_pipe_reg_inst <= 32'h13; // @[datapath.scala 394:34]
    end else begin
      de_pipe_reg_inst <= fd_pipe_reg_inst;
    end
    if (reset) begin // @[datapath.scala 156:34]
      de_pipe_reg_imm <= 64'h0; // @[datapath.scala 156:34]
    end else if (flush_de) begin // @[datapath.scala 393:23]
      de_pipe_reg_imm <= 64'h0; // @[datapath.scala 403:33]
    end else begin
      de_pipe_reg_imm <= _GEN_15;
    end
    if (reset) begin // @[datapath.scala 156:34]
      de_pipe_reg_rs1 <= 64'h0; // @[datapath.scala 156:34]
    end else if (flush_de) begin // @[datapath.scala 393:23]
      de_pipe_reg_rs1 <= 64'h0; // @[datapath.scala 404:33]
    end else if (mw_pipe_reg_enable & mw_pipe_reg_dest == src1_addr & mw_pipe_reg_wb_en & src1_addr != 5'h0) begin // @[datapath.scala 429:39]
      if (mw_pipe_reg_wb_sel == 2'h0) begin // @[datapath.scala 430:60]
        de_pipe_reg_rs1 <= mw_pipe_reg_alu_out;
      end else begin
        de_pipe_reg_rs1 <= _de_pipe_reg_rs1_T_11;
      end
    end else begin
      de_pipe_reg_rs1 <= regFile_io_rdata_0;
    end
    if (reset) begin // @[datapath.scala 156:34]
      de_pipe_reg_src1_addr <= 64'h0; // @[datapath.scala 156:34]
    end else if (flush_de) begin // @[datapath.scala 393:23]
      de_pipe_reg_src1_addr <= 64'h0; // @[datapath.scala 405:39]
    end else begin
      de_pipe_reg_src1_addr <= _GEN_17;
    end
    if (reset) begin // @[datapath.scala 156:34]
      de_pipe_reg_rs2 <= 64'h0; // @[datapath.scala 156:34]
    end else if (flush_de) begin // @[datapath.scala 393:23]
      de_pipe_reg_rs2 <= 64'h0; // @[datapath.scala 406:33]
    end else if (mw_pipe_reg_enable & mw_pipe_reg_dest == src2_addr & mw_pipe_reg_wb_en & src2_addr != 5'h0) begin // @[datapath.scala 434:39]
      if (mw_pipe_reg_wb_sel == 2'h0) begin // @[datapath.scala 430:60]
        de_pipe_reg_rs2 <= mw_pipe_reg_alu_out;
      end else begin
        de_pipe_reg_rs2 <= _de_pipe_reg_rs1_T_11;
      end
    end else begin
      de_pipe_reg_rs2 <= regFile_io_rdata_1;
    end
    if (reset) begin // @[datapath.scala 156:34]
      de_pipe_reg_src2_addr <= 64'h0; // @[datapath.scala 156:34]
    end else if (flush_de) begin // @[datapath.scala 393:23]
      de_pipe_reg_src2_addr <= 64'h0; // @[datapath.scala 407:39]
    end else begin
      de_pipe_reg_src2_addr <= _GEN_19;
    end
    if (reset) begin // @[datapath.scala 156:34]
      de_pipe_reg_csr_read_data <= 64'h0; // @[datapath.scala 156:34]
    end else if (flush_de) begin // @[datapath.scala 393:23]
      de_pipe_reg_csr_read_data <= 64'h0; // @[datapath.scala 398:43]
    end else begin
      de_pipe_reg_csr_read_data <= _GEN_10;
    end
    if (reset) begin // @[datapath.scala 156:34]
      de_pipe_reg_csr_write_op <= 3'h0; // @[datapath.scala 156:34]
    end else if (flush_de) begin // @[datapath.scala 393:23]
      de_pipe_reg_csr_write_op <= 3'h0; // @[datapath.scala 399:42]
    end else if (_csr_op_T_2) begin // @[datapath.scala 362:25]
      de_pipe_reg_csr_write_op <= 3'h2;
    end else if (_csr_op_T) begin // @[datapath.scala 364:44]
      de_pipe_reg_csr_write_op <= 3'h3;
    end else begin
      de_pipe_reg_csr_write_op <= _csr_op_T_15;
    end
    if (reset) begin // @[datapath.scala 156:34]
      de_pipe_reg_csr_write_addr <= 12'h0; // @[datapath.scala 156:34]
    end else if (flush_de) begin // @[datapath.scala 393:23]
      de_pipe_reg_csr_write_addr <= 12'h0; // @[datapath.scala 401:44]
    end else begin
      de_pipe_reg_csr_write_addr <= _GEN_13;
    end
    if (reset) begin // @[datapath.scala 156:34]
      de_pipe_reg_csr_write_data <= 64'h0; // @[datapath.scala 156:34]
    end else if (flush_de) begin // @[datapath.scala 393:23]
      de_pipe_reg_csr_write_data <= 64'h0; // @[datapath.scala 400:44]
    end else begin
      de_pipe_reg_csr_write_data <= _GEN_12;
    end
    if (reset) begin // @[datapath.scala 156:34]
      de_pipe_reg_dest <= 5'h0; // @[datapath.scala 156:34]
    end else if (flush_de) begin // @[datapath.scala 393:23]
      de_pipe_reg_dest <= 5'h0; // @[datapath.scala 408:34]
    end else begin
      de_pipe_reg_dest <= dest_addr;
    end
    if (reset) begin // @[datapath.scala 156:34]
      de_pipe_reg_A_sel <= 1'h0; // @[datapath.scala 156:34]
    end else if (flush_de) begin // @[datapath.scala 393:23]
      de_pipe_reg_A_sel <= 1'h0; // @[datapath.scala 396:35]
    end else begin
      de_pipe_reg_A_sel <= io_ctrl_A_sel;
    end
    if (reset) begin // @[datapath.scala 156:34]
      de_pipe_reg_B_sel <= 1'h0; // @[datapath.scala 156:34]
    end else if (flush_de) begin // @[datapath.scala 393:23]
      de_pipe_reg_B_sel <= 1'h0; // @[datapath.scala 397:35]
    end else begin
      de_pipe_reg_B_sel <= io_ctrl_B_sel;
    end
    if (reset) begin // @[datapath.scala 156:34]
      de_pipe_reg_pc_sel <= 2'h0; // @[datapath.scala 156:34]
    end else if (flush_de) begin // @[datapath.scala 393:23]
      de_pipe_reg_pc_sel <= 2'h0; // @[datapath.scala 409:36]
    end else begin
      de_pipe_reg_pc_sel <= io_ctrl_pc_sel;
    end
    if (reset) begin // @[datapath.scala 156:34]
      de_pipe_reg_br_type <= 3'h0; // @[datapath.scala 156:34]
    end else if (flush_de) begin // @[datapath.scala 393:23]
      de_pipe_reg_br_type <= 3'h0; // @[datapath.scala 410:37]
    end else begin
      de_pipe_reg_br_type <= io_ctrl_br_type;
    end
    if (reset) begin // @[datapath.scala 156:34]
      de_pipe_reg_wd_type <= 2'h0; // @[datapath.scala 156:34]
    end else if (flush_de) begin // @[datapath.scala 393:23]
      de_pipe_reg_wd_type <= 2'h0; // @[datapath.scala 413:37]
    end else begin
      de_pipe_reg_wd_type <= io_ctrl_wd_type;
    end
    if (reset) begin // @[datapath.scala 156:34]
      de_pipe_reg_st_type <= 3'h0; // @[datapath.scala 156:34]
    end else if (flush_de) begin // @[datapath.scala 393:23]
      de_pipe_reg_st_type <= 3'h0; // @[datapath.scala 411:37]
    end else begin
      de_pipe_reg_st_type <= io_ctrl_st_type;
    end
    if (reset) begin // @[datapath.scala 156:34]
      de_pipe_reg_ld_type <= 3'h0; // @[datapath.scala 156:34]
    end else if (flush_de) begin // @[datapath.scala 393:23]
      de_pipe_reg_ld_type <= 3'h0; // @[datapath.scala 412:37]
    end else begin
      de_pipe_reg_ld_type <= io_ctrl_ld_type;
    end
    if (reset) begin // @[datapath.scala 156:34]
      de_pipe_reg_wb_sel <= 2'h0; // @[datapath.scala 156:34]
    end else if (flush_de) begin // @[datapath.scala 393:23]
      de_pipe_reg_wb_sel <= 2'h0; // @[datapath.scala 414:36]
    end else begin
      de_pipe_reg_wb_sel <= io_ctrl_wb_sel;
    end
    if (reset) begin // @[datapath.scala 156:34]
      de_pipe_reg_wb_en <= 1'h0; // @[datapath.scala 156:34]
    end else if (flush_de) begin // @[datapath.scala 393:23]
      de_pipe_reg_wb_en <= 1'h0; // @[datapath.scala 415:35]
    end else begin
      de_pipe_reg_wb_en <= io_ctrl_wb_en;
    end
    if (reset) begin // @[datapath.scala 156:34]
      de_pipe_reg_enable <= 1'h0; // @[datapath.scala 156:34]
    end else if (flush_de) begin // @[datapath.scala 393:23]
      de_pipe_reg_enable <= 1'h0; // @[datapath.scala 417:36]
    end else begin
      de_pipe_reg_enable <= fd_pipe_reg_enable;
    end
    if (reset) begin // @[datapath.scala 185:34]
      em_pipe_reg_alu_out <= 64'h0; // @[datapath.scala 185:34]
    end else if (flush_em) begin // @[datapath.scala 569:23]
      em_pipe_reg_alu_out <= 64'h0; // @[datapath.scala 572:37]
    end else begin
      em_pipe_reg_alu_out <= jump_addr;
    end
    if (reset) begin // @[datapath.scala 185:34]
      em_pipe_reg_csr_read_data <= 64'h0; // @[datapath.scala 185:34]
    end else if (flush_em) begin // @[datapath.scala 569:23]
      em_pipe_reg_csr_read_data <= 64'h0; // @[datapath.scala 574:43]
    end else begin
      em_pipe_reg_csr_read_data <= de_pipe_reg_csr_read_data;
    end
    if (reset) begin // @[datapath.scala 185:34]
      em_pipe_reg_csr_write_op <= 3'h0; // @[datapath.scala 185:34]
    end else if (flush_em) begin // @[datapath.scala 569:23]
      em_pipe_reg_csr_write_op <= 3'h0; // @[datapath.scala 575:42]
    end else begin
      em_pipe_reg_csr_write_op <= de_pipe_reg_csr_write_op;
    end
    if (reset) begin // @[datapath.scala 185:34]
      em_pipe_reg_csr_write_addr <= 12'h0; // @[datapath.scala 185:34]
    end else if (flush_em) begin // @[datapath.scala 569:23]
      em_pipe_reg_csr_write_addr <= 12'h0; // @[datapath.scala 576:44]
    end else begin
      em_pipe_reg_csr_write_addr <= de_pipe_reg_csr_write_addr;
    end
    if (reset) begin // @[datapath.scala 185:34]
      em_pipe_reg_csr_write_data <= 64'h0; // @[datapath.scala 185:34]
    end else if (flush_em) begin // @[datapath.scala 569:23]
      em_pipe_reg_csr_write_data <= 64'h0; // @[datapath.scala 577:44]
    end else begin
      em_pipe_reg_csr_write_data <= de_pipe_reg_csr_write_data;
    end
    if (reset) begin // @[datapath.scala 185:34]
      em_pipe_reg_ld_type <= 3'h0; // @[datapath.scala 185:34]
    end else if (flush_em) begin // @[datapath.scala 569:23]
      em_pipe_reg_ld_type <= 3'h0; // @[datapath.scala 580:37]
    end else begin
      em_pipe_reg_ld_type <= de_pipe_reg_ld_type;
    end
    if (reset) begin // @[datapath.scala 185:34]
      em_pipe_reg_wb_sel <= 2'h0; // @[datapath.scala 185:34]
    end else if (flush_em) begin // @[datapath.scala 569:23]
      em_pipe_reg_wb_sel <= 2'h0; // @[datapath.scala 581:36]
    end else begin
      em_pipe_reg_wb_sel <= de_pipe_reg_wb_sel;
    end
    if (reset) begin // @[datapath.scala 185:34]
      em_pipe_reg_wb_en <= 1'h0; // @[datapath.scala 185:34]
    end else if (flush_em) begin // @[datapath.scala 569:23]
      em_pipe_reg_wb_en <= 1'h0; // @[datapath.scala 582:35]
    end else begin
      em_pipe_reg_wb_en <= de_pipe_reg_wb_en;
    end
    if (reset) begin // @[datapath.scala 185:34]
      em_pipe_reg_dest <= 5'h0; // @[datapath.scala 185:34]
    end else if (flush_em) begin // @[datapath.scala 569:23]
      em_pipe_reg_dest <= 5'h0; // @[datapath.scala 571:34]
    end else begin
      em_pipe_reg_dest <= de_pipe_reg_dest;
    end
    if (reset) begin // @[datapath.scala 185:34]
      em_pipe_reg_pc <= 64'h0; // @[datapath.scala 185:34]
    end else if (flush_em) begin // @[datapath.scala 569:23]
      em_pipe_reg_pc <= 64'h0; // @[datapath.scala 583:32]
    end else begin
      em_pipe_reg_pc <= de_pipe_reg_pc;
    end
    if (reset) begin // @[datapath.scala 185:34]
      em_pipe_reg_inst <= 32'h13; // @[datapath.scala 185:34]
    end else if (flush_em) begin // @[datapath.scala 569:23]
      em_pipe_reg_inst <= 32'h13; // @[datapath.scala 570:34]
    end else begin
      em_pipe_reg_inst <= de_pipe_reg_inst;
    end
    if (reset) begin // @[datapath.scala 185:34]
      em_pipe_reg_enable <= 1'h0; // @[datapath.scala 185:34]
    end else if (flush_em) begin // @[datapath.scala 569:23]
      em_pipe_reg_enable <= 1'h0; // @[datapath.scala 585:36]
    end else begin
      em_pipe_reg_enable <= de_pipe_reg_enable;
    end
    if (reset) begin // @[datapath.scala 206:34]
      mw_pipe_reg_load_data <= 64'h0; // @[datapath.scala 206:34]
    end else if (flush_mw) begin // @[datapath.scala 649:23]
      mw_pipe_reg_load_data <= 64'h0; // @[datapath.scala 650:39]
    end else if (em_pipe_reg_ld_type == 3'h1) begin // @[datapath.scala 464:39]
      mw_pipe_reg_load_data <= _load_data_ext_hazard_T_5;
    end else if (em_pipe_reg_ld_type == 3'h6) begin // @[datapath.scala 465:68]
      mw_pipe_reg_load_data <= _load_data_ext_hazard_T_9;
    end else begin
      mw_pipe_reg_load_data <= _load_data_ext_hazard_T_33;
    end
    if (flush_mw) begin // @[datapath.scala 649:23]
      mw_pipe_reg_alu_out <= 64'h0; // @[datapath.scala 651:37]
    end else begin
      mw_pipe_reg_alu_out <= em_pipe_reg_alu_out;
    end
    if (flush_mw) begin // @[datapath.scala 649:23]
      mw_pipe_reg_dest <= 5'h0; // @[datapath.scala 652:34]
    end else begin
      mw_pipe_reg_dest <= em_pipe_reg_dest;
    end
    if (reset) begin // @[datapath.scala 206:34]
      mw_pipe_reg_csr_read_data <= 64'h0; // @[datapath.scala 206:34]
    end else if (flush_mw) begin // @[datapath.scala 649:23]
      mw_pipe_reg_csr_read_data <= 64'h0; // @[datapath.scala 657:43]
    end else begin
      mw_pipe_reg_csr_read_data <= em_pipe_reg_csr_read_data;
    end
    if (reset) begin // @[datapath.scala 206:34]
      mw_pipe_reg_csr_write_op <= 3'h0; // @[datapath.scala 206:34]
    end else if (flush_mw) begin // @[datapath.scala 649:23]
      mw_pipe_reg_csr_write_op <= 3'h0; // @[datapath.scala 658:42]
    end else begin
      mw_pipe_reg_csr_write_op <= em_pipe_reg_csr_write_op;
    end
    if (reset) begin // @[datapath.scala 206:34]
      mw_pipe_reg_csr_write_addr <= 12'h0; // @[datapath.scala 206:34]
    end else if (flush_mw) begin // @[datapath.scala 649:23]
      mw_pipe_reg_csr_write_addr <= 12'h0; // @[datapath.scala 660:44]
    end else begin
      mw_pipe_reg_csr_write_addr <= em_pipe_reg_csr_write_addr;
    end
    if (reset) begin // @[datapath.scala 206:34]
      mw_pipe_reg_csr_write_data <= 64'h0; // @[datapath.scala 206:34]
    end else if (flush_mw) begin // @[datapath.scala 649:23]
      mw_pipe_reg_csr_write_data <= 64'h0; // @[datapath.scala 659:44]
    end else begin
      mw_pipe_reg_csr_write_data <= em_pipe_reg_csr_write_data;
    end
    if (reset) begin // @[datapath.scala 206:34]
      mw_pipe_reg_wb_sel <= 2'h0; // @[datapath.scala 206:34]
    end else if (flush_mw) begin // @[datapath.scala 649:23]
      mw_pipe_reg_wb_sel <= 2'h0; // @[datapath.scala 653:36]
    end else begin
      mw_pipe_reg_wb_sel <= em_pipe_reg_wb_sel;
    end
    if (reset) begin // @[datapath.scala 206:34]
      mw_pipe_reg_wb_en <= 1'h0; // @[datapath.scala 206:34]
    end else if (flush_mw) begin // @[datapath.scala 649:23]
      mw_pipe_reg_wb_en <= 1'h0; // @[datapath.scala 654:35]
    end else begin
      mw_pipe_reg_wb_en <= em_pipe_reg_wb_en;
    end
    if (reset) begin // @[datapath.scala 206:34]
      mw_pipe_reg_pc <= 64'h0; // @[datapath.scala 206:34]
    end else if (flush_mw) begin // @[datapath.scala 649:23]
      mw_pipe_reg_pc <= 64'h0; // @[datapath.scala 655:32]
    end else begin
      mw_pipe_reg_pc <= em_pipe_reg_pc;
    end
    if (reset) begin // @[datapath.scala 206:34]
      mw_pipe_reg_inst <= 32'h13; // @[datapath.scala 206:34]
    end else if (flush_mw) begin // @[datapath.scala 649:23]
      mw_pipe_reg_inst <= 32'h13; // @[datapath.scala 656:34]
    end else begin
      mw_pipe_reg_inst <= em_pipe_reg_inst;
    end
    if (reset) begin // @[datapath.scala 206:34]
      mw_pipe_reg_enable <= 1'h0; // @[datapath.scala 206:34]
    end else if (flush_mw) begin // @[datapath.scala 649:23]
      mw_pipe_reg_enable <= 1'h0; // @[datapath.scala 661:36]
    end else begin
      mw_pipe_reg_enable <= em_pipe_reg_enable;
    end
    started <= reset; // @[datapath.scala 282:37]
    if (reset) begin // @[datapath.scala 294:25]
      pc <= {{1'd0}, _pc_T_1}; // @[datapath.scala 294:25]
    end else if (csr_io_trap) begin // @[Mux.scala 101:16]
      pc <= {{1'd0}, csr_io_trapVec};
    end else if (!(csr_atomic)) begin // @[Mux.scala 101:16]
      if (_next_pc_T_4) begin // @[Mux.scala 101:16]
        pc <= _next_pc_T_6;
      end else begin
        pc <= _next_pc_T_1;
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
  _RAND_0 = {1{`RANDOM}};
  fd_pipe_reg_inst = _RAND_0[31:0];
  _RAND_1 = {2{`RANDOM}};
  fd_pipe_reg_pc = _RAND_1[63:0];
  _RAND_2 = {1{`RANDOM}};
  fd_pipe_reg_enable = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  de_pipe_reg_alu_op = _RAND_3[3:0];
  _RAND_4 = {2{`RANDOM}};
  de_pipe_reg_pc = _RAND_4[63:0];
  _RAND_5 = {1{`RANDOM}};
  de_pipe_reg_inst = _RAND_5[31:0];
  _RAND_6 = {2{`RANDOM}};
  de_pipe_reg_imm = _RAND_6[63:0];
  _RAND_7 = {2{`RANDOM}};
  de_pipe_reg_rs1 = _RAND_7[63:0];
  _RAND_8 = {2{`RANDOM}};
  de_pipe_reg_src1_addr = _RAND_8[63:0];
  _RAND_9 = {2{`RANDOM}};
  de_pipe_reg_rs2 = _RAND_9[63:0];
  _RAND_10 = {2{`RANDOM}};
  de_pipe_reg_src2_addr = _RAND_10[63:0];
  _RAND_11 = {2{`RANDOM}};
  de_pipe_reg_csr_read_data = _RAND_11[63:0];
  _RAND_12 = {1{`RANDOM}};
  de_pipe_reg_csr_write_op = _RAND_12[2:0];
  _RAND_13 = {1{`RANDOM}};
  de_pipe_reg_csr_write_addr = _RAND_13[11:0];
  _RAND_14 = {2{`RANDOM}};
  de_pipe_reg_csr_write_data = _RAND_14[63:0];
  _RAND_15 = {1{`RANDOM}};
  de_pipe_reg_dest = _RAND_15[4:0];
  _RAND_16 = {1{`RANDOM}};
  de_pipe_reg_A_sel = _RAND_16[0:0];
  _RAND_17 = {1{`RANDOM}};
  de_pipe_reg_B_sel = _RAND_17[0:0];
  _RAND_18 = {1{`RANDOM}};
  de_pipe_reg_pc_sel = _RAND_18[1:0];
  _RAND_19 = {1{`RANDOM}};
  de_pipe_reg_br_type = _RAND_19[2:0];
  _RAND_20 = {1{`RANDOM}};
  de_pipe_reg_wd_type = _RAND_20[1:0];
  _RAND_21 = {1{`RANDOM}};
  de_pipe_reg_st_type = _RAND_21[2:0];
  _RAND_22 = {1{`RANDOM}};
  de_pipe_reg_ld_type = _RAND_22[2:0];
  _RAND_23 = {1{`RANDOM}};
  de_pipe_reg_wb_sel = _RAND_23[1:0];
  _RAND_24 = {1{`RANDOM}};
  de_pipe_reg_wb_en = _RAND_24[0:0];
  _RAND_25 = {1{`RANDOM}};
  de_pipe_reg_enable = _RAND_25[0:0];
  _RAND_26 = {2{`RANDOM}};
  em_pipe_reg_alu_out = _RAND_26[63:0];
  _RAND_27 = {2{`RANDOM}};
  em_pipe_reg_csr_read_data = _RAND_27[63:0];
  _RAND_28 = {1{`RANDOM}};
  em_pipe_reg_csr_write_op = _RAND_28[2:0];
  _RAND_29 = {1{`RANDOM}};
  em_pipe_reg_csr_write_addr = _RAND_29[11:0];
  _RAND_30 = {2{`RANDOM}};
  em_pipe_reg_csr_write_data = _RAND_30[63:0];
  _RAND_31 = {1{`RANDOM}};
  em_pipe_reg_ld_type = _RAND_31[2:0];
  _RAND_32 = {1{`RANDOM}};
  em_pipe_reg_wb_sel = _RAND_32[1:0];
  _RAND_33 = {1{`RANDOM}};
  em_pipe_reg_wb_en = _RAND_33[0:0];
  _RAND_34 = {1{`RANDOM}};
  em_pipe_reg_dest = _RAND_34[4:0];
  _RAND_35 = {2{`RANDOM}};
  em_pipe_reg_pc = _RAND_35[63:0];
  _RAND_36 = {1{`RANDOM}};
  em_pipe_reg_inst = _RAND_36[31:0];
  _RAND_37 = {1{`RANDOM}};
  em_pipe_reg_enable = _RAND_37[0:0];
  _RAND_38 = {2{`RANDOM}};
  mw_pipe_reg_load_data = _RAND_38[63:0];
  _RAND_39 = {2{`RANDOM}};
  mw_pipe_reg_alu_out = _RAND_39[63:0];
  _RAND_40 = {1{`RANDOM}};
  mw_pipe_reg_dest = _RAND_40[4:0];
  _RAND_41 = {2{`RANDOM}};
  mw_pipe_reg_csr_read_data = _RAND_41[63:0];
  _RAND_42 = {1{`RANDOM}};
  mw_pipe_reg_csr_write_op = _RAND_42[2:0];
  _RAND_43 = {1{`RANDOM}};
  mw_pipe_reg_csr_write_addr = _RAND_43[11:0];
  _RAND_44 = {2{`RANDOM}};
  mw_pipe_reg_csr_write_data = _RAND_44[63:0];
  _RAND_45 = {1{`RANDOM}};
  mw_pipe_reg_wb_sel = _RAND_45[1:0];
  _RAND_46 = {1{`RANDOM}};
  mw_pipe_reg_wb_en = _RAND_46[0:0];
  _RAND_47 = {2{`RANDOM}};
  mw_pipe_reg_pc = _RAND_47[63:0];
  _RAND_48 = {1{`RANDOM}};
  mw_pipe_reg_inst = _RAND_48[31:0];
  _RAND_49 = {1{`RANDOM}};
  mw_pipe_reg_enable = _RAND_49[0:0];
  _RAND_50 = {1{`RANDOM}};
  started = _RAND_50[0:0];
  _RAND_51 = {3{`RANDOM}};
  pc = _RAND_51[64:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module Control(
  input  [31:0] io_inst,
  output [1:0]  io_pc_sel,
  output        io_A_sel,
  output        io_B_sel,
  output [1:0]  io_wd_type,
  output [2:0]  io_imm_sel,
  output [2:0]  io_br_type,
  output [2:0]  io_st_type,
  output [2:0]  io_ld_type,
  output [1:0]  io_wb_sel,
  output        io_wb_en,
  output [3:0]  io_alu_op,
  output        io_prv,
  output [2:0]  io_csr_cmd,
  output        io_is_illegal,
  output        io_is_kill
);
  wire [31:0] _ctrlSignals_T = io_inst & 32'h7f; // @[Lookup.scala 31:38]
  wire  _ctrlSignals_T_1 = 32'h37 == _ctrlSignals_T; // @[Lookup.scala 31:38]
  wire  _ctrlSignals_T_3 = 32'h17 == _ctrlSignals_T; // @[Lookup.scala 31:38]
  wire  _ctrlSignals_T_5 = 32'h6f == _ctrlSignals_T; // @[Lookup.scala 31:38]
  wire [31:0] _ctrlSignals_T_6 = io_inst & 32'h707f; // @[Lookup.scala 31:38]
  wire  _ctrlSignals_T_7 = 32'h67 == _ctrlSignals_T_6; // @[Lookup.scala 31:38]
  wire  _ctrlSignals_T_9 = 32'h63 == _ctrlSignals_T_6; // @[Lookup.scala 31:38]
  wire  _ctrlSignals_T_11 = 32'h1063 == _ctrlSignals_T_6; // @[Lookup.scala 31:38]
  wire  _ctrlSignals_T_13 = 32'h4063 == _ctrlSignals_T_6; // @[Lookup.scala 31:38]
  wire  _ctrlSignals_T_15 = 32'h5063 == _ctrlSignals_T_6; // @[Lookup.scala 31:38]
  wire  _ctrlSignals_T_17 = 32'h6063 == _ctrlSignals_T_6; // @[Lookup.scala 31:38]
  wire  _ctrlSignals_T_19 = 32'h7063 == _ctrlSignals_T_6; // @[Lookup.scala 31:38]
  wire  _ctrlSignals_T_21 = 32'h3 == _ctrlSignals_T_6; // @[Lookup.scala 31:38]
  wire  _ctrlSignals_T_23 = 32'h1003 == _ctrlSignals_T_6; // @[Lookup.scala 31:38]
  wire  _ctrlSignals_T_25 = 32'h2003 == _ctrlSignals_T_6; // @[Lookup.scala 31:38]
  wire  _ctrlSignals_T_27 = 32'h4003 == _ctrlSignals_T_6; // @[Lookup.scala 31:38]
  wire  _ctrlSignals_T_29 = 32'h5003 == _ctrlSignals_T_6; // @[Lookup.scala 31:38]
  wire  _ctrlSignals_T_31 = 32'h6003 == _ctrlSignals_T_6; // @[Lookup.scala 31:38]
  wire  _ctrlSignals_T_33 = 32'h3003 == _ctrlSignals_T_6; // @[Lookup.scala 31:38]
  wire  _ctrlSignals_T_35 = 32'h23 == _ctrlSignals_T_6; // @[Lookup.scala 31:38]
  wire  _ctrlSignals_T_37 = 32'h1023 == _ctrlSignals_T_6; // @[Lookup.scala 31:38]
  wire  _ctrlSignals_T_39 = 32'h2023 == _ctrlSignals_T_6; // @[Lookup.scala 31:38]
  wire  _ctrlSignals_T_41 = 32'h3023 == _ctrlSignals_T_6; // @[Lookup.scala 31:38]
  wire  _ctrlSignals_T_43 = 32'h13 == _ctrlSignals_T_6; // @[Lookup.scala 31:38]
  wire  _ctrlSignals_T_45 = 32'h1b == _ctrlSignals_T_6; // @[Lookup.scala 31:38]
  wire  _ctrlSignals_T_47 = 32'h2013 == _ctrlSignals_T_6; // @[Lookup.scala 31:38]
  wire  _ctrlSignals_T_49 = 32'h3013 == _ctrlSignals_T_6; // @[Lookup.scala 31:38]
  wire  _ctrlSignals_T_51 = 32'h4013 == _ctrlSignals_T_6; // @[Lookup.scala 31:38]
  wire  _ctrlSignals_T_53 = 32'h6013 == _ctrlSignals_T_6; // @[Lookup.scala 31:38]
  wire  _ctrlSignals_T_55 = 32'h7013 == _ctrlSignals_T_6; // @[Lookup.scala 31:38]
  wire [31:0] _ctrlSignals_T_56 = io_inst & 32'hfc00707f; // @[Lookup.scala 31:38]
  wire  _ctrlSignals_T_57 = 32'h1013 == _ctrlSignals_T_56; // @[Lookup.scala 31:38]
  wire [31:0] _ctrlSignals_T_58 = io_inst & 32'hfe00707f; // @[Lookup.scala 31:38]
  wire  _ctrlSignals_T_59 = 32'h101b == _ctrlSignals_T_58; // @[Lookup.scala 31:38]
  wire  _ctrlSignals_T_61 = 32'h5013 == _ctrlSignals_T_56; // @[Lookup.scala 31:38]
  wire  _ctrlSignals_T_63 = 32'h501b == _ctrlSignals_T_58; // @[Lookup.scala 31:38]
  wire  _ctrlSignals_T_65 = 32'h40005013 == _ctrlSignals_T_56; // @[Lookup.scala 31:38]
  wire  _ctrlSignals_T_67 = 32'h4000501b == _ctrlSignals_T_58; // @[Lookup.scala 31:38]
  wire  _ctrlSignals_T_69 = 32'h33 == _ctrlSignals_T_58; // @[Lookup.scala 31:38]
  wire  _ctrlSignals_T_71 = 32'h3b == _ctrlSignals_T_58; // @[Lookup.scala 31:38]
  wire  _ctrlSignals_T_73 = 32'h40000033 == _ctrlSignals_T_58; // @[Lookup.scala 31:38]
  wire  _ctrlSignals_T_75 = 32'h4000003b == _ctrlSignals_T_58; // @[Lookup.scala 31:38]
  wire  _ctrlSignals_T_77 = 32'h1033 == _ctrlSignals_T_58; // @[Lookup.scala 31:38]
  wire  _ctrlSignals_T_79 = 32'h103b == _ctrlSignals_T_58; // @[Lookup.scala 31:38]
  wire  _ctrlSignals_T_81 = 32'h2033 == _ctrlSignals_T_58; // @[Lookup.scala 31:38]
  wire  _ctrlSignals_T_83 = 32'h3033 == _ctrlSignals_T_58; // @[Lookup.scala 31:38]
  wire  _ctrlSignals_T_85 = 32'h4033 == _ctrlSignals_T_58; // @[Lookup.scala 31:38]
  wire  _ctrlSignals_T_87 = 32'h5033 == _ctrlSignals_T_58; // @[Lookup.scala 31:38]
  wire  _ctrlSignals_T_89 = 32'h503b == _ctrlSignals_T_58; // @[Lookup.scala 31:38]
  wire  _ctrlSignals_T_91 = 32'h40005033 == _ctrlSignals_T_58; // @[Lookup.scala 31:38]
  wire  _ctrlSignals_T_93 = 32'h4000503b == _ctrlSignals_T_58; // @[Lookup.scala 31:38]
  wire  _ctrlSignals_T_95 = 32'h6033 == _ctrlSignals_T_58; // @[Lookup.scala 31:38]
  wire  _ctrlSignals_T_97 = 32'h7033 == _ctrlSignals_T_58; // @[Lookup.scala 31:38]
  wire  _ctrlSignals_T_99 = 32'h2000033 == _ctrlSignals_T_58; // @[Lookup.scala 31:38]
  wire  _ctrlSignals_T_101 = 32'h200003b == _ctrlSignals_T_58; // @[Lookup.scala 31:38]
  wire  _ctrlSignals_T_103 = 32'h2004033 == _ctrlSignals_T_58; // @[Lookup.scala 31:38]
  wire  _ctrlSignals_T_105 = 32'h2005033 == _ctrlSignals_T_58; // @[Lookup.scala 31:38]
  wire  _ctrlSignals_T_107 = 32'h200403b == _ctrlSignals_T_58; // @[Lookup.scala 31:38]
  wire  _ctrlSignals_T_109 = 32'h200503b == _ctrlSignals_T_58; // @[Lookup.scala 31:38]
  wire  _ctrlSignals_T_111 = 32'h2006033 == _ctrlSignals_T_58; // @[Lookup.scala 31:38]
  wire  _ctrlSignals_T_113 = 32'h2007033 == _ctrlSignals_T_58; // @[Lookup.scala 31:38]
  wire  _ctrlSignals_T_115 = 32'h200603b == _ctrlSignals_T_58; // @[Lookup.scala 31:38]
  wire  _ctrlSignals_T_117 = 32'h200703b == _ctrlSignals_T_58; // @[Lookup.scala 31:38]
  wire  _ctrlSignals_T_119 = 32'h1073 == _ctrlSignals_T_6; // @[Lookup.scala 31:38]
  wire  _ctrlSignals_T_121 = 32'h2073 == _ctrlSignals_T_6; // @[Lookup.scala 31:38]
  wire  _ctrlSignals_T_123 = 32'h3073 == _ctrlSignals_T_6; // @[Lookup.scala 31:38]
  wire  _ctrlSignals_T_125 = 32'h5073 == _ctrlSignals_T_6; // @[Lookup.scala 31:38]
  wire  _ctrlSignals_T_127 = 32'h6073 == _ctrlSignals_T_6; // @[Lookup.scala 31:38]
  wire  _ctrlSignals_T_129 = 32'h7073 == _ctrlSignals_T_6; // @[Lookup.scala 31:38]
  wire  _ctrlSignals_T_131 = 32'h30200073 == io_inst; // @[Lookup.scala 31:38]
  wire  _ctrlSignals_T_133 = 32'h10200073 == io_inst; // @[Lookup.scala 31:38]
  wire  _ctrlSignals_T_135 = 32'h73 == io_inst; // @[Lookup.scala 31:38]
  wire  _ctrlSignals_T_137 = 32'h100073 == io_inst; // @[Lookup.scala 31:38]
  wire [1:0] _ctrlSignals_T_140 = _ctrlSignals_T_133 ? 2'h3 : 2'h0; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_141 = _ctrlSignals_T_131 ? 2'h3 : _ctrlSignals_T_140; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_142 = _ctrlSignals_T_129 ? 2'h2 : _ctrlSignals_T_141; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_143 = _ctrlSignals_T_127 ? 2'h2 : _ctrlSignals_T_142; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_144 = _ctrlSignals_T_125 ? 2'h2 : _ctrlSignals_T_143; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_145 = _ctrlSignals_T_123 ? 2'h2 : _ctrlSignals_T_144; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_146 = _ctrlSignals_T_121 ? 2'h2 : _ctrlSignals_T_145; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_147 = _ctrlSignals_T_119 ? 2'h2 : _ctrlSignals_T_146; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_148 = _ctrlSignals_T_117 ? 2'h0 : _ctrlSignals_T_147; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_149 = _ctrlSignals_T_115 ? 2'h0 : _ctrlSignals_T_148; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_150 = _ctrlSignals_T_113 ? 2'h0 : _ctrlSignals_T_149; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_151 = _ctrlSignals_T_111 ? 2'h0 : _ctrlSignals_T_150; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_152 = _ctrlSignals_T_109 ? 2'h0 : _ctrlSignals_T_151; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_153 = _ctrlSignals_T_107 ? 2'h0 : _ctrlSignals_T_152; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_154 = _ctrlSignals_T_105 ? 2'h0 : _ctrlSignals_T_153; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_155 = _ctrlSignals_T_103 ? 2'h0 : _ctrlSignals_T_154; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_156 = _ctrlSignals_T_101 ? 2'h0 : _ctrlSignals_T_155; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_157 = _ctrlSignals_T_99 ? 2'h0 : _ctrlSignals_T_156; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_158 = _ctrlSignals_T_97 ? 2'h0 : _ctrlSignals_T_157; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_159 = _ctrlSignals_T_95 ? 2'h0 : _ctrlSignals_T_158; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_160 = _ctrlSignals_T_93 ? 2'h0 : _ctrlSignals_T_159; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_161 = _ctrlSignals_T_91 ? 2'h0 : _ctrlSignals_T_160; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_162 = _ctrlSignals_T_89 ? 2'h0 : _ctrlSignals_T_161; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_163 = _ctrlSignals_T_87 ? 2'h0 : _ctrlSignals_T_162; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_164 = _ctrlSignals_T_85 ? 2'h0 : _ctrlSignals_T_163; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_165 = _ctrlSignals_T_83 ? 2'h0 : _ctrlSignals_T_164; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_166 = _ctrlSignals_T_81 ? 2'h0 : _ctrlSignals_T_165; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_167 = _ctrlSignals_T_79 ? 2'h0 : _ctrlSignals_T_166; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_168 = _ctrlSignals_T_77 ? 2'h0 : _ctrlSignals_T_167; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_169 = _ctrlSignals_T_75 ? 2'h0 : _ctrlSignals_T_168; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_170 = _ctrlSignals_T_73 ? 2'h0 : _ctrlSignals_T_169; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_171 = _ctrlSignals_T_71 ? 2'h0 : _ctrlSignals_T_170; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_172 = _ctrlSignals_T_69 ? 2'h0 : _ctrlSignals_T_171; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_173 = _ctrlSignals_T_67 ? 2'h0 : _ctrlSignals_T_172; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_174 = _ctrlSignals_T_65 ? 2'h0 : _ctrlSignals_T_173; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_175 = _ctrlSignals_T_63 ? 2'h0 : _ctrlSignals_T_174; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_176 = _ctrlSignals_T_61 ? 2'h0 : _ctrlSignals_T_175; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_177 = _ctrlSignals_T_59 ? 2'h0 : _ctrlSignals_T_176; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_178 = _ctrlSignals_T_57 ? 2'h0 : _ctrlSignals_T_177; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_179 = _ctrlSignals_T_55 ? 2'h0 : _ctrlSignals_T_178; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_180 = _ctrlSignals_T_53 ? 2'h0 : _ctrlSignals_T_179; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_181 = _ctrlSignals_T_51 ? 2'h0 : _ctrlSignals_T_180; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_182 = _ctrlSignals_T_49 ? 2'h0 : _ctrlSignals_T_181; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_183 = _ctrlSignals_T_47 ? 2'h0 : _ctrlSignals_T_182; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_184 = _ctrlSignals_T_45 ? 2'h0 : _ctrlSignals_T_183; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_185 = _ctrlSignals_T_43 ? 2'h0 : _ctrlSignals_T_184; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_186 = _ctrlSignals_T_41 ? 2'h0 : _ctrlSignals_T_185; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_187 = _ctrlSignals_T_39 ? 2'h0 : _ctrlSignals_T_186; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_188 = _ctrlSignals_T_37 ? 2'h0 : _ctrlSignals_T_187; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_189 = _ctrlSignals_T_35 ? 2'h0 : _ctrlSignals_T_188; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_190 = _ctrlSignals_T_33 ? 2'h0 : _ctrlSignals_T_189; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_191 = _ctrlSignals_T_31 ? 2'h0 : _ctrlSignals_T_190; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_192 = _ctrlSignals_T_29 ? 2'h0 : _ctrlSignals_T_191; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_193 = _ctrlSignals_T_27 ? 2'h0 : _ctrlSignals_T_192; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_194 = _ctrlSignals_T_25 ? 2'h0 : _ctrlSignals_T_193; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_195 = _ctrlSignals_T_23 ? 2'h0 : _ctrlSignals_T_194; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_196 = _ctrlSignals_T_21 ? 2'h0 : _ctrlSignals_T_195; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_197 = _ctrlSignals_T_19 ? 2'h0 : _ctrlSignals_T_196; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_198 = _ctrlSignals_T_17 ? 2'h0 : _ctrlSignals_T_197; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_199 = _ctrlSignals_T_15 ? 2'h0 : _ctrlSignals_T_198; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_200 = _ctrlSignals_T_13 ? 2'h0 : _ctrlSignals_T_199; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_201 = _ctrlSignals_T_11 ? 2'h0 : _ctrlSignals_T_200; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_202 = _ctrlSignals_T_9 ? 2'h0 : _ctrlSignals_T_201; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_203 = _ctrlSignals_T_7 ? 2'h1 : _ctrlSignals_T_202; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_204 = _ctrlSignals_T_5 ? 2'h1 : _ctrlSignals_T_203; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_205 = _ctrlSignals_T_3 ? 2'h0 : _ctrlSignals_T_204; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_243 = _ctrlSignals_T_63 | (_ctrlSignals_T_65 | (_ctrlSignals_T_67 | (_ctrlSignals_T_69 | (
    _ctrlSignals_T_71 | (_ctrlSignals_T_73 | (_ctrlSignals_T_75 | (_ctrlSignals_T_77 | (_ctrlSignals_T_79 | (
    _ctrlSignals_T_81 | (_ctrlSignals_T_83 | (_ctrlSignals_T_85 | (_ctrlSignals_T_87 | (_ctrlSignals_T_89 | (
    _ctrlSignals_T_91 | (_ctrlSignals_T_93 | (_ctrlSignals_T_95 | (_ctrlSignals_T_97 | (_ctrlSignals_T_99 | (
    _ctrlSignals_T_101 | (_ctrlSignals_T_103 | (_ctrlSignals_T_105 | (_ctrlSignals_T_107 | (_ctrlSignals_T_109 | (
    _ctrlSignals_T_111 | (_ctrlSignals_T_113 | (_ctrlSignals_T_115 | (_ctrlSignals_T_117 | (_ctrlSignals_T_119 | (
    _ctrlSignals_T_121 | _ctrlSignals_T_123))))))))))))))))))))))))))))); // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_265 = _ctrlSignals_T_19 ? 1'h0 : _ctrlSignals_T_21 | (_ctrlSignals_T_23 | (_ctrlSignals_T_25 | (
    _ctrlSignals_T_27 | (_ctrlSignals_T_29 | (_ctrlSignals_T_31 | (_ctrlSignals_T_33 | (_ctrlSignals_T_35 | (
    _ctrlSignals_T_37 | (_ctrlSignals_T_39 | (_ctrlSignals_T_41 | (_ctrlSignals_T_43 | (_ctrlSignals_T_45 | (
    _ctrlSignals_T_47 | (_ctrlSignals_T_49 | (_ctrlSignals_T_51 | (_ctrlSignals_T_53 | (_ctrlSignals_T_55 | (
    _ctrlSignals_T_57 | (_ctrlSignals_T_59 | (_ctrlSignals_T_61 | _ctrlSignals_T_243)))))))))))))))))))); // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_266 = _ctrlSignals_T_17 ? 1'h0 : _ctrlSignals_T_265; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_267 = _ctrlSignals_T_15 ? 1'h0 : _ctrlSignals_T_266; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_268 = _ctrlSignals_T_13 ? 1'h0 : _ctrlSignals_T_267; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_269 = _ctrlSignals_T_11 ? 1'h0 : _ctrlSignals_T_268; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_270 = _ctrlSignals_T_9 ? 1'h0 : _ctrlSignals_T_269; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_272 = _ctrlSignals_T_5 ? 1'h0 : _ctrlSignals_T_7 | _ctrlSignals_T_270; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_273 = _ctrlSignals_T_3 ? 1'h0 : _ctrlSignals_T_272; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_309 = _ctrlSignals_T_67 ? 1'h0 : _ctrlSignals_T_69 | (_ctrlSignals_T_71 | (_ctrlSignals_T_73 | (
    _ctrlSignals_T_75 | (_ctrlSignals_T_77 | (_ctrlSignals_T_79 | (_ctrlSignals_T_81 | (_ctrlSignals_T_83 | (
    _ctrlSignals_T_85 | (_ctrlSignals_T_87 | (_ctrlSignals_T_89 | (_ctrlSignals_T_91 | (_ctrlSignals_T_93 | (
    _ctrlSignals_T_95 | (_ctrlSignals_T_97 | (_ctrlSignals_T_99 | (_ctrlSignals_T_101 | (_ctrlSignals_T_103 | (
    _ctrlSignals_T_105 | (_ctrlSignals_T_107 | (_ctrlSignals_T_109 | (_ctrlSignals_T_111 | (_ctrlSignals_T_113 | (
    _ctrlSignals_T_115 | _ctrlSignals_T_117))))))))))))))))))))))); // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_310 = _ctrlSignals_T_65 ? 1'h0 : _ctrlSignals_T_309; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_311 = _ctrlSignals_T_63 ? 1'h0 : _ctrlSignals_T_310; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_312 = _ctrlSignals_T_61 ? 1'h0 : _ctrlSignals_T_311; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_313 = _ctrlSignals_T_59 ? 1'h0 : _ctrlSignals_T_312; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_314 = _ctrlSignals_T_57 ? 1'h0 : _ctrlSignals_T_313; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_315 = _ctrlSignals_T_55 ? 1'h0 : _ctrlSignals_T_314; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_316 = _ctrlSignals_T_53 ? 1'h0 : _ctrlSignals_T_315; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_317 = _ctrlSignals_T_51 ? 1'h0 : _ctrlSignals_T_316; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_318 = _ctrlSignals_T_49 ? 1'h0 : _ctrlSignals_T_317; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_319 = _ctrlSignals_T_47 ? 1'h0 : _ctrlSignals_T_318; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_320 = _ctrlSignals_T_45 ? 1'h0 : _ctrlSignals_T_319; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_321 = _ctrlSignals_T_43 ? 1'h0 : _ctrlSignals_T_320; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_322 = _ctrlSignals_T_41 ? 1'h0 : _ctrlSignals_T_321; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_323 = _ctrlSignals_T_39 ? 1'h0 : _ctrlSignals_T_322; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_324 = _ctrlSignals_T_37 ? 1'h0 : _ctrlSignals_T_323; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_325 = _ctrlSignals_T_35 ? 1'h0 : _ctrlSignals_T_324; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_326 = _ctrlSignals_T_33 ? 1'h0 : _ctrlSignals_T_325; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_327 = _ctrlSignals_T_31 ? 1'h0 : _ctrlSignals_T_326; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_328 = _ctrlSignals_T_29 ? 1'h0 : _ctrlSignals_T_327; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_329 = _ctrlSignals_T_27 ? 1'h0 : _ctrlSignals_T_328; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_330 = _ctrlSignals_T_25 ? 1'h0 : _ctrlSignals_T_329; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_331 = _ctrlSignals_T_23 ? 1'h0 : _ctrlSignals_T_330; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_332 = _ctrlSignals_T_21 ? 1'h0 : _ctrlSignals_T_331; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_333 = _ctrlSignals_T_19 ? 1'h0 : _ctrlSignals_T_332; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_334 = _ctrlSignals_T_17 ? 1'h0 : _ctrlSignals_T_333; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_335 = _ctrlSignals_T_15 ? 1'h0 : _ctrlSignals_T_334; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_336 = _ctrlSignals_T_13 ? 1'h0 : _ctrlSignals_T_335; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_337 = _ctrlSignals_T_11 ? 1'h0 : _ctrlSignals_T_336; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_338 = _ctrlSignals_T_9 ? 1'h0 : _ctrlSignals_T_337; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_339 = _ctrlSignals_T_7 ? 1'h0 : _ctrlSignals_T_338; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_340 = _ctrlSignals_T_5 ? 1'h0 : _ctrlSignals_T_339; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_341 = _ctrlSignals_T_3 ? 1'h0 : _ctrlSignals_T_340; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_352 = _ctrlSignals_T_117 ? 2'h1 : 2'h0; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_353 = _ctrlSignals_T_115 ? 2'h1 : _ctrlSignals_T_352; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_354 = _ctrlSignals_T_113 ? 2'h0 : _ctrlSignals_T_353; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_355 = _ctrlSignals_T_111 ? 2'h0 : _ctrlSignals_T_354; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_356 = _ctrlSignals_T_109 ? 2'h1 : _ctrlSignals_T_355; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_357 = _ctrlSignals_T_107 ? 2'h1 : _ctrlSignals_T_356; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_358 = _ctrlSignals_T_105 ? 2'h0 : _ctrlSignals_T_357; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_359 = _ctrlSignals_T_103 ? 2'h0 : _ctrlSignals_T_358; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_360 = _ctrlSignals_T_101 ? 2'h1 : _ctrlSignals_T_359; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_361 = _ctrlSignals_T_99 ? 2'h0 : _ctrlSignals_T_360; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_362 = _ctrlSignals_T_97 ? 2'h0 : _ctrlSignals_T_361; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_363 = _ctrlSignals_T_95 ? 2'h0 : _ctrlSignals_T_362; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_364 = _ctrlSignals_T_93 ? 2'h1 : _ctrlSignals_T_363; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_365 = _ctrlSignals_T_91 ? 2'h0 : _ctrlSignals_T_364; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_366 = _ctrlSignals_T_89 ? 2'h1 : _ctrlSignals_T_365; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_367 = _ctrlSignals_T_87 ? 2'h0 : _ctrlSignals_T_366; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_368 = _ctrlSignals_T_85 ? 2'h0 : _ctrlSignals_T_367; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_369 = _ctrlSignals_T_83 ? 2'h0 : _ctrlSignals_T_368; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_370 = _ctrlSignals_T_81 ? 2'h0 : _ctrlSignals_T_369; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_371 = _ctrlSignals_T_79 ? 2'h1 : _ctrlSignals_T_370; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_372 = _ctrlSignals_T_77 ? 2'h0 : _ctrlSignals_T_371; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_373 = _ctrlSignals_T_75 ? 2'h1 : _ctrlSignals_T_372; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_374 = _ctrlSignals_T_73 ? 2'h0 : _ctrlSignals_T_373; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_375 = _ctrlSignals_T_71 ? 2'h1 : _ctrlSignals_T_374; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_376 = _ctrlSignals_T_69 ? 2'h0 : _ctrlSignals_T_375; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_377 = _ctrlSignals_T_67 ? 2'h1 : _ctrlSignals_T_376; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_378 = _ctrlSignals_T_65 ? 2'h0 : _ctrlSignals_T_377; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_379 = _ctrlSignals_T_63 ? 2'h1 : _ctrlSignals_T_378; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_380 = _ctrlSignals_T_61 ? 2'h0 : _ctrlSignals_T_379; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_381 = _ctrlSignals_T_59 ? 2'h1 : _ctrlSignals_T_380; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_382 = _ctrlSignals_T_57 ? 2'h0 : _ctrlSignals_T_381; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_383 = _ctrlSignals_T_55 ? 2'h0 : _ctrlSignals_T_382; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_384 = _ctrlSignals_T_53 ? 2'h0 : _ctrlSignals_T_383; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_385 = _ctrlSignals_T_51 ? 2'h0 : _ctrlSignals_T_384; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_386 = _ctrlSignals_T_49 ? 2'h0 : _ctrlSignals_T_385; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_387 = _ctrlSignals_T_47 ? 2'h0 : _ctrlSignals_T_386; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_388 = _ctrlSignals_T_45 ? 2'h1 : _ctrlSignals_T_387; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_389 = _ctrlSignals_T_43 ? 2'h0 : _ctrlSignals_T_388; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_390 = _ctrlSignals_T_41 ? 2'h0 : _ctrlSignals_T_389; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_391 = _ctrlSignals_T_39 ? 2'h0 : _ctrlSignals_T_390; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_392 = _ctrlSignals_T_37 ? 2'h0 : _ctrlSignals_T_391; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_393 = _ctrlSignals_T_35 ? 2'h0 : _ctrlSignals_T_392; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_394 = _ctrlSignals_T_33 ? 2'h0 : _ctrlSignals_T_393; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_395 = _ctrlSignals_T_31 ? 2'h0 : _ctrlSignals_T_394; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_396 = _ctrlSignals_T_29 ? 2'h0 : _ctrlSignals_T_395; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_397 = _ctrlSignals_T_27 ? 2'h0 : _ctrlSignals_T_396; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_398 = _ctrlSignals_T_25 ? 2'h0 : _ctrlSignals_T_397; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_399 = _ctrlSignals_T_23 ? 2'h0 : _ctrlSignals_T_398; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_400 = _ctrlSignals_T_21 ? 2'h0 : _ctrlSignals_T_399; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_401 = _ctrlSignals_T_19 ? 2'h0 : _ctrlSignals_T_400; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_402 = _ctrlSignals_T_17 ? 2'h0 : _ctrlSignals_T_401; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_403 = _ctrlSignals_T_15 ? 2'h0 : _ctrlSignals_T_402; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_404 = _ctrlSignals_T_13 ? 2'h0 : _ctrlSignals_T_403; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_405 = _ctrlSignals_T_11 ? 2'h0 : _ctrlSignals_T_404; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_406 = _ctrlSignals_T_9 ? 2'h0 : _ctrlSignals_T_405; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_407 = _ctrlSignals_T_7 ? 2'h0 : _ctrlSignals_T_406; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_408 = _ctrlSignals_T_5 ? 2'h0 : _ctrlSignals_T_407; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_409 = _ctrlSignals_T_3 ? 2'h0 : _ctrlSignals_T_408; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_410 = _ctrlSignals_T_137 ? 3'h0 : 3'h3; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_411 = _ctrlSignals_T_135 ? 3'h0 : _ctrlSignals_T_410; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_412 = _ctrlSignals_T_133 ? 3'h0 : _ctrlSignals_T_411; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_413 = _ctrlSignals_T_131 ? 3'h0 : _ctrlSignals_T_412; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_414 = _ctrlSignals_T_129 ? 3'h6 : _ctrlSignals_T_413; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_415 = _ctrlSignals_T_127 ? 3'h6 : _ctrlSignals_T_414; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_416 = _ctrlSignals_T_125 ? 3'h6 : _ctrlSignals_T_415; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_417 = _ctrlSignals_T_123 ? 3'h0 : _ctrlSignals_T_416; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_418 = _ctrlSignals_T_121 ? 3'h0 : _ctrlSignals_T_417; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_419 = _ctrlSignals_T_119 ? 3'h0 : _ctrlSignals_T_418; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_420 = _ctrlSignals_T_117 ? 3'h0 : _ctrlSignals_T_419; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_421 = _ctrlSignals_T_115 ? 3'h0 : _ctrlSignals_T_420; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_422 = _ctrlSignals_T_113 ? 3'h0 : _ctrlSignals_T_421; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_423 = _ctrlSignals_T_111 ? 3'h0 : _ctrlSignals_T_422; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_424 = _ctrlSignals_T_109 ? 3'h0 : _ctrlSignals_T_423; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_425 = _ctrlSignals_T_107 ? 3'h0 : _ctrlSignals_T_424; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_426 = _ctrlSignals_T_105 ? 3'h0 : _ctrlSignals_T_425; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_427 = _ctrlSignals_T_103 ? 3'h0 : _ctrlSignals_T_426; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_428 = _ctrlSignals_T_101 ? 3'h0 : _ctrlSignals_T_427; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_429 = _ctrlSignals_T_99 ? 3'h0 : _ctrlSignals_T_428; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_430 = _ctrlSignals_T_97 ? 3'h0 : _ctrlSignals_T_429; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_431 = _ctrlSignals_T_95 ? 3'h0 : _ctrlSignals_T_430; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_432 = _ctrlSignals_T_93 ? 3'h0 : _ctrlSignals_T_431; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_433 = _ctrlSignals_T_91 ? 3'h0 : _ctrlSignals_T_432; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_434 = _ctrlSignals_T_89 ? 3'h0 : _ctrlSignals_T_433; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_435 = _ctrlSignals_T_87 ? 3'h0 : _ctrlSignals_T_434; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_436 = _ctrlSignals_T_85 ? 3'h0 : _ctrlSignals_T_435; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_437 = _ctrlSignals_T_83 ? 3'h0 : _ctrlSignals_T_436; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_438 = _ctrlSignals_T_81 ? 3'h0 : _ctrlSignals_T_437; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_439 = _ctrlSignals_T_79 ? 3'h0 : _ctrlSignals_T_438; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_440 = _ctrlSignals_T_77 ? 3'h0 : _ctrlSignals_T_439; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_441 = _ctrlSignals_T_75 ? 3'h0 : _ctrlSignals_T_440; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_442 = _ctrlSignals_T_73 ? 3'h0 : _ctrlSignals_T_441; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_443 = _ctrlSignals_T_71 ? 3'h0 : _ctrlSignals_T_442; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_444 = _ctrlSignals_T_69 ? 3'h0 : _ctrlSignals_T_443; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_445 = _ctrlSignals_T_67 ? 3'h1 : _ctrlSignals_T_444; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_446 = _ctrlSignals_T_65 ? 3'h1 : _ctrlSignals_T_445; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_447 = _ctrlSignals_T_63 ? 3'h1 : _ctrlSignals_T_446; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_448 = _ctrlSignals_T_61 ? 3'h1 : _ctrlSignals_T_447; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_449 = _ctrlSignals_T_59 ? 3'h1 : _ctrlSignals_T_448; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_450 = _ctrlSignals_T_57 ? 3'h1 : _ctrlSignals_T_449; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_451 = _ctrlSignals_T_55 ? 3'h1 : _ctrlSignals_T_450; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_452 = _ctrlSignals_T_53 ? 3'h1 : _ctrlSignals_T_451; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_453 = _ctrlSignals_T_51 ? 3'h1 : _ctrlSignals_T_452; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_454 = _ctrlSignals_T_49 ? 3'h1 : _ctrlSignals_T_453; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_455 = _ctrlSignals_T_47 ? 3'h1 : _ctrlSignals_T_454; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_456 = _ctrlSignals_T_45 ? 3'h1 : _ctrlSignals_T_455; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_457 = _ctrlSignals_T_43 ? 3'h1 : _ctrlSignals_T_456; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_458 = _ctrlSignals_T_41 ? 3'h2 : _ctrlSignals_T_457; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_459 = _ctrlSignals_T_39 ? 3'h2 : _ctrlSignals_T_458; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_460 = _ctrlSignals_T_37 ? 3'h2 : _ctrlSignals_T_459; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_461 = _ctrlSignals_T_35 ? 3'h2 : _ctrlSignals_T_460; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_462 = _ctrlSignals_T_33 ? 3'h1 : _ctrlSignals_T_461; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_463 = _ctrlSignals_T_31 ? 3'h1 : _ctrlSignals_T_462; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_464 = _ctrlSignals_T_29 ? 3'h1 : _ctrlSignals_T_463; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_465 = _ctrlSignals_T_27 ? 3'h1 : _ctrlSignals_T_464; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_466 = _ctrlSignals_T_25 ? 3'h1 : _ctrlSignals_T_465; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_467 = _ctrlSignals_T_23 ? 3'h1 : _ctrlSignals_T_466; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_468 = _ctrlSignals_T_21 ? 3'h1 : _ctrlSignals_T_467; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_469 = _ctrlSignals_T_19 ? 3'h5 : _ctrlSignals_T_468; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_470 = _ctrlSignals_T_17 ? 3'h5 : _ctrlSignals_T_469; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_471 = _ctrlSignals_T_15 ? 3'h5 : _ctrlSignals_T_470; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_472 = _ctrlSignals_T_13 ? 3'h5 : _ctrlSignals_T_471; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_473 = _ctrlSignals_T_11 ? 3'h5 : _ctrlSignals_T_472; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_474 = _ctrlSignals_T_9 ? 3'h5 : _ctrlSignals_T_473; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_475 = _ctrlSignals_T_7 ? 3'h1 : _ctrlSignals_T_474; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_476 = _ctrlSignals_T_5 ? 3'h4 : _ctrlSignals_T_475; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_477 = _ctrlSignals_T_3 ? 3'h3 : _ctrlSignals_T_476; // @[Lookup.scala 34:39]
  wire [4:0] _ctrlSignals_T_478 = _ctrlSignals_T_137 ? 5'h11 : 5'hb; // @[Lookup.scala 34:39]
  wire [4:0] _ctrlSignals_T_479 = _ctrlSignals_T_135 ? 5'h11 : _ctrlSignals_T_478; // @[Lookup.scala 34:39]
  wire [4:0] _ctrlSignals_T_480 = _ctrlSignals_T_133 ? 5'h11 : _ctrlSignals_T_479; // @[Lookup.scala 34:39]
  wire [4:0] _ctrlSignals_T_481 = _ctrlSignals_T_131 ? 5'h11 : _ctrlSignals_T_480; // @[Lookup.scala 34:39]
  wire [4:0] _ctrlSignals_T_482 = _ctrlSignals_T_129 ? 5'h11 : _ctrlSignals_T_481; // @[Lookup.scala 34:39]
  wire [4:0] _ctrlSignals_T_483 = _ctrlSignals_T_127 ? 5'h11 : _ctrlSignals_T_482; // @[Lookup.scala 34:39]
  wire [4:0] _ctrlSignals_T_484 = _ctrlSignals_T_125 ? 5'h11 : _ctrlSignals_T_483; // @[Lookup.scala 34:39]
  wire [4:0] _ctrlSignals_T_485 = _ctrlSignals_T_123 ? 5'ha : _ctrlSignals_T_484; // @[Lookup.scala 34:39]
  wire [4:0] _ctrlSignals_T_486 = _ctrlSignals_T_121 ? 5'ha : _ctrlSignals_T_485; // @[Lookup.scala 34:39]
  wire [4:0] _ctrlSignals_T_487 = _ctrlSignals_T_119 ? 5'ha : _ctrlSignals_T_486; // @[Lookup.scala 34:39]
  wire [4:0] _ctrlSignals_T_488 = _ctrlSignals_T_117 ? 5'h10 : _ctrlSignals_T_487; // @[Lookup.scala 34:39]
  wire [4:0] _ctrlSignals_T_489 = _ctrlSignals_T_115 ? 5'he : _ctrlSignals_T_488; // @[Lookup.scala 34:39]
  wire [4:0] _ctrlSignals_T_490 = _ctrlSignals_T_113 ? 5'h10 : _ctrlSignals_T_489; // @[Lookup.scala 34:39]
  wire [4:0] _ctrlSignals_T_491 = _ctrlSignals_T_111 ? 5'he : _ctrlSignals_T_490; // @[Lookup.scala 34:39]
  wire [4:0] _ctrlSignals_T_492 = _ctrlSignals_T_109 ? 5'hf : _ctrlSignals_T_491; // @[Lookup.scala 34:39]
  wire [4:0] _ctrlSignals_T_493 = _ctrlSignals_T_107 ? 5'hd : _ctrlSignals_T_492; // @[Lookup.scala 34:39]
  wire [4:0] _ctrlSignals_T_494 = _ctrlSignals_T_105 ? 5'hf : _ctrlSignals_T_493; // @[Lookup.scala 34:39]
  wire [4:0] _ctrlSignals_T_495 = _ctrlSignals_T_103 ? 5'hd : _ctrlSignals_T_494; // @[Lookup.scala 34:39]
  wire [4:0] _ctrlSignals_T_496 = _ctrlSignals_T_101 ? 5'hc : _ctrlSignals_T_495; // @[Lookup.scala 34:39]
  wire [4:0] _ctrlSignals_T_497 = _ctrlSignals_T_99 ? 5'hc : _ctrlSignals_T_496; // @[Lookup.scala 34:39]
  wire [4:0] _ctrlSignals_T_498 = _ctrlSignals_T_97 ? 5'h2 : _ctrlSignals_T_497; // @[Lookup.scala 34:39]
  wire [4:0] _ctrlSignals_T_499 = _ctrlSignals_T_95 ? 5'h3 : _ctrlSignals_T_498; // @[Lookup.scala 34:39]
  wire [4:0] _ctrlSignals_T_500 = _ctrlSignals_T_93 ? 5'h9 : _ctrlSignals_T_499; // @[Lookup.scala 34:39]
  wire [4:0] _ctrlSignals_T_501 = _ctrlSignals_T_91 ? 5'h9 : _ctrlSignals_T_500; // @[Lookup.scala 34:39]
  wire [4:0] _ctrlSignals_T_502 = _ctrlSignals_T_89 ? 5'h8 : _ctrlSignals_T_501; // @[Lookup.scala 34:39]
  wire [4:0] _ctrlSignals_T_503 = _ctrlSignals_T_87 ? 5'h8 : _ctrlSignals_T_502; // @[Lookup.scala 34:39]
  wire [4:0] _ctrlSignals_T_504 = _ctrlSignals_T_85 ? 5'h4 : _ctrlSignals_T_503; // @[Lookup.scala 34:39]
  wire [4:0] _ctrlSignals_T_505 = _ctrlSignals_T_83 ? 5'h7 : _ctrlSignals_T_504; // @[Lookup.scala 34:39]
  wire [4:0] _ctrlSignals_T_506 = _ctrlSignals_T_81 ? 5'h5 : _ctrlSignals_T_505; // @[Lookup.scala 34:39]
  wire [4:0] _ctrlSignals_T_507 = _ctrlSignals_T_79 ? 5'h6 : _ctrlSignals_T_506; // @[Lookup.scala 34:39]
  wire [4:0] _ctrlSignals_T_508 = _ctrlSignals_T_77 ? 5'h6 : _ctrlSignals_T_507; // @[Lookup.scala 34:39]
  wire [4:0] _ctrlSignals_T_509 = _ctrlSignals_T_75 ? 5'h1 : _ctrlSignals_T_508; // @[Lookup.scala 34:39]
  wire [4:0] _ctrlSignals_T_510 = _ctrlSignals_T_73 ? 5'h1 : _ctrlSignals_T_509; // @[Lookup.scala 34:39]
  wire [4:0] _ctrlSignals_T_511 = _ctrlSignals_T_71 ? 5'h0 : _ctrlSignals_T_510; // @[Lookup.scala 34:39]
  wire [4:0] _ctrlSignals_T_512 = _ctrlSignals_T_69 ? 5'h0 : _ctrlSignals_T_511; // @[Lookup.scala 34:39]
  wire [4:0] _ctrlSignals_T_513 = _ctrlSignals_T_67 ? 5'h9 : _ctrlSignals_T_512; // @[Lookup.scala 34:39]
  wire [4:0] _ctrlSignals_T_514 = _ctrlSignals_T_65 ? 5'h9 : _ctrlSignals_T_513; // @[Lookup.scala 34:39]
  wire [4:0] _ctrlSignals_T_515 = _ctrlSignals_T_63 ? 5'h8 : _ctrlSignals_T_514; // @[Lookup.scala 34:39]
  wire [4:0] _ctrlSignals_T_516 = _ctrlSignals_T_61 ? 5'h8 : _ctrlSignals_T_515; // @[Lookup.scala 34:39]
  wire [4:0] _ctrlSignals_T_517 = _ctrlSignals_T_59 ? 5'h6 : _ctrlSignals_T_516; // @[Lookup.scala 34:39]
  wire [4:0] _ctrlSignals_T_518 = _ctrlSignals_T_57 ? 5'h6 : _ctrlSignals_T_517; // @[Lookup.scala 34:39]
  wire [4:0] _ctrlSignals_T_519 = _ctrlSignals_T_55 ? 5'h2 : _ctrlSignals_T_518; // @[Lookup.scala 34:39]
  wire [4:0] _ctrlSignals_T_520 = _ctrlSignals_T_53 ? 5'h3 : _ctrlSignals_T_519; // @[Lookup.scala 34:39]
  wire [4:0] _ctrlSignals_T_521 = _ctrlSignals_T_51 ? 5'h4 : _ctrlSignals_T_520; // @[Lookup.scala 34:39]
  wire [4:0] _ctrlSignals_T_522 = _ctrlSignals_T_49 ? 5'h7 : _ctrlSignals_T_521; // @[Lookup.scala 34:39]
  wire [4:0] _ctrlSignals_T_523 = _ctrlSignals_T_47 ? 5'h5 : _ctrlSignals_T_522; // @[Lookup.scala 34:39]
  wire [4:0] _ctrlSignals_T_524 = _ctrlSignals_T_45 ? 5'h0 : _ctrlSignals_T_523; // @[Lookup.scala 34:39]
  wire [4:0] _ctrlSignals_T_525 = _ctrlSignals_T_43 ? 5'h0 : _ctrlSignals_T_524; // @[Lookup.scala 34:39]
  wire [4:0] _ctrlSignals_T_526 = _ctrlSignals_T_41 ? 5'h0 : _ctrlSignals_T_525; // @[Lookup.scala 34:39]
  wire [4:0] _ctrlSignals_T_527 = _ctrlSignals_T_39 ? 5'h0 : _ctrlSignals_T_526; // @[Lookup.scala 34:39]
  wire [4:0] _ctrlSignals_T_528 = _ctrlSignals_T_37 ? 5'h0 : _ctrlSignals_T_527; // @[Lookup.scala 34:39]
  wire [4:0] _ctrlSignals_T_529 = _ctrlSignals_T_35 ? 5'h0 : _ctrlSignals_T_528; // @[Lookup.scala 34:39]
  wire [4:0] _ctrlSignals_T_530 = _ctrlSignals_T_33 ? 5'h0 : _ctrlSignals_T_529; // @[Lookup.scala 34:39]
  wire [4:0] _ctrlSignals_T_531 = _ctrlSignals_T_31 ? 5'h0 : _ctrlSignals_T_530; // @[Lookup.scala 34:39]
  wire [4:0] _ctrlSignals_T_532 = _ctrlSignals_T_29 ? 5'h0 : _ctrlSignals_T_531; // @[Lookup.scala 34:39]
  wire [4:0] _ctrlSignals_T_533 = _ctrlSignals_T_27 ? 5'h0 : _ctrlSignals_T_532; // @[Lookup.scala 34:39]
  wire [4:0] _ctrlSignals_T_534 = _ctrlSignals_T_25 ? 5'h0 : _ctrlSignals_T_533; // @[Lookup.scala 34:39]
  wire [4:0] _ctrlSignals_T_535 = _ctrlSignals_T_23 ? 5'h0 : _ctrlSignals_T_534; // @[Lookup.scala 34:39]
  wire [4:0] _ctrlSignals_T_536 = _ctrlSignals_T_21 ? 5'h0 : _ctrlSignals_T_535; // @[Lookup.scala 34:39]
  wire [4:0] _ctrlSignals_T_537 = _ctrlSignals_T_19 ? 5'h0 : _ctrlSignals_T_536; // @[Lookup.scala 34:39]
  wire [4:0] _ctrlSignals_T_538 = _ctrlSignals_T_17 ? 5'h0 : _ctrlSignals_T_537; // @[Lookup.scala 34:39]
  wire [4:0] _ctrlSignals_T_539 = _ctrlSignals_T_15 ? 5'h0 : _ctrlSignals_T_538; // @[Lookup.scala 34:39]
  wire [4:0] _ctrlSignals_T_540 = _ctrlSignals_T_13 ? 5'h0 : _ctrlSignals_T_539; // @[Lookup.scala 34:39]
  wire [4:0] _ctrlSignals_T_541 = _ctrlSignals_T_11 ? 5'h0 : _ctrlSignals_T_540; // @[Lookup.scala 34:39]
  wire [4:0] _ctrlSignals_T_542 = _ctrlSignals_T_9 ? 5'h0 : _ctrlSignals_T_541; // @[Lookup.scala 34:39]
  wire [4:0] _ctrlSignals_T_543 = _ctrlSignals_T_7 ? 5'h0 : _ctrlSignals_T_542; // @[Lookup.scala 34:39]
  wire [4:0] _ctrlSignals_T_544 = _ctrlSignals_T_5 ? 5'h0 : _ctrlSignals_T_543; // @[Lookup.scala 34:39]
  wire [4:0] _ctrlSignals_T_545 = _ctrlSignals_T_3 ? 5'h0 : _ctrlSignals_T_544; // @[Lookup.scala 34:39]
  wire [4:0] ctrlSignals_5 = _ctrlSignals_T_1 ? 5'hb : _ctrlSignals_T_545; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_605 = _ctrlSignals_T_19 ? 3'h4 : 3'h0; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_606 = _ctrlSignals_T_17 ? 3'h1 : _ctrlSignals_T_605; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_607 = _ctrlSignals_T_15 ? 3'h5 : _ctrlSignals_T_606; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_608 = _ctrlSignals_T_13 ? 3'h2 : _ctrlSignals_T_607; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_609 = _ctrlSignals_T_11 ? 3'h6 : _ctrlSignals_T_608; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_610 = _ctrlSignals_T_9 ? 3'h3 : _ctrlSignals_T_609; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_611 = _ctrlSignals_T_7 ? 3'h0 : _ctrlSignals_T_610; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_612 = _ctrlSignals_T_5 ? 3'h0 : _ctrlSignals_T_611; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_613 = _ctrlSignals_T_3 ? 3'h0 : _ctrlSignals_T_612; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_662 = _ctrlSignals_T_41 ? 3'h4 : 3'h0; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_663 = _ctrlSignals_T_39 ? 3'h1 : _ctrlSignals_T_662; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_664 = _ctrlSignals_T_37 ? 3'h2 : _ctrlSignals_T_663; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_665 = _ctrlSignals_T_35 ? 3'h3 : _ctrlSignals_T_664; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_666 = _ctrlSignals_T_33 ? 3'h0 : _ctrlSignals_T_665; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_667 = _ctrlSignals_T_31 ? 3'h0 : _ctrlSignals_T_666; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_668 = _ctrlSignals_T_29 ? 3'h0 : _ctrlSignals_T_667; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_669 = _ctrlSignals_T_27 ? 3'h0 : _ctrlSignals_T_668; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_670 = _ctrlSignals_T_25 ? 3'h0 : _ctrlSignals_T_669; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_671 = _ctrlSignals_T_23 ? 3'h0 : _ctrlSignals_T_670; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_672 = _ctrlSignals_T_21 ? 3'h0 : _ctrlSignals_T_671; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_673 = _ctrlSignals_T_19 ? 3'h0 : _ctrlSignals_T_672; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_674 = _ctrlSignals_T_17 ? 3'h0 : _ctrlSignals_T_673; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_675 = _ctrlSignals_T_15 ? 3'h0 : _ctrlSignals_T_674; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_676 = _ctrlSignals_T_13 ? 3'h0 : _ctrlSignals_T_675; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_677 = _ctrlSignals_T_11 ? 3'h0 : _ctrlSignals_T_676; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_678 = _ctrlSignals_T_9 ? 3'h0 : _ctrlSignals_T_677; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_679 = _ctrlSignals_T_7 ? 3'h0 : _ctrlSignals_T_678; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_680 = _ctrlSignals_T_5 ? 3'h0 : _ctrlSignals_T_679; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_681 = _ctrlSignals_T_3 ? 3'h0 : _ctrlSignals_T_680; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_734 = _ctrlSignals_T_33 ? 3'h7 : 3'h0; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_735 = _ctrlSignals_T_31 ? 3'h6 : _ctrlSignals_T_734; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_736 = _ctrlSignals_T_29 ? 3'h4 : _ctrlSignals_T_735; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_737 = _ctrlSignals_T_27 ? 3'h5 : _ctrlSignals_T_736; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_738 = _ctrlSignals_T_25 ? 3'h1 : _ctrlSignals_T_737; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_739 = _ctrlSignals_T_23 ? 3'h2 : _ctrlSignals_T_738; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_740 = _ctrlSignals_T_21 ? 3'h3 : _ctrlSignals_T_739; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_741 = _ctrlSignals_T_19 ? 3'h0 : _ctrlSignals_T_740; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_742 = _ctrlSignals_T_17 ? 3'h0 : _ctrlSignals_T_741; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_743 = _ctrlSignals_T_15 ? 3'h0 : _ctrlSignals_T_742; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_744 = _ctrlSignals_T_13 ? 3'h0 : _ctrlSignals_T_743; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_745 = _ctrlSignals_T_11 ? 3'h0 : _ctrlSignals_T_744; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_746 = _ctrlSignals_T_9 ? 3'h0 : _ctrlSignals_T_745; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_747 = _ctrlSignals_T_7 ? 3'h0 : _ctrlSignals_T_746; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_748 = _ctrlSignals_T_5 ? 3'h0 : _ctrlSignals_T_747; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_749 = _ctrlSignals_T_3 ? 3'h0 : _ctrlSignals_T_748; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_750 = _ctrlSignals_T_137 ? 2'h3 : 2'h0; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_751 = _ctrlSignals_T_135 ? 2'h3 : _ctrlSignals_T_750; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_752 = _ctrlSignals_T_133 ? 2'h3 : _ctrlSignals_T_751; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_753 = _ctrlSignals_T_131 ? 2'h3 : _ctrlSignals_T_752; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_754 = _ctrlSignals_T_129 ? 2'h3 : _ctrlSignals_T_753; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_755 = _ctrlSignals_T_127 ? 2'h3 : _ctrlSignals_T_754; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_756 = _ctrlSignals_T_125 ? 2'h3 : _ctrlSignals_T_755; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_757 = _ctrlSignals_T_123 ? 2'h3 : _ctrlSignals_T_756; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_758 = _ctrlSignals_T_121 ? 2'h3 : _ctrlSignals_T_757; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_759 = _ctrlSignals_T_119 ? 2'h3 : _ctrlSignals_T_758; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_760 = _ctrlSignals_T_117 ? 2'h0 : _ctrlSignals_T_759; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_761 = _ctrlSignals_T_115 ? 2'h0 : _ctrlSignals_T_760; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_762 = _ctrlSignals_T_113 ? 2'h0 : _ctrlSignals_T_761; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_763 = _ctrlSignals_T_111 ? 2'h0 : _ctrlSignals_T_762; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_764 = _ctrlSignals_T_109 ? 2'h0 : _ctrlSignals_T_763; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_765 = _ctrlSignals_T_107 ? 2'h0 : _ctrlSignals_T_764; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_766 = _ctrlSignals_T_105 ? 2'h0 : _ctrlSignals_T_765; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_767 = _ctrlSignals_T_103 ? 2'h0 : _ctrlSignals_T_766; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_768 = _ctrlSignals_T_101 ? 2'h0 : _ctrlSignals_T_767; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_769 = _ctrlSignals_T_99 ? 2'h0 : _ctrlSignals_T_768; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_770 = _ctrlSignals_T_97 ? 2'h0 : _ctrlSignals_T_769; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_771 = _ctrlSignals_T_95 ? 2'h0 : _ctrlSignals_T_770; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_772 = _ctrlSignals_T_93 ? 2'h0 : _ctrlSignals_T_771; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_773 = _ctrlSignals_T_91 ? 2'h0 : _ctrlSignals_T_772; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_774 = _ctrlSignals_T_89 ? 2'h0 : _ctrlSignals_T_773; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_775 = _ctrlSignals_T_87 ? 2'h0 : _ctrlSignals_T_774; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_776 = _ctrlSignals_T_85 ? 2'h0 : _ctrlSignals_T_775; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_777 = _ctrlSignals_T_83 ? 2'h0 : _ctrlSignals_T_776; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_778 = _ctrlSignals_T_81 ? 2'h0 : _ctrlSignals_T_777; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_779 = _ctrlSignals_T_79 ? 2'h0 : _ctrlSignals_T_778; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_780 = _ctrlSignals_T_77 ? 2'h0 : _ctrlSignals_T_779; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_781 = _ctrlSignals_T_75 ? 2'h0 : _ctrlSignals_T_780; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_782 = _ctrlSignals_T_73 ? 2'h0 : _ctrlSignals_T_781; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_783 = _ctrlSignals_T_71 ? 2'h0 : _ctrlSignals_T_782; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_784 = _ctrlSignals_T_69 ? 2'h0 : _ctrlSignals_T_783; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_785 = _ctrlSignals_T_67 ? 2'h0 : _ctrlSignals_T_784; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_786 = _ctrlSignals_T_65 ? 2'h0 : _ctrlSignals_T_785; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_787 = _ctrlSignals_T_63 ? 2'h0 : _ctrlSignals_T_786; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_788 = _ctrlSignals_T_61 ? 2'h0 : _ctrlSignals_T_787; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_789 = _ctrlSignals_T_59 ? 2'h0 : _ctrlSignals_T_788; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_790 = _ctrlSignals_T_57 ? 2'h0 : _ctrlSignals_T_789; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_791 = _ctrlSignals_T_55 ? 2'h0 : _ctrlSignals_T_790; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_792 = _ctrlSignals_T_53 ? 2'h0 : _ctrlSignals_T_791; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_793 = _ctrlSignals_T_51 ? 2'h0 : _ctrlSignals_T_792; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_794 = _ctrlSignals_T_49 ? 2'h0 : _ctrlSignals_T_793; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_795 = _ctrlSignals_T_47 ? 2'h0 : _ctrlSignals_T_794; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_796 = _ctrlSignals_T_45 ? 2'h0 : _ctrlSignals_T_795; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_797 = _ctrlSignals_T_43 ? 2'h0 : _ctrlSignals_T_796; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_798 = _ctrlSignals_T_41 ? 2'h0 : _ctrlSignals_T_797; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_799 = _ctrlSignals_T_39 ? 2'h0 : _ctrlSignals_T_798; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_800 = _ctrlSignals_T_37 ? 2'h0 : _ctrlSignals_T_799; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_801 = _ctrlSignals_T_35 ? 2'h0 : _ctrlSignals_T_800; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_802 = _ctrlSignals_T_33 ? 2'h1 : _ctrlSignals_T_801; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_803 = _ctrlSignals_T_31 ? 2'h1 : _ctrlSignals_T_802; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_804 = _ctrlSignals_T_29 ? 2'h1 : _ctrlSignals_T_803; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_805 = _ctrlSignals_T_27 ? 2'h1 : _ctrlSignals_T_804; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_806 = _ctrlSignals_T_25 ? 2'h1 : _ctrlSignals_T_805; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_807 = _ctrlSignals_T_23 ? 2'h1 : _ctrlSignals_T_806; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_808 = _ctrlSignals_T_21 ? 2'h1 : _ctrlSignals_T_807; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_809 = _ctrlSignals_T_19 ? 2'h0 : _ctrlSignals_T_808; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_810 = _ctrlSignals_T_17 ? 2'h0 : _ctrlSignals_T_809; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_811 = _ctrlSignals_T_15 ? 2'h0 : _ctrlSignals_T_810; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_812 = _ctrlSignals_T_13 ? 2'h0 : _ctrlSignals_T_811; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_813 = _ctrlSignals_T_11 ? 2'h0 : _ctrlSignals_T_812; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_814 = _ctrlSignals_T_9 ? 2'h0 : _ctrlSignals_T_813; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_815 = _ctrlSignals_T_7 ? 2'h2 : _ctrlSignals_T_814; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_816 = _ctrlSignals_T_5 ? 2'h2 : _ctrlSignals_T_815; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_817 = _ctrlSignals_T_3 ? 2'h0 : _ctrlSignals_T_816; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_818 = _ctrlSignals_T_137 ? 1'h0 : 1'h1; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_819 = _ctrlSignals_T_135 ? 1'h0 : _ctrlSignals_T_818; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_820 = _ctrlSignals_T_133 ? 1'h0 : _ctrlSignals_T_819; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_821 = _ctrlSignals_T_131 ? 1'h0 : _ctrlSignals_T_820; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_851 = _ctrlSignals_T_71 | (_ctrlSignals_T_73 | (_ctrlSignals_T_75 | (_ctrlSignals_T_77 | (
    _ctrlSignals_T_79 | (_ctrlSignals_T_81 | (_ctrlSignals_T_83 | (_ctrlSignals_T_85 | (_ctrlSignals_T_87 | (
    _ctrlSignals_T_89 | (_ctrlSignals_T_91 | (_ctrlSignals_T_93 | (_ctrlSignals_T_95 | (_ctrlSignals_T_97 | (
    _ctrlSignals_T_99 | (_ctrlSignals_T_101 | (_ctrlSignals_T_103 | (_ctrlSignals_T_105 | (_ctrlSignals_T_107 | (
    _ctrlSignals_T_109 | (_ctrlSignals_T_111 | (_ctrlSignals_T_113 | (_ctrlSignals_T_115 | (_ctrlSignals_T_117 | (
    _ctrlSignals_T_119 | (_ctrlSignals_T_121 | (_ctrlSignals_T_123 | (_ctrlSignals_T_125 | (_ctrlSignals_T_127 | (
    _ctrlSignals_T_129 | _ctrlSignals_T_821))))))))))))))))))))))))))))); // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_866 = _ctrlSignals_T_41 ? 1'h0 : _ctrlSignals_T_43 | (_ctrlSignals_T_45 | (_ctrlSignals_T_47 | (
    _ctrlSignals_T_49 | (_ctrlSignals_T_51 | (_ctrlSignals_T_53 | (_ctrlSignals_T_55 | (_ctrlSignals_T_57 | (
    _ctrlSignals_T_59 | (_ctrlSignals_T_61 | (_ctrlSignals_T_63 | (_ctrlSignals_T_65 | (_ctrlSignals_T_67 | (
    _ctrlSignals_T_69 | _ctrlSignals_T_851))))))))))))); // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_867 = _ctrlSignals_T_39 ? 1'h0 : _ctrlSignals_T_866; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_868 = _ctrlSignals_T_37 ? 1'h0 : _ctrlSignals_T_867; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_869 = _ctrlSignals_T_35 ? 1'h0 : _ctrlSignals_T_868; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_877 = _ctrlSignals_T_19 ? 1'h0 : _ctrlSignals_T_21 | (_ctrlSignals_T_23 | (_ctrlSignals_T_25 | (
    _ctrlSignals_T_27 | (_ctrlSignals_T_29 | (_ctrlSignals_T_31 | (_ctrlSignals_T_33 | _ctrlSignals_T_869)))))); // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_878 = _ctrlSignals_T_17 ? 1'h0 : _ctrlSignals_T_877; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_879 = _ctrlSignals_T_15 ? 1'h0 : _ctrlSignals_T_878; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_880 = _ctrlSignals_T_13 ? 1'h0 : _ctrlSignals_T_879; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_881 = _ctrlSignals_T_11 ? 1'h0 : _ctrlSignals_T_880; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_882 = _ctrlSignals_T_9 ? 1'h0 : _ctrlSignals_T_881; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_888 = _ctrlSignals_T_133 ? 2'h1 : 2'h0; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_889 = _ctrlSignals_T_131 ? 2'h3 : _ctrlSignals_T_888; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_890 = _ctrlSignals_T_129 ? 2'h0 : _ctrlSignals_T_889; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_891 = _ctrlSignals_T_127 ? 2'h0 : _ctrlSignals_T_890; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_892 = _ctrlSignals_T_125 ? 2'h0 : _ctrlSignals_T_891; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_893 = _ctrlSignals_T_123 ? 2'h0 : _ctrlSignals_T_892; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_894 = _ctrlSignals_T_121 ? 2'h0 : _ctrlSignals_T_893; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_895 = _ctrlSignals_T_119 ? 2'h0 : _ctrlSignals_T_894; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_896 = _ctrlSignals_T_117 ? 2'h0 : _ctrlSignals_T_895; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_897 = _ctrlSignals_T_115 ? 2'h0 : _ctrlSignals_T_896; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_898 = _ctrlSignals_T_113 ? 2'h0 : _ctrlSignals_T_897; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_899 = _ctrlSignals_T_111 ? 2'h0 : _ctrlSignals_T_898; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_900 = _ctrlSignals_T_109 ? 2'h0 : _ctrlSignals_T_899; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_901 = _ctrlSignals_T_107 ? 2'h0 : _ctrlSignals_T_900; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_902 = _ctrlSignals_T_105 ? 2'h0 : _ctrlSignals_T_901; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_903 = _ctrlSignals_T_103 ? 2'h0 : _ctrlSignals_T_902; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_904 = _ctrlSignals_T_101 ? 2'h0 : _ctrlSignals_T_903; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_905 = _ctrlSignals_T_99 ? 2'h0 : _ctrlSignals_T_904; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_906 = _ctrlSignals_T_97 ? 2'h0 : _ctrlSignals_T_905; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_907 = _ctrlSignals_T_95 ? 2'h0 : _ctrlSignals_T_906; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_908 = _ctrlSignals_T_93 ? 2'h0 : _ctrlSignals_T_907; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_909 = _ctrlSignals_T_91 ? 2'h0 : _ctrlSignals_T_908; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_910 = _ctrlSignals_T_89 ? 2'h0 : _ctrlSignals_T_909; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_911 = _ctrlSignals_T_87 ? 2'h0 : _ctrlSignals_T_910; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_912 = _ctrlSignals_T_85 ? 2'h0 : _ctrlSignals_T_911; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_913 = _ctrlSignals_T_83 ? 2'h0 : _ctrlSignals_T_912; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_914 = _ctrlSignals_T_81 ? 2'h0 : _ctrlSignals_T_913; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_915 = _ctrlSignals_T_79 ? 2'h0 : _ctrlSignals_T_914; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_916 = _ctrlSignals_T_77 ? 2'h0 : _ctrlSignals_T_915; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_917 = _ctrlSignals_T_75 ? 2'h0 : _ctrlSignals_T_916; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_918 = _ctrlSignals_T_73 ? 2'h0 : _ctrlSignals_T_917; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_919 = _ctrlSignals_T_71 ? 2'h0 : _ctrlSignals_T_918; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_920 = _ctrlSignals_T_69 ? 2'h0 : _ctrlSignals_T_919; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_921 = _ctrlSignals_T_67 ? 2'h0 : _ctrlSignals_T_920; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_922 = _ctrlSignals_T_65 ? 2'h0 : _ctrlSignals_T_921; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_923 = _ctrlSignals_T_63 ? 2'h0 : _ctrlSignals_T_922; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_924 = _ctrlSignals_T_61 ? 2'h0 : _ctrlSignals_T_923; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_925 = _ctrlSignals_T_59 ? 2'h0 : _ctrlSignals_T_924; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_926 = _ctrlSignals_T_57 ? 2'h0 : _ctrlSignals_T_925; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_927 = _ctrlSignals_T_55 ? 2'h0 : _ctrlSignals_T_926; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_928 = _ctrlSignals_T_53 ? 2'h0 : _ctrlSignals_T_927; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_929 = _ctrlSignals_T_51 ? 2'h0 : _ctrlSignals_T_928; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_930 = _ctrlSignals_T_49 ? 2'h0 : _ctrlSignals_T_929; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_931 = _ctrlSignals_T_47 ? 2'h0 : _ctrlSignals_T_930; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_932 = _ctrlSignals_T_45 ? 2'h0 : _ctrlSignals_T_931; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_933 = _ctrlSignals_T_43 ? 2'h0 : _ctrlSignals_T_932; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_934 = _ctrlSignals_T_41 ? 2'h0 : _ctrlSignals_T_933; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_935 = _ctrlSignals_T_39 ? 2'h0 : _ctrlSignals_T_934; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_936 = _ctrlSignals_T_37 ? 2'h0 : _ctrlSignals_T_935; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_937 = _ctrlSignals_T_35 ? 2'h0 : _ctrlSignals_T_936; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_938 = _ctrlSignals_T_33 ? 2'h0 : _ctrlSignals_T_937; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_939 = _ctrlSignals_T_31 ? 2'h0 : _ctrlSignals_T_938; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_940 = _ctrlSignals_T_29 ? 2'h0 : _ctrlSignals_T_939; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_941 = _ctrlSignals_T_27 ? 2'h0 : _ctrlSignals_T_940; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_942 = _ctrlSignals_T_25 ? 2'h0 : _ctrlSignals_T_941; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_943 = _ctrlSignals_T_23 ? 2'h0 : _ctrlSignals_T_942; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_944 = _ctrlSignals_T_21 ? 2'h0 : _ctrlSignals_T_943; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_945 = _ctrlSignals_T_19 ? 2'h0 : _ctrlSignals_T_944; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_946 = _ctrlSignals_T_17 ? 2'h0 : _ctrlSignals_T_945; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_947 = _ctrlSignals_T_15 ? 2'h0 : _ctrlSignals_T_946; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_948 = _ctrlSignals_T_13 ? 2'h0 : _ctrlSignals_T_947; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_949 = _ctrlSignals_T_11 ? 2'h0 : _ctrlSignals_T_948; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_950 = _ctrlSignals_T_9 ? 2'h0 : _ctrlSignals_T_949; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_951 = _ctrlSignals_T_7 ? 2'h0 : _ctrlSignals_T_950; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_952 = _ctrlSignals_T_5 ? 2'h0 : _ctrlSignals_T_951; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_953 = _ctrlSignals_T_3 ? 2'h0 : _ctrlSignals_T_952; // @[Lookup.scala 34:39]
  wire [1:0] ctrlSignals_11 = _ctrlSignals_T_1 ? 2'h0 : _ctrlSignals_T_953; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_958 = _ctrlSignals_T_129 ? 3'h5 : 3'h0; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_959 = _ctrlSignals_T_127 ? 3'h4 : _ctrlSignals_T_958; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_960 = _ctrlSignals_T_125 ? 3'h3 : _ctrlSignals_T_959; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_961 = _ctrlSignals_T_123 ? 3'h5 : _ctrlSignals_T_960; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_962 = _ctrlSignals_T_121 ? 3'h4 : _ctrlSignals_T_961; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_963 = _ctrlSignals_T_119 ? 3'h1 : _ctrlSignals_T_962; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_964 = _ctrlSignals_T_117 ? 3'h0 : _ctrlSignals_T_963; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_965 = _ctrlSignals_T_115 ? 3'h0 : _ctrlSignals_T_964; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_966 = _ctrlSignals_T_113 ? 3'h0 : _ctrlSignals_T_965; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_967 = _ctrlSignals_T_111 ? 3'h0 : _ctrlSignals_T_966; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_968 = _ctrlSignals_T_109 ? 3'h0 : _ctrlSignals_T_967; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_969 = _ctrlSignals_T_107 ? 3'h0 : _ctrlSignals_T_968; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_970 = _ctrlSignals_T_105 ? 3'h0 : _ctrlSignals_T_969; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_971 = _ctrlSignals_T_103 ? 3'h0 : _ctrlSignals_T_970; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_972 = _ctrlSignals_T_101 ? 3'h0 : _ctrlSignals_T_971; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_973 = _ctrlSignals_T_99 ? 3'h0 : _ctrlSignals_T_972; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_974 = _ctrlSignals_T_97 ? 3'h0 : _ctrlSignals_T_973; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_975 = _ctrlSignals_T_95 ? 3'h0 : _ctrlSignals_T_974; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_976 = _ctrlSignals_T_93 ? 3'h0 : _ctrlSignals_T_975; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_977 = _ctrlSignals_T_91 ? 3'h0 : _ctrlSignals_T_976; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_978 = _ctrlSignals_T_89 ? 3'h0 : _ctrlSignals_T_977; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_979 = _ctrlSignals_T_87 ? 3'h0 : _ctrlSignals_T_978; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_980 = _ctrlSignals_T_85 ? 3'h0 : _ctrlSignals_T_979; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_981 = _ctrlSignals_T_83 ? 3'h0 : _ctrlSignals_T_980; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_982 = _ctrlSignals_T_81 ? 3'h0 : _ctrlSignals_T_981; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_983 = _ctrlSignals_T_79 ? 3'h0 : _ctrlSignals_T_982; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_984 = _ctrlSignals_T_77 ? 3'h0 : _ctrlSignals_T_983; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_985 = _ctrlSignals_T_75 ? 3'h0 : _ctrlSignals_T_984; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_986 = _ctrlSignals_T_73 ? 3'h0 : _ctrlSignals_T_985; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_987 = _ctrlSignals_T_71 ? 3'h0 : _ctrlSignals_T_986; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_988 = _ctrlSignals_T_69 ? 3'h0 : _ctrlSignals_T_987; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_989 = _ctrlSignals_T_67 ? 3'h0 : _ctrlSignals_T_988; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_990 = _ctrlSignals_T_65 ? 3'h0 : _ctrlSignals_T_989; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_991 = _ctrlSignals_T_63 ? 3'h0 : _ctrlSignals_T_990; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_992 = _ctrlSignals_T_61 ? 3'h0 : _ctrlSignals_T_991; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_993 = _ctrlSignals_T_59 ? 3'h0 : _ctrlSignals_T_992; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_994 = _ctrlSignals_T_57 ? 3'h0 : _ctrlSignals_T_993; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_995 = _ctrlSignals_T_55 ? 3'h0 : _ctrlSignals_T_994; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_996 = _ctrlSignals_T_53 ? 3'h0 : _ctrlSignals_T_995; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_997 = _ctrlSignals_T_51 ? 3'h0 : _ctrlSignals_T_996; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_998 = _ctrlSignals_T_49 ? 3'h0 : _ctrlSignals_T_997; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_999 = _ctrlSignals_T_47 ? 3'h0 : _ctrlSignals_T_998; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_1000 = _ctrlSignals_T_45 ? 3'h0 : _ctrlSignals_T_999; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_1001 = _ctrlSignals_T_43 ? 3'h0 : _ctrlSignals_T_1000; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_1002 = _ctrlSignals_T_41 ? 3'h0 : _ctrlSignals_T_1001; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_1003 = _ctrlSignals_T_39 ? 3'h0 : _ctrlSignals_T_1002; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_1004 = _ctrlSignals_T_37 ? 3'h0 : _ctrlSignals_T_1003; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_1005 = _ctrlSignals_T_35 ? 3'h0 : _ctrlSignals_T_1004; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_1006 = _ctrlSignals_T_33 ? 3'h0 : _ctrlSignals_T_1005; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_1007 = _ctrlSignals_T_31 ? 3'h0 : _ctrlSignals_T_1006; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_1008 = _ctrlSignals_T_29 ? 3'h0 : _ctrlSignals_T_1007; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_1009 = _ctrlSignals_T_27 ? 3'h0 : _ctrlSignals_T_1008; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_1010 = _ctrlSignals_T_25 ? 3'h0 : _ctrlSignals_T_1009; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_1011 = _ctrlSignals_T_23 ? 3'h0 : _ctrlSignals_T_1010; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_1012 = _ctrlSignals_T_21 ? 3'h0 : _ctrlSignals_T_1011; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_1013 = _ctrlSignals_T_19 ? 3'h0 : _ctrlSignals_T_1012; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_1014 = _ctrlSignals_T_17 ? 3'h0 : _ctrlSignals_T_1013; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_1015 = _ctrlSignals_T_15 ? 3'h0 : _ctrlSignals_T_1014; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_1016 = _ctrlSignals_T_13 ? 3'h0 : _ctrlSignals_T_1015; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_1017 = _ctrlSignals_T_11 ? 3'h0 : _ctrlSignals_T_1016; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_1018 = _ctrlSignals_T_9 ? 3'h0 : _ctrlSignals_T_1017; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_1019 = _ctrlSignals_T_7 ? 3'h0 : _ctrlSignals_T_1018; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_1020 = _ctrlSignals_T_5 ? 3'h0 : _ctrlSignals_T_1019; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_1021 = _ctrlSignals_T_3 ? 3'h0 : _ctrlSignals_T_1020; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_1026 = _ctrlSignals_T_129 ? 1'h0 : _ctrlSignals_T_821; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_1027 = _ctrlSignals_T_127 ? 1'h0 : _ctrlSignals_T_1026; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_1028 = _ctrlSignals_T_125 ? 1'h0 : _ctrlSignals_T_1027; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_1029 = _ctrlSignals_T_123 ? 1'h0 : _ctrlSignals_T_1028; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_1030 = _ctrlSignals_T_121 ? 1'h0 : _ctrlSignals_T_1029; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_1031 = _ctrlSignals_T_119 ? 1'h0 : _ctrlSignals_T_1030; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_1032 = _ctrlSignals_T_117 ? 1'h0 : _ctrlSignals_T_1031; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_1033 = _ctrlSignals_T_115 ? 1'h0 : _ctrlSignals_T_1032; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_1034 = _ctrlSignals_T_113 ? 1'h0 : _ctrlSignals_T_1033; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_1035 = _ctrlSignals_T_111 ? 1'h0 : _ctrlSignals_T_1034; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_1036 = _ctrlSignals_T_109 ? 1'h0 : _ctrlSignals_T_1035; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_1037 = _ctrlSignals_T_107 ? 1'h0 : _ctrlSignals_T_1036; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_1038 = _ctrlSignals_T_105 ? 1'h0 : _ctrlSignals_T_1037; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_1039 = _ctrlSignals_T_103 ? 1'h0 : _ctrlSignals_T_1038; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_1040 = _ctrlSignals_T_101 ? 1'h0 : _ctrlSignals_T_1039; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_1041 = _ctrlSignals_T_99 ? 1'h0 : _ctrlSignals_T_1040; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_1042 = _ctrlSignals_T_97 ? 1'h0 : _ctrlSignals_T_1041; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_1043 = _ctrlSignals_T_95 ? 1'h0 : _ctrlSignals_T_1042; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_1044 = _ctrlSignals_T_93 ? 1'h0 : _ctrlSignals_T_1043; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_1045 = _ctrlSignals_T_91 ? 1'h0 : _ctrlSignals_T_1044; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_1046 = _ctrlSignals_T_89 ? 1'h0 : _ctrlSignals_T_1045; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_1047 = _ctrlSignals_T_87 ? 1'h0 : _ctrlSignals_T_1046; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_1048 = _ctrlSignals_T_85 ? 1'h0 : _ctrlSignals_T_1047; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_1049 = _ctrlSignals_T_83 ? 1'h0 : _ctrlSignals_T_1048; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_1050 = _ctrlSignals_T_81 ? 1'h0 : _ctrlSignals_T_1049; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_1051 = _ctrlSignals_T_79 ? 1'h0 : _ctrlSignals_T_1050; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_1052 = _ctrlSignals_T_77 ? 1'h0 : _ctrlSignals_T_1051; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_1053 = _ctrlSignals_T_75 ? 1'h0 : _ctrlSignals_T_1052; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_1054 = _ctrlSignals_T_73 ? 1'h0 : _ctrlSignals_T_1053; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_1055 = _ctrlSignals_T_71 ? 1'h0 : _ctrlSignals_T_1054; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_1056 = _ctrlSignals_T_69 ? 1'h0 : _ctrlSignals_T_1055; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_1057 = _ctrlSignals_T_67 ? 1'h0 : _ctrlSignals_T_1056; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_1058 = _ctrlSignals_T_65 ? 1'h0 : _ctrlSignals_T_1057; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_1059 = _ctrlSignals_T_63 ? 1'h0 : _ctrlSignals_T_1058; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_1060 = _ctrlSignals_T_61 ? 1'h0 : _ctrlSignals_T_1059; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_1061 = _ctrlSignals_T_59 ? 1'h0 : _ctrlSignals_T_1060; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_1062 = _ctrlSignals_T_57 ? 1'h0 : _ctrlSignals_T_1061; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_1063 = _ctrlSignals_T_55 ? 1'h0 : _ctrlSignals_T_1062; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_1064 = _ctrlSignals_T_53 ? 1'h0 : _ctrlSignals_T_1063; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_1065 = _ctrlSignals_T_51 ? 1'h0 : _ctrlSignals_T_1064; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_1066 = _ctrlSignals_T_49 ? 1'h0 : _ctrlSignals_T_1065; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_1067 = _ctrlSignals_T_47 ? 1'h0 : _ctrlSignals_T_1066; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_1068 = _ctrlSignals_T_45 ? 1'h0 : _ctrlSignals_T_1067; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_1069 = _ctrlSignals_T_43 ? 1'h0 : _ctrlSignals_T_1068; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_1070 = _ctrlSignals_T_41 ? 1'h0 : _ctrlSignals_T_1069; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_1071 = _ctrlSignals_T_39 ? 1'h0 : _ctrlSignals_T_1070; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_1072 = _ctrlSignals_T_37 ? 1'h0 : _ctrlSignals_T_1071; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_1073 = _ctrlSignals_T_35 ? 1'h0 : _ctrlSignals_T_1072; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_1074 = _ctrlSignals_T_33 ? 1'h0 : _ctrlSignals_T_1073; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_1075 = _ctrlSignals_T_31 ? 1'h0 : _ctrlSignals_T_1074; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_1076 = _ctrlSignals_T_29 ? 1'h0 : _ctrlSignals_T_1075; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_1077 = _ctrlSignals_T_27 ? 1'h0 : _ctrlSignals_T_1076; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_1078 = _ctrlSignals_T_25 ? 1'h0 : _ctrlSignals_T_1077; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_1079 = _ctrlSignals_T_23 ? 1'h0 : _ctrlSignals_T_1078; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_1080 = _ctrlSignals_T_21 ? 1'h0 : _ctrlSignals_T_1079; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_1081 = _ctrlSignals_T_19 ? 1'h0 : _ctrlSignals_T_1080; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_1082 = _ctrlSignals_T_17 ? 1'h0 : _ctrlSignals_T_1081; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_1083 = _ctrlSignals_T_15 ? 1'h0 : _ctrlSignals_T_1082; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_1084 = _ctrlSignals_T_13 ? 1'h0 : _ctrlSignals_T_1083; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_1085 = _ctrlSignals_T_11 ? 1'h0 : _ctrlSignals_T_1084; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_1086 = _ctrlSignals_T_9 ? 1'h0 : _ctrlSignals_T_1085; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_1087 = _ctrlSignals_T_7 ? 1'h0 : _ctrlSignals_T_1086; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_1088 = _ctrlSignals_T_5 ? 1'h0 : _ctrlSignals_T_1087; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_1089 = _ctrlSignals_T_3 ? 1'h0 : _ctrlSignals_T_1088; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_1100 = _ctrlSignals_T_117 ? 1'h0 : _ctrlSignals_T_119 | (_ctrlSignals_T_121 | (_ctrlSignals_T_123
     | (_ctrlSignals_T_125 | (_ctrlSignals_T_127 | (_ctrlSignals_T_129 | (_ctrlSignals_T_131 | _ctrlSignals_T_133)))))); // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_1101 = _ctrlSignals_T_115 ? 1'h0 : _ctrlSignals_T_1100; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_1102 = _ctrlSignals_T_113 ? 1'h0 : _ctrlSignals_T_1101; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_1103 = _ctrlSignals_T_111 ? 1'h0 : _ctrlSignals_T_1102; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_1104 = _ctrlSignals_T_109 ? 1'h0 : _ctrlSignals_T_1103; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_1105 = _ctrlSignals_T_107 ? 1'h0 : _ctrlSignals_T_1104; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_1106 = _ctrlSignals_T_105 ? 1'h0 : _ctrlSignals_T_1105; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_1107 = _ctrlSignals_T_103 ? 1'h0 : _ctrlSignals_T_1106; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_1108 = _ctrlSignals_T_101 ? 1'h0 : _ctrlSignals_T_1107; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_1109 = _ctrlSignals_T_99 ? 1'h0 : _ctrlSignals_T_1108; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_1110 = _ctrlSignals_T_97 ? 1'h0 : _ctrlSignals_T_1109; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_1111 = _ctrlSignals_T_95 ? 1'h0 : _ctrlSignals_T_1110; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_1112 = _ctrlSignals_T_93 ? 1'h0 : _ctrlSignals_T_1111; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_1113 = _ctrlSignals_T_91 ? 1'h0 : _ctrlSignals_T_1112; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_1114 = _ctrlSignals_T_89 ? 1'h0 : _ctrlSignals_T_1113; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_1115 = _ctrlSignals_T_87 ? 1'h0 : _ctrlSignals_T_1114; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_1116 = _ctrlSignals_T_85 ? 1'h0 : _ctrlSignals_T_1115; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_1117 = _ctrlSignals_T_83 ? 1'h0 : _ctrlSignals_T_1116; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_1118 = _ctrlSignals_T_81 ? 1'h0 : _ctrlSignals_T_1117; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_1119 = _ctrlSignals_T_79 ? 1'h0 : _ctrlSignals_T_1118; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_1120 = _ctrlSignals_T_77 ? 1'h0 : _ctrlSignals_T_1119; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_1121 = _ctrlSignals_T_75 ? 1'h0 : _ctrlSignals_T_1120; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_1122 = _ctrlSignals_T_73 ? 1'h0 : _ctrlSignals_T_1121; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_1123 = _ctrlSignals_T_71 ? 1'h0 : _ctrlSignals_T_1122; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_1124 = _ctrlSignals_T_69 ? 1'h0 : _ctrlSignals_T_1123; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_1125 = _ctrlSignals_T_67 ? 1'h0 : _ctrlSignals_T_1124; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_1126 = _ctrlSignals_T_65 ? 1'h0 : _ctrlSignals_T_1125; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_1127 = _ctrlSignals_T_63 ? 1'h0 : _ctrlSignals_T_1126; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_1128 = _ctrlSignals_T_61 ? 1'h0 : _ctrlSignals_T_1127; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_1129 = _ctrlSignals_T_59 ? 1'h0 : _ctrlSignals_T_1128; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_1130 = _ctrlSignals_T_57 ? 1'h0 : _ctrlSignals_T_1129; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_1131 = _ctrlSignals_T_55 ? 1'h0 : _ctrlSignals_T_1130; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_1132 = _ctrlSignals_T_53 ? 1'h0 : _ctrlSignals_T_1131; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_1133 = _ctrlSignals_T_51 ? 1'h0 : _ctrlSignals_T_1132; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_1134 = _ctrlSignals_T_49 ? 1'h0 : _ctrlSignals_T_1133; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_1135 = _ctrlSignals_T_47 ? 1'h0 : _ctrlSignals_T_1134; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_1136 = _ctrlSignals_T_45 ? 1'h0 : _ctrlSignals_T_1135; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_1137 = _ctrlSignals_T_43 ? 1'h0 : _ctrlSignals_T_1136; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_1138 = _ctrlSignals_T_41 ? 1'h0 : _ctrlSignals_T_1137; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_1139 = _ctrlSignals_T_39 ? 1'h0 : _ctrlSignals_T_1138; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_1140 = _ctrlSignals_T_37 ? 1'h0 : _ctrlSignals_T_1139; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_1141 = _ctrlSignals_T_35 ? 1'h0 : _ctrlSignals_T_1140; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_1142 = _ctrlSignals_T_33 ? 1'h0 : _ctrlSignals_T_1141; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_1143 = _ctrlSignals_T_31 ? 1'h0 : _ctrlSignals_T_1142; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_1144 = _ctrlSignals_T_29 ? 1'h0 : _ctrlSignals_T_1143; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_1145 = _ctrlSignals_T_27 ? 1'h0 : _ctrlSignals_T_1144; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_1146 = _ctrlSignals_T_25 ? 1'h0 : _ctrlSignals_T_1145; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_1147 = _ctrlSignals_T_23 ? 1'h0 : _ctrlSignals_T_1146; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_1148 = _ctrlSignals_T_21 ? 1'h0 : _ctrlSignals_T_1147; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_1149 = _ctrlSignals_T_19 ? 1'h0 : _ctrlSignals_T_1148; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_1150 = _ctrlSignals_T_17 ? 1'h0 : _ctrlSignals_T_1149; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_1151 = _ctrlSignals_T_15 ? 1'h0 : _ctrlSignals_T_1150; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_1152 = _ctrlSignals_T_13 ? 1'h0 : _ctrlSignals_T_1151; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_1153 = _ctrlSignals_T_11 ? 1'h0 : _ctrlSignals_T_1152; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_1154 = _ctrlSignals_T_9 ? 1'h0 : _ctrlSignals_T_1153; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_1157 = _ctrlSignals_T_3 ? 1'h0 : _ctrlSignals_T_5 | (_ctrlSignals_T_7 | _ctrlSignals_T_1154); // @[Lookup.scala 34:39]
  assign io_pc_sel = _ctrlSignals_T_1 ? 2'h0 : _ctrlSignals_T_205; // @[Lookup.scala 34:39]
  assign io_A_sel = _ctrlSignals_T_1 ? 1'h0 : _ctrlSignals_T_273; // @[Lookup.scala 34:39]
  assign io_B_sel = _ctrlSignals_T_1 ? 1'h0 : _ctrlSignals_T_341; // @[Lookup.scala 34:39]
  assign io_wd_type = _ctrlSignals_T_1 ? 2'h0 : _ctrlSignals_T_409; // @[Lookup.scala 34:39]
  assign io_imm_sel = _ctrlSignals_T_1 ? 3'h3 : _ctrlSignals_T_477; // @[Lookup.scala 34:39]
  assign io_br_type = _ctrlSignals_T_1 ? 3'h0 : _ctrlSignals_T_613; // @[Lookup.scala 34:39]
  assign io_st_type = _ctrlSignals_T_1 ? 3'h0 : _ctrlSignals_T_681; // @[Lookup.scala 34:39]
  assign io_ld_type = _ctrlSignals_T_1 ? 3'h0 : _ctrlSignals_T_749; // @[Lookup.scala 34:39]
  assign io_wb_sel = _ctrlSignals_T_1 ? 2'h0 : _ctrlSignals_T_817; // @[Lookup.scala 34:39]
  assign io_wb_en = _ctrlSignals_T_1 | (_ctrlSignals_T_3 | (_ctrlSignals_T_5 | (_ctrlSignals_T_7 | _ctrlSignals_T_882)))
    ; // @[Lookup.scala 34:39]
  assign io_alu_op = ctrlSignals_5[3:0]; // @[control.scala 184:19]
  assign io_prv = ctrlSignals_11[0]; // @[control.scala 191:16]
  assign io_csr_cmd = _ctrlSignals_T_1 ? 3'h0 : _ctrlSignals_T_1021; // @[Lookup.scala 34:39]
  assign io_is_illegal = _ctrlSignals_T_1 ? 1'h0 : _ctrlSignals_T_1089; // @[Lookup.scala 34:39]
  assign io_is_kill = _ctrlSignals_T_1 ? 1'h0 : _ctrlSignals_T_1157; // @[Lookup.scala 34:39]
endmodule
module myCPU(
  input         clock,
  input         reset,
  output [63:0] io_pc_debug,
  output [31:0] io_inst,
  output        io_start
);
  wire  datapath_clock; // @[datapath.scala 715:30]
  wire  datapath_reset; // @[datapath.scala 715:30]
  wire [31:0] datapath_io_ctrl_inst; // @[datapath.scala 715:30]
  wire [1:0] datapath_io_ctrl_pc_sel; // @[datapath.scala 715:30]
  wire  datapath_io_ctrl_A_sel; // @[datapath.scala 715:30]
  wire  datapath_io_ctrl_B_sel; // @[datapath.scala 715:30]
  wire [1:0] datapath_io_ctrl_wd_type; // @[datapath.scala 715:30]
  wire [2:0] datapath_io_ctrl_imm_sel; // @[datapath.scala 715:30]
  wire [2:0] datapath_io_ctrl_br_type; // @[datapath.scala 715:30]
  wire [2:0] datapath_io_ctrl_st_type; // @[datapath.scala 715:30]
  wire [2:0] datapath_io_ctrl_ld_type; // @[datapath.scala 715:30]
  wire [1:0] datapath_io_ctrl_wb_sel; // @[datapath.scala 715:30]
  wire  datapath_io_ctrl_wb_en; // @[datapath.scala 715:30]
  wire [3:0] datapath_io_ctrl_alu_op; // @[datapath.scala 715:30]
  wire  datapath_io_ctrl_prv; // @[datapath.scala 715:30]
  wire [2:0] datapath_io_ctrl_csr_cmd; // @[datapath.scala 715:30]
  wire  datapath_io_ctrl_is_illegal; // @[datapath.scala 715:30]
  wire  datapath_io_ctrl_is_kill; // @[datapath.scala 715:30]
  wire [63:0] datapath_io_pc; // @[datapath.scala 715:30]
  wire [31:0] datapath_io_inst; // @[datapath.scala 715:30]
  wire  datapath_io_start; // @[datapath.scala 715:30]
  wire [31:0] control_io_inst; // @[datapath.scala 716:29]
  wire [1:0] control_io_pc_sel; // @[datapath.scala 716:29]
  wire  control_io_A_sel; // @[datapath.scala 716:29]
  wire  control_io_B_sel; // @[datapath.scala 716:29]
  wire [1:0] control_io_wd_type; // @[datapath.scala 716:29]
  wire [2:0] control_io_imm_sel; // @[datapath.scala 716:29]
  wire [2:0] control_io_br_type; // @[datapath.scala 716:29]
  wire [2:0] control_io_st_type; // @[datapath.scala 716:29]
  wire [2:0] control_io_ld_type; // @[datapath.scala 716:29]
  wire [1:0] control_io_wb_sel; // @[datapath.scala 716:29]
  wire  control_io_wb_en; // @[datapath.scala 716:29]
  wire [3:0] control_io_alu_op; // @[datapath.scala 716:29]
  wire  control_io_prv; // @[datapath.scala 716:29]
  wire [2:0] control_io_csr_cmd; // @[datapath.scala 716:29]
  wire  control_io_is_illegal; // @[datapath.scala 716:29]
  wire  control_io_is_kill; // @[datapath.scala 716:29]
  Datapath datapath ( // @[datapath.scala 715:30]
    .clock(datapath_clock),
    .reset(datapath_reset),
    .io_ctrl_inst(datapath_io_ctrl_inst),
    .io_ctrl_pc_sel(datapath_io_ctrl_pc_sel),
    .io_ctrl_A_sel(datapath_io_ctrl_A_sel),
    .io_ctrl_B_sel(datapath_io_ctrl_B_sel),
    .io_ctrl_wd_type(datapath_io_ctrl_wd_type),
    .io_ctrl_imm_sel(datapath_io_ctrl_imm_sel),
    .io_ctrl_br_type(datapath_io_ctrl_br_type),
    .io_ctrl_st_type(datapath_io_ctrl_st_type),
    .io_ctrl_ld_type(datapath_io_ctrl_ld_type),
    .io_ctrl_wb_sel(datapath_io_ctrl_wb_sel),
    .io_ctrl_wb_en(datapath_io_ctrl_wb_en),
    .io_ctrl_alu_op(datapath_io_ctrl_alu_op),
    .io_ctrl_prv(datapath_io_ctrl_prv),
    .io_ctrl_csr_cmd(datapath_io_ctrl_csr_cmd),
    .io_ctrl_is_illegal(datapath_io_ctrl_is_illegal),
    .io_ctrl_is_kill(datapath_io_ctrl_is_kill),
    .io_pc(datapath_io_pc),
    .io_inst(datapath_io_inst),
    .io_start(datapath_io_start)
  );
  Control control ( // @[datapath.scala 716:29]
    .io_inst(control_io_inst),
    .io_pc_sel(control_io_pc_sel),
    .io_A_sel(control_io_A_sel),
    .io_B_sel(control_io_B_sel),
    .io_wd_type(control_io_wd_type),
    .io_imm_sel(control_io_imm_sel),
    .io_br_type(control_io_br_type),
    .io_st_type(control_io_st_type),
    .io_ld_type(control_io_ld_type),
    .io_wb_sel(control_io_wb_sel),
    .io_wb_en(control_io_wb_en),
    .io_alu_op(control_io_alu_op),
    .io_prv(control_io_prv),
    .io_csr_cmd(control_io_csr_cmd),
    .io_is_illegal(control_io_is_illegal),
    .io_is_kill(control_io_is_kill)
  );
  assign io_pc_debug = datapath_io_pc; // @[datapath.scala 719:21]
  assign io_inst = datapath_io_inst; // @[datapath.scala 718:17]
  assign io_start = datapath_io_start; // @[datapath.scala 720:18]
  assign datapath_clock = clock;
  assign datapath_reset = reset;
  assign datapath_io_ctrl_pc_sel = control_io_pc_sel; // @[datapath.scala 717:26]
  assign datapath_io_ctrl_A_sel = control_io_A_sel; // @[datapath.scala 717:26]
  assign datapath_io_ctrl_B_sel = control_io_B_sel; // @[datapath.scala 717:26]
  assign datapath_io_ctrl_wd_type = control_io_wd_type; // @[datapath.scala 717:26]
  assign datapath_io_ctrl_imm_sel = control_io_imm_sel; // @[datapath.scala 717:26]
  assign datapath_io_ctrl_br_type = control_io_br_type; // @[datapath.scala 717:26]
  assign datapath_io_ctrl_st_type = control_io_st_type; // @[datapath.scala 717:26]
  assign datapath_io_ctrl_ld_type = control_io_ld_type; // @[datapath.scala 717:26]
  assign datapath_io_ctrl_wb_sel = control_io_wb_sel; // @[datapath.scala 717:26]
  assign datapath_io_ctrl_wb_en = control_io_wb_en; // @[datapath.scala 717:26]
  assign datapath_io_ctrl_alu_op = control_io_alu_op; // @[datapath.scala 717:26]
  assign datapath_io_ctrl_prv = control_io_prv; // @[datapath.scala 717:26]
  assign datapath_io_ctrl_csr_cmd = control_io_csr_cmd; // @[datapath.scala 717:26]
  assign datapath_io_ctrl_is_illegal = control_io_is_illegal; // @[datapath.scala 717:26]
  assign datapath_io_ctrl_is_kill = control_io_is_kill; // @[datapath.scala 717:26]
  assign control_io_inst = datapath_io_ctrl_inst; // @[datapath.scala 717:26]
endmodule

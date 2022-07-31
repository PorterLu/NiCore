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
  reg [63:0] reg_0; // @[datapath.scala 25:22]
  reg [63:0] reg_1; // @[datapath.scala 25:22]
  reg [63:0] reg_2; // @[datapath.scala 25:22]
  reg [63:0] reg_3; // @[datapath.scala 25:22]
  reg [63:0] reg_4; // @[datapath.scala 25:22]
  reg [63:0] reg_5; // @[datapath.scala 25:22]
  reg [63:0] reg_6; // @[datapath.scala 25:22]
  reg [63:0] reg_7; // @[datapath.scala 25:22]
  reg [63:0] reg_8; // @[datapath.scala 25:22]
  reg [63:0] reg_9; // @[datapath.scala 25:22]
  reg [63:0] reg_10; // @[datapath.scala 25:22]
  reg [63:0] reg_11; // @[datapath.scala 25:22]
  reg [63:0] reg_12; // @[datapath.scala 25:22]
  reg [63:0] reg_13; // @[datapath.scala 25:22]
  reg [63:0] reg_14; // @[datapath.scala 25:22]
  reg [63:0] reg_15; // @[datapath.scala 25:22]
  reg [63:0] reg_16; // @[datapath.scala 25:22]
  reg [63:0] reg_17; // @[datapath.scala 25:22]
  reg [63:0] reg_18; // @[datapath.scala 25:22]
  reg [63:0] reg_19; // @[datapath.scala 25:22]
  reg [63:0] reg_20; // @[datapath.scala 25:22]
  reg [63:0] reg_21; // @[datapath.scala 25:22]
  reg [63:0] reg_22; // @[datapath.scala 25:22]
  reg [63:0] reg_23; // @[datapath.scala 25:22]
  reg [63:0] reg_24; // @[datapath.scala 25:22]
  reg [63:0] reg_25; // @[datapath.scala 25:22]
  reg [63:0] reg_26; // @[datapath.scala 25:22]
  reg [63:0] reg_27; // @[datapath.scala 25:22]
  reg [63:0] reg_28; // @[datapath.scala 25:22]
  reg [63:0] reg_29; // @[datapath.scala 25:22]
  reg [63:0] reg_30; // @[datapath.scala 25:22]
  reg [63:0] reg_31; // @[datapath.scala 25:22]
  wire [63:0] _GEN_65 = 5'h1 == io_raddr_0 ? reg_1 : reg_0; // @[datapath.scala 40:{37,37}]
  wire [63:0] _GEN_66 = 5'h2 == io_raddr_0 ? reg_2 : _GEN_65; // @[datapath.scala 40:{37,37}]
  wire [63:0] _GEN_67 = 5'h3 == io_raddr_0 ? reg_3 : _GEN_66; // @[datapath.scala 40:{37,37}]
  wire [63:0] _GEN_68 = 5'h4 == io_raddr_0 ? reg_4 : _GEN_67; // @[datapath.scala 40:{37,37}]
  wire [63:0] _GEN_69 = 5'h5 == io_raddr_0 ? reg_5 : _GEN_68; // @[datapath.scala 40:{37,37}]
  wire [63:0] _GEN_70 = 5'h6 == io_raddr_0 ? reg_6 : _GEN_69; // @[datapath.scala 40:{37,37}]
  wire [63:0] _GEN_71 = 5'h7 == io_raddr_0 ? reg_7 : _GEN_70; // @[datapath.scala 40:{37,37}]
  wire [63:0] _GEN_72 = 5'h8 == io_raddr_0 ? reg_8 : _GEN_71; // @[datapath.scala 40:{37,37}]
  wire [63:0] _GEN_73 = 5'h9 == io_raddr_0 ? reg_9 : _GEN_72; // @[datapath.scala 40:{37,37}]
  wire [63:0] _GEN_74 = 5'ha == io_raddr_0 ? reg_10 : _GEN_73; // @[datapath.scala 40:{37,37}]
  wire [63:0] _GEN_75 = 5'hb == io_raddr_0 ? reg_11 : _GEN_74; // @[datapath.scala 40:{37,37}]
  wire [63:0] _GEN_76 = 5'hc == io_raddr_0 ? reg_12 : _GEN_75; // @[datapath.scala 40:{37,37}]
  wire [63:0] _GEN_77 = 5'hd == io_raddr_0 ? reg_13 : _GEN_76; // @[datapath.scala 40:{37,37}]
  wire [63:0] _GEN_78 = 5'he == io_raddr_0 ? reg_14 : _GEN_77; // @[datapath.scala 40:{37,37}]
  wire [63:0] _GEN_79 = 5'hf == io_raddr_0 ? reg_15 : _GEN_78; // @[datapath.scala 40:{37,37}]
  wire [63:0] _GEN_80 = 5'h10 == io_raddr_0 ? reg_16 : _GEN_79; // @[datapath.scala 40:{37,37}]
  wire [63:0] _GEN_81 = 5'h11 == io_raddr_0 ? reg_17 : _GEN_80; // @[datapath.scala 40:{37,37}]
  wire [63:0] _GEN_82 = 5'h12 == io_raddr_0 ? reg_18 : _GEN_81; // @[datapath.scala 40:{37,37}]
  wire [63:0] _GEN_83 = 5'h13 == io_raddr_0 ? reg_19 : _GEN_82; // @[datapath.scala 40:{37,37}]
  wire [63:0] _GEN_84 = 5'h14 == io_raddr_0 ? reg_20 : _GEN_83; // @[datapath.scala 40:{37,37}]
  wire [63:0] _GEN_85 = 5'h15 == io_raddr_0 ? reg_21 : _GEN_84; // @[datapath.scala 40:{37,37}]
  wire [63:0] _GEN_86 = 5'h16 == io_raddr_0 ? reg_22 : _GEN_85; // @[datapath.scala 40:{37,37}]
  wire [63:0] _GEN_87 = 5'h17 == io_raddr_0 ? reg_23 : _GEN_86; // @[datapath.scala 40:{37,37}]
  wire [63:0] _GEN_88 = 5'h18 == io_raddr_0 ? reg_24 : _GEN_87; // @[datapath.scala 40:{37,37}]
  wire [63:0] _GEN_89 = 5'h19 == io_raddr_0 ? reg_25 : _GEN_88; // @[datapath.scala 40:{37,37}]
  wire [63:0] _GEN_90 = 5'h1a == io_raddr_0 ? reg_26 : _GEN_89; // @[datapath.scala 40:{37,37}]
  wire [63:0] _GEN_91 = 5'h1b == io_raddr_0 ? reg_27 : _GEN_90; // @[datapath.scala 40:{37,37}]
  wire [63:0] _GEN_92 = 5'h1c == io_raddr_0 ? reg_28 : _GEN_91; // @[datapath.scala 40:{37,37}]
  wire [63:0] _GEN_93 = 5'h1d == io_raddr_0 ? reg_29 : _GEN_92; // @[datapath.scala 40:{37,37}]
  wire [63:0] _GEN_94 = 5'h1e == io_raddr_0 ? reg_30 : _GEN_93; // @[datapath.scala 40:{37,37}]
  wire [63:0] _GEN_95 = 5'h1f == io_raddr_0 ? reg_31 : _GEN_94; // @[datapath.scala 40:{37,37}]
  wire [63:0] _GEN_98 = 5'h1 == io_raddr_1 ? reg_1 : reg_0; // @[datapath.scala 40:{37,37}]
  wire [63:0] _GEN_99 = 5'h2 == io_raddr_1 ? reg_2 : _GEN_98; // @[datapath.scala 40:{37,37}]
  wire [63:0] _GEN_100 = 5'h3 == io_raddr_1 ? reg_3 : _GEN_99; // @[datapath.scala 40:{37,37}]
  wire [63:0] _GEN_101 = 5'h4 == io_raddr_1 ? reg_4 : _GEN_100; // @[datapath.scala 40:{37,37}]
  wire [63:0] _GEN_102 = 5'h5 == io_raddr_1 ? reg_5 : _GEN_101; // @[datapath.scala 40:{37,37}]
  wire [63:0] _GEN_103 = 5'h6 == io_raddr_1 ? reg_6 : _GEN_102; // @[datapath.scala 40:{37,37}]
  wire [63:0] _GEN_104 = 5'h7 == io_raddr_1 ? reg_7 : _GEN_103; // @[datapath.scala 40:{37,37}]
  wire [63:0] _GEN_105 = 5'h8 == io_raddr_1 ? reg_8 : _GEN_104; // @[datapath.scala 40:{37,37}]
  wire [63:0] _GEN_106 = 5'h9 == io_raddr_1 ? reg_9 : _GEN_105; // @[datapath.scala 40:{37,37}]
  wire [63:0] _GEN_107 = 5'ha == io_raddr_1 ? reg_10 : _GEN_106; // @[datapath.scala 40:{37,37}]
  wire [63:0] _GEN_108 = 5'hb == io_raddr_1 ? reg_11 : _GEN_107; // @[datapath.scala 40:{37,37}]
  wire [63:0] _GEN_109 = 5'hc == io_raddr_1 ? reg_12 : _GEN_108; // @[datapath.scala 40:{37,37}]
  wire [63:0] _GEN_110 = 5'hd == io_raddr_1 ? reg_13 : _GEN_109; // @[datapath.scala 40:{37,37}]
  wire [63:0] _GEN_111 = 5'he == io_raddr_1 ? reg_14 : _GEN_110; // @[datapath.scala 40:{37,37}]
  wire [63:0] _GEN_112 = 5'hf == io_raddr_1 ? reg_15 : _GEN_111; // @[datapath.scala 40:{37,37}]
  wire [63:0] _GEN_113 = 5'h10 == io_raddr_1 ? reg_16 : _GEN_112; // @[datapath.scala 40:{37,37}]
  wire [63:0] _GEN_114 = 5'h11 == io_raddr_1 ? reg_17 : _GEN_113; // @[datapath.scala 40:{37,37}]
  wire [63:0] _GEN_115 = 5'h12 == io_raddr_1 ? reg_18 : _GEN_114; // @[datapath.scala 40:{37,37}]
  wire [63:0] _GEN_116 = 5'h13 == io_raddr_1 ? reg_19 : _GEN_115; // @[datapath.scala 40:{37,37}]
  wire [63:0] _GEN_117 = 5'h14 == io_raddr_1 ? reg_20 : _GEN_116; // @[datapath.scala 40:{37,37}]
  wire [63:0] _GEN_118 = 5'h15 == io_raddr_1 ? reg_21 : _GEN_117; // @[datapath.scala 40:{37,37}]
  wire [63:0] _GEN_119 = 5'h16 == io_raddr_1 ? reg_22 : _GEN_118; // @[datapath.scala 40:{37,37}]
  wire [63:0] _GEN_120 = 5'h17 == io_raddr_1 ? reg_23 : _GEN_119; // @[datapath.scala 40:{37,37}]
  wire [63:0] _GEN_121 = 5'h18 == io_raddr_1 ? reg_24 : _GEN_120; // @[datapath.scala 40:{37,37}]
  wire [63:0] _GEN_122 = 5'h19 == io_raddr_1 ? reg_25 : _GEN_121; // @[datapath.scala 40:{37,37}]
  wire [63:0] _GEN_123 = 5'h1a == io_raddr_1 ? reg_26 : _GEN_122; // @[datapath.scala 40:{37,37}]
  wire [63:0] _GEN_124 = 5'h1b == io_raddr_1 ? reg_27 : _GEN_123; // @[datapath.scala 40:{37,37}]
  wire [63:0] _GEN_125 = 5'h1c == io_raddr_1 ? reg_28 : _GEN_124; // @[datapath.scala 40:{37,37}]
  wire [63:0] _GEN_126 = 5'h1d == io_raddr_1 ? reg_29 : _GEN_125; // @[datapath.scala 40:{37,37}]
  wire [63:0] _GEN_127 = 5'h1e == io_raddr_1 ? reg_30 : _GEN_126; // @[datapath.scala 40:{37,37}]
  wire [63:0] _GEN_128 = 5'h1f == io_raddr_1 ? reg_31 : _GEN_127; // @[datapath.scala 40:{37,37}]
  assign io_rdata_0 = io_raddr_0 == 5'h0 ? 64'h0 : _GEN_95; // @[datapath.scala 37:42 38:37 40:37]
  assign io_rdata_1 = io_raddr_1 == 5'h0 ? 64'h0 : _GEN_128; // @[datapath.scala 37:42 38:37 40:37]
  assign io_rdata_4 = reg_1; // @[datapath.scala 37:42 38:37 40:37]
  assign io_rdata_5 = reg_2; // @[datapath.scala 37:42 38:37 40:37]
  assign io_rdata_6 = reg_3; // @[datapath.scala 37:42 38:37 40:37]
  assign io_rdata_7 = reg_4; // @[datapath.scala 37:42 38:37 40:37]
  assign io_rdata_8 = reg_5; // @[datapath.scala 37:42 38:37 40:37]
  assign io_rdata_9 = reg_6; // @[datapath.scala 37:42 38:37 40:37]
  assign io_rdata_10 = reg_7; // @[datapath.scala 37:42 38:37 40:37]
  assign io_rdata_11 = reg_8; // @[datapath.scala 37:42 38:37 40:37]
  assign io_rdata_12 = reg_9; // @[datapath.scala 37:42 38:37 40:37]
  assign io_rdata_13 = reg_10; // @[datapath.scala 37:42 38:37 40:37]
  assign io_rdata_14 = reg_11; // @[datapath.scala 37:42 38:37 40:37]
  assign io_rdata_15 = reg_12; // @[datapath.scala 37:42 38:37 40:37]
  assign io_rdata_16 = reg_13; // @[datapath.scala 37:42 38:37 40:37]
  assign io_rdata_17 = reg_14; // @[datapath.scala 37:42 38:37 40:37]
  assign io_rdata_18 = reg_15; // @[datapath.scala 37:42 38:37 40:37]
  assign io_rdata_19 = reg_16; // @[datapath.scala 37:42 38:37 40:37]
  assign io_rdata_20 = reg_17; // @[datapath.scala 37:42 38:37 40:37]
  assign io_rdata_21 = reg_18; // @[datapath.scala 37:42 38:37 40:37]
  assign io_rdata_22 = reg_19; // @[datapath.scala 37:42 38:37 40:37]
  assign io_rdata_23 = reg_20; // @[datapath.scala 37:42 38:37 40:37]
  assign io_rdata_24 = reg_21; // @[datapath.scala 37:42 38:37 40:37]
  assign io_rdata_25 = reg_22; // @[datapath.scala 37:42 38:37 40:37]
  assign io_rdata_26 = reg_23; // @[datapath.scala 37:42 38:37 40:37]
  assign io_rdata_27 = reg_24; // @[datapath.scala 37:42 38:37 40:37]
  assign io_rdata_28 = reg_25; // @[datapath.scala 37:42 38:37 40:37]
  assign io_rdata_29 = reg_26; // @[datapath.scala 37:42 38:37 40:37]
  assign io_rdata_30 = reg_27; // @[datapath.scala 37:42 38:37 40:37]
  assign io_rdata_31 = reg_28; // @[datapath.scala 37:42 38:37 40:37]
  assign io_rdata_32 = reg_29; // @[datapath.scala 37:42 38:37 40:37]
  assign io_rdata_33 = reg_30; // @[datapath.scala 37:42 38:37 40:37]
  assign io_rdata_34 = reg_31; // @[datapath.scala 37:42 38:37 40:37]
  always @(posedge clock) begin
    if (reset) begin // @[datapath.scala 25:22]
      reg_0 <= 64'h0; // @[datapath.scala 25:22]
    end else if (io_wen) begin // @[datapath.scala 28:17]
      if (5'h0 == io_waddr) begin // @[datapath.scala 29:23]
        reg_0 <= io_wdata; // @[datapath.scala 29:23]
      end
    end
    if (reset) begin // @[datapath.scala 25:22]
      reg_1 <= 64'h0; // @[datapath.scala 25:22]
    end else if (io_wen) begin // @[datapath.scala 28:17]
      if (5'h1 == io_waddr) begin // @[datapath.scala 29:23]
        reg_1 <= io_wdata; // @[datapath.scala 29:23]
      end
    end
    if (reset) begin // @[datapath.scala 25:22]
      reg_2 <= 64'h0; // @[datapath.scala 25:22]
    end else if (io_wen) begin // @[datapath.scala 28:17]
      if (5'h2 == io_waddr) begin // @[datapath.scala 29:23]
        reg_2 <= io_wdata; // @[datapath.scala 29:23]
      end
    end
    if (reset) begin // @[datapath.scala 25:22]
      reg_3 <= 64'h0; // @[datapath.scala 25:22]
    end else if (io_wen) begin // @[datapath.scala 28:17]
      if (5'h3 == io_waddr) begin // @[datapath.scala 29:23]
        reg_3 <= io_wdata; // @[datapath.scala 29:23]
      end
    end
    if (reset) begin // @[datapath.scala 25:22]
      reg_4 <= 64'h0; // @[datapath.scala 25:22]
    end else if (io_wen) begin // @[datapath.scala 28:17]
      if (5'h4 == io_waddr) begin // @[datapath.scala 29:23]
        reg_4 <= io_wdata; // @[datapath.scala 29:23]
      end
    end
    if (reset) begin // @[datapath.scala 25:22]
      reg_5 <= 64'h0; // @[datapath.scala 25:22]
    end else if (io_wen) begin // @[datapath.scala 28:17]
      if (5'h5 == io_waddr) begin // @[datapath.scala 29:23]
        reg_5 <= io_wdata; // @[datapath.scala 29:23]
      end
    end
    if (reset) begin // @[datapath.scala 25:22]
      reg_6 <= 64'h0; // @[datapath.scala 25:22]
    end else if (io_wen) begin // @[datapath.scala 28:17]
      if (5'h6 == io_waddr) begin // @[datapath.scala 29:23]
        reg_6 <= io_wdata; // @[datapath.scala 29:23]
      end
    end
    if (reset) begin // @[datapath.scala 25:22]
      reg_7 <= 64'h0; // @[datapath.scala 25:22]
    end else if (io_wen) begin // @[datapath.scala 28:17]
      if (5'h7 == io_waddr) begin // @[datapath.scala 29:23]
        reg_7 <= io_wdata; // @[datapath.scala 29:23]
      end
    end
    if (reset) begin // @[datapath.scala 25:22]
      reg_8 <= 64'h0; // @[datapath.scala 25:22]
    end else if (io_wen) begin // @[datapath.scala 28:17]
      if (5'h8 == io_waddr) begin // @[datapath.scala 29:23]
        reg_8 <= io_wdata; // @[datapath.scala 29:23]
      end
    end
    if (reset) begin // @[datapath.scala 25:22]
      reg_9 <= 64'h0; // @[datapath.scala 25:22]
    end else if (io_wen) begin // @[datapath.scala 28:17]
      if (5'h9 == io_waddr) begin // @[datapath.scala 29:23]
        reg_9 <= io_wdata; // @[datapath.scala 29:23]
      end
    end
    if (reset) begin // @[datapath.scala 25:22]
      reg_10 <= 64'h0; // @[datapath.scala 25:22]
    end else if (io_wen) begin // @[datapath.scala 28:17]
      if (5'ha == io_waddr) begin // @[datapath.scala 29:23]
        reg_10 <= io_wdata; // @[datapath.scala 29:23]
      end
    end
    if (reset) begin // @[datapath.scala 25:22]
      reg_11 <= 64'h0; // @[datapath.scala 25:22]
    end else if (io_wen) begin // @[datapath.scala 28:17]
      if (5'hb == io_waddr) begin // @[datapath.scala 29:23]
        reg_11 <= io_wdata; // @[datapath.scala 29:23]
      end
    end
    if (reset) begin // @[datapath.scala 25:22]
      reg_12 <= 64'h0; // @[datapath.scala 25:22]
    end else if (io_wen) begin // @[datapath.scala 28:17]
      if (5'hc == io_waddr) begin // @[datapath.scala 29:23]
        reg_12 <= io_wdata; // @[datapath.scala 29:23]
      end
    end
    if (reset) begin // @[datapath.scala 25:22]
      reg_13 <= 64'h0; // @[datapath.scala 25:22]
    end else if (io_wen) begin // @[datapath.scala 28:17]
      if (5'hd == io_waddr) begin // @[datapath.scala 29:23]
        reg_13 <= io_wdata; // @[datapath.scala 29:23]
      end
    end
    if (reset) begin // @[datapath.scala 25:22]
      reg_14 <= 64'h0; // @[datapath.scala 25:22]
    end else if (io_wen) begin // @[datapath.scala 28:17]
      if (5'he == io_waddr) begin // @[datapath.scala 29:23]
        reg_14 <= io_wdata; // @[datapath.scala 29:23]
      end
    end
    if (reset) begin // @[datapath.scala 25:22]
      reg_15 <= 64'h0; // @[datapath.scala 25:22]
    end else if (io_wen) begin // @[datapath.scala 28:17]
      if (5'hf == io_waddr) begin // @[datapath.scala 29:23]
        reg_15 <= io_wdata; // @[datapath.scala 29:23]
      end
    end
    if (reset) begin // @[datapath.scala 25:22]
      reg_16 <= 64'h0; // @[datapath.scala 25:22]
    end else if (io_wen) begin // @[datapath.scala 28:17]
      if (5'h10 == io_waddr) begin // @[datapath.scala 29:23]
        reg_16 <= io_wdata; // @[datapath.scala 29:23]
      end
    end
    if (reset) begin // @[datapath.scala 25:22]
      reg_17 <= 64'h0; // @[datapath.scala 25:22]
    end else if (io_wen) begin // @[datapath.scala 28:17]
      if (5'h11 == io_waddr) begin // @[datapath.scala 29:23]
        reg_17 <= io_wdata; // @[datapath.scala 29:23]
      end
    end
    if (reset) begin // @[datapath.scala 25:22]
      reg_18 <= 64'h0; // @[datapath.scala 25:22]
    end else if (io_wen) begin // @[datapath.scala 28:17]
      if (5'h12 == io_waddr) begin // @[datapath.scala 29:23]
        reg_18 <= io_wdata; // @[datapath.scala 29:23]
      end
    end
    if (reset) begin // @[datapath.scala 25:22]
      reg_19 <= 64'h0; // @[datapath.scala 25:22]
    end else if (io_wen) begin // @[datapath.scala 28:17]
      if (5'h13 == io_waddr) begin // @[datapath.scala 29:23]
        reg_19 <= io_wdata; // @[datapath.scala 29:23]
      end
    end
    if (reset) begin // @[datapath.scala 25:22]
      reg_20 <= 64'h0; // @[datapath.scala 25:22]
    end else if (io_wen) begin // @[datapath.scala 28:17]
      if (5'h14 == io_waddr) begin // @[datapath.scala 29:23]
        reg_20 <= io_wdata; // @[datapath.scala 29:23]
      end
    end
    if (reset) begin // @[datapath.scala 25:22]
      reg_21 <= 64'h0; // @[datapath.scala 25:22]
    end else if (io_wen) begin // @[datapath.scala 28:17]
      if (5'h15 == io_waddr) begin // @[datapath.scala 29:23]
        reg_21 <= io_wdata; // @[datapath.scala 29:23]
      end
    end
    if (reset) begin // @[datapath.scala 25:22]
      reg_22 <= 64'h0; // @[datapath.scala 25:22]
    end else if (io_wen) begin // @[datapath.scala 28:17]
      if (5'h16 == io_waddr) begin // @[datapath.scala 29:23]
        reg_22 <= io_wdata; // @[datapath.scala 29:23]
      end
    end
    if (reset) begin // @[datapath.scala 25:22]
      reg_23 <= 64'h0; // @[datapath.scala 25:22]
    end else if (io_wen) begin // @[datapath.scala 28:17]
      if (5'h17 == io_waddr) begin // @[datapath.scala 29:23]
        reg_23 <= io_wdata; // @[datapath.scala 29:23]
      end
    end
    if (reset) begin // @[datapath.scala 25:22]
      reg_24 <= 64'h0; // @[datapath.scala 25:22]
    end else if (io_wen) begin // @[datapath.scala 28:17]
      if (5'h18 == io_waddr) begin // @[datapath.scala 29:23]
        reg_24 <= io_wdata; // @[datapath.scala 29:23]
      end
    end
    if (reset) begin // @[datapath.scala 25:22]
      reg_25 <= 64'h0; // @[datapath.scala 25:22]
    end else if (io_wen) begin // @[datapath.scala 28:17]
      if (5'h19 == io_waddr) begin // @[datapath.scala 29:23]
        reg_25 <= io_wdata; // @[datapath.scala 29:23]
      end
    end
    if (reset) begin // @[datapath.scala 25:22]
      reg_26 <= 64'h0; // @[datapath.scala 25:22]
    end else if (io_wen) begin // @[datapath.scala 28:17]
      if (5'h1a == io_waddr) begin // @[datapath.scala 29:23]
        reg_26 <= io_wdata; // @[datapath.scala 29:23]
      end
    end
    if (reset) begin // @[datapath.scala 25:22]
      reg_27 <= 64'h0; // @[datapath.scala 25:22]
    end else if (io_wen) begin // @[datapath.scala 28:17]
      if (5'h1b == io_waddr) begin // @[datapath.scala 29:23]
        reg_27 <= io_wdata; // @[datapath.scala 29:23]
      end
    end
    if (reset) begin // @[datapath.scala 25:22]
      reg_28 <= 64'h0; // @[datapath.scala 25:22]
    end else if (io_wen) begin // @[datapath.scala 28:17]
      if (5'h1c == io_waddr) begin // @[datapath.scala 29:23]
        reg_28 <= io_wdata; // @[datapath.scala 29:23]
      end
    end
    if (reset) begin // @[datapath.scala 25:22]
      reg_29 <= 64'h0; // @[datapath.scala 25:22]
    end else if (io_wen) begin // @[datapath.scala 28:17]
      if (5'h1d == io_waddr) begin // @[datapath.scala 29:23]
        reg_29 <= io_wdata; // @[datapath.scala 29:23]
      end
    end
    if (reset) begin // @[datapath.scala 25:22]
      reg_30 <= 64'h0; // @[datapath.scala 25:22]
    end else if (io_wen) begin // @[datapath.scala 28:17]
      if (5'h1e == io_waddr) begin // @[datapath.scala 29:23]
        reg_30 <= io_wdata; // @[datapath.scala 29:23]
      end
    end
    if (reset) begin // @[datapath.scala 25:22]
      reg_31 <= 64'h0; // @[datapath.scala 25:22]
    end else if (io_wen) begin // @[datapath.scala 28:17]
      if (5'h1f == io_waddr) begin // @[datapath.scala 29:23]
        reg_31 <= io_wdata; // @[datapath.scala 29:23]
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
  output        io_trap
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
  reg [1:0] mode; // @[csr.scala 150:27]
  reg  mstatus_sum; // @[csr.scala 155:30]
  reg [1:0] mstatus_mpp; // @[csr.scala 155:30]
  reg  mstatus_spp; // @[csr.scala 155:30]
  reg  mstatus_mpie; // @[csr.scala 155:30]
  reg  mstatus_spie; // @[csr.scala 155:30]
  reg  mstatus_mie; // @[csr.scala 155:30]
  reg  mstatus_sie; // @[csr.scala 155:30]
  reg [63:0] medeleg_data; // @[csr.scala 157:30]
  reg [63:0] mideleg_data; // @[csr.scala 158:30]
  reg  mie_meie; // @[csr.scala 159:34]
  reg  mie_seie; // @[csr.scala 159:34]
  reg  mie_mtie; // @[csr.scala 159:34]
  reg  mie_stie; // @[csr.scala 159:34]
  reg  mie_msie; // @[csr.scala 159:34]
  reg  mie_ssie; // @[csr.scala 159:34]
  reg [61:0] mtvec_base; // @[csr.scala 160:34]
  reg [1:0] mtvec_mode; // @[csr.scala 160:34]
  reg [63:0] mscratch_data; // @[csr.scala 161:30]
  reg [63:0] mepc_data; // @[csr.scala 162:34]
  reg  mcause_int; // @[csr.scala 163:34]
  reg [62:0] mcause_code; // @[csr.scala 163:34]
  reg [63:0] mtval_data; // @[csr.scala 164:34]
  reg  mip_meip; // @[csr.scala 165:34]
  reg  mip_seip; // @[csr.scala 165:34]
  reg  mip_stip; // @[csr.scala 165:34]
  reg  mip_msip; // @[csr.scala 165:34]
  reg  mip_ssip; // @[csr.scala 165:34]
  reg [63:0] mcycle_data; // @[csr.scala 167:34]
  reg [63:0] minstret_data; // @[csr.scala 168:30]
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
  reg [61:0] stvec_base; // @[csr.scala 172:34]
  reg [1:0] stvec_mode; // @[csr.scala 172:34]
  reg [63:0] sscratch_data; // @[csr.scala 173:30]
  reg [63:0] sepc_data; // @[csr.scala 174:34]
  reg  scause_int; // @[csr.scala 175:34]
  reg [62:0] scause_code; // @[csr.scala 175:34]
  reg [63:0] stval_data; // @[csr.scala 176:34]
  wire [12:0] lo = {4'h0,sstatus_spp,2'h0,sstatus_spie,3'h0,sstatus_sie,1'h0}; // @[csr.scala 188:70]
  wire [63:0] _T = {45'h0,sstatus_sum,1'h0,4'h0,lo}; // @[csr.scala 188:70]
  wire  tmp_meie = _sie_T[11]; // @[csrFile.scala 311:18]
  wire  tmp_mtie = _sie_T[7]; // @[csrFile.scala 313:18]
  wire  tmp_msie = _sie_T[3]; // @[csrFile.scala 315:18]
  wire [5:0] lo_7 = {_sie_T[5],1'h0,tmp_msie,1'h0,_sie_T[1],1'h0}; // @[csrFile.scala 37:29]
  wire [63:0] _T_162 = {52'h0,tmp_meie,1'h0,_sie_T[9],1'h0,tmp_mtie,1'h0,lo_7}; // @[csrFile.scala 37:29]
  wire  sie_ssie = _T_162[1]; // @[csrFile.scala 65:29]
  wire  sie_stie = _T_162[5]; // @[csrFile.scala 64:29]
  wire  sie_seie = _T_162[9]; // @[csrFile.scala 63:29]
  wire [63:0] _T_1 = {54'h0,sie_seie,3'h0,sie_stie,3'h0,sie_ssie,1'h0}; // @[csr.scala 189:66]
  wire [63:0] _T_2 = {stvec_base,stvec_mode}; // @[csr.scala 190:68]
  wire [63:0] _T_3 = {scause_int,scause_code}; // @[csr.scala 194:69]
  wire [63:0] _T_4 = {54'h0,mip_seip,3'h0,mip_stip,3'h0,mip_ssip,1'h0}; // @[csr.scala 196:66]
  wire [63:0] _T_9 = {mtvec_base,mtvec_mode}; // @[csr.scala 207:68]
  wire [63:0] _T_10 = {mcause_int,mcause_code}; // @[csr.scala 211:69]
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
  wire  _instValid_T = readable & writable; // @[csr.scala 225:43]
  wire  _instValid_T_6 = 3'h2 == io_r_op ? writable : 3'h1 == io_r_op & readable; // @[Mux.scala 81:58]
  wire  _instValid_T_8 = 3'h3 == io_r_op ? _instValid_T : _instValid_T_6; // @[Mux.scala 81:58]
  wire  _instValid_T_10 = 3'h4 == io_r_op ? _instValid_T : _instValid_T_8; // @[Mux.scala 81:58]
  wire  instValid = 3'h5 == io_r_op ? _instValid_T : _instValid_T_10; // @[Mux.scala 81:58]
  wire  modeValid = io_r_addr[9:8] <= mode & io_inst_mode <= mode; // @[csr.scala 243:50]
  wire  valid = instValid & modeValid; // @[csr.scala 244:31]
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
  wire  writeEn = io_w_op == 3'h2 | io_w_op == 3'h3 | io_w_op == 3'h5 | io_w_op == 3'h4; // @[csr.scala 249:73]
  wire [63:0] _writeData_T = csrData | io_w_data; // @[csr.scala 253:37]
  wire [63:0] _writeData_T_1 = ~io_w_data; // @[csr.scala 254:39]
  wire [63:0] _writeData_T_2 = csrData & _writeData_T_1; // @[csr.scala 254:37]
  wire [63:0] _writeData_T_4 = 3'h2 == io_w_op ? io_w_data : 64'h0; // @[Mux.scala 81:58]
  wire [63:0] _writeData_T_6 = 3'h3 == io_w_op ? io_w_data : _writeData_T_4; // @[Mux.scala 81:58]
  wire [63:0] _writeData_T_8 = 3'h4 == io_w_op ? _writeData_T : _writeData_T_6; // @[Mux.scala 81:58]
  wire [63:0] writeData = 3'h5 == io_w_op ? _writeData_T_2 : _writeData_T_8; // @[Mux.scala 81:58]
  wire [63:0] flagIntS = _T_4 & _T_1; // @[csr.scala 259:35]
  wire [63:0] flagIntM = _sip_T & _sie_T; // @[csr.scala 260:35]
  wire [63:0] _hasIntS_T_4 = flagIntS & mideleg_data; // @[csr.scala 269:97]
  wire  hasIntS = (mode < 2'h1 | mode == 2'h1 & mstatus_sie) & |_hasIntS_T_4; // @[csr.scala 269:27]
  wire [63:0] _hasIntM_T_2 = ~mideleg_data; // @[csr.scala 270:79]
  wire [63:0] _hasIntM_T_3 = flagIntS & _hasIntM_T_2; // @[csr.scala 270:77]
  wire  hasIntM = (mode <= 2'h1 | mstatus_mie) & |_hasIntM_T_3; // @[csr.scala 270:31]
  wire  hasInt = hasIntM | hasIntS; // @[csr.scala 271:30]
  wire  handIntS = hasInt & ~hasIntM; // @[csr.scala 273:31]
  wire  _hasExc_T_4 = ~valid | |io_illegal_inst | io_fetch_misalign; // @[csr.scala 282:69]
  wire  _hasExc_T_8 = 32'h73 == io_inst; // @[csr.scala 283:127]
  wire  _hasExc_T_11 = 32'h100073 == io_inst; // @[csr.scala 283:161]
  wire  _hasExc_T_12 = _hasExc_T_4 | io_load_misalign | io_store_misalign | 32'h73 == io_inst | 32'h100073 == io_inst; // @[csr.scala 283:150]
  wire  hasExc = ~hasInt & _hasExc_T_12; // @[csr.scala 282:35]
  wire [62:0] _excCause_T_6 = valid | io_illegal_inst != 32'h0 ? 63'h2 : {{62'd0}, io_fetch_misalign}; // @[csr.scala 288:76]
  wire [62:0] _excCause_T_7 = io_store_misalign ? 63'h6 : _excCause_T_6; // @[csr.scala 287:68]
  wire [62:0] _excCause_T_8 = io_load_misalign ? 63'h4 : _excCause_T_7; // @[csr.scala 286:60]
  wire [62:0] _excCause_T_9 = _hasExc_T_11 ? 63'h3 : _excCause_T_8; // @[csr.scala 285:52]
  wire [62:0] excCause = _hasExc_T_8 ? 63'h8 : _excCause_T_9; // @[csr.scala 284:28]
  wire [63:0] _hasExcS_T_1 = medeleg_data >> excCause[4:0]; // @[csr.scala 293:47]
  wire  hasExcS = hasExc & _hasExcS_T_1[0]; // @[csr.scala 293:30]
  wire  handExcS = ~mode[1] & hasExcS; // @[csr.scala 294:33]
  wire [63:0] _intCauseS_T = {{9'd0}, flagIntS[63:9]}; // @[csr.scala 301:37]
  wire [63:0] _intCauseS_T_2 = {{1'd0}, flagIntS[63:1]}; // @[csr.scala 302:61]
  wire [62:0] _intCauseS_T_4 = _intCauseS_T_2[0] ? 63'h1 : 63'h5; // @[csr.scala 302:52]
  wire [62:0] intCauseS = _intCauseS_T[0] ? 63'h9 : _intCauseS_T_4; // @[csr.scala 301:28]
  wire [63:0] _intCause_T = {{11'd0}, flagIntM[63:11]}; // @[csr.scala 305:36]
  wire [63:0] _intCause_T_2 = {{3'd0}, flagIntM[63:3]}; // @[csr.scala 306:61]
  wire [63:0] _intCause_T_4 = {{7'd0}, flagIntM[63:7]}; // @[csr.scala 307:69]
  wire [62:0] _intCause_T_6 = _intCause_T_4[0] ? 63'h7 : intCauseS; // @[csr.scala 307:60]
  wire [62:0] _intCause_T_7 = _intCause_T_2[0] ? 63'h3 : _intCause_T_6; // @[csr.scala 306:52]
  wire [62:0] intCause = _intCause_T[0] ? 63'hb : _intCause_T_7; // @[csr.scala 305:27]
  wire [63:0] _cause_T = {1'h1,intCause}; // @[Cat.scala 31:58]
  wire [63:0] _cause_T_1 = {1'h0,excCause}; // @[Cat.scala 31:58]
  wire [63:0] cause = hasInt ? _cause_T : _cause_T_1; // @[csr.scala 312:24]
  wire  _io_flush_mask_T_1 = excCause == 63'h3; // @[csr.scala 319:78]
  wire  _io_flush_mask_T_3 = excCause == 63'h4; // @[csr.scala 320:39]
  wire  _io_flush_mask_T_4 = excCause == 63'h6; // @[csr.scala 320:71]
  wire  _io_flush_mask_T_6 = excCause == 63'h2; // @[csr.scala 321:46]
  wire  _io_flush_mask_T_7 = excCause == 63'h0; // @[csr.scala 322:54]
  wire [1:0] _io_flush_mask_T_8 = excCause == 63'h0 ? 2'h3 : 2'h0; // @[csr.scala 322:44]
  wire [1:0] _io_flush_mask_T_9 = excCause == 63'h2 ? 2'h3 : _io_flush_mask_T_8; // @[csr.scala 321:36]
  wire [1:0] _io_flush_mask_T_10 = excCause == 63'h4 | excCause == 63'h6 ? 2'h3 : _io_flush_mask_T_9; // @[csr.scala 320:28]
  wire [3:0] _io_flush_mask_T_11 = excCause == 63'h8 | excCause == 63'h3 ? 4'hf : {{2'd0}, _io_flush_mask_T_10}; // @[csr.scala 319:37]
  wire [3:0] _GEN_0 = hasExc ? _io_flush_mask_T_11 : 4'h0; // @[csr.scala 318:27 319:31 327:31]
  wire [31:0] _io_excValue_T_5 = _io_flush_mask_T_6 ? io_illegal_inst : 32'h0; // @[csr.scala 334:76]
  wire [63:0] _io_excValue_T_6 = _io_flush_mask_T_7 ? io_pc_fetch_misalign : {{32'd0}, _io_excValue_T_5}; // @[csr.scala 333:68]
  wire [63:0] _io_excValue_T_7 = _io_flush_mask_T_1 ? io_ebreak_addr : _io_excValue_T_6; // @[csr.scala 332:60]
  wire [63:0] _io_excValue_T_8 = _io_flush_mask_T_4 ? io_store_misalign_addr : _io_excValue_T_7; // @[csr.scala 331:52]
  wire [61:0] _GEN_171 = {{32'd0}, cause[29:0]}; // @[csr.scala 341:65]
  wire [61:0] _trapVecS_T_4 = stvec_base + _GEN_171; // @[csr.scala 341:65]
  wire [61:0] _trapVecS_T_5 = stvec_mode[0] & hasInt ? _trapVecS_T_4 : stvec_base; // @[csr.scala 341:27]
  wire [63:0] trapVecS = {_trapVecS_T_5, 2'h0}; // @[csr.scala 341:94]
  wire [61:0] _trapVecM_T_4 = mtvec_base + _GEN_171; // @[csr.scala 342:65]
  wire [61:0] _trapVecM_T_5 = mtvec_mode[0] & hasInt ? _trapVecM_T_4 : mtvec_base; // @[csr.scala 342:27]
  wire [63:0] trapVecM = {_trapVecM_T_5, 2'h0}; // @[csr.scala 342:94]
  wire  _trapVec_T = handIntS | handExcS; // @[csr.scala 343:36]
  wire [1:0] sretMode = {1'h0,sstatus_spp}; // @[Cat.scala 31:58]
  wire [1:0] excMode = handExcS ? 2'h1 : 2'h3; // @[csr.scala 354:26]
  wire [63:0] _mcycle_data_T_1 = mcycle_data + 64'h1; // @[csr.scala 373:36]
  wire [63:0] _minstret_data_T_1 = minstret_data + 64'h1; // @[csr.scala 375:48]
  wire [63:0] _GEN_2 = io_retired ? _minstret_data_T_1 : minstret_data; // @[csr.scala 374:25 168:30 375:31]
  wire  _T_164 = hasExc | hasInt | io_isSret; // @[csr.scala 380:32]
  wire [63:0] _sepc_data_T_1 = {io_excPC[63:2],2'h0}; // @[Cat.scala 31:58]
  wire [63:0] _GEN_3 = _trapVec_T ? _sepc_data_T_1 : sepc_data; // @[csr.scala 389:49 csrFile.scala 154:22 csr.scala 174:34]
  wire  _GEN_4 = _trapVec_T ? cause[63] : scause_int; // @[csr.scala 389:49 csrFile.scala 169:11 csr.scala 175:34]
  wire [62:0] _GEN_5 = _trapVec_T ? {{59'd0}, cause[3:0]} : scause_code; // @[csr.scala 389:49 csrFile.scala 170:11 csr.scala 175:34]
  wire [63:0] _GEN_6 = _trapVec_T ? io_excValue : stval_data; // @[csr.scala 389:49 csrFile.scala 30:22 csr.scala 176:34]
  wire  _GEN_7 = _trapVec_T ? mstatus_sie : mstatus_spie; // @[csr.scala 155:30 389:49 393:38]
  wire  _GEN_8 = _trapVec_T ? 1'h0 : mstatus_sie; // @[csr.scala 155:30 389:49 394:37]
  wire  _GEN_9 = _trapVec_T ? mode[0] : mstatus_spp; // @[csr.scala 155:30 389:49 395:37]
  wire [63:0] _GEN_10 = _trapVec_T ? mepc_data : _sepc_data_T_1; // @[csr.scala 162:34 389:49 csrFile.scala 386:11]
  wire  _GEN_11 = _trapVec_T ? mcause_int : cause[63]; // @[csr.scala 163:34 389:49 csrFile.scala 401:11]
  wire [62:0] _GEN_12 = _trapVec_T ? mcause_code : {{59'd0}, cause[3:0]}; // @[csr.scala 163:34 389:49 csrFile.scala 402:11]
  wire [63:0] _GEN_13 = _trapVec_T ? mtval_data : io_excValue; // @[csr.scala 164:34 389:49 csrFile.scala 30:22]
  wire  _GEN_14 = _trapVec_T ? mstatus_mpie : mstatus_mie; // @[csr.scala 155:30 389:49 400:38]
  wire  _GEN_15 = _trapVec_T & mstatus_mie; // @[csr.scala 155:30 389:49 401:37]
  wire [1:0] _GEN_16 = _trapVec_T ? mstatus_mpp : mode; // @[csr.scala 155:30 389:49 402:37]
  wire  _GEN_18 = io_isMret | _GEN_14; // @[csr.scala 385:38 387:38]
  wire  _GEN_24 = io_isMret ? mstatus_spie : _GEN_7; // @[csr.scala 155:30 385:38]
  wire  _GEN_32 = io_isSret | _GEN_24; // @[csr.scala 381:32 383:38]
  wire  tmp_1_sum = writeData[18]; // @[csrFile.scala 96:29]
  wire  tmp_1_spp = writeData[8]; // @[csrFile.scala 97:33]
  wire  tmp_1_spie = writeData[5]; // @[csrFile.scala 98:29]
  wire  tmp_1_sie = writeData[1]; // @[csrFile.scala 99:29]
  wire [12:0] lo_8 = {4'h0,tmp_1_spp,2'h0,tmp_1_spie,3'h0,tmp_1_sie,1'h0}; // @[csrFile.scala 37:29]
  wire [63:0] _T_172 = {45'h0,tmp_1_sum,1'h0,4'h0,lo_8}; // @[csrFile.scala 37:29]
  wire  _GEN_45 = io_w_addr == 12'h100 ? _T_172[18] : mstatus_sum; // @[csr.scala 406:48 csrFile.scala 235:11 csr.scala 155:30]
  wire [1:0] _GEN_46 = io_w_addr == 12'h100 ? _T_172[12:11] : mstatus_mpp; // @[csr.scala 406:48 csrFile.scala 236:11 csr.scala 155:30]
  wire  _GEN_47 = io_w_addr == 12'h100 ? _T_172[8] : mstatus_spp; // @[csr.scala 406:48 csrFile.scala 237:11 csr.scala 155:30]
  wire  _GEN_48 = io_w_addr == 12'h100 ? _T_172[7] : mstatus_mpie; // @[csr.scala 406:48 csrFile.scala 238:11 csr.scala 155:30]
  wire  _GEN_49 = io_w_addr == 12'h100 ? _T_172[5] : mstatus_spie; // @[csr.scala 406:48 csrFile.scala 239:11 csr.scala 155:30]
  wire  _GEN_50 = io_w_addr == 12'h100 ? _T_172[3] : mstatus_mie; // @[csr.scala 406:48 csrFile.scala 240:11 csr.scala 155:30]
  wire  _GEN_51 = io_w_addr == 12'h100 ? _T_172[1] : mstatus_sie; // @[csr.scala 406:48 csrFile.scala 241:11 csr.scala 155:30]
  wire  tmp_2_seie = writeData[9]; // @[csrFile.scala 63:29]
  wire [63:0] _T_174 = {54'h0,tmp_2_seie,3'h0,tmp_1_spie,3'h0,tmp_1_sie,1'h0}; // @[csrFile.scala 37:29]
  wire  _GEN_52 = io_w_addr == 12'h104 ? _T_174[11] : mie_meie; // @[csr.scala 407:44 csrFile.scala 311:11 csr.scala 159:34]
  wire  _GEN_53 = io_w_addr == 12'h104 ? _T_174[9] : mie_seie; // @[csr.scala 407:44 csrFile.scala 312:11 csr.scala 159:34]
  wire  _GEN_54 = io_w_addr == 12'h104 ? _T_174[7] : mie_mtie; // @[csr.scala 407:44 csrFile.scala 313:11 csr.scala 159:34]
  wire  _GEN_55 = io_w_addr == 12'h104 ? _T_174[5] : mie_stie; // @[csr.scala 407:44 csrFile.scala 314:11 csr.scala 159:34]
  wire  _GEN_56 = io_w_addr == 12'h104 ? _T_174[3] : mie_msie; // @[csr.scala 407:44 csrFile.scala 315:11 csr.scala 159:34]
  wire  _GEN_57 = io_w_addr == 12'h104 ? _T_174[1] : mie_ssie; // @[csr.scala 407:44 csrFile.scala 316:11 csr.scala 159:34]
  wire [63:0] _T_176 = {59'h0,3'h0,tmp_1_sie,1'h0}; // @[csrFile.scala 37:29]
  wire  _GEN_60 = io_w_addr == 12'h144 & _T_176[5]; // @[csr.scala 408:44 csrFile.scala 345:11 csr.scala 364:18]
  wire [63:0] _sepc_data_T_3 = {writeData[63:2],2'h0}; // @[Cat.scala 31:58]
  wire [15:0] _medeleg_data_T_5 = {3'h0,writeData[12],2'h0,writeData[9:8],1'h0,writeData[6],1'h0,writeData[4:2],1'h0,
    writeData[0]}; // @[Cat.scala 31:58]
  wire [5:0] mideleg_data_lo = {tmp_1_spie,1'h0,writeData[3],1'h0,tmp_1_sie,1'h0}; // @[Cat.scala 31:58]
  wire [22:0] _mideleg_data_T_6 = {1'h0,writeData[11],11'h0,tmp_2_seie,1'h0,writeData[7],1'h0,mideleg_data_lo}; // @[Cat.scala 31:58]
  wire  _GEN_109 = writeEn & _GEN_60; // @[csr.scala 364:18 405:41]
  assign io_flush_mask = hasInt | io_isMret | io_isSret ? 4'hf : _GEN_0; // @[csr.scala 316:47 317:31]
  assign io_r_data = _T_13 ? mcycle_data : _T_100; // @[Lookup.scala 34:39]
  assign io_excValue = _io_flush_mask_T_3 ? io_load_misalign_addr : _io_excValue_T_8; // @[csr.scala 330:27]
  assign io_trapVec = handIntS | handExcS ? trapVecS : trapVecM; // @[csr.scala 343:26]
  assign io_trap = _T_164 | io_isMret; // @[csr.scala 435:50]
  always @(posedge clock) begin
    if (reset) begin // @[csr.scala 150:27]
      mode <= 2'h3; // @[csr.scala 150:27]
    end else if (hasInt) begin // @[csr.scala 355:27]
      if (handIntS) begin // @[csr.scala 351:26]
        mode <= 2'h1;
      end else begin
        mode <= 2'h3;
      end
    end else if (io_isSret) begin // @[csr.scala 356:44]
      mode <= sretMode;
    end else if (io_isMret) begin // @[csr.scala 357:44]
      mode <= mstatus_mpp;
    end else begin
      mode <= excMode;
    end
    if (reset) begin // @[csr.scala 155:30]
      mstatus_sum <= 1'h0; // @[csr.scala 155:30]
    end else if (!(hasExc | hasInt | io_isSret | io_isMret)) begin // @[csr.scala 380:72]
      if (writeEn) begin // @[csr.scala 405:41]
        if (io_w_addr == 12'h300) begin // @[csr.scala 417:48]
          mstatus_sum <= tmp_1_sum; // @[csrFile.scala 235:11]
        end else begin
          mstatus_sum <= _GEN_45;
        end
      end
    end
    if (reset) begin // @[csr.scala 155:30]
      mstatus_mpp <= 2'h0; // @[csr.scala 155:30]
    end else if (hasExc | hasInt | io_isSret | io_isMret) begin // @[csr.scala 380:72]
      if (!(io_isSret)) begin // @[csr.scala 381:32]
        if (io_isMret) begin // @[csr.scala 385:38]
          mstatus_mpp <= 2'h0; // @[csr.scala 388:37]
        end else begin
          mstatus_mpp <= _GEN_16;
        end
      end
    end else if (writeEn) begin // @[csr.scala 405:41]
      if (io_w_addr == 12'h300) begin // @[csr.scala 417:48]
        mstatus_mpp <= writeData[12:11]; // @[csrFile.scala 236:11]
      end else begin
        mstatus_mpp <= _GEN_46;
      end
    end
    if (reset) begin // @[csr.scala 155:30]
      mstatus_spp <= 1'h0; // @[csr.scala 155:30]
    end else if (hasExc | hasInt | io_isSret | io_isMret) begin // @[csr.scala 380:72]
      if (io_isSret) begin // @[csr.scala 381:32]
        mstatus_spp <= 1'h0; // @[csr.scala 384:41]
      end else if (!(io_isMret)) begin // @[csr.scala 385:38]
        mstatus_spp <= _GEN_9;
      end
    end else if (writeEn) begin // @[csr.scala 405:41]
      if (io_w_addr == 12'h300) begin // @[csr.scala 417:48]
        mstatus_spp <= tmp_1_spp; // @[csrFile.scala 237:11]
      end else begin
        mstatus_spp <= _GEN_47;
      end
    end
    if (reset) begin // @[csr.scala 155:30]
      mstatus_mpie <= 1'h0; // @[csr.scala 155:30]
    end else if (hasExc | hasInt | io_isSret | io_isMret) begin // @[csr.scala 380:72]
      if (!(io_isSret)) begin // @[csr.scala 381:32]
        mstatus_mpie <= _GEN_18;
      end
    end else if (writeEn) begin // @[csr.scala 405:41]
      if (io_w_addr == 12'h300) begin // @[csr.scala 417:48]
        mstatus_mpie <= writeData[7]; // @[csrFile.scala 238:11]
      end else begin
        mstatus_mpie <= _GEN_48;
      end
    end
    if (reset) begin // @[csr.scala 155:30]
      mstatus_spie <= 1'h0; // @[csr.scala 155:30]
    end else if (hasExc | hasInt | io_isSret | io_isMret) begin // @[csr.scala 380:72]
      mstatus_spie <= _GEN_32;
    end else if (writeEn) begin // @[csr.scala 405:41]
      if (io_w_addr == 12'h300) begin // @[csr.scala 417:48]
        mstatus_spie <= tmp_1_spie; // @[csrFile.scala 239:11]
      end else begin
        mstatus_spie <= _GEN_49;
      end
    end
    if (reset) begin // @[csr.scala 155:30]
      mstatus_mie <= 1'h0; // @[csr.scala 155:30]
    end else if (hasExc | hasInt | io_isSret | io_isMret) begin // @[csr.scala 380:72]
      if (!(io_isSret)) begin // @[csr.scala 381:32]
        if (io_isMret) begin // @[csr.scala 385:38]
          mstatus_mie <= mstatus_mpie; // @[csr.scala 386:37]
        end else begin
          mstatus_mie <= _GEN_15;
        end
      end
    end else if (writeEn) begin // @[csr.scala 405:41]
      if (io_w_addr == 12'h300) begin // @[csr.scala 417:48]
        mstatus_mie <= writeData[3]; // @[csrFile.scala 240:11]
      end else begin
        mstatus_mie <= _GEN_50;
      end
    end
    if (reset) begin // @[csr.scala 155:30]
      mstatus_sie <= 1'h0; // @[csr.scala 155:30]
    end else if (hasExc | hasInt | io_isSret | io_isMret) begin // @[csr.scala 380:72]
      if (io_isSret) begin // @[csr.scala 381:32]
        mstatus_sie <= mstatus_spie; // @[csr.scala 382:37]
      end else if (!(io_isMret)) begin // @[csr.scala 385:38]
        mstatus_sie <= _GEN_8;
      end
    end else if (writeEn) begin // @[csr.scala 405:41]
      if (io_w_addr == 12'h300) begin // @[csr.scala 417:48]
        mstatus_sie <= tmp_1_sie; // @[csrFile.scala 241:11]
      end else begin
        mstatus_sie <= _GEN_51;
      end
    end
    if (reset) begin // @[csr.scala 157:30]
      medeleg_data <= 64'h0; // @[csr.scala 157:30]
    end else if (!(hasExc | hasInt | io_isSret | io_isMret)) begin // @[csr.scala 380:72]
      if (writeEn) begin // @[csr.scala 405:41]
        if (io_w_addr == 12'h302) begin // @[csr.scala 418:48]
          medeleg_data <= {{48'd0}, _medeleg_data_T_5}; // @[csrFile.scala 270:11]
        end
      end
    end
    if (reset) begin // @[csr.scala 158:30]
      mideleg_data <= 64'h0; // @[csr.scala 158:30]
    end else if (!(hasExc | hasInt | io_isSret | io_isMret)) begin // @[csr.scala 380:72]
      if (writeEn) begin // @[csr.scala 405:41]
        if (io_w_addr == 12'h303) begin // @[csr.scala 419:48]
          mideleg_data <= {{41'd0}, _mideleg_data_T_6}; // @[csrFile.scala 285:11]
        end
      end
    end
    if (reset) begin // @[csr.scala 159:34]
      mie_meie <= 1'h0; // @[csr.scala 159:34]
    end else if (!(hasExc | hasInt | io_isSret | io_isMret)) begin // @[csr.scala 380:72]
      if (writeEn) begin // @[csr.scala 405:41]
        if (io_w_addr == 12'h304) begin // @[csr.scala 420:44]
          mie_meie <= writeData[11]; // @[csrFile.scala 311:11]
        end else begin
          mie_meie <= _GEN_52;
        end
      end
    end
    if (reset) begin // @[csr.scala 159:34]
      mie_seie <= 1'h0; // @[csr.scala 159:34]
    end else if (!(hasExc | hasInt | io_isSret | io_isMret)) begin // @[csr.scala 380:72]
      if (writeEn) begin // @[csr.scala 405:41]
        if (io_w_addr == 12'h304) begin // @[csr.scala 420:44]
          mie_seie <= tmp_2_seie; // @[csrFile.scala 312:11]
        end else begin
          mie_seie <= _GEN_53;
        end
      end
    end
    if (reset) begin // @[csr.scala 159:34]
      mie_mtie <= 1'h0; // @[csr.scala 159:34]
    end else if (!(hasExc | hasInt | io_isSret | io_isMret)) begin // @[csr.scala 380:72]
      if (writeEn) begin // @[csr.scala 405:41]
        if (io_w_addr == 12'h304) begin // @[csr.scala 420:44]
          mie_mtie <= writeData[7]; // @[csrFile.scala 313:11]
        end else begin
          mie_mtie <= _GEN_54;
        end
      end
    end
    if (reset) begin // @[csr.scala 159:34]
      mie_stie <= 1'h0; // @[csr.scala 159:34]
    end else if (!(hasExc | hasInt | io_isSret | io_isMret)) begin // @[csr.scala 380:72]
      if (writeEn) begin // @[csr.scala 405:41]
        if (io_w_addr == 12'h304) begin // @[csr.scala 420:44]
          mie_stie <= tmp_1_spie; // @[csrFile.scala 314:11]
        end else begin
          mie_stie <= _GEN_55;
        end
      end
    end
    if (reset) begin // @[csr.scala 159:34]
      mie_msie <= 1'h0; // @[csr.scala 159:34]
    end else if (!(hasExc | hasInt | io_isSret | io_isMret)) begin // @[csr.scala 380:72]
      if (writeEn) begin // @[csr.scala 405:41]
        if (io_w_addr == 12'h304) begin // @[csr.scala 420:44]
          mie_msie <= writeData[3]; // @[csrFile.scala 315:11]
        end else begin
          mie_msie <= _GEN_56;
        end
      end
    end
    if (reset) begin // @[csr.scala 159:34]
      mie_ssie <= 1'h0; // @[csr.scala 159:34]
    end else if (!(hasExc | hasInt | io_isSret | io_isMret)) begin // @[csr.scala 380:72]
      if (writeEn) begin // @[csr.scala 405:41]
        if (io_w_addr == 12'h304) begin // @[csr.scala 420:44]
          mie_ssie <= tmp_1_sie; // @[csrFile.scala 316:11]
        end else begin
          mie_ssie <= _GEN_57;
        end
      end
    end
    if (reset) begin // @[csr.scala 160:34]
      mtvec_base <= 62'h0; // @[csr.scala 160:34]
    end else if (!(hasExc | hasInt | io_isSret | io_isMret)) begin // @[csr.scala 380:72]
      if (writeEn) begin // @[csr.scala 405:41]
        if (io_w_addr == 12'h305) begin // @[csr.scala 421:46]
          mtvec_base <= writeData[63:2]; // @[csrFile.scala 362:11]
        end
      end
    end
    if (reset) begin // @[csr.scala 160:34]
      mtvec_mode <= 2'h0; // @[csr.scala 160:34]
    end else if (!(hasExc | hasInt | io_isSret | io_isMret)) begin // @[csr.scala 380:72]
      if (writeEn) begin // @[csr.scala 405:41]
        if (io_w_addr == 12'h305) begin // @[csr.scala 421:46]
          mtvec_mode <= {{1'd0}, writeData[0]}; // @[csrFile.scala 363:11]
        end
      end
    end
    if (reset) begin // @[csr.scala 161:30]
      mscratch_data <= 64'h0; // @[csr.scala 161:30]
    end else if (!(hasExc | hasInt | io_isSret | io_isMret)) begin // @[csr.scala 380:72]
      if (writeEn) begin // @[csr.scala 405:41]
        if (io_w_addr == 12'h340) begin // @[csr.scala 422:49]
          mscratch_data <= writeData; // @[csrFile.scala 30:22]
        end
      end
    end
    if (reset) begin // @[csr.scala 162:34]
      mepc_data <= 64'h0; // @[csr.scala 162:34]
    end else if (hasExc | hasInt | io_isSret | io_isMret) begin // @[csr.scala 380:72]
      if (!(io_isSret)) begin // @[csr.scala 381:32]
        if (!(io_isMret)) begin // @[csr.scala 385:38]
          mepc_data <= _GEN_10;
        end
      end
    end else if (writeEn) begin // @[csr.scala 405:41]
      if (io_w_addr == 12'h341) begin // @[csr.scala 423:45]
        mepc_data <= _sepc_data_T_3; // @[csrFile.scala 386:11]
      end
    end
    if (reset) begin // @[csr.scala 163:34]
      mcause_int <= 1'h0; // @[csr.scala 163:34]
    end else if (hasExc | hasInt | io_isSret | io_isMret) begin // @[csr.scala 380:72]
      if (!(io_isSret)) begin // @[csr.scala 381:32]
        if (!(io_isMret)) begin // @[csr.scala 385:38]
          mcause_int <= _GEN_11;
        end
      end
    end else if (writeEn) begin // @[csr.scala 405:41]
      if (io_w_addr == 12'h342) begin // @[csr.scala 424:47]
        mcause_int <= writeData[63]; // @[csrFile.scala 401:11]
      end
    end
    if (reset) begin // @[csr.scala 163:34]
      mcause_code <= 63'h0; // @[csr.scala 163:34]
    end else if (hasExc | hasInt | io_isSret | io_isMret) begin // @[csr.scala 380:72]
      if (!(io_isSret)) begin // @[csr.scala 381:32]
        if (!(io_isMret)) begin // @[csr.scala 385:38]
          mcause_code <= _GEN_12;
        end
      end
    end else if (writeEn) begin // @[csr.scala 405:41]
      if (io_w_addr == 12'h342) begin // @[csr.scala 424:47]
        mcause_code <= {{59'd0}, writeData[3:0]}; // @[csrFile.scala 402:11]
      end
    end
    if (reset) begin // @[csr.scala 164:34]
      mtval_data <= 64'h0; // @[csr.scala 164:34]
    end else if (hasExc | hasInt | io_isSret | io_isMret) begin // @[csr.scala 380:72]
      if (!(io_isSret)) begin // @[csr.scala 381:32]
        if (!(io_isMret)) begin // @[csr.scala 385:38]
          mtval_data <= _GEN_13;
        end
      end
    end else if (writeEn) begin // @[csr.scala 405:41]
      if (io_w_addr == 12'h343) begin // @[csr.scala 425:46]
        mtval_data <= writeData; // @[csrFile.scala 30:22]
      end
    end
    if (reset) begin // @[csr.scala 165:34]
      mip_meip <= 1'h0; // @[csr.scala 165:34]
    end else if (!(hasExc | hasInt | io_isSret | io_isMret)) begin // @[csr.scala 380:72]
      if (writeEn) begin // @[csr.scala 405:41]
        if (io_w_addr == 12'h144) begin // @[csr.scala 408:44]
          mip_meip <= _T_176[7]; // @[csrFile.scala 344:15]
        end
      end
    end
    if (reset) begin // @[csr.scala 165:34]
      mip_seip <= 1'h0; // @[csr.scala 165:34]
    end else if (!(hasExc | hasInt | io_isSret | io_isMret)) begin // @[csr.scala 380:72]
      if (writeEn) begin // @[csr.scala 405:41]
        if (io_w_addr == 12'h144) begin // @[csr.scala 408:44]
          mip_seip <= _T_176[9]; // @[csrFile.scala 343:11]
        end
      end
    end
    if (reset) begin // @[csr.scala 165:34]
      mip_stip <= 1'h0; // @[csr.scala 165:34]
    end else if (hasExc | hasInt | io_isSret | io_isMret) begin // @[csr.scala 380:72]
      mip_stip <= 1'h0; // @[csr.scala 364:18]
    end else begin
      mip_stip <= _GEN_109;
    end
    if (reset) begin // @[csr.scala 165:34]
      mip_msip <= 1'h0; // @[csr.scala 165:34]
    end else if (!(hasExc | hasInt | io_isSret | io_isMret)) begin // @[csr.scala 380:72]
      if (writeEn) begin // @[csr.scala 405:41]
        if (io_w_addr == 12'h144) begin // @[csr.scala 408:44]
          mip_msip <= _T_176[3]; // @[csrFile.scala 346:15]
        end
      end
    end
    if (reset) begin // @[csr.scala 165:34]
      mip_ssip <= 1'h0; // @[csr.scala 165:34]
    end else if (!(hasExc | hasInt | io_isSret | io_isMret)) begin // @[csr.scala 380:72]
      if (writeEn) begin // @[csr.scala 405:41]
        if (io_w_addr == 12'h144) begin // @[csr.scala 408:44]
          mip_ssip <= _T_176[1]; // @[csrFile.scala 347:11]
        end
      end
    end
    if (reset) begin // @[csr.scala 167:34]
      mcycle_data <= 64'h0; // @[csr.scala 167:34]
    end else if (hasExc | hasInt | io_isSret | io_isMret) begin // @[csr.scala 380:72]
      mcycle_data <= _mcycle_data_T_1; // @[csr.scala 373:21]
    end else if (writeEn) begin // @[csr.scala 405:41]
      if (io_w_addr == 12'hb00) begin // @[csr.scala 409:47]
        mcycle_data <= writeData; // @[csrFile.scala 30:22]
      end else begin
        mcycle_data <= _mcycle_data_T_1; // @[csr.scala 373:21]
      end
    end else begin
      mcycle_data <= _mcycle_data_T_1; // @[csr.scala 373:21]
    end
    if (reset) begin // @[csr.scala 168:30]
      minstret_data <= 64'h0; // @[csr.scala 168:30]
    end else if (hasExc | hasInt | io_isSret | io_isMret) begin // @[csr.scala 380:72]
      minstret_data <= _GEN_2;
    end else if (writeEn) begin // @[csr.scala 405:41]
      if (io_w_addr == 12'hb02) begin // @[csr.scala 410:49]
        minstret_data <= writeData; // @[csrFile.scala 30:22]
      end else begin
        minstret_data <= _GEN_2;
      end
    end else begin
      minstret_data <= _GEN_2;
    end
    if (reset) begin // @[csr.scala 172:34]
      stvec_base <= 62'h0; // @[csr.scala 172:34]
    end else if (!(hasExc | hasInt | io_isSret | io_isMret)) begin // @[csr.scala 380:72]
      if (writeEn) begin // @[csr.scala 405:41]
        if (io_w_addr == 12'h105) begin // @[csr.scala 411:46]
          stvec_base <= writeData[63:2]; // @[csrFile.scala 133:22]
        end
      end
    end
    if (reset) begin // @[csr.scala 172:34]
      stvec_mode <= 2'h0; // @[csr.scala 172:34]
    end else if (!(hasExc | hasInt | io_isSret | io_isMret)) begin // @[csr.scala 380:72]
      if (writeEn) begin // @[csr.scala 405:41]
        if (io_w_addr == 12'h105) begin // @[csr.scala 411:46]
          stvec_mode <= {{1'd0}, writeData[0]}; // @[csrFile.scala 134:22]
        end
      end
    end
    if (reset) begin // @[csr.scala 173:30]
      sscratch_data <= 64'h0; // @[csr.scala 173:30]
    end else if (!(hasExc | hasInt | io_isSret | io_isMret)) begin // @[csr.scala 380:72]
      if (writeEn) begin // @[csr.scala 405:41]
        if (io_w_addr == 12'h140) begin // @[csr.scala 412:49]
          sscratch_data <= writeData; // @[csrFile.scala 30:22]
        end
      end
    end
    if (reset) begin // @[csr.scala 174:34]
      sepc_data <= 64'h0; // @[csr.scala 174:34]
    end else if (hasExc | hasInt | io_isSret | io_isMret) begin // @[csr.scala 380:72]
      if (!(io_isSret)) begin // @[csr.scala 381:32]
        if (!(io_isMret)) begin // @[csr.scala 385:38]
          sepc_data <= _GEN_3;
        end
      end
    end else if (writeEn) begin // @[csr.scala 405:41]
      if (io_w_addr == 12'h141) begin // @[csr.scala 413:45]
        sepc_data <= _sepc_data_T_3; // @[csrFile.scala 154:22]
      end
    end
    if (reset) begin // @[csr.scala 175:34]
      scause_int <= 1'h0; // @[csr.scala 175:34]
    end else if (hasExc | hasInt | io_isSret | io_isMret) begin // @[csr.scala 380:72]
      if (!(io_isSret)) begin // @[csr.scala 381:32]
        if (!(io_isMret)) begin // @[csr.scala 385:38]
          scause_int <= _GEN_4;
        end
      end
    end else if (writeEn) begin // @[csr.scala 405:41]
      if (io_w_addr == 12'h142) begin // @[csr.scala 414:47]
        scause_int <= writeData[63]; // @[csrFile.scala 169:11]
      end
    end
    if (reset) begin // @[csr.scala 175:34]
      scause_code <= 63'h0; // @[csr.scala 175:34]
    end else if (hasExc | hasInt | io_isSret | io_isMret) begin // @[csr.scala 380:72]
      if (!(io_isSret)) begin // @[csr.scala 381:32]
        if (!(io_isMret)) begin // @[csr.scala 385:38]
          scause_code <= _GEN_5;
        end
      end
    end else if (writeEn) begin // @[csr.scala 405:41]
      if (io_w_addr == 12'h142) begin // @[csr.scala 414:47]
        scause_code <= {{59'd0}, writeData[3:0]}; // @[csrFile.scala 170:11]
      end
    end
    if (reset) begin // @[csr.scala 176:34]
      stval_data <= 64'h0; // @[csr.scala 176:34]
    end else if (hasExc | hasInt | io_isSret | io_isMret) begin // @[csr.scala 380:72]
      if (!(io_isSret)) begin // @[csr.scala 381:32]
        if (!(io_isMret)) begin // @[csr.scala 385:38]
          stval_data <= _GEN_6;
        end
      end
    end else if (writeEn) begin // @[csr.scala 405:41]
      if (io_w_addr == 12'h143) begin // @[csr.scala 415:46]
        stval_data <= writeData; // @[csrFile.scala 30:22]
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
  input         io_ctrl_is_kill
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [63:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [63:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [63:0] _RAND_5;
  reg [63:0] _RAND_6;
  reg [63:0] _RAND_7;
  reg [63:0] _RAND_8;
  reg [63:0] _RAND_9;
  reg [63:0] _RAND_10;
  reg [31:0] _RAND_11;
  reg [31:0] _RAND_12;
  reg [63:0] _RAND_13;
  reg [31:0] _RAND_14;
  reg [31:0] _RAND_15;
  reg [31:0] _RAND_16;
  reg [31:0] _RAND_17;
  reg [31:0] _RAND_18;
  reg [31:0] _RAND_19;
  reg [31:0] _RAND_20;
  reg [31:0] _RAND_21;
  reg [63:0] _RAND_22;
  reg [63:0] _RAND_23;
  reg [63:0] _RAND_24;
  reg [31:0] _RAND_25;
  reg [31:0] _RAND_26;
  reg [63:0] _RAND_27;
  reg [31:0] _RAND_28;
  reg [31:0] _RAND_29;
  reg [31:0] _RAND_30;
  reg [31:0] _RAND_31;
  reg [63:0] _RAND_32;
  reg [31:0] _RAND_33;
  reg [63:0] _RAND_34;
  reg [63:0] _RAND_35;
  reg [31:0] _RAND_36;
  reg [63:0] _RAND_37;
  reg [31:0] _RAND_38;
  reg [31:0] _RAND_39;
  reg [63:0] _RAND_40;
  reg [31:0] _RAND_41;
  reg [31:0] _RAND_42;
  reg [63:0] _RAND_43;
  reg [31:0] _RAND_44;
  reg [31:0] _RAND_45;
  reg [95:0] _RAND_46;
`endif // RANDOMIZE_REG_INIT
  wire [63:0] alu_io_A; // @[datapath.scala 264:25]
  wire [63:0] alu_io_B; // @[datapath.scala 264:25]
  wire [1:0] alu_io_width_type; // @[datapath.scala 264:25]
  wire [3:0] alu_io_alu_op; // @[datapath.scala 264:25]
  wire [63:0] alu_io_out; // @[datapath.scala 264:25]
  wire [63:0] alu_io_sum; // @[datapath.scala 264:25]
  wire [31:0] immGen_io_inst; // @[datapath.scala 265:28]
  wire [2:0] immGen_io_sel; // @[datapath.scala 265:28]
  wire [63:0] immGen_io_out; // @[datapath.scala 265:28]
  wire [63:0] brCond_io_rs1; // @[datapath.scala 267:28]
  wire [63:0] brCond_io_rs2; // @[datapath.scala 267:28]
  wire [2:0] brCond_io_br_type; // @[datapath.scala 267:28]
  wire  brCond_io_taken; // @[datapath.scala 267:28]
  wire  regFile_clock; // @[datapath.scala 268:29]
  wire  regFile_reset; // @[datapath.scala 268:29]
  wire  regFile_io_wen; // @[datapath.scala 268:29]
  wire [4:0] regFile_io_waddr; // @[datapath.scala 268:29]
  wire [63:0] regFile_io_wdata; // @[datapath.scala 268:29]
  wire [4:0] regFile_io_raddr_0; // @[datapath.scala 268:29]
  wire [4:0] regFile_io_raddr_1; // @[datapath.scala 268:29]
  wire [63:0] regFile_io_rdata_0; // @[datapath.scala 268:29]
  wire [63:0] regFile_io_rdata_1; // @[datapath.scala 268:29]
  wire [63:0] regFile_io_rdata_4; // @[datapath.scala 268:29]
  wire [63:0] regFile_io_rdata_5; // @[datapath.scala 268:29]
  wire [63:0] regFile_io_rdata_6; // @[datapath.scala 268:29]
  wire [63:0] regFile_io_rdata_7; // @[datapath.scala 268:29]
  wire [63:0] regFile_io_rdata_8; // @[datapath.scala 268:29]
  wire [63:0] regFile_io_rdata_9; // @[datapath.scala 268:29]
  wire [63:0] regFile_io_rdata_10; // @[datapath.scala 268:29]
  wire [63:0] regFile_io_rdata_11; // @[datapath.scala 268:29]
  wire [63:0] regFile_io_rdata_12; // @[datapath.scala 268:29]
  wire [63:0] regFile_io_rdata_13; // @[datapath.scala 268:29]
  wire [63:0] regFile_io_rdata_14; // @[datapath.scala 268:29]
  wire [63:0] regFile_io_rdata_15; // @[datapath.scala 268:29]
  wire [63:0] regFile_io_rdata_16; // @[datapath.scala 268:29]
  wire [63:0] regFile_io_rdata_17; // @[datapath.scala 268:29]
  wire [63:0] regFile_io_rdata_18; // @[datapath.scala 268:29]
  wire [63:0] regFile_io_rdata_19; // @[datapath.scala 268:29]
  wire [63:0] regFile_io_rdata_20; // @[datapath.scala 268:29]
  wire [63:0] regFile_io_rdata_21; // @[datapath.scala 268:29]
  wire [63:0] regFile_io_rdata_22; // @[datapath.scala 268:29]
  wire [63:0] regFile_io_rdata_23; // @[datapath.scala 268:29]
  wire [63:0] regFile_io_rdata_24; // @[datapath.scala 268:29]
  wire [63:0] regFile_io_rdata_25; // @[datapath.scala 268:29]
  wire [63:0] regFile_io_rdata_26; // @[datapath.scala 268:29]
  wire [63:0] regFile_io_rdata_27; // @[datapath.scala 268:29]
  wire [63:0] regFile_io_rdata_28; // @[datapath.scala 268:29]
  wire [63:0] regFile_io_rdata_29; // @[datapath.scala 268:29]
  wire [63:0] regFile_io_rdata_30; // @[datapath.scala 268:29]
  wire [63:0] regFile_io_rdata_31; // @[datapath.scala 268:29]
  wire [63:0] regFile_io_rdata_32; // @[datapath.scala 268:29]
  wire [63:0] regFile_io_rdata_33; // @[datapath.scala 268:29]
  wire [63:0] regFile_io_rdata_34; // @[datapath.scala 268:29]
  wire  imem_clock; // @[datapath.scala 269:26]
  wire  imem_reset; // @[datapath.scala 269:26]
  wire [63:0] imem_pc_addr; // @[datapath.scala 269:26]
  wire [63:0] imem_pc_data; // @[datapath.scala 269:26]
  wire [63:0] imem_waddr; // @[datapath.scala 269:26]
  wire [63:0] imem_raddr; // @[datapath.scala 269:26]
  wire [63:0] imem_wdata; // @[datapath.scala 269:26]
  wire [7:0] imem_mask; // @[datapath.scala 269:26]
  wire [63:0] imem_rdata; // @[datapath.scala 269:26]
  wire  imem_enable; // @[datapath.scala 269:26]
  wire  imem_wen; // @[datapath.scala 269:26]
  wire  dmem_clock; // @[datapath.scala 270:26]
  wire  dmem_reset; // @[datapath.scala 270:26]
  wire [63:0] dmem_pc_addr; // @[datapath.scala 270:26]
  wire [63:0] dmem_pc_data; // @[datapath.scala 270:26]
  wire [63:0] dmem_waddr; // @[datapath.scala 270:26]
  wire [63:0] dmem_raddr; // @[datapath.scala 270:26]
  wire [63:0] dmem_wdata; // @[datapath.scala 270:26]
  wire [7:0] dmem_mask; // @[datapath.scala 270:26]
  wire [63:0] dmem_rdata; // @[datapath.scala 270:26]
  wire  dmem_enable; // @[datapath.scala 270:26]
  wire  dmem_wen; // @[datapath.scala 270:26]
  wire  csr_clock; // @[datapath.scala 271:25]
  wire  csr_reset; // @[datapath.scala 271:25]
  wire [3:0] csr_io_flush_mask; // @[datapath.scala 271:25]
  wire [2:0] csr_io_r_op; // @[datapath.scala 271:25]
  wire [11:0] csr_io_r_addr; // @[datapath.scala 271:25]
  wire [63:0] csr_io_r_data; // @[datapath.scala 271:25]
  wire [2:0] csr_io_w_op; // @[datapath.scala 271:25]
  wire [11:0] csr_io_w_addr; // @[datapath.scala 271:25]
  wire [63:0] csr_io_w_data; // @[datapath.scala 271:25]
  wire  csr_io_retired; // @[datapath.scala 271:25]
  wire [31:0] csr_io_inst; // @[datapath.scala 271:25]
  wire [31:0] csr_io_illegal_inst; // @[datapath.scala 271:25]
  wire [1:0] csr_io_inst_mode; // @[datapath.scala 271:25]
  wire  csr_io_fetch_misalign; // @[datapath.scala 271:25]
  wire  csr_io_load_misalign; // @[datapath.scala 271:25]
  wire  csr_io_store_misalign; // @[datapath.scala 271:25]
  wire  csr_io_isSret; // @[datapath.scala 271:25]
  wire  csr_io_isMret; // @[datapath.scala 271:25]
  wire [63:0] csr_io_pc_fetch_misalign; // @[datapath.scala 271:25]
  wire [63:0] csr_io_load_misalign_addr; // @[datapath.scala 271:25]
  wire [63:0] csr_io_store_misalign_addr; // @[datapath.scala 271:25]
  wire [63:0] csr_io_ebreak_addr; // @[datapath.scala 271:25]
  wire [63:0] csr_io_excPC; // @[datapath.scala 271:25]
  wire [63:0] csr_io_excValue; // @[datapath.scala 271:25]
  wire [63:0] csr_io_trapVec; // @[datapath.scala 271:25]
  wire  csr_io_trap; // @[datapath.scala 271:25]
  wire  gpr_ptr_clock; // @[datapath.scala 275:29]
  wire  gpr_ptr_reset; // @[datapath.scala 275:29]
  wire [63:0] gpr_ptr_regfile_0; // @[datapath.scala 275:29]
  wire [63:0] gpr_ptr_regfile_1; // @[datapath.scala 275:29]
  wire [63:0] gpr_ptr_regfile_2; // @[datapath.scala 275:29]
  wire [63:0] gpr_ptr_regfile_3; // @[datapath.scala 275:29]
  wire [63:0] gpr_ptr_regfile_4; // @[datapath.scala 275:29]
  wire [63:0] gpr_ptr_regfile_5; // @[datapath.scala 275:29]
  wire [63:0] gpr_ptr_regfile_6; // @[datapath.scala 275:29]
  wire [63:0] gpr_ptr_regfile_7; // @[datapath.scala 275:29]
  wire [63:0] gpr_ptr_regfile_8; // @[datapath.scala 275:29]
  wire [63:0] gpr_ptr_regfile_9; // @[datapath.scala 275:29]
  wire [63:0] gpr_ptr_regfile_10; // @[datapath.scala 275:29]
  wire [63:0] gpr_ptr_regfile_11; // @[datapath.scala 275:29]
  wire [63:0] gpr_ptr_regfile_12; // @[datapath.scala 275:29]
  wire [63:0] gpr_ptr_regfile_13; // @[datapath.scala 275:29]
  wire [63:0] gpr_ptr_regfile_14; // @[datapath.scala 275:29]
  wire [63:0] gpr_ptr_regfile_15; // @[datapath.scala 275:29]
  wire [63:0] gpr_ptr_regfile_16; // @[datapath.scala 275:29]
  wire [63:0] gpr_ptr_regfile_17; // @[datapath.scala 275:29]
  wire [63:0] gpr_ptr_regfile_18; // @[datapath.scala 275:29]
  wire [63:0] gpr_ptr_regfile_19; // @[datapath.scala 275:29]
  wire [63:0] gpr_ptr_regfile_20; // @[datapath.scala 275:29]
  wire [63:0] gpr_ptr_regfile_21; // @[datapath.scala 275:29]
  wire [63:0] gpr_ptr_regfile_22; // @[datapath.scala 275:29]
  wire [63:0] gpr_ptr_regfile_23; // @[datapath.scala 275:29]
  wire [63:0] gpr_ptr_regfile_24; // @[datapath.scala 275:29]
  wire [63:0] gpr_ptr_regfile_25; // @[datapath.scala 275:29]
  wire [63:0] gpr_ptr_regfile_26; // @[datapath.scala 275:29]
  wire [63:0] gpr_ptr_regfile_27; // @[datapath.scala 275:29]
  wire [63:0] gpr_ptr_regfile_28; // @[datapath.scala 275:29]
  wire [63:0] gpr_ptr_regfile_29; // @[datapath.scala 275:29]
  wire [63:0] gpr_ptr_regfile_30; // @[datapath.scala 275:29]
  wire [63:0] gpr_ptr_regfile_31; // @[datapath.scala 275:29]
  reg [31:0] fd_pipe_reg_inst; // @[datapath.scala 174:34]
  reg [63:0] fd_pipe_reg_pc; // @[datapath.scala 174:34]
  reg [3:0] de_pipe_reg_alu_op; // @[datapath.scala 182:34]
  reg [63:0] de_pipe_reg_pc; // @[datapath.scala 182:34]
  reg [31:0] de_pipe_reg_inst; // @[datapath.scala 182:34]
  reg [63:0] de_pipe_reg_imm; // @[datapath.scala 182:34]
  reg [63:0] de_pipe_reg_rs1; // @[datapath.scala 182:34]
  reg [63:0] de_pipe_reg_src1_addr; // @[datapath.scala 182:34]
  reg [63:0] de_pipe_reg_rs2; // @[datapath.scala 182:34]
  reg [63:0] de_pipe_reg_src2_addr; // @[datapath.scala 182:34]
  reg [63:0] de_pipe_reg_csr_read_data; // @[datapath.scala 182:34]
  reg [2:0] de_pipe_reg_csr_write_op; // @[datapath.scala 182:34]
  reg [11:0] de_pipe_reg_csr_write_addr; // @[datapath.scala 182:34]
  reg [63:0] de_pipe_reg_csr_write_data; // @[datapath.scala 182:34]
  reg [4:0] de_pipe_reg_dest; // @[datapath.scala 182:34]
  reg  de_pipe_reg_A_sel; // @[datapath.scala 182:34]
  reg  de_pipe_reg_B_sel; // @[datapath.scala 182:34]
  reg [1:0] de_pipe_reg_wd_type; // @[datapath.scala 182:34]
  reg [2:0] de_pipe_reg_st_type; // @[datapath.scala 182:34]
  reg [2:0] de_pipe_reg_ld_type; // @[datapath.scala 182:34]
  reg [1:0] de_pipe_reg_wb_sel; // @[datapath.scala 182:34]
  reg  de_pipe_reg_wb_en; // @[datapath.scala 182:34]
  reg [63:0] em_pipe_reg_alu_out; // @[datapath.scala 215:34]
  reg [63:0] em_pipe_reg_alu_sum; // @[datapath.scala 215:34]
  reg [63:0] em_pipe_reg_csr_read_data; // @[datapath.scala 215:34]
  reg [2:0] em_pipe_reg_csr_write_op; // @[datapath.scala 215:34]
  reg [11:0] em_pipe_reg_csr_write_addr; // @[datapath.scala 215:34]
  reg [63:0] em_pipe_reg_csr_write_data; // @[datapath.scala 215:34]
  reg [2:0] em_pipe_reg_ld_type; // @[datapath.scala 215:34]
  reg [1:0] em_pipe_reg_wb_sel; // @[datapath.scala 215:34]
  reg  em_pipe_reg_wb_en; // @[datapath.scala 215:34]
  reg [4:0] em_pipe_reg_dest; // @[datapath.scala 215:34]
  reg [63:0] em_pipe_reg_pc; // @[datapath.scala 215:34]
  reg [31:0] em_pipe_reg_inst; // @[datapath.scala 215:34]
  reg [63:0] mw_pipe_reg_load_data; // @[datapath.scala 240:34]
  reg [63:0] mw_pipe_reg_alu_out; // @[datapath.scala 240:34]
  reg [4:0] mw_pipe_reg_dest; // @[datapath.scala 240:34]
  reg [63:0] mw_pipe_reg_csr_read_data; // @[datapath.scala 240:34]
  reg [2:0] mw_pipe_reg_csr_write_op; // @[datapath.scala 240:34]
  reg [11:0] mw_pipe_reg_csr_write_addr; // @[datapath.scala 240:34]
  reg [63:0] mw_pipe_reg_csr_write_data; // @[datapath.scala 240:34]
  reg [1:0] mw_pipe_reg_wb_sel; // @[datapath.scala 240:34]
  reg  mw_pipe_reg_wb_en; // @[datapath.scala 240:34]
  reg [63:0] mw_pipe_reg_pc; // @[datapath.scala 240:34]
  reg [31:0] mw_pipe_reg_inst; // @[datapath.scala 240:34]
  wire  flush_fd = csr_io_flush_mask[0]; // @[datapath.scala 308:41]
  wire  flush_de = csr_io_flush_mask[1]; // @[datapath.scala 309:41]
  wire  flush_em = csr_io_flush_mask[2]; // @[datapath.scala 310:41]
  wire  flush_mw = csr_io_flush_mask[3]; // @[datapath.scala 311:41]
  reg  started; // @[datapath.scala 314:30]
  wire [63:0] _pc_T_1 = 64'h80000000 - 64'h4; // @[datapath.scala 316:46]
  reg [64:0] pc; // @[datapath.scala 316:25]
  wire [64:0] _next_pc_T_1 = pc + 65'h4; // @[datapath.scala 318:20]
  wire  _next_pc_T_2 = io_ctrl_pc_sel == 2'h3; // @[datapath.scala 321:33]
  wire  _next_pc_T_4 = io_ctrl_pc_sel == 2'h1 | brCond_io_taken; // @[datapath.scala 322:46]
  wire [63:0] _jump_addr_T_2 = ~io_ctrl_B_sel ? immGen_io_out : 64'h0; // @[datapath.scala 367:84]
  wire [63:0] _jump_addr_T_3 = io_ctrl_B_sel ? regFile_io_rdata_1 : _jump_addr_T_2; // @[datapath.scala 366:42]
  wire [63:0] jump_addr = fd_pipe_reg_pc + _jump_addr_T_3; // @[datapath.scala 366:37]
  wire [63:0] _next_pc_T_5 = {{1'd0}, jump_addr[63:1]}; // @[datapath.scala 322:81]
  wire [64:0] _next_pc_T_6 = {_next_pc_T_5, 1'h0}; // @[datapath.scala 322:88]
  wire  _next_pc_T_7 = io_ctrl_pc_sel == 2'h2; // @[datapath.scala 323:33]
  wire [64:0] _next_pc_T_8 = _next_pc_T_7 ? pc : _next_pc_T_1; // @[Mux.scala 101:16]
  wire [64:0] _next_pc_T_9 = _next_pc_T_4 ? _next_pc_T_6 : _next_pc_T_8; // @[Mux.scala 101:16]
  wire [64:0] _next_pc_T_10 = _next_pc_T_2 ? {{1'd0}, csr_io_trapVec} : _next_pc_T_9; // @[Mux.scala 101:16]
  wire [64:0] next_pc = csr_io_trap ? {{1'd0}, csr_io_trapVec} : _next_pc_T_10; // @[Mux.scala 101:16]
  wire [63:0] inst = started | io_ctrl_is_kill | brCond_io_taken | csr_io_trap ? 64'h13 : imem_rdata; // @[datapath.scala 327:23]
  wire [64:0] _GEN_2 = flush_fd ? 65'h0 : next_pc; // @[datapath.scala 339:23 340:32]
  wire [63:0] _GEN_3 = flush_fd ? 64'h13 : inst; // @[datapath.scala 339:23 341:34]
  wire [4:0] src1_addr = fd_pipe_reg_inst[19:15]; // @[datapath.scala 351:41]
  wire [4:0] src2_addr = fd_pipe_reg_inst[24:20]; // @[datapath.scala 352:41]
  wire [4:0] dest_addr = fd_pipe_reg_inst[11:7]; // @[datapath.scala 353:41]
  wire  _csr_op_T = io_ctrl_csr_cmd == 3'h1; // @[datapath.scala 373:58]
  wire  _csr_op_T_1 = dest_addr == 5'h0; // @[datapath.scala 373:84]
  wire  _csr_op_T_2 = io_ctrl_csr_cmd == 3'h1 & dest_addr == 5'h0; // @[datapath.scala 373:70]
  wire  _csr_op_T_4 = io_ctrl_csr_cmd == 3'h3; // @[datapath.scala 375:70]
  wire  _csr_op_T_8 = io_ctrl_csr_cmd == 3'h2; // @[datapath.scala 377:86]
  wire [2:0] _csr_op_T_12 = _csr_op_T_8 ? 3'h4 : 3'h0; // @[datapath.scala 378:76]
  wire [2:0] _csr_op_T_13 = io_ctrl_csr_cmd == 3'h2 & _csr_op_T_1 ? 3'h1 : _csr_op_T_12; // @[datapath.scala 377:68]
  wire [2:0] _csr_op_T_14 = _csr_op_T_4 ? 3'h5 : _csr_op_T_13; // @[datapath.scala 376:60]
  wire [2:0] _csr_op_T_15 = io_ctrl_csr_cmd == 3'h3 & _csr_op_T_1 ? 3'h1 : _csr_op_T_14; // @[datapath.scala 375:52]
  wire [2:0] _csr_op_T_16 = _csr_op_T ? 3'h3 : _csr_op_T_15; // @[datapath.scala 374:44]
  wire [63:0] _csr_io_fetch_misalign_T = de_pipe_reg_pc & 64'h3; // @[datapath.scala 390:50]
  wire [4:0] csr_write_addr = inst[11:7]; // @[datapath.scala 398:34]
  wire [63:0] _GEN_8 = csr_io_r_data; // @[datapath.scala 427:27 182:34 432:43]
  wire [63:0] _GEN_10 = regFile_io_rdata_1; // @[datapath.scala 427:27 182:34 435:44]
  wire [11:0] _GEN_11 = {{7'd0}, csr_write_addr}; // @[datapath.scala 427:27 182:34 436:44]
  wire [63:0] _GEN_13 = immGen_io_out; // @[datapath.scala 427:27 438:33 182:34]
  wire [63:0] _GEN_14 = regFile_io_rdata_0; // @[datapath.scala 427:27 439:33 182:34]
  wire [63:0] _GEN_15 = {{59'd0}, src1_addr}; // @[datapath.scala 427:27 182:34 440:39]
  wire [63:0] _GEN_17 = {{59'd0}, src2_addr}; // @[datapath.scala 427:27 182:34 442:39]
  wire [63:0] _GEN_105 = {{59'd0}, em_pipe_reg_dest}; // @[datapath.scala 460:59]
  wire  _T_2 = de_pipe_reg_src1_addr == _GEN_105; // @[datapath.scala 460:59]
  wire  _T_3 = de_pipe_reg_src2_addr == _GEN_105; // @[datapath.scala 460:107]
  wire [63:0] _src1_data_T_3 = em_pipe_reg_pc + 64'h4; // @[datapath.scala 463:99]
  wire [63:0] _src1_data_T_5 = em_pipe_reg_wb_sel == 2'h3 ? em_pipe_reg_csr_read_data : dmem_rdata; // @[datapath.scala 464:60]
  wire [63:0] _src1_data_T_6 = em_pipe_reg_wb_sel == 2'h2 ? _src1_data_T_3 : _src1_data_T_5; // @[datapath.scala 463:52]
  wire [63:0] _src1_data_T_7 = em_pipe_reg_wb_sel == 2'h0 ? em_pipe_reg_alu_out : _src1_data_T_6; // @[datapath.scala 462:41]
  wire [63:0] _GEN_46 = _T_2 ? _src1_data_T_7 : 64'h0; // @[datapath.scala 461:65 462:35]
  wire [63:0] _GEN_47 = _T_3 ? _src1_data_T_7 : 64'h0; // @[datapath.scala 466:65 467:35]
  wire [63:0] _GEN_109 = {{59'd0}, mw_pipe_reg_dest}; // @[datapath.scala 471:64]
  wire  _T_8 = de_pipe_reg_src1_addr == _GEN_109; // @[datapath.scala 471:64]
  wire  _T_9 = de_pipe_reg_src2_addr == _GEN_109; // @[datapath.scala 471:112]
  wire  _src1_data_T_8 = mw_pipe_reg_wb_sel == 2'h0; // @[datapath.scala 473:61]
  wire  _src1_data_T_9 = mw_pipe_reg_wb_sel == 2'h2; // @[datapath.scala 474:72]
  wire [63:0] _src1_data_T_11 = mw_pipe_reg_pc + 64'h4; // @[datapath.scala 474:99]
  wire  _src1_data_T_12 = mw_pipe_reg_wb_sel == 2'h3; // @[datapath.scala 475:80]
  wire [63:0] _src1_data_T_13 = mw_pipe_reg_wb_sel == 2'h3 ? mw_pipe_reg_csr_read_data : mw_pipe_reg_load_data; // @[datapath.scala 475:60]
  wire [63:0] _src1_data_T_14 = mw_pipe_reg_wb_sel == 2'h2 ? _src1_data_T_11 : _src1_data_T_13; // @[datapath.scala 474:52]
  wire [63:0] _src1_data_T_15 = mw_pipe_reg_wb_sel == 2'h0 ? mw_pipe_reg_alu_out : _src1_data_T_14; // @[datapath.scala 473:41]
  wire [63:0] _GEN_48 = _T_8 ? _src1_data_T_15 : 64'h0; // @[datapath.scala 472:65 473:35]
  wire [63:0] _GEN_49 = _T_9 ? _src1_data_T_15 : 64'h0; // @[datapath.scala 477:65 478:35]
  wire [63:0] _GEN_50 = mw_pipe_reg_wb_en & (de_pipe_reg_src1_addr == _GEN_109 | de_pipe_reg_src2_addr == _GEN_109) ?
    _GEN_48 : de_pipe_reg_rs1; // @[datapath.scala 471:135 483:27]
  wire [63:0] _GEN_51 = mw_pipe_reg_wb_en & (de_pipe_reg_src1_addr == _GEN_109 | de_pipe_reg_src2_addr == _GEN_109) ?
    _GEN_49 : de_pipe_reg_rs2; // @[datapath.scala 471:135 484:27]
  wire [63:0] src1_data = em_pipe_reg_wb_en & (de_pipe_reg_src1_addr == _GEN_105 | de_pipe_reg_src2_addr == _GEN_105) ?
    _GEN_46 : _GEN_50; // @[datapath.scala 460:130]
  wire [63:0] src2_data = em_pipe_reg_wb_en & (de_pipe_reg_src1_addr == _GEN_105 | de_pipe_reg_src2_addr == _GEN_105) ?
    _GEN_47 : _GEN_51; // @[datapath.scala 460:130]
  wire [63:0] A_data = de_pipe_reg_A_sel ? src1_data : de_pipe_reg_pc; // @[datapath.scala 489:25]
  wire [63:0] B_data = de_pipe_reg_B_sel ? src2_data : de_pipe_reg_imm; // @[datapath.scala 490:25]
  wire  _alu_io_A_T = de_pipe_reg_wd_type == 2'h1; // @[datapath.scala 491:45]
  wire  _csr_io_store_misalign_T_1 = de_pipe_reg_st_type == 3'h3; // @[datapath.scala 500:110]
  wire  _csr_io_store_misalign_T_2 = de_pipe_reg_st_type == 3'h2; // @[datapath.scala 501:110]
  wire  _csr_io_store_misalign_T_5 = de_pipe_reg_st_type == 3'h1; // @[datapath.scala 502:110]
  wire  _csr_io_store_misalign_T_7 = alu_io_out[1:0] != 2'h0; // @[datapath.scala 502:139]
  wire  _csr_io_store_misalign_T_8 = de_pipe_reg_st_type == 3'h4; // @[datapath.scala 503:110]
  wire  _csr_io_store_misalign_T_10 = alu_io_out[2:0] != 3'h0; // @[datapath.scala 503:139]
  wire  _csr_io_store_misalign_T_12 = _csr_io_store_misalign_T_5 ? _csr_io_store_misalign_T_7 :
    _csr_io_store_misalign_T_8 & _csr_io_store_misalign_T_10; // @[Mux.scala 101:16]
  wire  _csr_io_store_misalign_T_13 = _csr_io_store_misalign_T_2 ? alu_io_out[0] : _csr_io_store_misalign_T_12; // @[Mux.scala 101:16]
  wire  _csr_io_store_misalign_T_14 = _csr_io_store_misalign_T_1 ? 1'h0 : _csr_io_store_misalign_T_13; // @[Mux.scala 101:16]
  wire  _csr_io_load_misalign_T_3 = de_pipe_reg_ld_type == 3'h3 | de_pipe_reg_ld_type == 3'h5; // @[datapath.scala 509:120]
  wire  _csr_io_load_misalign_T_6 = de_pipe_reg_ld_type == 3'h2 | de_pipe_reg_ld_type == 3'h4; // @[datapath.scala 510:120]
  wire [14:0] _GEN_113 = {{12'd0}, de_pipe_reg_ld_type}; // @[datapath.scala 511:143]
  wire [14:0] _csr_io_load_misalign_T_10 = _GEN_113 & 15'h707f; // @[datapath.scala 511:143]
  wire  _csr_io_load_misalign_T_12 = de_pipe_reg_ld_type == 3'h1 | 15'h6003 == _csr_io_load_misalign_T_10; // @[datapath.scala 511:120]
  wire  _csr_io_load_misalign_T_15 = de_pipe_reg_ld_type == 3'h7; // @[datapath.scala 512:110]
  wire  _csr_io_load_misalign_T_19 = _csr_io_load_misalign_T_12 ? _csr_io_store_misalign_T_7 :
    _csr_io_load_misalign_T_15 & _csr_io_store_misalign_T_10; // @[Mux.scala 101:16]
  wire  _csr_io_load_misalign_T_20 = _csr_io_load_misalign_T_6 ? alu_io_out[0] : _csr_io_load_misalign_T_19; // @[Mux.scala 101:16]
  wire  _csr_io_load_misalign_T_21 = _csr_io_load_misalign_T_3 ? 1'h0 : _csr_io_load_misalign_T_20; // @[Mux.scala 101:16]
  wire [63:0] _GEN_56 = alu_io_out; // @[datapath.scala 537:27 215:34 540:37]
  wire [63:0] _GEN_57 = alu_io_sum; // @[datapath.scala 537:27 215:34 541:37]
  wire [5:0] _dmem_io_wdata_T_1 = {alu_io_out[2:0], 3'h0}; // @[datapath.scala 578:61]
  wire [126:0] _GEN_0 = {{63'd0}, de_pipe_reg_rs2}; // @[datapath.scala 578:43]
  wire [126:0] _dmem_io_wdata_T_2 = _GEN_0 << _dmem_io_wdata_T_1; // @[datapath.scala 578:43]
  wire [7:0] _st_mask_T_3 = _csr_io_store_misalign_T_1 ? 8'h1 : 8'hff; // @[datapath.scala 581:60]
  wire [7:0] _st_mask_T_4 = _csr_io_store_misalign_T_2 ? 8'h3 : _st_mask_T_3; // @[datapath.scala 580:52]
  wire [7:0] st_mask = _csr_io_store_misalign_T_5 ? 8'hf : _st_mask_T_4; // @[datapath.scala 579:26]
  wire [14:0] _GEN_1 = {{7'd0}, st_mask}; // @[datapath.scala 585:80]
  wire [14:0] _dmem_io_mask_T_3 = _GEN_1 << alu_io_out[2:0]; // @[datapath.scala 585:80]
  wire [63:0] _load_data_T = alu_io_out & 64'h7; // @[datapath.scala 586:52]
  wire [66:0] _load_data_T_1 = {_load_data_T, 3'h0}; // @[datapath.scala 586:63]
  wire [63:0] load_data = dmem_rdata >> _load_data_T_1; // @[datapath.scala 586:39]
  wire [31:0] _load_data_ext_T_3 = load_data[31] ? 32'hffffffff : 32'h0; // @[datapath.scala 587:71]
  wire [63:0] _load_data_ext_T_5 = {_load_data_ext_T_3,load_data[31:0]}; // @[Cat.scala 31:58]
  wire [63:0] _load_data_ext_T_9 = {32'h0,load_data[31:0]}; // @[Cat.scala 31:58]
  wire [47:0] _load_data_ext_T_13 = load_data[15] ? 48'hffffffffffff : 48'h0; // @[datapath.scala 589:107]
  wire [63:0] _load_data_ext_T_15 = {_load_data_ext_T_13,load_data[15:0]}; // @[Cat.scala 31:58]
  wire [63:0] _load_data_ext_T_19 = {48'h0,load_data[15:0]}; // @[Cat.scala 31:58]
  wire [55:0] _load_data_ext_T_23 = load_data[7] ? 56'hffffffffffffff : 56'h0; // @[datapath.scala 591:123]
  wire [63:0] _load_data_ext_T_25 = {_load_data_ext_T_23,load_data[7:0]}; // @[Cat.scala 31:58]
  wire [63:0] _load_data_ext_T_29 = {56'h0,load_data[7:0]}; // @[Cat.scala 31:58]
  wire [63:0] _load_data_ext_T_30 = em_pipe_reg_ld_type == 3'h5 ? _load_data_ext_T_29 : load_data; // @[datapath.scala 592:92]
  wire [63:0] _load_data_ext_T_31 = em_pipe_reg_ld_type == 3'h3 ? _load_data_ext_T_25 : _load_data_ext_T_30; // @[datapath.scala 591:84]
  wire [63:0] _load_data_ext_T_32 = em_pipe_reg_ld_type == 3'h4 ? _load_data_ext_T_19 : _load_data_ext_T_31; // @[datapath.scala 590:76]
  wire [63:0] _load_data_ext_T_33 = em_pipe_reg_ld_type == 3'h2 ? _load_data_ext_T_15 : _load_data_ext_T_32; // @[datapath.scala 589:68]
  wire  _regFile_io_wen_T_2 = _src1_data_T_8 | _src1_data_T_9; // @[datapath.scala 650:58]
  wire  _regFile_io_wen_T_3 = mw_pipe_reg_wb_sel == 2'h1; // @[datapath.scala 652:68]
  wire  _regFile_io_wen_T_4 = _regFile_io_wen_T_2 | _regFile_io_wen_T_3; // @[datapath.scala 651:79]
  wire [63:0] _GEN_114 = reset ? 64'h13 : _GEN_3; // @[datapath.scala 174:{34,34}]
  wire [64:0] _GEN_115 = reset ? 65'h0 : _GEN_2; // @[datapath.scala 174:{34,34}]
  AluSimple alu ( // @[datapath.scala 264:25]
    .io_A(alu_io_A),
    .io_B(alu_io_B),
    .io_width_type(alu_io_width_type),
    .io_alu_op(alu_io_alu_op),
    .io_out(alu_io_out),
    .io_sum(alu_io_sum)
  );
  ImmGenWire immGen ( // @[datapath.scala 265:28]
    .io_inst(immGen_io_inst),
    .io_sel(immGen_io_sel),
    .io_out(immGen_io_out)
  );
  BrCondSimple brCond ( // @[datapath.scala 267:28]
    .io_rs1(brCond_io_rs1),
    .io_rs2(brCond_io_rs2),
    .io_br_type(brCond_io_br_type),
    .io_taken(brCond_io_taken)
  );
  RegisterFile regFile ( // @[datapath.scala 268:29]
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
  Mem imem ( // @[datapath.scala 269:26]
    .clock(imem_clock),
    .reset(imem_reset),
    .pc_addr(imem_pc_addr),
    .pc_data(imem_pc_data),
    .waddr(imem_waddr),
    .raddr(imem_raddr),
    .wdata(imem_wdata),
    .mask(imem_mask),
    .rdata(imem_rdata),
    .enable(imem_enable),
    .wen(imem_wen)
  );
  Mem dmem ( // @[datapath.scala 270:26]
    .clock(dmem_clock),
    .reset(dmem_reset),
    .pc_addr(dmem_pc_addr),
    .pc_data(dmem_pc_data),
    .waddr(dmem_waddr),
    .raddr(dmem_raddr),
    .wdata(dmem_wdata),
    .mask(dmem_mask),
    .rdata(dmem_rdata),
    .enable(dmem_enable),
    .wen(dmem_wen)
  );
  CSR csr ( // @[datapath.scala 271:25]
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
    .io_trap(csr_io_trap)
  );
  gpr_ptr gpr_ptr ( // @[datapath.scala 275:29]
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
  assign io_ctrl_inst = fd_pipe_reg_inst; // @[datapath.scala 350:22]
  assign alu_io_A = de_pipe_reg_wd_type == 2'h1 ? {{32'd0}, A_data[31:0]} : A_data; // @[datapath.scala 491:24]
  assign alu_io_B = _alu_io_A_T ? {{32'd0}, B_data[31:0]} : B_data; // @[datapath.scala 492:24]
  assign alu_io_width_type = de_pipe_reg_wd_type; // @[datapath.scala 488:27]
  assign alu_io_alu_op = de_pipe_reg_alu_op; // @[datapath.scala 487:23]
  assign immGen_io_inst = fd_pipe_reg_inst; // @[datapath.scala 359:24]
  assign immGen_io_sel = io_ctrl_imm_sel; // @[datapath.scala 360:23]
  assign brCond_io_rs1 = regFile_io_rdata_0; // @[datapath.scala 364:23]
  assign brCond_io_rs2 = regFile_io_rdata_1; // @[datapath.scala 365:23]
  assign brCond_io_br_type = io_ctrl_br_type; // @[datapath.scala 363:27]
  assign regFile_clock = clock;
  assign regFile_reset = reset;
  assign regFile_io_wen = (_regFile_io_wen_T_4 | _src1_data_T_12) & mw_pipe_reg_wb_en; // @[datapath.scala 652:113]
  assign regFile_io_waddr = mw_pipe_reg_dest; // @[datapath.scala 653:26]
  assign regFile_io_wdata = _src1_data_T_8 ? mw_pipe_reg_alu_out : _src1_data_T_14; // @[datapath.scala 654:32]
  assign regFile_io_raddr_0 = fd_pipe_reg_inst[19:15]; // @[datapath.scala 351:41]
  assign regFile_io_raddr_1 = fd_pipe_reg_inst[24:20]; // @[datapath.scala 352:41]
  assign imem_clock = clock; // @[datapath.scala 289:23]
  assign imem_reset = reset; // @[datapath.scala 290:23]
  assign imem_pc_addr = 64'h0;
  assign imem_waddr = 64'h0;
  assign imem_raddr = next_pc[63:0]; // @[datapath.scala 332:23]
  assign imem_wdata = 64'h0;
  assign imem_mask = 8'h0;
  assign imem_enable = 1'h0;
  assign imem_wen = 1'h0;
  assign dmem_clock = clock; // @[datapath.scala 291:23]
  assign dmem_reset = reset; // @[datapath.scala 292:23]
  assign dmem_pc_addr = 64'h0;
  assign dmem_waddr = em_pipe_reg_alu_sum; // @[datapath.scala 577:29]
  assign dmem_raddr = em_pipe_reg_alu_sum; // @[datapath.scala 576:29]
  assign dmem_wdata = _dmem_io_wdata_T_2[63:0]; // @[datapath.scala 578:69]
  assign dmem_mask = st_mask == 8'hff ? st_mask : _dmem_io_mask_T_3[7:0]; // @[datapath.scala 585:28]
  assign dmem_enable = |de_pipe_reg_st_type | |de_pipe_reg_ld_type; // @[datapath.scala 574:53]
  assign dmem_wen = |de_pipe_reg_st_type; // @[datapath.scala 575:44]
  assign csr_clock = clock;
  assign csr_reset = reset;
  assign csr_io_r_op = _csr_op_T_2 ? 3'h2 : _csr_op_T_16; // @[datapath.scala 372:25]
  assign csr_io_r_addr = de_pipe_reg_inst[31:20]; // @[datapath.scala 386:42]
  assign csr_io_w_op = mw_pipe_reg_csr_write_op; // @[datapath.scala 638:21]
  assign csr_io_w_addr = mw_pipe_reg_csr_write_addr; // @[datapath.scala 639:23]
  assign csr_io_w_data = mw_pipe_reg_csr_write_data; // @[datapath.scala 640:23]
  assign csr_io_retired = mw_pipe_reg_inst != 32'h13; // @[datapath.scala 643:44]
  assign csr_io_inst = mw_pipe_reg_inst; // @[datapath.scala 641:21]
  assign csr_io_illegal_inst = io_ctrl_is_illegal ? fd_pipe_reg_inst : 32'h0; // @[datapath.scala 388:35]
  assign csr_io_inst_mode = {{1'd0}, io_ctrl_prv}; // @[datapath.scala 387:26]
  assign csr_io_fetch_misalign = _csr_io_fetch_misalign_T == 64'h0; // @[datapath.scala 390:57]
  assign csr_io_load_misalign = de_pipe_reg_ld_type != 3'h0 & _csr_io_load_misalign_T_21; // @[datapath.scala 506:66]
  assign csr_io_store_misalign = de_pipe_reg_st_type != 3'h0 & _csr_io_store_misalign_T_14; // @[datapath.scala 497:67]
  assign csr_io_isSret = 32'h10200073 == mw_pipe_reg_inst; // @[datapath.scala 644:43]
  assign csr_io_isMret = 32'h30200073 == mw_pipe_reg_inst; // @[datapath.scala 645:43]
  assign csr_io_pc_fetch_misalign = de_pipe_reg_pc; // @[datapath.scala 391:34]
  assign csr_io_load_misalign_addr = alu_io_sum; // @[datapath.scala 514:35]
  assign csr_io_store_misalign_addr = alu_io_sum; // @[datapath.scala 515:36]
  assign csr_io_ebreak_addr = mw_pipe_reg_pc; // @[datapath.scala 642:28]
  assign csr_io_excPC = mw_pipe_reg_pc; // @[datapath.scala 646:22]
  assign gpr_ptr_clock = clock; // @[datapath.scala 282:26]
  assign gpr_ptr_reset = reset; // @[datapath.scala 283:26]
  assign gpr_ptr_regfile_0 = 64'h0; // @[datapath.scala 279:41]
  assign gpr_ptr_regfile_1 = regFile_io_rdata_4; // @[datapath.scala 279:41]
  assign gpr_ptr_regfile_2 = regFile_io_rdata_5; // @[datapath.scala 279:41]
  assign gpr_ptr_regfile_3 = regFile_io_rdata_6; // @[datapath.scala 279:41]
  assign gpr_ptr_regfile_4 = regFile_io_rdata_7; // @[datapath.scala 279:41]
  assign gpr_ptr_regfile_5 = regFile_io_rdata_8; // @[datapath.scala 279:41]
  assign gpr_ptr_regfile_6 = regFile_io_rdata_9; // @[datapath.scala 279:41]
  assign gpr_ptr_regfile_7 = regFile_io_rdata_10; // @[datapath.scala 279:41]
  assign gpr_ptr_regfile_8 = regFile_io_rdata_11; // @[datapath.scala 279:41]
  assign gpr_ptr_regfile_9 = regFile_io_rdata_12; // @[datapath.scala 279:41]
  assign gpr_ptr_regfile_10 = regFile_io_rdata_13; // @[datapath.scala 279:41]
  assign gpr_ptr_regfile_11 = regFile_io_rdata_14; // @[datapath.scala 279:41]
  assign gpr_ptr_regfile_12 = regFile_io_rdata_15; // @[datapath.scala 279:41]
  assign gpr_ptr_regfile_13 = regFile_io_rdata_16; // @[datapath.scala 279:41]
  assign gpr_ptr_regfile_14 = regFile_io_rdata_17; // @[datapath.scala 279:41]
  assign gpr_ptr_regfile_15 = regFile_io_rdata_18; // @[datapath.scala 279:41]
  assign gpr_ptr_regfile_16 = regFile_io_rdata_19; // @[datapath.scala 279:41]
  assign gpr_ptr_regfile_17 = regFile_io_rdata_20; // @[datapath.scala 279:41]
  assign gpr_ptr_regfile_18 = regFile_io_rdata_21; // @[datapath.scala 279:41]
  assign gpr_ptr_regfile_19 = regFile_io_rdata_22; // @[datapath.scala 279:41]
  assign gpr_ptr_regfile_20 = regFile_io_rdata_23; // @[datapath.scala 279:41]
  assign gpr_ptr_regfile_21 = regFile_io_rdata_24; // @[datapath.scala 279:41]
  assign gpr_ptr_regfile_22 = regFile_io_rdata_25; // @[datapath.scala 279:41]
  assign gpr_ptr_regfile_23 = regFile_io_rdata_26; // @[datapath.scala 279:41]
  assign gpr_ptr_regfile_24 = regFile_io_rdata_27; // @[datapath.scala 279:41]
  assign gpr_ptr_regfile_25 = regFile_io_rdata_28; // @[datapath.scala 279:41]
  assign gpr_ptr_regfile_26 = regFile_io_rdata_29; // @[datapath.scala 279:41]
  assign gpr_ptr_regfile_27 = regFile_io_rdata_30; // @[datapath.scala 279:41]
  assign gpr_ptr_regfile_28 = regFile_io_rdata_31; // @[datapath.scala 279:41]
  assign gpr_ptr_regfile_29 = regFile_io_rdata_32; // @[datapath.scala 279:41]
  assign gpr_ptr_regfile_30 = regFile_io_rdata_33; // @[datapath.scala 279:41]
  assign gpr_ptr_regfile_31 = regFile_io_rdata_34; // @[datapath.scala 279:41]
  always @(posedge clock) begin
    fd_pipe_reg_inst <= _GEN_114[31:0]; // @[datapath.scala 174:{34,34}]
    fd_pipe_reg_pc <= _GEN_115[63:0]; // @[datapath.scala 174:{34,34}]
    if (reset) begin // @[datapath.scala 182:34]
      de_pipe_reg_alu_op <= 4'h0; // @[datapath.scala 182:34]
    end else if (flush_de) begin // @[datapath.scala 400:23]
      de_pipe_reg_alu_op <= 4'h0; // @[datapath.scala 402:36]
    end else begin
      de_pipe_reg_alu_op <= io_ctrl_alu_op;
    end
    if (reset) begin // @[datapath.scala 182:34]
      de_pipe_reg_pc <= 64'h0; // @[datapath.scala 182:34]
    end else if (flush_de) begin // @[datapath.scala 400:23]
      de_pipe_reg_pc <= 64'h0; // @[datapath.scala 410:32]
    end else begin
      de_pipe_reg_pc <= fd_pipe_reg_pc;
    end
    if (reset) begin // @[datapath.scala 182:34]
      de_pipe_reg_inst <= 32'h13; // @[datapath.scala 182:34]
    end else if (flush_de) begin // @[datapath.scala 400:23]
      de_pipe_reg_inst <= 32'h13; // @[datapath.scala 401:34]
    end else begin
      de_pipe_reg_inst <= fd_pipe_reg_inst;
    end
    if (reset) begin // @[datapath.scala 182:34]
      de_pipe_reg_imm <= 64'h0; // @[datapath.scala 182:34]
    end else if (flush_de) begin // @[datapath.scala 400:23]
      de_pipe_reg_imm <= 64'h0; // @[datapath.scala 411:33]
    end else begin
      de_pipe_reg_imm <= _GEN_13;
    end
    if (reset) begin // @[datapath.scala 182:34]
      de_pipe_reg_rs1 <= 64'h0; // @[datapath.scala 182:34]
    end else if (flush_de) begin // @[datapath.scala 400:23]
      de_pipe_reg_rs1 <= 64'h0; // @[datapath.scala 412:33]
    end else begin
      de_pipe_reg_rs1 <= _GEN_14;
    end
    if (reset) begin // @[datapath.scala 182:34]
      de_pipe_reg_src1_addr <= 64'h0; // @[datapath.scala 182:34]
    end else if (flush_de) begin // @[datapath.scala 400:23]
      de_pipe_reg_src1_addr <= 64'h0; // @[datapath.scala 413:39]
    end else begin
      de_pipe_reg_src1_addr <= _GEN_15;
    end
    if (reset) begin // @[datapath.scala 182:34]
      de_pipe_reg_rs2 <= 64'h0; // @[datapath.scala 182:34]
    end else if (flush_de) begin // @[datapath.scala 400:23]
      de_pipe_reg_rs2 <= 64'h0; // @[datapath.scala 408:44]
    end else begin
      de_pipe_reg_rs2 <= _GEN_10;
    end
    if (reset) begin // @[datapath.scala 182:34]
      de_pipe_reg_src2_addr <= 64'h0; // @[datapath.scala 182:34]
    end else if (flush_de) begin // @[datapath.scala 400:23]
      de_pipe_reg_src2_addr <= 64'h0; // @[datapath.scala 415:39]
    end else begin
      de_pipe_reg_src2_addr <= _GEN_17;
    end
    if (reset) begin // @[datapath.scala 182:34]
      de_pipe_reg_csr_read_data <= 64'h0; // @[datapath.scala 182:34]
    end else if (flush_de) begin // @[datapath.scala 400:23]
      de_pipe_reg_csr_read_data <= 64'h0; // @[datapath.scala 405:43]
    end else begin
      de_pipe_reg_csr_read_data <= _GEN_8;
    end
    if (reset) begin // @[datapath.scala 182:34]
      de_pipe_reg_csr_write_op <= 3'h0; // @[datapath.scala 182:34]
    end else if (flush_de) begin // @[datapath.scala 400:23]
      de_pipe_reg_csr_write_op <= 3'h0; // @[datapath.scala 407:42]
    end else if (_csr_op_T_2) begin // @[datapath.scala 372:25]
      de_pipe_reg_csr_write_op <= 3'h2;
    end else if (_csr_op_T) begin // @[datapath.scala 374:44]
      de_pipe_reg_csr_write_op <= 3'h3;
    end else begin
      de_pipe_reg_csr_write_op <= _csr_op_T_15;
    end
    if (reset) begin // @[datapath.scala 182:34]
      de_pipe_reg_csr_write_addr <= 12'h0; // @[datapath.scala 182:34]
    end else if (flush_de) begin // @[datapath.scala 400:23]
      de_pipe_reg_csr_write_addr <= 12'h0; // @[datapath.scala 409:44]
    end else begin
      de_pipe_reg_csr_write_addr <= _GEN_11;
    end
    if (reset) begin // @[datapath.scala 182:34]
      de_pipe_reg_csr_write_data <= 64'h0; // @[datapath.scala 182:34]
    end else if (flush_de) begin // @[datapath.scala 400:23]
      de_pipe_reg_csr_write_data <= 64'h0; // @[datapath.scala 408:44]
    end else begin
      de_pipe_reg_csr_write_data <= _GEN_10;
    end
    if (reset) begin // @[datapath.scala 182:34]
      de_pipe_reg_dest <= 5'h0; // @[datapath.scala 182:34]
    end else if (flush_de) begin // @[datapath.scala 400:23]
      de_pipe_reg_dest <= 5'h0; // @[datapath.scala 416:34]
    end else begin
      de_pipe_reg_dest <= dest_addr;
    end
    if (reset) begin // @[datapath.scala 182:34]
      de_pipe_reg_A_sel <= 1'h0; // @[datapath.scala 182:34]
    end else if (flush_de) begin // @[datapath.scala 400:23]
      de_pipe_reg_A_sel <= 1'h0; // @[datapath.scala 403:35]
    end else begin
      de_pipe_reg_A_sel <= io_ctrl_A_sel;
    end
    if (reset) begin // @[datapath.scala 182:34]
      de_pipe_reg_B_sel <= 1'h0; // @[datapath.scala 182:34]
    end else if (flush_de) begin // @[datapath.scala 400:23]
      de_pipe_reg_B_sel <= 1'h0; // @[datapath.scala 404:35]
    end else begin
      de_pipe_reg_B_sel <= io_ctrl_B_sel;
    end
    if (reset) begin // @[datapath.scala 182:34]
      de_pipe_reg_wd_type <= 2'h0; // @[datapath.scala 182:34]
    end else if (flush_de) begin // @[datapath.scala 400:23]
      de_pipe_reg_wd_type <= 2'h0; // @[datapath.scala 419:37]
    end else begin
      de_pipe_reg_wd_type <= io_ctrl_wd_type;
    end
    if (reset) begin // @[datapath.scala 182:34]
      de_pipe_reg_st_type <= 3'h0; // @[datapath.scala 182:34]
    end else if (flush_de) begin // @[datapath.scala 400:23]
      de_pipe_reg_st_type <= 3'h0; // @[datapath.scala 417:37]
    end else begin
      de_pipe_reg_st_type <= io_ctrl_st_type;
    end
    if (reset) begin // @[datapath.scala 182:34]
      de_pipe_reg_ld_type <= 3'h0; // @[datapath.scala 182:34]
    end else if (flush_de) begin // @[datapath.scala 400:23]
      de_pipe_reg_ld_type <= 3'h0; // @[datapath.scala 418:37]
    end else begin
      de_pipe_reg_ld_type <= io_ctrl_ld_type;
    end
    if (reset) begin // @[datapath.scala 182:34]
      de_pipe_reg_wb_sel <= 2'h0; // @[datapath.scala 182:34]
    end else if (flush_de) begin // @[datapath.scala 400:23]
      de_pipe_reg_wb_sel <= 2'h0; // @[datapath.scala 420:36]
    end else begin
      de_pipe_reg_wb_sel <= io_ctrl_wb_sel;
    end
    if (reset) begin // @[datapath.scala 182:34]
      de_pipe_reg_wb_en <= 1'h0; // @[datapath.scala 182:34]
    end else if (flush_de) begin // @[datapath.scala 400:23]
      de_pipe_reg_wb_en <= 1'h0; // @[datapath.scala 421:35]
    end else begin
      de_pipe_reg_wb_en <= io_ctrl_wb_en;
    end
    if (reset) begin // @[datapath.scala 215:34]
      em_pipe_reg_alu_out <= 64'h0; // @[datapath.scala 215:34]
    end else if (flush_em) begin // @[datapath.scala 517:23]
      em_pipe_reg_alu_out <= 64'h0; // @[datapath.scala 520:37]
    end else begin
      em_pipe_reg_alu_out <= _GEN_56;
    end
    if (reset) begin // @[datapath.scala 215:34]
      em_pipe_reg_alu_sum <= 64'h0; // @[datapath.scala 215:34]
    end else if (flush_em) begin // @[datapath.scala 517:23]
      em_pipe_reg_alu_sum <= 64'h0; // @[datapath.scala 521:37]
    end else begin
      em_pipe_reg_alu_sum <= _GEN_57;
    end
    if (reset) begin // @[datapath.scala 215:34]
      em_pipe_reg_csr_read_data <= 64'h0; // @[datapath.scala 215:34]
    end else if (flush_em) begin // @[datapath.scala 517:23]
      em_pipe_reg_csr_read_data <= 64'h0; // @[datapath.scala 522:43]
    end else begin
      em_pipe_reg_csr_read_data <= de_pipe_reg_csr_read_data;
    end
    if (reset) begin // @[datapath.scala 215:34]
      em_pipe_reg_csr_write_op <= 3'h0; // @[datapath.scala 215:34]
    end else if (flush_em) begin // @[datapath.scala 517:23]
      em_pipe_reg_csr_write_op <= 3'h0; // @[datapath.scala 523:42]
    end else begin
      em_pipe_reg_csr_write_op <= de_pipe_reg_csr_write_op;
    end
    if (reset) begin // @[datapath.scala 215:34]
      em_pipe_reg_csr_write_addr <= 12'h0; // @[datapath.scala 215:34]
    end else if (flush_em) begin // @[datapath.scala 517:23]
      em_pipe_reg_csr_write_addr <= 12'h0; // @[datapath.scala 524:44]
    end else begin
      em_pipe_reg_csr_write_addr <= de_pipe_reg_csr_write_addr;
    end
    if (reset) begin // @[datapath.scala 215:34]
      em_pipe_reg_csr_write_data <= 64'h0; // @[datapath.scala 215:34]
    end else if (flush_em) begin // @[datapath.scala 517:23]
      em_pipe_reg_csr_write_data <= 64'h0; // @[datapath.scala 525:44]
    end else begin
      em_pipe_reg_csr_write_data <= de_pipe_reg_csr_write_data;
    end
    if (reset) begin // @[datapath.scala 215:34]
      em_pipe_reg_ld_type <= 3'h0; // @[datapath.scala 215:34]
    end else if (flush_em) begin // @[datapath.scala 517:23]
      em_pipe_reg_ld_type <= 3'h0; // @[datapath.scala 527:37]
    end else begin
      em_pipe_reg_ld_type <= de_pipe_reg_ld_type;
    end
    if (reset) begin // @[datapath.scala 215:34]
      em_pipe_reg_wb_sel <= 2'h0; // @[datapath.scala 215:34]
    end else if (flush_em) begin // @[datapath.scala 517:23]
      em_pipe_reg_wb_sel <= 2'h0; // @[datapath.scala 528:36]
    end else begin
      em_pipe_reg_wb_sel <= de_pipe_reg_wb_sel;
    end
    if (reset) begin // @[datapath.scala 215:34]
      em_pipe_reg_wb_en <= 1'h0; // @[datapath.scala 215:34]
    end else if (flush_em) begin // @[datapath.scala 517:23]
      em_pipe_reg_wb_en <= 1'h0; // @[datapath.scala 529:35]
    end else begin
      em_pipe_reg_wb_en <= de_pipe_reg_wb_en;
    end
    if (reset) begin // @[datapath.scala 215:34]
      em_pipe_reg_dest <= 5'h0; // @[datapath.scala 215:34]
    end else if (flush_em) begin // @[datapath.scala 517:23]
      em_pipe_reg_dest <= 5'h0; // @[datapath.scala 519:34]
    end else begin
      em_pipe_reg_dest <= de_pipe_reg_dest;
    end
    if (reset) begin // @[datapath.scala 215:34]
      em_pipe_reg_pc <= 64'h0; // @[datapath.scala 215:34]
    end else if (flush_em) begin // @[datapath.scala 517:23]
      em_pipe_reg_pc <= 64'h0; // @[datapath.scala 531:32]
    end else begin
      em_pipe_reg_pc <= de_pipe_reg_pc;
    end
    if (reset) begin // @[datapath.scala 215:34]
      em_pipe_reg_inst <= 32'h13; // @[datapath.scala 215:34]
    end else if (flush_em) begin // @[datapath.scala 517:23]
      em_pipe_reg_inst <= 32'h13; // @[datapath.scala 518:34]
    end else begin
      em_pipe_reg_inst <= de_pipe_reg_inst;
    end
    if (reset) begin // @[datapath.scala 240:34]
      mw_pipe_reg_load_data <= 64'h0; // @[datapath.scala 240:34]
    end else if (flush_mw) begin // @[datapath.scala 599:23]
      mw_pipe_reg_load_data <= 64'h0; // @[datapath.scala 600:39]
    end else if (em_pipe_reg_ld_type == 3'h1) begin // @[datapath.scala 587:32]
      mw_pipe_reg_load_data <= _load_data_ext_T_5;
    end else if (em_pipe_reg_ld_type == 3'h6) begin // @[datapath.scala 588:60]
      mw_pipe_reg_load_data <= _load_data_ext_T_9;
    end else begin
      mw_pipe_reg_load_data <= _load_data_ext_T_33;
    end
    if (flush_mw) begin // @[datapath.scala 599:23]
      mw_pipe_reg_alu_out <= 64'h0; // @[datapath.scala 601:37]
    end else begin
      mw_pipe_reg_alu_out <= em_pipe_reg_alu_out;
    end
    if (flush_mw) begin // @[datapath.scala 599:23]
      mw_pipe_reg_dest <= 5'h0; // @[datapath.scala 602:34]
    end else begin
      mw_pipe_reg_dest <= em_pipe_reg_dest;
    end
    if (reset) begin // @[datapath.scala 240:34]
      mw_pipe_reg_csr_read_data <= 64'h0; // @[datapath.scala 240:34]
    end else if (flush_mw) begin // @[datapath.scala 599:23]
      mw_pipe_reg_csr_read_data <= 64'h0; // @[datapath.scala 607:43]
    end else begin
      mw_pipe_reg_csr_read_data <= em_pipe_reg_csr_read_data;
    end
    if (reset) begin // @[datapath.scala 240:34]
      mw_pipe_reg_csr_write_op <= 3'h0; // @[datapath.scala 240:34]
    end else if (flush_mw) begin // @[datapath.scala 599:23]
      mw_pipe_reg_csr_write_op <= 3'h0; // @[datapath.scala 608:42]
    end else begin
      mw_pipe_reg_csr_write_op <= em_pipe_reg_csr_write_op;
    end
    if (reset) begin // @[datapath.scala 240:34]
      mw_pipe_reg_csr_write_addr <= 12'h0; // @[datapath.scala 240:34]
    end else if (flush_mw) begin // @[datapath.scala 599:23]
      mw_pipe_reg_csr_write_addr <= 12'h0; // @[datapath.scala 610:44]
    end else begin
      mw_pipe_reg_csr_write_addr <= em_pipe_reg_csr_write_addr;
    end
    if (reset) begin // @[datapath.scala 240:34]
      mw_pipe_reg_csr_write_data <= 64'h0; // @[datapath.scala 240:34]
    end else if (flush_mw) begin // @[datapath.scala 599:23]
      mw_pipe_reg_csr_write_data <= 64'h0; // @[datapath.scala 609:44]
    end else begin
      mw_pipe_reg_csr_write_data <= em_pipe_reg_csr_write_data;
    end
    if (reset) begin // @[datapath.scala 240:34]
      mw_pipe_reg_wb_sel <= 2'h0; // @[datapath.scala 240:34]
    end else if (flush_mw) begin // @[datapath.scala 599:23]
      mw_pipe_reg_wb_sel <= 2'h0; // @[datapath.scala 603:36]
    end else begin
      mw_pipe_reg_wb_sel <= em_pipe_reg_wb_sel;
    end
    if (reset) begin // @[datapath.scala 240:34]
      mw_pipe_reg_wb_en <= 1'h0; // @[datapath.scala 240:34]
    end else if (flush_mw) begin // @[datapath.scala 599:23]
      mw_pipe_reg_wb_en <= 1'h0; // @[datapath.scala 604:35]
    end else begin
      mw_pipe_reg_wb_en <= em_pipe_reg_wb_en;
    end
    if (reset) begin // @[datapath.scala 240:34]
      mw_pipe_reg_pc <= 64'h0; // @[datapath.scala 240:34]
    end else if (flush_mw) begin // @[datapath.scala 599:23]
      mw_pipe_reg_pc <= 64'h0; // @[datapath.scala 605:32]
    end else begin
      mw_pipe_reg_pc <= em_pipe_reg_pc;
    end
    if (reset) begin // @[datapath.scala 240:34]
      mw_pipe_reg_inst <= 32'h13; // @[datapath.scala 240:34]
    end else if (flush_mw) begin // @[datapath.scala 599:23]
      mw_pipe_reg_inst <= 32'h13; // @[datapath.scala 606:34]
    end else begin
      mw_pipe_reg_inst <= em_pipe_reg_inst;
    end
    started <= reset; // @[datapath.scala 314:37]
    if (reset) begin // @[datapath.scala 316:25]
      pc <= {{1'd0}, _pc_T_1}; // @[datapath.scala 316:25]
    end else if (csr_io_trap) begin // @[Mux.scala 101:16]
      pc <= {{1'd0}, csr_io_trapVec};
    end else if (_next_pc_T_2) begin // @[Mux.scala 101:16]
      pc <= {{1'd0}, csr_io_trapVec};
    end else if (_next_pc_T_4) begin // @[Mux.scala 101:16]
      pc <= _next_pc_T_6;
    end else begin
      pc <= _next_pc_T_8;
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
  de_pipe_reg_alu_op = _RAND_2[3:0];
  _RAND_3 = {2{`RANDOM}};
  de_pipe_reg_pc = _RAND_3[63:0];
  _RAND_4 = {1{`RANDOM}};
  de_pipe_reg_inst = _RAND_4[31:0];
  _RAND_5 = {2{`RANDOM}};
  de_pipe_reg_imm = _RAND_5[63:0];
  _RAND_6 = {2{`RANDOM}};
  de_pipe_reg_rs1 = _RAND_6[63:0];
  _RAND_7 = {2{`RANDOM}};
  de_pipe_reg_src1_addr = _RAND_7[63:0];
  _RAND_8 = {2{`RANDOM}};
  de_pipe_reg_rs2 = _RAND_8[63:0];
  _RAND_9 = {2{`RANDOM}};
  de_pipe_reg_src2_addr = _RAND_9[63:0];
  _RAND_10 = {2{`RANDOM}};
  de_pipe_reg_csr_read_data = _RAND_10[63:0];
  _RAND_11 = {1{`RANDOM}};
  de_pipe_reg_csr_write_op = _RAND_11[2:0];
  _RAND_12 = {1{`RANDOM}};
  de_pipe_reg_csr_write_addr = _RAND_12[11:0];
  _RAND_13 = {2{`RANDOM}};
  de_pipe_reg_csr_write_data = _RAND_13[63:0];
  _RAND_14 = {1{`RANDOM}};
  de_pipe_reg_dest = _RAND_14[4:0];
  _RAND_15 = {1{`RANDOM}};
  de_pipe_reg_A_sel = _RAND_15[0:0];
  _RAND_16 = {1{`RANDOM}};
  de_pipe_reg_B_sel = _RAND_16[0:0];
  _RAND_17 = {1{`RANDOM}};
  de_pipe_reg_wd_type = _RAND_17[1:0];
  _RAND_18 = {1{`RANDOM}};
  de_pipe_reg_st_type = _RAND_18[2:0];
  _RAND_19 = {1{`RANDOM}};
  de_pipe_reg_ld_type = _RAND_19[2:0];
  _RAND_20 = {1{`RANDOM}};
  de_pipe_reg_wb_sel = _RAND_20[1:0];
  _RAND_21 = {1{`RANDOM}};
  de_pipe_reg_wb_en = _RAND_21[0:0];
  _RAND_22 = {2{`RANDOM}};
  em_pipe_reg_alu_out = _RAND_22[63:0];
  _RAND_23 = {2{`RANDOM}};
  em_pipe_reg_alu_sum = _RAND_23[63:0];
  _RAND_24 = {2{`RANDOM}};
  em_pipe_reg_csr_read_data = _RAND_24[63:0];
  _RAND_25 = {1{`RANDOM}};
  em_pipe_reg_csr_write_op = _RAND_25[2:0];
  _RAND_26 = {1{`RANDOM}};
  em_pipe_reg_csr_write_addr = _RAND_26[11:0];
  _RAND_27 = {2{`RANDOM}};
  em_pipe_reg_csr_write_data = _RAND_27[63:0];
  _RAND_28 = {1{`RANDOM}};
  em_pipe_reg_ld_type = _RAND_28[2:0];
  _RAND_29 = {1{`RANDOM}};
  em_pipe_reg_wb_sel = _RAND_29[1:0];
  _RAND_30 = {1{`RANDOM}};
  em_pipe_reg_wb_en = _RAND_30[0:0];
  _RAND_31 = {1{`RANDOM}};
  em_pipe_reg_dest = _RAND_31[4:0];
  _RAND_32 = {2{`RANDOM}};
  em_pipe_reg_pc = _RAND_32[63:0];
  _RAND_33 = {1{`RANDOM}};
  em_pipe_reg_inst = _RAND_33[31:0];
  _RAND_34 = {2{`RANDOM}};
  mw_pipe_reg_load_data = _RAND_34[63:0];
  _RAND_35 = {2{`RANDOM}};
  mw_pipe_reg_alu_out = _RAND_35[63:0];
  _RAND_36 = {1{`RANDOM}};
  mw_pipe_reg_dest = _RAND_36[4:0];
  _RAND_37 = {2{`RANDOM}};
  mw_pipe_reg_csr_read_data = _RAND_37[63:0];
  _RAND_38 = {1{`RANDOM}};
  mw_pipe_reg_csr_write_op = _RAND_38[2:0];
  _RAND_39 = {1{`RANDOM}};
  mw_pipe_reg_csr_write_addr = _RAND_39[11:0];
  _RAND_40 = {2{`RANDOM}};
  mw_pipe_reg_csr_write_data = _RAND_40[63:0];
  _RAND_41 = {1{`RANDOM}};
  mw_pipe_reg_wb_sel = _RAND_41[1:0];
  _RAND_42 = {1{`RANDOM}};
  mw_pipe_reg_wb_en = _RAND_42[0:0];
  _RAND_43 = {2{`RANDOM}};
  mw_pipe_reg_pc = _RAND_43[63:0];
  _RAND_44 = {1{`RANDOM}};
  mw_pipe_reg_inst = _RAND_44[31:0];
  _RAND_45 = {1{`RANDOM}};
  started = _RAND_45[0:0];
  _RAND_46 = {3{`RANDOM}};
  pc = _RAND_46[64:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule

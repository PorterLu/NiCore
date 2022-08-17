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
  reg [63:0] reg_0; // @[datapath.scala 31:22]
  reg [63:0] reg_1; // @[datapath.scala 31:22]
  reg [63:0] reg_2; // @[datapath.scala 31:22]
  reg [63:0] reg_3; // @[datapath.scala 31:22]
  reg [63:0] reg_4; // @[datapath.scala 31:22]
  reg [63:0] reg_5; // @[datapath.scala 31:22]
  reg [63:0] reg_6; // @[datapath.scala 31:22]
  reg [63:0] reg_7; // @[datapath.scala 31:22]
  reg [63:0] reg_8; // @[datapath.scala 31:22]
  reg [63:0] reg_9; // @[datapath.scala 31:22]
  reg [63:0] reg_10; // @[datapath.scala 31:22]
  reg [63:0] reg_11; // @[datapath.scala 31:22]
  reg [63:0] reg_12; // @[datapath.scala 31:22]
  reg [63:0] reg_13; // @[datapath.scala 31:22]
  reg [63:0] reg_14; // @[datapath.scala 31:22]
  reg [63:0] reg_15; // @[datapath.scala 31:22]
  reg [63:0] reg_16; // @[datapath.scala 31:22]
  reg [63:0] reg_17; // @[datapath.scala 31:22]
  reg [63:0] reg_18; // @[datapath.scala 31:22]
  reg [63:0] reg_19; // @[datapath.scala 31:22]
  reg [63:0] reg_20; // @[datapath.scala 31:22]
  reg [63:0] reg_21; // @[datapath.scala 31:22]
  reg [63:0] reg_22; // @[datapath.scala 31:22]
  reg [63:0] reg_23; // @[datapath.scala 31:22]
  reg [63:0] reg_24; // @[datapath.scala 31:22]
  reg [63:0] reg_25; // @[datapath.scala 31:22]
  reg [63:0] reg_26; // @[datapath.scala 31:22]
  reg [63:0] reg_27; // @[datapath.scala 31:22]
  reg [63:0] reg_28; // @[datapath.scala 31:22]
  reg [63:0] reg_29; // @[datapath.scala 31:22]
  reg [63:0] reg_30; // @[datapath.scala 31:22]
  reg [63:0] reg_31; // @[datapath.scala 31:22]
  wire [63:0] _GEN_65 = 5'h1 == io_raddr_0 ? reg_1 : reg_0; // @[datapath.scala 44:{37,37}]
  wire [63:0] _GEN_66 = 5'h2 == io_raddr_0 ? reg_2 : _GEN_65; // @[datapath.scala 44:{37,37}]
  wire [63:0] _GEN_67 = 5'h3 == io_raddr_0 ? reg_3 : _GEN_66; // @[datapath.scala 44:{37,37}]
  wire [63:0] _GEN_68 = 5'h4 == io_raddr_0 ? reg_4 : _GEN_67; // @[datapath.scala 44:{37,37}]
  wire [63:0] _GEN_69 = 5'h5 == io_raddr_0 ? reg_5 : _GEN_68; // @[datapath.scala 44:{37,37}]
  wire [63:0] _GEN_70 = 5'h6 == io_raddr_0 ? reg_6 : _GEN_69; // @[datapath.scala 44:{37,37}]
  wire [63:0] _GEN_71 = 5'h7 == io_raddr_0 ? reg_7 : _GEN_70; // @[datapath.scala 44:{37,37}]
  wire [63:0] _GEN_72 = 5'h8 == io_raddr_0 ? reg_8 : _GEN_71; // @[datapath.scala 44:{37,37}]
  wire [63:0] _GEN_73 = 5'h9 == io_raddr_0 ? reg_9 : _GEN_72; // @[datapath.scala 44:{37,37}]
  wire [63:0] _GEN_74 = 5'ha == io_raddr_0 ? reg_10 : _GEN_73; // @[datapath.scala 44:{37,37}]
  wire [63:0] _GEN_75 = 5'hb == io_raddr_0 ? reg_11 : _GEN_74; // @[datapath.scala 44:{37,37}]
  wire [63:0] _GEN_76 = 5'hc == io_raddr_0 ? reg_12 : _GEN_75; // @[datapath.scala 44:{37,37}]
  wire [63:0] _GEN_77 = 5'hd == io_raddr_0 ? reg_13 : _GEN_76; // @[datapath.scala 44:{37,37}]
  wire [63:0] _GEN_78 = 5'he == io_raddr_0 ? reg_14 : _GEN_77; // @[datapath.scala 44:{37,37}]
  wire [63:0] _GEN_79 = 5'hf == io_raddr_0 ? reg_15 : _GEN_78; // @[datapath.scala 44:{37,37}]
  wire [63:0] _GEN_80 = 5'h10 == io_raddr_0 ? reg_16 : _GEN_79; // @[datapath.scala 44:{37,37}]
  wire [63:0] _GEN_81 = 5'h11 == io_raddr_0 ? reg_17 : _GEN_80; // @[datapath.scala 44:{37,37}]
  wire [63:0] _GEN_82 = 5'h12 == io_raddr_0 ? reg_18 : _GEN_81; // @[datapath.scala 44:{37,37}]
  wire [63:0] _GEN_83 = 5'h13 == io_raddr_0 ? reg_19 : _GEN_82; // @[datapath.scala 44:{37,37}]
  wire [63:0] _GEN_84 = 5'h14 == io_raddr_0 ? reg_20 : _GEN_83; // @[datapath.scala 44:{37,37}]
  wire [63:0] _GEN_85 = 5'h15 == io_raddr_0 ? reg_21 : _GEN_84; // @[datapath.scala 44:{37,37}]
  wire [63:0] _GEN_86 = 5'h16 == io_raddr_0 ? reg_22 : _GEN_85; // @[datapath.scala 44:{37,37}]
  wire [63:0] _GEN_87 = 5'h17 == io_raddr_0 ? reg_23 : _GEN_86; // @[datapath.scala 44:{37,37}]
  wire [63:0] _GEN_88 = 5'h18 == io_raddr_0 ? reg_24 : _GEN_87; // @[datapath.scala 44:{37,37}]
  wire [63:0] _GEN_89 = 5'h19 == io_raddr_0 ? reg_25 : _GEN_88; // @[datapath.scala 44:{37,37}]
  wire [63:0] _GEN_90 = 5'h1a == io_raddr_0 ? reg_26 : _GEN_89; // @[datapath.scala 44:{37,37}]
  wire [63:0] _GEN_91 = 5'h1b == io_raddr_0 ? reg_27 : _GEN_90; // @[datapath.scala 44:{37,37}]
  wire [63:0] _GEN_92 = 5'h1c == io_raddr_0 ? reg_28 : _GEN_91; // @[datapath.scala 44:{37,37}]
  wire [63:0] _GEN_93 = 5'h1d == io_raddr_0 ? reg_29 : _GEN_92; // @[datapath.scala 44:{37,37}]
  wire [63:0] _GEN_94 = 5'h1e == io_raddr_0 ? reg_30 : _GEN_93; // @[datapath.scala 44:{37,37}]
  wire [63:0] _GEN_95 = 5'h1f == io_raddr_0 ? reg_31 : _GEN_94; // @[datapath.scala 44:{37,37}]
  wire [63:0] _GEN_98 = 5'h1 == io_raddr_1 ? reg_1 : reg_0; // @[datapath.scala 44:{37,37}]
  wire [63:0] _GEN_99 = 5'h2 == io_raddr_1 ? reg_2 : _GEN_98; // @[datapath.scala 44:{37,37}]
  wire [63:0] _GEN_100 = 5'h3 == io_raddr_1 ? reg_3 : _GEN_99; // @[datapath.scala 44:{37,37}]
  wire [63:0] _GEN_101 = 5'h4 == io_raddr_1 ? reg_4 : _GEN_100; // @[datapath.scala 44:{37,37}]
  wire [63:0] _GEN_102 = 5'h5 == io_raddr_1 ? reg_5 : _GEN_101; // @[datapath.scala 44:{37,37}]
  wire [63:0] _GEN_103 = 5'h6 == io_raddr_1 ? reg_6 : _GEN_102; // @[datapath.scala 44:{37,37}]
  wire [63:0] _GEN_104 = 5'h7 == io_raddr_1 ? reg_7 : _GEN_103; // @[datapath.scala 44:{37,37}]
  wire [63:0] _GEN_105 = 5'h8 == io_raddr_1 ? reg_8 : _GEN_104; // @[datapath.scala 44:{37,37}]
  wire [63:0] _GEN_106 = 5'h9 == io_raddr_1 ? reg_9 : _GEN_105; // @[datapath.scala 44:{37,37}]
  wire [63:0] _GEN_107 = 5'ha == io_raddr_1 ? reg_10 : _GEN_106; // @[datapath.scala 44:{37,37}]
  wire [63:0] _GEN_108 = 5'hb == io_raddr_1 ? reg_11 : _GEN_107; // @[datapath.scala 44:{37,37}]
  wire [63:0] _GEN_109 = 5'hc == io_raddr_1 ? reg_12 : _GEN_108; // @[datapath.scala 44:{37,37}]
  wire [63:0] _GEN_110 = 5'hd == io_raddr_1 ? reg_13 : _GEN_109; // @[datapath.scala 44:{37,37}]
  wire [63:0] _GEN_111 = 5'he == io_raddr_1 ? reg_14 : _GEN_110; // @[datapath.scala 44:{37,37}]
  wire [63:0] _GEN_112 = 5'hf == io_raddr_1 ? reg_15 : _GEN_111; // @[datapath.scala 44:{37,37}]
  wire [63:0] _GEN_113 = 5'h10 == io_raddr_1 ? reg_16 : _GEN_112; // @[datapath.scala 44:{37,37}]
  wire [63:0] _GEN_114 = 5'h11 == io_raddr_1 ? reg_17 : _GEN_113; // @[datapath.scala 44:{37,37}]
  wire [63:0] _GEN_115 = 5'h12 == io_raddr_1 ? reg_18 : _GEN_114; // @[datapath.scala 44:{37,37}]
  wire [63:0] _GEN_116 = 5'h13 == io_raddr_1 ? reg_19 : _GEN_115; // @[datapath.scala 44:{37,37}]
  wire [63:0] _GEN_117 = 5'h14 == io_raddr_1 ? reg_20 : _GEN_116; // @[datapath.scala 44:{37,37}]
  wire [63:0] _GEN_118 = 5'h15 == io_raddr_1 ? reg_21 : _GEN_117; // @[datapath.scala 44:{37,37}]
  wire [63:0] _GEN_119 = 5'h16 == io_raddr_1 ? reg_22 : _GEN_118; // @[datapath.scala 44:{37,37}]
  wire [63:0] _GEN_120 = 5'h17 == io_raddr_1 ? reg_23 : _GEN_119; // @[datapath.scala 44:{37,37}]
  wire [63:0] _GEN_121 = 5'h18 == io_raddr_1 ? reg_24 : _GEN_120; // @[datapath.scala 44:{37,37}]
  wire [63:0] _GEN_122 = 5'h19 == io_raddr_1 ? reg_25 : _GEN_121; // @[datapath.scala 44:{37,37}]
  wire [63:0] _GEN_123 = 5'h1a == io_raddr_1 ? reg_26 : _GEN_122; // @[datapath.scala 44:{37,37}]
  wire [63:0] _GEN_124 = 5'h1b == io_raddr_1 ? reg_27 : _GEN_123; // @[datapath.scala 44:{37,37}]
  wire [63:0] _GEN_125 = 5'h1c == io_raddr_1 ? reg_28 : _GEN_124; // @[datapath.scala 44:{37,37}]
  wire [63:0] _GEN_126 = 5'h1d == io_raddr_1 ? reg_29 : _GEN_125; // @[datapath.scala 44:{37,37}]
  wire [63:0] _GEN_127 = 5'h1e == io_raddr_1 ? reg_30 : _GEN_126; // @[datapath.scala 44:{37,37}]
  wire [63:0] _GEN_128 = 5'h1f == io_raddr_1 ? reg_31 : _GEN_127; // @[datapath.scala 44:{37,37}]
  assign io_rdata_0 = io_raddr_0 == 5'h0 ? 64'h0 : _GEN_95; // @[datapath.scala 41:42 42:37 44:37]
  assign io_rdata_1 = io_raddr_1 == 5'h0 ? 64'h0 : _GEN_128; // @[datapath.scala 41:42 42:37 44:37]
  assign io_rdata_4 = reg_1; // @[datapath.scala 41:42 42:37 44:37]
  assign io_rdata_5 = reg_2; // @[datapath.scala 41:42 42:37 44:37]
  assign io_rdata_6 = reg_3; // @[datapath.scala 41:42 42:37 44:37]
  assign io_rdata_7 = reg_4; // @[datapath.scala 41:42 42:37 44:37]
  assign io_rdata_8 = reg_5; // @[datapath.scala 41:42 42:37 44:37]
  assign io_rdata_9 = reg_6; // @[datapath.scala 41:42 42:37 44:37]
  assign io_rdata_10 = reg_7; // @[datapath.scala 41:42 42:37 44:37]
  assign io_rdata_11 = reg_8; // @[datapath.scala 41:42 42:37 44:37]
  assign io_rdata_12 = reg_9; // @[datapath.scala 41:42 42:37 44:37]
  assign io_rdata_13 = reg_10; // @[datapath.scala 41:42 42:37 44:37]
  assign io_rdata_14 = reg_11; // @[datapath.scala 41:42 42:37 44:37]
  assign io_rdata_15 = reg_12; // @[datapath.scala 41:42 42:37 44:37]
  assign io_rdata_16 = reg_13; // @[datapath.scala 41:42 42:37 44:37]
  assign io_rdata_17 = reg_14; // @[datapath.scala 41:42 42:37 44:37]
  assign io_rdata_18 = reg_15; // @[datapath.scala 41:42 42:37 44:37]
  assign io_rdata_19 = reg_16; // @[datapath.scala 41:42 42:37 44:37]
  assign io_rdata_20 = reg_17; // @[datapath.scala 41:42 42:37 44:37]
  assign io_rdata_21 = reg_18; // @[datapath.scala 41:42 42:37 44:37]
  assign io_rdata_22 = reg_19; // @[datapath.scala 41:42 42:37 44:37]
  assign io_rdata_23 = reg_20; // @[datapath.scala 41:42 42:37 44:37]
  assign io_rdata_24 = reg_21; // @[datapath.scala 41:42 42:37 44:37]
  assign io_rdata_25 = reg_22; // @[datapath.scala 41:42 42:37 44:37]
  assign io_rdata_26 = reg_23; // @[datapath.scala 41:42 42:37 44:37]
  assign io_rdata_27 = reg_24; // @[datapath.scala 41:42 42:37 44:37]
  assign io_rdata_28 = reg_25; // @[datapath.scala 41:42 42:37 44:37]
  assign io_rdata_29 = reg_26; // @[datapath.scala 41:42 42:37 44:37]
  assign io_rdata_30 = reg_27; // @[datapath.scala 41:42 42:37 44:37]
  assign io_rdata_31 = reg_28; // @[datapath.scala 41:42 42:37 44:37]
  assign io_rdata_32 = reg_29; // @[datapath.scala 41:42 42:37 44:37]
  assign io_rdata_33 = reg_30; // @[datapath.scala 41:42 42:37 44:37]
  assign io_rdata_34 = reg_31; // @[datapath.scala 41:42 42:37 44:37]
  always @(posedge clock) begin
    if (reset) begin // @[datapath.scala 31:22]
      reg_0 <= 64'h0; // @[datapath.scala 31:22]
    end else if (io_wen) begin // @[datapath.scala 33:17]
      if (5'h0 == io_waddr) begin // @[datapath.scala 34:23]
        reg_0 <= io_wdata; // @[datapath.scala 34:23]
      end
    end
    if (reset) begin // @[datapath.scala 31:22]
      reg_1 <= 64'h0; // @[datapath.scala 31:22]
    end else if (io_wen) begin // @[datapath.scala 33:17]
      if (5'h1 == io_waddr) begin // @[datapath.scala 34:23]
        reg_1 <= io_wdata; // @[datapath.scala 34:23]
      end
    end
    if (reset) begin // @[datapath.scala 31:22]
      reg_2 <= 64'h0; // @[datapath.scala 31:22]
    end else if (io_wen) begin // @[datapath.scala 33:17]
      if (5'h2 == io_waddr) begin // @[datapath.scala 34:23]
        reg_2 <= io_wdata; // @[datapath.scala 34:23]
      end
    end
    if (reset) begin // @[datapath.scala 31:22]
      reg_3 <= 64'h0; // @[datapath.scala 31:22]
    end else if (io_wen) begin // @[datapath.scala 33:17]
      if (5'h3 == io_waddr) begin // @[datapath.scala 34:23]
        reg_3 <= io_wdata; // @[datapath.scala 34:23]
      end
    end
    if (reset) begin // @[datapath.scala 31:22]
      reg_4 <= 64'h0; // @[datapath.scala 31:22]
    end else if (io_wen) begin // @[datapath.scala 33:17]
      if (5'h4 == io_waddr) begin // @[datapath.scala 34:23]
        reg_4 <= io_wdata; // @[datapath.scala 34:23]
      end
    end
    if (reset) begin // @[datapath.scala 31:22]
      reg_5 <= 64'h0; // @[datapath.scala 31:22]
    end else if (io_wen) begin // @[datapath.scala 33:17]
      if (5'h5 == io_waddr) begin // @[datapath.scala 34:23]
        reg_5 <= io_wdata; // @[datapath.scala 34:23]
      end
    end
    if (reset) begin // @[datapath.scala 31:22]
      reg_6 <= 64'h0; // @[datapath.scala 31:22]
    end else if (io_wen) begin // @[datapath.scala 33:17]
      if (5'h6 == io_waddr) begin // @[datapath.scala 34:23]
        reg_6 <= io_wdata; // @[datapath.scala 34:23]
      end
    end
    if (reset) begin // @[datapath.scala 31:22]
      reg_7 <= 64'h0; // @[datapath.scala 31:22]
    end else if (io_wen) begin // @[datapath.scala 33:17]
      if (5'h7 == io_waddr) begin // @[datapath.scala 34:23]
        reg_7 <= io_wdata; // @[datapath.scala 34:23]
      end
    end
    if (reset) begin // @[datapath.scala 31:22]
      reg_8 <= 64'h0; // @[datapath.scala 31:22]
    end else if (io_wen) begin // @[datapath.scala 33:17]
      if (5'h8 == io_waddr) begin // @[datapath.scala 34:23]
        reg_8 <= io_wdata; // @[datapath.scala 34:23]
      end
    end
    if (reset) begin // @[datapath.scala 31:22]
      reg_9 <= 64'h0; // @[datapath.scala 31:22]
    end else if (io_wen) begin // @[datapath.scala 33:17]
      if (5'h9 == io_waddr) begin // @[datapath.scala 34:23]
        reg_9 <= io_wdata; // @[datapath.scala 34:23]
      end
    end
    if (reset) begin // @[datapath.scala 31:22]
      reg_10 <= 64'h0; // @[datapath.scala 31:22]
    end else if (io_wen) begin // @[datapath.scala 33:17]
      if (5'ha == io_waddr) begin // @[datapath.scala 34:23]
        reg_10 <= io_wdata; // @[datapath.scala 34:23]
      end
    end
    if (reset) begin // @[datapath.scala 31:22]
      reg_11 <= 64'h0; // @[datapath.scala 31:22]
    end else if (io_wen) begin // @[datapath.scala 33:17]
      if (5'hb == io_waddr) begin // @[datapath.scala 34:23]
        reg_11 <= io_wdata; // @[datapath.scala 34:23]
      end
    end
    if (reset) begin // @[datapath.scala 31:22]
      reg_12 <= 64'h0; // @[datapath.scala 31:22]
    end else if (io_wen) begin // @[datapath.scala 33:17]
      if (5'hc == io_waddr) begin // @[datapath.scala 34:23]
        reg_12 <= io_wdata; // @[datapath.scala 34:23]
      end
    end
    if (reset) begin // @[datapath.scala 31:22]
      reg_13 <= 64'h0; // @[datapath.scala 31:22]
    end else if (io_wen) begin // @[datapath.scala 33:17]
      if (5'hd == io_waddr) begin // @[datapath.scala 34:23]
        reg_13 <= io_wdata; // @[datapath.scala 34:23]
      end
    end
    if (reset) begin // @[datapath.scala 31:22]
      reg_14 <= 64'h0; // @[datapath.scala 31:22]
    end else if (io_wen) begin // @[datapath.scala 33:17]
      if (5'he == io_waddr) begin // @[datapath.scala 34:23]
        reg_14 <= io_wdata; // @[datapath.scala 34:23]
      end
    end
    if (reset) begin // @[datapath.scala 31:22]
      reg_15 <= 64'h0; // @[datapath.scala 31:22]
    end else if (io_wen) begin // @[datapath.scala 33:17]
      if (5'hf == io_waddr) begin // @[datapath.scala 34:23]
        reg_15 <= io_wdata; // @[datapath.scala 34:23]
      end
    end
    if (reset) begin // @[datapath.scala 31:22]
      reg_16 <= 64'h0; // @[datapath.scala 31:22]
    end else if (io_wen) begin // @[datapath.scala 33:17]
      if (5'h10 == io_waddr) begin // @[datapath.scala 34:23]
        reg_16 <= io_wdata; // @[datapath.scala 34:23]
      end
    end
    if (reset) begin // @[datapath.scala 31:22]
      reg_17 <= 64'h0; // @[datapath.scala 31:22]
    end else if (io_wen) begin // @[datapath.scala 33:17]
      if (5'h11 == io_waddr) begin // @[datapath.scala 34:23]
        reg_17 <= io_wdata; // @[datapath.scala 34:23]
      end
    end
    if (reset) begin // @[datapath.scala 31:22]
      reg_18 <= 64'h0; // @[datapath.scala 31:22]
    end else if (io_wen) begin // @[datapath.scala 33:17]
      if (5'h12 == io_waddr) begin // @[datapath.scala 34:23]
        reg_18 <= io_wdata; // @[datapath.scala 34:23]
      end
    end
    if (reset) begin // @[datapath.scala 31:22]
      reg_19 <= 64'h0; // @[datapath.scala 31:22]
    end else if (io_wen) begin // @[datapath.scala 33:17]
      if (5'h13 == io_waddr) begin // @[datapath.scala 34:23]
        reg_19 <= io_wdata; // @[datapath.scala 34:23]
      end
    end
    if (reset) begin // @[datapath.scala 31:22]
      reg_20 <= 64'h0; // @[datapath.scala 31:22]
    end else if (io_wen) begin // @[datapath.scala 33:17]
      if (5'h14 == io_waddr) begin // @[datapath.scala 34:23]
        reg_20 <= io_wdata; // @[datapath.scala 34:23]
      end
    end
    if (reset) begin // @[datapath.scala 31:22]
      reg_21 <= 64'h0; // @[datapath.scala 31:22]
    end else if (io_wen) begin // @[datapath.scala 33:17]
      if (5'h15 == io_waddr) begin // @[datapath.scala 34:23]
        reg_21 <= io_wdata; // @[datapath.scala 34:23]
      end
    end
    if (reset) begin // @[datapath.scala 31:22]
      reg_22 <= 64'h0; // @[datapath.scala 31:22]
    end else if (io_wen) begin // @[datapath.scala 33:17]
      if (5'h16 == io_waddr) begin // @[datapath.scala 34:23]
        reg_22 <= io_wdata; // @[datapath.scala 34:23]
      end
    end
    if (reset) begin // @[datapath.scala 31:22]
      reg_23 <= 64'h0; // @[datapath.scala 31:22]
    end else if (io_wen) begin // @[datapath.scala 33:17]
      if (5'h17 == io_waddr) begin // @[datapath.scala 34:23]
        reg_23 <= io_wdata; // @[datapath.scala 34:23]
      end
    end
    if (reset) begin // @[datapath.scala 31:22]
      reg_24 <= 64'h0; // @[datapath.scala 31:22]
    end else if (io_wen) begin // @[datapath.scala 33:17]
      if (5'h18 == io_waddr) begin // @[datapath.scala 34:23]
        reg_24 <= io_wdata; // @[datapath.scala 34:23]
      end
    end
    if (reset) begin // @[datapath.scala 31:22]
      reg_25 <= 64'h0; // @[datapath.scala 31:22]
    end else if (io_wen) begin // @[datapath.scala 33:17]
      if (5'h19 == io_waddr) begin // @[datapath.scala 34:23]
        reg_25 <= io_wdata; // @[datapath.scala 34:23]
      end
    end
    if (reset) begin // @[datapath.scala 31:22]
      reg_26 <= 64'h0; // @[datapath.scala 31:22]
    end else if (io_wen) begin // @[datapath.scala 33:17]
      if (5'h1a == io_waddr) begin // @[datapath.scala 34:23]
        reg_26 <= io_wdata; // @[datapath.scala 34:23]
      end
    end
    if (reset) begin // @[datapath.scala 31:22]
      reg_27 <= 64'h0; // @[datapath.scala 31:22]
    end else if (io_wen) begin // @[datapath.scala 33:17]
      if (5'h1b == io_waddr) begin // @[datapath.scala 34:23]
        reg_27 <= io_wdata; // @[datapath.scala 34:23]
      end
    end
    if (reset) begin // @[datapath.scala 31:22]
      reg_28 <= 64'h0; // @[datapath.scala 31:22]
    end else if (io_wen) begin // @[datapath.scala 33:17]
      if (5'h1c == io_waddr) begin // @[datapath.scala 34:23]
        reg_28 <= io_wdata; // @[datapath.scala 34:23]
      end
    end
    if (reset) begin // @[datapath.scala 31:22]
      reg_29 <= 64'h0; // @[datapath.scala 31:22]
    end else if (io_wen) begin // @[datapath.scala 33:17]
      if (5'h1d == io_waddr) begin // @[datapath.scala 34:23]
        reg_29 <= io_wdata; // @[datapath.scala 34:23]
      end
    end
    if (reset) begin // @[datapath.scala 31:22]
      reg_30 <= 64'h0; // @[datapath.scala 31:22]
    end else if (io_wen) begin // @[datapath.scala 33:17]
      if (5'h1e == io_waddr) begin // @[datapath.scala 34:23]
        reg_30 <= io_wdata; // @[datapath.scala 34:23]
      end
    end
    if (reset) begin // @[datapath.scala 31:22]
      reg_31 <= 64'h0; // @[datapath.scala 31:22]
    end else if (io_wen) begin // @[datapath.scala 33:17]
      if (5'h1f == io_waddr) begin // @[datapath.scala 34:23]
        reg_31 <= io_wdata; // @[datapath.scala 34:23]
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
  input  [63:0] io_jump_addr,
  input         io_jump_taken,
  input         io_isSret,
  input         io_isMret,
  input  [63:0] io_pc_fetch_misalign,
  input  [63:0] io_load_misalign_addr,
  input  [63:0] io_store_misalign_addr,
  input  [63:0] io_ebreak_addr,
  input  [63:0] io_excPC,
  output [63:0] io_excValue,
  output [63:0] io_trapVec,
  input         io_stall,
  output        io_trap,
  input         io_fd_enable,
  input         io_de_enable,
  input         io_em_enable,
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
  reg [1:0] mode; // @[csr.scala 157:27]
  reg  mstatus_sum; // @[csr.scala 162:30]
  reg [1:0] mstatus_mpp; // @[csr.scala 162:30]
  reg  mstatus_spp; // @[csr.scala 162:30]
  reg  mstatus_mpie; // @[csr.scala 162:30]
  reg  mstatus_spie; // @[csr.scala 162:30]
  reg  mstatus_mie; // @[csr.scala 162:30]
  reg  mstatus_sie; // @[csr.scala 162:30]
  reg [63:0] medeleg_data; // @[csr.scala 164:30]
  reg [63:0] mideleg_data; // @[csr.scala 165:30]
  reg  mie_meie; // @[csr.scala 166:34]
  reg  mie_seie; // @[csr.scala 166:34]
  reg  mie_mtie; // @[csr.scala 166:34]
  reg  mie_stie; // @[csr.scala 166:34]
  reg  mie_msie; // @[csr.scala 166:34]
  reg  mie_ssie; // @[csr.scala 166:34]
  reg [61:0] mtvec_base; // @[csr.scala 167:34]
  reg [1:0] mtvec_mode; // @[csr.scala 167:34]
  reg [63:0] mscratch_data; // @[csr.scala 168:30]
  reg [63:0] mepc_data; // @[csr.scala 169:34]
  reg  mcause_int; // @[csr.scala 170:34]
  reg [62:0] mcause_code; // @[csr.scala 170:34]
  reg [63:0] mtval_data; // @[csr.scala 171:34]
  reg  mip_meip; // @[csr.scala 172:34]
  reg  mip_seip; // @[csr.scala 172:34]
  reg  mip_stip; // @[csr.scala 172:34]
  reg  mip_msip; // @[csr.scala 172:34]
  reg  mip_ssip; // @[csr.scala 172:34]
  reg [63:0] mcycle_data; // @[csr.scala 174:34]
  reg [63:0] minstret_data; // @[csr.scala 175:30]
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
  reg [61:0] stvec_base; // @[csr.scala 179:34]
  reg [1:0] stvec_mode; // @[csr.scala 179:34]
  reg [63:0] sscratch_data; // @[csr.scala 180:30]
  reg [63:0] sepc_data; // @[csr.scala 181:34]
  reg  scause_int; // @[csr.scala 182:34]
  reg [62:0] scause_code; // @[csr.scala 182:34]
  reg [63:0] stval_data; // @[csr.scala 183:34]
  wire [12:0] lo = {4'h0,sstatus_spp,2'h0,sstatus_spie,3'h0,sstatus_sie,1'h0}; // @[csr.scala 195:70]
  wire [63:0] _T = {45'h0,sstatus_sum,1'h0,4'h0,lo}; // @[csr.scala 195:70]
  wire  tmp_meie = _sie_T[11]; // @[csrFile.scala 311:18]
  wire  tmp_mtie = _sie_T[7]; // @[csrFile.scala 313:18]
  wire  tmp_msie = _sie_T[3]; // @[csrFile.scala 315:18]
  wire [5:0] lo_7 = {_sie_T[5],1'h0,tmp_msie,1'h0,_sie_T[1],1'h0}; // @[csrFile.scala 37:29]
  wire [63:0] _T_163 = {52'h0,tmp_meie,1'h0,_sie_T[9],1'h0,tmp_mtie,1'h0,lo_7}; // @[csrFile.scala 37:29]
  wire  sie_ssie = _T_163[1]; // @[csrFile.scala 65:29]
  wire  sie_stie = _T_163[5]; // @[csrFile.scala 64:29]
  wire  sie_seie = _T_163[9]; // @[csrFile.scala 63:29]
  wire [63:0] _T_1 = {54'h0,sie_seie,3'h0,sie_stie,3'h0,sie_ssie,1'h0}; // @[csr.scala 196:66]
  wire [63:0] _T_2 = {stvec_base,stvec_mode}; // @[csr.scala 197:68]
  wire [63:0] _T_3 = {scause_int,scause_code}; // @[csr.scala 201:69]
  wire [63:0] _T_4 = {54'h0,mip_seip,3'h0,mip_stip,3'h0,mip_ssip,1'h0}; // @[csr.scala 203:66]
  wire [63:0] _T_9 = {mtvec_base,mtvec_mode}; // @[csr.scala 214:68]
  wire [63:0] _T_10 = {mcause_int,mcause_code}; // @[csr.scala 218:69]
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
  wire  _instValid_T = readable & writable; // @[csr.scala 234:43]
  wire  _instValid_T_4 = 3'h1 == io_r_op ? readable : 1'h1; // @[Mux.scala 81:58]
  wire  _instValid_T_6 = 3'h2 == io_r_op ? writable : _instValid_T_4; // @[Mux.scala 81:58]
  wire  _instValid_T_8 = 3'h3 == io_r_op ? _instValid_T : _instValid_T_6; // @[Mux.scala 81:58]
  wire  _instValid_T_10 = 3'h4 == io_r_op ? _instValid_T : _instValid_T_8; // @[Mux.scala 81:58]
  wire  _instValid_T_12 = 3'h5 == io_r_op ? _instValid_T : _instValid_T_10; // @[Mux.scala 81:58]
  wire  _instValid_T_13 = ~io_fd_enable; // @[csr.scala 237:16]
  wire  instValid = _instValid_T_12 | ~io_fd_enable; // @[csr.scala 237:12]
  wire  modeValid = (io_r_addr[9:8] <= mode | io_r_op == 3'h0) & io_inst_mode <= mode | _instValid_T_13; // @[csr.scala 241:103]
  wire  valid = instValid & modeValid; // @[csr.scala 242:31]
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
  wire  writeEn = (io_w_op == 3'h2 | io_w_op == 3'h3 | io_w_op == 3'h5 | io_w_op == 3'h4) & io_mw_enable; // @[csr.scala 247:93]
  wire [63:0] _writeData_T = csrData | io_w_data; // @[csr.scala 251:37]
  wire [63:0] _writeData_T_1 = ~io_w_data; // @[csr.scala 252:39]
  wire [63:0] _writeData_T_2 = csrData & _writeData_T_1; // @[csr.scala 252:37]
  wire [63:0] _writeData_T_4 = 3'h2 == io_w_op ? io_w_data : 64'h0; // @[Mux.scala 81:58]
  wire [63:0] _writeData_T_6 = 3'h3 == io_w_op ? io_w_data : _writeData_T_4; // @[Mux.scala 81:58]
  wire [63:0] _writeData_T_8 = 3'h4 == io_w_op ? _writeData_T : _writeData_T_6; // @[Mux.scala 81:58]
  wire [63:0] writeData = 3'h5 == io_w_op ? _writeData_T_2 : _writeData_T_8; // @[Mux.scala 81:58]
  wire [63:0] flagIntS = _T_4 & _T_1; // @[csr.scala 257:35]
  wire [63:0] flagIntM = _sip_T & _sie_T; // @[csr.scala 258:35]
  wire [63:0] _hasIntS_T_4 = flagIntS & mideleg_data; // @[csr.scala 267:97]
  wire  hasIntS = (mode < 2'h1 | mode == 2'h1 & mstatus_sie) & |_hasIntS_T_4; // @[csr.scala 267:27]
  wire [63:0] _hasIntM_T_2 = ~mideleg_data; // @[csr.scala 268:79]
  wire [63:0] _hasIntM_T_3 = flagIntS & _hasIntM_T_2; // @[csr.scala 268:77]
  wire  hasIntM = (mode <= 2'h1 | mstatus_mie) & |_hasIntM_T_3; // @[csr.scala 268:31]
  wire  hasInt = hasIntM | hasIntS; // @[csr.scala 269:30]
  wire  handIntS = hasInt & ~hasIntM; // @[csr.scala 271:31]
  wire  _hasExc_T_1 = ~valid; // @[csr.scala 281:40]
  wire  _hasExc_T_5 = ~valid | (|io_illegal_inst | io_fetch_misalign) & io_fd_enable; // @[csr.scala 281:48]
  wire  _hasExc_T_8 = _hasExc_T_5 | (io_load_misalign | io_store_misalign) & io_de_enable; // @[csr.scala 282:57]
  wire  _hasExc_T_10 = 32'h73 == io_inst; // @[csr.scala 283:70]
  wire  _hasExc_T_12 = 32'h100073 == io_inst; // @[csr.scala 283:104]
  wire  _hasExc_T_15 = _hasExc_T_8 | (32'h73 == io_inst | 32'h100073 == io_inst) & io_em_enable; // @[csr.scala 283:57]
  wire  hasExc = ~hasInt & _hasExc_T_15; // @[csr.scala 281:35]
  wire [62:0] _excCause_T_7 = _hasExc_T_1 | io_illegal_inst != 32'h0 ? 63'h2 : {{62'd0}, io_fetch_misalign}; // @[csr.scala 290:76]
  wire [62:0] _excCause_T_8 = io_store_misalign ? 63'h6 : _excCause_T_7; // @[csr.scala 289:68]
  wire [62:0] _excCause_T_9 = io_load_misalign ? 63'h4 : _excCause_T_8; // @[csr.scala 288:60]
  wire [62:0] _excCause_T_10 = _hasExc_T_12 ? 63'h3 : _excCause_T_9; // @[csr.scala 287:52]
  wire [62:0] excCause = _hasExc_T_10 ? 63'h8 : _excCause_T_10; // @[csr.scala 286:28]
  wire [63:0] _hasExcS_T_1 = medeleg_data >> excCause[4:0]; // @[csr.scala 296:47]
  wire  hasExcS = hasExc & _hasExcS_T_1[0]; // @[csr.scala 296:30]
  wire  handExcS = ~mode[1] & hasExcS; // @[csr.scala 297:33]
  wire [63:0] _intCauseS_T = {{9'd0}, flagIntS[63:9]}; // @[csr.scala 304:37]
  wire [63:0] _intCauseS_T_2 = {{1'd0}, flagIntS[63:1]}; // @[csr.scala 305:61]
  wire [62:0] _intCauseS_T_4 = _intCauseS_T_2[0] ? 63'h1 : 63'h5; // @[csr.scala 305:52]
  wire [62:0] intCauseS = _intCauseS_T[0] ? 63'h9 : _intCauseS_T_4; // @[csr.scala 304:28]
  wire [63:0] _intCause_T = {{11'd0}, flagIntM[63:11]}; // @[csr.scala 308:36]
  wire [63:0] _intCause_T_2 = {{3'd0}, flagIntM[63:3]}; // @[csr.scala 309:61]
  wire [63:0] _intCause_T_4 = {{7'd0}, flagIntM[63:7]}; // @[csr.scala 310:69]
  wire [62:0] _intCause_T_6 = _intCause_T_4[0] ? 63'h7 : intCauseS; // @[csr.scala 310:60]
  wire [62:0] _intCause_T_7 = _intCause_T_2[0] ? 63'h3 : _intCause_T_6; // @[csr.scala 309:52]
  wire [62:0] intCause = _intCause_T[0] ? 63'hb : _intCause_T_7; // @[csr.scala 308:27]
  wire [63:0] _cause_T = {1'h1,intCause}; // @[Cat.scala 31:58]
  wire [63:0] _cause_T_1 = {1'h0,excCause}; // @[Cat.scala 31:58]
  wire [63:0] cause = hasInt ? _cause_T : _cause_T_1; // @[csr.scala 315:24]
  wire  _io_flush_mask_T_1 = excCause == 63'h3; // @[csr.scala 322:78]
  wire  _io_flush_mask_T_3 = excCause == 63'h4; // @[csr.scala 323:39]
  wire  _io_flush_mask_T_4 = excCause == 63'h6; // @[csr.scala 323:71]
  wire  _io_flush_mask_T_6 = excCause == 63'h2; // @[csr.scala 324:46]
  wire  _io_flush_mask_T_7 = excCause == 63'h0; // @[csr.scala 325:54]
  wire [1:0] _io_flush_mask_T_8 = excCause == 63'h0 ? 2'h3 : 2'h0; // @[csr.scala 325:44]
  wire [1:0] _io_flush_mask_T_9 = excCause == 63'h2 ? 2'h3 : _io_flush_mask_T_8; // @[csr.scala 324:36]
  wire [2:0] _io_flush_mask_T_10 = excCause == 63'h4 | excCause == 63'h6 ? 3'h7 : {{1'd0}, _io_flush_mask_T_9}; // @[csr.scala 323:28]
  wire [3:0] _io_flush_mask_T_11 = excCause == 63'h8 | excCause == 63'h3 ? 4'hf : {{1'd0}, _io_flush_mask_T_10}; // @[csr.scala 322:37]
  wire [3:0] _GEN_0 = hasExc ? _io_flush_mask_T_11 : 4'h0; // @[csr.scala 321:27 322:31 330:31]
  wire [31:0] _io_excValue_T_5 = _io_flush_mask_T_6 ? io_illegal_inst : 32'h0; // @[csr.scala 337:76]
  wire [63:0] _io_excValue_T_6 = _io_flush_mask_T_7 ? io_pc_fetch_misalign : {{32'd0}, _io_excValue_T_5}; // @[csr.scala 336:68]
  wire [63:0] _io_excValue_T_7 = _io_flush_mask_T_1 ? io_ebreak_addr : _io_excValue_T_6; // @[csr.scala 335:60]
  wire [63:0] _io_excValue_T_8 = _io_flush_mask_T_4 ? io_store_misalign_addr : _io_excValue_T_7; // @[csr.scala 334:52]
  wire [61:0] _GEN_149 = {{32'd0}, cause[29:0]}; // @[csr.scala 344:65]
  wire [61:0] _trapVecS_T_4 = stvec_base + _GEN_149; // @[csr.scala 344:65]
  wire [61:0] _trapVecS_T_5 = stvec_mode[0] & hasInt ? _trapVecS_T_4 : stvec_base; // @[csr.scala 344:27]
  wire [63:0] trapVecS = {_trapVecS_T_5, 2'h0}; // @[csr.scala 344:94]
  wire [61:0] _trapVecM_T_4 = mtvec_base + _GEN_149; // @[csr.scala 345:65]
  wire [61:0] _trapVecM_T_5 = mtvec_mode[0] & hasInt ? _trapVecM_T_4 : mtvec_base; // @[csr.scala 345:27]
  wire [63:0] trapVecM = {_trapVecM_T_5, 2'h0}; // @[csr.scala 345:94]
  wire  _trapVec_T = handIntS | handExcS; // @[csr.scala 346:36]
  wire [1:0] sretMode = {1'h0,sstatus_spp}; // @[Cat.scala 31:58]
  wire [1:0] excMode = handExcS ? 2'h1 : 2'h3; // @[csr.scala 357:26]
  wire [1:0] _trapMode_T = io_isMret ? mstatus_mpp : excMode; // @[csr.scala 360:44]
  wire [63:0] _mcycle_data_T_1 = mcycle_data + 64'h1; // @[csr.scala 377:36]
  wire [63:0] _minstret_data_T_1 = minstret_data + 64'h1; // @[csr.scala 379:48]
  wire [63:0] _GEN_2 = io_retired ? _minstret_data_T_1 : minstret_data; // @[csr.scala 378:25 175:30 379:31]
  wire  _T_164 = ~io_stall; // @[csr.scala 384:25]
  wire  tmp_1_sum = writeData[18]; // @[csrFile.scala 96:29]
  wire  tmp_1_spp = writeData[8]; // @[csrFile.scala 97:33]
  wire  tmp_1_spie = writeData[5]; // @[csrFile.scala 98:29]
  wire  tmp_1_sie = writeData[1]; // @[csrFile.scala 99:29]
  wire [12:0] lo_8 = {4'h0,tmp_1_spp,2'h0,tmp_1_spie,3'h0,tmp_1_sie,1'h0}; // @[csrFile.scala 37:29]
  wire [63:0] _T_167 = {45'h0,tmp_1_sum,1'h0,4'h0,lo_8}; // @[csrFile.scala 37:29]
  wire  tmp_2_seie = writeData[9]; // @[csrFile.scala 63:29]
  wire [63:0] _T_169 = {54'h0,tmp_2_seie,3'h0,tmp_1_spie,3'h0,tmp_1_sie,1'h0}; // @[csrFile.scala 37:29]
  wire [63:0] _T_171 = {59'h0,3'h0,tmp_1_sie,1'h0}; // @[csrFile.scala 37:29]
  wire  _GEN_18 = io_w_addr == 12'h144 & _T_171[5]; // @[csr.scala 387:44 csrFile.scala 345:11 csr.scala 368:18]
  wire [63:0] _sepc_data_T_1 = {writeData[63:2],2'h0}; // @[Cat.scala 31:58]
  wire [15:0] _medeleg_data_T_5 = {3'h0,writeData[12],2'h0,writeData[9:8],1'h0,writeData[6],1'h0,writeData[4:2],1'h0,
    writeData[0]}; // @[Cat.scala 31:58]
  wire [5:0] mideleg_data_lo = {tmp_1_spie,1'h0,writeData[3],1'h0,tmp_1_sie,1'h0}; // @[Cat.scala 31:58]
  wire [22:0] _mideleg_data_T_6 = {1'h0,writeData[11],11'h0,tmp_2_seie,1'h0,writeData[7],1'h0,mideleg_data_lo}; // @[Cat.scala 31:58]
  wire  _T_188 = hasExc | hasInt; // @[csr.scala 406:28]
  wire  _T_190 = (io_isSret | io_isMret) & io_mw_enable; // @[csr.scala 406:67]
  wire [63:0] _T_196 = io_excPC + 64'h4; // @[csr.scala 416:78]
  wire [63:0] _T_197 = io_jump_taken ? io_jump_addr : _T_196; // @[csr.scala 416:39]
  wire [63:0] _sepc_data_T_3 = {_T_197[63:2],2'h0}; // @[Cat.scala 31:58]
  wire [63:0] _mepc_data_T_3 = {io_excPC[63:2],2'h0}; // @[Cat.scala 31:58]
  wire [63:0] _GEN_52 = _trapVec_T ? _sepc_data_T_3 : sepc_data; // @[csr.scala 415:49 csrFile.scala 154:22 csr.scala 181:34]
  wire  _GEN_53 = _trapVec_T ? cause[63] : scause_int; // @[csr.scala 415:49 csrFile.scala 169:11 csr.scala 182:34]
  wire [62:0] _GEN_54 = _trapVec_T ? {{59'd0}, cause[3:0]} : scause_code; // @[csr.scala 415:49 csrFile.scala 170:11 csr.scala 182:34]
  wire [63:0] _GEN_55 = _trapVec_T ? io_excValue : stval_data; // @[csr.scala 415:49 csrFile.scala 30:22 csr.scala 183:34]
  wire  _GEN_56 = _trapVec_T ? mstatus_sie : mstatus_spie; // @[csr.scala 162:30 415:49 419:38]
  wire  _GEN_57 = _trapVec_T ? 1'h0 : mstatus_sie; // @[csr.scala 162:30 415:49 420:37]
  wire  _GEN_58 = _trapVec_T ? mode[0] : mstatus_spp; // @[csr.scala 162:30 415:49 421:37]
  wire [63:0] _GEN_59 = _trapVec_T ? mepc_data : _mepc_data_T_3; // @[csr.scala 169:34 415:49 csrFile.scala 386:11]
  wire  _GEN_60 = _trapVec_T ? mcause_int : cause[63]; // @[csr.scala 170:34 415:49 csrFile.scala 401:11]
  wire [62:0] _GEN_61 = _trapVec_T ? mcause_code : {{59'd0}, cause[3:0]}; // @[csr.scala 170:34 415:49 csrFile.scala 402:11]
  wire [63:0] _GEN_62 = _trapVec_T ? mtval_data : io_excValue; // @[csr.scala 171:34 415:49 csrFile.scala 30:22]
  wire  _GEN_63 = _trapVec_T ? mstatus_mpie : mstatus_mie; // @[csr.scala 162:30 415:49 426:38]
  wire  _GEN_64 = _trapVec_T & mstatus_mie; // @[csr.scala 162:30 415:49 427:37]
  wire [1:0] _GEN_65 = _trapVec_T ? mstatus_mpp : mode; // @[csr.scala 162:30 415:49 428:37]
  wire  _GEN_66 = io_isMret ? mstatus_mpie : _GEN_64; // @[csr.scala 411:38 412:37]
  wire  _GEN_67 = io_isMret | _GEN_63; // @[csr.scala 411:38 413:38]
  wire [1:0] _GEN_68 = io_isMret ? 2'h0 : _GEN_65; // @[csr.scala 411:38 414:37]
  wire [63:0] _GEN_69 = io_isMret ? sepc_data : _GEN_52; // @[csr.scala 181:34 411:38]
  wire  _GEN_70 = io_isMret ? scause_int : _GEN_53; // @[csr.scala 182:34 411:38]
  wire [62:0] _GEN_71 = io_isMret ? scause_code : _GEN_54; // @[csr.scala 182:34 411:38]
  wire [63:0] _GEN_72 = io_isMret ? stval_data : _GEN_55; // @[csr.scala 183:34 411:38]
  wire  _GEN_73 = io_isMret ? mstatus_spie : _GEN_56; // @[csr.scala 162:30 411:38]
  wire  _GEN_74 = io_isMret ? mstatus_sie : _GEN_57; // @[csr.scala 162:30 411:38]
  wire  _GEN_75 = io_isMret ? mstatus_spp : _GEN_58; // @[csr.scala 162:30 411:38]
  wire [63:0] _GEN_76 = io_isMret ? mepc_data : _GEN_59; // @[csr.scala 169:34 411:38]
  wire  _GEN_77 = io_isMret ? mcause_int : _GEN_60; // @[csr.scala 170:34 411:38]
  wire [62:0] _GEN_78 = io_isMret ? mcause_code : _GEN_61; // @[csr.scala 170:34 411:38]
  wire [63:0] _GEN_79 = io_isMret ? mtval_data : _GEN_62; // @[csr.scala 171:34 411:38]
  wire  _GEN_81 = io_isSret | _GEN_73; // @[csr.scala 407:32 409:38]
  wire  _GEN_123 = writeEn & ~io_stall & _GEN_18; // @[csr.scala 368:18 384:35]
  assign io_flush_mask = hasInt | (io_isMret | io_isSret) & io_em_enable ? 4'h7 : _GEN_0; // @[csr.scala 319:67 320:31]
  assign io_r_data = _T_13 ? mcycle_data : _T_100; // @[Lookup.scala 34:39]
  assign io_excValue = _io_flush_mask_T_3 ? io_load_misalign_addr : _io_excValue_T_8; // @[csr.scala 333:27]
  assign io_trapVec = handIntS | handExcS ? trapVecS : trapVecM; // @[csr.scala 346:26]
  assign io_trap = _T_188 | _T_190; // @[csr.scala 440:37]
  always @(posedge clock) begin
    if (reset) begin // @[csr.scala 157:27]
      mode <= 2'h3; // @[csr.scala 157:27]
    end else if ((hasInt | hasExc) & ~writeEn) begin // @[csr.scala 361:27]
      if (hasInt) begin // @[csr.scala 358:27]
        if (handIntS) begin // @[csr.scala 354:26]
          mode <= 2'h1;
        end else begin
          mode <= 2'h3;
        end
      end else if (io_isSret) begin // @[csr.scala 359:44]
        mode <= sretMode;
      end else begin
        mode <= _trapMode_T;
      end
    end
    if (reset) begin // @[csr.scala 162:30]
      mstatus_sum <= 1'h0; // @[csr.scala 162:30]
    end else if (writeEn & ~io_stall) begin // @[csr.scala 384:35]
      if (io_w_addr == 12'h300) begin // @[csr.scala 396:48]
        mstatus_sum <= tmp_1_sum; // @[csrFile.scala 235:11]
      end else if (io_w_addr == 12'h100) begin // @[csr.scala 385:48]
        mstatus_sum <= _T_167[18]; // @[csrFile.scala 235:11]
      end
    end
    if (reset) begin // @[csr.scala 162:30]
      mstatus_mpp <= 2'h0; // @[csr.scala 162:30]
    end else if (writeEn & ~io_stall) begin // @[csr.scala 384:35]
      if (io_w_addr == 12'h300) begin // @[csr.scala 396:48]
        mstatus_mpp <= writeData[12:11]; // @[csrFile.scala 236:11]
      end else if (io_w_addr == 12'h100) begin // @[csr.scala 385:48]
        mstatus_mpp <= _T_167[12:11]; // @[csrFile.scala 236:11]
      end
    end else if ((hasExc | hasInt | (io_isSret | io_isMret) & io_mw_enable) & _T_164) begin // @[csr.scala 406:98]
      if (!(io_isSret)) begin // @[csr.scala 407:32]
        mstatus_mpp <= _GEN_68;
      end
    end
    if (reset) begin // @[csr.scala 162:30]
      mstatus_spp <= 1'h0; // @[csr.scala 162:30]
    end else if (writeEn & ~io_stall) begin // @[csr.scala 384:35]
      if (io_w_addr == 12'h300) begin // @[csr.scala 396:48]
        mstatus_spp <= tmp_1_spp; // @[csrFile.scala 237:11]
      end else if (io_w_addr == 12'h100) begin // @[csr.scala 385:48]
        mstatus_spp <= _T_167[8]; // @[csrFile.scala 237:11]
      end
    end else if ((hasExc | hasInt | (io_isSret | io_isMret) & io_mw_enable) & _T_164) begin // @[csr.scala 406:98]
      if (io_isSret) begin // @[csr.scala 407:32]
        mstatus_spp <= 1'h0; // @[csr.scala 410:41]
      end else begin
        mstatus_spp <= _GEN_75;
      end
    end
    if (reset) begin // @[csr.scala 162:30]
      mstatus_mpie <= 1'h0; // @[csr.scala 162:30]
    end else if (writeEn & ~io_stall) begin // @[csr.scala 384:35]
      if (io_w_addr == 12'h300) begin // @[csr.scala 396:48]
        mstatus_mpie <= writeData[7]; // @[csrFile.scala 238:11]
      end else if (io_w_addr == 12'h100) begin // @[csr.scala 385:48]
        mstatus_mpie <= _T_167[7]; // @[csrFile.scala 238:11]
      end
    end else if ((hasExc | hasInt | (io_isSret | io_isMret) & io_mw_enable) & _T_164) begin // @[csr.scala 406:98]
      if (!(io_isSret)) begin // @[csr.scala 407:32]
        mstatus_mpie <= _GEN_67;
      end
    end
    if (reset) begin // @[csr.scala 162:30]
      mstatus_spie <= 1'h0; // @[csr.scala 162:30]
    end else if (writeEn & ~io_stall) begin // @[csr.scala 384:35]
      if (io_w_addr == 12'h300) begin // @[csr.scala 396:48]
        mstatus_spie <= tmp_1_spie; // @[csrFile.scala 239:11]
      end else if (io_w_addr == 12'h100) begin // @[csr.scala 385:48]
        mstatus_spie <= _T_167[5]; // @[csrFile.scala 239:11]
      end
    end else if ((hasExc | hasInt | (io_isSret | io_isMret) & io_mw_enable) & _T_164) begin // @[csr.scala 406:98]
      mstatus_spie <= _GEN_81;
    end
    if (reset) begin // @[csr.scala 162:30]
      mstatus_mie <= 1'h0; // @[csr.scala 162:30]
    end else if (writeEn & ~io_stall) begin // @[csr.scala 384:35]
      if (io_w_addr == 12'h300) begin // @[csr.scala 396:48]
        mstatus_mie <= writeData[3]; // @[csrFile.scala 240:11]
      end else if (io_w_addr == 12'h100) begin // @[csr.scala 385:48]
        mstatus_mie <= _T_167[3]; // @[csrFile.scala 240:11]
      end
    end else if ((hasExc | hasInt | (io_isSret | io_isMret) & io_mw_enable) & _T_164) begin // @[csr.scala 406:98]
      if (!(io_isSret)) begin // @[csr.scala 407:32]
        mstatus_mie <= _GEN_66;
      end
    end
    if (reset) begin // @[csr.scala 162:30]
      mstatus_sie <= 1'h0; // @[csr.scala 162:30]
    end else if (writeEn & ~io_stall) begin // @[csr.scala 384:35]
      if (io_w_addr == 12'h300) begin // @[csr.scala 396:48]
        mstatus_sie <= tmp_1_sie; // @[csrFile.scala 241:11]
      end else if (io_w_addr == 12'h100) begin // @[csr.scala 385:48]
        mstatus_sie <= _T_167[1]; // @[csrFile.scala 241:11]
      end
    end else if ((hasExc | hasInt | (io_isSret | io_isMret) & io_mw_enable) & _T_164) begin // @[csr.scala 406:98]
      if (io_isSret) begin // @[csr.scala 407:32]
        mstatus_sie <= mstatus_spie; // @[csr.scala 408:37]
      end else begin
        mstatus_sie <= _GEN_74;
      end
    end
    if (reset) begin // @[csr.scala 164:30]
      medeleg_data <= 64'h0; // @[csr.scala 164:30]
    end else if (writeEn & ~io_stall) begin // @[csr.scala 384:35]
      if (io_w_addr == 12'h302) begin // @[csr.scala 397:48]
        medeleg_data <= {{48'd0}, _medeleg_data_T_5}; // @[csrFile.scala 270:11]
      end
    end
    if (reset) begin // @[csr.scala 165:30]
      mideleg_data <= 64'h0; // @[csr.scala 165:30]
    end else if (writeEn & ~io_stall) begin // @[csr.scala 384:35]
      if (io_w_addr == 12'h303) begin // @[csr.scala 398:48]
        mideleg_data <= {{41'd0}, _mideleg_data_T_6}; // @[csrFile.scala 285:11]
      end
    end
    if (reset) begin // @[csr.scala 166:34]
      mie_meie <= 1'h0; // @[csr.scala 166:34]
    end else if (writeEn & ~io_stall) begin // @[csr.scala 384:35]
      if (io_w_addr == 12'h304) begin // @[csr.scala 399:44]
        mie_meie <= writeData[11]; // @[csrFile.scala 311:11]
      end else if (io_w_addr == 12'h104) begin // @[csr.scala 386:44]
        mie_meie <= _T_169[11]; // @[csrFile.scala 311:11]
      end
    end
    if (reset) begin // @[csr.scala 166:34]
      mie_seie <= 1'h0; // @[csr.scala 166:34]
    end else if (writeEn & ~io_stall) begin // @[csr.scala 384:35]
      if (io_w_addr == 12'h304) begin // @[csr.scala 399:44]
        mie_seie <= tmp_2_seie; // @[csrFile.scala 312:11]
      end else if (io_w_addr == 12'h104) begin // @[csr.scala 386:44]
        mie_seie <= _T_169[9]; // @[csrFile.scala 312:11]
      end
    end
    if (reset) begin // @[csr.scala 166:34]
      mie_mtie <= 1'h0; // @[csr.scala 166:34]
    end else if (writeEn & ~io_stall) begin // @[csr.scala 384:35]
      if (io_w_addr == 12'h304) begin // @[csr.scala 399:44]
        mie_mtie <= writeData[7]; // @[csrFile.scala 313:11]
      end else if (io_w_addr == 12'h104) begin // @[csr.scala 386:44]
        mie_mtie <= _T_169[7]; // @[csrFile.scala 313:11]
      end
    end
    if (reset) begin // @[csr.scala 166:34]
      mie_stie <= 1'h0; // @[csr.scala 166:34]
    end else if (writeEn & ~io_stall) begin // @[csr.scala 384:35]
      if (io_w_addr == 12'h304) begin // @[csr.scala 399:44]
        mie_stie <= tmp_1_spie; // @[csrFile.scala 314:11]
      end else if (io_w_addr == 12'h104) begin // @[csr.scala 386:44]
        mie_stie <= _T_169[5]; // @[csrFile.scala 314:11]
      end
    end
    if (reset) begin // @[csr.scala 166:34]
      mie_msie <= 1'h0; // @[csr.scala 166:34]
    end else if (writeEn & ~io_stall) begin // @[csr.scala 384:35]
      if (io_w_addr == 12'h304) begin // @[csr.scala 399:44]
        mie_msie <= writeData[3]; // @[csrFile.scala 315:11]
      end else if (io_w_addr == 12'h104) begin // @[csr.scala 386:44]
        mie_msie <= _T_169[3]; // @[csrFile.scala 315:11]
      end
    end
    if (reset) begin // @[csr.scala 166:34]
      mie_ssie <= 1'h0; // @[csr.scala 166:34]
    end else if (writeEn & ~io_stall) begin // @[csr.scala 384:35]
      if (io_w_addr == 12'h304) begin // @[csr.scala 399:44]
        mie_ssie <= tmp_1_sie; // @[csrFile.scala 316:11]
      end else if (io_w_addr == 12'h104) begin // @[csr.scala 386:44]
        mie_ssie <= _T_169[1]; // @[csrFile.scala 316:11]
      end
    end
    if (reset) begin // @[csr.scala 167:34]
      mtvec_base <= 62'h0; // @[csr.scala 167:34]
    end else if (writeEn & ~io_stall) begin // @[csr.scala 384:35]
      if (io_w_addr == 12'h305) begin // @[csr.scala 400:46]
        mtvec_base <= writeData[63:2]; // @[csrFile.scala 362:11]
      end
    end
    if (reset) begin // @[csr.scala 167:34]
      mtvec_mode <= 2'h0; // @[csr.scala 167:34]
    end else if (writeEn & ~io_stall) begin // @[csr.scala 384:35]
      if (io_w_addr == 12'h305) begin // @[csr.scala 400:46]
        mtvec_mode <= {{1'd0}, writeData[0]}; // @[csrFile.scala 363:11]
      end
    end
    if (reset) begin // @[csr.scala 168:30]
      mscratch_data <= 64'h0; // @[csr.scala 168:30]
    end else if (writeEn & ~io_stall) begin // @[csr.scala 384:35]
      if (io_w_addr == 12'h340) begin // @[csr.scala 401:49]
        if (3'h5 == io_w_op) begin // @[Mux.scala 81:58]
          mscratch_data <= _writeData_T_2;
        end else begin
          mscratch_data <= _writeData_T_8;
        end
      end
    end
    if (reset) begin // @[csr.scala 169:34]
      mepc_data <= 64'h0; // @[csr.scala 169:34]
    end else if (writeEn & ~io_stall) begin // @[csr.scala 384:35]
      if (io_w_addr == 12'h341) begin // @[csr.scala 402:45]
        mepc_data <= _sepc_data_T_1; // @[csrFile.scala 386:11]
      end
    end else if ((hasExc | hasInt | (io_isSret | io_isMret) & io_mw_enable) & _T_164) begin // @[csr.scala 406:98]
      if (!(io_isSret)) begin // @[csr.scala 407:32]
        mepc_data <= _GEN_76;
      end
    end
    if (reset) begin // @[csr.scala 170:34]
      mcause_int <= 1'h0; // @[csr.scala 170:34]
    end else if (writeEn & ~io_stall) begin // @[csr.scala 384:35]
      if (io_w_addr == 12'h342) begin // @[csr.scala 403:47]
        mcause_int <= writeData[63]; // @[csrFile.scala 401:11]
      end
    end else if ((hasExc | hasInt | (io_isSret | io_isMret) & io_mw_enable) & _T_164) begin // @[csr.scala 406:98]
      if (!(io_isSret)) begin // @[csr.scala 407:32]
        mcause_int <= _GEN_77;
      end
    end
    if (reset) begin // @[csr.scala 170:34]
      mcause_code <= 63'h0; // @[csr.scala 170:34]
    end else if (writeEn & ~io_stall) begin // @[csr.scala 384:35]
      if (io_w_addr == 12'h342) begin // @[csr.scala 403:47]
        mcause_code <= {{59'd0}, writeData[3:0]}; // @[csrFile.scala 402:11]
      end
    end else if ((hasExc | hasInt | (io_isSret | io_isMret) & io_mw_enable) & _T_164) begin // @[csr.scala 406:98]
      if (!(io_isSret)) begin // @[csr.scala 407:32]
        mcause_code <= _GEN_78;
      end
    end
    if (reset) begin // @[csr.scala 171:34]
      mtval_data <= 64'h0; // @[csr.scala 171:34]
    end else if (writeEn & ~io_stall) begin // @[csr.scala 384:35]
      if (io_w_addr == 12'h343) begin // @[csr.scala 404:46]
        if (3'h5 == io_w_op) begin // @[Mux.scala 81:58]
          mtval_data <= _writeData_T_2;
        end else begin
          mtval_data <= _writeData_T_8;
        end
      end
    end else if ((hasExc | hasInt | (io_isSret | io_isMret) & io_mw_enable) & _T_164) begin // @[csr.scala 406:98]
      if (!(io_isSret)) begin // @[csr.scala 407:32]
        mtval_data <= _GEN_79;
      end
    end
    if (reset) begin // @[csr.scala 172:34]
      mip_meip <= 1'h0; // @[csr.scala 172:34]
    end else if (writeEn & ~io_stall) begin // @[csr.scala 384:35]
      if (io_w_addr == 12'h144) begin // @[csr.scala 387:44]
        mip_meip <= _T_171[7]; // @[csrFile.scala 344:15]
      end
    end
    if (reset) begin // @[csr.scala 172:34]
      mip_seip <= 1'h0; // @[csr.scala 172:34]
    end else if (writeEn & ~io_stall) begin // @[csr.scala 384:35]
      if (io_w_addr == 12'h144) begin // @[csr.scala 387:44]
        mip_seip <= _T_171[9]; // @[csrFile.scala 343:11]
      end
    end
    if (reset) begin // @[csr.scala 172:34]
      mip_stip <= 1'h0; // @[csr.scala 172:34]
    end else begin
      mip_stip <= _GEN_123;
    end
    if (reset) begin // @[csr.scala 172:34]
      mip_msip <= 1'h0; // @[csr.scala 172:34]
    end else if (writeEn & ~io_stall) begin // @[csr.scala 384:35]
      if (io_w_addr == 12'h144) begin // @[csr.scala 387:44]
        mip_msip <= _T_171[3]; // @[csrFile.scala 346:15]
      end
    end
    if (reset) begin // @[csr.scala 172:34]
      mip_ssip <= 1'h0; // @[csr.scala 172:34]
    end else if (writeEn & ~io_stall) begin // @[csr.scala 384:35]
      if (io_w_addr == 12'h144) begin // @[csr.scala 387:44]
        mip_ssip <= _T_171[1]; // @[csrFile.scala 347:11]
      end
    end
    if (reset) begin // @[csr.scala 174:34]
      mcycle_data <= 64'h0; // @[csr.scala 174:34]
    end else if (writeEn & ~io_stall) begin // @[csr.scala 384:35]
      if (io_w_addr == 12'hb00) begin // @[csr.scala 388:47]
        if (3'h5 == io_w_op) begin // @[Mux.scala 81:58]
          mcycle_data <= _writeData_T_2;
        end else begin
          mcycle_data <= _writeData_T_8;
        end
      end else begin
        mcycle_data <= _mcycle_data_T_1; // @[csr.scala 377:21]
      end
    end else begin
      mcycle_data <= _mcycle_data_T_1; // @[csr.scala 377:21]
    end
    if (reset) begin // @[csr.scala 175:30]
      minstret_data <= 64'h0; // @[csr.scala 175:30]
    end else if (writeEn & ~io_stall) begin // @[csr.scala 384:35]
      if (io_w_addr == 12'hb02) begin // @[csr.scala 389:49]
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
    if (reset) begin // @[csr.scala 179:34]
      stvec_base <= 62'h0; // @[csr.scala 179:34]
    end else if (writeEn & ~io_stall) begin // @[csr.scala 384:35]
      if (io_w_addr == 12'h105) begin // @[csr.scala 390:46]
        stvec_base <= writeData[63:2]; // @[csrFile.scala 133:22]
      end
    end
    if (reset) begin // @[csr.scala 179:34]
      stvec_mode <= 2'h0; // @[csr.scala 179:34]
    end else if (writeEn & ~io_stall) begin // @[csr.scala 384:35]
      if (io_w_addr == 12'h105) begin // @[csr.scala 390:46]
        stvec_mode <= {{1'd0}, writeData[0]}; // @[csrFile.scala 134:22]
      end
    end
    if (reset) begin // @[csr.scala 180:30]
      sscratch_data <= 64'h0; // @[csr.scala 180:30]
    end else if (writeEn & ~io_stall) begin // @[csr.scala 384:35]
      if (io_w_addr == 12'h140) begin // @[csr.scala 391:49]
        if (3'h5 == io_w_op) begin // @[Mux.scala 81:58]
          sscratch_data <= _writeData_T_2;
        end else begin
          sscratch_data <= _writeData_T_8;
        end
      end
    end
    if (reset) begin // @[csr.scala 181:34]
      sepc_data <= 64'h0; // @[csr.scala 181:34]
    end else if (writeEn & ~io_stall) begin // @[csr.scala 384:35]
      if (io_w_addr == 12'h141) begin // @[csr.scala 392:45]
        sepc_data <= _sepc_data_T_1; // @[csrFile.scala 154:22]
      end
    end else if ((hasExc | hasInt | (io_isSret | io_isMret) & io_mw_enable) & _T_164) begin // @[csr.scala 406:98]
      if (!(io_isSret)) begin // @[csr.scala 407:32]
        sepc_data <= _GEN_69;
      end
    end
    if (reset) begin // @[csr.scala 182:34]
      scause_int <= 1'h0; // @[csr.scala 182:34]
    end else if (writeEn & ~io_stall) begin // @[csr.scala 384:35]
      if (io_w_addr == 12'h142) begin // @[csr.scala 393:47]
        scause_int <= writeData[63]; // @[csrFile.scala 169:11]
      end
    end else if ((hasExc | hasInt | (io_isSret | io_isMret) & io_mw_enable) & _T_164) begin // @[csr.scala 406:98]
      if (!(io_isSret)) begin // @[csr.scala 407:32]
        scause_int <= _GEN_70;
      end
    end
    if (reset) begin // @[csr.scala 182:34]
      scause_code <= 63'h0; // @[csr.scala 182:34]
    end else if (writeEn & ~io_stall) begin // @[csr.scala 384:35]
      if (io_w_addr == 12'h142) begin // @[csr.scala 393:47]
        scause_code <= {{59'd0}, writeData[3:0]}; // @[csrFile.scala 170:11]
      end
    end else if ((hasExc | hasInt | (io_isSret | io_isMret) & io_mw_enable) & _T_164) begin // @[csr.scala 406:98]
      if (!(io_isSret)) begin // @[csr.scala 407:32]
        scause_code <= _GEN_71;
      end
    end
    if (reset) begin // @[csr.scala 183:34]
      stval_data <= 64'h0; // @[csr.scala 183:34]
    end else if (writeEn & ~io_stall) begin // @[csr.scala 384:35]
      if (io_w_addr == 12'h143) begin // @[csr.scala 394:46]
        if (3'h5 == io_w_op) begin // @[Mux.scala 81:58]
          stval_data <= _writeData_T_2;
        end else begin
          stval_data <= _writeData_T_8;
        end
      end
    end else if ((hasExc | hasInt | (io_isSret | io_isMret) & io_mw_enable) & _T_164) begin // @[csr.scala 406:98]
      if (!(io_isSret)) begin // @[csr.scala 407:32]
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
  output        io_start,
  output        io_stall,
  output [31:0] io_icache_cpu_request_addr,
  input  [63:0] io_icache_cpu_response_data,
  input         io_icache_cpu_response_ready,
  output [31:0] io_dcache_cpu_request_addr,
  output [63:0] io_dcache_cpu_request_data,
  output [7:0]  io_dcache_cpu_request_mask,
  output        io_dcache_cpu_request_rw,
  output        io_dcache_cpu_request_valid,
  input  [63:0] io_dcache_cpu_response_data,
  input         io_dcache_cpu_response_ready
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
  reg [63:0] _RAND_31;
  reg [31:0] _RAND_32;
  reg [63:0] _RAND_33;
  reg [31:0] _RAND_34;
  reg [31:0] _RAND_35;
  reg [31:0] _RAND_36;
  reg [31:0] _RAND_37;
  reg [31:0] _RAND_38;
  reg [63:0] _RAND_39;
  reg [31:0] _RAND_40;
  reg [31:0] _RAND_41;
  reg [63:0] _RAND_42;
  reg [63:0] _RAND_43;
  reg [31:0] _RAND_44;
  reg [63:0] _RAND_45;
  reg [31:0] _RAND_46;
  reg [31:0] _RAND_47;
  reg [63:0] _RAND_48;
  reg [63:0] _RAND_49;
  reg [31:0] _RAND_50;
  reg [31:0] _RAND_51;
  reg [31:0] _RAND_52;
  reg [63:0] _RAND_53;
  reg [31:0] _RAND_54;
  reg [31:0] _RAND_55;
  reg [31:0] _RAND_56;
  reg [95:0] _RAND_57;
`endif // RANDOMIZE_REG_INIT
  wire [63:0] alu_io_A; // @[datapath.scala 263:25]
  wire [63:0] alu_io_B; // @[datapath.scala 263:25]
  wire [1:0] alu_io_width_type; // @[datapath.scala 263:25]
  wire [3:0] alu_io_alu_op; // @[datapath.scala 263:25]
  wire [63:0] alu_io_out; // @[datapath.scala 263:25]
  wire [63:0] alu_io_sum; // @[datapath.scala 263:25]
  wire [31:0] immGen_io_inst; // @[datapath.scala 264:28]
  wire [2:0] immGen_io_sel; // @[datapath.scala 264:28]
  wire [63:0] immGen_io_out; // @[datapath.scala 264:28]
  wire [63:0] brCond_io_rs1; // @[datapath.scala 265:28]
  wire [63:0] brCond_io_rs2; // @[datapath.scala 265:28]
  wire [2:0] brCond_io_br_type; // @[datapath.scala 265:28]
  wire  brCond_io_taken; // @[datapath.scala 265:28]
  wire  regFile_clock; // @[datapath.scala 266:29]
  wire  regFile_reset; // @[datapath.scala 266:29]
  wire  regFile_io_wen; // @[datapath.scala 266:29]
  wire [4:0] regFile_io_waddr; // @[datapath.scala 266:29]
  wire [63:0] regFile_io_wdata; // @[datapath.scala 266:29]
  wire [4:0] regFile_io_raddr_0; // @[datapath.scala 266:29]
  wire [4:0] regFile_io_raddr_1; // @[datapath.scala 266:29]
  wire [63:0] regFile_io_rdata_0; // @[datapath.scala 266:29]
  wire [63:0] regFile_io_rdata_1; // @[datapath.scala 266:29]
  wire [63:0] regFile_io_rdata_4; // @[datapath.scala 266:29]
  wire [63:0] regFile_io_rdata_5; // @[datapath.scala 266:29]
  wire [63:0] regFile_io_rdata_6; // @[datapath.scala 266:29]
  wire [63:0] regFile_io_rdata_7; // @[datapath.scala 266:29]
  wire [63:0] regFile_io_rdata_8; // @[datapath.scala 266:29]
  wire [63:0] regFile_io_rdata_9; // @[datapath.scala 266:29]
  wire [63:0] regFile_io_rdata_10; // @[datapath.scala 266:29]
  wire [63:0] regFile_io_rdata_11; // @[datapath.scala 266:29]
  wire [63:0] regFile_io_rdata_12; // @[datapath.scala 266:29]
  wire [63:0] regFile_io_rdata_13; // @[datapath.scala 266:29]
  wire [63:0] regFile_io_rdata_14; // @[datapath.scala 266:29]
  wire [63:0] regFile_io_rdata_15; // @[datapath.scala 266:29]
  wire [63:0] regFile_io_rdata_16; // @[datapath.scala 266:29]
  wire [63:0] regFile_io_rdata_17; // @[datapath.scala 266:29]
  wire [63:0] regFile_io_rdata_18; // @[datapath.scala 266:29]
  wire [63:0] regFile_io_rdata_19; // @[datapath.scala 266:29]
  wire [63:0] regFile_io_rdata_20; // @[datapath.scala 266:29]
  wire [63:0] regFile_io_rdata_21; // @[datapath.scala 266:29]
  wire [63:0] regFile_io_rdata_22; // @[datapath.scala 266:29]
  wire [63:0] regFile_io_rdata_23; // @[datapath.scala 266:29]
  wire [63:0] regFile_io_rdata_24; // @[datapath.scala 266:29]
  wire [63:0] regFile_io_rdata_25; // @[datapath.scala 266:29]
  wire [63:0] regFile_io_rdata_26; // @[datapath.scala 266:29]
  wire [63:0] regFile_io_rdata_27; // @[datapath.scala 266:29]
  wire [63:0] regFile_io_rdata_28; // @[datapath.scala 266:29]
  wire [63:0] regFile_io_rdata_29; // @[datapath.scala 266:29]
  wire [63:0] regFile_io_rdata_30; // @[datapath.scala 266:29]
  wire [63:0] regFile_io_rdata_31; // @[datapath.scala 266:29]
  wire [63:0] regFile_io_rdata_32; // @[datapath.scala 266:29]
  wire [63:0] regFile_io_rdata_33; // @[datapath.scala 266:29]
  wire [63:0] regFile_io_rdata_34; // @[datapath.scala 266:29]
  wire  csr_clock; // @[datapath.scala 280:25]
  wire  csr_reset; // @[datapath.scala 280:25]
  wire [3:0] csr_io_flush_mask; // @[datapath.scala 280:25]
  wire [2:0] csr_io_r_op; // @[datapath.scala 280:25]
  wire [11:0] csr_io_r_addr; // @[datapath.scala 280:25]
  wire [63:0] csr_io_r_data; // @[datapath.scala 280:25]
  wire [2:0] csr_io_w_op; // @[datapath.scala 280:25]
  wire [11:0] csr_io_w_addr; // @[datapath.scala 280:25]
  wire [63:0] csr_io_w_data; // @[datapath.scala 280:25]
  wire  csr_io_retired; // @[datapath.scala 280:25]
  wire [31:0] csr_io_inst; // @[datapath.scala 280:25]
  wire [31:0] csr_io_illegal_inst; // @[datapath.scala 280:25]
  wire [1:0] csr_io_inst_mode; // @[datapath.scala 280:25]
  wire  csr_io_fetch_misalign; // @[datapath.scala 280:25]
  wire  csr_io_load_misalign; // @[datapath.scala 280:25]
  wire  csr_io_store_misalign; // @[datapath.scala 280:25]
  wire [63:0] csr_io_jump_addr; // @[datapath.scala 280:25]
  wire  csr_io_jump_taken; // @[datapath.scala 280:25]
  wire  csr_io_isSret; // @[datapath.scala 280:25]
  wire  csr_io_isMret; // @[datapath.scala 280:25]
  wire [63:0] csr_io_pc_fetch_misalign; // @[datapath.scala 280:25]
  wire [63:0] csr_io_load_misalign_addr; // @[datapath.scala 280:25]
  wire [63:0] csr_io_store_misalign_addr; // @[datapath.scala 280:25]
  wire [63:0] csr_io_ebreak_addr; // @[datapath.scala 280:25]
  wire [63:0] csr_io_excPC; // @[datapath.scala 280:25]
  wire [63:0] csr_io_excValue; // @[datapath.scala 280:25]
  wire [63:0] csr_io_trapVec; // @[datapath.scala 280:25]
  wire  csr_io_stall; // @[datapath.scala 280:25]
  wire  csr_io_trap; // @[datapath.scala 280:25]
  wire  csr_io_fd_enable; // @[datapath.scala 280:25]
  wire  csr_io_de_enable; // @[datapath.scala 280:25]
  wire  csr_io_em_enable; // @[datapath.scala 280:25]
  wire  csr_io_mw_enable; // @[datapath.scala 280:25]
  wire  gpr_ptr_clock; // @[datapath.scala 283:29]
  wire  gpr_ptr_reset; // @[datapath.scala 283:29]
  wire [63:0] gpr_ptr_regfile_0; // @[datapath.scala 283:29]
  wire [63:0] gpr_ptr_regfile_1; // @[datapath.scala 283:29]
  wire [63:0] gpr_ptr_regfile_2; // @[datapath.scala 283:29]
  wire [63:0] gpr_ptr_regfile_3; // @[datapath.scala 283:29]
  wire [63:0] gpr_ptr_regfile_4; // @[datapath.scala 283:29]
  wire [63:0] gpr_ptr_regfile_5; // @[datapath.scala 283:29]
  wire [63:0] gpr_ptr_regfile_6; // @[datapath.scala 283:29]
  wire [63:0] gpr_ptr_regfile_7; // @[datapath.scala 283:29]
  wire [63:0] gpr_ptr_regfile_8; // @[datapath.scala 283:29]
  wire [63:0] gpr_ptr_regfile_9; // @[datapath.scala 283:29]
  wire [63:0] gpr_ptr_regfile_10; // @[datapath.scala 283:29]
  wire [63:0] gpr_ptr_regfile_11; // @[datapath.scala 283:29]
  wire [63:0] gpr_ptr_regfile_12; // @[datapath.scala 283:29]
  wire [63:0] gpr_ptr_regfile_13; // @[datapath.scala 283:29]
  wire [63:0] gpr_ptr_regfile_14; // @[datapath.scala 283:29]
  wire [63:0] gpr_ptr_regfile_15; // @[datapath.scala 283:29]
  wire [63:0] gpr_ptr_regfile_16; // @[datapath.scala 283:29]
  wire [63:0] gpr_ptr_regfile_17; // @[datapath.scala 283:29]
  wire [63:0] gpr_ptr_regfile_18; // @[datapath.scala 283:29]
  wire [63:0] gpr_ptr_regfile_19; // @[datapath.scala 283:29]
  wire [63:0] gpr_ptr_regfile_20; // @[datapath.scala 283:29]
  wire [63:0] gpr_ptr_regfile_21; // @[datapath.scala 283:29]
  wire [63:0] gpr_ptr_regfile_22; // @[datapath.scala 283:29]
  wire [63:0] gpr_ptr_regfile_23; // @[datapath.scala 283:29]
  wire [63:0] gpr_ptr_regfile_24; // @[datapath.scala 283:29]
  wire [63:0] gpr_ptr_regfile_25; // @[datapath.scala 283:29]
  wire [63:0] gpr_ptr_regfile_26; // @[datapath.scala 283:29]
  wire [63:0] gpr_ptr_regfile_27; // @[datapath.scala 283:29]
  wire [63:0] gpr_ptr_regfile_28; // @[datapath.scala 283:29]
  wire [63:0] gpr_ptr_regfile_29; // @[datapath.scala 283:29]
  wire [63:0] gpr_ptr_regfile_30; // @[datapath.scala 283:29]
  wire [63:0] gpr_ptr_regfile_31; // @[datapath.scala 283:29]
  reg [31:0] fd_pipe_reg_inst; // @[datapath.scala 181:34]
  reg [63:0] fd_pipe_reg_pc; // @[datapath.scala 181:34]
  reg  fd_pipe_reg_enable; // @[datapath.scala 181:34]
  reg [3:0] de_pipe_reg_alu_op; // @[datapath.scala 190:34]
  reg [63:0] de_pipe_reg_pc; // @[datapath.scala 190:34]
  reg [31:0] de_pipe_reg_inst; // @[datapath.scala 190:34]
  reg [63:0] de_pipe_reg_imm; // @[datapath.scala 190:34]
  reg [63:0] de_pipe_reg_rs1; // @[datapath.scala 190:34]
  reg [63:0] de_pipe_reg_src1_addr; // @[datapath.scala 190:34]
  reg [63:0] de_pipe_reg_rs2; // @[datapath.scala 190:34]
  reg [63:0] de_pipe_reg_src2_addr; // @[datapath.scala 190:34]
  reg [63:0] de_pipe_reg_csr_read_data; // @[datapath.scala 190:34]
  reg [2:0] de_pipe_reg_csr_write_op; // @[datapath.scala 190:34]
  reg [11:0] de_pipe_reg_csr_write_addr; // @[datapath.scala 190:34]
  reg [63:0] de_pipe_reg_csr_write_data; // @[datapath.scala 190:34]
  reg [4:0] de_pipe_reg_dest; // @[datapath.scala 190:34]
  reg  de_pipe_reg_A_sel; // @[datapath.scala 190:34]
  reg  de_pipe_reg_B_sel; // @[datapath.scala 190:34]
  reg [1:0] de_pipe_reg_pc_sel; // @[datapath.scala 190:34]
  reg [2:0] de_pipe_reg_br_type; // @[datapath.scala 190:34]
  reg [1:0] de_pipe_reg_wd_type; // @[datapath.scala 190:34]
  reg [2:0] de_pipe_reg_st_type; // @[datapath.scala 190:34]
  reg [2:0] de_pipe_reg_ld_type; // @[datapath.scala 190:34]
  reg [1:0] de_pipe_reg_wb_sel; // @[datapath.scala 190:34]
  reg  de_pipe_reg_wb_en; // @[datapath.scala 190:34]
  reg  de_pipe_reg_enable; // @[datapath.scala 190:34]
  reg [63:0] em_pipe_reg_alu_out; // @[datapath.scala 219:34]
  reg [63:0] em_pipe_reg_csr_read_data; // @[datapath.scala 219:34]
  reg [2:0] em_pipe_reg_csr_write_op; // @[datapath.scala 219:34]
  reg [11:0] em_pipe_reg_csr_write_addr; // @[datapath.scala 219:34]
  reg [63:0] em_pipe_reg_csr_write_data; // @[datapath.scala 219:34]
  reg [63:0] em_pipe_reg_jump_addr; // @[datapath.scala 219:34]
  reg  em_pipe_reg_jump_taken; // @[datapath.scala 219:34]
  reg [63:0] em_pipe_reg_st_data; // @[datapath.scala 219:34]
  reg [2:0] em_pipe_reg_st_type; // @[datapath.scala 219:34]
  reg [2:0] em_pipe_reg_ld_type; // @[datapath.scala 219:34]
  reg [1:0] em_pipe_reg_wb_sel; // @[datapath.scala 219:34]
  reg  em_pipe_reg_wb_en; // @[datapath.scala 219:34]
  reg [4:0] em_pipe_reg_dest; // @[datapath.scala 219:34]
  reg [63:0] em_pipe_reg_pc; // @[datapath.scala 219:34]
  reg [31:0] em_pipe_reg_inst; // @[datapath.scala 219:34]
  reg  em_pipe_reg_enable; // @[datapath.scala 219:34]
  reg [63:0] mw_pipe_reg_load_data; // @[datapath.scala 242:34]
  reg [63:0] mw_pipe_reg_alu_out; // @[datapath.scala 242:34]
  reg [4:0] mw_pipe_reg_dest; // @[datapath.scala 242:34]
  reg [63:0] mw_pipe_reg_csr_read_data; // @[datapath.scala 242:34]
  reg [2:0] mw_pipe_reg_csr_write_op; // @[datapath.scala 242:34]
  reg [11:0] mw_pipe_reg_csr_write_addr; // @[datapath.scala 242:34]
  reg [63:0] mw_pipe_reg_csr_write_data; // @[datapath.scala 242:34]
  reg [63:0] mw_pipe_reg_jump_addr; // @[datapath.scala 242:34]
  reg  mw_pipe_reg_jump_taken; // @[datapath.scala 242:34]
  reg [1:0] mw_pipe_reg_wb_sel; // @[datapath.scala 242:34]
  reg  mw_pipe_reg_wb_en; // @[datapath.scala 242:34]
  reg [63:0] mw_pipe_reg_pc; // @[datapath.scala 242:34]
  reg [31:0] mw_pipe_reg_inst; // @[datapath.scala 242:34]
  reg  mw_pipe_reg_enable; // @[datapath.scala 242:34]
  reg  started; // @[datapath.scala 271:30]
  wire  _dcache_stall_T_1 = |em_pipe_reg_st_type; // @[datapath.scala 275:76]
  wire  _dcache_stall_T_3 = (|em_pipe_reg_ld_type | |em_pipe_reg_st_type) & em_pipe_reg_enable; // @[datapath.scala 275:81]
  wire  dcache_stall = (|em_pipe_reg_ld_type | |em_pipe_reg_st_type) & em_pipe_reg_enable & ~
    io_dcache_cpu_response_ready; // @[datapath.scala 275:103]
  wire  stall = ~io_icache_cpu_response_ready | dcache_stall; // @[datapath.scala 276:51]
  wire  _csr_atomic_flush_T_7 = fd_pipe_reg_enable & io_ctrl_csr_cmd != 3'h0; // @[datapath.scala 320:96]
  wire [1:0] _csr_atomic_flush_T_9 = de_pipe_reg_enable & de_pipe_reg_csr_write_op != 3'h0 ? 2'h3 : {{1'd0},
    _csr_atomic_flush_T_7}; // @[datapath.scala 319:68]
  wire [2:0] _csr_atomic_flush_T_10 = em_pipe_reg_enable & em_pipe_reg_csr_write_op != 3'h0 ? 3'h7 : {{1'd0},
    _csr_atomic_flush_T_9}; // @[datapath.scala 318:60]
  wire [3:0] csr_atomic_flush = mw_pipe_reg_enable & mw_pipe_reg_csr_write_op != 3'h0 ? 4'hf : {{1'd0},
    _csr_atomic_flush_T_10}; // @[datapath.scala 317:32]
  wire  brCond_taken = brCond_io_taken & de_pipe_reg_enable; // @[datapath.scala 634:41]
  wire  _jmp_occur_T = de_pipe_reg_pc_sel == 2'h1; // @[datapath.scala 619:64]
  wire  jmp_occur = de_pipe_reg_enable & de_pipe_reg_pc_sel == 2'h1; // @[datapath.scala 619:41]
  wire  _flush_fd_T_1 = brCond_taken | jmp_occur; // @[datapath.scala 325:58]
  wire  flush_fd = csr_io_flush_mask[0] | (brCond_taken | jmp_occur) | csr_atomic_flush[0]; // @[datapath.scala 325:72]
  wire  _flush_de_T_2 = ~stall; // @[datapath.scala 326:80]
  wire  flush_de = csr_io_flush_mask[1] | _flush_fd_T_1 & ~stall | csr_atomic_flush[1]; // @[datapath.scala 326:88]
  wire  flush_em = csr_io_flush_mask[2] | csr_atomic_flush[2]; // @[datapath.scala 327:49]
  wire  flush_mw = csr_io_flush_mask[3] | csr_atomic_flush[3]; // @[datapath.scala 328:45]
  wire  csr_atomic = |csr_atomic_flush; // @[datapath.scala 338:40]
  wire [63:0] _pc_T_1 = 64'h80000000 - 64'h4; // @[datapath.scala 343:46]
  reg [64:0] pc; // @[datapath.scala 343:25]
  wire [64:0] _next_pc_T_1 = pc + 65'h4; // @[datapath.scala 346:20]
  wire [63:0] _next_pc_T_3 = de_pipe_reg_pc + 64'h4; // @[datapath.scala 349:47]
  wire  _next_pc_T_4 = ~started; // @[datapath.scala 350:18]
  wire  _next_pc_T_5 = ~started & stall; // @[datapath.scala 350:27]
  wire  _next_pc_T_7 = _jmp_occur_T & de_pipe_reg_enable; // @[datapath.scala 351:51]
  wire  _next_pc_T_8 = _jmp_occur_T & de_pipe_reg_enable | brCond_taken; // @[datapath.scala 351:73]
  wire [63:0] jump_addr = alu_io_out; // @[datapath.scala 282:29 624:19]
  wire [63:0] _next_pc_T_9 = {{1'd0}, jump_addr[63:1]}; // @[datapath.scala 351:103]
  wire [64:0] _next_pc_T_10 = {_next_pc_T_9, 1'h0}; // @[datapath.scala 351:110]
  wire [64:0] _next_pc_T_11 = _next_pc_T_8 ? _next_pc_T_10 : _next_pc_T_1; // @[Mux.scala 101:16]
  wire [64:0] _next_pc_T_12 = _next_pc_T_5 ? pc : _next_pc_T_11; // @[Mux.scala 101:16]
  wire [64:0] _next_pc_T_13 = csr_atomic ? {{1'd0}, _next_pc_T_3} : _next_pc_T_12; // @[Mux.scala 101:16]
  wire [64:0] next_pc = csr_io_trap ? {{1'd0}, csr_io_trapVec} : _next_pc_T_13; // @[Mux.scala 101:16]
  wire  is_kill_inst = io_ctrl_is_kill & fd_pipe_reg_enable; // @[datapath.scala 424:41]
  wire [31:0] _inst_T_7 = pc[2] ? io_icache_cpu_response_data[63:32] : io_icache_cpu_response_data[31:0]; // @[datapath.scala 361:105]
  wire [31:0] inst = started | is_kill_inst | brCond_taken | csr_io_trap ? 32'h13 : _inst_T_7; // @[datapath.scala 361:27]
  wire [64:0] _io_icache_cpu_request_addr_T_2 = stall & _next_pc_T_4 ? pc : next_pc; // @[datapath.scala 384:42]
  wire [64:0] _GEN_0 = _flush_de_T_2 ? pc : {{1'd0}, fd_pipe_reg_pc}; // @[datapath.scala 403:27 404:32 181:34]
  wire  _GEN_2 = _flush_de_T_2 | fd_pipe_reg_enable; // @[datapath.scala 403:27 181:34 406:36]
  wire [64:0] _GEN_3 = flush_fd & _flush_de_T_2 ? 65'h80000000 : _GEN_0; // @[datapath.scala 399:35 400:32]
  wire [4:0] src1_addr = fd_pipe_reg_inst[19:15]; // @[datapath.scala 427:41]
  wire [4:0] src2_addr = fd_pipe_reg_inst[24:20]; // @[datapath.scala 428:41]
  wire [4:0] dest_addr = fd_pipe_reg_inst[11:7]; // @[datapath.scala 429:41]
  wire  _csr_op_T = io_ctrl_csr_cmd == 3'h1; // @[datapath.scala 451:58]
  wire  _csr_op_T_1 = dest_addr == 5'h0; // @[datapath.scala 451:84]
  wire  _csr_op_T_2 = io_ctrl_csr_cmd == 3'h1 & dest_addr == 5'h0; // @[datapath.scala 451:70]
  wire  _csr_op_T_4 = io_ctrl_csr_cmd == 3'h3; // @[datapath.scala 453:70]
  wire  _csr_op_T_8 = io_ctrl_csr_cmd == 3'h2; // @[datapath.scala 455:86]
  wire [2:0] _csr_op_T_12 = _csr_op_T_8 ? 3'h4 : 3'h0; // @[datapath.scala 456:76]
  wire [2:0] _csr_op_T_13 = io_ctrl_csr_cmd == 3'h2 & _csr_op_T_1 ? 3'h1 : _csr_op_T_12; // @[datapath.scala 455:68]
  wire [2:0] _csr_op_T_14 = _csr_op_T_4 ? 3'h5 : _csr_op_T_13; // @[datapath.scala 454:60]
  wire [2:0] _csr_op_T_15 = io_ctrl_csr_cmd == 3'h3 & _csr_op_T_1 ? 3'h1 : _csr_op_T_14; // @[datapath.scala 453:52]
  wire [2:0] _csr_op_T_16 = _csr_op_T ? 3'h3 : _csr_op_T_15; // @[datapath.scala 452:44]
  wire [63:0] _csr_io_fetch_misalign_T = de_pipe_reg_pc & 64'h3; // @[datapath.scala 471:50]
  wire [4:0] csr_write_addr = inst[11:7]; // @[datapath.scala 477:34]
  wire  _de_pipe_reg_rs1_T_5 = mw_pipe_reg_wb_sel == 2'h0; // @[datapath.scala 518:80]
  wire  _de_pipe_reg_rs1_T_6 = mw_pipe_reg_wb_sel == 2'h2; // @[datapath.scala 519:88]
  wire [63:0] _de_pipe_reg_rs1_T_8 = mw_pipe_reg_pc + 64'h4; // @[datapath.scala 519:115]
  wire  _de_pipe_reg_rs1_T_9 = mw_pipe_reg_wb_sel == 2'h3; // @[datapath.scala 520:96]
  wire [63:0] _de_pipe_reg_rs1_T_10 = mw_pipe_reg_wb_sel == 2'h3 ? mw_pipe_reg_csr_read_data : mw_pipe_reg_load_data; // @[datapath.scala 520:76]
  wire [63:0] _de_pipe_reg_rs1_T_11 = mw_pipe_reg_wb_sel == 2'h2 ? _de_pipe_reg_rs1_T_8 : _de_pipe_reg_rs1_T_10; // @[datapath.scala 519:68]
  wire [63:0] _de_pipe_reg_rs1_T_12 = mw_pipe_reg_wb_sel == 2'h0 ? mw_pipe_reg_alu_out : _de_pipe_reg_rs1_T_11; // @[datapath.scala 518:60]
  wire [63:0] _load_data_hazard_T = em_pipe_reg_alu_out & 64'h7; // @[datapath.scala 551:85]
  wire [66:0] _load_data_hazard_T_1 = {_load_data_hazard_T, 3'h0}; // @[datapath.scala 551:96]
  wire [63:0] load_data_hazard = io_dcache_cpu_response_data >> _load_data_hazard_T_1; // @[datapath.scala 551:60]
  wire [31:0] _load_data_ext_hazard_T_3 = load_data_hazard[31] ? 32'hffffffff : 32'h0; // @[datapath.scala 552:78]
  wire [63:0] _load_data_ext_hazard_T_5 = {_load_data_ext_hazard_T_3,load_data_hazard[31:0]}; // @[Cat.scala 31:58]
  wire [63:0] _load_data_ext_hazard_T_9 = {32'h0,load_data_hazard[31:0]}; // @[Cat.scala 31:58]
  wire [47:0] _load_data_ext_hazard_T_13 = load_data_hazard[15] ? 48'hffffffffffff : 48'h0; // @[datapath.scala 554:115]
  wire [63:0] _load_data_ext_hazard_T_15 = {_load_data_ext_hazard_T_13,load_data_hazard[15:0]}; // @[Cat.scala 31:58]
  wire [63:0] _load_data_ext_hazard_T_19 = {48'h0,load_data_hazard[15:0]}; // @[Cat.scala 31:58]
  wire [55:0] _load_data_ext_hazard_T_23 = load_data_hazard[7] ? 56'hffffffffffffff : 56'h0; // @[datapath.scala 556:131]
  wire [63:0] _load_data_ext_hazard_T_25 = {_load_data_ext_hazard_T_23,load_data_hazard[7:0]}; // @[Cat.scala 31:58]
  wire [63:0] _load_data_ext_hazard_T_29 = {56'h0,load_data_hazard[7:0]}; // @[Cat.scala 31:58]
  wire [63:0] _load_data_ext_hazard_T_30 = em_pipe_reg_ld_type == 3'h5 ? _load_data_ext_hazard_T_29 : load_data_hazard; // @[datapath.scala 557:100]
  wire [63:0] _load_data_ext_hazard_T_31 = em_pipe_reg_ld_type == 3'h3 ? _load_data_ext_hazard_T_25 :
    _load_data_ext_hazard_T_30; // @[datapath.scala 556:92]
  wire [63:0] _load_data_ext_hazard_T_32 = em_pipe_reg_ld_type == 3'h4 ? _load_data_ext_hazard_T_19 :
    _load_data_ext_hazard_T_31; // @[datapath.scala 555:84]
  wire [63:0] _load_data_ext_hazard_T_33 = em_pipe_reg_ld_type == 3'h2 ? _load_data_ext_hazard_T_15 :
    _load_data_ext_hazard_T_32; // @[datapath.scala 554:76]
  wire [63:0] _load_data_ext_hazard_T_34 = em_pipe_reg_ld_type == 3'h6 ? _load_data_ext_hazard_T_9 :
    _load_data_ext_hazard_T_33; // @[datapath.scala 553:68]
  wire [63:0] load_data_ext_hazard = em_pipe_reg_ld_type == 3'h1 ? _load_data_ext_hazard_T_5 :
    _load_data_ext_hazard_T_34; // @[datapath.scala 552:39]
  wire  _T_6 = em_pipe_reg_enable & em_pipe_reg_wb_en; // @[datapath.scala 565:33]
  wire [63:0] _GEN_127 = {{59'd0}, em_pipe_reg_dest}; // @[datapath.scala 565:80]
  wire  _T_7 = de_pipe_reg_src1_addr == _GEN_127; // @[datapath.scala 565:80]
  wire  _T_9 = de_pipe_reg_src1_addr != 64'h0; // @[datapath.scala 565:128]
  wire [63:0] _src1_data_T_3 = em_pipe_reg_pc + 64'h4; // @[datapath.scala 569:99]
  wire [63:0] _src1_data_T_5 = em_pipe_reg_wb_sel == 2'h3 ? em_pipe_reg_csr_read_data : load_data_ext_hazard; // @[datapath.scala 570:60]
  wire [63:0] _src1_data_T_6 = em_pipe_reg_wb_sel == 2'h2 ? _src1_data_T_3 : _src1_data_T_5; // @[datapath.scala 569:52]
  wire [63:0] _src1_data_T_7 = em_pipe_reg_wb_sel == 2'h0 ? em_pipe_reg_alu_out : _src1_data_T_6; // @[datapath.scala 568:41]
  wire [63:0] _GEN_54 = _T_7 ? _src1_data_T_7 : 64'h0; // @[datapath.scala 567:65 568:35]
  wire  _T_12 = mw_pipe_reg_enable & mw_pipe_reg_wb_en; // @[datapath.scala 572:39]
  wire [63:0] _GEN_129 = {{59'd0}, mw_pipe_reg_dest}; // @[datapath.scala 572:85]
  wire  _T_13 = de_pipe_reg_src1_addr == _GEN_129; // @[datapath.scala 572:85]
  wire [63:0] _GEN_55 = _T_13 ? _de_pipe_reg_rs1_T_12 : 64'h0; // @[datapath.scala 574:65 575:35]
  wire [63:0] _GEN_56 = mw_pipe_reg_enable & mw_pipe_reg_wb_en & de_pipe_reg_src1_addr == _GEN_129 & _T_9 ? _GEN_55 :
    de_pipe_reg_rs1; // @[datapath.scala 572:142 580:27]
  wire [63:0] src1_data = em_pipe_reg_enable & em_pipe_reg_wb_en & de_pipe_reg_src1_addr == _GEN_127 &
    de_pipe_reg_src1_addr != 64'h0 ? _GEN_54 : _GEN_56; // @[datapath.scala 565:137]
  wire  _T_19 = de_pipe_reg_src2_addr == _GEN_127; // @[datapath.scala 583:80]
  wire  _T_21 = de_pipe_reg_src2_addr != 64'h0; // @[datapath.scala 583:128]
  wire [63:0] _GEN_58 = _T_19 ? _src1_data_T_7 : 64'h0; // @[datapath.scala 585:65 586:35]
  wire  _T_25 = de_pipe_reg_src2_addr == _GEN_129; // @[datapath.scala 590:85]
  wire [63:0] _GEN_59 = _T_25 ? _de_pipe_reg_rs1_T_12 : 64'h0; // @[datapath.scala 592:65 593:35]
  wire [63:0] _GEN_60 = _T_12 & de_pipe_reg_src2_addr == _GEN_129 & _T_21 ? _GEN_59 : de_pipe_reg_rs2; // @[datapath.scala 590:142 598:27]
  wire [63:0] src2_data = _T_6 & de_pipe_reg_src2_addr == _GEN_127 & de_pipe_reg_src2_addr != 64'h0 ? _GEN_58 : _GEN_60; // @[datapath.scala 583:137]
  wire [63:0] A_data = de_pipe_reg_A_sel ? src1_data : de_pipe_reg_pc; // @[datapath.scala 609:25]
  wire [63:0] B_data = de_pipe_reg_B_sel ? src2_data : de_pipe_reg_imm; // @[datapath.scala 610:25]
  wire  _alu_io_A_T = de_pipe_reg_wd_type == 2'h1; // @[datapath.scala 611:45]
  wire  _csr_io_store_misalign_T_1 = de_pipe_reg_st_type == 3'h3; // @[datapath.scala 641:110]
  wire  _csr_io_store_misalign_T_2 = de_pipe_reg_st_type == 3'h2; // @[datapath.scala 642:110]
  wire  _csr_io_store_misalign_T_5 = de_pipe_reg_st_type == 3'h1; // @[datapath.scala 643:110]
  wire  _csr_io_store_misalign_T_7 = alu_io_out[1:0] != 2'h0; // @[datapath.scala 643:139]
  wire  _csr_io_store_misalign_T_8 = de_pipe_reg_st_type == 3'h4; // @[datapath.scala 644:110]
  wire  _csr_io_store_misalign_T_10 = alu_io_out[2:0] != 3'h0; // @[datapath.scala 644:139]
  wire  _csr_io_store_misalign_T_12 = _csr_io_store_misalign_T_5 ? _csr_io_store_misalign_T_7 :
    _csr_io_store_misalign_T_8 & _csr_io_store_misalign_T_10; // @[Mux.scala 101:16]
  wire  _csr_io_store_misalign_T_13 = _csr_io_store_misalign_T_2 ? alu_io_out[0] : _csr_io_store_misalign_T_12; // @[Mux.scala 101:16]
  wire  _csr_io_store_misalign_T_14 = _csr_io_store_misalign_T_1 ? 1'h0 : _csr_io_store_misalign_T_13; // @[Mux.scala 101:16]
  wire  _csr_io_load_misalign_T_3 = de_pipe_reg_ld_type == 3'h3 | de_pipe_reg_ld_type == 3'h5; // @[datapath.scala 650:120]
  wire  _csr_io_load_misalign_T_6 = de_pipe_reg_ld_type == 3'h2 | de_pipe_reg_ld_type == 3'h4; // @[datapath.scala 651:120]
  wire [14:0] _GEN_135 = {{12'd0}, de_pipe_reg_ld_type}; // @[datapath.scala 652:143]
  wire [14:0] _csr_io_load_misalign_T_10 = _GEN_135 & 15'h707f; // @[datapath.scala 652:143]
  wire  _csr_io_load_misalign_T_12 = de_pipe_reg_ld_type == 3'h1 | 15'h6003 == _csr_io_load_misalign_T_10; // @[datapath.scala 652:120]
  wire  _csr_io_load_misalign_T_15 = de_pipe_reg_ld_type == 3'h7; // @[datapath.scala 653:110]
  wire  _csr_io_load_misalign_T_19 = _csr_io_load_misalign_T_12 ? _csr_io_store_misalign_T_7 :
    _csr_io_load_misalign_T_15 & _csr_io_store_misalign_T_10; // @[Mux.scala 101:16]
  wire  _csr_io_load_misalign_T_20 = _csr_io_load_misalign_T_6 ? alu_io_out[0] : _csr_io_load_misalign_T_19; // @[Mux.scala 101:16]
  wire  _csr_io_load_misalign_T_21 = _csr_io_load_misalign_T_3 ? 1'h0 : _csr_io_load_misalign_T_20; // @[Mux.scala 101:16]
  wire  _io_dcache_cpu_request_valid_T_5 = |de_pipe_reg_st_type; // @[datapath.scala 712:176]
  wire [63:0] _io_dcache_cpu_request_addr_T = stall ? em_pipe_reg_alu_out : alu_io_out; // @[datapath.scala 721:42]
  wire [5:0] _io_dcache_cpu_request_data_T_1 = {em_pipe_reg_alu_out[2:0], 3'h0}; // @[datapath.scala 726:101]
  wire [126:0] _GEN_28 = {{63'd0}, em_pipe_reg_st_data}; // @[datapath.scala 726:71]
  wire [126:0] _io_dcache_cpu_request_data_T_2 = _GEN_28 << _io_dcache_cpu_request_data_T_1; // @[datapath.scala 726:71]
  wire [5:0] _io_dcache_cpu_request_data_T_4 = {alu_io_out[2:0], 3'h0}; // @[datapath.scala 726:138]
  wire [126:0] _GEN_52 = {{63'd0}, src2_data}; // @[datapath.scala 726:120]
  wire [126:0] _io_dcache_cpu_request_data_T_5 = _GEN_52 << _io_dcache_cpu_request_data_T_4; // @[datapath.scala 726:120]
  wire [126:0] _io_dcache_cpu_request_data_T_6 = stall ? _io_dcache_cpu_request_data_T_2 :
    _io_dcache_cpu_request_data_T_5; // @[datapath.scala 726:42]
  wire [7:0] _st_mask_T_3 = em_pipe_reg_st_type == 3'h3 ? 8'h1 : 8'hff; // @[datapath.scala 730:76]
  wire [7:0] _st_mask_T_4 = em_pipe_reg_st_type == 3'h2 ? 8'h3 : _st_mask_T_3; // @[datapath.scala 729:68]
  wire [7:0] _st_mask_T_5 = em_pipe_reg_st_type == 3'h1 ? 8'hf : _st_mask_T_4; // @[datapath.scala 728:37]
  wire [7:0] _st_mask_T_9 = _csr_io_store_misalign_T_1 ? 8'h1 : 8'hff; // @[datapath.scala 734:68]
  wire [7:0] _st_mask_T_10 = _csr_io_store_misalign_T_2 ? 8'h3 : _st_mask_T_9; // @[datapath.scala 733:60]
  wire [7:0] _st_mask_T_11 = _csr_io_store_misalign_T_5 ? 8'hf : _st_mask_T_10; // @[datapath.scala 732:62]
  wire [7:0] st_mask = stall ? _st_mask_T_5 : _st_mask_T_11; // @[datapath.scala 728:26]
  wire [14:0] _GEN_57 = {{7'd0}, st_mask}; // @[datapath.scala 747:105]
  wire [14:0] _io_dcache_cpu_request_mask_T_3 = _GEN_57 << em_pipe_reg_alu_out[2:0]; // @[datapath.scala 747:105]
  wire [14:0] _GEN_61 = {{7'd0}, st_mask}; // @[datapath.scala 747:150]
  wire [14:0] _io_dcache_cpu_request_mask_T_6 = _GEN_61 << alu_io_out[2:0]; // @[datapath.scala 747:150]
  wire [7:0] _io_dcache_cpu_request_mask_T_8 = stall ? _io_dcache_cpu_request_mask_T_3[7:0] :
    _io_dcache_cpu_request_mask_T_6[7:0]; // @[datapath.scala 747:88]
  wire  _regFile_io_wen_T_2 = _de_pipe_reg_rs1_T_5 | _de_pipe_reg_rs1_T_6; // @[datapath.scala 822:59]
  wire  _regFile_io_wen_T_3 = mw_pipe_reg_wb_sel == 2'h1; // @[datapath.scala 824:68]
  wire  _regFile_io_wen_T_4 = _regFile_io_wen_T_2 | _regFile_io_wen_T_3; // @[datapath.scala 823:79]
  wire [64:0] _GEN_136 = reset ? 65'h80000000 : _GEN_3; // @[datapath.scala 181:{34,34}]
  AluSimple alu ( // @[datapath.scala 263:25]
    .io_A(alu_io_A),
    .io_B(alu_io_B),
    .io_width_type(alu_io_width_type),
    .io_alu_op(alu_io_alu_op),
    .io_out(alu_io_out),
    .io_sum(alu_io_sum)
  );
  ImmGenWire immGen ( // @[datapath.scala 264:28]
    .io_inst(immGen_io_inst),
    .io_sel(immGen_io_sel),
    .io_out(immGen_io_out)
  );
  BrCondSimple brCond ( // @[datapath.scala 265:28]
    .io_rs1(brCond_io_rs1),
    .io_rs2(brCond_io_rs2),
    .io_br_type(brCond_io_br_type),
    .io_taken(brCond_io_taken)
  );
  RegisterFile regFile ( // @[datapath.scala 266:29]
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
  CSR csr ( // @[datapath.scala 280:25]
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
    .io_jump_addr(csr_io_jump_addr),
    .io_jump_taken(csr_io_jump_taken),
    .io_isSret(csr_io_isSret),
    .io_isMret(csr_io_isMret),
    .io_pc_fetch_misalign(csr_io_pc_fetch_misalign),
    .io_load_misalign_addr(csr_io_load_misalign_addr),
    .io_store_misalign_addr(csr_io_store_misalign_addr),
    .io_ebreak_addr(csr_io_ebreak_addr),
    .io_excPC(csr_io_excPC),
    .io_excValue(csr_io_excValue),
    .io_trapVec(csr_io_trapVec),
    .io_stall(csr_io_stall),
    .io_trap(csr_io_trap),
    .io_fd_enable(csr_io_fd_enable),
    .io_de_enable(csr_io_de_enable),
    .io_em_enable(csr_io_em_enable),
    .io_mw_enable(csr_io_mw_enable)
  );
  gpr_ptr gpr_ptr ( // @[datapath.scala 283:29]
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
  assign io_ctrl_inst = fd_pipe_reg_inst; // @[datapath.scala 421:22]
  assign io_pc = mw_pipe_reg_pc; // @[datapath.scala 819:15]
  assign io_inst = mw_pipe_reg_inst; // @[datapath.scala 820:17]
  assign io_start = started; // @[datapath.scala 337:18]
  assign io_stall = ~io_icache_cpu_response_ready | dcache_stall; // @[datapath.scala 276:51]
  assign io_icache_cpu_request_addr = _io_icache_cpu_request_addr_T_2[31:0]; // @[datapath.scala 384:36]
  assign io_dcache_cpu_request_addr = _io_dcache_cpu_request_addr_T[31:0]; // @[datapath.scala 721:36]
  assign io_dcache_cpu_request_data = _io_dcache_cpu_request_data_T_6[63:0]; // @[datapath.scala 726:146]
  assign io_dcache_cpu_request_mask = st_mask == 8'hff ? st_mask : _io_dcache_cpu_request_mask_T_8; // @[datapath.scala 747:42]
  assign io_dcache_cpu_request_rw = stall ? _dcache_stall_T_1 & em_pipe_reg_enable : _io_dcache_cpu_request_valid_T_5 &
    de_pipe_reg_enable; // @[datapath.scala 717:40]
  assign io_dcache_cpu_request_valid = stall ? _dcache_stall_T_3 : (|de_pipe_reg_ld_type | |de_pipe_reg_st_type) &
    de_pipe_reg_enable; // @[datapath.scala 712:43]
  assign alu_io_A = de_pipe_reg_wd_type == 2'h1 ? {{32'd0}, A_data[31:0]} : A_data; // @[datapath.scala 611:24]
  assign alu_io_B = _alu_io_A_T ? {{32'd0}, B_data[31:0]} : B_data; // @[datapath.scala 612:24]
  assign alu_io_width_type = de_pipe_reg_wd_type; // @[datapath.scala 608:27]
  assign alu_io_alu_op = de_pipe_reg_alu_op; // @[datapath.scala 607:23]
  assign immGen_io_inst = fd_pipe_reg_inst; // @[datapath.scala 436:24]
  assign immGen_io_sel = io_ctrl_imm_sel; // @[datapath.scala 437:23]
  assign brCond_io_rs1 = em_pipe_reg_enable & em_pipe_reg_wb_en & de_pipe_reg_src1_addr == _GEN_127 &
    de_pipe_reg_src1_addr != 64'h0 ? _GEN_54 : _GEN_56; // @[datapath.scala 565:137]
  assign brCond_io_rs2 = _T_6 & de_pipe_reg_src2_addr == _GEN_127 & de_pipe_reg_src2_addr != 64'h0 ? _GEN_58 : _GEN_60; // @[datapath.scala 583:137]
  assign brCond_io_br_type = de_pipe_reg_br_type; // @[datapath.scala 621:27]
  assign regFile_clock = clock;
  assign regFile_reset = reset;
  assign regFile_io_wen = (_regFile_io_wen_T_4 | _de_pipe_reg_rs1_T_9) & mw_pipe_reg_wb_en & mw_pipe_reg_enable &
    _flush_de_T_2; // @[datapath.scala 824:159]
  assign regFile_io_waddr = mw_pipe_reg_dest; // @[datapath.scala 825:26]
  assign regFile_io_wdata = _de_pipe_reg_rs1_T_5 ? mw_pipe_reg_alu_out : _de_pipe_reg_rs1_T_11; // @[datapath.scala 826:32]
  assign regFile_io_raddr_0 = fd_pipe_reg_inst[19:15]; // @[datapath.scala 427:41]
  assign regFile_io_raddr_1 = fd_pipe_reg_inst[24:20]; // @[datapath.scala 428:41]
  assign csr_clock = clock;
  assign csr_reset = reset;
  assign csr_io_r_op = _csr_op_T_2 ? 3'h2 : _csr_op_T_16; // @[datapath.scala 450:25]
  assign csr_io_r_addr = de_pipe_reg_inst[31:20]; // @[datapath.scala 467:42]
  assign csr_io_w_op = mw_pipe_reg_csr_write_op; // @[datapath.scala 806:21]
  assign csr_io_w_addr = mw_pipe_reg_csr_write_addr; // @[datapath.scala 807:23]
  assign csr_io_w_data = mw_pipe_reg_csr_write_data; // @[datapath.scala 808:23]
  assign csr_io_retired = mw_pipe_reg_inst != 32'h13; // @[datapath.scala 811:44]
  assign csr_io_inst = mw_pipe_reg_inst; // @[datapath.scala 809:21]
  assign csr_io_illegal_inst = io_ctrl_is_illegal ? fd_pipe_reg_inst : 32'h0; // @[datapath.scala 469:35]
  assign csr_io_inst_mode = {{1'd0}, io_ctrl_prv}; // @[datapath.scala 468:26]
  assign csr_io_fetch_misalign = _csr_io_fetch_misalign_T != 64'h0; // @[datapath.scala 471:57]
  assign csr_io_load_misalign = de_pipe_reg_ld_type != 3'h0 & _csr_io_load_misalign_T_21; // @[datapath.scala 647:66]
  assign csr_io_store_misalign = de_pipe_reg_st_type != 3'h0 & _csr_io_store_misalign_T_14; // @[datapath.scala 638:67]
  assign csr_io_jump_addr = mw_pipe_reg_jump_addr; // @[datapath.scala 816:26]
  assign csr_io_jump_taken = mw_pipe_reg_jump_taken; // @[datapath.scala 815:27]
  assign csr_io_isSret = 32'h10200073 == mw_pipe_reg_inst; // @[datapath.scala 812:43]
  assign csr_io_isMret = 32'h30200073 == mw_pipe_reg_inst; // @[datapath.scala 813:43]
  assign csr_io_pc_fetch_misalign = de_pipe_reg_pc; // @[datapath.scala 472:34]
  assign csr_io_load_misalign_addr = alu_io_sum; // @[datapath.scala 655:35]
  assign csr_io_store_misalign_addr = alu_io_sum; // @[datapath.scala 656:36]
  assign csr_io_ebreak_addr = mw_pipe_reg_pc; // @[datapath.scala 810:28]
  assign csr_io_excPC = mw_pipe_reg_pc; // @[datapath.scala 814:22]
  assign csr_io_stall = ~io_icache_cpu_response_ready | dcache_stall; // @[datapath.scala 276:51]
  assign csr_io_fd_enable = fd_pipe_reg_enable; // @[datapath.scala 422:26]
  assign csr_io_de_enable = de_pipe_reg_enable; // @[datapath.scala 547:26]
  assign csr_io_em_enable = em_pipe_reg_enable; // @[datapath.scala 711:26]
  assign csr_io_mw_enable = mw_pipe_reg_enable; // @[datapath.scala 805:26]
  assign gpr_ptr_clock = clock; // @[datapath.scala 295:26]
  assign gpr_ptr_reset = reset; // @[datapath.scala 296:26]
  assign gpr_ptr_regfile_0 = 64'h0; // @[datapath.scala 291:41]
  assign gpr_ptr_regfile_1 = regFile_io_rdata_4; // @[datapath.scala 291:41]
  assign gpr_ptr_regfile_2 = regFile_io_rdata_5; // @[datapath.scala 291:41]
  assign gpr_ptr_regfile_3 = regFile_io_rdata_6; // @[datapath.scala 291:41]
  assign gpr_ptr_regfile_4 = regFile_io_rdata_7; // @[datapath.scala 291:41]
  assign gpr_ptr_regfile_5 = regFile_io_rdata_8; // @[datapath.scala 291:41]
  assign gpr_ptr_regfile_6 = regFile_io_rdata_9; // @[datapath.scala 291:41]
  assign gpr_ptr_regfile_7 = regFile_io_rdata_10; // @[datapath.scala 291:41]
  assign gpr_ptr_regfile_8 = regFile_io_rdata_11; // @[datapath.scala 291:41]
  assign gpr_ptr_regfile_9 = regFile_io_rdata_12; // @[datapath.scala 291:41]
  assign gpr_ptr_regfile_10 = regFile_io_rdata_13; // @[datapath.scala 291:41]
  assign gpr_ptr_regfile_11 = regFile_io_rdata_14; // @[datapath.scala 291:41]
  assign gpr_ptr_regfile_12 = regFile_io_rdata_15; // @[datapath.scala 291:41]
  assign gpr_ptr_regfile_13 = regFile_io_rdata_16; // @[datapath.scala 291:41]
  assign gpr_ptr_regfile_14 = regFile_io_rdata_17; // @[datapath.scala 291:41]
  assign gpr_ptr_regfile_15 = regFile_io_rdata_18; // @[datapath.scala 291:41]
  assign gpr_ptr_regfile_16 = regFile_io_rdata_19; // @[datapath.scala 291:41]
  assign gpr_ptr_regfile_17 = regFile_io_rdata_20; // @[datapath.scala 291:41]
  assign gpr_ptr_regfile_18 = regFile_io_rdata_21; // @[datapath.scala 291:41]
  assign gpr_ptr_regfile_19 = regFile_io_rdata_22; // @[datapath.scala 291:41]
  assign gpr_ptr_regfile_20 = regFile_io_rdata_23; // @[datapath.scala 291:41]
  assign gpr_ptr_regfile_21 = regFile_io_rdata_24; // @[datapath.scala 291:41]
  assign gpr_ptr_regfile_22 = regFile_io_rdata_25; // @[datapath.scala 291:41]
  assign gpr_ptr_regfile_23 = regFile_io_rdata_26; // @[datapath.scala 291:41]
  assign gpr_ptr_regfile_24 = regFile_io_rdata_27; // @[datapath.scala 291:41]
  assign gpr_ptr_regfile_25 = regFile_io_rdata_28; // @[datapath.scala 291:41]
  assign gpr_ptr_regfile_26 = regFile_io_rdata_29; // @[datapath.scala 291:41]
  assign gpr_ptr_regfile_27 = regFile_io_rdata_30; // @[datapath.scala 291:41]
  assign gpr_ptr_regfile_28 = regFile_io_rdata_31; // @[datapath.scala 291:41]
  assign gpr_ptr_regfile_29 = regFile_io_rdata_32; // @[datapath.scala 291:41]
  assign gpr_ptr_regfile_30 = regFile_io_rdata_33; // @[datapath.scala 291:41]
  assign gpr_ptr_regfile_31 = regFile_io_rdata_34; // @[datapath.scala 291:41]
  always @(posedge clock) begin
    if (reset) begin // @[datapath.scala 181:34]
      fd_pipe_reg_inst <= 32'h13; // @[datapath.scala 181:34]
    end else if (flush_fd & _flush_de_T_2) begin // @[datapath.scala 399:35]
      fd_pipe_reg_inst <= 32'h13; // @[datapath.scala 401:34]
    end else if (_flush_de_T_2) begin // @[datapath.scala 403:27]
      if (started | is_kill_inst | brCond_taken | csr_io_trap) begin // @[datapath.scala 361:27]
        fd_pipe_reg_inst <= 32'h13;
      end else begin
        fd_pipe_reg_inst <= _inst_T_7;
      end
    end
    fd_pipe_reg_pc <= _GEN_136[63:0]; // @[datapath.scala 181:{34,34}]
    if (reset) begin // @[datapath.scala 181:34]
      fd_pipe_reg_enable <= 1'h0; // @[datapath.scala 181:34]
    end else if (flush_fd & _flush_de_T_2) begin // @[datapath.scala 399:35]
      fd_pipe_reg_enable <= 1'h0; // @[datapath.scala 402:36]
    end else begin
      fd_pipe_reg_enable <= _GEN_2;
    end
    if (reset) begin // @[datapath.scala 190:34]
      de_pipe_reg_alu_op <= 4'h0; // @[datapath.scala 190:34]
    end else if (flush_de & _flush_de_T_2) begin // @[datapath.scala 481:35]
      de_pipe_reg_alu_op <= 4'h0; // @[datapath.scala 483:36]
    end else if (_flush_de_T_2) begin // @[datapath.scala 506:28]
      de_pipe_reg_alu_op <= io_ctrl_alu_op; // @[datapath.scala 508:36]
    end
    if (reset) begin // @[datapath.scala 190:34]
      de_pipe_reg_pc <= 64'h0; // @[datapath.scala 190:34]
    end else if (flush_de & _flush_de_T_2) begin // @[datapath.scala 481:35]
      de_pipe_reg_pc <= 64'h0; // @[datapath.scala 490:32]
    end else if (_flush_de_T_2) begin // @[datapath.scala 506:28]
      de_pipe_reg_pc <= fd_pipe_reg_pc; // @[datapath.scala 515:32]
    end
    if (reset) begin // @[datapath.scala 190:34]
      de_pipe_reg_inst <= 32'h13; // @[datapath.scala 190:34]
    end else if (flush_de & _flush_de_T_2) begin // @[datapath.scala 481:35]
      de_pipe_reg_inst <= 32'h13; // @[datapath.scala 482:34]
    end else if (_flush_de_T_2) begin // @[datapath.scala 506:28]
      de_pipe_reg_inst <= fd_pipe_reg_inst; // @[datapath.scala 507:34]
    end
    if (reset) begin // @[datapath.scala 190:34]
      de_pipe_reg_imm <= 64'h0; // @[datapath.scala 190:34]
    end else if (flush_de & _flush_de_T_2) begin // @[datapath.scala 481:35]
      de_pipe_reg_imm <= 64'h0; // @[datapath.scala 491:33]
    end else if (_flush_de_T_2) begin // @[datapath.scala 506:28]
      de_pipe_reg_imm <= immGen_io_out; // @[datapath.scala 516:33]
    end
    if (reset) begin // @[datapath.scala 190:34]
      de_pipe_reg_rs1 <= 64'h0; // @[datapath.scala 190:34]
    end else if (flush_de & _flush_de_T_2) begin // @[datapath.scala 481:35]
      de_pipe_reg_rs1 <= 64'h0; // @[datapath.scala 492:33]
    end else if (_flush_de_T_2) begin // @[datapath.scala 506:28]
      if (mw_pipe_reg_enable & mw_pipe_reg_dest == src1_addr & mw_pipe_reg_wb_en & src1_addr != 5'h0) begin // @[datapath.scala 517:39]
        de_pipe_reg_rs1 <= _de_pipe_reg_rs1_T_12;
      end else begin
        de_pipe_reg_rs1 <= regFile_io_rdata_0;
      end
    end
    if (reset) begin // @[datapath.scala 190:34]
      de_pipe_reg_src1_addr <= 64'h0; // @[datapath.scala 190:34]
    end else if (flush_de & _flush_de_T_2) begin // @[datapath.scala 481:35]
      de_pipe_reg_src1_addr <= 64'h0; // @[datapath.scala 493:39]
    end else if (_flush_de_T_2) begin // @[datapath.scala 506:28]
      de_pipe_reg_src1_addr <= {{59'd0}, src1_addr}; // @[datapath.scala 521:39]
    end
    if (reset) begin // @[datapath.scala 190:34]
      de_pipe_reg_rs2 <= 64'h0; // @[datapath.scala 190:34]
    end else if (flush_de & _flush_de_T_2) begin // @[datapath.scala 481:35]
      de_pipe_reg_rs2 <= 64'h0; // @[datapath.scala 494:33]
    end else if (_flush_de_T_2) begin // @[datapath.scala 506:28]
      if (mw_pipe_reg_enable & mw_pipe_reg_dest == src2_addr & mw_pipe_reg_wb_en & src2_addr != 5'h0) begin // @[datapath.scala 522:39]
        de_pipe_reg_rs2 <= _de_pipe_reg_rs1_T_12;
      end else begin
        de_pipe_reg_rs2 <= regFile_io_rdata_1;
      end
    end
    if (reset) begin // @[datapath.scala 190:34]
      de_pipe_reg_src2_addr <= 64'h0; // @[datapath.scala 190:34]
    end else if (flush_de & _flush_de_T_2) begin // @[datapath.scala 481:35]
      de_pipe_reg_src2_addr <= 64'h0; // @[datapath.scala 495:39]
    end else if (_flush_de_T_2) begin // @[datapath.scala 506:28]
      de_pipe_reg_src2_addr <= {{59'd0}, src2_addr}; // @[datapath.scala 526:39]
    end
    if (reset) begin // @[datapath.scala 190:34]
      de_pipe_reg_csr_read_data <= 64'h0; // @[datapath.scala 190:34]
    end else if (flush_de & _flush_de_T_2) begin // @[datapath.scala 481:35]
      de_pipe_reg_csr_read_data <= 64'h0; // @[datapath.scala 486:43]
    end else if (_flush_de_T_2) begin // @[datapath.scala 506:28]
      de_pipe_reg_csr_read_data <= csr_io_r_data; // @[datapath.scala 511:43]
    end
    if (reset) begin // @[datapath.scala 190:34]
      de_pipe_reg_csr_write_op <= 3'h0; // @[datapath.scala 190:34]
    end else if (flush_de & _flush_de_T_2) begin // @[datapath.scala 481:35]
      de_pipe_reg_csr_write_op <= 3'h0; // @[datapath.scala 487:42]
    end else if (_flush_de_T_2) begin // @[datapath.scala 506:28]
      if (_csr_op_T_2) begin // @[datapath.scala 450:25]
        de_pipe_reg_csr_write_op <= 3'h2;
      end else begin
        de_pipe_reg_csr_write_op <= _csr_op_T_16;
      end
    end
    if (reset) begin // @[datapath.scala 190:34]
      de_pipe_reg_csr_write_addr <= 12'h0; // @[datapath.scala 190:34]
    end else if (flush_de & _flush_de_T_2) begin // @[datapath.scala 481:35]
      de_pipe_reg_csr_write_addr <= 12'h0; // @[datapath.scala 489:44]
    end else if (_flush_de_T_2) begin // @[datapath.scala 506:28]
      de_pipe_reg_csr_write_addr <= {{7'd0}, csr_write_addr}; // @[datapath.scala 514:44]
    end
    if (reset) begin // @[datapath.scala 190:34]
      de_pipe_reg_csr_write_data <= 64'h0; // @[datapath.scala 190:34]
    end else if (flush_de & _flush_de_T_2) begin // @[datapath.scala 481:35]
      de_pipe_reg_csr_write_data <= 64'h0; // @[datapath.scala 488:44]
    end else if (_flush_de_T_2) begin // @[datapath.scala 506:28]
      de_pipe_reg_csr_write_data <= regFile_io_rdata_1; // @[datapath.scala 513:44]
    end
    if (reset) begin // @[datapath.scala 190:34]
      de_pipe_reg_dest <= 5'h0; // @[datapath.scala 190:34]
    end else if (flush_de & _flush_de_T_2) begin // @[datapath.scala 481:35]
      de_pipe_reg_dest <= 5'h0; // @[datapath.scala 496:34]
    end else if (_flush_de_T_2) begin // @[datapath.scala 506:28]
      de_pipe_reg_dest <= dest_addr; // @[datapath.scala 527:34]
    end
    if (reset) begin // @[datapath.scala 190:34]
      de_pipe_reg_A_sel <= 1'h0; // @[datapath.scala 190:34]
    end else if (flush_de & _flush_de_T_2) begin // @[datapath.scala 481:35]
      de_pipe_reg_A_sel <= 1'h0; // @[datapath.scala 484:35]
    end else if (_flush_de_T_2) begin // @[datapath.scala 506:28]
      de_pipe_reg_A_sel <= io_ctrl_A_sel; // @[datapath.scala 509:35]
    end
    if (reset) begin // @[datapath.scala 190:34]
      de_pipe_reg_B_sel <= 1'h0; // @[datapath.scala 190:34]
    end else if (flush_de & _flush_de_T_2) begin // @[datapath.scala 481:35]
      de_pipe_reg_B_sel <= 1'h0; // @[datapath.scala 485:35]
    end else if (_flush_de_T_2) begin // @[datapath.scala 506:28]
      de_pipe_reg_B_sel <= io_ctrl_B_sel; // @[datapath.scala 510:35]
    end
    if (reset) begin // @[datapath.scala 190:34]
      de_pipe_reg_pc_sel <= 2'h0; // @[datapath.scala 190:34]
    end else if (flush_de & _flush_de_T_2) begin // @[datapath.scala 481:35]
      de_pipe_reg_pc_sel <= 2'h0; // @[datapath.scala 497:36]
    end else if (_flush_de_T_2) begin // @[datapath.scala 506:28]
      de_pipe_reg_pc_sel <= io_ctrl_pc_sel; // @[datapath.scala 528:36]
    end
    if (reset) begin // @[datapath.scala 190:34]
      de_pipe_reg_br_type <= 3'h0; // @[datapath.scala 190:34]
    end else if (flush_de & _flush_de_T_2) begin // @[datapath.scala 481:35]
      de_pipe_reg_br_type <= 3'h0; // @[datapath.scala 498:37]
    end else if (_flush_de_T_2) begin // @[datapath.scala 506:28]
      de_pipe_reg_br_type <= io_ctrl_br_type; // @[datapath.scala 529:37]
    end
    if (reset) begin // @[datapath.scala 190:34]
      de_pipe_reg_wd_type <= 2'h0; // @[datapath.scala 190:34]
    end else if (flush_de & _flush_de_T_2) begin // @[datapath.scala 481:35]
      de_pipe_reg_wd_type <= 2'h0; // @[datapath.scala 501:37]
    end else if (_flush_de_T_2) begin // @[datapath.scala 506:28]
      de_pipe_reg_wd_type <= io_ctrl_wd_type; // @[datapath.scala 532:37]
    end
    if (reset) begin // @[datapath.scala 190:34]
      de_pipe_reg_st_type <= 3'h0; // @[datapath.scala 190:34]
    end else if (flush_de & _flush_de_T_2) begin // @[datapath.scala 481:35]
      de_pipe_reg_st_type <= 3'h0; // @[datapath.scala 499:37]
    end else if (_flush_de_T_2) begin // @[datapath.scala 506:28]
      de_pipe_reg_st_type <= io_ctrl_st_type; // @[datapath.scala 530:37]
    end
    if (reset) begin // @[datapath.scala 190:34]
      de_pipe_reg_ld_type <= 3'h0; // @[datapath.scala 190:34]
    end else if (flush_de & _flush_de_T_2) begin // @[datapath.scala 481:35]
      de_pipe_reg_ld_type <= 3'h0; // @[datapath.scala 500:37]
    end else if (_flush_de_T_2) begin // @[datapath.scala 506:28]
      de_pipe_reg_ld_type <= io_ctrl_ld_type; // @[datapath.scala 531:37]
    end
    if (reset) begin // @[datapath.scala 190:34]
      de_pipe_reg_wb_sel <= 2'h0; // @[datapath.scala 190:34]
    end else if (flush_de & _flush_de_T_2) begin // @[datapath.scala 481:35]
      de_pipe_reg_wb_sel <= 2'h0; // @[datapath.scala 502:36]
    end else if (_flush_de_T_2) begin // @[datapath.scala 506:28]
      de_pipe_reg_wb_sel <= io_ctrl_wb_sel; // @[datapath.scala 533:36]
    end
    if (reset) begin // @[datapath.scala 190:34]
      de_pipe_reg_wb_en <= 1'h0; // @[datapath.scala 190:34]
    end else if (flush_de & _flush_de_T_2) begin // @[datapath.scala 481:35]
      de_pipe_reg_wb_en <= 1'h0; // @[datapath.scala 503:35]
    end else if (_flush_de_T_2) begin // @[datapath.scala 506:28]
      de_pipe_reg_wb_en <= io_ctrl_wb_en; // @[datapath.scala 534:35]
    end
    if (reset) begin // @[datapath.scala 190:34]
      de_pipe_reg_enable <= 1'h0; // @[datapath.scala 190:34]
    end else if (flush_de & _flush_de_T_2) begin // @[datapath.scala 481:35]
      de_pipe_reg_enable <= 1'h0; // @[datapath.scala 505:36]
    end else if (_flush_de_T_2) begin // @[datapath.scala 506:28]
      de_pipe_reg_enable <= fd_pipe_reg_enable; // @[datapath.scala 536:36]
    end
    if (reset) begin // @[datapath.scala 219:34]
      em_pipe_reg_alu_out <= 64'h0; // @[datapath.scala 219:34]
    end else if (flush_em & _flush_de_T_2) begin // @[datapath.scala 658:36]
      em_pipe_reg_alu_out <= 64'h0; // @[datapath.scala 661:37]
    end else if (_flush_de_T_2) begin // @[datapath.scala 677:27]
      em_pipe_reg_alu_out <= alu_io_out; // @[datapath.scala 680:37]
    end
    if (reset) begin // @[datapath.scala 219:34]
      em_pipe_reg_csr_read_data <= 64'h0; // @[datapath.scala 219:34]
    end else if (flush_em & _flush_de_T_2) begin // @[datapath.scala 658:36]
      em_pipe_reg_csr_read_data <= 64'h0; // @[datapath.scala 663:43]
    end else if (_flush_de_T_2) begin // @[datapath.scala 677:27]
      em_pipe_reg_csr_read_data <= de_pipe_reg_csr_read_data; // @[datapath.scala 682:43]
    end
    if (reset) begin // @[datapath.scala 219:34]
      em_pipe_reg_csr_write_op <= 3'h0; // @[datapath.scala 219:34]
    end else if (flush_em & _flush_de_T_2) begin // @[datapath.scala 658:36]
      em_pipe_reg_csr_write_op <= 3'h0; // @[datapath.scala 664:42]
    end else if (_flush_de_T_2) begin // @[datapath.scala 677:27]
      em_pipe_reg_csr_write_op <= de_pipe_reg_csr_write_op; // @[datapath.scala 683:42]
    end
    if (reset) begin // @[datapath.scala 219:34]
      em_pipe_reg_csr_write_addr <= 12'h0; // @[datapath.scala 219:34]
    end else if (flush_em & _flush_de_T_2) begin // @[datapath.scala 658:36]
      em_pipe_reg_csr_write_addr <= 12'h0; // @[datapath.scala 665:44]
    end else if (_flush_de_T_2) begin // @[datapath.scala 677:27]
      em_pipe_reg_csr_write_addr <= de_pipe_reg_csr_write_addr; // @[datapath.scala 684:44]
    end
    if (reset) begin // @[datapath.scala 219:34]
      em_pipe_reg_csr_write_data <= 64'h0; // @[datapath.scala 219:34]
    end else if (flush_em & _flush_de_T_2) begin // @[datapath.scala 658:36]
      em_pipe_reg_csr_write_data <= 64'h0; // @[datapath.scala 666:44]
    end else if (_flush_de_T_2) begin // @[datapath.scala 677:27]
      em_pipe_reg_csr_write_data <= de_pipe_reg_csr_write_data; // @[datapath.scala 685:44]
    end
    if (reset) begin // @[datapath.scala 219:34]
      em_pipe_reg_jump_addr <= 64'h0; // @[datapath.scala 219:34]
    end else if (flush_em & _flush_de_T_2) begin // @[datapath.scala 658:36]
      em_pipe_reg_jump_addr <= 64'h0; // @[datapath.scala 667:39]
    end else if (_flush_de_T_2) begin // @[datapath.scala 677:27]
      em_pipe_reg_jump_addr <= alu_io_out; // @[datapath.scala 686:39]
    end
    if (reset) begin // @[datapath.scala 219:34]
      em_pipe_reg_jump_taken <= 1'h0; // @[datapath.scala 219:34]
    end else if (flush_em & _flush_de_T_2) begin // @[datapath.scala 658:36]
      em_pipe_reg_jump_taken <= 1'h0; // @[datapath.scala 668:40]
    end else if (_flush_de_T_2) begin // @[datapath.scala 677:27]
      em_pipe_reg_jump_taken <= brCond_taken | _next_pc_T_7; // @[datapath.scala 687:40]
    end
    if (reset) begin // @[datapath.scala 219:34]
      em_pipe_reg_st_data <= 64'h0; // @[datapath.scala 219:34]
    end else if (flush_em & _flush_de_T_2) begin // @[datapath.scala 658:36]
      em_pipe_reg_st_data <= 64'h0; // @[datapath.scala 669:37]
    end else if (_flush_de_T_2) begin // @[datapath.scala 677:27]
      if (_T_6 & de_pipe_reg_src2_addr == _GEN_127 & de_pipe_reg_src2_addr != 64'h0) begin // @[datapath.scala 583:137]
        em_pipe_reg_st_data <= _GEN_58;
      end else begin
        em_pipe_reg_st_data <= _GEN_60;
      end
    end
    if (reset) begin // @[datapath.scala 219:34]
      em_pipe_reg_st_type <= 3'h0; // @[datapath.scala 219:34]
    end else if (flush_em & _flush_de_T_2) begin // @[datapath.scala 658:36]
      em_pipe_reg_st_type <= 3'h0; // @[datapath.scala 670:37]
    end else if (_flush_de_T_2) begin // @[datapath.scala 677:27]
      em_pipe_reg_st_type <= de_pipe_reg_st_type; // @[datapath.scala 689:37]
    end
    if (reset) begin // @[datapath.scala 219:34]
      em_pipe_reg_ld_type <= 3'h0; // @[datapath.scala 219:34]
    end else if (flush_em & _flush_de_T_2) begin // @[datapath.scala 658:36]
      em_pipe_reg_ld_type <= 3'h0; // @[datapath.scala 671:37]
    end else if (_flush_de_T_2) begin // @[datapath.scala 677:27]
      em_pipe_reg_ld_type <= de_pipe_reg_ld_type; // @[datapath.scala 690:37]
    end
    if (reset) begin // @[datapath.scala 219:34]
      em_pipe_reg_wb_sel <= 2'h0; // @[datapath.scala 219:34]
    end else if (flush_em & _flush_de_T_2) begin // @[datapath.scala 658:36]
      em_pipe_reg_wb_sel <= 2'h0; // @[datapath.scala 672:36]
    end else if (_flush_de_T_2) begin // @[datapath.scala 677:27]
      em_pipe_reg_wb_sel <= de_pipe_reg_wb_sel; // @[datapath.scala 691:36]
    end
    if (reset) begin // @[datapath.scala 219:34]
      em_pipe_reg_wb_en <= 1'h0; // @[datapath.scala 219:34]
    end else if (flush_em & _flush_de_T_2) begin // @[datapath.scala 658:36]
      em_pipe_reg_wb_en <= 1'h0; // @[datapath.scala 673:35]
    end else if (_flush_de_T_2) begin // @[datapath.scala 677:27]
      em_pipe_reg_wb_en <= de_pipe_reg_wb_en; // @[datapath.scala 692:35]
    end
    if (reset) begin // @[datapath.scala 219:34]
      em_pipe_reg_dest <= 5'h0; // @[datapath.scala 219:34]
    end else if (flush_em & _flush_de_T_2) begin // @[datapath.scala 658:36]
      em_pipe_reg_dest <= 5'h0; // @[datapath.scala 660:34]
    end else if (_flush_de_T_2) begin // @[datapath.scala 677:27]
      em_pipe_reg_dest <= de_pipe_reg_dest; // @[datapath.scala 679:34]
    end
    if (reset) begin // @[datapath.scala 219:34]
      em_pipe_reg_pc <= 64'h0; // @[datapath.scala 219:34]
    end else if (flush_em & _flush_de_T_2) begin // @[datapath.scala 658:36]
      em_pipe_reg_pc <= 64'h0; // @[datapath.scala 674:32]
    end else if (_flush_de_T_2) begin // @[datapath.scala 677:27]
      em_pipe_reg_pc <= de_pipe_reg_pc; // @[datapath.scala 693:32]
    end
    if (reset) begin // @[datapath.scala 219:34]
      em_pipe_reg_inst <= 32'h13; // @[datapath.scala 219:34]
    end else if (flush_em & _flush_de_T_2) begin // @[datapath.scala 658:36]
      em_pipe_reg_inst <= 32'h13; // @[datapath.scala 659:34]
    end else if (_flush_de_T_2) begin // @[datapath.scala 677:27]
      em_pipe_reg_inst <= de_pipe_reg_inst; // @[datapath.scala 678:34]
    end
    if (reset) begin // @[datapath.scala 219:34]
      em_pipe_reg_enable <= 1'h0; // @[datapath.scala 219:34]
    end else if (flush_em & _flush_de_T_2) begin // @[datapath.scala 658:36]
      em_pipe_reg_enable <= 1'h0; // @[datapath.scala 676:36]
    end else if (_flush_de_T_2) begin // @[datapath.scala 677:27]
      em_pipe_reg_enable <= de_pipe_reg_enable; // @[datapath.scala 695:36]
    end
    if (reset) begin // @[datapath.scala 242:34]
      mw_pipe_reg_load_data <= 64'h0; // @[datapath.scala 242:34]
    end else if (flush_mw & _flush_de_T_2) begin // @[datapath.scala 767:33]
      mw_pipe_reg_load_data <= 64'h0; // @[datapath.scala 768:39]
    end else if (_flush_de_T_2) begin // @[datapath.scala 780:27]
      if (em_pipe_reg_ld_type == 3'h1) begin // @[datapath.scala 552:39]
        mw_pipe_reg_load_data <= _load_data_ext_hazard_T_5;
      end else begin
        mw_pipe_reg_load_data <= _load_data_ext_hazard_T_34;
      end
    end
    if (flush_mw & _flush_de_T_2) begin // @[datapath.scala 767:33]
      mw_pipe_reg_alu_out <= 64'h0; // @[datapath.scala 769:37]
    end else if (_flush_de_T_2) begin // @[datapath.scala 780:27]
      mw_pipe_reg_alu_out <= em_pipe_reg_alu_out; // @[datapath.scala 782:37]
    end
    if (flush_mw & _flush_de_T_2) begin // @[datapath.scala 767:33]
      mw_pipe_reg_dest <= 5'h0; // @[datapath.scala 770:34]
    end else if (_flush_de_T_2) begin // @[datapath.scala 780:27]
      mw_pipe_reg_dest <= em_pipe_reg_dest; // @[datapath.scala 783:34]
    end
    if (reset) begin // @[datapath.scala 242:34]
      mw_pipe_reg_csr_read_data <= 64'h0; // @[datapath.scala 242:34]
    end else if (flush_mw & _flush_de_T_2) begin // @[datapath.scala 767:33]
      mw_pipe_reg_csr_read_data <= 64'h0; // @[datapath.scala 775:43]
    end else if (_flush_de_T_2) begin // @[datapath.scala 780:27]
      mw_pipe_reg_csr_read_data <= em_pipe_reg_csr_read_data; // @[datapath.scala 790:43]
    end
    if (reset) begin // @[datapath.scala 242:34]
      mw_pipe_reg_csr_write_op <= 3'h0; // @[datapath.scala 242:34]
    end else if (flush_mw & _flush_de_T_2) begin // @[datapath.scala 767:33]
      mw_pipe_reg_csr_write_op <= 3'h0; // @[datapath.scala 776:42]
    end else if (_flush_de_T_2) begin // @[datapath.scala 780:27]
      mw_pipe_reg_csr_write_op <= em_pipe_reg_csr_write_op; // @[datapath.scala 791:42]
    end
    if (reset) begin // @[datapath.scala 242:34]
      mw_pipe_reg_csr_write_addr <= 12'h0; // @[datapath.scala 242:34]
    end else if (flush_mw & _flush_de_T_2) begin // @[datapath.scala 767:33]
      mw_pipe_reg_csr_write_addr <= 12'h0; // @[datapath.scala 778:44]
    end else if (_flush_de_T_2) begin // @[datapath.scala 780:27]
      mw_pipe_reg_csr_write_addr <= em_pipe_reg_csr_write_addr; // @[datapath.scala 793:44]
    end
    if (reset) begin // @[datapath.scala 242:34]
      mw_pipe_reg_csr_write_data <= 64'h0; // @[datapath.scala 242:34]
    end else if (flush_mw & _flush_de_T_2) begin // @[datapath.scala 767:33]
      mw_pipe_reg_csr_write_data <= 64'h0; // @[datapath.scala 777:44]
    end else if (_flush_de_T_2) begin // @[datapath.scala 780:27]
      mw_pipe_reg_csr_write_data <= em_pipe_reg_csr_write_data; // @[datapath.scala 792:44]
    end
    if (reset) begin // @[datapath.scala 242:34]
      mw_pipe_reg_jump_addr <= 64'h0; // @[datapath.scala 242:34]
    end else if (!(flush_mw & _flush_de_T_2)) begin // @[datapath.scala 767:33]
      if (_flush_de_T_2) begin // @[datapath.scala 780:27]
        mw_pipe_reg_jump_addr <= em_pipe_reg_jump_addr; // @[datapath.scala 788:39]
      end
    end
    if (reset) begin // @[datapath.scala 242:34]
      mw_pipe_reg_jump_taken <= 1'h0; // @[datapath.scala 242:34]
    end else if (!(flush_mw & _flush_de_T_2)) begin // @[datapath.scala 767:33]
      if (_flush_de_T_2) begin // @[datapath.scala 780:27]
        mw_pipe_reg_jump_taken <= em_pipe_reg_jump_taken; // @[datapath.scala 789:40]
      end
    end
    if (reset) begin // @[datapath.scala 242:34]
      mw_pipe_reg_wb_sel <= 2'h0; // @[datapath.scala 242:34]
    end else if (flush_mw & _flush_de_T_2) begin // @[datapath.scala 767:33]
      mw_pipe_reg_wb_sel <= 2'h0; // @[datapath.scala 771:36]
    end else if (_flush_de_T_2) begin // @[datapath.scala 780:27]
      mw_pipe_reg_wb_sel <= em_pipe_reg_wb_sel; // @[datapath.scala 784:36]
    end
    if (reset) begin // @[datapath.scala 242:34]
      mw_pipe_reg_wb_en <= 1'h0; // @[datapath.scala 242:34]
    end else if (flush_mw & _flush_de_T_2) begin // @[datapath.scala 767:33]
      mw_pipe_reg_wb_en <= 1'h0; // @[datapath.scala 772:35]
    end else if (_flush_de_T_2) begin // @[datapath.scala 780:27]
      mw_pipe_reg_wb_en <= em_pipe_reg_wb_en; // @[datapath.scala 785:35]
    end
    if (reset) begin // @[datapath.scala 242:34]
      mw_pipe_reg_pc <= 64'h0; // @[datapath.scala 242:34]
    end else if (flush_mw & _flush_de_T_2) begin // @[datapath.scala 767:33]
      mw_pipe_reg_pc <= 64'h0; // @[datapath.scala 773:32]
    end else if (_flush_de_T_2) begin // @[datapath.scala 780:27]
      mw_pipe_reg_pc <= em_pipe_reg_pc; // @[datapath.scala 786:32]
    end
    if (reset) begin // @[datapath.scala 242:34]
      mw_pipe_reg_inst <= 32'h13; // @[datapath.scala 242:34]
    end else if (flush_mw & _flush_de_T_2) begin // @[datapath.scala 767:33]
      mw_pipe_reg_inst <= 32'h13; // @[datapath.scala 774:34]
    end else if (_flush_de_T_2) begin // @[datapath.scala 780:27]
      mw_pipe_reg_inst <= em_pipe_reg_inst; // @[datapath.scala 787:34]
    end
    if (reset) begin // @[datapath.scala 242:34]
      mw_pipe_reg_enable <= 1'h0; // @[datapath.scala 242:34]
    end else if (flush_mw & _flush_de_T_2) begin // @[datapath.scala 767:33]
      mw_pipe_reg_enable <= 1'h0; // @[datapath.scala 779:36]
    end else if (_flush_de_T_2) begin // @[datapath.scala 780:27]
      mw_pipe_reg_enable <= em_pipe_reg_enable; // @[datapath.scala 794:36]
    end
    started <= reset; // @[datapath.scala 271:37]
    if (reset) begin // @[datapath.scala 343:25]
      pc <= {{1'd0}, _pc_T_1}; // @[datapath.scala 343:25]
    end else if (csr_io_trap) begin // @[Mux.scala 101:16]
      pc <= {{1'd0}, csr_io_trapVec};
    end else if (csr_atomic) begin // @[Mux.scala 101:16]
      pc <= {{1'd0}, _next_pc_T_3};
    end else if (!(_next_pc_T_5)) begin // @[Mux.scala 101:16]
      pc <= _next_pc_T_11;
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
  _RAND_31 = {2{`RANDOM}};
  em_pipe_reg_jump_addr = _RAND_31[63:0];
  _RAND_32 = {1{`RANDOM}};
  em_pipe_reg_jump_taken = _RAND_32[0:0];
  _RAND_33 = {2{`RANDOM}};
  em_pipe_reg_st_data = _RAND_33[63:0];
  _RAND_34 = {1{`RANDOM}};
  em_pipe_reg_st_type = _RAND_34[2:0];
  _RAND_35 = {1{`RANDOM}};
  em_pipe_reg_ld_type = _RAND_35[2:0];
  _RAND_36 = {1{`RANDOM}};
  em_pipe_reg_wb_sel = _RAND_36[1:0];
  _RAND_37 = {1{`RANDOM}};
  em_pipe_reg_wb_en = _RAND_37[0:0];
  _RAND_38 = {1{`RANDOM}};
  em_pipe_reg_dest = _RAND_38[4:0];
  _RAND_39 = {2{`RANDOM}};
  em_pipe_reg_pc = _RAND_39[63:0];
  _RAND_40 = {1{`RANDOM}};
  em_pipe_reg_inst = _RAND_40[31:0];
  _RAND_41 = {1{`RANDOM}};
  em_pipe_reg_enable = _RAND_41[0:0];
  _RAND_42 = {2{`RANDOM}};
  mw_pipe_reg_load_data = _RAND_42[63:0];
  _RAND_43 = {2{`RANDOM}};
  mw_pipe_reg_alu_out = _RAND_43[63:0];
  _RAND_44 = {1{`RANDOM}};
  mw_pipe_reg_dest = _RAND_44[4:0];
  _RAND_45 = {2{`RANDOM}};
  mw_pipe_reg_csr_read_data = _RAND_45[63:0];
  _RAND_46 = {1{`RANDOM}};
  mw_pipe_reg_csr_write_op = _RAND_46[2:0];
  _RAND_47 = {1{`RANDOM}};
  mw_pipe_reg_csr_write_addr = _RAND_47[11:0];
  _RAND_48 = {2{`RANDOM}};
  mw_pipe_reg_csr_write_data = _RAND_48[63:0];
  _RAND_49 = {2{`RANDOM}};
  mw_pipe_reg_jump_addr = _RAND_49[63:0];
  _RAND_50 = {1{`RANDOM}};
  mw_pipe_reg_jump_taken = _RAND_50[0:0];
  _RAND_51 = {1{`RANDOM}};
  mw_pipe_reg_wb_sel = _RAND_51[1:0];
  _RAND_52 = {1{`RANDOM}};
  mw_pipe_reg_wb_en = _RAND_52[0:0];
  _RAND_53 = {2{`RANDOM}};
  mw_pipe_reg_pc = _RAND_53[63:0];
  _RAND_54 = {1{`RANDOM}};
  mw_pipe_reg_inst = _RAND_54[31:0];
  _RAND_55 = {1{`RANDOM}};
  mw_pipe_reg_enable = _RAND_55[0:0];
  _RAND_56 = {1{`RANDOM}};
  started = _RAND_56[0:0];
  _RAND_57 = {3{`RANDOM}};
  pc = _RAND_57[64:0];
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
module tag_cache(
  input         clock,
  input  [2:0]  io_cache_req_index,
  input         io_cache_req_we,
  input         io_tag_write_valid,
  input         io_tag_write_dirty,
  input  [7:0]  io_tag_write_visit,
  input  [21:0] io_tag_write_tag,
  output        io_tag_read_valid,
  output        io_tag_read_dirty,
  output [7:0]  io_tag_read_visit,
  output [21:0] io_tag_read_tag
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
  reg [31:0] _RAND_8;
  reg [31:0] _RAND_9;
  reg [31:0] _RAND_10;
  reg [31:0] _RAND_11;
  reg [31:0] _RAND_12;
  reg [31:0] _RAND_13;
  reg [31:0] _RAND_14;
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
  reg [31:0] _RAND_26;
  reg [31:0] _RAND_27;
  reg [31:0] _RAND_28;
  reg [31:0] _RAND_29;
  reg [31:0] _RAND_30;
  reg [31:0] _RAND_31;
`endif // RANDOMIZE_REG_INIT
  reg  tag_mem_0_valid; // @[cache.scala 92:26]
  reg  tag_mem_0_dirty; // @[cache.scala 92:26]
  reg [7:0] tag_mem_0_visit; // @[cache.scala 92:26]
  reg [21:0] tag_mem_0_tag; // @[cache.scala 92:26]
  reg  tag_mem_1_valid; // @[cache.scala 92:26]
  reg  tag_mem_1_dirty; // @[cache.scala 92:26]
  reg [7:0] tag_mem_1_visit; // @[cache.scala 92:26]
  reg [21:0] tag_mem_1_tag; // @[cache.scala 92:26]
  reg  tag_mem_2_valid; // @[cache.scala 92:26]
  reg  tag_mem_2_dirty; // @[cache.scala 92:26]
  reg [7:0] tag_mem_2_visit; // @[cache.scala 92:26]
  reg [21:0] tag_mem_2_tag; // @[cache.scala 92:26]
  reg  tag_mem_3_valid; // @[cache.scala 92:26]
  reg  tag_mem_3_dirty; // @[cache.scala 92:26]
  reg [7:0] tag_mem_3_visit; // @[cache.scala 92:26]
  reg [21:0] tag_mem_3_tag; // @[cache.scala 92:26]
  reg  tag_mem_4_valid; // @[cache.scala 92:26]
  reg  tag_mem_4_dirty; // @[cache.scala 92:26]
  reg [7:0] tag_mem_4_visit; // @[cache.scala 92:26]
  reg [21:0] tag_mem_4_tag; // @[cache.scala 92:26]
  reg  tag_mem_5_valid; // @[cache.scala 92:26]
  reg  tag_mem_5_dirty; // @[cache.scala 92:26]
  reg [7:0] tag_mem_5_visit; // @[cache.scala 92:26]
  reg [21:0] tag_mem_5_tag; // @[cache.scala 92:26]
  reg  tag_mem_6_valid; // @[cache.scala 92:26]
  reg  tag_mem_6_dirty; // @[cache.scala 92:26]
  reg [7:0] tag_mem_6_visit; // @[cache.scala 92:26]
  reg [21:0] tag_mem_6_tag; // @[cache.scala 92:26]
  reg  tag_mem_7_valid; // @[cache.scala 92:26]
  reg  tag_mem_7_dirty; // @[cache.scala 92:26]
  reg [7:0] tag_mem_7_visit; // @[cache.scala 92:26]
  reg [21:0] tag_mem_7_tag; // @[cache.scala 92:26]
  wire [21:0] _GEN_1 = 3'h1 == io_cache_req_index ? tag_mem_1_tag : tag_mem_0_tag; // @[cache.scala 94:{21,21}]
  wire [21:0] _GEN_2 = 3'h2 == io_cache_req_index ? tag_mem_2_tag : _GEN_1; // @[cache.scala 94:{21,21}]
  wire [21:0] _GEN_3 = 3'h3 == io_cache_req_index ? tag_mem_3_tag : _GEN_2; // @[cache.scala 94:{21,21}]
  wire [21:0] _GEN_4 = 3'h4 == io_cache_req_index ? tag_mem_4_tag : _GEN_3; // @[cache.scala 94:{21,21}]
  wire [21:0] _GEN_5 = 3'h5 == io_cache_req_index ? tag_mem_5_tag : _GEN_4; // @[cache.scala 94:{21,21}]
  wire [21:0] _GEN_6 = 3'h6 == io_cache_req_index ? tag_mem_6_tag : _GEN_5; // @[cache.scala 94:{21,21}]
  wire [7:0] _GEN_9 = 3'h1 == io_cache_req_index ? tag_mem_1_visit : tag_mem_0_visit; // @[cache.scala 94:{21,21}]
  wire [7:0] _GEN_10 = 3'h2 == io_cache_req_index ? tag_mem_2_visit : _GEN_9; // @[cache.scala 94:{21,21}]
  wire [7:0] _GEN_11 = 3'h3 == io_cache_req_index ? tag_mem_3_visit : _GEN_10; // @[cache.scala 94:{21,21}]
  wire [7:0] _GEN_12 = 3'h4 == io_cache_req_index ? tag_mem_4_visit : _GEN_11; // @[cache.scala 94:{21,21}]
  wire [7:0] _GEN_13 = 3'h5 == io_cache_req_index ? tag_mem_5_visit : _GEN_12; // @[cache.scala 94:{21,21}]
  wire [7:0] _GEN_14 = 3'h6 == io_cache_req_index ? tag_mem_6_visit : _GEN_13; // @[cache.scala 94:{21,21}]
  wire  _GEN_17 = 3'h1 == io_cache_req_index ? tag_mem_1_dirty : tag_mem_0_dirty; // @[cache.scala 94:{21,21}]
  wire  _GEN_18 = 3'h2 == io_cache_req_index ? tag_mem_2_dirty : _GEN_17; // @[cache.scala 94:{21,21}]
  wire  _GEN_19 = 3'h3 == io_cache_req_index ? tag_mem_3_dirty : _GEN_18; // @[cache.scala 94:{21,21}]
  wire  _GEN_20 = 3'h4 == io_cache_req_index ? tag_mem_4_dirty : _GEN_19; // @[cache.scala 94:{21,21}]
  wire  _GEN_21 = 3'h5 == io_cache_req_index ? tag_mem_5_dirty : _GEN_20; // @[cache.scala 94:{21,21}]
  wire  _GEN_22 = 3'h6 == io_cache_req_index ? tag_mem_6_dirty : _GEN_21; // @[cache.scala 94:{21,21}]
  wire  _GEN_25 = 3'h1 == io_cache_req_index ? tag_mem_1_valid : tag_mem_0_valid; // @[cache.scala 94:{21,21}]
  wire  _GEN_26 = 3'h2 == io_cache_req_index ? tag_mem_2_valid : _GEN_25; // @[cache.scala 94:{21,21}]
  wire  _GEN_27 = 3'h3 == io_cache_req_index ? tag_mem_3_valid : _GEN_26; // @[cache.scala 94:{21,21}]
  wire  _GEN_28 = 3'h4 == io_cache_req_index ? tag_mem_4_valid : _GEN_27; // @[cache.scala 94:{21,21}]
  wire  _GEN_29 = 3'h5 == io_cache_req_index ? tag_mem_5_valid : _GEN_28; // @[cache.scala 94:{21,21}]
  wire  _GEN_30 = 3'h6 == io_cache_req_index ? tag_mem_6_valid : _GEN_29; // @[cache.scala 94:{21,21}]
  assign io_tag_read_valid = 3'h7 == io_cache_req_index ? tag_mem_7_valid : _GEN_30; // @[cache.scala 94:{21,21}]
  assign io_tag_read_dirty = 3'h7 == io_cache_req_index ? tag_mem_7_dirty : _GEN_22; // @[cache.scala 94:{21,21}]
  assign io_tag_read_visit = 3'h7 == io_cache_req_index ? tag_mem_7_visit : _GEN_14; // @[cache.scala 94:{21,21}]
  assign io_tag_read_tag = 3'h7 == io_cache_req_index ? tag_mem_7_tag : _GEN_6; // @[cache.scala 94:{21,21}]
  always @(posedge clock) begin
    if (io_cache_req_we) begin // @[cache.scala 96:30]
      if (3'h0 == io_cache_req_index) begin // @[cache.scala 98:45]
        tag_mem_0_valid <= io_tag_write_valid; // @[cache.scala 98:45]
      end
    end
    if (io_cache_req_we) begin // @[cache.scala 96:30]
      if (3'h0 == io_cache_req_index) begin // @[cache.scala 98:45]
        tag_mem_0_dirty <= io_tag_write_dirty; // @[cache.scala 98:45]
      end
    end
    if (io_cache_req_we) begin // @[cache.scala 96:30]
      if (3'h0 == io_cache_req_index) begin // @[cache.scala 98:45]
        tag_mem_0_visit <= io_tag_write_visit; // @[cache.scala 98:45]
      end
    end
    if (io_cache_req_we) begin // @[cache.scala 96:30]
      if (3'h0 == io_cache_req_index) begin // @[cache.scala 98:45]
        tag_mem_0_tag <= io_tag_write_tag; // @[cache.scala 98:45]
      end
    end
    if (io_cache_req_we) begin // @[cache.scala 96:30]
      if (3'h1 == io_cache_req_index) begin // @[cache.scala 98:45]
        tag_mem_1_valid <= io_tag_write_valid; // @[cache.scala 98:45]
      end
    end
    if (io_cache_req_we) begin // @[cache.scala 96:30]
      if (3'h1 == io_cache_req_index) begin // @[cache.scala 98:45]
        tag_mem_1_dirty <= io_tag_write_dirty; // @[cache.scala 98:45]
      end
    end
    if (io_cache_req_we) begin // @[cache.scala 96:30]
      if (3'h1 == io_cache_req_index) begin // @[cache.scala 98:45]
        tag_mem_1_visit <= io_tag_write_visit; // @[cache.scala 98:45]
      end
    end
    if (io_cache_req_we) begin // @[cache.scala 96:30]
      if (3'h1 == io_cache_req_index) begin // @[cache.scala 98:45]
        tag_mem_1_tag <= io_tag_write_tag; // @[cache.scala 98:45]
      end
    end
    if (io_cache_req_we) begin // @[cache.scala 96:30]
      if (3'h2 == io_cache_req_index) begin // @[cache.scala 98:45]
        tag_mem_2_valid <= io_tag_write_valid; // @[cache.scala 98:45]
      end
    end
    if (io_cache_req_we) begin // @[cache.scala 96:30]
      if (3'h2 == io_cache_req_index) begin // @[cache.scala 98:45]
        tag_mem_2_dirty <= io_tag_write_dirty; // @[cache.scala 98:45]
      end
    end
    if (io_cache_req_we) begin // @[cache.scala 96:30]
      if (3'h2 == io_cache_req_index) begin // @[cache.scala 98:45]
        tag_mem_2_visit <= io_tag_write_visit; // @[cache.scala 98:45]
      end
    end
    if (io_cache_req_we) begin // @[cache.scala 96:30]
      if (3'h2 == io_cache_req_index) begin // @[cache.scala 98:45]
        tag_mem_2_tag <= io_tag_write_tag; // @[cache.scala 98:45]
      end
    end
    if (io_cache_req_we) begin // @[cache.scala 96:30]
      if (3'h3 == io_cache_req_index) begin // @[cache.scala 98:45]
        tag_mem_3_valid <= io_tag_write_valid; // @[cache.scala 98:45]
      end
    end
    if (io_cache_req_we) begin // @[cache.scala 96:30]
      if (3'h3 == io_cache_req_index) begin // @[cache.scala 98:45]
        tag_mem_3_dirty <= io_tag_write_dirty; // @[cache.scala 98:45]
      end
    end
    if (io_cache_req_we) begin // @[cache.scala 96:30]
      if (3'h3 == io_cache_req_index) begin // @[cache.scala 98:45]
        tag_mem_3_visit <= io_tag_write_visit; // @[cache.scala 98:45]
      end
    end
    if (io_cache_req_we) begin // @[cache.scala 96:30]
      if (3'h3 == io_cache_req_index) begin // @[cache.scala 98:45]
        tag_mem_3_tag <= io_tag_write_tag; // @[cache.scala 98:45]
      end
    end
    if (io_cache_req_we) begin // @[cache.scala 96:30]
      if (3'h4 == io_cache_req_index) begin // @[cache.scala 98:45]
        tag_mem_4_valid <= io_tag_write_valid; // @[cache.scala 98:45]
      end
    end
    if (io_cache_req_we) begin // @[cache.scala 96:30]
      if (3'h4 == io_cache_req_index) begin // @[cache.scala 98:45]
        tag_mem_4_dirty <= io_tag_write_dirty; // @[cache.scala 98:45]
      end
    end
    if (io_cache_req_we) begin // @[cache.scala 96:30]
      if (3'h4 == io_cache_req_index) begin // @[cache.scala 98:45]
        tag_mem_4_visit <= io_tag_write_visit; // @[cache.scala 98:45]
      end
    end
    if (io_cache_req_we) begin // @[cache.scala 96:30]
      if (3'h4 == io_cache_req_index) begin // @[cache.scala 98:45]
        tag_mem_4_tag <= io_tag_write_tag; // @[cache.scala 98:45]
      end
    end
    if (io_cache_req_we) begin // @[cache.scala 96:30]
      if (3'h5 == io_cache_req_index) begin // @[cache.scala 98:45]
        tag_mem_5_valid <= io_tag_write_valid; // @[cache.scala 98:45]
      end
    end
    if (io_cache_req_we) begin // @[cache.scala 96:30]
      if (3'h5 == io_cache_req_index) begin // @[cache.scala 98:45]
        tag_mem_5_dirty <= io_tag_write_dirty; // @[cache.scala 98:45]
      end
    end
    if (io_cache_req_we) begin // @[cache.scala 96:30]
      if (3'h5 == io_cache_req_index) begin // @[cache.scala 98:45]
        tag_mem_5_visit <= io_tag_write_visit; // @[cache.scala 98:45]
      end
    end
    if (io_cache_req_we) begin // @[cache.scala 96:30]
      if (3'h5 == io_cache_req_index) begin // @[cache.scala 98:45]
        tag_mem_5_tag <= io_tag_write_tag; // @[cache.scala 98:45]
      end
    end
    if (io_cache_req_we) begin // @[cache.scala 96:30]
      if (3'h6 == io_cache_req_index) begin // @[cache.scala 98:45]
        tag_mem_6_valid <= io_tag_write_valid; // @[cache.scala 98:45]
      end
    end
    if (io_cache_req_we) begin // @[cache.scala 96:30]
      if (3'h6 == io_cache_req_index) begin // @[cache.scala 98:45]
        tag_mem_6_dirty <= io_tag_write_dirty; // @[cache.scala 98:45]
      end
    end
    if (io_cache_req_we) begin // @[cache.scala 96:30]
      if (3'h6 == io_cache_req_index) begin // @[cache.scala 98:45]
        tag_mem_6_visit <= io_tag_write_visit; // @[cache.scala 98:45]
      end
    end
    if (io_cache_req_we) begin // @[cache.scala 96:30]
      if (3'h6 == io_cache_req_index) begin // @[cache.scala 98:45]
        tag_mem_6_tag <= io_tag_write_tag; // @[cache.scala 98:45]
      end
    end
    if (io_cache_req_we) begin // @[cache.scala 96:30]
      if (3'h7 == io_cache_req_index) begin // @[cache.scala 98:45]
        tag_mem_7_valid <= io_tag_write_valid; // @[cache.scala 98:45]
      end
    end
    if (io_cache_req_we) begin // @[cache.scala 96:30]
      if (3'h7 == io_cache_req_index) begin // @[cache.scala 98:45]
        tag_mem_7_dirty <= io_tag_write_dirty; // @[cache.scala 98:45]
      end
    end
    if (io_cache_req_we) begin // @[cache.scala 96:30]
      if (3'h7 == io_cache_req_index) begin // @[cache.scala 98:45]
        tag_mem_7_visit <= io_tag_write_visit; // @[cache.scala 98:45]
      end
    end
    if (io_cache_req_we) begin // @[cache.scala 96:30]
      if (3'h7 == io_cache_req_index) begin // @[cache.scala 98:45]
        tag_mem_7_tag <= io_tag_write_tag; // @[cache.scala 98:45]
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
  tag_mem_0_valid = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  tag_mem_0_dirty = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  tag_mem_0_visit = _RAND_2[7:0];
  _RAND_3 = {1{`RANDOM}};
  tag_mem_0_tag = _RAND_3[21:0];
  _RAND_4 = {1{`RANDOM}};
  tag_mem_1_valid = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  tag_mem_1_dirty = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  tag_mem_1_visit = _RAND_6[7:0];
  _RAND_7 = {1{`RANDOM}};
  tag_mem_1_tag = _RAND_7[21:0];
  _RAND_8 = {1{`RANDOM}};
  tag_mem_2_valid = _RAND_8[0:0];
  _RAND_9 = {1{`RANDOM}};
  tag_mem_2_dirty = _RAND_9[0:0];
  _RAND_10 = {1{`RANDOM}};
  tag_mem_2_visit = _RAND_10[7:0];
  _RAND_11 = {1{`RANDOM}};
  tag_mem_2_tag = _RAND_11[21:0];
  _RAND_12 = {1{`RANDOM}};
  tag_mem_3_valid = _RAND_12[0:0];
  _RAND_13 = {1{`RANDOM}};
  tag_mem_3_dirty = _RAND_13[0:0];
  _RAND_14 = {1{`RANDOM}};
  tag_mem_3_visit = _RAND_14[7:0];
  _RAND_15 = {1{`RANDOM}};
  tag_mem_3_tag = _RAND_15[21:0];
  _RAND_16 = {1{`RANDOM}};
  tag_mem_4_valid = _RAND_16[0:0];
  _RAND_17 = {1{`RANDOM}};
  tag_mem_4_dirty = _RAND_17[0:0];
  _RAND_18 = {1{`RANDOM}};
  tag_mem_4_visit = _RAND_18[7:0];
  _RAND_19 = {1{`RANDOM}};
  tag_mem_4_tag = _RAND_19[21:0];
  _RAND_20 = {1{`RANDOM}};
  tag_mem_5_valid = _RAND_20[0:0];
  _RAND_21 = {1{`RANDOM}};
  tag_mem_5_dirty = _RAND_21[0:0];
  _RAND_22 = {1{`RANDOM}};
  tag_mem_5_visit = _RAND_22[7:0];
  _RAND_23 = {1{`RANDOM}};
  tag_mem_5_tag = _RAND_23[21:0];
  _RAND_24 = {1{`RANDOM}};
  tag_mem_6_valid = _RAND_24[0:0];
  _RAND_25 = {1{`RANDOM}};
  tag_mem_6_dirty = _RAND_25[0:0];
  _RAND_26 = {1{`RANDOM}};
  tag_mem_6_visit = _RAND_26[7:0];
  _RAND_27 = {1{`RANDOM}};
  tag_mem_6_tag = _RAND_27[21:0];
  _RAND_28 = {1{`RANDOM}};
  tag_mem_7_valid = _RAND_28[0:0];
  _RAND_29 = {1{`RANDOM}};
  tag_mem_7_dirty = _RAND_29[0:0];
  _RAND_30 = {1{`RANDOM}};
  tag_mem_7_visit = _RAND_30[7:0];
  _RAND_31 = {1{`RANDOM}};
  tag_mem_7_tag = _RAND_31[21:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module data_cache(
  input           clock,
  input  [2:0]    io_cache_req_index,
  input  [2:0]    io_cache_req_write_index,
  input           io_cache_req_we,
  input  [1023:0] io_data_write_data,
  output [1023:0] io_data_read_data
);
`ifdef RANDOMIZE_MEM_INIT
  reg [1023:0] _RAND_0;
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [1023:0] _RAND_3;
  reg [31:0] _RAND_4;
`endif // RANDOMIZE_REG_INIT
  reg [1023:0] data_mem_data [0:7]; // @[cache.scala 114:35]
  wire  data_mem_data_readData_en; // @[cache.scala 114:35]
  wire [2:0] data_mem_data_readData_addr; // @[cache.scala 114:35]
  wire [1023:0] data_mem_data_readData_data; // @[cache.scala 114:35]
  wire [1023:0] data_mem_data_MPORT_data; // @[cache.scala 114:35]
  wire [2:0] data_mem_data_MPORT_addr; // @[cache.scala 114:35]
  wire  data_mem_data_MPORT_mask; // @[cache.scala 114:35]
  wire  data_mem_data_MPORT_en; // @[cache.scala 114:35]
  reg  data_mem_data_readData_en_pipe_0;
  reg [2:0] data_mem_data_readData_addr_pipe_0;
  reg [1023:0] wDataReg_data; // @[cache.scala 115:31]
  reg  doForwardReg; // @[cache.scala 116:35]
  assign data_mem_data_readData_en = data_mem_data_readData_en_pipe_0;
  assign data_mem_data_readData_addr = data_mem_data_readData_addr_pipe_0;
  assign data_mem_data_readData_data = data_mem_data[data_mem_data_readData_addr]; // @[cache.scala 114:35]
  assign data_mem_data_MPORT_data = io_data_write_data;
  assign data_mem_data_MPORT_addr = io_cache_req_write_index;
  assign data_mem_data_MPORT_mask = 1'h1;
  assign data_mem_data_MPORT_en = io_cache_req_we;
  assign io_data_read_data = doForwardReg ? wDataReg_data : data_mem_data_readData_data; // @[cache.scala 120:28]
  always @(posedge clock) begin
    if (data_mem_data_MPORT_en & data_mem_data_MPORT_mask) begin
      data_mem_data[data_mem_data_MPORT_addr] <= data_mem_data_MPORT_data; // @[cache.scala 114:35]
    end
    data_mem_data_readData_en_pipe_0 <= 1'h1;
    if (1'h1) begin
      data_mem_data_readData_addr_pipe_0 <= io_cache_req_index;
    end
    wDataReg_data <= io_data_write_data; // @[cache.scala 115:31]
    doForwardReg <= io_cache_req_write_index == io_cache_req_index & io_cache_req_we; // @[cache.scala 116:86]
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
`ifdef RANDOMIZE_MEM_INIT
  _RAND_0 = {32{`RANDOM}};
  for (initvar = 0; initvar < 8; initvar = initvar+1)
    data_mem_data[initvar] = _RAND_0[1023:0];
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  data_mem_data_readData_en_pipe_0 = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  data_mem_data_readData_addr_pipe_0 = _RAND_2[2:0];
  _RAND_3 = {32{`RANDOM}};
  wDataReg_data = _RAND_3[1023:0];
  _RAND_4 = {1{`RANDOM}};
  doForwardReg = _RAND_4[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module Cache(
  input         clock,
  input         reset,
  input  [31:0] io_cpu_request_addr,
  input  [63:0] io_cpu_request_data,
  input  [7:0]  io_cpu_request_mask,
  input         io_cpu_request_rw,
  input         io_cpu_request_valid,
  output [63:0] io_cpu_response_data,
  output        io_cpu_response_ready,
  input         io_mem_io_aw_ready,
  output        io_mem_io_aw_valid,
  output [31:0] io_mem_io_aw_bits_addr,
  output [7:0]  io_mem_io_aw_bits_len,
  input         io_mem_io_w_ready,
  output        io_mem_io_w_valid,
  output [63:0] io_mem_io_w_bits_data,
  output [7:0]  io_mem_io_w_bits_strb,
  output        io_mem_io_w_bits_last,
  output        io_mem_io_b_ready,
  input         io_mem_io_b_valid,
  input         io_mem_io_ar_ready,
  output        io_mem_io_ar_valid,
  output [31:0] io_mem_io_ar_bits_addr,
  output [7:0]  io_mem_io_ar_bits_len,
  output        io_mem_io_r_ready,
  input         io_mem_io_r_valid,
  input  [63:0] io_mem_io_r_bits_data,
  input         io_mem_io_r_bits_last
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [63:0] _RAND_6;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
`endif // RANDOMIZE_REG_INIT
  wire  tag_mem_0_clock; // @[cache.scala 175:45]
  wire [2:0] tag_mem_0_io_cache_req_index; // @[cache.scala 175:45]
  wire  tag_mem_0_io_cache_req_we; // @[cache.scala 175:45]
  wire  tag_mem_0_io_tag_write_valid; // @[cache.scala 175:45]
  wire  tag_mem_0_io_tag_write_dirty; // @[cache.scala 175:45]
  wire [7:0] tag_mem_0_io_tag_write_visit; // @[cache.scala 175:45]
  wire [21:0] tag_mem_0_io_tag_write_tag; // @[cache.scala 175:45]
  wire  tag_mem_0_io_tag_read_valid; // @[cache.scala 175:45]
  wire  tag_mem_0_io_tag_read_dirty; // @[cache.scala 175:45]
  wire [7:0] tag_mem_0_io_tag_read_visit; // @[cache.scala 175:45]
  wire [21:0] tag_mem_0_io_tag_read_tag; // @[cache.scala 175:45]
  wire  tag_mem_1_clock; // @[cache.scala 175:45]
  wire [2:0] tag_mem_1_io_cache_req_index; // @[cache.scala 175:45]
  wire  tag_mem_1_io_cache_req_we; // @[cache.scala 175:45]
  wire  tag_mem_1_io_tag_write_valid; // @[cache.scala 175:45]
  wire  tag_mem_1_io_tag_write_dirty; // @[cache.scala 175:45]
  wire [7:0] tag_mem_1_io_tag_write_visit; // @[cache.scala 175:45]
  wire [21:0] tag_mem_1_io_tag_write_tag; // @[cache.scala 175:45]
  wire  tag_mem_1_io_tag_read_valid; // @[cache.scala 175:45]
  wire  tag_mem_1_io_tag_read_dirty; // @[cache.scala 175:45]
  wire [7:0] tag_mem_1_io_tag_read_visit; // @[cache.scala 175:45]
  wire [21:0] tag_mem_1_io_tag_read_tag; // @[cache.scala 175:45]
  wire  tag_mem_2_clock; // @[cache.scala 175:45]
  wire [2:0] tag_mem_2_io_cache_req_index; // @[cache.scala 175:45]
  wire  tag_mem_2_io_cache_req_we; // @[cache.scala 175:45]
  wire  tag_mem_2_io_tag_write_valid; // @[cache.scala 175:45]
  wire  tag_mem_2_io_tag_write_dirty; // @[cache.scala 175:45]
  wire [7:0] tag_mem_2_io_tag_write_visit; // @[cache.scala 175:45]
  wire [21:0] tag_mem_2_io_tag_write_tag; // @[cache.scala 175:45]
  wire  tag_mem_2_io_tag_read_valid; // @[cache.scala 175:45]
  wire  tag_mem_2_io_tag_read_dirty; // @[cache.scala 175:45]
  wire [7:0] tag_mem_2_io_tag_read_visit; // @[cache.scala 175:45]
  wire [21:0] tag_mem_2_io_tag_read_tag; // @[cache.scala 175:45]
  wire  tag_mem_3_clock; // @[cache.scala 175:45]
  wire [2:0] tag_mem_3_io_cache_req_index; // @[cache.scala 175:45]
  wire  tag_mem_3_io_cache_req_we; // @[cache.scala 175:45]
  wire  tag_mem_3_io_tag_write_valid; // @[cache.scala 175:45]
  wire  tag_mem_3_io_tag_write_dirty; // @[cache.scala 175:45]
  wire [7:0] tag_mem_3_io_tag_write_visit; // @[cache.scala 175:45]
  wire [21:0] tag_mem_3_io_tag_write_tag; // @[cache.scala 175:45]
  wire  tag_mem_3_io_tag_read_valid; // @[cache.scala 175:45]
  wire  tag_mem_3_io_tag_read_dirty; // @[cache.scala 175:45]
  wire [7:0] tag_mem_3_io_tag_read_visit; // @[cache.scala 175:45]
  wire [21:0] tag_mem_3_io_tag_read_tag; // @[cache.scala 175:45]
  wire  data_mem_0_clock; // @[cache.scala 176:46]
  wire [2:0] data_mem_0_io_cache_req_index; // @[cache.scala 176:46]
  wire [2:0] data_mem_0_io_cache_req_write_index; // @[cache.scala 176:46]
  wire  data_mem_0_io_cache_req_we; // @[cache.scala 176:46]
  wire [1023:0] data_mem_0_io_data_write_data; // @[cache.scala 176:46]
  wire [1023:0] data_mem_0_io_data_read_data; // @[cache.scala 176:46]
  wire  data_mem_1_clock; // @[cache.scala 176:46]
  wire [2:0] data_mem_1_io_cache_req_index; // @[cache.scala 176:46]
  wire [2:0] data_mem_1_io_cache_req_write_index; // @[cache.scala 176:46]
  wire  data_mem_1_io_cache_req_we; // @[cache.scala 176:46]
  wire [1023:0] data_mem_1_io_data_write_data; // @[cache.scala 176:46]
  wire [1023:0] data_mem_1_io_data_read_data; // @[cache.scala 176:46]
  wire  data_mem_2_clock; // @[cache.scala 176:46]
  wire [2:0] data_mem_2_io_cache_req_index; // @[cache.scala 176:46]
  wire [2:0] data_mem_2_io_cache_req_write_index; // @[cache.scala 176:46]
  wire  data_mem_2_io_cache_req_we; // @[cache.scala 176:46]
  wire [1023:0] data_mem_2_io_data_write_data; // @[cache.scala 176:46]
  wire [1023:0] data_mem_2_io_data_read_data; // @[cache.scala 176:46]
  wire  data_mem_3_clock; // @[cache.scala 176:46]
  wire [2:0] data_mem_3_io_cache_req_index; // @[cache.scala 176:46]
  wire [2:0] data_mem_3_io_cache_req_write_index; // @[cache.scala 176:46]
  wire  data_mem_3_io_cache_req_we; // @[cache.scala 176:46]
  wire [1023:0] data_mem_3_io_data_write_data; // @[cache.scala 176:46]
  wire [1023:0] data_mem_3_io_data_read_data; // @[cache.scala 176:46]
  reg [3:0] cache_state; // @[cache.scala 173:34]
  reg [3:0] index; // @[Counter.scala 62:40]
  wire  wrap_wrap = index == 4'hf; // @[Counter.scala 74:24]
  wire [3:0] _wrap_value_T_1 = index + 4'h1; // @[Counter.scala 78:24]
  wire  _GEN_1218 = 4'h8 == cache_state & io_mem_io_w_ready; // @[cache.scala 330:28 707:39]
  wire  _GEN_1244 = 4'hb == cache_state ? 1'h0 : _GEN_1218; // @[cache.scala 330:28]
  wire  _GEN_1293 = 4'h9 == cache_state ? io_mem_io_r_ready : _GEN_1244; // @[cache.scala 330:28 655:39]
  wire  _GEN_1332 = 4'ha == cache_state ? 1'h0 : _GEN_1293; // @[cache.scala 330:28]
  wire  _GEN_1415 = 4'h7 == cache_state ? 1'h0 : _GEN_1332; // @[cache.scala 330:28]
  wire  _GEN_1499 = 4'h5 == cache_state ? 1'h0 : _GEN_1415; // @[cache.scala 330:28]
  wire  _GEN_1586 = 4'h4 == cache_state ? 1'h0 : _GEN_1499; // @[cache.scala 330:28]
  wire  _GEN_1670 = 4'h3 == cache_state ? 1'h0 : _GEN_1586; // @[cache.scala 330:28]
  wire  _GEN_1757 = 4'h2 == cache_state ? 1'h0 : _GEN_1670; // @[cache.scala 330:28]
  wire  _GEN_1841 = 4'h1 == cache_state ? 1'h0 : _GEN_1757; // @[cache.scala 330:28]
  wire  fill_block_en = 4'h0 == cache_state ? 1'h0 : _GEN_1841; // @[cache.scala 330:28]
  wire [3:0] _GEN_0 = fill_block_en ? _wrap_value_T_1 : index; // @[Counter.scala 120:16 78:15 62:40]
  wire  last = fill_block_en & wrap_wrap; // @[Counter.scala 120:{16,23}]
  reg [1:0] replace; // @[cache.scala 183:30]
  reg [31:0] refill_addr; // @[cache.scala 184:34]
  reg [31:0] writeback_addr; // @[cache.scala 186:37]
  reg [31:0] cpu_request_addr_reg; // @[cache.scala 191:43]
  reg [63:0] cpu_request_data; // @[cache.scala 192:39]
  reg [7:0] cpu_request_mask; // @[cache.scala 193:39]
  reg  cpu_request_rw; // @[cache.scala 194:37]
  wire [31:0] _cpu_request_addr_reg_T_1 = {io_cpu_request_addr[31:3],3'h0}; // @[Cat.scala 31:58]
  wire [2:0] cpu_request_addr_index = cpu_request_addr_reg[9:7]; // @[cache.scala 208:58]
  wire [21:0] cpu_request_addr_tag = cpu_request_addr_reg[31:10]; // @[cache.scala 209:56]
  wire  _T_6 = io_cpu_request_valid & io_cpu_request_addr >= 32'h80000000 & io_cpu_request_addr <= 32'h88000000; // @[cache.scala 334:91]
  wire [1:0] _GEN_2 = io_cpu_request_rw ? 2'h2 : 2'h1; // @[cache.scala 339:56 340:52 342:52]
  wire [1:0] _GEN_3 = io_cpu_request_valid ? _GEN_2 : 2'h0; // @[cache.scala 338:57 345:44]
  wire [2:0] _GEN_4 = io_cpu_request_valid & io_cpu_request_addr >= 32'h80000000 & io_cpu_request_addr <= 32'h88000000
     ? 3'h7 : {{1'd0}, _GEN_3}; // @[cache.scala 334:131 335:44]
  wire [1:0] _GEN_5 = io_mem_io_ar_ready ? 2'h3 : 2'h1; // @[cache.scala 353:36 355:49 357:44]
  wire [2:0] _GEN_6 = io_mem_io_aw_ready ? 3'h4 : 3'h2; // @[cache.scala 365:36 367:49 368:44]
  wire [1:0] _GEN_7 = io_mem_io_r_valid ? 2'h0 : 2'h3; // @[cache.scala 376:48 377:44 380:44]
  wire [2:0] _GEN_9 = io_mem_io_w_ready ? 3'h5 : 3'h4; // @[cache.scala 390:48 391:44 393:44]
  wire [2:0] _GEN_11 = io_mem_io_b_valid ? 3'h0 : 3'h5; // @[cache.scala 399:48 401:44 403:44]
  wire  is_match_0 = tag_mem_0_io_tag_read_tag == cpu_request_addr_tag & tag_mem_0_io_tag_read_valid; // @[cache.scala 412:104]
  wire  is_match_1 = tag_mem_1_io_tag_read_tag == cpu_request_addr_tag & tag_mem_1_io_tag_read_valid; // @[cache.scala 412:104]
  wire  is_match_2 = tag_mem_2_io_tag_read_tag == cpu_request_addr_tag & tag_mem_2_io_tag_read_valid; // @[cache.scala 412:104]
  wire  is_match_3 = tag_mem_3_io_tag_read_tag == cpu_request_addr_tag & tag_mem_3_io_tag_read_valid; // @[cache.scala 412:104]
  wire  _T_27 = is_match_0 | is_match_1 | is_match_2 | is_match_3; // @[cache.scala 425:47]
  wire [63:0] _GEN_13 = 4'h1 == cpu_request_addr_reg[6:3] ? data_mem_2_io_data_read_data[127:64] :
    data_mem_2_io_data_read_data[63:0]; // @[Mux.scala 101:{16,16}]
  wire [63:0] _GEN_14 = 4'h2 == cpu_request_addr_reg[6:3] ? data_mem_2_io_data_read_data[191:128] : _GEN_13; // @[Mux.scala 101:{16,16}]
  wire [63:0] _GEN_15 = 4'h3 == cpu_request_addr_reg[6:3] ? data_mem_2_io_data_read_data[255:192] : _GEN_14; // @[Mux.scala 101:{16,16}]
  wire [63:0] _GEN_16 = 4'h4 == cpu_request_addr_reg[6:3] ? data_mem_2_io_data_read_data[319:256] : _GEN_15; // @[Mux.scala 101:{16,16}]
  wire [63:0] _GEN_17 = 4'h5 == cpu_request_addr_reg[6:3] ? data_mem_2_io_data_read_data[383:320] : _GEN_16; // @[Mux.scala 101:{16,16}]
  wire [63:0] _GEN_18 = 4'h6 == cpu_request_addr_reg[6:3] ? data_mem_2_io_data_read_data[447:384] : _GEN_17; // @[Mux.scala 101:{16,16}]
  wire [63:0] _GEN_19 = 4'h7 == cpu_request_addr_reg[6:3] ? data_mem_2_io_data_read_data[511:448] : _GEN_18; // @[Mux.scala 101:{16,16}]
  wire [63:0] _GEN_20 = 4'h8 == cpu_request_addr_reg[6:3] ? data_mem_2_io_data_read_data[575:512] : _GEN_19; // @[Mux.scala 101:{16,16}]
  wire [63:0] _GEN_21 = 4'h9 == cpu_request_addr_reg[6:3] ? data_mem_2_io_data_read_data[639:576] : _GEN_20; // @[Mux.scala 101:{16,16}]
  wire [63:0] _GEN_22 = 4'ha == cpu_request_addr_reg[6:3] ? data_mem_2_io_data_read_data[703:640] : _GEN_21; // @[Mux.scala 101:{16,16}]
  wire [63:0] _GEN_23 = 4'hb == cpu_request_addr_reg[6:3] ? data_mem_2_io_data_read_data[767:704] : _GEN_22; // @[Mux.scala 101:{16,16}]
  wire [63:0] _GEN_24 = 4'hc == cpu_request_addr_reg[6:3] ? data_mem_2_io_data_read_data[831:768] : _GEN_23; // @[Mux.scala 101:{16,16}]
  wire [63:0] _GEN_25 = 4'hd == cpu_request_addr_reg[6:3] ? data_mem_2_io_data_read_data[895:832] : _GEN_24; // @[Mux.scala 101:{16,16}]
  wire [63:0] _GEN_26 = 4'he == cpu_request_addr_reg[6:3] ? data_mem_2_io_data_read_data[959:896] : _GEN_25; // @[Mux.scala 101:{16,16}]
  wire [63:0] _GEN_27 = 4'hf == cpu_request_addr_reg[6:3] ? data_mem_2_io_data_read_data[1023:960] : _GEN_26; // @[Mux.scala 101:{16,16}]
  wire [63:0] _GEN_29 = 4'h1 == cpu_request_addr_reg[6:3] ? data_mem_3_io_data_read_data[127:64] :
    data_mem_3_io_data_read_data[63:0]; // @[Mux.scala 101:{16,16}]
  wire [63:0] _GEN_30 = 4'h2 == cpu_request_addr_reg[6:3] ? data_mem_3_io_data_read_data[191:128] : _GEN_29; // @[Mux.scala 101:{16,16}]
  wire [63:0] _GEN_31 = 4'h3 == cpu_request_addr_reg[6:3] ? data_mem_3_io_data_read_data[255:192] : _GEN_30; // @[Mux.scala 101:{16,16}]
  wire [63:0] _GEN_32 = 4'h4 == cpu_request_addr_reg[6:3] ? data_mem_3_io_data_read_data[319:256] : _GEN_31; // @[Mux.scala 101:{16,16}]
  wire [63:0] _GEN_33 = 4'h5 == cpu_request_addr_reg[6:3] ? data_mem_3_io_data_read_data[383:320] : _GEN_32; // @[Mux.scala 101:{16,16}]
  wire [63:0] _GEN_34 = 4'h6 == cpu_request_addr_reg[6:3] ? data_mem_3_io_data_read_data[447:384] : _GEN_33; // @[Mux.scala 101:{16,16}]
  wire [63:0] _GEN_35 = 4'h7 == cpu_request_addr_reg[6:3] ? data_mem_3_io_data_read_data[511:448] : _GEN_34; // @[Mux.scala 101:{16,16}]
  wire [63:0] _GEN_36 = 4'h8 == cpu_request_addr_reg[6:3] ? data_mem_3_io_data_read_data[575:512] : _GEN_35; // @[Mux.scala 101:{16,16}]
  wire [63:0] _GEN_37 = 4'h9 == cpu_request_addr_reg[6:3] ? data_mem_3_io_data_read_data[639:576] : _GEN_36; // @[Mux.scala 101:{16,16}]
  wire [63:0] _GEN_38 = 4'ha == cpu_request_addr_reg[6:3] ? data_mem_3_io_data_read_data[703:640] : _GEN_37; // @[Mux.scala 101:{16,16}]
  wire [63:0] _GEN_39 = 4'hb == cpu_request_addr_reg[6:3] ? data_mem_3_io_data_read_data[767:704] : _GEN_38; // @[Mux.scala 101:{16,16}]
  wire [63:0] _GEN_40 = 4'hc == cpu_request_addr_reg[6:3] ? data_mem_3_io_data_read_data[831:768] : _GEN_39; // @[Mux.scala 101:{16,16}]
  wire [63:0] _GEN_41 = 4'hd == cpu_request_addr_reg[6:3] ? data_mem_3_io_data_read_data[895:832] : _GEN_40; // @[Mux.scala 101:{16,16}]
  wire [63:0] _GEN_42 = 4'he == cpu_request_addr_reg[6:3] ? data_mem_3_io_data_read_data[959:896] : _GEN_41; // @[Mux.scala 101:{16,16}]
  wire [63:0] _GEN_43 = 4'hf == cpu_request_addr_reg[6:3] ? data_mem_3_io_data_read_data[1023:960] : _GEN_42; // @[Mux.scala 101:{16,16}]
  wire [63:0] _io_cpu_response_data_T_68 = is_match_2 ? _GEN_27 : _GEN_43; // @[Mux.scala 101:16]
  wire [63:0] _GEN_45 = 4'h1 == cpu_request_addr_reg[6:3] ? data_mem_1_io_data_read_data[127:64] :
    data_mem_1_io_data_read_data[63:0]; // @[Mux.scala 101:{16,16}]
  wire [63:0] _GEN_46 = 4'h2 == cpu_request_addr_reg[6:3] ? data_mem_1_io_data_read_data[191:128] : _GEN_45; // @[Mux.scala 101:{16,16}]
  wire [63:0] _GEN_47 = 4'h3 == cpu_request_addr_reg[6:3] ? data_mem_1_io_data_read_data[255:192] : _GEN_46; // @[Mux.scala 101:{16,16}]
  wire [63:0] _GEN_48 = 4'h4 == cpu_request_addr_reg[6:3] ? data_mem_1_io_data_read_data[319:256] : _GEN_47; // @[Mux.scala 101:{16,16}]
  wire [63:0] _GEN_49 = 4'h5 == cpu_request_addr_reg[6:3] ? data_mem_1_io_data_read_data[383:320] : _GEN_48; // @[Mux.scala 101:{16,16}]
  wire [63:0] _GEN_50 = 4'h6 == cpu_request_addr_reg[6:3] ? data_mem_1_io_data_read_data[447:384] : _GEN_49; // @[Mux.scala 101:{16,16}]
  wire [63:0] _GEN_51 = 4'h7 == cpu_request_addr_reg[6:3] ? data_mem_1_io_data_read_data[511:448] : _GEN_50; // @[Mux.scala 101:{16,16}]
  wire [63:0] _GEN_52 = 4'h8 == cpu_request_addr_reg[6:3] ? data_mem_1_io_data_read_data[575:512] : _GEN_51; // @[Mux.scala 101:{16,16}]
  wire [63:0] _GEN_53 = 4'h9 == cpu_request_addr_reg[6:3] ? data_mem_1_io_data_read_data[639:576] : _GEN_52; // @[Mux.scala 101:{16,16}]
  wire [63:0] _GEN_54 = 4'ha == cpu_request_addr_reg[6:3] ? data_mem_1_io_data_read_data[703:640] : _GEN_53; // @[Mux.scala 101:{16,16}]
  wire [63:0] _GEN_55 = 4'hb == cpu_request_addr_reg[6:3] ? data_mem_1_io_data_read_data[767:704] : _GEN_54; // @[Mux.scala 101:{16,16}]
  wire [63:0] _GEN_56 = 4'hc == cpu_request_addr_reg[6:3] ? data_mem_1_io_data_read_data[831:768] : _GEN_55; // @[Mux.scala 101:{16,16}]
  wire [63:0] _GEN_57 = 4'hd == cpu_request_addr_reg[6:3] ? data_mem_1_io_data_read_data[895:832] : _GEN_56; // @[Mux.scala 101:{16,16}]
  wire [63:0] _GEN_58 = 4'he == cpu_request_addr_reg[6:3] ? data_mem_1_io_data_read_data[959:896] : _GEN_57; // @[Mux.scala 101:{16,16}]
  wire [63:0] _GEN_59 = 4'hf == cpu_request_addr_reg[6:3] ? data_mem_1_io_data_read_data[1023:960] : _GEN_58; // @[Mux.scala 101:{16,16}]
  wire [63:0] _io_cpu_response_data_T_69 = is_match_1 ? _GEN_59 : _io_cpu_response_data_T_68; // @[Mux.scala 101:16]
  wire [63:0] _GEN_61 = 4'h1 == cpu_request_addr_reg[6:3] ? data_mem_0_io_data_read_data[127:64] :
    data_mem_0_io_data_read_data[63:0]; // @[Mux.scala 101:{16,16}]
  wire [63:0] _GEN_62 = 4'h2 == cpu_request_addr_reg[6:3] ? data_mem_0_io_data_read_data[191:128] : _GEN_61; // @[Mux.scala 101:{16,16}]
  wire [63:0] _GEN_63 = 4'h3 == cpu_request_addr_reg[6:3] ? data_mem_0_io_data_read_data[255:192] : _GEN_62; // @[Mux.scala 101:{16,16}]
  wire [63:0] _GEN_64 = 4'h4 == cpu_request_addr_reg[6:3] ? data_mem_0_io_data_read_data[319:256] : _GEN_63; // @[Mux.scala 101:{16,16}]
  wire [63:0] _GEN_65 = 4'h5 == cpu_request_addr_reg[6:3] ? data_mem_0_io_data_read_data[383:320] : _GEN_64; // @[Mux.scala 101:{16,16}]
  wire [63:0] _GEN_66 = 4'h6 == cpu_request_addr_reg[6:3] ? data_mem_0_io_data_read_data[447:384] : _GEN_65; // @[Mux.scala 101:{16,16}]
  wire [63:0] _GEN_67 = 4'h7 == cpu_request_addr_reg[6:3] ? data_mem_0_io_data_read_data[511:448] : _GEN_66; // @[Mux.scala 101:{16,16}]
  wire [63:0] _GEN_68 = 4'h8 == cpu_request_addr_reg[6:3] ? data_mem_0_io_data_read_data[575:512] : _GEN_67; // @[Mux.scala 101:{16,16}]
  wire [63:0] _GEN_69 = 4'h9 == cpu_request_addr_reg[6:3] ? data_mem_0_io_data_read_data[639:576] : _GEN_68; // @[Mux.scala 101:{16,16}]
  wire [63:0] _GEN_70 = 4'ha == cpu_request_addr_reg[6:3] ? data_mem_0_io_data_read_data[703:640] : _GEN_69; // @[Mux.scala 101:{16,16}]
  wire [63:0] _GEN_71 = 4'hb == cpu_request_addr_reg[6:3] ? data_mem_0_io_data_read_data[767:704] : _GEN_70; // @[Mux.scala 101:{16,16}]
  wire [63:0] _GEN_72 = 4'hc == cpu_request_addr_reg[6:3] ? data_mem_0_io_data_read_data[831:768] : _GEN_71; // @[Mux.scala 101:{16,16}]
  wire [63:0] _GEN_73 = 4'hd == cpu_request_addr_reg[6:3] ? data_mem_0_io_data_read_data[895:832] : _GEN_72; // @[Mux.scala 101:{16,16}]
  wire [63:0] _GEN_74 = 4'he == cpu_request_addr_reg[6:3] ? data_mem_0_io_data_read_data[959:896] : _GEN_73; // @[Mux.scala 101:{16,16}]
  wire [63:0] _GEN_75 = 4'hf == cpu_request_addr_reg[6:3] ? data_mem_0_io_data_read_data[1023:960] : _GEN_74; // @[Mux.scala 101:{16,16}]
  wire [63:0] _io_cpu_response_data_T_70 = is_match_0 ? _GEN_75 : _io_cpu_response_data_T_69; // @[Mux.scala 101:16]
  wire  _GEN_76 = cpu_request_rw | tag_mem_0_io_tag_read_dirty; // @[cache.scala 462:69 454:71 463:87]
  wire [7:0] _tag_mem_0_io_tag_write_visit_T = ~tag_mem_0_io_tag_read_visit; // @[cache.scala 467:87]
  wire [7:0] _tag_mem_0_io_tag_write_visit_T_3 = tag_mem_0_io_tag_read_visit + 8'h1; // @[cache.scala 467:186]
  wire [7:0] _tag_mem_0_io_tag_write_visit_T_4 = _tag_mem_0_io_tag_write_visit_T == 8'h0 ? tag_mem_0_io_tag_read_visit
     : _tag_mem_0_io_tag_write_visit_T_3; // @[cache.scala 467:85]
  wire  _GEN_77 = tag_mem_0_io_tag_read_valid; // @[cache.scala 255:44 465:81 466:76]
  wire [7:0] _GEN_78 = tag_mem_0_io_tag_read_valid ? _tag_mem_0_io_tag_write_visit_T_4 : tag_mem_0_io_tag_read_visit; // @[cache.scala 257:41 465:81 467:79]
  wire  _GEN_80 = is_match_0 | _GEN_77; // @[cache.scala 456:58 457:76]
  wire [7:0] _GEN_81 = is_match_0 ? 8'h0 : _GEN_78; // @[cache.scala 456:58 458:79]
  wire  _GEN_83 = is_match_0 ? _GEN_76 : tag_mem_0_io_tag_read_dirty; // @[cache.scala 456:58 454:71]
  wire  _GEN_84 = cpu_request_rw | tag_mem_1_io_tag_read_dirty; // @[cache.scala 462:69 454:71 463:87]
  wire [7:0] _tag_mem_1_io_tag_write_visit_T = ~tag_mem_1_io_tag_read_visit; // @[cache.scala 467:87]
  wire [7:0] _tag_mem_1_io_tag_write_visit_T_3 = tag_mem_1_io_tag_read_visit + 8'h1; // @[cache.scala 467:186]
  wire [7:0] _tag_mem_1_io_tag_write_visit_T_4 = _tag_mem_1_io_tag_write_visit_T == 8'h0 ? tag_mem_1_io_tag_read_visit
     : _tag_mem_1_io_tag_write_visit_T_3; // @[cache.scala 467:85]
  wire  _GEN_85 = tag_mem_1_io_tag_read_valid; // @[cache.scala 255:44 465:81 466:76]
  wire [7:0] _GEN_86 = tag_mem_1_io_tag_read_valid ? _tag_mem_1_io_tag_write_visit_T_4 : tag_mem_1_io_tag_read_visit; // @[cache.scala 257:41 465:81 467:79]
  wire  _GEN_88 = is_match_1 | _GEN_85; // @[cache.scala 456:58 457:76]
  wire [7:0] _GEN_89 = is_match_1 ? 8'h0 : _GEN_86; // @[cache.scala 456:58 458:79]
  wire  _GEN_91 = is_match_1 ? _GEN_84 : tag_mem_1_io_tag_read_dirty; // @[cache.scala 456:58 454:71]
  wire  _GEN_92 = cpu_request_rw | tag_mem_2_io_tag_read_dirty; // @[cache.scala 462:69 454:71 463:87]
  wire [7:0] _tag_mem_2_io_tag_write_visit_T = ~tag_mem_2_io_tag_read_visit; // @[cache.scala 467:87]
  wire [7:0] _tag_mem_2_io_tag_write_visit_T_3 = tag_mem_2_io_tag_read_visit + 8'h1; // @[cache.scala 467:186]
  wire [7:0] _tag_mem_2_io_tag_write_visit_T_4 = _tag_mem_2_io_tag_write_visit_T == 8'h0 ? tag_mem_2_io_tag_read_visit
     : _tag_mem_2_io_tag_write_visit_T_3; // @[cache.scala 467:85]
  wire  _GEN_93 = tag_mem_2_io_tag_read_valid; // @[cache.scala 255:44 465:81 466:76]
  wire [7:0] _GEN_94 = tag_mem_2_io_tag_read_valid ? _tag_mem_2_io_tag_write_visit_T_4 : tag_mem_2_io_tag_read_visit; // @[cache.scala 257:41 465:81 467:79]
  wire  _GEN_96 = is_match_2 | _GEN_93; // @[cache.scala 456:58 457:76]
  wire [7:0] _GEN_97 = is_match_2 ? 8'h0 : _GEN_94; // @[cache.scala 456:58 458:79]
  wire  _GEN_99 = is_match_2 ? _GEN_92 : tag_mem_2_io_tag_read_dirty; // @[cache.scala 456:58 454:71]
  wire  _GEN_100 = cpu_request_rw | tag_mem_3_io_tag_read_dirty; // @[cache.scala 462:69 454:71 463:87]
  wire [7:0] _tag_mem_3_io_tag_write_visit_T = ~tag_mem_3_io_tag_read_visit; // @[cache.scala 467:87]
  wire [7:0] _tag_mem_3_io_tag_write_visit_T_3 = tag_mem_3_io_tag_read_visit + 8'h1; // @[cache.scala 467:186]
  wire [7:0] _tag_mem_3_io_tag_write_visit_T_4 = _tag_mem_3_io_tag_write_visit_T == 8'h0 ? tag_mem_3_io_tag_read_visit
     : _tag_mem_3_io_tag_write_visit_T_3; // @[cache.scala 467:85]
  wire  _GEN_101 = tag_mem_3_io_tag_read_valid; // @[cache.scala 255:44 465:81 466:76]
  wire [7:0] _GEN_102 = tag_mem_3_io_tag_read_valid ? _tag_mem_3_io_tag_write_visit_T_4 : tag_mem_3_io_tag_read_visit; // @[cache.scala 257:41 465:81 467:79]
  wire  _GEN_104 = is_match_3 | _GEN_101; // @[cache.scala 456:58 457:76]
  wire [7:0] _GEN_105 = is_match_3 ? 8'h0 : _GEN_102; // @[cache.scala 456:58 458:79]
  wire  _GEN_107 = is_match_3 ? _GEN_100 : tag_mem_3_io_tag_read_dirty; // @[cache.scala 456:58 454:71]
  wire [1023:0] _GEN_253 = is_match_0 ? data_mem_0_io_data_read_data : 1024'h0; // @[cache.scala 476:66 484:71]
  wire [1023:0] _GEN_425 = is_match_1 ? data_mem_1_io_data_read_data : _GEN_253; // @[cache.scala 476:66 484:71]
  wire [1023:0] _GEN_597 = is_match_2 ? data_mem_2_io_data_read_data : _GEN_425; // @[cache.scala 476:66 484:71]
  wire [1023:0] _GEN_769 = is_match_3 ? data_mem_3_io_data_read_data : _GEN_597; // @[cache.scala 476:66 484:71]
  wire [1023:0] _GEN_797 = cpu_request_rw ? _GEN_769 : 1024'h0; // @[cache.scala 474:53]
  wire [1023:0] _GEN_919 = is_match_0 | is_match_1 | is_match_2 | is_match_3 ? _GEN_797 : 1024'h0; // @[cache.scala 425:51]
  wire [1023:0] _GEN_1365 = 4'h7 == cache_state ? _GEN_919 : 1024'h0; // @[cache.scala 330:28]
  wire [1023:0] _GEN_1450 = 4'h5 == cache_state ? 1024'h0 : _GEN_1365; // @[cache.scala 330:28]
  wire [1023:0] _GEN_1537 = 4'h4 == cache_state ? 1024'h0 : _GEN_1450; // @[cache.scala 330:28]
  wire [1023:0] _GEN_1622 = 4'h3 == cache_state ? 1024'h0 : _GEN_1537; // @[cache.scala 330:28]
  wire [1023:0] _GEN_1709 = 4'h2 == cache_state ? 1024'h0 : _GEN_1622; // @[cache.scala 330:28]
  wire [1023:0] _GEN_1796 = 4'h1 == cache_state ? 1024'h0 : _GEN_1709; // @[cache.scala 330:28]
  wire [1023:0] response_data = 4'h0 == cache_state ? 1024'h0 : _GEN_1796; // @[cache.scala 330:28]
  wire [63:0] _GEN_109 = 4'h1 == cpu_request_addr_reg[6:3] ? response_data[127:64] : response_data[63:0]; // @[cache.scala 490:{233,233}]
  wire [63:0] _GEN_110 = 4'h2 == cpu_request_addr_reg[6:3] ? response_data[191:128] : _GEN_109; // @[cache.scala 490:{233,233}]
  wire [63:0] _GEN_111 = 4'h3 == cpu_request_addr_reg[6:3] ? response_data[255:192] : _GEN_110; // @[cache.scala 490:{233,233}]
  wire [63:0] _GEN_112 = 4'h4 == cpu_request_addr_reg[6:3] ? response_data[319:256] : _GEN_111; // @[cache.scala 490:{233,233}]
  wire [63:0] _GEN_113 = 4'h5 == cpu_request_addr_reg[6:3] ? response_data[383:320] : _GEN_112; // @[cache.scala 490:{233,233}]
  wire [63:0] _GEN_114 = 4'h6 == cpu_request_addr_reg[6:3] ? response_data[447:384] : _GEN_113; // @[cache.scala 490:{233,233}]
  wire [63:0] _GEN_115 = 4'h7 == cpu_request_addr_reg[6:3] ? response_data[511:448] : _GEN_114; // @[cache.scala 490:{233,233}]
  wire [63:0] _GEN_116 = 4'h8 == cpu_request_addr_reg[6:3] ? response_data[575:512] : _GEN_115; // @[cache.scala 490:{233,233}]
  wire [63:0] _GEN_117 = 4'h9 == cpu_request_addr_reg[6:3] ? response_data[639:576] : _GEN_116; // @[cache.scala 490:{233,233}]
  wire [63:0] _GEN_118 = 4'ha == cpu_request_addr_reg[6:3] ? response_data[703:640] : _GEN_117; // @[cache.scala 490:{233,233}]
  wire [63:0] _GEN_119 = 4'hb == cpu_request_addr_reg[6:3] ? response_data[767:704] : _GEN_118; // @[cache.scala 490:{233,233}]
  wire [63:0] _GEN_120 = 4'hc == cpu_request_addr_reg[6:3] ? response_data[831:768] : _GEN_119; // @[cache.scala 490:{233,233}]
  wire [63:0] _GEN_121 = 4'hd == cpu_request_addr_reg[6:3] ? response_data[895:832] : _GEN_120; // @[cache.scala 490:{233,233}]
  wire [63:0] _GEN_122 = 4'he == cpu_request_addr_reg[6:3] ? response_data[959:896] : _GEN_121; // @[cache.scala 490:{233,233}]
  wire [63:0] _GEN_123 = 4'hf == cpu_request_addr_reg[6:3] ? response_data[1023:960] : _GEN_122; // @[cache.scala 490:{233,233}]
  wire [7:0] _part_0_T_22 = cpu_request_mask[0] ? cpu_request_data[7:0] : _GEN_123[7:0]; // @[cache.scala 489:79]
  wire [15:0] _part_1_T_2 = {cpu_request_data[15:8], 8'h0}; // @[cache.scala 489:136]
  wire [15:0] _part_1_T_21 = {_GEN_123[15:8], 8'h0}; // @[cache.scala 490:251]
  wire [15:0] _part_1_T_22 = cpu_request_mask[1] ? _part_1_T_2 : _part_1_T_21; // @[cache.scala 489:79]
  wire [23:0] _part_2_T_2 = {cpu_request_data[23:16], 16'h0}; // @[cache.scala 489:136]
  wire [23:0] _part_2_T_21 = {_GEN_123[23:16], 16'h0}; // @[cache.scala 490:251]
  wire [23:0] _part_2_T_22 = cpu_request_mask[2] ? _part_2_T_2 : _part_2_T_21; // @[cache.scala 489:79]
  wire [31:0] _part_3_T_2 = {cpu_request_data[31:24], 24'h0}; // @[cache.scala 489:136]
  wire [31:0] _part_3_T_21 = {_GEN_123[31:24], 24'h0}; // @[cache.scala 490:251]
  wire [31:0] _part_3_T_22 = cpu_request_mask[3] ? _part_3_T_2 : _part_3_T_21; // @[cache.scala 489:79]
  wire [39:0] _part_4_T_2 = {cpu_request_data[39:32], 32'h0}; // @[cache.scala 489:136]
  wire [39:0] _part_4_T_21 = {_GEN_123[39:32], 32'h0}; // @[cache.scala 490:251]
  wire [39:0] _part_4_T_22 = cpu_request_mask[4] ? _part_4_T_2 : _part_4_T_21; // @[cache.scala 489:79]
  wire [47:0] _part_5_T_2 = {cpu_request_data[47:40], 40'h0}; // @[cache.scala 489:136]
  wire [47:0] _part_5_T_21 = {_GEN_123[47:40], 40'h0}; // @[cache.scala 490:251]
  wire [47:0] _part_5_T_22 = cpu_request_mask[5] ? _part_5_T_2 : _part_5_T_21; // @[cache.scala 489:79]
  wire [55:0] _part_6_T_2 = {cpu_request_data[55:48], 48'h0}; // @[cache.scala 489:136]
  wire [55:0] _part_6_T_21 = {_GEN_123[55:48], 48'h0}; // @[cache.scala 490:251]
  wire [55:0] _part_6_T_22 = cpu_request_mask[6] ? _part_6_T_2 : _part_6_T_21; // @[cache.scala 489:79]
  wire [63:0] _part_7_T_2 = {cpu_request_data[63:56], 56'h0}; // @[cache.scala 489:136]
  wire [63:0] _part_7_T_21 = {_GEN_123[63:56], 56'h0}; // @[cache.scala 490:251]
  wire [63:0] _part_7_T_22 = cpu_request_mask[7] ? _part_7_T_2 : _part_7_T_21; // @[cache.scala 489:79]
  wire [63:0] _GEN_254 = is_match_0 ? {{56'd0}, _part_0_T_22} : 64'h0; // @[cache.scala 215:27 476:66 489:73]
  wire [63:0] _GEN_426 = is_match_1 ? {{56'd0}, _part_0_T_22} : _GEN_254; // @[cache.scala 476:66 489:73]
  wire [63:0] _GEN_598 = is_match_2 ? {{56'd0}, _part_0_T_22} : _GEN_426; // @[cache.scala 476:66 489:73]
  wire [63:0] _GEN_770 = is_match_3 ? {{56'd0}, _part_0_T_22} : _GEN_598; // @[cache.scala 476:66 489:73]
  wire [63:0] _GEN_798 = cpu_request_rw ? _GEN_770 : 64'h0; // @[cache.scala 215:27 474:53]
  wire [63:0] _GEN_920 = is_match_0 | is_match_1 | is_match_2 | is_match_3 ? _GEN_798 : 64'h0; // @[cache.scala 215:27 425:51]
  wire [63:0] _GEN_1366 = 4'h7 == cache_state ? _GEN_920 : 64'h0; // @[cache.scala 215:27 330:28]
  wire [63:0] _GEN_1451 = 4'h5 == cache_state ? 64'h0 : _GEN_1366; // @[cache.scala 215:27 330:28]
  wire [63:0] _GEN_1538 = 4'h4 == cache_state ? 64'h0 : _GEN_1451; // @[cache.scala 215:27 330:28]
  wire [63:0] _GEN_1623 = 4'h3 == cache_state ? 64'h0 : _GEN_1538; // @[cache.scala 215:27 330:28]
  wire [63:0] _GEN_1710 = 4'h2 == cache_state ? 64'h0 : _GEN_1623; // @[cache.scala 215:27 330:28]
  wire [63:0] _GEN_1797 = 4'h1 == cache_state ? 64'h0 : _GEN_1710; // @[cache.scala 215:27 330:28]
  wire [63:0] part_0 = 4'h0 == cache_state ? 64'h0 : _GEN_1797; // @[cache.scala 215:27 330:28]
  wire [63:0] _GEN_255 = is_match_0 ? {{48'd0}, _part_1_T_22} : 64'h0; // @[cache.scala 215:27 476:66 489:73]
  wire [63:0] _GEN_427 = is_match_1 ? {{48'd0}, _part_1_T_22} : _GEN_255; // @[cache.scala 476:66 489:73]
  wire [63:0] _GEN_599 = is_match_2 ? {{48'd0}, _part_1_T_22} : _GEN_427; // @[cache.scala 476:66 489:73]
  wire [63:0] _GEN_771 = is_match_3 ? {{48'd0}, _part_1_T_22} : _GEN_599; // @[cache.scala 476:66 489:73]
  wire [63:0] _GEN_799 = cpu_request_rw ? _GEN_771 : 64'h0; // @[cache.scala 215:27 474:53]
  wire [63:0] _GEN_921 = is_match_0 | is_match_1 | is_match_2 | is_match_3 ? _GEN_799 : 64'h0; // @[cache.scala 215:27 425:51]
  wire [63:0] _GEN_1367 = 4'h7 == cache_state ? _GEN_921 : 64'h0; // @[cache.scala 215:27 330:28]
  wire [63:0] _GEN_1452 = 4'h5 == cache_state ? 64'h0 : _GEN_1367; // @[cache.scala 215:27 330:28]
  wire [63:0] _GEN_1539 = 4'h4 == cache_state ? 64'h0 : _GEN_1452; // @[cache.scala 215:27 330:28]
  wire [63:0] _GEN_1624 = 4'h3 == cache_state ? 64'h0 : _GEN_1539; // @[cache.scala 215:27 330:28]
  wire [63:0] _GEN_1711 = 4'h2 == cache_state ? 64'h0 : _GEN_1624; // @[cache.scala 215:27 330:28]
  wire [63:0] _GEN_1798 = 4'h1 == cache_state ? 64'h0 : _GEN_1711; // @[cache.scala 215:27 330:28]
  wire [63:0] part_1 = 4'h0 == cache_state ? 64'h0 : _GEN_1798; // @[cache.scala 215:27 330:28]
  wire [63:0] _result_T = part_0 | part_1; // @[cache.scala 497:80]
  wire [63:0] _GEN_256 = is_match_0 ? {{40'd0}, _part_2_T_22} : 64'h0; // @[cache.scala 215:27 476:66 489:73]
  wire [63:0] _GEN_428 = is_match_1 ? {{40'd0}, _part_2_T_22} : _GEN_256; // @[cache.scala 476:66 489:73]
  wire [63:0] _GEN_600 = is_match_2 ? {{40'd0}, _part_2_T_22} : _GEN_428; // @[cache.scala 476:66 489:73]
  wire [63:0] _GEN_772 = is_match_3 ? {{40'd0}, _part_2_T_22} : _GEN_600; // @[cache.scala 476:66 489:73]
  wire [63:0] _GEN_800 = cpu_request_rw ? _GEN_772 : 64'h0; // @[cache.scala 215:27 474:53]
  wire [63:0] _GEN_922 = is_match_0 | is_match_1 | is_match_2 | is_match_3 ? _GEN_800 : 64'h0; // @[cache.scala 215:27 425:51]
  wire [63:0] _GEN_1368 = 4'h7 == cache_state ? _GEN_922 : 64'h0; // @[cache.scala 215:27 330:28]
  wire [63:0] _GEN_1453 = 4'h5 == cache_state ? 64'h0 : _GEN_1368; // @[cache.scala 215:27 330:28]
  wire [63:0] _GEN_1540 = 4'h4 == cache_state ? 64'h0 : _GEN_1453; // @[cache.scala 215:27 330:28]
  wire [63:0] _GEN_1625 = 4'h3 == cache_state ? 64'h0 : _GEN_1540; // @[cache.scala 215:27 330:28]
  wire [63:0] _GEN_1712 = 4'h2 == cache_state ? 64'h0 : _GEN_1625; // @[cache.scala 215:27 330:28]
  wire [63:0] _GEN_1799 = 4'h1 == cache_state ? 64'h0 : _GEN_1712; // @[cache.scala 215:27 330:28]
  wire [63:0] part_2 = 4'h0 == cache_state ? 64'h0 : _GEN_1799; // @[cache.scala 215:27 330:28]
  wire [63:0] _result_T_1 = _result_T | part_2; // @[cache.scala 497:80]
  wire [63:0] _GEN_257 = is_match_0 ? {{32'd0}, _part_3_T_22} : 64'h0; // @[cache.scala 215:27 476:66 489:73]
  wire [63:0] _GEN_429 = is_match_1 ? {{32'd0}, _part_3_T_22} : _GEN_257; // @[cache.scala 476:66 489:73]
  wire [63:0] _GEN_601 = is_match_2 ? {{32'd0}, _part_3_T_22} : _GEN_429; // @[cache.scala 476:66 489:73]
  wire [63:0] _GEN_773 = is_match_3 ? {{32'd0}, _part_3_T_22} : _GEN_601; // @[cache.scala 476:66 489:73]
  wire [63:0] _GEN_801 = cpu_request_rw ? _GEN_773 : 64'h0; // @[cache.scala 215:27 474:53]
  wire [63:0] _GEN_923 = is_match_0 | is_match_1 | is_match_2 | is_match_3 ? _GEN_801 : 64'h0; // @[cache.scala 215:27 425:51]
  wire [63:0] _GEN_1369 = 4'h7 == cache_state ? _GEN_923 : 64'h0; // @[cache.scala 215:27 330:28]
  wire [63:0] _GEN_1454 = 4'h5 == cache_state ? 64'h0 : _GEN_1369; // @[cache.scala 215:27 330:28]
  wire [63:0] _GEN_1541 = 4'h4 == cache_state ? 64'h0 : _GEN_1454; // @[cache.scala 215:27 330:28]
  wire [63:0] _GEN_1626 = 4'h3 == cache_state ? 64'h0 : _GEN_1541; // @[cache.scala 215:27 330:28]
  wire [63:0] _GEN_1713 = 4'h2 == cache_state ? 64'h0 : _GEN_1626; // @[cache.scala 215:27 330:28]
  wire [63:0] _GEN_1800 = 4'h1 == cache_state ? 64'h0 : _GEN_1713; // @[cache.scala 215:27 330:28]
  wire [63:0] part_3 = 4'h0 == cache_state ? 64'h0 : _GEN_1800; // @[cache.scala 215:27 330:28]
  wire [63:0] _result_T_2 = _result_T_1 | part_3; // @[cache.scala 497:80]
  wire [63:0] _GEN_258 = is_match_0 ? {{24'd0}, _part_4_T_22} : 64'h0; // @[cache.scala 215:27 476:66 489:73]
  wire [63:0] _GEN_430 = is_match_1 ? {{24'd0}, _part_4_T_22} : _GEN_258; // @[cache.scala 476:66 489:73]
  wire [63:0] _GEN_602 = is_match_2 ? {{24'd0}, _part_4_T_22} : _GEN_430; // @[cache.scala 476:66 489:73]
  wire [63:0] _GEN_774 = is_match_3 ? {{24'd0}, _part_4_T_22} : _GEN_602; // @[cache.scala 476:66 489:73]
  wire [63:0] _GEN_802 = cpu_request_rw ? _GEN_774 : 64'h0; // @[cache.scala 215:27 474:53]
  wire [63:0] _GEN_924 = is_match_0 | is_match_1 | is_match_2 | is_match_3 ? _GEN_802 : 64'h0; // @[cache.scala 215:27 425:51]
  wire [63:0] _GEN_1370 = 4'h7 == cache_state ? _GEN_924 : 64'h0; // @[cache.scala 215:27 330:28]
  wire [63:0] _GEN_1455 = 4'h5 == cache_state ? 64'h0 : _GEN_1370; // @[cache.scala 215:27 330:28]
  wire [63:0] _GEN_1542 = 4'h4 == cache_state ? 64'h0 : _GEN_1455; // @[cache.scala 215:27 330:28]
  wire [63:0] _GEN_1627 = 4'h3 == cache_state ? 64'h0 : _GEN_1542; // @[cache.scala 215:27 330:28]
  wire [63:0] _GEN_1714 = 4'h2 == cache_state ? 64'h0 : _GEN_1627; // @[cache.scala 215:27 330:28]
  wire [63:0] _GEN_1801 = 4'h1 == cache_state ? 64'h0 : _GEN_1714; // @[cache.scala 215:27 330:28]
  wire [63:0] part_4 = 4'h0 == cache_state ? 64'h0 : _GEN_1801; // @[cache.scala 215:27 330:28]
  wire [63:0] _result_T_3 = _result_T_2 | part_4; // @[cache.scala 497:80]
  wire [63:0] _GEN_259 = is_match_0 ? {{16'd0}, _part_5_T_22} : 64'h0; // @[cache.scala 215:27 476:66 489:73]
  wire [63:0] _GEN_431 = is_match_1 ? {{16'd0}, _part_5_T_22} : _GEN_259; // @[cache.scala 476:66 489:73]
  wire [63:0] _GEN_603 = is_match_2 ? {{16'd0}, _part_5_T_22} : _GEN_431; // @[cache.scala 476:66 489:73]
  wire [63:0] _GEN_775 = is_match_3 ? {{16'd0}, _part_5_T_22} : _GEN_603; // @[cache.scala 476:66 489:73]
  wire [63:0] _GEN_803 = cpu_request_rw ? _GEN_775 : 64'h0; // @[cache.scala 215:27 474:53]
  wire [63:0] _GEN_925 = is_match_0 | is_match_1 | is_match_2 | is_match_3 ? _GEN_803 : 64'h0; // @[cache.scala 215:27 425:51]
  wire [63:0] _GEN_1371 = 4'h7 == cache_state ? _GEN_925 : 64'h0; // @[cache.scala 215:27 330:28]
  wire [63:0] _GEN_1456 = 4'h5 == cache_state ? 64'h0 : _GEN_1371; // @[cache.scala 215:27 330:28]
  wire [63:0] _GEN_1543 = 4'h4 == cache_state ? 64'h0 : _GEN_1456; // @[cache.scala 215:27 330:28]
  wire [63:0] _GEN_1628 = 4'h3 == cache_state ? 64'h0 : _GEN_1543; // @[cache.scala 215:27 330:28]
  wire [63:0] _GEN_1715 = 4'h2 == cache_state ? 64'h0 : _GEN_1628; // @[cache.scala 215:27 330:28]
  wire [63:0] _GEN_1802 = 4'h1 == cache_state ? 64'h0 : _GEN_1715; // @[cache.scala 215:27 330:28]
  wire [63:0] part_5 = 4'h0 == cache_state ? 64'h0 : _GEN_1802; // @[cache.scala 215:27 330:28]
  wire [63:0] _result_T_4 = _result_T_3 | part_5; // @[cache.scala 497:80]
  wire [63:0] _GEN_260 = is_match_0 ? {{8'd0}, _part_6_T_22} : 64'h0; // @[cache.scala 215:27 476:66 489:73]
  wire [63:0] _GEN_432 = is_match_1 ? {{8'd0}, _part_6_T_22} : _GEN_260; // @[cache.scala 476:66 489:73]
  wire [63:0] _GEN_604 = is_match_2 ? {{8'd0}, _part_6_T_22} : _GEN_432; // @[cache.scala 476:66 489:73]
  wire [63:0] _GEN_776 = is_match_3 ? {{8'd0}, _part_6_T_22} : _GEN_604; // @[cache.scala 476:66 489:73]
  wire [63:0] _GEN_804 = cpu_request_rw ? _GEN_776 : 64'h0; // @[cache.scala 215:27 474:53]
  wire [63:0] _GEN_926 = is_match_0 | is_match_1 | is_match_2 | is_match_3 ? _GEN_804 : 64'h0; // @[cache.scala 215:27 425:51]
  wire [63:0] _GEN_1372 = 4'h7 == cache_state ? _GEN_926 : 64'h0; // @[cache.scala 215:27 330:28]
  wire [63:0] _GEN_1457 = 4'h5 == cache_state ? 64'h0 : _GEN_1372; // @[cache.scala 215:27 330:28]
  wire [63:0] _GEN_1544 = 4'h4 == cache_state ? 64'h0 : _GEN_1457; // @[cache.scala 215:27 330:28]
  wire [63:0] _GEN_1629 = 4'h3 == cache_state ? 64'h0 : _GEN_1544; // @[cache.scala 215:27 330:28]
  wire [63:0] _GEN_1716 = 4'h2 == cache_state ? 64'h0 : _GEN_1629; // @[cache.scala 215:27 330:28]
  wire [63:0] _GEN_1803 = 4'h1 == cache_state ? 64'h0 : _GEN_1716; // @[cache.scala 215:27 330:28]
  wire [63:0] part_6 = 4'h0 == cache_state ? 64'h0 : _GEN_1803; // @[cache.scala 215:27 330:28]
  wire [63:0] _result_T_5 = _result_T_4 | part_6; // @[cache.scala 497:80]
  wire [63:0] _GEN_261 = is_match_0 ? _part_7_T_22 : 64'h0; // @[cache.scala 215:27 476:66 489:73]
  wire [63:0] _GEN_433 = is_match_1 ? _part_7_T_22 : _GEN_261; // @[cache.scala 476:66 489:73]
  wire [63:0] _GEN_605 = is_match_2 ? _part_7_T_22 : _GEN_433; // @[cache.scala 476:66 489:73]
  wire [63:0] _GEN_777 = is_match_3 ? _part_7_T_22 : _GEN_605; // @[cache.scala 476:66 489:73]
  wire [63:0] _GEN_805 = cpu_request_rw ? _GEN_777 : 64'h0; // @[cache.scala 215:27 474:53]
  wire [63:0] _GEN_927 = is_match_0 | is_match_1 | is_match_2 | is_match_3 ? _GEN_805 : 64'h0; // @[cache.scala 215:27 425:51]
  wire [63:0] _GEN_1373 = 4'h7 == cache_state ? _GEN_927 : 64'h0; // @[cache.scala 215:27 330:28]
  wire [63:0] _GEN_1458 = 4'h5 == cache_state ? 64'h0 : _GEN_1373; // @[cache.scala 215:27 330:28]
  wire [63:0] _GEN_1545 = 4'h4 == cache_state ? 64'h0 : _GEN_1458; // @[cache.scala 215:27 330:28]
  wire [63:0] _GEN_1630 = 4'h3 == cache_state ? 64'h0 : _GEN_1545; // @[cache.scala 215:27 330:28]
  wire [63:0] _GEN_1717 = 4'h2 == cache_state ? 64'h0 : _GEN_1630; // @[cache.scala 215:27 330:28]
  wire [63:0] _GEN_1804 = 4'h1 == cache_state ? 64'h0 : _GEN_1717; // @[cache.scala 215:27 330:28]
  wire [63:0] part_7 = 4'h0 == cache_state ? 64'h0 : _GEN_1804; // @[cache.scala 215:27 330:28]
  wire [63:0] _result_T_6 = _result_T_5 | part_7; // @[cache.scala 497:80]
  wire [63:0] _GEN_262 = is_match_0 ? _result_T_6 : 64'h0; // @[cache.scala 476:66 497:64]
  wire [63:0] _GEN_434 = is_match_1 ? _result_T_6 : _GEN_262; // @[cache.scala 476:66 497:64]
  wire [63:0] _GEN_606 = is_match_2 ? _result_T_6 : _GEN_434; // @[cache.scala 476:66 497:64]
  wire [63:0] _GEN_778 = is_match_3 ? _result_T_6 : _GEN_606; // @[cache.scala 476:66 497:64]
  wire [63:0] _GEN_806 = cpu_request_rw ? _GEN_778 : 64'h0; // @[cache.scala 474:53]
  wire [63:0] _GEN_928 = is_match_0 | is_match_1 | is_match_2 | is_match_3 ? _GEN_806 : 64'h0; // @[cache.scala 425:51]
  wire [63:0] _GEN_1374 = 4'h7 == cache_state ? _GEN_928 : 64'h0; // @[cache.scala 330:28]
  wire [63:0] _GEN_1459 = 4'h5 == cache_state ? 64'h0 : _GEN_1374; // @[cache.scala 330:28]
  wire [63:0] _GEN_1546 = 4'h4 == cache_state ? 64'h0 : _GEN_1459; // @[cache.scala 330:28]
  wire [63:0] _GEN_1631 = 4'h3 == cache_state ? 64'h0 : _GEN_1546; // @[cache.scala 330:28]
  wire [63:0] _GEN_1718 = 4'h2 == cache_state ? 64'h0 : _GEN_1631; // @[cache.scala 330:28]
  wire [63:0] _GEN_1805 = 4'h1 == cache_state ? 64'h0 : _GEN_1718; // @[cache.scala 330:28]
  wire [63:0] result = 4'h0 == cache_state ? 64'h0 : _GEN_1805; // @[cache.scala 330:28]
  wire [63:0] _GEN_236 = 4'h0 == cpu_request_addr_reg[6:3] ? result : data_mem_0_io_data_read_data[63:0]; // @[cache.scala 500:{131,131} 499:68]
  wire [63:0] _GEN_237 = 4'h1 == cpu_request_addr_reg[6:3] ? result : data_mem_0_io_data_read_data[127:64]; // @[cache.scala 500:{131,131} 499:68]
  wire [63:0] _GEN_238 = 4'h2 == cpu_request_addr_reg[6:3] ? result : data_mem_0_io_data_read_data[191:128]; // @[cache.scala 500:{131,131} 499:68]
  wire [63:0] _GEN_239 = 4'h3 == cpu_request_addr_reg[6:3] ? result : data_mem_0_io_data_read_data[255:192]; // @[cache.scala 500:{131,131} 499:68]
  wire [63:0] _GEN_240 = 4'h4 == cpu_request_addr_reg[6:3] ? result : data_mem_0_io_data_read_data[319:256]; // @[cache.scala 500:{131,131} 499:68]
  wire [63:0] _GEN_241 = 4'h5 == cpu_request_addr_reg[6:3] ? result : data_mem_0_io_data_read_data[383:320]; // @[cache.scala 500:{131,131} 499:68]
  wire [63:0] _GEN_242 = 4'h6 == cpu_request_addr_reg[6:3] ? result : data_mem_0_io_data_read_data[447:384]; // @[cache.scala 500:{131,131} 499:68]
  wire [63:0] _GEN_243 = 4'h7 == cpu_request_addr_reg[6:3] ? result : data_mem_0_io_data_read_data[511:448]; // @[cache.scala 500:{131,131} 499:68]
  wire [63:0] _GEN_244 = 4'h8 == cpu_request_addr_reg[6:3] ? result : data_mem_0_io_data_read_data[575:512]; // @[cache.scala 500:{131,131} 499:68]
  wire [63:0] _GEN_245 = 4'h9 == cpu_request_addr_reg[6:3] ? result : data_mem_0_io_data_read_data[639:576]; // @[cache.scala 500:{131,131} 499:68]
  wire [63:0] _GEN_246 = 4'ha == cpu_request_addr_reg[6:3] ? result : data_mem_0_io_data_read_data[703:640]; // @[cache.scala 500:{131,131} 499:68]
  wire [63:0] _GEN_247 = 4'hb == cpu_request_addr_reg[6:3] ? result : data_mem_0_io_data_read_data[767:704]; // @[cache.scala 500:{131,131} 499:68]
  wire [63:0] _GEN_248 = 4'hc == cpu_request_addr_reg[6:3] ? result : data_mem_0_io_data_read_data[831:768]; // @[cache.scala 500:{131,131} 499:68]
  wire [63:0] _GEN_249 = 4'hd == cpu_request_addr_reg[6:3] ? result : data_mem_0_io_data_read_data[895:832]; // @[cache.scala 500:{131,131} 499:68]
  wire [63:0] _GEN_250 = 4'he == cpu_request_addr_reg[6:3] ? result : data_mem_0_io_data_read_data[959:896]; // @[cache.scala 500:{131,131} 499:68]
  wire [63:0] _GEN_251 = 4'hf == cpu_request_addr_reg[6:3] ? result : data_mem_0_io_data_read_data[1023:960]; // @[cache.scala 500:{131,131} 499:68]
  wire [63:0] _GEN_753 = 4'h1 == cpu_request_addr_reg[6:3] ? result : data_mem_3_io_data_read_data[127:64]; // @[cache.scala 500:{131,131} 499:68]
  wire [63:0] _GEN_581 = 4'h1 == cpu_request_addr_reg[6:3] ? result : data_mem_2_io_data_read_data[127:64]; // @[cache.scala 500:{131,131} 499:68]
  wire [63:0] _GEN_409 = 4'h1 == cpu_request_addr_reg[6:3] ? result : data_mem_1_io_data_read_data[127:64]; // @[cache.scala 500:{131,131} 499:68]
  wire [63:0] _GEN_264 = is_match_0 ? _GEN_237 : 64'h0; // @[cache.scala 218:33 476:66]
  wire [63:0] _GEN_436 = is_match_1 ? _GEN_409 : _GEN_264; // @[cache.scala 476:66]
  wire [63:0] _GEN_608 = is_match_2 ? _GEN_581 : _GEN_436; // @[cache.scala 476:66]
  wire [63:0] _GEN_780 = is_match_3 ? _GEN_753 : _GEN_608; // @[cache.scala 476:66]
  wire [63:0] _GEN_808 = cpu_request_rw ? _GEN_780 : 64'h0; // @[cache.scala 218:33 474:53]
  wire [63:0] _GEN_930 = is_match_0 | is_match_1 | is_match_2 | is_match_3 ? _GEN_808 : 64'h0; // @[cache.scala 218:33 425:51]
  wire  _T_184 = 2'h3 == replace; // @[cache.scala 621:50]
  wire [63:0] _GEN_1068 = 4'h1 == index ? io_mem_io_r_bits_data : data_mem_3_io_data_read_data[127:64]; // @[cache.scala 623:60 629:{67,67}]
  wire  _T_167 = 2'h2 == replace; // @[cache.scala 621:50]
  wire [63:0] _GEN_1034 = 4'h1 == index ? io_mem_io_r_bits_data : data_mem_2_io_data_read_data[127:64]; // @[cache.scala 623:60 629:{67,67}]
  wire  _T_150 = 2'h1 == replace; // @[cache.scala 621:50]
  wire [63:0] _GEN_1000 = 4'h1 == index ? io_mem_io_r_bits_data : data_mem_1_io_data_read_data[127:64]; // @[cache.scala 623:60 629:{67,67}]
  wire  _T_133 = 2'h0 == replace; // @[cache.scala 621:50]
  wire [63:0] _GEN_966 = 4'h1 == index ? io_mem_io_r_bits_data : data_mem_0_io_data_read_data[127:64]; // @[cache.scala 623:60 629:{67,67}]
  wire [63:0] _GEN_982 = 2'h0 == replace ? _GEN_966 : 64'h0; // @[cache.scala 218:33 621:62]
  wire [63:0] _GEN_1016 = 2'h1 == replace ? _GEN_1000 : _GEN_982; // @[cache.scala 621:62]
  wire [63:0] _GEN_1050 = 2'h2 == replace ? _GEN_1034 : _GEN_1016; // @[cache.scala 621:62]
  wire [63:0] _GEN_1084 = 2'h3 == replace ? _GEN_1068 : _GEN_1050; // @[cache.scala 621:62]
  wire [63:0] _GEN_1102 = io_mem_io_r_valid ? _GEN_1084 : 64'h0; // @[cache.scala 218:33 619:48]
  wire [63:0] _GEN_1145 = _T_133 ? data_mem_0_io_data_read_data[127:64] : 64'h0; // @[cache.scala 218:33 714:62 715:60]
  wire [63:0] _GEN_1162 = _T_150 ? data_mem_1_io_data_read_data[127:64] : _GEN_1145; // @[cache.scala 714:62 715:60]
  wire [63:0] _GEN_1179 = _T_167 ? data_mem_2_io_data_read_data[127:64] : _GEN_1162; // @[cache.scala 714:62 715:60]
  wire [63:0] _GEN_1196 = _T_184 ? data_mem_3_io_data_read_data[127:64] : _GEN_1179; // @[cache.scala 714:62 715:60]
  wire [63:0] _GEN_1222 = 4'h8 == cache_state ? _GEN_1196 : 64'h0; // @[cache.scala 330:28 218:33]
  wire [63:0] _GEN_1248 = 4'hb == cache_state ? 64'h0 : _GEN_1222; // @[cache.scala 330:28 218:33]
  wire [63:0] _GEN_1270 = 4'h9 == cache_state ? _GEN_1102 : _GEN_1248; // @[cache.scala 330:28]
  wire [63:0] _GEN_1309 = 4'ha == cache_state ? 64'h0 : _GEN_1270; // @[cache.scala 330:28 218:33]
  wire [63:0] _GEN_1376 = 4'h7 == cache_state ? _GEN_930 : _GEN_1309; // @[cache.scala 330:28]
  wire [63:0] _GEN_1461 = 4'h5 == cache_state ? 64'h0 : _GEN_1376; // @[cache.scala 330:28 218:33]
  wire [63:0] _GEN_1548 = 4'h4 == cache_state ? 64'h0 : _GEN_1461; // @[cache.scala 330:28 218:33]
  wire [63:0] _GEN_1633 = 4'h3 == cache_state ? 64'h0 : _GEN_1548; // @[cache.scala 330:28 218:33]
  wire [63:0] _GEN_1720 = 4'h2 == cache_state ? 64'h0 : _GEN_1633; // @[cache.scala 330:28 218:33]
  wire [63:0] _GEN_1807 = 4'h1 == cache_state ? 64'h0 : _GEN_1720; // @[cache.scala 330:28 218:33]
  wire [63:0] cache_data_1 = 4'h0 == cache_state ? 64'h0 : _GEN_1807; // @[cache.scala 330:28 218:33]
  wire [63:0] _GEN_752 = 4'h0 == cpu_request_addr_reg[6:3] ? result : data_mem_3_io_data_read_data[63:0]; // @[cache.scala 500:{131,131} 499:68]
  wire [63:0] _GEN_580 = 4'h0 == cpu_request_addr_reg[6:3] ? result : data_mem_2_io_data_read_data[63:0]; // @[cache.scala 500:{131,131} 499:68]
  wire [63:0] _GEN_408 = 4'h0 == cpu_request_addr_reg[6:3] ? result : data_mem_1_io_data_read_data[63:0]; // @[cache.scala 500:{131,131} 499:68]
  wire [63:0] _GEN_263 = is_match_0 ? _GEN_236 : 64'h0; // @[cache.scala 218:33 476:66]
  wire [63:0] _GEN_435 = is_match_1 ? _GEN_408 : _GEN_263; // @[cache.scala 476:66]
  wire [63:0] _GEN_607 = is_match_2 ? _GEN_580 : _GEN_435; // @[cache.scala 476:66]
  wire [63:0] _GEN_779 = is_match_3 ? _GEN_752 : _GEN_607; // @[cache.scala 476:66]
  wire [63:0] _GEN_807 = cpu_request_rw ? _GEN_779 : 64'h0; // @[cache.scala 218:33 474:53]
  wire [63:0] _GEN_929 = is_match_0 | is_match_1 | is_match_2 | is_match_3 ? _GEN_807 : 64'h0; // @[cache.scala 218:33 425:51]
  wire [63:0] _GEN_1067 = 4'h0 == index ? io_mem_io_r_bits_data : data_mem_3_io_data_read_data[63:0]; // @[cache.scala 623:60 629:{67,67}]
  wire [63:0] _GEN_1033 = 4'h0 == index ? io_mem_io_r_bits_data : data_mem_2_io_data_read_data[63:0]; // @[cache.scala 623:60 629:{67,67}]
  wire [63:0] _GEN_999 = 4'h0 == index ? io_mem_io_r_bits_data : data_mem_1_io_data_read_data[63:0]; // @[cache.scala 623:60 629:{67,67}]
  wire [63:0] _GEN_965 = 4'h0 == index ? io_mem_io_r_bits_data : data_mem_0_io_data_read_data[63:0]; // @[cache.scala 623:60 629:{67,67}]
  wire [63:0] _GEN_981 = 2'h0 == replace ? _GEN_965 : 64'h0; // @[cache.scala 218:33 621:62]
  wire [63:0] _GEN_1015 = 2'h1 == replace ? _GEN_999 : _GEN_981; // @[cache.scala 621:62]
  wire [63:0] _GEN_1049 = 2'h2 == replace ? _GEN_1033 : _GEN_1015; // @[cache.scala 621:62]
  wire [63:0] _GEN_1083 = 2'h3 == replace ? _GEN_1067 : _GEN_1049; // @[cache.scala 621:62]
  wire [63:0] _GEN_1101 = io_mem_io_r_valid ? _GEN_1083 : 64'h0; // @[cache.scala 218:33 619:48]
  wire [63:0] _GEN_1144 = _T_133 ? data_mem_0_io_data_read_data[63:0] : 64'h0; // @[cache.scala 218:33 714:62 715:60]
  wire [63:0] _GEN_1161 = _T_150 ? data_mem_1_io_data_read_data[63:0] : _GEN_1144; // @[cache.scala 714:62 715:60]
  wire [63:0] _GEN_1178 = _T_167 ? data_mem_2_io_data_read_data[63:0] : _GEN_1161; // @[cache.scala 714:62 715:60]
  wire [63:0] _GEN_1195 = _T_184 ? data_mem_3_io_data_read_data[63:0] : _GEN_1178; // @[cache.scala 714:62 715:60]
  wire [63:0] _GEN_1221 = 4'h8 == cache_state ? _GEN_1195 : 64'h0; // @[cache.scala 330:28 218:33]
  wire [63:0] _GEN_1247 = 4'hb == cache_state ? 64'h0 : _GEN_1221; // @[cache.scala 330:28 218:33]
  wire [63:0] _GEN_1269 = 4'h9 == cache_state ? _GEN_1101 : _GEN_1247; // @[cache.scala 330:28]
  wire [63:0] _GEN_1308 = 4'ha == cache_state ? 64'h0 : _GEN_1269; // @[cache.scala 330:28 218:33]
  wire [63:0] _GEN_1375 = 4'h7 == cache_state ? _GEN_929 : _GEN_1308; // @[cache.scala 330:28]
  wire [63:0] _GEN_1460 = 4'h5 == cache_state ? 64'h0 : _GEN_1375; // @[cache.scala 330:28 218:33]
  wire [63:0] _GEN_1547 = 4'h4 == cache_state ? 64'h0 : _GEN_1460; // @[cache.scala 330:28 218:33]
  wire [63:0] _GEN_1632 = 4'h3 == cache_state ? 64'h0 : _GEN_1547; // @[cache.scala 330:28 218:33]
  wire [63:0] _GEN_1719 = 4'h2 == cache_state ? 64'h0 : _GEN_1632; // @[cache.scala 330:28 218:33]
  wire [63:0] _GEN_1806 = 4'h1 == cache_state ? 64'h0 : _GEN_1719; // @[cache.scala 330:28 218:33]
  wire [63:0] cache_data_0 = 4'h0 == cache_state ? 64'h0 : _GEN_1806; // @[cache.scala 330:28 218:33]
  wire [63:0] _GEN_755 = 4'h3 == cpu_request_addr_reg[6:3] ? result : data_mem_3_io_data_read_data[255:192]; // @[cache.scala 500:{131,131} 499:68]
  wire [63:0] _GEN_583 = 4'h3 == cpu_request_addr_reg[6:3] ? result : data_mem_2_io_data_read_data[255:192]; // @[cache.scala 500:{131,131} 499:68]
  wire [63:0] _GEN_411 = 4'h3 == cpu_request_addr_reg[6:3] ? result : data_mem_1_io_data_read_data[255:192]; // @[cache.scala 500:{131,131} 499:68]
  wire [63:0] _GEN_266 = is_match_0 ? _GEN_239 : 64'h0; // @[cache.scala 218:33 476:66]
  wire [63:0] _GEN_438 = is_match_1 ? _GEN_411 : _GEN_266; // @[cache.scala 476:66]
  wire [63:0] _GEN_610 = is_match_2 ? _GEN_583 : _GEN_438; // @[cache.scala 476:66]
  wire [63:0] _GEN_782 = is_match_3 ? _GEN_755 : _GEN_610; // @[cache.scala 476:66]
  wire [63:0] _GEN_810 = cpu_request_rw ? _GEN_782 : 64'h0; // @[cache.scala 218:33 474:53]
  wire [63:0] _GEN_932 = is_match_0 | is_match_1 | is_match_2 | is_match_3 ? _GEN_810 : 64'h0; // @[cache.scala 218:33 425:51]
  wire [63:0] _GEN_1070 = 4'h3 == index ? io_mem_io_r_bits_data : data_mem_3_io_data_read_data[255:192]; // @[cache.scala 623:60 629:{67,67}]
  wire [63:0] _GEN_1036 = 4'h3 == index ? io_mem_io_r_bits_data : data_mem_2_io_data_read_data[255:192]; // @[cache.scala 623:60 629:{67,67}]
  wire [63:0] _GEN_1002 = 4'h3 == index ? io_mem_io_r_bits_data : data_mem_1_io_data_read_data[255:192]; // @[cache.scala 623:60 629:{67,67}]
  wire [63:0] _GEN_968 = 4'h3 == index ? io_mem_io_r_bits_data : data_mem_0_io_data_read_data[255:192]; // @[cache.scala 623:60 629:{67,67}]
  wire [63:0] _GEN_984 = 2'h0 == replace ? _GEN_968 : 64'h0; // @[cache.scala 218:33 621:62]
  wire [63:0] _GEN_1018 = 2'h1 == replace ? _GEN_1002 : _GEN_984; // @[cache.scala 621:62]
  wire [63:0] _GEN_1052 = 2'h2 == replace ? _GEN_1036 : _GEN_1018; // @[cache.scala 621:62]
  wire [63:0] _GEN_1086 = 2'h3 == replace ? _GEN_1070 : _GEN_1052; // @[cache.scala 621:62]
  wire [63:0] _GEN_1104 = io_mem_io_r_valid ? _GEN_1086 : 64'h0; // @[cache.scala 218:33 619:48]
  wire [63:0] _GEN_1147 = _T_133 ? data_mem_0_io_data_read_data[255:192] : 64'h0; // @[cache.scala 218:33 714:62 715:60]
  wire [63:0] _GEN_1164 = _T_150 ? data_mem_1_io_data_read_data[255:192] : _GEN_1147; // @[cache.scala 714:62 715:60]
  wire [63:0] _GEN_1181 = _T_167 ? data_mem_2_io_data_read_data[255:192] : _GEN_1164; // @[cache.scala 714:62 715:60]
  wire [63:0] _GEN_1198 = _T_184 ? data_mem_3_io_data_read_data[255:192] : _GEN_1181; // @[cache.scala 714:62 715:60]
  wire [63:0] _GEN_1224 = 4'h8 == cache_state ? _GEN_1198 : 64'h0; // @[cache.scala 330:28 218:33]
  wire [63:0] _GEN_1250 = 4'hb == cache_state ? 64'h0 : _GEN_1224; // @[cache.scala 330:28 218:33]
  wire [63:0] _GEN_1272 = 4'h9 == cache_state ? _GEN_1104 : _GEN_1250; // @[cache.scala 330:28]
  wire [63:0] _GEN_1311 = 4'ha == cache_state ? 64'h0 : _GEN_1272; // @[cache.scala 330:28 218:33]
  wire [63:0] _GEN_1378 = 4'h7 == cache_state ? _GEN_932 : _GEN_1311; // @[cache.scala 330:28]
  wire [63:0] _GEN_1463 = 4'h5 == cache_state ? 64'h0 : _GEN_1378; // @[cache.scala 330:28 218:33]
  wire [63:0] _GEN_1550 = 4'h4 == cache_state ? 64'h0 : _GEN_1463; // @[cache.scala 330:28 218:33]
  wire [63:0] _GEN_1635 = 4'h3 == cache_state ? 64'h0 : _GEN_1550; // @[cache.scala 330:28 218:33]
  wire [63:0] _GEN_1722 = 4'h2 == cache_state ? 64'h0 : _GEN_1635; // @[cache.scala 330:28 218:33]
  wire [63:0] _GEN_1809 = 4'h1 == cache_state ? 64'h0 : _GEN_1722; // @[cache.scala 330:28 218:33]
  wire [63:0] cache_data_3 = 4'h0 == cache_state ? 64'h0 : _GEN_1809; // @[cache.scala 330:28 218:33]
  wire [63:0] _GEN_754 = 4'h2 == cpu_request_addr_reg[6:3] ? result : data_mem_3_io_data_read_data[191:128]; // @[cache.scala 500:{131,131} 499:68]
  wire [63:0] _GEN_582 = 4'h2 == cpu_request_addr_reg[6:3] ? result : data_mem_2_io_data_read_data[191:128]; // @[cache.scala 500:{131,131} 499:68]
  wire [63:0] _GEN_410 = 4'h2 == cpu_request_addr_reg[6:3] ? result : data_mem_1_io_data_read_data[191:128]; // @[cache.scala 500:{131,131} 499:68]
  wire [63:0] _GEN_265 = is_match_0 ? _GEN_238 : 64'h0; // @[cache.scala 218:33 476:66]
  wire [63:0] _GEN_437 = is_match_1 ? _GEN_410 : _GEN_265; // @[cache.scala 476:66]
  wire [63:0] _GEN_609 = is_match_2 ? _GEN_582 : _GEN_437; // @[cache.scala 476:66]
  wire [63:0] _GEN_781 = is_match_3 ? _GEN_754 : _GEN_609; // @[cache.scala 476:66]
  wire [63:0] _GEN_809 = cpu_request_rw ? _GEN_781 : 64'h0; // @[cache.scala 218:33 474:53]
  wire [63:0] _GEN_931 = is_match_0 | is_match_1 | is_match_2 | is_match_3 ? _GEN_809 : 64'h0; // @[cache.scala 218:33 425:51]
  wire [63:0] _GEN_1069 = 4'h2 == index ? io_mem_io_r_bits_data : data_mem_3_io_data_read_data[191:128]; // @[cache.scala 623:60 629:{67,67}]
  wire [63:0] _GEN_1035 = 4'h2 == index ? io_mem_io_r_bits_data : data_mem_2_io_data_read_data[191:128]; // @[cache.scala 623:60 629:{67,67}]
  wire [63:0] _GEN_1001 = 4'h2 == index ? io_mem_io_r_bits_data : data_mem_1_io_data_read_data[191:128]; // @[cache.scala 623:60 629:{67,67}]
  wire [63:0] _GEN_967 = 4'h2 == index ? io_mem_io_r_bits_data : data_mem_0_io_data_read_data[191:128]; // @[cache.scala 623:60 629:{67,67}]
  wire [63:0] _GEN_983 = 2'h0 == replace ? _GEN_967 : 64'h0; // @[cache.scala 218:33 621:62]
  wire [63:0] _GEN_1017 = 2'h1 == replace ? _GEN_1001 : _GEN_983; // @[cache.scala 621:62]
  wire [63:0] _GEN_1051 = 2'h2 == replace ? _GEN_1035 : _GEN_1017; // @[cache.scala 621:62]
  wire [63:0] _GEN_1085 = 2'h3 == replace ? _GEN_1069 : _GEN_1051; // @[cache.scala 621:62]
  wire [63:0] _GEN_1103 = io_mem_io_r_valid ? _GEN_1085 : 64'h0; // @[cache.scala 218:33 619:48]
  wire [63:0] _GEN_1146 = _T_133 ? data_mem_0_io_data_read_data[191:128] : 64'h0; // @[cache.scala 218:33 714:62 715:60]
  wire [63:0] _GEN_1163 = _T_150 ? data_mem_1_io_data_read_data[191:128] : _GEN_1146; // @[cache.scala 714:62 715:60]
  wire [63:0] _GEN_1180 = _T_167 ? data_mem_2_io_data_read_data[191:128] : _GEN_1163; // @[cache.scala 714:62 715:60]
  wire [63:0] _GEN_1197 = _T_184 ? data_mem_3_io_data_read_data[191:128] : _GEN_1180; // @[cache.scala 714:62 715:60]
  wire [63:0] _GEN_1223 = 4'h8 == cache_state ? _GEN_1197 : 64'h0; // @[cache.scala 330:28 218:33]
  wire [63:0] _GEN_1249 = 4'hb == cache_state ? 64'h0 : _GEN_1223; // @[cache.scala 330:28 218:33]
  wire [63:0] _GEN_1271 = 4'h9 == cache_state ? _GEN_1103 : _GEN_1249; // @[cache.scala 330:28]
  wire [63:0] _GEN_1310 = 4'ha == cache_state ? 64'h0 : _GEN_1271; // @[cache.scala 330:28 218:33]
  wire [63:0] _GEN_1377 = 4'h7 == cache_state ? _GEN_931 : _GEN_1310; // @[cache.scala 330:28]
  wire [63:0] _GEN_1462 = 4'h5 == cache_state ? 64'h0 : _GEN_1377; // @[cache.scala 330:28 218:33]
  wire [63:0] _GEN_1549 = 4'h4 == cache_state ? 64'h0 : _GEN_1462; // @[cache.scala 330:28 218:33]
  wire [63:0] _GEN_1634 = 4'h3 == cache_state ? 64'h0 : _GEN_1549; // @[cache.scala 330:28 218:33]
  wire [63:0] _GEN_1721 = 4'h2 == cache_state ? 64'h0 : _GEN_1634; // @[cache.scala 330:28 218:33]
  wire [63:0] _GEN_1808 = 4'h1 == cache_state ? 64'h0 : _GEN_1721; // @[cache.scala 330:28 218:33]
  wire [63:0] cache_data_2 = 4'h0 == cache_state ? 64'h0 : _GEN_1808; // @[cache.scala 330:28 218:33]
  wire [63:0] _GEN_757 = 4'h5 == cpu_request_addr_reg[6:3] ? result : data_mem_3_io_data_read_data[383:320]; // @[cache.scala 500:{131,131} 499:68]
  wire [63:0] _GEN_585 = 4'h5 == cpu_request_addr_reg[6:3] ? result : data_mem_2_io_data_read_data[383:320]; // @[cache.scala 500:{131,131} 499:68]
  wire [63:0] _GEN_413 = 4'h5 == cpu_request_addr_reg[6:3] ? result : data_mem_1_io_data_read_data[383:320]; // @[cache.scala 500:{131,131} 499:68]
  wire [63:0] _GEN_268 = is_match_0 ? _GEN_241 : 64'h0; // @[cache.scala 218:33 476:66]
  wire [63:0] _GEN_440 = is_match_1 ? _GEN_413 : _GEN_268; // @[cache.scala 476:66]
  wire [63:0] _GEN_612 = is_match_2 ? _GEN_585 : _GEN_440; // @[cache.scala 476:66]
  wire [63:0] _GEN_784 = is_match_3 ? _GEN_757 : _GEN_612; // @[cache.scala 476:66]
  wire [63:0] _GEN_812 = cpu_request_rw ? _GEN_784 : 64'h0; // @[cache.scala 218:33 474:53]
  wire [63:0] _GEN_934 = is_match_0 | is_match_1 | is_match_2 | is_match_3 ? _GEN_812 : 64'h0; // @[cache.scala 218:33 425:51]
  wire [63:0] _GEN_1072 = 4'h5 == index ? io_mem_io_r_bits_data : data_mem_3_io_data_read_data[383:320]; // @[cache.scala 623:60 629:{67,67}]
  wire [63:0] _GEN_1038 = 4'h5 == index ? io_mem_io_r_bits_data : data_mem_2_io_data_read_data[383:320]; // @[cache.scala 623:60 629:{67,67}]
  wire [63:0] _GEN_1004 = 4'h5 == index ? io_mem_io_r_bits_data : data_mem_1_io_data_read_data[383:320]; // @[cache.scala 623:60 629:{67,67}]
  wire [63:0] _GEN_970 = 4'h5 == index ? io_mem_io_r_bits_data : data_mem_0_io_data_read_data[383:320]; // @[cache.scala 623:60 629:{67,67}]
  wire [63:0] _GEN_986 = 2'h0 == replace ? _GEN_970 : 64'h0; // @[cache.scala 218:33 621:62]
  wire [63:0] _GEN_1020 = 2'h1 == replace ? _GEN_1004 : _GEN_986; // @[cache.scala 621:62]
  wire [63:0] _GEN_1054 = 2'h2 == replace ? _GEN_1038 : _GEN_1020; // @[cache.scala 621:62]
  wire [63:0] _GEN_1088 = 2'h3 == replace ? _GEN_1072 : _GEN_1054; // @[cache.scala 621:62]
  wire [63:0] _GEN_1106 = io_mem_io_r_valid ? _GEN_1088 : 64'h0; // @[cache.scala 218:33 619:48]
  wire [63:0] _GEN_1149 = _T_133 ? data_mem_0_io_data_read_data[383:320] : 64'h0; // @[cache.scala 218:33 714:62 715:60]
  wire [63:0] _GEN_1166 = _T_150 ? data_mem_1_io_data_read_data[383:320] : _GEN_1149; // @[cache.scala 714:62 715:60]
  wire [63:0] _GEN_1183 = _T_167 ? data_mem_2_io_data_read_data[383:320] : _GEN_1166; // @[cache.scala 714:62 715:60]
  wire [63:0] _GEN_1200 = _T_184 ? data_mem_3_io_data_read_data[383:320] : _GEN_1183; // @[cache.scala 714:62 715:60]
  wire [63:0] _GEN_1226 = 4'h8 == cache_state ? _GEN_1200 : 64'h0; // @[cache.scala 330:28 218:33]
  wire [63:0] _GEN_1252 = 4'hb == cache_state ? 64'h0 : _GEN_1226; // @[cache.scala 330:28 218:33]
  wire [63:0] _GEN_1274 = 4'h9 == cache_state ? _GEN_1106 : _GEN_1252; // @[cache.scala 330:28]
  wire [63:0] _GEN_1313 = 4'ha == cache_state ? 64'h0 : _GEN_1274; // @[cache.scala 330:28 218:33]
  wire [63:0] _GEN_1380 = 4'h7 == cache_state ? _GEN_934 : _GEN_1313; // @[cache.scala 330:28]
  wire [63:0] _GEN_1465 = 4'h5 == cache_state ? 64'h0 : _GEN_1380; // @[cache.scala 330:28 218:33]
  wire [63:0] _GEN_1552 = 4'h4 == cache_state ? 64'h0 : _GEN_1465; // @[cache.scala 330:28 218:33]
  wire [63:0] _GEN_1637 = 4'h3 == cache_state ? 64'h0 : _GEN_1552; // @[cache.scala 330:28 218:33]
  wire [63:0] _GEN_1724 = 4'h2 == cache_state ? 64'h0 : _GEN_1637; // @[cache.scala 330:28 218:33]
  wire [63:0] _GEN_1811 = 4'h1 == cache_state ? 64'h0 : _GEN_1724; // @[cache.scala 330:28 218:33]
  wire [63:0] cache_data_5 = 4'h0 == cache_state ? 64'h0 : _GEN_1811; // @[cache.scala 330:28 218:33]
  wire [63:0] _GEN_756 = 4'h4 == cpu_request_addr_reg[6:3] ? result : data_mem_3_io_data_read_data[319:256]; // @[cache.scala 500:{131,131} 499:68]
  wire [63:0] _GEN_584 = 4'h4 == cpu_request_addr_reg[6:3] ? result : data_mem_2_io_data_read_data[319:256]; // @[cache.scala 500:{131,131} 499:68]
  wire [63:0] _GEN_412 = 4'h4 == cpu_request_addr_reg[6:3] ? result : data_mem_1_io_data_read_data[319:256]; // @[cache.scala 500:{131,131} 499:68]
  wire [63:0] _GEN_267 = is_match_0 ? _GEN_240 : 64'h0; // @[cache.scala 218:33 476:66]
  wire [63:0] _GEN_439 = is_match_1 ? _GEN_412 : _GEN_267; // @[cache.scala 476:66]
  wire [63:0] _GEN_611 = is_match_2 ? _GEN_584 : _GEN_439; // @[cache.scala 476:66]
  wire [63:0] _GEN_783 = is_match_3 ? _GEN_756 : _GEN_611; // @[cache.scala 476:66]
  wire [63:0] _GEN_811 = cpu_request_rw ? _GEN_783 : 64'h0; // @[cache.scala 218:33 474:53]
  wire [63:0] _GEN_933 = is_match_0 | is_match_1 | is_match_2 | is_match_3 ? _GEN_811 : 64'h0; // @[cache.scala 218:33 425:51]
  wire [63:0] _GEN_1071 = 4'h4 == index ? io_mem_io_r_bits_data : data_mem_3_io_data_read_data[319:256]; // @[cache.scala 623:60 629:{67,67}]
  wire [63:0] _GEN_1037 = 4'h4 == index ? io_mem_io_r_bits_data : data_mem_2_io_data_read_data[319:256]; // @[cache.scala 623:60 629:{67,67}]
  wire [63:0] _GEN_1003 = 4'h4 == index ? io_mem_io_r_bits_data : data_mem_1_io_data_read_data[319:256]; // @[cache.scala 623:60 629:{67,67}]
  wire [63:0] _GEN_969 = 4'h4 == index ? io_mem_io_r_bits_data : data_mem_0_io_data_read_data[319:256]; // @[cache.scala 623:60 629:{67,67}]
  wire [63:0] _GEN_985 = 2'h0 == replace ? _GEN_969 : 64'h0; // @[cache.scala 218:33 621:62]
  wire [63:0] _GEN_1019 = 2'h1 == replace ? _GEN_1003 : _GEN_985; // @[cache.scala 621:62]
  wire [63:0] _GEN_1053 = 2'h2 == replace ? _GEN_1037 : _GEN_1019; // @[cache.scala 621:62]
  wire [63:0] _GEN_1087 = 2'h3 == replace ? _GEN_1071 : _GEN_1053; // @[cache.scala 621:62]
  wire [63:0] _GEN_1105 = io_mem_io_r_valid ? _GEN_1087 : 64'h0; // @[cache.scala 218:33 619:48]
  wire [63:0] _GEN_1148 = _T_133 ? data_mem_0_io_data_read_data[319:256] : 64'h0; // @[cache.scala 218:33 714:62 715:60]
  wire [63:0] _GEN_1165 = _T_150 ? data_mem_1_io_data_read_data[319:256] : _GEN_1148; // @[cache.scala 714:62 715:60]
  wire [63:0] _GEN_1182 = _T_167 ? data_mem_2_io_data_read_data[319:256] : _GEN_1165; // @[cache.scala 714:62 715:60]
  wire [63:0] _GEN_1199 = _T_184 ? data_mem_3_io_data_read_data[319:256] : _GEN_1182; // @[cache.scala 714:62 715:60]
  wire [63:0] _GEN_1225 = 4'h8 == cache_state ? _GEN_1199 : 64'h0; // @[cache.scala 330:28 218:33]
  wire [63:0] _GEN_1251 = 4'hb == cache_state ? 64'h0 : _GEN_1225; // @[cache.scala 330:28 218:33]
  wire [63:0] _GEN_1273 = 4'h9 == cache_state ? _GEN_1105 : _GEN_1251; // @[cache.scala 330:28]
  wire [63:0] _GEN_1312 = 4'ha == cache_state ? 64'h0 : _GEN_1273; // @[cache.scala 330:28 218:33]
  wire [63:0] _GEN_1379 = 4'h7 == cache_state ? _GEN_933 : _GEN_1312; // @[cache.scala 330:28]
  wire [63:0] _GEN_1464 = 4'h5 == cache_state ? 64'h0 : _GEN_1379; // @[cache.scala 330:28 218:33]
  wire [63:0] _GEN_1551 = 4'h4 == cache_state ? 64'h0 : _GEN_1464; // @[cache.scala 330:28 218:33]
  wire [63:0] _GEN_1636 = 4'h3 == cache_state ? 64'h0 : _GEN_1551; // @[cache.scala 330:28 218:33]
  wire [63:0] _GEN_1723 = 4'h2 == cache_state ? 64'h0 : _GEN_1636; // @[cache.scala 330:28 218:33]
  wire [63:0] _GEN_1810 = 4'h1 == cache_state ? 64'h0 : _GEN_1723; // @[cache.scala 330:28 218:33]
  wire [63:0] cache_data_4 = 4'h0 == cache_state ? 64'h0 : _GEN_1810; // @[cache.scala 330:28 218:33]
  wire [63:0] _GEN_759 = 4'h7 == cpu_request_addr_reg[6:3] ? result : data_mem_3_io_data_read_data[511:448]; // @[cache.scala 500:{131,131} 499:68]
  wire [63:0] _GEN_587 = 4'h7 == cpu_request_addr_reg[6:3] ? result : data_mem_2_io_data_read_data[511:448]; // @[cache.scala 500:{131,131} 499:68]
  wire [63:0] _GEN_415 = 4'h7 == cpu_request_addr_reg[6:3] ? result : data_mem_1_io_data_read_data[511:448]; // @[cache.scala 500:{131,131} 499:68]
  wire [63:0] _GEN_270 = is_match_0 ? _GEN_243 : 64'h0; // @[cache.scala 218:33 476:66]
  wire [63:0] _GEN_442 = is_match_1 ? _GEN_415 : _GEN_270; // @[cache.scala 476:66]
  wire [63:0] _GEN_614 = is_match_2 ? _GEN_587 : _GEN_442; // @[cache.scala 476:66]
  wire [63:0] _GEN_786 = is_match_3 ? _GEN_759 : _GEN_614; // @[cache.scala 476:66]
  wire [63:0] _GEN_814 = cpu_request_rw ? _GEN_786 : 64'h0; // @[cache.scala 218:33 474:53]
  wire [63:0] _GEN_936 = is_match_0 | is_match_1 | is_match_2 | is_match_3 ? _GEN_814 : 64'h0; // @[cache.scala 218:33 425:51]
  wire [63:0] _GEN_1074 = 4'h7 == index ? io_mem_io_r_bits_data : data_mem_3_io_data_read_data[511:448]; // @[cache.scala 623:60 629:{67,67}]
  wire [63:0] _GEN_1040 = 4'h7 == index ? io_mem_io_r_bits_data : data_mem_2_io_data_read_data[511:448]; // @[cache.scala 623:60 629:{67,67}]
  wire [63:0] _GEN_1006 = 4'h7 == index ? io_mem_io_r_bits_data : data_mem_1_io_data_read_data[511:448]; // @[cache.scala 623:60 629:{67,67}]
  wire [63:0] _GEN_972 = 4'h7 == index ? io_mem_io_r_bits_data : data_mem_0_io_data_read_data[511:448]; // @[cache.scala 623:60 629:{67,67}]
  wire [63:0] _GEN_988 = 2'h0 == replace ? _GEN_972 : 64'h0; // @[cache.scala 218:33 621:62]
  wire [63:0] _GEN_1022 = 2'h1 == replace ? _GEN_1006 : _GEN_988; // @[cache.scala 621:62]
  wire [63:0] _GEN_1056 = 2'h2 == replace ? _GEN_1040 : _GEN_1022; // @[cache.scala 621:62]
  wire [63:0] _GEN_1090 = 2'h3 == replace ? _GEN_1074 : _GEN_1056; // @[cache.scala 621:62]
  wire [63:0] _GEN_1108 = io_mem_io_r_valid ? _GEN_1090 : 64'h0; // @[cache.scala 218:33 619:48]
  wire [63:0] _GEN_1151 = _T_133 ? data_mem_0_io_data_read_data[511:448] : 64'h0; // @[cache.scala 218:33 714:62 715:60]
  wire [63:0] _GEN_1168 = _T_150 ? data_mem_1_io_data_read_data[511:448] : _GEN_1151; // @[cache.scala 714:62 715:60]
  wire [63:0] _GEN_1185 = _T_167 ? data_mem_2_io_data_read_data[511:448] : _GEN_1168; // @[cache.scala 714:62 715:60]
  wire [63:0] _GEN_1202 = _T_184 ? data_mem_3_io_data_read_data[511:448] : _GEN_1185; // @[cache.scala 714:62 715:60]
  wire [63:0] _GEN_1228 = 4'h8 == cache_state ? _GEN_1202 : 64'h0; // @[cache.scala 330:28 218:33]
  wire [63:0] _GEN_1254 = 4'hb == cache_state ? 64'h0 : _GEN_1228; // @[cache.scala 330:28 218:33]
  wire [63:0] _GEN_1276 = 4'h9 == cache_state ? _GEN_1108 : _GEN_1254; // @[cache.scala 330:28]
  wire [63:0] _GEN_1315 = 4'ha == cache_state ? 64'h0 : _GEN_1276; // @[cache.scala 330:28 218:33]
  wire [63:0] _GEN_1382 = 4'h7 == cache_state ? _GEN_936 : _GEN_1315; // @[cache.scala 330:28]
  wire [63:0] _GEN_1467 = 4'h5 == cache_state ? 64'h0 : _GEN_1382; // @[cache.scala 330:28 218:33]
  wire [63:0] _GEN_1554 = 4'h4 == cache_state ? 64'h0 : _GEN_1467; // @[cache.scala 330:28 218:33]
  wire [63:0] _GEN_1639 = 4'h3 == cache_state ? 64'h0 : _GEN_1554; // @[cache.scala 330:28 218:33]
  wire [63:0] _GEN_1726 = 4'h2 == cache_state ? 64'h0 : _GEN_1639; // @[cache.scala 330:28 218:33]
  wire [63:0] _GEN_1813 = 4'h1 == cache_state ? 64'h0 : _GEN_1726; // @[cache.scala 330:28 218:33]
  wire [63:0] cache_data_7 = 4'h0 == cache_state ? 64'h0 : _GEN_1813; // @[cache.scala 330:28 218:33]
  wire [63:0] _GEN_758 = 4'h6 == cpu_request_addr_reg[6:3] ? result : data_mem_3_io_data_read_data[447:384]; // @[cache.scala 500:{131,131} 499:68]
  wire [63:0] _GEN_586 = 4'h6 == cpu_request_addr_reg[6:3] ? result : data_mem_2_io_data_read_data[447:384]; // @[cache.scala 500:{131,131} 499:68]
  wire [63:0] _GEN_414 = 4'h6 == cpu_request_addr_reg[6:3] ? result : data_mem_1_io_data_read_data[447:384]; // @[cache.scala 500:{131,131} 499:68]
  wire [63:0] _GEN_269 = is_match_0 ? _GEN_242 : 64'h0; // @[cache.scala 218:33 476:66]
  wire [63:0] _GEN_441 = is_match_1 ? _GEN_414 : _GEN_269; // @[cache.scala 476:66]
  wire [63:0] _GEN_613 = is_match_2 ? _GEN_586 : _GEN_441; // @[cache.scala 476:66]
  wire [63:0] _GEN_785 = is_match_3 ? _GEN_758 : _GEN_613; // @[cache.scala 476:66]
  wire [63:0] _GEN_813 = cpu_request_rw ? _GEN_785 : 64'h0; // @[cache.scala 218:33 474:53]
  wire [63:0] _GEN_935 = is_match_0 | is_match_1 | is_match_2 | is_match_3 ? _GEN_813 : 64'h0; // @[cache.scala 218:33 425:51]
  wire [63:0] _GEN_1073 = 4'h6 == index ? io_mem_io_r_bits_data : data_mem_3_io_data_read_data[447:384]; // @[cache.scala 623:60 629:{67,67}]
  wire [63:0] _GEN_1039 = 4'h6 == index ? io_mem_io_r_bits_data : data_mem_2_io_data_read_data[447:384]; // @[cache.scala 623:60 629:{67,67}]
  wire [63:0] _GEN_1005 = 4'h6 == index ? io_mem_io_r_bits_data : data_mem_1_io_data_read_data[447:384]; // @[cache.scala 623:60 629:{67,67}]
  wire [63:0] _GEN_971 = 4'h6 == index ? io_mem_io_r_bits_data : data_mem_0_io_data_read_data[447:384]; // @[cache.scala 623:60 629:{67,67}]
  wire [63:0] _GEN_987 = 2'h0 == replace ? _GEN_971 : 64'h0; // @[cache.scala 218:33 621:62]
  wire [63:0] _GEN_1021 = 2'h1 == replace ? _GEN_1005 : _GEN_987; // @[cache.scala 621:62]
  wire [63:0] _GEN_1055 = 2'h2 == replace ? _GEN_1039 : _GEN_1021; // @[cache.scala 621:62]
  wire [63:0] _GEN_1089 = 2'h3 == replace ? _GEN_1073 : _GEN_1055; // @[cache.scala 621:62]
  wire [63:0] _GEN_1107 = io_mem_io_r_valid ? _GEN_1089 : 64'h0; // @[cache.scala 218:33 619:48]
  wire [63:0] _GEN_1150 = _T_133 ? data_mem_0_io_data_read_data[447:384] : 64'h0; // @[cache.scala 218:33 714:62 715:60]
  wire [63:0] _GEN_1167 = _T_150 ? data_mem_1_io_data_read_data[447:384] : _GEN_1150; // @[cache.scala 714:62 715:60]
  wire [63:0] _GEN_1184 = _T_167 ? data_mem_2_io_data_read_data[447:384] : _GEN_1167; // @[cache.scala 714:62 715:60]
  wire [63:0] _GEN_1201 = _T_184 ? data_mem_3_io_data_read_data[447:384] : _GEN_1184; // @[cache.scala 714:62 715:60]
  wire [63:0] _GEN_1227 = 4'h8 == cache_state ? _GEN_1201 : 64'h0; // @[cache.scala 330:28 218:33]
  wire [63:0] _GEN_1253 = 4'hb == cache_state ? 64'h0 : _GEN_1227; // @[cache.scala 330:28 218:33]
  wire [63:0] _GEN_1275 = 4'h9 == cache_state ? _GEN_1107 : _GEN_1253; // @[cache.scala 330:28]
  wire [63:0] _GEN_1314 = 4'ha == cache_state ? 64'h0 : _GEN_1275; // @[cache.scala 330:28 218:33]
  wire [63:0] _GEN_1381 = 4'h7 == cache_state ? _GEN_935 : _GEN_1314; // @[cache.scala 330:28]
  wire [63:0] _GEN_1466 = 4'h5 == cache_state ? 64'h0 : _GEN_1381; // @[cache.scala 330:28 218:33]
  wire [63:0] _GEN_1553 = 4'h4 == cache_state ? 64'h0 : _GEN_1466; // @[cache.scala 330:28 218:33]
  wire [63:0] _GEN_1638 = 4'h3 == cache_state ? 64'h0 : _GEN_1553; // @[cache.scala 330:28 218:33]
  wire [63:0] _GEN_1725 = 4'h2 == cache_state ? 64'h0 : _GEN_1638; // @[cache.scala 330:28 218:33]
  wire [63:0] _GEN_1812 = 4'h1 == cache_state ? 64'h0 : _GEN_1725; // @[cache.scala 330:28 218:33]
  wire [63:0] cache_data_6 = 4'h0 == cache_state ? 64'h0 : _GEN_1812; // @[cache.scala 330:28 218:33]
  wire [511:0] data_mem_0_io_data_write_data_lo = {cache_data_7,cache_data_6,cache_data_5,cache_data_4,cache_data_3,
    cache_data_2,cache_data_1,cache_data_0}; // @[cache.scala 503:102]
  wire [63:0] _GEN_761 = 4'h9 == cpu_request_addr_reg[6:3] ? result : data_mem_3_io_data_read_data[639:576]; // @[cache.scala 500:{131,131} 499:68]
  wire [63:0] _GEN_589 = 4'h9 == cpu_request_addr_reg[6:3] ? result : data_mem_2_io_data_read_data[639:576]; // @[cache.scala 500:{131,131} 499:68]
  wire [63:0] _GEN_417 = 4'h9 == cpu_request_addr_reg[6:3] ? result : data_mem_1_io_data_read_data[639:576]; // @[cache.scala 500:{131,131} 499:68]
  wire [63:0] _GEN_272 = is_match_0 ? _GEN_245 : 64'h0; // @[cache.scala 218:33 476:66]
  wire [63:0] _GEN_444 = is_match_1 ? _GEN_417 : _GEN_272; // @[cache.scala 476:66]
  wire [63:0] _GEN_616 = is_match_2 ? _GEN_589 : _GEN_444; // @[cache.scala 476:66]
  wire [63:0] _GEN_788 = is_match_3 ? _GEN_761 : _GEN_616; // @[cache.scala 476:66]
  wire [63:0] _GEN_816 = cpu_request_rw ? _GEN_788 : 64'h0; // @[cache.scala 218:33 474:53]
  wire [63:0] _GEN_938 = is_match_0 | is_match_1 | is_match_2 | is_match_3 ? _GEN_816 : 64'h0; // @[cache.scala 218:33 425:51]
  wire [63:0] _GEN_1076 = 4'h9 == index ? io_mem_io_r_bits_data : data_mem_3_io_data_read_data[639:576]; // @[cache.scala 623:60 629:{67,67}]
  wire [63:0] _GEN_1042 = 4'h9 == index ? io_mem_io_r_bits_data : data_mem_2_io_data_read_data[639:576]; // @[cache.scala 623:60 629:{67,67}]
  wire [63:0] _GEN_1008 = 4'h9 == index ? io_mem_io_r_bits_data : data_mem_1_io_data_read_data[639:576]; // @[cache.scala 623:60 629:{67,67}]
  wire [63:0] _GEN_974 = 4'h9 == index ? io_mem_io_r_bits_data : data_mem_0_io_data_read_data[639:576]; // @[cache.scala 623:60 629:{67,67}]
  wire [63:0] _GEN_990 = 2'h0 == replace ? _GEN_974 : 64'h0; // @[cache.scala 218:33 621:62]
  wire [63:0] _GEN_1024 = 2'h1 == replace ? _GEN_1008 : _GEN_990; // @[cache.scala 621:62]
  wire [63:0] _GEN_1058 = 2'h2 == replace ? _GEN_1042 : _GEN_1024; // @[cache.scala 621:62]
  wire [63:0] _GEN_1092 = 2'h3 == replace ? _GEN_1076 : _GEN_1058; // @[cache.scala 621:62]
  wire [63:0] _GEN_1110 = io_mem_io_r_valid ? _GEN_1092 : 64'h0; // @[cache.scala 218:33 619:48]
  wire [63:0] _GEN_1153 = _T_133 ? data_mem_0_io_data_read_data[639:576] : 64'h0; // @[cache.scala 218:33 714:62 715:60]
  wire [63:0] _GEN_1170 = _T_150 ? data_mem_1_io_data_read_data[639:576] : _GEN_1153; // @[cache.scala 714:62 715:60]
  wire [63:0] _GEN_1187 = _T_167 ? data_mem_2_io_data_read_data[639:576] : _GEN_1170; // @[cache.scala 714:62 715:60]
  wire [63:0] _GEN_1204 = _T_184 ? data_mem_3_io_data_read_data[639:576] : _GEN_1187; // @[cache.scala 714:62 715:60]
  wire [63:0] _GEN_1230 = 4'h8 == cache_state ? _GEN_1204 : 64'h0; // @[cache.scala 330:28 218:33]
  wire [63:0] _GEN_1256 = 4'hb == cache_state ? 64'h0 : _GEN_1230; // @[cache.scala 330:28 218:33]
  wire [63:0] _GEN_1278 = 4'h9 == cache_state ? _GEN_1110 : _GEN_1256; // @[cache.scala 330:28]
  wire [63:0] _GEN_1317 = 4'ha == cache_state ? 64'h0 : _GEN_1278; // @[cache.scala 330:28 218:33]
  wire [63:0] _GEN_1384 = 4'h7 == cache_state ? _GEN_938 : _GEN_1317; // @[cache.scala 330:28]
  wire [63:0] _GEN_1469 = 4'h5 == cache_state ? 64'h0 : _GEN_1384; // @[cache.scala 330:28 218:33]
  wire [63:0] _GEN_1556 = 4'h4 == cache_state ? 64'h0 : _GEN_1469; // @[cache.scala 330:28 218:33]
  wire [63:0] _GEN_1641 = 4'h3 == cache_state ? 64'h0 : _GEN_1556; // @[cache.scala 330:28 218:33]
  wire [63:0] _GEN_1728 = 4'h2 == cache_state ? 64'h0 : _GEN_1641; // @[cache.scala 330:28 218:33]
  wire [63:0] _GEN_1815 = 4'h1 == cache_state ? 64'h0 : _GEN_1728; // @[cache.scala 330:28 218:33]
  wire [63:0] cache_data_9 = 4'h0 == cache_state ? 64'h0 : _GEN_1815; // @[cache.scala 330:28 218:33]
  wire [63:0] _GEN_760 = 4'h8 == cpu_request_addr_reg[6:3] ? result : data_mem_3_io_data_read_data[575:512]; // @[cache.scala 500:{131,131} 499:68]
  wire [63:0] _GEN_588 = 4'h8 == cpu_request_addr_reg[6:3] ? result : data_mem_2_io_data_read_data[575:512]; // @[cache.scala 500:{131,131} 499:68]
  wire [63:0] _GEN_416 = 4'h8 == cpu_request_addr_reg[6:3] ? result : data_mem_1_io_data_read_data[575:512]; // @[cache.scala 500:{131,131} 499:68]
  wire [63:0] _GEN_271 = is_match_0 ? _GEN_244 : 64'h0; // @[cache.scala 218:33 476:66]
  wire [63:0] _GEN_443 = is_match_1 ? _GEN_416 : _GEN_271; // @[cache.scala 476:66]
  wire [63:0] _GEN_615 = is_match_2 ? _GEN_588 : _GEN_443; // @[cache.scala 476:66]
  wire [63:0] _GEN_787 = is_match_3 ? _GEN_760 : _GEN_615; // @[cache.scala 476:66]
  wire [63:0] _GEN_815 = cpu_request_rw ? _GEN_787 : 64'h0; // @[cache.scala 218:33 474:53]
  wire [63:0] _GEN_937 = is_match_0 | is_match_1 | is_match_2 | is_match_3 ? _GEN_815 : 64'h0; // @[cache.scala 218:33 425:51]
  wire [63:0] _GEN_1075 = 4'h8 == index ? io_mem_io_r_bits_data : data_mem_3_io_data_read_data[575:512]; // @[cache.scala 623:60 629:{67,67}]
  wire [63:0] _GEN_1041 = 4'h8 == index ? io_mem_io_r_bits_data : data_mem_2_io_data_read_data[575:512]; // @[cache.scala 623:60 629:{67,67}]
  wire [63:0] _GEN_1007 = 4'h8 == index ? io_mem_io_r_bits_data : data_mem_1_io_data_read_data[575:512]; // @[cache.scala 623:60 629:{67,67}]
  wire [63:0] _GEN_973 = 4'h8 == index ? io_mem_io_r_bits_data : data_mem_0_io_data_read_data[575:512]; // @[cache.scala 623:60 629:{67,67}]
  wire [63:0] _GEN_989 = 2'h0 == replace ? _GEN_973 : 64'h0; // @[cache.scala 218:33 621:62]
  wire [63:0] _GEN_1023 = 2'h1 == replace ? _GEN_1007 : _GEN_989; // @[cache.scala 621:62]
  wire [63:0] _GEN_1057 = 2'h2 == replace ? _GEN_1041 : _GEN_1023; // @[cache.scala 621:62]
  wire [63:0] _GEN_1091 = 2'h3 == replace ? _GEN_1075 : _GEN_1057; // @[cache.scala 621:62]
  wire [63:0] _GEN_1109 = io_mem_io_r_valid ? _GEN_1091 : 64'h0; // @[cache.scala 218:33 619:48]
  wire [63:0] _GEN_1152 = _T_133 ? data_mem_0_io_data_read_data[575:512] : 64'h0; // @[cache.scala 218:33 714:62 715:60]
  wire [63:0] _GEN_1169 = _T_150 ? data_mem_1_io_data_read_data[575:512] : _GEN_1152; // @[cache.scala 714:62 715:60]
  wire [63:0] _GEN_1186 = _T_167 ? data_mem_2_io_data_read_data[575:512] : _GEN_1169; // @[cache.scala 714:62 715:60]
  wire [63:0] _GEN_1203 = _T_184 ? data_mem_3_io_data_read_data[575:512] : _GEN_1186; // @[cache.scala 714:62 715:60]
  wire [63:0] _GEN_1229 = 4'h8 == cache_state ? _GEN_1203 : 64'h0; // @[cache.scala 330:28 218:33]
  wire [63:0] _GEN_1255 = 4'hb == cache_state ? 64'h0 : _GEN_1229; // @[cache.scala 330:28 218:33]
  wire [63:0] _GEN_1277 = 4'h9 == cache_state ? _GEN_1109 : _GEN_1255; // @[cache.scala 330:28]
  wire [63:0] _GEN_1316 = 4'ha == cache_state ? 64'h0 : _GEN_1277; // @[cache.scala 330:28 218:33]
  wire [63:0] _GEN_1383 = 4'h7 == cache_state ? _GEN_937 : _GEN_1316; // @[cache.scala 330:28]
  wire [63:0] _GEN_1468 = 4'h5 == cache_state ? 64'h0 : _GEN_1383; // @[cache.scala 330:28 218:33]
  wire [63:0] _GEN_1555 = 4'h4 == cache_state ? 64'h0 : _GEN_1468; // @[cache.scala 330:28 218:33]
  wire [63:0] _GEN_1640 = 4'h3 == cache_state ? 64'h0 : _GEN_1555; // @[cache.scala 330:28 218:33]
  wire [63:0] _GEN_1727 = 4'h2 == cache_state ? 64'h0 : _GEN_1640; // @[cache.scala 330:28 218:33]
  wire [63:0] _GEN_1814 = 4'h1 == cache_state ? 64'h0 : _GEN_1727; // @[cache.scala 330:28 218:33]
  wire [63:0] cache_data_8 = 4'h0 == cache_state ? 64'h0 : _GEN_1814; // @[cache.scala 330:28 218:33]
  wire [63:0] _GEN_763 = 4'hb == cpu_request_addr_reg[6:3] ? result : data_mem_3_io_data_read_data[767:704]; // @[cache.scala 500:{131,131} 499:68]
  wire [63:0] _GEN_591 = 4'hb == cpu_request_addr_reg[6:3] ? result : data_mem_2_io_data_read_data[767:704]; // @[cache.scala 500:{131,131} 499:68]
  wire [63:0] _GEN_419 = 4'hb == cpu_request_addr_reg[6:3] ? result : data_mem_1_io_data_read_data[767:704]; // @[cache.scala 500:{131,131} 499:68]
  wire [63:0] _GEN_274 = is_match_0 ? _GEN_247 : 64'h0; // @[cache.scala 218:33 476:66]
  wire [63:0] _GEN_446 = is_match_1 ? _GEN_419 : _GEN_274; // @[cache.scala 476:66]
  wire [63:0] _GEN_618 = is_match_2 ? _GEN_591 : _GEN_446; // @[cache.scala 476:66]
  wire [63:0] _GEN_790 = is_match_3 ? _GEN_763 : _GEN_618; // @[cache.scala 476:66]
  wire [63:0] _GEN_818 = cpu_request_rw ? _GEN_790 : 64'h0; // @[cache.scala 218:33 474:53]
  wire [63:0] _GEN_940 = is_match_0 | is_match_1 | is_match_2 | is_match_3 ? _GEN_818 : 64'h0; // @[cache.scala 218:33 425:51]
  wire [63:0] _GEN_1078 = 4'hb == index ? io_mem_io_r_bits_data : data_mem_3_io_data_read_data[767:704]; // @[cache.scala 623:60 629:{67,67}]
  wire [63:0] _GEN_1044 = 4'hb == index ? io_mem_io_r_bits_data : data_mem_2_io_data_read_data[767:704]; // @[cache.scala 623:60 629:{67,67}]
  wire [63:0] _GEN_1010 = 4'hb == index ? io_mem_io_r_bits_data : data_mem_1_io_data_read_data[767:704]; // @[cache.scala 623:60 629:{67,67}]
  wire [63:0] _GEN_976 = 4'hb == index ? io_mem_io_r_bits_data : data_mem_0_io_data_read_data[767:704]; // @[cache.scala 623:60 629:{67,67}]
  wire [63:0] _GEN_992 = 2'h0 == replace ? _GEN_976 : 64'h0; // @[cache.scala 218:33 621:62]
  wire [63:0] _GEN_1026 = 2'h1 == replace ? _GEN_1010 : _GEN_992; // @[cache.scala 621:62]
  wire [63:0] _GEN_1060 = 2'h2 == replace ? _GEN_1044 : _GEN_1026; // @[cache.scala 621:62]
  wire [63:0] _GEN_1094 = 2'h3 == replace ? _GEN_1078 : _GEN_1060; // @[cache.scala 621:62]
  wire [63:0] _GEN_1112 = io_mem_io_r_valid ? _GEN_1094 : 64'h0; // @[cache.scala 218:33 619:48]
  wire [63:0] _GEN_1155 = _T_133 ? data_mem_0_io_data_read_data[767:704] : 64'h0; // @[cache.scala 218:33 714:62 715:60]
  wire [63:0] _GEN_1172 = _T_150 ? data_mem_1_io_data_read_data[767:704] : _GEN_1155; // @[cache.scala 714:62 715:60]
  wire [63:0] _GEN_1189 = _T_167 ? data_mem_2_io_data_read_data[767:704] : _GEN_1172; // @[cache.scala 714:62 715:60]
  wire [63:0] _GEN_1206 = _T_184 ? data_mem_3_io_data_read_data[767:704] : _GEN_1189; // @[cache.scala 714:62 715:60]
  wire [63:0] _GEN_1232 = 4'h8 == cache_state ? _GEN_1206 : 64'h0; // @[cache.scala 330:28 218:33]
  wire [63:0] _GEN_1258 = 4'hb == cache_state ? 64'h0 : _GEN_1232; // @[cache.scala 330:28 218:33]
  wire [63:0] _GEN_1280 = 4'h9 == cache_state ? _GEN_1112 : _GEN_1258; // @[cache.scala 330:28]
  wire [63:0] _GEN_1319 = 4'ha == cache_state ? 64'h0 : _GEN_1280; // @[cache.scala 330:28 218:33]
  wire [63:0] _GEN_1386 = 4'h7 == cache_state ? _GEN_940 : _GEN_1319; // @[cache.scala 330:28]
  wire [63:0] _GEN_1471 = 4'h5 == cache_state ? 64'h0 : _GEN_1386; // @[cache.scala 330:28 218:33]
  wire [63:0] _GEN_1558 = 4'h4 == cache_state ? 64'h0 : _GEN_1471; // @[cache.scala 330:28 218:33]
  wire [63:0] _GEN_1643 = 4'h3 == cache_state ? 64'h0 : _GEN_1558; // @[cache.scala 330:28 218:33]
  wire [63:0] _GEN_1730 = 4'h2 == cache_state ? 64'h0 : _GEN_1643; // @[cache.scala 330:28 218:33]
  wire [63:0] _GEN_1817 = 4'h1 == cache_state ? 64'h0 : _GEN_1730; // @[cache.scala 330:28 218:33]
  wire [63:0] cache_data_11 = 4'h0 == cache_state ? 64'h0 : _GEN_1817; // @[cache.scala 330:28 218:33]
  wire [63:0] _GEN_762 = 4'ha == cpu_request_addr_reg[6:3] ? result : data_mem_3_io_data_read_data[703:640]; // @[cache.scala 500:{131,131} 499:68]
  wire [63:0] _GEN_590 = 4'ha == cpu_request_addr_reg[6:3] ? result : data_mem_2_io_data_read_data[703:640]; // @[cache.scala 500:{131,131} 499:68]
  wire [63:0] _GEN_418 = 4'ha == cpu_request_addr_reg[6:3] ? result : data_mem_1_io_data_read_data[703:640]; // @[cache.scala 500:{131,131} 499:68]
  wire [63:0] _GEN_273 = is_match_0 ? _GEN_246 : 64'h0; // @[cache.scala 218:33 476:66]
  wire [63:0] _GEN_445 = is_match_1 ? _GEN_418 : _GEN_273; // @[cache.scala 476:66]
  wire [63:0] _GEN_617 = is_match_2 ? _GEN_590 : _GEN_445; // @[cache.scala 476:66]
  wire [63:0] _GEN_789 = is_match_3 ? _GEN_762 : _GEN_617; // @[cache.scala 476:66]
  wire [63:0] _GEN_817 = cpu_request_rw ? _GEN_789 : 64'h0; // @[cache.scala 218:33 474:53]
  wire [63:0] _GEN_939 = is_match_0 | is_match_1 | is_match_2 | is_match_3 ? _GEN_817 : 64'h0; // @[cache.scala 218:33 425:51]
  wire [63:0] _GEN_1077 = 4'ha == index ? io_mem_io_r_bits_data : data_mem_3_io_data_read_data[703:640]; // @[cache.scala 623:60 629:{67,67}]
  wire [63:0] _GEN_1043 = 4'ha == index ? io_mem_io_r_bits_data : data_mem_2_io_data_read_data[703:640]; // @[cache.scala 623:60 629:{67,67}]
  wire [63:0] _GEN_1009 = 4'ha == index ? io_mem_io_r_bits_data : data_mem_1_io_data_read_data[703:640]; // @[cache.scala 623:60 629:{67,67}]
  wire [63:0] _GEN_975 = 4'ha == index ? io_mem_io_r_bits_data : data_mem_0_io_data_read_data[703:640]; // @[cache.scala 623:60 629:{67,67}]
  wire [63:0] _GEN_991 = 2'h0 == replace ? _GEN_975 : 64'h0; // @[cache.scala 218:33 621:62]
  wire [63:0] _GEN_1025 = 2'h1 == replace ? _GEN_1009 : _GEN_991; // @[cache.scala 621:62]
  wire [63:0] _GEN_1059 = 2'h2 == replace ? _GEN_1043 : _GEN_1025; // @[cache.scala 621:62]
  wire [63:0] _GEN_1093 = 2'h3 == replace ? _GEN_1077 : _GEN_1059; // @[cache.scala 621:62]
  wire [63:0] _GEN_1111 = io_mem_io_r_valid ? _GEN_1093 : 64'h0; // @[cache.scala 218:33 619:48]
  wire [63:0] _GEN_1154 = _T_133 ? data_mem_0_io_data_read_data[703:640] : 64'h0; // @[cache.scala 218:33 714:62 715:60]
  wire [63:0] _GEN_1171 = _T_150 ? data_mem_1_io_data_read_data[703:640] : _GEN_1154; // @[cache.scala 714:62 715:60]
  wire [63:0] _GEN_1188 = _T_167 ? data_mem_2_io_data_read_data[703:640] : _GEN_1171; // @[cache.scala 714:62 715:60]
  wire [63:0] _GEN_1205 = _T_184 ? data_mem_3_io_data_read_data[703:640] : _GEN_1188; // @[cache.scala 714:62 715:60]
  wire [63:0] _GEN_1231 = 4'h8 == cache_state ? _GEN_1205 : 64'h0; // @[cache.scala 330:28 218:33]
  wire [63:0] _GEN_1257 = 4'hb == cache_state ? 64'h0 : _GEN_1231; // @[cache.scala 330:28 218:33]
  wire [63:0] _GEN_1279 = 4'h9 == cache_state ? _GEN_1111 : _GEN_1257; // @[cache.scala 330:28]
  wire [63:0] _GEN_1318 = 4'ha == cache_state ? 64'h0 : _GEN_1279; // @[cache.scala 330:28 218:33]
  wire [63:0] _GEN_1385 = 4'h7 == cache_state ? _GEN_939 : _GEN_1318; // @[cache.scala 330:28]
  wire [63:0] _GEN_1470 = 4'h5 == cache_state ? 64'h0 : _GEN_1385; // @[cache.scala 330:28 218:33]
  wire [63:0] _GEN_1557 = 4'h4 == cache_state ? 64'h0 : _GEN_1470; // @[cache.scala 330:28 218:33]
  wire [63:0] _GEN_1642 = 4'h3 == cache_state ? 64'h0 : _GEN_1557; // @[cache.scala 330:28 218:33]
  wire [63:0] _GEN_1729 = 4'h2 == cache_state ? 64'h0 : _GEN_1642; // @[cache.scala 330:28 218:33]
  wire [63:0] _GEN_1816 = 4'h1 == cache_state ? 64'h0 : _GEN_1729; // @[cache.scala 330:28 218:33]
  wire [63:0] cache_data_10 = 4'h0 == cache_state ? 64'h0 : _GEN_1816; // @[cache.scala 330:28 218:33]
  wire [63:0] _GEN_765 = 4'hd == cpu_request_addr_reg[6:3] ? result : data_mem_3_io_data_read_data[895:832]; // @[cache.scala 500:{131,131} 499:68]
  wire [63:0] _GEN_593 = 4'hd == cpu_request_addr_reg[6:3] ? result : data_mem_2_io_data_read_data[895:832]; // @[cache.scala 500:{131,131} 499:68]
  wire [63:0] _GEN_421 = 4'hd == cpu_request_addr_reg[6:3] ? result : data_mem_1_io_data_read_data[895:832]; // @[cache.scala 500:{131,131} 499:68]
  wire [63:0] _GEN_276 = is_match_0 ? _GEN_249 : 64'h0; // @[cache.scala 218:33 476:66]
  wire [63:0] _GEN_448 = is_match_1 ? _GEN_421 : _GEN_276; // @[cache.scala 476:66]
  wire [63:0] _GEN_620 = is_match_2 ? _GEN_593 : _GEN_448; // @[cache.scala 476:66]
  wire [63:0] _GEN_792 = is_match_3 ? _GEN_765 : _GEN_620; // @[cache.scala 476:66]
  wire [63:0] _GEN_820 = cpu_request_rw ? _GEN_792 : 64'h0; // @[cache.scala 218:33 474:53]
  wire [63:0] _GEN_942 = is_match_0 | is_match_1 | is_match_2 | is_match_3 ? _GEN_820 : 64'h0; // @[cache.scala 218:33 425:51]
  wire [63:0] _GEN_1080 = 4'hd == index ? io_mem_io_r_bits_data : data_mem_3_io_data_read_data[895:832]; // @[cache.scala 623:60 629:{67,67}]
  wire [63:0] _GEN_1046 = 4'hd == index ? io_mem_io_r_bits_data : data_mem_2_io_data_read_data[895:832]; // @[cache.scala 623:60 629:{67,67}]
  wire [63:0] _GEN_1012 = 4'hd == index ? io_mem_io_r_bits_data : data_mem_1_io_data_read_data[895:832]; // @[cache.scala 623:60 629:{67,67}]
  wire [63:0] _GEN_978 = 4'hd == index ? io_mem_io_r_bits_data : data_mem_0_io_data_read_data[895:832]; // @[cache.scala 623:60 629:{67,67}]
  wire [63:0] _GEN_994 = 2'h0 == replace ? _GEN_978 : 64'h0; // @[cache.scala 218:33 621:62]
  wire [63:0] _GEN_1028 = 2'h1 == replace ? _GEN_1012 : _GEN_994; // @[cache.scala 621:62]
  wire [63:0] _GEN_1062 = 2'h2 == replace ? _GEN_1046 : _GEN_1028; // @[cache.scala 621:62]
  wire [63:0] _GEN_1096 = 2'h3 == replace ? _GEN_1080 : _GEN_1062; // @[cache.scala 621:62]
  wire [63:0] _GEN_1114 = io_mem_io_r_valid ? _GEN_1096 : 64'h0; // @[cache.scala 218:33 619:48]
  wire [63:0] _GEN_1157 = _T_133 ? data_mem_0_io_data_read_data[895:832] : 64'h0; // @[cache.scala 218:33 714:62 715:60]
  wire [63:0] _GEN_1174 = _T_150 ? data_mem_1_io_data_read_data[895:832] : _GEN_1157; // @[cache.scala 714:62 715:60]
  wire [63:0] _GEN_1191 = _T_167 ? data_mem_2_io_data_read_data[895:832] : _GEN_1174; // @[cache.scala 714:62 715:60]
  wire [63:0] _GEN_1208 = _T_184 ? data_mem_3_io_data_read_data[895:832] : _GEN_1191; // @[cache.scala 714:62 715:60]
  wire [63:0] _GEN_1234 = 4'h8 == cache_state ? _GEN_1208 : 64'h0; // @[cache.scala 330:28 218:33]
  wire [63:0] _GEN_1260 = 4'hb == cache_state ? 64'h0 : _GEN_1234; // @[cache.scala 330:28 218:33]
  wire [63:0] _GEN_1282 = 4'h9 == cache_state ? _GEN_1114 : _GEN_1260; // @[cache.scala 330:28]
  wire [63:0] _GEN_1321 = 4'ha == cache_state ? 64'h0 : _GEN_1282; // @[cache.scala 330:28 218:33]
  wire [63:0] _GEN_1388 = 4'h7 == cache_state ? _GEN_942 : _GEN_1321; // @[cache.scala 330:28]
  wire [63:0] _GEN_1473 = 4'h5 == cache_state ? 64'h0 : _GEN_1388; // @[cache.scala 330:28 218:33]
  wire [63:0] _GEN_1560 = 4'h4 == cache_state ? 64'h0 : _GEN_1473; // @[cache.scala 330:28 218:33]
  wire [63:0] _GEN_1645 = 4'h3 == cache_state ? 64'h0 : _GEN_1560; // @[cache.scala 330:28 218:33]
  wire [63:0] _GEN_1732 = 4'h2 == cache_state ? 64'h0 : _GEN_1645; // @[cache.scala 330:28 218:33]
  wire [63:0] _GEN_1819 = 4'h1 == cache_state ? 64'h0 : _GEN_1732; // @[cache.scala 330:28 218:33]
  wire [63:0] cache_data_13 = 4'h0 == cache_state ? 64'h0 : _GEN_1819; // @[cache.scala 330:28 218:33]
  wire [63:0] _GEN_764 = 4'hc == cpu_request_addr_reg[6:3] ? result : data_mem_3_io_data_read_data[831:768]; // @[cache.scala 500:{131,131} 499:68]
  wire [63:0] _GEN_592 = 4'hc == cpu_request_addr_reg[6:3] ? result : data_mem_2_io_data_read_data[831:768]; // @[cache.scala 500:{131,131} 499:68]
  wire [63:0] _GEN_420 = 4'hc == cpu_request_addr_reg[6:3] ? result : data_mem_1_io_data_read_data[831:768]; // @[cache.scala 500:{131,131} 499:68]
  wire [63:0] _GEN_275 = is_match_0 ? _GEN_248 : 64'h0; // @[cache.scala 218:33 476:66]
  wire [63:0] _GEN_447 = is_match_1 ? _GEN_420 : _GEN_275; // @[cache.scala 476:66]
  wire [63:0] _GEN_619 = is_match_2 ? _GEN_592 : _GEN_447; // @[cache.scala 476:66]
  wire [63:0] _GEN_791 = is_match_3 ? _GEN_764 : _GEN_619; // @[cache.scala 476:66]
  wire [63:0] _GEN_819 = cpu_request_rw ? _GEN_791 : 64'h0; // @[cache.scala 218:33 474:53]
  wire [63:0] _GEN_941 = is_match_0 | is_match_1 | is_match_2 | is_match_3 ? _GEN_819 : 64'h0; // @[cache.scala 218:33 425:51]
  wire [63:0] _GEN_1079 = 4'hc == index ? io_mem_io_r_bits_data : data_mem_3_io_data_read_data[831:768]; // @[cache.scala 623:60 629:{67,67}]
  wire [63:0] _GEN_1045 = 4'hc == index ? io_mem_io_r_bits_data : data_mem_2_io_data_read_data[831:768]; // @[cache.scala 623:60 629:{67,67}]
  wire [63:0] _GEN_1011 = 4'hc == index ? io_mem_io_r_bits_data : data_mem_1_io_data_read_data[831:768]; // @[cache.scala 623:60 629:{67,67}]
  wire [63:0] _GEN_977 = 4'hc == index ? io_mem_io_r_bits_data : data_mem_0_io_data_read_data[831:768]; // @[cache.scala 623:60 629:{67,67}]
  wire [63:0] _GEN_993 = 2'h0 == replace ? _GEN_977 : 64'h0; // @[cache.scala 218:33 621:62]
  wire [63:0] _GEN_1027 = 2'h1 == replace ? _GEN_1011 : _GEN_993; // @[cache.scala 621:62]
  wire [63:0] _GEN_1061 = 2'h2 == replace ? _GEN_1045 : _GEN_1027; // @[cache.scala 621:62]
  wire [63:0] _GEN_1095 = 2'h3 == replace ? _GEN_1079 : _GEN_1061; // @[cache.scala 621:62]
  wire [63:0] _GEN_1113 = io_mem_io_r_valid ? _GEN_1095 : 64'h0; // @[cache.scala 218:33 619:48]
  wire [63:0] _GEN_1156 = _T_133 ? data_mem_0_io_data_read_data[831:768] : 64'h0; // @[cache.scala 218:33 714:62 715:60]
  wire [63:0] _GEN_1173 = _T_150 ? data_mem_1_io_data_read_data[831:768] : _GEN_1156; // @[cache.scala 714:62 715:60]
  wire [63:0] _GEN_1190 = _T_167 ? data_mem_2_io_data_read_data[831:768] : _GEN_1173; // @[cache.scala 714:62 715:60]
  wire [63:0] _GEN_1207 = _T_184 ? data_mem_3_io_data_read_data[831:768] : _GEN_1190; // @[cache.scala 714:62 715:60]
  wire [63:0] _GEN_1233 = 4'h8 == cache_state ? _GEN_1207 : 64'h0; // @[cache.scala 330:28 218:33]
  wire [63:0] _GEN_1259 = 4'hb == cache_state ? 64'h0 : _GEN_1233; // @[cache.scala 330:28 218:33]
  wire [63:0] _GEN_1281 = 4'h9 == cache_state ? _GEN_1113 : _GEN_1259; // @[cache.scala 330:28]
  wire [63:0] _GEN_1320 = 4'ha == cache_state ? 64'h0 : _GEN_1281; // @[cache.scala 330:28 218:33]
  wire [63:0] _GEN_1387 = 4'h7 == cache_state ? _GEN_941 : _GEN_1320; // @[cache.scala 330:28]
  wire [63:0] _GEN_1472 = 4'h5 == cache_state ? 64'h0 : _GEN_1387; // @[cache.scala 330:28 218:33]
  wire [63:0] _GEN_1559 = 4'h4 == cache_state ? 64'h0 : _GEN_1472; // @[cache.scala 330:28 218:33]
  wire [63:0] _GEN_1644 = 4'h3 == cache_state ? 64'h0 : _GEN_1559; // @[cache.scala 330:28 218:33]
  wire [63:0] _GEN_1731 = 4'h2 == cache_state ? 64'h0 : _GEN_1644; // @[cache.scala 330:28 218:33]
  wire [63:0] _GEN_1818 = 4'h1 == cache_state ? 64'h0 : _GEN_1731; // @[cache.scala 330:28 218:33]
  wire [63:0] cache_data_12 = 4'h0 == cache_state ? 64'h0 : _GEN_1818; // @[cache.scala 330:28 218:33]
  wire [63:0] _GEN_767 = 4'hf == cpu_request_addr_reg[6:3] ? result : data_mem_3_io_data_read_data[1023:960]; // @[cache.scala 500:{131,131} 499:68]
  wire [63:0] _GEN_595 = 4'hf == cpu_request_addr_reg[6:3] ? result : data_mem_2_io_data_read_data[1023:960]; // @[cache.scala 500:{131,131} 499:68]
  wire [63:0] _GEN_423 = 4'hf == cpu_request_addr_reg[6:3] ? result : data_mem_1_io_data_read_data[1023:960]; // @[cache.scala 500:{131,131} 499:68]
  wire [63:0] _GEN_278 = is_match_0 ? _GEN_251 : 64'h0; // @[cache.scala 218:33 476:66]
  wire [63:0] _GEN_450 = is_match_1 ? _GEN_423 : _GEN_278; // @[cache.scala 476:66]
  wire [63:0] _GEN_622 = is_match_2 ? _GEN_595 : _GEN_450; // @[cache.scala 476:66]
  wire [63:0] _GEN_794 = is_match_3 ? _GEN_767 : _GEN_622; // @[cache.scala 476:66]
  wire [63:0] _GEN_822 = cpu_request_rw ? _GEN_794 : 64'h0; // @[cache.scala 218:33 474:53]
  wire [63:0] _GEN_944 = is_match_0 | is_match_1 | is_match_2 | is_match_3 ? _GEN_822 : 64'h0; // @[cache.scala 218:33 425:51]
  wire [63:0] _GEN_1082 = 4'hf == index ? io_mem_io_r_bits_data : data_mem_3_io_data_read_data[1023:960]; // @[cache.scala 623:60 629:{67,67}]
  wire [63:0] _GEN_1048 = 4'hf == index ? io_mem_io_r_bits_data : data_mem_2_io_data_read_data[1023:960]; // @[cache.scala 623:60 629:{67,67}]
  wire [63:0] _GEN_1014 = 4'hf == index ? io_mem_io_r_bits_data : data_mem_1_io_data_read_data[1023:960]; // @[cache.scala 623:60 629:{67,67}]
  wire [63:0] _GEN_980 = 4'hf == index ? io_mem_io_r_bits_data : data_mem_0_io_data_read_data[1023:960]; // @[cache.scala 623:60 629:{67,67}]
  wire [63:0] _GEN_996 = 2'h0 == replace ? _GEN_980 : 64'h0; // @[cache.scala 218:33 621:62]
  wire [63:0] _GEN_1030 = 2'h1 == replace ? _GEN_1014 : _GEN_996; // @[cache.scala 621:62]
  wire [63:0] _GEN_1064 = 2'h2 == replace ? _GEN_1048 : _GEN_1030; // @[cache.scala 621:62]
  wire [63:0] _GEN_1098 = 2'h3 == replace ? _GEN_1082 : _GEN_1064; // @[cache.scala 621:62]
  wire [63:0] _GEN_1116 = io_mem_io_r_valid ? _GEN_1098 : 64'h0; // @[cache.scala 218:33 619:48]
  wire [63:0] _GEN_1159 = _T_133 ? data_mem_0_io_data_read_data[1023:960] : 64'h0; // @[cache.scala 218:33 714:62 715:60]
  wire [63:0] _GEN_1176 = _T_150 ? data_mem_1_io_data_read_data[1023:960] : _GEN_1159; // @[cache.scala 714:62 715:60]
  wire [63:0] _GEN_1193 = _T_167 ? data_mem_2_io_data_read_data[1023:960] : _GEN_1176; // @[cache.scala 714:62 715:60]
  wire [63:0] _GEN_1210 = _T_184 ? data_mem_3_io_data_read_data[1023:960] : _GEN_1193; // @[cache.scala 714:62 715:60]
  wire [63:0] _GEN_1236 = 4'h8 == cache_state ? _GEN_1210 : 64'h0; // @[cache.scala 330:28 218:33]
  wire [63:0] _GEN_1262 = 4'hb == cache_state ? 64'h0 : _GEN_1236; // @[cache.scala 330:28 218:33]
  wire [63:0] _GEN_1284 = 4'h9 == cache_state ? _GEN_1116 : _GEN_1262; // @[cache.scala 330:28]
  wire [63:0] _GEN_1323 = 4'ha == cache_state ? 64'h0 : _GEN_1284; // @[cache.scala 330:28 218:33]
  wire [63:0] _GEN_1390 = 4'h7 == cache_state ? _GEN_944 : _GEN_1323; // @[cache.scala 330:28]
  wire [63:0] _GEN_1475 = 4'h5 == cache_state ? 64'h0 : _GEN_1390; // @[cache.scala 330:28 218:33]
  wire [63:0] _GEN_1562 = 4'h4 == cache_state ? 64'h0 : _GEN_1475; // @[cache.scala 330:28 218:33]
  wire [63:0] _GEN_1647 = 4'h3 == cache_state ? 64'h0 : _GEN_1562; // @[cache.scala 330:28 218:33]
  wire [63:0] _GEN_1734 = 4'h2 == cache_state ? 64'h0 : _GEN_1647; // @[cache.scala 330:28 218:33]
  wire [63:0] _GEN_1821 = 4'h1 == cache_state ? 64'h0 : _GEN_1734; // @[cache.scala 330:28 218:33]
  wire [63:0] cache_data_15 = 4'h0 == cache_state ? 64'h0 : _GEN_1821; // @[cache.scala 330:28 218:33]
  wire [63:0] _GEN_766 = 4'he == cpu_request_addr_reg[6:3] ? result : data_mem_3_io_data_read_data[959:896]; // @[cache.scala 500:{131,131} 499:68]
  wire [63:0] _GEN_594 = 4'he == cpu_request_addr_reg[6:3] ? result : data_mem_2_io_data_read_data[959:896]; // @[cache.scala 500:{131,131} 499:68]
  wire [63:0] _GEN_422 = 4'he == cpu_request_addr_reg[6:3] ? result : data_mem_1_io_data_read_data[959:896]; // @[cache.scala 500:{131,131} 499:68]
  wire [63:0] _GEN_277 = is_match_0 ? _GEN_250 : 64'h0; // @[cache.scala 218:33 476:66]
  wire [63:0] _GEN_449 = is_match_1 ? _GEN_422 : _GEN_277; // @[cache.scala 476:66]
  wire [63:0] _GEN_621 = is_match_2 ? _GEN_594 : _GEN_449; // @[cache.scala 476:66]
  wire [63:0] _GEN_793 = is_match_3 ? _GEN_766 : _GEN_621; // @[cache.scala 476:66]
  wire [63:0] _GEN_821 = cpu_request_rw ? _GEN_793 : 64'h0; // @[cache.scala 218:33 474:53]
  wire [63:0] _GEN_943 = is_match_0 | is_match_1 | is_match_2 | is_match_3 ? _GEN_821 : 64'h0; // @[cache.scala 218:33 425:51]
  wire [63:0] _GEN_1081 = 4'he == index ? io_mem_io_r_bits_data : data_mem_3_io_data_read_data[959:896]; // @[cache.scala 623:60 629:{67,67}]
  wire [63:0] _GEN_1047 = 4'he == index ? io_mem_io_r_bits_data : data_mem_2_io_data_read_data[959:896]; // @[cache.scala 623:60 629:{67,67}]
  wire [63:0] _GEN_1013 = 4'he == index ? io_mem_io_r_bits_data : data_mem_1_io_data_read_data[959:896]; // @[cache.scala 623:60 629:{67,67}]
  wire [63:0] _GEN_979 = 4'he == index ? io_mem_io_r_bits_data : data_mem_0_io_data_read_data[959:896]; // @[cache.scala 623:60 629:{67,67}]
  wire [63:0] _GEN_995 = 2'h0 == replace ? _GEN_979 : 64'h0; // @[cache.scala 218:33 621:62]
  wire [63:0] _GEN_1029 = 2'h1 == replace ? _GEN_1013 : _GEN_995; // @[cache.scala 621:62]
  wire [63:0] _GEN_1063 = 2'h2 == replace ? _GEN_1047 : _GEN_1029; // @[cache.scala 621:62]
  wire [63:0] _GEN_1097 = 2'h3 == replace ? _GEN_1081 : _GEN_1063; // @[cache.scala 621:62]
  wire [63:0] _GEN_1115 = io_mem_io_r_valid ? _GEN_1097 : 64'h0; // @[cache.scala 218:33 619:48]
  wire [63:0] _GEN_1158 = _T_133 ? data_mem_0_io_data_read_data[959:896] : 64'h0; // @[cache.scala 218:33 714:62 715:60]
  wire [63:0] _GEN_1175 = _T_150 ? data_mem_1_io_data_read_data[959:896] : _GEN_1158; // @[cache.scala 714:62 715:60]
  wire [63:0] _GEN_1192 = _T_167 ? data_mem_2_io_data_read_data[959:896] : _GEN_1175; // @[cache.scala 714:62 715:60]
  wire [63:0] _GEN_1209 = _T_184 ? data_mem_3_io_data_read_data[959:896] : _GEN_1192; // @[cache.scala 714:62 715:60]
  wire [63:0] _GEN_1235 = 4'h8 == cache_state ? _GEN_1209 : 64'h0; // @[cache.scala 330:28 218:33]
  wire [63:0] _GEN_1261 = 4'hb == cache_state ? 64'h0 : _GEN_1235; // @[cache.scala 330:28 218:33]
  wire [63:0] _GEN_1283 = 4'h9 == cache_state ? _GEN_1115 : _GEN_1261; // @[cache.scala 330:28]
  wire [63:0] _GEN_1322 = 4'ha == cache_state ? 64'h0 : _GEN_1283; // @[cache.scala 330:28 218:33]
  wire [63:0] _GEN_1389 = 4'h7 == cache_state ? _GEN_943 : _GEN_1322; // @[cache.scala 330:28]
  wire [63:0] _GEN_1474 = 4'h5 == cache_state ? 64'h0 : _GEN_1389; // @[cache.scala 330:28 218:33]
  wire [63:0] _GEN_1561 = 4'h4 == cache_state ? 64'h0 : _GEN_1474; // @[cache.scala 330:28 218:33]
  wire [63:0] _GEN_1646 = 4'h3 == cache_state ? 64'h0 : _GEN_1561; // @[cache.scala 330:28 218:33]
  wire [63:0] _GEN_1733 = 4'h2 == cache_state ? 64'h0 : _GEN_1646; // @[cache.scala 330:28 218:33]
  wire [63:0] _GEN_1820 = 4'h1 == cache_state ? 64'h0 : _GEN_1733; // @[cache.scala 330:28 218:33]
  wire [63:0] cache_data_14 = 4'h0 == cache_state ? 64'h0 : _GEN_1820; // @[cache.scala 330:28 218:33]
  wire [1023:0] _data_mem_0_io_data_write_data_T = {cache_data_15,cache_data_14,cache_data_13,cache_data_12,
    cache_data_11,cache_data_10,cache_data_9,cache_data_8,data_mem_0_io_data_write_data_lo}; // @[cache.scala 503:102]
  wire [1023:0] _GEN_279 = is_match_0 ? _data_mem_0_io_data_write_data_T : data_mem_0_io_data_read_data; // @[cache.scala 258:43 476:66 503:88]
  wire [1023:0] _GEN_451 = is_match_1 ? _data_mem_0_io_data_write_data_T : data_mem_1_io_data_read_data; // @[cache.scala 258:43 476:66 503:88]
  wire [1023:0] _GEN_623 = is_match_2 ? _data_mem_0_io_data_write_data_T : data_mem_2_io_data_read_data; // @[cache.scala 258:43 476:66 503:88]
  wire [1023:0] _GEN_795 = is_match_3 ? _data_mem_0_io_data_write_data_T : data_mem_3_io_data_read_data; // @[cache.scala 258:43 476:66 503:88]
  wire  _GEN_796 = cpu_request_rw & is_match_0; // @[cache.scala 256:45 474:53]
  wire [1023:0] _GEN_823 = cpu_request_rw ? _GEN_279 : data_mem_0_io_data_read_data; // @[cache.scala 258:43 474:53]
  wire  _GEN_824 = cpu_request_rw & is_match_1; // @[cache.scala 256:45 474:53]
  wire [1023:0] _GEN_825 = cpu_request_rw ? _GEN_451 : data_mem_1_io_data_read_data; // @[cache.scala 258:43 474:53]
  wire  _GEN_826 = cpu_request_rw & is_match_2; // @[cache.scala 256:45 474:53]
  wire [1023:0] _GEN_827 = cpu_request_rw ? _GEN_623 : data_mem_2_io_data_read_data; // @[cache.scala 258:43 474:53]
  wire  _GEN_828 = cpu_request_rw & is_match_3; // @[cache.scala 256:45 474:53]
  wire [1023:0] _GEN_829 = cpu_request_rw ? _GEN_795 : data_mem_3_io_data_read_data; // @[cache.scala 258:43 474:53]
  wire [2:0] _GEN_830 = _T_6 ? 3'h7 : 3'h0; // @[cache.scala 508:139 509:52 511:52]
  wire [7:0] _GEN_832 = tag_mem_0_io_tag_read_valid & tag_mem_1_io_tag_read_valid & tag_mem_2_io_tag_read_valid &
    tag_mem_3_io_tag_read_valid ? tag_mem_1_io_tag_read_visit : 8'h0; // @[cache.scala 325:28 527:92 529:47]
  wire [7:0] _GEN_954 = is_match_0 | is_match_1 | is_match_2 | is_match_3 ? 8'h0 : _GEN_832; // @[cache.scala 325:28 425:51]
  wire [7:0] _GEN_1400 = 4'h7 == cache_state ? _GEN_954 : 8'h0; // @[cache.scala 325:28 330:28]
  wire [7:0] _GEN_1484 = 4'h5 == cache_state ? 8'h0 : _GEN_1400; // @[cache.scala 325:28 330:28]
  wire [7:0] _GEN_1571 = 4'h4 == cache_state ? 8'h0 : _GEN_1484; // @[cache.scala 325:28 330:28]
  wire [7:0] _GEN_1656 = 4'h3 == cache_state ? 8'h0 : _GEN_1571; // @[cache.scala 325:28 330:28]
  wire [7:0] _GEN_1743 = 4'h2 == cache_state ? 8'h0 : _GEN_1656; // @[cache.scala 325:28 330:28]
  wire [7:0] _GEN_1830 = 4'h1 == cache_state ? 8'h0 : _GEN_1743; // @[cache.scala 325:28 330:28]
  wire [7:0] visit_1 = 4'h0 == cache_state ? 8'h0 : _GEN_1830; // @[cache.scala 325:28 330:28]
  wire [7:0] _GEN_831 = tag_mem_0_io_tag_read_valid & tag_mem_1_io_tag_read_valid & tag_mem_2_io_tag_read_valid &
    tag_mem_3_io_tag_read_valid ? tag_mem_0_io_tag_read_visit : 8'h0; // @[cache.scala 325:28 527:92 529:47]
  wire [7:0] _GEN_953 = is_match_0 | is_match_1 | is_match_2 | is_match_3 ? 8'h0 : _GEN_831; // @[cache.scala 325:28 425:51]
  wire [7:0] _GEN_1399 = 4'h7 == cache_state ? _GEN_953 : 8'h0; // @[cache.scala 325:28 330:28]
  wire [7:0] _GEN_1483 = 4'h5 == cache_state ? 8'h0 : _GEN_1399; // @[cache.scala 325:28 330:28]
  wire [7:0] _GEN_1570 = 4'h4 == cache_state ? 8'h0 : _GEN_1483; // @[cache.scala 325:28 330:28]
  wire [7:0] _GEN_1655 = 4'h3 == cache_state ? 8'h0 : _GEN_1570; // @[cache.scala 325:28 330:28]
  wire [7:0] _GEN_1742 = 4'h2 == cache_state ? 8'h0 : _GEN_1655; // @[cache.scala 325:28 330:28]
  wire [7:0] _GEN_1829 = 4'h1 == cache_state ? 8'h0 : _GEN_1742; // @[cache.scala 325:28 330:28]
  wire [7:0] visit_0 = 4'h0 == cache_state ? 8'h0 : _GEN_1829; // @[cache.scala 325:28 330:28]
  wire [7:0] _GEN_834 = tag_mem_0_io_tag_read_valid & tag_mem_1_io_tag_read_valid & tag_mem_2_io_tag_read_valid &
    tag_mem_3_io_tag_read_valid ? tag_mem_3_io_tag_read_visit : 8'h0; // @[cache.scala 325:28 527:92 529:47]
  wire [7:0] _GEN_956 = is_match_0 | is_match_1 | is_match_2 | is_match_3 ? 8'h0 : _GEN_834; // @[cache.scala 325:28 425:51]
  wire [7:0] _GEN_1402 = 4'h7 == cache_state ? _GEN_956 : 8'h0; // @[cache.scala 325:28 330:28]
  wire [7:0] _GEN_1486 = 4'h5 == cache_state ? 8'h0 : _GEN_1402; // @[cache.scala 325:28 330:28]
  wire [7:0] _GEN_1573 = 4'h4 == cache_state ? 8'h0 : _GEN_1486; // @[cache.scala 325:28 330:28]
  wire [7:0] _GEN_1658 = 4'h3 == cache_state ? 8'h0 : _GEN_1573; // @[cache.scala 325:28 330:28]
  wire [7:0] _GEN_1745 = 4'h2 == cache_state ? 8'h0 : _GEN_1658; // @[cache.scala 325:28 330:28]
  wire [7:0] _GEN_1832 = 4'h1 == cache_state ? 8'h0 : _GEN_1745; // @[cache.scala 325:28 330:28]
  wire [7:0] visit_3 = 4'h0 == cache_state ? 8'h0 : _GEN_1832; // @[cache.scala 325:28 330:28]
  wire [7:0] _GEN_833 = tag_mem_0_io_tag_read_valid & tag_mem_1_io_tag_read_valid & tag_mem_2_io_tag_read_valid &
    tag_mem_3_io_tag_read_valid ? tag_mem_2_io_tag_read_visit : 8'h0; // @[cache.scala 325:28 527:92 529:47]
  wire [7:0] _GEN_955 = is_match_0 | is_match_1 | is_match_2 | is_match_3 ? 8'h0 : _GEN_833; // @[cache.scala 325:28 425:51]
  wire [7:0] _GEN_1401 = 4'h7 == cache_state ? _GEN_955 : 8'h0; // @[cache.scala 325:28 330:28]
  wire [7:0] _GEN_1485 = 4'h5 == cache_state ? 8'h0 : _GEN_1401; // @[cache.scala 325:28 330:28]
  wire [7:0] _GEN_1572 = 4'h4 == cache_state ? 8'h0 : _GEN_1485; // @[cache.scala 325:28 330:28]
  wire [7:0] _GEN_1657 = 4'h3 == cache_state ? 8'h0 : _GEN_1572; // @[cache.scala 325:28 330:28]
  wire [7:0] _GEN_1744 = 4'h2 == cache_state ? 8'h0 : _GEN_1657; // @[cache.scala 325:28 330:28]
  wire [7:0] _GEN_1831 = 4'h1 == cache_state ? 8'h0 : _GEN_1744; // @[cache.scala 325:28 330:28]
  wire [7:0] visit_2 = 4'h0 == cache_state ? 8'h0 : _GEN_1831; // @[cache.scala 325:28 330:28]
  wire  _GEN_836 = tag_mem_0_io_tag_read_valid & tag_mem_1_io_tag_read_valid & tag_mem_2_io_tag_read_valid &
    tag_mem_3_io_tag_read_valid & visit_3 > visit_2; // @[cache.scala 527:92 531:53]
  wire  _GEN_958 = is_match_0 | is_match_1 | is_match_2 | is_match_3 ? 1'h0 : _GEN_836; // @[cache.scala 425:51]
  wire  _GEN_1488 = 4'h5 == cache_state ? 1'h0 : 4'h7 == cache_state & _GEN_958; // @[cache.scala 330:28]
  wire  _GEN_1575 = 4'h4 == cache_state ? 1'h0 : _GEN_1488; // @[cache.scala 330:28]
  wire  _GEN_1660 = 4'h3 == cache_state ? 1'h0 : _GEN_1575; // @[cache.scala 330:28]
  wire  _GEN_1747 = 4'h2 == cache_state ? 1'h0 : _GEN_1660; // @[cache.scala 330:28]
  wire  _GEN_1834 = 4'h1 == cache_state ? 1'h0 : _GEN_1747; // @[cache.scala 330:28]
  wire  compare_2_3 = 4'h0 == cache_state ? 1'h0 : _GEN_1834; // @[cache.scala 330:28]
  wire [7:0] _max_01_or_23_T = compare_2_3 ? visit_3 : visit_2; // @[cache.scala 532:60]
  wire  _GEN_835 = tag_mem_0_io_tag_read_valid & tag_mem_1_io_tag_read_valid & tag_mem_2_io_tag_read_valid &
    tag_mem_3_io_tag_read_valid & visit_1 > visit_0; // @[cache.scala 527:92 530:53]
  wire  _GEN_957 = is_match_0 | is_match_1 | is_match_2 | is_match_3 ? 1'h0 : _GEN_835; // @[cache.scala 425:51]
  wire  _GEN_1487 = 4'h5 == cache_state ? 1'h0 : 4'h7 == cache_state & _GEN_957; // @[cache.scala 330:28]
  wire  _GEN_1574 = 4'h4 == cache_state ? 1'h0 : _GEN_1487; // @[cache.scala 330:28]
  wire  _GEN_1659 = 4'h3 == cache_state ? 1'h0 : _GEN_1574; // @[cache.scala 330:28]
  wire  _GEN_1746 = 4'h2 == cache_state ? 1'h0 : _GEN_1659; // @[cache.scala 330:28]
  wire  _GEN_1833 = 4'h1 == cache_state ? 1'h0 : _GEN_1746; // @[cache.scala 330:28]
  wire  compare_1_0 = 4'h0 == cache_state ? 1'h0 : _GEN_1833; // @[cache.scala 330:28]
  wire [7:0] _max_01_or_23_T_1 = compare_1_0 ? visit_1 : visit_0; // @[cache.scala 532:99]
  wire  _GEN_837 = tag_mem_0_io_tag_read_valid & tag_mem_1_io_tag_read_valid & tag_mem_2_io_tag_read_valid &
    tag_mem_3_io_tag_read_valid & _max_01_or_23_T > _max_01_or_23_T_1; // @[cache.scala 527:92 532:54]
  wire  _GEN_959 = is_match_0 | is_match_1 | is_match_2 | is_match_3 ? 1'h0 : _GEN_837; // @[cache.scala 425:51]
  wire  _GEN_1489 = 4'h5 == cache_state ? 1'h0 : 4'h7 == cache_state & _GEN_959; // @[cache.scala 330:28]
  wire  _GEN_1576 = 4'h4 == cache_state ? 1'h0 : _GEN_1489; // @[cache.scala 330:28]
  wire  _GEN_1661 = 4'h3 == cache_state ? 1'h0 : _GEN_1576; // @[cache.scala 330:28]
  wire  _GEN_1748 = 4'h2 == cache_state ? 1'h0 : _GEN_1661; // @[cache.scala 330:28]
  wire  _GEN_1835 = 4'h1 == cache_state ? 1'h0 : _GEN_1748; // @[cache.scala 330:28]
  wire  max_01_or_23 = 4'h0 == cache_state ? 1'h0 : _GEN_1835; // @[cache.scala 330:28]
  wire  _max_T = max_01_or_23 ? compare_2_3 : compare_1_0; // @[cache.scala 533:69]
  wire [1:0] _max_T_1 = {max_01_or_23,_max_T}; // @[Cat.scala 31:58]
  wire  _max_T_2 = ~tag_mem_1_io_tag_read_valid; // @[cache.scala 542:97]
  wire  _max_T_3 = ~tag_mem_2_io_tag_read_valid; // @[cache.scala 542:144]
  wire  _max_T_4 = ~tag_mem_3_io_tag_read_valid; // @[cache.scala 542:191]
  wire [1:0] _max_T_5 = _max_T_4 ? 2'h3 : 2'h0; // @[Mux.scala 101:16]
  wire [1:0] _max_T_6 = _max_T_3 ? 2'h2 : _max_T_5; // @[Mux.scala 101:16]
  wire [1:0] _max_T_7 = _max_T_2 ? 2'h1 : _max_T_6; // @[Mux.scala 101:16]
  wire [1:0] _GEN_838 = tag_mem_0_io_tag_read_valid & tag_mem_1_io_tag_read_valid & tag_mem_2_io_tag_read_valid &
    tag_mem_3_io_tag_read_valid ? _max_T_1 : _max_T_7; // @[cache.scala 527:92 533:45 542:45]
  wire [1:0] _GEN_960 = is_match_0 | is_match_1 | is_match_2 | is_match_3 ? 2'h0 : _GEN_838; // @[cache.scala 425:51]
  wire [1:0] _GEN_1406 = 4'h7 == cache_state ? _GEN_960 : 2'h0; // @[cache.scala 330:28]
  wire [1:0] _GEN_1490 = 4'h5 == cache_state ? 2'h0 : _GEN_1406; // @[cache.scala 330:28]
  wire [1:0] _GEN_1577 = 4'h4 == cache_state ? 2'h0 : _GEN_1490; // @[cache.scala 330:28]
  wire [1:0] _GEN_1662 = 4'h3 == cache_state ? 2'h0 : _GEN_1577; // @[cache.scala 330:28]
  wire [1:0] _GEN_1749 = 4'h2 == cache_state ? 2'h0 : _GEN_1662; // @[cache.scala 330:28]
  wire [1:0] _GEN_1836 = 4'h1 == cache_state ? 2'h0 : _GEN_1749; // @[cache.scala 330:28]
  wire [1:0] max = 4'h0 == cache_state ? 2'h0 : _GEN_1836; // @[cache.scala 330:28]
  wire [31:0] _refill_addr_T_1 = {cpu_request_addr_reg[31:7],7'h0}; // @[Cat.scala 31:58]
  wire  _T_103 = 2'h0 == max; // @[cache.scala 558:50]
  wire [31:0] _writeback_addr_T = {tag_mem_0_io_tag_read_tag,cpu_request_addr_index,7'h0}; // @[Cat.scala 31:58]
  wire [3:0] _GEN_840 = ~tag_mem_0_io_tag_read_valid | ~tag_mem_0_io_tag_read_dirty ? 4'ha : 4'hb; // @[cache.scala 574:121 575:68 581:68]
  wire [31:0] _GEN_841 = ~tag_mem_0_io_tag_read_valid | ~tag_mem_0_io_tag_read_dirty ? writeback_addr :
    _writeback_addr_T; // @[cache.scala 574:121 186:37 580:72]
  wire  _GEN_843 = 2'h0 == max | tag_mem_0_io_tag_read_valid; // @[cache.scala 257:41 558:58 561:79]
  wire  _GEN_844 = 2'h0 == max ? cpu_request_rw : tag_mem_0_io_tag_read_dirty; // @[cache.scala 257:41 558:58 562:79]
  wire [21:0] _GEN_845 = 2'h0 == max ? cpu_request_addr_tag : tag_mem_0_io_tag_read_tag; // @[cache.scala 257:41 558:58 563:77]
  wire [7:0] _GEN_846 = 2'h0 == max ? 8'h0 : tag_mem_0_io_tag_read_visit; // @[cache.scala 257:41 558:58 566:79]
  wire [3:0] _GEN_847 = 2'h0 == max ? _GEN_840 : 4'h0; // @[cache.scala 558:58]
  wire [31:0] _GEN_848 = 2'h0 == max ? _GEN_841 : writeback_addr; // @[cache.scala 186:37 558:58]
  wire  _T_107 = 2'h1 == max; // @[cache.scala 558:50]
  wire [31:0] _writeback_addr_T_1 = {tag_mem_1_io_tag_read_tag,cpu_request_addr_index,7'h0}; // @[Cat.scala 31:58]
  wire [3:0] _GEN_849 = _max_T_2 | ~tag_mem_1_io_tag_read_dirty ? 4'ha : 4'hb; // @[cache.scala 574:121 575:68 581:68]
  wire [31:0] _GEN_850 = _max_T_2 | ~tag_mem_1_io_tag_read_dirty ? _GEN_848 : _writeback_addr_T_1; // @[cache.scala 574:121 580:72]
  wire  _GEN_852 = 2'h1 == max | tag_mem_1_io_tag_read_valid; // @[cache.scala 257:41 558:58 561:79]
  wire  _GEN_853 = 2'h1 == max ? cpu_request_rw : tag_mem_1_io_tag_read_dirty; // @[cache.scala 257:41 558:58 562:79]
  wire [21:0] _GEN_854 = 2'h1 == max ? cpu_request_addr_tag : tag_mem_1_io_tag_read_tag; // @[cache.scala 257:41 558:58 563:77]
  wire [7:0] _GEN_855 = 2'h1 == max ? 8'h0 : tag_mem_1_io_tag_read_visit; // @[cache.scala 257:41 558:58 566:79]
  wire [3:0] _GEN_856 = 2'h1 == max ? _GEN_849 : _GEN_847; // @[cache.scala 558:58]
  wire [31:0] _GEN_857 = 2'h1 == max ? _GEN_850 : _GEN_848; // @[cache.scala 558:58]
  wire  _T_111 = 2'h2 == max; // @[cache.scala 558:50]
  wire [31:0] _writeback_addr_T_2 = {tag_mem_2_io_tag_read_tag,cpu_request_addr_index,7'h0}; // @[Cat.scala 31:58]
  wire [3:0] _GEN_858 = _max_T_3 | ~tag_mem_2_io_tag_read_dirty ? 4'ha : 4'hb; // @[cache.scala 574:121 575:68 581:68]
  wire [31:0] _GEN_859 = _max_T_3 | ~tag_mem_2_io_tag_read_dirty ? _GEN_857 : _writeback_addr_T_2; // @[cache.scala 574:121 580:72]
  wire  _GEN_861 = 2'h2 == max | tag_mem_2_io_tag_read_valid; // @[cache.scala 257:41 558:58 561:79]
  wire  _GEN_862 = 2'h2 == max ? cpu_request_rw : tag_mem_2_io_tag_read_dirty; // @[cache.scala 257:41 558:58 562:79]
  wire [21:0] _GEN_863 = 2'h2 == max ? cpu_request_addr_tag : tag_mem_2_io_tag_read_tag; // @[cache.scala 257:41 558:58 563:77]
  wire [7:0] _GEN_864 = 2'h2 == max ? 8'h0 : tag_mem_2_io_tag_read_visit; // @[cache.scala 257:41 558:58 566:79]
  wire [3:0] _GEN_865 = 2'h2 == max ? _GEN_858 : _GEN_856; // @[cache.scala 558:58]
  wire [31:0] _GEN_866 = 2'h2 == max ? _GEN_859 : _GEN_857; // @[cache.scala 558:58]
  wire  _T_115 = 2'h3 == max; // @[cache.scala 558:50]
  wire [31:0] _writeback_addr_T_3 = {tag_mem_3_io_tag_read_tag,cpu_request_addr_index,7'h0}; // @[Cat.scala 31:58]
  wire [3:0] _GEN_867 = _max_T_4 | ~tag_mem_3_io_tag_read_dirty ? 4'ha : 4'hb; // @[cache.scala 574:121 575:68 581:68]
  wire [31:0] _GEN_868 = _max_T_4 | ~tag_mem_3_io_tag_read_dirty ? _GEN_866 : _writeback_addr_T_3; // @[cache.scala 574:121 580:72]
  wire  _GEN_870 = 2'h3 == max | tag_mem_3_io_tag_read_valid; // @[cache.scala 257:41 558:58 561:79]
  wire  _GEN_871 = 2'h3 == max ? cpu_request_rw : tag_mem_3_io_tag_read_dirty; // @[cache.scala 257:41 558:58 562:79]
  wire [21:0] _GEN_872 = 2'h3 == max ? cpu_request_addr_tag : tag_mem_3_io_tag_read_tag; // @[cache.scala 257:41 558:58 563:77]
  wire [7:0] _GEN_873 = 2'h3 == max ? 8'h0 : tag_mem_3_io_tag_read_visit; // @[cache.scala 257:41 558:58 566:79]
  wire [3:0] _GEN_874 = 2'h3 == max ? _GEN_867 : _GEN_865; // @[cache.scala 558:58]
  wire [31:0] _GEN_875 = 2'h3 == max ? _GEN_868 : _GEN_866; // @[cache.scala 558:58]
  wire  _GEN_876 = 2'h0 != max & tag_mem_0_io_tag_read_valid | _T_103; // @[cache.scala 587:92 589:76]
  wire  _GEN_877 = 2'h0 != max & tag_mem_0_io_tag_read_valid | _GEN_843; // @[cache.scala 587:92 590:79]
  wire  _GEN_878 = 2'h0 != max & tag_mem_0_io_tag_read_valid ? tag_mem_0_io_tag_read_dirty : _GEN_844; // @[cache.scala 587:92 591:79]
  wire [7:0] _GEN_879 = 2'h0 != max & tag_mem_0_io_tag_read_valid ? _tag_mem_0_io_tag_write_visit_T_4 : _GEN_846; // @[cache.scala 587:92 592:79]
  wire [21:0] _GEN_880 = 2'h0 != max & tag_mem_0_io_tag_read_valid ? tag_mem_0_io_tag_read_tag : _GEN_845; // @[cache.scala 587:92 593:77]
  wire  _GEN_881 = 2'h1 != max & tag_mem_1_io_tag_read_valid | _T_107; // @[cache.scala 587:92 589:76]
  wire  _GEN_882 = 2'h1 != max & tag_mem_1_io_tag_read_valid | _GEN_852; // @[cache.scala 587:92 590:79]
  wire  _GEN_883 = 2'h1 != max & tag_mem_1_io_tag_read_valid ? tag_mem_1_io_tag_read_dirty : _GEN_853; // @[cache.scala 587:92 591:79]
  wire [7:0] _GEN_884 = 2'h1 != max & tag_mem_1_io_tag_read_valid ? _tag_mem_1_io_tag_write_visit_T_4 : _GEN_855; // @[cache.scala 587:92 592:79]
  wire [21:0] _GEN_885 = 2'h1 != max & tag_mem_1_io_tag_read_valid ? tag_mem_1_io_tag_read_tag : _GEN_854; // @[cache.scala 587:92 593:77]
  wire  _GEN_886 = 2'h2 != max & tag_mem_2_io_tag_read_valid | _T_111; // @[cache.scala 587:92 589:76]
  wire  _GEN_887 = 2'h2 != max & tag_mem_2_io_tag_read_valid | _GEN_861; // @[cache.scala 587:92 590:79]
  wire  _GEN_888 = 2'h2 != max & tag_mem_2_io_tag_read_valid ? tag_mem_2_io_tag_read_dirty : _GEN_862; // @[cache.scala 587:92 591:79]
  wire [7:0] _GEN_889 = 2'h2 != max & tag_mem_2_io_tag_read_valid ? _tag_mem_2_io_tag_write_visit_T_4 : _GEN_864; // @[cache.scala 587:92 592:79]
  wire [21:0] _GEN_890 = 2'h2 != max & tag_mem_2_io_tag_read_valid ? tag_mem_2_io_tag_read_tag : _GEN_863; // @[cache.scala 587:92 593:77]
  wire  _GEN_891 = 2'h3 != max & tag_mem_3_io_tag_read_valid | _T_115; // @[cache.scala 587:92 589:76]
  wire  _GEN_892 = 2'h3 != max & tag_mem_3_io_tag_read_valid | _GEN_870; // @[cache.scala 587:92 590:79]
  wire  _GEN_893 = 2'h3 != max & tag_mem_3_io_tag_read_valid ? tag_mem_3_io_tag_read_dirty : _GEN_871; // @[cache.scala 587:92 591:79]
  wire [7:0] _GEN_894 = 2'h3 != max & tag_mem_3_io_tag_read_valid ? _tag_mem_3_io_tag_write_visit_T_4 : _GEN_873; // @[cache.scala 587:92 592:79]
  wire [21:0] _GEN_895 = 2'h3 != max & tag_mem_3_io_tag_read_valid ? tag_mem_3_io_tag_read_tag : _GEN_872; // @[cache.scala 587:92 593:77]
  wire [63:0] _GEN_897 = is_match_0 | is_match_1 | is_match_2 | is_match_3 ? _io_cpu_response_data_T_70 : 64'h0; // @[cache.scala 277:30 425:51 431:54]
  wire  _GEN_898 = is_match_0 | is_match_1 | is_match_2 | is_match_3 ? _GEN_83 : _GEN_878; // @[cache.scala 425:51]
  wire [21:0] _GEN_899 = is_match_0 | is_match_1 | is_match_2 | is_match_3 ? tag_mem_0_io_tag_read_tag : _GEN_880; // @[cache.scala 425:51 455:69]
  wire  _GEN_900 = is_match_0 | is_match_1 | is_match_2 | is_match_3 ? _GEN_80 : _GEN_876; // @[cache.scala 425:51]
  wire [7:0] _GEN_901 = is_match_0 | is_match_1 | is_match_2 | is_match_3 ? _GEN_81 : _GEN_879; // @[cache.scala 425:51]
  wire  _GEN_902 = is_match_0 | is_match_1 | is_match_2 | is_match_3 ? _GEN_80 : _GEN_877; // @[cache.scala 425:51]
  wire  _GEN_903 = is_match_0 | is_match_1 | is_match_2 | is_match_3 ? _GEN_91 : _GEN_883; // @[cache.scala 425:51]
  wire [21:0] _GEN_904 = is_match_0 | is_match_1 | is_match_2 | is_match_3 ? tag_mem_1_io_tag_read_tag : _GEN_885; // @[cache.scala 425:51 455:69]
  wire  _GEN_905 = is_match_0 | is_match_1 | is_match_2 | is_match_3 ? _GEN_88 : _GEN_881; // @[cache.scala 425:51]
  wire [7:0] _GEN_906 = is_match_0 | is_match_1 | is_match_2 | is_match_3 ? _GEN_89 : _GEN_884; // @[cache.scala 425:51]
  wire  _GEN_907 = is_match_0 | is_match_1 | is_match_2 | is_match_3 ? _GEN_88 : _GEN_882; // @[cache.scala 425:51]
  wire  _GEN_908 = is_match_0 | is_match_1 | is_match_2 | is_match_3 ? _GEN_99 : _GEN_888; // @[cache.scala 425:51]
  wire [21:0] _GEN_909 = is_match_0 | is_match_1 | is_match_2 | is_match_3 ? tag_mem_2_io_tag_read_tag : _GEN_890; // @[cache.scala 425:51 455:69]
  wire  _GEN_910 = is_match_0 | is_match_1 | is_match_2 | is_match_3 ? _GEN_96 : _GEN_886; // @[cache.scala 425:51]
  wire [7:0] _GEN_911 = is_match_0 | is_match_1 | is_match_2 | is_match_3 ? _GEN_97 : _GEN_889; // @[cache.scala 425:51]
  wire  _GEN_912 = is_match_0 | is_match_1 | is_match_2 | is_match_3 ? _GEN_96 : _GEN_887; // @[cache.scala 425:51]
  wire  _GEN_913 = is_match_0 | is_match_1 | is_match_2 | is_match_3 ? _GEN_107 : _GEN_893; // @[cache.scala 425:51]
  wire [21:0] _GEN_914 = is_match_0 | is_match_1 | is_match_2 | is_match_3 ? tag_mem_3_io_tag_read_tag : _GEN_895; // @[cache.scala 425:51 455:69]
  wire  _GEN_915 = is_match_0 | is_match_1 | is_match_2 | is_match_3 ? _GEN_104 : _GEN_891; // @[cache.scala 425:51]
  wire [7:0] _GEN_916 = is_match_0 | is_match_1 | is_match_2 | is_match_3 ? _GEN_105 : _GEN_894; // @[cache.scala 425:51]
  wire  _GEN_917 = is_match_0 | is_match_1 | is_match_2 | is_match_3 ? _GEN_104 : _GEN_892; // @[cache.scala 425:51]
  wire  _GEN_918 = (is_match_0 | is_match_1 | is_match_2 | is_match_3) & _GEN_796; // @[cache.scala 256:45 425:51]
  wire [1023:0] _GEN_945 = is_match_0 | is_match_1 | is_match_2 | is_match_3 ? _GEN_823 : data_mem_0_io_data_read_data; // @[cache.scala 258:43 425:51]
  wire  _GEN_946 = (is_match_0 | is_match_1 | is_match_2 | is_match_3) & _GEN_824; // @[cache.scala 256:45 425:51]
  wire [1023:0] _GEN_947 = is_match_0 | is_match_1 | is_match_2 | is_match_3 ? _GEN_825 : data_mem_1_io_data_read_data; // @[cache.scala 258:43 425:51]
  wire  _GEN_948 = (is_match_0 | is_match_1 | is_match_2 | is_match_3) & _GEN_826; // @[cache.scala 256:45 425:51]
  wire [1023:0] _GEN_949 = is_match_0 | is_match_1 | is_match_2 | is_match_3 ? _GEN_827 : data_mem_2_io_data_read_data; // @[cache.scala 258:43 425:51]
  wire  _GEN_950 = (is_match_0 | is_match_1 | is_match_2 | is_match_3) & _GEN_828; // @[cache.scala 256:45 425:51]
  wire [1023:0] _GEN_951 = is_match_0 | is_match_1 | is_match_2 | is_match_3 ? _GEN_829 : data_mem_3_io_data_read_data; // @[cache.scala 258:43 425:51]
  wire [3:0] _GEN_952 = is_match_0 | is_match_1 | is_match_2 | is_match_3 ? {{1'd0}, _GEN_830} : _GEN_874; // @[cache.scala 425:51]
  wire [1:0] _GEN_961 = is_match_0 | is_match_1 | is_match_2 | is_match_3 ? replace : max; // @[cache.scala 183:30 425:51]
  wire [31:0] _GEN_962 = is_match_0 | is_match_1 | is_match_2 | is_match_3 ? refill_addr : _refill_addr_T_1; // @[cache.scala 184:34 425:51 553:45]
  wire [31:0] _GEN_963 = is_match_0 | is_match_1 | is_match_2 | is_match_3 ? writeback_addr : _GEN_875; // @[cache.scala 186:37 425:51]
  wire [3:0] _GEN_964 = io_mem_io_ar_ready ? 4'h9 : 4'ha; // @[cache.scala 604:36 608:49 609:44]
  wire [1023:0] _GEN_997 = 2'h0 == replace ? _data_mem_0_io_data_write_data_T : data_mem_0_io_data_read_data; // @[cache.scala 258:43 621:62 641:80]
  wire [1023:0] _GEN_1031 = 2'h1 == replace ? _data_mem_0_io_data_write_data_T : data_mem_1_io_data_read_data; // @[cache.scala 258:43 621:62 641:80]
  wire [1023:0] _GEN_1065 = 2'h2 == replace ? _data_mem_0_io_data_write_data_T : data_mem_2_io_data_read_data; // @[cache.scala 258:43 621:62 641:80]
  wire [1023:0] _GEN_1099 = 2'h3 == replace ? _data_mem_0_io_data_write_data_T : data_mem_3_io_data_read_data; // @[cache.scala 258:43 621:62 641:80]
  wire [1023:0] _GEN_1117 = io_mem_io_r_valid ? _GEN_997 : data_mem_0_io_data_read_data; // @[cache.scala 258:43 619:48]
  wire  _GEN_1118 = io_mem_io_r_valid & _T_133; // @[cache.scala 256:45 619:48]
  wire [1023:0] _GEN_1119 = io_mem_io_r_valid ? _GEN_1031 : data_mem_1_io_data_read_data; // @[cache.scala 258:43 619:48]
  wire  _GEN_1120 = io_mem_io_r_valid & _T_150; // @[cache.scala 256:45 619:48]
  wire [1023:0] _GEN_1121 = io_mem_io_r_valid ? _GEN_1065 : data_mem_2_io_data_read_data; // @[cache.scala 258:43 619:48]
  wire  _GEN_1122 = io_mem_io_r_valid & _T_167; // @[cache.scala 256:45 619:48]
  wire [1023:0] _GEN_1123 = io_mem_io_r_valid ? _GEN_1099 : data_mem_3_io_data_read_data; // @[cache.scala 258:43 619:48]
  wire  _GEN_1124 = io_mem_io_r_valid & _T_184; // @[cache.scala 256:45 619:48]
  wire [3:0] _GEN_1125 = io_mem_io_r_bits_last ? 4'h7 : 4'h9; // @[cache.scala 618:36 657:52 658:44]
  wire [3:0] _GEN_1126 = io_mem_io_r_bits_last ? 4'h0 : _GEN_0; // @[cache.scala 657:52 660:39]
  wire [3:0] _GEN_1127 = io_mem_io_aw_ready ? 4'h8 : 4'hb; // @[cache.scala 686:36 688:49 690:44]
  wire [63:0] _GEN_1129 = 4'h1 == index ? cache_data_1 : cache_data_0; // @[cache.scala 716:{71,71}]
  wire [63:0] _GEN_1130 = 4'h2 == index ? cache_data_2 : _GEN_1129; // @[cache.scala 716:{71,71}]
  wire [63:0] _GEN_1131 = 4'h3 == index ? cache_data_3 : _GEN_1130; // @[cache.scala 716:{71,71}]
  wire [63:0] _GEN_1132 = 4'h4 == index ? cache_data_4 : _GEN_1131; // @[cache.scala 716:{71,71}]
  wire [63:0] _GEN_1133 = 4'h5 == index ? cache_data_5 : _GEN_1132; // @[cache.scala 716:{71,71}]
  wire [63:0] _GEN_1134 = 4'h6 == index ? cache_data_6 : _GEN_1133; // @[cache.scala 716:{71,71}]
  wire [63:0] _GEN_1135 = 4'h7 == index ? cache_data_7 : _GEN_1134; // @[cache.scala 716:{71,71}]
  wire [63:0] _GEN_1136 = 4'h8 == index ? cache_data_8 : _GEN_1135; // @[cache.scala 716:{71,71}]
  wire [63:0] _GEN_1137 = 4'h9 == index ? cache_data_9 : _GEN_1136; // @[cache.scala 716:{71,71}]
  wire [63:0] _GEN_1138 = 4'ha == index ? cache_data_10 : _GEN_1137; // @[cache.scala 716:{71,71}]
  wire [63:0] _GEN_1139 = 4'hb == index ? cache_data_11 : _GEN_1138; // @[cache.scala 716:{71,71}]
  wire [63:0] _GEN_1140 = 4'hc == index ? cache_data_12 : _GEN_1139; // @[cache.scala 716:{71,71}]
  wire [63:0] _GEN_1141 = 4'hd == index ? cache_data_13 : _GEN_1140; // @[cache.scala 716:{71,71}]
  wire [63:0] _GEN_1142 = 4'he == index ? cache_data_14 : _GEN_1141; // @[cache.scala 716:{71,71}]
  wire [63:0] _GEN_1143 = 4'hf == index ? cache_data_15 : _GEN_1142; // @[cache.scala 716:{71,71}]
  wire [63:0] _GEN_1160 = _T_133 ? _GEN_1143 : 64'h0; // @[cache.scala 299:31 714:62 716:71]
  wire [63:0] _GEN_1177 = _T_150 ? _GEN_1143 : _GEN_1160; // @[cache.scala 714:62 716:71]
  wire [63:0] _GEN_1194 = _T_167 ? _GEN_1143 : _GEN_1177; // @[cache.scala 714:62 716:71]
  wire [63:0] _GEN_1211 = _T_184 ? _GEN_1143 : _GEN_1194; // @[cache.scala 714:62 716:71]
  wire [3:0] _GEN_1212 = last ? 4'hc : 4'h8; // @[cache.scala 724:35 706:36 725:44]
  wire [3:0] _GEN_1213 = last ? 4'h0 : _GEN_0; // @[cache.scala 724:35 726:39]
  wire [3:0] _GEN_1214 = io_mem_io_b_valid ? 4'ha : 4'hc; // @[cache.scala 732:36 733:48 734:44]
  wire [3:0] _GEN_1216 = 4'hc == cache_state ? _GEN_1214 : 4'h0; // @[cache.scala 330:28]
  wire [3:0] _GEN_1217 = 4'h8 == cache_state ? _GEN_1212 : _GEN_1216; // @[cache.scala 330:28]
  wire [63:0] _GEN_1237 = 4'h8 == cache_state ? _GEN_1211 : 64'h0; // @[cache.scala 330:28 299:31]
  wire [3:0] _GEN_1238 = 4'h8 == cache_state ? _GEN_1213 : _GEN_0; // @[cache.scala 330:28]
  wire  _GEN_1239 = 4'h8 == cache_state ? 1'h0 : 4'hc == cache_state; // @[cache.scala 304:27 330:28]
  wire [3:0] _GEN_1242 = 4'hb == cache_state ? _GEN_1127 : _GEN_1217; // @[cache.scala 330:28]
  wire [31:0] _GEN_1243 = 4'hb == cache_state ? writeback_addr : cpu_request_addr_reg; // @[cache.scala 330:28 284:32 687:48]
  wire  _GEN_1245 = 4'hb == cache_state ? 1'h0 : 4'h8 == cache_state; // @[cache.scala 297:27 330:28]
  wire [63:0] _GEN_1263 = 4'hb == cache_state ? 64'h0 : _GEN_1237; // @[cache.scala 330:28 299:31]
  wire [3:0] _GEN_1264 = 4'hb == cache_state ? _GEN_0 : _GEN_1238; // @[cache.scala 330:28]
  wire  _GEN_1265 = 4'hb == cache_state ? 1'h0 : _GEN_1239; // @[cache.scala 304:27 330:28]
  wire [3:0] _GEN_1268 = 4'h9 == cache_state ? _GEN_1125 : _GEN_1242; // @[cache.scala 330:28]
  wire [1023:0] _GEN_1285 = 4'h9 == cache_state ? _GEN_1117 : data_mem_0_io_data_read_data; // @[cache.scala 330:28 258:43]
  wire [1023:0] _GEN_1287 = 4'h9 == cache_state ? _GEN_1119 : data_mem_1_io_data_read_data; // @[cache.scala 330:28 258:43]
  wire [1023:0] _GEN_1289 = 4'h9 == cache_state ? _GEN_1121 : data_mem_2_io_data_read_data; // @[cache.scala 330:28 258:43]
  wire [1023:0] _GEN_1291 = 4'h9 == cache_state ? _GEN_1123 : data_mem_3_io_data_read_data; // @[cache.scala 330:28 258:43]
  wire [3:0] _GEN_1294 = 4'h9 == cache_state ? _GEN_1126 : _GEN_1264; // @[cache.scala 330:28]
  wire  _GEN_1295 = 4'h9 == cache_state ? 1'h0 : 4'hb == cache_state; // @[cache.scala 283:28 330:28]
  wire [31:0] _GEN_1297 = 4'h9 == cache_state ? cpu_request_addr_reg : _GEN_1243; // @[cache.scala 330:28 284:32]
  wire  _GEN_1298 = 4'h9 == cache_state ? 1'h0 : _GEN_1245; // @[cache.scala 297:27 330:28]
  wire [63:0] _GEN_1300 = 4'h9 == cache_state ? 64'h0 : _GEN_1263; // @[cache.scala 330:28 299:31]
  wire  _GEN_1301 = 4'h9 == cache_state ? 1'h0 : _GEN_1265; // @[cache.scala 304:27 330:28]
  wire [3:0] _GEN_1304 = 4'ha == cache_state ? _GEN_964 : _GEN_1268; // @[cache.scala 330:28]
  wire [31:0] _GEN_1305 = 4'ha == cache_state ? refill_addr : cpu_request_addr_reg; // @[cache.scala 330:28 291:32 605:48]
  wire  _GEN_1307 = 4'ha == cache_state ? 1'h0 : 4'h9 == cache_state; // @[cache.scala 302:27 330:28]
  wire [1023:0] _GEN_1324 = 4'ha == cache_state ? data_mem_0_io_data_read_data : _GEN_1285; // @[cache.scala 330:28 258:43]
  wire  _GEN_1325 = 4'ha == cache_state ? 1'h0 : 4'h9 == cache_state & _GEN_1118; // @[cache.scala 330:28 256:45]
  wire [1023:0] _GEN_1326 = 4'ha == cache_state ? data_mem_1_io_data_read_data : _GEN_1287; // @[cache.scala 330:28 258:43]
  wire  _GEN_1327 = 4'ha == cache_state ? 1'h0 : 4'h9 == cache_state & _GEN_1120; // @[cache.scala 330:28 256:45]
  wire [1023:0] _GEN_1328 = 4'ha == cache_state ? data_mem_2_io_data_read_data : _GEN_1289; // @[cache.scala 330:28 258:43]
  wire  _GEN_1329 = 4'ha == cache_state ? 1'h0 : 4'h9 == cache_state & _GEN_1122; // @[cache.scala 330:28 256:45]
  wire [1023:0] _GEN_1330 = 4'ha == cache_state ? data_mem_3_io_data_read_data : _GEN_1291; // @[cache.scala 330:28 258:43]
  wire  _GEN_1331 = 4'ha == cache_state ? 1'h0 : 4'h9 == cache_state & _GEN_1124; // @[cache.scala 330:28 256:45]
  wire [3:0] _GEN_1333 = 4'ha == cache_state ? _GEN_0 : _GEN_1294; // @[cache.scala 330:28]
  wire  _GEN_1334 = 4'ha == cache_state ? 1'h0 : _GEN_1295; // @[cache.scala 283:28 330:28]
  wire [31:0] _GEN_1336 = 4'ha == cache_state ? cpu_request_addr_reg : _GEN_1297; // @[cache.scala 330:28 284:32]
  wire  _GEN_1337 = 4'ha == cache_state ? 1'h0 : _GEN_1298; // @[cache.scala 297:27 330:28]
  wire [63:0] _GEN_1339 = 4'ha == cache_state ? 64'h0 : _GEN_1300; // @[cache.scala 330:28 299:31]
  wire  _GEN_1340 = 4'ha == cache_state ? 1'h0 : _GEN_1301; // @[cache.scala 304:27 330:28]
  wire  _GEN_1342 = 4'h7 == cache_state & _T_27; // @[cache.scala 330:28 276:31]
  wire [63:0] _GEN_1343 = 4'h7 == cache_state ? _GEN_897 : 64'h0; // @[cache.scala 330:28 277:30]
  wire  _GEN_1344 = 4'h7 == cache_state ? _GEN_898 : tag_mem_0_io_tag_read_dirty; // @[cache.scala 330:28 257:41]
  wire [21:0] _GEN_1345 = 4'h7 == cache_state ? _GEN_899 : tag_mem_0_io_tag_read_tag; // @[cache.scala 330:28 257:41]
  wire [7:0] _GEN_1347 = 4'h7 == cache_state ? _GEN_901 : tag_mem_0_io_tag_read_visit; // @[cache.scala 330:28 257:41]
  wire  _GEN_1348 = 4'h7 == cache_state ? _GEN_902 : tag_mem_0_io_tag_read_valid; // @[cache.scala 330:28 257:41]
  wire  _GEN_1349 = 4'h7 == cache_state ? _GEN_903 : tag_mem_1_io_tag_read_dirty; // @[cache.scala 330:28 257:41]
  wire [21:0] _GEN_1350 = 4'h7 == cache_state ? _GEN_904 : tag_mem_1_io_tag_read_tag; // @[cache.scala 330:28 257:41]
  wire [7:0] _GEN_1352 = 4'h7 == cache_state ? _GEN_906 : tag_mem_1_io_tag_read_visit; // @[cache.scala 330:28 257:41]
  wire  _GEN_1353 = 4'h7 == cache_state ? _GEN_907 : tag_mem_1_io_tag_read_valid; // @[cache.scala 330:28 257:41]
  wire  _GEN_1354 = 4'h7 == cache_state ? _GEN_908 : tag_mem_2_io_tag_read_dirty; // @[cache.scala 330:28 257:41]
  wire [21:0] _GEN_1355 = 4'h7 == cache_state ? _GEN_909 : tag_mem_2_io_tag_read_tag; // @[cache.scala 330:28 257:41]
  wire [7:0] _GEN_1357 = 4'h7 == cache_state ? _GEN_911 : tag_mem_2_io_tag_read_visit; // @[cache.scala 330:28 257:41]
  wire  _GEN_1358 = 4'h7 == cache_state ? _GEN_912 : tag_mem_2_io_tag_read_valid; // @[cache.scala 330:28 257:41]
  wire  _GEN_1359 = 4'h7 == cache_state ? _GEN_913 : tag_mem_3_io_tag_read_dirty; // @[cache.scala 330:28 257:41]
  wire [21:0] _GEN_1360 = 4'h7 == cache_state ? _GEN_914 : tag_mem_3_io_tag_read_tag; // @[cache.scala 330:28 257:41]
  wire [7:0] _GEN_1362 = 4'h7 == cache_state ? _GEN_916 : tag_mem_3_io_tag_read_visit; // @[cache.scala 330:28 257:41]
  wire  _GEN_1363 = 4'h7 == cache_state ? _GEN_917 : tag_mem_3_io_tag_read_valid; // @[cache.scala 330:28 257:41]
  wire  _GEN_1364 = 4'h7 == cache_state ? _GEN_918 : _GEN_1325; // @[cache.scala 330:28]
  wire [1023:0] _GEN_1391 = 4'h7 == cache_state ? _GEN_945 : _GEN_1324; // @[cache.scala 330:28]
  wire  _GEN_1392 = 4'h7 == cache_state ? _GEN_946 : _GEN_1327; // @[cache.scala 330:28]
  wire [1023:0] _GEN_1393 = 4'h7 == cache_state ? _GEN_947 : _GEN_1326; // @[cache.scala 330:28]
  wire  _GEN_1394 = 4'h7 == cache_state ? _GEN_948 : _GEN_1329; // @[cache.scala 330:28]
  wire [1023:0] _GEN_1395 = 4'h7 == cache_state ? _GEN_949 : _GEN_1328; // @[cache.scala 330:28]
  wire  _GEN_1396 = 4'h7 == cache_state ? _GEN_950 : _GEN_1331; // @[cache.scala 330:28]
  wire [1023:0] _GEN_1397 = 4'h7 == cache_state ? _GEN_951 : _GEN_1330; // @[cache.scala 330:28]
  wire [3:0] _GEN_1398 = 4'h7 == cache_state ? _GEN_952 : _GEN_1304; // @[cache.scala 330:28]
  wire [1:0] _GEN_1407 = 4'h7 == cache_state ? _GEN_961 : replace; // @[cache.scala 330:28 183:30]
  wire [31:0] _GEN_1408 = 4'h7 == cache_state ? _GEN_962 : refill_addr; // @[cache.scala 330:28 184:34]
  wire [31:0] _GEN_1409 = 4'h7 == cache_state ? _GEN_963 : writeback_addr; // @[cache.scala 330:28 186:37]
  wire  _GEN_1410 = 4'h7 == cache_state ? 1'h0 : 4'ha == cache_state; // @[cache.scala 290:28 330:28]
  wire [31:0] _GEN_1412 = 4'h7 == cache_state ? cpu_request_addr_reg : _GEN_1305; // @[cache.scala 330:28 291:32]
  wire  _GEN_1414 = 4'h7 == cache_state ? 1'h0 : _GEN_1307; // @[cache.scala 302:27 330:28]
  wire [3:0] _GEN_1416 = 4'h7 == cache_state ? _GEN_0 : _GEN_1333; // @[cache.scala 330:28]
  wire  _GEN_1417 = 4'h7 == cache_state ? 1'h0 : _GEN_1334; // @[cache.scala 283:28 330:28]
  wire [31:0] _GEN_1419 = 4'h7 == cache_state ? cpu_request_addr_reg : _GEN_1336; // @[cache.scala 330:28 284:32]
  wire  _GEN_1420 = 4'h7 == cache_state ? 1'h0 : _GEN_1337; // @[cache.scala 297:27 330:28]
  wire [63:0] _GEN_1422 = 4'h7 == cache_state ? 64'h0 : _GEN_1339; // @[cache.scala 330:28 299:31]
  wire  _GEN_1423 = 4'h7 == cache_state ? 1'h0 : _GEN_1340; // @[cache.scala 304:27 330:28]
  wire  _GEN_1424 = 4'h5 == cache_state | _GEN_1423; // @[cache.scala 330:28 398:43]
  wire  _GEN_1425 = 4'h5 == cache_state ? io_mem_io_b_valid : _GEN_1342; // @[cache.scala 330:28]
  wire [3:0] _GEN_1426 = 4'h5 == cache_state ? {{1'd0}, _GEN_11} : _GEN_1398; // @[cache.scala 330:28]
  wire [63:0] _GEN_1428 = 4'h5 == cache_state ? 64'h0 : _GEN_1343; // @[cache.scala 330:28 277:30]
  wire  _GEN_1429 = 4'h5 == cache_state ? tag_mem_0_io_tag_read_dirty : _GEN_1344; // @[cache.scala 330:28 257:41]
  wire [21:0] _GEN_1430 = 4'h5 == cache_state ? tag_mem_0_io_tag_read_tag : _GEN_1345; // @[cache.scala 330:28 257:41]
  wire  _GEN_1431 = 4'h5 == cache_state ? 1'h0 : 4'h7 == cache_state & _GEN_900; // @[cache.scala 330:28 255:44]
  wire [7:0] _GEN_1432 = 4'h5 == cache_state ? tag_mem_0_io_tag_read_visit : _GEN_1347; // @[cache.scala 330:28 257:41]
  wire  _GEN_1433 = 4'h5 == cache_state ? tag_mem_0_io_tag_read_valid : _GEN_1348; // @[cache.scala 330:28 257:41]
  wire  _GEN_1434 = 4'h5 == cache_state ? tag_mem_1_io_tag_read_dirty : _GEN_1349; // @[cache.scala 330:28 257:41]
  wire [21:0] _GEN_1435 = 4'h5 == cache_state ? tag_mem_1_io_tag_read_tag : _GEN_1350; // @[cache.scala 330:28 257:41]
  wire  _GEN_1436 = 4'h5 == cache_state ? 1'h0 : 4'h7 == cache_state & _GEN_905; // @[cache.scala 330:28 255:44]
  wire [7:0] _GEN_1437 = 4'h5 == cache_state ? tag_mem_1_io_tag_read_visit : _GEN_1352; // @[cache.scala 330:28 257:41]
  wire  _GEN_1438 = 4'h5 == cache_state ? tag_mem_1_io_tag_read_valid : _GEN_1353; // @[cache.scala 330:28 257:41]
  wire  _GEN_1439 = 4'h5 == cache_state ? tag_mem_2_io_tag_read_dirty : _GEN_1354; // @[cache.scala 330:28 257:41]
  wire [21:0] _GEN_1440 = 4'h5 == cache_state ? tag_mem_2_io_tag_read_tag : _GEN_1355; // @[cache.scala 330:28 257:41]
  wire  _GEN_1441 = 4'h5 == cache_state ? 1'h0 : 4'h7 == cache_state & _GEN_910; // @[cache.scala 330:28 255:44]
  wire [7:0] _GEN_1442 = 4'h5 == cache_state ? tag_mem_2_io_tag_read_visit : _GEN_1357; // @[cache.scala 330:28 257:41]
  wire  _GEN_1443 = 4'h5 == cache_state ? tag_mem_2_io_tag_read_valid : _GEN_1358; // @[cache.scala 330:28 257:41]
  wire  _GEN_1444 = 4'h5 == cache_state ? tag_mem_3_io_tag_read_dirty : _GEN_1359; // @[cache.scala 330:28 257:41]
  wire [21:0] _GEN_1445 = 4'h5 == cache_state ? tag_mem_3_io_tag_read_tag : _GEN_1360; // @[cache.scala 330:28 257:41]
  wire  _GEN_1446 = 4'h5 == cache_state ? 1'h0 : 4'h7 == cache_state & _GEN_915; // @[cache.scala 330:28 255:44]
  wire [7:0] _GEN_1447 = 4'h5 == cache_state ? tag_mem_3_io_tag_read_visit : _GEN_1362; // @[cache.scala 330:28 257:41]
  wire  _GEN_1448 = 4'h5 == cache_state ? tag_mem_3_io_tag_read_valid : _GEN_1363; // @[cache.scala 330:28 257:41]
  wire  _GEN_1449 = 4'h5 == cache_state ? 1'h0 : _GEN_1364; // @[cache.scala 330:28 256:45]
  wire [1023:0] _GEN_1476 = 4'h5 == cache_state ? data_mem_0_io_data_read_data : _GEN_1391; // @[cache.scala 330:28 258:43]
  wire  _GEN_1477 = 4'h5 == cache_state ? 1'h0 : _GEN_1392; // @[cache.scala 330:28 256:45]
  wire [1023:0] _GEN_1478 = 4'h5 == cache_state ? data_mem_1_io_data_read_data : _GEN_1393; // @[cache.scala 330:28 258:43]
  wire  _GEN_1479 = 4'h5 == cache_state ? 1'h0 : _GEN_1394; // @[cache.scala 330:28 256:45]
  wire [1023:0] _GEN_1480 = 4'h5 == cache_state ? data_mem_2_io_data_read_data : _GEN_1395; // @[cache.scala 330:28 258:43]
  wire  _GEN_1481 = 4'h5 == cache_state ? 1'h0 : _GEN_1396; // @[cache.scala 330:28 256:45]
  wire [1023:0] _GEN_1482 = 4'h5 == cache_state ? data_mem_3_io_data_read_data : _GEN_1397; // @[cache.scala 330:28 258:43]
  wire [1:0] _GEN_1491 = 4'h5 == cache_state ? replace : _GEN_1407; // @[cache.scala 330:28 183:30]
  wire [31:0] _GEN_1492 = 4'h5 == cache_state ? refill_addr : _GEN_1408; // @[cache.scala 330:28 184:34]
  wire [31:0] _GEN_1493 = 4'h5 == cache_state ? writeback_addr : _GEN_1409; // @[cache.scala 330:28 186:37]
  wire  _GEN_1494 = 4'h5 == cache_state ? 1'h0 : _GEN_1410; // @[cache.scala 290:28 330:28]
  wire [31:0] _GEN_1496 = 4'h5 == cache_state ? cpu_request_addr_reg : _GEN_1412; // @[cache.scala 330:28 291:32]
  wire  _GEN_1498 = 4'h5 == cache_state ? 1'h0 : _GEN_1414; // @[cache.scala 302:27 330:28]
  wire [3:0] _GEN_1500 = 4'h5 == cache_state ? _GEN_0 : _GEN_1416; // @[cache.scala 330:28]
  wire  _GEN_1501 = 4'h5 == cache_state ? 1'h0 : _GEN_1417; // @[cache.scala 283:28 330:28]
  wire [31:0] _GEN_1503 = 4'h5 == cache_state ? cpu_request_addr_reg : _GEN_1419; // @[cache.scala 330:28 284:32]
  wire  _GEN_1504 = 4'h5 == cache_state ? 1'h0 : _GEN_1420; // @[cache.scala 297:27 330:28]
  wire [63:0] _GEN_1506 = 4'h5 == cache_state ? 64'h0 : _GEN_1422; // @[cache.scala 330:28 299:31]
  wire  _GEN_1507 = 4'h4 == cache_state | _GEN_1504; // @[cache.scala 330:28 385:43]
  wire  _GEN_1508 = 4'h4 == cache_state | last; // @[cache.scala 330:28 300:31 387:47]
  wire [63:0] _GEN_1509 = 4'h4 == cache_state ? cpu_request_data : _GEN_1506; // @[cache.scala 330:28 388:47]
  wire [7:0] _GEN_1510 = 4'h4 == cache_state ? cpu_request_mask : 8'hff; // @[cache.scala 330:28 389:47]
  wire [3:0] _GEN_1511 = 4'h4 == cache_state ? {{1'd0}, _GEN_9} : _GEN_1426; // @[cache.scala 330:28]
  wire  _GEN_1512 = 4'h4 == cache_state ? 1'h0 : _GEN_1424; // @[cache.scala 304:27 330:28]
  wire  _GEN_1513 = 4'h4 == cache_state ? 1'h0 : _GEN_1425; // @[cache.scala 330:28 276:31]
  wire [63:0] _GEN_1515 = 4'h4 == cache_state ? 64'h0 : _GEN_1428; // @[cache.scala 330:28 277:30]
  wire  _GEN_1516 = 4'h4 == cache_state ? tag_mem_0_io_tag_read_dirty : _GEN_1429; // @[cache.scala 330:28 257:41]
  wire [21:0] _GEN_1517 = 4'h4 == cache_state ? tag_mem_0_io_tag_read_tag : _GEN_1430; // @[cache.scala 330:28 257:41]
  wire  _GEN_1518 = 4'h4 == cache_state ? 1'h0 : _GEN_1431; // @[cache.scala 330:28 255:44]
  wire [7:0] _GEN_1519 = 4'h4 == cache_state ? tag_mem_0_io_tag_read_visit : _GEN_1432; // @[cache.scala 330:28 257:41]
  wire  _GEN_1520 = 4'h4 == cache_state ? tag_mem_0_io_tag_read_valid : _GEN_1433; // @[cache.scala 330:28 257:41]
  wire  _GEN_1521 = 4'h4 == cache_state ? tag_mem_1_io_tag_read_dirty : _GEN_1434; // @[cache.scala 330:28 257:41]
  wire [21:0] _GEN_1522 = 4'h4 == cache_state ? tag_mem_1_io_tag_read_tag : _GEN_1435; // @[cache.scala 330:28 257:41]
  wire  _GEN_1523 = 4'h4 == cache_state ? 1'h0 : _GEN_1436; // @[cache.scala 330:28 255:44]
  wire [7:0] _GEN_1524 = 4'h4 == cache_state ? tag_mem_1_io_tag_read_visit : _GEN_1437; // @[cache.scala 330:28 257:41]
  wire  _GEN_1525 = 4'h4 == cache_state ? tag_mem_1_io_tag_read_valid : _GEN_1438; // @[cache.scala 330:28 257:41]
  wire  _GEN_1526 = 4'h4 == cache_state ? tag_mem_2_io_tag_read_dirty : _GEN_1439; // @[cache.scala 330:28 257:41]
  wire [21:0] _GEN_1527 = 4'h4 == cache_state ? tag_mem_2_io_tag_read_tag : _GEN_1440; // @[cache.scala 330:28 257:41]
  wire  _GEN_1528 = 4'h4 == cache_state ? 1'h0 : _GEN_1441; // @[cache.scala 330:28 255:44]
  wire [7:0] _GEN_1529 = 4'h4 == cache_state ? tag_mem_2_io_tag_read_visit : _GEN_1442; // @[cache.scala 330:28 257:41]
  wire  _GEN_1530 = 4'h4 == cache_state ? tag_mem_2_io_tag_read_valid : _GEN_1443; // @[cache.scala 330:28 257:41]
  wire  _GEN_1531 = 4'h4 == cache_state ? tag_mem_3_io_tag_read_dirty : _GEN_1444; // @[cache.scala 330:28 257:41]
  wire [21:0] _GEN_1532 = 4'h4 == cache_state ? tag_mem_3_io_tag_read_tag : _GEN_1445; // @[cache.scala 330:28 257:41]
  wire  _GEN_1533 = 4'h4 == cache_state ? 1'h0 : _GEN_1446; // @[cache.scala 330:28 255:44]
  wire [7:0] _GEN_1534 = 4'h4 == cache_state ? tag_mem_3_io_tag_read_visit : _GEN_1447; // @[cache.scala 330:28 257:41]
  wire  _GEN_1535 = 4'h4 == cache_state ? tag_mem_3_io_tag_read_valid : _GEN_1448; // @[cache.scala 330:28 257:41]
  wire  _GEN_1536 = 4'h4 == cache_state ? 1'h0 : _GEN_1449; // @[cache.scala 330:28 256:45]
  wire [1023:0] _GEN_1563 = 4'h4 == cache_state ? data_mem_0_io_data_read_data : _GEN_1476; // @[cache.scala 330:28 258:43]
  wire  _GEN_1564 = 4'h4 == cache_state ? 1'h0 : _GEN_1477; // @[cache.scala 330:28 256:45]
  wire [1023:0] _GEN_1565 = 4'h4 == cache_state ? data_mem_1_io_data_read_data : _GEN_1478; // @[cache.scala 330:28 258:43]
  wire  _GEN_1566 = 4'h4 == cache_state ? 1'h0 : _GEN_1479; // @[cache.scala 330:28 256:45]
  wire [1023:0] _GEN_1567 = 4'h4 == cache_state ? data_mem_2_io_data_read_data : _GEN_1480; // @[cache.scala 330:28 258:43]
  wire  _GEN_1568 = 4'h4 == cache_state ? 1'h0 : _GEN_1481; // @[cache.scala 330:28 256:45]
  wire [1023:0] _GEN_1569 = 4'h4 == cache_state ? data_mem_3_io_data_read_data : _GEN_1482; // @[cache.scala 330:28 258:43]
  wire [1:0] _GEN_1578 = 4'h4 == cache_state ? replace : _GEN_1491; // @[cache.scala 330:28 183:30]
  wire [31:0] _GEN_1579 = 4'h4 == cache_state ? refill_addr : _GEN_1492; // @[cache.scala 330:28 184:34]
  wire [31:0] _GEN_1580 = 4'h4 == cache_state ? writeback_addr : _GEN_1493; // @[cache.scala 330:28 186:37]
  wire  _GEN_1581 = 4'h4 == cache_state ? 1'h0 : _GEN_1494; // @[cache.scala 290:28 330:28]
  wire [31:0] _GEN_1583 = 4'h4 == cache_state ? cpu_request_addr_reg : _GEN_1496; // @[cache.scala 330:28 291:32]
  wire  _GEN_1585 = 4'h4 == cache_state ? 1'h0 : _GEN_1498; // @[cache.scala 302:27 330:28]
  wire [3:0] _GEN_1587 = 4'h4 == cache_state ? _GEN_0 : _GEN_1500; // @[cache.scala 330:28]
  wire  _GEN_1588 = 4'h4 == cache_state ? 1'h0 : _GEN_1501; // @[cache.scala 283:28 330:28]
  wire [31:0] _GEN_1590 = 4'h4 == cache_state ? cpu_request_addr_reg : _GEN_1503; // @[cache.scala 330:28 284:32]
  wire [63:0] _GEN_1591 = 4'h3 == cache_state ? io_mem_io_r_bits_data : _GEN_1515; // @[cache.scala 330:28 374:46]
  wire  _GEN_1592 = 4'h3 == cache_state | _GEN_1585; // @[cache.scala 330:28 375:43]
  wire [3:0] _GEN_1593 = 4'h3 == cache_state ? {{2'd0}, _GEN_7} : _GEN_1511; // @[cache.scala 330:28]
  wire  _GEN_1594 = 4'h3 == cache_state ? io_mem_io_r_valid : _GEN_1513; // @[cache.scala 330:28]
  wire  _GEN_1595 = 4'h3 == cache_state ? 1'h0 : _GEN_1507; // @[cache.scala 297:27 330:28]
  wire  _GEN_1596 = 4'h3 == cache_state ? last : _GEN_1508; // @[cache.scala 330:28 300:31]
  wire [63:0] _GEN_1597 = 4'h3 == cache_state ? 64'h0 : _GEN_1509; // @[cache.scala 330:28 299:31]
  wire [7:0] _GEN_1598 = 4'h3 == cache_state ? 8'hff : _GEN_1510; // @[cache.scala 330:28 298:31]
  wire  _GEN_1599 = 4'h3 == cache_state ? 1'h0 : _GEN_1512; // @[cache.scala 304:27 330:28]
  wire  _GEN_1601 = 4'h3 == cache_state ? tag_mem_0_io_tag_read_dirty : _GEN_1516; // @[cache.scala 330:28 257:41]
  wire [21:0] _GEN_1602 = 4'h3 == cache_state ? tag_mem_0_io_tag_read_tag : _GEN_1517; // @[cache.scala 330:28 257:41]
  wire  _GEN_1603 = 4'h3 == cache_state ? 1'h0 : _GEN_1518; // @[cache.scala 330:28 255:44]
  wire [7:0] _GEN_1604 = 4'h3 == cache_state ? tag_mem_0_io_tag_read_visit : _GEN_1519; // @[cache.scala 330:28 257:41]
  wire  _GEN_1605 = 4'h3 == cache_state ? tag_mem_0_io_tag_read_valid : _GEN_1520; // @[cache.scala 330:28 257:41]
  wire  _GEN_1606 = 4'h3 == cache_state ? tag_mem_1_io_tag_read_dirty : _GEN_1521; // @[cache.scala 330:28 257:41]
  wire [21:0] _GEN_1607 = 4'h3 == cache_state ? tag_mem_1_io_tag_read_tag : _GEN_1522; // @[cache.scala 330:28 257:41]
  wire  _GEN_1608 = 4'h3 == cache_state ? 1'h0 : _GEN_1523; // @[cache.scala 330:28 255:44]
  wire [7:0] _GEN_1609 = 4'h3 == cache_state ? tag_mem_1_io_tag_read_visit : _GEN_1524; // @[cache.scala 330:28 257:41]
  wire  _GEN_1610 = 4'h3 == cache_state ? tag_mem_1_io_tag_read_valid : _GEN_1525; // @[cache.scala 330:28 257:41]
  wire  _GEN_1611 = 4'h3 == cache_state ? tag_mem_2_io_tag_read_dirty : _GEN_1526; // @[cache.scala 330:28 257:41]
  wire [21:0] _GEN_1612 = 4'h3 == cache_state ? tag_mem_2_io_tag_read_tag : _GEN_1527; // @[cache.scala 330:28 257:41]
  wire  _GEN_1613 = 4'h3 == cache_state ? 1'h0 : _GEN_1528; // @[cache.scala 330:28 255:44]
  wire [7:0] _GEN_1614 = 4'h3 == cache_state ? tag_mem_2_io_tag_read_visit : _GEN_1529; // @[cache.scala 330:28 257:41]
  wire  _GEN_1615 = 4'h3 == cache_state ? tag_mem_2_io_tag_read_valid : _GEN_1530; // @[cache.scala 330:28 257:41]
  wire  _GEN_1616 = 4'h3 == cache_state ? tag_mem_3_io_tag_read_dirty : _GEN_1531; // @[cache.scala 330:28 257:41]
  wire [21:0] _GEN_1617 = 4'h3 == cache_state ? tag_mem_3_io_tag_read_tag : _GEN_1532; // @[cache.scala 330:28 257:41]
  wire  _GEN_1618 = 4'h3 == cache_state ? 1'h0 : _GEN_1533; // @[cache.scala 330:28 255:44]
  wire [7:0] _GEN_1619 = 4'h3 == cache_state ? tag_mem_3_io_tag_read_visit : _GEN_1534; // @[cache.scala 330:28 257:41]
  wire  _GEN_1620 = 4'h3 == cache_state ? tag_mem_3_io_tag_read_valid : _GEN_1535; // @[cache.scala 330:28 257:41]
  wire  _GEN_1621 = 4'h3 == cache_state ? 1'h0 : _GEN_1536; // @[cache.scala 330:28 256:45]
  wire [1023:0] _GEN_1648 = 4'h3 == cache_state ? data_mem_0_io_data_read_data : _GEN_1563; // @[cache.scala 330:28 258:43]
  wire  _GEN_1649 = 4'h3 == cache_state ? 1'h0 : _GEN_1564; // @[cache.scala 330:28 256:45]
  wire [1023:0] _GEN_1650 = 4'h3 == cache_state ? data_mem_1_io_data_read_data : _GEN_1565; // @[cache.scala 330:28 258:43]
  wire  _GEN_1651 = 4'h3 == cache_state ? 1'h0 : _GEN_1566; // @[cache.scala 330:28 256:45]
  wire [1023:0] _GEN_1652 = 4'h3 == cache_state ? data_mem_2_io_data_read_data : _GEN_1567; // @[cache.scala 330:28 258:43]
  wire  _GEN_1653 = 4'h3 == cache_state ? 1'h0 : _GEN_1568; // @[cache.scala 330:28 256:45]
  wire [1023:0] _GEN_1654 = 4'h3 == cache_state ? data_mem_3_io_data_read_data : _GEN_1569; // @[cache.scala 330:28 258:43]
  wire [1:0] _GEN_1663 = 4'h3 == cache_state ? replace : _GEN_1578; // @[cache.scala 330:28 183:30]
  wire [31:0] _GEN_1664 = 4'h3 == cache_state ? refill_addr : _GEN_1579; // @[cache.scala 330:28 184:34]
  wire [31:0] _GEN_1665 = 4'h3 == cache_state ? writeback_addr : _GEN_1580; // @[cache.scala 330:28 186:37]
  wire  _GEN_1666 = 4'h3 == cache_state ? 1'h0 : _GEN_1581; // @[cache.scala 290:28 330:28]
  wire [31:0] _GEN_1668 = 4'h3 == cache_state ? cpu_request_addr_reg : _GEN_1583; // @[cache.scala 330:28 291:32]
  wire [3:0] _GEN_1671 = 4'h3 == cache_state ? _GEN_0 : _GEN_1587; // @[cache.scala 330:28]
  wire  _GEN_1672 = 4'h3 == cache_state ? 1'h0 : _GEN_1588; // @[cache.scala 283:28 330:28]
  wire [31:0] _GEN_1674 = 4'h3 == cache_state ? cpu_request_addr_reg : _GEN_1590; // @[cache.scala 330:28 284:32]
  wire  _GEN_1675 = 4'h2 == cache_state | _GEN_1672; // @[cache.scala 330:28 362:44]
  wire [3:0] _GEN_1676 = 4'h2 == cache_state ? 4'h0 : 4'hf; // @[cache.scala 330:28 363:47]
  wire [31:0] _GEN_1678 = 4'h2 == cache_state ? cpu_request_addr_reg : _GEN_1674; // @[cache.scala 330:28 366:48]
  wire [63:0] _GEN_1679 = 4'h2 == cache_state ? 64'h0 : _GEN_1591; // @[cache.scala 330:28 277:30]
  wire  _GEN_1680 = 4'h2 == cache_state ? 1'h0 : _GEN_1592; // @[cache.scala 302:27 330:28]
  wire  _GEN_1681 = 4'h2 == cache_state ? 1'h0 : _GEN_1594; // @[cache.scala 330:28 276:31]
  wire  _GEN_1682 = 4'h2 == cache_state ? 1'h0 : _GEN_1595; // @[cache.scala 297:27 330:28]
  wire  _GEN_1683 = 4'h2 == cache_state ? last : _GEN_1596; // @[cache.scala 330:28 300:31]
  wire [63:0] _GEN_1684 = 4'h2 == cache_state ? 64'h0 : _GEN_1597; // @[cache.scala 330:28 299:31]
  wire [7:0] _GEN_1685 = 4'h2 == cache_state ? 8'hff : _GEN_1598; // @[cache.scala 330:28 298:31]
  wire  _GEN_1686 = 4'h2 == cache_state ? 1'h0 : _GEN_1599; // @[cache.scala 304:27 330:28]
  wire  _GEN_1688 = 4'h2 == cache_state ? tag_mem_0_io_tag_read_dirty : _GEN_1601; // @[cache.scala 330:28 257:41]
  wire [21:0] _GEN_1689 = 4'h2 == cache_state ? tag_mem_0_io_tag_read_tag : _GEN_1602; // @[cache.scala 330:28 257:41]
  wire  _GEN_1690 = 4'h2 == cache_state ? 1'h0 : _GEN_1603; // @[cache.scala 330:28 255:44]
  wire [7:0] _GEN_1691 = 4'h2 == cache_state ? tag_mem_0_io_tag_read_visit : _GEN_1604; // @[cache.scala 330:28 257:41]
  wire  _GEN_1692 = 4'h2 == cache_state ? tag_mem_0_io_tag_read_valid : _GEN_1605; // @[cache.scala 330:28 257:41]
  wire  _GEN_1693 = 4'h2 == cache_state ? tag_mem_1_io_tag_read_dirty : _GEN_1606; // @[cache.scala 330:28 257:41]
  wire [21:0] _GEN_1694 = 4'h2 == cache_state ? tag_mem_1_io_tag_read_tag : _GEN_1607; // @[cache.scala 330:28 257:41]
  wire  _GEN_1695 = 4'h2 == cache_state ? 1'h0 : _GEN_1608; // @[cache.scala 330:28 255:44]
  wire [7:0] _GEN_1696 = 4'h2 == cache_state ? tag_mem_1_io_tag_read_visit : _GEN_1609; // @[cache.scala 330:28 257:41]
  wire  _GEN_1697 = 4'h2 == cache_state ? tag_mem_1_io_tag_read_valid : _GEN_1610; // @[cache.scala 330:28 257:41]
  wire  _GEN_1698 = 4'h2 == cache_state ? tag_mem_2_io_tag_read_dirty : _GEN_1611; // @[cache.scala 330:28 257:41]
  wire [21:0] _GEN_1699 = 4'h2 == cache_state ? tag_mem_2_io_tag_read_tag : _GEN_1612; // @[cache.scala 330:28 257:41]
  wire  _GEN_1700 = 4'h2 == cache_state ? 1'h0 : _GEN_1613; // @[cache.scala 330:28 255:44]
  wire [7:0] _GEN_1701 = 4'h2 == cache_state ? tag_mem_2_io_tag_read_visit : _GEN_1614; // @[cache.scala 330:28 257:41]
  wire  _GEN_1702 = 4'h2 == cache_state ? tag_mem_2_io_tag_read_valid : _GEN_1615; // @[cache.scala 330:28 257:41]
  wire  _GEN_1703 = 4'h2 == cache_state ? tag_mem_3_io_tag_read_dirty : _GEN_1616; // @[cache.scala 330:28 257:41]
  wire [21:0] _GEN_1704 = 4'h2 == cache_state ? tag_mem_3_io_tag_read_tag : _GEN_1617; // @[cache.scala 330:28 257:41]
  wire  _GEN_1705 = 4'h2 == cache_state ? 1'h0 : _GEN_1618; // @[cache.scala 330:28 255:44]
  wire [7:0] _GEN_1706 = 4'h2 == cache_state ? tag_mem_3_io_tag_read_visit : _GEN_1619; // @[cache.scala 330:28 257:41]
  wire  _GEN_1707 = 4'h2 == cache_state ? tag_mem_3_io_tag_read_valid : _GEN_1620; // @[cache.scala 330:28 257:41]
  wire  _GEN_1708 = 4'h2 == cache_state ? 1'h0 : _GEN_1621; // @[cache.scala 330:28 256:45]
  wire [1023:0] _GEN_1735 = 4'h2 == cache_state ? data_mem_0_io_data_read_data : _GEN_1648; // @[cache.scala 330:28 258:43]
  wire  _GEN_1736 = 4'h2 == cache_state ? 1'h0 : _GEN_1649; // @[cache.scala 330:28 256:45]
  wire [1023:0] _GEN_1737 = 4'h2 == cache_state ? data_mem_1_io_data_read_data : _GEN_1650; // @[cache.scala 330:28 258:43]
  wire  _GEN_1738 = 4'h2 == cache_state ? 1'h0 : _GEN_1651; // @[cache.scala 330:28 256:45]
  wire [1023:0] _GEN_1739 = 4'h2 == cache_state ? data_mem_2_io_data_read_data : _GEN_1652; // @[cache.scala 330:28 258:43]
  wire  _GEN_1740 = 4'h2 == cache_state ? 1'h0 : _GEN_1653; // @[cache.scala 330:28 256:45]
  wire [1023:0] _GEN_1741 = 4'h2 == cache_state ? data_mem_3_io_data_read_data : _GEN_1654; // @[cache.scala 330:28 258:43]
  wire  _GEN_1753 = 4'h2 == cache_state ? 1'h0 : _GEN_1666; // @[cache.scala 290:28 330:28]
  wire [31:0] _GEN_1755 = 4'h2 == cache_state ? cpu_request_addr_reg : _GEN_1668; // @[cache.scala 330:28 291:32]
  wire  _GEN_1759 = 4'h1 == cache_state | _GEN_1753; // @[cache.scala 330:28 351:44]
  wire [3:0] _GEN_1760 = 4'h1 == cache_state ? 4'h0 : 4'hf; // @[cache.scala 330:28 352:47]
  wire [31:0] _GEN_1762 = 4'h1 == cache_state ? cpu_request_addr_reg : _GEN_1755; // @[cache.scala 330:28 354:48]
  wire  _GEN_1763 = 4'h1 == cache_state ? 1'h0 : _GEN_1675; // @[cache.scala 283:28 330:28]
  wire [3:0] _GEN_1764 = 4'h1 == cache_state ? 4'hf : _GEN_1676; // @[cache.scala 330:28 285:31]
  wire [31:0] _GEN_1765 = 4'h1 == cache_state ? cpu_request_addr_reg : _GEN_1678; // @[cache.scala 330:28 284:32]
  wire [63:0] _GEN_1766 = 4'h1 == cache_state ? 64'h0 : _GEN_1679; // @[cache.scala 330:28 277:30]
  wire  _GEN_1767 = 4'h1 == cache_state ? 1'h0 : _GEN_1680; // @[cache.scala 302:27 330:28]
  wire  _GEN_1768 = 4'h1 == cache_state ? 1'h0 : _GEN_1681; // @[cache.scala 330:28 276:31]
  wire  _GEN_1769 = 4'h1 == cache_state ? 1'h0 : _GEN_1682; // @[cache.scala 297:27 330:28]
  wire  _GEN_1770 = 4'h1 == cache_state ? last : _GEN_1683; // @[cache.scala 330:28 300:31]
  wire [63:0] _GEN_1771 = 4'h1 == cache_state ? 64'h0 : _GEN_1684; // @[cache.scala 330:28 299:31]
  wire [7:0] _GEN_1772 = 4'h1 == cache_state ? 8'hff : _GEN_1685; // @[cache.scala 330:28 298:31]
  wire  _GEN_1773 = 4'h1 == cache_state ? 1'h0 : _GEN_1686; // @[cache.scala 304:27 330:28]
  wire  _GEN_1775 = 4'h1 == cache_state ? tag_mem_0_io_tag_read_dirty : _GEN_1688; // @[cache.scala 330:28 257:41]
  wire [21:0] _GEN_1776 = 4'h1 == cache_state ? tag_mem_0_io_tag_read_tag : _GEN_1689; // @[cache.scala 330:28 257:41]
  wire  _GEN_1777 = 4'h1 == cache_state ? 1'h0 : _GEN_1690; // @[cache.scala 330:28 255:44]
  wire [7:0] _GEN_1778 = 4'h1 == cache_state ? tag_mem_0_io_tag_read_visit : _GEN_1691; // @[cache.scala 330:28 257:41]
  wire  _GEN_1779 = 4'h1 == cache_state ? tag_mem_0_io_tag_read_valid : _GEN_1692; // @[cache.scala 330:28 257:41]
  wire  _GEN_1780 = 4'h1 == cache_state ? tag_mem_1_io_tag_read_dirty : _GEN_1693; // @[cache.scala 330:28 257:41]
  wire [21:0] _GEN_1781 = 4'h1 == cache_state ? tag_mem_1_io_tag_read_tag : _GEN_1694; // @[cache.scala 330:28 257:41]
  wire  _GEN_1782 = 4'h1 == cache_state ? 1'h0 : _GEN_1695; // @[cache.scala 330:28 255:44]
  wire [7:0] _GEN_1783 = 4'h1 == cache_state ? tag_mem_1_io_tag_read_visit : _GEN_1696; // @[cache.scala 330:28 257:41]
  wire  _GEN_1784 = 4'h1 == cache_state ? tag_mem_1_io_tag_read_valid : _GEN_1697; // @[cache.scala 330:28 257:41]
  wire  _GEN_1785 = 4'h1 == cache_state ? tag_mem_2_io_tag_read_dirty : _GEN_1698; // @[cache.scala 330:28 257:41]
  wire [21:0] _GEN_1786 = 4'h1 == cache_state ? tag_mem_2_io_tag_read_tag : _GEN_1699; // @[cache.scala 330:28 257:41]
  wire  _GEN_1787 = 4'h1 == cache_state ? 1'h0 : _GEN_1700; // @[cache.scala 330:28 255:44]
  wire [7:0] _GEN_1788 = 4'h1 == cache_state ? tag_mem_2_io_tag_read_visit : _GEN_1701; // @[cache.scala 330:28 257:41]
  wire  _GEN_1789 = 4'h1 == cache_state ? tag_mem_2_io_tag_read_valid : _GEN_1702; // @[cache.scala 330:28 257:41]
  wire  _GEN_1790 = 4'h1 == cache_state ? tag_mem_3_io_tag_read_dirty : _GEN_1703; // @[cache.scala 330:28 257:41]
  wire [21:0] _GEN_1791 = 4'h1 == cache_state ? tag_mem_3_io_tag_read_tag : _GEN_1704; // @[cache.scala 330:28 257:41]
  wire  _GEN_1792 = 4'h1 == cache_state ? 1'h0 : _GEN_1705; // @[cache.scala 330:28 255:44]
  wire [7:0] _GEN_1793 = 4'h1 == cache_state ? tag_mem_3_io_tag_read_visit : _GEN_1706; // @[cache.scala 330:28 257:41]
  wire  _GEN_1794 = 4'h1 == cache_state ? tag_mem_3_io_tag_read_valid : _GEN_1707; // @[cache.scala 330:28 257:41]
  wire  _GEN_1795 = 4'h1 == cache_state ? 1'h0 : _GEN_1708; // @[cache.scala 330:28 256:45]
  wire [1023:0] _GEN_1822 = 4'h1 == cache_state ? data_mem_0_io_data_read_data : _GEN_1735; // @[cache.scala 330:28 258:43]
  wire  _GEN_1823 = 4'h1 == cache_state ? 1'h0 : _GEN_1736; // @[cache.scala 330:28 256:45]
  wire [1023:0] _GEN_1824 = 4'h1 == cache_state ? data_mem_1_io_data_read_data : _GEN_1737; // @[cache.scala 330:28 258:43]
  wire  _GEN_1825 = 4'h1 == cache_state ? 1'h0 : _GEN_1738; // @[cache.scala 330:28 256:45]
  wire [1023:0] _GEN_1826 = 4'h1 == cache_state ? data_mem_2_io_data_read_data : _GEN_1739; // @[cache.scala 330:28 258:43]
  wire  _GEN_1827 = 4'h1 == cache_state ? 1'h0 : _GEN_1740; // @[cache.scala 330:28 256:45]
  wire [1023:0] _GEN_1828 = 4'h1 == cache_state ? data_mem_3_io_data_read_data : _GEN_1741; // @[cache.scala 330:28 258:43]
  wire [3:0] _GEN_1845 = 4'h0 == cache_state ? 4'hf : _GEN_1760; // @[cache.scala 330:28 292:31]
  wire [3:0] _GEN_1848 = 4'h0 == cache_state ? 4'hf : _GEN_1764; // @[cache.scala 330:28 285:31]
  tag_cache tag_mem_0 ( // @[cache.scala 175:45]
    .clock(tag_mem_0_clock),
    .io_cache_req_index(tag_mem_0_io_cache_req_index),
    .io_cache_req_we(tag_mem_0_io_cache_req_we),
    .io_tag_write_valid(tag_mem_0_io_tag_write_valid),
    .io_tag_write_dirty(tag_mem_0_io_tag_write_dirty),
    .io_tag_write_visit(tag_mem_0_io_tag_write_visit),
    .io_tag_write_tag(tag_mem_0_io_tag_write_tag),
    .io_tag_read_valid(tag_mem_0_io_tag_read_valid),
    .io_tag_read_dirty(tag_mem_0_io_tag_read_dirty),
    .io_tag_read_visit(tag_mem_0_io_tag_read_visit),
    .io_tag_read_tag(tag_mem_0_io_tag_read_tag)
  );
  tag_cache tag_mem_1 ( // @[cache.scala 175:45]
    .clock(tag_mem_1_clock),
    .io_cache_req_index(tag_mem_1_io_cache_req_index),
    .io_cache_req_we(tag_mem_1_io_cache_req_we),
    .io_tag_write_valid(tag_mem_1_io_tag_write_valid),
    .io_tag_write_dirty(tag_mem_1_io_tag_write_dirty),
    .io_tag_write_visit(tag_mem_1_io_tag_write_visit),
    .io_tag_write_tag(tag_mem_1_io_tag_write_tag),
    .io_tag_read_valid(tag_mem_1_io_tag_read_valid),
    .io_tag_read_dirty(tag_mem_1_io_tag_read_dirty),
    .io_tag_read_visit(tag_mem_1_io_tag_read_visit),
    .io_tag_read_tag(tag_mem_1_io_tag_read_tag)
  );
  tag_cache tag_mem_2 ( // @[cache.scala 175:45]
    .clock(tag_mem_2_clock),
    .io_cache_req_index(tag_mem_2_io_cache_req_index),
    .io_cache_req_we(tag_mem_2_io_cache_req_we),
    .io_tag_write_valid(tag_mem_2_io_tag_write_valid),
    .io_tag_write_dirty(tag_mem_2_io_tag_write_dirty),
    .io_tag_write_visit(tag_mem_2_io_tag_write_visit),
    .io_tag_write_tag(tag_mem_2_io_tag_write_tag),
    .io_tag_read_valid(tag_mem_2_io_tag_read_valid),
    .io_tag_read_dirty(tag_mem_2_io_tag_read_dirty),
    .io_tag_read_visit(tag_mem_2_io_tag_read_visit),
    .io_tag_read_tag(tag_mem_2_io_tag_read_tag)
  );
  tag_cache tag_mem_3 ( // @[cache.scala 175:45]
    .clock(tag_mem_3_clock),
    .io_cache_req_index(tag_mem_3_io_cache_req_index),
    .io_cache_req_we(tag_mem_3_io_cache_req_we),
    .io_tag_write_valid(tag_mem_3_io_tag_write_valid),
    .io_tag_write_dirty(tag_mem_3_io_tag_write_dirty),
    .io_tag_write_visit(tag_mem_3_io_tag_write_visit),
    .io_tag_write_tag(tag_mem_3_io_tag_write_tag),
    .io_tag_read_valid(tag_mem_3_io_tag_read_valid),
    .io_tag_read_dirty(tag_mem_3_io_tag_read_dirty),
    .io_tag_read_visit(tag_mem_3_io_tag_read_visit),
    .io_tag_read_tag(tag_mem_3_io_tag_read_tag)
  );
  data_cache data_mem_0 ( // @[cache.scala 176:46]
    .clock(data_mem_0_clock),
    .io_cache_req_index(data_mem_0_io_cache_req_index),
    .io_cache_req_write_index(data_mem_0_io_cache_req_write_index),
    .io_cache_req_we(data_mem_0_io_cache_req_we),
    .io_data_write_data(data_mem_0_io_data_write_data),
    .io_data_read_data(data_mem_0_io_data_read_data)
  );
  data_cache data_mem_1 ( // @[cache.scala 176:46]
    .clock(data_mem_1_clock),
    .io_cache_req_index(data_mem_1_io_cache_req_index),
    .io_cache_req_write_index(data_mem_1_io_cache_req_write_index),
    .io_cache_req_we(data_mem_1_io_cache_req_we),
    .io_data_write_data(data_mem_1_io_data_write_data),
    .io_data_read_data(data_mem_1_io_data_read_data)
  );
  data_cache data_mem_2 ( // @[cache.scala 176:46]
    .clock(data_mem_2_clock),
    .io_cache_req_index(data_mem_2_io_cache_req_index),
    .io_cache_req_write_index(data_mem_2_io_cache_req_write_index),
    .io_cache_req_we(data_mem_2_io_cache_req_we),
    .io_data_write_data(data_mem_2_io_data_write_data),
    .io_data_read_data(data_mem_2_io_data_read_data)
  );
  data_cache data_mem_3 ( // @[cache.scala 176:46]
    .clock(data_mem_3_clock),
    .io_cache_req_index(data_mem_3_io_cache_req_index),
    .io_cache_req_write_index(data_mem_3_io_cache_req_write_index),
    .io_cache_req_we(data_mem_3_io_cache_req_we),
    .io_data_write_data(data_mem_3_io_data_write_data),
    .io_data_read_data(data_mem_3_io_data_read_data)
  );
  assign io_cpu_response_data = 4'h0 == cache_state ? 64'h0 : _GEN_1766; // @[cache.scala 330:28 277:30]
  assign io_cpu_response_ready = 4'h0 == cache_state ? 1'h0 : _GEN_1768; // @[cache.scala 330:28 276:31]
  assign io_mem_io_aw_valid = 4'h0 == cache_state ? 1'h0 : _GEN_1763; // @[cache.scala 283:28 330:28]
  assign io_mem_io_aw_bits_addr = 4'h0 == cache_state ? cpu_request_addr_reg : _GEN_1765; // @[cache.scala 330:28 284:32]
  assign io_mem_io_aw_bits_len = {{4'd0}, _GEN_1848};
  assign io_mem_io_w_valid = 4'h0 == cache_state ? 1'h0 : _GEN_1769; // @[cache.scala 297:27 330:28]
  assign io_mem_io_w_bits_data = 4'h0 == cache_state ? 64'h0 : _GEN_1771; // @[cache.scala 330:28 299:31]
  assign io_mem_io_w_bits_strb = 4'h0 == cache_state ? 8'hff : _GEN_1772; // @[cache.scala 330:28 298:31]
  assign io_mem_io_w_bits_last = 4'h0 == cache_state ? last : _GEN_1770; // @[cache.scala 330:28 300:31]
  assign io_mem_io_b_ready = 4'h0 == cache_state ? 1'h0 : _GEN_1773; // @[cache.scala 304:27 330:28]
  assign io_mem_io_ar_valid = 4'h0 == cache_state ? 1'h0 : _GEN_1759; // @[cache.scala 290:28 330:28]
  assign io_mem_io_ar_bits_addr = 4'h0 == cache_state ? cpu_request_addr_reg : _GEN_1762; // @[cache.scala 330:28 291:32]
  assign io_mem_io_ar_bits_len = {{4'd0}, _GEN_1845};
  assign io_mem_io_r_ready = 4'h0 == cache_state ? 1'h0 : _GEN_1767; // @[cache.scala 302:27 330:28]
  assign tag_mem_0_clock = clock;
  assign tag_mem_0_io_cache_req_index = cpu_request_addr_reg[9:7]; // @[cache.scala 208:58]
  assign tag_mem_0_io_cache_req_we = 4'h0 == cache_state ? 1'h0 : _GEN_1777; // @[cache.scala 330:28 255:44]
  assign tag_mem_0_io_tag_write_valid = 4'h0 == cache_state ? tag_mem_0_io_tag_read_valid : _GEN_1779; // @[cache.scala 330:28 257:41]
  assign tag_mem_0_io_tag_write_dirty = 4'h0 == cache_state ? tag_mem_0_io_tag_read_dirty : _GEN_1775; // @[cache.scala 330:28 257:41]
  assign tag_mem_0_io_tag_write_visit = 4'h0 == cache_state ? tag_mem_0_io_tag_read_visit : _GEN_1778; // @[cache.scala 330:28 257:41]
  assign tag_mem_0_io_tag_write_tag = 4'h0 == cache_state ? tag_mem_0_io_tag_read_tag : _GEN_1776; // @[cache.scala 330:28 257:41]
  assign tag_mem_1_clock = clock;
  assign tag_mem_1_io_cache_req_index = cpu_request_addr_reg[9:7]; // @[cache.scala 208:58]
  assign tag_mem_1_io_cache_req_we = 4'h0 == cache_state ? 1'h0 : _GEN_1782; // @[cache.scala 330:28 255:44]
  assign tag_mem_1_io_tag_write_valid = 4'h0 == cache_state ? tag_mem_1_io_tag_read_valid : _GEN_1784; // @[cache.scala 330:28 257:41]
  assign tag_mem_1_io_tag_write_dirty = 4'h0 == cache_state ? tag_mem_1_io_tag_read_dirty : _GEN_1780; // @[cache.scala 330:28 257:41]
  assign tag_mem_1_io_tag_write_visit = 4'h0 == cache_state ? tag_mem_1_io_tag_read_visit : _GEN_1783; // @[cache.scala 330:28 257:41]
  assign tag_mem_1_io_tag_write_tag = 4'h0 == cache_state ? tag_mem_1_io_tag_read_tag : _GEN_1781; // @[cache.scala 330:28 257:41]
  assign tag_mem_2_clock = clock;
  assign tag_mem_2_io_cache_req_index = cpu_request_addr_reg[9:7]; // @[cache.scala 208:58]
  assign tag_mem_2_io_cache_req_we = 4'h0 == cache_state ? 1'h0 : _GEN_1787; // @[cache.scala 330:28 255:44]
  assign tag_mem_2_io_tag_write_valid = 4'h0 == cache_state ? tag_mem_2_io_tag_read_valid : _GEN_1789; // @[cache.scala 330:28 257:41]
  assign tag_mem_2_io_tag_write_dirty = 4'h0 == cache_state ? tag_mem_2_io_tag_read_dirty : _GEN_1785; // @[cache.scala 330:28 257:41]
  assign tag_mem_2_io_tag_write_visit = 4'h0 == cache_state ? tag_mem_2_io_tag_read_visit : _GEN_1788; // @[cache.scala 330:28 257:41]
  assign tag_mem_2_io_tag_write_tag = 4'h0 == cache_state ? tag_mem_2_io_tag_read_tag : _GEN_1786; // @[cache.scala 330:28 257:41]
  assign tag_mem_3_clock = clock;
  assign tag_mem_3_io_cache_req_index = cpu_request_addr_reg[9:7]; // @[cache.scala 208:58]
  assign tag_mem_3_io_cache_req_we = 4'h0 == cache_state ? 1'h0 : _GEN_1792; // @[cache.scala 330:28 255:44]
  assign tag_mem_3_io_tag_write_valid = 4'h0 == cache_state ? tag_mem_3_io_tag_read_valid : _GEN_1794; // @[cache.scala 330:28 257:41]
  assign tag_mem_3_io_tag_write_dirty = 4'h0 == cache_state ? tag_mem_3_io_tag_read_dirty : _GEN_1790; // @[cache.scala 330:28 257:41]
  assign tag_mem_3_io_tag_write_visit = 4'h0 == cache_state ? tag_mem_3_io_tag_read_visit : _GEN_1793; // @[cache.scala 330:28 257:41]
  assign tag_mem_3_io_tag_write_tag = 4'h0 == cache_state ? tag_mem_3_io_tag_read_tag : _GEN_1791; // @[cache.scala 330:28 257:41]
  assign data_mem_0_clock = clock;
  assign data_mem_0_io_cache_req_index = io_cpu_request_addr[9:7]; // @[cache.scala 251:70]
  assign data_mem_0_io_cache_req_write_index = cpu_request_addr_reg[9:7]; // @[cache.scala 208:58]
  assign data_mem_0_io_cache_req_we = 4'h0 == cache_state ? 1'h0 : _GEN_1795; // @[cache.scala 330:28 256:45]
  assign data_mem_0_io_data_write_data = 4'h0 == cache_state ? data_mem_0_io_data_read_data : _GEN_1822; // @[cache.scala 330:28 258:43]
  assign data_mem_1_clock = clock;
  assign data_mem_1_io_cache_req_index = io_cpu_request_addr[9:7]; // @[cache.scala 251:70]
  assign data_mem_1_io_cache_req_write_index = cpu_request_addr_reg[9:7]; // @[cache.scala 208:58]
  assign data_mem_1_io_cache_req_we = 4'h0 == cache_state ? 1'h0 : _GEN_1823; // @[cache.scala 330:28 256:45]
  assign data_mem_1_io_data_write_data = 4'h0 == cache_state ? data_mem_1_io_data_read_data : _GEN_1824; // @[cache.scala 330:28 258:43]
  assign data_mem_2_clock = clock;
  assign data_mem_2_io_cache_req_index = io_cpu_request_addr[9:7]; // @[cache.scala 251:70]
  assign data_mem_2_io_cache_req_write_index = cpu_request_addr_reg[9:7]; // @[cache.scala 208:58]
  assign data_mem_2_io_cache_req_we = 4'h0 == cache_state ? 1'h0 : _GEN_1825; // @[cache.scala 330:28 256:45]
  assign data_mem_2_io_data_write_data = 4'h0 == cache_state ? data_mem_2_io_data_read_data : _GEN_1826; // @[cache.scala 330:28 258:43]
  assign data_mem_3_clock = clock;
  assign data_mem_3_io_cache_req_index = io_cpu_request_addr[9:7]; // @[cache.scala 251:70]
  assign data_mem_3_io_cache_req_write_index = cpu_request_addr_reg[9:7]; // @[cache.scala 208:58]
  assign data_mem_3_io_cache_req_we = 4'h0 == cache_state ? 1'h0 : _GEN_1827; // @[cache.scala 330:28 256:45]
  assign data_mem_3_io_data_write_data = 4'h0 == cache_state ? data_mem_3_io_data_read_data : _GEN_1828; // @[cache.scala 330:28 258:43]
  always @(posedge clock) begin
    if (reset) begin // @[cache.scala 173:34]
      cache_state <= 4'h0; // @[cache.scala 173:34]
    end else if (4'h0 == cache_state) begin // @[cache.scala 330:28]
      cache_state <= {{1'd0}, _GEN_4};
    end else if (4'h1 == cache_state) begin // @[cache.scala 330:28]
      cache_state <= {{2'd0}, _GEN_5};
    end else if (4'h2 == cache_state) begin // @[cache.scala 330:28]
      cache_state <= {{1'd0}, _GEN_6};
    end else begin
      cache_state <= _GEN_1593;
    end
    if (reset) begin // @[Counter.scala 62:40]
      index <= 4'h0; // @[Counter.scala 62:40]
    end else if (4'h0 == cache_state) begin // @[cache.scala 330:28]
      index <= _GEN_0;
    end else if (4'h1 == cache_state) begin // @[cache.scala 330:28]
      index <= _GEN_0;
    end else if (4'h2 == cache_state) begin // @[cache.scala 330:28]
      index <= _GEN_0;
    end else begin
      index <= _GEN_1671;
    end
    if (reset) begin // @[cache.scala 183:30]
      replace <= 2'h0; // @[cache.scala 183:30]
    end else if (!(4'h0 == cache_state)) begin // @[cache.scala 330:28]
      if (!(4'h1 == cache_state)) begin // @[cache.scala 330:28]
        if (!(4'h2 == cache_state)) begin // @[cache.scala 330:28]
          replace <= _GEN_1663;
        end
      end
    end
    if (reset) begin // @[cache.scala 184:34]
      refill_addr <= 32'h0; // @[cache.scala 184:34]
    end else if (!(4'h0 == cache_state)) begin // @[cache.scala 330:28]
      if (!(4'h1 == cache_state)) begin // @[cache.scala 330:28]
        if (!(4'h2 == cache_state)) begin // @[cache.scala 330:28]
          refill_addr <= _GEN_1664;
        end
      end
    end
    if (reset) begin // @[cache.scala 186:37]
      writeback_addr <= 32'h0; // @[cache.scala 186:37]
    end else if (!(4'h0 == cache_state)) begin // @[cache.scala 330:28]
      if (!(4'h1 == cache_state)) begin // @[cache.scala 330:28]
        if (!(4'h2 == cache_state)) begin // @[cache.scala 330:28]
          writeback_addr <= _GEN_1665;
        end
      end
    end
    if (reset) begin // @[cache.scala 191:43]
      cpu_request_addr_reg <= 32'h0; // @[cache.scala 191:43]
    end else begin
      cpu_request_addr_reg <= _cpu_request_addr_reg_T_1; // @[cache.scala 199:30]
    end
    if (reset) begin // @[cache.scala 192:39]
      cpu_request_data <= 64'h0; // @[cache.scala 192:39]
    end else begin
      cpu_request_data <= io_cpu_request_data; // @[cache.scala 200:26]
    end
    if (reset) begin // @[cache.scala 193:39]
      cpu_request_mask <= 8'h0; // @[cache.scala 193:39]
    end else begin
      cpu_request_mask <= io_cpu_request_mask; // @[cache.scala 201:26]
    end
    if (reset) begin // @[cache.scala 194:37]
      cpu_request_rw <= 1'h0; // @[cache.scala 194:37]
    end else begin
      cpu_request_rw <= io_cpu_request_rw; // @[cache.scala 202:24]
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
  cache_state = _RAND_0[3:0];
  _RAND_1 = {1{`RANDOM}};
  index = _RAND_1[3:0];
  _RAND_2 = {1{`RANDOM}};
  replace = _RAND_2[1:0];
  _RAND_3 = {1{`RANDOM}};
  refill_addr = _RAND_3[31:0];
  _RAND_4 = {1{`RANDOM}};
  writeback_addr = _RAND_4[31:0];
  _RAND_5 = {1{`RANDOM}};
  cpu_request_addr_reg = _RAND_5[31:0];
  _RAND_6 = {2{`RANDOM}};
  cpu_request_data = _RAND_6[63:0];
  _RAND_7 = {1{`RANDOM}};
  cpu_request_mask = _RAND_7[7:0];
  _RAND_8 = {1{`RANDOM}};
  cpu_request_rw = _RAND_8[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module CacheArbiter(
  input         clock,
  input         reset,
  output        io_icache_ar_ready,
  input         io_icache_ar_valid,
  input  [31:0] io_icache_ar_bits_addr,
  input  [7:0]  io_icache_ar_bits_len,
  input         io_icache_r_ready,
  output        io_icache_r_valid,
  output [63:0] io_icache_r_bits_data,
  output        io_icache_r_bits_last,
  output        io_dcache_aw_ready,
  input         io_dcache_aw_valid,
  input  [31:0] io_dcache_aw_bits_addr,
  input  [7:0]  io_dcache_aw_bits_len,
  output        io_dcache_w_ready,
  input         io_dcache_w_valid,
  input  [63:0] io_dcache_w_bits_data,
  input  [7:0]  io_dcache_w_bits_strb,
  input         io_dcache_w_bits_last,
  input         io_dcache_b_ready,
  output        io_dcache_b_valid,
  output        io_dcache_ar_ready,
  input         io_dcache_ar_valid,
  input  [31:0] io_dcache_ar_bits_addr,
  input  [7:0]  io_dcache_ar_bits_len,
  input         io_dcache_r_ready,
  output        io_dcache_r_valid,
  output [63:0] io_dcache_r_bits_data,
  output        io_dcache_r_bits_last,
  input         io_axi_out_aw_ready,
  output        io_axi_out_aw_valid,
  output [31:0] io_axi_out_aw_bits_addr,
  output [7:0]  io_axi_out_aw_bits_len,
  input         io_axi_out_w_ready,
  output        io_axi_out_w_valid,
  output [63:0] io_axi_out_w_bits_data,
  output [7:0]  io_axi_out_w_bits_strb,
  output        io_axi_out_w_bits_last,
  output        io_axi_out_b_ready,
  input         io_axi_out_b_valid,
  input         io_axi_out_ar_ready,
  output        io_axi_out_ar_valid,
  output [31:0] io_axi_out_ar_bits_addr,
  output [7:0]  io_axi_out_ar_bits_len,
  output        io_axi_out_r_ready,
  input         io_axi_out_r_valid,
  input  [63:0] io_axi_out_r_bits_data,
  input         io_axi_out_r_bits_last
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  reg [2:0] state; // @[Arbiter.scala 24:28]
  wire  _io_axi_out_aw_valid_T = state == 3'h6; // @[Arbiter.scala 28:60]
  wire  _io_axi_out_w_valid_T = state == 3'h3; // @[Arbiter.scala 34:58]
  wire  _io_dcache_b_valid_T = state == 3'h7; // @[Arbiter.scala 40:58]
  wire  _io_axi_out_ar_bits_T = state == 3'h5; // @[Arbiter.scala 46:27]
  wire  _io_axi_out_ar_valid_T_1 = state == 3'h4; // @[Arbiter.scala 51:85]
  wire  _io_icache_r_valid_T = state == 3'h1; // @[Arbiter.scala 58:58]
  wire  _io_dcache_r_valid_T = state == 3'h2; // @[Arbiter.scala 59:58]
  wire  _io_axi_out_r_ready_T_3 = io_dcache_r_ready & _io_dcache_r_valid_T; // @[Arbiter.scala 61:36]
  wire [2:0] _GEN_0 = io_icache_ar_valid ? 3'h4 : state; // @[Arbiter.scala 24:28 74:55 75:39]
  wire  _T_6 = io_icache_ar_ready & io_icache_ar_valid; // @[Decoupled.scala 50:35]
  wire  _T_10 = io_dcache_ar_ready & io_dcache_ar_valid; // @[Decoupled.scala 50:35]
  wire [2:0] _GEN_4 = _T_10 ? 3'h2 : state; // @[Arbiter.scala 24:28 93:48 94:39]
  wire  _T_14 = io_dcache_aw_ready & io_dcache_aw_valid; // @[Decoupled.scala 50:35]
  wire [2:0] _GEN_5 = _T_14 ? 3'h3 : state; // @[Arbiter.scala 24:28 98:48 99:39]
  wire  _T_18 = io_axi_out_r_ready & io_axi_out_r_valid; // @[Decoupled.scala 50:35]
  wire [2:0] _GEN_6 = _T_18 & io_axi_out_r_bits_last ? 3'h0 : state; // @[Arbiter.scala 103:74 104:39 24:28]
  wire  _T_28 = io_dcache_w_ready & io_dcache_w_valid; // @[Decoupled.scala 50:35]
  wire [2:0] _GEN_8 = _T_28 & io_dcache_w_bits_last ? 3'h7 : state; // @[Arbiter.scala 114:72 115:39 24:28]
  wire  _T_33 = io_axi_out_b_ready & io_axi_out_b_valid; // @[Decoupled.scala 50:35]
  wire [2:0] _GEN_9 = _T_33 ? 3'h0 : state; // @[Arbiter.scala 119:48 120:39 24:28]
  wire [2:0] _GEN_10 = 3'h7 == state ? _GEN_9 : state; // @[Arbiter.scala 66:22 24:28]
  wire [2:0] _GEN_11 = 3'h3 == state ? _GEN_8 : _GEN_10; // @[Arbiter.scala 66:22]
  wire [2:0] _GEN_12 = 3'h2 == state ? _GEN_6 : _GEN_11; // @[Arbiter.scala 66:22]
  wire [2:0] _GEN_13 = 3'h1 == state ? _GEN_6 : _GEN_12; // @[Arbiter.scala 66:22]
  wire [2:0] _GEN_14 = 3'h6 == state ? _GEN_5 : _GEN_13; // @[Arbiter.scala 66:22]
  assign io_icache_ar_ready = io_axi_out_ar_ready & _io_axi_out_ar_valid_T_1; // @[Arbiter.scala 53:51]
  assign io_icache_r_valid = io_axi_out_r_valid & state == 3'h1; // @[Arbiter.scala 58:49]
  assign io_icache_r_bits_data = io_axi_out_r_bits_data; // @[Arbiter.scala 56:26]
  assign io_icache_r_bits_last = io_axi_out_r_bits_last; // @[Arbiter.scala 56:26]
  assign io_dcache_aw_ready = io_axi_out_aw_ready & _io_axi_out_aw_valid_T; // @[Arbiter.scala 29:51]
  assign io_dcache_w_ready = io_axi_out_w_ready & _io_axi_out_w_valid_T; // @[Arbiter.scala 35:49]
  assign io_dcache_b_valid = io_axi_out_b_valid & state == 3'h7; // @[Arbiter.scala 40:49]
  assign io_dcache_ar_ready = io_axi_out_ar_ready & _io_axi_out_ar_bits_T; // @[Arbiter.scala 52:51]
  assign io_dcache_r_valid = io_axi_out_r_valid & state == 3'h2; // @[Arbiter.scala 59:49]
  assign io_dcache_r_bits_data = io_axi_out_r_bits_data; // @[Arbiter.scala 57:26]
  assign io_dcache_r_bits_last = io_axi_out_r_bits_last; // @[Arbiter.scala 57:26]
  assign io_axi_out_aw_valid = io_dcache_aw_valid & state == 3'h6; // @[Arbiter.scala 28:51]
  assign io_axi_out_aw_bits_addr = io_dcache_aw_bits_addr; // @[Arbiter.scala 27:28]
  assign io_axi_out_aw_bits_len = io_dcache_aw_bits_len; // @[Arbiter.scala 27:28]
  assign io_axi_out_w_valid = io_dcache_w_valid & state == 3'h3; // @[Arbiter.scala 34:49]
  assign io_axi_out_w_bits_data = io_dcache_w_bits_data; // @[Arbiter.scala 33:27]
  assign io_axi_out_w_bits_strb = io_dcache_w_bits_strb; // @[Arbiter.scala 33:27]
  assign io_axi_out_w_bits_last = io_dcache_w_bits_last; // @[Arbiter.scala 33:27]
  assign io_axi_out_b_ready = io_dcache_b_ready & _io_dcache_b_valid_T; // @[Arbiter.scala 41:49]
  assign io_axi_out_ar_valid = (io_icache_ar_valid | io_dcache_ar_valid) & (state == 3'h4 | _io_axi_out_ar_bits_T); // @[Arbiter.scala 51:75]
  assign io_axi_out_ar_bits_addr = _io_axi_out_ar_bits_T ? io_dcache_ar_bits_addr : io_icache_ar_bits_addr; // @[Arbiter.scala 47:20]
  assign io_axi_out_ar_bits_len = _io_axi_out_ar_bits_T ? io_dcache_ar_bits_len : io_icache_ar_bits_len; // @[Arbiter.scala 49:20]
  assign io_axi_out_r_ready = io_icache_r_ready & _io_icache_r_valid_T | _io_axi_out_r_ready_T_3; // @[Arbiter.scala 60:76]
  always @(posedge clock) begin
    if (reset) begin // @[Arbiter.scala 24:28]
      state <= 3'h0; // @[Arbiter.scala 24:28]
    end else if (3'h0 == state) begin // @[Arbiter.scala 66:22]
      if (io_dcache_aw_valid) begin // @[Arbiter.scala 68:49]
        state <= 3'h6; // @[Arbiter.scala 69:39]
      end else if (io_dcache_ar_valid) begin // @[Arbiter.scala 71:55]
        state <= 3'h5; // @[Arbiter.scala 72:39]
      end else begin
        state <= _GEN_0;
      end
    end else if (3'h4 == state) begin // @[Arbiter.scala 66:22]
      if (_T_6) begin // @[Arbiter.scala 88:48]
        state <= 3'h1; // @[Arbiter.scala 89:39]
      end
    end else if (3'h5 == state) begin // @[Arbiter.scala 66:22]
      state <= _GEN_4;
    end else begin
      state <= _GEN_14;
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
  state = _RAND_0[2:0];
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
  output [63:0] io_pc_debug,
  output [31:0] io_inst,
  output        io_start,
  output        io_stall,
  input         io_master_awready,
  output        io_master_awvalid,
  output [31:0] io_master_awaddr,
  output [3:0]  io_master_awid,
  output [7:0]  io_master_awlen,
  output [2:0]  io_master_awsize,
  output [1:0]  io_master_awburst,
  input         io_master_wready,
  output        io_master_wvalid,
  output [63:0] io_master_wdata,
  output [7:0]  io_master_wstrb,
  output        io_master_wlast,
  output        io_master_bready,
  input         io_master_bvalid,
  input  [1:0]  io_master_bresp,
  input  [3:0]  io_master_bid,
  input         io_master_arready,
  output        io_master_arvalid,
  output [31:0] io_master_araddr,
  output [3:0]  io_master_arid,
  output [7:0]  io_master_arlen,
  output [2:0]  io_master_arsize,
  output [1:0]  io_master_arburst,
  output        io_master_rready,
  input         io_master_rvalid,
  input  [1:0]  io_master_rresp,
  input  [63:0] io_master_rdata,
  input         io_master_rlast,
  input  [3:0]  io_master_rid
);
  wire  datapath_clock; // @[datapath.scala 878:30]
  wire  datapath_reset; // @[datapath.scala 878:30]
  wire [31:0] datapath_io_ctrl_inst; // @[datapath.scala 878:30]
  wire [1:0] datapath_io_ctrl_pc_sel; // @[datapath.scala 878:30]
  wire  datapath_io_ctrl_A_sel; // @[datapath.scala 878:30]
  wire  datapath_io_ctrl_B_sel; // @[datapath.scala 878:30]
  wire [1:0] datapath_io_ctrl_wd_type; // @[datapath.scala 878:30]
  wire [2:0] datapath_io_ctrl_imm_sel; // @[datapath.scala 878:30]
  wire [2:0] datapath_io_ctrl_br_type; // @[datapath.scala 878:30]
  wire [2:0] datapath_io_ctrl_st_type; // @[datapath.scala 878:30]
  wire [2:0] datapath_io_ctrl_ld_type; // @[datapath.scala 878:30]
  wire [1:0] datapath_io_ctrl_wb_sel; // @[datapath.scala 878:30]
  wire  datapath_io_ctrl_wb_en; // @[datapath.scala 878:30]
  wire [3:0] datapath_io_ctrl_alu_op; // @[datapath.scala 878:30]
  wire  datapath_io_ctrl_prv; // @[datapath.scala 878:30]
  wire [2:0] datapath_io_ctrl_csr_cmd; // @[datapath.scala 878:30]
  wire  datapath_io_ctrl_is_illegal; // @[datapath.scala 878:30]
  wire  datapath_io_ctrl_is_kill; // @[datapath.scala 878:30]
  wire [63:0] datapath_io_pc; // @[datapath.scala 878:30]
  wire [31:0] datapath_io_inst; // @[datapath.scala 878:30]
  wire  datapath_io_start; // @[datapath.scala 878:30]
  wire  datapath_io_stall; // @[datapath.scala 878:30]
  wire [31:0] datapath_io_icache_cpu_request_addr; // @[datapath.scala 878:30]
  wire [63:0] datapath_io_icache_cpu_response_data; // @[datapath.scala 878:30]
  wire  datapath_io_icache_cpu_response_ready; // @[datapath.scala 878:30]
  wire [31:0] datapath_io_dcache_cpu_request_addr; // @[datapath.scala 878:30]
  wire [63:0] datapath_io_dcache_cpu_request_data; // @[datapath.scala 878:30]
  wire [7:0] datapath_io_dcache_cpu_request_mask; // @[datapath.scala 878:30]
  wire  datapath_io_dcache_cpu_request_rw; // @[datapath.scala 878:30]
  wire  datapath_io_dcache_cpu_request_valid; // @[datapath.scala 878:30]
  wire [63:0] datapath_io_dcache_cpu_response_data; // @[datapath.scala 878:30]
  wire  datapath_io_dcache_cpu_response_ready; // @[datapath.scala 878:30]
  wire [31:0] control_io_inst; // @[datapath.scala 879:29]
  wire [1:0] control_io_pc_sel; // @[datapath.scala 879:29]
  wire  control_io_A_sel; // @[datapath.scala 879:29]
  wire  control_io_B_sel; // @[datapath.scala 879:29]
  wire [1:0] control_io_wd_type; // @[datapath.scala 879:29]
  wire [2:0] control_io_imm_sel; // @[datapath.scala 879:29]
  wire [2:0] control_io_br_type; // @[datapath.scala 879:29]
  wire [2:0] control_io_st_type; // @[datapath.scala 879:29]
  wire [2:0] control_io_ld_type; // @[datapath.scala 879:29]
  wire [1:0] control_io_wb_sel; // @[datapath.scala 879:29]
  wire  control_io_wb_en; // @[datapath.scala 879:29]
  wire [3:0] control_io_alu_op; // @[datapath.scala 879:29]
  wire  control_io_prv; // @[datapath.scala 879:29]
  wire [2:0] control_io_csr_cmd; // @[datapath.scala 879:29]
  wire  control_io_is_illegal; // @[datapath.scala 879:29]
  wire  control_io_is_kill; // @[datapath.scala 879:29]
  wire  icache_clock; // @[datapath.scala 880:28]
  wire  icache_reset; // @[datapath.scala 880:28]
  wire [31:0] icache_io_cpu_request_addr; // @[datapath.scala 880:28]
  wire [63:0] icache_io_cpu_request_data; // @[datapath.scala 880:28]
  wire [7:0] icache_io_cpu_request_mask; // @[datapath.scala 880:28]
  wire  icache_io_cpu_request_rw; // @[datapath.scala 880:28]
  wire  icache_io_cpu_request_valid; // @[datapath.scala 880:28]
  wire [63:0] icache_io_cpu_response_data; // @[datapath.scala 880:28]
  wire  icache_io_cpu_response_ready; // @[datapath.scala 880:28]
  wire  icache_io_mem_io_aw_ready; // @[datapath.scala 880:28]
  wire  icache_io_mem_io_aw_valid; // @[datapath.scala 880:28]
  wire [31:0] icache_io_mem_io_aw_bits_addr; // @[datapath.scala 880:28]
  wire [7:0] icache_io_mem_io_aw_bits_len; // @[datapath.scala 880:28]
  wire  icache_io_mem_io_w_ready; // @[datapath.scala 880:28]
  wire  icache_io_mem_io_w_valid; // @[datapath.scala 880:28]
  wire [63:0] icache_io_mem_io_w_bits_data; // @[datapath.scala 880:28]
  wire [7:0] icache_io_mem_io_w_bits_strb; // @[datapath.scala 880:28]
  wire  icache_io_mem_io_w_bits_last; // @[datapath.scala 880:28]
  wire  icache_io_mem_io_b_ready; // @[datapath.scala 880:28]
  wire  icache_io_mem_io_b_valid; // @[datapath.scala 880:28]
  wire  icache_io_mem_io_ar_ready; // @[datapath.scala 880:28]
  wire  icache_io_mem_io_ar_valid; // @[datapath.scala 880:28]
  wire [31:0] icache_io_mem_io_ar_bits_addr; // @[datapath.scala 880:28]
  wire [7:0] icache_io_mem_io_ar_bits_len; // @[datapath.scala 880:28]
  wire  icache_io_mem_io_r_ready; // @[datapath.scala 880:28]
  wire  icache_io_mem_io_r_valid; // @[datapath.scala 880:28]
  wire [63:0] icache_io_mem_io_r_bits_data; // @[datapath.scala 880:28]
  wire  icache_io_mem_io_r_bits_last; // @[datapath.scala 880:28]
  wire  dcache_clock; // @[datapath.scala 881:28]
  wire  dcache_reset; // @[datapath.scala 881:28]
  wire [31:0] dcache_io_cpu_request_addr; // @[datapath.scala 881:28]
  wire [63:0] dcache_io_cpu_request_data; // @[datapath.scala 881:28]
  wire [7:0] dcache_io_cpu_request_mask; // @[datapath.scala 881:28]
  wire  dcache_io_cpu_request_rw; // @[datapath.scala 881:28]
  wire  dcache_io_cpu_request_valid; // @[datapath.scala 881:28]
  wire [63:0] dcache_io_cpu_response_data; // @[datapath.scala 881:28]
  wire  dcache_io_cpu_response_ready; // @[datapath.scala 881:28]
  wire  dcache_io_mem_io_aw_ready; // @[datapath.scala 881:28]
  wire  dcache_io_mem_io_aw_valid; // @[datapath.scala 881:28]
  wire [31:0] dcache_io_mem_io_aw_bits_addr; // @[datapath.scala 881:28]
  wire [7:0] dcache_io_mem_io_aw_bits_len; // @[datapath.scala 881:28]
  wire  dcache_io_mem_io_w_ready; // @[datapath.scala 881:28]
  wire  dcache_io_mem_io_w_valid; // @[datapath.scala 881:28]
  wire [63:0] dcache_io_mem_io_w_bits_data; // @[datapath.scala 881:28]
  wire [7:0] dcache_io_mem_io_w_bits_strb; // @[datapath.scala 881:28]
  wire  dcache_io_mem_io_w_bits_last; // @[datapath.scala 881:28]
  wire  dcache_io_mem_io_b_ready; // @[datapath.scala 881:28]
  wire  dcache_io_mem_io_b_valid; // @[datapath.scala 881:28]
  wire  dcache_io_mem_io_ar_ready; // @[datapath.scala 881:28]
  wire  dcache_io_mem_io_ar_valid; // @[datapath.scala 881:28]
  wire [31:0] dcache_io_mem_io_ar_bits_addr; // @[datapath.scala 881:28]
  wire [7:0] dcache_io_mem_io_ar_bits_len; // @[datapath.scala 881:28]
  wire  dcache_io_mem_io_r_ready; // @[datapath.scala 881:28]
  wire  dcache_io_mem_io_r_valid; // @[datapath.scala 881:28]
  wire [63:0] dcache_io_mem_io_r_bits_data; // @[datapath.scala 881:28]
  wire  dcache_io_mem_io_r_bits_last; // @[datapath.scala 881:28]
  wire  arb_clock; // @[datapath.scala 882:25]
  wire  arb_reset; // @[datapath.scala 882:25]
  wire  arb_io_icache_ar_ready; // @[datapath.scala 882:25]
  wire  arb_io_icache_ar_valid; // @[datapath.scala 882:25]
  wire [31:0] arb_io_icache_ar_bits_addr; // @[datapath.scala 882:25]
  wire [7:0] arb_io_icache_ar_bits_len; // @[datapath.scala 882:25]
  wire  arb_io_icache_r_ready; // @[datapath.scala 882:25]
  wire  arb_io_icache_r_valid; // @[datapath.scala 882:25]
  wire [63:0] arb_io_icache_r_bits_data; // @[datapath.scala 882:25]
  wire  arb_io_icache_r_bits_last; // @[datapath.scala 882:25]
  wire  arb_io_dcache_aw_ready; // @[datapath.scala 882:25]
  wire  arb_io_dcache_aw_valid; // @[datapath.scala 882:25]
  wire [31:0] arb_io_dcache_aw_bits_addr; // @[datapath.scala 882:25]
  wire [7:0] arb_io_dcache_aw_bits_len; // @[datapath.scala 882:25]
  wire  arb_io_dcache_w_ready; // @[datapath.scala 882:25]
  wire  arb_io_dcache_w_valid; // @[datapath.scala 882:25]
  wire [63:0] arb_io_dcache_w_bits_data; // @[datapath.scala 882:25]
  wire [7:0] arb_io_dcache_w_bits_strb; // @[datapath.scala 882:25]
  wire  arb_io_dcache_w_bits_last; // @[datapath.scala 882:25]
  wire  arb_io_dcache_b_ready; // @[datapath.scala 882:25]
  wire  arb_io_dcache_b_valid; // @[datapath.scala 882:25]
  wire  arb_io_dcache_ar_ready; // @[datapath.scala 882:25]
  wire  arb_io_dcache_ar_valid; // @[datapath.scala 882:25]
  wire [31:0] arb_io_dcache_ar_bits_addr; // @[datapath.scala 882:25]
  wire [7:0] arb_io_dcache_ar_bits_len; // @[datapath.scala 882:25]
  wire  arb_io_dcache_r_ready; // @[datapath.scala 882:25]
  wire  arb_io_dcache_r_valid; // @[datapath.scala 882:25]
  wire [63:0] arb_io_dcache_r_bits_data; // @[datapath.scala 882:25]
  wire  arb_io_dcache_r_bits_last; // @[datapath.scala 882:25]
  wire  arb_io_axi_out_aw_ready; // @[datapath.scala 882:25]
  wire  arb_io_axi_out_aw_valid; // @[datapath.scala 882:25]
  wire [31:0] arb_io_axi_out_aw_bits_addr; // @[datapath.scala 882:25]
  wire [7:0] arb_io_axi_out_aw_bits_len; // @[datapath.scala 882:25]
  wire  arb_io_axi_out_w_ready; // @[datapath.scala 882:25]
  wire  arb_io_axi_out_w_valid; // @[datapath.scala 882:25]
  wire [63:0] arb_io_axi_out_w_bits_data; // @[datapath.scala 882:25]
  wire [7:0] arb_io_axi_out_w_bits_strb; // @[datapath.scala 882:25]
  wire  arb_io_axi_out_w_bits_last; // @[datapath.scala 882:25]
  wire  arb_io_axi_out_b_ready; // @[datapath.scala 882:25]
  wire  arb_io_axi_out_b_valid; // @[datapath.scala 882:25]
  wire  arb_io_axi_out_ar_ready; // @[datapath.scala 882:25]
  wire  arb_io_axi_out_ar_valid; // @[datapath.scala 882:25]
  wire [31:0] arb_io_axi_out_ar_bits_addr; // @[datapath.scala 882:25]
  wire [7:0] arb_io_axi_out_ar_bits_len; // @[datapath.scala 882:25]
  wire  arb_io_axi_out_r_ready; // @[datapath.scala 882:25]
  wire  arb_io_axi_out_r_valid; // @[datapath.scala 882:25]
  wire [63:0] arb_io_axi_out_r_bits_data; // @[datapath.scala 882:25]
  wire  arb_io_axi_out_r_bits_last; // @[datapath.scala 882:25]
  Datapath datapath ( // @[datapath.scala 878:30]
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
    .io_start(datapath_io_start),
    .io_stall(datapath_io_stall),
    .io_icache_cpu_request_addr(datapath_io_icache_cpu_request_addr),
    .io_icache_cpu_response_data(datapath_io_icache_cpu_response_data),
    .io_icache_cpu_response_ready(datapath_io_icache_cpu_response_ready),
    .io_dcache_cpu_request_addr(datapath_io_dcache_cpu_request_addr),
    .io_dcache_cpu_request_data(datapath_io_dcache_cpu_request_data),
    .io_dcache_cpu_request_mask(datapath_io_dcache_cpu_request_mask),
    .io_dcache_cpu_request_rw(datapath_io_dcache_cpu_request_rw),
    .io_dcache_cpu_request_valid(datapath_io_dcache_cpu_request_valid),
    .io_dcache_cpu_response_data(datapath_io_dcache_cpu_response_data),
    .io_dcache_cpu_response_ready(datapath_io_dcache_cpu_response_ready)
  );
  Control control ( // @[datapath.scala 879:29]
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
  Cache icache ( // @[datapath.scala 880:28]
    .clock(icache_clock),
    .reset(icache_reset),
    .io_cpu_request_addr(icache_io_cpu_request_addr),
    .io_cpu_request_data(icache_io_cpu_request_data),
    .io_cpu_request_mask(icache_io_cpu_request_mask),
    .io_cpu_request_rw(icache_io_cpu_request_rw),
    .io_cpu_request_valid(icache_io_cpu_request_valid),
    .io_cpu_response_data(icache_io_cpu_response_data),
    .io_cpu_response_ready(icache_io_cpu_response_ready),
    .io_mem_io_aw_ready(icache_io_mem_io_aw_ready),
    .io_mem_io_aw_valid(icache_io_mem_io_aw_valid),
    .io_mem_io_aw_bits_addr(icache_io_mem_io_aw_bits_addr),
    .io_mem_io_aw_bits_len(icache_io_mem_io_aw_bits_len),
    .io_mem_io_w_ready(icache_io_mem_io_w_ready),
    .io_mem_io_w_valid(icache_io_mem_io_w_valid),
    .io_mem_io_w_bits_data(icache_io_mem_io_w_bits_data),
    .io_mem_io_w_bits_strb(icache_io_mem_io_w_bits_strb),
    .io_mem_io_w_bits_last(icache_io_mem_io_w_bits_last),
    .io_mem_io_b_ready(icache_io_mem_io_b_ready),
    .io_mem_io_b_valid(icache_io_mem_io_b_valid),
    .io_mem_io_ar_ready(icache_io_mem_io_ar_ready),
    .io_mem_io_ar_valid(icache_io_mem_io_ar_valid),
    .io_mem_io_ar_bits_addr(icache_io_mem_io_ar_bits_addr),
    .io_mem_io_ar_bits_len(icache_io_mem_io_ar_bits_len),
    .io_mem_io_r_ready(icache_io_mem_io_r_ready),
    .io_mem_io_r_valid(icache_io_mem_io_r_valid),
    .io_mem_io_r_bits_data(icache_io_mem_io_r_bits_data),
    .io_mem_io_r_bits_last(icache_io_mem_io_r_bits_last)
  );
  Cache dcache ( // @[datapath.scala 881:28]
    .clock(dcache_clock),
    .reset(dcache_reset),
    .io_cpu_request_addr(dcache_io_cpu_request_addr),
    .io_cpu_request_data(dcache_io_cpu_request_data),
    .io_cpu_request_mask(dcache_io_cpu_request_mask),
    .io_cpu_request_rw(dcache_io_cpu_request_rw),
    .io_cpu_request_valid(dcache_io_cpu_request_valid),
    .io_cpu_response_data(dcache_io_cpu_response_data),
    .io_cpu_response_ready(dcache_io_cpu_response_ready),
    .io_mem_io_aw_ready(dcache_io_mem_io_aw_ready),
    .io_mem_io_aw_valid(dcache_io_mem_io_aw_valid),
    .io_mem_io_aw_bits_addr(dcache_io_mem_io_aw_bits_addr),
    .io_mem_io_aw_bits_len(dcache_io_mem_io_aw_bits_len),
    .io_mem_io_w_ready(dcache_io_mem_io_w_ready),
    .io_mem_io_w_valid(dcache_io_mem_io_w_valid),
    .io_mem_io_w_bits_data(dcache_io_mem_io_w_bits_data),
    .io_mem_io_w_bits_strb(dcache_io_mem_io_w_bits_strb),
    .io_mem_io_w_bits_last(dcache_io_mem_io_w_bits_last),
    .io_mem_io_b_ready(dcache_io_mem_io_b_ready),
    .io_mem_io_b_valid(dcache_io_mem_io_b_valid),
    .io_mem_io_ar_ready(dcache_io_mem_io_ar_ready),
    .io_mem_io_ar_valid(dcache_io_mem_io_ar_valid),
    .io_mem_io_ar_bits_addr(dcache_io_mem_io_ar_bits_addr),
    .io_mem_io_ar_bits_len(dcache_io_mem_io_ar_bits_len),
    .io_mem_io_r_ready(dcache_io_mem_io_r_ready),
    .io_mem_io_r_valid(dcache_io_mem_io_r_valid),
    .io_mem_io_r_bits_data(dcache_io_mem_io_r_bits_data),
    .io_mem_io_r_bits_last(dcache_io_mem_io_r_bits_last)
  );
  CacheArbiter arb ( // @[datapath.scala 882:25]
    .clock(arb_clock),
    .reset(arb_reset),
    .io_icache_ar_ready(arb_io_icache_ar_ready),
    .io_icache_ar_valid(arb_io_icache_ar_valid),
    .io_icache_ar_bits_addr(arb_io_icache_ar_bits_addr),
    .io_icache_ar_bits_len(arb_io_icache_ar_bits_len),
    .io_icache_r_ready(arb_io_icache_r_ready),
    .io_icache_r_valid(arb_io_icache_r_valid),
    .io_icache_r_bits_data(arb_io_icache_r_bits_data),
    .io_icache_r_bits_last(arb_io_icache_r_bits_last),
    .io_dcache_aw_ready(arb_io_dcache_aw_ready),
    .io_dcache_aw_valid(arb_io_dcache_aw_valid),
    .io_dcache_aw_bits_addr(arb_io_dcache_aw_bits_addr),
    .io_dcache_aw_bits_len(arb_io_dcache_aw_bits_len),
    .io_dcache_w_ready(arb_io_dcache_w_ready),
    .io_dcache_w_valid(arb_io_dcache_w_valid),
    .io_dcache_w_bits_data(arb_io_dcache_w_bits_data),
    .io_dcache_w_bits_strb(arb_io_dcache_w_bits_strb),
    .io_dcache_w_bits_last(arb_io_dcache_w_bits_last),
    .io_dcache_b_ready(arb_io_dcache_b_ready),
    .io_dcache_b_valid(arb_io_dcache_b_valid),
    .io_dcache_ar_ready(arb_io_dcache_ar_ready),
    .io_dcache_ar_valid(arb_io_dcache_ar_valid),
    .io_dcache_ar_bits_addr(arb_io_dcache_ar_bits_addr),
    .io_dcache_ar_bits_len(arb_io_dcache_ar_bits_len),
    .io_dcache_r_ready(arb_io_dcache_r_ready),
    .io_dcache_r_valid(arb_io_dcache_r_valid),
    .io_dcache_r_bits_data(arb_io_dcache_r_bits_data),
    .io_dcache_r_bits_last(arb_io_dcache_r_bits_last),
    .io_axi_out_aw_ready(arb_io_axi_out_aw_ready),
    .io_axi_out_aw_valid(arb_io_axi_out_aw_valid),
    .io_axi_out_aw_bits_addr(arb_io_axi_out_aw_bits_addr),
    .io_axi_out_aw_bits_len(arb_io_axi_out_aw_bits_len),
    .io_axi_out_w_ready(arb_io_axi_out_w_ready),
    .io_axi_out_w_valid(arb_io_axi_out_w_valid),
    .io_axi_out_w_bits_data(arb_io_axi_out_w_bits_data),
    .io_axi_out_w_bits_strb(arb_io_axi_out_w_bits_strb),
    .io_axi_out_w_bits_last(arb_io_axi_out_w_bits_last),
    .io_axi_out_b_ready(arb_io_axi_out_b_ready),
    .io_axi_out_b_valid(arb_io_axi_out_b_valid),
    .io_axi_out_ar_ready(arb_io_axi_out_ar_ready),
    .io_axi_out_ar_valid(arb_io_axi_out_ar_valid),
    .io_axi_out_ar_bits_addr(arb_io_axi_out_ar_bits_addr),
    .io_axi_out_ar_bits_len(arb_io_axi_out_ar_bits_len),
    .io_axi_out_r_ready(arb_io_axi_out_r_ready),
    .io_axi_out_r_valid(arb_io_axi_out_r_valid),
    .io_axi_out_r_bits_data(arb_io_axi_out_r_bits_data),
    .io_axi_out_r_bits_last(arb_io_axi_out_r_bits_last)
  );
  assign io_pc_debug = datapath_io_pc; // @[datapath.scala 926:21]
  assign io_inst = datapath_io_inst; // @[datapath.scala 925:17]
  assign io_start = datapath_io_start; // @[datapath.scala 927:18]
  assign io_stall = datapath_io_stall; // @[datapath.scala 928:18]
  assign io_master_awvalid = arb_io_axi_out_aw_valid; // @[datapath.scala 892:27]
  assign io_master_awaddr = arb_io_axi_out_aw_bits_addr; // @[datapath.scala 893:26]
  assign io_master_awid = 4'h0; // @[datapath.scala 894:24]
  assign io_master_awlen = arb_io_axi_out_aw_bits_len; // @[datapath.scala 895:25]
  assign io_master_awsize = 3'h6; // @[datapath.scala 896:26]
  assign io_master_awburst = 2'h1; // @[datapath.scala 897:27]
  assign io_master_wvalid = arb_io_axi_out_w_valid; // @[datapath.scala 900:26]
  assign io_master_wdata = arb_io_axi_out_w_bits_data; // @[datapath.scala 901:25]
  assign io_master_wstrb = arb_io_axi_out_w_bits_strb; // @[datapath.scala 902:25]
  assign io_master_wlast = arb_io_axi_out_w_bits_last; // @[datapath.scala 903:25]
  assign io_master_bready = arb_io_axi_out_b_ready; // @[datapath.scala 905:26]
  assign io_master_arvalid = arb_io_axi_out_ar_valid; // @[datapath.scala 911:27]
  assign io_master_araddr = arb_io_axi_out_ar_bits_addr; // @[datapath.scala 912:26]
  assign io_master_arid = 4'h0; // @[datapath.scala 913:24]
  assign io_master_arlen = arb_io_axi_out_ar_bits_len; // @[datapath.scala 914:25]
  assign io_master_arsize = 3'h6; // @[datapath.scala 915:26]
  assign io_master_arburst = 2'h1; // @[datapath.scala 916:27]
  assign io_master_rready = arb_io_axi_out_r_ready; // @[datapath.scala 918:26]
  assign datapath_clock = clock;
  assign datapath_reset = reset;
  assign datapath_io_ctrl_pc_sel = control_io_pc_sel; // @[datapath.scala 883:26]
  assign datapath_io_ctrl_A_sel = control_io_A_sel; // @[datapath.scala 883:26]
  assign datapath_io_ctrl_B_sel = control_io_B_sel; // @[datapath.scala 883:26]
  assign datapath_io_ctrl_wd_type = control_io_wd_type; // @[datapath.scala 883:26]
  assign datapath_io_ctrl_imm_sel = control_io_imm_sel; // @[datapath.scala 883:26]
  assign datapath_io_ctrl_br_type = control_io_br_type; // @[datapath.scala 883:26]
  assign datapath_io_ctrl_st_type = control_io_st_type; // @[datapath.scala 883:26]
  assign datapath_io_ctrl_ld_type = control_io_ld_type; // @[datapath.scala 883:26]
  assign datapath_io_ctrl_wb_sel = control_io_wb_sel; // @[datapath.scala 883:26]
  assign datapath_io_ctrl_wb_en = control_io_wb_en; // @[datapath.scala 883:26]
  assign datapath_io_ctrl_alu_op = control_io_alu_op; // @[datapath.scala 883:26]
  assign datapath_io_ctrl_prv = control_io_prv; // @[datapath.scala 883:26]
  assign datapath_io_ctrl_csr_cmd = control_io_csr_cmd; // @[datapath.scala 883:26]
  assign datapath_io_ctrl_is_illegal = control_io_is_illegal; // @[datapath.scala 883:26]
  assign datapath_io_ctrl_is_kill = control_io_is_kill; // @[datapath.scala 883:26]
  assign datapath_io_icache_cpu_response_data = icache_io_cpu_response_data; // @[datapath.scala 886:41]
  assign datapath_io_icache_cpu_response_ready = icache_io_cpu_response_ready; // @[datapath.scala 886:41]
  assign datapath_io_dcache_cpu_response_data = dcache_io_cpu_response_data; // @[datapath.scala 887:41]
  assign datapath_io_dcache_cpu_response_ready = dcache_io_cpu_response_ready; // @[datapath.scala 887:41]
  assign control_io_inst = datapath_io_ctrl_inst; // @[datapath.scala 883:26]
  assign icache_clock = clock;
  assign icache_reset = reset;
  assign icache_io_cpu_request_addr = datapath_io_icache_cpu_request_addr; // @[datapath.scala 884:40]
  assign icache_io_cpu_request_data = 64'h0; // @[datapath.scala 884:40]
  assign icache_io_cpu_request_mask = 8'h0; // @[datapath.scala 884:40]
  assign icache_io_cpu_request_rw = 1'h0; // @[datapath.scala 884:40]
  assign icache_io_cpu_request_valid = 1'h1; // @[datapath.scala 884:40]
  assign icache_io_mem_io_aw_ready = 1'h0; // @[datapath.scala 888:26]
  assign icache_io_mem_io_w_ready = 1'h0; // @[datapath.scala 888:26]
  assign icache_io_mem_io_b_valid = 1'h0; // @[datapath.scala 888:26]
  assign icache_io_mem_io_ar_ready = arb_io_icache_ar_ready; // @[datapath.scala 888:26]
  assign icache_io_mem_io_r_valid = arb_io_icache_r_valid; // @[datapath.scala 888:26]
  assign icache_io_mem_io_r_bits_data = arb_io_icache_r_bits_data; // @[datapath.scala 888:26]
  assign icache_io_mem_io_r_bits_last = arb_io_icache_r_bits_last; // @[datapath.scala 888:26]
  assign dcache_clock = clock;
  assign dcache_reset = reset;
  assign dcache_io_cpu_request_addr = datapath_io_dcache_cpu_request_addr; // @[datapath.scala 885:40]
  assign dcache_io_cpu_request_data = datapath_io_dcache_cpu_request_data; // @[datapath.scala 885:40]
  assign dcache_io_cpu_request_mask = datapath_io_dcache_cpu_request_mask; // @[datapath.scala 885:40]
  assign dcache_io_cpu_request_rw = datapath_io_dcache_cpu_request_rw; // @[datapath.scala 885:40]
  assign dcache_io_cpu_request_valid = datapath_io_dcache_cpu_request_valid; // @[datapath.scala 885:40]
  assign dcache_io_mem_io_aw_ready = arb_io_dcache_aw_ready; // @[datapath.scala 889:26]
  assign dcache_io_mem_io_w_ready = arb_io_dcache_w_ready; // @[datapath.scala 889:26]
  assign dcache_io_mem_io_b_valid = arb_io_dcache_b_valid; // @[datapath.scala 889:26]
  assign dcache_io_mem_io_ar_ready = arb_io_dcache_ar_ready; // @[datapath.scala 889:26]
  assign dcache_io_mem_io_r_valid = arb_io_dcache_r_valid; // @[datapath.scala 889:26]
  assign dcache_io_mem_io_r_bits_data = arb_io_dcache_r_bits_data; // @[datapath.scala 889:26]
  assign dcache_io_mem_io_r_bits_last = arb_io_dcache_r_bits_last; // @[datapath.scala 889:26]
  assign arb_clock = clock;
  assign arb_reset = reset;
  assign arb_io_icache_ar_valid = icache_io_mem_io_ar_valid; // @[datapath.scala 888:26]
  assign arb_io_icache_ar_bits_addr = icache_io_mem_io_ar_bits_addr; // @[datapath.scala 888:26]
  assign arb_io_icache_ar_bits_len = icache_io_mem_io_ar_bits_len; // @[datapath.scala 888:26]
  assign arb_io_icache_r_ready = icache_io_mem_io_r_ready; // @[datapath.scala 888:26]
  assign arb_io_dcache_aw_valid = dcache_io_mem_io_aw_valid; // @[datapath.scala 889:26]
  assign arb_io_dcache_aw_bits_addr = dcache_io_mem_io_aw_bits_addr; // @[datapath.scala 889:26]
  assign arb_io_dcache_aw_bits_len = dcache_io_mem_io_aw_bits_len; // @[datapath.scala 889:26]
  assign arb_io_dcache_w_valid = dcache_io_mem_io_w_valid; // @[datapath.scala 889:26]
  assign arb_io_dcache_w_bits_data = dcache_io_mem_io_w_bits_data; // @[datapath.scala 889:26]
  assign arb_io_dcache_w_bits_strb = dcache_io_mem_io_w_bits_strb; // @[datapath.scala 889:26]
  assign arb_io_dcache_w_bits_last = dcache_io_mem_io_w_bits_last; // @[datapath.scala 889:26]
  assign arb_io_dcache_b_ready = dcache_io_mem_io_b_ready; // @[datapath.scala 889:26]
  assign arb_io_dcache_ar_valid = dcache_io_mem_io_ar_valid; // @[datapath.scala 889:26]
  assign arb_io_dcache_ar_bits_addr = dcache_io_mem_io_ar_bits_addr; // @[datapath.scala 889:26]
  assign arb_io_dcache_ar_bits_len = dcache_io_mem_io_ar_bits_len; // @[datapath.scala 889:26]
  assign arb_io_dcache_r_ready = dcache_io_mem_io_r_ready; // @[datapath.scala 889:26]
  assign arb_io_axi_out_aw_ready = io_master_awready; // @[datapath.scala 891:33]
  assign arb_io_axi_out_w_ready = io_master_wready; // @[datapath.scala 899:32]
  assign arb_io_axi_out_b_valid = io_master_bvalid; // @[datapath.scala 906:32]
  assign arb_io_axi_out_ar_ready = io_master_arready; // @[datapath.scala 910:33]
  assign arb_io_axi_out_r_valid = io_master_rvalid; // @[datapath.scala 919:32]
  assign arb_io_axi_out_r_bits_data = io_master_rdata; // @[datapath.scala 921:36]
  assign arb_io_axi_out_r_bits_last = io_master_rlast; // @[datapath.scala 922:36]
endmodule

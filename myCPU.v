module AluSimple(
  input  [63:0] io_A,
  input  [63:0] io_B,
  input  [1:0]  io_width_type,
  input  [3:0]  io_alu_op,
  output [63:0] io_out
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
  wire [63:0] out = _out_T_88[63:0];
  wire [31:0] _io_out_T_3 = out[31] ? 32'hffffffff : 32'h0; // @[Bitwise.scala 74:12]
  wire [63:0] _io_out_T_5 = {_io_out_T_3,out[31:0]}; // @[Cat.scala 31:58]
  assign io_out = _shamt_T ? _io_out_T_5 : out; // @[alu.scala 76:22]
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
  output [3:0]  io_alu_op
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
  wire  _ctrlSignals_T_119 = 32'h100073 == io_inst; // @[Lookup.scala 31:38]
  wire [1:0] _ctrlSignals_T_176 = _ctrlSignals_T_7 ? 2'h1 : 2'h0; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_177 = _ctrlSignals_T_5 ? 2'h1 : _ctrlSignals_T_176; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_178 = _ctrlSignals_T_3 ? 2'h0 : _ctrlSignals_T_177; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_210 = _ctrlSignals_T_57 | (_ctrlSignals_T_59 | (_ctrlSignals_T_61 | (_ctrlSignals_T_63 | (
    _ctrlSignals_T_65 | (_ctrlSignals_T_67 | (_ctrlSignals_T_69 | (_ctrlSignals_T_71 | (_ctrlSignals_T_73 | (
    _ctrlSignals_T_75 | (_ctrlSignals_T_77 | (_ctrlSignals_T_79 | (_ctrlSignals_T_81 | (_ctrlSignals_T_83 | (
    _ctrlSignals_T_85 | (_ctrlSignals_T_87 | (_ctrlSignals_T_89 | (_ctrlSignals_T_91 | (_ctrlSignals_T_93 | (
    _ctrlSignals_T_95 | (_ctrlSignals_T_97 | (_ctrlSignals_T_99 | (_ctrlSignals_T_101 | (_ctrlSignals_T_103 | (
    _ctrlSignals_T_105 | (_ctrlSignals_T_107 | (_ctrlSignals_T_109 | (_ctrlSignals_T_111 | (_ctrlSignals_T_113 | (
    _ctrlSignals_T_115 | _ctrlSignals_T_117))))))))))))))))))))))))))))); // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_229 = _ctrlSignals_T_19 ? 1'h0 : _ctrlSignals_T_21 | (_ctrlSignals_T_23 | (_ctrlSignals_T_25 | (
    _ctrlSignals_T_27 | (_ctrlSignals_T_29 | (_ctrlSignals_T_31 | (_ctrlSignals_T_33 | (_ctrlSignals_T_35 | (
    _ctrlSignals_T_37 | (_ctrlSignals_T_39 | (_ctrlSignals_T_41 | (_ctrlSignals_T_43 | (_ctrlSignals_T_45 | (
    _ctrlSignals_T_47 | (_ctrlSignals_T_49 | (_ctrlSignals_T_51 | (_ctrlSignals_T_53 | (_ctrlSignals_T_55 |
    _ctrlSignals_T_210))))))))))))))))); // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_230 = _ctrlSignals_T_17 ? 1'h0 : _ctrlSignals_T_229; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_231 = _ctrlSignals_T_15 ? 1'h0 : _ctrlSignals_T_230; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_232 = _ctrlSignals_T_13 ? 1'h0 : _ctrlSignals_T_231; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_233 = _ctrlSignals_T_11 ? 1'h0 : _ctrlSignals_T_232; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_234 = _ctrlSignals_T_9 ? 1'h0 : _ctrlSignals_T_233; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_236 = _ctrlSignals_T_5 ? 1'h0 : _ctrlSignals_T_7 | _ctrlSignals_T_234; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_237 = _ctrlSignals_T_3 ? 1'h0 : _ctrlSignals_T_236; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_264 = _ctrlSignals_T_67 ? 1'h0 : _ctrlSignals_T_69 | (_ctrlSignals_T_71 | (_ctrlSignals_T_73 | (
    _ctrlSignals_T_75 | (_ctrlSignals_T_77 | (_ctrlSignals_T_79 | (_ctrlSignals_T_81 | (_ctrlSignals_T_83 | (
    _ctrlSignals_T_85 | (_ctrlSignals_T_87 | (_ctrlSignals_T_89 | (_ctrlSignals_T_91 | (_ctrlSignals_T_93 | (
    _ctrlSignals_T_95 | (_ctrlSignals_T_97 | (_ctrlSignals_T_99 | (_ctrlSignals_T_101 | (_ctrlSignals_T_103 | (
    _ctrlSignals_T_105 | (_ctrlSignals_T_107 | (_ctrlSignals_T_109 | (_ctrlSignals_T_111 | (_ctrlSignals_T_113 | (
    _ctrlSignals_T_115 | _ctrlSignals_T_117))))))))))))))))))))))); // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_265 = _ctrlSignals_T_65 ? 1'h0 : _ctrlSignals_T_264; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_266 = _ctrlSignals_T_63 ? 1'h0 : _ctrlSignals_T_265; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_267 = _ctrlSignals_T_61 ? 1'h0 : _ctrlSignals_T_266; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_268 = _ctrlSignals_T_59 ? 1'h0 : _ctrlSignals_T_267; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_269 = _ctrlSignals_T_57 ? 1'h0 : _ctrlSignals_T_268; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_270 = _ctrlSignals_T_55 ? 1'h0 : _ctrlSignals_T_269; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_271 = _ctrlSignals_T_53 ? 1'h0 : _ctrlSignals_T_270; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_272 = _ctrlSignals_T_51 ? 1'h0 : _ctrlSignals_T_271; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_273 = _ctrlSignals_T_49 ? 1'h0 : _ctrlSignals_T_272; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_274 = _ctrlSignals_T_47 ? 1'h0 : _ctrlSignals_T_273; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_275 = _ctrlSignals_T_45 ? 1'h0 : _ctrlSignals_T_274; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_276 = _ctrlSignals_T_43 ? 1'h0 : _ctrlSignals_T_275; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_277 = _ctrlSignals_T_41 ? 1'h0 : _ctrlSignals_T_276; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_278 = _ctrlSignals_T_39 ? 1'h0 : _ctrlSignals_T_277; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_279 = _ctrlSignals_T_37 ? 1'h0 : _ctrlSignals_T_278; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_280 = _ctrlSignals_T_35 ? 1'h0 : _ctrlSignals_T_279; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_281 = _ctrlSignals_T_33 ? 1'h0 : _ctrlSignals_T_280; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_282 = _ctrlSignals_T_31 ? 1'h0 : _ctrlSignals_T_281; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_283 = _ctrlSignals_T_29 ? 1'h0 : _ctrlSignals_T_282; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_284 = _ctrlSignals_T_27 ? 1'h0 : _ctrlSignals_T_283; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_285 = _ctrlSignals_T_25 ? 1'h0 : _ctrlSignals_T_284; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_286 = _ctrlSignals_T_23 ? 1'h0 : _ctrlSignals_T_285; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_287 = _ctrlSignals_T_21 ? 1'h0 : _ctrlSignals_T_286; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_288 = _ctrlSignals_T_19 ? 1'h0 : _ctrlSignals_T_287; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_289 = _ctrlSignals_T_17 ? 1'h0 : _ctrlSignals_T_288; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_290 = _ctrlSignals_T_15 ? 1'h0 : _ctrlSignals_T_289; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_291 = _ctrlSignals_T_13 ? 1'h0 : _ctrlSignals_T_290; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_292 = _ctrlSignals_T_11 ? 1'h0 : _ctrlSignals_T_291; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_293 = _ctrlSignals_T_9 ? 1'h0 : _ctrlSignals_T_292; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_294 = _ctrlSignals_T_7 ? 1'h0 : _ctrlSignals_T_293; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_295 = _ctrlSignals_T_5 ? 1'h0 : _ctrlSignals_T_294; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_296 = _ctrlSignals_T_3 ? 1'h0 : _ctrlSignals_T_295; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_298 = _ctrlSignals_T_117 ? 2'h1 : 2'h0; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_299 = _ctrlSignals_T_115 ? 2'h1 : _ctrlSignals_T_298; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_300 = _ctrlSignals_T_113 ? 2'h0 : _ctrlSignals_T_299; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_301 = _ctrlSignals_T_111 ? 2'h0 : _ctrlSignals_T_300; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_302 = _ctrlSignals_T_109 ? 2'h1 : _ctrlSignals_T_301; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_303 = _ctrlSignals_T_107 ? 2'h1 : _ctrlSignals_T_302; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_304 = _ctrlSignals_T_105 ? 2'h0 : _ctrlSignals_T_303; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_305 = _ctrlSignals_T_103 ? 2'h0 : _ctrlSignals_T_304; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_306 = _ctrlSignals_T_101 ? 2'h1 : _ctrlSignals_T_305; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_307 = _ctrlSignals_T_99 ? 2'h0 : _ctrlSignals_T_306; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_308 = _ctrlSignals_T_97 ? 2'h0 : _ctrlSignals_T_307; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_309 = _ctrlSignals_T_95 ? 2'h0 : _ctrlSignals_T_308; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_310 = _ctrlSignals_T_93 ? 2'h1 : _ctrlSignals_T_309; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_311 = _ctrlSignals_T_91 ? 2'h0 : _ctrlSignals_T_310; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_312 = _ctrlSignals_T_89 ? 2'h1 : _ctrlSignals_T_311; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_313 = _ctrlSignals_T_87 ? 2'h0 : _ctrlSignals_T_312; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_314 = _ctrlSignals_T_85 ? 2'h0 : _ctrlSignals_T_313; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_315 = _ctrlSignals_T_83 ? 2'h0 : _ctrlSignals_T_314; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_316 = _ctrlSignals_T_81 ? 2'h0 : _ctrlSignals_T_315; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_317 = _ctrlSignals_T_79 ? 2'h1 : _ctrlSignals_T_316; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_318 = _ctrlSignals_T_77 ? 2'h0 : _ctrlSignals_T_317; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_319 = _ctrlSignals_T_75 ? 2'h1 : _ctrlSignals_T_318; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_320 = _ctrlSignals_T_73 ? 2'h0 : _ctrlSignals_T_319; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_321 = _ctrlSignals_T_71 ? 2'h1 : _ctrlSignals_T_320; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_322 = _ctrlSignals_T_69 ? 2'h0 : _ctrlSignals_T_321; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_323 = _ctrlSignals_T_67 ? 2'h1 : _ctrlSignals_T_322; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_324 = _ctrlSignals_T_65 ? 2'h0 : _ctrlSignals_T_323; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_325 = _ctrlSignals_T_63 ? 2'h1 : _ctrlSignals_T_324; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_326 = _ctrlSignals_T_61 ? 2'h0 : _ctrlSignals_T_325; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_327 = _ctrlSignals_T_59 ? 2'h1 : _ctrlSignals_T_326; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_328 = _ctrlSignals_T_57 ? 2'h0 : _ctrlSignals_T_327; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_329 = _ctrlSignals_T_55 ? 2'h0 : _ctrlSignals_T_328; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_330 = _ctrlSignals_T_53 ? 2'h0 : _ctrlSignals_T_329; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_331 = _ctrlSignals_T_51 ? 2'h0 : _ctrlSignals_T_330; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_332 = _ctrlSignals_T_49 ? 2'h0 : _ctrlSignals_T_331; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_333 = _ctrlSignals_T_47 ? 2'h0 : _ctrlSignals_T_332; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_334 = _ctrlSignals_T_45 ? 2'h1 : _ctrlSignals_T_333; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_335 = _ctrlSignals_T_43 ? 2'h0 : _ctrlSignals_T_334; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_336 = _ctrlSignals_T_41 ? 2'h0 : _ctrlSignals_T_335; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_337 = _ctrlSignals_T_39 ? 2'h0 : _ctrlSignals_T_336; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_338 = _ctrlSignals_T_37 ? 2'h0 : _ctrlSignals_T_337; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_339 = _ctrlSignals_T_35 ? 2'h0 : _ctrlSignals_T_338; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_340 = _ctrlSignals_T_33 ? 2'h0 : _ctrlSignals_T_339; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_341 = _ctrlSignals_T_31 ? 2'h0 : _ctrlSignals_T_340; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_342 = _ctrlSignals_T_29 ? 2'h0 : _ctrlSignals_T_341; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_343 = _ctrlSignals_T_27 ? 2'h0 : _ctrlSignals_T_342; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_344 = _ctrlSignals_T_25 ? 2'h0 : _ctrlSignals_T_343; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_345 = _ctrlSignals_T_23 ? 2'h0 : _ctrlSignals_T_344; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_346 = _ctrlSignals_T_21 ? 2'h0 : _ctrlSignals_T_345; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_347 = _ctrlSignals_T_19 ? 2'h0 : _ctrlSignals_T_346; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_348 = _ctrlSignals_T_17 ? 2'h0 : _ctrlSignals_T_347; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_349 = _ctrlSignals_T_15 ? 2'h0 : _ctrlSignals_T_348; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_350 = _ctrlSignals_T_13 ? 2'h0 : _ctrlSignals_T_349; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_351 = _ctrlSignals_T_11 ? 2'h0 : _ctrlSignals_T_350; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_352 = _ctrlSignals_T_9 ? 2'h0 : _ctrlSignals_T_351; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_353 = _ctrlSignals_T_7 ? 2'h0 : _ctrlSignals_T_352; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_354 = _ctrlSignals_T_5 ? 2'h0 : _ctrlSignals_T_353; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_355 = _ctrlSignals_T_3 ? 2'h0 : _ctrlSignals_T_354; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_356 = _ctrlSignals_T_119 ? 3'h0 : 3'h3; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_357 = _ctrlSignals_T_117 ? 3'h0 : _ctrlSignals_T_356; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_358 = _ctrlSignals_T_115 ? 3'h0 : _ctrlSignals_T_357; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_359 = _ctrlSignals_T_113 ? 3'h0 : _ctrlSignals_T_358; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_360 = _ctrlSignals_T_111 ? 3'h0 : _ctrlSignals_T_359; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_361 = _ctrlSignals_T_109 ? 3'h0 : _ctrlSignals_T_360; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_362 = _ctrlSignals_T_107 ? 3'h0 : _ctrlSignals_T_361; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_363 = _ctrlSignals_T_105 ? 3'h0 : _ctrlSignals_T_362; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_364 = _ctrlSignals_T_103 ? 3'h0 : _ctrlSignals_T_363; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_365 = _ctrlSignals_T_101 ? 3'h0 : _ctrlSignals_T_364; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_366 = _ctrlSignals_T_99 ? 3'h0 : _ctrlSignals_T_365; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_367 = _ctrlSignals_T_97 ? 3'h0 : _ctrlSignals_T_366; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_368 = _ctrlSignals_T_95 ? 3'h0 : _ctrlSignals_T_367; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_369 = _ctrlSignals_T_93 ? 3'h0 : _ctrlSignals_T_368; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_370 = _ctrlSignals_T_91 ? 3'h0 : _ctrlSignals_T_369; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_371 = _ctrlSignals_T_89 ? 3'h0 : _ctrlSignals_T_370; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_372 = _ctrlSignals_T_87 ? 3'h0 : _ctrlSignals_T_371; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_373 = _ctrlSignals_T_85 ? 3'h0 : _ctrlSignals_T_372; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_374 = _ctrlSignals_T_83 ? 3'h0 : _ctrlSignals_T_373; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_375 = _ctrlSignals_T_81 ? 3'h0 : _ctrlSignals_T_374; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_376 = _ctrlSignals_T_79 ? 3'h0 : _ctrlSignals_T_375; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_377 = _ctrlSignals_T_77 ? 3'h0 : _ctrlSignals_T_376; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_378 = _ctrlSignals_T_75 ? 3'h0 : _ctrlSignals_T_377; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_379 = _ctrlSignals_T_73 ? 3'h0 : _ctrlSignals_T_378; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_380 = _ctrlSignals_T_71 ? 3'h0 : _ctrlSignals_T_379; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_381 = _ctrlSignals_T_69 ? 3'h0 : _ctrlSignals_T_380; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_382 = _ctrlSignals_T_67 ? 3'h1 : _ctrlSignals_T_381; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_383 = _ctrlSignals_T_65 ? 3'h1 : _ctrlSignals_T_382; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_384 = _ctrlSignals_T_63 ? 3'h1 : _ctrlSignals_T_383; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_385 = _ctrlSignals_T_61 ? 3'h1 : _ctrlSignals_T_384; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_386 = _ctrlSignals_T_59 ? 3'h1 : _ctrlSignals_T_385; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_387 = _ctrlSignals_T_57 ? 3'h1 : _ctrlSignals_T_386; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_388 = _ctrlSignals_T_55 ? 3'h1 : _ctrlSignals_T_387; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_389 = _ctrlSignals_T_53 ? 3'h1 : _ctrlSignals_T_388; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_390 = _ctrlSignals_T_51 ? 3'h1 : _ctrlSignals_T_389; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_391 = _ctrlSignals_T_49 ? 3'h1 : _ctrlSignals_T_390; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_392 = _ctrlSignals_T_47 ? 3'h1 : _ctrlSignals_T_391; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_393 = _ctrlSignals_T_45 ? 3'h1 : _ctrlSignals_T_392; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_394 = _ctrlSignals_T_43 ? 3'h1 : _ctrlSignals_T_393; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_395 = _ctrlSignals_T_41 ? 3'h2 : _ctrlSignals_T_394; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_396 = _ctrlSignals_T_39 ? 3'h2 : _ctrlSignals_T_395; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_397 = _ctrlSignals_T_37 ? 3'h2 : _ctrlSignals_T_396; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_398 = _ctrlSignals_T_35 ? 3'h2 : _ctrlSignals_T_397; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_399 = _ctrlSignals_T_33 ? 3'h1 : _ctrlSignals_T_398; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_400 = _ctrlSignals_T_31 ? 3'h1 : _ctrlSignals_T_399; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_401 = _ctrlSignals_T_29 ? 3'h1 : _ctrlSignals_T_400; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_402 = _ctrlSignals_T_27 ? 3'h1 : _ctrlSignals_T_401; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_403 = _ctrlSignals_T_25 ? 3'h1 : _ctrlSignals_T_402; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_404 = _ctrlSignals_T_23 ? 3'h1 : _ctrlSignals_T_403; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_405 = _ctrlSignals_T_21 ? 3'h1 : _ctrlSignals_T_404; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_406 = _ctrlSignals_T_19 ? 3'h5 : _ctrlSignals_T_405; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_407 = _ctrlSignals_T_17 ? 3'h5 : _ctrlSignals_T_406; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_408 = _ctrlSignals_T_15 ? 3'h5 : _ctrlSignals_T_407; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_409 = _ctrlSignals_T_13 ? 3'h5 : _ctrlSignals_T_408; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_410 = _ctrlSignals_T_11 ? 3'h5 : _ctrlSignals_T_409; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_411 = _ctrlSignals_T_9 ? 3'h5 : _ctrlSignals_T_410; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_412 = _ctrlSignals_T_7 ? 3'h1 : _ctrlSignals_T_411; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_413 = _ctrlSignals_T_5 ? 3'h4 : _ctrlSignals_T_412; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_414 = _ctrlSignals_T_3 ? 3'h3 : _ctrlSignals_T_413; // @[Lookup.scala 34:39]
  wire [4:0] _ctrlSignals_T_415 = _ctrlSignals_T_119 ? 5'h11 : 5'hb; // @[Lookup.scala 34:39]
  wire [4:0] _ctrlSignals_T_416 = _ctrlSignals_T_117 ? 5'h10 : _ctrlSignals_T_415; // @[Lookup.scala 34:39]
  wire [4:0] _ctrlSignals_T_417 = _ctrlSignals_T_115 ? 5'he : _ctrlSignals_T_416; // @[Lookup.scala 34:39]
  wire [4:0] _ctrlSignals_T_418 = _ctrlSignals_T_113 ? 5'h10 : _ctrlSignals_T_417; // @[Lookup.scala 34:39]
  wire [4:0] _ctrlSignals_T_419 = _ctrlSignals_T_111 ? 5'he : _ctrlSignals_T_418; // @[Lookup.scala 34:39]
  wire [4:0] _ctrlSignals_T_420 = _ctrlSignals_T_109 ? 5'hf : _ctrlSignals_T_419; // @[Lookup.scala 34:39]
  wire [4:0] _ctrlSignals_T_421 = _ctrlSignals_T_107 ? 5'hd : _ctrlSignals_T_420; // @[Lookup.scala 34:39]
  wire [4:0] _ctrlSignals_T_422 = _ctrlSignals_T_105 ? 5'hf : _ctrlSignals_T_421; // @[Lookup.scala 34:39]
  wire [4:0] _ctrlSignals_T_423 = _ctrlSignals_T_103 ? 5'hd : _ctrlSignals_T_422; // @[Lookup.scala 34:39]
  wire [4:0] _ctrlSignals_T_424 = _ctrlSignals_T_101 ? 5'hc : _ctrlSignals_T_423; // @[Lookup.scala 34:39]
  wire [4:0] _ctrlSignals_T_425 = _ctrlSignals_T_99 ? 5'hc : _ctrlSignals_T_424; // @[Lookup.scala 34:39]
  wire [4:0] _ctrlSignals_T_426 = _ctrlSignals_T_97 ? 5'h2 : _ctrlSignals_T_425; // @[Lookup.scala 34:39]
  wire [4:0] _ctrlSignals_T_427 = _ctrlSignals_T_95 ? 5'h3 : _ctrlSignals_T_426; // @[Lookup.scala 34:39]
  wire [4:0] _ctrlSignals_T_428 = _ctrlSignals_T_93 ? 5'h9 : _ctrlSignals_T_427; // @[Lookup.scala 34:39]
  wire [4:0] _ctrlSignals_T_429 = _ctrlSignals_T_91 ? 5'h9 : _ctrlSignals_T_428; // @[Lookup.scala 34:39]
  wire [4:0] _ctrlSignals_T_430 = _ctrlSignals_T_89 ? 5'h8 : _ctrlSignals_T_429; // @[Lookup.scala 34:39]
  wire [4:0] _ctrlSignals_T_431 = _ctrlSignals_T_87 ? 5'h8 : _ctrlSignals_T_430; // @[Lookup.scala 34:39]
  wire [4:0] _ctrlSignals_T_432 = _ctrlSignals_T_85 ? 5'h4 : _ctrlSignals_T_431; // @[Lookup.scala 34:39]
  wire [4:0] _ctrlSignals_T_433 = _ctrlSignals_T_83 ? 5'h7 : _ctrlSignals_T_432; // @[Lookup.scala 34:39]
  wire [4:0] _ctrlSignals_T_434 = _ctrlSignals_T_81 ? 5'h5 : _ctrlSignals_T_433; // @[Lookup.scala 34:39]
  wire [4:0] _ctrlSignals_T_435 = _ctrlSignals_T_79 ? 5'h6 : _ctrlSignals_T_434; // @[Lookup.scala 34:39]
  wire [4:0] _ctrlSignals_T_436 = _ctrlSignals_T_77 ? 5'h6 : _ctrlSignals_T_435; // @[Lookup.scala 34:39]
  wire [4:0] _ctrlSignals_T_437 = _ctrlSignals_T_75 ? 5'h1 : _ctrlSignals_T_436; // @[Lookup.scala 34:39]
  wire [4:0] _ctrlSignals_T_438 = _ctrlSignals_T_73 ? 5'h1 : _ctrlSignals_T_437; // @[Lookup.scala 34:39]
  wire [4:0] _ctrlSignals_T_439 = _ctrlSignals_T_71 ? 5'h0 : _ctrlSignals_T_438; // @[Lookup.scala 34:39]
  wire [4:0] _ctrlSignals_T_440 = _ctrlSignals_T_69 ? 5'h0 : _ctrlSignals_T_439; // @[Lookup.scala 34:39]
  wire [4:0] _ctrlSignals_T_441 = _ctrlSignals_T_67 ? 5'h9 : _ctrlSignals_T_440; // @[Lookup.scala 34:39]
  wire [4:0] _ctrlSignals_T_442 = _ctrlSignals_T_65 ? 5'h9 : _ctrlSignals_T_441; // @[Lookup.scala 34:39]
  wire [4:0] _ctrlSignals_T_443 = _ctrlSignals_T_63 ? 5'h8 : _ctrlSignals_T_442; // @[Lookup.scala 34:39]
  wire [4:0] _ctrlSignals_T_444 = _ctrlSignals_T_61 ? 5'h8 : _ctrlSignals_T_443; // @[Lookup.scala 34:39]
  wire [4:0] _ctrlSignals_T_445 = _ctrlSignals_T_59 ? 5'h6 : _ctrlSignals_T_444; // @[Lookup.scala 34:39]
  wire [4:0] _ctrlSignals_T_446 = _ctrlSignals_T_57 ? 5'h6 : _ctrlSignals_T_445; // @[Lookup.scala 34:39]
  wire [4:0] _ctrlSignals_T_447 = _ctrlSignals_T_55 ? 5'h2 : _ctrlSignals_T_446; // @[Lookup.scala 34:39]
  wire [4:0] _ctrlSignals_T_448 = _ctrlSignals_T_53 ? 5'h3 : _ctrlSignals_T_447; // @[Lookup.scala 34:39]
  wire [4:0] _ctrlSignals_T_449 = _ctrlSignals_T_51 ? 5'h4 : _ctrlSignals_T_448; // @[Lookup.scala 34:39]
  wire [4:0] _ctrlSignals_T_450 = _ctrlSignals_T_49 ? 5'h7 : _ctrlSignals_T_449; // @[Lookup.scala 34:39]
  wire [4:0] _ctrlSignals_T_451 = _ctrlSignals_T_47 ? 5'h5 : _ctrlSignals_T_450; // @[Lookup.scala 34:39]
  wire [4:0] _ctrlSignals_T_452 = _ctrlSignals_T_45 ? 5'h0 : _ctrlSignals_T_451; // @[Lookup.scala 34:39]
  wire [4:0] _ctrlSignals_T_453 = _ctrlSignals_T_43 ? 5'h0 : _ctrlSignals_T_452; // @[Lookup.scala 34:39]
  wire [4:0] _ctrlSignals_T_454 = _ctrlSignals_T_41 ? 5'h0 : _ctrlSignals_T_453; // @[Lookup.scala 34:39]
  wire [4:0] _ctrlSignals_T_455 = _ctrlSignals_T_39 ? 5'h0 : _ctrlSignals_T_454; // @[Lookup.scala 34:39]
  wire [4:0] _ctrlSignals_T_456 = _ctrlSignals_T_37 ? 5'h0 : _ctrlSignals_T_455; // @[Lookup.scala 34:39]
  wire [4:0] _ctrlSignals_T_457 = _ctrlSignals_T_35 ? 5'h0 : _ctrlSignals_T_456; // @[Lookup.scala 34:39]
  wire [4:0] _ctrlSignals_T_458 = _ctrlSignals_T_33 ? 5'h0 : _ctrlSignals_T_457; // @[Lookup.scala 34:39]
  wire [4:0] _ctrlSignals_T_459 = _ctrlSignals_T_31 ? 5'h0 : _ctrlSignals_T_458; // @[Lookup.scala 34:39]
  wire [4:0] _ctrlSignals_T_460 = _ctrlSignals_T_29 ? 5'h0 : _ctrlSignals_T_459; // @[Lookup.scala 34:39]
  wire [4:0] _ctrlSignals_T_461 = _ctrlSignals_T_27 ? 5'h0 : _ctrlSignals_T_460; // @[Lookup.scala 34:39]
  wire [4:0] _ctrlSignals_T_462 = _ctrlSignals_T_25 ? 5'h0 : _ctrlSignals_T_461; // @[Lookup.scala 34:39]
  wire [4:0] _ctrlSignals_T_463 = _ctrlSignals_T_23 ? 5'h0 : _ctrlSignals_T_462; // @[Lookup.scala 34:39]
  wire [4:0] _ctrlSignals_T_464 = _ctrlSignals_T_21 ? 5'h0 : _ctrlSignals_T_463; // @[Lookup.scala 34:39]
  wire [4:0] _ctrlSignals_T_465 = _ctrlSignals_T_19 ? 5'h0 : _ctrlSignals_T_464; // @[Lookup.scala 34:39]
  wire [4:0] _ctrlSignals_T_466 = _ctrlSignals_T_17 ? 5'h0 : _ctrlSignals_T_465; // @[Lookup.scala 34:39]
  wire [4:0] _ctrlSignals_T_467 = _ctrlSignals_T_15 ? 5'h0 : _ctrlSignals_T_466; // @[Lookup.scala 34:39]
  wire [4:0] _ctrlSignals_T_468 = _ctrlSignals_T_13 ? 5'h0 : _ctrlSignals_T_467; // @[Lookup.scala 34:39]
  wire [4:0] _ctrlSignals_T_469 = _ctrlSignals_T_11 ? 5'h0 : _ctrlSignals_T_468; // @[Lookup.scala 34:39]
  wire [4:0] _ctrlSignals_T_470 = _ctrlSignals_T_9 ? 5'h0 : _ctrlSignals_T_469; // @[Lookup.scala 34:39]
  wire [4:0] _ctrlSignals_T_471 = _ctrlSignals_T_7 ? 5'h0 : _ctrlSignals_T_470; // @[Lookup.scala 34:39]
  wire [4:0] _ctrlSignals_T_472 = _ctrlSignals_T_5 ? 5'h0 : _ctrlSignals_T_471; // @[Lookup.scala 34:39]
  wire [4:0] _ctrlSignals_T_473 = _ctrlSignals_T_3 ? 5'h0 : _ctrlSignals_T_472; // @[Lookup.scala 34:39]
  wire [4:0] ctrlSignals_5 = _ctrlSignals_T_1 ? 5'hb : _ctrlSignals_T_473; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_524 = _ctrlSignals_T_19 ? 3'h4 : 3'h0; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_525 = _ctrlSignals_T_17 ? 3'h1 : _ctrlSignals_T_524; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_526 = _ctrlSignals_T_15 ? 3'h5 : _ctrlSignals_T_525; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_527 = _ctrlSignals_T_13 ? 3'h2 : _ctrlSignals_T_526; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_528 = _ctrlSignals_T_11 ? 3'h6 : _ctrlSignals_T_527; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_529 = _ctrlSignals_T_9 ? 3'h3 : _ctrlSignals_T_528; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_530 = _ctrlSignals_T_7 ? 3'h0 : _ctrlSignals_T_529; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_531 = _ctrlSignals_T_5 ? 3'h0 : _ctrlSignals_T_530; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_532 = _ctrlSignals_T_3 ? 3'h0 : _ctrlSignals_T_531; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_572 = _ctrlSignals_T_41 ? 3'h4 : 3'h0; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_573 = _ctrlSignals_T_39 ? 3'h1 : _ctrlSignals_T_572; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_574 = _ctrlSignals_T_37 ? 3'h2 : _ctrlSignals_T_573; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_575 = _ctrlSignals_T_35 ? 3'h3 : _ctrlSignals_T_574; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_576 = _ctrlSignals_T_33 ? 3'h0 : _ctrlSignals_T_575; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_577 = _ctrlSignals_T_31 ? 3'h0 : _ctrlSignals_T_576; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_578 = _ctrlSignals_T_29 ? 3'h0 : _ctrlSignals_T_577; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_579 = _ctrlSignals_T_27 ? 3'h0 : _ctrlSignals_T_578; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_580 = _ctrlSignals_T_25 ? 3'h0 : _ctrlSignals_T_579; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_581 = _ctrlSignals_T_23 ? 3'h0 : _ctrlSignals_T_580; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_582 = _ctrlSignals_T_21 ? 3'h0 : _ctrlSignals_T_581; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_583 = _ctrlSignals_T_19 ? 3'h0 : _ctrlSignals_T_582; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_584 = _ctrlSignals_T_17 ? 3'h0 : _ctrlSignals_T_583; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_585 = _ctrlSignals_T_15 ? 3'h0 : _ctrlSignals_T_584; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_586 = _ctrlSignals_T_13 ? 3'h0 : _ctrlSignals_T_585; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_587 = _ctrlSignals_T_11 ? 3'h0 : _ctrlSignals_T_586; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_588 = _ctrlSignals_T_9 ? 3'h0 : _ctrlSignals_T_587; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_589 = _ctrlSignals_T_7 ? 3'h0 : _ctrlSignals_T_588; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_590 = _ctrlSignals_T_5 ? 3'h0 : _ctrlSignals_T_589; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_591 = _ctrlSignals_T_3 ? 3'h0 : _ctrlSignals_T_590; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_635 = _ctrlSignals_T_33 ? 3'h7 : 3'h0; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_636 = _ctrlSignals_T_31 ? 3'h6 : _ctrlSignals_T_635; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_637 = _ctrlSignals_T_29 ? 3'h4 : _ctrlSignals_T_636; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_638 = _ctrlSignals_T_27 ? 3'h5 : _ctrlSignals_T_637; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_639 = _ctrlSignals_T_25 ? 3'h1 : _ctrlSignals_T_638; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_640 = _ctrlSignals_T_23 ? 3'h2 : _ctrlSignals_T_639; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_641 = _ctrlSignals_T_21 ? 3'h3 : _ctrlSignals_T_640; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_642 = _ctrlSignals_T_19 ? 3'h0 : _ctrlSignals_T_641; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_643 = _ctrlSignals_T_17 ? 3'h0 : _ctrlSignals_T_642; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_644 = _ctrlSignals_T_15 ? 3'h0 : _ctrlSignals_T_643; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_645 = _ctrlSignals_T_13 ? 3'h0 : _ctrlSignals_T_644; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_646 = _ctrlSignals_T_11 ? 3'h0 : _ctrlSignals_T_645; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_647 = _ctrlSignals_T_9 ? 3'h0 : _ctrlSignals_T_646; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_648 = _ctrlSignals_T_7 ? 3'h0 : _ctrlSignals_T_647; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_649 = _ctrlSignals_T_5 ? 3'h0 : _ctrlSignals_T_648; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_650 = _ctrlSignals_T_3 ? 3'h0 : _ctrlSignals_T_649; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_651 = _ctrlSignals_T_119 ? 2'h3 : 2'h0; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_652 = _ctrlSignals_T_117 ? 2'h0 : _ctrlSignals_T_651; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_653 = _ctrlSignals_T_115 ? 2'h0 : _ctrlSignals_T_652; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_654 = _ctrlSignals_T_113 ? 2'h0 : _ctrlSignals_T_653; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_655 = _ctrlSignals_T_111 ? 2'h0 : _ctrlSignals_T_654; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_656 = _ctrlSignals_T_109 ? 2'h0 : _ctrlSignals_T_655; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_657 = _ctrlSignals_T_107 ? 2'h0 : _ctrlSignals_T_656; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_658 = _ctrlSignals_T_105 ? 2'h0 : _ctrlSignals_T_657; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_659 = _ctrlSignals_T_103 ? 2'h0 : _ctrlSignals_T_658; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_660 = _ctrlSignals_T_101 ? 2'h0 : _ctrlSignals_T_659; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_661 = _ctrlSignals_T_99 ? 2'h0 : _ctrlSignals_T_660; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_662 = _ctrlSignals_T_97 ? 2'h0 : _ctrlSignals_T_661; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_663 = _ctrlSignals_T_95 ? 2'h0 : _ctrlSignals_T_662; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_664 = _ctrlSignals_T_93 ? 2'h0 : _ctrlSignals_T_663; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_665 = _ctrlSignals_T_91 ? 2'h0 : _ctrlSignals_T_664; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_666 = _ctrlSignals_T_89 ? 2'h0 : _ctrlSignals_T_665; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_667 = _ctrlSignals_T_87 ? 2'h0 : _ctrlSignals_T_666; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_668 = _ctrlSignals_T_85 ? 2'h0 : _ctrlSignals_T_667; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_669 = _ctrlSignals_T_83 ? 2'h0 : _ctrlSignals_T_668; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_670 = _ctrlSignals_T_81 ? 2'h0 : _ctrlSignals_T_669; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_671 = _ctrlSignals_T_79 ? 2'h0 : _ctrlSignals_T_670; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_672 = _ctrlSignals_T_77 ? 2'h0 : _ctrlSignals_T_671; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_673 = _ctrlSignals_T_75 ? 2'h0 : _ctrlSignals_T_672; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_674 = _ctrlSignals_T_73 ? 2'h0 : _ctrlSignals_T_673; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_675 = _ctrlSignals_T_71 ? 2'h0 : _ctrlSignals_T_674; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_676 = _ctrlSignals_T_69 ? 2'h0 : _ctrlSignals_T_675; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_677 = _ctrlSignals_T_67 ? 2'h0 : _ctrlSignals_T_676; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_678 = _ctrlSignals_T_65 ? 2'h0 : _ctrlSignals_T_677; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_679 = _ctrlSignals_T_63 ? 2'h0 : _ctrlSignals_T_678; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_680 = _ctrlSignals_T_61 ? 2'h0 : _ctrlSignals_T_679; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_681 = _ctrlSignals_T_59 ? 2'h0 : _ctrlSignals_T_680; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_682 = _ctrlSignals_T_57 ? 2'h0 : _ctrlSignals_T_681; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_683 = _ctrlSignals_T_55 ? 2'h0 : _ctrlSignals_T_682; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_684 = _ctrlSignals_T_53 ? 2'h0 : _ctrlSignals_T_683; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_685 = _ctrlSignals_T_51 ? 2'h0 : _ctrlSignals_T_684; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_686 = _ctrlSignals_T_49 ? 2'h0 : _ctrlSignals_T_685; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_687 = _ctrlSignals_T_47 ? 2'h0 : _ctrlSignals_T_686; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_688 = _ctrlSignals_T_45 ? 2'h0 : _ctrlSignals_T_687; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_689 = _ctrlSignals_T_43 ? 2'h0 : _ctrlSignals_T_688; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_690 = _ctrlSignals_T_41 ? 2'h0 : _ctrlSignals_T_689; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_691 = _ctrlSignals_T_39 ? 2'h0 : _ctrlSignals_T_690; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_692 = _ctrlSignals_T_37 ? 2'h0 : _ctrlSignals_T_691; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_693 = _ctrlSignals_T_35 ? 2'h0 : _ctrlSignals_T_692; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_694 = _ctrlSignals_T_33 ? 2'h1 : _ctrlSignals_T_693; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_695 = _ctrlSignals_T_31 ? 2'h1 : _ctrlSignals_T_694; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_696 = _ctrlSignals_T_29 ? 2'h1 : _ctrlSignals_T_695; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_697 = _ctrlSignals_T_27 ? 2'h1 : _ctrlSignals_T_696; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_698 = _ctrlSignals_T_25 ? 2'h1 : _ctrlSignals_T_697; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_699 = _ctrlSignals_T_23 ? 2'h1 : _ctrlSignals_T_698; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_700 = _ctrlSignals_T_21 ? 2'h1 : _ctrlSignals_T_699; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_701 = _ctrlSignals_T_19 ? 2'h0 : _ctrlSignals_T_700; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_702 = _ctrlSignals_T_17 ? 2'h0 : _ctrlSignals_T_701; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_703 = _ctrlSignals_T_15 ? 2'h0 : _ctrlSignals_T_702; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_704 = _ctrlSignals_T_13 ? 2'h0 : _ctrlSignals_T_703; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_705 = _ctrlSignals_T_11 ? 2'h0 : _ctrlSignals_T_704; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_706 = _ctrlSignals_T_9 ? 2'h0 : _ctrlSignals_T_705; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_707 = _ctrlSignals_T_7 ? 2'h2 : _ctrlSignals_T_706; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_708 = _ctrlSignals_T_5 ? 2'h2 : _ctrlSignals_T_707; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_709 = _ctrlSignals_T_3 ? 2'h0 : _ctrlSignals_T_708; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_710 = _ctrlSignals_T_119 ? 1'h0 : 1'h1; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_740 = _ctrlSignals_T_59 | (_ctrlSignals_T_61 | (_ctrlSignals_T_63 | (_ctrlSignals_T_65 | (
    _ctrlSignals_T_67 | (_ctrlSignals_T_69 | (_ctrlSignals_T_71 | (_ctrlSignals_T_73 | (_ctrlSignals_T_75 | (
    _ctrlSignals_T_77 | (_ctrlSignals_T_79 | (_ctrlSignals_T_81 | (_ctrlSignals_T_83 | (_ctrlSignals_T_85 | (
    _ctrlSignals_T_87 | (_ctrlSignals_T_89 | (_ctrlSignals_T_91 | (_ctrlSignals_T_93 | (_ctrlSignals_T_95 | (
    _ctrlSignals_T_97 | (_ctrlSignals_T_99 | (_ctrlSignals_T_101 | (_ctrlSignals_T_103 | (_ctrlSignals_T_105 | (
    _ctrlSignals_T_107 | (_ctrlSignals_T_109 | (_ctrlSignals_T_111 | (_ctrlSignals_T_113 | (_ctrlSignals_T_115 | (
    _ctrlSignals_T_117 | _ctrlSignals_T_710))))))))))))))))))))))))))))); // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_749 = _ctrlSignals_T_41 ? 1'h0 : _ctrlSignals_T_43 | (_ctrlSignals_T_45 | (_ctrlSignals_T_47 | (
    _ctrlSignals_T_49 | (_ctrlSignals_T_51 | (_ctrlSignals_T_53 | (_ctrlSignals_T_55 | (_ctrlSignals_T_57 |
    _ctrlSignals_T_740))))))); // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_750 = _ctrlSignals_T_39 ? 1'h0 : _ctrlSignals_T_749; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_751 = _ctrlSignals_T_37 ? 1'h0 : _ctrlSignals_T_750; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_752 = _ctrlSignals_T_35 ? 1'h0 : _ctrlSignals_T_751; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_760 = _ctrlSignals_T_19 ? 1'h0 : _ctrlSignals_T_21 | (_ctrlSignals_T_23 | (_ctrlSignals_T_25 | (
    _ctrlSignals_T_27 | (_ctrlSignals_T_29 | (_ctrlSignals_T_31 | (_ctrlSignals_T_33 | _ctrlSignals_T_752)))))); // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_761 = _ctrlSignals_T_17 ? 1'h0 : _ctrlSignals_T_760; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_762 = _ctrlSignals_T_15 ? 1'h0 : _ctrlSignals_T_761; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_763 = _ctrlSignals_T_13 ? 1'h0 : _ctrlSignals_T_762; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_764 = _ctrlSignals_T_11 ? 1'h0 : _ctrlSignals_T_763; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_765 = _ctrlSignals_T_9 ? 1'h0 : _ctrlSignals_T_764; // @[Lookup.scala 34:39]
  assign io_pc_sel = _ctrlSignals_T_1 ? 2'h0 : _ctrlSignals_T_178; // @[Lookup.scala 34:39]
  assign io_A_sel = _ctrlSignals_T_1 ? 1'h0 : _ctrlSignals_T_237; // @[Lookup.scala 34:39]
  assign io_B_sel = _ctrlSignals_T_1 ? 1'h0 : _ctrlSignals_T_296; // @[Lookup.scala 34:39]
  assign io_wd_type = _ctrlSignals_T_1 ? 2'h0 : _ctrlSignals_T_355; // @[Lookup.scala 34:39]
  assign io_imm_sel = _ctrlSignals_T_1 ? 3'h3 : _ctrlSignals_T_414; // @[Lookup.scala 34:39]
  assign io_br_type = _ctrlSignals_T_1 ? 3'h0 : _ctrlSignals_T_532; // @[Lookup.scala 34:39]
  assign io_st_type = _ctrlSignals_T_1 ? 3'h0 : _ctrlSignals_T_591; // @[Lookup.scala 34:39]
  assign io_ld_type = _ctrlSignals_T_1 ? 3'h0 : _ctrlSignals_T_650; // @[Lookup.scala 34:39]
  assign io_wb_sel = _ctrlSignals_T_1 ? 2'h0 : _ctrlSignals_T_709; // @[Lookup.scala 34:39]
  assign io_wb_en = _ctrlSignals_T_1 | (_ctrlSignals_T_3 | (_ctrlSignals_T_5 | (_ctrlSignals_T_7 | _ctrlSignals_T_765)))
    ; // @[Lookup.scala 34:39]
  assign io_alu_op = ctrlSignals_5[3:0]; // @[control.scala 166:19]
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
  reg [63:0] reg_0; // @[cpu.scala 65:22]
  reg [63:0] reg_1; // @[cpu.scala 65:22]
  reg [63:0] reg_2; // @[cpu.scala 65:22]
  reg [63:0] reg_3; // @[cpu.scala 65:22]
  reg [63:0] reg_4; // @[cpu.scala 65:22]
  reg [63:0] reg_5; // @[cpu.scala 65:22]
  reg [63:0] reg_6; // @[cpu.scala 65:22]
  reg [63:0] reg_7; // @[cpu.scala 65:22]
  reg [63:0] reg_8; // @[cpu.scala 65:22]
  reg [63:0] reg_9; // @[cpu.scala 65:22]
  reg [63:0] reg_10; // @[cpu.scala 65:22]
  reg [63:0] reg_11; // @[cpu.scala 65:22]
  reg [63:0] reg_12; // @[cpu.scala 65:22]
  reg [63:0] reg_13; // @[cpu.scala 65:22]
  reg [63:0] reg_14; // @[cpu.scala 65:22]
  reg [63:0] reg_15; // @[cpu.scala 65:22]
  reg [63:0] reg_16; // @[cpu.scala 65:22]
  reg [63:0] reg_17; // @[cpu.scala 65:22]
  reg [63:0] reg_18; // @[cpu.scala 65:22]
  reg [63:0] reg_19; // @[cpu.scala 65:22]
  reg [63:0] reg_20; // @[cpu.scala 65:22]
  reg [63:0] reg_21; // @[cpu.scala 65:22]
  reg [63:0] reg_22; // @[cpu.scala 65:22]
  reg [63:0] reg_23; // @[cpu.scala 65:22]
  reg [63:0] reg_24; // @[cpu.scala 65:22]
  reg [63:0] reg_25; // @[cpu.scala 65:22]
  reg [63:0] reg_26; // @[cpu.scala 65:22]
  reg [63:0] reg_27; // @[cpu.scala 65:22]
  reg [63:0] reg_28; // @[cpu.scala 65:22]
  reg [63:0] reg_29; // @[cpu.scala 65:22]
  reg [63:0] reg_30; // @[cpu.scala 65:22]
  reg [63:0] reg_31; // @[cpu.scala 65:22]
  wire [63:0] _GEN_65 = 5'h1 == io_raddr_0 ? reg_1 : reg_0; // @[cpu.scala 80:{37,37}]
  wire [63:0] _GEN_66 = 5'h2 == io_raddr_0 ? reg_2 : _GEN_65; // @[cpu.scala 80:{37,37}]
  wire [63:0] _GEN_67 = 5'h3 == io_raddr_0 ? reg_3 : _GEN_66; // @[cpu.scala 80:{37,37}]
  wire [63:0] _GEN_68 = 5'h4 == io_raddr_0 ? reg_4 : _GEN_67; // @[cpu.scala 80:{37,37}]
  wire [63:0] _GEN_69 = 5'h5 == io_raddr_0 ? reg_5 : _GEN_68; // @[cpu.scala 80:{37,37}]
  wire [63:0] _GEN_70 = 5'h6 == io_raddr_0 ? reg_6 : _GEN_69; // @[cpu.scala 80:{37,37}]
  wire [63:0] _GEN_71 = 5'h7 == io_raddr_0 ? reg_7 : _GEN_70; // @[cpu.scala 80:{37,37}]
  wire [63:0] _GEN_72 = 5'h8 == io_raddr_0 ? reg_8 : _GEN_71; // @[cpu.scala 80:{37,37}]
  wire [63:0] _GEN_73 = 5'h9 == io_raddr_0 ? reg_9 : _GEN_72; // @[cpu.scala 80:{37,37}]
  wire [63:0] _GEN_74 = 5'ha == io_raddr_0 ? reg_10 : _GEN_73; // @[cpu.scala 80:{37,37}]
  wire [63:0] _GEN_75 = 5'hb == io_raddr_0 ? reg_11 : _GEN_74; // @[cpu.scala 80:{37,37}]
  wire [63:0] _GEN_76 = 5'hc == io_raddr_0 ? reg_12 : _GEN_75; // @[cpu.scala 80:{37,37}]
  wire [63:0] _GEN_77 = 5'hd == io_raddr_0 ? reg_13 : _GEN_76; // @[cpu.scala 80:{37,37}]
  wire [63:0] _GEN_78 = 5'he == io_raddr_0 ? reg_14 : _GEN_77; // @[cpu.scala 80:{37,37}]
  wire [63:0] _GEN_79 = 5'hf == io_raddr_0 ? reg_15 : _GEN_78; // @[cpu.scala 80:{37,37}]
  wire [63:0] _GEN_80 = 5'h10 == io_raddr_0 ? reg_16 : _GEN_79; // @[cpu.scala 80:{37,37}]
  wire [63:0] _GEN_81 = 5'h11 == io_raddr_0 ? reg_17 : _GEN_80; // @[cpu.scala 80:{37,37}]
  wire [63:0] _GEN_82 = 5'h12 == io_raddr_0 ? reg_18 : _GEN_81; // @[cpu.scala 80:{37,37}]
  wire [63:0] _GEN_83 = 5'h13 == io_raddr_0 ? reg_19 : _GEN_82; // @[cpu.scala 80:{37,37}]
  wire [63:0] _GEN_84 = 5'h14 == io_raddr_0 ? reg_20 : _GEN_83; // @[cpu.scala 80:{37,37}]
  wire [63:0] _GEN_85 = 5'h15 == io_raddr_0 ? reg_21 : _GEN_84; // @[cpu.scala 80:{37,37}]
  wire [63:0] _GEN_86 = 5'h16 == io_raddr_0 ? reg_22 : _GEN_85; // @[cpu.scala 80:{37,37}]
  wire [63:0] _GEN_87 = 5'h17 == io_raddr_0 ? reg_23 : _GEN_86; // @[cpu.scala 80:{37,37}]
  wire [63:0] _GEN_88 = 5'h18 == io_raddr_0 ? reg_24 : _GEN_87; // @[cpu.scala 80:{37,37}]
  wire [63:0] _GEN_89 = 5'h19 == io_raddr_0 ? reg_25 : _GEN_88; // @[cpu.scala 80:{37,37}]
  wire [63:0] _GEN_90 = 5'h1a == io_raddr_0 ? reg_26 : _GEN_89; // @[cpu.scala 80:{37,37}]
  wire [63:0] _GEN_91 = 5'h1b == io_raddr_0 ? reg_27 : _GEN_90; // @[cpu.scala 80:{37,37}]
  wire [63:0] _GEN_92 = 5'h1c == io_raddr_0 ? reg_28 : _GEN_91; // @[cpu.scala 80:{37,37}]
  wire [63:0] _GEN_93 = 5'h1d == io_raddr_0 ? reg_29 : _GEN_92; // @[cpu.scala 80:{37,37}]
  wire [63:0] _GEN_94 = 5'h1e == io_raddr_0 ? reg_30 : _GEN_93; // @[cpu.scala 80:{37,37}]
  wire [63:0] _GEN_95 = 5'h1f == io_raddr_0 ? reg_31 : _GEN_94; // @[cpu.scala 80:{37,37}]
  wire [63:0] _GEN_98 = 5'h1 == io_raddr_1 ? reg_1 : reg_0; // @[cpu.scala 80:{37,37}]
  wire [63:0] _GEN_99 = 5'h2 == io_raddr_1 ? reg_2 : _GEN_98; // @[cpu.scala 80:{37,37}]
  wire [63:0] _GEN_100 = 5'h3 == io_raddr_1 ? reg_3 : _GEN_99; // @[cpu.scala 80:{37,37}]
  wire [63:0] _GEN_101 = 5'h4 == io_raddr_1 ? reg_4 : _GEN_100; // @[cpu.scala 80:{37,37}]
  wire [63:0] _GEN_102 = 5'h5 == io_raddr_1 ? reg_5 : _GEN_101; // @[cpu.scala 80:{37,37}]
  wire [63:0] _GEN_103 = 5'h6 == io_raddr_1 ? reg_6 : _GEN_102; // @[cpu.scala 80:{37,37}]
  wire [63:0] _GEN_104 = 5'h7 == io_raddr_1 ? reg_7 : _GEN_103; // @[cpu.scala 80:{37,37}]
  wire [63:0] _GEN_105 = 5'h8 == io_raddr_1 ? reg_8 : _GEN_104; // @[cpu.scala 80:{37,37}]
  wire [63:0] _GEN_106 = 5'h9 == io_raddr_1 ? reg_9 : _GEN_105; // @[cpu.scala 80:{37,37}]
  wire [63:0] _GEN_107 = 5'ha == io_raddr_1 ? reg_10 : _GEN_106; // @[cpu.scala 80:{37,37}]
  wire [63:0] _GEN_108 = 5'hb == io_raddr_1 ? reg_11 : _GEN_107; // @[cpu.scala 80:{37,37}]
  wire [63:0] _GEN_109 = 5'hc == io_raddr_1 ? reg_12 : _GEN_108; // @[cpu.scala 80:{37,37}]
  wire [63:0] _GEN_110 = 5'hd == io_raddr_1 ? reg_13 : _GEN_109; // @[cpu.scala 80:{37,37}]
  wire [63:0] _GEN_111 = 5'he == io_raddr_1 ? reg_14 : _GEN_110; // @[cpu.scala 80:{37,37}]
  wire [63:0] _GEN_112 = 5'hf == io_raddr_1 ? reg_15 : _GEN_111; // @[cpu.scala 80:{37,37}]
  wire [63:0] _GEN_113 = 5'h10 == io_raddr_1 ? reg_16 : _GEN_112; // @[cpu.scala 80:{37,37}]
  wire [63:0] _GEN_114 = 5'h11 == io_raddr_1 ? reg_17 : _GEN_113; // @[cpu.scala 80:{37,37}]
  wire [63:0] _GEN_115 = 5'h12 == io_raddr_1 ? reg_18 : _GEN_114; // @[cpu.scala 80:{37,37}]
  wire [63:0] _GEN_116 = 5'h13 == io_raddr_1 ? reg_19 : _GEN_115; // @[cpu.scala 80:{37,37}]
  wire [63:0] _GEN_117 = 5'h14 == io_raddr_1 ? reg_20 : _GEN_116; // @[cpu.scala 80:{37,37}]
  wire [63:0] _GEN_118 = 5'h15 == io_raddr_1 ? reg_21 : _GEN_117; // @[cpu.scala 80:{37,37}]
  wire [63:0] _GEN_119 = 5'h16 == io_raddr_1 ? reg_22 : _GEN_118; // @[cpu.scala 80:{37,37}]
  wire [63:0] _GEN_120 = 5'h17 == io_raddr_1 ? reg_23 : _GEN_119; // @[cpu.scala 80:{37,37}]
  wire [63:0] _GEN_121 = 5'h18 == io_raddr_1 ? reg_24 : _GEN_120; // @[cpu.scala 80:{37,37}]
  wire [63:0] _GEN_122 = 5'h19 == io_raddr_1 ? reg_25 : _GEN_121; // @[cpu.scala 80:{37,37}]
  wire [63:0] _GEN_123 = 5'h1a == io_raddr_1 ? reg_26 : _GEN_122; // @[cpu.scala 80:{37,37}]
  wire [63:0] _GEN_124 = 5'h1b == io_raddr_1 ? reg_27 : _GEN_123; // @[cpu.scala 80:{37,37}]
  wire [63:0] _GEN_125 = 5'h1c == io_raddr_1 ? reg_28 : _GEN_124; // @[cpu.scala 80:{37,37}]
  wire [63:0] _GEN_126 = 5'h1d == io_raddr_1 ? reg_29 : _GEN_125; // @[cpu.scala 80:{37,37}]
  wire [63:0] _GEN_127 = 5'h1e == io_raddr_1 ? reg_30 : _GEN_126; // @[cpu.scala 80:{37,37}]
  wire [63:0] _GEN_128 = 5'h1f == io_raddr_1 ? reg_31 : _GEN_127; // @[cpu.scala 80:{37,37}]
  assign io_rdata_0 = io_raddr_0 == 5'h0 ? 64'h0 : _GEN_95; // @[cpu.scala 77:42 78:37 80:37]
  assign io_rdata_1 = io_raddr_1 == 5'h0 ? 64'h0 : _GEN_128; // @[cpu.scala 77:42 78:37 80:37]
  assign io_rdata_4 = reg_1; // @[cpu.scala 77:42 78:37 80:37]
  assign io_rdata_5 = reg_2; // @[cpu.scala 77:42 78:37 80:37]
  assign io_rdata_6 = reg_3; // @[cpu.scala 77:42 78:37 80:37]
  assign io_rdata_7 = reg_4; // @[cpu.scala 77:42 78:37 80:37]
  assign io_rdata_8 = reg_5; // @[cpu.scala 77:42 78:37 80:37]
  assign io_rdata_9 = reg_6; // @[cpu.scala 77:42 78:37 80:37]
  assign io_rdata_10 = reg_7; // @[cpu.scala 77:42 78:37 80:37]
  assign io_rdata_11 = reg_8; // @[cpu.scala 77:42 78:37 80:37]
  assign io_rdata_12 = reg_9; // @[cpu.scala 77:42 78:37 80:37]
  assign io_rdata_13 = reg_10; // @[cpu.scala 77:42 78:37 80:37]
  assign io_rdata_14 = reg_11; // @[cpu.scala 77:42 78:37 80:37]
  assign io_rdata_15 = reg_12; // @[cpu.scala 77:42 78:37 80:37]
  assign io_rdata_16 = reg_13; // @[cpu.scala 77:42 78:37 80:37]
  assign io_rdata_17 = reg_14; // @[cpu.scala 77:42 78:37 80:37]
  assign io_rdata_18 = reg_15; // @[cpu.scala 77:42 78:37 80:37]
  assign io_rdata_19 = reg_16; // @[cpu.scala 77:42 78:37 80:37]
  assign io_rdata_20 = reg_17; // @[cpu.scala 77:42 78:37 80:37]
  assign io_rdata_21 = reg_18; // @[cpu.scala 77:42 78:37 80:37]
  assign io_rdata_22 = reg_19; // @[cpu.scala 77:42 78:37 80:37]
  assign io_rdata_23 = reg_20; // @[cpu.scala 77:42 78:37 80:37]
  assign io_rdata_24 = reg_21; // @[cpu.scala 77:42 78:37 80:37]
  assign io_rdata_25 = reg_22; // @[cpu.scala 77:42 78:37 80:37]
  assign io_rdata_26 = reg_23; // @[cpu.scala 77:42 78:37 80:37]
  assign io_rdata_27 = reg_24; // @[cpu.scala 77:42 78:37 80:37]
  assign io_rdata_28 = reg_25; // @[cpu.scala 77:42 78:37 80:37]
  assign io_rdata_29 = reg_26; // @[cpu.scala 77:42 78:37 80:37]
  assign io_rdata_30 = reg_27; // @[cpu.scala 77:42 78:37 80:37]
  assign io_rdata_31 = reg_28; // @[cpu.scala 77:42 78:37 80:37]
  assign io_rdata_32 = reg_29; // @[cpu.scala 77:42 78:37 80:37]
  assign io_rdata_33 = reg_30; // @[cpu.scala 77:42 78:37 80:37]
  assign io_rdata_34 = reg_31; // @[cpu.scala 77:42 78:37 80:37]
  always @(posedge clock) begin
    if (reset) begin // @[cpu.scala 65:22]
      reg_0 <= 64'h0; // @[cpu.scala 65:22]
    end else if (io_wen) begin // @[cpu.scala 68:17]
      if (5'h0 == io_waddr) begin // @[cpu.scala 69:23]
        reg_0 <= io_wdata; // @[cpu.scala 69:23]
      end
    end
    if (reset) begin // @[cpu.scala 65:22]
      reg_1 <= 64'h0; // @[cpu.scala 65:22]
    end else if (io_wen) begin // @[cpu.scala 68:17]
      if (5'h1 == io_waddr) begin // @[cpu.scala 69:23]
        reg_1 <= io_wdata; // @[cpu.scala 69:23]
      end
    end
    if (reset) begin // @[cpu.scala 65:22]
      reg_2 <= 64'h0; // @[cpu.scala 65:22]
    end else if (io_wen) begin // @[cpu.scala 68:17]
      if (5'h2 == io_waddr) begin // @[cpu.scala 69:23]
        reg_2 <= io_wdata; // @[cpu.scala 69:23]
      end
    end
    if (reset) begin // @[cpu.scala 65:22]
      reg_3 <= 64'h0; // @[cpu.scala 65:22]
    end else if (io_wen) begin // @[cpu.scala 68:17]
      if (5'h3 == io_waddr) begin // @[cpu.scala 69:23]
        reg_3 <= io_wdata; // @[cpu.scala 69:23]
      end
    end
    if (reset) begin // @[cpu.scala 65:22]
      reg_4 <= 64'h0; // @[cpu.scala 65:22]
    end else if (io_wen) begin // @[cpu.scala 68:17]
      if (5'h4 == io_waddr) begin // @[cpu.scala 69:23]
        reg_4 <= io_wdata; // @[cpu.scala 69:23]
      end
    end
    if (reset) begin // @[cpu.scala 65:22]
      reg_5 <= 64'h0; // @[cpu.scala 65:22]
    end else if (io_wen) begin // @[cpu.scala 68:17]
      if (5'h5 == io_waddr) begin // @[cpu.scala 69:23]
        reg_5 <= io_wdata; // @[cpu.scala 69:23]
      end
    end
    if (reset) begin // @[cpu.scala 65:22]
      reg_6 <= 64'h0; // @[cpu.scala 65:22]
    end else if (io_wen) begin // @[cpu.scala 68:17]
      if (5'h6 == io_waddr) begin // @[cpu.scala 69:23]
        reg_6 <= io_wdata; // @[cpu.scala 69:23]
      end
    end
    if (reset) begin // @[cpu.scala 65:22]
      reg_7 <= 64'h0; // @[cpu.scala 65:22]
    end else if (io_wen) begin // @[cpu.scala 68:17]
      if (5'h7 == io_waddr) begin // @[cpu.scala 69:23]
        reg_7 <= io_wdata; // @[cpu.scala 69:23]
      end
    end
    if (reset) begin // @[cpu.scala 65:22]
      reg_8 <= 64'h0; // @[cpu.scala 65:22]
    end else if (io_wen) begin // @[cpu.scala 68:17]
      if (5'h8 == io_waddr) begin // @[cpu.scala 69:23]
        reg_8 <= io_wdata; // @[cpu.scala 69:23]
      end
    end
    if (reset) begin // @[cpu.scala 65:22]
      reg_9 <= 64'h0; // @[cpu.scala 65:22]
    end else if (io_wen) begin // @[cpu.scala 68:17]
      if (5'h9 == io_waddr) begin // @[cpu.scala 69:23]
        reg_9 <= io_wdata; // @[cpu.scala 69:23]
      end
    end
    if (reset) begin // @[cpu.scala 65:22]
      reg_10 <= 64'h0; // @[cpu.scala 65:22]
    end else if (io_wen) begin // @[cpu.scala 68:17]
      if (5'ha == io_waddr) begin // @[cpu.scala 69:23]
        reg_10 <= io_wdata; // @[cpu.scala 69:23]
      end
    end
    if (reset) begin // @[cpu.scala 65:22]
      reg_11 <= 64'h0; // @[cpu.scala 65:22]
    end else if (io_wen) begin // @[cpu.scala 68:17]
      if (5'hb == io_waddr) begin // @[cpu.scala 69:23]
        reg_11 <= io_wdata; // @[cpu.scala 69:23]
      end
    end
    if (reset) begin // @[cpu.scala 65:22]
      reg_12 <= 64'h0; // @[cpu.scala 65:22]
    end else if (io_wen) begin // @[cpu.scala 68:17]
      if (5'hc == io_waddr) begin // @[cpu.scala 69:23]
        reg_12 <= io_wdata; // @[cpu.scala 69:23]
      end
    end
    if (reset) begin // @[cpu.scala 65:22]
      reg_13 <= 64'h0; // @[cpu.scala 65:22]
    end else if (io_wen) begin // @[cpu.scala 68:17]
      if (5'hd == io_waddr) begin // @[cpu.scala 69:23]
        reg_13 <= io_wdata; // @[cpu.scala 69:23]
      end
    end
    if (reset) begin // @[cpu.scala 65:22]
      reg_14 <= 64'h0; // @[cpu.scala 65:22]
    end else if (io_wen) begin // @[cpu.scala 68:17]
      if (5'he == io_waddr) begin // @[cpu.scala 69:23]
        reg_14 <= io_wdata; // @[cpu.scala 69:23]
      end
    end
    if (reset) begin // @[cpu.scala 65:22]
      reg_15 <= 64'h0; // @[cpu.scala 65:22]
    end else if (io_wen) begin // @[cpu.scala 68:17]
      if (5'hf == io_waddr) begin // @[cpu.scala 69:23]
        reg_15 <= io_wdata; // @[cpu.scala 69:23]
      end
    end
    if (reset) begin // @[cpu.scala 65:22]
      reg_16 <= 64'h0; // @[cpu.scala 65:22]
    end else if (io_wen) begin // @[cpu.scala 68:17]
      if (5'h10 == io_waddr) begin // @[cpu.scala 69:23]
        reg_16 <= io_wdata; // @[cpu.scala 69:23]
      end
    end
    if (reset) begin // @[cpu.scala 65:22]
      reg_17 <= 64'h0; // @[cpu.scala 65:22]
    end else if (io_wen) begin // @[cpu.scala 68:17]
      if (5'h11 == io_waddr) begin // @[cpu.scala 69:23]
        reg_17 <= io_wdata; // @[cpu.scala 69:23]
      end
    end
    if (reset) begin // @[cpu.scala 65:22]
      reg_18 <= 64'h0; // @[cpu.scala 65:22]
    end else if (io_wen) begin // @[cpu.scala 68:17]
      if (5'h12 == io_waddr) begin // @[cpu.scala 69:23]
        reg_18 <= io_wdata; // @[cpu.scala 69:23]
      end
    end
    if (reset) begin // @[cpu.scala 65:22]
      reg_19 <= 64'h0; // @[cpu.scala 65:22]
    end else if (io_wen) begin // @[cpu.scala 68:17]
      if (5'h13 == io_waddr) begin // @[cpu.scala 69:23]
        reg_19 <= io_wdata; // @[cpu.scala 69:23]
      end
    end
    if (reset) begin // @[cpu.scala 65:22]
      reg_20 <= 64'h0; // @[cpu.scala 65:22]
    end else if (io_wen) begin // @[cpu.scala 68:17]
      if (5'h14 == io_waddr) begin // @[cpu.scala 69:23]
        reg_20 <= io_wdata; // @[cpu.scala 69:23]
      end
    end
    if (reset) begin // @[cpu.scala 65:22]
      reg_21 <= 64'h0; // @[cpu.scala 65:22]
    end else if (io_wen) begin // @[cpu.scala 68:17]
      if (5'h15 == io_waddr) begin // @[cpu.scala 69:23]
        reg_21 <= io_wdata; // @[cpu.scala 69:23]
      end
    end
    if (reset) begin // @[cpu.scala 65:22]
      reg_22 <= 64'h0; // @[cpu.scala 65:22]
    end else if (io_wen) begin // @[cpu.scala 68:17]
      if (5'h16 == io_waddr) begin // @[cpu.scala 69:23]
        reg_22 <= io_wdata; // @[cpu.scala 69:23]
      end
    end
    if (reset) begin // @[cpu.scala 65:22]
      reg_23 <= 64'h0; // @[cpu.scala 65:22]
    end else if (io_wen) begin // @[cpu.scala 68:17]
      if (5'h17 == io_waddr) begin // @[cpu.scala 69:23]
        reg_23 <= io_wdata; // @[cpu.scala 69:23]
      end
    end
    if (reset) begin // @[cpu.scala 65:22]
      reg_24 <= 64'h0; // @[cpu.scala 65:22]
    end else if (io_wen) begin // @[cpu.scala 68:17]
      if (5'h18 == io_waddr) begin // @[cpu.scala 69:23]
        reg_24 <= io_wdata; // @[cpu.scala 69:23]
      end
    end
    if (reset) begin // @[cpu.scala 65:22]
      reg_25 <= 64'h0; // @[cpu.scala 65:22]
    end else if (io_wen) begin // @[cpu.scala 68:17]
      if (5'h19 == io_waddr) begin // @[cpu.scala 69:23]
        reg_25 <= io_wdata; // @[cpu.scala 69:23]
      end
    end
    if (reset) begin // @[cpu.scala 65:22]
      reg_26 <= 64'h0; // @[cpu.scala 65:22]
    end else if (io_wen) begin // @[cpu.scala 68:17]
      if (5'h1a == io_waddr) begin // @[cpu.scala 69:23]
        reg_26 <= io_wdata; // @[cpu.scala 69:23]
      end
    end
    if (reset) begin // @[cpu.scala 65:22]
      reg_27 <= 64'h0; // @[cpu.scala 65:22]
    end else if (io_wen) begin // @[cpu.scala 68:17]
      if (5'h1b == io_waddr) begin // @[cpu.scala 69:23]
        reg_27 <= io_wdata; // @[cpu.scala 69:23]
      end
    end
    if (reset) begin // @[cpu.scala 65:22]
      reg_28 <= 64'h0; // @[cpu.scala 65:22]
    end else if (io_wen) begin // @[cpu.scala 68:17]
      if (5'h1c == io_waddr) begin // @[cpu.scala 69:23]
        reg_28 <= io_wdata; // @[cpu.scala 69:23]
      end
    end
    if (reset) begin // @[cpu.scala 65:22]
      reg_29 <= 64'h0; // @[cpu.scala 65:22]
    end else if (io_wen) begin // @[cpu.scala 68:17]
      if (5'h1d == io_waddr) begin // @[cpu.scala 69:23]
        reg_29 <= io_wdata; // @[cpu.scala 69:23]
      end
    end
    if (reset) begin // @[cpu.scala 65:22]
      reg_30 <= 64'h0; // @[cpu.scala 65:22]
    end else if (io_wen) begin // @[cpu.scala 68:17]
      if (5'h1e == io_waddr) begin // @[cpu.scala 69:23]
        reg_30 <= io_wdata; // @[cpu.scala 69:23]
      end
    end
    if (reset) begin // @[cpu.scala 65:22]
      reg_31 <= 64'h0; // @[cpu.scala 65:22]
    end else if (io_wen) begin // @[cpu.scala 68:17]
      if (5'h1f == io_waddr) begin // @[cpu.scala 69:23]
        reg_31 <= io_wdata; // @[cpu.scala 69:23]
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
  output [63:0] io_pc_debug
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  wire [63:0] alu_io_A; // @[cpu.scala 302:25]
  wire [63:0] alu_io_B; // @[cpu.scala 302:25]
  wire [1:0] alu_io_width_type; // @[cpu.scala 302:25]
  wire [3:0] alu_io_alu_op; // @[cpu.scala 302:25]
  wire [63:0] alu_io_out; // @[cpu.scala 302:25]
  wire [31:0] immGen_io_inst; // @[cpu.scala 303:28]
  wire [2:0] immGen_io_sel; // @[cpu.scala 303:28]
  wire [63:0] immGen_io_out; // @[cpu.scala 303:28]
  wire [31:0] control_io_inst; // @[cpu.scala 304:29]
  wire [1:0] control_io_pc_sel; // @[cpu.scala 304:29]
  wire  control_io_A_sel; // @[cpu.scala 304:29]
  wire  control_io_B_sel; // @[cpu.scala 304:29]
  wire [1:0] control_io_wd_type; // @[cpu.scala 304:29]
  wire [2:0] control_io_imm_sel; // @[cpu.scala 304:29]
  wire [2:0] control_io_br_type; // @[cpu.scala 304:29]
  wire [2:0] control_io_st_type; // @[cpu.scala 304:29]
  wire [2:0] control_io_ld_type; // @[cpu.scala 304:29]
  wire [1:0] control_io_wb_sel; // @[cpu.scala 304:29]
  wire  control_io_wb_en; // @[cpu.scala 304:29]
  wire [3:0] control_io_alu_op; // @[cpu.scala 304:29]
  wire [63:0] brCond_io_rs1; // @[cpu.scala 305:28]
  wire [63:0] brCond_io_rs2; // @[cpu.scala 305:28]
  wire [2:0] brCond_io_br_type; // @[cpu.scala 305:28]
  wire  brCond_io_taken; // @[cpu.scala 305:28]
  wire  regFile_clock; // @[cpu.scala 306:29]
  wire  regFile_reset; // @[cpu.scala 306:29]
  wire  regFile_io_wen; // @[cpu.scala 306:29]
  wire [4:0] regFile_io_waddr; // @[cpu.scala 306:29]
  wire [63:0] regFile_io_wdata; // @[cpu.scala 306:29]
  wire [4:0] regFile_io_raddr_0; // @[cpu.scala 306:29]
  wire [4:0] regFile_io_raddr_1; // @[cpu.scala 306:29]
  wire [63:0] regFile_io_rdata_0; // @[cpu.scala 306:29]
  wire [63:0] regFile_io_rdata_1; // @[cpu.scala 306:29]
  wire [63:0] regFile_io_rdata_4; // @[cpu.scala 306:29]
  wire [63:0] regFile_io_rdata_5; // @[cpu.scala 306:29]
  wire [63:0] regFile_io_rdata_6; // @[cpu.scala 306:29]
  wire [63:0] regFile_io_rdata_7; // @[cpu.scala 306:29]
  wire [63:0] regFile_io_rdata_8; // @[cpu.scala 306:29]
  wire [63:0] regFile_io_rdata_9; // @[cpu.scala 306:29]
  wire [63:0] regFile_io_rdata_10; // @[cpu.scala 306:29]
  wire [63:0] regFile_io_rdata_11; // @[cpu.scala 306:29]
  wire [63:0] regFile_io_rdata_12; // @[cpu.scala 306:29]
  wire [63:0] regFile_io_rdata_13; // @[cpu.scala 306:29]
  wire [63:0] regFile_io_rdata_14; // @[cpu.scala 306:29]
  wire [63:0] regFile_io_rdata_15; // @[cpu.scala 306:29]
  wire [63:0] regFile_io_rdata_16; // @[cpu.scala 306:29]
  wire [63:0] regFile_io_rdata_17; // @[cpu.scala 306:29]
  wire [63:0] regFile_io_rdata_18; // @[cpu.scala 306:29]
  wire [63:0] regFile_io_rdata_19; // @[cpu.scala 306:29]
  wire [63:0] regFile_io_rdata_20; // @[cpu.scala 306:29]
  wire [63:0] regFile_io_rdata_21; // @[cpu.scala 306:29]
  wire [63:0] regFile_io_rdata_22; // @[cpu.scala 306:29]
  wire [63:0] regFile_io_rdata_23; // @[cpu.scala 306:29]
  wire [63:0] regFile_io_rdata_24; // @[cpu.scala 306:29]
  wire [63:0] regFile_io_rdata_25; // @[cpu.scala 306:29]
  wire [63:0] regFile_io_rdata_26; // @[cpu.scala 306:29]
  wire [63:0] regFile_io_rdata_27; // @[cpu.scala 306:29]
  wire [63:0] regFile_io_rdata_28; // @[cpu.scala 306:29]
  wire [63:0] regFile_io_rdata_29; // @[cpu.scala 306:29]
  wire [63:0] regFile_io_rdata_30; // @[cpu.scala 306:29]
  wire [63:0] regFile_io_rdata_31; // @[cpu.scala 306:29]
  wire [63:0] regFile_io_rdata_32; // @[cpu.scala 306:29]
  wire [63:0] regFile_io_rdata_33; // @[cpu.scala 306:29]
  wire [63:0] regFile_io_rdata_34; // @[cpu.scala 306:29]
  wire  mem__clock; // @[cpu.scala 307:25]
  wire  mem__reset; // @[cpu.scala 307:25]
  wire [63:0] mem__pc_addr; // @[cpu.scala 307:25]
  wire [63:0] mem__pc_data; // @[cpu.scala 307:25]
  wire [63:0] mem__addr; // @[cpu.scala 307:25]
  wire [63:0] mem__wdata; // @[cpu.scala 307:25]
  wire [7:0] mem__mask; // @[cpu.scala 307:25]
  wire [63:0] mem__rdata; // @[cpu.scala 307:25]
  wire  mem__enable; // @[cpu.scala 307:25]
  wire  mem__wen; // @[cpu.scala 307:25]
  wire  gpr_ptr_clock; // @[cpu.scala 309:29]
  wire  gpr_ptr_reset; // @[cpu.scala 309:29]
  wire [63:0] gpr_ptr_regfile_0; // @[cpu.scala 309:29]
  wire [63:0] gpr_ptr_regfile_1; // @[cpu.scala 309:29]
  wire [63:0] gpr_ptr_regfile_2; // @[cpu.scala 309:29]
  wire [63:0] gpr_ptr_regfile_3; // @[cpu.scala 309:29]
  wire [63:0] gpr_ptr_regfile_4; // @[cpu.scala 309:29]
  wire [63:0] gpr_ptr_regfile_5; // @[cpu.scala 309:29]
  wire [63:0] gpr_ptr_regfile_6; // @[cpu.scala 309:29]
  wire [63:0] gpr_ptr_regfile_7; // @[cpu.scala 309:29]
  wire [63:0] gpr_ptr_regfile_8; // @[cpu.scala 309:29]
  wire [63:0] gpr_ptr_regfile_9; // @[cpu.scala 309:29]
  wire [63:0] gpr_ptr_regfile_10; // @[cpu.scala 309:29]
  wire [63:0] gpr_ptr_regfile_11; // @[cpu.scala 309:29]
  wire [63:0] gpr_ptr_regfile_12; // @[cpu.scala 309:29]
  wire [63:0] gpr_ptr_regfile_13; // @[cpu.scala 309:29]
  wire [63:0] gpr_ptr_regfile_14; // @[cpu.scala 309:29]
  wire [63:0] gpr_ptr_regfile_15; // @[cpu.scala 309:29]
  wire [63:0] gpr_ptr_regfile_16; // @[cpu.scala 309:29]
  wire [63:0] gpr_ptr_regfile_17; // @[cpu.scala 309:29]
  wire [63:0] gpr_ptr_regfile_18; // @[cpu.scala 309:29]
  wire [63:0] gpr_ptr_regfile_19; // @[cpu.scala 309:29]
  wire [63:0] gpr_ptr_regfile_20; // @[cpu.scala 309:29]
  wire [63:0] gpr_ptr_regfile_21; // @[cpu.scala 309:29]
  wire [63:0] gpr_ptr_regfile_22; // @[cpu.scala 309:29]
  wire [63:0] gpr_ptr_regfile_23; // @[cpu.scala 309:29]
  wire [63:0] gpr_ptr_regfile_24; // @[cpu.scala 309:29]
  wire [63:0] gpr_ptr_regfile_25; // @[cpu.scala 309:29]
  wire [63:0] gpr_ptr_regfile_26; // @[cpu.scala 309:29]
  wire [63:0] gpr_ptr_regfile_27; // @[cpu.scala 309:29]
  wire [63:0] gpr_ptr_regfile_28; // @[cpu.scala 309:29]
  wire [63:0] gpr_ptr_regfile_29; // @[cpu.scala 309:29]
  wire [63:0] gpr_ptr_regfile_30; // @[cpu.scala 309:29]
  wire [63:0] gpr_ptr_regfile_31; // @[cpu.scala 309:29]
  reg [31:0] pc; // @[cpu.scala 308:25]
  wire  taken = brCond_io_taken;
  wire [31:0] _pc_T_4 = pc + 32'h4; // @[cpu.scala 346:58]
  wire [63:0] alu_out = alu_io_out;
  wire [63:0] _pc_T_7 = control_io_pc_sel == 2'h1 | taken ? alu_out : {{32'd0}, pc}; // @[cpu.scala 347:20]
  wire [63:0] _pc_T_8 = control_io_pc_sel == 2'h0 & ~taken ? {{32'd0}, _pc_T_4} : _pc_T_7; // @[cpu.scala 346:18]
  wire [31:0] instr = pc[2] & ~clock | ~pc[2] & clock ? mem__pc_data[63:32] : mem__pc_data[31:0]; // @[cpu.scala 352:21]
  wire [63:0] A_data = control_io_A_sel ? regFile_io_rdata_0 : {{32'd0}, pc}; // @[cpu.scala 359:22]
  wire [63:0] imm = immGen_io_out;
  wire [63:0] B_data = control_io_B_sel ? regFile_io_rdata_1 : imm; // @[cpu.scala 360:22]
  wire  _alu_io_A_T = control_io_wd_type == 2'h1; // @[cpu.scala 361:44]
  wire [5:0] _mem_io_wdata_T_1 = {alu_out[2:0], 3'h0}; // @[cpu.scala 392:63]
  wire [126:0] _GEN_1 = {{63'd0}, regFile_io_rdata_1}; // @[cpu.scala 392:46]
  wire [126:0] _mem_io_wdata_T_2 = _GEN_1 << _mem_io_wdata_T_1; // @[cpu.scala 392:46]
  wire  _regFile_io_wen_T = control_io_wb_sel == 2'h0; // @[cpu.scala 395:46]
  wire  _regFile_io_wen_T_1 = control_io_wb_sel == 2'h2; // @[cpu.scala 396:59]
  wire  _regFile_io_wen_T_2 = control_io_wb_sel == 2'h0 | _regFile_io_wen_T_1; // @[cpu.scala 395:57]
  wire  _regFile_io_wen_T_3 = control_io_wb_sel == 2'h1; // @[cpu.scala 397:59]
  wire  _regFile_io_wen_T_4 = _regFile_io_wen_T_2 | _regFile_io_wen_T_3; // @[cpu.scala 396:70]
  wire [7:0] _st_mask_T_3 = control_io_st_type == 3'h3 ? 8'h1 : 8'hff; // @[cpu.scala 402:60]
  wire [7:0] _st_mask_T_4 = control_io_st_type == 3'h2 ? 8'h3 : _st_mask_T_3; // @[cpu.scala 401:52]
  wire [7:0] _st_mask_T_5 = control_io_st_type == 3'h1 ? 8'hf : _st_mask_T_4; // @[cpu.scala 400:23]
  wire [15:0] st_mask = {{8'd0}, _st_mask_T_5};
  wire [22:0] _GEN_2 = {{7'd0}, st_mask}; // @[cpu.scala 408:78]
  wire [22:0] _mem_io_mask_T_3 = _GEN_2 << alu_out[2:0]; // @[cpu.scala 408:78]
  wire [63:0] _load_data_T = alu_out & 64'h7; // @[cpu.scala 410:48]
  wire [66:0] _load_data_T_1 = {_load_data_T, 3'h0}; // @[cpu.scala 410:59]
  wire [63:0] load_data = mem__rdata >> _load_data_T_1; // @[cpu.scala 410:35]
  wire [31:0] _load_data_ext_T_3 = load_data[31] ? 32'hffffffff : 32'h0; // @[cpu.scala 411:67]
  wire [63:0] _load_data_ext_T_5 = {_load_data_ext_T_3,load_data[31:0]}; // @[Cat.scala 31:58]
  wire [63:0] _load_data_ext_T_9 = {32'h0,load_data[31:0]}; // @[Cat.scala 31:58]
  wire [47:0] _load_data_ext_T_13 = load_data[15] ? 48'hffffffffffff : 48'h0; // @[cpu.scala 413:90]
  wire [63:0] _load_data_ext_T_15 = {_load_data_ext_T_13,load_data[15:0]}; // @[Cat.scala 31:58]
  wire [63:0] _load_data_ext_T_19 = {48'h0,load_data[15:0]}; // @[Cat.scala 31:58]
  wire [55:0] _load_data_ext_T_23 = load_data[7] ? 56'hffffffffffffff : 56'h0; // @[cpu.scala 415:106]
  wire [63:0] _load_data_ext_T_25 = {_load_data_ext_T_23,load_data[7:0]}; // @[Cat.scala 31:58]
  wire [63:0] _load_data_ext_T_29 = {56'h0,load_data[7:0]}; // @[Cat.scala 31:58]
  wire [63:0] _load_data_ext_T_30 = control_io_ld_type == 3'h5 ? _load_data_ext_T_29 : load_data; // @[cpu.scala 416:76]
  wire [63:0] _load_data_ext_T_31 = control_io_ld_type == 3'h3 ? _load_data_ext_T_25 : _load_data_ext_T_30; // @[cpu.scala 415:68]
  wire [63:0] _load_data_ext_T_32 = control_io_ld_type == 3'h4 ? _load_data_ext_T_19 : _load_data_ext_T_31; // @[cpu.scala 414:60]
  wire [63:0] _load_data_ext_T_33 = control_io_ld_type == 3'h2 ? _load_data_ext_T_15 : _load_data_ext_T_32; // @[cpu.scala 413:52]
  wire [63:0] _load_data_ext_T_34 = control_io_ld_type == 3'h6 ? _load_data_ext_T_9 : _load_data_ext_T_33; // @[cpu.scala 412:44]
  wire [63:0] load_data_ext = control_io_ld_type == 3'h1 ? _load_data_ext_T_5 : _load_data_ext_T_34; // @[cpu.scala 411:29]
  wire [63:0] pc_4 = {{32'd0}, _pc_T_4};
  wire [63:0] _regFile_io_wdata_T_2 = _regFile_io_wen_T_1 ? pc_4 : load_data_ext; // @[cpu.scala 444:52]
  wire [63:0] _GEN_0 = reset ? 64'h80000000 : _pc_T_8; // @[cpu.scala 308:{25,25} 346:12]
  AluSimple alu ( // @[cpu.scala 302:25]
    .io_A(alu_io_A),
    .io_B(alu_io_B),
    .io_width_type(alu_io_width_type),
    .io_alu_op(alu_io_alu_op),
    .io_out(alu_io_out)
  );
  ImmGenWire immGen ( // @[cpu.scala 303:28]
    .io_inst(immGen_io_inst),
    .io_sel(immGen_io_sel),
    .io_out(immGen_io_out)
  );
  Control control ( // @[cpu.scala 304:29]
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
    .io_alu_op(control_io_alu_op)
  );
  BrCondSimple brCond ( // @[cpu.scala 305:28]
    .io_rs1(brCond_io_rs1),
    .io_rs2(brCond_io_rs2),
    .io_br_type(brCond_io_br_type),
    .io_taken(brCond_io_taken)
  );
  RegisterFile regFile ( // @[cpu.scala 306:29]
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
  Mem mem_ ( // @[cpu.scala 307:25]
    .clock(mem__clock),
    .reset(mem__reset),
    .pc_addr(mem__pc_addr),
    .pc_data(mem__pc_data),
    .addr(mem__addr),
    .wdata(mem__wdata),
    .mask(mem__mask),
    .rdata(mem__rdata),
    .enable(mem__enable),
    .wen(mem__wen)
  );
  gpr_ptr gpr_ptr ( // @[cpu.scala 309:29]
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
  assign io_pc_debug = {{32'd0}, pc}; // @[cpu.scala 324:21]
  assign alu_io_A = control_io_wd_type == 2'h1 ? {{32'd0}, A_data[31:0]} : A_data; // @[cpu.scala 361:24]
  assign alu_io_B = _alu_io_A_T ? {{32'd0}, B_data[31:0]} : B_data; // @[cpu.scala 362:24]
  assign alu_io_width_type = control_io_wd_type; // @[cpu.scala 358:27]
  assign alu_io_alu_op = control_io_alu_op; // @[cpu.scala 357:23]
  assign immGen_io_inst = pc[2] & ~clock | ~pc[2] & clock ? mem__pc_data[63:32] : mem__pc_data[31:0]; // @[cpu.scala 352:21]
  assign immGen_io_sel = control_io_imm_sel; // @[cpu.scala 378:23]
  assign control_io_inst = pc[2] & ~clock | ~pc[2] & clock ? mem__pc_data[63:32] : mem__pc_data[31:0]; // @[cpu.scala 352:21]
  assign brCond_io_rs1 = regFile_io_rdata_0; // @[cpu.scala 383:23]
  assign brCond_io_rs2 = regFile_io_rdata_1; // @[cpu.scala 384:23]
  assign brCond_io_br_type = control_io_br_type; // @[cpu.scala 382:27]
  assign regFile_clock = clock;
  assign regFile_reset = reset;
  assign regFile_io_wen = _regFile_io_wen_T_4 & control_io_wb_en; // @[cpu.scala 397:72]
  assign regFile_io_waddr = instr[11:7]; // @[cpu.scala 372:22]
  assign regFile_io_wdata = _regFile_io_wen_T ? alu_out : _regFile_io_wdata_T_2; // @[cpu.scala 443:32]
  assign regFile_io_raddr_0 = instr[19:15]; // @[cpu.scala 370:22]
  assign regFile_io_raddr_1 = instr[24:20]; // @[cpu.scala 371:22]
  assign mem__clock = clock; // @[cpu.scala 322:22]
  assign mem__reset = reset; // @[cpu.scala 323:22]
  assign mem__pc_addr = {{32'd0}, pc}; // @[cpu.scala 351:24]
  assign mem__addr = alu_io_out; // @[cpu.scala 390:21]
  assign mem__wdata = _mem_io_wdata_T_2[63:0]; // @[cpu.scala 392:71]
  assign mem__mask = st_mask == 16'hff ? st_mask[7:0] : _mem_io_mask_T_3[7:0]; // @[cpu.scala 408:27]
  assign mem__enable = |control_io_st_type | |control_io_ld_type; // @[cpu.scala 388:49]
  assign mem__wen = |control_io_st_type; // @[cpu.scala 389:42]
  assign gpr_ptr_clock = clock; // @[cpu.scala 320:26]
  assign gpr_ptr_reset = reset; // @[cpu.scala 321:26]
  assign gpr_ptr_regfile_0 = 64'h0; // @[cpu.scala 315:41]
  assign gpr_ptr_regfile_1 = regFile_io_rdata_4; // @[cpu.scala 315:41]
  assign gpr_ptr_regfile_2 = regFile_io_rdata_5; // @[cpu.scala 315:41]
  assign gpr_ptr_regfile_3 = regFile_io_rdata_6; // @[cpu.scala 315:41]
  assign gpr_ptr_regfile_4 = regFile_io_rdata_7; // @[cpu.scala 315:41]
  assign gpr_ptr_regfile_5 = regFile_io_rdata_8; // @[cpu.scala 315:41]
  assign gpr_ptr_regfile_6 = regFile_io_rdata_9; // @[cpu.scala 315:41]
  assign gpr_ptr_regfile_7 = regFile_io_rdata_10; // @[cpu.scala 315:41]
  assign gpr_ptr_regfile_8 = regFile_io_rdata_11; // @[cpu.scala 315:41]
  assign gpr_ptr_regfile_9 = regFile_io_rdata_12; // @[cpu.scala 315:41]
  assign gpr_ptr_regfile_10 = regFile_io_rdata_13; // @[cpu.scala 315:41]
  assign gpr_ptr_regfile_11 = regFile_io_rdata_14; // @[cpu.scala 315:41]
  assign gpr_ptr_regfile_12 = regFile_io_rdata_15; // @[cpu.scala 315:41]
  assign gpr_ptr_regfile_13 = regFile_io_rdata_16; // @[cpu.scala 315:41]
  assign gpr_ptr_regfile_14 = regFile_io_rdata_17; // @[cpu.scala 315:41]
  assign gpr_ptr_regfile_15 = regFile_io_rdata_18; // @[cpu.scala 315:41]
  assign gpr_ptr_regfile_16 = regFile_io_rdata_19; // @[cpu.scala 315:41]
  assign gpr_ptr_regfile_17 = regFile_io_rdata_20; // @[cpu.scala 315:41]
  assign gpr_ptr_regfile_18 = regFile_io_rdata_21; // @[cpu.scala 315:41]
  assign gpr_ptr_regfile_19 = regFile_io_rdata_22; // @[cpu.scala 315:41]
  assign gpr_ptr_regfile_20 = regFile_io_rdata_23; // @[cpu.scala 315:41]
  assign gpr_ptr_regfile_21 = regFile_io_rdata_24; // @[cpu.scala 315:41]
  assign gpr_ptr_regfile_22 = regFile_io_rdata_25; // @[cpu.scala 315:41]
  assign gpr_ptr_regfile_23 = regFile_io_rdata_26; // @[cpu.scala 315:41]
  assign gpr_ptr_regfile_24 = regFile_io_rdata_27; // @[cpu.scala 315:41]
  assign gpr_ptr_regfile_25 = regFile_io_rdata_28; // @[cpu.scala 315:41]
  assign gpr_ptr_regfile_26 = regFile_io_rdata_29; // @[cpu.scala 315:41]
  assign gpr_ptr_regfile_27 = regFile_io_rdata_30; // @[cpu.scala 315:41]
  assign gpr_ptr_regfile_28 = regFile_io_rdata_31; // @[cpu.scala 315:41]
  assign gpr_ptr_regfile_29 = regFile_io_rdata_32; // @[cpu.scala 315:41]
  assign gpr_ptr_regfile_30 = regFile_io_rdata_33; // @[cpu.scala 315:41]
  assign gpr_ptr_regfile_31 = regFile_io_rdata_34; // @[cpu.scala 315:41]
  always @(posedge clock) begin
    pc <= _GEN_0[31:0]; // @[cpu.scala 308:{25,25} 346:12]
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
  pc = _RAND_0[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule

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
  wire [63:0] _out_T_10 = $signed(_out_T_8) >>> shamt; // @[alu.scala 57:112]
  wire [63:0] _out_T_11 = io_A >> shamt; // @[alu.scala 58:42]
  wire [126:0] _GEN_1 = {{63'd0}, io_A}; // @[alu.scala 59:42]
  wire [126:0] _out_T_12 = _GEN_1 << shamt; // @[alu.scala 59:42]
  wire  _out_T_15 = $signed(io_A) < $signed(io_B); // @[alu.scala 60:49]
  wire  _out_T_16 = io_A < io_B; // @[alu.scala 61:43]
  wire [63:0] _out_T_17 = io_A & io_B; // @[alu.scala 62:42]
  wire [63:0] _out_T_18 = io_A | io_B; // @[alu.scala 63:41]
  wire [63:0] _out_T_19 = io_A ^ io_B; // @[alu.scala 64:42]
  wire [4:0] _GEN_0 = {{1'd0}, io_alu_op}; // @[Mux.scala 81:61]
  wire [63:0] _out_T_21 = 5'h0 == _GEN_0 ? _out_T_1 : io_B; // @[Mux.scala 81:58]
  wire [63:0] _out_T_23 = 5'h1 == _GEN_0 ? _out_T_3 : _out_T_21; // @[Mux.scala 81:58]
  wire [63:0] _out_T_25 = 5'h9 == _GEN_0 ? _out_T_10 : _out_T_23; // @[Mux.scala 81:58]
  wire [63:0] _out_T_27 = 5'h8 == _GEN_0 ? _out_T_11 : _out_T_25; // @[Mux.scala 81:58]
  wire [126:0] _out_T_29 = 5'h6 == _GEN_0 ? _out_T_12 : {{63'd0}, _out_T_27}; // @[Mux.scala 81:58]
  wire [126:0] _out_T_31 = 5'h5 == _GEN_0 ? {{126'd0}, _out_T_15} : _out_T_29; // @[Mux.scala 81:58]
  wire [126:0] _out_T_33 = 5'h7 == _GEN_0 ? {{126'd0}, _out_T_16} : _out_T_31; // @[Mux.scala 81:58]
  wire [126:0] _out_T_35 = 5'h2 == _GEN_0 ? {{63'd0}, _out_T_17} : _out_T_33; // @[Mux.scala 81:58]
  wire [126:0] _out_T_37 = 5'h3 == _GEN_0 ? {{63'd0}, _out_T_18} : _out_T_35; // @[Mux.scala 81:58]
  wire [126:0] _out_T_39 = 5'h4 == _GEN_0 ? {{63'd0}, _out_T_19} : _out_T_37; // @[Mux.scala 81:58]
  wire [126:0] _out_T_41 = 5'ha == _GEN_0 ? {{63'd0}, io_A} : _out_T_39; // @[Mux.scala 81:58]
  wire [63:0] out = _out_T_41[63:0];
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
  wire [63:0] Zimm = {59'h0,io_inst[19:15]}; // @[immGen.scala 26:56]
  wire [43:0] _io_out_T_1 = $signed(Iimm) & -44'sh2; // @[immGen.scala 31:22]
  wire [43:0] _io_out_T_3 = 3'h1 == io_sel ? $signed(Iimm) : $signed(_io_out_T_1); // @[Mux.scala 81:58]
  wire [43:0] _io_out_T_5 = 3'h2 == io_sel ? $signed(Simm) : $signed(_io_out_T_3); // @[Mux.scala 81:58]
  wire [44:0] _io_out_T_7 = 3'h5 == io_sel ? $signed(Bimm) : $signed({{1{_io_out_T_5[43]}},_io_out_T_5}); // @[Mux.scala 81:58]
  wire [63:0] _io_out_T_9 = 3'h3 == io_sel ? $signed(Uimm) : $signed({{19{_io_out_T_7[44]}},_io_out_T_7}); // @[Mux.scala 81:58]
  wire [63:0] _io_out_T_11 = 3'h4 == io_sel ? $signed({{11{Jimm[52]}},Jimm}) : $signed(_io_out_T_9); // @[Mux.scala 81:58]
  assign io_out = 3'h6 == io_sel ? $signed(Zimm) : $signed(_io_out_T_11); // @[immGen.scala 33:11]
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
  output [4:0]  io_alu_op
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
  wire  _ctrlSignals_T_103 = 32'h2001033 == _ctrlSignals_T_58; // @[Lookup.scala 31:38]
  wire  _ctrlSignals_T_105 = 32'h2003033 == _ctrlSignals_T_58; // @[Lookup.scala 31:38]
  wire  _ctrlSignals_T_107 = 32'h2002033 == _ctrlSignals_T_58; // @[Lookup.scala 31:38]
  wire  _ctrlSignals_T_109 = 32'h2004033 == _ctrlSignals_T_58; // @[Lookup.scala 31:38]
  wire  _ctrlSignals_T_111 = 32'h2005033 == _ctrlSignals_T_58; // @[Lookup.scala 31:38]
  wire  _ctrlSignals_T_113 = 32'h200403b == _ctrlSignals_T_58; // @[Lookup.scala 31:38]
  wire  _ctrlSignals_T_115 = 32'h200503b == _ctrlSignals_T_58; // @[Lookup.scala 31:38]
  wire  _ctrlSignals_T_117 = 32'h2006033 == _ctrlSignals_T_58; // @[Lookup.scala 31:38]
  wire  _ctrlSignals_T_119 = 32'h2007033 == _ctrlSignals_T_58; // @[Lookup.scala 31:38]
  wire  _ctrlSignals_T_121 = 32'h200603b == _ctrlSignals_T_58; // @[Lookup.scala 31:38]
  wire  _ctrlSignals_T_123 = 32'h200703b == _ctrlSignals_T_58; // @[Lookup.scala 31:38]
  wire  _ctrlSignals_T_125 = 32'h1073 == _ctrlSignals_T_6; // @[Lookup.scala 31:38]
  wire  _ctrlSignals_T_127 = 32'h2073 == _ctrlSignals_T_6; // @[Lookup.scala 31:38]
  wire  _ctrlSignals_T_129 = 32'h3073 == _ctrlSignals_T_6; // @[Lookup.scala 31:38]
  wire  _ctrlSignals_T_131 = 32'h5073 == _ctrlSignals_T_6; // @[Lookup.scala 31:38]
  wire  _ctrlSignals_T_133 = 32'h6073 == _ctrlSignals_T_6; // @[Lookup.scala 31:38]
  wire  _ctrlSignals_T_135 = 32'h7073 == _ctrlSignals_T_6; // @[Lookup.scala 31:38]
  wire  _ctrlSignals_T_137 = 32'h30200073 == io_inst; // @[Lookup.scala 31:38]
  wire  _ctrlSignals_T_139 = 32'h10200073 == io_inst; // @[Lookup.scala 31:38]
  wire  _ctrlSignals_T_141 = 32'h73 == io_inst; // @[Lookup.scala 31:38]
  wire  _ctrlSignals_T_143 = 32'h100073 == io_inst; // @[Lookup.scala 31:38]
  wire  _ctrlSignals_T_145 = 32'h100f == io_inst; // @[Lookup.scala 31:38]
  wire [1:0] _ctrlSignals_T_146 = _ctrlSignals_T_145 ? 2'h2 : 2'h0; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_147 = _ctrlSignals_T_143 ? 2'h0 : _ctrlSignals_T_146; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_148 = _ctrlSignals_T_141 ? 2'h0 : _ctrlSignals_T_147; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_149 = _ctrlSignals_T_139 ? 2'h3 : _ctrlSignals_T_148; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_150 = _ctrlSignals_T_137 ? 2'h3 : _ctrlSignals_T_149; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_151 = _ctrlSignals_T_135 ? 2'h2 : _ctrlSignals_T_150; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_152 = _ctrlSignals_T_133 ? 2'h2 : _ctrlSignals_T_151; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_153 = _ctrlSignals_T_131 ? 2'h2 : _ctrlSignals_T_152; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_154 = _ctrlSignals_T_129 ? 2'h2 : _ctrlSignals_T_153; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_155 = _ctrlSignals_T_127 ? 2'h2 : _ctrlSignals_T_154; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_156 = _ctrlSignals_T_125 ? 2'h2 : _ctrlSignals_T_155; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_157 = _ctrlSignals_T_123 ? 2'h0 : _ctrlSignals_T_156; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_158 = _ctrlSignals_T_121 ? 2'h0 : _ctrlSignals_T_157; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_159 = _ctrlSignals_T_119 ? 2'h0 : _ctrlSignals_T_158; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_160 = _ctrlSignals_T_117 ? 2'h0 : _ctrlSignals_T_159; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_161 = _ctrlSignals_T_115 ? 2'h0 : _ctrlSignals_T_160; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_162 = _ctrlSignals_T_113 ? 2'h0 : _ctrlSignals_T_161; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_163 = _ctrlSignals_T_111 ? 2'h0 : _ctrlSignals_T_162; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_164 = _ctrlSignals_T_109 ? 2'h0 : _ctrlSignals_T_163; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_165 = _ctrlSignals_T_107 ? 2'h0 : _ctrlSignals_T_164; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_166 = _ctrlSignals_T_105 ? 2'h0 : _ctrlSignals_T_165; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_167 = _ctrlSignals_T_103 ? 2'h0 : _ctrlSignals_T_166; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_168 = _ctrlSignals_T_101 ? 2'h0 : _ctrlSignals_T_167; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_169 = _ctrlSignals_T_99 ? 2'h0 : _ctrlSignals_T_168; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_170 = _ctrlSignals_T_97 ? 2'h0 : _ctrlSignals_T_169; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_171 = _ctrlSignals_T_95 ? 2'h0 : _ctrlSignals_T_170; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_172 = _ctrlSignals_T_93 ? 2'h0 : _ctrlSignals_T_171; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_173 = _ctrlSignals_T_91 ? 2'h0 : _ctrlSignals_T_172; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_174 = _ctrlSignals_T_89 ? 2'h0 : _ctrlSignals_T_173; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_175 = _ctrlSignals_T_87 ? 2'h0 : _ctrlSignals_T_174; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_176 = _ctrlSignals_T_85 ? 2'h0 : _ctrlSignals_T_175; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_177 = _ctrlSignals_T_83 ? 2'h0 : _ctrlSignals_T_176; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_178 = _ctrlSignals_T_81 ? 2'h0 : _ctrlSignals_T_177; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_179 = _ctrlSignals_T_79 ? 2'h0 : _ctrlSignals_T_178; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_180 = _ctrlSignals_T_77 ? 2'h0 : _ctrlSignals_T_179; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_181 = _ctrlSignals_T_75 ? 2'h0 : _ctrlSignals_T_180; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_182 = _ctrlSignals_T_73 ? 2'h0 : _ctrlSignals_T_181; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_183 = _ctrlSignals_T_71 ? 2'h0 : _ctrlSignals_T_182; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_184 = _ctrlSignals_T_69 ? 2'h0 : _ctrlSignals_T_183; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_185 = _ctrlSignals_T_67 ? 2'h0 : _ctrlSignals_T_184; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_186 = _ctrlSignals_T_65 ? 2'h0 : _ctrlSignals_T_185; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_187 = _ctrlSignals_T_63 ? 2'h0 : _ctrlSignals_T_186; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_188 = _ctrlSignals_T_61 ? 2'h0 : _ctrlSignals_T_187; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_189 = _ctrlSignals_T_59 ? 2'h0 : _ctrlSignals_T_188; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_190 = _ctrlSignals_T_57 ? 2'h0 : _ctrlSignals_T_189; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_191 = _ctrlSignals_T_55 ? 2'h0 : _ctrlSignals_T_190; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_192 = _ctrlSignals_T_53 ? 2'h0 : _ctrlSignals_T_191; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_193 = _ctrlSignals_T_51 ? 2'h0 : _ctrlSignals_T_192; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_194 = _ctrlSignals_T_49 ? 2'h0 : _ctrlSignals_T_193; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_195 = _ctrlSignals_T_47 ? 2'h0 : _ctrlSignals_T_194; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_196 = _ctrlSignals_T_45 ? 2'h0 : _ctrlSignals_T_195; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_197 = _ctrlSignals_T_43 ? 2'h0 : _ctrlSignals_T_196; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_198 = _ctrlSignals_T_41 ? 2'h0 : _ctrlSignals_T_197; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_199 = _ctrlSignals_T_39 ? 2'h0 : _ctrlSignals_T_198; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_200 = _ctrlSignals_T_37 ? 2'h0 : _ctrlSignals_T_199; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_201 = _ctrlSignals_T_35 ? 2'h0 : _ctrlSignals_T_200; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_202 = _ctrlSignals_T_33 ? 2'h0 : _ctrlSignals_T_201; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_203 = _ctrlSignals_T_31 ? 2'h0 : _ctrlSignals_T_202; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_204 = _ctrlSignals_T_29 ? 2'h0 : _ctrlSignals_T_203; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_205 = _ctrlSignals_T_27 ? 2'h0 : _ctrlSignals_T_204; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_206 = _ctrlSignals_T_25 ? 2'h0 : _ctrlSignals_T_205; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_207 = _ctrlSignals_T_23 ? 2'h0 : _ctrlSignals_T_206; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_208 = _ctrlSignals_T_21 ? 2'h0 : _ctrlSignals_T_207; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_209 = _ctrlSignals_T_19 ? 2'h0 : _ctrlSignals_T_208; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_210 = _ctrlSignals_T_17 ? 2'h0 : _ctrlSignals_T_209; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_211 = _ctrlSignals_T_15 ? 2'h0 : _ctrlSignals_T_210; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_212 = _ctrlSignals_T_13 ? 2'h0 : _ctrlSignals_T_211; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_213 = _ctrlSignals_T_11 ? 2'h0 : _ctrlSignals_T_212; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_214 = _ctrlSignals_T_9 ? 2'h0 : _ctrlSignals_T_213; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_215 = _ctrlSignals_T_7 ? 2'h1 : _ctrlSignals_T_214; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_216 = _ctrlSignals_T_5 ? 2'h1 : _ctrlSignals_T_215; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_217 = _ctrlSignals_T_3 ? 2'h0 : _ctrlSignals_T_216; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_256 = _ctrlSignals_T_69 | (_ctrlSignals_T_71 | (_ctrlSignals_T_73 | (_ctrlSignals_T_75 | (
    _ctrlSignals_T_77 | (_ctrlSignals_T_79 | (_ctrlSignals_T_81 | (_ctrlSignals_T_83 | (_ctrlSignals_T_85 | (
    _ctrlSignals_T_87 | (_ctrlSignals_T_89 | (_ctrlSignals_T_91 | (_ctrlSignals_T_93 | (_ctrlSignals_T_95 | (
    _ctrlSignals_T_97 | (_ctrlSignals_T_99 | (_ctrlSignals_T_101 | (_ctrlSignals_T_103 | (_ctrlSignals_T_105 | (
    _ctrlSignals_T_107 | (_ctrlSignals_T_109 | (_ctrlSignals_T_111 | (_ctrlSignals_T_113 | (_ctrlSignals_T_115 | (
    _ctrlSignals_T_117 | (_ctrlSignals_T_119 | (_ctrlSignals_T_121 | (_ctrlSignals_T_123 | (_ctrlSignals_T_125 | (
    _ctrlSignals_T_127 | _ctrlSignals_T_129))))))))))))))))))))))))))))); // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_281 = _ctrlSignals_T_19 ? 1'h0 : _ctrlSignals_T_21 | (_ctrlSignals_T_23 | (_ctrlSignals_T_25 | (
    _ctrlSignals_T_27 | (_ctrlSignals_T_29 | (_ctrlSignals_T_31 | (_ctrlSignals_T_33 | (_ctrlSignals_T_35 | (
    _ctrlSignals_T_37 | (_ctrlSignals_T_39 | (_ctrlSignals_T_41 | (_ctrlSignals_T_43 | (_ctrlSignals_T_45 | (
    _ctrlSignals_T_47 | (_ctrlSignals_T_49 | (_ctrlSignals_T_51 | (_ctrlSignals_T_53 | (_ctrlSignals_T_55 | (
    _ctrlSignals_T_57 | (_ctrlSignals_T_59 | (_ctrlSignals_T_61 | (_ctrlSignals_T_63 | (_ctrlSignals_T_65 | (
    _ctrlSignals_T_67 | _ctrlSignals_T_256))))))))))))))))))))))); // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_282 = _ctrlSignals_T_17 ? 1'h0 : _ctrlSignals_T_281; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_283 = _ctrlSignals_T_15 ? 1'h0 : _ctrlSignals_T_282; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_284 = _ctrlSignals_T_13 ? 1'h0 : _ctrlSignals_T_283; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_285 = _ctrlSignals_T_11 ? 1'h0 : _ctrlSignals_T_284; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_286 = _ctrlSignals_T_9 ? 1'h0 : _ctrlSignals_T_285; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_288 = _ctrlSignals_T_5 ? 1'h0 : _ctrlSignals_T_7 | _ctrlSignals_T_286; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_289 = _ctrlSignals_T_3 ? 1'h0 : _ctrlSignals_T_288; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_329 = _ctrlSignals_T_67 ? 1'h0 : _ctrlSignals_T_69 | (_ctrlSignals_T_71 | (_ctrlSignals_T_73 | (
    _ctrlSignals_T_75 | (_ctrlSignals_T_77 | (_ctrlSignals_T_79 | (_ctrlSignals_T_81 | (_ctrlSignals_T_83 | (
    _ctrlSignals_T_85 | (_ctrlSignals_T_87 | (_ctrlSignals_T_89 | (_ctrlSignals_T_91 | (_ctrlSignals_T_93 | (
    _ctrlSignals_T_95 | (_ctrlSignals_T_97 | (_ctrlSignals_T_99 | (_ctrlSignals_T_101 | (_ctrlSignals_T_103 | (
    _ctrlSignals_T_105 | (_ctrlSignals_T_107 | (_ctrlSignals_T_109 | (_ctrlSignals_T_111 | (_ctrlSignals_T_113 | (
    _ctrlSignals_T_115 | (_ctrlSignals_T_117 | (_ctrlSignals_T_119 | (_ctrlSignals_T_121 | _ctrlSignals_T_123)))))))))))
    ))))))))))))))); // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_330 = _ctrlSignals_T_65 ? 1'h0 : _ctrlSignals_T_329; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_331 = _ctrlSignals_T_63 ? 1'h0 : _ctrlSignals_T_330; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_332 = _ctrlSignals_T_61 ? 1'h0 : _ctrlSignals_T_331; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_333 = _ctrlSignals_T_59 ? 1'h0 : _ctrlSignals_T_332; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_334 = _ctrlSignals_T_57 ? 1'h0 : _ctrlSignals_T_333; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_335 = _ctrlSignals_T_55 ? 1'h0 : _ctrlSignals_T_334; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_336 = _ctrlSignals_T_53 ? 1'h0 : _ctrlSignals_T_335; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_337 = _ctrlSignals_T_51 ? 1'h0 : _ctrlSignals_T_336; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_338 = _ctrlSignals_T_49 ? 1'h0 : _ctrlSignals_T_337; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_339 = _ctrlSignals_T_47 ? 1'h0 : _ctrlSignals_T_338; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_340 = _ctrlSignals_T_45 ? 1'h0 : _ctrlSignals_T_339; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_341 = _ctrlSignals_T_43 ? 1'h0 : _ctrlSignals_T_340; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_342 = _ctrlSignals_T_41 ? 1'h0 : _ctrlSignals_T_341; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_343 = _ctrlSignals_T_39 ? 1'h0 : _ctrlSignals_T_342; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_344 = _ctrlSignals_T_37 ? 1'h0 : _ctrlSignals_T_343; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_345 = _ctrlSignals_T_35 ? 1'h0 : _ctrlSignals_T_344; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_346 = _ctrlSignals_T_33 ? 1'h0 : _ctrlSignals_T_345; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_347 = _ctrlSignals_T_31 ? 1'h0 : _ctrlSignals_T_346; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_348 = _ctrlSignals_T_29 ? 1'h0 : _ctrlSignals_T_347; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_349 = _ctrlSignals_T_27 ? 1'h0 : _ctrlSignals_T_348; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_350 = _ctrlSignals_T_25 ? 1'h0 : _ctrlSignals_T_349; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_351 = _ctrlSignals_T_23 ? 1'h0 : _ctrlSignals_T_350; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_352 = _ctrlSignals_T_21 ? 1'h0 : _ctrlSignals_T_351; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_353 = _ctrlSignals_T_19 ? 1'h0 : _ctrlSignals_T_352; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_354 = _ctrlSignals_T_17 ? 1'h0 : _ctrlSignals_T_353; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_355 = _ctrlSignals_T_15 ? 1'h0 : _ctrlSignals_T_354; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_356 = _ctrlSignals_T_13 ? 1'h0 : _ctrlSignals_T_355; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_357 = _ctrlSignals_T_11 ? 1'h0 : _ctrlSignals_T_356; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_358 = _ctrlSignals_T_9 ? 1'h0 : _ctrlSignals_T_357; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_359 = _ctrlSignals_T_7 ? 1'h0 : _ctrlSignals_T_358; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_360 = _ctrlSignals_T_5 ? 1'h0 : _ctrlSignals_T_359; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_361 = _ctrlSignals_T_3 ? 1'h0 : _ctrlSignals_T_360; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_373 = _ctrlSignals_T_123 ? 2'h1 : 2'h0; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_374 = _ctrlSignals_T_121 ? 2'h1 : _ctrlSignals_T_373; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_375 = _ctrlSignals_T_119 ? 2'h0 : _ctrlSignals_T_374; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_376 = _ctrlSignals_T_117 ? 2'h0 : _ctrlSignals_T_375; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_377 = _ctrlSignals_T_115 ? 2'h1 : _ctrlSignals_T_376; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_378 = _ctrlSignals_T_113 ? 2'h1 : _ctrlSignals_T_377; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_379 = _ctrlSignals_T_111 ? 2'h0 : _ctrlSignals_T_378; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_380 = _ctrlSignals_T_109 ? 2'h0 : _ctrlSignals_T_379; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_381 = _ctrlSignals_T_107 ? 2'h0 : _ctrlSignals_T_380; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_382 = _ctrlSignals_T_105 ? 2'h0 : _ctrlSignals_T_381; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_383 = _ctrlSignals_T_103 ? 2'h0 : _ctrlSignals_T_382; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_384 = _ctrlSignals_T_101 ? 2'h1 : _ctrlSignals_T_383; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_385 = _ctrlSignals_T_99 ? 2'h0 : _ctrlSignals_T_384; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_386 = _ctrlSignals_T_97 ? 2'h0 : _ctrlSignals_T_385; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_387 = _ctrlSignals_T_95 ? 2'h0 : _ctrlSignals_T_386; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_388 = _ctrlSignals_T_93 ? 2'h1 : _ctrlSignals_T_387; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_389 = _ctrlSignals_T_91 ? 2'h0 : _ctrlSignals_T_388; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_390 = _ctrlSignals_T_89 ? 2'h1 : _ctrlSignals_T_389; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_391 = _ctrlSignals_T_87 ? 2'h0 : _ctrlSignals_T_390; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_392 = _ctrlSignals_T_85 ? 2'h0 : _ctrlSignals_T_391; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_393 = _ctrlSignals_T_83 ? 2'h0 : _ctrlSignals_T_392; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_394 = _ctrlSignals_T_81 ? 2'h0 : _ctrlSignals_T_393; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_395 = _ctrlSignals_T_79 ? 2'h1 : _ctrlSignals_T_394; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_396 = _ctrlSignals_T_77 ? 2'h0 : _ctrlSignals_T_395; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_397 = _ctrlSignals_T_75 ? 2'h1 : _ctrlSignals_T_396; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_398 = _ctrlSignals_T_73 ? 2'h0 : _ctrlSignals_T_397; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_399 = _ctrlSignals_T_71 ? 2'h1 : _ctrlSignals_T_398; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_400 = _ctrlSignals_T_69 ? 2'h0 : _ctrlSignals_T_399; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_401 = _ctrlSignals_T_67 ? 2'h1 : _ctrlSignals_T_400; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_402 = _ctrlSignals_T_65 ? 2'h0 : _ctrlSignals_T_401; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_403 = _ctrlSignals_T_63 ? 2'h1 : _ctrlSignals_T_402; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_404 = _ctrlSignals_T_61 ? 2'h0 : _ctrlSignals_T_403; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_405 = _ctrlSignals_T_59 ? 2'h1 : _ctrlSignals_T_404; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_406 = _ctrlSignals_T_57 ? 2'h0 : _ctrlSignals_T_405; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_407 = _ctrlSignals_T_55 ? 2'h0 : _ctrlSignals_T_406; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_408 = _ctrlSignals_T_53 ? 2'h0 : _ctrlSignals_T_407; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_409 = _ctrlSignals_T_51 ? 2'h0 : _ctrlSignals_T_408; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_410 = _ctrlSignals_T_49 ? 2'h0 : _ctrlSignals_T_409; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_411 = _ctrlSignals_T_47 ? 2'h0 : _ctrlSignals_T_410; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_412 = _ctrlSignals_T_45 ? 2'h1 : _ctrlSignals_T_411; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_413 = _ctrlSignals_T_43 ? 2'h0 : _ctrlSignals_T_412; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_414 = _ctrlSignals_T_41 ? 2'h0 : _ctrlSignals_T_413; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_415 = _ctrlSignals_T_39 ? 2'h0 : _ctrlSignals_T_414; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_416 = _ctrlSignals_T_37 ? 2'h0 : _ctrlSignals_T_415; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_417 = _ctrlSignals_T_35 ? 2'h0 : _ctrlSignals_T_416; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_418 = _ctrlSignals_T_33 ? 2'h0 : _ctrlSignals_T_417; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_419 = _ctrlSignals_T_31 ? 2'h0 : _ctrlSignals_T_418; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_420 = _ctrlSignals_T_29 ? 2'h0 : _ctrlSignals_T_419; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_421 = _ctrlSignals_T_27 ? 2'h0 : _ctrlSignals_T_420; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_422 = _ctrlSignals_T_25 ? 2'h0 : _ctrlSignals_T_421; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_423 = _ctrlSignals_T_23 ? 2'h0 : _ctrlSignals_T_422; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_424 = _ctrlSignals_T_21 ? 2'h0 : _ctrlSignals_T_423; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_425 = _ctrlSignals_T_19 ? 2'h0 : _ctrlSignals_T_424; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_426 = _ctrlSignals_T_17 ? 2'h0 : _ctrlSignals_T_425; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_427 = _ctrlSignals_T_15 ? 2'h0 : _ctrlSignals_T_426; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_428 = _ctrlSignals_T_13 ? 2'h0 : _ctrlSignals_T_427; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_429 = _ctrlSignals_T_11 ? 2'h0 : _ctrlSignals_T_428; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_430 = _ctrlSignals_T_9 ? 2'h0 : _ctrlSignals_T_429; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_431 = _ctrlSignals_T_7 ? 2'h0 : _ctrlSignals_T_430; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_432 = _ctrlSignals_T_5 ? 2'h0 : _ctrlSignals_T_431; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_433 = _ctrlSignals_T_3 ? 2'h0 : _ctrlSignals_T_432; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_434 = _ctrlSignals_T_145 ? 3'h0 : 3'h3; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_435 = _ctrlSignals_T_143 ? 3'h0 : _ctrlSignals_T_434; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_436 = _ctrlSignals_T_141 ? 3'h0 : _ctrlSignals_T_435; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_437 = _ctrlSignals_T_139 ? 3'h0 : _ctrlSignals_T_436; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_438 = _ctrlSignals_T_137 ? 3'h0 : _ctrlSignals_T_437; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_439 = _ctrlSignals_T_135 ? 3'h6 : _ctrlSignals_T_438; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_440 = _ctrlSignals_T_133 ? 3'h6 : _ctrlSignals_T_439; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_441 = _ctrlSignals_T_131 ? 3'h6 : _ctrlSignals_T_440; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_442 = _ctrlSignals_T_129 ? 3'h0 : _ctrlSignals_T_441; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_443 = _ctrlSignals_T_127 ? 3'h0 : _ctrlSignals_T_442; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_444 = _ctrlSignals_T_125 ? 3'h0 : _ctrlSignals_T_443; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_445 = _ctrlSignals_T_123 ? 3'h0 : _ctrlSignals_T_444; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_446 = _ctrlSignals_T_121 ? 3'h0 : _ctrlSignals_T_445; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_447 = _ctrlSignals_T_119 ? 3'h0 : _ctrlSignals_T_446; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_448 = _ctrlSignals_T_117 ? 3'h0 : _ctrlSignals_T_447; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_449 = _ctrlSignals_T_115 ? 3'h0 : _ctrlSignals_T_448; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_450 = _ctrlSignals_T_113 ? 3'h0 : _ctrlSignals_T_449; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_451 = _ctrlSignals_T_111 ? 3'h0 : _ctrlSignals_T_450; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_452 = _ctrlSignals_T_109 ? 3'h0 : _ctrlSignals_T_451; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_453 = _ctrlSignals_T_107 ? 3'h0 : _ctrlSignals_T_452; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_454 = _ctrlSignals_T_105 ? 3'h0 : _ctrlSignals_T_453; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_455 = _ctrlSignals_T_103 ? 3'h0 : _ctrlSignals_T_454; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_456 = _ctrlSignals_T_101 ? 3'h0 : _ctrlSignals_T_455; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_457 = _ctrlSignals_T_99 ? 3'h0 : _ctrlSignals_T_456; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_458 = _ctrlSignals_T_97 ? 3'h0 : _ctrlSignals_T_457; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_459 = _ctrlSignals_T_95 ? 3'h0 : _ctrlSignals_T_458; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_460 = _ctrlSignals_T_93 ? 3'h0 : _ctrlSignals_T_459; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_461 = _ctrlSignals_T_91 ? 3'h0 : _ctrlSignals_T_460; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_462 = _ctrlSignals_T_89 ? 3'h0 : _ctrlSignals_T_461; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_463 = _ctrlSignals_T_87 ? 3'h0 : _ctrlSignals_T_462; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_464 = _ctrlSignals_T_85 ? 3'h0 : _ctrlSignals_T_463; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_465 = _ctrlSignals_T_83 ? 3'h0 : _ctrlSignals_T_464; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_466 = _ctrlSignals_T_81 ? 3'h0 : _ctrlSignals_T_465; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_467 = _ctrlSignals_T_79 ? 3'h0 : _ctrlSignals_T_466; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_468 = _ctrlSignals_T_77 ? 3'h0 : _ctrlSignals_T_467; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_469 = _ctrlSignals_T_75 ? 3'h0 : _ctrlSignals_T_468; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_470 = _ctrlSignals_T_73 ? 3'h0 : _ctrlSignals_T_469; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_471 = _ctrlSignals_T_71 ? 3'h0 : _ctrlSignals_T_470; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_472 = _ctrlSignals_T_69 ? 3'h0 : _ctrlSignals_T_471; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_473 = _ctrlSignals_T_67 ? 3'h1 : _ctrlSignals_T_472; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_474 = _ctrlSignals_T_65 ? 3'h1 : _ctrlSignals_T_473; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_475 = _ctrlSignals_T_63 ? 3'h1 : _ctrlSignals_T_474; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_476 = _ctrlSignals_T_61 ? 3'h1 : _ctrlSignals_T_475; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_477 = _ctrlSignals_T_59 ? 3'h1 : _ctrlSignals_T_476; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_478 = _ctrlSignals_T_57 ? 3'h1 : _ctrlSignals_T_477; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_479 = _ctrlSignals_T_55 ? 3'h1 : _ctrlSignals_T_478; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_480 = _ctrlSignals_T_53 ? 3'h1 : _ctrlSignals_T_479; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_481 = _ctrlSignals_T_51 ? 3'h1 : _ctrlSignals_T_480; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_482 = _ctrlSignals_T_49 ? 3'h1 : _ctrlSignals_T_481; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_483 = _ctrlSignals_T_47 ? 3'h1 : _ctrlSignals_T_482; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_484 = _ctrlSignals_T_45 ? 3'h1 : _ctrlSignals_T_483; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_485 = _ctrlSignals_T_43 ? 3'h1 : _ctrlSignals_T_484; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_486 = _ctrlSignals_T_41 ? 3'h2 : _ctrlSignals_T_485; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_487 = _ctrlSignals_T_39 ? 3'h2 : _ctrlSignals_T_486; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_488 = _ctrlSignals_T_37 ? 3'h2 : _ctrlSignals_T_487; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_489 = _ctrlSignals_T_35 ? 3'h2 : _ctrlSignals_T_488; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_490 = _ctrlSignals_T_33 ? 3'h1 : _ctrlSignals_T_489; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_491 = _ctrlSignals_T_31 ? 3'h1 : _ctrlSignals_T_490; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_492 = _ctrlSignals_T_29 ? 3'h1 : _ctrlSignals_T_491; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_493 = _ctrlSignals_T_27 ? 3'h1 : _ctrlSignals_T_492; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_494 = _ctrlSignals_T_25 ? 3'h1 : _ctrlSignals_T_493; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_495 = _ctrlSignals_T_23 ? 3'h1 : _ctrlSignals_T_494; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_496 = _ctrlSignals_T_21 ? 3'h1 : _ctrlSignals_T_495; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_497 = _ctrlSignals_T_19 ? 3'h5 : _ctrlSignals_T_496; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_498 = _ctrlSignals_T_17 ? 3'h5 : _ctrlSignals_T_497; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_499 = _ctrlSignals_T_15 ? 3'h5 : _ctrlSignals_T_498; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_500 = _ctrlSignals_T_13 ? 3'h5 : _ctrlSignals_T_499; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_501 = _ctrlSignals_T_11 ? 3'h5 : _ctrlSignals_T_500; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_502 = _ctrlSignals_T_9 ? 3'h5 : _ctrlSignals_T_501; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_503 = _ctrlSignals_T_7 ? 3'h1 : _ctrlSignals_T_502; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_504 = _ctrlSignals_T_5 ? 3'h4 : _ctrlSignals_T_503; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_505 = _ctrlSignals_T_3 ? 3'h3 : _ctrlSignals_T_504; // @[Lookup.scala 34:39]
  wire [4:0] _ctrlSignals_T_506 = _ctrlSignals_T_145 ? 5'h11 : 5'hb; // @[Lookup.scala 34:39]
  wire [4:0] _ctrlSignals_T_507 = _ctrlSignals_T_143 ? 5'h11 : _ctrlSignals_T_506; // @[Lookup.scala 34:39]
  wire [4:0] _ctrlSignals_T_508 = _ctrlSignals_T_141 ? 5'h11 : _ctrlSignals_T_507; // @[Lookup.scala 34:39]
  wire [4:0] _ctrlSignals_T_509 = _ctrlSignals_T_139 ? 5'h11 : _ctrlSignals_T_508; // @[Lookup.scala 34:39]
  wire [4:0] _ctrlSignals_T_510 = _ctrlSignals_T_137 ? 5'h11 : _ctrlSignals_T_509; // @[Lookup.scala 34:39]
  wire [4:0] _ctrlSignals_T_511 = _ctrlSignals_T_135 ? 5'h11 : _ctrlSignals_T_510; // @[Lookup.scala 34:39]
  wire [4:0] _ctrlSignals_T_512 = _ctrlSignals_T_133 ? 5'h11 : _ctrlSignals_T_511; // @[Lookup.scala 34:39]
  wire [4:0] _ctrlSignals_T_513 = _ctrlSignals_T_131 ? 5'h11 : _ctrlSignals_T_512; // @[Lookup.scala 34:39]
  wire [4:0] _ctrlSignals_T_514 = _ctrlSignals_T_129 ? 5'ha : _ctrlSignals_T_513; // @[Lookup.scala 34:39]
  wire [4:0] _ctrlSignals_T_515 = _ctrlSignals_T_127 ? 5'ha : _ctrlSignals_T_514; // @[Lookup.scala 34:39]
  wire [4:0] _ctrlSignals_T_516 = _ctrlSignals_T_125 ? 5'ha : _ctrlSignals_T_515; // @[Lookup.scala 34:39]
  wire [4:0] _ctrlSignals_T_517 = _ctrlSignals_T_123 ? 5'h10 : _ctrlSignals_T_516; // @[Lookup.scala 34:39]
  wire [4:0] _ctrlSignals_T_518 = _ctrlSignals_T_121 ? 5'he : _ctrlSignals_T_517; // @[Lookup.scala 34:39]
  wire [4:0] _ctrlSignals_T_519 = _ctrlSignals_T_119 ? 5'h10 : _ctrlSignals_T_518; // @[Lookup.scala 34:39]
  wire [4:0] _ctrlSignals_T_520 = _ctrlSignals_T_117 ? 5'he : _ctrlSignals_T_519; // @[Lookup.scala 34:39]
  wire [4:0] _ctrlSignals_T_521 = _ctrlSignals_T_115 ? 5'hf : _ctrlSignals_T_520; // @[Lookup.scala 34:39]
  wire [4:0] _ctrlSignals_T_522 = _ctrlSignals_T_113 ? 5'hd : _ctrlSignals_T_521; // @[Lookup.scala 34:39]
  wire [4:0] _ctrlSignals_T_523 = _ctrlSignals_T_111 ? 5'hf : _ctrlSignals_T_522; // @[Lookup.scala 34:39]
  wire [4:0] _ctrlSignals_T_524 = _ctrlSignals_T_109 ? 5'hd : _ctrlSignals_T_523; // @[Lookup.scala 34:39]
  wire [4:0] _ctrlSignals_T_525 = _ctrlSignals_T_107 ? 5'hc : _ctrlSignals_T_524; // @[Lookup.scala 34:39]
  wire [4:0] _ctrlSignals_T_526 = _ctrlSignals_T_105 ? 5'hc : _ctrlSignals_T_525; // @[Lookup.scala 34:39]
  wire [4:0] _ctrlSignals_T_527 = _ctrlSignals_T_103 ? 5'hc : _ctrlSignals_T_526; // @[Lookup.scala 34:39]
  wire [4:0] _ctrlSignals_T_528 = _ctrlSignals_T_101 ? 5'hc : _ctrlSignals_T_527; // @[Lookup.scala 34:39]
  wire [4:0] _ctrlSignals_T_529 = _ctrlSignals_T_99 ? 5'hc : _ctrlSignals_T_528; // @[Lookup.scala 34:39]
  wire [4:0] _ctrlSignals_T_530 = _ctrlSignals_T_97 ? 5'h2 : _ctrlSignals_T_529; // @[Lookup.scala 34:39]
  wire [4:0] _ctrlSignals_T_531 = _ctrlSignals_T_95 ? 5'h3 : _ctrlSignals_T_530; // @[Lookup.scala 34:39]
  wire [4:0] _ctrlSignals_T_532 = _ctrlSignals_T_93 ? 5'h9 : _ctrlSignals_T_531; // @[Lookup.scala 34:39]
  wire [4:0] _ctrlSignals_T_533 = _ctrlSignals_T_91 ? 5'h9 : _ctrlSignals_T_532; // @[Lookup.scala 34:39]
  wire [4:0] _ctrlSignals_T_534 = _ctrlSignals_T_89 ? 5'h8 : _ctrlSignals_T_533; // @[Lookup.scala 34:39]
  wire [4:0] _ctrlSignals_T_535 = _ctrlSignals_T_87 ? 5'h8 : _ctrlSignals_T_534; // @[Lookup.scala 34:39]
  wire [4:0] _ctrlSignals_T_536 = _ctrlSignals_T_85 ? 5'h4 : _ctrlSignals_T_535; // @[Lookup.scala 34:39]
  wire [4:0] _ctrlSignals_T_537 = _ctrlSignals_T_83 ? 5'h7 : _ctrlSignals_T_536; // @[Lookup.scala 34:39]
  wire [4:0] _ctrlSignals_T_538 = _ctrlSignals_T_81 ? 5'h5 : _ctrlSignals_T_537; // @[Lookup.scala 34:39]
  wire [4:0] _ctrlSignals_T_539 = _ctrlSignals_T_79 ? 5'h6 : _ctrlSignals_T_538; // @[Lookup.scala 34:39]
  wire [4:0] _ctrlSignals_T_540 = _ctrlSignals_T_77 ? 5'h6 : _ctrlSignals_T_539; // @[Lookup.scala 34:39]
  wire [4:0] _ctrlSignals_T_541 = _ctrlSignals_T_75 ? 5'h1 : _ctrlSignals_T_540; // @[Lookup.scala 34:39]
  wire [4:0] _ctrlSignals_T_542 = _ctrlSignals_T_73 ? 5'h1 : _ctrlSignals_T_541; // @[Lookup.scala 34:39]
  wire [4:0] _ctrlSignals_T_543 = _ctrlSignals_T_71 ? 5'h0 : _ctrlSignals_T_542; // @[Lookup.scala 34:39]
  wire [4:0] _ctrlSignals_T_544 = _ctrlSignals_T_69 ? 5'h0 : _ctrlSignals_T_543; // @[Lookup.scala 34:39]
  wire [4:0] _ctrlSignals_T_545 = _ctrlSignals_T_67 ? 5'h9 : _ctrlSignals_T_544; // @[Lookup.scala 34:39]
  wire [4:0] _ctrlSignals_T_546 = _ctrlSignals_T_65 ? 5'h9 : _ctrlSignals_T_545; // @[Lookup.scala 34:39]
  wire [4:0] _ctrlSignals_T_547 = _ctrlSignals_T_63 ? 5'h8 : _ctrlSignals_T_546; // @[Lookup.scala 34:39]
  wire [4:0] _ctrlSignals_T_548 = _ctrlSignals_T_61 ? 5'h8 : _ctrlSignals_T_547; // @[Lookup.scala 34:39]
  wire [4:0] _ctrlSignals_T_549 = _ctrlSignals_T_59 ? 5'h6 : _ctrlSignals_T_548; // @[Lookup.scala 34:39]
  wire [4:0] _ctrlSignals_T_550 = _ctrlSignals_T_57 ? 5'h6 : _ctrlSignals_T_549; // @[Lookup.scala 34:39]
  wire [4:0] _ctrlSignals_T_551 = _ctrlSignals_T_55 ? 5'h2 : _ctrlSignals_T_550; // @[Lookup.scala 34:39]
  wire [4:0] _ctrlSignals_T_552 = _ctrlSignals_T_53 ? 5'h3 : _ctrlSignals_T_551; // @[Lookup.scala 34:39]
  wire [4:0] _ctrlSignals_T_553 = _ctrlSignals_T_51 ? 5'h4 : _ctrlSignals_T_552; // @[Lookup.scala 34:39]
  wire [4:0] _ctrlSignals_T_554 = _ctrlSignals_T_49 ? 5'h7 : _ctrlSignals_T_553; // @[Lookup.scala 34:39]
  wire [4:0] _ctrlSignals_T_555 = _ctrlSignals_T_47 ? 5'h5 : _ctrlSignals_T_554; // @[Lookup.scala 34:39]
  wire [4:0] _ctrlSignals_T_556 = _ctrlSignals_T_45 ? 5'h0 : _ctrlSignals_T_555; // @[Lookup.scala 34:39]
  wire [4:0] _ctrlSignals_T_557 = _ctrlSignals_T_43 ? 5'h0 : _ctrlSignals_T_556; // @[Lookup.scala 34:39]
  wire [4:0] _ctrlSignals_T_558 = _ctrlSignals_T_41 ? 5'h0 : _ctrlSignals_T_557; // @[Lookup.scala 34:39]
  wire [4:0] _ctrlSignals_T_559 = _ctrlSignals_T_39 ? 5'h0 : _ctrlSignals_T_558; // @[Lookup.scala 34:39]
  wire [4:0] _ctrlSignals_T_560 = _ctrlSignals_T_37 ? 5'h0 : _ctrlSignals_T_559; // @[Lookup.scala 34:39]
  wire [4:0] _ctrlSignals_T_561 = _ctrlSignals_T_35 ? 5'h0 : _ctrlSignals_T_560; // @[Lookup.scala 34:39]
  wire [4:0] _ctrlSignals_T_562 = _ctrlSignals_T_33 ? 5'h0 : _ctrlSignals_T_561; // @[Lookup.scala 34:39]
  wire [4:0] _ctrlSignals_T_563 = _ctrlSignals_T_31 ? 5'h0 : _ctrlSignals_T_562; // @[Lookup.scala 34:39]
  wire [4:0] _ctrlSignals_T_564 = _ctrlSignals_T_29 ? 5'h0 : _ctrlSignals_T_563; // @[Lookup.scala 34:39]
  wire [4:0] _ctrlSignals_T_565 = _ctrlSignals_T_27 ? 5'h0 : _ctrlSignals_T_564; // @[Lookup.scala 34:39]
  wire [4:0] _ctrlSignals_T_566 = _ctrlSignals_T_25 ? 5'h0 : _ctrlSignals_T_565; // @[Lookup.scala 34:39]
  wire [4:0] _ctrlSignals_T_567 = _ctrlSignals_T_23 ? 5'h0 : _ctrlSignals_T_566; // @[Lookup.scala 34:39]
  wire [4:0] _ctrlSignals_T_568 = _ctrlSignals_T_21 ? 5'h0 : _ctrlSignals_T_567; // @[Lookup.scala 34:39]
  wire [4:0] _ctrlSignals_T_569 = _ctrlSignals_T_19 ? 5'h0 : _ctrlSignals_T_568; // @[Lookup.scala 34:39]
  wire [4:0] _ctrlSignals_T_570 = _ctrlSignals_T_17 ? 5'h0 : _ctrlSignals_T_569; // @[Lookup.scala 34:39]
  wire [4:0] _ctrlSignals_T_571 = _ctrlSignals_T_15 ? 5'h0 : _ctrlSignals_T_570; // @[Lookup.scala 34:39]
  wire [4:0] _ctrlSignals_T_572 = _ctrlSignals_T_13 ? 5'h0 : _ctrlSignals_T_571; // @[Lookup.scala 34:39]
  wire [4:0] _ctrlSignals_T_573 = _ctrlSignals_T_11 ? 5'h0 : _ctrlSignals_T_572; // @[Lookup.scala 34:39]
  wire [4:0] _ctrlSignals_T_574 = _ctrlSignals_T_9 ? 5'h0 : _ctrlSignals_T_573; // @[Lookup.scala 34:39]
  wire [4:0] _ctrlSignals_T_575 = _ctrlSignals_T_7 ? 5'h0 : _ctrlSignals_T_574; // @[Lookup.scala 34:39]
  wire [4:0] _ctrlSignals_T_576 = _ctrlSignals_T_5 ? 5'h0 : _ctrlSignals_T_575; // @[Lookup.scala 34:39]
  wire [4:0] _ctrlSignals_T_577 = _ctrlSignals_T_3 ? 5'h0 : _ctrlSignals_T_576; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_641 = _ctrlSignals_T_19 ? 3'h4 : 3'h0; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_642 = _ctrlSignals_T_17 ? 3'h1 : _ctrlSignals_T_641; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_643 = _ctrlSignals_T_15 ? 3'h5 : _ctrlSignals_T_642; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_644 = _ctrlSignals_T_13 ? 3'h2 : _ctrlSignals_T_643; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_645 = _ctrlSignals_T_11 ? 3'h6 : _ctrlSignals_T_644; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_646 = _ctrlSignals_T_9 ? 3'h3 : _ctrlSignals_T_645; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_647 = _ctrlSignals_T_7 ? 3'h0 : _ctrlSignals_T_646; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_648 = _ctrlSignals_T_5 ? 3'h0 : _ctrlSignals_T_647; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_649 = _ctrlSignals_T_3 ? 3'h0 : _ctrlSignals_T_648; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_702 = _ctrlSignals_T_41 ? 3'h4 : 3'h0; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_703 = _ctrlSignals_T_39 ? 3'h1 : _ctrlSignals_T_702; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_704 = _ctrlSignals_T_37 ? 3'h2 : _ctrlSignals_T_703; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_705 = _ctrlSignals_T_35 ? 3'h3 : _ctrlSignals_T_704; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_706 = _ctrlSignals_T_33 ? 3'h0 : _ctrlSignals_T_705; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_707 = _ctrlSignals_T_31 ? 3'h0 : _ctrlSignals_T_706; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_708 = _ctrlSignals_T_29 ? 3'h0 : _ctrlSignals_T_707; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_709 = _ctrlSignals_T_27 ? 3'h0 : _ctrlSignals_T_708; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_710 = _ctrlSignals_T_25 ? 3'h0 : _ctrlSignals_T_709; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_711 = _ctrlSignals_T_23 ? 3'h0 : _ctrlSignals_T_710; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_712 = _ctrlSignals_T_21 ? 3'h0 : _ctrlSignals_T_711; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_713 = _ctrlSignals_T_19 ? 3'h0 : _ctrlSignals_T_712; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_714 = _ctrlSignals_T_17 ? 3'h0 : _ctrlSignals_T_713; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_715 = _ctrlSignals_T_15 ? 3'h0 : _ctrlSignals_T_714; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_716 = _ctrlSignals_T_13 ? 3'h0 : _ctrlSignals_T_715; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_717 = _ctrlSignals_T_11 ? 3'h0 : _ctrlSignals_T_716; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_718 = _ctrlSignals_T_9 ? 3'h0 : _ctrlSignals_T_717; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_719 = _ctrlSignals_T_7 ? 3'h0 : _ctrlSignals_T_718; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_720 = _ctrlSignals_T_5 ? 3'h0 : _ctrlSignals_T_719; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_721 = _ctrlSignals_T_3 ? 3'h0 : _ctrlSignals_T_720; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_778 = _ctrlSignals_T_33 ? 3'h7 : 3'h0; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_779 = _ctrlSignals_T_31 ? 3'h6 : _ctrlSignals_T_778; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_780 = _ctrlSignals_T_29 ? 3'h4 : _ctrlSignals_T_779; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_781 = _ctrlSignals_T_27 ? 3'h5 : _ctrlSignals_T_780; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_782 = _ctrlSignals_T_25 ? 3'h1 : _ctrlSignals_T_781; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_783 = _ctrlSignals_T_23 ? 3'h2 : _ctrlSignals_T_782; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_784 = _ctrlSignals_T_21 ? 3'h3 : _ctrlSignals_T_783; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_785 = _ctrlSignals_T_19 ? 3'h0 : _ctrlSignals_T_784; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_786 = _ctrlSignals_T_17 ? 3'h0 : _ctrlSignals_T_785; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_787 = _ctrlSignals_T_15 ? 3'h0 : _ctrlSignals_T_786; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_788 = _ctrlSignals_T_13 ? 3'h0 : _ctrlSignals_T_787; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_789 = _ctrlSignals_T_11 ? 3'h0 : _ctrlSignals_T_788; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_790 = _ctrlSignals_T_9 ? 3'h0 : _ctrlSignals_T_789; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_791 = _ctrlSignals_T_7 ? 3'h0 : _ctrlSignals_T_790; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_792 = _ctrlSignals_T_5 ? 3'h0 : _ctrlSignals_T_791; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_793 = _ctrlSignals_T_3 ? 3'h0 : _ctrlSignals_T_792; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_795 = _ctrlSignals_T_143 ? 2'h3 : 2'h0; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_796 = _ctrlSignals_T_141 ? 2'h3 : _ctrlSignals_T_795; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_797 = _ctrlSignals_T_139 ? 2'h3 : _ctrlSignals_T_796; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_798 = _ctrlSignals_T_137 ? 2'h3 : _ctrlSignals_T_797; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_799 = _ctrlSignals_T_135 ? 2'h3 : _ctrlSignals_T_798; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_800 = _ctrlSignals_T_133 ? 2'h3 : _ctrlSignals_T_799; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_801 = _ctrlSignals_T_131 ? 2'h3 : _ctrlSignals_T_800; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_802 = _ctrlSignals_T_129 ? 2'h3 : _ctrlSignals_T_801; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_803 = _ctrlSignals_T_127 ? 2'h3 : _ctrlSignals_T_802; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_804 = _ctrlSignals_T_125 ? 2'h3 : _ctrlSignals_T_803; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_805 = _ctrlSignals_T_123 ? 2'h0 : _ctrlSignals_T_804; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_806 = _ctrlSignals_T_121 ? 2'h0 : _ctrlSignals_T_805; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_807 = _ctrlSignals_T_119 ? 2'h0 : _ctrlSignals_T_806; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_808 = _ctrlSignals_T_117 ? 2'h0 : _ctrlSignals_T_807; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_809 = _ctrlSignals_T_115 ? 2'h0 : _ctrlSignals_T_808; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_810 = _ctrlSignals_T_113 ? 2'h0 : _ctrlSignals_T_809; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_811 = _ctrlSignals_T_111 ? 2'h0 : _ctrlSignals_T_810; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_812 = _ctrlSignals_T_109 ? 2'h0 : _ctrlSignals_T_811; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_813 = _ctrlSignals_T_107 ? 2'h0 : _ctrlSignals_T_812; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_814 = _ctrlSignals_T_105 ? 2'h0 : _ctrlSignals_T_813; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_815 = _ctrlSignals_T_103 ? 2'h0 : _ctrlSignals_T_814; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_816 = _ctrlSignals_T_101 ? 2'h0 : _ctrlSignals_T_815; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_817 = _ctrlSignals_T_99 ? 2'h0 : _ctrlSignals_T_816; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_818 = _ctrlSignals_T_97 ? 2'h0 : _ctrlSignals_T_817; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_819 = _ctrlSignals_T_95 ? 2'h0 : _ctrlSignals_T_818; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_820 = _ctrlSignals_T_93 ? 2'h0 : _ctrlSignals_T_819; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_821 = _ctrlSignals_T_91 ? 2'h0 : _ctrlSignals_T_820; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_822 = _ctrlSignals_T_89 ? 2'h0 : _ctrlSignals_T_821; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_823 = _ctrlSignals_T_87 ? 2'h0 : _ctrlSignals_T_822; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_824 = _ctrlSignals_T_85 ? 2'h0 : _ctrlSignals_T_823; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_825 = _ctrlSignals_T_83 ? 2'h0 : _ctrlSignals_T_824; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_826 = _ctrlSignals_T_81 ? 2'h0 : _ctrlSignals_T_825; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_827 = _ctrlSignals_T_79 ? 2'h0 : _ctrlSignals_T_826; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_828 = _ctrlSignals_T_77 ? 2'h0 : _ctrlSignals_T_827; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_829 = _ctrlSignals_T_75 ? 2'h0 : _ctrlSignals_T_828; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_830 = _ctrlSignals_T_73 ? 2'h0 : _ctrlSignals_T_829; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_831 = _ctrlSignals_T_71 ? 2'h0 : _ctrlSignals_T_830; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_832 = _ctrlSignals_T_69 ? 2'h0 : _ctrlSignals_T_831; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_833 = _ctrlSignals_T_67 ? 2'h0 : _ctrlSignals_T_832; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_834 = _ctrlSignals_T_65 ? 2'h0 : _ctrlSignals_T_833; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_835 = _ctrlSignals_T_63 ? 2'h0 : _ctrlSignals_T_834; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_836 = _ctrlSignals_T_61 ? 2'h0 : _ctrlSignals_T_835; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_837 = _ctrlSignals_T_59 ? 2'h0 : _ctrlSignals_T_836; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_838 = _ctrlSignals_T_57 ? 2'h0 : _ctrlSignals_T_837; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_839 = _ctrlSignals_T_55 ? 2'h0 : _ctrlSignals_T_838; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_840 = _ctrlSignals_T_53 ? 2'h0 : _ctrlSignals_T_839; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_841 = _ctrlSignals_T_51 ? 2'h0 : _ctrlSignals_T_840; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_842 = _ctrlSignals_T_49 ? 2'h0 : _ctrlSignals_T_841; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_843 = _ctrlSignals_T_47 ? 2'h0 : _ctrlSignals_T_842; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_844 = _ctrlSignals_T_45 ? 2'h0 : _ctrlSignals_T_843; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_845 = _ctrlSignals_T_43 ? 2'h0 : _ctrlSignals_T_844; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_846 = _ctrlSignals_T_41 ? 2'h0 : _ctrlSignals_T_845; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_847 = _ctrlSignals_T_39 ? 2'h0 : _ctrlSignals_T_846; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_848 = _ctrlSignals_T_37 ? 2'h0 : _ctrlSignals_T_847; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_849 = _ctrlSignals_T_35 ? 2'h0 : _ctrlSignals_T_848; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_850 = _ctrlSignals_T_33 ? 2'h1 : _ctrlSignals_T_849; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_851 = _ctrlSignals_T_31 ? 2'h1 : _ctrlSignals_T_850; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_852 = _ctrlSignals_T_29 ? 2'h1 : _ctrlSignals_T_851; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_853 = _ctrlSignals_T_27 ? 2'h1 : _ctrlSignals_T_852; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_854 = _ctrlSignals_T_25 ? 2'h1 : _ctrlSignals_T_853; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_855 = _ctrlSignals_T_23 ? 2'h1 : _ctrlSignals_T_854; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_856 = _ctrlSignals_T_21 ? 2'h1 : _ctrlSignals_T_855; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_857 = _ctrlSignals_T_19 ? 2'h0 : _ctrlSignals_T_856; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_858 = _ctrlSignals_T_17 ? 2'h0 : _ctrlSignals_T_857; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_859 = _ctrlSignals_T_15 ? 2'h0 : _ctrlSignals_T_858; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_860 = _ctrlSignals_T_13 ? 2'h0 : _ctrlSignals_T_859; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_861 = _ctrlSignals_T_11 ? 2'h0 : _ctrlSignals_T_860; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_862 = _ctrlSignals_T_9 ? 2'h0 : _ctrlSignals_T_861; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_863 = _ctrlSignals_T_7 ? 2'h2 : _ctrlSignals_T_862; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_864 = _ctrlSignals_T_5 ? 2'h2 : _ctrlSignals_T_863; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_865 = _ctrlSignals_T_3 ? 2'h0 : _ctrlSignals_T_864; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_866 = _ctrlSignals_T_145 ? 1'h0 : 1'h1; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_867 = _ctrlSignals_T_143 ? 1'h0 : _ctrlSignals_T_866; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_868 = _ctrlSignals_T_141 ? 1'h0 : _ctrlSignals_T_867; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_869 = _ctrlSignals_T_139 ? 1'h0 : _ctrlSignals_T_868; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_870 = _ctrlSignals_T_137 ? 1'h0 : _ctrlSignals_T_869; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_900 = _ctrlSignals_T_77 | (_ctrlSignals_T_79 | (_ctrlSignals_T_81 | (_ctrlSignals_T_83 | (
    _ctrlSignals_T_85 | (_ctrlSignals_T_87 | (_ctrlSignals_T_89 | (_ctrlSignals_T_91 | (_ctrlSignals_T_93 | (
    _ctrlSignals_T_95 | (_ctrlSignals_T_97 | (_ctrlSignals_T_99 | (_ctrlSignals_T_101 | (_ctrlSignals_T_103 | (
    _ctrlSignals_T_105 | (_ctrlSignals_T_107 | (_ctrlSignals_T_109 | (_ctrlSignals_T_111 | (_ctrlSignals_T_113 | (
    _ctrlSignals_T_115 | (_ctrlSignals_T_117 | (_ctrlSignals_T_119 | (_ctrlSignals_T_121 | (_ctrlSignals_T_123 | (
    _ctrlSignals_T_125 | (_ctrlSignals_T_127 | (_ctrlSignals_T_129 | (_ctrlSignals_T_131 | (_ctrlSignals_T_133 | (
    _ctrlSignals_T_135 | _ctrlSignals_T_870))))))))))))))))))))))))))))); // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_918 = _ctrlSignals_T_41 ? 1'h0 : _ctrlSignals_T_43 | (_ctrlSignals_T_45 | (_ctrlSignals_T_47 | (
    _ctrlSignals_T_49 | (_ctrlSignals_T_51 | (_ctrlSignals_T_53 | (_ctrlSignals_T_55 | (_ctrlSignals_T_57 | (
    _ctrlSignals_T_59 | (_ctrlSignals_T_61 | (_ctrlSignals_T_63 | (_ctrlSignals_T_65 | (_ctrlSignals_T_67 | (
    _ctrlSignals_T_69 | (_ctrlSignals_T_71 | (_ctrlSignals_T_73 | (_ctrlSignals_T_75 | _ctrlSignals_T_900)))))))))))))))
    ); // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_919 = _ctrlSignals_T_39 ? 1'h0 : _ctrlSignals_T_918; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_920 = _ctrlSignals_T_37 ? 1'h0 : _ctrlSignals_T_919; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_921 = _ctrlSignals_T_35 ? 1'h0 : _ctrlSignals_T_920; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_929 = _ctrlSignals_T_19 ? 1'h0 : _ctrlSignals_T_21 | (_ctrlSignals_T_23 | (_ctrlSignals_T_25 | (
    _ctrlSignals_T_27 | (_ctrlSignals_T_29 | (_ctrlSignals_T_31 | (_ctrlSignals_T_33 | _ctrlSignals_T_921)))))); // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_930 = _ctrlSignals_T_17 ? 1'h0 : _ctrlSignals_T_929; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_931 = _ctrlSignals_T_15 ? 1'h0 : _ctrlSignals_T_930; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_932 = _ctrlSignals_T_13 ? 1'h0 : _ctrlSignals_T_931; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_933 = _ctrlSignals_T_11 ? 1'h0 : _ctrlSignals_T_932; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_934 = _ctrlSignals_T_9 ? 1'h0 : _ctrlSignals_T_933; // @[Lookup.scala 34:39]
  assign io_pc_sel = _ctrlSignals_T_1 ? 2'h0 : _ctrlSignals_T_217; // @[Lookup.scala 34:39]
  assign io_A_sel = _ctrlSignals_T_1 ? 1'h0 : _ctrlSignals_T_289; // @[Lookup.scala 34:39]
  assign io_B_sel = _ctrlSignals_T_1 ? 1'h0 : _ctrlSignals_T_361; // @[Lookup.scala 34:39]
  assign io_wd_type = _ctrlSignals_T_1 ? 2'h0 : _ctrlSignals_T_433; // @[Lookup.scala 34:39]
  assign io_imm_sel = _ctrlSignals_T_1 ? 3'h3 : _ctrlSignals_T_505; // @[Lookup.scala 34:39]
  assign io_br_type = _ctrlSignals_T_1 ? 3'h0 : _ctrlSignals_T_649; // @[Lookup.scala 34:39]
  assign io_st_type = _ctrlSignals_T_1 ? 3'h0 : _ctrlSignals_T_721; // @[Lookup.scala 34:39]
  assign io_ld_type = _ctrlSignals_T_1 ? 3'h0 : _ctrlSignals_T_793; // @[Lookup.scala 34:39]
  assign io_wb_sel = _ctrlSignals_T_1 ? 2'h0 : _ctrlSignals_T_865; // @[Lookup.scala 34:39]
  assign io_wb_en = _ctrlSignals_T_1 | (_ctrlSignals_T_3 | (_ctrlSignals_T_5 | (_ctrlSignals_T_7 | _ctrlSignals_T_934)))
    ; // @[Lookup.scala 34:39]
  assign io_alu_op = _ctrlSignals_T_1 ? 5'hb : _ctrlSignals_T_577; // @[Lookup.scala 34:39]
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
  reg [63:0] reg_0; // @[singleCycleCore.scala 69:22]
  reg [63:0] reg_1; // @[singleCycleCore.scala 69:22]
  reg [63:0] reg_2; // @[singleCycleCore.scala 69:22]
  reg [63:0] reg_3; // @[singleCycleCore.scala 69:22]
  reg [63:0] reg_4; // @[singleCycleCore.scala 69:22]
  reg [63:0] reg_5; // @[singleCycleCore.scala 69:22]
  reg [63:0] reg_6; // @[singleCycleCore.scala 69:22]
  reg [63:0] reg_7; // @[singleCycleCore.scala 69:22]
  reg [63:0] reg_8; // @[singleCycleCore.scala 69:22]
  reg [63:0] reg_9; // @[singleCycleCore.scala 69:22]
  reg [63:0] reg_10; // @[singleCycleCore.scala 69:22]
  reg [63:0] reg_11; // @[singleCycleCore.scala 69:22]
  reg [63:0] reg_12; // @[singleCycleCore.scala 69:22]
  reg [63:0] reg_13; // @[singleCycleCore.scala 69:22]
  reg [63:0] reg_14; // @[singleCycleCore.scala 69:22]
  reg [63:0] reg_15; // @[singleCycleCore.scala 69:22]
  reg [63:0] reg_16; // @[singleCycleCore.scala 69:22]
  reg [63:0] reg_17; // @[singleCycleCore.scala 69:22]
  reg [63:0] reg_18; // @[singleCycleCore.scala 69:22]
  reg [63:0] reg_19; // @[singleCycleCore.scala 69:22]
  reg [63:0] reg_20; // @[singleCycleCore.scala 69:22]
  reg [63:0] reg_21; // @[singleCycleCore.scala 69:22]
  reg [63:0] reg_22; // @[singleCycleCore.scala 69:22]
  reg [63:0] reg_23; // @[singleCycleCore.scala 69:22]
  reg [63:0] reg_24; // @[singleCycleCore.scala 69:22]
  reg [63:0] reg_25; // @[singleCycleCore.scala 69:22]
  reg [63:0] reg_26; // @[singleCycleCore.scala 69:22]
  reg [63:0] reg_27; // @[singleCycleCore.scala 69:22]
  reg [63:0] reg_28; // @[singleCycleCore.scala 69:22]
  reg [63:0] reg_29; // @[singleCycleCore.scala 69:22]
  reg [63:0] reg_30; // @[singleCycleCore.scala 69:22]
  reg [63:0] reg_31; // @[singleCycleCore.scala 69:22]
  wire [63:0] _GEN_65 = 5'h1 == io_raddr_0 ? reg_1 : reg_0; // @[singleCycleCore.scala 84:{37,37}]
  wire [63:0] _GEN_66 = 5'h2 == io_raddr_0 ? reg_2 : _GEN_65; // @[singleCycleCore.scala 84:{37,37}]
  wire [63:0] _GEN_67 = 5'h3 == io_raddr_0 ? reg_3 : _GEN_66; // @[singleCycleCore.scala 84:{37,37}]
  wire [63:0] _GEN_68 = 5'h4 == io_raddr_0 ? reg_4 : _GEN_67; // @[singleCycleCore.scala 84:{37,37}]
  wire [63:0] _GEN_69 = 5'h5 == io_raddr_0 ? reg_5 : _GEN_68; // @[singleCycleCore.scala 84:{37,37}]
  wire [63:0] _GEN_70 = 5'h6 == io_raddr_0 ? reg_6 : _GEN_69; // @[singleCycleCore.scala 84:{37,37}]
  wire [63:0] _GEN_71 = 5'h7 == io_raddr_0 ? reg_7 : _GEN_70; // @[singleCycleCore.scala 84:{37,37}]
  wire [63:0] _GEN_72 = 5'h8 == io_raddr_0 ? reg_8 : _GEN_71; // @[singleCycleCore.scala 84:{37,37}]
  wire [63:0] _GEN_73 = 5'h9 == io_raddr_0 ? reg_9 : _GEN_72; // @[singleCycleCore.scala 84:{37,37}]
  wire [63:0] _GEN_74 = 5'ha == io_raddr_0 ? reg_10 : _GEN_73; // @[singleCycleCore.scala 84:{37,37}]
  wire [63:0] _GEN_75 = 5'hb == io_raddr_0 ? reg_11 : _GEN_74; // @[singleCycleCore.scala 84:{37,37}]
  wire [63:0] _GEN_76 = 5'hc == io_raddr_0 ? reg_12 : _GEN_75; // @[singleCycleCore.scala 84:{37,37}]
  wire [63:0] _GEN_77 = 5'hd == io_raddr_0 ? reg_13 : _GEN_76; // @[singleCycleCore.scala 84:{37,37}]
  wire [63:0] _GEN_78 = 5'he == io_raddr_0 ? reg_14 : _GEN_77; // @[singleCycleCore.scala 84:{37,37}]
  wire [63:0] _GEN_79 = 5'hf == io_raddr_0 ? reg_15 : _GEN_78; // @[singleCycleCore.scala 84:{37,37}]
  wire [63:0] _GEN_80 = 5'h10 == io_raddr_0 ? reg_16 : _GEN_79; // @[singleCycleCore.scala 84:{37,37}]
  wire [63:0] _GEN_81 = 5'h11 == io_raddr_0 ? reg_17 : _GEN_80; // @[singleCycleCore.scala 84:{37,37}]
  wire [63:0] _GEN_82 = 5'h12 == io_raddr_0 ? reg_18 : _GEN_81; // @[singleCycleCore.scala 84:{37,37}]
  wire [63:0] _GEN_83 = 5'h13 == io_raddr_0 ? reg_19 : _GEN_82; // @[singleCycleCore.scala 84:{37,37}]
  wire [63:0] _GEN_84 = 5'h14 == io_raddr_0 ? reg_20 : _GEN_83; // @[singleCycleCore.scala 84:{37,37}]
  wire [63:0] _GEN_85 = 5'h15 == io_raddr_0 ? reg_21 : _GEN_84; // @[singleCycleCore.scala 84:{37,37}]
  wire [63:0] _GEN_86 = 5'h16 == io_raddr_0 ? reg_22 : _GEN_85; // @[singleCycleCore.scala 84:{37,37}]
  wire [63:0] _GEN_87 = 5'h17 == io_raddr_0 ? reg_23 : _GEN_86; // @[singleCycleCore.scala 84:{37,37}]
  wire [63:0] _GEN_88 = 5'h18 == io_raddr_0 ? reg_24 : _GEN_87; // @[singleCycleCore.scala 84:{37,37}]
  wire [63:0] _GEN_89 = 5'h19 == io_raddr_0 ? reg_25 : _GEN_88; // @[singleCycleCore.scala 84:{37,37}]
  wire [63:0] _GEN_90 = 5'h1a == io_raddr_0 ? reg_26 : _GEN_89; // @[singleCycleCore.scala 84:{37,37}]
  wire [63:0] _GEN_91 = 5'h1b == io_raddr_0 ? reg_27 : _GEN_90; // @[singleCycleCore.scala 84:{37,37}]
  wire [63:0] _GEN_92 = 5'h1c == io_raddr_0 ? reg_28 : _GEN_91; // @[singleCycleCore.scala 84:{37,37}]
  wire [63:0] _GEN_93 = 5'h1d == io_raddr_0 ? reg_29 : _GEN_92; // @[singleCycleCore.scala 84:{37,37}]
  wire [63:0] _GEN_94 = 5'h1e == io_raddr_0 ? reg_30 : _GEN_93; // @[singleCycleCore.scala 84:{37,37}]
  wire [63:0] _GEN_95 = 5'h1f == io_raddr_0 ? reg_31 : _GEN_94; // @[singleCycleCore.scala 84:{37,37}]
  wire [63:0] _GEN_98 = 5'h1 == io_raddr_1 ? reg_1 : reg_0; // @[singleCycleCore.scala 84:{37,37}]
  wire [63:0] _GEN_99 = 5'h2 == io_raddr_1 ? reg_2 : _GEN_98; // @[singleCycleCore.scala 84:{37,37}]
  wire [63:0] _GEN_100 = 5'h3 == io_raddr_1 ? reg_3 : _GEN_99; // @[singleCycleCore.scala 84:{37,37}]
  wire [63:0] _GEN_101 = 5'h4 == io_raddr_1 ? reg_4 : _GEN_100; // @[singleCycleCore.scala 84:{37,37}]
  wire [63:0] _GEN_102 = 5'h5 == io_raddr_1 ? reg_5 : _GEN_101; // @[singleCycleCore.scala 84:{37,37}]
  wire [63:0] _GEN_103 = 5'h6 == io_raddr_1 ? reg_6 : _GEN_102; // @[singleCycleCore.scala 84:{37,37}]
  wire [63:0] _GEN_104 = 5'h7 == io_raddr_1 ? reg_7 : _GEN_103; // @[singleCycleCore.scala 84:{37,37}]
  wire [63:0] _GEN_105 = 5'h8 == io_raddr_1 ? reg_8 : _GEN_104; // @[singleCycleCore.scala 84:{37,37}]
  wire [63:0] _GEN_106 = 5'h9 == io_raddr_1 ? reg_9 : _GEN_105; // @[singleCycleCore.scala 84:{37,37}]
  wire [63:0] _GEN_107 = 5'ha == io_raddr_1 ? reg_10 : _GEN_106; // @[singleCycleCore.scala 84:{37,37}]
  wire [63:0] _GEN_108 = 5'hb == io_raddr_1 ? reg_11 : _GEN_107; // @[singleCycleCore.scala 84:{37,37}]
  wire [63:0] _GEN_109 = 5'hc == io_raddr_1 ? reg_12 : _GEN_108; // @[singleCycleCore.scala 84:{37,37}]
  wire [63:0] _GEN_110 = 5'hd == io_raddr_1 ? reg_13 : _GEN_109; // @[singleCycleCore.scala 84:{37,37}]
  wire [63:0] _GEN_111 = 5'he == io_raddr_1 ? reg_14 : _GEN_110; // @[singleCycleCore.scala 84:{37,37}]
  wire [63:0] _GEN_112 = 5'hf == io_raddr_1 ? reg_15 : _GEN_111; // @[singleCycleCore.scala 84:{37,37}]
  wire [63:0] _GEN_113 = 5'h10 == io_raddr_1 ? reg_16 : _GEN_112; // @[singleCycleCore.scala 84:{37,37}]
  wire [63:0] _GEN_114 = 5'h11 == io_raddr_1 ? reg_17 : _GEN_113; // @[singleCycleCore.scala 84:{37,37}]
  wire [63:0] _GEN_115 = 5'h12 == io_raddr_1 ? reg_18 : _GEN_114; // @[singleCycleCore.scala 84:{37,37}]
  wire [63:0] _GEN_116 = 5'h13 == io_raddr_1 ? reg_19 : _GEN_115; // @[singleCycleCore.scala 84:{37,37}]
  wire [63:0] _GEN_117 = 5'h14 == io_raddr_1 ? reg_20 : _GEN_116; // @[singleCycleCore.scala 84:{37,37}]
  wire [63:0] _GEN_118 = 5'h15 == io_raddr_1 ? reg_21 : _GEN_117; // @[singleCycleCore.scala 84:{37,37}]
  wire [63:0] _GEN_119 = 5'h16 == io_raddr_1 ? reg_22 : _GEN_118; // @[singleCycleCore.scala 84:{37,37}]
  wire [63:0] _GEN_120 = 5'h17 == io_raddr_1 ? reg_23 : _GEN_119; // @[singleCycleCore.scala 84:{37,37}]
  wire [63:0] _GEN_121 = 5'h18 == io_raddr_1 ? reg_24 : _GEN_120; // @[singleCycleCore.scala 84:{37,37}]
  wire [63:0] _GEN_122 = 5'h19 == io_raddr_1 ? reg_25 : _GEN_121; // @[singleCycleCore.scala 84:{37,37}]
  wire [63:0] _GEN_123 = 5'h1a == io_raddr_1 ? reg_26 : _GEN_122; // @[singleCycleCore.scala 84:{37,37}]
  wire [63:0] _GEN_124 = 5'h1b == io_raddr_1 ? reg_27 : _GEN_123; // @[singleCycleCore.scala 84:{37,37}]
  wire [63:0] _GEN_125 = 5'h1c == io_raddr_1 ? reg_28 : _GEN_124; // @[singleCycleCore.scala 84:{37,37}]
  wire [63:0] _GEN_126 = 5'h1d == io_raddr_1 ? reg_29 : _GEN_125; // @[singleCycleCore.scala 84:{37,37}]
  wire [63:0] _GEN_127 = 5'h1e == io_raddr_1 ? reg_30 : _GEN_126; // @[singleCycleCore.scala 84:{37,37}]
  wire [63:0] _GEN_128 = 5'h1f == io_raddr_1 ? reg_31 : _GEN_127; // @[singleCycleCore.scala 84:{37,37}]
  assign io_rdata_0 = io_raddr_0 == 5'h0 ? 64'h0 : _GEN_95; // @[singleCycleCore.scala 81:42 82:37 84:37]
  assign io_rdata_1 = io_raddr_1 == 5'h0 ? 64'h0 : _GEN_128; // @[singleCycleCore.scala 81:42 82:37 84:37]
  assign io_rdata_4 = reg_1; // @[singleCycleCore.scala 81:42 82:37 84:37]
  assign io_rdata_5 = reg_2; // @[singleCycleCore.scala 81:42 82:37 84:37]
  assign io_rdata_6 = reg_3; // @[singleCycleCore.scala 81:42 82:37 84:37]
  assign io_rdata_7 = reg_4; // @[singleCycleCore.scala 81:42 82:37 84:37]
  assign io_rdata_8 = reg_5; // @[singleCycleCore.scala 81:42 82:37 84:37]
  assign io_rdata_9 = reg_6; // @[singleCycleCore.scala 81:42 82:37 84:37]
  assign io_rdata_10 = reg_7; // @[singleCycleCore.scala 81:42 82:37 84:37]
  assign io_rdata_11 = reg_8; // @[singleCycleCore.scala 81:42 82:37 84:37]
  assign io_rdata_12 = reg_9; // @[singleCycleCore.scala 81:42 82:37 84:37]
  assign io_rdata_13 = reg_10; // @[singleCycleCore.scala 81:42 82:37 84:37]
  assign io_rdata_14 = reg_11; // @[singleCycleCore.scala 81:42 82:37 84:37]
  assign io_rdata_15 = reg_12; // @[singleCycleCore.scala 81:42 82:37 84:37]
  assign io_rdata_16 = reg_13; // @[singleCycleCore.scala 81:42 82:37 84:37]
  assign io_rdata_17 = reg_14; // @[singleCycleCore.scala 81:42 82:37 84:37]
  assign io_rdata_18 = reg_15; // @[singleCycleCore.scala 81:42 82:37 84:37]
  assign io_rdata_19 = reg_16; // @[singleCycleCore.scala 81:42 82:37 84:37]
  assign io_rdata_20 = reg_17; // @[singleCycleCore.scala 81:42 82:37 84:37]
  assign io_rdata_21 = reg_18; // @[singleCycleCore.scala 81:42 82:37 84:37]
  assign io_rdata_22 = reg_19; // @[singleCycleCore.scala 81:42 82:37 84:37]
  assign io_rdata_23 = reg_20; // @[singleCycleCore.scala 81:42 82:37 84:37]
  assign io_rdata_24 = reg_21; // @[singleCycleCore.scala 81:42 82:37 84:37]
  assign io_rdata_25 = reg_22; // @[singleCycleCore.scala 81:42 82:37 84:37]
  assign io_rdata_26 = reg_23; // @[singleCycleCore.scala 81:42 82:37 84:37]
  assign io_rdata_27 = reg_24; // @[singleCycleCore.scala 81:42 82:37 84:37]
  assign io_rdata_28 = reg_25; // @[singleCycleCore.scala 81:42 82:37 84:37]
  assign io_rdata_29 = reg_26; // @[singleCycleCore.scala 81:42 82:37 84:37]
  assign io_rdata_30 = reg_27; // @[singleCycleCore.scala 81:42 82:37 84:37]
  assign io_rdata_31 = reg_28; // @[singleCycleCore.scala 81:42 82:37 84:37]
  assign io_rdata_32 = reg_29; // @[singleCycleCore.scala 81:42 82:37 84:37]
  assign io_rdata_33 = reg_30; // @[singleCycleCore.scala 81:42 82:37 84:37]
  assign io_rdata_34 = reg_31; // @[singleCycleCore.scala 81:42 82:37 84:37]
  always @(posedge clock) begin
    if (reset) begin // @[singleCycleCore.scala 69:22]
      reg_0 <= 64'h0; // @[singleCycleCore.scala 69:22]
    end else if (io_wen) begin // @[singleCycleCore.scala 72:17]
      if (5'h0 == io_waddr) begin // @[singleCycleCore.scala 73:23]
        reg_0 <= io_wdata; // @[singleCycleCore.scala 73:23]
      end
    end
    if (reset) begin // @[singleCycleCore.scala 69:22]
      reg_1 <= 64'h0; // @[singleCycleCore.scala 69:22]
    end else if (io_wen) begin // @[singleCycleCore.scala 72:17]
      if (5'h1 == io_waddr) begin // @[singleCycleCore.scala 73:23]
        reg_1 <= io_wdata; // @[singleCycleCore.scala 73:23]
      end
    end
    if (reset) begin // @[singleCycleCore.scala 69:22]
      reg_2 <= 64'h0; // @[singleCycleCore.scala 69:22]
    end else if (io_wen) begin // @[singleCycleCore.scala 72:17]
      if (5'h2 == io_waddr) begin // @[singleCycleCore.scala 73:23]
        reg_2 <= io_wdata; // @[singleCycleCore.scala 73:23]
      end
    end
    if (reset) begin // @[singleCycleCore.scala 69:22]
      reg_3 <= 64'h0; // @[singleCycleCore.scala 69:22]
    end else if (io_wen) begin // @[singleCycleCore.scala 72:17]
      if (5'h3 == io_waddr) begin // @[singleCycleCore.scala 73:23]
        reg_3 <= io_wdata; // @[singleCycleCore.scala 73:23]
      end
    end
    if (reset) begin // @[singleCycleCore.scala 69:22]
      reg_4 <= 64'h0; // @[singleCycleCore.scala 69:22]
    end else if (io_wen) begin // @[singleCycleCore.scala 72:17]
      if (5'h4 == io_waddr) begin // @[singleCycleCore.scala 73:23]
        reg_4 <= io_wdata; // @[singleCycleCore.scala 73:23]
      end
    end
    if (reset) begin // @[singleCycleCore.scala 69:22]
      reg_5 <= 64'h0; // @[singleCycleCore.scala 69:22]
    end else if (io_wen) begin // @[singleCycleCore.scala 72:17]
      if (5'h5 == io_waddr) begin // @[singleCycleCore.scala 73:23]
        reg_5 <= io_wdata; // @[singleCycleCore.scala 73:23]
      end
    end
    if (reset) begin // @[singleCycleCore.scala 69:22]
      reg_6 <= 64'h0; // @[singleCycleCore.scala 69:22]
    end else if (io_wen) begin // @[singleCycleCore.scala 72:17]
      if (5'h6 == io_waddr) begin // @[singleCycleCore.scala 73:23]
        reg_6 <= io_wdata; // @[singleCycleCore.scala 73:23]
      end
    end
    if (reset) begin // @[singleCycleCore.scala 69:22]
      reg_7 <= 64'h0; // @[singleCycleCore.scala 69:22]
    end else if (io_wen) begin // @[singleCycleCore.scala 72:17]
      if (5'h7 == io_waddr) begin // @[singleCycleCore.scala 73:23]
        reg_7 <= io_wdata; // @[singleCycleCore.scala 73:23]
      end
    end
    if (reset) begin // @[singleCycleCore.scala 69:22]
      reg_8 <= 64'h0; // @[singleCycleCore.scala 69:22]
    end else if (io_wen) begin // @[singleCycleCore.scala 72:17]
      if (5'h8 == io_waddr) begin // @[singleCycleCore.scala 73:23]
        reg_8 <= io_wdata; // @[singleCycleCore.scala 73:23]
      end
    end
    if (reset) begin // @[singleCycleCore.scala 69:22]
      reg_9 <= 64'h0; // @[singleCycleCore.scala 69:22]
    end else if (io_wen) begin // @[singleCycleCore.scala 72:17]
      if (5'h9 == io_waddr) begin // @[singleCycleCore.scala 73:23]
        reg_9 <= io_wdata; // @[singleCycleCore.scala 73:23]
      end
    end
    if (reset) begin // @[singleCycleCore.scala 69:22]
      reg_10 <= 64'h0; // @[singleCycleCore.scala 69:22]
    end else if (io_wen) begin // @[singleCycleCore.scala 72:17]
      if (5'ha == io_waddr) begin // @[singleCycleCore.scala 73:23]
        reg_10 <= io_wdata; // @[singleCycleCore.scala 73:23]
      end
    end
    if (reset) begin // @[singleCycleCore.scala 69:22]
      reg_11 <= 64'h0; // @[singleCycleCore.scala 69:22]
    end else if (io_wen) begin // @[singleCycleCore.scala 72:17]
      if (5'hb == io_waddr) begin // @[singleCycleCore.scala 73:23]
        reg_11 <= io_wdata; // @[singleCycleCore.scala 73:23]
      end
    end
    if (reset) begin // @[singleCycleCore.scala 69:22]
      reg_12 <= 64'h0; // @[singleCycleCore.scala 69:22]
    end else if (io_wen) begin // @[singleCycleCore.scala 72:17]
      if (5'hc == io_waddr) begin // @[singleCycleCore.scala 73:23]
        reg_12 <= io_wdata; // @[singleCycleCore.scala 73:23]
      end
    end
    if (reset) begin // @[singleCycleCore.scala 69:22]
      reg_13 <= 64'h0; // @[singleCycleCore.scala 69:22]
    end else if (io_wen) begin // @[singleCycleCore.scala 72:17]
      if (5'hd == io_waddr) begin // @[singleCycleCore.scala 73:23]
        reg_13 <= io_wdata; // @[singleCycleCore.scala 73:23]
      end
    end
    if (reset) begin // @[singleCycleCore.scala 69:22]
      reg_14 <= 64'h0; // @[singleCycleCore.scala 69:22]
    end else if (io_wen) begin // @[singleCycleCore.scala 72:17]
      if (5'he == io_waddr) begin // @[singleCycleCore.scala 73:23]
        reg_14 <= io_wdata; // @[singleCycleCore.scala 73:23]
      end
    end
    if (reset) begin // @[singleCycleCore.scala 69:22]
      reg_15 <= 64'h0; // @[singleCycleCore.scala 69:22]
    end else if (io_wen) begin // @[singleCycleCore.scala 72:17]
      if (5'hf == io_waddr) begin // @[singleCycleCore.scala 73:23]
        reg_15 <= io_wdata; // @[singleCycleCore.scala 73:23]
      end
    end
    if (reset) begin // @[singleCycleCore.scala 69:22]
      reg_16 <= 64'h0; // @[singleCycleCore.scala 69:22]
    end else if (io_wen) begin // @[singleCycleCore.scala 72:17]
      if (5'h10 == io_waddr) begin // @[singleCycleCore.scala 73:23]
        reg_16 <= io_wdata; // @[singleCycleCore.scala 73:23]
      end
    end
    if (reset) begin // @[singleCycleCore.scala 69:22]
      reg_17 <= 64'h0; // @[singleCycleCore.scala 69:22]
    end else if (io_wen) begin // @[singleCycleCore.scala 72:17]
      if (5'h11 == io_waddr) begin // @[singleCycleCore.scala 73:23]
        reg_17 <= io_wdata; // @[singleCycleCore.scala 73:23]
      end
    end
    if (reset) begin // @[singleCycleCore.scala 69:22]
      reg_18 <= 64'h0; // @[singleCycleCore.scala 69:22]
    end else if (io_wen) begin // @[singleCycleCore.scala 72:17]
      if (5'h12 == io_waddr) begin // @[singleCycleCore.scala 73:23]
        reg_18 <= io_wdata; // @[singleCycleCore.scala 73:23]
      end
    end
    if (reset) begin // @[singleCycleCore.scala 69:22]
      reg_19 <= 64'h0; // @[singleCycleCore.scala 69:22]
    end else if (io_wen) begin // @[singleCycleCore.scala 72:17]
      if (5'h13 == io_waddr) begin // @[singleCycleCore.scala 73:23]
        reg_19 <= io_wdata; // @[singleCycleCore.scala 73:23]
      end
    end
    if (reset) begin // @[singleCycleCore.scala 69:22]
      reg_20 <= 64'h0; // @[singleCycleCore.scala 69:22]
    end else if (io_wen) begin // @[singleCycleCore.scala 72:17]
      if (5'h14 == io_waddr) begin // @[singleCycleCore.scala 73:23]
        reg_20 <= io_wdata; // @[singleCycleCore.scala 73:23]
      end
    end
    if (reset) begin // @[singleCycleCore.scala 69:22]
      reg_21 <= 64'h0; // @[singleCycleCore.scala 69:22]
    end else if (io_wen) begin // @[singleCycleCore.scala 72:17]
      if (5'h15 == io_waddr) begin // @[singleCycleCore.scala 73:23]
        reg_21 <= io_wdata; // @[singleCycleCore.scala 73:23]
      end
    end
    if (reset) begin // @[singleCycleCore.scala 69:22]
      reg_22 <= 64'h0; // @[singleCycleCore.scala 69:22]
    end else if (io_wen) begin // @[singleCycleCore.scala 72:17]
      if (5'h16 == io_waddr) begin // @[singleCycleCore.scala 73:23]
        reg_22 <= io_wdata; // @[singleCycleCore.scala 73:23]
      end
    end
    if (reset) begin // @[singleCycleCore.scala 69:22]
      reg_23 <= 64'h0; // @[singleCycleCore.scala 69:22]
    end else if (io_wen) begin // @[singleCycleCore.scala 72:17]
      if (5'h17 == io_waddr) begin // @[singleCycleCore.scala 73:23]
        reg_23 <= io_wdata; // @[singleCycleCore.scala 73:23]
      end
    end
    if (reset) begin // @[singleCycleCore.scala 69:22]
      reg_24 <= 64'h0; // @[singleCycleCore.scala 69:22]
    end else if (io_wen) begin // @[singleCycleCore.scala 72:17]
      if (5'h18 == io_waddr) begin // @[singleCycleCore.scala 73:23]
        reg_24 <= io_wdata; // @[singleCycleCore.scala 73:23]
      end
    end
    if (reset) begin // @[singleCycleCore.scala 69:22]
      reg_25 <= 64'h0; // @[singleCycleCore.scala 69:22]
    end else if (io_wen) begin // @[singleCycleCore.scala 72:17]
      if (5'h19 == io_waddr) begin // @[singleCycleCore.scala 73:23]
        reg_25 <= io_wdata; // @[singleCycleCore.scala 73:23]
      end
    end
    if (reset) begin // @[singleCycleCore.scala 69:22]
      reg_26 <= 64'h0; // @[singleCycleCore.scala 69:22]
    end else if (io_wen) begin // @[singleCycleCore.scala 72:17]
      if (5'h1a == io_waddr) begin // @[singleCycleCore.scala 73:23]
        reg_26 <= io_wdata; // @[singleCycleCore.scala 73:23]
      end
    end
    if (reset) begin // @[singleCycleCore.scala 69:22]
      reg_27 <= 64'h0; // @[singleCycleCore.scala 69:22]
    end else if (io_wen) begin // @[singleCycleCore.scala 72:17]
      if (5'h1b == io_waddr) begin // @[singleCycleCore.scala 73:23]
        reg_27 <= io_wdata; // @[singleCycleCore.scala 73:23]
      end
    end
    if (reset) begin // @[singleCycleCore.scala 69:22]
      reg_28 <= 64'h0; // @[singleCycleCore.scala 69:22]
    end else if (io_wen) begin // @[singleCycleCore.scala 72:17]
      if (5'h1c == io_waddr) begin // @[singleCycleCore.scala 73:23]
        reg_28 <= io_wdata; // @[singleCycleCore.scala 73:23]
      end
    end
    if (reset) begin // @[singleCycleCore.scala 69:22]
      reg_29 <= 64'h0; // @[singleCycleCore.scala 69:22]
    end else if (io_wen) begin // @[singleCycleCore.scala 72:17]
      if (5'h1d == io_waddr) begin // @[singleCycleCore.scala 73:23]
        reg_29 <= io_wdata; // @[singleCycleCore.scala 73:23]
      end
    end
    if (reset) begin // @[singleCycleCore.scala 69:22]
      reg_30 <= 64'h0; // @[singleCycleCore.scala 69:22]
    end else if (io_wen) begin // @[singleCycleCore.scala 72:17]
      if (5'h1e == io_waddr) begin // @[singleCycleCore.scala 73:23]
        reg_30 <= io_wdata; // @[singleCycleCore.scala 73:23]
      end
    end
    if (reset) begin // @[singleCycleCore.scala 69:22]
      reg_31 <= 64'h0; // @[singleCycleCore.scala 69:22]
    end else if (io_wen) begin // @[singleCycleCore.scala 72:17]
      if (5'h1f == io_waddr) begin // @[singleCycleCore.scala 73:23]
        reg_31 <= io_wdata; // @[singleCycleCore.scala 73:23]
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
  wire [63:0] alu_io_A; // @[singleCycleCore.scala 306:25]
  wire [63:0] alu_io_B; // @[singleCycleCore.scala 306:25]
  wire [1:0] alu_io_width_type; // @[singleCycleCore.scala 306:25]
  wire [3:0] alu_io_alu_op; // @[singleCycleCore.scala 306:25]
  wire [63:0] alu_io_out; // @[singleCycleCore.scala 306:25]
  wire [31:0] immGen_io_inst; // @[singleCycleCore.scala 307:28]
  wire [2:0] immGen_io_sel; // @[singleCycleCore.scala 307:28]
  wire [63:0] immGen_io_out; // @[singleCycleCore.scala 307:28]
  wire [31:0] control_io_inst; // @[singleCycleCore.scala 308:29]
  wire [1:0] control_io_pc_sel; // @[singleCycleCore.scala 308:29]
  wire  control_io_A_sel; // @[singleCycleCore.scala 308:29]
  wire  control_io_B_sel; // @[singleCycleCore.scala 308:29]
  wire [1:0] control_io_wd_type; // @[singleCycleCore.scala 308:29]
  wire [2:0] control_io_imm_sel; // @[singleCycleCore.scala 308:29]
  wire [2:0] control_io_br_type; // @[singleCycleCore.scala 308:29]
  wire [2:0] control_io_st_type; // @[singleCycleCore.scala 308:29]
  wire [2:0] control_io_ld_type; // @[singleCycleCore.scala 308:29]
  wire [1:0] control_io_wb_sel; // @[singleCycleCore.scala 308:29]
  wire  control_io_wb_en; // @[singleCycleCore.scala 308:29]
  wire [4:0] control_io_alu_op; // @[singleCycleCore.scala 308:29]
  wire [63:0] brCond_io_rs1; // @[singleCycleCore.scala 309:28]
  wire [63:0] brCond_io_rs2; // @[singleCycleCore.scala 309:28]
  wire [2:0] brCond_io_br_type; // @[singleCycleCore.scala 309:28]
  wire  brCond_io_taken; // @[singleCycleCore.scala 309:28]
  wire  regFile_clock; // @[singleCycleCore.scala 310:29]
  wire  regFile_reset; // @[singleCycleCore.scala 310:29]
  wire  regFile_io_wen; // @[singleCycleCore.scala 310:29]
  wire [4:0] regFile_io_waddr; // @[singleCycleCore.scala 310:29]
  wire [63:0] regFile_io_wdata; // @[singleCycleCore.scala 310:29]
  wire [4:0] regFile_io_raddr_0; // @[singleCycleCore.scala 310:29]
  wire [4:0] regFile_io_raddr_1; // @[singleCycleCore.scala 310:29]
  wire [63:0] regFile_io_rdata_0; // @[singleCycleCore.scala 310:29]
  wire [63:0] regFile_io_rdata_1; // @[singleCycleCore.scala 310:29]
  wire [63:0] regFile_io_rdata_4; // @[singleCycleCore.scala 310:29]
  wire [63:0] regFile_io_rdata_5; // @[singleCycleCore.scala 310:29]
  wire [63:0] regFile_io_rdata_6; // @[singleCycleCore.scala 310:29]
  wire [63:0] regFile_io_rdata_7; // @[singleCycleCore.scala 310:29]
  wire [63:0] regFile_io_rdata_8; // @[singleCycleCore.scala 310:29]
  wire [63:0] regFile_io_rdata_9; // @[singleCycleCore.scala 310:29]
  wire [63:0] regFile_io_rdata_10; // @[singleCycleCore.scala 310:29]
  wire [63:0] regFile_io_rdata_11; // @[singleCycleCore.scala 310:29]
  wire [63:0] regFile_io_rdata_12; // @[singleCycleCore.scala 310:29]
  wire [63:0] regFile_io_rdata_13; // @[singleCycleCore.scala 310:29]
  wire [63:0] regFile_io_rdata_14; // @[singleCycleCore.scala 310:29]
  wire [63:0] regFile_io_rdata_15; // @[singleCycleCore.scala 310:29]
  wire [63:0] regFile_io_rdata_16; // @[singleCycleCore.scala 310:29]
  wire [63:0] regFile_io_rdata_17; // @[singleCycleCore.scala 310:29]
  wire [63:0] regFile_io_rdata_18; // @[singleCycleCore.scala 310:29]
  wire [63:0] regFile_io_rdata_19; // @[singleCycleCore.scala 310:29]
  wire [63:0] regFile_io_rdata_20; // @[singleCycleCore.scala 310:29]
  wire [63:0] regFile_io_rdata_21; // @[singleCycleCore.scala 310:29]
  wire [63:0] regFile_io_rdata_22; // @[singleCycleCore.scala 310:29]
  wire [63:0] regFile_io_rdata_23; // @[singleCycleCore.scala 310:29]
  wire [63:0] regFile_io_rdata_24; // @[singleCycleCore.scala 310:29]
  wire [63:0] regFile_io_rdata_25; // @[singleCycleCore.scala 310:29]
  wire [63:0] regFile_io_rdata_26; // @[singleCycleCore.scala 310:29]
  wire [63:0] regFile_io_rdata_27; // @[singleCycleCore.scala 310:29]
  wire [63:0] regFile_io_rdata_28; // @[singleCycleCore.scala 310:29]
  wire [63:0] regFile_io_rdata_29; // @[singleCycleCore.scala 310:29]
  wire [63:0] regFile_io_rdata_30; // @[singleCycleCore.scala 310:29]
  wire [63:0] regFile_io_rdata_31; // @[singleCycleCore.scala 310:29]
  wire [63:0] regFile_io_rdata_32; // @[singleCycleCore.scala 310:29]
  wire [63:0] regFile_io_rdata_33; // @[singleCycleCore.scala 310:29]
  wire [63:0] regFile_io_rdata_34; // @[singleCycleCore.scala 310:29]
  wire  mem__clock; // @[singleCycleCore.scala 311:25]
  wire  mem__reset; // @[singleCycleCore.scala 311:25]
  wire [63:0] mem__pc_addr; // @[singleCycleCore.scala 311:25]
  wire [63:0] mem__pc_data; // @[singleCycleCore.scala 311:25]
  wire [63:0] mem__addr; // @[singleCycleCore.scala 311:25]
  wire [63:0] mem__wdata; // @[singleCycleCore.scala 311:25]
  wire [7:0] mem__mask; // @[singleCycleCore.scala 311:25]
  wire [63:0] mem__rdata; // @[singleCycleCore.scala 311:25]
  wire  mem__enable; // @[singleCycleCore.scala 311:25]
  wire  mem__wen; // @[singleCycleCore.scala 311:25]
  wire  gpr_ptr_clock; // @[singleCycleCore.scala 313:29]
  wire  gpr_ptr_reset; // @[singleCycleCore.scala 313:29]
  wire [63:0] gpr_ptr_regfile_0; // @[singleCycleCore.scala 313:29]
  wire [63:0] gpr_ptr_regfile_1; // @[singleCycleCore.scala 313:29]
  wire [63:0] gpr_ptr_regfile_2; // @[singleCycleCore.scala 313:29]
  wire [63:0] gpr_ptr_regfile_3; // @[singleCycleCore.scala 313:29]
  wire [63:0] gpr_ptr_regfile_4; // @[singleCycleCore.scala 313:29]
  wire [63:0] gpr_ptr_regfile_5; // @[singleCycleCore.scala 313:29]
  wire [63:0] gpr_ptr_regfile_6; // @[singleCycleCore.scala 313:29]
  wire [63:0] gpr_ptr_regfile_7; // @[singleCycleCore.scala 313:29]
  wire [63:0] gpr_ptr_regfile_8; // @[singleCycleCore.scala 313:29]
  wire [63:0] gpr_ptr_regfile_9; // @[singleCycleCore.scala 313:29]
  wire [63:0] gpr_ptr_regfile_10; // @[singleCycleCore.scala 313:29]
  wire [63:0] gpr_ptr_regfile_11; // @[singleCycleCore.scala 313:29]
  wire [63:0] gpr_ptr_regfile_12; // @[singleCycleCore.scala 313:29]
  wire [63:0] gpr_ptr_regfile_13; // @[singleCycleCore.scala 313:29]
  wire [63:0] gpr_ptr_regfile_14; // @[singleCycleCore.scala 313:29]
  wire [63:0] gpr_ptr_regfile_15; // @[singleCycleCore.scala 313:29]
  wire [63:0] gpr_ptr_regfile_16; // @[singleCycleCore.scala 313:29]
  wire [63:0] gpr_ptr_regfile_17; // @[singleCycleCore.scala 313:29]
  wire [63:0] gpr_ptr_regfile_18; // @[singleCycleCore.scala 313:29]
  wire [63:0] gpr_ptr_regfile_19; // @[singleCycleCore.scala 313:29]
  wire [63:0] gpr_ptr_regfile_20; // @[singleCycleCore.scala 313:29]
  wire [63:0] gpr_ptr_regfile_21; // @[singleCycleCore.scala 313:29]
  wire [63:0] gpr_ptr_regfile_22; // @[singleCycleCore.scala 313:29]
  wire [63:0] gpr_ptr_regfile_23; // @[singleCycleCore.scala 313:29]
  wire [63:0] gpr_ptr_regfile_24; // @[singleCycleCore.scala 313:29]
  wire [63:0] gpr_ptr_regfile_25; // @[singleCycleCore.scala 313:29]
  wire [63:0] gpr_ptr_regfile_26; // @[singleCycleCore.scala 313:29]
  wire [63:0] gpr_ptr_regfile_27; // @[singleCycleCore.scala 313:29]
  wire [63:0] gpr_ptr_regfile_28; // @[singleCycleCore.scala 313:29]
  wire [63:0] gpr_ptr_regfile_29; // @[singleCycleCore.scala 313:29]
  wire [63:0] gpr_ptr_regfile_30; // @[singleCycleCore.scala 313:29]
  wire [63:0] gpr_ptr_regfile_31; // @[singleCycleCore.scala 313:29]
  reg [31:0] pc; // @[singleCycleCore.scala 312:25]
  wire  taken = brCond_io_taken;
  wire [31:0] _pc_T_4 = pc + 32'h4; // @[singleCycleCore.scala 350:58]
  wire [63:0] alu_out = alu_io_out;
  wire [63:0] _pc_T_7 = control_io_pc_sel == 2'h1 | taken ? alu_out : {{32'd0}, pc}; // @[singleCycleCore.scala 351:20]
  wire [63:0] _pc_T_8 = control_io_pc_sel == 2'h0 & ~taken ? {{32'd0}, _pc_T_4} : _pc_T_7; // @[singleCycleCore.scala 350:18]
  wire [31:0] instr = pc[2] & ~clock | ~pc[2] & clock ? mem__pc_data[63:32] : mem__pc_data[31:0]; // @[singleCycleCore.scala 356:21]
  wire [63:0] A_data = control_io_A_sel ? regFile_io_rdata_0 : {{32'd0}, pc}; // @[singleCycleCore.scala 363:22]
  wire [63:0] imm = immGen_io_out;
  wire [63:0] B_data = control_io_B_sel ? regFile_io_rdata_1 : imm; // @[singleCycleCore.scala 364:22]
  wire  _alu_io_A_T = control_io_wd_type == 2'h1; // @[singleCycleCore.scala 365:44]
  wire [5:0] _mem_io_wdata_T_1 = {alu_out[2:0], 3'h0}; // @[singleCycleCore.scala 396:63]
  wire [126:0] _GEN_1 = {{63'd0}, regFile_io_rdata_1}; // @[singleCycleCore.scala 396:46]
  wire [126:0] _mem_io_wdata_T_2 = _GEN_1 << _mem_io_wdata_T_1; // @[singleCycleCore.scala 396:46]
  wire  _regFile_io_wen_T = control_io_wb_sel == 2'h0; // @[singleCycleCore.scala 399:46]
  wire  _regFile_io_wen_T_1 = control_io_wb_sel == 2'h2; // @[singleCycleCore.scala 400:59]
  wire  _regFile_io_wen_T_2 = control_io_wb_sel == 2'h0 | _regFile_io_wen_T_1; // @[singleCycleCore.scala 399:57]
  wire  _regFile_io_wen_T_3 = control_io_wb_sel == 2'h1; // @[singleCycleCore.scala 401:59]
  wire  _regFile_io_wen_T_4 = _regFile_io_wen_T_2 | _regFile_io_wen_T_3; // @[singleCycleCore.scala 400:70]
  wire [7:0] _st_mask_T_3 = control_io_st_type == 3'h3 ? 8'h1 : 8'hff; // @[singleCycleCore.scala 406:60]
  wire [7:0] _st_mask_T_4 = control_io_st_type == 3'h2 ? 8'h3 : _st_mask_T_3; // @[singleCycleCore.scala 405:52]
  wire [7:0] _st_mask_T_5 = control_io_st_type == 3'h1 ? 8'hf : _st_mask_T_4; // @[singleCycleCore.scala 404:23]
  wire [15:0] st_mask = {{8'd0}, _st_mask_T_5};
  wire [22:0] _GEN_2 = {{7'd0}, st_mask}; // @[singleCycleCore.scala 412:78]
  wire [22:0] _mem_io_mask_T_3 = _GEN_2 << alu_out[2:0]; // @[singleCycleCore.scala 412:78]
  wire [63:0] _load_data_T = alu_out & 64'h7; // @[singleCycleCore.scala 414:48]
  wire [66:0] _load_data_T_1 = {_load_data_T, 3'h0}; // @[singleCycleCore.scala 414:59]
  wire [63:0] load_data = mem__rdata >> _load_data_T_1; // @[singleCycleCore.scala 414:35]
  wire [31:0] _load_data_ext_T_3 = load_data[31] ? 32'hffffffff : 32'h0; // @[singleCycleCore.scala 415:67]
  wire [63:0] _load_data_ext_T_5 = {_load_data_ext_T_3,load_data[31:0]}; // @[Cat.scala 31:58]
  wire [63:0] _load_data_ext_T_9 = {32'h0,load_data[31:0]}; // @[Cat.scala 31:58]
  wire [47:0] _load_data_ext_T_13 = load_data[15] ? 48'hffffffffffff : 48'h0; // @[singleCycleCore.scala 417:90]
  wire [63:0] _load_data_ext_T_15 = {_load_data_ext_T_13,load_data[15:0]}; // @[Cat.scala 31:58]
  wire [63:0] _load_data_ext_T_19 = {48'h0,load_data[15:0]}; // @[Cat.scala 31:58]
  wire [55:0] _load_data_ext_T_23 = load_data[7] ? 56'hffffffffffffff : 56'h0; // @[singleCycleCore.scala 419:106]
  wire [63:0] _load_data_ext_T_25 = {_load_data_ext_T_23,load_data[7:0]}; // @[Cat.scala 31:58]
  wire [63:0] _load_data_ext_T_29 = {56'h0,load_data[7:0]}; // @[Cat.scala 31:58]
  wire [63:0] _load_data_ext_T_30 = control_io_ld_type == 3'h5 ? _load_data_ext_T_29 : load_data; // @[singleCycleCore.scala 420:76]
  wire [63:0] _load_data_ext_T_31 = control_io_ld_type == 3'h3 ? _load_data_ext_T_25 : _load_data_ext_T_30; // @[singleCycleCore.scala 419:68]
  wire [63:0] _load_data_ext_T_32 = control_io_ld_type == 3'h4 ? _load_data_ext_T_19 : _load_data_ext_T_31; // @[singleCycleCore.scala 418:60]
  wire [63:0] _load_data_ext_T_33 = control_io_ld_type == 3'h2 ? _load_data_ext_T_15 : _load_data_ext_T_32; // @[singleCycleCore.scala 417:52]
  wire [63:0] _load_data_ext_T_34 = control_io_ld_type == 3'h6 ? _load_data_ext_T_9 : _load_data_ext_T_33; // @[singleCycleCore.scala 416:44]
  wire [63:0] load_data_ext = control_io_ld_type == 3'h1 ? _load_data_ext_T_5 : _load_data_ext_T_34; // @[singleCycleCore.scala 415:29]
  wire [63:0] pc_4 = {{32'd0}, _pc_T_4};
  wire [63:0] _regFile_io_wdata_T_2 = _regFile_io_wen_T_1 ? pc_4 : load_data_ext; // @[singleCycleCore.scala 448:52]
  wire [63:0] _GEN_0 = reset ? 64'h80000000 : _pc_T_8; // @[singleCycleCore.scala 312:{25,25} 350:12]
  AluSimple alu ( // @[singleCycleCore.scala 306:25]
    .io_A(alu_io_A),
    .io_B(alu_io_B),
    .io_width_type(alu_io_width_type),
    .io_alu_op(alu_io_alu_op),
    .io_out(alu_io_out)
  );
  ImmGenWire immGen ( // @[singleCycleCore.scala 307:28]
    .io_inst(immGen_io_inst),
    .io_sel(immGen_io_sel),
    .io_out(immGen_io_out)
  );
  Control control ( // @[singleCycleCore.scala 308:29]
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
  BrCondSimple brCond ( // @[singleCycleCore.scala 309:28]
    .io_rs1(brCond_io_rs1),
    .io_rs2(brCond_io_rs2),
    .io_br_type(brCond_io_br_type),
    .io_taken(brCond_io_taken)
  );
  RegisterFile regFile ( // @[singleCycleCore.scala 310:29]
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
  Mem mem_ ( // @[singleCycleCore.scala 311:25]
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
  gpr_ptr gpr_ptr ( // @[singleCycleCore.scala 313:29]
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
  assign io_pc_debug = {{32'd0}, pc}; // @[singleCycleCore.scala 328:21]
  assign alu_io_A = control_io_wd_type == 2'h1 ? {{32'd0}, A_data[31:0]} : A_data; // @[singleCycleCore.scala 365:24]
  assign alu_io_B = _alu_io_A_T ? {{32'd0}, B_data[31:0]} : B_data; // @[singleCycleCore.scala 366:24]
  assign alu_io_width_type = control_io_wd_type; // @[singleCycleCore.scala 362:27]
  assign alu_io_alu_op = control_io_alu_op[3:0]; // @[singleCycleCore.scala 361:23]
  assign immGen_io_inst = pc[2] & ~clock | ~pc[2] & clock ? mem__pc_data[63:32] : mem__pc_data[31:0]; // @[singleCycleCore.scala 356:21]
  assign immGen_io_sel = control_io_imm_sel; // @[singleCycleCore.scala 382:23]
  assign control_io_inst = pc[2] & ~clock | ~pc[2] & clock ? mem__pc_data[63:32] : mem__pc_data[31:0]; // @[singleCycleCore.scala 356:21]
  assign brCond_io_rs1 = regFile_io_rdata_0; // @[singleCycleCore.scala 387:23]
  assign brCond_io_rs2 = regFile_io_rdata_1; // @[singleCycleCore.scala 388:23]
  assign brCond_io_br_type = control_io_br_type; // @[singleCycleCore.scala 386:27]
  assign regFile_clock = clock;
  assign regFile_reset = reset;
  assign regFile_io_wen = _regFile_io_wen_T_4 & control_io_wb_en; // @[singleCycleCore.scala 401:72]
  assign regFile_io_waddr = instr[11:7]; // @[singleCycleCore.scala 376:22]
  assign regFile_io_wdata = _regFile_io_wen_T ? alu_out : _regFile_io_wdata_T_2; // @[singleCycleCore.scala 447:32]
  assign regFile_io_raddr_0 = instr[19:15]; // @[singleCycleCore.scala 374:22]
  assign regFile_io_raddr_1 = instr[24:20]; // @[singleCycleCore.scala 375:22]
  assign mem__clock = clock; // @[singleCycleCore.scala 326:22]
  assign mem__reset = reset; // @[singleCycleCore.scala 327:22]
  assign mem__pc_addr = {{32'd0}, pc}; // @[singleCycleCore.scala 355:24]
  assign mem__addr = alu_io_out; // @[singleCycleCore.scala 394:21]
  assign mem__wdata = _mem_io_wdata_T_2[63:0]; // @[singleCycleCore.scala 396:71]
  assign mem__mask = st_mask == 16'hff ? st_mask[7:0] : _mem_io_mask_T_3[7:0]; // @[singleCycleCore.scala 412:27]
  assign mem__enable = |control_io_st_type | |control_io_ld_type; // @[singleCycleCore.scala 392:49]
  assign mem__wen = |control_io_st_type; // @[singleCycleCore.scala 393:42]
  assign gpr_ptr_clock = clock; // @[singleCycleCore.scala 324:26]
  assign gpr_ptr_reset = reset; // @[singleCycleCore.scala 325:26]
  assign gpr_ptr_regfile_0 = 64'h0; // @[singleCycleCore.scala 319:41]
  assign gpr_ptr_regfile_1 = regFile_io_rdata_4; // @[singleCycleCore.scala 319:41]
  assign gpr_ptr_regfile_2 = regFile_io_rdata_5; // @[singleCycleCore.scala 319:41]
  assign gpr_ptr_regfile_3 = regFile_io_rdata_6; // @[singleCycleCore.scala 319:41]
  assign gpr_ptr_regfile_4 = regFile_io_rdata_7; // @[singleCycleCore.scala 319:41]
  assign gpr_ptr_regfile_5 = regFile_io_rdata_8; // @[singleCycleCore.scala 319:41]
  assign gpr_ptr_regfile_6 = regFile_io_rdata_9; // @[singleCycleCore.scala 319:41]
  assign gpr_ptr_regfile_7 = regFile_io_rdata_10; // @[singleCycleCore.scala 319:41]
  assign gpr_ptr_regfile_8 = regFile_io_rdata_11; // @[singleCycleCore.scala 319:41]
  assign gpr_ptr_regfile_9 = regFile_io_rdata_12; // @[singleCycleCore.scala 319:41]
  assign gpr_ptr_regfile_10 = regFile_io_rdata_13; // @[singleCycleCore.scala 319:41]
  assign gpr_ptr_regfile_11 = regFile_io_rdata_14; // @[singleCycleCore.scala 319:41]
  assign gpr_ptr_regfile_12 = regFile_io_rdata_15; // @[singleCycleCore.scala 319:41]
  assign gpr_ptr_regfile_13 = regFile_io_rdata_16; // @[singleCycleCore.scala 319:41]
  assign gpr_ptr_regfile_14 = regFile_io_rdata_17; // @[singleCycleCore.scala 319:41]
  assign gpr_ptr_regfile_15 = regFile_io_rdata_18; // @[singleCycleCore.scala 319:41]
  assign gpr_ptr_regfile_16 = regFile_io_rdata_19; // @[singleCycleCore.scala 319:41]
  assign gpr_ptr_regfile_17 = regFile_io_rdata_20; // @[singleCycleCore.scala 319:41]
  assign gpr_ptr_regfile_18 = regFile_io_rdata_21; // @[singleCycleCore.scala 319:41]
  assign gpr_ptr_regfile_19 = regFile_io_rdata_22; // @[singleCycleCore.scala 319:41]
  assign gpr_ptr_regfile_20 = regFile_io_rdata_23; // @[singleCycleCore.scala 319:41]
  assign gpr_ptr_regfile_21 = regFile_io_rdata_24; // @[singleCycleCore.scala 319:41]
  assign gpr_ptr_regfile_22 = regFile_io_rdata_25; // @[singleCycleCore.scala 319:41]
  assign gpr_ptr_regfile_23 = regFile_io_rdata_26; // @[singleCycleCore.scala 319:41]
  assign gpr_ptr_regfile_24 = regFile_io_rdata_27; // @[singleCycleCore.scala 319:41]
  assign gpr_ptr_regfile_25 = regFile_io_rdata_28; // @[singleCycleCore.scala 319:41]
  assign gpr_ptr_regfile_26 = regFile_io_rdata_29; // @[singleCycleCore.scala 319:41]
  assign gpr_ptr_regfile_27 = regFile_io_rdata_30; // @[singleCycleCore.scala 319:41]
  assign gpr_ptr_regfile_28 = regFile_io_rdata_31; // @[singleCycleCore.scala 319:41]
  assign gpr_ptr_regfile_29 = regFile_io_rdata_32; // @[singleCycleCore.scala 319:41]
  assign gpr_ptr_regfile_30 = regFile_io_rdata_33; // @[singleCycleCore.scala 319:41]
  assign gpr_ptr_regfile_31 = regFile_io_rdata_34; // @[singleCycleCore.scala 319:41]
  always @(posedge clock) begin
    pc <= _GEN_0[31:0]; // @[singleCycleCore.scala 312:{25,25} 350:12]
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

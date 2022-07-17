module keyboard(
  input        clock,
  input        reset,
  input        io_next_data_n,
  input        io_ps2_clk,
  input        io_ps2_dat,
  output [7:0] io_out,
  output       io_ready
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
`endif // RANDOMIZE_REG_INIT
  reg [9:0] buffer; // @[exp7.scala 126:25]
  reg  ready; // @[exp7.scala 127:24]
  reg [7:0] count; // @[exp7.scala 128:24]
  reg [2:0] ps2_clk_sync; // @[exp7.scala 129:31]
  reg  next_data_n; // @[exp7.scala 130:30]
  reg [7:0] fifo_0; // @[exp7.scala 131:19]
  reg [7:0] fifo_1; // @[exp7.scala 131:19]
  reg [7:0] fifo_2; // @[exp7.scala 131:19]
  reg [7:0] fifo_3; // @[exp7.scala 131:19]
  reg [7:0] fifo_4; // @[exp7.scala 131:19]
  reg [7:0] fifo_5; // @[exp7.scala 131:19]
  reg [7:0] fifo_6; // @[exp7.scala 131:19]
  reg [7:0] fifo_7; // @[exp7.scala 131:19]
  reg [2:0] w_ptr; // @[exp7.scala 132:24]
  reg [2:0] r_ptr; // @[exp7.scala 133:24]
  wire [7:0] _GEN_1 = 3'h1 == r_ptr ? fifo_1 : fifo_0; // @[exp7.scala 136:{12,12}]
  wire [7:0] _GEN_2 = 3'h2 == r_ptr ? fifo_2 : _GEN_1; // @[exp7.scala 136:{12,12}]
  wire [7:0] _GEN_3 = 3'h3 == r_ptr ? fifo_3 : _GEN_2; // @[exp7.scala 136:{12,12}]
  wire [7:0] _GEN_4 = 3'h4 == r_ptr ? fifo_4 : _GEN_3; // @[exp7.scala 136:{12,12}]
  wire [7:0] _GEN_5 = 3'h5 == r_ptr ? fifo_5 : _GEN_4; // @[exp7.scala 136:{12,12}]
  wire [7:0] _GEN_6 = 3'h6 == r_ptr ? fifo_6 : _GEN_5; // @[exp7.scala 136:{12,12}]
  wire [2:0] _ps2_clk_sync_T_1 = {ps2_clk_sync[1:0],io_ps2_clk}; // @[Cat.scala 31:58]
  wire [2:0] _T_1 = r_ptr + 3'h1; // @[exp7.scala 144:30]
  wire  _T_2 = w_ptr == _T_1; // @[exp7.scala 144:20]
  wire  _GEN_8 = _T_2 ? 1'h0 : ready; // @[exp7.scala 145:9 146:23 127:24]
  wire  _GEN_9 = ready ? _GEN_8 : ready; // @[exp7.scala 127:24 142:5]
  wire  _T_6 = ps2_clk_sync[2] & ~ps2_clk_sync[1]; // @[exp7.scala 162:26]
  wire  _T_7 = count == 8'ha; // @[exp7.scala 164:20]
  wire  _T_14 = io_ps2_dat & ~buffer[0] & ^buffer[9:1]; // @[exp7.scala 166:50]
  wire [2:0] _w_ptr_T_1 = w_ptr + 3'h1; // @[exp7.scala 169:32]
  wire  _GEN_28 = _T_14 | _GEN_9; // @[exp7.scala 167:13 170:23]
  wire [255:0] _GEN_0 = {{255'd0}, io_ps2_dat}; // @[exp7.scala 176:43]
  wire [255:0] _buffer_T = _GEN_0 << count; // @[exp7.scala 176:43]
  wire [255:0] _GEN_53 = {{246'd0}, buffer}; // @[exp7.scala 176:30]
  wire [255:0] _buffer_T_1 = _GEN_53 | _buffer_T; // @[exp7.scala 176:30]
  wire [7:0] _count_T_1 = count + 8'h1; // @[exp7.scala 177:28]
  wire [255:0] _GEN_40 = _T_7 ? 256'h0 : _buffer_T_1; // @[exp7.scala 165:9 173:20 176:20]
  wire [255:0] _GEN_52 = _T_6 ? _GEN_40 : {{246'd0}, buffer}; // @[exp7.scala 126:25 163:5]
  wire [255:0] _GEN_54 = reset ? 256'h0 : _GEN_52; // @[exp7.scala 126:{25,25}]
  assign io_out = 3'h7 == r_ptr ? fifo_7 : _GEN_6; // @[exp7.scala 136:{12,12}]
  assign io_ready = ready; // @[exp7.scala 137:14]
  always @(posedge clock) begin
    buffer <= _GEN_54[9:0]; // @[exp7.scala 126:{25,25}]
    if (reset) begin // @[exp7.scala 127:24]
      ready <= 1'h0; // @[exp7.scala 127:24]
    end else if (_T_6) begin // @[exp7.scala 163:5]
      if (_T_7) begin // @[exp7.scala 165:9]
        ready <= _GEN_28;
      end else begin
        ready <= _GEN_9;
      end
    end else begin
      ready <= _GEN_9;
    end
    if (reset) begin // @[exp7.scala 128:24]
      count <= 8'h0; // @[exp7.scala 128:24]
    end else if (_T_6) begin // @[exp7.scala 163:5]
      if (_T_7) begin // @[exp7.scala 165:9]
        count <= 8'h0; // @[exp7.scala 172:19]
      end else begin
        count <= _count_T_1; // @[exp7.scala 177:19]
      end
    end
    if (reset) begin // @[exp7.scala 129:31]
      ps2_clk_sync <= 3'h0; // @[exp7.scala 129:31]
    end else begin
      ps2_clk_sync <= _ps2_clk_sync_T_1; // @[exp7.scala 139:18]
    end
    if (reset) begin // @[exp7.scala 130:30]
      next_data_n <= 1'h0; // @[exp7.scala 130:30]
    end else begin
      next_data_n <= io_next_data_n; // @[exp7.scala 135:17]
    end
    if (_T_6) begin // @[exp7.scala 163:5]
      if (_T_7) begin // @[exp7.scala 165:9]
        if (_T_14) begin // @[exp7.scala 167:13]
          if (3'h0 == w_ptr) begin // @[exp7.scala 168:29]
            fifo_0 <= buffer[8:1]; // @[exp7.scala 168:29]
          end
        end
      end
    end
    if (_T_6) begin // @[exp7.scala 163:5]
      if (_T_7) begin // @[exp7.scala 165:9]
        if (_T_14) begin // @[exp7.scala 167:13]
          if (3'h1 == w_ptr) begin // @[exp7.scala 168:29]
            fifo_1 <= buffer[8:1]; // @[exp7.scala 168:29]
          end
        end
      end
    end
    if (_T_6) begin // @[exp7.scala 163:5]
      if (_T_7) begin // @[exp7.scala 165:9]
        if (_T_14) begin // @[exp7.scala 167:13]
          if (3'h2 == w_ptr) begin // @[exp7.scala 168:29]
            fifo_2 <= buffer[8:1]; // @[exp7.scala 168:29]
          end
        end
      end
    end
    if (_T_6) begin // @[exp7.scala 163:5]
      if (_T_7) begin // @[exp7.scala 165:9]
        if (_T_14) begin // @[exp7.scala 167:13]
          if (3'h3 == w_ptr) begin // @[exp7.scala 168:29]
            fifo_3 <= buffer[8:1]; // @[exp7.scala 168:29]
          end
        end
      end
    end
    if (_T_6) begin // @[exp7.scala 163:5]
      if (_T_7) begin // @[exp7.scala 165:9]
        if (_T_14) begin // @[exp7.scala 167:13]
          if (3'h4 == w_ptr) begin // @[exp7.scala 168:29]
            fifo_4 <= buffer[8:1]; // @[exp7.scala 168:29]
          end
        end
      end
    end
    if (_T_6) begin // @[exp7.scala 163:5]
      if (_T_7) begin // @[exp7.scala 165:9]
        if (_T_14) begin // @[exp7.scala 167:13]
          if (3'h5 == w_ptr) begin // @[exp7.scala 168:29]
            fifo_5 <= buffer[8:1]; // @[exp7.scala 168:29]
          end
        end
      end
    end
    if (_T_6) begin // @[exp7.scala 163:5]
      if (_T_7) begin // @[exp7.scala 165:9]
        if (_T_14) begin // @[exp7.scala 167:13]
          if (3'h6 == w_ptr) begin // @[exp7.scala 168:29]
            fifo_6 <= buffer[8:1]; // @[exp7.scala 168:29]
          end
        end
      end
    end
    if (_T_6) begin // @[exp7.scala 163:5]
      if (_T_7) begin // @[exp7.scala 165:9]
        if (_T_14) begin // @[exp7.scala 167:13]
          if (3'h7 == w_ptr) begin // @[exp7.scala 168:29]
            fifo_7 <= buffer[8:1]; // @[exp7.scala 168:29]
          end
        end
      end
    end
    if (reset) begin // @[exp7.scala 132:24]
      w_ptr <= 3'h0; // @[exp7.scala 132:24]
    end else if (_T_6) begin // @[exp7.scala 163:5]
      if (_T_7) begin // @[exp7.scala 165:9]
        if (_T_14) begin // @[exp7.scala 167:13]
          w_ptr <= _w_ptr_T_1; // @[exp7.scala 169:23]
        end
      end
    end
    if (reset) begin // @[exp7.scala 133:24]
      r_ptr <= 3'h0; // @[exp7.scala 133:24]
    end else if (next_data_n) begin // @[exp7.scala 157:5]
      r_ptr <= _T_1; // @[exp7.scala 159:19]
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
  buffer = _RAND_0[9:0];
  _RAND_1 = {1{`RANDOM}};
  ready = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  count = _RAND_2[7:0];
  _RAND_3 = {1{`RANDOM}};
  ps2_clk_sync = _RAND_3[2:0];
  _RAND_4 = {1{`RANDOM}};
  next_data_n = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  fifo_0 = _RAND_5[7:0];
  _RAND_6 = {1{`RANDOM}};
  fifo_1 = _RAND_6[7:0];
  _RAND_7 = {1{`RANDOM}};
  fifo_2 = _RAND_7[7:0];
  _RAND_8 = {1{`RANDOM}};
  fifo_3 = _RAND_8[7:0];
  _RAND_9 = {1{`RANDOM}};
  fifo_4 = _RAND_9[7:0];
  _RAND_10 = {1{`RANDOM}};
  fifo_5 = _RAND_10[7:0];
  _RAND_11 = {1{`RANDOM}};
  fifo_6 = _RAND_11[7:0];
  _RAND_12 = {1{`RANDOM}};
  fifo_7 = _RAND_12[7:0];
  _RAND_13 = {1{`RANDOM}};
  w_ptr = _RAND_13[2:0];
  _RAND_14 = {1{`RANDOM}};
  r_ptr = _RAND_14[2:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module bcd7(
  input  [3:0] io_in,
  output [6:0] io_out
);
  wire [3:0] _GEN_0 = 4'hf == io_in ? 4'he : 4'h0; // @[bcd7seg.scala 12:16 14:9 46:21]
  wire [3:0] _GEN_1 = 4'he == io_in ? 4'h6 : _GEN_0; // @[bcd7seg.scala 14:9 44:21]
  wire [5:0] _GEN_2 = 4'hd == io_in ? 6'h21 : {{2'd0}, _GEN_1}; // @[bcd7seg.scala 14:9 42:21]
  wire [6:0] _GEN_3 = 4'hc == io_in ? 7'h46 : {{1'd0}, _GEN_2}; // @[bcd7seg.scala 14:9 40:21]
  wire [6:0] _GEN_4 = 4'hb == io_in ? 7'h3 : _GEN_3; // @[bcd7seg.scala 14:9 38:21]
  wire [6:0] _GEN_5 = 4'ha == io_in ? 7'h8 : _GEN_4; // @[bcd7seg.scala 14:9 36:21]
  wire [6:0] _GEN_6 = 4'h9 == io_in ? 7'h10 : _GEN_5; // @[bcd7seg.scala 14:9 34:21]
  wire [6:0] _GEN_7 = 4'h8 == io_in ? 7'h0 : _GEN_6; // @[bcd7seg.scala 14:9 32:21]
  wire [6:0] _GEN_8 = 4'h7 == io_in ? 7'h78 : _GEN_7; // @[bcd7seg.scala 14:9 30:21]
  wire [6:0] _GEN_9 = 4'h6 == io_in ? 7'h2 : _GEN_8; // @[bcd7seg.scala 14:9 28:21]
  wire [6:0] _GEN_10 = 4'h5 == io_in ? 7'h12 : _GEN_9; // @[bcd7seg.scala 14:9 26:21]
  wire [6:0] _GEN_11 = 4'h4 == io_in ? 7'h19 : _GEN_10; // @[bcd7seg.scala 14:9 24:21]
  wire [6:0] _GEN_12 = 4'h3 == io_in ? 7'h30 : _GEN_11; // @[bcd7seg.scala 14:9 22:21]
  wire [6:0] _GEN_13 = 4'h2 == io_in ? 7'h24 : _GEN_12; // @[bcd7seg.scala 14:9 20:20]
  wire [6:0] _GEN_14 = 4'h1 == io_in ? 7'h79 : _GEN_13; // @[bcd7seg.scala 14:9 18:21]
  assign io_out = 4'h0 == io_in ? 7'h40 : _GEN_14; // @[bcd7seg.scala 14:9 16:21]
endmodule
module exp7(
  input         clock,
  input         reset,
  input         io_ps2_clk,
  input         io_ps2_dat,
  output [13:0] io_out_scan
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  wire  keyboard_clock; // @[exp7.scala 191:26]
  wire  keyboard_reset; // @[exp7.scala 191:26]
  wire  keyboard_io_next_data_n; // @[exp7.scala 191:26]
  wire  keyboard_io_ps2_clk; // @[exp7.scala 191:26]
  wire  keyboard_io_ps2_dat; // @[exp7.scala 191:26]
  wire [7:0] keyboard_io_out; // @[exp7.scala 191:26]
  wire  keyboard_io_ready; // @[exp7.scala 191:26]
  wire [3:0] bcd_1_io_in; // @[exp7.scala 195:23]
  wire [6:0] bcd_1_io_out; // @[exp7.scala 195:23]
  wire [3:0] bcd_2_io_in; // @[exp7.scala 196:23]
  wire [6:0] bcd_2_io_out; // @[exp7.scala 196:23]
  reg [13:0] out_scan; // @[exp7.scala 193:27]
  wire [13:0] _out_scan_T = {bcd_2_io_out,bcd_1_io_out}; // @[Cat.scala 31:58]
  keyboard keyboard ( // @[exp7.scala 191:26]
    .clock(keyboard_clock),
    .reset(keyboard_reset),
    .io_next_data_n(keyboard_io_next_data_n),
    .io_ps2_clk(keyboard_io_ps2_clk),
    .io_ps2_dat(keyboard_io_ps2_dat),
    .io_out(keyboard_io_out),
    .io_ready(keyboard_io_ready)
  );
  bcd7 bcd_1 ( // @[exp7.scala 195:23]
    .io_in(bcd_1_io_in),
    .io_out(bcd_1_io_out)
  );
  bcd7 bcd_2 ( // @[exp7.scala 196:23]
    .io_in(bcd_2_io_in),
    .io_out(bcd_2_io_out)
  );
  assign io_out_scan = out_scan; // @[exp7.scala 204:17]
  assign keyboard_clock = clock;
  assign keyboard_reset = reset;
  assign keyboard_io_next_data_n = keyboard_io_ready; // @[exp7.scala 203:29 209:5 212:33]
  assign keyboard_io_ps2_clk = io_ps2_clk; // @[exp7.scala 198:25]
  assign keyboard_io_ps2_dat = io_ps2_dat; // @[exp7.scala 199:25]
  assign bcd_1_io_in = keyboard_io_ready ? keyboard_io_out[3:0] : 4'h0; // @[exp7.scala 201:17 209:5 210:21]
  assign bcd_2_io_in = keyboard_io_ready ? keyboard_io_out[7:4] : 4'h0; // @[exp7.scala 202:17 209:5 211:21]
  always @(posedge clock) begin
    if (reset) begin // @[exp7.scala 193:27]
      out_scan <= 14'h3fff; // @[exp7.scala 193:27]
    end else if (keyboard_io_ready) begin // @[exp7.scala 209:5]
      out_scan <= _out_scan_T; // @[exp7.scala 214:18]
    end
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (keyboard_io_ready & ~reset) begin
          $fwrite(32'h80000002,"scan code %x\n",keyboard_io_out); // @[exp7.scala 213:15]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
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
  out_scan = _RAND_0[13:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule

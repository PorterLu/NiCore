module vmem(
  input         clock,
  input  [9:0]  io_h_addr,
  input  [8:0]  io_v_addr,
  output [23:0] io_vga_data
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
`endif // RANDOMIZE_REG_INIT
  reg [23:0] mem [0:524287]; // @[exp8.scala 76:26]
  wire  mem_io_vga_data_MPORT_en; // @[exp8.scala 76:26]
  wire [18:0] mem_io_vga_data_MPORT_addr; // @[exp8.scala 76:26]
  wire [23:0] mem_io_vga_data_MPORT_data; // @[exp8.scala 76:26]
  reg  mem_io_vga_data_MPORT_en_pipe_0;
  reg [18:0] mem_io_vga_data_MPORT_addr_pipe_0;
  assign mem_io_vga_data_MPORT_en = mem_io_vga_data_MPORT_en_pipe_0;
  assign mem_io_vga_data_MPORT_addr = mem_io_vga_data_MPORT_addr_pipe_0;
  assign mem_io_vga_data_MPORT_data = mem[mem_io_vga_data_MPORT_addr]; // @[exp8.scala 76:26]
  assign io_vga_data = mem_io_vga_data_MPORT_data; // @[exp8.scala 83:17]
  always @(posedge clock) begin
    mem_io_vga_data_MPORT_en_pipe_0 <= 1'h1;
    if (1'h1) begin
      mem_io_vga_data_MPORT_addr_pipe_0 <= {io_h_addr,io_v_addr};
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
  integer initvar;
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
  mem_io_vga_data_MPORT_en_pipe_0 = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  mem_io_vga_data_MPORT_addr_pipe_0 = _RAND_1[18:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
  $readmemh("picture.hex", mem);
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module vga_ctrl(
  input         clock,
  input         reset,
  input  [23:0] io_vga_data,
  output [9:0]  io_h_addr,
  output [9:0]  io_v_addr,
  output        io_hsync,
  output        io_vsync,
  output        io_valid,
  output [7:0]  io_vga_r,
  output [7:0]  io_vga_g,
  output [7:0]  io_vga_b
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
`endif // RANDOMIZE_REG_INIT
  reg [9:0] x_cnt; // @[exp8.scala 34:24]
  reg [9:0] y_cnt; // @[exp8.scala 35:24]
  wire  _T_1 = x_cnt == 10'h320; // @[exp8.scala 39:16]
  wire [9:0] _x_cnt_T_1 = x_cnt + 10'h1; // @[exp8.scala 44:24]
  wire  _T_6 = y_cnt == 10'h20d & _T_1; // @[exp8.scala 47:49]
  wire [9:0] _y_cnt_T_1 = y_cnt + 10'h1; // @[exp8.scala 52:24]
  wire  h_valid = x_cnt > 10'h90 & x_cnt <= 10'h310; // @[exp8.scala 57:56]
  wire  v_valid = y_cnt > 10'h23 & y_cnt <= 10'h203; // @[exp8.scala 58:56]
  wire [9:0] _io_h_addr_T_1 = x_cnt - 10'h91; // @[exp8.scala 61:37]
  wire [9:0] _io_v_addr_T_1 = y_cnt - 10'h24; // @[exp8.scala 62:37]
  assign io_h_addr = h_valid ? _io_h_addr_T_1 : 10'h0; // @[exp8.scala 61:21]
  assign io_v_addr = v_valid ? _io_v_addr_T_1 : 10'h0; // @[exp8.scala 62:21]
  assign io_hsync = x_cnt > 10'h60; // @[exp8.scala 55:23]
  assign io_vsync = y_cnt > 10'h2; // @[exp8.scala 56:23]
  assign io_valid = h_valid & v_valid; // @[exp8.scala 59:25]
  assign io_vga_r = io_vga_data[23:16]; // @[exp8.scala 64:28]
  assign io_vga_g = io_vga_data[15:8]; // @[exp8.scala 65:28]
  assign io_vga_b = io_vga_data[7:0]; // @[exp8.scala 66:28]
  always @(posedge clock) begin
    if (reset) begin // @[exp8.scala 34:24]
      x_cnt <= 10'h0; // @[exp8.scala 34:24]
    end else if (_T_1) begin // @[exp8.scala 40:5]
      x_cnt <= 10'h1; // @[exp8.scala 41:15]
    end else begin
      x_cnt <= _x_cnt_T_1; // @[exp8.scala 44:15]
    end
    if (reset) begin // @[exp8.scala 35:24]
      y_cnt <= 10'h0; // @[exp8.scala 35:24]
    end else if (_T_6) begin // @[exp8.scala 48:5]
      y_cnt <= 10'h1; // @[exp8.scala 49:15]
    end else if (_T_1) begin // @[exp8.scala 51:5]
      y_cnt <= _y_cnt_T_1; // @[exp8.scala 52:15]
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
  x_cnt = _RAND_0[9:0];
  _RAND_1 = {1{`RANDOM}};
  y_cnt = _RAND_1[9:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module exp8(
  input        clock,
  input        reset,
  output       io_hsync,
  output       io_vsync,
  output       io_valid,
  output [7:0] io_vga_r,
  output [7:0] io_vga_g,
  output [7:0] io_vga_b
);
  wire  mem_clock; // @[exp8.scala 98:21]
  wire [9:0] mem_io_h_addr; // @[exp8.scala 98:21]
  wire [8:0] mem_io_v_addr; // @[exp8.scala 98:21]
  wire [23:0] mem_io_vga_data; // @[exp8.scala 98:21]
  wire  vga_ctrl_clock; // @[exp8.scala 99:26]
  wire  vga_ctrl_reset; // @[exp8.scala 99:26]
  wire [23:0] vga_ctrl_io_vga_data; // @[exp8.scala 99:26]
  wire [9:0] vga_ctrl_io_h_addr; // @[exp8.scala 99:26]
  wire [9:0] vga_ctrl_io_v_addr; // @[exp8.scala 99:26]
  wire  vga_ctrl_io_hsync; // @[exp8.scala 99:26]
  wire  vga_ctrl_io_vsync; // @[exp8.scala 99:26]
  wire  vga_ctrl_io_valid; // @[exp8.scala 99:26]
  wire [7:0] vga_ctrl_io_vga_r; // @[exp8.scala 99:26]
  wire [7:0] vga_ctrl_io_vga_g; // @[exp8.scala 99:26]
  wire [7:0] vga_ctrl_io_vga_b; // @[exp8.scala 99:26]
  vmem mem ( // @[exp8.scala 98:21]
    .clock(mem_clock),
    .io_h_addr(mem_io_h_addr),
    .io_v_addr(mem_io_v_addr),
    .io_vga_data(mem_io_vga_data)
  );
  vga_ctrl vga_ctrl ( // @[exp8.scala 99:26]
    .clock(vga_ctrl_clock),
    .reset(vga_ctrl_reset),
    .io_vga_data(vga_ctrl_io_vga_data),
    .io_h_addr(vga_ctrl_io_h_addr),
    .io_v_addr(vga_ctrl_io_v_addr),
    .io_hsync(vga_ctrl_io_hsync),
    .io_vsync(vga_ctrl_io_vsync),
    .io_valid(vga_ctrl_io_valid),
    .io_vga_r(vga_ctrl_io_vga_r),
    .io_vga_g(vga_ctrl_io_vga_g),
    .io_vga_b(vga_ctrl_io_vga_b)
  );
  assign io_hsync = vga_ctrl_io_hsync; // @[exp8.scala 105:14]
  assign io_vsync = vga_ctrl_io_vsync; // @[exp8.scala 106:14]
  assign io_valid = vga_ctrl_io_valid; // @[exp8.scala 107:14]
  assign io_vga_r = vga_ctrl_io_vga_r; // @[exp8.scala 108:14]
  assign io_vga_g = vga_ctrl_io_vga_g; // @[exp8.scala 109:14]
  assign io_vga_b = vga_ctrl_io_vga_b; // @[exp8.scala 110:14]
  assign mem_clock = clock;
  assign mem_io_h_addr = vga_ctrl_io_h_addr; // @[exp8.scala 101:19]
  assign mem_io_v_addr = vga_ctrl_io_v_addr[8:0]; // @[exp8.scala 102:40]
  assign vga_ctrl_clock = clock;
  assign vga_ctrl_reset = reset;
  assign vga_ctrl_io_vga_data = mem_io_vga_data; // @[exp8.scala 103:26]
endmodule

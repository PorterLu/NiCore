module tag_cache(
  input         clock,
  input  [2:0]  io_cache_req_index,
  input         io_cache_req_we,
  input         io_tag_write_valid,
  input         io_tag_write_dirty,
  input  [7:0]  io_tag_write_visit,
  input  [53:0] io_tag_write_tag,
  output        io_tag_read_valid,
  output        io_tag_read_dirty,
  output [7:0]  io_tag_read_visit,
  output [53:0] io_tag_read_tag
);
`ifdef RANDOMIZE_MEM_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_6;
  reg [63:0] _RAND_9;
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
  reg [31:0] _RAND_10;
  reg [31:0] _RAND_11;
`endif // RANDOMIZE_REG_INIT
  reg  tag_mem_valid [0:7]; // @[test.scala 84:34]
  wire  tag_mem_valid_io_tag_read_MPORT_en; // @[test.scala 84:34]
  wire [2:0] tag_mem_valid_io_tag_read_MPORT_addr; // @[test.scala 84:34]
  wire  tag_mem_valid_io_tag_read_MPORT_data; // @[test.scala 84:34]
  wire  tag_mem_valid_MPORT_data; // @[test.scala 84:34]
  wire [2:0] tag_mem_valid_MPORT_addr; // @[test.scala 84:34]
  wire  tag_mem_valid_MPORT_mask; // @[test.scala 84:34]
  wire  tag_mem_valid_MPORT_en; // @[test.scala 84:34]
  reg  tag_mem_valid_io_tag_read_MPORT_en_pipe_0;
  reg [2:0] tag_mem_valid_io_tag_read_MPORT_addr_pipe_0;
  reg  tag_mem_dirty [0:7]; // @[test.scala 84:34]
  wire  tag_mem_dirty_io_tag_read_MPORT_en; // @[test.scala 84:34]
  wire [2:0] tag_mem_dirty_io_tag_read_MPORT_addr; // @[test.scala 84:34]
  wire  tag_mem_dirty_io_tag_read_MPORT_data; // @[test.scala 84:34]
  wire  tag_mem_dirty_MPORT_data; // @[test.scala 84:34]
  wire [2:0] tag_mem_dirty_MPORT_addr; // @[test.scala 84:34]
  wire  tag_mem_dirty_MPORT_mask; // @[test.scala 84:34]
  wire  tag_mem_dirty_MPORT_en; // @[test.scala 84:34]
  reg  tag_mem_dirty_io_tag_read_MPORT_en_pipe_0;
  reg [2:0] tag_mem_dirty_io_tag_read_MPORT_addr_pipe_0;
  reg [7:0] tag_mem_visit [0:7]; // @[test.scala 84:34]
  wire  tag_mem_visit_io_tag_read_MPORT_en; // @[test.scala 84:34]
  wire [2:0] tag_mem_visit_io_tag_read_MPORT_addr; // @[test.scala 84:34]
  wire [7:0] tag_mem_visit_io_tag_read_MPORT_data; // @[test.scala 84:34]
  wire [7:0] tag_mem_visit_MPORT_data; // @[test.scala 84:34]
  wire [2:0] tag_mem_visit_MPORT_addr; // @[test.scala 84:34]
  wire  tag_mem_visit_MPORT_mask; // @[test.scala 84:34]
  wire  tag_mem_visit_MPORT_en; // @[test.scala 84:34]
  reg  tag_mem_visit_io_tag_read_MPORT_en_pipe_0;
  reg [2:0] tag_mem_visit_io_tag_read_MPORT_addr_pipe_0;
  reg [53:0] tag_mem_tag [0:7]; // @[test.scala 84:34]
  wire  tag_mem_tag_io_tag_read_MPORT_en; // @[test.scala 84:34]
  wire [2:0] tag_mem_tag_io_tag_read_MPORT_addr; // @[test.scala 84:34]
  wire [53:0] tag_mem_tag_io_tag_read_MPORT_data; // @[test.scala 84:34]
  wire [53:0] tag_mem_tag_MPORT_data; // @[test.scala 84:34]
  wire [2:0] tag_mem_tag_MPORT_addr; // @[test.scala 84:34]
  wire  tag_mem_tag_MPORT_mask; // @[test.scala 84:34]
  wire  tag_mem_tag_MPORT_en; // @[test.scala 84:34]
  reg  tag_mem_tag_io_tag_read_MPORT_en_pipe_0;
  reg [2:0] tag_mem_tag_io_tag_read_MPORT_addr_pipe_0;
  assign tag_mem_valid_io_tag_read_MPORT_en = tag_mem_valid_io_tag_read_MPORT_en_pipe_0;
  assign tag_mem_valid_io_tag_read_MPORT_addr = tag_mem_valid_io_tag_read_MPORT_addr_pipe_0;
  assign tag_mem_valid_io_tag_read_MPORT_data = tag_mem_valid[tag_mem_valid_io_tag_read_MPORT_addr]; // @[test.scala 84:34]
  assign tag_mem_valid_MPORT_data = io_tag_write_valid;
  assign tag_mem_valid_MPORT_addr = io_cache_req_index;
  assign tag_mem_valid_MPORT_mask = 1'h1;
  assign tag_mem_valid_MPORT_en = io_cache_req_we;
  assign tag_mem_dirty_io_tag_read_MPORT_en = tag_mem_dirty_io_tag_read_MPORT_en_pipe_0;
  assign tag_mem_dirty_io_tag_read_MPORT_addr = tag_mem_dirty_io_tag_read_MPORT_addr_pipe_0;
  assign tag_mem_dirty_io_tag_read_MPORT_data = tag_mem_dirty[tag_mem_dirty_io_tag_read_MPORT_addr]; // @[test.scala 84:34]
  assign tag_mem_dirty_MPORT_data = io_tag_write_dirty;
  assign tag_mem_dirty_MPORT_addr = io_cache_req_index;
  assign tag_mem_dirty_MPORT_mask = 1'h1;
  assign tag_mem_dirty_MPORT_en = io_cache_req_we;
  assign tag_mem_visit_io_tag_read_MPORT_en = tag_mem_visit_io_tag_read_MPORT_en_pipe_0;
  assign tag_mem_visit_io_tag_read_MPORT_addr = tag_mem_visit_io_tag_read_MPORT_addr_pipe_0;
  assign tag_mem_visit_io_tag_read_MPORT_data = tag_mem_visit[tag_mem_visit_io_tag_read_MPORT_addr]; // @[test.scala 84:34]
  assign tag_mem_visit_MPORT_data = io_tag_write_visit;
  assign tag_mem_visit_MPORT_addr = io_cache_req_index;
  assign tag_mem_visit_MPORT_mask = 1'h1;
  assign tag_mem_visit_MPORT_en = io_cache_req_we;
  assign tag_mem_tag_io_tag_read_MPORT_en = tag_mem_tag_io_tag_read_MPORT_en_pipe_0;
  assign tag_mem_tag_io_tag_read_MPORT_addr = tag_mem_tag_io_tag_read_MPORT_addr_pipe_0;
  assign tag_mem_tag_io_tag_read_MPORT_data = tag_mem_tag[tag_mem_tag_io_tag_read_MPORT_addr]; // @[test.scala 84:34]
  assign tag_mem_tag_MPORT_data = io_tag_write_tag;
  assign tag_mem_tag_MPORT_addr = io_cache_req_index;
  assign tag_mem_tag_MPORT_mask = 1'h1;
  assign tag_mem_tag_MPORT_en = io_cache_req_we;
  assign io_tag_read_valid = tag_mem_valid_io_tag_read_MPORT_data; // @[test.scala 85:21]
  assign io_tag_read_dirty = tag_mem_dirty_io_tag_read_MPORT_data; // @[test.scala 85:21]
  assign io_tag_read_visit = tag_mem_visit_io_tag_read_MPORT_data; // @[test.scala 85:21]
  assign io_tag_read_tag = tag_mem_tag_io_tag_read_MPORT_data; // @[test.scala 85:21]
  always @(posedge clock) begin
    if (tag_mem_valid_MPORT_en & tag_mem_valid_MPORT_mask) begin
      tag_mem_valid[tag_mem_valid_MPORT_addr] <= tag_mem_valid_MPORT_data; // @[test.scala 84:34]
    end
    tag_mem_valid_io_tag_read_MPORT_en_pipe_0 <= 1'h1;
    if (1'h1) begin
      tag_mem_valid_io_tag_read_MPORT_addr_pipe_0 <= io_cache_req_index;
    end
    if (tag_mem_dirty_MPORT_en & tag_mem_dirty_MPORT_mask) begin
      tag_mem_dirty[tag_mem_dirty_MPORT_addr] <= tag_mem_dirty_MPORT_data; // @[test.scala 84:34]
    end
    tag_mem_dirty_io_tag_read_MPORT_en_pipe_0 <= 1'h1;
    if (1'h1) begin
      tag_mem_dirty_io_tag_read_MPORT_addr_pipe_0 <= io_cache_req_index;
    end
    if (tag_mem_visit_MPORT_en & tag_mem_visit_MPORT_mask) begin
      tag_mem_visit[tag_mem_visit_MPORT_addr] <= tag_mem_visit_MPORT_data; // @[test.scala 84:34]
    end
    tag_mem_visit_io_tag_read_MPORT_en_pipe_0 <= 1'h1;
    if (1'h1) begin
      tag_mem_visit_io_tag_read_MPORT_addr_pipe_0 <= io_cache_req_index;
    end
    if (tag_mem_tag_MPORT_en & tag_mem_tag_MPORT_mask) begin
      tag_mem_tag[tag_mem_tag_MPORT_addr] <= tag_mem_tag_MPORT_data; // @[test.scala 84:34]
    end
    tag_mem_tag_io_tag_read_MPORT_en_pipe_0 <= 1'h1;
    if (1'h1) begin
      tag_mem_tag_io_tag_read_MPORT_addr_pipe_0 <= io_cache_req_index;
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
`ifdef RANDOMIZE_MEM_INIT
  _RAND_0 = {1{`RANDOM}};
  for (initvar = 0; initvar < 8; initvar = initvar+1)
    tag_mem_valid[initvar] = _RAND_0[0:0];
  _RAND_3 = {1{`RANDOM}};
  for (initvar = 0; initvar < 8; initvar = initvar+1)
    tag_mem_dirty[initvar] = _RAND_3[0:0];
  _RAND_6 = {1{`RANDOM}};
  for (initvar = 0; initvar < 8; initvar = initvar+1)
    tag_mem_visit[initvar] = _RAND_6[7:0];
  _RAND_9 = {2{`RANDOM}};
  for (initvar = 0; initvar < 8; initvar = initvar+1)
    tag_mem_tag[initvar] = _RAND_9[53:0];
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  tag_mem_valid_io_tag_read_MPORT_en_pipe_0 = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  tag_mem_valid_io_tag_read_MPORT_addr_pipe_0 = _RAND_2[2:0];
  _RAND_4 = {1{`RANDOM}};
  tag_mem_dirty_io_tag_read_MPORT_en_pipe_0 = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  tag_mem_dirty_io_tag_read_MPORT_addr_pipe_0 = _RAND_5[2:0];
  _RAND_7 = {1{`RANDOM}};
  tag_mem_visit_io_tag_read_MPORT_en_pipe_0 = _RAND_7[0:0];
  _RAND_8 = {1{`RANDOM}};
  tag_mem_visit_io_tag_read_MPORT_addr_pipe_0 = _RAND_8[2:0];
  _RAND_10 = {1{`RANDOM}};
  tag_mem_tag_io_tag_read_MPORT_en_pipe_0 = _RAND_10[0:0];
  _RAND_11 = {1{`RANDOM}};
  tag_mem_tag_io_tag_read_MPORT_addr_pipe_0 = _RAND_11[2:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module data_cache(
  input          clock,
  input  [2:0]   io_cache_req_index,
  input          io_cache_req_we,
  input  [127:0] io_data_write_data,
  output [127:0] io_data_read_data
);
`ifdef RANDOMIZE_MEM_INIT
  reg [127:0] _RAND_0;
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
`endif // RANDOMIZE_REG_INIT
  reg [127:0] data_mem_data [0:7]; // @[test.scala 98:35]
  wire  data_mem_data_io_data_read_MPORT_en; // @[test.scala 98:35]
  wire [2:0] data_mem_data_io_data_read_MPORT_addr; // @[test.scala 98:35]
  wire [127:0] data_mem_data_io_data_read_MPORT_data; // @[test.scala 98:35]
  wire [127:0] data_mem_data_MPORT_data; // @[test.scala 98:35]
  wire [2:0] data_mem_data_MPORT_addr; // @[test.scala 98:35]
  wire  data_mem_data_MPORT_mask; // @[test.scala 98:35]
  wire  data_mem_data_MPORT_en; // @[test.scala 98:35]
  reg  data_mem_data_io_data_read_MPORT_en_pipe_0;
  reg [2:0] data_mem_data_io_data_read_MPORT_addr_pipe_0;
  assign data_mem_data_io_data_read_MPORT_en = data_mem_data_io_data_read_MPORT_en_pipe_0;
  assign data_mem_data_io_data_read_MPORT_addr = data_mem_data_io_data_read_MPORT_addr_pipe_0;
  assign data_mem_data_io_data_read_MPORT_data = data_mem_data[data_mem_data_io_data_read_MPORT_addr]; // @[test.scala 98:35]
  assign data_mem_data_MPORT_data = io_data_write_data;
  assign data_mem_data_MPORT_addr = io_cache_req_index;
  assign data_mem_data_MPORT_mask = 1'h1;
  assign data_mem_data_MPORT_en = io_cache_req_we;
  assign io_data_read_data = data_mem_data_io_data_read_MPORT_data; // @[test.scala 99:22]
  always @(posedge clock) begin
    if (data_mem_data_MPORT_en & data_mem_data_MPORT_mask) begin
      data_mem_data[data_mem_data_MPORT_addr] <= data_mem_data_MPORT_data; // @[test.scala 98:35]
    end
    data_mem_data_io_data_read_MPORT_en_pipe_0 <= 1'h1;
    if (1'h1) begin
      data_mem_data_io_data_read_MPORT_addr_pipe_0 <= io_cache_req_index;
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
`ifdef RANDOMIZE_MEM_INIT
  _RAND_0 = {4{`RANDOM}};
  for (initvar = 0; initvar < 8; initvar = initvar+1)
    data_mem_data[initvar] = _RAND_0[127:0];
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  data_mem_data_io_data_read_MPORT_en_pipe_0 = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  data_mem_data_io_data_read_MPORT_addr_pipe_0 = _RAND_2[2:0];
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
  input  [63:0] io_cpu_request_addr,
  input  [63:0] io_cpu_request_data,
  input  [7:0]  io_cpu_request_mask,
  input         io_cpu_request_rw,
  input         io_cpu_request_valid,
  output [63:0] io_cpu_response_data,
  output        io_cpu_response_ready,
  input  [63:0] io_mem_response_data,
  input         io_mem_response_ready,
  output [63:0] io_mem_request_addr,
  output [63:0] io_mem_request_data,
  output        io_mem_request_rw,
  output        io_mem_request_valid
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [63:0] _RAND_3;
`endif // RANDOMIZE_REG_INIT
  wire  tag_mem_0_clock; // @[test.scala 128:45]
  wire [2:0] tag_mem_0_io_cache_req_index; // @[test.scala 128:45]
  wire  tag_mem_0_io_cache_req_we; // @[test.scala 128:45]
  wire  tag_mem_0_io_tag_write_valid; // @[test.scala 128:45]
  wire  tag_mem_0_io_tag_write_dirty; // @[test.scala 128:45]
  wire [7:0] tag_mem_0_io_tag_write_visit; // @[test.scala 128:45]
  wire [53:0] tag_mem_0_io_tag_write_tag; // @[test.scala 128:45]
  wire  tag_mem_0_io_tag_read_valid; // @[test.scala 128:45]
  wire  tag_mem_0_io_tag_read_dirty; // @[test.scala 128:45]
  wire [7:0] tag_mem_0_io_tag_read_visit; // @[test.scala 128:45]
  wire [53:0] tag_mem_0_io_tag_read_tag; // @[test.scala 128:45]
  wire  tag_mem_1_clock; // @[test.scala 128:45]
  wire [2:0] tag_mem_1_io_cache_req_index; // @[test.scala 128:45]
  wire  tag_mem_1_io_cache_req_we; // @[test.scala 128:45]
  wire  tag_mem_1_io_tag_write_valid; // @[test.scala 128:45]
  wire  tag_mem_1_io_tag_write_dirty; // @[test.scala 128:45]
  wire [7:0] tag_mem_1_io_tag_write_visit; // @[test.scala 128:45]
  wire [53:0] tag_mem_1_io_tag_write_tag; // @[test.scala 128:45]
  wire  tag_mem_1_io_tag_read_valid; // @[test.scala 128:45]
  wire  tag_mem_1_io_tag_read_dirty; // @[test.scala 128:45]
  wire [7:0] tag_mem_1_io_tag_read_visit; // @[test.scala 128:45]
  wire [53:0] tag_mem_1_io_tag_read_tag; // @[test.scala 128:45]
  wire  tag_mem_2_clock; // @[test.scala 128:45]
  wire [2:0] tag_mem_2_io_cache_req_index; // @[test.scala 128:45]
  wire  tag_mem_2_io_cache_req_we; // @[test.scala 128:45]
  wire  tag_mem_2_io_tag_write_valid; // @[test.scala 128:45]
  wire  tag_mem_2_io_tag_write_dirty; // @[test.scala 128:45]
  wire [7:0] tag_mem_2_io_tag_write_visit; // @[test.scala 128:45]
  wire [53:0] tag_mem_2_io_tag_write_tag; // @[test.scala 128:45]
  wire  tag_mem_2_io_tag_read_valid; // @[test.scala 128:45]
  wire  tag_mem_2_io_tag_read_dirty; // @[test.scala 128:45]
  wire [7:0] tag_mem_2_io_tag_read_visit; // @[test.scala 128:45]
  wire [53:0] tag_mem_2_io_tag_read_tag; // @[test.scala 128:45]
  wire  tag_mem_3_clock; // @[test.scala 128:45]
  wire [2:0] tag_mem_3_io_cache_req_index; // @[test.scala 128:45]
  wire  tag_mem_3_io_cache_req_we; // @[test.scala 128:45]
  wire  tag_mem_3_io_tag_write_valid; // @[test.scala 128:45]
  wire  tag_mem_3_io_tag_write_dirty; // @[test.scala 128:45]
  wire [7:0] tag_mem_3_io_tag_write_visit; // @[test.scala 128:45]
  wire [53:0] tag_mem_3_io_tag_write_tag; // @[test.scala 128:45]
  wire  tag_mem_3_io_tag_read_valid; // @[test.scala 128:45]
  wire  tag_mem_3_io_tag_read_dirty; // @[test.scala 128:45]
  wire [7:0] tag_mem_3_io_tag_read_visit; // @[test.scala 128:45]
  wire [53:0] tag_mem_3_io_tag_read_tag; // @[test.scala 128:45]
  wire  data_mem_0_clock; // @[test.scala 129:46]
  wire [2:0] data_mem_0_io_cache_req_index; // @[test.scala 129:46]
  wire  data_mem_0_io_cache_req_we; // @[test.scala 129:46]
  wire [127:0] data_mem_0_io_data_write_data; // @[test.scala 129:46]
  wire [127:0] data_mem_0_io_data_read_data; // @[test.scala 129:46]
  wire  data_mem_1_clock; // @[test.scala 129:46]
  wire [2:0] data_mem_1_io_cache_req_index; // @[test.scala 129:46]
  wire  data_mem_1_io_cache_req_we; // @[test.scala 129:46]
  wire [127:0] data_mem_1_io_data_write_data; // @[test.scala 129:46]
  wire [127:0] data_mem_1_io_data_read_data; // @[test.scala 129:46]
  wire  data_mem_2_clock; // @[test.scala 129:46]
  wire [2:0] data_mem_2_io_cache_req_index; // @[test.scala 129:46]
  wire  data_mem_2_io_cache_req_we; // @[test.scala 129:46]
  wire [127:0] data_mem_2_io_data_write_data; // @[test.scala 129:46]
  wire [127:0] data_mem_2_io_data_read_data; // @[test.scala 129:46]
  wire  data_mem_3_clock; // @[test.scala 129:46]
  wire [2:0] data_mem_3_io_cache_req_index; // @[test.scala 129:46]
  wire  data_mem_3_io_cache_req_we; // @[test.scala 129:46]
  wire [127:0] data_mem_3_io_data_write_data; // @[test.scala 129:46]
  wire [127:0] data_mem_3_io_data_read_data; // @[test.scala 129:46]
  reg [1:0] cache_state; // @[test.scala 126:34]
  reg  index; // @[Counter.scala 62:40]
  wire  _GEN_163 = 2'h2 == cache_state & io_mem_response_ready; // @[test.scala 160:28 293:39]
  wire  _GEN_177 = 2'h3 == cache_state ? io_mem_response_ready : _GEN_163; // @[test.scala 160:28 265:39]
  wire  _GEN_218 = 2'h1 == cache_state ? 1'h0 : _GEN_177; // @[test.scala 160:28]
  wire  fill_block_en = 2'h0 == cache_state ? 1'h0 : _GEN_218; // @[test.scala 160:28]
  wire  _GEN_0 = fill_block_en ? index + 1'h1 : index; // @[Counter.scala 120:16 78:15 62:40]
  wire  warp_out = fill_block_en & index; // @[Counter.scala 120:{16,23}]
  reg [1:0] replace; // @[test.scala 135:30]
  reg [63:0] writeback_addr; // @[test.scala 137:37]
  wire [54:0] _GEN_264 = {{1'd0}, tag_mem_0_io_tag_read_tag}; // @[test.scala 168:73]
  wire  is_match_0 = _GEN_264 == io_cpu_request_addr[63:9] & tag_mem_0_io_tag_read_valid; // @[test.scala 168:141]
  wire [54:0] _GEN_265 = {{1'd0}, tag_mem_1_io_tag_read_tag}; // @[test.scala 168:73]
  wire  is_match_1 = _GEN_265 == io_cpu_request_addr[63:9] & tag_mem_1_io_tag_read_valid; // @[test.scala 168:141]
  wire [54:0] _GEN_266 = {{1'd0}, tag_mem_2_io_tag_read_tag}; // @[test.scala 168:73]
  wire  is_match_2 = _GEN_266 == io_cpu_request_addr[63:9] & tag_mem_2_io_tag_read_valid; // @[test.scala 168:141]
  wire [54:0] _GEN_267 = {{1'd0}, tag_mem_3_io_tag_read_tag}; // @[test.scala 168:73]
  wire  is_match_3 = _GEN_267 == io_cpu_request_addr[63:9] & tag_mem_3_io_tag_read_valid; // @[test.scala 168:141]
  wire [3:0] _T_18 = {is_match_3,is_match_2,is_match_1,is_match_0}; // @[test.scala 169:39]
  wire  _T_19 = |_T_18; // @[test.scala 169:46]
  wire [127:0] _io_cpu_response_data_T = is_match_2 ? data_mem_2_io_data_read_data : data_mem_3_io_data_read_data; // @[Mux.scala 101:16]
  wire [127:0] _io_cpu_response_data_T_1 = is_match_1 ? data_mem_1_io_data_read_data : _io_cpu_response_data_T; // @[Mux.scala 101:16]
  wire [127:0] _io_cpu_response_data_T_2 = is_match_0 ? data_mem_0_io_data_read_data : _io_cpu_response_data_T_1; // @[Mux.scala 101:16]
  wire [7:0] _part_0_T_5 = io_cpu_request_mask[0] ? io_cpu_request_data[7:0] : data_mem_0_io_data_read_data[7:0]; // @[test.scala 188:79]
  wire [15:0] _part_1_T_2 = {io_cpu_request_data[15:8], 8'h0}; // @[test.scala 188:140]
  wire [15:0] _part_1_T_4 = {data_mem_0_io_data_read_data[15:8], 8'h0}; // @[test.scala 188:200]
  wire [15:0] _part_1_T_5 = io_cpu_request_mask[1] ? _part_1_T_2 : _part_1_T_4; // @[test.scala 188:79]
  wire [23:0] _part_2_T_2 = {io_cpu_request_data[23:16], 16'h0}; // @[test.scala 188:140]
  wire [23:0] _part_2_T_4 = {data_mem_0_io_data_read_data[23:16], 16'h0}; // @[test.scala 188:200]
  wire [23:0] _part_2_T_5 = io_cpu_request_mask[2] ? _part_2_T_2 : _part_2_T_4; // @[test.scala 188:79]
  wire [31:0] _part_3_T_2 = {io_cpu_request_data[31:24], 24'h0}; // @[test.scala 188:140]
  wire [31:0] _part_3_T_4 = {data_mem_0_io_data_read_data[31:24], 24'h0}; // @[test.scala 188:200]
  wire [31:0] _part_3_T_5 = io_cpu_request_mask[3] ? _part_3_T_2 : _part_3_T_4; // @[test.scala 188:79]
  wire [39:0] _part_4_T_2 = {io_cpu_request_data[39:32], 32'h0}; // @[test.scala 188:140]
  wire [39:0] _part_4_T_4 = {data_mem_0_io_data_read_data[39:32], 32'h0}; // @[test.scala 188:200]
  wire [39:0] _part_4_T_5 = io_cpu_request_mask[4] ? _part_4_T_2 : _part_4_T_4; // @[test.scala 188:79]
  wire [47:0] _part_5_T_2 = {io_cpu_request_data[47:40], 40'h0}; // @[test.scala 188:140]
  wire [47:0] _part_5_T_4 = {data_mem_0_io_data_read_data[47:40], 40'h0}; // @[test.scala 188:200]
  wire [47:0] _part_5_T_5 = io_cpu_request_mask[5] ? _part_5_T_2 : _part_5_T_4; // @[test.scala 188:79]
  wire [55:0] _part_6_T_2 = {io_cpu_request_data[55:48], 48'h0}; // @[test.scala 188:140]
  wire [55:0] _part_6_T_4 = {data_mem_0_io_data_read_data[55:48], 48'h0}; // @[test.scala 188:200]
  wire [55:0] _part_6_T_5 = io_cpu_request_mask[6] ? _part_6_T_2 : _part_6_T_4; // @[test.scala 188:79]
  wire [63:0] _part_7_T_2 = {io_cpu_request_data[63:56], 56'h0}; // @[test.scala 188:140]
  wire [63:0] _part_7_T_4 = {data_mem_0_io_data_read_data[63:56], 56'h0}; // @[test.scala 188:200]
  wire [63:0] part__7 = io_cpu_request_mask[7] ? _part_7_T_2 : _part_7_T_4; // @[test.scala 188:79]
  wire [63:0] part__0 = {{56'd0}, _part_0_T_5}; // @[test.scala 186:72 188:73]
  wire [63:0] part__1 = {{48'd0}, _part_1_T_5}; // @[test.scala 186:72 188:73]
  wire [63:0] _data_mem_0_io_data_write_data_T_2 = part__0 | part__1; // @[test.scala 193:164]
  wire [63:0] part__2 = {{40'd0}, _part_2_T_5}; // @[test.scala 186:72 188:73]
  wire [63:0] _data_mem_0_io_data_write_data_T_3 = _data_mem_0_io_data_write_data_T_2 | part__2; // @[test.scala 193:164]
  wire [63:0] part__3 = {{32'd0}, _part_3_T_5}; // @[test.scala 186:72 188:73]
  wire [63:0] _data_mem_0_io_data_write_data_T_4 = _data_mem_0_io_data_write_data_T_3 | part__3; // @[test.scala 193:164]
  wire [63:0] part__4 = {{24'd0}, _part_4_T_5}; // @[test.scala 186:72 188:73]
  wire [63:0] _data_mem_0_io_data_write_data_T_5 = _data_mem_0_io_data_write_data_T_4 | part__4; // @[test.scala 193:164]
  wire [63:0] part__5 = {{16'd0}, _part_5_T_5}; // @[test.scala 186:72 188:73]
  wire [63:0] _data_mem_0_io_data_write_data_T_6 = _data_mem_0_io_data_write_data_T_5 | part__5; // @[test.scala 193:164]
  wire [63:0] part__6 = {{8'd0}, _part_6_T_5}; // @[test.scala 186:72 188:73]
  wire [63:0] _data_mem_0_io_data_write_data_T_7 = _data_mem_0_io_data_write_data_T_6 | part__6; // @[test.scala 193:164]
  wire [63:0] _data_mem_0_io_data_write_data_T_8 = _data_mem_0_io_data_write_data_T_7 | part__7; // @[test.scala 193:164]
  wire [127:0] _data_mem_0_io_data_write_data_T_10 = {_data_mem_0_io_data_write_data_T_8,data_mem_0_io_data_read_data[63
    :0]}; // @[Cat.scala 31:58]
  wire [127:0] _data_mem_0_io_data_write_data_T_19 = {data_mem_0_io_data_read_data[127:64],
    _data_mem_0_io_data_write_data_T_8}; // @[Cat.scala 31:58]
  wire [127:0] _data_mem_0_io_data_write_data_T_20 = io_cpu_request_addr[6:0] == 7'h0 ?
    _data_mem_0_io_data_write_data_T_10 : _data_mem_0_io_data_write_data_T_19; // @[test.scala 193:94]
  wire  _GEN_4 = is_match_0 | tag_mem_0_io_tag_read_valid; // @[test.scala 146:41 179:66 182:87]
  wire  _GEN_5 = is_match_0 | tag_mem_0_io_tag_read_dirty; // @[test.scala 146:41 179:66 183:87]
  wire [54:0] _GEN_6 = is_match_0 ? io_cpu_request_addr[63:9] : {{1'd0}, tag_mem_0_io_tag_read_tag}; // @[test.scala 146:41 179:66 184:85]
  wire [127:0] _GEN_7 = is_match_0 ? _data_mem_0_io_data_write_data_T_20 : data_mem_0_io_data_read_data; // @[test.scala 147:43 179:66 193:88]
  wire [7:0] _part_0_T_11 = io_cpu_request_mask[0] ? io_cpu_request_data[7:0] : data_mem_1_io_data_read_data[7:0]; // @[test.scala 188:79]
  wire [15:0] _part_1_T_10 = {data_mem_1_io_data_read_data[15:8], 8'h0}; // @[test.scala 188:200]
  wire [15:0] _part_1_T_11 = io_cpu_request_mask[1] ? _part_1_T_2 : _part_1_T_10; // @[test.scala 188:79]
  wire [23:0] _part_2_T_10 = {data_mem_1_io_data_read_data[23:16], 16'h0}; // @[test.scala 188:200]
  wire [23:0] _part_2_T_11 = io_cpu_request_mask[2] ? _part_2_T_2 : _part_2_T_10; // @[test.scala 188:79]
  wire [31:0] _part_3_T_10 = {data_mem_1_io_data_read_data[31:24], 24'h0}; // @[test.scala 188:200]
  wire [31:0] _part_3_T_11 = io_cpu_request_mask[3] ? _part_3_T_2 : _part_3_T_10; // @[test.scala 188:79]
  wire [39:0] _part_4_T_10 = {data_mem_1_io_data_read_data[39:32], 32'h0}; // @[test.scala 188:200]
  wire [39:0] _part_4_T_11 = io_cpu_request_mask[4] ? _part_4_T_2 : _part_4_T_10; // @[test.scala 188:79]
  wire [47:0] _part_5_T_10 = {data_mem_1_io_data_read_data[47:40], 40'h0}; // @[test.scala 188:200]
  wire [47:0] _part_5_T_11 = io_cpu_request_mask[5] ? _part_5_T_2 : _part_5_T_10; // @[test.scala 188:79]
  wire [55:0] _part_6_T_10 = {data_mem_1_io_data_read_data[55:48], 48'h0}; // @[test.scala 188:200]
  wire [55:0] _part_6_T_11 = io_cpu_request_mask[6] ? _part_6_T_2 : _part_6_T_10; // @[test.scala 188:79]
  wire [63:0] _part_7_T_10 = {data_mem_1_io_data_read_data[63:56], 56'h0}; // @[test.scala 188:200]
  wire [63:0] part_1_7 = io_cpu_request_mask[7] ? _part_7_T_2 : _part_7_T_10; // @[test.scala 188:79]
  wire [63:0] part_1_0 = {{56'd0}, _part_0_T_11}; // @[test.scala 186:72 188:73]
  wire [63:0] part_1_1 = {{48'd0}, _part_1_T_11}; // @[test.scala 186:72 188:73]
  wire [63:0] _data_mem_1_io_data_write_data_T_2 = part_1_0 | part_1_1; // @[test.scala 193:164]
  wire [63:0] part_1_2 = {{40'd0}, _part_2_T_11}; // @[test.scala 186:72 188:73]
  wire [63:0] _data_mem_1_io_data_write_data_T_3 = _data_mem_1_io_data_write_data_T_2 | part_1_2; // @[test.scala 193:164]
  wire [63:0] part_1_3 = {{32'd0}, _part_3_T_11}; // @[test.scala 186:72 188:73]
  wire [63:0] _data_mem_1_io_data_write_data_T_4 = _data_mem_1_io_data_write_data_T_3 | part_1_3; // @[test.scala 193:164]
  wire [63:0] part_1_4 = {{24'd0}, _part_4_T_11}; // @[test.scala 186:72 188:73]
  wire [63:0] _data_mem_1_io_data_write_data_T_5 = _data_mem_1_io_data_write_data_T_4 | part_1_4; // @[test.scala 193:164]
  wire [63:0] part_1_5 = {{16'd0}, _part_5_T_11}; // @[test.scala 186:72 188:73]
  wire [63:0] _data_mem_1_io_data_write_data_T_6 = _data_mem_1_io_data_write_data_T_5 | part_1_5; // @[test.scala 193:164]
  wire [63:0] part_1_6 = {{8'd0}, _part_6_T_11}; // @[test.scala 186:72 188:73]
  wire [63:0] _data_mem_1_io_data_write_data_T_7 = _data_mem_1_io_data_write_data_T_6 | part_1_6; // @[test.scala 193:164]
  wire [63:0] _data_mem_1_io_data_write_data_T_8 = _data_mem_1_io_data_write_data_T_7 | part_1_7; // @[test.scala 193:164]
  wire [127:0] _data_mem_1_io_data_write_data_T_10 = {_data_mem_1_io_data_write_data_T_8,data_mem_1_io_data_read_data[63
    :0]}; // @[Cat.scala 31:58]
  wire [127:0] _data_mem_1_io_data_write_data_T_19 = {data_mem_1_io_data_read_data[127:64],
    _data_mem_1_io_data_write_data_T_8}; // @[Cat.scala 31:58]
  wire [127:0] _data_mem_1_io_data_write_data_T_20 = io_cpu_request_addr[6:0] == 7'h0 ?
    _data_mem_1_io_data_write_data_T_10 : _data_mem_1_io_data_write_data_T_19; // @[test.scala 193:94]
  wire  _GEN_9 = is_match_1 | tag_mem_1_io_tag_read_valid; // @[test.scala 146:41 179:66 182:87]
  wire  _GEN_10 = is_match_1 | tag_mem_1_io_tag_read_dirty; // @[test.scala 146:41 179:66 183:87]
  wire [54:0] _GEN_11 = is_match_1 ? io_cpu_request_addr[63:9] : {{1'd0}, tag_mem_1_io_tag_read_tag}; // @[test.scala 146:41 179:66 184:85]
  wire [127:0] _GEN_12 = is_match_1 ? _data_mem_1_io_data_write_data_T_20 : data_mem_1_io_data_read_data; // @[test.scala 147:43 179:66 193:88]
  wire [7:0] _part_0_T_17 = io_cpu_request_mask[0] ? io_cpu_request_data[7:0] : data_mem_2_io_data_read_data[7:0]; // @[test.scala 188:79]
  wire [15:0] _part_1_T_16 = {data_mem_2_io_data_read_data[15:8], 8'h0}; // @[test.scala 188:200]
  wire [15:0] _part_1_T_17 = io_cpu_request_mask[1] ? _part_1_T_2 : _part_1_T_16; // @[test.scala 188:79]
  wire [23:0] _part_2_T_16 = {data_mem_2_io_data_read_data[23:16], 16'h0}; // @[test.scala 188:200]
  wire [23:0] _part_2_T_17 = io_cpu_request_mask[2] ? _part_2_T_2 : _part_2_T_16; // @[test.scala 188:79]
  wire [31:0] _part_3_T_16 = {data_mem_2_io_data_read_data[31:24], 24'h0}; // @[test.scala 188:200]
  wire [31:0] _part_3_T_17 = io_cpu_request_mask[3] ? _part_3_T_2 : _part_3_T_16; // @[test.scala 188:79]
  wire [39:0] _part_4_T_16 = {data_mem_2_io_data_read_data[39:32], 32'h0}; // @[test.scala 188:200]
  wire [39:0] _part_4_T_17 = io_cpu_request_mask[4] ? _part_4_T_2 : _part_4_T_16; // @[test.scala 188:79]
  wire [47:0] _part_5_T_16 = {data_mem_2_io_data_read_data[47:40], 40'h0}; // @[test.scala 188:200]
  wire [47:0] _part_5_T_17 = io_cpu_request_mask[5] ? _part_5_T_2 : _part_5_T_16; // @[test.scala 188:79]
  wire [55:0] _part_6_T_16 = {data_mem_2_io_data_read_data[55:48], 48'h0}; // @[test.scala 188:200]
  wire [55:0] _part_6_T_17 = io_cpu_request_mask[6] ? _part_6_T_2 : _part_6_T_16; // @[test.scala 188:79]
  wire [63:0] _part_7_T_16 = {data_mem_2_io_data_read_data[63:56], 56'h0}; // @[test.scala 188:200]
  wire [63:0] part_2_7 = io_cpu_request_mask[7] ? _part_7_T_2 : _part_7_T_16; // @[test.scala 188:79]
  wire [63:0] part_2_0 = {{56'd0}, _part_0_T_17}; // @[test.scala 186:72 188:73]
  wire [63:0] part_2_1 = {{48'd0}, _part_1_T_17}; // @[test.scala 186:72 188:73]
  wire [63:0] _data_mem_2_io_data_write_data_T_2 = part_2_0 | part_2_1; // @[test.scala 193:164]
  wire [63:0] part_2_2 = {{40'd0}, _part_2_T_17}; // @[test.scala 186:72 188:73]
  wire [63:0] _data_mem_2_io_data_write_data_T_3 = _data_mem_2_io_data_write_data_T_2 | part_2_2; // @[test.scala 193:164]
  wire [63:0] part_2_3 = {{32'd0}, _part_3_T_17}; // @[test.scala 186:72 188:73]
  wire [63:0] _data_mem_2_io_data_write_data_T_4 = _data_mem_2_io_data_write_data_T_3 | part_2_3; // @[test.scala 193:164]
  wire [63:0] part_2_4 = {{24'd0}, _part_4_T_17}; // @[test.scala 186:72 188:73]
  wire [63:0] _data_mem_2_io_data_write_data_T_5 = _data_mem_2_io_data_write_data_T_4 | part_2_4; // @[test.scala 193:164]
  wire [63:0] part_2_5 = {{16'd0}, _part_5_T_17}; // @[test.scala 186:72 188:73]
  wire [63:0] _data_mem_2_io_data_write_data_T_6 = _data_mem_2_io_data_write_data_T_5 | part_2_5; // @[test.scala 193:164]
  wire [63:0] part_2_6 = {{8'd0}, _part_6_T_17}; // @[test.scala 186:72 188:73]
  wire [63:0] _data_mem_2_io_data_write_data_T_7 = _data_mem_2_io_data_write_data_T_6 | part_2_6; // @[test.scala 193:164]
  wire [63:0] _data_mem_2_io_data_write_data_T_8 = _data_mem_2_io_data_write_data_T_7 | part_2_7; // @[test.scala 193:164]
  wire [127:0] _data_mem_2_io_data_write_data_T_10 = {_data_mem_2_io_data_write_data_T_8,data_mem_2_io_data_read_data[63
    :0]}; // @[Cat.scala 31:58]
  wire [127:0] _data_mem_2_io_data_write_data_T_19 = {data_mem_2_io_data_read_data[127:64],
    _data_mem_2_io_data_write_data_T_8}; // @[Cat.scala 31:58]
  wire [127:0] _data_mem_2_io_data_write_data_T_20 = io_cpu_request_addr[6:0] == 7'h0 ?
    _data_mem_2_io_data_write_data_T_10 : _data_mem_2_io_data_write_data_T_19; // @[test.scala 193:94]
  wire  _GEN_14 = is_match_2 | tag_mem_2_io_tag_read_valid; // @[test.scala 146:41 179:66 182:87]
  wire  _GEN_15 = is_match_2 | tag_mem_2_io_tag_read_dirty; // @[test.scala 146:41 179:66 183:87]
  wire [54:0] _GEN_16 = is_match_2 ? io_cpu_request_addr[63:9] : {{1'd0}, tag_mem_2_io_tag_read_tag}; // @[test.scala 146:41 179:66 184:85]
  wire [127:0] _GEN_17 = is_match_2 ? _data_mem_2_io_data_write_data_T_20 : data_mem_2_io_data_read_data; // @[test.scala 147:43 179:66 193:88]
  wire [7:0] _part_0_T_23 = io_cpu_request_mask[0] ? io_cpu_request_data[7:0] : data_mem_3_io_data_read_data[7:0]; // @[test.scala 188:79]
  wire [15:0] _part_1_T_22 = {data_mem_3_io_data_read_data[15:8], 8'h0}; // @[test.scala 188:200]
  wire [15:0] _part_1_T_23 = io_cpu_request_mask[1] ? _part_1_T_2 : _part_1_T_22; // @[test.scala 188:79]
  wire [23:0] _part_2_T_22 = {data_mem_3_io_data_read_data[23:16], 16'h0}; // @[test.scala 188:200]
  wire [23:0] _part_2_T_23 = io_cpu_request_mask[2] ? _part_2_T_2 : _part_2_T_22; // @[test.scala 188:79]
  wire [31:0] _part_3_T_22 = {data_mem_3_io_data_read_data[31:24], 24'h0}; // @[test.scala 188:200]
  wire [31:0] _part_3_T_23 = io_cpu_request_mask[3] ? _part_3_T_2 : _part_3_T_22; // @[test.scala 188:79]
  wire [39:0] _part_4_T_22 = {data_mem_3_io_data_read_data[39:32], 32'h0}; // @[test.scala 188:200]
  wire [39:0] _part_4_T_23 = io_cpu_request_mask[4] ? _part_4_T_2 : _part_4_T_22; // @[test.scala 188:79]
  wire [47:0] _part_5_T_22 = {data_mem_3_io_data_read_data[47:40], 40'h0}; // @[test.scala 188:200]
  wire [47:0] _part_5_T_23 = io_cpu_request_mask[5] ? _part_5_T_2 : _part_5_T_22; // @[test.scala 188:79]
  wire [55:0] _part_6_T_22 = {data_mem_3_io_data_read_data[55:48], 48'h0}; // @[test.scala 188:200]
  wire [55:0] _part_6_T_23 = io_cpu_request_mask[6] ? _part_6_T_2 : _part_6_T_22; // @[test.scala 188:79]
  wire [63:0] _part_7_T_22 = {data_mem_3_io_data_read_data[63:56], 56'h0}; // @[test.scala 188:200]
  wire [63:0] part_3_7 = io_cpu_request_mask[7] ? _part_7_T_2 : _part_7_T_22; // @[test.scala 188:79]
  wire [63:0] part_3_0 = {{56'd0}, _part_0_T_23}; // @[test.scala 186:72 188:73]
  wire [63:0] part_3_1 = {{48'd0}, _part_1_T_23}; // @[test.scala 186:72 188:73]
  wire [63:0] _data_mem_3_io_data_write_data_T_2 = part_3_0 | part_3_1; // @[test.scala 193:164]
  wire [63:0] part_3_2 = {{40'd0}, _part_2_T_23}; // @[test.scala 186:72 188:73]
  wire [63:0] _data_mem_3_io_data_write_data_T_3 = _data_mem_3_io_data_write_data_T_2 | part_3_2; // @[test.scala 193:164]
  wire [63:0] part_3_3 = {{32'd0}, _part_3_T_23}; // @[test.scala 186:72 188:73]
  wire [63:0] _data_mem_3_io_data_write_data_T_4 = _data_mem_3_io_data_write_data_T_3 | part_3_3; // @[test.scala 193:164]
  wire [63:0] part_3_4 = {{24'd0}, _part_4_T_23}; // @[test.scala 186:72 188:73]
  wire [63:0] _data_mem_3_io_data_write_data_T_5 = _data_mem_3_io_data_write_data_T_4 | part_3_4; // @[test.scala 193:164]
  wire [63:0] part_3_5 = {{16'd0}, _part_5_T_23}; // @[test.scala 186:72 188:73]
  wire [63:0] _data_mem_3_io_data_write_data_T_6 = _data_mem_3_io_data_write_data_T_5 | part_3_5; // @[test.scala 193:164]
  wire [63:0] part_3_6 = {{8'd0}, _part_6_T_23}; // @[test.scala 186:72 188:73]
  wire [63:0] _data_mem_3_io_data_write_data_T_7 = _data_mem_3_io_data_write_data_T_6 | part_3_6; // @[test.scala 193:164]
  wire [63:0] _data_mem_3_io_data_write_data_T_8 = _data_mem_3_io_data_write_data_T_7 | part_3_7; // @[test.scala 193:164]
  wire [127:0] _data_mem_3_io_data_write_data_T_10 = {_data_mem_3_io_data_write_data_T_8,data_mem_3_io_data_read_data[63
    :0]}; // @[Cat.scala 31:58]
  wire [127:0] _data_mem_3_io_data_write_data_T_19 = {data_mem_3_io_data_read_data[127:64],
    _data_mem_3_io_data_write_data_T_8}; // @[Cat.scala 31:58]
  wire [127:0] _data_mem_3_io_data_write_data_T_20 = io_cpu_request_addr[6:0] == 7'h0 ?
    _data_mem_3_io_data_write_data_T_10 : _data_mem_3_io_data_write_data_T_19; // @[test.scala 193:94]
  wire  _GEN_19 = is_match_3 | tag_mem_3_io_tag_read_valid; // @[test.scala 146:41 179:66 182:87]
  wire  _GEN_20 = is_match_3 | tag_mem_3_io_tag_read_dirty; // @[test.scala 146:41 179:66 183:87]
  wire [54:0] _GEN_21 = is_match_3 ? io_cpu_request_addr[63:9] : {{1'd0}, tag_mem_3_io_tag_read_tag}; // @[test.scala 146:41 179:66 184:85]
  wire [127:0] _GEN_22 = is_match_3 ? _data_mem_3_io_data_write_data_T_20 : data_mem_3_io_data_read_data; // @[test.scala 147:43 179:66 193:88]
  wire  _GEN_23 = io_cpu_request_rw & is_match_0; // @[test.scala 145:45 177:56]
  wire  _GEN_24 = io_cpu_request_rw ? _GEN_4 : tag_mem_0_io_tag_read_valid; // @[test.scala 146:41 177:56]
  wire  _GEN_25 = io_cpu_request_rw ? _GEN_5 : tag_mem_0_io_tag_read_dirty; // @[test.scala 146:41 177:56]
  wire [54:0] _GEN_26 = io_cpu_request_rw ? _GEN_6 : {{1'd0}, tag_mem_0_io_tag_read_tag}; // @[test.scala 146:41 177:56]
  wire [127:0] _GEN_27 = io_cpu_request_rw ? _GEN_7 : data_mem_0_io_data_read_data; // @[test.scala 147:43 177:56]
  wire  _GEN_28 = io_cpu_request_rw & is_match_1; // @[test.scala 145:45 177:56]
  wire  _GEN_29 = io_cpu_request_rw ? _GEN_9 : tag_mem_1_io_tag_read_valid; // @[test.scala 146:41 177:56]
  wire  _GEN_30 = io_cpu_request_rw ? _GEN_10 : tag_mem_1_io_tag_read_dirty; // @[test.scala 146:41 177:56]
  wire [54:0] _GEN_31 = io_cpu_request_rw ? _GEN_11 : {{1'd0}, tag_mem_1_io_tag_read_tag}; // @[test.scala 146:41 177:56]
  wire [127:0] _GEN_32 = io_cpu_request_rw ? _GEN_12 : data_mem_1_io_data_read_data; // @[test.scala 147:43 177:56]
  wire  _GEN_33 = io_cpu_request_rw & is_match_2; // @[test.scala 145:45 177:56]
  wire  _GEN_34 = io_cpu_request_rw ? _GEN_14 : tag_mem_2_io_tag_read_valid; // @[test.scala 146:41 177:56]
  wire  _GEN_35 = io_cpu_request_rw ? _GEN_15 : tag_mem_2_io_tag_read_dirty; // @[test.scala 146:41 177:56]
  wire [54:0] _GEN_36 = io_cpu_request_rw ? _GEN_16 : {{1'd0}, tag_mem_2_io_tag_read_tag}; // @[test.scala 146:41 177:56]
  wire [127:0] _GEN_37 = io_cpu_request_rw ? _GEN_17 : data_mem_2_io_data_read_data; // @[test.scala 147:43 177:56]
  wire  _GEN_38 = io_cpu_request_rw & is_match_3; // @[test.scala 145:45 177:56]
  wire  _GEN_39 = io_cpu_request_rw ? _GEN_19 : tag_mem_3_io_tag_read_valid; // @[test.scala 146:41 177:56]
  wire  _GEN_40 = io_cpu_request_rw ? _GEN_20 : tag_mem_3_io_tag_read_dirty; // @[test.scala 146:41 177:56]
  wire [54:0] _GEN_41 = io_cpu_request_rw ? _GEN_21 : {{1'd0}, tag_mem_3_io_tag_read_tag}; // @[test.scala 146:41 177:56]
  wire [127:0] _GEN_42 = io_cpu_request_rw ? _GEN_22 : data_mem_3_io_data_read_data; // @[test.scala 147:43 177:56]
  wire  compare_1_0 = tag_mem_1_io_tag_read_visit > tag_mem_0_io_tag_read_visit; // @[test.scala 205:68]
  wire  compare_2_3 = tag_mem_3_io_tag_read_visit > tag_mem_2_io_tag_read_visit; // @[test.scala 206:68]
  wire [7:0] _max_01_or_23_T = compare_2_3 ? tag_mem_3_io_tag_read_visit : tag_mem_2_io_tag_read_visit; // @[test.scala 207:63]
  wire [7:0] _max_01_or_23_T_1 = compare_1_0 ? tag_mem_1_io_tag_read_visit : tag_mem_0_io_tag_read_visit; // @[test.scala 207:102]
  wire  max_01_or_23 = _max_01_or_23_T > _max_01_or_23_T_1; // @[test.scala 207:97]
  wire  _max_T = max_01_or_23 ? compare_2_3 : compare_1_0; // @[test.scala 208:69]
  wire [1:0] _max_T_1 = {max_01_or_23,_max_T}; // @[Cat.scala 31:58]
  wire  _max_T_2 = ~tag_mem_1_io_tag_read_valid; // @[test.scala 213:97]
  wire  _max_T_3 = ~tag_mem_2_io_tag_read_valid; // @[test.scala 213:144]
  wire  _max_T_4 = ~tag_mem_3_io_tag_read_valid; // @[test.scala 213:191]
  wire [1:0] _max_T_5 = _max_T_4 ? 2'h3 : 2'h0; // @[Mux.scala 101:16]
  wire [1:0] _max_T_6 = _max_T_3 ? 2'h2 : _max_T_5; // @[Mux.scala 101:16]
  wire [1:0] _max_T_7 = _max_T_2 ? 2'h1 : _max_T_6; // @[Mux.scala 101:16]
  wire [1:0] max = tag_mem_0_io_tag_read_valid & tag_mem_1_io_tag_read_valid & tag_mem_2_io_tag_read_valid &
    tag_mem_3_io_tag_read_valid ? _max_T_1 : _max_T_7; // @[test.scala 202:92 208:45 213:45]
  wire [1:0] _GEN_44 = tag_mem_0_io_tag_read_valid & tag_mem_1_io_tag_read_valid & tag_mem_2_io_tag_read_valid &
    tag_mem_3_io_tag_read_valid ? max : replace; // @[test.scala 135:30 202:92 209:49]
  wire  _T_23 = 2'h0 == max; // @[test.scala 218:50]
  wire [62:0] _writeback_addr_T = {tag_mem_0_io_tag_read_tag,max,7'h0}; // @[Cat.scala 31:58]
  wire [1:0] _GEN_45 = tag_mem_0_io_tag_read_valid | ~tag_mem_0_io_tag_read_dirty ? 2'h3 : 2'h2; // @[test.scala 228:118 229:68 235:68]
  wire [63:0] _GEN_46 = tag_mem_0_io_tag_read_valid | ~tag_mem_0_io_tag_read_dirty ? writeback_addr : {{1'd0},
    _writeback_addr_T}; // @[test.scala 228:118 137:37 234:72]
  wire  _GEN_48 = 2'h0 == max | tag_mem_0_io_tag_read_valid; // @[test.scala 146:41 218:58 220:79]
  wire  _GEN_49 = 2'h0 == max ? io_cpu_request_rw : tag_mem_0_io_tag_read_dirty; // @[test.scala 146:41 218:58 221:79]
  wire [54:0] _GEN_50 = 2'h0 == max ? io_cpu_request_addr[63:9] : {{1'd0}, tag_mem_0_io_tag_read_tag}; // @[test.scala 146:41 218:58 222:77]
  wire [7:0] _GEN_51 = 2'h0 == max ? 8'h0 : tag_mem_0_io_tag_read_visit; // @[test.scala 146:41 218:58 223:79]
  wire [1:0] _GEN_53 = 2'h0 == max ? _GEN_45 : 2'h0; // @[test.scala 218:58]
  wire [63:0] _GEN_54 = 2'h0 == max ? _GEN_46 : writeback_addr; // @[test.scala 137:37 218:58]
  wire  _T_26 = 2'h1 == max; // @[test.scala 218:50]
  wire [62:0] _writeback_addr_T_1 = {tag_mem_1_io_tag_read_tag,max,7'h0}; // @[Cat.scala 31:58]
  wire [1:0] _GEN_55 = tag_mem_1_io_tag_read_valid | ~tag_mem_1_io_tag_read_dirty ? 2'h3 : 2'h2; // @[test.scala 228:118 229:68 235:68]
  wire [63:0] _GEN_56 = tag_mem_1_io_tag_read_valid | ~tag_mem_1_io_tag_read_dirty ? _GEN_54 : {{1'd0},
    _writeback_addr_T_1}; // @[test.scala 228:118 234:72]
  wire  _GEN_58 = 2'h1 == max | tag_mem_1_io_tag_read_valid; // @[test.scala 146:41 218:58 220:79]
  wire  _GEN_59 = 2'h1 == max ? io_cpu_request_rw : tag_mem_1_io_tag_read_dirty; // @[test.scala 146:41 218:58 221:79]
  wire [54:0] _GEN_60 = 2'h1 == max ? io_cpu_request_addr[63:9] : {{1'd0}, tag_mem_1_io_tag_read_tag}; // @[test.scala 146:41 218:58 222:77]
  wire [7:0] _GEN_61 = 2'h1 == max ? 8'h0 : tag_mem_1_io_tag_read_visit; // @[test.scala 146:41 218:58 223:79]
  wire [1:0] _GEN_63 = 2'h1 == max ? _GEN_55 : _GEN_53; // @[test.scala 218:58]
  wire [63:0] _GEN_64 = 2'h1 == max ? _GEN_56 : _GEN_54; // @[test.scala 218:58]
  wire  _T_29 = 2'h2 == max; // @[test.scala 218:50]
  wire [62:0] _writeback_addr_T_2 = {tag_mem_2_io_tag_read_tag,max,7'h0}; // @[Cat.scala 31:58]
  wire [1:0] _GEN_65 = tag_mem_2_io_tag_read_valid | ~tag_mem_2_io_tag_read_dirty ? 2'h3 : 2'h2; // @[test.scala 228:118 229:68 235:68]
  wire [63:0] _GEN_66 = tag_mem_2_io_tag_read_valid | ~tag_mem_2_io_tag_read_dirty ? _GEN_64 : {{1'd0},
    _writeback_addr_T_2}; // @[test.scala 228:118 234:72]
  wire  _GEN_68 = 2'h2 == max | tag_mem_2_io_tag_read_valid; // @[test.scala 146:41 218:58 220:79]
  wire  _GEN_69 = 2'h2 == max ? io_cpu_request_rw : tag_mem_2_io_tag_read_dirty; // @[test.scala 146:41 218:58 221:79]
  wire [54:0] _GEN_70 = 2'h2 == max ? io_cpu_request_addr[63:9] : {{1'd0}, tag_mem_2_io_tag_read_tag}; // @[test.scala 146:41 218:58 222:77]
  wire [7:0] _GEN_71 = 2'h2 == max ? 8'h0 : tag_mem_2_io_tag_read_visit; // @[test.scala 146:41 218:58 223:79]
  wire [1:0] _GEN_73 = 2'h2 == max ? _GEN_65 : _GEN_63; // @[test.scala 218:58]
  wire [63:0] _GEN_74 = 2'h2 == max ? _GEN_66 : _GEN_64; // @[test.scala 218:58]
  wire  _T_32 = 2'h3 == max; // @[test.scala 218:50]
  wire [62:0] _writeback_addr_T_3 = {tag_mem_3_io_tag_read_tag,max,7'h0}; // @[Cat.scala 31:58]
  wire [1:0] _GEN_75 = tag_mem_3_io_tag_read_valid | ~tag_mem_3_io_tag_read_dirty ? 2'h3 : 2'h2; // @[test.scala 228:118 229:68 235:68]
  wire [63:0] _GEN_76 = tag_mem_3_io_tag_read_valid | ~tag_mem_3_io_tag_read_dirty ? _GEN_74 : {{1'd0},
    _writeback_addr_T_3}; // @[test.scala 228:118 234:72]
  wire  _GEN_78 = 2'h3 == max | tag_mem_3_io_tag_read_valid; // @[test.scala 146:41 218:58 220:79]
  wire  _GEN_79 = 2'h3 == max ? io_cpu_request_rw : tag_mem_3_io_tag_read_dirty; // @[test.scala 146:41 218:58 221:79]
  wire [54:0] _GEN_80 = 2'h3 == max ? io_cpu_request_addr[63:9] : {{1'd0}, tag_mem_3_io_tag_read_tag}; // @[test.scala 146:41 218:58 222:77]
  wire [7:0] _GEN_81 = 2'h3 == max ? 8'h0 : tag_mem_3_io_tag_read_visit; // @[test.scala 146:41 218:58 223:79]
  wire [1:0] _GEN_83 = 2'h3 == max ? _GEN_75 : _GEN_73; // @[test.scala 218:58]
  wire [63:0] _GEN_84 = 2'h3 == max ? _GEN_76 : _GEN_74; // @[test.scala 218:58]
  wire [127:0] _GEN_86 = |_T_18 ? _io_cpu_response_data_T_2 : 128'h0; // @[test.scala 154:30 169:50 171:54]
  wire  _GEN_87 = |_T_18 | _T_23; // @[test.scala 169:50 173:68]
  wire [7:0] _GEN_88 = |_T_18 ? 8'h0 : _GEN_51; // @[test.scala 169:50 174:71]
  wire  _GEN_89 = |_T_18 | _T_26; // @[test.scala 169:50 173:68]
  wire [7:0] _GEN_90 = |_T_18 ? 8'h0 : _GEN_61; // @[test.scala 169:50 174:71]
  wire  _GEN_91 = |_T_18 | _T_29; // @[test.scala 169:50 173:68]
  wire [7:0] _GEN_92 = |_T_18 ? 8'h0 : _GEN_71; // @[test.scala 169:50 174:71]
  wire  _GEN_93 = |_T_18 | _T_32; // @[test.scala 169:50 173:68]
  wire [7:0] _GEN_94 = |_T_18 ? 8'h0 : _GEN_81; // @[test.scala 169:50 174:71]
  wire  _GEN_95 = |_T_18 & _GEN_23; // @[test.scala 145:45 169:50]
  wire  _GEN_96 = |_T_18 ? _GEN_24 : _GEN_48; // @[test.scala 169:50]
  wire  _GEN_97 = |_T_18 ? _GEN_25 : _GEN_49; // @[test.scala 169:50]
  wire [54:0] _GEN_98 = |_T_18 ? _GEN_26 : _GEN_50; // @[test.scala 169:50]
  wire [127:0] _GEN_99 = |_T_18 ? _GEN_27 : data_mem_0_io_data_read_data; // @[test.scala 147:43 169:50]
  wire  _GEN_100 = |_T_18 & _GEN_28; // @[test.scala 145:45 169:50]
  wire  _GEN_101 = |_T_18 ? _GEN_29 : _GEN_58; // @[test.scala 169:50]
  wire  _GEN_102 = |_T_18 ? _GEN_30 : _GEN_59; // @[test.scala 169:50]
  wire [54:0] _GEN_103 = |_T_18 ? _GEN_31 : _GEN_60; // @[test.scala 169:50]
  wire [127:0] _GEN_104 = |_T_18 ? _GEN_32 : data_mem_1_io_data_read_data; // @[test.scala 147:43 169:50]
  wire  _GEN_105 = |_T_18 & _GEN_33; // @[test.scala 145:45 169:50]
  wire  _GEN_106 = |_T_18 ? _GEN_34 : _GEN_68; // @[test.scala 169:50]
  wire  _GEN_107 = |_T_18 ? _GEN_35 : _GEN_69; // @[test.scala 169:50]
  wire [54:0] _GEN_108 = |_T_18 ? _GEN_36 : _GEN_70; // @[test.scala 169:50]
  wire [127:0] _GEN_109 = |_T_18 ? _GEN_37 : data_mem_2_io_data_read_data; // @[test.scala 147:43 169:50]
  wire  _GEN_110 = |_T_18 & _GEN_38; // @[test.scala 145:45 169:50]
  wire  _GEN_111 = |_T_18 ? _GEN_39 : _GEN_78; // @[test.scala 169:50]
  wire  _GEN_112 = |_T_18 ? _GEN_40 : _GEN_79; // @[test.scala 169:50]
  wire [54:0] _GEN_113 = |_T_18 ? _GEN_41 : _GEN_80; // @[test.scala 169:50]
  wire [127:0] _GEN_114 = |_T_18 ? _GEN_42 : data_mem_3_io_data_read_data; // @[test.scala 147:43 169:50]
  wire [7:0] _tag_mem_0_io_tag_write_visit_T = ~tag_mem_0_io_tag_read_visit; // @[test.scala 246:79]
  wire [7:0] _tag_mem_0_io_tag_write_visit_T_3 = tag_mem_0_io_tag_read_visit + 8'h1; // @[test.scala 246:178]
  wire [7:0] _tag_mem_0_io_tag_write_visit_T_4 = _tag_mem_0_io_tag_write_visit_T == 8'h0 ? tag_mem_0_io_tag_read_visit
     : _tag_mem_0_io_tag_write_visit_T_3; // @[test.scala 246:77]
  wire  _GEN_119 = ~is_match_0 & tag_mem_0_io_tag_read_valid | _GEN_96; // @[test.scala 243:83 244:71]
  wire  _GEN_120 = ~is_match_0 & tag_mem_0_io_tag_read_valid ? tag_mem_0_io_tag_read_dirty : _GEN_97; // @[test.scala 243:83 245:71]
  wire [7:0] _GEN_121 = ~is_match_0 & tag_mem_0_io_tag_read_valid ? _tag_mem_0_io_tag_write_visit_T_4 : _GEN_88; // @[test.scala 243:83 246:71]
  wire [54:0] _GEN_122 = ~is_match_0 & tag_mem_0_io_tag_read_valid ? {{1'd0}, tag_mem_0_io_tag_read_tag} : _GEN_98; // @[test.scala 243:83 247:69]
  wire [7:0] _tag_mem_1_io_tag_write_visit_T = ~tag_mem_1_io_tag_read_visit; // @[test.scala 246:79]
  wire [7:0] _tag_mem_1_io_tag_write_visit_T_3 = tag_mem_1_io_tag_read_visit + 8'h1; // @[test.scala 246:178]
  wire [7:0] _tag_mem_1_io_tag_write_visit_T_4 = _tag_mem_1_io_tag_write_visit_T == 8'h0 ? tag_mem_1_io_tag_read_visit
     : _tag_mem_1_io_tag_write_visit_T_3; // @[test.scala 246:77]
  wire  _GEN_123 = ~is_match_1 & tag_mem_1_io_tag_read_valid | _GEN_101; // @[test.scala 243:83 244:71]
  wire  _GEN_124 = ~is_match_1 & tag_mem_1_io_tag_read_valid ? tag_mem_1_io_tag_read_dirty : _GEN_102; // @[test.scala 243:83 245:71]
  wire [7:0] _GEN_125 = ~is_match_1 & tag_mem_1_io_tag_read_valid ? _tag_mem_1_io_tag_write_visit_T_4 : _GEN_90; // @[test.scala 243:83 246:71]
  wire [54:0] _GEN_126 = ~is_match_1 & tag_mem_1_io_tag_read_valid ? {{1'd0}, tag_mem_1_io_tag_read_tag} : _GEN_103; // @[test.scala 243:83 247:69]
  wire [7:0] _tag_mem_2_io_tag_write_visit_T = ~tag_mem_2_io_tag_read_visit; // @[test.scala 246:79]
  wire [7:0] _tag_mem_2_io_tag_write_visit_T_3 = tag_mem_2_io_tag_read_visit + 8'h1; // @[test.scala 246:178]
  wire [7:0] _tag_mem_2_io_tag_write_visit_T_4 = _tag_mem_2_io_tag_write_visit_T == 8'h0 ? tag_mem_2_io_tag_read_visit
     : _tag_mem_2_io_tag_write_visit_T_3; // @[test.scala 246:77]
  wire  _GEN_127 = ~is_match_2 & tag_mem_2_io_tag_read_valid | _GEN_106; // @[test.scala 243:83 244:71]
  wire  _GEN_128 = ~is_match_2 & tag_mem_2_io_tag_read_valid ? tag_mem_2_io_tag_read_dirty : _GEN_107; // @[test.scala 243:83 245:71]
  wire [7:0] _GEN_129 = ~is_match_2 & tag_mem_2_io_tag_read_valid ? _tag_mem_2_io_tag_write_visit_T_4 : _GEN_92; // @[test.scala 243:83 246:71]
  wire [54:0] _GEN_130 = ~is_match_2 & tag_mem_2_io_tag_read_valid ? {{1'd0}, tag_mem_2_io_tag_read_tag} : _GEN_108; // @[test.scala 243:83 247:69]
  wire [7:0] _tag_mem_3_io_tag_write_visit_T = ~tag_mem_3_io_tag_read_visit; // @[test.scala 246:79]
  wire [7:0] _tag_mem_3_io_tag_write_visit_T_3 = tag_mem_3_io_tag_read_visit + 8'h1; // @[test.scala 246:178]
  wire [7:0] _tag_mem_3_io_tag_write_visit_T_4 = _tag_mem_3_io_tag_write_visit_T == 8'h0 ? tag_mem_3_io_tag_read_visit
     : _tag_mem_3_io_tag_write_visit_T_3; // @[test.scala 246:77]
  wire  _GEN_131 = ~is_match_3 & tag_mem_3_io_tag_read_valid | _GEN_111; // @[test.scala 243:83 244:71]
  wire  _GEN_132 = ~is_match_3 & tag_mem_3_io_tag_read_valid ? tag_mem_3_io_tag_read_dirty : _GEN_112; // @[test.scala 243:83 245:71]
  wire [7:0] _GEN_133 = ~is_match_3 & tag_mem_3_io_tag_read_valid ? _tag_mem_3_io_tag_write_visit_T_4 : _GEN_94; // @[test.scala 243:83 246:71]
  wire [54:0] _GEN_134 = ~is_match_3 & tag_mem_3_io_tag_read_valid ? {{1'd0}, tag_mem_3_io_tag_read_tag} : _GEN_113; // @[test.scala 243:83 247:69]
  wire  _T_46 = 2'h0 == replace; // @[test.scala 256:50]
  wire [6:0] _GEN_268 = {index, 6'h0}; // @[test.scala 258:145]
  wire [7:0] _data_mem_0_io_data_write_data_T_21 = {{1'd0}, _GEN_268}; // @[test.scala 258:145]
  wire [260:0] _data_mem_0_io_data_write_data_T_22 = 261'h3f << _data_mem_0_io_data_write_data_T_21; // @[test.scala 258:135]
  wire [260:0] _data_mem_0_io_data_write_data_T_23 = ~_data_mem_0_io_data_write_data_T_22; // @[test.scala 258:116]
  wire [260:0] _GEN_269 = {{133'd0}, data_mem_0_io_data_read_data}; // @[test.scala 258:113]
  wire [260:0] _data_mem_0_io_data_write_data_T_24 = _GEN_269 & _data_mem_0_io_data_write_data_T_23; // @[test.scala 258:113]
  wire [318:0] _GEN_1 = {{255'd0}, io_mem_response_data}; // @[test.scala 258:179]
  wire [318:0] _data_mem_0_io_data_write_data_T_26 = _GEN_1 << _data_mem_0_io_data_write_data_T_21; // @[test.scala 258:179]
  wire [318:0] _GEN_271 = {{58'd0}, _data_mem_0_io_data_write_data_T_24}; // @[test.scala 258:155]
  wire [318:0] _data_mem_0_io_data_write_data_T_27 = _GEN_271 | _data_mem_0_io_data_write_data_T_26; // @[test.scala 258:155]
  wire [318:0] _GEN_135 = _T_46 ? _data_mem_0_io_data_write_data_T_27 : {{191'd0}, data_mem_0_io_data_read_data}; // @[test.scala 257:41 147:43 258:80]
  wire  _T_47 = 2'h1 == replace; // @[test.scala 256:50]
  wire [260:0] _GEN_273 = {{133'd0}, data_mem_1_io_data_read_data}; // @[test.scala 258:113]
  wire [260:0] _data_mem_1_io_data_write_data_T_24 = _GEN_273 & _data_mem_0_io_data_write_data_T_23; // @[test.scala 258:113]
  wire [318:0] _GEN_275 = {{58'd0}, _data_mem_1_io_data_write_data_T_24}; // @[test.scala 258:155]
  wire [318:0] _data_mem_1_io_data_write_data_T_27 = _GEN_275 | _data_mem_0_io_data_write_data_T_26; // @[test.scala 258:155]
  wire [318:0] _GEN_137 = _T_47 ? _data_mem_1_io_data_write_data_T_27 : {{191'd0}, data_mem_1_io_data_read_data}; // @[test.scala 257:41 147:43 258:80]
  wire  _T_48 = 2'h2 == replace; // @[test.scala 256:50]
  wire [260:0] _GEN_277 = {{133'd0}, data_mem_2_io_data_read_data}; // @[test.scala 258:113]
  wire [260:0] _data_mem_2_io_data_write_data_T_24 = _GEN_277 & _data_mem_0_io_data_write_data_T_23; // @[test.scala 258:113]
  wire [318:0] _GEN_279 = {{58'd0}, _data_mem_2_io_data_write_data_T_24}; // @[test.scala 258:155]
  wire [318:0] _data_mem_2_io_data_write_data_T_27 = _GEN_279 | _data_mem_0_io_data_write_data_T_26; // @[test.scala 258:155]
  wire [318:0] _GEN_139 = _T_48 ? _data_mem_2_io_data_write_data_T_27 : {{191'd0}, data_mem_2_io_data_read_data}; // @[test.scala 257:41 147:43 258:80]
  wire  _T_49 = 2'h3 == replace; // @[test.scala 256:50]
  wire [260:0] _GEN_281 = {{133'd0}, data_mem_3_io_data_read_data}; // @[test.scala 258:113]
  wire [260:0] _data_mem_3_io_data_write_data_T_24 = _GEN_281 & _data_mem_0_io_data_write_data_T_23; // @[test.scala 258:113]
  wire [318:0] _GEN_283 = {{58'd0}, _data_mem_3_io_data_write_data_T_24}; // @[test.scala 258:155]
  wire [318:0] _data_mem_3_io_data_write_data_T_27 = _GEN_283 | _data_mem_0_io_data_write_data_T_26; // @[test.scala 258:155]
  wire [318:0] _GEN_141 = _T_49 ? _data_mem_3_io_data_write_data_T_27 : {{191'd0}, data_mem_3_io_data_read_data}; // @[test.scala 257:41 147:43 258:80]
  wire [318:0] _GEN_143 = io_mem_response_ready ? _GEN_135 : {{191'd0}, data_mem_0_io_data_read_data}; // @[test.scala 147:43 253:52]
  wire  _GEN_144 = io_mem_response_ready & _T_46; // @[test.scala 145:45 253:52]
  wire [318:0] _GEN_145 = io_mem_response_ready ? _GEN_137 : {{191'd0}, data_mem_1_io_data_read_data}; // @[test.scala 147:43 253:52]
  wire  _GEN_146 = io_mem_response_ready & _T_47; // @[test.scala 145:45 253:52]
  wire [318:0] _GEN_147 = io_mem_response_ready ? _GEN_139 : {{191'd0}, data_mem_2_io_data_read_data}; // @[test.scala 147:43 253:52]
  wire  _GEN_148 = io_mem_response_ready & _T_48; // @[test.scala 145:45 253:52]
  wire [318:0] _GEN_149 = io_mem_response_ready ? _GEN_141 : {{191'd0}, data_mem_3_io_data_read_data}; // @[test.scala 147:43 253:52]
  wire  _GEN_150 = io_mem_response_ready & _T_49; // @[test.scala 145:45 253:52]
  wire [63:0] _GEN_285 = {{56'd0}, _data_mem_0_io_data_write_data_T_21}; // @[test.scala 272:69]
  wire [64:0] _io_mem_request_addr_T_1 = {{1'd0}, _GEN_285}; // @[test.scala 272:69]
  wire [1:0] _GEN_151 = warp_out ? 2'h1 : 2'h3; // @[test.scala 267:39 268:44 274:44]
  wire  _GEN_152 = warp_out ? 1'h0 : _GEN_0; // @[test.scala 267:39 269:39]
  wire  _GEN_153 = warp_out ? 1'h0 : 1'h1; // @[test.scala 155:30 267:39 271:54]
  wire [63:0] _GEN_154 = warp_out ? 64'h0 : _io_mem_request_addr_T_1[63:0]; // @[test.scala 157:29 267:39 272:53]
  wire [63:0] _io_mem_request_addr_T_5 = writeback_addr + _GEN_285; // @[test.scala 299:71]
  wire [63:0] _io_mem_request_data_T_3 = ~index ? data_mem_0_io_data_read_data[127:64] : data_mem_0_io_data_read_data[63
    :0]; // @[test.scala 303:75]
  wire [63:0] _GEN_156 = _T_46 ? _io_mem_request_data_T_3 : 64'h0; // @[test.scala 158:29 302:62 303:69]
  wire [63:0] _io_mem_request_data_T_7 = ~index ? data_mem_1_io_data_read_data[127:64] : data_mem_1_io_data_read_data[63
    :0]; // @[test.scala 303:75]
  wire [63:0] _GEN_157 = _T_47 ? _io_mem_request_data_T_7 : _GEN_156; // @[test.scala 302:62 303:69]
  wire [63:0] _io_mem_request_data_T_11 = ~index ? data_mem_2_io_data_read_data[127:64] : data_mem_2_io_data_read_data[
    63:0]; // @[test.scala 303:75]
  wire [63:0] _GEN_158 = _T_48 ? _io_mem_request_data_T_11 : _GEN_157; // @[test.scala 302:62 303:69]
  wire [63:0] _io_mem_request_data_T_15 = ~index ? data_mem_3_io_data_read_data[127:64] : data_mem_3_io_data_read_data[
    63:0]; // @[test.scala 303:75]
  wire [63:0] _GEN_159 = _T_49 ? _io_mem_request_data_T_15 : _GEN_158; // @[test.scala 302:62 303:69]
  wire [1:0] _GEN_160 = warp_out ? 2'h3 : 2'h2; // @[test.scala 294:39 295:44 307:44]
  wire [63:0] _GEN_161 = warp_out ? 64'h0 : _io_mem_request_addr_T_5; // @[test.scala 157:29 294:39 299:53]
  wire [63:0] _GEN_162 = warp_out ? 64'h0 : _GEN_159; // @[test.scala 158:29 294:39]
  wire [1:0] _GEN_164 = 2'h2 == cache_state ? _GEN_160 : 2'h0; // @[test.scala 160:28]
  wire  _GEN_165 = 2'h2 == cache_state ? _GEN_152 : _GEN_0; // @[test.scala 160:28]
  wire  _GEN_166 = 2'h2 == cache_state & _GEN_153; // @[test.scala 160:28 155:30]
  wire [63:0] _GEN_167 = 2'h2 == cache_state ? _GEN_161 : 64'h0; // @[test.scala 160:28 157:29]
  wire [63:0] _GEN_168 = 2'h2 == cache_state ? _GEN_162 : 64'h0; // @[test.scala 160:28 158:29]
  wire [318:0] _GEN_169 = 2'h3 == cache_state ? _GEN_143 : {{191'd0}, data_mem_0_io_data_read_data}; // @[test.scala 160:28 147:43]
  wire  _GEN_170 = 2'h3 == cache_state & _GEN_144; // @[test.scala 160:28 145:45]
  wire [318:0] _GEN_171 = 2'h3 == cache_state ? _GEN_145 : {{191'd0}, data_mem_1_io_data_read_data}; // @[test.scala 160:28 147:43]
  wire  _GEN_172 = 2'h3 == cache_state & _GEN_146; // @[test.scala 160:28 145:45]
  wire [318:0] _GEN_173 = 2'h3 == cache_state ? _GEN_147 : {{191'd0}, data_mem_2_io_data_read_data}; // @[test.scala 160:28 147:43]
  wire  _GEN_174 = 2'h3 == cache_state & _GEN_148; // @[test.scala 160:28 145:45]
  wire [318:0] _GEN_175 = 2'h3 == cache_state ? _GEN_149 : {{191'd0}, data_mem_3_io_data_read_data}; // @[test.scala 160:28 147:43]
  wire  _GEN_176 = 2'h3 == cache_state & _GEN_150; // @[test.scala 160:28 145:45]
  wire  _GEN_180 = 2'h3 == cache_state ? _GEN_153 : _GEN_166; // @[test.scala 160:28]
  wire [63:0] _GEN_181 = 2'h3 == cache_state ? _GEN_154 : _GEN_167; // @[test.scala 160:28]
  wire  _GEN_182 = 2'h3 == cache_state ? 1'h0 : _GEN_166; // @[test.scala 160:28]
  wire [63:0] _GEN_183 = 2'h3 == cache_state ? 64'h0 : _GEN_168; // @[test.scala 160:28 158:29]
  wire [127:0] _GEN_185 = 2'h1 == cache_state ? _GEN_86 : 128'h0; // @[test.scala 160:28 154:30]
  wire [7:0] _GEN_187 = 2'h1 == cache_state ? _GEN_121 : tag_mem_0_io_tag_read_visit; // @[test.scala 160:28 146:41]
  wire [7:0] _GEN_189 = 2'h1 == cache_state ? _GEN_125 : tag_mem_1_io_tag_read_visit; // @[test.scala 160:28 146:41]
  wire [7:0] _GEN_191 = 2'h1 == cache_state ? _GEN_129 : tag_mem_2_io_tag_read_visit; // @[test.scala 160:28 146:41]
  wire [7:0] _GEN_193 = 2'h1 == cache_state ? _GEN_133 : tag_mem_3_io_tag_read_visit; // @[test.scala 160:28 146:41]
  wire  _GEN_194 = 2'h1 == cache_state ? _GEN_95 : _GEN_170; // @[test.scala 160:28]
  wire  _GEN_195 = 2'h1 == cache_state ? _GEN_119 : tag_mem_0_io_tag_read_valid; // @[test.scala 160:28 146:41]
  wire  _GEN_196 = 2'h1 == cache_state ? _GEN_120 : tag_mem_0_io_tag_read_dirty; // @[test.scala 160:28 146:41]
  wire [54:0] _GEN_197 = 2'h1 == cache_state ? _GEN_122 : {{1'd0}, tag_mem_0_io_tag_read_tag}; // @[test.scala 160:28 146:41]
  wire [318:0] _GEN_198 = 2'h1 == cache_state ? {{191'd0}, _GEN_99} : _GEN_169; // @[test.scala 160:28]
  wire  _GEN_199 = 2'h1 == cache_state ? _GEN_100 : _GEN_172; // @[test.scala 160:28]
  wire  _GEN_200 = 2'h1 == cache_state ? _GEN_123 : tag_mem_1_io_tag_read_valid; // @[test.scala 160:28 146:41]
  wire  _GEN_201 = 2'h1 == cache_state ? _GEN_124 : tag_mem_1_io_tag_read_dirty; // @[test.scala 160:28 146:41]
  wire [54:0] _GEN_202 = 2'h1 == cache_state ? _GEN_126 : {{1'd0}, tag_mem_1_io_tag_read_tag}; // @[test.scala 160:28 146:41]
  wire [318:0] _GEN_203 = 2'h1 == cache_state ? {{191'd0}, _GEN_104} : _GEN_171; // @[test.scala 160:28]
  wire  _GEN_204 = 2'h1 == cache_state ? _GEN_105 : _GEN_174; // @[test.scala 160:28]
  wire  _GEN_205 = 2'h1 == cache_state ? _GEN_127 : tag_mem_2_io_tag_read_valid; // @[test.scala 160:28 146:41]
  wire  _GEN_206 = 2'h1 == cache_state ? _GEN_128 : tag_mem_2_io_tag_read_dirty; // @[test.scala 160:28 146:41]
  wire [54:0] _GEN_207 = 2'h1 == cache_state ? _GEN_130 : {{1'd0}, tag_mem_2_io_tag_read_tag}; // @[test.scala 160:28 146:41]
  wire [318:0] _GEN_208 = 2'h1 == cache_state ? {{191'd0}, _GEN_109} : _GEN_173; // @[test.scala 160:28]
  wire  _GEN_209 = 2'h1 == cache_state ? _GEN_110 : _GEN_176; // @[test.scala 160:28]
  wire  _GEN_210 = 2'h1 == cache_state ? _GEN_131 : tag_mem_3_io_tag_read_valid; // @[test.scala 160:28 146:41]
  wire  _GEN_211 = 2'h1 == cache_state ? _GEN_132 : tag_mem_3_io_tag_read_dirty; // @[test.scala 160:28 146:41]
  wire [54:0] _GEN_212 = 2'h1 == cache_state ? _GEN_134 : {{1'd0}, tag_mem_3_io_tag_read_tag}; // @[test.scala 160:28 146:41]
  wire [318:0] _GEN_213 = 2'h1 == cache_state ? {{191'd0}, _GEN_114} : _GEN_175; // @[test.scala 160:28]
  wire  _GEN_220 = 2'h1 == cache_state ? 1'h0 : _GEN_180; // @[test.scala 160:28 155:30]
  wire [63:0] _GEN_221 = 2'h1 == cache_state ? 64'h0 : _GEN_181; // @[test.scala 160:28 157:29]
  wire  _GEN_222 = 2'h1 == cache_state ? 1'h0 : _GEN_182; // @[test.scala 156:27 160:28]
  wire [63:0] _GEN_223 = 2'h1 == cache_state ? 64'h0 : _GEN_183; // @[test.scala 160:28 158:29]
  wire [127:0] _GEN_226 = 2'h0 == cache_state ? 128'h0 : _GEN_185; // @[test.scala 160:28 154:30]
  wire [54:0] _GEN_238 = 2'h0 == cache_state ? {{1'd0}, tag_mem_0_io_tag_read_tag} : _GEN_197; // @[test.scala 160:28 146:41]
  wire [318:0] _GEN_239 = 2'h0 == cache_state ? {{191'd0}, data_mem_0_io_data_read_data} : _GEN_198; // @[test.scala 160:28 147:43]
  wire [54:0] _GEN_243 = 2'h0 == cache_state ? {{1'd0}, tag_mem_1_io_tag_read_tag} : _GEN_202; // @[test.scala 160:28 146:41]
  wire [318:0] _GEN_244 = 2'h0 == cache_state ? {{191'd0}, data_mem_1_io_data_read_data} : _GEN_203; // @[test.scala 160:28 147:43]
  wire [54:0] _GEN_248 = 2'h0 == cache_state ? {{1'd0}, tag_mem_2_io_tag_read_tag} : _GEN_207; // @[test.scala 160:28 146:41]
  wire [318:0] _GEN_249 = 2'h0 == cache_state ? {{191'd0}, data_mem_2_io_data_read_data} : _GEN_208; // @[test.scala 160:28 147:43]
  wire [54:0] _GEN_253 = 2'h0 == cache_state ? {{1'd0}, tag_mem_3_io_tag_read_tag} : _GEN_212; // @[test.scala 160:28 146:41]
  wire [318:0] _GEN_254 = 2'h0 == cache_state ? {{191'd0}, data_mem_3_io_data_read_data} : _GEN_213; // @[test.scala 160:28 147:43]
  tag_cache tag_mem_0 ( // @[test.scala 128:45]
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
  tag_cache tag_mem_1 ( // @[test.scala 128:45]
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
  tag_cache tag_mem_2 ( // @[test.scala 128:45]
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
  tag_cache tag_mem_3 ( // @[test.scala 128:45]
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
  data_cache data_mem_0 ( // @[test.scala 129:46]
    .clock(data_mem_0_clock),
    .io_cache_req_index(data_mem_0_io_cache_req_index),
    .io_cache_req_we(data_mem_0_io_cache_req_we),
    .io_data_write_data(data_mem_0_io_data_write_data),
    .io_data_read_data(data_mem_0_io_data_read_data)
  );
  data_cache data_mem_1 ( // @[test.scala 129:46]
    .clock(data_mem_1_clock),
    .io_cache_req_index(data_mem_1_io_cache_req_index),
    .io_cache_req_we(data_mem_1_io_cache_req_we),
    .io_data_write_data(data_mem_1_io_data_write_data),
    .io_data_read_data(data_mem_1_io_data_read_data)
  );
  data_cache data_mem_2 ( // @[test.scala 129:46]
    .clock(data_mem_2_clock),
    .io_cache_req_index(data_mem_2_io_cache_req_index),
    .io_cache_req_we(data_mem_2_io_cache_req_we),
    .io_data_write_data(data_mem_2_io_data_write_data),
    .io_data_read_data(data_mem_2_io_data_read_data)
  );
  data_cache data_mem_3 ( // @[test.scala 129:46]
    .clock(data_mem_3_clock),
    .io_cache_req_index(data_mem_3_io_cache_req_index),
    .io_cache_req_we(data_mem_3_io_cache_req_we),
    .io_data_write_data(data_mem_3_io_data_write_data),
    .io_data_read_data(data_mem_3_io_data_read_data)
  );
  assign io_cpu_response_data = _GEN_226[63:0];
  assign io_cpu_response_ready = 2'h0 == cache_state ? 1'h0 : 2'h1 == cache_state & _T_19; // @[test.scala 160:28 153:31]
  assign io_mem_request_addr = 2'h0 == cache_state ? 64'h0 : _GEN_221; // @[test.scala 160:28 157:29]
  assign io_mem_request_data = 2'h0 == cache_state ? 64'h0 : _GEN_223; // @[test.scala 160:28 158:29]
  assign io_mem_request_rw = 2'h0 == cache_state ? 1'h0 : _GEN_222; // @[test.scala 156:27 160:28]
  assign io_mem_request_valid = 2'h0 == cache_state ? 1'h0 : _GEN_220; // @[test.scala 160:28 155:30]
  assign tag_mem_0_clock = clock;
  assign tag_mem_0_io_cache_req_index = {{1'd0}, io_cpu_request_addr[8:7]}; // @[test.scala 142:47]
  assign tag_mem_0_io_cache_req_we = 2'h0 == cache_state ? 1'h0 : 2'h1 == cache_state & _GEN_87; // @[test.scala 160:28 144:44]
  assign tag_mem_0_io_tag_write_valid = 2'h0 == cache_state ? tag_mem_0_io_tag_read_valid : _GEN_195; // @[test.scala 160:28 146:41]
  assign tag_mem_0_io_tag_write_dirty = 2'h0 == cache_state ? tag_mem_0_io_tag_read_dirty : _GEN_196; // @[test.scala 160:28 146:41]
  assign tag_mem_0_io_tag_write_visit = 2'h0 == cache_state ? tag_mem_0_io_tag_read_visit : _GEN_187; // @[test.scala 160:28 146:41]
  assign tag_mem_0_io_tag_write_tag = _GEN_238[53:0];
  assign tag_mem_1_clock = clock;
  assign tag_mem_1_io_cache_req_index = {{1'd0}, io_cpu_request_addr[8:7]}; // @[test.scala 142:47]
  assign tag_mem_1_io_cache_req_we = 2'h0 == cache_state ? 1'h0 : 2'h1 == cache_state & _GEN_89; // @[test.scala 160:28 144:44]
  assign tag_mem_1_io_tag_write_valid = 2'h0 == cache_state ? tag_mem_1_io_tag_read_valid : _GEN_200; // @[test.scala 160:28 146:41]
  assign tag_mem_1_io_tag_write_dirty = 2'h0 == cache_state ? tag_mem_1_io_tag_read_dirty : _GEN_201; // @[test.scala 160:28 146:41]
  assign tag_mem_1_io_tag_write_visit = 2'h0 == cache_state ? tag_mem_1_io_tag_read_visit : _GEN_189; // @[test.scala 160:28 146:41]
  assign tag_mem_1_io_tag_write_tag = _GEN_243[53:0];
  assign tag_mem_2_clock = clock;
  assign tag_mem_2_io_cache_req_index = {{1'd0}, io_cpu_request_addr[8:7]}; // @[test.scala 142:47]
  assign tag_mem_2_io_cache_req_we = 2'h0 == cache_state ? 1'h0 : 2'h1 == cache_state & _GEN_91; // @[test.scala 160:28 144:44]
  assign tag_mem_2_io_tag_write_valid = 2'h0 == cache_state ? tag_mem_2_io_tag_read_valid : _GEN_205; // @[test.scala 160:28 146:41]
  assign tag_mem_2_io_tag_write_dirty = 2'h0 == cache_state ? tag_mem_2_io_tag_read_dirty : _GEN_206; // @[test.scala 160:28 146:41]
  assign tag_mem_2_io_tag_write_visit = 2'h0 == cache_state ? tag_mem_2_io_tag_read_visit : _GEN_191; // @[test.scala 160:28 146:41]
  assign tag_mem_2_io_tag_write_tag = _GEN_248[53:0];
  assign tag_mem_3_clock = clock;
  assign tag_mem_3_io_cache_req_index = {{1'd0}, io_cpu_request_addr[8:7]}; // @[test.scala 142:47]
  assign tag_mem_3_io_cache_req_we = 2'h0 == cache_state ? 1'h0 : 2'h1 == cache_state & _GEN_93; // @[test.scala 160:28 144:44]
  assign tag_mem_3_io_tag_write_valid = 2'h0 == cache_state ? tag_mem_3_io_tag_read_valid : _GEN_210; // @[test.scala 160:28 146:41]
  assign tag_mem_3_io_tag_write_dirty = 2'h0 == cache_state ? tag_mem_3_io_tag_read_dirty : _GEN_211; // @[test.scala 160:28 146:41]
  assign tag_mem_3_io_tag_write_visit = 2'h0 == cache_state ? tag_mem_3_io_tag_read_visit : _GEN_193; // @[test.scala 160:28 146:41]
  assign tag_mem_3_io_tag_write_tag = _GEN_253[53:0];
  assign data_mem_0_clock = clock;
  assign data_mem_0_io_cache_req_index = {{1'd0}, io_cpu_request_addr[8:7]}; // @[test.scala 143:48]
  assign data_mem_0_io_cache_req_we = 2'h0 == cache_state ? 1'h0 : _GEN_194; // @[test.scala 160:28 145:45]
  assign data_mem_0_io_data_write_data = _GEN_239[127:0];
  assign data_mem_1_clock = clock;
  assign data_mem_1_io_cache_req_index = {{1'd0}, io_cpu_request_addr[8:7]}; // @[test.scala 143:48]
  assign data_mem_1_io_cache_req_we = 2'h0 == cache_state ? 1'h0 : _GEN_199; // @[test.scala 160:28 145:45]
  assign data_mem_1_io_data_write_data = _GEN_244[127:0];
  assign data_mem_2_clock = clock;
  assign data_mem_2_io_cache_req_index = {{1'd0}, io_cpu_request_addr[8:7]}; // @[test.scala 143:48]
  assign data_mem_2_io_cache_req_we = 2'h0 == cache_state ? 1'h0 : _GEN_204; // @[test.scala 160:28 145:45]
  assign data_mem_2_io_data_write_data = _GEN_249[127:0];
  assign data_mem_3_clock = clock;
  assign data_mem_3_io_cache_req_index = {{1'd0}, io_cpu_request_addr[8:7]}; // @[test.scala 143:48]
  assign data_mem_3_io_cache_req_we = 2'h0 == cache_state ? 1'h0 : _GEN_209; // @[test.scala 160:28 145:45]
  assign data_mem_3_io_data_write_data = _GEN_254[127:0];
  always @(posedge clock) begin
    if (reset) begin // @[test.scala 126:34]
      cache_state <= 2'h0; // @[test.scala 126:34]
    end else if (2'h0 == cache_state) begin // @[test.scala 160:28]
      cache_state <= {{1'd0}, io_cpu_request_valid};
    end else if (2'h1 == cache_state) begin // @[test.scala 160:28]
      if (|_T_18) begin // @[test.scala 169:50]
        cache_state <= 2'h0; // @[test.scala 197:44]
      end else begin
        cache_state <= _GEN_83;
      end
    end else if (2'h3 == cache_state) begin // @[test.scala 160:28]
      cache_state <= _GEN_151;
    end else begin
      cache_state <= _GEN_164;
    end
    if (reset) begin // @[Counter.scala 62:40]
      index <= 1'h0; // @[Counter.scala 62:40]
    end else if (2'h0 == cache_state) begin // @[test.scala 160:28]
      index <= _GEN_0;
    end else if (2'h1 == cache_state) begin // @[test.scala 160:28]
      index <= _GEN_0;
    end else if (2'h3 == cache_state) begin // @[test.scala 160:28]
      index <= _GEN_152;
    end else begin
      index <= _GEN_165;
    end
    if (reset) begin // @[test.scala 135:30]
      replace <= 2'h0; // @[test.scala 135:30]
    end else if (!(2'h0 == cache_state)) begin // @[test.scala 160:28]
      if (2'h1 == cache_state) begin // @[test.scala 160:28]
        if (!(|_T_18)) begin // @[test.scala 169:50]
          replace <= _GEN_44;
        end
      end
    end
    if (reset) begin // @[test.scala 137:37]
      writeback_addr <= 64'h0; // @[test.scala 137:37]
    end else if (!(2'h0 == cache_state)) begin // @[test.scala 160:28]
      if (2'h1 == cache_state) begin // @[test.scala 160:28]
        if (!(|_T_18)) begin // @[test.scala 169:50]
          writeback_addr <= _GEN_84;
        end
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
  cache_state = _RAND_0[1:0];
  _RAND_1 = {1{`RANDOM}};
  index = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  replace = _RAND_2[1:0];
  _RAND_3 = {2{`RANDOM}};
  writeback_addr = _RAND_3[63:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule

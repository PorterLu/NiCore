module A(
  input        clock,
  input        reset,
  output [3:0] io_out,
  input  [3:0] io_in
);
  wire [1:0] _GEN_0 = io_in == 4'h1 ? 2'h2 : 2'h0; // @[when.scala 16:16 17:28 18:24]
  assign io_out = {{2'd0}, _GEN_0};
endmodule

module A(
  input        clock,
  input        reset,
  output [3:0] io_out,
  input  [3:0] io_in
);
  wire  _T = io_in == 4'h1; // @[when.scala 12:20]
  assign io_out = _T ? io_in : 4'h0; // @[when.scala 11:16 13:9 14:24]
endmodule

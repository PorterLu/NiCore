module TypeConvertDemo(
  input        clock,
  input        reset,
  input  [3:0] io_in,
  output [3:0] io_out
);
  assign io_out = io_in; // @[test.scala 13:10]
  always @(posedge clock) begin
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~reset) begin
          $fwrite(32'h80000002,"8"); // @[test.scala 15:9]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
  end
endmodule

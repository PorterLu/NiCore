// behavioral model of the ysyx S011HD1P_X32Y2D128_BW SRAM macro
// registered read (1-cycle latency), synchronous write
module S011HD1P_X32Y2D128_BW(
    input CLK,
    input CEN,
    input WEN,
    input [127:0] BWEN,
    input [5:0] A,
    input [127:0] D,
    output reg [127:0] Q
);
    reg [127:0] mem [0:63];
    integer i;
    initial begin
        for (i = 0; i < 64; i = i + 1) mem[i] = 128'b0;
        Q = 128'b0;
    end
    always @(posedge CLK) begin
        if (!CEN) begin
            if (!WEN) begin
                mem[A] <= (D & ~BWEN) | (mem[A] & BWEN);
            end else begin
                Q <= mem[A];
            end
        end
    end
endmodule

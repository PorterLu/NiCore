
 import "DPI-C" function void halt();

 module ebreak(input enable);
 always @(*)
  if(enable)
      halt();
 endmodule
             
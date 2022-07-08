
import "DPI-C" function void set_gpr_ptr(input logic [63:0] a[]);
initial set_gpr_ptr(io.regfile)
			
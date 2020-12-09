// Verilog code for Up-Down counter (synchronous clear) :: Non-blocking

module counter(input mode, clr, ld, clk, 
			   input [0:7] d_in, 
			   output reg [0:7] count,
				);
		// behavioral description using procedural blocks
	always@(posedge clk)
		if(ld)	count<=d_in;
else	if(clr)	count<=0;
else	if(mode)count<= count + 1;
else			count<=	count - 1;
endmodule
// parameterized up-down counter

module counter(input clear, clock,ld,
			   input [0:N]count_in,
			   input [0:1]mode,
			   output reg [0:N]count
			   );
			   
	parameter N=7; // 8-bit counter.
	
	always@(posedge clock)
		if(ld) count<=count_in;	// Load the counter reference value.
		else if(clear)
			count<=0;			// Clear the Output register.
		else if(mode)		// Mode = 0 - Up count and Mode =1 - Down count
			 count <=count - 1;
		else count<= count + 1;
endmodule
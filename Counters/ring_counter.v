// Ring -counter

module ring_counter(
					input clk, init,
					output reg[N:0] count
						);
	parameter N=7;
	always@(posedge clk)
		begin
			if(init)
				count = 8'b10000000;	// Load initial bit pattern to the counter.
			else
				begin
					count <=count <<1;		// Non-blocking assignment allows formation of ring
					count[0] <= count[7];
				end
		end
endmodule
				
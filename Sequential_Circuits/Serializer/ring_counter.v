// Ring -counter

module ring_counter(
					input clk, init,
					output reg[N:0] count
						);
	parameter N=3;
	always@(posedge clk)
		begin
			if(init)
				count = 4'b1000;	// Load initial bit pattern to the counter.
			else
				begin
					count <=count <<1;		// Non-blocking assignment allows formation of ring
					count[0] <= count[3];
				end
		end
endmodule
				
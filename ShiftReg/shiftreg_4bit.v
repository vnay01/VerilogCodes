// 4 bit shift register using D Flip Flops

module shiftreg_4bit(clk,clear,A,E);
	input clk, clear,A;
	output reg E;
	reg B,C,D;
	// beginning of behavioral description of the shift register
	always @ (posedge clk or negedge clk)
		begin
			if(!clear)
				begin
				B<=0;
				C<=0;
				D<=0;
				E<=0;
				end
			else
				begin
				E<=D;
				D<=C;
				C<=B;
				B<=A;
				end
		end
	endmodule
	
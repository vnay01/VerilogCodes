//Serial- Shift Registers using D- Flip Flops

// Description of D flipflop
module D_ff(output reg Q,Q_bar, input D,clk,reset);
	always@(posedge clk, negedge reset)
	begin
		if(~reset) Q<=1'b0;
		else Q<=D;
	end
endmodule

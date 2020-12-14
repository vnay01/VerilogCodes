// testbench_comparator
`timescale 1ns / 100ps

module tb_comparator;
	reg [1:0] x,y;
	wire f;
// DUT module instantiation
comparator cmp1(.x(x),.y(y),.f(f));

// Stimulus
initial
	begin
		$dumpfile("tb_comparator.vcd");
		$dumpvars(0,tb_comparator);
		x=2'b01; y=2'b00;
		#10 x=2'b10; y=2'b10;
		#10 x=2'b01; y=2'b11;
	end
	initial
		begin
			$monitor("t=%d x=%2b y=%2b, f=%d",$time, x,y,f);
		end
	endmodule
		
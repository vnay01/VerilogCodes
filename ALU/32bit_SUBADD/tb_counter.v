//`include "counter_paramterized.v"
// test bench
module tb_counter;
	reg clk,clr;
	wire [7:0]out;
	counter CNT(.clear(clr),.clock(clk),.count(out));
	initial
	clk=1'b0;
	always #5 clk=~clk;
	
	initial
	begin
		clr=1'b1;
		#15 clr=1'b0;
		#200 clr =1'b1;
		#10 $finish;
		end
	initial
	begin
	$dumpfile("counter.vcd");
	$dumpvars(0,tb_counter);
	$monitor($time,"count: %d",out);
	end
endmodule
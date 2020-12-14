//testbench for shift register - 4_bit
module shift_test;
	reg clk,clr,in;
	wire out;
	integer i;
// DUT instantiation
shift_register shift_reg(.clock(clk),.clear(clr),.A(in),.E(out));
// Stimulus
// 
initial 
begin
	clk=1'b0;
	#2 clr =0;
	#5 clr =1;
	end
	// clock generation block
always
	#5 clk=~clk;
	
initial
begin
#2;
repeat(2)
begin
	#10 in=0;
	#10 in=0;
	#10 in=1;
	#10 in=1;
	end
end

initial
	begin
	$dumpfile("shift_register.vcd");
	$dumpvars(0,shift_test);
	#200 $finish;
	end
endmodule
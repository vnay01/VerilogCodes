// Test bench for shift register 4-bit

module test_bench;
	reg clr,clk,in;
	wire out;

// Instantiate a 4bit shift register
shiftreg_4bit SR(clk, clr, in, out);
// code for testbench begins here
initial
	begin
		clk =1'b0;
		#2 clr =0;
		#3 clr =1;
		end
// All the flip flops have been cleared after the previous operation. Now we need to simulate clock signal.
always #5 clk =~clk;  // This line toggles the clock signal between 0 and 1 every 5 intervals.

// Input test bit pattern - 1100
initial
	begin
		#2;
		repeat(2) // repeat the block for 2 times
			
		begin
			#10 in=0;
			#10 in = 0;
			#10 in = 1;
			#10 in =1;
			end
			end
	initial
		begin
		$dumpfile("test_shifter.vcd");
		$dumpvars(0,test_bench);
		#200 $finish;
	end
endmodule
	
		
		



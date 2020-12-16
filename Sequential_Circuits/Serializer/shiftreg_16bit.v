// 4 bit shift register using D Flip Flops
`timescale 1ns/10ps

module shiftreg_16bit(input clk,clear,
					  input A,
					  output reg[N:0]E);
	/*input clk, clear,A;
	output reg E;
	reg B,C,D;
	*/
	// beginning of behavioral description of the shift register
	parameter N=15;
	integer i;
	always @ (posedge clk or negedge clk)
		begin
			if(!clear)
				begin
				for(i=N-1;i>=0;i--)
				begin
				E[N:0]<=0;
				end
				end
			else
				begin
					for(i=N;i>=0;i--)
					begin
					E[N]<=E[N-1];
					E[N-1]<=E[N-2];
					E[N-2]<=E[N-3];
					E[N-3]<=E[N-4];
					E[N-4]<=E[N-5];
					E[N-5]<=E[N-6];
					E[N-6]<=E[N-7];
					E[N-7]<=E[N-8];
					E[N-8]<=E[N-9];
					E[N-9]<=E[N-10];
					E[N-10]<=E[N-11];
					E[N-11]<=E[N-12];
					E[N-12]<=E[N-13];
					E[N-13]<=E[N-14];
					E[N-14]<=E[N-15];
					E[N-15]<=A;	
					end
				end
		end
	endmodule

// test bench

// Test bench for shift register 4-bit

module test_bench;
	reg clr,clk,in;
	wire [N:0]out;
	parameter N=15;

// Instantiate a 4bit shift register
shiftreg_16bit SR(.clk(clk), .clear(clr), .A(in), .E(out));
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
		$monitor($time,"E: %4h",out);
		$dumpfile("test_shifter.vcd");
		$dumpvars(0,test_bench);
		#1000 $finish;
	end
endmodule

	
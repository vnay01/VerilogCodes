// Testbench for ripple adder
module testbenchripple(S,Cout,A,B,Cin);
	reg [0:3]A,B;
	reg Cin;
	output [0:3]S;
	output Cout;
	input [0:3]A,B;
	input Cin;
// instantiate DUT module.
	ripple_adder DUT(S,Cout,A,B,Cin);
// Start simulation from here
	initial
		begin
			$dumpfile("ripple_adder.vcd");
			$dumpvars(0,testbenchripple);
			$monitor($time,"A=%h,B=%h,Cin=%b, S=%h,Cout=%b",A,B,Cin,S,Cout);
			#5 A=4'b0;B=4'b0;Cin=1'b0;
			#5 A=4'b0;B=4'b0;Cin=1'b1;
			#5 A=4'b0;B=4'b1;Cin=1'b0;
			#5 A=4'b0;B=4'b1;Cin=1'b1;
			#5 A=4'b1;B=4'b0;Cin=1'b0;
			#5 A=4'b1;B=4'b0;Cin=1'b1;
			#5 A=4'b0;B=4'b1;Cin=1'b0;
			#5 A=4'b1;B=4'b1;Cin=1'b1;
			#5 $finish;
		end
endmodule
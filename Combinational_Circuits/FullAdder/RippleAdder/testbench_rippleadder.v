// Testbench for ripple adder
module testbenchripple;
	reg [0:3]A,B;
	reg Cin;
	wire [0:3]S;
	wire Cout;
	integer i;
// instantiate DUT module.
	ripple_adder RA1(S,Cout,A,B,Cin);
// Start simulation from here
	initial
		begin
			$dumpfile("ripple_adder.vcd");
			$dumpvars(0,testbenchripple);
			
			begin
			for(i=0;i<8;i++)
			{A,B,Cin}=i;
			#5;
			$monitor($time,"A=%h,B=%h,Cin=%b, S=%h,Cout=%b",A,B,Cin,S,Cout);
			end
			/*#5 A=4'b0;B=4'b0;Cin=1'b0;
			#5 A=4'b0;B=4'b0;Cin=1'b1;
			#5 A=4'b0;B=4'b1;Cin=1'b0;
			#5 A=4'b0;B=4'b1;Cin=1'b1;
			#5 A=4'b1;B=4'b0;Cin=1'b0;
			#5 A=4'b1;B=4'b0;Cin=1'b1;
			#5 A=4'b0;B=4'b1;Cin=1'b0;
			#5 A=4'b1;B=4'b1;Cin=1'b1;
			*/
			#5 $finish;
		end
endmodule

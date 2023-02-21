// 4 bit ripple carry adder. Structural description of a half adder
module half_adder(output S,C, input A,B); // Verilog 2001 convention
	xor(S,A,B);
	and(C,A,B);
endmodule
//Use Half Adders to create full adders- Structural description of FA
module full_adder(output S,C, input A,B,Cin);
	wire S1,C1,D1;
// Instantiate Half adders
	half_adder HA1(S1,C1,A,B);
	half_adder HA2(S,D1,S1,Cin);
	or (C,D1,C1);
endmodule

// We will be creating 8-bit ripple carry Full adder by using Full Adders.
module ripple_adder(output [0:7]S, output Cout,input [0:7]A,B, input Cin);
	wire [0:7]B_in;
	wire C1,C2,C3,C4,C5,C6,C7;		// Rippled Carry - refer schematic representation for details.
	xor G1(B_in[0],B[0],Cin);
	xor G2(B_in[1],B[1],Cin);
	xor G3(B_in[2],B[2],Cin);
	xor G4(B_in[3],B[3],Cin);
	xor G5(B_in[4],B[4],Cin);
	xor G6(B_in[5],B[5],Cin);
	xor G7(B_in[6],B[6],Cin);
	xor G8(B_in[7],B[7],Cin);
// Instantiate Full adders to create a 8-bit Ripple carry adder.
	full_adder FA1(S[0],C1,A[0],B_in[0],Cin);
	full_adder FA2(S[1],C2,A[1],B_in[1],C1);
	full_adder FA3(S[2],C3,A[2],B_in[2],C2);
	full_adder FA4(S[3],C4,A[3],B_in[3],C3);
	full_adder FA5(S[4],C5,A[4],B_in[4],C4);
	full_adder FA6(S[5],C6,A[5],B_in[5],C5);
	full_adder FA7(S[6],C7,A[6],B_in[6],C6);
	full_adder FA8(S[7],Cout,A[7],B_in[7],C7);
endmodule

// testbench
// Testbench for ripple adder
module testbenchripple;
	reg [0:7]A,B;
	reg Cin;
	wire [0:7]S;
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
			for(i=0;i<255;i++)
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
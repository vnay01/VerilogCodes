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

// We will be creating 4-bit ripple carry Full adder by using Full Adders.
module ripple_adder(output [0:3]S, output Cout,input [0:3]A,B, input Cin);
	wire C1,C2,C3;		// Rippled Carry - refer schematic representation for details.
// Instantiate Full adders to create a 4-bit Ripple carry adder.
	full_adder FA1(S[0],C1,A[0],B[0],Cin);
	full_adder FA2(S[1],C2,A[1],B[1],C1);
	full_adder FA3(S[2],C3,A[2],B[2],C2);
	full_adder FA4(S[3],Cout,A[3],B[3],C3);
endmodule
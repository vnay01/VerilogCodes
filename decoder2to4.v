// Verilog code for 2 to 4 line decoder

module decoder2to4(D,A,B,E);
	input A,B,E;
	output [0:3] D;
	wire A_not,B_not,E_not;
	not G1(A_not,A);
	not G2(B_not,B);
	not G3(E_not,E);
	and	G4(D[0],A_not,B_not,E_not);
	and G5(D[1],A_not,B,E_not);
	and G6(D[2],A,B_not,E_not);
	and	G7(D[3],A,B,E_not);
endmodule
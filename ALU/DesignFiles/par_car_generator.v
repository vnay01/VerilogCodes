// Adder Circuit using Carry look ahead logic
// The block below generates the Parity and Carry from input binary bits
// P[i] = A[i]^B[i] 
// G[i] = A[i]&B[i] ; where i =0 to (n-1) for "n" bit number.
module prop_car_gen(output [0:7]P,G, input [0:7]A,B);
	//structural definition
	xor G1(P[0],A[0],B[0]);
	and G2(G[0],A[0],B[0]);
	xor G3(P[1],A[1],B[1]);
	and G4(G[1],A[1],B[1]);
	xor G5(P[2],A[2],B[2]);
	and G6(G[2],A[2],B[2]);
	xor G7(P[3],A[3],B[3]);
	and G8(G[3],A[3],B[3]);
	xor G9(P[4],A[4],B[4]);
	and G10(G[4],A[4],B[4]);
	xor G11(P[5],A[5],B[5]);
	and G12(G[5],A[5],B[5]);
	xor G13(P[6],A[6],B[6]);
	and G14(G[6],A[6],B[6]);
	xor G15(P[7],A[7],B[7]);
	and G16(G[7],A[7],B[7]);
endmodule
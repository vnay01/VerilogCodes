// carry look ahead generator - 8 bit
module carry_gen(output [0:7]C, output c_out ,input [0:7]P,G);
wire [0:36]w;
// structural description of gates used to generate the SOM (refer Carry Look ahead generator logic)

and G1(w[0],P[0],C[0]),

	G2(w[1],P[1],G[0]),
	G3(w[2],P[1],P[0],C[0]),
	
	G4(w[3],P[2],G[1]),
	G5(w[4],P[2],P[1],G[0]),
	G6(w[5],P[2],P[1],P[0],C[0]),
	
	G7(w[6],P[3],G[2]),
	G8(w[7],P[3],P[2],G[1]),
	G9(w[8],P[3],P[2],P[1],G[0]),
	G10(w[9],P[3],P[2],P[1],P[0],C[0]),
	
	G11(w[10],P[4],G[3]),
	G12(w[11],P[4],P[3],G[2]),
	G13(w[12],P[4],P[3],P[2],G[1]),
	G14(w[13],P[4],P[3],P[2],P[1],G[0]),
	G15(w[14],P[4],P[3],P[2],P[1],P[0],C[0]),
	
	G17(w[16],P[5],G[4]),
	G18(w[17],P[5],P[4],G[3]),
	G19(w[18],P[5],P[4],P[3],G[2]),
	G20(w[19],P[5],P[4],P[3],P[2],G[1]),
	G21(w[20],P[5],P[4],P[3],P[2],P[1],G[0]),
	G22(w[21],P[5],P[4],P[3],P[2],P[1],P[0],C[0]),
	
	G23(w[22],P[6],G[5]),
	G24(w[23],P[6],P[5],G[4]),
	G25(w[24],P[6],P[5],P[4],G[3]),
	G26(w[25],P[6],P[5],P[4],P[3],G[2]),
	G27(w[26],P[6],P[5],P[4],P[3],P[2],G[1]),
	G28(w[27],P[6],P[5],P[4],P[3],P[2],P[1],G[0]),
	G29(w[28],P[6],P[5],P[4],P[3],P[2],P[1],P[0],C[0]),
	
	G30(w[29],P[7],G[6]),
	G31(w[30],P[7],P[6],G[5]),
	G32(w[31],P[7],P[6],P[5],G[4]),
	G33(w[32],P[7],P[6],P[5],P[4],G[3]),
	G34(w[33],P[7],P[6],P[5],P[4],P[3],G[2]),
	G35(w[34],P[7],P[6],P[5],P[4],P[3],P[2],G[1]),
	G36(w[35],P[7],P[6],P[5],P[4],P[3],P[2],P[1],G[0]),
	G37(w[36],P[7],P[6],P[5],P[4],P[3],P[2],P[1],P[0],G[0]);
	
	// carry output
	// C[n] denotes the carry generated for each individual bit. where n = 1,2,3,4,5,6,7 stage carry bit
	or CG1(C[1],G[0],G1),
	   CG2(C[2],G[1],G2,G3),
	   CG3(C[3],G[2],G4,G5,G6),
	   CG4(C[4],G[3],G7,G8,G9,G10),
	   CG5(C[5],G[4],G11,G12,G13,G14,G15),
	   CG6(C[6],G[5],G17,G18,G19,G20,G21,G22),
	   CG7(C[7],G[6],G23,G24,G25,G26,G27,G28,G29),
	   CG8(c_out,G[7],G30,G31,G32,G33,G34,G35,G36,G37);
endmodule
	
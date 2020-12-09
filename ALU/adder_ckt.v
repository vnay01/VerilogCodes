// Adder Ckt
module Adder(output [0:7]S , output Carry_out , input [0:7]P,C);
// Use module instantiation of intermediate logic (Carry_look_ahead)

// structural description
xor G1(S[0],P[0],C[0]),
	G2(S[1],P[1],C[1]),
	G3(S[2],P[2],C[2]),
	G4(S[3],P[3],C[3]),
	G5(S[4],P[4],C[4]),
	G6(S[5],P[5],C[5]),
	G7(S[6],P[6],C[6]),
	G8(S[7],P[7],C[7]);
endmodule
module ADD(output [0:7]S, output C_out, input [0:7]A,B);
	par_car_gen PCG1([0:7]P,[0:7]G,[0:7]A,[0:7]B);
	carry_gen CG([0:7]Carry, C_out,[0:7]P,[0:7]G);
	Adder sum([0:7]S,C_out,[0:7]P,[0:7]C);
	endmodule
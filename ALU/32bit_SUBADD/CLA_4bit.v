module CLA_FA(
			input [3:0]A,B,
			input Cin,
			output [3:0]S,
			output Cout
				);

// Wires for connecting modules

	wire [4:0]carry_int; // Used to hold the output intermediate carry from the Carry Look Ahead block
	wire [3:0] w_prop,w_gen; 		// Connection between prop_carr block and look_ahead block
	
// Instantiate carry generate & propagate generate block
	carry_prop_block CPB (
						.a(A),
						.b(B),
						.P(w_prop),
						.G(w_gen)		
							);
// Instantiate carry look ahead generator block
	carry_look_ahead CLA(
						.prop(w_prop),
						.carry_gen(w_gen),
						.C0(Cin),
						.Cint(carry_int)
							);
// Instantiate an array of XOR gates to calculate the SUM
	
	xor sum[3:0](S[3:0],w_prop[3:0],carry_int[3:0]);
	
/*
// Using "generate" for creating array of xor gates

genvar P;
generate 
 for(P=0;P<4;P++)
	begin: xorlp
		xor sum(S[P],P[P],carry_int[P]);
	
	end
	
endgenerate
*/
assign Cout = carry_int[4];

	
endmodule



/* 4- bit Carry look ahead Full Adder.

*/
// Carry Generate & propagate logic block
module carry_prop_block(
						input [3:0]a,b,
						output reg [3:0]P,G
						);
	//wire P,G;
	integer i;
	// logic to generate propagate, P
	initial
	begin
	for(i=0;i<4;i++)
	begin
		P[i]= (a[i]^b[i]);
	end
	// logic to generate carry , C
	for(i=0;i<4;i++)
		begin
		G[i]= (a[i]&b[i]);
	end
	end
endmodule

// Look-Ahead generator block
module carry_look_ahead (
						input [3:0]prop,carry_gen,
						input C0,
						output[4:0]Cint
							);

	// logical implementation of carry look ahead
	// refer eqn 1 through eqn 31 in the theory part for details.
assign Cint[0]=C0;

assign Cint[1]= ((carry_gen[0])|
				(prop[0]&C0));

assign Cint[2]= ((carry_gen[1])|
				(prop[1]&carry_gen[0])|
				(prop[1]&prop[0]&C0));

assign Cint[3]= ((carry_gen[2])|
				(prop[2]&carry_gen[1])|
				(prop[2]&prop[1]&carry_gen[0])|
				(prop[2]&prop[1]&prop[0]&C0));

assign Cint[4]= ((carry_gen[3])|
				(prop[3]&carry_gen[2])|
				(prop[3]&prop[2]&carry_gen[1])|
				(prop[3]&prop[2]&prop[1]&carry_gen[0])|
				(prop[3]&prop[2]&prop[1]&prop[0]&C0));
				
endmodule


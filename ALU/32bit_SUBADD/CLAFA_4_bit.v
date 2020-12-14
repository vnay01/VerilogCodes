
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
// code for carry look ahead logic block
module carry_look_ahead (
						input [3:0]prop,carry_gen,
						input C0,
						output reg[4:0]Cint
							);
	// logical implementation of carry look ahead
	// refer eqn 1 through eqn 31 in the theory part for details.
	always@(prop, carry_gen,C0)
	begin
		assign   Cint[3:0]=[C0,((carry_gen[0])|
				(prop[0]&C0)),((carry_gen[1])|
				(prop[1]&carry_gen[0])|
				(prop[1]&prop[0]&C0)),((carry_gen[2])|
				(prop[2]&carry_gen[1])|
				(prop[2]&prop[1]&carry_gen[0])|
				(prop[2]&prop[1]&prop[0]&C0)),((carry_gen[3])|
				(prop[3]&carry_gen[2])|
				(prop[3]&prop[2]&carry_gen[1])|
				(prop[3]&prop[2]&prop[1]&carry_gen[0])|
				(prop[3]&prop[2]&prop[1]&prop[0]&C0))];
end
endmodule
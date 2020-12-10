/* 32- bit Carry look ahead Full Adder.

*/
// Carry Generate & propagate logic block
module carry_prop_block(
						input [31:0]a,b,
						output reg [31:0]P,G
						);
	//wire P,G;
	integer i;
	// logic to generate propagate, P
	initial
	begin
	for(i=0;i<32;i++)
	begin
		P[i]= (a[i]^b[i]);
	end
	// logic to generate carry , C
	for(i=0;i<32;i++)
		begin
		G[i]= (a[i]&b[i]);
	end
	end
endmodule

// code for carry look ahead logic block
module carry_look_ahead (
						input [31:0]prop,carry_gen,
						input C0,
						output[32:0]Cint
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

assign Cint[5]= ((carry_gen[4])|
				(prop[4]&carry_gen[3])|
				(prop[4]&prop[3]&carry_gen[2])|
				(prop[4]&prop[3]&prop[2]&carry_gen[1])|
				(prop[4]&prop[3]&prop[2]&prop[1]&carry_gen[0])|
				(prop[4]&prop[3]&prop[2]&prop[1]&prop[0]&C0));

assign Cint[6]= ((carry_gen[5])|
				(prop[5]&carry_gen[4])|
				(prop[5]&prop[4]&carry_gen[3])|
				(prop[5]&prop[4]&prop[3]&carry_gen[2])|
				(prop[5]&prop[4]&prop[3]&prop(2)&carry_gen[1])|
				(prop[5]&prop[4]&prop[3]&prop(2)&prop[1]&carry_gen[0])|
				(prop[5]&prop[4]&prop[3]&prop(2)&prop[1]&prop[0]&C0));

assign Cint[7]= ((carry_gen[6])|
				(prop[6]&carry_gen[5])|
				(prop[6]&prop[5]&carry_gen[4])|
				(prop[6]&prop[5]&prop[4]&carry_gen[3])|
				(prop[6]&prop[5]&prop[4]&prop[3]&carry_gen[2])|
				(prop[6]&prop[5]&prop[4]&prop[3]&prop[2]&carry_gen[1])|
				(prop[6]&prop[5]&prop[4]&prop[3]&prop[2]&prop[1]&carry_gen[0])|
				(prop[6]&prop[5]&prop[4]&prop[3]&prop[2]&prop[1]&prop[0]&C0));

assign Cint[8]= ((carry_gen[7])|
				(prop[7]&carry_gen[6])|
				(prop[7]&prop[6]&carry_gen[5])|
				(prop[7]&prop[6]&prop[5]&carry_gen[4])|
				(prop[7]&prop[6]&prop[5]&prop[4]&carry_gen[3])|
				(prop[7]&prop[6]&prop[5]&prop[4]&prop[3]&carry_gen[2])|
				(prop[7]&prop[6]&prop[5]&prop[4]&prop[3]&prop[2]&carry_gen[1])|
				(prop[7]&prop[6]&prop[5]&prop[4]&prop[3]&prop[2]&prop[1]&carry_gen[0])|
				(prop[7]&prop[6]&prop[5]&prop[4]&prop[3]&prop[2]&prop[1]&prop[0]&C0));

assign Cint[9]= ((carry_gen[8])|
				(prop[8]&carry_gen[7])|
				(prop[8]&prop[7]&carry_gen[6])|
				(prop[8]&prop[7]&prop[6]&carry_gen[5])|
				(prop[8]&prop[7]&prop[6]&prop[5]&carry_gen[4])|
				(prop[8]&prop[7]&prop[6]&prop[5]&prop[4]&carry_gen[3])|
				(prop[8]&prop[7]&prop[6]&prop[5]&prop[4]&prop[3]&carry_gen[2])|
				(prop[8]&prop[7]&prop[6]&prop[5]&prop[4]&prop[3]&prop[2]&carry_gen[1])|
				(prop[8]&prop[7]&prop[6]&prop[5]&prop[4]&prop[3]&prop[2]&prop[1]&carry_gen[0])|
				(prop[8]&prop[7]&prop[6]&prop[5]&prop[4]&prop[3]&prop[2]&prop[1]&prop[0]&C0));

assign Cint[10]=((carry_gen[9])|
				(prop[9]&carry_gen[8])|
				(prop[9]&prop[8]&carry_gen[7])|
				(prop[9]&prop[8]&prop[7]&carry_gen[6])|
				(prop[9]&prop[8]&prop[7]&prop[6]&carry_gen[5])|
				(prop[9]&prop[8]&prop[7]&prop[6]&prop[5]&carry_gen[4])|
				(prop[9]&prop[8]&prop[7]&prop[6]&prop[5]&prop[4]&carry_gen[3])|
				(prop[9]&prop[8]&prop[7]&prop[6]&prop[5]&prop[4]&prop[3]&carry_gen[2])|
				(prop[9]&prop[8]&prop[7]&prop[6]&prop[5]&prop[4]&prop[3]&prop[2]&carry_gen[1])|
				(prop[9]&prop[8]&prop[7]&prop[6]&prop[5]&prop[4]&prop[3]&prop[2]&prop[1]&carry_gen[0])|
				(prop[9]&prop[8]&prop[7]&prop[6]&prop[5]&prop[4]&prop[3]&prop[2]&prop[1]&prop[0]&C0));

assign Cint[11]=((carry_gen[10])|
				(prop[10]&carry_gen[9])|
				(prop[10]&prop[9]&carry_gen[8])|
				(prop[10]&prop[9]&prop[8]&carry_gen[7])|
				(prop[10]&prop[9]&prop[8]&prop[7]&carry_gen[6])|
				(prop[10]&prop[9]&prop[8]&prop[7]&prop[6]&carry_gen[5])|
				(prop[10]&prop[9]&prop[8]&prop[7]&prop[6]&prop[5]&carry_gen[4])|
				(prop[10]&prop[9]&prop[8]&prop[7]&prop[6]&prop[5]&prop[4]&carry_gen[3])|
				(prop[10]&prop[9]&prop[8]&prop[7]&prop[6]&prop[5]&prop[4]&prop[3]&carry_gen[2])|
				(prop[10]&prop[9]&prop[8]&prop[7]&prop[6]&prop[5]&prop[4]&prop[3]&prop[2]&carry_gen[1])|
				(prop[10]&prop[9]&prop[8]&prop[7]&prop[6]&prop[5]&prop[4]&prop[3]&prop[2]&prop[1]&carry_gen[0])|
				(prop[10]&prop[9]&prop[8]&prop[7]&prop[6]&prop[5]&prop[4]&prop[3]&prop[2]&prop[1]&prop[0]&C0));

assign Cint[12]=((carry_gen[11])|
				(prop[11]&carry_gen[10])|
				(prop[11]&prop[10]&carry_gen[9])|
				(prop[11]&prop[10]&prop[9]&carry_gen[8])|
				(prop[11]&prop[10]&prop[9]&prop[8]&carry_gen[7])|
				(prop[11]&prop[10]&prop[9]&prop[8]&prop[7]&carry_gen[6])|
				(prop[11]&prop[10]&prop[9]&prop[8]&prop[7]&prop[6]&carry_gen[5])|
				(prop[11]&prop[10]&prop[9]&prop[8]&prop[7]&prop[6]&prop[5]&carry_gen[4])|
				(prop[11]&prop[10]&prop[9]&prop[8]&prop[7]&prop[6]&prop[5]&prop[4]&carry_gen[3])|
				(prop[11]&prop[10]&prop[9]&prop[8]&prop[7]&prop[6]&prop[5]&prop[4]&prop[3]&carry_gen[2])|
				(prop[11]&prop[10]&prop[9]&prop[8]&prop[7]&prop[6]&prop[5]&prop[4]&prop[3]&prop[2]&carry_gen[1])|
				(prop[11]&prop[10]&prop[9]&prop[8]&prop[7]&prop[6]&prop[5]&prop[4]&prop[3]&prop[2]&prop[1]&carry_gen[0])|
				(prop[11]&prop[10]&prop[9]&prop[8]&prop[7]&prop[6]&prop[5]&prop[4]&prop[3]&prop[2]&prop[1]&prop[0]&C0));

assign Cint[13]=((carry_gen[12])|
				(prop[12]&carry_gen[11])|
				(prop[12]&prop[11]&carry_gen[10])|
				(prop[12]&prop[11]&prop[10]&carry_gen[9])|
				(prop[12]&prop[11]&prop[10]&prop[9]&carry_gen[8])|
				(prop[12]&prop[11]&prop[10]&prop[9]&prop[8]&carry_gen[7])|
				(prop[12]&prop[11]&prop[10]&prop[9]&prop[8]&prop[7]&carry_gen[6])|
				(prop[12]&prop[11]&prop[10]&prop[9]&prop[8]&prop[7]&prop[6]&carry_gen[5])|
				(prop[12]&prop[11]&prop[10]&prop[9]&prop[8]&prop[7]&prop[6]&prop[5]&carry_gen[4])|
				(prop[12]&prop[11]&prop[10]&prop[9]&prop[8]&prop[7]&prop[6]&prop[5]&prop[4]&carry_gen[3])|
				(prop[12]&prop[11]&prop[10]&prop[9]&prop[8]&prop[7]&prop[6]&prop[5]&prop[4]&prop[3]&carry_gen[2])|
				(prop[12]&prop[11]&prop[10]&prop[9]&prop[8]&prop[7]&prop[6]&prop[5]&prop[4]&prop[3]&prop[2]&carry_gen[1])|
				(prop[12]&prop[11]&prop[10]&prop[9]&prop[8]&prop[7]&prop[6]&prop[5]&prop[4]&prop[3]&prop[2]&prop[1]&carry_gen[0])|
				(prop[12]&prop[11]&prop[10]&prop[9]&prop[8]&prop[7]&prop[6]&prop[5]&prop[4]&prop[3]&prop[2]&prop[1]&prop[0]&C0));

assign Cint[14]=((carry_gen[13])|
				(prop[13]&carry_gen[12])|
				(prop[13]&prop[12]&carry_gen[11])|
				(prop[13]&prop[12]&prop[11]&carry_gen[10])|
				(prop[13]&prop[12]&prop[11]&prop[10]&carry_gen[9])|
				(prop[13]&prop[12]&prop[11]&prop[10]&prop[9]&carry_gen[8])|
				(prop[13]&prop[12]&prop[11]&prop[10]&prop[9]&prop[8]&carry_gen[7])|
				(prop[13]&prop[12]&prop[11]&prop[10]&prop[9]&prop[8]&prop[7]&carry_gen[6])|
				(prop[13]&prop[12]&prop[11]&prop[10]&prop[9]&prop[8]&prop[7]&prop[6]&carry_gen[5])|
				(prop[13]&prop[12]&prop[11]&prop[10]&prop[9]&prop[8]&prop[7]&prop[6]&prop[5]&carry_gen[4])|
				(prop[13]&prop[12]&prop[11]&prop[10]&prop[9]&prop[8]&prop[7]&prop[6]&prop[5]&prop[4]&carry_gen[3])|
				(prop[13]&prop[12]&prop[11]&prop[10]&prop[9]&prop[8]&prop[7]&prop[6]&prop[5]&prop[4]&prop[3]&carry_gen[2])|
				(prop[13]&prop[12]&prop[11]&prop[10]&prop[9]&prop[8]&prop[7]&prop[6]&prop[5]&prop[4]&prop[3]&prop[2]&carry_gen[1])|
				(prop[13]&prop[12]&prop[11]&prop[10]&prop[9]&prop[8]&prop[7]&prop[6]&prop[5]&prop[4]&prop[3]&prop[2]&prop[1]&carry_gen[0])|
				(prop[13]&prop[12]&prop[11]&prop[10]&prop[9]&prop[8]&prop[7]&prop[6]&prop[5]&prop[4]&prop[3]&prop[2]&prop[1]&prop[0]&C0));
assign Cint[15]=((carry_gen[14])|
				(prop[14]&carry_gen[13])|
				(prop[14]&prop[13]&carry_gen[12])|
				(prop[14]&prop[13]&prop[12]&carry_gen[11])|
				(prop[14]&prop[13]&prop[12]&prop[11]&carry_gen[10])|
				(prop[14]&prop[13]&prop[12]&prop[11]&prop[10]&carry_gen[9])|
				(prop[14]&prop[13]&prop[12]&prop[11]&prop[10]&prop[9]&carry_gen[8])|
				(prop[14]&prop[13]&prop[12]&prop[11]&prop[10]&prop[9]& prop[8]&carry_gen[7])|
				(prop[14]&prop[13]&prop[12]&prop[11]&prop[10]&prop[9]&prop[8]&prop[7]&carry_gen[6])|
				(prop[14]&prop[13]&prop[12]&prop[11]&prop[10]&prop[9]&prop[8]&prop[7])&prop[6]&carry_gen[5])|
				(prop[14]&prop[13]&prop[12]&prop[11]&prop[10]&prop[9]&prop[8]&prop[7]&prop[6]&prop[5]&carry_gen[4])|
				(prop[14]&prop[13]&prop[12]&prop[11]&prop[10]&prop[9]&prop[8]&prop[7]&prop[6]&prop[5]&prop[4]&carry_gen[3])|
				(prop[14]&prop[13]&prop[12]&prop[11]&prop[10]&prop[9]&prop[8]&prop[7]&prop[6]&prop[5]&prop[4]&prop[3]&carry_gen[2])|
				(prop[14]&prop[13]&prop[12]&prop[11]&prop[10]&prop[9]&prop[8]&prop[7]&prop[6]&prop[5]&prop[4]&prop[3]&prop[2]&carry_gen[1])|
				(prop[14]&prop[13]&prop[12]&prop[11]&prop[10]&prop[9]&prop[8]&prop[7]&prop[6]&prop[5]&prop[4]&prop[3]&prop[2]&prop[1]&carry_gen[0])|
				(prop[14]&(prop[13]&prop[12]&prop[11]&prop[10]&prop[9]&prop[8]&prop[7]&prop[6]&prop[5]&prop[4]&prop[3]&prop[2]&prop[1]&prop[0]&C0));
assign Cint[16]=((carry_gen[15])|
				(prop[15]&carry_gen[14])|
				(prop[15]&prop[14]&carry_gen[13])|
				(prop[15]&prop[14]&prop[13]&carry_gen[12])|
				(prop[15]&prop[14]&prop[13]&prop[12]&carry_gen[11])|
				(prop[15]&prop[14]&prop[13]&prop[12]&prop[11]&carry_gen[10])|
				(prop[15]&prop[14]&prop[13]&prop[12]&prop[11]&prop[10]&carry_gen[9])|
				(prop[15]&prop[14]&prop[13]&prop[12]&prop[11]&prop[10]&prop[9]&carry_gen[8])|
				(prop[15]&prop[14]&prop[13]&prop[12]&prop[11]&prop[10]&prop[9]& prop[8]&carry_gen[7])|
				(prop[15]&prop[14]&prop[13]&prop[12]&prop[11]&prop[10]&prop[9]&prop[8]&prop[7]&carry_gen[6])|
				(prop[15]&prop[14]&prop[13]&prop[12]&prop[11]&prop[10]&prop[9]&prop[8]&prop[7])&prop[6]&carry_gen[5])|
				(prop[15]&prop[14]&prop[13]&prop[12]&prop[11]&prop[10]&prop[9]&prop[8]&prop[7]&prop[6]&prop[5]&carry_gen[4])|
				(prop[15]&prop[14]&prop[13]&prop[12]&prop[11]&prop[10]&prop[9]&prop[8]&prop[7]&prop[6]&prop[5]&prop[4]&carry_gen[3])|
				(prop[15]&prop[14]&prop[13]&prop[12]&prop[11]&prop[10]&prop[9]&prop[8]&prop[7]&prop[6]&prop[5]&prop[4]&prop[3]&carry_gen[2])|
				(prop[15]&prop[14]&prop[13]&prop[12]&prop[11]&prop[10]&prop[9]&prop[8]&prop[7]&prop[6]&prop[5]&prop[4]&prop[3]&prop[2]&carry_gen[1])|
				(prop[15]&prop[14]&prop[13]&prop[12]&prop[11]&prop[10]&prop[9]&prop[8]&prop[7]&prop[6]&prop[5]&prop[4]&prop[3]&prop[2]&prop[1]&carry_gen[0])|
				(prop[15]&prop[14]&(prop[13]&prop[12]&prop[11]&prop[10]&prop[9]&prop[8]&prop[7]&prop[6]&prop[5]&prop[4]&prop[3]&prop[2]&prop[1]&prop[0]&C0));
assign Cint[17]=((carry_gen[16])|
				(prop[16]&carry_gen[15])|
				(prop[16]&prop[15]&carry_gen[14])|
				(prop[16]&prop[15]&prop[14]&prop[13]&carry_gen[12])|
				(prop[16]&prop[15]&prop[14]&prop[13]&prop[12]&carry_gen[11])|
				(prop[16]&prop[15]&prop[14]&prop[13]&prop[12]&prop[11]&carry_gen[10])|
				(prop[16]&prop[15]&prop[14]&prop[13]&prop[12]&prop[11]&prop[10]&carry_gen[9])|
				(prop[16]&prop[15]&prop[14]&prop[13]&prop[12]&prop[11]&prop[10]&prop[9]&carry_gen[8])|
				(prop[16]&prop[15]&prop[14]&prop[13]&prop[12]&prop[11]&prop[10]&prop[9]& prop[8]&carry_gen[7])|
				(prop[16]&prop[15]&prop[14]&prop[13]&prop[12]&prop[11]&prop[10]&prop[9]&prop[8]&prop[7]&carry_gen[6])|
				(prop[16]&prop[15]&prop[14]&prop[13]&prop[12]&prop[11]&prop[10]&prop[9]&prop[8]&prop[7])&prop[6]&carry_gen[5])|
				(prop[16]&prop[15]&prop[14]&prop[13]&prop[12]&prop[11]&prop[10]&prop[9]&prop[8]&prop[7]&prop[6]&prop[5]&carry_gen[4])|
				(prop[16]&prop[15]&prop[14]&prop[13]&prop[12]&prop[11]&prop[10]&prop[9]&prop[8]&prop[7]&prop[6]&prop[5]&prop[4]&carry_gen[3])|
				(prop[16]&prop[15]&prop[14]&prop[13]&prop[12]&prop[11]&prop[10]&prop[9]&prop[8]&prop[7]&prop[6]&prop[5]&prop[4]&prop[3]&carry_gen[2])|
				(prop[16]&prop[15]&prop[14]&prop[13]&prop[12]&prop[11]&prop[10]&prop[9]&prop[8]&prop[7]&prop[6]&prop[5]&prop[4]&prop[3]&prop[2]&carry_gen[1])|
				(prop[16]&prop[15]&prop[14]&prop[13]&prop[12]&prop[11]&prop[10]&prop[9]&prop[8]&prop[7]&prop[6]&prop[5]&prop[4]&prop[3]&prop[2]&prop[1]&carry_gen[0])|
				(prop[16]&prop[15]&prop[14]&(prop[13]&prop[12]&prop[11]&prop[10]&prop[9]&prop[8]&prop[7]&prop[6]&prop[5]&prop[4]&prop[3]&prop[2]&prop[1]&prop[0]&C0));
assign Cint[18]=((carry_gen[17])|
				(prop[17]&carry_gen[16])|
				(prop[17]&prop[16]&carry_gen[15])|
				(prop[17]&prop[16]&prop[15]&carry_gen[14])|
				(prop[17]&prop[16]&prop[15]&prop[14]&prop[13]&carry_gen[12])|
				(prop[17]&prop[16]&prop[15]&prop[14]&prop[13]&prop[12]&carry_gen[11])|
				(prop[17]&prop[16]&prop[15]&prop[14]&prop[13]&prop[12]&prop[11]&carry_gen[10])|
				(prop[17]&prop[16]&prop[15]&prop[14]&prop[13]&prop[12]&prop[11]&prop[10]&carry_gen[9])|
				(prop[17]&prop[16]&prop[15]&prop[14]&prop[13]&prop[12]&prop[11]&prop[10]&prop[9]&carry_gen[8])|
				(prop[17]&prop[16]&prop[15]&prop[14]&prop[13]&prop[12]&prop[11]&prop[10]&prop[9]& prop[8]&carry_gen[7])|
				(prop[17]&prop[16]&prop[15]&prop[14]&prop[13]&prop[12]&prop[11]&prop[10]&prop[9]&prop[8]&prop[7]&carry_gen[6])|
				(prop[17]&prop[16]&prop[15]&prop[14]&prop[13]&prop[12]&prop[11]&prop[10]&prop[9]&prop[8]&prop[7])&prop[6]&carry_gen[5])|
				(prop[17]&prop[16]&prop[15]&prop[14]&prop[13]&prop[12]&prop[11]&prop[10]&prop[9]&prop[8]&prop[7]&prop[6]&prop[5]&carry_gen[4])|
				(prop[17]&prop[16]&prop[15]&prop[14]&prop[13]&prop[12]&prop[11]&prop[10]&prop[9]&prop[8]&prop[7]&prop[6]&prop[5]&prop[4]&carry_gen[3])|
				(prop[17]&prop[16]&prop[15]&prop[14]&prop[13]&prop[12]&prop[11]&prop[10]&prop[9]&prop[8]&prop[7]&prop[6]&prop[5]&prop[4]&prop[3]&carry_gen[2])|
				(prop[17]&prop[16]&prop[15]&prop[14]&prop[13]&prop[12]&prop[11]&prop[10]&prop[9]&prop[8]&prop[7]&prop[6]&prop[5]&prop[4]&prop[3]&prop[2]&carry_gen[1])|
				(prop[17]&prop[16]&prop[15]&prop[14]&prop[13]&prop[12]&prop[11]&prop[10]&prop[9]&prop[8]&prop[7]&prop[6]&prop[5]&prop[4]&prop[3]&prop[2]&prop[1]&carry_gen[0])|
				(prop[17]&prop[16]&prop[15]&prop[14]&(prop[13]&prop[12]&prop[11]&prop[10]&prop[9]&prop[8]&prop[7]&prop[6]&prop[5]&prop[4]&prop[3]&prop[2]&prop[1]&prop[0]&C0));
assign Cint[19]=((carry_gen[18])|
				(prop[18]&carry_gen[17])|
				(prop[18]&prop[17]&carry_gen[16])|
				(prop[18]&prop[17]&prop[16]&carry_gen[15])|
				(prop[18]&prop[17]&prop[16]&prop[15]&carry_gen[14])|
				(prop[18]&prop[17]&prop[16]&prop[15]&prop[14]&prop[13]&carry_gen[12])|
				(prop[18]&prop[17]&prop[16]&prop[15]&prop[14]&prop[13]&prop[12]&carry_gen[11])|
				(prop[18]&prop[17]&prop[16]&prop[15]&prop[14]&prop[13]&prop[12]&prop[11]&carry_gen[10])|
				(prop[18]&prop[17]&prop[16]&prop[15]&prop[14]&prop[13]&prop[12]&prop[11]&prop[10]&carry_gen[9])|
				(prop[18]&prop[17]&prop[16]&prop[15]&prop[14]&prop[13]&prop[12]&prop[11]&prop[10]&prop[9]&carry_gen[8])|
				(prop[18]&prop[17]&prop[16]&prop[15]&prop[14]&prop[13]&prop[12]&prop[11]&prop[10]&prop[9]& prop[8]&carry_gen[7])|
				(prop[18]&prop[17]&prop[16]&prop[15]&prop[14]&prop[13]&prop[12]&prop[11]&prop[10]&prop[9]&prop[8]&prop[7]&carry_gen[6])|
				(prop[18]&prop[17]&prop[16]&prop[15]&prop[14]&prop[13]&prop[12]&prop[11]&prop[10]&prop[9]&prop[8]&prop[7])&prop[6]&carry_gen[5])|
				(prop[18]&prop[17]&prop[16]&prop[15]&prop[14]&prop[13]&prop[12]&prop[11]&prop[10]&prop[9]&prop[8]&prop[7]&prop[6]&prop[5]&carry_gen[4])|
				(prop[18]&prop[17]&prop[16]&prop[15]&prop[14]&prop[13]&prop[12]&prop[11]&prop[10]&prop[9]&prop[8]&prop[7]&prop[6]&prop[5]&prop[4]&carry_gen[3])|
				(prop[18]&prop[17]&prop[16]&prop[15]&prop[14]&prop[13]&prop[12]&prop[11]&prop[10]&prop[9]&prop[8]&prop[7]&prop[6]&prop[5]&prop[4]&prop[3]&carry_gen[2])|
				(prop[18]&prop[17]&prop[16]&prop[15]&prop[14]&prop[13]&prop[12]&prop[11]&prop[10]&prop[9]&prop[8]&prop[7]&prop[6]&prop[5]&prop[4]&prop[3]&prop[2]&carry_gen[1])|
				(prop[18]&prop[17]&prop[16]&prop[15]&prop[14]&prop[13]&prop[12]&prop[11]&prop[10]&prop[9]&prop[8]&prop[7]&prop[6]&prop[5]&prop[4]&prop[3]&prop[2]&prop[1]&carry_gen[0])|
				(prop[18]&prop[17]&prop[16]&prop[15]&prop[14]&(prop[13]&prop[12]&prop[11]&prop[10]&prop[9]&prop[8]&prop[7]&prop[6]&prop[5]&prop[4]&prop[3]&prop[2]&prop[1]&prop[0]&C0));

assign Cint[20]=((carry_gen[19])|
				(prop[19]&carry_gen[18])|
				(prop[19]&prop[18]&carry_gen[17])|
				(prop[19]&prop[18]&prop[17]&carry_gen[16])|
				(prop[19]&prop[18]&prop[17]&prop[16]&carry_gen[15])|
				(prop[19]&prop[18]&prop[17]&prop[16]&prop[15]&carry_gen[14])|
				(prop[19]&prop[18]&prop[17]&prop[16]&prop[15]&prop[14]&prop[13]&carry_gen[12])|
				(prop[19]&prop[18]&prop[17]&prop[16]&prop[15]&prop[14]&prop[13]&prop[12]&carry_gen[11])|
				(prop[19]&prop[18]&prop[17]&prop[16]&prop[15]&prop[14]&prop[13]&prop[12]&prop[11]&carry_gen[10])|
				(prop[19]&prop[18]&prop[17]&prop[16]&prop[15]&prop[14]&prop[13]&prop[12]&prop[11]&prop[10]&carry_gen[9])|
				(prop[19]&prop[18]&prop[17]&prop[16]&prop[15]&prop[14]&prop[13]&prop[12]&prop[11]&prop[10]&prop[9]&carry_gen[8])|
				(prop[19]&prop[18]&prop[17]&prop[16]&prop[15]&prop[14]&prop[13]&prop[12]&prop[11]&prop[10]&prop[9]& prop[8]&carry_gen[7])|
				(prop[19]&prop[18]&prop[17]&prop[16]&prop[15]&prop[14]&prop[13]&prop[12]&prop[11]&prop[10]&prop[9]&prop[8]&prop[7]&carry_gen[6])|
				(prop[19]&prop[18]&prop[17]&prop[16]&prop[15]&prop[14]&prop[13]&prop[12]&prop[11]&prop[10]&prop[9]&prop[8]&prop[7])&prop[6]&carry_gen[5])|
				(prop[19]&prop[18]&prop[17]&prop[16]&prop[15]&prop[14]&prop[13]&prop[12]&prop[11]&prop[10]&prop[9]&prop[8]&prop[7]&prop[6]&prop[5]&carry_gen[4])|
				(prop[19]&prop[18]&prop[17]&prop[16]&prop[15]&prop[14]&prop[13]&prop[12]&prop[11]&prop[10]&prop[9]&prop[8]&prop[7]&prop[6]&prop[5]&prop[4]&carry_gen[3])|
				(prop[19]&prop[18]&prop[17]&prop[16]&prop[15]&prop[14]&prop[13]&prop[12]&prop[11]&prop[10]&prop[9]&prop[8]&prop[7]&prop[6]&prop[5]&prop[4]&prop[3]&carry_gen[2])|
				(prop[19]&prop[18]&prop[17]&prop[16]&prop[15]&prop[14]&prop[13]&prop[12]&prop[11]&prop[10]&prop[9]&prop[8]&prop[7]&prop[6]&prop[5]&prop[4]&prop[3]&prop[2]&carry_gen[1])|
				(prop[19]&prop[18]&prop[17]&prop[16]&prop[15]&prop[14]&prop[13]&prop[12]&prop[11]&prop[10]&prop[9]&prop[8]&prop[7]&prop[6]&prop[5]&prop[4]&prop[3]&prop[2]&prop[1]&carry_gen[0])|
				(prop[19]&prop[18]&prop[17]&prop[16]&prop[15]&prop[14]&(prop[13]&prop[12]&prop[11]&prop[10]&prop[9]&prop[8]&prop[7]&prop[6]&prop[5]&prop[4]&prop[3]&prop[2]&prop[1]&prop[0]&C0));

assign Cint[21]=((carry_gen[20])|
				(prop[20]&carry_gen[19])|
				(prop[20]&prop[19]&carry_gen[18])|
				(prop[20]&prop[19]&prop[18]&carry_gen[17])|
				(prop[20]&prop[19]&prop[18]&prop[17]&carry_gen[16])|
				(prop[20]&prop[19]&prop[18]&prop[17]&prop[16]&carry_gen[15])|
				(prop[20]&prop[19]&prop[18]&prop[17]&prop[16]&prop[15]&carry_gen[14])|
				(prop[20]&prop[19]&prop[18]&prop[17]&prop[16]&prop[15]&prop[14]&prop[13]&carry_gen[12])|
				(prop[20]&prop[19]&prop[18]&prop[17]&prop[16]&prop[15]&prop[14]&prop[13]&prop[12]&carry_gen[11])|
				(prop[20]&prop[19]&prop[18]&prop[17]&prop[16]&prop[15]&prop[14]&prop[13]&prop[12]&prop[11]&carry_gen[10])|
				(prop[20]&prop[19]&prop[18]&prop[17]&prop[16]&prop[15]&prop[14]&prop[13]&prop[12]&prop[11]&prop[10]&carry_gen[9])|
				(prop[20]&prop[19]&prop[18]&prop[17]&prop[16]&prop[15]&prop[14]&prop[13]&prop[12]&prop[11]&prop[10]&prop[9]&carry_gen[8])|
				(prop[20]&prop[19]&prop[18]&prop[17]&prop[16]&prop[15]&prop[14]&prop[13]&prop[12]&prop[11]&prop[10]&prop[9]& prop[8]&carry_gen[7])|
				(prop[20]&prop[19]&prop[18]&prop[17]&prop[16]&prop[15]&prop[14]&prop[13]&prop[12]&prop[11]&prop[10]&prop[9]&prop[8]&prop[7]&carry_gen[6])|
				(prop[20]&prop[19]&prop[18]&prop[17]&prop[16]&prop[15]&prop[14]&prop[13]&prop[12]&prop[11]&prop[10]&prop[9]&prop[8]&prop[7])&prop[6]&carry_gen[5])|
				(prop[20]&prop[19]&prop[18]&prop[17]&prop[16]&prop[15]&prop[14]&prop[13]&prop[12]&prop[11]&prop[10]&prop[9]&prop[8]&prop[7]&prop[6]&prop[5]&carry_gen[4])|
				(prop[20]&prop[19]&prop[18]&prop[17]&prop[16]&prop[15]&prop[14]&prop[13]&prop[12]&prop[11]&prop[10]&prop[9]&prop[8]&prop[7]&prop[6]&prop[5]&prop[4]&carry_gen[3])|
				(prop[20]&prop[19]&prop[18]&prop[17]&prop[16]&prop[15]&prop[14]&prop[13]&prop[12]&prop[11]&prop[10]&prop[9]&prop[8]&prop[7]&prop[6]&prop[5]&prop[4]&prop[3]&carry_gen[2])|
				(prop[20]&prop[19]&prop[18]&prop[17]&prop[16]&prop[15]&prop[14]&prop[13]&prop[12]&prop[11]&prop[10]&prop[9]&prop[8]&prop[7]&prop[6]&prop[5]&prop[4]&prop[3]&prop[2]&carry_gen[1])|
				(prop[20]&prop[19]&prop[18]&prop[17]&prop[16]&prop[15]&prop[14]&prop[13]&prop[12]&prop[11]&prop[10]&prop[9]&prop[8]&prop[7]&prop[6]&prop[5]&prop[4]&prop[3]&prop[2]&prop[1]&carry_gen[0])|
				(prop[20]&prop[19]&prop[18]&prop[17]&prop[16]&prop[15]&prop[14]&(prop[13]&prop[12]&prop[11]&prop[10]&prop[9]&prop[8]&prop[7]&prop[6]&prop[5]&prop[4]&prop[3]&prop[2]&prop[1]&prop[0]&C0));

assign Cint[22]=((carry_gen[21])|
				(prop[21]&carry_gen[20])|
				(prop[21]&prop[20]&carry_gen[19])|
				(prop[21]&prop[20]&prop[19]&carry_gen[18])|
				(prop[21]&prop[20]&prop[19]&prop[18]&carry_gen[17])|
				(prop[21]&prop[20]&prop[19]&prop[18]&prop[17]&carry_gen[16])|
				(prop[21]&prop[20]&prop[19]&prop[18]&prop[17]&prop[16]&carry_gen[15])|
				(prop[21]&prop[20]&prop[19]&prop[18]&prop[17]&prop[16]&prop[15]&carry_gen[14])|
				(prop[21]&prop[20]&prop[19]&prop[18]&prop[17]&prop[16]&prop[15]&prop[14]&prop[13]&carry_gen[12])|
				(prop[21]&prop[20]&prop[19]&prop[18]&prop[17]&prop[16]&prop[15]&prop[14]&prop[13]&prop[12]&carry_gen[11])|
				(prop[21]&prop[20]&prop[19]&prop[18]&prop[17]&prop[16]&prop[15]&prop[14]&prop[13]&prop[12]&prop[11]&carry_gen[10])|
				(prop[21]&prop[20]&prop[19]&prop[18]&prop[17]&prop[16]&prop[15]&prop[14]&prop[13]&prop[12]&prop[11]&prop[10]&carry_gen[9])|
				(prop[21]&prop[20]&prop[19]&prop[18]&prop[17]&prop[16]&prop[15]&prop[14]&prop[13]&prop[12]&prop[11]&prop[10]&prop[9]&carry_gen[8])|
				(prop[21]&prop[20]&prop[19]&prop[18]&prop[17]&prop[16]&prop[15]&prop[14]&prop[13]&prop[12]&prop[11]&prop[10]&prop[9]& prop[8]&carry_gen[7])|
				(&prop[21]&prop[20]&prop[19]&prop[18]&prop[17]&prop[16]&prop[15]&prop[14]&prop[13]&prop[12]&prop[11]&prop[10]&prop[9]&prop[8]&prop[7]&carry_gen[6])|
				(prop[21]&prop[20]&prop[19]&prop[18]&prop[17]&prop[16]&prop[15]&prop[14]&prop[13]&prop[12]&prop[11]&prop[10]&prop[9]&prop[8]&prop[7])&prop[6]&carry_gen[5])|
				(prop[21]&prop[20]&prop[19]&prop[18]&prop[17]&prop[16]&prop[15]&prop[14]&prop[13]&prop[12]&prop[11]&prop[10]&prop[9]&prop[8]&prop[7]&prop[6]&prop[5]&carry_gen[4])|
				(prop[21]&prop[20]&prop[19]&prop[18]&prop[17]&prop[16]&prop[15]&prop[14]&prop[13]&prop[12]&prop[11]&prop[10]&prop[9]&prop[8]&prop[7]&prop[6]&prop[5]&prop[4]&carry_gen[3])|
				(prop[21]&prop[20]&prop[19]&prop[18]&prop[17]&prop[16]&prop[15]&prop[14]&prop[13]&prop[12]&prop[11]&prop[10]&prop[9]&prop[8]&prop[7]&prop[6]&prop[5]&prop[4]&prop[3]&carry_gen[2])|
				(prop[21]&prop[20]&prop[19]&prop[18]&prop[17]&prop[16]&prop[15]&prop[14]&prop[13]&prop[12]&prop[11]&prop[10]&prop[9]&prop[8]&prop[7]&prop[6]&prop[5]&prop[4]&prop[3]&prop[2]&carry_gen[1])|
				(prop[21]&prop[20]&prop[19]&prop[18]&prop[17]&prop[16]&prop[15]&prop[14]&prop[13]&prop[12]&prop[11]&prop[10]&prop[9]&prop[8]&prop[7]&prop[6]&prop[5]&prop[4]&prop[3]&prop[2]&prop[1]&carry_gen[0])|
				(prop[21]&prop[20]&prop[19]&prop[18]&prop[17]&prop[16]&prop[15]&prop[14]&(prop[13]&prop[12]&prop[11]&prop[10]&prop[9]&prop[8]&prop[7]&prop[6]&prop[5]&prop[4]&prop[3]&prop[2]&prop[1]&prop[0]&C0));

assign Cint[23]=((carry_gen[22])|
				(prop[22]&carry_gen[21])|
				(prop[22]&prop[21]&carry_gen[20])|
				(prop[22]&prop[21]&prop[20]&carry_gen[19])|
				(prop[22]&prop[21]&prop[20]&prop[19]&carry_gen[18])|
				(prop[22]&prop[21]&prop[20]&prop[19]&prop[18]&carry_gen[17])|
				(prop[22]&prop[21]&prop[20]&prop[19]&prop[18]&prop[17]&carry_gen[16])|
				(prop[22]&prop[21]&prop[20]&prop[19]&prop[18]&prop[17]&prop[16]&carry_gen[15])|
				(prop[22]&prop[21]&prop[20]&prop[19]&prop[18]&prop[17]&prop[16]&prop[15]&carry_gen[14])|
				(prop[22]&prop[21]&prop[20]&prop[19]&prop[18]&prop[17]&prop[16]&prop[15]&prop[14]&prop[13]&carry_gen[12])|
				(prop[22]&prop[21]&prop[20]&prop[19]&prop[18]&prop[17]&prop[16]&prop[15]&prop[14]&prop[13]&prop[12]&carry_gen[11])|
				(prop[22]&prop[21]&prop[20]&prop[19]&prop[18]&prop[17]&prop[16]&prop[15]&prop[14]&prop[13]&prop[12]&prop[11]&carry_gen[10])|
				(prop[22]&prop[21]&prop[20]&prop[19]&prop[18]&prop[17]&prop[16]&prop[15]&prop[14]&prop[13]&prop[12]&prop[11]&prop[10]&carry_gen[9])|
				(prop[22]&prop[21]&prop[20]&prop[19]&prop[18]&prop[17]&prop[16]&prop[15]&prop[14]&prop[13]&prop[12]&prop[11]&prop[10]&prop[9]&carry_gen[8])|
				(prop[22]&prop[21]&prop[20]&prop[19]&prop[18]&prop[17]&prop[16]&prop[15]&prop[14]&prop[13]&prop[12]&prop[11]&prop[10]&prop[9]& prop[8]&carry_gen[7])|
				(prop[22]&prop[21]&prop[20]&prop[19]&prop[18]&prop[17]&prop[16]&prop[15]&prop[14]&prop[13]&prop[12]&prop[11]&prop[10]&prop[9]&prop[8]&prop[7]&carry_gen[6])|
				(prop[22]&prop[21]&prop[20]&prop[19]&prop[18]&prop[17]&prop[16]&prop[15]&prop[14]&prop[13]&prop[12]&prop[11]&prop[10]&prop[9]&prop[8]&prop[7])&prop[6]&carry_gen[5])|
				(prop[22]&prop[21]&prop[20]&prop[19]&prop[18]&prop[17]&prop[16]&prop[15]&prop[14]&prop[13]&prop[12]&prop[11]&prop[10]&prop[9]&prop[8]&prop[7]&prop[6]&prop[5]&carry_gen[4])|
				(prop[22]&prop[21]&prop[20]&prop[19]&prop[18]&prop[17]&prop[16]&prop[15]&prop[14]&prop[13]&prop[12]&prop[11]&prop[10]&prop[9]&prop[8]&prop[7]&prop[6]&prop[5]&prop[4]&carry_gen[3])|
				(prop[22]&prop[21]&prop[20]&prop[19]&prop[18]&prop[17]&prop[16]&prop[15]&prop[14]&prop[13]&prop[12]&prop[11]&prop[10]&prop[9]&prop[8]&prop[7]&prop[6]&prop[5]&prop[4]&prop[3]&carry_gen[2])|
				(prop[22]&prop[21]&prop[20]&prop[19]&prop[18]&prop[17]&prop[16]&prop[15]&prop[14]&prop[13]&prop[12]&prop[11]&prop[10]&prop[9]&prop[8]&prop[7]&prop[6]&prop[5]&prop[4]&prop[3]&prop[2]&carry_gen[1])|
				(prop[22]&prop[21]&prop[20]&prop[19]&prop[18]&prop[17]&prop[16]&prop[15]&prop[14]&prop[13]&prop[12]&prop[11]&prop[10]&prop[9]&prop[8]&prop[7]&prop[6]&prop[5]&prop[4]&prop[3]&prop[2]&prop[1]&carry_gen[0])|
				(prop[22]&prop[21]&prop[20]&prop[19]&prop[18]&prop[17]&prop[16]&prop[15]&prop[14]&(prop[13]&prop[12]&prop[11]&prop[10]&prop[9]&prop[8]&prop[7]&prop[6]&prop[5]&prop[4]&prop[3]&prop[2]&prop[1]&prop[0]&C0));

assign Cint[24]=((carry_gen[23])|
				(prop[23]&carry_gen[22])|
				(prop[23]&prop[22]&carry_gen[21])|
				(prop[23]&prop[22]&prop[21]&carry_gen[20])|
				(prop[23]&prop[22]&prop[21]&prop[20]&carry_gen[19])|
				(prop[23]&prop[22]&prop[21]&prop[20]&prop[19]&carry_gen[18])|
				(prop[23]&prop[22]&prop[21]&prop[20]&prop[19]&prop[18]&carry_gen[17])|
				(prop[23]&prop[22]&prop[21]&prop[20]&prop[19]&prop[18]&prop[17]&carry_gen[16])|
				(prop[23]&prop[22]&prop[21]&prop[20]&prop[19]&prop[18]&prop[17]&prop[16]&carry_gen[15])|
				(prop[23]&prop[22]&prop[21]&prop[20]&prop[19]&prop[18]&prop[17]&prop[16]&prop[15]&carry_gen[14])|
				(prop[23]&prop[22]&prop[21]&prop[20]&prop[19]&prop[18]&prop[17]&prop[16]&prop[15]&prop[14]&prop[13]&carry_gen[12])|
				(prop[23]&prop[22]&prop[21]&prop[20]&prop[19]&prop[18]&prop[17]&prop[16]&prop[15]&prop[14]&prop[13]&prop[12]&carry_gen[11])|
				(prop[23]&prop[22]&prop[21]&prop[20]&prop[19]&prop[18]&prop[17]&prop[16]&prop[15]&prop[14]&prop[13]&prop[12]&prop[11]&carry_gen[10])|
				(prop[23]&prop[22]&prop[21]&prop[20]&prop[19]&prop[18]&prop[17]&prop[16]&prop[15]&prop[14]&prop[13]&prop[12]&prop[11]&prop[10]&carry_gen[9])|
				(prop[23]&prop[22]&prop[21]&prop[20]&prop[19]&prop[18]&prop[17]&prop[16]&prop[15]&prop[14]&prop[13]&prop[12]&prop[11]&prop[10]&prop[9]&carry_gen[8])|
				(prop[23]&prop[22]&prop[21]&prop[20]&prop[19]&prop[18]&prop[17]&prop[16]&prop[15]&prop[14]&prop[13]&prop[12]&prop[11]&prop[10]&prop[9]& prop[8]&carry_gen[7])|
				(prop[23]&prop[22]&prop[21]&prop[20]&prop[19]&prop[18]&prop[17]&prop[16]&prop[15]&prop[14]&prop[13]&prop[12]&prop[11]&prop[10]&prop[9]&prop[8]&prop[7]&carry_gen[6])|
				(prop[23]&prop[22]&prop[21]&prop[20]&prop[19]&prop[18]&prop[17]&prop[16]&prop[15]&prop[14]&prop[13]&prop[12]&prop[11]&prop[10]&prop[9]&prop[8]&prop[7])&prop[6]&carry_gen[5])|
				(prop[23]&prop[22]&prop[21]&prop[20]&prop[19]&prop[18]&prop[17]&prop[16]&prop[15]&prop[14]&prop[13]&prop[12]&prop[11]&prop[10]&prop[9]&prop[8]&prop[7]&prop[6]&prop[5]&carry_gen[4])|
				(prop[23]&prop[22]&prop[21]&prop[20]&prop[19]&prop[18]&prop[17]&prop[16]&prop[15]&prop[14]&prop[13]&prop[12]&prop[11]&prop[10]&prop[9]&prop[8]&prop[7]&prop[6]&prop[5]&prop[4]&carry_gen[3])|
				(prop[23]&prop[22]&prop[21]&prop[20]&prop[19]&prop[18]&prop[17]&prop[16]&prop[15]&prop[14]&prop[13]&prop[12]&prop[11]&prop[10]&prop[9]&prop[8]&prop[7]&prop[6]&prop[5]&prop[4]&prop[3]&carry_gen[2])|
				(prop[23]&prop[22]&prop[21]&prop[20]&prop[19]&prop[18]&prop[17]&prop[16]&prop[15]&prop[14]&prop[13]&prop[12]&prop[11]&prop[10]&prop[9]&prop[8]&prop[7]&prop[6]&prop[5]&prop[4]&prop[3]&prop[2]&carry_gen[1])|
				(prop[23]&prop[22]&prop[21]&prop[20]&prop[19]&prop[18]&prop[17]&prop[16]&prop[15]&prop[14]&prop[13]&prop[12]&prop[11]&prop[10]&prop[9]&prop[8]&prop[7]&prop[6]&prop[5]&prop[4]&prop[3]&prop[2]&prop[1]&carry_gen[0])|
				(prop[23]&prop[22]&prop[21]&prop[20]&prop[19]&prop[18]&prop[17]&prop[16]&prop[15]&prop[14]&(prop[13]&prop[12]&prop[11]&prop[10]&prop[9]&prop[8]&prop[7]&prop[6]&prop[5]&prop[4]&prop[3]&prop[2]&prop[1]&prop[0]&C0));

assign Cint[25]=((carry_gen[24])|
				(prop[24]&carry_gen[23])|
				(prop[24]&prop[23]&carry_gen[22])|
				(prop[24]&prop[23]&prop[22]&carry_gen[21])|
				(prop[24]&prop[23]&prop[22]&prop[21]&carry_gen[20])|
				(prop[24]&prop[23]&prop[22]&prop[21]&prop[20]&carry_gen[19])|
				(prop[24]&prop[23]&prop[22]&prop[21]&prop[20]&prop[19]&carry_gen[18])|
				(prop[24]&prop[23]&prop[22]&prop[21]&prop[20]&prop[19]&prop[18]&carry_gen[17])|
				(prop[24]&prop[23]&prop[22]&prop[21]&prop[20]&prop[19]&prop[18]&prop[17]&carry_gen[16])|
				(prop[24]&prop[23]&prop[22]&prop[21]&prop[20]&prop[19]&prop[18]&prop[17]&prop[16]&carry_gen[15])|
				(prop[24]&prop[23]&prop[22]&prop[21]&prop[20]&prop[19]&prop[18]&prop[17]&prop[16]&prop[15]&carry_gen[14])|
				(prop[24]&prop[23]&prop[22]&prop[21]&prop[20]&prop[19]&prop[18]&prop[17]&prop[16]&prop[15]&prop[14]&prop[13]&carry_gen[12])|
				(prop[24]&prop[23]&prop[22]&prop[21]&prop[20]&prop[19]&prop[18]&prop[17]&prop[16]&prop[15]&prop[14]&prop[13]&prop[12]&carry_gen[11])|
				(prop[24]&prop[23]&prop[22]&prop[21]&prop[20]&prop[19]&prop[18]&prop[17]&prop[16]&prop[15]&prop[14]&prop[13]&prop[12]&prop[11]&carry_gen[10])|
				(prop[24]&prop[23]&prop[22]&prop[21]&prop[20]&prop[19]&prop[18]&prop[17]&prop[16]&prop[15]&prop[14]&prop[13]&prop[12]&prop[11]&prop[10]&carry_gen[9])|
				(prop[24]&prop[23]&prop[22]&prop[21]&prop[20]&prop[19]&prop[18]&prop[17]&prop[16]&prop[15]&prop[14]&prop[13]&prop[12]&prop[11]&prop[10]&prop[9]&carry_gen[8])|
				(prop[24]&prop[23]&prop[22]&prop[21]&prop[20]&prop[19]&prop[18]&prop[17]&prop[16]&prop[15]&prop[14]&prop[13]&prop[12]&prop[11]&prop[10]&prop[9]& prop[8]&carry_gen[7])|
				(prop[24]&prop[23]&prop[22]&prop[21]&prop[20]&prop[19]&prop[18]&prop[17]&prop[16]&prop[15]&prop[14]&prop[13]&prop[12]&prop[11]&prop[10]&prop[9]&prop[8]&prop[7]&carry_gen[6])|
				(prop[24]&prop[23]&prop[22]&prop[21]&prop[20]&prop[19]&prop[18]&prop[17]&prop[16]&prop[15]&prop[14]&prop[13]&prop[12]&prop[11]&prop[10]&prop[9]&prop[8]&prop[7])&prop[6]&carry_gen[5])|
				(prop[24]&prop[23]&prop[22]&prop[21]&prop[20]&prop[19]&prop[18]&prop[17]&prop[16]&prop[15]&prop[14]&prop[13]&prop[12]&prop[11]&prop[10]&prop[9]&prop[8]&prop[7]&prop[6]&prop[5]&carry_gen[4])|
				(prop[24]&prop[23]&prop[22]&prop[21]&prop[20]&prop[19]&prop[18]&prop[17]&prop[16]&prop[15]&prop[14]&prop[13]&prop[12]&prop[11]&prop[10]&prop[9]&prop[8]&prop[7]&prop[6]&prop[5]&prop[4]&carry_gen[3])|
				(prop[24]&prop[23]&prop[22]&prop[21]&prop[20]&prop[19]&prop[18]&prop[17]&prop[16]&prop[15]&prop[14]&prop[13]&prop[12]&prop[11]&prop[10]&prop[9]&prop[8]&prop[7]&prop[6]&prop[5]&prop[4]&prop[3]&carry_gen[2])|
				(prop[24]&prop[23]&prop[22]&prop[21]&prop[20]&prop[19]&prop[18]&prop[17]&prop[16]&prop[15]&prop[14]&prop[13]&prop[12]&prop[11]&prop[10]&prop[9]&prop[8]&prop[7]&prop[6]&prop[5]&prop[4]&prop[3]&prop[2]&carry_gen[1])|
				(prop[24]&prop[23]&prop[22]&prop[21]&prop[20]&prop[19]&prop[18]&prop[17]&prop[16]&prop[15]&prop[14]&prop[13]&prop[12]&prop[11]&prop[10]&prop[9]&prop[8]&prop[7]&prop[6]&prop[5]&prop[4]&prop[3]&prop[2]&prop[1]&carry_gen[0])|
				(prop[24]&prop[23]&prop[22]&prop[21]&prop[20]&prop[19]&prop[18]&prop[17]&prop[16]&prop[15]&prop[14]&(prop[13]&prop[12]&prop[11]&prop[10]&prop[9]&prop[8]&prop[7]&prop[6]&prop[5]&prop[4]&prop[3]&prop[2]&prop[1]&prop[0]&C0));

assign Cint[26]=((carry_gen[25])|
				(prop[25]&carry_gen[24])|
				(prop[25]&prop[24]&carry_gen[23])|
				(prop[25]&prop[24]&prop[23]&carry_gen[22])|
				(prop[25]&prop[24]&prop[23]&prop[22]&carry_gen[21])|
				(prop[25]&prop[24]&prop[23]&prop[22]&prop[21]&carry_gen[20])|
				(prop[25]&prop[24]&prop[23]&prop[22]&prop[21]&prop[20]&carry_gen[19])|
				(prop[25]&prop[24]&prop[23]&prop[22]&prop[21]&prop[20]&prop[19]&carry_gen[18])|
				(prop[25]&prop[24]&prop[23]&prop[22]&prop[21]&prop[20]&prop[19]&prop[18]&carry_gen[17])|	
				(prop[25]&prop[24]&prop[23]&prop[22]&prop[21]&prop[20]&prop[19]&prop[18]&prop[17]&carry_gen[16])|
				(prop[25]&prop[24]&prop[23]&prop[22]&prop[21]&prop[20]&prop[19]&prop[18]&prop[17]&prop[16]&carry_gen[15])|
				(prop[25]&prop[24]&prop[23]&prop[22]&prop[21]&prop[20]&prop[19]&prop[18]&prop[17]&prop[16]&prop[15]&carry_gen[14])|
				(prop[25]&prop[24]&prop[23]&prop[22]&prop[21]&prop[20]&prop[19]&prop[18]&prop[17]&prop[16]&prop[15]&prop[14]&carry_gen[13])|
				(prop[25]&prop[24]&prop[23]&prop[22]&prop[21]&prop[20]&prop[19]&prop[18]&prop[17]&prop[16]&prop[15]&prop[14]&prop[13]&carry_gen[12])|
				(prop[25]&prop[24]&prop[23]&prop[22]&prop[21]&prop[20]&prop[19]&prop[18]&prop[17]&prop[16]&prop[15]&prop[14]&prop[13]&prop[12]&carry_gen[11])|
				(prop[25]&prop[24]&prop[23]&prop[22]&prop[21]&prop[20]&prop[19]&prop[18]&prop[17]&prop[16]&prop[15]&prop[14]&prop[13]&prop[12]&prop[11]&carry_gen[10])|
				(prop[25]&prop[24]&prop[23]&prop[22]&prop[21]&prop[20]&prop[19]&prop[18]&prop[17]&prop[16]&prop[15]&prop[14]&prop[13]&prop[12]&prop[11]&prop[10]&carry_gen[9])|
				(prop[25]&prop[24]&prop[23]&prop[22]&prop[21]&prop[20]&prop[19]&prop[18]&prop[17]&prop[16]&prop[15]&prop[14]&prop[13]&prop[12]&prop[11]&prop[10]&prop[9]&carry_gen[8])|
				(prop[25]&prop[24]&prop[23]&prop[22]&prop[21]&prop[20]&prop[19]&prop[18]&prop[17]&prop[16]&prop[15]&prop[14]&prop[13]&prop[12]&prop[11]&prop[10]&prop[9]& prop[8]&carry_gen[7])|
				(prop[25]&prop[24]&prop[23]&prop[22]&prop[21]&prop[20]&prop[19]&prop[18]&prop[17]&prop[16]&prop[15]&prop[14]&prop[13]&prop[12]&prop[11]&prop[10]&prop[9]&prop[8]&prop[7]&carry_gen[6])|
				(prop[25]&prop[24]&prop[23]&prop[22]&prop[21]&prop[20]&prop[19]&prop[18]&prop[17]&prop[16]&prop[15]&prop[14]&prop[13]&prop[12]&prop[11]&prop[10]&prop[9]&prop[8]&prop[7])&prop[6]&carry_gen[5])|
				(prop[25]&prop[24]&prop[23]&prop[22]&prop[21]&prop[20]&prop[19]&prop[18]&prop[17]&prop[16]&prop[15]&prop[14]&prop[13]&prop[12]&prop[11]&prop[10]&prop[9]&prop[8]&prop[7]&prop[6]&prop[5]&carry_gen[4])|
				(prop[25]&prop[24]&prop[23]&prop[22]&prop[21]&prop[20]&prop[19]&prop[18]&prop[17]&prop[16]&prop[15]&prop[14]&prop[13]&prop[12]&prop[11]&prop[10]&prop[9]&prop[8]&prop[7]&prop[6]&prop[5]&prop[4]&carry_gen[3])|
				(prop[25]&prop[24]&prop[23]&prop[22]&prop[21]&prop[20]&prop[19]&prop[18]&prop[17]&prop[16]&prop[15]&prop[14]&prop[13]&prop[12]&prop[11]&prop[10]&prop[9]&prop[8]&prop[7]&prop[6]&prop[5]&prop[4]&prop[3]&carry_gen[2])|
				(prop[25]&prop[24]&prop[23]&prop[22]&prop[21]&prop[20]&prop[19]&prop[18]&prop[17]&prop[16]&prop[15]&prop[14]&prop[13]&prop[12]&prop[11]&prop[10]&prop[9]&prop[8]&prop[7]&prop[6]&prop[5]&prop[4]&prop[3]&prop[2]&carry_gen[1])|
				(prop[25]&prop[24]&prop[23]&prop[22]&prop[21]&prop[20]&prop[19]&prop[18]&prop[17]&prop[16]&prop[15]&prop[14]&prop[13]&prop[12]&prop[11]&prop[10]&prop[9]&prop[8]&prop[7]&prop[6]&prop[5]&prop[4]&prop[3]&prop[2]&prop[1]&carry_gen[0])|
				(prop[25]&prop[24]&prop[23]&prop[22]&prop[21]&prop[20]&prop[19]&prop[18]&prop[17]&prop[16]&prop[15]&prop[14]&(prop[13]&prop[12]&prop[11]&prop[10]&prop[9]&prop[8]&prop[7]&prop[6]&prop[5]&prop[4]&prop[3]&prop[2]&prop[1]&prop[0]&C0));

assign Cint[27]=((carry_gen[26])|
				(prop[26]&carry_gen[25])|
				(prop[26]&prop[25]&carry_gen[24])|
				(prop[26]&prop[25]&prop[24]&carry_gen[23])|
				(prop[26]&prop[25]&prop[24]&prop[23]&carry_gen[22])|
				(prop[26]&prop[25]&prop[24]&prop[23]&prop[22]&carry_gen[21])|
				(prop[26]&prop[25]&prop[24]&prop[23]&prop[22]&prop[21]&carry_gen[20])|
				(prop[26]&prop[25]&prop[24]&prop[23]&prop[22]&prop[21]&prop[20]&carry_gen[19])|
				(prop[26]&prop[25]&prop[24]&prop[23]&prop[22]&prop[21]&prop[20]&prop[19]&carry_gen[18])|
				(prop[26]&prop[25]&prop[24]&prop[23]&prop[22]&prop[21]&prop[20]&prop[19]&prop[18]&carry_gen[17])|	
				(prop[26]&prop[25]&prop[24]&prop[23]&prop[22]&prop[21]&prop[20]&prop[19]&prop[18]&prop[17]&carry_gen[16])|
				(prop[26]&prop[25]&prop[24]&prop[23]&prop[22]&prop[21]&prop[20]&prop[19]&prop[18]&prop[17]&prop[16]&carry_gen[15])|
				(prop[26]&prop[25]&prop[24]&prop[23]&prop[22]&prop[21]&prop[20]&prop[19]&prop[18]&prop[17]&prop[16]&prop[15]&carry_gen[14])|
				(prop[26]&prop[25]&prop[24]&prop[23]&prop[22]&prop[21]&prop[20]&prop[19]&prop[18]&prop[17]&prop[16]&prop[15]&prop[14]&carry_gen[13])|
				(prop[26]&prop[25]&prop[24]&prop[23]&prop[22]&prop[21]&prop[20]&prop[19]&prop[18]&prop[17]&prop[16]&prop[15]&prop[14]&prop[13]&carry_gen[12])|
				(prop[26]&prop[25]&prop[24]&prop[23]&prop[22]&prop[21]&prop[20]&prop[19]&prop[18]&prop[17]&prop[16]&prop[15]&prop[14]&prop[13]&prop[12]&carry_gen[11])|
				(prop[26]&prop[25]&prop[24]&prop[23]&prop[22]&prop[21]&prop[20]&prop[19]&prop[18]&prop[17]&prop[16]&prop[15]&prop[14]&prop[13]&prop[12]&prop[11]&carry_gen[10])|
				(prop[26]&prop[25]&prop[24]&prop[23]&prop[22]&prop[21]&prop[20]&prop[19]&prop[18]&prop[17]&prop[16]&prop[15]&prop[14]&prop[13]&prop[12]&prop[11]&prop[10]&carry_gen[9])|
				(prop[26]&prop[25]&prop[24]&prop[23]&prop[22]&prop[21]&prop[20]&prop[19]&prop[18]&prop[17]&prop[16]&prop[15]&prop[14]&prop[13]&prop[12]&prop[11]&prop[10]&prop[9]&carry_gen[8])|
				(prop[26]&prop[25]&prop[24]&prop[23]&prop[22]&prop[21]&prop[20]&prop[19]&prop[18]&prop[17]&prop[16]&prop[15]&prop[14]&prop[13]&prop[12]&prop[11]&prop[10]&prop[9]& prop[8]&carry_gen[7])|
				(prop[26]&prop[25]&prop[24]&prop[23]&prop[22]&prop[21]&prop[20]&prop[19]&prop[18]&prop[17]&prop[16]&prop[15]&prop[14]&prop[13]&prop[12]&prop[11]&prop[10]&prop[9]&prop[8]&prop[7]&carry_gen[6])|
				(prop[26]&prop[25]&prop[24]&prop[23]&prop[22]&prop[21]&prop[20]&prop[19]&prop[18]&prop[17]&prop[16]&prop[15]&prop[14]&prop[13]&prop[12]&prop[11]&prop[10]&prop[9]&prop[8]&prop[7])&prop[6]&carry_gen[5])|
				(prop[26]&prop[25]&prop[24]&prop[23]&prop[22]&prop[21]&prop[20]&prop[19]&prop[18]&prop[17]&prop[16]&prop[15]&prop[14]&prop[13]&prop[12]&prop[11]&prop[10]&prop[9]&prop[8]&prop[7]&prop[6]&prop[5]&carry_gen[4])|
				(prop[26]&prop[25]&prop[24]&prop[23]&prop[22]&prop[21]&prop[20]&prop[19]&prop[18]&prop[17]&prop[16]&prop[15]&prop[14]&prop[13]&prop[12]&prop[11]&prop[10]&prop[9]&prop[8]&prop[7]&prop[6]&prop[5]&prop[4]&carry_gen[3])|
				(prop[26]&prop[25]&prop[24]&prop[23]&prop[22]&prop[21]&prop[20]&prop[19]&prop[18]&prop[17]&prop[16]&prop[15]&prop[14]&prop[13]&prop[12]&prop[11]&prop[10]&prop[9]&prop[8]&prop[7]&prop[6]&prop[5]&prop[4]&prop[3]&carry_gen[2])|
				(prop[26]&prop[25]&prop[24]&prop[23]&prop[22]&prop[21]&prop[20]&prop[19]&prop[18]&prop[17]&prop[16]&prop[15]&prop[14]&prop[13]&prop[12]&prop[11]&prop[10]&prop[9]&prop[8]&prop[7]&prop[6]&prop[5]&prop[4]&prop[3]&prop[2]&carry_gen[1])|
				(prop[26]&prop[25]&prop[24]&prop[23]&prop[22]&prop[21]&prop[20]&prop[19]&prop[18]&prop[17]&prop[16]&prop[15]&prop[14]&prop[13]&prop[12]&prop[11]&prop[10]&prop[9]&prop[8]&prop[7]&prop[6]&prop[5]&prop[4]&prop[3]&prop[2]&prop[1]&carry_gen[0])|
				(prop[26]&prop[25]&prop[24]&prop[23]&prop[22]&prop[21]&prop[20]&prop[19]&prop[18]&prop[17]&prop[16]&prop[15]&prop[14]&(prop[13]&prop[12]&prop[11]&prop[10]&prop[9]&prop[8]&prop[7]&prop[6]&prop[5]&prop[4]&prop[3]&prop[2]&prop[1]&prop[0]&C0));

assign Cint[28]=((carry_gen[27])|
				(prop[27]&carry_gen[26])|
				(prop[27]&prop[26]&carry_gen[25])|
				(prop[27]&prop[27]&prop[26]&prop[25]&carry_gen[24])|
				(prop[27]&prop[26]&prop[25]&prop[24]&carry_gen[23])|
				(prop[27]&prop[26]&prop[25]&prop[24]&prop[23]&carry_gen[22])|
				(prop[27]&prop[26]&prop[25]&prop[24]&prop[23]&prop[22]&carry_gen[21])|
				(prop[27]&prop[26]&prop[25]&prop[24]&prop[23]&prop[22]&prop[21]&carry_gen[20])|
				(prop[27]&prop[26]&prop[25]&prop[24]&prop[23]&prop[22]&prop[21]&prop[20]&carry_gen[19])|
				(prop[27]&prop[26]&prop[25]&prop[24]&prop[23]&prop[22]&prop[21]&prop[20]&prop[19]&carry_gen[18])|
				(prop[27]&prop[26]&prop[25]&prop[24]&prop[23]&prop[22]&prop[21]&prop[20]&prop[19]&prop[18]&carry_gen[17])|	
				(prop[27]&prop[26]&prop[25]&prop[24]&prop[23]&prop[22]&prop[21]&prop[20]&prop[19]&prop[18]&prop[17]&carry_gen[16])|
				(prop[27]&prop[26]&prop[25]&prop[24]&prop[23]&prop[22]&prop[21]&prop[20]&prop[19]&prop[18]&prop[17]&prop[16]&carry_gen[15])|
				(prop[27]&prop[26]&prop[25]&prop[24]&prop[23]&prop[22]&prop[21]&prop[20]&prop[19]&prop[18]&prop[17]&prop[16]&prop[15]&carry_gen[14])|
				(prop[27]&prop[26]&prop[25]&prop[24]&prop[23]&prop[22]&prop[21]&prop[20]&prop[19]&prop[18]&prop[17]&prop[16]&prop[15]&prop[14]&carry_gen[13])|
				(prop[27]&prop[26]&prop[25]&prop[24]&prop[23]&prop[22]&prop[21]&prop[20]&prop[19]&prop[18]&prop[17]&prop[16]&prop[15]&prop[14]&prop[13]&carry_gen[12])|
				(prop[27]&prop[26]&prop[25]&prop[24]&prop[23]&prop[22]&prop[21]&prop[20]&prop[19]&prop[18]&prop[17]&prop[16]&prop[15]&prop[14]&prop[13]&prop[12]&carry_gen[11])|
				(prop[27]&prop[26]&prop[25]&prop[24]&prop[23]&prop[22]&prop[21]&prop[20]&prop[19]&prop[18]&prop[17]&prop[16]&prop[15]&prop[14]&prop[13]&prop[12]&prop[11]&carry_gen[10])|
				(prop[27]&prop[26]&prop[25]&prop[24]&prop[23]&prop[22]&prop[21]&prop[20]&prop[19]&prop[18]&prop[17]&prop[16]&prop[15]&prop[14]&prop[13]&prop[12]&prop[11]&prop[10]&carry_gen[9])|
				(prop[27]&prop[26]&prop[25]&prop[24]&prop[23]&prop[22]&prop[21]&prop[20]&prop[19]&prop[18]&prop[17]&prop[16]&prop[15]&prop[14]&prop[13]&prop[12]&prop[11]&prop[10]&prop[9]&carry_gen[8])|
				(prop[27]&prop[26]&prop[25]&prop[24]&prop[23]&prop[22]&prop[21]&prop[20]&prop[19]&prop[18]&prop[17]&prop[16]&prop[15]&prop[14]&prop[13]&prop[12]&prop[11]&prop[10]&prop[9]& prop[8]&carry_gen[7])|
				(prop[27]&prop[26]&prop[25]&prop[24]&prop[23]&prop[22]&prop[21]&prop[20]&prop[19]&prop[18]&prop[17]&prop[16]&prop[15]&prop[14]&prop[13]&prop[12]&prop[11]&prop[10]&prop[9]&prop[8]&prop[7]&carry_gen[6])|
				(prop[27]&prop[26]&prop[25]&prop[24]&prop[23]&prop[22]&prop[21]&prop[20]&prop[19]&prop[18]&prop[17]&prop[16]&prop[15]&prop[14]&prop[13]&prop[12]&prop[11]&prop[10]&prop[9]&prop[8]&prop[7])&prop[6]&carry_gen[5])|
				(prop[27]&prop[26]&prop[25]&prop[24]&prop[23]&prop[22]&prop[21]&prop[20]&prop[19]&prop[18]&prop[17]&prop[16]&prop[15]&prop[14]&prop[13]&prop[12]&prop[11]&prop[10]&prop[9]&prop[8]&prop[7]&prop[6]&prop[5]&carry_gen[4])|
				(prop[27]&prop[26]&prop[25]&prop[24]&prop[23]&prop[22]&prop[21]&prop[20]&prop[19]&prop[18]&prop[17]&prop[16]&prop[15]&prop[14]&prop[13]&prop[12]&prop[11]&prop[10]&prop[9]&prop[8]&prop[7]&prop[6]&prop[5]&prop[4]&carry_gen[3])|
				(prop[27]&prop[26]&prop[25]&prop[24]&prop[23]&prop[22]&prop[21]&prop[20]&prop[19]&prop[18]&prop[17]&prop[16]&prop[15]&prop[14]&prop[13]&prop[12]&prop[11]&prop[10]&prop[9]&prop[8]&prop[7]&prop[6]&prop[5]&prop[4]&prop[3]&carry_gen[2])|
				(prop[27]&prop[26]&prop[25]&prop[24]&prop[23]&prop[22]&prop[21]&prop[20]&prop[19]&prop[18]&prop[17]&prop[16]&prop[15]&prop[14]&prop[13]&prop[12]&prop[11]&prop[10]&prop[9]&prop[8]&prop[7]&prop[6]&prop[5]&prop[4]&prop[3]&prop[2]&carry_gen[1])|
				(prop[27]&prop[26]&prop[25]&prop[24]&prop[23]&prop[22]&prop[21]&prop[20]&prop[19]&prop[18]&prop[17]&prop[16]&prop[15]&prop[14]&prop[13]&prop[12]&prop[11]&prop[10]&prop[9]&prop[8]&prop[7]&prop[6]&prop[5]&prop[4]&prop[3]&prop[2]&prop[1]&carry_gen[0])|
				(prop[27]&prop[26]&prop[25]&prop[24]&prop[23]&prop[22]&prop[21]&prop[20]&prop[19]&prop[18]&prop[17]&prop[16]&prop[15]&prop[14]&(prop[13]&prop[12]&prop[11]&prop[10]&prop[9]&prop[8]&prop[7]&prop[6]&prop[5]&prop[4]&prop[3]&prop[2]&prop[1]&prop[0]&C0));

assign Cint[29]=((carry_gen[28])|
				(prop[28]&carry_gen[27])|
				(prop[28]&prop[27]&carry_gen[26])|
				(prop[28]&prop[27]&prop[26]&carry_gen[25])|
				(prop[28]&prop[27]&prop[26]&prop[25]&carry_gen[24])|
				(prop[28]&prop[27]&prop[26]&prop[25]&prop[24]&carry_gen[23])|
				(prop[28]&prop[27]&prop[26]&prop[25]&prop[24]&prop[23]&carry_gen[22])|
				(prop[28]&prop[27]&prop[26]&prop[25]&prop[24]&prop[23]&prop[22]&carry_gen[21])|
				(prop[28]&prop[27]&prop[26]&prop[25]&prop[24]&prop[23]&prop[22]&prop[21]&carry_gen[20])|
				(prop[28]&prop[27]&prop[26]&prop[25]&prop[24]&prop[23]&prop[22]&prop[21]&prop[20]&carry_gen[19])|
				(prop[28]&prop[27]&prop[26]&prop[25]&prop[24]&prop[23]&prop[22]&prop[21]&prop[20]&prop[19]&carry_gen[18])|
				(prop[28]&prop[27]&prop[26]&prop[25]&prop[24]&prop[23]&prop[22]&prop[21]&prop[20]&prop[19]&prop[18]&carry_gen[17])|	
				(prop[28]&prop[27]&prop[26]&prop[25]&prop[24]&prop[23]&prop[22]&prop[21]&prop[20]&prop[19]&prop[18]&prop[17]&carry_gen[16])|
				(prop[28]&prop[27]&prop[26]&prop[25]&prop[24]&prop[23]&prop[22]&prop[21]&prop[20]&prop[19]&prop[18]&prop[17]&prop[16]&carry_gen[15])|
				(prop[28]&prop[27]&prop[26]&prop[25]&prop[24]&prop[23]&prop[22]&prop[21]&prop[20]&prop[19]&prop[18]&prop[17]&prop[16]&prop[15]&carry_gen[14])|
				(prop[28]&prop[27]&prop[26]&prop[25]&prop[24]&prop[23]&prop[22]&prop[21]&prop[20]&prop[19]&prop[18]&prop[17]&prop[16]&prop[15]&prop[14]&carry_gen[13])|
				(prop[28]&prop[27]&prop[26]&prop[25]&prop[24]&prop[23]&prop[22]&prop[21]&prop[20]&prop[19]&prop[18]&prop[17]&prop[16]&prop[15]&prop[14]&prop[13]&carry_gen[12])|
				(prop[28]&prop[27]&prop[26]&prop[25]&prop[24]&prop[23]&prop[22]&prop[21]&prop[20]&prop[19]&prop[18]&prop[17]&prop[16]&prop[15]&prop[14]&prop[13]&prop[12]&carry_gen[11])|
				(prop[28]&prop[27]&prop[26]&prop[25]&prop[24]&prop[23]&prop[22]&prop[21]&prop[20]&prop[19]&prop[18]&prop[17]&prop[16]&prop[15]&prop[14]&prop[13]&prop[12]&prop[11]&carry_gen[10])|
				(prop[28]&prop[27]&prop[26]&prop[25]&prop[24]&prop[23]&prop[22]&prop[21]&prop[20]&prop[19]&prop[18]&prop[17]&prop[16]&prop[15]&prop[14]&prop[13]&prop[12]&prop[11]&prop[10]&carry_gen[9])|
				(prop[28]&prop[27]&prop[26]&prop[25]&prop[24]&prop[23]&prop[22]&prop[21]&prop[20]&prop[19]&prop[18]&prop[17]&prop[16]&prop[15]&prop[14]&prop[13]&prop[12]&prop[11]&prop[10]&prop[9]&carry_gen[8])|
				(prop[28]&prop[27]&prop[26]&prop[25]&prop[24]&prop[23]&prop[22]&prop[21]&prop[20]&prop[19]&prop[18]&prop[17]&prop[16]&prop[15]&prop[14]&prop[13]&prop[12]&prop[11]&prop[10]&prop[9]& prop[8]&carry_gen[7])|
				(prop[28]&prop[27]&prop[26]&prop[25]&prop[24]&prop[23]&prop[22]&prop[21]&prop[20]&prop[19]&prop[18]&prop[17]&prop[16]&prop[15]&prop[14]&prop[13]&prop[12]&prop[11]&prop[10]&prop[9]&prop[8]&prop[7]&carry_gen[6])|
				(prop[28]&prop[27]&prop[26]&prop[25]&prop[24]&prop[23]&prop[22]&prop[21]&prop[20]&prop[19]&prop[18]&prop[17]&prop[16]&prop[15]&prop[14]&prop[13]&prop[12]&prop[11]&prop[10]&prop[9]&prop[8]&prop[7])&prop[6]&carry_gen[5])|
				(prop[28]&prop[27]&prop[26]&prop[25]&prop[24]&prop[23]&prop[22]&prop[21]&prop[20]&prop[19]&prop[18]&prop[17]&prop[16]&prop[15]&prop[14]&prop[13]&prop[12]&prop[11]&prop[10]&prop[9]&prop[8]&prop[7]&prop[6]&prop[5]&carry_gen[4])|
				(prop[28]&prop[27]&prop[26]&prop[25]&prop[24]&prop[23]&prop[22]&prop[21]&prop[20]&prop[19]&prop[18]&prop[17]&prop[16]&prop[15]&prop[14]&prop[13]&prop[12]&prop[11]&prop[10]&prop[9]&prop[8]&prop[7]&prop[6]&prop[5]&prop[4]&carry_gen[3])|
				(prop[28]&prop[27]&prop[26]&prop[25]&prop[24]&prop[23]&prop[22]&prop[21]&prop[20]&prop[19]&prop[18]&prop[17]&prop[16]&prop[15]&prop[14]&prop[13]&prop[12]&prop[11]&prop[10]&prop[9]&prop[8]&prop[7]&prop[6]&prop[5]&prop[4]&prop[3]&carry_gen[2])|
				(prop[28]&prop[27]&prop[26]&prop[25]&prop[24]&prop[23]&prop[22]&prop[21]&prop[20]&prop[19]&prop[18]&prop[17]&prop[16]&prop[15]&prop[14]&prop[13]&prop[12]&prop[11]&prop[10]&prop[9]&prop[8]&prop[7]&prop[6]&prop[5]&prop[4]&prop[3]&prop[2]&carry_gen[1])|
				(prop[28]&prop[27]&prop[26]&prop[25]&prop[24]&prop[23]&prop[22]&prop[21]&prop[20]&prop[19]&prop[18]&prop[17]&prop[16]&prop[15]&prop[14]&prop[13]&prop[12]&prop[11]&prop[10]&prop[9]&prop[8]&prop[7]&prop[6]&prop[5]&prop[4]&prop[3]&prop[2]&prop[1]&carry_gen[0])|
				(prop[28]&prop[27]&prop[26]&prop[25]&prop[24]&prop[23]&prop[22]&prop[21]&prop[20]&prop[19]&prop[18]&prop[17]&prop[16]&prop[15]&prop[14]&(prop[13]&prop[12]&prop[11]&prop[10]&prop[9]&prop[8]&prop[7]&prop[6]&prop[5]&prop[4]&prop[3]&prop[2]&prop[1]&prop[0]&C0));

assign Cint[30]=((carry_gen[29])|	
				(prop[29]&carry_gen[28])|
				(prop[29]&prop[28]&carry_gen[27])|
				(prop[29]&prop[28]&prop[27]&carry_gen[26])|
				(prop[29]&prop[28]&prop[27]&prop[26]&carry_gen[25])|
				(prop[29]&prop[28]&prop[27]&prop[26]&prop[25]&carry_gen[24])|
				(prop[29]&prop[28]&prop[27]&prop[26]&prop[25]&prop[24]&carry_gen[23])|
				(prop[29]&prop[28]&prop[27]&prop[26]&prop[25]&prop[24]&prop[23]&carry_gen[22])|
				(prop[29]&prop[28]&prop[27]&prop[26]&prop[25]&prop[24]&prop[23]&prop[22]&carry_gen[21])|
				(prop[29]&prop[28]&prop[27]&prop[26]&prop[25]&prop[24]&prop[23]&prop[22]&prop[21]&carry_gen[20])|
				(prop[29]&prop[28]&prop[27]&prop[26]&prop[25]&prop[24]&prop[23]&prop[22]&prop[21]&prop[20]&carry_gen[19])|
				(prop[29]&prop[28]&prop[27]&prop[26]&prop[25]&prop[24]&prop[23]&prop[22]&prop[21]&prop[20]&prop[19]&carry_gen[18])|
				(prop[29]&prop[28]&prop[27]&prop[26]&prop[25]&prop[24]&prop[23]&prop[22]&prop[21]&prop[20]&prop[19]&prop[18]&carry_gen[17])|	
				(prop[29]&prop[28]&prop[27]&prop[26]&prop[25]&prop[24]&prop[23]&prop[22]&prop[21]&prop[20]&prop[19]&prop[18]&prop[17]&carry_gen[16])|
				(prop[29]&prop[28]&prop[27]&prop[26]&prop[25]&prop[24]&prop[23]&prop[22]&prop[21]&prop[20]&prop[19]&prop[18]&prop[17]&prop[16]&carry_gen[15])|
				(prop[29]&prop[28]&prop[27]&prop[26]&prop[25]&prop[24]&prop[23]&prop[22]&prop[21]&prop[20]&prop[19]&prop[18]&prop[17]&prop[16]&prop[15]&carry_gen[14])|
				(prop[29]&prop[28]&prop[27]&prop[26]&prop[25]&prop[24]&prop[23]&prop[22]&prop[21]&prop[20]&prop[19]&prop[18]&prop[17]&prop[16]&prop[15]&prop[14]&carry_gen[13])|
				(prop[29]&prop[28]&prop[27]&prop[26]&prop[25]&prop[24]&prop[23]&prop[22]&prop[21]&prop[20]&prop[19]&prop[18]&prop[17]&prop[16]&prop[15]&prop[14]&prop[13]&carry_gen[12])|
				(prop[29]&prop[28]&prop[27]&prop[26]&prop[25]&prop[24]&prop[23]&prop[22]&prop[21]&prop[20]&prop[19]&prop[18]&prop[17]&prop[16]&prop[15]&prop[14]&prop[13]&prop[12]&carry_gen[11])|
				(prop[29]&prop[28]&prop[27]&prop[26]&prop[25]&prop[24]&prop[23]&prop[22]&prop[21]&prop[20]&prop[19]&prop[18]&prop[17]&prop[16]&prop[15]&prop[14]&prop[13]&prop[12]&prop[11]&carry_gen[10])|
				(prop[29]&prop[28]&prop[27]&prop[26]&prop[25]&prop[24]&prop[23]&prop[22]&prop[21]&prop[20]&prop[19]&prop[18]&prop[17]&prop[16]&prop[15]&prop[14]&prop[13]&prop[12]&prop[11]&prop[10]&carry_gen[9])|
				(prop[29]&prop[28]&prop[27]&prop[26]&prop[25]&prop[24]&prop[23]&prop[22]&prop[21]&prop[20]&prop[19]&prop[18]&prop[17]&prop[16]&prop[15]&prop[14]&prop[13]&prop[12]&prop[11]&prop[10]&prop[9]&carry_gen[8])|
				(prop[29]&prop[28]&prop[27]&prop[26]&prop[25]&prop[24]&prop[23]&prop[22]&prop[21]&prop[20]&prop[19]&prop[18]&prop[17]&prop[16]&prop[15]&prop[14]&prop[13]&prop[12]&prop[11]&prop[10]&prop[9]& prop[8]&carry_gen[7])|
				(prop[29]&prop[28]&prop[27]&prop[26]&prop[25]&prop[24]&prop[23]&prop[22]&prop[21]&prop[20]&prop[19]&prop[18]&prop[17]&prop[16]&prop[15]&prop[14]&prop[13]&prop[12]&prop[11]&prop[10]&prop[9]&prop[8]&prop[7]&carry_gen[6])|
				(prop[29]&prop[28]&prop[27]&prop[26]&prop[25]&prop[24]&prop[23]&prop[22]&prop[21]&prop[20]&prop[19]&prop[18]&prop[17]&prop[16]&prop[15]&prop[14]&prop[13]&prop[12]&prop[11]&prop[10]&prop[9]&prop[8]&prop[7])&prop[6]&carry_gen[5])|
				(prop[29]&prop[28]&prop[27]&prop[26]&prop[25]&prop[24]&prop[23]&prop[22]&prop[21]&prop[20]&prop[19]&prop[18]&prop[17]&prop[16]&prop[15]&prop[14]&prop[13]&prop[12]&prop[11]&prop[10]&prop[9]&prop[8]&prop[7]&prop[6]&prop[5]&carry_gen[4])|
				(prop[29]&prop[28]&prop[27]&prop[26]&prop[25]&prop[24]&prop[23]&prop[22]&prop[21]&prop[20]&prop[19]&prop[18]&prop[17]&prop[16]&prop[15]&prop[14]&prop[13]&prop[12]&prop[11]&prop[10]&prop[9]&prop[8]&prop[7]&prop[6]&prop[5]&prop[4]&carry_gen[3])|
				(prop[29]&prop[28]&prop[27]&prop[26]&prop[25]&prop[24]&prop[23]&prop[22]&prop[21]&prop[20]&prop[19]&prop[18]&prop[17]&prop[16]&prop[15]&prop[14]&prop[13]&prop[12]&prop[11]&prop[10]&prop[9]&prop[8]&prop[7]&prop[6]&prop[5]&prop[4]&prop[3]&carry_gen[2])|
				(prop[29]&prop[28]&prop[27]&prop[26]&prop[25]&prop[24]&prop[23]&prop[22]&prop[21]&prop[20]&prop[19]&prop[18]&prop[17]&prop[16]&prop[15]&prop[14]&prop[13]&prop[12]&prop[11]&prop[10]&prop[9]&prop[8]&prop[7]&prop[6]&prop[5]&prop[4]&prop[3]&prop[2]&carry_gen[1])|
				(prop[29]&prop[28]&prop[27]&prop[26]&prop[25]&prop[24]&prop[23]&prop[22]&prop[21]&prop[20]&prop[19]&prop[18]&prop[17]&prop[16]&prop[15]&prop[14]&prop[13]&prop[12]&prop[11]&prop[10]&prop[9]&prop[8]&prop[7]&prop[6]&prop[5]&prop[4]&prop[3]&prop[2]&prop[1]&carry_gen[0])|
				(prop[29]&prop[28]&prop[27]&prop[26]&prop[25]&prop[24]&prop[23]&prop[22]&prop[21]&prop[20]&prop[19]&prop[18]&prop[17]&prop[16]&prop[15]&prop[14]&(prop[13]&prop[12]&prop[11]&prop[10]&prop[9]&prop[8]&prop[7]&prop[6]&prop[5]&prop[4]&prop[3]&prop[2]&prop[1]&prop[0]&C0));

assign Cint[31]=((carry_gen[30])|
				(prop[30]&carry_gen[29])|
				(prop[30]&prop[29]&carry_gen[28])|
				(prop[30]&prop[29]&prop[28]&carry_gen[27])|
				(prop[30]&prop[29]&prop[28]&prop[27]&carry_gen[26])|
				(prop[30]&prop[29]&prop[28]&prop[27]&prop[26]&carry_gen[25])|
				(prop[30]&prop[29]&prop[28]&prop[27]&prop[26]&prop[25]&carry_gen[24])|
				(prop[30]&prop[29]&prop[28]&prop[27]&prop[26]&prop[25]&prop[24]&carry_gen[23])|
				(prop[30]&prop[29]&prop[28]&prop[27]&prop[26]&prop[25]&prop[24]&prop[23]&carry_gen[22])|
				(prop[30]&prop[29]&prop[28]&prop[27]&prop[26]&prop[25]&prop[24]&prop[23]&prop[22]&carry_gen[21])|
				(prop[30]&prop[29]&prop[28]&prop[27]&prop[26]&prop[25]&prop[24]&prop[23]&prop[22]&prop[21]&carry_gen[20])|
				(prop[30]&prop[29]&prop[28]&prop[27]&prop[26]&prop[25]&prop[24]&prop[23]&prop[22]&prop[21]&prop[20]&carry_gen[19])|
				(prop[30]&prop[29]&prop[28]&prop[27]&prop[26]&prop[25]&prop[24]&prop[23]&prop[22]&prop[21]&prop[20]&prop[19]&carry_gen[18])|
				(prop[30]&prop[29]&prop[28]&prop[27]&prop[26]&prop[25]&prop[24]&prop[23]&prop[22]&prop[21]&prop[20]&prop[19]&prop[18]&carry_gen[17])|	
				(prop[30]&prop[29]&prop[28]&prop[27]&prop[26]&prop[25]&prop[24]&prop[23]&prop[22]&prop[21]&prop[20]&prop[19]&prop[18]&prop[17]&carry_gen[16])|
				(prop[30]&prop[29]&prop[28]&prop[27]&prop[26]&prop[25]&prop[24]&prop[23]&prop[22]&prop[21]&prop[20]&prop[19]&prop[18]&prop[17]&prop[16]&carry_gen[15])|
				(prop[30]&prop[29]&prop[28]&prop[27]&prop[26]&prop[25]&prop[24]&prop[23]&prop[22]&prop[21]&prop[20]&prop[19]&prop[18]&prop[17]&prop[16]&prop[15]&carry_gen[14])|
				(prop[30]&prop[29]&prop[28]&prop[27]&prop[26]&prop[25]&prop[24]&prop[23]&prop[22]&prop[21]&prop[20]&prop[19]&prop[18]&prop[17]&prop[16]&prop[15]&prop[14]&carry_gen[13])|
				(prop[30]&prop[29]&prop[28]&prop[27]&prop[26]&prop[25]&prop[24]&prop[23]&prop[22]&prop[21]&prop[20]&prop[19]&prop[18]&prop[17]&prop[16]&prop[15]&prop[14]&prop[13]&carry_gen[12])|
				(prop[30]&prop[29]&prop[28]&prop[27]&prop[26]&prop[25]&prop[24]&prop[23]&prop[22]&prop[21]&prop[20]&prop[19]&prop[18]&prop[17]&prop[16]&prop[15]&prop[14]&prop[13]&prop[12]&carry_gen[11])|
				(prop[30]&prop[29]&prop[28]&prop[27]&prop[26]&prop[25]&prop[24]&prop[23]&prop[22]&prop[21]&prop[20]&prop[19]&prop[18]&prop[17]&prop[16]&prop[15]&prop[14]&prop[13]&prop[12]&prop[11]&carry_gen[10])|
				(prop[30]&prop[29]&prop[28]&prop[27]&prop[26]&prop[25]&prop[24]&prop[23]&prop[22]&prop[21]&prop[20]&prop[19]&prop[18]&prop[17]&prop[16]&prop[15]&prop[14]&prop[13]&prop[12]&prop[11]&prop[10]&carry_gen[9])|
				(prop[30]&prop[29]&prop[28]&prop[27]&prop[26]&prop[25]&prop[24]&prop[23]&prop[22]&prop[21]&prop[20]&prop[19]&prop[18]&prop[17]&prop[16]&prop[15]&prop[14]&prop[13]&prop[12]&prop[11]&prop[10]&prop[9]&carry_gen[8])|
				(prop[30]&prop[29]&prop[28]&prop[27]&prop[26]&prop[25]&prop[24]&prop[23]&prop[22]&prop[21]&prop[20]&prop[19]&prop[18]&prop[17]&prop[16]&prop[15]&prop[14]&prop[13]&prop[12]&prop[11]&prop[10]&prop[9]& prop[8]&carry_gen[7])|
				(prop[30]&prop[29]&prop[28]&prop[27]&prop[26]&prop[25]&prop[24]&prop[23]&prop[22]&prop[21]&prop[20]&prop[19]&prop[18]&prop[17]&prop[16]&prop[15]&prop[14]&prop[13]&prop[12]&prop[11]&prop[10]&prop[9]&prop[8]&prop[7]&carry_gen[6])|
				(prop[30]&prop[29]&prop[28]&prop[27]&prop[26]&prop[25]&prop[24]&prop[23]&prop[22]&prop[21]&prop[20]&prop[19]&prop[18]&prop[17]&prop[16]&prop[15]&prop[14]&prop[13]&prop[12]&prop[11]&prop[10]&prop[9]&prop[8]&prop[7])&prop[6]&carry_gen[5])|
				(prop[30]&prop[29]&prop[28]&prop[27]&prop[26]&prop[25]&prop[24]&prop[23]&prop[22]&prop[21]&prop[20]&prop[19]&prop[18]&prop[17]&prop[16]&prop[15]&prop[14]&prop[13]&prop[12]&prop[11]&prop[10]&prop[9]&prop[8]&prop[7]&prop[6]&prop[5]&carry_gen[4])|
				(prop[30]&prop[29]&prop[28]&prop[27]&prop[26]&prop[25]&prop[24]&prop[23]&prop[22]&prop[21]&prop[20]&prop[19]&prop[18]&prop[17]&prop[16]&prop[15]&prop[14]&prop[13]&prop[12]&prop[11]&prop[10]&prop[9]&prop[8]&prop[7]&prop[6]&prop[5]&prop[4]&carry_gen[3])|
				(prop[30]&prop[29]&prop[28]&prop[27]&prop[26]&prop[25]&prop[24]&prop[23]&prop[22]&prop[21]&prop[20]&prop[19]&prop[18]&prop[17]&prop[16]&prop[15]&prop[14]&prop[13]&prop[12]&prop[11]&prop[10]&prop[9]&prop[8]&prop[7]&prop[6]&prop[5]&prop[4]&prop[3]&carry_gen[2])|
				(prop[30]&prop[29]&prop[28]&prop[27]&prop[26]&prop[25]&prop[24]&prop[23]&prop[22]&prop[21]&prop[20]&prop[19]&prop[18]&prop[17]&prop[16]&prop[15]&prop[14]&prop[13]&prop[12]&prop[11]&prop[10]&prop[9]&prop[8]&prop[7]&prop[6]&prop[5]&prop[4]&prop[3]&prop[2]&carry_gen[1])|
				(prop[30]&prop[29]&prop[28]&prop[27]&prop[26]&prop[25]&prop[24]&prop[23]&prop[22]&prop[21]&prop[20]&prop[19]&prop[18]&prop[17]&prop[16]&prop[15]&prop[14]&prop[13]&prop[12]&prop[11]&prop[10]&prop[9]&prop[8]&prop[7]&prop[6]&prop[5]&prop[4]&prop[3]&prop[2]&prop[1]&carry_gen[0])|
				(prop[30]&prop[29]&prop[28]&prop[27]&prop[26]&prop[25]&prop[24]&prop[23]&prop[22]&prop[21]&prop[20]&prop[19]&prop[18]&prop[17]&prop[16]&prop[15]&prop[14]&(prop[13]&prop[12]&prop[11]&prop[10]&prop[9]&prop[8]&prop[7]&prop[6]&prop[5]&prop[4]&prop[3]&prop[2]&prop[1]&prop[0]&C0));

assign Cint[32]=((carry_gen[31])|
				(prop[31]&carry_gen[30])|
				(prop[31]&prop[30]&carry_gen[29])|
				(prop[31]&prop[30]&prop[29]&carry_gen[28])|
				(prop[31]&prop[30]&prop[29]&prop[28]&carry_gen[27])|
				(prop[31]&prop[30]&prop[29]&prop[28]&prop[27]&carry_gen[26])|
				(prop[31]&prop[30]&prop[29]&prop[28]&prop[27]&prop[26]&carry_gen[25])|
				(prop[31]&prop[30]&prop[29]&prop[28]&prop[27]&prop[26]&prop[25]&carry_gen[24])|
				(prop[31]&prop[30]&prop[29]&prop[28]&prop[27]&prop[26]&prop[25]&prop[24]&carry_gen[23])|
				(prop[31]&prop[30]&prop[29]&prop[28]&prop[27]&prop[26]&prop[25]&prop[24]&prop[23]&carry_gen[22])|
				(prop[31]&prop[30]&prop[29]&prop[28]&prop[27]&prop[26]&prop[25]&prop[24]&prop[23]&prop[22]&carry_gen[21])|
				(prop[31]&prop[30]&prop[29]&prop[28]&prop[27]&prop[26]&prop[25]&prop[24]&prop[23]&prop[22]&prop[21]&carry_gen[20])|
				(prop[31]&prop[30]&prop[29]&prop[28]&prop[27]&prop[26]&prop[25]&prop[24]&prop[23]&prop[22]&prop[21]&prop[20]&carry_gen[19])|
				(prop[31]&prop[30]&prop[29]&prop[28]&prop[27]&prop[26]&prop[25]&prop[24]&prop[23]&prop[22]&prop[21]&prop[20]&prop[19]&carry_gen[18])|
				(prop[31]&prop[30]&prop[29]&prop[28]&prop[27]&prop[26]&prop[25]&prop[24]&prop[23]&prop[22]&prop[21]&prop[20]&prop[19]&prop[18]&carry_gen[17])|	
				(prop[31]&prop[30]&prop[29]&prop[28]&prop[27]&prop[26]&prop[25]&prop[24]&prop[23]&prop[22]&prop[21]&prop[20]&prop[19]&prop[18]&prop[17]&carry_gen[16])|
				(prop[31]&prop[30]&prop[29]&prop[28]&prop[27]&prop[26]&prop[25]&prop[24]&prop[23]&prop[22]&prop[21]&prop[20]&prop[19]&prop[18]&prop[17]&prop[16]&carry_gen[15])|
				(prop[31]&prop[30]&prop[29]&prop[28]&prop[27]&prop[26]&prop[25]&prop[24]&prop[23]&prop[22]&prop[21]&prop[20]&prop[19]&prop[18]&prop[17]&prop[16]&prop[15]&carry_gen[14])|
				(prop[31]&prop[30]&prop[29]&prop[28]&prop[27]&prop[26]&prop[25]&prop[24]&prop[23]&prop[22]&prop[21]&prop[20]&prop[19]&prop[18]&prop[17]&prop[16]&prop[15]&prop[14]&carry_gen[13])|
				(prop[31]&prop[30]&prop[29]&prop[28]&prop[27]&prop[26]&prop[25]&prop[24]&prop[23]&prop[22]&prop[21]&prop[20]&prop[19]&prop[18]&prop[17]&prop[16]&prop[15]&prop[14]&prop[13]&carry_gen[12])|
				(prop[31]&prop[30]&prop[29]&prop[28]&prop[27]&prop[26]&prop[25]&prop[24]&prop[23]&prop[22]&prop[21]&prop[20]&prop[19]&prop[18]&prop[17]&prop[16]&prop[15]&prop[14]&prop[13]&prop[12]&carry_gen[11])|
				(prop[31]&prop[30]&prop[29]&prop[28]&prop[27]&prop[26]&prop[25]&prop[24]&prop[23]&prop[22]&prop[21]&prop[20]&prop[19]&prop[18]&prop[17]&prop[16]&prop[15]&prop[14]&prop[13]&prop[12]&prop[11]&carry_gen[10])|
				(prop[31]&prop[30]&prop[29]&prop[28]&prop[27]&prop[26]&prop[25]&prop[24]&prop[23]&prop[22]&prop[21]&prop[20]&prop[19]&prop[18]&prop[17]&prop[16]&prop[15]&prop[14]&prop[13]&prop[12]&prop[11]&prop[10]&carry_gen[9])|
				(prop[31]&prop[30]&prop[29]&prop[28]&prop[27]&prop[26]&prop[25]&prop[24]&prop[23]&prop[22]&prop[21]&prop[20]&prop[19]&prop[18]&prop[17]&prop[16]&prop[15]&prop[14]&prop[13]&prop[12]&prop[11]&prop[10]&prop[9]&carry_gen[8])|
				(prop[31]&prop[30]&prop[29]&prop[28]&prop[27]&prop[26]&prop[25]&prop[24]&prop[23]&prop[22]&prop[21]&prop[20]&prop[19]&prop[18]&prop[17]&prop[16]&prop[15]&prop[14]&prop[13]&prop[12]&prop[11]&prop[10]&prop[9]& prop[8]&carry_gen[7])|
				(prop[31]&prop[30]&prop[29]&prop[28]&prop[27]&prop[26]&prop[25]&prop[24]&prop[23]&prop[22]&prop[21]&prop[20]&prop[19]&prop[18]&prop[17]&prop[16]&prop[15]&prop[14]&prop[13]&prop[12]&prop[11]&prop[10]&prop[9]&prop[8]&prop[7]&carry_gen[6])|
				(prop[31]&prop[30]&prop[29]&prop[28]&prop[27]&prop[26]&prop[25]&prop[24]&prop[23]&prop[22]&prop[21]&prop[20]&prop[19]&prop[18]&prop[17]&prop[16]&prop[15]&prop[14]&prop[13]&prop[12]&prop[11]&prop[10]&prop[9]&prop[8]&prop[7])&prop[6]&carry_gen[5])|
				(prop[31]&prop[30]&prop[29]&prop[28]&prop[27]&prop[26]&prop[25]&prop[24]&prop[23]&prop[22]&prop[21]&prop[20]&prop[19]&prop[18]&prop[17]&prop[16]&prop[15]&prop[14]&prop[13]&prop[12]&prop[11]&prop[10]&prop[9]&prop[8]&prop[7]&prop[6]&prop[5]&carry_gen[4])|
				(prop[31]&prop[30]&prop[29]&prop[28]&prop[27]&prop[26]&prop[25]&prop[24]&prop[23]&prop[22]&prop[21]&prop[20]&prop[19]&prop[18]&prop[17]&prop[16]&prop[15]&prop[14]&prop[13]&prop[12]&prop[11]&prop[10]&prop[9]&prop[8]&prop[7]&prop[6]&prop[5]&prop[4]&carry_gen[3])|
				(prop[31]&prop[30]&prop[29]&prop[28]&prop[27]&prop[26]&prop[25]&prop[24]&prop[23]&prop[22]&prop[21]&prop[20]&prop[19]&prop[18]&prop[17]&prop[16]&prop[15]&prop[14]&prop[13]&prop[12]&prop[11]&prop[10]&prop[9]&prop[8]&prop[7]&prop[6]&prop[5]&prop[4]&prop[3]&carry_gen[2])|
				(prop[31]&prop[30]&prop[29]&prop[28]&prop[27]&prop[26]&prop[25]&prop[24]&prop[23]&prop[22]&prop[21]&prop[20]&prop[19]&prop[18]&prop[17]&prop[16]&prop[15]&prop[14]&prop[13]&prop[12]&prop[11]&prop[10]&prop[9]&prop[8]&prop[7]&prop[6]&prop[5]&prop[4]&prop[3]&prop[2]&carry_gen[1])|
				(prop[31]&prop[30]&prop[29]&prop[28]&prop[27]&prop[26]&prop[25]&prop[24]&prop[23]&prop[22]&prop[21]&prop[20]&prop[19]&prop[18]&prop[17]&prop[16]&prop[15]&prop[14]&prop[13]&prop[12]&prop[11]&prop[10]&prop[9]&prop[8]&prop[7]&prop[6]&prop[5]&prop[4]&prop[3]&prop[2]&prop[1]&carry_gen[0])|
				(prop[31]&prop[30]&prop[29]&prop[28]&prop[27]&prop[26]&prop[25]&prop[24]&prop[23]&prop[22]&prop[21]&prop[20]&prop[19]&prop[18]&prop[17]&prop[16]&prop[15]&prop[14]&(prop[13]&prop[12]&prop[11]&prop[10]&prop[9]&prop[8]&prop[7]&prop[6]&prop[5]&prop[4]&prop[3]&prop[2]&prop[1]&prop[0]&C0));

endmodule
module CLA_FA(
			input [31:0]A,B,
			input Cin,
			output [31:0]S,
			output Cout
				);
	wire [32:0]carry_int; // Used to hold the output intermediate carry from the Carry Look Ahead block

// Instantiate carry generate & propagate generate block
	carry_prop_block CPB (
						.a(A),
						.b(B),
						.P(prop),
						.G(carry_gen)		
							);
// Instantiate carry look ahead generator block
	carry_look_ahead CLA(
						.prop(P),
						.carry_gen(G),
						.C0(Cin),
						.Cint(carry_int)
							);
// Instantiate an array of XOR gates to calculate the SUM
	xor sum[31:0](S[31:0],P[31:0],carry_int[31:0]);
	assign Cout = carry_int[32];
	
endmodule

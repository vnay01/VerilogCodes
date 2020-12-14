
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
	
	xor (S[0],w_prop[0],carry_int[0]);
	xor (S[1],w_prop[1],carry_int[1]);
	xor (S[2],w_prop[2],carry_int[2]);
	xor (S[3],w_prop[3],carry_int[3]);
	
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



// Test bench for Full Adder

module tb_CLA_4bit;
	reg [3:0] i_A,i_B;
	reg	i_carryin;
	wire o_carry;
	wire [3:0]o_sum;
	integer i; // used for generating bit pattern of test input in for loop.

// module under test
CLA_FA tbCLA_FA(.A(i_A),.B(i_B),.Cin(i_carryin),
				.S(o_sum),.Cout(o_carry));

// test Stimulus
	initial
	begin
	$monitor($time,"i_A: %b i_B: %b i_carryin: %b o_sum: %b o_carry: %b ", i_A,i_B,i_carryin,o_sum,o_carry);
		begin
			$dumpfile("test_CLA.vcd");
			$dumpvars(0,tbCLA_FA);
			#5;
			i_A=4'b0000;i_B=4'b0000;i_carryin=1'b0;
			#5;
			i_A=4'b1100;i_B=4'b1010;i_carryin=1'b0;
			#5;
			i_A=4'b1111;i_B=4'b1111;i_carryin=1'b1;
			#5;
			$finish;
			
			/*begin	
			#5;
			for(i=0;i<16;i++)
				#5;
				begin
				#5;
					i_A={i};
					for(i=0;i<16;i++)
					i_B={i};
					i_carryin=1'b0;
					#5 i_carryin=~ i_carryin;
				#5;
				$finish;
				end
			end
			*/
		end
		end
endmodule
	
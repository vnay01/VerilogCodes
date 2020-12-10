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
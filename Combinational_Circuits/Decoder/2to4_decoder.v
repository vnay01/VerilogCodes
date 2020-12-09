//2 to 4 decoder using 1to2 decoder
`timescale 1ns/1ns
// 1 - 2 line decoder
module decoder( 
				output [1:0]D,
				input A
				);
assign D[0]= ~A;
assign D[1]= A;
endmodule

module deco_2to4( 
	output [3:0]D,
	input [1:0] A,
	input Sel
	);
	
	// Instantiations of 1to2 decoders
decoder deco1 (.D(D[3:2]),.A((A[1]&Sel)));
decoder deco2 (.D(D[1:0]),.A((A[0]&~Sel)));
endmodule
// 2 bit comparator
`timescale 1ns / 100ps

module comparator(
				  input [1:0] x,y,
				  output f
				  );
// structural description
assign f= (x[0]&y[0]&x[1]&y[1])|
		  (~x[0]&~y[0]&x[1]&y[1])|
		  (~x[0]&~y[0]&~x[1]&~y[1])|
		  (x[0]&y[0]&~x[1]&~y[1]);
	endmodule
	
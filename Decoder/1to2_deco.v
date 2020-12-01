// 1 - 2 line decoder
module decoder( 
				output [1:0]D,
				input A
				);
assign D[0]= ~A;
assign D[1]= A;
endmodule
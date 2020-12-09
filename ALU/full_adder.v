// Carry_look ahead adder ckt. description

// description of Full Adder.
 module full_adder(
					input A,B,
					input C_in,
					output Sum,
					output C_out					
					);
		wire w_C,w_P,w_G;
	// structural description of full_adder
	xor (w_P,A,B);
	xor(Sum,w_P,C_in);
	
	and (w_G,A,B);
	and (w_C,w_P,C_in);
	or (C_out,w_C,w_G);
endmodule
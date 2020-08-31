// refining a 16by1 mux using 4x1 mux
module mux4to1(in, sel, out);
	input [3:0] in;
	input [1:0] sel;
	output out;
	assign out = in[sel];
endmodule
// implementing a 16x1 mux using 5 4by1 mux
module mux16to1(in, sel, out);
	input[15:0] in;
	input [3:0] sel;
	output out;
	wire [3:0] t;
// instantiating 4x1 mux
	mux4to1 M0(in[3:0], sel[1:0],t[0]);
	mux4to1 M1(in[7:4], sel[1:0],t[1]);
	mux4to1 M2(in[11:8], sel[1:0],t[2]);
	mux4to1 M3(in[15:12], sel[1:0],t[3]);
	mux4to1 M4(t, sel[3:2],out);
endmodule
	
`timescale 1ns /100ps

module carry_prop_block(
						input [3:0]a,b,
						output reg [3:0]P,G
						);
	//wire P,G;
	integer i;
	// logic to generate propagate, P
	always@(*);
	//begin
	for(i=0;i<4;i++)
	begin
		P[i]= a[i]^b[i];
	// logic to generate carry , C
	//for(i=0;i<4;i++)
		G[i]= a[i]&b[i];
	end
	//end
endmodule

module tb_cpb;
	reg	[3:0]i_a,i_b;		// declared as reg because the value assignment will occur inside a procedural block
	wire [3:0]o_P,o_G;
carry_prop_block cpb(.a(i_a),.b(i_b),.P(o_P),.G(o_G));

initial
	begin
	$dumpfile("test_cpb.vcd");
	$dumpvars(0,tb_cpb);
	$dumplimit(10000);
	begin
		   i_a=4'b0000;i_b=4'b0000;
		#5 i_a=4'b0011;i_b=4'b1100;
		#5 $finish;
	end
	end
initial
	begin
	$monitor($time,"i_a: %4b i_b: %4b o_P: %4b o_G: %4b", i_a,i_b,o_P,o_G);
	end
endmodule


		
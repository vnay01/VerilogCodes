// DataFlow model of ex 4_6
module ex4_6(x,y,z,F);
	input x,y,z;
	output F;
	wire F1,F2,F3;
	assign F1=(x&y);
	assign F2=(y&z);
	assign F3=(z&x);
	assign F=(F1|F2|F3);
endmodule
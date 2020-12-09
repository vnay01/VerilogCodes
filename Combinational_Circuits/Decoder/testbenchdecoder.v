// Testbench decoder2to4
module testbenchdecoder;
	reg A,B,E;
	output [0:3] D;
	decoder2to4 DUT(D,A,B,E);
	initial
		begin
			$dumpfile("decoder2to4.vcd");
			$dumpvars(0,testbenchdecoder);
			$monitor($time,"D=%h,A=%b,B=%b",D,A,B);  // capture change in variable values.
			#5 A=1'b0; B=1'b0;E=1'b0;
			#5 A=1'b0; B=1'b1;E=1'b0;
			#5 A=1'b1; B=1'b0;E=1'b0;
			#5 A=1'b1; B=1'b1;E=1'b0;
			#5 E=1'b1;
			#5 $finish;
		end
endmodule
	
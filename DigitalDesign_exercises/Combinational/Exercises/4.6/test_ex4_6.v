// test bench

module testbench;
	reg x,y,z;
	wire F;
	integer i;
// module instantiation
ex4_6 test1(x,y,z,F);
	initial
		begin
		$dumpfile("test1.vcd");
		$dumpvars(0,testbench);
		$monitor($time,"x=%b,y=%b,z=%b,F=%b",x,y,z,F);
			for(i=0;i<8;i++)
				begin
					{x,y,z}=i;
					#5;
			end
			#5 $finish;
			end
endmodule
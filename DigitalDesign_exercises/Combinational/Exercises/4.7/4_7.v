// Verilog model (DataFlow) of a Gray to Binary converter - 2001 style
module gray_to_bin(input w,x,y,z,
					output wire [3:0] a);
	assign a[3]=w;     // Continuous assignment of the net type variable (a)
	xor(a[2],w,x);
	xor(a[1],a[2],y);
	xor(a[0],a[1],z);
endmodule
module testbench;
	wire [3:0]a;
	reg w,x,y,z;
// Instantiate a DUT of the module- Port Order connection 
gray_to_bin g2b(w,x,y,z,a);

// Stimulus
initial
	begin
		$dumpfile("gray2bin.vcd");
	    $dumpvars(0,testbench);
		$monitor("time=",$time,"w=%b,x=%b,y=%b,z=%b,a=%4b",w,x,y,z,a);
		//case generation - using concatenation
		#5 {w,x,y,z}=4'b0000;
		#5 {w,x,y,z}=4'b0001;
		#5 {w,x,y,z}=4'b0011;
		#5 {w,x,y,z}=4'b0010;
		#5 {w,x,y,z}=4'b0110;
		#5 {w,x,y,z}=4'b0111;
		#5 {w,x,y,z}=4'b0101;
		#5 {w,x,y,z}=4'b0100;
		#5 {w,x,y,z}=4'b1100;
		#5 {w,x,y,z}=4'b1101;
		#5 {w,x,y,z}=4'b1111;
		#5 {w,x,y,z}=4'b1110;
		#5 {w,x,y,z}=4'b1010;
		#5 {w,x,y,z}=4'b1011;
		#5 {w,x,y,z}=4'b1001;
		#5 {w,x,y,z}=4'b1000;
		#5 $finish;
	end
endmodule

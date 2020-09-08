//Verilog : 2001 :: Code for a BCD to 7 Segment display
module bcd27(input A,B,C,D,
			 output a,b,c,d,e,f,g);
		// gate level description
		assign a = ~(B^D)|(C)|(A);
		assign b = (~B)|~(C^D);
		assign c = (~C)|(D)|(B);
		assign d = ~(~B^~C^D)|(C&(~D))|(A);
		assign e = ((~B)&(~D))|(C&(~D));
		assign f = ((~C)&(~D))|(B&(~C))|(B&(~D))|A;
		assign g = (B^C)|(A)|(C&(~D));
		endmodule
		
// testbench
module testbench;
	reg A,B,C,D;
	wire a,b,c,d,e,f,g;
	integer i;
	// instantiate DUT using port order method
	bcd27 b27(A,B,C,D,a,b,c,d,e,f,g);
	initial
		begin
			$monitor($time,"Decimal# = %d , Input=%b%b%b%b, output=%b%b%b%b%b%b%b",i,A,B,C,D,a,b,c,d,e,f,g);
			$dumpfile("bcd27.vcd");
			$dumpvars(0,testbench);
			begin
				for(i=0;i<15;i++)
					begin
					if(i>9)
					{A,B,C,D}= 4'hx;
					else
					{A,B,C,D}=i;
					#5;
					end
					#5 $finish;
					end
		end
	endmodule
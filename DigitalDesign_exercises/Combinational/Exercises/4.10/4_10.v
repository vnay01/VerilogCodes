// 4 bit combinational circuit 2's complementer
module two_complement(input w,x,y,z, output a,b,c,d);
	wire t1,t2,t3,t4,t5;
	
// Behavioral description of 2's complementer - Gate Level
	or(t1,x,y);
	or(t2,t1,z);
	xor(t3,x,y);
	and(t4,t3,~z);
	and(t5,~x,z);
	xor(a,w,t2);
	or(b,t4,t5);
	xor(c,y,z);
	buf(d,z);
endmodule


// TestBench

module test;

wire a,b,c,d;
reg w,x,y,z;
integer i;
// Instantiate DUT
	two_complement tc1(w,x,y,z,a,b,c,d);
	
	initial
		begin
			$dumpfile("two_complement.vcd");
			$dumpvars(0,test);
			$monitor("%d ",$time,"%b%b%b%b %b%b%b%b",w,x,y,z,a,b,c,d);
			for(i=0;i<16;i++)
				begin
					{w,x,y,z}={i};
					#5;
					end
		end
endmodule
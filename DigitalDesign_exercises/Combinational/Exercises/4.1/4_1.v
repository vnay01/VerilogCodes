//Exercise 4.1
module ckt_4_1(A,B,C,D,F1,F2);
	output F1,F2;
	input A,B,C,D;
	reg T1,T2,T3,T4,T5,F1,F2;
	initial
		begin
		T1=(~B&C);
		T2=(~A&B);
		T3=A|T1;
		T4=D^T2;
		T5=T2|D;
		F1=(T3|T4);
		F2=~T5;
	end
endmodule
// Edge-triggered D flip-flop with reset function for known intial output conditions

module D_flip_flop(output Q,Q_bar, input D,clk,reset);
	wire t1,t2,t3,t4;
	// Gate level instantiations
	nand G1(t1,t2,t4);
	nand G2(t2,t1,clk,rst);
	nand G3(t3,t2,clk,t4);
	nand G4(t4,rst,D,t3);
	nand G5(Q,t2,Q_bar);
	nand G6(Q_bar,t3,Q);
	endmodule

	//testbench
	
	module testbench;
		reg D,clk,reset;
		wire Q,Q_bar;
		reg [1:0] i;
	D_flip_flop Dff(Q,Q_bar,D,clk,reset);
	
	initial
		begin
			$dumpfile("D_flip_flop.vcd");
			$dumpvars(0,testbench);
			$monitor("%d ",$time,"%b%b%b%b%b", D,clk,reset,Q,Q_bar);
			#5 clk=(~clk);reset<=1'b1;
			begin
			for(i=2'b00;i<(2'b11);i++)
				begin
					D=i;
					#5;
					end
			#100 $finish;
			end
		end
		endmodule
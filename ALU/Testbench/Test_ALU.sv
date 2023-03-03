`timescale 1ns / 1ps  
`ifndef num_width
  `define num_width 8
  `endif 
`ifndef N
  `define N 7
  `endif

`ifndef op_width
  `define op_width 4
  `endif 
`define clockperiod 5

module test_alu();
//Inputs

 reg[`num_width-1:0] tb_number_1, tb_number_2;
 reg tb_reset;
 reg tb_clk;
 reg tb_button;
 reg [`num_width:0] tb_answer;

 integer i;

 ALU_Top dut_ALU(
                .clk(tb_clk),
                .reset(tb_reset),
                .button(tb_button),
                .number_1(tb_number_1),
                .number_2(tb_number_2),
                .answer(tb_answer)
    );
    initial 
		begin
    // hold reset state for 100 ns.
		$dumpfile("test_alu.vcd");
		$dumpvars(0,test_alu);

		$display($time,"%h %h %h",tb_number_1,tb_number_2, tb_answer);
	//  $display();
      tb_number_1 = 8'h0A;        // 11
      tb_number_2 = 8'h02;        // 2

    end

// Stimulus
initial begin
      tb_reset = 1'b1;
      #10
      tb_reset = 1'b0;
      tb_button = 1'b0;
      #1
      tb_button = 1'b1;         // first press
      #2
      tb_button = 1'b0;
      #1
      tb_button = 1'b1;       // second press
      #2
      tb_button = 1'b0;
      #1
      tb_button = 1'b1;     // third press
      #2
      tb_button = 1'b0;
      #1
      tb_button = 1'b1;   // 4th press
      #2
      tb_button = 1'b0;
      #1
      tb_button = 1'b1;   // 5th press
      #2
      tb_button = 1'b0;
      #5
      $finish;
end
// Simulate 100Mhz clock
always
#`clockperiod tb_clk <= ~tb_clk;

endmodule
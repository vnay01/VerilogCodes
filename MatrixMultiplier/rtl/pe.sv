`timescale 1ns/1ps
/*
  File Created on: 2025-02-19 03:55:08
  Created By	 : Vinay Singh
  Description 	 : processing element module. \
  		   This module takes two inputs and does the following :
			   1. performs mac operation.
			   2. sends the inputs out after one clock cycle.
			   3. The result of mac operation is retained in an accumulator, which is also an output from the module.
  Comments	 : 


  Synthesis report : target board BASYS3 board from Xilinx
  
  1. Slice Logic
--------------

+-------------------------+------+-------+------------+-----------+-------+
|        Site Type        | Used | Fixed | Prohibited | Available | Util% |
+-------------------------+------+-------+------------+-----------+-------+
| Slice LUTs*             |  117 |     0 |          0 |     20800 |  0.56 |
|   LUT as Logic          |  117 |     0 |          0 |     20800 |  0.56 |
|   LUT as Memory         |    0 |     0 |          0 |      9600 |  0.00 |
| Slice Registers         |   81 |     0 |          0 |     41600 |  0.19 |
|   Register as Flip Flop |   81 |     0 |          0 |     41600 |  0.19 |
|   Register as Latch     |    0 |     0 |          0 |     41600 |  0.00 |
| F7 Muxes                |    0 |     0 |          0 |     16300 |  0.00 |
| F8 Muxes                |    0 |     0 |          0 |      8150 |  0.00 |
+-------------------------+------+-------+------------+-----------+-------+

*/

module pe #(parameter INPUT_DATA_WIDTH =8,
	    parameter OUTPUT_DATA_WIDTH = 32)
(
	input logic clk,
	input logic rst_n,
	input logic enable,
	input logic [INPUT_DATA_WIDTH-1:0] a,	 
	input logic [INPUT_DATA_WIDTH-1:0] b,
	output logic [OUTPUT_DATA_WIDTH-1:0]accum_out,	 
	output logic [INPUT_DATA_WIDTH-1:0] a_out,	 
	output logic [INPUT_DATA_WIDTH-1:0] b_out
);

	// Internal signals
	logic enable_reg;
	logic[INPUT_DATA_WIDTH-1:0]a_reg, b_reg;
    logic[INPUT_DATA_WIDTH-1:0]a_reg_2, b_reg_2;

	logic[2*(INPUT_DATA_WIDTH)-1:0] mult_reg, mult_reg_nxt;
	logic[OUTPUT_DATA_WIDTH-1:0] accumulator, accumulator_nxt;

	/* Procedural blocks */

	always@(posedge clk or negedge rst_n)begin
		if(!rst_n)begin
			enable_reg <= 0;
			a_reg <= 0;
			a_reg_2 <= 0;
			b_reg <= 0;
            b_reg_2 <= 0;
			mult_reg <= 0;
			accumulator <= 0;
		end else begin
		    enable_reg <= enable;
			a_reg <= a;
			a_reg_2 <= a_reg;			
			b_reg <= b;
			b_reg_2 <= b_reg;			
			accumulator <= accumulator_nxt;
			mult_reg <= mult_reg_nxt;
		end
	end

    /* Combinationatorial block */
    always_comb begin
        accumulator_nxt = accumulator + mult_reg;
        mult_reg_nxt = 0;
        if(enable_reg)begin
//            accumulator_nxt = accumulator + mult_reg;
            mult_reg_nxt = a_reg * b_reg;
        end
    end
    
    /* Output assignments */
    assign a_out = a_reg_2;
    assign b_out = b_reg_2;
    assign accum_out = accumulator;

endmodule


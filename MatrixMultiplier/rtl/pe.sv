`timescale 1ps/1fs
/*
  File Created on: 2025-02-19 03:55:08
  Created By	 : Vinay Singh
  Description 	 : processing element module. \
  		   This module takes two inputs and does the following :
			   1. performs mac operation.
			   2. sends the inputs out after one clock cycle.
			   3. The result of mac operation is retained in an accumulator, which is also an output from the module.
  Comments	 : 

*/

module pe #(parameter INPUT_DATA_WIDTH =8,
	    parameter OUTPUT_DATA_WIDTH = 32)
(
	input logic clk,
	input logic rst_n,
	input logic enable,
	input logic [INPUT_DATA_WIDTH-1:0] a,	 
	input logic [INPUT_DATA_WIDTH-1:0] b,
	output logic [OUTPUT_DATA_WIDTH-1:0]c,	 
	output logic [INPUT_DATA_WIDTH-1:0] a_out,	 
	output logic [INPUT_DATA_WIDTH-1:0] b_out
);

	// Internal signals
	logic enable_reg;
	logic[INPUT_DATA_WIDTH-1:0]a_reg, b_reg;
	logic[2*(INPUT_DATA_WIDTH)-1:0] mult_reg, mult_reg_nxt;
	logic[OUTPUT_DATA_WIDTH-1:0] accumulator, accumulator_nxt;

	/* Procedural blocks */

	always@(posedge clk or negedge rst_n)begin
		if(!rst_n)begin
			enable_reg <= 0;
			a_reg<= 0;
			b_reg<= 0;
			mult_reg<= 0;
			accumulator <= 0;
		end else begin
		    enable_reg <= enable;
			a_reg<= a;
			b_reg<= b;
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
    assign a_out = a_reg;
    assign b_out = b_reg;
    assign c = accumulator;

endmodule


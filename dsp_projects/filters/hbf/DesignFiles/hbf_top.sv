`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Vinay Singh
// 
// Create Date: 06/03/2024 08:31:08 PM
// Design Name: 
// Module Name: hbf_top
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

import filter_pkg::*;

module hbf_top(
        input logic clk,
        input logic filter_clk,
        input logic rst_n,
        input logic input_valid,
        input logic [INPUT_SAMPLE_DATA_WIDTH-1:0] input_sample,
        input logic [COEFF_DATA_WIDTH-1:0] coeff [FILTER_ORDER-1:0],
        output logic [OUTPUT_SAMPLE_DATA_WIDTH-1:0] output_sample,
        output logic valid_out

    );
    
    // signals
    logic [INPUT_SAMPLE_DATA_WIDTH-1:0] input_sample_reg;
    logic [INPUT_SAMPLE_DATA_WIDTH-1:0] input_sample_reg_top, input_sample_reg_top_nxt;
    logic [INPUT_SAMPLE_DATA_WIDTH-1:0] input_sample_reg_bottom, input_sample_reg_bottom_nxt;
    logic input_valid_reg;
//    logic [$clog2(MAX_NOF_SAMPLES)-1:0]sample_counter, sample_counter_nxt;
    logic [1:0]sample_counter, sample_counter_nxt;

    
    always_ff@(posedge clk or negedge rst_n)begin
        if(!rst_n)begin
            sample_counter <= 0;
            input_sample_reg <= 0;
            input_sample_reg_top <= 0;
            input_sample_reg_bottom <= 0;
            input_valid_reg <= 0;
        end else begin
                sample_counter <= sample_counter_nxt;                
                input_sample_reg <= input_sample;
                input_sample_reg_top <= input_sample_reg_top_nxt;
                input_sample_reg_bottom <= input_sample_reg_bottom_nxt;
                input_valid_reg <= input_valid; 
        end    
    end
 
    always_comb begin
        input_sample_reg_top_nxt = input_sample_reg_top;
        input_sample_reg_bottom_nxt = input_sample_reg_bottom;
        sample_counter_nxt = sample_counter;
        
        if(input_valid_reg)begin
            if(sample_counter[0] == 1'b0)begin:split_input                  
                input_sample_reg_top_nxt = input_sample_reg;        
            end else begin
                input_sample_reg_bottom_nxt = input_sample_reg;            
            end
        end
        
        if(input_valid_reg)begin:increment_counter
            sample_counter_nxt = sample_counter + 1;
        end        
    end
    
        hbf #(
            .INPUT_SAMPLE_DATA_WIDTH (INPUT_SAMPLE_DATA_WIDTH),
            .COEFF_DATA_WIDTH (COEFF_DATA_WIDTH),
            .FILTER_ORDER (FILTER_ORDER),
            .OUTPUT_SAMPLE_DATA_WIDTH (OUTPUT_SAMPLE_DATA_WIDTH)
            ) hbf_i(
                .clk(filter_clk),
                .rst_n(rst_n),
                .input_valid(input_valid_reg),
                .input_sample_top(input_sample_reg_top),
                .input_sample_bottom(input_sample_reg_bottom),                
                .coeff(coeff),
                .output_sample(output_sample),
                .valid_out(valid_out)
        );

endmodule

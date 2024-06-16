`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Vinay Singh
// 
// Create Date: 05/31/2024 09:43:19 PM
// Design Name: half_band_filter
// Module Name: hbf
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

module hbf #(
                parameter INPUT_SAMPLE_DATA_WIDTH = 8,
                parameter COEFF_DATA_WIDTH = 10,
                parameter FILTER_ORDER = 15,
                parameter OUTPUT_SAMPLE_DATA_WIDTH = 22
            )(
                input logic clk,
                input logic rst_n,
                input logic input_valid,
                input logic [INPUT_SAMPLE_DATA_WIDTH-1:0] input_sample_top,
                input logic [INPUT_SAMPLE_DATA_WIDTH-1:0] input_sample_bottom,                
                input logic [COEFF_DATA_WIDTH-1:0] coeff [FILTER_ORDER-1:0],
                output logic [OUTPUT_SAMPLE_DATA_WIDTH-1:0]output_sample,
                output logic valid_out
    );
    
    
    // signals
    // input registers
    logic input_valid_reg_in;
    logic [NOF_PIPE_STAGE-1:0] valid_reg;
(* DONT_TOUCH = "TRUE" *)        logic [COEFF_DATA_WIDTH-1:0] coeff_reg_in [FILTER_ORDER-1:0];    
    
    
    // delay line
    logic [INPUT_SAMPLE_DATA_WIDTH-1:0] delay_line_top    [((FILTER_ORDER-1)/2):0];
    logic [INPUT_SAMPLE_DATA_WIDTH-1:0] delay_line_bottom [8:0];                        // to do:parameterize delay elements
    
    // signals for math
    // first stage adders
    logic [(INPUT_SAMPLE_DATA_WIDTH):0] adder_stage_first[MAX_NOF_ADDERS-1:0];      // (((15-1)/2)-1)/2
    logic [(INPUT_SAMPLE_DATA_WIDTH):0] adder_stage_first_nxt[MAX_NOF_ADDERS-1:0];      // (((15-1)/2)-1)/2

(* DONT_TOUCH = "TRUE" *)    logic [(INPUT_SAMPLE_DATA_WIDTH + COEFF_DATA_WIDTH):0] multiplier_stage    [MAX_NOF_ADDERS-1:0];      // (((15-1)/2)-1)/2
    logic [(INPUT_SAMPLE_DATA_WIDTH + COEFF_DATA_WIDTH):0] multiplier_stage_nxt[MAX_NOF_ADDERS-1:0];      // (((15-1)/2)-1)/2    

    // second stage adders
    
    logic [(INPUT_SAMPLE_DATA_WIDTH + COEFF_DATA_WIDTH + 1):0] adder_stage_second    [(MAX_NOF_ADDERS/2)-1:0];      // (((15-1)/2)-1)/2
    logic [(INPUT_SAMPLE_DATA_WIDTH + COEFF_DATA_WIDTH + 1):0] adder_stage_second_nxt[(MAX_NOF_ADDERS/2)-1:0];      // (((15-1)/2)-1)/2    

    // third stage adders
    
    logic [(INPUT_SAMPLE_DATA_WIDTH + COEFF_DATA_WIDTH + 2):0] adder_stage_third;
    logic [(INPUT_SAMPLE_DATA_WIDTH + COEFF_DATA_WIDTH + 2):0] adder_stage_third_nxt;    
   
    
    logic [(INPUT_SAMPLE_DATA_WIDTH + COEFF_DATA_WIDTH + 3):0] adder_stage_final;
    logic [(INPUT_SAMPLE_DATA_WIDTH + COEFF_DATA_WIDTH + 3):0] adder_stage_final_nxt;    
    
    always_ff@(posedge clk or negedge rst_n)begin
        if(!rst_n)begin:async_reset
            input_valid_reg_in <= 0;
            coeff_reg_in <= '{default:0};
            delay_line_top <= '{default:0};
            delay_line_bottom <= '{default:0};
            adder_stage_first <= '{default:0};
            multiplier_stage <= '{default:0};
            adder_stage_second <= '{default:0};
            adder_stage_third <= 0;
            adder_stage_final <= 0;
            valid_reg <= 1'b0;
        end else begin
            input_valid_reg_in <= input_valid;
            valid_reg[0] <= input_valid_reg_in;
            valid_reg[NOF_PIPE_STAGE-1:1] <= valid_reg[NOF_PIPE_STAGE-2:0];
            for (int i = 0; i < FILTER_ORDER ; i++)begin
                coeff_reg_in[i] <= coeff[i];
            end         
            
            delay_line_top[0] <= input_sample_top;
            for(int i = 0; i < ((FILTER_ORDER-1)/2); i++)begin
                delay_line_top[i+1] <= delay_line_top[i]; 
            end
            
            delay_line_bottom[0] <= input_sample_bottom;
            for(int i = 0; i < 8; i++)begin
                delay_line_bottom[i+1] <= delay_line_bottom[i];
            end
            
            adder_stage_first <= adder_stage_first_nxt;
            multiplier_stage <= multiplier_stage_nxt;
            adder_stage_second <= adder_stage_second_nxt;
            adder_stage_third <= adder_stage_third_nxt;          
            adder_stage_final <= adder_stage_final_nxt;        
        end
    end

    // combinational block
    
    
    always_comb begin
            adder_stage_first_nxt = adder_stage_first;
            multiplier_stage_nxt = multiplier_stage;
            adder_stage_second_nxt = adder_stage_second;
            adder_stage_third_nxt = adder_stage_third;
            adder_stage_final_nxt = adder_stage_final;
            
            if(input_valid_reg_in)begin
                for(int i = 0; i < MAX_NOF_ADDERS ; i++)begin
                    adder_stage_first_nxt[i] = delay_line_top[i] + delay_line_top[(((FILTER_ORDER-1)/2)-i)]; 
                end
                for(int i = 0; i < MAX_NOF_ADDERS ; i++)begin
                    multiplier_stage_nxt[i] = adder_stage_first[i]*coeff_reg_in[2*i]; 
                end
                for(int i = 0; i < (MAX_NOF_ADDERS/2) ; i++)begin
                    adder_stage_second_nxt[i] = multiplier_stage[2*i]+ multiplier_stage[2*i+1]; 
                end                
                adder_stage_third_nxt = adder_stage_second[0] + adder_stage_second[1];
                adder_stage_final_nxt = adder_stage_third + delay_line_bottom[8]; 
            end
    
    end
    
    assign output_sample = adder_stage_final;
    assign valid_out = valid_reg[NOF_PIPE_STAGE-1];
endmodule

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Vinay Singh
// 
// Create Date: 02/20/2025 06:47:04 AM
// Design Name: 
// Module Name: systolic_array
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: The design implements a 8x8 systolic array of PEs. 
//              Data flow and computations are performed inside PEs. Only interconnections between PEs \
//              should be implemented at this hierarchy.
// Dependencies: pe.sv
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module systolic_array 
import matrix_multiplier_pk::*;
    #(parameter INPUT_DATA_WIDTH = 8 ,
      parameter OUTPUT_DATA_WIDTH = 32) (
        input logic clk,
        input logic rst_n,
        input logic [INPUT_DATA_WIDTH -1 :0]row_a [NOF_ROWS_MATRIX_A-1:0],
        input logic [INPUT_DATA_WIDTH -1 :0]row_b [NOF_COLS_MATRIX_B-1:0],
        output logic [OUTPUT_DATA_WIDTH-1:0] pe_accum [SIZE_OF_OUTPUT_MATRIX-1:0]
    );
    
    
    
    // module instantiations
    generate 
        for(genvar i = 0; i < SIZE_OF_OUTPUT_MATRIX ; i++)begin
        
        end
    endgenerate
    
endmodule

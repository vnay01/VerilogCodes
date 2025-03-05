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
        input logic [INPUT_DATA_WIDTH -1 :0]row_a [NOF_ROWS_MATRIX_A-1:0][NOF_COLS_MATRIX_A-1:0],
        input logic [INPUT_DATA_WIDTH -1 :0]row_b [NOF_ROWS_MATRIX_B-1:0][NOF_COLS_MATRIX_B-1:0],
        output logic [OUTPUT_DATA_WIDTH-1:0] pe_accum [NOF_ROWS_MATRIX_C-1:0][NOF_COLS_MATRIX_C-1:0]      // 2-D array
    );
    
    /* Signal declarations */

    // Register Array
    logic [INPUT_DATA_WIDTH -1 :0]row_reg_a [NOF_ROWS_MATRIX_A-1:0][(NOF_ROWS_MATRIX_A + NOF_COLS_MATRIX_A -1) -1:0];  // shape of reshaping register 
    logic [INPUT_DATA_WIDTH -1 :0]col_reg_b [NOF_COLS_MATRIX_B-1:0][(NOF_ROWS_MATRIX_B + NOF_COLS_MATRIX_B -1)-1:0];  // shape of reshaping register 

    // Enable signal
    logic valid;

    /* Block to reshape input matrix */

    always_ff @( posedge clk ) begin : reshape_register_update
        if(!rst_n)begin
            row_reg_a <= '{default:0};
            col_reg_b <= '{default:0};
        end else if (valid)begin
            for(int i = 0; i < NOF_ROWS_MATRIX_A ; i++)begin
                for(int j = 0; j < (NOF_ROWS_MATRIX_A + NOF_COLS_MATRIX_A -1) ; j++)begin
                    if( j >=1 && j < (i+NOF_COLS_MATRIX_A))begin:fill_matrix_a
                        row_reg_a[i][j] <= row_a[i][j-1];
                    end else begin:insert_zeros
                        row_reg_a[i][j] <= '0;
                    end
                end
            end
        end
    end

/*

    // module instantiations
    generate 
        for(genvar i = 0; i < NOF_ROWS_MATRIX_C ; i++)begin
            for(genvar j = 0; j < NOF_COLS_MATRIX_C; j++)begin                    
                pe #(.INPUT_DATA_WIDTH(INPUT_DATA_WIDTH),
                    .OUTPUT_DATA_WIDTH(OUTPUT_DATA_WIDTH))
                pe_i (
                .clk       (clk),
                .rst_n     (rst_n),
                .enable    (valid),
                .a         (row_a),	 
                .b         (),
                .accum_out (),	 
                .a_out     (),	 
                .b_out     ()
                );
            end
        end
    endgenerate

*/
    
endmodule

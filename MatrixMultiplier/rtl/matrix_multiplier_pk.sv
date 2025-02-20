`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Vinay Singh
// 
// Create Date: 02/20/2025 06:55:27 AM
// Design Name: 
// Module Name: matrix_multiplier_pk
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: Package file for matrix multiplier.
//              Contains parameter definitions.
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


package matrix_multiplier_pk;

// Parameters for Size of Matrices
localparam NOF_ROWS_MATRIX_A = 8;
localparam NOF_COLS_MATRIX_A = 8;

localparam NOF_ROWS_MATRIX_B = 8;
localparam NOF_COLS_MATRIX_B = 8;

// OUTPUT Matrix size
localparam SIZE_OF_OUTPUT_MATRIX = (NOF_ROWS_MATRIX_A*NOF_COLS_MATRIX_B);
// Data widths
localparam INPUT_DATA_WIDTH = 8;
localparam OUTPUT_DATA_WIDTH = 32;

endpackage

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/01/2024 09:36:12 PM
// Design Name: 
// Module Name: filter_pkg
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

package filter_pkg;
    
    // GENERAL parameters
    localparam MAX_NOF_SAMPLES = 4096;
    localparam NOF_TEST_VECTORS = 100;

    // parameter for HBF filter
    localparam FILTER_ORDER = 15;
    localparam NOF_ZERO_COEFFICIENTS = (FILTER_ORDER-1)/2;
    localparam CENTER_TAP_POSITION = (FILTER_ORDER-1)/2;
//    localparam MAX_NOF_ADDERS = (FILTER_ORDER-1)/2 - $clog2(NOF_ZERO_COEFFICIENTS/2);
    localparam MAX_NOF_ADDERS = 4;
    localparam NOF_PIPE_STAGE = 12;

    
    // data width
    localparam INPUT_SAMPLE_DATA_WIDTH = 6;
    localparam COEFF_DATA_WIDTH = 10;
    localparam OUTPUT_SAMPLE_DATA_WIDTH = 20;
    
    
endpackage

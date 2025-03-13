`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Vinay Singh
// 
// Create Date: 03/13/2025 04:16:21 PM
// Design Name: 
// Module Name: boundary_register_file
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: This module will act as a template to create boundary register array \ 
//              Boundary register array can be used to feed the systolic array.    
//              Boundary register array structure to look as below :
//              4 Byte x FILE_DEPTH ; where the register file will have a width of 1byte and depth of \
//              FILE_DEPTH  
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module boundary_register_file 
    #(parameter DATA_WIDTH = 32,
      parameter REG_FILE_DEPTH = 8)(
            input logic clk,
            input logic rst_n,
            input logic [REG_FILE_DEPTH-1:0] shift_enable,
            input logic [DATA_WIDTH-1:0] data_in [REG_FILE_DEPTH-1:0],
            output logic [DATA_WIDTH-1:0] data_out [REG_FILE_DEPTH-1:0] 
    );
    
    
    /* Functionality 
       Each register file index feeds one row/column of the systolic array. \ 
       Since the register file  can hold 4 Bytes of data, the controller will be responsible \
       for loading the correct data into the register array, with minimum read access from memory.
    */
    
    
    
    
    
endmodule

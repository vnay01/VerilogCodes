`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Vinay Singh
// 
// Create Date: 03/17/2025 01:19:45 PM
// Design Name: 
// Module Name: processing_engine_array
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
/*
    Ports :
        Inputs: 
            1. clk
            2. rst_n
            3. unpacked array of size 1 byte x Number of rows, used to feed input matrix [A] in row-wise manner from left to right. 
            4. unpacked array of size 1 byte x Number of column, used to feed input matrix [B] in column-wise manner from top to bottom.
            5. 
        Output: 
            1. 2-D accumulator array of size NxN ; where N is the dimension of the square matrix
                   
*/

/* Synthesis report 
    
    +-------------------------+------+-------+------------+-----------+-------+
    |        Site Type        | Used | Fixed | Prohibited | Available | Util% |
    +-------------------------+------+-------+------------+-----------+-------+
    | CLB LUTs*               | 6017 |     0 |          0 |    425280 |  1.41 |
    |   LUT as Logic          | 6017 |     0 |          0 |    425280 |  1.41 |
    |   LUT as Memory         |    0 |     0 |          0 |    213600 |  0.00 |
    | CLB Registers           | 5136 |     0 |          0 |    850560 |  0.60 |
    |   Register as Flip Flop | 5136 |     0 |          0 |    850560 |  0.60 |
    |   Register as Latch     |    0 |     0 |          0 |    850560 |  0.00 |
    | CARRY8                  |  640 |     0 |          0 |     53160 |  1.20 |
    | F7 Muxes                |    0 |     0 |          0 |    212640 |  0.00 |
    | F8 Muxes                |    0 |     0 |          0 |    106320 |  0.00 |
    | F9 Muxes                |    0 |     0 |          0 |     53160 |  0.00 |
    +-------------------------+------+-------+------------+-----------+-------+

*/

module processing_engine_array #(
    parameter INPUT_DATA_WIDTH = 8,
    parameter OUTPUT_DATA_WIDTH = 32,
    parameter NUMBER_OF_ROWS = 8,
    parameter NUMBER_OF_COLUMNS = 8
    )(
        // clock and reset
        input logic clk,
        input logic rst_n,
        // input signals
        input logic enable [NUMBER_OF_ROWS -1 :0],                                  // enable signal  
        input logic [INPUT_DATA_WIDTH -1 : 0] row_a [NUMBER_OF_ROWS -1 :0],         // feed line for feeding data from left to right
        input logic [INPUT_DATA_WIDTH -1 : 0] column_b [NUMBER_OF_COLUMNS -1 :0],      // feed line for feeding data from top to bottom    
        // output signals
        output logic [OUTPUT_DATA_WIDTH -1 :0] result_matrix [NUMBER_OF_ROWS -1 :0] [NUMBER_OF_COLUMNS -1 :0]
    );
    
        /* Signal declarations */    
        logic enable_reg [NUMBER_OF_ROWS -1 :0];
        logic [INPUT_DATA_WIDTH -1 : 0] row_a_reg [NUMBER_OF_ROWS - 1 :0];
        logic [INPUT_DATA_WIDTH -1 : 0] column_b_reg [NUMBER_OF_COLUMNS -1 :0];
        
        // Interconnection signals
        logic [INPUT_DATA_WIDTH -1 : 0] pe_left_to_right_reg [NUMBER_OF_ROWS -1 :0] [NUMBER_OF_COLUMNS -1 :0];
        logic [INPUT_DATA_WIDTH -1 : 0] pe_top_to_bottom_reg [NUMBER_OF_ROWS -1 :0] [NUMBER_OF_COLUMNS -1 :0];
    
        logic [OUTPUT_DATA_WIDTH -1 :0] result_matrix_reg [NUMBER_OF_ROWS -1 :0] [NUMBER_OF_COLUMNS -1 :0];
        
        
        /* Data path connections */
        
        always_ff@(posedge clk or negedge rst_n)begin
            if(!rst_n)begin
                row_a_reg <= '{default:0};
                column_b_reg <= '{default:0};
                enable_reg <= '{default:0};                
            end else begin:sample_inputs
                row_a_reg <= row_a;
                column_b_reg <= column_b;    
                enable_reg <= enable;            
            end        
        end 
       
    
    
        // Interconnections between processing engines
        
        // Connect boundary cells to inputs 
        genvar w,x;
        
        generate
            for(w = 0; w < 1 ; w++)begin
                for(x=0; x < NUMBER_OF_ROWS; x++)begin
                    assign pe_left_to_right_reg [x][0] = row_a_reg[x];                                
                end                
            end

            for(w = 0; w < 1 ; w++)begin
                for(x=0; x < NUMBER_OF_COLUMNS; x++)begin
                    assign pe_top_to_bottom_reg [0][x]= column_b_reg[x];                                
                end                
            end            
        endgenerate
        
        
                
        // Instantiate the PE module in a 2D array structure
        genvar i,j;
        
        generate
//            for(j = 1 ; j < NUMBER_OF_COLUMNS; j++)begin:create_columns
            for(i= 0; i < NUMBER_OF_ROWS ; i++)begin:create_rows
                for(j = 0 ; j < NUMBER_OF_COLUMNS; j++)begin:create_columns
                    pe #(.INPUT_DATA_WIDTH(INPUT_DATA_WIDTH), 
                        .OUTPUT_DATA_WIDTH(OUTPUT_DATA_WIDTH)) 
                        pe_array_i(
                        .clk(clk),
                        .rst_n(rst_n),
                        .enable(enable_reg[i]),
                        .a(pe_left_to_right_reg[i][j]),
                        .b(pe_top_to_bottom_reg[i][j]),
                        .accum_out(result_matrix_reg[i][j]),
                        .a_out(pe_left_to_right_reg[i][j+1]),
                        .b_out(pe_top_to_bottom_reg[i+1][j])
                      );                    
                end                      
            end
        endgenerate
  
  
  /* Output assignments */
  
  assign result_matrix = result_matrix_reg;
    
    
    
endmodule

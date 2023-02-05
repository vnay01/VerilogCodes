`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/05/2023 11:31:03 PM
// Design Name: 
// Module Name: mac_unit
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


module mac_unit #(parameter data_width = 8)
                 ( input clk, reset, enable,
                   input [data_width-1 :0] num_1, num_2,
                   output reg [2*data_width : 0] output_num                           
                  );


parameter word_length = data_width;
                  assign high_val = 1'b1;
                  assign low_val = 1'b0;
                  
// Internal wires
wire [2*data_width-1 : 0] mult_out;
reg [2*data_width : 0] add_feed_back;
wire [2*data_width : 0] w_output_num;

// Module instantiations

// Multiply unit
    mul #(data_width) m_0( .clk(clk),
                           .reset(reset),
                           .enable(enable),
                           .num_1(num_1),
                           .num_2(num_2),
                           .out_num(mult_out)
                         );
                    
// Adder unit
   adder #(2*data_width+1) a_0( .clk(clk),
                              .reset(reset),
                              .enable(enable),
                              .num_1(mult_out),
                              .num_2(add_feed_back),
                              .out_num(w_output_num)
                            );
   
   // Assigning feedback loop to adder
   always@(posedge clk)
    begin
    if (enable)
    add_feed_back <= w_output_num;
    end             

// Connect output with
always@*
    begin
    output_num = w_output_num;
    end
                  
endmodule

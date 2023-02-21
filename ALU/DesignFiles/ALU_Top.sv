`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/15/2023 07:50:18 AM
// Design Name: 
// Module Name: ALU_Top
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


module ALU_Top #(parameter num_width = 8)(
                clk,
                reset,
                button,
                number_1,
                number_2,
                answer
    );

// Port direction
    input clk; 
    input reset;
    input button;
    input [num_width - 1 : 0] number_1, number_2;
    output [num_width -1 : 0] answer;
    
// Internal connections
 reg w_clk;
 reg w_reset;
 reg w_button; 
 reg [3:0] w_opcode;

// Module Instantiations
alu_ctrl Controller(
				    .clk(w_clk),
				    .reset(w_reset), 
				    .button(w_button),
				    .control(w_opcode)				// control signal to activate ALU function
					);
ALU #(8,4)datapath( 
            .clk(w_clk),
//            .enable(), 
            .opcode(w_opcode),
            .num_1(number_1),
            .num_2(number_2),
            .ans(answer) 
            );


// external connections
always_comb
begin
w_button = button;
w_reset = reset;
w_clk = clk;
end       
endmodule

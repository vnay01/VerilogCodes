`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/14/2023 03:52:48 PM
// Design Name: 
// Module Name: ALU
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


module ALU #(parameter num_width = 8,
            parameter op_width = 4)( 
            clk,
//            enable, 
            opcode,
            num_1,
            num_2,
            ans 
            );
// Port Directions

    input clk;
//    input enable;
    input [op_width-1:0] opcode;        // selects which operation is performed
    input [num_width-1:0] num_1, num_2;
    output reg [num_width-1 : 0] ans;        // How will you handle result of MUL operation with 8 bits
    
    
///Internal connections

reg [num_width-1 : 0] w_out_num;
reg [num_width-1 : 0] dummy_ans = 8'hFF;   
    
  
// Instantiate MOD3 here

mod3_8bit #(8,6) m_0(
                     .enable(opcode[op_width - 1]),
                     .number(num_1),
                     .out_num(w_out_num)
                     );    
// operations

always_ff@(posedge clk)      // may change senstivity list later
begin

//if (enable) 
//    begin
    case(opcode)
    
    4'h1 : ans = (num_1 + num_2);    
    4'h2 : ans = (num_1 - num_2);    
    4'h4 : ans = (num_1[3:0] * num_2[3:0]);
    4'h8 : ans = w_out_num;
    default : ans = dummy_ans ;
    
    endcase
//    end

end
    
    
                
endmodule

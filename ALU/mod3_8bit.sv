`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/14/2023 09:19:59 AM
// Design Name: 
// Module Name: mod3_8bit
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


module mod3_8bit #(parameter num_width = 8,
                   parameter N = 6) 
                  (enable, number, out_num);
        
        input enable ;
        input [num_width-1 : 0] number;
        output reg [num_width-1 :0] out_num;
        
// Internal wirings
wire  [N:0][num_width-1 :0] w_num;
                 
// module instantiation
mod3 m1(
        .num(number),
        .reduce(192),
        .ans(w_num[6])); 

mod3 m2(
        .num(w_num[6]),
        .reduce(96),
        .ans(w_num[5])
        );

mod3 m3(
        .num(w_num[5]),
        .reduce(48),
        .ans(w_num[4])
        );
mod3 m4(
        .num(w_num[4]),
        .reduce(24),
        .ans(w_num[3])  
        );
mod3 m5(
        .num(w_num[3]),
        .reduce(12),
        .ans(w_num[2])
        );        
mod3 m6(
        .num(w_num[2]),
        .reduce(6),
        .ans(w_num[1])
        );        
mod3 m7(
        .num(w_num[1]),
        .reduce(3),
        .ans(w_num[0])
        );              

always@(*)
begin
if (enable) out_num = w_num[0];
else    out_num = 8'h00;
end
                                                 
endmodule

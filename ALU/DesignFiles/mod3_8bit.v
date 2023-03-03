`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Vinay Singh
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

//`include "mod3.v"

`define num_width 8
`ifndef N
        `define N 7
        `endif
`define bus_width (`N * `num_width)     // 56 bits long

module mod3_8bit (enable, number, out_num);
        
        input enable ;
        input [`num_width-1 : 0] number;
        output reg [`num_width-1 :0] out_num;
        
// local paramters
        localparam stg_6 = 8'hC0,
                   stg_5 = 8'h60,
                   stg_4 = 8'h30,
                   stg_3 = 8'h18,
                   stg_2 = 8'h0C,
                   stg_1 = 8'h06,
                   stg_0 = 8'h03;
                   

// Internal wirings
wire  [`bus_width-1:0] w_num;
                 
// module instantiation
mod3 m1(
        .num(number),
        .reduce(stg_6),
        .ans(w_num[`bus_width-1 : `bus_width-`num_width]));                             // 55 : 48

mod3 m2(
        .num(w_num[`bus_width-1 : `bus_width-`num_width]),
        .reduce(stg_5),
        .ans(w_num[`bus_width -`num_width -1 : `bus_width -(2*`num_width) ])               // 47 : 40
        );

mod3 m3(
        .num(w_num[`bus_width -`num_width -1 : `bus_width -(2*`num_width) ]),
        .reduce(stg_4),
        .ans(w_num[`bus_width -(2*`num_width)-1 : `bus_width -(3*`num_width)])         // 39:32
        );
mod3 m4(
        .num(w_num[`bus_width -(2*`num_width)-1 : `bus_width -(3*`num_width)]),
        .reduce(stg_3),
        .ans(w_num[`bus_width -(3*`num_width) -1 : `bus_width -(4 *`num_width)])         // 31:24
        );
mod3 m5(
        .num(w_num[`bus_width -(3*`num_width) -1 : `bus_width -(4 *`num_width)]),
        .reduce(stg_2),
        .ans(w_num[`bus_width -(4 *`num_width) -1 : `bus_width -(5 *`num_width)])        // 23:16
        );        
mod3 m6(
        .num(w_num[`bus_width -(4 *`num_width) -1 : `bus_width -(5 *`num_width)]),
        .reduce(stg_1),
        .ans(w_num[`bus_width -(5 *`num_width)-1 : `bus_width -(6 *`num_width)])         // 15: 8
        );        
mod3 m7(
        .num(w_num[`bus_width -(5 *`num_width)-1 : `bus_width -(6 *`num_width)]),
        .reduce(stg_0),
        .ans(w_num[`bus_width -(6 *`num_width)-1 : `bus_width -(7 *`num_width)])                                          // 7:0
        );              

always@(*)
begin
if (enable) out_num = w_num[`bus_width -(6 *`num_width)-1 : `bus_width -(7 *`num_width)];    
else    out_num = 8'h00;
end
                                                 
endmodule

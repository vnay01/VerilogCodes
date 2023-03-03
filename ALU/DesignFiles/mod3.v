`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/13/2023 10:31:32 PM
// Design Name: 
// Module Name: mod3
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
`define num_width 8

module mod3 (num, reduce, ans );
            
            input [`num_width-1 : 0]num;
            input [`num_width-1:0] reduce;
            
            output reg [`num_width - 1 :0] ans;

// Internal storage
    reg [`num_width-1:0] B;
// structure
    // Compare
    always@(*)
    begin
    if (num >= reduce) B = reduce;
    else B = 0;
    end 
    
    always@(*)
    begin
    ans <= num - B;
    end 
// Non-synthesizable constructs
initial begin
    $display("Done...");
end

endmodule

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Vinay Singh
// 
// Create Date: 27.03.2021 12:11:59
// Design Name: 
// Module Name: arbiter_ifc
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


module arb_with_ifc(arb_if arbif); // Interface from previous design
    always@(posedge arbif.clk or posedge arbif.rst)
        begin
            if(arbif.rst)
                arbif.grant<='0;
                else if(arbif.request[0])
                    arbif.grant<=2'b01;
                else if(arbif.request[1])
                    arbif.grant<=2'b10;
                    else
                    arbif.grant<='0;
                    end 
endmodule

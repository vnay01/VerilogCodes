`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Vinay Singh
// 
// Create Date: 09.11.2024 10:35:08
// Design Name: 
// Module Name: ps_top_wrapper
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


module ps_top_wrapper(
        input logic sys_clk,
        input logic ext_rst,
        input logic external_intrp,
        input logic dcm_locked,
        output logic intr_ack,
        output logic clk_out,
        output logic [7:0]led           // connect to eight on-board leds
    );




    // Module instantiations
    ps_wrapper ps_wrapper_i (
        .INTERRUPT_0_ack        (intr_ack),
        .INTERRUPT_0_address    (32'h00000000),
        .INTERRUPT_0_interrupt  (external_intrp),
        .clk_out                (clk_out),
        .led_8bits_tri_i        (led),
        .dcm_locked_0           (dcm_locked),
        .reset                  (ext_rst),
        .sys_clock              (sys_clk)
        );
endmodule

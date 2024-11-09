`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.11.2024 19:08:08
// Design Name: 
// Module Name: top_wrapper
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


module top_wrapper(
        input logic clk,
        input logic ext_rst,
        input logic external_int_button,
        output logic [7:0] led,
        output logic heart_beat_led
    );
    
        /* Signals */
(*DONT_TOUCH = "YES"*)logic  int_ack_led;
        logic clk_out;
        logic clock_locked;

    /* Module Instantiations */

    // clock wizrd

    clk_wiz_0 clk_wiz_0_i
        (
         .clk_out1(sys_clk),     // output clk_out1
//         .reset(ext_rst), // input reset
         .locked(clock_locked),       // output locked
         .clk_in1(clk)      // input clk_in1
     );
     

    ps_top_wrapper ps_top_wrapper_i(
        .sys_clk            (sys_clk),
        .ext_rst            (ext_rst),
        .external_intrp     (external_int_button),
        .dcm_locked         (clock_locked),
        .intr_ack           (int_ack_led),
        .clk_out            (clk_out),
        .led                (led)           // connect to eight on-board leds
    );
    
    heatbeat_counter #(	.CLK_FREQ (100_000_000)  // Clock frequency in Hz (50 MHz for example)
        )heatbeat_counter_i(
            .clk(clk_out),      	// Clock signal to be monitored
            .rst_n(!ext_rst),    	// Active-low reset as input
            .enable(1'b1),
            .heartbeat(heart_beat_led)      	// LED output
        );
endmodule

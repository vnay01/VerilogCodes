`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Vinay Singh
// 
// Create Date: 09/25/2024 02:22:29 PM
// Design Name: 
// Module Name: heatbeat_counter
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


module heatbeat_counter #(	parameter integer CLK_FREQ = 50_000_000  // Clock frequency in Hz (50 MHz for example)
        )(
            input logic clk,      	// Clock signal to be monitored
            input logic rst_n,    	// Active-low reset
            input logic enable,
            output logic heartbeat      	// LED output
        );            	 
	// Parameter to control LED blink frequency
	localparam integer BLINK_FREQ = 1;     	// Blink frequency in Hz (1 Hz)
	localparam integer COUNT_MAX = CLK_FREQ / (2 * BLINK_FREQ);  // Count to half period (1 Hz blink rate)
 
	// Counter register
	logic [31:0] counter;
 
	// Clock monitoring process
	always_ff @(posedge clk or negedge rst_n) begin
    	if (!rst_n) begin
        	counter <= 0;
        	heartbeat <= 0;
    	end else begin if(enable)begin
                    if (counter == COUNT_MAX) begin
                        heartbeat <= ~heartbeat;  // Toggle LED state
                        counter <= 0; // Reset counter after reaching the max count
                    end else begin
                        counter <= counter + 1;  // Increment counter on each clock cycle
                    end 
                end else begin
                   counter <= 0;
                   heartbeat <= 0;
                end
            end 
    end
	
 
endmodule


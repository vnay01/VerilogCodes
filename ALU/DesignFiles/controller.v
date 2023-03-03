`timescale 1ns / 1ps

// FSM based controller for 4-function ALU

module alu_ctrl(
				clk, reset, button,
				control				// control signal to activate ALU function
				);
					

// Port direction
	input clk;
	input reset;
	input button;
	output reg [3:0] control;				
// Using enum to model states

localparam STATE_SIZE = 4;
localparam IDLE = 3'd0,
		   NUM1 = 3'd1,
		   NUM2 = 3'd2,
		   ADD = 3'd3,
		   SUB = 3'd4,
		   MUL = 3'd5,
		   MOD3 = 3'd6,
		   STATE_8_PLACEHOLDER = 3'd7;

	reg [STATE_SIZE-1:0] current_state, next_state;

	always@(posedge clk, posedge reset)						
	begin 
		if (reset)
			current_state <= IDLE;
		else
			current_state <= next_state;
		end

// State change logic
	always@(*)
	begin
		case(current_state)
			
			IDLE: if(button)
				next_state <= NUM1;
				else
				next_state <= current_state;
			
			NUM1: if(button)
				next_state <= NUM2;
				else
                next_state <= current_state;
            NUM2: if(button)
                next_state <= ADD;
                else
                next_state <= current_state;
                                 
			ADD: if(button)
				next_state <= SUB;
				else
                next_state <= current_state;
                			
			SUB: if(button)
				next_state <= MUL;
				else
                next_state <= current_state;			
			
			MUL: if(button)
				next_state <= MOD3;
				else
                next_state <= current_state;
                			
			MOD3: if(button)
				next_state <= ADD;
				else
                next_state <= current_state;
			STATE_8_PLACEHOLDER:
				next_state <= IDLE;
			         
		endcase
	end
    
// output based on state: MOORE machine
	
	always@(*)
	begin
	case(current_state)
		IDLE: control = 4'b0000;
		/*
		assert(property name;
			@(posedge clk) test
		endproperty)
		*/
		NUM1: control = 4'b0000;
		NUM2: control = 4'b0000;
		ADD : control = 4'b0001;
		SUB : control = 4'b0010;
		MUL : control = 4'b0100;
		MOD3: control = 4'b1000;
//		WAT : control = 4'b1001;
		default : control = 4'b0000;
		endcase
		end

		initial begin
			$display("Done...");
		end

endmodule			
								
`timescale 1ns / 1ps

// FSM based controller for 4-function ALU

module alu_ctrl(
				input clk, reset, button,
				output reg [3:0] control				// control signal to activate ALU function
					);
					
// Using enum to model states

typedef enum logic[2:0] {IDLE, NUM1, NUM2, ADD, SUB, MUL, MOD3} state;

state current_state, next_state;
					
	always_ff@(posedge clk, posedge reset)						
	begin: state_register
		if (reset)
			current_state <= IDLE;
		else
			current_state <= next_state;
		end: state_register

// State change logic
	always_comb
	begin: next_state_logic
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
                       				
			default: 
			   next_state <= current_state;
			         
		
		endcase
    end:next_state_logic
    
// output based on state: MOORE machine
	
	always_comb
	begin: control_signal
	case(current_state)
		IDLE: control = 4'b0000;
		NUM1: control = 4'b0000;
		NUM2: control = 4'b0000;
		ADD : control = 4'b0001;
		SUB : control = 4'b0010;
		MUL : control = 4'b0100;
		MOD3: control = 4'b1000;
//		WAT : control = 4'b1001;
		default : control = 4'b0000;
		endcase
		end:control_signal
		 

endmodule			
								
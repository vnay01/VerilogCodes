// file contains controller of matrix multiplier
`timescale 1ns/1ps
`define low_val 1'b0
`define count_depth 8
`define data_width 32
`define mem_depth 3

module controller(
                    clk,
                    reset,
                    enable,
                    count,
                    read_en,
                    rom_address,
                    ram_address,
);
// port direction
    input clk;
    input reset;
    input enable;
    output reg [`count_depth-1:0] count;
    output reg read_en;
    output reg [`mem_depth-1:0] rom_address;
    output reg [`mem_depth-1:0] ram_address;

//  internal signals
    reg read_en_next;
    reg [`mem_depth-1:0] rom_address_next;
    reg [`mem_depth-1:0] ram_address_next;  
    reg [`count_depth-1:0] count_next;
    
// state parameters
localparam STATE_SIZE = 4;
localparam  START = 3'd0,
            READ = 3'd1,
            LOAD = 3'd2,
            MAC = 3'd3,
            STORE = 3'd4,
            DONE = 3'd5,
            STATE_6_PLACEHOLDER = 3'd6,
            STATE_7_PLACEHOLDER = 3'd7;
            
reg [STATE_SIZE-1:0]current_state, next_state;


//////////////////////////////////////////////////////
///////// Behavioral description starts here//////////
//////////////////////////////////////////////////////

// register update
always@(posedge clk , posedge reset)
begin
    if (reset)
    begin
    current_state <= START;
    count <= {`count_depth{`low_val}};
    rom_address <= {`mem_depth{`low_val}};
    ram_address <= {`mem_depth{`low_val}};
    read_en <= 1'b0;
    end
    else if(enable) begin
    current_state <= next_state; 
    count <= count_next;
    rom_address <= rom_address_next;
    ram_address <= ram_address_next;
    read_en <= read_en_next;
    end

end

// State Change logic

always@(*)
    begin
      //  if(enable)
      count_next = count + 1;
      next_state = current_state;
      read_en_next <= read_en;
      rom_address_next = rom_address;
      ram_address_next = ram_address;
      
        case(current_state)
        START : if(enable) 
                begin
                next_state = READ; 
                count_next = {`count_depth{`low_val}};
                end
        // READ state enables reading of matrix elements into registerbank of accelarator 
        READ : begin 
                read_en_next <= 1'b1;           // enable memory blocks
                rom_address_next = rom_address + 1;
                ram_address_next = ram_address + 1;
             
                if(count==15)
                begin
                next_state = LOAD;              // goes to next state once all elements are read.
                read_en_next = 1'b0;           // disable memory blocks after matrix is read
                count_next = {`count_depth{`low_val}};
                end
                end
        LOAD : if(count!=20)
                begin
                next_state = MAC;
                count_next = {`count_depth{`low_val}};
                end
        MAC : if(count==1)
                begin
                next_state = LOAD;
                count_next = {`count_depth{`low_val}};
                end
        STORE : if(count==10)
                begin
                next_state = START;
                count_next = {`count_depth{`low_val}};
                end 
        DONE : begin 
                next_state = START;
                count_next = {`count_depth{`low_val}};
                end  
        STATE_6_PLACEHOLDER : begin 
                              next_state = START;
                              count_next = {`count_depth{`low_val}};
                              end
        STATE_7_PLACEHOLDER :begin 
                             next_state = START;
                             count_next = {`count_depth{`low_val}};
                             end                              
        //default : next_state = START;               
        endcase    
    end

endmodule
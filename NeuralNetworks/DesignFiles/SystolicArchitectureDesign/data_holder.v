// This module holds matrix elements into a register bank

`include "register_bank_8byte.v"
`define low_val 1'b0
`define bank_depth 8
`define data_width 8
`define select 8


module rom_data_holder
                    ( input clk, 
                      input reset,
                      input enable,
                      input [`select -1 : 0] select_line, 
                      input [`data_width-1:0] data_in,
                      output [`bank_depth-1:0]out_data
                    );


// module instantiation

register_bank_8byte r_0
                    ( .clk(clk),
                      .reset(reset),
                      .enable(enable),
                      .select_line(select_line[7:0]), 
                      .data_in(data_in),
                      .out_data(out_data)
                    );


endmodule
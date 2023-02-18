
// module acts as a register bank : 512 bits
`include "register_8bit.v" 
`define low_val 1'b0
`define bank_depth 8
`define data_width 8
`define select 8
	

// defining new data_type

`define num_data_out [`bank_depth][`data_width] 

module register_bank_8byte
                    ( input clk, 
                      input reset,
                      input enable,
                      input [`select -1 : 0] select_line, 
                      input [`data_width-1:0] data_in,
                      output [`bank_depth-1:0][`data_width-1:0]out_data
                    );


// Sample input data
reg [`data_width-1 : 0] sample_data_in;
reg [`bank_depth-1:0] w_data_out;
reg [`bank_depth -1 :0] w_clk;
//reg [`bank_depth-1: 0] data_out;

always@(posedge clk , posedge reset)
    begin
        if (reset)
        sample_data_in <= {`data_width{`low_val}};
    else if(enable)
        sample_data_in <= data_in;
    end
    
    
    


// module instantiations to create a register bank of dimension 8 x 8 bits


register_8bit u0(
                    .clk(clk),
                    .reset(reset),
                    .enable(select_line[0]),
                    .data_in(sample_data_in),
                    .data_out(out_data[0])
                    );
register_8bit u1(
                   .clk(clk),
                   .reset(reset),
                   .enable(select_line[1]),
                   .data_in(sample_data_in),
                   .data_out(out_data[1])
                   );

register_8bit u2(
                   .clk(clk),
                   .reset(reset),
                   .enable(select_line[2]),
                   .data_in(sample_data_in),
                   .data_out(out_data[2])
                   );
register_8bit u3(
                  .clk(clk),
                  .reset(reset),
                  .enable(select_line[3]),
                  .data_in(sample_data_in),
                  .data_out(out_data[3])
                  );                  

register_8bit u4(
                  .clk(clk),
                  .reset(reset),
                  .enable(select_line[4]),
                  .data_in(sample_data_in),
                  .data_out(out_data[4])
                  );
register_8bit u5(
                 .clk(clk),
                 .reset(reset),
                 .enable(select_line[5]),
                 .data_in(sample_data_in),
                 .data_out(out_data[5])
                 );

register_8bit u6(
                 .clk(clk),
                 .reset(reset),
                 .enable(select_line[6]),
                 .data_in(sample_data_in),
                 .data_out(out_data[6])
                 );
register_8bit u7(
                .clk(clk),
                .reset(reset),
                .enable(select_line[7]),
                .data_in(sample_data_in),
                .data_out(out_data[7])
                );  

endmodule

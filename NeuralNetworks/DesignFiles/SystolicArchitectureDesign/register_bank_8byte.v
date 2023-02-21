// @vnay01
// module acts as a 8 Byte register bank
// select_line controls where the incoming byte is stored.


`include "register_8bit.v" 
`define low_val 1'b0
`define bank_depth 8
`define data_width 8
`define select 3
	

// defining new data_type

`define num_data_out [`bank_depth][`data_width] 

module register_bank_8byte
                    ( input clk, 
                      input reset,
                      input enable,
                      input [`select-1 : 0] select_line, 
                      input [`data_width-1:0] data_in,
                      output [`bank_depth-1:0][`data_width-1:0]out_data
                    );


// Sample input data
reg [`data_width-1 : 0] sample_data_in;
reg [`bank_depth-1:0] w_data_out;
reg [`bank_depth-1:0]register_select;

// logic to determince which register will be updated
always@(*)
begin
    case(select_line)
    3'b000 : register_select = 8'h01;
    3'b001 : register_select = 8'h02;
    3'b010 : register_select = 8'h04;
    3'b011 : register_select = 8'h08;
    3'b100 : register_select = 8'h10;
    3'b101 : register_select = 8'h20;
    3'b110 : register_select = 8'h40;
    3'b111 : register_select = 8'h80;
    default : register_select = 8'h00;      // default case . Use in debugging

    endcase

end


// register update block
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
                    .enable(register_select[0]),
                    .data_in(sample_data_in),
                    .data_out(out_data[0])
                    );
register_8bit u1(
                   .clk(clk),
                   .reset(reset),
                   .enable(register_select[1]),
                   .data_in(sample_data_in),
                   .data_out(out_data[1])
                   );

register_8bit u2(
                   .clk(clk),
                   .reset(reset),
                   .enable(register_select[2]),
                   .data_in(sample_data_in),
                   .data_out(out_data[2])
                   );
register_8bit u3(
                  .clk(clk),
                  .reset(reset),
                  .enable(register_select[3]),
                  .data_in(sample_data_in),
                  .data_out(out_data[3])
                  );                  

register_8bit u4(
                  .clk(clk),
                  .reset(reset),
                  .enable(register_select[4]),
                  .data_in(sample_data_in),
                  .data_out(out_data[4])
                  );
register_8bit u5(
                 .clk(clk),
                 .reset(reset),
                 .enable(register_select[5]),
                 .data_in(sample_data_in),
                 .data_out(out_data[5])
                 );

register_8bit u6(
                 .clk(clk),
                 .reset(reset),
                 .enable(register_select[6]),
                 .data_in(sample_data_in),
                 .data_out(out_data[6])
                 );
register_8bit u7(
                .clk(clk),
                .reset(reset),
                .enable(register_select[7]),
                .data_in(sample_data_in),
                .data_out(out_data[7])
                );  

endmodule

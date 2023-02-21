// @vnay01
////////////////////////////////////////////////
//////////// register bank to store input matrix
////////////////////////////////////////////////
`include "register_bank_8byte.v"


module input_mat_reg_bank(
            input clk,
            input reset,
            input [`select-1:0] select_line,
            input [`data_width-1:0] data_in,
            output reg [`bank_depth-1:0][`bank_depth-1:0][`data_width-1:0] out_data
            );


// Internal wirings
reg [`data_width-1 : 0] sample_data_in;
reg [`bank_depth-1:0] w_data_out;
reg [`bank_depth-1:0] bank_select;

// sample input data
always@(posedge clk, posedge reset)
begin
    if(reset)
    sample_data_in <= {`data_width{`low_val}};
    else if(enable)
    sample_data_in <= data_in;
end

// register bank selection logic
always@(*)
begin
    case(select_line)
    3'b000 : bank_select = 8'h01;
    3'b001 : bank_select = 8'h02;
    3'b010 : bank_select = 8'h04;
    3'b011 : bank_select = 8'h08;
    3'b100 : bank_select = 8'h10;
    3'b101 : bank_select = 8'h20;
    3'b110 : bank_select = 8'h40;
    3'b111 : bank_select = 8'h80;
    default : bank_select = 8'h00;      // default case . Use in debugging

    endcase
end


// module instantiations to create 64 byte register bank
// each instantiation will store 8 elements of the input matrix

register_bank_8byte rb_0 (
                            .clk(clk),
                            .reset(reset),
                            .enable(bank_select[0]),
                            .select_line(select_line),
                            .data_in(data_in),
                            .out_data(out_data[0])
                            );
register_bank_8byte rb_1 (
                            .clk(clk),
                            .reset(reset),
                            .enable(bank_select[1]),
                            .select_line(select_line),
                            .data_in(data_in),
                            .out_data(out_data[1])
                            );
register_bank_8byte rb_2 (
                            .clk(clk),
                            .reset(reset),
                            .enable(bank_select[2]),
                            .select_line(select_line),
                            .data_in(data_in),
                            .out_data(out_data[2])
                            );
register_bank_8byte rb_3 (
                            .clk(clk),
                            .reset(reset),
                            .enable(bank_select[3]),
                            .select_line(select_line),
                            .data_in(data_in),
                            .out_data(out_data[3])
                            );
register_bank_8byte rb_4 (
                            .clk(clk),
                            .reset(reset),
                            .enable(bank_select[4]),
                            .select_line(select_line),
                            .data_in(data_in),
                            .out_data(out_data[4])
                            );
register_bank_8byte rb_5 (
                            .clk(clk),
                            .reset(reset),
                            .enable(bank_select[5]),
                            .select_line(select_line),
                            .data_in(data_in),
                            .out_data(out_data[5])
                            );
register_bank_8byte rb_6 (
                            .clk(clk),
                            .reset(reset),
                            .enable(bank_select[6]),
                            .select_line(select_line),
                            .data_in(data_in),
                            .out_data(out_data[6])
                            );
register_bank_8byte rb_7 (
                            .clk(clk),
                            .reset(reset),
                            .enable(bank_select[7]),
                            .select_line(select_line),
                            .data_in(data_in),
                            .out_data(out_data[7])
                            );                                                                                                                                                                                                    

endmodule

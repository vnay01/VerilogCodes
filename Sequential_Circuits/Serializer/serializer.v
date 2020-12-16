// Serializer

`include "ring_counter.v"
`include "mux1641.v"


module serializer(
					output data_out,
					input [N:0]data_in
				);
parameter N=15;
reg [15:0]data_in_mux;
wire [3:0] select_in;

// module instantiations
ring_counter counter_sel_in (.clk(),.init(),.count(select_in));

mux16to1 mux_serializer(.in(data_in),.sel(select_in),.out(data_out));

endmodule


// test bench
 module tb_serialzer;
 reg [15:0] i_data_in;
 wire o_data_out;
 
 // DUT
 serializer tb_serializer(.data_out(o_data_out),.data_in(i_data_in));
 
 // Stimulus
	
	initial
		begin
			$monitor($time,"data_in: %4h data_out: %b",i_data_in,o_data_out);
			$dumpfile("serializer.vcd");
			$dumpvars(0,tb_serializer);
			end
	initial
	begin
			#0 i_data_in=16'h0000;
			#5 i_data_in=16'h1111;
			#5 i_data_in=16'h0000;
			#5 $finish;
		end
endmodule

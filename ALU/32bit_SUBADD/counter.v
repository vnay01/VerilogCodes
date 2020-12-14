// counter : N-bit

module counter #(parameter N=7)(
								output reg [0:N] count,
								input clear,clock
								);
				
				
				
			always @(negedge clock) begin
				if(clear)
					count <= 0;
				else
					count <= count+1;
					end
endmodule

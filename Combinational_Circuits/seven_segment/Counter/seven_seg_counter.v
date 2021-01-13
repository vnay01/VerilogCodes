// 7 - segment LED display controller

module seven_segment_LED_display_controller(
											input clk,
											input wire [15:0] sw,
											output reg [3:0] an,
											output reg [0:6] seg
											);
			reg [19:0] one_second_counter;
			wire one_second_enable;
			reg [15:0] displayed_number;
			reg[3:0] LED_BCD;
			reg [19:0] refresh_counter;
			//net [15:0] sw;			
			wire [1:0] LED_activating_counter;
//assign reset = ~sw[15];

always@(posedge clk or posedge sw[15])
begin
	if(sw[15]==1)
	one_second_counter<=0;
	else begin
		if(one_second_counter>=9999)
			one_second_counter<=0;
			else
			one_second_counter<=one_second_counter+1;
			end
end
begin
assign one_second_enable =(one_second_counter==99999)?1:0;
end
// reset condition display
always@(posedge clk or posedge sw[15])
begin
if(sw[15]==1)
displayed_number<=0;
else if(one_second_enable==1)
	displayed_number<=displayed_number+1;
end

always@(posedge clk or posedge sw[15])
begin 
if(sw[15] == 1)
	refresh_counter <=0;
	else 
	refresh_counter<= refresh_counter+1;
end
// Anode activating signals for the 4 LEDS
assign LED_activating_counter = refresh_counter[19:18];

always@(*)
begin
	case(LED_activating_counter)
		2'b00:begin
			an=4'b0111;
			LED_BCD=displayed_number/1000;
			end
		2'b01: begin
			an=4'b1011;
			LED_BCD=(displayed_number%1000)/100;
			end
		2'b10: begin
			an=4'b1101;
			LED_BCD=((displayed_number%1000)%100)/10;
			end
		2'b11: begin
			an=4'b1110;
			LED_BCD=((displayed_number%1000)%100)%10;
			end
		endcase
	end
// Cathode Patterns 
always@(*)
	begin
		case(LED_BCD)
		4'b0000: seg[0:6]=7'b0000001; //"0"
		4'b0001: seg[0:6]=7'b1001111; // "1"
		4'b0010: seg[0:6]=7'b0010010; //"2"
		4'b0011: seg[0:6]=7'b0000110; //"3"
		4'b0100: seg[0:6]=7'b1001100; //"4"
		4'b0101: seg[0:6]=7'b0100100; //"5"
		4'b0110: seg[0:6]=7'b0100000; //"6"
		4'b0111: seg[0:6]=7'b0001111; //"7"
		4'b1000: seg[0:6]=7'b0000000; //"8"
		4'b1001: seg[0:6]=7'b0000100; //"9"
		default: seg[0:6]=7'b0000001; //"0"
	endcase
end
endmodule
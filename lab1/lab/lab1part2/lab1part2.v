module lab1part2 (input [3:0] SW, output [6:0] HEX0);

	wire [6:0]hex_LEDs;
	seven_seg_decoder decode(.x(SW), .hex_LEDs(hex_LEDs));
	
	assign HEX0 = hex_LEDs;

endmodule
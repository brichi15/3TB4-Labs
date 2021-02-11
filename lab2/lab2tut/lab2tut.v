module lab2tut (input CLOCK_50, input [2:0] KEY, output [6:0] HEX0, HEX1, HEX2,
HEX3, HEX4, HEX5);

	wire clock_div_out;
	wire counter_out;
	
	clock_divider cl1 (	.clock(CLOCK_50), 
								.reset(KEY[0]), 
								.clk_ms(clock_div_out));
	
	counter co1 		(	.clock(clock_div_out),
								.reset(KEY[0]),
								.start(KEY[2]),
								.stop(KEY[1])
								.ms_count(counter_out));
								


endmodule

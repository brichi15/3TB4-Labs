module lab2tut (input CLOCK_50, input [2:0] KEY, output [6:0] HEX0, HEX1, HEX2,
HEX3, HEX4, HEX5);

	wire clock_1_khz;					//clock divider output
	wire [19:0] counter_hex;			//counter output
			
	//bcd outputs
	wire [3:0] bcd0;
	wire [3:0] bcd1;
	wire [3:0] bcd2;
	wire [3:0] bcd3;
	wire [3:0] bcd4;
	wire [3:0] bcd5;
	
	//display outputs
	wire [6:0] d0;
	wire [6:0] d1;
	wire [6:0] d2;
	wire [6:0] d3;
	wire [6:0] d4;
	wire [6:0] d5;
	
	//assign displays
	
	assign HEX0 = d0;
	assign HEX1 = d1;
	assign HEX2 = d2;
	assign HEX3 = d3;
	assign HEX4 = d4;
	assign HEX5 = d5;
	
	
	clock_divider 		  cl1(.clock(CLOCK_50), 
									.reset(KEY[0]), 
									.clk_ms(clock_1_khz));
	
	counter 				  co1(.clock(clock_1_khz),
									.reset(KEY[0]),
									.start(KEY[2]),
									.stop(KEY[1]),
									.ms_count(counter_hex));
								
	hex_to_bcd_converter	h1(.clock(clock_1_khz),
									.hex_number(counter_hex),
									.bcd_digit_0(bcd0),
									.bcd_digit_1(bcd1),
									.bcd_digit_2(bcd2),
									.bcd_digit_3(bcd3),
									.bcd_digit_4(bcd4),
									.bcd_digit_5(bcd5));
									
	seven_seg_decoder 	s0(.x(bcd0), .hex_LEDs(d0));
	seven_seg_decoder 	s1(.x(bcd1), .hex_LEDs(d1));
	seven_seg_decoder 	s2(.x(bcd2), .hex_LEDs(d2));
	seven_seg_decoder 	s3(.x(bcd3), .hex_LEDs(d3));
	seven_seg_decoder 	s4(.x(bcd4), .hex_LEDs(d4));
	seven_seg_decoder 	s5(.x(bcd5), .hex_LEDs(d5));
								


endmodule

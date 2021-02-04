module lab1part1(input [3:0] x, output [6:0] hex_LEDs);
	reg [6:0] reg_LEDs;
	
	assign hex_LEDs[0]= (x[3]&x[1]) | (x[2]&!x[1]&!x[0]) | (!x[3]&!x[2]&!x[1]&x[0]);
	assign hex_LEDs[1]= (x[3]&x[1]) | (x[3]&x[2]&!x[0]) | (x[2]&x[1]&!x[0]) | (!x[3]&x[2]&!x[1]&x[0]);
	
	assign hex_LEDs[6:2]=reg_LEDs[6:2];
	
	always @(*)
	begin
		case (x)
			4'b0000: reg_LEDs[6:2]=5'b10000; //7'b1000000 decimal 0
			4'b0001: reg_LEDs[6:2]=5'b11110; //7'b1111001 decimal 1
			4'b0010: reg_LEDs[6:2]=5'b01001; //7'b0100100 decimal 2
			4'b0011: reg_LEDs[6:2]=5'b01100; //7'b0110000 decimal 3
			4'b0100: reg_LEDs[6:2]=5'b00110; //7'b0011001 decimal 4
			4'b0101: reg_LEDs[6:2]=5'b00100; //7'b0010010 decimal 5
			4'b0110: reg_LEDs[6:2]=5'b00000; //7'b0000010 decimal 6
			4'b0111: reg_LEDs[6:2]=5'b11110; //7'b1111000 decimal 7
			4'b1000: reg_LEDs[6:2]=5'b00000; //7'b0000000 decimal 8
			4'b1001: reg_LEDs[6:2]=5'b00100; //7'b0010000 decimal 9
			4'b1010: reg_LEDs[6:2]=5'b00000; //7'b0000011 char	   b
			4'b1011: reg_LEDs[6:2]=5'b01011; //7'b0101111 char 	r
			4'b1100: reg_LEDs[6:2]=5'b10011; //7'b1001111 char	   I
			4'b1101: reg_LEDs[6:2]=5'b00010; //7'b0001000 char    A
			4'b1110: reg_LEDs[6:2]=5'b01010; //7'b0101011 char    n
			4'b1111: reg_LEDs[6:2]=5'b11111; //7'b1111111 			OFF
		endcase
	end
endmodule

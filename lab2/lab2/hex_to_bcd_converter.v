module hex_to_bcd_converter(	input wire clock, 
										input wire [19:0] hex_number,
										output [3:0] bcd_digit_0,bcd_digit_1,bcd_digit_2,bcd_digit_3, bcd_digit_4, bcd_digit_5);
										
// DE1-SoC has 6 7_seg_LEDs, 20 bits can represent decimal 999999.
//This module is designed to convert a 20 bit binary representation
//to BCD
	integer i, k;
	wire [19:0] hex_number1; // the last 20 bits of input hex_number
	reg [3:0] bcd_digit [5:0]; //simplifies program
	assign hex_number1=hex_number[19:0];
	assign bcd_digit_0=bcd_digit[0];
	assign bcd_digit_1=bcd_digit[1];
	assign bcd_digit_2=bcd_digit[2];
	assign bcd_digit_3=bcd_digit[3];
	assign bcd_digit_4=bcd_digit[4];
	assign bcd_digit_5=bcd_digit[5];
	always @ (*) begin
		
		for (i=5; i>=0; i=i-1)begin		//set all 6 digits to 0
			bcd_digit[i] = 4'b0;
		end
		
		//shift 20 times
		for (i=19; i>=1; i=i-1) begin
		
			bcd_digit[0] = bcd_digit[0] + hex_number1[i];
		//check all 6 BCD tetrads, if >=5 then add 3
			for (k=5; k>=0; k=k-1) begin
				if (bcd_digit[k] >= 4'd5)begin
					bcd_digit[k] = bcd_digit[k] + 4'd3;
				end
			end
			//shift one bit of BIN/HEX left
			//for the first 5 tetrads
			for (k=5; k>=1; k=k-1) begin
				bcd_digit[k]=bcd_digit[k] << 1;
				bcd_digit[k][0]=bcd_digit[k-1][3];
			end
		//shift one bit of BIN/HEX left, for the last tetrad
		
			bcd_digit[0]=bcd_digit[0] << 1;
		end //end for loop
		
		bcd_digit[0] = bcd_digit[0] + hex_number1[0];	 // add last bit
		
	end //end of always.
endmodule
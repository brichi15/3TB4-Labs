module test ( input 	CLOCK50,
							[3:0]KEY,		//0-p1, 1-reset, 2-resume 3-p2
			output reg 	counter_reset,
							counter_start,
							counter_stop,
							rng_resume,
							[1:0] MUL_sel,
							[4:0] LED1,
							[9:5] LED2);

							
	reg [2:0] PS = 3'b0; 
	reg [2:0] NS = 3'b0;
		
	always @(posedge clk)begin
		
		if(!reset)
			PS <= 3'b0;
		else
			PS <= NS;
	end
	
	
	always @(PS,reset,resume,p1,p2,counter,rnd_ready)begin
	
		case(PS)
		
			3'b000:
				counter_reset <= 1'b0;
				LED1 <= 5'b0;	
				LED2 <= 5'b0;							//LEDRs
				NS <= 3'b001;
				
			
			3'b001:
				MUL_sel <= 2'b10;				// 10 sel for blinking
				rng_resume <= 1'b0;
				counter_reset <= 1'b1;
				NS <= 3'b110;
			
			3'b110:
				if(counter >= 3000 && rnd_ready)
					MUL_sel <= 2'b11;						//all hex off
					counter_reset = 1'b0;
					NS <= 3'b010;
				else
					NS <= 3'b110;
						
	
			3'b010:
				counter_reset = 1'b1;
				if(counter < random)
					NS <= 3'b010;
				else
					counter_reset = 1'b0;
					MUL_sel <= 2'b00;
					NS < = 3'b011;
			3'b011:
				
				if(!p1):
					LED1 = LED1 << 1;
					LED1 = LED1 + 1'b1;
					counter_stop <= 1'b0;
					NS <= 3'b100;
				else if(!p2)
					LED2 = LED2 >> 1;
					LED2 = LED2 + 5'b10000;
					counter_stop <= 1'b0;
					NS <= 3'b100;
				else
					NS <= 3'b011
					
			
			3'b100:
				if(!resume)
					NS <= 3'b001;
				else
					NS <= 3'b100;
			
			3'b101:
		
			default:		
		
		endcase
	
	end
							
endmodule
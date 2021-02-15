module test ( input 	clock,
							reset,
							resume,
							p1,
							p2,
							counter,
							rnd_ready, 
			output reg 	counter_pause, 
							counter_reset,
							rng_resume,
							[1:0] MUL_sel,
							[19:0] output_num, 
							[9:0] LEDs);

							
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
				counter_reset = 1'b0;
				LEDs = 10'b0;
				NS = 3'b001;
			
			3'b001:
			
			3'b010:
			
			3'b011:
			
			3'b100:
			
			3'b101:
		
			default:		
		
		endcase
	
	end
							
endmodule
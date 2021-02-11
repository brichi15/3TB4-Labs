module clock_divider (input clock, reset, output reg clk_ms);

	parameter factor=50000;
	reg [31:0] countQ;
	
	always @ (negedge clock, negedge reset) begin
	
		if (!reset) begin
			countQ <= 32'b0;
		end else if (countQ==factor-1) begin
			countQ <= 32'b0;
			
		end else begin
			
			if (countQ<factor/2) begin
				clk_ms <= 1'b0;
				
			end else begin
				clk_ms <= 1'b1;
			end 
			countQ <= countQ + 32'b1;
		end
	end
endmodule

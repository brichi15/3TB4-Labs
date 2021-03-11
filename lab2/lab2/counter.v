module counter(input clock, reset, resume, enable, output reg [19:0] ms_count);
	
	always@(posedge clock, negedge reset, negedge resume) begin
	
		if (!reset || !resume)
			ms_count <= 1'b0;
		else if (enable)
			ms_count <= ms_count + 1'b1;
		else
			ms_count <= ms_count;
	end
endmodule
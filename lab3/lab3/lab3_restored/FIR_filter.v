module FIR_filter (input clk, input [15:0] input_sample, input [7:0] taps, output [15:0] output_sample);
	// PAY ATTENTION: THE NEXT LINE IS COUNTERINTUITIVE, BUT CORRECT!
	wire [15:0] coeffs [15:0];
	reg [15:0] cascade [15:0];	//cascading input
	wire [15:0] res [15:0];
	
	assign output_sample =  res[ 0]+
									res[ 1]+
									res[ 3]+
									res[ 4]+
									res[ 5]+
									res[ 6]+
									res[ 7]+
									res[ 8]+
									res[ 9]+
									res[10]+
									res[11]+
									res[12]+
									res[13]+
									res[14]+
									res[15];
									

	assign coeffs[ 0]=        -1;
	assign coeffs[ 1]=      6376;
	assign coeffs[ 2]=        -1;
	assign coeffs[ 3]=     -3652;
	assign coeffs[ 4]=         0;
	assign coeffs[ 5]=      4174;
	assign coeffs[ 6]=        	2;
	assign coeffs[ 7]=     28404;
	assign coeffs[ 8]=         2;
	assign coeffs[ 9]=      4174;
	assign coeffs[10]=         0;
	assign coeffs[11]=     -3652;
	assign coeffs[12]=        -1;
	assign coeffs[13]=      6376;
	assign coeffs[14]=        -1;
	assign coeffs[15]=         0;


	genvar i;
	generate
		for(i=0;i<16;i=i+1) begin: multiply
			multiplier (cascade[i],coeffs[i],res[i]);
		end
	endgenerate

	integer j;
	always @(posedge clk)
	begin
		cascade[0] <= input_sample;
		
		for(j=0;j<14;j=j+1)begin
			cascade[j+1]<=cascade[j];
		end

	end
endmodule
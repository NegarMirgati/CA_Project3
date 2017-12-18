`timescale 1ns / 1ns 
module Register16 (input clk ,input rst , input [15:0]data_in , output  [15:0] data_out );

reg [15:0]  data ;

always @ (posedge clk , posedge rst) begin
	if(rst)
	data<= 16'd0;

	data <= data_in ;

end


assign data_out = data ;




endmodule 
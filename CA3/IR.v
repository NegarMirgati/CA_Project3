`timescale 1ns/1ns
module IR(input clk,input rst , input [15:0] data_in , input IRwrite ,output [15:0] inst,output [12:0] addr) ;

reg[15:0] data ;
always @ (posedge clk ) begin
 if (rst)
	data<= 16'd0;
 if(IRwrite )
	data <= data_in ;
end
  

assign inst = data;
assign addr=  data[12:0];
endmodule
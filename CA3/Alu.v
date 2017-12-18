`timescale 1ns/1ns
module Alu ( input [15:0] in1 , input[15:0] in2 , input [2:0] alucrtl ,output reg[15:0] out , output reg zero);
 

always@ ( in1 , in2 , alucrtl ) begin 

case (alucrtl) 

3'b000:
	out<= in1 + in2 ;

3'b001:
	out<= in1 - in2 ;

3'b010:
	out<= in1 & in2 ;

3'b011:

	out<= ~(in1) ;
3'b111:
	zero <= (in1==16'd0) ? 1 : 0 ;
default:
	out<= 16'b0;
endcase
end


endmodule
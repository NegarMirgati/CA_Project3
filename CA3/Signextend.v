`timescale 1ns/1ns
module Signextend #(parameter inLen=13, outLen=16)(input [inLen-1:0] in,output [outLen-1:0] out);
 
assign out = (in[12] == 0 ) ? {3'b000 , in } : {3'b111 , in } ;
 
endmodule
`timescale 1ns/1ns
module Mux2to1 #(parameter len) (input [len-1:0] in1, in2, input sel , output [len-1:0] out);
  assign out = (sel) ? in2 : in1;
endmodule

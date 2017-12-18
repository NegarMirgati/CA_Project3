`timescale 1ns/1ns
module Pc(input [12:0] in, input pcwrite, rst, clk, output [12:0] out);
reg[12:0] pc ;
 always@(posedge clk , posedge rst) begin
    if (rst)
      pc <= 13'd0;
    else if (pcwrite)
      pc <= in;
  end

assign out = pc ;

endmodule

`timescale 1ns/1ns
module tb();
  reg clk = 0;
  reg rst = 0;
  Cpu cpu(.clk(clk) , .rst(rst));
  initial begin 
    #50
    rst = 1;
    #100
    clk = ~clk;
    #1000
    clk = ~clk;
    #1000
    rst = 0;
    repeat(1000) #1000 clk = ~clk;
  end
endmodule

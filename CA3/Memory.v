`timescale 1ns/1ns
module Memory ( input clk , input memread , input memwrite , input [12:0] addr , input rst,
		input [15:0] data_in , output reg [15:0] data_out);


reg [15:0] dataMem [8191:0];

initial  begin 
/*dataMem[0] = 16'd100;
dataMem[1] = 16'd101;*/
/*dataMem[2] = 16'b0000000001100110;
dataMem[3] = 16'b0000000001100111;
dataMem[4] = 16'b0000000001101000;
dataMem[5] = 16'b0000000001101001;
dataMem[6] = 16'b0000000001101010;
dataMem[7] = 16'b0000000001101011;
dataMem[8] = 16'b0000000001101100;
dataMem[9] = 16'b0000000001101101;
dataMem[10]= 16'b1000000001101110;
dataMem[11]= 16'b1110000000000000;
dataMem[2] = 16'b1010000001100110;
dataMem[3] = 16'b1000000001100100;
dataMem[4] = 16'b1000000001100110;
dataMem[4]=  16'b1100000000000000;
dataMem[4]=  16'b1110000000000001;
dataMem[5] = 16'b1000000001100110;
dataMem[100] = 16'b0000000000000000;
dataMem[101] = 16'b0000000000000110;
dataMem[102] = 16'b0000000000000011;
dataMem[103] = 16'b0000000000000110;
dataMem[104] = 16'b0000000000000101;
dataMem[105] = 16'b0000000000000110;
dataMem[106] = 16'b0000000000000111;
dataMem[107] = 16'b0000000000001001;
dataMem[108] = 16'b0000000000001001;
dataMem[109] = 16'b0000000000001011;
dataMem[110] = 16'b0000000000000000;*/
dataMem[0] = 16'b0000000001100100;
dataMem[1] = 16'b0000000001100101;
dataMem[2] = 16'b0000000001100110;
dataMem[3] = 16'b0000000001100111;
dataMem[4] = 16'b0000000001101000;
dataMem[5] = 16'b0000000001101001;
dataMem[6] = 16'b0000000001101010;
dataMem[7] = 16'b0000000001101011;
dataMem[8] = 16'b0000000001101100;
dataMem[9] = 16'b0000000001101101;
dataMem[100] = 16'b0000000000000001;
dataMem[101] = 16'b0000000000000010;
dataMem[102] = 16'b0000000000000011;
dataMem[103] = 16'b0000000000000100;
dataMem[104] = 16'b0000000000000101;
dataMem[105] = 16'b0000000000000110;
dataMem[106] = 16'b0000000000000111;
dataMem[107] = 16'b0000000000001000;
dataMem[108] = 16'b0000000000001001;
dataMem[109] = 16'b0000000000001010;
end

integer i;
always@(posedge clk , posedge rst) begin
   /* if (rst) begin
	for (i=0;i<8191 ; i=i+1)
		dataMem[i]=16'd0;
end*/
	
    if (memwrite)
      dataMem[addr] <= data_in;
	
  end

  always@(addr, memread) begin
    if (memread)
      data_out <= dataMem[addr];

end

endmodule
module Cpu (input clk , input rst );
wire IRwrite , memread , memwrite , pcwrite , pcsrc , alusrc1 , alusrc2 , accwrite , memtoacc , iord ,zero;
wire [2:0] alucrtl;
wire [15:0] inst ;
Datapath dp(clk,rst,IRwrite,memread,memwrite,pcwrite ,pcsrc,alusrc1,alusrc2,alucrtl,accwrite,memtoacc ,iord ,inst,zero);
Controller c(.Clk(clk),.Reset(rst),.zero(zero),.inst(inst),.ALUCtrl(alucrtl) ,.ALUSrcA(alusrc1),
.ALUSrcB(alusrc2),.PCSource(pcsrc),.PCWrite(pcwrite),.IorD(iord), .MemRead(memread), .MemWrite(memwrite), 
.MemtoAcc(memtoacc), .IRWrite(IRwrite),.AccWrite(accwrite));


endmodule
 

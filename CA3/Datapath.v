module Datapath(input clk , input reset, 
input IRwrite , 
input memread , input memwrite,
input pcwrite , input pcsrc ,
input alusrc1 , input alusrc2 , input[2:0] alucrtl ,
input accwrite ,
input memtoacc ,
input iord , output[15:0] inst, 
output zero);

wire [12:0] newpc ;
wire [15:0] mdr_o;
wire [15:0] A_o;
wire [15:0] alumux1_o;
wire [15:0] alumux2_o;
wire [15:0] alures;
wire [15:0] alureg_o ;
wire [15:0] memtoaccmux_o ;
wire [12:0] iordmux_o ;
wire [12:0] pcmux_o;
wire [15:0] acc_o ;
wire [15:0] memory_o ;
wire [12:0] addr;
wire [15:0] alusrc1_in1;

Memory mem(.clk(clk),.rst(reset),.data_in(A_o),.data_out(memory_o),.memread(memread),.memwrite(memwrite),.addr(iordmux_o));
Pc pc (.in(pcmux_o),.clk(clk),.rst(reset),.out(newpc),.pcwrite(pcwrite));
Register16 mdr(.clk(clk),.rst(reset),.data_in(memory_o),.data_out(mdr_o));
Register16 A(.clk(clk),.rst(reset),.data_in(acc_o) , .data_out(A_o));
Register16 aluout(.clk(clk),.rst(reset),.data_in(alures) , .data_out(alureg_o));
IR ir (.clk(clk),.rst(reset),.data_in(memory_o),.inst(inst),.addr(addr),.IRwrite(IRwrite));
Acc acc(.clk(clk),.rst(reset),.data_in(memtoaccmux_o),.data_out(acc_o),.accwrite(accwrite));
Mux2to1 # (16) alumux1 (.in1(alusrc1_in1) , .in2 (A_o) ,.sel(alusrc1), .out(alumux1_o));
Mux2to1 # (16) alumux2 (.in1(16'd1) , .in2 (mdr_o) ,.sel(alusrc2), .out(alumux2_o));
Mux2to1 # (16) memtoaccmux (.in1(alureg_o) , .in2 (mdr_o) ,.sel(memtoacc), .out(memtoaccmux_o));
Mux2to1 # (13) iordmux (.in1(newpc) , .in2 (addr) ,.sel(iord), .out(iordmux_o));
Mux2to1 # (13) pcmux (.in1(alures[12:0]) , .in2 (addr) ,.sel(pcsrc), .out(pcmux_o));
Alu malu (alumux1_o ,alumux2_o ,alucrtl ,alures,zero);
Signextend sgn (newpc , alusrc1_in1);


endmodule

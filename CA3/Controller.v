`timescale 1ns/1ns
module Controller(input Clk,Reset,zero,input [15:0]inst,output reg [2:0]ALUCtrl , output reg ALUSrcA,ALUSrcB,PCSource,PCWrite,IorD, MemRead, MemWrite, MemtoAcc, IRWrite,AccWrite);

reg[2:0]state;
reg[2:0] nextstate;
wire[2:0]Op = inst[15:13];

parameter State0=0;
parameter State1=1;
parameter State2=2;
parameter State3=3;
parameter State4=4;
parameter State5=5;
parameter State6=6;
parameter State7=7;


 always@(posedge Clk , posedge Reset) begin
 if (Reset) state <= 3'b000;
 else  state <= nextstate;

 end

 always @(state, Op) begin
nextstate = 3'b000;
 	case(state)
       State0: begin
 	MemRead=1;
 	IorD= 0;
 	IRWrite=1;
	/**/ AccWrite = 0 ;
	/**/ MemWrite = 0 ;
 	ALUSrcA=0;
 	ALUSrcB=0;
 	ALUCtrl = 3'b000; //add 
 	PCWrite=1;
 	PCSource=0;

 	nextstate=State1;
	end

	State1: begin
	/**/ AccWrite = 0 ;
	/**/ MemWrite = 0 ;
	/**/ PCWrite = 0 ;
	/**/ IRWrite=0;
 	 IorD = 1;
 	 MemRead = 1;
 	if(Op==3'b101) begin //if op code is SDA
 	nextstate=State2;
 	end

 	if(Op==3'b100) begin //if op code is LDA
 	nextstate=State3;
 	end

 	if(Op==3'b111) begin // if op code is Jz
 	nextstate=State7;
 	end

 	if(Op== 3'b110) begin //if op code is Jm
 	nextstate=State6;
 	end

	if((Op==3'b000)||(Op==3'b001)||(Op==3'b010)||(Op==3'b011)) begin //if R-type Instruction
 	nextstate=State4;
 	end

	end

	State2: begin
	/**/ PCWrite = 0 ;
	/**/ AccWrite = 0 ;
	/**/ IRWrite=0;
	 MemWrite = 1;
 	 IorD = 1;
	 nextstate=State0;
	end

	State3: begin
	/**/ PCWrite = 0 ;
	/**/ IRWrite = 0;
	/**/ MemWrite = 0 ;
 	 MemtoAcc = 1;
 	 AccWrite = 1;
 	 nextstate=State0;
	end

       State4: begin
	/**/ PCWrite = 0;
	/**/ IRWrite = 0;
	/**/ AccWrite = 0;
	/**/ MemWrite = 0;
	ALUSrcA=1;
	ALUSrcB=1;
	if(Op==3'b000)
	ALUCtrl = 3'b000; //add 
	if(Op==3'b001)
	ALUCtrl = 3'b001; //sub
	if(Op==3'b010)
	ALUCtrl = 3'b010; //AND
	if(Op==3'b011)
	ALUCtrl = 3'b011; //NOT
	nextstate = State5;
       end

       State5: begin
	/**/ PCWrite = 0 ;
	/**/ IRWrite = 0 ;
	/**/ MemWrite = 0 ;
 	MemtoAcc = 0;
 	AccWrite = 1;
 	nextstate=State0;
       end

       State6: begin
	/**/ AccWrite = 0 ;
	/**/ IRWrite = 0;
	/**/ MemWrite = 0 ;
 	PCSource = 1;
 	PCWrite = 1;
 	nextstate = State0;
       end

       State7: begin
	/**/IRWrite = 0 ;
	/**/ AccWrite = 0 ;
	/**/ MemWrite = 0 ;
 	ALUSrcA=1;
 	ALUCtrl = 3'b111;
 	PCSource = 1;
 	#10 PCWrite = (zero)? 1:0; 
 	nextstate= State0;
       end

   endcase

 end


 endmodule

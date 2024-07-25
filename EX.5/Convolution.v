//==============================================
//==============================================				
//	Author	:	Wei Lu																		
//----------------------------------------------
//												
//	File Name		:	Conv_2x2.v					
//	Module Name		:	Con_2x2						
//	Release version	:	v1.0					
//												
//----------------------------------------------								
//----------------------------------------------											
//	Input	:	clk,
//				rst_n,
//              IFM,
//				Weights,					
//												
//	Output	:	OFM,
//				out_valid					
//==============================================
//==============================================
module Convolution(
    //Input Port
    clk,
    rst_n,
	in_valid,
	weight_valid,
	In_IFM_1,
	In_IFM_2,
	In_IFM_3,
	In_IFM_4,	
	In_IFM_5,	
	In_IFM_6,	
	In_IFM_7,	
	In_IFM_8,	
	In_IFM_9,	
	In_Weight_1,
	In_Weight_2,
	In_Weight_3,
	In_Weight_4,
	In_Weight_5,
	In_Weight_6,
	In_Weight_7,
	In_Weight_8,	
	In_Weight_9,
    //Output Port
    out_valid, 
	Out_OFM
    );

//---------------------------------------------------------------------
//   PORT DECLARATION
//---------------------------------------------------------------------
input clk, rst_n;
input in_valid;
input weight_valid;
input[7:0]In_IFM_1;
input[7:0]In_IFM_2;
input[7:0]In_IFM_3;
input[7:0]In_IFM_4;
input[7:0]In_IFM_5;
input[7:0]In_IFM_6;
input[7:0]In_IFM_7;
input[7:0]In_IFM_8;
input[7:0]In_IFM_9;
input[7:0]In_Weight_1;
input[7:0]In_Weight_2;
input[7:0]In_Weight_3;
input[7:0]In_Weight_4;
input[7:0]In_Weight_5;
input[7:0]In_Weight_6;
input[7:0]In_Weight_7;
input[7:0]In_Weight_8;
input[7:0]In_Weight_9;
output reg out_valid;
output reg [20:0]Out_OFM;
	
reg [7:0]Weight_1;
reg [7:0]Weight_2;
reg [7:0]Weight_3;
reg [7:0]Weight_4;
reg [7:0]Weight_5;
reg [7:0]Weight_6;
reg [7:0]Weight_7;
reg [7:0]Weight_8;
reg [7:0]Weight_9;

parameter IDLE=0,
          INPUT=1,
		  CAL=2,
		  OUPUT=3;

reg[1:0]state,next;

reg[15:0]MUL1;
reg[15:0]MUL2;
reg[15:0]MUL3;
reg[15:0]MUL4;
reg[15:0]MUL5;
reg[15:0]MUL6;
reg[15:0]MUL7;
reg[15:0]MUL8;
reg[15:0]MUL9;
reg[17:0]ADD1;
reg[17:0]ADD2;
reg[17:0]ADD3;

reg in_valid2,in_valid3;

always@(posedge clk)begin
	if(state==IDLE&&(~in_valid))begin
		Weight_1<=0;
		Weight_2<=0;
		Weight_3<=0;
		Weight_4<=0;
		Weight_5<=0;
		Weight_6<=0;
		Weight_7<=0;
		Weight_8<=0;
		Weight_9<=0;
	end
	else if(state==IDLE&&in_valid)begin
		Weight_1<=In_Weight_1;
		Weight_2<=In_Weight_2;
		Weight_3<=In_Weight_3;
		Weight_4<=In_Weight_4;
		Weight_5<=In_Weight_5;
		Weight_6<=In_Weight_6;
		Weight_7<=In_Weight_7;
		Weight_8<=In_Weight_8;
		Weight_9<=In_Weight_9;
	end
end

always@(posedge clk or negedge rst_n)begin
	if(~rst_n)begin
		in_valid2<=0;
		in_valid3<=0;
	end
	else begin
		in_valid2<=in_valid;
		in_valid3<=in_valid2;
	end
end

always@(posedge clk or negedge rst_n)begin
	if(~rst_n)state<=IDLE;
	else state<=next;
end

always@(*)begin
	case(state)
	IDLE:if(in_valid)next=INPUT;else next=IDLE;
	INPUT:if(in_valid)next=INPUT;else next=IDLE;
	default:next=IDLE;
	endcase
end

always@(posedge clk)begin
	if(state==IDLE&&in_valid)begin
		MUL1<=In_IFM_1*In_Weight_1;
		MUL2<=In_IFM_2*In_Weight_2;
		MUL3<=In_IFM_3*In_Weight_3;
		MUL4<=In_IFM_4*In_Weight_4;
		MUL5<=In_IFM_5*In_Weight_5;
		MUL6<=In_IFM_6*In_Weight_6;
		MUL7<=In_IFM_7*In_Weight_7;
		MUL8<=In_IFM_8*In_Weight_8;
		MUL9<=In_IFM_9*In_Weight_9;
	end
	else if(state==INPUT&&in_valid)begin
		MUL1<=In_IFM_1*Weight_1;
		MUL2<=In_IFM_2*Weight_2;
		MUL3<=In_IFM_3*Weight_3;
		MUL4<=In_IFM_4*Weight_4;
		MUL5<=In_IFM_5*Weight_5;
		MUL6<=In_IFM_6*Weight_6;
		MUL7<=In_IFM_7*Weight_7;
		MUL8<=In_IFM_8*Weight_8;
		MUL9<=In_IFM_9*Weight_9;
	end
	else begin
		MUL1<=0;
		MUL2<=0;
		MUL3<=0;
		MUL4<=0;
		MUL5<=0;
		MUL6<=0;
		MUL7<=0;
		MUL8<=0;
		MUL9<=0;
	end
end

always@(posedge clk)begin
	if(in_valid2)begin
		ADD1<=MUL1+MUL2+MUL3;
		ADD2<=MUL4+MUL5+MUL6;
		ADD3<=MUL7+MUL8+MUL9;
	end
	else begin
		ADD1<=0;
		ADD2<=0;
		ADD3<=0;
	end
end

always@(posedge clk or negedge rst_n)begin
	if(~rst_n)begin
		out_valid<=0;
		Out_OFM<=0;
	end

	else if(in_valid3)begin
		out_valid<=1;
		Out_OFM<=ADD1+ADD2+ADD3;
	end
	else begin
		out_valid<=0;
		Out_OFM<=0;
	end
end

endmodule
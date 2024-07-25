//synopsys translate_off
`include "../02_SYN/asap7sc7p5t_SEQ_RVT_TT_08302018.v"
//synopsys translate_on

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

reg [7:0]IFM_1;
reg [7:0]IFM_2;
reg [7:0]IFM_3;
reg [7:0]IFM_4;
reg [7:0]IFM_5;
reg [7:0]IFM_6;
reg [7:0]IFM_7;
reg [7:0]IFM_8;
reg [7:0]IFM_9;


parameter IDLE=0,
          INPUT=1;

reg[2:0]state,next;

reg[20:0]ans;
reg in_valid2,in_valid3;

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
	else if(weight_valid)begin
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

always @(posedge clk) begin
	if(in_valid) begin
		IFM_1 <= In_IFM_1;
		IFM_2 <= In_IFM_2;
		IFM_3 <= In_IFM_3;
		IFM_4 <= In_IFM_4;
		IFM_5 <= In_IFM_5;
		IFM_6 <= In_IFM_6;
		IFM_7 <= In_IFM_7;
		IFM_8 <= In_IFM_8;
		IFM_9 <= In_IFM_9;
	end else begin
		IFM_1 <= 0;
		IFM_2 <= 0;
		IFM_3 <= 0;
		IFM_4 <= 0;
		IFM_5 <= 0;
		IFM_6 <= 0;
		IFM_7 <= 0;
		IFM_8 <= 0;
		IFM_9 <= 0;
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
	if(state==IDLE&&(~in_valid))ans<=0;
	
	else if(in_valid2)begin
		ans<=IFM_1*Weight_1+
		     IFM_2*Weight_2+
			 IFM_3*Weight_3+
			 IFM_4*Weight_4+
			 IFM_5*Weight_5+
			 IFM_6*Weight_6+
			 IFM_7*Weight_7+
			 IFM_8*Weight_8+
			 IFM_9*Weight_9;
	end
end

always@(posedge clk or negedge rst_n)begin
	if(~rst_n)begin
		out_valid<=0;
		Out_OFM<=0;
	end

	else if(in_valid3)begin
		out_valid<=1;
		Out_OFM<=ans;
	end
	else begin
		out_valid<=0;
		Out_OFM<=0;
	end
end


endmodule
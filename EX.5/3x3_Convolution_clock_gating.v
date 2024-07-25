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

reg [7:0]Reg_IFM_1;
reg [7:0]Reg_IFM_2;
reg [7:0]Reg_IFM_3;
reg [7:0]Reg_IFM_4;
reg [7:0]Reg_IFM_5;
reg [7:0]Reg_IFM_6;
reg [7:0]Reg_IFM_7;
reg [7:0]Reg_IFM_8;
reg [7:0]Reg_IFM_9;

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



assign Enable_1 = (In_IFM_1 == 0)? 0:1;
assign Enable_2 = (In_IFM_2 == 0)? 0:1;
assign Enable_3 = (In_IFM_3 == 0)? 0:1;
assign Enable_4 = (In_IFM_4 == 0)? 0:1;
assign Enable_5 = (In_IFM_5 == 0)? 0:1;
assign Enable_6 = (In_IFM_6 == 0)? 0:1;
assign Enable_7 = (In_IFM_7 == 0)? 0:1;
assign Enable_8 = (In_IFM_8 == 0)? 0:1;
assign Enable_9 = (In_IFM_9 == 0)? 0:1;
assign Enable_10 = (In_Weight_1 == 0)? 0:1; 

ICGx3_ASAP7_75t_R GATED_1(
	.CLK(clk),
	.ENA(0),
	.SE(Enable_1),
	.GCLK(clk_gate_1)
);
ICGx3_ASAP7_75t_R GATED_2(
	.CLK(clk),
	.ENA(0),
	.SE(Enable_2),
	.GCLK(clk_gate_2)
);
ICGx3_ASAP7_75t_R GATED_3(
	.CLK(clk),
	.ENA(0),
	.SE(Enable_3),
	.GCLK(clk_gate_3)
);
ICGx3_ASAP7_75t_R GATED_4(
	.CLK(clk),
	.ENA(0),
	.SE(Enable_4),
	.GCLK(clk_gate_4)
);
ICGx3_ASAP7_75t_R GATED_5(
	.CLK(clk),
	.ENA(0),
	.SE(Enable_5),
	.GCLK(clk_gate_5)
);
ICGx3_ASAP7_75t_R GATED_6(
	.CLK(clk),
	.ENA(0),
	.SE(Enable_6),
	.GCLK(clk_gate_6)
);
ICGx3_ASAP7_75t_R GATED_7(
	.CLK(clk),
	.ENA(0),
	.SE(Enable_7),
	.GCLK(clk_gate_7)
);
ICGx3_ASAP7_75t_R GATED_8(
	.CLK(clk),
	.ENA(0),
	.SE(Enable_8),
	.GCLK(clk_gate_8)
);
ICGx3_ASAP7_75t_R GATED_9(
	.CLK(clk),
	.ENA(0),
	.SE(Enable_9),
	.GCLK(clk_gate_9)
);
ICGx3_ASAP7_75t_R GATED_10(
	.CLK(clk),
	.ENA(0),
	.SE(Enable_10),
	.GCLK(clk_gate_10)
);
reg Enable_1_t;
reg Enable_2_t;
reg Enable_3_t;
reg Enable_4_t;
reg Enable_5_t;
reg Enable_6_t;
reg Enable_7_t;
reg Enable_8_t;
reg Enable_9_t;

always @(posedge clk or negedge rst_n) begin
	if(~rst_n) begin
		Enable_1_t <= 0;
	end 
	else if(Enable_1) begin
		Enable_1_t <= 1;
	end
	else begin
		Enable_1_t <= 0;
	end
end
always @(posedge clk or negedge rst_n) begin
	if(~rst_n) begin
		Enable_2_t <= 0;
	end 
	else if(Enable_2) begin
		Enable_2_t <= 1;
	end
	else begin
		Enable_2_t <= 0;
	end
end
always @(posedge clk or negedge rst_n) begin
	if(~rst_n) begin
		Enable_3_t <= 0;
	end 
	else if(Enable_3) begin
		Enable_3_t <= 1;
	end
	else begin
		Enable_3_t <= 0;
	end
end
always @(posedge clk or negedge rst_n) begin
	if(~rst_n) begin
		Enable_4_t <= 0;
	end 
	else if(Enable_4) begin
		Enable_4_t <= 1;
	end
	else begin
		Enable_4_t <= 0;
	end
end
always @(posedge clk or negedge rst_n) begin
	if(~rst_n) begin
		Enable_5_t <= 0;
	end 
	else if(Enable_5) begin
		Enable_5_t <= 1;
	end
	else begin
		Enable_5_t <= 0;
	end
end
always @(posedge clk or negedge rst_n) begin
	if(~rst_n) begin
		Enable_6_t <= 0;
	end 
	else if(Enable_6) begin
		Enable_6_t <= 1;
	end
	else begin
		Enable_6_t <= 0;
	end
end
always @(posedge clk or negedge rst_n) begin
	if(~rst_n) begin
		Enable_7_t <= 0;
	end 
	else if(Enable_7) begin
		Enable_7_t <= 1;
	end
	else begin
		Enable_7_t <= 0;
	end
end
always @(posedge clk or negedge rst_n) begin
	if(~rst_n) begin
		Enable_8_t <= 0;
	end 
	else if(Enable_8) begin
		Enable_8_t <= 1;
	end
	else begin
		Enable_8_t <= 0;
	end
end
always @(posedge clk or negedge rst_n) begin
	if(~rst_n) begin
		Enable_9_t <= 0;
	end 
	else if(Enable_9) begin
		Enable_9_t <= 1;
	end
	else begin
		Enable_9_t <= 0;
	end
end

always @(posedge clk_gate_10 or negedge rst_n) begin
	if(~rst_n) begin
		Weight_1 <= 0;
		Weight_2 <= 0;
		Weight_3 <= 0;
		Weight_4 <= 0;
		Weight_5 <= 0;
		Weight_6 <= 0;
		Weight_7 <= 0;
		Weight_8 <= 0;
		Weight_9 <= 0;
	end
	else if(Enable_10)begin
		Weight_1 <= In_Weight_1;
		Weight_2 <= In_Weight_2;
		Weight_3 <= In_Weight_3;
		Weight_4 <= In_Weight_4;
		Weight_5 <= In_Weight_5;
		Weight_6 <= In_Weight_6;
		Weight_7 <= In_Weight_7;
		Weight_8 <= In_Weight_8;
		Weight_9 <= In_Weight_9;
	end 
	else begin
		Weight_1 <= Weight_1;
		Weight_2 <= Weight_2;
		Weight_3 <= Weight_3;
		Weight_4 <= Weight_4;
		Weight_5 <= Weight_5;
		Weight_6 <= Weight_6;
		Weight_7 <= Weight_7;
		Weight_8 <= Weight_8;
		Weight_9 <= Weight_9;
	end
end

always @(posedge clk_gate_1 or negedge rst_n) begin
	if(~rst_n) begin
		Reg_IFM_1 <= 0;
	end
	else if(Enable_1)begin
		Reg_IFM_1 <= In_IFM_1;
	end 
	else begin
		Reg_IFM_1 <= Reg_IFM_1;
	end
end
always @(posedge clk_gate_2 or negedge rst_n) begin
	if(~rst_n) begin
		Reg_IFM_2 <= 0;
	end
	else if(Enable_2)begin
		Reg_IFM_2 <= In_IFM_2;
	end 
	else begin
		Reg_IFM_2 <= Reg_IFM_2;
	end
end
always @(posedge clk_gate_3 or negedge rst_n) begin
	if(~rst_n) begin
		Reg_IFM_3 <= 0;
	end
	else if(Enable_3)begin
		Reg_IFM_3 <= In_IFM_3;
	end 
	else begin
		Reg_IFM_3 <= Reg_IFM_3;
	end
end
always @(posedge clk_gate_4 or negedge rst_n) begin
	if(~rst_n) begin
		Reg_IFM_4 <= 0;
	end
	else if(Enable_4)begin
		Reg_IFM_4 <= In_IFM_4;
	end 
	else begin
		Reg_IFM_4 <= Reg_IFM_4;
	end
end
always @(posedge clk_gate_5 or negedge rst_n) begin
	if(~rst_n) begin
		Reg_IFM_5 <= 0;
	end
	else if(Enable_5)begin
		Reg_IFM_5 <= In_IFM_5;
	end 
	else begin
		Reg_IFM_5 <= Reg_IFM_5;
	end
end
always @(posedge clk_gate_6 or negedge rst_n) begin
	if(~rst_n) begin
		Reg_IFM_6 <= 0;
	end
	else if(Enable_6)begin
		Reg_IFM_6 <= In_IFM_6;
	end 
	else begin
		Reg_IFM_6 <= Reg_IFM_6;
	end
end
always @(posedge clk_gate_7 or negedge rst_n) begin
	if(~rst_n) begin
		Reg_IFM_7 <= 0;
	end
	else if(Enable_7)begin
		Reg_IFM_7 <= In_IFM_7;
	end 
	else begin
		Reg_IFM_7 <= Reg_IFM_7;
	end
end
always @(posedge clk_gate_8 or negedge rst_n) begin
	if(~rst_n) begin
		Reg_IFM_8 <= 0;
	end
	else if(Enable_8)begin
		Reg_IFM_8 <= In_IFM_8;
	end 
	else begin
		Reg_IFM_8 <= Reg_IFM_8;
	end
end
always @(posedge clk_gate_9 or negedge rst_n) begin
	if(~rst_n) begin
		Reg_IFM_9 <= 0;
	end
	else if(Enable_9)begin
		Reg_IFM_9 <= In_IFM_9;
	end 
	else begin
		Reg_IFM_9 <= Reg_IFM_9;
	end
end

reg [15:0]MUL_1;
reg [15:0]MUL_2;
reg [15:0]MUL_3;
reg [15:0]MUL_4;
reg [15:0]MUL_5;
reg [15:0]MUL_6;
reg [15:0]MUL_7;
reg [15:0]MUL_8;
reg [15:0]MUL_9;

always @(*) begin
	if(Enable_1_t)begin
		MUL_1 = Reg_IFM_1*Weight_1;
	end
	else begin
		MUL_1 = 0;
	end
end
always @(*) begin
	if(Enable_2_t)begin
		MUL_2 = Reg_IFM_2*Weight_2;
	end
	else begin
		MUL_2 = 0;
	end
end
always @(*) begin
	if(Enable_3_t)begin
		MUL_3 = Reg_IFM_3*Weight_3;
	end
	else begin
		MUL_3 = 0;
	end
end
always @(*) begin
	if(Enable_4_t)begin
		MUL_4 = Reg_IFM_4*Weight_4;
	end
	else begin
		MUL_4 = 0;
	end
end
always @(*) begin
	if(Enable_5_t)begin
		MUL_5 = Reg_IFM_5*Weight_5;
	end
	else begin
		MUL_5 = 0;
	end
end
always @(*) begin
	if(Enable_6_t)begin
		MUL_6 = Reg_IFM_6*Weight_6;
	end
	else begin
		MUL_6 = 0;
	end
end
always @(*) begin
	if(Enable_7_t)begin
		MUL_7 = Reg_IFM_7*Weight_7;
	end
	else begin
		MUL_7 = 0;
	end
end
always @(*) begin
	if(Enable_8_t)begin
		MUL_8 = Reg_IFM_8*Weight_8;
	end
	else begin
		MUL_8 = 0;
	end
end
always @(*) begin
	if(Enable_9_t)begin
		MUL_9 = Reg_IFM_9*Weight_9;
	end
	else begin
		MUL_9 = 0;
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
		ans<=MUL_1+MUL_2+MUL_3+MUL_4+MUL_5+MUL_6+MUL_7+MUL_8+MUL_9;
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
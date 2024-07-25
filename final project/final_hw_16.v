//16bit_parallel
module final_hw(
	//input
clk,
rst_n,
in_valid,
In_IFM1,
In_IFM2,
In_IFM3,
In_IFM4,
In_IFM5,
In_IFM6,
In_IFM7,
In_IFM8,
In_IFM9,
In_IFM10,
In_IFM11,
In_IFM12,
In_IFM13,
In_IFM14,
In_IFM15,
In_IFM16,
out_valid,
Out_OFM
);

input clk, rst_n, in_valid;
input [3:0]In_IFM1;
input [3:0]In_IFM2;
input [3:0]In_IFM3;
input [3:0]In_IFM4;
input [3:0]In_IFM5;
input [3:0]In_IFM6;
input [3:0]In_IFM7;
input [3:0]In_IFM8;
input [3:0]In_IFM9;
input [3:0]In_IFM10;
input [3:0]In_IFM11;
input [3:0]In_IFM12;
input [3:0]In_IFM13;
input [3:0]In_IFM14;
input [3:0]In_IFM15;
input [3:0]In_IFM16;

reg [3:0] In_Weight1 ;
reg [3:0] In_Weight2 ;
reg [3:0] In_Weight3 ;
reg [3:0] In_Weight4 ;
reg [3:0] In_Weight5 ;
reg [3:0] In_Weight6 ;
reg [3:0] In_Weight7 ;
reg [3:0] In_Weight8 ;
reg [3:0] In_Weight9 ;
reg [3:0] In_Weight10;
reg [3:0] In_Weight11;
reg [3:0] In_Weight12;
reg [3:0] In_Weight13;
reg [3:0] In_Weight14;
reg [3:0] In_Weight15;
reg [3:0] In_Weight16;
reg [3:0] In_Weight17;
reg [3:0] In_Weight18;
reg [3:0] In_Weight19;
reg [3:0] In_Weight20;
reg [3:0] In_Weight21;
reg [3:0] In_Weight22;
reg [3:0] In_Weight23;
reg [3:0] In_Weight24;
reg [3:0] In_Weight25;
reg [3:0] In_Weight26;
reg [3:0] In_Weight27;
reg [3:0] In_Weight28;
reg [3:0] In_Weight29;
reg [3:0] In_Weight30;
reg [3:0] In_Weight31;
reg [3:0] In_Weight32;	

//////////////The output port shoud be registers///////////////////////
output reg out_valid;
output reg[12:0] Out_OFM;
//////////////////////////////////////////////////////////////////////

reg [7:0] mul_out[0:15];
reg [11:0] add_out[0:1];

reg out_flag;
reg in_count;
integer i;

////////Here just an example of how to use IFM_buffer & WEight_Buffer to store data////////
//The storage mechanism can be modified, but not the buffer size cannot be modified
///////////////////////////////////////////////////////
//---------------------------------------------------------------------
//   CONV
//---------------------------------------------------------------------
always @(posedge clk or negedge rst_n) begin 
	if(~rst_n) begin
		in_count <= 0;
	end 
	else if(in_valid || out_flag) begin
		in_count <= in_count+1;
	end
	else begin
		in_count <=0;
	end
end

always @(posedge clk or negedge rst_n) begin
	if(~rst_n) begin
		out_flag <= 0;
	end 
	else if(in_count == 1) begin
		out_flag <= 1;
	end
end

always @(posedge clk or negedge rst_n) begin
	if(!rst_n)begin
		In_Weight1  <= 4'd6;
		In_Weight2  <= 4'd14;
		In_Weight3  <= 4'd13;
		In_Weight4  <= 4'd10;
		In_Weight5  <= 4'd10;
		In_Weight6  <= 4'd14;
		In_Weight7  <= 4'd3;
		In_Weight8  <= 4'd4;
		In_Weight9  <= 4'd0;
		In_Weight10 <= 4'd6;
		In_Weight11 <= 4'd7;
		In_Weight12 <= 4'd9;
		In_Weight13 <= 4'd11;
		In_Weight14 <= 4'd12;
		In_Weight15 <= 4'd6;
		In_Weight16 <= 4'd3;
		In_Weight17 <= 4'd2;
		In_Weight18 <= 4'd1;
		In_Weight19 <= 4'd5;
		In_Weight20 <= 4'd8;
		In_Weight21 <= 4'd7;
		In_Weight22 <= 4'd13;
		In_Weight23 <= 4'd1;
		In_Weight24 <= 4'd8;
		In_Weight25 <= 4'd7;
		In_Weight26 <= 4'd12;
		In_Weight27 <= 4'd13;
		In_Weight28 <= 4'd10;
		In_Weight29 <= 4'd10;
		In_Weight30 <= 4'd9;
		In_Weight31 <= 4'd7;
		In_Weight32 <= 4'd7;
	end
end

always @(posedge clk or negedge rst_n) begin 
	if(~rst_n) begin
		for(i = 0;i<16;i = i+1)begin
			mul_out[i] <= 0;
		end
	end 
	else if(in_count == 0) begin
		mul_out[0] <= In_IFM1 * In_Weight1;
		mul_out[1] <= In_IFM2 * In_Weight2;
		mul_out[2] <= In_IFM3 * In_Weight3;
		mul_out[3] <= In_IFM4 * In_Weight4;
		mul_out[4] <= In_IFM5 * In_Weight5;
		mul_out[5] <= In_IFM6 * In_Weight6;
		mul_out[6] <= In_IFM7 * In_Weight7;
		mul_out[7] <= In_IFM8 * In_Weight8;
		mul_out[8] <= In_IFM9 * In_Weight9;
		mul_out[9] <= In_IFM10 * In_Weight10;
		mul_out[10] <= In_IFM11 * In_Weight11;
		mul_out[11] <= In_IFM12 * In_Weight12;
		mul_out[12] <= In_IFM13 * In_Weight13;
		mul_out[13] <= In_IFM14 * In_Weight14;
		mul_out[14] <= In_IFM15 * In_Weight15;
		mul_out[15] <= In_IFM16 * In_Weight16;
	end
	else begin
		mul_out[0] <= In_IFM1 * In_Weight17;
		mul_out[1] <= In_IFM2 * In_Weight18;
		mul_out[2] <= In_IFM3 * In_Weight19;
		mul_out[3] <= In_IFM4 * In_Weight20;
		mul_out[4] <= In_IFM5 * In_Weight21;
		mul_out[5] <= In_IFM6 * In_Weight22;
		mul_out[6] <= In_IFM7 * In_Weight23;
		mul_out[7] <= In_IFM8 * In_Weight24;
		mul_out[8] <= In_IFM9 * In_Weight25;
		mul_out[9] <= In_IFM10 * In_Weight26;
		mul_out[10] <= In_IFM11 * In_Weight27;
		mul_out[11] <= In_IFM12 * In_Weight28;
		mul_out[12] <= In_IFM13 * In_Weight29;
		mul_out[13] <= In_IFM14 * In_Weight30;
		mul_out[14] <= In_IFM15 * In_Weight31;
		mul_out[15] <= In_IFM16 * In_Weight32;
	end
	
end

always @(posedge clk or negedge rst_n) begin
	if(~rst_n) begin
		add_out[0] <= 0;
		add_out[1] <= 0;
	end 
	else if(in_count == 1) begin
		add_out[0] <= mul_out[0] + mul_out[1] + mul_out[2] + mul_out[3] + mul_out[4] + mul_out[5] + mul_out[6] + mul_out[7]
							+mul_out[8] + mul_out[9] + mul_out[10] + mul_out[11] + mul_out[12] + mul_out[13] + mul_out[14] + mul_out[15];
	end
	else begin
		add_out[1] <= mul_out[0] + mul_out[1] + mul_out[2] + mul_out[3] + mul_out[4] + mul_out[5] + mul_out[6] + mul_out[7]
							+mul_out[8] + mul_out[9] + mul_out[10] + mul_out[11] + mul_out[12] + mul_out[13] + mul_out[14] + mul_out[15];
	end
end

//---------------------------------------------------------------------
//   OUT
//---------------------------------------------------------------------

always @(posedge clk or negedge rst_n) begin 
	if(~rst_n) begin
		out_valid <= 0;
	end 
	else if(in_count == 1 && out_flag) begin
		out_valid <= 1;
	end
	else begin
		out_valid <= 0;
	end
end
always @(posedge clk or negedge rst_n) begin
	if(~rst_n) begin
		Out_OFM <= 0;
	end 
	else begin
		Out_OFM <= add_out[0]+add_out[1];
	end
end
//---------------------------------------------------------------------
//   FSM
//---------------------------------------------------------------------




endmodule
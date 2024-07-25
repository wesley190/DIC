module Convolution_with_pipeline(
	//input
clk,
rst_n,
in_valid,
weight_valid,
In_IFM_1,
In_Weight_1,
//output
out_valid, 
Out_OFM	

);

input clk, rst_n, in_valid, weight_valid;
input [15:0]In_IFM_1;		
input [15:0]In_Weight_1;

//////////////The output port shoud be registers///////////////////////
output reg out_valid;
output reg[35:0] Out_OFM;
//////////////////////////////////////////////////////////////////////


/////// 2 Buffer/////////////
//You have to sue these buffers for the 3-1 & 3-2 /////// 
reg [15:0]IFM_Buffer[0:48] ;   //  Use this buffer to store IFM
reg [15:0]Weight_Buffer[0:8];  //  Use this buffer to store Weight
/////////////////////////////////////

parameter IDLE = 2'd0;
parameter INPUT = 2'd1;
parameter CAL_OUT = 2'd2;
parameter OUT = 2'd3;

reg [1:0] curr_state, next_state;
reg [15:0] mul_a[0:8];

reg [5:0] in_count, mul_count;
reg cal_finish;
integer i;

////////Here just an example of how to use IFM_buffer & WEight_Buffer to store data////////
//The storage mechanism can be modified, but not the buffer size cannot be modified
always @(posedge clk or negedge rst_n) begin
	if(~rst_n) begin
		in_count <= 0;
	end 
	else if(in_valid == 1) begin
		in_count <= in_count+1;
	end
	else begin
		in_count <= 0;
	end
end

always@(posedge clk or negedge rst_n) begin
	if(!rst_n) begin
		for (i=0;i<9;i=i+1) 
			Weight_Buffer[i] <= 0;
	end
	else if(weight_valid && in_count < 9)
		Weight_Buffer[in_count] <= In_Weight_1;
end
always@(posedge clk or negedge rst_n) begin
	if(!rst_n) begin
		for (i=0;i<49;i=i+1) 
			IFM_Buffer[i] <= 0;
	end
	else if(in_count < 49) begin
		IFM_Buffer[in_count]  <= In_IFM_1;
	end                

end
///////////////////////////////////////////////////////
//---------------------------------------------------------------------
//   CONV
//---------------------------------------------------------------------
reg [33:0] add1, add2, add3;
reg [31:0] mul_out[0:8];
//reg [35:0] out_tmp;

always @(posedge clk or negedge rst_n) begin 
	if(~rst_n) begin
		mul_count <= 0;
	end 
	else if(curr_state == CAL_OUT) begin
		mul_count <= mul_count+1;
	end
	else begin
		mul_count <=0;
	end
end

always @(posedge clk or negedge rst_n) begin 
	if(~rst_n) begin
		for(i = 0;i<9;i = i+1)begin
			mul_a[i] <= 0;
		end
	end 
	else if(curr_state==CAL_OUT) begin
		case (mul_count)
			0 : begin
				mul_a[0] <= IFM_Buffer[0];
				mul_a[1] <= IFM_Buffer[1];
				mul_a[2] <= IFM_Buffer[2];
				mul_a[3] <= IFM_Buffer[7];
				mul_a[4] <= IFM_Buffer[8];
				mul_a[5] <= IFM_Buffer[9];
				mul_a[6] <= IFM_Buffer[14];
				mul_a[7] <= IFM_Buffer[15];
				mul_a[8] <= IFM_Buffer[16];
			end
			1 : begin
				mul_a[0] <= IFM_Buffer[1];
				mul_a[1] <= IFM_Buffer[2];
				mul_a[2] <= IFM_Buffer[3];
				mul_a[3] <= IFM_Buffer[8];
				mul_a[4] <= IFM_Buffer[9];
				mul_a[5] <= IFM_Buffer[10];
				mul_a[6] <= IFM_Buffer[15];
				mul_a[7] <= IFM_Buffer[16];
				mul_a[8] <= IFM_Buffer[17];
			end
			2 : begin
				mul_a[0] <= IFM_Buffer[2];
				mul_a[1] <= IFM_Buffer[3];
				mul_a[2] <= IFM_Buffer[4];
				mul_a[3] <= IFM_Buffer[9];
				mul_a[4] <= IFM_Buffer[10];
				mul_a[5] <= IFM_Buffer[11];
				mul_a[6] <= IFM_Buffer[16];
				mul_a[7] <= IFM_Buffer[17];
				mul_a[8] <= IFM_Buffer[18];
			end
			3 : begin
				mul_a[0] <= IFM_Buffer[3];
				mul_a[1] <= IFM_Buffer[4];
				mul_a[2] <= IFM_Buffer[5];
				mul_a[3] <= IFM_Buffer[10];
				mul_a[4] <= IFM_Buffer[11];
				mul_a[5] <= IFM_Buffer[12];
				mul_a[6] <= IFM_Buffer[17];
				mul_a[7] <= IFM_Buffer[18];
				mul_a[8] <= IFM_Buffer[19];
			end
			4 : begin
				mul_a[0] <= IFM_Buffer[4];
				mul_a[1] <= IFM_Buffer[5];
				mul_a[2] <= IFM_Buffer[6];
				mul_a[3] <= IFM_Buffer[11];
				mul_a[4] <= IFM_Buffer[12];
				mul_a[5] <= IFM_Buffer[13];
				mul_a[6] <= IFM_Buffer[18];
				mul_a[7] <= IFM_Buffer[19];
				mul_a[8] <= IFM_Buffer[20];
			end
			5 : begin
				mul_a[0] <= IFM_Buffer[7];
				mul_a[1] <= IFM_Buffer[8];
				mul_a[2] <= IFM_Buffer[9];
				mul_a[3] <= IFM_Buffer[14];
				mul_a[4] <= IFM_Buffer[15];
				mul_a[5] <= IFM_Buffer[16];
				mul_a[6] <= IFM_Buffer[21];
				mul_a[7] <= IFM_Buffer[22];
				mul_a[8] <= IFM_Buffer[23];
			end
			6 : begin
				mul_a[0] <= IFM_Buffer[8];
				mul_a[1] <= IFM_Buffer[9];
				mul_a[2] <= IFM_Buffer[10];
				mul_a[3] <= IFM_Buffer[15];
				mul_a[4] <= IFM_Buffer[16];
				mul_a[5] <= IFM_Buffer[17];
				mul_a[6] <= IFM_Buffer[22];
				mul_a[7] <= IFM_Buffer[23];
				mul_a[8] <= IFM_Buffer[24];
			end
			7 : begin
				mul_a[0] <= IFM_Buffer[9];
				mul_a[1] <= IFM_Buffer[10];
				mul_a[2] <= IFM_Buffer[11];
				mul_a[3] <= IFM_Buffer[16];
				mul_a[4] <= IFM_Buffer[17];
				mul_a[5] <= IFM_Buffer[18];
				mul_a[6] <= IFM_Buffer[23];
				mul_a[7] <= IFM_Buffer[24];
				mul_a[8] <= IFM_Buffer[25];
			end
			8 : begin
				mul_a[0] <= IFM_Buffer[10];
				mul_a[1] <= IFM_Buffer[11];
				mul_a[2] <= IFM_Buffer[12];
				mul_a[3] <= IFM_Buffer[17];
				mul_a[4] <= IFM_Buffer[18];
				mul_a[5] <= IFM_Buffer[19];
				mul_a[6] <= IFM_Buffer[24];
				mul_a[7] <= IFM_Buffer[25];
				mul_a[8] <= IFM_Buffer[26];
			end
			9 : begin
				mul_a[0] <= IFM_Buffer[11];
				mul_a[1] <= IFM_Buffer[12];
				mul_a[2] <= IFM_Buffer[13];
				mul_a[3] <= IFM_Buffer[18];
				mul_a[4] <= IFM_Buffer[19];
				mul_a[5] <= IFM_Buffer[20];
				mul_a[6] <= IFM_Buffer[25];
				mul_a[7] <= IFM_Buffer[26];
				mul_a[8] <= IFM_Buffer[27];
			end
			10 : begin
				mul_a[0] <= IFM_Buffer[14];
				mul_a[1] <= IFM_Buffer[15];
				mul_a[2] <= IFM_Buffer[16];
				mul_a[3] <= IFM_Buffer[21];
				mul_a[4] <= IFM_Buffer[22];
				mul_a[5] <= IFM_Buffer[23];
				mul_a[6] <= IFM_Buffer[28];
				mul_a[7] <= IFM_Buffer[29];
				mul_a[8] <= IFM_Buffer[30];
			end
			11 : begin
				mul_a[0] <= IFM_Buffer[15];
				mul_a[1] <= IFM_Buffer[16];
				mul_a[2] <= IFM_Buffer[17];
				mul_a[3] <= IFM_Buffer[22];
				mul_a[4] <= IFM_Buffer[23];
				mul_a[5] <= IFM_Buffer[24];
				mul_a[6] <= IFM_Buffer[29];
				mul_a[7] <= IFM_Buffer[30];
				mul_a[8] <= IFM_Buffer[31];
			end
			12 : begin
				mul_a[0] <= IFM_Buffer[16];
				mul_a[1] <= IFM_Buffer[17];
				mul_a[2] <= IFM_Buffer[18];
				mul_a[3] <= IFM_Buffer[23];
				mul_a[4] <= IFM_Buffer[24];
				mul_a[5] <= IFM_Buffer[25];
				mul_a[6] <= IFM_Buffer[30];
				mul_a[7] <= IFM_Buffer[31];
				mul_a[8] <= IFM_Buffer[32];
			end
			13 : begin
				mul_a[0] <= IFM_Buffer[17];
				mul_a[1] <= IFM_Buffer[18];
				mul_a[2] <= IFM_Buffer[19];
				mul_a[3] <= IFM_Buffer[24];
				mul_a[4] <= IFM_Buffer[25];
				mul_a[5] <= IFM_Buffer[26];
				mul_a[6] <= IFM_Buffer[31];
				mul_a[7] <= IFM_Buffer[32];
				mul_a[8] <= IFM_Buffer[33];
			end
			14 : begin
				mul_a[0] <= IFM_Buffer[18];
				mul_a[1] <= IFM_Buffer[19];
				mul_a[2] <= IFM_Buffer[20];
				mul_a[3] <= IFM_Buffer[25];
				mul_a[4] <= IFM_Buffer[26];
				mul_a[5] <= IFM_Buffer[27];
				mul_a[6] <= IFM_Buffer[32];
				mul_a[7] <= IFM_Buffer[33];
				mul_a[8] <= IFM_Buffer[34];
			end
			15 : begin
				mul_a[0] <= IFM_Buffer[21];
				mul_a[1] <= IFM_Buffer[22];
				mul_a[2] <= IFM_Buffer[23];
				mul_a[3] <= IFM_Buffer[28];
				mul_a[4] <= IFM_Buffer[29];
				mul_a[5] <= IFM_Buffer[30];
				mul_a[6] <= IFM_Buffer[35];
				mul_a[7] <= IFM_Buffer[36];
				mul_a[8] <= IFM_Buffer[37];
			end
			16 : begin
				mul_a[0] <= IFM_Buffer[22];
				mul_a[1] <= IFM_Buffer[23];
				mul_a[2] <= IFM_Buffer[24];
				mul_a[3] <= IFM_Buffer[29];
				mul_a[4] <= IFM_Buffer[30];
				mul_a[5] <= IFM_Buffer[31];
				mul_a[6] <= IFM_Buffer[36];
				mul_a[7] <= IFM_Buffer[37];
				mul_a[8] <= IFM_Buffer[38];
			end
			17 : begin
				mul_a[0] <= IFM_Buffer[23];
				mul_a[1] <= IFM_Buffer[24];
				mul_a[2] <= IFM_Buffer[25];
				mul_a[3] <= IFM_Buffer[30];
				mul_a[4] <= IFM_Buffer[31];
				mul_a[5] <= IFM_Buffer[32];
				mul_a[6] <= IFM_Buffer[37];
				mul_a[7] <= IFM_Buffer[38];
				mul_a[8] <= IFM_Buffer[39];
			end
			18 : begin
				mul_a[0] <= IFM_Buffer[24];
				mul_a[1] <= IFM_Buffer[25];
				mul_a[2] <= IFM_Buffer[26];
				mul_a[3] <= IFM_Buffer[31];
				mul_a[4] <= IFM_Buffer[32];
				mul_a[5] <= IFM_Buffer[33];
				mul_a[6] <= IFM_Buffer[38];
				mul_a[7] <= IFM_Buffer[39];
				mul_a[8] <= IFM_Buffer[40];
			end
			19 : begin
				mul_a[0] <= IFM_Buffer[25];
				mul_a[1] <= IFM_Buffer[26];
				mul_a[2] <= IFM_Buffer[27];
				mul_a[3] <= IFM_Buffer[32];
				mul_a[4] <= IFM_Buffer[33];
				mul_a[5] <= IFM_Buffer[34];
				mul_a[6] <= IFM_Buffer[39];
				mul_a[7] <= IFM_Buffer[40];
				mul_a[8] <= IFM_Buffer[41];
			end
			20 : begin
				mul_a[0] <= IFM_Buffer[28];
				mul_a[1] <= IFM_Buffer[29];
				mul_a[2] <= IFM_Buffer[30];
				mul_a[3] <= IFM_Buffer[35];
				mul_a[4] <= IFM_Buffer[36];
				mul_a[5] <= IFM_Buffer[37];
				mul_a[6] <= IFM_Buffer[42];
				mul_a[7] <= IFM_Buffer[43];
				mul_a[8] <= IFM_Buffer[44];
			end
			21 : begin
				mul_a[0] <= IFM_Buffer[29];
				mul_a[1] <= IFM_Buffer[30];
				mul_a[2] <= IFM_Buffer[31];
				mul_a[3] <= IFM_Buffer[36];
				mul_a[4] <= IFM_Buffer[37];
				mul_a[5] <= IFM_Buffer[38];
				mul_a[6] <= IFM_Buffer[43];
				mul_a[7] <= IFM_Buffer[44];
				mul_a[8] <= IFM_Buffer[45];
			end
			22 : begin
				mul_a[0] <= IFM_Buffer[30];
				mul_a[1] <= IFM_Buffer[31];
				mul_a[2] <= IFM_Buffer[32];
				mul_a[3] <= IFM_Buffer[37];
				mul_a[4] <= IFM_Buffer[38];
				mul_a[5] <= IFM_Buffer[39];
				mul_a[6] <= IFM_Buffer[44];
				mul_a[7] <= IFM_Buffer[45];
				mul_a[8] <= IFM_Buffer[46];
			end
			23 : begin
				mul_a[0] <= IFM_Buffer[31];
				mul_a[1] <= IFM_Buffer[32];
				mul_a[2] <= IFM_Buffer[33];
				mul_a[3] <= IFM_Buffer[38];
				mul_a[4] <= IFM_Buffer[39];
				mul_a[5] <= IFM_Buffer[40];
				mul_a[6] <= IFM_Buffer[45];
				mul_a[7] <= IFM_Buffer[46];
				mul_a[8] <= IFM_Buffer[47];
			end
			24 : begin
				mul_a[0] <= IFM_Buffer[32];
				mul_a[1] <= IFM_Buffer[33];
				mul_a[2] <= IFM_Buffer[34];
				mul_a[3] <= IFM_Buffer[39];
				mul_a[4] <= IFM_Buffer[40];
				mul_a[5] <= IFM_Buffer[41];
				mul_a[6] <= IFM_Buffer[46];
				mul_a[7] <= IFM_Buffer[47];
				mul_a[8] <= IFM_Buffer[48];
			end
		
			default : begin
				mul_a[0] <= 0;
				mul_a[1] <= 0;
				mul_a[2] <= 0;
				mul_a[3] <= 0;
				mul_a[4] <= 0;
				mul_a[5] <= 0;
				mul_a[6] <= 0;
				mul_a[7] <= 0;
				mul_a[8] <= 0;
			end

		endcase
	end
end


always @(posedge clk) begin
	
	if(curr_state == CAL_OUT) begin
		mul_out[0] <= mul_a[0]*Weight_Buffer[0];
		mul_out[1] <= mul_a[1]*Weight_Buffer[1];
		mul_out[2] <= mul_a[2]*Weight_Buffer[2];
		mul_out[3] <= mul_a[3]*Weight_Buffer[3];
		mul_out[4] <= mul_a[4]*Weight_Buffer[4];
		mul_out[5] <= mul_a[5]*Weight_Buffer[5];
		mul_out[6] <= mul_a[6]*Weight_Buffer[6];
		mul_out[7] <= mul_a[7]*Weight_Buffer[7];
		mul_out[8] <= mul_a[8]*Weight_Buffer[8];
	end else begin
		mul_out[0] <= 0;
		mul_out[1] <= 0;
		mul_out[2] <= 0;
		mul_out[3] <= 0;
		mul_out[4] <= 0;
		mul_out[5] <= 0;
		mul_out[6] <= 0;
		mul_out[7] <= 0;
		mul_out[8] <= 0;
	end
end

always @(posedge clk or negedge rst_n) begin 
	if(~rst_n) begin
		add1 <= 0;
		add2 <= 0;
		add3 <= 0;
	end 
	else if(curr_state == CAL_OUT) begin
		add1 <= mul_out[0] + mul_out[1] + mul_out[2];
		add2 <= mul_out[3] + mul_out[4] + mul_out[5];
		add3 <= mul_out[6] + mul_out[7] + mul_out[8];
	end
	else begin
		add1 <= 0;
		add2 <= 0;
		add3 <= 0;
	end
end
/*always @(posedge clk or negedge rst_n) begin
	if(~rst_n) begin
		out_tmp <= 0;
	end 
	else if(curr_state ==CAL_OUT) begin
		out_tmp <= add1+add2+add3;
	end
end*/


//---------------------------------------------------------------------
//   OUT
//---------------------------------------------------------------------

always @(posedge clk or negedge rst_n) begin
	if(~rst_n) begin
		cal_finish <= 0;
	end 
	else if(curr_state == CAL_OUT) begin
		if(mul_count == 27)begin
			cal_finish <= 1;
		end
	end
	else begin
		cal_finish <= 0;
	end
end
always @(posedge clk or negedge rst_n) begin 
	if(~rst_n) begin
		out_valid <= 0;
	end 
	else if(curr_state == CAL_OUT) begin
		if(mul_count >= 3 && mul_count <=27)begin
			out_valid <= 1;
		end
		else begin
			out_valid <= 0;
		end
	end
	else begin
		out_valid <= 0;
	end
end
always @(posedge clk or negedge rst_n) begin
	if(~rst_n) begin
		Out_OFM <= 0;
	end 
	else if(curr_state == CAL_OUT) begin
		Out_OFM <= add1 +add2+add3;
	end
end
//---------------------------------------------------------------------
//   FSM
//---------------------------------------------------------------------

always @(posedge clk or negedge rst_n) begin 
	if(~rst_n) begin
		curr_state <= 0;
	end else begin
		curr_state <= next_state;
	end
end


always @(*) begin
	if(~rst_n) begin
		next_state = IDLE;
	end
	else begin
		case (curr_state)
			IDLE: next_state = (in_valid)? INPUT : IDLE; 
			INPUT: next_state = (!in_valid)? CAL_OUT : INPUT;
			CAL_OUT: next_state = (cal_finish)? IDLE : CAL_OUT;
			default : next_state = IDLE;
		endcase
	end	
end
endmodule


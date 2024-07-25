//==============================================
//==============================================				
//	Author	:	Wei Lu																		
//----------------------------------------------
//												
//	File Name		:	Adder_4bit.v					
//	Module Name		:	Adder_4bit					
//	Release version	:	v1.0					
//												
//----------------------------------------------								
//----------------------------------------------											
//	Input	:   A,
//				B,												
//	Output	:	Output,					
//==============================================
//==============================================
module Adder_4bit(
    //Input Port
	A,	
	B,
    //Output Port
	Output
    );

//---------------------------------------------------------------------
//   PORT DECLARATION
//---------------------------------------------------------------------
input [3:0]A;
input [3:0]B;

output wire [4:0]Output;

wire C1,C2,C3;

//assign Output = A + B;

Adder_1bit A1(.A(A[0]),.B(B[0]),.Cin(1'B0),.Sum(Output[0]),.Cout(C1));
Adder_1bit A2(.A(A[1]),.B(B[1]),.Cin(C1),.Sum(Output[1]),.Cout(C2));
Adder_1bit A3(.A(A[2]),.B(B[2]),.Cin(C2),.Sum(Output[2]),.Cout(C3));
Adder_1bit A4(.A(A[3]),.B(B[3]),.Cin(C3),.Sum(Output[3]),.Cout(Output[4]));

endmodule

module Adder_1bit(A,B,Cin,Sum,Cout);
input A,B,Cin;
output Sum,Cout;
wire x1,x2,x3,x4,x5,x6,x7,x8;
and a1(x1,A,B);
and a2(x2,B,Cin);
and a3(x3,A,Cin);
or o1(Cout,x1,x2,x3);

not n1(x4,Cout);
and a4(x5,x4,A);
and a5(x6,x4,B);
and a6(x7,x4,Cin);
and a7(x8,A,B,Cin);
or o2(Sum,x5,x6,x7,x8);

endmodule
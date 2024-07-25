/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in wire load mode
// Version   : R-2020.09
// Date      : Tue Nov  1 23:12:32 2022
/////////////////////////////////////////////////////////////


module Adder_4bit ( A, B, Output );
  input [3:0] A;
  input [3:0] B;
  output [4:0] Output;
  wire   n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20, n21,
         n22;

  NOR2xp67_ASAP7_75t_R U13 ( .A(n11), .B(n10), .Y(n21) );
  INVxp67_ASAP7_75t_R U14 ( .A(B[2]), .Y(n19) );
  INVxp67_ASAP7_75t_R U15 ( .A(A[2]), .Y(n20) );
  NOR2xp33_ASAP7_75t_R U16 ( .A(n17), .B(n16), .Y(n18) );
  NOR3xp33_ASAP7_75t_R U17 ( .A(n16), .B(n9), .C(n17), .Y(n10) );
  INVxp33_ASAP7_75t_R U18 ( .A(n15), .Y(n13) );
  NOR2xp33_ASAP7_75t_R U19 ( .A(B[2]), .B(A[2]), .Y(n11) );
  NOR2xp33_ASAP7_75t_R U20 ( .A(B[1]), .B(A[1]), .Y(n8) );
  NAND2x1p5_ASAP7_75t_R U21 ( .A(A[0]), .B(B[0]), .Y(n15) );
  NOR2xp33_ASAP7_75t_R U22 ( .A(n8), .B(n15), .Y(n16) );
  AND2x2_ASAP7_75t_R U23 ( .A(B[2]), .B(A[2]), .Y(n9) );
  AND2x2_ASAP7_75t_R U24 ( .A(B[1]), .B(A[1]), .Y(n17) );
  MAJIxp5_ASAP7_75t_R U25 ( .A(n21), .B(A[3]), .C(B[3]), .Y(n12) );
  INVxp33_ASAP7_75t_R U26 ( .A(n12), .Y(Output[4]) );
  NOR2xp33_ASAP7_75t_R U27 ( .A(A[0]), .B(B[0]), .Y(n14) );
  NOR2xp33_ASAP7_75t_R U28 ( .A(n14), .B(n13), .Y(Output[0]) );
  FAx1_ASAP7_75t_R U29 ( .A(B[1]), .B(A[1]), .CI(n15), .SN(Output[1]) );
  FAx1_ASAP7_75t_R U30 ( .A(n20), .B(n19), .CI(n18), .SN(Output[2]) );
  XNOR2xp5_ASAP7_75t_R U31 ( .A(A[3]), .B(B[3]), .Y(n22) );
  XNOR2xp5_ASAP7_75t_R U32 ( .A(n22), .B(n21), .Y(Output[3]) );
endmodule


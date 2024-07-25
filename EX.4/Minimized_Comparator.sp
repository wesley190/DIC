.TITLE Ex_4.2

*****************************
**     Library setting     **
*****************************
.protect
.include '7nm_TT.pm'
.include 'asap7sc7p5t_AO_RVT.sp'
.include 'asap7sc7p5t_OA_RVT.sp'
.include 'asap7sc7p5t_SEQ_RVT.sp'
.include 'asap7sc7p5t_INVBUF_RVT.sp'
.include 'asap7sc7p5t_SIMPLE_RVT.sp'
.unprotect


**.include "Measure.sp"
.VEC "Pattern_comparator.vec"

*****************************
**     Voltage Source      **
*****************************
.global VDD GND
Vvdd VDD GND 0.7v
Vvss VSS GND 0 0


.SUBCKT inverter in out 
Mp1 out in VDD x pmos_lvt m=3
Mn1 out in GND x nmos_lvt m=3
.ENDS
.SUBCKT inv_buffer in out 
Xinv1 in mid inverter
Xinv2 mid out inverter
.ENDS



*********Inputs(please use these signals as inputs for your desing)*********************************
Xbuf_A0 A0 A_in0 inv_buffer
Xbuf_B0 B0 B_in0 inv_buffer
Xbuf_A1 A1 A_in1 inv_buffer
Xbuf_B1 B1 B_in1 inv_buffer
Xbuf_A2 A2 A_in2 inv_buffer
Xbuf_B2 B2 B_in2 inv_buffer
Xbuf_A3 A3 A_in3 inv_buffer
Xbuf_B3 B3 B_in3 inv_buffer
Xbuf_A4 A4 A_in4 inv_buffer
Xbuf_B4 B4 B_in4 inv_buffer
Xbuf_A5 A5 A_in5 inv_buffer
Xbuf_B5 B5 B_in5 inv_buffer
Xbuf_A6 A6 A_in6 inv_buffer
Xbuf_B6 B6 B_in6 inv_buffer
Xbuf_A7 A7 A_in7 inv_buffer
Xbuf_B7 B7 B_in7 inv_buffer
Xbuf_A8 A8 A_in8 inv_buffer
Xbuf_B8 B8 B_in8 inv_buffer
Xbuf_A9 A9 A_in9 inv_buffer
Xbuf_B9 B9 B_in9 inv_buffer
Xbuf_A10 A10 A_in10 inv_buffer
Xbuf_B10 B10 B_in10 inv_buffer
Xbuf_A11 A11 A_in11 inv_buffer
Xbuf_B11 B11 B_in11 inv_buffer
Xbuf_A12 A12 A_in12 inv_buffer
Xbuf_B12 B12 B_in12 inv_buffer
Xbuf_A13 A13 A_in13 inv_buffer
Xbuf_B13 B13 B_in13 inv_buffer
Xbuf_A14 A14 A_in14 inv_buffer
Xbuf_B14 B14 B_in14 inv_buffer
Xbuf_A15 A15 A_in15 inv_buffer
Xbuf_B15 B15 B_in15 inv_buffer
Xbuf_A16 A16 A_in16 inv_buffer
Xbuf_B16 B16 B_in16 inv_buffer
Xbuf_A17 A17 A_in17 inv_buffer
Xbuf_B17 B17 B_in17 inv_buffer
Xbuf_A18 A18 A_in18 inv_buffer
Xbuf_B18 B18 B_in18 inv_buffer
Xbuf_A19 A19 A_in19 inv_buffer
Xbuf_B19 B19 B_in19 inv_buffer
Xbuf_A20 A20 A_in20 inv_buffer
Xbuf_B20 B20 B_in20 inv_buffer
Xbuf_A21 A21 A_in21 inv_buffer
Xbuf_B21 B21 B_in21 inv_buffer
Xbuf_A22 A22 A_in22 inv_buffer
Xbuf_B22 B22 B_in22 inv_buffer
Xbuf_A23 A23 A_in23 inv_buffer
Xbuf_B23 B23 B_in23 inv_buffer
Xbuf_A24 A24 A_in24 inv_buffer
Xbuf_B24 B24 B_in24 inv_buffer
Xbuf_A25 A25 A_in25 inv_buffer
Xbuf_B25 B25 B_in25 inv_buffer
Xbuf_A26 A26 A_in26 inv_buffer
Xbuf_B26 B26 B_in26 inv_buffer
Xbuf_A27 A27 A_in27 inv_buffer
Xbuf_B27 B27 B_in27 inv_buffer
Xbuf_A28 A28 A_in28 inv_buffer
Xbuf_B28 B28 B_in28 inv_buffer
Xbuf_A29 A29 A_in29 inv_buffer
Xbuf_B29 B29 B_in29 inv_buffer
Xbuf_A30 A30 A_in30 inv_buffer
Xbuf_B30 B30 B_in30 inv_buffer
Xbuf_A31 A31 A_in31 inv_buffer
Xbuf_B31 B31 B_in31 inv_buffer
Xbuf_A32 A32 A_in32 inv_buffer
Xbuf_B32 B32 B_in32 inv_buffer
Xbuf_A33 A33 A_in33 inv_buffer
Xbuf_B33 B33 B_in33 inv_buffer
Xbuf_A34 A34 A_in34 inv_buffer
Xbuf_B34 B34 B_in34 inv_buffer
Xbuf_A35 A35 A_in35 inv_buffer
Xbuf_B35 B35 B_in35 inv_buffer
Xbuf_A36 A36 A_in36 inv_buffer
Xbuf_B36 B36 B_in36 inv_buffer
Xbuf_A37 A37 A_in37 inv_buffer
Xbuf_B37 B37 B_in37 inv_buffer
Xbuf_A38 A38 A_in38 inv_buffer
Xbuf_B38 B38 B_in38 inv_buffer
Xbuf_A39 A39 A_in39 inv_buffer
Xbuf_B39 B39 B_in39 inv_buffer
Xbuf_A40 A40 A_in40 inv_buffer
Xbuf_B40 B40 B_in40 inv_buffer
Xbuf_A41 A41 A_in41 inv_buffer
Xbuf_B41 B41 B_in41 inv_buffer
Xbuf_A42 A42 A_in42 inv_buffer
Xbuf_B42 B42 B_in42 inv_buffer
Xbuf_A43 A43 A_in43 inv_buffer
Xbuf_B43 B43 B_in43 inv_buffer
Xbuf_A44 A44 A_in44 inv_buffer
Xbuf_B44 B44 B_in44 inv_buffer
Xbuf_A45 A45 A_in45 inv_buffer
Xbuf_B45 B45 B_in45 inv_buffer
Xbuf_A46 A46 A_in46 inv_buffer
Xbuf_B46 B46 B_in46 inv_buffer
Xbuf_A47 A47 A_in47 inv_buffer
Xbuf_B47 B47 B_in47 inv_buffer
Xbuf_A48 A48 A_in48 inv_buffer
Xbuf_B48 B48 B_in48 inv_buffer
Xbuf_A49 A49 A_in49 inv_buffer
Xbuf_B49 B49 B_in49 inv_buffer
Xbuf_A50 A50 A_in50 inv_buffer
Xbuf_B50 B50 B_in50 inv_buffer
Xbuf_A51 A51 A_in51 inv_buffer
Xbuf_B51 B51 B_in51 inv_buffer
Xbuf_A52 A52 A_in52 inv_buffer
Xbuf_B52 B52 B_in52 inv_buffer
Xbuf_A53 A53 A_in53 inv_buffer
Xbuf_B53 B53 B_in53 inv_buffer
Xbuf_A54 A54 A_in54 inv_buffer
Xbuf_B54 B54 B_in54 inv_buffer
Xbuf_A55 A55 A_in55 inv_buffer
Xbuf_B55 B55 B_in55 inv_buffer
Xbuf_A56 A56 A_in56 inv_buffer
Xbuf_B56 B56 B_in56 inv_buffer
Xbuf_A57 A57 A_in57 inv_buffer
Xbuf_B57 B57 B_in57 inv_buffer
Xbuf_A58 A58 A_in58 inv_buffer
Xbuf_B58 B58 B_in58 inv_buffer
Xbuf_A59 A59 A_in59 inv_buffer
Xbuf_B59 B59 B_in59 inv_buffer
Xbuf_A60 A60 A_in60 inv_buffer
Xbuf_B60 B60 B_in60 inv_buffer
Xbuf_A61 A61 A_in61 inv_buffer
Xbuf_B61 B61 B_in61 inv_buffer
Xbuf_A62 A62 A_in62 inv_buffer
Xbuf_B62 B62 B_in62 inv_buffer
Xbuf_A63 A63 A_in63 inv_buffer
Xbuf_B63 B63 B_in63 inv_buffer
****************************************************************************************************

Xcom VSS VDD A_in63 A_in62 A_in61 A_in60 A_in59 A_in58 A_in57 A_in56 A_in55 A_in54 A_in53 A_in52 A_in51 A_in50 A_in49 A_in48 A_in47 A_in46 A_in45 A_in44 A_in43 A_in42 A_in41 A_in40 A_in39 A_in38 A_in37 A_in36 A_in35 A_in34 A_in33 A_in32 A_in31 A_in30 A_in29 A_in28 A_in27 A_in26 A_in25 A_in24 A_in23 A_in22 A_in21 A_in20 A_in19 A_in18 A_in17 A_in16 A_in15 A_in14 A_in13 A_in12 A_in11 A_in10 A_in9 A_in8 A_in7 A_in6 A_in5 A_in4 A_in3 A_in2 A_in1 A_in0 B_in63 B_in62 B_in61 B_in60 B_in59 B_in58 B_in57 B_in56 B_in55 B_in54 B_in53 B_in52 B_in51 B_in50 B_in49 B_in48 B_in47 B_in46 B_in45 B_in44 B_in43 B_in42 B_in41 B_in40 B_in39 B_in38 B_in37 B_in36 B_in35 B_in34 B_in33 B_in32 B_in31 B_in30 B_in29 B_in28 B_in27 B_in26 B_in25 B_in24 B_in23 B_in22 B_in21 B_in20 B_in19 B_in18 B_in17 B_in16 B_in15 B_in14 B_in13 B_in12 B_in11 B_in10 B_in9 B_in8 B_in7 B_in6 B_in5 B_in4 B_in3 B_in2 B_in1 B_in0 Out Comparator

.SUBCKT Comparator VSS VDD  A[63] A[62] A[61] A[60] A[59] A[58] A[57] A[56] A[55] A[54] A[53] A[52] A[51] A[50] A[49] A[48] A[47] A[46] A[45] A[44] A[43] A[42] A[41] A[40] A[39] A[38] A[37] A[36] A[35] A[34] A[33] A[32] A[31] A[30] A[29] A[28] A[27] A[26] A[25] A[24] A[23] A[22] A[21] A[20] A[19] A[18] A[17] A[16] A[15] A[14] A[13] A[12] A[11] A[10] A[9] A[8] A[7] A[6] A[5] A[4] A[3] A[2] A[1] A[0] B[63] B[62] B[61] B[60] B[59] B[58] B[57] B[56] B[55] B[54] B[53] B[52] B[51] B[50] B[49] B[48] B[47] B[46] B[45] B[44] B[43] B[42] B[41] B[40] B[39] B[38] B[37] B[36] B[35] B[34] B[33] B[32] B[31] B[30] B[29] B[28] B[27] B[26] B[25] B[24] B[23] B[22] B[21] B[20] B[19] B[18] B[17] B[16] B[15] B[14] B[13] B[12] B[11] B[10] B[9] B[8] B[7] B[6] B[5] B[4] B[3] B[2] B[1] B[0] Out
XU9 VSS VDD  Out_t Out BUFx2_ASAP7_75T_R
XU10 VSS VDD  n1 n2 n3 n4 n5 Out_t NOR5xp2_ASAP7_75t_R

XU11 VSS VDD  n6 n7 n8 n9 n10 n5 NAND5xp2_ASAP7_75t_R
XU12 VSS VDD  B[4] A[4] n14 XOR2xp5_ASAP7_75t_R
XU13 VSS VDD  B[5] A[5] n13 XOR2xp5_ASAP7_75t_R
XU14 VSS VDD  B[6] A[6] n12 XOR2xp5_ASAP7_75t_R
XU15 VSS VDD  B[7] A[7] n11 XOR2xp5_ASAP7_75t_R
XU16 VSS VDD  B[3] A[3] n9 XNOR2xp5_ASAP7_75t_R
XU17 VSS VDD  B[2] A[2] n8 XNOR2xp5_ASAP7_75t_R
XU18 VSS VDD  B[1] A[1] n7 XNOR2xp5_ASAP7_75t_R
XU19 VSS VDD  B[0] A[0] n6 XNOR2xp5_ASAP7_75t_R
*XU6 VSS VDD  n4_t n4 BUFx2_ASAP7_75T_R

XU20 VSS VDD  n15 n16 n17 n18 n19 n4 NAND5xp2_ASAP7_75t_R
XU21 VSS VDD  B[14] A[14] n23 XOR2xp5_ASAP7_75t_R
XU22 VSS VDD  B[15] A[15] n22 XOR2xp5_ASAP7_75t_R
XU23 VSS VDD  B[8] A[8] n21 XOR2xp5_ASAP7_75t_R
XU24 VSS VDD  B[9] A[9] n20 XOR2xp5_ASAP7_75t_R
XU25 VSS VDD  B[13] A[13] n18 XNOR2xp5_ASAP7_75t_R
XU26 VSS VDD  B[12] A[12] n17 XNOR2xp5_ASAP7_75t_R
XU27 VSS VDD  B[11] A[11] n16 XNOR2xp5_ASAP7_75t_R
XU28 VSS VDD  B[10] A[10] n15 XNOR2xp5_ASAP7_75t_R
*XU5 VSS VDD  n3_t n3 BUFx2_ASAP7_75T_R

XU29 VSS VDD  n24 n25 n26 n27 n28 n3 NAND5xp2_ASAP7_75t_R
XU30 VSS VDD  B[20] A[20] n32 XOR2xp5_ASAP7_75t_R
XU31 VSS VDD  B[21] A[21] n31 XOR2xp5_ASAP7_75t_R
XU32 VSS VDD  B[22] A[22] n30 XOR2xp5_ASAP7_75t_R
XU33 VSS VDD  B[23] A[23] n29 XOR2xp5_ASAP7_75t_R
XU34 VSS VDD  B[19] A[19] n27 XNOR2xp5_ASAP7_75t_R
XU35 VSS VDD  B[18] A[18] n26 XNOR2xp5_ASAP7_75t_R
XU36 VSS VDD  B[17] A[17] n25 XNOR2xp5_ASAP7_75t_R
XU37 VSS VDD  B[16] A[16] n24 XNOR2xp5_ASAP7_75t_R
*XU7 VSS VDD  n2_t n2 BUFx2_ASAP7_75T_R

XU38 VSS VDD  n33 n34 n35 n36 n37 n2 NAND5xp2_ASAP7_75t_R
XU39 VSS VDD  B[36] A[36] n41 XOR2xp5_ASAP7_75t_R
XU40 VSS VDD  B[37] A[37] n40 XOR2xp5_ASAP7_75t_R
XU41 VSS VDD  B[38] A[38] n39 XOR2xp5_ASAP7_75t_R
XU42 VSS VDD  B[39] A[39] n38 XOR2xp5_ASAP7_75t_R
XU43 VSS VDD  B[35] A[35] n36 XNOR2xp5_ASAP7_75t_R
XU44 VSS VDD  B[34] A[34] n35 XNOR2xp5_ASAP7_75t_R
XU45 VSS VDD  B[33] A[33] n34 XNOR2xp5_ASAP7_75t_R
XU46 VSS VDD  B[32] A[32] n33 XNOR2xp5_ASAP7_75t_R
XU94 VSS VDD  n45_t n45 BUFx2_ASAP7_75T_R

XU47 VSS VDD  n46 n47 n48 n49 n50 n45_t NOR5xp2_ASAP7_75t_R
XU48 VSS VDD  B[24] A[24] n50 XOR2xp5_ASAP7_75t_R
XU49 VSS VDD  B[25] A[25] n49 XOR2xp5_ASAP7_75t_R
XU50 VSS VDD  B[26] A[26] n48 XOR2xp5_ASAP7_75t_R
XU51 VSS VDD  B[27] A[27] n47 XOR2xp5_ASAP7_75t_R
XU52 VSS VDD  B[31] A[31] n54 XNOR2xp5_ASAP7_75t_R
XU53 VSS VDD  B[30] A[30] n53 XNOR2xp5_ASAP7_75t_R
XU54 VSS VDD  B[29] A[29] n52 XNOR2xp5_ASAP7_75t_R
XU55 VSS VDD  B[28] A[28] n51 XNOR2xp5_ASAP7_75t_R
XU93 VSS VDD  n44_t n44 BUFx2_ASAP7_75T_R

XU56 VSS VDD  n55 n56 n57 n58 n59 n44_t NOR5xp2_ASAP7_75t_R
XU57 VSS VDD  B[56] A[56] n59 XOR2xp5_ASAP7_75t_R
XU58 VSS VDD  B[57] A[57] n58 XOR2xp5_ASAP7_75t_R
XU59 VSS VDD  B[58] A[58] n57 XOR2xp5_ASAP7_75t_R
XU60 VSS VDD  B[59] A[59] n56 XOR2xp5_ASAP7_75t_R
XU61 VSS VDD  B[63] A[63] n63 XNOR2xp5_ASAP7_75t_R
XU62 VSS VDD  B[62] A[62] n62 XNOR2xp5_ASAP7_75t_R
XU63 VSS VDD  B[61] A[61] n61 XNOR2xp5_ASAP7_75t_R
XU64 VSS VDD  B[60] A[60] n60 XNOR2xp5_ASAP7_75t_R
XU92 VSS VDD  n43_t n43 BUFx2_ASAP7_75T_R

XU65 VSS VDD  n64 n65 n66 n67 n68 n43_t NOR5xp2_ASAP7_75t_R
XU66 VSS VDD  B[48] A[48] n68 XOR2xp5_ASAP7_75t_R
XU67 VSS VDD  B[49] A[49] n67 XOR2xp5_ASAP7_75t_R
XU68 VSS VDD  B[50] A[50] n66 XOR2xp5_ASAP7_75t_R
XU69 VSS VDD  B[51] A[51] n65 XOR2xp5_ASAP7_75t_R
XU70 VSS VDD  B[55] A[55] n72 XNOR2xp5_ASAP7_75t_R
XU71 VSS VDD  B[54] A[54] n71 XNOR2xp5_ASAP7_75t_R
XU72 VSS VDD  B[53] A[53] n70 XNOR2xp5_ASAP7_75t_R
XU73 VSS VDD  B[52] A[52] n69 XNOR2xp5_ASAP7_75t_R
XU74 VSS VDD  n73 n74 n75 n76 n77 n42 NOR5xp2_ASAP7_75t_R
XU75 VSS VDD  B[40] A[40] n77 XOR2xp5_ASAP7_75t_R
XU76 VSS VDD  B[41] A[41] n76 XOR2xp5_ASAP7_75t_R
XU77 VSS VDD  B[42] A[42] n75 XOR2xp5_ASAP7_75t_R
XU78 VSS VDD  B[43] A[43] n74 XOR2xp5_ASAP7_75t_R
XU79 VSS VDD  B[47] A[47] n81 XNOR2xp5_ASAP7_75t_R
XU80 VSS VDD  B[46] A[46] n80 XNOR2xp5_ASAP7_75t_R
XU81 VSS VDD  B[45] A[45] n79 XNOR2xp5_ASAP7_75t_R
XU82 VSS VDD  B[44] A[44] n78 XNOR2xp5_ASAP7_75t_R
XU8 VSS VDD  n1_t n1 BUFx2_ASAP7_75T_R

XU83 VSS VDD  n42 n43 n44 n45 n1_t NAND4xp25_ASAP7_75t_R
XU84 VSS VDD  n60 n61 n62 n63 n55 NAND4xp25_ASAP7_75t_R
XU85 VSS VDD  n51 n52 n53 n54 n46 NAND4xp25_ASAP7_75t_R
XU3 VSS VDD  n64_t n64 BUFx2_ASAP7_75T_R

XU86 VSS VDD  n69 n70 n71 n72 n64_t NAND4xp25_ASAP7_75t_R
XU4 VSS VDD  n73_t n73 BUFx2_ASAP7_75T_R

XU87 VSS VDD  n78 n79 n80 n81 n73_t NAND4xp25_ASAP7_75t_R
XU88 VSS VDD  n11 n12 n13 n14 n10 NOR4xp25_ASAP7_75t_R
XU2 VSS VDD  n19_t n19 BUFx2_ASAP7_75T_R

XU89 VSS VDD  n20 n21 n22 n23 n19_t NOR4xp25_ASAP7_75t_R
XU90 VSS VDD  n29 n30 n31 n32 n28 NOR4xp25_ASAP7_75t_R
XU1 VSS VDD  n37_t n37 BUFx2_ASAP7_75T_R

XU91 VSS VDD  n38 n39 n40 n41 n37_t NOR4xp25_ASAP7_75t_R

*********wire-loading******************
Cload1 n1 GND 3f
Cload2 n2 GND 3f
Cload3 n3 GND 3f
Cload4 n4 GND 3f
Cload5 n5 GND 3f
Cload6 n6 GND 3f
Cload7 n7 GND 3f
Cload8 n8 GND 3f
Cload9 n9 GND 3f
Cload10 n10 GND 3f
Cload11 n11 GND 3f
Cload12 n12 GND 3f
Cload13 n13 GND 3f
Cload14 n14 GND 3f
Cload15 n15 GND 3f
Cload16 n16 GND 3f
Cload17 n17 GND 3f
Cload18 n18 GND 3f
Cload19 n19 GND 3f
Cload20 n20 GND 3f
Cload21 n21 GND 3f
Cload22 n22 GND 3f
Cload23 n23 GND 3f
Cload24 n24 GND 3f
Cload25 n25 GND 3f
Cload26 n26 GND 3f
Cload27 n27 GND 3f
Cload28 n28 GND 3f
Cload29 n29 GND 3f
Cload30 n30 GND 3f
Cload31 n31 GND 3f
Cload32 n32 GND 3f
Cload33 n33 GND 3f
Cload34 n34 GND 3f
Cload35 n35 GND 3f
Cload36 n36 GND 3f
Cload37 n37 GND 3f
Cload38 n38 GND 3f
Cload39 n39 GND 3f
Cload40 n40 GND 3f
Cload41 n41 GND 3f
Cload42 n42 GND 3f
Cload43 n43 GND 3f
Cload44 n44 GND 3f
Cload45 n45 GND 3f
Cload46 n46 GND 3f
Cload47 n47 GND 3f
Cload48 n48 GND 3f
Cload49 n49 GND 3f
Cload50 n50 GND 3f
Cload51 n51 GND 3f
Cload52 n52 GND 3f
Cload53 n53 GND 3f
Cload54 n54 GND 3f
Cload55 n55 GND 3f
Cload56 n56 GND 3f
Cload57 n57 GND 3f
Cload58 n58 GND 3f
Cload59 n59 GND 3f
Cload60 n60 GND 3f
Cload61 n61 GND 3f
Cload62 n62 GND 3f
Cload63 n63 GND 3f
Cload64 n64 GND 3f
Cload65 n65 GND 3f
Cload66 n66 GND 3f
Cload67 n67 GND 3f
Cload68 n68 GND 3f
Cload69 n69 GND 3f
Cload70 n70 GND 3f
Cload71 n71 GND 3f
Cload72 n72 GND 3f
Cload73 n73 GND 3f
Cload74 n74 GND 3f
Cload75 n75 GND 3f
Cload76 n76 GND 3f
Cload77 n77 GND 3f
Cload78 n78 GND 3f
Cload79 n79 GND 3f
Cload80 n80 GND 3f
Cload81 n81 GND 3f
*****************************************************************************
.ENDS

******************************************
**      Your Circuit  (4-bit adder)     **
******************************************

*********Outputs (please note the name of the output ports)******************
Cload0 Out GND 5f
*****************************************************************************


.tran 0.1ps 20ns
*****************************
**    Simulator setting    **
*****************************
.option post 
.options probe			*with I/V in .lis
.probe v(*) i(*)
.option captab			*with cap value in .lis
.TEMP 25
.op


*****************************
**         Measure         **
*****************************
.meas tran AVG_Power_Convolution AVG power
.measure TRAN Worst_case_delay_rise TRIG V(A_in0)    VAL=0.35 RISE=1 TARG V(Out) VAL=0.35 RISE=1
.measure tran Tr_out trig v(Out) val=0.035v rise=1
+                    targ v(Out) val=0.315v rise=1 
.measure tran Tf_out trig v(Out) val=0.315v fall=1
+                    targ v(Out) val=0.035v fall=1 

.end



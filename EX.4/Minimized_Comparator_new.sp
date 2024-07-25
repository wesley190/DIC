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
Vvdd VDD GND 0.4v
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
Xbuf_A A A_in inv_buffer
Xbuf_B B B_in inv_buffer
****************************************************************************************************

Xcom VSS VDD A_in[63] A_in[62] A_in[61] A_in[60] A_in[59] A_in[58] A_in[57] A_in[56] A_in[55] A_in[54] A_in[53] A_in[52] A_in[51] A_in[50] A_in[49] A_in[48] A_in[47] A_in[46] A_in[45] A_in[44] A[43] A_in[42] A_in[41] A_in[40] A_in[39] A_in[38] A_in[37] A_in[36] A_in[35] A_in[34] A_in[33] A_in[32] A_in[31] A_in[30] A_in[29] A_in[28] A_in[27] A_in[26] A_in[25] A_in[24] A_in[23] A_in[22] A_in[21] A_in[20] A_in[19] A_in[18] A_in[17] A_in[16] A_in[15] A_in[14] A_in[13] A_in[12] A_in[11] A_in[10] A_in[9] A_in[8] A_in[7] A_in[6] A_in[5] A_inA[4] A_in[3] A_in[2] A_in[1] A_in[0] B_in[63] B_in[62] B_in[A_in61] B_in[60] B_in[59] B_in[58] B_in[57] B_in[56] B_in[55] B_in[54] B_in[53] B_in[52] B_in[51] B_in[50] B_in[49] B_in[48] B_in[47] B_in[46] B_in[45] B_in[44] B_in[43] B_in[42] B_in[41] B_in[40] B_in[39] B_in[38] B_in[37] B_in[36] B_in[35] B_in[34] B_in[33] B_in[32] B_in[31] B_in[30] B_in[29] B_in[28] B_in[27] B_in[26] B_in[25] B_in[24] B_in[23] B_in[22] B_in[21] B_in[20] B_in[19] B_in[18] B_in[17] B_in[16] B_in[15] B_in[14] B_in[13] B_in[12] B_in[11] B_in[10] A_inB[9] B_in[8] B_in[7] B_in[6] B_in[5] B_in[4] B_in[3] A_inB[2] B_in[1] B_in[0] Out Comparator

.SUBCKT Comparator VSS VDD  A[63] A[62] A[61] A[60] A[59] A[58] A[57] A[56] A[55] A[54] A[53] A[52] A[51] A[50] A[49] A[48] A[47] A[46] A[45] A[44] A[43] A[42] A[41] A[40] A[39] A[38] A[37] A[36] A[35] A[34] A[33] A[32] A[31] A[30] A[29] A[28] A[27] A[26] A[25] A[24] A[23] A[22] A[21] A[20] A[19] A[18] A[17] A[16] A[15] A[14] A[13] A[12] A[11] A[10] A[9] A[8] A[7] A[6] A[5] A[4] A[3] A[2] A[1] A[0] B[63] B[62] B[61] B[60] B[59] B[58] B[57] B[56] B[55] B[54] B[53] B[52] B[51] B[50] B[49] B[48] B[47] B[46] B[45] B[44] B[43] B[42] B[41] B[40] B[39] B[38] B[37] B[36] B[35] B[34] B[33] B[32] B[31] B[30] B[29] B[28] B[27] B[26] B[25] B[24] B[23] B[22] B[21] B[20] B[19] B[18] B[17] B[16] B[15] B[14] B[13] B[12] B[11] B[10] B[9] B[8] B[7] B[6] B[5] B[4] B[3] B[2] B[1] B[0] Out
XU10 VSS VDD  n1 n2 n3 n4 n5 Out NOR5xp2_ASAP7_75t_R
XU11 VSS VDD  n6 n7 n8 n9 n10 n5 NAND5xp2_ASAP7_75t_R
XU12 VSS VDD  B[4] A[4] n14 XOR2xp5_ASAP7_75t_R
XU13 VSS VDD  B[5] A[5] n13 XOR2xp5_ASAP7_75t_R
XU14 VSS VDD  B[6] A[6] n12 XOR2xp5_ASAP7_75t_R
XU15 VSS VDD  B[7] A[7] n11 XOR2xp5_ASAP7_75t_R
XU16 VSS VDD  B[3] A[3] n9 XNOR2xp5_ASAP7_75t_R
XU17 VSS VDD  B[2] A[2] n8 XNOR2xp5_ASAP7_75t_R
XU18 VSS VDD  B[1] A[1] n7 XNOR2xp5_ASAP7_75t_R
XU19 VSS VDD  B[0] A[0] n6 XNOR2xp5_ASAP7_75t_R
XU20 VSS VDD  n15 n16 n17 n18 n19 n4 NAND5xp2_ASAP7_75t_R
XU21 VSS VDD  B[14] A[14] n23 XOR2xp5_ASAP7_75t_R
XU22 VSS VDD  B[15] A[15] n22 XOR2xp5_ASAP7_75t_R
XU23 VSS VDD  B[8] A[8] n21 XOR2xp5_ASAP7_75t_R
XU24 VSS VDD  B[9] A[9] n20 XOR2xp5_ASAP7_75t_R
XU25 VSS VDD  B[13] A[13] n18 XNOR2xp5_ASAP7_75t_R
XU26 VSS VDD  B[12] A[12] n17 XNOR2xp5_ASAP7_75t_R
XU27 VSS VDD  B[11] A[11] n16 XNOR2xp5_ASAP7_75t_R
XU28 VSS VDD  B[10] A[10] n15 XNOR2xp5_ASAP7_75t_R
XU29 VSS VDD  n24 n25 n26 n27 n28 n3 NAND5xp2_ASAP7_75t_R
XU30 VSS VDD  B[20] A[20] n32 XOR2xp5_ASAP7_75t_R
XU31 VSS VDD  B[21] A[21] n31 XOR2xp5_ASAP7_75t_R
XU32 VSS VDD  B[22] A[22] n30 XOR2xp5_ASAP7_75t_R
XU33 VSS VDD  B[23] A[23] n29 XOR2xp5_ASAP7_75t_R
XU34 VSS VDD  B[19] A[19] n27 XNOR2xp5_ASAP7_75t_R
XU35 VSS VDD  B[18] A[18] n26 XNOR2xp5_ASAP7_75t_R
XU36 VSS VDD  B[17] A[17] n25 XNOR2xp5_ASAP7_75t_R
XU37 VSS VDD  B[16] A[16] n24 XNOR2xp5_ASAP7_75t_R
XU38 VSS VDD  n33 n34 n35 n36 n37 n2 NAND5xp2_ASAP7_75t_R
XU39 VSS VDD  B[36] A[36] n41 XOR2xp5_ASAP7_75t_R
XU40 VSS VDD  B[37] A[37] n40 XOR2xp5_ASAP7_75t_R
XU41 VSS VDD  B[38] A[38] n39 XOR2xp5_ASAP7_75t_R
XU42 VSS VDD  B[39] A[39] n38 XOR2xp5_ASAP7_75t_R
XU43 VSS VDD  B[35] A[35] n36 XNOR2xp5_ASAP7_75t_R
XU44 VSS VDD  B[34] A[34] n35 XNOR2xp5_ASAP7_75t_R
XU45 VSS VDD  B[33] A[33] n34 XNOR2xp5_ASAP7_75t_R
XU46 VSS VDD  B[32] A[32] n33 XNOR2xp5_ASAP7_75t_R
XU47 VSS VDD  n46 n47 n48 n49 n50 n45 NOR5xp2_ASAP7_75t_R
XU48 VSS VDD  B[24] A[24] n50 XOR2xp5_ASAP7_75t_R
XU49 VSS VDD  B[25] A[25] n49 XOR2xp5_ASAP7_75t_R
XU50 VSS VDD  B[26] A[26] n48 XOR2xp5_ASAP7_75t_R
XU51 VSS VDD  B[27] A[27] n47 XOR2xp5_ASAP7_75t_R
XU52 VSS VDD  B[31] A[31] n54 XNOR2xp5_ASAP7_75t_R
XU53 VSS VDD  B[30] A[30] n53 XNOR2xp5_ASAP7_75t_R
XU54 VSS VDD  B[29] A[29] n52 XNOR2xp5_ASAP7_75t_R
XU55 VSS VDD  B[28] A[28] n51 XNOR2xp5_ASAP7_75t_R
XU56 VSS VDD  n55 n56 n57 n58 n59 n44 NOR5xp2_ASAP7_75t_R
XU57 VSS VDD  B[56] A[56] n59 XOR2xp5_ASAP7_75t_R
XU58 VSS VDD  B[57] A[57] n58 XOR2xp5_ASAP7_75t_R
XU59 VSS VDD  B[58] A[58] n57 XOR2xp5_ASAP7_75t_R
XU60 VSS VDD  B[59] A[59] n56 XOR2xp5_ASAP7_75t_R
XU61 VSS VDD  B[63] A[63] n63 XNOR2xp5_ASAP7_75t_R
XU62 VSS VDD  B[62] A[62] n62 XNOR2xp5_ASAP7_75t_R
XU63 VSS VDD  B[61] A[61] n61 XNOR2xp5_ASAP7_75t_R
XU64 VSS VDD  B[60] A[60] n60 XNOR2xp5_ASAP7_75t_R
XU65 VSS VDD  n64 n65 n66 n67 n68 n43 NOR5xp2_ASAP7_75t_R
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
XU83 VSS VDD  n42 n43 n44 n45 n1 NAND4xp25_ASAP7_75t_R
XU84 VSS VDD  n60 n61 n62 n63 n55 NAND4xp25_ASAP7_75t_R
XU85 VSS VDD  n51 n52 n53 n54 n46 NAND4xp25_ASAP7_75t_R
XU86 VSS VDD  n69 n70 n71 n72 n64 NAND4xp25_ASAP7_75t_R
XU87 VSS VDD  n78 n79 n80 n81 n73 NAND4xp25_ASAP7_75t_R
XU88 VSS VDD  n11 n12 n13 n14 n10 NOR4xp25_ASAP7_75t_R
XU89 VSS VDD  n20 n21 n22 n23 n19 NOR4xp25_ASAP7_75t_R
XU90 VSS VDD  n29 n30 n31 n32 n28 NOR4xp25_ASAP7_75t_R
XU91 VSS VDD  n38 n39 n40 n41 n37 NOR4xp25_ASAP7_75t_R
.ENDS

******************************************
**      Your Circuit  (4-bit adder)     **
******************************************

*********Outputs (please note the name of the output ports)******************
Cload0 Out GND 5f
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


.tran 0.1ps 6ns
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
.measure TRAN Worst_case_delay_rise TRIG V(A_in[0])    VAL=0.2 RISE=1 TARG V(Out) VAL=0.2 RISE=1


.end



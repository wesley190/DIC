.TITLE Ex_2_4

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
.VEC "Pattern_adder_4bit.vec"

*****************************
**     Voltage Source      **
*****************************
.global VDD GND
Vvdd VDD GND 0.7v
Vvss VSS GND 0 0


**.SUBCKT inverter in out 
**Mp1 out in VDD x pmos_lvt m=3
**Mn1 out in GND x nmos_lvt m=3
**.ENDS
**.SUBCKT inv_buffer in out 
**Xinv1 in mid inverter
**Xinv2 mid out inverter
**.ENDS



*********Inputs(please use these signals as inputs for your desing)*********************************
**Xbuf_A A A_in inv_buffer
**Xbuf_B B B_in inv_buffer
**Xbuf_C Cin Cin_buf inv_buffer
****************************************************************************************************

Xadd VSS VDD A[3] A[2] A[1] A[0] B[3] B[2] B[1] B[0] Output[4] Output[3] Output[2] Output[1] Output[0] Adder_4bit

.SUBCKT Adder_4bit VSS VDD A[3] A[2] A[1] A[0] B[3] B[2] B[1] B[0] Output[4] Output[3] Output[2] Output[1] Output[0]
XU14 VSS VDD B[1] A[1] n16 NAND2xp33_ASAP7_75t_R
XU15 VSS VDD n14 n13 n17 NAND2xp33_ASAP7_75t_R
XU16 VSS VDD n14 n10 n11 NAND2xp33_ASAP7_75t_R
XU17 VSS VDD B[3] n21 INVxp33_ASAP7_75t_R
XU18 VSS VDD A[3] n22 INVxp33_ASAP7_75t_R
XU19 VSS VDD A[2] B[2] n15 NAND2xp33_ASAP7_75t_R
XU20 VSS VDD n16 n9 n10 NAND2xp33_ASAP7_75t_R
XU21 VSS VDD A[0] B[0] n8 NOR2xp33_ASAP7_75t_R
XU22 VSS VDD A[0] B[0] n13 AND2x2_ASAP7_75t_R
XU23 VSS VDD n8 n13 Output[0] NOR2xp33_ASAP7_75t_R
XU24 VSS VDD n13 n9 INVx1_ASAP7_75t_R
XU25 VSS VSS VDD B[1] A[1] n9 Output[1] FAx1_ASAP7_75t_R
XU26 VSS VDD A[2] B[2] n12 XOR2xp5_ASAP7_75t_R
XU27 VSS VDD B[1] A[1] n14 OR2x2_ASAP7_75t_R
XU28 VSS VDD n12 n11 Output[2] XNOR2xp5_ASAP7_75t_R
XU29 VSS VDD n17 n16 n15 n19 NAND3xp33_ASAP7_75t_R
XU30 VSS VDD A[2] B[2] n18 OR2x2_ASAP7_75t_R
XU31 VSS VDD n19 n18 n23 NAND2xp5_ASAP7_75t_R
XU32 VSS VDD A[3] B[3] n20 XNOR2xp5_ASAP7_75t_R
XU33 VSS VDD n23 n20 Output[3] XOR2xp5_ASAP7_75t_R
XU34 VSS VDD n23 n22 n21 Output[4] MAJIxp5_ASAP7_75t_R
.ENDS


******************************************
**      Your Circuit  (4-bit adder)     **
******************************************










*********Outputs (please note the name of the output ports)******************
Cload1 Output[4] GND 5f
Cload2 Output[3] GND 5f
Cload3 Output[2] GND 5f
Cload4 Output[1] GND 5f
Cload5 Output[0] GND 5f
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
.meas tran AVG_Power_NAND AVG power
.measure TRAN Worst_case_delay TRIG V(A[0])    VAL=0.35 RISE=1 TARG V(output[4]) VAL=0.35 RISE=1

.end

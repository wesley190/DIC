.SUBCKT Adder_4bit A[3] A[2] A[1] A[0] B[3] B[2] B[1] B[0] Output[4] Output[3] Output[2] Output[1] Output[0]
XU13 n11 n10 n21 NOR2xp67_ASAP7_75t_R
XU14 B[2] n19 INVxp67_ASAP7_75t_R
XU15 A[2] n20 INVxp67_ASAP7_75t_R
XU16 n17 n16 n18 NOR2xp33_ASAP7_75t_R
XU17 n16 n9 n17 n10 NOR3xp33_ASAP7_75t_R
XU18 n15 n13 INVxp33_ASAP7_75t_R
XU19 B[2] A[2] n11 NOR2xp33_ASAP7_75t_R
XU20 B[1] A[1] n8 NOR2xp33_ASAP7_75t_R
XU21 A[0] B[0] n15 NAND2x1p5_ASAP7_75t_R
XU22 n8 n15 n16 NOR2xp33_ASAP7_75t_R
XU23 B[2] A[2] n9 AND2x2_ASAP7_75t_R
XU24 B[1] A[1] n17 AND2x2_ASAP7_75t_R
XU25 n21 A[3] B[3] n12 MAJIxp5_ASAP7_75t_R
XU26 n12 Output[4] INVxp33_ASAP7_75t_R
XU27 A[0] B[0] n14 NOR2xp33_ASAP7_75t_R
XU28 n14 n13 Output[0] NOR2xp33_ASAP7_75t_R
XU29 B[1] A[1] n15 Output[1] FAx1_ASAP7_75t_R
XU30 n20 n19 n18 Output[2] FAx1_ASAP7_75t_R
XU31 A[3] B[3] n22 XNOR2xp5_ASAP7_75t_R
XU32 n22 n21 Output[3] XNOR2xp5_ASAP7_75t_R
.ENDS



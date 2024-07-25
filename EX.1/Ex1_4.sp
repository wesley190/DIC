.prot
.include "7nm_TT.pm" 
.include "asap7sc7p5t_INVBUF_RVT.sp" 
.include "asap7sc7p5t_SIMPLE_RVT.sp" 
.include "Buffer.sp"
.unprot

.op
.option post
.TEMP 25
.global VDD GND
.option 


***************************************
*              signal                 *
***************************************

V1 VDD GND 0.7V

V2 IN  GND PULSE(0v 0.7v 5.0ns 0.1ns 0.1ns 3.8ns 8ns)
V3 A   GND PULSE(0v 0.7v 5.0ns 0.1ns 0.1ns 3.8ns 8ns)
V4 B   GND PULSE(0v 0.7v 2.9ns 0.1ns 0.1ns 1.9ns 4ns)

Cload_NOR  Vout_NOR  GND 10f
Cload_NAND Vout_NAND GND 10f

***************************************
*              circuit                *
***************************************

XNOR  GND VDD A B Vout_NOR NOR2x1_ASAP7_75t_R
XINV1 GND VDD Vout_NOR N1 INVx1_ASAP7_75t_R
XINV2 GND VDD Vout_NOR N2 INVx1_ASAP7_75t_R
XINV3 GND VDD Vout_NOR N3 INVx1_ASAP7_75t_R
XINV4 GND VDD Vout_NOR N4 INVx1_ASAP7_75t_R

XNAND GND VDD A B Vout_NAND NAND2x1_ASAP7_75t_R
XINV5 GND VDD Vout_NAND N5 INVx1_ASAP7_75t_R
XINV6 GND VDD Vout_NAND N6 INVx1_ASAP7_75t_R
XINV7 GND VDD Vout_NAND N7 INVx1_ASAP7_75t_R
XINV8 GND VDD Vout_NAND N8 INVx1_ASAP7_75t_R

***************************************
*            measurement              *
***************************************

.tran 0.1ns 60ns


.meas tran Tf_NOR     trig v(Vout_NOR)  val='0.7*0.9' fall=1
+                     targ v(Vout_NOR)  val='0.7*0.1' fall=1
.meas tran Tr_NOR     trig v(Vout_NOR)  val='0.7*0.1' rise=1
+                     targ v(Vout_NOR)  val='0.7*0.9' rise=1
.meas tran Tphl_NOR   trig v(B)        val='0.7*0.5' rise=1
+                     targ v(Vout_NOR)  val='0.7*0.5' fall=1
.meas tran Tplh_NOR   trig v(B)        val='0.7*0.5' fall=1
+           	      targ v(Vout_NOR)  val='0.7*0.5' rise=1


.meas tran Tf_NAND     trig v(Vout_NAND)  val='0.7*0.9' fall=1
+               	   targ v(Vout_NAND)  val='0.7*0.1' fall=1
.meas tran Tr_NAND     trig v(Vout_NAND)  val='0.7*0.1' rise=1
+                	   targ v(Vout_NAND)  val='0.7*0.9' rise=1
.meas tran Tphl_NAND   trig v(B)          val='0.7*0.5' rise=2
+                 	   targ v(Vout_NAND)  val='0.7*0.5' fall=1
.meas tran Tplh_NAND   trig v(B)          val='0.7*0.5' fall=2
+                	   targ v(Vout_NAND)  val='0.7*0.5' rise=1
.op

.end
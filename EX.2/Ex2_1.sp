.TITLE Ex2_1

*****************************
**     Library setting     **
*****************************
.protect
.include '7nm_TT.pm'
.include 'asap7_75t_R_24.cdl'
.unprotect

*****************************
**     Voltage Source      **
*****************************
.global VDD GND
Vvdd VDD GND 0.7v

*****************************
**      Input Vector       **
*****************************
* .VEC 'Ex2_1.vec'

*****************************
**      Sub Circuit       **
*****************************
.subckt inverter in out
	Mp  out  in  VDD  x  pmos_rvt  m=1
	Mn  out  in  GND  x  nmos_rvt  m=1
.ends
.subckt buffer in out
	X_INV1 in   in_b inverter
	X_INV2 in_b out  inverter
.ends

*****************************
**      Your Circuit       **
*****************************
x_buffer_a vin_a a_in buffer
x_buffer_b vin_b b_in buffer
x_buffer_c vin_c c_in buffer

x_xor1 a_in  b_in      VDD GND ab_in XOR2x2_ASAP7_75t_R 
x_xor2 ab_in c_in      VDD GND s_o   XOR2x2_ASAP7_75t_R 
x_maj  a_in  b_in c_in VDD GND c_o   MAJx2_ASAP7_75t_R


c_co c_o GND 5f
c_so s_o GND 5f

*****************************
**  Transient Analysis     **
*****************************


*PULSE ( v1 v2 TD TR TF PW PER )
Vvina vin_a gnd pulse(0V 0.7V   2ns 0 0   2ns 4ns) 
Vvinb vin_b gnd pulse(0V 0.7V   1ns 0 0   1ns 2ns) 
Vvinc vin_c gnd pulse(0V 0.7V 0.5ns 0 0 0.5ns 1ns) 
*****************************
**    Simulator setting    **
*****************************
.tran 0.01ns 80ns
.option post 
.probe tran

.TEMP 25
*****************************
**      Measurement        **
*****************************
* hspice -i Ex2_1.sp -o Ex_2_1.lis
.measure tran pwr avg power 

.measure tran Tphl_cout trig v(a_in) val=0.63v rise=1
+                       targ v(c_o)  val=0.07v fall=1  

.measure tran Tr_sout   trig v(a_in) val=0.63v rise=1
+                       targ v(s_o)  val=0.63v rise=2


.end
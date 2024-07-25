.TITLE diff_logicfamily_1bit_fa

*****************************
**     Library setting     **
*****************************
.protect
.include '7nm_TT.pm'
.unprotect

*****************************
**     Voltage Source      **
*****************************
.global VDD GND
Vvdd VDD GND 0.7v

*****************************
**      Input Vector       **
*****************************
.VEC 'pattern_1bit_FA.vec'

*****************************
**      Sub Circuit       **
*****************************
* BUFFER
.subckt inverter in out
	Mp  out  in  VDD  x  pmos_rvt  m=1
	Mn  out  in  GND  x  nmos_rvt  m=1
.ends
.subckt buffer in out
	X_INV1 in   in_b inverter
	X_INV2 in_b out  inverter
.ends
* CMOS
.subckt and_cmos A B Y
    Mp1  n_o  A  VDD  x  pmos_rvt  m=1
    Mp2  n_o  B  VDD  x  pmos_rvt  m=1
    Mn1  n_o  A  a1   x  nmos_rvt  m=1
    Mn2  a1   B  GND  x  nmos_rvt  m=1
    xin  n_o  Y inverter
.ends
.subckt xor_cmos A B Y
    xin1 A A_ba inverter
    xin2 B B_ba inverter
    Mp1  a1  A_ba  VDD  x  pmos_rvt  m=4
    Mp2  a1  B_ba  VDD  x  pmos_rvt  m=4
    Mp3  Y   A     a1   x  pmos_rvt  m=4
    Mp4  Y   B     a1   x  pmos_rvt  m=4
    Mn1  Y   A     a2   x  nmos_rvt  m=1
    Mn2  Y   A_ba  a2   x  nmos_rvt  m=1
    Mn3  a2  B     GND  x  nmos_rvt  m=1
    Mn4  a2  B_ba  GND  x  nmos_rvt  m=1
.ends
.subckt or_cmos A B Y
    Mp1  a1   A  VDD  x  pmos_rvt  m=1
    Mp2  n_o  B  a1   x  pmos_rvt  m=1
    Mn1  n_o  A  GND  x  nmos_rvt  m=1
    Mn2  n_o  B  GND  x  nmos_rvt  m=1
    xin  n_o  Y inverter
.ends
.subckt FA_cmos Cout Sum A B Cin
    xand1  A  B   c0   and_cmos
    xxor1  A  B   s1   xor_cmos
    xand2  s1 Cin c1   and_cmos
    xxor2  s1 Cin Sum  xor_cmos
    xor    c0 c1  Cout or_cmos
.ends
* CPL
.subckt and_nand_cpl A B Y Y_ba
    xin1 A A_ba inverter
    xin2 B B_ba inverter
    Mn1  A    B    Y    x nmos_rvt  m=1
    Mn2  B    B_ba Y    x nmos_rvt  m=1
    Mn3  B_ba B_ba Y_ba x nmos_rvt  m=1
    Mn4  A_ba B    Y_ba x nmos_rvt  m=1
    * xin3 Y    nand_out inverter
    * xin4 Y_ba and_out  inverter
.ends
.subckt or_nor_cpl A B Y Y_ba
    xin1 A A_ba inverter
    xin2 B B_ba inverter
    Mn1  A    B_ba Y    x nmos_rvt  m=1
    Mn2  B    B    Y    x nmos_rvt  m=1
    Mn3  B_ba B    Y_ba x nmos_rvt  m=1
    Mn4  A_ba B_ba Y_ba x nmos_rvt  m=1
    * xin3 Y    nor_out inverter
    * xin4 Y_ba or_out  inverter
.ends
.subckt xor_nnor_cpl A B Y Y_ba
    xin1 A A_ba inverter
    xin2 B B_ba inverter
    Mn1  A    B_ba Y    x nmos_rvt  m=1
    Mn2  A_ba B    Y    x nmos_rvt  m=1
    Mn3  A_ba B_ba Y_ba x nmos_rvt  m=1
    Mn4  A    B    Y_ba x nmos_rvt  m=1
    * xin3 Y    nor_out inverter
    * xin4 Y_ba or_out  inverter
.ends
.subckt FA_cpl Cout Sum A B Cin 
    xxor1  A  B   s1  x     xor_nnor_cpl
    xxor2  s1 Cin s2  s2_ba xor_nnor_cpl
    xand1  A  B   c0  x     and_nand_cpl
    xand2  s1 Cin c1  x     and_nand_cpl
    xor    c0 c1  c2  c2_ba or_nor_cpl
    xin1   s2_ba  Sum  inverter
    xin2   c2_ba  Cout inverter
.ends
* DCVS
.subckt and_nand_dcvs vA vA_bar vB vB_bar out out_bar
    MpA  out_bar out     vdd vdd pmos_rvt m=1
    MpB  out     out_bar vdd vdd pmos_rvt m=1
    MnA  out_bar vA      vdn vdn nmos_rvt m=1
    MnB  vdn     vB      gnd gnd nmos_rvt m=1
    MnAb out     vA_bar  gnd gnd nmos_rvt m=1
    MnBb out     vB_bar  gnd gnd nmos_rvt m=1
.ends
.subckt or_nor_dcvs vA vA_bar vB vB_bar out out_bar
    MpA  out_bar out     vdd vdd pmos_rvt m=1
    MpB  out     out_bar vdd vdd pmos_rvt m=1
    MnA  out_bar vA      gnd gnd nmos_rvt m=1
    MnB  out_bar vB      gnd gnd nmos_rvt m=1
    MnAb out     vA_bar  vdn vdn nmos_rvt m=1
    MnBb vdn     vB_bar  gnd gnd nmos_rvt m=1
.ends
.subckt xor_xnor_dcvs vA vA_bar vB vB_bar out out_bar
    MpA   out     out_bar vdd  vdd  pmos_rvt m=1
    MpB   out_bar out     vdd vdd   pmos_rvt m=1
    MnB1  out     vB      vdn1 vdn1 nmos_rvt m=1
    MnBb1 out_bar vB_bar  vdn1 vdn1 nmos_rvt m=1
    MnA   vdn1    vA      gnd  gnd  nmos_rvt m=1
    MnB2  out_bar vB      vdn2 vdn2 nmos_rvt m=1
    MnBb2 out     vB_bar  vdn2 vdn2 nmos_rvt m=1
    MnAb  vdn2    vA_bar  gnd  gnd  nmos_rvt m=1
.ends
.subckt FA_dcvs Cout Sum vA vB vCin
    xinA  vA   vA_bar   inverter
    xinB  vB   vB_bar   inverter
    xinCi vCin vCin_bar inverter
    xxorab vA     vA_bar     vB     vB_bar     sum_ab sum_ab_bar xor_xnor_dcvs
    xxorcs vCin   vCin_bar   sum_ab sum_ab_bar sum    sum_bar    xor_xnor_dcvs
    xandab vA     vA_bar     vB     vB_bar     c_ab   c_ab_bar   and_nand_dcvs
    xandco sum_ab sum_ab_bar vCin   vCin_bar   c_co   c_co_bar   and_nand_dcvs
    xorco c_ab    c_ab_bar   c_co   c_co_bar   Cout   Cout_bar   or_nor_dcvs
.ends
*****************************
**      Your Circuit       **
*****************************
x_buffer_a vin_a a_in buffer
x_buffer_b vin_b b_in buffer
x_buffer_c vin_c c_in buffer

xFA_cmos cmos_cout cmos_sum a_in b_in c_in FA_cmos
xFA_cpl  cpl_cout  cpl_sum  a_in b_in c_in FA_cpl
xFA_dcvs dcvs_cout dcvs_sum a_in b_in c_in FA_dcvs

c_co_cmos cmos_cout GND 5f
c_so_cmos cmos_sum  GND 5f

c_co_cpl cpl_cout GND 5f
c_so_cpl cpl_sum  GND 5f

c_co_dcvs dcvs_cout GND 5f
c_so_dcvs dcvs_sum  GND 5f

*****************************
**  Transient Analysis     **
*****************************


*PULSE ( v1 v2 TD TR TF PW PER )
* Vvina vin_a gnd pulse(0V 0.7V 4ns 0 0 4ns 8ns) 
* Vvinb vin_b gnd pulse(0V 0.7V 2ns 0 0 2ns 4ns) 
* Vvinc vin_c gnd pulse(0V 0.7V 1ns 0 0 1ns 2ns) 
*****************************
**    Simulator setting    **
*****************************
.tran 0.01ns 640ns
.option post 
.probe tran

.TEMP 25
*****************************
**      Measurement        **
*****************************


.measure tran average_power_cmos avg p(xFA_cmos) from=0.0n to=640n
.measure tran average_power_cpl  avg p(xFA_cpl ) from=0.0n to=640n
.measure tran average_power_dcvs avg p(xFA_dcvs) from=0.0n to=640n

.measure tran Tphl_cout_cmos   trig v(a_in) val=0.35v rise=1
+                              targ v(cmos_cout)  val=0.35v fall=1  

.measure tran Tr_sout_cmos     trig v(a_in) val=0.35v rise=1
+                              targ v(cmos_sum)  val=0.35v rise=1 

.measure tran Tphl_cout_cpl   trig v(a_in) val=0.35v rise=1
+                              targ v(cpl_cout)  val=0.35v fall=1  

.measure tran Tr_sout_cpl     trig v(a_in) val=0.35v rise=1
+                              targ v(cpl_sum)  val=0.35v rise=1 

.measure tran Tphl_cout_dcvs   trig v(a_in) val=0.35v rise=1
+                              targ v(dcvs_cout)  val=0.35v fall=1  

.measure tran Tr_sout_dcvs     trig v(a_in) val=0.35v rise=1
+                              targ v(dcvs_sum)  val=0.35v rise=1 

.end


.TITLE DC Power
.protect
.include '7nm_TT.pm'
.include '16mos.pm'
.include 'Buffer.sp'
.unprotect

*****************************
**     Voltage Source      **
*****************************
.global VDD GND
Vvdd VDD GND 0.7v



*****************************
**      Sub Circuit       **
*****************************
.subckt inv_fin in out
	Mp  out  in  VDD  x  pmos_rvt  m=5
	Mn  out  in  GND  x  nmos_rvt  m=4
.ends

.subckt inv_mos in out
	Mp  out  in  VDD  x  pmos  W=32nm L=16nm
	Mn  out  in  GND  x  nmos  W=16nm L=16nm
.ends


.subckt fo4_fin in
	cload_ff in gnd 10f
	xinv_fin1 in fo_ff1 inv_fin
	xinv_fin2 in fo_ff2 inv_fin
	xinv_ff3 in fo_ff3 inv_fin
	xinv_fin4 in fo_ff4 inv_fin
.ends

.subckt fo4_mos in
	cload_mos in gnd 10f
	xinv_mos1 in fo_mos1 inv_mos
	xinv_mos2 in fo_mos2 inv_mos
	xinv_mos3 in fo_mos3 inv_mos
	xinv_mos4 in fo_mos4 inv_mos
.ends

*****************************
**      my Circuit       **
*****************************

xbuffer_ff1 vin1 vin_ff1 buffer
xinv_fin1 vin_ff1 vout_ff1 inv_fin
xFO_FF1 vout_ff1 fo4_fin

xbuffer_ff2 vin2 vin_ff2 buffer
xinv_fin2 vin_ff2 vout_ff2 inv_fin
xFO_FF2 vout_ff2 fo4_fin 

xbuffer_ff4 vin4 vin_ff4 buffer
xinv_fin4 vin_ff4 vout_ff4 inv_fin
xFO_FF4 vout_ff4 fo4_fin 

xbuffer_mos1 vin1 vin_mos1 buffer
xinv_mos1 vin_mos1 vout_mos1 inv_mos
xFO_MOS1 vout_mos1 fo4_mos

xbuffer_mos2 vin2 vin_mos2 buffer
xinv_mos2 vin_mos2 vout_mos2 inv_mos
xFO_MOS2 vout_mos2 fo4_mos

xbuffer_mos4 vin4 vin_mos4 buffer
xinv_mos4 vin_mos4 vout_mos4 inv_mos
xFO_MOS4 vout_mos4 fo4_mos

*****************************
**  Transient Analysis     **
*****************************

.tran 0.01ns 30ns
*PULSE ( v1 v2 TD TR TF PW PER )
Vvin1 vin1 gnd pulse(0V 0.7V 0 0 0 0.5ns 1ns) 
Vvin2 vin2 gnd pulse(0V 0.7V 0 0 0 0.25ns 0.5ns) 
Vvin4 vin4 gnd pulse(0V 0.7V 0 0 0 0.125ns 0.25ns) 
*****************************
**    Simulator setting    **
*****************************
.option post 
* .options probe			*with I/V in .lis
* .probe v(*) i(xinv_ff)
* .option captab			*with cap value in .lis
* .print power='v(Vvdd)*i(xinv_ff)'

* .TEMP 25
*****************************
**      Measurement        **
*****************************
.measure tran average_power_mos_1g avg p(xinv_mos1) from=0.0n to=30.0n 
.measure tran average_power_ff_1g avg p(xinv_fin1) from=0.0n to=30.0n 

.measure tran average_power_mos_2g avg p(xinv_mos2) from=0.0n to=30.0n 
.measure tran average_power_ff_2g avg p(xinv_fin2) from=0.0n to=30.0n 

.measure tran average_power_mos_4g avg p(xinv_mos4) from=0.0n to=30.0n 
.measure tran average_power_ff_4g avg p(xinv_fin4) from=0.0n to=30.0n 

.end
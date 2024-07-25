.prot
.include "16mos.pm"
.include "7nm_TT.pm" 
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
V2 Vin GND

***************************************
*              circuit                *
***************************************

***               MOS               ***
Mp_MOS GND Vin VDD VDD pmos w=16n l=16n
Mn_MOS VDD Vin GND GND nmos w=16n l=16n


***               FIN               ***
Mp_FIN GND Vin VDD X pmos_lvt fin=1
Mn_FIN VDD Vin GND X nmos_lvt fin=1


***************************************
*            measurement              *
***************************************

.tr 0.1ns 15ns
.DC V2 0 0.7 0.01 
.probe DC i(Mp_MOS)
.probe DC i(Mn_MOS)
.probe DC i(Mp_FIN)
.probe DC i(Mn_FIN)
.op

.end
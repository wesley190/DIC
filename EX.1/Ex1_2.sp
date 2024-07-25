.prot
.include "7nm_TT.pm" 
.include "16mos.pm"
.include "asap7sc7p5t_INVBUF_RVT.sp" 
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

XInv_sma GND VDD Vin Vout_sma INVx1_ASAP7_75t_R
XInv_lar GND VDD Vin Vout_lar INVx13_ASAP7_75t_R

***          MOS Inverter           ***
Mp_INV_MOS Vout_MOS Vin VDD VDD pmos w=32n l=16n
Mn_INV_MOS Vout_MOS Vin GND GND nmos w=16n l=16n


***          FIN Inverter           ***
Mp_INV_FIN Vout_FIN Vin VDD VDD pmos_lvt nfin=3
Mn_INV_FIN Vout_FIN Vin GND GND nmos_lvt nfin=2


***************************************
*            measurement              *
***************************************

.DC V2 0 0.7 0.01 SWEEP V1 0.4 0.7 0.1
.op

.end
# =============================================================================
#  IMPORTANT: Pro Design Confidential (Internal Use Only)
#  COPYRIGHT (C) 2017, Pro Design Electronic GmbH
#
#  THIS FILE MAY NOT BE MODIFIED, DISCLOSED, COPIED OR DISTRIBUTED WITHOUT THE
#  EXPRESSED WRITTEN CONSENT OF PRO DESIGN.
#
#  Pro Design Electronic GmbH           http://www.prodesign-europe.com
#  Albert-Mayer-Strasse 14-16           info@prodesign-europe.com
#  83052 Bruckmuehl                     +49 (0)8062 / 808 - 0
#  Germany
# =============================================================================
#  Project       : proFPGA
#  Module        : 1sg280lh3f55e3vgs1.tcl
#  Author        : Dragan Dukaric
#  Contact       : profpga-service@prodesign-europe.com,
#  Description   :
#                  Pin definition constraints file for Stratix 10 FM.
# =============================================================================
#-------------------
# clock and sync
#-------------------
set_instance_assignment -name IO_STANDARD LVDS -to CLK_P_*
set_instance_assignment -name INPUT_TERMINATION DIFFERENTIAL -to CLK_P_*
set_instance_assignment -name IO_STANDARD LVDS -to SYNC_P_*
set_instance_assignment -name INPUT_TERMINATION DIFFERENTIAL -to SYNC_P_*

set_location_assignment PIN_BJ25 -to CLK_P_0
set_location_assignment PIN_BF23 -to CLK_P_1
set_location_assignment PIN_BJ19 -to CLK_P_2
set_location_assignment PIN_BL20 -to CLK_P_3
set_location_assignment PIN_BK16 -to CLK_P_4
set_location_assignment PIN_BJ15 -to CLK_P_5

set_location_assignment PIN_BL25 -to SYNC_P_0
set_location_assignment PIN_BJ24 -to SYNC_P_1
set_location_assignment PIN_BD21 -to SYNC_P_2
set_location_assignment PIN_BF20 -to SYNC_P_3
set_location_assignment PIN_BE18 -to SYNC_P_4
set_location_assignment PIN_BA20 -to SYNC_P_5

#-------------------
# LED
#-------------------
set_instance_assignment -name IO_STANDARD "1.8 V" -to LED_*

set_location_assignment PIN_BD22 -to LED_BLUE
set_location_assignment PIN_BA21 -to LED_GREEN
set_location_assignment PIN_BC22 -to LED_RED
set_location_assignment PIN_BE22 -to LED_YELLOW

#---------------------
# Temperature monitor
#---------------------
set_instance_assignment -name IO_STANDARD "1.8 V" -to TEMP_MON_*

set_location_assignment PIN_AY22 -to TEMP_MON_SDA
set_location_assignment PIN_AW22 -to TEMP_MON_SCL

#-------------------
# dmbi
#-------------------
set_location_assignment IOPLL_X224_Y0_N20 -to U_PROFPGA_CTRL|CLK0_PLL|iopll_0|stratix10_altera_iopll_i|s10_iopll.fourteennm_pll

set_instance_assignment -name IO_STANDARD "1.8 V" -to DMBI_F2H*
set_instance_assignment -name IO_STANDARD "1.8 V" -to DMBI_H2F*

set_location_assignment PIN_BL15  -to DMBI_F2H[0]
set_location_assignment PIN_BM15  -to DMBI_F2H[1]
set_location_assignment PIN_BL16  -to DMBI_F2H[2]
set_location_assignment PIN_BM16  -to DMBI_F2H[3]
set_location_assignment PIN_BN15  -to DMBI_F2H[4]
set_location_assignment PIN_BP15  -to DMBI_F2H[5]
set_location_assignment PIN_BM17  -to DMBI_F2H[6]
set_location_assignment PIN_BN17  -to DMBI_F2H[7]
set_location_assignment PIN_BP17  -to DMBI_F2H[8]
set_location_assignment PIN_BP16  -to DMBI_F2H[9]
set_location_assignment PIN_BM18  -to DMBI_F2H[10]
set_location_assignment PIN_BN18  -to DMBI_F2H[11]
set_location_assignment PIN_BP19  -to DMBI_F2H[12]
set_location_assignment PIN_BN19  -to DMBI_F2H[13]
set_location_assignment PIN_BK18  -to DMBI_F2H[14]
set_location_assignment PIN_BL18  -to DMBI_F2H[15]
set_location_assignment PIN_BP20  -to DMBI_F2H[16]
set_location_assignment PIN_BN20  -to DMBI_F2H[17]
set_location_assignment PIN_BK19  -to DMBI_F2H[18]
set_location_assignment PIN_BL19  -to DMBI_F2H[19]


set_location_assignment PIN_AV25  -to DMBI_H2F[0]
set_location_assignment PIN_AW25  -to DMBI_H2F[1]
set_location_assignment PIN_BA25  -to DMBI_H2F[2]
set_location_assignment PIN_BB25  -to DMBI_H2F[3]
set_location_assignment PIN_AW26  -to DMBI_H2F[4]
set_location_assignment PIN_AY26  -to DMBI_H2F[5]
set_location_assignment PIN_AY24  -to DMBI_H2F[6]
set_location_assignment PIN_AW24  -to DMBI_H2F[7]
set_location_assignment PIN_AV24  -to DMBI_H2F[8]
set_location_assignment PIN_AV23  -to DMBI_H2F[9]
set_location_assignment PIN_BA23  -to DMBI_H2F[10]
set_location_assignment PIN_BA24  -to DMBI_H2F[11]
set_location_assignment PIN_BC25  -to DMBI_H2F[12]
set_location_assignment PIN_BD25  -to DMBI_H2F[13]
set_location_assignment PIN_BF25  -to DMBI_H2F[14]
set_location_assignment PIN_BG25  -to DMBI_H2F[15]
set_location_assignment PIN_BC24  -to DMBI_H2F[16]
set_location_assignment PIN_BD24  -to DMBI_H2F[17]
set_location_assignment PIN_BE24  -to DMBI_H2F[18]
set_location_assignment PIN_BF24  -to DMBI_H2F[19]

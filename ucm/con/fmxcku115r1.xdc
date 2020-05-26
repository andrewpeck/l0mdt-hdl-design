# (c) Copyright 2012-2015 PRO DESIGN Electronic GmbH.                     
# All rights reserved.                                                    
#                                                                         
# This file is owned and controlled by ProDesign and must be used solely  
# for design, simulation, implementation and creation of design files     
# limited to profpga systems or technologies. Use with non-profpga        
# systems or technologies is expressly prohibited and immediately         
# terminates your license.                                                
#                                                                         
# PRODESIGN IS PROVIDING THIS DESIGN, CODE, OR INFORMATION "AS IS" SOLELY 
# FOR USE IN DEVELOPING PROGRAMS AND SOLUTIONS FOR PRODESIGN SYSTEMS. BY  
# PROVIDING THIS DESIGN, CODE, OR INFORMATION AS ONE POSSIBLE             
# IMPLEMENTATION OF THIS FEATURE, APPLICATION OR STANDARD, PRODESIGN IS   
# MAKING NO REPRESENTATION THAT THIS IMPLEMENTATION IS FREE FROM ANY      
# CLAIMS OF INFRINGEMENT, AND YOU ARE RESPONSIBLE FOR OBTAINING ANY       
# RIGHTS YOU MAY REQUIRE FOR YOUR IMPLEMENTATION. PRODESIGN EXPRESSLY     
# DISCLAIMS ANY WARRANTY WHATSOEVER WITH RESPECT TO THE ADEQUACY OF THE   
# IMPLEMENTATION, INCLUDING BUT NOT LIMITED TO ANY WARRANTIES OR          
# REPRESENTATIONS THAT THIS IMPLEMENTATION IS FREE FROM CLAIMS OF         
# INFRINGEMENT, IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A   
# PARTICULAR PURPOSE.                                                     
#                                                                         
# ProDesign products are not intended for use in life support appliances, 
# devices, or systems. Use in such applications are expressly             
# prohibited.                                                             
#                                                                         
# This file was generated by profpga_brdgen version 5.12 
#   on Tue Mar  8 09:25:33 2016 

# These constraints are added for clock and sync inputs
set_property -quiet DIFF_TERM_ADV TERM_100 [get_ports {CLK_P_0}]
set_property -quiet DIFF_TERM_ADV TERM_100 [get_ports {CLK_P_1}]
set_property -quiet DIFF_TERM_ADV TERM_100 [get_ports {CLK_P_2}]
set_property -quiet DIFF_TERM_ADV TERM_100 [get_ports {CLK_P_3}]
set_property -quiet DIFF_TERM_ADV TERM_100 [get_ports {CLK_P_4}]
set_property -quiet DIFF_TERM_ADV TERM_100 [get_ports {CLK_P_5}]
set_property -quiet DIFF_TERM_ADV TERM_100 [get_ports {CLK_P_6}]
set_property -quiet DIFF_TERM_ADV TERM_100 [get_ports {CLK_P_7}]

set_property -quiet DIFF_TERM_ADV TERM_100 [get_ports {SYNC_P_0}]
set_property -quiet DIFF_TERM_ADV TERM_100 [get_ports {SYNC_P_1}]
set_property -quiet DIFF_TERM_ADV TERM_100 [get_ports {SYNC_P_2}]
set_property -quiet DIFF_TERM_ADV TERM_100 [get_ports {SYNC_P_3}]
set_property -quiet DIFF_TERM_ADV TERM_100 [get_ports {SYNC_P_4}]
set_property -quiet DIFF_TERM_ADV TERM_100 [get_ports {SYNC_P_5}]
set_property -quiet DIFF_TERM_ADV TERM_100 [get_ports {SYNC_P_6}]
set_property -quiet DIFF_TERM_ADV TERM_100 [get_ports {SYNC_P_7}]

set_property IOSTANDARD LVDS_25 [get_ports {CLK_P_0}]
set_property IOSTANDARD LVDS_25 [get_ports {CLK_N_0}]
set_property IOSTANDARD LVDS_25 [get_ports {CLK_P_1}]
set_property IOSTANDARD LVDS_25 [get_ports {CLK_N_1}]
set_property IOSTANDARD LVDS_25 [get_ports {CLK_P_4}]
set_property IOSTANDARD LVDS_25 [get_ports {CLK_N_4}]
set_property IOSTANDARD LVDS_25 [get_ports {CLK_P_5}]
set_property IOSTANDARD LVDS_25 [get_ports {CLK_N_5}]
set_property IOSTANDARD LVDS_25 [get_ports {SYNC_P_0}]
set_property IOSTANDARD LVDS_25 [get_ports {SYNC_N_0}]
set_property IOSTANDARD LVDS_25 [get_ports {SYNC_P_1}]
set_property IOSTANDARD LVDS_25 [get_ports {SYNC_N_1}]
set_property IOSTANDARD LVDS_25 [get_ports {SYNC_P_4}]
set_property IOSTANDARD LVDS_25 [get_ports {SYNC_N_4}]
set_property IOSTANDARD LVDS_25 [get_ports {SYNC_P_5}]
set_property IOSTANDARD LVDS_25 [get_ports {SYNC_N_5}]
set_property IOSTANDARD LVDS_25 [get_ports {SRC_SYNC_P_0}]
set_property IOSTANDARD LVDS_25 [get_ports {SRC_SYNC_P_0}]
set_property IOSTANDARD LVDS_25 [get_ports {SRC_SYNC_P_1}]
set_property IOSTANDARD LVDS_25 [get_ports {SRC_CLK_P_1}]
set_property IOSTANDARD LVDS_25 [get_ports {SRC_CLK_P_0}]
set_property IOSTANDARD LVDS_25 [get_ports {SRC_CLK_P_0}]
set_property IOSTANDARD LVDS_25 [get_ports {SRC_CLK_P_1}]
set_property IOSTANDARD LVDS_25 [get_ports {SRC_CLK_P_1}]
set_property IOSTANDARD LVCMOS25 [get_ports {DMBI_H2F[*]}]
set_property IOSTANDARD LVCMOS25 [get_ports {LED_YELLOW2}]
set_property IOSTANDARD LVCMOS25 [get_ports {UART_CTS_B}]
set_property IOSTANDARD LVCMOS25 [get_ports {UART_RTS_B}]
set_property IOSTANDARD LVCMOS25 [get_ports {UART_RXD}]
set_property IOSTANDARD LVCMOS25 [get_ports {UART_TXD}]

# pins which are not connected to an x-board 
set_property -quiet PACKAGE_PIN AY27 [get_ports {CLK_N_0}]
set_property -quiet PACKAGE_PIN AV28 [get_ports {CLK_N_1}]
set_property -quiet PACKAGE_PIN AW19 [get_ports {CLK_N_2}]
set_property -quiet PACKAGE_PIN AU19 [get_ports {CLK_N_3}]
set_property -quiet PACKAGE_PIN AW26 [get_ports {CLK_N_4}]
set_property -quiet PACKAGE_PIN AY28 [get_ports {CLK_N_5}]
set_property -quiet PACKAGE_PIN AW18 [get_ports {CLK_N_6}]
set_property -quiet PACKAGE_PIN AU20 [get_ports {CLK_N_7}]
set_property -quiet PACKAGE_PIN AY26 [get_ports {CLK_P_0}]
set_property -quiet PACKAGE_PIN AV27 [get_ports {CLK_P_1}]
set_property -quiet PACKAGE_PIN AV19 [get_ports {CLK_P_2}]
set_property -quiet PACKAGE_PIN AT19 [get_ports {CLK_P_3}]
set_property -quiet PACKAGE_PIN AV26 [get_ports {CLK_P_4}]
set_property -quiet PACKAGE_PIN AW28 [get_ports {CLK_P_5}]
set_property -quiet PACKAGE_PIN AV18 [get_ports {CLK_P_6}]
set_property -quiet PACKAGE_PIN AT20 [get_ports {CLK_P_7}]

## These are the original fpga pin defines as created by proFPGA builder
#set_property -quiet PACKAGE_PIN AR17 [get_ports {DMBI_F2H_00}]
#set_property -quiet PACKAGE_PIN AT17 [get_ports {DMBI_F2H_01}]
#set_property -quiet PACKAGE_PIN AT18 [get_ports {DMBI_F2H_02}]
#set_property -quiet PACKAGE_PIN AU17 [get_ports {DMBI_F2H_03}]
#set_property -quiet PACKAGE_PIN AN19 [get_ports {DMBI_F2H_04}]
#set_property -quiet PACKAGE_PIN AP19 [get_ports {DMBI_F2H_05}]
#set_property -quiet PACKAGE_PIN AP20 [get_ports {DMBI_F2H_06}]
#set_property -quiet PACKAGE_PIN AR20 [get_ports {DMBI_F2H_07}]
#set_property -quiet PACKAGE_PIN AM16 [get_ports {DMBI_F2H_08}]
#set_property -quiet PACKAGE_PIN AN16 [get_ports {DMBI_F2H_09}]
#set_property -quiet PACKAGE_PIN BE17 [get_ports {DMBI_F2H_10}]
#set_property -quiet PACKAGE_PIN BF17 [get_ports {DMBI_F2H_11}]
#set_property -quiet PACKAGE_PIN AV21 [get_ports {DMBI_F2H_12}]
#set_property -quiet PACKAGE_PIN AW21 [get_ports {DMBI_F2H_13}]
#set_property -quiet PACKAGE_PIN AW20 [get_ports {DMBI_F2H_14}]
#set_property -quiet PACKAGE_PIN AY20 [get_ports {DMBI_F2H_15}]
#set_property -quiet PACKAGE_PIN AY17 [get_ports {DMBI_F2H_16}]
#set_property -quiet PACKAGE_PIN BA17 [get_ports {DMBI_F2H_17}]
#set_property -quiet PACKAGE_PIN BB19 [get_ports {DMBI_F2H_18}]
#set_property -quiet PACKAGE_PIN BC18 [get_ports {DMBI_F2H_19}]
#set_property -quiet PACKAGE_PIN BF28 [get_ports {DMBI_H2F_00}]
#set_property -quiet PACKAGE_PIN BF29 [get_ports {DMBI_H2F_01}]
#set_property -quiet PACKAGE_PIN BE27 [get_ports {DMBI_H2F_02}]
#set_property -quiet PACKAGE_PIN BF27 [get_ports {DMBI_H2F_03}]
#set_property -quiet PACKAGE_PIN AM26 [get_ports {DMBI_H2F_04}]
#set_property -quiet PACKAGE_PIN AN26 [get_ports {DMBI_H2F_05}]
#set_property -quiet PACKAGE_PIN AL25 [get_ports {DMBI_H2F_06}]
#set_property -quiet PACKAGE_PIN AM25 [get_ports {DMBI_H2F_07}]
#set_property -quiet PACKAGE_PIN AN28 [get_ports {DMBI_H2F_08}]
#set_property -quiet PACKAGE_PIN AP28 [get_ports {DMBI_H2F_09}]
#set_property -quiet PACKAGE_PIN AP25 [get_ports {DMBI_H2F_10}]
#set_property -quiet PACKAGE_PIN AP26 [get_ports {DMBI_H2F_11}]
#set_property -quiet PACKAGE_PIN AR28 [get_ports {DMBI_H2F_12}]
#set_property -quiet PACKAGE_PIN AT28 [get_ports {DMBI_H2F_13}]
#set_property -quiet PACKAGE_PIN AR27 [get_ports {DMBI_H2F_14}]
#set_property -quiet PACKAGE_PIN AT27 [get_ports {DMBI_H2F_15}]
#set_property -quiet PACKAGE_PIN BC26 [get_ports {DMBI_H2F_16}]
#set_property -quiet PACKAGE_PIN BC27 [get_ports {DMBI_H2F_17}]
#set_property -quiet PACKAGE_PIN BF25 [get_ports {DMBI_H2F_18}]
#set_property -quiet PACKAGE_PIN BC28 [get_ports {DMBI_H2F_19}]

# They have been modified to reflect the bus
set_property -quiet PACKAGE_PIN AR17 [get_ports {DMBI_F2H[0]}]
set_property -quiet PACKAGE_PIN AT17 [get_ports {DMBI_F2H[1]}]
set_property -quiet PACKAGE_PIN AT18 [get_ports {DMBI_F2H[2]}]
set_property -quiet PACKAGE_PIN AU17 [get_ports {DMBI_F2H[3]}]
set_property -quiet PACKAGE_PIN AN19 [get_ports {DMBI_F2H[4]}]
set_property -quiet PACKAGE_PIN AP19 [get_ports {DMBI_F2H[5]}]
set_property -quiet PACKAGE_PIN AP20 [get_ports {DMBI_F2H[6]}]
set_property -quiet PACKAGE_PIN AR20 [get_ports {DMBI_F2H[7]}]
set_property -quiet PACKAGE_PIN AM16 [get_ports {DMBI_F2H[8]}]
set_property -quiet PACKAGE_PIN AN16 [get_ports {DMBI_F2H[9]}]
set_property -quiet PACKAGE_PIN BE17 [get_ports {DMBI_F2H[10]}]
set_property -quiet PACKAGE_PIN BF17 [get_ports {DMBI_F2H[11]}]
set_property -quiet PACKAGE_PIN AV21 [get_ports {DMBI_F2H[12]}]
set_property -quiet PACKAGE_PIN AW21 [get_ports {DMBI_F2H[13]}]
set_property -quiet PACKAGE_PIN AW20 [get_ports {DMBI_F2H[14]}]
set_property -quiet PACKAGE_PIN AY20 [get_ports {DMBI_F2H[15]}]
set_property -quiet PACKAGE_PIN AY17 [get_ports {DMBI_F2H[16]}]
set_property -quiet PACKAGE_PIN BA17 [get_ports {DMBI_F2H[17]}]
set_property -quiet PACKAGE_PIN BB19 [get_ports {DMBI_F2H[18]}]
set_property -quiet PACKAGE_PIN BC18 [get_ports {DMBI_F2H[19]}]
set_property -quiet PACKAGE_PIN BF28 [get_ports {DMBI_H2F[0]}]
set_property -quiet PACKAGE_PIN BF29 [get_ports {DMBI_H2F[1]}]
set_property -quiet PACKAGE_PIN BE27 [get_ports {DMBI_H2F[2]}]
set_property -quiet PACKAGE_PIN BF27 [get_ports {DMBI_H2F[3]}]
set_property -quiet PACKAGE_PIN AM26 [get_ports {DMBI_H2F[4]}]
set_property -quiet PACKAGE_PIN AN26 [get_ports {DMBI_H2F[5]}]
set_property -quiet PACKAGE_PIN AL25 [get_ports {DMBI_H2F[6]}]
set_property -quiet PACKAGE_PIN AM25 [get_ports {DMBI_H2F[7]}]
set_property -quiet PACKAGE_PIN AN28 [get_ports {DMBI_H2F[8]}]
set_property -quiet PACKAGE_PIN AP28 [get_ports {DMBI_H2F[9]}]
set_property -quiet PACKAGE_PIN AP25 [get_ports {DMBI_H2F[10]}]
set_property -quiet PACKAGE_PIN AP26 [get_ports {DMBI_H2F[11]}]
set_property -quiet PACKAGE_PIN AR28 [get_ports {DMBI_H2F[12]}]
set_property -quiet PACKAGE_PIN AT28 [get_ports {DMBI_H2F[13]}]
set_property -quiet PACKAGE_PIN AR27 [get_ports {DMBI_H2F[14]}]
set_property -quiet PACKAGE_PIN AT27 [get_ports {DMBI_H2F[15]}]
set_property -quiet PACKAGE_PIN BC26 [get_ports {DMBI_H2F[16]}]
set_property -quiet PACKAGE_PIN BC27 [get_ports {DMBI_H2F[17]}]
set_property -quiet PACKAGE_PIN BF25 [get_ports {DMBI_H2F[18]}]
set_property -quiet PACKAGE_PIN BC28 [get_ports {DMBI_H2F[19]}]

set_property -quiet PACKAGE_PIN AM19 [get_ports {LED_BLUE}]
set_property -quiet PACKAGE_PIN AV17 [get_ports {LED_BLUE2}]
set_property -quiet PACKAGE_PIN AL20 [get_ports {LED_GREEN}]
set_property -quiet PACKAGE_PIN AU21 [get_ports {LED_GREEN2}]
set_property -quiet PACKAGE_PIN AM20 [get_ports {LED_RED}]
set_property -quiet PACKAGE_PIN AP16 [get_ports {LED_RED2}]
set_property -quiet PACKAGE_PIN AL19 [get_ports {LED_YELLOW}]
set_property -quiet PACKAGE_PIN BE25 [get_ports {LED_YELLOW2}]
set_property -quiet PACKAGE_PIN BE28 [get_ports {SRC_CLK_N_0}]
set_property -quiet PACKAGE_PIN AN27 [get_ports {SRC_CLK_N_1}]
set_property -quiet PACKAGE_PIN BC17 [get_ports {SRC_CLK_N_2}]
set_property -quiet PACKAGE_PIN BA18 [get_ports {SRC_CLK_N_3}]
set_property -quiet PACKAGE_PIN BD28 [get_ports {SRC_CLK_P_0}]
set_property -quiet PACKAGE_PIN AM27 [get_ports {SRC_CLK_P_1}]
set_property -quiet PACKAGE_PIN BB17 [get_ports {SRC_CLK_P_2}]
set_property -quiet PACKAGE_PIN AY18 [get_ports {SRC_CLK_P_3}]
set_property -quiet PACKAGE_PIN BE26 [get_ports {SRC_SYNC_N_0}]
set_property -quiet PACKAGE_PIN AL28 [get_ports {SRC_SYNC_N_1}]
set_property -quiet PACKAGE_PIN BE18 [get_ports {SRC_SYNC_N_2}]
set_property -quiet PACKAGE_PIN BD19 [get_ports {SRC_SYNC_N_3}]
set_property -quiet PACKAGE_PIN BD26 [get_ports {SRC_SYNC_P_0}]
set_property -quiet PACKAGE_PIN AL27 [get_ports {SRC_SYNC_P_1}]
set_property -quiet PACKAGE_PIN BD18 [get_ports {SRC_SYNC_P_2}]
set_property -quiet PACKAGE_PIN BC19 [get_ports {SRC_SYNC_P_3}]
set_property -quiet PACKAGE_PIN BA28 [get_ports {SYNC_N_0}]
set_property -quiet PACKAGE_PIN AT25 [get_ports {SYNC_N_1}]
set_property -quiet PACKAGE_PIN AR18 [get_ports {SYNC_N_2}]
set_property -quiet PACKAGE_PIN AM17 [get_ports {SYNC_N_3}]
set_property -quiet PACKAGE_PIN AU27 [get_ports {SYNC_N_4}]
set_property -quiet PACKAGE_PIN AY25 [get_ports {SYNC_N_5}]
set_property -quiet PACKAGE_PIN BF18 [get_ports {SYNC_N_6}]
set_property -quiet PACKAGE_PIN AN17 [get_ports {SYNC_N_7}]
set_property -quiet PACKAGE_PIN BA27 [get_ports {SYNC_P_0}]
set_property -quiet PACKAGE_PIN AR25 [get_ports {SYNC_P_1}]
set_property -quiet PACKAGE_PIN AP18 [get_ports {SYNC_P_2}]
set_property -quiet PACKAGE_PIN AL17 [get_ports {SYNC_P_3}]
set_property -quiet PACKAGE_PIN AU26 [get_ports {SYNC_P_4}]
set_property -quiet PACKAGE_PIN AW25 [get_ports {SYNC_P_5}]
set_property -quiet PACKAGE_PIN BF19 [get_ports {SYNC_P_6}]
set_property -quiet PACKAGE_PIN AN18 [get_ports {SYNC_P_7}]
set_property -quiet PACKAGE_PIN BB27 [get_ports {UART_CTS_B}]
set_property -quiet PACKAGE_PIN BA25 [get_ports {UART_RTS_B}]
set_property -quiet PACKAGE_PIN BB25 [get_ports {UART_RXD}]
set_property -quiet PACKAGE_PIN BB26 [get_ports {UART_TXD}]

# VREF/DCI constraints for banks related to connector BA1
#   set_property INTERNAL_VREF {0.90} [get_iobanks 68]
#   set_property INTERNAL_VREF {0.90} [get_iobanks 67]
#   set_property INTERNAL_VREF {0.90} [get_iobanks 66]

# VREF/DCI constraints for banks related to connector BA2
#   set_property INTERNAL_VREF {0.90} [get_iobanks 60]
#   set_property INTERNAL_VREF {0.90} [get_iobanks 39]
#   set_property INTERNAL_VREF {0.90} [get_iobanks 40]

# VREF/DCI constraints for banks related to connector BB1
#   set_property INTERNAL_VREF {0.90} [get_iobanks 49]
#   set_property INTERNAL_VREF {0.90} [get_iobanks 51]
#   set_property INTERNAL_VREF {0.90} [get_iobanks 50]

# VREF/DCI constraints for banks related to connector BB2
#   set_property INTERNAL_VREF {0.90} [get_iobanks 73]
#   set_property INTERNAL_VREF {0.90} [get_iobanks 53]
#   set_property INTERNAL_VREF {0.90} [get_iobanks 52]

# VREF/DCI constraints for banks related to connector TA1
#   set_property INTERNAL_VREF {0.90} [get_iobanks 42]
#   set_property INTERNAL_VREF {0.90} [get_iobanks 41]
#   set_property INTERNAL_VREF {0.90} [get_iobanks 43]

# VREF/DCI constraints for banks related to connector TA2
#   set_property INTERNAL_VREF {0.90} [get_iobanks 62]
#   set_property INTERNAL_VREF {0.90} [get_iobanks 61]
#   set_property INTERNAL_VREF {0.90} [get_iobanks 63]

# VREF/DCI constraints for banks related to connector TB1
#   set_property INTERNAL_VREF {0.90} [get_iobanks 47]
#   set_property INTERNAL_VREF {0.90} [get_iobanks 46]
#   set_property INTERNAL_VREF {0.90} [get_iobanks 48]

# VREF/DCI constraints for banks related to connector TB2
#   set_property INTERNAL_VREF {0.90} [get_iobanks 72]
#   set_property INTERNAL_VREF {0.90} [get_iobanks 71]
#   set_property INTERNAL_VREF {0.90} [get_iobanks 70]

# VREF/DCI constraints for banks related to connector TA1V1
#   set_property INTERNAL_VREF {0.90} [get_iobanks 44]

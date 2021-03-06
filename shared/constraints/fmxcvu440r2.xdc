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

# pins which are not connected to an x-board 
set_property -quiet PACKAGE_PIN BE28 [get_ports {CLK_N_0}]
set_property -quiet PACKAGE_PIN BC28 [get_ports {CLK_N_1}]
set_property -quiet PACKAGE_PIN Y48 [get_ports {CLK_N_2}]
set_property -quiet PACKAGE_PIN AA47 [get_ports {CLK_N_3}]
set_property -quiet PACKAGE_PIN BB27 [get_ports {CLK_N_4}]
set_property -quiet PACKAGE_PIN BD29 [get_ports {CLK_N_5}]
set_property -quiet PACKAGE_PIN AA49 [get_ports {CLK_N_6}]
set_property -quiet PACKAGE_PIN W46 [get_ports {CLK_N_7}]
set_property -quiet PACKAGE_PIN BD28 [get_ports {CLK_P_0}]
set_property -quiet PACKAGE_PIN BC27 [get_ports {CLK_P_1}]
set_property -quiet PACKAGE_PIN Y47 [get_ports {CLK_P_2}]
set_property -quiet PACKAGE_PIN AB47 [get_ports {CLK_P_3}]
set_property -quiet PACKAGE_PIN BB26 [get_ports {CLK_P_4}]
set_property -quiet PACKAGE_PIN BC29 [get_ports {CLK_P_5}]
set_property -quiet PACKAGE_PIN AA48 [get_ports {CLK_P_6}]
set_property -quiet PACKAGE_PIN Y46 [get_ports {CLK_P_7}]

## These are the original fpga pin defines as created by proFPGA builder
#set_property -quiet PACKAGE_PIN AB45 [get_ports {DMBI_F2H_00}]
#set_property -quiet PACKAGE_PIN AB46 [get_ports {DMBI_F2H_01}]
#set_property -quiet PACKAGE_PIN AC46 [get_ports {DMBI_F2H_02}]
#set_property -quiet PACKAGE_PIN AC47 [get_ports {DMBI_F2H_03}]
#set_property -quiet PACKAGE_PIN AC42 [get_ports {DMBI_F2H_04}]
#set_property -quiet PACKAGE_PIN AC43 [get_ports {DMBI_F2H_05}]
#set_property -quiet PACKAGE_PIN W44 [get_ports {DMBI_F2H_06}]
#set_property -quiet PACKAGE_PIN W45 [get_ports {DMBI_F2H_07}]
#set_property -quiet PACKAGE_PIN AB41 [get_ports {DMBI_F2H_08}]
#set_property -quiet PACKAGE_PIN AB42 [get_ports {DMBI_F2H_09}]
#set_property -quiet PACKAGE_PIN AD53 [get_ports {DMBI_F2H_10}]
#set_property -quiet PACKAGE_PIN AC53 [get_ports {DMBI_F2H_11}]
#set_property -quiet PACKAGE_PIN AC49 [get_ports {DMBI_F2H_12}]
#set_property -quiet PACKAGE_PIN AB49 [get_ports {DMBI_F2H_13}]
#set_property -quiet PACKAGE_PIN AB50 [get_ports {DMBI_F2H_14}]
#set_property -quiet PACKAGE_PIN AA50 [get_ports {DMBI_F2H_15}]
#set_property -quiet PACKAGE_PIN AC51 [get_ports {DMBI_F2H_16}]
#set_property -quiet PACKAGE_PIN AB51 [get_ports {DMBI_F2H_17}]
#set_property -quiet PACKAGE_PIN AC52 [get_ports {DMBI_F2H_18}]
#set_property -quiet PACKAGE_PIN AB52 [get_ports {DMBI_F2H_19}]
#set_property -quiet PACKAGE_PIN BG26 [get_ports {DMBI_H2F_00}]
#set_property -quiet PACKAGE_PIN BH26 [get_ports {DMBI_H2F_01}]
#set_property -quiet PACKAGE_PIN BH28 [get_ports {DMBI_H2F_02}]
#set_property -quiet PACKAGE_PIN BJ28 [get_ports {DMBI_H2F_03}]
#set_property -quiet PACKAGE_PIN AV28 [get_ports {DMBI_H2F_04}]
#set_property -quiet PACKAGE_PIN AW28 [get_ports {DMBI_H2F_05}]
#set_property -quiet PACKAGE_PIN AU27 [get_ports {DMBI_H2F_06}]
#set_property -quiet PACKAGE_PIN AV27 [get_ports {DMBI_H2F_07}]
#set_property -quiet PACKAGE_PIN AW26 [get_ports {DMBI_H2F_08}]
#set_property -quiet PACKAGE_PIN AY26 [get_ports {DMBI_H2F_09}]
#set_property -quiet PACKAGE_PIN AU26 [get_ports {DMBI_H2F_10}]
#set_property -quiet PACKAGE_PIN AV26 [get_ports {DMBI_H2F_11}]
#set_property -quiet PACKAGE_PIN BA30 [get_ports {DMBI_H2F_12}]
#set_property -quiet PACKAGE_PIN BB30 [get_ports {DMBI_H2F_13}]
#set_property -quiet PACKAGE_PIN BA29 [get_ports {DMBI_H2F_14}]
#set_property -quiet PACKAGE_PIN BB29 [get_ports {DMBI_H2F_15}]
#set_property -quiet PACKAGE_PIN BF30 [get_ports {DMBI_H2F_16}]
#set_property -quiet PACKAGE_PIN BG30 [get_ports {DMBI_H2F_17}]
#set_property -quiet PACKAGE_PIN BH29 [get_ports {DMBI_H2F_18}]
#set_property -quiet PACKAGE_PIN BD25 [get_ports {DMBI_H2F_19}]

# They have been modified to reflect the bus
set_property -quiet PACKAGE_PIN AB45 [get_ports {DMBI_F2H[0]}]
set_property -quiet PACKAGE_PIN AB46 [get_ports {DMBI_F2H[1]}]
set_property -quiet PACKAGE_PIN AC46 [get_ports {DMBI_F2H[2]}]
set_property -quiet PACKAGE_PIN AC47 [get_ports {DMBI_F2H[3]}]
set_property -quiet PACKAGE_PIN AC42 [get_ports {DMBI_F2H[4]}]
set_property -quiet PACKAGE_PIN AC43 [get_ports {DMBI_F2H[5]}]
set_property -quiet PACKAGE_PIN W44 [get_ports {DMBI_F2H[6]}]
set_property -quiet PACKAGE_PIN W45 [get_ports {DMBI_F2H[7]}]
set_property -quiet PACKAGE_PIN AB41 [get_ports {DMBI_F2H[8]}]
set_property -quiet PACKAGE_PIN AB42 [get_ports {DMBI_F2H[9]}]
set_property -quiet PACKAGE_PIN AD53 [get_ports {DMBI_F2H[10]}]
set_property -quiet PACKAGE_PIN AC53 [get_ports {DMBI_F2H[11]}]
set_property -quiet PACKAGE_PIN AC49 [get_ports {DMBI_F2H[12]}]
set_property -quiet PACKAGE_PIN AB49 [get_ports {DMBI_F2H[13]}]
set_property -quiet PACKAGE_PIN AB50 [get_ports {DMBI_F2H[14]}]
set_property -quiet PACKAGE_PIN AA50 [get_ports {DMBI_F2H[15]}]
set_property -quiet PACKAGE_PIN AC51 [get_ports {DMBI_F2H[16]}]
set_property -quiet PACKAGE_PIN AB51 [get_ports {DMBI_F2H[17]}]
set_property -quiet PACKAGE_PIN AC52 [get_ports {DMBI_F2H[18]}]
set_property -quiet PACKAGE_PIN AB52 [get_ports {DMBI_F2H[19]}]
set_property -quiet PACKAGE_PIN BG26 [get_ports {DMBI_H2F[0]}]
set_property -quiet PACKAGE_PIN BH26 [get_ports {DMBI_H2F[1]}]
set_property -quiet PACKAGE_PIN BH28 [get_ports {DMBI_H2F[2]}]
set_property -quiet PACKAGE_PIN BJ28 [get_ports {DMBI_H2F[3]}]
set_property -quiet PACKAGE_PIN AV28 [get_ports {DMBI_H2F[4]}]
set_property -quiet PACKAGE_PIN AW28 [get_ports {DMBI_H2F[5]}]
set_property -quiet PACKAGE_PIN AU27 [get_ports {DMBI_H2F[6]}]
set_property -quiet PACKAGE_PIN AV27 [get_ports {DMBI_H2F[7]}]
set_property -quiet PACKAGE_PIN AW26 [get_ports {DMBI_H2F[8]}]
set_property -quiet PACKAGE_PIN AY26 [get_ports {DMBI_H2F[9]}]
set_property -quiet PACKAGE_PIN AU26 [get_ports {DMBI_H2F[10]}]
set_property -quiet PACKAGE_PIN AV26 [get_ports {DMBI_H2F[11]}]
set_property -quiet PACKAGE_PIN BA30 [get_ports {DMBI_H2F[12]}]
set_property -quiet PACKAGE_PIN BB30 [get_ports {DMBI_H2F[13]}]
set_property -quiet PACKAGE_PIN BA29 [get_ports {DMBI_H2F[14]}]
set_property -quiet PACKAGE_PIN BB29 [get_ports {DMBI_H2F[15]}]
set_property -quiet PACKAGE_PIN BF30 [get_ports {DMBI_H2F[16]}]
set_property -quiet PACKAGE_PIN BG30 [get_ports {DMBI_H2F[17]}]
set_property -quiet PACKAGE_PIN BH29 [get_ports {DMBI_H2F[18]}]
set_property -quiet PACKAGE_PIN BD25 [get_ports {DMBI_H2F[19]}]

set_property -quiet PACKAGE_PIN Y42 [get_ports {LED_BLUE}]
set_property -quiet PACKAGE_PIN AC48 [get_ports {LED_BLUE2}]
set_property -quiet PACKAGE_PIN Y43 [get_ports {LED_GREEN}]
set_property -quiet PACKAGE_PIN Y45 [get_ports {LED_GREEN2}]
set_property -quiet PACKAGE_PIN W43 [get_ports {LED_RED}]
set_property -quiet PACKAGE_PIN W41 [get_ports {LED_RED2}]
set_property -quiet PACKAGE_PIN Y41 [get_ports {LED_YELLOW}]
set_property -quiet PACKAGE_PIN BG29 [get_ports {LED_YELLOW2}]
set_property -quiet PACKAGE_PIN BH27 [get_ports {SRC_CLK_N_0}]
set_property -quiet PACKAGE_PIN AW29 [get_ports {SRC_CLK_N_1}]
set_property -quiet PACKAGE_PIN Y52 [get_ports {SRC_CLK_N_2}]
set_property -quiet PACKAGE_PIN Y51 [get_ports {SRC_CLK_N_3}]
set_property -quiet PACKAGE_PIN BG27 [get_ports {SRC_CLK_P_0}]
set_property -quiet PACKAGE_PIN AV29 [get_ports {SRC_CLK_P_1}]
set_property -quiet PACKAGE_PIN AA52 [get_ports {SRC_CLK_P_2}]
set_property -quiet PACKAGE_PIN Y50 [get_ports {SRC_CLK_P_3}]
set_property -quiet PACKAGE_PIN BJ30 [get_ports {SRC_SYNC_N_0}]
set_property -quiet PACKAGE_PIN AU29 [get_ports {SRC_SYNC_N_1}]
set_property -quiet PACKAGE_PIN Y54 [get_ports {SRC_SYNC_N_2}]
set_property -quiet PACKAGE_PIN Y53 [get_ports {SRC_SYNC_N_3}]
set_property -quiet PACKAGE_PIN BJ29 [get_ports {SRC_SYNC_P_0}]
set_property -quiet PACKAGE_PIN AT29 [get_ports {SRC_SYNC_P_1}]
set_property -quiet PACKAGE_PIN AA54 [get_ports {SRC_SYNC_P_2}]
set_property -quiet PACKAGE_PIN AA53 [get_ports {SRC_SYNC_P_3}]
set_property -quiet PACKAGE_PIN BF29 [get_ports {SYNC_N_0}]
set_property -quiet PACKAGE_PIN BA28 [get_ports {SYNC_N_1}]
set_property -quiet PACKAGE_PIN AA45 [get_ports {SYNC_N_2}]
set_property -quiet PACKAGE_PIN AA43 [get_ports {SYNC_N_3}]
set_property -quiet PACKAGE_PIN BA27 [get_ports {SYNC_N_4}]
set_property -quiet PACKAGE_PIN BE30 [get_ports {SYNC_N_5}]
set_property -quiet PACKAGE_PIN AB54 [get_ports {SYNC_N_6}]
set_property -quiet PACKAGE_PIN AB44 [get_ports {SYNC_N_7}]
set_property -quiet PACKAGE_PIN BF28 [get_ports {SYNC_P_0}]
set_property -quiet PACKAGE_PIN AY28 [get_ports {SYNC_P_1}]
set_property -quiet PACKAGE_PIN AA44 [get_ports {SYNC_P_2}]
set_property -quiet PACKAGE_PIN AA42 [get_ports {SYNC_P_3}]
set_property -quiet PACKAGE_PIN AY27 [get_ports {SYNC_P_4}]
set_property -quiet PACKAGE_PIN BD30 [get_ports {SYNC_P_5}]
set_property -quiet PACKAGE_PIN AC54 [get_ports {SYNC_P_6}]
set_property -quiet PACKAGE_PIN AC44 [get_ports {SYNC_P_7}]
set_property -quiet PACKAGE_PIN BF27 [get_ports {UART_CTS_B}]
set_property -quiet PACKAGE_PIN BD26 [get_ports {UART_RTS_B}]
set_property -quiet PACKAGE_PIN BE26 [get_ports {UART_RXD}]
set_property -quiet PACKAGE_PIN BE27 [get_ports {UART_TXD}]

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

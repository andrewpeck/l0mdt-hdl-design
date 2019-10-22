# (c) Copyright 2012-2014 PRO DESIGN Electronic GmbH.                     
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
# This file was generated by profpga_brdgen version 4.2 
#   on Mon Apr 20 12:43:28 2015 

# pins which are not connected to an x-board 
set_property -quiet PACKAGE_PIN AL34 [get_ports {CLK_N_0}]
set_property -quiet PACKAGE_PIN AK32 [get_ports {CLK_N_1}]
set_property -quiet PACKAGE_PIN AV38 [get_ports {CLK_N_2}]
set_property -quiet PACKAGE_PIN AW40 [get_ports {CLK_N_3}]
set_property -quiet PACKAGE_PIN AK33 [get_ports {CLK_N_4}]
set_property -quiet PACKAGE_PIN AL32 [get_ports {CLK_N_5}]
set_property -quiet PACKAGE_PIN AV39 [get_ports {CLK_N_6}]
set_property -quiet PACKAGE_PIN AY40 [get_ports {CLK_N_7}]
set_property -quiet PACKAGE_PIN AK34 [get_ports {CLK_P_0}]
set_property -quiet PACKAGE_PIN AJ32 [get_ports {CLK_P_1}]
set_property -quiet PACKAGE_PIN AU38 [get_ports {CLK_P_2}]
set_property -quiet PACKAGE_PIN AV40 [get_ports {CLK_P_3}]
set_property -quiet PACKAGE_PIN AJ33 [get_ports {CLK_P_4}]
set_property -quiet PACKAGE_PIN AL31 [get_ports {CLK_P_5}]
set_property -quiet PACKAGE_PIN AU39 [get_ports {CLK_P_6}]
set_property -quiet PACKAGE_PIN AY39 [get_ports {CLK_P_7}]

## These are the original fpga pin defines as created by proFPGA builder
#set_property -quiet PACKAGE_PIN AJ28 [get_ports {DMBI_F2H_00}]
#set_property -quiet PACKAGE_PIN AH28 [get_ports {DMBI_F2H_01}]
#set_property -quiet PACKAGE_PIN AG31 [get_ports {DMBI_F2H_02}]
#set_property -quiet PACKAGE_PIN AF30 [get_ports {DMBI_F2H_03}]
#set_property -quiet PACKAGE_PIN AK29 [get_ports {DMBI_F2H_04}]
#set_property -quiet PACKAGE_PIN AK28 [get_ports {DMBI_F2H_05}]
#set_property -quiet PACKAGE_PIN AG29 [get_ports {DMBI_F2H_06}]
#set_property -quiet PACKAGE_PIN AK30 [get_ports {DMBI_F2H_07}]
#set_property -quiet PACKAGE_PIN AJ30 [get_ports {DMBI_F2H_08}]
#set_property -quiet PACKAGE_PIN AH30 [get_ports {DMBI_F2H_09}]
#set_property -quiet PACKAGE_PIN AH29 [get_ports {DMBI_F2H_10}]
#set_property -quiet PACKAGE_PIN AL30 [get_ports {DMBI_F2H_11}]
#set_property -quiet PACKAGE_PIN AL29 [get_ports {DMBI_F2H_12}]
#set_property -quiet PACKAGE_PIN AN33 [get_ports {DMBI_F2H_13}]
#set_property -quiet PACKAGE_PIN AM33 [get_ports {DMBI_F2H_14}]
#set_property -quiet PACKAGE_PIN AM32 [get_ports {DMBI_F2H_15}]
#set_property -quiet PACKAGE_PIN AG32 [get_ports {DMBI_F2H_16}]
#set_property -quiet PACKAGE_PIN AF29 [get_ports {DMBI_F2H_17}]
#set_property -quiet PACKAGE_PIN AN34 [get_ports {DMBI_F2H_18}]
#set_property -quiet PACKAGE_PIN AU37 [get_ports {DMBI_F2H_19}]
#set_property -quiet PACKAGE_PIN AM36 [get_ports {DMBI_H2F_00}]
#set_property -quiet PACKAGE_PIN AN36 [get_ports {DMBI_H2F_01}]
#set_property -quiet PACKAGE_PIN AJ36 [get_ports {DMBI_H2F_02}]
#set_property -quiet PACKAGE_PIN AJ37 [get_ports {DMBI_H2F_03}]
#set_property -quiet PACKAGE_PIN AK37 [get_ports {DMBI_H2F_04}]
#set_property -quiet PACKAGE_PIN AL37 [get_ports {DMBI_H2F_05}]
#set_property -quiet PACKAGE_PIN AN35 [get_ports {DMBI_H2F_06}]
#set_property -quiet PACKAGE_PIN AP35 [get_ports {DMBI_H2F_07}]
#set_property -quiet PACKAGE_PIN AM37 [get_ports {DMBI_H2F_08}]
#set_property -quiet PACKAGE_PIN AG33 [get_ports {DMBI_H2F_09}]
#set_property -quiet PACKAGE_PIN AH33 [get_ports {DMBI_H2F_10}]
#set_property -quiet PACKAGE_PIN AK35 [get_ports {DMBI_H2F_11}]
#set_property -quiet PACKAGE_PIN AL35 [get_ports {DMBI_H2F_12}]
#set_property -quiet PACKAGE_PIN AJ31 [get_ports {DMBI_H2F_13}]
#set_property -quiet PACKAGE_PIN AH34 [get_ports {DMBI_H2F_14}]
#set_property -quiet PACKAGE_PIN AJ35 [get_ports {DMBI_H2F_15}]
#set_property -quiet PACKAGE_PIN AH31 [get_ports {DMBI_H2F_16}]
#set_property -quiet PACKAGE_PIN AL36 [get_ports {DMBI_H2F_17}]
#set_property -quiet PACKAGE_PIN AH35 [get_ports {DMBI_H2F_18}]
#set_property -quiet PACKAGE_PIN AM38 [get_ports {DMBI_H2F_19}]

# They have been modified to reflect the bus
set_property -quiet PACKAGE_PIN AJ28 [get_ports {DMBI_F2H[0]}] 
set_property -quiet PACKAGE_PIN AH28 [get_ports {DMBI_F2H[1]}] 
set_property -quiet PACKAGE_PIN AG31 [get_ports {DMBI_F2H[2]}] 
set_property -quiet PACKAGE_PIN AF30 [get_ports {DMBI_F2H[3]}] 
set_property -quiet PACKAGE_PIN AK29 [get_ports {DMBI_F2H[4]}] 
set_property -quiet PACKAGE_PIN AK28 [get_ports {DMBI_F2H[5]}] 
set_property -quiet PACKAGE_PIN AG29 [get_ports {DMBI_F2H[6]}] 
set_property -quiet PACKAGE_PIN AK30 [get_ports {DMBI_F2H[7]}] 
set_property -quiet PACKAGE_PIN AJ30 [get_ports {DMBI_F2H[8]}] 
set_property -quiet PACKAGE_PIN AH30 [get_ports {DMBI_F2H[9]}] 
set_property -quiet PACKAGE_PIN AH29 [get_ports {DMBI_F2H[10]}]
set_property -quiet PACKAGE_PIN AL30 [get_ports {DMBI_F2H[11]}]
set_property -quiet PACKAGE_PIN AL29 [get_ports {DMBI_F2H[12]}]
set_property -quiet PACKAGE_PIN AN33 [get_ports {DMBI_F2H[13]}]
set_property -quiet PACKAGE_PIN AM33 [get_ports {DMBI_F2H[14]}]
set_property -quiet PACKAGE_PIN AM32 [get_ports {DMBI_F2H[15]}]
set_property -quiet PACKAGE_PIN AG32 [get_ports {DMBI_F2H[16]}]
set_property -quiet PACKAGE_PIN AF29 [get_ports {DMBI_F2H[17]}]
set_property -quiet PACKAGE_PIN AN34 [get_ports {DMBI_F2H[18]}]
set_property -quiet PACKAGE_PIN AU37 [get_ports {DMBI_F2H[19]}]
set_property -quiet PACKAGE_PIN AM36 [get_ports {DMBI_H2F[0]}] 
set_property -quiet PACKAGE_PIN AN36 [get_ports {DMBI_H2F[1]}] 
set_property -quiet PACKAGE_PIN AJ36 [get_ports {DMBI_H2F[2]}] 
set_property -quiet PACKAGE_PIN AJ37 [get_ports {DMBI_H2F[3]}] 
set_property -quiet PACKAGE_PIN AK37 [get_ports {DMBI_H2F[4]}] 
set_property -quiet PACKAGE_PIN AL37 [get_ports {DMBI_H2F[5]}] 
set_property -quiet PACKAGE_PIN AN35 [get_ports {DMBI_H2F[6]}] 
set_property -quiet PACKAGE_PIN AP35 [get_ports {DMBI_H2F[7]}] 
set_property -quiet PACKAGE_PIN AM37 [get_ports {DMBI_H2F[8]}] 
set_property -quiet PACKAGE_PIN AG33 [get_ports {DMBI_H2F[9]}] 
set_property -quiet PACKAGE_PIN AH33 [get_ports {DMBI_H2F[10]}]
set_property -quiet PACKAGE_PIN AK35 [get_ports {DMBI_H2F[11]}]
set_property -quiet PACKAGE_PIN AL35 [get_ports {DMBI_H2F[12]}]
set_property -quiet PACKAGE_PIN AJ31 [get_ports {DMBI_H2F[13]}]
set_property -quiet PACKAGE_PIN AH34 [get_ports {DMBI_H2F[14]}]
set_property -quiet PACKAGE_PIN AJ35 [get_ports {DMBI_H2F[15]}]
set_property -quiet PACKAGE_PIN AH31 [get_ports {DMBI_H2F[16]}]
set_property -quiet PACKAGE_PIN AL36 [get_ports {DMBI_H2F[17]}]
set_property -quiet PACKAGE_PIN AH35 [get_ports {DMBI_H2F[18]}]
set_property -quiet PACKAGE_PIN AM38 [get_ports {DMBI_H2F[19]}]

set_property -quiet PACKAGE_PIN BB41 [get_ports {LED_BLUE}]
set_property -quiet PACKAGE_PIN AW41 [get_ports {LED_GREEN}]
set_property -quiet PACKAGE_PIN AW42 [get_ports {LED_RED}]
set_property -quiet PACKAGE_PIN BA41 [get_ports {LED_YELLOW}]
set_property -quiet PACKAGE_PIN AY37 [get_ports {SRC_CLK_N_0}]
set_property -quiet PACKAGE_PIN BB37 [get_ports {SRC_CLK_N_1}]
set_property -quiet PACKAGE_PIN AY38 [get_ports {SRC_CLK_N_2}]
set_property -quiet PACKAGE_PIN BB39 [get_ports {SRC_CLK_N_3}]
set_property -quiet PACKAGE_PIN AW37 [get_ports {SRC_CLK_P_0}]
set_property -quiet PACKAGE_PIN BA37 [get_ports {SRC_CLK_P_1}]
set_property -quiet PACKAGE_PIN AW38 [get_ports {SRC_CLK_P_2}]
set_property -quiet PACKAGE_PIN BB38 [get_ports {SRC_CLK_P_3}]
set_property -quiet PACKAGE_PIN BA40 [get_ports {SRC_SYNC_N_0}]
set_property -quiet PACKAGE_PIN AU42 [get_ports {SRC_SYNC_N_1}]
set_property -quiet PACKAGE_PIN BA42 [get_ports {SRC_SYNC_N_2}]
set_property -quiet PACKAGE_PIN AV41 [get_ports {SRC_SYNC_N_3}]
set_property -quiet PACKAGE_PIN BA39 [get_ports {SRC_SYNC_P_0}]
set_property -quiet PACKAGE_PIN AT41 [get_ports {SRC_SYNC_P_1}]
set_property -quiet PACKAGE_PIN AY42 [get_ports {SRC_SYNC_P_2}]
set_property -quiet PACKAGE_PIN AU41 [get_ports {SRC_SYNC_P_3}]
set_property -quiet PACKAGE_PIN AP38 [get_ports {SYNC_N_0}]
set_property -quiet PACKAGE_PIN AM42 [get_ports {SYNC_N_1}]
set_property -quiet PACKAGE_PIN AR39 [get_ports {SYNC_N_2}]
set_property -quiet PACKAGE_PIN AN41 [get_ports {SYNC_N_3}]
set_property -quiet PACKAGE_PIN AT37 [get_ports {SYNC_N_4}]
set_property -quiet PACKAGE_PIN AN39 [get_ports {SYNC_N_5}]
set_property -quiet PACKAGE_PIN AR40 [get_ports {SYNC_N_6}]
set_property -quiet PACKAGE_PIN AP42 [get_ports {SYNC_N_7}]
set_property -quiet PACKAGE_PIN AN38 [get_ports {SYNC_P_0}]
set_property -quiet PACKAGE_PIN AM41 [get_ports {SYNC_P_1}]
set_property -quiet PACKAGE_PIN AR38 [get_ports {SYNC_P_2}]
set_property -quiet PACKAGE_PIN AN40 [get_ports {SYNC_P_3}]
set_property -quiet PACKAGE_PIN AR37 [get_ports {SYNC_P_4}]
set_property -quiet PACKAGE_PIN AM39 [get_ports {SYNC_P_5}]
set_property -quiet PACKAGE_PIN AP40 [get_ports {SYNC_P_6}]
set_property -quiet PACKAGE_PIN AP41 [get_ports {SYNC_P_7}]
set_property -quiet PACKAGE_PIN AR42 [get_ports {UART_CTS_B}]
set_property -quiet PACKAGE_PIN AT40 [get_ports {UART_RTS_B}]
set_property -quiet PACKAGE_PIN AT39 [get_ports {UART_RXD}]
set_property -quiet PACKAGE_PIN AT42 [get_ports {UART_TXD}]

# set_property DCI_CASCADE {17 19 } [get_iobanks 18]
# set_property INTERNAL_VREF {0.90} [get_iobanks 18]
# set_property INTERNAL_VREF {0.90} [get_iobanks 17]
# set_property INTERNAL_VREF {0.90} [get_iobanks 19]
# set_property DCI_CASCADE {37 39 } [get_iobanks 38]
# set_property INTERNAL_VREF {0.90} [get_iobanks 38]
# set_property INTERNAL_VREF {0.90} [get_iobanks 37]
# set_property INTERNAL_VREF {0.90} [get_iobanks 39]
# set_property INTERNAL_VREF {0.90} [get_iobanks 33]
# set_property DCI_CASCADE {34 36 } [get_iobanks 35]
# set_property INTERNAL_VREF {0.90} [get_iobanks 35]
# set_property INTERNAL_VREF {0.90} [get_iobanks 34]
# set_property INTERNAL_VREF {0.90} [get_iobanks 36]
# set_property INTERNAL_VREF {0.90} [get_iobanks 16]


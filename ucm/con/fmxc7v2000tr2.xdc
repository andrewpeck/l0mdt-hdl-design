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
#   on Mon Apr 20 12:27:10 2015 

# pins which are not connected to an x-board 
set_property -quiet PACKAGE_PIN AF40 [get_ports {CLK_N_0}]
set_property -quiet PACKAGE_PIN AE41 [get_ports {CLK_N_1}]
set_property -quiet PACKAGE_PIN AA39 [get_ports {CLK_N_2}]
set_property -quiet PACKAGE_PIN AB41 [get_ports {CLK_N_3}]
set_property -quiet PACKAGE_PIN AG40 [get_ports {CLK_N_4}]
set_property -quiet PACKAGE_PIN AF42 [get_ports {CLK_N_5}]
set_property -quiet PACKAGE_PIN AB39 [get_ports {CLK_N_6}]
set_property -quiet PACKAGE_PIN AA40 [get_ports {CLK_N_7}]
set_property -quiet PACKAGE_PIN AE40 [get_ports {CLK_P_0}]
set_property -quiet PACKAGE_PIN AD41 [get_ports {CLK_P_1}]
set_property -quiet PACKAGE_PIN AA38 [get_ports {CLK_P_2}]
set_property -quiet PACKAGE_PIN AC41 [get_ports {CLK_P_3}]
set_property -quiet PACKAGE_PIN AF39 [get_ports {CLK_P_4}]
set_property -quiet PACKAGE_PIN AE42 [get_ports {CLK_P_5}]
set_property -quiet PACKAGE_PIN AC39 [get_ports {CLK_P_6}]
set_property -quiet PACKAGE_PIN AB40 [get_ports {CLK_P_7}]

## These are the original fpga pin defines as created by proFPGA builder
#set_property -quiet PACKAGE_PIN AH31 [get_ports {DMBI_F2H_00}]
#set_property -quiet PACKAGE_PIN AG31 [get_ports {DMBI_F2H_01}]
#set_property -quiet PACKAGE_PIN AJ30 [get_ports {DMBI_F2H_02}]
#set_property -quiet PACKAGE_PIN AJ29 [get_ports {DMBI_F2H_03}]
#set_property -quiet PACKAGE_PIN AF30 [get_ports {DMBI_F2H_04}]
#set_property -quiet PACKAGE_PIN AF29 [get_ports {DMBI_F2H_05}]
#set_property -quiet PACKAGE_PIN AH29 [get_ports {DMBI_F2H_06}]
#set_property -quiet PACKAGE_PIN AE31 [get_ports {DMBI_F2H_07}]
#set_property -quiet PACKAGE_PIN AE30 [get_ports {DMBI_F2H_08}]
#set_property -quiet PACKAGE_PIN AG30 [get_ports {DMBI_F2H_09}]
#set_property -quiet PACKAGE_PIN AG29 [get_ports {DMBI_F2H_10}]
#set_property -quiet PACKAGE_PIN AG44 [get_ports {DMBI_F2H_11}]
#set_property -quiet PACKAGE_PIN AF44 [get_ports {DMBI_F2H_12}]
#set_property -quiet PACKAGE_PIN AF43 [get_ports {DMBI_F2H_13}]
#set_property -quiet PACKAGE_PIN AE43 [get_ports {DMBI_F2H_14}]
#set_property -quiet PACKAGE_PIN AH42 [get_ports {DMBI_F2H_15}]
#set_property -quiet PACKAGE_PIN AJ28 [get_ports {DMBI_F2H_16}]
#set_property -quiet PACKAGE_PIN AH28 [get_ports {DMBI_F2H_17}]
#set_property -quiet PACKAGE_PIN AD44 [get_ports {DMBI_F2H_18}]
#set_property -quiet PACKAGE_PIN AB28 [get_ports {DMBI_F2H_19}]
#set_property -quiet PACKAGE_PIN AF33 [get_ports {DMBI_H2F_00}]
#set_property -quiet PACKAGE_PIN AF34 [get_ports {DMBI_H2F_01}]
#set_property -quiet PACKAGE_PIN AG34 [get_ports {DMBI_H2F_02}]
#set_property -quiet PACKAGE_PIN AG35 [get_ports {DMBI_H2F_03}]
#set_property -quiet PACKAGE_PIN AE32 [get_ports {DMBI_H2F_04}]
#set_property -quiet PACKAGE_PIN AE33 [get_ports {DMBI_H2F_05}]
#set_property -quiet PACKAGE_PIN AF32 [get_ports {DMBI_H2F_06}]
#set_property -quiet PACKAGE_PIN AG32 [get_ports {DMBI_H2F_07}]
#set_property -quiet PACKAGE_PIN AF35 [get_ports {DMBI_H2F_08}]
#set_property -quiet PACKAGE_PIN AG41 [get_ports {DMBI_H2F_09}]
#set_property -quiet PACKAGE_PIN AH41 [get_ports {DMBI_H2F_10}]
#set_property -quiet PACKAGE_PIN AE37 [get_ports {DMBI_H2F_11}]
#set_property -quiet PACKAGE_PIN AE38 [get_ports {DMBI_H2F_12}]
#set_property -quiet PACKAGE_PIN AH39 [get_ports {DMBI_H2F_13}]
#set_property -quiet PACKAGE_PIN AF37 [get_ports {DMBI_H2F_14}]
#set_property -quiet PACKAGE_PIN AF38 [get_ports {DMBI_H2F_15}]
#set_property -quiet PACKAGE_PIN AG39 [get_ports {DMBI_H2F_16}]
#set_property -quiet PACKAGE_PIN AE35 [get_ports {DMBI_H2F_17}]
#set_property -quiet PACKAGE_PIN AE36 [get_ports {DMBI_H2F_18}]
#set_property -quiet PACKAGE_PIN AA35 [get_ports {DMBI_H2F_19}]

# They have been modified to reflect the bus
set_property -quiet PACKAGE_PIN AH31 [get_ports {DMBI_F2H[0]}]
set_property -quiet PACKAGE_PIN AG31 [get_ports {DMBI_F2H[1]}]
set_property -quiet PACKAGE_PIN AJ30 [get_ports {DMBI_F2H[2]}]
set_property -quiet PACKAGE_PIN AJ29 [get_ports {DMBI_F2H[3]}]
set_property -quiet PACKAGE_PIN AF30 [get_ports {DMBI_F2H[4]}]
set_property -quiet PACKAGE_PIN AF29 [get_ports {DMBI_F2H[5]}]
set_property -quiet PACKAGE_PIN AH29 [get_ports {DMBI_F2H[6]}]
set_property -quiet PACKAGE_PIN AE31 [get_ports {DMBI_F2H[7]}]
set_property -quiet PACKAGE_PIN AE30 [get_ports {DMBI_F2H[8]}]
set_property -quiet PACKAGE_PIN AG30 [get_ports {DMBI_F2H[9]}]
set_property -quiet PACKAGE_PIN AG29 [get_ports {DMBI_F2H[10]}]
set_property -quiet PACKAGE_PIN AG44 [get_ports {DMBI_F2H[11]}]
set_property -quiet PACKAGE_PIN AF44 [get_ports {DMBI_F2H[12]}]
set_property -quiet PACKAGE_PIN AF43 [get_ports {DMBI_F2H[13]}]
set_property -quiet PACKAGE_PIN AE43 [get_ports {DMBI_F2H[14]}]
set_property -quiet PACKAGE_PIN AH42 [get_ports {DMBI_F2H[15]}]
set_property -quiet PACKAGE_PIN AJ28 [get_ports {DMBI_F2H[16]}]
set_property -quiet PACKAGE_PIN AH28 [get_ports {DMBI_F2H[17]}]
set_property -quiet PACKAGE_PIN AD44 [get_ports {DMBI_F2H[18]}]
set_property -quiet PACKAGE_PIN AB28 [get_ports {DMBI_F2H[19]}]
set_property -quiet PACKAGE_PIN AF33 [get_ports {DMBI_H2F[0]}]
set_property -quiet PACKAGE_PIN AF34 [get_ports {DMBI_H2F[1]}]
set_property -quiet PACKAGE_PIN AG34 [get_ports {DMBI_H2F[2]}]
set_property -quiet PACKAGE_PIN AG35 [get_ports {DMBI_H2F[3]}]
set_property -quiet PACKAGE_PIN AE32 [get_ports {DMBI_H2F[4]}]
set_property -quiet PACKAGE_PIN AE33 [get_ports {DMBI_H2F[5]}]
set_property -quiet PACKAGE_PIN AF32 [get_ports {DMBI_H2F[6]}]
set_property -quiet PACKAGE_PIN AG32 [get_ports {DMBI_H2F[7]}]
set_property -quiet PACKAGE_PIN AF35 [get_ports {DMBI_H2F[8]}]
set_property -quiet PACKAGE_PIN AG41 [get_ports {DMBI_H2F[9]}]
set_property -quiet PACKAGE_PIN AH41 [get_ports {DMBI_H2F[10]}]
set_property -quiet PACKAGE_PIN AE37 [get_ports {DMBI_H2F[11]}]
set_property -quiet PACKAGE_PIN AE38 [get_ports {DMBI_H2F[12]}]
set_property -quiet PACKAGE_PIN AH39 [get_ports {DMBI_H2F[13]}]
set_property -quiet PACKAGE_PIN AF37 [get_ports {DMBI_H2F[14]}]
set_property -quiet PACKAGE_PIN AF38 [get_ports {DMBI_H2F[15]}]
set_property -quiet PACKAGE_PIN AG39 [get_ports {DMBI_H2F[16]}]
set_property -quiet PACKAGE_PIN AE35 [get_ports {DMBI_H2F[17]}]
set_property -quiet PACKAGE_PIN AE36 [get_ports {DMBI_H2F[18]}]
set_property -quiet PACKAGE_PIN AA35 [get_ports {DMBI_H2F[19]}]

set_property -quiet PACKAGE_PIN AC29 [get_ports {LED_BLUE}]
set_property -quiet PACKAGE_PIN AD30 [get_ports {LED_GREEN}]
set_property -quiet PACKAGE_PIN AD31 [get_ports {LED_RED}]
set_property -quiet PACKAGE_PIN AD29 [get_ports {LED_YELLOW}]
set_property -quiet PACKAGE_PIN AB42 [get_ports {SRC_CLK_N_0}]
set_property -quiet PACKAGE_PIN AA43 [get_ports {SRC_CLK_N_1}]
set_property -quiet PACKAGE_PIN AC44 [get_ports {SRC_CLK_N_2}]
set_property -quiet PACKAGE_PIN AA44 [get_ports {SRC_CLK_N_3}]
set_property -quiet PACKAGE_PIN AC42 [get_ports {SRC_CLK_P_0}]
set_property -quiet PACKAGE_PIN AA42 [get_ports {SRC_CLK_P_1}]
set_property -quiet PACKAGE_PIN AC43 [get_ports {SRC_CLK_P_2}]
set_property -quiet PACKAGE_PIN AB44 [get_ports {SRC_CLK_P_3}]
set_property -quiet PACKAGE_PIN AB30 [get_ports {SRC_SYNC_N_0}]
set_property -quiet PACKAGE_PIN AC32 [get_ports {SRC_SYNC_N_1}]
set_property -quiet PACKAGE_PIN AA30 [get_ports {SRC_SYNC_N_2}]
set_property -quiet PACKAGE_PIN AB32 [get_ports {SRC_SYNC_N_3}]
set_property -quiet PACKAGE_PIN AB29 [get_ports {SRC_SYNC_P_0}]
set_property -quiet PACKAGE_PIN AC31 [get_ports {SRC_SYNC_P_1}]
set_property -quiet PACKAGE_PIN AA29 [get_ports {SRC_SYNC_P_2}]
set_property -quiet PACKAGE_PIN AB31 [get_ports {SRC_SYNC_P_3}]
set_property -quiet PACKAGE_PIN AB36 [get_ports {SYNC_N_0}]
set_property -quiet PACKAGE_PIN AD34 [get_ports {SYNC_N_1}]
set_property -quiet PACKAGE_PIN AA37 [get_ports {SYNC_N_2}]
set_property -quiet PACKAGE_PIN AD40 [get_ports {SYNC_N_3}]
set_property -quiet PACKAGE_PIN AD36 [get_ports {SYNC_N_4}]
set_property -quiet PACKAGE_PIN AA33 [get_ports {SYNC_N_5}]
set_property -quiet PACKAGE_PIN AC34 [get_ports {SYNC_N_6}]
set_property -quiet PACKAGE_PIN AA34 [get_ports {SYNC_N_7}]
set_property -quiet PACKAGE_PIN AB35 [get_ports {SYNC_P_0}]
set_property -quiet PACKAGE_PIN AD33 [get_ports {SYNC_P_1}]
set_property -quiet PACKAGE_PIN AB37 [get_ports {SYNC_P_2}]
set_property -quiet PACKAGE_PIN AD39 [get_ports {SYNC_P_3}]
set_property -quiet PACKAGE_PIN AD35 [get_ports {SYNC_P_4}]
set_property -quiet PACKAGE_PIN AA32 [get_ports {SYNC_P_5}]
set_property -quiet PACKAGE_PIN AC33 [get_ports {SYNC_P_6}]
set_property -quiet PACKAGE_PIN AB34 [get_ports {SYNC_P_7}]
set_property -quiet PACKAGE_PIN AD38 [get_ports {UART_CTS_B}]
set_property -quiet PACKAGE_PIN AC37 [get_ports {UART_RTS_B}]
set_property -quiet PACKAGE_PIN AC36 [get_ports {UART_RXD}]
set_property -quiet PACKAGE_PIN AC38 [get_ports {UART_TXD}]

# set_property DCI_CASCADE {20 22 } [get_iobanks 21]
# set_property INTERNAL_VREF {0.90} [get_iobanks 21]
# set_property INTERNAL_VREF {0.90} [get_iobanks 20]
# set_property INTERNAL_VREF {0.90} [get_iobanks 22]
# set_property DCI_CASCADE {34 36 } [get_iobanks 35]
# set_property INTERNAL_VREF {0.90} [get_iobanks 35]
# set_property INTERNAL_VREF {0.90} [get_iobanks 34]
# set_property INTERNAL_VREF {0.90} [get_iobanks 36]
# set_property DCI_CASCADE {37 39 } [get_iobanks 38]
# set_property INTERNAL_VREF {0.90} [get_iobanks 38]
# set_property INTERNAL_VREF {0.90} [get_iobanks 37]
# set_property INTERNAL_VREF {0.90} [get_iobanks 39]
# set_property DCI_CASCADE {31 33 } [get_iobanks 32]
# set_property INTERNAL_VREF {0.90} [get_iobanks 32]
# set_property INTERNAL_VREF {0.90} [get_iobanks 31]
# set_property INTERNAL_VREF {0.90} [get_iobanks 33]
# set_property DCI_CASCADE {17 19 } [get_iobanks 18]
# set_property INTERNAL_VREF {0.90} [get_iobanks 18]
# set_property INTERNAL_VREF {0.90} [get_iobanks 17]
# set_property INTERNAL_VREF {0.90} [get_iobanks 19]
# set_property DCI_CASCADE {11 13 } [get_iobanks 12]
# set_property INTERNAL_VREF {0.90} [get_iobanks 12]
# set_property INTERNAL_VREF {0.90} [get_iobanks 11]
# set_property INTERNAL_VREF {0.90} [get_iobanks 13]
# set_property DCI_CASCADE {40 42 } [get_iobanks 41]
# set_property INTERNAL_VREF {0.90} [get_iobanks 41]
# set_property INTERNAL_VREF {0.90} [get_iobanks 40]
# set_property INTERNAL_VREF {0.90} [get_iobanks 42]
# set_property INTERNAL_VREF {0.90} [get_iobanks 16]


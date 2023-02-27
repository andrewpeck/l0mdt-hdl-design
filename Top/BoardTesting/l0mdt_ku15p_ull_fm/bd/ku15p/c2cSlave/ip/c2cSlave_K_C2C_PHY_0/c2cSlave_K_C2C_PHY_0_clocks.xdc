 ##################################################################################
 ##
 ## Project:  Aurora 64B/66B
 ## Company:  Xilinx
 ##
 ##
 ##
 ## (c) Copyright 2012 - 2013 Xilinx, Inc. All rights reserved.
 ##
 ## This file contains confidential and proprietary information
 ## of Xilinx, Inc. and is protected under U.S. and
 ## international copyright and other intellectual property
 ## laws.
 ##
 ## DISCLAIMER
 ## This disclaimer is not a license and does not grant any
 ## rights to the materials distributed herewith. Except as
 ## otherwise provided in a valid license issued to you by
 ## Xilinx, and to the maximum extent permitted by applicable
 ## law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
 ## WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
 ## AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
 ## BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
 ## INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
 ## (2) Xilinx shall not be liable (whether in contract or tort,
 ## including negligence, or under any other theory of
 ## liability) for any loss or damage of any kind or nature
 ## related to, arising under or in connection with these
 ## materials, including for any direct, or any indirect,
 ## special, incidental, or consequential loss or damage
 ## (including loss of data, profits, goodwill, or any type of
 ## loss or damage suffered as a result of any action brought
 ## by a third party) even if such damage or loss was
 ## reasonably foreseeable or Xilinx had been advised of the
 ## possibility of the same.
 ##
 ## CRITICAL APPLICATIONS
 ## Xilinx products are not designed or intended to be fail-
 ## safe, or for use in any application requiring fail-safe
 ## performance, such as life-support or safety devices or
 ## systems, Class III medical devices, nuclear facilities,
 ## applications related to the deployment of airbags, or any
 ## other applications that could lead to death, personal
 ## injury, or severe property or environmental damage
 ## (individually and collectively, "Critical
 ## Applications"). Customer assumes the sole risk and
 ## liability of any use of Xilinx products in Critical
 ## Applications, subject only to applicable laws and
 ## regulations governing limitations on product liability.
 ##
 ## THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
 ## PART OF THIS FILE AT ALL TIMES.
 
 ##
 #################################################################################
 
 ##
 ##  c2cSlave_K_C2C_PHY_0
 ##
 ##
 ##  Description: This is the design constraints file for a 1 lane Aurora
 ##               core. 
 ##               It contains all the clocks generated by the core
 ##
 ##
################################################################################ 
		#create_clock -period 32.0 [get_ports user_clk_out] 
		#create_clock -period 20.000	 [get_ports init_clk] 
 
################################################################################
 
################################################################################
  #*below constraints are copied from GT, need to update based upon the shared and non shared mode. ***
    # below false path constraints are copied from the GT wizards for CPLL based test cases
    # False path constraints
    # ----------------------------------------------------------------------------------------------------------------------
    # below constraints are related to the blocks of Ultrascale GT Wizard which are in Aurora core like
    # Tx and Rx user clock modules etc.
    # UltraScale FPGAs Transceivers Wizard IP example design-level XDC file
    # ----------------------------------------------------------------------------------------------------------------------
	 #set_false_path -through [get_cells -hierarchical -filter {NAME =~ *ultrascale_tx_userclk_1*gtwiz_userclk_tx_active_out_reg}]
	 #set_false_path -through [get_pins -filter {REF_PIN_NAME=~*CLR} -of_objects [get_cells -hierarchical -filter {NAME =~ *ultrascale_tx_userclk_1*gtwiz_userclk_tx_active_out_reg*}]]
  
	#set_false_path -through [get_cells -hierarchical -filter {NAME =~ *ultrascale_rx_userclk*gtwiz_userclk_rx_active_out_reg}] 
    #set_false_path -through [get_pins -filter {REF_PIN_NAME=~*CLR} -of_objects [get_cells -hierarchical -filter {NAME =~ *ultrascale_rx_userclk*bufg_gt_usrclk*inst*}]]
	# ----------------------------------------------------------------------------------------------------------------------

################################################################################



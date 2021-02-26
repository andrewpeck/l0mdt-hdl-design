#------------------------------------------------------------------------------
#  (c) Copyright 2013-2015 Xilinx, Inc. All rights reserved.
#
#  This file contains confidential and proprietary information
#  of Xilinx, Inc. and is protected under U.S. and
#  international copyright and other intellectual property
#  laws.
#
#  DISCLAIMER
#  This disclaimer is not a license and does not grant any
#  rights to the materials distributed herewith. Except as
#  otherwise provided in a valid license issued to you by
#  Xilinx, and to the maximum extent permitted by applicable
#  law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
#  WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
#  AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
#  BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
#  INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
#  (2) Xilinx shall not be liable (whether in contract or tort,
#  including negligence, or under any other theory of
#  liability) for any loss or damage of any kind or nature
#  related to, arising under or in connection with these
#  materials, including for any direct, or any indirect,
#  special, incidental, or consequential loss or damage
#  (including loss of data, profits, goodwill, or any type of
#  loss or damage suffered as a result of any action brought
#  by a third party) even if such damage or loss was
#  reasonably foreseeable or Xilinx had been advised of the
#  possibility of the same.
#
#  CRITICAL APPLICATIONS
#  Xilinx products are not designed or intended to be fail-
#  safe, or for use in any application requiring fail-safe
#  performance, such as life-support or safety devices or
#  systems, Class III medical devices, nuclear facilities,
#  applications related to the deployment of airbags, or any
#  other applications that could lead to death, personal
#  injury, or severe property or environmental damage
#  (individually and collectively, "Critical
#  Applications"). Customer assumes the sole risk and
#  liability of any use of Xilinx products in Critical
#  Applications, subject only to applicable laws and
#  regulations governing limitations on product liability.
#
#  THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
#  PART OF THIS FILE AT ALL TIMES.
#------------------------------------------------------------------------------


# UltraScale FPGAs Transceivers Wizard IP example design-level XDC file
# ----------------------------------------------------------------------------------------------------------------------

# ----------------------------------------------------------------------------------------------------------------------
# ************************************************ PHYSICAL CONSTRAINTS ************************************************ 
# ----------------------------------------------------------------------------------------------------------------------
# Location constraints for differential reference clock buffers
# Note: the IP core-level XDC constrains the transceiver channel data pin locations
# ----------------------------------------------------------------------------------------------------------------------
# MGT_SI570_CLOCK - on-board oscillator used for Rx reference clock
#  Tipically, Tx and Rx share the same reference clock, in this design two
#  separate clocks are used for a full proof-of-concept but this shall not be
#  seen as a requirement/recommendation
set_property package_pin P5 [get_ports mgtrefclk0_x0y3_n]
set_property package_pin P6 [get_ports mgtrefclk0_x0y3_p]

#FMC_LPC_GBTCLK0 - connect an FMC and an external generator for Tx reference clock
#  example of FMC which can be used: TTC-PON FMC
set_property package_pin T5 [get_ports mgtrefclk1_x0y2_n]
set_property package_pin T6 [get_ports mgtrefclk1_x0y2_p]

# Location and default clock constraints for differential recovered clock output buffers - direct from transceiver
# ----------------------------------------------------------------------------------------------------------------------
# SMA_MGT_REF_CLK - ac-coupled on-board
set_property package_pin V6 [get_ports rxrecclkout_chx0y11_p]
set_property package_pin V5 [get_ports rxrecclkout_chx0y11_n]

# Location and default clock constraints for recovered clock output buffers - going through fabric
# ----------------------------------------------------------------------------------------------------------------------
set_property package_pin h27 [get_ports rxusrclk]
set_property iostandard lvcmos18 [get_ports rxusrclk]
set_property slew fast [get_ports rxusrclk]

# Location constraints for other example design top-level ports
# Note: uncomment the following set_property constraints and replace "<>" with appropriate pin locations for your board
# ----------------------------------------------------------------------------------------------------------------------
set_property package_pin G10 [get_ports hb_gtwiz_reset_clk_freerun_in_p]
set_property iostandard  LVDS [get_ports hb_gtwiz_reset_clk_freerun_in_p]
set_property package_pin F10 [get_ports hb_gtwiz_reset_clk_freerun_in_n]
set_property iostandard  LVDS [get_ports hb_gtwiz_reset_clk_freerun_in_n]

#GPIO_SW_C
set_property package_pin AE10 [get_ports hb_gtwiz_reset_all_in]
set_property iostandard  LVCMOS18 [get_ports hb_gtwiz_reset_all_in]

#GPIO_SW_E
set_property package_pin AE8 [get_ports link_down_latched_reset_in]
set_property iostandard  LVCMOS18 [get_ports link_down_latched_reset_in]

#GPIO_LED_0
set_property package_pin AP8 [get_ports link_status_out]
set_property iostandard  LVCMOS18 [get_ports link_status_out]

#GPIO_LED_1
set_property package_pin H23 [get_ports link_down_latched_out]
set_property iostandard  LVCMOS18 [get_ports link_down_latched_out]

#GPIO_LED_2
set_property package_pin P20 [get_ports rx_locked_out]
set_property iostandard  LVCMOS18 [get_ports rx_locked_out]

#GPIO_LED_3
set_property package_pin P21 [get_ports tx_aligned_out]
set_property iostandard  LVCMOS18 [get_ports tx_aligned_out]

# ----------------------------------------------------------------------------------------------------------------------
# MGT constraining of RXSLIDE to shift clock instead of data
# ----------------------------------------------------------------------------------------------------------------------
set_property RXSLIDE_MODE PMA [get_cells -hier -filter {NAME=~*GTHE3_CHANNEL_PRIM_INST}]

# ----------------------------------------------------------------------------------------------------------------------
# ************************************************* TIMING CONSTRAINTS ************************************************* 
# ----------------------------------------------------------------------------------------------------------------------
# ----------------------------------------------------------------------------------------------------------------------
# Clock constraints for clocks provided as inputs to the core
# Note: the IP core-level XDC constrains clocks produced by the core, which drive user clocks via helper blocks
# ----------------------------------------------------------------------------------------------------------------------
create_clock -name clk_freerun -period 8.0 [get_ports hb_gtwiz_reset_clk_freerun_in_p]
create_clock -name clk_mgtrefclk0_x0y3_p -period 3.125 [get_ports mgtrefclk0_x0y3_p]
create_clock -name clk_mgtrefclk1_x0y2_p -period 3.125 [get_ports mgtrefclk1_x0y2_p]

# Constrain the input to the OBUFDS_GTE3 primitive(s) at the maximum frequency that can be generated by the programmable
# divider for the receiver line rate. This can be changed to the exact frequency if the divider will not be modified.
create_clock -name clk_rxrecclk_chX0Y11 -period 0.39 [get_pins -filter {NAME =~ OBUFDS_GTE3_CHX0Y11_INST/I}]

# False path constraints
# ----------------------------------------------------------------------------------------------------------------------
# Synchronizers from example design
set_false_path -to [get_cells -hierarchical -filter {NAME =~ *bit_synchronizer*inst/i_in_meta_reg}]
set_false_path -to [get_cells -hierarchical -filter {NAME =~ *reset_synchronizer*inst/rst_in_*_reg}]

# Synchronizers internal to rx_word_aligner
set_false_path -to [get_pins -hier -filter  {NAME =~ *rx_word_aligner_inst/*meta*/D}]

# Synchronizers internal to tx_phase_aligner
set_false_path -to [get_pins -hier -filter  {NAME =~ *tx_phase_aligner_inst/*meta*/D}]

# Latched with a done signal
set_false_path -to [get_pins -hier -filter  {NAME =~ *tx_phase_aligner_inst/cmp_fifo_fill_level_acc/phase_detector_o*/D}]

# Reset fifo fill pd after changing value of phase_detector_max from FSM
set_false_path -from [get_pins -hier -filter {NAME =~ tx_phase_aligner_inst/cmp_tx_phase_aligner_fsm/*/C}] -to [get_pins -hier -filter {NAME =~ *tx_phase_aligner_inst/cmp_fifo_fill_level_acc/phase_detector_acc_reg*/CE}]
set_false_path -from [get_pins -hier -filter {NAME =~ tx_phase_aligner_inst/cmp_tx_phase_aligner_fsm/*/C}] -to [get_pins -hier -filter {NAME =~ *tx_phase_aligner_inst/cmp_fifo_fill_level_acc/hits_acc_reg*/CE}]
set_false_path -from [get_pins -hier -filter {NAME =~ tx_phase_aligner_inst/cmp_tx_phase_aligner_fsm/*/C}] -to [get_pins -hier -filter {NAME =~ *tx_phase_aligner_inst/cmp_fifo_fill_level_acc/done_reg/D}]

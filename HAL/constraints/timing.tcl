# -*- mode: vivado; -*-

#################################################################################
# MGT Refclk
#################################################################################

# Apply asynchronous group constraints to the mgt refclks
# https://support.xilinx.com/s/article/44651?language=en_US

foreach clock [concat \
                   [get_clocks refclk*]] {
    puts $clock
    set_clock_groups -group [get_clocks $clock] -asynchronous
}
set_clock_groups -name axi_clk -asynchronous -group [get_clocks clk50]


# asynchronous clock relationship for tx/rx clocks to/from axi
foreach clock_b \
    [concat \
         [get_clocks axi_clk] \
         [get_clocks clock_async]] {
             foreach clock_a [concat \
                                  [get_clocks *TXOUTCLKPCS*] \
                                  [get_clocks *RXOUTCLK\[*] \
                                  [get_clocks *TXOUTCLK\[*]] {
                 set_clock_groups \
                     -group [get_clocks $clock_a] \
                     -group [get_clocks $clock_b] \
                     -asynchronous}}

################################################################################
# Freeclock is asynchronous to the transceiver clocks
################################################################################

set_clock_groups \
    -group [get_clocks clk100] \
    -group [get_clocks *XOUTCLK*] \
    -asynchronous

set_clock_groups \
    -group [get_clocks clk50] \
    -group [get_clocks *XOUTCLK*] \
    -asynchronous


################################################################################
# SL
################################################################################

# there's no known phase relationship between the rx clocks and the 40MHz clock
# but the clocks are frequency locked (mesochronous)

#set_max_delay -quiet -datapath_only 5.0 \
#   -from [get_pins -hierarchical -filter \
#             "NAME =~ top_hal/*sector_logic*rx_packet_former*packet_valid_reg/C"] \
# -to [get_pins -hierarchical -filter \
#         "NAME =~ top_hal/*rx_data*s_resync_reg*/D"]

#set_max_delay -quiet -datapath_only 5.0 \
 #   -from [get_pins "top_hal/*sector_logic*/*rx_packet_former*/packet_userdata*/C"] \
  #  -to   [get_pins "top_hal/sector_logic_link_wrapper_inst/*sync_sl_rx*/*dest_out*/D"]

#set_max_delay -quiet -datapath_only 5.0 \
 #   -from [get_pins -hierarchical -filter \
  #             "NAME =~ top_hal/*sector_logic*`tx_packet_former_inst*packet_userdata*/C"] \
  #  -to [get_pins -hierarchical -filter \
   #          "NAME =~ top_hal/*sector_logic*cdc_bus_inst*data_o_reg*/D"]

#set_max_delay -datapath_only -from [get_clocks  -regexp {.*320.*}] -to [get_clocks  -regexp {.*txoutclk_out\[.+\]$.*}] 5.0

#set_max_delay -datapath_only 5.0 \
 #   -from [get_clocks -of_objects [get_pins {top_hal/mgt_wrapper_inst/mgt_gen[*].sl_gen.MGT_INST/gty_gen_all.MGT_GEN/example_wrapper_inst/gty_bank122_inst/inst/gen_gtwizard_gtye4_top.gty_bank122_gtwizard_gtye4_inst/gen_gtwizard_gtye4.gen_channel_container[2].gen_enabled_channel.gtye4_channel_wrapper_inst/channel_inst/gtye4_channel_gen.gen_gtye4_channel_inst[*].GTYE4_CHANNEL_PRIM_INST/RXOUTCLK}]]  \
#    -to [get_clocks -of_objects [get_pins top_hal/top_clocking_inst/framework_mmcm_inst/inst/mmcme4_adv_inst/CLKOUT0]] 








# the TXCLK is something that is controlled by us, since it is locked to the
# REFCLK that we supply.. there is some phase uncertainty of the 4.1166 ns clock
# but we can control the phase of it with the clock synth.. just keep the
# datapath well under 4.166 ns so then we can adjust the phase using the clock
# synthesizer
# 
# NOTE from RR: we really don't have the possibility to adjust the phase using 
#   the clock synthesizer, we would need to adjust it using the MMCM

set_max_delay -quiet -datapath_only 3.1 \
    -to [get_clocks "*TXOUTCLK*"] \
    -from [get_clocks "*clk*mmcm*"]

set_max_delay -quiet -datapath_only 3.1 \
    -to [get_clocks "*RXOUTCLK*"] \
    -from [get_clocks "*clk*mmcm*"]

# trying to make reset_clk40 to be synchronus everywhere is no sense at least for SL logic
#set_false_path -from [get_pins top_hal/reset_clk40_reg_rep/C] -to [get_pins {top_hal/sector_logic_link_wrapper_inst/*/*/R}]

set_false_path -from [get_pins top_hal/sector_logic_link_wrapper_inst/reset_int_reg/C] \
    -to [get_pins -filter {REF_PIN_NAME=~*R} -of_objects [get_cells -hierarchical -filter \
    {NAME =~ top_hal/sector_logic_link_wrapper_inst/sl_gen*.mgt_tag*.rx_gen.rx_comma_detector_inst/*}]]
    
set_false_path -from [get_pins top_hal/sector_logic_link_wrapper_inst/reset_int_reg/C] \
    -to [get_pins -filter {REF_PIN_NAME=~*D} -of_objects [get_cells -hierarchical -filter \
    {NAME =~ top_hal/sector_logic_link_wrapper_inst/sl_gen*.mgt_tag*.rx_gen.rx_comma_detector_inst/*}]]

set_false_path -from [get_pins top_hal/sector_logic_link_wrapper_inst/reset_int_reg/C] \
    -to [get_pins -filter {REF_PIN_NAME=~*CE} -of_objects [get_cells -hierarchical -filter \
    {NAME =~ top_hal/sector_logic_link_wrapper_inst/sl_gen*.mgt_tag*.rx_gen.rx_comma_detector_inst/*}]]
    
set_false_path -from [get_pins top_hal/sector_logic_link_wrapper_inst/reset_int_reg/C] \
    -to [get_pins -filter {REF_PIN_NAME=~*R} -of_objects [get_cells -hierarchical -filter \
    {NAME =~ top_hal/sector_logic_link_wrapper_inst/sl_gen*.mgt_tag*.rx_gen.rx_test_pattern_checker_inst/*}]]

set_false_path -from [get_pins top_hal/sector_logic_link_wrapper_inst/reset_int_reg/C] \
    -to [get_pins -filter {REF_PIN_NAME=~*R} -of_objects [get_cells -hierarchical -filter \
    {NAME =~ top_hal/sector_logic_link_wrapper_inst/sl_gen*.mgt_tag*.rx_gen.sector_logic_rx_packet_former_inst/*}]]
    
set_false_path -from [get_pins top_hal/sector_logic_link_wrapper_inst/reset_int_reg/C] \
    -to [get_pins -filter {REF_PIN_NAME=~*D} -of_objects [get_cells -hierarchical -filter \
    {NAME =~ top_hal/sector_logic_link_wrapper_inst/sl_gen*.mgt_tag*.rx_gen.sector_logic_rx_packet_former_inst/*}]]
    
################################################################################
# sys_resetter has an asynchronous output (on the axi clock domain) that
# connects to synchronous reset inputs (on other clock domains) and creates a
# timing error; just create a false path to prevent timing errors caused by this
# clock domain crossing
################################################################################

# this timing constraint applies to the OOC synthesized BD, so if you try to set
# this during synthesis vivado barfs that the pin can't be found, so we need the
# -quiet flag
set_false_path -quiet -from [get_pins "top_control_inst/*/sys_reseter/*/*/C"]

# Setting a false path for the FELIX lpgbt, since they are not actually lpgbts...
set_false_path -quiet -from [get_pins {top_hal/felix_decoder_inst/felix_10_gbps_rx_inst/frame_pipelined_s_reg*/C}] -to [get_pins {top_hal/felix_decoder_inst/felix_10_gbps_rx_inst/lpgbtfpga_descrambler_inst/fec5_gen.descrambler58bitOrder58_l0_inst/descrambledData_reg*/D}]
set_false_path -quiet -from [get_pins {top_hal/felix_decoder_inst/felix_10_gbps_rx_inst/frame_pipelined_s_reg*/C}] -to [get_pins {top_hal/felix_decoder_inst/felix_10_gbps_rx_inst/lpgbtfpga_descrambler_inst/fec5_gen.descrambler58bitOrder58_l0_inst/memory_register_reg*/D}]
set_false_path -quiet -from [get_pins {top_hal/felix_decoder_inst/l0mdt_ttc_ff_reg*/C}] -to [get_pins {top_hal/felix_decoder_inst/l0mdt_ttc_40m_reg*/D}]

################################################################################
# Transitions to/from the AXI clocks are asynchronous
################################################################################

#set_clock_groups -group [get_clocks "clock_async"] -asynchronous
#set_clock_groups -group [get_clocks "axi_clk*"]    -asynchronous

################################################################################
# The input to this reset comes from AXI clock domain but onto the MGT clock
# just set a false path to prevent timing analysis
################################################################################

set_false_path \
    -to [get_pins -hierarchical -filter \
             "NAME =~ top_hal/mgt_wrapper_inst/*synchronizer*/i_in_meta_reg/D"]

################################################################################
# Uncomment to disable all logic trimming
################################################################################

# set_property DONT_TOUCH true [get_cells -hierarchical *]

################################################################################
# Max Fanouts
################################################################################

# this might be useful to keep.. it is a high fanout net (~2500) and has issues
# so keep the fanout low to force replication
set_property -quiet MAX_FANOUT 256 [get_cells -hier "*int_rst_reg"]
#PRIYAset_property MAX_FANOUT 256 [get_cells "top_hal/userclk_rst_bit_synchronizer/syncstages_ff_reg*"]
set_property MAX_FANOUT 256 [get_cells "top_hal/rst_bit_synchronizer/syncstages_ff_reg*"]
set_property -quiet MAX_FANOUT 256 [get_cells "ult_inst/logic_gen.H2S_GEN.ULT_H2S/HPS_*.HPS/PC/pc_gen*.pc_en.PC/VC/apb_mem_interface/MEM_TYPE.o_wr_addr_reg*"]
#PRIYA set_max_delay -datapath_only  -from [get_pins top_hal/reset_clk40_reg/C] -to [get_pins {top_hal/csm_gen[0].csm_ifgen.mgt_tag[32].csm_inst/lpgbt_links_inst/downlink_gen[0].downlink_reset_reg/D}] 2.300

################################################################################
# Ctrl & Mon
################################################################################

#set_max_delay 12.5 \
#    -from [get_cells -hierarchical -filter "NAME =~ top_control_inst/*_mon_r_reg*"]

#set_max_delay 12.5 \
#    -to   [get_cells "top_control_inst/*_ctrl_reg*"]

################################################################################
# Clock frequency counters
################################################################################

set_max_delay -datapath_only \
    -from [get_clocks] \
    -to [get_pins -hierarchical -filter { NAME =~ "*i_clk_frequency*/rate_reg[*]/D"}] 8

set_max_delay -datapath_only \
    -from [get_clocks] \
    -to [get_pins -hierarchical -filter { NAME =~ "*i_clk_frequency*/valid_sr_reg[0]/D"}] 8

set_max_delay -datapath_only \
    -from [get_clocks] \
    -to [get_pins -hierarchical -filter { NAME =~ "*i_clk_frequency*/measure_sr_reg[0]/D"}] 8

#--------------------------------------------------------------------------------
# Max Delay Paths for Async Reset from MMCM
#--------------------------------------------------------------------------------

set_max_delay -datapath_only 25 \
    -from [get_pins top_hal/reset_clk40_reg*/C] \
    -to [get_pins {top_hal/sector_logic_link_wrapper_inst/*/*/*/CLR}]

# The CLOCK_DELAY_GROUP property identifies related clocks that have the same
# MMCM, PLL, GT source, or common driver that should be balanced during placement
# and routing to reduce clock skew on timing paths between the clocks.

set_property CLOCK_DELAY_GROUP RQSGroupOptimized0 [get_nets { top_hal/top_clocking_inst/framework_mmcm_inst/inst/clk320_o top_hal/top_clocking_inst/framework_mmcm_inst/inst/clk40_o  }]

# this is a reset synchronizer in the SL core.. it goes through several FFs
# after this. The exact timing does not matter so we could relax it a bit
set_max_delay -datapath_only 3 \
    -from [get_pins {top_hal/mgt_wrapper_inst/mgt_gen*.sl_gen.MGT_INST/gty_gen_all.MGT_GEN/example_wrapper_inst/gty_*_inst/inst/gen_gtwizard_gtye4_top.gty_*_gtwizard_gtye4_inst/gen_gtwizard_gtye4.gen_pwrgood_delay_inst*.delay_powergood_inst/gen_powergood_delay.pwr_on_fsm_reg/C}] \
    -to [get_pins {top_hal/mgt_wrapper_inst/mgt_gen*.sl_gen.MGT_INST/gty_gen_all.MGT_GEN/example_wrapper_inst/gty_*_inst/inst/gen_gtwizard_gtye4_top.gty_*_gtwizard_gtye4_inst/gen_gtwizard_gtye4.gen_pwrgood_delay_inst*.delay_powergood_inst/gen_powergood_delay.intclk_rrst*/CE}]

#--------------------------------------------------------------------------------
# SL GTY: false_path
#--------------------------------------------------------------------------------

set_false_path -to [get_cells -hierarchical -filter {NAME =~ top_hal/mgt_wrapper_inst/mgt_gen*.sl_gen.MGT_INST/gty_gen_all.MGT_GEN/*bit_synchronizer*inst/i_in_meta_reg}]
set_false_path -to [get_pins -filter {REF_PIN_NAME=~*D} -of_objects [get_cells -hierarchical -filter {NAME =~ *reset_synchronizer*inst/rst_in_meta*}]]
set_false_path -to [get_pins -filter {REF_PIN_NAME=~*PRE} -of_objects [get_cells -hierarchical -filter {NAME =~ *reset_synchronizer*inst/rst_in_*}]]
set_false_path -to [get_pins -filter {REF_PIN_NAME=~*CLR} -of_objects [get_cells -hierarchical -filter {NAME =~ *reset_synchronizer*inst/rst_in_*}]]
#set_false_path -from [get_pins top_hal/sector_logic_link_wrapper_inst/reset_int_reg/C] -to [get_pins {top_hal/sector_logic_link_wrapper_inst/sl_gen*.mgt_tag*.rx_gen.rx_comma_detector_inst/rereset_i0*}]
#set_false_path -from [get_pins top_hal/sector_logic_link_wrapper_inst/reset_int_reg/C] -to [get_pins {top_hal/sector_logic_link_wrapper_inst/sl_gen*.mgt_tag*.rx_gen.rx_test_pattern_checker_inst/reset0}]
set_max_delay -from [get_pins top_hal/reset_clk40_reg/C] -to [get_pins {top_hal/csm_gen[0].csm_ifgen.mgt_tag[32].csm_inst/lpgbt_links_inst/downlink_gen[0].downlink_reset_reg/D}] 2.5

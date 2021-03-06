# sector logic clock domain crossing

# https://forums.xilinx.com/t5/Synthesis/Vivado-Implementation-Duplicates-Clocks-and-Creates-Unsafe/td-p/856321
set_case_analysis 0  [get_pins top_hal/top_clocking_inst/*/*/CLKINSEL ]

#################################################################################
# GT to AXI Clock Exceptions
#################################################################################

set_max_delay -datapath_only \
    -from [get_clocks GTYE4_CHANNEL_TXOUTCLKPCS*] \
    -to [get_clocks clock_100] 2.5

set_max_delay -datapath_only \
    -from [get_clocks GTYE4_CHANNEL_TXOUTCLKPCS*] \
    -to [get_clocks axi_clk] 2.5

set_max_delay -datapath_only \
    -from [get_clocks GTYE4_CHANNEL_RXOUTCLK*] \
    -to [get_clocks clock_100] 2.5

set_max_delay -datapath_only \
    -from [get_clocks GTYE4_CHANNEL_RXOUTCLK*] \
    -to [get_clocks axi_clk] 2.5

#################################################################################
#
#################################################################################

set_max_delay -datapath_only \
    -from [get_clocks *] \
    -to [get_pins -hierarchical -filter {NAME =~ *s_resync_reg*/D}] 2.5

set_max_delay -datapath_only \
    -from [get_clocks *] \
    -to [get_pins -hierarchical -filter {NAME =~ *gen_cdc_bus_inst*/D}] 6

set_false_path \
    -from [get_pins top_hal/mgt_wrapper_inst/mgt_gen*/*/*/*/*/*/rst_in_out_reg/C] \
    -to [get_pins top_control_inst/hal_core_interface_inst/localRdData_latch_reg*/D]

set_false_path \
    -to [get_pins top_hal/mgt_wrapper_inst/*.mon_reg*x_reset_done*/D]

set_false_path \
    -to [get_pins top_hal/mgt_wrapper_inst/*.mon_reg*buffbypass_tx_done_out*/D]

set_false_path \
    -to [get_pins top_hal/mgt_wrapper_inst/*.mon_reg*buffbypass_tx_error_out*/D]

set_false_path \
    -to [get_pins top_hal/mgt_wrapper_inst/*.mon_reg*done_out*/D]

set_false_path \
    -to [get_pins top_hal/mgt_wrapper_inst/*.mon_reg*error_out*/D]

set_false_path \
    -from [get_cells top_control_inst/c2cslave_wrapper*/*/sys_reseter/U0/ACTIVE_LOW_BSR_OUT_DFF*]

set_false_path \
    -from [get_pins top_hal/mgt_wrapper_inst/axi_map_gen[*].tx_resets_reg[*][reset_bufbypass]/C]

set_false_path \
    -from [get_pins top_control_inst/hal_core_interface_inst/reg_data*/C] \
    -to [get_pins -hierarchical -filter {NAME =~ "top_hal/top_clocking_inst/clk40_gen.*_reg/*" && (REF_PIN_NAME == D || REF_PIN_NAME == CE)}]

set_false_path \
    -from [get_pins top_hal/top_clocking_inst/clk40_gen.mmcm_locked*/C] \
    -to [get_pins -hierarchical -filter {NAME =~ "top_hal/top_clocking_inst/clk40_gen.*_reg/*" && (REF_PIN_NAME == D || REF_PIN_NAME == CE)}]

set_false_path \
    -from [get_pins {top_hal/mgt_wrapper_inst/*reset_bufbypass*/C}]

set_false_path \
    -from [get_pins {top_control_inst/hal_core_ctrl_reg[CLOCKING][SELECT_FELIX_CLK]*/C}]

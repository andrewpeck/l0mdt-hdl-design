# =============================================================================
#  IMPORTANT: Pro Design Confidential (Internal Use Only)
#  COPYRIGHT (C) 2018, Pro Design Electronic GmbH
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
#  Module        : fm1sg280ls1r1.sdc
#  Author        : Dragan Dukaric
#  Contact       : profpga-service@prodesign-europe.com,
#  Description   :
#                  Timing constraints file for Stratix 10 FM.
# =============================================================================
#-------------------------------------------
# Define input clocks period
#-------------------------------------------
set CLK0_PERIOD 10
set CLK1_PERIOD 8
set CLK2_PERIOD 8
#-------------------------------------------
# Define virtual input clock
#-------------------------------------------
# CLK_P_0 has external on board compensation (~2,2ns + ~0,6 (output delay+route delay) )
create_clock -name virtual_mmi64_tx_clk   -period $CLK0_PERIOD -waveform {7.2 12.2}
create_clock -name virtual_mmi64_rx_clk   -period $CLK0_PERIOD -waveform {2.2 7.2}

#-------------------------------------------
# Define input clocks
#-------------------------------------------
#create_clock -period $CLK0_PERIOD  -name CLK_P_0 [get_ports CLK_P_0] ; #defined via internal PLL
create_clock -name CLK_P_1 -period $CLK1_PERIOD   [get_ports CLK_P_1]
create_clock -name CLK_P_2 -period $CLK2_PERIOD   [get_ports CLK_P_2]

#-------------------------------------------
# Set custom Clock names
#-------------------------------------------
set MMI64_CLK    "U_PROFPGA_CTRL|CLK0_PLL|iopll_0_clk100"
set MMI64_IN_CLK "U_PROFPGA_CTRL|CLK0_PLL|iopll_0_refclk"

#-------------------------------------------
# Define relationship between clocks
#-------------------------------------------
set_clock_groups -asynchronous -group $MMI64_CLK -group $MMI64_IN_CLK

set_clock_groups -asynchronous -group $MMI64_CLK -group [get_clocks {CLK_P_1}] 
set_net_delay -from [get_registers {U_MMI64_ASYNC_BUFFER|u_ul_afifo_core|u_wr_ptr_full|*}   ]  -to [get_registers {U_MMI64_ASYNC_BUFFER|u_ul_afifo_core|u_sync_w2r|*}           ] -max $CLK1_PERIOD
set_net_delay -from [get_registers {U_MMI64_ASYNC_BUFFER|u_ul_afifo_core|u_rd_ptr_empty|*}  ]  -to [get_registers {U_MMI64_ASYNC_BUFFER|u_ul_afifo_core|u_sync_r2w|*}           ] -max $CLK1_PERIOD
set_net_delay -from [get_registers {U_MMI64_ASYNC_BUFFER|u_ul_afifo_core|rd_reset_req_r}    ]  -to [get_registers {U_MMI64_ASYNC_BUFFER|u_ul_afifo_core|rd_reset_req_meta_r}    ] -max $CLK1_PERIOD
set_net_delay -from [get_registers {U_MMI64_ASYNC_BUFFER|u_ul_afifo_core|rd_reset_accept_r} ]  -to [get_registers {U_MMI64_ASYNC_BUFFER|u_ul_afifo_core|rd_reset_accept_meta_r} ] -max $CLK1_PERIOD
set_max_skew  -from [get_keepers   {U_MMI64_ASYNC_BUFFER|u_ul_afifo_core|u_wr_ptr_full|*}   ]  -to [get_keepers   {U_MMI64_ASYNC_BUFFER|u_ul_afifo_core|u_sync_w2r|*}           ] 2
set_max_skew  -from [get_keepers   {U_MMI64_ASYNC_BUFFER|u_ul_afifo_core|u_rd_ptr_empty|*}  ]  -to [get_keepers   {U_MMI64_ASYNC_BUFFER|u_ul_afifo_core|u_sync_r2w|*}           ] 2
set_max_skew  -from [get_keepers   {U_MMI64_ASYNC_BUFFER|u_ul_afifo_core|rd_reset_req_r}    ]  -to [get_keepers   {U_MMI64_ASYNC_BUFFER|u_ul_afifo_core|rd_reset_req_meta_r}    ] 2
set_max_skew  -from [get_keepers   {U_MMI64_ASYNC_BUFFER|u_ul_afifo_core|rd_reset_accept_r} ]  -to [get_keepers   {U_MMI64_ASYNC_BUFFER|u_ul_afifo_core|rd_reset_accept_meta_r} ] 2
set_net_delay -from [get_registers {U_MMI64_ASYNC_BUFFER|u_dl_afifo_core|u_wr_ptr_full|*}   ]  -to [get_registers {U_MMI64_ASYNC_BUFFER|u_dl_afifo_core|u_sync_w2r|*}           ] -max $CLK1_PERIOD
set_net_delay -from [get_registers {U_MMI64_ASYNC_BUFFER|u_dl_afifo_core|u_rd_ptr_empty|*}  ]  -to [get_registers {U_MMI64_ASYNC_BUFFER|u_dl_afifo_core|u_sync_r2w|*}           ] -max $CLK1_PERIOD
set_net_delay -from [get_registers {U_MMI64_ASYNC_BUFFER|u_dl_afifo_core|rd_reset_req_r}    ]  -to [get_registers {U_MMI64_ASYNC_BUFFER|u_dl_afifo_core|rd_reset_req_meta_r}    ] -max $CLK1_PERIOD
set_net_delay -from [get_registers {U_MMI64_ASYNC_BUFFER|u_dl_afifo_core|rd_reset_accept_r} ]  -to [get_registers {U_MMI64_ASYNC_BUFFER|u_dl_afifo_core|rd_reset_accept_meta_r} ] -max $CLK1_PERIOD
set_max_skew  -from [get_keepers   {U_MMI64_ASYNC_BUFFER|u_dl_afifo_core|u_wr_ptr_full|*}   ]  -to [get_keepers   {U_MMI64_ASYNC_BUFFER|u_dl_afifo_core|u_sync_w2r|*}           ] 2
set_max_skew  -from [get_keepers   {U_MMI64_ASYNC_BUFFER|u_dl_afifo_core|u_rd_ptr_empty|*}  ]  -to [get_keepers   {U_MMI64_ASYNC_BUFFER|u_dl_afifo_core|u_sync_r2w|*}           ] 2
set_max_skew  -from [get_keepers   {U_MMI64_ASYNC_BUFFER|u_dl_afifo_core|rd_reset_req_r}    ]  -to [get_keepers   {U_MMI64_ASYNC_BUFFER|u_dl_afifo_core|rd_reset_req_meta_r}    ] 2
set_max_skew  -from [get_keepers   {U_MMI64_ASYNC_BUFFER|u_dl_afifo_core|rd_reset_accept_r} ]  -to [get_keepers   {U_MMI64_ASYNC_BUFFER|u_dl_afifo_core|rd_reset_accept_meta_r} ] 2

set_clock_groups -asynchronous -group $MMI64_CLK -group [get_clocks {CLK_P_2}] 
set_net_delay -from [get_registers {U_MMI64_AXI_MASTER|u_rxfifo_ctrl|u_wr_ptr_full|*}   ]  -to [get_registers {U_MMI64_AXI_MASTER|u_rxfifo_ctrl|u_sync_w2r|*}           ] -max $CLK2_PERIOD
set_net_delay -from [get_registers {U_MMI64_AXI_MASTER|u_rxfifo_ctrl|u_rd_ptr_empty|*}  ]  -to [get_registers {U_MMI64_AXI_MASTER|u_rxfifo_ctrl|u_sync_r2w|*}           ] -max $CLK2_PERIOD
set_net_delay -from [get_registers {U_MMI64_AXI_MASTER|u_rxfifo_ctrl|rd_reset_req_r}    ]  -to [get_registers {U_MMI64_AXI_MASTER|u_rxfifo_ctrl|rd_reset_req_meta_r}    ] -max $CLK2_PERIOD
set_net_delay -from [get_registers {U_MMI64_AXI_MASTER|u_rxfifo_ctrl|rd_reset_accept_r} ]  -to [get_registers {U_MMI64_AXI_MASTER|u_rxfifo_ctrl|rd_reset_accept_meta_r} ] -max $CLK2_PERIOD
set_max_skew  -from [get_keepers   {U_MMI64_AXI_MASTER|u_rxfifo_ctrl|u_wr_ptr_full|*}   ]  -to [get_keepers   {U_MMI64_AXI_MASTER|u_rxfifo_ctrl|u_sync_w2r|*}           ] 2
set_max_skew  -from [get_keepers   {U_MMI64_AXI_MASTER|u_rxfifo_ctrl|u_rd_ptr_empty|*}  ]  -to [get_keepers   {U_MMI64_AXI_MASTER|u_rxfifo_ctrl|u_sync_r2w|*}           ] 2
set_max_skew  -from [get_keepers   {U_MMI64_AXI_MASTER|u_rxfifo_ctrl|rd_reset_req_r}    ]  -to [get_keepers   {U_MMI64_AXI_MASTER|u_rxfifo_ctrl|rd_reset_req_meta_r}    ] 2
set_max_skew  -from [get_keepers   {U_MMI64_AXI_MASTER|u_rxfifo_ctrl|rd_reset_accept_r} ]  -to [get_keepers   {U_MMI64_AXI_MASTER|u_rxfifo_ctrl|rd_reset_accept_meta_r} ] 2
set_net_delay -from [get_registers {U_MMI64_AXI_MASTER|u_txfifo_ctrl|u_wr_ptr_full|*}   ]  -to [get_registers {U_MMI64_AXI_MASTER|u_txfifo_ctrl|u_sync_w2r|*}           ] -max $CLK2_PERIOD
set_net_delay -from [get_registers {U_MMI64_AXI_MASTER|u_txfifo_ctrl|u_rd_ptr_empty|*}  ]  -to [get_registers {U_MMI64_AXI_MASTER|u_txfifo_ctrl|u_sync_r2w|*}           ] -max $CLK2_PERIOD
set_net_delay -from [get_registers {U_MMI64_AXI_MASTER|u_txfifo_ctrl|rd_reset_req_r}    ]  -to [get_registers {U_MMI64_AXI_MASTER|u_txfifo_ctrl|rd_reset_req_meta_r}    ] -max $CLK2_PERIOD
set_net_delay -from [get_registers {U_MMI64_AXI_MASTER|u_txfifo_ctrl|rd_reset_accept_r} ]  -to [get_registers {U_MMI64_AXI_MASTER|u_txfifo_ctrl|rd_reset_accept_meta_r} ] -max $CLK2_PERIOD
set_max_skew  -from [get_keepers   {U_MMI64_AXI_MASTER|u_txfifo_ctrl|u_wr_ptr_full|*}   ]  -to [get_keepers   {U_MMI64_AXI_MASTER|u_txfifo_ctrl|u_sync_w2r|*}           ] 2
set_max_skew  -from [get_keepers   {U_MMI64_AXI_MASTER|u_txfifo_ctrl|u_rd_ptr_empty|*}  ]  -to [get_keepers   {U_MMI64_AXI_MASTER|u_txfifo_ctrl|u_sync_r2w|*}           ] 2
set_max_skew  -from [get_keepers   {U_MMI64_AXI_MASTER|u_txfifo_ctrl|rd_reset_req_r}    ]  -to [get_keepers   {U_MMI64_AXI_MASTER|u_txfifo_ctrl|rd_reset_req_meta_r}    ] 2
set_max_skew  -from [get_keepers   {U_MMI64_AXI_MASTER|u_txfifo_ctrl|rd_reset_accept_r} ]  -to [get_keepers   {U_MMI64_AXI_MASTER|u_txfifo_ctrl|rd_reset_accept_meta_r} ] 2

#-------------------------------------------
# Set pin delays (Maximum Data Skew)
#-------------------------------------------
# Input
set_input_delay -clock virtual_mmi64_tx_clk -max 0.4   [get_ports {DMBI_H2F[*]}]
set_input_delay -clock virtual_mmi64_tx_clk -max 0.4   [get_ports {DMBI_H2F[*]}] -clock_fall -add_delay
set_input_delay -clock virtual_mmi64_tx_clk -min -1.2  [get_ports {DMBI_H2F[*]}] -add_delay
set_input_delay -clock virtual_mmi64_tx_clk -min -1.2  [get_ports {DMBI_H2F[*]}] -clock_fall -add_delay

# Output
set_output_delay -clock virtual_mmi64_rx_clk -max 1.600   [get_ports {DMBI_F2H[*]}]
set_output_delay -clock virtual_mmi64_rx_clk -max 1.600   [get_ports {DMBI_F2H[*]}] -clock_fall -add_delay
set_output_delay -clock virtual_mmi64_rx_clk -min 0.850  [get_ports {DMBI_F2H[*]}]  -add_delay
set_output_delay -clock virtual_mmi64_rx_clk -min 0.850  [get_ports {DMBI_F2H[*]}]  -clock_fall -add_delay

#-------------------------------------------
# Timing Exceptions
#-------------------------------------------
set_false_path -setup -rise_from [get_clocks virtual_mmi64_tx_clk] -rise_to $MMI64_CLK
set_false_path -setup -fall_from [get_clocks virtual_mmi64_tx_clk] -fall_to $MMI64_CLK
set_false_path -hold  -rise_from [get_clocks virtual_mmi64_tx_clk] -fall_to $MMI64_CLK
set_false_path -hold  -fall_from [get_clocks virtual_mmi64_tx_clk] -rise_to $MMI64_CLK

set_false_path -setup -fall_from $MMI64_CLK -fall_to [get_clocks virtual_mmi64_rx_clk]
set_false_path -setup -rise_from $MMI64_CLK -rise_to [get_clocks virtual_mmi64_rx_clk]
set_false_path -hold  -fall_from $MMI64_CLK -rise_to [get_clocks virtual_mmi64_rx_clk]
set_false_path -hold  -rise_from $MMI64_CLK -fall_to [get_clocks virtual_mmi64_rx_clk]
set_false_path -to   [get_ports {DMBI_F2H[18]}]
set_false_path -to   [get_ports {DMBI_F2H[19]}]

set_false_path -to   [get_ports {LED_*}]
set_false_path -from {U_PROFPGA_CTRL|SYNC|user_reset_r}
set_false_path -from {U_PROFPGA_AXI_CLOCKSYNC|user_reset_r}
set_false_path -from {U_PROFPGA_REG_CLOCKSYNC|user_reset_r}
set_false_path -to   {U_PROFPGA_CTRL|local_rst_temp_sensor_r*}
set_false_path -to   {U_PROFPGA_CTRL|local_rst_sync_r*}


set_multicycle_path -from $MMI64_CLK -to [get_clocks {virtual_mmi64_rx_clk}] -hold -end -1

# =============================================================================
# Revision history :
# Version  Date        Description
# -------  ----------  --------------------------------------------------------
# 1.0      2017-07-11  File created
# 2.0      2018-01-08  Updated clock relationship
# 3.0      2018-01-08  Input output delays added
# =============================================================================

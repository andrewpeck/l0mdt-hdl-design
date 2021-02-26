//------------------------------------------------------------------------------
//  (c) Copyright 2013-2015 Xilinx, Inc. All rights reserved.
//
//  This file contains confidential and proprietary information
//  of Xilinx, Inc. and is protected under U.S. and
//  international copyright and other intellectual property
//  laws.
//
//  DISCLAIMER
//  This disclaimer is not a license and does not grant any
//  rights to the materials distributed herewith. Except as
//  otherwise provided in a valid license issued to you by
//  Xilinx, and to the maximum extent permitted by applicable
//  law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
//  WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
//  AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
//  BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
//  INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
//  (2) Xilinx shall not be liable (whether in contract or tort,
//  including negligence, or under any other theory of
//  liability) for any loss or damage of any kind or nature
//  related to, arising under or in connection with these
//  materials, including for any direct, or any indirect,
//  special, incidental, or consequential loss or damage
//  (including loss of data, profits, goodwill, or any type of
//  loss or damage suffered as a result of any action brought
//  by a third party) even if such damage or loss was
//  reasonably foreseeable or Xilinx had been advised of the
//  possibility of the same.
//
//  CRITICAL APPLICATIONS
//  Xilinx products are not designed or intended to be fail-
//  safe, or for use in any application requiring fail-safe
//  performance, such as life-support or safety devices or
//  systems, Class III medical devices, nuclear facilities,
//  applications related to the deployment of airbags, or any
//  other applications that could lead to death, personal
//  injury, or severe property or environmental damage
//  (individually and collectively, "Critical
//  Applications"). Customer assumes the sole risk and
//  liability of any use of Xilinx products in Critical
//  Applications, subject only to applicable laws and
//  regulations governing limitations on product liability.
//
//  THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
//  PART OF THIS FILE AT ALL TIMES.
//------------------------------------------------------------------------------


`timescale 1ps/1ps

// =====================================================================================================================
// This example design wrapper module instantiates the core and any helper blocks which the user chose to exclude from
// the core, connects them as appropriate, and maps enabled ports
// =====================================================================================================================

module gtwizard_ultrascale_0_example_wrapper (
  input  wire [0:0] gthrxn_in
 ,input  wire [0:0] gthrxp_in
 ,output wire [0:0] gthtxn_out
 ,output wire [0:0] gthtxp_out
 ,input  wire [0:0] gtwiz_userclk_tx_reset_in
 ,output wire [0:0] gtwiz_userclk_tx_srcclk_out
 ,output wire [0:0] gtwiz_userclk_tx_usrclk_out
 ,output wire [0:0] gtwiz_userclk_tx_usrclk2_out
 ,output wire [0:0] gtwiz_userclk_tx_active_out
 ,input  wire [0:0] gtwiz_userclk_rx_reset_in
 ,output wire [0:0] gtwiz_userclk_rx_srcclk_out
 ,output wire [0:0] gtwiz_userclk_rx_usrclk_out
 ,output wire [0:0] gtwiz_userclk_rx_usrclk2_out
 ,output wire [0:0] gtwiz_userclk_rx_active_out
 ,input  wire [0:0] gtwiz_buffbypass_rx_reset_in
 ,input  wire [0:0] gtwiz_buffbypass_rx_start_user_in
 ,output wire [0:0] gtwiz_buffbypass_rx_done_out
 ,output wire [0:0] gtwiz_buffbypass_rx_error_out
 ,input  wire [0:0] gtwiz_reset_clk_freerun_in
 ,input  wire [0:0] gtwiz_reset_all_in
 ,input  wire [0:0] gtwiz_reset_tx_pll_and_datapath_in
 ,input  wire [0:0] gtwiz_reset_tx_datapath_in
 ,input  wire [0:0] gtwiz_reset_rx_pll_and_datapath_in
 ,input  wire [0:0] gtwiz_reset_rx_datapath_in
 ,output wire [0:0] gtwiz_reset_rx_cdr_stable_out
 ,output wire [0:0] gtwiz_reset_tx_done_out
 ,output wire [0:0] gtwiz_reset_rx_done_out
 ,input  wire [31:0] gtwiz_userdata_tx_in
 ,output wire [31:0] gtwiz_userdata_rx_out
 ,input  wire [0:0] gtrefclk00_in
 ,input  wire [0:0] gtrefclk01_in
 ,output wire [0:0] qpll0outclk_out
 ,output wire [0:0] qpll0outrefclk_out
 ,output wire [0:0] qpll1outclk_out
 ,output wire [0:0] qpll1outrefclk_out
 ,input  wire [8:0] drpaddr_in
 ,input  wire [0:0] drpclk_in
 ,input  wire [15:0] drpdi_in
 ,input  wire [0:0] drpen_in
 ,input  wire [0:0] drpwe_in
 ,input  wire [2:0] loopback_in
 ,input  wire [0:0] rxcdrreset_in
 ,input  wire [0:0] rxpolarity_in
 ,input  wire [0:0] rxprbscntreset_in
 ,input  wire [3:0] rxprbssel_in
 ,input  wire [0:0] rxslide_in
 ,input  wire [0:0] txpippmen_in
 ,input  wire [0:0] txpippmovrden_in
 ,input  wire [0:0] txpippmpd_in
 ,input  wire [0:0] txpippmsel_in
 ,input  wire [4:0] txpippmstepsize_in
 ,input  wire [0:0] txpolarity_in
 ,input  wire [0:0] txprbsforceerr_in
 ,input  wire [3:0] txprbssel_in
 ,output wire [15:0] drpdo_out
 ,output wire [0:0] drprdy_out
 ,output wire [0:0] rxcdrlock_out
 ,output wire [0:0] rxoutclk_out
 ,output wire [0:0] rxoutclkpcs_out
 ,output wire [0:0] rxpmaresetdone_out
 ,output wire [0:0] rxprbserr_out
 ,output wire [0:0] rxprbslocked_out
 ,output wire [0:0] rxrecclkout_out
 ,output wire [1:0] txbufstatus_out
 ,output wire [0:0] txoutclk_out
 ,output wire [0:0] txoutclkfabric_out
 ,output wire [0:0] txoutclkpcs_out
 ,output wire [0:0] txpmaresetdone_out
);


  // ===================================================================================================================
  // PARAMETERS AND FUNCTIONS
  // ===================================================================================================================

  // Declare and initialize local parameters and functions used for HDL generation
  localparam [191:0] P_CHANNEL_ENABLE = 192'b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000100000000000;
  `include "gtwizard_ultrascale_0_example_wrapper_functions.vh"
  localparam integer P_TX_MASTER_CH_PACKED_IDX = f_calc_pk_mc_idx(11);
  localparam integer P_RX_MASTER_CH_PACKED_IDX = f_calc_pk_mc_idx(11);


  // ===================================================================================================================
  // HELPER BLOCKS
  // ===================================================================================================================

  // Any helper blocks which the user chose to exclude from the core will appear below. In addition, some signal
  // assignments related to optionally-enabled ports may appear below.

  wire [0:0] txoutclk_int;

  // Required assignment to expose the TXOUTCLK port per user request
  assign txoutclk_out = txoutclk_int;

  wire [0:0] rxoutclk_int;

  // Required assignment to expose the RXOUTCLK port per user request
  assign rxoutclk_out = rxoutclk_int;
  wire [0:0] rxcdrlock_int;

  // Required assignment to expose the RXCDRLOCK port per user request
  assign rxcdrlock_out = rxcdrlock_int;


  // ===================================================================================================================
  // CORE INSTANCE
  // ===================================================================================================================

  // Instantiate the core, mapping its enabled ports to example design ports and helper blocks as appropriate
  gtwizard_ultrascale_0 gtwizard_ultrascale_0_inst (
    .gthrxn_in                               (gthrxn_in)
   ,.gthrxp_in                               (gthrxp_in)
   ,.gthtxn_out                              (gthtxn_out)
   ,.gthtxp_out                              (gthtxp_out)
   ,.gtwiz_userclk_tx_reset_in               (gtwiz_userclk_tx_reset_in)
   ,.gtwiz_userclk_tx_srcclk_out             (gtwiz_userclk_tx_srcclk_out)
   ,.gtwiz_userclk_tx_usrclk_out             (gtwiz_userclk_tx_usrclk_out)
   ,.gtwiz_userclk_tx_usrclk2_out            (gtwiz_userclk_tx_usrclk2_out)
   ,.gtwiz_userclk_tx_active_out             (gtwiz_userclk_tx_active_out)
   ,.gtwiz_userclk_rx_reset_in               (gtwiz_userclk_rx_reset_in)
   ,.gtwiz_userclk_rx_srcclk_out             (gtwiz_userclk_rx_srcclk_out)
   ,.gtwiz_userclk_rx_usrclk_out             (gtwiz_userclk_rx_usrclk_out)
   ,.gtwiz_userclk_rx_usrclk2_out            (gtwiz_userclk_rx_usrclk2_out)
   ,.gtwiz_userclk_rx_active_out             (gtwiz_userclk_rx_active_out)
   ,.gtwiz_buffbypass_rx_reset_in            (gtwiz_buffbypass_rx_reset_in)
   ,.gtwiz_buffbypass_rx_start_user_in       (gtwiz_buffbypass_rx_start_user_in)
   ,.gtwiz_buffbypass_rx_done_out            (gtwiz_buffbypass_rx_done_out)
   ,.gtwiz_buffbypass_rx_error_out           (gtwiz_buffbypass_rx_error_out)
   ,.gtwiz_reset_clk_freerun_in              (gtwiz_reset_clk_freerun_in)
   ,.gtwiz_reset_all_in                      (gtwiz_reset_all_in)
   ,.gtwiz_reset_tx_pll_and_datapath_in      (gtwiz_reset_tx_pll_and_datapath_in)
   ,.gtwiz_reset_tx_datapath_in              (gtwiz_reset_tx_datapath_in)
   ,.gtwiz_reset_rx_pll_and_datapath_in      (gtwiz_reset_rx_pll_and_datapath_in)
   ,.gtwiz_reset_rx_datapath_in              (gtwiz_reset_rx_datapath_in)
   ,.gtwiz_reset_rx_cdr_stable_out           (gtwiz_reset_rx_cdr_stable_out)
   ,.gtwiz_reset_tx_done_out                 (gtwiz_reset_tx_done_out)
   ,.gtwiz_reset_rx_done_out                 (gtwiz_reset_rx_done_out)
   ,.gtwiz_userdata_tx_in                    (gtwiz_userdata_tx_in)
   ,.gtwiz_userdata_rx_out                   (gtwiz_userdata_rx_out)
   ,.gtrefclk00_in                           (gtrefclk00_in)
   ,.gtrefclk01_in                           (gtrefclk01_in)
   ,.qpll0outclk_out                         (qpll0outclk_out)
   ,.qpll0outrefclk_out                      (qpll0outrefclk_out)
   ,.qpll1outclk_out                         (qpll1outclk_out)
   ,.qpll1outrefclk_out                      (qpll1outrefclk_out)
   ,.drpaddr_in                              (drpaddr_in)
   ,.drpclk_in                               (drpclk_in)
   ,.drpdi_in                                (drpdi_in)
   ,.drpen_in                                (drpen_in)
   ,.drpwe_in                                (drpwe_in)
   ,.loopback_in                             (loopback_in)
   ,.rxcdrreset_in                           (rxcdrreset_in)
   ,.rxpolarity_in                           (rxpolarity_in)
   ,.rxprbscntreset_in                       (rxprbscntreset_in)
   ,.rxprbssel_in                            (rxprbssel_in)
   ,.rxslide_in                              (rxslide_in)
   ,.txpippmen_in                            (txpippmen_in)
   ,.txpippmovrden_in                        (txpippmovrden_in)
   ,.txpippmpd_in                            (txpippmpd_in)
   ,.txpippmsel_in                           (txpippmsel_in)
   ,.txpippmstepsize_in                      (txpippmstepsize_in)
   ,.txpolarity_in                           (txpolarity_in)
   ,.txprbsforceerr_in                       (txprbsforceerr_in)
   ,.txprbssel_in                            (txprbssel_in)
   ,.drpdo_out                               (drpdo_out)
   ,.drprdy_out                              (drprdy_out)
   ,.rxcdrlock_out                           (rxcdrlock_int)
   ,.rxoutclk_out                            (rxoutclk_int)
   ,.rxoutclkpcs_out                         (rxoutclkpcs_out)
   ,.rxpmaresetdone_out                      (rxpmaresetdone_out)
   ,.rxprbserr_out                           (rxprbserr_out)
   ,.rxprbslocked_out                        (rxprbslocked_out)
   ,.rxrecclkout_out                         (rxrecclkout_out)
   ,.txbufstatus_out                         (txbufstatus_out)
   ,.txoutclk_out                            (txoutclk_int)
   ,.txoutclkfabric_out                      (txoutclkfabric_out)
   ,.txoutclkpcs_out                         (txoutclkpcs_out)
   ,.txpmaresetdone_out                      (txpmaresetdone_out)
);

endmodule

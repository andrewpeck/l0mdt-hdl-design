//------------------------------------------------------------------------------
//  (c) Copyright 2013-2018 Xilinx, Inc. All rights reserved.
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

module gty_fixed_latency_example_wrapper (
  input  wire [3:0] gtyrxn_in
 ,input  wire [3:0] gtyrxp_in
 ,output wire [3:0] gtytxn_out
 ,output wire [3:0] gtytxp_out
 ,input  wire [0:0] gtwiz_userclk_tx_reset_in
 ,output wire [0:0] gtwiz_userclk_tx_srcclk_out
 ,output wire [0:0] gtwiz_userclk_tx_usrclk_out
 ,output wire [0:0] gtwiz_userclk_tx_usrclk2_out
 ,output wire [0:0] gtwiz_userclk_tx_active_out
 ,input  wire [3:0] gtwiz_userclk_rx_reset_in
 ,output wire [3:0] gtwiz_userclk_rx_srcclk_out
 ,output wire [3:0] gtwiz_userclk_rx_usrclk_out
 ,output wire [3:0] gtwiz_userclk_rx_usrclk2_out
 ,output wire [3:0] gtwiz_userclk_rx_active_out
 ,input  wire [0:0] gtwiz_buffbypass_tx_reset_in
 ,input  wire [0:0] gtwiz_buffbypass_tx_start_user_in
 ,output wire [0:0] gtwiz_buffbypass_tx_done_out
 ,output wire [0:0] gtwiz_buffbypass_tx_error_out
 ,input  wire [3:0] gtwiz_buffbypass_rx_reset_in
 ,input  wire [3:0] gtwiz_buffbypass_rx_start_user_in
 ,output wire [3:0] gtwiz_buffbypass_rx_done_out
 ,output wire [3:0] gtwiz_buffbypass_rx_error_out
 ,input  wire [0:0] gtwiz_reset_clk_freerun_in
 ,input  wire [0:0] gtwiz_reset_all_in
 ,input  wire [0:0] gtwiz_reset_tx_pll_and_datapath_in
 ,input  wire [0:0] gtwiz_reset_tx_datapath_in
 ,input  wire [0:0] gtwiz_reset_rx_pll_and_datapath_in
 ,input  wire [0:0] gtwiz_reset_rx_datapath_in
 ,output wire [0:0] gtwiz_reset_rx_cdr_stable_out
 ,output wire [0:0] gtwiz_reset_tx_done_out
 ,output wire [0:0] gtwiz_reset_rx_done_out
 ,input  wire [127:0] gtwiz_userdata_tx_in
 ,output wire [127:0] gtwiz_userdata_rx_out
 ,input  wire [0:0] gtrefclk01_in
 ,output wire [0:0] qpll0outclk_out
 ,output wire [0:0] qpll0outrefclk_out
 ,output wire [0:0] qpll1outclk_out
 ,output wire [0:0] qpll1outrefclk_out
 ,input  wire [3:0] rx8b10ben_in
 ,input  wire [3:0] rxcommadeten_in
 ,input  wire [3:0] rxmcommaalignen_in
 ,input  wire [3:0] rxpcommaalignen_in
 ,input  wire [3:0] rxslide_in
 ,input  wire [3:0] tx8b10ben_in
 ,input  wire [63:0] txctrl0_in
 ,input  wire [63:0] txctrl1_in
 ,input  wire [31:0] txctrl2_in
 ,output wire [3:0] gtpowergood_out
 ,output wire [3:0] rxbyteisaligned_out
 ,output wire [3:0] rxbyterealign_out
 ,output wire [3:0] rxcommadet_out
 ,output wire [63:0] rxctrl0_out
 ,output wire [63:0] rxctrl1_out
 ,output wire [31:0] rxctrl2_out
 ,output wire [31:0] rxctrl3_out
 ,output wire [3:0] rxpmaresetdone_out
 ,output wire [3:0] txpmaresetdone_out
 ,output wire [3:0] txprgdivresetdone_out
);


  // ===================================================================================================================
  // PARAMETERS AND FUNCTIONS
  // ===================================================================================================================

  // Declare and initialize local parameters and functions used for HDL generation
  localparam [191:0] P_CHANNEL_ENABLE = 192'b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000111100000000;
  `include "gty_fixed_latency_example_wrapper_functions.v"
  localparam integer P_TX_MASTER_CH_PACKED_IDX = f_calc_pk_mc_idx(11);
  localparam integer P_RX_MASTER_CH_PACKED_IDX = f_calc_pk_mc_idx(11);


  // ===================================================================================================================
  // HELPER BLOCKS
  // ===================================================================================================================

  // Any helper blocks which the user chose to exclude from the core will appear below. In addition, some signal
  // assignments related to optionally-enabled ports may appear below.

  // -------------------------------------------------------------------------------------------------------------------
  // Transmitter user clocking network helper block
  // -------------------------------------------------------------------------------------------------------------------

  wire [3:0] txusrclk_int;
  wire [3:0] txusrclk2_int;
  wire [3:0] txoutclk_int;

  // Generate a single module instance which is driven by a clock source associated with the master transmitter channel,
  // and which drives TXUSRCLK and TXUSRCLK2 for all channels

  // The source clock is TXOUTCLK from the master transmitter channel
  assign gtwiz_userclk_tx_srcclk_out = txoutclk_int[P_TX_MASTER_CH_PACKED_IDX];

  // Instantiate a single instance of the transmitter user clocking network helper block
  gty_fixed_latency_example_gtwiz_userclk_tx gtwiz_userclk_tx_inst (
    .gtwiz_userclk_tx_srcclk_in   (gtwiz_userclk_tx_srcclk_out),
    .gtwiz_userclk_tx_reset_in    (gtwiz_userclk_tx_reset_in),
    .gtwiz_userclk_tx_usrclk_out  (gtwiz_userclk_tx_usrclk_out),
    .gtwiz_userclk_tx_usrclk2_out (gtwiz_userclk_tx_usrclk2_out),
    .gtwiz_userclk_tx_active_out  (gtwiz_userclk_tx_active_out)
  );

  // Drive TXUSRCLK and TXUSRCLK2 for all channels with the respective helper block outputs
  assign txusrclk_int  = {4{gtwiz_userclk_tx_usrclk_out}};
  assign txusrclk2_int = {4{gtwiz_userclk_tx_usrclk2_out}};

  // -------------------------------------------------------------------------------------------------------------------
  // Receiver user clocking network helper block
  // -------------------------------------------------------------------------------------------------------------------

  wire [3:0] rxusrclk_int;
  wire [3:0] rxusrclk2_int;
  wire [3:0] rxoutclk_int;

  // For each channel, generate one module instance which is driven by a clock source associated with that channel, and
  // which drives RXUSRCLK and RXUSRCLK2 for that same channel

  // Instantiate one instance of the receiver user clocking network helper block for each channel
  genvar gi_hb_rxclk;
  generate for (gi_hb_rxclk = 0; gi_hb_rxclk < 4; gi_hb_rxclk = gi_hb_rxclk + 1) begin : gen_gtwiz_userclk_rx

  // The source clock for a given instance is RXOUTCLK from the associated channel
  assign gtwiz_userclk_rx_srcclk_out = rxoutclk_int;

    gty_fixed_latency_example_gtwiz_userclk_rx gtwiz_userclk_rx_inst (
      .gtwiz_userclk_rx_srcclk_in   (gtwiz_userclk_rx_srcclk_out  [gi_hb_rxclk]),
      .gtwiz_userclk_rx_reset_in    (gtwiz_userclk_rx_reset_in    [gi_hb_rxclk]),
      .gtwiz_userclk_rx_usrclk_out  (gtwiz_userclk_rx_usrclk_out  [gi_hb_rxclk]),
      .gtwiz_userclk_rx_usrclk2_out (gtwiz_userclk_rx_usrclk2_out [gi_hb_rxclk]),
      .gtwiz_userclk_rx_active_out  (gtwiz_userclk_rx_active_out  [gi_hb_rxclk])
    );
  end
  endgenerate

  // Drive RXUSRCLK and RXUSRCLK2 for each channel with the respective outputs of the associated helper block
  assign rxusrclk_int  = gtwiz_userclk_rx_usrclk_out;
  assign rxusrclk2_int = gtwiz_userclk_rx_usrclk2_out;

  // -------------------------------------------------------------------------------------------------------------------
  // Transmitter buffer bypass controller helper block
  // -------------------------------------------------------------------------------------------------------------------

  wire [3:0] txphaligndone_int;
  wire [3:0] txphinitdone_int;
  wire [3:0] txdlysresetdone_int;
  wire [3:0] txsyncout_int;
  wire [3:0] txsyncdone_int;
  wire [3:0] txphdlyreset_int;
  wire [3:0] txphalign_int;
  wire [3:0] txphalignen_int;
  wire [3:0] txphdlypd_int;
  wire [3:0] txphinit_int;
  wire [3:0] txphovrden_int;
  wire [3:0] txdlysreset_int;
  wire [3:0] txdlybypass_int;
  wire [3:0] txdlyen_int;
  wire [3:0] txdlyovrden_int;
  wire [3:0] txphdlytstclk_int;
  wire [3:0] txdlyhold_int;
  wire [3:0] txdlyupdown_int;
  wire [3:0] txsyncmode_int;
  wire [3:0] txsyncallin_int;
  wire [3:0] txsyncin_int;

  // Generate a single module instance which uses the designated transmitter master channel as the transmit buffer
  // bypass master channel, and all other channels as transmit buffer bypass slave channels

  // Depending on the number of reset controller helper blocks, either use the single reset done indicator or the
  // logical combination of per-channel reset done indicators as the reset done indicator for use in this block
  wire gtwiz_buffbypass_tx_resetdone_int;

  assign gtwiz_buffbypass_tx_resetdone_int = gtwiz_reset_tx_done_out;

  (* DONT_TOUCH = "TRUE" *)
  gty_fixed_latency_example_gtwiz_buffbypass_tx #(
    .P_TOTAL_NUMBER_OF_CHANNELS (4),
    .P_MASTER_CHANNEL_POINTER   (P_TX_MASTER_CH_PACKED_IDX)
  ) gtwiz_buffbypass_tx_inst (
    .gtwiz_buffbypass_tx_clk_in        (gtwiz_userclk_tx_usrclk2_out),
    .gtwiz_buffbypass_tx_reset_in      (gtwiz_buffbypass_tx_reset_in),
    .gtwiz_buffbypass_tx_start_user_in (gtwiz_buffbypass_tx_start_user_in),
    .gtwiz_buffbypass_tx_resetdone_in  (gtwiz_buffbypass_tx_resetdone_int),
    .gtwiz_buffbypass_tx_done_out      (gtwiz_buffbypass_tx_done_out),
    .gtwiz_buffbypass_tx_error_out     (gtwiz_buffbypass_tx_error_out),
    .txphaligndone_in                  (txphaligndone_int),
    .txphinitdone_in                   (txphinitdone_int),
    .txdlysresetdone_in                (txdlysresetdone_int),
    .txsyncout_in                      (txsyncout_int),
    .txsyncdone_in                     (txsyncdone_int),
    .txphdlyreset_out                  (txphdlyreset_int),
    .txphalign_out                     (txphalign_int),
    .txphalignen_out                   (txphalignen_int),
    .txphdlypd_out                     (txphdlypd_int),
    .txphinit_out                      (txphinit_int),
    .txphovrden_out                    (txphovrden_int),
    .txdlysreset_out                   (txdlysreset_int),
    .txdlybypass_out                   (txdlybypass_int),
    .txdlyen_out                       (txdlyen_int),
    .txdlyovrden_out                   (txdlyovrden_int),
    .txphdlytstclk_out                 (txphdlytstclk_int),
    .txdlyhold_out                     (txdlyhold_int),
    .txdlyupdown_out                   (txdlyupdown_int),
    .txsyncmode_out                    (txsyncmode_int),
    .txsyncallin_out                   (txsyncallin_int),
    .txsyncin_out                      (txsyncin_int)
  );

  // -------------------------------------------------------------------------------------------------------------------
  // Receiver buffer bypass controller helper block
  // -------------------------------------------------------------------------------------------------------------------

  wire [3:0] rxphaligndone_int;
  wire [3:0] rxdlysresetdone_int;
  wire [3:0] rxsyncout_int;
  wire [3:0] rxsyncdone_int;
  wire [3:0] rxphdlyreset_int;
  wire [3:0] rxphalign_int;
  wire [3:0] rxphalignen_int;
  wire [3:0] rxphdlypd_int;
  wire [3:0] rxphovrden_int;
  wire [3:0] rxdlysreset_int;
  wire [3:0] rxdlybypass_int;
  wire [3:0] rxdlyen_int;
  wire [3:0] rxdlyovrden_int;
  wire [3:0] rxsyncmode_int;
  wire [3:0] rxsyncallin_int;
  wire [3:0] rxsyncin_int;

  // Generate one module instance per channel to implement single-lane receive buffer bypass for each lane
  // independently, treating each lane as a master

  // Depending on the number of reset controller helper blocks, either use the single reset done indicator or the
  // logical combination of per-channel reset done indicators as the reset done indicator for use in this block
  wire [3:0] gtwiz_buffbypass_rx_resetdone_int;

  assign gtwiz_buffbypass_rx_resetdone_int = {4{gtwiz_reset_rx_done_out}};

  genvar gi_hb_rxbb;
  generate for (gi_hb_rxbb = 0; gi_hb_rxbb < 4; gi_hb_rxbb = gi_hb_rxbb + 1) begin : gen_gtwiz_buffbypass_rx
    (* DONT_TOUCH = "TRUE" *)
    gty_fixed_latency_example_gtwiz_buffbypass_rx #(
      .P_TOTAL_NUMBER_OF_CHANNELS (1),
      .P_MASTER_CHANNEL_POINTER   (0)
    ) gtwiz_buffbypass_rx_inst (
      .gtwiz_buffbypass_rx_clk_in        (gtwiz_userclk_rx_usrclk2_out      [gi_hb_rxbb]),
      .gtwiz_buffbypass_rx_reset_in      (gtwiz_buffbypass_rx_reset_in      [gi_hb_rxbb]),
      .gtwiz_buffbypass_rx_start_user_in (gtwiz_buffbypass_rx_start_user_in [gi_hb_rxbb]),
      .gtwiz_buffbypass_rx_resetdone_in  (gtwiz_buffbypass_rx_resetdone_int [gi_hb_rxbb]),
      .gtwiz_buffbypass_rx_done_out      (gtwiz_buffbypass_rx_done_out      [gi_hb_rxbb]),
      .gtwiz_buffbypass_rx_error_out     (gtwiz_buffbypass_rx_error_out     [gi_hb_rxbb]),
      .rxphaligndone_in                  (rxphaligndone_int                 [gi_hb_rxbb]),
      .rxdlysresetdone_in                (rxdlysresetdone_int               [gi_hb_rxbb]),
      .rxsyncout_in                      (rxsyncout_int                     [gi_hb_rxbb]),
      .rxsyncdone_in                     (rxsyncdone_int                    [gi_hb_rxbb]),
      .rxphdlyreset_out                  (rxphdlyreset_int                  [gi_hb_rxbb]),
      .rxphalign_out                     (rxphalign_int                     [gi_hb_rxbb]),
      .rxphalignen_out                   (rxphalignen_int                   [gi_hb_rxbb]),
      .rxphdlypd_out                     (rxphdlypd_int                     [gi_hb_rxbb]),
      .rxphovrden_out                    (rxphovrden_int                    [gi_hb_rxbb]),
      .rxdlysreset_out                   (rxdlysreset_int                   [gi_hb_rxbb]),
      .rxdlybypass_out                   (rxdlybypass_int                   [gi_hb_rxbb]),
      .rxdlyen_out                       (rxdlyen_int                       [gi_hb_rxbb]),
      .rxdlyovrden_out                   (rxdlyovrden_int                   [gi_hb_rxbb]),
      .rxsyncmode_out                    (rxsyncmode_int                    [gi_hb_rxbb]),
      .rxsyncallin_out                   (rxsyncallin_int                   [gi_hb_rxbb]),
      .rxsyncin_out                      (rxsyncin_int                      [gi_hb_rxbb])
    );
  end
  endgenerate

  // -------------------------------------------------------------------------------------------------------------------
  // Reset controller helper block
  // -------------------------------------------------------------------------------------------------------------------

  // Generate a single module instance which controls all PLLs and all channels within the core

  // Depending on the number of user clocking network helper blocks, either use the single user clock active indicator
  // or a logical combination of per-channel user clock active indicators as the user clock active indicator for use in
  // this block
  wire gtwiz_reset_userclk_tx_active_int;
  wire gtwiz_reset_userclk_rx_active_int;

  assign gtwiz_reset_userclk_tx_active_int = gtwiz_userclk_tx_active_out;

  // When each channel has an independent receiver user clock, synchronize each receiver user clock active
  // indicator independently before combining them
  wire [3:0] gtwiz_userclk_rx_active_sync;

  genvar gi_ch_rxclk1;
  generate for (gi_ch_rxclk1 = 0; gi_ch_rxclk1 < 4; gi_ch_rxclk1 = gi_ch_rxclk1 + 1) begin : gen_ch_rxclk1
    (* DONT_TOUCH = "TRUE" *)
    gty_fixed_latency_example_bit_synchronizer bit_synchronizer_gtwiz_reset_userclk_rx_active_inst (
      .clk_in (gtwiz_reset_clk_freerun_in),
      .i_in   (gtwiz_userclk_rx_active_out[gi_ch_rxclk1]),
      .o_out  (gtwiz_userclk_rx_active_sync[gi_ch_rxclk1])
    );
  end
  endgenerate
  assign gtwiz_reset_userclk_rx_active_int = &gtwiz_userclk_rx_active_sync;

  // Combine the appropriate PLL lock signals such that the reset controller can sense when all PLLs which clock each
  // data direction are locked, regardless of what PLL source is used
  wire gtwiz_reset_plllock_tx_int;
  wire gtwiz_reset_plllock_rx_int;

  wire [0:0] qpll1lock_int;

  assign gtwiz_reset_plllock_tx_int = &qpll1lock_int;
  assign gtwiz_reset_plllock_rx_int = &qpll1lock_int;

  // Combine the power good, reset done, and CDR lock indicators across all channels, per data direction
  wire [3:0] gtpowergood_int;
  wire [3:0] rxcdrlock_int;
  wire [3:0] txresetdone_int;
  wire [3:0] rxresetdone_int;
  wire gtwiz_reset_gtpowergood_int;
  wire gtwiz_reset_rxcdrlock_int;
  wire gtwiz_reset_txresetdone_int;
  wire gtwiz_reset_rxresetdone_int;

  assign gtwiz_reset_gtpowergood_int = &gtpowergood_int;
  assign gtwiz_reset_rxcdrlock_int   = &rxcdrlock_int;

  wire [3:0] txresetdone_sync;
  wire [3:0] rxresetdone_sync;
  genvar gi_ch_xrd;
  generate for (gi_ch_xrd = 0; gi_ch_xrd < 4; gi_ch_xrd = gi_ch_xrd + 1) begin : gen_ch_xrd
    (* DONT_TOUCH = "TRUE" *)
    gty_fixed_latency_example_bit_synchronizer bit_synchronizer_txresetdone_inst (
      .clk_in (gtwiz_reset_clk_freerun_in),
      .i_in   (txresetdone_int[gi_ch_xrd]),
      .o_out  (txresetdone_sync[gi_ch_xrd])
    );
    (* DONT_TOUCH = "TRUE" *)
    gty_fixed_latency_example_bit_synchronizer bit_synchronizer_rxresetdone_inst (
      .clk_in (gtwiz_reset_clk_freerun_in),
      .i_in   (rxresetdone_int[gi_ch_xrd]),
      .o_out  (rxresetdone_sync[gi_ch_xrd])
    );
  end
  endgenerate
  assign gtwiz_reset_txresetdone_int = &txresetdone_sync;
  assign gtwiz_reset_rxresetdone_int = &rxresetdone_sync;

  wire gtwiz_reset_pllreset_tx_int;
  wire gtwiz_reset_txprogdivreset_int;
  wire gtwiz_reset_gttxreset_int;
  wire gtwiz_reset_txuserrdy_int;
  wire gtwiz_reset_pllreset_rx_int;
  wire gtwiz_reset_rxprogdivreset_int;
  wire gtwiz_reset_gtrxreset_int;
  wire gtwiz_reset_rxuserrdy_int;

  // Instantiate the single reset controller
  (* DONT_TOUCH = "TRUE" *)
  gty_fixed_latency_example_gtwiz_reset gtwiz_reset_inst (
    .gtwiz_reset_clk_freerun_in         (gtwiz_reset_clk_freerun_in),
    .gtwiz_reset_all_in                 (gtwiz_reset_all_in),
    .gtwiz_reset_tx_pll_and_datapath_in (gtwiz_reset_tx_pll_and_datapath_in),
    .gtwiz_reset_tx_datapath_in         (gtwiz_reset_tx_datapath_in),
    .gtwiz_reset_rx_pll_and_datapath_in (gtwiz_reset_rx_pll_and_datapath_in),
    .gtwiz_reset_rx_datapath_in         (gtwiz_reset_rx_datapath_in),
    .gtwiz_reset_rx_cdr_stable_out      (gtwiz_reset_rx_cdr_stable_out),
    .gtwiz_reset_tx_done_out            (gtwiz_reset_tx_done_out),
    .gtwiz_reset_rx_done_out            (gtwiz_reset_rx_done_out),
    .gtwiz_reset_userclk_tx_active_in   (gtwiz_reset_userclk_tx_active_int),
    .gtwiz_reset_userclk_rx_active_in   (gtwiz_reset_userclk_rx_active_int),
    .gtpowergood_in                     (gtwiz_reset_gtpowergood_int),
    .txusrclk2_in                       (gtwiz_userclk_tx_usrclk2_out),
    .plllock_tx_in                      (gtwiz_reset_plllock_tx_int),
    .txresetdone_in                     (gtwiz_reset_txresetdone_int),
    .rxusrclk2_in                       (gtwiz_userclk_rx_usrclk2_out[P_RX_MASTER_CH_PACKED_IDX]),
    .plllock_rx_in                      (gtwiz_reset_plllock_rx_int),
    .rxcdrlock_in                       (gtwiz_reset_rxcdrlock_int),
    .rxresetdone_in                     (gtwiz_reset_rxresetdone_int),
    .pllreset_tx_out                    (gtwiz_reset_pllreset_tx_int),
    .txprogdivreset_out                 (gtwiz_reset_txprogdivreset_int),
    .gttxreset_out                      (gtwiz_reset_gttxreset_int),
    .txuserrdy_out                      (gtwiz_reset_txuserrdy_int),
    .pllreset_rx_out                    (gtwiz_reset_pllreset_rx_int),
    .rxprogdivreset_out                 (gtwiz_reset_rxprogdivreset_int),
    .gtrxreset_out                      (gtwiz_reset_gtrxreset_int),
    .rxuserrdy_out                      (gtwiz_reset_rxuserrdy_int),
    .tx_enabled_tie_in                  (1'b1),
    .rx_enabled_tie_in                  (1'b1),
    .shared_pll_tie_in                  (1'b1)
  );

  // Drive the internal PLL reset inputs with the appropriate PLL reset signals produced by the reset controller. The
  // single reset controller instance generates independent transmit PLL reset and receive PLL reset outputs, which are
  // used across all such PLLs in the core.
  wire [0:0] qpll1reset_int;

  assign qpll1reset_int = {1{gtwiz_reset_pllreset_tx_int || gtwiz_reset_pllreset_rx_int}};

  // Fan out appropriate reset controller outputs to all transceiver channels
  wire [3:0] txprogdivreset_int;
  wire [3:0] gttxreset_int;
  wire [3:0] txuserrdy_int;
  wire [3:0] rxprogdivreset_int;
  wire [3:0] gtrxreset_int;
  wire [3:0] rxuserrdy_int;

  assign txprogdivreset_int  = {4{gtwiz_reset_txprogdivreset_int}};
  assign gttxreset_int       = {4{gtwiz_reset_gttxreset_int}};
  assign txuserrdy_int       = {4{gtwiz_reset_txuserrdy_int}};
  assign rxprogdivreset_int  = {4{gtwiz_reset_rxprogdivreset_int}};
  assign gtrxreset_int       = {4{gtwiz_reset_gtrxreset_int}};
  assign rxuserrdy_int       = {4{gtwiz_reset_rxuserrdy_int}};

  // Required assignment to expose the GTPOWERGOOD port per user request
  assign gtpowergood_out = gtpowergood_int;

  // ----------------------------------------------------------------------------------------------------------------
  // Transmitter user data width sizing helper block
  // ----------------------------------------------------------------------------------------------------------------

  // Declare vectors for the helper block to drive transceiver-facing TXDATA port; and in configurations where
  // transmitter data encoding is raw and user data width is modulus 10, also for TXCTRL0 and TXCTRL1 ports
  wire [511:0] txdata_int;

  gty_fixed_latency_example_gtwiz_userdata_tx gtwiz_userdata_tx_inst (
    .gtwiz_userdata_tx_in (gtwiz_userdata_tx_in),
    .txdata_out           (txdata_int),
    .txctrl0_out          (), // TXCTRL0 is not driven by this module in this configuration
    .txctrl1_out          ()  // TXCTRL1 is not driven by this module in this configuration
  );

  // ----------------------------------------------------------------------------------------------------------------
  // Receiver user data width sizing helper block
  // ----------------------------------------------------------------------------------------------------------------

  // Declare vectors for the helper block to be driven by transceiver-facing RXDATA port; and in configurations where
  // receiver data decoding is raw and user data width is modulus 10, also for RXCTRL0 and RXCTRL1 ports
  wire [511:0] rxdata_int;

  gty_fixed_latency_example_gtwiz_userdata_rx gtwiz_userdata_rx_inst (
    .rxdata_in             (rxdata_int),
    .rxctrl0_in            (64'b0), // RXCTRL0 is not used by this module in this configuration
    .rxctrl1_in            (64'b0), // RXCTRL1 is not used by this module in this configuration
    .gtwiz_userdata_rx_out (gtwiz_userdata_rx_out)
  );

  // ----------------------------------------------------------------------------------------------------------------
  // Assignments to expose data ports, or data control ports, per configuration requirement or user request
  // ----------------------------------------------------------------------------------------------------------------

  wire [63:0] txctrl0_int;

  // Required assignment to expose the TXCTRL0 port per configuration requirement or user request
  assign txctrl0_int = txctrl0_in;
  wire [63:0] txctrl1_int;

  // Required assignment to expose the TXCTRL1 port per configuration requirement or user request
  assign txctrl1_int = txctrl1_in;
  wire [63:0] rxctrl0_int;

  // Required assignment to expose the RXCTRL0 port per configuration requirement or user request
  assign rxctrl0_out = rxctrl0_int;
  wire [63:0] rxctrl1_int;

  // Required assignment to expose the RXCTRL1 port per configuration requirement or user request
  assign rxctrl1_out = rxctrl1_int;

  // ===================================================================================================================
  // TRANSCEIVER COMMON BLOCK
  // ===================================================================================================================

  wire [0:0] gtrefclk00_int;
  wire [3:0] qpll0clk_int;
  wire [3:0] qpll0refclk_int;
  wire [0:0] qpll0reset_int;
  wire [0:0] qpll0lock_int;

  // When QPLL0 is not used, the following assignments tie off QPLL0-related inputs as appropriate
  assign gtrefclk00_int  = {1{1'b0}};
  assign qpll0clk_int    = {4{1'b0}};
  assign qpll0refclk_int = {4{1'b0}};
  assign qpll0reset_int  = {1{1'b1}};

  wire [0:0] gtrefclk01_int;
  wire [3:0] qpll1clk_int;
  wire [3:0] qpll1refclk_int;

  // When QPLL1 is used, the following assignments support the use of the transceiver COMMON block in the example design
  assign gtrefclk01_int = gtrefclk01_in;
  genvar gi_ch_to_cm1;
  generate for (gi_ch_to_cm1 = 0; gi_ch_to_cm1 < 4; gi_ch_to_cm1 = gi_ch_to_cm1 + 1) begin : gen_ch_to_cm1
    assign qpll1clk_int    [gi_ch_to_cm1] = qpll1outclk_out    [f_idx_cm(gi_ch_to_cm1)];
    assign qpll1refclk_int [gi_ch_to_cm1] = qpll1outrefclk_out [f_idx_cm(gi_ch_to_cm1)];
  end
  endgenerate

  localparam [47:0] P_COMMON_ENABLE = f_pop_cm_en(0);

  // The following HDL generate loop iterates across each possible transceiver quad, instantiating only the enabled
  // transceiver COMMON blocks, each within a configuration-specific parameterization wrapper
  genvar cm;
  generate for (cm = 0; cm < 48; cm = cm + 1) begin : gen_common_container
    if (P_COMMON_ENABLE[cm] == 1'b1) begin : gen_enabled_common

      gty_fixed_latency_gtye4_common_wrapper gtye4_common_wrapper_inst (
        .GTYE4_COMMON_BGBYPASSB         (1'b1),
        .GTYE4_COMMON_BGMONITORENB      (1'b1),
        .GTYE4_COMMON_BGPDB             (1'b1),
        .GTYE4_COMMON_BGRCALOVRD        (5'b10000),
        .GTYE4_COMMON_BGRCALOVRDENB     (1'b1),
        .GTYE4_COMMON_DRPADDR           (16'b0000000000000000),
        .GTYE4_COMMON_DRPCLK            (1'b0),
        .GTYE4_COMMON_DRPDI             (16'b0000000000000000),
        .GTYE4_COMMON_DRPEN             (1'b0),
        .GTYE4_COMMON_DRPWE             (1'b0),
        .GTYE4_COMMON_GTGREFCLK0        (1'b0),
        .GTYE4_COMMON_GTGREFCLK1        (1'b0),
        .GTYE4_COMMON_GTNORTHREFCLK00   (1'b0),
        .GTYE4_COMMON_GTNORTHREFCLK01   (1'b0),
        .GTYE4_COMMON_GTNORTHREFCLK10   (1'b0),
        .GTYE4_COMMON_GTNORTHREFCLK11   (1'b0),
        .GTYE4_COMMON_GTREFCLK00        (gtrefclk00_int [f_ub_cm( 1,(4*cm)+3) : f_lb_cm( 1,4*cm)]),
        .GTYE4_COMMON_GTREFCLK01        (gtrefclk01_int [f_ub_cm( 1,(4*cm)+3) : f_lb_cm( 1,4*cm)]),
        .GTYE4_COMMON_GTREFCLK10        (1'b0),
        .GTYE4_COMMON_GTREFCLK11        (1'b0),
        .GTYE4_COMMON_GTSOUTHREFCLK00   (1'b0),
        .GTYE4_COMMON_GTSOUTHREFCLK01   (1'b0),
        .GTYE4_COMMON_GTSOUTHREFCLK10   (1'b0),
        .GTYE4_COMMON_GTSOUTHREFCLK11   (1'b0),
        .GTYE4_COMMON_PCIERATEQPLL0     (3'b000),
        .GTYE4_COMMON_PCIERATEQPLL1     (3'b000),
        .GTYE4_COMMON_PMARSVD0          (8'b00000000),
        .GTYE4_COMMON_PMARSVD1          (8'b00000000),
        .GTYE4_COMMON_QPLL0CLKRSVD0     (1'b0),
        .GTYE4_COMMON_QPLL0CLKRSVD1     (1'b0),
        .GTYE4_COMMON_QPLL0FBDIV        (8'b00000000),
        .GTYE4_COMMON_QPLL0LOCKDETCLK   (1'b0),
        .GTYE4_COMMON_QPLL0LOCKEN       (1'b0),
        .GTYE4_COMMON_QPLL0PD           (1'b1),
        .GTYE4_COMMON_QPLL0REFCLKSEL    (3'b001),
        .GTYE4_COMMON_QPLL0RESET        (qpll0reset_int [f_ub_cm( 1,(4*cm)+3) : f_lb_cm( 1,4*cm)]),
        .GTYE4_COMMON_QPLL1CLKRSVD0     (1'b0),
        .GTYE4_COMMON_QPLL1CLKRSVD1     (1'b0),
        .GTYE4_COMMON_QPLL1FBDIV        (8'b00000000),
        .GTYE4_COMMON_QPLL1LOCKDETCLK   (1'b0),
        .GTYE4_COMMON_QPLL1LOCKEN       (1'b1),
        .GTYE4_COMMON_QPLL1PD           (1'b0),
        .GTYE4_COMMON_QPLL1REFCLKSEL    (3'b001),
        .GTYE4_COMMON_QPLL1RESET        (qpll1reset_int [f_ub_cm( 1,(4*cm)+3) : f_lb_cm( 1,4*cm)]),
        .GTYE4_COMMON_QPLLRSVD1         (8'b00000000),
        .GTYE4_COMMON_QPLLRSVD2         (5'b00000),
        .GTYE4_COMMON_QPLLRSVD3         (5'b00000),
        .GTYE4_COMMON_QPLLRSVD4         (8'b00000000),
        .GTYE4_COMMON_RCALENB           (1'b1),
        .GTYE4_COMMON_SDM0DATA          (25'b0000000000000000000000000),
        .GTYE4_COMMON_SDM0RESET         (1'b0),
        .GTYE4_COMMON_SDM0TOGGLE        (1'b0),
        .GTYE4_COMMON_SDM0WIDTH         (2'b00),
        .GTYE4_COMMON_SDM1DATA          (25'b0000000000000000000000000),
        .GTYE4_COMMON_SDM1RESET         (1'b0),
        .GTYE4_COMMON_SDM1TOGGLE        (1'b0),
        .GTYE4_COMMON_SDM1WIDTH         (2'b00),
        .GTYE4_COMMON_UBCFGSTREAMEN     (1'b0),
        .GTYE4_COMMON_UBDO              (16'b0000000000000000),
        .GTYE4_COMMON_UBDRDY            (1'b0),
        .GTYE4_COMMON_UBENABLE          (1'b0),
        .GTYE4_COMMON_UBGPI             (2'b00),
        .GTYE4_COMMON_UBINTR            (2'b00),
        .GTYE4_COMMON_UBIOLMBRST        (1'b0),
        .GTYE4_COMMON_UBMBRST           (1'b0),
        .GTYE4_COMMON_UBMDMCAPTURE      (1'b0),
        .GTYE4_COMMON_UBMDMDBGRST       (1'b0),
        .GTYE4_COMMON_UBMDMDBGUPDATE    (1'b0),
        .GTYE4_COMMON_UBMDMREGEN        (4'b0000),
        .GTYE4_COMMON_UBMDMSHIFT        (1'b0),
        .GTYE4_COMMON_UBMDMSYSRST       (1'b0),
        .GTYE4_COMMON_UBMDMTCK          (1'b0),
        .GTYE4_COMMON_UBMDMTDI          (1'b0),
        .GTYE4_COMMON_DRPDO             (),
        .GTYE4_COMMON_DRPRDY            (),
        .GTYE4_COMMON_PMARSVDOUT0       (),
        .GTYE4_COMMON_PMARSVDOUT1       (),
        .GTYE4_COMMON_QPLL0FBCLKLOST    (),
        .GTYE4_COMMON_QPLL0LOCK         (qpll0lock_int      [f_ub_cm( 1,(4*cm)+3) : f_lb_cm( 1,4*cm)]),
        .GTYE4_COMMON_QPLL0OUTCLK       (qpll0outclk_out    [f_ub_cm( 1,(4*cm)+3) : f_lb_cm( 1,4*cm)]),
        .GTYE4_COMMON_QPLL0OUTREFCLK    (qpll0outrefclk_out [f_ub_cm( 1,(4*cm)+3) : f_lb_cm( 1,4*cm)]),
        .GTYE4_COMMON_QPLL0REFCLKLOST   (),
        .GTYE4_COMMON_QPLL1FBCLKLOST    (),
        .GTYE4_COMMON_QPLL1LOCK         (qpll1lock_int      [f_ub_cm( 1,(4*cm)+3) : f_lb_cm( 1,4*cm)]),
        .GTYE4_COMMON_QPLL1OUTCLK       (qpll1outclk_out    [f_ub_cm( 1,(4*cm)+3) : f_lb_cm( 1,4*cm)]),
        .GTYE4_COMMON_QPLL1OUTREFCLK    (qpll1outrefclk_out [f_ub_cm( 1,(4*cm)+3) : f_lb_cm( 1,4*cm)]),
        .GTYE4_COMMON_QPLL1REFCLKLOST   (),
        .GTYE4_COMMON_QPLLDMONITOR0     (),
        .GTYE4_COMMON_QPLLDMONITOR1     (),
        .GTYE4_COMMON_REFCLKOUTMONITOR0 (),
        .GTYE4_COMMON_REFCLKOUTMONITOR1 (),
        .GTYE4_COMMON_RXRECCLK0SEL      (),
        .GTYE4_COMMON_RXRECCLK1SEL      (),
        .GTYE4_COMMON_SDM0FINALOUT      (),
        .GTYE4_COMMON_SDM0TESTDATA      (),
        .GTYE4_COMMON_SDM1FINALOUT      (),
        .GTYE4_COMMON_SDM1TESTDATA      (),
        .GTYE4_COMMON_UBDADDR           (),
        .GTYE4_COMMON_UBDEN             (),
        .GTYE4_COMMON_UBDI              (),
        .GTYE4_COMMON_UBDWE             (),
        .GTYE4_COMMON_UBMDMTDO          (),
        .GTYE4_COMMON_UBRSVDOUT         (),
        .GTYE4_COMMON_UBTXUART          ()
      );

    end
  end
  endgenerate


  // ===================================================================================================================
  // CORE INSTANCE
  // ===================================================================================================================

  // Instantiate the core, mapping its enabled ports to example design ports and helper blocks as appropriate
  gty_fixed_latency gty_fixed_latency_inst (
    .gtyrxn_in                               (gtyrxn_in)
   ,.gtyrxp_in                               (gtyrxp_in)
   ,.gtytxn_out                              (gtytxn_out)
   ,.gtytxp_out                              (gtytxp_out)
   ,.gtwiz_userclk_tx_active_in              (gtwiz_userclk_tx_active_out)
   ,.gtwiz_userclk_rx_active_in              (gtwiz_userclk_rx_active_out)
   ,.gtwiz_reset_tx_done_in                  (gtwiz_reset_tx_done_out)
   ,.gtwiz_reset_rx_done_in                  (gtwiz_reset_rx_done_out)
   ,.gtrxreset_in                            (gtrxreset_int)
   ,.gttxreset_in                            (gttxreset_int)
   ,.qpll0clk_in                             (qpll0clk_int)
   ,.qpll0refclk_in                          (qpll0refclk_int)
   ,.qpll1clk_in                             (qpll1clk_int)
   ,.qpll1refclk_in                          (qpll1refclk_int)
   ,.rx8b10ben_in                            (rx8b10ben_in)
   ,.rxcommadeten_in                         (rxcommadeten_in)
   ,.rxdlybypass_in                          (rxdlybypass_int)
   ,.rxdlyen_in                              (rxdlyen_int)
   ,.rxdlyovrden_in                          (rxdlyovrden_int)
   ,.rxdlysreset_in                          (rxdlysreset_int)
   ,.rxmcommaalignen_in                      (rxmcommaalignen_in)
   ,.rxpcommaalignen_in                      (rxpcommaalignen_in)
   ,.rxphalign_in                            (rxphalign_int)
   ,.rxphalignen_in                          (rxphalignen_int)
   ,.rxphdlypd_in                            (rxphdlypd_int)
   ,.rxphdlyreset_in                         (rxphdlyreset_int)
   ,.rxprogdivreset_in                       (rxprogdivreset_int)
   ,.rxslide_in                              (rxslide_in)
   ,.rxsyncallin_in                          (rxsyncallin_int)
   ,.rxsyncin_in                             (rxsyncin_int)
   ,.rxsyncmode_in                           (rxsyncmode_int)
   ,.rxuserrdy_in                            (rxuserrdy_int)
   ,.rxusrclk_in                             (rxusrclk_int)
   ,.rxusrclk2_in                            (rxusrclk2_int)
   ,.tx8b10ben_in                            (tx8b10ben_in)
   ,.txctrl0_in                              (txctrl0_int)
   ,.txctrl1_in                              (txctrl1_int)
   ,.txctrl2_in                              (txctrl2_in)
   ,.txdata_in                               (txdata_int)
   ,.txdlybypass_in                          (txdlybypass_int)
   ,.txdlyen_in                              (txdlyen_int)
   ,.txdlyhold_in                            (txdlyhold_int)
   ,.txdlyovrden_in                          (txdlyovrden_int)
   ,.txdlysreset_in                          (txdlysreset_int)
   ,.txdlyupdown_in                          (txdlyupdown_int)
   ,.txphalign_in                            (txphalign_int)
   ,.txphalignen_in                          (txphalignen_int)
   ,.txphdlypd_in                            (txphdlypd_int)
   ,.txphdlyreset_in                         (txphdlyreset_int)
   ,.txphdlytstclk_in                        (txphdlytstclk_int)
   ,.txphinit_in                             (txphinit_int)
   ,.txphovrden_in                           (txphovrden_int)
   ,.txprogdivreset_in                       (txprogdivreset_int)
   ,.txsyncallin_in                          (txsyncallin_int)
   ,.txsyncin_in                             (txsyncin_int)
   ,.txsyncmode_in                           (txsyncmode_int)
   ,.txuserrdy_in                            (txuserrdy_int)
   ,.txusrclk_in                             (txusrclk_int)
   ,.txusrclk2_in                            (txusrclk2_int)
   ,.gtpowergood_out                         (gtpowergood_int)
   ,.rxbyteisaligned_out                     (rxbyteisaligned_out)
   ,.rxbyterealign_out                       (rxbyterealign_out)
   ,.rxcdrlock_out                           (rxcdrlock_int)
   ,.rxcommadet_out                          (rxcommadet_out)
   ,.rxctrl0_out                             (rxctrl0_int)
   ,.rxctrl1_out                             (rxctrl1_int)
   ,.rxctrl2_out                             (rxctrl2_out)
   ,.rxctrl3_out                             (rxctrl3_out)
   ,.rxdata_out                              (rxdata_int)
   ,.rxdlysresetdone_out                     (rxdlysresetdone_int)
   ,.rxoutclk_out                            (rxoutclk_int)
   ,.rxphaligndone_out                       (rxphaligndone_int)
   ,.rxpmaresetdone_out                      (rxpmaresetdone_out)
   ,.rxresetdone_out                         (rxresetdone_int)
   ,.rxsyncdone_out                          (rxsyncdone_int)
   ,.rxsyncout_out                           (rxsyncout_int)
   ,.txdlysresetdone_out                     (txdlysresetdone_int)
   ,.txoutclk_out                            (txoutclk_int)
   ,.txphaligndone_out                       (txphaligndone_int)
   ,.txphinitdone_out                        (txphinitdone_int)
   ,.txpmaresetdone_out                      (txpmaresetdone_out)
   ,.txprgdivresetdone_out                   (txprgdivresetdone_out)
   ,.txresetdone_out                         (txresetdone_int)
   ,.txsyncdone_out                          (txsyncdone_int)
   ,.txsyncout_out                           (txsyncout_int)
);

endmodule

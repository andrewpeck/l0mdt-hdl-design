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
// This example design top module instantiates the example design wrapper; slices vectored ports for per-channel
// assignment; and instantiates example resources such as buffers, pattern generators, and pattern checkers for core
// demonstration purposes
// =====================================================================================================================

module gty_fixed_latency_example_top (

				      // Differential reference clock inputs
				      input wire 	 mgtrefclk0_x0y2_p,
				      input wire 	 mgtrefclk0_x0y2_n,

				      // Serial data ports for transceiver channel 0
				      input wire 	 ch0_gtyrxn_in,
				      input wire 	 ch0_gtyrxp_in,
				      output wire 	 ch0_gtytxn_out,
				      output wire 	 ch0_gtytxp_out,

				      // Serial data ports for transceiver channel 1
				      input wire 	 ch1_gtyrxn_in,
				      input wire 	 ch1_gtyrxp_in,
				      output wire 	 ch1_gtytxn_out,
				      output wire 	 ch1_gtytxp_out,

				      // Serial data ports for transceiver channel 2
				      input wire 	 ch2_gtyrxn_in,
				      input wire 	 ch2_gtyrxp_in,
				      output wire 	 ch2_gtytxn_out,
				      output wire 	 ch2_gtytxp_out,

				      // Serial data ports for transceiver channel 3
				      input wire 	 ch3_gtyrxn_in,
				      input wire 	 ch3_gtyrxp_in,
				      output wire 	 ch3_gtytxn_out,
				      output wire 	 ch3_gtytxp_out,

				      // tx_usrclk2
				      output wire 	 tx_usrclk2_out,
				      
				      // rx_usrclk2
				      output wire 	 hb0_gtwiz_userclk_rx_usrclk2_out,
				      output wire 	 hb1_gtwiz_userclk_rx_usrclk2_out,
				      output wire 	 hb2_gtwiz_userclk_rx_usrclk2_out,
				      output wire 	 hb3_gtwiz_userclk_rx_usrclk2_out,

				      // rxslide
				      input wire 	 ch0_rxslide_in,
				      input wire 	 ch1_rxslide_in,
				      input wire 	 ch2_rxslide_in,
				      input wire 	 ch3_rxslide_in,
				      
				      // buffbypass_rx_done
				      output wire 	 hb0_gtwiz_buffbypass_rx_done_out,
				      output wire 	 hb1_gtwiz_buffbypass_rx_done_out,
				      output wire 	 hb2_gtwiz_buffbypass_rx_done_out,
				      output wire 	 hb3_gtwiz_buffbypass_rx_done_out,
				      
				      // buffbypass_rx_error
				      output wire 	 hb0_gtwiz_buffbypass_rx_error_out,
				      output wire 	 hb1_gtwiz_buffbypass_rx_error_out,
				      output wire 	 hb2_gtwiz_buffbypass_rx_error_out,
				      output wire 	 hb3_gtwiz_buffbypass_rx_error_out,

				      // userdata_tx
				      input wire [31:0]  hb0_gtwiz_userdata_tx_in,
				      input wire [31:0]  hb1_gtwiz_userdata_tx_in,
				      input wire [31:0]  hb2_gtwiz_userdata_tx_in,
				      input wire [31:0]  hb3_gtwiz_userdata_tx_in, 

				      // userdata_rx
				      output wire [31:0] hb0_gtwiz_userdata_rx_out,
				      output wire [31:0] hb1_gtwiz_userdata_rx_out,
				      output wire [31:0] hb2_gtwiz_userdata_rx_out,
				      output wire [31:0] hb3_gtwiz_userdata_rx_out,

				      // txctrl0
				      input wire [15:0]  ch0_txctrl0_in,
				      input wire [15:0]  ch1_txctrl0_in,
				      input wire [15:0]  ch2_txctrl0_in,
				      input wire [15:0]  ch3_txctrl0_in, 
				      
				      // txctrl1
				      input wire [15:0]  ch0_txctrl1_in,
				      input wire [15:0]  ch1_txctrl1_in,
				      input wire [15:0]  ch2_txctrl1_in,
				      input wire [15:0]  ch3_txctrl1_in,

				      // txctrl2
				      input wire [7:0] 	 ch0_txctrl2_in,
				      input wire [7:0] 	 ch1_txctrl2_in,
				      input wire [7:0] 	 ch2_txctrl2_in,
				      input wire [7:0] 	 ch3_txctrl2_in,

				      // gtpowergood
				      output wire 	 ch0_gtpowergood_out,
				      output wire 	 ch1_gtpowergood_out,
				      output wire 	 ch2_gtpowergood_out,
				      output wire 	 ch3_gtpowergood_out,

				      // rxbyteisaligned
				      output wire 	 ch0_rxbyteisaligned_out,
				      output wire 	 ch1_rxbyteisaligned_out,
				      output wire 	 ch2_rxbyteisaligned_out,
				      output wire 	 ch3_rxbyteisaligned_out,
				      
				      // rxbyterealign
				      output wire 	 ch0_rxbyterealign_out,
				      output wire 	 ch1_rxbyterealign_out,
				      output wire 	 ch2_rxbyterealign_out,
				      output wire 	 ch3_rxbyterealign_out,

				      // rxcommadet
				      output wire 	 ch0_rxcommadet_out,
				      output wire 	 ch1_rxcommadet_out,
				      output wire 	 ch2_rxcommadet_out,
				      output wire 	 ch3_rxcommadet_out,

				      // rxctrl0
				      output wire [15:0] ch0_rxctrl0_out,
				      output wire [15:0] ch1_rxctrl0_out,
				      output wire [15:0] ch2_rxctrl0_out,
				      output wire [15:0] ch3_rxctrl0_out,

				      // rxctrl1
				      output wire [15:0] ch0_rxctrl1_out,
				      output wire [15:0] ch1_rxctrl1_out,
				      output wire [15:0] ch2_rxctrl1_out,
				      output wire [15:0] ch3_rxctrl1_out,

				      // rxctrl2
				      output wire [7:0]  ch0_rxctrl2_out,
				      output wire [7:0]  ch1_rxctrl2_out,
				      output wire [7:0]  ch2_rxctrl2_out,
				      output wire [7:0]  ch3_rxctrl2_out,

				      // rxctrl3
				      output wire [7:0]  ch0_rxctrl3_out,
				      output wire [7:0]  ch1_rxctrl3_out,
				      output wire [7:0]  ch2_rxctrl3_out,
				      output wire [7:0]  ch3_rxctrl3_out,

				      // rxpmaresetdone
				      output wire 	 ch0_rxpmaresetdone_out,
				      output wire 	 ch1_rxpmaresetdone_out,
				      output wire 	 ch2_rxpmaresetdone_out,
				      output wire 	 ch3_rxpmaresetdone_out,

				      // txpmaresetdone
				      output wire 	 ch0_txpmaresetdone_out,
				      output wire 	 ch1_txpmaresetdone_out,
				      output wire 	 ch2_txpmaresetdone_out,
				      output wire 	 ch3_txpmaresetdone_out,

				      // txprgdivresetdone
				      output wire 	 ch0_txprgdivresetdone_out,
				      output wire 	 ch1_txprgdivresetdone_out,
				      output wire 	 ch2_txprgdivresetdone_out,
				      output wire 	 ch3_txprgdivresetdone_out,

				      // User-provided ports for reset helper block(s)
				      input wire 	 hb_gtwiz_reset_clk_freerun_in,
				      input wire 	 hb_gtwiz_reset_all_in);


   // ===================================================================================================================
   // PER-CHANNEL SIGNAL ASSIGNMENTS
   // ===================================================================================================================

   // The core and example design wrapper vectorize ports across all enabled transceiver channel and common instances for
   // simplicity and compactness. This example design top module assigns slices of each vector to individual, per-channel
   // signal vectors for use if desired. Signals which connect to helper blocks are prefixed "hb#", signals which connect
   // to transceiver common primitives are prefixed "cm#", and signals which connect to transceiver channel primitives
   // are prefixed "ch#", where "#" is the sequential resource number.

   //--------------------------------------------------------------------------------------------------------------------
   wire [3:0] 					  gtyrxn_int;
   assign gtyrxn_int[0:0] = ch0_gtyrxn_in;
   assign gtyrxn_int[1:1] = ch1_gtyrxn_in;
   assign gtyrxn_int[2:2] = ch2_gtyrxn_in;
   assign gtyrxn_int[3:3] = ch3_gtyrxn_in;

   //--------------------------------------------------------------------------------------------------------------------
   wire [3:0] 					  gtyrxp_int;
   assign gtyrxp_int[0:0] = ch0_gtyrxp_in;
   assign gtyrxp_int[1:1] = ch1_gtyrxp_in;
   assign gtyrxp_int[2:2] = ch2_gtyrxp_in;
   assign gtyrxp_int[3:3] = ch3_gtyrxp_in;

   //--------------------------------------------------------------------------------------------------------------------
   wire [3:0] 					  gtytxn_int;
   assign ch0_gtytxn_out = gtytxn_int[0:0];
   assign ch1_gtytxn_out = gtytxn_int[1:1];
   assign ch2_gtytxn_out = gtytxn_int[2:2];
   assign ch3_gtytxn_out = gtytxn_int[3:3];

   //--------------------------------------------------------------------------------------------------------------------
   wire [3:0] 					  gtytxp_int;
   assign ch0_gtytxp_out = gtytxp_int[0:0];
   assign ch1_gtytxp_out = gtytxp_int[1:1];
   assign ch2_gtytxp_out = gtytxp_int[2:2];
   assign ch3_gtytxp_out = gtytxp_int[3:3];

   //--------------------------------------------------------------------------------------------------------------------
   wire [0:0] 					  gtwiz_userclk_tx_reset_int;
   wire [0:0] 					  hb0_gtwiz_userclk_tx_reset_int;
   assign gtwiz_userclk_tx_reset_int[0:0] = hb0_gtwiz_userclk_tx_reset_int;

   //--------------------------------------------------------------------------------------------------------------------
   wire [0:0] 					  gtwiz_userclk_tx_srcclk_int;
   wire [0:0] 					  hb0_gtwiz_userclk_tx_srcclk_int;
   assign hb0_gtwiz_userclk_tx_srcclk_int = gtwiz_userclk_tx_srcclk_int[0:0];
   
   //--------------------------------------------------------------------------------------------------------------------
   wire [0:0] 					  gtwiz_userclk_tx_usrclk_int;
   wire [0:0] 					  hb0_gtwiz_userclk_tx_usrclk_int;
   assign hb0_gtwiz_userclk_tx_usrclk_int = gtwiz_userclk_tx_usrclk_int[0:0];

   //--------------------------------------------------------------------------------------------------------------------
   wire [0:0] 					  gtwiz_userclk_tx_usrclk2_int;
   wire 					  hb0_gtwiz_userclk_tx_usrclk2_int;
   assign hb0_gtwiz_userclk_tx_usrclk2_int = gtwiz_userclk_tx_usrclk2_int[0:0];
   assign tx_usrclk2_out = gtwiz_userclk_tx_usrclk2_int[0:0];

   //--------------------------------------------------------------------------------------------------------------------
   wire [0:0] 					  gtwiz_userclk_tx_active_int;
   wire [0:0] 					  hb0_gtwiz_userclk_tx_active_int;
   assign hb0_gtwiz_userclk_tx_active_int = gtwiz_userclk_tx_active_int[0:0];

   //--------------------------------------------------------------------------------------------------------------------
   wire [3:0] 					  gtwiz_userclk_rx_reset_int;
   wire [0:0] 					  hb0_gtwiz_userclk_rx_reset_int;
   wire [0:0] 					  hb1_gtwiz_userclk_rx_reset_int;
   wire [0:0] 					  hb2_gtwiz_userclk_rx_reset_int;
   wire [0:0] 					  hb3_gtwiz_userclk_rx_reset_int;
   assign gtwiz_userclk_rx_reset_int[0:0] = hb0_gtwiz_userclk_rx_reset_int;
   assign gtwiz_userclk_rx_reset_int[1:1] = hb1_gtwiz_userclk_rx_reset_int;
   assign gtwiz_userclk_rx_reset_int[2:2] = hb2_gtwiz_userclk_rx_reset_int;
   assign gtwiz_userclk_rx_reset_int[3:3] = hb3_gtwiz_userclk_rx_reset_int;

   //--------------------------------------------------------------------------------------------------------------------
   wire [3:0] 					  gtwiz_userclk_rx_srcclk_int;
   wire [0:0] 					  hb0_gtwiz_userclk_rx_srcclk_int;
   wire [0:0] 					  hb1_gtwiz_userclk_rx_srcclk_int;
   wire [0:0] 					  hb2_gtwiz_userclk_rx_srcclk_int;
   wire [0:0] 					  hb3_gtwiz_userclk_rx_srcclk_int;
   assign hb0_gtwiz_userclk_rx_srcclk_int = gtwiz_userclk_rx_srcclk_int[0:0];
   assign hb1_gtwiz_userclk_rx_srcclk_int = gtwiz_userclk_rx_srcclk_int[1:1];
   assign hb2_gtwiz_userclk_rx_srcclk_int = gtwiz_userclk_rx_srcclk_int[2:2];
   assign hb3_gtwiz_userclk_rx_srcclk_int = gtwiz_userclk_rx_srcclk_int[3:3];

   //--------------------------------------------------------------------------------------------------------------------
   wire [3:0] 					  gtwiz_userclk_rx_usrclk_int;
   wire [0:0] 					  hb0_gtwiz_userclk_rx_usrclk_int;
   wire [0:0] 					  hb1_gtwiz_userclk_rx_usrclk_int;
   wire [0:0] 					  hb2_gtwiz_userclk_rx_usrclk_int;
   wire [0:0] 					  hb3_gtwiz_userclk_rx_usrclk_int;
   assign hb0_gtwiz_userclk_rx_usrclk_int = gtwiz_userclk_rx_usrclk_int[0:0];
   assign hb1_gtwiz_userclk_rx_usrclk_int = gtwiz_userclk_rx_usrclk_int[1:1];
   assign hb2_gtwiz_userclk_rx_usrclk_int = gtwiz_userclk_rx_usrclk_int[2:2];
   assign hb3_gtwiz_userclk_rx_usrclk_int = gtwiz_userclk_rx_usrclk_int[3:3];

   //--------------------------------------------------------------------------------------------------------------------
   wire [3:0] 					  gtwiz_userclk_rx_usrclk2_int;
   wire 					  hb0_gtwiz_userclk_rx_usrclk2_int;
   wire 					  hb1_gtwiz_userclk_rx_usrclk2_int;
   wire 					  hb2_gtwiz_userclk_rx_usrclk2_int;
   wire 					  hb3_gtwiz_userclk_rx_usrclk2_int;
   assign hb0_gtwiz_userclk_rx_usrclk2_out = gtwiz_userclk_rx_usrclk2_int[0];
   assign hb1_gtwiz_userclk_rx_usrclk2_out = gtwiz_userclk_rx_usrclk2_int[1];
   assign hb2_gtwiz_userclk_rx_usrclk2_out = gtwiz_userclk_rx_usrclk2_int[2];
   assign hb3_gtwiz_userclk_rx_usrclk2_out = gtwiz_userclk_rx_usrclk2_int[3];
   
   assign hb0_gtwiz_userclk_rx_usrclk2_int = gtwiz_userclk_rx_usrclk2_int[0];
   assign hb1_gtwiz_userclk_rx_usrclk2_int = gtwiz_userclk_rx_usrclk2_int[1];
   assign hb2_gtwiz_userclk_rx_usrclk2_int = gtwiz_userclk_rx_usrclk2_int[2];
   assign hb3_gtwiz_userclk_rx_usrclk2_int = gtwiz_userclk_rx_usrclk2_int[3];

   //--------------------------------------------------------------------------------------------------------------------
   wire [3:0] 					  gtwiz_userclk_rx_active_int;
   wire [0:0] 					  hb0_gtwiz_userclk_rx_active_int;
   wire [0:0] 					  hb1_gtwiz_userclk_rx_active_int;
   wire [0:0] 					  hb2_gtwiz_userclk_rx_active_int;
   wire [0:0] 					  hb3_gtwiz_userclk_rx_active_int;
   assign hb0_gtwiz_userclk_rx_active_int = gtwiz_userclk_rx_active_int[0:0];
   assign hb1_gtwiz_userclk_rx_active_int = gtwiz_userclk_rx_active_int[1:1];
   assign hb2_gtwiz_userclk_rx_active_int = gtwiz_userclk_rx_active_int[2:2];
   assign hb3_gtwiz_userclk_rx_active_int = gtwiz_userclk_rx_active_int[3:3];

   //--------------------------------------------------------------------------------------------------------------------
   wire [0:0] 					  gtwiz_buffbypass_tx_reset_int;
   wire [0:0] 					  hb0_gtwiz_buffbypass_tx_reset_int;
   assign gtwiz_buffbypass_tx_reset_int[0:0] = hb0_gtwiz_buffbypass_tx_reset_int;

   //--------------------------------------------------------------------------------------------------------------------
   wire [0:0] 					  gtwiz_buffbypass_tx_start_user_int;
   wire [0:0] 					  hb0_gtwiz_buffbypass_tx_start_user_int = 1'b0;
   assign gtwiz_buffbypass_tx_start_user_int[0:0] = hb0_gtwiz_buffbypass_tx_start_user_int;

   //--------------------------------------------------------------------------------------------------------------------
   wire [0:0] 					  gtwiz_buffbypass_tx_done_int;
   wire [0:0] 					  hb0_gtwiz_buffbypass_tx_done_int;
   assign hb0_gtwiz_buffbypass_tx_done_int = gtwiz_buffbypass_tx_done_int[0:0];

   //--------------------------------------------------------------------------------------------------------------------
   wire [0:0] 					  gtwiz_buffbypass_tx_error_int;
   wire [0:0] 					  hb0_gtwiz_buffbypass_tx_error_int;
   assign hb0_gtwiz_buffbypass_tx_error_int = gtwiz_buffbypass_tx_error_int[0:0];

   //--------------------------------------------------------------------------------------------------------------------
   wire [3:0] 					  gtwiz_buffbypass_rx_reset_int;
   wire [0:0] 					  hb0_gtwiz_buffbypass_rx_reset_int;
   wire [0:0] 					  hb1_gtwiz_buffbypass_rx_reset_int;
   wire [0:0] 					  hb2_gtwiz_buffbypass_rx_reset_int;
   wire [0:0] 					  hb3_gtwiz_buffbypass_rx_reset_int;
   assign gtwiz_buffbypass_rx_reset_int[0:0] = hb0_gtwiz_buffbypass_rx_reset_int;
   assign gtwiz_buffbypass_rx_reset_int[1:1] = hb1_gtwiz_buffbypass_rx_reset_int;
   assign gtwiz_buffbypass_rx_reset_int[2:2] = hb2_gtwiz_buffbypass_rx_reset_int;
   assign gtwiz_buffbypass_rx_reset_int[3:3] = hb3_gtwiz_buffbypass_rx_reset_int;

   //--------------------------------------------------------------------------------------------------------------------
   wire [3:0] 					  gtwiz_buffbypass_rx_start_user_int;
   wire [0:0] 					  hb0_gtwiz_buffbypass_rx_start_user_int = 1'b0;
   wire [0:0] 					  hb1_gtwiz_buffbypass_rx_start_user_int = 1'b0;
   wire [0:0] 					  hb2_gtwiz_buffbypass_rx_start_user_int = 1'b0;
   wire [0:0] 					  hb3_gtwiz_buffbypass_rx_start_user_int = 1'b0;
   assign gtwiz_buffbypass_rx_start_user_int[0:0] = hb0_gtwiz_buffbypass_rx_start_user_int;
   assign gtwiz_buffbypass_rx_start_user_int[1:1] = hb1_gtwiz_buffbypass_rx_start_user_int;
   assign gtwiz_buffbypass_rx_start_user_int[2:2] = hb2_gtwiz_buffbypass_rx_start_user_int;
   assign gtwiz_buffbypass_rx_start_user_int[3:3] = hb3_gtwiz_buffbypass_rx_start_user_int;

   //--------------------------------------------------------------------------------------------------------------------
   wire [3:0] 					  gtwiz_buffbypass_rx_done_int;
   assign hb0_gtwiz_buffbypass_rx_done_out = gtwiz_buffbypass_rx_done_int[0];
   assign hb1_gtwiz_buffbypass_rx_done_out = gtwiz_buffbypass_rx_done_int[1];
   assign hb2_gtwiz_buffbypass_rx_done_out = gtwiz_buffbypass_rx_done_int[2];
   assign hb3_gtwiz_buffbypass_rx_done_out = gtwiz_buffbypass_rx_done_int[3];

   //--------------------------------------------------------------------------------------------------------------------
   wire [3:0] 					  gtwiz_buffbypass_rx_error_int;
   assign hb0_gtwiz_buffbypass_rx_error_out = gtwiz_buffbypass_rx_error_int[0];
   assign hb1_gtwiz_buffbypass_rx_error_out = gtwiz_buffbypass_rx_error_int[1];
   assign hb2_gtwiz_buffbypass_rx_error_out = gtwiz_buffbypass_rx_error_int[2];
   assign hb3_gtwiz_buffbypass_rx_error_out = gtwiz_buffbypass_rx_error_int[3];

   //--------------------------------------------------------------------------------------------------------------------
   wire [0:0] 					  gtwiz_reset_clk_freerun_int;
   wire [0:0] 					  hb0_gtwiz_reset_clk_freerun_int = 1'b0;
   assign gtwiz_reset_clk_freerun_int[0:0] = hb0_gtwiz_reset_clk_freerun_int;

   //--------------------------------------------------------------------------------------------------------------------
   wire [0:0] 					  gtwiz_reset_all_int;
   wire [0:0] 					  hb0_gtwiz_reset_all_int = 1'b0;
   assign gtwiz_reset_all_int[0:0] = hb0_gtwiz_reset_all_int;

   //--------------------------------------------------------------------------------------------------------------------
   wire [0:0] 					  gtwiz_reset_tx_pll_and_datapath_int;
   wire [0:0] 					  hb0_gtwiz_reset_tx_pll_and_datapath_int = 1'b0;
   assign gtwiz_reset_tx_pll_and_datapath_int[0:0] = hb0_gtwiz_reset_tx_pll_and_datapath_int;

   //--------------------------------------------------------------------------------------------------------------------
   wire [0:0] 					  gtwiz_reset_tx_datapath_int;
   wire [0:0] 					  hb0_gtwiz_reset_tx_datapath_int = 1'b0;
   assign gtwiz_reset_tx_datapath_int[0:0] = hb0_gtwiz_reset_tx_datapath_int;

   //--------------------------------------------------------------------------------------------------------------------
   wire [0:0] 					  gtwiz_reset_rx_pll_and_datapath_int;
   wire [0:0] 					  hb0_gtwiz_reset_rx_pll_and_datapath_int = 1'b0;
   assign gtwiz_reset_rx_pll_and_datapath_int[0:0] = hb0_gtwiz_reset_rx_pll_and_datapath_int;

   //--------------------------------------------------------------------------------------------------------------------
   wire [0:0] 					  gtwiz_reset_rx_datapath_int;
   wire [0:0] 					  hb0_gtwiz_reset_rx_datapath_int = 1'b0;
   assign gtwiz_reset_rx_datapath_int[0:0] = hb0_gtwiz_reset_rx_datapath_int;

   //--------------------------------------------------------------------------------------------------------------------
   wire [0:0] 					  gtwiz_reset_rx_cdr_stable_int;
   wire [0:0] 					  hb0_gtwiz_reset_rx_cdr_stable_int;
   assign hb0_gtwiz_reset_rx_cdr_stable_int = gtwiz_reset_rx_cdr_stable_int[0:0];

   //--------------------------------------------------------------------------------------------------------------------
   wire [0:0] 					  gtwiz_reset_tx_done_int;
   wire [0:0] 					  hb0_gtwiz_reset_tx_done_int;
   assign hb0_gtwiz_reset_tx_done_int = gtwiz_reset_tx_done_int[0:0];

   //--------------------------------------------------------------------------------------------------------------------
   wire [0:0] 					  gtwiz_reset_rx_done_int;
   wire [0:0] 					  hb0_gtwiz_reset_rx_done_int;
   assign hb0_gtwiz_reset_rx_done_int = gtwiz_reset_rx_done_int[0:0];

   //--------------------------------------------------------------------------------------------------------------------
   wire [127:0] 				  gtwiz_userdata_tx_int;
   assign gtwiz_userdata_tx_int[31:0] = hb0_gtwiz_userdata_tx_in;
   assign gtwiz_userdata_tx_int[63:32] = hb1_gtwiz_userdata_tx_in;
   assign gtwiz_userdata_tx_int[95:64] = hb2_gtwiz_userdata_tx_in;
   assign gtwiz_userdata_tx_int[127:96] = hb3_gtwiz_userdata_tx_in;

   //--------------------------------------------------------------------------------------------------------------------
   wire [127:0] 				  gtwiz_userdata_rx_int;
   assign hb0_gtwiz_userdata_rx_out = gtwiz_userdata_rx_int[31:0];
   assign hb1_gtwiz_userdata_rx_out = gtwiz_userdata_rx_int[63:32];
   assign hb2_gtwiz_userdata_rx_out = gtwiz_userdata_rx_int[95:64];
   assign hb3_gtwiz_userdata_rx_out = gtwiz_userdata_rx_int[127:96];

   //--------------------------------------------------------------------------------------------------------------------
   wire [0:0] 					  gtrefclk01_int;
   wire [0:0] 					  cm0_gtrefclk01_int;
   assign gtrefclk01_int[0:0] = cm0_gtrefclk01_int;

   //--------------------------------------------------------------------------------------------------------------------
   wire [0:0] 					  qpll0outclk_int;
   wire [0:0] 					  cm0_qpll0outclk_int;
   assign cm0_qpll0outclk_int = qpll0outclk_int[0:0];

   //--------------------------------------------------------------------------------------------------------------------
   wire [0:0] 					  qpll0outrefclk_int;
   wire [0:0] 					  cm0_qpll0outrefclk_int;
   assign cm0_qpll0outrefclk_int = qpll0outrefclk_int[0:0];

   //--------------------------------------------------------------------------------------------------------------------
   wire [0:0] 					  qpll1outclk_int;
   wire [0:0] 					  cm0_qpll1outclk_int;
   assign cm0_qpll1outclk_int = qpll1outclk_int[0:0];

   //--------------------------------------------------------------------------------------------------------------------
   wire [0:0] 					  qpll1outrefclk_int;
   wire [0:0] 					  cm0_qpll1outrefclk_int;
   assign cm0_qpll1outrefclk_int = qpll1outrefclk_int[0:0];

   //--------------------------------------------------------------------------------------------------------------------
   wire [3:0] 					  rx8b10ben_int;
   wire [0:0] 					  ch0_rx8b10ben_int = 1'b0; // 1'b1;
   wire [0:0] 					  ch1_rx8b10ben_int = 1'b0; // 1'b1;
   wire [0:0] 					  ch2_rx8b10ben_int = 1'b0; // 1'b1;
   wire [0:0] 					  ch3_rx8b10ben_int = 1'b0; // 1'b1;
   assign rx8b10ben_int[0:0] = ch0_rx8b10ben_int;
   assign rx8b10ben_int[1:1] = ch1_rx8b10ben_int;
   assign rx8b10ben_int[2:2] = ch2_rx8b10ben_int;
   assign rx8b10ben_int[3:3] = ch3_rx8b10ben_int;

   //--------------------------------------------------------------------------------------------------------------------
   wire [3:0] 					  rxcommadeten_int;
   wire [0:0] 					  ch0_rxcommadeten_int = 1'b1;
   wire [0:0] 					  ch1_rxcommadeten_int = 1'b1;
   wire [0:0] 					  ch2_rxcommadeten_int = 1'b1;
   wire [0:0] 					  ch3_rxcommadeten_int = 1'b1;
   assign rxcommadeten_int[0:0] = ch0_rxcommadeten_int;
   assign rxcommadeten_int[1:1] = ch1_rxcommadeten_int;
   assign rxcommadeten_int[2:2] = ch2_rxcommadeten_int;
   assign rxcommadeten_int[3:3] = ch3_rxcommadeten_int;

   //--------------------------------------------------------------------------------------------------------------------
   wire [3:0] 					  rxmcommaalignen_int;
   wire [0:0] 					  ch0_rxmcommaalignen_int = 1'b0; // 1'b1
   wire [0:0] 					  ch1_rxmcommaalignen_int = 1'b0; // 1'b1
   wire [0:0] 					  ch2_rxmcommaalignen_int = 1'b0; // 1'b1
   wire [0:0] 					  ch3_rxmcommaalignen_int = 1'b0; // 1'b1
   assign rxmcommaalignen_int[0:0] = ch0_rxmcommaalignen_int;
   assign rxmcommaalignen_int[1:1] = ch1_rxmcommaalignen_int;
   assign rxmcommaalignen_int[2:2] = ch2_rxmcommaalignen_int;
   assign rxmcommaalignen_int[3:3] = ch3_rxmcommaalignen_int;

   //--------------------------------------------------------------------------------------------------------------------
   wire [3:0] 					  rxpcommaalignen_int;
   wire [0:0] 					  ch0_rxpcommaalignen_int = 1'b0; //1'b1
   wire [0:0] 					  ch1_rxpcommaalignen_int = 1'b0; //1'b1
   wire [0:0] 					  ch2_rxpcommaalignen_int = 1'b0; //1'b1
   wire [0:0] 					  ch3_rxpcommaalignen_int = 1'b0; //1'b1
   assign rxpcommaalignen_int[0:0] = ch0_rxpcommaalignen_int;
   assign rxpcommaalignen_int[1:1] = ch1_rxpcommaalignen_int;
   assign rxpcommaalignen_int[2:2] = ch2_rxpcommaalignen_int;
   assign rxpcommaalignen_int[3:3] = ch3_rxpcommaalignen_int;

   //--------------------------------------------------------------------------------------------------------------------
   wire [3:0] 					  rxslide_int;
   assign rxslide_int[0] = ch0_rxslide_in;
   assign rxslide_int[1] = ch1_rxslide_in;
   assign rxslide_int[2] = ch2_rxslide_in;
   assign rxslide_int[3] = ch3_rxslide_in;

   //--------------------------------------------------------------------------------------------------------------------
   wire [3:0] 					  tx8b10ben_int;
   wire [0:0] 					  ch0_tx8b10ben_int = 1'b1;
   wire [0:0] 					  ch1_tx8b10ben_int = 1'b1;
   wire [0:0] 					  ch2_tx8b10ben_int = 1'b1;
   wire [0:0] 					  ch3_tx8b10ben_int = 1'b1;
   assign tx8b10ben_int[0:0] = ch0_tx8b10ben_int;
   assign tx8b10ben_int[1:1] = ch1_tx8b10ben_int;
   assign tx8b10ben_int[2:2] = ch2_tx8b10ben_int;
   assign tx8b10ben_int[3:3] = ch3_tx8b10ben_int;

   //--------------------------------------------------------------------------------------------------------------------
   wire [63:0] 					  txctrl0_int;
   assign txctrl0_int[15:0] = ch0_txctrl0_in;
   assign txctrl0_int[31:16] = ch1_txctrl0_in;
   assign txctrl0_int[47:32] = ch2_txctrl0_in;
   assign txctrl0_int[63:48] = ch3_txctrl0_in;

   //--------------------------------------------------------------------------------------------------------------------
   wire [63:0] 					  txctrl1_int;
   assign txctrl1_int[15:0] = ch0_txctrl1_in;
   assign txctrl1_int[31:16] = ch1_txctrl1_in;
   assign txctrl1_int[47:32] = ch2_txctrl1_in;
   assign txctrl1_int[63:48] = ch3_txctrl1_in;

   //--------------------------------------------------------------------------------------------------------------------
   wire [31:0] 					  txctrl2_int;
   assign txctrl2_int[7:0] = ch0_txctrl2_in;
   assign txctrl2_int[15:8] = ch1_txctrl2_in;
   assign txctrl2_int[23:16] = ch2_txctrl2_in;
   assign txctrl2_int[31:24] = ch3_txctrl2_in;

   //--------------------------------------------------------------------------------------------------------------------
   wire [3:0] 					  gtpowergood_int;
   assign ch0_gtpowergood_out = gtpowergood_int[0];
   assign ch1_gtpowergood_out = gtpowergood_int[1];
   assign ch2_gtpowergood_out = gtpowergood_int[2];
   assign ch3_gtpowergood_out = gtpowergood_int[3];

   //--------------------------------------------------------------------------------------------------------------------
   wire [3:0] 					  rxbyteisaligned_int;
   assign ch0_rxbyteisaligned_out = rxbyteisaligned_int[0];
   assign ch1_rxbyteisaligned_out = rxbyteisaligned_int[1];
   assign ch2_rxbyteisaligned_out = rxbyteisaligned_int[2];
   assign ch3_rxbyteisaligned_out = rxbyteisaligned_int[3];

   //--------------------------------------------------------------------------------------------------------------------
   wire [3:0] 					  rxbyterealign_int;
   assign ch0_rxbyterealign_out = rxbyterealign_int[0];
   assign ch1_rxbyterealign_out = rxbyterealign_int[1];
   assign ch2_rxbyterealign_out = rxbyterealign_int[2];
   assign ch3_rxbyterealign_out = rxbyterealign_int[3];

   //--------------------------------------------------------------------------------------------------------------------
   wire [3:0] 					  rxcommadet_int;
   assign ch0_rxcommadet_out = rxcommadet_int[0];
   assign ch1_rxcommadet_out = rxcommadet_int[1];
   assign ch2_rxcommadet_out = rxcommadet_int[2];
   assign ch3_rxcommadet_out = rxcommadet_int[3];

   //--------------------------------------------------------------------------------------------------------------------
   wire [63:0] 					  rxctrl0_int;
   assign ch0_rxctrl0_out = rxctrl0_int[15:0];
   assign ch1_rxctrl0_out = rxctrl0_int[31:16];
   assign ch2_rxctrl0_out = rxctrl0_int[47:32];
   assign ch3_rxctrl0_out = rxctrl0_int[63:48];

   //--------------------------------------------------------------------------------------------------------------------
   wire [63:0] 					  rxctrl1_int;
   assign ch0_rxctrl1_out = rxctrl1_int[15:0];
   assign ch1_rxctrl1_out = rxctrl1_int[31:16];
   assign ch2_rxctrl1_out = rxctrl1_int[47:32];
   assign ch3_rxctrl1_out = rxctrl1_int[63:48];

   //--------------------------------------------------------------------------------------------------------------------
   wire [31:0] 					  rxctrl2_int;
   assign ch0_rxctrl2_out = rxctrl2_int[7:0];
   assign ch1_rxctrl2_out = rxctrl2_int[15:8];
   assign ch2_rxctrl2_out = rxctrl2_int[23:16];
   assign ch3_rxctrl2_out = rxctrl2_int[31:24];

   //--------------------------------------------------------------------------------------------------------------------
   wire [31:0] 					  rxctrl3_int;
   assign ch0_rxctrl3_out = rxctrl3_int[7:0];
   assign ch1_rxctrl3_out = rxctrl3_int[15:8];
   assign ch2_rxctrl3_out = rxctrl3_int[23:16];
   assign ch3_rxctrl3_out = rxctrl3_int[31:24];
   
   //--------------------------------------------------------------------------------------------------------------------
   wire [3:0] 					  rxpmaresetdone_int;
   assign ch0_rxpmaresetdone_out = rxpmaresetdone_int[0];
   assign ch1_rxpmaresetdone_out = rxpmaresetdone_int[1];
   assign ch2_rxpmaresetdone_out = rxpmaresetdone_int[2];
   assign ch3_rxpmaresetdone_out = rxpmaresetdone_int[3];

   //--------------------------------------------------------------------------------------------------------------------
   wire [3:0] 					  txpmaresetdone_int;
   assign ch0_txpmaresetdone_out = txpmaresetdone_int[0];
   assign ch1_txpmaresetdone_out = txpmaresetdone_int[1];
   assign ch2_txpmaresetdone_out = txpmaresetdone_int[2];
   assign ch3_txpmaresetdone_out = txpmaresetdone_int[3];

   //--------------------------------------------------------------------------------------------------------------------
   wire [3:0] 					  txprgdivresetdone_int;
   assign ch0_txprgdivresetdone_out = txprgdivresetdone_int[0];
   assign ch1_txprgdivresetdone_out = txprgdivresetdone_int[1];
   assign ch2_txprgdivresetdone_out = txprgdivresetdone_int[2];
   assign ch3_txprgdivresetdone_out = txprgdivresetdone_int[3];


   // ===================================================================================================================
   // BUFFERS
   // ===================================================================================================================

   // Buffer the hb_gtwiz_reset_all_in input and logically combine it with the internal signal from the example
   // initialization block as well as the VIO-sourced reset
   wire 					  hb_gtwiz_reset_all_init_int;
   wire 					  hb_gtwiz_reset_all_int;

   assign hb_gtwiz_reset_all_int = hb_gtwiz_reset_all_in || hb_gtwiz_reset_all_init_int;
   

   // Instantiate a differential reference clock buffer for each reference clock differential pair in this configuration,
   // and assign the single-ended output of each differential reference clock buffer to the appropriate PLL input signal

   // Differential reference clock buffer for MGTREFCLK0_X0Y2
   wire 					  mgtrefclk0_x0y2_int;

   IBUFDS_GTE4 #(
		 .REFCLK_EN_TX_PATH  (1'b0),
		 .REFCLK_HROW_CK_SEL (2'b00),
		 .REFCLK_ICNTL_RX    (2'b00)
		 ) IBUFDS_GTE4_MGTREFCLK0_X0Y2_INST (
						     .I     (mgtrefclk0_x0y2_p),
						     .IB    (mgtrefclk0_x0y2_n),
						     .CEB   (1'b0),
						     .O     (mgtrefclk0_x0y2_int),
						     .ODIV2 ()
						     );

   assign cm0_gtrefclk01_int = mgtrefclk0_x0y2_int;


   // ===================================================================================================================
   // USER CLOCKING RESETS
   // ===================================================================================================================

   // The TX user clocking helper block should be held in reset until the clock source of that block is known to be
   // stable. The following assignment is an example of how that stability can be determined, based on the selected TX
   // user clock source. Replace the assignment with the appropriate signal or logic to achieve that behavior as needed.
   assign hb0_gtwiz_userclk_tx_reset_int = ~(&txprgdivresetdone_int && &txpmaresetdone_int);

   // The RX user clocking helper block should be held in reset until the clock source of that block is known to be
   // stable. The following assignment is an example of how that stability can be determined, based on the selected RX
   // user clock source. Replace the assignment with the appropriate signal or logic to achieve that behavior as needed.
   assign hb0_gtwiz_userclk_rx_reset_int = ~rxpmaresetdone_int[0];
   assign hb1_gtwiz_userclk_rx_reset_int = ~rxpmaresetdone_int[1];
   assign hb2_gtwiz_userclk_rx_reset_int = ~rxpmaresetdone_int[2];
   assign hb3_gtwiz_userclk_rx_reset_int = ~rxpmaresetdone_int[3];


   // ===================================================================================================================
   // BUFFER BYPASS CONTROLLER RESETS
   // ===================================================================================================================

   // The TX buffer bypass controller helper block should be held in reset until the TX user clocking network helper
   // block which drives it is active
   (* DONT_TOUCH = "TRUE" *)
   gty_fixed_latency_example_reset_synchronizer reset_synchronizer_gtwiz_buffbypass_tx_reset_inst (
												   .clk_in  (hb0_gtwiz_userclk_tx_usrclk2_int),
												   .rst_in  (~hb0_gtwiz_userclk_tx_active_int),
												   .rst_out (hb0_gtwiz_buffbypass_tx_reset_int)
												   );

   // The RX buffer bypass controller helper blocks should be held in reset until the RX user clocking network helper
   // blocks which drives them are active and the TX buffer bypass sequence has completed for this loopback configuration
   (* DONT_TOUCH = "TRUE" *)
   gty_fixed_latency_example_reset_synchronizer reset_synchronizer_gtwiz_buffbypass_rx_reset_0_inst (
												     .clk_in  (hb0_gtwiz_userclk_rx_usrclk2_int),
												     .rst_in  (~hb0_gtwiz_userclk_rx_active_int || ~hb0_gtwiz_buffbypass_tx_done_int),
												     .rst_out (hb0_gtwiz_buffbypass_rx_reset_int)
												     );

   (* DONT_TOUCH = "TRUE" *)
   gty_fixed_latency_example_reset_synchronizer reset_synchronizer_gtwiz_buffbypass_rx_reset_1_inst (
												     .clk_in  (hb1_gtwiz_userclk_rx_usrclk2_int),
												     .rst_in  (~hb1_gtwiz_userclk_rx_active_int || ~hb0_gtwiz_buffbypass_tx_done_int),
												     .rst_out (hb1_gtwiz_buffbypass_rx_reset_int)
												     );

   (* DONT_TOUCH = "TRUE" *)
   gty_fixed_latency_example_reset_synchronizer reset_synchronizer_gtwiz_buffbypass_rx_reset_2_inst (
												     .clk_in  (hb2_gtwiz_userclk_rx_usrclk2_int),
												     .rst_in  (~hb2_gtwiz_userclk_rx_active_int || ~hb0_gtwiz_buffbypass_tx_done_int),
												     .rst_out (hb2_gtwiz_buffbypass_rx_reset_int)
												     );

   (* DONT_TOUCH = "TRUE" *)
   gty_fixed_latency_example_reset_synchronizer reset_synchronizer_gtwiz_buffbypass_rx_reset_3_inst (
												     .clk_in  (hb3_gtwiz_userclk_rx_usrclk2_int),
												     .rst_in  (~hb3_gtwiz_userclk_rx_active_int || ~hb0_gtwiz_buffbypass_tx_done_int),
												     .rst_out (hb3_gtwiz_buffbypass_rx_reset_int)
												     );

   
   // ===================================================================================================================
   // INITIALIZATION
   // ===================================================================================================================

   // Declare the receiver reset signals that interface to the reset controller helper block. For this configuration,
   // which uses the same PLL type for transmitter and receiver, the "reset RX PLL and datapath" feature is not used.
   wire 					  hb_gtwiz_reset_rx_pll_and_datapath_int = 1'b0;
   wire 					  hb_gtwiz_reset_rx_datapath_int;

   // Declare signals which connect the VIO instance to the initialization module for debug purposes
   wire init_done_int;
   wire [3:0] init_retry_ctr_int;

   // Combine the receiver reset signals form the initialization module and the VIO to drive the appropriate reset
   // controller helper block reset input
   wire       hb_gtwiz_reset_rx_pll_and_datapath_vio_int;
   wire       hb_gtwiz_reset_rx_datapath_init_int;

   assign hb_gtwiz_reset_rx_datapath_int = hb_gtwiz_reset_rx_datapath_init_int;

   // The example initialization module interacts with the reset controller helper block and other example design logic
   // to retry failed reset attempts in order to mitigate bring-up issues such as initially-unavilable reference clocks
   // or data connections. It also resets the receiver in the event of link loss in an attempt to regain link, so please
   // note the possibility that this behavior can have the effect of overriding or disturbing user-provided inputs that
   // destabilize the data stream. It is a demonstration only and can be modified to suit your system needs.
   gty_fixed_latency_example_init example_init_inst (
						     .clk_freerun_in  (hb_gtwiz_reset_clk_freerun_in),
						     .reset_all_in    (hb_gtwiz_reset_all_int),
						     .tx_init_done_in (gtwiz_reset_tx_done_int && gtwiz_buffbypass_tx_done_int),
						     .rx_init_done_in (gtwiz_reset_rx_done_int && (&gtwiz_buffbypass_rx_done_int)),
						     .rx_data_good_in (1'b1),
						     .reset_all_out   (hb_gtwiz_reset_all_init_int),
						     .reset_rx_out    (hb_gtwiz_reset_rx_datapath_init_int),
						     .init_done_out   (init_done_int),
						     .retry_ctr_out   (init_retry_ctr_int)
						     );
   
   // ===================================================================================================================
   // EXAMPLE WRAPPER INSTANCE
   // ===================================================================================================================

   // Instantiate the example design wrapper, mapping its enabled ports to per-channel internal signals and example
   // resources as appropriate
   gty_fixed_latency_example_wrapper example_wrapper_inst (
							   .gtyrxn_in                               (gtyrxn_int)
							   ,.gtyrxp_in                               (gtyrxp_int)
							   ,.gtytxn_out                              (gtytxn_int)
							   ,.gtytxp_out                              (gtytxp_int)
							   ,.gtwiz_userclk_tx_reset_in               (gtwiz_userclk_tx_reset_int)
							   ,.gtwiz_userclk_tx_srcclk_out             (gtwiz_userclk_tx_srcclk_int)
							   ,.gtwiz_userclk_tx_usrclk_out             (gtwiz_userclk_tx_usrclk_int)
							   ,.gtwiz_userclk_tx_usrclk2_out            (gtwiz_userclk_tx_usrclk2_int)
							   ,.gtwiz_userclk_tx_active_out             (gtwiz_userclk_tx_active_int)
							   ,.gtwiz_userclk_rx_reset_in               (gtwiz_userclk_rx_reset_int)
							   ,.gtwiz_userclk_rx_srcclk_out             (gtwiz_userclk_rx_srcclk_int)
							   ,.gtwiz_userclk_rx_usrclk_out             (gtwiz_userclk_rx_usrclk_int)
							   ,.gtwiz_userclk_rx_usrclk2_out            (gtwiz_userclk_rx_usrclk2_int)
							   ,.gtwiz_userclk_rx_active_out             (gtwiz_userclk_rx_active_int)
							   ,.gtwiz_buffbypass_tx_reset_in            (gtwiz_buffbypass_tx_reset_int)
							   ,.gtwiz_buffbypass_tx_start_user_in       (gtwiz_buffbypass_tx_start_user_int)
							   ,.gtwiz_buffbypass_tx_done_out            (gtwiz_buffbypass_tx_done_int)
							   ,.gtwiz_buffbypass_tx_error_out           (gtwiz_buffbypass_tx_error_int)
							   ,.gtwiz_buffbypass_rx_reset_in            (gtwiz_buffbypass_rx_reset_int)
							   ,.gtwiz_buffbypass_rx_start_user_in       (gtwiz_buffbypass_rx_start_user_int)
							   ,.gtwiz_buffbypass_rx_done_out            (gtwiz_buffbypass_rx_done_int)
							   ,.gtwiz_buffbypass_rx_error_out           (gtwiz_buffbypass_rx_error_int)
							   ,.gtwiz_reset_clk_freerun_in              (hb_gtwiz_reset_clk_freerun_in)
							   ,.gtwiz_reset_all_in                      ({1{hb_gtwiz_reset_all_int}})
							   ,.gtwiz_reset_tx_pll_and_datapath_in      (gtwiz_reset_tx_pll_and_datapath_int)
							   ,.gtwiz_reset_tx_datapath_in              (gtwiz_reset_tx_datapath_int)
							   ,.gtwiz_reset_rx_pll_and_datapath_in      ({1{hb_gtwiz_reset_rx_pll_and_datapath_int}})
							   ,.gtwiz_reset_rx_datapath_in              ({1{hb_gtwiz_reset_rx_datapath_int}})
							   ,.gtwiz_reset_rx_cdr_stable_out           (gtwiz_reset_rx_cdr_stable_int)
							   ,.gtwiz_reset_tx_done_out                 (gtwiz_reset_tx_done_int)
							   ,.gtwiz_reset_rx_done_out                 (gtwiz_reset_rx_done_int)
							   ,.gtwiz_userdata_tx_in                    (gtwiz_userdata_tx_int)
							   ,.gtwiz_userdata_rx_out                   (gtwiz_userdata_rx_int)
							   ,.gtrefclk01_in                           (gtrefclk01_int)
							   ,.qpll0outclk_out                         (qpll0outclk_int)
							   ,.qpll0outrefclk_out                      (qpll0outrefclk_int)
							   ,.qpll1outclk_out                         (qpll1outclk_int)
							   ,.qpll1outrefclk_out                      (qpll1outrefclk_int)
							   ,.rx8b10ben_in                            (rx8b10ben_int)
							   ,.rxcommadeten_in                         (rxcommadeten_int)
							   ,.rxmcommaalignen_in                      (rxmcommaalignen_int)
							   ,.rxpcommaalignen_in                      (rxpcommaalignen_int)
							   ,.rxslide_in                              (rxslide_int)
							   ,.tx8b10ben_in                            (tx8b10ben_int)
							   ,.txctrl0_in                              (txctrl0_int)
							   ,.txctrl1_in                              (txctrl1_int)
							   ,.txctrl2_in                              (txctrl2_int)
							   ,.gtpowergood_out                         (gtpowergood_int)
							   ,.rxbyteisaligned_out                     (rxbyteisaligned_int)
							   ,.rxbyterealign_out                       (rxbyterealign_int)
							   ,.rxcommadet_out                          (rxcommadet_int)
							   ,.rxctrl0_out                             (rxctrl0_int)
							   ,.rxctrl1_out                             (rxctrl1_int)
							   ,.rxctrl2_out                             (rxctrl2_int)
							   ,.rxctrl3_out                             (rxctrl3_int)
							   ,.rxpmaresetdone_out                      (rxpmaresetdone_int)
							   ,.txpmaresetdone_out                      (txpmaresetdone_int)
							   ,.txprgdivresetdone_out                   (txprgdivresetdone_int)
							   );


endmodule

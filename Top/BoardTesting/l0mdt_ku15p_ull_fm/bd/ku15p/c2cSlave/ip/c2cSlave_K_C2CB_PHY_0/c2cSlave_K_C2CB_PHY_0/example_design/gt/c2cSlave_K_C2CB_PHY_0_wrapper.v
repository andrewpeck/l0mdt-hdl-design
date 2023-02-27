 ///////////////////////////////////////////////////////////////////////////////
 //
 // Project:  Aurora 64B/66B
 // Company:  Xilinx
 //
 //
 //
 // (c) Copyright 2008 - 2014 Xilinx, Inc. All rights reserved.
 //
 // This file contains confidential and proprietary information
 // of Xilinx, Inc. and is protected under U.S. and
 // international copyright and other intellectual property
 // laws.
 //
 // DISCLAIMER
 // This disclaimer is not a license and does not grant any
 // rights to the materials distributed herewith. Except as
 // otherwise provided in a valid license issued to you by
 // Xilinx, and to the maximum extent permitted by applicable
 // law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
 // WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
 // AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
 // BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
 // INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
 // (2) Xilinx shall not be liable (whether in contract or tort,
 // including negligence, or under any other theory of
 // liability) for any loss or damage of any kind or nature
 // related to, arising under or in connection with these
 // materials, including for any direct, or any indirect,
 // special, incidental, or consequential loss or damage
 // (including loss of data, profits, goodwill, or any type of
 // loss or damage suffered as a result of any action brought
 // by a third party) even if such damage or loss was
 // reasonably foreseeable or Xilinx had been advised of the
 // possibility of the same.
 //
 // CRITICAL APPLICATIONS
 // Xilinx products are not designed or intended to be fail-
 // safe, or for use in any application requiring fail-safe
 // performance, such as life-support or safety devices or
 // systems, Class III medical devices, nuclear facilities,
 // applications related to the deployment of airbags, or any
 // other applications that could lead to death, personal
 // injury, or severe property or environmental damage
 // (individually and collectively, "Critical
 // Applications"). Customer assumes the sole risk and
 // liability of any use of Xilinx products in Critical
 // Applications, subject only to applicable laws and
 // regulations governing limitations on product liability.
 //
 // THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
 // PART OF THIS FILE AT ALL TIMES.

 //
 //
 ////////////////////////////////////////////////////////////////////////////////
 // Design Name: c2cSlave_K_C2CB_PHY_0_WRAPPER
 //
 // Module c2cSlave_K_C2CB_PHY_0_WRAPPER

 // This is V8/K8 wrapper

 `timescale 1ns / 1ps
   (* core_generation_info = "c2cSlave_K_C2CB_PHY_0,aurora_64b66b_v12_0_3,{c_aurora_lanes=1,c_column_used=left,c_gt_clock_1=GTHQ0,c_gt_clock_2=None,c_gt_loc_1=1,c_gt_loc_10=X,c_gt_loc_11=X,c_gt_loc_12=X,c_gt_loc_13=X,c_gt_loc_14=X,c_gt_loc_15=X,c_gt_loc_16=X,c_gt_loc_17=X,c_gt_loc_18=X,c_gt_loc_19=X,c_gt_loc_2=X,c_gt_loc_20=X,c_gt_loc_21=X,c_gt_loc_22=X,c_gt_loc_23=X,c_gt_loc_24=X,c_gt_loc_25=X,c_gt_loc_26=X,c_gt_loc_27=X,c_gt_loc_28=X,c_gt_loc_29=X,c_gt_loc_3=X,c_gt_loc_30=X,c_gt_loc_31=X,c_gt_loc_32=X,c_gt_loc_33=X,c_gt_loc_34=X,c_gt_loc_35=X,c_gt_loc_36=X,c_gt_loc_37=X,c_gt_loc_38=X,c_gt_loc_39=X,c_gt_loc_4=X,c_gt_loc_40=X,c_gt_loc_41=X,c_gt_loc_42=X,c_gt_loc_43=X,c_gt_loc_44=X,c_gt_loc_45=X,c_gt_loc_46=X,c_gt_loc_47=X,c_gt_loc_48=X,c_gt_loc_5=X,c_gt_loc_6=X,c_gt_loc_7=X,c_gt_loc_8=X,c_gt_loc_9=X,c_lane_width=4,c_line_rate=5.0,c_gt_type=GTHE4,c_qpll=false,c_nfc=false,c_nfc_mode=IMM,c_refclk_frequency=200.0,c_simplex=false,c_simplex_mode=TX,c_stream=true,c_ufc=false,c_user_k=false,flow_mode=None,interface_mode=Streaming,dataflow_config=Duplex}" *)
(* DowngradeIPIdentifiedWarnings="yes" *)
 module c2cSlave_K_C2CB_PHY_0_WRAPPER #
 (
      parameter INTER_CB_GAP  = 5'd9,
      parameter SEQ_COUNT  = 4,
    parameter wait_for_fifo_wr_rst_busy_value = 6'd32,
      parameter TRAVELLING_STAGES = 3'd2,
      parameter BACKWARD_COMP_MODE1 = 1'b0, //disable check for interCB gap
      parameter BACKWARD_COMP_MODE2 = 1'b0, //reduce RXCDR lock time, Block Sync SH max count, disable CDR FSM in wrapper
      parameter BACKWARD_COMP_MODE3 = 1'b0, //clear hot-plug counter with any valid btf detected
     // Channel bond MASTER/SLAVE connection
      parameter CHAN_BOND_MODE_0      = 2'b00,
      parameter CHAN_BOND_MODE_1      = 2'b00,
 // Simulation attributes
     parameter   EXAMPLE_SIMULATION   =   0            // Set to 1 to speed up sim reset
 )
 `define DLY #1
 (

 
    //----------------- Receive Ports - Channel Bonding Ports -----------------
       ENCHANSYNC_IN,

       CHBONDDONE_OUT,
     //RXLOSSOFSYNC indication
       RXLOSSOFSYNC_OUT,
 //----------------- Receive Ports - Clock Correction Ports -----------------
       RXBUFERR_OUT,
     //----------------- Receive Ports - RX Data Path interface -----------------
       RXDATA_OUT,
       RXHEADER_OUT,
       RXRESET_IN,
       RXUSRCLK2_IN,
     //----- Receive Ports - RX Driver,OOB signalling,Coupling and Eq.,CDR ------
       RX1N_IN,
       RX1P_IN,
     //--------------- Receive Ports - RX Polarity Control Ports ----------------
       CHECK_POLARITY_IN,
       RXPOLARITY_IN,
       RX_NEG_OUT,
 //------------------- Shared Ports - Tile and PLL Ports --------------------
       REFCLK1_IN,

       GTXRESET_IN,
       RESET,
       GT_RXCDROVRDEN_IN,

       CHAN_BOND_RESET,

       PLLLKDET_OUT,

       POWERDOWN_IN,

       TXOUTCLK1_OUT,
     //-------------- Transmit Ports - 64b66b TX Header Ports --------------
       TXHEADER_IN,
       //---------------- Transmit Ports - TX Data Path interface -----------------
       TXDATA_IN,
       TXRESET_IN,

       TXUSRCLK_IN,//
       TXUSRCLK2_IN,//
       //txusrclk_out,
       //txusrclk2_out,

       TXBUFERR_OUT,
       //--------------Data Valid Signals for Local Link
       TXDATAVALID_OUT,
       TXDATAVALID_SYMGEN_OUT,

       RXDATAVALID_OUT,
     //------------- Transmit Ports - TX Driver and OOB signalling --------------
       TX1N_OUT,
       TX1P_OUT,
    //---------------------- Loopback Port ----------------------
       LOOPBACK_IN,
    //---------------------- GTXE2 CHANNEL DRP Ports ----------------------
       DRP_CLK_IN,
       CHANNEL_UP_RX_IF,
       CHANNEL_UP_TX_IF,
//---{

//---}
       gt0_drpaddr,
       gt0_drpdi,
       gt0_drpdo,
       gt0_drprdy,
       gt0_drpen,
       gt0_drpwe,


       gt_rxusrclk_out,
       //------------------------ RX Margin Analysis Ports ------------------------
       GT_eyescandataerror,
       GT_eyescanreset,
       GT_eyescantrigger,
       //------------------- Receive Ports - RX Equalizer Ports -------------------
       GT_rxcdrhold   ,
       GT_rxdfelpmreset,
       GT_rxlpmen,
       //---------------------- TX Configurable Driver Ports ----------------------
       GT_txpostcursor,
       GT_txdiffctrl,
       gt_txprecursor,
       //--------------- Transmit Ports - TX Polarity Control Ports ---------------
       GT_txpolarity,
       gt_txinhibit,
       gt_pcsrsvdin,
       gt_RXPMARESET,
       gt_rxrate,
       gt_txpmareset,
       gt_txpcsreset,
       gt_rxpcsreset,// MAS
       gt_rxbufreset,
       gt_rxpmaresetdone,
       gt_txprbssel   ,
       gt_rxprbssel   ,
       gt_txprbsforceerr   ,
       gt_rxprbserr    ,
       gt_rxprbscntreset   ,
       gt_dmonitorout    ,
       gt_txbufstatus,
       gt_txresetdone,
       gt_rxresetdone,
       gt_rxbufstatus,
       gt_cplllock,

       gt_powergood,




       //TXCLK_LOCK,
       INIT_CLK,
       USER_CLK,
       FSM_RESETDONE,
       LINK_RESET_OUT,
       bufg_gt_clr_out, // connect to clk_locked port of clocking module
       gtwiz_userclk_tx_active_out// connect to mmcm not locked of clocking module
 );
 //***************************** Port Declarations *****************************


     //---------------------- Loopback and Powerdown Ports ----------------------
     input    [2:0]      LOOPBACK_IN;
     input               CHANNEL_UP_RX_IF;
     input               CHANNEL_UP_TX_IF;
     //----------------- Receive Ports - Channel Bonding Ports -----------------
     //----------------- Receive Ports - Channel Bonding Ports -----------------
       input             ENCHANSYNC_IN;
       output            CHBONDDONE_OUT;
       output            RXLOSSOFSYNC_OUT;
     //----------------- Receive Ports - Clock Correction Ports -----------------
       output            RXBUFERR_OUT;
     //----------------- Receive Ports - RX Data Path interface -----------------
       output   [63:0]   RXDATA_OUT;
       output   [1:0]    RXHEADER_OUT;
       input             RXRESET_IN;
     input               RXUSRCLK2_IN;
     //----- Receive Ports - RX Driver,OOB signalling,Coupling and Eq.,CDR ------
       input             RX1N_IN;
       input             RX1P_IN;
     //--------------- Receive Ports - RX Polarity Control Ports ----------------
       input             CHECK_POLARITY_IN;
       input             RXPOLARITY_IN;
       output reg        RX_NEG_OUT;
     //------------------- Shared Ports - Tile and PLL Ports --------------------
       input               REFCLK1_IN;
       input               GTXRESET_IN;
       input               CHAN_BOND_RESET;
       output            PLLLKDET_OUT;
       output            TXOUTCLK1_OUT;
       input               POWERDOWN_IN;
       input               RESET;
       input               GT_RXCDROVRDEN_IN;
     //-------------- Transmit Ports - TX Header Control Port ----------------
       input    [1:0]    TXHEADER_IN;
     //---------------- Transmit Ports - TX Data Path interface -----------------
       input    [63:0]   TXDATA_IN;
       input             TXRESET_IN;
       output            TXBUFERR_OUT;
     input               TXUSRCLK_IN;//
     input               TXUSRCLK2_IN;//
     //output              txusrclk_out;//
     //output              txusrclk2_out;//
     //------------- Transmit Ports - TX Driver and OOB signalling --------------
       output            TX1N_OUT;
       output            TX1P_OUT;
     output              TXDATAVALID_OUT;
     output              TXDATAVALID_SYMGEN_OUT;
       output            RXDATAVALID_OUT;
    //---------------------- GTXE2 CHANNEL DRP Ports ----------------------
     input             DRP_CLK_IN;
//---{


//---}
 
       input   [9:0]   gt0_drpaddr;
       input   [15:0]  gt0_drpdi;
       output  [15:0]  gt0_drpdo;
       output          gt0_drprdy;
       input           gt0_drpen;
       input           gt0_drpwe;
       output                                          gt_rxusrclk_out;
       //------------------------ RX Margin Analysis Ports ------------------------
       output [0:0]         GT_eyescandataerror;
       input  [0:0]         GT_eyescanreset;
       input  [0:0]         GT_eyescantrigger;
       //------------------- Receive Ports - RX Equalizer Ports -------------------
       input  [0:0]         GT_rxcdrhold   ;
       input  [0:0]         GT_rxdfelpmreset;
       input  [0:0]         GT_rxlpmen;
       //---------------------- TX Configurable Driver Ports ----------------------
       input  [4:0]       GT_txpostcursor;
 
       input  [4:0]       GT_txdiffctrl;
       output [15:0]      gt_dmonitorout    ;
       input  [4:0]       gt_txprecursor;
       //--------------- Transmit Ports - TX Polarity Control Ports ---------------
       input  [0:0]         GT_txpolarity;
       input  [0:0]         gt_txinhibit;
       input  [15:0]  gt_pcsrsvdin;
       input  [0:0]         gt_RXPMARESET;
       input  [2:0]       gt_rxrate;
       input  [0:0]         gt_txpmareset;
       input  [0:0]         gt_txpcsreset;
       input  [0:0]         gt_rxpcsreset;// MAS
       input  [0:0]         gt_rxbufreset;

       output [0:0]         gt_rxpmaresetdone;

       input  [3:0]       gt_txprbssel   ;
       input  [3:0]       gt_rxprbssel   ;
       input  [0:0]         gt_txprbsforceerr   ;
       input  [0:0]         gt_rxprbscntreset   ;
       output [0:0]         gt_rxprbserr    ;
       output [1:0]       gt_txbufstatus;
       output [2:0]       gt_rxbufstatus;

       output [0:0]           gt_txresetdone;
       output [0:0]           gt_rxresetdone;
       output [0:0]           gt_cplllock;

       output [0:0]           gt_powergood;



     //input             TXCLK_LOCK;
     input             INIT_CLK;
	 input             USER_CLK;
     output   reg      LINK_RESET_OUT;
     output   wire      FSM_RESETDONE;
     output            bufg_gt_clr_out; // connect to clocking module
     input             gtwiz_userclk_tx_active_out;// connect to clocking module

 //***************************** FIFO Watermark settings ************************
     localparam LOW_WATER_MARK_SLAVE  = 13'd450;
     localparam LOW_WATER_MARK_MASTER = 13'd450;

     localparam HIGH_WATER_MARK_SLAVE  = 13'd8;
     localparam HIGH_WATER_MARK_MASTER = 13'd14;

     localparam SH_CNT_MAX   = EXAMPLE_SIMULATION ? 16'd64 : (BACKWARD_COMP_MODE2) ? 16'd64 : 16'd60000;

     localparam SH_INVALID_CNT_MAX = 16'd16;
 //***************************** Wire Declarations *****************************
     // Ground and VCC signals
     wire                    tied_to_ground_i;
     wire    [280:0]          tied_to_ground_vec_i;

     // floating input port connection signals
       wire [2:0]       int_gt_rxbufstatus = gt_rxbufstatus ;
       wire [1:0]       int_gt_txbufstatus = gt_txbufstatus ;
     //  wire to output lock signal
       wire                    tx_plllkdet_i;
       wire                    rx_plllkdet_i;

     // Electrical idle reset logic signals
     wire                    resetdone_i;

     // Channel Bonding
       wire     [4:0]          chbondi;

     wire     [4:0]          chbondi_unused_i;
     wire     [4:0]          chbondo_to_slaves_i;
     wire                    state;
     wire  [6:0]             txsequence_i;

     reg   [6:0]             txseq_counter_i;
     wire                    data_valid_i;
     reg   [2:0]             extend_reset_r;
     reg                     resetdone_r1;
     reg                     resetdone_r2;
     reg                     resetdone_r3;
     reg                     reset_r1;
     reg                     reset_r2;
     reg                     rx_reset_r1;
     reg                     rx_reset_r2;
     reg   [3:0]             reset_debounce_r;
     reg                     data_valid_r;
              reg      FSM_RESETDONE_j;
     //reg   [63:0]            pmaInitStage = 64'd0;
       wire  [1:0]             txheader_i;
       wire  [63:0]            scrambled_data_i;

(* shift_extract = "{no}"*)     wire  [31:0]            pre_rxdata_from_gtx_i;
(* shift_extract = "{no}"*)     wire  [1:0]             pre_rxheader_from_gtx_i;
(* shift_extract = "{no}"*)     wire                    pre_rxdatavalid_i;
(* shift_extract = "{no}"*)     wire                    pre_rxheadervalid_i;

(* shift_extract = "{no}"*)     reg   [31:0]            pre_r1_rxdata_from_gtx_i;
(* shift_extract = "{no}"*)     reg   [1:0]             pre_r1_rxheader_from_gtx_i;
(* shift_extract = "{no}"*)     reg                     pre_r1_rxdatavalid_i;
(* shift_extract = "{no}"*)     reg                     pre_r1_rxheadervalid_i;

(* shift_extract = "{no}"*)     reg   [31:0]            pre_r2_rxdata_from_gtx_i;
(* shift_extract = "{no}"*)     reg   [1:0]             pre_r2_rxheader_from_gtx_i;
(* shift_extract = "{no}"*)     reg                     pre_r2_rxdatavalid_i;
(* shift_extract = "{no}"*)     reg                     pre_r2_rxheadervalid_i;

(* shift_extract = "{no}"*)     reg   [31:0]            pre_r3_rxdata_from_gtx_i;
(* shift_extract = "{no}"*)     reg   [1:0]             pre_r3_rxheader_from_gtx_i;
(* shift_extract = "{no}"*)     reg                     pre_r3_rxdatavalid_i;
(* shift_extract = "{no}"*)     reg                     pre_r3_rxheadervalid_i;

(* shift_extract = "{no}"*)     reg   [31:0]            pre_r4_rxdata_from_gtx_i;
(* shift_extract = "{no}"*)     reg   [1:0]             pre_r4_rxheader_from_gtx_i;
(* shift_extract = "{no}"*)     reg                     pre_r4_rxdatavalid_i;
(* shift_extract = "{no}"*)     reg                     pre_r4_rxheadervalid_i;

(* shift_extract = "{no}"*)     reg   [31:0]            pos_rxdata_from_gtx_i;
(* shift_extract = "{no}"*)     reg   [1:0]             pos_rxheader_from_gtx_i;
(* shift_extract = "{no}"*)     reg                     pos_rxdatavalid_i;
(* shift_extract = "{no}"*)     reg                     pos_rxheadervalid_i;
(* shift_extract = "{no}"*)     reg   [31:0]            rxdata_from_gtx_i;
(* shift_extract = "{no}"*)     reg   [1:0]             rxheader_from_gtx_i;
(* shift_extract = "{no}"*)     reg                     rxdatavalid_i;
(* shift_extract = "{no}"*)     reg                     rxheadervalid_i;

       wire                    rxgearboxslip_i;
       wire                    open_rxheader_i;
       wire                    rxlossofsync_out_i;
       reg                     rxlossofsync_out_q;
       wire  [31:0]            rxdata_to_fifo_i;
       wire                    rxrecclk_from_gtx_i;
       wire  [0:6]             not_connected_i;

       wire sync_rx_polarity_r;
       wire [0:0] sync_rx_polarity_r_j;
wire check_polarity_r2;
wire      gtpll_locked_out_r2;
     reg                     reset_blocksync_r;
     reg                    new_gtx_rx_pcsreset_comb = 1'b1;

// (* KEEP = "TRUE" *) wire    rxrecclk_to_fabric_i;
   (* KEEP = "TRUE" *) wire    rxfsm_reset_i;//
     wire                    clkfbout_i;

     wire                    locked_i;
     wire                    gtx_rx_pcsreset_comb;
     wire   enable_32_i = 1'b1;

     wire                    gtpll_locked_out_i;
     wire                    gt_qplllock_quad1_i;
     wire                    gt_qplllock_quad2_i;
     wire                    gt_qplllock_quad3_i;
     wire                    gt_qplllock_quad4_i;
     wire                    gt_qplllock_quad5_i;
     wire                    txusrclk_gtx_reset_comb;
     wire                    stableclk_gtx_reset_comb;
     wire                    gtx_reset_comb;
       reg   [1:0]             txheader_r;
       reg   [1:0]             tx_hdr_r;
      reg [1:0] cdr_reset_fsm_r = 2'd0;
      reg [7:0] cdr_reset_fsm_cntr_r = 8'd0;
      reg allow_block_sync_propagation = 1'b0;
      reg cdr_reset_fsm_lnkreset = 1'b0;
      localparam IDLE = 2'b00;
      localparam ASSERT_RXRESET = 2'b01;
      localparam DONE = 2'b10;

     wire allow_block_sync_propagation_inrxclk;
     wire blocksync_all_lanes_instableclk;
     wire                    blocksync_out_i;
     wire blocksync_all_lanes_inrxclk;
     reg  blocksync_all_lanes_inrxclk_q = 1'b0;
     wire hpreset_or_pma_init_in;
     wire hpreset_in;
     wire hp_reset_i;
       wire  [1:0]             rxbuferr_out_i;
     wire  [1:0]             link_reset_0_c;
     wire                    link_reset_c;
//-------------------------------------------------
                                    wire                   gt_cplllock_i;
                                    wire                   gt_cpllrefclklost_i;
                                    wire [0:0] gt_cplllock_j;
     wire                    gtxreset_i;
       reg                    rxdatavalid_to_fifo_i;
       reg  [1:0]             rxheader_to_fifo_i;
     wire                      tied_to_vcc_i;
     reg    [7:0]              reset_counter = 8'd0;
     (* KEEP = "TRUE" *) wire  rx_fsm_resetdone_i;
     (* KEEP = "TRUE" *) wire  tx_fsm_resetdone_i;
     (* KEEP = "TRUE" *) wire  rx_fsm_resetdone_ii;
     (* KEEP = "TRUE" *) wire  tx_fsm_resetdone_ii;
	 wire                    rx_fsm_resetdone_i_i;
	 wire                    tx_fsm_resetdone_i_i;
	 wire                    rx_fsm_resetdone_i_j;
	 wire                    tx_fsm_resetdone_i_j;

     wire                    gttxreset_t;
//     wire                    txuserrdy_t;
//     wire                    rxuserrdy_t;
     wire                    cpllreset_t;
     wire                    qpllreset_t;
     wire                    qpllrefclklost_i;
     wire                    cpllrefclklost_i;
     wire [0:0]  tx_resetdone_j;
     wire [0:0]  rx_resetdone_j;
     wire                    mmcm_reset_i;
     wire                    enchansync_all_i;
     wire                    txreset_for_lanes;
     wire                    rxreset_for_lanes;
     reg                     rxreset_for_lanes_q;
     wire                    HPCNT_RESET_IN;
     wire                    sys_and_fsm_reset_for_hpcnt;

// Common CBCC Reset module wires
     wire                    cbcc_fifo_reset_wr_clk;
     wire                    cbcc_fifo_reset_to_fifo_wr_clk;
     wire                    cbcc_data_srst;
     wire                    cbcc_fifo_reset_rd_clk;
     wire                    cbcc_fifo_reset_to_fifo_rd_clk;
     wire                    cbcc_only_reset_rd_clk;
     wire                    cbcc_reset_cbstg2_rd_clk;
// Common Logic for CBCC module reg/wires
     wire                    any_vld_btf_i;
     wire                    start_cb_writes_i;
(* KEEP = "TRUE" *) wire     do_rd_en_i;
(* KEEP = "TRUE" *) wire     bit_err_chan_bond_i;
(* KEEP = "TRUE" *) wire     final_gater_for_fifo_din_i;
(* KEEP = "TRUE" *) wire      all_start_cb_writes_i  ;
(* KEEP = "TRUE" *) wire      master_do_rd_en_i      ;
(* KEEP = "TRUE" *) wire      all_vld_btf_flag_i     ;

     wire  cb_bit_err_i;

     wire fsm_resetdone_to_new_gtx_rx_comb;

     wire  rxusrclk_out;
     assign gt_rxusrclk_out = rxusrclk_out;
 //********************************* Main Body of Code**************************
 // For GT Assignment

          assign gt_cplllock_ii = gt_cplllock_j[0];
  //Clocking onto the INIT-clock.
c2cSlave_K_C2CB_PHY_0_cdc_sync
   # (
      .c_cdc_type    (1),  // 0 Pulse synchronizer, 1 level synchronizer 2 level synchronizer with ACK 
      .c_flop_input  (0),  // 1 Adds one flop stage to the input prmry_in signal
      .c_reset_state (0),  // 1 Reset needed for sync flops 
      .c_single_bit  (1),  // 1 single bit input.
      .c_mtbf_stages (5)   // Number of sync stages needed
     )   u_cdc_gt_cplllock_i
     (
       .prmry_aclk      (1'b0),
       .prmry_rst_n     (1'b1 ),
       .prmry_in        (gt_cplllock_ii),
       .prmry_vect_in   (32'd0 ),
       .scndry_aclk     (INIT_CLK ),
       .scndry_rst_n    (1'b1 ),
       .prmry_ack       ( ),
       .scndry_out      (gt_cplllock_i),
       .scndry_vect_out ( )
      );

    assign sync_rx_polarity_r_j = {
           sync_rx_polarity_r
                             };


     //-------------------------  Static signal Assigments ---------------------
     assign tied_to_ground_i             = 1'b0;
     assign tied_to_ground_vec_i         = 281'h0;
     assign tied_to_vcc_i                = 1'b1;

//------------------------------------------------------------------------------
// Assign lock signals
                assign  PLLLKDET_OUT  =
                                                 gt_cplllock_i
                                                 &
                                                 mmcm_reset_i;
//------------------------------------------------------------------------------
        wire rx_elastic_buf_err;
        wire rx_elastic_buf_err_int = 1'b0
                                  || int_gt_rxbufstatus [2]
         ;
c2cSlave_K_C2CB_PHY_0_cdc_sync
   # (
      .c_cdc_type    (1),  // 0 Pulse synchronizer, 1 level synchronizer 2 level synchronizer with ACK 
      .c_flop_input  (1),  // 1 Adds one flop stage to the input prmry_in signal
      .c_reset_state (0),  // 1 Reset needed for sync flops 
      .c_single_bit  (1),  // 1 single bit input.
      .c_mtbf_stages (5)   // Number of sync stages needed
     )   u_cdc_rx_elastic_buferr
     (
       .prmry_aclk      (rxusrclk_out),
       .prmry_rst_n     (1'b1 ),
       .prmry_in        (rx_elastic_buf_err_int),
       .prmry_vect_in   (32'd0 ),
       .scndry_aclk     (USER_CLK ),
       .scndry_rst_n    (1'b1 ),
       .prmry_ack       ( ),
       .scndry_out      (rx_elastic_buf_err),
       .scndry_vect_out ( )
      );
     wire rx_hard_err_usr;
                assign  RXBUFERR_OUT  = rxbuferr_out_i[1] || rxbuferr_out_i[0] || rx_elastic_buf_err;
        assign rx_hard_err_usr = 1'b0
                                || RXBUFERR_OUT
         ;
//------------------------------------------------------------------------------
        wire tx_elastic_buf_err = 1'b0
                                  || int_gt_txbufstatus [1]
;
     wire tx_hard_err_usr;
        // TXBUFERR_OUT ports are not used & are tied to ground
        assign  TXBUFERR_OUT  =  tx_elastic_buf_err;
        assign tx_hard_err_usr = 1'b0
                                || TXBUFERR_OUT
        ;
  // Logic to infer hard error
  reg hard_err_usr = 0;
  wire hard_err_init_sync;
  always @(posedge USER_CLK)
  begin
    hard_err_usr <= (tx_hard_err_usr && CHANNEL_UP_TX_IF) || (rx_hard_err_usr && CHANNEL_UP_RX_IF);
  end
c2cSlave_K_C2CB_PHY_0_cdc_sync
   # (
      .c_cdc_type    (1),  // 0 Pulse synchronizer, 1 level synchronizer 2 level synchronizer with ACK 
      .c_flop_input  (0),  // 1 Adds one flop stage to the input prmry_in signal
      .c_reset_state (0),  // 1 Reset needed for sync flops 
      .c_single_bit  (1),  // 1 single bit input.
      .c_mtbf_stages (5)   // Number of sync stages needed
     )   u_cdc_hard_err_init
     (
       .prmry_aclk      (1'b0),
       .prmry_rst_n     (1'b1 ),
       .prmry_in        (hard_err_usr),
       .prmry_vect_in   (32'd0 ),
       .scndry_aclk     (INIT_CLK ),
       .scndry_rst_n    (1'b1 ),
       .prmry_ack       ( ),
       .scndry_out      (hard_err_init_sync),
       .scndry_vect_out ( )
      );
    
     reg [7:0]  hard_err_cntr_r = 8'd0;
     reg        hard_err_rst_int;
     
     always @(posedge INIT_CLK)
     begin
       if(HPCNT_RESET_IN)
       begin
         hard_err_cntr_r <= 8'd0;
         hard_err_rst_int <= 1'b0;
       end
       else if(hard_err_init_sync || (|hard_err_cntr_r))
       begin
         if(&hard_err_cntr_r)
           hard_err_cntr_r <= hard_err_cntr_r;
         else
           hard_err_cntr_r <= hard_err_cntr_r + 1'b1;
         
         if((hard_err_cntr_r > 8'h03) & (hard_err_cntr_r < 8'hFD))
           hard_err_rst_int <= 1'b1;
         else
           hard_err_rst_int <= 1'b0;

       end
     end

//------------------------------------------------------------------------------
     // Channel Bonding
   assign  chbondi_unused_i  = 5'b0;
//------------------------------------------------------------------------------
                        assign  chbondi = chbondi_unused_i;
//------------------------------------------------------------------------------
                assign gt_txresetdone = tx_resetdone_j;
                assign gt_rxresetdone = rx_resetdone_j;
//------------------------------------------------------------------------------
// below synchronizers are needed for synchronizing the xx_fsm_resetdone in user clock domain
    //----------------------------------------
    // rx_fsm_resetdone_i sychronized on user_clock
     c2cSlave_K_C2CB_PHY_0_rst_sync # 
     ( 
         .c_mtbf_stages (3) 
     )u_rst_done_sync_rx 
     ( 
         .prmry_in     (rx_fsm_resetdone_i), 
         .scndry_aclk  (USER_CLK), 
         .scndry_out   (rx_fsm_resetdone_i_i) 
     ); 
    //----------------------------------------
    // rx_fsm_resetdone_i sychronized on rxusrclk_out
	 c2cSlave_K_C2CB_PHY_0_rst_sync # 
     ( 
         .c_mtbf_stages (3) 
     )u_rst_done_sync_rx1 
    ( 
         .prmry_in     (rx_fsm_resetdone_i), 
         .scndry_aclk  (rxusrclk_out), 
         .scndry_out   (rx_fsm_resetdone_i_j) 
     );
    //----------------------------------------
    // tx_fsm_resetdone_i sychronized on user_clock
	c2cSlave_K_C2CB_PHY_0_rst_sync # 
     ( 
         .c_mtbf_stages (3) 
     )u_rst_done_sync_tx 
     ( 
         .prmry_in     (tx_fsm_resetdone_i), 
         .scndry_aclk  (USER_CLK), 
         .scndry_out   (tx_fsm_resetdone_i_i) 
     ); 
    //----------------------------------------
    // tx_fsm_resetdone_i sychronized on rxusrclk_out
    c2cSlave_K_C2CB_PHY_0_rst_sync # 
    ( 
        .c_mtbf_stages (3) 
    )u_rst_done_sync_tx1 
    ( 
        .prmry_in     (tx_fsm_resetdone_i), 
        .scndry_aclk  (rxusrclk_out), 
        .scndry_out   (tx_fsm_resetdone_i_j) 
    ); 
    //----------------------------------------
//------------------------------------------------------------------------------
        // Assumption: TR/RX Reset Done are static and will remain active once activated
        assign FSM_RESETDONE   = tx_fsm_resetdone_i_i & rx_fsm_resetdone_i_i;
		assign FSM_RESETDONE_i = tx_fsm_resetdone_i_j & rx_fsm_resetdone_i_j;
        always @(posedge USER_CLK) begin
            FSM_RESETDONE_j <= `DLY FSM_RESETDONE;
        end
//------------------------------------------------------------------------------

c2cSlave_K_C2CB_PHY_0_rst_sync u_rst_sync_txusrclk_gtx_reset_comb
    (
      .prmry_in         (txusrclk_gtx_reset_comb),
      .scndry_aclk      (INIT_CLK),
      .scndry_out       (stableclk_gtx_reset_comb)
    );

c2cSlave_K_C2CB_PHY_0_rst_sync u_rst_sync_gtx_reset_comb
    (
      .prmry_in         (stableclk_gtx_reset_comb),
      .scndry_aclk      (TXUSRCLK2_IN),
      .scndry_out       (gtx_reset_comb)
    );
//------------------------------------------------------------------------------

     //------------------------- External Sequence Counter--------------------------
     //always @(TXUSRCLK2_IN)//
     always @(posedge TXUSRCLK2_IN)
     begin
         if(gtx_reset_comb)
             txseq_counter_i <=  `DLY  7'd0;
         else if(txseq_counter_i == 32)
             txseq_counter_i <=  `DLY  7'd0;
         else
             txseq_counter_i <=  `DLY txseq_counter_i + 7'd1;
     end

     //Assign the Data Valid signal
     assign TXDATAVALID_OUT           = (txseq_counter_i != 28);

     //Assign TXDATAVALID to sym gen by accounting for the latency
     assign TXDATAVALID_SYMGEN_OUT    = (txseq_counter_i != 30);

     //_______________________________ Data Valid Signal ____ ________________________
     assign data_valid_i = (txseq_counter_i != 31);
     assign txsequence_i = txseq_counter_i;





       assign gtpll_locked_out_i = (gt_cplllock_i) ;
//------------------------------------------------------------------------------
       assign gtpll_locked_out_r2 = gtpll_locked_out_i;
//------------------------------------------------------------------------------
//------------------------------------------------------------------------------



//------------------------------------------------------------------------------
     // qualifying the reset from gtx_rx_pcsreset_comb  with !FSM_RESETDONE to
     // avoid X propagation

     c2cSlave_K_C2CB_PHY_0_rst_sync u_rst_sync_fsm_resetdone
     (
         .prmry_in(FSM_RESETDONE_j),
         .scndry_aclk           (rxusrclk_out), // (rxrecclk_to_fabric_i),
         .scndry_out            (fsm_resetdone_to_new_gtx_rx_comb)

     );

     //-- logical oring of incoming rx reset in signal for no. of lanes
     assign rxreset_for_lanes = RXRESET_IN;
     
	 //--ored rx_reset_in signal is taken in  the recovered rx clock
     always @(posedge RXUSRCLK2_IN)
     begin
         rxreset_for_lanes_q <= `DLY rxreset_for_lanes;
     end

     //-- added synchronizer
	 wire fsm_resetdone_to_rxreset_in;

     c2cSlave_K_C2CB_PHY_0_rst_sync u_rst_sync_rxreset_in
     (
         .prmry_in              (rxreset_for_lanes_q),
         .scndry_aclk           (rxusrclk_out),
         .scndry_out            (fsm_resetdone_to_rxreset_in)

     );
     //--

   always @(posedge rxusrclk_out)//always @(posedge rxrecclk_to_fabric_i)
   begin
      new_gtx_rx_pcsreset_comb <=  gtx_rx_pcsreset_comb 
	                            | (!fsm_resetdone_to_new_gtx_rx_comb) 
                                | fsm_resetdone_to_rxreset_in ;
   end



   assign  hpreset_or_pma_init_in = GTXRESET_IN | hpreset_in | hard_err_rst_int;
   assign  hpreset_in             = link_reset_0_c[0];

//------------------------------------------------------------------------------
     always @ (posedge TXUSRCLK2_IN)//always @ (posedge TXUSRCLK2_IN)
     begin
           tx_hdr_r   <= `DLY TXHEADER_IN;
     end

        assign txreset_for_lanes = TXRESET_IN;
//------------------------------------------------------------------------------

     always @ (posedge INIT_CLK)
          LINK_RESET_OUT <= `DLY 
                             cdr_reset_fsm_lnkreset |
                             link_reset_0_c[0] ;

  //Clocking onto the INIT-clock.
c2cSlave_K_C2CB_PHY_0_cdc_sync
   # (
      .c_cdc_type    (1),  // 0 Pulse synchronizer, 1 level synchronizer 2 level synchronizer with ACK 
      .c_flop_input  (0),  // 1 Adds one flop stage to the input prmry_in signal
      .c_reset_state (0),  // 1 Reset needed for sync flops 
      .c_single_bit  (1),  // 1 single bit input.
      .c_mtbf_stages (5)   // Number of sync stages needed
     )   u_cdc_tx_fsm_resetdone_i
     (
       .prmry_aclk      (1'b0),
       .prmry_rst_n     (1'b1 ),
       .prmry_in        (tx_fsm_resetdone_i),
       .prmry_vect_in   (32'd0 ),
       .scndry_aclk     (INIT_CLK ),
       .scndry_rst_n    (1'b1 ),
       .prmry_ack       ( ),
       .scndry_out      (tx_fsm_resetdone_ii),
       .scndry_vect_out ( )
      );
  //Clocking onto the INIT-clock.
c2cSlave_K_C2CB_PHY_0_cdc_sync
   # (
      .c_cdc_type    (1),  // 0 Pulse synchronizer, 1 level synchronizer 2 level synchronizer with ACK 
      .c_flop_input  (0),  // 1 Adds one flop stage to the input prmry_in signal
      .c_reset_state (0),  // 1 Reset needed for sync flops 
      .c_single_bit  (1),  // 1 single bit input.
      .c_mtbf_stages (5)   // Number of sync stages needed
     )   u_cdc_rx_fsm_resetdone_i
     (
       .prmry_aclk      (1'b0),
       .prmry_rst_n     (1'b1 ),
       .prmry_in        (rx_fsm_resetdone_i),
       .prmry_vect_in   (32'd0 ),
       .scndry_aclk     (INIT_CLK ),
       .scndry_rst_n    (1'b1 ),
       .prmry_ack       ( ),
       .scndry_out      (rx_fsm_resetdone_ii),
       .scndry_vect_out ( )
      );
assign mmcm_reset_i = tx_fsm_resetdone_ii & rx_fsm_resetdone_ii;

wire fabric_pcs_reset;
 assign txusrclk_gtx_reset_comb = fabric_pcs_reset;
//------------------------------------------------------------------------------
wire gtwiz_userclk_tx_active;
assign gtwiz_userclk_tx_active = !gtwiz_userclk_tx_active_out;
 //*************************************************************************************************
 //-----------------------------------GTX INSTANCE-----------------------------------------------
 //*************************************************************************************************
c2cSlave_K_C2CB_PHY_0_MULTI_GT  c2cSlave_K_C2CB_PHY_0_multi_gt_i
 (
         //---------------------------------------------------------------------
         //gtwix reset module interface ports starts
         //---------------------------------------------------------------------
		 .gtwiz_reset_all_in                       (GTXRESET_IN),

         .gtwiz_reset_clk_freerun_in               (INIT_CLK   ),

         .gtwiz_reset_tx_pll_and_datapath_in       (1'b0),

         .gtwiz_reset_tx_datapath_in               (1'b0),

         .gtwiz_reset_rx_pll_and_datapath_in       (GTXRESET_IN),
         .gtwiz_reset_rx_datapath_in               (rxfsm_reset_i),
         .gtwiz_reset_rx_data_good_in              (1'b1),

         .gtwiz_reset_rx_cdr_stable_out            (),
         .gtwiz_reset_tx_done_out                  (tx_fsm_resetdone_i),
         .gtwiz_reset_rx_done_out                  (rx_fsm_resetdone_i),
         //---------------------------------------------------------------------
         //gtwix reset module interface ports ends
         //---------------------------------------------------------------------

         .fabric_pcs_reset                     (fabric_pcs_reset            ),
         .bufg_gt_clr_out                      (bufg_gt_clr_out       ),// connect to clk_locked of clock module
         .gtwiz_userclk_tx_active_out          (gtwiz_userclk_tx_active_out ),// connect to mmcm not locked of clock module
         .userclk_rx_active_out                (gtx_rx_pcsreset_comb        ),



         //.gt0_cplllockdetclk_in            (INIT_CLK),
         //.gt0_cpllreset_in                 (GTXRESET_IN),  // (gt_cpllreset_i),

         //.gt0_cpllfbclklost_out            (),
         .gt_cplllock                              (gt_cplllock_j),
         //.gt0_cpllrefclklost_out           (gt_cpllrefclklost_i),

         // GT reference clock per channel, connect to REF clk - same as for GT Common
         //, only one gt ref clk is needed
         .gt0_gtrefclk0_in                 (REFCLK1_IN),// connect to same as GT common ref clock
         //.gt0_gtrefclk1_in                 (REFCLK1_IN),// connect to same as GT common ref clock
         //-------------------------- Channel - DRP Ports  --------------------------
         .gt0_drpaddr                  (gt0_drpaddr),
         .gt0_drp_clk_in               (INIT_CLK),
         .gt0_drpdi                    (gt0_drpdi),
         .gt0_drpdo                    (gt0_drpdo),
         .gt0_drpen                    (gt0_drpen),
         .gt0_drprdy                   (gt0_drprdy),
         .gt0_drpwe                    (gt0_drpwe),
    //----------------------------- Loopback Ports -----------------------------
    //------------------- RX Initialization and Reset Ports --------------------
         .gt0_rxusrclk_out                 (rxusrclk_out), //(rxrecclk_to_fabric_i),
         .gt0_rxusrclk2_out                (),//(keep it open --> rxusrclk2_out),//(rxrecclk_to_fabric_i),
    //---------------- Transmit Ports - FPGA TX Interface Ports ----------------
         .gt0_txusrclk_in                 (TXUSRCLK_IN), 
         .gt0_txusrclk2_in                (TXUSRCLK2_IN),
    //----------------------------- Loopback Ports -----------------------------
         .gt_loopback                             ({1{LOOPBACK_IN}}),

         //.gt0_rxuserrdy_in                 (rxuserrdy_t),
         .gt_rxpolarity                            (sync_rx_polarity_r_j),
         .gt0_rxdata_out                   (pre_rxdata_from_gtx_i),
         //---------------------- Receive Ports - RX AFE Ports ----------------------
         .gt0_gthrxn_in                    (RX1N_IN),
         .gt0_gthrxp_in                    (RX1P_IN),
         //------------- Receive Ports - RX Fabric Output Control Ports -------------
         .gt0_rxoutclk_out                 (rxrecclk_from_gtx_i),
         //-------------------- Receive Ports - RX Gearbox Ports --------------------
         .gt0_rxdatavalid_out              (pre_rxdatavalid_i),
         .gt0_rxheader_out                 (pre_rxheader_from_gtx_i),
         .gt0_rxheadervalid_out            (pre_rxheadervalid_i),
         //------------------- Receive Ports - RX Gearbox Ports  --------------------
         .gt0_rxgearboxslip_in             (rxgearboxslip_i),
        //----------- Receive Ports - RX Initialization and Reset Ports ------------
         .gt_gtrxreset                 ({1{GTXRESET_IN}}),
        //------------ Receive Ports -RX Initialization and Reset Ports ------------
         .gt_rxresetdone                (rx_resetdone_j),
        //------------------- TX Initialization and Reset Ports --------------------
         .gt_gttxreset                 ({1{GTXRESET_IN}}),

        //.gt0_txuserrdy_in                 (txuserrdy_t),//
        //------------ Transmit Ports - 64b66b and 64b67b Gearbox Ports ------------
         .gt0_txheader_in                  (tx_hdr_r),
        //---------------- Transmit Ports - TX Data Path interface -----------------
           .gt0_txdata_in                  (scrambled_data_i),
        //-------------- Transmit Ports - TX Driver and OOB signaling --------------
          .gt0_gthtxn_out                  (TX1N_OUT),
          .gt0_gthtxp_out                  (TX1P_OUT),
        //--------- Transmit Ports - TX Fabric Clock Output Control Ports ----------
          .gt0_txoutclk_out                (TXOUTCLK1_OUT),
          .gt0_txoutclkfabric_out          (),
          .gt0_txoutclkpcs_out             (),
        //------------------- Transmit Ports - TX Gearbox Ports --------------------
          .gt0_txsequence_in               (txsequence_i),
        //----------------------- Receive Ports - CDR Ports ------------------------
         .gt0_rxcdrovrden_in               (GT_RXCDROVRDEN_IN),

        // port list when Transceiver ports are enabled
         .gt_rxpmareset                   (gt_RXPMARESET),
         .gt_rxrate                       (gt_rxrate),
         .gt_txpmareset                   (gt_txpmareset ),
         .gt_txpcsreset                   (gt_txpcsreset ),
         .gt_rxpcsreset                   (gt_rxpcsreset ),
         .gt_rxbufreset                   (gt_rxbufreset ),
         .gt_rxpmaresetdone               (gt_rxpmaresetdone),
         .gt_txprbssel                    (gt_txprbssel        ),
         .gt_rxprbssel                    (gt_rxprbssel        ),
         .gt_txprbsforceerr               (gt_txprbsforceerr   ),
         .gt_rxprbserr                    (gt_rxprbserr        ),
         .gt_rxprbscntreset               (gt_rxprbscntreset   ),
         .gt_dmonitorout                  (gt_dmonitorout        ),
         .gt_txbufstatus                  (gt_txbufstatus        ),
        //------------------------ RX Margin Analysis Ports ------------------------
         .gt_eyescandataerror             (GT_eyescandataerror    ),
         .gt_eyescanreset                 (GT_eyescanreset   ),
         .gt_eyescantrigger               (GT_eyescantrigger   ),
        //------------------- Receive Ports - RX Equalizer Ports -------------------
         .gt_rxcdrhold                    (GT_rxcdrhold   ),
         .gt_rxdfelpmreset                (GT_rxdfelpmreset   ),
         .gt_rxlpmen                      (GT_rxlpmen   ),
        //---------------------- TX Configurable Driver Ports ----------------------
         .gt_txpostcursor                 (GT_txpostcursor   ),
         .gt_txdiffctrl                   (GT_txdiffctrl   ),
         .gt_txprecursor                  (gt_txprecursor   ),
        //--------------- Transmit Ports - TX Polarity Control Ports ---------------
         .gt_txpolarity                   (GT_txpolarity   ),
         .gt_txinhibit                    (gt_txinhibit   ),
         .gt_pcsrsvdin                    (gt_pcsrsvdin   ),

        //----------------- Receive Ports - RX Buffer Bypass Ports -----------------
         .gt_rxbufstatus                  (gt_rxbufstatus    ),
    //----------- GT POWERGOOD STATUS Port -----------
          .gt_powergood                   (gt_powergood),

        //----------- Transmit Ports - TX Initialization and Reset Ports -----------
          .gt_txresetdone             (tx_resetdone_j)

 );



                                assign gt_cplllock[0] = gt_cplllock_i;

    always @(posedge rxusrclk_out)//always @(posedge rxrecclk_to_fabric_i)//
    begin
        pre_r1_rxdata_from_gtx_i    <= `DLY  pre_rxdata_from_gtx_i    ;
        pre_r1_rxdatavalid_i        <= `DLY  pre_rxdatavalid_i        ;
    end

    always @(posedge rxusrclk_out)//always @(posedge rxrecclk_to_fabric_i)//
    begin
        if(pre_r1_rxdatavalid_i)
        begin
            pos_rxdata_from_gtx_i <= `DLY pre_r1_rxdata_from_gtx_i;
            pos_rxdatavalid_i     <= `DLY 1'b1;
        end
        else
        begin
            pos_rxdatavalid_i     <= `DLY 1'b0;
        end
    end

    always @(posedge rxusrclk_out)//always @(posedge rxrecclk_to_fabric_i)//
    begin
        pre_r1_rxheader_from_gtx_i    <= `DLY  pre_rxheader_from_gtx_i    ;
        pre_r1_rxheadervalid_i        <= `DLY  pre_rxheadervalid_i        ;
    end

    always @(posedge rxusrclk_out)//always @(posedge rxrecclk_to_fabric_i)//
    begin
        if(pre_r1_rxheadervalid_i)
        begin
            pos_rxheader_from_gtx_i <= `DLY pre_r1_rxheader_from_gtx_i;
            pos_rxheadervalid_i     <= `DLY 1'b1;
        end
        else
        begin
            pos_rxheadervalid_i     <= `DLY 1'b0;
        end
    end


    //---- Final stage of posedge flop -----
    always @(posedge rxusrclk_out)//always @(posedge rxrecclk_to_fabric_i)//
    begin
        rxdata_from_gtx_i            <= `DLY  pos_rxdata_from_gtx_i;
        rxdatavalid_i                <= `DLY  pos_rxdatavalid_i;
        rxheader_from_gtx_i          <= `DLY  pos_rxheader_from_gtx_i;
        rxheadervalid_i              <= `DLY  pos_rxheadervalid_i;
    end

 // Common_reset_cbcc module to generate & control reset for CBCC module
 // This will drive reset to all CBCC instances used in the core

   assign  enchansync_all_i =  ENCHANSYNC_IN;

     c2cSlave_K_C2CB_PHY_0_common_reset_cbcc  common_reset_cbcc_i
     (
        .enchansync                     ( enchansync_all_i            ),
        .chan_bond_reset                ( CHAN_BOND_RESET             ),
        .cb_bit_err                     ( cb_bit_err_i                ),
        .reset                          ( new_gtx_rx_pcsreset_comb    ),
        .rd_clk                         ( RXUSRCLK2_IN                ),
        .init_clk                       ( INIT_CLK                    ),
        .user_clk                       ( rxusrclk_out                ),//( rxrecclk_to_fabric_i        ),
        .cbcc_fifo_reset_wr_clk         ( cbcc_fifo_reset_wr_clk      ),
        .cbcc_fifo_reset_to_fifo_wr_clk ( cbcc_fifo_reset_to_fifo_wr_clk ),
        .cbcc_data_srst                 ( cbcc_data_srst              ),
        .cbcc_fifo_reset_rd_clk         ( cbcc_fifo_reset_rd_clk      ),
        .cbcc_fifo_reset_to_fifo_rd_clk ( cbcc_fifo_reset_to_fifo_rd_clk ),
        .cbcc_only_reset_rd_clk         ( cbcc_only_reset_rd_clk      ),
        .cbcc_reset_cbstg2_rd_clk       ( cbcc_reset_cbstg2_rd_clk    )
     );



     c2cSlave_K_C2CB_PHY_0_common_logic_cbcc #
     (
         .BACKWARD_COMP_MODE1(BACKWARD_COMP_MODE1)
     )common_logic_cbcc_i
     (
        .start_cb_writes_in   ( start_cb_writes_i ),
        .do_rd_en_in          ( do_rd_en_i ),
        .bit_err_chan_bond_in ( bit_err_chan_bond_i ),
        .final_gater_for_fifo_din_in ( final_gater_for_fifo_din_i ),
        .any_vld_btf_in       ( any_vld_btf_i ),
        .all_start_cb_writes_out                ( all_start_cb_writes_i       ),
        .cbcc_fifo_reset_wr_clk                 ( cbcc_fifo_reset_wr_clk      ),
        .cbcc_fifo_reset_rd_clk                 ( cbcc_fifo_reset_rd_clk      ),
        .master_do_rd_en_out                    ( master_do_rd_en_i           ),
        .cb_bit_err_out                         ( cb_bit_err_i                ),
        .all_vld_btf_out                        ( all_vld_btf_flag_i          ),
        .rxusrclk2_in                           ( RXUSRCLK2_IN                ),
        .rxrecclk_to_fabric                     ( rxusrclk_out                )////( rxrecclk_to_fabric_i )
     );


    //#########################scrambler instantiation########################
c2cSlave_K_C2CB_PHY_0_SCRAMBLER_64B66B #
     (
        .TX_DATA_WIDTH(64)
     )
       scrambler_64b66b_gtx0_i
     (
       // User Interface
 
        .UNSCRAMBLED_DATA_IN    (TXDATA_IN),
        .SCRAMBLED_DATA_OUT     (scrambled_data_i),
        .DATA_VALID_IN          (data_valid_i),
        // System Interface
        .USER_CLK               (TXUSRCLK2_IN), // (TXUSRCLK2_IN),
        .SYSTEM_RESET           (gtx_reset_comb)
     );


     //---------------------------Polarity Control Logic---------------------
     //Double synchronize CHECK_POLARITY_IN signal to account for domain crossing

c2cSlave_K_C2CB_PHY_0_cdc_sync
   # (
      .c_cdc_type    (1),  // 0 Pulse synchronizer, 1 level synchronizer 2 level synchronizer with ACK
      .c_flop_input  (0),  // 1 Adds one flop stage to the input prmry_in signal
      .c_reset_state (0),  // 1 Reset needed for sync flops
      .c_single_bit  (1),  // 1 single bit input.
      .c_mtbf_stages (2)   // Number of sync stages needed
     )   u_cdc__check_polarity
     (
       .prmry_aclk      (1'b0                               ),
       .prmry_rst_n     (1'b1                               ),
       .prmry_in        (CHECK_POLARITY_IN),
       .prmry_vect_in   (32'd0                                ),
       .scndry_aclk     (rxusrclk_out                       ),//(rxrecclk_to_fabric_i ),
       .scndry_rst_n    (1'b1                               ),
       .prmry_ack       (),
       .scndry_out      (check_polarity_r2),
       .scndry_vect_out ()
      );

     //Logic to account for polarity reversal
     always @(posedge rxusrclk_out)//always @(posedge rxrecclk_to_fabric_i)//
     begin
       if(check_polarity_r2 && (rxheader_from_gtx_i == 2'b01) && rxheadervalid_i)
             RX_NEG_OUT     <= `DLY   1'b1;
       else if(check_polarity_r2 && RX_NEG_OUT )
             RX_NEG_OUT     <= `DLY   1'b1;
       else
             RX_NEG_OUT     <= `DLY   1'b0;
     end

     //Finally double synchronize RX_POLARITY_IN signal and port map to RXPOLARITY0/1
   c2cSlave_K_C2CB_PHY_0_cdc_sync
   # (
      .c_cdc_type    (1),  // 0 Pulse synchronizer, 1 level synchronizer 2 level synchronizer with ACK
      .c_flop_input  (0),  // 1 Adds one flop stage to the input prmry_in signal
      .c_reset_state (0),  // 1 Reset needed for sync flops
      .c_single_bit  (1),  // 1 single bit input.
      .c_mtbf_stages (3)   // Number of sync stages needed
     )   u_cdc_rxpolarity_
     (
       .prmry_aclk      (RXUSRCLK2_IN                   ),//?? what about this clock and logic for cdc_sync
       .prmry_rst_n     (1'b1                           ),
       .prmry_in        (RXPOLARITY_IN),
       .prmry_vect_in   (32'd0                            ),
       .scndry_aclk     (rxusrclk_out                   ),//(rxrecclk_to_fabric_i ),//
       .scndry_rst_n    (1'b1                           ),
       .prmry_ack       (),
       .scndry_out      (sync_rx_polarity_r ),
       .scndry_vect_out ()
      );



     always @(posedge rxusrclk_out)//always @(posedge rxrecclk_to_fabric_i)//
     begin
             rxdatavalid_to_fifo_i  <= `DLY rxdatavalid_i;
             rxheader_to_fifo_i     <= `DLY rxheader_from_gtx_i;
     end

     //##########################descrambler instantiation########################
     c2cSlave_K_C2CB_PHY_0_DESCRAMBLER_64B66B #
     (
        .RX_DATA_WIDTH(32)
     )
       descrambler_64b66b_gtx0_i
     (
        // User Interface
        .SCRAMBLED_DATA_IN      (rxdata_from_gtx_i    ),
        .UNSCRAMBLED_DATA_OUT   (rxdata_to_fifo_i     ),
        .DATA_VALID_IN          (rxdatavalid_i        ),

        // System Interface
        .USER_CLK               (rxusrclk_out                           ),//(rxrecclk_to_fabric_i),//
        //.ENABLE                 (enable_32_i                            ),
        .SYSTEM_RESET           (!rxlossofsync_out_q  )
     );

     //#########################block sync instantiation##############################
     c2cSlave_K_C2CB_PHY_0_BLOCK_SYNC_SM #
     (
       .SH_CNT_MAX              (SH_CNT_MAX             ),
       .SH_INVALID_CNT_MAX      (SH_INVALID_CNT_MAX     )
     )
       block_sync_sm_gtx0_i
     (
       // User Interface
       .BLOCKSYNC_OUT           (blocksync_out_i    ),
       .RXGEARBOXSLIP_OUT       (rxgearboxslip_i    ),
       .RXHEADER_IN             (rxheader_from_gtx_i),
       .RXHEADERVALID_IN        (rxheadervalid_i    ),

       // System Interface
       .USER_CLK                (rxusrclk_out                         ),//(rxrecclk_to_fabric_i),//
       .SYSTEM_RESET            (new_gtx_rx_pcsreset_comb             )
     );


     //#########################CBCC module instantiation########################
     c2cSlave_K_C2CB_PHY_0_CLOCK_CORRECTION_CHANNEL_BONDING #
     (
     .INTER_CB_GAP                      (INTER_CB_GAP                   ),
     .EXAMPLE_SIMULATION                (EXAMPLE_SIMULATION             ),
     .wait_for_fifo_wr_rst_busy_value   (wait_for_fifo_wr_rst_busy_value),
     .LOW_WATER_MARK                    (LOW_WATER_MARK_MASTER          ),
     .HIGH_WATER_MARK                   (HIGH_WATER_MARK_MASTER         ),
     .BACKWARD_COMP_MODE3               (BACKWARD_COMP_MODE3),
     .CH_BOND_MAX_SKEW                  (2'b10),
     .CH_BOND_MODE                      (CHAN_BOND_MODE_0     )

     )
       cbcc_gtx0_i
     (

       //Write Interface
         .GTX_RX_DATA_IN                (rxdata_to_fifo_i     ),
         .GTX_RX_DATAVALID_IN           (rxdatavalid_to_fifo_i),
         .GTX_RX_HEADER_IN              (rxheader_to_fifo_i   ),
         .WR_ENABLE                     (enable_32_i                            ),
         .USER_CLK                      (rxusrclk_out),//(rxrecclk_to_fabric_i),//
         .RXLOSSOFSYNC_IN               (rxlossofsync_out_q   ),
         .ENCHANSYNC                    (ENCHANSYNC_IN        ),
         .CHAN_BOND_RESET               (CHAN_BOND_RESET                        ),

       //Read Interface
         .CC_RX_DATA_OUT(RXDATA_OUT),
         .CC_RX_BUF_STATUS_OUT          (rxbuferr_out_i       ),
         .CC_RX_DATAVALID_OUT           (RXDATAVALID_OUT      ),
         .CC_RX_HEADER_OUT              (RXHEADER_OUT         ),
         .CC_RXLOSSOFSYNC_OUT           (RXLOSSOFSYNC_OUT     ),

         .CHBONDI (chbondi),
         .CHBONDO                       (chbondo_to_slaves_i),
         .RXCHANISALIGNED               (CHBONDDONE_OUT       ),
         .CBCC_FIFO_RESET_WR_CLK        (cbcc_fifo_reset_wr_clk                 ),
         .CBCC_FIFO_RESET_TO_FIFO_WR_CLK( cbcc_fifo_reset_to_fifo_wr_clk        ),
         .cbcc_data_srst                 ( cbcc_data_srst              ),
         .CBCC_FIFO_RESET_RD_CLK        (cbcc_fifo_reset_rd_clk                 ),
         .CBCC_FIFO_RESET_TO_FIFO_RD_CLK(cbcc_fifo_reset_to_fifo_rd_clk         ),
         .CBCC_ONLY_RESET_RD_CLK        (cbcc_only_reset_rd_clk                 ),
         .CBCC_RESET_CBSTG2_RD_CLK      (cbcc_reset_cbstg2_rd_clk               ),
         .ANY_VLD_BTF_FLAG              (any_vld_btf_i        ),
         .START_CB_WRITES_OUT           (start_cb_writes_i    ),
         .ALL_START_CB_WRITES_IN        (all_start_cb_writes_i                  ),
         .ALL_VLD_BTF_FLAG_IN           (all_vld_btf_flag_i                     ),
         .PERLN_DO_RD_EN                (do_rd_en_i           ),
         .MASTER_DO_RD_EN               (master_do_rd_en_i                      ),
         .FIRST_CB_BITERR_CB_RESET_OUT  (bit_err_chan_bond_i  ),
         .FINAL_GATER_FOR_FIFO_DIN      (final_gater_for_fifo_din_i ),
         .RESET                         (new_gtx_rx_pcsreset_comb               ),
         .RD_CLK                        (RXUSRCLK2_IN                           ),
         .HPCNT_RESET_IN                (HPCNT_RESET_IN),//stableclk_gtx_reset_comb),//
         .GTXRESET_IN                   (GTXRESET_IN                            ),
         .INIT_CLK                      (INIT_CLK                               ),
         .LINK_RESET                    (link_reset_0_c               )
     );


    wire reset_initclk;
    wire fsm_resetdone_initclk;

    c2cSlave_K_C2CB_PHY_0_rst_sync u_rst_sync_reset_initclk
      (
      .prmry_in (RESET),
          .scndry_aclk          (INIT_CLK),
          .scndry_out           (reset_initclk)
      );

    c2cSlave_K_C2CB_PHY_0_rst_sync u_rst_sync_fsm_resetdone_initclk
      (
      .prmry_in (FSM_RESETDONE_j),
          .scndry_aclk          (INIT_CLK),
          .scndry_out           (fsm_resetdone_initclk)
      );

         assign  rxfsm_reset_i                = hpreset_or_pma_init_in | cdr_reset_fsm_lnkreset;
         assign sys_and_fsm_reset_for_hpcnt  = rxfsm_reset_i ? 1'b0 : (reset_initclk | ~fsm_resetdone_initclk);
         assign  hp_reset_i                   = hpreset_in | cdr_reset_fsm_lnkreset;
         assign  HPCNT_RESET_IN = GTXRESET_IN | sys_and_fsm_reset_for_hpcnt | cdr_reset_fsm_lnkreset ;
         assign  blocksync_all_lanes_inrxclk  = blocksync_out_i ;
         assign rxlossofsync_out_i        = allow_block_sync_propagation_inrxclk ? blocksync_out_i : 1'b0;

     always @(posedge rxusrclk_out)//always @(posedge rxrecclk_to_fabric_i)//
     begin
         rxlossofsync_out_q <= `DLY rxlossofsync_out_i;
     end



    always @(posedge rxusrclk_out)//always @(posedge rxrecclk_to_fabric_i)//
    begin
        blocksync_all_lanes_inrxclk_q <= `DLY blocksync_all_lanes_inrxclk;
    end


    c2cSlave_K_C2CB_PHY_0_rst_sync u_rst_sync_blocksyncall_initclk_sync
      (
          .prmry_in             (blocksync_all_lanes_inrxclk_q),
          .scndry_aclk          (INIT_CLK),
          .scndry_out           (blocksync_all_lanes_instableclk)
      );

    c2cSlave_K_C2CB_PHY_0_rst_sync u_rst_sync_blocksyncprop_inrxclk_sync
      (
          .prmry_in             (allow_block_sync_propagation),
          .scndry_aclk          (rxusrclk_out),//(rxrecclk_to_fabric_i),//
          .scndry_out           (allow_block_sync_propagation_inrxclk)
      );

      always @(posedge INIT_CLK)  begin
         if(hpreset_or_pma_init_in | BACKWARD_COMP_MODE2) begin
             cdr_reset_fsm_r <= IDLE;
             cdr_reset_fsm_cntr_r <= 8'h0;
             cdr_reset_fsm_lnkreset <= 1'b0;
             allow_block_sync_propagation <= BACKWARD_COMP_MODE2;
         end else begin
             case(cdr_reset_fsm_r)
             IDLE: begin
                 cdr_reset_fsm_cntr_r <= 8'h0;
                 allow_block_sync_propagation <= 1'b0;
                 cdr_reset_fsm_lnkreset <= 1'b0;
                 if(blocksync_all_lanes_instableclk) begin
                     cdr_reset_fsm_r <= ASSERT_RXRESET;
                 end
             end
             ASSERT_RXRESET: begin
                 allow_block_sync_propagation <= 1'b0;
                 cdr_reset_fsm_lnkreset <= 1'b1;
                 if(cdr_reset_fsm_cntr_r == 8'hFF) begin
                     cdr_reset_fsm_r <= DONE;
                 end else begin
                     cdr_reset_fsm_cntr_r <= cdr_reset_fsm_cntr_r +  8'h1;
                 end
             end
             DONE: begin
                 cdr_reset_fsm_cntr_r <= 8'h0;
                 cdr_reset_fsm_r      <= DONE;
                 cdr_reset_fsm_lnkreset <= 1'b0;
                 allow_block_sync_propagation <= 1'b1;
             end
             endcase
         end
      end

 
 
 endmodule

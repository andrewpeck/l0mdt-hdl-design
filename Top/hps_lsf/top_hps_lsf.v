parameter SV_L0MDT_TTC_LEN = 5;
parameter SV_HPS_NUM_MDT_CH_INN = 6;
parameter SV_EN_MDT_HITS = 1;
parameter SV_EN_TAR_HITS = 1;
parameter n_PRIMARY_CANDIDATES=3;

`include "l0mdt_buses_constants.svh"


module top_hps_lsf_verilog(
			  input logic 							      clk,
			  input logic 							      rst,
			  input logic 							      bx,

			  input logic [SV_L0MDT_TTC_LEN-1:0] 				      ttc_commands,

			  input logic 							      mtc_ctrl,
			  output logic [1:0] 						      mtc_mon,
			  input logic [TAR2HPS_LEN*SV_EN_MDT_HITS*SV_HPS_NUM_MDT_CH_INN -1:0] i_inner_tdc_hits,
			  input logic [TAR2HPS_LEN*SV_EN_MDT_HITS*SV_HPS_NUM_MDT_CH_INN -1:0] i_middle_tdc_hits,
			  input logic [TAR2HPS_LEN*SV_EN_MDT_HITS*SV_HPS_NUM_MDT_CH_INN -1:0] i_outer_tdc_hits,
			  input logic [TAR2HPS_LEN*SV_EN_MDT_HITS*SV_HPS_NUM_MDT_CH_INN -1:0] i_extra_tdc_hits,

			  input logic [TAR2HPS_LEN*SV_EN_TAR_HITS*SV_HPS_NUM_MDT_CH_INN -1:0] i_inner_tar_hits,
			  input logic [TAR2HPS_LEN*SV_EN_TAR_HITS*SV_HPS_NUM_MDT_CH_INN -1:0] i_middle_tar_hits,
			  input logic [TAR2HPS_LEN*SV_EN_TAR_HITS*SV_HPS_NUM_MDT_CH_INN -1:0] i_outer_tar_hits,
			  input logic [TAR2HPS_LEN*SV_EN_TAR_HITS*SV_HPS_NUM_MDT_CH_INN -1:0] i_extra_tar_hits,

			  input logic [SLC_RX_LEN*n_PRIMARY_CANDIDATES-1:0] 		      i_main_primary_slc,
			  input logic [SLC_RX_LEN*n_PRIMARY_CANDIDATES-1:0] 		      i_main_secondary_slc ,
			  input logic [SLC_RX_LEN-1:0] 					      i_plus_neighbor_slc,
			  input logic [SLC_RX_LEN-1:0] 					      i_minus_neighbor_slc,
			  //output logic [MTC2SL_LEN*2-1:0] 			mtc_o,
			  output logic [193*2-1:0] 					      mtc_o,
			  output logic 							      sump,
			  //Ctrl Block
			  input 							      c2c_rxn,
			  input 							      c2c_rxp,
			  output 							      c2c_txn,
			  output 							      c2c_txp,
			  input 							      c2c_refclkp,
			  input 							      c2c_refclkn,

			  inout logic 							      sys_mgmt_scl,
			  inout logic 							      sys_mgmt_sda,
			  output logic 							      sys_mgmt_alarm,
			  output logic 							      sys_mgmt_overtemp_alarm,
			  output logic 							      sys_mgmt_vccaux_alarm,
			  output logic 							      sys_mgmt_vccint_alarm
		//	  input [32*3-1:0] 					  h2s_ctrl,
		//	  output [59*3-1:0] 					  h2s_mon
	       );

   logic [SLC_RX_LEN-1:0] 							i_main_primary_slc_unpacked[n_PRIMARY_CANDIDATES];
   logic [SLC_RX_LEN-1:0] 							i_main_secondary_slc_unpacked[n_PRIMARY_CANDIDATES];
   logic [MTC2SL_LEN-1:0] 							mtc_o_unpacked[2];
   logic [31:0] 								h2s_ctrl_unpacked[3];
   logic [58:0]									h2s_mon_unpacked[3];




   assign {>>{i_main_primary_slc_unpacked}}   = i_main_primary_slc;
   assign {>>{i_main_secondary_slc_unpacked}} = i_main_secondary_slc;
   assign {>>{mtc_o}}                         = mtc_o_unpacked;
//   assign {>>{h2s_ctrl_unpacked}}              = h2s_ctrl;
//   assign h2s_mon                             = {>>{h2s_mon_unpacked}};




  top_hps top_hps_inst #(
			 .g_STATION
			 )


endmodule // top_ult

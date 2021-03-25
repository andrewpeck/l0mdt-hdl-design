`timescale 1ns/1ps


`include "l0mdt_buses_constants.svh"




module legendreEngine(
		      input 			       clk,
		      input 			       rst,
		      input 			       srst,
		      input logic [HEG2SFHIT_LEN-1:0]  mdt_hit,
		      input logic 		       mdt_hit_empty,
		      output logic 		       mdt_hit_re,
		      input logic [HEG2SFSLC_LEN-1:0]  hit_extraction_roi,
		      input 			       hit_extraction_roi_empty,
		      output logic 		       hit_extraction_roi_re,
		      input logic [9:0] 	       histogram_accumulation_count,
		      output logic [SF2PTCALC_LEN-1:0] le_output,
		      output logic 		       le_output_vld,
		      output logic [1023:0] 	       le_tb_output,
		      output logic 		       le_tb_output_vld
		      );

   parameter THETA_BINS=64; //128;
   parameter RBINS     = 128;

   //   const int TRIG_BITS= 24;
   //  parameter HEG2SFSLC_VEC_ANG_LEN = 10; //TODO: FIX IN HEADER FILE:TALK TO KOSTAS
   parameter HEG2SFSLC_VEC_ANG_PREC_LEN = HEG2SFSLC_VEC_ANG_LEN + 7 ;

   //CONSTANT FROM HLS(ANGLE_MAX_HALF_MRAD + HALF_PI_MRAD)
//   parameter VEC_ANG_OFFSET = 1023+50265;  //typedef ap_fixed<W_slcproc_vec_ang+7, IW_slcproc_vec_ang+2> angle_t_mrad;

   logic [17:0] 		   hw_sin_val[THETA_BINS];
   logic [17:0] 		   hw_cos_val[THETA_BINS];
   logic [17:0] 		   hw_sin_val_gls;


   logic [3:0] 			   trig_axis_cnt;





   logic [3:0] 			   max_bin_count[THETA_BINS];
   logic [6:0] 			   max_bin_r[THETA_BINS];

   logic [3:0] 			   max_bin_count_V[THETA_BINS];
   logic [3:0] 			   max_bin_count_V_i[THETA_BINS];
   logic [6:0] 			   max_bin_r_V[THETA_BINS];
   logic  			   max_bin_count_V_vld[THETA_BINS];
   logic  			   max_bin_r_V_vld[THETA_BINS];


   logic 			   ap_rst;
   logic 			   ap_rst_n;
   logic 			   results_ap_start;
   logic 			   results_ap_done;
    logic 			   results_ap_done_d;
   logic 			   results_ap_idle;
   logic 			   results_ap_idle_d0;
   logic 			   results_ap_ready;



   logic [HEG2SFSLC_VEC_ANG_LEN  -1 :0] roi_seed_theta;
   logic [HEG2SFSLC_VEC_ANG_PREC_LEN -1 :0] roi_seed_theta_mrad;
   logic 				    roi_seed_theta_mrad_vld;

   parameter W_r = 22;


   logic [W_r-1:0] 				 roi_seed_r;
   logic [W_r-1:0] 				 roi_seed_r_fo[9];
   logic 					 roi_seed_r_vld;
   logic [W_r+1:0] 				 mdt_r_offset[8];
   logic [HEG2SFHIT_LOCALX_LEN-1:0] 		 mdt_local_x[8];
   logic [HEG2SFHIT_LOCALY_LEN:0] 		 mdt_local_y[8];
   logic [W_r+1:0] 				 mdt_radius[2]; //HLS adding extra bits in lsb
   logic [W_r+1:0] 				 mdt_radius_stream;
   logic 					 stream_input;






/* -----\/----- EXCLUDED -----\/-----
   logic [HEG2SFSLC_VEC_POS_LEN - 1:0] roi_offset_z[9];
   logic [HEG2SFSLC_VEC_POS_LEN - 1:0] roi_offset_R[9];
   logic [HEG2SFSLC_VEC_POS_LEN - 1:0] geo_pos_R;
   logic [HEG2SFSLC_VEC_POS_LEN - 1:0] geo_pos_Z;
 -----/\----- EXCLUDED -----/\----- */
   logic [SLC_MUID_LEN-1:0] 			 slc_muid;
   logic [VEC_MDTID_LEN-1:0] 			 slc_mdtid;
   logic [SF2PTCALC_SEGQUALITY_LEN-1:0] 	 sf_segquality;
   logic [SF2PTCALC_SEGPOS_LEN-1:0] 		 sf_segpos;
   logic 					 sf_segpos_vld;


   logic [SF2PTCALC_SEGPOS_LEN+SF2PTCALC_SEGANGLE_LEN+SF2PTCALC_SEGQUALITY_LEN-1:0] le_results;
   logic 									    le_results_vld;

   //Load Luts Control Signals
   logic 									    ll_ap_start;
   logic 									    ll_ap_done;
   logic 									    ll_ap_idle;
   logic 									    ll_ap_ready;
   logic [3:0] 									    ll_ap_done_d;
   logic 									    ll_reset;


   logic 									    gra_ap_start;
   logic 									    gra_ap_done;
   logic 									    gra_ap_idle;
   //logic [HEG2SFSLC_VEC_ANG_PREC_LEN -1:0] gra_theta;
   logic [17:0] 								    gra_theta;
   logic 									    gra_theta_vld;
   logic [13:0] 								    gra_total_bins;
   logic 									    gra_resource_sharing;


   logic 									    gtv_ap_idle;
   logic 									    gtv_ap_done;
   logic 									    gtv_ap_ready;
   logic 									    gtv_ap_idle_d0;
   logic 									    gtv_ap_idle_d1;
   logic 									    gtv_ap_idle_d2;

   //Histogram Bin Accumulation Control Signals
   logic [15:0] 								    hba_ap_start;
   logic 									    hba_ap_done;
   logic 									    hba_ap_idle;
   logic 									    hba_ap_ready;
   logic 									    hba_reset;
   logic [15:0] 								    hba_mem_enable;
   logic 									    histogram_reset_n;

   logic 									    hba_ap_idle_d0;
   logic 									    hba_ap_ready_d0;

   logic [HEG2SFSLC_LEN-1:0] 							    hit_extraction_roi_internal;
   logic 									    hit_extraction_roi_vld;



   logic [9:0] 									    counter;
   const logic [3:0] 								    hba_latency             = 5; //8;//7; //12;

   const logic [3:0] 								    hba_mem_latency         = 4; //DMEM-4, REG-3; //4; //3;
   const logic [3:0] 								    find_max_bin_latency    = 3; //2; //4;
   const logic [3:0] 								    reset_cycles = 10;
   const logic [7:0] 								    hba_reset_clocks = 3; //RBINS;


   logic 									    get_first_hit;
   logic 									    get_first_hit_r;
   logic 									    get_next_hit;

   logic 									    mdt_hit_vld_internal;
   logic [HEG2SFHIT_LEN-1:0] 							    mdt_hit_internal;
   logic [8:0] 									    mdt_hit_vld_internal_fo;
   logic 									    hba_reset_mode;
   logic 									    hba_results_rdy;
   logic 									    hba_ap_ready_reg;


   logic [2:0] 									    le_state_prev;
   logic [4:0] 									    latency_count;
   logic [3:0] 									    latency_count_vld;
   logic 									    flush_pipeline;

   logic [THETA_BINS-1:0] 							    compute_rbin_ap_done;
   logic [THETA_BINS-1:0] 							    compute_rbin_ap_idle;
   logic [THETA_BINS-1:0] 							    compute_rbin_ap_ready;


   logic [THETA_BINS-1:0] 							    update_max_rbin_ap_done;
   logic [THETA_BINS-1:0] 							    update_max_rbin_ap_idle;
   logic [THETA_BINS-1:0] 							    update_max_rbin_ap_ready;
   logic 									    hba_update_max_rbin_ap_ready;


   logic [7:0] 									    r_bin[THETA_BINS];
   logic 									    r_bin_vld[THETA_BINS];
   logic 									    r_bin_rdy[THETA_BINS];

   logic [7:0] 									    r_bin_d[THETA_BINS];
   logic 									    r_bin_d_vld[THETA_BINS];

   logic [3:0] 									    r_val_hist[THETA_BINS];
   logic 									    r_val_hist_vld[THETA_BINS];
   logic 									    r_val_hist_rdy[THETA_BINS];
   logic 									    r_val_hist_vld_i[THETA_BINS];

   logic 									    ap_rst_gra;
   /* -----\/----- EXCLUDED -----\/-----
    ENDCAP BITWIDTHS
    logic [SF2PTCALC_SEGPOS_LEN-1:0] slcvec_pos_ref;
    logic [SF2PTCALC_SEGPOS_LEN-1:0] hewindow_pos_ref;

    logic [SF2PTCALC_SEGPOS_LEN-1:0] slcvec_pos;
    logic [SF2PTCALC_SEGPOS_LEN-1:0] hewindow_pos ;
    -----/\----- EXCLUDED -----/\----- */

   logic [SF2PTCALC_SEGPOS_LEN-1:0] 						    slcvec_pos;
   logic [SF2PTCALC_SEGPOS_LEN-1:0] 						    hewindow_pos ;
   //logic [HEG2SFSLC_VEC_ANG_LEN-1:0] 						    slcvec_pos;
   logic [SF2PTCALC_SEGPOS_LEN-1:0] 						    hewindow_pos_Z ;

   logic [SF2PTCALC_SEGPOS_LEN-1:0] 						    slcvec_pos_ref;
   logic [SF2PTCALC_SEGPOS_LEN-1:0] 						    hewindow_pos_ref;

   logic [HEG2SFSLC_HEWINDOW_POS_LEN-1:0] 					    hewindow_pos_V_barrel;
   logic [HEG2SFSLC_HEWINDOW_POS_LEN-1:0] 					    slcvec_pos_V_barrel;


   enum 									    {IDLE, LOAD_LUTS_GRA, LOAD_LUTS, HISTOGRAM_BIN_ACCUMULATION, HISTOGRAM_BIN_FLUSH_PIPELINE, RESET_HISTOGRAM_BINS, COMPUTE_RESULTS, HBA_MEMORY_RESET} le_state;






   logic [1:0] 			   theta_offset_factor_sn;
   logic 			   theta_offset_factor_sn_vld;

/* -----\/----- EXCLUDED -----\/-----
   logic [14:0] 		   sin_rom_addr_reg;
   logic [14:0] 		   cos_rom_addr_reg;
 -----/\----- EXCLUDED -----/\----- */
   logic 			   sin_rom_addr_vld_reg;
   logic 			   cos_rom_addr_vld_reg;
   logic [21:0] 		   theta_offset_factor_sn_reg;
   logic 			   theta_offset_factor_sn_vld_reg;

   logic [14:0] 		   sin_addr_offset_V_TDATA;
   logic 			   sin_addr_offset_V_TVALID;
   logic 			   sin_addr_offset_V_TREADY;
   logic [14:0] 		   cos_addr_offset_V_TDATA;
   logic 			   cos_addr_offset_V_TVALID;
   logic 			   cos_addr_offset_V_TREADY;
   logic [2:0]			   sin_axis_fanout_index;
   logic [2:0] 			   cos_axis_fanout_index;


   logic [7:0] 			   theta_offset_ceil;
   logic 			   theta_offset_ceil_ap_vld;
   logic 			   theta_offset_factor_sn_vld_128;
   logic 			   theta_offset_factor_sn_vld_127;

   logic [2:0] 			   trig_val_counter;
   logic [3:0] 			   trig_val_counter_2;
   logic [6:0]			   rom_offset_i;
   logic [6:0] 			   rom_offset_i0;
   logic [6:0] 			   rom_offset;



   logic 			   trig_vals_loaded;
   logic [15:0] 		   hba_reset_fo;

   logic 			   toggle_fp;


   logic [11:0] 		   triglut_start_addr;
   logic [11:0] 		   triglut_addr;
   logic [2:0] 			   triglut_first_bank;
   logic [2:0] 			   triglut_first_bank_d;
   logic [35:0] 		   hw_trig_vals[16];
   logic [35:0] 		   hw_trig_vals_reorder[16];




   logic 			   get_next_rom_addr;
   logic 			   get_next_rom_addr_d;
   logic  [13:0] theta_global;
   logic 	 theta_global_vld;
   logic [13:0]  theta_global_gra;

   logic [W_r-1:0]  r_global;
   logic 	 r_global_vld;
   logic [17:0]  theta;
   logic 	 theta_vld;
   logic [21:0]  r;
   logic 	 r_vld;
   logic [3:0] 	 res_max_bin_count;
   logic 	 res_max_bin_count_vld;
   logic [6:0] 	 res_max_bin_theta;
   logic 	 res_max_bin_theta_vld;
   logic [6:0] 	 res_max_bin_r;
   logic 	 res_max_bin_r_vld;

   logic [17:0]  gls_sin_val_V;
   logic [17:0]  gls_cos_val_V;

   logic 	 gls_ap_start;
   logic 	 gls_ap_done;
   logic 	 gls_ap_idle;
   logic 	 gls_ap_ready;
   logic 	 hw_sin_val_vld;
   logic 	 hw_cos_val_vld;
   logic [15:0] 	 hw_sin_val_vld_sreg;
   logic [15:0] 	 hw_cos_val_vld_sreg;
   logic [HEG2SFSLC_VEC_POS_LEN - 1:0] 	 hls_pos_Z;
   logic 		 hls_pos_Z_vld;
   logic [HEG2SFSLC_VEC_POS_LEN - 1:0] 	 hls_pos_R;
   logic 		 hls_pos_R_vld;


//`include "get_rom_addr_include.sv"
//`include "compute_LE_interface.sv"

   assign theta_offset_factor_sn_vld_128 = theta_offset_factor_sn_vld | theta_offset_factor_sn_vld_127;
   assign get_first_hit               = get_first_hit_r;
   assign mdt_hit_re                  = (le_state == HISTOGRAM_BIN_ACCUMULATION)? (~mdt_hit_empty & (get_next_hit | get_first_hit)) : 1'b0;
   assign theta_global_gra            = (theta_global[13]== 0)? -theta_global  : theta_global;
   assign hw_sin_val_gls              = (theta_global[13]== 0)? -hw_sin_val[0] : hw_sin_val[0];
   assign gra_theta                   = theta_global_gra;
   assign gra_theta_vld               = theta_global_vld;
   assign hit_extraction_roi_vld      = hit_extraction_roi_re;





   assign gls_ap_start = gra_resource_sharing & (hw_sin_val_vld_sreg===3);
//   assign gls_ap_start = gra_resource_sharing &  (hw_sin_val_vld_sreg===7); //(gtv_ap_done);
`ifdef RUN_SIM
   load_LE_refPos load_LE_refPos_inst(
`else
   hls_load_LE_refPos load_LE_refPos_inst(
`endif
				      .ap_clk(clk),
				      .ap_rst(ap_rst_gra),
				      .ap_start(roi_seed_theta_mrad_vld),
				      .ap_done(ref_pos_vld),
				      .ap_idle(ref_pos_idle),
				      .ap_ready(ref_pos_ready),
				      .mdtid_V(slc_mdtid),
				      .slcvec_pos_ref_V(slcvec_pos_ref),
				      .hewindow_pos_ref_V(hewindow_pos_ref)
				      );

				      assign hewindow_pos_Z = {hewindow_pos,3'b0};
`ifdef RUN_SIM
     get_legendre_segment_barrel get_legendre_segment_barrel_inst(
`else
   hls_get_legendre_segment_barrel get_legendre_segment_barrel_inst(
`endif
								  .ap_clk(clk),
								  .ap_rst(ap_rst),
								  .ap_start(gls_ap_start),
								  .ap_done(gls_ap_done),
								  .ap_idle(gls_ap_idle),
								  .ap_ready(gls_ap_ready),
								  .hls_sin_val_V(hw_sin_val_gls),
								  .hls_cos_val_V(hw_cos_val[0]),
								  .hls_LT_r_global_V(r_global),

								  .slcvec_pos_R_V(slcvec_pos_ref),
								  .hewindow_pos_R_V(hewindow_pos_ref),
								  .hewindow_pos_Z_V( hewindow_pos_Z),
								  .hls_LT_theta_global_V(theta_global),
								  .segpos_V(sf_segpos),
								  .segpos_V_ap_vld(sf_segpos_vld)
								 // .LE_output_V(le_results),
								 // .LE_output_V_ap_vld(le_results_vld)
								  );

   logic 		 cro_ap_done;
   logic 		 cro_ap_idle;
   logic 		 cro_ap_start;
   logic 		 cro_ap_ready;

  // assign slcvec_pos_ref   = 18'h8d50; //18'he1a3;
 //  assign hewindow_pos_ref = 18'h8ab5; //18'hdda3;
   assign cro_ap_start     = (trig_val_counter_2 == 2);//3); //4);
   assign hewindow_pos_V_barrel = hewindow_pos;
   assign slcvec_pos_V_barrel = slcvec_pos;
`ifdef RUN_SIM
   calc_LE_r_offset_barrel calc_LE_r_offset_barrel (
`else
   hls_calc_LE_r_offset_barrel calc_LE_r_offset_barrel (
`endif
					     .ap_clk(clk),
					     .ap_rst(ap_rst),
					     .ap_start(cro_ap_start),
					     .ap_done(cro_ap_done),
					     .ap_idle(cro_ap_idle),
					     .ap_ready(cro_ap_ready),
					     .hw_sin_val_V(hw_sin_val[31]),
					     .hw_cos_val_V(hw_cos_val[31]),
					     .roi_seed_r_V(roi_seed_r),
					     //.roi_seed_r_V_ap_vld(roi_seed_r_vld),
					     .slcvec_pos_V(slcvec_pos_V_barrel),
					     .slcvec_pos_ref_V(slcvec_pos_ref), //Rho for barrel
					     .hewindow_pos_V(hewindow_pos_V_barrel),
					     .hewindow_pos_ref_V(hewindow_pos_ref) //Rho for barrel
					    /*endcap connection
					     .slcvec_pos_Z_V(slcvec_pos_ref),
					     .slcvec_pos_Rho_V(slcvec_pos),
					     .hewindow_pos_Z_V(hewindow_pos_ref),
					     .hewindow_pos_Rho_V(hewindow_pos)
					     */
					     );

   assign latency_count_vld    = (latency_count != 4'hf);
   assign flush_pipeline       = (mdt_hit_re == 0) && latency_count_vld && (latency_count > 0) && (latency_count < hba_latency);


//   assign mdt_hit_internal      = ( mdt_hit_re)? mdt_hit : 0;
//   assign hba_ap_idle           = (compute_rbin_ap_idle[0] == 1 )? 1 : 0; //All bins have same latency, so look at only one
//   assign hba_ap_done           = (compute_rbin_ap_done == ~0 )? 1 : 0;

   assign hba_ap_ready          = (compute_rbin_ap_ready[0] == 1)? 1 : 0;//All bins have same latency, so look at only one
   assign hba_update_max_rbin_ap_ready          = ( update_max_rbin_ap_ready == ~0)? 1 : 0;
   assign mdt_radius[0]                         = {mdt_hit_internal[HEG2SFHIT_RADIUS_MSB:HEG2SFHIT_RADIUS_LSB],1'b0};
   assign mdt_radius[1]                         = -{mdt_hit_internal[HEG2SFHIT_RADIUS_MSB:HEG2SFHIT_RADIUS_LSB],1'b0};


   generate
      for(genvar z=0;z<THETA_BINS;z++)
	begin:theta_bins
	   int k = z/16; // to reduce fanout of input signals
	   int j = z/4; // increase fanout for hba_ap_start
`ifdef RUN_SIM
	   compute_r_bins compute_r_bins_inst(
`else
	   hls_compute_r_bins compute_r_bins_inst(
`endif
					      .ap_clk(clk),
					      .ap_rst_n(ap_rst_n),
					      .ap_start(hba_ap_start[j]),
					      .ap_done(compute_rbin_ap_done[z]),
					      .ap_idle(compute_rbin_ap_idle[z]),
					      .ap_ready(compute_rbin_ap_ready[z]),

					      .mdt_localx_V(mdt_local_x[k]),
					      .mdt_localy_V(mdt_local_y[k]),
					      .mdt_r_offset_V_TDATA(mdt_r_offset[k]),
					      .mdt_r_offset_V_TVALID(mdt_hit_vld_internal_fo[k]),
					      .mdt_r_offset_V_TREADY(),
					      //.mdt_r_offset_1_V(mdt_r_offset[0][1]), //[k][1]),
					      .hw_sin_val_V(hw_sin_val[z]),
					      .hw_cos_val_V(hw_cos_val[z]),
					      .r_bin_V_TDATA(r_bin[z]),
					      .r_bin_V_TVALID(r_bin_vld[z]),
					      .r_bin_V_TREADY(r_bin_rdy[z])
					      );


					      //update_histogram_reg  #(
					      update_histogram_dmem  #(
								  .RBINS(RBINS)
								  )
					      update_histogram_inst (
						  .clk(clk),
						  .rst_n(ap_rst_n),
						  .r_bin_V_TVALID(r_bin_vld[z]),
						  .r_bin_V_TDATA(r_bin[z]),
						  .r_bin_V_TREADY(r_bin_rdy[z]),
						  .enable_V(hba_mem_enable[j]), //1'b1),
						  .local_max_count(max_bin_count_V[z]),
						  .local_max_vld(max_bin_count_V_vld[z]),
						  .local_max_rbin(max_bin_r_V[z]),
						  .reset_rbins(hba_reset_fo[j])
						  );


	end // block: theta_bins
   endgenerate


   always @ (posedge clk)
     begin
	if(rst & srst)
	  begin
	     ap_rst     <= 1'b1;
	     ap_rst_n   <= 1'b0;
	     ap_rst_gra <= 1'b1;

	  end
	else
	  begin
	     ap_rst     <= 1'b0;
	     ap_rst_n   <= 1'b1;
	     ap_rst_gra <= 1'b0; //(le_state == IDLE)? 1'b1 : 1'b0;

	  end
     end // always @ (posedge clk)

   always @ (posedge clk)
     begin
	if(rst & srst)
	  begin
	     hit_extraction_roi_internal <= 0;
	     roi_seed_theta              <= 0;
	     roi_seed_theta_mrad_vld     <= 0;
	     mdt_hit_internal            <= 0;
	     mdt_hit_vld_internal        <= 0;
 	     stream_input                <= 0;

	     for(int i=0; i< 8; i++)
	       begin
		  mdt_hit_vld_internal_fo[i]     <= 0;
		  roi_seed_r_fo[i]               <= 0;
		  mdt_local_x[i]                 <= 0;
		  mdt_local_y[i]                 <= 0;
		  mdt_r_offset[i]                <= 0;
	       end
	  end
	else
	  begin
	     if(hit_extraction_roi_vld == 1)
	       begin
		  roi_seed_theta              <= hit_extraction_roi_internal[HEG2SFSLC_VEC_ANG_MSB : HEG2SFSLC_VEC_ANG_LSB];
		  roi_seed_theta_mrad_vld     <= 1;
		  slc_muid                    <= hit_extraction_roi_internal[HEG2SFSLC_MUID_MSB:HEG2SFSLC_MUID_LSB];
		  slc_mdtid                   <= hit_extraction_roi_internal[HEG2SFSLC_MDTID_MSB:HEG2SFSLC_MDTID_LSB];
		  slcvec_pos                  <= hit_extraction_roi_internal[HEG2SFSLC_VEC_POS_MSB:HEG2SFSLC_VEC_POS_LSB];
		  hewindow_pos                <= hit_extraction_roi_internal[HEG2SFSLC_HEWINDOW_POS_MSB:HEG2SFSLC_HEWINDOW_POS_LSB];
	       end
	     else
	       begin
		  roi_seed_theta_mrad_vld      <= 0;
	       end

	     hit_extraction_roi_internal <= hit_extraction_roi ;



//	     mdt_hit_vld_internal               <= ( mdt_hit_re) | hba_reset | ( ~mdt_hit_vld_internal & flush_pipeline );
  	     mdt_hit_vld_internal               <= ( mdt_hit_re) | ( ~mdt_hit_vld_internal & flush_pipeline );
	     mdt_hit_internal                   <=(flush_pipeline)? 0 : mdt_hit;




	     if(mdt_hit_vld_internal)
	       begin
		  mdt_hit_vld_internal_fo     <= 9'h1ff;
		  mdt_radius_stream           <= mdt_radius[1];

		  stream_input                <= 1;
		  for(int i=0; i<8; i++)
		    begin
		       mdt_local_x[i]                 <= mdt_hit_internal[HEG2SFHIT_LOCALX_MSB:HEG2SFHIT_LOCALX_LSB];
		       mdt_local_y[i]                 <= mdt_hit_internal[HEG2SFHIT_LOCALY_MSB:HEG2SFHIT_LOCALY_LSB];
		       mdt_r_offset[i]  	      <= mdt_radius[0] - roi_seed_r;
		    end
	       end
	     else begin

   	        stream_input                <= 0;

		if(stream_input == 0)
		  begin
		     mdt_hit_vld_internal_fo     <= 9'b0;
 		    for(int i=0; i<8; i++)
		    begin
	             mdt_r_offset[i] 	         <= 0;
		    end
		  end
		else
		  begin
  		    for(int i=0; i<8; i++)
		    begin
		     mdt_r_offset[i]             <= mdt_radius_stream - roi_seed_r;
		    end
		  end
	     end // else: !if(mdt_hit_vld_internal)

	     if(roi_seed_r_vld)
	       begin
		  for(int i=0; i<8; i++)
		    begin
		       roi_seed_r_fo[i] <= roi_seed_r;
		    end
	       end
	  end // else: !if(rst & srst)

     end // always @ (posedge clk)



   always @ (posedge clk)
     begin
	if(rst && srst)
	  begin
	     for(integer z=0;z<THETA_BINS;z++)
	       begin
		  max_bin_count[z] <= 0;
		  max_bin_r[z]     <= 0;
	       end
	  end
	else
	  begin

	     for(integer z=0;z<THETA_BINS;z++)
	       begin
		  if(max_bin_count_V_vld[z])
		    begin
		       max_bin_count[z] <= max_bin_count_V[z];
		       max_bin_r[z]     <= max_bin_r_V[z];
		    end

	       end // for (integer z=0;z<THETA_BINS;z++)

	  end // else: !if(rst && srst)

     end // always @ (posedge clk)



   always @ (posedge clk)
     begin
	if(rst | srst)
	  begin
	     for(integer i=0;i<THETA_BINS;i++)
	       begin
		  hw_sin_val[i]   <= 0;
		  hw_cos_val[i]   <= 0;

	       end
             for(integer i=0;i<16;i++)
	       begin
		  hw_trig_vals_reorder[i] = 0;
	       end
	     theta_offset_factor_sn_reg <= 0;
	     theta_offset_factor_sn_vld_reg <= 0;
	     theta_offset_factor_sn_vld_127 <= 0;
	     trig_axis_cnt                  <= 0;
	     get_next_rom_addr              <= 0;
	     get_next_rom_addr_d            <= 0;
	     hw_sin_val_vld_sreg            <= 0;
	     hw_cos_val_vld_sreg            <= 0;
	     trig_val_counter               <= 0;
	     trig_val_counter_2             <= 0;
	     rom_offset_i0                  <= 0;
	     rom_offset_i                   <= 0;
	     rom_offset                     <= 0;
	     triglut_addr                   <= 0;
	     triglut_first_bank_d           <= 0;
	     toggle_fp                      <= 1;

	  end
	else
	  begin
	     get_next_rom_addr_d      <= get_next_rom_addr;
	     hw_sin_val_vld_sreg[0]   <= gtv_ap_done; //hw_sin_val_vld;
	     hw_sin_val_vld_sreg[15:1]<= hw_sin_val_vld_sreg[14:0];


	     if(flush_pipeline)
	       begin
		  toggle_fp = ~toggle_fp;
	       end
	     else
	       toggle_fp <= 1'b1;



	     if(gra_ap_done & get_next_rom_addr==0)
	       begin
		  get_next_rom_addr    <= 1'b1;
		  trig_val_counter     <= 0;
		  triglut_addr         <= triglut_start_addr;
		  triglut_first_bank_d <= triglut_first_bank;


	       end
	     else if(get_next_rom_addr & trig_val_counter < 3)
	       begin
		  trig_val_counter   <= trig_val_counter + 1;
		  triglut_addr       <=  (triglut_addr + 16 > 3343)? triglut_addr + 16 - 3343 : triglut_addr + 16;
		  get_next_rom_addr  <= 1'b1;

	       end
	     else
	       begin
		  get_next_rom_addr  <= 0;
		  trig_val_counter   <= 0;
	       end // else: !if(get_next_rom_addr & trig_val_counter < 7)




	     if(gtv_ap_done)
	       begin
		  trig_val_counter_2 <= trig_val_counter_2 + 1;
		  rom_offset         <= rom_offset + 16;


		  for(integer i=0; i<8; i++) //8 clocks to load 128 vals, 4 clocks for 64 vals
		    begin
		       hw_trig_vals_reorder[i]     <= hw_trig_vals[(triglut_first_bank_d + i) & 3'h7];
		       hw_trig_vals_reorder[8 + i] <= hw_trig_vals[8 + ((triglut_first_bank_d + i) & 3'h7)]; //hw_trig_vals[8 + ((triglut_first_bank_d + i) & 3'h7)];
		    end



	       end // if (gtv_ap_done)
	     else
	       begin
		  trig_val_counter_2 <= (trig_val_counter_2  == 3)? 4 : 4'hf;

		  rom_offset         <= 0;
	       end // else: !if(gtv_ap_done)


	     rom_offset_i <= rom_offset;
	   //  rom_offset_i   <=  rom_offset_i0;

	     if(trig_val_counter_2 < 4)
	       begin
		  for(integer i=0;i<16;i++)
		  begin
	 	     hw_sin_val[rom_offset_i | i]     <= hw_trig_vals_reorder[i][17:0];
		     hw_cos_val[rom_offset_i | i]     <= hw_trig_vals_reorder[i][35:18];
		  end
		end

	  end // else: !if(rst && srst)
     end // always @ (posedge clk)


 always @ (posedge clk)
     begin
	if(rst && srst)
	  begin
	     le_output           <= 0;
	     le_output_vld       <= 0;
	     le_tb_output        <= 0;
	     le_tb_output_vld    <= 0;
	     sf_segquality       <= 0;
  	     histogram_reset_n   <= 1'h0;
	  end
	else
	  begin
	     le_output_vld       <= sf_segpos_vld;
    	     le_tb_output_vld    <= sf_segpos_vld;
	     if(sf_segpos_vld)
	       begin
//		  le_output    <= {1'b1,slc_muid,le_results,slc_mdtid};
		  le_output[SF2PTCALC_MDTID_MSB:SF2PTCALC_MDTID_LSB]           <= slc_mdtid;
		  le_output[SF2PTCALC_SEGQUALITY_MSB:SF2PTCALC_SEGQUALITY_LSB] <= sf_segquality;
	          le_output[SF2PTCALC_SEGANGLE_MSB:SF2PTCALC_SEGANGLE_LSB]     <= theta_global;
		  le_output[SF2PTCALC_SEGPOS_MSB:SF2PTCALC_SEGPOS_LSB]         <= sf_segpos;
		  le_output[SF2PTCALC_MUID_MSB:SF2PTCALC_MUID_LSB]             <= slc_muid;
		  le_output[SF2PTCALC_DATA_VALID_MSB]                          <= 1'b1;

		//  le_output    <= {1'b1,slc_muid,sf_segpos,theta_global,sf_segquality,slc_mdtid};
		  le_tb_output[63:0] = res_max_bin_count;
		end // if (sf_segpos_vld)
	     else
	        begin
		  le_output[SF2PTCALC_DATA_VALID_MSB]                          <= 1'b0;
		end
	  end // else: !if(rst && srst)
     end // always @ (posedge clk)


     always @ (posedge clk)
     begin
	if(rst && srst)
	  begin
	     le_state         <= IDLE;
	     counter          <= 0;
	     hba_reset        <= 1'b0;
	     get_first_hit_r  <= 1'b0;
	     get_next_hit     <= 1'b0;
	     results_ap_start <= 1'b0;
	     hba_ap_start     <= 16'b0;
	     ll_ap_start      <= 1'b0;
	     le_state_prev    <= IDLE;
	     hba_reset_mode   <= 1'b0;
	     hba_results_rdy  <= 1'b0;
	     latency_count    <= 5'h1f;
	     hba_mem_enable   <= 8'b0;
	     ll_ap_done_d     <= 4'b0;
	     gra_ap_start     <= 1'b0;
	     hba_ap_idle_d0   <= 1'b0;
	     hba_ap_ready_d0  <= 1'b0;
	     gtv_ap_idle_d0   <= 1'b0;
	     gtv_ap_idle_d1   <= 1'b0;
	     gtv_ap_idle_d2   <= 1'b0;
	     trig_vals_loaded <= 1'b0;
	     ll_reset         <= 1'b1;
	     hba_reset_fo     <= 16'hffff;
	     results_ap_done_d<= 0;
	     hit_extraction_roi_re  <= 0;
	     gra_resource_sharing   <= 0;
	     gra_total_bins         <= THETA_BINS;
	     results_ap_idle_d0     <= 0;
  	     histogram_reset_n      <= 1'h0;
	  end
	else
	  begin
	     le_state_prev    <= le_state;

	     results_ap_done_d <= results_ap_done;
	     results_ap_idle_d0     <= results_ap_idle;
	     ll_ap_done_d   <= {ll_ap_done_d[2:0],ll_ap_done};
	     hba_ap_idle_d0 <= hba_ap_idle;
	     hba_ap_ready_d0<= hba_ap_ready;//Assuming all blocks have same latency, so okay to look at ready signal from one block
	     gtv_ap_idle_d0   <= gtv_ap_idle;
	     gtv_ap_idle_d1  <= gtv_ap_idle_d0;
	     gtv_ap_idle_d2  <= gtv_ap_idle_d1;

	     trig_vals_loaded <= ~gtv_ap_idle_d0 & gtv_ap_idle;
	    // trig_vals_loaded <= ~gtv_ap_idle_d2 & gtv_ap_idle_d1;



	     case(le_state)
	       IDLE:
		 begin
		    ll_ap_start      <= 1'b0;
		    hba_ap_start     <= 16'b0;
		    results_ap_start <= 1'b0;
		    counter          <= 32'b0;
		    ll_reset         <= 1'b0;
		    hba_reset        <= 1'b0;
		    hba_reset_fo     <= 16'b0;
		    get_first_hit_r  <= 1'b0;
		    get_next_hit     <= 1'b0;
		    hba_reset_mode   <= 1'b0;
		    hba_results_rdy  <= 1'b0;
		    latency_count    <= 5'h1f;
		    hba_mem_enable   <= 8'b0;
		    gra_resource_sharing <= 1'b0;
		    gra_total_bins       <= THETA_BINS;
  		    histogram_reset_n    <= 1'h0;
		  //  if(hba_ap_idle_d0 & results_ap_idle_d0 & gtv_ap_idle_d0)
		    if(results_ap_idle_d0 & gtv_ap_idle_d0)
		      begin
			 if(~hit_extraction_roi_empty)
			   begin
			      hit_extraction_roi_re  <= (hit_extraction_roi_re)? 0 : 1;
			      gra_ap_start           <= 1'b0;
			   end
			 else
			   begin
			      hit_extraction_roi_re  <= 0;
			   end
			 if(roi_seed_theta_mrad_vld) //hit_extraction_roi_re )
			   begin
			      le_state               <= LOAD_LUTS;
			      gra_ap_start           <= 1'b1;
			   end
		      end
		 end // case: IDLE
	       LOAD_LUTS:
		 begin
		    ll_ap_start      <= 1'b0;
		    gra_ap_start     <= 1'b0;
		    counter          <= 0;
		    hba_reset        <= 1'b0;
		    hba_reset_fo     <= 16'b0;
		    hba_reset_mode   <= 1'b0;
		    hba_results_rdy  <= 1'b0;
		    latency_count    <= 5'h1f;
		    ll_reset         <= 1'b0;
		    get_next_hit     <= 1'b0;
		    hit_extraction_roi_re  <= 0;
		    gra_resource_sharing   <= 1'b0;
		    gra_total_bins         <= THETA_BINS;

		    // if(ll_ap_done_d[3])
		  //  if(trig_vals_loaded)//~theta_offset_factor_sn_vld_128)
	          // if(trig_val_counter_2 == 4)
     	           if(cro_ap_done)
		      begin
			 le_state       <= HISTOGRAM_BIN_ACCUMULATION;
			 hba_ap_start   <= 16'hffff;
			 get_first_hit_r<= 1'b1;
			 hba_mem_enable   <= 0;//16'hffff;
              	         histogram_reset_n  <= 1'h1;
		      end
		    else
		      begin
			 hba_ap_start   <= 16'b0;
			 get_first_hit_r<= 1'b0;
			 hba_mem_enable <= 16'b0;
               	         histogram_reset_n  <= 1'h0;
		      end
		 end
	       HISTOGRAM_BIN_ACCUMULATION:
		 begin
		    ll_ap_start     <= 1'b0;
		    hba_reset       <= 1'b0;
		    hba_reset_fo    <= 16'b0;
		    hba_reset_mode  <= 1'b0;
		    hba_results_rdy <= 1'b0;
		    gra_resource_sharing <= 1'b0;
		    gra_total_bins       <= 0;
 	            histogram_reset_n  <= 1'h1;
		    if(~get_first_hit_r)
		      get_next_hit    <= ~get_next_hit;

		    if(mdt_hit_re)
		      begin
			 latency_count   <= 0;
			 get_first_hit_r <= 1'b0;
			 hba_ap_start    <= 16'hffff;
		         hba_mem_enable  <= (counter == hba_latency + 1)? 16'hffff : hba_mem_enable;
		      end
		    else
 		      begin
			 if(latency_count == hba_latency + hba_mem_latency)
			   begin
			     hba_mem_enable  <= 16'h1;
			   end
			  else
			   begin
			     latency_count   <= latency_count + 1;
			     hba_ap_start    <= 16'hffff;
			     hba_mem_enable  <= (counter == hba_latency + 2)? 16'hffff : hba_mem_enable;
			  end
		      end // else: !if(mdt_hit_vld)

		    if(counter == histogram_accumulation_count-1)begin
		       le_state       <= HISTOGRAM_BIN_FLUSH_PIPELINE;
		       counter        <= 0;
		    end
		    else begin
		       counter        <= counter + 32'b1;
		    end
		 end // case: HISTOGRAM_BIN_ACCUMULATION
	       HISTOGRAM_BIN_FLUSH_PIPELINE:
		 begin
		    ll_reset       <= 1'b1;
		    hba_ap_start   <= 16'b0;
		    gra_total_bins <= 0;
 	            histogram_reset_n  <= 1'h1;

		    if(latency_count == hba_latency + hba_mem_latency)
		      begin
			 hba_results_rdy      <= 1'b1;
			 gra_resource_sharing <= 1'b1;
			 gra_ap_start         <= 1'b0; //Wait for global theta from find_max_bin
			 le_state        <= COMPUTE_RESULTS;
			 counter         <= 32'b0;
			 latency_count   <= latency_count + 1;
			 hba_mem_enable  <= 16'h0;
		      end
		    else
		      begin
			 latency_count <= (latency_count == hba_latency + hba_mem_latency)?latency_count : latency_count + 1;
		      end
		 end
	       COMPUTE_RESULTS:
		 begin
		    counter              <= counter + 32'b1;
		    hba_results_rdy      <= 1'b0;
		    gra_resource_sharing <= 1'b1;
		    gra_total_bins       <= 0;
		    hba_ap_ready_reg     <= hba_ap_ready_d0;
 		   // gra_ap_start         <= (counter == find_max_bin_latency -1)? 1'b1 : 1'b0;//(gra_theta_vld)? 1'b0 : gra_ap_start;
 		    gra_ap_start         <= (counter ==  find_max_bin_latency)? 1'b1 : 1'b0;//(gra_theta_vld)? 1'b0 : gra_ap_start;
 	            histogram_reset_n    <= 1'h1;
		    if(hba_results_rdy)
		    begin
			 hba_reset_mode   <= 1'b1;
		         hba_reset_fo     <= 16'hffff;
			 hba_reset        <= 1'b1;
			 results_ap_start <= 1'b1;//Start computing slope/intercept
 		         hba_ap_start     <= 16'h0;//16'hffff;
			 hba_mem_enable   <= 16'b0;
		      end
		    else
		      begin
			 results_ap_start <= 1'b0;
			 hba_ap_start       <= (hba_ap_ready_reg)? 16'b0 : hba_ap_start; //Reset Bins
		      end

		    if(gls_ap_done)
		      begin
			 le_state         <= HBA_MEMORY_RESET;
		      end
		  end // case: COMPUTE_RESULTS
	        HBA_MEMORY_RESET:
		  begin
 		    counter <= counter + 32'b1;
		    if(counter == hba_reset_clocks)
		    begin
		      hba_reset_fo     <= 16'hffff;
		      le_state         <= IDLE;
              	      histogram_reset_n <= 1'h0;
		    end
		  end
	     endcase
	  end
     end


`ifdef RUN_SIM
get_rom_addr get_rom_addr_inst(
`else
hls_get_rom_addr get_rom_addr_inst(
`endif
				.ap_clk(clk),
				.ap_rst(ap_rst_gra), //|hba_reset_fo[0]),
				.ap_start(gra_ap_start),
				.ap_done(gra_ap_done),
				.ap_idle(gra_ap_idle),
				.ap_ready(gra_ap_ready),
			//	.theta_for_lut_V_ap_vld(gra_theta_vld),
				.theta_for_lut_V(theta_global_gra),//gra_theta),
				.rom_index_V(triglut_first_bank),
			//	.rom_index_V_ap_vld(),
				.lut_start_addr_V(triglut_start_addr),
				//.lut_start_addr_V_ap_vld(),
			        .lbins0_gbl1_V(gra_theta_vld),
			       .slcvec_offset_angle_int_V(roi_seed_theta),
			       .slcvec_angle_polar_offset_mrad_V(roi_seed_theta_mrad)

				);

`ifdef RUN_SIM
get_trig_vals get_trig_vals_inst(
`else
hls_get_trig_vals get_trig_vals_inst(
`endif
				 .ap_clk(clk),
				 .ap_rst((ap_rst_gra)), // | hba_reset)),
				 .ap_start(get_next_rom_addr),//theta_offset_factor_sn_vld_128),//sin_addr_offset_V_TVALID),
				 .ap_done(gtv_ap_done),
				 .ap_idle(gtv_ap_idle),
				 .ap_ready(gtv_ap_ready),
				 .rom_idx_V(triglut_first_bank_d),
				 .lut_start_addr_V(triglut_addr),

				 .hw_trig_vals_0_V(hw_trig_vals[0]),
				 .hw_trig_vals_1_V(hw_trig_vals[1]),
				 .hw_trig_vals_2_V(hw_trig_vals[2]),
				 .hw_trig_vals_3_V(hw_trig_vals[3]),
				 .hw_trig_vals_4_V(hw_trig_vals[4]),
				 .hw_trig_vals_5_V(hw_trig_vals[5]),
				 .hw_trig_vals_6_V(hw_trig_vals[6]),
				 .hw_trig_vals_7_V(hw_trig_vals[7]),
				 .hw_trig_vals_8_V(hw_trig_vals[8]),
				 .hw_trig_vals_9_V(hw_trig_vals[9]),
				 .hw_trig_vals_10_V(hw_trig_vals[10]),
				 .hw_trig_vals_11_V(hw_trig_vals[11]),
				 .hw_trig_vals_12_V(hw_trig_vals[12]),
				 .hw_trig_vals_13_V(hw_trig_vals[13]),
				 .hw_trig_vals_14_V(hw_trig_vals[14]),
				 .hw_trig_vals_15_V(hw_trig_vals[15])
				 );


`ifdef RUN_SIM
find_max_bin find_max_bin_inst(
`else
hls_find_max_bin find_max_bin_inst(
`endif
				  .ap_clk(clk),
				  .ap_rst(ap_rst),
				  .ap_start(results_ap_start),
				  .ap_done(results_ap_done),
				  .ap_idle(results_ap_idle),
				  .ap_ready(results_ap_ready),
				  .slcvec_angle_polar_offset_mrad_V(roi_seed_theta_mrad),
				  .roi_seed_r_V(roi_seed_r),
.max_bin_count_0_V(max_bin_count[0]),
.max_bin_r_0_V(max_bin_r[0]),
.max_bin_count_1_V(max_bin_count[1]),
.max_bin_r_1_V(max_bin_r[1]),
.max_bin_count_2_V(max_bin_count[2]),
.max_bin_r_2_V(max_bin_r[2]),
.max_bin_count_3_V(max_bin_count[3]),
.max_bin_r_3_V(max_bin_r[3]),
.max_bin_count_4_V(max_bin_count[4]),
.max_bin_r_4_V(max_bin_r[4]),
.max_bin_count_5_V(max_bin_count[5]),
.max_bin_r_5_V(max_bin_r[5]),
.max_bin_count_6_V(max_bin_count[6]),
.max_bin_r_6_V(max_bin_r[6]),
.max_bin_count_7_V(max_bin_count[7]),
.max_bin_r_7_V(max_bin_r[7]),
.max_bin_count_8_V(max_bin_count[8]),
.max_bin_r_8_V(max_bin_r[8]),
.max_bin_count_9_V(max_bin_count[9]),
.max_bin_r_9_V(max_bin_r[9]),
.max_bin_count_10_V(max_bin_count[10]),
.max_bin_r_10_V(max_bin_r[10]),
.max_bin_count_11_V(max_bin_count[11]),
.max_bin_r_11_V(max_bin_r[11]),
.max_bin_count_12_V(max_bin_count[12]),
.max_bin_r_12_V(max_bin_r[12]),
.max_bin_count_13_V(max_bin_count[13]),
.max_bin_r_13_V(max_bin_r[13]),
.max_bin_count_14_V(max_bin_count[14]),
.max_bin_r_14_V(max_bin_r[14]),
.max_bin_count_15_V(max_bin_count[15]),
.max_bin_r_15_V(max_bin_r[15]),
.max_bin_count_16_V(max_bin_count[16]),
.max_bin_r_16_V(max_bin_r[16]),
.max_bin_count_17_V(max_bin_count[17]),
.max_bin_r_17_V(max_bin_r[17]),
.max_bin_count_18_V(max_bin_count[18]),
.max_bin_r_18_V(max_bin_r[18]),
.max_bin_count_19_V(max_bin_count[19]),
.max_bin_r_19_V(max_bin_r[19]),
.max_bin_count_20_V(max_bin_count[20]),
.max_bin_r_20_V(max_bin_r[20]),
.max_bin_count_21_V(max_bin_count[21]),
.max_bin_r_21_V(max_bin_r[21]),
.max_bin_count_22_V(max_bin_count[22]),
.max_bin_r_22_V(max_bin_r[22]),
.max_bin_count_23_V(max_bin_count[23]),
.max_bin_r_23_V(max_bin_r[23]),
.max_bin_count_24_V(max_bin_count[24]),
.max_bin_r_24_V(max_bin_r[24]),
.max_bin_count_25_V(max_bin_count[25]),
.max_bin_r_25_V(max_bin_r[25]),
.max_bin_count_26_V(max_bin_count[26]),
.max_bin_r_26_V(max_bin_r[26]),
.max_bin_count_27_V(max_bin_count[27]),
.max_bin_r_27_V(max_bin_r[27]),
.max_bin_count_28_V(max_bin_count[28]),
.max_bin_r_28_V(max_bin_r[28]),
.max_bin_count_29_V(max_bin_count[29]),
.max_bin_r_29_V(max_bin_r[29]),
.max_bin_count_30_V(max_bin_count[30]),
.max_bin_r_30_V(max_bin_r[30]),
.max_bin_count_31_V(max_bin_count[31]),
.max_bin_r_31_V(max_bin_r[31]),
.max_bin_count_32_V(max_bin_count[32]),
.max_bin_r_32_V(max_bin_r[32]),
.max_bin_count_33_V(max_bin_count[33]),
.max_bin_r_33_V(max_bin_r[33]),
.max_bin_count_34_V(max_bin_count[34]),
.max_bin_r_34_V(max_bin_r[34]),
.max_bin_count_35_V(max_bin_count[35]),
.max_bin_r_35_V(max_bin_r[35]),
.max_bin_count_36_V(max_bin_count[36]),
.max_bin_r_36_V(max_bin_r[36]),
.max_bin_count_37_V(max_bin_count[37]),
.max_bin_r_37_V(max_bin_r[37]),
.max_bin_count_38_V(max_bin_count[38]),
.max_bin_r_38_V(max_bin_r[38]),
.max_bin_count_39_V(max_bin_count[39]),
.max_bin_r_39_V(max_bin_r[39]),
.max_bin_count_40_V(max_bin_count[40]),
.max_bin_r_40_V(max_bin_r[40]),
.max_bin_count_41_V(max_bin_count[41]),
.max_bin_r_41_V(max_bin_r[41]),
.max_bin_count_42_V(max_bin_count[42]),
.max_bin_r_42_V(max_bin_r[42]),
.max_bin_count_43_V(max_bin_count[43]),
.max_bin_r_43_V(max_bin_r[43]),
.max_bin_count_44_V(max_bin_count[44]),
.max_bin_r_44_V(max_bin_r[44]),
.max_bin_count_45_V(max_bin_count[45]),
.max_bin_r_45_V(max_bin_r[45]),
.max_bin_count_46_V(max_bin_count[46]),
.max_bin_r_46_V(max_bin_r[46]),
.max_bin_count_47_V(max_bin_count[47]),
.max_bin_r_47_V(max_bin_r[47]),
.max_bin_count_48_V(max_bin_count[48]),
.max_bin_r_48_V(max_bin_r[48]),
.max_bin_count_49_V(max_bin_count[49]),
.max_bin_r_49_V(max_bin_r[49]),
.max_bin_count_50_V(max_bin_count[50]),
.max_bin_r_50_V(max_bin_r[50]),
.max_bin_count_51_V(max_bin_count[51]),
.max_bin_r_51_V(max_bin_r[51]),
.max_bin_count_52_V(max_bin_count[52]),
.max_bin_r_52_V(max_bin_r[52]),
.max_bin_count_53_V(max_bin_count[53]),
.max_bin_r_53_V(max_bin_r[53]),
.max_bin_count_54_V(max_bin_count[54]),
.max_bin_r_54_V(max_bin_r[54]),
.max_bin_count_55_V(max_bin_count[55]),
.max_bin_r_55_V(max_bin_r[55]),
.max_bin_count_56_V(max_bin_count[56]),
.max_bin_r_56_V(max_bin_r[56]),
.max_bin_count_57_V(max_bin_count[57]),
.max_bin_r_57_V(max_bin_r[57]),
.max_bin_count_58_V(max_bin_count[58]),
.max_bin_r_58_V(max_bin_r[58]),
.max_bin_count_59_V(max_bin_count[59]),
.max_bin_r_59_V(max_bin_r[59]),
.max_bin_count_60_V(max_bin_count[60]),
.max_bin_r_60_V(max_bin_r[60]),
.max_bin_count_61_V(max_bin_count[61]),
.max_bin_r_61_V(max_bin_r[61]),
.max_bin_count_62_V(max_bin_count[62]),
.max_bin_r_62_V(max_bin_r[62]),
.max_bin_count_63_V(max_bin_count[63]),
.max_bin_r_63_V(max_bin_r[63]),
				   /*
.max_bin_count_64_V(max_bin_count[64]),
.max_bin_r_64_V(max_bin_r[64]),
.max_bin_count_65_V(max_bin_count[65]),
.max_bin_r_65_V(max_bin_r[65]),
.max_bin_count_66_V(max_bin_count[66]),
.max_bin_r_66_V(max_bin_r[66]),
.max_bin_count_67_V(max_bin_count[67]),
.max_bin_r_67_V(max_bin_r[67]),
.max_bin_count_68_V(max_bin_count[68]),
.max_bin_r_68_V(max_bin_r[68]),
.max_bin_count_69_V(max_bin_count[69]),
.max_bin_r_69_V(max_bin_r[69]),
.max_bin_count_70_V(max_bin_count[70]),
.max_bin_r_70_V(max_bin_r[70]),
.max_bin_count_71_V(max_bin_count[71]),
.max_bin_r_71_V(max_bin_r[71]),
.max_bin_count_72_V(max_bin_count[72]),
.max_bin_r_72_V(max_bin_r[72]),
.max_bin_count_73_V(max_bin_count[73]),
.max_bin_r_73_V(max_bin_r[73]),
.max_bin_count_74_V(max_bin_count[74]),
.max_bin_r_74_V(max_bin_r[74]),
.max_bin_count_75_V(max_bin_count[75]),
.max_bin_r_75_V(max_bin_r[75]),
.max_bin_count_76_V(max_bin_count[76]),
.max_bin_r_76_V(max_bin_r[76]),
.max_bin_count_77_V(max_bin_count[77]),
.max_bin_r_77_V(max_bin_r[77]),
.max_bin_count_78_V(max_bin_count[78]),
.max_bin_r_78_V(max_bin_r[78]),
.max_bin_count_79_V(max_bin_count[79]),
.max_bin_r_79_V(max_bin_r[79]),
.max_bin_count_80_V(max_bin_count[80]),
.max_bin_r_80_V(max_bin_r[80]),
.max_bin_count_81_V(max_bin_count[81]),
.max_bin_r_81_V(max_bin_r[81]),
.max_bin_count_82_V(max_bin_count[82]),
.max_bin_r_82_V(max_bin_r[82]),
.max_bin_count_83_V(max_bin_count[83]),
.max_bin_r_83_V(max_bin_r[83]),
.max_bin_count_84_V(max_bin_count[84]),
.max_bin_r_84_V(max_bin_r[84]),
.max_bin_count_85_V(max_bin_count[85]),
.max_bin_r_85_V(max_bin_r[85]),
.max_bin_count_86_V(max_bin_count[86]),
.max_bin_r_86_V(max_bin_r[86]),
.max_bin_count_87_V(max_bin_count[87]),
.max_bin_r_87_V(max_bin_r[87]),
.max_bin_count_88_V(max_bin_count[88]),
.max_bin_r_88_V(max_bin_r[88]),
.max_bin_count_89_V(max_bin_count[89]),
.max_bin_r_89_V(max_bin_r[89]),
.max_bin_count_90_V(max_bin_count[90]),
.max_bin_r_90_V(max_bin_r[90]),
.max_bin_count_91_V(max_bin_count[91]),
.max_bin_r_91_V(max_bin_r[91]),
.max_bin_count_92_V(max_bin_count[92]),
.max_bin_r_92_V(max_bin_r[92]),
.max_bin_count_93_V(max_bin_count[93]),
.max_bin_r_93_V(max_bin_r[93]),
.max_bin_count_94_V(max_bin_count[94]),
.max_bin_r_94_V(max_bin_r[94]),
.max_bin_count_95_V(max_bin_count[95]),
.max_bin_r_95_V(max_bin_r[95]),
.max_bin_count_96_V(max_bin_count[96]),
.max_bin_r_96_V(max_bin_r[96]),
.max_bin_count_97_V(max_bin_count[97]),
.max_bin_r_97_V(max_bin_r[97]),
.max_bin_count_98_V(max_bin_count[98]),
.max_bin_r_98_V(max_bin_r[98]),
.max_bin_count_99_V(max_bin_count[99]),
.max_bin_r_99_V(max_bin_r[99]),
.max_bin_count_100_V(max_bin_count[100]),
.max_bin_r_100_V(max_bin_r[100]),
.max_bin_count_101_V(max_bin_count[101]),
.max_bin_r_101_V(max_bin_r[101]),
.max_bin_count_102_V(max_bin_count[102]),
.max_bin_r_102_V(max_bin_r[102]),
.max_bin_count_103_V(max_bin_count[103]),
.max_bin_r_103_V(max_bin_r[103]),
.max_bin_count_104_V(max_bin_count[104]),
.max_bin_r_104_V(max_bin_r[104]),
.max_bin_count_105_V(max_bin_count[105]),
.max_bin_r_105_V(max_bin_r[105]),
.max_bin_count_106_V(max_bin_count[106]),
.max_bin_r_106_V(max_bin_r[106]),
.max_bin_count_107_V(max_bin_count[107]),
.max_bin_r_107_V(max_bin_r[107]),
.max_bin_count_108_V(max_bin_count[108]),
.max_bin_r_108_V(max_bin_r[108]),
.max_bin_count_109_V(max_bin_count[109]),
.max_bin_r_109_V(max_bin_r[109]),
.max_bin_count_110_V(max_bin_count[110]),
.max_bin_r_110_V(max_bin_r[110]),
.max_bin_count_111_V(max_bin_count[111]),
.max_bin_r_111_V(max_bin_r[111]),
.max_bin_count_112_V(max_bin_count[112]),
.max_bin_r_112_V(max_bin_r[112]),
.max_bin_count_113_V(max_bin_count[113]),
.max_bin_r_113_V(max_bin_r[113]),
.max_bin_count_114_V(max_bin_count[114]),
.max_bin_r_114_V(max_bin_r[114]),
.max_bin_count_115_V(max_bin_count[115]),
.max_bin_r_115_V(max_bin_r[115]),
.max_bin_count_116_V(max_bin_count[116]),
.max_bin_r_116_V(max_bin_r[116]),
.max_bin_count_117_V(max_bin_count[117]),
.max_bin_r_117_V(max_bin_r[117]),
.max_bin_count_118_V(max_bin_count[118]),
.max_bin_r_118_V(max_bin_r[118]),
.max_bin_count_119_V(max_bin_count[119]),
.max_bin_r_119_V(max_bin_r[119]),
.max_bin_count_120_V(max_bin_count[120]),
.max_bin_r_120_V(max_bin_r[120]),
.max_bin_count_121_V(max_bin_count[121]),
.max_bin_r_121_V(max_bin_r[121]),
.max_bin_count_122_V(max_bin_count[122]),
.max_bin_r_122_V(max_bin_r[122]),
.max_bin_count_123_V(max_bin_count[123]),
.max_bin_r_123_V(max_bin_r[123]),
.max_bin_count_124_V(max_bin_count[124]),
.max_bin_r_124_V(max_bin_r[124]),
.max_bin_count_125_V(max_bin_count[125]),
.max_bin_r_125_V(max_bin_r[125]),
.max_bin_count_126_V(max_bin_count[126]),
.max_bin_r_126_V(max_bin_r[126]),
.max_bin_count_127_V(max_bin_count[127]),
.max_bin_r_127_V(max_bin_r[127]),
				    */
			       	  .hls_LT_theta_global_V(theta_global),
				  .hls_LT_theta_global_V_ap_vld(theta_global_vld),
				  .hls_LT_r_global_V(r_global),
				  .hls_LT_r_global_V_ap_vld(r_global_vld),
				  .hls_LT_theta_V(theta),
				  .hls_LT_theta_V_ap_vld(theta_vld),
				  .hls_LT_r_V(r),
				  .hls_LT_r_V_ap_vld(r_vld),
				  .res_max_bin_count_V(res_max_bin_count),
				  .res_max_bin_count_V_ap_vld(res_max_bin_count_vld),
				  .res_max_bin_theta_V(res_max_bin_theta),
				  .res_max_bin_theta_V_ap_vld(rest_max_bin_theta_vld),
				  .res_max_bin_r_V(res_max_bin_r),
				  .res_max_bin_r_V_ap_vld(res_max_bin_r_vld)
				  );

  endmodule

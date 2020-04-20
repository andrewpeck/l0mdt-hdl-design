`timescale 1ns/1ps

`ifndef L0MDT_BUS_CONSTANTS
`define L0MDT_BUS_CONSTANTS
`include "l0mdt_buses_constants.svh"
`endif

module legendreEngine(
		      input 		   clk,
		      input 		   rst,
		      input 		   srst,
		      input logic [191:0]  mdt_hit,
		      input logic 	   mdt_hit_empty, 
		      output logic 	   mdt_hit_re,
		      input logic [391:0]  hit_extraction_roi,
		      input 		   hit_extraction_roi_empty, 
		      output logic 	   hit_extraction_roi_re,
		      input logic [9:0]    histogram_accumulation_count,
		      output logic [383:0] le_output,
		      output logic 	   le_output_vld,
		      output logic [511:0] le_tb_output,
		      output logic 	   le_tb_output_vld
		      );
   
   parameter THETA_BINS=128;
   const int TRIG_BITS= 24;
   
   logic [23:0] 		   hw_sin_val[THETA_BINS];
   logic [23:0] 		   hw_cos_val[THETA_BINS];
   logic [23:0] 		   hw_sin_val_i[THETA_BINS];
   logic [23:0] 		   hw_cos_val_i[THETA_BINS];

   logic [23:0] 		   hw_sin_val_k[THETA_BINS];
   logic [23:0] 		   hw_cos_val_k[THETA_BINS];
 

   logic [191:0] 		   hw_sin_val_axis;
   logic [191:0] 		   hw_cos_val_axis;
   logic 			   hw_sin_val_axis_vld;
   logic 			   hw_cos_val_axis_vld;
   logic [3:0] 			   trig_axis_cnt;
   


   logic [191:0] 		   hw_sin_val_axis_d[16];
   logic [191:0] 		   hw_cos_val_axis_d[16];
   logic [7:0]			   hw_sin_val_axis_vld_d;
   logic [7:0]			   hw_cos_val_axis_vld_d;
   
 
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
 
   
   
   logic [21:0] 		   roi_seed_theta;
   
   logic [7:0] 			   region;
   logic [12:0] 		   roi_seed_r[9];
   
   logic [SLCPROC_HPS_SF_VEC_POS_LEN - 1:0] roi_offset_z[9];
   logic [SLCPROC_HPS_SF_VEC_POS_LEN - 1:0] roi_offset_R[9];
   logic [SLCPROC_HPS_SF_VEC_POS_LEN - 1:0] geo_pos_R;
   logic [SLCPROC_HPS_SF_VEC_POS_LEN - 1:0] geo_pos_Z;
 
   logic [383:0] 		   le_results;
   logic 			   le_results_vld;

   //Load Luts Control Signals
   logic 			   ll_ap_start;
   logic 			   ll_ap_done;
   logic 			   ll_ap_idle;
   logic 			   ll_ap_ready;
   logic [3:0]			   ll_ap_done_d;
   logic 			   ll_reset;
   

   logic 			   gra_ap_start;
   logic 			   gra_ap_done;
   logic 			   gra_ap_idle;
   logic [21:0] 		   gra_theta;
   logic 			   gra_theta_vld;
   logic [13:0] 		   gra_total_bins; 		   
   logic 			   gra_resource_sharing;
   

   logic 			   gtv_ap_idle;
   logic 			   gtv_ap_done;
   logic 			   gtv_ap_ready;
   logic 			   gtv_ap_idle_d0;
   logic 			   gtv_ap_idle_d1;
      
   //Histogram Bin Accumulation Control Signals
   logic [15:0] 		   hba_ap_start;
   logic 			   hba_ap_done;
   logic 			   hba_ap_idle;
   logic 			   hba_ap_ready;
   logic 			   hba_reset;
   logic [7:0] 			   hba_mem_enable;
 
   logic 			   hba_ap_idle_d0;
   logic 			   hba_ap_ready_d0;
   
   logic [391:0] 		   hit_extraction_roi_internal;
   logic 			   hit_extraction_roi_vld;
   
   
   
   logic [9:0] 			   counter;
   const logic [3:0] 		   hba_latency             = 12; //14; //12; //6; //5;//4; //6;//10; //7; //14;
   const logic [3:0] 		   hba_mem_latency         = 3; //7; //6;//10; //7; //14;
   const logic [3:0] 		   reset_cycles = 10;
   logic 			   get_first_hit;
   logic 			   get_first_hit_r;
   logic 			   get_next_hit;
   
   logic 			   mdt_hit_vld_internal;
   logic [191:0] 		   mdt_hit_internal;
   logic [8:0] 			   mdt_hit_vld_internal_fo;
   logic [191:0] 		   mdt_hit_internal_fo[8];
   logic 			   hba_reset_mode;
   logic 			   hba_results_rdy;
   logic 			   hba_ap_ready_reg;
   
   
   logic [2:0] 			   le_state_prev;
   logic [4:0] 			   latency_count;
   logic [3:0] 			   latency_count_vld;
   logic 			   flush_pipeline;

   logic [THETA_BINS-1:0] 	   compute_rbin_ap_done;
   logic [THETA_BINS-1:0] 	   compute_rbin_ap_idle;
   logic [THETA_BINS-1:0] 	   compute_rbin_ap_ready;
 

   logic [THETA_BINS-1:0] 	   update_max_rbin_ap_done;
   logic [THETA_BINS-1:0] 	   update_max_rbin_ap_idle;
   logic [THETA_BINS-1:0] 	   update_max_rbin_ap_ready;
   logic 			   hba_update_max_rbin_ap_ready;
   
   
   logic [7:0] 			   r_bin[THETA_BINS];
   logic  			   r_bin_vld[THETA_BINS];
   logic  			   r_bin_rdy[THETA_BINS];

   logic [7:0] 			   r_bin_d[THETA_BINS];
   logic  			   r_bin_d_vld[THETA_BINS];
 
   logic [3:0] 			   r_val_hist[THETA_BINS];
   logic  			   r_val_hist_vld[THETA_BINS];
   logic  			   r_val_hist_rdy[THETA_BINS];
   logic  			   r_val_hist_vld_i[THETA_BINS];

   logic 			   ap_rst_gra;
   
   
    enum 			   {IDLE, LOAD_LUTS_GRA, LOAD_LUTS, HISTOGRAM_BIN_ACCUMULATION, HISTOGRAM_BIN_FLUSH_PIPELINE, RESET_HISTOGRAM_BINS, COMPUTE_RESULTS} le_state;


   
   
   
 
   logic [1:0] 			   theta_offset_factor_sn;
   logic 			   theta_offset_factor_sn_vld;

   logic [14:0] 		   sin_rom_addr_reg;
   logic [14:0] 		   cos_rom_addr_reg;
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
   
   logic [2:0]			   trig_val_counter;
   logic [2:0] 			   trig_val_counter_2;
   logic [5:0]			   rom_offset_i;
   
   

   logic 			   trig_vals_loaded;
   logic [7:0] 			   hba_reset_fo;
   
   logic 			   toggle_fp;
   logic [23:0] 		   hw_cos_val_16[16];
   logic [23:0] 		   hw_sin_val_16[16];
   logic [23:0] 		   hw_sin_val_16_fo0[THETA_BINS/4];
   logic [23:0] 		   hw_sin_val_16_fo1[THETA_BINS/4];
   logic [23:0] 		   hw_sin_val_16_fo2[THETA_BINS/4];
   logic [23:0] 		   hw_sin_val_16_fo3[THETA_BINS/4];
   logic [23:0] 		   hw_cos_val_16_fo0[THETA_BINS/4];
   logic [23:0] 		   hw_cos_val_16_fo1[THETA_BINS/4];
   logic [23:0] 		   hw_cos_val_16_fo2[THETA_BINS/4];
   logic [23:0] 		   hw_cos_val_16_fo3[THETA_BINS/4];
   logic [13:0] 		   sin_rom_addr_start[16];
   logic [13:0] 		   cos_rom_addr_start[16];
   logic [13:0] 		   sin_rom_addr[16];
   logic [13:0] 		   cos_rom_addr[16];
   logic [3:0] 			   sin_rom_sel[16];
   logic [3:0] 			   cos_rom_sel[16];
   logic [3:0] 			   sin_rom_sel_reg[16];
   logic [3:0] 			   cos_rom_sel_reg[16];
   logic 			   get_next_rom_addr;
   logic 			   get_next_rom_addr_d;
   logic  [14:0] theta_global;
   logic 	 theta_global_vld;
   logic [12:0]  r_global;
   logic 	 r_global_vld;
   logic [14:0]  theta;
   logic 	 theta_vld;
   logic [12:0]  r;
   logic 	 r_vld;
   logic [3:0] 	 res_max_bin_count;
   logic 	 res_max_bin_count_vld;
   logic [6:0] 	 res_max_bin_theta;
   logic 	 res_max_bin_theta_vld;
   logic [6:0] 	 res_max_bin_r;
   logic 	 res_max_bin_r_vld;
   
   logic [23:0]  gls_sin_val_V;
   logic [23:0]  gls_cos_val_V;
   
   logic 	 gls_ap_start;
   logic 	 gls_ap_done;
   logic 	 gls_ap_idle;
   logic 	 gls_ap_ready;
   logic 	 hw_sin_val_vld;
   logic 	 hw_cos_val_vld;
   logic [15:0] 	 hw_sin_val_vld_sreg;
   logic [15:0] 	 hw_cos_val_vld_sreg;
   logic [SLCPROC_HPS_SF_VEC_POS_LEN - 1:0] 	 hls_pos_Z;
   logic 		 hls_pos_Z_vld;
   logic [SLCPROC_HPS_SF_VEC_POS_LEN - 1:0] 	 hls_pos_R;
   logic 		 hls_pos_R_vld;   

   
`include "get_rom_addr_include.sv"
`include "compute_LE_interface.sv"
   
   assign theta_offset_factor_sn_vld_128 = theta_offset_factor_sn_vld | theta_offset_factor_sn_vld_127;
   assign get_first_hit               = get_first_hit_r;
   assign mdt_hit_re                 = (le_state == HISTOGRAM_BIN_ACCUMULATION)? (~mdt_hit_empty & (get_next_hit | get_first_hit)) : 1'b0;
   assign gra_theta     = (gra_resource_sharing == 0)? roi_seed_theta : (theta_global<<7);
   assign gra_theta_vld = (gra_resource_sharing == 0)? hit_extraction_roi_vld : theta_global_vld;


   			

			

   assign gls_ap_start = gra_resource_sharing & (hw_sin_val_vld_sreg===3);
   
   get_legendre_segment get_legendre_segment(
					     .ap_clk(clk),
					     .ap_rst(ap_rst),
					     .ap_start(gls_ap_start),
					     .ap_done(gls_ap_done),
					     .ap_idle(gls_ap_idle),
					     .ap_ready(gls_ap_ready),
					     .region(region),
					     .hls_sin_val_V(hw_sin_val[0]),
					     .hls_cos_val_V(hw_cos_val[0]),
					     .hls_LT_r_global_V(r_global),
					     
					     
					     .roi_offset_z_V(roi_offset_z[8]),
					     .roi_offset_R_V(roi_offset_R[8]),
					     .geo_pos_R_V(geo_pos_R),
					     .geo_pos_Z_V(geo_pos_Z),
					     
					     .res_max_bin_count_V(res_max_bin_count),
					     .res_max_bin_theta_V(res_max_bin_theta),
					     .res_max_bin_r_V(res_max_bin_r),
					     .hls_LT_theta_global_V(theta_global),
					     .hls_LT_theta_V(theta),
					     .hls_LT_r_V(r),
					     /*.hls_pos_Z_V(hls_pos_Z),
					     .hls_pos_Z_V_ap_vld(hls_pos_Z_vld),
					     .hls_pos_R_V(hls_pos_R),
					     .hls_pos_R_V_ap_vld(hls_pos_R_vld)
					      */
					     .LE_output_V(le_results),
					     .LE_output_V_ap_vld(le_results_vld),
					     .LE_tb_output_V(le_tb_output),
					     .LE_tb_output_V_ap_vld(le_tb_output_vld)
					     );


   assign latency_count_vld    = (latency_count != 4'hf);
   assign flush_pipeline       = (mdt_hit_re == 0) && latency_count_vld && (latency_count > 0) && (latency_count < hba_latency);
   
   assign mdt_hit_vld_internal  = ( mdt_hit_re) | hba_reset | (flush_pipeline & toggle_fp); 
   assign mdt_hit_internal      = ( mdt_hit_re)? mdt_hit : 0;
   assign hba_ap_idle           = (compute_rbin_ap_idle[0] == 1 )? 1 : 0; //All bins have same latency, so look at only one
   assign hba_ap_done           = (compute_rbin_ap_done == ~0 )? 1 : 0;

   assign hba_ap_ready          = (compute_rbin_ap_ready[0] == 1)? 1 : 0;//All bins have same latency, so look at only one
   assign hba_update_max_rbin_ap_ready          = ( update_max_rbin_ap_ready == ~0)? 1 : 0;
  
   
	    
       generate
	for(genvar z=0;z<THETA_BINS;z++)
	  begin:theta_bins
	     int k = z/16; // to reduce fanout of input signals
	     int j = z/8; // increase fanout for hba_ap_start
	     
	     compute_r_bins compute_r_bins_inst(
						.ap_clk(clk),
						.ap_rst_n(ap_rst_n),
						.ap_start(hba_ap_start[j]),
						.ap_done(compute_rbin_ap_done[z]),
						.ap_idle(compute_rbin_ap_idle[z]),
						.ap_ready(compute_rbin_ap_ready[z]),
						.mdt_hit_V_ap_vld(mdt_hit_vld_internal_fo[k]),
						.mdt_hit_V(mdt_hit_internal_fo[k]),
						.roi_seed_r_V(roi_seed_r[k]),
						.hw_sin_val_V(hw_sin_val[z]),
						.hw_cos_val_V(hw_cos_val[z]),
						.r_bin_V_TDATA(r_bin[z]),
						.r_bin_V_TVALID(r_bin_vld[z]),
						.r_bin_V_TREADY(r_bin_rdy[z]),
						.enable_V(1'b1),
     				    		.reset_V(hba_reset_fo[k])
						);


	     update_histogram update_histogram_inst(
						    .clk(clk),
						    .rst_n(ap_rst_n),
						    .r_bin_V_TVALID(r_bin_vld[z]),
						    .r_bin_V_TDATA(r_bin[z]),
						    .r_bin_V_TREADY(r_bin_rdy[z]),
						    .enable_V(hba_mem_enable[k]), //1'b1),
						    .local_max_count(max_bin_count_V[z]),
						    .local_max_vld(max_bin_count_V_vld[z]),
						    .local_max_rbin(max_bin_r_V[z]),
						    .reset_V(hba_reset_fo[k])
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
	     hit_extraction_roi_vld      <= 0;
	     
	     
	     for(int i=0; i< 9; i++)
	       begin
		  roi_offset_z[i]                <= 0;
		  roi_offset_R[i]                <= 0;
		  roi_seed_r[i]                  <= 0;
		  mdt_hit_internal_fo[i]         <= 0;
		  mdt_hit_vld_internal_fo[i]     <= 0;
	       end
	     geo_pos_R                   <= 0;
	     geo_pos_Z                   <= 0;
	     region                      <= 0;
	     
	  end
	else
	  begin
	     if(hit_extraction_roi_re)
	       begin
		  hit_extraction_roi_vld      <= 1'b1;
		  hit_extraction_roi_internal <= hit_extraction_roi ;
		  roi_seed_theta              <= hit_extraction_roi[21:0];
		    for(int i=0; i< 9; i++)
		      begin
			 roi_offset_z[i]      <= hit_extraction_roi[127:64];
			 roi_offset_R[i]      <= hit_extraction_roi[191:128];
			 roi_seed_r[i]        <= hit_extraction_roi[255:192];
		      end
		  geo_pos_R                   <= hit_extraction_roi[319:256];
		  geo_pos_Z                   <= hit_extraction_roi[383:320];
		  region                      <= hit_extraction_roi[391:384];

	
	       end // if (hit_extraction_roi_re )
	     else
	       begin
		  hit_extraction_roi_vld      <= 1'b0;
	       end
	     if(mdt_hit_vld_internal)
	       begin
		  mdt_hit_vld_internal_fo     <= 9'h1ff;
		  for(int i=0; i<8; i++)
		    begin
		       mdt_hit_internal_fo[i]         <= mdt_hit_internal;
		    end
	       end
	     else begin
		mdt_hit_vld_internal_fo     <= 9'b0;
		for(int i=0; i<8; i++)
		  begin
		     mdt_hit_internal_fo[i]         <= 0;
		  end
	     end
	  end
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
		  hw_sin_val_i[i] <= 0;
		  hw_cos_val_i[i] <= 0;
	       end

	     for(integer i=0;i<THETA_BINS/4;i++)
	       begin
		  hw_sin_val_16_fo0[i]   <= 0;
		  hw_cos_val_16_fo0[i]   <= 0;
		  hw_sin_val_16_fo1[i] <= 0;
		  hw_cos_val_16_fo1[i] <= 0;
	          hw_sin_val_16_fo2[i] <= 0;
		  hw_cos_val_16_fo2[i] <= 0;
	          hw_sin_val_16_fo3[i] <= 0;
		  hw_cos_val_16_fo3[i] <= 0;
		  
	       end

	     sin_rom_addr_reg<= 0;
	     cos_rom_addr_reg<= 0;
	     theta_offset_factor_sn_reg <= 0;
	     theta_offset_factor_sn_vld_reg <= 0;
	     theta_offset_factor_sn_vld_127 <= 0;
	     trig_axis_cnt                  <= 0;
	     get_next_rom_addr              <= 0;
	     get_next_rom_addr_d            <= 0;
	     hw_sin_val_vld_sreg            <= 0;
	     hw_cos_val_vld_sreg            <= 0;
	     trig_val_counter   <= 0;
	     trig_val_counter_2 <= 0;
	     rom_offset_i       <= 0;
	     
	     for (int i=0;i<16;i++)
	       begin
		  sin_rom_addr[i]       <= 0;
		  cos_rom_addr[i]       <= 0;
		  sin_rom_sel_reg[i]    <= 0;
		  cos_rom_sel_reg[i]    <= 0;
		  
		  
		  hw_sin_val_axis_d[i]  <= 0;
    		  hw_cos_val_axis_d[i]  <= 0;
	       end
	     hw_sin_val_axis_vld_d <= 0;
	     hw_cos_val_axis_vld_d <= 0;
	     toggle_fp             <= 1;
	     
	       
	  end
	else
	  begin
	     get_next_rom_addr_d      <= get_next_rom_addr;
	     hw_sin_val_vld_sreg[0]   <= hw_sin_val_vld;
	     hw_sin_val_vld_sreg[15:1]<= hw_sin_val_vld_sreg[14:0];
	     
	     
	     if(flush_pipeline)
	       begin
		  toggle_fp = ~toggle_fp;
	       end
	     else
	       toggle_fp <= 1'b1;

	     if(gra_ap_done & get_next_rom_addr==0)
	       begin
		  for(int i=0; i< 16; i++)
		    begin
		       sin_rom_addr[i]   <= sin_rom_addr_start[i];
		       cos_rom_addr[i]   <= cos_rom_addr_start[i];
		       sin_rom_sel_reg[i]<= sin_rom_sel[i];
		       cos_rom_sel_reg[i]<= cos_rom_sel[i];
		       get_next_rom_addr <= 1'b1;
		       trig_val_counter  <= 0;
		    end
	       end
	     else if(get_next_rom_addr & trig_val_counter < 7)
	       begin
		  trig_val_counter <= trig_val_counter + 1;
		  for(int i=0; i< 8; i++)
		    begin //8 brams have only 785 entries
		       sin_rom_addr[i]   <= (sin_rom_addr[i] == 786)? 0 : sin_rom_addr[i] + 1;
		       cos_rom_addr[i]   <= (cos_rom_addr[i] == 786)? 0 : cos_rom_addr[i] + 1;
		       get_next_rom_addr <= 1'b1;
		    end
		  for(int i=8; i< 16; i++)
		    begin //8 brams have only 785 entries
		       sin_rom_addr[i]   <= (sin_rom_addr[i] == 785)? 0 : sin_rom_addr[i] + 1;
		       cos_rom_addr[i]   <= (cos_rom_addr[i] == 785)? 0 : cos_rom_addr[i] + 1;
		    end
	       end
	     else
	       begin
		  get_next_rom_addr <= 0;
		  trig_val_counter  <= 0;
	       end


	     for(integer i=0; i<THETA_BINS/4; i++)
	       begin
		  hw_sin_val[i]     <= hw_sin_val_16_fo0[i];
		  hw_cos_val[i]     <= hw_cos_val_16_fo0[i];
	       end

	     
	     for(integer i=THETA_BINS/4; i<THETA_BINS/2; i++)
	       begin
		  hw_sin_val[i]     <= hw_sin_val_16_fo1[i-THETA_BINS/4];
		  hw_cos_val[i]     <= hw_cos_val_16_fo1[i-THETA_BINS/4];
	       end

	     for(integer i=THETA_BINS/2; i< 3 * THETA_BINS/4; i++)
	       begin
		  hw_sin_val[i]     <= hw_sin_val_16_fo2[i-THETA_BINS/2];
		  hw_cos_val[i]     <= hw_cos_val_16_fo2[i-THETA_BINS/2];
	       end

	     for(integer i=3 * THETA_BINS/4; i<THETA_BINS; i++)
	       begin
		  hw_sin_val[i]     <= hw_sin_val_16_fo3[i- 3*THETA_BINS/4];
		  hw_cos_val[i]     <= hw_cos_val_16_fo3[i- 3*THETA_BINS/4];
	       end
	
	     if(gtv_ap_done)
	       begin
		  trig_val_counter_2 <= trig_val_counter_2 + 1;
		  rom_offset_i       <= {(~trig_val_counter_2[0]),4'b0};
		  

		  case(trig_val_counter_2[2:1])
		    2'b00:
		      begin
			 for(integer i=0;i<16;i++)
			 begin
			    hw_sin_val_16_fo0[rom_offset_i | i]     <= hw_sin_val_16[i];
			    hw_cos_val_16_fo0[rom_offset_i | i]     <= hw_cos_val_16[i];
			 end
		      end
		    2'b01:
		      begin
			   for(integer i=0;i<16;i++) //Next 64
			 begin
			    hw_sin_val_16_fo1[(rom_offset_i| i)]     <= hw_sin_val_16[i]; 
			    hw_cos_val_16_fo1[(rom_offset_i| i)]     <= hw_cos_val_16[i];
			 end
		      end
		    2'b10:
		      begin
			 for(integer i=0;i<16;i++) //Next 64
			 begin
			    hw_sin_val_16_fo2[(rom_offset_i| i)]     <= hw_sin_val_16[i]; 
			    hw_cos_val_16_fo2[(rom_offset_i| i)]     <= hw_cos_val_16[i];
			 end
		      end
		    2'b11:
		      begin
			 for(integer i=0;i<16;i++) //Next 64
			  begin
			    hw_sin_val_16_fo3[(rom_offset_i| i)]     <= hw_sin_val_16[i]; 
			    hw_cos_val_16_fo3[(rom_offset_i| i)]     <= hw_cos_val_16[i];
			 end
		      end
		  endcase // case (trig_val_counter_2[3:1])
		  

	
		     
	       end // if (gtv_ap_done)
	     else
	       begin
		  trig_val_counter_2 <= 0;
		  rom_offset_i       <= 0;
	       end
	  end // else: !if(rst && srst)
     end // always @ (posedge clk)
   

 always @ (posedge clk)
     begin
	if(rst && srst)
	  begin
	     le_output     <= 0;
	     le_output_vld <= 0;
	  end
	else
	  begin
	     le_output_vld  <= le_results_vld;
	     if(le_results_vld)
	       le_output    <= le_results;
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
	     trig_vals_loaded <= 1'b0;
	     ll_reset         <= 1'b1;
	     hba_reset_fo     <= 0;
	     results_ap_done_d<= 0;
	     hit_extraction_roi_re  <= 0;
	     gra_resource_sharing   <= 0;
	     gra_total_bins         <= THETA_BINS;
	     results_ap_idle_d0     <= 0;
	     
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
	     
	     trig_vals_loaded <= ~gtv_ap_idle_d0 & gtv_ap_idle;
	     
	     
	     
	     case(le_state)
	       IDLE:
		 begin
		    ll_ap_start      <= 1'b0;
		    hba_ap_start     <= 16'b0;
		    results_ap_start <= 1'b0;
		    counter          <= 32'b0;
		    ll_reset         <= 1'b0;
		    hba_reset        <= 1'b0;
		    hba_reset_fo     <= 8'b0;
		    get_first_hit_r  <= 1'b0;
		    get_next_hit     <= 1'b0;
		    hba_reset_mode   <= 1'b0;
		    hba_results_rdy  <= 1'b0;
		    latency_count    <= 5'h1f;
		    hba_mem_enable   <= 8'b0;
		    gra_ap_start     <= 1'b1; //Wait for ROI
		    gra_resource_sharing <= 1'b0;
		    gra_total_bins       <= THETA_BINS;
		    //if(ll_ap_idle & hba_ap_idle & results_ap_idle & hit_extraction_roi_re )
		    if(hba_ap_idle_d0 & results_ap_idle_d0 & gtv_ap_idle_d0)
		      begin
			 if(~hit_extraction_roi_empty)
			   begin
			      hit_extraction_roi_re  <= (hit_extraction_roi_re)? 0 : 1;
			   end
			 else
			   begin
			      hit_extraction_roi_re  <= 0;
			   end
			 if(hit_extraction_roi_re )
			   begin
			      le_state               <= LOAD_LUTS;
			   end
		      end
		 end // case: IDLE
	       LOAD_LUTS:
		 begin
		    ll_ap_start      <= 1'b0;
		    gra_ap_start     <= 1'b0;
		    counter          <= 0;
		    hba_reset        <= 1'b0;
		    hba_reset_fo     <= 8'b0;
		    hba_reset_mode   <= 1'b0;
		    hba_results_rdy  <= 1'b0;
		    latency_count    <= 5'h1f;
		    ll_reset         <= 1'b0;
		    get_next_hit     <= 1'b0;
		    hit_extraction_roi_re  <= 0;
		    gra_resource_sharing   <= 1'b0;
		    gra_total_bins         <= THETA_BINS;
		    // if(ll_ap_done_d[3])
		    if(trig_vals_loaded)//~theta_offset_factor_sn_vld_128)
		      begin
			 le_state       <= HISTOGRAM_BIN_ACCUMULATION;		
			 hba_ap_start   <= 16'hffff;
			 get_first_hit_r<= 1'b1;
			 hba_mem_enable   <= 8'hff;
		      end
		    else
		      begin
			 hba_ap_start   <= 16'b0;
			 get_first_hit_r<= 1'b0;
			 hba_mem_enable <= 8'b0;
		      end
		 end
	       HISTOGRAM_BIN_ACCUMULATION:
		 begin
		    ll_ap_start     <= 1'b0;
		    hba_reset       <= 1'b0;
		    hba_reset_fo    <= 8'b0;
		    hba_reset_mode  <= 1'b0; 
		    hba_results_rdy <= 1'b0;
		    gra_resource_sharing <= 1'b0;
		    gra_total_bins       <= 0;
		    		    
		    if(~get_first_hit_r)
		      get_next_hit    <= ~get_next_hit;
		    
		    if(mdt_hit_re)
		      begin
			 latency_count   <= 0;
			 get_first_hit_r <= 1'b0;
			 hba_ap_start    <= 16'hffff;
			 hba_mem_enable  <= 8'hff;
		      end
		    else
		      begin
			 if(latency_count == hba_latency)
			   begin
			     
			      hba_ap_start    <= 16'b0;
			      hba_mem_enable  <= 8'h0;
			      
			   end
			 else
			   begin
			      latency_count   <= latency_count + 1;
			      hba_ap_start    <= 16'hffff;
			      hba_mem_enable  <= 8'hff;
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
		    
		    
		    if(latency_count == hba_latency)
		      begin
			 hba_results_rdy      <= 1'b1;
			 gra_resource_sharing <= 1'b1;
			 gra_ap_start         <= 1'b1; //Wait for global theta from find_max_bin
			 le_state        <= COMPUTE_RESULTS;
			 counter         <= 32'b0;
			 latency_count   <= latency_count + 1;
			 hba_mem_enable  <= 8'h0;
		      end
		    else
		      begin
			 latency_count <= (latency_count == hba_latency)?latency_count : latency_count + 1;
		      end
		 end
	       COMPUTE_RESULTS:
		 begin
		    counter              <= counter + 32'b1;
		    hba_results_rdy      <= 1'b0;
		    gra_resource_sharing <= 1'b1;
		    gra_total_bins       <= 0;
		    hba_ap_ready_reg     <= hba_ap_ready_d0;
		    gra_ap_start         <= (gra_theta_vld)? 1'b0 : gra_ap_start;
		    
		    if(hba_results_rdy)
		    begin
			 hba_reset_mode   <= 1'b1;
		         hba_reset_fo     <= 8'hff;
			 hba_reset        <= 1'b1;
			 results_ap_start <= 1'b1;//Start computing slope/intercept
			 hba_ap_start     <= 16'hffff;
			 hba_mem_enable   <= 8'b0;
		      end 
		    else
		      begin
			 results_ap_start <= 1'b0;
			 hba_ap_start       <= (hba_ap_ready_reg)? 16'b0 : hba_ap_start; //Reset Bins
		      end

		    if(gls_ap_done)
		      begin
			 le_state         <= IDLE; 
		      end
		 end
	     endcase
	  end
     end
  
  endmodule

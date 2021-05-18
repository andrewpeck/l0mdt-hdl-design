
// ==============================================================
// Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// ==============================================================
 `timescale 1ns/1ps

`include "l0mdt_buses_constants.svh"

`define AUTOTB_DUT      lsf_vhd_wrapper
`define AUTOTB_DUT_INST AESL_inst_lsf_spybuffer_wrapper_inst
`define AUTOTB_TOP      apatb_lsf_sb_vhd_tb
`define AUTOTB_LAT_RESULT_FILE "lsf_spybuffer_wrapper.result.lat.rb"
`define AUTOTB_PER_RESULT_TRANS_FILE "lsf_spybuffer_wrapper.performance.result.transaction.xml"
`define AUTOTB_TOP_INST AESL_inst_apatb_lsf_spybuffer_wrapper_tb_inst
`define AUTOTB_MAX_ALLOW_LATENCY  15000000
`define AUTOTB_CLOCK_PERIOD_DIV2 1.56 //1.35

`define AESL_DEPTH_mdt_hit_V 1
`define AESL_DEPTH_hit_extraction_roi_V 1

`define AESL_DEPTH_histogram_bins_reset_V 1
//`define THETA_RBIN_128
`define THETA_BIN_64_RBIN_128
//`define THETA_RBIN_64

`ifdef THETA_RBIN_128
 `define AUTOTB_TVOUT_le_output_V  "./tv_theta_bin_128/barrel/cdatafile/c.generate_input_testvectors.autotvin_LE_output_V.dat"
 `define AUTOTB_TVIN_mdt_hit_V  "./tv_theta_bin_128/barrel/cdatafile/c.generate_input_testvectors.autotvin_input_hps_sf_V.dat"
 `define AUTOTB_TVIN_hit_extraction_roi_V  "./tv_theta_bin_128/barrel/cdatafile/c.generate_input_testvectors.autotvin_input_slcproc_sf_V.dat"
`elsif THETA_BIN_64_RBIN_128
 `define AUTOTB_TVOUT_le_output_V  "./tv_theta_bin_64/barrel/cdatafile/c.generate_input_testvectors.autotvin_LE_output_V.dat"
 `define AUTOTB_TVIN_mdt_hit_V  "./tv_theta_bin_64/barrel/cdatafile/c.generate_input_testvectors.autotvin_input_hps_sf_V.dat"
 `define AUTOTB_TVIN_hit_extraction_roi_V  "./tv_theta_bin_64/barrel/cdatafile/c.generate_input_testvectors.autotvin_input_slcproc_sf_V.dat"
`elsif THETA_RBIN_64
 `define AUTOTB_TVOUT_le_output_V  "./tv_theta_rbin_64/barrel/cdatafile/c.generate_input_testvectors.autotvin_LE_output_V.dat"
 `define AUTOTB_TVIN_mdt_hit_V  "./tv_theta_rbin_64/barrel/cdatafile/c.generate_input_testvectors.autotvin_input_hps_sf_V.dat"
 `define AUTOTB_TVIN_hit_extraction_roi_V  "./tv_theta_rbin_64/barrel/cdatafile/c.generate_input_testvectors.autotvin_input_slcproc_sf_V.dat"
`endif

//`define AUTOTB_TVOUT_le_tb_output_V  "./tv/barrel/rtldatafile/rtl.get_legendre_segment_barrel.autotvout_LE_tb_output_V.dat"
//`define AUTOTB_TVIN_hit_extraction_roi_V  "../tv/barrel/cdatafile/c.load_LE_angles.autotvin_input_slcproc_sf_V.dat"
//`define AUTOTB_TVIN_mdt_hit_V_out_wrapc  "../tv/barrel/rtldatafile/rtl.histogram_bin_accumulation.autotvin_mdt_hit_V.dat"
//`define AUTOTB_TVIN_mdt_hit_V_out_wrapc  "../tv/barrel/rtldatafile/rtl.histogram_bin_accumulation.autotvin_mdt_hit_V.dat"






module `AUTOTB_TOP;

   parameter AUTOTB_TRANSACTION_NUM = 500000; //86;
parameter PROGRESS_TIMEOUT = 10000000;
parameter LATENCY_ESTIMATION = 13;
parameter LENGTH_mdt_hit_V = 1;
parameter LENGTH_hit_extraction_roi_V = 1;
parameter LENGTH_histogram_bins_reset_V = 1;

`ifdef THETA_BIN_64_RBIN_128
   parameter EOF_CLOCKS = 80;
   parameter EOF_RST_CLOCKS = 1100;

`else
   parameter EOF_CLOCKS = 80;
   parameter EOF_RST_CLOCKS = 1;
`endif


task read_token;
    input integer fp;
    output reg [887 : 0] token;
    integer ret;
    begin
        token = "";
        ret = 0;
        ret = $fscanf(fp,"%s",token);
    end
endtask

   parameter TOTAL_SLC = 500;
   integer total_passed = 0;
   integer total_failed = 0;
   integer total_skipped = 0;


   //PRIYA
   reg [31:0] total_hits_in_Roi[TOTAL_SLC];
   integer    roi_count;
   integer    roi_count_we;

   integer    hit_counter;

   initial
     begin
`ifdef THETA_RBIN_128
	$readmemh("tv_theta_bin_128/HitsPerRoi.txt",total_hits_in_Roi);
`elsif THETA_BIN_64_RBIN_128
	$readmemh("tv_theta_bin_64/HitsPerRoi.txt",total_hits_in_Roi);
`else
	$readmemh("tv_theta_rbin_64/HitsPerRoi.txt",total_hits_in_Roi);
`endif
//	$display("H0 = 0x%x\n",total_hits_in_Roi[0]);
     end
   //END PRIYA

reg AESL_clock;
reg rst;
reg start;
reg ce;
reg tb_continue;
wire AESL_start;
reg AESL_reset;
wire AESL_ce;
wire AESL_ready;
wire AESL_idle;
wire AESL_continue;
wire AESL_done;
reg AESL_done_delay = 0;
reg AESL_done_delay2 = 0;
reg AESL_ready_delay = 0;
wire ready;
wire ready_wire;
wire ap_start;
wire ap_done;
wire ap_idle;
wire ap_ready;
wire  mdt_hit_V_ap_vld;
   wire [HEG2SFHIT_LEN-1 : 0] mdt_hit;
wire [HEG2SFSLC_LEN-1 : 0] hit_extraction_roi;
wire [HEG2SFHIT_LEN-1 : 0] mdt_hit_V;
wire [HEG2SFSLC_LEN-1 : 0] hit_extraction_roi_V;

wire [0 : 0] histogram_bins_reset_V;
integer done_cnt = 0;
integer AESL_ready_cnt = 0;
integer ready_cnt = 0;
reg ready_initial;
reg ready_initial_n;
reg ready_last_n;
reg ready_delay_last_n;
reg done_delay_last_n;
reg interface_done = 0;


wire ap_clk;
wire ap_rst;
wire ap_rst_n;

   wire [SF2PTCALC_LEN-1:0] le_output;
   wire [SF2PTCALC_LEN-1:0] le_output_rtl;

   wire 	le_output_vld;
   wire 	le_output_empty;
   reg 		le_output_re;

   wire 	roi_ap_ready;
   wire 	roi_af;
   wire 	roi_re;
   reg 		hit_extraction_roi_V_vld;
   wire [511:0] le_tb_output;
   wire [511:0] le_tb_output_i;
   wire 	le_tb_output_vld;
   wire 	mdt_hit_af;
   wire 	mdt_hit_ap_ready;

   parameter W_zd = HEG2SFSLC_VEC_POS_LEN; //HPS_LSF_MDT_LOCALX_LEN; //19;
   parameter W_Rd = HEG2SFSLC_VEC_POS_LEN; //HPS_LSF_MDT_LOCALY_LEN; //18; //19;
   parameter W_rd = HEG2SFHIT_RADIUS_LEN; // 9;


   parameter W_IN = 22;
   parameter W_r  = 13;
   parameter char_width = 8;
   logic [SLC_MUID_LEN-1:0] slc_muid;
   logic [VEC_MDTID_LEN-1:0] slc_mdtid;
   logic 		     i_eof;
   integer 		     i_eof_count;

   parameter gtheta = SF2PTCALC_SEGANGLE_LEN; //15;


   assign mdt_hit                    = mdt_hit_V;
   assign hit_extraction_roi         = hit_extraction_roi_V;
   assign le_output                  = le_output_rtl;
   assign slc_muid                   = hit_extraction_roi_V[HEG2SFSLC_MUID_MSB:HEG2SFSLC_MUID_LSB];
   assign slc_mdtid                  = hit_extraction_roi_V[HEG2SFSLC_MDTID_MSB:HEG2SFSLC_MDTID_LSB];





   assign le_tb_output_i = (`AUTOTB_DUT_INST.lsf_spybuffer_wrapper_inst.legendreEngine_inst.le_tb_output_vld)? `AUTOTB_DUT_INST.lsf_spybuffer_wrapper_inst.legendreEngine_inst.le_tb_output : le_tb_output_i;
   assign mdt_hit_ap_ready = ~ap_rst; //~mdt_hit_af;
   assign roi_ap_ready     = (roi_count_we == -1) || (le_output_re) ; //~roi_af;

   `AUTOTB_DUT `AUTOTB_DUT_INST(
				.clock(ap_clk),
				.reset(ap_rst),
				.slc_roi_valid(hit_extraction_roi_V_vld), //(roi_ap_ready),
				.slc_roi(hit_extraction_roi),
			//	.srst(ap_rst),
			//	.mdt_hit_vld(mdt_hit_V_ap_vld),

				.mdt_hit_af(mdt_hit_af),
				.mdt_hit_valid(mdt_hit_V_ap_vld), //mdt_hit_ap_ready),
				.mdt_hit(mdt_hit),

//				.hit_extraction_roi_vld(hit_extraction_roi_V_vld),
				.i_eof(i_eof),
				.hba_max_clocks(10'd50), //27),

				.slc_roi_af(roi_af),
				.lsf(le_output_rtl),
				.lsf_re(le_output_re), //(le_output_vld),
				.lsf_empty(le_output_empty)
				//.le_tb_output(le_tb_output),
				//.le_tb_output_vld(le_tb_output_vld)

				);


// Assignment for control signal
assign ap_clk = AESL_clock;
   assign ap_rst = rst;
   assign ap_rst_n = ~rst;
assign ap_start = AESL_start;
assign AESL_start = start;
assign AESL_done = ap_done;
assign AESL_idle = ap_idle;
   assign AESL_ready = mdt_hit_ap_ready; //PRIYA ap_ready;
assign AESL_ce = ce;
assign AESL_continue = tb_continue;
   /* always @(posedge AESL_clock) begin
        if (AESL_reset) begin
        end else begin
            if (AESL_done !== 1 && AESL_done !== 0) begin
                $display("ERROR: Control signal AESL_done is invalid!");
               //PRIYA  $finish;
            end
        end
    end
    */
    always @(posedge AESL_clock) begin
        if (AESL_reset) begin
        end else begin
            if (AESL_ready !== 1 && AESL_ready !== 0) begin
                $display("ERROR: Control signal AESL_ready is invalid!");
                $finish;
            end
        end
    end
reg AESL_REG_mdt_hit_V_ap_vld;
// The signal of port mdt_hit_V
reg [191: 0] AESL_REG_mdt_hit_V = 0;
assign mdt_hit_V = AESL_REG_mdt_hit_V;
assign mdt_hit_V_ap_vld = AESL_REG_mdt_hit_V_ap_vld;

initial begin : read_file_process_mdt_hit_V
    integer fp;
    integer err;
    integer ret;
    integer proc_rand;
    reg [887  : 0] token;
    reg[31:0] i;
    reg transaction_finish;
    integer transaction_idx;
    transaction_idx = 0;
    AESL_REG_mdt_hit_V_ap_vld <= 0;
    hit_counter         <= 0;
   i_eof <= 0;
   i_eof_count <= 0;

   i <= 0;

    wait(AESL_reset === 0);
    fp = $fopen(`AUTOTB_TVIN_mdt_hit_V,"r");
    if(fp == 0) begin       // Failed to open file
        $display("Failed to open file \"%s\"!", `AUTOTB_TVIN_mdt_hit_V);
        $display("ERROR: Simulation using HLS TB failed.");
        $finish;
    end
    read_token(fp, token);
    if (token != "[[[runtime]]]") begin
        $display("ERROR: Simulation using HLS TB failed.");
        $finish;
    end
    read_token(fp, token);
   @(negedge roi_ap_ready);

    while (token != "[[[/runtime]]]") begin
        if (token != "[[transaction]]") begin
            $display("ERROR: Simulation using HLS TB failed.");
              $finish;
        end

        read_token(fp, token);  // skip transaction number
       ret = $sscanf(token, "%d", i);
//       $display("INFO: MDT HIT TRANSACTION NUMBER: %d roi_count = %d hit_counter=%d",i,roi_count, hit_counter);
          read_token(fp, token);
            # 0.2;
           //PRIYA while(ready_wire !== 1) begin

       while(hit_counter >= total_hits_in_Roi[roi_count])
	 begin
	  AESL_REG_mdt_hit_V_ap_vld <= 0;
	   while (i_eof_count < EOF_CLOCKS)
	     begin
		@(posedge AESL_clock);
		i_eof_count <= i_eof_count + 1;
	     end
	    i_eof <= 1;
	    @(posedge AESL_clock);
	    i_eof <= 0;


/* -----\/----- EXCLUDED -----\/-----
	  if(hit_counter == total_hits_in_Roi[roi_count])begin  //Reading trailing mdt_hit transaction for ROI -> not to be used
	     // $display("Skipping this token %s! hit_counter=%d",token,hit_counter);
	     read_token(fp, token);
	     read_token(fp, token);
	     read_token(fp, token);
	     read_token(fp, token);
	     hit_counter++;
	  end else begin
 -----/\----- EXCLUDED -----/\----- */
	     hit_counter <= 0;
	     while(roi_ap_ready == 0  )begin
		//$display("Stuck in loop hit_counter=%d, total_hits_in_Roi[%d]=%d",hit_counter, roi_count, total_hits_in_Roi[roi_count]);
		@(posedge AESL_clock);

	     end
	    while(i_eof_count < EOF_RST_CLOCKS) begin
	       	i_eof_count <= i_eof_count + 1;
		@(posedge AESL_clock);
	    end
	    i_eof_count <= 0;

	  //end
	  //$display("Out of loop");
       end

       hit_counter++;


       while(mdt_hit_ap_ready !== 1) begin
	  AESL_REG_mdt_hit_V_ap_vld <= 0;
	  @(posedge AESL_clock);
          # 0.2;
       end


        if(token != "[[/transaction]]") begin
            AESL_REG_mdt_hit_V_ap_vld <= 1;

            ret = $sscanf(token, "0x%x", AESL_REG_mdt_hit_V);
              if (ret != 1) begin
                 $display("Failed to parse token!--0x%x ret=%d",AESL_REG_mdt_hit_V,ret);
		 $display("ERROR: Simulation using HLS TB failed while reading MDT Hits roi_count=%d, hit_counter=%d.",roi_count, hit_counter);
                 $finish;
              end
//	   $display("MDT HIT TOKEN=%s hit_counter=%d, roi_count = %d", token, hit_counter, roi_count);
            @(posedge AESL_clock);
	   AESL_REG_mdt_hit_V_ap_vld <= 0; //fails of i make it zero

	   @(posedge AESL_clock); // ONe MDT hit for every two clock cycles
              read_token(fp, token);
        end // if (token != "[[/transaction]]")

          read_token(fp, token);

    end // while (token != "[[[/runtime]]]")

    $fclose(fp);
   @(posedge AESL_clock);
   AESL_REG_mdt_hit_V_ap_vld <= 0;


end // block: read_file_process_mdt_hit_V


// The signal of port hit_extraction_roi_V
reg [HEG2SFSLC_LEN-1: 0] AESL_REG_hit_extraction_roi_V = 0;
assign hit_extraction_roi_V = AESL_REG_hit_extraction_roi_V;
   assign roi_count = (AESL_reset)? -1 : ((roi_ap_ready == 1)? roi_count + 1 : roi_count);

initial begin : read_file_process_hit_extraction_roi_V
    integer fp;
    integer err;
    integer ret;
    integer proc_rand;
    reg [887  : 0] token;
    integer i;
    reg transaction_finish;
    integer transaction_idx;
   integer  mdt_hits_trans_skip = 0;

   transaction_idx          = 0;
   hit_extraction_roi_V_vld = 0;
   roi_count_we             = -1;


    wait(AESL_reset === 0);
    fp = $fopen(`AUTOTB_TVIN_hit_extraction_roi_V,"r");
    if(fp == 0) begin       // Failed to open file
        $display("Failed to open file \"%s\"!", `AUTOTB_TVIN_hit_extraction_roi_V);
        $display("ERROR: Simulation using HLS TB failed while reading ROI roi_count_we=%d",roi_count_we);
        $finish;
    end
    read_token(fp, token);

    if (token != "[[[runtime]]]") begin
        $display("ERROR: Simulation using HLS TB failed.");
        $finish;
    end
    read_token(fp, token);


    while (token != "[[[/runtime]]]") begin
        if (token != "[[transaction]]") begin
            $display("ERROR: Simulation using HLS TB failed.");
              $finish;
        end
        read_token(fp, token);  // skip transaction number
       read_token(fp, token); //New RoI

            # 0.2;
       while(ready_wire !== 1) begin
	  @(posedge AESL_clock);
          # 0.2;
       end

       if(token != "[[/transaction]]") begin

	  while(roi_ap_ready!=1)begin
	     hit_extraction_roi_V_vld = 0;
	     @(posedge AESL_clock);
	     # 0.2;
	  end
	  hit_extraction_roi_V_vld = 1;
	  ret = $sscanf(token, "0x%x", AESL_REG_hit_extraction_roi_V);
          if (ret != 1) begin
             $display("Failed to parse token!");
             $display("ERROR: Simulation using HLS TB failed.");
             $finish;
          end
//	  $display("AESL_REG_hit_extraction_roi_V=%s\n",token);

	  /*for(mdt_hits_trans_skip = 0; mdt_hits_trans_skip < total_hits_in_Roi[roi_count_we+1]; mdt_hits_trans_skip++)begin //Skip all MDT hits, previous transaction was roi vld
	     @(posedge AESL_clock);
	     hit_extraction_roi_V_vld = 0;
	     @(posedge AESL_clock);
	   end
	 */

          @(posedge AESL_clock);
	  hit_extraction_roi_V_vld = 0;
	  roi_count_we++;

	  for(int s=0; s<total_hits_in_Roi[roi_count_we]-1;s++)
	    begin
	       read_token(fp, token);
	       read_token(fp, token);
	       read_token(fp, token);
	       read_token(fp, token);

	    end
	  @(posedge roi_ap_ready);

          read_token(fp, token);

       end // if (token != "[[/transaction]]")


       read_token(fp, token);
    end // while (token != "[[[/runtime]]]")
  /* if(roi_count_we == TOTAL_SLC -1)
     begin
	$display("Read %d SL Candidates",TOTAL_SLC);
     end
   */
    $fclose(fp);
end













initial begin : generate_AESL_ready_cnt_proc
    AESL_ready_cnt = 0;
    wait(AESL_reset === 0);
    while(AESL_ready_cnt != AUTOTB_TRANSACTION_NUM) begin
        while(AESL_ready !== 1) begin
            @(posedge AESL_clock);
            # 0.4;
        end
        @(negedge AESL_clock);
        AESL_ready_cnt = AESL_ready_cnt + 1;
        @(posedge AESL_clock);
        # 0.4;
    end
end

    event next_trigger_ready_cnt;

    initial begin : gen_ready_cnt
        ready_cnt = 0;
        wait (AESL_reset === 0);
        forever begin
            @ (posedge AESL_clock);
            if (ready == 1) begin
                if (ready_cnt < AUTOTB_TRANSACTION_NUM) begin
                    ready_cnt = ready_cnt + 1;
                end
            end
            -> next_trigger_ready_cnt;
        end
    end

    wire all_finish = (done_cnt == AUTOTB_TRANSACTION_NUM);

    // done_cnt
    always @ (posedge AESL_clock) begin
        if (AESL_reset) begin
            done_cnt <= 0;
        end else begin
            if (AESL_done == 1) begin
                if (done_cnt < AUTOTB_TRANSACTION_NUM) begin
                    done_cnt <= done_cnt + 1;
                end
            end
        end
    end

    initial begin : finish_simulation
        wait (all_finish == 1);
        // last transaction is saved at negedge right after last done
        @ (posedge AESL_clock);
        @ (posedge AESL_clock);
        @ (posedge AESL_clock);
        @ (posedge AESL_clock);
        $finish;
    end

initial begin
    AESL_clock = 0;
    forever #`AUTOTB_CLOCK_PERIOD_DIV2 AESL_clock = ~AESL_clock;
end


reg end_mdt_hit_V;
reg [31:0] size_mdt_hit_V;
reg [31:0] size_mdt_hit_V_backup;
reg end_hit_extraction_roi_V;
reg [31:0] size_hit_extraction_roi_V;
reg [31:0] size_hit_extraction_roi_V_backup;

   reg 	   end_histogram_bins_reset_V;
reg [31:0] size_histogram_bins_reset_V;
reg [31:0] size_histogram_bins_reset_V_backup;


initial begin : initial_process
    integer proc_rand;
   AESL_reset = 1;

    rst = 1;
    # 100;
    repeat(3) @ (posedge AESL_clock);
    rst = 0;
   repeat(100)@ (posedge AESL_clock);
   AESL_reset = 0;

end
initial begin : start_process
    integer proc_rand;
    reg [31:0] start_cnt;
    ce = 1;
    start = 0;
    start_cnt = 0;
    wait (AESL_reset === 0);
    @ (posedge AESL_clock);
    #0 start = 1;
    start_cnt = start_cnt + 1;
    forever begin
        @ (posedge AESL_clock);
        if (start_cnt >= AUTOTB_TRANSACTION_NUM) begin
            // keep pushing garbage in
            #0 start = 1;
        end
        if (AESL_ready) begin
            start_cnt = start_cnt + 1;
        end
    end
end

always @(AESL_done)
begin
    tb_continue = AESL_done;
end

initial begin : ready_initial_process
    ready_initial = 0;
    wait (AESL_start === 1);
    ready_initial = 1;
    @(posedge AESL_clock);
    ready_initial = 0;
end

always @(posedge AESL_clock)
begin
    if(AESL_reset)
      AESL_ready_delay = 0;
  else
      AESL_ready_delay = AESL_ready;
end
initial begin : ready_last_n_process
  ready_last_n = 1;
  wait(ready_cnt == AUTOTB_TRANSACTION_NUM)
  @(posedge AESL_clock);
  ready_last_n <= 0;
end

always @(posedge AESL_clock)
begin
    if(AESL_reset)
      ready_delay_last_n = 0;
  else
      ready_delay_last_n <= ready_last_n;
end
assign ready = (ready_initial | AESL_ready_delay);
assign ready_wire = ready_initial | AESL_ready_delay;
initial begin : done_delay_last_n_process
  done_delay_last_n = 1;
  while(done_cnt < AUTOTB_TRANSACTION_NUM)
      @(posedge AESL_clock);
  # 0.1;
  done_delay_last_n = 0;
end

always @(posedge AESL_clock)
begin
    if(AESL_reset)
  begin
      AESL_done_delay <= 0;
      AESL_done_delay2 <= 0;
  end
  else begin
      AESL_done_delay <= AESL_done & done_delay_last_n;
      AESL_done_delay2 <= AESL_done_delay;
  end
end
always @(posedge AESL_clock)
begin
    if(AESL_reset)
      interface_done = 0;
  else begin
      # 0.01;
      if(ready === 1 && ready_cnt > 0 && ready_cnt < AUTOTB_TRANSACTION_NUM)
          interface_done = 1;
      else if(AESL_done_delay === 1 && done_cnt == AUTOTB_TRANSACTION_NUM)
          interface_done = 1;
      else
          interface_done = 0;
  end
end

////////////////////////////////////////////
// progress and performance
////////////////////////////////////////////

task wait_start();
    while (~AESL_start) begin
        @ (posedge AESL_clock);
    end
endtask

reg [31:0] clk_cnt = 0;
reg AESL_ready_p1;
reg AESL_start_p1;

always @ (posedge AESL_clock) begin
    clk_cnt <= clk_cnt + 1;
    AESL_ready_p1 <= AESL_ready;
    AESL_start_p1 <= AESL_start;
end

reg [31:0] start_timestamp [0:AUTOTB_TRANSACTION_NUM - 1];
reg [31:0] start_cnt;
reg [31:0] ready_timestamp [0:AUTOTB_TRANSACTION_NUM - 1];
reg [31:0] ap_ready_cnt;
reg [31:0] finish_timestamp [0:AUTOTB_TRANSACTION_NUM - 1];
reg [31:0] finish_cnt;
event report_progress;

initial begin
    start_cnt = 0;
    finish_cnt = 0;
    ap_ready_cnt = 0;
    wait (AESL_reset == 0);
    wait_start();
    start_timestamp[start_cnt] = clk_cnt;
    start_cnt = start_cnt + 1;
    if (AESL_done) begin
        finish_timestamp[finish_cnt] = clk_cnt;
        finish_cnt = finish_cnt + 1;
    end
    -> report_progress;
    forever begin
        @ (posedge AESL_clock);
        if (start_cnt < AUTOTB_TRANSACTION_NUM) begin
            if ((AESL_start && AESL_ready_p1)||(AESL_start && ~AESL_start_p1)) begin
                start_timestamp[start_cnt] = clk_cnt;
                start_cnt = start_cnt + 1;
            end
        end
        if (ap_ready_cnt < AUTOTB_TRANSACTION_NUM) begin
            if (AESL_start_p1 && AESL_ready_p1) begin
                ready_timestamp[ap_ready_cnt] = clk_cnt;
                ap_ready_cnt = ap_ready_cnt + 1;
            end
        end
        if (finish_cnt < AUTOTB_TRANSACTION_NUM) begin
            if (AESL_done) begin
                finish_timestamp[finish_cnt] = clk_cnt;
                finish_cnt = finish_cnt + 1;
            end
        end
        -> report_progress;
    end
end

reg [31:0] progress_timeout;

initial begin : simulation_progress
    real intra_progress;
    wait (AESL_reset == 0);
    progress_timeout = PROGRESS_TIMEOUT;
    $display("////////////////////////////////////////////////////////////////////////////////////");
    $display("// Inter-Transaction Progress: Completed Transaction / Total Transaction");
    $display("// Intra-Transaction Progress: Measured Latency / Latency Estimation * 100%%");
    $display("//");
    $display("// RTL Simulation : \"Inter-Transaction Progress\" [\"Intra-Transaction Progress\"] @ \"Simulation Time\"");
    $display("////////////////////////////////////////////////////////////////////////////////////");
    print_progress();
    while (finish_cnt < AUTOTB_TRANSACTION_NUM) begin
        @ (report_progress);
        if (finish_cnt < AUTOTB_TRANSACTION_NUM) begin
            if (AESL_done) begin
                print_progress();
                progress_timeout = PROGRESS_TIMEOUT;
            end else begin
                if (progress_timeout == 0) begin
                    print_progress();
                    progress_timeout = PROGRESS_TIMEOUT;
                end else begin
                    progress_timeout = progress_timeout - 1;
                end
            end
        end
        // non-dataflow design && latency is predictable && no AXI master/slave interface
        get_intra_progress(intra_progress);
        if (intra_progress > 500000) begin
            $display("// RTL Simulation : transaction %0d run-time latency is greater than %0f time(s) of the prediction @ \"%0t\"", start_cnt, intra_progress, $time);
            $display("////////////////////////////////////////////////////////////////////////////////////");
           $finish;
        end
    end
    print_progress();
    $display("////////////////////////////////////////////////////////////////////////////////////");
    calculate_performance();
end

task get_intra_progress(output real intra_progress);
    begin
        if (start_cnt > finish_cnt) begin
            intra_progress = clk_cnt - start_timestamp[finish_cnt];
        end else if(finish_cnt > 0) begin
            intra_progress = LATENCY_ESTIMATION;
        end else begin
            intra_progress = 0;
        end
        intra_progress = intra_progress / LATENCY_ESTIMATION;
    end
endtask

task print_progress();
    real intra_progress;
    begin
        if (LATENCY_ESTIMATION > 0) begin
            get_intra_progress(intra_progress);
            $display("// RTL Simulation : %0d / %0d [%2.2f%%] @ \"%0t\"", finish_cnt, AUTOTB_TRANSACTION_NUM, intra_progress * 100, $time);
        end else begin
            $display("// RTL Simulation : %0d / %0d [n/a] @ \"%0t\"", finish_cnt, AUTOTB_TRANSACTION_NUM, $time);
        end
    end
endtask

task calculate_performance();
    integer i;
    integer fp;
    reg [31:0] latency [0:AUTOTB_TRANSACTION_NUM - 1];
    reg [31:0] latency_min;
    reg [31:0] latency_max;
    reg [31:0] latency_total;
    reg [31:0] latency_average;
    reg [31:0] interval [0:AUTOTB_TRANSACTION_NUM - 2];
    reg [31:0] interval_min;
    reg [31:0] interval_max;
    reg [31:0] interval_total;
    reg [31:0] interval_average;
    begin
        latency_min = -1;
        latency_max = 0;
        latency_total = 0;
        interval_min = -1;
        interval_max = 0;
        interval_total = 0;

        for (i = 0; i < AUTOTB_TRANSACTION_NUM; i = i + 1) begin
            // calculate latency
            latency[i] = finish_timestamp[i] - start_timestamp[i];
            if (latency[i] > latency_max) latency_max = latency[i];
            if (latency[i] < latency_min) latency_min = latency[i];
            latency_total = latency_total + latency[i];
            // calculate interval
            if (AUTOTB_TRANSACTION_NUM == 1) begin
                interval[i] = 0;
                interval_max = 0;
                interval_min = 0;
                interval_total = 0;
            end else if (i < AUTOTB_TRANSACTION_NUM - 1) begin
                interval[i] = start_timestamp[i + 1] - start_timestamp[i];
                if (interval[i] > interval_max) interval_max = interval[i];
                if (interval[i] < interval_min) interval_min = interval[i];
                interval_total = interval_total + interval[i];
            end
        end

        latency_average = latency_total / AUTOTB_TRANSACTION_NUM;
        if (AUTOTB_TRANSACTION_NUM == 1) begin
            interval_average = 0;
        end else begin
            interval_average = interval_total / (AUTOTB_TRANSACTION_NUM - 1);
        end

        fp = $fopen(`AUTOTB_LAT_RESULT_FILE, "w");

        $fdisplay(fp, "$MAX_LATENCY = \"%0d\"", latency_max);
        $fdisplay(fp, "$MIN_LATENCY = \"%0d\"", latency_min);
        $fdisplay(fp, "$AVER_LATENCY = \"%0d\"", latency_average);
        $fdisplay(fp, "$MAX_THROUGHPUT = \"%0d\"", interval_max);
        $fdisplay(fp, "$MIN_THROUGHPUT = \"%0d\"", interval_min);
        $fdisplay(fp, "$AVER_THROUGHPUT = \"%0d\"", interval_average);

        $fclose(fp);

        fp = $fopen(`AUTOTB_PER_RESULT_TRANS_FILE, "w");

        $fdisplay(fp, "%20s%16s%16s", "", "latency", "interval");
        if (AUTOTB_TRANSACTION_NUM == 1) begin
            i = 0;
            $fdisplay(fp, "transaction%8d:%16d%16d", i, latency[i], interval[i]);
        end else begin
            for (i = 0; i < AUTOTB_TRANSACTION_NUM; i = i + 1) begin
                if (i < AUTOTB_TRANSACTION_NUM - 1) begin
                    $fdisplay(fp, "transaction%8d:%16d%16d", i, latency[i], interval[i]);
                end else begin
                    $fdisplay(fp, "transaction%8d:%16d               x", i, latency[i]);
                end
            end
        end

        $fclose(fp);
    end
endtask



   //Verify Output - Added by Priya
   // The signal of port hit_extraction_roi_V
   reg [SF2PTCALC_LEN-1: 0] AESL_REG_le_output_V = 0;
   wire [SF2PTCALC_LEN-1: 0] le_output_TB;
   assign le_output_TB[SF2PTCALC_MDTID_MSB:SF2PTCALC_MDTID_LSB] = slc_mdtid;
   assign le_output_TB[SF2PTCALC_MUID_MSB:SF2PTCALC_MUID_LSB] =slc_muid;
   assign le_output_TB[SF2PTCALC_SEGPOS_MSB:SF2PTCALC_SEGQUALITY_LSB] = AESL_REG_le_output_V;
   assign le_output_TB[SF2PTCALC_DATA_VALID_MSB] = 1;



//assign AESL_REG_le_output_V = (le_output_vld == 1) le_output : 0;
initial begin : read_file_process_le_output_V
    integer fp;
    integer err;
    integer ret;
    integer proc_rand;
    //reg [887  : 0] token;
   reg [2048  : 0] token;
    integer i;
    reg transaction_finish;
    integer transaction_idx;


   transaction_idx          = 0;
   total_passed             = 0;
   total_failed             = 0;
   total_skipped            = 0;
   le_output_re             = 0;



   wait(AESL_reset === 0);

    fp = $fopen(`AUTOTB_TVOUT_le_output_V,"r");
    if(fp == 0) begin       // Failed to open file
        $display("Failed to open file \"%s\"!", `AUTOTB_TVOUT_le_output_V);
        $display("ERROR: Simulation using HLS TB failed.");
        $finish;
    end
    read_token(fp, token);
    if (token != "[[[runtime]]]") begin
        $display("ERROR: Simulation using HLS TB failed.");
        $finish;
    end
//      $display("TOKEN=%s", token);
    read_token(fp, token);
    while (token != "[[[/runtime]]]") begin
        if (token != "[[transaction]]") begin
            $display("ERROR: Simulation using HLS TB failed.");
              $finish;
        end
//          $display("TOKEN=%s", token);
        read_token(fp, token);  // skip transaction number
//          $display("TOKEN=%s", token);
          read_token(fp, token); //New LE Result
            # 0.2;

       @(posedge le_output[SF2PTCALC_LEN-1]);


       if(token != "[[/transaction]]") begin
	  //PRIYA le_output_V_vld = 1;
	  ret = $sscanf(token, "%x", AESL_REG_le_output_V);
//	  $display("TVOUT TOKEN=%s AESL_REG_le_output_V=0x%x", token, AESL_REG_le_output_V);
          if (ret != 1) begin
             $display("Failed to parse token when reading AUTOTB_TVIN_le_output_V! ret = %d val=0x%x ",ret, AESL_REG_le_output_V);
	     $display("TOKEN=%s", token);

             $display("ERROR: Simulation using HLS TB failed.");
             $finish;
          end


	  if(le_tb_output_i[63:0] >= 0 ) //>5 Check number of hits in bin
	    begin
		 if(AESL_REG_le_output_V !== le_output)
	       //if(le_output_TB !== le_output)
		 begin
		    $display("roi_count:%d, slc_muid:%d: LE output mismatch expected 0x%x,0x%x actual=0x%x",roi_count,slc_muid,le_output_TB, AESL_REG_le_output_V, le_output);
		    total_failed++;
		    //  $display("LE output mismatch actual 0x%x%x%x%x",le_output[191:128],le_output[127:64],le_output[63:0]);
		    #3000
		      $finish;
		 end
	       else
		 begin
		    $display("%d:LE output matched le_output=0x%x",roi_count,le_output);
		    total_passed++;
		 end
	    end // if (le_tb_output[63:0] >= 5)
	  else
	    begin
	       $display("%d:Skipping ROI as max count in bin <5. le_tb_output_i=%d",roi_count,le_tb_output_i[63:0]);
	       total_skipped++;
	    end
	  le_output_re = 1;
	  @(posedge AESL_clock);
	  le_output_re = 0;
	  read_token(fp, token);
	  if(roi_count == TOTAL_SLC)
	    begin
	       $display("Test Completed total_roi = %d, total_passed = %d, total_failed = %d, total_skipped = %d\n",TOTAL_SLC, total_passed, total_failed, total_skipped);
	       $finish();

	    end

       end // if (token != "[[/transaction]]")


       read_token(fp, token);
    end // while (token != "[[[/runtime]]]")

    $fclose(fp);
end

   ///End Verify Output - Added by Priya

////////////////////////////////////////////
// Dependence Check
////////////////////////////////////////////

endmodule

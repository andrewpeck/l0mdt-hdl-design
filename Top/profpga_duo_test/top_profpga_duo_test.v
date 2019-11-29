// =============================================================================
//  IMPORTANT: Pro Design Confidential (Internal Use Only)
//  COPYRIGHT (C) 2017, Pro Design Electronic GmbH
//
//  THIS FILE MAY NOT BE MODIFIED, DISCLOSED, COPIED OR DISTRIBUTED WITHOUT THE
//  EXPRESSED WRITTEN CONSENT OF PRO DESIGN.
//
//  Pro Design Electronic GmbH           http://www.prodesign-europe.com
//  Albert-Mayer-Strasse 14-16           info@prodesign-europe.com
//  83052 Bruckmuehl                     +49 (0)8062 / 808 - 0
//  Germany
// =============================================================================
//  Project       : proFPGA
//  Module        : fpga_toplevel.v
//  Author        : Martin Langner
//  Contact       : profpga-service@prodesign-europe.com,
//  Description   : Toplevel file for mmi64_reg Demo Design 
// =============================================================================
// Revision history :
// Version  Date        Description
// -------  ----------  --------------------------------------------------------
// 1.0      2016-03-21  File created
// =============================================================================

module top_profpga_duo_test # (
			parameter DEVICE           = "XVUP"      // XV7S or XVUS
			) 
   (
		      // pins which are connected to motherboard 		      
		      CLK_N_0,
		      CLK_P_0,
		      
		      SYNC_N_0,
		      SYNC_P_0,

		      // These are the DMBI pins as defined by the autogenerated toplevel
    		      //DMBI_F2H_00,
    		      //DMBI_F2H_01,
    		      //DMBI_F2H_02,
    		      //DMBI_F2H_03,
    		      //DMBI_F2H_04,
    		      //DMBI_F2H_05,
    		      //DMBI_F2H_06,
    		      //DMBI_F2H_07,
    		      //DMBI_F2H_08,
    		      //DMBI_F2H_09,
    		      //DMBI_F2H_10,
    		      //DMBI_F2H_11,
    		      //DMBI_F2H_12,
    		      //DMBI_F2H_13,
    		      //DMBI_F2H_14,
    		      //DMBI_F2H_15,
    		      //DMBI_F2H_16,
    		      //DMBI_F2H_17,
    		      //DMBI_F2H_18,
    		      //DMBI_F2H_19,
    		      //DMBI_H2F_00,
    		      //DMBI_H2F_01,
    		      //DMBI_H2F_02,
    		      //DMBI_H2F_03,
    		      //DMBI_H2F_04,
    		      //DMBI_H2F_05,
    		      //DMBI_H2F_06,
    		      //DMBI_H2F_07,
    		      //DMBI_H2F_08,
    		      //DMBI_H2F_09,
    		      //DMBI_H2F_10,
    		      //DMBI_H2F_11,
    		      //DMBI_H2F_12,
    		      //DMBI_H2F_13,
    		      //DMBI_H2F_14,
    		      //DMBI_H2F_15,
    		      //DMBI_H2F_16,
    		      //DMBI_H2F_17,
    		      //DMBI_H2F_18,
    		      //DMBI_H2F_19,
		      
		      // They have been modified to a bus
		      DMBI_F2H,
		      DMBI_H2F,
          
                      // Stratix10 Temperature monitor
                      TEMP_MON_SDA,
                      TEMP_MON_SCL,
		      
		      // pins which are local to FPGA module
		      LED_BLUE,
		      LED_GREEN,
		      LED_RED
		      
		      );
   
   input CLK_N_0;
   input CLK_P_0;

   input SYNC_N_0;
   input SYNC_P_0;
   
   inout  TEMP_MON_SDA;
   inout  TEMP_MON_SCL;

   input  [19:0] DMBI_H2F;
   output [19:0] DMBI_F2H;
        
   output LED_BLUE;
   output LED_GREEN;
   output LED_RED;
   

   // mmi64 interface
   wire   mmi64_clk;
   wire   mmi64_reset;
   
   wire [63 : 0] mmi64_dn_d;
   wire 	 mmi64_dn_valid;
   wire 	 mmi64_dn_accept;
   wire 	 mmi64_dn_start;
   wire 	 mmi64_dn_stop;
   
   wire [63 : 0] mmi64_up_d;
   wire 	 mmi64_up_valid;
   wire 	 mmi64_up_accept;
   wire 	 mmi64_up_start;
   wire 	 mmi64_up_stop;

   // connections to register interface
   wire 	   reg_en       ;
   wire 	   reg_we       ;
   wire [ 4 : 0 ]  reg_addr     ; // 8 registers --> 3-bit address
   wire [ 63 : 0 ] reg_wdata    ; // register data width 32
   wire 	   reg_accept   ;
   wire [ 63 : 0 ] reg_rdata_r  ; // register data width 32
   reg  	   reg_rvalid_r ;   
   
   
   // profpga_ctrl, includes MMI64 PHY, please see UD006 for more informations   
  profpga_ctrl # (
		  .DEVICE ( DEVICE )
		  )  
   U_PROFPGA_CTRL (
    // access to FPGA pins
    .clk0_p          (CLK_P_0 ),
    .clk0_n          (CLK_N_0 ),
    .sync0_p         (SYNC_P_0),
    .sync0_n         (SYNC_N_0),
    .srcclk_p        (   ),
    .srcclk_n        (   ),
    .srcsync_p       (   ),
    .srcsync_n       (   ),
    .dmbi_h2f        (DMBI_H2F),
    .dmbi_f2h        (DMBI_F2H),

    // 200 MHz clock (useful for delay calibration)
    .clk_200mhz_o    (),

    // clk0 sync events (synchronized with mmi64_clk)
    .clk0_event_id_o      (          ),
    .clk0_event_en_o      (          ),
    .clk0_event_strobe1_o (          ),
    .clk0_event_strobe2_o (          ),

    // MMI-64 access (synchronous to mmi64_clk)
    .mmi64_present_i      (1'b1           ), 
    .mmi64_clk_o          (mmi64_clk      ),
    .mmi64_reset_o        (mmi64_reset    ),
    .mmi64_m_dn_d_o       (mmi64_dn_d     ),
    .mmi64_m_dn_valid_o   (mmi64_dn_valid ),
    .mmi64_m_dn_accept_i  (mmi64_dn_accept),
    .mmi64_m_dn_start_o   (mmi64_dn_start ),
    .mmi64_m_dn_stop_o    (mmi64_dn_stop  ),
    .mmi64_m_up_d_i       (mmi64_up_d     ),
    .mmi64_m_up_valid_i   (mmi64_up_valid ),
    .mmi64_m_up_accept_o  (mmi64_up_accept),
    .mmi64_m_up_start_i   (mmi64_up_start ),
    .mmi64_m_up_stop_i    (mmi64_up_stop  ),

    // source clock/sync input, not used in this example
    .src_clk_i            (4'b0000 ),
    .src_clk_locked_i     (4'b1111 ),
    .src_event_id_i       (32'h0000),
    .src_event_en_i       (4'b0000 ),
    .src_event_busy_o     (        ),
    .src_event_reset_i    (4'b1111 ),
    .src_event_strobe1_i  (4'b0000 ),
    .src_event_strobe2_i  (4'b0000 ),

    // clock configuration ports (synchronous to mmi64_clk), not used in this example
    .clk1_cfg_dn_o   (         ),
    .clk1_cfg_up_i   (20'h00000),
    .clk2_cfg_dn_o   (         ),
    .clk2_cfg_up_i   (20'h00000),
    .clk3_cfg_dn_o   (         ),
    .clk3_cfg_up_i   (20'h00000),
    .clk4_cfg_dn_o   (         ),
    .clk4_cfg_up_i   (20'h00000),
    .clk5_cfg_dn_o   (         ),
    .clk5_cfg_up_i   (20'h00000),
    .clk6_cfg_dn_o   (         ),
    .clk6_cfg_up_i   (20'h00000),
    .clk7_cfg_dn_o   (         ),
    .clk7_cfg_up_i   (20'h00000),
    
    // Temperature monitor for Stratix 10
    .temp_mon_i2c_sda (TEMP_MON_SDA),
    .temp_mon_i2c_scl (TEMP_MON_SCL)
  );

   // MMI64 Register interface, please see UD006 for detailed information
   // Configured to support 8 registers of 32 bit datawidth
   mmi64_m_regif # (
		    .MODULE_ID      (32'hFEEDBACC),
		    .REGISTER_COUNT (32          ),
		    .REGISTER_WIDTH (64          )
		    ) 
   U_MMI64_REGIF (
		  // clock and reset
		  .mmi64_clk      (mmi64_clk  ),
		  .mmi64_reset    (mmi64_reset),
		  
		  .mmi64_h_dn_d_i       (mmi64_dn_d     ),
		  .mmi64_h_dn_valid_i   (mmi64_dn_valid ),
		  .mmi64_h_dn_accept_o  (mmi64_dn_accept),
		  .mmi64_h_dn_start_i   (mmi64_dn_start ),
		  .mmi64_h_dn_stop_i    (mmi64_dn_stop  ),
		  .mmi64_h_up_d_o       (mmi64_up_d     ),
		  .mmi64_h_up_valid_o   (mmi64_up_valid ),
		  .mmi64_h_up_accept_i  (mmi64_up_accept),
		  .mmi64_h_up_start_o   (mmi64_up_start ),
		  .mmi64_h_up_stop_o    (mmi64_up_stop  ),
		  
		  .reg_en_o     (reg_en      ),
		  .reg_we_o     (reg_we      ),
		  .reg_addr_o   (reg_addr    ),
		  .reg_wdata_o  (reg_wdata   ),
		  .reg_accept_i (reg_accept  ),
		  .reg_rdata_i  (reg_rdata_r ),
		  .reg_rvalid_i (reg_rvalid_r)
		  );

   // Generic Single Port RAM, can be found in $PROFPGA/hdl/generic_hdl
   generic_spram # (
		    .ADDR_W (5),
		    .DATA_W (64)
		    )
   U_REGISTER (
	       .clk   (mmi64_clk),
	       .ce    (reg_en),
	       .we    (reg_we),
	       .addr  (reg_addr),
	       .wdata (reg_wdata),
	       .rdata (reg_rdata_r)
	       );

   // generic_spram is providing data always in next cycle
   // NOTE: Pay attention to the rvalid and accept signal creation in your design
   //       rvalid needs to be active in the same cycle than the rdata
   //       if accept is high, the mmi64_regif will trigger the next request on the next cycle
   always @(posedge mmi64_clk) begin : VALID_SIGNAL
      if (reg_en && ~reg_we)
	reg_rvalid_r <= 1'b1;
      else
	reg_rvalid_r <= 1'b0;
   end

   // generic_spram always accepts data
   assign reg_accept = 1'b1;
   // assign reg_rdata_r = 32'h1010;
   assign LED_RED   = mmi64_reset;
   assign LED_GREEN = reg_en;
   assign LED_BLUE  = reg_we;
   
   
endmodule

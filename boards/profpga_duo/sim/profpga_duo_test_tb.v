// =============================================================================
//  IMPORTANT: Pro Design Confidential (Internal Use Only)
//  COPYRIGHT (C) 2015, Pro Design Electronic GmbH
//
//  THIS FILE MAY NOT BE MODIFIED, DISCLOSED, COPIED OR DISTRIBUTED WITHOUT THE
//  EXPRESSED WRITTEN CONSENT OF PRO DESIGN.
//
//  Pro Design Electronic GmbH           http://www.prodesign-europe.com
//  Albert-Mayer-Strasse 14-16           info@prodesign-europe.com
//  83052 Bruckmuehl                     +49 (0)8062 / 808 - 0
//  Germany
// =============================================================================
//!  @project      proFPGA
// =============================================================================
//!  @file         testbench.v
//!  @author       Martin Langner
//!  @email        profpga-service@prodesign-europe.com
//!  @brief        VERILOG Testbench for reset Demo Design
// =============================================================================
// Revision history :
// Version  Date        Description
// -------  ----------  --------------------------------------------------------
// 1.0      2016-03-16  File created
// =============================================================================

// this is needed for proper simulation of communication between motherboard and FPGA module
`timescale 1 ps/1 ps

module profpga_duo_test;
   parameter DEVICE        = "XV7S";
   
   // the 8 master clocks and syncs (driven by mainboard, common for all FPGAs)
   wire [7:0] clk_n  ;
   wire [7:0] clk_p  ;
   wire [7:0] sync_n ;
   wire [7:0] sync_p ;
   
   // FPGA Module LEDs
   //wire       fpga_led_yellow; // not used in this demo
   wire       fpga_led_blue;
   wire       fpga_led_green ;
   wire       fpga_led_red;

   wire [19:0] ta1_dmbi_f2h;
   wire [19:0] ta1_dmbi_h2f;   
   
   
   wire        mmi64_done;
   reg         rise_after_100ns;
   
   initial begin
      rise_after_100ns = 1'b0;
      #100_000;
      rise_after_100ns = 1'b1;
   end

   
   // needed to define end of simulation from software
   mmi64_stimulate U_MMI64_STIMULATE  ( .mmi64_done_o (mmi64_done) );
   
   always @ (posedge mmi64_done or posedge rise_after_100ns) begin
      if (mmi64_done & rise_after_100ns) begin
     $timeformat(-12, 0, " ps", 1);
     $display("%t: Reached end of simulation.\n", $time);
     $stop(0);
      end
   end

   
   // instance of DUT
   pt_toplevel # (
          .DEVICE       ( DEVICE )
          )
   u_fpga_ta1 (
           .CLK_N_0      (clk_n[0]       ),
           .CLK_P_0      (clk_p[0]       ),
           .SYNC_N_0     (sync_n[0]      ),
           .SYNC_P_0     (sync_p[0]      ),
           .DMBI_F2H     (ta1_dmbi_f2h   ),
           .DMBI_H2F     (ta1_dmbi_h2f   ),
           .LED_BLUE     (fpga_led_blue  ),
           .LED_GREEN    (fpga_led_green ),
           .LED_RED      (fpga_led_red   )
           );

   
   // proFPGA motherboard simulation model, FPGA module is plugged to TA1, not needed for this demo
   profpga_mb # (
         .MB_IS_MASTER ( 1 ),
         .TA1_DEVICE       ( DEVICE ) 
         ) 
   u_mb (
     // external clock/sync inputs, not used in this demo
     .ext_clk  ( 4'b0000 ),
     .ext_sync ( 4'b0000 ),
      
     // master beats, only clk0 and sync0 are used
     .clk_p  ( clk_p  ),
     .clk_n  ( clk_n  ),
     .sync_p ( sync_p ),
     .sync_n ( sync_n ),
      
     // communication with user FPGA at site A1, only dmbi is use in this demo
     .ta1_dmbi_h2f ( ta1_dmbi_h2f ),
     .ta1_dmbi_f2h ( ta1_dmbi_f2h ),
     .ta1_srcclk_p ( 4'b0000 ),
     .ta1_srcclk_n ( 4'b1111 ),
     .ta1_srcsync_p( 4'b0000 ),
     .ta1_srcsync_n( 4'b1111 ),
      
     // communication with user FPGA at site C1, not used in this demo
     .tc1_dmbi_h2f (         ),
     .tc1_dmbi_f2h ( 20'b0   ),
     .tc1_srcclk_p ( 4'b0000 ),
     .tc1_srcclk_n ( 4'b1111 ),
     .tc1_srcsync_p( 4'b0000 ),
     .tc1_srcsync_n( 4'b1111 ),
      
     // communication with user FPGA at site A3, not used in this demo
     .ta3_dmbi_h2f (         ),
     .ta3_dmbi_f2h ( 20'b0   ),
     .ta3_srcclk_p ( 4'b0000 ),
     .ta3_srcclk_n ( 4'b1111 ),
     .ta3_srcsync_p( 4'b0000 ),
     .ta3_srcsync_n( 4'b1111 ),
      
     // communication with user FPGA at site C3, not used in this demo
     .tc3_dmbi_h2f (         ),
     .tc3_dmbi_f2h ( 20'b0   ),
     .tc3_srcclk_p ( 4'b0000 ),
     .tc3_srcclk_n ( 4'b1111 ),
     .tc3_srcsync_p( 4'b0000 ),
     .tc3_srcsync_n( 4'b1111 ),
      
     // communication with next motherboard (if present), not used in this demo
     .nmb_dn       (      ),
     .nmb_up       (85'b0 ),
      
     // communication with previous motherboard (only if this is not the master motherboard), not used in this demo
     .pmb_up       (      ),
     .pmb_dn       (85'b0 )    
     );
   
   
endmodule

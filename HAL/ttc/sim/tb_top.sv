`include <common_defs_pkg.svh>
`include <ttc_defs_pkg.svh>

parameter int BCID_MAX = 200;

module ttc_tb;

   bit clk40  = 1'b1;
   bit clk320 = 1'b1;
    
   logic rst = 1'b1;
   logic rst_r = 1'b1;

   integer  latency = 30;
   integer  dead = 20;
    
   bit                ttc_l1a;
   bit                ttc_bcr = 1'b0;
   bit                ttc_ecr  = 1'b0;
   
   bcid_t bcid_cnt = 0;
   bcid_t bcid_l1a = 0;

   bit                bcid_daq_init = 0;
   
   ttc_fmt_rt ttc_fmt_r;
   
   assign ttc_fmt_r.bcr = ttc_bcr;
   assign ttc_fmt_r.ecr = ttc_ecr;
   assign ttc_fmt_r.lxa = ttc_l1a;
   assign ttc_fmt_r.reserved0 = 0;
   assign ttc_fmt_r.reserved1 = 0;
   assign ttc_fmt_r.reserved2 = 0;
   assign ttc_fmt_r.reserved3 = 0;
   assign ttc_fmt_r.reserved4 = 0;
   
   ttc_irt tb_to_ttc_r;
   ttc_ivt tb_to_ttc_v;
   ttc_ort ttc_to_tb_r;
   ttc_ovt ttc_to_tb_v;
   
   assign tb_to_ttc_v = ttc_ivt'(tb_to_ttc_r);
   assign ttc_to_tb_r = ttc_ort'(ttc_to_tb_v);
   
   assign tb_to_ttc_r.sys.rst = rst;
   assign tb_to_ttc_r.sys.clk40 = clk40;
   assign tb_to_ttc_r.sys.clk320 = clk320;
   
   assign tb_to_ttc_r.data = ttc_fmt_vt'(ttc_fmt_r);
   
   ttc ttc_u(.i(tb_to_ttc_v), .o(ttc_to_tb_v));
      
   // clock generation
   always #(25ns) begin
      clk40 <= ~clk40;
   end
   
   always #(3125ps) begin
      clk320 <= ~clk320;
   end

   initial begin
      $srandom(1);
   end
   
   // rst generation
   initial begin
      rst <= 1;
      repeat(10) @(posedge clk40);
      @(posedge clk40) begin
         rst   <= 0;
         ttc_bcr <= 1;
      end
      @(posedge clk40);
      @(posedge clk40) ttc_bcr <= 0;
      
   end

   // BCID rst
   always @(posedge clk40) begin

      rst_r <= rst;

      if (rst_r == 0 ) begin

         // wait for latency compensation
         if (latency > 0) begin
            latency--;
         end

         // reference bcid counter
         if(bcid_cnt == BCID_MAX-1) begin
            ttc_bcr <= 1;
            bcid_cnt <= 0;
         end
         else begin
            ttc_bcr <= 0;
            bcid_cnt <= bcid_cnt + 1;
         end
         
         // l1a counter synchronized with l1a latency
         if (bcid_cnt == latency) begin
            bcid_l1a <= 0;
            bcid_daq_init <= 1;
         end
         else begin
            if (bcid_daq_init == 1) begin
               bcid_l1a <= bcid_l1a + 1;
            end
         end
         
         // generating random l1a requests
         if (dead == 0) begin
            // r40.randomize();
            // ttc_l1a <= r40.daq_req;
            ttc_l1a <= 1'b1;
            dead = 60;
         end
         else begin
            ttc_l1a <= 1'b0;
         end
         
         if (dead > 0) begin
            dead -= 1;
         end
         
         // if (r40.daq_req == 1'b1 && bcid_daq_init == 1'b1) begin
         //    ttc_l1a = 1'b1;
         // end
         // else begin
         //    ttc_l1a = 0'b1;
         // end
      end
      
      // initial begin
      //    ttc_bcr = 0;
      //    repeat(2) @(posedge clk40);
      //    ttc_bcr = 1;
      //    @(posedge clk40);
      //    ttc_bcr = 0;
      // end
      
      // // L1A request
      // initial begin
      //    ttc_l1a = 0;
      //    repeat(16) @(posedge clk40);
      //    ttc_l1a = 1;
      //    @(posedge clk40);
      //    ttc_l1a = 0;
      // end
      
   end
            
endmodule : ttc_tb

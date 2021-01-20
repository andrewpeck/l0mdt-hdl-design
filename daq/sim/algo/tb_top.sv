`include <common_defs.svh>
`include <daq_devel_defs.svh>
`include <daq_row_defs.svh>

parameter int BCID_MAX = 200;

parameter int LXA_REPEAT = 20;

parameter int DUTS = 1;

parameter int PIP = 1;

module tb;

   bit clk40 = 1'b1;
   bit clk320 = 1'b1;
   logic rst = 1'b1;

   typedef daq_algo_ert dut_ert;
   typedef daq_algo_ivt dut_ivt;
   typedef daq_algo_irt dut_irt;
   typedef daq_algo_ovt dut_ovt;
   typedef daq_algo_ort dut_ort;
   
   dut_ert dut_er[DUTS];
   dut_ivt tb_to_dut[DUTS];
   dut_ovt dut_to_tb[DUTS];

   parameter stream_lengths_at SLS = '{512, 0, 0, 0, 0, 0, 0, 0};
   // parameter stream_lengths_at SLS = '{default: 0, 0: 45};
   parameter daq_algo_grt G0 = '{PIPELINES: PIP, 
                                STREAM_LENGTHS: SLS,
                                OUTPUT_DATA_LEN: 16,
                                COUNTER_LEN:32};
   daq_algo_top #(.G_v(daq_algo_gvt'(G0)))
   u_dut0(.port_iv(tb_to_dut[0]), .port_ov(dut_to_tb[0]));
   
   always #(12.5ns) clk40  <= ~clk40;
   always #(3125ps) clk320 <= ~clk320;
         
   initial $srandom(1);

   initial begin
      rst = 1;
      repeat(10) @(posedge clk320);
      @(posedge clk320) rst <= 0;
   end
   
   class RandStream;
      rand logic valid;
      rand logic[$bits(stream_r.data)-1:0] data;
   endclass
   
   RandStream rand_stream = new ();
   stream_rt stream_r = '{default:0}; 
   
   // lets create new data every clock
   always @(posedge clk320) begin
      if( !rand_stream.randomize() ) begin 
         $fatal(1, "Data randomization failed");
      end
      stream_r.valid <= rand_stream.valid;
      stream_r.data  <= rand_stream.data;
   end

   // lets create new data every clock
   always @(posedge clk40) begin
      stream_r.bcid  <= stream_r.bcid + 1;
   end

   // logic [$clog2(PIP):0] en = 0;
   // logic [$clog2(PIP):0] rd_en = 0;
   // bcid_t win_start = 'h19;
   // bcid_t win_width = 3;
   // 
   // initial begin
   //    repeat(10) @(posedge clk40); 
   //    @(posedge clk40) begin 
   //       en <= 0;
   //       rd_en <= 0;
   //    end
   //    repeat(10) @(posedge clk40);
   //    @(posedge clk40) begin 
   //       en <= 1;
   //       rd_en <= 1;
   //    end
   //    repeat(10) @(posedge clk40);
   //    @(posedge clk40) begin 
   //       en <= 0;
   //       rd_en <= 0;
   //    end
   // end
   // 
   // bcid_t latency = 10;
   // bcid_t bcid = 0;
   // bcid_t daq_bcid = 0;
   // logic  lxa = 0;
   // int    lxa_cnt = LXA_REPEAT;
   // 
   // always @(posedge clk40) begin
   //    bcid <= bcid + 1;
   //    
   //    if (bcid == latency) begin
   //       daq_bcid <= 0;
   //    end else begin
   //       daq_bcid <= daq_bcid + 1;
   //    end
   //    
   //    if (lxa_cnt == 0) begin
   //       lxa <= 1;
   //       lxa_cnt <= LXA_REPEAT;
   //    end else begin
   //       lxa <= 0;
   //       lxa_cnt <= lxa_cnt - 1;
   //    end
   // end
   // 
   // genvar i;
   // generate
   //    for (i = 0; i < DUTS; i++) begin
   //       assign tb_to_dut[i] = dut_ivt'(dut_er[i].i);
   //       assign dut_er[i].o = dut_ort'(dut_to_tb[i]);
   // 
   //       assign dut_er[i].i.sys.rst = rst;
   //       assign dut_er[i].i.sys.clk320 = clk320;
   // 
   //       assign dut_er[i].i.mngt.en = en;
   //       assign dut_er[i].i.mngt.rd_en = rd_en;
   //       assign dut_er[i].i.req.win_start = win_start;
   //       assign dut_er[i].i.req.win_width = win_width;
   //       assign dut_er[i].i.req.bcid = bcid;
   //       assign dut_er[i].i.req.daq_bcid = daq_bcid;
   // 
   //       always @(posedge clk320) begin
   //          dut_er[i].i.stream <= stream_r;
   //       end
   //       
   //       // init
   //       initial begin
   //          dut_er[i].i.req.latency = latency;
   //          dut_er[i].i.req.win_lower = 0;
   //          dut_er[i].i.req.win_upper = 0;
   //          
   //          dut_er[i].i.stream <= stream_r;
   //          dut_er[i].i.pbldr.payload.rd_strb = 0;
   //       end
   // 
   //       
   //       // always @(dut_er[i].o.mngt.done 
   //       //          or dut_er[i].o.pbldr.counter.nempty) begin
   //       //    if (dut_er[i].o.mngt.done == 1 
   //       //        && dut_er[i].o.pbldr.counter.nempty == 1) begin
   //       //       assign dut_er[i].i.pbldr.counter.rd_strb = 1;
   //       //    end
   //       //    else begin
   //       //       assign dut_er[i].i.pbldr.counter.rd_strb = 0;
   //       //    end
   //       // end
   //    
   //       assign dut_er[i].i.pbldr.payload.rd_strb 
   //         = (dut_er[i].o.mngt.done == 1 
   //            && dut_er[i].o.pbldr.payload.nempty == 1) ? 1 : 0;
   // 
   //    end // for (i = 0; i < DUTS; i++)
   // endgenerate
   
endmodule : tb

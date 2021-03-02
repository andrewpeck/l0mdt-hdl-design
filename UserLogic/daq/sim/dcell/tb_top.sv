`include <common_defs.svh>
`include <daq_devel_defs.svh>
`include <daq_row_defs.svh>

`include <transaction.sv>
`include <rand_40.sv>

parameter int BCID_MAX = 200;

module tb;

   bit clk40 = 1'b1;
   bit clk320 = 1'b1;
   logic rst = 1'b1;

   bcid_t bcid_cnt = 0;
   bcid_t daq_bcid_cnt = 0;

   integer lat = 30;
   
   bit   bcid_daq_init = 0;

   logic daq_ctrl_wren = 0;
   bcid_t daq_win_lower = 0;
   bcid_t daq_latency = 20;
   bcid_t daq_win_upper = 0;
   bcid_t daq_win_width;

   assign daq_win_width = daq_win_lower + 1 + daq_win_upper;

   int lat_aux = daq_latency;

   Rand40 r40 = new;
   
   node_ert dnode;
   node_ivt tb_to_dnode;
   node_ovt dnode_to_tb;

   // init
   initial begin
      $srandom(1);
      dnode.i.mngt.en = 0;
   end
   
   // clock and reset
   always #(25ns) begin
      clk40 <= ~clk40;
   end

   always #(3125ps) begin
      clk320 <= ~clk320;
   end

   initial begin
      rst <= 1;
      repeat(10) @(posedge clk320);
      @(posedge clk320) begin
         rst   <= 0;
      end
   end

   mailbox mb = new;
   Transaction trans = new;
   bit     free = 1'b1;

   bit     debug;
   
   always @(posedge clk320) begin
      
      if (rst == 0) begin
         
         // generating data
         trans = new();
         if( !trans.randomize() ) begin 
            $fatal(1, "Gen:: trans randomization failed");
         end
         
         // ensuring that data will available for just one clock cycle
         dnode.i.stream.valid <= 0;

         debug <= trans.allowed;
         dnode.i.stream.bcid <= daq_bcid_cnt;
         if (trans.allowed == 'b1 && bcid_daq_init == 1) begin
            dnode.i.stream.valid <= trans.wren;
            dnode.i.stream.data <= trans.pld;
         end

         if (dnode.o.mngt.done == 1 && dnode.o.bconv.nempty == 1)
           dnode.i.bconv.rd_strb <= 1;
         else
           dnode.i.bconv.rd_strb <= 0;
         
      end // if (rst == 0)
      else begin
         dnode.i.stream.valid <= 0;
         dnode.i.stream.bcid  <= 0;
         dnode.i.stream.data  <= 0;
      end
   end // always @ (posedge clk320)

   always @(posedge clk40) begin

      if (rst == 0 ) begin

         // wait for latency compensation
         if (lat_aux > 0) begin
            lat_aux--;
         end

         // reference bcid counter
         if(bcid_cnt == BCID_MAX) begin
            bcid_cnt <= 0;
         end
         else begin
            bcid_cnt <= bcid_cnt + 1;
         end
         
         // l1a counter synchronized with l1a latency
         if (bcid_cnt == daq_latency) begin
            daq_bcid_cnt <= 0;
            bcid_daq_init <= 1;
         end
         else begin
            if (bcid_daq_init == 1) begin
               daq_bcid_cnt <= daq_bcid_cnt + 1;
            end
         end
                  
      end      
   end
 
   daq_data_node u_dnode(.port_i(tb_to_dnode), 
                         .port_o(dnode_to_tb));
   
   assign tb_to_dnode = node_ivt'(dnode.i);
   assign dnode.o = node_ort'(dnode_to_tb);

   assign dnode.i.sys.rst = rst;
   assign dnode.i.sys.clk320 = clk320;

   assign dnode.i.mngt.win_start = bcid_cnt - daq_win_lower;
   assign dnode.i.mngt.win_width = daq_win_width;

   // l1a ctrl test
   initial begin
      // 1st one
      repeat(300) @(posedge clk40);
      daq_ctrl_wren = 1;
      daq_win_lower = 0;
      daq_latency   = 5;
      daq_win_upper = 0;
      @(posedge clk40) daq_ctrl_wren = 0;
      // 2nd one
      repeat(300) @(posedge clk40);
      @(posedge clk40) begin
         daq_ctrl_wren = 1;
         daq_win_lower = 1;
         daq_latency   = 3;
         daq_win_upper = 1;
      end
      @(posedge clk40) daq_ctrl_wren = 0;
   end

   // cell enable
   always @(posedge clk40) begin
      if (24 <= bcid_cnt && bcid_cnt <= 50) 
        dnode.i.mngt.en = 1;
      else 
        dnode.i.mngt.en = 0;
   end


endmodule : tb

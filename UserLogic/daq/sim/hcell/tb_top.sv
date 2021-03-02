`include <common_defs_pkg.svh>
`include <daq_devel_defs_pkg.svh>
`include <daq_row_defs_pkg.svh>

parameter int BCID_MAX = 200;

parameter int CELLS = 1;

module tb;

   bit clk320 = 1'b1;
    
   logic rst = 1'b1;

   bcid_t bcid_cnt = 0;
   bcid_t bcid_l1a = 0;

   bit                bcid_daq_init = 0;

   node_ert hnode[CELLS];
   node_ivt tb_to_hnode[CELLS];
   node_ovt hnode_to_tb[CELLS];

   genvar             i;
   generate
      for (i=0; i < CELLS; i++) begin
         assign tb_to_hnode[i] = node_ivt'(hnode[i].i);
         assign hnode[i].o = node_ort'(hnode_to_tb[i]);

         assign hnode[i].i.sys.rst = rst;
         assign hnode[i].i.sys.clk320 = clk320;

         assign hnode[i].i.mngt.win_lower = 0;
         assign hnode[i].i.mngt.win_width = 0;

         assign hnode[i].i.stream.bcid = 0;
         
         daq_header_node u_hnode(.port_i(tb_to_hnode[i]), 
                                 .port_o(hnode_to_tb[i]));
      end
   endgenerate
   
   always #(3125ps) begin
      clk320 <= ~clk320;
   end

   initial begin
      $srandom(1);
   end
   
   // rst generation
   initial begin
      rst <= 1;
      repeat(10) @(posedge clk320);
      @(posedge clk320) begin
         rst   <= 0;
      end
   end

   // req gen
   initial begin
      hnode[0].i.stream.valid = 0;
      hnode[0].i.stream.data = 0;
      hnode[0].i.mngt.en = 0;
      hnode[0].i.bconv.rd_strb = 0;

      repeat(20) @(posedge clk320);
      
      @(posedge clk320) begin
         hnode[0].i.stream.valid = 1;
         hnode[0].i.stream.data = 11;
      end

      @(posedge clk320) begin
         hnode[0].i.stream.valid = 0;
         hnode[0].i.stream.data = 22;
      end
      
      repeat(10) @(posedge clk320);
      
      @(posedge clk320) begin
         hnode[0].i.mngt.en = 1;
      end

      repeat(10) @(posedge clk320);
      
      @(posedge clk320) begin
         hnode[0].i.stream.valid = 1;
         hnode[0].i.stream.data = 33;
      end

      @(posedge clk320) begin
         hnode[0].i.stream.valid = 0;
         hnode[0].i.stream.data = 44;
      end
      
      repeat(10) @(posedge clk320);
      
      @(posedge clk320) begin
         hnode[0].i.bconv.rd_strb = 1;
      end

      @(posedge clk320) begin
         hnode[0].i.bconv.rd_strb = 0;
      end
      
      repeat(10) @(posedge clk320);
      
      @(posedge clk320) begin
         hnode[0].i.mngt.en = 0;
      end
   end
            
endmodule : tb

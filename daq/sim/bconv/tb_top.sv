`include <common_defs.svh>
`include <daq_devel_defs.svh>
`include <daq_row_defs.svh>

`include <transaction.sv>
// `include <rand_40.sv>

parameter int BCID_MAX = 200;

parameter int DUTS = 5;
module tb;

   bit clk320 = 1'b1;
   logic rst = 1'b1;

   typedef bconv_ert dut_ert;
   typedef bconv_ivt dut_ivt;
   typedef bconv_irt dut_irt;
   typedef bconv_ovt dut_ovt;
   typedef bconv_ort dut_ort;
   
   dut_ert dut_er[DUTS];
   dut_ivt tb_to_dut[DUTS];
   dut_ovt dut_to_tb[DUTS];

   daq_bus_conv #('{16, 16})  u_dut0(.port_iv(tb_to_dut[0]), .port_ov(dut_to_tb[0]));
   daq_bus_conv #('{32, 16})  u_dut1(.port_iv(tb_to_dut[1]), .port_ov(dut_to_tb[1]));
   daq_bus_conv #('{64, 16})  u_dut2(.port_iv(tb_to_dut[2]), .port_ov(dut_to_tb[2]));
   daq_bus_conv #('{128, 16}) u_dut3(.port_iv(tb_to_dut[3]), .port_ov(dut_to_tb[3]));
   daq_bus_conv #('{129, 16}) u_dut4(.port_iv(tb_to_dut[4]), .port_ov(dut_to_tb[4]));

   always #(3125ps) begin
      clk320 <= ~clk320;
   end
         
   initial begin
      $srandom(1);
   end

   initial begin
      rst = 1;
      repeat(10) @(posedge clk320);
      @(posedge clk320) rst <= 0;
   end
   
   class RandSrcData;
      rand logic [$bits(dut_er[0].i.src.data)-1:0] data;
   endclass
   
   RandSrcData rand_src = new ();
   
   logic burst;        
   initial begin
      repeat(20) @(posedge clk320) burst <= 0;
      @(posedge clk320) burst <= 1;
      repeat(40) @(posedge clk320) burst <= 0;
      @(posedge clk320) burst <= 1;
      repeat(20) @(posedge clk320) burst <= 0;
   end

   // lets create new data every clock
   always @(posedge clk320) begin
      if( !rand_src.randomize() ) begin 
         $fatal(1, "Data randomization failed");
      end
   end // always @ (posedge clk320)    
                     
   genvar i;
   generate
      for (i = 0; i < DUTS; i++) begin
         assign tb_to_dut[i] = dut_ivt'(dut_er[i].i);
         assign dut_er[i].o = dut_ort'(dut_to_tb[i]);
   
         assign dut_er[i].i.sys.rst = rst;
         assign dut_er[i].i.sys.clk320 = clk320;
    
         // init
         initial begin
            dut_er[i].i.dst.rd_strb = 0;
            dut_er[i].i.src.data = 0;
            dut_er[i].i.src.nempty = 0;
         end


         assign dut_er[i].i.dst.rd_strb = (dut_er[i].i.src.nempty == 1) ? 1 : 0;
                                                  
         int cnt = 0;
         
         always @(posedge clk320) begin
            
            if (rst == 0) begin

         //       if (dut_er[i].o.src.rd_strb == 1) begin
               if (dut_to_tb[i][513] == 1 || burst == 1) begin
                  
                  if (burst == 1)
                    cnt <= 1;
                  else
                    cnt <= cnt + 1;
                  
                  if (cnt < 4 || burst == 1) begin
                     dut_er[i].i.src.data <= rand_src.data;
                     dut_er[i].i.src.nempty <= 1;
                  end
                  else
                    dut_er[i].i.src.nempty <= 0;
               end
               
            end // if (rst == 0)
         end // always @ (posedge clk320)    

      end // for (i = 0; i < DUTS; i++)
   endgenerate
   
endmodule : tb

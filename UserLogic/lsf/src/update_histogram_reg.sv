//--------------------------------------------------------------------------------
//--  Department of Physics and Astronomy, UCI
//--  Priya Sundararajan
//--  priya.sundararajan@cern.ch
//--------------------------------------------------------------------------------
//--  Project: ATLAS L0MDT Trigger
//--  Description:
//--
//--------------------------------------------------------------------------------
//--  Revisions:
//--
//--------------------------------------------------------------------------------
`timescale 1ns/1ps
module rbins #(
			      parameter RBINS=64,
			      parameter RBIN_WIDTH = 6 //(no sign)
			      )
   (
    input logic 		 rst,
    input logic 		 clk,
    input logic 		 en,
    input logic 		 wen_0,
    input logic 		 wen_1,
    input logic 		 ren,
    input logic [RBIN_WIDTH-1:0] wr_index_0,
    input logic [RBIN_WIDTH-1:0] wr_index_1,
    input logic [RBIN_WIDTH-1:0] rd_index_0,
    input logic [RBIN_WIDTH-1:0] rd_index_1,
    input logic [1:0] 		 incr_val_0,
    input logic [1:0] 		 incr_val_1,
    output logic [3:0] 		 rbin_val_0,
    output logic [3:0] 		 rbin_val_1

    );
    logic [3:0] rbin_array[RBINS];

   always_comb
     begin
	if(ren)
	  begin
	     rbin_val_0             = rbin_array[rd_index_0];
	     rbin_val_1             = rbin_array[rd_index_1];
	  end
	else
	  begin
	     rbin_val_0             = 0;
	     rbin_val_1             = 0;
	  end
     end

   always @ (posedge clk)
     begin
	if(rst)
	  begin
	     for(integer i=0; i< RBINS; i=i+1)
	       begin
		  rbin_array[i] <= 0;
	       end
	  end
	else
	  begin

	     if(en)
	       begin
		  if(wen_0)
		    begin
		       rbin_array[wr_index_0] <= rbin_array[wr_index_0] + incr_val_0;
		    end

		  if(wen_1)
		    begin
		       rbin_array[wr_index_1] <= rbin_array[wr_index_1] + incr_val_1;
		    end

	       end // if (en)
	  end // else: !if(rst)
     end // always @ (posedge clk)

endmodule // reg_map


module update_histogram_reg #(
			      parameter RBINS=128,
			      parameter RBIN_WIDTH = 8 //(including sign)
			      )
  (
        input 			      clk,
        input 			      rst_n,
	input logic [RBIN_WIDTH-1:0]  r_bin_0,
	input logic [RBIN_WIDTH-1:0]  r_bin_1,
	input logic 		      r_bin_vld,
	input logic 		      enable_V,
	output logic [RBIN_WIDTH-2:0] local_max_rbin,
	output logic [3:0] 	      local_max_count,
	output logic 		      local_max_vld,
	input logic 		      reset_rbins
);











   logic [3:0] 		   bin_val_max;
   logic [RBIN_WIDTH-2:0]  bin_max;

   logic [RBIN_WIDTH-2:0]  rbin_idx_0;
   logic [RBIN_WIDTH-2:0]  rbin_idx_1;
   logic 		   vld_bin_0;
   logic 		   vld_bin_1;

   logic 		   vld_bin_d;
   logic 		   r_bin_vld_d;
   logic [1:0] 		   incr_val_0;
   logic [1:0] 		   incr_val_1;
   logic 		   wen_0;
   logic 		   wen_1;
   logic [3:0] 		   bin_val_0;
   logic [3:0] 		   bin_val_1;
   logic [1:0] 		   bin_status;
   logic 		   ren;

   logic [RBIN_WIDTH-1:0]  rd_index_0;
   logic [RBIN_WIDTH-1:0]  rd_index_1;



   assign   wen_0       = ~r_bin_0[RBIN_WIDTH-1]; // & r_bin_vld & enable_V;
   assign   wen_1       = ~r_bin_1[RBIN_WIDTH-1]; // & r_bin_vld & enable_V;
   assign   incr_val_0  = {1'b0,~r_bin_0[RBIN_WIDTH-1]};
   assign   incr_val_1  = {1'b0,~r_bin_1[RBIN_WIDTH-1]};
   assign   rbin_idx_0  = (r_bin_vld & enable_V)? r_bin_0[RBIN_WIDTH-2:0] : rbin_idx_0;
   assign   rbin_idx_1  = (r_bin_vld & enable_V)? r_bin_1[RBIN_WIDTH-2:0] : rbin_idx_1;

   rbins #(
	.RBINS(RBINS),
	.RBIN_WIDTH(RBIN_WIDTH-1)
	)
   rbins_inst
     (
      .rst(~rst_n | reset_rbins),
      .clk(clk),
      .wen_0(wen_0),
      .wen_1(wen_1),
      .en(r_bin_vld & enable_V),
      .ren(ren),
      .wr_index_0(rbin_idx_0),
      .wr_index_1(rbin_idx_1),
      .incr_val_0(incr_val_0),
      .incr_val_1(incr_val_1),
      .rd_index_0(rd_index_0),
      .rd_index_1(rd_index_1),
      .rbin_val_0(bin_val_0),
      .rbin_val_1(bin_val_1)
      );


//`define RBIN_128

 always @ (posedge clk)
     begin
	if (~rst_n | reset_rbins )
	  begin
	     vld_bin_0             <= 0;
	     vld_bin_1             <= 0;
	     vld_bin_d             <= 0;


	     rd_index_0            <= 0;
	     rd_index_1            <= 0;

	  end
	else if (enable_V)
	  begin
	     vld_bin_d             <=  (vld_bin_0 | vld_bin_1)? 1 : 0;

	     if(r_bin_vld)
	       begin
		  rd_index_0 <= r_bin_0[RBIN_WIDTH-2:0];
		  vld_bin_0  <= ~r_bin_0[RBIN_WIDTH-1];

		  rd_index_1 <= r_bin_1[RBIN_WIDTH-2:0];
		  vld_bin_1  <= ~r_bin_1[RBIN_WIDTH-1];
	       end
	     else
	       begin
		  vld_bin_1  <= 0;
		  vld_bin_0  <= 0;
	       end // else: !if(r_bin_vld)
	  end
	else
	  begin
	     vld_bin_1  <= 0;
	     vld_bin_0  <= 0;
	     vld_bin_d  <= 0;
	  end
     end


     always @ (posedge clk)
     begin
	if (~rst_n | reset_rbins )
	  begin
	     ren                   <= 0;
	  end
	else
	  begin
	     if(r_bin_vld)
	       begin
		  ren         <= 1'b1;
	       end // if (r_bin_vld)
	     else
	       begin
		  ren        <= 1'b0;
	       end

	  end // else: !if(~rst_n | reset_rbins )

     end // always @ (posedge clk)

   assign bin_status[0] = vld_bin_0;
   assign bin_status[1] = vld_bin_1;

   always @ (posedge clk)
     begin
	if (~rst_n | reset_rbins )
	  begin
	     bin_val_max <= 0;
	     bin_max     <= 0;
	  end // if (~rst_n | reset_rbins )
	else if (enable_V)
	  begin
	     if(bin_status == 3)
	       begin
		  if(bin_val_0  >= bin_val_1)
		    begin
		       bin_val_max           <= bin_val_0;
		       bin_max               <= rd_index_0; //  rbin_idx_0;
		    end
		  else
		    begin
		       bin_val_max           <= bin_val_1;
		       bin_max               <= rd_index_1 ; // rbin_idx_1;
		    end // else: !if(bin_val_0  > bin_val_1)
	       end // if (bin_status == 3)
	     else if(bin_status == 2)
	       begin
		  bin_val_max           <= bin_val_1;
		  bin_max               <= rd_index_1 ; //rbin_idx_1;
	       end
	     else if (bin_status == 1)
	       begin
		  bin_val_max           <= bin_val_0;
		  bin_max               <= rd_index_0; // rbin_idx_0;
	       end
	     else
	       begin
//		  $display ("DO NOTHING");
	       end


	  end // if (enable_V)
	else
	  begin
	     bin_val_max    <= 0;
	     bin_max        <= 0;
	  end
     end


   always @ (posedge clk)
     begin
	if(reset_rbins || ~rst_n )
	  begin
	     local_max_rbin  <= 0;
	     local_max_count <= 0;
	     local_max_vld   <= 0;

	  end
	else
	  begin
	     if(vld_bin_d)
	       begin
		  if(bin_val_max > local_max_count)
		    begin
		       local_max_count <= bin_val_max;
		       local_max_rbin  <= bin_max;
		       local_max_vld   <= 1'b1;
		    end
		  else
		    local_max_vld <= 0;
	       end
	     else
	       local_max_vld <= 0;
	  end
     end
endmodule // update_histogram

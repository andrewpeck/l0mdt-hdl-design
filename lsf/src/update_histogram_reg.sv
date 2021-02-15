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
module update_histogram_reg #(
			      RBINS=128
			      )
  (
        input 		   clk,
        input 		   rst_n,
      	input logic [7:0]  r_bin_V_TDATA,
	input logic 	   r_bin_V_TVALID,
	output logic 	   r_bin_V_TREADY,
	input logic 	   enable_V,
	output logic [6:0] local_max_rbin,
	output logic [3:0] local_max_count,
	output logic 	   local_max_vld,
	input logic 	   reset_rbins
);



   logic [3:0] 		   r_val_V_TDATA;
   logic 		   r_val_V_TVALID;
   logic [7:0] 		   r_bin_out_TDATA;
   logic 		   r_bin_out_TVALID;
   logic [7:0] 		   r_bin_V_TDATA_d;


   logic [3:0] 		   rbin[RBINS];
   logic [3:0] 		   bin_val;

   logic [$clog2(RBINS)-1:0] rbin_idx;
   logic 		   vld_bin;




   assign r_bin_V_TREADY  = 1;
   assign bin_val         = rbin[rbin_idx] + 1;

`define RBIN_128


   always @ (posedge clk)
     begin
	if (~rst_n | reset_rbins )
	  begin
	     for(int i=0; i<RBINS; i++)
	       begin
		  rbin[i] = 0;
	       end

	     r_bin_out_TDATA       <= 0;
	     r_bin_out_TVALID      <= 0;
	     r_val_V_TDATA         <= 0;
	     rbin_idx              <= 0;
	     vld_bin               <= 0;
	     r_bin_V_TDATA_d       <= 0;

	  end
	else if (enable_V)
	  begin
	     r_bin_V_TDATA_d <= r_bin_V_TDATA;

	     if(r_bin_V_TVALID)
	       begin
`ifdef RBIN_128
		  rbin_idx <= r_bin_V_TDATA[6:0];
		  vld_bin  <= ~r_bin_V_TDATA[7];
`else
		  rbin_idx  <= (r_bin_V_TDATA - 32);
		  //vld_bin   <= (r_bin_V_TDATA >= 32 && r_bin_V_TDATA <= 95);
		  vld_bin   <= (r_bin_V_TDATA[7:4] >= 2 && r_bin_V_TDATA[7:4] <= 5);
`endif
	       end else begin// if (r_bin_V_TVALID)
		  vld_bin <= 0;

	       end
	     if(vld_bin)
	       begin
		  rbin[rbin_idx]      <= bin_val; //rbin[rbin_idx] + 1;
		  r_bin_out_TVALID    <= 1'b1;
		  r_val_V_TDATA       <= bin_val; //rbin[rbin_idx] + 1;
		  r_bin_out_TDATA     <= r_bin_V_TDATA_d;
	       end
	     else
	       begin
		  r_bin_out_TVALID    <= 1'b0;
	       end

	  end // if (enable_V)


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
	     if(r_bin_out_TVALID)
	       begin
		  if(r_val_V_TDATA > local_max_count)
		    begin
		       local_max_count <= r_val_V_TDATA;
		       local_max_rbin  <= r_bin_out_TDATA;
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

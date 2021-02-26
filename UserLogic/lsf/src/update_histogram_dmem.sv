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
module update_histogram_dmem #(
			 parameter RBINS=128
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

   logic [6:0] 		   hist_acc_wraddr;
   logic [6:0] 		   hist_acc_rdaddr;
   logic [6:0] 		   hist_acc_rdaddr_d0;
   logic [6:0] 		   hist_acc_rdaddr_d1;


   logic [3:0] 		   hist_acc_wrdata;
   logic [3:0] 		   hist_acc_wrdata_d0;
   logic [3:0] 		   hist_acc_rd;
   logic [3:0] 		   hist_acc_rddata;
   logic [3:0] 		   war_next_write;

   logic [7:0] 		   counter;


// logic [127:0] 	   histogram_reset_state;
   logic 		   reset_seq;
   logic 		   war ;
   logic [1:0] 		   war_d;
   logic 		   war_2;

      logic 		   hist_acc_wren;

   logic [3:0] 		   r_val_V_TDATA;
   logic 		   r_val_V_TVALID;
   logic 		   r_val_V_TREADY;
   logic [7:0] 		   r_bin_out_TDATA;
   logic 		   r_bin_out_TVALID;


   logic [7:0] 		   r_bin_V_TDATA_d0;
   logic [7:0] 		   r_bin_V_TDATA_d1;

   logic 		   r_bin_V_TVALID_d0;
   logic 		   r_bin_V_TVALID_d1;

   logic 		   bin_reset_state;


   assign r_bin_V_TREADY  = 1;

   assign hist_acc_rdaddr = (r_bin_V_TVALID == 1 && r_bin_V_TDATA[7]==0)? r_bin_V_TDATA[6:0] : 0;



   histogram_memory_128x4 hist_memory_inst(
					   .a(hist_acc_wraddr),
					   .d(hist_acc_wrdata),
					   .dpra(hist_acc_rdaddr_d0),
					   .clk(clk),
					   .we(hist_acc_wren),
					   .qdpo(hist_acc_rd)
					   );

   assign hist_acc_rddata = (war_2)? hist_acc_wrdata : ((war)? hist_acc_wrdata_d0 : hist_acc_rd);


   always @ (posedge clk)
     begin
	if (~rst_n | (~reset_rbins & ~enable_V))
	  begin
	     reset_seq             <= 1;
	     hist_acc_wren         <= 0;

	     r_bin_out_TDATA       <= 0;
	     r_bin_out_TVALID      <= 0;
	     hist_acc_wrdata       <= 0;
//	     histogram_reset_state <= 0;

	     r_bin_V_TVALID_d0     <= 0;
	     r_bin_V_TVALID_d1     <= 0;
	     r_bin_V_TDATA_d0      <= 0;
	     r_bin_V_TDATA_d1      <= 0;
	     hist_acc_wrdata_d0    <= 0;
	     war_d                 <= 0;
	     bin_reset_state       <= 0;
	     war                   <= 0;
	     hist_acc_rdaddr_d0    <= 0;
	     hist_acc_rdaddr_d1    <= 0;
	     war                   <= 0;
	     hist_acc_wraddr       <= 0;
	     hist_acc_wren         <= 0;
	     hist_acc_wrdata       <= 0;
	     counter               <= 0;

	  end
	else if (~reset_rbins & enable_V)
	  begin
	     reset_seq             <= 0;
	     hist_acc_wren         <= (r_bin_V_TDATA_d1[7] == 0)? r_bin_V_TVALID_d1 : 1'b0;
	     hist_acc_wraddr       <= (r_bin_V_TVALID_d1  == 1)?r_bin_V_TDATA_d1[6:0] : hist_acc_wraddr;
	     r_bin_out_TDATA       <= {1'b0,r_bin_V_TDATA_d1[6:0]};
	     r_bin_out_TVALID      <= (r_bin_V_TDATA_d1[7] == 0) && r_bin_V_TVALID_d1;

	     r_bin_V_TDATA_d0      <= r_bin_V_TDATA;
	     r_bin_V_TDATA_d1      <= r_bin_V_TDATA_d0;

	     r_bin_V_TVALID_d0     <= r_bin_V_TVALID;
	     r_bin_V_TVALID_d1     <= r_bin_V_TVALID_d0;

	     war_d                 <={war_d[0], war};
	     hist_acc_wrdata_d0    <= hist_acc_wrdata;
//	     bin_reset_state       <= (histogram_reset_state >> r_bin_V_TDATA_d0[6:0]) & 1'b1;
	     war                   <= (r_bin_V_TVALID_d0 == 1)&(hist_acc_wraddr == hist_acc_rdaddr_d0);
	     war_2                 <= (r_bin_V_TVALID_d0 == 1)&( r_bin_V_TVALID_d1) & (hist_acc_rdaddr_d1 == hist_acc_rdaddr_d0);

	     hist_acc_rdaddr_d0    <= hist_acc_rdaddr;
	     hist_acc_rdaddr_d1    <= hist_acc_rdaddr_d0;

	     counter               <= 0;

//	     if(bin_reset_state == 1)
	     if(r_bin_V_TVALID_d1)
	       begin

		  hist_acc_wrdata       <=   hist_acc_rddata + 1;
		  r_val_V_TDATA         <=   hist_acc_rddata + 1;
	       end
	     else
	       begin

		  hist_acc_wrdata       <=  1;
		  r_val_V_TDATA         <=  1;
	       end
	     r_val_V_TVALID        <= r_bin_V_TVALID_d0;


	  /* if(r_bin_V_TDATA_d0[7] == 0)
	       begin
		  histogram_reset_state[r_bin_V_TDATA_d0] = 1;

	       end*/
	  end // if (enable_V)
	else if (reset_rbins)
	  begin
	     hist_acc_wraddr       <= (hist_acc_wraddr == 7'h7f)? 0 : hist_acc_wraddr + 1;
	     hist_acc_wren         <= (counter == RBINS)? 0 : 1;
	     hist_acc_wrdata       <= 0;
	     r_val_V_TDATA         <= 0;
	     r_bin_out_TDATA       <= 0;




	     r_bin_out_TVALID      <= 0;
	     r_bin_V_TVALID_d0     <= 0;
	     r_bin_V_TVALID_d1     <= 0;
	     r_bin_V_TDATA_d0      <= 0;
	     r_bin_V_TDATA_d1      <= 0;
	     hist_acc_wrdata_d0    <= 0;
	     war_d                 <= 0;
	     bin_reset_state       <= 0;
	     war                   <= 0;
	     hist_acc_rdaddr_d0    <= 0;
	     hist_acc_rdaddr_d1    <= 0;
	     war                   <= 0;
	     counter               <= (counter == RBINS)? counter : counter + 1;

	  end // if (reset_rbins)


     end


   always @ (posedge clk)
     begin
	if(reset_rbins || (~rst_n & enable_V == 0))
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

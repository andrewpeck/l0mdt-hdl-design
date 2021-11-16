`include "fm_sb_pkg.sv"
`include "FM_PKG.svh"

import fm_ctrl::*;
import fm_sb_pkg::*;


module fm_sb_ctrl(
		  input 			   FM_CTRL_t fm_ctrl_in,
		  input logic 			   axi_rst,
		  input logic 			   axi_clk,
		  output logic [total_sb-1:0] 	   freeze,
		  output logic [pb_mode_width-1:0] playback_mode[total_sb]
		  );

   logic 				  global_freeze;
   logic [pb_mode_width-1:0] 		  global_pb_mode;
   logic [axi_dw-1:0] 			  freeze_mask;
   logic [axi_dw-1:0] 			  playback_mask;

   assign global_freeze  = fm_ctrl_in.SPY_CTRL.GLOBAL_FREEZE;
   assign global_pb_mode = fm_ctrl_in.SPY_CTRL.GLOBAL_PLAYBACK_MODE;

   always @ (posedge axi_clk)
     begin
	if(axi_rst)
	  begin
	     freeze        <= 0;
	     for (int i=0; i<total_sb; i=i+1)
	       playback_mode[i] <= 0;

	  end
	else
	  begin
	     for (int i=0; i<total_sb; i=i+1)
	       begin
		  if(fm_ctrl_in.FREEZE_MASK_0[i] == 0)
		    begin
		       freeze[i] <= global_freeze;
		    end
		  else
		    begin
		       freeze[i] <= 0;
		    end
	       end // for (int i=0; i<total_sb; i=i+1)



	     for (int i=0; i<total_sb; i=i+1)
	       begin
		  if(i < 16)
		    begin
		       if(fm_ctrl_in.PLAYBACK_MASK_0[pb_mode_width*i +: pb_mode_width] == 0)
			 begin
			    playback_mode[i] <= global_pb_mode;
			 end
		       else
			 begin
			    playback_mode[i] <= 0;
			 end
		    end // if (i < 16)
		  else if (i < 32 )
		    begin
		         if(fm_ctrl_in.PLAYBACK_MASK_1[pb_mode_width*(i>>5) +: pb_mode_width] == 0)
			 begin
			    playback_mode[i] <= global_pb_mode;
			 end
		       else
			 begin
			    playback_mode[i] <= 0;
			 end
		    end
	       end // for (int i=0; i<total_sb; i=i+1)

	  end
     end

   endmodule

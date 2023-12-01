`include "fm_sb_pkg.sv"
`include "FM_PKG.svh"

import FM_CTRL::*;
import fm_sb_pkg::*;


module fm_sb_ctrl(
		  input 			   FM_CTRL_t fm_ctrl_in,
		  input logic 			   axi_reset_n,
		  input logic 			   axi_clk,
		  output logic [sb_mapped_n-1:0]   freeze,
		  output logic [pb_mode_width-1:0] playback_mode[sb_mapped_n],
		  output logic 			   init_spy_mem,
		  output logic [sb_mapped_n-1:0]   sb_reset
		  );
   
   logic 					   global_freeze;
   logic [pb_mode_width-1:0] 			   global_pb_mode;
   
   
   logic [axi_dw-1:0] 				   freeze_mask;
   
   



   assign global_freeze      = fm_ctrl_in.SPY_CTRL.GLOBAL_FREEZE;
   assign global_pb_mode = fm_ctrl_in.SPY_CTRL.GLOBAL_PLAYBACK_MODE;
   assign init_spy_mem     = fm_ctrl_in.SPY_CTRL.INITIALIZE_SPY_MEMORY;
   assign sb_reset          =  {fm_ctrl_in.SB_RESET_1, fm_ctrl_in.SB_RESET_0};
   always @ (posedge axi_clk)
     begin
	if(~axi_reset_n)
	  begin
	     freeze        <= 0;
	     for (int i=0; i<sb_mapped_n; i=i+1)
	       playback_mode[i] <= 0;

	  end
	else
	  begin

	     for (int i=0; i<sb_mapped_n; i=i+1)
	       begin
		  if(i < 32)
		    begin
		       if(fm_ctrl_in.FREEZE_MASK_0[i] == 0)
			 begin
			    freeze[i] <= global_freeze;
			 end
		       else
			 begin
			    freeze[i] <= 1'b0;
			 end
		    end // if (i < 32)
		  else if (i<64)
		    begin
		       if(fm_ctrl_in.FREEZE_MASK_1[i-32] == 0)
			 begin
			    freeze[i] <= global_freeze;
			 end
		       else
			 begin
			    freeze[i] <= 1'b0;
			 end
		    end // if (i<64)
		  else if (i<96)
		    begin
		       if(fm_ctrl_in.FREEZE_MASK_2[i-64] == 0)
			 begin
			    freeze[i] <= global_freeze;
			 end
		       else
			 begin
			    freeze[i] <= 1'b0;
			 end
		    end // if (i<96)
		   else if (i<127)
		    begin
		       if(fm_ctrl_in.FREEZE_MASK_3[i-96] == 0)
			 begin
			    freeze[i] <= global_freeze;
			 end
		       else
			 begin
			    freeze[i] <= 1'b0;
			 end
		    end // if (i<127)
		   else
		    begin
		       freeze[i] = 1'b0;

		    end // else: !if(i<127)
		  
		  
	       end // for (int i=0; i<total_sb; i=i+1)



	     for (int i=0; i<sb_mapped_n; i=i+1)
	       begin
		  if(i < 32)
		    begin
		       if(fm_ctrl_in.PLAYBACK_MASK_0[i] == 0)
			 begin
			    playback_mode[i] <= global_pb_mode;
			 end
		       else
			 begin
			    playback_mode[i] <= 0;
			 end
		    end // if (i < 32)
		  else if (i < 64 )
		    begin
		         if(fm_ctrl_in.PLAYBACK_MASK_1[i-32] == 0)
			 begin
			    playback_mode[i] <= global_pb_mode;
			 end
		       else
			 begin
			    playback_mode[i] <= 0;
			 end
		    end // if (i < 64 )
		    else if (i < 96 )
		    begin
		         if(fm_ctrl_in.PLAYBACK_MASK_2[i-64] == 0)
			 begin
			    playback_mode[i] <= global_pb_mode;
			 end
		       else
			 begin
			    playback_mode[i] <= 0;
			 end
		    end // if (i < 96 )
		    else if (i < 128 )
		    begin
		         if(fm_ctrl_in.PLAYBACK_MASK_1[i-96] == 0)
			 begin
			    playback_mode[i] <= global_pb_mode;
			 end
		       else
			 begin
			    playback_mode[i] <= 0;
			 end
		    end // if (i < 128 )
		    else
		    begin
		       playback_mode[i] <= 2'b0;
		    end
	       end // for (int i=0; i<sb_mapped_n; i=i+1)

	  end
     end

   endmodule

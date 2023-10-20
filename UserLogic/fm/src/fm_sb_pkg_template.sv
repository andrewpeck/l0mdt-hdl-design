`ifndef _FM_SB_PKG_
`define _FM_SB_PKG_
`include "l0mdt_buses_constants.svh"
`include "FM_PKG.svh"



package fm_sb_pkg;

   import FM_CTRL::*;
   import l0mdt_dataformats_svh::*;

   //parameter total_sb_bits      = $clog2(total_sb);
   parameter axi_dw                    = 32;
   parameter mon_dw_max         = 256;
   parameter pb_mode_width     = 2;
   parameter SB_DUMMY_LEN     = 51;


 
   
   
  

   FM_CTRL_t FM_CTRL;
   FM_MON_t FM_MON;

   logic [SF2PTCALC_LEN-1:0] tmp;

   //Below definitions should match the definition on fm_ult_pkg.vhd
   parameter sf_sb_n                  = 3;
   typedef  struct packed {
      logic [mon_dw_max-1 : 0] fm_data;
      logic 		       fm_vld;
      }fm_rt;

   
   //Above  definitions should match the definition on fm_ult_pkg.vhd

      logic 	      spy_clock;

 //INSERT HERE

  //Need to update sb_mapped_n manually from fm_ult_pkg.vhd (total_sb + 2 dummy sb)
   parameter sb_master_dummy_index    = total_l0mdt_sb ;
   parameter sb_slave_dummy_index       = sb_master_dummy_index + 1 ;


   
   function integer find_ceil;
      input integer   max;
      input integer   min;
      
      integer 	      diff;
      integer 	      res;
      integer 	      valid_ratio;
      
      begin
	 if (max == min | max < min)
	   find_ceil = 1;
	 else
	   begin
	      diff  = max - min;
	      
	      for (res=1; diff>0; res=res+1)
		diff = diff - min;

	     if (res & 1 == 1) //Vivado constraint on valid port ratio -- CHECK
	       res = res + 1;
	      
	      find_ceil = res;
	   end
      end
   endfunction // if


    function integer find_floor;
      input integer   max;
      input integer   min;
      
      integer 	      diff;
      integer 	      res;
      integer 	      valid_ratio;
      
      begin
	 if (max == min )
	   find_floor = 1;
	 else if ( max < min)
	   begin
	      find_floor = 0;	      
	   end
	 else
	   begin
	      diff  = max - min;
	      
	      for (res=1; diff-min>0; res=res+1)
		diff = diff - min;

	 /*    if (res & 1 == 1) //Vivado constraint on valid port ratio -- CHECK
	       res = res + 1;
	   */   
	      find_floor = res;
	   end
      end
   endfunction // if


      function integer find_sb_dw;
      input integer 	     sb_dw;
      input integer 	     axi_dw;

      integer 		     i_ceil;
      integer 		     i_floor;
      integer 		     res;
      
      begin
	 i_floor = find_floor(sb_dw, axi_dw);
	 i_ceil   = find_ceil (sb_dw, i_floor * axi_dw);
	 
	 res       = i_ceil * i_floor * axi_dw;
	 
	 find_sb_dw = res;
      end
   endfunction // if
   
endpackage // fm_sb_pkgfm
   
`endif //  `ifndef _FM_SB_PKG_

`ifndef _FM_SB_PKG_
`define _FM_SB_PKG_
`include "l0mdt_buses_constants.svh"
`include "FM_PKG.svh"



package fm_sb_pkg;

   import FM_CTRL::*;
   import l0mdt_dataformats_svh::*;

   //parameter total_sb_bits      = $clog2(total_sb);
   parameter axi_dw             = 32;
   parameter mon_dw_max         = 256;
   parameter pb_mode_width      = 2;


/*   parameter stations_n         = 3; // INN, MID, OUT
   parameter threads_n          = 3;
   parameter sf_sb_n            = 3;
   parameter sf_sb_single_station_n   = sf_sb_n * threads_n;


   parameter h2s_sb_single_station_n  = sf_sb_single_station_n;
   parameter h2s_sb_all_station_n     = h2s_sb_single_station_n * stations_n;
   parameter total_sb                 = h2s_sb_all_station_n ;
*/
   //Need to update sb_mapped_n manually from fm_ult_pkg.vhd (total_sb + 1 dummy sb)
   parameter total_l0mdt_sb                =  27;
   parameter sb_total_dummy             = 2;   
   parameter sb_mapped_n                  = total_l0mdt_sb + sb_total_dummy;
   
   parameter sb_master_dummy_index    = total_l0mdt_sb ;
   parameter sb_slave_dummy_index       = sb_master_dummy_index + 1 ;

   parameter SB_DUMMY_DW = 51;
   

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

   parameter  reg [31:0]       axi_sb_addr_width[sb_mapped_n] = {
								 $bits(FM_CTRL.SB0.SB_MEM.address),
								 $bits(FM_CTRL.SB1.SB_MEM.address),
								 $bits(FM_CTRL.SB2.SB_MEM.address),
								 $bits(FM_CTRL.SB3.SB_MEM.address),
								 $bits(FM_CTRL.SB4.SB_MEM.address),
								 $bits(FM_CTRL.SB5.SB_MEM.address),
								 $bits(FM_CTRL.SB6.SB_MEM.address),
								 $bits(FM_CTRL.SB7.SB_MEM.address),
								 $bits(FM_CTRL.SB8.SB_MEM.address),
								 $bits(FM_CTRL.SB9.SB_MEM.address),
								 $bits(FM_CTRL.SB10.SB_MEM.address),
								 $bits(FM_CTRL.SB11.SB_MEM.address),
								 $bits(FM_CTRL.SB12.SB_MEM.address),
								 $bits(FM_CTRL.SB13.SB_MEM.address),
								 $bits(FM_CTRL.SB14.SB_MEM.address),
								 $bits(FM_CTRL.SB15.SB_MEM.address),
								 $bits(FM_CTRL.SB16.SB_MEM.address),
								 $bits(FM_CTRL.SB17.SB_MEM.address),
								 $bits(FM_CTRL.SB18.SB_MEM.address),
								 $bits(FM_CTRL.SB19.SB_MEM.address),
								 $bits(FM_CTRL.SB20.SB_MEM.address),
								 $bits(FM_CTRL.SB21.SB_MEM.address),
								 $bits(FM_CTRL.SB22.SB_MEM.address),
								 $bits(FM_CTRL.SB23.SB_MEM.address),
								 $bits(FM_CTRL.SB24.SB_MEM.address),
								 $bits(FM_CTRL.SB25.SB_MEM.address),
								 $bits(FM_CTRL.SB26.SB_MEM.address),
								 $bits(FM_CTRL.SB_DUMMY0.SB_MEM.address),
								 $bits(FM_CTRL.SB_DUMMY1.SB_MEM.address)
								 };
   

/* -----\/----- EXCLUDED -----\/-----
   parameter reg[31:0]  axi_sm_addr_width[sb_mapped_n] = {
						     $bits(FM_CTRL.SB0.SB_META.address),
						     $bits(FM_CTRL.SB1.SB_META.address),
						     $bits(FM_CTRL.SB2.SB_META.address),
						     $bits(FM_CTRL.SB3.SB_META.address),
						     $bits(FM_CTRL.SB4.SB_META.address),
						     $bits(FM_CTRL.SB5.SB_META.address),
						     $bits(FM_CTRL.SB6.SB_META.address),
						     $bits(FM_CTRL.SB7.SB_META.address),
						     $bits(FM_CTRL.SB8.SB_META.address),
						     $bits(FM_CTRL.SB9.SB_META.address),
						     $bits(FM_CTRL.SB10.SB_META.address),
						     $bits(FM_CTRL.SB11.SB_META.address),
						     $bits(FM_CTRL.SB12.SB_META.address),
						     $bits(FM_CTRL.SB13.SB_META.address),
						     $bits(FM_CTRL.SB14.SB_META.address),
						     $bits(FM_CTRL.SB15.SB_META.address),
						     $bits(FM_CTRL.SB16.SB_META.address),
						     $bits(FM_CTRL.SB17.SB_META.address),
						     $bits(FM_CTRL.SB18.SB_META.address),
						     $bits(FM_CTRL.SB19.SB_META.address),
						     $bits(FM_CTRL.SB20.SB_META.address),
						     $bits(FM_CTRL.SB21.SB_META.address),
						     $bits(FM_CTRL.SB22.SB_META.address),
						     $bits(FM_CTRL.SB23.SB_META.address),
						     $bits(FM_CTRL.SB24.SB_META.address),
						     $bits(FM_CTRL.SB25.SB_META.address),
						     $bits(FM_CTRL.SB26.SB_META.address)
						     };
 -----/\----- EXCLUDED -----/\----- */

   logic 	      spy_clock;
   //integer 	      j=0;
   //string 	      sb_offset = {"SB","0"};
   //string 	      sb_offset;
   //string 	      tmp = {"SB", j.dectoa()};

   const string       sb_offset[sb_mapped_n] = {
						"SB0",
						"SB1",
						"SB2",
						"SB3",
						"SB4",
						"SB5",
						"SB6",
						"SB7",
						"SB8",
						"SB9",
						"SB10",
						"SB11",
						"SB12",
						"SB13",
						"SB14",
						"SB15",
						"SB16",
						"SB17",
						"SB18",
						"SB19",
						"SB20",
						"SB21",
						"SB22",
						"SB23",
						"SB24",
						"SB25",
						"SB26",
						"SB_DUMMY0",
						"SB_DUMMY1"
						};

   parameter integer  sb_dw[sb_mapped_n] = {
				       find_ceil(HEG2SFSLC_LEN,axi_dw) * axi_dw, //INN - THREAD 0
				       find_ceil(HEG2SFHIT_LEN,axi_dw) * axi_dw,
				       find_ceil(SF2PTCALC_LEN,axi_dw) * axi_dw,
				       find_ceil(HEG2SFSLC_LEN,axi_dw) * axi_dw, //INN - THREAD 1
				       find_ceil(HEG2SFHIT_LEN,axi_dw) * axi_dw,
				       find_ceil(SF2PTCALC_LEN,axi_dw) * axi_dw,
				       find_ceil(HEG2SFSLC_LEN,axi_dw) * axi_dw, //INN - THREAD 2
				       find_ceil(HEG2SFHIT_LEN,axi_dw) * axi_dw,
				       find_ceil(SF2PTCALC_LEN,axi_dw) * axi_dw,
				       find_ceil(HEG2SFSLC_LEN,axi_dw) * axi_dw, //MID - THREAD 0
				       find_ceil(HEG2SFHIT_LEN,axi_dw) * axi_dw,
				       find_ceil(SF2PTCALC_LEN,axi_dw) * axi_dw,
				       find_ceil(HEG2SFSLC_LEN,axi_dw) * axi_dw, //MID - THREAD 1
				       find_ceil(HEG2SFHIT_LEN,axi_dw) * axi_dw,
				       find_ceil(SF2PTCALC_LEN,axi_dw) * axi_dw,
				       find_ceil(HEG2SFSLC_LEN,axi_dw) * axi_dw, //MID - THREAD 2
				       find_ceil(HEG2SFHIT_LEN,axi_dw) * axi_dw,
				       find_ceil(SF2PTCALC_LEN,axi_dw) * axi_dw,
				       find_ceil(HEG2SFSLC_LEN,axi_dw) * axi_dw, //OUT - THREAD 0
				       find_ceil(HEG2SFHIT_LEN,axi_dw) * axi_dw,
				       find_ceil(SF2PTCALC_LEN,axi_dw) * axi_dw,
				       find_ceil(HEG2SFSLC_LEN,axi_dw) * axi_dw, //OUT - THREAD 1
				       find_ceil(HEG2SFHIT_LEN,axi_dw) * axi_dw,
				       find_ceil(SF2PTCALC_LEN,axi_dw) * axi_dw,
				       find_ceil(HEG2SFSLC_LEN,axi_dw) * axi_dw, //OUT - THREAD 2
				       find_ceil(HEG2SFHIT_LEN,axi_dw) * axi_dw,
				       find_ceil(SF2PTCALC_LEN,axi_dw) * axi_dw,
				       find_ceil(SB_DUMMY_DW,axi_dw) * axi_dw, //sb_dummy0
				       find_ceil(SB_DUMMY_DW,axi_dw) * axi_dw //sb_dummy1
				       };


    parameter integer  sb_tp_dw[sb_mapped_n] = {
				       HEG2SFSLC_LEN, //INN - THREAD 0
				       HEG2SFHIT_LEN,
				       SF2PTCALC_LEN,
				       HEG2SFSLC_LEN, //INN - THREAD 1
				       HEG2SFHIT_LEN,
				       SF2PTCALC_LEN,
				       HEG2SFSLC_LEN, //INN - THREAD 2
				       HEG2SFHIT_LEN,
				       SF2PTCALC_LEN,
				       HEG2SFSLC_LEN, //MID - THREAD 0
				       HEG2SFHIT_LEN,
				       SF2PTCALC_LEN,
				       HEG2SFSLC_LEN, //MID - THREAD 1
				       HEG2SFHIT_LEN,
				       SF2PTCALC_LEN,
				       HEG2SFSLC_LEN, //MID - THREAD 2
				       HEG2SFHIT_LEN,
				       SF2PTCALC_LEN,
				       HEG2SFSLC_LEN, //OUT - THREAD 0
				       HEG2SFHIT_LEN,
				       SF2PTCALC_LEN,
				       HEG2SFSLC_LEN, //OUT - THREAD 1
				       HEG2SFHIT_LEN,
				       SF2PTCALC_LEN,
				       HEG2SFSLC_LEN, //OUT - THREAD 2
				       HEG2SFHIT_LEN,
				       SF2PTCALC_LEN,
				       SB_DUMMY_DW, //sb_dummy0
				       SB_DUMMY_DW //sb_dummy1
				       };



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


   
			 

      

endpackage // fm_sb_pkgfm

`endif //  `ifndef _FM_SB_PKG_

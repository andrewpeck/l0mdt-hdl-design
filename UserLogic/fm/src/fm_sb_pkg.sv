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
   parameter CUSTOM_CSM_UPLINK_DATA_LEN = 32;
   parameter CUSTOM_DAQ_LEN = 35;
   
   
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

parameter total_l0mdt_sb    = 112;
parameter sb_total_dummy = 2;
parameter sb_mapped_n      = total_l0mdt_sb + sb_total_dummy;

parameter integer sb_tp_dw[sb_mapped_n] = {
		 HEG2SFSLC_LEN
		,HEG2SFHIT_LEN
		,SF2PTCALC_LEN
		,HEG2SFSLC_LEN
		,HEG2SFHIT_LEN
		,SF2PTCALC_LEN
		,HEG2SFSLC_LEN
		,HEG2SFHIT_LEN
		,SF2PTCALC_LEN
		,HEG2SFSLC_LEN
		,HEG2SFHIT_LEN
		,SF2PTCALC_LEN
		,HEG2SFSLC_LEN
		,HEG2SFHIT_LEN
		,SF2PTCALC_LEN
		,HEG2SFSLC_LEN
		,HEG2SFHIT_LEN
		,SF2PTCALC_LEN
		,HEG2SFSLC_LEN
		,HEG2SFHIT_LEN
		,SF2PTCALC_LEN
		,HEG2SFSLC_LEN
		,HEG2SFHIT_LEN
		,SF2PTCALC_LEN
		,HEG2SFSLC_LEN
		,HEG2SFHIT_LEN
		,SF2PTCALC_LEN
		,SLC_RX_LEN
		,SLC_RX_LEN
		,SLC_RX_LEN
		,UCM2HPS_LEN
		,UCM2HPS_LEN
		,UCM2HPS_LEN
		,UCM2HPS_LEN
		,UCM2HPS_LEN
		,UCM2HPS_LEN
		,UCM2HPS_LEN
		,UCM2HPS_LEN
		,UCM2HPS_LEN
		,UCM2PL_LEN
		,UCM2PL_LEN
		,UCM2PL_LEN
		,MTC2SL_LEN
		,MTC2SL_LEN
		,MTC2SL_LEN
		,MTC2SL_LEN
		,MTC2SL_LEN
		,MTC2SL_LEN
		,MTC2SL_LEN
		,MTC2SL_LEN
		,MTC2SL_LEN
		,CUSTOM_CSM_UPLINK_DATA_LEN
		,TDCPOLMUX2TAR_LEN
		,TDCPOLMUX2TAR_LEN
		,TDCPOLMUX2TAR_LEN
		,TDCPOLMUX2TAR_LEN
		,TDCPOLMUX2TAR_LEN
		,TDCPOLMUX2TAR_LEN
		,TDCPOLMUX2TAR_LEN
		,TDCPOLMUX2TAR_LEN
		,TDCPOLMUX2TAR_LEN
		,TDCPOLMUX2TAR_LEN
		,TDCPOLMUX2TAR_LEN
		,TDCPOLMUX2TAR_LEN
		,TDCPOLMUX2TAR_LEN
		,TDCPOLMUX2TAR_LEN
		,TDCPOLMUX2TAR_LEN
		,TDCPOLMUX2TAR_LEN
		,TDCPOLMUX2TAR_LEN
		,TDCPOLMUX2TAR_LEN
		,TDCPOLMUX2TAR_LEN
		,TDCPOLMUX2TAR_LEN
		,TDCPOLMUX2TAR_LEN
		,TDCPOLMUX2TAR_LEN
		,TDCPOLMUX2TAR_LEN
		,TDCPOLMUX2TAR_LEN
		,TDCPOLMUX2TAR_LEN
		,TDCPOLMUX2TAR_LEN
		,TDCPOLMUX2TAR_LEN
		,TDCPOLMUX2TAR_LEN
		,TDCPOLMUX2TAR_LEN
		,TDCPOLMUX2TAR_LEN
		,TDCPOLMUX2TAR_LEN
		,TDCPOLMUX2TAR_LEN
		,TDCPOLMUX2TAR_LEN
		,TDCPOLMUX2TAR_LEN
		,TDCPOLMUX2TAR_LEN
		,TDCPOLMUX2TAR_LEN
		,TDCPOLMUX2TAR_LEN
		,TDCPOLMUX2TAR_LEN
		,TDCPOLMUX2TAR_LEN
		,TDCPOLMUX2TAR_LEN
		,TDCPOLMUX2TAR_LEN
		,TDCPOLMUX2TAR_LEN
		,CUSTOM_DAQ_LEN
		,CUSTOM_DAQ_LEN
		,CUSTOM_DAQ_LEN
		,CUSTOM_DAQ_LEN
		,CUSTOM_DAQ_LEN
		,CUSTOM_DAQ_LEN
		,CUSTOM_DAQ_LEN
		,CUSTOM_DAQ_LEN
		,CUSTOM_DAQ_LEN
		,CUSTOM_DAQ_LEN
		,CUSTOM_DAQ_LEN
		,CUSTOM_DAQ_LEN
		,CUSTOM_DAQ_LEN
		,CUSTOM_DAQ_LEN
		,CUSTOM_DAQ_LEN
		,CUSTOM_DAQ_LEN
		,CUSTOM_DAQ_LEN
		,CUSTOM_DAQ_LEN
		,SB_DUMMY_LEN
		,SB_DUMMY_LEN
			};
parameter integer sb_dw[sb_mapped_n] = {
		find_sb_dw(HEG2SFSLC_LEN, axi_dw)
		,find_sb_dw(HEG2SFHIT_LEN, axi_dw)
		,find_sb_dw(SF2PTCALC_LEN, axi_dw)
		,find_sb_dw(HEG2SFSLC_LEN, axi_dw)
		,find_sb_dw(HEG2SFHIT_LEN, axi_dw)
		,find_sb_dw(SF2PTCALC_LEN, axi_dw)
		,find_sb_dw(HEG2SFSLC_LEN, axi_dw)
		,find_sb_dw(HEG2SFHIT_LEN, axi_dw)
		,find_sb_dw(SF2PTCALC_LEN, axi_dw)
		,find_sb_dw(HEG2SFSLC_LEN, axi_dw)
		,find_sb_dw(HEG2SFHIT_LEN, axi_dw)
		,find_sb_dw(SF2PTCALC_LEN, axi_dw)
		,find_sb_dw(HEG2SFSLC_LEN, axi_dw)
		,find_sb_dw(HEG2SFHIT_LEN, axi_dw)
		,find_sb_dw(SF2PTCALC_LEN, axi_dw)
		,find_sb_dw(HEG2SFSLC_LEN, axi_dw)
		,find_sb_dw(HEG2SFHIT_LEN, axi_dw)
		,find_sb_dw(SF2PTCALC_LEN, axi_dw)
		,find_sb_dw(HEG2SFSLC_LEN, axi_dw)
		,find_sb_dw(HEG2SFHIT_LEN, axi_dw)
		,find_sb_dw(SF2PTCALC_LEN, axi_dw)
		,find_sb_dw(HEG2SFSLC_LEN, axi_dw)
		,find_sb_dw(HEG2SFHIT_LEN, axi_dw)
		,find_sb_dw(SF2PTCALC_LEN, axi_dw)
		,find_sb_dw(HEG2SFSLC_LEN, axi_dw)
		,find_sb_dw(HEG2SFHIT_LEN, axi_dw)
		,find_sb_dw(SF2PTCALC_LEN, axi_dw)
		,find_sb_dw(SLC_RX_LEN, axi_dw)
		,find_sb_dw(SLC_RX_LEN, axi_dw)
		,find_sb_dw(SLC_RX_LEN, axi_dw)
		,find_sb_dw(UCM2HPS_LEN, axi_dw)
		,find_sb_dw(UCM2HPS_LEN, axi_dw)
		,find_sb_dw(UCM2HPS_LEN, axi_dw)
		,find_sb_dw(UCM2HPS_LEN, axi_dw)
		,find_sb_dw(UCM2HPS_LEN, axi_dw)
		,find_sb_dw(UCM2HPS_LEN, axi_dw)
		,find_sb_dw(UCM2HPS_LEN, axi_dw)
		,find_sb_dw(UCM2HPS_LEN, axi_dw)
		,find_sb_dw(UCM2HPS_LEN, axi_dw)
		,find_sb_dw(UCM2PL_LEN, axi_dw)
		,find_sb_dw(UCM2PL_LEN, axi_dw)
		,find_sb_dw(UCM2PL_LEN, axi_dw)
		,find_sb_dw(MTC2SL_LEN, axi_dw)
		,find_sb_dw(MTC2SL_LEN, axi_dw)
		,find_sb_dw(MTC2SL_LEN, axi_dw)
		,find_sb_dw(MTC2SL_LEN, axi_dw)
		,find_sb_dw(MTC2SL_LEN, axi_dw)
		,find_sb_dw(MTC2SL_LEN, axi_dw)
		,find_sb_dw(MTC2SL_LEN, axi_dw)
		,find_sb_dw(MTC2SL_LEN, axi_dw)
		,find_sb_dw(MTC2SL_LEN, axi_dw)
		,find_sb_dw(CUSTOM_CSM_UPLINK_DATA_LEN, axi_dw)
		,find_sb_dw(TDCPOLMUX2TAR_LEN, axi_dw)
		,find_sb_dw(TDCPOLMUX2TAR_LEN, axi_dw)
		,find_sb_dw(TDCPOLMUX2TAR_LEN, axi_dw)
		,find_sb_dw(TDCPOLMUX2TAR_LEN, axi_dw)
		,find_sb_dw(TDCPOLMUX2TAR_LEN, axi_dw)
		,find_sb_dw(TDCPOLMUX2TAR_LEN, axi_dw)
		,find_sb_dw(TDCPOLMUX2TAR_LEN, axi_dw)
		,find_sb_dw(TDCPOLMUX2TAR_LEN, axi_dw)
		,find_sb_dw(TDCPOLMUX2TAR_LEN, axi_dw)
		,find_sb_dw(TDCPOLMUX2TAR_LEN, axi_dw)
		,find_sb_dw(TDCPOLMUX2TAR_LEN, axi_dw)
		,find_sb_dw(TDCPOLMUX2TAR_LEN, axi_dw)
		,find_sb_dw(TDCPOLMUX2TAR_LEN, axi_dw)
		,find_sb_dw(TDCPOLMUX2TAR_LEN, axi_dw)
		,find_sb_dw(TDCPOLMUX2TAR_LEN, axi_dw)
		,find_sb_dw(TDCPOLMUX2TAR_LEN, axi_dw)
		,find_sb_dw(TDCPOLMUX2TAR_LEN, axi_dw)
		,find_sb_dw(TDCPOLMUX2TAR_LEN, axi_dw)
		,find_sb_dw(TDCPOLMUX2TAR_LEN, axi_dw)
		,find_sb_dw(TDCPOLMUX2TAR_LEN, axi_dw)
		,find_sb_dw(TDCPOLMUX2TAR_LEN, axi_dw)
		,find_sb_dw(TDCPOLMUX2TAR_LEN, axi_dw)
		,find_sb_dw(TDCPOLMUX2TAR_LEN, axi_dw)
		,find_sb_dw(TDCPOLMUX2TAR_LEN, axi_dw)
		,find_sb_dw(TDCPOLMUX2TAR_LEN, axi_dw)
		,find_sb_dw(TDCPOLMUX2TAR_LEN, axi_dw)
		,find_sb_dw(TDCPOLMUX2TAR_LEN, axi_dw)
		,find_sb_dw(TDCPOLMUX2TAR_LEN, axi_dw)
		,find_sb_dw(TDCPOLMUX2TAR_LEN, axi_dw)
		,find_sb_dw(TDCPOLMUX2TAR_LEN, axi_dw)
		,find_sb_dw(TDCPOLMUX2TAR_LEN, axi_dw)
		,find_sb_dw(TDCPOLMUX2TAR_LEN, axi_dw)
		,find_sb_dw(TDCPOLMUX2TAR_LEN, axi_dw)
		,find_sb_dw(TDCPOLMUX2TAR_LEN, axi_dw)
		,find_sb_dw(TDCPOLMUX2TAR_LEN, axi_dw)
		,find_sb_dw(TDCPOLMUX2TAR_LEN, axi_dw)
		,find_sb_dw(TDCPOLMUX2TAR_LEN, axi_dw)
		,find_sb_dw(TDCPOLMUX2TAR_LEN, axi_dw)
		,find_sb_dw(TDCPOLMUX2TAR_LEN, axi_dw)
		,find_sb_dw(TDCPOLMUX2TAR_LEN, axi_dw)
		,find_sb_dw(TDCPOLMUX2TAR_LEN, axi_dw)
		,find_sb_dw(TDCPOLMUX2TAR_LEN, axi_dw)
		,find_sb_dw(CUSTOM_DAQ_LEN, axi_dw)
		,find_sb_dw(CUSTOM_DAQ_LEN, axi_dw)
		,find_sb_dw(CUSTOM_DAQ_LEN, axi_dw)
		,find_sb_dw(CUSTOM_DAQ_LEN, axi_dw)
		,find_sb_dw(CUSTOM_DAQ_LEN, axi_dw)
		,find_sb_dw(CUSTOM_DAQ_LEN, axi_dw)
		,find_sb_dw(CUSTOM_DAQ_LEN, axi_dw)
		,find_sb_dw(CUSTOM_DAQ_LEN, axi_dw)
		,find_sb_dw(CUSTOM_DAQ_LEN, axi_dw)
		,find_sb_dw(CUSTOM_DAQ_LEN, axi_dw)
		,find_sb_dw(CUSTOM_DAQ_LEN, axi_dw)
		,find_sb_dw(CUSTOM_DAQ_LEN, axi_dw)
		,find_sb_dw(CUSTOM_DAQ_LEN, axi_dw)
		,find_sb_dw(CUSTOM_DAQ_LEN, axi_dw)
		,find_sb_dw(CUSTOM_DAQ_LEN, axi_dw)
		,find_sb_dw(CUSTOM_DAQ_LEN, axi_dw)
		,find_sb_dw(CUSTOM_DAQ_LEN, axi_dw)
		,find_sb_dw(CUSTOM_DAQ_LEN, axi_dw)
		,find_sb_dw(SB_DUMMY_LEN, axi_dw)
		,find_sb_dw(SB_DUMMY_LEN, axi_dw)
			};
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
		$bits(FM_CTRL.SB27.SB_MEM.address),
		$bits(FM_CTRL.SB28.SB_MEM.address),
		$bits(FM_CTRL.SB29.SB_MEM.address),
		$bits(FM_CTRL.SB30.SB_MEM.address),
		$bits(FM_CTRL.SB31.SB_MEM.address),
		$bits(FM_CTRL.SB32.SB_MEM.address),
		$bits(FM_CTRL.SB33.SB_MEM.address),
		$bits(FM_CTRL.SB34.SB_MEM.address),
		$bits(FM_CTRL.SB35.SB_MEM.address),
		$bits(FM_CTRL.SB36.SB_MEM.address),
		$bits(FM_CTRL.SB37.SB_MEM.address),
		$bits(FM_CTRL.SB38.SB_MEM.address),
		$bits(FM_CTRL.SB39.SB_MEM.address),
		$bits(FM_CTRL.SB40.SB_MEM.address),
		$bits(FM_CTRL.SB41.SB_MEM.address),
		$bits(FM_CTRL.SB42.SB_MEM.address),
		$bits(FM_CTRL.SB43.SB_MEM.address),
		$bits(FM_CTRL.SB44.SB_MEM.address),
		$bits(FM_CTRL.SB45.SB_MEM.address),
		$bits(FM_CTRL.SB46.SB_MEM.address),
		$bits(FM_CTRL.SB47.SB_MEM.address),
		$bits(FM_CTRL.SB48.SB_MEM.address),
		$bits(FM_CTRL.SB49.SB_MEM.address),
		$bits(FM_CTRL.SB50.SB_MEM.address),
		$bits(FM_CTRL.SB51.SB_MEM.address),
		$bits(FM_CTRL.SB52.SB_MEM.address),
		$bits(FM_CTRL.SB53.SB_MEM.address),
		$bits(FM_CTRL.SB54.SB_MEM.address),
		$bits(FM_CTRL.SB55.SB_MEM.address),
		$bits(FM_CTRL.SB56.SB_MEM.address),
		$bits(FM_CTRL.SB57.SB_MEM.address),
		$bits(FM_CTRL.SB58.SB_MEM.address),
		$bits(FM_CTRL.SB59.SB_MEM.address),
		$bits(FM_CTRL.SB60.SB_MEM.address),
		$bits(FM_CTRL.SB61.SB_MEM.address),
		$bits(FM_CTRL.SB62.SB_MEM.address),
		$bits(FM_CTRL.SB63.SB_MEM.address),
		$bits(FM_CTRL.SB64.SB_MEM.address),
		$bits(FM_CTRL.SB65.SB_MEM.address),
		$bits(FM_CTRL.SB66.SB_MEM.address),
		$bits(FM_CTRL.SB67.SB_MEM.address),
		$bits(FM_CTRL.SB68.SB_MEM.address),
		$bits(FM_CTRL.SB69.SB_MEM.address),
		$bits(FM_CTRL.SB70.SB_MEM.address),
		$bits(FM_CTRL.SB71.SB_MEM.address),
		$bits(FM_CTRL.SB72.SB_MEM.address),
		$bits(FM_CTRL.SB73.SB_MEM.address),
		$bits(FM_CTRL.SB74.SB_MEM.address),
		$bits(FM_CTRL.SB75.SB_MEM.address),
		$bits(FM_CTRL.SB76.SB_MEM.address),
		$bits(FM_CTRL.SB77.SB_MEM.address),
		$bits(FM_CTRL.SB78.SB_MEM.address),
		$bits(FM_CTRL.SB79.SB_MEM.address),
		$bits(FM_CTRL.SB80.SB_MEM.address),
		$bits(FM_CTRL.SB81.SB_MEM.address),
		$bits(FM_CTRL.SB82.SB_MEM.address),
		$bits(FM_CTRL.SB83.SB_MEM.address),
		$bits(FM_CTRL.SB84.SB_MEM.address),
		$bits(FM_CTRL.SB85.SB_MEM.address),
		$bits(FM_CTRL.SB86.SB_MEM.address),
		$bits(FM_CTRL.SB87.SB_MEM.address),
		$bits(FM_CTRL.SB88.SB_MEM.address),
		$bits(FM_CTRL.SB89.SB_MEM.address),
		$bits(FM_CTRL.SB90.SB_MEM.address),
		$bits(FM_CTRL.SB91.SB_MEM.address),
		$bits(FM_CTRL.SB92.SB_MEM.address),
		$bits(FM_CTRL.SB93.SB_MEM.address),
		$bits(FM_CTRL.SB94.SB_MEM.address),
		$bits(FM_CTRL.SB95.SB_MEM.address),
		$bits(FM_CTRL.SB96.SB_MEM.address),
		$bits(FM_CTRL.SB97.SB_MEM.address),
		$bits(FM_CTRL.SB98.SB_MEM.address),
		$bits(FM_CTRL.SB99.SB_MEM.address),
		$bits(FM_CTRL.SB100.SB_MEM.address),
		$bits(FM_CTRL.SB101.SB_MEM.address),
		$bits(FM_CTRL.SB102.SB_MEM.address),
		$bits(FM_CTRL.SB103.SB_MEM.address),
		$bits(FM_CTRL.SB104.SB_MEM.address),
		$bits(FM_CTRL.SB105.SB_MEM.address),
		$bits(FM_CTRL.SB106.SB_MEM.address),
		$bits(FM_CTRL.SB107.SB_MEM.address),
		$bits(FM_CTRL.SB108.SB_MEM.address),
		$bits(FM_CTRL.SB109.SB_MEM.address),
		$bits(FM_CTRL.SB110.SB_MEM.address),
		$bits(FM_CTRL.SB111.SB_MEM.address),
		$bits(FM_CTRL.SB112.SB_MEM.address),
		$bits(FM_CTRL.SB113.SB_MEM.address)			};

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

	    if(sb_dw <= 32)
	      begin
		 res = axi_dw;
	      end
	    else if (sb_dw <= 64)
	      begin
		 res = 64;		 
	      end
	    else if (sb_dw <= 128)
	      begin
		 res = 128;
	      end
	    else  if (sb_dw <= 256)
	      begin
		 res = 256;
	      end
	    else
	      begin
		 //Error
		  $display("ERROR in find_sb_dw, unsupported width(%d)",sb_dw);
	      end
	    /*
	 i_floor = find_floor(sb_dw, axi_dw);
	 i_ceil   = find_ceil (sb_dw, i_floor * axi_dw);
	 
	 res       = i_ceil * i_floor * axi_dw;	
	     */
	    find_sb_dw = res;
      end
   endfunction // if
   
endpackage // fm_sb_pkgfm
   
`endif //  `ifndef _FM_SB_PKG_

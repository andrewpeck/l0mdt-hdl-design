//Author : Priya Sundararajan (priya.sundararajan@uci.edu)
`include "fm_sb_pkg.sv"
`include "FM_PKG.svh"

import FM_CTRL::*;
import fm_sb_pkg::*;


module fm_data #(
		 parameter total_l0mdt_sb = 27
		 )(
	       input logic 		       clk_hs,
	       input logic 		       rst_hs,
	       input logic 		       spy_clock,
	       input logic 		       axi_reset_n,
	       input logic [sb_mapped_n-1:0]   freeze,
	       input logic 		       init_spy_mem,
	       input logic [sb_mapped_n-1:0]   sb_reset,
	       input logic [pb_mode_width-1:0] playback_mode[sb_mapped_n],
	       input 			       FM_CTRL_t fm_ctrl_in,
	       input 			       fm_rt ult_mon_data[total_l0mdt_sb] ,
	       output 			       FM_MON_t fm_mon_out,
	       output logic [mon_dw_max-1 : 0] fm_playback_data[total_l0mdt_sb]
	       );
   localparam axi_dw = axi_dw;
   genvar 	      sb_i;
   logic [sb_mapped_n-1 :0] axi_spy_rd_vld;
   logic [sb_mapped_n-1 :0] axi_spy_meta_rd_vld;
   logic [axi_dw-1:0] 	 axi_spy_data[sb_mapped_n];
   logic [axi_dw-1:0] 	 axi_spy_data_i[sb_mapped_n];
   logic [axi_dw-1:0] 	 axi_spy_meta_data[sb_mapped_n];
   logic [0:sb_mapped_n-1] axi_sb_enable;
   logic [0:sb_mapped_n-1] axi_sb_enable_internal;
   logic 		   axi_sm_enable[sb_mapped_n];
   logic [0:sb_mapped_n-1] axi_sb_wr_enable;
   logic 		   axi_sm_wr_enable[sb_mapped_n];
   logic [axi_dw-1:0] 	 axi_sb_wr_data[sb_mapped_n] ;
   logic [axi_dw-1:0] 	 axi_sm_wr_data[sb_mapped_n];
   logic [15:0] 	 axi_sb_addr[sb_mapped_n] ;
   logic [15:0] 	 axi_sm_addr[sb_mapped_n] ;
   
   logic [15:0] 	 axi_sb_init_addr[sb_mapped_n]  = '{default:0};
   logic [axi_dw-1:0] 	 axi_sb_init_wr_data[sb_mapped_n] = '{default:0} ;
   logic 		 init_spy_mem_internal;
   logic [sb_dw[sb_master_dummy_index] -1:0] 	 dummy_mon_data[sb_total_dummy];
   logic 			dummy_mon_vld[sb_total_dummy];
   logic [0:sb_mapped_n-1] 	sb_empty;
   
   fm_rt fm_passthrough_data[sb_mapped_n];
   fm_rt fm_mon_data[sb_mapped_n];

     generate
      for (sb_i = 0; sb_i < total_l0mdt_sb; sb_i = sb_i+1)
	begin
	   assign fm_playback_data[sb_i] = (~sb_empty[sb_i])? fm_passthrough_data[sb_i].fm_data : 'b0;
	end
     endgenerate
   
     generate
      for (sb_i = 0; sb_i < sb_mapped_n; sb_i = sb_i+1)
	begin
	   assign  fm_passthrough_data[sb_i].fm_vld = fm_passthrough_data[sb_i].fm_data[sb_tp_dw[sb_i]-1] & ~sb_empty[sb_i];
	   
	end
     endgenerate

   generate
      for (sb_i = 0; sb_i < sb_mapped_n; sb_i = sb_i+1)
	begin
	   if(sb_i < total_l0mdt_sb)
	     begin
		assign fm_mon_data[sb_i] = ult_mon_data[sb_i];
	     end
	   else
	     begin
		if(sb_i < total_l0mdt_sb + sb_total_dummy)
		  begin
		     assign fm_mon_data[sb_i] = '{fm_data:{dummy_mon_data[sb_i-total_l0mdt_sb]}, fm_vld:dummy_mon_vld[sb_i-total_l0mdt_sb]};
		  end
		else
		  begin
		     assign fm_mon_data[sb_i] = '{fm_data:0, fm_vld:0};
		  end

	     end
	end
   endgenerate


  generate
      for (sb_i = 0; sb_i < sb_mapped_n; sb_i = sb_i+1)
	begin
	   assign axi_spy_data[sb_i] =  (axi_spy_rd_vld[sb_i] == 1)? axi_spy_data_i[sb_i] : 0;	   
	end
     endgenerate



assign axi_sb_enable_internal                =  (init_spy_mem_internal == 1)? '1:axi_sb_enable;


assign fm_mon_out.SB0.SB_MEM = (axi_spy_rd_vld[0] == 0)? '{rd_data:'b0, rd_data_valid:0} :  '{rd_data:axi_spy_data[0], rd_data_valid:axi_spy_rd_vld[0]};
assign fm_mon_out.SB1.SB_MEM = (axi_spy_rd_vld[1] == 0)? '{rd_data:'b0, rd_data_valid:0} :  '{rd_data:axi_spy_data[1], rd_data_valid:axi_spy_rd_vld[1]};
assign fm_mon_out.SB2.SB_MEM = (axi_spy_rd_vld[2] == 0)? '{rd_data:'b0, rd_data_valid:0} :  '{rd_data:axi_spy_data[2], rd_data_valid:axi_spy_rd_vld[2]};
assign fm_mon_out.SB3.SB_MEM = (axi_spy_rd_vld[3] == 0)? '{rd_data:'b0, rd_data_valid:0} :  '{rd_data:axi_spy_data[3], rd_data_valid:axi_spy_rd_vld[3]};
assign fm_mon_out.SB4.SB_MEM = (axi_spy_rd_vld[4] == 0)? '{rd_data:'b0, rd_data_valid:0} :  '{rd_data:axi_spy_data[4], rd_data_valid:axi_spy_rd_vld[4]};
assign fm_mon_out.SB5.SB_MEM = (axi_spy_rd_vld[5] == 0)? '{rd_data:'b0, rd_data_valid:0} :  '{rd_data:axi_spy_data[5], rd_data_valid:axi_spy_rd_vld[5]};
assign fm_mon_out.SB6.SB_MEM = (axi_spy_rd_vld[6] == 0)? '{rd_data:'b0, rd_data_valid:0} :  '{rd_data:axi_spy_data[6], rd_data_valid:axi_spy_rd_vld[6]};
assign fm_mon_out.SB7.SB_MEM = (axi_spy_rd_vld[7] == 0)? '{rd_data:'b0, rd_data_valid:0} :  '{rd_data:axi_spy_data[7], rd_data_valid:axi_spy_rd_vld[7]};
assign fm_mon_out.SB8.SB_MEM = (axi_spy_rd_vld[8] == 0)? '{rd_data:'b0, rd_data_valid:0} :  '{rd_data:axi_spy_data[8], rd_data_valid:axi_spy_rd_vld[8]};
assign fm_mon_out.SB9.SB_MEM = (axi_spy_rd_vld[9] == 0)? '{rd_data:'b0, rd_data_valid:0} :  '{rd_data:axi_spy_data[9], rd_data_valid:axi_spy_rd_vld[9]};
assign fm_mon_out.SB10.SB_MEM = (axi_spy_rd_vld[10] == 0)? '{rd_data:'b0, rd_data_valid:0} :  '{rd_data:axi_spy_data[10], rd_data_valid:axi_spy_rd_vld[10]};
assign fm_mon_out.SB11.SB_MEM = (axi_spy_rd_vld[11] == 0)? '{rd_data:'b0, rd_data_valid:0} :  '{rd_data:axi_spy_data[11], rd_data_valid:axi_spy_rd_vld[11]};
assign fm_mon_out.SB12.SB_MEM = (axi_spy_rd_vld[12] == 0)? '{rd_data:'b0, rd_data_valid:0} :  '{rd_data:axi_spy_data[12], rd_data_valid:axi_spy_rd_vld[12]};
assign fm_mon_out.SB13.SB_MEM = (axi_spy_rd_vld[13] == 0)? '{rd_data:'b0, rd_data_valid:0} :  '{rd_data:axi_spy_data[13], rd_data_valid:axi_spy_rd_vld[13]};
assign fm_mon_out.SB14.SB_MEM = (axi_spy_rd_vld[14] == 0)? '{rd_data:'b0, rd_data_valid:0} :  '{rd_data:axi_spy_data[14], rd_data_valid:axi_spy_rd_vld[14]};
assign fm_mon_out.SB15.SB_MEM = (axi_spy_rd_vld[15] == 0)? '{rd_data:'b0, rd_data_valid:0} :  '{rd_data:axi_spy_data[15], rd_data_valid:axi_spy_rd_vld[15]};
assign fm_mon_out.SB16.SB_MEM = (axi_spy_rd_vld[16] == 0)? '{rd_data:'b0, rd_data_valid:0} :  '{rd_data:axi_spy_data[16], rd_data_valid:axi_spy_rd_vld[16]};
assign fm_mon_out.SB17.SB_MEM = (axi_spy_rd_vld[17] == 0)? '{rd_data:'b0, rd_data_valid:0} :  '{rd_data:axi_spy_data[17], rd_data_valid:axi_spy_rd_vld[17]};
assign fm_mon_out.SB18.SB_MEM = (axi_spy_rd_vld[18] == 0)? '{rd_data:'b0, rd_data_valid:0} :  '{rd_data:axi_spy_data[18], rd_data_valid:axi_spy_rd_vld[18]};
assign fm_mon_out.SB19.SB_MEM = (axi_spy_rd_vld[19] == 0)? '{rd_data:'b0, rd_data_valid:0} :  '{rd_data:axi_spy_data[19], rd_data_valid:axi_spy_rd_vld[19]};
assign fm_mon_out.SB20.SB_MEM = (axi_spy_rd_vld[20] == 0)? '{rd_data:'b0, rd_data_valid:0} :  '{rd_data:axi_spy_data[20], rd_data_valid:axi_spy_rd_vld[20]};
assign fm_mon_out.SB21.SB_MEM = (axi_spy_rd_vld[21] == 0)? '{rd_data:'b0, rd_data_valid:0} :  '{rd_data:axi_spy_data[21], rd_data_valid:axi_spy_rd_vld[21]};
assign fm_mon_out.SB22.SB_MEM = (axi_spy_rd_vld[22] == 0)? '{rd_data:'b0, rd_data_valid:0} :  '{rd_data:axi_spy_data[22], rd_data_valid:axi_spy_rd_vld[22]};
assign fm_mon_out.SB23.SB_MEM = (axi_spy_rd_vld[23] == 0)? '{rd_data:'b0, rd_data_valid:0} :  '{rd_data:axi_spy_data[23], rd_data_valid:axi_spy_rd_vld[23]};
assign fm_mon_out.SB24.SB_MEM = (axi_spy_rd_vld[24] == 0)? '{rd_data:'b0, rd_data_valid:0} :  '{rd_data:axi_spy_data[24], rd_data_valid:axi_spy_rd_vld[24]};
assign fm_mon_out.SB25.SB_MEM = (axi_spy_rd_vld[25] == 0)? '{rd_data:'b0, rd_data_valid:0} :  '{rd_data:axi_spy_data[25], rd_data_valid:axi_spy_rd_vld[25]};
assign fm_mon_out.SB26.SB_MEM = (axi_spy_rd_vld[26] == 0)? '{rd_data:'b0, rd_data_valid:0} :  '{rd_data:axi_spy_data[26], rd_data_valid:axi_spy_rd_vld[26]};
assign fm_mon_out.SB27.SB_MEM = (axi_spy_rd_vld[27] == 0)? '{rd_data:'b0, rd_data_valid:0} :  '{rd_data:axi_spy_data[27], rd_data_valid:axi_spy_rd_vld[27]};
assign fm_mon_out.SB28.SB_MEM = (axi_spy_rd_vld[28] == 0)? '{rd_data:'b0, rd_data_valid:0} :  '{rd_data:axi_spy_data[28], rd_data_valid:axi_spy_rd_vld[28]};
assign fm_mon_out.SB29.SB_MEM = (axi_spy_rd_vld[29] == 0)? '{rd_data:'b0, rd_data_valid:0} :  '{rd_data:axi_spy_data[29], rd_data_valid:axi_spy_rd_vld[29]};
assign fm_mon_out.SB30.SB_MEM = (axi_spy_rd_vld[30] == 0)? '{rd_data:'b0, rd_data_valid:0} :  '{rd_data:axi_spy_data[30], rd_data_valid:axi_spy_rd_vld[30]};
assign fm_mon_out.SB31.SB_MEM = (axi_spy_rd_vld[31] == 0)? '{rd_data:'b0, rd_data_valid:0} :  '{rd_data:axi_spy_data[31], rd_data_valid:axi_spy_rd_vld[31]};
assign fm_mon_out.SB32.SB_MEM = (axi_spy_rd_vld[32] == 0)? '{rd_data:'b0, rd_data_valid:0} :  '{rd_data:axi_spy_data[32], rd_data_valid:axi_spy_rd_vld[32]};
assign fm_mon_out.SB33.SB_MEM = (axi_spy_rd_vld[33] == 0)? '{rd_data:'b0, rd_data_valid:0} :  '{rd_data:axi_spy_data[33], rd_data_valid:axi_spy_rd_vld[33]};
assign fm_mon_out.SB34.SB_MEM = (axi_spy_rd_vld[34] == 0)? '{rd_data:'b0, rd_data_valid:0} :  '{rd_data:axi_spy_data[34], rd_data_valid:axi_spy_rd_vld[34]};
assign fm_mon_out.SB35.SB_MEM = (axi_spy_rd_vld[35] == 0)? '{rd_data:'b0, rd_data_valid:0} :  '{rd_data:axi_spy_data[35], rd_data_valid:axi_spy_rd_vld[35]};
assign fm_mon_out.SB36.SB_MEM = (axi_spy_rd_vld[36] == 0)? '{rd_data:'b0, rd_data_valid:0} :  '{rd_data:axi_spy_data[36], rd_data_valid:axi_spy_rd_vld[36]};
assign fm_mon_out.SB37.SB_MEM = (axi_spy_rd_vld[37] == 0)? '{rd_data:'b0, rd_data_valid:0} :  '{rd_data:axi_spy_data[37], rd_data_valid:axi_spy_rd_vld[37]};
assign fm_mon_out.SB38.SB_MEM = (axi_spy_rd_vld[38] == 0)? '{rd_data:'b0, rd_data_valid:0} :  '{rd_data:axi_spy_data[38], rd_data_valid:axi_spy_rd_vld[38]};
assign fm_mon_out.SB39.SB_MEM = (axi_spy_rd_vld[39] == 0)? '{rd_data:'b0, rd_data_valid:0} :  '{rd_data:axi_spy_data[39], rd_data_valid:axi_spy_rd_vld[39]};
assign fm_mon_out.SB40.SB_MEM = (axi_spy_rd_vld[40] == 0)? '{rd_data:'b0, rd_data_valid:0} :  '{rd_data:axi_spy_data[40], rd_data_valid:axi_spy_rd_vld[40]};
assign fm_mon_out.SB41.SB_MEM = (axi_spy_rd_vld[41] == 0)? '{rd_data:'b0, rd_data_valid:0} :  '{rd_data:axi_spy_data[41], rd_data_valid:axi_spy_rd_vld[41]};
assign fm_mon_out.SB42.SB_MEM = (axi_spy_rd_vld[42] == 0)? '{rd_data:'b0, rd_data_valid:0} :  '{rd_data:axi_spy_data[42], rd_data_valid:axi_spy_rd_vld[42]};
assign fm_mon_out.SB43.SB_MEM = (axi_spy_rd_vld[43] == 0)? '{rd_data:'b0, rd_data_valid:0} :  '{rd_data:axi_spy_data[43], rd_data_valid:axi_spy_rd_vld[43]};
assign fm_mon_out.SB44.SB_MEM = (axi_spy_rd_vld[44] == 0)? '{rd_data:'b0, rd_data_valid:0} :  '{rd_data:axi_spy_data[44], rd_data_valid:axi_spy_rd_vld[44]};
assign fm_mon_out.SB45.SB_MEM = (axi_spy_rd_vld[45] == 0)? '{rd_data:'b0, rd_data_valid:0} :  '{rd_data:axi_spy_data[45], rd_data_valid:axi_spy_rd_vld[45]};
assign fm_mon_out.SB46.SB_MEM = (axi_spy_rd_vld[46] == 0)? '{rd_data:'b0, rd_data_valid:0} :  '{rd_data:axi_spy_data[46], rd_data_valid:axi_spy_rd_vld[46]};
assign fm_mon_out.SB47.SB_MEM = (axi_spy_rd_vld[47] == 0)? '{rd_data:'b0, rd_data_valid:0} :  '{rd_data:axi_spy_data[47], rd_data_valid:axi_spy_rd_vld[47]};
assign fm_mon_out.SB48.SB_MEM = (axi_spy_rd_vld[48] == 0)? '{rd_data:'b0, rd_data_valid:0} :  '{rd_data:axi_spy_data[48], rd_data_valid:axi_spy_rd_vld[48]};
assign fm_mon_out.SB49.SB_MEM = (axi_spy_rd_vld[49] == 0)? '{rd_data:'b0, rd_data_valid:0} :  '{rd_data:axi_spy_data[49], rd_data_valid:axi_spy_rd_vld[49]};
assign fm_mon_out.SB50.SB_MEM = (axi_spy_rd_vld[50] == 0)? '{rd_data:'b0, rd_data_valid:0} :  '{rd_data:axi_spy_data[50], rd_data_valid:axi_spy_rd_vld[50]};
assign fm_mon_out.SB51.SB_MEM = (axi_spy_rd_vld[51] == 0)? '{rd_data:'b0, rd_data_valid:0} :  '{rd_data:axi_spy_data[51], rd_data_valid:axi_spy_rd_vld[51]};
assign fm_mon_out.SB52.SB_MEM = (axi_spy_rd_vld[52] == 0)? '{rd_data:'b0, rd_data_valid:0} :  '{rd_data:axi_spy_data[52], rd_data_valid:axi_spy_rd_vld[52]};
assign fm_mon_out.SB53.SB_MEM = (axi_spy_rd_vld[53] == 0)? '{rd_data:'b0, rd_data_valid:0} :  '{rd_data:axi_spy_data[53], rd_data_valid:axi_spy_rd_vld[53]};
assign fm_mon_out.SB54.SB_MEM = (axi_spy_rd_vld[54] == 0)? '{rd_data:'b0, rd_data_valid:0} :  '{rd_data:axi_spy_data[54], rd_data_valid:axi_spy_rd_vld[54]};
assign fm_mon_out.SB55.SB_MEM = (axi_spy_rd_vld[55] == 0)? '{rd_data:'b0, rd_data_valid:0} :  '{rd_data:axi_spy_data[55], rd_data_valid:axi_spy_rd_vld[55]};
assign fm_mon_out.SB56.SB_MEM = (axi_spy_rd_vld[56] == 0)? '{rd_data:'b0, rd_data_valid:0} :  '{rd_data:axi_spy_data[56], rd_data_valid:axi_spy_rd_vld[56]};
assign fm_mon_out.SB57.SB_MEM = (axi_spy_rd_vld[57] == 0)? '{rd_data:'b0, rd_data_valid:0} :  '{rd_data:axi_spy_data[57], rd_data_valid:axi_spy_rd_vld[57]};
assign fm_mon_out.SB58.SB_MEM = (axi_spy_rd_vld[58] == 0)? '{rd_data:'b0, rd_data_valid:0} :  '{rd_data:axi_spy_data[58], rd_data_valid:axi_spy_rd_vld[58]};
assign fm_mon_out.SB59.SB_MEM = (axi_spy_rd_vld[59] == 0)? '{rd_data:'b0, rd_data_valid:0} :  '{rd_data:axi_spy_data[59], rd_data_valid:axi_spy_rd_vld[59]};
assign fm_mon_out.SB60.SB_MEM = (axi_spy_rd_vld[60] == 0)? '{rd_data:'b0, rd_data_valid:0} :  '{rd_data:axi_spy_data[60], rd_data_valid:axi_spy_rd_vld[60]};
assign fm_mon_out.SB61.SB_MEM = (axi_spy_rd_vld[61] == 0)? '{rd_data:'b0, rd_data_valid:0} :  '{rd_data:axi_spy_data[61], rd_data_valid:axi_spy_rd_vld[61]};
assign fm_mon_out.SB62.SB_MEM = (axi_spy_rd_vld[62] == 0)? '{rd_data:'b0, rd_data_valid:0} :  '{rd_data:axi_spy_data[62], rd_data_valid:axi_spy_rd_vld[62]};
assign fm_mon_out.SB63.SB_MEM = (axi_spy_rd_vld[63] == 0)? '{rd_data:'b0, rd_data_valid:0} :  '{rd_data:axi_spy_data[63], rd_data_valid:axi_spy_rd_vld[63]};
assign fm_mon_out.SB64.SB_MEM = (axi_spy_rd_vld[64] == 0)? '{rd_data:'b0, rd_data_valid:0} :  '{rd_data:axi_spy_data[64], rd_data_valid:axi_spy_rd_vld[64]};
assign fm_mon_out.SB65.SB_MEM = (axi_spy_rd_vld[65] == 0)? '{rd_data:'b0, rd_data_valid:0} :  '{rd_data:axi_spy_data[65], rd_data_valid:axi_spy_rd_vld[65]};
assign fm_mon_out.SB66.SB_MEM = (axi_spy_rd_vld[66] == 0)? '{rd_data:'b0, rd_data_valid:0} :  '{rd_data:axi_spy_data[66], rd_data_valid:axi_spy_rd_vld[66]};
assign fm_mon_out.SB67.SB_MEM = (axi_spy_rd_vld[67] == 0)? '{rd_data:'b0, rd_data_valid:0} :  '{rd_data:axi_spy_data[67], rd_data_valid:axi_spy_rd_vld[67]};
assign fm_mon_out.SB68.SB_MEM = (axi_spy_rd_vld[68] == 0)? '{rd_data:'b0, rd_data_valid:0} :  '{rd_data:axi_spy_data[68], rd_data_valid:axi_spy_rd_vld[68]};
assign fm_mon_out.SB69.SB_MEM = (axi_spy_rd_vld[69] == 0)? '{rd_data:'b0, rd_data_valid:0} :  '{rd_data:axi_spy_data[69], rd_data_valid:axi_spy_rd_vld[69]};
assign fm_mon_out.SB70.SB_MEM = (axi_spy_rd_vld[70] == 0)? '{rd_data:'b0, rd_data_valid:0} :  '{rd_data:axi_spy_data[70], rd_data_valid:axi_spy_rd_vld[70]};
assign fm_mon_out.SB71.SB_MEM = (axi_spy_rd_vld[71] == 0)? '{rd_data:'b0, rd_data_valid:0} :  '{rd_data:axi_spy_data[71], rd_data_valid:axi_spy_rd_vld[71]};
assign fm_mon_out.SB72.SB_MEM = (axi_spy_rd_vld[72] == 0)? '{rd_data:'b0, rd_data_valid:0} :  '{rd_data:axi_spy_data[72], rd_data_valid:axi_spy_rd_vld[72]};
assign fm_mon_out.SB73.SB_MEM = (axi_spy_rd_vld[73] == 0)? '{rd_data:'b0, rd_data_valid:0} :  '{rd_data:axi_spy_data[73], rd_data_valid:axi_spy_rd_vld[73]};
assign fm_mon_out.SB74.SB_MEM = (axi_spy_rd_vld[74] == 0)? '{rd_data:'b0, rd_data_valid:0} :  '{rd_data:axi_spy_data[74], rd_data_valid:axi_spy_rd_vld[74]};
assign fm_mon_out.SB75.SB_MEM = (axi_spy_rd_vld[75] == 0)? '{rd_data:'b0, rd_data_valid:0} :  '{rd_data:axi_spy_data[75], rd_data_valid:axi_spy_rd_vld[75]};
assign fm_mon_out.SB76.SB_MEM = (axi_spy_rd_vld[76] == 0)? '{rd_data:'b0, rd_data_valid:0} :  '{rd_data:axi_spy_data[76], rd_data_valid:axi_spy_rd_vld[76]};
assign fm_mon_out.SB77.SB_MEM = (axi_spy_rd_vld[77] == 0)? '{rd_data:'b0, rd_data_valid:0} :  '{rd_data:axi_spy_data[77], rd_data_valid:axi_spy_rd_vld[77]};
assign fm_mon_out.SB78.SB_MEM = (axi_spy_rd_vld[78] == 0)? '{rd_data:'b0, rd_data_valid:0} :  '{rd_data:axi_spy_data[78], rd_data_valid:axi_spy_rd_vld[78]};
assign fm_mon_out.SB79.SB_MEM = (axi_spy_rd_vld[79] == 0)? '{rd_data:'b0, rd_data_valid:0} :  '{rd_data:axi_spy_data[79], rd_data_valid:axi_spy_rd_vld[79]};
assign fm_mon_out.SB80.SB_MEM = (axi_spy_rd_vld[80] == 0)? '{rd_data:'b0, rd_data_valid:0} :  '{rd_data:axi_spy_data[80], rd_data_valid:axi_spy_rd_vld[80]};
assign fm_mon_out.SB81.SB_MEM = (axi_spy_rd_vld[81] == 0)? '{rd_data:'b0, rd_data_valid:0} :  '{rd_data:axi_spy_data[81], rd_data_valid:axi_spy_rd_vld[81]};
assign fm_mon_out.SB82.SB_MEM = (axi_spy_rd_vld[82] == 0)? '{rd_data:'b0, rd_data_valid:0} :  '{rd_data:axi_spy_data[82], rd_data_valid:axi_spy_rd_vld[82]};
assign fm_mon_out.SB83.SB_MEM = (axi_spy_rd_vld[83] == 0)? '{rd_data:'b0, rd_data_valid:0} :  '{rd_data:axi_spy_data[83], rd_data_valid:axi_spy_rd_vld[83]};
assign fm_mon_out.SB84.SB_MEM = (axi_spy_rd_vld[84] == 0)? '{rd_data:'b0, rd_data_valid:0} :  '{rd_data:axi_spy_data[84], rd_data_valid:axi_spy_rd_vld[84]};
assign fm_mon_out.SB85.SB_MEM = (axi_spy_rd_vld[85] == 0)? '{rd_data:'b0, rd_data_valid:0} :  '{rd_data:axi_spy_data[85], rd_data_valid:axi_spy_rd_vld[85]};
assign fm_mon_out.SB86.SB_MEM = (axi_spy_rd_vld[86] == 0)? '{rd_data:'b0, rd_data_valid:0} :  '{rd_data:axi_spy_data[86], rd_data_valid:axi_spy_rd_vld[86]};
assign fm_mon_out.SB87.SB_MEM = (axi_spy_rd_vld[87] == 0)? '{rd_data:'b0, rd_data_valid:0} :  '{rd_data:axi_spy_data[87], rd_data_valid:axi_spy_rd_vld[87]};
assign fm_mon_out.SB88.SB_MEM = (axi_spy_rd_vld[88] == 0)? '{rd_data:'b0, rd_data_valid:0} :  '{rd_data:axi_spy_data[88], rd_data_valid:axi_spy_rd_vld[88]};
assign fm_mon_out.SB89.SB_MEM = (axi_spy_rd_vld[89] == 0)? '{rd_data:'b0, rd_data_valid:0} :  '{rd_data:axi_spy_data[89], rd_data_valid:axi_spy_rd_vld[89]};
assign fm_mon_out.SB90.SB_MEM = (axi_spy_rd_vld[90] == 0)? '{rd_data:'b0, rd_data_valid:0} :  '{rd_data:axi_spy_data[90], rd_data_valid:axi_spy_rd_vld[90]};
assign fm_mon_out.SB91.SB_MEM = (axi_spy_rd_vld[91] == 0)? '{rd_data:'b0, rd_data_valid:0} :  '{rd_data:axi_spy_data[91], rd_data_valid:axi_spy_rd_vld[91]};
assign fm_mon_out.SB92.SB_MEM = (axi_spy_rd_vld[92] == 0)? '{rd_data:'b0, rd_data_valid:0} :  '{rd_data:axi_spy_data[92], rd_data_valid:axi_spy_rd_vld[92]};
assign fm_mon_out.SB93.SB_MEM = (axi_spy_rd_vld[93] == 0)? '{rd_data:'b0, rd_data_valid:0} :  '{rd_data:axi_spy_data[93], rd_data_valid:axi_spy_rd_vld[93]};
assign fm_mon_out.SB94.SB_MEM = (axi_spy_rd_vld[94] == 0)? '{rd_data:'b0, rd_data_valid:0} :  '{rd_data:axi_spy_data[94], rd_data_valid:axi_spy_rd_vld[94]};
assign fm_mon_out.SB95.SB_MEM = (axi_spy_rd_vld[95] == 0)? '{rd_data:'b0, rd_data_valid:0} :  '{rd_data:axi_spy_data[95], rd_data_valid:axi_spy_rd_vld[95]};
assign fm_mon_out.SB96.SB_MEM = (axi_spy_rd_vld[96] == 0)? '{rd_data:'b0, rd_data_valid:0} :  '{rd_data:axi_spy_data[96], rd_data_valid:axi_spy_rd_vld[96]};
assign fm_mon_out.SB97.SB_MEM = (axi_spy_rd_vld[97] == 0)? '{rd_data:'b0, rd_data_valid:0} :  '{rd_data:axi_spy_data[97], rd_data_valid:axi_spy_rd_vld[97]};
assign fm_mon_out.SB98.SB_MEM = (axi_spy_rd_vld[98] == 0)? '{rd_data:'b0, rd_data_valid:0} :  '{rd_data:axi_spy_data[98], rd_data_valid:axi_spy_rd_vld[98]};
assign fm_mon_out.SB99.SB_MEM = (axi_spy_rd_vld[99] == 0)? '{rd_data:'b0, rd_data_valid:0} :  '{rd_data:axi_spy_data[99], rd_data_valid:axi_spy_rd_vld[99]};
assign fm_mon_out.SB100.SB_MEM = (axi_spy_rd_vld[100] == 0)? '{rd_data:'b0, rd_data_valid:0} :  '{rd_data:axi_spy_data[100], rd_data_valid:axi_spy_rd_vld[100]};
assign fm_mon_out.SB101.SB_MEM = (axi_spy_rd_vld[101] == 0)? '{rd_data:'b0, rd_data_valid:0} :  '{rd_data:axi_spy_data[101], rd_data_valid:axi_spy_rd_vld[101]};
assign fm_mon_out.SB102.SB_MEM = (axi_spy_rd_vld[102] == 0)? '{rd_data:'b0, rd_data_valid:0} :  '{rd_data:axi_spy_data[102], rd_data_valid:axi_spy_rd_vld[102]};
assign fm_mon_out.SB103.SB_MEM = (axi_spy_rd_vld[103] == 0)? '{rd_data:'b0, rd_data_valid:0} :  '{rd_data:axi_spy_data[103], rd_data_valid:axi_spy_rd_vld[103]};
assign fm_mon_out.SB104.SB_MEM = (axi_spy_rd_vld[104] == 0)? '{rd_data:'b0, rd_data_valid:0} :  '{rd_data:axi_spy_data[104], rd_data_valid:axi_spy_rd_vld[104]};
assign fm_mon_out.SB105.SB_MEM = (axi_spy_rd_vld[105] == 0)? '{rd_data:'b0, rd_data_valid:0} :  '{rd_data:axi_spy_data[105], rd_data_valid:axi_spy_rd_vld[105]};
assign fm_mon_out.SB106.SB_MEM = (axi_spy_rd_vld[106] == 0)? '{rd_data:'b0, rd_data_valid:0} :  '{rd_data:axi_spy_data[106], rd_data_valid:axi_spy_rd_vld[106]};
assign fm_mon_out.SB107.SB_MEM = (axi_spy_rd_vld[107] == 0)? '{rd_data:'b0, rd_data_valid:0} :  '{rd_data:axi_spy_data[107], rd_data_valid:axi_spy_rd_vld[107]};
assign fm_mon_out.SB108.SB_MEM = (axi_spy_rd_vld[108] == 0)? '{rd_data:'b0, rd_data_valid:0} :  '{rd_data:axi_spy_data[108], rd_data_valid:axi_spy_rd_vld[108]};
assign fm_mon_out.SB109.SB_MEM = (axi_spy_rd_vld[109] == 0)? '{rd_data:'b0, rd_data_valid:0} :  '{rd_data:axi_spy_data[109], rd_data_valid:axi_spy_rd_vld[109]};
assign fm_mon_out.SB110.SB_MEM = (axi_spy_rd_vld[110] == 0)? '{rd_data:'b0, rd_data_valid:0} :  '{rd_data:axi_spy_data[110], rd_data_valid:axi_spy_rd_vld[110]};
assign fm_mon_out.SB111.SB_MEM = (axi_spy_rd_vld[111] == 0)? '{rd_data:'b0, rd_data_valid:0} :  '{rd_data:axi_spy_data[111], rd_data_valid:axi_spy_rd_vld[111]};
assign fm_mon_out.SB112.SB_MEM = (axi_spy_rd_vld[112] == 0)? '{rd_data:'b0, rd_data_valid:0} :  '{rd_data:axi_spy_data[112], rd_data_valid:axi_spy_rd_vld[112]};
assign fm_mon_out.SB113.SB_MEM = (axi_spy_rd_vld[113] == 0)? '{rd_data:'b0, rd_data_valid:0} :  '{rd_data:axi_spy_data[113], rd_data_valid:axi_spy_rd_vld[113]};

assign  axi_sb_addr       = (init_spy_mem_internal)? axi_sb_init_addr : {
	fm_ctrl_in.SB0.SB_MEM.address,
	fm_ctrl_in.SB1.SB_MEM.address,
	fm_ctrl_in.SB2.SB_MEM.address,
	fm_ctrl_in.SB3.SB_MEM.address,
	fm_ctrl_in.SB4.SB_MEM.address,
	fm_ctrl_in.SB5.SB_MEM.address,
	fm_ctrl_in.SB6.SB_MEM.address,
	fm_ctrl_in.SB7.SB_MEM.address,
	fm_ctrl_in.SB8.SB_MEM.address,
	fm_ctrl_in.SB9.SB_MEM.address,
	fm_ctrl_in.SB10.SB_MEM.address,
	fm_ctrl_in.SB11.SB_MEM.address,
	fm_ctrl_in.SB12.SB_MEM.address,
	fm_ctrl_in.SB13.SB_MEM.address,
	fm_ctrl_in.SB14.SB_MEM.address,
	fm_ctrl_in.SB15.SB_MEM.address,
	fm_ctrl_in.SB16.SB_MEM.address,
	fm_ctrl_in.SB17.SB_MEM.address,
	fm_ctrl_in.SB18.SB_MEM.address,
	fm_ctrl_in.SB19.SB_MEM.address,
	fm_ctrl_in.SB20.SB_MEM.address,
	fm_ctrl_in.SB21.SB_MEM.address,
	fm_ctrl_in.SB22.SB_MEM.address,
	fm_ctrl_in.SB23.SB_MEM.address,
	fm_ctrl_in.SB24.SB_MEM.address,
	fm_ctrl_in.SB25.SB_MEM.address,
	fm_ctrl_in.SB26.SB_MEM.address,
	fm_ctrl_in.SB27.SB_MEM.address,
	fm_ctrl_in.SB28.SB_MEM.address,
	fm_ctrl_in.SB29.SB_MEM.address,
	fm_ctrl_in.SB30.SB_MEM.address,
	fm_ctrl_in.SB31.SB_MEM.address,
	fm_ctrl_in.SB32.SB_MEM.address,
	fm_ctrl_in.SB33.SB_MEM.address,
	fm_ctrl_in.SB34.SB_MEM.address,
	fm_ctrl_in.SB35.SB_MEM.address,
	fm_ctrl_in.SB36.SB_MEM.address,
	fm_ctrl_in.SB37.SB_MEM.address,
	fm_ctrl_in.SB38.SB_MEM.address,
	fm_ctrl_in.SB39.SB_MEM.address,
	fm_ctrl_in.SB40.SB_MEM.address,
	fm_ctrl_in.SB41.SB_MEM.address,
	fm_ctrl_in.SB42.SB_MEM.address,
	fm_ctrl_in.SB43.SB_MEM.address,
	fm_ctrl_in.SB44.SB_MEM.address,
	fm_ctrl_in.SB45.SB_MEM.address,
	fm_ctrl_in.SB46.SB_MEM.address,
	fm_ctrl_in.SB47.SB_MEM.address,
	fm_ctrl_in.SB48.SB_MEM.address,
	fm_ctrl_in.SB49.SB_MEM.address,
	fm_ctrl_in.SB50.SB_MEM.address,
	fm_ctrl_in.SB51.SB_MEM.address,
	fm_ctrl_in.SB52.SB_MEM.address,
	fm_ctrl_in.SB53.SB_MEM.address,
	fm_ctrl_in.SB54.SB_MEM.address,
	fm_ctrl_in.SB55.SB_MEM.address,
	fm_ctrl_in.SB56.SB_MEM.address,
	fm_ctrl_in.SB57.SB_MEM.address,
	fm_ctrl_in.SB58.SB_MEM.address,
	fm_ctrl_in.SB59.SB_MEM.address,
	fm_ctrl_in.SB60.SB_MEM.address,
	fm_ctrl_in.SB61.SB_MEM.address,
	fm_ctrl_in.SB62.SB_MEM.address,
	fm_ctrl_in.SB63.SB_MEM.address,
	fm_ctrl_in.SB64.SB_MEM.address,
	fm_ctrl_in.SB65.SB_MEM.address,
	fm_ctrl_in.SB66.SB_MEM.address,
	fm_ctrl_in.SB67.SB_MEM.address,
	fm_ctrl_in.SB68.SB_MEM.address,
	fm_ctrl_in.SB69.SB_MEM.address,
	fm_ctrl_in.SB70.SB_MEM.address,
	fm_ctrl_in.SB71.SB_MEM.address,
	fm_ctrl_in.SB72.SB_MEM.address,
	fm_ctrl_in.SB73.SB_MEM.address,
	fm_ctrl_in.SB74.SB_MEM.address,
	fm_ctrl_in.SB75.SB_MEM.address,
	fm_ctrl_in.SB76.SB_MEM.address,
	fm_ctrl_in.SB77.SB_MEM.address,
	fm_ctrl_in.SB78.SB_MEM.address,
	fm_ctrl_in.SB79.SB_MEM.address,
	fm_ctrl_in.SB80.SB_MEM.address,
	fm_ctrl_in.SB81.SB_MEM.address,
	fm_ctrl_in.SB82.SB_MEM.address,
	fm_ctrl_in.SB83.SB_MEM.address,
	fm_ctrl_in.SB84.SB_MEM.address,
	fm_ctrl_in.SB85.SB_MEM.address,
	fm_ctrl_in.SB86.SB_MEM.address,
	fm_ctrl_in.SB87.SB_MEM.address,
	fm_ctrl_in.SB88.SB_MEM.address,
	fm_ctrl_in.SB89.SB_MEM.address,
	fm_ctrl_in.SB90.SB_MEM.address,
	fm_ctrl_in.SB91.SB_MEM.address,
	fm_ctrl_in.SB92.SB_MEM.address,
	fm_ctrl_in.SB93.SB_MEM.address,
	fm_ctrl_in.SB94.SB_MEM.address,
	fm_ctrl_in.SB95.SB_MEM.address,
	fm_ctrl_in.SB96.SB_MEM.address,
	fm_ctrl_in.SB97.SB_MEM.address,
	fm_ctrl_in.SB98.SB_MEM.address,
	fm_ctrl_in.SB99.SB_MEM.address,
	fm_ctrl_in.SB100.SB_MEM.address,
	fm_ctrl_in.SB101.SB_MEM.address,
	fm_ctrl_in.SB102.SB_MEM.address,
	fm_ctrl_in.SB103.SB_MEM.address,
	fm_ctrl_in.SB104.SB_MEM.address,
	fm_ctrl_in.SB105.SB_MEM.address,
	fm_ctrl_in.SB106.SB_MEM.address,
	fm_ctrl_in.SB107.SB_MEM.address,
	fm_ctrl_in.SB108.SB_MEM.address,
	fm_ctrl_in.SB109.SB_MEM.address,
	fm_ctrl_in.SB110.SB_MEM.address,
	fm_ctrl_in.SB111.SB_MEM.address,
	fm_ctrl_in.SB112.SB_MEM.address,
	fm_ctrl_in.SB113.SB_MEM.address
		};

assign  axi_sb_enable       =  {
	fm_ctrl_in.SB0.SB_MEM.enable,
	fm_ctrl_in.SB1.SB_MEM.enable,
	fm_ctrl_in.SB2.SB_MEM.enable,
	fm_ctrl_in.SB3.SB_MEM.enable,
	fm_ctrl_in.SB4.SB_MEM.enable,
	fm_ctrl_in.SB5.SB_MEM.enable,
	fm_ctrl_in.SB6.SB_MEM.enable,
	fm_ctrl_in.SB7.SB_MEM.enable,
	fm_ctrl_in.SB8.SB_MEM.enable,
	fm_ctrl_in.SB9.SB_MEM.enable,
	fm_ctrl_in.SB10.SB_MEM.enable,
	fm_ctrl_in.SB11.SB_MEM.enable,
	fm_ctrl_in.SB12.SB_MEM.enable,
	fm_ctrl_in.SB13.SB_MEM.enable,
	fm_ctrl_in.SB14.SB_MEM.enable,
	fm_ctrl_in.SB15.SB_MEM.enable,
	fm_ctrl_in.SB16.SB_MEM.enable,
	fm_ctrl_in.SB17.SB_MEM.enable,
	fm_ctrl_in.SB18.SB_MEM.enable,
	fm_ctrl_in.SB19.SB_MEM.enable,
	fm_ctrl_in.SB20.SB_MEM.enable,
	fm_ctrl_in.SB21.SB_MEM.enable,
	fm_ctrl_in.SB22.SB_MEM.enable,
	fm_ctrl_in.SB23.SB_MEM.enable,
	fm_ctrl_in.SB24.SB_MEM.enable,
	fm_ctrl_in.SB25.SB_MEM.enable,
	fm_ctrl_in.SB26.SB_MEM.enable,
	fm_ctrl_in.SB27.SB_MEM.enable,
	fm_ctrl_in.SB28.SB_MEM.enable,
	fm_ctrl_in.SB29.SB_MEM.enable,
	fm_ctrl_in.SB30.SB_MEM.enable,
	fm_ctrl_in.SB31.SB_MEM.enable,
	fm_ctrl_in.SB32.SB_MEM.enable,
	fm_ctrl_in.SB33.SB_MEM.enable,
	fm_ctrl_in.SB34.SB_MEM.enable,
	fm_ctrl_in.SB35.SB_MEM.enable,
	fm_ctrl_in.SB36.SB_MEM.enable,
	fm_ctrl_in.SB37.SB_MEM.enable,
	fm_ctrl_in.SB38.SB_MEM.enable,
	fm_ctrl_in.SB39.SB_MEM.enable,
	fm_ctrl_in.SB40.SB_MEM.enable,
	fm_ctrl_in.SB41.SB_MEM.enable,
	fm_ctrl_in.SB42.SB_MEM.enable,
	fm_ctrl_in.SB43.SB_MEM.enable,
	fm_ctrl_in.SB44.SB_MEM.enable,
	fm_ctrl_in.SB45.SB_MEM.enable,
	fm_ctrl_in.SB46.SB_MEM.enable,
	fm_ctrl_in.SB47.SB_MEM.enable,
	fm_ctrl_in.SB48.SB_MEM.enable,
	fm_ctrl_in.SB49.SB_MEM.enable,
	fm_ctrl_in.SB50.SB_MEM.enable,
	fm_ctrl_in.SB51.SB_MEM.enable,
	fm_ctrl_in.SB52.SB_MEM.enable,
	fm_ctrl_in.SB53.SB_MEM.enable,
	fm_ctrl_in.SB54.SB_MEM.enable,
	fm_ctrl_in.SB55.SB_MEM.enable,
	fm_ctrl_in.SB56.SB_MEM.enable,
	fm_ctrl_in.SB57.SB_MEM.enable,
	fm_ctrl_in.SB58.SB_MEM.enable,
	fm_ctrl_in.SB59.SB_MEM.enable,
	fm_ctrl_in.SB60.SB_MEM.enable,
	fm_ctrl_in.SB61.SB_MEM.enable,
	fm_ctrl_in.SB62.SB_MEM.enable,
	fm_ctrl_in.SB63.SB_MEM.enable,
	fm_ctrl_in.SB64.SB_MEM.enable,
	fm_ctrl_in.SB65.SB_MEM.enable,
	fm_ctrl_in.SB66.SB_MEM.enable,
	fm_ctrl_in.SB67.SB_MEM.enable,
	fm_ctrl_in.SB68.SB_MEM.enable,
	fm_ctrl_in.SB69.SB_MEM.enable,
	fm_ctrl_in.SB70.SB_MEM.enable,
	fm_ctrl_in.SB71.SB_MEM.enable,
	fm_ctrl_in.SB72.SB_MEM.enable,
	fm_ctrl_in.SB73.SB_MEM.enable,
	fm_ctrl_in.SB74.SB_MEM.enable,
	fm_ctrl_in.SB75.SB_MEM.enable,
	fm_ctrl_in.SB76.SB_MEM.enable,
	fm_ctrl_in.SB77.SB_MEM.enable,
	fm_ctrl_in.SB78.SB_MEM.enable,
	fm_ctrl_in.SB79.SB_MEM.enable,
	fm_ctrl_in.SB80.SB_MEM.enable,
	fm_ctrl_in.SB81.SB_MEM.enable,
	fm_ctrl_in.SB82.SB_MEM.enable,
	fm_ctrl_in.SB83.SB_MEM.enable,
	fm_ctrl_in.SB84.SB_MEM.enable,
	fm_ctrl_in.SB85.SB_MEM.enable,
	fm_ctrl_in.SB86.SB_MEM.enable,
	fm_ctrl_in.SB87.SB_MEM.enable,
	fm_ctrl_in.SB88.SB_MEM.enable,
	fm_ctrl_in.SB89.SB_MEM.enable,
	fm_ctrl_in.SB90.SB_MEM.enable,
	fm_ctrl_in.SB91.SB_MEM.enable,
	fm_ctrl_in.SB92.SB_MEM.enable,
	fm_ctrl_in.SB93.SB_MEM.enable,
	fm_ctrl_in.SB94.SB_MEM.enable,
	fm_ctrl_in.SB95.SB_MEM.enable,
	fm_ctrl_in.SB96.SB_MEM.enable,
	fm_ctrl_in.SB97.SB_MEM.enable,
	fm_ctrl_in.SB98.SB_MEM.enable,
	fm_ctrl_in.SB99.SB_MEM.enable,
	fm_ctrl_in.SB100.SB_MEM.enable,
	fm_ctrl_in.SB101.SB_MEM.enable,
	fm_ctrl_in.SB102.SB_MEM.enable,
	fm_ctrl_in.SB103.SB_MEM.enable,
	fm_ctrl_in.SB104.SB_MEM.enable,
	fm_ctrl_in.SB105.SB_MEM.enable,
	fm_ctrl_in.SB106.SB_MEM.enable,
	fm_ctrl_in.SB107.SB_MEM.enable,
	fm_ctrl_in.SB108.SB_MEM.enable,
	fm_ctrl_in.SB109.SB_MEM.enable,
	fm_ctrl_in.SB110.SB_MEM.enable,
	fm_ctrl_in.SB111.SB_MEM.enable,
	fm_ctrl_in.SB112.SB_MEM.enable,
	fm_ctrl_in.SB113.SB_MEM.enable
		};

assign  axi_sb_wr_enable       = (init_spy_mem_internal == 1)? '1: { 
	fm_ctrl_in.SB0.SB_MEM.wr_enable,
	fm_ctrl_in.SB1.SB_MEM.wr_enable,
	fm_ctrl_in.SB2.SB_MEM.wr_enable,
	fm_ctrl_in.SB3.SB_MEM.wr_enable,
	fm_ctrl_in.SB4.SB_MEM.wr_enable,
	fm_ctrl_in.SB5.SB_MEM.wr_enable,
	fm_ctrl_in.SB6.SB_MEM.wr_enable,
	fm_ctrl_in.SB7.SB_MEM.wr_enable,
	fm_ctrl_in.SB8.SB_MEM.wr_enable,
	fm_ctrl_in.SB9.SB_MEM.wr_enable,
	fm_ctrl_in.SB10.SB_MEM.wr_enable,
	fm_ctrl_in.SB11.SB_MEM.wr_enable,
	fm_ctrl_in.SB12.SB_MEM.wr_enable,
	fm_ctrl_in.SB13.SB_MEM.wr_enable,
	fm_ctrl_in.SB14.SB_MEM.wr_enable,
	fm_ctrl_in.SB15.SB_MEM.wr_enable,
	fm_ctrl_in.SB16.SB_MEM.wr_enable,
	fm_ctrl_in.SB17.SB_MEM.wr_enable,
	fm_ctrl_in.SB18.SB_MEM.wr_enable,
	fm_ctrl_in.SB19.SB_MEM.wr_enable,
	fm_ctrl_in.SB20.SB_MEM.wr_enable,
	fm_ctrl_in.SB21.SB_MEM.wr_enable,
	fm_ctrl_in.SB22.SB_MEM.wr_enable,
	fm_ctrl_in.SB23.SB_MEM.wr_enable,
	fm_ctrl_in.SB24.SB_MEM.wr_enable,
	fm_ctrl_in.SB25.SB_MEM.wr_enable,
	fm_ctrl_in.SB26.SB_MEM.wr_enable,
	fm_ctrl_in.SB27.SB_MEM.wr_enable,
	fm_ctrl_in.SB28.SB_MEM.wr_enable,
	fm_ctrl_in.SB29.SB_MEM.wr_enable,
	fm_ctrl_in.SB30.SB_MEM.wr_enable,
	fm_ctrl_in.SB31.SB_MEM.wr_enable,
	fm_ctrl_in.SB32.SB_MEM.wr_enable,
	fm_ctrl_in.SB33.SB_MEM.wr_enable,
	fm_ctrl_in.SB34.SB_MEM.wr_enable,
	fm_ctrl_in.SB35.SB_MEM.wr_enable,
	fm_ctrl_in.SB36.SB_MEM.wr_enable,
	fm_ctrl_in.SB37.SB_MEM.wr_enable,
	fm_ctrl_in.SB38.SB_MEM.wr_enable,
	fm_ctrl_in.SB39.SB_MEM.wr_enable,
	fm_ctrl_in.SB40.SB_MEM.wr_enable,
	fm_ctrl_in.SB41.SB_MEM.wr_enable,
	fm_ctrl_in.SB42.SB_MEM.wr_enable,
	fm_ctrl_in.SB43.SB_MEM.wr_enable,
	fm_ctrl_in.SB44.SB_MEM.wr_enable,
	fm_ctrl_in.SB45.SB_MEM.wr_enable,
	fm_ctrl_in.SB46.SB_MEM.wr_enable,
	fm_ctrl_in.SB47.SB_MEM.wr_enable,
	fm_ctrl_in.SB48.SB_MEM.wr_enable,
	fm_ctrl_in.SB49.SB_MEM.wr_enable,
	fm_ctrl_in.SB50.SB_MEM.wr_enable,
	fm_ctrl_in.SB51.SB_MEM.wr_enable,
	fm_ctrl_in.SB52.SB_MEM.wr_enable,
	fm_ctrl_in.SB53.SB_MEM.wr_enable,
	fm_ctrl_in.SB54.SB_MEM.wr_enable,
	fm_ctrl_in.SB55.SB_MEM.wr_enable,
	fm_ctrl_in.SB56.SB_MEM.wr_enable,
	fm_ctrl_in.SB57.SB_MEM.wr_enable,
	fm_ctrl_in.SB58.SB_MEM.wr_enable,
	fm_ctrl_in.SB59.SB_MEM.wr_enable,
	fm_ctrl_in.SB60.SB_MEM.wr_enable,
	fm_ctrl_in.SB61.SB_MEM.wr_enable,
	fm_ctrl_in.SB62.SB_MEM.wr_enable,
	fm_ctrl_in.SB63.SB_MEM.wr_enable,
	fm_ctrl_in.SB64.SB_MEM.wr_enable,
	fm_ctrl_in.SB65.SB_MEM.wr_enable,
	fm_ctrl_in.SB66.SB_MEM.wr_enable,
	fm_ctrl_in.SB67.SB_MEM.wr_enable,
	fm_ctrl_in.SB68.SB_MEM.wr_enable,
	fm_ctrl_in.SB69.SB_MEM.wr_enable,
	fm_ctrl_in.SB70.SB_MEM.wr_enable,
	fm_ctrl_in.SB71.SB_MEM.wr_enable,
	fm_ctrl_in.SB72.SB_MEM.wr_enable,
	fm_ctrl_in.SB73.SB_MEM.wr_enable,
	fm_ctrl_in.SB74.SB_MEM.wr_enable,
	fm_ctrl_in.SB75.SB_MEM.wr_enable,
	fm_ctrl_in.SB76.SB_MEM.wr_enable,
	fm_ctrl_in.SB77.SB_MEM.wr_enable,
	fm_ctrl_in.SB78.SB_MEM.wr_enable,
	fm_ctrl_in.SB79.SB_MEM.wr_enable,
	fm_ctrl_in.SB80.SB_MEM.wr_enable,
	fm_ctrl_in.SB81.SB_MEM.wr_enable,
	fm_ctrl_in.SB82.SB_MEM.wr_enable,
	fm_ctrl_in.SB83.SB_MEM.wr_enable,
	fm_ctrl_in.SB84.SB_MEM.wr_enable,
	fm_ctrl_in.SB85.SB_MEM.wr_enable,
	fm_ctrl_in.SB86.SB_MEM.wr_enable,
	fm_ctrl_in.SB87.SB_MEM.wr_enable,
	fm_ctrl_in.SB88.SB_MEM.wr_enable,
	fm_ctrl_in.SB89.SB_MEM.wr_enable,
	fm_ctrl_in.SB90.SB_MEM.wr_enable,
	fm_ctrl_in.SB91.SB_MEM.wr_enable,
	fm_ctrl_in.SB92.SB_MEM.wr_enable,
	fm_ctrl_in.SB93.SB_MEM.wr_enable,
	fm_ctrl_in.SB94.SB_MEM.wr_enable,
	fm_ctrl_in.SB95.SB_MEM.wr_enable,
	fm_ctrl_in.SB96.SB_MEM.wr_enable,
	fm_ctrl_in.SB97.SB_MEM.wr_enable,
	fm_ctrl_in.SB98.SB_MEM.wr_enable,
	fm_ctrl_in.SB99.SB_MEM.wr_enable,
	fm_ctrl_in.SB100.SB_MEM.wr_enable,
	fm_ctrl_in.SB101.SB_MEM.wr_enable,
	fm_ctrl_in.SB102.SB_MEM.wr_enable,
	fm_ctrl_in.SB103.SB_MEM.wr_enable,
	fm_ctrl_in.SB104.SB_MEM.wr_enable,
	fm_ctrl_in.SB105.SB_MEM.wr_enable,
	fm_ctrl_in.SB106.SB_MEM.wr_enable,
	fm_ctrl_in.SB107.SB_MEM.wr_enable,
	fm_ctrl_in.SB108.SB_MEM.wr_enable,
	fm_ctrl_in.SB109.SB_MEM.wr_enable,
	fm_ctrl_in.SB110.SB_MEM.wr_enable,
	fm_ctrl_in.SB111.SB_MEM.wr_enable,
	fm_ctrl_in.SB112.SB_MEM.wr_enable,
	fm_ctrl_in.SB113.SB_MEM.wr_enable
		};

assign  axi_sb_wr_data       = (init_spy_mem_internal == 1)? axi_sb_init_wr_data: { 
	fm_ctrl_in.SB0.SB_MEM.wr_data,
	fm_ctrl_in.SB1.SB_MEM.wr_data,
	fm_ctrl_in.SB2.SB_MEM.wr_data,
	fm_ctrl_in.SB3.SB_MEM.wr_data,
	fm_ctrl_in.SB4.SB_MEM.wr_data,
	fm_ctrl_in.SB5.SB_MEM.wr_data,
	fm_ctrl_in.SB6.SB_MEM.wr_data,
	fm_ctrl_in.SB7.SB_MEM.wr_data,
	fm_ctrl_in.SB8.SB_MEM.wr_data,
	fm_ctrl_in.SB9.SB_MEM.wr_data,
	fm_ctrl_in.SB10.SB_MEM.wr_data,
	fm_ctrl_in.SB11.SB_MEM.wr_data,
	fm_ctrl_in.SB12.SB_MEM.wr_data,
	fm_ctrl_in.SB13.SB_MEM.wr_data,
	fm_ctrl_in.SB14.SB_MEM.wr_data,
	fm_ctrl_in.SB15.SB_MEM.wr_data,
	fm_ctrl_in.SB16.SB_MEM.wr_data,
	fm_ctrl_in.SB17.SB_MEM.wr_data,
	fm_ctrl_in.SB18.SB_MEM.wr_data,
	fm_ctrl_in.SB19.SB_MEM.wr_data,
	fm_ctrl_in.SB20.SB_MEM.wr_data,
	fm_ctrl_in.SB21.SB_MEM.wr_data,
	fm_ctrl_in.SB22.SB_MEM.wr_data,
	fm_ctrl_in.SB23.SB_MEM.wr_data,
	fm_ctrl_in.SB24.SB_MEM.wr_data,
	fm_ctrl_in.SB25.SB_MEM.wr_data,
	fm_ctrl_in.SB26.SB_MEM.wr_data,
	fm_ctrl_in.SB27.SB_MEM.wr_data,
	fm_ctrl_in.SB28.SB_MEM.wr_data,
	fm_ctrl_in.SB29.SB_MEM.wr_data,
	fm_ctrl_in.SB30.SB_MEM.wr_data,
	fm_ctrl_in.SB31.SB_MEM.wr_data,
	fm_ctrl_in.SB32.SB_MEM.wr_data,
	fm_ctrl_in.SB33.SB_MEM.wr_data,
	fm_ctrl_in.SB34.SB_MEM.wr_data,
	fm_ctrl_in.SB35.SB_MEM.wr_data,
	fm_ctrl_in.SB36.SB_MEM.wr_data,
	fm_ctrl_in.SB37.SB_MEM.wr_data,
	fm_ctrl_in.SB38.SB_MEM.wr_data,
	fm_ctrl_in.SB39.SB_MEM.wr_data,
	fm_ctrl_in.SB40.SB_MEM.wr_data,
	fm_ctrl_in.SB41.SB_MEM.wr_data,
	fm_ctrl_in.SB42.SB_MEM.wr_data,
	fm_ctrl_in.SB43.SB_MEM.wr_data,
	fm_ctrl_in.SB44.SB_MEM.wr_data,
	fm_ctrl_in.SB45.SB_MEM.wr_data,
	fm_ctrl_in.SB46.SB_MEM.wr_data,
	fm_ctrl_in.SB47.SB_MEM.wr_data,
	fm_ctrl_in.SB48.SB_MEM.wr_data,
	fm_ctrl_in.SB49.SB_MEM.wr_data,
	fm_ctrl_in.SB50.SB_MEM.wr_data,
	fm_ctrl_in.SB51.SB_MEM.wr_data,
	fm_ctrl_in.SB52.SB_MEM.wr_data,
	fm_ctrl_in.SB53.SB_MEM.wr_data,
	fm_ctrl_in.SB54.SB_MEM.wr_data,
	fm_ctrl_in.SB55.SB_MEM.wr_data,
	fm_ctrl_in.SB56.SB_MEM.wr_data,
	fm_ctrl_in.SB57.SB_MEM.wr_data,
	fm_ctrl_in.SB58.SB_MEM.wr_data,
	fm_ctrl_in.SB59.SB_MEM.wr_data,
	fm_ctrl_in.SB60.SB_MEM.wr_data,
	fm_ctrl_in.SB61.SB_MEM.wr_data,
	fm_ctrl_in.SB62.SB_MEM.wr_data,
	fm_ctrl_in.SB63.SB_MEM.wr_data,
	fm_ctrl_in.SB64.SB_MEM.wr_data,
	fm_ctrl_in.SB65.SB_MEM.wr_data,
	fm_ctrl_in.SB66.SB_MEM.wr_data,
	fm_ctrl_in.SB67.SB_MEM.wr_data,
	fm_ctrl_in.SB68.SB_MEM.wr_data,
	fm_ctrl_in.SB69.SB_MEM.wr_data,
	fm_ctrl_in.SB70.SB_MEM.wr_data,
	fm_ctrl_in.SB71.SB_MEM.wr_data,
	fm_ctrl_in.SB72.SB_MEM.wr_data,
	fm_ctrl_in.SB73.SB_MEM.wr_data,
	fm_ctrl_in.SB74.SB_MEM.wr_data,
	fm_ctrl_in.SB75.SB_MEM.wr_data,
	fm_ctrl_in.SB76.SB_MEM.wr_data,
	fm_ctrl_in.SB77.SB_MEM.wr_data,
	fm_ctrl_in.SB78.SB_MEM.wr_data,
	fm_ctrl_in.SB79.SB_MEM.wr_data,
	fm_ctrl_in.SB80.SB_MEM.wr_data,
	fm_ctrl_in.SB81.SB_MEM.wr_data,
	fm_ctrl_in.SB82.SB_MEM.wr_data,
	fm_ctrl_in.SB83.SB_MEM.wr_data,
	fm_ctrl_in.SB84.SB_MEM.wr_data,
	fm_ctrl_in.SB85.SB_MEM.wr_data,
	fm_ctrl_in.SB86.SB_MEM.wr_data,
	fm_ctrl_in.SB87.SB_MEM.wr_data,
	fm_ctrl_in.SB88.SB_MEM.wr_data,
	fm_ctrl_in.SB89.SB_MEM.wr_data,
	fm_ctrl_in.SB90.SB_MEM.wr_data,
	fm_ctrl_in.SB91.SB_MEM.wr_data,
	fm_ctrl_in.SB92.SB_MEM.wr_data,
	fm_ctrl_in.SB93.SB_MEM.wr_data,
	fm_ctrl_in.SB94.SB_MEM.wr_data,
	fm_ctrl_in.SB95.SB_MEM.wr_data,
	fm_ctrl_in.SB96.SB_MEM.wr_data,
	fm_ctrl_in.SB97.SB_MEM.wr_data,
	fm_ctrl_in.SB98.SB_MEM.wr_data,
	fm_ctrl_in.SB99.SB_MEM.wr_data,
	fm_ctrl_in.SB100.SB_MEM.wr_data,
	fm_ctrl_in.SB101.SB_MEM.wr_data,
	fm_ctrl_in.SB102.SB_MEM.wr_data,
	fm_ctrl_in.SB103.SB_MEM.wr_data,
	fm_ctrl_in.SB104.SB_MEM.wr_data,
	fm_ctrl_in.SB105.SB_MEM.wr_data,
	fm_ctrl_in.SB106.SB_MEM.wr_data,
	fm_ctrl_in.SB107.SB_MEM.wr_data,
	fm_ctrl_in.SB108.SB_MEM.wr_data,
	fm_ctrl_in.SB109.SB_MEM.wr_data,
	fm_ctrl_in.SB110.SB_MEM.wr_data,
	fm_ctrl_in.SB111.SB_MEM.wr_data,
	fm_ctrl_in.SB112.SB_MEM.wr_data,
	fm_ctrl_in.SB113.SB_MEM.wr_data
	};




  
/* -----\/----- EXCLUDED -----\/-----
    assign  axi_sm_addr       = {
				fm_ctrl_in.SB0.SB_META.address,
				fm_ctrl_in.SB1.SB_META.address,
				fm_ctrl_in.SB2.SB_META.address,
				fm_ctrl_in.SB3.SB_META.address,
				fm_ctrl_in.SB4.SB_META.address,
				fm_ctrl_in.SB5.SB_META.address,
				fm_ctrl_in.SB6.SB_META.address,
				fm_ctrl_in.SB7.SB_META.address,
				fm_ctrl_in.SB8.SB_META.address,
				fm_ctrl_in.SB9.SB_META.address,
				fm_ctrl_in.SB10.SB_META.address,
				fm_ctrl_in.SB11.SB_META.address,
				fm_ctrl_in.SB12.SB_META.address,
				fm_ctrl_in.SB13.SB_META.address,
				fm_ctrl_in.SB14.SB_META.address,
				fm_ctrl_in.SB15.SB_META.address,
				fm_ctrl_in.SB16.SB_META.address,
				fm_ctrl_in.SB17.SB_META.address,
				fm_ctrl_in.SB18.SB_META.address,
				fm_ctrl_in.SB19.SB_META.address,
				fm_ctrl_in.SB20.SB_META.address,
				fm_ctrl_in.SB21.SB_META.address,
				fm_ctrl_in.SB22.SB_META.address,
				fm_ctrl_in.SB23.SB_META.address,
				fm_ctrl_in.SB24.SB_META.address,
				fm_ctrl_in.SB25.SB_META.address,
				fm_ctrl_in.SB26.SB_META.address,
                                fm_ctrl_in.SB_DUMMY0.SB_META.address
                                fm_ctrl_in.SB_DUMMY1.SB_META.address
				};

   assign axi_sm_enable                = {
					  fm_ctrl_in.SB0.SB_META.enable,
					  fm_ctrl_in.SB1.SB_META.enable,
					  fm_ctrl_in.SB2.SB_META.enable,
					  fm_ctrl_in.SB3.SB_META.enable,
					  fm_ctrl_in.SB4.SB_META.enable,
					  fm_ctrl_in.SB5.SB_META.enable,
					  fm_ctrl_in.SB6.SB_META.enable,
					  fm_ctrl_in.SB7.SB_META.enable,
					  fm_ctrl_in.SB8.SB_META.enable,
					  fm_ctrl_in.SB9.SB_META.enable,
					  fm_ctrl_in.SB10.SB_META.enable,
					  fm_ctrl_in.SB11.SB_META.enable,
					  fm_ctrl_in.SB12.SB_META.enable,
					  fm_ctrl_in.SB13.SB_META.enable,
					  fm_ctrl_in.SB14.SB_META.enable,
					  fm_ctrl_in.SB15.SB_META.enable,
					  fm_ctrl_in.SB16.SB_META.enable,
					  fm_ctrl_in.SB17.SB_META.enable,
					  fm_ctrl_in.SB18.SB_META.enable,
					  fm_ctrl_in.SB19.SB_META.enable,
					  fm_ctrl_in.SB20.SB_META.enable,
					  fm_ctrl_in.SB21.SB_META.enable,
					  fm_ctrl_in.SB22.SB_META.enable,
					  fm_ctrl_in.SB23.SB_META.enable,
					  fm_ctrl_in.SB24.SB_META.enable,
					  fm_ctrl_in.SB25.SB_META.enable,
					  fm_ctrl_in.SB26.SB_META.enable,
 					  fm_ctrl_in.SB_DUMMY0.SB_META.enable,
  					  fm_ctrl_in.SB_DUMMY1.SB_META.enable
					  };

   assign axi_sm_wr_enable                = {
					     fm_ctrl_in.SB0.SB_META.wr_enable,
					     fm_ctrl_in.SB1.SB_META.wr_enable,
					     fm_ctrl_in.SB2.SB_META.wr_enable,
					     fm_ctrl_in.SB3.SB_META.wr_enable,
					     fm_ctrl_in.SB4.SB_META.wr_enable,
					     fm_ctrl_in.SB5.SB_META.wr_enable,
					     fm_ctrl_in.SB6.SB_META.wr_enable,
					     fm_ctrl_in.SB7.SB_META.wr_enable,
					     fm_ctrl_in.SB8.SB_META.wr_enable,
					     fm_ctrl_in.SB9.SB_META.wr_enable,
					     fm_ctrl_in.SB10.SB_META.wr_enable,
					     fm_ctrl_in.SB11.SB_META.wr_enable,
					     fm_ctrl_in.SB12.SB_META.wr_enable,
					     fm_ctrl_in.SB13.SB_META.wr_enable,
					     fm_ctrl_in.SB14.SB_META.wr_enable,
					     fm_ctrl_in.SB15.SB_META.wr_enable,
					     fm_ctrl_in.SB16.SB_META.wr_enable,
					     fm_ctrl_in.SB17.SB_META.wr_enable,
					     fm_ctrl_in.SB18.SB_META.wr_enable,
					     fm_ctrl_in.SB19.SB_META.wr_enable,
					     fm_ctrl_in.SB20.SB_META.wr_enable,
					     fm_ctrl_in.SB21.SB_META.wr_enable,
					     fm_ctrl_in.SB22.SB_META.wr_enable,
					     fm_ctrl_in.SB23.SB_META.wr_enable,
					     fm_ctrl_in.SB24.SB_META.wr_enable,
					     fm_ctrl_in.SB25.SB_META.wr_enable,
					     fm_ctrl_in.SB26.SB_META.wr_enable,
 					     fm_ctrl_in.SB_DUMMY0.SB_META.wr_enable,
  					     fm_ctrl_in.SB_DUMMY1.SB_META.wr_enable
 };

     assign axi_sm_wr_data               = {
					  fm_ctrl_in.SB0.SB_META.wr_data,
					  fm_ctrl_in.SB1.SB_META.wr_data,
					  fm_ctrl_in.SB2.SB_META.wr_data,
					  fm_ctrl_in.SB3.SB_META.wr_data,
					  fm_ctrl_in.SB4.SB_META.wr_data,
					  fm_ctrl_in.SB5.SB_META.wr_data,
					  fm_ctrl_in.SB6.SB_META.wr_data,
					  fm_ctrl_in.SB7.SB_META.wr_data,
					  fm_ctrl_in.SB8.SB_META.wr_data,
					  fm_ctrl_in.SB9.SB_META.wr_data,
					  fm_ctrl_in.SB10.SB_META.wr_data,
					  fm_ctrl_in.SB11.SB_META.wr_data,
					  fm_ctrl_in.SB12.SB_META.wr_data,
					  fm_ctrl_in.SB13.SB_META.wr_data,
					  fm_ctrl_in.SB14.SB_META.wr_data,
					  fm_ctrl_in.SB15.SB_META.wr_data,
					  fm_ctrl_in.SB16.SB_META.wr_data,
					  fm_ctrl_in.SB17.SB_META.wr_data,
					  fm_ctrl_in.SB18.SB_META.wr_data,
					  fm_ctrl_in.SB19.SB_META.wr_data,
					  fm_ctrl_in.SB20.SB_META.wr_data,
					  fm_ctrl_in.SB21.SB_META.wr_data,
					  fm_ctrl_in.SB22.SB_META.wr_data,
					  fm_ctrl_in.SB23.SB_META.wr_data,
					  fm_ctrl_in.SB24.SB_META.wr_data,
					  fm_ctrl_in.SB25.SB_META.wr_data,
					  fm_ctrl_in.SB26.SB_META.wr_data,
 					  fm_ctrl_in.SB_DUMMY0.SB_META.wr_data,
  					  fm_ctrl_in.SB_DUMMY1.SB_META.wr_data
					  };
 -----/\----- EXCLUDED -----/\----- */

 




   logic [mon_dw_max-1 : 0] tp_write_data[sb_mapped_n];
   generate
   for(sb_i =0; sb_i < sb_mapped_n; sb_i = sb_i+1)
     begin: l0mdt_spybuffers
	if(sb_dw[sb_i] < mon_dw_max)
	  begin
	     assign fm_passthrough_data[sb_i].fm_data[mon_dw_max-1: sb_dw[sb_i]] = 'b0;
	  end

	assign tp_write_data[sb_i] = fm_mon_data[sb_i].fm_data & {sb_tp_dw[sb_i]{1'b1}};
	
	
	   SpyBuffer #(
		       .DATA_WIDTH_A(sb_dw[sb_i]),
		       .DATA_WIDTH_B(axi_dw),
		       .SPY_META_DATA_WIDTH(axi_dw),

		       .SPY_MEM_WIDTH_A($clog2((2**axi_sb_addr_width[sb_i])* axi_dw /sb_dw[sb_i])), //CHK THIS
		       .SPY_MEM_WIDTH_B(axi_sb_addr_width[sb_i]), //$bits(fm_ctrl_t.sb0.SB_MEM.address)),

		       .FC_FIFO_WIDTH(4),

		       .EL_MEM_WIDTH(8), //Size of SPY META - not used


		       .PASSTHROUGH(1)
		       )
	   fm_spybuffer_inst
		(
		 /*
		  //TEST SpyBuffer IN SINGLE CLOCK DOMAIN
		 .rclock((sb_i == sb_master_dummy_index || sb_i == sb_slave_dummy_index)? spy_clock:clk_hs),
		 .wclock((sb_i == sb_master_dummy_index || sb_i == sb_slave_dummy_index)? spy_clock:clk_hs),
		 .rresetbar((sb_i == sb_master_dummy_index || sb_i == sb_slave_dummy_index)? axi_reset_n:~rst_hs),
		 .wresetbar((sb_i == sb_master_dummy_index || sb_i == sb_slave_dummy_index)? axi_reset_n:~rst_hs),
		  */
		 .rclock(clk_hs),
		 .wclock(clk_hs),
		 .rresetbar(~(rst_hs | sb_reset[sb_i])),
		 .wresetbar(~(rst_hs | sb_reset[sb_i])),
		 .write_data(tp_write_data[sb_i]), //{'b0,fm_mon_data[sb_i].fm_data[sb_tp_dw[sb_i]-1 : 0]} & sb_dw[sb_i]{1'b1}), //CHECK IF ALWAYS VALID
		 .write_enable(fm_mon_data[sb_i].fm_vld),
		 .read_enable(1'b1),
		 .read_data(fm_passthrough_data[sb_i].fm_data[sb_dw[sb_i]-1 : 0]),
		 .almost_full(),
		 .empty(sb_empty[sb_i]),

		 .dbg_spy_meta_write_addr(),
		 .dbg_spy_write_addr(),
		 .dbg_spy_meta_read_data(),

		 .spy_clock(spy_clock),
		 .spy_clock_meta(spy_clock),

		 .freeze(freeze[sb_i]),
		 .playback(playback_mode[sb_i]),
		 .spy_en(axi_sb_enable_internal[sb_i] | axi_sb_wr_enable[sb_i]),
		 .spy_addr(axi_sb_addr[sb_i][axi_sb_addr_width[sb_i]-1:0]),
		 .spy_write_enable(axi_sb_wr_enable[sb_i]),
		 .spy_write_data(axi_sb_wr_data[sb_i]),
		 .spy_data(axi_spy_data_i[sb_i]),
		 .spy_meta_en(0),//axi_sm_enable[sb_i] | axi_sm_wr_enable[sb_i]),
		 .spy_meta_addr(0), //axi_sm_addr[sb_i][axi_sm_addr_width[sb_i]-1:0]),
		 .spy_meta_read_data(),//axi_spy_meta_data[sb_i]),
		 .spy_meta_write_data(0), //axi_sm_wr_data[sb_i]),
		 .spy_meta_wen(0)//(axi_sm_wr_enable[sb_i])

		 );

     end // for (sb_i =0; sb_i < sb_mapped_n; sb_i = sb_i+1)

   endgenerate

  

   always @(posedge spy_clock  or negedge axi_reset_n)
     begin
	if(~axi_reset_n)
	  begin
	     for(integer i=0;i<sb_mapped_n;i=i+1)
	       begin
		  axi_spy_rd_vld[i]       <= 0;
   		  axi_spy_meta_rd_vld[i]  <= 0;
	       end
	  end
	else
	  begin
	     for(integer i=0;i<sb_mapped_n;i=i+1)
	       begin
		  if(axi_sb_enable[i] == 1'b1) // & init_spy_mem_internal == 1'b0)
		    begin
		       axi_spy_rd_vld[i] <= 1'b1;
		    end
		  else
		    begin
		       axi_spy_rd_vld[i] <= 1'b0;
		    end


		  if(axi_sm_enable[i] == 1'b1) // & init_spy_mem_internal == 1'b0) 
		    begin
		       axi_spy_meta_rd_vld[i] <= 1'b1;
		    end
		  else
		    begin
		       axi_spy_meta_rd_vld[i] <= 1'b0;
		    end
	       end
	  end
     end // always @ (posedge spy_clock)



    always @(posedge spy_clock  or negedge axi_reset_n)
     begin
	if(~axi_reset_n)
	  begin
	     init_spy_mem_internal <= 1'b1;
	     
	     for(integer i=0;i<sb_mapped_n;i=i+1)
	       begin
		  axi_sb_init_addr[i]    <= '0;
		  axi_sb_init_wr_data[i] <= 32'h0fa5fa50;		  
	       end
	  end
	else
	  begin
	     init_spy_mem_internal <= init_spy_mem;
	     
	       for(integer i=0;i<sb_mapped_n;i=i+1)
		 begin
		    if(init_spy_mem_internal)
		      axi_sb_init_addr[i] <= axi_sb_init_addr[i] + 1;
		    else
		      axi_sb_init_addr[i] <= 0;		    
		 end
	     
	  end
     end // always @ (posedge spy_clock)

   //Debug
   fm_dummy_block #(
		    .dummy_master(1),
		    .data_width(SB_DUMMY_LEN)
		    )fm_dummy_block_master(
					   .clk(clk_hs), //spy_clock),
					   .rst(rst_hs | sb_reset[sb_master_dummy_index]),  //~axi_reset_n),
					   .dummy_input('b0),
					   .dummy_input_vld(0),
					   .dummy_mon_data(dummy_mon_data[0]),
					   .dummy_mon_vld(dummy_mon_vld[0])
					   );
   fm_dummy_block #(
		    .dummy_master(0),
		    .data_width(SB_DUMMY_LEN)
		    )fm_dummy_block_slave(
					  .clk(clk_hs), //spy_clock),
					  .rst(rst_hs | sb_reset[sb_slave_dummy_index]), //~axi_reset_n),
					  .dummy_input(fm_passthrough_data[sb_master_dummy_index].fm_data[SB_DUMMY_LEN-1:0]),
					  .dummy_input_vld(fm_passthrough_data[sb_master_dummy_index].fm_vld),
					  .dummy_mon_data(dummy_mon_data[1]),
					  .dummy_mon_vld(dummy_mon_vld[1])
					  );
   
   endmodule

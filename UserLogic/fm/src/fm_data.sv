`include "fm_sb_pkg.sv"
`include "FM_PKG.svh"

import FM_CTRL::*;
import fm_sb_pkg::*;


module fm_data #(
		 parameter total_sb = 27
		 )(
	       input logic 		       clk_hs,
	       input logic 		       rst_hs,
	       input logic 		       spy_clock,
	       input logic 		       axi_reset,
	       input logic [sb_mapped_n-1:0]   freeze,
	       input logic 		       init_spy_mem,
	       input logic [pb_mode_width-1:0] playback_mode[sb_mapped_n],
	       input 			       FM_CTRL_t fm_ctrl_in,
	       input 			       fm_rt ult_mon_data[total_sb],
	       output 			       FM_MON_t fm_mon_out
	       );
   localparam axi_dw = axi_dw;
   genvar 	      sb_i;
   logic [total_sb-1 :0] axi_spy_rd_vld;
   logic [total_sb-1 :0] axi_spy_meta_rd_vld;
   logic [axi_dw-1:0] 	 axi_spy_data[sb_mapped_n];
   logic [axi_dw-1:0] 	 axi_spy_data_i[sb_mapped_n];
   logic [axi_dw-1:0] 	 axi_spy_meta_data[sb_mapped_n];
   logic [0:sb_mapped_n-1] axi_sb_enable;
   logic 		 axi_sm_enable[sb_mapped_n];
   logic [0:sb_mapped_n-1] axi_sb_wr_enable;
   logic 		 axi_sm_wr_enable[sb_mapped_n];
   logic [axi_dw-1:0] 	 axi_sb_wr_data[sb_mapped_n] ;
   logic [axi_dw-1:0] 	 axi_sm_wr_data[sb_mapped_n];
   logic [15:0] 	 axi_sb_addr[sb_mapped_n] ;
   logic [15:0] 	 axi_sm_addr[sb_mapped_n] ;

   logic [15:0] 	 axi_sb_init_addr[sb_mapped_n]  = '{default:0};
   logic [axi_dw-1:0] 	 axi_sb_init_wr_data[sb_mapped_n] = '{default:0} ;
   logic 		 init_spy_mem_internal;
   
   fm_rt ctrl_mon_data[sb_mapped_n];


   generate
      for (sb_i = 0; sb_i < sb_mapped_n; sb_i = sb_i+1)
	begin
	   if(total_sb <= sb_mapped_n)
	     begin
		assign ctrl_mon_data[sb_i] = ult_mon_data[sb_i];
	     end
	   else
	     begin
		assign ctrl_mon_data[sb_i] = '{fm_data:0, fm_vld:0};

	     end
	end
   endgenerate






/* -----\/----- EXCLUDED -----\/-----
   generate
      for (sb_i = 0; sb_i < sb_mapped_n; sb_i = sb_i+1)
	begin:FM_LOOP
	   assign fm_mon_out.sb_offset[sb_i].SB_MEM.rd_data        = axi_spy_data[sb_i];
	   assign fm_mon_out.sb_offset[sb_i].SB_MEM.rd_data_valid  = axi_spy_rd_vld[sb_i];
	   assign fm_mon_out.sb_offset[sb_i].SB_META.rd_data       = axi_spy_meta_data[sb_i];
	   assign fm_mon_out.sb_offset[sb_i].SB_META.rd_data_valid = axi_spy_meta_rd_vld[sb_i];

	   assign axi_sb_addr[sb_i]                  = fm_ctrl_in.sb_offset[sb_i].SB_MEM.address;
	   assign axi_sb_enable[sb_i]                = fm_ctrl_in.sb_offset[sb_i].SB_MEM.enable;
	   assign axi_sb_wr_enable[sb_i]             = fm_ctrl_in.sb_offset[sb_i].SB_MEM.wr_enable;
	   assign axi_sb_wr_data[sb_i]               = fm_ctrl_in.sb_offset[sb_i].SB_MEM.wr_data;

	   assign axi_sm_addr[sb_i]                  = fm_ctrl_in.sb_offset[sb_i].SB_META.address;
	   assign axi_sm_enable[sb_i]                = fm_ctrl_in.sb_offset[sb_i].SB_META.enable;
	   assign axi_sm_wr_enable[sb_i]             = fm_ctrl_in.sb_offset[sb_i].SB_META.wr_enable;
	   assign axi_sm_wr_data[sb_i]               = fm_ctrl_in.sb_offset[sb_i].SB_META.wr_data;

	end
   endgenerate
 -----/\----- EXCLUDED -----/\----- */







   assign fm_mon_out.SB0.SB_MEM = (axi_spy_rd_vld[0] == 0)? '{rd_data:'b0, rd_data_valid:0} :  '{rd_data:axi_spy_data[0], rd_data_valid:axi_spy_rd_vld[0]};
   assign fm_mon_out.SB1.SB_MEM = (axi_spy_rd_vld[1] == 0)? '{rd_data:'b0, rd_data_valid:0} : '{rd_data:axi_spy_data[1], rd_data_valid:axi_spy_rd_vld[1]};
   assign fm_mon_out.SB2.SB_MEM = (axi_spy_rd_vld[2] == 0)? '{rd_data:'b0, rd_data_valid:0} : '{rd_data:axi_spy_data[2], rd_data_valid:axi_spy_rd_vld[2]};
   assign fm_mon_out.SB3.SB_MEM = (axi_spy_rd_vld[3] == 0)? '{rd_data:'b0, rd_data_valid:0} : '{rd_data:axi_spy_data[3], rd_data_valid:axi_spy_rd_vld[3]};
   assign fm_mon_out.SB4.SB_MEM = (axi_spy_rd_vld[4] == 0)? '{rd_data:'b0, rd_data_valid:0} : '{rd_data:axi_spy_data[4], rd_data_valid:axi_spy_rd_vld[4]};
   assign fm_mon_out.SB5.SB_MEM = (axi_spy_rd_vld[5] == 0)? '{rd_data:'b0, rd_data_valid:0} : '{rd_data:axi_spy_data[5], rd_data_valid:axi_spy_rd_vld[5]};
   assign fm_mon_out.SB6.SB_MEM = (axi_spy_rd_vld[6] == 0)? '{rd_data:'b0, rd_data_valid:0} : '{rd_data:axi_spy_data[6], rd_data_valid:axi_spy_rd_vld[6]};
   assign fm_mon_out.SB7.SB_MEM = (axi_spy_rd_vld[7] == 0)? '{rd_data:'b0, rd_data_valid:0} : '{rd_data:axi_spy_data[7], rd_data_valid:axi_spy_rd_vld[7]};
   assign fm_mon_out.SB8.SB_MEM = (axi_spy_rd_vld[8] == 0)? '{rd_data:'b0, rd_data_valid:0} : '{rd_data:axi_spy_data[8], rd_data_valid:axi_spy_rd_vld[8]};
   assign fm_mon_out.SB9.SB_MEM = (axi_spy_rd_vld[9] == 0)? '{rd_data:'b0, rd_data_valid:0} : '{rd_data:axi_spy_data[9], rd_data_valid:axi_spy_rd_vld[9]};
   assign fm_mon_out.SB10.SB_MEM = (axi_spy_rd_vld[10] == 0)? '{rd_data:'b0, rd_data_valid:0} : '{rd_data:axi_spy_data[10], rd_data_valid:axi_spy_rd_vld[10]};
   assign fm_mon_out.SB11.SB_MEM = (axi_spy_rd_vld[11] == 0)? '{rd_data:'b0, rd_data_valid:0} :'{rd_data:axi_spy_data[11], rd_data_valid:axi_spy_rd_vld[11]};
   assign fm_mon_out.SB12.SB_MEM = (axi_spy_rd_vld[12] == 0)? '{rd_data:'b0, rd_data_valid:0} :'{rd_data:axi_spy_data[12], rd_data_valid:axi_spy_rd_vld[12]};
   assign fm_mon_out.SB13.SB_MEM = (axi_spy_rd_vld[13] == 0)? '{rd_data:'b0, rd_data_valid:0} :'{rd_data:axi_spy_data[13], rd_data_valid:axi_spy_rd_vld[13]};
   assign fm_mon_out.SB14.SB_MEM = (axi_spy_rd_vld[14] == 0)? '{rd_data:'b0, rd_data_valid:0} :'{rd_data:axi_spy_data[14], rd_data_valid:axi_spy_rd_vld[14]};
   assign fm_mon_out.SB15.SB_MEM = (axi_spy_rd_vld[15] == 0)? '{rd_data:'b0, rd_data_valid:0} :'{rd_data:axi_spy_data[15], rd_data_valid:axi_spy_rd_vld[15]};
   assign fm_mon_out.SB16.SB_MEM = (axi_spy_rd_vld[16] == 0)? '{rd_data:'b0, rd_data_valid:0} :'{rd_data:axi_spy_data[16], rd_data_valid:axi_spy_rd_vld[16]};
   assign fm_mon_out.SB17.SB_MEM = (axi_spy_rd_vld[17] == 0)? '{rd_data:'b0, rd_data_valid:0} :'{rd_data:axi_spy_data[17], rd_data_valid:axi_spy_rd_vld[17]};
   assign fm_mon_out.SB18.SB_MEM = (axi_spy_rd_vld[18] == 0)? '{rd_data:'b0, rd_data_valid:0} :'{rd_data:axi_spy_data[18], rd_data_valid:axi_spy_rd_vld[18]};
   assign fm_mon_out.SB19.SB_MEM = (axi_spy_rd_vld[19] == 0)? '{rd_data:'b0, rd_data_valid:0} :'{rd_data:axi_spy_data[19], rd_data_valid:axi_spy_rd_vld[19]};
   assign fm_mon_out.SB20.SB_MEM = (axi_spy_rd_vld[20] == 0)? '{rd_data:'b0, rd_data_valid:0} :'{rd_data:axi_spy_data[20], rd_data_valid:axi_spy_rd_vld[20]};
   assign fm_mon_out.SB21.SB_MEM = (axi_spy_rd_vld[21] == 0)? '{rd_data:'b0, rd_data_valid:0} :'{rd_data:axi_spy_data[21], rd_data_valid:axi_spy_rd_vld[21]};
   assign fm_mon_out.SB22.SB_MEM = (axi_spy_rd_vld[22] == 0)? '{rd_data:'b0, rd_data_valid:0} :'{rd_data:axi_spy_data[22], rd_data_valid:axi_spy_rd_vld[22]};
   assign fm_mon_out.SB23.SB_MEM = (axi_spy_rd_vld[23] == 0)? '{rd_data:'b0, rd_data_valid:0} :'{rd_data:axi_spy_data[23], rd_data_valid:axi_spy_rd_vld[23]};
   assign fm_mon_out.SB24.SB_MEM = (axi_spy_rd_vld[24] == 0)? '{rd_data:'b0, rd_data_valid:0} :'{rd_data:axi_spy_data[24], rd_data_valid:axi_spy_rd_vld[24]};
   assign fm_mon_out.SB25.SB_MEM = (axi_spy_rd_vld[25] == 0)? '{rd_data:'b0, rd_data_valid:0} :'{rd_data:axi_spy_data[25], rd_data_valid:axi_spy_rd_vld[25]};
   assign fm_mon_out.SB26.SB_MEM = (axi_spy_rd_vld[26] == 0)? '{rd_data:'b0, rd_data_valid:0} :'{rd_data:axi_spy_data[26], rd_data_valid:axi_spy_rd_vld[26]};




/* -----\/----- EXCLUDED -----\/-----

   assign fm_mon_out.SB0.SB_META = (axi_spy_meta_rd_vld[0] == 0)? '{rd_data:'b0, rd_data_valid:0} :'{rd_data:axi_spy_meta_data[0], rd_data_valid:axi_spy_meta_rd_vld[0]};
   assign fm_mon_out.SB1.SB_META = (axi_spy_meta_rd_vld[1] == 0)? '{rd_data:'b0, rd_data_valid:0} :'{rd_data:axi_spy_meta_data[1], rd_data_valid:axi_spy_meta_rd_vld[1]};
   assign fm_mon_out.SB2.SB_META = (axi_spy_meta_rd_vld[2] == 0)? '{rd_data:'b0, rd_data_valid:0} :'{rd_data:axi_spy_meta_data[2], rd_data_valid:axi_spy_meta_rd_vld[2]};
   assign fm_mon_out.SB3.SB_META = (axi_spy_meta_rd_vld[3] == 0)? '{rd_data:'b0, rd_data_valid:0} : '{rd_data:axi_spy_meta_data[3], rd_data_valid:axi_spy_meta_rd_vld[3]};
   assign fm_mon_out.SB4.SB_META = (axi_spy_meta_rd_vld[4] == 0)? '{rd_data:'b0, rd_data_valid:0} :'{rd_data:axi_spy_meta_data[4], rd_data_valid:axi_spy_meta_rd_vld[4]};
   assign fm_mon_out.SB5.SB_META = (axi_spy_meta_rd_vld[5] == 0)? '{rd_data:'b0, rd_data_valid:0} :'{rd_data:axi_spy_meta_data[5], rd_data_valid:axi_spy_meta_rd_vld[5]};
   assign fm_mon_out.SB6.SB_META = (axi_spy_meta_rd_vld[6] == 0)? '{rd_data:'b0, rd_data_valid:0} :'{rd_data:axi_spy_meta_data[6], rd_data_valid:axi_spy_meta_rd_vld[6]};
   assign fm_mon_out.SB7.SB_META = (axi_spy_meta_rd_vld[7] == 0)? '{rd_data:'b0, rd_data_valid:0} :'{rd_data:axi_spy_meta_data[7], rd_data_valid:axi_spy_meta_rd_vld[7]};
   assign fm_mon_out.SB8.SB_META = (axi_spy_meta_rd_vld[8] == 0)? '{rd_data:'b0, rd_data_valid:0} :'{rd_data:axi_spy_meta_data[8], rd_data_valid:axi_spy_meta_rd_vld[8]};
   assign fm_mon_out.SB9.SB_META = (axi_spy_meta_rd_vld[9] == 0)? '{rd_data:'b0, rd_data_valid:0} :'{rd_data:axi_spy_meta_data[9], rd_data_valid:axi_spy_meta_rd_vld[9]};
   assign fm_mon_out.SB10.SB_META = (axi_spy_meta_rd_vld[10] == 0)? '{rd_data:'b0, rd_data_valid:0} :'{rd_data:axi_spy_meta_data[10], rd_data_valid:axi_spy_meta_rd_vld[10]};
   assign fm_mon_out.SB11.SB_META = (axi_spy_meta_rd_vld[11] == 0)? '{rd_data:'b0, rd_data_valid:0} :'{rd_data:axi_spy_meta_data[11], rd_data_valid:axi_spy_meta_rd_vld[11]};
   assign fm_mon_out.SB12.SB_META = (axi_spy_meta_rd_vld[12] == 0)? '{rd_data:'b0, rd_data_valid:0} :'{rd_data:axi_spy_meta_data[12], rd_data_valid:axi_spy_meta_rd_vld[12]};
   assign fm_mon_out.SB13.SB_META = (axi_spy_meta_rd_vld[13] == 0)? '{rd_data:'b0, rd_data_valid:0} :'{rd_data:axi_spy_meta_data[13], rd_data_valid:axi_spy_meta_rd_vld[13]};
   assign fm_mon_out.SB14.SB_META = (axi_spy_meta_rd_vld[14] == 0)? '{rd_data:'b0, rd_data_valid:0} :'{rd_data:axi_spy_meta_data[14], rd_data_valid:axi_spy_meta_rd_vld[14]};
   assign fm_mon_out.SB15.SB_META = (axi_spy_meta_rd_vld[15] == 0)? '{rd_data:'b0, rd_data_valid:0} :'{rd_data:axi_spy_meta_data[15], rd_data_valid:axi_spy_meta_rd_vld[15]};
   assign fm_mon_out.SB16.SB_META = (axi_spy_meta_rd_vld[16] == 0)? '{rd_data:'b0, rd_data_valid:0} :'{rd_data:axi_spy_meta_data[16], rd_data_valid:axi_spy_meta_rd_vld[16]};
   assign fm_mon_out.SB17.SB_META = (axi_spy_meta_rd_vld[17] == 0)? '{rd_data:'b0, rd_data_valid:0} :'{rd_data:axi_spy_meta_data[17], rd_data_valid:axi_spy_meta_rd_vld[17]};
   assign fm_mon_out.SB18.SB_META = (axi_spy_meta_rd_vld[18] == 0)? '{rd_data:'b0, rd_data_valid:0} :'{rd_data:axi_spy_meta_data[18], rd_data_valid:axi_spy_meta_rd_vld[18]};
   assign fm_mon_out.SB19.SB_META = (axi_spy_meta_rd_vld[19] == 0)? '{rd_data:'b0, rd_data_valid:0} :'{rd_data:axi_spy_meta_data[19], rd_data_valid:axi_spy_meta_rd_vld[19]};
   assign fm_mon_out.SB20.SB_META = (axi_spy_meta_rd_vld[20] == 0)? '{rd_data:'b0, rd_data_valid:0} :'{rd_data:axi_spy_meta_data[20], rd_data_valid:axi_spy_meta_rd_vld[20]};
   assign fm_mon_out.SB21.SB_META = (axi_spy_meta_rd_vld[21] == 0)? '{rd_data:'b0, rd_data_valid:0} :'{rd_data:axi_spy_meta_data[21], rd_data_valid:axi_spy_meta_rd_vld[21]};
   assign fm_mon_out.SB22.SB_META = (axi_spy_meta_rd_vld[22] == 0)? '{rd_data:'b0, rd_data_valid:0} :'{rd_data:axi_spy_meta_data[22], rd_data_valid:axi_spy_meta_rd_vld[22]};
   assign fm_mon_out.SB23.SB_META = (axi_spy_meta_rd_vld[23] == 0)? '{rd_data:'b0, rd_data_valid:0} :'{rd_data:axi_spy_meta_data[23], rd_data_valid:axi_spy_meta_rd_vld[23]};
   assign fm_mon_out.SB24.SB_META = (axi_spy_meta_rd_vld[24] == 0)? '{rd_data:'b0, rd_data_valid:0} :'{rd_data:axi_spy_meta_data[24], rd_data_valid:axi_spy_meta_rd_vld[24]};
   assign fm_mon_out.SB25.SB_META = (axi_spy_meta_rd_vld[25] == 0)? '{rd_data:'b0, rd_data_valid:0} :'{rd_data:axi_spy_meta_data[25], rd_data_valid:axi_spy_meta_rd_vld[25]};
   assign fm_mon_out.SB26.SB_META = (axi_spy_meta_rd_vld[26] == 0)? '{rd_data:'b0, rd_data_valid:0} :'{rd_data:axi_spy_meta_data[26], rd_data_valid:axi_spy_meta_rd_vld[26]};
 -----/\----- EXCLUDED -----/\----- */






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
				fm_ctrl_in.SB26.SB_MEM.address
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
				fm_ctrl_in.SB26.SB_META.address
				};
 -----/\----- EXCLUDED -----/\----- */


   assign axi_sb_enable                =  (init_spy_mem_internal == 1)? '1: {
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
					  fm_ctrl_in.SB26.SB_MEM.enable
					  };


/* -----\/----- EXCLUDED -----\/-----
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
					  fm_ctrl_in.SB26.SB_META.enable
					  };
 -----/\----- EXCLUDED -----/\----- */


   assign axi_sb_wr_enable                = (init_spy_mem_internal)? '1: {
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
					     fm_ctrl_in.SB26.SB_MEM.wr_enable
					     };

/* -----\/----- EXCLUDED -----\/-----
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
					     fm_ctrl_in.SB26.SB_META.wr_enable
					     };
 -----/\----- EXCLUDED -----/\----- */




   assign axi_sb_wr_data               =  (init_spy_mem_internal==1)? axi_sb_init_wr_data : {
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
					  fm_ctrl_in.SB26.SB_MEM.wr_data
					  };

/* -----\/----- EXCLUDED -----\/-----
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
					  fm_ctrl_in.SB26.SB_META.wr_data
					  };
 -----/\----- EXCLUDED -----/\----- */

 





   generate
   for(sb_i =0; sb_i < sb_mapped_n; sb_i = sb_i+1)
     begin: l0mdt_spybuffers


	   SpyBuffer #(
		       .DATA_WIDTH_A(sb_dw[sb_i]),
		       .DATA_WIDTH_B(axi_dw),
		       .SPY_META_DATA_WIDTH(axi_dw),

		       .SPY_MEM_WIDTH_A($clog2((2**axi_sb_addr_width[sb_i])* axi_dw /sb_dw[sb_i])), //CHK THIS
		       .SPY_MEM_WIDTH_B(axi_sb_addr_width[sb_i]), //$bits(fm_ctrl_t.sb0.SB_MEM.address)),

		       .FC_FIFO_WIDTH(4),

		       .EL_MEM_WIDTH(8), //axi_sm_addr_width[sb_i]),


		       .PASSTHROUGH(1)
		       )
	   fm_spybuffer_inst
		(
		 .rclock(clk_hs),
		 .wclock(clk_hs),
		 .rresetbar(~rst_hs),
		 .wresetbar(~rst_hs),
		 .write_data(ctrl_mon_data[sb_i].fm_data[sb_dw[sb_i]-1 : 0]), //CHECK IF ALWAYS VALID
		 .write_enable(ctrl_mon_data[sb_i].fm_vld),
		 .read_enable(1'b1),
		 .read_data(),
		 .almost_full(),
		 .empty(),

		 .dbg_spy_meta_write_addr(),
		 .dbg_spy_write_addr(),
		 .dbg_spy_meta_read_data(),

		 .spy_clock(spy_clock),
		 .spy_clock_meta(spy_clock),

		 .freeze(freeze[sb_i]),
		 .playback(playback_mode[sb_i]),
		 .spy_en(axi_sb_enable[sb_i] | axi_sb_wr_enable[sb_i]),
		 .spy_addr(axi_sb_addr[sb_i][axi_sb_addr_width[sb_i]-1:0]),
		 .spy_write_enable(axi_sb_wr_enable[sb_i]),
		 .spy_write_data(axi_sb_wr_data[sb_i]),
		 .spy_data(axi_spy_data[sb_i]),
		 .spy_meta_en(0),//axi_sm_enable[sb_i] | axi_sm_wr_enable[sb_i]),
		 .spy_meta_addr(0), //axi_sm_addr[sb_i][axi_sm_addr_width[sb_i]-1:0]),
		 .spy_meta_read_data(),//axi_spy_meta_data[sb_i]),
		 .spy_meta_write_data(0), //axi_sm_wr_data[sb_i]),
		 .spy_meta_wen(0)//(axi_sm_wr_enable[sb_i])

		 );

     end // for (sb_i =0; sb_i < sb_mapped_n; sb_i = sb_i+1)

   endgenerate

  

   always @(posedge spy_clock)
     begin
	if(axi_reset)
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
		  if(axi_sb_enable[i] == 1'b1 & init_spy_mem_internal == 1'b0)
		    begin
		       axi_spy_rd_vld[i] <= 1'b1;
		    end
		  else
		    begin
		       axi_spy_rd_vld[i] <= 1'b0;
		    end


		  if(axi_sm_enable[i] == 1'b1 & init_spy_mem_internal == 1'b0) 
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



    always @(posedge spy_clock)
     begin
	if(axi_reset)
	  begin
	     init_spy_mem_internal <= 1'b1;
	     
	     for(integer i=0;i<sb_mapped_n;i=i+1)
	       begin
		  axi_sb_init_addr[i] <= '0;		  
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
     end
   endmodule

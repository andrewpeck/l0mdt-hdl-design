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



`include "l0mdt_buses_constants.svh"
`default_nettype wire
  module mtc_link_map
    #(
      parameter LINK_SLID   =0,
      parameter LINK_SLCID = 0,
      parameter c_MAX_NUM_SL = 3 //primary + neighboring
      
      )
    (
     input logic 		   clock,
     input logic 		   rst,
     input logic [MTC2SL_LEN-1:0]  mtc_in[c_MAX_NUM_SL],
     output logic [MTC2SL_LEN-1:0] mtc2sl
     );

   function bit_offset(logic [c_MAX_NUM_SL-1:0]  a);
      for(integer i = 0; i < c_MAX_NUM_SL; i=i+1)
	begin
	   if (a[i] == 1) return i;	   
	end
      return c_MAX_NUM_SL;
      
   endfunction // bit_offset
   
   typedef struct packed {
      logic [0:0] datavalid;
      logic [106:0] common;
      logic [13:0]  mdt_etamdt_eta;
      logic [7:0]   mdt_ptmdt_pt;
      logic [3:0]   mdt_ptthreshmdt_ptthresh;
      logic [0:0]   mdt_chargemdt_charge;
      logic [3:0]   mdt_procflagsmdt_procflags;
      logic [1:0]   mdt_nsegmentsmdt_nsegments;
      logic [2:0]   mdt_qualitymdt_quality;
      logic [48:0]  m_reservedm_reserved;
   } MTC2SL_rt;
   
   typedef struct   packed {
      logic [31:0]  headerheader;
      logic [2:0]   slcid;
      logic [0:0]   tcsenttcsent;
      logic [13:0]  posetaposeta;
      logic [8:0]   posphiposphi;
      logic [7:0]   sl_ptsl_pt;
      logic [3:0]   sl_ptthreshsl_ptthresh;
      logic [0:0]   sl_chargesl_charge;
      logic [2:0]   cointypecointype;
      logic [31:0]  trailer;
   } SLC_COMMON_rt;
   
   typedef struct   packed {   
      logic [5:0]   t_reservedt_reserved;
      logic [7:0]   crccrc;
      logic [3:0]   fiberidfiberid;
      logic [5:0]   slid;
      logic [7:0]   commacomma;
   } SL_TRAILER_rt;
   
   logic [MTC2SL_LEN-1:0] mtc_in_d[c_MAX_NUM_SL];   
   MTC2SL_rt           mtc_in_rt[c_MAX_NUM_SL];
   SLC_COMMON_rt mtc_slc_common[c_MAX_NUM_SL];
   SL_TRAILER_rt     mtc_sl_trailer[c_MAX_NUM_SL];

   logic [c_MAX_NUM_SL-1:0] 		 link_valid_map;
   logic [$bits(c_MAX_NUM_SL)+1 : 0] 	 valid_mtc;
   genvar 				 i;
   logic [$bits(c_MAX_NUM_SL)-1:0] 	 j;
   logic 				 mtc_in_vld[c_MAX_NUM_SL];
   
     
   for( i = 0; i < c_MAX_NUM_SL; i = i+1)
     begin
	assign mtc_in_rt[i]              = mtc_in[i];
	assign mtc_slc_common[i] = mtc_in_rt[i].common;
	assign mtc_sl_trailer[i]       = mtc_slc_common[i].trailer;
	assign mtc_in_vld[i]           = mtc_in_rt[i].datavalid;
	
     end

   //assign valid_mtc = bit_offset(link_valid_map);

   always_comb
     begin
	case (link_valid_map)
	  1:
	    valid_mtc = 0;
	  2:
	    valid_mtc = 1;
	  4:
	    valid_mtc = 2;
	  default:
	    valid_mtc = 15;//Error
	endcase // case (link_valid)
     end
   
   always @ (posedge clock)
     begin
	if(rst)
	  begin
	     mtc2sl               <= 'b0;
	     link_valid_map <= 'b0;
	     for(  j = 0; j < c_MAX_NUM_SL; j = j+1)
	       begin
		  mtc_in_d[j]           <= 'b0;
	       end
	  end
	else
	  begin
	     for( j= 0; j < c_MAX_NUM_SL; j = j+1)
	       begin
		  mtc_in_d[j] <= mtc_in[j];
		  
		  if(mtc_in_vld[j] == 1'b1)
		    begin
		    //   $display("SAIRAM mtc_slc_common[%d] = 0x%h, mtc_sl_trailer[%d]=0x%h",j,mtc_slc_common[j],j, mtc_sl_trailer[j]);
		       $display("{%d,%d},mtc_slc_common[%d].slcid = 0x%h, mtc_sl_trailer[%d].slid = 0x%h", LINK_SLCID, LINK_SLID,j, mtc_slc_common[j].slcid, j,mtc_sl_trailer[j].slid);
		       
		       if(mtc_slc_common[j].slcid == LINK_SLCID && mtc_sl_trailer[j].slid == LINK_SLID)
			 link_valid_map[j] <= 1'b1;
		       else
			 link_valid_map[j] <= 1'b0;		  
		    end		  
		  else
		    link_valid_map[j] <= 1'b0;		  
	       end // for ( j= 0; j < c_MAX_NUM_SL; j = j+1)
	     

	     //mtc2sl  <= mtc_in_d[valid_mtc];
	     mtc2sl  <= (valid_mtc != 15)? mtc_in_d[valid_mtc] : 0; //FIX THIS
	  end
     end
   
endmodule // mtc_link_map

     

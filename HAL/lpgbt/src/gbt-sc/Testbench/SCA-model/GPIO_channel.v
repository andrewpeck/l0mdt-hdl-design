`include "gpio_defines.v"
`timescale 1ns / 1ps
module gpio_top_iostate(
	wb_clk_in, wb_rst_in, wb_cyc_in, wb_adr_in, wb_dat_in, wb_sel_in, wb_we_in, wb_stb_in,
	wb_dat_out_i, wb_dat_out_o, wb_ack_out_i, wb_ack_out_o, wb_err_out_i, wb_err_out_o, 
	wb_inta_out_i, wb_inta_out_o, GPIO_ext_pad_out_i, GPIO_ext_pad_out_o, GPIO_ext_pad_in,
	//aux_in, //rgpio_aux_i, //rgpio_aux_o, 
	GPIO_ext_padOE_out, GPIO_clk_pad_in , rgpio_ctrl_i, rgpio_ctrl_o, rgpio_out_i, rgpio_out_o, rgpio_oe_i, 
	rgpio_oe_o, rgpio_inte_i, rgpio_inte_o, rgpio_ptrig_i, rgpio_ptrig_o, 
	rgpio_eclk_i, rgpio_eclk_o, rgpio_nec_i, rgpio_nec_o, sync_i, sync_o, GPIO_ext_pad_s_i, GPIO_ext_pad_s_o, 
	rgpio_in_i, rgpio_in_o, sync_clk_i, sync_clk_o, clk_s_i, clk_s_o, clk_r_i, clk_r_o, 
	pextc_sampled_i, pextc_sampled_o, rgpio_ints_i, rgpio_ints_o);


parameter dw = 32;
parameter aw = `GPIO_ADDRHH+1;
parameter gw = `GPIO_IOS;

input            	wb_clk_in;	
input            	wb_ack_out_i;	
input            	wb_err_out_i;	
input	  [gw-1:0]	rgpio_ints_i;	
//input	  [gw-1:0]  	aux_in;		
input   [gw-1:0]  	pextc_sampled_i;  
input                   clk_r_i;
input 		        clk_s_i;
input 	      		sync_clk_i;
input	[gw-1:0]	rgpio_in_i;	
input [gw-1:0]	GPIO_ext_pad_s_i;
input [gw-1:0]	sync_i;
input	[gw-1:0]	rgpio_nec_i;	
input	[gw-1:0]	rgpio_eclk_i;	
//input	[gw-1:0]	rgpio_aux_i;	
input	[gw-1:0]	rgpio_ptrig_i;	
input	[gw-1:0]	rgpio_inte_i;	
input	[gw-1:0]	rgpio_oe_i;	
input	[gw-1:0]	rgpio_out_i;	
input	[1:0]		rgpio_ctrl_i;	
input   [gw-1:0] 	GPIO_ext_pad_in;   
input            	GPIO_clk_pad_in;   
input            	wb_rst_in;    
input            	wb_cyc_in;    
input   [aw-1:0] 	wb_adr_in;	
input   [dw-1:0] 	wb_dat_in;	
input	  [3:0]  	wb_sel_in;  
input           	wb_we_in;     
input           	wb_stb_in;    
output  [dw-1:0]	wb_dat_out_o;
output          	wb_ack_out_o;
output          	wb_err_out_o;
output	[gw-1:0]	rgpio_ints_o;
output            	wb_inta_out_o;
input            	wb_inta_out_i;	
input  [dw-1:0]  	wb_dat_out_i;	
output   [gw-1:0]	pextc_sampled_o;
output  clk_r_o;
output  clk_s_o;
output  sync_clk_o;
output	[gw-1:0]	rgpio_in_o;
output   [gw-1:0]       GPIO_ext_pad_s_o;
output   [gw-1:0]       sync_o;
output	[gw-1:0]	rgpio_nec_o;
output	[gw-1:0]	rgpio_eclk_o;
//output	[gw-1:0]	rgpio_aux_o;
output	[gw-1:0]	rgpio_ptrig_o;
output	[gw-1:0]	rgpio_inte_o;
output	[gw-1:0]	rgpio_oe_o;
output	[gw-1:0]	rgpio_out_o;
output	[1:0]		rgpio_ctrl_o;
output  [gw-1:0]	 GPIO_ext_pad_out_o;
input  [gw-1:0] 	GPIO_ext_pad_out_i; 
output  [gw-1:0]	 GPIO_ext_padOE_out;
	
reg	[gw-1:0]	rgpio_in_o;
reg	[gw-1:0]	rgpio_out_o;
reg	[gw-1:0]	rgpio_oe_o;
reg	[gw-1:0]	rgpio_inte_o;
reg	[gw-1:0]	rgpio_ptrig_o;
//reg	[gw-1:0]	rgpio_aux_o;
reg	[1:0]		rgpio_ctrl_o;
reg	[gw-1:0]	rgpio_ints_o;
reg	[gw-1:0]	rgpio_eclk_o;
reg	[gw-1:0]	rgpio_nec_o;
reg   [gw-1:0]          sync_o;
reg   [gw-1:0]	        GPIO_ext_pad_s_o;
reg   [dw-1:0]	       wb_dat;   
reg           	       wb_ack_out_o; 
reg           	       wb_err_out_o; 
reg           	       wb_inta_out_o;  
reg   [dw-1:0]	       wb_dat_out_o;
reg   [gw-1:0]	       GPIO_ext_pad_out_o; 
reg   [gw-1:0]	       pextc_sampled_o;
reg   [gw-1:0]		nextc_sampled; 
reg  sync_clk_o;
reg  clk_s_o;
reg  clk_r_o;



wire            rgpio_out_sel;  
wire            rgpio_oe_sel; 
wire            rgpio_inte_sel; 
wire            rgpio_ptrig_sel;
//wire          rgpio_aux_sel;  
wire            rgpio_ctrl_sel; 
wire            rgpio_ints_sel; 
wire            rgpio_eclk_sel ;
wire            rgpio_nec_sel ;
wire            full_decoding;  
wire  [gw-1:0]  in_muxed; 
wire            wb_ack;   
wire            wb_err;   
wire            wb_inta; 
wire  [gw-1:0]  out_pad; 
wire  [gw-1:0]  extc_in;  
wire  [gw-1:0]  pext_clk; 

wire 		pedge;
wire 		nedge;
wire [gw-1:0] 	pedge_vec;
wire [gw-1:0] 	nedge_vec;
wire [gw-1:0] 	in_lach;

assign pedge =  clk_s_i & !clk_r_i ; 
assign nedge = !clk_s_i &  clk_r_i ; 
assign pedge_vec = {gw{pedge}} ;   
assign nedge_vec = {gw{nedge}} ;   
assign in_lach = (~rgpio_nec_i & pedge_vec) | (rgpio_nec_i & nedge_vec) ;
assign extc_in = (in_lach & GPIO_ext_pad_s_i) | (~in_lach & pextc_sampled_i) ;
 	
assign full_decoding = (wb_adr_in[`GPIO_ADDRHH:`GPIO_ADDRHL] == {`GPIO_ADDRHH-`GPIO_ADDRHL+1{1'b0}}) & (wb_adr_in[`GPIO_ADDRLH:`GPIO_ADDRLL] == {`GPIO_ADDRLH-`GPIO_ADDRLL+1{1'b0}});
assign rgpio_out_sel = wb_cyc_in & wb_stb_in & (wb_adr_in[`GPIO_OFS_BITS] == `GPIO_RGPIO_OUT) & full_decoding;
assign rgpio_oe_sel = wb_cyc_in & wb_stb_in & (wb_adr_in[`GPIO_OFS_BITS] == `GPIO_RGPIO_OE) & full_decoding;
assign rgpio_inte_sel = wb_cyc_in & wb_stb_in & (wb_adr_in[`GPIO_OFS_BITS] == `GPIO_RGPIO_INTE) & full_decoding;
assign rgpio_ptrig_sel = wb_cyc_in & wb_stb_in & (wb_adr_in[`GPIO_OFS_BITS] == `GPIO_RGPIO_PTRIG) & full_decoding;
//assign rgpio_aux_sel = wb_cyc_in & wb_stb_in & (wb_adr_in[`GPIO_OFS_BITS] == `GPIO_RGPIO_AUX) & full_decoding;
assign rgpio_ctrl_sel = wb_cyc_in & wb_stb_in & (wb_adr_in[`GPIO_OFS_BITS] == `GPIO_RGPIO_CTRL) & full_decoding;
assign rgpio_ints_sel = wb_cyc_in & wb_stb_in & (wb_adr_in[`GPIO_OFS_BITS] == `GPIO_RGPIO_INTS) & full_decoding;
assign rgpio_eclk_sel = wb_cyc_in & wb_stb_in & (wb_adr_in[`GPIO_OFS_BITS] == `GPIO_RGPIO_ECLK) & full_decoding;
assign rgpio_nec_sel = wb_cyc_in & wb_stb_in & (wb_adr_in[`GPIO_OFS_BITS] == `GPIO_RGPIO_NEC) & full_decoding;
assign wb_ack = wb_cyc_in & wb_stb_in & !wb_err_out_i;
assign wb_err = wb_cyc_in & wb_stb_in & !full_decoding;


always @(posedge wb_clk_in or posedge wb_rst_in) begin
	if (wb_rst_in)
		wb_ack_out_o <= #1 1'b0;
	else
		wb_ack_out_o <= #1 wb_ack & ~wb_ack_out_i & (!wb_err) ;
end

always @(posedge wb_clk_in or posedge wb_rst_in) begin
	if (wb_rst_in)
		wb_err_out_o <= #1 1'b0;
	else
		wb_err_out_o <= #1 wb_err & ~wb_err_out_i;
end

always @(posedge wb_clk_in or posedge wb_rst_in) begin
	if (wb_rst_in)
		rgpio_ctrl_o <= #1 2'b0;
	else if (rgpio_ctrl_sel && wb_we_in)
		rgpio_ctrl_o <= #1 wb_dat_in[1:0];
	else if (rgpio_ctrl_i[`GPIO_RGPIO_CTRL_INTE])
		rgpio_ctrl_o[`GPIO_RGPIO_CTRL_INTS] <= #1 rgpio_ctrl_i[`GPIO_RGPIO_CTRL_INTS] | wb_inta_out_i;
	else 
		rgpio_ctrl_o <= #1 rgpio_ctrl_i;
end


always @(posedge wb_clk_in or posedge wb_rst_in) begin
	if (wb_rst_in)
		rgpio_out_o <= #1 {gw{1'b0}};
	else begin
	   rgpio_out_o <= #1 rgpio_out_i;
	   if (rgpio_out_sel && wb_we_in)
	   begin
	     if ( wb_sel_in [3] == 1'b1 )
	       rgpio_out_o [gw-1:24] <= #1 wb_dat_in [gw-1:24] ;
	     if ( wb_sel_in [2] == 1'b1 )
	       rgpio_out_o [23:16] <= #1 wb_dat_in [23:16] ;
	     if ( wb_sel_in [1] == 1'b1 )
	       rgpio_out_o [15:8] <= #1 wb_dat_in [15:8] ;
	     if ( wb_sel_in [0] == 1'b1 )
	       rgpio_out_o [7:0] <= #1 wb_dat_in [7:0] ;
	   end
	end 	
end


always @(posedge wb_clk_in or posedge wb_rst_in) begin
    if (wb_rst_in)
     	    rgpio_oe_o <= #1 {gw{1'b0}};
    else begin
    	rgpio_oe_o <= #1 rgpio_oe_i;
    	if (rgpio_oe_sel && wb_we_in)
	begin
	    if ( wb_sel_in [3] == 1'b1 )
	      rgpio_oe_o [gw-1:24] <= #1 wb_dat_in [gw-1:24] ;
	    if ( wb_sel_in [2] == 1'b1 )
	      rgpio_oe_o [23:16] <= #1 wb_dat_in [23:16] ;
	    if ( wb_sel_in [1] == 1'b1 )
	      rgpio_oe_o [15:8] <= #1 wb_dat_in [15:8] ;
	    if ( wb_sel_in [0] == 1'b1 )
	      rgpio_oe_o [7:0] <= #1 wb_dat_in [7:0] ;
  	end
    end
end


always @(posedge wb_clk_in or posedge wb_rst_in) begin
	if (wb_rst_in)
		rgpio_inte_o <= #1 {gw{1'b0}};
	else begin
		rgpio_inte_o <= #1 rgpio_inte_i;
		if (rgpio_inte_sel && wb_we_in)
   	     	begin
   	     	     if ( wb_sel_in [3] == 1'b1 )
   	     	       rgpio_inte_o [gw-1:24] <= #1 wb_dat_in [gw-1:24] ;
   	     	     if ( wb_sel_in [2] == 1'b1 )
   	     	       rgpio_inte_o [23:16] <= #1 wb_dat_in [23:16] ;
   	     	     if ( wb_sel_in [1] == 1'b1 )
   	     	       rgpio_inte_o [15:8] <= #1 wb_dat_in [15:8] ;
   	     	     if ( wb_sel_in [0] == 1'b1 )
   	     	       rgpio_inte_o [7:0] <= #1 wb_dat_in [7:0] ;
   	     	end
	end
end


always @(posedge wb_clk_in or posedge wb_rst_in) begin
	if (wb_rst_in)
		rgpio_ptrig_o <= #1 {gw{1'b0}};
	else begin
	    rgpio_ptrig_o <= #1 rgpio_ptrig_i;
	    if (rgpio_ptrig_sel && wb_we_in)
 	    begin
 	       if ( wb_sel_in [3] == 1'b1 )
 	    	 rgpio_ptrig_o [gw-1:24] <= #1 wb_dat_in [gw-1:24] ;
 	       if ( wb_sel_in [2] == 1'b1 )
 	    	 rgpio_ptrig_o [23:16] <= #1 wb_dat_in [23:16] ;
 	       if ( wb_sel_in [1] == 1'b1 )
 	    	 rgpio_ptrig_o [15:8] <= #1 wb_dat_in [15:8] ;
 	       if ( wb_sel_in [0] == 1'b1 )
 	    	 rgpio_ptrig_o [7:0] <= #1 wb_dat_in [7:0] ;
 	     end
	end
end

  
//always @(posedge wb_clk_in or posedge wb_rst_in) begin
//	if (wb_rst_in)
//		rgpio_aux_o <= #1 {gw{1'b0}};
//	else begin
//	     rgpio_aux_o <= #1 rgpio_aux_i;
//	     if (rgpio_aux_sel && wb_we_in)
//	     begin
//	     	if ( wb_sel_in [3] == 1'b1 )
//	     	  rgpio_aux_o [gw-1:24] <= #1 wb_dat_in [gw-1:24] ;
//	     	if ( wb_sel_in [2] == 1'b1 )
//	     	  rgpio_aux_o [23:16] <= #1 wb_dat_in [23:16] ;
//	     	if ( wb_sel_in [1] == 1'b1 )
//	     	  rgpio_aux_o [15:8] <= #1 wb_dat_in [15:8] ;
//	     	if ( wb_sel_in [0] == 1'b1 )
//	     	  rgpio_aux_o [7:0] <= #1 wb_dat_in [7:0] ;
//	      end
//	end
//end


always @(posedge wb_clk_in or posedge wb_rst_in) begin
	if (wb_rst_in)
		rgpio_eclk_o <= #1 {gw{1'b0}};
	else begin
		rgpio_eclk_o <= #1 rgpio_eclk_i;
	      	if (rgpio_eclk_sel && wb_we_in)
	      	begin
	     	 if ( wb_sel_in [3] == 1'b1 )
	     	   rgpio_eclk_o [gw-1:24] <= #1 wb_dat_in [gw-1:24] ;
	     	 if ( wb_sel_in [2] == 1'b1 )
	     	   rgpio_eclk_o [23:16] <= #1 wb_dat_in [23:16] ;
	     	 if ( wb_sel_in [1] == 1'b1 )
	     	   rgpio_eclk_o [15:8] <= #1 wb_dat_in [15:8] ;
	     	 if ( wb_sel_in [0] == 1'b1 )
	     	   rgpio_eclk_o [7:0] <= #1 wb_dat_in [7:0] ;
	       end
	end
end


always @(posedge wb_clk_in or posedge wb_rst_in) begin
	if (wb_rst_in)
		rgpio_nec_o <= #1 {gw{1'b0}};
	else begin
		rgpio_nec_o <= #1 rgpio_nec_i; 
		if (rgpio_nec_sel && wb_we_in)
  		begin
                     if ( wb_sel_in [3] == 1'b1 )
                     rgpio_nec_o [gw-1:24] <= #1 wb_dat_in [gw-1:24] ;
        	     if ( wb_sel_in [2] == 1'b1 )
                     rgpio_nec_o [23:16] <= #1 wb_dat_in [23:16] ;
        	     if ( wb_sel_in [1] == 1'b1 )
                     rgpio_nec_o [15:8] <= #1 wb_dat_in [15:8] ;
        	     if ( wb_sel_in [0] == 1'b1 )
                     rgpio_nec_o [7:0] <= #1 wb_dat_in [7:0] ;
   		end
	end 
end

always @(posedge wb_clk_in or posedge wb_rst_in) begin
  if (wb_rst_in) begin
    sync_o      <= #1 {gw{1'b0}} ; 
    GPIO_ext_pad_s_o <= #1 {gw{1'b0}} ; 
  end 
  else begin
    sync_o      <= #1 GPIO_ext_pad_in  ; 
    GPIO_ext_pad_s_o <= #1 sync_i       ; 
  end
end
  
always @(posedge wb_clk_in or posedge wb_rst_in) begin
	if (wb_rst_in)
		rgpio_in_o <= #1 {gw{1'b0}};
	else
		rgpio_in_o <= #1 in_muxed;
end




always @(posedge wb_clk_in or posedge wb_rst_in) begin
  if (wb_rst_in) begin
    sync_clk_o <= #1 1'b0 ;
    clk_s_o    <= #1 1'b0 ;
    clk_r_o    <= #1 1'b0 ;
  end 
  else begin
    sync_clk_o <= #1 GPIO_clk_pad_in ;
    clk_s_o    <= #1 sync_clk_i  ;
    clk_r_o    <= #1 clk_s_i     ;
  end
end


always @(posedge wb_clk_in or posedge wb_rst_in) begin
  if (wb_rst_in) begin
    pextc_sampled_o <= #1 {gw{1'b0}};
  end else begin
    pextc_sampled_o <= #1 extc_in ;
  end
end

assign in_muxed = (rgpio_eclk_i & pextc_sampled_i) | (~rgpio_eclk_i & GPIO_ext_pad_s_i) ;
 

always @(	wb_adr_in or rgpio_in_i or rgpio_out_i or rgpio_oe_i or rgpio_inte_i or 
		rgpio_ptrig_i /*or rgpio_aux_i*/ or rgpio_ctrl_i or rgpio_ints_i or rgpio_eclk_i or rgpio_nec_i) 
  begin
	case (wb_adr_in[`GPIO_OFS_BITS])	
    	`GPIO_RGPIO_OUT: begin
			wb_dat[dw-1:0] = rgpio_out_i;
		end
  
  		`GPIO_RGPIO_OE: begin
			wb_dat[dw-1:0] = rgpio_oe_i;
		end
  
  		`GPIO_RGPIO_INTE: begin
			wb_dat[dw-1:0] = rgpio_inte_i;
		end
  
  		`GPIO_RGPIO_PTRIG: begin
			wb_dat[dw-1:0] = rgpio_ptrig_i;   
		end
  
  		`GPIO_RGPIO_NEC: begin
			wb_dat[dw-1:0] = rgpio_nec_i;
		end
  
  		`GPIO_RGPIO_ECLK: begin
			wb_dat[dw-1:0] = rgpio_eclk_i;
		end
  
		//`GPIO_RGPIO_AUX: begin
		//	wb_dat[dw-1:0] = rgpio_aux_i;
		//end
  
  		`GPIO_RGPIO_CTRL: begin
			wb_dat[1:0] = rgpio_ctrl_i;
			wb_dat[dw-1:2] = {dw-2{1'b0}};
		end
  
  		`GPIO_RGPIO_INTS: begin
			wb_dat[dw-1:0] = rgpio_ints_i;
		end
  
		default: begin
			wb_dat[dw-1:0] = rgpio_in_i; 
		end
	endcase
end



always @(posedge wb_clk_in or posedge wb_rst_in) begin
	if (wb_rst_in)
		wb_dat_out_o <= #1 {dw{1'b0}};
	else
		wb_dat_out_o <= #1 wb_dat;
end


always @(posedge wb_clk_in or posedge wb_rst_in) begin
	if (wb_rst_in)
		rgpio_ints_o <= #1 {gw{1'b0}};
	else if (rgpio_ints_sel && wb_we_in)
		rgpio_ints_o <= #1 wb_dat_in[gw-1:0];
	else if (rgpio_ctrl_i[`GPIO_RGPIO_CTRL_INTE])
		rgpio_ints_o <= #1 (rgpio_ints_i | ((in_muxed ^ rgpio_in_i) & ~(in_muxed ^ rgpio_ptrig_i)) & rgpio_inte_i);
	else 
		rgpio_ints_o <= #1 rgpio_ints_i;
end


assign wb_inta = |rgpio_ints_i ? rgpio_ctrl_i[`GPIO_RGPIO_CTRL_INTE] : 1'b0;


always @(posedge wb_clk_in or posedge wb_rst_in) begin
	if (wb_rst_in)
		wb_inta_out_o <= #1 1'b0;
	else
		wb_inta_out_o <= #1 wb_inta;
end


assign GPIO_ext_padOE_out = rgpio_oe_i;
//assign out_pad = rgpio_out_i & ~rgpio_aux_i | aux_in & rgpio_aux_i;
assign out_pad = rgpio_out_i; //new

 
always @(posedge wb_clk_in or posedge wb_rst_in) begin
	if (wb_rst_in)
		GPIO_ext_pad_out_o <= #1 {gw{1'b0}};
	else
		GPIO_ext_pad_out_o <= #1 out_pad;
end


endmodule





module gpio_top_tri(
	wb_clk_i_1, wb_clk_i_2, wb_clk_i_3, wb_rst_i_1, wb_rst_i_2, wb_rst_i_3, wb_cyc_i_1, wb_cyc_i_2, wb_cyc_i_3, 
	wb_adr_i_1, wb_adr_i_2, wb_adr_i_3, wb_dat_i_1, wb_dat_i_2, wb_dat_i_3, wb_sel_i_1, wb_sel_i_2, wb_sel_i_3, 
	wb_we_i_1, wb_we_i_2, wb_we_i_3, wb_stb_i_1, wb_stb_i_2, wb_stb_i_3,
	wb_dat_o_1, wb_dat_o_2, wb_dat_o_3, wb_ack_o_1, wb_ack_o_2, wb_ack_o_3, wb_err_o_1, wb_err_o_2, wb_err_o_3, 
	wb_inta_o_1, wb_inta_o_2, wb_inta_o_3,
	//aux_i_1, aux_i_2, aux_i_3,
	GPIO_ext_pad_i_1, GPIO_ext_pad_i_2, GPIO_ext_pad_i_3, 
	GPIO_ext_pad_o_1, GPIO_ext_pad_o_2, GPIO_ext_pad_o_3, GPIO_ext_padOE_o_1, GPIO_ext_padOE_o_2, 
	GPIO_ext_padOE_o_3, GPIO_clk_pad_i_1, GPIO_clk_pad_i_2, GPIO_clk_pad_i_3 
);

parameter dw = 32;
parameter aw = `GPIO_ADDRHH+1;
parameter gw = `GPIO_IOS;

input             wb_clk_i_1, wb_clk_i_2, wb_clk_i_3;	
input             wb_rst_i_1, wb_rst_i_2, wb_rst_i_3;	
input             wb_cyc_i_1, wb_cyc_i_2, wb_cyc_i_3;	
input   [aw-1:0]	wb_adr_i_1, wb_adr_i_2, wb_adr_i_3;	
input   [dw-1:0]	wb_dat_i_1, wb_dat_i_2, wb_dat_i_3;	
input	  [3:0]     wb_sel_i_1, wb_sel_i_2, wb_sel_i_3;	
input             wb_we_i_1, wb_we_i_2, wb_we_i_3;	
input             wb_stb_i_1, wb_stb_i_2, wb_stb_i_3;	
output  [dw-1:0]  wb_dat_o_1, wb_dat_o_2, wb_dat_o_3;	
output            wb_ack_o_1, wb_ack_o_2, wb_ack_o_3;	
output            wb_err_o_1, wb_err_o_2, wb_err_o_3;	
output            wb_inta_o_1, wb_inta_o_2, wb_inta_o_3;	
//input	  [gw-1:0]  aux_i_1, aux_i_2, aux_i_3;		
input   [gw-1:0]  GPIO_ext_pad_i_1, GPIO_ext_pad_i_2, GPIO_ext_pad_i_3;	
input             GPIO_clk_pad_i_1, GPIO_clk_pad_i_2, GPIO_clk_pad_i_3;	
output  [gw-1:0]  GPIO_ext_pad_o_1, GPIO_ext_pad_o_2, GPIO_ext_pad_o_3;	
output  [gw-1:0]  GPIO_ext_padOE_o_1, GPIO_ext_padOE_o_2, GPIO_ext_padOE_o_3;

	wire wb_ack_o_1, wb_ack_o_2, wb_ack_o_3;
	wire wb_err_o_1, wb_err_o_2, wb_err_o_3;
	wire [1:0] rgpio_ctrl_1, rgpio_ctrl_2, rgpio_ctrl_3;
	wire [gw-1:0] rgpio_o_1, rgpio_o_2, rgpio_o_3;
	wire [gw-1:0] rgpio_oe_1, rgpio_oe_2, rgpio_oe_3;
	wire [gw-1:0] rgpio_inte_1, rgpio_inte_2, rgpio_inte_3;
	wire [gw-1:0] rgpio_ptrig_1, rgpio_ptrig_2, rgpio_ptrig_3;
	//wire [gw-1:0] rgpio_aux_1, rgpio_aux_2, rgpio_aux_3;
	wire [gw-1:0] rgpio_eclk_1, rgpio_eclk_2, rgpio_eclk_3;
	wire [gw-1:0] rgpio_nec_1, rgpio_nec_2, rgpio_nec_3;
	wire [gw-1:0] sync_1, sync_2, sync_3;
	wire [gw-1:0] GPIO_ext_pad_s_1, GPIO_ext_pad_s_2, GPIO_ext_pad_s_3;
	wire [gw-1:0] rgpio_i_1, rgpio_i_2, rgpio_i_3;
	wire sync_clk_1, sync_clk_2, sync_clk_3;
	wire clk_s_1, clk_s_2, clk_s_3;
	wire clk_r_1, clk_r_2, clk_r_3;
	wire [gw-1:0] pextc_sampled_1, pextc_sampled_2, pextc_sampled_3;
	wire [dw-1:0] wb_dat_o_1, wb_dat_o_2, wb_dat_o_3;
	wire [gw-1:0] rgpio_ints_1, rgpio_ints_2, rgpio_ints_3;
	wire wb_inta_o_1, wb_inta_o_2, wb_inta_o_3;
	wire [gw-1:0] GPIO_ext_pad_o_1, GPIO_ext_pad_o_2, GPIO_ext_pad_o_3;
	wire wb_ack_out;
	wire wb_err_out;
	wire [1:0] rgpio_ctrl;
	wire [gw-1:0] rgpio_out;
	wire [gw-1:0] rgpio_oe;
	wire [gw-1:0] rgpio_inte;
	wire [gw-1:0] rgpio_ptrig;
	//wire [gw-1:0] rgpio_aux;
	wire [gw-1:0] rgpio_eclk;
	wire [gw-1:0] rgpio_nec;
	wire [gw-1:0] sync;
	wire [gw-1:0] GPIO_ext_pad_s;
	wire [gw-1:0] rgpio_in;
	wire sync_clk;
	wire clk_s;
	wire clk_r;
	wire [gw-1:0] pextc_sampled;
	wire [dw-1:0] wb_dat_out;
	wire [gw-1:0] rgpio_ints;
	wire wb_inta_out;
	wire [gw-1:0] GPIO_ext_pad_out;

	gpio_top_iostate #(.dw(dw), .aw(aw), .gw(gw) ) gpio_top_iostate_1 (
	.wb_clk_in(wb_clk_i_1), .wb_rst_in(wb_rst_i_1), .wb_cyc_in(wb_cyc_i_1), .wb_adr_in(wb_adr_i_1), .wb_dat_in(wb_dat_i_1), .wb_sel_in(wb_sel_i_1), .wb_we_in(wb_we_i_1), .wb_stb_in(wb_stb_i_1),
	.wb_dat_out_i(wb_dat_o_1), .wb_dat_out_o(wb_dat_o_2), .wb_ack_out_i(wb_ack_o_1), .wb_ack_out_o(wb_ack_o_2), .wb_err_out_i(wb_err_o_1), .wb_err_out_o(wb_err_o_2), .wb_inta_out_i(wb_inta_o_1), .wb_inta_out_o(wb_inta_o_2),
	/*.aux_in(aux_i_1),.rgpio_aux_i(rgpio_aux_1), .rgpio_aux_o(rgpio_aux_2),*/
	.GPIO_ext_pad_in(GPIO_ext_pad_i_1), .GPIO_ext_pad_out_i(GPIO_ext_pad_o_1), .GPIO_ext_pad_out_o(GPIO_ext_pad_o_2), .GPIO_ext_padOE_out(GPIO_ext_padOE_o_1), .GPIO_clk_pad_in(GPIO_clk_pad_i_1), .rgpio_ctrl_i(rgpio_ctrl_1), .rgpio_ctrl_o(rgpio_ctrl_2), .rgpio_out_i(rgpio_o_1), .rgpio_out_o(rgpio_o_2), .rgpio_oe_i(rgpio_oe_1), .rgpio_oe_o(rgpio_oe_2), .rgpio_inte_i(rgpio_inte_1), .rgpio_inte_o(rgpio_inte_2), .rgpio_ptrig_i(rgpio_ptrig_1), .rgpio_ptrig_o(rgpio_ptrig_2), 
	.rgpio_eclk_i(rgpio_eclk_1), .rgpio_eclk_o(rgpio_eclk_2), .rgpio_nec_i(rgpio_nec_1), .rgpio_nec_o(rgpio_nec_2), .sync_i(sync_1), .sync_o(sync_2), .GPIO_ext_pad_s_i(GPIO_ext_pad_s_1), .GPIO_ext_pad_s_o(GPIO_ext_pad_s_2), .rgpio_in_i(rgpio_i_1), .rgpio_in_o(rgpio_i_2), .sync_clk_i(sync_clk_1), .sync_clk_o(sync_clk_2), .clk_s_i(clk_s_1), .clk_s_o(clk_s_2), .clk_r_i(clk_r_1), .clk_r_o(clk_r_2), .pextc_sampled_i(pextc_sampled_1), .pextc_sampled_o(pextc_sampled_2), .rgpio_ints_i(rgpio_ints_1), .rgpio_ints_o(rgpio_ints_2));

	gpio_top_iostate #(.dw(dw), .aw(aw), .gw(gw) ) gpio_top_iostate_2 (
	.wb_clk_in(wb_clk_i_2), .wb_rst_in(wb_rst_i_2), .wb_cyc_in(wb_cyc_i_2), .wb_adr_in(wb_adr_i_2), .wb_dat_in(wb_dat_i_2), .wb_sel_in(wb_sel_i_2), .wb_we_in(wb_we_i_2), .wb_stb_in(wb_stb_i_2),
	.wb_dat_out_i(wb_dat_o_2), .wb_dat_out_o(wb_dat_o_3), .wb_ack_out_i(wb_ack_o_2), .wb_ack_out_o(wb_ack_o_3), .wb_err_out_i(wb_err_o_2), .wb_err_out_o(wb_err_o_3), .wb_inta_out_i(wb_inta_o_2), .wb_inta_out_o(wb_inta_o_3),
	/*.aux_in(aux_i_2),.rgpio_aux_i(rgpio_aux_2), .rgpio_aux_o(rgpio_aux_3),*/
	.GPIO_ext_pad_in(GPIO_ext_pad_i_2), .GPIO_ext_pad_out_i(GPIO_ext_pad_o_2), .GPIO_ext_pad_out_o(GPIO_ext_pad_o_3), .GPIO_ext_padOE_out(GPIO_ext_padOE_o_2), .GPIO_clk_pad_in(GPIO_clk_pad_i_2), .rgpio_ctrl_i(rgpio_ctrl_2), .rgpio_ctrl_o(rgpio_ctrl_3), .rgpio_out_i(rgpio_o_2), .rgpio_out_o(rgpio_o_3), .rgpio_oe_i(rgpio_oe_2), .rgpio_oe_o(rgpio_oe_3), .rgpio_inte_i(rgpio_inte_2), .rgpio_inte_o(rgpio_inte_3), .rgpio_ptrig_i(rgpio_ptrig_2), .rgpio_ptrig_o(rgpio_ptrig_3), 
	.rgpio_eclk_i(rgpio_eclk_2), .rgpio_eclk_o(rgpio_eclk_3), .rgpio_nec_i(rgpio_nec_2), .rgpio_nec_o(rgpio_nec_3), .sync_i(sync_2), .sync_o(sync_3), .GPIO_ext_pad_s_i(GPIO_ext_pad_s_2), .GPIO_ext_pad_s_o(GPIO_ext_pad_s_3), .rgpio_in_i(rgpio_i_2), .rgpio_in_o(rgpio_i_3), .sync_clk_i(sync_clk_2), .sync_clk_o(sync_clk_3), .clk_s_i(clk_s_2), .clk_s_o(clk_s_3), .clk_r_i(clk_r_2), .clk_r_o(clk_r_3), .pextc_sampled_i(pextc_sampled_2), .pextc_sampled_o(pextc_sampled_3), .rgpio_ints_i(rgpio_ints_2), .rgpio_ints_o(rgpio_ints_3));




	gpio_top_iostate #(.dw(dw), .aw(aw), .gw(gw) ) gpio_top_iostate_3 (
	.wb_clk_in(wb_clk_i_3), .wb_rst_in(wb_rst_i_3), .wb_cyc_in(wb_cyc_i_3), .wb_adr_in(wb_adr_i_3), .wb_dat_in(wb_dat_i_3), .wb_sel_in(wb_sel_i_3), .wb_we_in(wb_we_i_3), .wb_stb_in(wb_stb_i_3),
	.wb_dat_out_i(wb_dat_o_3), .wb_dat_out_o(wb_dat_out), .wb_ack_out_i(wb_ack_o_3), .wb_ack_out_o(wb_ack_out), .wb_err_out_i(wb_err_o_3), .wb_err_out_o(wb_err_out), .wb_inta_out_i(wb_inta_o_3), .wb_inta_out_o(wb_inta_out),
	/*.aux_in(aux_i_3),.rgpio_aux_i(rgpio_aux_3), .rgpio_aux_o(rgpio_aux),*/
	.GPIO_ext_pad_in(GPIO_ext_pad_i_3), .GPIO_ext_pad_out_i(GPIO_ext_pad_o_3), .GPIO_ext_pad_out_o(GPIO_ext_pad_out), .GPIO_ext_padOE_out(GPIO_ext_padOE_o_3), .GPIO_clk_pad_in(GPIO_clk_pad_i_3), .rgpio_ctrl_i(rgpio_ctrl_3), .rgpio_ctrl_o(rgpio_ctrl), .rgpio_out_i(rgpio_o_3), .rgpio_out_o(rgpio_out), .rgpio_oe_i(rgpio_oe_3), .rgpio_oe_o(rgpio_oe), .rgpio_inte_i(rgpio_inte_3), .rgpio_inte_o(rgpio_inte), .rgpio_ptrig_i(rgpio_ptrig_3), .rgpio_ptrig_o(rgpio_ptrig), 
	.rgpio_eclk_i(rgpio_eclk_3), .rgpio_eclk_o(rgpio_eclk), .rgpio_nec_i(rgpio_nec_3), .rgpio_nec_o(rgpio_nec), .sync_i(sync_3), .sync_o(sync), .GPIO_ext_pad_s_i(GPIO_ext_pad_s_3), .GPIO_ext_pad_s_o(GPIO_ext_pad_s), .rgpio_in_i(rgpio_i_3), .rgpio_in_o(rgpio_in), .sync_clk_i(sync_clk_3), .sync_clk_o(sync_clk), .clk_s_i(clk_s_3), .clk_s_o(clk_s), .clk_r_i(clk_r_3), .clk_r_o(clk_r), .pextc_sampled_i(pextc_sampled_3), .pextc_sampled_o(pextc_sampled), .rgpio_ints_i(rgpio_ints_3), .rgpio_ints_o(rgpio_ints));


	majority_voter #(.WIDTH(22+gw-1+gw-1+gw-1+gw-1+gw-1+gw-1+gw-1+gw-1+gw-1+gw-1+gw-1+dw-1+gw-1+gw-1 -gw )) mv (
		.in1({wb_ack_o_2, wb_err_o_2, rgpio_ctrl_2, rgpio_o_2, rgpio_oe_2, rgpio_inte_2, rgpio_ptrig_2, /*rgpio_aux_2,*/ rgpio_eclk_2, rgpio_nec_2, sync_2, GPIO_ext_pad_s_2, rgpio_i_2, sync_clk_2, clk_s_2, clk_r_2, pextc_sampled_2, wb_dat_o_2, rgpio_ints_2, wb_inta_o_2, GPIO_ext_pad_o_2}),
		.in2({wb_ack_o_3, wb_err_o_3, rgpio_ctrl_3, rgpio_o_3, rgpio_oe_3, rgpio_inte_3, rgpio_ptrig_3, /*rgpio_aux_3,*/ rgpio_eclk_3, rgpio_nec_3, sync_3, GPIO_ext_pad_s_3, rgpio_i_3, sync_clk_3, clk_s_3, clk_r_3, pextc_sampled_3, wb_dat_o_3, rgpio_ints_3, wb_inta_o_3, GPIO_ext_pad_o_3}),
		.in3({wb_ack_out, wb_err_out, rgpio_ctrl, rgpio_out, rgpio_oe, rgpio_inte, rgpio_ptrig, /*rgpio_aux,*/ rgpio_eclk, rgpio_nec, sync, GPIO_ext_pad_s, rgpio_in, sync_clk, clk_s, clk_r, pextc_sampled, wb_dat_out, rgpio_ints, wb_inta_out, GPIO_ext_pad_out}),
		.out({wb_ack_o_1, wb_err_o_1, rgpio_ctrl_1, rgpio_o_1, rgpio_oe_1, rgpio_inte_1, rgpio_ptrig_1, /*rgpio_aux_1,*/ rgpio_eclk_1, rgpio_nec_1, sync_1, GPIO_ext_pad_s_1, rgpio_i_1, sync_clk_1, clk_s_1, clk_r_1, pextc_sampled_1, wb_dat_o_1, rgpio_ints_1, wb_inta_o_1, GPIO_ext_pad_o_1}),
		.err()
	);

endmodule



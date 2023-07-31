
////////////////////////////////////////////////////////////////////////////////////////////////////
// autogenerated file
// created by tb create on: 23-Jun-2023 (00:58:42)
// created by tb create for test: polmux
// Author:Priya Sundararajan
// Email:priya.sundararajan@cern.ch
////////////////////////////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 1ps
`default_nettype wire

import l0mdt_dataformats_svh::*;
module TopLevel_polmux #(
parameter DATA_WIDTH = 256, //65,
parameter FIFO_DEPTH = 6,
parameter N_OUTPUTS = 24,
parameter N_INPUTS = 24

) (
input wire clock,
input wire reset_n,
input wire [DATA_WIDTH-1:0] input_data [24],
output wire [DATA_WIDTH-1:0] output_data [24]
);

//
// Here define the signals to connect the input and output Spy+FIFO
// blocks with the input and output of the DUT.
// Here we define one for each of the FIFO signals, but the test
// creator should remove unnecessary signals.
//

wire BLOCK_input_write_enable [24];
wire [DATA_WIDTH-1:0] BLOCK_input_data [24];
wire BLOCK_input_read_enable [24];
wire BLOCK_input_almost_full [24];
wire BLOCK_input_empty [24];

wire BLOCK_output_write_enable [24];
wire [DATA_WIDTH-1:0] BLOCK_output_data [24];
wire BLOCK_output_read_enable [24];
wire BLOCK_output_almost_full [24];
wire BLOCK_output_empty [24];

//
// Input buffers
//
generate
   for(genvar i = 0; i < 24; i++)
      begin:input_spybuffers
         SpyBuffer #(
      .DATA_WIDTH_A(DATA_WIDTH),
      .DATA_WIDTH_B(DATA_WIDTH),
      .FC_FIFO_WIDTH(FIFO_DEPTH),
      .PASSTHROUGH(1)
      ) spybuffer (
            .rclock(clock),
            .wclock(clock),
            .rresetbar(reset_n),
            .wresetbar(reset_n),
            .write_data(input_data[i]),
            .write_enable(BLOCK_input_write_enable[i]),
            .read_data(BLOCK_input_data[i]),
            .read_enable(BLOCK_input_read_enable[i]),
            .almost_full(BLOCK_input_almost_full[i]),
            .empty(BLOCK_input_empty[i]),
            .freeze(1'b0),
            .playback(2'b0)
            );
      end
endgenerate // end input_spybuffers generate


// Here place the DUT block(s)

//logic [TDCPOLMUX2TAR_LEN-1:0] i_inn_tdc_hits[6];
// logic [TDCPOLMUX2TAR_LEN-1:0] i_mid_tdc_hits[6];
// logic [TDCPOLMUX2TAR_LEN-1:0] i_out_tdc_hits[6];
// logic [TDCPOLMUX2TAR_LEN-1:0] i_ext_tdc_hits[6];

// logic [TDCPOLMUX2TAR_LEN-1:0] o_inn_tdc_hits[6];
// logic [TDCPOLMUX2TAR_LEN-1:0] o_mid_tdc_hits[6];
// logic [TDCPOLMUX2TAR_LEN-1:0] o_out_tdc_hits[6];
// logic [TDCPOLMUX2TAR_LEN-1:0] o_ext_tdc_hits[6];

//parameter c_HPS_MAX_HP = 6;

// for(genvar i=0; i<c_HPS_MAX_HP;i=i+1)
// begin
   // assign i_inn_tdc_hits[i]   = BLOCK_input_data[i];
   // assign i_mid_tdc_hits[i]   = BLOCK_input_data[i + c_HPS_MAX_HP];
   // assign i_out_tdc_hits[i]   = BLOCK_input_data[i + 2*c_HPS_MAX_HP];
   // assign i_ext_tdc_hits[i]   = BLOCK_input_data[i + 3*c_HPS_MAX_HP];
// end

wire i_inn_tdc_hits = 1;

tb_polmux polmux_inst(
 			.clock(clock), // : in  l0mdt_control_rt;
 			 .reset(~reset_n)
// 			//    -- TDC Hits from Polmux
// 			//.i_inn_tdc_hits_av(i_inn_tdc_hits) // : in  tdcpolmux2tar_avt (c_HPS_MAX_HP_INN -1 downto 0);
// 			// .i_mid_tdc_hitsav(i_mid_tdc_hits), // : in  tdcpolmux2tar_avt (c_HPS_MAX_HP_MID -1 downto 0);
// 			// .i_out_tdc_hits_av(i_out_tdc_hits), // : in  tdcpolmux2tar_avt (c_HPS_MAX_HP_OUT -1 downto 0);
// 			// .i_ext_tdc_hits_av(i_ext_tdc_hits) // : in  tdcpolmux2tar_avt (c_HPS_MAX_HP_EXT -1 downto 0);
   
// 			// //-- to DAQ
// 			// .o_inn_tdc_hits_av(o_inn_tdc_hits), //  : out tdcpolmux2tar_avt(c_HPS_MAX_HP_INN -1 downto 0);
// 			// .o_mid_tdc_hits_av(o_mid_tdc_hits), //  : out tdcpolmux2tar_avt(c_HPS_MAX_HP_MID -1 downto 0);
// 			// .o_out_tdc_hits_av(o_out_tdc_hits), //  : out tdcpolmux2tar_avt(c_HPS_MAX_HP_OUT -1 downto 0);
// 			// .o_ext_tdc_hits_av(o_ext_tdc_hits) //  : out tdcpolmux2tar_avt(c_HPS_MAX_HP_EXT -1 downto 0);

 			);


//   begin
// 	  assign BLOCK_output_data[i][TDCPOLMUX2TAR_LEN-1:0]                      = o_inn_tdc_hits[i];
// 	  assign BLOCK_output_data[i][255:TDCPOLMUX2TAR_LEN]                      = 0;
// 	  assign BLOCK_output_write_enable[i]                                     = o_inn_tdc_hits[i][TDCPOLMUX2TAR_DATA_VALID_MSB];

// 	  assign BLOCK_output_data[i + c_HPS_MAX_HP][TDCPOLMUX2TAR_LEN-1:0]       = o_mid_tdc_hits[i];
// 	  assign BLOCK_output_data[i + c_HPS_MAX_HP][255:TDCPOLMUX2TAR_LEN]       = 0;
// 	  assign BLOCK_output_write_enable[i + c_HPS_MAX_HP]                      = o_mid_tdc_hits[i][TDCPOLMUX2TAR_DATA_VALID_MSB];

// 	  assign BLOCK_output_data[i + 2*c_HPS_MAX_HP][TDCPOLMUX2TAR_LEN-1:0]     = o_out_tdc_hits[i];
// 	  assign BLOCK_output_data[i + 2*c_HPS_MAX_HP][255:TDCPOLMUX2TAR_LEN]     = 0;
// 	  assign BLOCK_output_write_enable[i + 2*c_HPS_MAX_HP]                    = o_out_tdc_hits[i][TDCPOLMUX2TAR_DATA_VALID_MSB];

// 	  assign BLOCK_output_data[i + 3*c_HPS_MAX_HP][TDCPOLMUX2TAR_LEN-1:0]     = o_ext_tdc_hits[i];
// 	  assign BLOCK_output_data[i + 3*c_HPS_MAX_HP][255:TDCPOLMUX2TAR_LEN]     = 0;
// 	  assign BLOCK_output_write_enable[i + 3*c_HPS_MAX_HP]                    = o_ext_tdc_hits[i][TDCPOLMUX2TAR_DATA_VALID_MSB];


// 	  assign BLOCK_output_data[i + 4*c_HPS_MAX_HP][TAR2HPS_LEN-1:0]           = o_inn_tar_hits[i];	  
// 	  assign BLOCK_output_data[i + 4*c_HPS_MAX_HP][255:TAR2HPS_LEN]           = 0;
// 	  assign BLOCK_output_write_enable[i + 4*c_HPS_MAX_HP]                    = o_inn_tar_hits[i][TAR2HPS_DATA_VALID_MSB];


// 	  assign BLOCK_output_data[i + 5*c_HPS_MAX_HP][TAR2HPS_LEN-1:0]           = o_mid_tar_hits[i];	  
// 	  assign BLOCK_output_data[i + 5*c_HPS_MAX_HP][255:TAR2HPS_LEN]           = 0;
// 	  assign BLOCK_output_write_enable[i + 5*c_HPS_MAX_HP]                    = o_mid_tar_hits[i][TAR2HPS_DATA_VALID_MSB];

// 	  assign BLOCK_output_data[i + 6*c_HPS_MAX_HP][TAR2HPS_LEN-1:0]           = o_out_tar_hits[i];	  
// 	  assign BLOCK_output_data[i + 6*c_HPS_MAX_HP][255:TAR2HPS_LEN]           = 0;
// 	  assign BLOCK_output_write_enable[i + 6*c_HPS_MAX_HP]                    = o_out_tar_hits[i][TAR2HPS_DATA_VALID_MSB];

// 	  assign BLOCK_output_data[i + 7*c_HPS_MAX_HP][TAR2HPS_LEN-1:0]           = o_ext_tar_hits[i];	  
// 	  assign BLOCK_output_data[i + 7*c_HPS_MAX_HP][255:TAR2HPS_LEN]           = 0;
// 	  assign BLOCK_output_write_enable[i + 7*c_HPS_MAX_HP]                    = o_ext_tar_hits[i][TAR2HPS_DATA_VALID_MSB];





//   end


//
// Output buffers
//
generate
   for(genvar i = 0; i < 24; i++)
   begin:output_spybuffers
      SpyBuffer #(
         .DATA_WIDTH_A(DATA_WIDTH),
         .DATA_WIDTH_B(DATA_WIDTH),
         .FC_FIFO_WIDTH(FIFO_DEPTH),
         .PASSTHROUGH(1)
                  ) spybuffer (
            .rclock(clock),
            .wclock(clock),
            .rresetbar(reset_n),
            .wresetbar(reset_n),
            .write_data(BLOCK_output_data[i]),
            .write_enable(BLOCK_output_write_enable[i]),
            .read_data(output_data[i]),
            .read_enable(BLOCK_output_read_enable[i]),
            .almost_full(BLOCK_output_almost_full[i]),
            .empty(BLOCK_output_empty[i]),
            .freeze(1'b0),
            .playback(2'b0)
            );
   end
endgenerate // end output_spybuffers generate

endmodule // end TopLevel module definition


////////////////////////////////////////////////////////////////////////////////////////////////////
// autogenerated file
// created by tb create on: 01-Sep-2022 (19:47:01)
// created by tb create for test: ult_tar
// Author:Priya Sundararajan
// Email:priya.sundararajan@cern.ch
////////////////////////////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 1ps
`default_nettype wire

  import l0mdt_dataformats_svh::*;


module TopLevel_ult_tar #(
    parameter DATA_WIDTH = 256, //65,
    parameter FIFO_DEPTH = 6,
    parameter N_OUTPUTS = 48,
    parameter N_INPUTS = 24

) (
    input wire clock,
    input wire reset_n,
    input wire [DATA_WIDTH-1:0] input_data [24],
    output wire [DATA_WIDTH-1:0] output_data [48]
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

    wire BLOCK_output_write_enable [48];
    wire [DATA_WIDTH-1:0] BLOCK_output_data [48];
    wire BLOCK_output_read_enable [48];
    wire BLOCK_output_almost_full [48];
    wire BLOCK_output_empty [48];

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

    //
    // Here place the DUT block(s)
    //
   logic [255:0] dummy_mon[4];
   logic [TDCPOLMUX2TAR_LEN-1:0] i_inn_tdc_hits[6];
   logic [TDCPOLMUX2TAR_LEN-1:0] i_mid_tdc_hits[6];
   logic [TDCPOLMUX2TAR_LEN-1:0] i_out_tdc_hits[6];
   logic [TDCPOLMUX2TAR_LEN-1:0] i_ext_tdc_hits[6];

   logic [TDCPOLMUX2TAR_LEN-1:0] o_inn_tdc_hits[6];
   logic [TDCPOLMUX2TAR_LEN-1:0] o_mid_tdc_hits[6];
   logic [TDCPOLMUX2TAR_LEN-1:0] o_out_tdc_hits[6];
   logic [TDCPOLMUX2TAR_LEN-1:0] o_ext_tdc_hits[6];

   logic [TAR2HPS_LEN-1:0] 	 o_inn_tar_hits[6];
   logic [TAR2HPS_LEN-1:0] 	 o_mid_tar_hits[6];
   logic [TAR2HPS_LEN-1:0] 	 o_out_tar_hits[6];
   logic [TAR2HPS_LEN-1:0] 	 o_ext_tar_hits[6];
   
   parameter c_HPS_MAX_HP = 6;

   for(genvar i=0; i<c_HPS_MAX_HP;i=i+1)
     begin
	assign i_inn_tdc_hits[i]                    = BLOCK_input_data[i];
	assign i_mid_tdc_hits[i + c_HPS_MAX_HP]     = BLOCK_input_data[i + c_HPS_MAX_HP];       
	assign i_out_tdc_hits[i + 2*c_HPS_MAX_HP]   = BLOCK_input_data[i + 2*c_HPS_MAX_HP];
	assign i_ext_tdc_hits[i + 3*c_HPS_MAX_HP]   = BLOCK_input_data[i + 3*c_HPS_MAX_HP];
     end
   
   

   tb_mdt_tar mdt_tar_inst(
			   .clock(clock), // : in  l0mdt_control_rt;
			   .reset(~reset_n),
/* -----\/----- EXCLUDED -----\/-----
			.tar_inn_ctrl_v(64'b0), //        : in std_logic_vector; -- : in  TAR_CTRL_t;
			.tar_inn_mon_v(dummy_mon[0]), //        : out std_logic_vector;-- : out TAR_MON_t;
			.tar_mid_ctrl_v(64'b0), //        : in std_logic_vector; -- : in  TAR_CTRL_t;
			.tar_mid_mon_v(dummy_mon[1]), //         : out std_logic_vector;-- : out TAR_MON_t;
			.tar_out_ctrl_v(64'b0), //        : in std_logic_vector; -- : in  TAR_CTRL_t;
			.tar_out_mon_v(dummy_mon[2]), //         : out std_logic_vector;-- : out TAR_MON_t;
			.tar_ext_ctrl_v(64'b0),//        : in std_logic_vector; -- : in  TAR_CTRL_t;
			.tar_ext_mon_v(dummy_mon[3]), //         : out std_logic_vector;-- : out TAR_MON_t;
 -----/\----- EXCLUDED -----/\----- */
			//    -- TDC Hits from Polmux
			.i_inn_tdc_hits_av(i_inn_tdc_hits), // : in  tdcpolmux2tar_avt (c_HPS_MAX_HP_INN -1 downto 0);
			.i_mid_tdc_hits_av(i_mid_tdc_hits), // : in  tdcpolmux2tar_avt (c_HPS_MAX_HP_MID -1 downto 0);
			.i_out_tdc_hits_av(i_out_tdc_hits), // : in  tdcpolmux2tar_avt (c_HPS_MAX_HP_OUT -1 downto 0);
			.i_ext_tdc_hits_av(i_ext_tdc_hits), // : in  tdcpolmux2tar_avt (c_HPS_MAX_HP_EXT -1 downto 0);
		
			//-- to DAQ
			.o_inn_tdc_hits_av(o_inn_tdc_hits), //  : out tdcpolmux2tar_avt(c_HPS_MAX_HP_INN -1 downto 0);
			.o_mid_tdc_hits_av(o_mid_tdc_hits), //  : out tdcpolmux2tar_avt(c_HPS_MAX_HP_MID -1 downto 0);
			.o_out_tdc_hits_av(o_out_tdc_hits), //  : out tdcpolmux2tar_avt(c_HPS_MAX_HP_OUT -1 downto 0);
			.o_ext_tdc_hits_av(o_ext_tdc_hits), //  : out tdcpolmux2tar_avt(c_HPS_MAX_HP_EXT -1 downto 0);
			//-- outputs to h2s Tar
			.o_inn_tar_hits_av(o_inn_tar_hits), //  : out tar2hps_avt(c_HPS_MAX_HP_INN -1 downto 0);
			.o_mid_tar_hits_av(o_mid_tar_hits), //  : out tar2hps_avt(c_HPS_MAX_HP_MID -1 downto 0);
			.o_out_tar_hits_av(o_out_tar_hits), //  : out tar2hps_avt(c_HPS_MAX_HP_OUT -1 downto 0);
			.o_ext_tar_hits_av(o_ext_tar_hits), //  : out tar2hps_avt(c_HPS_MAX_HP_EXT -1 downto 0);

			.o_sump()//            : out std_logic
			);

     for(genvar i=0; i<c_HPS_MAX_HP;i=i+1)
       begin
	  assign BLOCK_output_data[i][TDCPOLMUX2TAR_LEN-1:0]                      = o_inn_tdc_hits[i];
	  assign BLOCK_output_data[i][255:TDCPOLMUX2TAR_LEN]                      = 0;
	  assign BLOCK_output_write_enable[i]                                     = o_inn_tdc_hits[i][TDCPOLMUX2TAR_DATA_VALID_MSB];

	  assign BLOCK_output_data[i + c_HPS_MAX_HP][TDCPOLMUX2TAR_LEN-1:0]       = o_mid_tdc_hits[i];
	  assign BLOCK_output_data[i + c_HPS_MAX_HP][255:TDCPOLMUX2TAR_LEN]       = 0;
	  assign BLOCK_output_write_enable[i + c_HPS_MAX_HP]                      = o_mid_tdc_hits[i][TDCPOLMUX2TAR_DATA_VALID_MSB];

	  assign BLOCK_output_data[i + 2*c_HPS_MAX_HP][TDCPOLMUX2TAR_LEN-1:0]     = o_out_tdc_hits[i];
	  assign BLOCK_output_data[i + 2*c_HPS_MAX_HP][255:TDCPOLMUX2TAR_LEN]     = 0;
	  assign BLOCK_output_write_enable[i + 2*c_HPS_MAX_HP]                    = o_out_tdc_hits[i][TDCPOLMUX2TAR_DATA_VALID_MSB];

	  assign BLOCK_output_data[i + 3*c_HPS_MAX_HP][TDCPOLMUX2TAR_LEN-1:0]     = o_ext_tdc_hits[i];
	  assign BLOCK_output_data[i + 3*c_HPS_MAX_HP][255:TDCPOLMUX2TAR_LEN]     = 0;
	  assign BLOCK_output_write_enable[i + 3*c_HPS_MAX_HP]                    = o_ext_tdc_hits[i][TDCPOLMUX2TAR_DATA_VALID_MSB];

	  
	  assign BLOCK_output_data[i + 4*c_HPS_MAX_HP][TAR2HPS_LEN-1:0]           = o_inn_tar_hits[i];	  
	  assign BLOCK_output_data[i + 4*c_HPS_MAX_HP][255:TAR2HPS_LEN]           = 0;
	  assign BLOCK_output_write_enable[i + 4*c_HPS_MAX_HP]                    = o_inn_tar_hits[i][TAR2HPS_DATA_VALID_MSB];


	  assign BLOCK_output_data[i + 5*c_HPS_MAX_HP][TAR2HPS_LEN-1:0]           = o_mid_tar_hits[i];	  
	  assign BLOCK_output_data[i + 5*c_HPS_MAX_HP][255:TAR2HPS_LEN]           = 0;
	  assign BLOCK_output_write_enable[i + 5*c_HPS_MAX_HP]                    = o_mid_tar_hits[i][TAR2HPS_DATA_VALID_MSB];

	  assign BLOCK_output_data[i + 6*c_HPS_MAX_HP][TAR2HPS_LEN-1:0]           = o_out_tar_hits[i];	  
	  assign BLOCK_output_data[i + 6*c_HPS_MAX_HP][255:TAR2HPS_LEN]           = 0;
	  assign BLOCK_output_write_enable[i + 6*c_HPS_MAX_HP]                    = o_out_tar_hits[i][TAR2HPS_DATA_VALID_MSB];

	  assign BLOCK_output_data[i + 7*c_HPS_MAX_HP][TAR2HPS_LEN-1:0]           = o_ext_tar_hits[i];	  
	  assign BLOCK_output_data[i + 7*c_HPS_MAX_HP][255:TAR2HPS_LEN]           = 0;
	  assign BLOCK_output_write_enable[i + 7*c_HPS_MAX_HP]                    = o_ext_tar_hits[i][TAR2HPS_DATA_VALID_MSB];



	  
	  
       end
   
    //
    // Output buffers
    //
   generate
      for(genvar i = 0; i < 48; i++)
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

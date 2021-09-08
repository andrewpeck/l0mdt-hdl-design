
////////////////////////////////////////////////////////////////////////////////////////////////////
// autogenerated file
// created by tb create on: 13-Aug-2021 (15:53:54)
// created by tb create for test: ucm
////////////////////////////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 1ps
`default_nettype wire

module TopLevel_ucm #(
    parameter DATA_WIDTH = 256, //65,
    parameter FIFO_DEPTH = 6,
    parameter N_OUTPUTS = 15,
    parameter N_INPUTS = 3

) (
    input wire clock,
    input wire reset_n,
    input wire [DATA_WIDTH-1:0] input_data [3],
    output wire [DATA_WIDTH-1:0] output_data [15]
);

    //
    // Here define the signals to connect the input and output Spy+FIFO
    // blocks with the input and output of the DUT.
    // Here we define one for each of the FIFO signals, but the test
    // creator should remove unnecessary signals.
    //

    wire BLOCK_input_write_enable [3];
    wire [DATA_WIDTH-1:0] BLOCK_input_data [3];
    wire BLOCK_input_read_enable [3];
    wire BLOCK_input_almost_full [3];
    wire BLOCK_input_empty [3];

    wire BLOCK_output_write_enable [15];
    wire [DATA_WIDTH-1:0] BLOCK_output_data [15];
    wire BLOCK_output_read_enable [15];
    wire BLOCK_output_almost_full [15];
    wire BLOCK_output_empty [15];


   parameter TB_c_MAX_NUM_SL  = 3;
   parameter TB_c_NUM_THREADS = 3;
   parameter TB_c_NUM_MTC     = 3;


   wire [SLC_RX_LEN-1 : 0] slc_rx[TB_c_MAX_NUM_SL];
   wire [SLC_RX_LEN-1 : 0] slc_null[TB_c_MAX_NUM_SL];
   wire [SLC_RX_LEN-1 : 0] slc_neighbor_null;
   wire [UCM2HPS_LEN-1 : 0] ucm2hps_inn[TB_c_MAX_NUM_SL];
   wire [UCM2HPS_LEN-1 : 0] ucm2hps_mid[TB_c_MAX_NUM_SL];
   wire [UCM2HPS_LEN-1 : 0] ucm2hps_out[TB_c_MAX_NUM_SL];
   wire [UCM2HPS_LEN-1 : 0] ucm2hps_ext[TB_c_MAX_NUM_SL];
   wire [UCM2PL_LEN-1 : 0]  ucm2pl[TB_c_MAX_NUM_SL];
    //
    // Input buffers
    //
    generate
       for(genvar i = 0; i < 3; i++)
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
	    assign slc_rx[i] = BLOCK_input_data[i];
	    assign slc_null[i] = 0;

         end // block: input_spybuffers

    endgenerate // end input_spybuffers generate

    //
    // Here place the DUT block(s)
    //
   assign slc_neighbor_null = slc_null[0];

   ucm_top_tb ucm_top_tb_inst(
			      .clk(clock),
			      .rst(~reset_n),
			      .glob_en(1'b1),
			      .i_slc_data_mainA_av(slc_rx),
			      .i_slc_data_mainB_av(slc_null),
			      .i_slc_data_neighborA_v(slc_neighbor_null),
			      .i_slc_data_neighborB_v(slc_neighbor_null),

			      .o_uCM2hps_inn_av(ucm2hps_inn),
			      .o_uCM2hps_mid_av(ucm2hps_mid),
			      .o_uCM2hps_out_av(ucm2hps_ext),
			      .o_uCM2hps_ext_av(ucm2hps_out),

			      .o_uCM2pl_av(ucm2pl)



			      );
    //
    // Output buffers
    //
   generate


      for(genvar i = 0; i < 15; i++)
        begin:output_spybuffers
	   if(i < 12)
	     assign BLOCK_output_data[i][DATA_WIDTH-1:UCM2HPS_LEN] = 0;
	   else
	     assign BLOCK_output_data[i][DATA_WIDTH-1:UCM2PL_LEN] = 0;
	   if(i < 3)
	     begin:ucm2hps
		assign BLOCK_output_data[i][UCM2HPS_LEN-1:0]          = ucm2hps_inn[i];
	     end
	   assign BLOCK_output_data[3][UCM2HPS_LEN-1:0]          = ucm2hps_mid[0];
	   assign BLOCK_output_data[4][UCM2HPS_LEN-1:0]          = ucm2hps_mid[1];
	   assign BLOCK_output_data[5][UCM2HPS_LEN-1:0]          = ucm2hps_mid[2];

	   assign BLOCK_output_data[6][UCM2HPS_LEN-1:0]          = ucm2hps_out[0];
	   assign BLOCK_output_data[7][UCM2HPS_LEN-1:0]          = ucm2hps_out[1];
	   assign BLOCK_output_data[8][UCM2HPS_LEN-1:0]          = ucm2hps_out[2];

	   assign BLOCK_output_data[9][UCM2HPS_LEN-1:0]          = ucm2hps_ext[0];
	   assign BLOCK_output_data[10][UCM2HPS_LEN-1:0]         = ucm2hps_ext[1];
	   assign BLOCK_output_data[11][UCM2HPS_LEN-1:0]         = ucm2hps_ext[2];

	   assign BLOCK_output_data[12][UCM2PL_LEN-1:0]          = ucm2pl[0];
	   assign BLOCK_output_data[13][UCM2PL_LEN-1:0]          = ucm2pl[1];
	   assign BLOCK_output_data[14][UCM2PL_LEN-1:0]          = ucm2pl[2];


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


////////////////////////////////////////////////////////////////////////////////////////////////////
// autogenerated file
// created by tb create on: 28-Jul-2022 (11:13:46)
// created by tb create for test: ult_ucm_pt_mpl_mtc
// Author:Priya Sundararajan
// Email:priya.sundararajan@cern.ch
////////////////////////////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 1ps
`default_nettype wire

   import l0mdt_dataformats_svh::*;
module TopLevel_ult_ucm_pt_mpl_mtc #(
    parameter DATA_WIDTH = 256, //65,
    parameter FIFO_DEPTH = 6,
    parameter N_OUTPUTS = 12,
    parameter N_INPUTS = 12

) (
    input wire clock,
    input wire reset_n,
    input wire [DATA_WIDTH-1:0] input_data [12],
    output wire [DATA_WIDTH-1:0] output_data [12]
);

    //
    // Here define the signals to connect the input and output Spy+FIFO
    // blocks with the input and output of the DUT.
    // Here we define one for each of the FIFO signals, but the test
    // creator should remove unnecessary signals.
    //

    wire BLOCK_input_write_enable [12];
    wire [DATA_WIDTH-1:0] BLOCK_input_data [12];
    wire BLOCK_input_read_enable [12];
    wire BLOCK_input_almost_full [12];
    wire BLOCK_input_empty [12];

    wire BLOCK_output_write_enable [12];
    wire [DATA_WIDTH-1:0] BLOCK_output_data [12];
    wire BLOCK_output_read_enable [12];
    wire BLOCK_output_almost_full [12];
    wire BLOCK_output_empty [12];

    //
    // Input buffers
    //
    generate
       for(genvar i = 0; i < 12; i++)
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
   localparam c_NUM_THREADS  = 3;
   localparam c_MAX_NUM_SL   = 3;
   localparam c_NUM_MTC      = 3;
   localparam c_PRIMARY_SL   = 3;
   
   logic [SLC_RX_LEN-1:0]     slc_rx[c_PRIMARY_SL-1:0];
   logic [SF2PTCALC_LEN-1 :0] inn_segments_av[c_NUM_THREADS-1:0];
   logic [SF2PTCALC_LEN-1 :0] out_segments_av[c_NUM_THREADS-1:0];
   logic [SF2PTCALC_LEN-1 :0] mid_segments_av[c_NUM_THREADS-1:0];
   logic [SF2PTCALC_LEN-1:0]  dummy_in[c_NUM_THREADS];   
 
   logic [MTC2SL_LEN-1:0] o_MTC[c_NUM_MTC-1:0];
   
   logic [UCM2HPS_LEN-1 :0] ucm2hps_inn[c_NUM_THREADS-1:0];
   logic [UCM2HPS_LEN-1 :0] ucm2hps_mid[c_NUM_THREADS-1:0];
   logic [UCM2HPS_LEN-1 :0] ucm2hps_out[c_NUM_THREADS-1:0];

   for (genvar i=0; i<3; i++)
     begin
	assign slc_rx[i] = BLOCK_input_data[i];	
     end

   for (genvar i=3; i<6; i++)
     begin
	assign inn_segments_av[i-3] = BLOCK_input_data[i];
	assign mid_segments_av[i-3] = BLOCK_input_data[i+3];
	assign out_segments_av[i-3] = BLOCK_input_data[i+6];
	assign dummy_in[i-3]        = 0;	
     end
   tb_ult_ucm_pt_mpl_mtc_primary tb_vhdl_inst
     (
      .clock(clock),
      .rst(~reset_n),
      .ttc_commands(),
      .i_main_primary_slc(slc_rx),
      .i_main_secondary_slc(),
      .i_plus_neighbor_slc(),
      .i_minus_neighbor_slc(),
      .inn_segments_av(inn_segments_av),
      .mid_segments_av(mid_segments_av),
      .out_segments_av(out_segments_av),
      .ext_segments_av(dummy_in),
      .o_MTC(o_MTC),
      .o_NSP(),
      .inn_slc_to_h2s_plin_av(ucm2hps_inn),
      .mid_slc_to_h2s_plin_av(ucm2hps_mid),
      .out_slc_to_h2s_plin_av(ucm2hps_out),
      .ext_slc_to_h2s_plin_av()
      );

    for (genvar i=0; i<3; i++)
	begin
	   assign BLOCK_output_data[i][MTC2SL_LEN-1:0] = o_MTC[i];
	   assign BLOCK_output_write_enable[i]         = o_MTC[i][MTC2SL_DATA_VALID_MSB];
	   assign BLOCK_output_data[i][255:MTC2SL_LEN] = 0;	   
	end

      for (genvar i=3; i<6; i++)
	begin
	   assign BLOCK_output_data[i][UCM2HPS_LEN-1:0] = ucm2hps_inn[i-3];
	   assign BLOCK_output_write_enable[i]          = ucm2hps_inn[i-3][UCM2HPS_DATA_VALID_MSB];
	   assign BLOCK_output_data[i][255:UCM2HPS_LEN] = 0;

	   assign BLOCK_output_data[i+3][UCM2HPS_LEN-1:0] = ucm2hps_mid[i-3];
	   assign BLOCK_output_write_enable[i+3]          = ucm2hps_mid[i-3][UCM2HPS_DATA_VALID_MSB];
	   assign BLOCK_output_data[i+3][255:UCM2HPS_LEN] = 0;	   

	   assign BLOCK_output_data[i+6][UCM2HPS_LEN-1:0] = ucm2hps_out[i-3];
	   assign BLOCK_output_write_enable[i+6]          = ucm2hps_out[i-3][UCM2HPS_DATA_VALID_MSB];
	   assign BLOCK_output_data[i+6][255:UCM2HPS_LEN] = 0;	   
	   
	end
   
   
    //
    // Output buffers
    //
   generate
      for(genvar i = 0; i < 12; i++)
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

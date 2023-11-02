
////////////////////////////////////////////////////////////////////////////////////////////////////
// autogenerated file
// created by tb create on: 02-Nov-2023 (10:30:05)
// created by tb create for test: polmux_tar
// Author:Priya Sundararajan
// Email:priya.sundararajan@cern.ch
////////////////////////////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 1ps
`default_nettype wire

   import l0mdt_dataformats_svh::*;
module TopLevel_polmux_tar #(
    parameter DATA_WIDTH = 256, //65,
    parameter FIFO_DEPTH = 6,
    parameter N_OUTPUTS = 48,
    parameter N_INPUTS = 480

) (
    input wire clock,
    input wire reset_n,
    input wire [DATA_WIDTH-1:0] input_data [480],
    output wire [DATA_WIDTH-1:0] output_data [48]
);

    //
    // Here define the signals to connect the input and output Spy+FIFO
    // blocks with the input and output of the DUT.
    // Here we define one for each of the FIFO signals, but the test
    // creator should remove unnecessary signals.
    //

    wire BLOCK_input_write_enable [480];
    wire [DATA_WIDTH-1:0] BLOCK_input_data [480];
    wire BLOCK_input_read_enable [480];
    wire BLOCK_input_almost_full [480];
    wire BLOCK_input_empty [480];

    wire BLOCK_output_write_enable [48];
    wire [DATA_WIDTH-1:0] BLOCK_output_data [48];
    wire BLOCK_output_read_enable [48];
    wire BLOCK_output_almost_full [48];
    wire BLOCK_output_empty [48];

    //
    // Input buffers
    //
    generate
       for(genvar i = 0; i < 480; i++)
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

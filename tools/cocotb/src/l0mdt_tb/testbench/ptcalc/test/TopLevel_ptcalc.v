
////////////////////////////////////////////////////////////////////////////////////////////////////
// autogenerated file
// created by tb create on: 01-Dec-2020 (14:29:10)
// created by tb create for test: ptcalc
////////////////////////////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 1ps
`default_nettype wire
`include "l0mdt_buses_constants.svh"

module TopLevel_ptcalc #(
    parameter DATA_WIDTH = 256, //65,
    parameter FIFO_DEPTH = 6,
    parameter N_OUTPUTS = 1,
    parameter N_INPUTS = 4

) (
    input wire clock,
    input wire reset_n,
    input wire [DATA_WIDTH-1:0] input_data [4],
    output wire [DATA_WIDTH-1:0] output_data [1]
);

    //
    // Here define the signals to connect the input and output Spy+FIFO
    // blocks with the input and output of the DUT.
    // Here we define one for each of the FIFO signals, but the test
    // creator should remove unnecessary signals.
    //

    wire BLOCK_input_write_enable [4];
    wire [DATA_WIDTH-1:0] BLOCK_input_data [4];
    wire BLOCK_input_read_enable [4];
    wire BLOCK_input_almost_full [4];
    wire BLOCK_input_empty [4];

    wire BLOCK_output_write_enable [1];
    wire [DATA_WIDTH-1:0] BLOCK_output_data [1];
    wire BLOCK_output_read_enable [1];
    wire BLOCK_output_almost_full [1];
    wire BLOCK_output_empty [1];

    //
    // Input buffers
    //
    generate
       for(genvar i = 0; i < 4; i++)
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
   wire [PTCALC2MTC_LEN-1:0] pt2mtc;
   wire [SF2PTCALC_LEN-1 :0] sf2pt_i;
   wire [SF2PTCALC_LEN-1 :0] sf2pt_m;
   wire [SF2PTCALC_LEN-1 :0] sf2pt_o;
   wire [PL2PTCALC_LEN-1 :0] pl2pt;

   assign sf2pt_i = BLOCK_input_data[0];
   assign sf2pt_m = BLOCK_input_data[1];
   assign sf2pt_o = BLOCK_input_data[2];
   assign pl2pt   = BLOCK_input_data[3];

   assign BLOCK_output_data[0][PTCALC2MTC_LEN-1:0]          = pt2mtc;
   assign BLOCK_output_data[0][DATA_WIDTH-1:PTCALC2MTC_LEN] = 0;
   assign BLOCK_output_write_enable[0]                      = pt2mtc[PTCALC2MTC_DATA_VALID_MSB];


   top_upt top_upt_inst(
			.clk(clock),
			.i_rst(~reset_n),
			.i_slc(pl2pt),
			.i_segment_i(sf2pt_i),
			.i_segment_m(sf2pt_m),
			.i_segment_o(sf2pt_o),
			.o_mtc(pt2mtc)
			);



    //
    // Output buffers
    //
   generate
      for(genvar i = 0; i < 1; i++)
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

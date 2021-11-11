
////////////////////////////////////////////////////////////////////////////////////////////////////
// autogenerated file
// created by tb create on: 01-Dec-2020 (06:28:54)
// created by tb create for test: lsf
////////////////////////////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 1ps
`default_nettype wire

  module TopLevel_lsf #(
			     parameter DATA_WIDTH = 256, //65,
			     parameter FIFO_DEPTH = 6,
			     parameter N_OUTPUTS = 1,
			     parameter N_INPUTS = 3

			     ) (
				input wire 		     clock,
				input wire 		     reset_n,
				input wire [DATA_WIDTH-1:0]  input_data [N_INPUTS],
				output wire [DATA_WIDTH-1:0] output_data [N_OUTPUTS]
				);

   //
   // Here define the signals to connect the input and output Spy+FIFO
   // blocks with the input and output of the DUT.
   // Here we define one for each of the FIFO signals, but the test
   // creator should remove unnecessary signals.
   //

   wire 						     BLOCK_input_write_enable [N_INPUTS];
   wire [DATA_WIDTH-1:0] 				     BLOCK_input_data [N_INPUTS];
   wire 						     BLOCK_input_read_enable [N_INPUTS];
   wire 						     BLOCK_input_almost_full [N_INPUTS];
   wire 						     BLOCK_input_empty [N_INPUTS];

   wire 						     BLOCK_output_write_enable [N_OUTPUTS];
   wire [DATA_WIDTH-1:0] 				     BLOCK_output_data [N_OUTPUTS];
   wire 						     BLOCK_output_read_enable [N_OUTPUTS];
   wire 						     BLOCK_output_almost_full [N_OUTPUTS];
   wire 						     BLOCK_output_empty [N_OUTPUTS];

   // +++++++ RTL specific +++++++
   // parameter MAX_MTC_PER_BCID  = 3;
   parameter MAX_HITS_PER_BCID  = 100;

   wire [HEG2SFHIT_LEN-1:0] 				     mdt_hit;
   wire 						     mdt_hit_we;
   wire [HEG2SFSLC_LEN-1:0] 				     roi;
   wire 						     roi_we;
   wire [SF2PTCALC_LEN -1:0] 				     lsf_output;
   wire 						     lsf_output_we;
   wire 						     tb_i_eof;

   //
   // Input buffers
   //
   generate
      for(genvar i = 0; i < N_INPUTS; i++)
        begin:input_spybuffers
           SpyBuffer #(
		       .DATA_WIDTH_A(DATA_WIDTH),
		       .DATA_WIDTH_B(DATA_WIDTH),
		       .SPY_MEM_WIDTH_A(7),
		       .SPY_MEM_WIDTH_B(7),
		       .EL_MEM_WIDTH(7),
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
   //First comes the roi (as defined in json config)
   assign roi = BLOCK_input_data[0];
   //check if empty
   assign roi_we = ~BLOCK_input_empty[0] & BLOCK_input_data[0][HEG2SFSLC_DATA_VALID_MSB];

   //Second comes the hit (as defined in json config)
   assign mdt_hit = BLOCK_input_data[1];
   assign mdt_hit_we = ~BLOCK_input_empty[1] & BLOCK_input_data[1][HEG2SFHIT_DATA_VALID_MSB];

   assign tb_i_eof = BLOCK_input_data[2] & 1;


   assign BLOCK_output_data[0][SF2PTCALC_LEN-1:0] = lsf_output;
   assign BLOCK_output_data[0][DATA_WIDTH-1:SF2PTCALC_LEN] = 0;
   assign BLOCK_output_write_enable[0] = lsf_output[SF2PTCALC_DATA_VALID_MSB];

   top_lsf lsf_inst(.clock(clock),
                    .reset(~reset_n),
                    .mdt_hit(mdt_hit),
                    .slc_roi(roi),
                    .lsf(lsf_output),
                    .hba_max_clocks(10'b0), //Unused, replaced by i_eof
                    .i_eof(tb_i_eof),
                    .sb_lsf_mdt_hits_freeze(1'b0),
                    .sb_lsf_mdt_hits_re(1'b0),
                    .sb_lsf_mdt_hits_raddr(8'b0),
                    .sb_lsf_mdt_hits_rdata());

   //
   // Output buffers
   //
   generate
      for(genvar i = 0; i < 1; i++)
        begin:output_spybuffers
           SpyBuffer #(
		       .DATA_WIDTH_A(DATA_WIDTH),
		       .DATA_WIDTH_B(DATA_WIDTH),
		       .SPY_MEM_WIDTH_A(7),
		       .SPY_MEM_WIDTH_B(7),
		       .EL_MEM_WIDTH(7),
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
				    .freeze(0),
				    .playback(0)
				    );
        end
   endgenerate // end output_spybuffers generate

endmodule // end TopLevel module definition

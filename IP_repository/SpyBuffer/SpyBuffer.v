// SpyBuffer.v
// Prototype of a a Spy Buffer for ATLAS TDAQ HTT Track Processor board.
// This is the main module/interface definition. The spy buffer consists of two
// components: a dual-clock FIFO and the actual "spy buffer" (referred to
// internally as a spy controller and/or spy memory) that stores data passing
// through the FIFO.

// Ben Rosser <bjr@sas.upenn.edu>

`default_nettype none

module SpyBuffer #(
    // The width of input data (e.g. 2^WIDTH bytes + 1 for metadata).
    parameter DATA_WIDTH = 64,

    // Width of the spy buffer's memory block. (e.g. 2^WIDTH rows of DATA_WIDTH size).
    parameter SPY_MEM_WIDTH = 7,

    // The width of the flow control buffer's memory.
    // If this is pushed to 5 or higher, block RAM will be inferred.
    // (Do we want that?)
    // (Presumably, the threshold coul also be adjusted!)
    parameter FC_FIFO_WIDTH = 3,

    // The size and width of the event list / metadata list memory.
    parameter EL_MEM_SIZE = 16,
    parameter EL_MEM_WIDTH = 4,

    // Passthrough mode setting. If PASSTHROUGH is set to 1, then we
    // will *not* instantiate the FIFO. Instead, input will be continually
    // assigned to output, the "almost_full" and "empty" wires will be
    // hardcoded to 1, and the enables will be ignored.
    parameter PASSTHROUGH = 0
) (

    // The read and write clocks, respectively.
    input wire rclock,
    input wire wclock,

    // TODO: we need another clock: the "spy access" clock
    // that will be used for a) reading the spy memory and b) writing it in playback mode.
    // Support for clock domain crossings will need to be added.

    // Read- and write-side resets. It may not be necessary to have two.
    input wire rreset,
    input wire wreset,

    // Inputs to the flow control FIFO.
    input wire [DATA_WIDTH:0] write_data,
    input wire write_enable,
    input wire read_enable,

    // Freeze the spy buffer.
    input wire freeze,

    // Playback toggle. See SpyProtocol.vh for the supported states.
    input wire [1:0] playback,

    // Write access to RAM for playback mode.
    input wire playback_write_enable,
    input wire [DATA_WIDTH:0] playback_write_data,

    // This is potentially a proxy for some more sophisticated readout mechanism.
    // (involving block transfer / direct access to the underlying RAM?)
    // For the mean time, it works perfectly well.
    input wire spy_read_enable,
    input wire spy_meta_read_enable,

    input wire [SPY_MEM_WIDTH-1:0] spy_read_addr,
    input wire [EL_MEM_WIDTH-1:0] spy_meta_read_addr,

    // The current values of the spy memory write pointers; can be used to measure
    // "how full" the spy memory is (and also, where to start reading from).
    output wire [EL_MEM_WIDTH-1:0] spy_meta_write_addr,
    output wire [SPY_MEM_WIDTH-1:0] spy_write_addr,

    // Outputs from the flow control FIFO.
    output wire [DATA_WIDTH:0] read_data,
    output wire almost_full,
    output wire empty,

    // Spy outputs.
    output wire [DATA_WIDTH:0] spy_data,
    output wire [SPY_MEM_WIDTH:0] spy_meta_read_data
);

    // Include the SpyProtocol.vh file.
    `include "SpyProtocol.vh"

    // Internal data read from the spy buffer.
    // In NO_PLAYBACK mode, this is connected to the outside world. In any playback state, it is not.
    wire [DATA_WIDTH:0] int_spy_data;

    // Internal signals for the playback controller. The "fc_" signals go to the flow control FIFO;
    // the "sb_" signals go to the spy controller. Which map to which depends on what state we're in.
    wire [DATA_WIDTH:0] fc_write_data;
    wire fc_write_enable;
    wire [DATA_WIDTH:0] sb_write_data;
    wire sb_write_enable;

    // Signals generated by the playback controller module. In PLAYBACK_ONCE and PLAYBACK_LOOP
    // states, this is used to drive the flow control FIFO. In PLAYBACK_WRITE, the "ram" versions
    // of these are used to drive the spy buffer.
    wire playback_enable;
    wire [DATA_WIDTH:0] playback_data;
    wire ram_write_enable;
    wire [DATA_WIDTH:0] ram_write_data;

    // Internal signals for reading from the spy buffer.
    // These either go to the outside or to the playback.
    wire [SPY_MEM_WIDTH-1:0] int_spy_read_addr;
    wire int_spy_read_enable;
    wire [SPY_MEM_WIDTH-1:0] playback_spy_read_addr;
    wire playback_spy_read_enable;

    // Spy playback controller. Lives in the write clock domain.
    SpyPlayback #(
        .DATAWIDTH(DATA_WIDTH),
        .MEMWIDTH(SPY_MEM_WIDTH)
    ) playbackControl (
        .clock(wclock),
        .reset(wreset),
        .full(almost_full),
        .playback(playback),
        .playback_enable(playback_enable),
        .playback_data(playback_data),
        .ram_write_enable_ext(playback_write_enable),
        .ram_write_data_ext(playback_write_data),
        .ram_write_enable(ram_write_enable),
        .ram_write_data(ram_write_data),
        .spy_read_addr(playback_spy_read_addr),
        .spy_read_enable(playback_spy_read_enable),
        .spy_read_data(int_spy_data),
        .spy_write_addr(spy_write_addr)
    );

    // Drive flow control FIFO from playback controller when we're in a playback state.
    assign fc_write_enable = (playback == NO_PLAYBACK) ? write_enable : playback_enable;
    assign fc_write_data = (playback == NO_PLAYBACK) ? write_data : playback_data;

    // Similarly, drive spy controller inputs directly from playback controller
    // when we're in a playback state. In PLAYBACK_WRITE, this will allow the RAM to be
    // written; in the other playback states, nothing will happen (equivalent to a freeze).
    assign sb_write_enable = (playback == NO_PLAYBACK) ? write_enable : ram_write_enable;
    assign sb_write_data = (playback == NO_PLAYBACK) ? write_data : ram_write_data;

    // Also allow the playback controller to read the spy memory in a playback state.
    assign int_spy_read_addr = (playback == NO_PLAYBACK) ? spy_read_addr : playback_spy_read_addr;
    assign int_spy_read_enable = (playback == NO_PLAYBACK) ? spy_read_enable : playback_spy_read_enable;

    // Only generate the flow control piece of the design if PASSTHROUGH
    // is not set (which, by default, it is not).
    generate
        if (PASSTHROUGH) begin
            // In passthrough mode, the enables are used as valid flags.
            assign empty = !fc_write_enable;
            assign almost_full = 0;
            assign read_data = fc_write_data;
        end else begin
            // Flow control buffer, provided by an aFifo. This is a block I took
            // from the HCCStar (ASIC designed for ITK strips). It could be replaced
            // with any other dual-clock FIFO implementation.
            aFifo #(
                .DSIZE(DATA_WIDTH+1),
                .ASIZE(FC_FIFO_WIDTH)
            ) buffer (
                .rdata(read_data),
                .wdata(fc_write_data),
                .rclk(rclock),
                .wclk(wclock),
                .rempty(empty),
                .walmostfull(almost_full),
                .wfull(),
                .ralmostempty(),
                .wrst_n(wreset),
                .rrst_n(rreset),
                .winc(fc_write_enable),
                .rinc(read_enable)
            );
        end
    endgenerate

    // This is the block that actually is the "spy controller".
    // It handles the "spy" part of the "spy buffer".
    // It wants to live in the write clock domain.

    // Note that with this naive implementation, there is no "spy memory"
    // readout block (everything's contained beneath the "spy controller").
    // In reality, possibly we would want that to live in the toplevel and
    // have some block transfer protocol thing, presumably powered by Xilinx
    // libraries.

    SpyController #(
        .DATAWIDTH(DATA_WIDTH),
        .MEMWIDTH(SPY_MEM_WIDTH),
        .METASIZE(EL_MEM_SIZE),
        .METAWIDTH(EL_MEM_WIDTH)
    ) spy (
        .clock(wclock),
        .reset(wreset),
        .freeze(freeze),
        .data_in(sb_write_data),
        .write_enable_in(sb_write_enable),
        .read_addr(int_spy_read_addr),
        .read_enable_in(int_spy_read_enable),
        .meta_read_enable(spy_meta_read_enable),
        .meta_read_addr(spy_meta_read_addr),
        .data_out(int_spy_data),
        .mem_wptr(spy_write_addr),
        .meta_write_addr(spy_meta_write_addr),
        .meta_read_data(spy_meta_read_data)
    );

    // This output doesn't need to be hooked up to the external pad in playback mode.
    assign spy_data = (playback != NO_PLAYBACK) ? 0 : int_spy_data;

endmodule
`default_nettype wire

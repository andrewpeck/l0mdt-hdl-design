// Spy playback controller block.
// When in playback mode, the spy buffer can read its contents into
// the associated flow control FIFO. This allows the spy buffer to be
// "played back" (ideally, after a block write to put known data into it).

// This block generates the relevant control signals for the spy buffer
// and spy FIFO to make this happen. Logic in SpyBuffer.v uses the
// outputs of this block

// Ben Rosser <bjr@sas.upenn.edu>

`default_nettype none

module SpyPlayback #(
    // Width of data being passed into the system, *without* extra metadata bit.
    parameter DATAWIDTH = 64,

    // Width of the spy buffer's spy memory. This is also the width of addresess.
    parameter MEMWIDTH = 6
) (
    input wire clock,
    input wire reset,

    // Is the flow control FIFO full?
    input wire full,

    // Are we in playback mode?
    input wire [1:0] playback,

    // Current write address in spy memory.
    input wire [MEMWIDTH-1:0] spy_write_addr,

    // Data read back from the spy memory, to pass through to the FIFO.
    input wire [DATAWIDTH:0] spy_read_data,

    // Direct-RAM access to spy memory from outside world.
    // Should this be passed through this block? I guess it depends where we implement
    // the clock domain crossing. I may revisit this in time.
    input wire ram_write_enable_ext,
    input wire [DATAWIDTH:0] ram_write_data_ext,

    // Outputs: control signals for FIFO.
    output reg playback_enable,
    output wire [DATAWIDTH:0] playback_data,

    // Outputs: control signals for playback write mode (RAM access).
    output reg ram_write_enable,
    output reg [DATAWIDTH:0] ram_write_data,

    // Outputs: control signal for spy memory.
    output reg spy_read_enable,
    output reg [MEMWIDTH-1:0] spy_read_addr
);

    // Initial playback address. This should likely be zero, but expose as parameter anyway.
    // Actually, it needs to be... well, this.
    localparam INITIAL_ADDR = 2**MEMWIDTH - 1;

    // Include the SpyProtocol.vh file.
    `include "SpyProtocol.vh"

    // It's been a while; I'm somewhat worried about the sequencing here.

    // We need a bit of internal state to know that we're actually running--
    // due to some synchronization issues around the first (and last!) word.
    // The edge case of "what if the write pointer == 0" makes it hard to do
    // this otherwise.
    reg running = 0;

    always @(posedge clock) begin
        // If we're in a reset state, OR if we're not in playback mode,
        // reset internal state (the playback address to 0).
        if (!reset || playback == NO_PLAYBACK) begin
            // Reset playback and spy signals.
            spy_read_addr <= INITIAL_ADDR;
            spy_read_enable <= 0;
            ram_write_enable <= 0;
            ram_write_data <= 0;
            running <= 0;
        end else begin
            // How playback works depends on which mode we're in. Currently there are two.
            case (playback)

                // In the stop state, loop through the memory once, from beginning to end,
                // and then stop. Wait for the external controller to reset.
                PLAYBACK_ONCE: begin
                    ram_write_enable <= 0;
                    ram_write_data <= 0;
                    if (full) begin
                        spy_read_enable <= 0;
                    end else begin
                        // We run until we hit the spy write address, at which point
                        // we are about to stop. At that point, set the running flag
                        // and stop!
                        if (running && spy_read_addr == spy_write_addr) begin
                            running <= 0;
                            spy_read_enable <= 0;
                        end else begin
                            running <= 1;
                            spy_read_enable <= 1;
                            spy_read_addr <= spy_read_addr + 1;
                        end
                    end
                end

                // In the loop state, loop through the memory continuously.
                // Note: we don't allow a different stop address. I think that's okay
                // as a prototype?
                PLAYBACK_LOOP: begin
                    ram_write_enable <= 0;
                    ram_write_data <= 0;

                    if (full) begin
                        spy_read_enable <= 0;
                    end else begin
                        // We run until we are about to hit the spy write address,
                        // at which point we loop back to address zero but otherwise keep going.
                        running <= 1;
                        spy_read_enable <= 1;
                        if (running && spy_read_addr + 1 == spy_write_addr) begin
                            spy_read_addr <= 0;
                        end else begin
                            spy_read_addr <= spy_read_addr + 1;
                        end
                    end
                end

                // In this mode: do nothing. This mode stops reads into the FIFO
                // and stops the spy decision block from writing, while allowing the user
                // to write into the spy memory.
                PLAYBACK_WRITE: begin
                    spy_read_addr <= INITIAL_ADDR;
                    spy_read_enable <= 0;
                    // TODO support clock domain crossing for these signals!
                    // Not sure if that should live in this module or in SpyBuffer.v.
                    ram_write_enable <= ram_write_enable_ext;
                    ram_write_data <= ram_write_data_ext;
                    running <= 0;
                end

                // Do nothing in the (hopefully unreachable!) default case.
                default: begin
                    spy_read_addr <= INITIAL_ADDR;
                    spy_read_enable <= 0;
                    ram_write_enable <= 0;
                    ram_write_data <= 0;
                    running <= 0;
                end

            endcase
        end
    end

    // Second always block: control the playback state itself.
    // I separated out this logic just for readability. The playback runs
    // one clock behind reading from the spy memory, so we introduce a register
    // (flip-flop) that I called "running" to implement the delay in starting up.
    always @(posedge clock) begin
        if (!reset) begin
            playback_enable <= 0;
        end else begin
            case (playback)
                // Playback once state.
                PLAYBACK_ONCE: begin
                    if (running && !full) begin
                        playback_enable <= 1;
                    end else begin
                        playback_enable <= 0;
                    end
                end

                // Playback loop state.
                // Not sure if Verilog supports C-style fallthrough here;
                // the above ended up being identical.
                PLAYBACK_LOOP:
                    if (running && !full) begin
                        playback_enable <= 1;
                    end else begin
                        playback_enable <= 0;
                    end

                default: begin
                    playback_enable <= 0;
                end
            endcase
        end
    end

    // Always do this assignment if we're in playback mode.
    assign playback_data = (playback != NO_PLAYBACK) ? spy_read_data : 0;

endmodule
`default_nettype wire

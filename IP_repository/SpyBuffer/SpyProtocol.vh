// SpyProtocol verilog include file.

// I chose these pretty arbitrarily. We can adjust as needed or add more
// valid metadata words.
parameter START_EVENT = 8'b10101011;
parameter END_EVENT = 8'b11001101;

// Playback states. (These could live in their own header).
parameter NO_PLAYBACK = 2'b00;
parameter PLAYBACK_ONCE = 2'b01;
parameter PLAYBACK_LOOP = 2'b10;
parameter PLAYBACK_WRITE = 2'b11;


`timescale 1 ns / 1 ps

  module get_legendre_segmcud_DSP48_0(a, b, p);
input signed [18 - 1 : 0] a;
input signed [18 - 1 : 0] b;
output signed [35 - 1 : 0] p;

assign p = $signed (a) * $signed (b);

endmodule
`timescale 1 ns / 1 ps
module get_legendre_segmcud(
    din0,
    din1,
    dout);

parameter ID = 32'd1;
parameter NUM_STAGE = 32'd1;
parameter din0_WIDTH = 32'd1;
parameter din1_WIDTH = 32'd1;
parameter dout_WIDTH = 32'd1;
input[din0_WIDTH - 1:0] din0;
input[din1_WIDTH - 1:0] din1;
output[dout_WIDTH - 1:0] dout;



get_legendre_segmcud_DSP48_0 get_legendre_segmcud_DSP48_0_U(
    .a( din0 ),
    .b( din1 ),
    .p( dout ));

endmodule

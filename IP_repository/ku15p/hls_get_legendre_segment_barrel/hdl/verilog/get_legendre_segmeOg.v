
`timescale 1 ns / 1 ps

  module get_legendre_segmeOg_DSP48_2(a, b, p);
input [26 - 1 : 0] a;
input [18 - 1 : 0] b;
output [32 - 1 : 0] p;

assign p = $unsigned (a) * $unsigned (b);

endmodule
`timescale 1 ns / 1 ps
module get_legendre_segmeOg(
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



get_legendre_segmeOg_DSP48_2 get_legendre_segmeOg_DSP48_2_U(
    .a( din0 ),
    .b( din1 ),
    .p( dout ));

endmodule

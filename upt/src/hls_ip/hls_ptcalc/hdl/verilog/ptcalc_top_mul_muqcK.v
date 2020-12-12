
`timescale 1 ns / 1 ps

  module ptcalc_top_mul_muqcK_DSP48_3(a, b, p);
input signed [22 - 1 : 0] a;
input [7 - 1 : 0] b;
output signed [29 - 1 : 0] p;

assign p = $signed (a) * $signed ({1'b0, b});

endmodule
`timescale 1 ns / 1 ps
module ptcalc_top_mul_muqcK(
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



ptcalc_top_mul_muqcK_DSP48_3 ptcalc_top_mul_muqcK_DSP48_3_U(
    .a( din0 ),
    .b( din1 ),
    .p( dout ));

endmodule

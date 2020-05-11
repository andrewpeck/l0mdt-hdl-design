
`timescale 1 ns / 1 ps

  module get_rom_addr_mul_mul_15ns_22s_37_2_1_DSP48_0(clk, rst, ce, a, b, p);
input clk;
input rst;
input ce;
input [15 - 1 : 0] a;
input signed [22 - 1 : 0] b;
output signed [37 - 1 : 0] p;

reg signed [37 - 1 : 0] p_reg; 


always @ (posedge clk) begin
    if (ce) begin
        p_reg <= $signed ({1'b0, a}) * $signed (b);
    end
end

assign p = p_reg;

endmodule
`timescale 1 ns / 1 ps
module get_rom_addr_mul_mul_15ns_22s_37_2_1(
    clk,
    reset,
    ce,
    din0,
    din1,
    dout);

parameter ID = 32'd1;
parameter NUM_STAGE = 32'd1;
parameter din0_WIDTH = 32'd1;
parameter din1_WIDTH = 32'd1;
parameter dout_WIDTH = 32'd1;
input clk;
input reset;
input ce;
input[din0_WIDTH - 1:0] din0;
input[din1_WIDTH - 1:0] din1;
output[dout_WIDTH - 1:0] dout;



get_rom_addr_mul_mul_15ns_22s_37_2_1_DSP48_0 get_rom_addr_mul_mul_15ns_22s_37_2_1_DSP48_0_U(
    .clk( clk ),
    .rst( reset ),
    .ce( ce ),
    .a( din0 ),
    .b( din1 ),
    .p( dout ));

endmodule




module i2c_gener_tri (
                input  [15:0]  reset_1,
                input  [15:0]  reset_2,
                input  [15:0]  reset_3,
                input  [15:0]  clock_1,
                input  [15:0]  clock_2,
                input  [15:0]  clock_3,
                input [31:0]   wb_stb_i_1,
                input [31:0]   wb_stb_i_2,
                input [31:0]   wb_stb_i_3,
                input          wb_we_1 ,
                input          wb_we_2 ,
                input          wb_we_3 ,
                input          wb_cyc_1,
                input          wb_cyc_2,
                input          wb_cyc_3,
                input   [3:0]  wb_sel_1,
                input   [3:0]  wb_sel_2,
                input   [3:0]  wb_sel_3,
                input  [31:0]  wb_dat_i_1,
                input  [31:0]  wb_dat_i_2,
                input  [31:0]  wb_dat_i_3,
                input   [4:0]  wb_adr_i_1,
                input   [4:0]  wb_adr_i_2,
                input   [4:0]  wb_adr_i_3,
                input  [15:0]  SDA_in_1,
                input  [15:0]  SDA_in_2,
                input  [15:0]  SDA_in_3,
                output [15:0]  SCL_1,
                output [15:0]  SCL_2,
                output [15:0]  SCL_3,
                output [15:0]  SDA_OUT_1,
                output [15:0]  SDA_OUT_2,
                output [15:0]  SDA_OUT_3,
		output [15:0]  SCLEN_1,
		output [15:0]  SCLEN_2,
		output [15:0]  SCLEN_3,		
                output [31:0]  wb_dat_o0_1 , 
                output [31:0]  wb_dat_o0_2 , 
                output [31:0]  wb_dat_o0_3 , 
                output [31:0]  wb_dat_o1_1,
                output [31:0]  wb_dat_o1_2,
                output [31:0]  wb_dat_o1_3,
                output [31:0]  wb_dat_o2_1,
                output [31:0]  wb_dat_o2_2,
                output [31:0]  wb_dat_o2_3,
                output [31:0]  wb_dat_o3_1,
                output [31:0]  wb_dat_o3_2,
                output [31:0]  wb_dat_o3_3,
                output [31:0]  wb_dat_o4_1,
                output [31:0]  wb_dat_o4_2,
                output [31:0]  wb_dat_o4_3,
                output [31:0]  wb_dat_o5_1,
                output [31:0]  wb_dat_o5_2,
                output [31:0]  wb_dat_o5_3,
                output [31:0]  wb_dat_o6_1,
                output [31:0]  wb_dat_o6_2,
                output [31:0]  wb_dat_o6_3,
                output [31:0]  wb_dat_o7_1,
                output [31:0]  wb_dat_o7_2,
                output [31:0]  wb_dat_o7_3,
                output [31:0]  wb_dat_o8_1,
                output [31:0]  wb_dat_o8_2,
                output [31:0]  wb_dat_o8_3,
                output [31:0]  wb_dat_o9_1,
                output [31:0]  wb_dat_o9_2,
                output [31:0]  wb_dat_o9_3,
                output [31:0]  wb_dat_o10_1,
                output [31:0]  wb_dat_o10_2,
                output [31:0]  wb_dat_o10_3,
                output [31:0]  wb_dat_o11_1,
                output [31:0]  wb_dat_o11_2,
                output [31:0]  wb_dat_o11_3,
                output [31:0]  wb_dat_o12_1,
                output [31:0]  wb_dat_o12_2,
                output [31:0]  wb_dat_o12_3,
                output [31:0]  wb_dat_o13_1,
                output [31:0]  wb_dat_o13_2,
                output [31:0]  wb_dat_o13_3,
                output [31:0]  wb_dat_o14_1,
                output [31:0]  wb_dat_o14_2,
                output [31:0]  wb_dat_o14_3,
                output [31:0]  wb_dat_o15_1,
                output [31:0]  wb_dat_o15_2,
                output [31:0]  wb_dat_o15_3,
                output         wb_ack_out_1,
                output         wb_ack_out_2,
                output         wb_ack_out_3,
                output [15:0]  wb_i2c_int_1,
                output [15:0]  wb_i2c_int_2,
                output [15:0]  wb_i2c_int_3
);

wire [31:0]  bus_1 [15:0];
wire [31:0]  bus_2 [15:0];
wire [31:0]  bus_3 [15:0];
wire [15:0]  wb_ack_i2c_1;
wire [15:0]  wb_ack_i2c_2;
wire [15:0]  wb_ack_i2c_3;

wb_i2c_tri i2c_ch_0 (
		  .wb_err_o_1(),
		  .wb_err_o_2(),
		  .wb_err_o_3(),
                  .wb_clk_i_1(clock_1[0]),
                  .wb_rst_i_1(reset_1[0]),
                  .wb_stb_i_1(wb_stb_i_1[2]),
                  .wb_dat_o_1(bus_1[0]),
                  .wb_ack_o_1(wb_ack_i2c_1[0]),
                  .wb_adr_i_1(wb_adr_i_1[4:0]),
                  .wb_dat_i_1(wb_dat_i_1),
                  .scl_1(SCL_1[0]),
                  .sda_in_1(SDA_in_1[0]),
                  .wb_int_o_1(wb_i2c_int_1[0]),
                  .wb_cyc_i_1(wb_cyc_1),
                  .wb_we_i_1(wb_we_1),
                  .wb_sel_i_1(wb_sel_1),                  
                  .sda_out_1(SDA_OUT_1[0]),		  
                  
                  .wb_clk_i_2(clock_2[0]),
                  .wb_rst_i_2(reset_2[0]),
                  .wb_stb_i_2(wb_stb_i_2[2]),
                  .wb_dat_o_2(bus_2[0]),
                  .wb_ack_o_2(wb_ack_i2c_2[0]),
                  .wb_adr_i_2(wb_adr_i_2[4:0]),
                  .wb_dat_i_2(wb_dat_i_2),
                  .scl_2(SCL_2[0]),
                  .sda_in_2(SDA_in_2[0]),
                  .wb_int_o_2(wb_i2c_int_2[0]),
                  .wb_cyc_i_2(wb_cyc_2),
                  .wb_we_i_2(wb_we_2),
                  .wb_sel_i_2(wb_sel_2),                  
                  .sda_out_2(SDA_OUT_2[0]),
                  
                  .wb_clk_i_3(clock_3[0]),
                  .wb_rst_i_3(reset_3[0]),
                  .wb_stb_i_3(wb_stb_i_3[2]),
                  .wb_dat_o_3(bus_3[0]),
                  .wb_ack_o_3(wb_ack_i2c_3[0]),
                  .wb_adr_i_3(wb_adr_i_3[4:0]),
                  .wb_dat_i_3(wb_dat_i_3),
                  .scl_3(SCL_3[0]),
                  .sda_in_3(SDA_in_3[0]),
                  .wb_int_o_3(wb_i2c_int_3[0]),
                  .wb_cyc_i_3(wb_cyc_3),
                  .wb_we_i_3(wb_we_3),
                  .wb_sel_i_3(wb_sel_3),
                  .sda_out_3(SDA_OUT_3[0]),
		  
		  .sclen_1(SCLEN_1[0]),
		  .sclen_2(SCLEN_2[0]),
		  .sclen_3(SCLEN_3[0])
		  
);


wb_i2c_tri i2c_ch_1 (
		  .wb_err_o_1(),
		  .wb_err_o_2(),
		  .wb_err_o_3(),
                  .wb_clk_i_1(clock_1[1]),
                  .wb_rst_i_1(reset_1[1]),
                  .wb_stb_i_1(wb_stb_i_1[3]),
                  .wb_dat_o_1(bus_1[1]),
                  .wb_ack_o_1(wb_ack_i2c_1[1]),
                  .wb_adr_i_1(wb_adr_i_1[4:0]),
                  .wb_dat_i_1(wb_dat_i_1),
                  .scl_1(SCL_1[1]),
                  .sda_in_1(SDA_in_1[1]),
                  .wb_int_o_1(wb_i2c_int_1[1]),
                  .wb_cyc_i_1(wb_cyc_1),
                  .wb_we_i_1(wb_we_1),
                  .wb_sel_i_1(wb_sel_1),
                  
                  .sda_out_1(SDA_OUT_1[1]),
                  .wb_clk_i_2(clock_2[1]),
                  .wb_rst_i_2(reset_2[1]),
                  .wb_stb_i_2(wb_stb_i_2[3]),
                  .wb_dat_o_2(bus_2[1]),
                  .wb_ack_o_2(wb_ack_i2c_2[1]),
                  .wb_adr_i_2(wb_adr_i_2[4:0]),
                  .wb_dat_i_2(wb_dat_i_2),
                  .scl_2(SCL_2[1]),
                  .sda_in_2(SDA_in_2[1]),
                  .wb_int_o_2(wb_i2c_int_2[1]),
                  .wb_cyc_i_2(wb_cyc_2),
                  .wb_we_i_2(wb_we_2),
                  .wb_sel_i_2(wb_sel_2),
                  
                  .sda_out_2(SDA_OUT_2[1]),
                  .wb_clk_i_3(clock_3[1]),
                  .wb_rst_i_3(reset_3[1]),
                  .wb_stb_i_3(wb_stb_i_3[3]),
                  .wb_dat_o_3(bus_3[1]),
                  .wb_ack_o_3(wb_ack_i2c_3[1]),
                  .wb_adr_i_3(wb_adr_i_3[4:0]),
                  .wb_dat_i_3(wb_dat_i_3),
                  .scl_3(SCL_3[1]),
                  .sda_in_3(SDA_in_3[1]),
                  .wb_int_o_3(wb_i2c_int_3[1]),
                  .wb_cyc_i_3(wb_cyc_3),
                  .wb_we_i_3(wb_we_3),
                  .wb_sel_i_3(wb_sel_3),
                  .sda_out_3(SDA_OUT_3[1]),
		  
		  .sclen_1(SCLEN_1[1]),
		  .sclen_2(SCLEN_2[1]),
		  .sclen_3(SCLEN_3[1])
);


wb_i2c_tri i2c_ch_2 (
		  .wb_err_o_1(),
		  .wb_err_o_2(),
		  .wb_err_o_3(),
                  .wb_clk_i_1(clock_1[2]),
                  .wb_rst_i_1(reset_1[2]),
                  .wb_stb_i_1(wb_stb_i_1[4]),
                  .wb_dat_o_1(bus_1[2]),
                  .wb_ack_o_1(wb_ack_i2c_1[2]),
                  .wb_adr_i_1(wb_adr_i_1[4:0]),
                  .wb_dat_i_1(wb_dat_i_1),
                  .scl_1(SCL_1[2]),
                  .sda_in_1(SDA_in_1[2]),
                  .wb_int_o_1(wb_i2c_int_1[2]),
                  .wb_cyc_i_1(wb_cyc_1),
                  .wb_we_i_1(wb_we_1),
                  .wb_sel_i_1(wb_sel_1),
                  
                  .sda_out_1(SDA_OUT_1[2]),
                  .wb_clk_i_2(clock_2[2]),
                  .wb_rst_i_2(reset_2[2]),
                  .wb_stb_i_2(wb_stb_i_2[4]),
                  .wb_dat_o_2(bus_2[2]),
                  .wb_ack_o_2(wb_ack_i2c_2[2]),
                  .wb_adr_i_2(wb_adr_i_2[4:0]),
                  .wb_dat_i_2(wb_dat_i_2),
                  .scl_2(SCL_2[2]),
                  .sda_in_2(SDA_in_2[2]),
                  .wb_int_o_2(wb_i2c_int_2[2]),
                  .wb_cyc_i_2(wb_cyc_2),
                  .wb_we_i_2(wb_we_2),
                  .wb_sel_i_2(wb_sel_2),
                  
                  .sda_out_2(SDA_OUT_2[2]),
                  .wb_clk_i_3(clock_3[2]),
                  .wb_rst_i_3(reset_3[2]),
                  .wb_stb_i_3(wb_stb_i_3[4]),
                  .wb_dat_o_3(bus_3[2]),
                  .wb_ack_o_3(wb_ack_i2c_3[2]),
                  .wb_adr_i_3(wb_adr_i_3[4:0]),
                  .wb_dat_i_3(wb_dat_i_3),
                  .scl_3(SCL_3[2]),
                  .sda_in_3(SDA_in_3[2]),
                  .wb_int_o_3(wb_i2c_int_3[2]),
                  .wb_cyc_i_3(wb_cyc_3),
                  .wb_we_i_3(wb_we_3),
                  .wb_sel_i_3(wb_sel_3),
                  .sda_out_3(SDA_OUT_3[2]),
		  
		  .sclen_1(SCLEN_1[2]),
		  .sclen_2(SCLEN_2[2]),
		  .sclen_3(SCLEN_3[2])
);


wb_i2c_tri i2c_ch_3 (
		  .wb_err_o_1(),
		  .wb_err_o_2(),
		  .wb_err_o_3(),
                  .wb_clk_i_1(clock_1[3]),
                  .wb_rst_i_1(reset_1[3]),
                  .wb_stb_i_1(wb_stb_i_1[5]),
                  .wb_dat_o_1(bus_1[3]),
                  .wb_ack_o_1(wb_ack_i2c_1[3]),
                  .wb_adr_i_1(wb_adr_i_1[4:0]),
                  .wb_dat_i_1(wb_dat_i_1),
                  .scl_1(SCL_1[3]),
                  .sda_in_1(SDA_in_1[3]),
                  .wb_int_o_1(wb_i2c_int_1[3]),
                  .wb_cyc_i_1(wb_cyc_1),
                  .wb_we_i_1(wb_we_1),
                  .wb_sel_i_1(wb_sel_1),
                  
                  .sda_out_1(SDA_OUT_1[3]),
                  .wb_clk_i_2(clock_2[3]),
                  .wb_rst_i_2(reset_2[3]),
                  .wb_stb_i_2(wb_stb_i_2[5]),
                  .wb_dat_o_2(bus_2[3]),
                  .wb_ack_o_2(wb_ack_i2c_2[3]),
                  .wb_adr_i_2(wb_adr_i_2[4:0]),
                  .wb_dat_i_2(wb_dat_i_2),
                  .scl_2(SCL_2[3]),
                  .sda_in_2(SDA_in_2[3]),
                  .wb_int_o_2(wb_i2c_int_2[3]),
                  .wb_cyc_i_2(wb_cyc_2),
                  .wb_we_i_2(wb_we_2),
                  .wb_sel_i_2(wb_sel_2),
                  
                  .sda_out_2(SDA_OUT_2[3]),
                  .wb_clk_i_3(clock_3[3]),
                  .wb_rst_i_3(reset_3[3]),
                  .wb_stb_i_3(wb_stb_i_3[5]),
                  .wb_dat_o_3(bus_3[3]),
                  .wb_ack_o_3(wb_ack_i2c_3[3]),
                  .wb_adr_i_3(wb_adr_i_3[4:0]),
                  .wb_dat_i_3(wb_dat_i_3),
                  .scl_3(SCL_3[3]),
                  .sda_in_3(SDA_in_3[3]),
                  .wb_int_o_3(wb_i2c_int_3[3]),
                  .wb_cyc_i_3(wb_cyc_3),
                  .wb_we_i_3(wb_we_3),
                  .wb_sel_i_3(wb_sel_3),
                  .sda_out_3(SDA_OUT_3[3]),
		  
		  .sclen_1(SCLEN_1[3]),
		  .sclen_2(SCLEN_2[3]),
		  .sclen_3(SCLEN_3[3])
);


wb_i2c_tri i2c_ch_4 (
		  .wb_err_o_1(),
		  .wb_err_o_2(),
		  .wb_err_o_3(),
                  .wb_clk_i_1(clock_1[4]),
                  .wb_rst_i_1(reset_1[4]),
                  .wb_stb_i_1(wb_stb_i_1[6]),
                  .wb_dat_o_1(bus_1[4]),
                  .wb_ack_o_1(wb_ack_i2c_1[4]),
                  .wb_adr_i_1(wb_adr_i_1[4:0]),
                  .wb_dat_i_1(wb_dat_i_1),
                  .scl_1(SCL_1[4]),
                  .sda_in_1(SDA_in_1[4]),
                  .wb_int_o_1(wb_i2c_int_1[4]),
                  .wb_cyc_i_1(wb_cyc_1),
                  .wb_we_i_1(wb_we_1),
                  .wb_sel_i_1(wb_sel_1),
                  
                  .sda_out_1(SDA_OUT_1[4]),
                  .wb_clk_i_2(clock_2[4]),
                  .wb_rst_i_2(reset_2[4]),
                  .wb_stb_i_2(wb_stb_i_2[6]),
                  .wb_dat_o_2(bus_2[4]),
                  .wb_ack_o_2(wb_ack_i2c_2[4]),
                  .wb_adr_i_2(wb_adr_i_2[4:0]),
                  .wb_dat_i_2(wb_dat_i_2),
                  .scl_2(SCL_2[4]),
                  .sda_in_2(SDA_in_2[4]),
                  .wb_int_o_2(wb_i2c_int_2[4]),
                  .wb_cyc_i_2(wb_cyc_2),
                  .wb_we_i_2(wb_we_2),
                  .wb_sel_i_2(wb_sel_2),
                  
                  .sda_out_2(SDA_OUT_2[4]),
                  .wb_clk_i_3(clock_3[4]),
                  .wb_rst_i_3(reset_3[4]),
                  .wb_stb_i_3(wb_stb_i_3[6]),
                  .wb_dat_o_3(bus_3[4]),
                  .wb_ack_o_3(wb_ack_i2c_3[4]),
                  .wb_adr_i_3(wb_adr_i_3[4:0]),
                  .wb_dat_i_3(wb_dat_i_3),
                  .scl_3(SCL_3[4]),
                  .sda_in_3(SDA_in_3[4]),
                  .wb_int_o_3(wb_i2c_int_3[4]),
                  .wb_cyc_i_3(wb_cyc_3),
                  .wb_we_i_3(wb_we_3),
                  .wb_sel_i_3(wb_sel_3),
                  
                  .sda_out_3(SDA_OUT_3[4]),
		  
		  .sclen_1(SCLEN_1[4]),
		  .sclen_2(SCLEN_2[4]),
		  .sclen_3(SCLEN_3[4])
);


wb_i2c_tri i2c_ch_5 (
		  .wb_err_o_1(),
		  .wb_err_o_2(),
		  .wb_err_o_3(),
                  .wb_clk_i_1(clock_1[5]),
                  .wb_rst_i_1(reset_1[5]),
                  .wb_stb_i_1(wb_stb_i_1[7]),
                  .wb_dat_o_1(bus_1[5]),
                  .wb_ack_o_1(wb_ack_i2c_1[5]),
                  .wb_adr_i_1(wb_adr_i_1[4:0]),
                  .wb_dat_i_1(wb_dat_i_1),
                  .scl_1(SCL_1[5]),
                  .sda_in_1(SDA_in_1[5]),
                  .wb_int_o_1(wb_i2c_int_1[5]),
                  .wb_cyc_i_1(wb_cyc_1),
                  .wb_we_i_1(wb_we_1),
                  .wb_sel_i_1(wb_sel_1),
                  
                  .sda_out_1(SDA_OUT_1[5]),
                  .wb_clk_i_2(clock_2[5]),
                  .wb_rst_i_2(reset_2[5]),
                  .wb_stb_i_2(wb_stb_i_2[7]),
                  .wb_dat_o_2(bus_2[5]),
                  .wb_ack_o_2(wb_ack_i2c_2[5]),
                  .wb_adr_i_2(wb_adr_i_2[4:0]),
                  .wb_dat_i_2(wb_dat_i_2),
                  .scl_2(SCL_2[5]),
                  .sda_in_2(SDA_in_2[5]),
                  .wb_int_o_2(wb_i2c_int_2[5]),
                  .wb_cyc_i_2(wb_cyc_2),
                  .wb_we_i_2(wb_we_2),
                  .wb_sel_i_2(wb_sel_2),
                  
                  .sda_out_2(SDA_OUT_2[5]),
                  .wb_clk_i_3(clock_3[5]),
                  .wb_rst_i_3(reset_3[5]),
                  .wb_stb_i_3(wb_stb_i_3[7]),
                  .wb_dat_o_3(bus_3[5]),
                  .wb_ack_o_3(wb_ack_i2c_3[5]),
                  .wb_adr_i_3(wb_adr_i_3[4:0]),
                  .wb_dat_i_3(wb_dat_i_3),
                  .scl_3(SCL_3[5]),
                  .sda_in_3(SDA_in_3[5]),
                  .wb_int_o_3(wb_i2c_int_3[5]),
                  .wb_cyc_i_3(wb_cyc_3),
                  .wb_we_i_3(wb_we_3),
                  .wb_sel_i_3(wb_sel_3),
                  .sda_out_3(SDA_OUT_3[5]),
		  
		  .sclen_1(SCLEN_1[5]),
		  .sclen_2(SCLEN_2[5]),
		  .sclen_3(SCLEN_3[5])
);


wb_i2c_tri i2c_ch_6 (
		  .wb_err_o_1(),
		  .wb_err_o_2(),
		  .wb_err_o_3(),
                  .wb_clk_i_1(clock_1[6]),
                  .wb_rst_i_1(reset_1[6]),
                  .wb_stb_i_1(wb_stb_i_1[8]),
                  .wb_dat_o_1(bus_1[6]),
                  .wb_ack_o_1(wb_ack_i2c_1[6]),
                  .wb_adr_i_1(wb_adr_i_1[4:0]),
                  .wb_dat_i_1(wb_dat_i_1),
                  .scl_1(SCL_1[6]),
                  .sda_in_1(SDA_in_1[6]),
                  .wb_int_o_1(wb_i2c_int_1[6]),
                  .wb_cyc_i_1(wb_cyc_1),
                  .wb_we_i_1(wb_we_1),
                  .wb_sel_i_1(wb_sel_1),
                  
                  .sda_out_1(SDA_OUT_1[6]),
                  .wb_clk_i_2(clock_2[6]),
                  .wb_rst_i_2(reset_2[6]),
                  .wb_stb_i_2(wb_stb_i_2[8]),
                  .wb_dat_o_2(bus_2[6]),
                  .wb_ack_o_2(wb_ack_i2c_2[6]),
                  .wb_adr_i_2(wb_adr_i_2[4:0]),
                  .wb_dat_i_2(wb_dat_i_2),
                  .scl_2(SCL_2[6]),
                  .sda_in_2(SDA_in_2[6]),
                  .wb_int_o_2(wb_i2c_int_2[6]),
                  .wb_cyc_i_2(wb_cyc_2),
                  .wb_we_i_2(wb_we_2),
                  .wb_sel_i_2(wb_sel_2),
                  
                  .sda_out_2(SDA_OUT_2[6]),
                  .wb_clk_i_3(clock_3[6]),
                  .wb_rst_i_3(reset_3[6]),
                  .wb_stb_i_3(wb_stb_i_3[8]),
                  .wb_dat_o_3(bus_3[6]),
                  .wb_ack_o_3(wb_ack_i2c_3[6]),
                  .wb_adr_i_3(wb_adr_i_3[4:0]),
                  .wb_dat_i_3(wb_dat_i_3),
                  .scl_3(SCL_3[6]),
                  .sda_in_3(SDA_in_3[6]),
                  .wb_int_o_3(wb_i2c_int_3[6]),
                  .wb_cyc_i_3(wb_cyc_3),
                  .wb_we_i_3(wb_we_3),
                  .wb_sel_i_3(wb_sel_3),
                  .sda_out_3(SDA_OUT_3[6]),
		  
		  .sclen_1(SCLEN_1[6]),
		  .sclen_2(SCLEN_2[6]),
		  .sclen_3(SCLEN_3[6])
);


wb_i2c_tri i2c_ch_7 (
		  .wb_err_o_1(),
		  .wb_err_o_2(),
		  .wb_err_o_3(),
                  .wb_clk_i_1(clock_1[7]),
                  .wb_rst_i_1(reset_1[7]),
                  .wb_stb_i_1(wb_stb_i_1[9]),
                  .wb_dat_o_1(bus_1[7]),
                  .wb_ack_o_1(wb_ack_i2c_1[7]),
                  .wb_adr_i_1(wb_adr_i_1[4:0]),
                  .wb_dat_i_1(wb_dat_i_1),
                  .scl_1(SCL_1[7]),
                  .sda_in_1(SDA_in_1[7]),
                  .wb_int_o_1(wb_i2c_int_1[7]),
                  .wb_cyc_i_1(wb_cyc_1),
                  .wb_we_i_1(wb_we_1),
                  .wb_sel_i_1(wb_sel_1),
                  
                  .sda_out_1(SDA_OUT_1[7]),
                  .wb_clk_i_2(clock_2[7]),
                  .wb_rst_i_2(reset_2[7]),
                  .wb_stb_i_2(wb_stb_i_2[9]),
                  .wb_dat_o_2(bus_2[7]),
                  .wb_ack_o_2(wb_ack_i2c_2[7]),
                  .wb_adr_i_2(wb_adr_i_2[4:0]),
                  .wb_dat_i_2(wb_dat_i_2),
                  .scl_2(SCL_2[7]),
                  .sda_in_2(SDA_in_2[7]),
                  .wb_int_o_2(wb_i2c_int_2[7]),
                  .wb_cyc_i_2(wb_cyc_2),
                  .wb_we_i_2(wb_we_2),
                  .wb_sel_i_2(wb_sel_2),
                  
                  .sda_out_2(SDA_OUT_2[7]),
                  .wb_clk_i_3(clock_3[7]),
                  .wb_rst_i_3(reset_3[7]),
                  .wb_stb_i_3(wb_stb_i_3[9]),
                  .wb_dat_o_3(bus_3[7]),
                  .wb_ack_o_3(wb_ack_i2c_3[7]),
                  .wb_adr_i_3(wb_adr_i_3[4:0]),
                  .wb_dat_i_3(wb_dat_i_3),
                  .scl_3(SCL_3[7]),
                  .sda_in_3(SDA_in_3[7]),
                  .wb_int_o_3(wb_i2c_int_3[7]),
                  .wb_cyc_i_3(wb_cyc_3),
                  .wb_we_i_3(wb_we_3),
                  .wb_sel_i_3(wb_sel_3),
                  .sda_out_3(SDA_OUT_3[7]),
		  
		  .sclen_1(SCLEN_1[7]),
		  .sclen_2(SCLEN_2[7]),
		  .sclen_3(SCLEN_3[7])
);


wb_i2c_tri i2c_ch_8 (
		  .wb_err_o_1(),
		  .wb_err_o_2(),
		  .wb_err_o_3(),
                  .wb_clk_i_1(clock_1[8]),
                  .wb_rst_i_1(reset_1[8]),
                  .wb_stb_i_1(wb_stb_i_1[10]),
                  .wb_dat_o_1(bus_1[8]),
                  .wb_ack_o_1(wb_ack_i2c_1[8]),
                  .wb_adr_i_1(wb_adr_i_1[4:0]),
                  .wb_dat_i_1(wb_dat_i_1),
                  .scl_1(SCL_1[8]),
                  .sda_in_1(SDA_in_1[8]),
                  .wb_int_o_1(wb_i2c_int_1[8]),
                  .wb_cyc_i_1(wb_cyc_1),
                  .wb_we_i_1(wb_we_1),
                  .wb_sel_i_1(wb_sel_1),
                  .sda_out_1(SDA_OUT_1[8]),
                  .wb_clk_i_2(clock_2[8]),
                  .wb_rst_i_2(reset_2[8]),
                  .wb_stb_i_2(wb_stb_i_2[10]),
                  .wb_dat_o_2(bus_2[8]),
                  .wb_ack_o_2(wb_ack_i2c_2[8]),
                  .wb_adr_i_2(wb_adr_i_2[4:0]),
                  .wb_dat_i_2(wb_dat_i_2),
                  .scl_2(SCL_2[8]),
                  .sda_in_2(SDA_in_2[8]),
                  .wb_int_o_2(wb_i2c_int_2[8]),
                  .wb_cyc_i_2(wb_cyc_2),
                  .wb_we_i_2(wb_we_2),
                  .wb_sel_i_2(wb_sel_2),
                  .sda_out_2(SDA_OUT_2[8]),
                  .wb_clk_i_3(clock_3[8]),
                  .wb_rst_i_3(reset_3[8]),
                  .wb_stb_i_3(wb_stb_i_3[10]),
                  .wb_dat_o_3(bus_3[8]),
                  .wb_ack_o_3(wb_ack_i2c_3[8]),
                  .wb_adr_i_3(wb_adr_i_3[4:0]),
                  .wb_dat_i_3(wb_dat_i_3),
                  .scl_3(SCL_3[8]),
                  .sda_in_3(SDA_in_3[8]),
                  .wb_int_o_3(wb_i2c_int_3[8]),
                  .wb_cyc_i_3(wb_cyc_3),
                  .wb_we_i_3(wb_we_3),
                  .wb_sel_i_3(wb_sel_3),
                  .sda_out_3(SDA_OUT_3[8]),
		  
		  .sclen_1(SCLEN_1[8]),
		  .sclen_2(SCLEN_2[8]),
		  .sclen_3(SCLEN_3[8])
);


wb_i2c_tri i2c_ch_9 (
		  .wb_err_o_1(),
		  .wb_err_o_2(),
		  .wb_err_o_3(),
                  .wb_clk_i_1(clock_1[9]),
                  .wb_rst_i_1(reset_1[9]),
                  .wb_stb_i_1(wb_stb_i_1[11]),
                  .wb_dat_o_1(bus_1[9]),
                  .wb_ack_o_1(wb_ack_i2c_1[9]),
                  .wb_adr_i_1(wb_adr_i_1[4:0]),
                  .wb_dat_i_1(wb_dat_i_1),
                  .scl_1(SCL_1[9]),
                  .sda_in_1(SDA_in_1[9]),
                  .wb_int_o_1(wb_i2c_int_1[9]),
                  .wb_cyc_i_1(wb_cyc_1),
                  .wb_we_i_1(wb_we_1),
                  .wb_sel_i_1(wb_sel_1),
                  
                  .sda_out_1(SDA_OUT_1[9]),
                  .wb_clk_i_2(clock_2[9]),
                  .wb_rst_i_2(reset_2[9]),
                  .wb_stb_i_2(wb_stb_i_2[11]),
                  .wb_dat_o_2(bus_2[9]),
                  .wb_ack_o_2(wb_ack_i2c_2[9]),
                  .wb_adr_i_2(wb_adr_i_2[4:0]),
                  .wb_dat_i_2(wb_dat_i_2),
                  .scl_2(SCL_2[9]),
                  .sda_in_2(SDA_in_2[9]),
                  .wb_int_o_2(wb_i2c_int_2[9]),
                  .wb_cyc_i_2(wb_cyc_2),
                  .wb_we_i_2(wb_we_2),
                  .wb_sel_i_2(wb_sel_2),
                  
                  .sda_out_2(SDA_OUT_2[9]),
                  .wb_clk_i_3(clock_3[9]),
                  .wb_rst_i_3(reset_3[9]),
                  .wb_stb_i_3(wb_stb_i_3[11]),
                  .wb_dat_o_3(bus_3[9]),
                  .wb_ack_o_3(wb_ack_i2c_3[9]),
                  .wb_adr_i_3(wb_adr_i_3[4:0]),
                  .wb_dat_i_3(wb_dat_i_3),
                  .scl_3(SCL_3[9]),
                  .sda_in_3(SDA_in_3[9]),
                  .wb_int_o_3(wb_i2c_int_3[9]),
                  .wb_cyc_i_3(wb_cyc_3),
                  .wb_we_i_3(wb_we_3),
                  .wb_sel_i_3(wb_sel_3),
                  .sda_out_3(SDA_OUT_3[9]),
		  
		  .sclen_1(SCLEN_1[9]),
		  .sclen_2(SCLEN_2[9]),
		  .sclen_3(SCLEN_3[9])
);


wb_i2c_tri i2c_ch_10 (
		  .wb_err_o_1(),
		  .wb_err_o_2(),
		  .wb_err_o_3(),
                  .wb_clk_i_1(clock_1[10]),
                  .wb_rst_i_1(reset_1[10]),
                  .wb_stb_i_1(wb_stb_i_1[12]),
                  .wb_dat_o_1(bus_1[10]),
                  .wb_ack_o_1(wb_ack_i2c_1[10]),
                  .wb_adr_i_1(wb_adr_i_1[4:0]),
                  .wb_dat_i_1(wb_dat_i_1),
                  .scl_1(SCL_1[10]),
                  .sda_in_1(SDA_in_1[10]),
                  .wb_int_o_1(wb_i2c_int_1[10]),
                  .wb_cyc_i_1(wb_cyc_1),
                  .wb_we_i_1(wb_we_1),
                  .wb_sel_i_1(wb_sel_1),
                  
                  .sda_out_1(SDA_OUT_1[10]),
                  .wb_clk_i_2(clock_2[10]),
                  .wb_rst_i_2(reset_2[10]),
                  .wb_stb_i_2(wb_stb_i_2[12]),
                  .wb_dat_o_2(bus_2[10]),
                  .wb_ack_o_2(wb_ack_i2c_2[10]),
                  .wb_adr_i_2(wb_adr_i_2[4:0]),
                  .wb_dat_i_2(wb_dat_i_2),
                  .scl_2(SCL_2[10]),
                  .sda_in_2(SDA_in_2[10]),
                  .wb_int_o_2(wb_i2c_int_2[10]),
                  .wb_cyc_i_2(wb_cyc_2),
                  .wb_we_i_2(wb_we_2),
                  .wb_sel_i_2(wb_sel_2),
                  
                  .sda_out_2(SDA_OUT_2[10]),
                  .wb_clk_i_3(clock_3[10]),
                  .wb_rst_i_3(reset_3[10]),
                  .wb_stb_i_3(wb_stb_i_3[12]),
                  .wb_dat_o_3(bus_3[10]),
                  .wb_ack_o_3(wb_ack_i2c_3[10]),
                  .wb_adr_i_3(wb_adr_i_3[4:0]),
                  .wb_dat_i_3(wb_dat_i_3),
                  .scl_3(SCL_3[10]),
                  .sda_in_3(SDA_in_3[10]),
                  .wb_int_o_3(wb_i2c_int_3[10]),
                  .wb_cyc_i_3(wb_cyc_3),
                  .wb_we_i_3(wb_we_3),
                  .wb_sel_i_3(wb_sel_3),
                  .sda_out_3(SDA_OUT_3[10]),
		  
		  .sclen_1(SCLEN_1[10]),
		  .sclen_2(SCLEN_2[10]),
		  .sclen_3(SCLEN_3[10])
);


wb_i2c_tri i2c_ch_11 (
		  .wb_err_o_1(),
		  .wb_err_o_2(),
		  .wb_err_o_3(),
                  .wb_clk_i_1(clock_1[11]),
                  .wb_rst_i_1(reset_1[11]),
                  .wb_stb_i_1(wb_stb_i_1[13]),
                  .wb_dat_o_1(bus_1[11]),
                  .wb_ack_o_1(wb_ack_i2c_1[11]),
                  .wb_adr_i_1(wb_adr_i_1[4:0]),
                  .wb_dat_i_1(wb_dat_i_1),
                  .scl_1(SCL_1[11]),
                  .sda_in_1(SDA_in_1[11]),
                  .wb_int_o_1(wb_i2c_int_1[11]),
                  .wb_cyc_i_1(wb_cyc_1),
                  .wb_we_i_1(wb_we_1),
                  .wb_sel_i_1(wb_sel_1),
                  
                  .sda_out_1(SDA_OUT_1[11]),
                  .wb_clk_i_2(clock_2[11]),
                  .wb_rst_i_2(reset_2[11]),
                  .wb_stb_i_2(wb_stb_i_2[13]),
                  .wb_dat_o_2(bus_2[11]),
                  .wb_ack_o_2(wb_ack_i2c_2[11]),
                  .wb_adr_i_2(wb_adr_i_2[4:0]),
                  .wb_dat_i_2(wb_dat_i_2),
                  .scl_2(SCL_2[11]),
                  .sda_in_2(SDA_in_2[11]),
                  .wb_int_o_2(wb_i2c_int_2[11]),
                  .wb_cyc_i_2(wb_cyc_2),
                  .wb_we_i_2(wb_we_2),
                  .wb_sel_i_2(wb_sel_2),
                  
                  .sda_out_2(SDA_OUT_2[11]),
                  .wb_clk_i_3(clock_3[11]),
                  .wb_rst_i_3(reset_3[11]),
                  .wb_stb_i_3(wb_stb_i_3[13]),
                  .wb_dat_o_3(bus_3[11]),
                  .wb_ack_o_3(wb_ack_i2c_3[11]),
                  .wb_adr_i_3(wb_adr_i_3[4:0]),
                  .wb_dat_i_3(wb_dat_i_3),
                  .scl_3(SCL_3[11]),
                  .sda_in_3(SDA_in_3[11]),
                  .wb_int_o_3(wb_i2c_int_3[11]),
                  .wb_cyc_i_3(wb_cyc_3),
                  .wb_we_i_3(wb_we_3),
                  .wb_sel_i_3(wb_sel_3),
                  .sda_out_3(SDA_OUT_3[11]),
		  
		  .sclen_1(SCLEN_1[11]),
		  .sclen_2(SCLEN_2[11]),
		  .sclen_3(SCLEN_3[11])
);


wb_i2c_tri i2c_ch_12 (
		  .wb_err_o_1(),
		  .wb_err_o_2(),
		  .wb_err_o_3(),
                  .wb_clk_i_1(clock_1[12]),
                  .wb_rst_i_1(reset_1[12]),
                  .wb_stb_i_1(wb_stb_i_1[14]),
                  .wb_dat_o_1(bus_1[12]),
                  .wb_ack_o_1(wb_ack_i2c_1[12]),
                  .wb_adr_i_1(wb_adr_i_1[4:0]),
                  .wb_dat_i_1(wb_dat_i_1),
                  .scl_1(SCL_1[12]),
                  .sda_in_1(SDA_in_1[12]),
                  .wb_int_o_1(wb_i2c_int_1[12]),
                  .wb_cyc_i_1(wb_cyc_1),
                  .wb_we_i_1(wb_we_1),
                  .wb_sel_i_1(wb_sel_1),
                  
                  .sda_out_1(SDA_OUT_1[12]),
                  .wb_clk_i_2(clock_2[12]),
                  .wb_rst_i_2(reset_2[12]),
                  .wb_stb_i_2(wb_stb_i_2[14]),
                  .wb_dat_o_2(bus_2[12]),
                  .wb_ack_o_2(wb_ack_i2c_2[12]),
                  .wb_adr_i_2(wb_adr_i_2[4:0]),
                  .wb_dat_i_2(wb_dat_i_2),
                  .scl_2(SCL_2[12]),
                  .sda_in_2(SDA_in_2[12]),
                  .wb_int_o_2(wb_i2c_int_2[12]),
                  .wb_cyc_i_2(wb_cyc_2),
                  .wb_we_i_2(wb_we_2),
                  .wb_sel_i_2(wb_sel_2),
                  
                  .sda_out_2(SDA_OUT_2[12]),
                  .wb_clk_i_3(clock_3[12]),
                  .wb_rst_i_3(reset_3[12]),
                  .wb_stb_i_3(wb_stb_i_3[14]),
                  .wb_dat_o_3(bus_3[12]),
                  .wb_ack_o_3(wb_ack_i2c_3[12]),
                  .wb_adr_i_3(wb_adr_i_3[4:0]),
                  .wb_dat_i_3(wb_dat_i_3),
                  .scl_3(SCL_3[12]),
                  .sda_in_3(SDA_in_3[12]),
                  .wb_int_o_3(wb_i2c_int_3[12]),
                  .wb_cyc_i_3(wb_cyc_3),
                  .wb_we_i_3(wb_we_3),
                  .wb_sel_i_3(wb_sel_3),
                  .sda_out_3(SDA_OUT_3[12]),
		  
		  .sclen_1(SCLEN_1[12]),
		  .sclen_2(SCLEN_2[12]),
		  .sclen_3(SCLEN_3[12])
);


wb_i2c_tri i2c_ch_13 (
		  .wb_err_o_1(),
		  .wb_err_o_2(),
		  .wb_err_o_3(),
                  .wb_clk_i_1(clock_1[13]),
                  .wb_rst_i_1(reset_1[13]),
                  .wb_stb_i_1(wb_stb_i_1[15]),
                  .wb_dat_o_1(bus_1[13]),
                  .wb_ack_o_1(wb_ack_i2c_1[13]),
                  .wb_adr_i_1(wb_adr_i_1[4:0]),
                  .wb_dat_i_1(wb_dat_i_1),
                  .scl_1(SCL_1[13]),
                  .sda_in_1(SDA_in_1[13]),
                  .wb_int_o_1(wb_i2c_int_1[13]),
                  .wb_cyc_i_1(wb_cyc_1),
                  .wb_we_i_1(wb_we_1),
                  .wb_sel_i_1(wb_sel_1),
                  
                  .sda_out_1(SDA_OUT_1[13]),
                  .wb_clk_i_2(clock_2[13]),
                  .wb_rst_i_2(reset_2[13]),
                  .wb_stb_i_2(wb_stb_i_2[15]),
                  .wb_dat_o_2(bus_2[13]),
                  .wb_ack_o_2(wb_ack_i2c_2[13]),
                  .wb_adr_i_2(wb_adr_i_2[4:0]),
                  .wb_dat_i_2(wb_dat_i_2),
                  .scl_2(SCL_2[13]),
                  .sda_in_2(SDA_in_2[13]),
                  .wb_int_o_2(wb_i2c_int_2[13]),
                  .wb_cyc_i_2(wb_cyc_2),
                  .wb_we_i_2(wb_we_2),
                  .wb_sel_i_2(wb_sel_2),
                  
                  .sda_out_2(SDA_OUT_2[13]),
                  .wb_clk_i_3(clock_3[13]),
                  .wb_rst_i_3(reset_3[13]),
                  .wb_stb_i_3(wb_stb_i_3[15]),
                  .wb_dat_o_3(bus_3[13]),
                  .wb_ack_o_3(wb_ack_i2c_3[13]),
                  .wb_adr_i_3(wb_adr_i_3[4:0]),
                  .wb_dat_i_3(wb_dat_i_3),
                  .scl_3(SCL_3[13]),
                  .sda_in_3(SDA_in_3[13]),
                  .wb_int_o_3(wb_i2c_int_3[13]),
                  .wb_cyc_i_3(wb_cyc_3),
                  .wb_we_i_3(wb_we_3),
                  .wb_sel_i_3(wb_sel_3),
                  .sda_out_3(SDA_OUT_3[13]),
		  
		  .sclen_1(SCLEN_1[13]),
		  .sclen_2(SCLEN_2[13]),
		  .sclen_3(SCLEN_3[13])
);


wb_i2c_tri i2c_ch_14 (
		  .wb_err_o_1(),
		  .wb_err_o_2(),
		  .wb_err_o_3(),
                  .wb_clk_i_1(clock_1[14]),
                  .wb_rst_i_1(reset_1[14]),
                  .wb_stb_i_1(wb_stb_i_1[16]),
                  .wb_dat_o_1(bus_1[14]),
                  .wb_ack_o_1(wb_ack_i2c_1[14]),
                  .wb_adr_i_1(wb_adr_i_1[4:0]),
                  .wb_dat_i_1(wb_dat_i_1),
                  .scl_1(SCL_1[14]),
                  .sda_in_1(SDA_in_1[14]),
                  .wb_int_o_1(wb_i2c_int_1[14]),
                  .wb_cyc_i_1(wb_cyc_1),
                  .wb_we_i_1(wb_we_1),
                  .wb_sel_i_1(wb_sel_1),
                  
                  .sda_out_1(SDA_OUT_1[14]),
                  .wb_clk_i_2(clock_2[14]),
                  .wb_rst_i_2(reset_2[14]),
                  .wb_stb_i_2(wb_stb_i_2[16]),
                  .wb_dat_o_2(bus_2[14]),
                  .wb_ack_o_2(wb_ack_i2c_2[14]),
                  .wb_adr_i_2(wb_adr_i_2[4:0]),
                  .wb_dat_i_2(wb_dat_i_2),
                  .scl_2(SCL_2[14]),
                  .sda_in_2(SDA_in_2[14]),
                  .wb_int_o_2(wb_i2c_int_2[14]),
                  .wb_cyc_i_2(wb_cyc_2),
                  .wb_we_i_2(wb_we_2),
                  .wb_sel_i_2(wb_sel_2),
                  
                  .sda_out_2(SDA_OUT_2[14]),
                  .wb_clk_i_3(clock_3[14]),
                  .wb_rst_i_3(reset_3[14]),
                  .wb_stb_i_3(wb_stb_i_3[16]),
                  .wb_dat_o_3(bus_3[14]),
                  .wb_ack_o_3(wb_ack_i2c_3[14]),
                  .wb_adr_i_3(wb_adr_i_3[4:0]),
                  .wb_dat_i_3(wb_dat_i_3),
                  .scl_3(SCL_3[14]),
                  .sda_in_3(SDA_in_3[14]),
                  .wb_int_o_3(wb_i2c_int_3[14]),
                  .wb_cyc_i_3(wb_cyc_3),
                  .wb_we_i_3(wb_we_3),
                  .wb_sel_i_3(wb_sel_3),
                  .sda_out_3(SDA_OUT_3[14]),
		  
		  .sclen_1(SCLEN_1[14]),
		  .sclen_2(SCLEN_2[14]),
		  .sclen_3(SCLEN_3[14])
);


wb_i2c_tri i2c_ch_15 (
		  .wb_err_o_1(),
		  .wb_err_o_2(),
		  .wb_err_o_3(),
                  .wb_clk_i_1(clock_1[15]),
                  .wb_rst_i_1(reset_1[15]),
                  .wb_stb_i_1(wb_stb_i_1[17]),
                  .wb_dat_o_1(bus_1[15]),
                  .wb_ack_o_1(wb_ack_i2c_1[15]),
                  .wb_adr_i_1(wb_adr_i_1[4:0]),
                  .wb_dat_i_1(wb_dat_i_1),
                  .scl_1(SCL_1[15]),
                  .sda_in_1(SDA_in_1[15]),
                  .wb_int_o_1(wb_i2c_int_1[15]),
                  .wb_cyc_i_1(wb_cyc_1),
                  .wb_we_i_1(wb_we_1),
                  .wb_sel_i_1(wb_sel_1),
                  
                  .sda_out_1(SDA_OUT_1[15]),
                  .wb_clk_i_2(clock_2[15]),
                  .wb_rst_i_2(reset_2[15]),
                  .wb_stb_i_2(wb_stb_i_2[17]),
                  .wb_dat_o_2(bus_2[15]),
                  .wb_ack_o_2(wb_ack_i2c_2[15]),
                  .wb_adr_i_2(wb_adr_i_2[4:0]),
                  .wb_dat_i_2(wb_dat_i_2),
                  .scl_2(SCL_2[15]),
                  .sda_in_2(SDA_in_2[15]),
                  .wb_int_o_2(wb_i2c_int_2[15]),
                  .wb_cyc_i_2(wb_cyc_2),
                  .wb_we_i_2(wb_we_2),
                  .wb_sel_i_2(wb_sel_2),
                  
                  .sda_out_2(SDA_OUT_2[15]),
                  .wb_clk_i_3(clock_3[15]),
                  .wb_rst_i_3(reset_3[15]),
                  .wb_stb_i_3(wb_stb_i_3[17]),
                  .wb_dat_o_3(bus_3[15]),
                  .wb_ack_o_3(wb_ack_i2c_3[15]),
                  .wb_adr_i_3(wb_adr_i_3[4:0]),
                  .wb_dat_i_3(wb_dat_i_3),
                  .scl_3(SCL_3[15]),
                  .sda_in_3(SDA_in_3[15]),
                  .wb_int_o_3(wb_i2c_int_3[15]),
                  .wb_cyc_i_3(wb_cyc_3),
                  .wb_we_i_3(wb_we_3),
                  .wb_sel_i_3(wb_sel_3),
                  .sda_out_3(SDA_OUT_3[15]),
		  
		  .sclen_1(SCLEN_1[15]),
		  .sclen_2(SCLEN_2[15]),
		  .sclen_3(SCLEN_3[15])
        );


assign wb_dat_o0_1[31:0]  = bus_1[0];
assign wb_dat_o0_2[31:0]  = bus_2[0];
assign wb_dat_o0_3[31:0]  = bus_3[0];

assign wb_dat_o1_1[31:0]  = bus_1[1];
assign wb_dat_o1_2[31:0]  = bus_2[1];
assign wb_dat_o1_3[31:0]  = bus_3[1];

assign wb_dat_o2_1[31:0]  = bus_1[2];
assign wb_dat_o2_2[31:0]  = bus_2[2];
assign wb_dat_o2_3[31:0]  = bus_3[2];

assign wb_dat_o3_1[31:0]  = bus_1[3];
assign wb_dat_o3_2[31:0]  = bus_2[3];
assign wb_dat_o3_3[31:0]  = bus_3[3];

assign wb_dat_o4_1[31:0]  = bus_1[4];
assign wb_dat_o4_2[31:0]  = bus_2[4];
assign wb_dat_o4_3[31:0]  = bus_3[4];

assign wb_dat_o5_1[31:0]  = bus_1[5];
assign wb_dat_o5_2[31:0]  = bus_2[5];
assign wb_dat_o5_3[31:0]  = bus_3[5];

assign wb_dat_o6_1[31:0]  = bus_1[6];
assign wb_dat_o6_2[31:0]  = bus_2[6];
assign wb_dat_o6_3[31:0]  = bus_3[6];

assign wb_dat_o7_1[31:0]  = bus_1[7];
assign wb_dat_o7_2[31:0]  = bus_2[7];
assign wb_dat_o7_3[31:0]  = bus_3[7];

assign wb_dat_o8_1[31:0]  = bus_1[8];
assign wb_dat_o8_2[31:0]  = bus_2[8];
assign wb_dat_o8_3[31:0]  = bus_3[8];

assign wb_dat_o9_1[31:0]  = bus_1[9];
assign wb_dat_o9_2[31:0]  = bus_2[9];
assign wb_dat_o9_3[31:0]  = bus_3[9];

assign wb_dat_o10_1[31:0] = bus_1[10];
assign wb_dat_o10_2[31:0] = bus_2[10];
assign wb_dat_o10_3[31:0] = bus_3[10];

assign wb_dat_o11_1[31:0] = bus_1[11];
assign wb_dat_o11_2[31:0] = bus_2[11];
assign wb_dat_o11_3[31:0] = bus_3[11];

assign wb_dat_o12_1[31:0] = bus_1[12];
assign wb_dat_o12_2[31:0] = bus_2[12];
assign wb_dat_o12_3[31:0] = bus_3[12];

assign wb_dat_o13_1[31:0] = bus_1[13];
assign wb_dat_o13_2[31:0] = bus_2[13];
assign wb_dat_o13_3[31:0] = bus_3[13];

assign wb_dat_o14_1[31:0] = bus_1[14];
assign wb_dat_o14_2[31:0] = bus_2[14];
assign wb_dat_o14_3[31:0] = bus_3[14];

assign wb_dat_o15_1[31:0] = bus_1[15];
assign wb_dat_o15_2[31:0] = bus_2[15];
assign wb_dat_o15_3[31:0] = bus_3[15];

assign wb_ack_out_1 = wb_ack_i2c_1[0] || wb_ack_i2c_1[1] || wb_ack_i2c_1[2] || wb_ack_i2c_1[3] || wb_ack_i2c_1[4] || wb_ack_i2c_1[5] ||  wb_ack_i2c_1[6] || wb_ack_i2c_1[7] || wb_ack_i2c_1[8] || wb_ack_i2c_1[9] || wb_ack_i2c_1[10] || wb_ack_i2c_1[11] || wb_ack_i2c_1[12] || wb_ack_i2c_1[13] ||  wb_ack_i2c_1[14] || wb_ack_i2c_1[15];
assign wb_ack_out_2 = wb_ack_i2c_2[0] || wb_ack_i2c_2[1] || wb_ack_i2c_2[2] || wb_ack_i2c_2[3] || wb_ack_i2c_2[4] || wb_ack_i2c_2[5] ||  wb_ack_i2c_2[6] || wb_ack_i2c_2[7] || wb_ack_i2c_2[8] || wb_ack_i2c_2[9] || wb_ack_i2c_2[10] || wb_ack_i2c_2[11] || wb_ack_i2c_2[12] || wb_ack_i2c_2[13] ||  wb_ack_i2c_2[14] || wb_ack_i2c_2[15];
assign wb_ack_out_3 = wb_ack_i2c_3[0] || wb_ack_i2c_3[1] || wb_ack_i2c_3[2] || wb_ack_i2c_3[3] || wb_ack_i2c_3[4] || wb_ack_i2c_3[5] ||  wb_ack_i2c_3[6] || wb_ack_i2c_3[7] || wb_ack_i2c_3[8] || wb_ack_i2c_3[9] || wb_ack_i2c_3[10] || wb_ack_i2c_3[11] || wb_ack_i2c_3[12] || wb_ack_i2c_3[13] ||  wb_ack_i2c_3[14] || wb_ack_i2c_3[15];

endmodule




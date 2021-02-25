


////////////////////////////////////////////////////////////////////
//                                                                //
//                      E-LINK - triplicated                      //
//                      by Sandro Bonacini                        //
//                                                                //
////////////////////////////////////////////////////////////////////
`include "global_defines.v"
`timescale 1ns/1ps

module elink_tri 
#(
	parameter MASTER = 0,
	 HEADER_FIELD = 1,
	 ADDR_WIDTH = 5,
	 MAX_PACKET_LENGTH = 16, 
	 THRESHOLD = 2**ADDR_WIDTH -MAX_PACKET_LENGTH-1
)
 (
input [15:0]  tx_dat_1,
input [15:0]  tx_dat_2,
input [15:0]  tx_dat_3,
output [15:0]  rx_dat_1,
output [15:0]  rx_dat_2,
output [15:0]  rx_dat_3,
input  rx_sd_1, rx_sd_aux_1, link_clk_1, link_clk_aux_1, rx_dav_1, 
input  rx_sd_2, rx_sd_aux_2, link_clk_2, link_clk_aux_2, rx_dav_2, 
input  rx_sd_3, rx_sd_aux_3, link_clk_3, link_clk_aux_3, rx_dav_3, 
output  tx_sd_1, tx_sd_aux_1, rx_ena_1, rx_eop_1, tx_dav_1, rx_sop_1, rx_err_1,
output  tx_sd_2, tx_sd_aux_2, rx_ena_2, rx_eop_2, tx_dav_2, rx_sop_2, rx_err_2,
output  tx_sd_3, tx_sd_aux_3, rx_ena_3, rx_eop_3, tx_dav_3, rx_sop_3, rx_err_3,
input  resetb_1, tx_ena_1,
input  resetb_2, tx_ena_2,
input  resetb_3, tx_ena_3,
output  user_clk_1,
output  user_clk_2,
output  user_clk_3,
input [7:0]  tx_adr_1,
input [7:0]  tx_adr_2,
input [7:0]  tx_adr_3,
output [7:0]  rx_adr_1,
output [7:0]  rx_adr_2,
output [7:0]  rx_adr_3,
input  tx_cmd_reset_1, tx_cmd_test_1, tx_cmd_sabm_1, disable_aux_1,
input  tx_cmd_reset_2, tx_cmd_test_2, tx_cmd_sabm_2, disable_aux_2,
input  tx_cmd_reset_3, tx_cmd_test_3, tx_cmd_sabm_3, disable_aux_3,
output  rx_cmd_reset_1, rx_cmd_test_1, rx_cmd_ua_1,
output  rx_cmd_reset_2, rx_cmd_test_2, rx_cmd_ua_2,
output  rx_cmd_reset_3, rx_cmd_test_3, rx_cmd_ua_3,
input [3:0]  tx_cset_1,
input [3:0]  tx_cset_2,
input [3:0]  tx_cset_3,
output [2:0]  tx_ns_1, rx_nr_1,rx_ns_1,
output [2:0]  tx_ns_2, rx_nr_2,rx_ns_2,
output [2:0]  tx_ns_3, rx_nr_3,rx_ns_3,
output [6:0]  rx_cmd_srej_1,
output [6:0]  rx_cmd_srej_2,
output [6:0]  rx_cmd_srej_3,
output  cmd_busy_1,
output  cmd_busy_2,
output  cmd_busy_3,
output  active_aux_1,
output  active_aux_2,
output  active_aux_3
);
wire [1:0]  rx_sdr_pri_1, rx_sdr_aux_1, tx_sdr_1;
wire [1:0]  rx_sdr_pri_2, rx_sdr_aux_2, tx_sdr_2;
wire [1:0]  rx_sdr_pri_3, rx_sdr_aux_3, tx_sdr_3;
wire [2:0]  rx_vr_1;
wire [2:0]  rx_vr_2;
wire [2:0]  rx_vr_3;
wire [6:0]  tx_cmd_srej_1;
wire [6:0]  tx_cmd_srej_2;
wire [6:0]  tx_cmd_srej_3;
wire [7:0]  rx_dat_pri_1,rx_dat_aux_1,tx_dat__1;
wire [7:0]  rx_dat_pri_2,rx_dat_aux_2,tx_dat__2;
wire [7:0]  rx_dat_pri_3,rx_dat_aux_3,tx_dat__3;

HDLC_tri #(.MASTER(MASTER),.HEADER_FIELD(HEADER_FIELD), .ADDR_WIDTH(ADDR_WIDTH),.MAX_PACKET_LENGTH(MAX_PACKET_LENGTH)) HDLC (
		.user_clk_pri_1(user_clk_pri_1), 
		.user_clk_aux_1(user_clk_aux_1),
		.user_clk_1(user_clk_1),
		.rx_dat_1(rx_dat_1),
		.rx_sdr_1(rx_sdr_pri_1),
		.rx_sdr_aux_1(rx_sdr_aux_1),
		.rx_ena_1(rx_ena_1),
		.rx_dav_1(rx_dav_1),
		.rx_eop_1(rx_eop_1),
		.rx_sop_1(rx_sop_1),
		.rx_adr_1(rx_adr_1),
		.rx_err_1(rx_err_1),
		.rx_nr_1(rx_nr_1),
		.rx_ns_1(rx_ns_1),
		.rx_cmd_ua_1(rx_cmd_ua_1),
		.rx_cmd_srej_1(rx_cmd_srej_1),
		.resetb_1(resetb_1),
		.rx_cmd_reset_1(rx_cmd_reset_1),
		.rx_cmd_test_1(rx_cmd_test_1),
		.tx_dat_1(tx_dat_1),
		.tx_sdr_1(tx_sdr_1),
		.tx_ena_1(tx_ena_1),
		.tx_dav_1(tx_dav_1),
		.tx_adr_1(tx_adr_1),
		.tx_ns_1(tx_ns_1),
		.cmd_busy_1(cmd_busy_1),
		.tx_cmd_sabm_1(tx_cmd_sabm_1),
		.tx_cmd_reset_1(tx_cmd_reset_1),
		.tx_cmd_test_1(tx_cmd_test_1),
		.active_aux_1(active_aux_1),
		.disable_aux_1(disable_aux_1),
		.user_clk_pri_2(user_clk_pri_2), 
		.user_clk_aux_2(user_clk_aux_2),
		.user_clk_2(user_clk_2),
		.rx_dat_2(rx_dat_2),
		.rx_sdr_2(rx_sdr_pri_2),
		.rx_sdr_aux_2(rx_sdr_aux_2),
		.rx_ena_2(rx_ena_2),
		.rx_dav_2(rx_dav_2),
		.rx_eop_2(rx_eop_2),
		.rx_sop_2(rx_sop_2),
		.rx_adr_2(rx_adr_2),
		.rx_err_2(rx_err_2),
		.rx_nr_2(rx_nr_2),
		.rx_ns_2(rx_ns_2),
		.rx_cmd_ua_2(rx_cmd_ua_2),
		.rx_cmd_srej_2(rx_cmd_srej_2),
		.resetb_2(resetb_2),
		.rx_cmd_reset_2(rx_cmd_reset_2),
		.rx_cmd_test_2(rx_cmd_test_2),
		.tx_dat_2(tx_dat_2),
		.tx_sdr_2(tx_sdr_2),
		.tx_ena_2(tx_ena_2),
		.tx_dav_2(tx_dav_2),
		.tx_adr_2(tx_adr_2),
		.tx_ns_2(tx_ns_2),
		.cmd_busy_2(cmd_busy_2),
		.tx_cmd_sabm_2(tx_cmd_sabm_2),
		.tx_cmd_reset_2(tx_cmd_reset_2),
		.tx_cmd_test_2(tx_cmd_test_2),
		.active_aux_2(active_aux_2),
		.disable_aux_2(disable_aux_2),
		.user_clk_pri_3(user_clk_pri_3), 
		.user_clk_aux_3(user_clk_aux_3),
		.user_clk_3(user_clk_3),
		.rx_dat_3(rx_dat_3),
		.rx_sdr_3(rx_sdr_pri_3),
		.rx_sdr_aux_3(rx_sdr_aux_3),
		.rx_ena_3(rx_ena_3),
		.rx_dav_3(rx_dav_3),
		.rx_eop_3(rx_eop_3),
		.rx_sop_3(rx_sop_3),
		.rx_adr_3(rx_adr_3),
		.rx_err_3(rx_err_3),
		.rx_nr_3(rx_nr_3),
		.rx_ns_3(rx_ns_3),
		.rx_cmd_ua_3(rx_cmd_ua_3),
		.rx_cmd_srej_3(rx_cmd_srej_3),
		.resetb_3(resetb_3),
		.rx_cmd_reset_3(rx_cmd_reset_3),
		.rx_cmd_test_3(rx_cmd_test_3),
		.tx_dat_3(tx_dat_3),
		.tx_sdr_3(tx_sdr_3),
		.tx_ena_3(tx_ena_3),
		.tx_dav_3(tx_dav_3),
		.tx_adr_3(tx_adr_3),
		.tx_ns_3(tx_ns_3),
		.cmd_busy_3(cmd_busy_3),
		.tx_cmd_sabm_3(tx_cmd_sabm_3),
		.tx_cmd_reset_3(tx_cmd_reset_3),
		.tx_cmd_test_3(tx_cmd_test_3),
		.active_aux_3(active_aux_3),
		.disable_aux_3(disable_aux_3)
	);


serdes_tri serdes_pri (
		.rx_sd_1(rx_sd_1),
		.tx_sd_1(tx_sd_1),
		.rx_clk_1(link_clk_1),
		.rx_dat_1(rx_dat_pri_1),
		.tx_dat_1(tx_dat__1),
		.clk40_1(user_clk_pri_1),
		.clkdiv_skip_1(gnd_1),
		.resetb_1(vdd_1),
		.rx_off_1(gnd_1),
		.tx_off_1(tx_off_1),
		.rx_sd_2(rx_sd_2),
		.tx_sd_2(tx_sd_2),
		.rx_clk_2(link_clk_2),
		.rx_dat_2(rx_dat_pri_2),
		.tx_dat_2(tx_dat__2),
		.clk40_2(user_clk_pri_2),
		.clkdiv_skip_2(gnd_2),
		.resetb_2(vdd_2),
		.rx_off_2(gnd_2),
		.tx_off_2(tx_off_2),
		.rx_sd_3(rx_sd_3),
		.tx_sd_3(tx_sd_3),
		.rx_clk_3(link_clk_3),
		.rx_dat_3(rx_dat_pri_3),
		.tx_dat_3(tx_dat__3),
		.clk40_3(user_clk_pri_3),
		.clkdiv_skip_3(gnd_3),
		.resetb_3(vdd_3),
		.rx_off_3(gnd_3),
		.tx_off_3(tx_off_3)
	);


serdes_tri serdes_aux (
		.rx_sd_1(rx_sd_aux_1),
		.tx_sd_1(tx_sd_aux_1),
		.rx_clk_1(link_clk_aux_1),
		.rx_dat_1(rx_dat_aux_1),
		.tx_dat_1(tx_dat__1),
		.clk40_1(user_clk_aux_1),
		.clkdiv_skip_1(gnd_1),
		.resetb_1(vdd_1),
		.rx_off_1(gnd_1),
		.tx_off_1(tx_off_1),
		.rx_sd_2(rx_sd_aux_2),
		.tx_sd_2(tx_sd_aux_2),
		.rx_clk_2(link_clk_aux_2),
		.rx_dat_2(rx_dat_aux_2),
		.tx_dat_2(tx_dat__2),
		.clk40_2(user_clk_aux_2),
		.clkdiv_skip_2(gnd_2),
		.resetb_2(vdd_2),
		.rx_off_2(gnd_2),
		.tx_off_2(tx_off_2),
		.rx_sd_3(rx_sd_aux_3),
		.tx_sd_3(tx_sd_aux_3),
		.rx_clk_3(link_clk_aux_3),
		.rx_dat_3(rx_dat_aux_3),
		.tx_dat_3(tx_dat__3),
		.clk40_3(user_clk_aux_3),
		.clkdiv_skip_3(gnd_3),
		.resetb_3(vdd_3),
		.rx_off_3(gnd_3),
		.tx_off_3(tx_off_3)
	);


assign link_clkb_1= ~link_clk_1;
assign link_clkb_2= ~link_clk_2;
assign link_clkb_3= ~link_clk_3;

assign rx_sdr_pri_1 = rx_dat_pri_1[1:0];
assign rx_sdr_pri_2 = rx_dat_pri_2[1:0];
assign rx_sdr_pri_3 = rx_dat_pri_3[1:0];

assign tx_dat__1 = {6'b0,tx_sdr_1};
assign tx_dat__2 = {6'b0,tx_sdr_2};
assign tx_dat__3 = {6'b0,tx_sdr_3};

assign tx_off_1 = tx_cset_1==4'b1111;
assign tx_off_2 = tx_cset_2==4'b1111;
assign tx_off_3 = tx_cset_3==4'b1111;

assign gnd_1 = 1'b0;
assign gnd_2 = 1'b0;
assign gnd_3 = 1'b0;

assign vdd_1=1'b1;
assign vdd_2=1'b1;
assign vdd_3=1'b1;

assign link_clk_auxb_1= ~link_clk_aux_1;
assign link_clk_auxb_2= ~link_clk_aux_2;
assign link_clk_auxb_3= ~link_clk_aux_3;

assign rx_sdr_aux_1 = rx_dat_aux_1[1:0];
assign rx_sdr_aux_2 = rx_dat_aux_2[1:0];
assign rx_sdr_aux_3 = rx_dat_aux_3[1:0];
endmodule








module rx_tri 
#(
	 parameter 	HEADER_FIELD = 1,
	 			ADDR_WIDTH = 8
)
 (
output [15:0]  rx_dat_1,
output [15:0]  rx_dat_2,
output [15:0]  rx_dat_3,
output  rx_ena_1, rx_eop_1, rx_sop_1, rx_err_1,
output  rx_ena_2, rx_eop_2, rx_sop_2, rx_err_2,
output  rx_ena_3, rx_eop_3, rx_sop_3, rx_err_3,
output [7:0]  rx_adr_1,
output [7:0]  rx_adr_2,
output [7:0]  rx_adr_3,
output  rx_cmd_reset_1, rx_cmd_test_1,rx_cmd_ua_1, active_aux_1, tx_cmd_ua_1,
output  rx_cmd_reset_2, rx_cmd_test_2,rx_cmd_ua_2, active_aux_2, tx_cmd_ua_2,
output  rx_cmd_reset_3, rx_cmd_test_3,rx_cmd_ua_3, active_aux_3, tx_cmd_ua_3,
output [6:0]  rx_cmd_srej_1,
output [6:0]  rx_cmd_srej_2,
output [6:0]  rx_cmd_srej_3,
output [6:0]  tx_cmd_srej_1,
output [6:0]  tx_cmd_srej_2,
output [6:0]  tx_cmd_srej_3,
output [2:0]  rx_vr_1, rx_nr_1, rx_ns_1,
output [2:0]  rx_vr_2, rx_nr_2, rx_ns_2,
output [2:0]  rx_vr_3, rx_nr_3, rx_ns_3,
input  clk_pri_1, rx_dav_1, clk_aux_1, clk_active_1,
input  clk_pri_2, rx_dav_2, clk_aux_2, clk_active_2,
input  clk_pri_3, rx_dav_3, clk_aux_3, clk_active_3,
input [1:0]  rx_sdr_pri_1, rx_sdr_aux_1,
input [1:0]  rx_sdr_pri_2, rx_sdr_aux_2,
input [1:0]  rx_sdr_pri_3, rx_sdr_aux_3,
input  resetb_1, disable_aux_1,
input  resetb_2, disable_aux_2,
input  resetb_3, disable_aux_3,
input  cmd_busy_1, tx_cmd_reset_1,
input  cmd_busy_2, tx_cmd_reset_2,
input  cmd_busy_3, tx_cmd_reset_3
);
wire [7:0]  phy_data_pri_1, phy_data_aux_1;
wire [7:0]  phy_data_pri_2, phy_data_aux_2;
wire [7:0]  phy_data_pri_3, phy_data_aux_3;
wire [16:0]  fifo_data_w_pri_1, fifo_data_w_aux_1;
wire [16:0]  fifo_data_w_pri_2, fifo_data_w_aux_2;
wire [16:0]  fifo_data_w_pri_3, fifo_data_w_aux_3;
wire [16:0]  fifo_data_r_1;
wire [16:0]  fifo_data_r_2;
wire [16:0]  fifo_data_r_3;
wire [ADDR_WIDTH-1:0]  fifo_addr_r_pri_1, fifo_addr_w_pri_1, fifo_addr_w_1;
wire [ADDR_WIDTH-1:0]  fifo_addr_r_pri_2, fifo_addr_w_pri_2, fifo_addr_w_2;
wire [ADDR_WIDTH-1:0]  fifo_addr_r_pri_3, fifo_addr_w_pri_3, fifo_addr_w_3;
wire [ADDR_WIDTH-1:0]  fifo_addr_r_aux_1, fifo_addr_w_aux_1, fifo_addr_r_1;
wire [ADDR_WIDTH-1:0]  fifo_addr_r_aux_2, fifo_addr_w_aux_2, fifo_addr_r_2;
wire [ADDR_WIDTH-1:0]  fifo_addr_r_aux_3, fifo_addr_w_aux_3, fifo_addr_r_3;
wire [16:0]  fifo_data_w_1 = active_aux_1 ? fifo_data_w_aux_1 : fifo_data_w_pri_1;
wire [16:0]  fifo_data_w_2 = active_aux_2 ? fifo_data_w_aux_2 : fifo_data_w_pri_2;
wire [16:0]  fifo_data_w_3 = active_aux_3 ? fifo_data_w_aux_3 : fifo_data_w_pri_3;
wire [6:0]  rx_cmd_srej_pri_1, rx_cmd_srej_aux_1;
wire [6:0]  rx_cmd_srej_pri_2, rx_cmd_srej_aux_2;
wire [6:0]  rx_cmd_srej_pri_3, rx_cmd_srej_aux_3;
wire [6:0]  tx_cmd_srej_pri_1, tx_cmd_srej_aux_1;
wire [6:0]  tx_cmd_srej_pri_2, tx_cmd_srej_aux_2;
wire [6:0]  tx_cmd_srej_pri_3, tx_cmd_srej_aux_3;
wire [2:0]  rx_vr_pri_1, rx_nr_pri_1, rx_ns_pri_1;
wire [2:0]  rx_vr_pri_2, rx_nr_pri_2, rx_ns_pri_2;
wire [2:0]  rx_vr_pri_3, rx_nr_pri_3, rx_ns_pri_3;
wire [2:0]  rx_vr_aux_1, rx_nr_aux_1, rx_ns_aux_1;
wire [2:0]  rx_vr_aux_2, rx_nr_aux_2, rx_ns_aux_2;
wire [2:0]  rx_vr_aux_3, rx_nr_aux_3, rx_ns_aux_3;
wire [15:0]  rx_dat_pri_1, rx_dat_aux_1;
wire [15:0]  rx_dat_pri_2, rx_dat_aux_2;
wire [15:0]  rx_dat_pri_3, rx_dat_aux_3;
wire [7:0]  rx_adr_pri_1, rx_adr_aux_1;
wire [7:0]  rx_adr_pri_2, rx_adr_aux_2;
wire [7:0]  rx_adr_pri_3, rx_adr_aux_3;
wire [23:0]  dec_in_1, enc_out_1;
wire [23:0]  dec_in_2, enc_out_2;
wire [23:0]  dec_in_3, enc_out_3;
wire [15:0]  crc_pri_1, crc_aux_1;
wire [15:0]  crc_pri_2, crc_aux_2;
wire [15:0]  crc_pri_3, crc_aux_3;
wire  rx_cmd_reset_aux_1;
wire  rx_cmd_reset_aux_2;
wire  rx_cmd_reset_aux_3;
wire [24:0]  SRAM_data_r_1, SRAM_data_w_1;
wire [24:0]  SRAM_data_r_2, SRAM_data_w_2;
wire [24:0]  SRAM_data_r_3, SRAM_data_w_3;

MAC_rx_tri #(.HEADER_FIELD(HEADER_FIELD), .ADDR_WIDTH(ADDR_WIDTH)) MAC_rx_pri (
		.clk_1(clk_pri_1),
		.resetb_1(resetb_1),
		.rx_dav_1(rx_dav_1),
		.fifo_data_r_1(fifo_data_r_1),
		.cmd_busy_1(cmd_busy_1),
		.rx_dat_1(rx_dat_pri_1),
		.rx_ena_1(rx_ena_pri_1),
		.rx_ena_pre_1(rx_ena_pre_pri_1),
		.rx_eop_1(rx_eop_pri_1),
		.rx_sop_1(rx_sop_pri_1),
		.rx_adr_1(rx_adr_pri_1),
		.rx_err_1(rx_err_pri_1),
		.rx_vr_1(rx_vr_pri_1),
		.rx_ns_1(rx_ns_pri_1),
		.rx_nr_1(rx_nr_pri_1),
		.rx_cmd_reset_1(),
		.rx_cmd_test_1(rx_cmd_test_pri_1),
		.rx_cmd_ua_1(rx_cmd_ua_pri_1),
		.rx_cmd_sabm_1(rx_cmd_sabm_pri_1),
		.rx_cmd_srej_1(rx_cmd_srej_pri_1),
		.tx_cmd_srej_1(tx_cmd_srej_pri_1),
		.tx_cmd_reset_1(tx_cmd_reset_1),
		.phy_data_1(phy_data_pri_1),
		.phy_dvalid_1(phy_dvalid_pri_1),
		.phy_dstrobe_1(phy_dstrobe_pri_1),
		.crc_zero_1(crc_zero_pri_1),
		.fifo_data_w_1(fifo_data_w_pri_1),
		.fifo_addr_w_1(fifo_addr_w_pri_1),
		.fifo_addr_r_1(fifo_addr_r_pri_1),
		.fifo_w_1(fifo_w_pri_1),
		.active_1(active_pri_1),
		.disconnect_1(disconnect_pri_dis_1),
		.tx_cmd_ua_1(tx_cmd_ua_pri_1),
		.clk_2(clk_pri_2),
		.resetb_2(resetb_2),
		.rx_dav_2(rx_dav_2),
		.fifo_data_r_2(fifo_data_r_2),
		.cmd_busy_2(cmd_busy_2),
		.rx_dat_2(rx_dat_pri_2),
		.rx_ena_2(rx_ena_pri_2),
		.rx_ena_pre_2(rx_ena_pre_pri_2),
		.rx_eop_2(rx_eop_pri_2),
		.rx_sop_2(rx_sop_pri_2),
		.rx_adr_2(rx_adr_pri_2),
		.rx_err_2(rx_err_pri_2),
		.rx_vr_2(rx_vr_pri_2),
		.rx_ns_2(rx_ns_pri_2),
		.rx_nr_2(rx_nr_pri_2),
		.rx_cmd_reset_2(rx_cmd_reset_pri_2),
		.rx_cmd_test_2(rx_cmd_test_pri_2),
		.rx_cmd_ua_2(rx_cmd_ua_pri_2),
		.rx_cmd_sabm_2(rx_cmd_sabm_pri_2),
		.rx_cmd_srej_2(rx_cmd_srej_pri_2),
		.tx_cmd_srej_2(tx_cmd_srej_pri_2),
		.tx_cmd_reset_2(tx_cmd_reset_2),
		.phy_data_2(phy_data_pri_2),
		.phy_dvalid_2(phy_dvalid_pri_2),
		.phy_dstrobe_2(phy_dstrobe_pri_2),
		.crc_zero_2(crc_zero_pri_2),
		.fifo_data_w_2(fifo_data_w_pri_2),
		.fifo_addr_w_2(fifo_addr_w_pri_2),
		.fifo_addr_r_2(fifo_addr_r_pri_2),
		.fifo_w_2(fifo_w_pri_2),
		.active_2(active_pri_2),
		.disconnect_2(disconnect_pri_dis_2),
		.tx_cmd_ua_2(tx_cmd_ua_pri_2),
		.clk_3(clk_pri_3),
		.resetb_3(resetb_3),
		.rx_dav_3(rx_dav_3),
		.fifo_data_r_3(fifo_data_r_3),
		.cmd_busy_3(cmd_busy_3),
		.rx_dat_3(rx_dat_pri_3),
		.rx_ena_3(rx_ena_pri_3),
		.rx_ena_pre_3(rx_ena_pre_pri_3),
		.rx_eop_3(rx_eop_pri_3),
		.rx_sop_3(rx_sop_pri_3),
		.rx_adr_3(rx_adr_pri_3),
		.rx_err_3(rx_err_pri_3),
		.rx_vr_3(rx_vr_pri_3),
		.rx_ns_3(rx_ns_pri_3),
		.rx_nr_3(rx_nr_pri_3),
		.rx_cmd_reset_3(rx_cmd_reset_pri_3),
		.rx_cmd_test_3(rx_cmd_test_pri_3),
		.rx_cmd_ua_3(rx_cmd_ua_pri_3),
		.rx_cmd_sabm_3(rx_cmd_sabm_pri_3),
		.rx_cmd_srej_3(rx_cmd_srej_pri_3),
		.tx_cmd_srej_3(tx_cmd_srej_pri_3),
		.tx_cmd_reset_3(tx_cmd_reset_3),
		.phy_data_3(phy_data_pri_3),
		.phy_dvalid_3(phy_dvalid_pri_3),
		.phy_dstrobe_3(phy_dstrobe_pri_3),
		.crc_zero_3(crc_zero_pri_3),
		.fifo_data_w_3(fifo_data_w_pri_3),
		.fifo_addr_w_3(fifo_addr_w_pri_3),
		.fifo_addr_r_3(fifo_addr_r_pri_3),
		.fifo_w_3(fifo_w_pri_3),
		.active_3(active_pri_3),
		.disconnect_3(disconnect_pri_dis_3),
		.tx_cmd_ua_3(tx_cmd_ua_pri_3),
		.rx_cmd_reset(rx_cmd_reset_pri_1)
	);

MAC_rx_tri #(.HEADER_FIELD(HEADER_FIELD), .ADDR_WIDTH(ADDR_WIDTH)) MAC_rx_aux (
		.rx_cmd_reset(rx_cmd_reset_aux_1),
		.clk_1(clk_aux_dis_1),
		.resetb_1(resetb_dis_1),
		.rx_dav_1(rx_dav_1),
		.fifo_data_r_1(fifo_data_r_1),
		.cmd_busy_1(cmd_busy_1),
		.rx_dat_1(rx_dat_aux_1),
		.rx_ena_1(rx_ena_aux_1),
		.rx_ena_pre_1(rx_ena_pre_aux_1),
		.rx_eop_1(rx_eop_aux_1),
		.rx_sop_1(rx_sop_aux_1),
		.rx_adr_1(rx_adr_aux_1),
		.rx_err_1(rx_err_aux_1),
		.rx_vr_1(rx_vr_aux_1),
		.rx_ns_1(rx_ns_aux_1),
		.rx_nr_1(rx_nr_aux_1),
		.rx_cmd_reset_1(),
		.rx_cmd_test_1(rx_cmd_test_aux_1),
		.rx_cmd_ua_1(rx_cmd_ua_aux_1),
		.rx_cmd_sabm_1(rx_cmd_sabm_aux_1),
		.rx_cmd_srej_1(rx_cmd_srej_aux_1),
		.tx_cmd_srej_1(tx_cmd_srej_aux_1),
		.tx_cmd_reset_1(tx_cmd_reset_1),
		.phy_data_1(phy_data_aux_1),
		.phy_dvalid_1(phy_dvalid_aux_1),
		.phy_dstrobe_1(phy_dstrobe_aux_1),
		.crc_zero_1(crc_zero_aux_1),
		.fifo_data_w_1(fifo_data_w_aux_1),
		.fifo_addr_w_1(fifo_addr_w_aux_1),
		.fifo_addr_r_1(fifo_addr_r_aux_1),
		.fifo_w_1(fifo_w_aux_1),
		.active_1(active_aux_1),
		.disconnect_1(disconnect_aux_1),
		.tx_cmd_ua_1(tx_cmd_ua_aux_1),
		.clk_2(clk_aux_dis_2),
		.resetb_2(resetb_dis_2),
		.rx_dav_2(rx_dav_2),
		.fifo_data_r_2(fifo_data_r_2),
		.cmd_busy_2(cmd_busy_2),
		.rx_dat_2(rx_dat_aux_2),
		.rx_ena_2(rx_ena_aux_2),
		.rx_ena_pre_2(rx_ena_pre_aux_2),
		.rx_eop_2(rx_eop_aux_2),
		.rx_sop_2(rx_sop_aux_2),
		.rx_adr_2(rx_adr_aux_2),
		.rx_err_2(rx_err_aux_2),
		.rx_vr_2(rx_vr_aux_2),
		.rx_ns_2(rx_ns_aux_2),
		.rx_nr_2(rx_nr_aux_2),
		.rx_cmd_reset_2(rx_cmd_reset_aux_2),
		.rx_cmd_test_2(rx_cmd_test_aux_2),
		.rx_cmd_ua_2(rx_cmd_ua_aux_2),
		.rx_cmd_sabm_2(rx_cmd_sabm_aux_2),
		.rx_cmd_srej_2(rx_cmd_srej_aux_2),
		.tx_cmd_srej_2(tx_cmd_srej_aux_2),
		.tx_cmd_reset_2(tx_cmd_reset_2),
		.phy_data_2(phy_data_aux_2),
		.phy_dvalid_2(phy_dvalid_aux_2),
		.phy_dstrobe_2(phy_dstrobe_aux_2),
		.crc_zero_2(crc_zero_aux_2),
		.fifo_data_w_2(fifo_data_w_aux_2),
		.fifo_addr_w_2(fifo_addr_w_aux_2),
		.fifo_addr_r_2(fifo_addr_r_aux_2),
		.fifo_w_2(fifo_w_aux_2),
		.active_2(active_aux_2),
		.disconnect_2(disconnect_aux_2),
		.tx_cmd_ua_2(tx_cmd_ua_aux_2),
		.clk_3(clk_aux_dis_3),
		.resetb_3(resetb_dis_3),
		.rx_dav_3(rx_dav_3),
		.fifo_data_r_3(fifo_data_r_3),
		.cmd_busy_3(cmd_busy_3),
		.rx_dat_3(rx_dat_aux_3),
		.rx_ena_3(rx_ena_aux_3),
		.rx_ena_pre_3(rx_ena_pre_aux_3),
		.rx_eop_3(rx_eop_aux_3),
		.rx_sop_3(rx_sop_aux_3),
		.rx_adr_3(rx_adr_aux_3),
		.rx_err_3(rx_err_aux_3),
		.rx_vr_3(rx_vr_aux_3),
		.rx_ns_3(rx_ns_aux_3),
		.rx_nr_3(rx_nr_aux_3),
		.rx_cmd_reset_3(rx_cmd_reset_aux_3),
		.rx_cmd_test_3(rx_cmd_test_aux_3),
		.rx_cmd_ua_3(rx_cmd_ua_aux_3),
		.rx_cmd_sabm_3(rx_cmd_sabm_aux_3),
		.rx_cmd_srej_3(rx_cmd_srej_aux_3),
		.tx_cmd_srej_3(tx_cmd_srej_aux_3),
		.tx_cmd_reset_3(tx_cmd_reset_3),
		.phy_data_3(phy_data_aux_3),
		.phy_dvalid_3(phy_dvalid_aux_3),
		.phy_dstrobe_3(phy_dstrobe_aux_3),
		.crc_zero_3(crc_zero_aux_3),
		.fifo_data_w_3(fifo_data_w_aux_3),
		.fifo_addr_w_3(fifo_addr_w_aux_3),
		.fifo_addr_r_3(fifo_addr_r_aux_3),
		.fifo_w_3(fifo_w_aux_3),
		.active_3(active_aux_3),
		.disconnect_3(disconnect_aux_3),
		.tx_cmd_ua_3(tx_cmd_ua_aux_3)
	);



DELAY6_C delay_disconnect_pri_1 (.Z(disconnect_pri_del1_1),.A(disconnect_pri_1)
		`ifdef RC
		`else
			, .VDD(), .GND(), .NW(), .SX()
		`endif
	);
DELAY6_C delay_disconnect_pri_2 (.Z(disconnect_pri_del1_2),.A(disconnect_pri_2)
		`ifdef RC
		`else
			, .VDD(), .GND(), .NW(), .SX()
		`endif
	);
DELAY6_C delay_disconnect_pri_3 (.Z(disconnect_pri_del1_3),.A(disconnect_pri_3)
		`ifdef RC
		`else
			, .VDD(), .GND(), .NW(), .SX()
		`endif
	);


DELAY6_C delay_disconnect_pri1_1 (.Z(disconnect_pri_del2_1),.A(disconnect_pri_del1_1)
		`ifdef RC
		`else
			, .VDD(), .GND(), .NW(), .SX()
		`endif
	);
DELAY6_C delay_disconnect_pri1_2 (.Z(disconnect_pri_del2_2),.A(disconnect_pri_del1_2)
		`ifdef RC
		`else
			, .VDD(), .GND(), .NW(), .SX()
		`endif
	);
DELAY6_C delay_disconnect_pri1_3 (.Z(disconnect_pri_del2_3),.A(disconnect_pri_del1_3)
		`ifdef RC
		`else
			, .VDD(), .GND(), .NW(), .SX()
		`endif
	);


DELAY6_C delay_disconnect_pri2_1 (.Z(disconnect_pri_del3_1),.A(disconnect_pri_del2_1)
		`ifdef RC
		`else
			, .VDD(), .GND(), .NW(), .SX()
		`endif
	);
DELAY6_C delay_disconnect_pri2_2 (.Z(disconnect_pri_del3_2),.A(disconnect_pri_del2_2)
		`ifdef RC
		`else
			, .VDD(), .GND(), .NW(), .SX()
		`endif
	);
DELAY6_C delay_disconnect_pri2_3 (.Z(disconnect_pri_del3_3),.A(disconnect_pri_del2_3)
		`ifdef RC
		`else
			, .VDD(), .GND(), .NW(), .SX()
		`endif
	);


DELAY6_C delay_disconnect_pri3_1 (.Z(disconnect_pri_del4_1),.A(disconnect_pri_del3_1)
		`ifdef RC
		`else
			, .VDD(), .GND(), .NW(), .SX()
		`endif
	);
DELAY6_C delay_disconnect_pri3_2 (.Z(disconnect_pri_del4_2),.A(disconnect_pri_del3_2)
		`ifdef RC
		`else
			, .VDD(), .GND(), .NW(), .SX()
		`endif
	);
DELAY6_C delay_disconnect_pri3_3 (.Z(disconnect_pri_del4_3),.A(disconnect_pri_del3_3)
		`ifdef RC
		`else
			, .VDD(), .GND(), .NW(), .SX()
		`endif
	);


DELAY6_C delay_disconnect_pri4_1 (.Z(disconnect_pri_del_1),.A(disconnect_pri_del4_1)
		`ifdef RC
		`else
			, .VDD(), .GND(), .NW(), .SX()
		`endif
	);
DELAY6_C delay_disconnect_pri4_2 (.Z(disconnect_pri_del_2),.A(disconnect_pri_del4_2)
		`ifdef RC
		`else
			, .VDD(), .GND(), .NW(), .SX()
		`endif
	);
DELAY6_C delay_disconnect_pri4_3 (.Z(disconnect_pri_del_3),.A(disconnect_pri_del4_3)
		`ifdef RC
		`else
			, .VDD(), .GND(), .NW(), .SX()
		`endif
	);


DELAY6_C delay_disconnect_aux_1 (.Z(disconnect_aux_del1_1),.A(disconnect_aux_1)
		`ifdef RC
		`else
			, .VDD(), .GND(), .NW(), .SX()
		`endif
	);
DELAY6_C delay_disconnect_aux_2 (.Z(disconnect_aux_del1_2),.A(disconnect_aux_2)
		`ifdef RC
		`else
			, .VDD(), .GND(), .NW(), .SX()
		`endif
	);
DELAY6_C delay_disconnect_aux_3 (.Z(disconnect_aux_del1_3),.A(disconnect_aux_3)
		`ifdef RC
		`else
			, .VDD(), .GND(), .NW(), .SX()
		`endif
	);


DELAY6_C delay_disconnect_aux1_1 (.Z(disconnect_aux_del2_1),.A(disconnect_aux_del1_1)
		`ifdef RC
		`else
			, .VDD(), .GND(), .NW(), .SX()
		`endif
	);
DELAY6_C delay_disconnect_aux1_2 (.Z(disconnect_aux_del2_2),.A(disconnect_aux_del1_2)
		`ifdef RC
		`else
			, .VDD(), .GND(), .NW(), .SX()
		`endif
	);
DELAY6_C delay_disconnect_aux1_3 (.Z(disconnect_aux_del2_3),.A(disconnect_aux_del1_3)
		`ifdef RC
		`else
			, .VDD(), .GND(), .NW(), .SX()
		`endif
	);


DELAY6_C delay_disconnect_aux2_1 (.Z(disconnect_aux_del3_1),.A(disconnect_aux_del2_1)
		`ifdef RC
		`else
			, .VDD(), .GND(), .NW(), .SX()
		`endif
	);
DELAY6_C delay_disconnect_aux2_2 (.Z(disconnect_aux_del3_2),.A(disconnect_aux_del2_2)
		`ifdef RC
		`else
			, .VDD(), .GND(), .NW(), .SX()
		`endif
	);
DELAY6_C delay_disconnect_aux2_3 (.Z(disconnect_aux_del3_3),.A(disconnect_aux_del2_3)
		`ifdef RC
		`else
			, .VDD(), .GND(), .NW(), .SX()
		`endif
	);


DELAY6_C delay_disconnect_aux3_1 (.Z(disconnect_aux_del4_1),.A(disconnect_aux_del3_1)
		`ifdef RC
		`else
			, .VDD(), .GND(), .NW(), .SX()
		`endif
	);
DELAY6_C delay_disconnect_aux3_2 (.Z(disconnect_aux_del4_2),.A(disconnect_aux_del3_2)
		`ifdef RC
		`else
			, .VDD(), .GND(), .NW(), .SX()
		`endif
	);
DELAY6_C delay_disconnect_aux3_3 (.Z(disconnect_aux_del4_3),.A(disconnect_aux_del3_3)
		`ifdef RC
		`else
			, .VDD(), .GND(), .NW(), .SX()
		`endif
	);


DELAY6_C delay_disconnect_aux4_1 (.Z(disconnect_aux_del_1),.A(disconnect_aux_del4_1)
		`ifdef RC
		`else
			, .VDD(), .GND(), .NW(), .SX()
		`endif
	);
DELAY6_C delay_disconnect_aux4_2 (.Z(disconnect_aux_del_2),.A(disconnect_aux_del4_2)
		`ifdef RC
		`else
			, .VDD(), .GND(), .NW(), .SX()
		`endif
	);
DELAY6_C delay_disconnect_aux4_3 (.Z(disconnect_aux_del_3),.A(disconnect_aux_del4_3)
		`ifdef RC
		`else
			, .VDD(), .GND(), .NW(), .SX()
		`endif
	);


Hamming16_24 Hamming16_24_1 (
		.enc_in(fifo_data_w_1[15:0]),
		.enc_out(enc_out_1),
		.dec_in(dec_in_1),
		.dec_out(fifo_data_r_1[15:0])
	);
Hamming16_24 Hamming16_24_2 (
		.enc_in(fifo_data_w_2[15:0]),
		.enc_out(enc_out_2),
		.dec_in(dec_in_2),
		.dec_out(fifo_data_r_2[15:0])
	);
Hamming16_24 Hamming16_24_3 (
		.enc_in(fifo_data_w_3[15:0]),
		.enc_out(enc_out_3),
		.dec_in(dec_in_3),
		.dec_out(fifo_data_r_3[15:0])
	);


SRAM_tri #(.DATA_WIDTH(25),.ADDR_WIDTH(ADDR_WIDTH)) fifo (
		.data_w_1(SRAM_data_w_1),
		.data_r_1(SRAM_data_r_1),
		.addr_w_1(fifo_addr_w_1),
		.addr_r_1(fifo_addr_r_1),
		.w_enable_1(fifo_w_1),
		.clk_w_1(clk_activeb_1),
		.data_w_2(SRAM_data_w_2),
		.data_r_2(SRAM_data_r_2),
		.addr_w_2(fifo_addr_w_2),
		.addr_r_2(fifo_addr_r_2),
		.w_enable_2(fifo_w_2),
		.clk_w_2(clk_activeb_2),
		.data_w_3(SRAM_data_w_3),
		.data_r_3(SRAM_data_r_3),
		.addr_w_3(fifo_addr_w_3),
		.addr_r_3(fifo_addr_r_3),
		.w_enable_3(fifo_w_3),
		.clk_w_3(clk_activeb_3)
	);


crc_tri #(.DATA_WIDTH(8)) crc16_8_pri (
		.d_1(phy_data_pri_1), 
		.init_1(phy_dvalid_prib_1),
		.reset_b_1(resetb_1),
		.clk_1(clk_pri_1),
		.d_valid_1(phy_dstrobe_pri_1),
		.crc_1(crc_pri_1),
		.d_2(phy_data_pri_2), 
		.init_2(phy_dvalid_prib_2),
		.reset_b_2(resetb_2),
		.clk_2(clk_pri_2),
		.d_valid_2(phy_dstrobe_pri_2),
		.crc_2(crc_pri_2),
		.d_3(phy_data_pri_3), 
		.init_3(phy_dvalid_prib_3),
		.reset_b_3(resetb_3),
		.clk_3(clk_pri_3),
		.d_valid_3(phy_dstrobe_pri_3),
		.crc_3(crc_pri_3)
	);


crc_tri #(.DATA_WIDTH(8)) crc16_8_aux (
		.d_1(phy_data_aux_1), 
		.init_1(phy_dvalid_auxb_1),
		.reset_b_1(resetb_dis_1),
		.clk_1(clk_aux_dis_1),
		.d_valid_1(phy_dstrobe_aux_1),
		.crc_1(crc_aux_1),
		.d_2(phy_data_aux_2), 
		.init_2(phy_dvalid_auxb_2),
		.reset_b_2(resetb_dis_2),
		.clk_2(clk_aux_dis_2),
		.d_valid_2(phy_dstrobe_aux_2),
		.crc_2(crc_aux_2),
		.d_3(phy_data_aux_3), 
		.init_3(phy_dvalid_auxb_3),
		.reset_b_3(resetb_dis_3),
		.clk_3(clk_aux_dis_3),
		.d_valid_3(phy_dstrobe_aux_3),
		.crc_3(crc_aux_3)
	);


PHY_HDLC_rx_tri PHY_HDLC_rx_pri (
		.rx_data_1(phy_data_pri_1),
		.rx_sdr_1(rx_sdr_pri_1),
		.rx_clk_1(clk_pri_1),
		.rx_dvalid_1(phy_dvalid_pri_1),
		.rx_dstrobe_1(phy_dstrobe_pri_1),
		.resetb_1(resetb_1),
		.rx_data_2(phy_data_pri_2),
		.rx_sdr_2(rx_sdr_pri_2),
		.rx_clk_2(clk_pri_2),
		.rx_dvalid_2(phy_dvalid_pri_2),
		.rx_dstrobe_2(phy_dstrobe_pri_2),
		.resetb_2(resetb_2),
		.rx_data_3(phy_data_pri_3),
		.rx_sdr_3(rx_sdr_pri_3),
		.rx_clk_3(clk_pri_3),
		.rx_dvalid_3(phy_dvalid_pri_3),
		.rx_dstrobe_3(phy_dstrobe_pri_3),
		.resetb_3(resetb_3)
	);


PHY_HDLC_rx_tri PHY_HDLC_rx_aux (
		.rx_data_1(phy_data_aux_1),
		.rx_sdr_1(rx_sdr_aux_1),
		.rx_clk_1(clk_aux_dis_1),
		.rx_dvalid_1(phy_dvalid_aux_1),
		.rx_dstrobe_1(phy_dstrobe_aux_1),
		.resetb_1(resetb_dis_1),
		.rx_data_2(phy_data_aux_2),
		.rx_sdr_2(rx_sdr_aux_2),
		.rx_clk_2(clk_aux_dis_2),
		.rx_dvalid_2(phy_dvalid_aux_2),
		.rx_dstrobe_2(phy_dstrobe_aux_2),
		.resetb_2(resetb_dis_2),
		.rx_data_3(phy_data_aux_3),
		.rx_sdr_3(rx_sdr_aux_3),
		.rx_clk_3(clk_aux_dis_3),
		.rx_dvalid_3(phy_dvalid_aux_3),
		.rx_dstrobe_3(phy_dstrobe_aux_3),
		.resetb_3(resetb_dis_3)
	);


pri_aux_control_tri pri_aux_control (
		.resetb_pri_1(resetb_1),
		.resetb_aux_1(resetb_dis_1),
		.disconnect_pri_1(disconnect_pri_1),
		.disconnect_aux_1(disconnect_aux_1),
		.activate_commands_pri_1(activate_commands_pri_1),
		.activate_commands_aux_1(activate_commands_aux_1),
		.active_aux_1(active_aux_int_1),
		.active_pri_1(active_pri_1),
		.clk_pri_1(clk_pri_1),
		.clk_aux_1(clk_aux_dis_1),
		.disable_aux_1(disable_aux_1),
		.resetb_pri_2(resetb_2),
		.resetb_aux_2(resetb_dis_2),
		.disconnect_pri_2(disconnect_pri_2),
		.disconnect_aux_2(disconnect_aux_2),
		.activate_commands_pri_2(activate_commands_pri_2),
		.activate_commands_aux_2(activate_commands_aux_2),
		.active_aux_2(active_aux_int_2),
		.active_pri_2(active_pri_2),
		.clk_pri_2(clk_pri_2),
		.clk_aux_2(clk_aux_dis_2),
		.disable_aux_2(disable_aux_2),
		.resetb_pri_3(resetb_3),
		.resetb_aux_3(resetb_dis_3),
		.disconnect_pri_3(disconnect_pri_3),
		.disconnect_aux_3(disconnect_aux_3),
		.activate_commands_pri_3(activate_commands_pri_3),
		.activate_commands_aux_3(activate_commands_aux_3),
		.active_aux_3(active_aux_int_3),
		.active_pri_3(active_pri_3),
		.clk_pri_3(clk_pri_3),
		.clk_aux_3(clk_aux_dis_3),
		.disable_aux_3(disable_aux_3)
	);


monostable ms_rx_cmd_reset_pri_1 (
		.A(rx_cmd_reset_pri_1),
		.Z(rx_cmd_reset_pri_monos_1)
	);
monostable ms_rx_cmd_reset_pri_2 (
		.A(rx_cmd_reset_pri_2),
		.Z(rx_cmd_reset_pri_monos_2)
	);
monostable ms_rx_cmd_reset_pri_3 (
		.A(rx_cmd_reset_pri_3),
		.Z(rx_cmd_reset_pri_monos_3)
	);


monostable ms_rx_cmd_reset_aux_1 (
		.A(rx_cmd_reset_aux_1),
		.Z(rx_cmd_reset_aux_monos_1)
	);
monostable ms_rx_cmd_reset_aux_2 (
		.A(rx_cmd_reset_aux_2),
		.Z(rx_cmd_reset_aux_monos_2)
	);
monostable ms_rx_cmd_reset_aux_3 (
		.A(rx_cmd_reset_aux_3),
		.Z(rx_cmd_reset_aux_monos_3)
	);


monostable ms_activate_commands_pri_1 (
		.A(activate_commands_pri_1),
		.Z(disconnect_aux_1)
	);
monostable ms_activate_commands_pri_2 (
		.A(activate_commands_pri_2),
		.Z(disconnect_aux_2)
	);
monostable ms_activate_commands_pri_3 (
		.A(activate_commands_pri_3),
		.Z(disconnect_aux_3)
	);


monostable ms_activate_commands_aux_1 (
		.A(activate_commands_aux_1),
		.Z(disconnect_pri_1)
	);
monostable ms_activate_commands_aux_2 (
		.A(activate_commands_aux_2),
		.Z(disconnect_pri_2)
	);
monostable ms_activate_commands_aux_3 (
		.A(activate_commands_aux_3),
		.Z(disconnect_pri_3)
	);


assign crc_zero_aux_1 = crc_aux_1==16'b0;
assign crc_zero_aux_2 = crc_aux_2==16'b0;
assign crc_zero_aux_3 = crc_aux_3==16'b0;

assign	SRAM_data_w_1={fifo_data_w_1[16], enc_out_1};
assign	SRAM_data_w_2={fifo_data_w_2[16], enc_out_2};
assign	SRAM_data_w_3={fifo_data_w_3[16], enc_out_3};

assign	fifo_data_r_1[16]=SRAM_data_r_1[24];
assign	fifo_data_r_2[16]=SRAM_data_r_2[24];
assign	fifo_data_r_3[16]=SRAM_data_r_3[24];

assign  dec_in_1=SRAM_data_r_1[23:0];
assign  dec_in_2=SRAM_data_r_2[23:0];
assign  dec_in_3=SRAM_data_r_3[23:0];

assign clk_activeb_1=~clk_active_1;
assign clk_activeb_2=~clk_active_2;
assign clk_activeb_3=~clk_active_3;

assign phy_dvalid_prib_1=~phy_dvalid_pri_1;
assign phy_dvalid_prib_2=~phy_dvalid_pri_2;
assign phy_dvalid_prib_3=~phy_dvalid_pri_3;

assign phy_dvalid_auxb_1=~phy_dvalid_aux_1;
assign phy_dvalid_auxb_2=~phy_dvalid_aux_2;
assign phy_dvalid_auxb_3=~phy_dvalid_aux_3;

assign activate_commands_pri_1 = rx_cmd_reset_pri_1 || rx_cmd_sabm_pri_1 || tx_cmd_reset_1 || disable_aux_1;
assign activate_commands_pri_2 = rx_cmd_reset_pri_2 || rx_cmd_sabm_pri_2 || tx_cmd_reset_2 || disable_aux_2;
assign activate_commands_pri_3 = rx_cmd_reset_pri_3 || rx_cmd_sabm_pri_3 || tx_cmd_reset_3 || disable_aux_3;

assign activate_commands_aux_1 = (rx_cmd_reset_aux_1 || rx_cmd_sabm_aux_1 || tx_cmd_reset_1) && (~disable_aux_1);
assign activate_commands_aux_2 = (rx_cmd_reset_aux_2 || rx_cmd_sabm_aux_2 || tx_cmd_reset_2) && (~disable_aux_2);
assign activate_commands_aux_3 = (rx_cmd_reset_aux_3 || rx_cmd_sabm_aux_3 || tx_cmd_reset_3) && (~disable_aux_3);

assign active_aux_1 = active_aux_int_1 & (~disable_aux_1);
assign active_aux_2 = active_aux_int_2 & (~disable_aux_2);
assign active_aux_3 = active_aux_int_3 & (~disable_aux_3);

assign clk_aux_dis_1 = clk_aux_1 & (~disable_aux_1);
assign clk_aux_dis_2 = clk_aux_2 & (~disable_aux_2);
assign clk_aux_dis_3 = clk_aux_3 & (~disable_aux_3);

assign resetb_dis_1 = resetb_1 & (~disable_aux_1);
assign resetb_dis_2 = resetb_2 & (~disable_aux_2);
assign resetb_dis_3 = resetb_3 & (~disable_aux_3);

assign fifo_addr_r_1 = active_aux_1 ? fifo_addr_r_aux_1 : fifo_addr_r_pri_1;
assign fifo_addr_r_2 = active_aux_2 ? fifo_addr_r_aux_2 : fifo_addr_r_pri_2;
assign fifo_addr_r_3 = active_aux_3 ? fifo_addr_r_aux_3 : fifo_addr_r_pri_3;

assign fifo_addr_w_1 = active_aux_1 ? fifo_addr_w_aux_1 : fifo_addr_w_pri_1;
assign fifo_addr_w_2 = active_aux_2 ? fifo_addr_w_aux_2 : fifo_addr_w_pri_2;
assign fifo_addr_w_3 = active_aux_3 ? fifo_addr_w_aux_3 : fifo_addr_w_pri_3;

assign fifo_w_1 = active_aux_1 ? fifo_w_aux_1 : fifo_w_pri_1;
assign fifo_w_2 = active_aux_2 ? fifo_w_aux_2 : fifo_w_pri_2;
assign fifo_w_3 = active_aux_3 ? fifo_w_aux_3 : fifo_w_pri_3;

assign rx_dat_1 = active_aux_1 ? rx_dat_aux_1 : rx_dat_pri_1;
assign rx_dat_2 = active_aux_2 ? rx_dat_aux_2 : rx_dat_pri_2;
assign rx_dat_3 = active_aux_3 ? rx_dat_aux_3 : rx_dat_pri_3;

assign rx_ena_1 = active_aux_1 ? rx_ena_aux_1 : rx_ena_pri_1;
assign rx_ena_2 = active_aux_2 ? rx_ena_aux_2 : rx_ena_pri_2;
assign rx_ena_3 = active_aux_3 ? rx_ena_aux_3 : rx_ena_pri_3;

assign rx_eop_1 = active_aux_1 ? rx_eop_aux_1 : rx_eop_pri_1;
assign rx_eop_2 = active_aux_2 ? rx_eop_aux_2 : rx_eop_pri_2;
assign rx_eop_3 = active_aux_3 ? rx_eop_aux_3 : rx_eop_pri_3;

assign rx_sop_1 = active_aux_1 ? rx_sop_aux_1 : rx_sop_pri_1;
assign rx_sop_2 = active_aux_2 ? rx_sop_aux_2 : rx_sop_pri_2;
assign rx_sop_3 = active_aux_3 ? rx_sop_aux_3 : rx_sop_pri_3;

assign rx_err_1 = active_aux_1 ? rx_err_aux_1 : rx_err_pri_1;
assign rx_err_2 = active_aux_2 ? rx_err_aux_2 : rx_err_pri_2;
assign rx_err_3 = active_aux_3 ? rx_err_aux_3 : rx_err_pri_3;

assign rx_adr_1 = active_aux_1 ? rx_adr_aux_1 : rx_adr_pri_1;
assign rx_adr_2 = active_aux_2 ? rx_adr_aux_2 : rx_adr_pri_2;
assign rx_adr_3 = active_aux_3 ? rx_adr_aux_3 : rx_adr_pri_3;

assign rx_cmd_reset_1 = rx_cmd_reset_aux_monos_1 | rx_cmd_reset_pri_monos_1;
assign rx_cmd_reset_2 = rx_cmd_reset_aux_monos_2 | rx_cmd_reset_pri_monos_2;
assign rx_cmd_reset_3 = rx_cmd_reset_aux_monos_3 | rx_cmd_reset_pri_monos_3;

assign rx_cmd_test_1 = active_aux_1 ? rx_cmd_test_aux_1 : rx_cmd_test_pri_1;
assign rx_cmd_test_2 = active_aux_2 ? rx_cmd_test_aux_2 : rx_cmd_test_pri_2;
assign rx_cmd_test_3 = active_aux_3 ? rx_cmd_test_aux_3 : rx_cmd_test_pri_3;

assign rx_cmd_ua_1 = active_aux_1 ? rx_cmd_ua_aux_1 : rx_cmd_ua_pri_1;
assign rx_cmd_ua_2 = active_aux_2 ? rx_cmd_ua_aux_2 : rx_cmd_ua_pri_2;
assign rx_cmd_ua_3 = active_aux_3 ? rx_cmd_ua_aux_3 : rx_cmd_ua_pri_3;

assign tx_cmd_ua_1 = (active_aux_1 ? tx_cmd_ua_aux_1 : tx_cmd_ua_pri_1);
assign tx_cmd_ua_2 = (active_aux_2 ? tx_cmd_ua_aux_2 : tx_cmd_ua_pri_2);
assign tx_cmd_ua_3 = (active_aux_3 ? tx_cmd_ua_aux_3 : tx_cmd_ua_pri_3);

assign rx_cmd_srej_1 = active_aux_1 ? rx_cmd_srej_aux_1 : rx_cmd_srej_pri_1;
assign rx_cmd_srej_2 = active_aux_2 ? rx_cmd_srej_aux_2 : rx_cmd_srej_pri_2;
assign rx_cmd_srej_3 = active_aux_3 ? rx_cmd_srej_aux_3 : rx_cmd_srej_pri_3;

assign tx_cmd_srej_1 = active_aux_1 ? tx_cmd_srej_aux_1 : tx_cmd_srej_pri_1;
assign tx_cmd_srej_2 = active_aux_2 ? tx_cmd_srej_aux_2 : tx_cmd_srej_pri_2;
assign tx_cmd_srej_3 = active_aux_3 ? tx_cmd_srej_aux_3 : tx_cmd_srej_pri_3;

assign rx_vr_1 = active_aux_1 ? rx_vr_aux_1 : rx_vr_pri_1;
assign rx_vr_2 = active_aux_2 ? rx_vr_aux_2 : rx_vr_pri_2;
assign rx_vr_3 = active_aux_3 ? rx_vr_aux_3 : rx_vr_pri_3;

assign rx_nr_1 = active_aux_1 ? rx_nr_aux_1 : rx_nr_pri_1;
assign rx_nr_2 = active_aux_2 ? rx_nr_aux_2 : rx_nr_pri_2;
assign rx_nr_3 = active_aux_3 ? rx_nr_aux_3 : rx_nr_pri_3;

assign rx_ns_1 = active_aux_1 ? rx_ns_aux_1 : rx_ns_pri_1;
assign rx_ns_2 = active_aux_2 ? rx_ns_aux_2 : rx_ns_pri_2;
assign rx_ns_3 = active_aux_3 ? rx_ns_aux_3 : rx_ns_pri_3;

assign crc_zero_pri_1 = crc_pri_1==16'b0;
assign crc_zero_pri_2 = crc_pri_2==16'b0;
assign crc_zero_pri_3 = crc_pri_3==16'b0;

assign disconnect_pri_dis_1 = disconnect_pri_1 & (~disable_aux_1);
assign disconnect_pri_dis_2 = disconnect_pri_2 & (~disable_aux_2);
assign disconnect_pri_dis_3 = disconnect_pri_3 & (~disable_aux_3);
endmodule
`timescale 1ns/1ns
module tx_tri 
#(
	parameter HEADER_FIELD = 1,
	ADDR_WIDTH = 12,
	THRESHOLD = 3072
)
 (
input [15:0]  tx_dat_1,
input [15:0]  tx_dat_2,
input [15:0]  tx_dat_3,
input  clk_1,tx_ena_1,
input  clk_2,tx_ena_2,
input  clk_3,tx_ena_3,
input [7:0]  tx_adr_1,
input [7:0]  tx_adr_2,
input [7:0]  tx_adr_3,
input  resetb_1,
input  resetb_2,
input  resetb_3,
input  tx_cmd_reset_1, tx_cmd_test_1, rx_cmd_reset_1,
input  tx_cmd_reset_2, tx_cmd_test_2, rx_cmd_reset_2,
input  tx_cmd_reset_3, tx_cmd_test_3, rx_cmd_reset_3,
output  tx_dav_1,
output  tx_dav_2,
output  tx_dav_3,
output [1:0]  tx_sdr_1,
output [1:0]  tx_sdr_2,
output [1:0]  tx_sdr_3,
output [2:0]  tx_ns_1,
output [2:0]  tx_ns_2,
output [2:0]  tx_ns_3,
input [2:0]  tx_nr_1,
input [2:0]  tx_nr_2,
input [2:0]  tx_nr_3,
input [6:0]  tx_cmd_srej_1,
input [6:0]  tx_cmd_srej_2,
input [6:0]  tx_cmd_srej_3,
input  tx_cmd_sabm_1,
input  tx_cmd_sabm_2,
input  tx_cmd_sabm_3,
input  tx_cmd_ua_1,
input  tx_cmd_ua_2,
input  tx_cmd_ua_3,
output  cmd_busy_1,
output  cmd_busy_2,
output  cmd_busy_3
);
wire [7:0]  phy_tx_data_1;
wire [7:0]  phy_tx_data_2;
wire [7:0]  phy_tx_data_3;
wire [15:0]  crc_1;
wire [15:0]  crc_2;
wire [15:0]  crc_3;
wire [16:0]  fifo_data_w_1;
wire [16:0]  fifo_data_w_2;
wire [16:0]  fifo_data_w_3;
wire [16:0]  fifo_data_r_1;
wire [16:0]  fifo_data_r_2;
wire [16:0]  fifo_data_r_3;
wire [ADDR_WIDTH-1:0]  fifo_addr_r_1, fifo_addr_w_1;
wire [ADDR_WIDTH-1:0]  fifo_addr_r_2, fifo_addr_w_2;
wire [ADDR_WIDTH-1:0]  fifo_addr_r_3, fifo_addr_w_3;
wire [23:0]  dec_in_1, enc_out_1;
wire [23:0]  dec_in_2, enc_out_2;
wire [23:0]  dec_in_3, enc_out_3;
wire [24:0]  SRAM_data_r_1, SRAM_data_w_1;
wire [24:0]  SRAM_data_r_2, SRAM_data_w_2;
wire [24:0]  SRAM_data_r_3, SRAM_data_w_3;
wire [7:0]  phy_tx_data_delayed_1;
wire [7:0]  phy_tx_data_delayed_2;
wire [7:0]  phy_tx_data_delayed_3;

MAC_tx_tri #(.HEADER_FIELD(HEADER_FIELD), .ADDR_WIDTH(ADDR_WIDTH), .THRESHOLD(THRESHOLD)) MAC_tx (
		.tx_dat_1(tx_dat_1),
		.clk_1(clk_1),
		.tx_ena_1(tx_ena_1),
		.tx_dav_1(tx_dav_1),
		.tx_adr_1(tx_adr_1),
		.tx_cmd_reset_1(tx_cmd_reset_1),
		.tx_cmd_test_1(tx_cmd_test_1),
		.tx_cmd_sabm_1(tx_cmd_sabm_1),
		.tx_cmd_ua_1(tx_cmd_ua_1),
		.tx_cmd_srej_1(tx_cmd_srej_1),
		.rx_cmd_reset_1(rx_cmd_reset_v_1),
		.cmd_busy_1(cmd_busy_1),
		.tx_ns_1(tx_ns_1),
		.tx_nr_1(tx_nr_1),
		.resetb_1(resetb_1),
		.phy_tx_data_1(phy_tx_data_1),
		.phy_bytesel_1(phy_bytesel_1),
		.phy_dvalid_1(phy_dvalid_1),
		.crc_1(crc_1),
		.crc_strobe_1(crc_strobe_1),
		.phy_dstrobe_1(phy_dstrobe_1),
		.fifo_data_w_1(fifo_data_w_1),
		.fifo_data_r_1(fifo_data_r_1),
		.fifo_addr_w_1(fifo_addr_w_1),
		.fifo_addr_r_1(fifo_addr_r_1),
		.fifo_w_1(fifo_w_1),
		.tx_dat_2(tx_dat_2),
		.clk_2(clk_2),
		.tx_ena_2(tx_ena_2),
		.tx_dav_2(tx_dav_2),
		.tx_adr_2(tx_adr_2),
		.tx_cmd_reset_2(tx_cmd_reset_2),
		.tx_cmd_test_2(tx_cmd_test_2),
		.tx_cmd_sabm_2(tx_cmd_sabm_2),
		.tx_cmd_ua_2(tx_cmd_ua_2),
		.tx_cmd_srej_2(tx_cmd_srej_2),
		.rx_cmd_reset_2(rx_cmd_reset_v_2),
		.cmd_busy_2(cmd_busy_2),
		.tx_ns_2(tx_ns_2),
		.tx_nr_2(tx_nr_2),
		.resetb_2(resetb_2),
		.phy_tx_data_2(phy_tx_data_2),
		.phy_bytesel_2(phy_bytesel_2),
		.phy_dvalid_2(phy_dvalid_2),
		.crc_2(crc_2),
		.crc_strobe_2(crc_strobe_2),
		.phy_dstrobe_2(phy_dstrobe_2),
		.fifo_data_w_2(fifo_data_w_2),
		.fifo_data_r_2(fifo_data_r_2),
		.fifo_addr_w_2(fifo_addr_w_2),
		.fifo_addr_r_2(fifo_addr_r_2),
		.fifo_w_2(fifo_w_2),
		.tx_dat_3(tx_dat_3),
		.clk_3(clk_3),
		.tx_ena_3(tx_ena_3),
		.tx_dav_3(tx_dav_3),
		.tx_adr_3(tx_adr_3),
		.tx_cmd_reset_3(tx_cmd_reset_3),
		.tx_cmd_test_3(tx_cmd_test_3),
		.tx_cmd_sabm_3(tx_cmd_sabm_3),
		.tx_cmd_ua_3(tx_cmd_ua_3),
		.tx_cmd_srej_3(tx_cmd_srej_3),
		.rx_cmd_reset_3(rx_cmd_reset_v_3),
		.cmd_busy_3(cmd_busy_3),
		.tx_ns_3(tx_ns_3),
		.tx_nr_3(tx_nr_3),
		.resetb_3(resetb_3),
		.phy_tx_data_3(phy_tx_data_3),
		.phy_bytesel_3(phy_bytesel_3),
		.phy_dvalid_3(phy_dvalid_3),
		.crc_3(crc_3),
		.crc_strobe_3(crc_strobe_3),
		.phy_dstrobe_3(phy_dstrobe_3),
		.fifo_data_w_3(fifo_data_w_3),
		.fifo_data_r_3(fifo_data_r_3),
		.fifo_addr_w_3(fifo_addr_w_3),
		.fifo_addr_r_3(fifo_addr_r_3),
		.fifo_w_3(fifo_w_3)
	);


Hamming16_24 Hamming16_24_1 (
		.enc_in(fifo_data_w_1[15:0]),
		.enc_out(enc_out_1),
		.dec_in(dec_in_1),
		.dec_out(fifo_data_r_1[15:0])
	);
Hamming16_24 Hamming16_24_2 (
		.enc_in(fifo_data_w_2[15:0]),
		.enc_out(enc_out_2),
		.dec_in(dec_in_2),
		.dec_out(fifo_data_r_2[15:0])
	);
Hamming16_24 Hamming16_24_3 (
		.enc_in(fifo_data_w_3[15:0]),
		.enc_out(enc_out_3),
		.dec_in(dec_in_3),
		.dec_out(fifo_data_r_3[15:0])
	);


SRAM_tri #(.DATA_WIDTH(25),.ADDR_WIDTH(ADDR_WIDTH)) fifo (
		.data_w_1(SRAM_data_w_1),
		.data_r_1(SRAM_data_r_1),
		.addr_w_1(fifo_addr_w_1),
		.addr_r_1(fifo_addr_r_1),
		.w_enable_1(fifo_w_1),
		.clk_w_1(clkb_1),
		.data_w_2(SRAM_data_w_2),
		.data_r_2(SRAM_data_r_2),
		.addr_w_2(fifo_addr_w_2),
		.addr_r_2(fifo_addr_r_2),
		.w_enable_2(fifo_w_2),
		.clk_w_2(clkb_2),
		.data_w_3(SRAM_data_w_3),
		.data_r_3(SRAM_data_r_3),
		.addr_w_3(fifo_addr_w_3),
		.addr_r_3(fifo_addr_r_3),
		.w_enable_3(fifo_w_3),
		.clk_w_3(clkb_3)
	);


regbank regbank_1 (.D(phy_tx_data_1), .Q(phy_tx_data_delayed_1), 
		.clk(clk_1), .RN(1'b1)
	);
regbank regbank_2 (.D(phy_tx_data_2), .Q(phy_tx_data_delayed_2), 
		.clk(clk_2), .RN(1'b1)
	);
regbank regbank_3 (.D(phy_tx_data_3), .Q(phy_tx_data_delayed_3), 
		.clk(clk_3), .RN(1'b1)
	);


crc_tri #(.DATA_WIDTH(8)) crc16_8 (
		.d_1(phy_tx_data_delayed_1), 
		.init_1(phy_dvalidb_1),
		.reset_b_1(resetb_1),
		.clk_1(clk_1),
		.d_valid_1(crc_strobe_1),
		.crc_1(crc_1),
		.d_2(phy_tx_data_delayed_2), 
		.init_2(phy_dvalidb_2),
		.reset_b_2(resetb_2),
		.clk_2(clk_2),
		.d_valid_2(crc_strobe_2),
		.crc_2(crc_2),
		.d_3(phy_tx_data_delayed_3), 
		.init_3(phy_dvalidb_3),
		.reset_b_3(resetb_3),
		.clk_3(clk_3),
		.d_valid_3(crc_strobe_3),
		.crc_3(crc_3)
	);


PHY_HDLC_tx_tri PHY_HDLC_tx (
		.tx_data_1(phy_tx_data_1),
		.tx_sdr_1(tx_sdr_1),
		.rx_clk_1(clk_1),
		.tx_dvalid_1(phy_dvalid_1),
		.tx_dstrobe_1(phy_dstrobe_1),
		.resetb_1(phy_resetb_1),
		.tx_data_2(phy_tx_data_2),
		.tx_sdr_2(tx_sdr_2),
		.rx_clk_2(clk_2),
		.tx_dvalid_2(phy_dvalid_2),
		.tx_dstrobe_2(phy_dstrobe_2),
		.resetb_2(phy_resetb_2),
		.tx_data_3(phy_tx_data_3),
		.tx_sdr_3(tx_sdr_3),
		.rx_clk_3(clk_3),
		.tx_dvalid_3(phy_dvalid_3),
		.tx_dstrobe_3(phy_dstrobe_3),
		.resetb_3(phy_resetb_3)
	);


majority_voter_placeholder_tri mv_rx_cmd_reset (
		.in_1(rx_cmd_reset_1),
		.out_1(rx_cmd_reset_v_1),
		.err_1(err_cmd_reset_1),
		.in_2(rx_cmd_reset_2),
		.out_2(rx_cmd_reset_v_2),
		.err_2(err_cmd_reset_2),
		.in_3(rx_cmd_reset_3),
		.out_3(rx_cmd_reset_v_3),
		.err_3(err_cmd_reset_3)
	);


assign	SRAM_data_w_1={fifo_data_w_1[16], enc_out_1};
assign	SRAM_data_w_2={fifo_data_w_2[16], enc_out_2};
assign	SRAM_data_w_3={fifo_data_w_3[16], enc_out_3};

assign	fifo_data_r_1[16]=SRAM_data_r_1[24];
assign	fifo_data_r_2[16]=SRAM_data_r_2[24];
assign	fifo_data_r_3[16]=SRAM_data_r_3[24];

assign dec_in_1 = SRAM_data_r_1[23:0];
assign dec_in_2 = SRAM_data_r_2[23:0];
assign dec_in_3 = SRAM_data_r_3[23:0];

assign clkb_1 = ~clk_1;
assign clkb_2 = ~clk_2;
assign clkb_3 = ~clk_3;

assign phy_dvalidb_1=~phy_dvalid_1;
assign phy_dvalidb_2=~phy_dvalid_2;
assign phy_dvalidb_3=~phy_dvalid_3;

assign phy_resetb_1 = resetb_1 && (~rx_cmd_reset_v_1);
assign phy_resetb_2 = resetb_2 && (~rx_cmd_reset_v_2);
assign phy_resetb_3 = resetb_3 && (~rx_cmd_reset_v_3);
endmodule
// missing: tx_ena_old_o <=#1 tx_ena_old_i;
`timescale 1ns/1ns
module MAC_tx_iostate (tx_dat, tx_ena, tx_dav, tx_adr, clk, tx_nr, tx_ns_i, tx_ns_o, tx_cmd_srej,
				resetb, tx_cmd_reset, tx_cmd_test, phy_bytesel_i, phy_bytesel_o, phy_dvalid_i, phy_dvalid_o,
				phy_tx_data, phy_dstrobe, crc, fifo_data_w, fifo_data_r,
				fifo_addr_w_i, fifo_addr_w_o, fifo_addr_r_i, fifo_addr_r_o, fifo_w, crc_strobe, tx_cmd_sabm,
				tx_cmd_ua, cmd_busy, rx_cmd_reset, tx_ena_old_i, tx_ena_old_o, tx_dat_old_i, tx_dat_old_o, overflow_i, overflow_o, fifo_addr_w_last_i, fifo_addr_w_last_o, state_i, state_o, issue_cmd_i, issue_cmd_o, cmd_in_progress_i, cmd_in_progress_o);

	parameter ADDR_WIDTH = 12;
	parameter THRESHOLD = 3072;
	parameter HEADER_FIELD = 1; 

	input [15:0] tx_dat;
 

	input cmd_in_progress_i;
	input [11:0] issue_cmd_i;
	input [1:0] state_i;
	input phy_dstrobe;
	input [16:0] fifo_data_r;
	input [ADDR_WIDTH-1:0] fifo_addr_r_i;

	input [ADDR_WIDTH-1:0]   fifo_addr_w_last_i;
	input overflow_i;
	input [ADDR_WIDTH-1:0]  fifo_addr_w_i;
	input [15:0] tx_dat_old_i;
	input [1:0] tx_ena_old_i;
	input [2:0] tx_nr;
	input [15:0]  crc;
	input tx_ena;

	input  clk;
	input [7:0] tx_adr;
	input resetb;
	input tx_cmd_reset;

	input  tx_cmd_test;


	input   rx_cmd_reset;
	input [6:0] tx_cmd_srej;
	input tx_cmd_sabm;
	input tx_cmd_ua;
	output cmd_busy;
	output cmd_in_progress_o;
	output [11:0] issue_cmd_o;
	output [1:0] state_o;
	output fifo_w;
	output [16:0] fifo_data_w;
	output [ADDR_WIDTH-1:0] fifo_addr_r_o;
	output [ADDR_WIDTH-1:0]   fifo_addr_w_last_o;
	output overflow_o;
	output [ADDR_WIDTH-1:0]  fifo_addr_w_o;
	output [15:0] tx_dat_old_o;
	output [1:0] tx_ena_old_o;
	output [2:0] tx_ns_o;
	input [2:0] tx_ns_i;	

	output tx_dav;

	output  crc_strobe;
	output [7:0] phy_tx_data;
	output phy_bytesel_o;
	input phy_bytesel_i;

	output  phy_dvalid_o;
	input  phy_dvalid_i;
	reg [2:0] tx_ns_o;	
	wire phy_dstrobe;
	reg [ADDR_WIDTH-1:0] fifo_addr_r_o;

	reg [ADDR_WIDTH-1:0]  fifo_addr_w_o;


	reg [ADDR_WIDTH-1:0]   fifo_addr_w_last_o;
	reg phy_bytesel_o;

	reg  phy_dvalid_o;
	reg [1:0] tx_ena_old_o;
	reg [15:0] tx_dat_old_o;
	reg [16:0] fifo_data_w;
	reg fifo_w;
	wire [15:0] crc;
	reg crc_strobe;
	//wire [15:0] header = {8'h03,tx_adr}; 
	wire [ADDR_WIDTH-1:0] fifo_nItems = fifo_addr_w_i - fifo_addr_r_i;
	
	reg [11:0] issue_cmd_o;
	reg cmd_in_progress_o;
	reg [15:0] phy_tx_data16;
	reg [7:0] phy_tx_data;
	reg overflow_o;
	wire cmd_busy = issue_cmd_i[0];
	wire resetb_rx_cmd_resetb = resetb & (~rx_cmd_reset);

	always @(posedge clk or negedge resetb_rx_cmd_resetb) begin
		if (~resetb_rx_cmd_resetb) begin
			fifo_addr_w_o <=#1 0;
			tx_ena_old_o <=#1 0;
			tx_dat_old_o <=#1 0;
			tx_ns_o <=#1 0;
			overflow_o <=#1 0;
		end
/*		else if (rx_cmd_reset) begin
			fifo_addr_w_o <=#1 0;
			tx_ena_old_o <=#1 0;
			tx_dat_old_o <=#1 0;
			tx_ns_o <=#1 0;
			overflow_o <=#1 0;
		end
*/		else begin
			tx_ns_o <=#1 tx_ns_i;
			tx_dat_old_o <=#1 tx_dat_old_i;
			fifo_addr_w_o <=#1 fifo_addr_w_i;
			overflow_o <=#1 overflow_i;
			fifo_addr_w_last_o <=#1 fifo_addr_w_last_i;
			
			
			tx_ena_old_o <=#1 {tx_ena_old_i[0], tx_ena};

			if (((tx_ena | (tx_ena_old_i[0])) && HEADER_FIELD) ||
				((tx_ena) && (!HEADER_FIELD))) begin

				tx_dat_old_o <=#1 tx_dat;
				if ((fifo_nItems != {ADDR_WIDTH{1'b1}}) && (~overflow_i)) 
					fifo_addr_w_o <=#1 fifo_addr_w_i + 1;
				else begin
					overflow_o <=#1 1;
					fifo_addr_w_o <=#1 fifo_addr_w_last_i;
				end
			end

			if ((~tx_ena) & (tx_ena_old_i[0])) tx_ns_o <=#1 tx_ns_i + 1;
			if (tx_cmd_reset | tx_cmd_sabm) tx_ns_o <=#1 0;

			if (!tx_ena_old_i[0]) fifo_addr_w_last_o <=#1 fifo_addr_w_i;


			if ((~tx_ena)&&(fifo_nItems != {ADDR_WIDTH{1'b1}})) overflow_o <=#1 0;

		end
	end


	assign tx_dav = ~((fifo_nItems >= THRESHOLD) || tx_ena || tx_ena_old_i[0] ||
						(tx_ena_old_i[1] && HEADER_FIELD));

	reg [1:0] state_o;
	parameter [1:0] IDLE = 0,
					START = 1,
					DATA = 2,
					END = 3;
					
	always @(posedge clk or negedge resetb_rx_cmd_resetb) begin
		if (~resetb_rx_cmd_resetb) begin
			fifo_addr_r_o <=#1 0;
			phy_bytesel_o <=#1 0;
			phy_dvalid_o <=#1 0;
			state_o <=#1 0;
			issue_cmd_o <=#1 0;
		end
/*		else if (rx_cmd_reset) begin
			fifo_addr_r_o <=#1 0;
			phy_bytesel_o <=#1 0;
			phy_dvalid_o <=#1 0;
			state_o <=#1 0;
			issue_cmd_o <=#1 0;
		end
*/		else begin
			state_o <=#1 state_i;
			phy_dvalid_o <=#1 phy_dvalid_i;
			phy_bytesel_o <=#1 phy_bytesel_i;
			fifo_addr_r_o <=#1 fifo_addr_r_i;
			issue_cmd_o <=#1 issue_cmd_i;
			cmd_in_progress_o <=#1 cmd_in_progress_i;

			if (!issue_cmd_i) begin
				if (tx_cmd_ua && HEADER_FIELD) issue_cmd_o <=#1 8'h63;
				if (tx_cmd_srej && HEADER_FIELD) issue_cmd_o <=#1 {tx_cmd_srej,5'h0d};
				if (tx_cmd_sabm && HEADER_FIELD) issue_cmd_o <=#1 8'h2f;
				if (tx_cmd_test && HEADER_FIELD) issue_cmd_o <=#1 8'he3;
				if (tx_cmd_reset && HEADER_FIELD) issue_cmd_o <=#1 8'h8f;
			end
		
			if (phy_dstrobe & phy_dvalid_i) begin
				if (phy_bytesel_i) begin
					phy_bytesel_o <=#1 0;
				end
				else begin
					phy_bytesel_o <=#1 1;
				end
			end
		
			case (state_i) // synopsys parallel_case
				IDLE: begin
					phy_dvalid_o <=#1 0;
					if ((~phy_dvalid_i) && ((fifo_nItems!=0) || issue_cmd_i)) begin
						cmd_in_progress_o <=#1 issue_cmd_i[0];
						phy_dvalid_o <=#1 1;
						state_o <=#1 START;
					end
				end
				
				START: begin
					phy_dvalid_o <=#1 1;
					if (phy_dstrobe) begin
						if (phy_bytesel_i) begin
							state_o <=#1 DATA;
							if (~cmd_in_progress_i) begin
								fifo_addr_r_o <=#1 fifo_addr_r_i + 1;
							end
							else begin
								if (!issue_cmd_i[11:8]) state_o <=#1 END;
							end							
						end
					end
				end
			
				DATA: begin
					phy_dvalid_o <=#1 1;
					if (phy_dstrobe) begin
						if (phy_bytesel_i) begin
							if (~cmd_in_progress_i) fifo_addr_r_o <=#1 fifo_addr_r_i + 1;
							else state_o <=#1 END;
						end
					end

					if ((~cmd_in_progress_i) && (fifo_data_r[16] || (fifo_nItems==0))) begin
						state_o <=#1 END;
					end	
				end
				
				END: begin
					if (phy_dstrobe) begin
						if (phy_bytesel_i) begin
							state_o <=#1 IDLE;
							if (cmd_in_progress_i) begin
								cmd_in_progress_o <=#1 0;
								issue_cmd_o <=#1 0;
							end
						end
					end
				end
			
			endcase
		end
	end
	
	// COMBINATORIAL LOGIC
	always @* begin
		case (state_i)
			START: begin
				if (HEADER_FIELD) begin
					phy_tx_data16 = {tx_nr,1'b0,fifo_data_r[11:9],1'b0,fifo_data_r[7:0]};
					if (cmd_in_progress_i) phy_tx_data16 = {issue_cmd_i, 8'hff};
				end
				else phy_tx_data16 = fifo_data_r;
			end
			DATA: begin
				phy_tx_data16 = fifo_data_r;
				if (cmd_in_progress_i) phy_tx_data16 = {issue_cmd_i[10:8],1'b1,issue_cmd_i[7:5],1'b1};
			end
			END: phy_tx_data16 = crc;
			default: phy_tx_data16 = fifo_data_r;
		endcase

		phy_tx_data = phy_bytesel_i ? phy_tx_data16[15:8] : phy_tx_data16[7:0];
		crc_strobe = phy_dstrobe & phy_dvalid_i & (state_i!=END);
	
		fifo_w = 0;
		fifo_data_w = tx_dat_old_i;
		if (HEADER_FIELD) begin
			if (tx_ena & (~tx_ena_old_i[0])) begin
				fifo_data_w =  {1'b1,4'b0,tx_ns_i,1'b0,tx_adr};
				fifo_w = 1;
			end
			if (tx_ena_old_i[0]) begin
				fifo_w = 1;
			end
		end
		else begin
			if (tx_ena) begin
				fifo_data_w = {~tx_ena_old_i[0], tx_dat};
				fifo_w = 1;
			end
		end
	end
	

endmodule

`timescale 1ns/1ns
module MAC_tx_tri (tx_dat_1, tx_dat_2, tx_dat_3, tx_ena_1, tx_ena_2, tx_ena_3, tx_dav_1, tx_dav_2, tx_dav_3, tx_adr_1, tx_adr_2, tx_adr_3, clk_1, clk_2, clk_3, tx_nr_1, tx_nr_2, tx_nr_3, tx_ns_1, tx_ns_2, tx_ns_3, tx_cmd_srej_1, tx_cmd_srej_2, tx_cmd_srej_3,
				resetb_1, resetb_2, resetb_3, tx_cmd_reset_1, tx_cmd_reset_2, tx_cmd_reset_3, tx_cmd_test_1, tx_cmd_test_2, tx_cmd_test_3, phy_bytesel_1, phy_bytesel_2, phy_bytesel_3, phy_dvalid_1, phy_dvalid_2, phy_dvalid_3,
				phy_tx_data_1, phy_tx_data_2, phy_tx_data_3, phy_dstrobe_1, phy_dstrobe_2, phy_dstrobe_3, crc_1, crc_2, crc_3, fifo_data_w_1, fifo_data_w_2, fifo_data_w_3, fifo_data_r_1, fifo_data_r_2, fifo_data_r_3,
				fifo_addr_w_1, fifo_addr_w_2, fifo_addr_w_3, fifo_addr_r_1, fifo_addr_r_2, fifo_addr_r_3, fifo_w_1, fifo_w_2, fifo_w_3, crc_strobe_1, crc_strobe_2, crc_strobe_3, tx_cmd_sabm_1, tx_cmd_sabm_2, tx_cmd_sabm_3,
				tx_cmd_ua_1, tx_cmd_ua_2, tx_cmd_ua_3, cmd_busy_1, cmd_busy_2, cmd_busy_3, rx_cmd_reset_1, rx_cmd_reset_2, rx_cmd_reset_3);

	parameter ADDR_WIDTH = 12;
	parameter THRESHOLD = 3072;
	parameter HEADER_FIELD = 1; 

	input [15:0] tx_dat_1, tx_dat_2, tx_dat_3;

	input [15:0]  crc_1, crc_2, crc_3;
	input tx_ena_1, tx_ena_2, tx_ena_3;

	input  clk_1, clk_2, clk_3;
	input [7:0] tx_adr_1, tx_adr_2, tx_adr_3;
	input resetb_1, resetb_2, resetb_3;
	input tx_cmd_reset_1, tx_cmd_reset_2, tx_cmd_reset_3;

	input  tx_cmd_test_1, tx_cmd_test_2, tx_cmd_test_3;

	input   rx_cmd_reset_1, rx_cmd_reset_2, rx_cmd_reset_3;
	input [6:0] tx_cmd_srej_1, tx_cmd_srej_2, tx_cmd_srej_3;
	input tx_cmd_sabm_1, tx_cmd_sabm_2, tx_cmd_sabm_3;
	input tx_cmd_ua_1, tx_cmd_ua_2, tx_cmd_ua_3;
	output cmd_busy_1, cmd_busy_2, cmd_busy_3;
	output tx_dav_1, tx_dav_2, tx_dav_3;

	output  crc_strobe_1, crc_strobe_2, crc_strobe_3;
	output [7:0] phy_tx_data_1, phy_tx_data_2, phy_tx_data_3;
	output phy_bytesel_1, phy_bytesel_2, phy_bytesel_3;

	output  phy_dvalid_1, phy_dvalid_2, phy_dvalid_3;
	input phy_dstrobe_1, phy_dstrobe_2, phy_dstrobe_3;
	output fifo_w_1, fifo_w_2, fifo_w_3;
	output [16:0] fifo_data_w_1, fifo_data_w_2, fifo_data_w_3;
	input [16:0] fifo_data_r_1, fifo_data_r_2, fifo_data_r_3;
	output [ADDR_WIDTH-1:0] fifo_addr_r_1, fifo_addr_r_2, fifo_addr_r_3;

	output [ADDR_WIDTH-1:0]  fifo_addr_w_1, fifo_addr_w_2, fifo_addr_w_3;
	input [2:0] tx_nr_1, tx_nr_2, tx_nr_3;
	output [2:0] tx_ns_1, tx_ns_2, tx_ns_3;	

	wire [ADDR_WIDTH-1:0] fifo_addr_w_1, fifo_addr_w_2, fifo_addr_w_3;
	wire [1:0] tx_ena_old_1, tx_ena_old_2, tx_ena_old_3;
	wire [15:0] tx_dat_old_1, tx_dat_old_2, tx_dat_old_3;
	wire [2:0] tx_ns_1, tx_ns_2, tx_ns_3;
	wire overflow_1, overflow_2, overflow_3;
	wire [ADDR_WIDTH-1:0] fifo_addr_w_last_1, fifo_addr_w_last_2, fifo_addr_w_last_3;
	wire [ADDR_WIDTH-1:0] fifo_addr_r_1, fifo_addr_r_2, fifo_addr_r_3;
	wire phy_bytesel_1, phy_bytesel_2, phy_bytesel_3;
	wire phy_dvalid_1, phy_dvalid_2, phy_dvalid_3;
	wire [1:0] state_1, state_2, state_3;
	wire [11:0] issue_cmd_1, issue_cmd_2, issue_cmd_3;
	wire cmd_in_progress_1, cmd_in_progress_2, cmd_in_progress_3;
	wire [ADDR_WIDTH-1:0] fifo_addr_w;
	wire [1:0] tx_ena_old;
	wire [15:0] tx_dat_old;
	wire [2:0] tx_ns;
	wire overflow;
	wire [ADDR_WIDTH-1:0] fifo_addr_w_last;
	wire [ADDR_WIDTH-1:0] fifo_addr_r;
	wire phy_bytesel;
	wire phy_dvalid;
	wire [1:0] state;
	wire [11:0] issue_cmd;
	wire cmd_in_progress;
	MAC_tx_iostate #(.ADDR_WIDTH(ADDR_WIDTH), .THRESHOLD(THRESHOLD), .HEADER_FIELD(HEADER_FIELD) ) MAC_tx_iostate_1 (.tx_dat(tx_dat_1), .tx_ena(tx_ena_1), .tx_dav(tx_dav_1), .tx_adr(tx_adr_1), .clk(clk_1), .tx_nr(tx_nr_1), .tx_ns_i(tx_ns_1), .tx_ns_o(tx_ns_2), .tx_cmd_srej(tx_cmd_srej_1),
				.resetb(resetb_1), .tx_cmd_reset(tx_cmd_reset_1), .tx_cmd_test(tx_cmd_test_1), .phy_bytesel_i(phy_bytesel_1), .phy_bytesel_o(phy_bytesel_2), .phy_dvalid_i(phy_dvalid_1), .phy_dvalid_o(phy_dvalid_2),
				.phy_tx_data(phy_tx_data_1), .phy_dstrobe(phy_dstrobe_1), .crc(crc_1), .fifo_data_w(fifo_data_w_1), .fifo_data_r(fifo_data_r_1),
				.fifo_addr_w_i(fifo_addr_w_1), .fifo_addr_w_o(fifo_addr_w_2), .fifo_addr_r_i(fifo_addr_r_1), .fifo_addr_r_o(fifo_addr_r_2), .fifo_w(fifo_w_1), .crc_strobe(crc_strobe_1), .tx_cmd_sabm(tx_cmd_sabm_1),
				.tx_cmd_ua(tx_cmd_ua_1), .cmd_busy(cmd_busy_1), .rx_cmd_reset(rx_cmd_reset_1), .tx_ena_old_i(tx_ena_old_1), .tx_ena_old_o(tx_ena_old_2), .tx_dat_old_i(tx_dat_old_1), .tx_dat_old_o(tx_dat_old_2), .overflow_i(overflow_1), .overflow_o(overflow_2), .fifo_addr_w_last_i(fifo_addr_w_last_1), .fifo_addr_w_last_o(fifo_addr_w_last_2), .state_i(state_1), .state_o(state_2), .issue_cmd_i(issue_cmd_1), .issue_cmd_o(issue_cmd_2), .cmd_in_progress_i(cmd_in_progress_1), .cmd_in_progress_o(cmd_in_progress_2));
	MAC_tx_iostate #(.ADDR_WIDTH(ADDR_WIDTH), .THRESHOLD(THRESHOLD), .HEADER_FIELD(HEADER_FIELD) ) MAC_tx_iostate_2 (.tx_dat(tx_dat_2), .tx_ena(tx_ena_2), .tx_dav(tx_dav_2), .tx_adr(tx_adr_2), .clk(clk_2), .tx_nr(tx_nr_2), .tx_ns_i(tx_ns_2), .tx_ns_o(tx_ns_3), .tx_cmd_srej(tx_cmd_srej_2),
				.resetb(resetb_2), .tx_cmd_reset(tx_cmd_reset_2), .tx_cmd_test(tx_cmd_test_2), .phy_bytesel_i(phy_bytesel_2), .phy_bytesel_o(phy_bytesel_3), .phy_dvalid_i(phy_dvalid_2), .phy_dvalid_o(phy_dvalid_3),
				.phy_tx_data(phy_tx_data_2), .phy_dstrobe(phy_dstrobe_2), .crc(crc_2), .fifo_data_w(fifo_data_w_2), .fifo_data_r(fifo_data_r_2),
				.fifo_addr_w_i(fifo_addr_w_2), .fifo_addr_w_o(fifo_addr_w_3), .fifo_addr_r_i(fifo_addr_r_2), .fifo_addr_r_o(fifo_addr_r_3), .fifo_w(fifo_w_2), .crc_strobe(crc_strobe_2), .tx_cmd_sabm(tx_cmd_sabm_2),
				.tx_cmd_ua(tx_cmd_ua_2), .cmd_busy(cmd_busy_2), .rx_cmd_reset(rx_cmd_reset_2), .tx_ena_old_i(tx_ena_old_2), .tx_ena_old_o(tx_ena_old_3), .tx_dat_old_i(tx_dat_old_2), .tx_dat_old_o(tx_dat_old_3), .overflow_i(overflow_2), .overflow_o(overflow_3), .fifo_addr_w_last_i(fifo_addr_w_last_2), .fifo_addr_w_last_o(fifo_addr_w_last_3), .state_i(state_2), .state_o(state_3), .issue_cmd_i(issue_cmd_2), .issue_cmd_o(issue_cmd_3), .cmd_in_progress_i(cmd_in_progress_2), .cmd_in_progress_o(cmd_in_progress_3));
	MAC_tx_iostate #(.ADDR_WIDTH(ADDR_WIDTH), .THRESHOLD(THRESHOLD), .HEADER_FIELD(HEADER_FIELD) ) MAC_tx_iostate_3 (.tx_dat(tx_dat_3), .tx_ena(tx_ena_3), .tx_dav(tx_dav_3), .tx_adr(tx_adr_3), .clk(clk_3), .tx_nr(tx_nr_3), .tx_ns_i(tx_ns_3), .tx_ns_o(tx_ns), .tx_cmd_srej(tx_cmd_srej_3),
				.resetb(resetb_3), .tx_cmd_reset(tx_cmd_reset_3), .tx_cmd_test(tx_cmd_test_3), .phy_bytesel_i(phy_bytesel_3), .phy_bytesel_o(phy_bytesel), .phy_dvalid_i(phy_dvalid_3), .phy_dvalid_o(phy_dvalid),
				.phy_tx_data(phy_tx_data_3), .phy_dstrobe(phy_dstrobe_3), .crc(crc_3), .fifo_data_w(fifo_data_w_3), .fifo_data_r(fifo_data_r_3),
				.fifo_addr_w_i(fifo_addr_w_3), .fifo_addr_w_o(fifo_addr_w), .fifo_addr_r_i(fifo_addr_r_3), .fifo_addr_r_o(fifo_addr_r), .fifo_w(fifo_w_3), .crc_strobe(crc_strobe_3), .tx_cmd_sabm(tx_cmd_sabm_3),
				.tx_cmd_ua(tx_cmd_ua_3), .cmd_busy(cmd_busy_3), .rx_cmd_reset(rx_cmd_reset_3), .tx_ena_old_i(tx_ena_old_3), .tx_ena_old_o(tx_ena_old), .tx_dat_old_i(tx_dat_old_3), .tx_dat_old_o(tx_dat_old), .overflow_i(overflow_3), .overflow_o(overflow), .fifo_addr_w_last_i(fifo_addr_w_last_3), .fifo_addr_w_last_o(fifo_addr_w_last), .state_i(state_3), .state_o(state), .issue_cmd_i(issue_cmd_3), .issue_cmd_o(issue_cmd), .cmd_in_progress_i(cmd_in_progress_3), .cmd_in_progress_o(cmd_in_progress));

	majority_voter #(.WIDTH(42+ADDR_WIDTH-1+ADDR_WIDTH-1+ADDR_WIDTH-1)) mv (
		.in1({fifo_addr_w_2, tx_ena_old_2, tx_dat_old_2, tx_ns_2, overflow_2, fifo_addr_w_last_2, fifo_addr_r_2, phy_bytesel_2, phy_dvalid_2, state_2, issue_cmd_2, cmd_in_progress_2}),
		.in2({fifo_addr_w_3, tx_ena_old_3, tx_dat_old_3, tx_ns_3, overflow_3, fifo_addr_w_last_3, fifo_addr_r_3, phy_bytesel_3, phy_dvalid_3, state_3, issue_cmd_3, cmd_in_progress_3}),
		.in3({fifo_addr_w, tx_ena_old, tx_dat_old, tx_ns, overflow, fifo_addr_w_last, fifo_addr_r, phy_bytesel, phy_dvalid, state, issue_cmd, cmd_in_progress}),
		.out({fifo_addr_w_1, tx_ena_old_1, tx_dat_old_1, tx_ns_1, overflow_1, fifo_addr_w_last_1, fifo_addr_r_1, phy_bytesel_1, phy_dvalid_1, state_1, issue_cmd_1, cmd_in_progress_1}),
		.err()
	);
endmodule

// missing: rx_ns_o <=#1 rx_ns_i;
// missing: rx_dat_o <=#1 rx_dat_i;
// missing: rx_eop_o <=#1 rx_eop_i;
// missing: rx_ena_o <=#1 rx_ena_i;
// missing: rx_sop_o <=#1 rx_sop_i;
// missing: rx_nr_o <=#1 rx_nr_i;
// missing: header_o <=#1 header_i;
// missing: rx_cmd_ua_o <=#1 rx_cmd_ua_i;
// missing: rx_cmd_srej_o <=#1 rx_cmd_srej_i;
// missing: tx_cmd_ua_o <=#1 tx_cmd_ua_i;
// missing: tx_cmd_srej_o <=#1 tx_cmd_srej_i;
// missing: rx_cmd_sabm_o <=#1 rx_cmd_sabm_i;
// missing: rx_cmd_test_o <=#1 rx_cmd_test_i;
// missing: rx_cmd_reset_o <=#1 rx_cmd_reset_i;
// missing: phy_dvalid_old_o <=#1 phy_dvalid_old_i;

`timescale 1ns/1ns
module MAC_rx_iostate (rx_dat_i, rx_dat_o,  rx_ena_i, rx_ena_o, rx_ena_pre_i, rx_ena_pre_o,  rx_eop_i, rx_eop_o, rx_err, rx_vr_i, rx_vr_o, rx_nr_i, rx_nr_o,
			rx_sop_i, rx_sop_o, rx_adr_i, rx_adr_o, clk, rx_dav, resetb, rx_cmd_reset_i, rx_cmd_reset_o, rx_cmd_test_i, rx_cmd_test_o,
			phy_data, phy_dvalid, phy_dstrobe,  crc_zero,fifo_data_w,
			fifo_data_r, fifo_addr_w, fifo_addr_r_i, fifo_addr_r_o, fifo_w, cmd_busy, active,
			rx_cmd_ua_i, rx_cmd_ua_o, rx_cmd_srej_i, rx_cmd_srej_o, tx_cmd_srej_i, tx_cmd_srej_o, rx_ns_i, rx_ns_o, rx_cmd_sabm_i, rx_cmd_sabm_o,
			disconnect, tx_cmd_ua_i, tx_cmd_ua_o, tx_cmd_reset , fifo_addr_w_int_i, fifo_addr_w_int_o, phy_bytesel_i, phy_bytesel_o, phy_dvalid_old_i, phy_dvalid_old_o, fifo_addr_w_last_i, fifo_addr_w_last_o, phy_data_old_i, phy_data_old_o, phy_data_lowbyte_i, phy_data_lowbyte_o, phy_data_old2_i, phy_data_old2_o, overflow_i, overflow_o, packet_length_i, packet_length_o, header_i, header_o);

	parameter ADDR_WIDTH = 12;
	parameter HEADER_FIELD = 1; 
	parameter MAX_LENGTH = 1<<ADDR_WIDTH;

	output [15:0] rx_dat_o;
	output    rx_ena_pre_o;
	output      rx_err;
	input [15:0] rx_dat_i;
	input [15:0] phy_data_old_i;

	input [ADDR_WIDTH-1:0]  fifo_addr_w_last_i;
	output [7:0] rx_adr_o;
	output rx_cmd_reset_o;
	output  rx_cmd_test_o;
	output  rx_cmd_ua_o;
	output  tx_cmd_ua_o;
	output   rx_cmd_sabm_o;
	output [6:0] rx_cmd_srej_o;
	output [7:0] header_o;
	output [15:0] packet_length_o;
	output [6:0] tx_cmd_srej_o;
	output fifo_w;
	output overflow_o;
	output [16:0] fifo_data_w;
	output [ADDR_WIDTH-1:0] fifo_addr_r_o;
	input [ADDR_WIDTH-1:0] fifo_addr_r_i;

	input phy_dvalid_old_i;

	input  phy_bytesel_i;
	input [ADDR_WIDTH-1:0] fifo_addr_w_int_i;


	input [2:0] rx_vr_i;

	input disconnect;

	
	input  tx_cmd_reset;


	
	output [ADDR_WIDTH-1:0]  fifo_addr_w;
	output [2:0] rx_vr_o;
	output [2:0] rx_nr_o;
	input [2:0] rx_nr_i;


	input   active;
	output [2:0]  rx_ns_o;
	input [2:0]  rx_ns_i;
	
	output [15:0] phy_data_old2_o;
	output [7:0] phy_data_lowbyte_o;
	output [15:0] phy_data_old_o;
	output [ADDR_WIDTH-1:0]  fifo_addr_w_last_o;
	output phy_dvalid_old_o;
	output  phy_bytesel_o;
	output [ADDR_WIDTH-1:0] fifo_addr_w_int_o;
	output rx_ena_o;
	input rx_ena_i;

	output  rx_eop_o;
	input  rx_eop_i;


	output   rx_sop_o;
	input   rx_sop_i;



	input    rx_ena_pre_i;




	input [7:0] rx_adr_i;
	input rx_cmd_reset_i;

	input [7:0] header_i;

	input [15:0] packet_length_i;
	input clk;

	input  rx_dav;
	input overflow_i;
	input resetb;
	input [7:0] phy_data;
	input phy_dvalid;
	input crc_zero;

	input  cmd_busy;
	input [16:0] fifo_data_r;

	input  rx_cmd_test_i;


	input  rx_cmd_ua_i;



	input  tx_cmd_ua_i;




	input   rx_cmd_sabm_i;
	input [6:0] rx_cmd_srej_i;
	input [6:0] tx_cmd_srej_i;
	input phy_dstrobe;
	input [15:0] phy_data_old2_i;
	input [7:0] phy_data_lowbyte_i;
	reg [ADDR_WIDTH-1:0] fifo_addr_r_o;


	reg [ADDR_WIDTH-1:0]  fifo_addr_w;
	reg [16:0] fifo_data_w;
	reg fifo_w;

	reg [ADDR_WIDTH-1:0] fifo_addr_w_int_o;
	reg [ADDR_WIDTH-1:0]  fifo_addr_w_last_o;
	reg phy_dvalid_old_o;
	reg  phy_bytesel_o;
	wire phy_dstrobe, phy_dvalid;
	wire [7:0] phy_data;
	reg rx_sop_o;
	reg [7:0] rx_adr_o;
	reg overflow_o;
	reg [15:0] rx_dat_o;
	reg rx_eop_o;
	wire rx_err = 1'b0;
	reg [7:0] phy_data_lowbyte_o;
	reg [15:0] phy_data_old_o;
	reg [15:0] phy_data_old2_o;
	reg [15:0] packet_length_o;
	reg rx_ena_o;

	reg  rx_ena_pre_o;


	reg   rx_cmd_reset_o;



	reg    rx_cmd_test_o;




	reg     rx_cmd_sabm_o;





	reg     rx_cmd_ua_o;






	reg     tx_cmd_ua_o;
	reg [6:0] rx_cmd_srej_o;
	reg [6:0] tx_cmd_srej_o;
	reg [2:0] rx_vr_o;

	reg [2:0]  rx_nr_o;


	reg [2:0]   rx_ns_o;
	reg [7:0] header_o;
	wire [ADDR_WIDTH-1:0] fifo_nItems = fifo_addr_w_int_i - fifo_addr_r_i;
	wire [ADDR_WIDTH-1:0] fifo_nItems_complete = fifo_addr_w_last_i - fifo_addr_r_i;
	wire fifo_full = (fifo_nItems==(MAX_LENGTH-1));
	wire [2:0] rx_ns_minus_one = header_i[3:1]-1;
	
	wire disconnectb_resetb = resetb & (~disconnect);


	always @(posedge clk or negedge disconnectb_resetb) begin
		if (~disconnectb_resetb) begin
			fifo_addr_w_int_o <=#1 0;
			//phy_bytesel_o <=#1 0;
			phy_dvalid_old_o <=#1 0;
			fifo_addr_w_last_o <=#1 0;
			//phy_data_old_o <=#1 0;
			//phy_data_lowbyte_o <=#1 0;
			//phy_data_old2_o <=#1 0;
			rx_cmd_reset_o <=#1 0;
			rx_cmd_test_o <=#1 0;
			rx_vr_o <=#1 0;
			rx_cmd_sabm_o <=#1 0;
			tx_cmd_srej_o <=#1 0;
			tx_cmd_ua_o <=#1 0;
		end
		else if (rx_cmd_reset_i) begin
			fifo_addr_w_int_o <=#1 0;
			phy_bytesel_o <=#1 0;
			phy_dvalid_old_o <=#1 0;
			fifo_addr_w_last_o <=#1 0;
			phy_data_old_o <=#1 0;
			phy_data_lowbyte_o <=#1 0;
			phy_data_old2_o <=#1 0;
			overflow_o <=#1 0;
			rx_cmd_reset_o <=#1 0;
			rx_cmd_test_o <=#1 0;
			rx_vr_o <=#1 0;
			rx_cmd_sabm_o <=#1 0;
			tx_cmd_ua_o <=#1 1;
		end
		else begin
			rx_cmd_reset_o <=#1 0;
			rx_cmd_test_o <=#1 0;
			tx_cmd_srej_o <=#1 0;
			rx_cmd_srej_o <=#1 0;
			rx_cmd_sabm_o <=#1 0;
			rx_cmd_ua_o <=#1 0;
			tx_cmd_ua_o <=#1 rx_cmd_sabm_i;
			phy_data_old_o <=#1 phy_data_old_i;
			fifo_addr_w_last_o <=#1 fifo_addr_w_last_i;
			phy_bytesel_o <=#1 phy_bytesel_i;
			fifo_addr_w_int_o <=#1 fifo_addr_w_int_i;
			phy_data_lowbyte_o <=#1 phy_data_lowbyte_i;
			phy_data_old2_o <=#1 phy_data_old2_i;
			packet_length_o <=#1 packet_length_i;
			phy_dvalid_old_o <=#1 phy_dvalid;
			overflow_o <=#1 overflow_i;
			rx_vr_o <=#1 rx_vr_i;
			
			if (tx_cmd_reset) rx_vr_o <=#1 0;
			if (rx_cmd_sabm_i) rx_vr_o <=#1 0;
			
			if (phy_dvalid) begin
				if (phy_dstrobe) begin
					if (phy_bytesel_i) begin
						if (fifo_full || overflow_i) begin 
							overflow_o <=#1 1;
						end 
						else begin
							fifo_addr_w_int_o <=#1 fifo_addr_w_int_i + 1;
						end
						phy_data_old_o <=#1 {phy_data,phy_data_lowbyte_i};
						phy_data_old2_o <=#1 phy_data_old_i;
						phy_bytesel_o <=#1 0;
						packet_length_o <=#1 packet_length_i + 1;
						if ((packet_length_i==0) && HEADER_FIELD) begin // HEADER
							header_o <=#1 phy_data;
						end
					end
					else begin
						phy_data_lowbyte_o <=#1 phy_data;
						phy_bytesel_o <=#1 1;
					end
				end
			end
			else begin
				packet_length_o <=#1 0;
				if (fifo_full); else overflow_o <=#1 0;
				phy_bytesel_o <=#1 0;
			end
			
			
			if ((~phy_dvalid) && phy_dvalid_old_i) begin
				if (crc_zero) begin
					if (((packet_length_i)==2) && HEADER_FIELD) begin
						// COMMAND FRAME
						fifo_addr_w_int_o <=#1 fifo_addr_w_last_i;
						if (phy_data_old2_i[15:8] == 8'h8f) rx_cmd_reset_o <=#1 1;
						if (phy_data_old2_i[15:8] == 8'h2f) rx_cmd_sabm_o <=#1 1;
						if (phy_data_old2_i[15:8] == 8'h63) rx_cmd_ua_o <=#1 1;
						if (phy_data_old2_i[15:8] == 8'he3) rx_cmd_test_o <=#1 1;
						//if (phy_data_old2_i[15:11] == 5'h0d) rx_cmd_srej_o[2:0] <=#1 phy_data_old2_i[10:8];
					end
					else begin
						if ((!HEADER_FIELD) || (HEADER_FIELD && (!header_i[0]))) begin
							// INFORMATION FRAME END
							fifo_addr_w_last_o <=#1 fifo_addr_w_int_i-1;
							fifo_addr_w_int_o <=#1 fifo_addr_w_int_i-1;
							// Receive state variable:
							rx_vr_o <=#1 header_i[3:1]+1;
							if (header_i[3:1]!=rx_vr_i) begin
								tx_cmd_srej_o <=#1 {1'b1,rx_ns_minus_one, rx_vr_i};
							end

							rx_nr_o <=#1 header_i[7:5];
						end
						else begin // SREJ FRAME END
							fifo_addr_w_int_o <=#1 fifo_addr_w_last_i;
							rx_cmd_srej_o <=#1 {1'b1,phy_data_old2_i[7:5],phy_data_old2_i[3:1]};
						end
					end
				end
				else begin // CRC FAILED
					fifo_addr_w_int_o <=#1 fifo_addr_w_last_i;
				end
			end
		end
	end
	
	// COMBINATORIAL LOGIC
	always @* begin
		fifo_w = 0;
		fifo_addr_w = fifo_addr_w_int_i;
		fifo_data_w = {1'b0,phy_data,phy_data_lowbyte_i};
		
		if (phy_dstrobe && phy_dvalid && (~fifo_full)) begin
			if (phy_bytesel_i) begin
				fifo_w=1;
			end
		end

		if ((~phy_dvalid) && phy_dvalid_old_i) begin
			if (~(((fifo_addr_w_int_i-fifo_addr_w_last_i)==2) && HEADER_FIELD)) begin
				fifo_addr_w = fifo_addr_w_int_i-2;
				fifo_data_w = {1'b1,phy_data_old2_i};
				fifo_w=1;
			end
		end
	end
	
	
	// FIFO READ INTERFACE 
	always @(posedge clk or negedge disconnectb_resetb) begin
		if (~disconnectb_resetb) begin
			fifo_addr_r_o <=#1 0;
			//rx_sop_o <=#1 0;
			//rx_ena_o <=#1 0;
			//rx_adr_o <=#1 0;
			rx_ena_pre_o <=#1 0;
		end
		else if (rx_cmd_reset_i) begin
			fifo_addr_r_o <=#1 0;
			rx_sop_o <=#1 0;
			rx_ena_o <=#1 0;
			rx_adr_o <=#1 0;
			rx_ena_pre_o <=#1 0;
		end
		else begin
			rx_adr_o <=#1 rx_adr_i;
			rx_ena_o <=#1 rx_ena_pre_i;
			fifo_addr_r_o <=#1 fifo_addr_r_i;
			rx_ena_pre_o <=#1 rx_ena_pre_i;

			rx_sop_o <=#1 0;
			rx_eop_o <=#1 fifo_data_r[16] & rx_ena_pre_i;

			if ((~rx_ena_pre_i) && (fifo_nItems_complete!=0) && rx_dav) begin
				rx_ena_pre_o <=#1 1;
				rx_dat_o <=#1 fifo_data_r[15:0];				
				fifo_addr_r_o <=#1 fifo_addr_r_i + 1;
				if (HEADER_FIELD) begin
					rx_adr_o <=#1 fifo_data_r[7:0];
					rx_ns_o <=#1 fifo_data_r[11:9];
				end
				else begin
					rx_sop_o <=#1 1;
					rx_ena_o <=#1 1;
					rx_eop_o <=#1 fifo_data_r[16];
				end
			end

			if (rx_eop_i & rx_ena_i) begin
				rx_ena_o <=#1 0;
				rx_ena_pre_o <=#1 0;
			end
			
			if (rx_ena_pre_i) begin
				if (~rx_ena_i) rx_sop_o <=#1 1;
				rx_dat_o <=#1 fifo_data_r[15:0];
				if (~rx_eop_i) fifo_addr_r_o <=#1 fifo_addr_r_i + 1;
			end
			
			if (fifo_nItems_complete==0) begin
				fifo_addr_r_o <=#1 fifo_addr_r_i;
				rx_ena_pre_o <=#1 0;
				rx_ena_o <=#1 0;
			end
		end
	end



endmodule

// Triplicate with:
// python tri.py < MAC_rx.v > MAC_rx_tri.v


`timescale 1ns/1ns
module MAC_rx_tri (rx_cmd_reset,rx_dat_1, rx_dat_2, rx_dat_3,  rx_ena_1, rx_ena_2, rx_ena_3, rx_ena_pre_1, rx_ena_pre_2, rx_ena_pre_3,  rx_eop_1, rx_eop_2, rx_eop_3, rx_err_1, rx_err_2, rx_err_3, rx_vr_1, rx_vr_2, rx_vr_3, rx_nr_1, rx_nr_2, rx_nr_3,
			rx_sop_1, rx_sop_2, rx_sop_3, rx_adr_1, rx_adr_2, rx_adr_3, clk_1, clk_2, clk_3, rx_dav_1, rx_dav_2, rx_dav_3, resetb_1, resetb_2, resetb_3, rx_cmd_reset_1, rx_cmd_reset_2, rx_cmd_reset_3, rx_cmd_test_1, rx_cmd_test_2, rx_cmd_test_3,
			phy_data_1, phy_data_2, phy_data_3, phy_dvalid_1, phy_dvalid_2, phy_dvalid_3, phy_dstrobe_1, phy_dstrobe_2, phy_dstrobe_3,  crc_zero_1, crc_zero_2, crc_zero_3,fifo_data_w_1, fifo_data_w_2, fifo_data_w_3,
			fifo_data_r_1, fifo_data_r_2, fifo_data_r_3, fifo_addr_w_1, fifo_addr_w_2, fifo_addr_w_3, fifo_addr_r_1, fifo_addr_r_2, fifo_addr_r_3, fifo_w_1, fifo_w_2, fifo_w_3, cmd_busy_1, cmd_busy_2, cmd_busy_3, active_1, active_2, active_3,
			rx_cmd_ua_1, rx_cmd_ua_2, rx_cmd_ua_3, rx_cmd_srej_1, rx_cmd_srej_2, rx_cmd_srej_3, tx_cmd_srej_1, tx_cmd_srej_2, tx_cmd_srej_3, rx_ns_1, rx_ns_2, rx_ns_3, rx_cmd_sabm_1, rx_cmd_sabm_2, rx_cmd_sabm_3,
			disconnect_1, disconnect_2, disconnect_3, tx_cmd_ua_1, tx_cmd_ua_2, tx_cmd_ua_3, tx_cmd_reset_1, tx_cmd_reset_2, tx_cmd_reset_3 );

	parameter ADDR_WIDTH = 12;
	parameter HEADER_FIELD = 1; 
	parameter MAX_LENGTH = 1<<ADDR_WIDTH;

	output [15:0] rx_dat_1, rx_dat_2, rx_dat_3;
	output rx_ena_1, rx_ena_2, rx_ena_3;

	output  rx_eop_1, rx_eop_2, rx_eop_3;

	output   rx_sop_1, rx_sop_2, rx_sop_3;

	output    rx_ena_pre_1, rx_ena_pre_2, rx_ena_pre_3;

	output      rx_err_1, rx_err_2, rx_err_3;
	output [7:0] rx_adr_1, rx_adr_2, rx_adr_3;
	output rx_cmd_reset_1, rx_cmd_reset_2, rx_cmd_reset_3,rx_cmd_reset;

	output  rx_cmd_test_1, rx_cmd_test_2, rx_cmd_test_3;

	output  rx_cmd_ua_1, rx_cmd_ua_2, rx_cmd_ua_3;

	output  tx_cmd_ua_1, tx_cmd_ua_2, tx_cmd_ua_3;

	output   rx_cmd_sabm_1, rx_cmd_sabm_2, rx_cmd_sabm_3;
	output [6:0] rx_cmd_srej_1, rx_cmd_srej_2, rx_cmd_srej_3;
	output [6:0] tx_cmd_srej_1, tx_cmd_srej_2, tx_cmd_srej_3;
	input phy_dstrobe_1, phy_dstrobe_2, phy_dstrobe_3;
	output fifo_w_1, fifo_w_2, fifo_w_3;
	output [16:0] fifo_data_w_1, fifo_data_w_2, fifo_data_w_3;
	output [ADDR_WIDTH-1:0] fifo_addr_r_1, fifo_addr_r_2, fifo_addr_r_3;

	output [ADDR_WIDTH-1:0]  fifo_addr_w_1, fifo_addr_w_2, fifo_addr_w_3;
	output [2:0] rx_vr_1, rx_vr_2, rx_vr_3;

	output [2:0] rx_nr_1, rx_nr_2, rx_nr_3;

	output [2:0]  rx_ns_1, rx_ns_2, rx_ns_3;

	input disconnect_1, disconnect_2, disconnect_3;

	input  tx_cmd_reset_1, tx_cmd_reset_2, tx_cmd_reset_3;

	input   active_1, active_2, active_3;
	input clk_1, clk_2, clk_3;

	input  rx_dav_1, rx_dav_2, rx_dav_3;
	input resetb_1, resetb_2, resetb_3;
	input [7:0] phy_data_1, phy_data_2, phy_data_3;
	input phy_dvalid_1, phy_dvalid_2, phy_dvalid_3;
	input crc_zero_1, crc_zero_2, crc_zero_3;

	input  cmd_busy_1, cmd_busy_2, cmd_busy_3;
	input [16:0] fifo_data_r_1, fifo_data_r_2, fifo_data_r_3;

	wire [ADDR_WIDTH-1:0] fifo_addr_w_int_1, fifo_addr_w_int_2, fifo_addr_w_int_3;
	wire phy_bytesel_1, phy_bytesel_2, phy_bytesel_3;
	wire phy_dvalid_old_1, phy_dvalid_old_2, phy_dvalid_old_3;
	wire [ADDR_WIDTH-1:0] fifo_addr_w_last_1, fifo_addr_w_last_2, fifo_addr_w_last_3;
	wire [15:0] phy_data_old_1, phy_data_old_2, phy_data_old_3;
	wire [7:0] phy_data_lowbyte_1, phy_data_lowbyte_2, phy_data_lowbyte_3;
	wire [15:0] phy_data_old2_1, phy_data_old2_2, phy_data_old2_3;
	wire rx_cmd_reset_1, rx_cmd_reset_2, rx_cmd_reset_3;
	wire rx_cmd_test_1, rx_cmd_test_2, rx_cmd_test_3;
	wire [2:0] rx_vr_1, rx_vr_2, rx_vr_3;
	wire rx_cmd_sabm_1, rx_cmd_sabm_2, rx_cmd_sabm_3;
	wire [6:0] tx_cmd_srej_1, tx_cmd_srej_2, tx_cmd_srej_3;
	wire tx_cmd_ua_1, tx_cmd_ua_2, tx_cmd_ua_3;
	wire overflow_1, overflow_2, overflow_3;
	wire [6:0] rx_cmd_srej_1, rx_cmd_srej_2, rx_cmd_srej_3;
	wire rx_cmd_ua_1, rx_cmd_ua_2, rx_cmd_ua_3;
	wire [15:0] packet_length_1, packet_length_2, packet_length_3;
	wire [7:0] header_1, header_2, header_3;
	wire [2:0] rx_nr_1, rx_nr_2, rx_nr_3;
	wire [ADDR_WIDTH-1:0] fifo_addr_r_1, fifo_addr_r_2, fifo_addr_r_3;
	wire rx_sop_1, rx_sop_2, rx_sop_3;
	wire rx_ena_1, rx_ena_2, rx_ena_3;
	wire [7:0] rx_adr_1, rx_adr_2, rx_adr_3;
	wire rx_ena_pre_1, rx_ena_pre_2, rx_ena_pre_3;
	wire rx_eop_1, rx_eop_2, rx_eop_3;
	wire [15:0] rx_dat_1, rx_dat_2, rx_dat_3;
	wire [2:0] rx_ns_1, rx_ns_2, rx_ns_3;
	wire [ADDR_WIDTH-1:0] fifo_addr_w_int;
	wire phy_bytesel;
	wire phy_dvalid_old;
	wire [ADDR_WIDTH-1:0] fifo_addr_w_last;
	wire [15:0] phy_data_old;
	wire [7:0] phy_data_lowbyte;
	wire [15:0] phy_data_old2;
	wire rx_cmd_reset;
	wire rx_cmd_test;
	wire [2:0] rx_vr;
	wire rx_cmd_sabm;
	wire [6:0] tx_cmd_srej;
	wire tx_cmd_ua;
	wire overflow;
	wire [6:0] rx_cmd_srej;
	wire rx_cmd_ua;
	wire [15:0] packet_length;
	wire [7:0] header;
	wire [2:0] rx_nr;
	wire [ADDR_WIDTH-1:0] fifo_addr_r;
	wire rx_sop;
	wire rx_ena;
	wire [7:0] rx_adr;
	wire rx_ena_pre;
	wire rx_eop;
	wire [15:0] rx_dat;
	wire [2:0] rx_ns;

	MAC_rx_iostate #(.ADDR_WIDTH(ADDR_WIDTH), .HEADER_FIELD(HEADER_FIELD), .MAX_LENGTH(MAX_LENGTH) ) MAC_rx_iostate_1 (.rx_dat_i(rx_dat_1), .rx_dat_o(rx_dat_2),  .rx_ena_i(rx_ena_1), .rx_ena_o(rx_ena_2), .rx_ena_pre_i(rx_ena_pre_1), .rx_ena_pre_o(rx_ena_pre_2),  .rx_eop_i(rx_eop_1), .rx_eop_o(rx_eop_2), .rx_err(rx_err_1), .rx_vr_i(rx_vr_1), .rx_vr_o(rx_vr_2), .rx_nr_i(rx_nr_1), .rx_nr_o(rx_nr_2),
			.rx_sop_i(rx_sop_1), .rx_sop_o(rx_sop_2), .rx_adr_i(rx_adr_1), .rx_adr_o(rx_adr_2), .clk(clk_1), .rx_dav(rx_dav_1), .resetb(resetb_1), .rx_cmd_reset_i(rx_cmd_reset_1), .rx_cmd_reset_o(rx_cmd_reset_2), .rx_cmd_test_i(rx_cmd_test_1), .rx_cmd_test_o(rx_cmd_test_2),
			.phy_data(phy_data_1), .phy_dvalid(phy_dvalid_1), .phy_dstrobe(phy_dstrobe_1),  .crc_zero(crc_zero_1),.fifo_data_w(fifo_data_w_1),
			.fifo_data_r(fifo_data_r_1), .fifo_addr_w(fifo_addr_w_1), .fifo_addr_r_i(fifo_addr_r_1), .fifo_addr_r_o(fifo_addr_r_2), .fifo_w(fifo_w_1), .cmd_busy(cmd_busy_1), .active(active_1),
			.rx_cmd_ua_i(rx_cmd_ua_1), .rx_cmd_ua_o(rx_cmd_ua_2), .rx_cmd_srej_i(rx_cmd_srej_1), .rx_cmd_srej_o(rx_cmd_srej_2), .tx_cmd_srej_i(tx_cmd_srej_1), .tx_cmd_srej_o(tx_cmd_srej_2), .rx_ns_i(rx_ns_1), .rx_ns_o(rx_ns_2), .rx_cmd_sabm_i(rx_cmd_sabm_1), .rx_cmd_sabm_o(rx_cmd_sabm_2),
			.disconnect(disconnect_1), .tx_cmd_ua_i(tx_cmd_ua_1), .tx_cmd_ua_o(tx_cmd_ua_2), .tx_cmd_reset(tx_cmd_reset_1), .fifo_addr_w_int_i(fifo_addr_w_int_1), .fifo_addr_w_int_o(fifo_addr_w_int_2), .phy_bytesel_i(phy_bytesel_1), .phy_bytesel_o(phy_bytesel_2), .phy_dvalid_old_i(phy_dvalid_old_1), .phy_dvalid_old_o(phy_dvalid_old_2), .fifo_addr_w_last_i(fifo_addr_w_last_1), .fifo_addr_w_last_o(fifo_addr_w_last_2), .phy_data_old_i(phy_data_old_1), .phy_data_old_o(phy_data_old_2), .phy_data_lowbyte_i(phy_data_lowbyte_1), .phy_data_lowbyte_o(phy_data_lowbyte_2), .phy_data_old2_i(phy_data_old2_1), .phy_data_old2_o(phy_data_old2_2), .overflow_i(overflow_1), .overflow_o(overflow_2), .packet_length_i(packet_length_1), .packet_length_o(packet_length_2), .header_i(header_1), .header_o(header_2));

	MAC_rx_iostate #(.ADDR_WIDTH(ADDR_WIDTH), .HEADER_FIELD(HEADER_FIELD), .MAX_LENGTH(MAX_LENGTH) ) MAC_rx_iostate_2 (.rx_dat_i(rx_dat_2), .rx_dat_o(rx_dat_3),  .rx_ena_i(rx_ena_2), .rx_ena_o(rx_ena_3), .rx_ena_pre_i(rx_ena_pre_2), .rx_ena_pre_o(rx_ena_pre_3),  .rx_eop_i(rx_eop_2), .rx_eop_o(rx_eop_3), .rx_err(rx_err_2), .rx_vr_i(rx_vr_2), .rx_vr_o(rx_vr_3), .rx_nr_i(rx_nr_2), .rx_nr_o(rx_nr_3),
			.rx_sop_i(rx_sop_2), .rx_sop_o(rx_sop_3), .rx_adr_i(rx_adr_2), .rx_adr_o(rx_adr_3), .clk(clk_2), .rx_dav(rx_dav_2), .resetb(resetb_2), .rx_cmd_reset_i(rx_cmd_reset_2), .rx_cmd_reset_o(rx_cmd_reset_3), .rx_cmd_test_i(rx_cmd_test_2), .rx_cmd_test_o(rx_cmd_test_3),
			.phy_data(phy_data_2), .phy_dvalid(phy_dvalid_2), .phy_dstrobe(phy_dstrobe_2),  .crc_zero(crc_zero_2),.fifo_data_w(fifo_data_w_2),
			.fifo_data_r(fifo_data_r_2), .fifo_addr_w(fifo_addr_w_2), .fifo_addr_r_i(fifo_addr_r_2), .fifo_addr_r_o(fifo_addr_r_3), .fifo_w(fifo_w_2), .cmd_busy(cmd_busy_2), .active(active_2),
			.rx_cmd_ua_i(rx_cmd_ua_2), .rx_cmd_ua_o(rx_cmd_ua_3), .rx_cmd_srej_i(rx_cmd_srej_2), .rx_cmd_srej_o(rx_cmd_srej_3), .tx_cmd_srej_i(tx_cmd_srej_2), .tx_cmd_srej_o(tx_cmd_srej_3), .rx_ns_i(rx_ns_2), .rx_ns_o(rx_ns_3), .rx_cmd_sabm_i(rx_cmd_sabm_2), .rx_cmd_sabm_o(rx_cmd_sabm_3),
			.disconnect(disconnect_2), .tx_cmd_ua_i(tx_cmd_ua_2), .tx_cmd_ua_o(tx_cmd_ua_3), .tx_cmd_reset(tx_cmd_reset_2), .fifo_addr_w_int_i(fifo_addr_w_int_2), .fifo_addr_w_int_o(fifo_addr_w_int_3), .phy_bytesel_i(phy_bytesel_2), .phy_bytesel_o(phy_bytesel_3), .phy_dvalid_old_i(phy_dvalid_old_2), .phy_dvalid_old_o(phy_dvalid_old_3), .fifo_addr_w_last_i(fifo_addr_w_last_2), .fifo_addr_w_last_o(fifo_addr_w_last_3), .phy_data_old_i(phy_data_old_2), .phy_data_old_o(phy_data_old_3), .phy_data_lowbyte_i(phy_data_lowbyte_2), .phy_data_lowbyte_o(phy_data_lowbyte_3), .phy_data_old2_i(phy_data_old2_2), .phy_data_old2_o(phy_data_old2_3), .overflow_i(overflow_2), .overflow_o(overflow_3), .packet_length_i(packet_length_2), .packet_length_o(packet_length_3), .header_i(header_2), .header_o(header_3));

	MAC_rx_iostate #(.ADDR_WIDTH(ADDR_WIDTH), .HEADER_FIELD(HEADER_FIELD), .MAX_LENGTH(MAX_LENGTH) ) MAC_rx_iostate_3 (.rx_dat_i(rx_dat_3), .rx_dat_o(rx_dat),  .rx_ena_i(rx_ena_3), .rx_ena_o(rx_ena), .rx_ena_pre_i(rx_ena_pre_3), .rx_ena_pre_o(rx_ena_pre),  .rx_eop_i(rx_eop_3), .rx_eop_o(rx_eop), .rx_err(rx_err_3), .rx_vr_i(rx_vr_3), .rx_vr_o(rx_vr), .rx_nr_i(rx_nr_3), .rx_nr_o(rx_nr),
			.rx_sop_i(rx_sop_3), .rx_sop_o(rx_sop), .rx_adr_i(rx_adr_3), .rx_adr_o(rx_adr), .clk(clk_3), .rx_dav(rx_dav_3), .resetb(resetb_3), .rx_cmd_reset_i(rx_cmd_reset_3), .rx_cmd_reset_o(rx_cmd_reset), .rx_cmd_test_i(rx_cmd_test_3), .rx_cmd_test_o(rx_cmd_test),
			.phy_data(phy_data_3), .phy_dvalid(phy_dvalid_3), .phy_dstrobe(phy_dstrobe_3),  .crc_zero(crc_zero_3),.fifo_data_w(fifo_data_w_3),
			.fifo_data_r(fifo_data_r_3), .fifo_addr_w(fifo_addr_w_3), .fifo_addr_r_i(fifo_addr_r_3), .fifo_addr_r_o(fifo_addr_r), .fifo_w(fifo_w_3), .cmd_busy(cmd_busy_3), .active(active_3),
			.rx_cmd_ua_i(rx_cmd_ua_3), .rx_cmd_ua_o(rx_cmd_ua), .rx_cmd_srej_i(rx_cmd_srej_3), .rx_cmd_srej_o(rx_cmd_srej), .tx_cmd_srej_i(tx_cmd_srej_3), .tx_cmd_srej_o(tx_cmd_srej), .rx_ns_i(rx_ns_3), .rx_ns_o(rx_ns), .rx_cmd_sabm_i(rx_cmd_sabm_3), .rx_cmd_sabm_o(rx_cmd_sabm),
			.disconnect(disconnect_3), .tx_cmd_ua_i(tx_cmd_ua_3), .tx_cmd_ua_o(tx_cmd_ua), .tx_cmd_reset(tx_cmd_reset_3), .fifo_addr_w_int_i(fifo_addr_w_int_3), .fifo_addr_w_int_o(fifo_addr_w_int), .phy_bytesel_i(phy_bytesel_3), .phy_bytesel_o(phy_bytesel), .phy_dvalid_old_i(phy_dvalid_old_3), .phy_dvalid_old_o(phy_dvalid_old), .fifo_addr_w_last_i(fifo_addr_w_last_3), .fifo_addr_w_last_o(fifo_addr_w_last), .phy_data_old_i(phy_data_old_3), .phy_data_old_o(phy_data_old), .phy_data_lowbyte_i(phy_data_lowbyte_3), .phy_data_lowbyte_o(phy_data_lowbyte), .phy_data_old2_i(phy_data_old2_3), .phy_data_old2_o(phy_data_old2), .overflow_i(overflow_3), .overflow_o(overflow), .packet_length_i(packet_length_3), .packet_length_o(packet_length), .header_i(header_3), .header_o(header));

	majority_voter #(.WIDTH(126+ADDR_WIDTH-1+ADDR_WIDTH-1+ADDR_WIDTH-1)) mv (
		.in1({fifo_addr_w_int_2, phy_bytesel_2, phy_dvalid_old_2, fifo_addr_w_last_2, phy_data_old_2, phy_data_lowbyte_2, phy_data_old2_2, rx_cmd_reset_2, rx_cmd_test_2, rx_vr_2, rx_cmd_sabm_2, tx_cmd_srej_2, tx_cmd_ua_2, overflow_2, rx_cmd_srej_2, rx_cmd_ua_2, packet_length_2, header_2, rx_nr_2, fifo_addr_r_2, rx_sop_2, rx_ena_2, rx_adr_2, rx_ena_pre_2, rx_eop_2, rx_dat_2, rx_ns_2}),
		.in2({fifo_addr_w_int_3, phy_bytesel_3, phy_dvalid_old_3, fifo_addr_w_last_3, phy_data_old_3, phy_data_lowbyte_3, phy_data_old2_3, rx_cmd_reset_3, rx_cmd_test_3, rx_vr_3, rx_cmd_sabm_3, tx_cmd_srej_3, tx_cmd_ua_3, overflow_3, rx_cmd_srej_3, rx_cmd_ua_3, packet_length_3, header_3, rx_nr_3, fifo_addr_r_3, rx_sop_3, rx_ena_3, rx_adr_3, rx_ena_pre_3, rx_eop_3, rx_dat_3, rx_ns_3}),
		.in3({fifo_addr_w_int, phy_bytesel, phy_dvalid_old, fifo_addr_w_last, phy_data_old, phy_data_lowbyte, phy_data_old2, rx_cmd_reset, rx_cmd_test, rx_vr, rx_cmd_sabm, tx_cmd_srej, tx_cmd_ua, overflow, rx_cmd_srej, rx_cmd_ua, packet_length, header, rx_nr, fifo_addr_r, rx_sop, rx_ena, rx_adr, rx_ena_pre, rx_eop, rx_dat, rx_ns}),
		.out({fifo_addr_w_int_1, phy_bytesel_1, phy_dvalid_old_1, fifo_addr_w_last_1, phy_data_old_1, phy_data_lowbyte_1, phy_data_old2_1, rx_cmd_reset_1, rx_cmd_test_1, rx_vr_1, rx_cmd_sabm_1, tx_cmd_srej_1, tx_cmd_ua_1, overflow_1, rx_cmd_srej_1, rx_cmd_ua_1, packet_length_1, header_1, rx_nr_1, fifo_addr_r_1, rx_sop_1, rx_ena_1, rx_adr_1, rx_ena_pre_1, rx_eop_1, rx_dat_1, rx_ns_1}),
		.err()
	);
endmodule

// Triplicate with:
// python tri.py < MAC_rx.v > MAC_rx_tri.v

// missing: rx_dstrobe_o <=#1 rx_dstrobe_i;
module PHY_HDLC_rx_iostate (rx_data_i, rx_data_o, rx_sdr, rx_dvalid_i, rx_dvalid_o, rx_dstrobe_i, rx_dstrobe_o, rx_clk, resetb, rx_reg_i, rx_reg_o, ones_count_i, ones_count_o, bit_count_i, bit_count_o, start_i, start_o);

	output [7:0] rx_data_o;
	output [8:0] rx_reg_o;
	input [7:0] rx_data_i;
	input [1:0] rx_sdr;
	output start_o;
	output rx_dvalid_o;
	output  rx_dstrobe_o;
	input  rx_dstrobe_i;
	
	input start_i;
	
	input resetb;
	output [3:0] bit_count_o;
	output [2:0] ones_count_o;
	input rx_clk;
	input rx_dvalid_i;

	input [3:0] bit_count_i;
	input [2:0] ones_count_i;
	input [8:0] rx_reg_i;
	reg [8:0] rx_reg_o;
	reg [7:0] rx_data_o;

	reg [2:0] ones_count_o;
	reg [3:0] bit_count_o;
	reg rx_dvalid_o;

	reg  rx_dstrobe_o;
	reg start_o;
	always @(posedge rx_clk or negedge resetb) begin
		if (~resetb) begin
			//rx_reg_o <=#1 0;
			//ones_count_o <=#1 0;
			//bit_count_o <=#1 0;
			//rx_dvalid_o <=#1 0;
			//rx_dstrobe_o <=#1 0;
			//start_o <=#1 0;
			//rx_dvalid_o <=#1 0;
			//rx_data_o <=#1 0;
		end
		else begin
			rx_data_o <=#1 rx_data_i;
			start_o <=#1 start_i;
			rx_dvalid_o <=#1 rx_dvalid_i;
			bit_count_o <=#1 bit_count_i;
			ones_count_o <=#1 ones_count_i;
			rx_reg_o <=#1 rx_reg_i;
		
			rx_dstrobe_o <=#1 0;
			if (rx_dvalid_i) start_o <=#1 0;
			rx_reg_o <=#1 {rx_sdr[0], rx_sdr[1], rx_reg_i[8:2]};
			bit_count_o <=#1 bit_count_i + 2;
			if ((bit_count_i==8) && rx_dvalid_i) begin
				rx_data_o <=#1 rx_reg_i[8:1];
				bit_count_o <=#1 2;
				rx_dstrobe_o <=#1 1;
			end
			if ((bit_count_i==9) && rx_dvalid_i) begin
				rx_data_o <=#1 rx_reg_i[7:0];
				bit_count_o <=#1 3;
				rx_dstrobe_o <=#1 1;
			end


			if ((ones_count_i==4) && (~rx_sdr[0]) && (rx_sdr[1])) begin
				rx_reg_o <=#1 {rx_sdr[1], rx_reg_i[8:1]};
				bit_count_o <=#1 bit_count_i + 1;
				if (bit_count_i==8) begin
					bit_count_o <=#1 1;
					rx_data_o <=#1 rx_reg_i[8:1];
					rx_dstrobe_o <=#1 1;
				end
				if (bit_count_i==9) begin
					bit_count_o <=#1 2;
					rx_data_o <=#1 rx_reg_i[7:0];
					rx_dstrobe_o <=#1 1;
				end
			end

			if ((ones_count_i==5) && (~rx_sdr[1])) begin
				rx_reg_o <=#1 {rx_sdr[0], rx_reg_i[8:1]};
				bit_count_o <=#1 bit_count_i + 1;
				if (bit_count_i==8) begin
					bit_count_o <=#1 1;
					rx_data_o <=#1 rx_reg_i[8:1];
					rx_dstrobe_o <=#1 1;
				end
				if (bit_count_i==9) begin
					bit_count_o <=#1 2;
					rx_data_o <=#1 rx_reg_i[7:0];
					rx_dstrobe_o <=#1 1;
				end
			end
			
			if (rx_sdr[0] && rx_sdr[1]) begin
				if (ones_count_i<6) ones_count_o <=#1 ones_count_i + 2;
				if (ones_count_i==6) ones_count_o <=#1 7;
			end
			else begin
				if (start_i) rx_dvalid_o <=#1 1;
				if (~rx_sdr[0]) ones_count_o <=#1 0;
				else ones_count_o <=#1 1;
			end
			
			
			if ((ones_count_i==5) && (~rx_sdr[0]) && (rx_sdr[1])) begin
				rx_dvalid_o <=#1 0;
				bit_count_o<=#1 0;
				start_o <=#1 1;
			end

			if (ones_count_i==6) begin
				rx_dvalid_o <=#1 0;
				bit_count_o<=#1 1;
				if (~rx_sdr[1]) start_o <=#1 1;
				else start_o <=#1 0;
			end

			if (ones_count_i==7) begin
				rx_dvalid_o <=#1 0;
				bit_count_o<=#1 0;
				start_o<=#1 0;
			end

		end
	end
	

endmodule

module PHY_HDLC_rx_tri (rx_data_1, rx_data_2, rx_data_3, rx_sdr_1, rx_sdr_2, rx_sdr_3, rx_dvalid_1, rx_dvalid_2, rx_dvalid_3, rx_dstrobe_1, rx_dstrobe_2, rx_dstrobe_3, rx_clk_1, rx_clk_2, rx_clk_3, resetb_1, resetb_2, resetb_3);

	output [7:0] rx_data_1, rx_data_2, rx_data_3;
	input rx_clk_1, rx_clk_2, rx_clk_3;
	input [1:0] rx_sdr_1, rx_sdr_2, rx_sdr_3;
	input resetb_1, resetb_2, resetb_3;
	output rx_dvalid_1, rx_dvalid_2, rx_dvalid_3;

	output  rx_dstrobe_1, rx_dstrobe_2, rx_dstrobe_3;

	wire [8:0] rx_reg_1, rx_reg_2, rx_reg_3;
	wire [2:0] ones_count_1, ones_count_2, ones_count_3;
	wire [3:0] bit_count_1, bit_count_2, bit_count_3;
	wire rx_dvalid_1, rx_dvalid_2, rx_dvalid_3;
	wire rx_dstrobe_1, rx_dstrobe_2, rx_dstrobe_3;
	wire start_1, start_2, start_3;
	wire [7:0] rx_data_1, rx_data_2, rx_data_3;
	wire [8:0] rx_reg;
	wire [2:0] ones_count;
	wire [3:0] bit_count;
	wire rx_dvalid;
	wire rx_dstrobe;
	wire start;
	wire [7:0] rx_data;
	PHY_HDLC_rx_iostate PHY_HDLC_rx_iostate_1   (.rx_data_i(rx_data_1), .rx_data_o(rx_data_2), .rx_sdr(rx_sdr_1), .rx_dvalid_i(rx_dvalid_1), .rx_dvalid_o(rx_dvalid_2), .rx_dstrobe_i(rx_dstrobe_1), .rx_dstrobe_o(rx_dstrobe_2), .rx_clk(rx_clk_1), .resetb(resetb_1), .rx_reg_i(rx_reg_1), .rx_reg_o(rx_reg_2), .ones_count_i(ones_count_1), .ones_count_o(ones_count_2), .bit_count_i(bit_count_1), .bit_count_o(bit_count_2), .start_i(start_1), .start_o(start_2));
	PHY_HDLC_rx_iostate PHY_HDLC_rx_iostate_2   (.rx_data_i(rx_data_2), .rx_data_o(rx_data_3), .rx_sdr(rx_sdr_2), .rx_dvalid_i(rx_dvalid_2), .rx_dvalid_o(rx_dvalid_3), .rx_dstrobe_i(rx_dstrobe_2), .rx_dstrobe_o(rx_dstrobe_3), .rx_clk(rx_clk_2), .resetb(resetb_2), .rx_reg_i(rx_reg_2), .rx_reg_o(rx_reg_3), .ones_count_i(ones_count_2), .ones_count_o(ones_count_3), .bit_count_i(bit_count_2), .bit_count_o(bit_count_3), .start_i(start_2), .start_o(start_3));
	PHY_HDLC_rx_iostate PHY_HDLC_rx_iostate_3   (.rx_data_i(rx_data_3), .rx_data_o(rx_data), .rx_sdr(rx_sdr_3), .rx_dvalid_i(rx_dvalid_3), .rx_dvalid_o(rx_dvalid), .rx_dstrobe_i(rx_dstrobe_3), .rx_dstrobe_o(rx_dstrobe), .rx_clk(rx_clk_3), .resetb(resetb_3), .rx_reg_i(rx_reg_3), .rx_reg_o(rx_reg), .ones_count_i(ones_count_3), .ones_count_o(ones_count), .bit_count_i(bit_count_3), .bit_count_o(bit_count), .start_i(start_3), .start_o(start));

	majority_voter #(.WIDTH(27)) mv (
		.in1({rx_reg_2, ones_count_2, bit_count_2, rx_dvalid_2, rx_dstrobe_2, start_2, rx_data_2}),
		.in2({rx_reg_3, ones_count_3, bit_count_3, rx_dvalid_3, rx_dstrobe_3, start_3, rx_data_3}),
		.in3({rx_reg, ones_count, bit_count, rx_dvalid, rx_dstrobe, start, rx_data}),
		.out({rx_reg_1, ones_count_1, bit_count_1, rx_dvalid_1, rx_dstrobe_1, start_1, rx_data_1}),
		.err()
	);
endmodule

// missing: tx_sdr_o <=#1 tx_sdr_i;
// missing: tx_dstrobe_o <=#1 tx_dstrobe_i;
module PHY_HDLC_tx_iostate (tx_data, tx_dvalid, tx_dstrobe_i, tx_dstrobe_o, tx_sdr_i, tx_sdr_o, rx_clk, resetb, tx_reg_i, tx_reg_o, ones_count_i, ones_count_o, bit_count_i, bit_count_o, state_i, state_o, tx_dvalid_internal_i, tx_dvalid_internal_o);

	input [7:0] tx_data;
	input tx_dstrobe_i;
	input tx_dvalid_internal_i;
	
	input resetb;
	
	input [1:0] state_i;
	input [3:0] bit_count_i;
	input [2:0] ones_count_i;
	input [8:0] tx_reg_i;
	
	input rx_clk;
	input tx_dvalid;
	output [1:0] tx_sdr_o;
	output [8:0] tx_reg_o;
	input [1:0] tx_sdr_i;
	output tx_dvalid_internal_o;
	output tx_dstrobe_o;
	output [1:0] state_o;
	output [3:0] bit_count_o;
	output [2:0] ones_count_o;
	reg [8:0] tx_reg_o;
	reg [2:0] ones_count_o;
	reg [3:0] bit_count_o;
	reg [1:0] state_o;
	reg [1:0] tx_sdr_o;
	reg tx_dstrobe_o;
	reg tx_dvalid_internal_o;
	parameter [1:0] IDLE = 2'd0,
					START= 2'd1,
					TX   = 2'd2,
					END  = 2'd3;
	
	always @(posedge rx_clk or negedge resetb) begin
		if (~resetb) begin
			tx_reg_o<=#1 9'h1ff;
			tx_sdr_o[0] <=#1 1;
			tx_sdr_o[1] <=#1 1;
			ones_count_o <=#1 0;
			bit_count_o <=#1 0;
			state_o <=#1 0;
			tx_dstrobe_o <=#1 0;
		end
		else begin
			state_o <=#1 state_i;
			bit_count_o <=#1 bit_count_i;
			ones_count_o <=#1 ones_count_i;
			tx_sdr_o[1] <=#1 tx_sdr_i[1];
			tx_sdr_o[0] <=#1 tx_sdr_i[0];
			tx_reg_o <=#1 tx_reg_i;
			tx_dvalid_internal_o <=#1 tx_dvalid_internal_i;

			tx_dstrobe_o <=#1 0;
		
			if (tx_reg_i[0] && tx_reg_i[1]) begin
				if (ones_count_i<6) ones_count_o <=#1 ones_count_i + 2;
				if (ones_count_i==6) ones_count_o <=#1 7;
			end
			else begin
				if (~tx_reg_i[1]) ones_count_o <=#1 0;
				else ones_count_o <=#1 1;
			end
			
			if (~tx_dvalid) tx_dvalid_internal_o<=#1 0;

			case (state_i) // synopsys parallel_case
				//IDLE state is default
				START: begin
					bit_count_o <=#1 bit_count_i - 2;
					tx_reg_o <=#1 tx_reg_i>>2;
					tx_sdr_o[0] <=#1 tx_reg_i[1];
					tx_sdr_o[1] <=#1 tx_reg_i[0];
					if ((bit_count_i ==2) || (bit_count_i ==1)) begin
						state_o <=#1 TX;
						tx_reg_o[7:0] <=#1 tx_data;
						tx_dstrobe_o <=#1 1;
						bit_count_o<=#1 8;
					end
					
					if (~tx_dvalid) state_o <=#1 IDLE;
				end
			
				TX: begin				
					tx_reg_o <=#1 tx_reg_i>>2;
					tx_sdr_o[0] <=#1 tx_reg_i[1];
					tx_sdr_o[1] <=#1 tx_reg_i[0];
					bit_count_o <=#1 bit_count_i - 2;
					
					if ((ones_count_i!=5) && ((ones_count_i!=4) || (~tx_reg_i[0]))) begin
						if (bit_count_i==3) begin
							if (tx_dvalid_internal_i & tx_dvalid) begin
								tx_dstrobe_o <=#1 1;
								bit_count_o <=#1 9;
								tx_reg_o[8:1] <=#1 tx_data;
							end
							else begin
								bit_count_o <=#1 1;
								tx_reg_o[8:1] <=#1 'h7e;
							end
						end
						if (bit_count_i==2) begin
							bit_count_o <=#1 8;
							if (tx_dvalid_internal_i & tx_dvalid) begin
								tx_dstrobe_o <=#1 1;
								tx_reg_o[7:0] <=#1 tx_data;
							end
							else begin
								tx_reg_o[8:0] <=#1 'b101111110;
								state_o <=#1 END;
							end
						end
					end

					
					if ((ones_count_i==4) && tx_reg_i[0]) begin
						tx_sdr_o[0] <=#1 0;
						tx_sdr_o[1] <=#1 1;
						tx_reg_o <=#1 tx_reg_i>>1;
						ones_count_o <=#1 0;
						bit_count_o <=#1 bit_count_i - 1;
						if (bit_count_i==2) begin
							bit_count_o <=#1 9;
							if (tx_dvalid_internal_i & tx_dvalid) begin
								tx_reg_o[8:1] <=#1 tx_data;
								tx_dstrobe_o <=#1 1;
							end
							else begin
								tx_reg_o[8:1] <=#1 'h7e;
								state_o <=#1 END;
							end
						end
					end
					
					if (ones_count_i==5) begin
						tx_sdr_o[0] <=#1 tx_reg_i[0];
						tx_sdr_o[1] <=#1 0;
						tx_reg_o <=#1 tx_reg_i>>1;
						ones_count_o <=#1 tx_reg_i[0];
						bit_count_o <=#1 bit_count_i - 1;
						if (bit_count_i==2) begin
							bit_count_o <=#1 9;
							if (tx_dvalid_internal_i & tx_dvalid) begin
								tx_dstrobe_o <=#1 1;
								tx_reg_o[8:1] <=#1 tx_data;
							end
							else begin
								tx_reg_o[8:1] <=#1 'h7e;
								state_o <=#1 END;
							end
						end
					end
					
					if (bit_count_i==1) begin
						state_o <=#1 END;
						bit_count_o <=#1 7;
					end
				end
				
				END: begin
					tx_reg_o <=#1 tx_reg_i>>2;
					tx_sdr_o[0] <=#1 tx_reg_i[1];
					tx_sdr_o[1] <=#1 tx_reg_i[0];
					bit_count_o <=#1 bit_count_i - 2;
					if ((bit_count_i==0) || (bit_count_i==1)) state_o <=#1 IDLE;

					if ((ones_count_i==5) && (tx_reg_i[0])) begin
						tx_sdr_o[0]<=#1 0;
						if (tx_dvalid) begin
							tx_dvalid_internal_o<=#1 1;
							state_o <=#1 TX;
							tx_reg_o[7:0] <=#1 tx_data;
							tx_dstrobe_o <=#1 1;
							bit_count_o<=#1 8;
						end
						else begin
							tx_reg_o<=#1 'h7f;
							state_o <=#1 IDLE;
						end
					end

					if (ones_count_i==6) begin
						tx_sdr_o[1]<=#1 0;
						if (tx_dvalid) begin
							tx_dvalid_internal_o<=#1 1;
							state_o <=#1 TX;
							tx_reg_o[6:0] <=#1 tx_data[7:1];
							tx_sdr_o[0] <=#1 tx_data[0];
							tx_dstrobe_o <=#1 1;
							bit_count_o<=#1 7;
							ones_count_o <=#1 tx_data[0];
						end
						else begin
							tx_reg_o <=#1 'h7f;
							tx_sdr_o[0]<=#1 1;
							state_o <=#1 IDLE;
						end
					end
					
				end
				
				default: begin
					//tx_sdr_o[1]<=#1 1;
					//tx_sdr_o[0]<=#1 1;
					tx_reg_o <=#1 tx_reg_i>>2;
					tx_sdr_o[0] <=#1 tx_reg_i[1];
					tx_sdr_o[1] <=#1 tx_reg_i[0];
					bit_count_o <=#1 8;
					tx_dvalid_internal_o <=#1 0;
					if ((~tx_reg_i[1]) || (~tx_reg_i[0]))begin
						if (tx_dvalid) begin
							tx_sdr_o <=#1 2'b11;
							tx_reg_o[7:0] <=#1 'h7e;
							bit_count_o <=#1 8;
							state_o <=#1 START;
							tx_dvalid_internal_o<=#1 1;
						end
						else tx_reg_o<=#1 'h7f;
					end
				end


			endcase

		end
	end


endmodule

module PHY_HDLC_tx_tri (tx_data_1, tx_data_2, tx_data_3, tx_dvalid_1, tx_dvalid_2, tx_dvalid_3, tx_dstrobe_1, tx_dstrobe_2, tx_dstrobe_3, tx_sdr_1, tx_sdr_2, tx_sdr_3, rx_clk_1, rx_clk_2, rx_clk_3, resetb_1, resetb_2, resetb_3);

	input [7:0] tx_data_1, tx_data_2, tx_data_3;
	input rx_clk_1, rx_clk_2, rx_clk_3;
	input tx_dvalid_1, tx_dvalid_2, tx_dvalid_3;
	output [1:0] tx_sdr_1, tx_sdr_2, tx_sdr_3;
	output tx_dstrobe_1, tx_dstrobe_2, tx_dstrobe_3;
	input resetb_1, resetb_2, resetb_3;

	wire [8:0] tx_reg_1, tx_reg_2, tx_reg_3;
	wire [2:0] ones_count_1, ones_count_2, ones_count_3;
	wire [3:0] bit_count_1, bit_count_2, bit_count_3;
	wire [1:0] state_1, state_2, state_3;
	wire tx_dstrobe_1, tx_dstrobe_2, tx_dstrobe_3;
	wire tx_dvalid_internal_1, tx_dvalid_internal_2, tx_dvalid_internal_3;
	wire [1:0] tx_sdr_1, tx_sdr_2, tx_sdr_3;
	wire [8:0] tx_reg;
	wire [2:0] ones_count;
	wire [3:0] bit_count;
	wire [1:0] state;
	wire tx_dstrobe;
	wire tx_dvalid_internal;
	wire [1:0] tx_sdr;
	PHY_HDLC_tx_iostate PHY_HDLC_tx_iostate_1   (.tx_data(tx_data_1), .tx_dvalid(tx_dvalid_1), .tx_dstrobe_i(tx_dstrobe_1), .tx_dstrobe_o(tx_dstrobe_2), .tx_sdr_i(tx_sdr_1), .tx_sdr_o(tx_sdr_2), .rx_clk(rx_clk_1), .resetb(resetb_1), .tx_reg_i(tx_reg_1), .tx_reg_o(tx_reg_2), .ones_count_i(ones_count_1), .ones_count_o(ones_count_2), .bit_count_i(bit_count_1), .bit_count_o(bit_count_2), .state_i(state_1), .state_o(state_2), .tx_dvalid_internal_i(tx_dvalid_internal_1), .tx_dvalid_internal_o(tx_dvalid_internal_2));
	PHY_HDLC_tx_iostate PHY_HDLC_tx_iostate_2   (.tx_data(tx_data_2), .tx_dvalid(tx_dvalid_2), .tx_dstrobe_i(tx_dstrobe_2), .tx_dstrobe_o(tx_dstrobe_3), .tx_sdr_i(tx_sdr_2), .tx_sdr_o(tx_sdr_3), .rx_clk(rx_clk_2), .resetb(resetb_2), .tx_reg_i(tx_reg_2), .tx_reg_o(tx_reg_3), .ones_count_i(ones_count_2), .ones_count_o(ones_count_3), .bit_count_i(bit_count_2), .bit_count_o(bit_count_3), .state_i(state_2), .state_o(state_3), .tx_dvalid_internal_i(tx_dvalid_internal_2), .tx_dvalid_internal_o(tx_dvalid_internal_3));
	PHY_HDLC_tx_iostate PHY_HDLC_tx_iostate_3   (.tx_data(tx_data_3), .tx_dvalid(tx_dvalid_3), .tx_dstrobe_i(tx_dstrobe_3), .tx_dstrobe_o(tx_dstrobe), .tx_sdr_i(tx_sdr_3), .tx_sdr_o(tx_sdr), .rx_clk(rx_clk_3), .resetb(resetb_3), .tx_reg_i(tx_reg_3), .tx_reg_o(tx_reg), .ones_count_i(ones_count_3), .ones_count_o(ones_count), .bit_count_i(bit_count_3), .bit_count_o(bit_count), .state_i(state_3), .state_o(state), .tx_dvalid_internal_i(tx_dvalid_internal_3), .tx_dvalid_internal_o(tx_dvalid_internal));

	majority_voter #(.WIDTH(22)) mv (
		.in1({tx_reg_2, ones_count_2, bit_count_2, state_2, tx_dstrobe_2, tx_dvalid_internal_2, tx_sdr_2}),
		.in2({tx_reg_3, ones_count_3, bit_count_3, state_3, tx_dstrobe_3, tx_dvalid_internal_3, tx_sdr_3}),
		.in3({tx_reg, ones_count, bit_count, state, tx_dstrobe, tx_dvalid_internal, tx_sdr}),
		.out({tx_reg_1, ones_count_1, bit_count_1, state_1, tx_dstrobe_1, tx_dvalid_internal_1, tx_sdr_1}),
		.err()
	);
endmodule

//  Author: 	BONACINI Sandro, CERN EP/MIC
//
//  CRC Generator/Checker
//  
//  CRC is calculated right-shifting, the polynomial must therefore
//  be reversed.
//  The output crc is directly the crc register value. There is no
//  inversion in between.
//  Default parameters produce a CRC16-CCITT output.
//  When checking, correct reception is signaled by a zero in the crc
//  output.
//
//  Parameters:
//
//  CRC_WIDTH	    bit width of the crc output;
//
//  DATA_WIDTH	    bit width of the data input (must be at least 2);
//  	    	    
//  INIT_VAL	    initialization value of the crc register,
//  	    	    suggested values are all-zeros and all-ones;
//
//  POLY    	    Polynomial (remeber to reverse it)
//  	    	    i.e. CCITT 1021h has POLY = 'h8408.
//
/////////////////////////////////////////////////////////////////////


`timescale 1ns/1ns
module crc_iostate (d, init, reset_b, clk, d_valid, crc_o, crc_i);
    // synopsys template

    parameter CRC_WIDTH = 16;
    parameter DATA_WIDTH= 16;
    parameter INIT_VAL	= 'hffff;
    parameter POLY  	= 'h8408;


    // I/Os
    
    input   [(DATA_WIDTH-1): 0] d;
    input   	    	    	init;
    input   	    	    	d_valid;
    input         	    	clk;
    input         	    	reset_b;

    output  [(CRC_WIDTH-1) : 0] crc_o;
    input  [(CRC_WIDTH-1) : 0] crc_i;
    
    
    // Output regs
    
    reg     [(CRC_WIDTH-1) : 0] crc_o;


    // Internal wires & regs
    
    reg     [(CRC_WIDTH-1) : 0] next_crc;

    
    // Always statements
    
    always @(d or crc_i or init) begin
    	next_crc = crc_calc(crc_i, d);
		if (init) next_crc = crc_calc(INIT_VAL, d);
    end
    
    
    // synopsys async_set_reset "reset_b"
    always @ (posedge clk or negedge reset_b) begin
		if (~reset_b) begin
			crc_o <=#1 INIT_VAL;
		end
		else begin
			 crc_o <=#1 crc_i;
			if (init && (~d_valid)) begin
				crc_o <=#1 INIT_VAL;
			end
			
			if (d_valid) crc_o <=#1 next_crc;
		end
	end


    // Functions

    function [(CRC_WIDTH-1) : 0] crc_calc;
		input   [(CRC_WIDTH-1) : 0] crc_in;
		input   [(DATA_WIDTH-1): 0] d;
		integer     	    	    i;
    	reg     [(CRC_WIDTH-1) : 0] p_crc[0 :(DATA_WIDTH-2)];
		begin
	    	p_crc[0] = crc_atom(crc_in, d[0]);

	    	for (i=1; i< (DATA_WIDTH-1); i=i+1) begin
	    		p_crc[i] = crc_atom(p_crc[i-1], d[i]);
	    	end

	    	crc_calc = crc_atom(p_crc[DATA_WIDTH-2], d[DATA_WIDTH-1]);
		end
    endfunction
    

    function [(CRC_WIDTH-1) : 0] crc_atom;
		input   [(CRC_WIDTH-1) : 0] crc_in;
		input   	    	    d;
		begin
    	    if (!(crc_in[0] ^ d)) crc_atom = (crc_in >> 1);
			else crc_atom = (crc_in >> 1) ^ POLY[(CRC_WIDTH-1):0];
		end
    endfunction
    
endmodule

module crc_tri (d_1, d_2, d_3, init_1, init_2, init_3, reset_b_1, reset_b_2,
	reset_b_3, clk_1, clk_2, clk_3, d_valid_1, d_valid_2, d_valid_3, crc_1,
	crc_2, crc_3);

    // synopsys template

    parameter CRC_WIDTH = 16;
    parameter DATA_WIDTH= 16;
    parameter INIT_VAL	= 'hffff;
    parameter POLY  	= 'h8408;


    // I/Os
    
    wire  [(CRC_WIDTH-1) : 0] crc;

    input   [(DATA_WIDTH-1): 0] d_1;
    input   	    	    	init_1;
    input   	    	    	d_valid_1;
    input         	    	clk_1;
    input         	    	reset_b_1;
    output  [(CRC_WIDTH-1) : 0] crc_1;

    input   [(DATA_WIDTH-1): 0] d_2;
    input   	    	    	init_2;
    input   	    	    	d_valid_2;
    input         	    	clk_2;
    input         	    	reset_b_2;
    output  [(CRC_WIDTH-1) : 0] crc_2;

    input   [(DATA_WIDTH-1): 0] d_3;
    input   	    	    	init_3;
    input   	    	    	d_valid_3;
    input         	    	clk_3;
    input         	    	reset_b_3;
    output  [(CRC_WIDTH-1) : 0] crc_3;


	crc_iostate #(.CRC_WIDTH(CRC_WIDTH),.DATA_WIDTH(DATA_WIDTH),.INIT_VAL(INIT_VAL),.POLY(POLY))  crc1 (
		.d(d_1),
		.init(init_1),
		.reset_b(reset_b_1),
		.clk(clk_1),
		.d_valid(d_valid_1),
		.crc_o(crc_2),
		.crc_i(crc_1)
	);

	crc_iostate #(.CRC_WIDTH(CRC_WIDTH),.DATA_WIDTH(DATA_WIDTH),.INIT_VAL(INIT_VAL),.POLY(POLY))  crc2 (
		.d(d_2),
		.init(init_2),
		.reset_b(reset_b_2),
		.clk(clk_2),
		.d_valid(d_valid_2),
		.crc_o(crc_3),
		.crc_i(crc_2)
	);

	crc_iostate #(.CRC_WIDTH(CRC_WIDTH),.DATA_WIDTH(DATA_WIDTH),.INIT_VAL(INIT_VAL),.POLY(POLY))  crc3 (
		.d(d_3),
		.init(init_3),
		.reset_b(reset_b_3),
		.clk(clk_3),
		.d_valid(d_valid_3),
		.crc_o(crc),
		.crc_i(crc_3)
	);
	
	majority_voter #(.WIDTH(CRC_WIDTH)) mv (
		.in1(crc_2),
		.in2(crc_3),
		.in3(crc),
		.out(crc_1),
		.err()
	);
	
	
endmodule

`timescale 1ns/1ns
/*
// MADE WITH LATCHES: (but IBM's smallest latch is bigger than smallest FF!)
// Artisan TLATX1TF is smaller... 4.4x3.6 um2
//
module SRAM (data_w, data_r, addr_w, addr_r, w_enable, clk_w);
	parameter ADDR_WIDTH = 8;
	parameter DATA_WIDTH = 16;
	parameter SIZE = 1<<ADDR_WIDTH;
 	
	input [ADDR_WIDTH-1:0] addr_w, addr_r;
 	output [DATA_WIDTH-1:0] data_r;
	input [DATA_WIDTH-1:0] data_w;
	input w_enable, clk_w;
	
	reg [SIZE-1:0] wl_w;
	reg [DATA_WIDTH-1:0] mem [SIZE-1:0];
	
	integer i;
	always @* for (i=0; i<SIZE; i=i+1)	begin
		wl_w[i] = clk_w || (!((i==addr_w) && w_enable));
		if (!wl_w[i]) mem[i] = data_w;
	end

	wire [DATA_WIDTH-1:0] data_r = mem[addr_r];

endmodule
*/


// MADE WITH FFs

module SRAM #(
	parameter ADDR_WIDTH = 3,
	parameter DATA_WIDTH = 4,
	parameter SIZE = 1<<ADDR_WIDTH
)( 	
	input [ADDR_WIDTH-1:0] addr_w, addr_r,
 	output [DATA_WIDTH-1:0] data_r,
	input [DATA_WIDTH-1:0] data_w,
	input w_enable, clk_w
);	
	reg [SIZE-1:0] wl_w, wl_w_latched;
	reg [DATA_WIDTH-1:0] mem [SIZE-1:0];


	//integer i;
	/*
	always @* for (i=0; i<SIZE; i=i+1)	begin
		if (!clk_w) begin
			wl_w_latched[i] = w_enable && (i==addr_w) ;
		end
		wl_w[i] = wl_w_latched[i] && clk_w;
	end
*/
	reg w_enable_latched;
	always @* begin
		if (!clk_w) w_enable_latched = w_enable;
	end
	
	wire clk_w_gated = clk_w && w_enable_latched;
	
	generate
		genvar j;
		for (j=0; j<SIZE; j=j+1)	begin: mygen
 			always @(posedge wl_w[j]) mem[j] <=#1 data_w;

			always @* begin
				if (!clk_w_gated) wl_w_latched[j] = (j==addr_w) ;
				wl_w[j] = wl_w_latched[j] && clk_w_gated;
			end
		end
	endgenerate

	assign data_r = mem[addr_r];

endmodule

/*
module SRAM (data_w, data_r, addr_w, addr_r, w_enable, clk_w);
	parameter ADDR_WIDTH = 8;
	parameter DATA_WIDTH = 16;
	parameter SIZE = 1<<ADDR_WIDTH;
 	
	input [ADDR_WIDTH-1:0] addr_w, addr_r;
 	output [DATA_WIDTH-1:0] data_r;
	input [DATA_WIDTH-1:0] data_w;
	input w_enable, clk_w;
	
	reg [DATA_WIDTH-1:0] mem [SIZE-1:0];


	always @(posedge clk_w) begin
		if(w_enable) mem[addr_w] <=#1 data_w;
	end
	wire [DATA_WIDTH-1:0] data_r = mem[addr_r];

endmodule
*/
`timescale 1ns/1ps
module SRAM_tri #(
	parameter DATA_WIDTH=25, ADDR_WIDTH=8
) (
	input [ADDR_WIDTH-1:0] addr_w_1, addr_r_1,
	input [ADDR_WIDTH-1:0] addr_w_2, addr_r_2,
	input [ADDR_WIDTH-1:0] addr_w_3, addr_r_3,
 	output [DATA_WIDTH-1:0] data_r_1,
 	output [DATA_WIDTH-1:0] data_r_2,
 	output [DATA_WIDTH-1:0] data_r_3,
	input [DATA_WIDTH-1:0] data_w_1,
	input [DATA_WIDTH-1:0] data_w_2,
	input [DATA_WIDTH-1:0] data_w_3,
	input w_enable_1, clk_w_1,
	input w_enable_2, clk_w_2,
	input w_enable_3, clk_w_3
);

	wire [ADDR_WIDTH-1:0] addr_w, addr_r;
 	wire [DATA_WIDTH-1:0] data_r;
	wire [DATA_WIDTH-1:0] data_w;

	SRAM #(.ADDR_WIDTH(ADDR_WIDTH),.DATA_WIDTH(DATA_WIDTH)) SRAM_ (
		.data_w(data_w), .data_r(data_r), .addr_w(addr_w), .addr_r(addr_r),
		.w_enable(w_enable), .clk_w(clk_w)
	);

	majority_voter #(.WIDTH(2*ADDR_WIDTH+DATA_WIDTH+2)) mv (
		.in1({w_enable_1, clk_w_1, addr_w_1, addr_r_1, data_w_1}),
		.in2({w_enable_2, clk_w_2, addr_w_2, addr_r_2, data_w_2}),
		.in3({w_enable_3, clk_w_3, addr_w_3, addr_r_3, data_w_3}),
		.out({w_enable, clk_w, addr_w, addr_r, data_w}),
		.err()
	);
	
	
	assign data_r_1 = data_r;
	assign data_r_2 = data_r;
	assign data_r_3 = data_r;
endmodule
`timescale 1ns/1ns
module HDLC_tri 
#(

	parameter MASTER = 0,
	 HEADER_FIELD = 1,
	 ADDR_WIDTH = 5,
	 MAX_PACKET_LENGTH = 16, 
	 THRESHOLD = 2**ADDR_WIDTH -MAX_PACKET_LENGTH-1
)
 (
input [15:0]  tx_dat_1,
input [15:0]  tx_dat_2,
input [15:0]  tx_dat_3,
output [15:0]  rx_dat_1,
output [15:0]  rx_dat_2,
output [15:0]  rx_dat_3,
input   rx_dav_1,user_clk_pri_1, user_clk_aux_1, 
input   rx_dav_2,user_clk_pri_2, user_clk_aux_2, 
input   rx_dav_3,user_clk_pri_3, user_clk_aux_3, 
output  rx_ena_1, rx_eop_1, tx_dav_1, rx_sop_1, rx_err_1,
output  rx_ena_2, rx_eop_2, tx_dav_2, rx_sop_2, rx_err_2,
output  rx_ena_3, rx_eop_3, tx_dav_3, rx_sop_3, rx_err_3,
input  resetb_1, tx_ena_1, disable_aux_1,
input  resetb_2, tx_ena_2, disable_aux_2,
input  resetb_3, tx_ena_3, disable_aux_3,
output  user_clk_1,
output  user_clk_2,
output  user_clk_3,
input [7:0]  tx_adr_1,
input [7:0]  tx_adr_2,
input [7:0]  tx_adr_3,
output [7:0]  rx_adr_1,
output [7:0]  rx_adr_2,
output [7:0]  rx_adr_3,
input  tx_cmd_reset_1, tx_cmd_test_1, tx_cmd_sabm_1,
input  tx_cmd_reset_2, tx_cmd_test_2, tx_cmd_sabm_2,
input  tx_cmd_reset_3, tx_cmd_test_3, tx_cmd_sabm_3,
output  rx_cmd_reset_1, rx_cmd_test_1, rx_cmd_ua_1,
output  rx_cmd_reset_2, rx_cmd_test_2, rx_cmd_ua_2,
output  rx_cmd_reset_3, rx_cmd_test_3, rx_cmd_ua_3,
output [2:0]  tx_ns_1, rx_nr_1,rx_ns_1,
output [2:0]  tx_ns_2, rx_nr_2,rx_ns_2,
output [2:0]  tx_ns_3, rx_nr_3,rx_ns_3,
output [6:0]  rx_cmd_srej_1,
output [6:0]  rx_cmd_srej_2,
output [6:0]  rx_cmd_srej_3,
output  cmd_busy_1,
output  cmd_busy_2,
output  cmd_busy_3,
output [1:0]  tx_sdr_1,
output [1:0]  tx_sdr_2,
output [1:0]  tx_sdr_3,
input [1:0]  rx_sdr_1, rx_sdr_aux_1,
input [1:0]  rx_sdr_2, rx_sdr_aux_2,
input [1:0]  rx_sdr_3, rx_sdr_aux_3,
output  active_aux_1,
output  active_aux_2,
output  active_aux_3
);
wire  rx_cmd_reset__1, rx_cmd_test__1;
wire  rx_cmd_reset__2, rx_cmd_test__2;
wire  rx_cmd_reset__3, rx_cmd_test__3;
wire [2:0]  rx_vr_1;
wire [2:0]  rx_vr_2;
wire [2:0]  rx_vr_3;
wire [6:0]  tx_cmd_srej_1, tx_cmd_srej__1;
wire [6:0]  tx_cmd_srej_2, tx_cmd_srej__2;
wire [6:0]  tx_cmd_srej_3, tx_cmd_srej__3;

rx_tri #(.HEADER_FIELD(HEADER_FIELD), .ADDR_WIDTH(ADDR_WIDTH)) rx (
		.rx_dat_1(rx_dat_1),
		.rx_sdr_pri_1(rx_sdr_1),
		.clk_pri_1(user_clk_pri_1),
		.rx_sdr_aux_1(rx_sdr_aux_1),
		.clk_aux_1(user_clk_aux_1),
		.clk_active_1(user_clk_1),
		.rx_ena_1(rx_ena_1),
		.rx_dav_1(rx_dav_1),
		.rx_eop_1(rx_eop_1),
		.rx_sop_1(rx_sop_1),
		.rx_adr_1(rx_adr_1),
		.rx_err_1(rx_err_1),
		.rx_vr_1(rx_vr_1),
		.rx_nr_1(rx_nr_1),
		.rx_ns_1(rx_ns_1),
		.cmd_busy_1(cmd_busy_1),
		.rx_cmd_ua_1(rx_cmd_ua_1),
		.tx_cmd_ua_1(tx_cmd_ua_1),
		.rx_cmd_srej_1(rx_cmd_srej_1),
		.tx_cmd_srej_1(tx_cmd_srej_1),
		.resetb_1(resetb_1),
		.rx_cmd_reset_1(rx_cmd_reset__1),
		.rx_cmd_test_1(rx_cmd_test__1),
		.tx_cmd_reset_1(tx_cmd_reset__1),
		.active_aux_1(active_aux_1),
		.disable_aux_1(disable_aux_1),
		.rx_dat_2(rx_dat_2),
		.rx_sdr_pri_2(rx_sdr_2),
		.clk_pri_2(user_clk_pri_2),
		.rx_sdr_aux_2(rx_sdr_aux_2),
		.clk_aux_2(user_clk_aux_2),
		.clk_active_2(user_clk_2),
		.rx_ena_2(rx_ena_2),
		.rx_dav_2(rx_dav_2),
		.rx_eop_2(rx_eop_2),
		.rx_sop_2(rx_sop_2),
		.rx_adr_2(rx_adr_2),
		.rx_err_2(rx_err_2),
		.rx_vr_2(rx_vr_2),
		.rx_nr_2(rx_nr_2),
		.rx_ns_2(rx_ns_2),
		.cmd_busy_2(cmd_busy_2),
		.rx_cmd_ua_2(rx_cmd_ua_2),
		.tx_cmd_ua_2(tx_cmd_ua_2),
		.rx_cmd_srej_2(rx_cmd_srej_2),
		.tx_cmd_srej_2(tx_cmd_srej_2),
		.resetb_2(resetb_2),
		.rx_cmd_reset_2(rx_cmd_reset__2),
		.rx_cmd_test_2(rx_cmd_test__2),
		.tx_cmd_reset_2(tx_cmd_reset__2),
		.active_aux_2(active_aux_2),
		.disable_aux_2(disable_aux_2),
		.rx_dat_3(rx_dat_3),
		.rx_sdr_pri_3(rx_sdr_3),
		.clk_pri_3(user_clk_pri_3),
		.rx_sdr_aux_3(rx_sdr_aux_3),
		.clk_aux_3(user_clk_aux_3),
		.clk_active_3(user_clk_3),
		.rx_ena_3(rx_ena_3),
		.rx_dav_3(rx_dav_3),
		.rx_eop_3(rx_eop_3),
		.rx_sop_3(rx_sop_3),
		.rx_adr_3(rx_adr_3),
		.rx_err_3(rx_err_3),
		.rx_vr_3(rx_vr_3),
		.rx_nr_3(rx_nr_3),
		.rx_ns_3(rx_ns_3),
		.cmd_busy_3(cmd_busy_3),
		.rx_cmd_ua_3(rx_cmd_ua_3),
		.tx_cmd_ua_3(tx_cmd_ua_3),
		.rx_cmd_srej_3(rx_cmd_srej_3),
		.tx_cmd_srej_3(tx_cmd_srej_3),
		.resetb_3(resetb_3),
		.rx_cmd_reset_3(rx_cmd_reset__3),
		.rx_cmd_test_3(rx_cmd_test__3),
		.tx_cmd_reset_3(tx_cmd_reset__3),
		.active_aux_3(active_aux_3),
		.disable_aux_3(disable_aux_3)
	);


tx_tri #(.HEADER_FIELD(HEADER_FIELD), .ADDR_WIDTH(ADDR_WIDTH), .THRESHOLD(THRESHOLD)) tx (
		.tx_dat_1(tx_dat_1),
		.tx_sdr_1(tx_sdr_1),
		.clk_1(user_clk_1),
		.tx_ena_1(tx_ena_1),
		.tx_dav_1(tx_dav_1),
		.tx_adr_1(tx_adr_1),
		.tx_ns_1(tx_ns_1),
		.tx_nr_1(rx_vr_1),
		.cmd_busy_1(cmd_busy_1),
		.tx_cmd_sabm_1(tx_cmd_sabm__1),
		.tx_cmd_ua_1(tx_cmd_ua__1),
		.tx_cmd_srej_1(tx_cmd_srej__1),
		.tx_cmd_reset_1(tx_cmd_reset__1),
		.tx_cmd_test_1(tx_cmd_test__1),
		.rx_cmd_reset_1(rx_cmd_reset_1),
		.resetb_1(resetb_1),
		.tx_dat_2(tx_dat_2),
		.tx_sdr_2(tx_sdr_2),
		.clk_2(user_clk_2),
		.tx_ena_2(tx_ena_2),
		.tx_dav_2(tx_dav_2),
		.tx_adr_2(tx_adr_2),
		.tx_ns_2(tx_ns_2),
		.tx_nr_2(rx_vr_2),
		.cmd_busy_2(cmd_busy_2),
		.tx_cmd_sabm_2(tx_cmd_sabm__2),
		.tx_cmd_ua_2(tx_cmd_ua__2),
		.tx_cmd_srej_2(tx_cmd_srej__2),
		.tx_cmd_reset_2(tx_cmd_reset__2),
		.tx_cmd_test_2(tx_cmd_test__2),
		.rx_cmd_reset_2(rx_cmd_reset_2),
		.resetb_2(resetb_2),
		.tx_dat_3(tx_dat_3),
		.tx_sdr_3(tx_sdr_3),
		.clk_3(user_clk_3),
		.tx_ena_3(tx_ena_3),
		.tx_dav_3(tx_dav_3),
		.tx_adr_3(tx_adr_3),
		.tx_ns_3(tx_ns_3),
		.tx_nr_3(rx_vr_3),
		.cmd_busy_3(cmd_busy_3),
		.tx_cmd_sabm_3(tx_cmd_sabm__3),
		.tx_cmd_ua_3(tx_cmd_ua__3),
		.tx_cmd_srej_3(tx_cmd_srej__3),
		.tx_cmd_reset_3(tx_cmd_reset__3),
		.tx_cmd_test_3(tx_cmd_test__3),
		.rx_cmd_reset_3(rx_cmd_reset_3),
		.resetb_3(resetb_3)
	);


assign rx_cmd_reset_1 = MASTER ? 1'b0 : rx_cmd_reset__1 ;
assign rx_cmd_reset_2 = MASTER ? 1'b0 : rx_cmd_reset__2 ;
assign rx_cmd_reset_3 = MASTER ? 1'b0 : rx_cmd_reset__3 ;

assign rx_cmd_test_1 = MASTER ? rx_cmd_test__1 : 1'b0 ;
assign rx_cmd_test_2 = MASTER ? rx_cmd_test__2 : 1'b0 ;
assign rx_cmd_test_3 = MASTER ? rx_cmd_test__3 : 1'b0 ;

assign tx_cmd_reset__1 = MASTER ? tx_cmd_reset_1 : 1'b0 ;
assign tx_cmd_reset__2 = MASTER ? tx_cmd_reset_2 : 1'b0 ;
assign tx_cmd_reset__3 = MASTER ? tx_cmd_reset_3 : 1'b0 ;

assign tx_cmd_test__1 = MASTER ? tx_cmd_test_1 : rx_cmd_test__1 ;
assign tx_cmd_test__2 = MASTER ? tx_cmd_test_2 : rx_cmd_test__2 ;
assign tx_cmd_test__3 = MASTER ? tx_cmd_test_3 : rx_cmd_test__3 ;

assign	tx_cmd_sabm__1 = MASTER ? tx_cmd_sabm_1 : 1'b0;
assign	tx_cmd_sabm__2 = MASTER ? tx_cmd_sabm_2 : 1'b0;
assign	tx_cmd_sabm__3 = MASTER ? tx_cmd_sabm_3 : 1'b0;

assign  tx_cmd_ua__1 = MASTER ? 1'b0 : tx_cmd_ua_1;
assign  tx_cmd_ua__2 = MASTER ? 1'b0 : tx_cmd_ua_2;
assign  tx_cmd_ua__3 = MASTER ? 1'b0 : tx_cmd_ua_3;

assign	tx_cmd_srej__1 = MASTER ? 7'b0 : tx_cmd_srej_1;
assign	tx_cmd_srej__2 = MASTER ? 7'b0 : tx_cmd_srej_2;
assign	tx_cmd_srej__3 = MASTER ? 7'b0 : tx_cmd_srej_3;

assign user_clk_1 = active_aux_1 ? user_clk_aux_1 : user_clk_pri_1;
assign user_clk_2 = active_aux_2 ? user_clk_aux_2 : user_clk_pri_2;
assign user_clk_3 = active_aux_3 ? user_clk_aux_3 : user_clk_pri_3;
endmodule
/////////////////////////////////////////////////////////////////////
// 
//	Split 16 bits into 2 blocks of 8 bits, do Hamming, and viceversa
//	Created by Sandro Bonacini
//	(long time ago)
//

module Hamming16_24 (enc_in, enc_out, dec_in, dec_out);
	input [15:0] enc_in;
	output [23:0] enc_out;
	input [23:0] dec_in;
	output [15:0] dec_out;
	
	wire [23:0] pre_int_enc_out;
	reg [23:0] enc_out, post_int_dec_in;

	wire [2:0] unconnected_dec_out0,unconnected_dec_out1,unconnected_enc_out0,unconnected_enc_out1;

	Hamming #(.CHECK_WIDTH(4)) Hamming1 (
		.enc_in({3'b0,enc_in[7:0]}),
		.enc_out({unconnected_enc_out0,pre_int_enc_out[11:0]}),
		.dec_in({3'b0,post_int_dec_in[11:0]}),
		.dec_out({unconnected_dec_out0, dec_out[7:0]})
	);

	Hamming #(.CHECK_WIDTH(4)) Hamming2 (
		.enc_in({3'b0,enc_in[15:8]}),
		.enc_out({unconnected_enc_out1,pre_int_enc_out[23:12]}),
		.dec_in({3'b0,post_int_dec_in[23:12]}),
		.dec_out({unconnected_dec_out1,dec_out[15:8]})
	);

	
	integer i;
	always @* begin
		for (i=0; i<12; i=i+1) begin
			enc_out[i<<1] = pre_int_enc_out[i];
			enc_out[(i<<1)+1] = pre_int_enc_out[i+12];
			post_int_dec_in[i] = dec_in[i<<1];
			post_int_dec_in[i+12] = dec_in[(i<<1)+1];
		end
	end

endmodule
////////////////////////
// 
//	Hamming encoder decoder
//	Created by Sandro Bonacini
//	(long time ago)
//

module Hamming (enc_in, enc_out, dec_in, dec_out);
	parameter CHECK_WIDTH=3; // this is log2(CODE_WIDTH+1) = log2(n+1) = n-k.
	
	parameter CODE_WIDTH=(1<<CHECK_WIDTH)-1; // n
	parameter DATA_WIDTH=CODE_WIDTH-CHECK_WIDTH; // k
	
	input [DATA_WIDTH:1] enc_in;
	output [CODE_WIDTH:1] enc_out;
	output [DATA_WIDTH:1] dec_out;
	input [CODE_WIDTH:1] dec_in;
	reg [DATA_WIDTH:1] dec_out;
	reg [CODE_WIDTH:1] enc_out;
	reg [CODE_WIDTH:1] syndrome;
	reg [CHECK_WIDTH-1:0] err_pos;
	reg [CODE_WIDTH:1] corrected;
	
	integer i,p,q;
	always @(enc_in) begin
		enc_out = 0;
		for (i=0;i<CHECK_WIDTH;i=i+1) begin
			for (q=1;q<(1<<i);q=q+1) begin
				enc_out[(1<<i)+q] = enc_in[(1<<i)+q-i-1];
				//$display("enc_out[%d] = enc_in[%d];",(1<<i)+q,(1<<i)+q-i-1);
				//$display("enc_out=%b",enc_out);
			end
		end

		for (i=0;i<CHECK_WIDTH;i=i+1) begin
			enc_out[1<<i] = 0;

			for (p=0; p<=((1<<(CHECK_WIDTH-i-1))-1); p=p+1) begin
				for (q=0;q<(1<<i);q=q+1) begin
					enc_out[1<<i] = enc_out[1<<i] ^ enc_out[(p<<(i+1)) + (1<<i) +q];
					//$display("enc_out[%d] += enc_out[%d];",(1<<i),(p<<(i+1)) + (1<<i) +q);
					//$display("enc_out=%b",enc_out);
				end
			end

		end
	end

	always @(dec_in) begin
		err_pos = 0;
		syndrome = dec_in;
		
		for (i=0;i<CHECK_WIDTH;i=i+1) begin
			syndrome[1<<i] = 0;

			for (p=0; p<=((1<<(CHECK_WIDTH-i-1))-1); p=p+1) begin
				for (q=0;q<(1<<i);q=q+1) begin
					syndrome[1<<i] = syndrome[1<<i] ^ syndrome[(p<<(i+1)) + (1<<i) +q];
				end
			end

			//if (syndrome[1<<i] != dec_in[1<<i]) err_pos = err_pos + (1<<i);
			err_pos[i]= syndrome[1<<i] ^ dec_in[1<<i];
		end

		//$display("syndrome: %b, err_pos: %d", syndrome, err_pos);


		corrected = dec_in;
		if (err_pos) corrected[err_pos] = ~corrected[err_pos];
		
		for (i=1;i<CHECK_WIDTH;i=i+1) begin
			for (q=1;q<(1<<i);q=q+1) begin
				dec_out[(1<<i)+q-i-1] = corrected[(1<<i)+q];
			end
		end
		
	end


endmodule

// missing: rx_sd_neg_o <=#1 rx_sd_neg_i;
// missing: tx_dat_reg_o <=#1 tx_dat_reg_i;
// missing: rx_dat_o <=#1 rx_dat_i;
// missing: skip_done_o <=#1 skip_done_i;
// missing: clkdiv_o <=#1 clkdiv_i;
// missing: tx_sd_negneg_o <=#1 tx_sd_negneg_i;
// missing: tx_sd_neg_o <=#1 tx_sd_neg_i;
// missing: tx_sd_pos_o <=#1 tx_sd_pos_i;

`timescale 1ns/1ps
module serdes_iostate (
	 rx_sd, rx_clk, resetb, tx_sd, clk40, tx_dat, rx_dat_i, rx_dat_o, rx_off, tx_off, clkdiv_skip
, tx_sd_pos_i, tx_sd_pos_o, tx_sd_neg_i, tx_sd_neg_o, tx_sd_negneg_i, tx_sd_negneg_o, clkdiv_i, clkdiv_o, skip_done_i, skip_done_o, tx_dat_reg_i, tx_dat_reg_o, rx_sd_neg_i, rx_sd_neg_o);
	parameter DATARATE = 0;

	input rx_sd;


	input rx_sd_neg_i;
	
	input [7:0] tx_dat_reg_i;
	input clkdiv_skip;
	
	input skip_done_i;
	
	input [1:0] clkdiv_i;
	input   tx_sd_negneg_i;
	input tx_sd_neg_i;

	input  tx_sd_pos_i;


	input  rx_clk;



	input   resetb;
	output  tx_sd;
	output rx_sd_neg_o;
	output [7:0] tx_dat_reg_o;
	output [7:0] rx_dat_o;
	output skip_done_o;
	output [1:0] clkdiv_o;
	output   tx_sd_negneg_o;
	output tx_sd_neg_o;
	output  tx_sd_pos_o;
	output  clk40;
	input [7:0] tx_dat;
	input [7:0] rx_dat_i;
	input rx_off;

	input  tx_off;
	reg tx_sd;

	
	reg  clk40;
	reg [7:0] rx_dat_o;
	
	
	reg [1:0] clkdiv_o;
	reg [7:0] des;

	reg [7:0] ser;


	reg [7:0] tx_dat_reg_o;
	reg tx_sd_neg_o;
	reg  tx_sd_pos_o;
	reg   tx_sd_negneg_o;
	reg tx_trig;
	reg ckg_des1;

	reg  ckg_des2;


	reg   ckg_des4;
	reg ckg_ser1;

	reg  ckg_ser2;


	reg   ckg_ser4;
	reg skip_done_o;
	wire [2:0] __CLKDIV__ = 3'b001 << DATARATE;
	
	reg [1:0] des_;
	
	
	
	always @* begin
		des[1:0] = des_[1:0];

		if (~tx_off) //cadence map_to_mux
			ckg_ser1  = rx_clk;
		else ckg_ser1 = 0;

		if ((DATARATE==1) || (DATARATE==2)) /* cadence map_to_mux */ begin
			ckg_des2  = ckg_des1;
			ckg_ser2  = ckg_ser1;
		end
		else begin
			ckg_des2  = 0;
			ckg_ser2  = 0;
		end

		if (DATARATE==2) /* cadence map_to_mux */ begin
			ckg_des4  = ckg_des2;
			ckg_ser4  = ckg_ser2;
		end
		else begin 
			ckg_ser4  = 0;
			ckg_des4  = 0;
		end

		// took off map_to_mux to enhance synthesis performance
		case (DATARATE) 
			2: begin
				tx_trig = clkdiv_o[0] & (~clkdiv_o[1]);
				clk40 = clkdiv_o[1];
			end
			1: begin
				tx_trig = ~clkdiv_o[0];
				clk40 = clkdiv_o[0];

			end
			default: begin
				tx_trig = 1;
				clk40 = ~rx_clk;
			end
		endcase 
		
		if (ckg_ser1) // cadence map_to_mux
			tx_sd = tx_sd_negneg_i;
		else tx_sd = tx_sd_pos_o; 
		
	end

	
	always @(posedge ckg_ser1) begin
		// MSB out first << for serializer
		tx_sd_pos_o <=#0.1 ser[__CLKDIV__*2-1];
		ser[1:0] <=#0.1 tx_dat_reg_i[1:0];
	end


	always @(negedge ckg_ser1) begin
		tx_sd_neg_o <=#0.1 ser[__CLKDIV__*2-2];
		tx_sd_negneg_o <=#0.1 tx_sd_neg_i;
	end


	always @(posedge ckg_des2) begin
		des[2]<=#0.1 des[0];
		des[3]<=#0.1 des[1];
	end

	always @(posedge ckg_ser2) begin
		if (tx_trig) ser[3:2] <=#0.1 tx_dat_reg_i[3:2];
		else begin
			ser[3] <=#0.1 ser[1];
			ser[2] <=#0.1 ser[0];
		end
	end


	always @(posedge ckg_des4) begin
		des[4]<=#0.1 des[2];
		des[5]<=#0.1 des[3];
		des[6]<=#0.1 des[4];
		des[7]<=#0.1 des[5];
	end

	always @(posedge ckg_ser4) begin
		if (tx_trig) ser[7:4] <=#0.1 tx_dat_reg_i[7:4];
		else begin
			ser[7] <=#0.1 ser[5];
			ser[6] <=#0.1 ser[4];
			ser[5] <=#0.1 ser[3];
			ser[4] <=#0.1 ser[2];
		end
	end

	
	
	always @(negedge rx_clk or negedge resetb) begin
		if (~resetb) begin
			clkdiv_o <=#0.1 0;
		end
		else begin
			clkdiv_o <=#0.1 clkdiv_i;
			skip_done_o <=#0.1 skip_done_i;
			if ((!clkdiv_skip) || (skip_done_i)) begin
				clkdiv_o <=#0.1 clkdiv_i + 1;
			end
			
			skip_done_o <=#0.1 clkdiv_skip;
		end
	end


	always @(posedge clk40) begin
		rx_dat_o <=#0.1 des;
		tx_dat_reg_o <=#0.1 tx_dat;
	end
	
// DDRDES
	reg rx_sd_neg_o;
	always @* begin
		if (~rx_off) //cadence map_to_mux
			ckg_des1  = rx_clk;
		else  ckg_des1 = 0;
	end

	always @(negedge ckg_des1) begin
 		rx_sd_neg_o<=#0.1 rx_sd;
	end

	always @(posedge ckg_des1) begin
		// LSB in first << for deserializer
		des_[1] <=#0.1 rx_sd_neg_i;
		des_[0] <=#0.1 rx_sd;
	end


endmodule


`timescale 1ns/1ps
module serdes_tri (
	 rx_sd_1, rx_sd_2, rx_sd_3, rx_clk_1, rx_clk_2, rx_clk_3, resetb_1, resetb_2, resetb_3, tx_sd_1, tx_sd_2, tx_sd_3, clk40_1, clk40_2, clk40_3, tx_dat_1, tx_dat_2, tx_dat_3, rx_dat_1, rx_dat_2, rx_dat_3, rx_off_1, rx_off_2, rx_off_3, tx_off_1, tx_off_2, tx_off_3, clkdiv_skip_1, clkdiv_skip_2, clkdiv_skip_3
);

	parameter DATARATE = 0;

	input rx_sd_1, rx_sd_2, rx_sd_3;

	input  rx_clk_1, rx_clk_2, rx_clk_3;

	input   resetb_1, resetb_2, resetb_3;
	output  tx_sd_1, tx_sd_2, tx_sd_3;
	output  clk40_1, clk40_2, clk40_3;
	input [7:0] tx_dat_1, tx_dat_2, tx_dat_3;
	output [7:0] rx_dat_1, rx_dat_2, rx_dat_3;
	input rx_off_1, rx_off_2, rx_off_3;

	input  tx_off_1, tx_off_2, tx_off_3;
	input clkdiv_skip_1, clkdiv_skip_2, clkdiv_skip_3;

	wire tx_sd_pos_1, tx_sd_pos_2, tx_sd_pos_3;
	wire tx_sd_neg_1, tx_sd_neg_2, tx_sd_neg_3;
	wire tx_sd_negneg_1, tx_sd_negneg_2, tx_sd_negneg_3;
	wire [1:0] clkdiv_1, clkdiv_2, clkdiv_3;
	wire skip_done_1, skip_done_2, skip_done_3;
	wire [7:0] rx_dat_1, rx_dat_2, rx_dat_3;
	wire [7:0] tx_dat_reg_1, tx_dat_reg_2, tx_dat_reg_3;
	wire rx_sd_neg_1, rx_sd_neg_2, rx_sd_neg_3;
	wire tx_sd_pos;
	wire tx_sd_neg;
	wire tx_sd_negneg;
	wire [1:0] clkdiv;
	wire skip_done;
	wire [7:0] rx_dat;
	wire [7:0] tx_dat_reg;
	wire rx_sd_neg;

	serdes_iostate #(.DATARATE(DATARATE) ) serdes_iostate_1 (
	 .rx_sd(rx_sd_1), .rx_clk(rx_clk_1), .resetb(resetb_1), .tx_sd(tx_sd_1), .clk40(clk40_1), .tx_dat(tx_dat_1), .rx_dat_i(rx_dat), .rx_dat_o(rx_dat_1), .rx_off(rx_off_1), .tx_off(tx_off_1), .clkdiv_skip(clkdiv_skip_1), .tx_sd_pos_i(tx_sd_pos), .tx_sd_pos_o(tx_sd_pos_1), .tx_sd_neg_i(tx_sd_neg), .tx_sd_neg_o(tx_sd_neg_1), .tx_sd_negneg_i(tx_sd_negneg), .tx_sd_negneg_o(tx_sd_negneg_1), .clkdiv_i(clkdiv), .clkdiv_o(clkdiv_1), .skip_done_i(skip_done), .skip_done_o(skip_done_1), .tx_dat_reg_i(tx_dat_reg), .tx_dat_reg_o(tx_dat_reg_1), .rx_sd_neg_i(rx_sd_neg), .rx_sd_neg_o(rx_sd_neg_1));

	serdes_iostate #(.DATARATE(DATARATE) ) serdes_iostate_2 (
	 .rx_sd(rx_sd_2), .rx_clk(rx_clk_2), .resetb(resetb_2), .tx_sd(tx_sd_2), .clk40(clk40_2), .tx_dat(tx_dat_2), .rx_dat_i(rx_dat_1), .rx_dat_o(rx_dat_2), .rx_off(rx_off_2), .tx_off(tx_off_2), .clkdiv_skip(clkdiv_skip_2), .tx_sd_pos_i(tx_sd_pos_1), .tx_sd_pos_o(tx_sd_pos_2), .tx_sd_neg_i(tx_sd_neg_1), .tx_sd_neg_o(tx_sd_neg_2), .tx_sd_negneg_i(tx_sd_negneg_1), .tx_sd_negneg_o(tx_sd_negneg_2), .clkdiv_i(clkdiv_1), .clkdiv_o(clkdiv_2), .skip_done_i(skip_done_1), .skip_done_o(skip_done_2), .tx_dat_reg_i(tx_dat_reg_1), .tx_dat_reg_o(tx_dat_reg_2), .rx_sd_neg_i(rx_sd_neg_1), .rx_sd_neg_o(rx_sd_neg_2));

	serdes_iostate #(.DATARATE(DATARATE) ) serdes_iostate_3 (
	 .rx_sd(rx_sd_3), .rx_clk(rx_clk_3), .resetb(resetb_3), .tx_sd(tx_sd_3), .clk40(clk40_3), .tx_dat(tx_dat_3), .rx_dat_i(rx_dat_2), .rx_dat_o(rx_dat_3), .rx_off(rx_off_3), .tx_off(tx_off_3), .clkdiv_skip(clkdiv_skip_3), .tx_sd_pos_i(tx_sd_pos_2), .tx_sd_pos_o(tx_sd_pos_3), .tx_sd_neg_i(tx_sd_neg_2), .tx_sd_neg_o(tx_sd_neg_3), .tx_sd_negneg_i(tx_sd_negneg_2), .tx_sd_negneg_o(tx_sd_negneg_3), .clkdiv_i(clkdiv_2), .clkdiv_o(clkdiv_3), .skip_done_i(skip_done_2), .skip_done_o(skip_done_3), .tx_dat_reg_i(tx_dat_reg_2), .tx_dat_reg_o(tx_dat_reg_3), .rx_sd_neg_i(rx_sd_neg_2), .rx_sd_neg_o(rx_sd_neg_3));

	majority_voter #(.WIDTH(23),.QUIET(1)) mv (
		.in1({tx_sd_pos_1, tx_sd_neg_1, tx_sd_negneg_1, clkdiv_1, skip_done_1, rx_dat_1, tx_dat_reg_1, rx_sd_neg_1}),
		.in2({tx_sd_pos_2, tx_sd_neg_2, tx_sd_negneg_2, clkdiv_2, skip_done_2, rx_dat_2, tx_dat_reg_2, rx_sd_neg_2}),
		.in3({tx_sd_pos_3, tx_sd_neg_3, tx_sd_negneg_3, clkdiv_3, skip_done_3, rx_dat_3, tx_dat_reg_3, rx_sd_neg_3}),
		.out({tx_sd_pos, tx_sd_neg, tx_sd_negneg, clkdiv, skip_done, rx_dat, tx_dat_reg, rx_sd_neg}),
		.err()
	);
endmodule


module pri_aux_control_iostate (
	resetb_pri, resetb_aux, disconnect_pri, 
		  disconnect_aux, activate_commands_pri, activate_commands_aux,
		 clk_pri, clk_aux, 
	active_aux_i, active_aux_o, active_pri_i, active_pri_o, disable_aux
);


	input resetb_pri;



	input disconnect_pri;

	input  disconnect_aux;
	
	input  resetb_aux;




	input     disable_aux;
	input	 clk_pri;

	input	  clk_aux;
	input activate_commands_pri;

	input  activate_commands_aux;
	output active_aux_o;
	output  active_pri_o ;
	input active_aux_i;

	input  active_pri_i ;
	reg active_aux_o;

	
	reg  active_pri_o;

	wire disconnectb_resetb_pri = resetb_pri & (~disconnect_pri) | disable_aux;


	always @(posedge clk_pri or negedge disconnectb_resetb_pri) begin
		if (~disconnectb_resetb_pri) active_pri_o <=#1 0;
		else begin
			active_pri_o <=#1 active_pri_i;
			if (activate_commands_pri) active_pri_o <=#1 1;
		end			
	end


	wire disconnectb_resetb_aux = resetb_aux & (~disconnect_aux) & (~disable_aux);

	always @(posedge clk_aux or negedge disconnectb_resetb_aux) begin
		if (~disconnectb_resetb_aux) active_aux_o <=#1 0;
		else begin
			active_aux_o <=#1 active_aux_i;
			if (activate_commands_aux) active_aux_o <=#1 1;
		end			
	end

endmodule

// Triplicate with:
// python tri.py < pri_aux_control.v > pri_aux_control_tri.v


module pri_aux_control_tri (
	resetb_pri_1, resetb_pri_2, resetb_pri_3, resetb_aux_1, resetb_aux_2, resetb_aux_3, disconnect_pri_1, disconnect_pri_2, disconnect_pri_3, 
		  disconnect_aux_1, disconnect_aux_2, disconnect_aux_3, activate_commands_pri_1, activate_commands_pri_2, activate_commands_pri_3, activate_commands_aux_1, activate_commands_aux_2, activate_commands_aux_3,
		 clk_pri_1, clk_pri_2, clk_pri_3, clk_aux_1, clk_aux_2, clk_aux_3, 
	active_aux_1, active_aux_2, active_aux_3, active_pri_1, active_pri_2, active_pri_3, disable_aux_1, disable_aux_2, disable_aux_3
);

	input resetb_pri_1, resetb_pri_2, resetb_pri_3;

	input  resetb_aux_1, resetb_aux_2, resetb_aux_3;

	input     disable_aux_1, disable_aux_2, disable_aux_3;
	input	 clk_pri_1, clk_pri_2, clk_pri_3;

	input	  clk_aux_1, clk_aux_2, clk_aux_3;
	input activate_commands_pri_1, activate_commands_pri_2, activate_commands_pri_3;

	input  activate_commands_aux_1, activate_commands_aux_2, activate_commands_aux_3;
	output active_aux_1, active_aux_2, active_aux_3;

	output  active_pri_1, active_pri_2, active_pri_3 ;
	input disconnect_pri_1, disconnect_pri_2, disconnect_pri_3;

	input  disconnect_aux_1, disconnect_aux_2, disconnect_aux_3;

	wire active_pri_1, active_pri_2, active_pri_3;
	wire active_aux_1, active_aux_2, active_aux_3;
	wire active_pri;
	wire active_aux;

	pri_aux_control_iostate pri_aux_control_iostate_1   (
	.resetb_pri(resetb_pri_1), .resetb_aux(resetb_aux_1), .disconnect_pri(disconnect_pri_1), 
		  .disconnect_aux(disconnect_aux_1), .activate_commands_pri(activate_commands_pri_1), .activate_commands_aux(activate_commands_aux_1),
		 .clk_pri(clk_pri_1), .clk_aux(clk_aux_1), 
	.active_aux_i(active_aux_1), .active_aux_o(active_aux_2), .active_pri_i(active_pri_1), .active_pri_o(active_pri_2), .disable_aux(disable_aux_1));

	pri_aux_control_iostate pri_aux_control_iostate_2   (
	.resetb_pri(resetb_pri_2), .resetb_aux(resetb_aux_2), .disconnect_pri(disconnect_pri_2), 
		  .disconnect_aux(disconnect_aux_2), .activate_commands_pri(activate_commands_pri_2), .activate_commands_aux(activate_commands_aux_2),
		 .clk_pri(clk_pri_2), .clk_aux(clk_aux_2), 
	.active_aux_i(active_aux_2), .active_aux_o(active_aux_3), .active_pri_i(active_pri_2), .active_pri_o(active_pri_3), .disable_aux(disable_aux_2));

	pri_aux_control_iostate pri_aux_control_iostate_3   (
	.resetb_pri(resetb_pri_3), .resetb_aux(resetb_aux_3), .disconnect_pri(disconnect_pri_3), 
		  .disconnect_aux(disconnect_aux_3), .activate_commands_pri(activate_commands_pri_3), .activate_commands_aux(activate_commands_aux_3),
		 .clk_pri(clk_pri_3), .clk_aux(clk_aux_3), 
	.active_aux_i(active_aux_3), .active_aux_o(active_aux), .active_pri_i(active_pri_3), .active_pri_o(active_pri), .disable_aux(disable_aux_3));

	majority_voter #(.WIDTH(2)) mv (
		.in1({active_pri_2, active_aux_2}),
		.in2({active_pri_3, active_aux_3}),
		.in3({active_pri, active_aux}),
		.out({active_pri_1, active_aux_1}),
		.err()
	);
endmodule

// Triplicate with:
// python tri.py < pri_aux_control.v > pri_aux_control_tri.v


module regbank #(
	parameter WIDTH=8
) (
	input [WIDTH-1:0] D,
	input RN,
	output reg [WIDTH-1:0] Q,
	input clk
);

	always @(posedge clk or negedge RN) begin
		if (~RN) Q<=#1 0;
		else Q<=#1 D;
	end

endmodule
/*
module regbank #(
	parameter WIDTH=8
) (
	input [WIDTH-1:0] D,
	output reg [WIDTH-1:0] Q,
	input clk
);

	always @(posedge clk) Q<=#1 D;


endmodule
*/
module majority_voter_placeholder_tri (in_1, in_2, in_3, out_1, out_2, out_3,
									err_1, err_2, err_3);
    
    parameter WIDTH = 1;
	parameter QUIET = 0;
	parameter HALT = 0;
    
	input   [(WIDTH-1):0]   in_1, in_2, in_3;
    
    output  [(WIDTH-1):0]   out_1, out_2, out_3;
    output  err_1, err_2, err_3;
 
	majority_voter #(.WIDTH(WIDTH),.QUIET(QUIET),.HALT(HALT)) mv1 (
		.in1(in_1),
		.in2(in_2),
		.in3(in_3),
		.out(out_1),
		.err(err_1)
	);

	majority_voter #(.WIDTH(WIDTH),.QUIET(QUIET),.HALT(HALT)) mv2 (
		.in1(in_2),
		.in2(in_3),
		.in3(in_1),
		.out(out_2),
		.err(err_2)
	);

	majority_voter #(.WIDTH(WIDTH),.QUIET(QUIET),.HALT(HALT)) mv3 (
		.in1(in_3),
		.in2(in_1),
		.in3(in_2),
		.out(out_3),
		.err(err_3)
	);


endmodule
module monostable (	input A, output Z );


	DELAY6_C delay_reset (.Z(reset_del1),.A(Z)
		`ifdef RC
		`else
			, .VDD(), .GND(), .NW(), .SX()
		`endif
	);
	DELAY6_C delay_reset1 (.Z(reset_del2),.A(reset_del1)
		`ifdef RC
		`else
			, .VDD(), .GND(), .NW(), .SX()
		`endif
	);
	DELAY6_C delay_reset2 (.Z(reset_del3),.A(reset_del2)
		`ifdef RC
		`else
			, .VDD(), .GND(), .NW(), .SX()
		`endif
	);
	DELAY6_C delay_reset3 (.Z(reset_del4),.A(reset_del3)
		`ifdef RC
		`else
			, .VDD(), .GND(), .NW(), .SX()
		`endif
	);
	DELAY6_C delay_reset4 (.Z(reset_del5),.A(reset_del4)
		`ifdef RC
		`else
			, .VDD(), .GND(), .NW(), .SX()
		`endif
	);
	DELAY6_C delay_reset5 (.Z(reset_del),.A(reset_del5)
		`ifdef RC
		`else
			, .VDD(), .GND(), .NW(), .SX()
		`endif
	);
	
	assign reset_delb = ~reset_del;
	
	regbank #(1) regbank (.D(1'b1), .Q(Z), .clk(A), .RN(reset_delb));
	
endmodule





// ==============================================================
// RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and OpenCL
// Version: 2019.2.1
// Copyright (C) 1986-2019 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

(* CORE_GENERATION_INFO="load_LE_refPos,hls_ip_2019_2_1,{HLS_INPUT_TYPE=cxx,HLS_INPUT_FLOAT=0,HLS_INPUT_FIXED=1,HLS_INPUT_PART=xcku15p-ffva1760-2-e,HLS_INPUT_CLOCK=3.125000,HLS_INPUT_ARCH=pipeline,HLS_SYN_CLOCK=2.024000,HLS_SYN_LAT=2,HLS_SYN_TPT=1,HLS_SYN_MEM=1,HLS_SYN_DSP=0,HLS_SYN_FF=37,HLS_SYN_LUT=41,HLS_VERSION=2019_2_1}" *)

module load_LE_refPos (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        mdtid_V,
        slcvec_pos_ref_V,
        hewindow_pos_ref_V
);

parameter    ap_ST_fsm_pp0_stage0 = 1'd1;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
input  [8:0] mdtid_V;
output  [17:0] slcvec_pos_ref_V;
output  [17:0] hewindow_pos_ref_V;

reg ap_done;
reg ap_idle;
reg ap_ready;

(* fsm_encoding = "none" *) reg   [0:0] ap_CS_fsm;
wire    ap_CS_fsm_pp0_stage0;
wire    ap_enable_reg_pp0_iter0;
reg    ap_enable_reg_pp0_iter1;
reg    ap_enable_reg_pp0_iter2;
reg    ap_idle_pp0;
reg    ap_block_state1_pp0_stage0_iter0;
wire    ap_block_state2_pp0_stage0_iter1;
reg    slcvec_pos_ref_V_1_ack_in;
reg    hewindow_pos_ref_V_1_ack_in;
reg    ap_block_state3_pp0_stage0_iter2;
reg    ap_block_pp0_stage0_11001;
reg   [17:0] slcvec_pos_ref_V_1_data_reg;
reg    slcvec_pos_ref_V_1_vld_reg;
reg    slcvec_pos_ref_V_1_vld_in;
reg   [17:0] hewindow_pos_ref_V_1_data_reg;
reg    hewindow_pos_ref_V_1_vld_reg;
reg    hewindow_pos_ref_V_1_vld_in;
wire   [9:0] lut_mdt_ref_pos_V_address0;
reg    lut_mdt_ref_pos_V_ce0;
wire   [16:0] lut_mdt_ref_pos_V_q0;
wire   [9:0] lut_mdt_ref_pos_V_address1;
reg    lut_mdt_ref_pos_V_ce1;
wire   [16:0] lut_mdt_ref_pos_V_q1;
wire   [17:0] zext_ln356_fu_129_p1;
wire   [17:0] zext_ln356_1_fu_134_p1;
reg    ap_block_pp0_stage0_subdone;
wire  signed [63:0] sext_ln559_fu_101_p1;
wire    ap_block_pp0_stage0;
wire  signed [63:0] sext_ln559_1_fu_124_p1;
reg    ap_block_pp0_stage0_01001;
wire   [9:0] zext_ln703_fu_91_p1;
wire   [9:0] ret_V_fu_95_p2;
wire   [9:0] ret_V_4_fu_106_p3;
wire   [10:0] zext_ln703_1_fu_114_p1;
wire   [10:0] ret_V_3_fu_118_p2;
reg   [0:0] ap_NS_fsm;
reg    ap_idle_pp0_0to1;
reg    ap_reset_idle_pp0;
wire    ap_enable_pp0;

// power-on initialization
initial begin
#0 ap_CS_fsm = 1'd1;
#0 ap_enable_reg_pp0_iter1 = 1'b0;
#0 ap_enable_reg_pp0_iter2 = 1'b0;
#0 slcvec_pos_ref_V_1_data_reg = 18'd0;
#0 slcvec_pos_ref_V_1_vld_reg = 1'b0;
#0 hewindow_pos_ref_V_1_data_reg = 18'd0;
#0 hewindow_pos_ref_V_1_vld_reg = 1'b0;
end

load_LE_refPos_lubkb #(
    .DataWidth( 17 ),
    .AddressRange( 1024 ),
    .AddressWidth( 10 ))
lut_mdt_ref_pos_V_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .address0(lut_mdt_ref_pos_V_address0),
    .ce0(lut_mdt_ref_pos_V_ce0),
    .q0(lut_mdt_ref_pos_V_q0),
    .address1(lut_mdt_ref_pos_V_address1),
    .ce1(lut_mdt_ref_pos_V_ce1),
    .q1(lut_mdt_ref_pos_V_q1)
);

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_CS_fsm <= ap_ST_fsm_pp0_stage0;
    end else begin
        ap_CS_fsm <= ap_NS_fsm;
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter1 <= 1'b0;
    end else begin
        if (((1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_subdone))) begin
            ap_enable_reg_pp0_iter1 <= ap_start;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter2 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter2 <= ap_enable_reg_pp0_iter1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((~((ap_start == 1'b0) & (ap_idle_pp0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0)) & (hewindow_pos_ref_V_1_vld_reg == 1'b0) & (hewindow_pos_ref_V_1_vld_in == 1'b1)) | (~((ap_start == 1'b0) & (ap_idle_pp0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0)) & (1'b1 == 1'b1) & (hewindow_pos_ref_V_1_vld_in == 1'b1) & (hewindow_pos_ref_V_1_vld_reg == 1'b1)))) begin
        hewindow_pos_ref_V_1_data_reg[16 : 0] <= zext_ln356_1_fu_134_p1[16 : 0];
    end
end

always @ (posedge ap_clk) begin
    if (((~((ap_start == 1'b0) & (ap_idle_pp0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0)) & (slcvec_pos_ref_V_1_vld_reg == 1'b0) & (slcvec_pos_ref_V_1_vld_in == 1'b1)) | (~((ap_start == 1'b0) & (ap_idle_pp0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0)) & (1'b1 == 1'b1) & (slcvec_pos_ref_V_1_vld_in == 1'b1) & (slcvec_pos_ref_V_1_vld_reg == 1'b1)))) begin
        slcvec_pos_ref_V_1_data_reg[16 : 0] <= zext_ln356_fu_129_p1[16 : 0];
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter2 == 1'b1))) begin
        ap_done = 1'b1;
    end else begin
        ap_done = 1'b0;
    end
end

always @ (*) begin
    if (((ap_start == 1'b0) & (ap_idle_pp0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_idle = 1'b1;
    end else begin
        ap_idle = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter2 == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b0) & (ap_enable_reg_pp0_iter0 == 1'b0))) begin
        ap_idle_pp0 = 1'b1;
    end else begin
        ap_idle_pp0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter1 == 1'b0) & (ap_enable_reg_pp0_iter0 == 1'b0))) begin
        ap_idle_pp0_0to1 = 1'b1;
    end else begin
        ap_idle_pp0_0to1 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_ready = 1'b1;
    end else begin
        ap_ready = 1'b0;
    end
end

always @ (*) begin
    if (((ap_start == 1'b0) & (ap_idle_pp0_0to1 == 1'b1))) begin
        ap_reset_idle_pp0 = 1'b1;
    end else begin
        ap_reset_idle_pp0 = 1'b0;
    end
end

always @ (*) begin
    if (((hewindow_pos_ref_V_1_vld_reg == 1'b0) | ((1'b1 == 1'b1) & (hewindow_pos_ref_V_1_vld_reg == 1'b1)))) begin
        hewindow_pos_ref_V_1_ack_in = 1'b1;
    end else begin
        hewindow_pos_ref_V_1_ack_in = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        hewindow_pos_ref_V_1_vld_in = 1'b1;
    end else begin
        hewindow_pos_ref_V_1_vld_in = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        lut_mdt_ref_pos_V_ce0 = 1'b1;
    end else begin
        lut_mdt_ref_pos_V_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        lut_mdt_ref_pos_V_ce1 = 1'b1;
    end else begin
        lut_mdt_ref_pos_V_ce1 = 1'b0;
    end
end

always @ (*) begin
    if (((slcvec_pos_ref_V_1_vld_reg == 1'b0) | ((1'b1 == 1'b1) & (slcvec_pos_ref_V_1_vld_reg == 1'b1)))) begin
        slcvec_pos_ref_V_1_ack_in = 1'b1;
    end else begin
        slcvec_pos_ref_V_1_ack_in = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        slcvec_pos_ref_V_1_vld_in = 1'b1;
    end else begin
        slcvec_pos_ref_V_1_vld_in = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_pp0_stage0 : begin
            ap_NS_fsm = ap_ST_fsm_pp0_stage0;
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign ap_CS_fsm_pp0_stage0 = ap_CS_fsm[32'd0];

assign ap_block_pp0_stage0 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_pp0_stage0_01001 = (((ap_start == 1'b0) & (ap_start == 1'b1)) | ((ap_enable_reg_pp0_iter2 == 1'b1) & ((hewindow_pos_ref_V_1_ack_in == 1'b0) | (slcvec_pos_ref_V_1_ack_in == 1'b0))));
end

always @ (*) begin
    ap_block_pp0_stage0_11001 = (((ap_start == 1'b0) & (ap_start == 1'b1)) | ((ap_enable_reg_pp0_iter2 == 1'b1) & ((hewindow_pos_ref_V_1_ack_in == 1'b0) | (slcvec_pos_ref_V_1_ack_in == 1'b0))));
end

always @ (*) begin
    ap_block_pp0_stage0_subdone = (((ap_start == 1'b0) & (ap_start == 1'b1)) | ((ap_enable_reg_pp0_iter2 == 1'b1) & ((hewindow_pos_ref_V_1_ack_in == 1'b0) | (slcvec_pos_ref_V_1_ack_in == 1'b0))));
end

always @ (*) begin
    ap_block_state1_pp0_stage0_iter0 = (ap_start == 1'b0);
end

assign ap_block_state2_pp0_stage0_iter1 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_state3_pp0_stage0_iter2 = ((hewindow_pos_ref_V_1_ack_in == 1'b0) | (slcvec_pos_ref_V_1_ack_in == 1'b0));
end

assign ap_enable_pp0 = (ap_idle_pp0 ^ 1'b1);

assign ap_enable_reg_pp0_iter0 = ap_start;

assign hewindow_pos_ref_V = hewindow_pos_ref_V_1_data_reg;

assign lut_mdt_ref_pos_V_address0 = sext_ln559_fu_101_p1;

assign lut_mdt_ref_pos_V_address1 = sext_ln559_1_fu_124_p1;

assign ret_V_3_fu_118_p2 = ($signed(zext_ln703_1_fu_114_p1) + $signed(11'd2047));

assign ret_V_4_fu_106_p3 = {{1'd1}, {mdtid_V}};

assign ret_V_fu_95_p2 = ($signed(zext_ln703_fu_91_p1) + $signed(10'd1023));

assign sext_ln559_1_fu_124_p1 = $signed(ret_V_3_fu_118_p2);

assign sext_ln559_fu_101_p1 = $signed(ret_V_fu_95_p2);

assign slcvec_pos_ref_V = slcvec_pos_ref_V_1_data_reg;

assign zext_ln356_1_fu_134_p1 = lut_mdt_ref_pos_V_q1;

assign zext_ln356_fu_129_p1 = lut_mdt_ref_pos_V_q0;

assign zext_ln703_1_fu_114_p1 = ret_V_4_fu_106_p3;

assign zext_ln703_fu_91_p1 = mdtid_V;

always @ (posedge ap_clk) begin
    slcvec_pos_ref_V_1_data_reg[17] <= 1'b0;
    hewindow_pos_ref_V_1_data_reg[17] <= 1'b0;
end

endmodule //load_LE_refPos

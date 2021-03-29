// ==============================================================
// RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and OpenCL
// Version: 2019.2.1
// Copyright (C) 1986-2019 Xilinx, Inc. All Rights Reserved.
//
// ===========================================================

`timescale 1 ns / 1 ps

(* CORE_GENERATION_INFO="calc_LE_r_offset_barrel,hls_ip_2019_2_1,{HLS_INPUT_TYPE=cxx,HLS_INPUT_FLOAT=0,HLS_INPUT_FIXED=1,HLS_INPUT_PART=xcku15p-ffva1760-2-e,HLS_INPUT_CLOCK=3.125000,HLS_INPUT_ARCH=pipeline,HLS_SYN_CLOCK=2.533000,HLS_SYN_LAT=5,HLS_SYN_TPT=1,HLS_SYN_MEM=0,HLS_SYN_DSP=2,HLS_SYN_FF=282,HLS_SYN_LUT=85,HLS_VERSION=2019_2_1}" *)

module calc_LE_r_offset_barrel (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        hw_sin_val_V,
        hw_cos_val_V,
        roi_seed_r_V,
        hewindow_pos_ref_V,
        hewindow_pos_V,
        slcvec_pos_V,
        slcvec_pos_ref_V
);

parameter    ap_ST_fsm_pp0_stage0 = 1'd1;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
input  [17:0] hw_sin_val_V;
input  [17:0] hw_cos_val_V;
output  [21:0] roi_seed_r_V;
input  [17:0] hewindow_pos_ref_V;
input  [13:0] hewindow_pos_V;
input  [13:0] slcvec_pos_V;
input  [17:0] slcvec_pos_ref_V;

reg ap_done;
reg ap_idle;
reg ap_ready;

(* fsm_encoding = "none" *) reg   [0:0] ap_CS_fsm;
wire    ap_CS_fsm_pp0_stage0;
wire    ap_enable_reg_pp0_iter0;
reg    ap_enable_reg_pp0_iter1;
reg    ap_enable_reg_pp0_iter2;
reg    ap_enable_reg_pp0_iter3;
reg    ap_enable_reg_pp0_iter4;
reg    ap_enable_reg_pp0_iter5;
reg    ap_idle_pp0;
reg    ap_block_state1_pp0_stage0_iter0;
wire    ap_block_state2_pp0_stage0_iter1;
wire    ap_block_state3_pp0_stage0_iter2;
wire    ap_block_state4_pp0_stage0_iter3;
wire    ap_block_state5_pp0_stage0_iter4;
reg    roi_seed_r_V_1_ack_in;
reg    ap_block_state6_pp0_stage0_iter5;
reg    ap_block_pp0_stage0_11001;
reg   [17:0] hw_sin_val_V_0_data_reg;
reg    hw_sin_val_V_0_vld_reg;
reg    hw_sin_val_V_0_ack_out;
reg   [17:0] hw_cos_val_V_0_data_reg;
reg    hw_cos_val_V_0_vld_reg;
reg    hw_cos_val_V_0_ack_out;
reg   [21:0] roi_seed_r_V_1_data_reg;
reg    roi_seed_r_V_1_vld_reg;
reg    roi_seed_r_V_1_vld_in;
reg   [17:0] hewindow_pos_ref_V_0_data_reg;
reg    hewindow_pos_ref_V_0_vld_reg;
reg    hewindow_pos_ref_V_0_ack_out;
reg   [13:0] hewindow_pos_V_0_data_reg;
reg    hewindow_pos_V_0_vld_reg;
reg    hewindow_pos_V_0_ack_out;
reg   [13:0] slcvec_pos_V_0_data_reg;
reg    slcvec_pos_V_0_vld_reg;
reg    slcvec_pos_V_0_ack_out;
reg   [17:0] slcvec_pos_ref_V_0_data_reg;
reg    slcvec_pos_ref_V_0_vld_reg;
reg    slcvec_pos_ref_V_0_ack_out;
reg   [17:0] hw_cos_val_V_read_reg_208;
reg  signed [17:0] hw_cos_val_V_read_reg_208_pp0_iter2_reg;
reg  signed [17:0] hw_sin_val_V_read_reg_213;
wire   [12:0] sub_ln731_fu_123_p2;
reg   [12:0] sub_ln731_reg_218;
reg   [12:0] sub_ln731_reg_218_pp0_iter2_reg;
wire   [12:0] sub_ln731_1_fu_137_p2;
reg   [12:0] sub_ln731_1_reg_223;
wire  signed [32:0] r_V_4_fu_194_p2;
reg  signed [32:0] r_V_4_reg_228;
wire  signed [33:0] grp_fu_200_p3;
reg  signed [33:0] ret_V_reg_233;
wire  signed [21:0] sext_ln708_fu_189_p1;
reg    ap_block_pp0_stage0_subdone;
reg    ap_block_pp0_stage0_01001;
wire    ap_block_pp0_stage0;
wire   [9:0] trunc_ln731_fu_99_p1;
wire   [9:0] trunc_ln731_1_fu_111_p1;
wire   [12:0] shl_ln_fu_103_p3;
wire   [12:0] shl_ln731_1_fu_115_p3;
wire   [12:0] trunc_ln731_2_fu_129_p1;
wire   [12:0] trunc_ln731_3_fu_133_p1;
wire  signed [14:0] slcvec_pos_local_Rho_fu_143_p3;
wire  signed [14:0] slcvec_pos_local_Z_V_fu_157_p3;
(* use_dsp48 = "no" *) wire   [33:0] ret_V_1_fu_174_p2;
wire   [17:0] trunc_ln1_fu_179_p4;
reg   [0:0] ap_NS_fsm;
reg    ap_idle_pp0_0to4;
reg    ap_reset_idle_pp0;
wire    ap_enable_pp0;

// power-on initialization
initial begin
#0 ap_CS_fsm = 1'd1;
#0 ap_enable_reg_pp0_iter1 = 1'b0;
#0 ap_enable_reg_pp0_iter2 = 1'b0;
#0 ap_enable_reg_pp0_iter3 = 1'b0;
#0 ap_enable_reg_pp0_iter4 = 1'b0;
#0 ap_enable_reg_pp0_iter5 = 1'b0;
#0 hw_sin_val_V_0_data_reg = 18'd0;
#0 hw_sin_val_V_0_vld_reg = 1'b0;
#0 hw_cos_val_V_0_data_reg = 18'd0;
#0 hw_cos_val_V_0_vld_reg = 1'b0;
#0 roi_seed_r_V_1_data_reg = 22'd0;
#0 roi_seed_r_V_1_vld_reg = 1'b0;
#0 hewindow_pos_ref_V_0_data_reg = 18'd0;
#0 hewindow_pos_ref_V_0_vld_reg = 1'b0;
#0 hewindow_pos_V_0_data_reg = 14'd0;
#0 hewindow_pos_V_0_vld_reg = 1'b0;
#0 slcvec_pos_V_0_data_reg = 14'd0;
#0 slcvec_pos_V_0_vld_reg = 1'b0;
#0 slcvec_pos_ref_V_0_data_reg = 18'd0;
#0 slcvec_pos_ref_V_0_vld_reg = 1'b0;
end

calc_LE_r_offset_bkb #(
    .ID( 1 ),
    .NUM_STAGE( 1 ),
    .din0_WIDTH( 18 ),
    .din1_WIDTH( 15 ),
    .dout_WIDTH( 33 ))
calc_LE_r_offset_bkb_U1(
    .din0(hw_sin_val_V_read_reg_213),
    .din1(slcvec_pos_local_Rho_fu_143_p3),
    .dout(r_V_4_fu_194_p2)
);

calc_LE_r_offset_cud #(
    .ID( 1 ),
    .NUM_STAGE( 1 ),
    .din0_WIDTH( 18 ),
    .din1_WIDTH( 15 ),
    .din2_WIDTH( 33 ),
    .dout_WIDTH( 34 ))
calc_LE_r_offset_cud_U2(
    .din0(hw_cos_val_V_read_reg_208_pp0_iter2_reg),
    .din1(slcvec_pos_local_Z_V_fu_157_p3),
    .din2(r_V_4_reg_228),
    .dout(grp_fu_200_p3)
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
        if (((1'b0 == ap_block_pp0_stage0_subdone) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
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
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter3 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter3 <= ap_enable_reg_pp0_iter2;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter4 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter4 <= ap_enable_reg_pp0_iter3;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter5 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter5 <= ap_enable_reg_pp0_iter4;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((~((ap_start == 1'b0) & (ap_idle_pp0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0)) & (hewindow_pos_V_0_vld_reg == 1'b0) & (1'b1 == 1'b1)) | (~((ap_start == 1'b0) & (ap_idle_pp0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0)) & (hewindow_pos_V_0_ack_out == 1'b1) & (1'b1 == 1'b1) & (hewindow_pos_V_0_vld_reg == 1'b1)))) begin
        hewindow_pos_V_0_data_reg <= hewindow_pos_V;
    end
end

always @ (posedge ap_clk) begin
    if (((~((ap_start == 1'b0) & (ap_idle_pp0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0)) & (hewindow_pos_ref_V_0_vld_reg == 1'b0) & (1'b1 == 1'b1)) | (~((ap_start == 1'b0) & (ap_idle_pp0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0)) & (hewindow_pos_ref_V_0_ack_out == 1'b1) & (1'b1 == 1'b1) & (hewindow_pos_ref_V_0_vld_reg == 1'b1)))) begin
        hewindow_pos_ref_V_0_data_reg <= hewindow_pos_ref_V;
    end
end

always @ (posedge ap_clk) begin
    if (((~((ap_start == 1'b0) & (ap_idle_pp0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0)) & (hw_cos_val_V_0_ack_out == 1'b1) & (1'b1 == 1'b1) & (hw_cos_val_V_0_vld_reg == 1'b1)) | (~((ap_start == 1'b0) & (ap_idle_pp0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0)) & (hw_cos_val_V_0_vld_reg == 1'b0) & (1'b1 == 1'b1)))) begin
        hw_cos_val_V_0_data_reg <= hw_cos_val_V;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        hw_cos_val_V_read_reg_208 <= hw_cos_val_V_0_data_reg;
        hw_sin_val_V_read_reg_213 <= hw_sin_val_V_0_data_reg;
        sub_ln731_1_reg_223 <= sub_ln731_1_fu_137_p2;
        sub_ln731_reg_218[12 : 3] <= sub_ln731_fu_123_p2[12 : 3];
    end
end

always @ (posedge ap_clk) begin
    if ((1'b0 == ap_block_pp0_stage0_11001)) begin
        hw_cos_val_V_read_reg_208_pp0_iter2_reg <= hw_cos_val_V_read_reg_208;
        r_V_4_reg_228 <= r_V_4_fu_194_p2;
        sub_ln731_reg_218_pp0_iter2_reg[12 : 3] <= sub_ln731_reg_218[12 : 3];
    end
end

always @ (posedge ap_clk) begin
    if (((~((ap_start == 1'b0) & (ap_idle_pp0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0)) & (hw_sin_val_V_0_vld_reg == 1'b0) & (1'b1 == 1'b1)) | (~((ap_start == 1'b0) & (ap_idle_pp0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0)) & (hw_sin_val_V_0_ack_out == 1'b1) & (1'b1 == 1'b1) & (hw_sin_val_V_0_vld_reg == 1'b1)))) begin
        hw_sin_val_V_0_data_reg <= hw_sin_val_V;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter3 == 1'b1))) begin
        ret_V_reg_233 <= grp_fu_200_p3;
    end
end

always @ (posedge ap_clk) begin
    if (((~((ap_start == 1'b0) & (ap_idle_pp0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0)) & (roi_seed_r_V_1_vld_reg == 1'b0) & (roi_seed_r_V_1_vld_in == 1'b1)) | (~((ap_start == 1'b0) & (ap_idle_pp0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0)) & (1'b1 == 1'b1) & (roi_seed_r_V_1_vld_in == 1'b1) & (roi_seed_r_V_1_vld_reg == 1'b1)))) begin
        roi_seed_r_V_1_data_reg <= sext_ln708_fu_189_p1;
    end
end

always @ (posedge ap_clk) begin
    if (((~((ap_start == 1'b0) & (ap_idle_pp0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0)) & (slcvec_pos_V_0_vld_reg == 1'b0) & (1'b1 == 1'b1)) | (~((ap_start == 1'b0) & (ap_idle_pp0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0)) & (slcvec_pos_V_0_ack_out == 1'b1) & (1'b1 == 1'b1) & (slcvec_pos_V_0_vld_reg == 1'b1)))) begin
        slcvec_pos_V_0_data_reg <= slcvec_pos_V;
    end
end

always @ (posedge ap_clk) begin
    if (((~((ap_start == 1'b0) & (ap_idle_pp0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0)) & (slcvec_pos_ref_V_0_vld_reg == 1'b0) & (1'b1 == 1'b1)) | (~((ap_start == 1'b0) & (ap_idle_pp0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0)) & (slcvec_pos_ref_V_0_ack_out == 1'b1) & (1'b1 == 1'b1) & (slcvec_pos_ref_V_0_vld_reg == 1'b1)))) begin
        slcvec_pos_ref_V_0_data_reg <= slcvec_pos_ref_V;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter5 == 1'b1))) begin
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
    if (((ap_enable_reg_pp0_iter5 == 1'b0) & (ap_enable_reg_pp0_iter4 == 1'b0) & (ap_enable_reg_pp0_iter3 == 1'b0) & (ap_enable_reg_pp0_iter2 == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b0) & (ap_enable_reg_pp0_iter0 == 1'b0))) begin
        ap_idle_pp0 = 1'b1;
    end else begin
        ap_idle_pp0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter4 == 1'b0) & (ap_enable_reg_pp0_iter3 == 1'b0) & (ap_enable_reg_pp0_iter2 == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b0) & (ap_enable_reg_pp0_iter0 == 1'b0))) begin
        ap_idle_pp0_0to4 = 1'b1;
    end else begin
        ap_idle_pp0_0to4 = 1'b0;
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
    if (((ap_start == 1'b0) & (ap_idle_pp0_0to4 == 1'b1))) begin
        ap_reset_idle_pp0 = 1'b1;
    end else begin
        ap_reset_idle_pp0 = 1'b0;
    end
end

always @ (*) begin
    if ((((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0)) | ((1'b0 == ap_block_pp0_stage0_11001) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0)))) begin
        hewindow_pos_V_0_ack_out = 1'b1;
    end else begin
        hewindow_pos_V_0_ack_out = 1'b0;
    end
end

always @ (*) begin
    if ((((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0)) | ((1'b0 == ap_block_pp0_stage0_11001) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0)))) begin
        hewindow_pos_ref_V_0_ack_out = 1'b1;
    end else begin
        hewindow_pos_ref_V_0_ack_out = 1'b0;
    end
end

always @ (*) begin
    if ((((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0)) | ((1'b0 == ap_block_pp0_stage0_11001) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0)))) begin
        hw_cos_val_V_0_ack_out = 1'b1;
    end else begin
        hw_cos_val_V_0_ack_out = 1'b0;
    end
end

always @ (*) begin
    if ((((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0)) | ((1'b0 == ap_block_pp0_stage0_11001) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0)))) begin
        hw_sin_val_V_0_ack_out = 1'b1;
    end else begin
        hw_sin_val_V_0_ack_out = 1'b0;
    end
end

always @ (*) begin
    if (((roi_seed_r_V_1_vld_reg == 1'b0) | ((1'b1 == 1'b1) & (roi_seed_r_V_1_vld_reg == 1'b1)))) begin
        roi_seed_r_V_1_ack_in = 1'b1;
    end else begin
        roi_seed_r_V_1_ack_in = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter4 == 1'b1))) begin
        roi_seed_r_V_1_vld_in = 1'b1;
    end else begin
        roi_seed_r_V_1_vld_in = 1'b0;
    end
end

always @ (*) begin
    if ((((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0)) | ((1'b0 == ap_block_pp0_stage0_11001) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0)))) begin
        slcvec_pos_V_0_ack_out = 1'b1;
    end else begin
        slcvec_pos_V_0_ack_out = 1'b0;
    end
end

always @ (*) begin
    if ((((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0)) | ((1'b0 == ap_block_pp0_stage0_11001) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0)))) begin
        slcvec_pos_ref_V_0_ack_out = 1'b1;
    end else begin
        slcvec_pos_ref_V_0_ack_out = 1'b0;
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
    ap_block_pp0_stage0_01001 = (((ap_start == 1'b0) & (ap_start == 1'b1)) | ((roi_seed_r_V_1_ack_in == 1'b0) & (ap_enable_reg_pp0_iter5 == 1'b1)));
end

always @ (*) begin
    ap_block_pp0_stage0_11001 = (((ap_start == 1'b0) & (ap_start == 1'b1)) | ((roi_seed_r_V_1_ack_in == 1'b0) & (ap_enable_reg_pp0_iter5 == 1'b1)));
end

always @ (*) begin
    ap_block_pp0_stage0_subdone = (((ap_start == 1'b0) & (ap_start == 1'b1)) | ((roi_seed_r_V_1_ack_in == 1'b0) & (ap_enable_reg_pp0_iter5 == 1'b1)));
end

always @ (*) begin
    ap_block_state1_pp0_stage0_iter0 = (ap_start == 1'b0);
end

assign ap_block_state2_pp0_stage0_iter1 = ~(1'b1 == 1'b1);

assign ap_block_state3_pp0_stage0_iter2 = ~(1'b1 == 1'b1);

assign ap_block_state4_pp0_stage0_iter3 = ~(1'b1 == 1'b1);

assign ap_block_state5_pp0_stage0_iter4 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_state6_pp0_stage0_iter5 = (roi_seed_r_V_1_ack_in == 1'b0);
end

assign ap_enable_pp0 = (ap_idle_pp0 ^ 1'b1);

assign ap_enable_reg_pp0_iter0 = ap_start;

assign ret_V_1_fu_174_p2 = ($signed(34'd17046700032) + $signed(ret_V_reg_233));

assign roi_seed_r_V = roi_seed_r_V_1_data_reg;

assign sext_ln708_fu_189_p1 = $signed(trunc_ln1_fu_179_p4);

assign shl_ln731_1_fu_115_p3 = {{trunc_ln731_1_fu_111_p1}, {3'd0}};

assign shl_ln_fu_103_p3 = {{trunc_ln731_fu_99_p1}, {3'd0}};

assign slcvec_pos_local_Rho_fu_143_p3 = {{sub_ln731_1_reg_223}, {2'd0}};

assign slcvec_pos_local_Z_V_fu_157_p3 = {{sub_ln731_reg_218_pp0_iter2_reg}, {2'd0}};

assign sub_ln731_1_fu_137_p2 = (trunc_ln731_2_fu_129_p1 - trunc_ln731_3_fu_133_p1);

assign sub_ln731_fu_123_p2 = (shl_ln_fu_103_p3 - shl_ln731_1_fu_115_p3);

assign trunc_ln1_fu_179_p4 = {{ret_V_1_fu_174_p2[33:16]}};

assign trunc_ln731_1_fu_111_p1 = hewindow_pos_V_0_data_reg[9:0];

assign trunc_ln731_2_fu_129_p1 = slcvec_pos_ref_V_0_data_reg[12:0];

assign trunc_ln731_3_fu_133_p1 = hewindow_pos_ref_V_0_data_reg[12:0];

assign trunc_ln731_fu_99_p1 = slcvec_pos_V_0_data_reg[9:0];

always @ (posedge ap_clk) begin
    sub_ln731_reg_218[2:0] <= 3'b000;
    sub_ln731_reg_218_pp0_iter2_reg[2:0] <= 3'b000;
end

endmodule //calc_LE_r_offset_barrel

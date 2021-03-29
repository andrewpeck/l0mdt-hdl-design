// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.2.1 (lin64) Build 2729669 Thu Dec  5 04:48:12 MST 2019
// Date        : Mon Mar 29 15:39:10 2021
// Host        : atlas126a running 64-bit openSUSE Tumbleweed
// Command     : write_verilog -force -mode funcsim
//               /mnt/atlas126a/scratch/dcieri/Firmware/l0mdt-hdl-design/UserLogic/lsf/IP/histogram_memory_128x4/histogram_memory_128x4_sim_netlist.v
// Design      : histogram_memory_128x4
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xcku15p-ffva1760-2-e
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "histogram_memory_128x4,dist_mem_gen_v8_0_13,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "dist_mem_gen_v8_0_13,Vivado 2019.2.1" *) 
(* NotValidForBitStream *)
module histogram_memory_128x4
   (a,
    d,
    dpra,
    clk,
    we,
    qdpo);
  input [6:0]a;
  input [3:0]d;
  input [6:0]dpra;
  input clk;
  input we;
  output [3:0]qdpo;

  wire [6:0]a;
  wire clk;
  wire [3:0]d;
  wire [6:0]dpra;
  wire [3:0]qdpo;
  wire we;
  wire [3:0]NLW_U0_dpo_UNCONNECTED;
  wire [3:0]NLW_U0_qspo_UNCONNECTED;
  wire [3:0]NLW_U0_spo_UNCONNECTED;

  (* C_FAMILY = "kintexuplus" *) 
  (* C_HAS_CLK = "1" *) 
  (* C_HAS_D = "1" *) 
  (* C_HAS_DPO = "0" *) 
  (* C_HAS_DPRA = "1" *) 
  (* C_HAS_QDPO = "1" *) 
  (* C_HAS_QDPO_CE = "0" *) 
  (* C_HAS_QDPO_CLK = "0" *) 
  (* C_HAS_QDPO_RST = "0" *) 
  (* C_HAS_QDPO_SRST = "0" *) 
  (* C_HAS_QSPO = "0" *) 
  (* C_HAS_QSPO_RST = "0" *) 
  (* C_HAS_QSPO_SRST = "0" *) 
  (* C_HAS_SPO = "0" *) 
  (* C_HAS_WE = "1" *) 
  (* C_MEM_TYPE = "4" *) 
  (* C_REG_DPRA_INPUT = "0" *) 
  (* c_addr_width = "7" *) 
  (* c_default_data = "0" *) 
  (* c_depth = "128" *) 
  (* c_elaboration_dir = "./" *) 
  (* c_has_i_ce = "0" *) 
  (* c_has_qspo_ce = "0" *) 
  (* c_mem_init_file = "no_coe_file_loaded" *) 
  (* c_parser_type = "1" *) 
  (* c_pipeline_stages = "0" *) 
  (* c_qce_joined = "0" *) 
  (* c_qualify_we = "0" *) 
  (* c_read_mif = "0" *) 
  (* c_reg_a_d_inputs = "0" *) 
  (* c_sync_enable = "1" *) 
  (* c_width = "4" *) 
  histogram_memory_128x4_dist_mem_gen_v8_0_13 U0
       (.a(a),
        .clk(clk),
        .d(d),
        .dpo(NLW_U0_dpo_UNCONNECTED[3:0]),
        .dpra(dpra),
        .i_ce(1'b1),
        .qdpo(qdpo),
        .qdpo_ce(1'b1),
        .qdpo_clk(1'b0),
        .qdpo_rst(1'b0),
        .qdpo_srst(1'b0),
        .qspo(NLW_U0_qspo_UNCONNECTED[3:0]),
        .qspo_ce(1'b1),
        .qspo_rst(1'b0),
        .qspo_srst(1'b0),
        .spo(NLW_U0_spo_UNCONNECTED[3:0]),
        .we(we));
endmodule

(* C_ADDR_WIDTH = "7" *) (* C_DEFAULT_DATA = "0" *) (* C_DEPTH = "128" *) 
(* C_ELABORATION_DIR = "./" *) (* C_FAMILY = "kintexuplus" *) (* C_HAS_CLK = "1" *) 
(* C_HAS_D = "1" *) (* C_HAS_DPO = "0" *) (* C_HAS_DPRA = "1" *) 
(* C_HAS_I_CE = "0" *) (* C_HAS_QDPO = "1" *) (* C_HAS_QDPO_CE = "0" *) 
(* C_HAS_QDPO_CLK = "0" *) (* C_HAS_QDPO_RST = "0" *) (* C_HAS_QDPO_SRST = "0" *) 
(* C_HAS_QSPO = "0" *) (* C_HAS_QSPO_CE = "0" *) (* C_HAS_QSPO_RST = "0" *) 
(* C_HAS_QSPO_SRST = "0" *) (* C_HAS_SPO = "0" *) (* C_HAS_WE = "1" *) 
(* C_MEM_INIT_FILE = "no_coe_file_loaded" *) (* C_MEM_TYPE = "4" *) (* C_PARSER_TYPE = "1" *) 
(* C_PIPELINE_STAGES = "0" *) (* C_QCE_JOINED = "0" *) (* C_QUALIFY_WE = "0" *) 
(* C_READ_MIF = "0" *) (* C_REG_A_D_INPUTS = "0" *) (* C_REG_DPRA_INPUT = "0" *) 
(* C_SYNC_ENABLE = "1" *) (* C_WIDTH = "4" *) (* ORIG_REF_NAME = "dist_mem_gen_v8_0_13" *) 
module histogram_memory_128x4_dist_mem_gen_v8_0_13
   (a,
    d,
    dpra,
    clk,
    we,
    i_ce,
    qspo_ce,
    qdpo_ce,
    qdpo_clk,
    qspo_rst,
    qdpo_rst,
    qspo_srst,
    qdpo_srst,
    spo,
    dpo,
    qspo,
    qdpo);
  input [6:0]a;
  input [3:0]d;
  input [6:0]dpra;
  input clk;
  input we;
  input i_ce;
  input qspo_ce;
  input qdpo_ce;
  input qdpo_clk;
  input qspo_rst;
  input qdpo_rst;
  input qspo_srst;
  input qdpo_srst;
  output [3:0]spo;
  output [3:0]dpo;
  output [3:0]qspo;
  output [3:0]qdpo;

  wire \<const0> ;
  wire [6:0]a;
  wire clk;
  wire [3:0]d;
  wire [6:0]dpra;
  wire [3:0]qdpo;
  wire we;

  assign dpo[3] = \<const0> ;
  assign dpo[2] = \<const0> ;
  assign dpo[1] = \<const0> ;
  assign dpo[0] = \<const0> ;
  assign qspo[3] = \<const0> ;
  assign qspo[2] = \<const0> ;
  assign qspo[1] = \<const0> ;
  assign qspo[0] = \<const0> ;
  assign spo[3] = \<const0> ;
  assign spo[2] = \<const0> ;
  assign spo[1] = \<const0> ;
  assign spo[0] = \<const0> ;
  GND GND
       (.G(\<const0> ));
  histogram_memory_128x4_dist_mem_gen_v8_0_13_synth \synth_options.dist_mem_inst 
       (.a(a),
        .clk(clk),
        .d(d),
        .dpra(dpra),
        .qdpo(qdpo),
        .we(we));
endmodule

(* ORIG_REF_NAME = "dist_mem_gen_v8_0_13_synth" *) 
module histogram_memory_128x4_dist_mem_gen_v8_0_13_synth
   (qdpo,
    we,
    a,
    clk,
    d,
    dpra);
  output [3:0]qdpo;
  input we;
  input [6:0]a;
  input clk;
  input [3:0]d;
  input [6:0]dpra;

  wire [6:0]a;
  wire clk;
  wire [3:0]d;
  wire [6:0]dpra;
  wire [3:0]qdpo;
  wire we;

  histogram_memory_128x4_sdpram \gen_sdp_ram.sdpram_inst 
       (.a(a),
        .clk(clk),
        .d(d),
        .dpra(dpra),
        .qdpo(qdpo),
        .we(we));
endmodule

(* ORIG_REF_NAME = "sdpram" *) 
module histogram_memory_128x4_sdpram
   (qdpo,
    we,
    a,
    clk,
    d,
    dpra);
  output [3:0]qdpo;
  input we;
  input [6:0]a;
  input clk;
  input [3:0]d;
  input [6:0]dpra;

  wire [6:0]a;
  wire clk;
  wire [3:0]d;
  wire [6:0]dpra;
  (* RTL_KEEP = "true" *) wire [3:0]qsdpo_int;
  wire ram_reg_0_63_0_3_i_1_n_0;
  wire ram_reg_0_63_0_3_n_0;
  wire ram_reg_0_63_0_3_n_1;
  wire ram_reg_0_63_0_3_n_2;
  wire ram_reg_0_63_0_3_n_3;
  wire ram_reg_64_127_0_3_i_1_n_0;
  wire ram_reg_64_127_0_3_n_0;
  wire ram_reg_64_127_0_3_n_1;
  wire ram_reg_64_127_0_3_n_2;
  wire ram_reg_64_127_0_3_n_3;
  wire [3:0]sdpo_int;
  wire we;
  wire NLW_ram_reg_0_63_0_3_DOE_UNCONNECTED;
  wire NLW_ram_reg_0_63_0_3_DOF_UNCONNECTED;
  wire NLW_ram_reg_0_63_0_3_DOG_UNCONNECTED;
  wire NLW_ram_reg_0_63_0_3_DOH_UNCONNECTED;
  wire NLW_ram_reg_64_127_0_3_DOE_UNCONNECTED;
  wire NLW_ram_reg_64_127_0_3_DOF_UNCONNECTED;
  wire NLW_ram_reg_64_127_0_3_DOG_UNCONNECTED;
  wire NLW_ram_reg_64_127_0_3_DOH_UNCONNECTED;

  assign qdpo[3:0] = qsdpo_int;
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \qsdpo_int[0]_i_1 
       (.I0(ram_reg_64_127_0_3_n_0),
        .I1(dpra[6]),
        .I2(ram_reg_0_63_0_3_n_0),
        .O(sdpo_int[0]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \qsdpo_int[1]_i_1 
       (.I0(ram_reg_64_127_0_3_n_1),
        .I1(dpra[6]),
        .I2(ram_reg_0_63_0_3_n_1),
        .O(sdpo_int[1]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \qsdpo_int[2]_i_1 
       (.I0(ram_reg_64_127_0_3_n_2),
        .I1(dpra[6]),
        .I2(ram_reg_0_63_0_3_n_2),
        .O(sdpo_int[2]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \qsdpo_int[3]_i_1 
       (.I0(ram_reg_64_127_0_3_n_3),
        .I1(dpra[6]),
        .I2(ram_reg_0_63_0_3_n_3),
        .O(sdpo_int[3]));
  (* KEEP = "yes" *) 
  (* equivalent_register_removal = "no" *) 
  FDRE #(
    .INIT(1'b0)) 
    \qsdpo_int_reg[0] 
       (.C(clk),
        .CE(1'b1),
        .D(sdpo_int[0]),
        .Q(qsdpo_int[0]),
        .R(1'b0));
  (* KEEP = "yes" *) 
  (* equivalent_register_removal = "no" *) 
  FDRE #(
    .INIT(1'b0)) 
    \qsdpo_int_reg[1] 
       (.C(clk),
        .CE(1'b1),
        .D(sdpo_int[1]),
        .Q(qsdpo_int[1]),
        .R(1'b0));
  (* KEEP = "yes" *) 
  (* equivalent_register_removal = "no" *) 
  FDRE #(
    .INIT(1'b0)) 
    \qsdpo_int_reg[2] 
       (.C(clk),
        .CE(1'b1),
        .D(sdpo_int[2]),
        .Q(qsdpo_int[2]),
        .R(1'b0));
  (* KEEP = "yes" *) 
  (* equivalent_register_removal = "no" *) 
  FDRE #(
    .INIT(1'b0)) 
    \qsdpo_int_reg[3] 
       (.C(clk),
        .CE(1'b1),
        .D(sdpo_int[3]),
        .Q(qsdpo_int[3]),
        .R(1'b0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "512" *) 
  (* RTL_RAM_NAME = "synth_options.dist_mem_inst/gen_sdp_ram.sdpram_inst/ram" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "63" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "0" *) 
  (* ram_slice_end = "3" *) 
  RAM64M8 #(
    .INIT_A(64'h0000000000000000),
    .INIT_B(64'h0000000000000000),
    .INIT_C(64'h0000000000000000),
    .INIT_D(64'h0000000000000000),
    .INIT_E(64'h0000000000000000),
    .INIT_F(64'h0000000000000000),
    .INIT_G(64'h0000000000000000),
    .INIT_H(64'h0000000000000000)) 
    ram_reg_0_63_0_3
       (.ADDRA(dpra[5:0]),
        .ADDRB(dpra[5:0]),
        .ADDRC(dpra[5:0]),
        .ADDRD(dpra[5:0]),
        .ADDRE(dpra[5:0]),
        .ADDRF(dpra[5:0]),
        .ADDRG(dpra[5:0]),
        .ADDRH(a[5:0]),
        .DIA(d[0]),
        .DIB(d[1]),
        .DIC(d[2]),
        .DID(d[3]),
        .DIE(1'b0),
        .DIF(1'b0),
        .DIG(1'b0),
        .DIH(1'b0),
        .DOA(ram_reg_0_63_0_3_n_0),
        .DOB(ram_reg_0_63_0_3_n_1),
        .DOC(ram_reg_0_63_0_3_n_2),
        .DOD(ram_reg_0_63_0_3_n_3),
        .DOE(NLW_ram_reg_0_63_0_3_DOE_UNCONNECTED),
        .DOF(NLW_ram_reg_0_63_0_3_DOF_UNCONNECTED),
        .DOG(NLW_ram_reg_0_63_0_3_DOG_UNCONNECTED),
        .DOH(NLW_ram_reg_0_63_0_3_DOH_UNCONNECTED),
        .WCLK(clk),
        .WE(ram_reg_0_63_0_3_i_1_n_0));
  LUT2 #(
    .INIT(4'h2)) 
    ram_reg_0_63_0_3_i_1
       (.I0(we),
        .I1(a[6]),
        .O(ram_reg_0_63_0_3_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "512" *) 
  (* RTL_RAM_NAME = "synth_options.dist_mem_inst/gen_sdp_ram.sdpram_inst/ram" *) 
  (* ram_addr_begin = "64" *) 
  (* ram_addr_end = "127" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "0" *) 
  (* ram_slice_end = "3" *) 
  RAM64M8 #(
    .INIT_A(64'h0000000000000000),
    .INIT_B(64'h0000000000000000),
    .INIT_C(64'h0000000000000000),
    .INIT_D(64'h0000000000000000),
    .INIT_E(64'h0000000000000000),
    .INIT_F(64'h0000000000000000),
    .INIT_G(64'h0000000000000000),
    .INIT_H(64'h0000000000000000)) 
    ram_reg_64_127_0_3
       (.ADDRA(dpra[5:0]),
        .ADDRB(dpra[5:0]),
        .ADDRC(dpra[5:0]),
        .ADDRD(dpra[5:0]),
        .ADDRE(dpra[5:0]),
        .ADDRF(dpra[5:0]),
        .ADDRG(dpra[5:0]),
        .ADDRH(a[5:0]),
        .DIA(d[0]),
        .DIB(d[1]),
        .DIC(d[2]),
        .DID(d[3]),
        .DIE(1'b0),
        .DIF(1'b0),
        .DIG(1'b0),
        .DIH(1'b0),
        .DOA(ram_reg_64_127_0_3_n_0),
        .DOB(ram_reg_64_127_0_3_n_1),
        .DOC(ram_reg_64_127_0_3_n_2),
        .DOD(ram_reg_64_127_0_3_n_3),
        .DOE(NLW_ram_reg_64_127_0_3_DOE_UNCONNECTED),
        .DOF(NLW_ram_reg_64_127_0_3_DOF_UNCONNECTED),
        .DOG(NLW_ram_reg_64_127_0_3_DOG_UNCONNECTED),
        .DOH(NLW_ram_reg_64_127_0_3_DOH_UNCONNECTED),
        .WCLK(clk),
        .WE(ram_reg_64_127_0_3_i_1_n_0));
  LUT2 #(
    .INIT(4'h8)) 
    ram_reg_64_127_0_3_i_1
       (.I0(we),
        .I1(a[6]),
        .O(ram_reg_64_127_0_3_i_1_n_0));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule
`endif

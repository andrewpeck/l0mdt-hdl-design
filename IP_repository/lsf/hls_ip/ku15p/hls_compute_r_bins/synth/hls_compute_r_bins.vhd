-- (c) Copyright 1995-2021 Xilinx, Inc. All rights reserved.
--
-- This file contains confidential and proprietary information
-- of Xilinx, Inc. and is protected under U.S. and
-- international copyright and other intellectual property
-- laws.
--
-- DISCLAIMER
-- This disclaimer is not a license and does not grant any
-- rights to the materials distributed herewith. Except as
-- otherwise provided in a valid license issued to you by
-- Xilinx, and to the maximum extent permitted by applicable
-- law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
-- WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
-- AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
-- BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
-- INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
-- (2) Xilinx shall not be liable (whether in contract or tort,
-- including negligence, or under any other theory of
-- liability) for any loss or damage of any kind or nature
-- related to, arising under or in connection with these
-- materials, including for any direct, or any indirect,
-- special, incidental, or consequential loss or damage
-- (including loss of data, profits, goodwill, or any type of
-- loss or damage suffered as a result of any action brought
-- by a third party) even if such damage or loss was
-- reasonably foreseeable or Xilinx had been advised of the
-- possibility of the same.
--
-- CRITICAL APPLICATIONS
-- Xilinx products are not designed or intended to be fail-
-- safe, or for use in any application requiring fail-safe
-- performance, such as life-support or safety devices or
-- systems, Class III medical devices, nuclear facilities,
-- applications related to the deployment of airbags, or any
-- other applications that could lead to death, personal
-- injury, or severe property or environmental damage
-- (individually and collectively, "Critical
-- Applications"). Customer assumes the sole risk and
-- liability of any use of Xilinx products in Critical
-- Applications, subject only to applicable laws and
-- regulations governing limitations on product liability.
--
-- THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
-- PART OF THIS FILE AT ALL TIMES.
--
-- DO NOT MODIFY THIS FILE.

-- IP VLNV: xilinx.com:hls:compute_r_bins:1.0
-- IP Revision: 2101051423

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY hls_compute_r_bins IS
  PORT (
    ap_clk : IN STD_LOGIC;
    ap_rst_n : IN STD_LOGIC;
    ap_start : IN STD_LOGIC;
    ap_done : OUT STD_LOGIC;
    ap_idle : OUT STD_LOGIC;
    ap_ready : OUT STD_LOGIC;
    mdt_r_offset_V_TVALID : IN STD_LOGIC;
    mdt_r_offset_V_TREADY : OUT STD_LOGIC;
    mdt_r_offset_V_TDATA : IN STD_LOGIC_VECTOR(23 DOWNTO 0);
    r_bin_V_TVALID : OUT STD_LOGIC;
    r_bin_V_TREADY : IN STD_LOGIC;
    r_bin_V_TDATA : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    mdt_localx_V : IN STD_LOGIC_VECTOR(14 DOWNTO 0);
    mdt_localy_V : IN STD_LOGIC_VECTOR(14 DOWNTO 0);
    hw_sin_val_V : IN STD_LOGIC_VECTOR(17 DOWNTO 0);
    hw_cos_val_V : IN STD_LOGIC_VECTOR(17 DOWNTO 0)
  );
END hls_compute_r_bins;

ARCHITECTURE hls_compute_r_bins_arch OF hls_compute_r_bins IS
  ATTRIBUTE DowngradeIPIdentifiedWarnings : STRING;
  ATTRIBUTE DowngradeIPIdentifiedWarnings OF hls_compute_r_bins_arch: ARCHITECTURE IS "yes";
  COMPONENT compute_r_bins IS
    PORT (
      ap_clk : IN STD_LOGIC;
      ap_rst_n : IN STD_LOGIC;
      ap_start : IN STD_LOGIC;
      ap_done : OUT STD_LOGIC;
      ap_idle : OUT STD_LOGIC;
      ap_ready : OUT STD_LOGIC;
      mdt_r_offset_V_TVALID : IN STD_LOGIC;
      mdt_r_offset_V_TREADY : OUT STD_LOGIC;
      mdt_r_offset_V_TDATA : IN STD_LOGIC_VECTOR(23 DOWNTO 0);
      r_bin_V_TVALID : OUT STD_LOGIC;
      r_bin_V_TREADY : IN STD_LOGIC;
      r_bin_V_TDATA : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
      mdt_localx_V : IN STD_LOGIC_VECTOR(14 DOWNTO 0);
      mdt_localy_V : IN STD_LOGIC_VECTOR(14 DOWNTO 0);
      hw_sin_val_V : IN STD_LOGIC_VECTOR(17 DOWNTO 0);
      hw_cos_val_V : IN STD_LOGIC_VECTOR(17 DOWNTO 0)
    );
  END COMPONENT compute_r_bins;
  ATTRIBUTE X_CORE_INFO : STRING;
  ATTRIBUTE X_CORE_INFO OF hls_compute_r_bins_arch: ARCHITECTURE IS "compute_r_bins,Vivado 2019.2.1";
  ATTRIBUTE CHECK_LICENSE_TYPE : STRING;
  ATTRIBUTE CHECK_LICENSE_TYPE OF hls_compute_r_bins_arch : ARCHITECTURE IS "hls_compute_r_bins,compute_r_bins,{}";
  ATTRIBUTE CORE_GENERATION_INFO : STRING;
  ATTRIBUTE CORE_GENERATION_INFO OF hls_compute_r_bins_arch: ARCHITECTURE IS "hls_compute_r_bins,compute_r_bins,{x_ipProduct=Vivado 2019.2.1,x_ipVendor=xilinx.com,x_ipLibrary=hls,x_ipName=compute_r_bins,x_ipVersion=1.0,x_ipCoreRevision=2101051423,x_ipLanguage=VHDL,x_ipSimLanguage=MIXED}";
  ATTRIBUTE IP_DEFINITION_SOURCE : STRING;
  ATTRIBUTE IP_DEFINITION_SOURCE OF hls_compute_r_bins_arch: ARCHITECTURE IS "HLS";
  ATTRIBUTE X_INTERFACE_INFO : STRING;
  ATTRIBUTE X_INTERFACE_PARAMETER : STRING;
  ATTRIBUTE X_INTERFACE_PARAMETER OF hw_cos_val_V: SIGNAL IS "XIL_INTERFACENAME hw_cos_val_V, LAYERED_METADATA undef";
  ATTRIBUTE X_INTERFACE_INFO OF hw_cos_val_V: SIGNAL IS "xilinx.com:signal:data:1.0 hw_cos_val_V DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF hw_sin_val_V: SIGNAL IS "XIL_INTERFACENAME hw_sin_val_V, LAYERED_METADATA undef";
  ATTRIBUTE X_INTERFACE_INFO OF hw_sin_val_V: SIGNAL IS "xilinx.com:signal:data:1.0 hw_sin_val_V DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF mdt_localy_V: SIGNAL IS "XIL_INTERFACENAME mdt_localy_V, LAYERED_METADATA undef";
  ATTRIBUTE X_INTERFACE_INFO OF mdt_localy_V: SIGNAL IS "xilinx.com:signal:data:1.0 mdt_localy_V DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF mdt_localx_V: SIGNAL IS "XIL_INTERFACENAME mdt_localx_V, LAYERED_METADATA undef";
  ATTRIBUTE X_INTERFACE_INFO OF mdt_localx_V: SIGNAL IS "xilinx.com:signal:data:1.0 mdt_localx_V DATA";
  ATTRIBUTE X_INTERFACE_INFO OF r_bin_V_TDATA: SIGNAL IS "xilinx.com:interface:axis:1.0 r_bin_V TDATA";
  ATTRIBUTE X_INTERFACE_INFO OF r_bin_V_TREADY: SIGNAL IS "xilinx.com:interface:axis:1.0 r_bin_V TREADY";
  ATTRIBUTE X_INTERFACE_PARAMETER OF r_bin_V_TVALID: SIGNAL IS "XIL_INTERFACENAME r_bin_V, TDATA_NUM_BYTES 1, TUSER_WIDTH 0, TDEST_WIDTH 0, TID_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 0, FREQ_HZ 100000000, PHASE 0.000, INSERT_VIP 0";
  ATTRIBUTE X_INTERFACE_INFO OF r_bin_V_TVALID: SIGNAL IS "xilinx.com:interface:axis:1.0 r_bin_V TVALID";
  ATTRIBUTE X_INTERFACE_INFO OF mdt_r_offset_V_TDATA: SIGNAL IS "xilinx.com:interface:axis:1.0 mdt_r_offset_V TDATA";
  ATTRIBUTE X_INTERFACE_INFO OF mdt_r_offset_V_TREADY: SIGNAL IS "xilinx.com:interface:axis:1.0 mdt_r_offset_V TREADY";
  ATTRIBUTE X_INTERFACE_PARAMETER OF mdt_r_offset_V_TVALID: SIGNAL IS "XIL_INTERFACENAME mdt_r_offset_V, TDATA_NUM_BYTES 3, TUSER_WIDTH 0, TDEST_WIDTH 0, TID_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 0, FREQ_HZ 100000000, PHASE 0.000, INSERT_VIP 0";
  ATTRIBUTE X_INTERFACE_INFO OF mdt_r_offset_V_TVALID: SIGNAL IS "xilinx.com:interface:axis:1.0 mdt_r_offset_V TVALID";
  ATTRIBUTE X_INTERFACE_INFO OF ap_ready: SIGNAL IS "xilinx.com:interface:acc_handshake:1.0 ap_ctrl ready";
  ATTRIBUTE X_INTERFACE_INFO OF ap_idle: SIGNAL IS "xilinx.com:interface:acc_handshake:1.0 ap_ctrl idle";
  ATTRIBUTE X_INTERFACE_INFO OF ap_done: SIGNAL IS "xilinx.com:interface:acc_handshake:1.0 ap_ctrl done";
  ATTRIBUTE X_INTERFACE_INFO OF ap_start: SIGNAL IS "xilinx.com:interface:acc_handshake:1.0 ap_ctrl start";
  ATTRIBUTE X_INTERFACE_PARAMETER OF ap_rst_n: SIGNAL IS "XIL_INTERFACENAME ap_rst_n, POLARITY ACTIVE_LOW, INSERT_VIP 0";
  ATTRIBUTE X_INTERFACE_INFO OF ap_rst_n: SIGNAL IS "xilinx.com:signal:reset:1.0 ap_rst_n RST";
  ATTRIBUTE X_INTERFACE_PARAMETER OF ap_clk: SIGNAL IS "XIL_INTERFACENAME ap_clk, ASSOCIATED_BUSIF mdt_r_offset_V:r_bin_V, ASSOCIATED_RESET ap_rst_n, FREQ_HZ 100000000, PHASE 0.000, INSERT_VIP 0";
  ATTRIBUTE X_INTERFACE_INFO OF ap_clk: SIGNAL IS "xilinx.com:signal:clock:1.0 ap_clk CLK";
BEGIN
  U0 : compute_r_bins
    PORT MAP (
      ap_clk => ap_clk,
      ap_rst_n => ap_rst_n,
      ap_start => ap_start,
      ap_done => ap_done,
      ap_idle => ap_idle,
      ap_ready => ap_ready,
      mdt_r_offset_V_TVALID => mdt_r_offset_V_TVALID,
      mdt_r_offset_V_TREADY => mdt_r_offset_V_TREADY,
      mdt_r_offset_V_TDATA => mdt_r_offset_V_TDATA,
      r_bin_V_TVALID => r_bin_V_TVALID,
      r_bin_V_TREADY => r_bin_V_TREADY,
      r_bin_V_TDATA => r_bin_V_TDATA,
      mdt_localx_V => mdt_localx_V,
      mdt_localy_V => mdt_localy_V,
      hw_sin_val_V => hw_sin_val_V,
      hw_cos_val_V => hw_cos_val_V
    );
END hls_compute_r_bins_arch;

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

-- IP VLNV: xilinx.com:hls:load_LE_refPos:1.0
-- IP Revision: 2012261759

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY hls_load_LE_refPos IS
  PORT (
    ap_clk : IN STD_LOGIC;
    ap_rst : IN STD_LOGIC;
    ap_start : IN STD_LOGIC;
    ap_done : OUT STD_LOGIC;
    ap_idle : OUT STD_LOGIC;
    ap_ready : OUT STD_LOGIC;
    mdtid_V : IN STD_LOGIC_VECTOR(8 DOWNTO 0);
    slcvec_pos_ref_V : OUT STD_LOGIC_VECTOR(17 DOWNTO 0);
    hewindow_pos_ref_V : OUT STD_LOGIC_VECTOR(17 DOWNTO 0)
  );
END hls_load_LE_refPos;

ARCHITECTURE hls_load_LE_refPos_arch OF hls_load_LE_refPos IS
  ATTRIBUTE DowngradeIPIdentifiedWarnings : STRING;
  ATTRIBUTE DowngradeIPIdentifiedWarnings OF hls_load_LE_refPos_arch: ARCHITECTURE IS "yes";
  COMPONENT load_LE_refPos IS
    PORT (
      ap_clk : IN STD_LOGIC;
      ap_rst : IN STD_LOGIC;
      ap_start : IN STD_LOGIC;
      ap_done : OUT STD_LOGIC;
      ap_idle : OUT STD_LOGIC;
      ap_ready : OUT STD_LOGIC;
      mdtid_V : IN STD_LOGIC_VECTOR(8 DOWNTO 0);
      slcvec_pos_ref_V : OUT STD_LOGIC_VECTOR(17 DOWNTO 0);
      hewindow_pos_ref_V : OUT STD_LOGIC_VECTOR(17 DOWNTO 0)
    );
  END COMPONENT load_LE_refPos;
  ATTRIBUTE X_CORE_INFO : STRING;
  ATTRIBUTE X_CORE_INFO OF hls_load_LE_refPos_arch: ARCHITECTURE IS "load_LE_refPos,Vivado 2019.2.1";
  ATTRIBUTE CHECK_LICENSE_TYPE : STRING;
  ATTRIBUTE CHECK_LICENSE_TYPE OF hls_load_LE_refPos_arch : ARCHITECTURE IS "hls_load_LE_refPos,load_LE_refPos,{}";
  ATTRIBUTE CORE_GENERATION_INFO : STRING;
  ATTRIBUTE CORE_GENERATION_INFO OF hls_load_LE_refPos_arch: ARCHITECTURE IS "hls_load_LE_refPos,load_LE_refPos,{x_ipProduct=Vivado 2019.2.1,x_ipVendor=xilinx.com,x_ipLibrary=hls,x_ipName=load_LE_refPos,x_ipVersion=1.0,x_ipCoreRevision=2012261759,x_ipLanguage=VHDL,x_ipSimLanguage=MIXED}";
  ATTRIBUTE IP_DEFINITION_SOURCE : STRING;
  ATTRIBUTE IP_DEFINITION_SOURCE OF hls_load_LE_refPos_arch: ARCHITECTURE IS "HLS";
  ATTRIBUTE X_INTERFACE_INFO : STRING;
  ATTRIBUTE X_INTERFACE_PARAMETER : STRING;
  ATTRIBUTE X_INTERFACE_PARAMETER OF hewindow_pos_ref_V: SIGNAL IS "XIL_INTERFACENAME hewindow_pos_ref_V, LAYERED_METADATA undef";
  ATTRIBUTE X_INTERFACE_INFO OF hewindow_pos_ref_V: SIGNAL IS "xilinx.com:signal:data:1.0 hewindow_pos_ref_V DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF slcvec_pos_ref_V: SIGNAL IS "XIL_INTERFACENAME slcvec_pos_ref_V, LAYERED_METADATA undef";
  ATTRIBUTE X_INTERFACE_INFO OF slcvec_pos_ref_V: SIGNAL IS "xilinx.com:signal:data:1.0 slcvec_pos_ref_V DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF mdtid_V: SIGNAL IS "XIL_INTERFACENAME mdtid_V, LAYERED_METADATA undef";
  ATTRIBUTE X_INTERFACE_INFO OF mdtid_V: SIGNAL IS "xilinx.com:signal:data:1.0 mdtid_V DATA";
  ATTRIBUTE X_INTERFACE_INFO OF ap_ready: SIGNAL IS "xilinx.com:interface:acc_handshake:1.0 ap_ctrl ready";
  ATTRIBUTE X_INTERFACE_INFO OF ap_idle: SIGNAL IS "xilinx.com:interface:acc_handshake:1.0 ap_ctrl idle";
  ATTRIBUTE X_INTERFACE_INFO OF ap_done: SIGNAL IS "xilinx.com:interface:acc_handshake:1.0 ap_ctrl done";
  ATTRIBUTE X_INTERFACE_INFO OF ap_start: SIGNAL IS "xilinx.com:interface:acc_handshake:1.0 ap_ctrl start";
  ATTRIBUTE X_INTERFACE_PARAMETER OF ap_rst: SIGNAL IS "XIL_INTERFACENAME ap_rst, POLARITY ACTIVE_HIGH, INSERT_VIP 0";
  ATTRIBUTE X_INTERFACE_INFO OF ap_rst: SIGNAL IS "xilinx.com:signal:reset:1.0 ap_rst RST";
  ATTRIBUTE X_INTERFACE_PARAMETER OF ap_clk: SIGNAL IS "XIL_INTERFACENAME ap_clk, ASSOCIATED_RESET ap_rst, FREQ_HZ 100000000, PHASE 0.000, INSERT_VIP 0";
  ATTRIBUTE X_INTERFACE_INFO OF ap_clk: SIGNAL IS "xilinx.com:signal:clock:1.0 ap_clk CLK";
BEGIN
  U0 : load_LE_refPos
    PORT MAP (
      ap_clk => ap_clk,
      ap_rst => ap_rst,
      ap_start => ap_start,
      ap_done => ap_done,
      ap_idle => ap_idle,
      ap_ready => ap_ready,
      mdtid_V => mdtid_V,
      slcvec_pos_ref_V => slcvec_pos_ref_V,
      hewindow_pos_ref_V => hewindow_pos_ref_V
    );
END hls_load_LE_refPos_arch;

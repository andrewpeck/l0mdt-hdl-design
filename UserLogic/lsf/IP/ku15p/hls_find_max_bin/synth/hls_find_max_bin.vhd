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

-- IP VLNV: xilinx.com:hls:find_max_bin:1.0
-- IP Revision: 2103241758

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY hls_find_max_bin IS
  PORT (
    hls_LT_theta_global_V_ap_vld : OUT STD_LOGIC;
    hls_LT_r_global_V_ap_vld : OUT STD_LOGIC;
    hls_LT_theta_V_ap_vld : OUT STD_LOGIC;
    hls_LT_r_V_ap_vld : OUT STD_LOGIC;
    res_max_bin_count_V_ap_vld : OUT STD_LOGIC;
    res_max_bin_theta_V_ap_vld : OUT STD_LOGIC;
    res_max_bin_r_V_ap_vld : OUT STD_LOGIC;
    ap_clk : IN STD_LOGIC;
    ap_rst : IN STD_LOGIC;
    ap_start : IN STD_LOGIC;
    ap_done : OUT STD_LOGIC;
    ap_idle : OUT STD_LOGIC;
    ap_ready : OUT STD_LOGIC;
    slcvec_angle_polar_offset_mrad_V : IN STD_LOGIC_VECTOR(13 DOWNTO 0);
    roi_seed_r_V : IN STD_LOGIC_VECTOR(21 DOWNTO 0);
    max_bin_count_0_V : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    max_bin_count_1_V : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    max_bin_count_2_V : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    max_bin_count_3_V : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    max_bin_count_4_V : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    max_bin_count_5_V : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    max_bin_count_6_V : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    max_bin_count_7_V : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    max_bin_count_8_V : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    max_bin_count_9_V : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    max_bin_count_10_V : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    max_bin_count_11_V : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    max_bin_count_12_V : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    max_bin_count_13_V : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    max_bin_count_14_V : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    max_bin_count_15_V : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    max_bin_count_16_V : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    max_bin_count_17_V : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    max_bin_count_18_V : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    max_bin_count_19_V : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    max_bin_count_20_V : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    max_bin_count_21_V : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    max_bin_count_22_V : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    max_bin_count_23_V : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    max_bin_count_24_V : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    max_bin_count_25_V : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    max_bin_count_26_V : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    max_bin_count_27_V : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    max_bin_count_28_V : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    max_bin_count_29_V : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    max_bin_count_30_V : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    max_bin_count_31_V : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    max_bin_count_32_V : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    max_bin_count_33_V : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    max_bin_count_34_V : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    max_bin_count_35_V : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    max_bin_count_36_V : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    max_bin_count_37_V : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    max_bin_count_38_V : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    max_bin_count_39_V : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    max_bin_count_40_V : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    max_bin_count_41_V : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    max_bin_count_42_V : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    max_bin_count_43_V : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    max_bin_count_44_V : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    max_bin_count_45_V : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    max_bin_count_46_V : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    max_bin_count_47_V : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    max_bin_count_48_V : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    max_bin_count_49_V : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    max_bin_count_50_V : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    max_bin_count_51_V : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    max_bin_count_52_V : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    max_bin_count_53_V : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    max_bin_count_54_V : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    max_bin_count_55_V : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    max_bin_count_56_V : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    max_bin_count_57_V : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    max_bin_count_58_V : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    max_bin_count_59_V : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    max_bin_count_60_V : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    max_bin_count_61_V : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    max_bin_count_62_V : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    max_bin_count_63_V : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    max_bin_r_0_V : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
    max_bin_r_1_V : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
    max_bin_r_2_V : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
    max_bin_r_3_V : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
    max_bin_r_4_V : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
    max_bin_r_5_V : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
    max_bin_r_6_V : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
    max_bin_r_7_V : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
    max_bin_r_8_V : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
    max_bin_r_9_V : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
    max_bin_r_10_V : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
    max_bin_r_11_V : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
    max_bin_r_12_V : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
    max_bin_r_13_V : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
    max_bin_r_14_V : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
    max_bin_r_15_V : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
    max_bin_r_16_V : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
    max_bin_r_17_V : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
    max_bin_r_18_V : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
    max_bin_r_19_V : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
    max_bin_r_20_V : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
    max_bin_r_21_V : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
    max_bin_r_22_V : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
    max_bin_r_23_V : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
    max_bin_r_24_V : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
    max_bin_r_25_V : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
    max_bin_r_26_V : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
    max_bin_r_27_V : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
    max_bin_r_28_V : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
    max_bin_r_29_V : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
    max_bin_r_30_V : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
    max_bin_r_31_V : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
    max_bin_r_32_V : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
    max_bin_r_33_V : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
    max_bin_r_34_V : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
    max_bin_r_35_V : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
    max_bin_r_36_V : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
    max_bin_r_37_V : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
    max_bin_r_38_V : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
    max_bin_r_39_V : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
    max_bin_r_40_V : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
    max_bin_r_41_V : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
    max_bin_r_42_V : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
    max_bin_r_43_V : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
    max_bin_r_44_V : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
    max_bin_r_45_V : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
    max_bin_r_46_V : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
    max_bin_r_47_V : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
    max_bin_r_48_V : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
    max_bin_r_49_V : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
    max_bin_r_50_V : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
    max_bin_r_51_V : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
    max_bin_r_52_V : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
    max_bin_r_53_V : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
    max_bin_r_54_V : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
    max_bin_r_55_V : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
    max_bin_r_56_V : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
    max_bin_r_57_V : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
    max_bin_r_58_V : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
    max_bin_r_59_V : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
    max_bin_r_60_V : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
    max_bin_r_61_V : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
    max_bin_r_62_V : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
    max_bin_r_63_V : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
    hls_LT_theta_global_V : OUT STD_LOGIC_VECTOR(13 DOWNTO 0);
    hls_LT_r_global_V : OUT STD_LOGIC_VECTOR(21 DOWNTO 0);
    hls_LT_theta_V : OUT STD_LOGIC_VECTOR(13 DOWNTO 0);
    hls_LT_r_V : OUT STD_LOGIC_VECTOR(21 DOWNTO 0);
    res_max_bin_count_V : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    res_max_bin_theta_V : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
    res_max_bin_r_V : OUT STD_LOGIC_VECTOR(6 DOWNTO 0)
  );
END hls_find_max_bin;

ARCHITECTURE hls_find_max_bin_arch OF hls_find_max_bin IS
  ATTRIBUTE DowngradeIPIdentifiedWarnings : STRING;
  ATTRIBUTE DowngradeIPIdentifiedWarnings OF hls_find_max_bin_arch: ARCHITECTURE IS "yes";
  COMPONENT find_max_bin IS
    PORT (
      hls_LT_theta_global_V_ap_vld : OUT STD_LOGIC;
      hls_LT_r_global_V_ap_vld : OUT STD_LOGIC;
      hls_LT_theta_V_ap_vld : OUT STD_LOGIC;
      hls_LT_r_V_ap_vld : OUT STD_LOGIC;
      res_max_bin_count_V_ap_vld : OUT STD_LOGIC;
      res_max_bin_theta_V_ap_vld : OUT STD_LOGIC;
      res_max_bin_r_V_ap_vld : OUT STD_LOGIC;
      ap_clk : IN STD_LOGIC;
      ap_rst : IN STD_LOGIC;
      ap_start : IN STD_LOGIC;
      ap_done : OUT STD_LOGIC;
      ap_idle : OUT STD_LOGIC;
      ap_ready : OUT STD_LOGIC;
      slcvec_angle_polar_offset_mrad_V : IN STD_LOGIC_VECTOR(13 DOWNTO 0);
      roi_seed_r_V : IN STD_LOGIC_VECTOR(21 DOWNTO 0);
      max_bin_count_0_V : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      max_bin_count_1_V : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      max_bin_count_2_V : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      max_bin_count_3_V : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      max_bin_count_4_V : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      max_bin_count_5_V : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      max_bin_count_6_V : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      max_bin_count_7_V : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      max_bin_count_8_V : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      max_bin_count_9_V : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      max_bin_count_10_V : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      max_bin_count_11_V : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      max_bin_count_12_V : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      max_bin_count_13_V : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      max_bin_count_14_V : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      max_bin_count_15_V : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      max_bin_count_16_V : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      max_bin_count_17_V : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      max_bin_count_18_V : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      max_bin_count_19_V : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      max_bin_count_20_V : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      max_bin_count_21_V : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      max_bin_count_22_V : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      max_bin_count_23_V : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      max_bin_count_24_V : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      max_bin_count_25_V : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      max_bin_count_26_V : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      max_bin_count_27_V : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      max_bin_count_28_V : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      max_bin_count_29_V : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      max_bin_count_30_V : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      max_bin_count_31_V : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      max_bin_count_32_V : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      max_bin_count_33_V : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      max_bin_count_34_V : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      max_bin_count_35_V : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      max_bin_count_36_V : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      max_bin_count_37_V : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      max_bin_count_38_V : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      max_bin_count_39_V : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      max_bin_count_40_V : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      max_bin_count_41_V : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      max_bin_count_42_V : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      max_bin_count_43_V : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      max_bin_count_44_V : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      max_bin_count_45_V : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      max_bin_count_46_V : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      max_bin_count_47_V : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      max_bin_count_48_V : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      max_bin_count_49_V : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      max_bin_count_50_V : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      max_bin_count_51_V : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      max_bin_count_52_V : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      max_bin_count_53_V : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      max_bin_count_54_V : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      max_bin_count_55_V : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      max_bin_count_56_V : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      max_bin_count_57_V : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      max_bin_count_58_V : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      max_bin_count_59_V : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      max_bin_count_60_V : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      max_bin_count_61_V : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      max_bin_count_62_V : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      max_bin_count_63_V : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      max_bin_r_0_V : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
      max_bin_r_1_V : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
      max_bin_r_2_V : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
      max_bin_r_3_V : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
      max_bin_r_4_V : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
      max_bin_r_5_V : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
      max_bin_r_6_V : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
      max_bin_r_7_V : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
      max_bin_r_8_V : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
      max_bin_r_9_V : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
      max_bin_r_10_V : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
      max_bin_r_11_V : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
      max_bin_r_12_V : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
      max_bin_r_13_V : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
      max_bin_r_14_V : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
      max_bin_r_15_V : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
      max_bin_r_16_V : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
      max_bin_r_17_V : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
      max_bin_r_18_V : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
      max_bin_r_19_V : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
      max_bin_r_20_V : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
      max_bin_r_21_V : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
      max_bin_r_22_V : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
      max_bin_r_23_V : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
      max_bin_r_24_V : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
      max_bin_r_25_V : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
      max_bin_r_26_V : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
      max_bin_r_27_V : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
      max_bin_r_28_V : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
      max_bin_r_29_V : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
      max_bin_r_30_V : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
      max_bin_r_31_V : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
      max_bin_r_32_V : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
      max_bin_r_33_V : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
      max_bin_r_34_V : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
      max_bin_r_35_V : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
      max_bin_r_36_V : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
      max_bin_r_37_V : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
      max_bin_r_38_V : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
      max_bin_r_39_V : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
      max_bin_r_40_V : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
      max_bin_r_41_V : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
      max_bin_r_42_V : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
      max_bin_r_43_V : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
      max_bin_r_44_V : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
      max_bin_r_45_V : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
      max_bin_r_46_V : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
      max_bin_r_47_V : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
      max_bin_r_48_V : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
      max_bin_r_49_V : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
      max_bin_r_50_V : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
      max_bin_r_51_V : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
      max_bin_r_52_V : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
      max_bin_r_53_V : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
      max_bin_r_54_V : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
      max_bin_r_55_V : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
      max_bin_r_56_V : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
      max_bin_r_57_V : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
      max_bin_r_58_V : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
      max_bin_r_59_V : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
      max_bin_r_60_V : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
      max_bin_r_61_V : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
      max_bin_r_62_V : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
      max_bin_r_63_V : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
      hls_LT_theta_global_V : OUT STD_LOGIC_VECTOR(13 DOWNTO 0);
      hls_LT_r_global_V : OUT STD_LOGIC_VECTOR(21 DOWNTO 0);
      hls_LT_theta_V : OUT STD_LOGIC_VECTOR(13 DOWNTO 0);
      hls_LT_r_V : OUT STD_LOGIC_VECTOR(21 DOWNTO 0);
      res_max_bin_count_V : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      res_max_bin_theta_V : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
      res_max_bin_r_V : OUT STD_LOGIC_VECTOR(6 DOWNTO 0)
    );
  END COMPONENT find_max_bin;
  ATTRIBUTE X_CORE_INFO : STRING;
  ATTRIBUTE X_CORE_INFO OF hls_find_max_bin_arch: ARCHITECTURE IS "find_max_bin,Vivado 2019.2.1";
  ATTRIBUTE CHECK_LICENSE_TYPE : STRING;
  ATTRIBUTE CHECK_LICENSE_TYPE OF hls_find_max_bin_arch : ARCHITECTURE IS "hls_find_max_bin,find_max_bin,{}";
  ATTRIBUTE CORE_GENERATION_INFO : STRING;
  ATTRIBUTE CORE_GENERATION_INFO OF hls_find_max_bin_arch: ARCHITECTURE IS "hls_find_max_bin,find_max_bin,{x_ipProduct=Vivado 2019.2.1,x_ipVendor=xilinx.com,x_ipLibrary=hls,x_ipName=find_max_bin,x_ipVersion=1.0,x_ipCoreRevision=2103241758,x_ipLanguage=VHDL,x_ipSimLanguage=MIXED}";
  ATTRIBUTE IP_DEFINITION_SOURCE : STRING;
  ATTRIBUTE IP_DEFINITION_SOURCE OF hls_find_max_bin_arch: ARCHITECTURE IS "HLS";
  ATTRIBUTE X_INTERFACE_INFO : STRING;
  ATTRIBUTE X_INTERFACE_PARAMETER : STRING;
  ATTRIBUTE X_INTERFACE_PARAMETER OF res_max_bin_r_V: SIGNAL IS "XIL_INTERFACENAME res_max_bin_r_V, LAYERED_METADATA undef";
  ATTRIBUTE X_INTERFACE_INFO OF res_max_bin_r_V: SIGNAL IS "xilinx.com:signal:data:1.0 res_max_bin_r_V DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF res_max_bin_theta_V: SIGNAL IS "XIL_INTERFACENAME res_max_bin_theta_V, LAYERED_METADATA undef";
  ATTRIBUTE X_INTERFACE_INFO OF res_max_bin_theta_V: SIGNAL IS "xilinx.com:signal:data:1.0 res_max_bin_theta_V DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF res_max_bin_count_V: SIGNAL IS "XIL_INTERFACENAME res_max_bin_count_V, LAYERED_METADATA undef";
  ATTRIBUTE X_INTERFACE_INFO OF res_max_bin_count_V: SIGNAL IS "xilinx.com:signal:data:1.0 res_max_bin_count_V DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF hls_LT_r_V: SIGNAL IS "XIL_INTERFACENAME hls_LT_r_V, LAYERED_METADATA undef";
  ATTRIBUTE X_INTERFACE_INFO OF hls_LT_r_V: SIGNAL IS "xilinx.com:signal:data:1.0 hls_LT_r_V DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF hls_LT_theta_V: SIGNAL IS "XIL_INTERFACENAME hls_LT_theta_V, LAYERED_METADATA undef";
  ATTRIBUTE X_INTERFACE_INFO OF hls_LT_theta_V: SIGNAL IS "xilinx.com:signal:data:1.0 hls_LT_theta_V DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF hls_LT_r_global_V: SIGNAL IS "XIL_INTERFACENAME hls_LT_r_global_V, LAYERED_METADATA undef";
  ATTRIBUTE X_INTERFACE_INFO OF hls_LT_r_global_V: SIGNAL IS "xilinx.com:signal:data:1.0 hls_LT_r_global_V DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF hls_LT_theta_global_V: SIGNAL IS "XIL_INTERFACENAME hls_LT_theta_global_V, LAYERED_METADATA undef";
  ATTRIBUTE X_INTERFACE_INFO OF hls_LT_theta_global_V: SIGNAL IS "xilinx.com:signal:data:1.0 hls_LT_theta_global_V DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF max_bin_r_63_V: SIGNAL IS "XIL_INTERFACENAME max_bin_r_63_V, LAYERED_METADATA undef";
  ATTRIBUTE X_INTERFACE_INFO OF max_bin_r_63_V: SIGNAL IS "xilinx.com:signal:data:1.0 max_bin_r_63_V DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF max_bin_r_62_V: SIGNAL IS "XIL_INTERFACENAME max_bin_r_62_V, LAYERED_METADATA undef";
  ATTRIBUTE X_INTERFACE_INFO OF max_bin_r_62_V: SIGNAL IS "xilinx.com:signal:data:1.0 max_bin_r_62_V DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF max_bin_r_61_V: SIGNAL IS "XIL_INTERFACENAME max_bin_r_61_V, LAYERED_METADATA undef";
  ATTRIBUTE X_INTERFACE_INFO OF max_bin_r_61_V: SIGNAL IS "xilinx.com:signal:data:1.0 max_bin_r_61_V DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF max_bin_r_60_V: SIGNAL IS "XIL_INTERFACENAME max_bin_r_60_V, LAYERED_METADATA undef";
  ATTRIBUTE X_INTERFACE_INFO OF max_bin_r_60_V: SIGNAL IS "xilinx.com:signal:data:1.0 max_bin_r_60_V DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF max_bin_r_59_V: SIGNAL IS "XIL_INTERFACENAME max_bin_r_59_V, LAYERED_METADATA undef";
  ATTRIBUTE X_INTERFACE_INFO OF max_bin_r_59_V: SIGNAL IS "xilinx.com:signal:data:1.0 max_bin_r_59_V DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF max_bin_r_58_V: SIGNAL IS "XIL_INTERFACENAME max_bin_r_58_V, LAYERED_METADATA undef";
  ATTRIBUTE X_INTERFACE_INFO OF max_bin_r_58_V: SIGNAL IS "xilinx.com:signal:data:1.0 max_bin_r_58_V DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF max_bin_r_57_V: SIGNAL IS "XIL_INTERFACENAME max_bin_r_57_V, LAYERED_METADATA undef";
  ATTRIBUTE X_INTERFACE_INFO OF max_bin_r_57_V: SIGNAL IS "xilinx.com:signal:data:1.0 max_bin_r_57_V DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF max_bin_r_56_V: SIGNAL IS "XIL_INTERFACENAME max_bin_r_56_V, LAYERED_METADATA undef";
  ATTRIBUTE X_INTERFACE_INFO OF max_bin_r_56_V: SIGNAL IS "xilinx.com:signal:data:1.0 max_bin_r_56_V DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF max_bin_r_55_V: SIGNAL IS "XIL_INTERFACENAME max_bin_r_55_V, LAYERED_METADATA undef";
  ATTRIBUTE X_INTERFACE_INFO OF max_bin_r_55_V: SIGNAL IS "xilinx.com:signal:data:1.0 max_bin_r_55_V DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF max_bin_r_54_V: SIGNAL IS "XIL_INTERFACENAME max_bin_r_54_V, LAYERED_METADATA undef";
  ATTRIBUTE X_INTERFACE_INFO OF max_bin_r_54_V: SIGNAL IS "xilinx.com:signal:data:1.0 max_bin_r_54_V DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF max_bin_r_53_V: SIGNAL IS "XIL_INTERFACENAME max_bin_r_53_V, LAYERED_METADATA undef";
  ATTRIBUTE X_INTERFACE_INFO OF max_bin_r_53_V: SIGNAL IS "xilinx.com:signal:data:1.0 max_bin_r_53_V DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF max_bin_r_52_V: SIGNAL IS "XIL_INTERFACENAME max_bin_r_52_V, LAYERED_METADATA undef";
  ATTRIBUTE X_INTERFACE_INFO OF max_bin_r_52_V: SIGNAL IS "xilinx.com:signal:data:1.0 max_bin_r_52_V DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF max_bin_r_51_V: SIGNAL IS "XIL_INTERFACENAME max_bin_r_51_V, LAYERED_METADATA undef";
  ATTRIBUTE X_INTERFACE_INFO OF max_bin_r_51_V: SIGNAL IS "xilinx.com:signal:data:1.0 max_bin_r_51_V DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF max_bin_r_50_V: SIGNAL IS "XIL_INTERFACENAME max_bin_r_50_V, LAYERED_METADATA undef";
  ATTRIBUTE X_INTERFACE_INFO OF max_bin_r_50_V: SIGNAL IS "xilinx.com:signal:data:1.0 max_bin_r_50_V DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF max_bin_r_49_V: SIGNAL IS "XIL_INTERFACENAME max_bin_r_49_V, LAYERED_METADATA undef";
  ATTRIBUTE X_INTERFACE_INFO OF max_bin_r_49_V: SIGNAL IS "xilinx.com:signal:data:1.0 max_bin_r_49_V DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF max_bin_r_48_V: SIGNAL IS "XIL_INTERFACENAME max_bin_r_48_V, LAYERED_METADATA undef";
  ATTRIBUTE X_INTERFACE_INFO OF max_bin_r_48_V: SIGNAL IS "xilinx.com:signal:data:1.0 max_bin_r_48_V DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF max_bin_r_47_V: SIGNAL IS "XIL_INTERFACENAME max_bin_r_47_V, LAYERED_METADATA undef";
  ATTRIBUTE X_INTERFACE_INFO OF max_bin_r_47_V: SIGNAL IS "xilinx.com:signal:data:1.0 max_bin_r_47_V DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF max_bin_r_46_V: SIGNAL IS "XIL_INTERFACENAME max_bin_r_46_V, LAYERED_METADATA undef";
  ATTRIBUTE X_INTERFACE_INFO OF max_bin_r_46_V: SIGNAL IS "xilinx.com:signal:data:1.0 max_bin_r_46_V DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF max_bin_r_45_V: SIGNAL IS "XIL_INTERFACENAME max_bin_r_45_V, LAYERED_METADATA undef";
  ATTRIBUTE X_INTERFACE_INFO OF max_bin_r_45_V: SIGNAL IS "xilinx.com:signal:data:1.0 max_bin_r_45_V DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF max_bin_r_44_V: SIGNAL IS "XIL_INTERFACENAME max_bin_r_44_V, LAYERED_METADATA undef";
  ATTRIBUTE X_INTERFACE_INFO OF max_bin_r_44_V: SIGNAL IS "xilinx.com:signal:data:1.0 max_bin_r_44_V DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF max_bin_r_43_V: SIGNAL IS "XIL_INTERFACENAME max_bin_r_43_V, LAYERED_METADATA undef";
  ATTRIBUTE X_INTERFACE_INFO OF max_bin_r_43_V: SIGNAL IS "xilinx.com:signal:data:1.0 max_bin_r_43_V DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF max_bin_r_42_V: SIGNAL IS "XIL_INTERFACENAME max_bin_r_42_V, LAYERED_METADATA undef";
  ATTRIBUTE X_INTERFACE_INFO OF max_bin_r_42_V: SIGNAL IS "xilinx.com:signal:data:1.0 max_bin_r_42_V DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF max_bin_r_41_V: SIGNAL IS "XIL_INTERFACENAME max_bin_r_41_V, LAYERED_METADATA undef";
  ATTRIBUTE X_INTERFACE_INFO OF max_bin_r_41_V: SIGNAL IS "xilinx.com:signal:data:1.0 max_bin_r_41_V DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF max_bin_r_40_V: SIGNAL IS "XIL_INTERFACENAME max_bin_r_40_V, LAYERED_METADATA undef";
  ATTRIBUTE X_INTERFACE_INFO OF max_bin_r_40_V: SIGNAL IS "xilinx.com:signal:data:1.0 max_bin_r_40_V DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF max_bin_r_39_V: SIGNAL IS "XIL_INTERFACENAME max_bin_r_39_V, LAYERED_METADATA undef";
  ATTRIBUTE X_INTERFACE_INFO OF max_bin_r_39_V: SIGNAL IS "xilinx.com:signal:data:1.0 max_bin_r_39_V DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF max_bin_r_38_V: SIGNAL IS "XIL_INTERFACENAME max_bin_r_38_V, LAYERED_METADATA undef";
  ATTRIBUTE X_INTERFACE_INFO OF max_bin_r_38_V: SIGNAL IS "xilinx.com:signal:data:1.0 max_bin_r_38_V DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF max_bin_r_37_V: SIGNAL IS "XIL_INTERFACENAME max_bin_r_37_V, LAYERED_METADATA undef";
  ATTRIBUTE X_INTERFACE_INFO OF max_bin_r_37_V: SIGNAL IS "xilinx.com:signal:data:1.0 max_bin_r_37_V DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF max_bin_r_36_V: SIGNAL IS "XIL_INTERFACENAME max_bin_r_36_V, LAYERED_METADATA undef";
  ATTRIBUTE X_INTERFACE_INFO OF max_bin_r_36_V: SIGNAL IS "xilinx.com:signal:data:1.0 max_bin_r_36_V DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF max_bin_r_35_V: SIGNAL IS "XIL_INTERFACENAME max_bin_r_35_V, LAYERED_METADATA undef";
  ATTRIBUTE X_INTERFACE_INFO OF max_bin_r_35_V: SIGNAL IS "xilinx.com:signal:data:1.0 max_bin_r_35_V DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF max_bin_r_34_V: SIGNAL IS "XIL_INTERFACENAME max_bin_r_34_V, LAYERED_METADATA undef";
  ATTRIBUTE X_INTERFACE_INFO OF max_bin_r_34_V: SIGNAL IS "xilinx.com:signal:data:1.0 max_bin_r_34_V DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF max_bin_r_33_V: SIGNAL IS "XIL_INTERFACENAME max_bin_r_33_V, LAYERED_METADATA undef";
  ATTRIBUTE X_INTERFACE_INFO OF max_bin_r_33_V: SIGNAL IS "xilinx.com:signal:data:1.0 max_bin_r_33_V DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF max_bin_r_32_V: SIGNAL IS "XIL_INTERFACENAME max_bin_r_32_V, LAYERED_METADATA undef";
  ATTRIBUTE X_INTERFACE_INFO OF max_bin_r_32_V: SIGNAL IS "xilinx.com:signal:data:1.0 max_bin_r_32_V DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF max_bin_r_31_V: SIGNAL IS "XIL_INTERFACENAME max_bin_r_31_V, LAYERED_METADATA undef";
  ATTRIBUTE X_INTERFACE_INFO OF max_bin_r_31_V: SIGNAL IS "xilinx.com:signal:data:1.0 max_bin_r_31_V DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF max_bin_r_30_V: SIGNAL IS "XIL_INTERFACENAME max_bin_r_30_V, LAYERED_METADATA undef";
  ATTRIBUTE X_INTERFACE_INFO OF max_bin_r_30_V: SIGNAL IS "xilinx.com:signal:data:1.0 max_bin_r_30_V DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF max_bin_r_29_V: SIGNAL IS "XIL_INTERFACENAME max_bin_r_29_V, LAYERED_METADATA undef";
  ATTRIBUTE X_INTERFACE_INFO OF max_bin_r_29_V: SIGNAL IS "xilinx.com:signal:data:1.0 max_bin_r_29_V DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF max_bin_r_28_V: SIGNAL IS "XIL_INTERFACENAME max_bin_r_28_V, LAYERED_METADATA undef";
  ATTRIBUTE X_INTERFACE_INFO OF max_bin_r_28_V: SIGNAL IS "xilinx.com:signal:data:1.0 max_bin_r_28_V DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF max_bin_r_27_V: SIGNAL IS "XIL_INTERFACENAME max_bin_r_27_V, LAYERED_METADATA undef";
  ATTRIBUTE X_INTERFACE_INFO OF max_bin_r_27_V: SIGNAL IS "xilinx.com:signal:data:1.0 max_bin_r_27_V DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF max_bin_r_26_V: SIGNAL IS "XIL_INTERFACENAME max_bin_r_26_V, LAYERED_METADATA undef";
  ATTRIBUTE X_INTERFACE_INFO OF max_bin_r_26_V: SIGNAL IS "xilinx.com:signal:data:1.0 max_bin_r_26_V DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF max_bin_r_25_V: SIGNAL IS "XIL_INTERFACENAME max_bin_r_25_V, LAYERED_METADATA undef";
  ATTRIBUTE X_INTERFACE_INFO OF max_bin_r_25_V: SIGNAL IS "xilinx.com:signal:data:1.0 max_bin_r_25_V DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF max_bin_r_24_V: SIGNAL IS "XIL_INTERFACENAME max_bin_r_24_V, LAYERED_METADATA undef";
  ATTRIBUTE X_INTERFACE_INFO OF max_bin_r_24_V: SIGNAL IS "xilinx.com:signal:data:1.0 max_bin_r_24_V DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF max_bin_r_23_V: SIGNAL IS "XIL_INTERFACENAME max_bin_r_23_V, LAYERED_METADATA undef";
  ATTRIBUTE X_INTERFACE_INFO OF max_bin_r_23_V: SIGNAL IS "xilinx.com:signal:data:1.0 max_bin_r_23_V DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF max_bin_r_22_V: SIGNAL IS "XIL_INTERFACENAME max_bin_r_22_V, LAYERED_METADATA undef";
  ATTRIBUTE X_INTERFACE_INFO OF max_bin_r_22_V: SIGNAL IS "xilinx.com:signal:data:1.0 max_bin_r_22_V DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF max_bin_r_21_V: SIGNAL IS "XIL_INTERFACENAME max_bin_r_21_V, LAYERED_METADATA undef";
  ATTRIBUTE X_INTERFACE_INFO OF max_bin_r_21_V: SIGNAL IS "xilinx.com:signal:data:1.0 max_bin_r_21_V DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF max_bin_r_20_V: SIGNAL IS "XIL_INTERFACENAME max_bin_r_20_V, LAYERED_METADATA undef";
  ATTRIBUTE X_INTERFACE_INFO OF max_bin_r_20_V: SIGNAL IS "xilinx.com:signal:data:1.0 max_bin_r_20_V DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF max_bin_r_19_V: SIGNAL IS "XIL_INTERFACENAME max_bin_r_19_V, LAYERED_METADATA undef";
  ATTRIBUTE X_INTERFACE_INFO OF max_bin_r_19_V: SIGNAL IS "xilinx.com:signal:data:1.0 max_bin_r_19_V DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF max_bin_r_18_V: SIGNAL IS "XIL_INTERFACENAME max_bin_r_18_V, LAYERED_METADATA undef";
  ATTRIBUTE X_INTERFACE_INFO OF max_bin_r_18_V: SIGNAL IS "xilinx.com:signal:data:1.0 max_bin_r_18_V DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF max_bin_r_17_V: SIGNAL IS "XIL_INTERFACENAME max_bin_r_17_V, LAYERED_METADATA undef";
  ATTRIBUTE X_INTERFACE_INFO OF max_bin_r_17_V: SIGNAL IS "xilinx.com:signal:data:1.0 max_bin_r_17_V DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF max_bin_r_16_V: SIGNAL IS "XIL_INTERFACENAME max_bin_r_16_V, LAYERED_METADATA undef";
  ATTRIBUTE X_INTERFACE_INFO OF max_bin_r_16_V: SIGNAL IS "xilinx.com:signal:data:1.0 max_bin_r_16_V DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF max_bin_r_15_V: SIGNAL IS "XIL_INTERFACENAME max_bin_r_15_V, LAYERED_METADATA undef";
  ATTRIBUTE X_INTERFACE_INFO OF max_bin_r_15_V: SIGNAL IS "xilinx.com:signal:data:1.0 max_bin_r_15_V DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF max_bin_r_14_V: SIGNAL IS "XIL_INTERFACENAME max_bin_r_14_V, LAYERED_METADATA undef";
  ATTRIBUTE X_INTERFACE_INFO OF max_bin_r_14_V: SIGNAL IS "xilinx.com:signal:data:1.0 max_bin_r_14_V DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF max_bin_r_13_V: SIGNAL IS "XIL_INTERFACENAME max_bin_r_13_V, LAYERED_METADATA undef";
  ATTRIBUTE X_INTERFACE_INFO OF max_bin_r_13_V: SIGNAL IS "xilinx.com:signal:data:1.0 max_bin_r_13_V DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF max_bin_r_12_V: SIGNAL IS "XIL_INTERFACENAME max_bin_r_12_V, LAYERED_METADATA undef";
  ATTRIBUTE X_INTERFACE_INFO OF max_bin_r_12_V: SIGNAL IS "xilinx.com:signal:data:1.0 max_bin_r_12_V DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF max_bin_r_11_V: SIGNAL IS "XIL_INTERFACENAME max_bin_r_11_V, LAYERED_METADATA undef";
  ATTRIBUTE X_INTERFACE_INFO OF max_bin_r_11_V: SIGNAL IS "xilinx.com:signal:data:1.0 max_bin_r_11_V DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF max_bin_r_10_V: SIGNAL IS "XIL_INTERFACENAME max_bin_r_10_V, LAYERED_METADATA undef";
  ATTRIBUTE X_INTERFACE_INFO OF max_bin_r_10_V: SIGNAL IS "xilinx.com:signal:data:1.0 max_bin_r_10_V DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF max_bin_r_9_V: SIGNAL IS "XIL_INTERFACENAME max_bin_r_9_V, LAYERED_METADATA undef";
  ATTRIBUTE X_INTERFACE_INFO OF max_bin_r_9_V: SIGNAL IS "xilinx.com:signal:data:1.0 max_bin_r_9_V DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF max_bin_r_8_V: SIGNAL IS "XIL_INTERFACENAME max_bin_r_8_V, LAYERED_METADATA undef";
  ATTRIBUTE X_INTERFACE_INFO OF max_bin_r_8_V: SIGNAL IS "xilinx.com:signal:data:1.0 max_bin_r_8_V DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF max_bin_r_7_V: SIGNAL IS "XIL_INTERFACENAME max_bin_r_7_V, LAYERED_METADATA undef";
  ATTRIBUTE X_INTERFACE_INFO OF max_bin_r_7_V: SIGNAL IS "xilinx.com:signal:data:1.0 max_bin_r_7_V DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF max_bin_r_6_V: SIGNAL IS "XIL_INTERFACENAME max_bin_r_6_V, LAYERED_METADATA undef";
  ATTRIBUTE X_INTERFACE_INFO OF max_bin_r_6_V: SIGNAL IS "xilinx.com:signal:data:1.0 max_bin_r_6_V DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF max_bin_r_5_V: SIGNAL IS "XIL_INTERFACENAME max_bin_r_5_V, LAYERED_METADATA undef";
  ATTRIBUTE X_INTERFACE_INFO OF max_bin_r_5_V: SIGNAL IS "xilinx.com:signal:data:1.0 max_bin_r_5_V DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF max_bin_r_4_V: SIGNAL IS "XIL_INTERFACENAME max_bin_r_4_V, LAYERED_METADATA undef";
  ATTRIBUTE X_INTERFACE_INFO OF max_bin_r_4_V: SIGNAL IS "xilinx.com:signal:data:1.0 max_bin_r_4_V DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF max_bin_r_3_V: SIGNAL IS "XIL_INTERFACENAME max_bin_r_3_V, LAYERED_METADATA undef";
  ATTRIBUTE X_INTERFACE_INFO OF max_bin_r_3_V: SIGNAL IS "xilinx.com:signal:data:1.0 max_bin_r_3_V DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF max_bin_r_2_V: SIGNAL IS "XIL_INTERFACENAME max_bin_r_2_V, LAYERED_METADATA undef";
  ATTRIBUTE X_INTERFACE_INFO OF max_bin_r_2_V: SIGNAL IS "xilinx.com:signal:data:1.0 max_bin_r_2_V DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF max_bin_r_1_V: SIGNAL IS "XIL_INTERFACENAME max_bin_r_1_V, LAYERED_METADATA undef";
  ATTRIBUTE X_INTERFACE_INFO OF max_bin_r_1_V: SIGNAL IS "xilinx.com:signal:data:1.0 max_bin_r_1_V DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF max_bin_r_0_V: SIGNAL IS "XIL_INTERFACENAME max_bin_r_0_V, LAYERED_METADATA undef";
  ATTRIBUTE X_INTERFACE_INFO OF max_bin_r_0_V: SIGNAL IS "xilinx.com:signal:data:1.0 max_bin_r_0_V DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF max_bin_count_63_V: SIGNAL IS "XIL_INTERFACENAME max_bin_count_63_V, LAYERED_METADATA undef";
  ATTRIBUTE X_INTERFACE_INFO OF max_bin_count_63_V: SIGNAL IS "xilinx.com:signal:data:1.0 max_bin_count_63_V DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF max_bin_count_62_V: SIGNAL IS "XIL_INTERFACENAME max_bin_count_62_V, LAYERED_METADATA undef";
  ATTRIBUTE X_INTERFACE_INFO OF max_bin_count_62_V: SIGNAL IS "xilinx.com:signal:data:1.0 max_bin_count_62_V DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF max_bin_count_61_V: SIGNAL IS "XIL_INTERFACENAME max_bin_count_61_V, LAYERED_METADATA undef";
  ATTRIBUTE X_INTERFACE_INFO OF max_bin_count_61_V: SIGNAL IS "xilinx.com:signal:data:1.0 max_bin_count_61_V DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF max_bin_count_60_V: SIGNAL IS "XIL_INTERFACENAME max_bin_count_60_V, LAYERED_METADATA undef";
  ATTRIBUTE X_INTERFACE_INFO OF max_bin_count_60_V: SIGNAL IS "xilinx.com:signal:data:1.0 max_bin_count_60_V DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF max_bin_count_59_V: SIGNAL IS "XIL_INTERFACENAME max_bin_count_59_V, LAYERED_METADATA undef";
  ATTRIBUTE X_INTERFACE_INFO OF max_bin_count_59_V: SIGNAL IS "xilinx.com:signal:data:1.0 max_bin_count_59_V DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF max_bin_count_58_V: SIGNAL IS "XIL_INTERFACENAME max_bin_count_58_V, LAYERED_METADATA undef";
  ATTRIBUTE X_INTERFACE_INFO OF max_bin_count_58_V: SIGNAL IS "xilinx.com:signal:data:1.0 max_bin_count_58_V DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF max_bin_count_57_V: SIGNAL IS "XIL_INTERFACENAME max_bin_count_57_V, LAYERED_METADATA undef";
  ATTRIBUTE X_INTERFACE_INFO OF max_bin_count_57_V: SIGNAL IS "xilinx.com:signal:data:1.0 max_bin_count_57_V DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF max_bin_count_56_V: SIGNAL IS "XIL_INTERFACENAME max_bin_count_56_V, LAYERED_METADATA undef";
  ATTRIBUTE X_INTERFACE_INFO OF max_bin_count_56_V: SIGNAL IS "xilinx.com:signal:data:1.0 max_bin_count_56_V DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF max_bin_count_55_V: SIGNAL IS "XIL_INTERFACENAME max_bin_count_55_V, LAYERED_METADATA undef";
  ATTRIBUTE X_INTERFACE_INFO OF max_bin_count_55_V: SIGNAL IS "xilinx.com:signal:data:1.0 max_bin_count_55_V DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF max_bin_count_54_V: SIGNAL IS "XIL_INTERFACENAME max_bin_count_54_V, LAYERED_METADATA undef";
  ATTRIBUTE X_INTERFACE_INFO OF max_bin_count_54_V: SIGNAL IS "xilinx.com:signal:data:1.0 max_bin_count_54_V DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF max_bin_count_53_V: SIGNAL IS "XIL_INTERFACENAME max_bin_count_53_V, LAYERED_METADATA undef";
  ATTRIBUTE X_INTERFACE_INFO OF max_bin_count_53_V: SIGNAL IS "xilinx.com:signal:data:1.0 max_bin_count_53_V DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF max_bin_count_52_V: SIGNAL IS "XIL_INTERFACENAME max_bin_count_52_V, LAYERED_METADATA undef";
  ATTRIBUTE X_INTERFACE_INFO OF max_bin_count_52_V: SIGNAL IS "xilinx.com:signal:data:1.0 max_bin_count_52_V DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF max_bin_count_51_V: SIGNAL IS "XIL_INTERFACENAME max_bin_count_51_V, LAYERED_METADATA undef";
  ATTRIBUTE X_INTERFACE_INFO OF max_bin_count_51_V: SIGNAL IS "xilinx.com:signal:data:1.0 max_bin_count_51_V DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF max_bin_count_50_V: SIGNAL IS "XIL_INTERFACENAME max_bin_count_50_V, LAYERED_METADATA undef";
  ATTRIBUTE X_INTERFACE_INFO OF max_bin_count_50_V: SIGNAL IS "xilinx.com:signal:data:1.0 max_bin_count_50_V DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF max_bin_count_49_V: SIGNAL IS "XIL_INTERFACENAME max_bin_count_49_V, LAYERED_METADATA undef";
  ATTRIBUTE X_INTERFACE_INFO OF max_bin_count_49_V: SIGNAL IS "xilinx.com:signal:data:1.0 max_bin_count_49_V DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF max_bin_count_48_V: SIGNAL IS "XIL_INTERFACENAME max_bin_count_48_V, LAYERED_METADATA undef";
  ATTRIBUTE X_INTERFACE_INFO OF max_bin_count_48_V: SIGNAL IS "xilinx.com:signal:data:1.0 max_bin_count_48_V DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF max_bin_count_47_V: SIGNAL IS "XIL_INTERFACENAME max_bin_count_47_V, LAYERED_METADATA undef";
  ATTRIBUTE X_INTERFACE_INFO OF max_bin_count_47_V: SIGNAL IS "xilinx.com:signal:data:1.0 max_bin_count_47_V DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF max_bin_count_46_V: SIGNAL IS "XIL_INTERFACENAME max_bin_count_46_V, LAYERED_METADATA undef";
  ATTRIBUTE X_INTERFACE_INFO OF max_bin_count_46_V: SIGNAL IS "xilinx.com:signal:data:1.0 max_bin_count_46_V DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF max_bin_count_45_V: SIGNAL IS "XIL_INTERFACENAME max_bin_count_45_V, LAYERED_METADATA undef";
  ATTRIBUTE X_INTERFACE_INFO OF max_bin_count_45_V: SIGNAL IS "xilinx.com:signal:data:1.0 max_bin_count_45_V DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF max_bin_count_44_V: SIGNAL IS "XIL_INTERFACENAME max_bin_count_44_V, LAYERED_METADATA undef";
  ATTRIBUTE X_INTERFACE_INFO OF max_bin_count_44_V: SIGNAL IS "xilinx.com:signal:data:1.0 max_bin_count_44_V DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF max_bin_count_43_V: SIGNAL IS "XIL_INTERFACENAME max_bin_count_43_V, LAYERED_METADATA undef";
  ATTRIBUTE X_INTERFACE_INFO OF max_bin_count_43_V: SIGNAL IS "xilinx.com:signal:data:1.0 max_bin_count_43_V DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF max_bin_count_42_V: SIGNAL IS "XIL_INTERFACENAME max_bin_count_42_V, LAYERED_METADATA undef";
  ATTRIBUTE X_INTERFACE_INFO OF max_bin_count_42_V: SIGNAL IS "xilinx.com:signal:data:1.0 max_bin_count_42_V DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF max_bin_count_41_V: SIGNAL IS "XIL_INTERFACENAME max_bin_count_41_V, LAYERED_METADATA undef";
  ATTRIBUTE X_INTERFACE_INFO OF max_bin_count_41_V: SIGNAL IS "xilinx.com:signal:data:1.0 max_bin_count_41_V DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF max_bin_count_40_V: SIGNAL IS "XIL_INTERFACENAME max_bin_count_40_V, LAYERED_METADATA undef";
  ATTRIBUTE X_INTERFACE_INFO OF max_bin_count_40_V: SIGNAL IS "xilinx.com:signal:data:1.0 max_bin_count_40_V DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF max_bin_count_39_V: SIGNAL IS "XIL_INTERFACENAME max_bin_count_39_V, LAYERED_METADATA undef";
  ATTRIBUTE X_INTERFACE_INFO OF max_bin_count_39_V: SIGNAL IS "xilinx.com:signal:data:1.0 max_bin_count_39_V DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF max_bin_count_38_V: SIGNAL IS "XIL_INTERFACENAME max_bin_count_38_V, LAYERED_METADATA undef";
  ATTRIBUTE X_INTERFACE_INFO OF max_bin_count_38_V: SIGNAL IS "xilinx.com:signal:data:1.0 max_bin_count_38_V DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF max_bin_count_37_V: SIGNAL IS "XIL_INTERFACENAME max_bin_count_37_V, LAYERED_METADATA undef";
  ATTRIBUTE X_INTERFACE_INFO OF max_bin_count_37_V: SIGNAL IS "xilinx.com:signal:data:1.0 max_bin_count_37_V DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF max_bin_count_36_V: SIGNAL IS "XIL_INTERFACENAME max_bin_count_36_V, LAYERED_METADATA undef";
  ATTRIBUTE X_INTERFACE_INFO OF max_bin_count_36_V: SIGNAL IS "xilinx.com:signal:data:1.0 max_bin_count_36_V DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF max_bin_count_35_V: SIGNAL IS "XIL_INTERFACENAME max_bin_count_35_V, LAYERED_METADATA undef";
  ATTRIBUTE X_INTERFACE_INFO OF max_bin_count_35_V: SIGNAL IS "xilinx.com:signal:data:1.0 max_bin_count_35_V DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF max_bin_count_34_V: SIGNAL IS "XIL_INTERFACENAME max_bin_count_34_V, LAYERED_METADATA undef";
  ATTRIBUTE X_INTERFACE_INFO OF max_bin_count_34_V: SIGNAL IS "xilinx.com:signal:data:1.0 max_bin_count_34_V DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF max_bin_count_33_V: SIGNAL IS "XIL_INTERFACENAME max_bin_count_33_V, LAYERED_METADATA undef";
  ATTRIBUTE X_INTERFACE_INFO OF max_bin_count_33_V: SIGNAL IS "xilinx.com:signal:data:1.0 max_bin_count_33_V DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF max_bin_count_32_V: SIGNAL IS "XIL_INTERFACENAME max_bin_count_32_V, LAYERED_METADATA undef";
  ATTRIBUTE X_INTERFACE_INFO OF max_bin_count_32_V: SIGNAL IS "xilinx.com:signal:data:1.0 max_bin_count_32_V DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF max_bin_count_31_V: SIGNAL IS "XIL_INTERFACENAME max_bin_count_31_V, LAYERED_METADATA undef";
  ATTRIBUTE X_INTERFACE_INFO OF max_bin_count_31_V: SIGNAL IS "xilinx.com:signal:data:1.0 max_bin_count_31_V DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF max_bin_count_30_V: SIGNAL IS "XIL_INTERFACENAME max_bin_count_30_V, LAYERED_METADATA undef";
  ATTRIBUTE X_INTERFACE_INFO OF max_bin_count_30_V: SIGNAL IS "xilinx.com:signal:data:1.0 max_bin_count_30_V DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF max_bin_count_29_V: SIGNAL IS "XIL_INTERFACENAME max_bin_count_29_V, LAYERED_METADATA undef";
  ATTRIBUTE X_INTERFACE_INFO OF max_bin_count_29_V: SIGNAL IS "xilinx.com:signal:data:1.0 max_bin_count_29_V DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF max_bin_count_28_V: SIGNAL IS "XIL_INTERFACENAME max_bin_count_28_V, LAYERED_METADATA undef";
  ATTRIBUTE X_INTERFACE_INFO OF max_bin_count_28_V: SIGNAL IS "xilinx.com:signal:data:1.0 max_bin_count_28_V DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF max_bin_count_27_V: SIGNAL IS "XIL_INTERFACENAME max_bin_count_27_V, LAYERED_METADATA undef";
  ATTRIBUTE X_INTERFACE_INFO OF max_bin_count_27_V: SIGNAL IS "xilinx.com:signal:data:1.0 max_bin_count_27_V DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF max_bin_count_26_V: SIGNAL IS "XIL_INTERFACENAME max_bin_count_26_V, LAYERED_METADATA undef";
  ATTRIBUTE X_INTERFACE_INFO OF max_bin_count_26_V: SIGNAL IS "xilinx.com:signal:data:1.0 max_bin_count_26_V DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF max_bin_count_25_V: SIGNAL IS "XIL_INTERFACENAME max_bin_count_25_V, LAYERED_METADATA undef";
  ATTRIBUTE X_INTERFACE_INFO OF max_bin_count_25_V: SIGNAL IS "xilinx.com:signal:data:1.0 max_bin_count_25_V DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF max_bin_count_24_V: SIGNAL IS "XIL_INTERFACENAME max_bin_count_24_V, LAYERED_METADATA undef";
  ATTRIBUTE X_INTERFACE_INFO OF max_bin_count_24_V: SIGNAL IS "xilinx.com:signal:data:1.0 max_bin_count_24_V DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF max_bin_count_23_V: SIGNAL IS "XIL_INTERFACENAME max_bin_count_23_V, LAYERED_METADATA undef";
  ATTRIBUTE X_INTERFACE_INFO OF max_bin_count_23_V: SIGNAL IS "xilinx.com:signal:data:1.0 max_bin_count_23_V DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF max_bin_count_22_V: SIGNAL IS "XIL_INTERFACENAME max_bin_count_22_V, LAYERED_METADATA undef";
  ATTRIBUTE X_INTERFACE_INFO OF max_bin_count_22_V: SIGNAL IS "xilinx.com:signal:data:1.0 max_bin_count_22_V DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF max_bin_count_21_V: SIGNAL IS "XIL_INTERFACENAME max_bin_count_21_V, LAYERED_METADATA undef";
  ATTRIBUTE X_INTERFACE_INFO OF max_bin_count_21_V: SIGNAL IS "xilinx.com:signal:data:1.0 max_bin_count_21_V DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF max_bin_count_20_V: SIGNAL IS "XIL_INTERFACENAME max_bin_count_20_V, LAYERED_METADATA undef";
  ATTRIBUTE X_INTERFACE_INFO OF max_bin_count_20_V: SIGNAL IS "xilinx.com:signal:data:1.0 max_bin_count_20_V DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF max_bin_count_19_V: SIGNAL IS "XIL_INTERFACENAME max_bin_count_19_V, LAYERED_METADATA undef";
  ATTRIBUTE X_INTERFACE_INFO OF max_bin_count_19_V: SIGNAL IS "xilinx.com:signal:data:1.0 max_bin_count_19_V DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF max_bin_count_18_V: SIGNAL IS "XIL_INTERFACENAME max_bin_count_18_V, LAYERED_METADATA undef";
  ATTRIBUTE X_INTERFACE_INFO OF max_bin_count_18_V: SIGNAL IS "xilinx.com:signal:data:1.0 max_bin_count_18_V DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF max_bin_count_17_V: SIGNAL IS "XIL_INTERFACENAME max_bin_count_17_V, LAYERED_METADATA undef";
  ATTRIBUTE X_INTERFACE_INFO OF max_bin_count_17_V: SIGNAL IS "xilinx.com:signal:data:1.0 max_bin_count_17_V DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF max_bin_count_16_V: SIGNAL IS "XIL_INTERFACENAME max_bin_count_16_V, LAYERED_METADATA undef";
  ATTRIBUTE X_INTERFACE_INFO OF max_bin_count_16_V: SIGNAL IS "xilinx.com:signal:data:1.0 max_bin_count_16_V DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF max_bin_count_15_V: SIGNAL IS "XIL_INTERFACENAME max_bin_count_15_V, LAYERED_METADATA undef";
  ATTRIBUTE X_INTERFACE_INFO OF max_bin_count_15_V: SIGNAL IS "xilinx.com:signal:data:1.0 max_bin_count_15_V DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF max_bin_count_14_V: SIGNAL IS "XIL_INTERFACENAME max_bin_count_14_V, LAYERED_METADATA undef";
  ATTRIBUTE X_INTERFACE_INFO OF max_bin_count_14_V: SIGNAL IS "xilinx.com:signal:data:1.0 max_bin_count_14_V DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF max_bin_count_13_V: SIGNAL IS "XIL_INTERFACENAME max_bin_count_13_V, LAYERED_METADATA undef";
  ATTRIBUTE X_INTERFACE_INFO OF max_bin_count_13_V: SIGNAL IS "xilinx.com:signal:data:1.0 max_bin_count_13_V DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF max_bin_count_12_V: SIGNAL IS "XIL_INTERFACENAME max_bin_count_12_V, LAYERED_METADATA undef";
  ATTRIBUTE X_INTERFACE_INFO OF max_bin_count_12_V: SIGNAL IS "xilinx.com:signal:data:1.0 max_bin_count_12_V DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF max_bin_count_11_V: SIGNAL IS "XIL_INTERFACENAME max_bin_count_11_V, LAYERED_METADATA undef";
  ATTRIBUTE X_INTERFACE_INFO OF max_bin_count_11_V: SIGNAL IS "xilinx.com:signal:data:1.0 max_bin_count_11_V DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF max_bin_count_10_V: SIGNAL IS "XIL_INTERFACENAME max_bin_count_10_V, LAYERED_METADATA undef";
  ATTRIBUTE X_INTERFACE_INFO OF max_bin_count_10_V: SIGNAL IS "xilinx.com:signal:data:1.0 max_bin_count_10_V DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF max_bin_count_9_V: SIGNAL IS "XIL_INTERFACENAME max_bin_count_9_V, LAYERED_METADATA undef";
  ATTRIBUTE X_INTERFACE_INFO OF max_bin_count_9_V: SIGNAL IS "xilinx.com:signal:data:1.0 max_bin_count_9_V DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF max_bin_count_8_V: SIGNAL IS "XIL_INTERFACENAME max_bin_count_8_V, LAYERED_METADATA undef";
  ATTRIBUTE X_INTERFACE_INFO OF max_bin_count_8_V: SIGNAL IS "xilinx.com:signal:data:1.0 max_bin_count_8_V DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF max_bin_count_7_V: SIGNAL IS "XIL_INTERFACENAME max_bin_count_7_V, LAYERED_METADATA undef";
  ATTRIBUTE X_INTERFACE_INFO OF max_bin_count_7_V: SIGNAL IS "xilinx.com:signal:data:1.0 max_bin_count_7_V DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF max_bin_count_6_V: SIGNAL IS "XIL_INTERFACENAME max_bin_count_6_V, LAYERED_METADATA undef";
  ATTRIBUTE X_INTERFACE_INFO OF max_bin_count_6_V: SIGNAL IS "xilinx.com:signal:data:1.0 max_bin_count_6_V DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF max_bin_count_5_V: SIGNAL IS "XIL_INTERFACENAME max_bin_count_5_V, LAYERED_METADATA undef";
  ATTRIBUTE X_INTERFACE_INFO OF max_bin_count_5_V: SIGNAL IS "xilinx.com:signal:data:1.0 max_bin_count_5_V DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF max_bin_count_4_V: SIGNAL IS "XIL_INTERFACENAME max_bin_count_4_V, LAYERED_METADATA undef";
  ATTRIBUTE X_INTERFACE_INFO OF max_bin_count_4_V: SIGNAL IS "xilinx.com:signal:data:1.0 max_bin_count_4_V DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF max_bin_count_3_V: SIGNAL IS "XIL_INTERFACENAME max_bin_count_3_V, LAYERED_METADATA undef";
  ATTRIBUTE X_INTERFACE_INFO OF max_bin_count_3_V: SIGNAL IS "xilinx.com:signal:data:1.0 max_bin_count_3_V DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF max_bin_count_2_V: SIGNAL IS "XIL_INTERFACENAME max_bin_count_2_V, LAYERED_METADATA undef";
  ATTRIBUTE X_INTERFACE_INFO OF max_bin_count_2_V: SIGNAL IS "xilinx.com:signal:data:1.0 max_bin_count_2_V DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF max_bin_count_1_V: SIGNAL IS "XIL_INTERFACENAME max_bin_count_1_V, LAYERED_METADATA undef";
  ATTRIBUTE X_INTERFACE_INFO OF max_bin_count_1_V: SIGNAL IS "xilinx.com:signal:data:1.0 max_bin_count_1_V DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF max_bin_count_0_V: SIGNAL IS "XIL_INTERFACENAME max_bin_count_0_V, LAYERED_METADATA undef";
  ATTRIBUTE X_INTERFACE_INFO OF max_bin_count_0_V: SIGNAL IS "xilinx.com:signal:data:1.0 max_bin_count_0_V DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF roi_seed_r_V: SIGNAL IS "XIL_INTERFACENAME roi_seed_r_V, LAYERED_METADATA undef";
  ATTRIBUTE X_INTERFACE_INFO OF roi_seed_r_V: SIGNAL IS "xilinx.com:signal:data:1.0 roi_seed_r_V DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF slcvec_angle_polar_offset_mrad_V: SIGNAL IS "XIL_INTERFACENAME slcvec_angle_polar_offset_mrad_V, LAYERED_METADATA undef";
  ATTRIBUTE X_INTERFACE_INFO OF slcvec_angle_polar_offset_mrad_V: SIGNAL IS "xilinx.com:signal:data:1.0 slcvec_angle_polar_offset_mrad_V DATA";
  ATTRIBUTE X_INTERFACE_INFO OF ap_ready: SIGNAL IS "xilinx.com:interface:acc_handshake:1.0 ap_ctrl ready";
  ATTRIBUTE X_INTERFACE_INFO OF ap_idle: SIGNAL IS "xilinx.com:interface:acc_handshake:1.0 ap_ctrl idle";
  ATTRIBUTE X_INTERFACE_INFO OF ap_done: SIGNAL IS "xilinx.com:interface:acc_handshake:1.0 ap_ctrl done";
  ATTRIBUTE X_INTERFACE_INFO OF ap_start: SIGNAL IS "xilinx.com:interface:acc_handshake:1.0 ap_ctrl start";
  ATTRIBUTE X_INTERFACE_PARAMETER OF ap_rst: SIGNAL IS "XIL_INTERFACENAME ap_rst, POLARITY ACTIVE_HIGH, INSERT_VIP 0";
  ATTRIBUTE X_INTERFACE_INFO OF ap_rst: SIGNAL IS "xilinx.com:signal:reset:1.0 ap_rst RST";
  ATTRIBUTE X_INTERFACE_PARAMETER OF ap_clk: SIGNAL IS "XIL_INTERFACENAME ap_clk, ASSOCIATED_RESET ap_rst, FREQ_HZ 100000000, PHASE 0.000, INSERT_VIP 0";
  ATTRIBUTE X_INTERFACE_INFO OF ap_clk: SIGNAL IS "xilinx.com:signal:clock:1.0 ap_clk CLK";
BEGIN
  U0 : find_max_bin
    PORT MAP (
      hls_LT_theta_global_V_ap_vld => hls_LT_theta_global_V_ap_vld,
      hls_LT_r_global_V_ap_vld => hls_LT_r_global_V_ap_vld,
      hls_LT_theta_V_ap_vld => hls_LT_theta_V_ap_vld,
      hls_LT_r_V_ap_vld => hls_LT_r_V_ap_vld,
      res_max_bin_count_V_ap_vld => res_max_bin_count_V_ap_vld,
      res_max_bin_theta_V_ap_vld => res_max_bin_theta_V_ap_vld,
      res_max_bin_r_V_ap_vld => res_max_bin_r_V_ap_vld,
      ap_clk => ap_clk,
      ap_rst => ap_rst,
      ap_start => ap_start,
      ap_done => ap_done,
      ap_idle => ap_idle,
      ap_ready => ap_ready,
      slcvec_angle_polar_offset_mrad_V => slcvec_angle_polar_offset_mrad_V,
      roi_seed_r_V => roi_seed_r_V,
      max_bin_count_0_V => max_bin_count_0_V,
      max_bin_count_1_V => max_bin_count_1_V,
      max_bin_count_2_V => max_bin_count_2_V,
      max_bin_count_3_V => max_bin_count_3_V,
      max_bin_count_4_V => max_bin_count_4_V,
      max_bin_count_5_V => max_bin_count_5_V,
      max_bin_count_6_V => max_bin_count_6_V,
      max_bin_count_7_V => max_bin_count_7_V,
      max_bin_count_8_V => max_bin_count_8_V,
      max_bin_count_9_V => max_bin_count_9_V,
      max_bin_count_10_V => max_bin_count_10_V,
      max_bin_count_11_V => max_bin_count_11_V,
      max_bin_count_12_V => max_bin_count_12_V,
      max_bin_count_13_V => max_bin_count_13_V,
      max_bin_count_14_V => max_bin_count_14_V,
      max_bin_count_15_V => max_bin_count_15_V,
      max_bin_count_16_V => max_bin_count_16_V,
      max_bin_count_17_V => max_bin_count_17_V,
      max_bin_count_18_V => max_bin_count_18_V,
      max_bin_count_19_V => max_bin_count_19_V,
      max_bin_count_20_V => max_bin_count_20_V,
      max_bin_count_21_V => max_bin_count_21_V,
      max_bin_count_22_V => max_bin_count_22_V,
      max_bin_count_23_V => max_bin_count_23_V,
      max_bin_count_24_V => max_bin_count_24_V,
      max_bin_count_25_V => max_bin_count_25_V,
      max_bin_count_26_V => max_bin_count_26_V,
      max_bin_count_27_V => max_bin_count_27_V,
      max_bin_count_28_V => max_bin_count_28_V,
      max_bin_count_29_V => max_bin_count_29_V,
      max_bin_count_30_V => max_bin_count_30_V,
      max_bin_count_31_V => max_bin_count_31_V,
      max_bin_count_32_V => max_bin_count_32_V,
      max_bin_count_33_V => max_bin_count_33_V,
      max_bin_count_34_V => max_bin_count_34_V,
      max_bin_count_35_V => max_bin_count_35_V,
      max_bin_count_36_V => max_bin_count_36_V,
      max_bin_count_37_V => max_bin_count_37_V,
      max_bin_count_38_V => max_bin_count_38_V,
      max_bin_count_39_V => max_bin_count_39_V,
      max_bin_count_40_V => max_bin_count_40_V,
      max_bin_count_41_V => max_bin_count_41_V,
      max_bin_count_42_V => max_bin_count_42_V,
      max_bin_count_43_V => max_bin_count_43_V,
      max_bin_count_44_V => max_bin_count_44_V,
      max_bin_count_45_V => max_bin_count_45_V,
      max_bin_count_46_V => max_bin_count_46_V,
      max_bin_count_47_V => max_bin_count_47_V,
      max_bin_count_48_V => max_bin_count_48_V,
      max_bin_count_49_V => max_bin_count_49_V,
      max_bin_count_50_V => max_bin_count_50_V,
      max_bin_count_51_V => max_bin_count_51_V,
      max_bin_count_52_V => max_bin_count_52_V,
      max_bin_count_53_V => max_bin_count_53_V,
      max_bin_count_54_V => max_bin_count_54_V,
      max_bin_count_55_V => max_bin_count_55_V,
      max_bin_count_56_V => max_bin_count_56_V,
      max_bin_count_57_V => max_bin_count_57_V,
      max_bin_count_58_V => max_bin_count_58_V,
      max_bin_count_59_V => max_bin_count_59_V,
      max_bin_count_60_V => max_bin_count_60_V,
      max_bin_count_61_V => max_bin_count_61_V,
      max_bin_count_62_V => max_bin_count_62_V,
      max_bin_count_63_V => max_bin_count_63_V,
      max_bin_r_0_V => max_bin_r_0_V,
      max_bin_r_1_V => max_bin_r_1_V,
      max_bin_r_2_V => max_bin_r_2_V,
      max_bin_r_3_V => max_bin_r_3_V,
      max_bin_r_4_V => max_bin_r_4_V,
      max_bin_r_5_V => max_bin_r_5_V,
      max_bin_r_6_V => max_bin_r_6_V,
      max_bin_r_7_V => max_bin_r_7_V,
      max_bin_r_8_V => max_bin_r_8_V,
      max_bin_r_9_V => max_bin_r_9_V,
      max_bin_r_10_V => max_bin_r_10_V,
      max_bin_r_11_V => max_bin_r_11_V,
      max_bin_r_12_V => max_bin_r_12_V,
      max_bin_r_13_V => max_bin_r_13_V,
      max_bin_r_14_V => max_bin_r_14_V,
      max_bin_r_15_V => max_bin_r_15_V,
      max_bin_r_16_V => max_bin_r_16_V,
      max_bin_r_17_V => max_bin_r_17_V,
      max_bin_r_18_V => max_bin_r_18_V,
      max_bin_r_19_V => max_bin_r_19_V,
      max_bin_r_20_V => max_bin_r_20_V,
      max_bin_r_21_V => max_bin_r_21_V,
      max_bin_r_22_V => max_bin_r_22_V,
      max_bin_r_23_V => max_bin_r_23_V,
      max_bin_r_24_V => max_bin_r_24_V,
      max_bin_r_25_V => max_bin_r_25_V,
      max_bin_r_26_V => max_bin_r_26_V,
      max_bin_r_27_V => max_bin_r_27_V,
      max_bin_r_28_V => max_bin_r_28_V,
      max_bin_r_29_V => max_bin_r_29_V,
      max_bin_r_30_V => max_bin_r_30_V,
      max_bin_r_31_V => max_bin_r_31_V,
      max_bin_r_32_V => max_bin_r_32_V,
      max_bin_r_33_V => max_bin_r_33_V,
      max_bin_r_34_V => max_bin_r_34_V,
      max_bin_r_35_V => max_bin_r_35_V,
      max_bin_r_36_V => max_bin_r_36_V,
      max_bin_r_37_V => max_bin_r_37_V,
      max_bin_r_38_V => max_bin_r_38_V,
      max_bin_r_39_V => max_bin_r_39_V,
      max_bin_r_40_V => max_bin_r_40_V,
      max_bin_r_41_V => max_bin_r_41_V,
      max_bin_r_42_V => max_bin_r_42_V,
      max_bin_r_43_V => max_bin_r_43_V,
      max_bin_r_44_V => max_bin_r_44_V,
      max_bin_r_45_V => max_bin_r_45_V,
      max_bin_r_46_V => max_bin_r_46_V,
      max_bin_r_47_V => max_bin_r_47_V,
      max_bin_r_48_V => max_bin_r_48_V,
      max_bin_r_49_V => max_bin_r_49_V,
      max_bin_r_50_V => max_bin_r_50_V,
      max_bin_r_51_V => max_bin_r_51_V,
      max_bin_r_52_V => max_bin_r_52_V,
      max_bin_r_53_V => max_bin_r_53_V,
      max_bin_r_54_V => max_bin_r_54_V,
      max_bin_r_55_V => max_bin_r_55_V,
      max_bin_r_56_V => max_bin_r_56_V,
      max_bin_r_57_V => max_bin_r_57_V,
      max_bin_r_58_V => max_bin_r_58_V,
      max_bin_r_59_V => max_bin_r_59_V,
      max_bin_r_60_V => max_bin_r_60_V,
      max_bin_r_61_V => max_bin_r_61_V,
      max_bin_r_62_V => max_bin_r_62_V,
      max_bin_r_63_V => max_bin_r_63_V,
      hls_LT_theta_global_V => hls_LT_theta_global_V,
      hls_LT_r_global_V => hls_LT_r_global_V,
      hls_LT_theta_V => hls_LT_theta_V,
      hls_LT_r_V => hls_LT_r_V,
      res_max_bin_count_V => res_max_bin_count_V,
      res_max_bin_theta_V => res_max_bin_theta_V,
      res_max_bin_r_V => res_max_bin_r_V
    );
END hls_find_max_bin_arch;

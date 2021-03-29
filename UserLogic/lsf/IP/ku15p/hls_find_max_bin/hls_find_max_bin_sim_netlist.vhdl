-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2019.2.1 (lin64) Build 2729669 Thu Dec  5 04:48:12 MST 2019
-- Date        : Mon Mar 29 15:39:15 2021
-- Host        : atlas126a running 64-bit openSUSE Tumbleweed
-- Command     : write_vhdl -force -mode funcsim
--               /mnt/atlas126a/scratch/dcieri/Firmware/l0mdt-hdl-design/UserLogic/lsf/IP/ku15p/hls_find_max_bin/hls_find_max_bin_sim_netlist.vhdl
-- Design      : hls_find_max_bin
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xcku15p-ffva1760-2-e
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity hls_find_max_bin_find_max_bin is
  port (
    ap_clk : in STD_LOGIC;
    ap_rst : in STD_LOGIC;
    ap_start : in STD_LOGIC;
    ap_done : out STD_LOGIC;
    ap_idle : out STD_LOGIC;
    ap_ready : out STD_LOGIC;
    slcvec_angle_polar_offset_mrad_V : in STD_LOGIC_VECTOR ( 13 downto 0 );
    roi_seed_r_V : in STD_LOGIC_VECTOR ( 21 downto 0 );
    max_bin_count_0_V : in STD_LOGIC_VECTOR ( 3 downto 0 );
    max_bin_count_1_V : in STD_LOGIC_VECTOR ( 3 downto 0 );
    max_bin_count_2_V : in STD_LOGIC_VECTOR ( 3 downto 0 );
    max_bin_count_3_V : in STD_LOGIC_VECTOR ( 3 downto 0 );
    max_bin_count_4_V : in STD_LOGIC_VECTOR ( 3 downto 0 );
    max_bin_count_5_V : in STD_LOGIC_VECTOR ( 3 downto 0 );
    max_bin_count_6_V : in STD_LOGIC_VECTOR ( 3 downto 0 );
    max_bin_count_7_V : in STD_LOGIC_VECTOR ( 3 downto 0 );
    max_bin_count_8_V : in STD_LOGIC_VECTOR ( 3 downto 0 );
    max_bin_count_9_V : in STD_LOGIC_VECTOR ( 3 downto 0 );
    max_bin_count_10_V : in STD_LOGIC_VECTOR ( 3 downto 0 );
    max_bin_count_11_V : in STD_LOGIC_VECTOR ( 3 downto 0 );
    max_bin_count_12_V : in STD_LOGIC_VECTOR ( 3 downto 0 );
    max_bin_count_13_V : in STD_LOGIC_VECTOR ( 3 downto 0 );
    max_bin_count_14_V : in STD_LOGIC_VECTOR ( 3 downto 0 );
    max_bin_count_15_V : in STD_LOGIC_VECTOR ( 3 downto 0 );
    max_bin_count_16_V : in STD_LOGIC_VECTOR ( 3 downto 0 );
    max_bin_count_17_V : in STD_LOGIC_VECTOR ( 3 downto 0 );
    max_bin_count_18_V : in STD_LOGIC_VECTOR ( 3 downto 0 );
    max_bin_count_19_V : in STD_LOGIC_VECTOR ( 3 downto 0 );
    max_bin_count_20_V : in STD_LOGIC_VECTOR ( 3 downto 0 );
    max_bin_count_21_V : in STD_LOGIC_VECTOR ( 3 downto 0 );
    max_bin_count_22_V : in STD_LOGIC_VECTOR ( 3 downto 0 );
    max_bin_count_23_V : in STD_LOGIC_VECTOR ( 3 downto 0 );
    max_bin_count_24_V : in STD_LOGIC_VECTOR ( 3 downto 0 );
    max_bin_count_25_V : in STD_LOGIC_VECTOR ( 3 downto 0 );
    max_bin_count_26_V : in STD_LOGIC_VECTOR ( 3 downto 0 );
    max_bin_count_27_V : in STD_LOGIC_VECTOR ( 3 downto 0 );
    max_bin_count_28_V : in STD_LOGIC_VECTOR ( 3 downto 0 );
    max_bin_count_29_V : in STD_LOGIC_VECTOR ( 3 downto 0 );
    max_bin_count_30_V : in STD_LOGIC_VECTOR ( 3 downto 0 );
    max_bin_count_31_V : in STD_LOGIC_VECTOR ( 3 downto 0 );
    max_bin_count_32_V : in STD_LOGIC_VECTOR ( 3 downto 0 );
    max_bin_count_33_V : in STD_LOGIC_VECTOR ( 3 downto 0 );
    max_bin_count_34_V : in STD_LOGIC_VECTOR ( 3 downto 0 );
    max_bin_count_35_V : in STD_LOGIC_VECTOR ( 3 downto 0 );
    max_bin_count_36_V : in STD_LOGIC_VECTOR ( 3 downto 0 );
    max_bin_count_37_V : in STD_LOGIC_VECTOR ( 3 downto 0 );
    max_bin_count_38_V : in STD_LOGIC_VECTOR ( 3 downto 0 );
    max_bin_count_39_V : in STD_LOGIC_VECTOR ( 3 downto 0 );
    max_bin_count_40_V : in STD_LOGIC_VECTOR ( 3 downto 0 );
    max_bin_count_41_V : in STD_LOGIC_VECTOR ( 3 downto 0 );
    max_bin_count_42_V : in STD_LOGIC_VECTOR ( 3 downto 0 );
    max_bin_count_43_V : in STD_LOGIC_VECTOR ( 3 downto 0 );
    max_bin_count_44_V : in STD_LOGIC_VECTOR ( 3 downto 0 );
    max_bin_count_45_V : in STD_LOGIC_VECTOR ( 3 downto 0 );
    max_bin_count_46_V : in STD_LOGIC_VECTOR ( 3 downto 0 );
    max_bin_count_47_V : in STD_LOGIC_VECTOR ( 3 downto 0 );
    max_bin_count_48_V : in STD_LOGIC_VECTOR ( 3 downto 0 );
    max_bin_count_49_V : in STD_LOGIC_VECTOR ( 3 downto 0 );
    max_bin_count_50_V : in STD_LOGIC_VECTOR ( 3 downto 0 );
    max_bin_count_51_V : in STD_LOGIC_VECTOR ( 3 downto 0 );
    max_bin_count_52_V : in STD_LOGIC_VECTOR ( 3 downto 0 );
    max_bin_count_53_V : in STD_LOGIC_VECTOR ( 3 downto 0 );
    max_bin_count_54_V : in STD_LOGIC_VECTOR ( 3 downto 0 );
    max_bin_count_55_V : in STD_LOGIC_VECTOR ( 3 downto 0 );
    max_bin_count_56_V : in STD_LOGIC_VECTOR ( 3 downto 0 );
    max_bin_count_57_V : in STD_LOGIC_VECTOR ( 3 downto 0 );
    max_bin_count_58_V : in STD_LOGIC_VECTOR ( 3 downto 0 );
    max_bin_count_59_V : in STD_LOGIC_VECTOR ( 3 downto 0 );
    max_bin_count_60_V : in STD_LOGIC_VECTOR ( 3 downto 0 );
    max_bin_count_61_V : in STD_LOGIC_VECTOR ( 3 downto 0 );
    max_bin_count_62_V : in STD_LOGIC_VECTOR ( 3 downto 0 );
    max_bin_count_63_V : in STD_LOGIC_VECTOR ( 3 downto 0 );
    max_bin_r_0_V : in STD_LOGIC_VECTOR ( 6 downto 0 );
    max_bin_r_1_V : in STD_LOGIC_VECTOR ( 6 downto 0 );
    max_bin_r_2_V : in STD_LOGIC_VECTOR ( 6 downto 0 );
    max_bin_r_3_V : in STD_LOGIC_VECTOR ( 6 downto 0 );
    max_bin_r_4_V : in STD_LOGIC_VECTOR ( 6 downto 0 );
    max_bin_r_5_V : in STD_LOGIC_VECTOR ( 6 downto 0 );
    max_bin_r_6_V : in STD_LOGIC_VECTOR ( 6 downto 0 );
    max_bin_r_7_V : in STD_LOGIC_VECTOR ( 6 downto 0 );
    max_bin_r_8_V : in STD_LOGIC_VECTOR ( 6 downto 0 );
    max_bin_r_9_V : in STD_LOGIC_VECTOR ( 6 downto 0 );
    max_bin_r_10_V : in STD_LOGIC_VECTOR ( 6 downto 0 );
    max_bin_r_11_V : in STD_LOGIC_VECTOR ( 6 downto 0 );
    max_bin_r_12_V : in STD_LOGIC_VECTOR ( 6 downto 0 );
    max_bin_r_13_V : in STD_LOGIC_VECTOR ( 6 downto 0 );
    max_bin_r_14_V : in STD_LOGIC_VECTOR ( 6 downto 0 );
    max_bin_r_15_V : in STD_LOGIC_VECTOR ( 6 downto 0 );
    max_bin_r_16_V : in STD_LOGIC_VECTOR ( 6 downto 0 );
    max_bin_r_17_V : in STD_LOGIC_VECTOR ( 6 downto 0 );
    max_bin_r_18_V : in STD_LOGIC_VECTOR ( 6 downto 0 );
    max_bin_r_19_V : in STD_LOGIC_VECTOR ( 6 downto 0 );
    max_bin_r_20_V : in STD_LOGIC_VECTOR ( 6 downto 0 );
    max_bin_r_21_V : in STD_LOGIC_VECTOR ( 6 downto 0 );
    max_bin_r_22_V : in STD_LOGIC_VECTOR ( 6 downto 0 );
    max_bin_r_23_V : in STD_LOGIC_VECTOR ( 6 downto 0 );
    max_bin_r_24_V : in STD_LOGIC_VECTOR ( 6 downto 0 );
    max_bin_r_25_V : in STD_LOGIC_VECTOR ( 6 downto 0 );
    max_bin_r_26_V : in STD_LOGIC_VECTOR ( 6 downto 0 );
    max_bin_r_27_V : in STD_LOGIC_VECTOR ( 6 downto 0 );
    max_bin_r_28_V : in STD_LOGIC_VECTOR ( 6 downto 0 );
    max_bin_r_29_V : in STD_LOGIC_VECTOR ( 6 downto 0 );
    max_bin_r_30_V : in STD_LOGIC_VECTOR ( 6 downto 0 );
    max_bin_r_31_V : in STD_LOGIC_VECTOR ( 6 downto 0 );
    max_bin_r_32_V : in STD_LOGIC_VECTOR ( 6 downto 0 );
    max_bin_r_33_V : in STD_LOGIC_VECTOR ( 6 downto 0 );
    max_bin_r_34_V : in STD_LOGIC_VECTOR ( 6 downto 0 );
    max_bin_r_35_V : in STD_LOGIC_VECTOR ( 6 downto 0 );
    max_bin_r_36_V : in STD_LOGIC_VECTOR ( 6 downto 0 );
    max_bin_r_37_V : in STD_LOGIC_VECTOR ( 6 downto 0 );
    max_bin_r_38_V : in STD_LOGIC_VECTOR ( 6 downto 0 );
    max_bin_r_39_V : in STD_LOGIC_VECTOR ( 6 downto 0 );
    max_bin_r_40_V : in STD_LOGIC_VECTOR ( 6 downto 0 );
    max_bin_r_41_V : in STD_LOGIC_VECTOR ( 6 downto 0 );
    max_bin_r_42_V : in STD_LOGIC_VECTOR ( 6 downto 0 );
    max_bin_r_43_V : in STD_LOGIC_VECTOR ( 6 downto 0 );
    max_bin_r_44_V : in STD_LOGIC_VECTOR ( 6 downto 0 );
    max_bin_r_45_V : in STD_LOGIC_VECTOR ( 6 downto 0 );
    max_bin_r_46_V : in STD_LOGIC_VECTOR ( 6 downto 0 );
    max_bin_r_47_V : in STD_LOGIC_VECTOR ( 6 downto 0 );
    max_bin_r_48_V : in STD_LOGIC_VECTOR ( 6 downto 0 );
    max_bin_r_49_V : in STD_LOGIC_VECTOR ( 6 downto 0 );
    max_bin_r_50_V : in STD_LOGIC_VECTOR ( 6 downto 0 );
    max_bin_r_51_V : in STD_LOGIC_VECTOR ( 6 downto 0 );
    max_bin_r_52_V : in STD_LOGIC_VECTOR ( 6 downto 0 );
    max_bin_r_53_V : in STD_LOGIC_VECTOR ( 6 downto 0 );
    max_bin_r_54_V : in STD_LOGIC_VECTOR ( 6 downto 0 );
    max_bin_r_55_V : in STD_LOGIC_VECTOR ( 6 downto 0 );
    max_bin_r_56_V : in STD_LOGIC_VECTOR ( 6 downto 0 );
    max_bin_r_57_V : in STD_LOGIC_VECTOR ( 6 downto 0 );
    max_bin_r_58_V : in STD_LOGIC_VECTOR ( 6 downto 0 );
    max_bin_r_59_V : in STD_LOGIC_VECTOR ( 6 downto 0 );
    max_bin_r_60_V : in STD_LOGIC_VECTOR ( 6 downto 0 );
    max_bin_r_61_V : in STD_LOGIC_VECTOR ( 6 downto 0 );
    max_bin_r_62_V : in STD_LOGIC_VECTOR ( 6 downto 0 );
    max_bin_r_63_V : in STD_LOGIC_VECTOR ( 6 downto 0 );
    hls_LT_theta_global_V : out STD_LOGIC_VECTOR ( 13 downto 0 );
    hls_LT_theta_global_V_ap_vld : out STD_LOGIC;
    hls_LT_r_global_V : out STD_LOGIC_VECTOR ( 21 downto 0 );
    hls_LT_r_global_V_ap_vld : out STD_LOGIC;
    hls_LT_theta_V : out STD_LOGIC_VECTOR ( 13 downto 0 );
    hls_LT_theta_V_ap_vld : out STD_LOGIC;
    hls_LT_r_V : out STD_LOGIC_VECTOR ( 21 downto 0 );
    hls_LT_r_V_ap_vld : out STD_LOGIC;
    res_max_bin_count_V : out STD_LOGIC_VECTOR ( 3 downto 0 );
    res_max_bin_count_V_ap_vld : out STD_LOGIC;
    res_max_bin_theta_V : out STD_LOGIC_VECTOR ( 6 downto 0 );
    res_max_bin_theta_V_ap_vld : out STD_LOGIC;
    res_max_bin_r_V : out STD_LOGIC_VECTOR ( 6 downto 0 );
    res_max_bin_r_V_ap_vld : out STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of hls_find_max_bin_find_max_bin : entity is "find_max_bin";
end hls_find_max_bin_find_max_bin;

architecture STRUCTURE of hls_find_max_bin_find_max_bin is
  signal \<const0>\ : STD_LOGIC;
  signal add_ln703_1_fu_4702_p2 : STD_LOGIC_VECTOR ( 13 downto 0 );
  signal add_ln703_2_fu_4727_p2 : STD_LOGIC_VECTOR ( 21 downto 3 );
  signal \^ap_done\ : STD_LOGIC;
  signal ap_enable_reg_pp0_iter1 : STD_LOGIC;
  signal ap_enable_reg_pp0_iter2 : STD_LOGIC;
  signal \^ap_start\ : STD_LOGIC;
  signal \^hls_lt_r_v\ : STD_LOGIC_VECTOR ( 4 to 4 );
  signal \hls_LT_r_V_1_data_reg[10]_i_2_n_0\ : STD_LOGIC;
  signal \hls_LT_r_V_1_data_reg[11]_i_2_n_0\ : STD_LOGIC;
  signal \hls_LT_r_V_1_data_reg[8]_i_2_n_0\ : STD_LOGIC;
  signal \hls_LT_r_V_1_data_reg[9]_i_2_n_0\ : STD_LOGIC;
  signal \hls_LT_r_global_V_1_data_reg[10]_i_2_n_0\ : STD_LOGIC;
  signal \hls_LT_r_global_V_1_data_reg[10]_i_3_n_0\ : STD_LOGIC;
  signal \hls_LT_r_global_V_1_data_reg[10]_i_4_n_0\ : STD_LOGIC;
  signal \hls_LT_r_global_V_1_data_reg[10]_i_5_n_0\ : STD_LOGIC;
  signal \hls_LT_r_global_V_1_data_reg[10]_i_6_n_0\ : STD_LOGIC;
  signal \hls_LT_r_global_V_1_data_reg[10]_i_7_n_0\ : STD_LOGIC;
  signal \hls_LT_r_global_V_1_data_reg[10]_i_8_n_0\ : STD_LOGIC;
  signal \hls_LT_r_global_V_1_data_reg[18]_i_2_n_0\ : STD_LOGIC;
  signal \hls_LT_r_global_V_1_data_reg_reg[10]_i_1_n_0\ : STD_LOGIC;
  signal \hls_LT_r_global_V_1_data_reg_reg[10]_i_1_n_1\ : STD_LOGIC;
  signal \hls_LT_r_global_V_1_data_reg_reg[10]_i_1_n_2\ : STD_LOGIC;
  signal \hls_LT_r_global_V_1_data_reg_reg[10]_i_1_n_3\ : STD_LOGIC;
  signal \hls_LT_r_global_V_1_data_reg_reg[10]_i_1_n_4\ : STD_LOGIC;
  signal \hls_LT_r_global_V_1_data_reg_reg[10]_i_1_n_5\ : STD_LOGIC;
  signal \hls_LT_r_global_V_1_data_reg_reg[10]_i_1_n_6\ : STD_LOGIC;
  signal \hls_LT_r_global_V_1_data_reg_reg[10]_i_1_n_7\ : STD_LOGIC;
  signal \hls_LT_r_global_V_1_data_reg_reg[18]_i_1_n_0\ : STD_LOGIC;
  signal \hls_LT_r_global_V_1_data_reg_reg[18]_i_1_n_1\ : STD_LOGIC;
  signal \hls_LT_r_global_V_1_data_reg_reg[18]_i_1_n_2\ : STD_LOGIC;
  signal \hls_LT_r_global_V_1_data_reg_reg[18]_i_1_n_3\ : STD_LOGIC;
  signal \hls_LT_r_global_V_1_data_reg_reg[18]_i_1_n_4\ : STD_LOGIC;
  signal \hls_LT_r_global_V_1_data_reg_reg[18]_i_1_n_5\ : STD_LOGIC;
  signal \hls_LT_r_global_V_1_data_reg_reg[18]_i_1_n_6\ : STD_LOGIC;
  signal \hls_LT_r_global_V_1_data_reg_reg[18]_i_1_n_7\ : STD_LOGIC;
  signal \hls_LT_r_global_V_1_data_reg_reg[21]_i_1_n_6\ : STD_LOGIC;
  signal \hls_LT_r_global_V_1_data_reg_reg[21]_i_1_n_7\ : STD_LOGIC;
  signal \^hls_lt_r_global_v_ap_vld\ : STD_LOGIC;
  signal \hls_LT_theta_V_1_data_reg[8]_i_2_n_0\ : STD_LOGIC;
  signal \hls_LT_theta_V_1_data_reg[8]_i_3_n_0\ : STD_LOGIC;
  signal \hls_LT_theta_global_V_1_data_reg[13]_i_2_n_0\ : STD_LOGIC;
  signal \hls_LT_theta_global_V_1_data_reg[13]_i_3_n_0\ : STD_LOGIC;
  signal \hls_LT_theta_global_V_1_data_reg[13]_i_4_n_0\ : STD_LOGIC;
  signal \hls_LT_theta_global_V_1_data_reg[13]_i_5_n_0\ : STD_LOGIC;
  signal \hls_LT_theta_global_V_1_data_reg[8]_i_10_n_0\ : STD_LOGIC;
  signal \hls_LT_theta_global_V_1_data_reg[8]_i_11_n_0\ : STD_LOGIC;
  signal \hls_LT_theta_global_V_1_data_reg[8]_i_2_n_0\ : STD_LOGIC;
  signal \hls_LT_theta_global_V_1_data_reg[8]_i_3_n_0\ : STD_LOGIC;
  signal \hls_LT_theta_global_V_1_data_reg[8]_i_4_n_0\ : STD_LOGIC;
  signal \hls_LT_theta_global_V_1_data_reg[8]_i_5_n_0\ : STD_LOGIC;
  signal \hls_LT_theta_global_V_1_data_reg[8]_i_6_n_0\ : STD_LOGIC;
  signal \hls_LT_theta_global_V_1_data_reg[8]_i_7_n_0\ : STD_LOGIC;
  signal \hls_LT_theta_global_V_1_data_reg[8]_i_8_n_0\ : STD_LOGIC;
  signal \hls_LT_theta_global_V_1_data_reg[8]_i_9_n_0\ : STD_LOGIC;
  signal \hls_LT_theta_global_V_1_data_reg_reg[13]_i_1_n_4\ : STD_LOGIC;
  signal \hls_LT_theta_global_V_1_data_reg_reg[13]_i_1_n_5\ : STD_LOGIC;
  signal \hls_LT_theta_global_V_1_data_reg_reg[13]_i_1_n_6\ : STD_LOGIC;
  signal \hls_LT_theta_global_V_1_data_reg_reg[13]_i_1_n_7\ : STD_LOGIC;
  signal \hls_LT_theta_global_V_1_data_reg_reg[8]_i_1_n_0\ : STD_LOGIC;
  signal \hls_LT_theta_global_V_1_data_reg_reg[8]_i_1_n_1\ : STD_LOGIC;
  signal \hls_LT_theta_global_V_1_data_reg_reg[8]_i_1_n_2\ : STD_LOGIC;
  signal \hls_LT_theta_global_V_1_data_reg_reg[8]_i_1_n_3\ : STD_LOGIC;
  signal \hls_LT_theta_global_V_1_data_reg_reg[8]_i_1_n_4\ : STD_LOGIC;
  signal \hls_LT_theta_global_V_1_data_reg_reg[8]_i_1_n_5\ : STD_LOGIC;
  signal \hls_LT_theta_global_V_1_data_reg_reg[8]_i_1_n_6\ : STD_LOGIC;
  signal \hls_LT_theta_global_V_1_data_reg_reg[8]_i_1_n_7\ : STD_LOGIC;
  signal icmp_ln895_100_reg_5336 : STD_LOGIC;
  signal \icmp_ln895_100_reg_5336[0]_i_1_n_0\ : STD_LOGIC;
  signal \icmp_ln895_100_reg_5336[0]_i_2_n_0\ : STD_LOGIC;
  signal icmp_ln895_101_reg_5347 : STD_LOGIC;
  signal \icmp_ln895_101_reg_5347[0]_i_1_n_0\ : STD_LOGIC;
  signal \icmp_ln895_101_reg_5347[0]_i_2_n_0\ : STD_LOGIC;
  signal icmp_ln895_102_reg_5358 : STD_LOGIC;
  signal \icmp_ln895_102_reg_5358[0]_i_1_n_0\ : STD_LOGIC;
  signal \icmp_ln895_102_reg_5358[0]_i_2_n_0\ : STD_LOGIC;
  signal icmp_ln895_103_reg_5369 : STD_LOGIC;
  signal \icmp_ln895_103_reg_5369[0]_i_1_n_0\ : STD_LOGIC;
  signal \icmp_ln895_103_reg_5369[0]_i_2_n_0\ : STD_LOGIC;
  signal icmp_ln895_104_reg_5380 : STD_LOGIC;
  signal \icmp_ln895_104_reg_5380[0]_i_1_n_0\ : STD_LOGIC;
  signal \icmp_ln895_104_reg_5380[0]_i_2_n_0\ : STD_LOGIC;
  signal icmp_ln895_105_reg_5391 : STD_LOGIC;
  signal \icmp_ln895_105_reg_5391[0]_i_1_n_0\ : STD_LOGIC;
  signal \icmp_ln895_105_reg_5391[0]_i_2_n_0\ : STD_LOGIC;
  signal icmp_ln895_106_reg_5406 : STD_LOGIC;
  signal \icmp_ln895_106_reg_5406[0]_i_1_n_0\ : STD_LOGIC;
  signal \icmp_ln895_106_reg_5406[0]_i_2_n_0\ : STD_LOGIC;
  signal icmp_ln895_107_reg_5421 : STD_LOGIC;
  signal \icmp_ln895_107_reg_5421[0]_i_1_n_0\ : STD_LOGIC;
  signal \icmp_ln895_107_reg_5421[0]_i_2_n_0\ : STD_LOGIC;
  signal icmp_ln895_108_reg_5436 : STD_LOGIC;
  signal \icmp_ln895_108_reg_5436[0]_i_1_n_0\ : STD_LOGIC;
  signal \icmp_ln895_108_reg_5436[0]_i_2_n_0\ : STD_LOGIC;
  signal icmp_ln895_109_reg_5451 : STD_LOGIC;
  signal \icmp_ln895_109_reg_5451[0]_i_1_n_0\ : STD_LOGIC;
  signal \icmp_ln895_109_reg_5451[0]_i_2_n_0\ : STD_LOGIC;
  signal icmp_ln895_10_reg_4793 : STD_LOGIC;
  signal icmp_ln895_110_reg_5466 : STD_LOGIC;
  signal \icmp_ln895_110_reg_5466[0]_i_1_n_0\ : STD_LOGIC;
  signal \icmp_ln895_110_reg_5466[0]_i_2_n_0\ : STD_LOGIC;
  signal icmp_ln895_111_reg_5481 : STD_LOGIC;
  signal \icmp_ln895_111_reg_5481[0]_i_1_n_0\ : STD_LOGIC;
  signal \icmp_ln895_111_reg_5481[0]_i_2_n_0\ : STD_LOGIC;
  signal icmp_ln895_112_reg_5496 : STD_LOGIC;
  signal \icmp_ln895_112_reg_5496[0]_i_1_n_0\ : STD_LOGIC;
  signal \icmp_ln895_112_reg_5496[0]_i_2_n_0\ : STD_LOGIC;
  signal icmp_ln895_113_fu_2192_p2 : STD_LOGIC;
  signal icmp_ln895_113_reg_5511 : STD_LOGIC;
  signal \icmp_ln895_113_reg_5511[0]_i_2_n_0\ : STD_LOGIC;
  signal icmp_ln895_114_fu_2196_p2 : STD_LOGIC;
  signal icmp_ln895_114_reg_5518 : STD_LOGIC;
  signal \icmp_ln895_114_reg_5518[0]_i_2_n_0\ : STD_LOGIC;
  signal icmp_ln895_115_fu_2200_p2 : STD_LOGIC;
  signal icmp_ln895_115_reg_5525 : STD_LOGIC;
  signal \icmp_ln895_115_reg_5525[0]_i_2_n_0\ : STD_LOGIC;
  signal icmp_ln895_116_fu_2204_p2 : STD_LOGIC;
  signal icmp_ln895_116_reg_5532 : STD_LOGIC;
  signal \icmp_ln895_116_reg_5532[0]_i_2_n_0\ : STD_LOGIC;
  signal icmp_ln895_117_fu_2208_p2 : STD_LOGIC;
  signal icmp_ln895_117_reg_5539 : STD_LOGIC;
  signal \icmp_ln895_117_reg_5539[0]_i_2_n_0\ : STD_LOGIC;
  signal icmp_ln895_118_fu_2212_p2 : STD_LOGIC;
  signal icmp_ln895_118_reg_5546 : STD_LOGIC;
  signal \icmp_ln895_118_reg_5546[0]_i_2_n_0\ : STD_LOGIC;
  signal icmp_ln895_119_fu_2216_p2 : STD_LOGIC;
  signal icmp_ln895_119_reg_5553 : STD_LOGIC;
  signal \icmp_ln895_119_reg_5553[0]_i_2_n_0\ : STD_LOGIC;
  signal icmp_ln895_11_reg_4798 : STD_LOGIC;
  signal \icmp_ln895_11_reg_4798[0]_i_1_n_0\ : STD_LOGIC;
  signal icmp_ln895_120_fu_2220_p2 : STD_LOGIC;
  signal icmp_ln895_120_reg_5560 : STD_LOGIC;
  signal \icmp_ln895_120_reg_5560[0]_i_2_n_0\ : STD_LOGIC;
  signal icmp_ln895_125_reg_5577 : STD_LOGIC;
  signal \icmp_ln895_125_reg_5577[0]_i_1_n_0\ : STD_LOGIC;
  signal icmp_ln895_12_reg_4803 : STD_LOGIC;
  signal \icmp_ln895_12_reg_4803[0]_i_1_n_0\ : STD_LOGIC;
  signal icmp_ln895_13_reg_4808 : STD_LOGIC;
  signal \icmp_ln895_13_reg_4808[0]_i_1_n_0\ : STD_LOGIC;
  signal icmp_ln895_14_reg_4813 : STD_LOGIC;
  signal \icmp_ln895_14_reg_4813[0]_i_1_n_0\ : STD_LOGIC;
  signal icmp_ln895_15_reg_4818 : STD_LOGIC;
  signal \icmp_ln895_15_reg_4818[0]_i_1_n_0\ : STD_LOGIC;
  signal icmp_ln895_16_reg_4823 : STD_LOGIC;
  signal \icmp_ln895_16_reg_4823[0]_i_1_n_0\ : STD_LOGIC;
  signal icmp_ln895_17_reg_4828 : STD_LOGIC;
  signal \icmp_ln895_17_reg_4828[0]_i_1_n_0\ : STD_LOGIC;
  signal icmp_ln895_18_reg_4833 : STD_LOGIC;
  signal \icmp_ln895_18_reg_4833[0]_i_1_n_0\ : STD_LOGIC;
  signal icmp_ln895_19_reg_4838 : STD_LOGIC;
  signal \icmp_ln895_19_reg_4838[0]_i_1_n_0\ : STD_LOGIC;
  signal icmp_ln895_1_reg_4748 : STD_LOGIC;
  signal \icmp_ln895_1_reg_4748[0]_i_1_n_0\ : STD_LOGIC;
  signal icmp_ln895_20_reg_4843 : STD_LOGIC;
  signal \icmp_ln895_20_reg_4843[0]_i_1_n_0\ : STD_LOGIC;
  signal icmp_ln895_21_reg_4848 : STD_LOGIC;
  signal \icmp_ln895_21_reg_4848[0]_i_1_n_0\ : STD_LOGIC;
  signal icmp_ln895_22_reg_4853 : STD_LOGIC;
  signal \icmp_ln895_22_reg_4853[0]_i_1_n_0\ : STD_LOGIC;
  signal icmp_ln895_23_reg_4858 : STD_LOGIC;
  signal \icmp_ln895_23_reg_4858[0]_i_1_n_0\ : STD_LOGIC;
  signal icmp_ln895_24_reg_4863 : STD_LOGIC;
  signal \icmp_ln895_24_reg_4863[0]_i_1_n_0\ : STD_LOGIC;
  signal icmp_ln895_25_reg_4868 : STD_LOGIC;
  signal \icmp_ln895_25_reg_4868[0]_i_1_n_0\ : STD_LOGIC;
  signal icmp_ln895_26_reg_4873 : STD_LOGIC;
  signal \icmp_ln895_26_reg_4873[0]_i_1_n_0\ : STD_LOGIC;
  signal icmp_ln895_27_reg_4878 : STD_LOGIC;
  signal \icmp_ln895_27_reg_4878[0]_i_1_n_0\ : STD_LOGIC;
  signal icmp_ln895_28_reg_4883 : STD_LOGIC;
  signal \icmp_ln895_28_reg_4883[0]_i_1_n_0\ : STD_LOGIC;
  signal icmp_ln895_29_reg_4888 : STD_LOGIC;
  signal \icmp_ln895_29_reg_4888[0]_i_1_n_0\ : STD_LOGIC;
  signal icmp_ln895_2_reg_4753 : STD_LOGIC;
  signal \icmp_ln895_2_reg_4753[0]_i_1_n_0\ : STD_LOGIC;
  signal icmp_ln895_30_reg_4893 : STD_LOGIC;
  signal \icmp_ln895_30_reg_4893[0]_i_1_n_0\ : STD_LOGIC;
  signal icmp_ln895_31_reg_4898 : STD_LOGIC;
  signal \icmp_ln895_31_reg_4898[0]_i_1_n_0\ : STD_LOGIC;
  signal icmp_ln895_32_reg_4903 : STD_LOGIC;
  signal \icmp_ln895_32_reg_4903[0]_i_1_n_0\ : STD_LOGIC;
  signal icmp_ln895_33_reg_4908 : STD_LOGIC;
  signal \icmp_ln895_33_reg_4908[0]_i_1_n_0\ : STD_LOGIC;
  signal icmp_ln895_34_reg_4913 : STD_LOGIC;
  signal \icmp_ln895_34_reg_4913[0]_i_1_n_0\ : STD_LOGIC;
  signal icmp_ln895_35_reg_4918 : STD_LOGIC;
  signal \icmp_ln895_35_reg_4918[0]_i_1_n_0\ : STD_LOGIC;
  signal icmp_ln895_36_reg_4923 : STD_LOGIC;
  signal \icmp_ln895_36_reg_4923[0]_i_1_n_0\ : STD_LOGIC;
  signal icmp_ln895_37_reg_4928 : STD_LOGIC;
  signal \icmp_ln895_37_reg_4928[0]_i_1_n_0\ : STD_LOGIC;
  signal icmp_ln895_38_reg_4933 : STD_LOGIC;
  signal \icmp_ln895_38_reg_4933[0]_i_1_n_0\ : STD_LOGIC;
  signal icmp_ln895_39_reg_4938 : STD_LOGIC;
  signal \icmp_ln895_39_reg_4938[0]_i_1_n_0\ : STD_LOGIC;
  signal icmp_ln895_3_reg_4758 : STD_LOGIC;
  signal \icmp_ln895_3_reg_4758[0]_i_1_n_0\ : STD_LOGIC;
  signal icmp_ln895_40_reg_4943 : STD_LOGIC;
  signal icmp_ln895_41_reg_4948 : STD_LOGIC;
  signal \icmp_ln895_41_reg_4948[0]_i_1_n_0\ : STD_LOGIC;
  signal icmp_ln895_42_reg_4953 : STD_LOGIC;
  signal \icmp_ln895_42_reg_4953[0]_i_1_n_0\ : STD_LOGIC;
  signal icmp_ln895_43_reg_4958 : STD_LOGIC;
  signal \icmp_ln895_43_reg_4958[0]_i_1_n_0\ : STD_LOGIC;
  signal icmp_ln895_44_reg_4963 : STD_LOGIC;
  signal \icmp_ln895_44_reg_4963[0]_i_1_n_0\ : STD_LOGIC;
  signal icmp_ln895_45_reg_4968 : STD_LOGIC;
  signal \icmp_ln895_45_reg_4968[0]_i_1_n_0\ : STD_LOGIC;
  signal icmp_ln895_46_reg_4973 : STD_LOGIC;
  signal \icmp_ln895_46_reg_4973[0]_i_1_n_0\ : STD_LOGIC;
  signal icmp_ln895_47_reg_4978 : STD_LOGIC;
  signal \icmp_ln895_47_reg_4978[0]_i_1_n_0\ : STD_LOGIC;
  signal icmp_ln895_48_reg_4983 : STD_LOGIC;
  signal \icmp_ln895_48_reg_4983[0]_i_1_n_0\ : STD_LOGIC;
  signal icmp_ln895_49_reg_4988 : STD_LOGIC;
  signal \icmp_ln895_49_reg_4988[0]_i_1_n_0\ : STD_LOGIC;
  signal icmp_ln895_4_reg_4763 : STD_LOGIC;
  signal \icmp_ln895_4_reg_4763[0]_i_1_n_0\ : STD_LOGIC;
  signal icmp_ln895_50_reg_4993 : STD_LOGIC;
  signal \icmp_ln895_50_reg_4993[0]_i_1_n_0\ : STD_LOGIC;
  signal icmp_ln895_51_reg_4998 : STD_LOGIC;
  signal \icmp_ln895_51_reg_4998[0]_i_1_n_0\ : STD_LOGIC;
  signal icmp_ln895_52_reg_5003 : STD_LOGIC;
  signal \icmp_ln895_52_reg_5003[0]_i_1_n_0\ : STD_LOGIC;
  signal icmp_ln895_53_reg_5008 : STD_LOGIC;
  signal \icmp_ln895_53_reg_5008[0]_i_1_n_0\ : STD_LOGIC;
  signal icmp_ln895_54_reg_5013 : STD_LOGIC;
  signal \icmp_ln895_54_reg_5013[0]_i_1_n_0\ : STD_LOGIC;
  signal icmp_ln895_55_reg_5018 : STD_LOGIC;
  signal \icmp_ln895_55_reg_5018[0]_i_1_n_0\ : STD_LOGIC;
  signal icmp_ln895_56_reg_5023 : STD_LOGIC;
  signal \icmp_ln895_56_reg_5023[0]_i_1_n_0\ : STD_LOGIC;
  signal icmp_ln895_57_reg_5028 : STD_LOGIC;
  signal \icmp_ln895_57_reg_5028[0]_i_1_n_0\ : STD_LOGIC;
  signal icmp_ln895_58_reg_5033 : STD_LOGIC;
  signal \icmp_ln895_58_reg_5033[0]_i_1_n_0\ : STD_LOGIC;
  signal icmp_ln895_59_reg_5038 : STD_LOGIC;
  signal \icmp_ln895_59_reg_5038[0]_i_1_n_0\ : STD_LOGIC;
  signal icmp_ln895_60_reg_5043 : STD_LOGIC;
  signal \icmp_ln895_60_reg_5043[0]_i_1_n_0\ : STD_LOGIC;
  signal icmp_ln895_61_reg_5048 : STD_LOGIC;
  signal \icmp_ln895_61_reg_5048[0]_i_1_n_0\ : STD_LOGIC;
  signal icmp_ln895_62_reg_5053 : STD_LOGIC;
  signal \icmp_ln895_62_reg_5053[0]_i_1_n_0\ : STD_LOGIC;
  signal icmp_ln895_63_reg_5058 : STD_LOGIC;
  signal \icmp_ln895_63_reg_5058[0]_i_1_n_0\ : STD_LOGIC;
  signal icmp_ln895_64_reg_4773 : STD_LOGIC;
  signal \icmp_ln895_64_reg_4773[0]_i_1_n_0\ : STD_LOGIC;
  signal icmp_ln895_65_reg_5063 : STD_LOGIC;
  signal \icmp_ln895_65_reg_5063[0]_i_1_n_0\ : STD_LOGIC;
  signal \icmp_ln895_65_reg_5063[0]_i_2_n_0\ : STD_LOGIC;
  signal icmp_ln895_66_reg_5073 : STD_LOGIC;
  signal \icmp_ln895_66_reg_5073[0]_i_1_n_0\ : STD_LOGIC;
  signal \icmp_ln895_66_reg_5073[0]_i_2_n_0\ : STD_LOGIC;
  signal icmp_ln895_67_reg_5083 : STD_LOGIC;
  signal \icmp_ln895_67_reg_5083[0]_i_1_n_0\ : STD_LOGIC;
  signal \icmp_ln895_67_reg_5083[0]_i_2_n_0\ : STD_LOGIC;
  signal icmp_ln895_68_reg_5093 : STD_LOGIC;
  signal \icmp_ln895_68_reg_5093[0]_i_1_n_0\ : STD_LOGIC;
  signal \icmp_ln895_68_reg_5093[0]_i_2_n_0\ : STD_LOGIC;
  signal icmp_ln895_69_reg_5103 : STD_LOGIC;
  signal \icmp_ln895_69_reg_5103[0]_i_1_n_0\ : STD_LOGIC;
  signal \icmp_ln895_69_reg_5103[0]_i_2_n_0\ : STD_LOGIC;
  signal icmp_ln895_6_reg_4768 : STD_LOGIC;
  signal \icmp_ln895_6_reg_4768[0]_i_1_n_0\ : STD_LOGIC;
  signal icmp_ln895_70_reg_5113 : STD_LOGIC;
  signal \icmp_ln895_70_reg_5113[0]_i_1_n_0\ : STD_LOGIC;
  signal \icmp_ln895_70_reg_5113[0]_i_2_n_0\ : STD_LOGIC;
  signal icmp_ln895_71_reg_5123 : STD_LOGIC;
  signal \icmp_ln895_71_reg_5123[0]_i_1_n_0\ : STD_LOGIC;
  signal \icmp_ln895_71_reg_5123[0]_i_2_n_0\ : STD_LOGIC;
  signal icmp_ln895_72_reg_5133 : STD_LOGIC;
  signal \icmp_ln895_72_reg_5133[0]_i_1_n_0\ : STD_LOGIC;
  signal \icmp_ln895_72_reg_5133[0]_i_2_n_0\ : STD_LOGIC;
  signal icmp_ln895_73_reg_5143 : STD_LOGIC;
  signal \icmp_ln895_73_reg_5143[0]_i_1_n_0\ : STD_LOGIC;
  signal \icmp_ln895_73_reg_5143[0]_i_2_n_0\ : STD_LOGIC;
  signal icmp_ln895_74_reg_5148 : STD_LOGIC;
  signal \icmp_ln895_74_reg_5148[0]_i_1_n_0\ : STD_LOGIC;
  signal \icmp_ln895_74_reg_5148[0]_i_2_n_0\ : STD_LOGIC;
  signal icmp_ln895_75_reg_5153 : STD_LOGIC;
  signal \icmp_ln895_75_reg_5153[0]_i_1_n_0\ : STD_LOGIC;
  signal \icmp_ln895_75_reg_5153[0]_i_2_n_0\ : STD_LOGIC;
  signal icmp_ln895_76_reg_5158 : STD_LOGIC;
  signal \icmp_ln895_76_reg_5158[0]_i_1_n_0\ : STD_LOGIC;
  signal \icmp_ln895_76_reg_5158[0]_i_2_n_0\ : STD_LOGIC;
  signal icmp_ln895_77_reg_5163 : STD_LOGIC;
  signal \icmp_ln895_77_reg_5163[0]_i_1_n_0\ : STD_LOGIC;
  signal \icmp_ln895_77_reg_5163[0]_i_2_n_0\ : STD_LOGIC;
  signal icmp_ln895_78_reg_5168 : STD_LOGIC;
  signal \icmp_ln895_78_reg_5168[0]_i_1_n_0\ : STD_LOGIC;
  signal \icmp_ln895_78_reg_5168[0]_i_2_n_0\ : STD_LOGIC;
  signal icmp_ln895_79_reg_5173 : STD_LOGIC;
  signal \icmp_ln895_79_reg_5173[0]_i_1_n_0\ : STD_LOGIC;
  signal \icmp_ln895_79_reg_5173[0]_i_2_n_0\ : STD_LOGIC;
  signal icmp_ln895_7_reg_4778 : STD_LOGIC;
  signal \icmp_ln895_7_reg_4778[0]_i_1_n_0\ : STD_LOGIC;
  signal icmp_ln895_80_reg_5178 : STD_LOGIC;
  signal \icmp_ln895_80_reg_5178[0]_i_1_n_0\ : STD_LOGIC;
  signal \icmp_ln895_80_reg_5178[0]_i_2_n_0\ : STD_LOGIC;
  signal icmp_ln895_81_reg_5183 : STD_LOGIC;
  signal \icmp_ln895_81_reg_5183[0]_i_1_n_0\ : STD_LOGIC;
  signal icmp_ln895_82_reg_5193 : STD_LOGIC;
  signal \icmp_ln895_82_reg_5193[0]_i_1_n_0\ : STD_LOGIC;
  signal icmp_ln895_83_reg_5203 : STD_LOGIC;
  signal \icmp_ln895_83_reg_5203[0]_i_1_n_0\ : STD_LOGIC;
  signal icmp_ln895_84_reg_5213 : STD_LOGIC;
  signal \icmp_ln895_84_reg_5213[0]_i_1_n_0\ : STD_LOGIC;
  signal icmp_ln895_85_reg_5223 : STD_LOGIC;
  signal \icmp_ln895_85_reg_5223[0]_i_1_n_0\ : STD_LOGIC;
  signal icmp_ln895_86_reg_5233 : STD_LOGIC;
  signal \icmp_ln895_86_reg_5233[0]_i_1_n_0\ : STD_LOGIC;
  signal icmp_ln895_87_reg_5243 : STD_LOGIC;
  signal \icmp_ln895_87_reg_5243[0]_i_1_n_0\ : STD_LOGIC;
  signal icmp_ln895_88_reg_5253 : STD_LOGIC;
  signal \icmp_ln895_88_reg_5253[0]_i_1_n_0\ : STD_LOGIC;
  signal icmp_ln895_89_reg_5263 : STD_LOGIC;
  signal \icmp_ln895_89_reg_5263[0]_i_1_n_0\ : STD_LOGIC;
  signal \icmp_ln895_89_reg_5263[0]_i_2_n_0\ : STD_LOGIC;
  signal icmp_ln895_8_reg_4783 : STD_LOGIC;
  signal \icmp_ln895_8_reg_4783[0]_i_1_n_0\ : STD_LOGIC;
  signal icmp_ln895_90_reg_5268 : STD_LOGIC;
  signal \icmp_ln895_90_reg_5268[0]_i_1_n_0\ : STD_LOGIC;
  signal \icmp_ln895_90_reg_5268[0]_i_2_n_0\ : STD_LOGIC;
  signal icmp_ln895_91_reg_5273 : STD_LOGIC;
  signal \icmp_ln895_91_reg_5273[0]_i_1_n_0\ : STD_LOGIC;
  signal \icmp_ln895_91_reg_5273[0]_i_2_n_0\ : STD_LOGIC;
  signal icmp_ln895_92_reg_5278 : STD_LOGIC;
  signal \icmp_ln895_92_reg_5278[0]_i_1_n_0\ : STD_LOGIC;
  signal \icmp_ln895_92_reg_5278[0]_i_2_n_0\ : STD_LOGIC;
  signal icmp_ln895_93_reg_5283 : STD_LOGIC;
  signal \icmp_ln895_93_reg_5283[0]_i_1_n_0\ : STD_LOGIC;
  signal \icmp_ln895_93_reg_5283[0]_i_2_n_0\ : STD_LOGIC;
  signal icmp_ln895_94_reg_5288 : STD_LOGIC;
  signal \icmp_ln895_94_reg_5288[0]_i_1_n_0\ : STD_LOGIC;
  signal \icmp_ln895_94_reg_5288[0]_i_2_n_0\ : STD_LOGIC;
  signal icmp_ln895_95_reg_5293 : STD_LOGIC;
  signal \icmp_ln895_95_reg_5293[0]_i_1_n_0\ : STD_LOGIC;
  signal \icmp_ln895_95_reg_5293[0]_i_2_n_0\ : STD_LOGIC;
  signal icmp_ln895_96_reg_5298 : STD_LOGIC;
  signal \icmp_ln895_96_reg_5298[0]_i_1_n_0\ : STD_LOGIC;
  signal \icmp_ln895_96_reg_5298[0]_i_2_n_0\ : STD_LOGIC;
  signal icmp_ln895_97_reg_5303 : STD_LOGIC;
  signal \icmp_ln895_97_reg_5303[0]_i_1_n_0\ : STD_LOGIC;
  signal \icmp_ln895_97_reg_5303[0]_i_2_n_0\ : STD_LOGIC;
  signal icmp_ln895_98_reg_5314 : STD_LOGIC;
  signal \icmp_ln895_98_reg_5314[0]_i_1_n_0\ : STD_LOGIC;
  signal \icmp_ln895_98_reg_5314[0]_i_2_n_0\ : STD_LOGIC;
  signal icmp_ln895_99_reg_5325 : STD_LOGIC;
  signal \icmp_ln895_99_reg_5325[0]_i_1_n_0\ : STD_LOGIC;
  signal \icmp_ln895_99_reg_5325[0]_i_2_n_0\ : STD_LOGIC;
  signal icmp_ln895_9_reg_4788 : STD_LOGIC;
  signal \icmp_ln895_9_reg_4788[0]_i_1_n_0\ : STD_LOGIC;
  signal icmp_ln895_reg_4743 : STD_LOGIC;
  signal \icmp_ln895_reg_4743[0]_i_1_n_0\ : STD_LOGIC;
  signal p_0_out : STD_LOGIC_VECTOR ( 6 to 6 );
  signal p_1_in : STD_LOGIC;
  signal p_3_in : STD_LOGIC;
  signal res_max_bin_count_t_1_fu_4624_p3 : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal res_max_bin_count_t_1_reg_5603 : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \res_max_bin_count_t_1_reg_5603[0]_i_2_n_0\ : STD_LOGIC;
  signal \res_max_bin_count_t_1_reg_5603[0]_i_3_n_0\ : STD_LOGIC;
  signal \res_max_bin_count_t_1_reg_5603[0]_i_4_n_0\ : STD_LOGIC;
  signal \res_max_bin_count_t_1_reg_5603[0]_i_5_n_0\ : STD_LOGIC;
  signal \res_max_bin_count_t_1_reg_5603[1]_i_2_n_0\ : STD_LOGIC;
  signal \res_max_bin_count_t_1_reg_5603[1]_i_3_n_0\ : STD_LOGIC;
  signal \res_max_bin_count_t_1_reg_5603[1]_i_4_n_0\ : STD_LOGIC;
  signal \res_max_bin_count_t_1_reg_5603[1]_i_5_n_0\ : STD_LOGIC;
  signal \res_max_bin_count_t_1_reg_5603[2]_i_2_n_0\ : STD_LOGIC;
  signal \res_max_bin_count_t_1_reg_5603[2]_i_3_n_0\ : STD_LOGIC;
  signal \res_max_bin_count_t_1_reg_5603[2]_i_4_n_0\ : STD_LOGIC;
  signal \res_max_bin_count_t_1_reg_5603[3]_i_2_n_0\ : STD_LOGIC;
  signal \res_max_bin_count_t_1_reg_5603[3]_i_3_n_0\ : STD_LOGIC;
  signal res_max_bin_count_t_2_fu_4637_p3 : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal res_max_bin_count_t_s_fu_4600_p3 : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal res_max_bin_count_t_s_reg_5587 : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \res_max_bin_count_t_s_reg_5587[1]_i_4_n_0\ : STD_LOGIC;
  signal \^res_max_bin_r_v\ : STD_LOGIC_VECTOR ( 6 downto 0 );
  signal res_max_bin_r_t_V_1_fu_4616_p3 : STD_LOGIC_VECTOR ( 6 downto 0 );
  signal res_max_bin_r_t_V_1_reg_5598 : STD_LOGIC_VECTOR ( 6 downto 0 );
  signal \res_max_bin_r_t_V_1_reg_5598[0]_i_2_n_0\ : STD_LOGIC;
  signal \res_max_bin_r_t_V_1_reg_5598[0]_i_3_n_0\ : STD_LOGIC;
  signal \res_max_bin_r_t_V_1_reg_5598[0]_i_5_n_0\ : STD_LOGIC;
  signal \res_max_bin_r_t_V_1_reg_5598[0]_i_6_n_0\ : STD_LOGIC;
  signal \res_max_bin_r_t_V_1_reg_5598[1]_i_2_n_0\ : STD_LOGIC;
  signal \res_max_bin_r_t_V_1_reg_5598[1]_i_3_n_0\ : STD_LOGIC;
  signal \res_max_bin_r_t_V_1_reg_5598[1]_i_5_n_0\ : STD_LOGIC;
  signal \res_max_bin_r_t_V_1_reg_5598[1]_i_6_n_0\ : STD_LOGIC;
  signal \res_max_bin_r_t_V_1_reg_5598[2]_i_2_n_0\ : STD_LOGIC;
  signal \res_max_bin_r_t_V_1_reg_5598[2]_i_3_n_0\ : STD_LOGIC;
  signal \res_max_bin_r_t_V_1_reg_5598[2]_i_5_n_0\ : STD_LOGIC;
  signal \res_max_bin_r_t_V_1_reg_5598[2]_i_6_n_0\ : STD_LOGIC;
  signal \res_max_bin_r_t_V_1_reg_5598[3]_i_2_n_0\ : STD_LOGIC;
  signal \res_max_bin_r_t_V_1_reg_5598[3]_i_3_n_0\ : STD_LOGIC;
  signal \res_max_bin_r_t_V_1_reg_5598[3]_i_5_n_0\ : STD_LOGIC;
  signal \res_max_bin_r_t_V_1_reg_5598[3]_i_6_n_0\ : STD_LOGIC;
  signal \res_max_bin_r_t_V_1_reg_5598[4]_i_2_n_0\ : STD_LOGIC;
  signal \res_max_bin_r_t_V_1_reg_5598[4]_i_3_n_0\ : STD_LOGIC;
  signal \res_max_bin_r_t_V_1_reg_5598[4]_i_5_n_0\ : STD_LOGIC;
  signal \res_max_bin_r_t_V_1_reg_5598[4]_i_6_n_0\ : STD_LOGIC;
  signal \res_max_bin_r_t_V_1_reg_5598[5]_i_2_n_0\ : STD_LOGIC;
  signal \res_max_bin_r_t_V_1_reg_5598[5]_i_3_n_0\ : STD_LOGIC;
  signal \res_max_bin_r_t_V_1_reg_5598[5]_i_5_n_0\ : STD_LOGIC;
  signal \res_max_bin_r_t_V_1_reg_5598[5]_i_6_n_0\ : STD_LOGIC;
  signal \res_max_bin_r_t_V_1_reg_5598[6]_i_2_n_0\ : STD_LOGIC;
  signal \res_max_bin_r_t_V_1_reg_5598[6]_i_3_n_0\ : STD_LOGIC;
  signal \res_max_bin_r_t_V_1_reg_5598[6]_i_5_n_0\ : STD_LOGIC;
  signal \res_max_bin_r_t_V_1_reg_5598[6]_i_6_n_0\ : STD_LOGIC;
  signal \res_max_bin_r_t_V_1_reg_5598_reg[0]_i_4_n_0\ : STD_LOGIC;
  signal \res_max_bin_r_t_V_1_reg_5598_reg[1]_i_4_n_0\ : STD_LOGIC;
  signal \res_max_bin_r_t_V_1_reg_5598_reg[2]_i_4_n_0\ : STD_LOGIC;
  signal \res_max_bin_r_t_V_1_reg_5598_reg[3]_i_4_n_0\ : STD_LOGIC;
  signal \res_max_bin_r_t_V_1_reg_5598_reg[4]_i_4_n_0\ : STD_LOGIC;
  signal \res_max_bin_r_t_V_1_reg_5598_reg[5]_i_4_n_0\ : STD_LOGIC;
  signal \res_max_bin_r_t_V_1_reg_5598_reg[6]_i_4_n_0\ : STD_LOGIC;
  signal res_max_bin_r_t_V_2_fu_4652_p3 : STD_LOGIC_VECTOR ( 5 downto 0 );
  signal res_max_bin_r_t_V_fu_4592_p3 : STD_LOGIC_VECTOR ( 6 downto 0 );
  signal res_max_bin_r_t_V_reg_5582 : STD_LOGIC_VECTOR ( 6 downto 0 );
  signal \^res_max_bin_theta_v\ : STD_LOGIC_VECTOR ( 6 downto 0 );
  signal res_max_bin_theta_t_1_fu_4608_p3 : STD_LOGIC_VECTOR ( 6 downto 1 );
  signal res_max_bin_theta_t_1_reg_5593 : STD_LOGIC_VECTOR ( 6 downto 1 );
  signal \res_max_bin_theta_t_1_reg_5593[2]_i_2_n_0\ : STD_LOGIC;
  signal \res_max_bin_theta_t_1_reg_5593[2]_i_3_n_0\ : STD_LOGIC;
  signal \res_max_bin_theta_t_1_reg_5593[2]_i_4_n_0\ : STD_LOGIC;
  signal \res_max_bin_theta_t_1_reg_5593[2]_i_5_n_0\ : STD_LOGIC;
  signal \res_max_bin_theta_t_1_reg_5593[2]_i_6_n_0\ : STD_LOGIC;
  signal \res_max_bin_theta_t_1_reg_5593[2]_i_7_n_0\ : STD_LOGIC;
  signal \res_max_bin_theta_t_1_reg_5593[2]_i_8_n_0\ : STD_LOGIC;
  signal \res_max_bin_theta_t_1_reg_5593[2]_i_9_n_0\ : STD_LOGIC;
  signal \res_max_bin_theta_t_1_reg_5593[3]_i_2_n_0\ : STD_LOGIC;
  signal \res_max_bin_theta_t_1_reg_5593[4]_i_2_n_0\ : STD_LOGIC;
  signal \res_max_bin_theta_t_1_reg_5593[4]_i_3_n_0\ : STD_LOGIC;
  signal \res_max_bin_theta_t_1_reg_5593[4]_i_4_n_0\ : STD_LOGIC;
  signal \res_max_bin_theta_t_1_reg_5593[4]_i_5_n_0\ : STD_LOGIC;
  signal \res_max_bin_theta_t_1_reg_5593[5]_i_10_n_0\ : STD_LOGIC;
  signal \res_max_bin_theta_t_1_reg_5593[5]_i_2_n_0\ : STD_LOGIC;
  signal \res_max_bin_theta_t_1_reg_5593[5]_i_3_n_0\ : STD_LOGIC;
  signal \res_max_bin_theta_t_1_reg_5593[5]_i_5_n_0\ : STD_LOGIC;
  signal \res_max_bin_theta_t_1_reg_5593[5]_i_6_n_0\ : STD_LOGIC;
  signal \res_max_bin_theta_t_1_reg_5593[5]_i_7_n_0\ : STD_LOGIC;
  signal \res_max_bin_theta_t_1_reg_5593[5]_i_8_n_0\ : STD_LOGIC;
  signal \res_max_bin_theta_t_1_reg_5593[5]_i_9_n_0\ : STD_LOGIC;
  signal \res_max_bin_theta_t_1_reg_5593[6]_i_10_n_0\ : STD_LOGIC;
  signal \res_max_bin_theta_t_1_reg_5593[6]_i_11_n_0\ : STD_LOGIC;
  signal \res_max_bin_theta_t_1_reg_5593[6]_i_12_n_0\ : STD_LOGIC;
  signal \res_max_bin_theta_t_1_reg_5593[6]_i_13_n_0\ : STD_LOGIC;
  signal \res_max_bin_theta_t_1_reg_5593[6]_i_14_n_0\ : STD_LOGIC;
  signal \res_max_bin_theta_t_1_reg_5593[6]_i_15_n_0\ : STD_LOGIC;
  signal \res_max_bin_theta_t_1_reg_5593[6]_i_16_n_0\ : STD_LOGIC;
  signal \res_max_bin_theta_t_1_reg_5593[6]_i_17_n_0\ : STD_LOGIC;
  signal \res_max_bin_theta_t_1_reg_5593[6]_i_18_n_0\ : STD_LOGIC;
  signal \res_max_bin_theta_t_1_reg_5593[6]_i_19_n_0\ : STD_LOGIC;
  signal \res_max_bin_theta_t_1_reg_5593[6]_i_20_n_0\ : STD_LOGIC;
  signal \res_max_bin_theta_t_1_reg_5593[6]_i_21_n_0\ : STD_LOGIC;
  signal \res_max_bin_theta_t_1_reg_5593[6]_i_22_n_0\ : STD_LOGIC;
  signal \res_max_bin_theta_t_1_reg_5593[6]_i_23_n_0\ : STD_LOGIC;
  signal \res_max_bin_theta_t_1_reg_5593[6]_i_25_n_0\ : STD_LOGIC;
  signal \res_max_bin_theta_t_1_reg_5593[6]_i_26_n_0\ : STD_LOGIC;
  signal \res_max_bin_theta_t_1_reg_5593[6]_i_27_n_0\ : STD_LOGIC;
  signal \res_max_bin_theta_t_1_reg_5593[6]_i_28_n_0\ : STD_LOGIC;
  signal \res_max_bin_theta_t_1_reg_5593[6]_i_29_n_0\ : STD_LOGIC;
  signal \res_max_bin_theta_t_1_reg_5593[6]_i_30_n_0\ : STD_LOGIC;
  signal \res_max_bin_theta_t_1_reg_5593[6]_i_31_n_0\ : STD_LOGIC;
  signal \res_max_bin_theta_t_1_reg_5593[6]_i_32_n_0\ : STD_LOGIC;
  signal \res_max_bin_theta_t_1_reg_5593[6]_i_33_n_0\ : STD_LOGIC;
  signal \res_max_bin_theta_t_1_reg_5593[6]_i_34_n_0\ : STD_LOGIC;
  signal \res_max_bin_theta_t_1_reg_5593[6]_i_3_n_0\ : STD_LOGIC;
  signal \res_max_bin_theta_t_1_reg_5593[6]_i_4_n_0\ : STD_LOGIC;
  signal \res_max_bin_theta_t_1_reg_5593[6]_i_6_n_0\ : STD_LOGIC;
  signal \res_max_bin_theta_t_1_reg_5593[6]_i_7_n_0\ : STD_LOGIC;
  signal \res_max_bin_theta_t_1_reg_5593[6]_i_8_n_0\ : STD_LOGIC;
  signal \res_max_bin_theta_t_1_reg_5593[6]_i_9_n_0\ : STD_LOGIC;
  signal \res_max_bin_theta_t_1_reg_5593_reg[5]_i_4_n_0\ : STD_LOGIC;
  signal \res_max_bin_theta_t_1_reg_5593_reg[6]_i_24_n_0\ : STD_LOGIC;
  signal \res_max_bin_theta_t_1_reg_5593_reg[6]_i_2_n_0\ : STD_LOGIC;
  signal \res_max_bin_theta_t_1_reg_5593_reg[6]_i_5_n_0\ : STD_LOGIC;
  signal res_max_bin_theta_t_2_fu_4644_p3 : STD_LOGIC_VECTOR ( 6 downto 0 );
  signal roi_seed_r_V_read_reg_4733 : STD_LOGIC_VECTOR ( 21 downto 0 );
  signal roi_seed_r_V_read_reg_4733_pp0_iter1_reg : STD_LOGIC_VECTOR ( 21 downto 0 );
  signal select_ln432_10_fu_2815_p3 : STD_LOGIC_VECTOR ( 6 downto 0 );
  signal select_ln432_10_reg_5098 : STD_LOGIC;
  signal \select_ln432_10_reg_5098_reg_n_0_[0]\ : STD_LOGIC;
  signal \select_ln432_10_reg_5098_reg_n_0_[1]\ : STD_LOGIC;
  signal \select_ln432_10_reg_5098_reg_n_0_[2]\ : STD_LOGIC;
  signal \select_ln432_10_reg_5098_reg_n_0_[3]\ : STD_LOGIC;
  signal \select_ln432_10_reg_5098_reg_n_0_[4]\ : STD_LOGIC;
  signal \select_ln432_10_reg_5098_reg_n_0_[5]\ : STD_LOGIC;
  signal \select_ln432_10_reg_5098_reg_n_0_[6]\ : STD_LOGIC;
  signal select_ln432_11_fu_2823_p3 : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal select_ln432_13_fu_2832_p3 : STD_LOGIC_VECTOR ( 6 downto 0 );
  signal select_ln432_13_reg_5108 : STD_LOGIC;
  signal \select_ln432_13_reg_5108_reg_n_0_[0]\ : STD_LOGIC;
  signal \select_ln432_13_reg_5108_reg_n_0_[1]\ : STD_LOGIC;
  signal \select_ln432_13_reg_5108_reg_n_0_[2]\ : STD_LOGIC;
  signal \select_ln432_13_reg_5108_reg_n_0_[3]\ : STD_LOGIC;
  signal \select_ln432_13_reg_5108_reg_n_0_[4]\ : STD_LOGIC;
  signal \select_ln432_13_reg_5108_reg_n_0_[5]\ : STD_LOGIC;
  signal \select_ln432_13_reg_5108_reg_n_0_[6]\ : STD_LOGIC;
  signal select_ln432_14_fu_2840_p3 : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal select_ln432_16_fu_2849_p3 : STD_LOGIC_VECTOR ( 6 downto 0 );
  signal select_ln432_16_reg_5118 : STD_LOGIC;
  signal \select_ln432_16_reg_5118_reg_n_0_[0]\ : STD_LOGIC;
  signal \select_ln432_16_reg_5118_reg_n_0_[1]\ : STD_LOGIC;
  signal \select_ln432_16_reg_5118_reg_n_0_[2]\ : STD_LOGIC;
  signal \select_ln432_16_reg_5118_reg_n_0_[3]\ : STD_LOGIC;
  signal \select_ln432_16_reg_5118_reg_n_0_[4]\ : STD_LOGIC;
  signal \select_ln432_16_reg_5118_reg_n_0_[5]\ : STD_LOGIC;
  signal \select_ln432_16_reg_5118_reg_n_0_[6]\ : STD_LOGIC;
  signal select_ln432_17_fu_2857_p3 : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal select_ln432_19_fu_2866_p3 : STD_LOGIC_VECTOR ( 6 downto 0 );
  signal select_ln432_19_reg_5128 : STD_LOGIC;
  signal \select_ln432_19_reg_5128_reg_n_0_[0]\ : STD_LOGIC;
  signal \select_ln432_19_reg_5128_reg_n_0_[1]\ : STD_LOGIC;
  signal \select_ln432_19_reg_5128_reg_n_0_[2]\ : STD_LOGIC;
  signal \select_ln432_19_reg_5128_reg_n_0_[3]\ : STD_LOGIC;
  signal \select_ln432_19_reg_5128_reg_n_0_[4]\ : STD_LOGIC;
  signal \select_ln432_19_reg_5128_reg_n_0_[5]\ : STD_LOGIC;
  signal \select_ln432_19_reg_5128_reg_n_0_[6]\ : STD_LOGIC;
  signal select_ln432_1_fu_2764_p3 : STD_LOGIC_VECTOR ( 6 downto 0 );
  signal select_ln432_1_reg_5068 : STD_LOGIC;
  signal \select_ln432_1_reg_5068_reg_n_0_[0]\ : STD_LOGIC;
  signal \select_ln432_1_reg_5068_reg_n_0_[1]\ : STD_LOGIC;
  signal \select_ln432_1_reg_5068_reg_n_0_[2]\ : STD_LOGIC;
  signal \select_ln432_1_reg_5068_reg_n_0_[3]\ : STD_LOGIC;
  signal \select_ln432_1_reg_5068_reg_n_0_[4]\ : STD_LOGIC;
  signal \select_ln432_1_reg_5068_reg_n_0_[5]\ : STD_LOGIC;
  signal \select_ln432_1_reg_5068_reg_n_0_[6]\ : STD_LOGIC;
  signal select_ln432_20_fu_2874_p3 : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal select_ln432_22_fu_2883_p3 : STD_LOGIC_VECTOR ( 6 downto 0 );
  signal select_ln432_22_reg_5138 : STD_LOGIC;
  signal \select_ln432_22_reg_5138_reg_n_0_[0]\ : STD_LOGIC;
  signal \select_ln432_22_reg_5138_reg_n_0_[1]\ : STD_LOGIC;
  signal \select_ln432_22_reg_5138_reg_n_0_[2]\ : STD_LOGIC;
  signal \select_ln432_22_reg_5138_reg_n_0_[3]\ : STD_LOGIC;
  signal \select_ln432_22_reg_5138_reg_n_0_[4]\ : STD_LOGIC;
  signal \select_ln432_22_reg_5138_reg_n_0_[5]\ : STD_LOGIC;
  signal \select_ln432_22_reg_5138_reg_n_0_[6]\ : STD_LOGIC;
  signal select_ln432_23_fu_2891_p3 : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal select_ln432_26_fu_2908_p3 : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal select_ln432_29_fu_2925_p3 : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal select_ln432_2_fu_2772_p3 : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal select_ln432_32_fu_2942_p3 : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal select_ln432_35_fu_2959_p3 : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal select_ln432_38_fu_2976_p3 : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal select_ln432_41_fu_2993_p3 : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal select_ln432_44_fu_3010_p3 : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal select_ln432_47_fu_3027_p3 : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal select_ln432_49_fu_3036_p3 : STD_LOGIC_VECTOR ( 6 downto 0 );
  signal select_ln432_49_reg_5188 : STD_LOGIC;
  signal \select_ln432_49_reg_5188[6]_i_3_n_0\ : STD_LOGIC;
  signal \select_ln432_49_reg_5188_reg_n_0_[0]\ : STD_LOGIC;
  signal \select_ln432_49_reg_5188_reg_n_0_[1]\ : STD_LOGIC;
  signal \select_ln432_49_reg_5188_reg_n_0_[2]\ : STD_LOGIC;
  signal \select_ln432_49_reg_5188_reg_n_0_[3]\ : STD_LOGIC;
  signal \select_ln432_49_reg_5188_reg_n_0_[4]\ : STD_LOGIC;
  signal \select_ln432_49_reg_5188_reg_n_0_[5]\ : STD_LOGIC;
  signal \select_ln432_49_reg_5188_reg_n_0_[6]\ : STD_LOGIC;
  signal select_ln432_4_fu_2781_p3 : STD_LOGIC_VECTOR ( 6 downto 0 );
  signal select_ln432_4_reg_5078 : STD_LOGIC;
  signal \select_ln432_4_reg_5078_reg_n_0_[0]\ : STD_LOGIC;
  signal \select_ln432_4_reg_5078_reg_n_0_[1]\ : STD_LOGIC;
  signal \select_ln432_4_reg_5078_reg_n_0_[2]\ : STD_LOGIC;
  signal \select_ln432_4_reg_5078_reg_n_0_[3]\ : STD_LOGIC;
  signal \select_ln432_4_reg_5078_reg_n_0_[4]\ : STD_LOGIC;
  signal \select_ln432_4_reg_5078_reg_n_0_[5]\ : STD_LOGIC;
  signal \select_ln432_4_reg_5078_reg_n_0_[6]\ : STD_LOGIC;
  signal select_ln432_50_fu_3044_p3 : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal select_ln432_52_fu_3053_p3 : STD_LOGIC_VECTOR ( 6 downto 0 );
  signal select_ln432_52_reg_5198 : STD_LOGIC;
  signal \select_ln432_52_reg_5198[6]_i_3_n_0\ : STD_LOGIC;
  signal \select_ln432_52_reg_5198_reg_n_0_[0]\ : STD_LOGIC;
  signal \select_ln432_52_reg_5198_reg_n_0_[1]\ : STD_LOGIC;
  signal \select_ln432_52_reg_5198_reg_n_0_[2]\ : STD_LOGIC;
  signal \select_ln432_52_reg_5198_reg_n_0_[3]\ : STD_LOGIC;
  signal \select_ln432_52_reg_5198_reg_n_0_[4]\ : STD_LOGIC;
  signal \select_ln432_52_reg_5198_reg_n_0_[5]\ : STD_LOGIC;
  signal \select_ln432_52_reg_5198_reg_n_0_[6]\ : STD_LOGIC;
  signal select_ln432_53_fu_3061_p3 : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal select_ln432_55_fu_3070_p3 : STD_LOGIC_VECTOR ( 6 downto 0 );
  signal select_ln432_55_reg_5208 : STD_LOGIC;
  signal \select_ln432_55_reg_5208[6]_i_3_n_0\ : STD_LOGIC;
  signal \select_ln432_55_reg_5208_reg_n_0_[0]\ : STD_LOGIC;
  signal \select_ln432_55_reg_5208_reg_n_0_[1]\ : STD_LOGIC;
  signal \select_ln432_55_reg_5208_reg_n_0_[2]\ : STD_LOGIC;
  signal \select_ln432_55_reg_5208_reg_n_0_[3]\ : STD_LOGIC;
  signal \select_ln432_55_reg_5208_reg_n_0_[4]\ : STD_LOGIC;
  signal \select_ln432_55_reg_5208_reg_n_0_[5]\ : STD_LOGIC;
  signal \select_ln432_55_reg_5208_reg_n_0_[6]\ : STD_LOGIC;
  signal select_ln432_56_fu_3078_p3 : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal select_ln432_58_fu_3087_p3 : STD_LOGIC_VECTOR ( 6 downto 0 );
  signal select_ln432_58_reg_5218 : STD_LOGIC;
  signal \select_ln432_58_reg_5218[6]_i_3_n_0\ : STD_LOGIC;
  signal \select_ln432_58_reg_5218_reg_n_0_[0]\ : STD_LOGIC;
  signal \select_ln432_58_reg_5218_reg_n_0_[1]\ : STD_LOGIC;
  signal \select_ln432_58_reg_5218_reg_n_0_[2]\ : STD_LOGIC;
  signal \select_ln432_58_reg_5218_reg_n_0_[3]\ : STD_LOGIC;
  signal \select_ln432_58_reg_5218_reg_n_0_[4]\ : STD_LOGIC;
  signal \select_ln432_58_reg_5218_reg_n_0_[5]\ : STD_LOGIC;
  signal \select_ln432_58_reg_5218_reg_n_0_[6]\ : STD_LOGIC;
  signal select_ln432_59_fu_3095_p3 : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal select_ln432_5_fu_2789_p3 : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal select_ln432_61_fu_3104_p3 : STD_LOGIC_VECTOR ( 6 downto 0 );
  signal select_ln432_61_reg_5228 : STD_LOGIC;
  signal \select_ln432_61_reg_5228[6]_i_3_n_0\ : STD_LOGIC;
  signal \select_ln432_61_reg_5228_reg_n_0_[0]\ : STD_LOGIC;
  signal \select_ln432_61_reg_5228_reg_n_0_[1]\ : STD_LOGIC;
  signal \select_ln432_61_reg_5228_reg_n_0_[2]\ : STD_LOGIC;
  signal \select_ln432_61_reg_5228_reg_n_0_[3]\ : STD_LOGIC;
  signal \select_ln432_61_reg_5228_reg_n_0_[4]\ : STD_LOGIC;
  signal \select_ln432_61_reg_5228_reg_n_0_[5]\ : STD_LOGIC;
  signal \select_ln432_61_reg_5228_reg_n_0_[6]\ : STD_LOGIC;
  signal select_ln432_62_fu_3112_p3 : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal select_ln432_64_fu_3121_p3 : STD_LOGIC_VECTOR ( 6 downto 0 );
  signal select_ln432_64_reg_5238 : STD_LOGIC;
  signal \select_ln432_64_reg_5238[6]_i_3_n_0\ : STD_LOGIC;
  signal \select_ln432_64_reg_5238_reg_n_0_[0]\ : STD_LOGIC;
  signal \select_ln432_64_reg_5238_reg_n_0_[1]\ : STD_LOGIC;
  signal \select_ln432_64_reg_5238_reg_n_0_[2]\ : STD_LOGIC;
  signal \select_ln432_64_reg_5238_reg_n_0_[3]\ : STD_LOGIC;
  signal \select_ln432_64_reg_5238_reg_n_0_[4]\ : STD_LOGIC;
  signal \select_ln432_64_reg_5238_reg_n_0_[5]\ : STD_LOGIC;
  signal \select_ln432_64_reg_5238_reg_n_0_[6]\ : STD_LOGIC;
  signal select_ln432_65_fu_3129_p3 : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal select_ln432_67_fu_3138_p3 : STD_LOGIC_VECTOR ( 6 downto 0 );
  signal select_ln432_67_reg_5248 : STD_LOGIC;
  signal \select_ln432_67_reg_5248[6]_i_3_n_0\ : STD_LOGIC;
  signal \select_ln432_67_reg_5248_reg_n_0_[0]\ : STD_LOGIC;
  signal \select_ln432_67_reg_5248_reg_n_0_[1]\ : STD_LOGIC;
  signal \select_ln432_67_reg_5248_reg_n_0_[2]\ : STD_LOGIC;
  signal \select_ln432_67_reg_5248_reg_n_0_[3]\ : STD_LOGIC;
  signal \select_ln432_67_reg_5248_reg_n_0_[4]\ : STD_LOGIC;
  signal \select_ln432_67_reg_5248_reg_n_0_[5]\ : STD_LOGIC;
  signal \select_ln432_67_reg_5248_reg_n_0_[6]\ : STD_LOGIC;
  signal select_ln432_68_fu_3146_p3 : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal select_ln432_70_fu_3155_p3 : STD_LOGIC_VECTOR ( 6 downto 0 );
  signal select_ln432_70_reg_5258 : STD_LOGIC;
  signal \select_ln432_70_reg_5258[6]_i_3_n_0\ : STD_LOGIC;
  signal \select_ln432_70_reg_5258_reg_n_0_[0]\ : STD_LOGIC;
  signal \select_ln432_70_reg_5258_reg_n_0_[1]\ : STD_LOGIC;
  signal \select_ln432_70_reg_5258_reg_n_0_[2]\ : STD_LOGIC;
  signal \select_ln432_70_reg_5258_reg_n_0_[3]\ : STD_LOGIC;
  signal \select_ln432_70_reg_5258_reg_n_0_[4]\ : STD_LOGIC;
  signal \select_ln432_70_reg_5258_reg_n_0_[5]\ : STD_LOGIC;
  signal \select_ln432_70_reg_5258_reg_n_0_[6]\ : STD_LOGIC;
  signal select_ln432_71_fu_3163_p3 : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal select_ln432_73_fu_3172_p3 : STD_LOGIC_VECTOR ( 6 downto 0 );
  signal select_ln432_74_fu_3180_p3 : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal select_ln432_76_fu_3189_p3 : STD_LOGIC_VECTOR ( 6 downto 0 );
  signal select_ln432_77_fu_3197_p3 : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal select_ln432_79_fu_3206_p3 : STD_LOGIC_VECTOR ( 6 downto 0 );
  signal select_ln432_7_fu_2798_p3 : STD_LOGIC_VECTOR ( 6 downto 0 );
  signal select_ln432_7_reg_5088 : STD_LOGIC;
  signal \select_ln432_7_reg_5088_reg_n_0_[0]\ : STD_LOGIC;
  signal \select_ln432_7_reg_5088_reg_n_0_[1]\ : STD_LOGIC;
  signal \select_ln432_7_reg_5088_reg_n_0_[2]\ : STD_LOGIC;
  signal \select_ln432_7_reg_5088_reg_n_0_[3]\ : STD_LOGIC;
  signal \select_ln432_7_reg_5088_reg_n_0_[4]\ : STD_LOGIC;
  signal \select_ln432_7_reg_5088_reg_n_0_[5]\ : STD_LOGIC;
  signal \select_ln432_7_reg_5088_reg_n_0_[6]\ : STD_LOGIC;
  signal select_ln432_80_fu_3214_p3 : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal select_ln432_82_fu_3223_p3 : STD_LOGIC_VECTOR ( 6 downto 0 );
  signal select_ln432_83_fu_3231_p3 : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal select_ln432_85_fu_3240_p3 : STD_LOGIC_VECTOR ( 6 downto 0 );
  signal select_ln432_86_fu_3248_p3 : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal select_ln432_88_fu_3257_p3 : STD_LOGIC_VECTOR ( 6 downto 0 );
  signal select_ln432_89_fu_3265_p3 : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal select_ln432_8_fu_2806_p3 : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal select_ln432_91_fu_3274_p3 : STD_LOGIC_VECTOR ( 6 downto 0 );
  signal select_ln432_92_fu_3282_p3 : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal select_ln432_94_fu_3291_p3 : STD_LOGIC_VECTOR ( 6 downto 0 );
  signal select_ln432_95_fu_3299_p3 : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal select_ln450_11_fu_3335_p3 : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal select_ln450_11_reg_5342 : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \select_ln450_11_reg_5342[1]_i_4_n_0\ : STD_LOGIC;
  signal select_ln450_14_fu_3344_p3 : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal select_ln450_14_reg_5353 : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \select_ln450_14_reg_5353[1]_i_4_n_0\ : STD_LOGIC;
  signal select_ln450_17_fu_3353_p3 : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal select_ln450_17_reg_5364 : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \select_ln450_17_reg_5364[1]_i_4_n_0\ : STD_LOGIC;
  signal select_ln450_20_fu_3362_p3 : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal select_ln450_20_reg_5375 : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \select_ln450_20_reg_5375[1]_i_4_n_0\ : STD_LOGIC;
  signal select_ln450_23_fu_3371_p3 : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal select_ln450_23_reg_5386 : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \select_ln450_23_reg_5386[1]_i_4_n_0\ : STD_LOGIC;
  signal select_ln450_25_fu_3380_p3 : STD_LOGIC_VECTOR ( 6 downto 0 );
  signal \select_ln450_25_reg_5396[6]_i_1_n_0\ : STD_LOGIC;
  signal \select_ln450_25_reg_5396_reg_n_0_[0]\ : STD_LOGIC;
  signal \select_ln450_25_reg_5396_reg_n_0_[1]\ : STD_LOGIC;
  signal \select_ln450_25_reg_5396_reg_n_0_[2]\ : STD_LOGIC;
  signal \select_ln450_25_reg_5396_reg_n_0_[3]\ : STD_LOGIC;
  signal \select_ln450_25_reg_5396_reg_n_0_[4]\ : STD_LOGIC;
  signal \select_ln450_25_reg_5396_reg_n_0_[5]\ : STD_LOGIC;
  signal \select_ln450_25_reg_5396_reg_n_0_[6]\ : STD_LOGIC;
  signal select_ln450_26_fu_3388_p3 : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal select_ln450_26_reg_5401 : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \select_ln450_26_reg_5401[1]_i_4_n_0\ : STD_LOGIC;
  signal select_ln450_28_fu_3397_p3 : STD_LOGIC_VECTOR ( 6 downto 0 );
  signal \select_ln450_28_reg_5411[6]_i_1_n_0\ : STD_LOGIC;
  signal \select_ln450_28_reg_5411_reg_n_0_[0]\ : STD_LOGIC;
  signal \select_ln450_28_reg_5411_reg_n_0_[1]\ : STD_LOGIC;
  signal \select_ln450_28_reg_5411_reg_n_0_[2]\ : STD_LOGIC;
  signal \select_ln450_28_reg_5411_reg_n_0_[3]\ : STD_LOGIC;
  signal \select_ln450_28_reg_5411_reg_n_0_[4]\ : STD_LOGIC;
  signal \select_ln450_28_reg_5411_reg_n_0_[5]\ : STD_LOGIC;
  signal \select_ln450_28_reg_5411_reg_n_0_[6]\ : STD_LOGIC;
  signal select_ln450_29_fu_3405_p3 : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal select_ln450_29_reg_5416 : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \select_ln450_29_reg_5416[1]_i_4_n_0\ : STD_LOGIC;
  signal select_ln450_2_fu_3308_p3 : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal select_ln450_2_reg_5309 : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \select_ln450_2_reg_5309[1]_i_4_n_0\ : STD_LOGIC;
  signal select_ln450_31_fu_3414_p3 : STD_LOGIC_VECTOR ( 6 downto 0 );
  signal \select_ln450_31_reg_5426[6]_i_1_n_0\ : STD_LOGIC;
  signal \select_ln450_31_reg_5426_reg_n_0_[0]\ : STD_LOGIC;
  signal \select_ln450_31_reg_5426_reg_n_0_[1]\ : STD_LOGIC;
  signal \select_ln450_31_reg_5426_reg_n_0_[2]\ : STD_LOGIC;
  signal \select_ln450_31_reg_5426_reg_n_0_[3]\ : STD_LOGIC;
  signal \select_ln450_31_reg_5426_reg_n_0_[4]\ : STD_LOGIC;
  signal \select_ln450_31_reg_5426_reg_n_0_[5]\ : STD_LOGIC;
  signal \select_ln450_31_reg_5426_reg_n_0_[6]\ : STD_LOGIC;
  signal select_ln450_32_fu_3422_p3 : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal select_ln450_32_reg_5431 : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \select_ln450_32_reg_5431[1]_i_4_n_0\ : STD_LOGIC;
  signal select_ln450_34_fu_3431_p3 : STD_LOGIC_VECTOR ( 6 downto 0 );
  signal \select_ln450_34_reg_5441[6]_i_1_n_0\ : STD_LOGIC;
  signal \select_ln450_34_reg_5441_reg_n_0_[0]\ : STD_LOGIC;
  signal \select_ln450_34_reg_5441_reg_n_0_[1]\ : STD_LOGIC;
  signal \select_ln450_34_reg_5441_reg_n_0_[2]\ : STD_LOGIC;
  signal \select_ln450_34_reg_5441_reg_n_0_[3]\ : STD_LOGIC;
  signal \select_ln450_34_reg_5441_reg_n_0_[4]\ : STD_LOGIC;
  signal \select_ln450_34_reg_5441_reg_n_0_[5]\ : STD_LOGIC;
  signal \select_ln450_34_reg_5441_reg_n_0_[6]\ : STD_LOGIC;
  signal select_ln450_35_fu_3439_p3 : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal select_ln450_35_reg_5446 : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \select_ln450_35_reg_5446[1]_i_4_n_0\ : STD_LOGIC;
  signal select_ln450_37_fu_3448_p3 : STD_LOGIC_VECTOR ( 6 downto 0 );
  signal \select_ln450_37_reg_5456[6]_i_1_n_0\ : STD_LOGIC;
  signal \select_ln450_37_reg_5456_reg_n_0_[0]\ : STD_LOGIC;
  signal \select_ln450_37_reg_5456_reg_n_0_[1]\ : STD_LOGIC;
  signal \select_ln450_37_reg_5456_reg_n_0_[2]\ : STD_LOGIC;
  signal \select_ln450_37_reg_5456_reg_n_0_[3]\ : STD_LOGIC;
  signal \select_ln450_37_reg_5456_reg_n_0_[4]\ : STD_LOGIC;
  signal \select_ln450_37_reg_5456_reg_n_0_[5]\ : STD_LOGIC;
  signal \select_ln450_37_reg_5456_reg_n_0_[6]\ : STD_LOGIC;
  signal select_ln450_38_fu_3456_p3 : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal select_ln450_38_reg_5461 : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \select_ln450_38_reg_5461[1]_i_4_n_0\ : STD_LOGIC;
  signal select_ln450_40_fu_3465_p3 : STD_LOGIC_VECTOR ( 6 downto 0 );
  signal \select_ln450_40_reg_5471[6]_i_1_n_0\ : STD_LOGIC;
  signal \select_ln450_40_reg_5471_reg_n_0_[0]\ : STD_LOGIC;
  signal \select_ln450_40_reg_5471_reg_n_0_[1]\ : STD_LOGIC;
  signal \select_ln450_40_reg_5471_reg_n_0_[2]\ : STD_LOGIC;
  signal \select_ln450_40_reg_5471_reg_n_0_[3]\ : STD_LOGIC;
  signal \select_ln450_40_reg_5471_reg_n_0_[4]\ : STD_LOGIC;
  signal \select_ln450_40_reg_5471_reg_n_0_[5]\ : STD_LOGIC;
  signal \select_ln450_40_reg_5471_reg_n_0_[6]\ : STD_LOGIC;
  signal select_ln450_41_fu_3473_p3 : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal select_ln450_41_reg_5476 : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \select_ln450_41_reg_5476[1]_i_4_n_0\ : STD_LOGIC;
  signal select_ln450_43_fu_3482_p3 : STD_LOGIC_VECTOR ( 6 downto 0 );
  signal \select_ln450_43_reg_5486[6]_i_1_n_0\ : STD_LOGIC;
  signal \select_ln450_43_reg_5486_reg_n_0_[0]\ : STD_LOGIC;
  signal \select_ln450_43_reg_5486_reg_n_0_[1]\ : STD_LOGIC;
  signal \select_ln450_43_reg_5486_reg_n_0_[2]\ : STD_LOGIC;
  signal \select_ln450_43_reg_5486_reg_n_0_[3]\ : STD_LOGIC;
  signal \select_ln450_43_reg_5486_reg_n_0_[4]\ : STD_LOGIC;
  signal \select_ln450_43_reg_5486_reg_n_0_[5]\ : STD_LOGIC;
  signal \select_ln450_43_reg_5486_reg_n_0_[6]\ : STD_LOGIC;
  signal select_ln450_44_fu_3490_p3 : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal select_ln450_44_reg_5491 : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \select_ln450_44_reg_5491[1]_i_4_n_0\ : STD_LOGIC;
  signal select_ln450_46_fu_3499_p3 : STD_LOGIC_VECTOR ( 6 downto 0 );
  signal \select_ln450_46_reg_5501[6]_i_1_n_0\ : STD_LOGIC;
  signal \select_ln450_46_reg_5501_reg_n_0_[0]\ : STD_LOGIC;
  signal \select_ln450_46_reg_5501_reg_n_0_[1]\ : STD_LOGIC;
  signal \select_ln450_46_reg_5501_reg_n_0_[2]\ : STD_LOGIC;
  signal \select_ln450_46_reg_5501_reg_n_0_[3]\ : STD_LOGIC;
  signal \select_ln450_46_reg_5501_reg_n_0_[4]\ : STD_LOGIC;
  signal \select_ln450_46_reg_5501_reg_n_0_[5]\ : STD_LOGIC;
  signal \select_ln450_46_reg_5501_reg_n_0_[6]\ : STD_LOGIC;
  signal select_ln450_47_fu_3507_p3 : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal select_ln450_47_reg_5506 : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \select_ln450_47_reg_5506[1]_i_4_n_0\ : STD_LOGIC;
  signal select_ln450_5_fu_3317_p3 : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal select_ln450_5_reg_5320 : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \select_ln450_5_reg_5320[1]_i_4_n_0\ : STD_LOGIC;
  signal select_ln450_8_fu_3326_p3 : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal select_ln450_8_reg_5331 : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \select_ln450_8_reg_5331[1]_i_4_n_0\ : STD_LOGIC;
  signal select_ln450_fu_4188_p3 : STD_LOGIC_VECTOR ( 6 to 6 );
  signal select_ln468_13_fu_4423_p3 : STD_LOGIC_VECTOR ( 6 downto 0 );
  signal select_ln468_14_fu_4429_p3 : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal select_ln468_19_fu_4461_p3 : STD_LOGIC_VECTOR ( 6 downto 0 );
  signal select_ln468_1_fu_4347_p3 : STD_LOGIC_VECTOR ( 6 downto 0 );
  signal select_ln468_20_fu_4467_p3 : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal select_ln468_2_fu_4353_p3 : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal select_ln468_7_fu_4385_p3 : STD_LOGIC_VECTOR ( 6 downto 0 );
  signal select_ln468_8_fu_4391_p3 : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal select_ln486_1_fu_4500_p3 : STD_LOGIC_VECTOR ( 6 downto 0 );
  signal select_ln486_2_fu_4508_p3 : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal select_ln486_6_fu_4542_p3 : STD_LOGIC_VECTOR ( 6 downto 2 );
  signal select_ln486_6_reg_5572 : STD_LOGIC_VECTOR ( 6 downto 2 );
  signal \select_ln486_6_reg_5572[4]_i_2_n_0\ : STD_LOGIC;
  signal \select_ln486_6_reg_5572[5]_i_2_n_0\ : STD_LOGIC;
  signal \select_ln486_6_reg_5572[5]_i_3_n_0\ : STD_LOGIC;
  signal \select_ln486_6_reg_5572[5]_i_4_n_0\ : STD_LOGIC;
  signal \select_ln486_6_reg_5572[5]_i_5_n_0\ : STD_LOGIC;
  signal \select_ln486_6_reg_5572[6]_i_14_n_0\ : STD_LOGIC;
  signal \select_ln486_6_reg_5572[6]_i_16_n_0\ : STD_LOGIC;
  signal \select_ln486_6_reg_5572[6]_i_17_n_0\ : STD_LOGIC;
  signal \select_ln486_6_reg_5572[6]_i_2_n_0\ : STD_LOGIC;
  signal \select_ln486_6_reg_5572[6]_i_3_n_0\ : STD_LOGIC;
  signal \select_ln486_6_reg_5572[6]_i_4_n_0\ : STD_LOGIC;
  signal \select_ln486_6_reg_5572[6]_i_6_n_0\ : STD_LOGIC;
  signal \select_ln486_6_reg_5572[6]_i_7_n_0\ : STD_LOGIC;
  signal \select_ln486_6_reg_5572[6]_i_8_n_0\ : STD_LOGIC;
  signal \select_ln486_6_reg_5572_reg[6]_i_5_n_0\ : STD_LOGIC;
  signal select_ln486_7_fu_4550_p3 : STD_LOGIC_VECTOR ( 6 downto 0 );
  signal select_ln486_8_fu_4558_p3 : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal select_ln486_fu_4492_p3 : STD_LOGIC_VECTOR ( 6 downto 2 );
  signal select_ln486_reg_5567 : STD_LOGIC_VECTOR ( 6 downto 2 );
  signal \select_ln486_reg_5567[4]_i_2_n_0\ : STD_LOGIC;
  signal \select_ln486_reg_5567[5]_i_2_n_0\ : STD_LOGIC;
  signal \select_ln486_reg_5567[5]_i_3_n_0\ : STD_LOGIC;
  signal \select_ln486_reg_5567[5]_i_4_n_0\ : STD_LOGIC;
  signal \select_ln486_reg_5567[5]_i_5_n_0\ : STD_LOGIC;
  signal \select_ln486_reg_5567[6]_i_13_n_0\ : STD_LOGIC;
  signal \select_ln486_reg_5567[6]_i_14_n_0\ : STD_LOGIC;
  signal \select_ln486_reg_5567[6]_i_16_n_0\ : STD_LOGIC;
  signal \select_ln486_reg_5567[6]_i_17_n_0\ : STD_LOGIC;
  signal \select_ln486_reg_5567[6]_i_3_n_0\ : STD_LOGIC;
  signal \select_ln486_reg_5567[6]_i_4_n_0\ : STD_LOGIC;
  signal \select_ln486_reg_5567[6]_i_6_n_0\ : STD_LOGIC;
  signal \select_ln486_reg_5567[6]_i_7_n_0\ : STD_LOGIC;
  signal \select_ln486_reg_5567[6]_i_8_n_0\ : STD_LOGIC;
  signal \select_ln486_reg_5567_reg[6]_i_5_n_0\ : STD_LOGIC;
  signal slcvec_angle_polar_o_reg_4738 : STD_LOGIC_VECTOR ( 13 downto 0 );
  signal slcvec_angle_polar_o_reg_4738_pp0_iter1_reg : STD_LOGIC_VECTOR ( 13 downto 0 );
  signal tmp_V_fu_4658_p2 : STD_LOGIC_VECTOR ( 6 downto 0 );
  signal \NLW_hls_LT_r_global_V_1_data_reg_reg[21]_i_1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 2 );
  signal \NLW_hls_LT_r_global_V_1_data_reg_reg[21]_i_1_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 3 );
  signal \NLW_hls_LT_theta_global_V_1_data_reg_reg[13]_i_1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 4 );
  signal \NLW_hls_LT_theta_global_V_1_data_reg_reg[13]_i_1_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 5 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \hls_LT_r_V_1_data_reg[5]_i_1\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \hls_LT_r_V_1_data_reg[6]_i_1\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \hls_LT_r_global_V_1_data_reg[18]_i_3\ : label is "soft_lutpair66";
  attribute SOFT_HLUTNM of \hls_LT_theta_V_1_data_reg[2]_i_1\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \hls_LT_theta_V_1_data_reg[3]_i_1\ : label is "soft_lutpair55";
  attribute SOFT_HLUTNM of \hls_LT_theta_V_1_data_reg[7]_i_1\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \hls_LT_theta_global_V_1_data_reg[8]_i_11\ : label is "soft_lutpair55";
  attribute SOFT_HLUTNM of \icmp_ln895_100_reg_5336[0]_i_3\ : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of \icmp_ln895_101_reg_5347[0]_i_3\ : label is "soft_lutpair51";
  attribute SOFT_HLUTNM of \icmp_ln895_102_reg_5358[0]_i_3\ : label is "soft_lutpair24";
  attribute SOFT_HLUTNM of \icmp_ln895_103_reg_5369[0]_i_3\ : label is "soft_lutpair49";
  attribute SOFT_HLUTNM of \icmp_ln895_106_reg_5406[0]_i_3\ : label is "soft_lutpair32";
  attribute SOFT_HLUTNM of \icmp_ln895_108_reg_5436[0]_i_3\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \icmp_ln895_109_reg_5451[0]_i_3\ : label is "soft_lutpair38";
  attribute SOFT_HLUTNM of \icmp_ln895_110_reg_5466[0]_i_3\ : label is "soft_lutpair22";
  attribute SOFT_HLUTNM of \icmp_ln895_111_reg_5481[0]_i_3\ : label is "soft_lutpair45";
  attribute SOFT_HLUTNM of \icmp_ln895_112_reg_5496[0]_i_3\ : label is "soft_lutpair29";
  attribute SOFT_HLUTNM of \icmp_ln895_125_reg_5577[0]_i_1\ : label is "soft_lutpair16";
  attribute SOFT_HLUTNM of \icmp_ln895_65_reg_5063[0]_i_1\ : label is "soft_lutpair35";
  attribute SOFT_HLUTNM of \icmp_ln895_66_reg_5073[0]_i_1\ : label is "soft_lutpair37";
  attribute SOFT_HLUTNM of \icmp_ln895_67_reg_5083[0]_i_1\ : label is "soft_lutpair52";
  attribute SOFT_HLUTNM of \icmp_ln895_68_reg_5093[0]_i_1\ : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of \icmp_ln895_69_reg_5103[0]_i_1\ : label is "soft_lutpair51";
  attribute SOFT_HLUTNM of \icmp_ln895_70_reg_5113[0]_i_1\ : label is "soft_lutpair24";
  attribute SOFT_HLUTNM of \icmp_ln895_71_reg_5123[0]_i_1\ : label is "soft_lutpair49";
  attribute SOFT_HLUTNM of \icmp_ln895_72_reg_5133[0]_i_1\ : label is "soft_lutpair13";
  attribute SOFT_HLUTNM of \icmp_ln895_73_reg_5143[0]_i_1\ : label is "soft_lutpair44";
  attribute SOFT_HLUTNM of \icmp_ln895_74_reg_5148[0]_i_1\ : label is "soft_lutpair32";
  attribute SOFT_HLUTNM of \icmp_ln895_75_reg_5153[0]_i_1\ : label is "soft_lutpair50";
  attribute SOFT_HLUTNM of \icmp_ln895_76_reg_5158[0]_i_1\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \icmp_ln895_77_reg_5163[0]_i_1\ : label is "soft_lutpair38";
  attribute SOFT_HLUTNM of \icmp_ln895_78_reg_5168[0]_i_1\ : label is "soft_lutpair22";
  attribute SOFT_HLUTNM of \icmp_ln895_79_reg_5173[0]_i_1\ : label is "soft_lutpair45";
  attribute SOFT_HLUTNM of \icmp_ln895_80_reg_5178[0]_i_1\ : label is "soft_lutpair29";
  attribute SOFT_HLUTNM of \icmp_ln895_81_reg_5183[0]_i_1\ : label is "soft_lutpair36";
  attribute SOFT_HLUTNM of \icmp_ln895_82_reg_5193[0]_i_1\ : label is "soft_lutpair34";
  attribute SOFT_HLUTNM of \icmp_ln895_83_reg_5203[0]_i_1\ : label is "soft_lutpair54";
  attribute SOFT_HLUTNM of \icmp_ln895_84_reg_5213[0]_i_1\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \icmp_ln895_85_reg_5223[0]_i_1\ : label is "soft_lutpair39";
  attribute SOFT_HLUTNM of \icmp_ln895_86_reg_5233[0]_i_1\ : label is "soft_lutpair23";
  attribute SOFT_HLUTNM of \icmp_ln895_87_reg_5243[0]_i_1\ : label is "soft_lutpair47";
  attribute SOFT_HLUTNM of \icmp_ln895_88_reg_5253[0]_i_1\ : label is "soft_lutpair28";
  attribute SOFT_HLUTNM of \icmp_ln895_89_reg_5263[0]_i_1\ : label is "soft_lutpair48";
  attribute SOFT_HLUTNM of \icmp_ln895_90_reg_5268[0]_i_1\ : label is "soft_lutpair31";
  attribute SOFT_HLUTNM of \icmp_ln895_91_reg_5273[0]_i_1\ : label is "soft_lutpair46";
  attribute SOFT_HLUTNM of \icmp_ln895_92_reg_5278[0]_i_1\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \icmp_ln895_93_reg_5283[0]_i_1\ : label is "soft_lutpair33";
  attribute SOFT_HLUTNM of \icmp_ln895_94_reg_5288[0]_i_1\ : label is "soft_lutpair21";
  attribute SOFT_HLUTNM of \icmp_ln895_95_reg_5293[0]_i_1\ : label is "soft_lutpair43";
  attribute SOFT_HLUTNM of \icmp_ln895_96_reg_5298[0]_i_1\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \icmp_ln895_98_reg_5314[0]_i_3\ : label is "soft_lutpair37";
  attribute SOFT_HLUTNM of \res_max_bin_count_V_1_data_reg[0]_i_1\ : label is "soft_lutpair66";
  attribute SOFT_HLUTNM of \res_max_bin_count_V_1_data_reg[1]_i_1\ : label is "soft_lutpair67";
  attribute SOFT_HLUTNM of \res_max_bin_count_V_1_data_reg[3]_i_1\ : label is "soft_lutpair67";
  attribute SOFT_HLUTNM of \res_max_bin_count_t_1_reg_5603[0]_i_2\ : label is "soft_lutpair72";
  attribute SOFT_HLUTNM of \res_max_bin_count_t_1_reg_5603[0]_i_3\ : label is "soft_lutpair68";
  attribute SOFT_HLUTNM of \res_max_bin_count_t_1_reg_5603[0]_i_5\ : label is "soft_lutpair76";
  attribute SOFT_HLUTNM of \res_max_bin_count_t_1_reg_5603[1]_i_2\ : label is "soft_lutpair69";
  attribute SOFT_HLUTNM of \res_max_bin_count_t_1_reg_5603[1]_i_3\ : label is "soft_lutpair68";
  attribute SOFT_HLUTNM of \res_max_bin_count_t_1_reg_5603[1]_i_4\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \res_max_bin_count_t_1_reg_5603[2]_i_2\ : label is "soft_lutpair72";
  attribute SOFT_HLUTNM of \res_max_bin_count_t_1_reg_5603[2]_i_4\ : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of \res_max_bin_count_t_1_reg_5603[3]_i_1\ : label is "soft_lutpair26";
  attribute SOFT_HLUTNM of \res_max_bin_count_t_1_reg_5603[3]_i_2\ : label is "soft_lutpair56";
  attribute SOFT_HLUTNM of \res_max_bin_count_t_s_reg_5587[0]_i_1\ : label is "soft_lutpair18";
  attribute SOFT_HLUTNM of \res_max_bin_count_t_s_reg_5587[0]_i_2\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \res_max_bin_count_t_s_reg_5587[0]_i_4\ : label is "soft_lutpair60";
  attribute SOFT_HLUTNM of \res_max_bin_count_t_s_reg_5587[0]_i_5\ : label is "soft_lutpair61";
  attribute SOFT_HLUTNM of \res_max_bin_count_t_s_reg_5587[1]_i_2\ : label is "soft_lutpair27";
  attribute SOFT_HLUTNM of \res_max_bin_count_t_s_reg_5587[1]_i_3\ : label is "soft_lutpair17";
  attribute SOFT_HLUTNM of \res_max_bin_count_t_s_reg_5587[1]_i_5\ : label is "soft_lutpair70";
  attribute SOFT_HLUTNM of \res_max_bin_count_t_s_reg_5587[1]_i_6\ : label is "soft_lutpair71";
  attribute SOFT_HLUTNM of \res_max_bin_count_t_s_reg_5587[2]_i_2\ : label is "soft_lutpair15";
  attribute SOFT_HLUTNM of \res_max_bin_count_t_s_reg_5587[2]_i_3\ : label is "soft_lutpair14";
  attribute SOFT_HLUTNM of \res_max_bin_count_t_s_reg_5587[3]_i_1\ : label is "soft_lutpair18";
  attribute SOFT_HLUTNM of \res_max_bin_count_t_s_reg_5587[3]_i_2\ : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of \res_max_bin_count_t_s_reg_5587[3]_i_3\ : label is "soft_lutpair12";
  attribute SOFT_HLUTNM of \res_max_bin_r_t_V_reg_5582[6]_i_1\ : label is "soft_lutpair16";
  attribute SOFT_HLUTNM of \res_max_bin_theta_t_1_reg_5593[2]_i_3\ : label is "soft_lutpair76";
  attribute SOFT_HLUTNM of \res_max_bin_theta_t_1_reg_5593[2]_i_4\ : label is "soft_lutpair74";
  attribute SOFT_HLUTNM of \res_max_bin_theta_t_1_reg_5593[2]_i_6\ : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of \res_max_bin_theta_t_1_reg_5593[2]_i_9\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \res_max_bin_theta_t_1_reg_5593[3]_i_2\ : label is "soft_lutpair74";
  attribute SOFT_HLUTNM of \res_max_bin_theta_t_1_reg_5593[4]_i_2\ : label is "soft_lutpair59";
  attribute SOFT_HLUTNM of \res_max_bin_theta_t_1_reg_5593[4]_i_3\ : label is "soft_lutpair57";
  attribute SOFT_HLUTNM of \res_max_bin_theta_t_1_reg_5593[4]_i_5\ : label is "soft_lutpair58";
  attribute SOFT_HLUTNM of \res_max_bin_theta_t_1_reg_5593[5]_i_5\ : label is "soft_lutpair59";
  attribute SOFT_HLUTNM of \res_max_bin_theta_t_1_reg_5593[5]_i_6\ : label is "soft_lutpair57";
  attribute SOFT_HLUTNM of \res_max_bin_theta_t_1_reg_5593[5]_i_9\ : label is "soft_lutpair58";
  attribute SOFT_HLUTNM of \res_max_bin_theta_t_1_reg_5593[6]_i_10\ : label is "soft_lutpair26";
  attribute SOFT_HLUTNM of \res_max_bin_theta_t_1_reg_5593[6]_i_14\ : label is "soft_lutpair69";
  attribute SOFT_HLUTNM of \res_max_bin_theta_t_1_reg_5593[6]_i_18\ : label is "soft_lutpair56";
  attribute SOFT_HLUTNM of \select_ln450_11_reg_5342[2]_i_2\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \select_ln450_14_reg_5353[2]_i_2\ : label is "soft_lutpair39";
  attribute SOFT_HLUTNM of \select_ln450_17_reg_5364[2]_i_2\ : label is "soft_lutpair23";
  attribute SOFT_HLUTNM of \select_ln450_20_reg_5375[2]_i_2\ : label is "soft_lutpair47";
  attribute SOFT_HLUTNM of \select_ln450_23_reg_5386[0]_i_2\ : label is "soft_lutpair13";
  attribute SOFT_HLUTNM of \select_ln450_23_reg_5386[2]_i_2\ : label is "soft_lutpair28";
  attribute SOFT_HLUTNM of \select_ln450_26_reg_5401[0]_i_2\ : label is "soft_lutpair48";
  attribute SOFT_HLUTNM of \select_ln450_26_reg_5401[1]_i_5\ : label is "soft_lutpair53";
  attribute SOFT_HLUTNM of \select_ln450_26_reg_5401[1]_i_6\ : label is "soft_lutpair44";
  attribute SOFT_HLUTNM of \select_ln450_26_reg_5401[3]_i_1\ : label is "soft_lutpair53";
  attribute SOFT_HLUTNM of \select_ln450_29_reg_5416[1]_i_5\ : label is "soft_lutpair30";
  attribute SOFT_HLUTNM of \select_ln450_29_reg_5416[2]_i_2\ : label is "soft_lutpair31";
  attribute SOFT_HLUTNM of \select_ln450_29_reg_5416[3]_i_1\ : label is "soft_lutpair30";
  attribute SOFT_HLUTNM of \select_ln450_2_reg_5309[0]_i_2\ : label is "soft_lutpair35";
  attribute SOFT_HLUTNM of \select_ln450_2_reg_5309[0]_i_3\ : label is "soft_lutpair36";
  attribute SOFT_HLUTNM of \select_ln450_32_reg_5431[1]_i_2\ : label is "soft_lutpair50";
  attribute SOFT_HLUTNM of \select_ln450_32_reg_5431[1]_i_5\ : label is "soft_lutpair42";
  attribute SOFT_HLUTNM of \select_ln450_32_reg_5431[2]_i_2\ : label is "soft_lutpair46";
  attribute SOFT_HLUTNM of \select_ln450_32_reg_5431[3]_i_1\ : label is "soft_lutpair42";
  attribute SOFT_HLUTNM of \select_ln450_35_reg_5446[1]_i_5\ : label is "soft_lutpair25";
  attribute SOFT_HLUTNM of \select_ln450_35_reg_5446[2]_i_2\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \select_ln450_35_reg_5446[3]_i_1\ : label is "soft_lutpair25";
  attribute SOFT_HLUTNM of \select_ln450_38_reg_5461[0]_i_2\ : label is "soft_lutpair33";
  attribute SOFT_HLUTNM of \select_ln450_38_reg_5461[1]_i_5\ : label is "soft_lutpair40";
  attribute SOFT_HLUTNM of \select_ln450_38_reg_5461[3]_i_1\ : label is "soft_lutpair40";
  attribute SOFT_HLUTNM of \select_ln450_41_reg_5476[1]_i_5\ : label is "soft_lutpair20";
  attribute SOFT_HLUTNM of \select_ln450_41_reg_5476[2]_i_2\ : label is "soft_lutpair21";
  attribute SOFT_HLUTNM of \select_ln450_41_reg_5476[3]_i_1\ : label is "soft_lutpair20";
  attribute SOFT_HLUTNM of \select_ln450_44_reg_5491[1]_i_5\ : label is "soft_lutpair41";
  attribute SOFT_HLUTNM of \select_ln450_44_reg_5491[2]_i_2\ : label is "soft_lutpair43";
  attribute SOFT_HLUTNM of \select_ln450_44_reg_5491[3]_i_1\ : label is "soft_lutpair41";
  attribute SOFT_HLUTNM of \select_ln450_47_reg_5506[1]_i_3\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \select_ln450_47_reg_5506[1]_i_5\ : label is "soft_lutpair19";
  attribute SOFT_HLUTNM of \select_ln450_47_reg_5506[3]_i_1\ : label is "soft_lutpair19";
  attribute SOFT_HLUTNM of \select_ln450_5_reg_5320[2]_i_2\ : label is "soft_lutpair34";
  attribute SOFT_HLUTNM of \select_ln450_8_reg_5331[0]_i_3\ : label is "soft_lutpair54";
  attribute SOFT_HLUTNM of \select_ln450_8_reg_5331[1]_i_2\ : label is "soft_lutpair52";
  attribute SOFT_HLUTNM of \select_ln486_6_reg_5572[2]_i_1\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \select_ln486_6_reg_5572[3]_i_1\ : label is "soft_lutpair71";
  attribute SOFT_HLUTNM of \select_ln486_6_reg_5572[4]_i_2\ : label is "soft_lutpair61";
  attribute SOFT_HLUTNM of \select_ln486_6_reg_5572[5]_i_4\ : label is "soft_lutpair63";
  attribute SOFT_HLUTNM of \select_ln486_6_reg_5572[5]_i_5\ : label is "soft_lutpair65";
  attribute SOFT_HLUTNM of \select_ln486_6_reg_5572[6]_i_1\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \select_ln486_6_reg_5572[6]_i_10\ : label is "soft_lutpair15";
  attribute SOFT_HLUTNM of \select_ln486_6_reg_5572[6]_i_11\ : label is "soft_lutpair73";
  attribute SOFT_HLUTNM of \select_ln486_6_reg_5572[6]_i_12\ : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of \select_ln486_6_reg_5572[6]_i_15\ : label is "soft_lutpair17";
  attribute SOFT_HLUTNM of \select_ln486_6_reg_5572[6]_i_16\ : label is "soft_lutpair63";
  attribute SOFT_HLUTNM of \select_ln486_6_reg_5572[6]_i_7\ : label is "soft_lutpair65";
  attribute SOFT_HLUTNM of \select_ln486_6_reg_5572[6]_i_9\ : label is "soft_lutpair73";
  attribute SOFT_HLUTNM of \select_ln486_reg_5567[2]_i_1\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \select_ln486_reg_5567[3]_i_1\ : label is "soft_lutpair70";
  attribute SOFT_HLUTNM of \select_ln486_reg_5567[4]_i_2\ : label is "soft_lutpair60";
  attribute SOFT_HLUTNM of \select_ln486_reg_5567[5]_i_4\ : label is "soft_lutpair62";
  attribute SOFT_HLUTNM of \select_ln486_reg_5567[5]_i_5\ : label is "soft_lutpair64";
  attribute SOFT_HLUTNM of \select_ln486_reg_5567[6]_i_10\ : label is "soft_lutpair14";
  attribute SOFT_HLUTNM of \select_ln486_reg_5567[6]_i_11\ : label is "soft_lutpair75";
  attribute SOFT_HLUTNM of \select_ln486_reg_5567[6]_i_12\ : label is "soft_lutpair12";
  attribute SOFT_HLUTNM of \select_ln486_reg_5567[6]_i_15\ : label is "soft_lutpair27";
  attribute SOFT_HLUTNM of \select_ln486_reg_5567[6]_i_16\ : label is "soft_lutpair62";
  attribute SOFT_HLUTNM of \select_ln486_reg_5567[6]_i_7\ : label is "soft_lutpair64";
  attribute SOFT_HLUTNM of \select_ln486_reg_5567[6]_i_9\ : label is "soft_lutpair75";
begin
  \^ap_start\ <= ap_start;
  ap_done <= \^ap_done\;
  ap_ready <= \^ap_start\;
  hls_LT_r_V(21) <= \<const0>\;
  hls_LT_r_V(20) <= \<const0>\;
  hls_LT_r_V(19) <= \<const0>\;
  hls_LT_r_V(18) <= \<const0>\;
  hls_LT_r_V(17) <= \<const0>\;
  hls_LT_r_V(16) <= \<const0>\;
  hls_LT_r_V(15) <= \<const0>\;
  hls_LT_r_V(14) <= \<const0>\;
  hls_LT_r_V(13) <= \<const0>\;
  hls_LT_r_V(12) <= \<const0>\;
  hls_LT_r_V(11 downto 5) <= \^res_max_bin_r_v\(6 downto 0);
  hls_LT_r_V(4) <= \^hls_lt_r_v\(4);
  hls_LT_r_V(3) <= \<const0>\;
  hls_LT_r_V(2) <= \<const0>\;
  hls_LT_r_V(1) <= \<const0>\;
  hls_LT_r_V(0) <= \<const0>\;
  hls_LT_r_V_ap_vld <= \^hls_lt_r_global_v_ap_vld\;
  hls_LT_r_global_V_ap_vld <= \^hls_lt_r_global_v_ap_vld\;
  hls_LT_theta_V(13) <= \<const0>\;
  hls_LT_theta_V(12) <= \<const0>\;
  hls_LT_theta_V(11) <= \<const0>\;
  hls_LT_theta_V(10) <= \<const0>\;
  hls_LT_theta_V(9) <= \<const0>\;
  hls_LT_theta_V(8 downto 2) <= \^res_max_bin_theta_v\(6 downto 0);
  hls_LT_theta_V(1) <= \^hls_lt_r_v\(4);
  hls_LT_theta_V(0) <= \<const0>\;
  hls_LT_theta_V_ap_vld <= \^hls_lt_r_global_v_ap_vld\;
  hls_LT_theta_global_V_ap_vld <= \^hls_lt_r_global_v_ap_vld\;
  res_max_bin_count_V_ap_vld <= \^hls_lt_r_global_v_ap_vld\;
  res_max_bin_r_V(6 downto 0) <= \^res_max_bin_r_v\(6 downto 0);
  res_max_bin_r_V_ap_vld <= \^hls_lt_r_global_v_ap_vld\;
  res_max_bin_theta_V(6 downto 0) <= \^res_max_bin_theta_v\(6 downto 0);
  res_max_bin_theta_V_ap_vld <= \^hls_lt_r_global_v_ap_vld\;
GND: unisim.vcomponents.GND
     port map (
      G => \<const0>\
    );
ap_enable_reg_pp0_iter1_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => '1',
      D => \^ap_start\,
      Q => ap_enable_reg_pp0_iter1,
      R => ap_rst
    );
ap_enable_reg_pp0_iter2_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => '1',
      D => ap_enable_reg_pp0_iter1,
      Q => ap_enable_reg_pp0_iter2,
      R => ap_rst
    );
ap_enable_reg_pp0_iter3_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => '1',
      D => ap_enable_reg_pp0_iter2,
      Q => \^ap_done\,
      R => ap_rst
    );
ap_idle_INST_0: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0001"
    )
        port map (
      I0 => ap_enable_reg_pp0_iter2,
      I1 => \^ap_done\,
      I2 => \^ap_start\,
      I3 => ap_enable_reg_pp0_iter1,
      O => ap_idle
    );
\hls_LT_r_V_1_data_reg[10]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"775F77A0885F88A0"
    )
        port map (
      I0 => \hls_LT_r_V_1_data_reg[10]_i_2_n_0\,
      I1 => res_max_bin_r_t_V_reg_5582(4),
      I2 => res_max_bin_r_t_V_1_reg_5598(4),
      I3 => \hls_LT_theta_V_1_data_reg[8]_i_2_n_0\,
      I4 => res_max_bin_r_t_V_1_reg_5598(5),
      I5 => res_max_bin_r_t_V_reg_5582(5),
      O => tmp_V_fu_4658_p2(5)
    );
\hls_LT_r_V_1_data_reg[10]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"C000C000A0A00000"
    )
        port map (
      I0 => res_max_bin_r_t_V_1_reg_5598(3),
      I1 => res_max_bin_r_t_V_reg_5582(3),
      I2 => \hls_LT_r_V_1_data_reg[8]_i_2_n_0\,
      I3 => res_max_bin_r_t_V_reg_5582(2),
      I4 => res_max_bin_r_t_V_1_reg_5598(2),
      I5 => \hls_LT_theta_V_1_data_reg[8]_i_2_n_0\,
      O => \hls_LT_r_V_1_data_reg[10]_i_2_n_0\
    );
\hls_LT_r_V_1_data_reg[11]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"775F77A0885F88A0"
    )
        port map (
      I0 => \hls_LT_r_V_1_data_reg[11]_i_2_n_0\,
      I1 => res_max_bin_r_t_V_reg_5582(5),
      I2 => res_max_bin_r_t_V_1_reg_5598(5),
      I3 => \hls_LT_theta_V_1_data_reg[8]_i_2_n_0\,
      I4 => res_max_bin_r_t_V_1_reg_5598(6),
      I5 => res_max_bin_r_t_V_reg_5582(6),
      O => tmp_V_fu_4658_p2(6)
    );
\hls_LT_r_V_1_data_reg[11]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"C000C000A0A00000"
    )
        port map (
      I0 => res_max_bin_r_t_V_1_reg_5598(4),
      I1 => res_max_bin_r_t_V_reg_5582(4),
      I2 => \hls_LT_r_V_1_data_reg[9]_i_2_n_0\,
      I3 => res_max_bin_r_t_V_reg_5582(3),
      I4 => res_max_bin_r_t_V_1_reg_5598(3),
      I5 => \hls_LT_theta_V_1_data_reg[8]_i_2_n_0\,
      O => \hls_LT_r_V_1_data_reg[11]_i_2_n_0\
    );
\hls_LT_r_V_1_data_reg[5]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"1B"
    )
        port map (
      I0 => \hls_LT_theta_V_1_data_reg[8]_i_2_n_0\,
      I1 => res_max_bin_r_t_V_1_reg_5598(0),
      I2 => res_max_bin_r_t_V_reg_5582(0),
      O => tmp_V_fu_4658_p2(0)
    );
\hls_LT_r_V_1_data_reg[6]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"353AC5CA"
    )
        port map (
      I0 => res_max_bin_r_t_V_1_reg_5598(0),
      I1 => res_max_bin_r_t_V_reg_5582(0),
      I2 => \hls_LT_theta_V_1_data_reg[8]_i_2_n_0\,
      I3 => res_max_bin_r_t_V_1_reg_5598(1),
      I4 => res_max_bin_r_t_V_reg_5582(1),
      O => tmp_V_fu_4658_p2(1)
    );
\hls_LT_r_V_1_data_reg[7]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"775F77A0885F88A0"
    )
        port map (
      I0 => res_max_bin_r_t_V_2_fu_4652_p3(0),
      I1 => res_max_bin_r_t_V_reg_5582(1),
      I2 => res_max_bin_r_t_V_1_reg_5598(1),
      I3 => \hls_LT_theta_V_1_data_reg[8]_i_2_n_0\,
      I4 => res_max_bin_r_t_V_1_reg_5598(2),
      I5 => res_max_bin_r_t_V_reg_5582(2),
      O => tmp_V_fu_4658_p2(2)
    );
\hls_LT_r_V_1_data_reg[7]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FF4DB200"
    )
        port map (
      I0 => \hls_LT_theta_V_1_data_reg[8]_i_3_n_0\,
      I1 => res_max_bin_count_t_1_reg_5603(3),
      I2 => res_max_bin_count_t_s_reg_5587(3),
      I3 => res_max_bin_r_t_V_reg_5582(0),
      I4 => res_max_bin_r_t_V_1_reg_5598(0),
      O => res_max_bin_r_t_V_2_fu_4652_p3(0)
    );
\hls_LT_r_V_1_data_reg[8]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"775F77A0885F88A0"
    )
        port map (
      I0 => \hls_LT_r_V_1_data_reg[8]_i_2_n_0\,
      I1 => res_max_bin_r_t_V_reg_5582(2),
      I2 => res_max_bin_r_t_V_1_reg_5598(2),
      I3 => \hls_LT_theta_V_1_data_reg[8]_i_2_n_0\,
      I4 => res_max_bin_r_t_V_1_reg_5598(3),
      I5 => res_max_bin_r_t_V_reg_5582(3),
      O => tmp_V_fu_4658_p2(3)
    );
\hls_LT_r_V_1_data_reg[8]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CAC00A00"
    )
        port map (
      I0 => res_max_bin_r_t_V_1_reg_5598(1),
      I1 => res_max_bin_r_t_V_reg_5582(1),
      I2 => \hls_LT_theta_V_1_data_reg[8]_i_2_n_0\,
      I3 => res_max_bin_r_t_V_1_reg_5598(0),
      I4 => res_max_bin_r_t_V_reg_5582(0),
      O => \hls_LT_r_V_1_data_reg[8]_i_2_n_0\
    );
\hls_LT_r_V_1_data_reg[9]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"775F77A0885F88A0"
    )
        port map (
      I0 => \hls_LT_r_V_1_data_reg[9]_i_2_n_0\,
      I1 => res_max_bin_r_t_V_reg_5582(3),
      I2 => res_max_bin_r_t_V_1_reg_5598(3),
      I3 => \hls_LT_theta_V_1_data_reg[8]_i_2_n_0\,
      I4 => res_max_bin_r_t_V_1_reg_5598(4),
      I5 => res_max_bin_r_t_V_reg_5582(4),
      O => tmp_V_fu_4658_p2(4)
    );
\hls_LT_r_V_1_data_reg[9]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"C000C000A0A00000"
    )
        port map (
      I0 => res_max_bin_r_t_V_1_reg_5598(2),
      I1 => res_max_bin_r_t_V_reg_5582(2),
      I2 => res_max_bin_r_t_V_2_fu_4652_p3(0),
      I3 => res_max_bin_r_t_V_reg_5582(1),
      I4 => res_max_bin_r_t_V_1_reg_5598(1),
      I5 => \hls_LT_theta_V_1_data_reg[8]_i_2_n_0\,
      O => \hls_LT_r_V_1_data_reg[9]_i_2_n_0\
    );
\hls_LT_r_V_1_data_reg_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => ap_enable_reg_pp0_iter2,
      D => tmp_V_fu_4658_p2(5),
      Q => \^res_max_bin_r_v\(5),
      R => '0'
    );
\hls_LT_r_V_1_data_reg_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => ap_enable_reg_pp0_iter2,
      D => tmp_V_fu_4658_p2(6),
      Q => \^res_max_bin_r_v\(6),
      R => '0'
    );
\hls_LT_r_V_1_data_reg_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => ap_enable_reg_pp0_iter2,
      D => tmp_V_fu_4658_p2(0),
      Q => \^res_max_bin_r_v\(0),
      R => '0'
    );
\hls_LT_r_V_1_data_reg_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => ap_enable_reg_pp0_iter2,
      D => tmp_V_fu_4658_p2(1),
      Q => \^res_max_bin_r_v\(1),
      R => '0'
    );
\hls_LT_r_V_1_data_reg_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => ap_enable_reg_pp0_iter2,
      D => tmp_V_fu_4658_p2(2),
      Q => \^res_max_bin_r_v\(2),
      R => '0'
    );
\hls_LT_r_V_1_data_reg_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => ap_enable_reg_pp0_iter2,
      D => tmp_V_fu_4658_p2(3),
      Q => \^res_max_bin_r_v\(3),
      R => '0'
    );
\hls_LT_r_V_1_data_reg_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => ap_enable_reg_pp0_iter2,
      D => tmp_V_fu_4658_p2(4),
      Q => \^res_max_bin_r_v\(4),
      R => '0'
    );
\hls_LT_r_global_V_1_data_reg[10]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => tmp_V_fu_4658_p2(5),
      I1 => roi_seed_r_V_read_reg_4733_pp0_iter1_reg(10),
      O => \hls_LT_r_global_V_1_data_reg[10]_i_2_n_0\
    );
\hls_LT_r_global_V_1_data_reg[10]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => tmp_V_fu_4658_p2(4),
      I1 => roi_seed_r_V_read_reg_4733_pp0_iter1_reg(9),
      O => \hls_LT_r_global_V_1_data_reg[10]_i_3_n_0\
    );
\hls_LT_r_global_V_1_data_reg[10]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => tmp_V_fu_4658_p2(3),
      I1 => roi_seed_r_V_read_reg_4733_pp0_iter1_reg(8),
      O => \hls_LT_r_global_V_1_data_reg[10]_i_4_n_0\
    );
\hls_LT_r_global_V_1_data_reg[10]_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => tmp_V_fu_4658_p2(2),
      I1 => roi_seed_r_V_read_reg_4733_pp0_iter1_reg(7),
      O => \hls_LT_r_global_V_1_data_reg[10]_i_5_n_0\
    );
\hls_LT_r_global_V_1_data_reg[10]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AC5CA35353A35CAC"
    )
        port map (
      I0 => res_max_bin_r_t_V_reg_5582(1),
      I1 => res_max_bin_r_t_V_1_reg_5598(1),
      I2 => \hls_LT_theta_V_1_data_reg[8]_i_2_n_0\,
      I3 => res_max_bin_r_t_V_reg_5582(0),
      I4 => res_max_bin_r_t_V_1_reg_5598(0),
      I5 => roi_seed_r_V_read_reg_4733_pp0_iter1_reg(6),
      O => \hls_LT_r_global_V_1_data_reg[10]_i_6_n_0\
    );
\hls_LT_r_global_V_1_data_reg[10]_i_7\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"E41B"
    )
        port map (
      I0 => \hls_LT_theta_V_1_data_reg[8]_i_2_n_0\,
      I1 => res_max_bin_r_t_V_1_reg_5598(0),
      I2 => res_max_bin_r_t_V_reg_5582(0),
      I3 => roi_seed_r_V_read_reg_4733_pp0_iter1_reg(5),
      O => \hls_LT_r_global_V_1_data_reg[10]_i_7_n_0\
    );
\hls_LT_r_global_V_1_data_reg[10]_i_8\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => roi_seed_r_V_read_reg_4733_pp0_iter1_reg(4),
      O => \hls_LT_r_global_V_1_data_reg[10]_i_8_n_0\
    );
\hls_LT_r_global_V_1_data_reg[18]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AC53535353ACACAC"
    )
        port map (
      I0 => res_max_bin_r_t_V_reg_5582(6),
      I1 => res_max_bin_r_t_V_1_reg_5598(6),
      I2 => \hls_LT_theta_V_1_data_reg[8]_i_2_n_0\,
      I3 => res_max_bin_r_t_V_2_fu_4652_p3(5),
      I4 => \hls_LT_r_V_1_data_reg[11]_i_2_n_0\,
      I5 => roi_seed_r_V_read_reg_4733_pp0_iter1_reg(11),
      O => \hls_LT_r_global_V_1_data_reg[18]_i_2_n_0\
    );
\hls_LT_r_global_V_1_data_reg[18]_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => res_max_bin_r_t_V_reg_5582(5),
      I1 => res_max_bin_r_t_V_1_reg_5598(5),
      I2 => \hls_LT_theta_V_1_data_reg[8]_i_2_n_0\,
      O => res_max_bin_r_t_V_2_fu_4652_p3(5)
    );
\hls_LT_r_global_V_1_data_reg_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => ap_enable_reg_pp0_iter2,
      D => roi_seed_r_V_read_reg_4733_pp0_iter1_reg(0),
      Q => hls_LT_r_global_V(0),
      R => '0'
    );
\hls_LT_r_global_V_1_data_reg_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => ap_enable_reg_pp0_iter2,
      D => add_ln703_2_fu_4727_p2(10),
      Q => hls_LT_r_global_V(10),
      R => '0'
    );
\hls_LT_r_global_V_1_data_reg_reg[10]_i_1\: unisim.vcomponents.CARRY8
     port map (
      CI => '0',
      CI_TOP => '0',
      CO(7) => \hls_LT_r_global_V_1_data_reg_reg[10]_i_1_n_0\,
      CO(6) => \hls_LT_r_global_V_1_data_reg_reg[10]_i_1_n_1\,
      CO(5) => \hls_LT_r_global_V_1_data_reg_reg[10]_i_1_n_2\,
      CO(4) => \hls_LT_r_global_V_1_data_reg_reg[10]_i_1_n_3\,
      CO(3) => \hls_LT_r_global_V_1_data_reg_reg[10]_i_1_n_4\,
      CO(2) => \hls_LT_r_global_V_1_data_reg_reg[10]_i_1_n_5\,
      CO(1) => \hls_LT_r_global_V_1_data_reg_reg[10]_i_1_n_6\,
      CO(0) => \hls_LT_r_global_V_1_data_reg_reg[10]_i_1_n_7\,
      DI(7 downto 1) => roi_seed_r_V_read_reg_4733_pp0_iter1_reg(10 downto 4),
      DI(0) => '0',
      O(7 downto 0) => add_ln703_2_fu_4727_p2(10 downto 3),
      S(7) => \hls_LT_r_global_V_1_data_reg[10]_i_2_n_0\,
      S(6) => \hls_LT_r_global_V_1_data_reg[10]_i_3_n_0\,
      S(5) => \hls_LT_r_global_V_1_data_reg[10]_i_4_n_0\,
      S(4) => \hls_LT_r_global_V_1_data_reg[10]_i_5_n_0\,
      S(3) => \hls_LT_r_global_V_1_data_reg[10]_i_6_n_0\,
      S(2) => \hls_LT_r_global_V_1_data_reg[10]_i_7_n_0\,
      S(1) => \hls_LT_r_global_V_1_data_reg[10]_i_8_n_0\,
      S(0) => roi_seed_r_V_read_reg_4733_pp0_iter1_reg(3)
    );
\hls_LT_r_global_V_1_data_reg_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => ap_enable_reg_pp0_iter2,
      D => add_ln703_2_fu_4727_p2(11),
      Q => hls_LT_r_global_V(11),
      R => '0'
    );
\hls_LT_r_global_V_1_data_reg_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => ap_enable_reg_pp0_iter2,
      D => add_ln703_2_fu_4727_p2(12),
      Q => hls_LT_r_global_V(12),
      R => '0'
    );
\hls_LT_r_global_V_1_data_reg_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => ap_enable_reg_pp0_iter2,
      D => add_ln703_2_fu_4727_p2(13),
      Q => hls_LT_r_global_V(13),
      R => '0'
    );
\hls_LT_r_global_V_1_data_reg_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => ap_enable_reg_pp0_iter2,
      D => add_ln703_2_fu_4727_p2(14),
      Q => hls_LT_r_global_V(14),
      R => '0'
    );
\hls_LT_r_global_V_1_data_reg_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => ap_enable_reg_pp0_iter2,
      D => add_ln703_2_fu_4727_p2(15),
      Q => hls_LT_r_global_V(15),
      R => '0'
    );
\hls_LT_r_global_V_1_data_reg_reg[16]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => ap_enable_reg_pp0_iter2,
      D => add_ln703_2_fu_4727_p2(16),
      Q => hls_LT_r_global_V(16),
      R => '0'
    );
\hls_LT_r_global_V_1_data_reg_reg[17]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => ap_enable_reg_pp0_iter2,
      D => add_ln703_2_fu_4727_p2(17),
      Q => hls_LT_r_global_V(17),
      R => '0'
    );
\hls_LT_r_global_V_1_data_reg_reg[18]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => ap_enable_reg_pp0_iter2,
      D => add_ln703_2_fu_4727_p2(18),
      Q => hls_LT_r_global_V(18),
      R => '0'
    );
\hls_LT_r_global_V_1_data_reg_reg[18]_i_1\: unisim.vcomponents.CARRY8
     port map (
      CI => \hls_LT_r_global_V_1_data_reg_reg[10]_i_1_n_0\,
      CI_TOP => '0',
      CO(7) => \hls_LT_r_global_V_1_data_reg_reg[18]_i_1_n_0\,
      CO(6) => \hls_LT_r_global_V_1_data_reg_reg[18]_i_1_n_1\,
      CO(5) => \hls_LT_r_global_V_1_data_reg_reg[18]_i_1_n_2\,
      CO(4) => \hls_LT_r_global_V_1_data_reg_reg[18]_i_1_n_3\,
      CO(3) => \hls_LT_r_global_V_1_data_reg_reg[18]_i_1_n_4\,
      CO(2) => \hls_LT_r_global_V_1_data_reg_reg[18]_i_1_n_5\,
      CO(1) => \hls_LT_r_global_V_1_data_reg_reg[18]_i_1_n_6\,
      CO(0) => \hls_LT_r_global_V_1_data_reg_reg[18]_i_1_n_7\,
      DI(7 downto 1) => B"0000000",
      DI(0) => roi_seed_r_V_read_reg_4733_pp0_iter1_reg(11),
      O(7 downto 0) => add_ln703_2_fu_4727_p2(18 downto 11),
      S(7 downto 1) => roi_seed_r_V_read_reg_4733_pp0_iter1_reg(18 downto 12),
      S(0) => \hls_LT_r_global_V_1_data_reg[18]_i_2_n_0\
    );
\hls_LT_r_global_V_1_data_reg_reg[19]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => ap_enable_reg_pp0_iter2,
      D => add_ln703_2_fu_4727_p2(19),
      Q => hls_LT_r_global_V(19),
      R => '0'
    );
\hls_LT_r_global_V_1_data_reg_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => ap_enable_reg_pp0_iter2,
      D => roi_seed_r_V_read_reg_4733_pp0_iter1_reg(1),
      Q => hls_LT_r_global_V(1),
      R => '0'
    );
\hls_LT_r_global_V_1_data_reg_reg[20]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => ap_enable_reg_pp0_iter2,
      D => add_ln703_2_fu_4727_p2(20),
      Q => hls_LT_r_global_V(20),
      R => '0'
    );
\hls_LT_r_global_V_1_data_reg_reg[21]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => ap_enable_reg_pp0_iter2,
      D => add_ln703_2_fu_4727_p2(21),
      Q => hls_LT_r_global_V(21),
      R => '0'
    );
\hls_LT_r_global_V_1_data_reg_reg[21]_i_1\: unisim.vcomponents.CARRY8
     port map (
      CI => \hls_LT_r_global_V_1_data_reg_reg[18]_i_1_n_0\,
      CI_TOP => '0',
      CO(7 downto 2) => \NLW_hls_LT_r_global_V_1_data_reg_reg[21]_i_1_CO_UNCONNECTED\(7 downto 2),
      CO(1) => \hls_LT_r_global_V_1_data_reg_reg[21]_i_1_n_6\,
      CO(0) => \hls_LT_r_global_V_1_data_reg_reg[21]_i_1_n_7\,
      DI(7 downto 0) => B"00000000",
      O(7 downto 3) => \NLW_hls_LT_r_global_V_1_data_reg_reg[21]_i_1_O_UNCONNECTED\(7 downto 3),
      O(2 downto 0) => add_ln703_2_fu_4727_p2(21 downto 19),
      S(7 downto 3) => B"00000",
      S(2 downto 0) => roi_seed_r_V_read_reg_4733_pp0_iter1_reg(21 downto 19)
    );
\hls_LT_r_global_V_1_data_reg_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => ap_enable_reg_pp0_iter2,
      D => roi_seed_r_V_read_reg_4733_pp0_iter1_reg(2),
      Q => hls_LT_r_global_V(2),
      R => '0'
    );
\hls_LT_r_global_V_1_data_reg_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => ap_enable_reg_pp0_iter2,
      D => add_ln703_2_fu_4727_p2(3),
      Q => hls_LT_r_global_V(3),
      R => '0'
    );
\hls_LT_r_global_V_1_data_reg_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => ap_enable_reg_pp0_iter2,
      D => add_ln703_2_fu_4727_p2(4),
      Q => hls_LT_r_global_V(4),
      R => '0'
    );
\hls_LT_r_global_V_1_data_reg_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => ap_enable_reg_pp0_iter2,
      D => add_ln703_2_fu_4727_p2(5),
      Q => hls_LT_r_global_V(5),
      R => '0'
    );
\hls_LT_r_global_V_1_data_reg_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => ap_enable_reg_pp0_iter2,
      D => add_ln703_2_fu_4727_p2(6),
      Q => hls_LT_r_global_V(6),
      R => '0'
    );
\hls_LT_r_global_V_1_data_reg_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => ap_enable_reg_pp0_iter2,
      D => add_ln703_2_fu_4727_p2(7),
      Q => hls_LT_r_global_V(7),
      R => '0'
    );
\hls_LT_r_global_V_1_data_reg_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => ap_enable_reg_pp0_iter2,
      D => add_ln703_2_fu_4727_p2(8),
      Q => hls_LT_r_global_V(8),
      R => '0'
    );
\hls_LT_r_global_V_1_data_reg_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => ap_enable_reg_pp0_iter2,
      D => add_ln703_2_fu_4727_p2(9),
      Q => hls_LT_r_global_V(9),
      R => '0'
    );
\hls_LT_theta_V_1_data_reg[2]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \hls_LT_theta_V_1_data_reg[8]_i_2_n_0\,
      O => res_max_bin_theta_t_2_fu_4644_p3(0)
    );
\hls_LT_theta_V_1_data_reg[3]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"74"
    )
        port map (
      I0 => icmp_ln895_125_reg_5577,
      I1 => \hls_LT_theta_V_1_data_reg[8]_i_2_n_0\,
      I2 => res_max_bin_theta_t_1_reg_5593(1),
      O => res_max_bin_theta_t_2_fu_4644_p3(1)
    );
\hls_LT_theta_V_1_data_reg[4]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8FFB800"
    )
        port map (
      I0 => select_ln486_reg_5567(2),
      I1 => icmp_ln895_125_reg_5577,
      I2 => select_ln486_6_reg_5572(2),
      I3 => \hls_LT_theta_V_1_data_reg[8]_i_2_n_0\,
      I4 => res_max_bin_theta_t_1_reg_5593(2),
      O => res_max_bin_theta_t_2_fu_4644_p3(2)
    );
\hls_LT_theta_V_1_data_reg[5]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8FFB800"
    )
        port map (
      I0 => select_ln486_reg_5567(3),
      I1 => icmp_ln895_125_reg_5577,
      I2 => select_ln486_6_reg_5572(3),
      I3 => \hls_LT_theta_V_1_data_reg[8]_i_2_n_0\,
      I4 => res_max_bin_theta_t_1_reg_5593(3),
      O => res_max_bin_theta_t_2_fu_4644_p3(3)
    );
\hls_LT_theta_V_1_data_reg[6]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8FFB800"
    )
        port map (
      I0 => select_ln486_reg_5567(4),
      I1 => icmp_ln895_125_reg_5577,
      I2 => select_ln486_6_reg_5572(4),
      I3 => \hls_LT_theta_V_1_data_reg[8]_i_2_n_0\,
      I4 => res_max_bin_theta_t_1_reg_5593(4),
      O => res_max_bin_theta_t_2_fu_4644_p3(4)
    );
\hls_LT_theta_V_1_data_reg[7]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8FFB800"
    )
        port map (
      I0 => select_ln486_reg_5567(5),
      I1 => icmp_ln895_125_reg_5577,
      I2 => select_ln486_6_reg_5572(5),
      I3 => \hls_LT_theta_V_1_data_reg[8]_i_2_n_0\,
      I4 => res_max_bin_theta_t_1_reg_5593(5),
      O => res_max_bin_theta_t_2_fu_4644_p3(5)
    );
\hls_LT_theta_V_1_data_reg[8]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8FFB800"
    )
        port map (
      I0 => select_ln486_reg_5567(6),
      I1 => icmp_ln895_125_reg_5577,
      I2 => select_ln486_6_reg_5572(6),
      I3 => \hls_LT_theta_V_1_data_reg[8]_i_2_n_0\,
      I4 => res_max_bin_theta_t_1_reg_5593(6),
      O => res_max_bin_theta_t_2_fu_4644_p3(6)
    );
\hls_LT_theta_V_1_data_reg[8]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B2"
    )
        port map (
      I0 => \hls_LT_theta_V_1_data_reg[8]_i_3_n_0\,
      I1 => res_max_bin_count_t_1_reg_5603(3),
      I2 => res_max_bin_count_t_s_reg_5587(3),
      O => \hls_LT_theta_V_1_data_reg[8]_i_2_n_0\
    );
\hls_LT_theta_V_1_data_reg[8]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"2F02FFFF00002F02"
    )
        port map (
      I0 => res_max_bin_count_t_s_reg_5587(0),
      I1 => res_max_bin_count_t_1_reg_5603(0),
      I2 => res_max_bin_count_t_1_reg_5603(1),
      I3 => res_max_bin_count_t_s_reg_5587(1),
      I4 => res_max_bin_count_t_1_reg_5603(2),
      I5 => res_max_bin_count_t_s_reg_5587(2),
      O => \hls_LT_theta_V_1_data_reg[8]_i_3_n_0\
    );
\hls_LT_theta_V_1_data_reg_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => ap_enable_reg_pp0_iter2,
      D => '1',
      Q => \^hls_lt_r_v\(4),
      R => '0'
    );
\hls_LT_theta_V_1_data_reg_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => ap_enable_reg_pp0_iter2,
      D => res_max_bin_theta_t_2_fu_4644_p3(0),
      Q => \^res_max_bin_theta_v\(0),
      R => '0'
    );
\hls_LT_theta_V_1_data_reg_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => ap_enable_reg_pp0_iter2,
      D => res_max_bin_theta_t_2_fu_4644_p3(1),
      Q => \^res_max_bin_theta_v\(1),
      R => '0'
    );
\hls_LT_theta_V_1_data_reg_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => ap_enable_reg_pp0_iter2,
      D => res_max_bin_theta_t_2_fu_4644_p3(2),
      Q => \^res_max_bin_theta_v\(2),
      R => '0'
    );
\hls_LT_theta_V_1_data_reg_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => ap_enable_reg_pp0_iter2,
      D => res_max_bin_theta_t_2_fu_4644_p3(3),
      Q => \^res_max_bin_theta_v\(3),
      R => '0'
    );
\hls_LT_theta_V_1_data_reg_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => ap_enable_reg_pp0_iter2,
      D => res_max_bin_theta_t_2_fu_4644_p3(4),
      Q => \^res_max_bin_theta_v\(4),
      R => '0'
    );
\hls_LT_theta_V_1_data_reg_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => ap_enable_reg_pp0_iter2,
      D => res_max_bin_theta_t_2_fu_4644_p3(5),
      Q => \^res_max_bin_theta_v\(5),
      R => '0'
    );
\hls_LT_theta_V_1_data_reg_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => ap_enable_reg_pp0_iter2,
      D => res_max_bin_theta_t_2_fu_4644_p3(6),
      Q => \^res_max_bin_theta_v\(6),
      R => '0'
    );
\hls_LT_theta_global_V_1_data_reg[0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => slcvec_angle_polar_o_reg_4738_pp0_iter1_reg(0),
      O => add_ln703_1_fu_4702_p2(0)
    );
\hls_LT_theta_global_V_1_data_reg[13]_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => slcvec_angle_polar_o_reg_4738_pp0_iter1_reg(12),
      O => \hls_LT_theta_global_V_1_data_reg[13]_i_2_n_0\
    );
\hls_LT_theta_global_V_1_data_reg[13]_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => slcvec_angle_polar_o_reg_4738_pp0_iter1_reg(11),
      O => \hls_LT_theta_global_V_1_data_reg[13]_i_3_n_0\
    );
\hls_LT_theta_global_V_1_data_reg[13]_i_4\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"78"
    )
        port map (
      I0 => \hls_LT_theta_global_V_1_data_reg[13]_i_5_n_0\,
      I1 => res_max_bin_theta_t_2_fu_4644_p3(6),
      I2 => slcvec_angle_polar_o_reg_4738_pp0_iter1_reg(9),
      O => \hls_LT_theta_global_V_1_data_reg[13]_i_4_n_0\
    );
\hls_LT_theta_global_V_1_data_reg[13]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FEFEFEAEAEAEFEAE"
    )
        port map (
      I0 => \hls_LT_theta_global_V_1_data_reg[8]_i_10_n_0\,
      I1 => res_max_bin_theta_t_1_reg_5593(5),
      I2 => \hls_LT_theta_V_1_data_reg[8]_i_2_n_0\,
      I3 => select_ln486_6_reg_5572(5),
      I4 => icmp_ln895_125_reg_5577,
      I5 => select_ln486_reg_5567(5),
      O => \hls_LT_theta_global_V_1_data_reg[13]_i_5_n_0\
    );
\hls_LT_theta_global_V_1_data_reg[8]_i_10\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"08880000"
    )
        port map (
      I0 => res_max_bin_theta_t_2_fu_4644_p3(4),
      I1 => res_max_bin_theta_t_2_fu_4644_p3(2),
      I2 => \hls_LT_theta_V_1_data_reg[8]_i_2_n_0\,
      I3 => icmp_ln895_125_reg_5577,
      I4 => res_max_bin_theta_t_2_fu_4644_p3(3),
      O => \hls_LT_theta_global_V_1_data_reg[8]_i_10_n_0\
    );
\hls_LT_theta_global_V_1_data_reg[8]_i_11\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0ACA"
    )
        port map (
      I0 => res_max_bin_theta_t_1_reg_5593(2),
      I1 => select_ln486_6_reg_5572(2),
      I2 => \hls_LT_theta_V_1_data_reg[8]_i_2_n_0\,
      I3 => icmp_ln895_125_reg_5577,
      O => \hls_LT_theta_global_V_1_data_reg[8]_i_11_n_0\
    );
\hls_LT_theta_global_V_1_data_reg[8]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"96"
    )
        port map (
      I0 => res_max_bin_theta_t_2_fu_4644_p3(6),
      I1 => \hls_LT_theta_global_V_1_data_reg[13]_i_5_n_0\,
      I2 => slcvec_angle_polar_o_reg_4738_pp0_iter1_reg(8),
      O => \hls_LT_theta_global_V_1_data_reg[8]_i_2_n_0\
    );
\hls_LT_theta_global_V_1_data_reg[8]_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"69"
    )
        port map (
      I0 => res_max_bin_theta_t_2_fu_4644_p3(5),
      I1 => \hls_LT_theta_global_V_1_data_reg[8]_i_10_n_0\,
      I2 => slcvec_angle_polar_o_reg_4738_pp0_iter1_reg(7),
      O => \hls_LT_theta_global_V_1_data_reg[8]_i_3_n_0\
    );
\hls_LT_theta_global_V_1_data_reg[8]_i_4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"956A"
    )
        port map (
      I0 => res_max_bin_theta_t_2_fu_4644_p3(4),
      I1 => res_max_bin_theta_t_2_fu_4644_p3(3),
      I2 => \hls_LT_theta_global_V_1_data_reg[8]_i_11_n_0\,
      I3 => slcvec_angle_polar_o_reg_4738_pp0_iter1_reg(6),
      O => \hls_LT_theta_global_V_1_data_reg[8]_i_4_n_0\
    );
\hls_LT_theta_global_V_1_data_reg[8]_i_5\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"5999A666"
    )
        port map (
      I0 => res_max_bin_theta_t_2_fu_4644_p3(3),
      I1 => res_max_bin_theta_t_2_fu_4644_p3(2),
      I2 => \hls_LT_theta_V_1_data_reg[8]_i_2_n_0\,
      I3 => icmp_ln895_125_reg_5577,
      I4 => slcvec_angle_polar_o_reg_4738_pp0_iter1_reg(5),
      O => \hls_LT_theta_global_V_1_data_reg[8]_i_5_n_0\
    );
\hls_LT_theta_global_V_1_data_reg[8]_i_6\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6A95"
    )
        port map (
      I0 => res_max_bin_theta_t_2_fu_4644_p3(2),
      I1 => icmp_ln895_125_reg_5577,
      I2 => \hls_LT_theta_V_1_data_reg[8]_i_2_n_0\,
      I3 => slcvec_angle_polar_o_reg_4738_pp0_iter1_reg(4),
      O => \hls_LT_theta_global_V_1_data_reg[8]_i_6_n_0\
    );
\hls_LT_theta_global_V_1_data_reg[8]_i_7\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"47B8"
    )
        port map (
      I0 => icmp_ln895_125_reg_5577,
      I1 => \hls_LT_theta_V_1_data_reg[8]_i_2_n_0\,
      I2 => res_max_bin_theta_t_1_reg_5593(1),
      I3 => slcvec_angle_polar_o_reg_4738_pp0_iter1_reg(3),
      O => \hls_LT_theta_global_V_1_data_reg[8]_i_7_n_0\
    );
\hls_LT_theta_global_V_1_data_reg[8]_i_8\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \hls_LT_theta_V_1_data_reg[8]_i_2_n_0\,
      I1 => slcvec_angle_polar_o_reg_4738_pp0_iter1_reg(2),
      O => \hls_LT_theta_global_V_1_data_reg[8]_i_8_n_0\
    );
\hls_LT_theta_global_V_1_data_reg[8]_i_9\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => slcvec_angle_polar_o_reg_4738_pp0_iter1_reg(1),
      O => \hls_LT_theta_global_V_1_data_reg[8]_i_9_n_0\
    );
\hls_LT_theta_global_V_1_data_reg_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => ap_enable_reg_pp0_iter2,
      D => add_ln703_1_fu_4702_p2(0),
      Q => hls_LT_theta_global_V(0),
      R => '0'
    );
\hls_LT_theta_global_V_1_data_reg_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => ap_enable_reg_pp0_iter2,
      D => add_ln703_1_fu_4702_p2(10),
      Q => hls_LT_theta_global_V(10),
      R => '0'
    );
\hls_LT_theta_global_V_1_data_reg_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => ap_enable_reg_pp0_iter2,
      D => add_ln703_1_fu_4702_p2(11),
      Q => hls_LT_theta_global_V(11),
      R => '0'
    );
\hls_LT_theta_global_V_1_data_reg_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => ap_enable_reg_pp0_iter2,
      D => add_ln703_1_fu_4702_p2(12),
      Q => hls_LT_theta_global_V(12),
      R => '0'
    );
\hls_LT_theta_global_V_1_data_reg_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => ap_enable_reg_pp0_iter2,
      D => add_ln703_1_fu_4702_p2(13),
      Q => hls_LT_theta_global_V(13),
      R => '0'
    );
\hls_LT_theta_global_V_1_data_reg_reg[13]_i_1\: unisim.vcomponents.CARRY8
     port map (
      CI => \hls_LT_theta_global_V_1_data_reg_reg[8]_i_1_n_0\,
      CI_TOP => '0',
      CO(7 downto 4) => \NLW_hls_LT_theta_global_V_1_data_reg_reg[13]_i_1_CO_UNCONNECTED\(7 downto 4),
      CO(3) => \hls_LT_theta_global_V_1_data_reg_reg[13]_i_1_n_4\,
      CO(2) => \hls_LT_theta_global_V_1_data_reg_reg[13]_i_1_n_5\,
      CO(1) => \hls_LT_theta_global_V_1_data_reg_reg[13]_i_1_n_6\,
      CO(0) => \hls_LT_theta_global_V_1_data_reg_reg[13]_i_1_n_7\,
      DI(7 downto 4) => B"0000",
      DI(3 downto 2) => slcvec_angle_polar_o_reg_4738_pp0_iter1_reg(12 downto 11),
      DI(1) => '0',
      DI(0) => slcvec_angle_polar_o_reg_4738_pp0_iter1_reg(9),
      O(7 downto 5) => \NLW_hls_LT_theta_global_V_1_data_reg_reg[13]_i_1_O_UNCONNECTED\(7 downto 5),
      O(4 downto 0) => add_ln703_1_fu_4702_p2(13 downto 9),
      S(7 downto 5) => B"000",
      S(4) => slcvec_angle_polar_o_reg_4738_pp0_iter1_reg(13),
      S(3) => \hls_LT_theta_global_V_1_data_reg[13]_i_2_n_0\,
      S(2) => \hls_LT_theta_global_V_1_data_reg[13]_i_3_n_0\,
      S(1) => slcvec_angle_polar_o_reg_4738_pp0_iter1_reg(10),
      S(0) => \hls_LT_theta_global_V_1_data_reg[13]_i_4_n_0\
    );
\hls_LT_theta_global_V_1_data_reg_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => ap_enable_reg_pp0_iter2,
      D => add_ln703_1_fu_4702_p2(1),
      Q => hls_LT_theta_global_V(1),
      R => '0'
    );
\hls_LT_theta_global_V_1_data_reg_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => ap_enable_reg_pp0_iter2,
      D => add_ln703_1_fu_4702_p2(2),
      Q => hls_LT_theta_global_V(2),
      R => '0'
    );
\hls_LT_theta_global_V_1_data_reg_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => ap_enable_reg_pp0_iter2,
      D => add_ln703_1_fu_4702_p2(3),
      Q => hls_LT_theta_global_V(3),
      R => '0'
    );
\hls_LT_theta_global_V_1_data_reg_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => ap_enable_reg_pp0_iter2,
      D => add_ln703_1_fu_4702_p2(4),
      Q => hls_LT_theta_global_V(4),
      R => '0'
    );
\hls_LT_theta_global_V_1_data_reg_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => ap_enable_reg_pp0_iter2,
      D => add_ln703_1_fu_4702_p2(5),
      Q => hls_LT_theta_global_V(5),
      R => '0'
    );
\hls_LT_theta_global_V_1_data_reg_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => ap_enable_reg_pp0_iter2,
      D => add_ln703_1_fu_4702_p2(6),
      Q => hls_LT_theta_global_V(6),
      R => '0'
    );
\hls_LT_theta_global_V_1_data_reg_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => ap_enable_reg_pp0_iter2,
      D => add_ln703_1_fu_4702_p2(7),
      Q => hls_LT_theta_global_V(7),
      R => '0'
    );
\hls_LT_theta_global_V_1_data_reg_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => ap_enable_reg_pp0_iter2,
      D => add_ln703_1_fu_4702_p2(8),
      Q => hls_LT_theta_global_V(8),
      R => '0'
    );
\hls_LT_theta_global_V_1_data_reg_reg[8]_i_1\: unisim.vcomponents.CARRY8
     port map (
      CI => slcvec_angle_polar_o_reg_4738_pp0_iter1_reg(0),
      CI_TOP => '0',
      CO(7) => \hls_LT_theta_global_V_1_data_reg_reg[8]_i_1_n_0\,
      CO(6) => \hls_LT_theta_global_V_1_data_reg_reg[8]_i_1_n_1\,
      CO(5) => \hls_LT_theta_global_V_1_data_reg_reg[8]_i_1_n_2\,
      CO(4) => \hls_LT_theta_global_V_1_data_reg_reg[8]_i_1_n_3\,
      CO(3) => \hls_LT_theta_global_V_1_data_reg_reg[8]_i_1_n_4\,
      CO(2) => \hls_LT_theta_global_V_1_data_reg_reg[8]_i_1_n_5\,
      CO(1) => \hls_LT_theta_global_V_1_data_reg_reg[8]_i_1_n_6\,
      CO(0) => \hls_LT_theta_global_V_1_data_reg_reg[8]_i_1_n_7\,
      DI(7 downto 0) => slcvec_angle_polar_o_reg_4738_pp0_iter1_reg(8 downto 1),
      O(7 downto 0) => add_ln703_1_fu_4702_p2(8 downto 1),
      S(7) => \hls_LT_theta_global_V_1_data_reg[8]_i_2_n_0\,
      S(6) => \hls_LT_theta_global_V_1_data_reg[8]_i_3_n_0\,
      S(5) => \hls_LT_theta_global_V_1_data_reg[8]_i_4_n_0\,
      S(4) => \hls_LT_theta_global_V_1_data_reg[8]_i_5_n_0\,
      S(3) => \hls_LT_theta_global_V_1_data_reg[8]_i_6_n_0\,
      S(2) => \hls_LT_theta_global_V_1_data_reg[8]_i_7_n_0\,
      S(1) => \hls_LT_theta_global_V_1_data_reg[8]_i_8_n_0\,
      S(0) => \hls_LT_theta_global_V_1_data_reg[8]_i_9_n_0\
    );
\hls_LT_theta_global_V_1_data_reg_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => ap_enable_reg_pp0_iter2,
      D => add_ln703_1_fu_4702_p2(9),
      Q => hls_LT_theta_global_V(9),
      R => '0'
    );
hls_LT_theta_global_V_1_vld_reg_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => '1',
      D => ap_enable_reg_pp0_iter2,
      Q => \^hls_lt_r_global_v_ap_vld\,
      R => '0'
    );
\icmp_ln895_100_reg_5336[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F1FF11F110110010"
    )
        port map (
      I0 => max_bin_count_51_V(3),
      I1 => max_bin_count_19_V(3),
      I2 => \icmp_ln895_100_reg_5336[0]_i_2_n_0\,
      I3 => select_ln432_59_fu_3095_p3(2),
      I4 => select_ln432_11_fu_2823_p3(2),
      I5 => select_ln432_11_fu_2823_p3(3),
      O => \icmp_ln895_100_reg_5336[0]_i_1_n_0\
    );
\icmp_ln895_100_reg_5336[0]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00E4FFFF000000E4"
    )
        port map (
      I0 => \icmp_ln895_68_reg_5093[0]_i_1_n_0\,
      I1 => max_bin_count_35_V(0),
      I2 => max_bin_count_3_V(0),
      I3 => select_ln432_59_fu_3095_p3(0),
      I4 => select_ln432_59_fu_3095_p3(1),
      I5 => select_ln432_11_fu_2823_p3(1),
      O => \icmp_ln895_100_reg_5336[0]_i_2_n_0\
    );
\icmp_ln895_100_reg_5336[0]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"ACAACCAC"
    )
        port map (
      I0 => max_bin_count_3_V(2),
      I1 => max_bin_count_35_V(2),
      I2 => \icmp_ln895_68_reg_5093[0]_i_2_n_0\,
      I3 => max_bin_count_35_V(3),
      I4 => max_bin_count_3_V(3),
      O => select_ln432_11_fu_2823_p3(2)
    );
\icmp_ln895_100_reg_5336_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => \icmp_ln895_100_reg_5336[0]_i_1_n_0\,
      Q => icmp_ln895_100_reg_5336,
      R => '0'
    );
\icmp_ln895_101_reg_5347[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F1FF11F110110010"
    )
        port map (
      I0 => max_bin_count_52_V(3),
      I1 => max_bin_count_20_V(3),
      I2 => \icmp_ln895_101_reg_5347[0]_i_2_n_0\,
      I3 => select_ln432_62_fu_3112_p3(2),
      I4 => select_ln432_14_fu_2840_p3(2),
      I5 => select_ln432_14_fu_2840_p3(3),
      O => \icmp_ln895_101_reg_5347[0]_i_1_n_0\
    );
\icmp_ln895_101_reg_5347[0]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00E4FFFF000000E4"
    )
        port map (
      I0 => \icmp_ln895_69_reg_5103[0]_i_1_n_0\,
      I1 => max_bin_count_36_V(0),
      I2 => max_bin_count_4_V(0),
      I3 => select_ln432_62_fu_3112_p3(0),
      I4 => select_ln432_62_fu_3112_p3(1),
      I5 => select_ln432_14_fu_2840_p3(1),
      O => \icmp_ln895_101_reg_5347[0]_i_2_n_0\
    );
\icmp_ln895_101_reg_5347[0]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"ACAACCAC"
    )
        port map (
      I0 => max_bin_count_4_V(2),
      I1 => max_bin_count_36_V(2),
      I2 => \icmp_ln895_69_reg_5103[0]_i_2_n_0\,
      I3 => max_bin_count_36_V(3),
      I4 => max_bin_count_4_V(3),
      O => select_ln432_14_fu_2840_p3(2)
    );
\icmp_ln895_101_reg_5347_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => \icmp_ln895_101_reg_5347[0]_i_1_n_0\,
      Q => icmp_ln895_101_reg_5347,
      R => '0'
    );
\icmp_ln895_102_reg_5358[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F1FF11F110110010"
    )
        port map (
      I0 => max_bin_count_53_V(3),
      I1 => max_bin_count_21_V(3),
      I2 => \icmp_ln895_102_reg_5358[0]_i_2_n_0\,
      I3 => select_ln432_65_fu_3129_p3(2),
      I4 => select_ln432_17_fu_2857_p3(2),
      I5 => select_ln432_17_fu_2857_p3(3),
      O => \icmp_ln895_102_reg_5358[0]_i_1_n_0\
    );
\icmp_ln895_102_reg_5358[0]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00E4FFFF000000E4"
    )
        port map (
      I0 => \icmp_ln895_70_reg_5113[0]_i_1_n_0\,
      I1 => max_bin_count_37_V(0),
      I2 => max_bin_count_5_V(0),
      I3 => select_ln432_65_fu_3129_p3(0),
      I4 => select_ln432_65_fu_3129_p3(1),
      I5 => select_ln432_17_fu_2857_p3(1),
      O => \icmp_ln895_102_reg_5358[0]_i_2_n_0\
    );
\icmp_ln895_102_reg_5358[0]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"ACAACCAC"
    )
        port map (
      I0 => max_bin_count_5_V(2),
      I1 => max_bin_count_37_V(2),
      I2 => \icmp_ln895_70_reg_5113[0]_i_2_n_0\,
      I3 => max_bin_count_37_V(3),
      I4 => max_bin_count_5_V(3),
      O => select_ln432_17_fu_2857_p3(2)
    );
\icmp_ln895_102_reg_5358_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => \icmp_ln895_102_reg_5358[0]_i_1_n_0\,
      Q => icmp_ln895_102_reg_5358,
      R => '0'
    );
\icmp_ln895_103_reg_5369[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F1FF11F110110010"
    )
        port map (
      I0 => max_bin_count_54_V(3),
      I1 => max_bin_count_22_V(3),
      I2 => \icmp_ln895_103_reg_5369[0]_i_2_n_0\,
      I3 => select_ln432_68_fu_3146_p3(2),
      I4 => select_ln432_20_fu_2874_p3(2),
      I5 => select_ln432_20_fu_2874_p3(3),
      O => \icmp_ln895_103_reg_5369[0]_i_1_n_0\
    );
\icmp_ln895_103_reg_5369[0]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00E4FFFF000000E4"
    )
        port map (
      I0 => \icmp_ln895_71_reg_5123[0]_i_1_n_0\,
      I1 => max_bin_count_38_V(0),
      I2 => max_bin_count_6_V(0),
      I3 => select_ln432_68_fu_3146_p3(0),
      I4 => select_ln432_68_fu_3146_p3(1),
      I5 => select_ln432_20_fu_2874_p3(1),
      O => \icmp_ln895_103_reg_5369[0]_i_2_n_0\
    );
\icmp_ln895_103_reg_5369[0]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"ACAACCAC"
    )
        port map (
      I0 => max_bin_count_6_V(2),
      I1 => max_bin_count_38_V(2),
      I2 => \icmp_ln895_71_reg_5123[0]_i_2_n_0\,
      I3 => max_bin_count_38_V(3),
      I4 => max_bin_count_6_V(3),
      O => select_ln432_20_fu_2874_p3(2)
    );
\icmp_ln895_103_reg_5369_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => \icmp_ln895_103_reg_5369[0]_i_1_n_0\,
      Q => icmp_ln895_103_reg_5369,
      R => '0'
    );
\icmp_ln895_104_reg_5380[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F1FF11F110110010"
    )
        port map (
      I0 => max_bin_count_55_V(3),
      I1 => max_bin_count_23_V(3),
      I2 => \icmp_ln895_104_reg_5380[0]_i_2_n_0\,
      I3 => select_ln432_71_fu_3163_p3(2),
      I4 => select_ln432_23_fu_2891_p3(2),
      I5 => select_ln432_23_fu_2891_p3(3),
      O => \icmp_ln895_104_reg_5380[0]_i_1_n_0\
    );
\icmp_ln895_104_reg_5380[0]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00E4FFFF000000E4"
    )
        port map (
      I0 => \icmp_ln895_72_reg_5133[0]_i_1_n_0\,
      I1 => max_bin_count_39_V(0),
      I2 => max_bin_count_7_V(0),
      I3 => select_ln432_71_fu_3163_p3(0),
      I4 => select_ln432_71_fu_3163_p3(1),
      I5 => select_ln432_23_fu_2891_p3(1),
      O => \icmp_ln895_104_reg_5380[0]_i_2_n_0\
    );
\icmp_ln895_104_reg_5380[0]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"ACAACCAC"
    )
        port map (
      I0 => max_bin_count_7_V(2),
      I1 => max_bin_count_39_V(2),
      I2 => \icmp_ln895_72_reg_5133[0]_i_2_n_0\,
      I3 => max_bin_count_39_V(3),
      I4 => max_bin_count_7_V(3),
      O => select_ln432_23_fu_2891_p3(2)
    );
\icmp_ln895_104_reg_5380_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => \icmp_ln895_104_reg_5380[0]_i_1_n_0\,
      Q => icmp_ln895_104_reg_5380,
      R => '0'
    );
\icmp_ln895_105_reg_5391[0]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B2FF00B2"
    )
        port map (
      I0 => \icmp_ln895_105_reg_5391[0]_i_2_n_0\,
      I1 => select_ln432_74_fu_3180_p3(2),
      I2 => select_ln432_26_fu_2908_p3(2),
      I3 => select_ln432_74_fu_3180_p3(3),
      I4 => select_ln432_26_fu_2908_p3(3),
      O => \icmp_ln895_105_reg_5391[0]_i_1_n_0\
    );
\icmp_ln895_105_reg_5391[0]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00E4FFFF000000E4"
    )
        port map (
      I0 => \icmp_ln895_73_reg_5143[0]_i_1_n_0\,
      I1 => max_bin_count_40_V(0),
      I2 => max_bin_count_8_V(0),
      I3 => select_ln432_74_fu_3180_p3(0),
      I4 => select_ln432_74_fu_3180_p3(1),
      I5 => select_ln432_26_fu_2908_p3(1),
      O => \icmp_ln895_105_reg_5391[0]_i_2_n_0\
    );
\icmp_ln895_105_reg_5391[0]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"ACAACCAC"
    )
        port map (
      I0 => max_bin_count_8_V(2),
      I1 => max_bin_count_40_V(2),
      I2 => \icmp_ln895_73_reg_5143[0]_i_2_n_0\,
      I3 => max_bin_count_40_V(3),
      I4 => max_bin_count_8_V(3),
      O => select_ln432_26_fu_2908_p3(2)
    );
\icmp_ln895_105_reg_5391_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => \icmp_ln895_105_reg_5391[0]_i_1_n_0\,
      Q => icmp_ln895_105_reg_5391,
      R => '0'
    );
\icmp_ln895_106_reg_5406[0]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B2FF00B2"
    )
        port map (
      I0 => \icmp_ln895_106_reg_5406[0]_i_2_n_0\,
      I1 => select_ln432_77_fu_3197_p3(2),
      I2 => select_ln432_29_fu_2925_p3(2),
      I3 => select_ln432_77_fu_3197_p3(3),
      I4 => select_ln432_29_fu_2925_p3(3),
      O => \icmp_ln895_106_reg_5406[0]_i_1_n_0\
    );
\icmp_ln895_106_reg_5406[0]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00E4FFFF000000E4"
    )
        port map (
      I0 => \icmp_ln895_74_reg_5148[0]_i_1_n_0\,
      I1 => max_bin_count_41_V(0),
      I2 => max_bin_count_9_V(0),
      I3 => select_ln432_77_fu_3197_p3(0),
      I4 => select_ln432_77_fu_3197_p3(1),
      I5 => select_ln432_29_fu_2925_p3(1),
      O => \icmp_ln895_106_reg_5406[0]_i_2_n_0\
    );
\icmp_ln895_106_reg_5406[0]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"ACAACCAC"
    )
        port map (
      I0 => max_bin_count_9_V(2),
      I1 => max_bin_count_41_V(2),
      I2 => \icmp_ln895_74_reg_5148[0]_i_2_n_0\,
      I3 => max_bin_count_41_V(3),
      I4 => max_bin_count_9_V(3),
      O => select_ln432_29_fu_2925_p3(2)
    );
\icmp_ln895_106_reg_5406_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => \icmp_ln895_106_reg_5406[0]_i_1_n_0\,
      Q => icmp_ln895_106_reg_5406,
      R => '0'
    );
\icmp_ln895_107_reg_5421[0]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B2FF00B2"
    )
        port map (
      I0 => \icmp_ln895_107_reg_5421[0]_i_2_n_0\,
      I1 => select_ln432_80_fu_3214_p3(2),
      I2 => select_ln432_32_fu_2942_p3(2),
      I3 => select_ln432_80_fu_3214_p3(3),
      I4 => select_ln432_32_fu_2942_p3(3),
      O => \icmp_ln895_107_reg_5421[0]_i_1_n_0\
    );
\icmp_ln895_107_reg_5421[0]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00E4FFFF000000E4"
    )
        port map (
      I0 => \icmp_ln895_75_reg_5153[0]_i_1_n_0\,
      I1 => max_bin_count_42_V(0),
      I2 => max_bin_count_10_V(0),
      I3 => select_ln432_80_fu_3214_p3(0),
      I4 => select_ln432_80_fu_3214_p3(1),
      I5 => select_ln432_32_fu_2942_p3(1),
      O => \icmp_ln895_107_reg_5421[0]_i_2_n_0\
    );
\icmp_ln895_107_reg_5421[0]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"ACAACCAC"
    )
        port map (
      I0 => max_bin_count_10_V(2),
      I1 => max_bin_count_42_V(2),
      I2 => \icmp_ln895_75_reg_5153[0]_i_2_n_0\,
      I3 => max_bin_count_42_V(3),
      I4 => max_bin_count_10_V(3),
      O => select_ln432_32_fu_2942_p3(2)
    );
\icmp_ln895_107_reg_5421_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => \icmp_ln895_107_reg_5421[0]_i_1_n_0\,
      Q => icmp_ln895_107_reg_5421,
      R => '0'
    );
\icmp_ln895_108_reg_5436[0]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B2FF00B2"
    )
        port map (
      I0 => \icmp_ln895_108_reg_5436[0]_i_2_n_0\,
      I1 => select_ln432_83_fu_3231_p3(2),
      I2 => select_ln432_35_fu_2959_p3(2),
      I3 => select_ln432_83_fu_3231_p3(3),
      I4 => select_ln432_35_fu_2959_p3(3),
      O => \icmp_ln895_108_reg_5436[0]_i_1_n_0\
    );
\icmp_ln895_108_reg_5436[0]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00E4FFFF000000E4"
    )
        port map (
      I0 => \icmp_ln895_76_reg_5158[0]_i_1_n_0\,
      I1 => max_bin_count_43_V(0),
      I2 => max_bin_count_11_V(0),
      I3 => select_ln432_83_fu_3231_p3(0),
      I4 => select_ln432_83_fu_3231_p3(1),
      I5 => select_ln432_35_fu_2959_p3(1),
      O => \icmp_ln895_108_reg_5436[0]_i_2_n_0\
    );
\icmp_ln895_108_reg_5436[0]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"ACAACCAC"
    )
        port map (
      I0 => max_bin_count_11_V(2),
      I1 => max_bin_count_43_V(2),
      I2 => \icmp_ln895_76_reg_5158[0]_i_2_n_0\,
      I3 => max_bin_count_43_V(3),
      I4 => max_bin_count_11_V(3),
      O => select_ln432_35_fu_2959_p3(2)
    );
\icmp_ln895_108_reg_5436_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => \icmp_ln895_108_reg_5436[0]_i_1_n_0\,
      Q => icmp_ln895_108_reg_5436,
      R => '0'
    );
\icmp_ln895_109_reg_5451[0]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B2FF00B2"
    )
        port map (
      I0 => \icmp_ln895_109_reg_5451[0]_i_2_n_0\,
      I1 => select_ln432_86_fu_3248_p3(2),
      I2 => select_ln432_38_fu_2976_p3(2),
      I3 => select_ln432_86_fu_3248_p3(3),
      I4 => select_ln432_38_fu_2976_p3(3),
      O => \icmp_ln895_109_reg_5451[0]_i_1_n_0\
    );
\icmp_ln895_109_reg_5451[0]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00E4FFFF000000E4"
    )
        port map (
      I0 => \icmp_ln895_77_reg_5163[0]_i_1_n_0\,
      I1 => max_bin_count_44_V(0),
      I2 => max_bin_count_12_V(0),
      I3 => select_ln432_86_fu_3248_p3(0),
      I4 => select_ln432_86_fu_3248_p3(1),
      I5 => select_ln432_38_fu_2976_p3(1),
      O => \icmp_ln895_109_reg_5451[0]_i_2_n_0\
    );
\icmp_ln895_109_reg_5451[0]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"ACAACCAC"
    )
        port map (
      I0 => max_bin_count_12_V(2),
      I1 => max_bin_count_44_V(2),
      I2 => \icmp_ln895_77_reg_5163[0]_i_2_n_0\,
      I3 => max_bin_count_44_V(3),
      I4 => max_bin_count_12_V(3),
      O => select_ln432_38_fu_2976_p3(2)
    );
\icmp_ln895_109_reg_5451_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => \icmp_ln895_109_reg_5451[0]_i_1_n_0\,
      Q => icmp_ln895_109_reg_5451,
      R => '0'
    );
\icmp_ln895_10_reg_4793[0]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0001"
    )
        port map (
      I0 => max_bin_count_10_V(2),
      I1 => max_bin_count_10_V(3),
      I2 => max_bin_count_10_V(1),
      I3 => max_bin_count_10_V(0),
      O => p_1_in
    );
\icmp_ln895_10_reg_4793_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => p_1_in,
      Q => icmp_ln895_10_reg_4793,
      R => '0'
    );
\icmp_ln895_110_reg_5466[0]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B2FF00B2"
    )
        port map (
      I0 => \icmp_ln895_110_reg_5466[0]_i_2_n_0\,
      I1 => select_ln432_89_fu_3265_p3(2),
      I2 => select_ln432_41_fu_2993_p3(2),
      I3 => select_ln432_89_fu_3265_p3(3),
      I4 => select_ln432_41_fu_2993_p3(3),
      O => \icmp_ln895_110_reg_5466[0]_i_1_n_0\
    );
\icmp_ln895_110_reg_5466[0]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00E4FFFF000000E4"
    )
        port map (
      I0 => \icmp_ln895_78_reg_5168[0]_i_1_n_0\,
      I1 => max_bin_count_45_V(0),
      I2 => max_bin_count_13_V(0),
      I3 => select_ln432_89_fu_3265_p3(0),
      I4 => select_ln432_89_fu_3265_p3(1),
      I5 => select_ln432_41_fu_2993_p3(1),
      O => \icmp_ln895_110_reg_5466[0]_i_2_n_0\
    );
\icmp_ln895_110_reg_5466[0]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"ACAACCAC"
    )
        port map (
      I0 => max_bin_count_13_V(2),
      I1 => max_bin_count_45_V(2),
      I2 => \icmp_ln895_78_reg_5168[0]_i_2_n_0\,
      I3 => max_bin_count_45_V(3),
      I4 => max_bin_count_13_V(3),
      O => select_ln432_41_fu_2993_p3(2)
    );
\icmp_ln895_110_reg_5466_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => \icmp_ln895_110_reg_5466[0]_i_1_n_0\,
      Q => icmp_ln895_110_reg_5466,
      R => '0'
    );
\icmp_ln895_111_reg_5481[0]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B2FF00B2"
    )
        port map (
      I0 => \icmp_ln895_111_reg_5481[0]_i_2_n_0\,
      I1 => select_ln432_92_fu_3282_p3(2),
      I2 => select_ln432_44_fu_3010_p3(2),
      I3 => select_ln432_92_fu_3282_p3(3),
      I4 => select_ln432_44_fu_3010_p3(3),
      O => \icmp_ln895_111_reg_5481[0]_i_1_n_0\
    );
\icmp_ln895_111_reg_5481[0]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00E4FFFF000000E4"
    )
        port map (
      I0 => \icmp_ln895_79_reg_5173[0]_i_1_n_0\,
      I1 => max_bin_count_46_V(0),
      I2 => max_bin_count_14_V(0),
      I3 => select_ln432_92_fu_3282_p3(0),
      I4 => select_ln432_92_fu_3282_p3(1),
      I5 => select_ln432_44_fu_3010_p3(1),
      O => \icmp_ln895_111_reg_5481[0]_i_2_n_0\
    );
\icmp_ln895_111_reg_5481[0]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"ACAACCAC"
    )
        port map (
      I0 => max_bin_count_14_V(2),
      I1 => max_bin_count_46_V(2),
      I2 => \icmp_ln895_79_reg_5173[0]_i_2_n_0\,
      I3 => max_bin_count_46_V(3),
      I4 => max_bin_count_14_V(3),
      O => select_ln432_44_fu_3010_p3(2)
    );
\icmp_ln895_111_reg_5481_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => \icmp_ln895_111_reg_5481[0]_i_1_n_0\,
      Q => icmp_ln895_111_reg_5481,
      R => '0'
    );
\icmp_ln895_112_reg_5496[0]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B2FF00B2"
    )
        port map (
      I0 => \icmp_ln895_112_reg_5496[0]_i_2_n_0\,
      I1 => select_ln432_95_fu_3299_p3(2),
      I2 => select_ln432_47_fu_3027_p3(2),
      I3 => select_ln432_95_fu_3299_p3(3),
      I4 => select_ln432_47_fu_3027_p3(3),
      O => \icmp_ln895_112_reg_5496[0]_i_1_n_0\
    );
\icmp_ln895_112_reg_5496[0]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00E4FFFF000000E4"
    )
        port map (
      I0 => \icmp_ln895_80_reg_5178[0]_i_1_n_0\,
      I1 => max_bin_count_47_V(0),
      I2 => max_bin_count_15_V(0),
      I3 => select_ln432_95_fu_3299_p3(0),
      I4 => select_ln432_95_fu_3299_p3(1),
      I5 => select_ln432_47_fu_3027_p3(1),
      O => \icmp_ln895_112_reg_5496[0]_i_2_n_0\
    );
\icmp_ln895_112_reg_5496[0]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"ACAACCAC"
    )
        port map (
      I0 => max_bin_count_15_V(2),
      I1 => max_bin_count_47_V(2),
      I2 => \icmp_ln895_80_reg_5178[0]_i_2_n_0\,
      I3 => max_bin_count_47_V(3),
      I4 => max_bin_count_15_V(3),
      O => select_ln432_47_fu_3027_p3(2)
    );
\icmp_ln895_112_reg_5496_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => \icmp_ln895_112_reg_5496[0]_i_1_n_0\,
      Q => icmp_ln895_112_reg_5496,
      R => '0'
    );
\icmp_ln895_113_reg_5511[0]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B2FF00B2"
    )
        port map (
      I0 => \icmp_ln895_113_reg_5511[0]_i_2_n_0\,
      I1 => select_ln450_26_fu_3388_p3(2),
      I2 => select_ln450_2_fu_3308_p3(2),
      I3 => select_ln450_26_fu_3388_p3(3),
      I4 => select_ln450_2_fu_3308_p3(3),
      O => icmp_ln895_113_fu_2192_p2
    );
\icmp_ln895_113_reg_5511[0]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"028AFFFF0000028A"
    )
        port map (
      I0 => select_ln450_2_fu_3308_p3(0),
      I1 => \icmp_ln895_105_reg_5391[0]_i_1_n_0\,
      I2 => select_ln432_74_fu_3180_p3(0),
      I3 => select_ln432_26_fu_2908_p3(0),
      I4 => select_ln450_26_fu_3388_p3(1),
      I5 => select_ln450_2_fu_3308_p3(1),
      O => \icmp_ln895_113_reg_5511[0]_i_2_n_0\
    );
\icmp_ln895_113_reg_5511_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => icmp_ln895_113_fu_2192_p2,
      Q => icmp_ln895_113_reg_5511,
      R => '0'
    );
\icmp_ln895_114_reg_5518[0]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B2FF00B2"
    )
        port map (
      I0 => \icmp_ln895_114_reg_5518[0]_i_2_n_0\,
      I1 => select_ln450_29_fu_3405_p3(2),
      I2 => select_ln450_5_fu_3317_p3(2),
      I3 => select_ln450_29_fu_3405_p3(3),
      I4 => select_ln450_5_fu_3317_p3(3),
      O => icmp_ln895_114_fu_2196_p2
    );
\icmp_ln895_114_reg_5518[0]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"028AFFFF0000028A"
    )
        port map (
      I0 => select_ln450_5_fu_3317_p3(0),
      I1 => \icmp_ln895_106_reg_5406[0]_i_1_n_0\,
      I2 => select_ln432_77_fu_3197_p3(0),
      I3 => select_ln432_29_fu_2925_p3(0),
      I4 => select_ln450_29_fu_3405_p3(1),
      I5 => select_ln450_5_fu_3317_p3(1),
      O => \icmp_ln895_114_reg_5518[0]_i_2_n_0\
    );
\icmp_ln895_114_reg_5518_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => icmp_ln895_114_fu_2196_p2,
      Q => icmp_ln895_114_reg_5518,
      R => '0'
    );
\icmp_ln895_115_reg_5525[0]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B2FF00B2"
    )
        port map (
      I0 => \icmp_ln895_115_reg_5525[0]_i_2_n_0\,
      I1 => select_ln450_32_fu_3422_p3(2),
      I2 => select_ln450_8_fu_3326_p3(2),
      I3 => select_ln450_32_fu_3422_p3(3),
      I4 => select_ln450_8_fu_3326_p3(3),
      O => icmp_ln895_115_fu_2200_p2
    );
\icmp_ln895_115_reg_5525[0]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"028AFFFF0000028A"
    )
        port map (
      I0 => select_ln450_8_fu_3326_p3(0),
      I1 => \icmp_ln895_107_reg_5421[0]_i_1_n_0\,
      I2 => select_ln432_80_fu_3214_p3(0),
      I3 => select_ln432_32_fu_2942_p3(0),
      I4 => select_ln450_32_fu_3422_p3(1),
      I5 => select_ln450_8_fu_3326_p3(1),
      O => \icmp_ln895_115_reg_5525[0]_i_2_n_0\
    );
\icmp_ln895_115_reg_5525_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => icmp_ln895_115_fu_2200_p2,
      Q => icmp_ln895_115_reg_5525,
      R => '0'
    );
\icmp_ln895_116_reg_5532[0]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B2FF00B2"
    )
        port map (
      I0 => \icmp_ln895_116_reg_5532[0]_i_2_n_0\,
      I1 => select_ln450_35_fu_3439_p3(2),
      I2 => select_ln450_11_fu_3335_p3(2),
      I3 => select_ln450_35_fu_3439_p3(3),
      I4 => select_ln450_11_fu_3335_p3(3),
      O => icmp_ln895_116_fu_2204_p2
    );
\icmp_ln895_116_reg_5532[0]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"028AFFFF0000028A"
    )
        port map (
      I0 => select_ln450_11_fu_3335_p3(0),
      I1 => \icmp_ln895_108_reg_5436[0]_i_1_n_0\,
      I2 => select_ln432_83_fu_3231_p3(0),
      I3 => select_ln432_35_fu_2959_p3(0),
      I4 => select_ln450_35_fu_3439_p3(1),
      I5 => select_ln450_11_fu_3335_p3(1),
      O => \icmp_ln895_116_reg_5532[0]_i_2_n_0\
    );
\icmp_ln895_116_reg_5532_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => icmp_ln895_116_fu_2204_p2,
      Q => icmp_ln895_116_reg_5532,
      R => '0'
    );
\icmp_ln895_117_reg_5539[0]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B2FF00B2"
    )
        port map (
      I0 => \icmp_ln895_117_reg_5539[0]_i_2_n_0\,
      I1 => select_ln450_38_fu_3456_p3(2),
      I2 => select_ln450_14_fu_3344_p3(2),
      I3 => select_ln450_38_fu_3456_p3(3),
      I4 => select_ln450_14_fu_3344_p3(3),
      O => icmp_ln895_117_fu_2208_p2
    );
\icmp_ln895_117_reg_5539[0]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"028AFFFF0000028A"
    )
        port map (
      I0 => select_ln450_14_fu_3344_p3(0),
      I1 => \icmp_ln895_109_reg_5451[0]_i_1_n_0\,
      I2 => select_ln432_86_fu_3248_p3(0),
      I3 => select_ln432_38_fu_2976_p3(0),
      I4 => select_ln450_38_fu_3456_p3(1),
      I5 => select_ln450_14_fu_3344_p3(1),
      O => \icmp_ln895_117_reg_5539[0]_i_2_n_0\
    );
\icmp_ln895_117_reg_5539_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => icmp_ln895_117_fu_2208_p2,
      Q => icmp_ln895_117_reg_5539,
      R => '0'
    );
\icmp_ln895_118_reg_5546[0]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B2FF00B2"
    )
        port map (
      I0 => \icmp_ln895_118_reg_5546[0]_i_2_n_0\,
      I1 => select_ln450_41_fu_3473_p3(2),
      I2 => select_ln450_17_fu_3353_p3(2),
      I3 => select_ln450_41_fu_3473_p3(3),
      I4 => select_ln450_17_fu_3353_p3(3),
      O => icmp_ln895_118_fu_2212_p2
    );
\icmp_ln895_118_reg_5546[0]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"028AFFFF0000028A"
    )
        port map (
      I0 => select_ln450_17_fu_3353_p3(0),
      I1 => \icmp_ln895_110_reg_5466[0]_i_1_n_0\,
      I2 => select_ln432_89_fu_3265_p3(0),
      I3 => select_ln432_41_fu_2993_p3(0),
      I4 => select_ln450_41_fu_3473_p3(1),
      I5 => select_ln450_17_fu_3353_p3(1),
      O => \icmp_ln895_118_reg_5546[0]_i_2_n_0\
    );
\icmp_ln895_118_reg_5546_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => icmp_ln895_118_fu_2212_p2,
      Q => icmp_ln895_118_reg_5546,
      R => '0'
    );
\icmp_ln895_119_reg_5553[0]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B2FF00B2"
    )
        port map (
      I0 => \icmp_ln895_119_reg_5553[0]_i_2_n_0\,
      I1 => select_ln450_44_fu_3490_p3(2),
      I2 => select_ln450_20_fu_3362_p3(2),
      I3 => select_ln450_44_fu_3490_p3(3),
      I4 => select_ln450_20_fu_3362_p3(3),
      O => icmp_ln895_119_fu_2216_p2
    );
\icmp_ln895_119_reg_5553[0]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"028AFFFF0000028A"
    )
        port map (
      I0 => select_ln450_20_fu_3362_p3(0),
      I1 => \icmp_ln895_111_reg_5481[0]_i_1_n_0\,
      I2 => select_ln432_92_fu_3282_p3(0),
      I3 => select_ln432_44_fu_3010_p3(0),
      I4 => select_ln450_44_fu_3490_p3(1),
      I5 => select_ln450_20_fu_3362_p3(1),
      O => \icmp_ln895_119_reg_5553[0]_i_2_n_0\
    );
\icmp_ln895_119_reg_5553_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => icmp_ln895_119_fu_2216_p2,
      Q => icmp_ln895_119_reg_5553,
      R => '0'
    );
\icmp_ln895_11_reg_4798[0]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0001"
    )
        port map (
      I0 => max_bin_count_11_V(2),
      I1 => max_bin_count_11_V(3),
      I2 => max_bin_count_11_V(1),
      I3 => max_bin_count_11_V(0),
      O => \icmp_ln895_11_reg_4798[0]_i_1_n_0\
    );
\icmp_ln895_11_reg_4798_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => \icmp_ln895_11_reg_4798[0]_i_1_n_0\,
      Q => icmp_ln895_11_reg_4798,
      R => '0'
    );
\icmp_ln895_120_reg_5560[0]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B2FF00B2"
    )
        port map (
      I0 => \icmp_ln895_120_reg_5560[0]_i_2_n_0\,
      I1 => select_ln450_47_fu_3507_p3(2),
      I2 => select_ln450_23_fu_3371_p3(2),
      I3 => select_ln450_47_fu_3507_p3(3),
      I4 => select_ln450_23_fu_3371_p3(3),
      O => icmp_ln895_120_fu_2220_p2
    );
\icmp_ln895_120_reg_5560[0]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"028AFFFF0000028A"
    )
        port map (
      I0 => select_ln450_23_fu_3371_p3(0),
      I1 => \icmp_ln895_112_reg_5496[0]_i_1_n_0\,
      I2 => select_ln432_95_fu_3299_p3(0),
      I3 => select_ln432_47_fu_3027_p3(0),
      I4 => select_ln450_47_fu_3507_p3(1),
      I5 => select_ln450_23_fu_3371_p3(1),
      O => \icmp_ln895_120_reg_5560[0]_i_2_n_0\
    );
\icmp_ln895_120_reg_5560_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => icmp_ln895_120_fu_2220_p2,
      Q => icmp_ln895_120_reg_5560,
      R => '0'
    );
\icmp_ln895_125_reg_5577[0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B2"
    )
        port map (
      I0 => \res_max_bin_count_t_s_reg_5587[1]_i_4_n_0\,
      I1 => select_ln486_8_fu_4558_p3(3),
      I2 => select_ln486_2_fu_4508_p3(3),
      O => \icmp_ln895_125_reg_5577[0]_i_1_n_0\
    );
\icmp_ln895_125_reg_5577_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => \icmp_ln895_125_reg_5577[0]_i_1_n_0\,
      Q => icmp_ln895_125_reg_5577,
      R => '0'
    );
\icmp_ln895_12_reg_4803[0]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0001"
    )
        port map (
      I0 => max_bin_count_12_V(2),
      I1 => max_bin_count_12_V(3),
      I2 => max_bin_count_12_V(1),
      I3 => max_bin_count_12_V(0),
      O => \icmp_ln895_12_reg_4803[0]_i_1_n_0\
    );
\icmp_ln895_12_reg_4803_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => \icmp_ln895_12_reg_4803[0]_i_1_n_0\,
      Q => icmp_ln895_12_reg_4803,
      R => '0'
    );
\icmp_ln895_13_reg_4808[0]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0001"
    )
        port map (
      I0 => max_bin_count_13_V(2),
      I1 => max_bin_count_13_V(3),
      I2 => max_bin_count_13_V(1),
      I3 => max_bin_count_13_V(0),
      O => \icmp_ln895_13_reg_4808[0]_i_1_n_0\
    );
\icmp_ln895_13_reg_4808_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => \icmp_ln895_13_reg_4808[0]_i_1_n_0\,
      Q => icmp_ln895_13_reg_4808,
      R => '0'
    );
\icmp_ln895_14_reg_4813[0]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0001"
    )
        port map (
      I0 => max_bin_count_14_V(2),
      I1 => max_bin_count_14_V(3),
      I2 => max_bin_count_14_V(1),
      I3 => max_bin_count_14_V(0),
      O => \icmp_ln895_14_reg_4813[0]_i_1_n_0\
    );
\icmp_ln895_14_reg_4813_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => \icmp_ln895_14_reg_4813[0]_i_1_n_0\,
      Q => icmp_ln895_14_reg_4813,
      R => '0'
    );
\icmp_ln895_15_reg_4818[0]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0001"
    )
        port map (
      I0 => max_bin_count_15_V(2),
      I1 => max_bin_count_15_V(3),
      I2 => max_bin_count_15_V(1),
      I3 => max_bin_count_15_V(0),
      O => \icmp_ln895_15_reg_4818[0]_i_1_n_0\
    );
\icmp_ln895_15_reg_4818_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => \icmp_ln895_15_reg_4818[0]_i_1_n_0\,
      Q => icmp_ln895_15_reg_4818,
      R => '0'
    );
\icmp_ln895_16_reg_4823[0]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0001"
    )
        port map (
      I0 => max_bin_count_16_V(2),
      I1 => max_bin_count_16_V(3),
      I2 => max_bin_count_16_V(1),
      I3 => max_bin_count_16_V(0),
      O => \icmp_ln895_16_reg_4823[0]_i_1_n_0\
    );
\icmp_ln895_16_reg_4823_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => \icmp_ln895_16_reg_4823[0]_i_1_n_0\,
      Q => icmp_ln895_16_reg_4823,
      R => '0'
    );
\icmp_ln895_17_reg_4828[0]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0001"
    )
        port map (
      I0 => max_bin_count_17_V(2),
      I1 => max_bin_count_17_V(3),
      I2 => max_bin_count_17_V(1),
      I3 => max_bin_count_17_V(0),
      O => \icmp_ln895_17_reg_4828[0]_i_1_n_0\
    );
\icmp_ln895_17_reg_4828_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => \icmp_ln895_17_reg_4828[0]_i_1_n_0\,
      Q => icmp_ln895_17_reg_4828,
      R => '0'
    );
\icmp_ln895_18_reg_4833[0]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0001"
    )
        port map (
      I0 => max_bin_count_18_V(2),
      I1 => max_bin_count_18_V(3),
      I2 => max_bin_count_18_V(1),
      I3 => max_bin_count_18_V(0),
      O => \icmp_ln895_18_reg_4833[0]_i_1_n_0\
    );
\icmp_ln895_18_reg_4833_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => \icmp_ln895_18_reg_4833[0]_i_1_n_0\,
      Q => icmp_ln895_18_reg_4833,
      R => '0'
    );
\icmp_ln895_19_reg_4838[0]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0001"
    )
        port map (
      I0 => max_bin_count_19_V(2),
      I1 => max_bin_count_19_V(3),
      I2 => max_bin_count_19_V(1),
      I3 => max_bin_count_19_V(0),
      O => \icmp_ln895_19_reg_4838[0]_i_1_n_0\
    );
\icmp_ln895_19_reg_4838_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => \icmp_ln895_19_reg_4838[0]_i_1_n_0\,
      Q => icmp_ln895_19_reg_4838,
      R => '0'
    );
\icmp_ln895_1_reg_4748[0]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0001"
    )
        port map (
      I0 => max_bin_count_1_V(2),
      I1 => max_bin_count_1_V(3),
      I2 => max_bin_count_1_V(1),
      I3 => max_bin_count_1_V(0),
      O => \icmp_ln895_1_reg_4748[0]_i_1_n_0\
    );
\icmp_ln895_1_reg_4748_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => \icmp_ln895_1_reg_4748[0]_i_1_n_0\,
      Q => icmp_ln895_1_reg_4748,
      R => '0'
    );
\icmp_ln895_20_reg_4843[0]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0001"
    )
        port map (
      I0 => max_bin_count_20_V(2),
      I1 => max_bin_count_20_V(3),
      I2 => max_bin_count_20_V(1),
      I3 => max_bin_count_20_V(0),
      O => \icmp_ln895_20_reg_4843[0]_i_1_n_0\
    );
\icmp_ln895_20_reg_4843_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => \icmp_ln895_20_reg_4843[0]_i_1_n_0\,
      Q => icmp_ln895_20_reg_4843,
      R => '0'
    );
\icmp_ln895_21_reg_4848[0]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0001"
    )
        port map (
      I0 => max_bin_count_21_V(2),
      I1 => max_bin_count_21_V(3),
      I2 => max_bin_count_21_V(1),
      I3 => max_bin_count_21_V(0),
      O => \icmp_ln895_21_reg_4848[0]_i_1_n_0\
    );
\icmp_ln895_21_reg_4848_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => \icmp_ln895_21_reg_4848[0]_i_1_n_0\,
      Q => icmp_ln895_21_reg_4848,
      R => '0'
    );
\icmp_ln895_22_reg_4853[0]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0001"
    )
        port map (
      I0 => max_bin_count_22_V(2),
      I1 => max_bin_count_22_V(3),
      I2 => max_bin_count_22_V(1),
      I3 => max_bin_count_22_V(0),
      O => \icmp_ln895_22_reg_4853[0]_i_1_n_0\
    );
\icmp_ln895_22_reg_4853_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => \icmp_ln895_22_reg_4853[0]_i_1_n_0\,
      Q => icmp_ln895_22_reg_4853,
      R => '0'
    );
\icmp_ln895_23_reg_4858[0]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0001"
    )
        port map (
      I0 => max_bin_count_23_V(2),
      I1 => max_bin_count_23_V(3),
      I2 => max_bin_count_23_V(1),
      I3 => max_bin_count_23_V(0),
      O => \icmp_ln895_23_reg_4858[0]_i_1_n_0\
    );
\icmp_ln895_23_reg_4858_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => \icmp_ln895_23_reg_4858[0]_i_1_n_0\,
      Q => icmp_ln895_23_reg_4858,
      R => '0'
    );
\icmp_ln895_24_reg_4863[0]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0001"
    )
        port map (
      I0 => max_bin_count_24_V(2),
      I1 => max_bin_count_24_V(3),
      I2 => max_bin_count_24_V(1),
      I3 => max_bin_count_24_V(0),
      O => \icmp_ln895_24_reg_4863[0]_i_1_n_0\
    );
\icmp_ln895_24_reg_4863_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => \icmp_ln895_24_reg_4863[0]_i_1_n_0\,
      Q => icmp_ln895_24_reg_4863,
      R => '0'
    );
\icmp_ln895_25_reg_4868[0]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0001"
    )
        port map (
      I0 => max_bin_count_25_V(2),
      I1 => max_bin_count_25_V(3),
      I2 => max_bin_count_25_V(1),
      I3 => max_bin_count_25_V(0),
      O => \icmp_ln895_25_reg_4868[0]_i_1_n_0\
    );
\icmp_ln895_25_reg_4868_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => \icmp_ln895_25_reg_4868[0]_i_1_n_0\,
      Q => icmp_ln895_25_reg_4868,
      R => '0'
    );
\icmp_ln895_26_reg_4873[0]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0001"
    )
        port map (
      I0 => max_bin_count_26_V(2),
      I1 => max_bin_count_26_V(3),
      I2 => max_bin_count_26_V(1),
      I3 => max_bin_count_26_V(0),
      O => \icmp_ln895_26_reg_4873[0]_i_1_n_0\
    );
\icmp_ln895_26_reg_4873_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => \icmp_ln895_26_reg_4873[0]_i_1_n_0\,
      Q => icmp_ln895_26_reg_4873,
      R => '0'
    );
\icmp_ln895_27_reg_4878[0]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0001"
    )
        port map (
      I0 => max_bin_count_27_V(2),
      I1 => max_bin_count_27_V(3),
      I2 => max_bin_count_27_V(1),
      I3 => max_bin_count_27_V(0),
      O => \icmp_ln895_27_reg_4878[0]_i_1_n_0\
    );
\icmp_ln895_27_reg_4878_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => \icmp_ln895_27_reg_4878[0]_i_1_n_0\,
      Q => icmp_ln895_27_reg_4878,
      R => '0'
    );
\icmp_ln895_28_reg_4883[0]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0001"
    )
        port map (
      I0 => max_bin_count_28_V(2),
      I1 => max_bin_count_28_V(3),
      I2 => max_bin_count_28_V(1),
      I3 => max_bin_count_28_V(0),
      O => \icmp_ln895_28_reg_4883[0]_i_1_n_0\
    );
\icmp_ln895_28_reg_4883_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => \icmp_ln895_28_reg_4883[0]_i_1_n_0\,
      Q => icmp_ln895_28_reg_4883,
      R => '0'
    );
\icmp_ln895_29_reg_4888[0]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0001"
    )
        port map (
      I0 => max_bin_count_29_V(2),
      I1 => max_bin_count_29_V(3),
      I2 => max_bin_count_29_V(1),
      I3 => max_bin_count_29_V(0),
      O => \icmp_ln895_29_reg_4888[0]_i_1_n_0\
    );
\icmp_ln895_29_reg_4888_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => \icmp_ln895_29_reg_4888[0]_i_1_n_0\,
      Q => icmp_ln895_29_reg_4888,
      R => '0'
    );
\icmp_ln895_2_reg_4753[0]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0001"
    )
        port map (
      I0 => max_bin_count_2_V(2),
      I1 => max_bin_count_2_V(3),
      I2 => max_bin_count_2_V(1),
      I3 => max_bin_count_2_V(0),
      O => \icmp_ln895_2_reg_4753[0]_i_1_n_0\
    );
\icmp_ln895_2_reg_4753_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => \icmp_ln895_2_reg_4753[0]_i_1_n_0\,
      Q => icmp_ln895_2_reg_4753,
      R => '0'
    );
\icmp_ln895_30_reg_4893[0]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0001"
    )
        port map (
      I0 => max_bin_count_30_V(2),
      I1 => max_bin_count_30_V(3),
      I2 => max_bin_count_30_V(1),
      I3 => max_bin_count_30_V(0),
      O => \icmp_ln895_30_reg_4893[0]_i_1_n_0\
    );
\icmp_ln895_30_reg_4893_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => \icmp_ln895_30_reg_4893[0]_i_1_n_0\,
      Q => icmp_ln895_30_reg_4893,
      R => '0'
    );
\icmp_ln895_31_reg_4898[0]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0001"
    )
        port map (
      I0 => max_bin_count_31_V(2),
      I1 => max_bin_count_31_V(3),
      I2 => max_bin_count_31_V(1),
      I3 => max_bin_count_31_V(0),
      O => \icmp_ln895_31_reg_4898[0]_i_1_n_0\
    );
\icmp_ln895_31_reg_4898_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => \icmp_ln895_31_reg_4898[0]_i_1_n_0\,
      Q => icmp_ln895_31_reg_4898,
      R => '0'
    );
\icmp_ln895_32_reg_4903[0]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0001"
    )
        port map (
      I0 => max_bin_count_32_V(2),
      I1 => max_bin_count_32_V(3),
      I2 => max_bin_count_32_V(1),
      I3 => max_bin_count_32_V(0),
      O => \icmp_ln895_32_reg_4903[0]_i_1_n_0\
    );
\icmp_ln895_32_reg_4903_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => \icmp_ln895_32_reg_4903[0]_i_1_n_0\,
      Q => icmp_ln895_32_reg_4903,
      R => '0'
    );
\icmp_ln895_33_reg_4908[0]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0001"
    )
        port map (
      I0 => max_bin_count_33_V(2),
      I1 => max_bin_count_33_V(3),
      I2 => max_bin_count_33_V(1),
      I3 => max_bin_count_33_V(0),
      O => \icmp_ln895_33_reg_4908[0]_i_1_n_0\
    );
\icmp_ln895_33_reg_4908_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => \icmp_ln895_33_reg_4908[0]_i_1_n_0\,
      Q => icmp_ln895_33_reg_4908,
      R => '0'
    );
\icmp_ln895_34_reg_4913[0]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0001"
    )
        port map (
      I0 => max_bin_count_34_V(2),
      I1 => max_bin_count_34_V(3),
      I2 => max_bin_count_34_V(1),
      I3 => max_bin_count_34_V(0),
      O => \icmp_ln895_34_reg_4913[0]_i_1_n_0\
    );
\icmp_ln895_34_reg_4913_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => \icmp_ln895_34_reg_4913[0]_i_1_n_0\,
      Q => icmp_ln895_34_reg_4913,
      R => '0'
    );
\icmp_ln895_35_reg_4918[0]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0001"
    )
        port map (
      I0 => max_bin_count_35_V(2),
      I1 => max_bin_count_35_V(3),
      I2 => max_bin_count_35_V(1),
      I3 => max_bin_count_35_V(0),
      O => \icmp_ln895_35_reg_4918[0]_i_1_n_0\
    );
\icmp_ln895_35_reg_4918_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => \icmp_ln895_35_reg_4918[0]_i_1_n_0\,
      Q => icmp_ln895_35_reg_4918,
      R => '0'
    );
\icmp_ln895_36_reg_4923[0]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0001"
    )
        port map (
      I0 => max_bin_count_36_V(2),
      I1 => max_bin_count_36_V(3),
      I2 => max_bin_count_36_V(1),
      I3 => max_bin_count_36_V(0),
      O => \icmp_ln895_36_reg_4923[0]_i_1_n_0\
    );
\icmp_ln895_36_reg_4923_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => \icmp_ln895_36_reg_4923[0]_i_1_n_0\,
      Q => icmp_ln895_36_reg_4923,
      R => '0'
    );
\icmp_ln895_37_reg_4928[0]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0001"
    )
        port map (
      I0 => max_bin_count_37_V(2),
      I1 => max_bin_count_37_V(3),
      I2 => max_bin_count_37_V(1),
      I3 => max_bin_count_37_V(0),
      O => \icmp_ln895_37_reg_4928[0]_i_1_n_0\
    );
\icmp_ln895_37_reg_4928_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => \icmp_ln895_37_reg_4928[0]_i_1_n_0\,
      Q => icmp_ln895_37_reg_4928,
      R => '0'
    );
\icmp_ln895_38_reg_4933[0]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0001"
    )
        port map (
      I0 => max_bin_count_38_V(2),
      I1 => max_bin_count_38_V(3),
      I2 => max_bin_count_38_V(1),
      I3 => max_bin_count_38_V(0),
      O => \icmp_ln895_38_reg_4933[0]_i_1_n_0\
    );
\icmp_ln895_38_reg_4933_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => \icmp_ln895_38_reg_4933[0]_i_1_n_0\,
      Q => icmp_ln895_38_reg_4933,
      R => '0'
    );
\icmp_ln895_39_reg_4938[0]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0001"
    )
        port map (
      I0 => max_bin_count_39_V(2),
      I1 => max_bin_count_39_V(3),
      I2 => max_bin_count_39_V(1),
      I3 => max_bin_count_39_V(0),
      O => \icmp_ln895_39_reg_4938[0]_i_1_n_0\
    );
\icmp_ln895_39_reg_4938_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => \icmp_ln895_39_reg_4938[0]_i_1_n_0\,
      Q => icmp_ln895_39_reg_4938,
      R => '0'
    );
\icmp_ln895_3_reg_4758[0]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0001"
    )
        port map (
      I0 => max_bin_count_3_V(2),
      I1 => max_bin_count_3_V(3),
      I2 => max_bin_count_3_V(1),
      I3 => max_bin_count_3_V(0),
      O => \icmp_ln895_3_reg_4758[0]_i_1_n_0\
    );
\icmp_ln895_3_reg_4758_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => \icmp_ln895_3_reg_4758[0]_i_1_n_0\,
      Q => icmp_ln895_3_reg_4758,
      R => '0'
    );
\icmp_ln895_40_reg_4943[0]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0001"
    )
        port map (
      I0 => max_bin_count_40_V(2),
      I1 => max_bin_count_40_V(3),
      I2 => max_bin_count_40_V(1),
      I3 => max_bin_count_40_V(0),
      O => p_3_in
    );
\icmp_ln895_40_reg_4943_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => p_3_in,
      Q => icmp_ln895_40_reg_4943,
      R => '0'
    );
\icmp_ln895_41_reg_4948[0]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0001"
    )
        port map (
      I0 => max_bin_count_41_V(2),
      I1 => max_bin_count_41_V(3),
      I2 => max_bin_count_41_V(1),
      I3 => max_bin_count_41_V(0),
      O => \icmp_ln895_41_reg_4948[0]_i_1_n_0\
    );
\icmp_ln895_41_reg_4948_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => \icmp_ln895_41_reg_4948[0]_i_1_n_0\,
      Q => icmp_ln895_41_reg_4948,
      R => '0'
    );
\icmp_ln895_42_reg_4953[0]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0001"
    )
        port map (
      I0 => max_bin_count_42_V(2),
      I1 => max_bin_count_42_V(3),
      I2 => max_bin_count_42_V(1),
      I3 => max_bin_count_42_V(0),
      O => \icmp_ln895_42_reg_4953[0]_i_1_n_0\
    );
\icmp_ln895_42_reg_4953_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => \icmp_ln895_42_reg_4953[0]_i_1_n_0\,
      Q => icmp_ln895_42_reg_4953,
      R => '0'
    );
\icmp_ln895_43_reg_4958[0]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0001"
    )
        port map (
      I0 => max_bin_count_43_V(2),
      I1 => max_bin_count_43_V(3),
      I2 => max_bin_count_43_V(1),
      I3 => max_bin_count_43_V(0),
      O => \icmp_ln895_43_reg_4958[0]_i_1_n_0\
    );
\icmp_ln895_43_reg_4958_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => \icmp_ln895_43_reg_4958[0]_i_1_n_0\,
      Q => icmp_ln895_43_reg_4958,
      R => '0'
    );
\icmp_ln895_44_reg_4963[0]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0001"
    )
        port map (
      I0 => max_bin_count_44_V(2),
      I1 => max_bin_count_44_V(3),
      I2 => max_bin_count_44_V(1),
      I3 => max_bin_count_44_V(0),
      O => \icmp_ln895_44_reg_4963[0]_i_1_n_0\
    );
\icmp_ln895_44_reg_4963_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => \icmp_ln895_44_reg_4963[0]_i_1_n_0\,
      Q => icmp_ln895_44_reg_4963,
      R => '0'
    );
\icmp_ln895_45_reg_4968[0]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0001"
    )
        port map (
      I0 => max_bin_count_45_V(2),
      I1 => max_bin_count_45_V(3),
      I2 => max_bin_count_45_V(1),
      I3 => max_bin_count_45_V(0),
      O => \icmp_ln895_45_reg_4968[0]_i_1_n_0\
    );
\icmp_ln895_45_reg_4968_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => \icmp_ln895_45_reg_4968[0]_i_1_n_0\,
      Q => icmp_ln895_45_reg_4968,
      R => '0'
    );
\icmp_ln895_46_reg_4973[0]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0001"
    )
        port map (
      I0 => max_bin_count_46_V(2),
      I1 => max_bin_count_46_V(3),
      I2 => max_bin_count_46_V(1),
      I3 => max_bin_count_46_V(0),
      O => \icmp_ln895_46_reg_4973[0]_i_1_n_0\
    );
\icmp_ln895_46_reg_4973_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => \icmp_ln895_46_reg_4973[0]_i_1_n_0\,
      Q => icmp_ln895_46_reg_4973,
      R => '0'
    );
\icmp_ln895_47_reg_4978[0]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0001"
    )
        port map (
      I0 => max_bin_count_47_V(2),
      I1 => max_bin_count_47_V(3),
      I2 => max_bin_count_47_V(1),
      I3 => max_bin_count_47_V(0),
      O => \icmp_ln895_47_reg_4978[0]_i_1_n_0\
    );
\icmp_ln895_47_reg_4978_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => \icmp_ln895_47_reg_4978[0]_i_1_n_0\,
      Q => icmp_ln895_47_reg_4978,
      R => '0'
    );
\icmp_ln895_48_reg_4983[0]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0001"
    )
        port map (
      I0 => max_bin_count_48_V(2),
      I1 => max_bin_count_48_V(3),
      I2 => max_bin_count_48_V(1),
      I3 => max_bin_count_48_V(0),
      O => \icmp_ln895_48_reg_4983[0]_i_1_n_0\
    );
\icmp_ln895_48_reg_4983_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => \icmp_ln895_48_reg_4983[0]_i_1_n_0\,
      Q => icmp_ln895_48_reg_4983,
      R => '0'
    );
\icmp_ln895_49_reg_4988[0]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0001"
    )
        port map (
      I0 => max_bin_count_49_V(2),
      I1 => max_bin_count_49_V(3),
      I2 => max_bin_count_49_V(1),
      I3 => max_bin_count_49_V(0),
      O => \icmp_ln895_49_reg_4988[0]_i_1_n_0\
    );
\icmp_ln895_49_reg_4988_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => \icmp_ln895_49_reg_4988[0]_i_1_n_0\,
      Q => icmp_ln895_49_reg_4988,
      R => '0'
    );
\icmp_ln895_4_reg_4763[0]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0001"
    )
        port map (
      I0 => max_bin_count_4_V(2),
      I1 => max_bin_count_4_V(3),
      I2 => max_bin_count_4_V(1),
      I3 => max_bin_count_4_V(0),
      O => \icmp_ln895_4_reg_4763[0]_i_1_n_0\
    );
\icmp_ln895_4_reg_4763_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => \icmp_ln895_4_reg_4763[0]_i_1_n_0\,
      Q => icmp_ln895_4_reg_4763,
      R => '0'
    );
\icmp_ln895_50_reg_4993[0]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0001"
    )
        port map (
      I0 => max_bin_count_50_V(2),
      I1 => max_bin_count_50_V(3),
      I2 => max_bin_count_50_V(1),
      I3 => max_bin_count_50_V(0),
      O => \icmp_ln895_50_reg_4993[0]_i_1_n_0\
    );
\icmp_ln895_50_reg_4993_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => \icmp_ln895_50_reg_4993[0]_i_1_n_0\,
      Q => icmp_ln895_50_reg_4993,
      R => '0'
    );
\icmp_ln895_51_reg_4998[0]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0001"
    )
        port map (
      I0 => max_bin_count_51_V(2),
      I1 => max_bin_count_51_V(3),
      I2 => max_bin_count_51_V(1),
      I3 => max_bin_count_51_V(0),
      O => \icmp_ln895_51_reg_4998[0]_i_1_n_0\
    );
\icmp_ln895_51_reg_4998_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => \icmp_ln895_51_reg_4998[0]_i_1_n_0\,
      Q => icmp_ln895_51_reg_4998,
      R => '0'
    );
\icmp_ln895_52_reg_5003[0]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0001"
    )
        port map (
      I0 => max_bin_count_52_V(2),
      I1 => max_bin_count_52_V(3),
      I2 => max_bin_count_52_V(1),
      I3 => max_bin_count_52_V(0),
      O => \icmp_ln895_52_reg_5003[0]_i_1_n_0\
    );
\icmp_ln895_52_reg_5003_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => \icmp_ln895_52_reg_5003[0]_i_1_n_0\,
      Q => icmp_ln895_52_reg_5003,
      R => '0'
    );
\icmp_ln895_53_reg_5008[0]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0001"
    )
        port map (
      I0 => max_bin_count_53_V(2),
      I1 => max_bin_count_53_V(3),
      I2 => max_bin_count_53_V(1),
      I3 => max_bin_count_53_V(0),
      O => \icmp_ln895_53_reg_5008[0]_i_1_n_0\
    );
\icmp_ln895_53_reg_5008_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => \icmp_ln895_53_reg_5008[0]_i_1_n_0\,
      Q => icmp_ln895_53_reg_5008,
      R => '0'
    );
\icmp_ln895_54_reg_5013[0]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0001"
    )
        port map (
      I0 => max_bin_count_54_V(2),
      I1 => max_bin_count_54_V(3),
      I2 => max_bin_count_54_V(1),
      I3 => max_bin_count_54_V(0),
      O => \icmp_ln895_54_reg_5013[0]_i_1_n_0\
    );
\icmp_ln895_54_reg_5013_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => \icmp_ln895_54_reg_5013[0]_i_1_n_0\,
      Q => icmp_ln895_54_reg_5013,
      R => '0'
    );
\icmp_ln895_55_reg_5018[0]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0001"
    )
        port map (
      I0 => max_bin_count_55_V(2),
      I1 => max_bin_count_55_V(3),
      I2 => max_bin_count_55_V(1),
      I3 => max_bin_count_55_V(0),
      O => \icmp_ln895_55_reg_5018[0]_i_1_n_0\
    );
\icmp_ln895_55_reg_5018_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => \icmp_ln895_55_reg_5018[0]_i_1_n_0\,
      Q => icmp_ln895_55_reg_5018,
      R => '0'
    );
\icmp_ln895_56_reg_5023[0]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0001"
    )
        port map (
      I0 => max_bin_count_56_V(2),
      I1 => max_bin_count_56_V(3),
      I2 => max_bin_count_56_V(1),
      I3 => max_bin_count_56_V(0),
      O => \icmp_ln895_56_reg_5023[0]_i_1_n_0\
    );
\icmp_ln895_56_reg_5023_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => \icmp_ln895_56_reg_5023[0]_i_1_n_0\,
      Q => icmp_ln895_56_reg_5023,
      R => '0'
    );
\icmp_ln895_57_reg_5028[0]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0001"
    )
        port map (
      I0 => max_bin_count_57_V(2),
      I1 => max_bin_count_57_V(3),
      I2 => max_bin_count_57_V(1),
      I3 => max_bin_count_57_V(0),
      O => \icmp_ln895_57_reg_5028[0]_i_1_n_0\
    );
\icmp_ln895_57_reg_5028_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => \icmp_ln895_57_reg_5028[0]_i_1_n_0\,
      Q => icmp_ln895_57_reg_5028,
      R => '0'
    );
\icmp_ln895_58_reg_5033[0]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0001"
    )
        port map (
      I0 => max_bin_count_58_V(2),
      I1 => max_bin_count_58_V(3),
      I2 => max_bin_count_58_V(1),
      I3 => max_bin_count_58_V(0),
      O => \icmp_ln895_58_reg_5033[0]_i_1_n_0\
    );
\icmp_ln895_58_reg_5033_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => \icmp_ln895_58_reg_5033[0]_i_1_n_0\,
      Q => icmp_ln895_58_reg_5033,
      R => '0'
    );
\icmp_ln895_59_reg_5038[0]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0001"
    )
        port map (
      I0 => max_bin_count_59_V(2),
      I1 => max_bin_count_59_V(3),
      I2 => max_bin_count_59_V(1),
      I3 => max_bin_count_59_V(0),
      O => \icmp_ln895_59_reg_5038[0]_i_1_n_0\
    );
\icmp_ln895_59_reg_5038_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => \icmp_ln895_59_reg_5038[0]_i_1_n_0\,
      Q => icmp_ln895_59_reg_5038,
      R => '0'
    );
\icmp_ln895_60_reg_5043[0]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0001"
    )
        port map (
      I0 => max_bin_count_60_V(2),
      I1 => max_bin_count_60_V(3),
      I2 => max_bin_count_60_V(1),
      I3 => max_bin_count_60_V(0),
      O => \icmp_ln895_60_reg_5043[0]_i_1_n_0\
    );
\icmp_ln895_60_reg_5043_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => \icmp_ln895_60_reg_5043[0]_i_1_n_0\,
      Q => icmp_ln895_60_reg_5043,
      R => '0'
    );
\icmp_ln895_61_reg_5048[0]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0001"
    )
        port map (
      I0 => max_bin_count_61_V(2),
      I1 => max_bin_count_61_V(3),
      I2 => max_bin_count_61_V(1),
      I3 => max_bin_count_61_V(0),
      O => \icmp_ln895_61_reg_5048[0]_i_1_n_0\
    );
\icmp_ln895_61_reg_5048_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => \icmp_ln895_61_reg_5048[0]_i_1_n_0\,
      Q => icmp_ln895_61_reg_5048,
      R => '0'
    );
\icmp_ln895_62_reg_5053[0]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0001"
    )
        port map (
      I0 => max_bin_count_62_V(2),
      I1 => max_bin_count_62_V(3),
      I2 => max_bin_count_62_V(1),
      I3 => max_bin_count_62_V(0),
      O => \icmp_ln895_62_reg_5053[0]_i_1_n_0\
    );
\icmp_ln895_62_reg_5053_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => \icmp_ln895_62_reg_5053[0]_i_1_n_0\,
      Q => icmp_ln895_62_reg_5053,
      R => '0'
    );
\icmp_ln895_63_reg_5058[0]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0001"
    )
        port map (
      I0 => max_bin_count_63_V(2),
      I1 => max_bin_count_63_V(3),
      I2 => max_bin_count_63_V(1),
      I3 => max_bin_count_63_V(0),
      O => \icmp_ln895_63_reg_5058[0]_i_1_n_0\
    );
\icmp_ln895_63_reg_5058_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => \icmp_ln895_63_reg_5058[0]_i_1_n_0\,
      Q => icmp_ln895_63_reg_5058,
      R => '0'
    );
\icmp_ln895_64_reg_4773[0]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0001"
    )
        port map (
      I0 => max_bin_count_6_V(2),
      I1 => max_bin_count_6_V(3),
      I2 => max_bin_count_6_V(1),
      I3 => max_bin_count_6_V(0),
      O => \icmp_ln895_64_reg_4773[0]_i_1_n_0\
    );
\icmp_ln895_64_reg_4773_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => \icmp_ln895_64_reg_4773[0]_i_1_n_0\,
      Q => icmp_ln895_64_reg_4773,
      R => '0'
    );
\icmp_ln895_65_reg_5063[0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B2"
    )
        port map (
      I0 => \icmp_ln895_65_reg_5063[0]_i_2_n_0\,
      I1 => max_bin_count_32_V(3),
      I2 => max_bin_count_0_V(3),
      O => \icmp_ln895_65_reg_5063[0]_i_1_n_0\
    );
\icmp_ln895_65_reg_5063[0]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"2F02FFFF00002F02"
    )
        port map (
      I0 => max_bin_count_0_V(0),
      I1 => max_bin_count_32_V(0),
      I2 => max_bin_count_32_V(1),
      I3 => max_bin_count_0_V(1),
      I4 => max_bin_count_32_V(2),
      I5 => max_bin_count_0_V(2),
      O => \icmp_ln895_65_reg_5063[0]_i_2_n_0\
    );
\icmp_ln895_65_reg_5063_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => \icmp_ln895_65_reg_5063[0]_i_1_n_0\,
      Q => icmp_ln895_65_reg_5063,
      R => '0'
    );
\icmp_ln895_66_reg_5073[0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B2"
    )
        port map (
      I0 => \icmp_ln895_66_reg_5073[0]_i_2_n_0\,
      I1 => max_bin_count_33_V(3),
      I2 => max_bin_count_1_V(3),
      O => \icmp_ln895_66_reg_5073[0]_i_1_n_0\
    );
\icmp_ln895_66_reg_5073[0]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"2F02FFFF00002F02"
    )
        port map (
      I0 => max_bin_count_1_V(0),
      I1 => max_bin_count_33_V(0),
      I2 => max_bin_count_33_V(1),
      I3 => max_bin_count_1_V(1),
      I4 => max_bin_count_33_V(2),
      I5 => max_bin_count_1_V(2),
      O => \icmp_ln895_66_reg_5073[0]_i_2_n_0\
    );
\icmp_ln895_66_reg_5073_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => \icmp_ln895_66_reg_5073[0]_i_1_n_0\,
      Q => icmp_ln895_66_reg_5073,
      R => '0'
    );
\icmp_ln895_67_reg_5083[0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B2"
    )
        port map (
      I0 => \icmp_ln895_67_reg_5083[0]_i_2_n_0\,
      I1 => max_bin_count_34_V(3),
      I2 => max_bin_count_2_V(3),
      O => \icmp_ln895_67_reg_5083[0]_i_1_n_0\
    );
\icmp_ln895_67_reg_5083[0]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"2F02FFFF00002F02"
    )
        port map (
      I0 => max_bin_count_2_V(0),
      I1 => max_bin_count_34_V(0),
      I2 => max_bin_count_34_V(1),
      I3 => max_bin_count_2_V(1),
      I4 => max_bin_count_34_V(2),
      I5 => max_bin_count_2_V(2),
      O => \icmp_ln895_67_reg_5083[0]_i_2_n_0\
    );
\icmp_ln895_67_reg_5083_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => \icmp_ln895_67_reg_5083[0]_i_1_n_0\,
      Q => icmp_ln895_67_reg_5083,
      R => '0'
    );
\icmp_ln895_68_reg_5093[0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B2"
    )
        port map (
      I0 => \icmp_ln895_68_reg_5093[0]_i_2_n_0\,
      I1 => max_bin_count_35_V(3),
      I2 => max_bin_count_3_V(3),
      O => \icmp_ln895_68_reg_5093[0]_i_1_n_0\
    );
\icmp_ln895_68_reg_5093[0]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"2F02FFFF00002F02"
    )
        port map (
      I0 => max_bin_count_3_V(0),
      I1 => max_bin_count_35_V(0),
      I2 => max_bin_count_35_V(1),
      I3 => max_bin_count_3_V(1),
      I4 => max_bin_count_35_V(2),
      I5 => max_bin_count_3_V(2),
      O => \icmp_ln895_68_reg_5093[0]_i_2_n_0\
    );
\icmp_ln895_68_reg_5093_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => \icmp_ln895_68_reg_5093[0]_i_1_n_0\,
      Q => icmp_ln895_68_reg_5093,
      R => '0'
    );
\icmp_ln895_69_reg_5103[0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B2"
    )
        port map (
      I0 => \icmp_ln895_69_reg_5103[0]_i_2_n_0\,
      I1 => max_bin_count_36_V(3),
      I2 => max_bin_count_4_V(3),
      O => \icmp_ln895_69_reg_5103[0]_i_1_n_0\
    );
\icmp_ln895_69_reg_5103[0]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"2F02FFFF00002F02"
    )
        port map (
      I0 => max_bin_count_4_V(0),
      I1 => max_bin_count_36_V(0),
      I2 => max_bin_count_36_V(1),
      I3 => max_bin_count_4_V(1),
      I4 => max_bin_count_36_V(2),
      I5 => max_bin_count_4_V(2),
      O => \icmp_ln895_69_reg_5103[0]_i_2_n_0\
    );
\icmp_ln895_69_reg_5103_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => \icmp_ln895_69_reg_5103[0]_i_1_n_0\,
      Q => icmp_ln895_69_reg_5103,
      R => '0'
    );
\icmp_ln895_6_reg_4768[0]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0001"
    )
        port map (
      I0 => max_bin_count_5_V(2),
      I1 => max_bin_count_5_V(3),
      I2 => max_bin_count_5_V(1),
      I3 => max_bin_count_5_V(0),
      O => \icmp_ln895_6_reg_4768[0]_i_1_n_0\
    );
\icmp_ln895_6_reg_4768_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => \icmp_ln895_6_reg_4768[0]_i_1_n_0\,
      Q => icmp_ln895_6_reg_4768,
      R => '0'
    );
\icmp_ln895_70_reg_5113[0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B2"
    )
        port map (
      I0 => \icmp_ln895_70_reg_5113[0]_i_2_n_0\,
      I1 => max_bin_count_37_V(3),
      I2 => max_bin_count_5_V(3),
      O => \icmp_ln895_70_reg_5113[0]_i_1_n_0\
    );
\icmp_ln895_70_reg_5113[0]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"2F02FFFF00002F02"
    )
        port map (
      I0 => max_bin_count_5_V(0),
      I1 => max_bin_count_37_V(0),
      I2 => max_bin_count_37_V(1),
      I3 => max_bin_count_5_V(1),
      I4 => max_bin_count_37_V(2),
      I5 => max_bin_count_5_V(2),
      O => \icmp_ln895_70_reg_5113[0]_i_2_n_0\
    );
\icmp_ln895_70_reg_5113_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => \icmp_ln895_70_reg_5113[0]_i_1_n_0\,
      Q => icmp_ln895_70_reg_5113,
      R => '0'
    );
\icmp_ln895_71_reg_5123[0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B2"
    )
        port map (
      I0 => \icmp_ln895_71_reg_5123[0]_i_2_n_0\,
      I1 => max_bin_count_38_V(3),
      I2 => max_bin_count_6_V(3),
      O => \icmp_ln895_71_reg_5123[0]_i_1_n_0\
    );
\icmp_ln895_71_reg_5123[0]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"2F02FFFF00002F02"
    )
        port map (
      I0 => max_bin_count_6_V(0),
      I1 => max_bin_count_38_V(0),
      I2 => max_bin_count_38_V(1),
      I3 => max_bin_count_6_V(1),
      I4 => max_bin_count_38_V(2),
      I5 => max_bin_count_6_V(2),
      O => \icmp_ln895_71_reg_5123[0]_i_2_n_0\
    );
\icmp_ln895_71_reg_5123_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => \icmp_ln895_71_reg_5123[0]_i_1_n_0\,
      Q => icmp_ln895_71_reg_5123,
      R => '0'
    );
\icmp_ln895_72_reg_5133[0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B2"
    )
        port map (
      I0 => \icmp_ln895_72_reg_5133[0]_i_2_n_0\,
      I1 => max_bin_count_39_V(3),
      I2 => max_bin_count_7_V(3),
      O => \icmp_ln895_72_reg_5133[0]_i_1_n_0\
    );
\icmp_ln895_72_reg_5133[0]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"2F02FFFF00002F02"
    )
        port map (
      I0 => max_bin_count_7_V(0),
      I1 => max_bin_count_39_V(0),
      I2 => max_bin_count_39_V(1),
      I3 => max_bin_count_7_V(1),
      I4 => max_bin_count_39_V(2),
      I5 => max_bin_count_7_V(2),
      O => \icmp_ln895_72_reg_5133[0]_i_2_n_0\
    );
\icmp_ln895_72_reg_5133_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => \icmp_ln895_72_reg_5133[0]_i_1_n_0\,
      Q => icmp_ln895_72_reg_5133,
      R => '0'
    );
\icmp_ln895_73_reg_5143[0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B2"
    )
        port map (
      I0 => \icmp_ln895_73_reg_5143[0]_i_2_n_0\,
      I1 => max_bin_count_40_V(3),
      I2 => max_bin_count_8_V(3),
      O => \icmp_ln895_73_reg_5143[0]_i_1_n_0\
    );
\icmp_ln895_73_reg_5143[0]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"2F02FFFF00002F02"
    )
        port map (
      I0 => max_bin_count_8_V(0),
      I1 => max_bin_count_40_V(0),
      I2 => max_bin_count_40_V(1),
      I3 => max_bin_count_8_V(1),
      I4 => max_bin_count_40_V(2),
      I5 => max_bin_count_8_V(2),
      O => \icmp_ln895_73_reg_5143[0]_i_2_n_0\
    );
\icmp_ln895_73_reg_5143_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => \icmp_ln895_73_reg_5143[0]_i_1_n_0\,
      Q => icmp_ln895_73_reg_5143,
      R => '0'
    );
\icmp_ln895_74_reg_5148[0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B2"
    )
        port map (
      I0 => \icmp_ln895_74_reg_5148[0]_i_2_n_0\,
      I1 => max_bin_count_41_V(3),
      I2 => max_bin_count_9_V(3),
      O => \icmp_ln895_74_reg_5148[0]_i_1_n_0\
    );
\icmp_ln895_74_reg_5148[0]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"2F02FFFF00002F02"
    )
        port map (
      I0 => max_bin_count_9_V(0),
      I1 => max_bin_count_41_V(0),
      I2 => max_bin_count_41_V(1),
      I3 => max_bin_count_9_V(1),
      I4 => max_bin_count_41_V(2),
      I5 => max_bin_count_9_V(2),
      O => \icmp_ln895_74_reg_5148[0]_i_2_n_0\
    );
\icmp_ln895_74_reg_5148_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => \icmp_ln895_74_reg_5148[0]_i_1_n_0\,
      Q => icmp_ln895_74_reg_5148,
      R => '0'
    );
\icmp_ln895_75_reg_5153[0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B2"
    )
        port map (
      I0 => \icmp_ln895_75_reg_5153[0]_i_2_n_0\,
      I1 => max_bin_count_42_V(3),
      I2 => max_bin_count_10_V(3),
      O => \icmp_ln895_75_reg_5153[0]_i_1_n_0\
    );
\icmp_ln895_75_reg_5153[0]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"2F02FFFF00002F02"
    )
        port map (
      I0 => max_bin_count_10_V(0),
      I1 => max_bin_count_42_V(0),
      I2 => max_bin_count_42_V(1),
      I3 => max_bin_count_10_V(1),
      I4 => max_bin_count_42_V(2),
      I5 => max_bin_count_10_V(2),
      O => \icmp_ln895_75_reg_5153[0]_i_2_n_0\
    );
\icmp_ln895_75_reg_5153_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => \icmp_ln895_75_reg_5153[0]_i_1_n_0\,
      Q => icmp_ln895_75_reg_5153,
      R => '0'
    );
\icmp_ln895_76_reg_5158[0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B2"
    )
        port map (
      I0 => \icmp_ln895_76_reg_5158[0]_i_2_n_0\,
      I1 => max_bin_count_43_V(3),
      I2 => max_bin_count_11_V(3),
      O => \icmp_ln895_76_reg_5158[0]_i_1_n_0\
    );
\icmp_ln895_76_reg_5158[0]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"2F02FFFF00002F02"
    )
        port map (
      I0 => max_bin_count_11_V(0),
      I1 => max_bin_count_43_V(0),
      I2 => max_bin_count_43_V(1),
      I3 => max_bin_count_11_V(1),
      I4 => max_bin_count_43_V(2),
      I5 => max_bin_count_11_V(2),
      O => \icmp_ln895_76_reg_5158[0]_i_2_n_0\
    );
\icmp_ln895_76_reg_5158_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => \icmp_ln895_76_reg_5158[0]_i_1_n_0\,
      Q => icmp_ln895_76_reg_5158,
      R => '0'
    );
\icmp_ln895_77_reg_5163[0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B2"
    )
        port map (
      I0 => \icmp_ln895_77_reg_5163[0]_i_2_n_0\,
      I1 => max_bin_count_44_V(3),
      I2 => max_bin_count_12_V(3),
      O => \icmp_ln895_77_reg_5163[0]_i_1_n_0\
    );
\icmp_ln895_77_reg_5163[0]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"2F02FFFF00002F02"
    )
        port map (
      I0 => max_bin_count_12_V(0),
      I1 => max_bin_count_44_V(0),
      I2 => max_bin_count_44_V(1),
      I3 => max_bin_count_12_V(1),
      I4 => max_bin_count_44_V(2),
      I5 => max_bin_count_12_V(2),
      O => \icmp_ln895_77_reg_5163[0]_i_2_n_0\
    );
\icmp_ln895_77_reg_5163_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => \icmp_ln895_77_reg_5163[0]_i_1_n_0\,
      Q => icmp_ln895_77_reg_5163,
      R => '0'
    );
\icmp_ln895_78_reg_5168[0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B2"
    )
        port map (
      I0 => \icmp_ln895_78_reg_5168[0]_i_2_n_0\,
      I1 => max_bin_count_45_V(3),
      I2 => max_bin_count_13_V(3),
      O => \icmp_ln895_78_reg_5168[0]_i_1_n_0\
    );
\icmp_ln895_78_reg_5168[0]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"2F02FFFF00002F02"
    )
        port map (
      I0 => max_bin_count_13_V(0),
      I1 => max_bin_count_45_V(0),
      I2 => max_bin_count_45_V(1),
      I3 => max_bin_count_13_V(1),
      I4 => max_bin_count_45_V(2),
      I5 => max_bin_count_13_V(2),
      O => \icmp_ln895_78_reg_5168[0]_i_2_n_0\
    );
\icmp_ln895_78_reg_5168_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => \icmp_ln895_78_reg_5168[0]_i_1_n_0\,
      Q => icmp_ln895_78_reg_5168,
      R => '0'
    );
\icmp_ln895_79_reg_5173[0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B2"
    )
        port map (
      I0 => \icmp_ln895_79_reg_5173[0]_i_2_n_0\,
      I1 => max_bin_count_46_V(3),
      I2 => max_bin_count_14_V(3),
      O => \icmp_ln895_79_reg_5173[0]_i_1_n_0\
    );
\icmp_ln895_79_reg_5173[0]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"2F02FFFF00002F02"
    )
        port map (
      I0 => max_bin_count_14_V(0),
      I1 => max_bin_count_46_V(0),
      I2 => max_bin_count_46_V(1),
      I3 => max_bin_count_14_V(1),
      I4 => max_bin_count_46_V(2),
      I5 => max_bin_count_14_V(2),
      O => \icmp_ln895_79_reg_5173[0]_i_2_n_0\
    );
\icmp_ln895_79_reg_5173_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => \icmp_ln895_79_reg_5173[0]_i_1_n_0\,
      Q => icmp_ln895_79_reg_5173,
      R => '0'
    );
\icmp_ln895_7_reg_4778[0]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0001"
    )
        port map (
      I0 => max_bin_count_7_V(2),
      I1 => max_bin_count_7_V(3),
      I2 => max_bin_count_7_V(1),
      I3 => max_bin_count_7_V(0),
      O => \icmp_ln895_7_reg_4778[0]_i_1_n_0\
    );
\icmp_ln895_7_reg_4778_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => \icmp_ln895_7_reg_4778[0]_i_1_n_0\,
      Q => icmp_ln895_7_reg_4778,
      R => '0'
    );
\icmp_ln895_80_reg_5178[0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B2"
    )
        port map (
      I0 => \icmp_ln895_80_reg_5178[0]_i_2_n_0\,
      I1 => max_bin_count_47_V(3),
      I2 => max_bin_count_15_V(3),
      O => \icmp_ln895_80_reg_5178[0]_i_1_n_0\
    );
\icmp_ln895_80_reg_5178[0]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"2F02FFFF00002F02"
    )
        port map (
      I0 => max_bin_count_15_V(0),
      I1 => max_bin_count_47_V(0),
      I2 => max_bin_count_47_V(1),
      I3 => max_bin_count_15_V(1),
      I4 => max_bin_count_47_V(2),
      I5 => max_bin_count_15_V(2),
      O => \icmp_ln895_80_reg_5178[0]_i_2_n_0\
    );
\icmp_ln895_80_reg_5178_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => \icmp_ln895_80_reg_5178[0]_i_1_n_0\,
      Q => icmp_ln895_80_reg_5178,
      R => '0'
    );
\icmp_ln895_81_reg_5183[0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B2"
    )
        port map (
      I0 => \select_ln432_49_reg_5188[6]_i_3_n_0\,
      I1 => max_bin_count_48_V(3),
      I2 => max_bin_count_16_V(3),
      O => \icmp_ln895_81_reg_5183[0]_i_1_n_0\
    );
\icmp_ln895_81_reg_5183_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => \icmp_ln895_81_reg_5183[0]_i_1_n_0\,
      Q => icmp_ln895_81_reg_5183,
      R => '0'
    );
\icmp_ln895_82_reg_5193[0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B2"
    )
        port map (
      I0 => \select_ln432_52_reg_5198[6]_i_3_n_0\,
      I1 => max_bin_count_49_V(3),
      I2 => max_bin_count_17_V(3),
      O => \icmp_ln895_82_reg_5193[0]_i_1_n_0\
    );
\icmp_ln895_82_reg_5193_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => \icmp_ln895_82_reg_5193[0]_i_1_n_0\,
      Q => icmp_ln895_82_reg_5193,
      R => '0'
    );
\icmp_ln895_83_reg_5203[0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B2"
    )
        port map (
      I0 => \select_ln432_55_reg_5208[6]_i_3_n_0\,
      I1 => max_bin_count_50_V(3),
      I2 => max_bin_count_18_V(3),
      O => \icmp_ln895_83_reg_5203[0]_i_1_n_0\
    );
\icmp_ln895_83_reg_5203_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => \icmp_ln895_83_reg_5203[0]_i_1_n_0\,
      Q => icmp_ln895_83_reg_5203,
      R => '0'
    );
\icmp_ln895_84_reg_5213[0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B2"
    )
        port map (
      I0 => \select_ln432_58_reg_5218[6]_i_3_n_0\,
      I1 => max_bin_count_51_V(3),
      I2 => max_bin_count_19_V(3),
      O => \icmp_ln895_84_reg_5213[0]_i_1_n_0\
    );
\icmp_ln895_84_reg_5213_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => \icmp_ln895_84_reg_5213[0]_i_1_n_0\,
      Q => icmp_ln895_84_reg_5213,
      R => '0'
    );
\icmp_ln895_85_reg_5223[0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B2"
    )
        port map (
      I0 => \select_ln432_61_reg_5228[6]_i_3_n_0\,
      I1 => max_bin_count_52_V(3),
      I2 => max_bin_count_20_V(3),
      O => \icmp_ln895_85_reg_5223[0]_i_1_n_0\
    );
\icmp_ln895_85_reg_5223_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => \icmp_ln895_85_reg_5223[0]_i_1_n_0\,
      Q => icmp_ln895_85_reg_5223,
      R => '0'
    );
\icmp_ln895_86_reg_5233[0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B2"
    )
        port map (
      I0 => \select_ln432_64_reg_5238[6]_i_3_n_0\,
      I1 => max_bin_count_53_V(3),
      I2 => max_bin_count_21_V(3),
      O => \icmp_ln895_86_reg_5233[0]_i_1_n_0\
    );
\icmp_ln895_86_reg_5233_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => \icmp_ln895_86_reg_5233[0]_i_1_n_0\,
      Q => icmp_ln895_86_reg_5233,
      R => '0'
    );
\icmp_ln895_87_reg_5243[0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B2"
    )
        port map (
      I0 => \select_ln432_67_reg_5248[6]_i_3_n_0\,
      I1 => max_bin_count_54_V(3),
      I2 => max_bin_count_22_V(3),
      O => \icmp_ln895_87_reg_5243[0]_i_1_n_0\
    );
\icmp_ln895_87_reg_5243_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => \icmp_ln895_87_reg_5243[0]_i_1_n_0\,
      Q => icmp_ln895_87_reg_5243,
      R => '0'
    );
\icmp_ln895_88_reg_5253[0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B2"
    )
        port map (
      I0 => \select_ln432_70_reg_5258[6]_i_3_n_0\,
      I1 => max_bin_count_55_V(3),
      I2 => max_bin_count_23_V(3),
      O => \icmp_ln895_88_reg_5253[0]_i_1_n_0\
    );
\icmp_ln895_88_reg_5253_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => \icmp_ln895_88_reg_5253[0]_i_1_n_0\,
      Q => icmp_ln895_88_reg_5253,
      R => '0'
    );
\icmp_ln895_89_reg_5263[0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B2"
    )
        port map (
      I0 => \icmp_ln895_89_reg_5263[0]_i_2_n_0\,
      I1 => max_bin_count_56_V(3),
      I2 => max_bin_count_24_V(3),
      O => \icmp_ln895_89_reg_5263[0]_i_1_n_0\
    );
\icmp_ln895_89_reg_5263[0]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"2F02FFFF00002F02"
    )
        port map (
      I0 => max_bin_count_24_V(0),
      I1 => max_bin_count_56_V(0),
      I2 => max_bin_count_56_V(1),
      I3 => max_bin_count_24_V(1),
      I4 => max_bin_count_56_V(2),
      I5 => max_bin_count_24_V(2),
      O => \icmp_ln895_89_reg_5263[0]_i_2_n_0\
    );
\icmp_ln895_89_reg_5263_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => \icmp_ln895_89_reg_5263[0]_i_1_n_0\,
      Q => icmp_ln895_89_reg_5263,
      R => '0'
    );
\icmp_ln895_8_reg_4783[0]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0001"
    )
        port map (
      I0 => max_bin_count_8_V(2),
      I1 => max_bin_count_8_V(3),
      I2 => max_bin_count_8_V(1),
      I3 => max_bin_count_8_V(0),
      O => \icmp_ln895_8_reg_4783[0]_i_1_n_0\
    );
\icmp_ln895_8_reg_4783_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => \icmp_ln895_8_reg_4783[0]_i_1_n_0\,
      Q => icmp_ln895_8_reg_4783,
      R => '0'
    );
\icmp_ln895_90_reg_5268[0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B2"
    )
        port map (
      I0 => \icmp_ln895_90_reg_5268[0]_i_2_n_0\,
      I1 => max_bin_count_57_V(3),
      I2 => max_bin_count_25_V(3),
      O => \icmp_ln895_90_reg_5268[0]_i_1_n_0\
    );
\icmp_ln895_90_reg_5268[0]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"2F02FFFF00002F02"
    )
        port map (
      I0 => max_bin_count_25_V(0),
      I1 => max_bin_count_57_V(0),
      I2 => max_bin_count_57_V(1),
      I3 => max_bin_count_25_V(1),
      I4 => max_bin_count_57_V(2),
      I5 => max_bin_count_25_V(2),
      O => \icmp_ln895_90_reg_5268[0]_i_2_n_0\
    );
\icmp_ln895_90_reg_5268_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => \icmp_ln895_90_reg_5268[0]_i_1_n_0\,
      Q => icmp_ln895_90_reg_5268,
      R => '0'
    );
\icmp_ln895_91_reg_5273[0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B2"
    )
        port map (
      I0 => \icmp_ln895_91_reg_5273[0]_i_2_n_0\,
      I1 => max_bin_count_58_V(3),
      I2 => max_bin_count_26_V(3),
      O => \icmp_ln895_91_reg_5273[0]_i_1_n_0\
    );
\icmp_ln895_91_reg_5273[0]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"2F02FFFF00002F02"
    )
        port map (
      I0 => max_bin_count_26_V(0),
      I1 => max_bin_count_58_V(0),
      I2 => max_bin_count_58_V(1),
      I3 => max_bin_count_26_V(1),
      I4 => max_bin_count_58_V(2),
      I5 => max_bin_count_26_V(2),
      O => \icmp_ln895_91_reg_5273[0]_i_2_n_0\
    );
\icmp_ln895_91_reg_5273_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => \icmp_ln895_91_reg_5273[0]_i_1_n_0\,
      Q => icmp_ln895_91_reg_5273,
      R => '0'
    );
\icmp_ln895_92_reg_5278[0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B2"
    )
        port map (
      I0 => \icmp_ln895_92_reg_5278[0]_i_2_n_0\,
      I1 => max_bin_count_59_V(3),
      I2 => max_bin_count_27_V(3),
      O => \icmp_ln895_92_reg_5278[0]_i_1_n_0\
    );
\icmp_ln895_92_reg_5278[0]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"2F02FFFF00002F02"
    )
        port map (
      I0 => max_bin_count_27_V(0),
      I1 => max_bin_count_59_V(0),
      I2 => max_bin_count_59_V(1),
      I3 => max_bin_count_27_V(1),
      I4 => max_bin_count_59_V(2),
      I5 => max_bin_count_27_V(2),
      O => \icmp_ln895_92_reg_5278[0]_i_2_n_0\
    );
\icmp_ln895_92_reg_5278_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => \icmp_ln895_92_reg_5278[0]_i_1_n_0\,
      Q => icmp_ln895_92_reg_5278,
      R => '0'
    );
\icmp_ln895_93_reg_5283[0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B2"
    )
        port map (
      I0 => \icmp_ln895_93_reg_5283[0]_i_2_n_0\,
      I1 => max_bin_count_60_V(3),
      I2 => max_bin_count_28_V(3),
      O => \icmp_ln895_93_reg_5283[0]_i_1_n_0\
    );
\icmp_ln895_93_reg_5283[0]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"2F02FFFF00002F02"
    )
        port map (
      I0 => max_bin_count_28_V(0),
      I1 => max_bin_count_60_V(0),
      I2 => max_bin_count_60_V(1),
      I3 => max_bin_count_28_V(1),
      I4 => max_bin_count_60_V(2),
      I5 => max_bin_count_28_V(2),
      O => \icmp_ln895_93_reg_5283[0]_i_2_n_0\
    );
\icmp_ln895_93_reg_5283_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => \icmp_ln895_93_reg_5283[0]_i_1_n_0\,
      Q => icmp_ln895_93_reg_5283,
      R => '0'
    );
\icmp_ln895_94_reg_5288[0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B2"
    )
        port map (
      I0 => \icmp_ln895_94_reg_5288[0]_i_2_n_0\,
      I1 => max_bin_count_61_V(3),
      I2 => max_bin_count_29_V(3),
      O => \icmp_ln895_94_reg_5288[0]_i_1_n_0\
    );
\icmp_ln895_94_reg_5288[0]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"2F02FFFF00002F02"
    )
        port map (
      I0 => max_bin_count_29_V(0),
      I1 => max_bin_count_61_V(0),
      I2 => max_bin_count_61_V(1),
      I3 => max_bin_count_29_V(1),
      I4 => max_bin_count_61_V(2),
      I5 => max_bin_count_29_V(2),
      O => \icmp_ln895_94_reg_5288[0]_i_2_n_0\
    );
\icmp_ln895_94_reg_5288_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => \icmp_ln895_94_reg_5288[0]_i_1_n_0\,
      Q => icmp_ln895_94_reg_5288,
      R => '0'
    );
\icmp_ln895_95_reg_5293[0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B2"
    )
        port map (
      I0 => \icmp_ln895_95_reg_5293[0]_i_2_n_0\,
      I1 => max_bin_count_62_V(3),
      I2 => max_bin_count_30_V(3),
      O => \icmp_ln895_95_reg_5293[0]_i_1_n_0\
    );
\icmp_ln895_95_reg_5293[0]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"2F02FFFF00002F02"
    )
        port map (
      I0 => max_bin_count_30_V(0),
      I1 => max_bin_count_62_V(0),
      I2 => max_bin_count_62_V(1),
      I3 => max_bin_count_30_V(1),
      I4 => max_bin_count_62_V(2),
      I5 => max_bin_count_30_V(2),
      O => \icmp_ln895_95_reg_5293[0]_i_2_n_0\
    );
\icmp_ln895_95_reg_5293_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => \icmp_ln895_95_reg_5293[0]_i_1_n_0\,
      Q => icmp_ln895_95_reg_5293,
      R => '0'
    );
\icmp_ln895_96_reg_5298[0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B2"
    )
        port map (
      I0 => \icmp_ln895_96_reg_5298[0]_i_2_n_0\,
      I1 => max_bin_count_63_V(3),
      I2 => max_bin_count_31_V(3),
      O => \icmp_ln895_96_reg_5298[0]_i_1_n_0\
    );
\icmp_ln895_96_reg_5298[0]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"2F02FFFF00002F02"
    )
        port map (
      I0 => max_bin_count_31_V(0),
      I1 => max_bin_count_63_V(0),
      I2 => max_bin_count_63_V(1),
      I3 => max_bin_count_31_V(1),
      I4 => max_bin_count_63_V(2),
      I5 => max_bin_count_31_V(2),
      O => \icmp_ln895_96_reg_5298[0]_i_2_n_0\
    );
\icmp_ln895_96_reg_5298_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => \icmp_ln895_96_reg_5298[0]_i_1_n_0\,
      Q => icmp_ln895_96_reg_5298,
      R => '0'
    );
\icmp_ln895_97_reg_5303[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F1FF11F110110010"
    )
        port map (
      I0 => max_bin_count_48_V(3),
      I1 => max_bin_count_16_V(3),
      I2 => \icmp_ln895_97_reg_5303[0]_i_2_n_0\,
      I3 => select_ln432_50_fu_3044_p3(2),
      I4 => select_ln432_2_fu_2772_p3(2),
      I5 => select_ln432_2_fu_2772_p3(3),
      O => \icmp_ln895_97_reg_5303[0]_i_1_n_0\
    );
\icmp_ln895_97_reg_5303[0]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00E4FFFF000000E4"
    )
        port map (
      I0 => \icmp_ln895_65_reg_5063[0]_i_1_n_0\,
      I1 => max_bin_count_32_V(0),
      I2 => max_bin_count_0_V(0),
      I3 => select_ln432_50_fu_3044_p3(0),
      I4 => select_ln432_50_fu_3044_p3(1),
      I5 => select_ln432_2_fu_2772_p3(1),
      O => \icmp_ln895_97_reg_5303[0]_i_2_n_0\
    );
\icmp_ln895_97_reg_5303[0]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"ACAACCAC"
    )
        port map (
      I0 => max_bin_count_0_V(2),
      I1 => max_bin_count_32_V(2),
      I2 => \icmp_ln895_65_reg_5063[0]_i_2_n_0\,
      I3 => max_bin_count_32_V(3),
      I4 => max_bin_count_0_V(3),
      O => select_ln432_2_fu_2772_p3(2)
    );
\icmp_ln895_97_reg_5303_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => \icmp_ln895_97_reg_5303[0]_i_1_n_0\,
      Q => icmp_ln895_97_reg_5303,
      R => '0'
    );
\icmp_ln895_98_reg_5314[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F1FF11F110110010"
    )
        port map (
      I0 => max_bin_count_49_V(3),
      I1 => max_bin_count_17_V(3),
      I2 => \icmp_ln895_98_reg_5314[0]_i_2_n_0\,
      I3 => select_ln432_53_fu_3061_p3(2),
      I4 => select_ln432_5_fu_2789_p3(2),
      I5 => select_ln432_5_fu_2789_p3(3),
      O => \icmp_ln895_98_reg_5314[0]_i_1_n_0\
    );
\icmp_ln895_98_reg_5314[0]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00E4FFFF000000E4"
    )
        port map (
      I0 => \icmp_ln895_66_reg_5073[0]_i_1_n_0\,
      I1 => max_bin_count_33_V(0),
      I2 => max_bin_count_1_V(0),
      I3 => select_ln432_53_fu_3061_p3(0),
      I4 => select_ln432_53_fu_3061_p3(1),
      I5 => select_ln432_5_fu_2789_p3(1),
      O => \icmp_ln895_98_reg_5314[0]_i_2_n_0\
    );
\icmp_ln895_98_reg_5314[0]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"ACAACCAC"
    )
        port map (
      I0 => max_bin_count_1_V(2),
      I1 => max_bin_count_33_V(2),
      I2 => \icmp_ln895_66_reg_5073[0]_i_2_n_0\,
      I3 => max_bin_count_33_V(3),
      I4 => max_bin_count_1_V(3),
      O => select_ln432_5_fu_2789_p3(2)
    );
\icmp_ln895_98_reg_5314_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => \icmp_ln895_98_reg_5314[0]_i_1_n_0\,
      Q => icmp_ln895_98_reg_5314,
      R => '0'
    );
\icmp_ln895_99_reg_5325[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F1FF11F110110010"
    )
        port map (
      I0 => max_bin_count_50_V(3),
      I1 => max_bin_count_18_V(3),
      I2 => \icmp_ln895_99_reg_5325[0]_i_2_n_0\,
      I3 => select_ln432_56_fu_3078_p3(2),
      I4 => select_ln432_8_fu_2806_p3(2),
      I5 => select_ln432_8_fu_2806_p3(3),
      O => \icmp_ln895_99_reg_5325[0]_i_1_n_0\
    );
\icmp_ln895_99_reg_5325[0]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00E4FFFF000000E4"
    )
        port map (
      I0 => \icmp_ln895_67_reg_5083[0]_i_1_n_0\,
      I1 => max_bin_count_34_V(0),
      I2 => max_bin_count_2_V(0),
      I3 => select_ln432_56_fu_3078_p3(0),
      I4 => select_ln432_56_fu_3078_p3(1),
      I5 => select_ln432_8_fu_2806_p3(1),
      O => \icmp_ln895_99_reg_5325[0]_i_2_n_0\
    );
\icmp_ln895_99_reg_5325[0]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"ACAACCAC"
    )
        port map (
      I0 => max_bin_count_2_V(2),
      I1 => max_bin_count_34_V(2),
      I2 => \icmp_ln895_67_reg_5083[0]_i_2_n_0\,
      I3 => max_bin_count_34_V(3),
      I4 => max_bin_count_2_V(3),
      O => select_ln432_8_fu_2806_p3(2)
    );
\icmp_ln895_99_reg_5325_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => \icmp_ln895_99_reg_5325[0]_i_1_n_0\,
      Q => icmp_ln895_99_reg_5325,
      R => '0'
    );
\icmp_ln895_9_reg_4788[0]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0001"
    )
        port map (
      I0 => max_bin_count_9_V(2),
      I1 => max_bin_count_9_V(3),
      I2 => max_bin_count_9_V(1),
      I3 => max_bin_count_9_V(0),
      O => \icmp_ln895_9_reg_4788[0]_i_1_n_0\
    );
\icmp_ln895_9_reg_4788_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => \icmp_ln895_9_reg_4788[0]_i_1_n_0\,
      Q => icmp_ln895_9_reg_4788,
      R => '0'
    );
\icmp_ln895_reg_4743[0]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0001"
    )
        port map (
      I0 => max_bin_count_0_V(2),
      I1 => max_bin_count_0_V(3),
      I2 => max_bin_count_0_V(1),
      I3 => max_bin_count_0_V(0),
      O => \icmp_ln895_reg_4743[0]_i_1_n_0\
    );
\icmp_ln895_reg_4743_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => \icmp_ln895_reg_4743[0]_i_1_n_0\,
      Q => icmp_ln895_reg_4743,
      R => '0'
    );
\res_max_bin_count_V_1_data_reg[0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => res_max_bin_count_t_s_reg_5587(0),
      I1 => res_max_bin_count_t_1_reg_5603(0),
      I2 => \hls_LT_theta_V_1_data_reg[8]_i_2_n_0\,
      O => res_max_bin_count_t_2_fu_4637_p3(0)
    );
\res_max_bin_count_V_1_data_reg[1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => res_max_bin_count_t_s_reg_5587(1),
      I1 => res_max_bin_count_t_1_reg_5603(1),
      I2 => \hls_LT_theta_V_1_data_reg[8]_i_2_n_0\,
      O => res_max_bin_count_t_2_fu_4637_p3(1)
    );
\res_max_bin_count_V_1_data_reg[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => res_max_bin_count_t_s_reg_5587(2),
      I1 => res_max_bin_count_t_1_reg_5603(2),
      I2 => \hls_LT_theta_V_1_data_reg[8]_i_2_n_0\,
      O => res_max_bin_count_t_2_fu_4637_p3(2)
    );
\res_max_bin_count_V_1_data_reg[3]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => res_max_bin_count_t_s_reg_5587(3),
      I1 => res_max_bin_count_t_1_reg_5603(3),
      I2 => \hls_LT_theta_V_1_data_reg[8]_i_2_n_0\,
      O => res_max_bin_count_t_2_fu_4637_p3(3)
    );
\res_max_bin_count_V_1_data_reg_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => ap_enable_reg_pp0_iter2,
      D => res_max_bin_count_t_2_fu_4637_p3(0),
      Q => res_max_bin_count_V(0),
      R => '0'
    );
\res_max_bin_count_V_1_data_reg_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => ap_enable_reg_pp0_iter2,
      D => res_max_bin_count_t_2_fu_4637_p3(1),
      Q => res_max_bin_count_V(1),
      R => '0'
    );
\res_max_bin_count_V_1_data_reg_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => ap_enable_reg_pp0_iter2,
      D => res_max_bin_count_t_2_fu_4637_p3(2),
      Q => res_max_bin_count_V(2),
      R => '0'
    );
\res_max_bin_count_V_1_data_reg_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => ap_enable_reg_pp0_iter2,
      D => res_max_bin_count_t_2_fu_4637_p3(3),
      Q => res_max_bin_count_V(3),
      R => '0'
    );
\res_max_bin_count_t_1_reg_5603[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BFB0BFBF8F808080"
    )
        port map (
      I0 => \res_max_bin_count_t_1_reg_5603[0]_i_2_n_0\,
      I1 => \res_max_bin_theta_t_1_reg_5593[6]_i_3_n_0\,
      I2 => \res_max_bin_theta_t_1_reg_5593[6]_i_4_n_0\,
      I3 => \res_max_bin_count_t_1_reg_5603[0]_i_3_n_0\,
      I4 => \res_max_bin_theta_t_1_reg_5593[6]_i_6_n_0\,
      I5 => \res_max_bin_count_t_1_reg_5603[0]_i_4_n_0\,
      O => res_max_bin_count_t_1_fu_4624_p3(0)
    );
\res_max_bin_count_t_1_reg_5603[0]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => select_ln450_5_reg_5320(0),
      I1 => icmp_ln895_114_reg_5518,
      I2 => select_ln450_29_reg_5416(0),
      O => \res_max_bin_count_t_1_reg_5603[0]_i_2_n_0\
    );
\res_max_bin_count_t_1_reg_5603[0]_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => select_ln450_17_reg_5364(0),
      I1 => icmp_ln895_118_reg_5546,
      I2 => select_ln450_41_reg_5476(0),
      O => \res_max_bin_count_t_1_reg_5603[0]_i_3_n_0\
    );
\res_max_bin_count_t_1_reg_5603[0]_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8FFB800"
    )
        port map (
      I0 => select_ln450_11_reg_5342(0),
      I1 => icmp_ln895_116_reg_5532,
      I2 => select_ln450_35_reg_5446(0),
      I3 => \res_max_bin_theta_t_1_reg_5593[2]_i_2_n_0\,
      I4 => \res_max_bin_count_t_1_reg_5603[0]_i_5_n_0\,
      O => \res_max_bin_count_t_1_reg_5603[0]_i_4_n_0\
    );
\res_max_bin_count_t_1_reg_5603[0]_i_5\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => select_ln450_23_reg_5386(0),
      I1 => icmp_ln895_120_reg_5560,
      I2 => select_ln450_47_reg_5506(0),
      O => \res_max_bin_count_t_1_reg_5603[0]_i_5_n_0\
    );
\res_max_bin_count_t_1_reg_5603[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BFB0BFBF8F808080"
    )
        port map (
      I0 => \res_max_bin_count_t_1_reg_5603[1]_i_2_n_0\,
      I1 => \res_max_bin_theta_t_1_reg_5593[6]_i_3_n_0\,
      I2 => \res_max_bin_theta_t_1_reg_5593[6]_i_4_n_0\,
      I3 => \res_max_bin_count_t_1_reg_5603[1]_i_3_n_0\,
      I4 => \res_max_bin_theta_t_1_reg_5593[6]_i_6_n_0\,
      I5 => \res_max_bin_count_t_1_reg_5603[1]_i_4_n_0\,
      O => res_max_bin_count_t_1_fu_4624_p3(1)
    );
\res_max_bin_count_t_1_reg_5603[1]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => select_ln450_5_reg_5320(1),
      I1 => icmp_ln895_114_reg_5518,
      I2 => select_ln450_29_reg_5416(1),
      O => \res_max_bin_count_t_1_reg_5603[1]_i_2_n_0\
    );
\res_max_bin_count_t_1_reg_5603[1]_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => select_ln450_17_reg_5364(1),
      I1 => icmp_ln895_118_reg_5546,
      I2 => select_ln450_41_reg_5476(1),
      O => \res_max_bin_count_t_1_reg_5603[1]_i_3_n_0\
    );
\res_max_bin_count_t_1_reg_5603[1]_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8FFB800"
    )
        port map (
      I0 => select_ln450_11_reg_5342(1),
      I1 => icmp_ln895_116_reg_5532,
      I2 => select_ln450_35_reg_5446(1),
      I3 => \res_max_bin_theta_t_1_reg_5593[2]_i_2_n_0\,
      I4 => \res_max_bin_count_t_1_reg_5603[1]_i_5_n_0\,
      O => \res_max_bin_count_t_1_reg_5603[1]_i_4_n_0\
    );
\res_max_bin_count_t_1_reg_5603[1]_i_5\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => select_ln450_23_reg_5386(1),
      I1 => icmp_ln895_120_reg_5560,
      I2 => select_ln450_47_reg_5506(1),
      O => \res_max_bin_count_t_1_reg_5603[1]_i_5_n_0\
    );
\res_max_bin_count_t_1_reg_5603[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BFB0BFBF8F808080"
    )
        port map (
      I0 => \res_max_bin_count_t_1_reg_5603[2]_i_2_n_0\,
      I1 => \res_max_bin_theta_t_1_reg_5593[6]_i_3_n_0\,
      I2 => \res_max_bin_theta_t_1_reg_5593[6]_i_4_n_0\,
      I3 => \res_max_bin_count_t_1_reg_5603[2]_i_3_n_0\,
      I4 => \res_max_bin_theta_t_1_reg_5593[6]_i_6_n_0\,
      I5 => \res_max_bin_count_t_1_reg_5603[2]_i_4_n_0\,
      O => res_max_bin_count_t_1_fu_4624_p3(2)
    );
\res_max_bin_count_t_1_reg_5603[2]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => select_ln450_5_reg_5320(2),
      I1 => icmp_ln895_114_reg_5518,
      I2 => select_ln450_29_reg_5416(2),
      O => \res_max_bin_count_t_1_reg_5603[2]_i_2_n_0\
    );
\res_max_bin_count_t_1_reg_5603[2]_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => select_ln450_17_reg_5364(2),
      I1 => icmp_ln895_118_reg_5546,
      I2 => select_ln450_41_reg_5476(2),
      O => \res_max_bin_count_t_1_reg_5603[2]_i_3_n_0\
    );
\res_max_bin_count_t_1_reg_5603[2]_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8FFB800"
    )
        port map (
      I0 => select_ln450_11_reg_5342(2),
      I1 => icmp_ln895_116_reg_5532,
      I2 => select_ln450_35_reg_5446(2),
      I3 => \res_max_bin_theta_t_1_reg_5593[2]_i_2_n_0\,
      I4 => \res_max_bin_theta_t_1_reg_5593[2]_i_5_n_0\,
      O => \res_max_bin_count_t_1_reg_5603[2]_i_4_n_0\
    );
\res_max_bin_count_t_1_reg_5603[3]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"EFEAFFFF"
    )
        port map (
      I0 => \res_max_bin_count_t_1_reg_5603[3]_i_2_n_0\,
      I1 => select_ln450_5_reg_5320(3),
      I2 => icmp_ln895_114_reg_5518,
      I3 => select_ln450_29_reg_5416(3),
      I4 => \res_max_bin_count_t_1_reg_5603[3]_i_3_n_0\,
      O => res_max_bin_count_t_1_fu_4624_p3(3)
    );
\res_max_bin_count_t_1_reg_5603[3]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => select_ln450_17_reg_5364(3),
      I1 => icmp_ln895_118_reg_5546,
      I2 => select_ln450_41_reg_5476(3),
      O => \res_max_bin_count_t_1_reg_5603[3]_i_2_n_0\
    );
\res_max_bin_count_t_1_reg_5603[3]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000001D1D1D001D"
    )
        port map (
      I0 => select_ln450_47_reg_5506(3),
      I1 => icmp_ln895_120_reg_5560,
      I2 => select_ln450_23_reg_5386(3),
      I3 => select_ln450_35_reg_5446(3),
      I4 => icmp_ln895_116_reg_5532,
      I5 => select_ln450_11_reg_5342(3),
      O => \res_max_bin_count_t_1_reg_5603[3]_i_3_n_0\
    );
\res_max_bin_count_t_1_reg_5603_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => res_max_bin_count_t_1_fu_4624_p3(0),
      Q => res_max_bin_count_t_1_reg_5603(0),
      R => '0'
    );
\res_max_bin_count_t_1_reg_5603_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => res_max_bin_count_t_1_fu_4624_p3(1),
      Q => res_max_bin_count_t_1_reg_5603(1),
      R => '0'
    );
\res_max_bin_count_t_1_reg_5603_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => res_max_bin_count_t_1_fu_4624_p3(2),
      Q => res_max_bin_count_t_1_reg_5603(2),
      R => '0'
    );
\res_max_bin_count_t_1_reg_5603_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => res_max_bin_count_t_1_fu_4624_p3(3),
      Q => res_max_bin_count_t_1_reg_5603(3),
      R => '0'
    );
\res_max_bin_count_t_s_reg_5587[0]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"ACAACCAC"
    )
        port map (
      I0 => select_ln486_2_fu_4508_p3(0),
      I1 => select_ln486_8_fu_4558_p3(0),
      I2 => \res_max_bin_count_t_s_reg_5587[1]_i_4_n_0\,
      I3 => select_ln486_8_fu_4558_p3(3),
      I4 => select_ln486_2_fu_4508_p3(3),
      O => res_max_bin_count_t_s_fu_4600_p3(0)
    );
\res_max_bin_count_t_s_reg_5587[0]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"ACACFF00"
    )
        port map (
      I0 => select_ln450_2_reg_5309(0),
      I1 => select_ln450_26_reg_5401(0),
      I2 => icmp_ln895_113_reg_5511,
      I3 => select_ln468_14_fu_4429_p3(0),
      I4 => \select_ln486_reg_5567[6]_i_4_n_0\,
      O => select_ln486_2_fu_4508_p3(0)
    );
\res_max_bin_count_t_s_reg_5587[0]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"ACACFF00"
    )
        port map (
      I0 => select_ln450_8_reg_5331(0),
      I1 => select_ln450_32_reg_5431(0),
      I2 => icmp_ln895_115_reg_5525,
      I3 => select_ln468_20_fu_4467_p3(0),
      I4 => \select_ln486_6_reg_5572[6]_i_4_n_0\,
      O => select_ln486_8_fu_4558_p3(0)
    );
\res_max_bin_count_t_s_reg_5587[0]_i_4\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => select_ln450_14_reg_5353(0),
      I1 => select_ln450_38_reg_5461(0),
      I2 => icmp_ln895_117_reg_5539,
      O => select_ln468_14_fu_4429_p3(0)
    );
\res_max_bin_count_t_s_reg_5587[0]_i_5\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => select_ln450_20_reg_5375(0),
      I1 => select_ln450_44_reg_5491(0),
      I2 => icmp_ln895_119_reg_5553,
      O => select_ln468_20_fu_4467_p3(0)
    );
\res_max_bin_count_t_s_reg_5587[1]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"ACAACCAC"
    )
        port map (
      I0 => select_ln486_2_fu_4508_p3(1),
      I1 => select_ln486_8_fu_4558_p3(1),
      I2 => \res_max_bin_count_t_s_reg_5587[1]_i_4_n_0\,
      I3 => select_ln486_8_fu_4558_p3(3),
      I4 => select_ln486_2_fu_4508_p3(3),
      O => res_max_bin_count_t_s_fu_4600_p3(1)
    );
\res_max_bin_count_t_s_reg_5587[1]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"ACACFF00"
    )
        port map (
      I0 => select_ln450_2_reg_5309(1),
      I1 => select_ln450_26_reg_5401(1),
      I2 => icmp_ln895_113_reg_5511,
      I3 => select_ln468_14_fu_4429_p3(1),
      I4 => \select_ln486_reg_5567[6]_i_4_n_0\,
      O => select_ln486_2_fu_4508_p3(1)
    );
\res_max_bin_count_t_s_reg_5587[1]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"ACACFF00"
    )
        port map (
      I0 => select_ln450_8_reg_5331(1),
      I1 => select_ln450_32_reg_5431(1),
      I2 => icmp_ln895_115_reg_5525,
      I3 => select_ln468_20_fu_4467_p3(1),
      I4 => \select_ln486_6_reg_5572[6]_i_4_n_0\,
      O => select_ln486_8_fu_4558_p3(1)
    );
\res_max_bin_count_t_s_reg_5587[1]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"2F02FFFF00002F02"
    )
        port map (
      I0 => select_ln486_2_fu_4508_p3(0),
      I1 => select_ln486_8_fu_4558_p3(0),
      I2 => select_ln486_8_fu_4558_p3(1),
      I3 => select_ln486_2_fu_4508_p3(1),
      I4 => select_ln486_8_fu_4558_p3(2),
      I5 => select_ln486_2_fu_4508_p3(2),
      O => \res_max_bin_count_t_s_reg_5587[1]_i_4_n_0\
    );
\res_max_bin_count_t_s_reg_5587[1]_i_5\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => select_ln450_14_reg_5353(1),
      I1 => select_ln450_38_reg_5461(1),
      I2 => icmp_ln895_117_reg_5539,
      O => select_ln468_14_fu_4429_p3(1)
    );
\res_max_bin_count_t_s_reg_5587[1]_i_6\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => select_ln450_20_reg_5375(1),
      I1 => select_ln450_44_reg_5491(1),
      I2 => icmp_ln895_119_reg_5553,
      O => select_ln468_20_fu_4467_p3(1)
    );
\res_max_bin_count_t_s_reg_5587[2]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"ECAE"
    )
        port map (
      I0 => select_ln486_8_fu_4558_p3(2),
      I1 => select_ln486_2_fu_4508_p3(2),
      I2 => select_ln486_8_fu_4558_p3(3),
      I3 => select_ln486_2_fu_4508_p3(3),
      O => res_max_bin_count_t_s_fu_4600_p3(2)
    );
\res_max_bin_count_t_s_reg_5587[2]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"ACACFF00"
    )
        port map (
      I0 => select_ln450_8_reg_5331(2),
      I1 => select_ln450_32_reg_5431(2),
      I2 => icmp_ln895_115_reg_5525,
      I3 => select_ln468_20_fu_4467_p3(2),
      I4 => \select_ln486_6_reg_5572[6]_i_4_n_0\,
      O => select_ln486_8_fu_4558_p3(2)
    );
\res_max_bin_count_t_s_reg_5587[2]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"ACACFF00"
    )
        port map (
      I0 => select_ln450_2_reg_5309(2),
      I1 => select_ln450_26_reg_5401(2),
      I2 => icmp_ln895_113_reg_5511,
      I3 => select_ln468_14_fu_4429_p3(2),
      I4 => \select_ln486_reg_5567[6]_i_4_n_0\,
      O => select_ln486_2_fu_4508_p3(2)
    );
\res_max_bin_count_t_s_reg_5587[3]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => select_ln486_8_fu_4558_p3(3),
      I1 => select_ln486_2_fu_4508_p3(3),
      O => res_max_bin_count_t_s_fu_4600_p3(3)
    );
\res_max_bin_count_t_s_reg_5587[3]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"ACACFF00"
    )
        port map (
      I0 => select_ln450_8_reg_5331(3),
      I1 => select_ln450_32_reg_5431(3),
      I2 => icmp_ln895_115_reg_5525,
      I3 => select_ln468_20_fu_4467_p3(3),
      I4 => \select_ln486_6_reg_5572[6]_i_4_n_0\,
      O => select_ln486_8_fu_4558_p3(3)
    );
\res_max_bin_count_t_s_reg_5587[3]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"ACACFF00"
    )
        port map (
      I0 => select_ln450_2_reg_5309(3),
      I1 => select_ln450_26_reg_5401(3),
      I2 => icmp_ln895_113_reg_5511,
      I3 => select_ln468_14_fu_4429_p3(3),
      I4 => \select_ln486_reg_5567[6]_i_4_n_0\,
      O => select_ln486_2_fu_4508_p3(3)
    );
\res_max_bin_count_t_s_reg_5587_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => res_max_bin_count_t_s_fu_4600_p3(0),
      Q => res_max_bin_count_t_s_reg_5587(0),
      R => '0'
    );
\res_max_bin_count_t_s_reg_5587_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => res_max_bin_count_t_s_fu_4600_p3(1),
      Q => res_max_bin_count_t_s_reg_5587(1),
      R => '0'
    );
\res_max_bin_count_t_s_reg_5587_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => res_max_bin_count_t_s_fu_4600_p3(2),
      Q => res_max_bin_count_t_s_reg_5587(2),
      R => '0'
    );
\res_max_bin_count_t_s_reg_5587_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => res_max_bin_count_t_s_fu_4600_p3(3),
      Q => res_max_bin_count_t_s_reg_5587(3),
      R => '0'
    );
\res_max_bin_r_t_V_1_reg_5598[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BFB0BFBF8F808080"
    )
        port map (
      I0 => \res_max_bin_r_t_V_1_reg_5598[0]_i_2_n_0\,
      I1 => \res_max_bin_theta_t_1_reg_5593[6]_i_3_n_0\,
      I2 => \res_max_bin_theta_t_1_reg_5593[6]_i_4_n_0\,
      I3 => \res_max_bin_r_t_V_1_reg_5598[0]_i_3_n_0\,
      I4 => \res_max_bin_theta_t_1_reg_5593[6]_i_6_n_0\,
      I5 => \res_max_bin_r_t_V_1_reg_5598_reg[0]_i_4_n_0\,
      O => res_max_bin_r_t_V_1_fu_4616_p3(0)
    );
\res_max_bin_r_t_V_1_reg_5598[0]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8FFB800"
    )
        port map (
      I0 => \select_ln432_4_reg_5078_reg_n_0_[0]\,
      I1 => icmp_ln895_98_reg_5314,
      I2 => \select_ln432_52_reg_5198_reg_n_0_[0]\,
      I3 => icmp_ln895_114_reg_5518,
      I4 => \select_ln450_28_reg_5411_reg_n_0_[0]\,
      O => \res_max_bin_r_t_V_1_reg_5598[0]_i_2_n_0\
    );
\res_max_bin_r_t_V_1_reg_5598[0]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8FFB800"
    )
        port map (
      I0 => \select_ln432_16_reg_5118_reg_n_0_[0]\,
      I1 => icmp_ln895_102_reg_5358,
      I2 => \select_ln432_64_reg_5238_reg_n_0_[0]\,
      I3 => icmp_ln895_118_reg_5546,
      I4 => \select_ln450_40_reg_5471_reg_n_0_[0]\,
      O => \res_max_bin_r_t_V_1_reg_5598[0]_i_3_n_0\
    );
\res_max_bin_r_t_V_1_reg_5598[0]_i_5\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8FFB800"
    )
        port map (
      I0 => \select_ln432_22_reg_5138_reg_n_0_[0]\,
      I1 => icmp_ln895_104_reg_5380,
      I2 => \select_ln432_70_reg_5258_reg_n_0_[0]\,
      I3 => icmp_ln895_120_reg_5560,
      I4 => \select_ln450_46_reg_5501_reg_n_0_[0]\,
      O => \res_max_bin_r_t_V_1_reg_5598[0]_i_5_n_0\
    );
\res_max_bin_r_t_V_1_reg_5598[0]_i_6\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8FFB800"
    )
        port map (
      I0 => \select_ln432_10_reg_5098_reg_n_0_[0]\,
      I1 => icmp_ln895_100_reg_5336,
      I2 => \select_ln432_58_reg_5218_reg_n_0_[0]\,
      I3 => icmp_ln895_116_reg_5532,
      I4 => \select_ln450_34_reg_5441_reg_n_0_[0]\,
      O => \res_max_bin_r_t_V_1_reg_5598[0]_i_6_n_0\
    );
\res_max_bin_r_t_V_1_reg_5598[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BFB0BFBF8F808080"
    )
        port map (
      I0 => \res_max_bin_r_t_V_1_reg_5598[1]_i_2_n_0\,
      I1 => \res_max_bin_theta_t_1_reg_5593[6]_i_3_n_0\,
      I2 => \res_max_bin_theta_t_1_reg_5593[6]_i_4_n_0\,
      I3 => \res_max_bin_r_t_V_1_reg_5598[1]_i_3_n_0\,
      I4 => \res_max_bin_theta_t_1_reg_5593[6]_i_6_n_0\,
      I5 => \res_max_bin_r_t_V_1_reg_5598_reg[1]_i_4_n_0\,
      O => res_max_bin_r_t_V_1_fu_4616_p3(1)
    );
\res_max_bin_r_t_V_1_reg_5598[1]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8FFB800"
    )
        port map (
      I0 => \select_ln432_4_reg_5078_reg_n_0_[1]\,
      I1 => icmp_ln895_98_reg_5314,
      I2 => \select_ln432_52_reg_5198_reg_n_0_[1]\,
      I3 => icmp_ln895_114_reg_5518,
      I4 => \select_ln450_28_reg_5411_reg_n_0_[1]\,
      O => \res_max_bin_r_t_V_1_reg_5598[1]_i_2_n_0\
    );
\res_max_bin_r_t_V_1_reg_5598[1]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8FFB800"
    )
        port map (
      I0 => \select_ln432_16_reg_5118_reg_n_0_[1]\,
      I1 => icmp_ln895_102_reg_5358,
      I2 => \select_ln432_64_reg_5238_reg_n_0_[1]\,
      I3 => icmp_ln895_118_reg_5546,
      I4 => \select_ln450_40_reg_5471_reg_n_0_[1]\,
      O => \res_max_bin_r_t_V_1_reg_5598[1]_i_3_n_0\
    );
\res_max_bin_r_t_V_1_reg_5598[1]_i_5\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8FFB800"
    )
        port map (
      I0 => \select_ln432_22_reg_5138_reg_n_0_[1]\,
      I1 => icmp_ln895_104_reg_5380,
      I2 => \select_ln432_70_reg_5258_reg_n_0_[1]\,
      I3 => icmp_ln895_120_reg_5560,
      I4 => \select_ln450_46_reg_5501_reg_n_0_[1]\,
      O => \res_max_bin_r_t_V_1_reg_5598[1]_i_5_n_0\
    );
\res_max_bin_r_t_V_1_reg_5598[1]_i_6\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8FFB800"
    )
        port map (
      I0 => \select_ln432_10_reg_5098_reg_n_0_[1]\,
      I1 => icmp_ln895_100_reg_5336,
      I2 => \select_ln432_58_reg_5218_reg_n_0_[1]\,
      I3 => icmp_ln895_116_reg_5532,
      I4 => \select_ln450_34_reg_5441_reg_n_0_[1]\,
      O => \res_max_bin_r_t_V_1_reg_5598[1]_i_6_n_0\
    );
\res_max_bin_r_t_V_1_reg_5598[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BFB0BFBF8F808080"
    )
        port map (
      I0 => \res_max_bin_r_t_V_1_reg_5598[2]_i_2_n_0\,
      I1 => \res_max_bin_theta_t_1_reg_5593[6]_i_3_n_0\,
      I2 => \res_max_bin_theta_t_1_reg_5593[6]_i_4_n_0\,
      I3 => \res_max_bin_r_t_V_1_reg_5598[2]_i_3_n_0\,
      I4 => \res_max_bin_theta_t_1_reg_5593[6]_i_6_n_0\,
      I5 => \res_max_bin_r_t_V_1_reg_5598_reg[2]_i_4_n_0\,
      O => res_max_bin_r_t_V_1_fu_4616_p3(2)
    );
\res_max_bin_r_t_V_1_reg_5598[2]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8FFB800"
    )
        port map (
      I0 => \select_ln432_4_reg_5078_reg_n_0_[2]\,
      I1 => icmp_ln895_98_reg_5314,
      I2 => \select_ln432_52_reg_5198_reg_n_0_[2]\,
      I3 => icmp_ln895_114_reg_5518,
      I4 => \select_ln450_28_reg_5411_reg_n_0_[2]\,
      O => \res_max_bin_r_t_V_1_reg_5598[2]_i_2_n_0\
    );
\res_max_bin_r_t_V_1_reg_5598[2]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8FFB800"
    )
        port map (
      I0 => \select_ln432_16_reg_5118_reg_n_0_[2]\,
      I1 => icmp_ln895_102_reg_5358,
      I2 => \select_ln432_64_reg_5238_reg_n_0_[2]\,
      I3 => icmp_ln895_118_reg_5546,
      I4 => \select_ln450_40_reg_5471_reg_n_0_[2]\,
      O => \res_max_bin_r_t_V_1_reg_5598[2]_i_3_n_0\
    );
\res_max_bin_r_t_V_1_reg_5598[2]_i_5\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8FFB800"
    )
        port map (
      I0 => \select_ln432_22_reg_5138_reg_n_0_[2]\,
      I1 => icmp_ln895_104_reg_5380,
      I2 => \select_ln432_70_reg_5258_reg_n_0_[2]\,
      I3 => icmp_ln895_120_reg_5560,
      I4 => \select_ln450_46_reg_5501_reg_n_0_[2]\,
      O => \res_max_bin_r_t_V_1_reg_5598[2]_i_5_n_0\
    );
\res_max_bin_r_t_V_1_reg_5598[2]_i_6\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8FFB800"
    )
        port map (
      I0 => \select_ln432_10_reg_5098_reg_n_0_[2]\,
      I1 => icmp_ln895_100_reg_5336,
      I2 => \select_ln432_58_reg_5218_reg_n_0_[2]\,
      I3 => icmp_ln895_116_reg_5532,
      I4 => \select_ln450_34_reg_5441_reg_n_0_[2]\,
      O => \res_max_bin_r_t_V_1_reg_5598[2]_i_6_n_0\
    );
\res_max_bin_r_t_V_1_reg_5598[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BFB0BFBF8F808080"
    )
        port map (
      I0 => \res_max_bin_r_t_V_1_reg_5598[3]_i_2_n_0\,
      I1 => \res_max_bin_theta_t_1_reg_5593[6]_i_3_n_0\,
      I2 => \res_max_bin_theta_t_1_reg_5593[6]_i_4_n_0\,
      I3 => \res_max_bin_r_t_V_1_reg_5598[3]_i_3_n_0\,
      I4 => \res_max_bin_theta_t_1_reg_5593[6]_i_6_n_0\,
      I5 => \res_max_bin_r_t_V_1_reg_5598_reg[3]_i_4_n_0\,
      O => res_max_bin_r_t_V_1_fu_4616_p3(3)
    );
\res_max_bin_r_t_V_1_reg_5598[3]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8FFB800"
    )
        port map (
      I0 => \select_ln432_4_reg_5078_reg_n_0_[3]\,
      I1 => icmp_ln895_98_reg_5314,
      I2 => \select_ln432_52_reg_5198_reg_n_0_[3]\,
      I3 => icmp_ln895_114_reg_5518,
      I4 => \select_ln450_28_reg_5411_reg_n_0_[3]\,
      O => \res_max_bin_r_t_V_1_reg_5598[3]_i_2_n_0\
    );
\res_max_bin_r_t_V_1_reg_5598[3]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8FFB800"
    )
        port map (
      I0 => \select_ln432_16_reg_5118_reg_n_0_[3]\,
      I1 => icmp_ln895_102_reg_5358,
      I2 => \select_ln432_64_reg_5238_reg_n_0_[3]\,
      I3 => icmp_ln895_118_reg_5546,
      I4 => \select_ln450_40_reg_5471_reg_n_0_[3]\,
      O => \res_max_bin_r_t_V_1_reg_5598[3]_i_3_n_0\
    );
\res_max_bin_r_t_V_1_reg_5598[3]_i_5\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8FFB800"
    )
        port map (
      I0 => \select_ln432_22_reg_5138_reg_n_0_[3]\,
      I1 => icmp_ln895_104_reg_5380,
      I2 => \select_ln432_70_reg_5258_reg_n_0_[3]\,
      I3 => icmp_ln895_120_reg_5560,
      I4 => \select_ln450_46_reg_5501_reg_n_0_[3]\,
      O => \res_max_bin_r_t_V_1_reg_5598[3]_i_5_n_0\
    );
\res_max_bin_r_t_V_1_reg_5598[3]_i_6\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8FFB800"
    )
        port map (
      I0 => \select_ln432_10_reg_5098_reg_n_0_[3]\,
      I1 => icmp_ln895_100_reg_5336,
      I2 => \select_ln432_58_reg_5218_reg_n_0_[3]\,
      I3 => icmp_ln895_116_reg_5532,
      I4 => \select_ln450_34_reg_5441_reg_n_0_[3]\,
      O => \res_max_bin_r_t_V_1_reg_5598[3]_i_6_n_0\
    );
\res_max_bin_r_t_V_1_reg_5598[4]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BFB0BFBF8F808080"
    )
        port map (
      I0 => \res_max_bin_r_t_V_1_reg_5598[4]_i_2_n_0\,
      I1 => \res_max_bin_theta_t_1_reg_5593[6]_i_3_n_0\,
      I2 => \res_max_bin_theta_t_1_reg_5593[6]_i_4_n_0\,
      I3 => \res_max_bin_r_t_V_1_reg_5598[4]_i_3_n_0\,
      I4 => \res_max_bin_theta_t_1_reg_5593[6]_i_6_n_0\,
      I5 => \res_max_bin_r_t_V_1_reg_5598_reg[4]_i_4_n_0\,
      O => res_max_bin_r_t_V_1_fu_4616_p3(4)
    );
\res_max_bin_r_t_V_1_reg_5598[4]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8FFB800"
    )
        port map (
      I0 => \select_ln432_4_reg_5078_reg_n_0_[4]\,
      I1 => icmp_ln895_98_reg_5314,
      I2 => \select_ln432_52_reg_5198_reg_n_0_[4]\,
      I3 => icmp_ln895_114_reg_5518,
      I4 => \select_ln450_28_reg_5411_reg_n_0_[4]\,
      O => \res_max_bin_r_t_V_1_reg_5598[4]_i_2_n_0\
    );
\res_max_bin_r_t_V_1_reg_5598[4]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8FFB800"
    )
        port map (
      I0 => \select_ln432_16_reg_5118_reg_n_0_[4]\,
      I1 => icmp_ln895_102_reg_5358,
      I2 => \select_ln432_64_reg_5238_reg_n_0_[4]\,
      I3 => icmp_ln895_118_reg_5546,
      I4 => \select_ln450_40_reg_5471_reg_n_0_[4]\,
      O => \res_max_bin_r_t_V_1_reg_5598[4]_i_3_n_0\
    );
\res_max_bin_r_t_V_1_reg_5598[4]_i_5\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8FFB800"
    )
        port map (
      I0 => \select_ln432_22_reg_5138_reg_n_0_[4]\,
      I1 => icmp_ln895_104_reg_5380,
      I2 => \select_ln432_70_reg_5258_reg_n_0_[4]\,
      I3 => icmp_ln895_120_reg_5560,
      I4 => \select_ln450_46_reg_5501_reg_n_0_[4]\,
      O => \res_max_bin_r_t_V_1_reg_5598[4]_i_5_n_0\
    );
\res_max_bin_r_t_V_1_reg_5598[4]_i_6\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8FFB800"
    )
        port map (
      I0 => \select_ln432_10_reg_5098_reg_n_0_[4]\,
      I1 => icmp_ln895_100_reg_5336,
      I2 => \select_ln432_58_reg_5218_reg_n_0_[4]\,
      I3 => icmp_ln895_116_reg_5532,
      I4 => \select_ln450_34_reg_5441_reg_n_0_[4]\,
      O => \res_max_bin_r_t_V_1_reg_5598[4]_i_6_n_0\
    );
\res_max_bin_r_t_V_1_reg_5598[5]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BFB0BFBF8F808080"
    )
        port map (
      I0 => \res_max_bin_r_t_V_1_reg_5598[5]_i_2_n_0\,
      I1 => \res_max_bin_theta_t_1_reg_5593[6]_i_3_n_0\,
      I2 => \res_max_bin_theta_t_1_reg_5593[6]_i_4_n_0\,
      I3 => \res_max_bin_r_t_V_1_reg_5598[5]_i_3_n_0\,
      I4 => \res_max_bin_theta_t_1_reg_5593[6]_i_6_n_0\,
      I5 => \res_max_bin_r_t_V_1_reg_5598_reg[5]_i_4_n_0\,
      O => res_max_bin_r_t_V_1_fu_4616_p3(5)
    );
\res_max_bin_r_t_V_1_reg_5598[5]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8FFB800"
    )
        port map (
      I0 => \select_ln432_4_reg_5078_reg_n_0_[5]\,
      I1 => icmp_ln895_98_reg_5314,
      I2 => \select_ln432_52_reg_5198_reg_n_0_[5]\,
      I3 => icmp_ln895_114_reg_5518,
      I4 => \select_ln450_28_reg_5411_reg_n_0_[5]\,
      O => \res_max_bin_r_t_V_1_reg_5598[5]_i_2_n_0\
    );
\res_max_bin_r_t_V_1_reg_5598[5]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8FFB800"
    )
        port map (
      I0 => \select_ln432_16_reg_5118_reg_n_0_[5]\,
      I1 => icmp_ln895_102_reg_5358,
      I2 => \select_ln432_64_reg_5238_reg_n_0_[5]\,
      I3 => icmp_ln895_118_reg_5546,
      I4 => \select_ln450_40_reg_5471_reg_n_0_[5]\,
      O => \res_max_bin_r_t_V_1_reg_5598[5]_i_3_n_0\
    );
\res_max_bin_r_t_V_1_reg_5598[5]_i_5\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8FFB800"
    )
        port map (
      I0 => \select_ln432_22_reg_5138_reg_n_0_[5]\,
      I1 => icmp_ln895_104_reg_5380,
      I2 => \select_ln432_70_reg_5258_reg_n_0_[5]\,
      I3 => icmp_ln895_120_reg_5560,
      I4 => \select_ln450_46_reg_5501_reg_n_0_[5]\,
      O => \res_max_bin_r_t_V_1_reg_5598[5]_i_5_n_0\
    );
\res_max_bin_r_t_V_1_reg_5598[5]_i_6\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8FFB800"
    )
        port map (
      I0 => \select_ln432_10_reg_5098_reg_n_0_[5]\,
      I1 => icmp_ln895_100_reg_5336,
      I2 => \select_ln432_58_reg_5218_reg_n_0_[5]\,
      I3 => icmp_ln895_116_reg_5532,
      I4 => \select_ln450_34_reg_5441_reg_n_0_[5]\,
      O => \res_max_bin_r_t_V_1_reg_5598[5]_i_6_n_0\
    );
\res_max_bin_r_t_V_1_reg_5598[6]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BFB0BFBF8F808080"
    )
        port map (
      I0 => \res_max_bin_r_t_V_1_reg_5598[6]_i_2_n_0\,
      I1 => \res_max_bin_theta_t_1_reg_5593[6]_i_3_n_0\,
      I2 => \res_max_bin_theta_t_1_reg_5593[6]_i_4_n_0\,
      I3 => \res_max_bin_r_t_V_1_reg_5598[6]_i_3_n_0\,
      I4 => \res_max_bin_theta_t_1_reg_5593[6]_i_6_n_0\,
      I5 => \res_max_bin_r_t_V_1_reg_5598_reg[6]_i_4_n_0\,
      O => res_max_bin_r_t_V_1_fu_4616_p3(6)
    );
\res_max_bin_r_t_V_1_reg_5598[6]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8FFB800"
    )
        port map (
      I0 => \select_ln432_4_reg_5078_reg_n_0_[6]\,
      I1 => icmp_ln895_98_reg_5314,
      I2 => \select_ln432_52_reg_5198_reg_n_0_[6]\,
      I3 => icmp_ln895_114_reg_5518,
      I4 => \select_ln450_28_reg_5411_reg_n_0_[6]\,
      O => \res_max_bin_r_t_V_1_reg_5598[6]_i_2_n_0\
    );
\res_max_bin_r_t_V_1_reg_5598[6]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8FFB800"
    )
        port map (
      I0 => \select_ln432_16_reg_5118_reg_n_0_[6]\,
      I1 => icmp_ln895_102_reg_5358,
      I2 => \select_ln432_64_reg_5238_reg_n_0_[6]\,
      I3 => icmp_ln895_118_reg_5546,
      I4 => \select_ln450_40_reg_5471_reg_n_0_[6]\,
      O => \res_max_bin_r_t_V_1_reg_5598[6]_i_3_n_0\
    );
\res_max_bin_r_t_V_1_reg_5598[6]_i_5\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8FFB800"
    )
        port map (
      I0 => \select_ln432_22_reg_5138_reg_n_0_[6]\,
      I1 => icmp_ln895_104_reg_5380,
      I2 => \select_ln432_70_reg_5258_reg_n_0_[6]\,
      I3 => icmp_ln895_120_reg_5560,
      I4 => \select_ln450_46_reg_5501_reg_n_0_[6]\,
      O => \res_max_bin_r_t_V_1_reg_5598[6]_i_5_n_0\
    );
\res_max_bin_r_t_V_1_reg_5598[6]_i_6\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8FFB800"
    )
        port map (
      I0 => \select_ln432_10_reg_5098_reg_n_0_[6]\,
      I1 => icmp_ln895_100_reg_5336,
      I2 => \select_ln432_58_reg_5218_reg_n_0_[6]\,
      I3 => icmp_ln895_116_reg_5532,
      I4 => \select_ln450_34_reg_5441_reg_n_0_[6]\,
      O => \res_max_bin_r_t_V_1_reg_5598[6]_i_6_n_0\
    );
\res_max_bin_r_t_V_1_reg_5598_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => res_max_bin_r_t_V_1_fu_4616_p3(0),
      Q => res_max_bin_r_t_V_1_reg_5598(0),
      R => '0'
    );
\res_max_bin_r_t_V_1_reg_5598_reg[0]_i_4\: unisim.vcomponents.MUXF7
     port map (
      I0 => \res_max_bin_r_t_V_1_reg_5598[0]_i_5_n_0\,
      I1 => \res_max_bin_r_t_V_1_reg_5598[0]_i_6_n_0\,
      O => \res_max_bin_r_t_V_1_reg_5598_reg[0]_i_4_n_0\,
      S => \res_max_bin_theta_t_1_reg_5593[2]_i_2_n_0\
    );
\res_max_bin_r_t_V_1_reg_5598_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => res_max_bin_r_t_V_1_fu_4616_p3(1),
      Q => res_max_bin_r_t_V_1_reg_5598(1),
      R => '0'
    );
\res_max_bin_r_t_V_1_reg_5598_reg[1]_i_4\: unisim.vcomponents.MUXF7
     port map (
      I0 => \res_max_bin_r_t_V_1_reg_5598[1]_i_5_n_0\,
      I1 => \res_max_bin_r_t_V_1_reg_5598[1]_i_6_n_0\,
      O => \res_max_bin_r_t_V_1_reg_5598_reg[1]_i_4_n_0\,
      S => \res_max_bin_theta_t_1_reg_5593[2]_i_2_n_0\
    );
\res_max_bin_r_t_V_1_reg_5598_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => res_max_bin_r_t_V_1_fu_4616_p3(2),
      Q => res_max_bin_r_t_V_1_reg_5598(2),
      R => '0'
    );
\res_max_bin_r_t_V_1_reg_5598_reg[2]_i_4\: unisim.vcomponents.MUXF7
     port map (
      I0 => \res_max_bin_r_t_V_1_reg_5598[2]_i_5_n_0\,
      I1 => \res_max_bin_r_t_V_1_reg_5598[2]_i_6_n_0\,
      O => \res_max_bin_r_t_V_1_reg_5598_reg[2]_i_4_n_0\,
      S => \res_max_bin_theta_t_1_reg_5593[2]_i_2_n_0\
    );
\res_max_bin_r_t_V_1_reg_5598_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => res_max_bin_r_t_V_1_fu_4616_p3(3),
      Q => res_max_bin_r_t_V_1_reg_5598(3),
      R => '0'
    );
\res_max_bin_r_t_V_1_reg_5598_reg[3]_i_4\: unisim.vcomponents.MUXF7
     port map (
      I0 => \res_max_bin_r_t_V_1_reg_5598[3]_i_5_n_0\,
      I1 => \res_max_bin_r_t_V_1_reg_5598[3]_i_6_n_0\,
      O => \res_max_bin_r_t_V_1_reg_5598_reg[3]_i_4_n_0\,
      S => \res_max_bin_theta_t_1_reg_5593[2]_i_2_n_0\
    );
\res_max_bin_r_t_V_1_reg_5598_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => res_max_bin_r_t_V_1_fu_4616_p3(4),
      Q => res_max_bin_r_t_V_1_reg_5598(4),
      R => '0'
    );
\res_max_bin_r_t_V_1_reg_5598_reg[4]_i_4\: unisim.vcomponents.MUXF7
     port map (
      I0 => \res_max_bin_r_t_V_1_reg_5598[4]_i_5_n_0\,
      I1 => \res_max_bin_r_t_V_1_reg_5598[4]_i_6_n_0\,
      O => \res_max_bin_r_t_V_1_reg_5598_reg[4]_i_4_n_0\,
      S => \res_max_bin_theta_t_1_reg_5593[2]_i_2_n_0\
    );
\res_max_bin_r_t_V_1_reg_5598_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => res_max_bin_r_t_V_1_fu_4616_p3(5),
      Q => res_max_bin_r_t_V_1_reg_5598(5),
      R => '0'
    );
\res_max_bin_r_t_V_1_reg_5598_reg[5]_i_4\: unisim.vcomponents.MUXF7
     port map (
      I0 => \res_max_bin_r_t_V_1_reg_5598[5]_i_5_n_0\,
      I1 => \res_max_bin_r_t_V_1_reg_5598[5]_i_6_n_0\,
      O => \res_max_bin_r_t_V_1_reg_5598_reg[5]_i_4_n_0\,
      S => \res_max_bin_theta_t_1_reg_5593[2]_i_2_n_0\
    );
\res_max_bin_r_t_V_1_reg_5598_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => res_max_bin_r_t_V_1_fu_4616_p3(6),
      Q => res_max_bin_r_t_V_1_reg_5598(6),
      R => '0'
    );
\res_max_bin_r_t_V_1_reg_5598_reg[6]_i_4\: unisim.vcomponents.MUXF7
     port map (
      I0 => \res_max_bin_r_t_V_1_reg_5598[6]_i_5_n_0\,
      I1 => \res_max_bin_r_t_V_1_reg_5598[6]_i_6_n_0\,
      O => \res_max_bin_r_t_V_1_reg_5598_reg[6]_i_4_n_0\,
      S => \res_max_bin_theta_t_1_reg_5593[2]_i_2_n_0\
    );
\res_max_bin_r_t_V_reg_5582[0]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"BAFB8A08"
    )
        port map (
      I0 => select_ln486_1_fu_4500_p3(0),
      I1 => \res_max_bin_count_t_s_reg_5587[1]_i_4_n_0\,
      I2 => select_ln486_8_fu_4558_p3(3),
      I3 => select_ln486_2_fu_4508_p3(3),
      I4 => select_ln486_7_fu_4550_p3(0),
      O => res_max_bin_r_t_V_fu_4592_p3(0)
    );
\res_max_bin_r_t_V_reg_5582[0]_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8FFB800"
    )
        port map (
      I0 => \select_ln432_13_reg_5108_reg_n_0_[0]\,
      I1 => icmp_ln895_101_reg_5347,
      I2 => \select_ln432_61_reg_5228_reg_n_0_[0]\,
      I3 => icmp_ln895_117_reg_5539,
      I4 => \select_ln450_37_reg_5456_reg_n_0_[0]\,
      O => select_ln468_13_fu_4423_p3(0)
    );
\res_max_bin_r_t_V_reg_5582[0]_i_5\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8FFB800"
    )
        port map (
      I0 => \select_ln432_1_reg_5068_reg_n_0_[0]\,
      I1 => icmp_ln895_97_reg_5303,
      I2 => \select_ln432_49_reg_5188_reg_n_0_[0]\,
      I3 => icmp_ln895_113_reg_5511,
      I4 => \select_ln450_25_reg_5396_reg_n_0_[0]\,
      O => select_ln468_1_fu_4347_p3(0)
    );
\res_max_bin_r_t_V_reg_5582[0]_i_6\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8FFB800"
    )
        port map (
      I0 => \select_ln432_19_reg_5128_reg_n_0_[0]\,
      I1 => icmp_ln895_103_reg_5369,
      I2 => \select_ln432_67_reg_5248_reg_n_0_[0]\,
      I3 => icmp_ln895_119_reg_5553,
      I4 => \select_ln450_43_reg_5486_reg_n_0_[0]\,
      O => select_ln468_19_fu_4461_p3(0)
    );
\res_max_bin_r_t_V_reg_5582[0]_i_7\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8FFB800"
    )
        port map (
      I0 => \select_ln432_7_reg_5088_reg_n_0_[0]\,
      I1 => icmp_ln895_99_reg_5325,
      I2 => \select_ln432_55_reg_5208_reg_n_0_[0]\,
      I3 => icmp_ln895_115_reg_5525,
      I4 => \select_ln450_31_reg_5426_reg_n_0_[0]\,
      O => select_ln468_7_fu_4385_p3(0)
    );
\res_max_bin_r_t_V_reg_5582[1]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"BAFB8A08"
    )
        port map (
      I0 => select_ln486_1_fu_4500_p3(1),
      I1 => \res_max_bin_count_t_s_reg_5587[1]_i_4_n_0\,
      I2 => select_ln486_8_fu_4558_p3(3),
      I3 => select_ln486_2_fu_4508_p3(3),
      I4 => select_ln486_7_fu_4550_p3(1),
      O => res_max_bin_r_t_V_fu_4592_p3(1)
    );
\res_max_bin_r_t_V_reg_5582[1]_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8FFB800"
    )
        port map (
      I0 => \select_ln432_13_reg_5108_reg_n_0_[1]\,
      I1 => icmp_ln895_101_reg_5347,
      I2 => \select_ln432_61_reg_5228_reg_n_0_[1]\,
      I3 => icmp_ln895_117_reg_5539,
      I4 => \select_ln450_37_reg_5456_reg_n_0_[1]\,
      O => select_ln468_13_fu_4423_p3(1)
    );
\res_max_bin_r_t_V_reg_5582[1]_i_5\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8FFB800"
    )
        port map (
      I0 => \select_ln432_1_reg_5068_reg_n_0_[1]\,
      I1 => icmp_ln895_97_reg_5303,
      I2 => \select_ln432_49_reg_5188_reg_n_0_[1]\,
      I3 => icmp_ln895_113_reg_5511,
      I4 => \select_ln450_25_reg_5396_reg_n_0_[1]\,
      O => select_ln468_1_fu_4347_p3(1)
    );
\res_max_bin_r_t_V_reg_5582[1]_i_6\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8FFB800"
    )
        port map (
      I0 => \select_ln432_19_reg_5128_reg_n_0_[1]\,
      I1 => icmp_ln895_103_reg_5369,
      I2 => \select_ln432_67_reg_5248_reg_n_0_[1]\,
      I3 => icmp_ln895_119_reg_5553,
      I4 => \select_ln450_43_reg_5486_reg_n_0_[1]\,
      O => select_ln468_19_fu_4461_p3(1)
    );
\res_max_bin_r_t_V_reg_5582[1]_i_7\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8FFB800"
    )
        port map (
      I0 => \select_ln432_7_reg_5088_reg_n_0_[1]\,
      I1 => icmp_ln895_99_reg_5325,
      I2 => \select_ln432_55_reg_5208_reg_n_0_[1]\,
      I3 => icmp_ln895_115_reg_5525,
      I4 => \select_ln450_31_reg_5426_reg_n_0_[1]\,
      O => select_ln468_7_fu_4385_p3(1)
    );
\res_max_bin_r_t_V_reg_5582[2]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"BAFB8A08"
    )
        port map (
      I0 => select_ln486_1_fu_4500_p3(2),
      I1 => \res_max_bin_count_t_s_reg_5587[1]_i_4_n_0\,
      I2 => select_ln486_8_fu_4558_p3(3),
      I3 => select_ln486_2_fu_4508_p3(3),
      I4 => select_ln486_7_fu_4550_p3(2),
      O => res_max_bin_r_t_V_fu_4592_p3(2)
    );
\res_max_bin_r_t_V_reg_5582[2]_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8FFB800"
    )
        port map (
      I0 => \select_ln432_13_reg_5108_reg_n_0_[2]\,
      I1 => icmp_ln895_101_reg_5347,
      I2 => \select_ln432_61_reg_5228_reg_n_0_[2]\,
      I3 => icmp_ln895_117_reg_5539,
      I4 => \select_ln450_37_reg_5456_reg_n_0_[2]\,
      O => select_ln468_13_fu_4423_p3(2)
    );
\res_max_bin_r_t_V_reg_5582[2]_i_5\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8FFB800"
    )
        port map (
      I0 => \select_ln432_1_reg_5068_reg_n_0_[2]\,
      I1 => icmp_ln895_97_reg_5303,
      I2 => \select_ln432_49_reg_5188_reg_n_0_[2]\,
      I3 => icmp_ln895_113_reg_5511,
      I4 => \select_ln450_25_reg_5396_reg_n_0_[2]\,
      O => select_ln468_1_fu_4347_p3(2)
    );
\res_max_bin_r_t_V_reg_5582[2]_i_6\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8FFB800"
    )
        port map (
      I0 => \select_ln432_19_reg_5128_reg_n_0_[2]\,
      I1 => icmp_ln895_103_reg_5369,
      I2 => \select_ln432_67_reg_5248_reg_n_0_[2]\,
      I3 => icmp_ln895_119_reg_5553,
      I4 => \select_ln450_43_reg_5486_reg_n_0_[2]\,
      O => select_ln468_19_fu_4461_p3(2)
    );
\res_max_bin_r_t_V_reg_5582[2]_i_7\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8FFB800"
    )
        port map (
      I0 => \select_ln432_7_reg_5088_reg_n_0_[2]\,
      I1 => icmp_ln895_99_reg_5325,
      I2 => \select_ln432_55_reg_5208_reg_n_0_[2]\,
      I3 => icmp_ln895_115_reg_5525,
      I4 => \select_ln450_31_reg_5426_reg_n_0_[2]\,
      O => select_ln468_7_fu_4385_p3(2)
    );
\res_max_bin_r_t_V_reg_5582[3]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"BAFB8A08"
    )
        port map (
      I0 => select_ln486_1_fu_4500_p3(3),
      I1 => \res_max_bin_count_t_s_reg_5587[1]_i_4_n_0\,
      I2 => select_ln486_8_fu_4558_p3(3),
      I3 => select_ln486_2_fu_4508_p3(3),
      I4 => select_ln486_7_fu_4550_p3(3),
      O => res_max_bin_r_t_V_fu_4592_p3(3)
    );
\res_max_bin_r_t_V_reg_5582[3]_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8FFB800"
    )
        port map (
      I0 => \select_ln432_13_reg_5108_reg_n_0_[3]\,
      I1 => icmp_ln895_101_reg_5347,
      I2 => \select_ln432_61_reg_5228_reg_n_0_[3]\,
      I3 => icmp_ln895_117_reg_5539,
      I4 => \select_ln450_37_reg_5456_reg_n_0_[3]\,
      O => select_ln468_13_fu_4423_p3(3)
    );
\res_max_bin_r_t_V_reg_5582[3]_i_5\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8FFB800"
    )
        port map (
      I0 => \select_ln432_1_reg_5068_reg_n_0_[3]\,
      I1 => icmp_ln895_97_reg_5303,
      I2 => \select_ln432_49_reg_5188_reg_n_0_[3]\,
      I3 => icmp_ln895_113_reg_5511,
      I4 => \select_ln450_25_reg_5396_reg_n_0_[3]\,
      O => select_ln468_1_fu_4347_p3(3)
    );
\res_max_bin_r_t_V_reg_5582[3]_i_6\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8FFB800"
    )
        port map (
      I0 => \select_ln432_19_reg_5128_reg_n_0_[3]\,
      I1 => icmp_ln895_103_reg_5369,
      I2 => \select_ln432_67_reg_5248_reg_n_0_[3]\,
      I3 => icmp_ln895_119_reg_5553,
      I4 => \select_ln450_43_reg_5486_reg_n_0_[3]\,
      O => select_ln468_19_fu_4461_p3(3)
    );
\res_max_bin_r_t_V_reg_5582[3]_i_7\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8FFB800"
    )
        port map (
      I0 => \select_ln432_7_reg_5088_reg_n_0_[3]\,
      I1 => icmp_ln895_99_reg_5325,
      I2 => \select_ln432_55_reg_5208_reg_n_0_[3]\,
      I3 => icmp_ln895_115_reg_5525,
      I4 => \select_ln450_31_reg_5426_reg_n_0_[3]\,
      O => select_ln468_7_fu_4385_p3(3)
    );
\res_max_bin_r_t_V_reg_5582[4]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"BAFB8A08"
    )
        port map (
      I0 => select_ln486_1_fu_4500_p3(4),
      I1 => \res_max_bin_count_t_s_reg_5587[1]_i_4_n_0\,
      I2 => select_ln486_8_fu_4558_p3(3),
      I3 => select_ln486_2_fu_4508_p3(3),
      I4 => select_ln486_7_fu_4550_p3(4),
      O => res_max_bin_r_t_V_fu_4592_p3(4)
    );
\res_max_bin_r_t_V_reg_5582[4]_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8FFB800"
    )
        port map (
      I0 => \select_ln432_13_reg_5108_reg_n_0_[4]\,
      I1 => icmp_ln895_101_reg_5347,
      I2 => \select_ln432_61_reg_5228_reg_n_0_[4]\,
      I3 => icmp_ln895_117_reg_5539,
      I4 => \select_ln450_37_reg_5456_reg_n_0_[4]\,
      O => select_ln468_13_fu_4423_p3(4)
    );
\res_max_bin_r_t_V_reg_5582[4]_i_5\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8FFB800"
    )
        port map (
      I0 => \select_ln432_1_reg_5068_reg_n_0_[4]\,
      I1 => icmp_ln895_97_reg_5303,
      I2 => \select_ln432_49_reg_5188_reg_n_0_[4]\,
      I3 => icmp_ln895_113_reg_5511,
      I4 => \select_ln450_25_reg_5396_reg_n_0_[4]\,
      O => select_ln468_1_fu_4347_p3(4)
    );
\res_max_bin_r_t_V_reg_5582[4]_i_6\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8FFB800"
    )
        port map (
      I0 => \select_ln432_19_reg_5128_reg_n_0_[4]\,
      I1 => icmp_ln895_103_reg_5369,
      I2 => \select_ln432_67_reg_5248_reg_n_0_[4]\,
      I3 => icmp_ln895_119_reg_5553,
      I4 => \select_ln450_43_reg_5486_reg_n_0_[4]\,
      O => select_ln468_19_fu_4461_p3(4)
    );
\res_max_bin_r_t_V_reg_5582[4]_i_7\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8FFB800"
    )
        port map (
      I0 => \select_ln432_7_reg_5088_reg_n_0_[4]\,
      I1 => icmp_ln895_99_reg_5325,
      I2 => \select_ln432_55_reg_5208_reg_n_0_[4]\,
      I3 => icmp_ln895_115_reg_5525,
      I4 => \select_ln450_31_reg_5426_reg_n_0_[4]\,
      O => select_ln468_7_fu_4385_p3(4)
    );
\res_max_bin_r_t_V_reg_5582[5]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"BAFB8A08"
    )
        port map (
      I0 => select_ln486_1_fu_4500_p3(5),
      I1 => \res_max_bin_count_t_s_reg_5587[1]_i_4_n_0\,
      I2 => select_ln486_8_fu_4558_p3(3),
      I3 => select_ln486_2_fu_4508_p3(3),
      I4 => select_ln486_7_fu_4550_p3(5),
      O => res_max_bin_r_t_V_fu_4592_p3(5)
    );
\res_max_bin_r_t_V_reg_5582[5]_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8FFB800"
    )
        port map (
      I0 => \select_ln432_13_reg_5108_reg_n_0_[5]\,
      I1 => icmp_ln895_101_reg_5347,
      I2 => \select_ln432_61_reg_5228_reg_n_0_[5]\,
      I3 => icmp_ln895_117_reg_5539,
      I4 => \select_ln450_37_reg_5456_reg_n_0_[5]\,
      O => select_ln468_13_fu_4423_p3(5)
    );
\res_max_bin_r_t_V_reg_5582[5]_i_5\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8FFB800"
    )
        port map (
      I0 => \select_ln432_1_reg_5068_reg_n_0_[5]\,
      I1 => icmp_ln895_97_reg_5303,
      I2 => \select_ln432_49_reg_5188_reg_n_0_[5]\,
      I3 => icmp_ln895_113_reg_5511,
      I4 => \select_ln450_25_reg_5396_reg_n_0_[5]\,
      O => select_ln468_1_fu_4347_p3(5)
    );
\res_max_bin_r_t_V_reg_5582[5]_i_6\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8FFB800"
    )
        port map (
      I0 => \select_ln432_19_reg_5128_reg_n_0_[5]\,
      I1 => icmp_ln895_103_reg_5369,
      I2 => \select_ln432_67_reg_5248_reg_n_0_[5]\,
      I3 => icmp_ln895_119_reg_5553,
      I4 => \select_ln450_43_reg_5486_reg_n_0_[5]\,
      O => select_ln468_19_fu_4461_p3(5)
    );
\res_max_bin_r_t_V_reg_5582[5]_i_7\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8FFB800"
    )
        port map (
      I0 => \select_ln432_7_reg_5088_reg_n_0_[5]\,
      I1 => icmp_ln895_99_reg_5325,
      I2 => \select_ln432_55_reg_5208_reg_n_0_[5]\,
      I3 => icmp_ln895_115_reg_5525,
      I4 => \select_ln450_31_reg_5426_reg_n_0_[5]\,
      O => select_ln468_7_fu_4385_p3(5)
    );
\res_max_bin_r_t_V_reg_5582[6]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"BAFB8A08"
    )
        port map (
      I0 => select_ln486_1_fu_4500_p3(6),
      I1 => \res_max_bin_count_t_s_reg_5587[1]_i_4_n_0\,
      I2 => select_ln486_8_fu_4558_p3(3),
      I3 => select_ln486_2_fu_4508_p3(3),
      I4 => select_ln486_7_fu_4550_p3(6),
      O => res_max_bin_r_t_V_fu_4592_p3(6)
    );
\res_max_bin_r_t_V_reg_5582[6]_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8FFB800"
    )
        port map (
      I0 => \select_ln432_13_reg_5108_reg_n_0_[6]\,
      I1 => icmp_ln895_101_reg_5347,
      I2 => \select_ln432_61_reg_5228_reg_n_0_[6]\,
      I3 => icmp_ln895_117_reg_5539,
      I4 => \select_ln450_37_reg_5456_reg_n_0_[6]\,
      O => select_ln468_13_fu_4423_p3(6)
    );
\res_max_bin_r_t_V_reg_5582[6]_i_5\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8FFB800"
    )
        port map (
      I0 => \select_ln432_1_reg_5068_reg_n_0_[6]\,
      I1 => icmp_ln895_97_reg_5303,
      I2 => \select_ln432_49_reg_5188_reg_n_0_[6]\,
      I3 => icmp_ln895_113_reg_5511,
      I4 => \select_ln450_25_reg_5396_reg_n_0_[6]\,
      O => select_ln468_1_fu_4347_p3(6)
    );
\res_max_bin_r_t_V_reg_5582[6]_i_6\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8FFB800"
    )
        port map (
      I0 => \select_ln432_19_reg_5128_reg_n_0_[6]\,
      I1 => icmp_ln895_103_reg_5369,
      I2 => \select_ln432_67_reg_5248_reg_n_0_[6]\,
      I3 => icmp_ln895_119_reg_5553,
      I4 => \select_ln450_43_reg_5486_reg_n_0_[6]\,
      O => select_ln468_19_fu_4461_p3(6)
    );
\res_max_bin_r_t_V_reg_5582[6]_i_7\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8FFB800"
    )
        port map (
      I0 => \select_ln432_7_reg_5088_reg_n_0_[6]\,
      I1 => icmp_ln895_99_reg_5325,
      I2 => \select_ln432_55_reg_5208_reg_n_0_[6]\,
      I3 => icmp_ln895_115_reg_5525,
      I4 => \select_ln450_31_reg_5426_reg_n_0_[6]\,
      O => select_ln468_7_fu_4385_p3(6)
    );
\res_max_bin_r_t_V_reg_5582_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => res_max_bin_r_t_V_fu_4592_p3(0),
      Q => res_max_bin_r_t_V_reg_5582(0),
      R => '0'
    );
\res_max_bin_r_t_V_reg_5582_reg[0]_i_2\: unisim.vcomponents.MUXF7
     port map (
      I0 => select_ln468_13_fu_4423_p3(0),
      I1 => select_ln468_1_fu_4347_p3(0),
      O => select_ln486_1_fu_4500_p3(0),
      S => \select_ln486_reg_5567[6]_i_4_n_0\
    );
\res_max_bin_r_t_V_reg_5582_reg[0]_i_3\: unisim.vcomponents.MUXF7
     port map (
      I0 => select_ln468_19_fu_4461_p3(0),
      I1 => select_ln468_7_fu_4385_p3(0),
      O => select_ln486_7_fu_4550_p3(0),
      S => \select_ln486_6_reg_5572[6]_i_4_n_0\
    );
\res_max_bin_r_t_V_reg_5582_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => res_max_bin_r_t_V_fu_4592_p3(1),
      Q => res_max_bin_r_t_V_reg_5582(1),
      R => '0'
    );
\res_max_bin_r_t_V_reg_5582_reg[1]_i_2\: unisim.vcomponents.MUXF7
     port map (
      I0 => select_ln468_13_fu_4423_p3(1),
      I1 => select_ln468_1_fu_4347_p3(1),
      O => select_ln486_1_fu_4500_p3(1),
      S => \select_ln486_reg_5567[6]_i_4_n_0\
    );
\res_max_bin_r_t_V_reg_5582_reg[1]_i_3\: unisim.vcomponents.MUXF7
     port map (
      I0 => select_ln468_19_fu_4461_p3(1),
      I1 => select_ln468_7_fu_4385_p3(1),
      O => select_ln486_7_fu_4550_p3(1),
      S => \select_ln486_6_reg_5572[6]_i_4_n_0\
    );
\res_max_bin_r_t_V_reg_5582_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => res_max_bin_r_t_V_fu_4592_p3(2),
      Q => res_max_bin_r_t_V_reg_5582(2),
      R => '0'
    );
\res_max_bin_r_t_V_reg_5582_reg[2]_i_2\: unisim.vcomponents.MUXF7
     port map (
      I0 => select_ln468_13_fu_4423_p3(2),
      I1 => select_ln468_1_fu_4347_p3(2),
      O => select_ln486_1_fu_4500_p3(2),
      S => \select_ln486_reg_5567[6]_i_4_n_0\
    );
\res_max_bin_r_t_V_reg_5582_reg[2]_i_3\: unisim.vcomponents.MUXF7
     port map (
      I0 => select_ln468_19_fu_4461_p3(2),
      I1 => select_ln468_7_fu_4385_p3(2),
      O => select_ln486_7_fu_4550_p3(2),
      S => \select_ln486_6_reg_5572[6]_i_4_n_0\
    );
\res_max_bin_r_t_V_reg_5582_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => res_max_bin_r_t_V_fu_4592_p3(3),
      Q => res_max_bin_r_t_V_reg_5582(3),
      R => '0'
    );
\res_max_bin_r_t_V_reg_5582_reg[3]_i_2\: unisim.vcomponents.MUXF7
     port map (
      I0 => select_ln468_13_fu_4423_p3(3),
      I1 => select_ln468_1_fu_4347_p3(3),
      O => select_ln486_1_fu_4500_p3(3),
      S => \select_ln486_reg_5567[6]_i_4_n_0\
    );
\res_max_bin_r_t_V_reg_5582_reg[3]_i_3\: unisim.vcomponents.MUXF7
     port map (
      I0 => select_ln468_19_fu_4461_p3(3),
      I1 => select_ln468_7_fu_4385_p3(3),
      O => select_ln486_7_fu_4550_p3(3),
      S => \select_ln486_6_reg_5572[6]_i_4_n_0\
    );
\res_max_bin_r_t_V_reg_5582_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => res_max_bin_r_t_V_fu_4592_p3(4),
      Q => res_max_bin_r_t_V_reg_5582(4),
      R => '0'
    );
\res_max_bin_r_t_V_reg_5582_reg[4]_i_2\: unisim.vcomponents.MUXF7
     port map (
      I0 => select_ln468_13_fu_4423_p3(4),
      I1 => select_ln468_1_fu_4347_p3(4),
      O => select_ln486_1_fu_4500_p3(4),
      S => \select_ln486_reg_5567[6]_i_4_n_0\
    );
\res_max_bin_r_t_V_reg_5582_reg[4]_i_3\: unisim.vcomponents.MUXF7
     port map (
      I0 => select_ln468_19_fu_4461_p3(4),
      I1 => select_ln468_7_fu_4385_p3(4),
      O => select_ln486_7_fu_4550_p3(4),
      S => \select_ln486_6_reg_5572[6]_i_4_n_0\
    );
\res_max_bin_r_t_V_reg_5582_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => res_max_bin_r_t_V_fu_4592_p3(5),
      Q => res_max_bin_r_t_V_reg_5582(5),
      R => '0'
    );
\res_max_bin_r_t_V_reg_5582_reg[5]_i_2\: unisim.vcomponents.MUXF7
     port map (
      I0 => select_ln468_13_fu_4423_p3(5),
      I1 => select_ln468_1_fu_4347_p3(5),
      O => select_ln486_1_fu_4500_p3(5),
      S => \select_ln486_reg_5567[6]_i_4_n_0\
    );
\res_max_bin_r_t_V_reg_5582_reg[5]_i_3\: unisim.vcomponents.MUXF7
     port map (
      I0 => select_ln468_19_fu_4461_p3(5),
      I1 => select_ln468_7_fu_4385_p3(5),
      O => select_ln486_7_fu_4550_p3(5),
      S => \select_ln486_6_reg_5572[6]_i_4_n_0\
    );
\res_max_bin_r_t_V_reg_5582_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => res_max_bin_r_t_V_fu_4592_p3(6),
      Q => res_max_bin_r_t_V_reg_5582(6),
      R => '0'
    );
\res_max_bin_r_t_V_reg_5582_reg[6]_i_2\: unisim.vcomponents.MUXF7
     port map (
      I0 => select_ln468_13_fu_4423_p3(6),
      I1 => select_ln468_1_fu_4347_p3(6),
      O => select_ln486_1_fu_4500_p3(6),
      S => \select_ln486_reg_5567[6]_i_4_n_0\
    );
\res_max_bin_r_t_V_reg_5582_reg[6]_i_3\: unisim.vcomponents.MUXF7
     port map (
      I0 => select_ln468_19_fu_4461_p3(6),
      I1 => select_ln468_7_fu_4385_p3(6),
      O => select_ln486_7_fu_4550_p3(6),
      S => \select_ln486_6_reg_5572[6]_i_4_n_0\
    );
\res_max_bin_theta_t_1_reg_5593[1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"47"
    )
        port map (
      I0 => \res_max_bin_theta_t_1_reg_5593[6]_i_3_n_0\,
      I1 => \res_max_bin_theta_t_1_reg_5593[6]_i_4_n_0\,
      I2 => \res_max_bin_theta_t_1_reg_5593[6]_i_6_n_0\,
      O => res_max_bin_theta_t_1_fu_4608_p3(1)
    );
\res_max_bin_theta_t_1_reg_5593[2]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0C5F"
    )
        port map (
      I0 => \res_max_bin_theta_t_1_reg_5593[6]_i_3_n_0\,
      I1 => \res_max_bin_theta_t_1_reg_5593[6]_i_6_n_0\,
      I2 => \res_max_bin_theta_t_1_reg_5593[6]_i_4_n_0\,
      I3 => \res_max_bin_theta_t_1_reg_5593[2]_i_2_n_0\,
      O => res_max_bin_theta_t_1_fu_4608_p3(2)
    );
\res_max_bin_theta_t_1_reg_5593[2]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"4D444D444D44DD4D"
    )
        port map (
      I0 => \res_max_bin_theta_t_1_reg_5593[2]_i_3_n_0\,
      I1 => \res_max_bin_theta_t_1_reg_5593[2]_i_4_n_0\,
      I2 => \res_max_bin_theta_t_1_reg_5593[2]_i_5_n_0\,
      I3 => \res_max_bin_theta_t_1_reg_5593[2]_i_6_n_0\,
      I4 => \res_max_bin_theta_t_1_reg_5593[2]_i_7_n_0\,
      I5 => \res_max_bin_theta_t_1_reg_5593[2]_i_8_n_0\,
      O => \res_max_bin_theta_t_1_reg_5593[2]_i_2_n_0\
    );
\res_max_bin_theta_t_1_reg_5593[2]_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => select_ln450_23_reg_5386(3),
      I1 => icmp_ln895_120_reg_5560,
      I2 => select_ln450_47_reg_5506(3),
      O => \res_max_bin_theta_t_1_reg_5593[2]_i_3_n_0\
    );
\res_max_bin_theta_t_1_reg_5593[2]_i_4\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => select_ln450_11_reg_5342(3),
      I1 => icmp_ln895_116_reg_5532,
      I2 => select_ln450_35_reg_5446(3),
      O => \res_max_bin_theta_t_1_reg_5593[2]_i_4_n_0\
    );
\res_max_bin_theta_t_1_reg_5593[2]_i_5\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => select_ln450_23_reg_5386(2),
      I1 => icmp_ln895_120_reg_5560,
      I2 => select_ln450_47_reg_5506(2),
      O => \res_max_bin_theta_t_1_reg_5593[2]_i_5_n_0\
    );
\res_max_bin_theta_t_1_reg_5593[2]_i_6\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => select_ln450_11_reg_5342(2),
      I1 => icmp_ln895_116_reg_5532,
      I2 => select_ln450_35_reg_5446(2),
      O => \res_max_bin_theta_t_1_reg_5593[2]_i_6_n_0\
    );
\res_max_bin_theta_t_1_reg_5593[2]_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"D0DDD0D0D0DDDDDD"
    )
        port map (
      I0 => \res_max_bin_theta_t_1_reg_5593[2]_i_9_n_0\,
      I1 => \res_max_bin_count_t_1_reg_5603[1]_i_5_n_0\,
      I2 => \res_max_bin_count_t_1_reg_5603[0]_i_5_n_0\,
      I3 => select_ln450_11_reg_5342(0),
      I4 => icmp_ln895_116_reg_5532,
      I5 => select_ln450_35_reg_5446(0),
      O => \res_max_bin_theta_t_1_reg_5593[2]_i_7_n_0\
    );
\res_max_bin_theta_t_1_reg_5593[2]_i_8\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"000000E2E2E200E2"
    )
        port map (
      I0 => select_ln450_47_reg_5506(1),
      I1 => icmp_ln895_120_reg_5560,
      I2 => select_ln450_23_reg_5386(1),
      I3 => select_ln450_35_reg_5446(1),
      I4 => icmp_ln895_116_reg_5532,
      I5 => select_ln450_11_reg_5342(1),
      O => \res_max_bin_theta_t_1_reg_5593[2]_i_8_n_0\
    );
\res_max_bin_theta_t_1_reg_5593[2]_i_9\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => select_ln450_11_reg_5342(1),
      I1 => icmp_ln895_116_reg_5532,
      I2 => select_ln450_35_reg_5446(1),
      O => \res_max_bin_theta_t_1_reg_5593[2]_i_9_n_0\
    );
\res_max_bin_theta_t_1_reg_5593[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"707F7F7F404F4040"
    )
        port map (
      I0 => icmp_ln895_114_reg_5518,
      I1 => \res_max_bin_theta_t_1_reg_5593[6]_i_3_n_0\,
      I2 => \res_max_bin_theta_t_1_reg_5593[6]_i_4_n_0\,
      I3 => icmp_ln895_118_reg_5546,
      I4 => \res_max_bin_theta_t_1_reg_5593[6]_i_6_n_0\,
      I5 => \res_max_bin_theta_t_1_reg_5593[3]_i_2_n_0\,
      O => res_max_bin_theta_t_1_fu_4608_p3(3)
    );
\res_max_bin_theta_t_1_reg_5593[3]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"47"
    )
        port map (
      I0 => icmp_ln895_116_reg_5532,
      I1 => \res_max_bin_theta_t_1_reg_5593[2]_i_2_n_0\,
      I2 => icmp_ln895_120_reg_5560,
      O => \res_max_bin_theta_t_1_reg_5593[3]_i_2_n_0\
    );
\res_max_bin_theta_t_1_reg_5593[4]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BFB0BFBF8F808080"
    )
        port map (
      I0 => \res_max_bin_theta_t_1_reg_5593[4]_i_2_n_0\,
      I1 => \res_max_bin_theta_t_1_reg_5593[6]_i_3_n_0\,
      I2 => \res_max_bin_theta_t_1_reg_5593[6]_i_4_n_0\,
      I3 => \res_max_bin_theta_t_1_reg_5593[4]_i_3_n_0\,
      I4 => \res_max_bin_theta_t_1_reg_5593[6]_i_6_n_0\,
      I5 => \res_max_bin_theta_t_1_reg_5593[4]_i_4_n_0\,
      O => res_max_bin_theta_t_1_fu_4608_p3(4)
    );
\res_max_bin_theta_t_1_reg_5593[4]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"35"
    )
        port map (
      I0 => icmp_ln895_106_reg_5406,
      I1 => icmp_ln895_98_reg_5314,
      I2 => icmp_ln895_114_reg_5518,
      O => \res_max_bin_theta_t_1_reg_5593[4]_i_2_n_0\
    );
\res_max_bin_theta_t_1_reg_5593[4]_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"35"
    )
        port map (
      I0 => icmp_ln895_110_reg_5466,
      I1 => icmp_ln895_102_reg_5358,
      I2 => icmp_ln895_118_reg_5546,
      O => \res_max_bin_theta_t_1_reg_5593[4]_i_3_n_0\
    );
\res_max_bin_theta_t_1_reg_5593[4]_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"35FF3500"
    )
        port map (
      I0 => icmp_ln895_108_reg_5436,
      I1 => icmp_ln895_100_reg_5336,
      I2 => icmp_ln895_116_reg_5532,
      I3 => \res_max_bin_theta_t_1_reg_5593[2]_i_2_n_0\,
      I4 => \res_max_bin_theta_t_1_reg_5593[4]_i_5_n_0\,
      O => \res_max_bin_theta_t_1_reg_5593[4]_i_4_n_0\
    );
\res_max_bin_theta_t_1_reg_5593[4]_i_5\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"35"
    )
        port map (
      I0 => icmp_ln895_112_reg_5496,
      I1 => icmp_ln895_104_reg_5380,
      I2 => icmp_ln895_120_reg_5560,
      O => \res_max_bin_theta_t_1_reg_5593[4]_i_5_n_0\
    );
\res_max_bin_theta_t_1_reg_5593[5]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BFB0BFBF8F808080"
    )
        port map (
      I0 => \res_max_bin_theta_t_1_reg_5593[5]_i_2_n_0\,
      I1 => \res_max_bin_theta_t_1_reg_5593[6]_i_3_n_0\,
      I2 => \res_max_bin_theta_t_1_reg_5593[6]_i_4_n_0\,
      I3 => \res_max_bin_theta_t_1_reg_5593[5]_i_3_n_0\,
      I4 => \res_max_bin_theta_t_1_reg_5593[6]_i_6_n_0\,
      I5 => \res_max_bin_theta_t_1_reg_5593_reg[5]_i_4_n_0\,
      O => res_max_bin_theta_t_1_fu_4608_p3(5)
    );
\res_max_bin_theta_t_1_reg_5593[5]_i_10\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0151"
    )
        port map (
      I0 => icmp_ln895_116_reg_5532,
      I1 => icmp_ln895_92_reg_5278,
      I2 => icmp_ln895_108_reg_5436,
      I3 => icmp_ln895_76_reg_5158,
      O => \res_max_bin_theta_t_1_reg_5593[5]_i_10_n_0\
    );
\res_max_bin_theta_t_1_reg_5593[5]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFF4700"
    )
        port map (
      I0 => icmp_ln895_66_reg_5073,
      I1 => icmp_ln895_98_reg_5314,
      I2 => icmp_ln895_82_reg_5193,
      I3 => icmp_ln895_114_reg_5518,
      I4 => \res_max_bin_theta_t_1_reg_5593[5]_i_5_n_0\,
      O => \res_max_bin_theta_t_1_reg_5593[5]_i_2_n_0\
    );
\res_max_bin_theta_t_1_reg_5593[5]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFF4700"
    )
        port map (
      I0 => icmp_ln895_70_reg_5113,
      I1 => icmp_ln895_102_reg_5358,
      I2 => icmp_ln895_86_reg_5233,
      I3 => icmp_ln895_118_reg_5546,
      I4 => \res_max_bin_theta_t_1_reg_5593[5]_i_6_n_0\,
      O => \res_max_bin_theta_t_1_reg_5593[5]_i_3_n_0\
    );
\res_max_bin_theta_t_1_reg_5593[5]_i_5\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0151"
    )
        port map (
      I0 => icmp_ln895_114_reg_5518,
      I1 => icmp_ln895_90_reg_5268,
      I2 => icmp_ln895_106_reg_5406,
      I3 => icmp_ln895_74_reg_5148,
      O => \res_max_bin_theta_t_1_reg_5593[5]_i_5_n_0\
    );
\res_max_bin_theta_t_1_reg_5593[5]_i_6\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0151"
    )
        port map (
      I0 => icmp_ln895_118_reg_5546,
      I1 => icmp_ln895_94_reg_5288,
      I2 => icmp_ln895_110_reg_5466,
      I3 => icmp_ln895_78_reg_5168,
      O => \res_max_bin_theta_t_1_reg_5593[5]_i_6_n_0\
    );
\res_max_bin_theta_t_1_reg_5593[5]_i_7\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFF4700"
    )
        port map (
      I0 => icmp_ln895_72_reg_5133,
      I1 => icmp_ln895_104_reg_5380,
      I2 => icmp_ln895_88_reg_5253,
      I3 => icmp_ln895_120_reg_5560,
      I4 => \res_max_bin_theta_t_1_reg_5593[5]_i_9_n_0\,
      O => \res_max_bin_theta_t_1_reg_5593[5]_i_7_n_0\
    );
\res_max_bin_theta_t_1_reg_5593[5]_i_8\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFF4700"
    )
        port map (
      I0 => icmp_ln895_68_reg_5093,
      I1 => icmp_ln895_100_reg_5336,
      I2 => icmp_ln895_84_reg_5213,
      I3 => icmp_ln895_116_reg_5532,
      I4 => \res_max_bin_theta_t_1_reg_5593[5]_i_10_n_0\,
      O => \res_max_bin_theta_t_1_reg_5593[5]_i_8_n_0\
    );
\res_max_bin_theta_t_1_reg_5593[5]_i_9\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0151"
    )
        port map (
      I0 => icmp_ln895_120_reg_5560,
      I1 => icmp_ln895_96_reg_5298,
      I2 => icmp_ln895_112_reg_5496,
      I3 => icmp_ln895_80_reg_5178,
      O => \res_max_bin_theta_t_1_reg_5593[5]_i_9_n_0\
    );
\res_max_bin_theta_t_1_reg_5593[6]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BFB0BFBF8F808080"
    )
        port map (
      I0 => \res_max_bin_theta_t_1_reg_5593_reg[6]_i_2_n_0\,
      I1 => \res_max_bin_theta_t_1_reg_5593[6]_i_3_n_0\,
      I2 => \res_max_bin_theta_t_1_reg_5593[6]_i_4_n_0\,
      I3 => \res_max_bin_theta_t_1_reg_5593_reg[6]_i_5_n_0\,
      I4 => \res_max_bin_theta_t_1_reg_5593[6]_i_6_n_0\,
      I5 => \res_max_bin_theta_t_1_reg_5593[6]_i_7_n_0\,
      O => res_max_bin_theta_t_1_fu_4608_p3(6)
    );
\res_max_bin_theta_t_1_reg_5593[6]_i_10\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"001D"
    )
        port map (
      I0 => select_ln450_29_reg_5416(3),
      I1 => icmp_ln895_114_reg_5518,
      I2 => select_ln450_5_reg_5320(3),
      I3 => \res_max_bin_count_t_1_reg_5603[3]_i_3_n_0\,
      O => \res_max_bin_theta_t_1_reg_5593[6]_i_10_n_0\
    );
\res_max_bin_theta_t_1_reg_5593[6]_i_11\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8F888FFF88888888"
    )
        port map (
      I0 => \res_max_bin_count_t_1_reg_5603[3]_i_3_n_0\,
      I1 => \res_max_bin_theta_t_1_reg_5593[6]_i_14_n_0\,
      I2 => \res_max_bin_theta_t_1_reg_5593[2]_i_6_n_0\,
      I3 => \res_max_bin_theta_t_1_reg_5593[2]_i_2_n_0\,
      I4 => \res_max_bin_theta_t_1_reg_5593[2]_i_5_n_0\,
      I5 => \res_max_bin_count_t_1_reg_5603[2]_i_2_n_0\,
      O => \res_max_bin_theta_t_1_reg_5593[6]_i_11_n_0\
    );
\res_max_bin_theta_t_1_reg_5593[6]_i_12\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"020202A2A2A202A2"
    )
        port map (
      I0 => \res_max_bin_count_t_1_reg_5603[0]_i_2_n_0\,
      I1 => \res_max_bin_count_t_1_reg_5603[0]_i_5_n_0\,
      I2 => \res_max_bin_theta_t_1_reg_5593[2]_i_2_n_0\,
      I3 => select_ln450_35_reg_5446(0),
      I4 => icmp_ln895_116_reg_5532,
      I5 => select_ln450_11_reg_5342(0),
      O => \res_max_bin_theta_t_1_reg_5593[6]_i_12_n_0\
    );
\res_max_bin_theta_t_1_reg_5593[6]_i_13\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000EEE222E2"
    )
        port map (
      I0 => \res_max_bin_theta_t_1_reg_5593[2]_i_5_n_0\,
      I1 => \res_max_bin_theta_t_1_reg_5593[2]_i_2_n_0\,
      I2 => select_ln450_35_reg_5446(2),
      I3 => icmp_ln895_116_reg_5532,
      I4 => select_ln450_11_reg_5342(2),
      I5 => \res_max_bin_count_t_1_reg_5603[2]_i_2_n_0\,
      O => \res_max_bin_theta_t_1_reg_5593[6]_i_13_n_0\
    );
\res_max_bin_theta_t_1_reg_5593[6]_i_14\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => select_ln450_5_reg_5320(3),
      I1 => icmp_ln895_114_reg_5518,
      I2 => select_ln450_29_reg_5416(3),
      O => \res_max_bin_theta_t_1_reg_5593[6]_i_14_n_0\
    );
\res_max_bin_theta_t_1_reg_5593[6]_i_15\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"E2FFFFFF0000E2FF"
    )
        port map (
      I0 => select_ln450_41_reg_5476(0),
      I1 => icmp_ln895_118_reg_5546,
      I2 => select_ln450_17_reg_5364(0),
      I3 => \res_max_bin_count_t_1_reg_5603[0]_i_2_n_0\,
      I4 => \res_max_bin_count_t_1_reg_5603[1]_i_2_n_0\,
      I5 => \res_max_bin_count_t_1_reg_5603[1]_i_3_n_0\,
      O => \res_max_bin_theta_t_1_reg_5593[6]_i_15_n_0\
    );
\res_max_bin_theta_t_1_reg_5593[6]_i_16\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8FFB800"
    )
        port map (
      I0 => icmp_ln895_13_reg_4808,
      I1 => icmp_ln895_78_reg_5168,
      I2 => icmp_ln895_45_reg_4968,
      I3 => icmp_ln895_110_reg_5466,
      I4 => \res_max_bin_theta_t_1_reg_5593[6]_i_27_n_0\,
      O => \res_max_bin_theta_t_1_reg_5593[6]_i_16_n_0\
    );
\res_max_bin_theta_t_1_reg_5593[6]_i_17\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8FFB800"
    )
        port map (
      I0 => icmp_ln895_6_reg_4768,
      I1 => icmp_ln895_70_reg_5113,
      I2 => icmp_ln895_37_reg_4928,
      I3 => icmp_ln895_102_reg_5358,
      I4 => \res_max_bin_theta_t_1_reg_5593[6]_i_28_n_0\,
      O => \res_max_bin_theta_t_1_reg_5593[6]_i_17_n_0\
    );
\res_max_bin_theta_t_1_reg_5593[6]_i_18\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"001D"
    )
        port map (
      I0 => select_ln450_41_reg_5476(3),
      I1 => icmp_ln895_118_reg_5546,
      I2 => select_ln450_17_reg_5364(3),
      I3 => \res_max_bin_count_t_1_reg_5603[3]_i_3_n_0\,
      O => \res_max_bin_theta_t_1_reg_5593[6]_i_18_n_0\
    );
\res_max_bin_theta_t_1_reg_5593[6]_i_19\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8F888FFF88888888"
    )
        port map (
      I0 => \res_max_bin_count_t_1_reg_5603[3]_i_3_n_0\,
      I1 => \res_max_bin_count_t_1_reg_5603[3]_i_2_n_0\,
      I2 => \res_max_bin_theta_t_1_reg_5593[2]_i_6_n_0\,
      I3 => \res_max_bin_theta_t_1_reg_5593[2]_i_2_n_0\,
      I4 => \res_max_bin_theta_t_1_reg_5593[2]_i_5_n_0\,
      I5 => \res_max_bin_count_t_1_reg_5603[2]_i_3_n_0\,
      O => \res_max_bin_theta_t_1_reg_5593[6]_i_19_n_0\
    );
\res_max_bin_theta_t_1_reg_5593[6]_i_20\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"020202A2A2A202A2"
    )
        port map (
      I0 => \res_max_bin_count_t_1_reg_5603[0]_i_3_n_0\,
      I1 => \res_max_bin_count_t_1_reg_5603[0]_i_5_n_0\,
      I2 => \res_max_bin_theta_t_1_reg_5593[2]_i_2_n_0\,
      I3 => select_ln450_35_reg_5446(0),
      I4 => icmp_ln895_116_reg_5532,
      I5 => select_ln450_11_reg_5342(0),
      O => \res_max_bin_theta_t_1_reg_5593[6]_i_20_n_0\
    );
\res_max_bin_theta_t_1_reg_5593[6]_i_21\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000EEE222E2"
    )
        port map (
      I0 => \res_max_bin_theta_t_1_reg_5593[2]_i_5_n_0\,
      I1 => \res_max_bin_theta_t_1_reg_5593[2]_i_2_n_0\,
      I2 => select_ln450_35_reg_5446(2),
      I3 => icmp_ln895_116_reg_5532,
      I4 => select_ln450_11_reg_5342(2),
      I5 => \res_max_bin_count_t_1_reg_5603[2]_i_3_n_0\,
      O => \res_max_bin_theta_t_1_reg_5593[6]_i_21_n_0\
    );
\res_max_bin_theta_t_1_reg_5593[6]_i_22\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8FFB800"
    )
        port map (
      I0 => icmp_ln895_3_reg_4758,
      I1 => icmp_ln895_68_reg_5093,
      I2 => icmp_ln895_35_reg_4918,
      I3 => icmp_ln895_100_reg_5336,
      I4 => \res_max_bin_theta_t_1_reg_5593[6]_i_29_n_0\,
      O => \res_max_bin_theta_t_1_reg_5593[6]_i_22_n_0\
    );
\res_max_bin_theta_t_1_reg_5593[6]_i_23\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8FFB800"
    )
        port map (
      I0 => icmp_ln895_11_reg_4798,
      I1 => icmp_ln895_76_reg_5158,
      I2 => icmp_ln895_43_reg_4958,
      I3 => icmp_ln895_108_reg_5436,
      I4 => \res_max_bin_theta_t_1_reg_5593[6]_i_30_n_0\,
      O => \res_max_bin_theta_t_1_reg_5593[6]_i_23_n_0\
    );
\res_max_bin_theta_t_1_reg_5593[6]_i_25\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => icmp_ln895_25_reg_4868,
      I1 => icmp_ln895_90_reg_5268,
      I2 => icmp_ln895_57_reg_5028,
      O => \res_max_bin_theta_t_1_reg_5593[6]_i_25_n_0\
    );
\res_max_bin_theta_t_1_reg_5593[6]_i_26\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => icmp_ln895_17_reg_4828,
      I1 => icmp_ln895_82_reg_5193,
      I2 => icmp_ln895_49_reg_4988,
      O => \res_max_bin_theta_t_1_reg_5593[6]_i_26_n_0\
    );
\res_max_bin_theta_t_1_reg_5593[6]_i_27\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => icmp_ln895_29_reg_4888,
      I1 => icmp_ln895_94_reg_5288,
      I2 => icmp_ln895_61_reg_5048,
      O => \res_max_bin_theta_t_1_reg_5593[6]_i_27_n_0\
    );
\res_max_bin_theta_t_1_reg_5593[6]_i_28\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => icmp_ln895_21_reg_4848,
      I1 => icmp_ln895_86_reg_5233,
      I2 => icmp_ln895_53_reg_5008,
      O => \res_max_bin_theta_t_1_reg_5593[6]_i_28_n_0\
    );
\res_max_bin_theta_t_1_reg_5593[6]_i_29\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => icmp_ln895_19_reg_4838,
      I1 => icmp_ln895_84_reg_5213,
      I2 => icmp_ln895_51_reg_4998,
      O => \res_max_bin_theta_t_1_reg_5593[6]_i_29_n_0\
    );
\res_max_bin_theta_t_1_reg_5593[6]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"4444444454554454"
    )
        port map (
      I0 => \res_max_bin_theta_t_1_reg_5593[6]_i_10_n_0\,
      I1 => \res_max_bin_theta_t_1_reg_5593[6]_i_11_n_0\,
      I2 => \res_max_bin_theta_t_1_reg_5593[6]_i_12_n_0\,
      I3 => \res_max_bin_count_t_1_reg_5603[1]_i_4_n_0\,
      I4 => \res_max_bin_count_t_1_reg_5603[1]_i_2_n_0\,
      I5 => \res_max_bin_theta_t_1_reg_5593[6]_i_13_n_0\,
      O => \res_max_bin_theta_t_1_reg_5593[6]_i_3_n_0\
    );
\res_max_bin_theta_t_1_reg_5593[6]_i_30\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => icmp_ln895_27_reg_4878,
      I1 => icmp_ln895_92_reg_5278,
      I2 => icmp_ln895_59_reg_5038,
      O => \res_max_bin_theta_t_1_reg_5593[6]_i_30_n_0\
    );
\res_max_bin_theta_t_1_reg_5593[6]_i_31\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8FFB800"
    )
        port map (
      I0 => icmp_ln895_15_reg_4818,
      I1 => icmp_ln895_80_reg_5178,
      I2 => icmp_ln895_47_reg_4978,
      I3 => icmp_ln895_112_reg_5496,
      I4 => \res_max_bin_theta_t_1_reg_5593[6]_i_33_n_0\,
      O => \res_max_bin_theta_t_1_reg_5593[6]_i_31_n_0\
    );
\res_max_bin_theta_t_1_reg_5593[6]_i_32\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8FFB800"
    )
        port map (
      I0 => icmp_ln895_7_reg_4778,
      I1 => icmp_ln895_72_reg_5133,
      I2 => icmp_ln895_39_reg_4938,
      I3 => icmp_ln895_104_reg_5380,
      I4 => \res_max_bin_theta_t_1_reg_5593[6]_i_34_n_0\,
      O => \res_max_bin_theta_t_1_reg_5593[6]_i_32_n_0\
    );
\res_max_bin_theta_t_1_reg_5593[6]_i_33\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => icmp_ln895_31_reg_4898,
      I1 => icmp_ln895_96_reg_5298,
      I2 => icmp_ln895_63_reg_5058,
      O => \res_max_bin_theta_t_1_reg_5593[6]_i_33_n_0\
    );
\res_max_bin_theta_t_1_reg_5593[6]_i_34\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => icmp_ln895_23_reg_4858,
      I1 => icmp_ln895_88_reg_5253,
      I2 => icmp_ln895_55_reg_5018,
      O => \res_max_bin_theta_t_1_reg_5593[6]_i_34_n_0\
    );
\res_max_bin_theta_t_1_reg_5593[6]_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"4D44DD4D"
    )
        port map (
      I0 => \res_max_bin_count_t_1_reg_5603[3]_i_2_n_0\,
      I1 => \res_max_bin_theta_t_1_reg_5593[6]_i_14_n_0\,
      I2 => \res_max_bin_count_t_1_reg_5603[2]_i_3_n_0\,
      I3 => \res_max_bin_count_t_1_reg_5603[2]_i_2_n_0\,
      I4 => \res_max_bin_theta_t_1_reg_5593[6]_i_15_n_0\,
      O => \res_max_bin_theta_t_1_reg_5593[6]_i_4_n_0\
    );
\res_max_bin_theta_t_1_reg_5593[6]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"4444444454554454"
    )
        port map (
      I0 => \res_max_bin_theta_t_1_reg_5593[6]_i_18_n_0\,
      I1 => \res_max_bin_theta_t_1_reg_5593[6]_i_19_n_0\,
      I2 => \res_max_bin_theta_t_1_reg_5593[6]_i_20_n_0\,
      I3 => \res_max_bin_count_t_1_reg_5603[1]_i_4_n_0\,
      I4 => \res_max_bin_count_t_1_reg_5603[1]_i_3_n_0\,
      I5 => \res_max_bin_theta_t_1_reg_5593[6]_i_21_n_0\,
      O => \res_max_bin_theta_t_1_reg_5593[6]_i_6_n_0\
    );
\res_max_bin_theta_t_1_reg_5593[6]_i_7\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8FFB800"
    )
        port map (
      I0 => \res_max_bin_theta_t_1_reg_5593[6]_i_22_n_0\,
      I1 => icmp_ln895_116_reg_5532,
      I2 => \res_max_bin_theta_t_1_reg_5593[6]_i_23_n_0\,
      I3 => \res_max_bin_theta_t_1_reg_5593[2]_i_2_n_0\,
      I4 => \res_max_bin_theta_t_1_reg_5593_reg[6]_i_24_n_0\,
      O => \res_max_bin_theta_t_1_reg_5593[6]_i_7_n_0\
    );
\res_max_bin_theta_t_1_reg_5593[6]_i_8\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8FFB800"
    )
        port map (
      I0 => icmp_ln895_9_reg_4788,
      I1 => icmp_ln895_74_reg_5148,
      I2 => icmp_ln895_41_reg_4948,
      I3 => icmp_ln895_106_reg_5406,
      I4 => \res_max_bin_theta_t_1_reg_5593[6]_i_25_n_0\,
      O => \res_max_bin_theta_t_1_reg_5593[6]_i_8_n_0\
    );
\res_max_bin_theta_t_1_reg_5593[6]_i_9\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8FFB800"
    )
        port map (
      I0 => icmp_ln895_1_reg_4748,
      I1 => icmp_ln895_66_reg_5073,
      I2 => icmp_ln895_33_reg_4908,
      I3 => icmp_ln895_98_reg_5314,
      I4 => \res_max_bin_theta_t_1_reg_5593[6]_i_26_n_0\,
      O => \res_max_bin_theta_t_1_reg_5593[6]_i_9_n_0\
    );
\res_max_bin_theta_t_1_reg_5593_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => res_max_bin_theta_t_1_fu_4608_p3(1),
      Q => res_max_bin_theta_t_1_reg_5593(1),
      R => '0'
    );
\res_max_bin_theta_t_1_reg_5593_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => res_max_bin_theta_t_1_fu_4608_p3(2),
      Q => res_max_bin_theta_t_1_reg_5593(2),
      R => '0'
    );
\res_max_bin_theta_t_1_reg_5593_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => res_max_bin_theta_t_1_fu_4608_p3(3),
      Q => res_max_bin_theta_t_1_reg_5593(3),
      R => '0'
    );
\res_max_bin_theta_t_1_reg_5593_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => res_max_bin_theta_t_1_fu_4608_p3(4),
      Q => res_max_bin_theta_t_1_reg_5593(4),
      R => '0'
    );
\res_max_bin_theta_t_1_reg_5593_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => res_max_bin_theta_t_1_fu_4608_p3(5),
      Q => res_max_bin_theta_t_1_reg_5593(5),
      R => '0'
    );
\res_max_bin_theta_t_1_reg_5593_reg[5]_i_4\: unisim.vcomponents.MUXF7
     port map (
      I0 => \res_max_bin_theta_t_1_reg_5593[5]_i_7_n_0\,
      I1 => \res_max_bin_theta_t_1_reg_5593[5]_i_8_n_0\,
      O => \res_max_bin_theta_t_1_reg_5593_reg[5]_i_4_n_0\,
      S => \res_max_bin_theta_t_1_reg_5593[2]_i_2_n_0\
    );
\res_max_bin_theta_t_1_reg_5593_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => res_max_bin_theta_t_1_fu_4608_p3(6),
      Q => res_max_bin_theta_t_1_reg_5593(6),
      R => '0'
    );
\res_max_bin_theta_t_1_reg_5593_reg[6]_i_2\: unisim.vcomponents.MUXF7
     port map (
      I0 => \res_max_bin_theta_t_1_reg_5593[6]_i_8_n_0\,
      I1 => \res_max_bin_theta_t_1_reg_5593[6]_i_9_n_0\,
      O => \res_max_bin_theta_t_1_reg_5593_reg[6]_i_2_n_0\,
      S => icmp_ln895_114_reg_5518
    );
\res_max_bin_theta_t_1_reg_5593_reg[6]_i_24\: unisim.vcomponents.MUXF7
     port map (
      I0 => \res_max_bin_theta_t_1_reg_5593[6]_i_31_n_0\,
      I1 => \res_max_bin_theta_t_1_reg_5593[6]_i_32_n_0\,
      O => \res_max_bin_theta_t_1_reg_5593_reg[6]_i_24_n_0\,
      S => icmp_ln895_120_reg_5560
    );
\res_max_bin_theta_t_1_reg_5593_reg[6]_i_5\: unisim.vcomponents.MUXF7
     port map (
      I0 => \res_max_bin_theta_t_1_reg_5593[6]_i_16_n_0\,
      I1 => \res_max_bin_theta_t_1_reg_5593[6]_i_17_n_0\,
      O => \res_max_bin_theta_t_1_reg_5593_reg[6]_i_5_n_0\,
      S => icmp_ln895_118_reg_5546
    );
\roi_seed_r_V_read_reg_4733_pp0_iter1_reg_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => roi_seed_r_V_read_reg_4733(0),
      Q => roi_seed_r_V_read_reg_4733_pp0_iter1_reg(0),
      R => '0'
    );
\roi_seed_r_V_read_reg_4733_pp0_iter1_reg_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => roi_seed_r_V_read_reg_4733(10),
      Q => roi_seed_r_V_read_reg_4733_pp0_iter1_reg(10),
      R => '0'
    );
\roi_seed_r_V_read_reg_4733_pp0_iter1_reg_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => roi_seed_r_V_read_reg_4733(11),
      Q => roi_seed_r_V_read_reg_4733_pp0_iter1_reg(11),
      R => '0'
    );
\roi_seed_r_V_read_reg_4733_pp0_iter1_reg_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => roi_seed_r_V_read_reg_4733(12),
      Q => roi_seed_r_V_read_reg_4733_pp0_iter1_reg(12),
      R => '0'
    );
\roi_seed_r_V_read_reg_4733_pp0_iter1_reg_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => roi_seed_r_V_read_reg_4733(13),
      Q => roi_seed_r_V_read_reg_4733_pp0_iter1_reg(13),
      R => '0'
    );
\roi_seed_r_V_read_reg_4733_pp0_iter1_reg_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => roi_seed_r_V_read_reg_4733(14),
      Q => roi_seed_r_V_read_reg_4733_pp0_iter1_reg(14),
      R => '0'
    );
\roi_seed_r_V_read_reg_4733_pp0_iter1_reg_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => roi_seed_r_V_read_reg_4733(15),
      Q => roi_seed_r_V_read_reg_4733_pp0_iter1_reg(15),
      R => '0'
    );
\roi_seed_r_V_read_reg_4733_pp0_iter1_reg_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => roi_seed_r_V_read_reg_4733(16),
      Q => roi_seed_r_V_read_reg_4733_pp0_iter1_reg(16),
      R => '0'
    );
\roi_seed_r_V_read_reg_4733_pp0_iter1_reg_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => roi_seed_r_V_read_reg_4733(17),
      Q => roi_seed_r_V_read_reg_4733_pp0_iter1_reg(17),
      R => '0'
    );
\roi_seed_r_V_read_reg_4733_pp0_iter1_reg_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => roi_seed_r_V_read_reg_4733(18),
      Q => roi_seed_r_V_read_reg_4733_pp0_iter1_reg(18),
      R => '0'
    );
\roi_seed_r_V_read_reg_4733_pp0_iter1_reg_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => roi_seed_r_V_read_reg_4733(19),
      Q => roi_seed_r_V_read_reg_4733_pp0_iter1_reg(19),
      R => '0'
    );
\roi_seed_r_V_read_reg_4733_pp0_iter1_reg_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => roi_seed_r_V_read_reg_4733(1),
      Q => roi_seed_r_V_read_reg_4733_pp0_iter1_reg(1),
      R => '0'
    );
\roi_seed_r_V_read_reg_4733_pp0_iter1_reg_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => roi_seed_r_V_read_reg_4733(20),
      Q => roi_seed_r_V_read_reg_4733_pp0_iter1_reg(20),
      R => '0'
    );
\roi_seed_r_V_read_reg_4733_pp0_iter1_reg_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => roi_seed_r_V_read_reg_4733(21),
      Q => roi_seed_r_V_read_reg_4733_pp0_iter1_reg(21),
      R => '0'
    );
\roi_seed_r_V_read_reg_4733_pp0_iter1_reg_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => roi_seed_r_V_read_reg_4733(2),
      Q => roi_seed_r_V_read_reg_4733_pp0_iter1_reg(2),
      R => '0'
    );
\roi_seed_r_V_read_reg_4733_pp0_iter1_reg_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => roi_seed_r_V_read_reg_4733(3),
      Q => roi_seed_r_V_read_reg_4733_pp0_iter1_reg(3),
      R => '0'
    );
\roi_seed_r_V_read_reg_4733_pp0_iter1_reg_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => roi_seed_r_V_read_reg_4733(4),
      Q => roi_seed_r_V_read_reg_4733_pp0_iter1_reg(4),
      R => '0'
    );
\roi_seed_r_V_read_reg_4733_pp0_iter1_reg_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => roi_seed_r_V_read_reg_4733(5),
      Q => roi_seed_r_V_read_reg_4733_pp0_iter1_reg(5),
      R => '0'
    );
\roi_seed_r_V_read_reg_4733_pp0_iter1_reg_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => roi_seed_r_V_read_reg_4733(6),
      Q => roi_seed_r_V_read_reg_4733_pp0_iter1_reg(6),
      R => '0'
    );
\roi_seed_r_V_read_reg_4733_pp0_iter1_reg_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => roi_seed_r_V_read_reg_4733(7),
      Q => roi_seed_r_V_read_reg_4733_pp0_iter1_reg(7),
      R => '0'
    );
\roi_seed_r_V_read_reg_4733_pp0_iter1_reg_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => roi_seed_r_V_read_reg_4733(8),
      Q => roi_seed_r_V_read_reg_4733_pp0_iter1_reg(8),
      R => '0'
    );
\roi_seed_r_V_read_reg_4733_pp0_iter1_reg_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => roi_seed_r_V_read_reg_4733(9),
      Q => roi_seed_r_V_read_reg_4733_pp0_iter1_reg(9),
      R => '0'
    );
\roi_seed_r_V_read_reg_4733_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => roi_seed_r_V(0),
      Q => roi_seed_r_V_read_reg_4733(0),
      R => '0'
    );
\roi_seed_r_V_read_reg_4733_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => roi_seed_r_V(10),
      Q => roi_seed_r_V_read_reg_4733(10),
      R => '0'
    );
\roi_seed_r_V_read_reg_4733_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => roi_seed_r_V(11),
      Q => roi_seed_r_V_read_reg_4733(11),
      R => '0'
    );
\roi_seed_r_V_read_reg_4733_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => roi_seed_r_V(12),
      Q => roi_seed_r_V_read_reg_4733(12),
      R => '0'
    );
\roi_seed_r_V_read_reg_4733_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => roi_seed_r_V(13),
      Q => roi_seed_r_V_read_reg_4733(13),
      R => '0'
    );
\roi_seed_r_V_read_reg_4733_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => roi_seed_r_V(14),
      Q => roi_seed_r_V_read_reg_4733(14),
      R => '0'
    );
\roi_seed_r_V_read_reg_4733_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => roi_seed_r_V(15),
      Q => roi_seed_r_V_read_reg_4733(15),
      R => '0'
    );
\roi_seed_r_V_read_reg_4733_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => roi_seed_r_V(16),
      Q => roi_seed_r_V_read_reg_4733(16),
      R => '0'
    );
\roi_seed_r_V_read_reg_4733_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => roi_seed_r_V(17),
      Q => roi_seed_r_V_read_reg_4733(17),
      R => '0'
    );
\roi_seed_r_V_read_reg_4733_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => roi_seed_r_V(18),
      Q => roi_seed_r_V_read_reg_4733(18),
      R => '0'
    );
\roi_seed_r_V_read_reg_4733_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => roi_seed_r_V(19),
      Q => roi_seed_r_V_read_reg_4733(19),
      R => '0'
    );
\roi_seed_r_V_read_reg_4733_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => roi_seed_r_V(1),
      Q => roi_seed_r_V_read_reg_4733(1),
      R => '0'
    );
\roi_seed_r_V_read_reg_4733_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => roi_seed_r_V(20),
      Q => roi_seed_r_V_read_reg_4733(20),
      R => '0'
    );
\roi_seed_r_V_read_reg_4733_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => roi_seed_r_V(21),
      Q => roi_seed_r_V_read_reg_4733(21),
      R => '0'
    );
\roi_seed_r_V_read_reg_4733_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => roi_seed_r_V(2),
      Q => roi_seed_r_V_read_reg_4733(2),
      R => '0'
    );
\roi_seed_r_V_read_reg_4733_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => roi_seed_r_V(3),
      Q => roi_seed_r_V_read_reg_4733(3),
      R => '0'
    );
\roi_seed_r_V_read_reg_4733_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => roi_seed_r_V(4),
      Q => roi_seed_r_V_read_reg_4733(4),
      R => '0'
    );
\roi_seed_r_V_read_reg_4733_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => roi_seed_r_V(5),
      Q => roi_seed_r_V_read_reg_4733(5),
      R => '0'
    );
\roi_seed_r_V_read_reg_4733_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => roi_seed_r_V(6),
      Q => roi_seed_r_V_read_reg_4733(6),
      R => '0'
    );
\roi_seed_r_V_read_reg_4733_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => roi_seed_r_V(7),
      Q => roi_seed_r_V_read_reg_4733(7),
      R => '0'
    );
\roi_seed_r_V_read_reg_4733_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => roi_seed_r_V(8),
      Q => roi_seed_r_V_read_reg_4733(8),
      R => '0'
    );
\roi_seed_r_V_read_reg_4733_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => roi_seed_r_V(9),
      Q => roi_seed_r_V_read_reg_4733(9),
      R => '0'
    );
\select_ln432_10_reg_5098[0]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"88B8"
    )
        port map (
      I0 => max_bin_r_3_V(0),
      I1 => \icmp_ln895_68_reg_5093[0]_i_1_n_0\,
      I2 => max_bin_r_35_V(0),
      I3 => \icmp_ln895_35_reg_4918[0]_i_1_n_0\,
      O => select_ln432_10_fu_2815_p3(0)
    );
\select_ln432_10_reg_5098[1]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"88B8"
    )
        port map (
      I0 => max_bin_r_3_V(1),
      I1 => \icmp_ln895_68_reg_5093[0]_i_1_n_0\,
      I2 => max_bin_r_35_V(1),
      I3 => \icmp_ln895_35_reg_4918[0]_i_1_n_0\,
      O => select_ln432_10_fu_2815_p3(1)
    );
\select_ln432_10_reg_5098[2]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"88B8"
    )
        port map (
      I0 => max_bin_r_3_V(2),
      I1 => \icmp_ln895_68_reg_5093[0]_i_1_n_0\,
      I2 => max_bin_r_35_V(2),
      I3 => \icmp_ln895_35_reg_4918[0]_i_1_n_0\,
      O => select_ln432_10_fu_2815_p3(2)
    );
\select_ln432_10_reg_5098[3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"88B8"
    )
        port map (
      I0 => max_bin_r_3_V(3),
      I1 => \icmp_ln895_68_reg_5093[0]_i_1_n_0\,
      I2 => max_bin_r_35_V(3),
      I3 => \icmp_ln895_35_reg_4918[0]_i_1_n_0\,
      O => select_ln432_10_fu_2815_p3(3)
    );
\select_ln432_10_reg_5098[4]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"88B8"
    )
        port map (
      I0 => max_bin_r_3_V(4),
      I1 => \icmp_ln895_68_reg_5093[0]_i_1_n_0\,
      I2 => max_bin_r_35_V(4),
      I3 => \icmp_ln895_35_reg_4918[0]_i_1_n_0\,
      O => select_ln432_10_fu_2815_p3(4)
    );
\select_ln432_10_reg_5098[5]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"88B8"
    )
        port map (
      I0 => max_bin_r_3_V(5),
      I1 => \icmp_ln895_68_reg_5093[0]_i_1_n_0\,
      I2 => max_bin_r_35_V(5),
      I3 => \icmp_ln895_35_reg_4918[0]_i_1_n_0\,
      O => select_ln432_10_fu_2815_p3(5)
    );
\select_ln432_10_reg_5098[6]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000002"
    )
        port map (
      I0 => \icmp_ln895_68_reg_5093[0]_i_1_n_0\,
      I1 => max_bin_count_3_V(0),
      I2 => max_bin_count_3_V(1),
      I3 => max_bin_count_3_V(3),
      I4 => max_bin_count_3_V(2),
      O => select_ln432_10_reg_5098
    );
\select_ln432_10_reg_5098[6]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"88B8"
    )
        port map (
      I0 => max_bin_r_3_V(6),
      I1 => \icmp_ln895_68_reg_5093[0]_i_1_n_0\,
      I2 => max_bin_r_35_V(6),
      I3 => \icmp_ln895_35_reg_4918[0]_i_1_n_0\,
      O => select_ln432_10_fu_2815_p3(6)
    );
\select_ln432_10_reg_5098_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => select_ln432_10_fu_2815_p3(0),
      Q => \select_ln432_10_reg_5098_reg_n_0_[0]\,
      R => select_ln432_10_reg_5098
    );
\select_ln432_10_reg_5098_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => select_ln432_10_fu_2815_p3(1),
      Q => \select_ln432_10_reg_5098_reg_n_0_[1]\,
      R => select_ln432_10_reg_5098
    );
\select_ln432_10_reg_5098_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => select_ln432_10_fu_2815_p3(2),
      Q => \select_ln432_10_reg_5098_reg_n_0_[2]\,
      R => select_ln432_10_reg_5098
    );
\select_ln432_10_reg_5098_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => select_ln432_10_fu_2815_p3(3),
      Q => \select_ln432_10_reg_5098_reg_n_0_[3]\,
      R => select_ln432_10_reg_5098
    );
\select_ln432_10_reg_5098_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => select_ln432_10_fu_2815_p3(4),
      Q => \select_ln432_10_reg_5098_reg_n_0_[4]\,
      R => select_ln432_10_reg_5098
    );
\select_ln432_10_reg_5098_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => select_ln432_10_fu_2815_p3(5),
      Q => \select_ln432_10_reg_5098_reg_n_0_[5]\,
      R => select_ln432_10_reg_5098
    );
\select_ln432_10_reg_5098_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => select_ln432_10_fu_2815_p3(6),
      Q => \select_ln432_10_reg_5098_reg_n_0_[6]\,
      R => select_ln432_10_reg_5098
    );
\select_ln432_13_reg_5108[0]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"88B8"
    )
        port map (
      I0 => max_bin_r_4_V(0),
      I1 => \icmp_ln895_69_reg_5103[0]_i_1_n_0\,
      I2 => max_bin_r_36_V(0),
      I3 => \icmp_ln895_36_reg_4923[0]_i_1_n_0\,
      O => select_ln432_13_fu_2832_p3(0)
    );
\select_ln432_13_reg_5108[1]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"88B8"
    )
        port map (
      I0 => max_bin_r_4_V(1),
      I1 => \icmp_ln895_69_reg_5103[0]_i_1_n_0\,
      I2 => max_bin_r_36_V(1),
      I3 => \icmp_ln895_36_reg_4923[0]_i_1_n_0\,
      O => select_ln432_13_fu_2832_p3(1)
    );
\select_ln432_13_reg_5108[2]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"88B8"
    )
        port map (
      I0 => max_bin_r_4_V(2),
      I1 => \icmp_ln895_69_reg_5103[0]_i_1_n_0\,
      I2 => max_bin_r_36_V(2),
      I3 => \icmp_ln895_36_reg_4923[0]_i_1_n_0\,
      O => select_ln432_13_fu_2832_p3(2)
    );
\select_ln432_13_reg_5108[3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"88B8"
    )
        port map (
      I0 => max_bin_r_4_V(3),
      I1 => \icmp_ln895_69_reg_5103[0]_i_1_n_0\,
      I2 => max_bin_r_36_V(3),
      I3 => \icmp_ln895_36_reg_4923[0]_i_1_n_0\,
      O => select_ln432_13_fu_2832_p3(3)
    );
\select_ln432_13_reg_5108[4]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"88B8"
    )
        port map (
      I0 => max_bin_r_4_V(4),
      I1 => \icmp_ln895_69_reg_5103[0]_i_1_n_0\,
      I2 => max_bin_r_36_V(4),
      I3 => \icmp_ln895_36_reg_4923[0]_i_1_n_0\,
      O => select_ln432_13_fu_2832_p3(4)
    );
\select_ln432_13_reg_5108[5]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"88B8"
    )
        port map (
      I0 => max_bin_r_4_V(5),
      I1 => \icmp_ln895_69_reg_5103[0]_i_1_n_0\,
      I2 => max_bin_r_36_V(5),
      I3 => \icmp_ln895_36_reg_4923[0]_i_1_n_0\,
      O => select_ln432_13_fu_2832_p3(5)
    );
\select_ln432_13_reg_5108[6]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000002"
    )
        port map (
      I0 => \icmp_ln895_69_reg_5103[0]_i_1_n_0\,
      I1 => max_bin_count_4_V(0),
      I2 => max_bin_count_4_V(1),
      I3 => max_bin_count_4_V(3),
      I4 => max_bin_count_4_V(2),
      O => select_ln432_13_reg_5108
    );
\select_ln432_13_reg_5108[6]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"88B8"
    )
        port map (
      I0 => max_bin_r_4_V(6),
      I1 => \icmp_ln895_69_reg_5103[0]_i_1_n_0\,
      I2 => max_bin_r_36_V(6),
      I3 => \icmp_ln895_36_reg_4923[0]_i_1_n_0\,
      O => select_ln432_13_fu_2832_p3(6)
    );
\select_ln432_13_reg_5108_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => select_ln432_13_fu_2832_p3(0),
      Q => \select_ln432_13_reg_5108_reg_n_0_[0]\,
      R => select_ln432_13_reg_5108
    );
\select_ln432_13_reg_5108_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => select_ln432_13_fu_2832_p3(1),
      Q => \select_ln432_13_reg_5108_reg_n_0_[1]\,
      R => select_ln432_13_reg_5108
    );
\select_ln432_13_reg_5108_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => select_ln432_13_fu_2832_p3(2),
      Q => \select_ln432_13_reg_5108_reg_n_0_[2]\,
      R => select_ln432_13_reg_5108
    );
\select_ln432_13_reg_5108_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => select_ln432_13_fu_2832_p3(3),
      Q => \select_ln432_13_reg_5108_reg_n_0_[3]\,
      R => select_ln432_13_reg_5108
    );
\select_ln432_13_reg_5108_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => select_ln432_13_fu_2832_p3(4),
      Q => \select_ln432_13_reg_5108_reg_n_0_[4]\,
      R => select_ln432_13_reg_5108
    );
\select_ln432_13_reg_5108_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => select_ln432_13_fu_2832_p3(5),
      Q => \select_ln432_13_reg_5108_reg_n_0_[5]\,
      R => select_ln432_13_reg_5108
    );
\select_ln432_13_reg_5108_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => select_ln432_13_fu_2832_p3(6),
      Q => \select_ln432_13_reg_5108_reg_n_0_[6]\,
      R => select_ln432_13_reg_5108
    );
\select_ln432_16_reg_5118[0]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"88B8"
    )
        port map (
      I0 => max_bin_r_5_V(0),
      I1 => \icmp_ln895_70_reg_5113[0]_i_1_n_0\,
      I2 => max_bin_r_37_V(0),
      I3 => \icmp_ln895_37_reg_4928[0]_i_1_n_0\,
      O => select_ln432_16_fu_2849_p3(0)
    );
\select_ln432_16_reg_5118[1]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"88B8"
    )
        port map (
      I0 => max_bin_r_5_V(1),
      I1 => \icmp_ln895_70_reg_5113[0]_i_1_n_0\,
      I2 => max_bin_r_37_V(1),
      I3 => \icmp_ln895_37_reg_4928[0]_i_1_n_0\,
      O => select_ln432_16_fu_2849_p3(1)
    );
\select_ln432_16_reg_5118[2]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"88B8"
    )
        port map (
      I0 => max_bin_r_5_V(2),
      I1 => \icmp_ln895_70_reg_5113[0]_i_1_n_0\,
      I2 => max_bin_r_37_V(2),
      I3 => \icmp_ln895_37_reg_4928[0]_i_1_n_0\,
      O => select_ln432_16_fu_2849_p3(2)
    );
\select_ln432_16_reg_5118[3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"88B8"
    )
        port map (
      I0 => max_bin_r_5_V(3),
      I1 => \icmp_ln895_70_reg_5113[0]_i_1_n_0\,
      I2 => max_bin_r_37_V(3),
      I3 => \icmp_ln895_37_reg_4928[0]_i_1_n_0\,
      O => select_ln432_16_fu_2849_p3(3)
    );
\select_ln432_16_reg_5118[4]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"88B8"
    )
        port map (
      I0 => max_bin_r_5_V(4),
      I1 => \icmp_ln895_70_reg_5113[0]_i_1_n_0\,
      I2 => max_bin_r_37_V(4),
      I3 => \icmp_ln895_37_reg_4928[0]_i_1_n_0\,
      O => select_ln432_16_fu_2849_p3(4)
    );
\select_ln432_16_reg_5118[5]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"88B8"
    )
        port map (
      I0 => max_bin_r_5_V(5),
      I1 => \icmp_ln895_70_reg_5113[0]_i_1_n_0\,
      I2 => max_bin_r_37_V(5),
      I3 => \icmp_ln895_37_reg_4928[0]_i_1_n_0\,
      O => select_ln432_16_fu_2849_p3(5)
    );
\select_ln432_16_reg_5118[6]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000002"
    )
        port map (
      I0 => \icmp_ln895_70_reg_5113[0]_i_1_n_0\,
      I1 => max_bin_count_5_V(0),
      I2 => max_bin_count_5_V(1),
      I3 => max_bin_count_5_V(3),
      I4 => max_bin_count_5_V(2),
      O => select_ln432_16_reg_5118
    );
\select_ln432_16_reg_5118[6]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"88B8"
    )
        port map (
      I0 => max_bin_r_5_V(6),
      I1 => \icmp_ln895_70_reg_5113[0]_i_1_n_0\,
      I2 => max_bin_r_37_V(6),
      I3 => \icmp_ln895_37_reg_4928[0]_i_1_n_0\,
      O => select_ln432_16_fu_2849_p3(6)
    );
\select_ln432_16_reg_5118_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => select_ln432_16_fu_2849_p3(0),
      Q => \select_ln432_16_reg_5118_reg_n_0_[0]\,
      R => select_ln432_16_reg_5118
    );
\select_ln432_16_reg_5118_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => select_ln432_16_fu_2849_p3(1),
      Q => \select_ln432_16_reg_5118_reg_n_0_[1]\,
      R => select_ln432_16_reg_5118
    );
\select_ln432_16_reg_5118_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => select_ln432_16_fu_2849_p3(2),
      Q => \select_ln432_16_reg_5118_reg_n_0_[2]\,
      R => select_ln432_16_reg_5118
    );
\select_ln432_16_reg_5118_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => select_ln432_16_fu_2849_p3(3),
      Q => \select_ln432_16_reg_5118_reg_n_0_[3]\,
      R => select_ln432_16_reg_5118
    );
\select_ln432_16_reg_5118_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => select_ln432_16_fu_2849_p3(4),
      Q => \select_ln432_16_reg_5118_reg_n_0_[4]\,
      R => select_ln432_16_reg_5118
    );
\select_ln432_16_reg_5118_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => select_ln432_16_fu_2849_p3(5),
      Q => \select_ln432_16_reg_5118_reg_n_0_[5]\,
      R => select_ln432_16_reg_5118
    );
\select_ln432_16_reg_5118_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => select_ln432_16_fu_2849_p3(6),
      Q => \select_ln432_16_reg_5118_reg_n_0_[6]\,
      R => select_ln432_16_reg_5118
    );
\select_ln432_19_reg_5128[0]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"88B8"
    )
        port map (
      I0 => max_bin_r_6_V(0),
      I1 => \icmp_ln895_71_reg_5123[0]_i_1_n_0\,
      I2 => max_bin_r_38_V(0),
      I3 => \icmp_ln895_38_reg_4933[0]_i_1_n_0\,
      O => select_ln432_19_fu_2866_p3(0)
    );
\select_ln432_19_reg_5128[1]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"88B8"
    )
        port map (
      I0 => max_bin_r_6_V(1),
      I1 => \icmp_ln895_71_reg_5123[0]_i_1_n_0\,
      I2 => max_bin_r_38_V(1),
      I3 => \icmp_ln895_38_reg_4933[0]_i_1_n_0\,
      O => select_ln432_19_fu_2866_p3(1)
    );
\select_ln432_19_reg_5128[2]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"88B8"
    )
        port map (
      I0 => max_bin_r_6_V(2),
      I1 => \icmp_ln895_71_reg_5123[0]_i_1_n_0\,
      I2 => max_bin_r_38_V(2),
      I3 => \icmp_ln895_38_reg_4933[0]_i_1_n_0\,
      O => select_ln432_19_fu_2866_p3(2)
    );
\select_ln432_19_reg_5128[3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"88B8"
    )
        port map (
      I0 => max_bin_r_6_V(3),
      I1 => \icmp_ln895_71_reg_5123[0]_i_1_n_0\,
      I2 => max_bin_r_38_V(3),
      I3 => \icmp_ln895_38_reg_4933[0]_i_1_n_0\,
      O => select_ln432_19_fu_2866_p3(3)
    );
\select_ln432_19_reg_5128[4]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"88B8"
    )
        port map (
      I0 => max_bin_r_6_V(4),
      I1 => \icmp_ln895_71_reg_5123[0]_i_1_n_0\,
      I2 => max_bin_r_38_V(4),
      I3 => \icmp_ln895_38_reg_4933[0]_i_1_n_0\,
      O => select_ln432_19_fu_2866_p3(4)
    );
\select_ln432_19_reg_5128[5]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"88B8"
    )
        port map (
      I0 => max_bin_r_6_V(5),
      I1 => \icmp_ln895_71_reg_5123[0]_i_1_n_0\,
      I2 => max_bin_r_38_V(5),
      I3 => \icmp_ln895_38_reg_4933[0]_i_1_n_0\,
      O => select_ln432_19_fu_2866_p3(5)
    );
\select_ln432_19_reg_5128[6]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000002"
    )
        port map (
      I0 => \icmp_ln895_71_reg_5123[0]_i_1_n_0\,
      I1 => max_bin_count_6_V(0),
      I2 => max_bin_count_6_V(1),
      I3 => max_bin_count_6_V(3),
      I4 => max_bin_count_6_V(2),
      O => select_ln432_19_reg_5128
    );
\select_ln432_19_reg_5128[6]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"88B8"
    )
        port map (
      I0 => max_bin_r_6_V(6),
      I1 => \icmp_ln895_71_reg_5123[0]_i_1_n_0\,
      I2 => max_bin_r_38_V(6),
      I3 => \icmp_ln895_38_reg_4933[0]_i_1_n_0\,
      O => select_ln432_19_fu_2866_p3(6)
    );
\select_ln432_19_reg_5128_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => select_ln432_19_fu_2866_p3(0),
      Q => \select_ln432_19_reg_5128_reg_n_0_[0]\,
      R => select_ln432_19_reg_5128
    );
\select_ln432_19_reg_5128_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => select_ln432_19_fu_2866_p3(1),
      Q => \select_ln432_19_reg_5128_reg_n_0_[1]\,
      R => select_ln432_19_reg_5128
    );
\select_ln432_19_reg_5128_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => select_ln432_19_fu_2866_p3(2),
      Q => \select_ln432_19_reg_5128_reg_n_0_[2]\,
      R => select_ln432_19_reg_5128
    );
\select_ln432_19_reg_5128_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => select_ln432_19_fu_2866_p3(3),
      Q => \select_ln432_19_reg_5128_reg_n_0_[3]\,
      R => select_ln432_19_reg_5128
    );
\select_ln432_19_reg_5128_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => select_ln432_19_fu_2866_p3(4),
      Q => \select_ln432_19_reg_5128_reg_n_0_[4]\,
      R => select_ln432_19_reg_5128
    );
\select_ln432_19_reg_5128_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => select_ln432_19_fu_2866_p3(5),
      Q => \select_ln432_19_reg_5128_reg_n_0_[5]\,
      R => select_ln432_19_reg_5128
    );
\select_ln432_19_reg_5128_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => select_ln432_19_fu_2866_p3(6),
      Q => \select_ln432_19_reg_5128_reg_n_0_[6]\,
      R => select_ln432_19_reg_5128
    );
\select_ln432_1_reg_5068[0]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"88B8"
    )
        port map (
      I0 => max_bin_r_0_V(0),
      I1 => \icmp_ln895_65_reg_5063[0]_i_1_n_0\,
      I2 => max_bin_r_32_V(0),
      I3 => \icmp_ln895_32_reg_4903[0]_i_1_n_0\,
      O => select_ln432_1_fu_2764_p3(0)
    );
\select_ln432_1_reg_5068[1]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"88B8"
    )
        port map (
      I0 => max_bin_r_0_V(1),
      I1 => \icmp_ln895_65_reg_5063[0]_i_1_n_0\,
      I2 => max_bin_r_32_V(1),
      I3 => \icmp_ln895_32_reg_4903[0]_i_1_n_0\,
      O => select_ln432_1_fu_2764_p3(1)
    );
\select_ln432_1_reg_5068[2]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"88B8"
    )
        port map (
      I0 => max_bin_r_0_V(2),
      I1 => \icmp_ln895_65_reg_5063[0]_i_1_n_0\,
      I2 => max_bin_r_32_V(2),
      I3 => \icmp_ln895_32_reg_4903[0]_i_1_n_0\,
      O => select_ln432_1_fu_2764_p3(2)
    );
\select_ln432_1_reg_5068[3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"88B8"
    )
        port map (
      I0 => max_bin_r_0_V(3),
      I1 => \icmp_ln895_65_reg_5063[0]_i_1_n_0\,
      I2 => max_bin_r_32_V(3),
      I3 => \icmp_ln895_32_reg_4903[0]_i_1_n_0\,
      O => select_ln432_1_fu_2764_p3(3)
    );
\select_ln432_1_reg_5068[4]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"88B8"
    )
        port map (
      I0 => max_bin_r_0_V(4),
      I1 => \icmp_ln895_65_reg_5063[0]_i_1_n_0\,
      I2 => max_bin_r_32_V(4),
      I3 => \icmp_ln895_32_reg_4903[0]_i_1_n_0\,
      O => select_ln432_1_fu_2764_p3(4)
    );
\select_ln432_1_reg_5068[5]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"88B8"
    )
        port map (
      I0 => max_bin_r_0_V(5),
      I1 => \icmp_ln895_65_reg_5063[0]_i_1_n_0\,
      I2 => max_bin_r_32_V(5),
      I3 => \icmp_ln895_32_reg_4903[0]_i_1_n_0\,
      O => select_ln432_1_fu_2764_p3(5)
    );
\select_ln432_1_reg_5068[6]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000002"
    )
        port map (
      I0 => \icmp_ln895_65_reg_5063[0]_i_1_n_0\,
      I1 => max_bin_count_0_V(0),
      I2 => max_bin_count_0_V(1),
      I3 => max_bin_count_0_V(3),
      I4 => max_bin_count_0_V(2),
      O => select_ln432_1_reg_5068
    );
\select_ln432_1_reg_5068[6]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"88B8"
    )
        port map (
      I0 => max_bin_r_0_V(6),
      I1 => \icmp_ln895_65_reg_5063[0]_i_1_n_0\,
      I2 => max_bin_r_32_V(6),
      I3 => \icmp_ln895_32_reg_4903[0]_i_1_n_0\,
      O => select_ln432_1_fu_2764_p3(6)
    );
\select_ln432_1_reg_5068_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => select_ln432_1_fu_2764_p3(0),
      Q => \select_ln432_1_reg_5068_reg_n_0_[0]\,
      R => select_ln432_1_reg_5068
    );
\select_ln432_1_reg_5068_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => select_ln432_1_fu_2764_p3(1),
      Q => \select_ln432_1_reg_5068_reg_n_0_[1]\,
      R => select_ln432_1_reg_5068
    );
\select_ln432_1_reg_5068_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => select_ln432_1_fu_2764_p3(2),
      Q => \select_ln432_1_reg_5068_reg_n_0_[2]\,
      R => select_ln432_1_reg_5068
    );
\select_ln432_1_reg_5068_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => select_ln432_1_fu_2764_p3(3),
      Q => \select_ln432_1_reg_5068_reg_n_0_[3]\,
      R => select_ln432_1_reg_5068
    );
\select_ln432_1_reg_5068_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => select_ln432_1_fu_2764_p3(4),
      Q => \select_ln432_1_reg_5068_reg_n_0_[4]\,
      R => select_ln432_1_reg_5068
    );
\select_ln432_1_reg_5068_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => select_ln432_1_fu_2764_p3(5),
      Q => \select_ln432_1_reg_5068_reg_n_0_[5]\,
      R => select_ln432_1_reg_5068
    );
\select_ln432_1_reg_5068_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => select_ln432_1_fu_2764_p3(6),
      Q => \select_ln432_1_reg_5068_reg_n_0_[6]\,
      R => select_ln432_1_reg_5068
    );
\select_ln432_22_reg_5138[0]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"88B8"
    )
        port map (
      I0 => max_bin_r_7_V(0),
      I1 => \icmp_ln895_72_reg_5133[0]_i_1_n_0\,
      I2 => max_bin_r_39_V(0),
      I3 => \icmp_ln895_39_reg_4938[0]_i_1_n_0\,
      O => select_ln432_22_fu_2883_p3(0)
    );
\select_ln432_22_reg_5138[1]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"88B8"
    )
        port map (
      I0 => max_bin_r_7_V(1),
      I1 => \icmp_ln895_72_reg_5133[0]_i_1_n_0\,
      I2 => max_bin_r_39_V(1),
      I3 => \icmp_ln895_39_reg_4938[0]_i_1_n_0\,
      O => select_ln432_22_fu_2883_p3(1)
    );
\select_ln432_22_reg_5138[2]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"88B8"
    )
        port map (
      I0 => max_bin_r_7_V(2),
      I1 => \icmp_ln895_72_reg_5133[0]_i_1_n_0\,
      I2 => max_bin_r_39_V(2),
      I3 => \icmp_ln895_39_reg_4938[0]_i_1_n_0\,
      O => select_ln432_22_fu_2883_p3(2)
    );
\select_ln432_22_reg_5138[3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"88B8"
    )
        port map (
      I0 => max_bin_r_7_V(3),
      I1 => \icmp_ln895_72_reg_5133[0]_i_1_n_0\,
      I2 => max_bin_r_39_V(3),
      I3 => \icmp_ln895_39_reg_4938[0]_i_1_n_0\,
      O => select_ln432_22_fu_2883_p3(3)
    );
\select_ln432_22_reg_5138[4]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"88B8"
    )
        port map (
      I0 => max_bin_r_7_V(4),
      I1 => \icmp_ln895_72_reg_5133[0]_i_1_n_0\,
      I2 => max_bin_r_39_V(4),
      I3 => \icmp_ln895_39_reg_4938[0]_i_1_n_0\,
      O => select_ln432_22_fu_2883_p3(4)
    );
\select_ln432_22_reg_5138[5]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"88B8"
    )
        port map (
      I0 => max_bin_r_7_V(5),
      I1 => \icmp_ln895_72_reg_5133[0]_i_1_n_0\,
      I2 => max_bin_r_39_V(5),
      I3 => \icmp_ln895_39_reg_4938[0]_i_1_n_0\,
      O => select_ln432_22_fu_2883_p3(5)
    );
\select_ln432_22_reg_5138[6]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000002"
    )
        port map (
      I0 => \icmp_ln895_72_reg_5133[0]_i_1_n_0\,
      I1 => max_bin_count_7_V(0),
      I2 => max_bin_count_7_V(1),
      I3 => max_bin_count_7_V(3),
      I4 => max_bin_count_7_V(2),
      O => select_ln432_22_reg_5138
    );
\select_ln432_22_reg_5138[6]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"88B8"
    )
        port map (
      I0 => max_bin_r_7_V(6),
      I1 => \icmp_ln895_72_reg_5133[0]_i_1_n_0\,
      I2 => max_bin_r_39_V(6),
      I3 => \icmp_ln895_39_reg_4938[0]_i_1_n_0\,
      O => select_ln432_22_fu_2883_p3(6)
    );
\select_ln432_22_reg_5138_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => select_ln432_22_fu_2883_p3(0),
      Q => \select_ln432_22_reg_5138_reg_n_0_[0]\,
      R => select_ln432_22_reg_5138
    );
\select_ln432_22_reg_5138_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => select_ln432_22_fu_2883_p3(1),
      Q => \select_ln432_22_reg_5138_reg_n_0_[1]\,
      R => select_ln432_22_reg_5138
    );
\select_ln432_22_reg_5138_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => select_ln432_22_fu_2883_p3(2),
      Q => \select_ln432_22_reg_5138_reg_n_0_[2]\,
      R => select_ln432_22_reg_5138
    );
\select_ln432_22_reg_5138_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => select_ln432_22_fu_2883_p3(3),
      Q => \select_ln432_22_reg_5138_reg_n_0_[3]\,
      R => select_ln432_22_reg_5138
    );
\select_ln432_22_reg_5138_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => select_ln432_22_fu_2883_p3(4),
      Q => \select_ln432_22_reg_5138_reg_n_0_[4]\,
      R => select_ln432_22_reg_5138
    );
\select_ln432_22_reg_5138_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => select_ln432_22_fu_2883_p3(5),
      Q => \select_ln432_22_reg_5138_reg_n_0_[5]\,
      R => select_ln432_22_reg_5138
    );
\select_ln432_22_reg_5138_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => select_ln432_22_fu_2883_p3(6),
      Q => \select_ln432_22_reg_5138_reg_n_0_[6]\,
      R => select_ln432_22_reg_5138
    );
\select_ln432_49_reg_5188[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"B200B200FF4DB200"
    )
        port map (
      I0 => \select_ln432_49_reg_5188[6]_i_3_n_0\,
      I1 => max_bin_count_48_V(3),
      I2 => max_bin_count_16_V(3),
      I3 => max_bin_r_16_V(0),
      I4 => max_bin_r_48_V(0),
      I5 => \icmp_ln895_48_reg_4983[0]_i_1_n_0\,
      O => select_ln432_49_fu_3036_p3(0)
    );
\select_ln432_49_reg_5188[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"B200B200FF4DB200"
    )
        port map (
      I0 => \select_ln432_49_reg_5188[6]_i_3_n_0\,
      I1 => max_bin_count_48_V(3),
      I2 => max_bin_count_16_V(3),
      I3 => max_bin_r_16_V(1),
      I4 => max_bin_r_48_V(1),
      I5 => \icmp_ln895_48_reg_4983[0]_i_1_n_0\,
      O => select_ln432_49_fu_3036_p3(1)
    );
\select_ln432_49_reg_5188[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"B200B200FF4DB200"
    )
        port map (
      I0 => \select_ln432_49_reg_5188[6]_i_3_n_0\,
      I1 => max_bin_count_48_V(3),
      I2 => max_bin_count_16_V(3),
      I3 => max_bin_r_16_V(2),
      I4 => max_bin_r_48_V(2),
      I5 => \icmp_ln895_48_reg_4983[0]_i_1_n_0\,
      O => select_ln432_49_fu_3036_p3(2)
    );
\select_ln432_49_reg_5188[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"B200B200FF4DB200"
    )
        port map (
      I0 => \select_ln432_49_reg_5188[6]_i_3_n_0\,
      I1 => max_bin_count_48_V(3),
      I2 => max_bin_count_16_V(3),
      I3 => max_bin_r_16_V(3),
      I4 => max_bin_r_48_V(3),
      I5 => \icmp_ln895_48_reg_4983[0]_i_1_n_0\,
      O => select_ln432_49_fu_3036_p3(3)
    );
\select_ln432_49_reg_5188[4]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"B200B200FF4DB200"
    )
        port map (
      I0 => \select_ln432_49_reg_5188[6]_i_3_n_0\,
      I1 => max_bin_count_48_V(3),
      I2 => max_bin_count_16_V(3),
      I3 => max_bin_r_16_V(4),
      I4 => max_bin_r_48_V(4),
      I5 => \icmp_ln895_48_reg_4983[0]_i_1_n_0\,
      O => select_ln432_49_fu_3036_p3(4)
    );
\select_ln432_49_reg_5188[5]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"B200B200FF4DB200"
    )
        port map (
      I0 => \select_ln432_49_reg_5188[6]_i_3_n_0\,
      I1 => max_bin_count_48_V(3),
      I2 => max_bin_count_16_V(3),
      I3 => max_bin_r_16_V(5),
      I4 => max_bin_r_48_V(5),
      I5 => \icmp_ln895_48_reg_4983[0]_i_1_n_0\,
      O => select_ln432_49_fu_3036_p3(5)
    );
\select_ln432_49_reg_5188[6]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000002"
    )
        port map (
      I0 => \select_ln432_49_reg_5188[6]_i_3_n_0\,
      I1 => max_bin_count_48_V(3),
      I2 => max_bin_count_16_V(3),
      I3 => max_bin_count_16_V(0),
      I4 => max_bin_count_16_V(1),
      I5 => max_bin_count_16_V(2),
      O => select_ln432_49_reg_5188
    );
\select_ln432_49_reg_5188[6]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"B200B200FF4DB200"
    )
        port map (
      I0 => \select_ln432_49_reg_5188[6]_i_3_n_0\,
      I1 => max_bin_count_48_V(3),
      I2 => max_bin_count_16_V(3),
      I3 => max_bin_r_16_V(6),
      I4 => max_bin_r_48_V(6),
      I5 => \icmp_ln895_48_reg_4983[0]_i_1_n_0\,
      O => select_ln432_49_fu_3036_p3(6)
    );
\select_ln432_49_reg_5188[6]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"2F02FFFF00002F02"
    )
        port map (
      I0 => max_bin_count_16_V(0),
      I1 => max_bin_count_48_V(0),
      I2 => max_bin_count_48_V(1),
      I3 => max_bin_count_16_V(1),
      I4 => max_bin_count_48_V(2),
      I5 => max_bin_count_16_V(2),
      O => \select_ln432_49_reg_5188[6]_i_3_n_0\
    );
\select_ln432_49_reg_5188_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => select_ln432_49_fu_3036_p3(0),
      Q => \select_ln432_49_reg_5188_reg_n_0_[0]\,
      R => select_ln432_49_reg_5188
    );
\select_ln432_49_reg_5188_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => select_ln432_49_fu_3036_p3(1),
      Q => \select_ln432_49_reg_5188_reg_n_0_[1]\,
      R => select_ln432_49_reg_5188
    );
\select_ln432_49_reg_5188_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => select_ln432_49_fu_3036_p3(2),
      Q => \select_ln432_49_reg_5188_reg_n_0_[2]\,
      R => select_ln432_49_reg_5188
    );
\select_ln432_49_reg_5188_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => select_ln432_49_fu_3036_p3(3),
      Q => \select_ln432_49_reg_5188_reg_n_0_[3]\,
      R => select_ln432_49_reg_5188
    );
\select_ln432_49_reg_5188_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => select_ln432_49_fu_3036_p3(4),
      Q => \select_ln432_49_reg_5188_reg_n_0_[4]\,
      R => select_ln432_49_reg_5188
    );
\select_ln432_49_reg_5188_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => select_ln432_49_fu_3036_p3(5),
      Q => \select_ln432_49_reg_5188_reg_n_0_[5]\,
      R => select_ln432_49_reg_5188
    );
\select_ln432_49_reg_5188_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => select_ln432_49_fu_3036_p3(6),
      Q => \select_ln432_49_reg_5188_reg_n_0_[6]\,
      R => select_ln432_49_reg_5188
    );
\select_ln432_4_reg_5078[0]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"88B8"
    )
        port map (
      I0 => max_bin_r_1_V(0),
      I1 => \icmp_ln895_66_reg_5073[0]_i_1_n_0\,
      I2 => max_bin_r_33_V(0),
      I3 => \icmp_ln895_33_reg_4908[0]_i_1_n_0\,
      O => select_ln432_4_fu_2781_p3(0)
    );
\select_ln432_4_reg_5078[1]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"88B8"
    )
        port map (
      I0 => max_bin_r_1_V(1),
      I1 => \icmp_ln895_66_reg_5073[0]_i_1_n_0\,
      I2 => max_bin_r_33_V(1),
      I3 => \icmp_ln895_33_reg_4908[0]_i_1_n_0\,
      O => select_ln432_4_fu_2781_p3(1)
    );
\select_ln432_4_reg_5078[2]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"88B8"
    )
        port map (
      I0 => max_bin_r_1_V(2),
      I1 => \icmp_ln895_66_reg_5073[0]_i_1_n_0\,
      I2 => max_bin_r_33_V(2),
      I3 => \icmp_ln895_33_reg_4908[0]_i_1_n_0\,
      O => select_ln432_4_fu_2781_p3(2)
    );
\select_ln432_4_reg_5078[3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"88B8"
    )
        port map (
      I0 => max_bin_r_1_V(3),
      I1 => \icmp_ln895_66_reg_5073[0]_i_1_n_0\,
      I2 => max_bin_r_33_V(3),
      I3 => \icmp_ln895_33_reg_4908[0]_i_1_n_0\,
      O => select_ln432_4_fu_2781_p3(3)
    );
\select_ln432_4_reg_5078[4]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"88B8"
    )
        port map (
      I0 => max_bin_r_1_V(4),
      I1 => \icmp_ln895_66_reg_5073[0]_i_1_n_0\,
      I2 => max_bin_r_33_V(4),
      I3 => \icmp_ln895_33_reg_4908[0]_i_1_n_0\,
      O => select_ln432_4_fu_2781_p3(4)
    );
\select_ln432_4_reg_5078[5]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"88B8"
    )
        port map (
      I0 => max_bin_r_1_V(5),
      I1 => \icmp_ln895_66_reg_5073[0]_i_1_n_0\,
      I2 => max_bin_r_33_V(5),
      I3 => \icmp_ln895_33_reg_4908[0]_i_1_n_0\,
      O => select_ln432_4_fu_2781_p3(5)
    );
\select_ln432_4_reg_5078[6]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000002"
    )
        port map (
      I0 => \icmp_ln895_66_reg_5073[0]_i_1_n_0\,
      I1 => max_bin_count_1_V(0),
      I2 => max_bin_count_1_V(1),
      I3 => max_bin_count_1_V(3),
      I4 => max_bin_count_1_V(2),
      O => select_ln432_4_reg_5078
    );
\select_ln432_4_reg_5078[6]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"88B8"
    )
        port map (
      I0 => max_bin_r_1_V(6),
      I1 => \icmp_ln895_66_reg_5073[0]_i_1_n_0\,
      I2 => max_bin_r_33_V(6),
      I3 => \icmp_ln895_33_reg_4908[0]_i_1_n_0\,
      O => select_ln432_4_fu_2781_p3(6)
    );
\select_ln432_4_reg_5078_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => select_ln432_4_fu_2781_p3(0),
      Q => \select_ln432_4_reg_5078_reg_n_0_[0]\,
      R => select_ln432_4_reg_5078
    );
\select_ln432_4_reg_5078_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => select_ln432_4_fu_2781_p3(1),
      Q => \select_ln432_4_reg_5078_reg_n_0_[1]\,
      R => select_ln432_4_reg_5078
    );
\select_ln432_4_reg_5078_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => select_ln432_4_fu_2781_p3(2),
      Q => \select_ln432_4_reg_5078_reg_n_0_[2]\,
      R => select_ln432_4_reg_5078
    );
\select_ln432_4_reg_5078_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => select_ln432_4_fu_2781_p3(3),
      Q => \select_ln432_4_reg_5078_reg_n_0_[3]\,
      R => select_ln432_4_reg_5078
    );
\select_ln432_4_reg_5078_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => select_ln432_4_fu_2781_p3(4),
      Q => \select_ln432_4_reg_5078_reg_n_0_[4]\,
      R => select_ln432_4_reg_5078
    );
\select_ln432_4_reg_5078_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => select_ln432_4_fu_2781_p3(5),
      Q => \select_ln432_4_reg_5078_reg_n_0_[5]\,
      R => select_ln432_4_reg_5078
    );
\select_ln432_4_reg_5078_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => select_ln432_4_fu_2781_p3(6),
      Q => \select_ln432_4_reg_5078_reg_n_0_[6]\,
      R => select_ln432_4_reg_5078
    );
\select_ln432_52_reg_5198[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"B200B200FF4DB200"
    )
        port map (
      I0 => \select_ln432_52_reg_5198[6]_i_3_n_0\,
      I1 => max_bin_count_49_V(3),
      I2 => max_bin_count_17_V(3),
      I3 => max_bin_r_17_V(0),
      I4 => max_bin_r_49_V(0),
      I5 => \icmp_ln895_49_reg_4988[0]_i_1_n_0\,
      O => select_ln432_52_fu_3053_p3(0)
    );
\select_ln432_52_reg_5198[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"B200B200FF4DB200"
    )
        port map (
      I0 => \select_ln432_52_reg_5198[6]_i_3_n_0\,
      I1 => max_bin_count_49_V(3),
      I2 => max_bin_count_17_V(3),
      I3 => max_bin_r_17_V(1),
      I4 => max_bin_r_49_V(1),
      I5 => \icmp_ln895_49_reg_4988[0]_i_1_n_0\,
      O => select_ln432_52_fu_3053_p3(1)
    );
\select_ln432_52_reg_5198[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"B200B200FF4DB200"
    )
        port map (
      I0 => \select_ln432_52_reg_5198[6]_i_3_n_0\,
      I1 => max_bin_count_49_V(3),
      I2 => max_bin_count_17_V(3),
      I3 => max_bin_r_17_V(2),
      I4 => max_bin_r_49_V(2),
      I5 => \icmp_ln895_49_reg_4988[0]_i_1_n_0\,
      O => select_ln432_52_fu_3053_p3(2)
    );
\select_ln432_52_reg_5198[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"B200B200FF4DB200"
    )
        port map (
      I0 => \select_ln432_52_reg_5198[6]_i_3_n_0\,
      I1 => max_bin_count_49_V(3),
      I2 => max_bin_count_17_V(3),
      I3 => max_bin_r_17_V(3),
      I4 => max_bin_r_49_V(3),
      I5 => \icmp_ln895_49_reg_4988[0]_i_1_n_0\,
      O => select_ln432_52_fu_3053_p3(3)
    );
\select_ln432_52_reg_5198[4]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"B200B200FF4DB200"
    )
        port map (
      I0 => \select_ln432_52_reg_5198[6]_i_3_n_0\,
      I1 => max_bin_count_49_V(3),
      I2 => max_bin_count_17_V(3),
      I3 => max_bin_r_17_V(4),
      I4 => max_bin_r_49_V(4),
      I5 => \icmp_ln895_49_reg_4988[0]_i_1_n_0\,
      O => select_ln432_52_fu_3053_p3(4)
    );
\select_ln432_52_reg_5198[5]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"B200B200FF4DB200"
    )
        port map (
      I0 => \select_ln432_52_reg_5198[6]_i_3_n_0\,
      I1 => max_bin_count_49_V(3),
      I2 => max_bin_count_17_V(3),
      I3 => max_bin_r_17_V(5),
      I4 => max_bin_r_49_V(5),
      I5 => \icmp_ln895_49_reg_4988[0]_i_1_n_0\,
      O => select_ln432_52_fu_3053_p3(5)
    );
\select_ln432_52_reg_5198[6]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000002"
    )
        port map (
      I0 => \select_ln432_52_reg_5198[6]_i_3_n_0\,
      I1 => max_bin_count_49_V(3),
      I2 => max_bin_count_17_V(3),
      I3 => max_bin_count_17_V(0),
      I4 => max_bin_count_17_V(1),
      I5 => max_bin_count_17_V(2),
      O => select_ln432_52_reg_5198
    );
\select_ln432_52_reg_5198[6]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"B200B200FF4DB200"
    )
        port map (
      I0 => \select_ln432_52_reg_5198[6]_i_3_n_0\,
      I1 => max_bin_count_49_V(3),
      I2 => max_bin_count_17_V(3),
      I3 => max_bin_r_17_V(6),
      I4 => max_bin_r_49_V(6),
      I5 => \icmp_ln895_49_reg_4988[0]_i_1_n_0\,
      O => select_ln432_52_fu_3053_p3(6)
    );
\select_ln432_52_reg_5198[6]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"2F02FFFF00002F02"
    )
        port map (
      I0 => max_bin_count_17_V(0),
      I1 => max_bin_count_49_V(0),
      I2 => max_bin_count_49_V(1),
      I3 => max_bin_count_17_V(1),
      I4 => max_bin_count_49_V(2),
      I5 => max_bin_count_17_V(2),
      O => \select_ln432_52_reg_5198[6]_i_3_n_0\
    );
\select_ln432_52_reg_5198_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => select_ln432_52_fu_3053_p3(0),
      Q => \select_ln432_52_reg_5198_reg_n_0_[0]\,
      R => select_ln432_52_reg_5198
    );
\select_ln432_52_reg_5198_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => select_ln432_52_fu_3053_p3(1),
      Q => \select_ln432_52_reg_5198_reg_n_0_[1]\,
      R => select_ln432_52_reg_5198
    );
\select_ln432_52_reg_5198_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => select_ln432_52_fu_3053_p3(2),
      Q => \select_ln432_52_reg_5198_reg_n_0_[2]\,
      R => select_ln432_52_reg_5198
    );
\select_ln432_52_reg_5198_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => select_ln432_52_fu_3053_p3(3),
      Q => \select_ln432_52_reg_5198_reg_n_0_[3]\,
      R => select_ln432_52_reg_5198
    );
\select_ln432_52_reg_5198_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => select_ln432_52_fu_3053_p3(4),
      Q => \select_ln432_52_reg_5198_reg_n_0_[4]\,
      R => select_ln432_52_reg_5198
    );
\select_ln432_52_reg_5198_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => select_ln432_52_fu_3053_p3(5),
      Q => \select_ln432_52_reg_5198_reg_n_0_[5]\,
      R => select_ln432_52_reg_5198
    );
\select_ln432_52_reg_5198_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => select_ln432_52_fu_3053_p3(6),
      Q => \select_ln432_52_reg_5198_reg_n_0_[6]\,
      R => select_ln432_52_reg_5198
    );
\select_ln432_55_reg_5208[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"B200B200FF4DB200"
    )
        port map (
      I0 => \select_ln432_55_reg_5208[6]_i_3_n_0\,
      I1 => max_bin_count_50_V(3),
      I2 => max_bin_count_18_V(3),
      I3 => max_bin_r_18_V(0),
      I4 => max_bin_r_50_V(0),
      I5 => \icmp_ln895_50_reg_4993[0]_i_1_n_0\,
      O => select_ln432_55_fu_3070_p3(0)
    );
\select_ln432_55_reg_5208[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"B200B200FF4DB200"
    )
        port map (
      I0 => \select_ln432_55_reg_5208[6]_i_3_n_0\,
      I1 => max_bin_count_50_V(3),
      I2 => max_bin_count_18_V(3),
      I3 => max_bin_r_18_V(1),
      I4 => max_bin_r_50_V(1),
      I5 => \icmp_ln895_50_reg_4993[0]_i_1_n_0\,
      O => select_ln432_55_fu_3070_p3(1)
    );
\select_ln432_55_reg_5208[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"B200B200FF4DB200"
    )
        port map (
      I0 => \select_ln432_55_reg_5208[6]_i_3_n_0\,
      I1 => max_bin_count_50_V(3),
      I2 => max_bin_count_18_V(3),
      I3 => max_bin_r_18_V(2),
      I4 => max_bin_r_50_V(2),
      I5 => \icmp_ln895_50_reg_4993[0]_i_1_n_0\,
      O => select_ln432_55_fu_3070_p3(2)
    );
\select_ln432_55_reg_5208[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"B200B200FF4DB200"
    )
        port map (
      I0 => \select_ln432_55_reg_5208[6]_i_3_n_0\,
      I1 => max_bin_count_50_V(3),
      I2 => max_bin_count_18_V(3),
      I3 => max_bin_r_18_V(3),
      I4 => max_bin_r_50_V(3),
      I5 => \icmp_ln895_50_reg_4993[0]_i_1_n_0\,
      O => select_ln432_55_fu_3070_p3(3)
    );
\select_ln432_55_reg_5208[4]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"B200B200FF4DB200"
    )
        port map (
      I0 => \select_ln432_55_reg_5208[6]_i_3_n_0\,
      I1 => max_bin_count_50_V(3),
      I2 => max_bin_count_18_V(3),
      I3 => max_bin_r_18_V(4),
      I4 => max_bin_r_50_V(4),
      I5 => \icmp_ln895_50_reg_4993[0]_i_1_n_0\,
      O => select_ln432_55_fu_3070_p3(4)
    );
\select_ln432_55_reg_5208[5]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"B200B200FF4DB200"
    )
        port map (
      I0 => \select_ln432_55_reg_5208[6]_i_3_n_0\,
      I1 => max_bin_count_50_V(3),
      I2 => max_bin_count_18_V(3),
      I3 => max_bin_r_18_V(5),
      I4 => max_bin_r_50_V(5),
      I5 => \icmp_ln895_50_reg_4993[0]_i_1_n_0\,
      O => select_ln432_55_fu_3070_p3(5)
    );
\select_ln432_55_reg_5208[6]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000002"
    )
        port map (
      I0 => \select_ln432_55_reg_5208[6]_i_3_n_0\,
      I1 => max_bin_count_50_V(3),
      I2 => max_bin_count_18_V(3),
      I3 => max_bin_count_18_V(0),
      I4 => max_bin_count_18_V(1),
      I5 => max_bin_count_18_V(2),
      O => select_ln432_55_reg_5208
    );
\select_ln432_55_reg_5208[6]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"B200B200FF4DB200"
    )
        port map (
      I0 => \select_ln432_55_reg_5208[6]_i_3_n_0\,
      I1 => max_bin_count_50_V(3),
      I2 => max_bin_count_18_V(3),
      I3 => max_bin_r_18_V(6),
      I4 => max_bin_r_50_V(6),
      I5 => \icmp_ln895_50_reg_4993[0]_i_1_n_0\,
      O => select_ln432_55_fu_3070_p3(6)
    );
\select_ln432_55_reg_5208[6]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"2F02FFFF00002F02"
    )
        port map (
      I0 => max_bin_count_18_V(0),
      I1 => max_bin_count_50_V(0),
      I2 => max_bin_count_50_V(1),
      I3 => max_bin_count_18_V(1),
      I4 => max_bin_count_50_V(2),
      I5 => max_bin_count_18_V(2),
      O => \select_ln432_55_reg_5208[6]_i_3_n_0\
    );
\select_ln432_55_reg_5208_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => select_ln432_55_fu_3070_p3(0),
      Q => \select_ln432_55_reg_5208_reg_n_0_[0]\,
      R => select_ln432_55_reg_5208
    );
\select_ln432_55_reg_5208_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => select_ln432_55_fu_3070_p3(1),
      Q => \select_ln432_55_reg_5208_reg_n_0_[1]\,
      R => select_ln432_55_reg_5208
    );
\select_ln432_55_reg_5208_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => select_ln432_55_fu_3070_p3(2),
      Q => \select_ln432_55_reg_5208_reg_n_0_[2]\,
      R => select_ln432_55_reg_5208
    );
\select_ln432_55_reg_5208_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => select_ln432_55_fu_3070_p3(3),
      Q => \select_ln432_55_reg_5208_reg_n_0_[3]\,
      R => select_ln432_55_reg_5208
    );
\select_ln432_55_reg_5208_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => select_ln432_55_fu_3070_p3(4),
      Q => \select_ln432_55_reg_5208_reg_n_0_[4]\,
      R => select_ln432_55_reg_5208
    );
\select_ln432_55_reg_5208_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => select_ln432_55_fu_3070_p3(5),
      Q => \select_ln432_55_reg_5208_reg_n_0_[5]\,
      R => select_ln432_55_reg_5208
    );
\select_ln432_55_reg_5208_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => select_ln432_55_fu_3070_p3(6),
      Q => \select_ln432_55_reg_5208_reg_n_0_[6]\,
      R => select_ln432_55_reg_5208
    );
\select_ln432_58_reg_5218[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"B200B200FF4DB200"
    )
        port map (
      I0 => \select_ln432_58_reg_5218[6]_i_3_n_0\,
      I1 => max_bin_count_51_V(3),
      I2 => max_bin_count_19_V(3),
      I3 => max_bin_r_19_V(0),
      I4 => max_bin_r_51_V(0),
      I5 => \icmp_ln895_51_reg_4998[0]_i_1_n_0\,
      O => select_ln432_58_fu_3087_p3(0)
    );
\select_ln432_58_reg_5218[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"B200B200FF4DB200"
    )
        port map (
      I0 => \select_ln432_58_reg_5218[6]_i_3_n_0\,
      I1 => max_bin_count_51_V(3),
      I2 => max_bin_count_19_V(3),
      I3 => max_bin_r_19_V(1),
      I4 => max_bin_r_51_V(1),
      I5 => \icmp_ln895_51_reg_4998[0]_i_1_n_0\,
      O => select_ln432_58_fu_3087_p3(1)
    );
\select_ln432_58_reg_5218[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"B200B200FF4DB200"
    )
        port map (
      I0 => \select_ln432_58_reg_5218[6]_i_3_n_0\,
      I1 => max_bin_count_51_V(3),
      I2 => max_bin_count_19_V(3),
      I3 => max_bin_r_19_V(2),
      I4 => max_bin_r_51_V(2),
      I5 => \icmp_ln895_51_reg_4998[0]_i_1_n_0\,
      O => select_ln432_58_fu_3087_p3(2)
    );
\select_ln432_58_reg_5218[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"B200B200FF4DB200"
    )
        port map (
      I0 => \select_ln432_58_reg_5218[6]_i_3_n_0\,
      I1 => max_bin_count_51_V(3),
      I2 => max_bin_count_19_V(3),
      I3 => max_bin_r_19_V(3),
      I4 => max_bin_r_51_V(3),
      I5 => \icmp_ln895_51_reg_4998[0]_i_1_n_0\,
      O => select_ln432_58_fu_3087_p3(3)
    );
\select_ln432_58_reg_5218[4]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"B200B200FF4DB200"
    )
        port map (
      I0 => \select_ln432_58_reg_5218[6]_i_3_n_0\,
      I1 => max_bin_count_51_V(3),
      I2 => max_bin_count_19_V(3),
      I3 => max_bin_r_19_V(4),
      I4 => max_bin_r_51_V(4),
      I5 => \icmp_ln895_51_reg_4998[0]_i_1_n_0\,
      O => select_ln432_58_fu_3087_p3(4)
    );
\select_ln432_58_reg_5218[5]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"B200B200FF4DB200"
    )
        port map (
      I0 => \select_ln432_58_reg_5218[6]_i_3_n_0\,
      I1 => max_bin_count_51_V(3),
      I2 => max_bin_count_19_V(3),
      I3 => max_bin_r_19_V(5),
      I4 => max_bin_r_51_V(5),
      I5 => \icmp_ln895_51_reg_4998[0]_i_1_n_0\,
      O => select_ln432_58_fu_3087_p3(5)
    );
\select_ln432_58_reg_5218[6]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000002"
    )
        port map (
      I0 => \select_ln432_58_reg_5218[6]_i_3_n_0\,
      I1 => max_bin_count_51_V(3),
      I2 => max_bin_count_19_V(3),
      I3 => max_bin_count_19_V(0),
      I4 => max_bin_count_19_V(1),
      I5 => max_bin_count_19_V(2),
      O => select_ln432_58_reg_5218
    );
\select_ln432_58_reg_5218[6]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"B200B200FF4DB200"
    )
        port map (
      I0 => \select_ln432_58_reg_5218[6]_i_3_n_0\,
      I1 => max_bin_count_51_V(3),
      I2 => max_bin_count_19_V(3),
      I3 => max_bin_r_19_V(6),
      I4 => max_bin_r_51_V(6),
      I5 => \icmp_ln895_51_reg_4998[0]_i_1_n_0\,
      O => select_ln432_58_fu_3087_p3(6)
    );
\select_ln432_58_reg_5218[6]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"2F02FFFF00002F02"
    )
        port map (
      I0 => max_bin_count_19_V(0),
      I1 => max_bin_count_51_V(0),
      I2 => max_bin_count_51_V(1),
      I3 => max_bin_count_19_V(1),
      I4 => max_bin_count_51_V(2),
      I5 => max_bin_count_19_V(2),
      O => \select_ln432_58_reg_5218[6]_i_3_n_0\
    );
\select_ln432_58_reg_5218_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => select_ln432_58_fu_3087_p3(0),
      Q => \select_ln432_58_reg_5218_reg_n_0_[0]\,
      R => select_ln432_58_reg_5218
    );
\select_ln432_58_reg_5218_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => select_ln432_58_fu_3087_p3(1),
      Q => \select_ln432_58_reg_5218_reg_n_0_[1]\,
      R => select_ln432_58_reg_5218
    );
\select_ln432_58_reg_5218_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => select_ln432_58_fu_3087_p3(2),
      Q => \select_ln432_58_reg_5218_reg_n_0_[2]\,
      R => select_ln432_58_reg_5218
    );
\select_ln432_58_reg_5218_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => select_ln432_58_fu_3087_p3(3),
      Q => \select_ln432_58_reg_5218_reg_n_0_[3]\,
      R => select_ln432_58_reg_5218
    );
\select_ln432_58_reg_5218_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => select_ln432_58_fu_3087_p3(4),
      Q => \select_ln432_58_reg_5218_reg_n_0_[4]\,
      R => select_ln432_58_reg_5218
    );
\select_ln432_58_reg_5218_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => select_ln432_58_fu_3087_p3(5),
      Q => \select_ln432_58_reg_5218_reg_n_0_[5]\,
      R => select_ln432_58_reg_5218
    );
\select_ln432_58_reg_5218_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => select_ln432_58_fu_3087_p3(6),
      Q => \select_ln432_58_reg_5218_reg_n_0_[6]\,
      R => select_ln432_58_reg_5218
    );
\select_ln432_61_reg_5228[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"B200B200FF4DB200"
    )
        port map (
      I0 => \select_ln432_61_reg_5228[6]_i_3_n_0\,
      I1 => max_bin_count_52_V(3),
      I2 => max_bin_count_20_V(3),
      I3 => max_bin_r_20_V(0),
      I4 => max_bin_r_52_V(0),
      I5 => \icmp_ln895_52_reg_5003[0]_i_1_n_0\,
      O => select_ln432_61_fu_3104_p3(0)
    );
\select_ln432_61_reg_5228[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"B200B200FF4DB200"
    )
        port map (
      I0 => \select_ln432_61_reg_5228[6]_i_3_n_0\,
      I1 => max_bin_count_52_V(3),
      I2 => max_bin_count_20_V(3),
      I3 => max_bin_r_20_V(1),
      I4 => max_bin_r_52_V(1),
      I5 => \icmp_ln895_52_reg_5003[0]_i_1_n_0\,
      O => select_ln432_61_fu_3104_p3(1)
    );
\select_ln432_61_reg_5228[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"B200B200FF4DB200"
    )
        port map (
      I0 => \select_ln432_61_reg_5228[6]_i_3_n_0\,
      I1 => max_bin_count_52_V(3),
      I2 => max_bin_count_20_V(3),
      I3 => max_bin_r_20_V(2),
      I4 => max_bin_r_52_V(2),
      I5 => \icmp_ln895_52_reg_5003[0]_i_1_n_0\,
      O => select_ln432_61_fu_3104_p3(2)
    );
\select_ln432_61_reg_5228[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"B200B200FF4DB200"
    )
        port map (
      I0 => \select_ln432_61_reg_5228[6]_i_3_n_0\,
      I1 => max_bin_count_52_V(3),
      I2 => max_bin_count_20_V(3),
      I3 => max_bin_r_20_V(3),
      I4 => max_bin_r_52_V(3),
      I5 => \icmp_ln895_52_reg_5003[0]_i_1_n_0\,
      O => select_ln432_61_fu_3104_p3(3)
    );
\select_ln432_61_reg_5228[4]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"B200B200FF4DB200"
    )
        port map (
      I0 => \select_ln432_61_reg_5228[6]_i_3_n_0\,
      I1 => max_bin_count_52_V(3),
      I2 => max_bin_count_20_V(3),
      I3 => max_bin_r_20_V(4),
      I4 => max_bin_r_52_V(4),
      I5 => \icmp_ln895_52_reg_5003[0]_i_1_n_0\,
      O => select_ln432_61_fu_3104_p3(4)
    );
\select_ln432_61_reg_5228[5]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"B200B200FF4DB200"
    )
        port map (
      I0 => \select_ln432_61_reg_5228[6]_i_3_n_0\,
      I1 => max_bin_count_52_V(3),
      I2 => max_bin_count_20_V(3),
      I3 => max_bin_r_20_V(5),
      I4 => max_bin_r_52_V(5),
      I5 => \icmp_ln895_52_reg_5003[0]_i_1_n_0\,
      O => select_ln432_61_fu_3104_p3(5)
    );
\select_ln432_61_reg_5228[6]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000002"
    )
        port map (
      I0 => \select_ln432_61_reg_5228[6]_i_3_n_0\,
      I1 => max_bin_count_52_V(3),
      I2 => max_bin_count_20_V(3),
      I3 => max_bin_count_20_V(0),
      I4 => max_bin_count_20_V(1),
      I5 => max_bin_count_20_V(2),
      O => select_ln432_61_reg_5228
    );
\select_ln432_61_reg_5228[6]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"B200B200FF4DB200"
    )
        port map (
      I0 => \select_ln432_61_reg_5228[6]_i_3_n_0\,
      I1 => max_bin_count_52_V(3),
      I2 => max_bin_count_20_V(3),
      I3 => max_bin_r_20_V(6),
      I4 => max_bin_r_52_V(6),
      I5 => \icmp_ln895_52_reg_5003[0]_i_1_n_0\,
      O => select_ln432_61_fu_3104_p3(6)
    );
\select_ln432_61_reg_5228[6]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"2F02FFFF00002F02"
    )
        port map (
      I0 => max_bin_count_20_V(0),
      I1 => max_bin_count_52_V(0),
      I2 => max_bin_count_52_V(1),
      I3 => max_bin_count_20_V(1),
      I4 => max_bin_count_52_V(2),
      I5 => max_bin_count_20_V(2),
      O => \select_ln432_61_reg_5228[6]_i_3_n_0\
    );
\select_ln432_61_reg_5228_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => select_ln432_61_fu_3104_p3(0),
      Q => \select_ln432_61_reg_5228_reg_n_0_[0]\,
      R => select_ln432_61_reg_5228
    );
\select_ln432_61_reg_5228_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => select_ln432_61_fu_3104_p3(1),
      Q => \select_ln432_61_reg_5228_reg_n_0_[1]\,
      R => select_ln432_61_reg_5228
    );
\select_ln432_61_reg_5228_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => select_ln432_61_fu_3104_p3(2),
      Q => \select_ln432_61_reg_5228_reg_n_0_[2]\,
      R => select_ln432_61_reg_5228
    );
\select_ln432_61_reg_5228_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => select_ln432_61_fu_3104_p3(3),
      Q => \select_ln432_61_reg_5228_reg_n_0_[3]\,
      R => select_ln432_61_reg_5228
    );
\select_ln432_61_reg_5228_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => select_ln432_61_fu_3104_p3(4),
      Q => \select_ln432_61_reg_5228_reg_n_0_[4]\,
      R => select_ln432_61_reg_5228
    );
\select_ln432_61_reg_5228_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => select_ln432_61_fu_3104_p3(5),
      Q => \select_ln432_61_reg_5228_reg_n_0_[5]\,
      R => select_ln432_61_reg_5228
    );
\select_ln432_61_reg_5228_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => select_ln432_61_fu_3104_p3(6),
      Q => \select_ln432_61_reg_5228_reg_n_0_[6]\,
      R => select_ln432_61_reg_5228
    );
\select_ln432_64_reg_5238[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"B200B200FF4DB200"
    )
        port map (
      I0 => \select_ln432_64_reg_5238[6]_i_3_n_0\,
      I1 => max_bin_count_53_V(3),
      I2 => max_bin_count_21_V(3),
      I3 => max_bin_r_21_V(0),
      I4 => max_bin_r_53_V(0),
      I5 => \icmp_ln895_53_reg_5008[0]_i_1_n_0\,
      O => select_ln432_64_fu_3121_p3(0)
    );
\select_ln432_64_reg_5238[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"B200B200FF4DB200"
    )
        port map (
      I0 => \select_ln432_64_reg_5238[6]_i_3_n_0\,
      I1 => max_bin_count_53_V(3),
      I2 => max_bin_count_21_V(3),
      I3 => max_bin_r_21_V(1),
      I4 => max_bin_r_53_V(1),
      I5 => \icmp_ln895_53_reg_5008[0]_i_1_n_0\,
      O => select_ln432_64_fu_3121_p3(1)
    );
\select_ln432_64_reg_5238[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"B200B200FF4DB200"
    )
        port map (
      I0 => \select_ln432_64_reg_5238[6]_i_3_n_0\,
      I1 => max_bin_count_53_V(3),
      I2 => max_bin_count_21_V(3),
      I3 => max_bin_r_21_V(2),
      I4 => max_bin_r_53_V(2),
      I5 => \icmp_ln895_53_reg_5008[0]_i_1_n_0\,
      O => select_ln432_64_fu_3121_p3(2)
    );
\select_ln432_64_reg_5238[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"B200B200FF4DB200"
    )
        port map (
      I0 => \select_ln432_64_reg_5238[6]_i_3_n_0\,
      I1 => max_bin_count_53_V(3),
      I2 => max_bin_count_21_V(3),
      I3 => max_bin_r_21_V(3),
      I4 => max_bin_r_53_V(3),
      I5 => \icmp_ln895_53_reg_5008[0]_i_1_n_0\,
      O => select_ln432_64_fu_3121_p3(3)
    );
\select_ln432_64_reg_5238[4]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"B200B200FF4DB200"
    )
        port map (
      I0 => \select_ln432_64_reg_5238[6]_i_3_n_0\,
      I1 => max_bin_count_53_V(3),
      I2 => max_bin_count_21_V(3),
      I3 => max_bin_r_21_V(4),
      I4 => max_bin_r_53_V(4),
      I5 => \icmp_ln895_53_reg_5008[0]_i_1_n_0\,
      O => select_ln432_64_fu_3121_p3(4)
    );
\select_ln432_64_reg_5238[5]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"B200B200FF4DB200"
    )
        port map (
      I0 => \select_ln432_64_reg_5238[6]_i_3_n_0\,
      I1 => max_bin_count_53_V(3),
      I2 => max_bin_count_21_V(3),
      I3 => max_bin_r_21_V(5),
      I4 => max_bin_r_53_V(5),
      I5 => \icmp_ln895_53_reg_5008[0]_i_1_n_0\,
      O => select_ln432_64_fu_3121_p3(5)
    );
\select_ln432_64_reg_5238[6]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000002"
    )
        port map (
      I0 => \select_ln432_64_reg_5238[6]_i_3_n_0\,
      I1 => max_bin_count_53_V(3),
      I2 => max_bin_count_21_V(3),
      I3 => max_bin_count_21_V(0),
      I4 => max_bin_count_21_V(1),
      I5 => max_bin_count_21_V(2),
      O => select_ln432_64_reg_5238
    );
\select_ln432_64_reg_5238[6]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"B200B200FF4DB200"
    )
        port map (
      I0 => \select_ln432_64_reg_5238[6]_i_3_n_0\,
      I1 => max_bin_count_53_V(3),
      I2 => max_bin_count_21_V(3),
      I3 => max_bin_r_21_V(6),
      I4 => max_bin_r_53_V(6),
      I5 => \icmp_ln895_53_reg_5008[0]_i_1_n_0\,
      O => select_ln432_64_fu_3121_p3(6)
    );
\select_ln432_64_reg_5238[6]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"2F02FFFF00002F02"
    )
        port map (
      I0 => max_bin_count_21_V(0),
      I1 => max_bin_count_53_V(0),
      I2 => max_bin_count_53_V(1),
      I3 => max_bin_count_21_V(1),
      I4 => max_bin_count_53_V(2),
      I5 => max_bin_count_21_V(2),
      O => \select_ln432_64_reg_5238[6]_i_3_n_0\
    );
\select_ln432_64_reg_5238_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => select_ln432_64_fu_3121_p3(0),
      Q => \select_ln432_64_reg_5238_reg_n_0_[0]\,
      R => select_ln432_64_reg_5238
    );
\select_ln432_64_reg_5238_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => select_ln432_64_fu_3121_p3(1),
      Q => \select_ln432_64_reg_5238_reg_n_0_[1]\,
      R => select_ln432_64_reg_5238
    );
\select_ln432_64_reg_5238_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => select_ln432_64_fu_3121_p3(2),
      Q => \select_ln432_64_reg_5238_reg_n_0_[2]\,
      R => select_ln432_64_reg_5238
    );
\select_ln432_64_reg_5238_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => select_ln432_64_fu_3121_p3(3),
      Q => \select_ln432_64_reg_5238_reg_n_0_[3]\,
      R => select_ln432_64_reg_5238
    );
\select_ln432_64_reg_5238_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => select_ln432_64_fu_3121_p3(4),
      Q => \select_ln432_64_reg_5238_reg_n_0_[4]\,
      R => select_ln432_64_reg_5238
    );
\select_ln432_64_reg_5238_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => select_ln432_64_fu_3121_p3(5),
      Q => \select_ln432_64_reg_5238_reg_n_0_[5]\,
      R => select_ln432_64_reg_5238
    );
\select_ln432_64_reg_5238_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => select_ln432_64_fu_3121_p3(6),
      Q => \select_ln432_64_reg_5238_reg_n_0_[6]\,
      R => select_ln432_64_reg_5238
    );
\select_ln432_67_reg_5248[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"B200B200FF4DB200"
    )
        port map (
      I0 => \select_ln432_67_reg_5248[6]_i_3_n_0\,
      I1 => max_bin_count_54_V(3),
      I2 => max_bin_count_22_V(3),
      I3 => max_bin_r_22_V(0),
      I4 => max_bin_r_54_V(0),
      I5 => \icmp_ln895_54_reg_5013[0]_i_1_n_0\,
      O => select_ln432_67_fu_3138_p3(0)
    );
\select_ln432_67_reg_5248[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"B200B200FF4DB200"
    )
        port map (
      I0 => \select_ln432_67_reg_5248[6]_i_3_n_0\,
      I1 => max_bin_count_54_V(3),
      I2 => max_bin_count_22_V(3),
      I3 => max_bin_r_22_V(1),
      I4 => max_bin_r_54_V(1),
      I5 => \icmp_ln895_54_reg_5013[0]_i_1_n_0\,
      O => select_ln432_67_fu_3138_p3(1)
    );
\select_ln432_67_reg_5248[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"B200B200FF4DB200"
    )
        port map (
      I0 => \select_ln432_67_reg_5248[6]_i_3_n_0\,
      I1 => max_bin_count_54_V(3),
      I2 => max_bin_count_22_V(3),
      I3 => max_bin_r_22_V(2),
      I4 => max_bin_r_54_V(2),
      I5 => \icmp_ln895_54_reg_5013[0]_i_1_n_0\,
      O => select_ln432_67_fu_3138_p3(2)
    );
\select_ln432_67_reg_5248[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"B200B200FF4DB200"
    )
        port map (
      I0 => \select_ln432_67_reg_5248[6]_i_3_n_0\,
      I1 => max_bin_count_54_V(3),
      I2 => max_bin_count_22_V(3),
      I3 => max_bin_r_22_V(3),
      I4 => max_bin_r_54_V(3),
      I5 => \icmp_ln895_54_reg_5013[0]_i_1_n_0\,
      O => select_ln432_67_fu_3138_p3(3)
    );
\select_ln432_67_reg_5248[4]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"B200B200FF4DB200"
    )
        port map (
      I0 => \select_ln432_67_reg_5248[6]_i_3_n_0\,
      I1 => max_bin_count_54_V(3),
      I2 => max_bin_count_22_V(3),
      I3 => max_bin_r_22_V(4),
      I4 => max_bin_r_54_V(4),
      I5 => \icmp_ln895_54_reg_5013[0]_i_1_n_0\,
      O => select_ln432_67_fu_3138_p3(4)
    );
\select_ln432_67_reg_5248[5]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"B200B200FF4DB200"
    )
        port map (
      I0 => \select_ln432_67_reg_5248[6]_i_3_n_0\,
      I1 => max_bin_count_54_V(3),
      I2 => max_bin_count_22_V(3),
      I3 => max_bin_r_22_V(5),
      I4 => max_bin_r_54_V(5),
      I5 => \icmp_ln895_54_reg_5013[0]_i_1_n_0\,
      O => select_ln432_67_fu_3138_p3(5)
    );
\select_ln432_67_reg_5248[6]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000002"
    )
        port map (
      I0 => \select_ln432_67_reg_5248[6]_i_3_n_0\,
      I1 => max_bin_count_54_V(3),
      I2 => max_bin_count_22_V(3),
      I3 => max_bin_count_22_V(0),
      I4 => max_bin_count_22_V(1),
      I5 => max_bin_count_22_V(2),
      O => select_ln432_67_reg_5248
    );
\select_ln432_67_reg_5248[6]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"B200B200FF4DB200"
    )
        port map (
      I0 => \select_ln432_67_reg_5248[6]_i_3_n_0\,
      I1 => max_bin_count_54_V(3),
      I2 => max_bin_count_22_V(3),
      I3 => max_bin_r_22_V(6),
      I4 => max_bin_r_54_V(6),
      I5 => \icmp_ln895_54_reg_5013[0]_i_1_n_0\,
      O => select_ln432_67_fu_3138_p3(6)
    );
\select_ln432_67_reg_5248[6]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"2F02FFFF00002F02"
    )
        port map (
      I0 => max_bin_count_22_V(0),
      I1 => max_bin_count_54_V(0),
      I2 => max_bin_count_54_V(1),
      I3 => max_bin_count_22_V(1),
      I4 => max_bin_count_54_V(2),
      I5 => max_bin_count_22_V(2),
      O => \select_ln432_67_reg_5248[6]_i_3_n_0\
    );
\select_ln432_67_reg_5248_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => select_ln432_67_fu_3138_p3(0),
      Q => \select_ln432_67_reg_5248_reg_n_0_[0]\,
      R => select_ln432_67_reg_5248
    );
\select_ln432_67_reg_5248_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => select_ln432_67_fu_3138_p3(1),
      Q => \select_ln432_67_reg_5248_reg_n_0_[1]\,
      R => select_ln432_67_reg_5248
    );
\select_ln432_67_reg_5248_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => select_ln432_67_fu_3138_p3(2),
      Q => \select_ln432_67_reg_5248_reg_n_0_[2]\,
      R => select_ln432_67_reg_5248
    );
\select_ln432_67_reg_5248_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => select_ln432_67_fu_3138_p3(3),
      Q => \select_ln432_67_reg_5248_reg_n_0_[3]\,
      R => select_ln432_67_reg_5248
    );
\select_ln432_67_reg_5248_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => select_ln432_67_fu_3138_p3(4),
      Q => \select_ln432_67_reg_5248_reg_n_0_[4]\,
      R => select_ln432_67_reg_5248
    );
\select_ln432_67_reg_5248_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => select_ln432_67_fu_3138_p3(5),
      Q => \select_ln432_67_reg_5248_reg_n_0_[5]\,
      R => select_ln432_67_reg_5248
    );
\select_ln432_67_reg_5248_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => select_ln432_67_fu_3138_p3(6),
      Q => \select_ln432_67_reg_5248_reg_n_0_[6]\,
      R => select_ln432_67_reg_5248
    );
\select_ln432_70_reg_5258[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"B200B200FF4DB200"
    )
        port map (
      I0 => \select_ln432_70_reg_5258[6]_i_3_n_0\,
      I1 => max_bin_count_55_V(3),
      I2 => max_bin_count_23_V(3),
      I3 => max_bin_r_23_V(0),
      I4 => max_bin_r_55_V(0),
      I5 => \icmp_ln895_55_reg_5018[0]_i_1_n_0\,
      O => select_ln432_70_fu_3155_p3(0)
    );
\select_ln432_70_reg_5258[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"B200B200FF4DB200"
    )
        port map (
      I0 => \select_ln432_70_reg_5258[6]_i_3_n_0\,
      I1 => max_bin_count_55_V(3),
      I2 => max_bin_count_23_V(3),
      I3 => max_bin_r_23_V(1),
      I4 => max_bin_r_55_V(1),
      I5 => \icmp_ln895_55_reg_5018[0]_i_1_n_0\,
      O => select_ln432_70_fu_3155_p3(1)
    );
\select_ln432_70_reg_5258[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"B200B200FF4DB200"
    )
        port map (
      I0 => \select_ln432_70_reg_5258[6]_i_3_n_0\,
      I1 => max_bin_count_55_V(3),
      I2 => max_bin_count_23_V(3),
      I3 => max_bin_r_23_V(2),
      I4 => max_bin_r_55_V(2),
      I5 => \icmp_ln895_55_reg_5018[0]_i_1_n_0\,
      O => select_ln432_70_fu_3155_p3(2)
    );
\select_ln432_70_reg_5258[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"B200B200FF4DB200"
    )
        port map (
      I0 => \select_ln432_70_reg_5258[6]_i_3_n_0\,
      I1 => max_bin_count_55_V(3),
      I2 => max_bin_count_23_V(3),
      I3 => max_bin_r_23_V(3),
      I4 => max_bin_r_55_V(3),
      I5 => \icmp_ln895_55_reg_5018[0]_i_1_n_0\,
      O => select_ln432_70_fu_3155_p3(3)
    );
\select_ln432_70_reg_5258[4]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"B200B200FF4DB200"
    )
        port map (
      I0 => \select_ln432_70_reg_5258[6]_i_3_n_0\,
      I1 => max_bin_count_55_V(3),
      I2 => max_bin_count_23_V(3),
      I3 => max_bin_r_23_V(4),
      I4 => max_bin_r_55_V(4),
      I5 => \icmp_ln895_55_reg_5018[0]_i_1_n_0\,
      O => select_ln432_70_fu_3155_p3(4)
    );
\select_ln432_70_reg_5258[5]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"B200B200FF4DB200"
    )
        port map (
      I0 => \select_ln432_70_reg_5258[6]_i_3_n_0\,
      I1 => max_bin_count_55_V(3),
      I2 => max_bin_count_23_V(3),
      I3 => max_bin_r_23_V(5),
      I4 => max_bin_r_55_V(5),
      I5 => \icmp_ln895_55_reg_5018[0]_i_1_n_0\,
      O => select_ln432_70_fu_3155_p3(5)
    );
\select_ln432_70_reg_5258[6]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000002"
    )
        port map (
      I0 => \select_ln432_70_reg_5258[6]_i_3_n_0\,
      I1 => max_bin_count_55_V(3),
      I2 => max_bin_count_23_V(3),
      I3 => max_bin_count_23_V(0),
      I4 => max_bin_count_23_V(1),
      I5 => max_bin_count_23_V(2),
      O => select_ln432_70_reg_5258
    );
\select_ln432_70_reg_5258[6]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"B200B200FF4DB200"
    )
        port map (
      I0 => \select_ln432_70_reg_5258[6]_i_3_n_0\,
      I1 => max_bin_count_55_V(3),
      I2 => max_bin_count_23_V(3),
      I3 => max_bin_r_23_V(6),
      I4 => max_bin_r_55_V(6),
      I5 => \icmp_ln895_55_reg_5018[0]_i_1_n_0\,
      O => select_ln432_70_fu_3155_p3(6)
    );
\select_ln432_70_reg_5258[6]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"2F02FFFF00002F02"
    )
        port map (
      I0 => max_bin_count_23_V(0),
      I1 => max_bin_count_55_V(0),
      I2 => max_bin_count_55_V(1),
      I3 => max_bin_count_23_V(1),
      I4 => max_bin_count_55_V(2),
      I5 => max_bin_count_23_V(2),
      O => \select_ln432_70_reg_5258[6]_i_3_n_0\
    );
\select_ln432_70_reg_5258_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => select_ln432_70_fu_3155_p3(0),
      Q => \select_ln432_70_reg_5258_reg_n_0_[0]\,
      R => select_ln432_70_reg_5258
    );
\select_ln432_70_reg_5258_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => select_ln432_70_fu_3155_p3(1),
      Q => \select_ln432_70_reg_5258_reg_n_0_[1]\,
      R => select_ln432_70_reg_5258
    );
\select_ln432_70_reg_5258_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => select_ln432_70_fu_3155_p3(2),
      Q => \select_ln432_70_reg_5258_reg_n_0_[2]\,
      R => select_ln432_70_reg_5258
    );
\select_ln432_70_reg_5258_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => select_ln432_70_fu_3155_p3(3),
      Q => \select_ln432_70_reg_5258_reg_n_0_[3]\,
      R => select_ln432_70_reg_5258
    );
\select_ln432_70_reg_5258_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => select_ln432_70_fu_3155_p3(4),
      Q => \select_ln432_70_reg_5258_reg_n_0_[4]\,
      R => select_ln432_70_reg_5258
    );
\select_ln432_70_reg_5258_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => select_ln432_70_fu_3155_p3(5),
      Q => \select_ln432_70_reg_5258_reg_n_0_[5]\,
      R => select_ln432_70_reg_5258
    );
\select_ln432_70_reg_5258_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => select_ln432_70_fu_3155_p3(6),
      Q => \select_ln432_70_reg_5258_reg_n_0_[6]\,
      R => select_ln432_70_reg_5258
    );
\select_ln432_7_reg_5088[0]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"88B8"
    )
        port map (
      I0 => max_bin_r_2_V(0),
      I1 => \icmp_ln895_67_reg_5083[0]_i_1_n_0\,
      I2 => max_bin_r_34_V(0),
      I3 => \icmp_ln895_34_reg_4913[0]_i_1_n_0\,
      O => select_ln432_7_fu_2798_p3(0)
    );
\select_ln432_7_reg_5088[1]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"88B8"
    )
        port map (
      I0 => max_bin_r_2_V(1),
      I1 => \icmp_ln895_67_reg_5083[0]_i_1_n_0\,
      I2 => max_bin_r_34_V(1),
      I3 => \icmp_ln895_34_reg_4913[0]_i_1_n_0\,
      O => select_ln432_7_fu_2798_p3(1)
    );
\select_ln432_7_reg_5088[2]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"88B8"
    )
        port map (
      I0 => max_bin_r_2_V(2),
      I1 => \icmp_ln895_67_reg_5083[0]_i_1_n_0\,
      I2 => max_bin_r_34_V(2),
      I3 => \icmp_ln895_34_reg_4913[0]_i_1_n_0\,
      O => select_ln432_7_fu_2798_p3(2)
    );
\select_ln432_7_reg_5088[3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"88B8"
    )
        port map (
      I0 => max_bin_r_2_V(3),
      I1 => \icmp_ln895_67_reg_5083[0]_i_1_n_0\,
      I2 => max_bin_r_34_V(3),
      I3 => \icmp_ln895_34_reg_4913[0]_i_1_n_0\,
      O => select_ln432_7_fu_2798_p3(3)
    );
\select_ln432_7_reg_5088[4]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"88B8"
    )
        port map (
      I0 => max_bin_r_2_V(4),
      I1 => \icmp_ln895_67_reg_5083[0]_i_1_n_0\,
      I2 => max_bin_r_34_V(4),
      I3 => \icmp_ln895_34_reg_4913[0]_i_1_n_0\,
      O => select_ln432_7_fu_2798_p3(4)
    );
\select_ln432_7_reg_5088[5]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"88B8"
    )
        port map (
      I0 => max_bin_r_2_V(5),
      I1 => \icmp_ln895_67_reg_5083[0]_i_1_n_0\,
      I2 => max_bin_r_34_V(5),
      I3 => \icmp_ln895_34_reg_4913[0]_i_1_n_0\,
      O => select_ln432_7_fu_2798_p3(5)
    );
\select_ln432_7_reg_5088[6]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000002"
    )
        port map (
      I0 => \icmp_ln895_67_reg_5083[0]_i_1_n_0\,
      I1 => max_bin_count_2_V(0),
      I2 => max_bin_count_2_V(1),
      I3 => max_bin_count_2_V(3),
      I4 => max_bin_count_2_V(2),
      O => select_ln432_7_reg_5088
    );
\select_ln432_7_reg_5088[6]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"88B8"
    )
        port map (
      I0 => max_bin_r_2_V(6),
      I1 => \icmp_ln895_67_reg_5083[0]_i_1_n_0\,
      I2 => max_bin_r_34_V(6),
      I3 => \icmp_ln895_34_reg_4913[0]_i_1_n_0\,
      O => select_ln432_7_fu_2798_p3(6)
    );
\select_ln432_7_reg_5088_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => select_ln432_7_fu_2798_p3(0),
      Q => \select_ln432_7_reg_5088_reg_n_0_[0]\,
      R => select_ln432_7_reg_5088
    );
\select_ln432_7_reg_5088_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => select_ln432_7_fu_2798_p3(1),
      Q => \select_ln432_7_reg_5088_reg_n_0_[1]\,
      R => select_ln432_7_reg_5088
    );
\select_ln432_7_reg_5088_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => select_ln432_7_fu_2798_p3(2),
      Q => \select_ln432_7_reg_5088_reg_n_0_[2]\,
      R => select_ln432_7_reg_5088
    );
\select_ln432_7_reg_5088_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => select_ln432_7_fu_2798_p3(3),
      Q => \select_ln432_7_reg_5088_reg_n_0_[3]\,
      R => select_ln432_7_reg_5088
    );
\select_ln432_7_reg_5088_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => select_ln432_7_fu_2798_p3(4),
      Q => \select_ln432_7_reg_5088_reg_n_0_[4]\,
      R => select_ln432_7_reg_5088
    );
\select_ln432_7_reg_5088_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => select_ln432_7_fu_2798_p3(5),
      Q => \select_ln432_7_reg_5088_reg_n_0_[5]\,
      R => select_ln432_7_reg_5088
    );
\select_ln432_7_reg_5088_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => select_ln432_7_fu_2798_p3(6),
      Q => \select_ln432_7_reg_5088_reg_n_0_[6]\,
      R => select_ln432_7_reg_5088
    );
\select_ln450_11_reg_5342[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0F0FE10FE10FF00"
    )
        port map (
      I0 => max_bin_count_51_V(3),
      I1 => max_bin_count_19_V(3),
      I2 => select_ln432_11_fu_2823_p3(0),
      I3 => select_ln432_59_fu_3095_p3(0),
      I4 => \select_ln450_11_reg_5342[1]_i_4_n_0\,
      I5 => select_ln432_11_fu_2823_p3(3),
      O => select_ln450_11_fu_3335_p3(0)
    );
\select_ln450_11_reg_5342[0]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"ACAACCAC"
    )
        port map (
      I0 => max_bin_count_3_V(0),
      I1 => max_bin_count_35_V(0),
      I2 => \icmp_ln895_68_reg_5093[0]_i_2_n_0\,
      I3 => max_bin_count_35_V(3),
      I4 => max_bin_count_3_V(3),
      O => select_ln432_11_fu_2823_p3(0)
    );
\select_ln450_11_reg_5342[0]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"ACAACCAC"
    )
        port map (
      I0 => max_bin_count_19_V(0),
      I1 => max_bin_count_51_V(0),
      I2 => \select_ln432_58_reg_5218[6]_i_3_n_0\,
      I3 => max_bin_count_51_V(3),
      I4 => max_bin_count_19_V(3),
      O => select_ln432_59_fu_3095_p3(0)
    );
\select_ln450_11_reg_5342[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0F0FE10FE10FF00"
    )
        port map (
      I0 => max_bin_count_51_V(3),
      I1 => max_bin_count_19_V(3),
      I2 => select_ln432_11_fu_2823_p3(1),
      I3 => select_ln432_59_fu_3095_p3(1),
      I4 => \select_ln450_11_reg_5342[1]_i_4_n_0\,
      I5 => select_ln432_11_fu_2823_p3(3),
      O => select_ln450_11_fu_3335_p3(1)
    );
\select_ln450_11_reg_5342[1]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"ACAACCAC"
    )
        port map (
      I0 => max_bin_count_3_V(1),
      I1 => max_bin_count_35_V(1),
      I2 => \icmp_ln895_68_reg_5093[0]_i_2_n_0\,
      I3 => max_bin_count_35_V(3),
      I4 => max_bin_count_3_V(3),
      O => select_ln432_11_fu_2823_p3(1)
    );
\select_ln450_11_reg_5342[1]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"ACAACCAC"
    )
        port map (
      I0 => max_bin_count_19_V(1),
      I1 => max_bin_count_51_V(1),
      I2 => \select_ln432_58_reg_5218[6]_i_3_n_0\,
      I3 => max_bin_count_51_V(3),
      I4 => max_bin_count_19_V(3),
      O => select_ln432_59_fu_3095_p3(1)
    );
\select_ln450_11_reg_5342[1]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"2F02FFFF00002F02"
    )
        port map (
      I0 => select_ln432_11_fu_2823_p3(0),
      I1 => select_ln432_59_fu_3095_p3(0),
      I2 => select_ln432_59_fu_3095_p3(1),
      I3 => select_ln432_11_fu_2823_p3(1),
      I4 => select_ln432_59_fu_3095_p3(2),
      I5 => select_ln432_11_fu_2823_p3(2),
      O => \select_ln450_11_reg_5342[1]_i_4_n_0\
    );
\select_ln450_11_reg_5342[1]_i_5\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => max_bin_count_3_V(3),
      I1 => max_bin_count_35_V(3),
      I2 => \icmp_ln895_68_reg_5093[0]_i_1_n_0\,
      O => select_ln432_11_fu_2823_p3(3)
    );
\select_ln450_11_reg_5342[2]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"ACACFF00"
    )
        port map (
      I0 => max_bin_count_3_V(2),
      I1 => max_bin_count_35_V(2),
      I2 => \icmp_ln895_68_reg_5093[0]_i_1_n_0\,
      I3 => select_ln432_59_fu_3095_p3(2),
      I4 => \icmp_ln895_100_reg_5336[0]_i_1_n_0\,
      O => select_ln450_11_fu_3335_p3(2)
    );
\select_ln450_11_reg_5342[2]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"ACAACCAC"
    )
        port map (
      I0 => max_bin_count_19_V(2),
      I1 => max_bin_count_51_V(2),
      I2 => \select_ln432_58_reg_5218[6]_i_3_n_0\,
      I3 => max_bin_count_51_V(3),
      I4 => max_bin_count_19_V(3),
      O => select_ln432_59_fu_3095_p3(2)
    );
\select_ln450_11_reg_5342[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0F0FF00EEEEEEEE"
    )
        port map (
      I0 => max_bin_count_51_V(3),
      I1 => max_bin_count_19_V(3),
      I2 => max_bin_count_3_V(3),
      I3 => max_bin_count_35_V(3),
      I4 => \icmp_ln895_68_reg_5093[0]_i_1_n_0\,
      I5 => \icmp_ln895_100_reg_5336[0]_i_1_n_0\,
      O => select_ln450_11_fu_3335_p3(3)
    );
\select_ln450_11_reg_5342_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => select_ln450_11_fu_3335_p3(0),
      Q => select_ln450_11_reg_5342(0),
      R => '0'
    );
\select_ln450_11_reg_5342_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => select_ln450_11_fu_3335_p3(1),
      Q => select_ln450_11_reg_5342(1),
      R => '0'
    );
\select_ln450_11_reg_5342_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => select_ln450_11_fu_3335_p3(2),
      Q => select_ln450_11_reg_5342(2),
      R => '0'
    );
\select_ln450_11_reg_5342_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => select_ln450_11_fu_3335_p3(3),
      Q => select_ln450_11_reg_5342(3),
      R => '0'
    );
\select_ln450_14_reg_5353[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0F0FE10FE10FF00"
    )
        port map (
      I0 => max_bin_count_52_V(3),
      I1 => max_bin_count_20_V(3),
      I2 => select_ln432_14_fu_2840_p3(0),
      I3 => select_ln432_62_fu_3112_p3(0),
      I4 => \select_ln450_14_reg_5353[1]_i_4_n_0\,
      I5 => select_ln432_14_fu_2840_p3(3),
      O => select_ln450_14_fu_3344_p3(0)
    );
\select_ln450_14_reg_5353[0]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"ACAACCAC"
    )
        port map (
      I0 => max_bin_count_4_V(0),
      I1 => max_bin_count_36_V(0),
      I2 => \icmp_ln895_69_reg_5103[0]_i_2_n_0\,
      I3 => max_bin_count_36_V(3),
      I4 => max_bin_count_4_V(3),
      O => select_ln432_14_fu_2840_p3(0)
    );
\select_ln450_14_reg_5353[0]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"ACAACCAC"
    )
        port map (
      I0 => max_bin_count_20_V(0),
      I1 => max_bin_count_52_V(0),
      I2 => \select_ln432_61_reg_5228[6]_i_3_n_0\,
      I3 => max_bin_count_52_V(3),
      I4 => max_bin_count_20_V(3),
      O => select_ln432_62_fu_3112_p3(0)
    );
\select_ln450_14_reg_5353[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0F0FE10FE10FF00"
    )
        port map (
      I0 => max_bin_count_52_V(3),
      I1 => max_bin_count_20_V(3),
      I2 => select_ln432_14_fu_2840_p3(1),
      I3 => select_ln432_62_fu_3112_p3(1),
      I4 => \select_ln450_14_reg_5353[1]_i_4_n_0\,
      I5 => select_ln432_14_fu_2840_p3(3),
      O => select_ln450_14_fu_3344_p3(1)
    );
\select_ln450_14_reg_5353[1]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"ACAACCAC"
    )
        port map (
      I0 => max_bin_count_4_V(1),
      I1 => max_bin_count_36_V(1),
      I2 => \icmp_ln895_69_reg_5103[0]_i_2_n_0\,
      I3 => max_bin_count_36_V(3),
      I4 => max_bin_count_4_V(3),
      O => select_ln432_14_fu_2840_p3(1)
    );
\select_ln450_14_reg_5353[1]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"ACAACCAC"
    )
        port map (
      I0 => max_bin_count_20_V(1),
      I1 => max_bin_count_52_V(1),
      I2 => \select_ln432_61_reg_5228[6]_i_3_n_0\,
      I3 => max_bin_count_52_V(3),
      I4 => max_bin_count_20_V(3),
      O => select_ln432_62_fu_3112_p3(1)
    );
\select_ln450_14_reg_5353[1]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"2F02FFFF00002F02"
    )
        port map (
      I0 => select_ln432_14_fu_2840_p3(0),
      I1 => select_ln432_62_fu_3112_p3(0),
      I2 => select_ln432_62_fu_3112_p3(1),
      I3 => select_ln432_14_fu_2840_p3(1),
      I4 => select_ln432_62_fu_3112_p3(2),
      I5 => select_ln432_14_fu_2840_p3(2),
      O => \select_ln450_14_reg_5353[1]_i_4_n_0\
    );
\select_ln450_14_reg_5353[1]_i_5\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => max_bin_count_4_V(3),
      I1 => max_bin_count_36_V(3),
      I2 => \icmp_ln895_69_reg_5103[0]_i_1_n_0\,
      O => select_ln432_14_fu_2840_p3(3)
    );
\select_ln450_14_reg_5353[2]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"ACACFF00"
    )
        port map (
      I0 => max_bin_count_4_V(2),
      I1 => max_bin_count_36_V(2),
      I2 => \icmp_ln895_69_reg_5103[0]_i_1_n_0\,
      I3 => select_ln432_62_fu_3112_p3(2),
      I4 => \icmp_ln895_101_reg_5347[0]_i_1_n_0\,
      O => select_ln450_14_fu_3344_p3(2)
    );
\select_ln450_14_reg_5353[2]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"ACAACCAC"
    )
        port map (
      I0 => max_bin_count_20_V(2),
      I1 => max_bin_count_52_V(2),
      I2 => \select_ln432_61_reg_5228[6]_i_3_n_0\,
      I3 => max_bin_count_52_V(3),
      I4 => max_bin_count_20_V(3),
      O => select_ln432_62_fu_3112_p3(2)
    );
\select_ln450_14_reg_5353[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0F0FF00EEEEEEEE"
    )
        port map (
      I0 => max_bin_count_52_V(3),
      I1 => max_bin_count_20_V(3),
      I2 => max_bin_count_4_V(3),
      I3 => max_bin_count_36_V(3),
      I4 => \icmp_ln895_69_reg_5103[0]_i_1_n_0\,
      I5 => \icmp_ln895_101_reg_5347[0]_i_1_n_0\,
      O => select_ln450_14_fu_3344_p3(3)
    );
\select_ln450_14_reg_5353_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => select_ln450_14_fu_3344_p3(0),
      Q => select_ln450_14_reg_5353(0),
      R => '0'
    );
\select_ln450_14_reg_5353_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => select_ln450_14_fu_3344_p3(1),
      Q => select_ln450_14_reg_5353(1),
      R => '0'
    );
\select_ln450_14_reg_5353_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => select_ln450_14_fu_3344_p3(2),
      Q => select_ln450_14_reg_5353(2),
      R => '0'
    );
\select_ln450_14_reg_5353_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => select_ln450_14_fu_3344_p3(3),
      Q => select_ln450_14_reg_5353(3),
      R => '0'
    );
\select_ln450_17_reg_5364[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0F0FE10FE10FF00"
    )
        port map (
      I0 => max_bin_count_53_V(3),
      I1 => max_bin_count_21_V(3),
      I2 => select_ln432_17_fu_2857_p3(0),
      I3 => select_ln432_65_fu_3129_p3(0),
      I4 => \select_ln450_17_reg_5364[1]_i_4_n_0\,
      I5 => select_ln432_17_fu_2857_p3(3),
      O => select_ln450_17_fu_3353_p3(0)
    );
\select_ln450_17_reg_5364[0]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"ACAACCAC"
    )
        port map (
      I0 => max_bin_count_5_V(0),
      I1 => max_bin_count_37_V(0),
      I2 => \icmp_ln895_70_reg_5113[0]_i_2_n_0\,
      I3 => max_bin_count_37_V(3),
      I4 => max_bin_count_5_V(3),
      O => select_ln432_17_fu_2857_p3(0)
    );
\select_ln450_17_reg_5364[0]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"ACAACCAC"
    )
        port map (
      I0 => max_bin_count_21_V(0),
      I1 => max_bin_count_53_V(0),
      I2 => \select_ln432_64_reg_5238[6]_i_3_n_0\,
      I3 => max_bin_count_53_V(3),
      I4 => max_bin_count_21_V(3),
      O => select_ln432_65_fu_3129_p3(0)
    );
\select_ln450_17_reg_5364[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0F0FE10FE10FF00"
    )
        port map (
      I0 => max_bin_count_53_V(3),
      I1 => max_bin_count_21_V(3),
      I2 => select_ln432_17_fu_2857_p3(1),
      I3 => select_ln432_65_fu_3129_p3(1),
      I4 => \select_ln450_17_reg_5364[1]_i_4_n_0\,
      I5 => select_ln432_17_fu_2857_p3(3),
      O => select_ln450_17_fu_3353_p3(1)
    );
\select_ln450_17_reg_5364[1]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"ACAACCAC"
    )
        port map (
      I0 => max_bin_count_5_V(1),
      I1 => max_bin_count_37_V(1),
      I2 => \icmp_ln895_70_reg_5113[0]_i_2_n_0\,
      I3 => max_bin_count_37_V(3),
      I4 => max_bin_count_5_V(3),
      O => select_ln432_17_fu_2857_p3(1)
    );
\select_ln450_17_reg_5364[1]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"ACAACCAC"
    )
        port map (
      I0 => max_bin_count_21_V(1),
      I1 => max_bin_count_53_V(1),
      I2 => \select_ln432_64_reg_5238[6]_i_3_n_0\,
      I3 => max_bin_count_53_V(3),
      I4 => max_bin_count_21_V(3),
      O => select_ln432_65_fu_3129_p3(1)
    );
\select_ln450_17_reg_5364[1]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"2F02FFFF00002F02"
    )
        port map (
      I0 => select_ln432_17_fu_2857_p3(0),
      I1 => select_ln432_65_fu_3129_p3(0),
      I2 => select_ln432_65_fu_3129_p3(1),
      I3 => select_ln432_17_fu_2857_p3(1),
      I4 => select_ln432_65_fu_3129_p3(2),
      I5 => select_ln432_17_fu_2857_p3(2),
      O => \select_ln450_17_reg_5364[1]_i_4_n_0\
    );
\select_ln450_17_reg_5364[1]_i_5\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => max_bin_count_5_V(3),
      I1 => max_bin_count_37_V(3),
      I2 => \icmp_ln895_70_reg_5113[0]_i_1_n_0\,
      O => select_ln432_17_fu_2857_p3(3)
    );
\select_ln450_17_reg_5364[2]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"ACACFF00"
    )
        port map (
      I0 => max_bin_count_5_V(2),
      I1 => max_bin_count_37_V(2),
      I2 => \icmp_ln895_70_reg_5113[0]_i_1_n_0\,
      I3 => select_ln432_65_fu_3129_p3(2),
      I4 => \icmp_ln895_102_reg_5358[0]_i_1_n_0\,
      O => select_ln450_17_fu_3353_p3(2)
    );
\select_ln450_17_reg_5364[2]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"ACAACCAC"
    )
        port map (
      I0 => max_bin_count_21_V(2),
      I1 => max_bin_count_53_V(2),
      I2 => \select_ln432_64_reg_5238[6]_i_3_n_0\,
      I3 => max_bin_count_53_V(3),
      I4 => max_bin_count_21_V(3),
      O => select_ln432_65_fu_3129_p3(2)
    );
\select_ln450_17_reg_5364[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0F0FF00EEEEEEEE"
    )
        port map (
      I0 => max_bin_count_53_V(3),
      I1 => max_bin_count_21_V(3),
      I2 => max_bin_count_5_V(3),
      I3 => max_bin_count_37_V(3),
      I4 => \icmp_ln895_70_reg_5113[0]_i_1_n_0\,
      I5 => \icmp_ln895_102_reg_5358[0]_i_1_n_0\,
      O => select_ln450_17_fu_3353_p3(3)
    );
\select_ln450_17_reg_5364_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => select_ln450_17_fu_3353_p3(0),
      Q => select_ln450_17_reg_5364(0),
      R => '0'
    );
\select_ln450_17_reg_5364_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => select_ln450_17_fu_3353_p3(1),
      Q => select_ln450_17_reg_5364(1),
      R => '0'
    );
\select_ln450_17_reg_5364_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => select_ln450_17_fu_3353_p3(2),
      Q => select_ln450_17_reg_5364(2),
      R => '0'
    );
\select_ln450_17_reg_5364_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => select_ln450_17_fu_3353_p3(3),
      Q => select_ln450_17_reg_5364(3),
      R => '0'
    );
\select_ln450_20_reg_5375[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0F0FE10FE10FF00"
    )
        port map (
      I0 => max_bin_count_54_V(3),
      I1 => max_bin_count_22_V(3),
      I2 => select_ln432_20_fu_2874_p3(0),
      I3 => select_ln432_68_fu_3146_p3(0),
      I4 => \select_ln450_20_reg_5375[1]_i_4_n_0\,
      I5 => select_ln432_20_fu_2874_p3(3),
      O => select_ln450_20_fu_3362_p3(0)
    );
\select_ln450_20_reg_5375[0]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"ACAACCAC"
    )
        port map (
      I0 => max_bin_count_6_V(0),
      I1 => max_bin_count_38_V(0),
      I2 => \icmp_ln895_71_reg_5123[0]_i_2_n_0\,
      I3 => max_bin_count_38_V(3),
      I4 => max_bin_count_6_V(3),
      O => select_ln432_20_fu_2874_p3(0)
    );
\select_ln450_20_reg_5375[0]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"ACAACCAC"
    )
        port map (
      I0 => max_bin_count_22_V(0),
      I1 => max_bin_count_54_V(0),
      I2 => \select_ln432_67_reg_5248[6]_i_3_n_0\,
      I3 => max_bin_count_54_V(3),
      I4 => max_bin_count_22_V(3),
      O => select_ln432_68_fu_3146_p3(0)
    );
\select_ln450_20_reg_5375[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0F0FE10FE10FF00"
    )
        port map (
      I0 => max_bin_count_54_V(3),
      I1 => max_bin_count_22_V(3),
      I2 => select_ln432_20_fu_2874_p3(1),
      I3 => select_ln432_68_fu_3146_p3(1),
      I4 => \select_ln450_20_reg_5375[1]_i_4_n_0\,
      I5 => select_ln432_20_fu_2874_p3(3),
      O => select_ln450_20_fu_3362_p3(1)
    );
\select_ln450_20_reg_5375[1]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"ACAACCAC"
    )
        port map (
      I0 => max_bin_count_6_V(1),
      I1 => max_bin_count_38_V(1),
      I2 => \icmp_ln895_71_reg_5123[0]_i_2_n_0\,
      I3 => max_bin_count_38_V(3),
      I4 => max_bin_count_6_V(3),
      O => select_ln432_20_fu_2874_p3(1)
    );
\select_ln450_20_reg_5375[1]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"ACAACCAC"
    )
        port map (
      I0 => max_bin_count_22_V(1),
      I1 => max_bin_count_54_V(1),
      I2 => \select_ln432_67_reg_5248[6]_i_3_n_0\,
      I3 => max_bin_count_54_V(3),
      I4 => max_bin_count_22_V(3),
      O => select_ln432_68_fu_3146_p3(1)
    );
\select_ln450_20_reg_5375[1]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"2F02FFFF00002F02"
    )
        port map (
      I0 => select_ln432_20_fu_2874_p3(0),
      I1 => select_ln432_68_fu_3146_p3(0),
      I2 => select_ln432_68_fu_3146_p3(1),
      I3 => select_ln432_20_fu_2874_p3(1),
      I4 => select_ln432_68_fu_3146_p3(2),
      I5 => select_ln432_20_fu_2874_p3(2),
      O => \select_ln450_20_reg_5375[1]_i_4_n_0\
    );
\select_ln450_20_reg_5375[1]_i_5\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => max_bin_count_6_V(3),
      I1 => max_bin_count_38_V(3),
      I2 => \icmp_ln895_71_reg_5123[0]_i_1_n_0\,
      O => select_ln432_20_fu_2874_p3(3)
    );
\select_ln450_20_reg_5375[2]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"ACACFF00"
    )
        port map (
      I0 => max_bin_count_6_V(2),
      I1 => max_bin_count_38_V(2),
      I2 => \icmp_ln895_71_reg_5123[0]_i_1_n_0\,
      I3 => select_ln432_68_fu_3146_p3(2),
      I4 => \icmp_ln895_103_reg_5369[0]_i_1_n_0\,
      O => select_ln450_20_fu_3362_p3(2)
    );
\select_ln450_20_reg_5375[2]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"ACAACCAC"
    )
        port map (
      I0 => max_bin_count_22_V(2),
      I1 => max_bin_count_54_V(2),
      I2 => \select_ln432_67_reg_5248[6]_i_3_n_0\,
      I3 => max_bin_count_54_V(3),
      I4 => max_bin_count_22_V(3),
      O => select_ln432_68_fu_3146_p3(2)
    );
\select_ln450_20_reg_5375[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0F0FF00EEEEEEEE"
    )
        port map (
      I0 => max_bin_count_54_V(3),
      I1 => max_bin_count_22_V(3),
      I2 => max_bin_count_6_V(3),
      I3 => max_bin_count_38_V(3),
      I4 => \icmp_ln895_71_reg_5123[0]_i_1_n_0\,
      I5 => \icmp_ln895_103_reg_5369[0]_i_1_n_0\,
      O => select_ln450_20_fu_3362_p3(3)
    );
\select_ln450_20_reg_5375_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => select_ln450_20_fu_3362_p3(0),
      Q => select_ln450_20_reg_5375(0),
      R => '0'
    );
\select_ln450_20_reg_5375_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => select_ln450_20_fu_3362_p3(1),
      Q => select_ln450_20_reg_5375(1),
      R => '0'
    );
\select_ln450_20_reg_5375_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => select_ln450_20_fu_3362_p3(2),
      Q => select_ln450_20_reg_5375(2),
      R => '0'
    );
\select_ln450_20_reg_5375_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => select_ln450_20_fu_3362_p3(3),
      Q => select_ln450_20_reg_5375(3),
      R => '0'
    );
\select_ln450_23_reg_5386[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0F0FE10FE10FF00"
    )
        port map (
      I0 => max_bin_count_55_V(3),
      I1 => max_bin_count_23_V(3),
      I2 => select_ln432_23_fu_2891_p3(0),
      I3 => select_ln432_71_fu_3163_p3(0),
      I4 => \select_ln450_23_reg_5386[1]_i_4_n_0\,
      I5 => select_ln432_23_fu_2891_p3(3),
      O => select_ln450_23_fu_3371_p3(0)
    );
\select_ln450_23_reg_5386[0]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"ACAACCAC"
    )
        port map (
      I0 => max_bin_count_7_V(0),
      I1 => max_bin_count_39_V(0),
      I2 => \icmp_ln895_72_reg_5133[0]_i_2_n_0\,
      I3 => max_bin_count_39_V(3),
      I4 => max_bin_count_7_V(3),
      O => select_ln432_23_fu_2891_p3(0)
    );
\select_ln450_23_reg_5386[0]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"ACAACCAC"
    )
        port map (
      I0 => max_bin_count_23_V(0),
      I1 => max_bin_count_55_V(0),
      I2 => \select_ln432_70_reg_5258[6]_i_3_n_0\,
      I3 => max_bin_count_55_V(3),
      I4 => max_bin_count_23_V(3),
      O => select_ln432_71_fu_3163_p3(0)
    );
\select_ln450_23_reg_5386[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0F0FE10FE10FF00"
    )
        port map (
      I0 => max_bin_count_55_V(3),
      I1 => max_bin_count_23_V(3),
      I2 => select_ln432_23_fu_2891_p3(1),
      I3 => select_ln432_71_fu_3163_p3(1),
      I4 => \select_ln450_23_reg_5386[1]_i_4_n_0\,
      I5 => select_ln432_23_fu_2891_p3(3),
      O => select_ln450_23_fu_3371_p3(1)
    );
\select_ln450_23_reg_5386[1]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"ACAACCAC"
    )
        port map (
      I0 => max_bin_count_7_V(1),
      I1 => max_bin_count_39_V(1),
      I2 => \icmp_ln895_72_reg_5133[0]_i_2_n_0\,
      I3 => max_bin_count_39_V(3),
      I4 => max_bin_count_7_V(3),
      O => select_ln432_23_fu_2891_p3(1)
    );
\select_ln450_23_reg_5386[1]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"ACAACCAC"
    )
        port map (
      I0 => max_bin_count_23_V(1),
      I1 => max_bin_count_55_V(1),
      I2 => \select_ln432_70_reg_5258[6]_i_3_n_0\,
      I3 => max_bin_count_55_V(3),
      I4 => max_bin_count_23_V(3),
      O => select_ln432_71_fu_3163_p3(1)
    );
\select_ln450_23_reg_5386[1]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"2F02FFFF00002F02"
    )
        port map (
      I0 => select_ln432_23_fu_2891_p3(0),
      I1 => select_ln432_71_fu_3163_p3(0),
      I2 => select_ln432_71_fu_3163_p3(1),
      I3 => select_ln432_23_fu_2891_p3(1),
      I4 => select_ln432_71_fu_3163_p3(2),
      I5 => select_ln432_23_fu_2891_p3(2),
      O => \select_ln450_23_reg_5386[1]_i_4_n_0\
    );
\select_ln450_23_reg_5386[1]_i_5\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => max_bin_count_7_V(3),
      I1 => max_bin_count_39_V(3),
      I2 => \icmp_ln895_72_reg_5133[0]_i_1_n_0\,
      O => select_ln432_23_fu_2891_p3(3)
    );
\select_ln450_23_reg_5386[2]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"ACACFF00"
    )
        port map (
      I0 => max_bin_count_7_V(2),
      I1 => max_bin_count_39_V(2),
      I2 => \icmp_ln895_72_reg_5133[0]_i_1_n_0\,
      I3 => select_ln432_71_fu_3163_p3(2),
      I4 => \icmp_ln895_104_reg_5380[0]_i_1_n_0\,
      O => select_ln450_23_fu_3371_p3(2)
    );
\select_ln450_23_reg_5386[2]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"ACAACCAC"
    )
        port map (
      I0 => max_bin_count_23_V(2),
      I1 => max_bin_count_55_V(2),
      I2 => \select_ln432_70_reg_5258[6]_i_3_n_0\,
      I3 => max_bin_count_55_V(3),
      I4 => max_bin_count_23_V(3),
      O => select_ln432_71_fu_3163_p3(2)
    );
\select_ln450_23_reg_5386[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0F0FF00EEEEEEEE"
    )
        port map (
      I0 => max_bin_count_55_V(3),
      I1 => max_bin_count_23_V(3),
      I2 => max_bin_count_7_V(3),
      I3 => max_bin_count_39_V(3),
      I4 => \icmp_ln895_72_reg_5133[0]_i_1_n_0\,
      I5 => \icmp_ln895_104_reg_5380[0]_i_1_n_0\,
      O => select_ln450_23_fu_3371_p3(3)
    );
\select_ln450_23_reg_5386_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => select_ln450_23_fu_3371_p3(0),
      Q => select_ln450_23_reg_5386(0),
      R => '0'
    );
\select_ln450_23_reg_5386_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => select_ln450_23_fu_3371_p3(1),
      Q => select_ln450_23_reg_5386(1),
      R => '0'
    );
\select_ln450_23_reg_5386_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => select_ln450_23_fu_3371_p3(2),
      Q => select_ln450_23_reg_5386(2),
      R => '0'
    );
\select_ln450_23_reg_5386_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => select_ln450_23_fu_3371_p3(3),
      Q => select_ln450_23_reg_5386(3),
      R => '0'
    );
\select_ln450_25_reg_5396[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"88B8FFFF88B80000"
    )
        port map (
      I0 => max_bin_r_8_V(0),
      I1 => \icmp_ln895_73_reg_5143[0]_i_1_n_0\,
      I2 => max_bin_r_40_V(0),
      I3 => p_3_in,
      I4 => \icmp_ln895_105_reg_5391[0]_i_1_n_0\,
      I5 => select_ln432_73_fu_3172_p3(0),
      O => select_ln450_25_fu_3380_p3(0)
    );
\select_ln450_25_reg_5396[0]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"20202F20"
    )
        port map (
      I0 => max_bin_r_24_V(0),
      I1 => \icmp_ln895_24_reg_4863[0]_i_1_n_0\,
      I2 => \icmp_ln895_89_reg_5263[0]_i_1_n_0\,
      I3 => max_bin_r_56_V(0),
      I4 => \icmp_ln895_56_reg_5023[0]_i_1_n_0\,
      O => select_ln432_73_fu_3172_p3(0)
    );
\select_ln450_25_reg_5396[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"88B8FFFF88B80000"
    )
        port map (
      I0 => max_bin_r_8_V(1),
      I1 => \icmp_ln895_73_reg_5143[0]_i_1_n_0\,
      I2 => max_bin_r_40_V(1),
      I3 => p_3_in,
      I4 => \icmp_ln895_105_reg_5391[0]_i_1_n_0\,
      I5 => select_ln432_73_fu_3172_p3(1),
      O => select_ln450_25_fu_3380_p3(1)
    );
\select_ln450_25_reg_5396[1]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"20202F20"
    )
        port map (
      I0 => max_bin_r_24_V(1),
      I1 => \icmp_ln895_24_reg_4863[0]_i_1_n_0\,
      I2 => \icmp_ln895_89_reg_5263[0]_i_1_n_0\,
      I3 => max_bin_r_56_V(1),
      I4 => \icmp_ln895_56_reg_5023[0]_i_1_n_0\,
      O => select_ln432_73_fu_3172_p3(1)
    );
\select_ln450_25_reg_5396[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"88B8FFFF88B80000"
    )
        port map (
      I0 => max_bin_r_8_V(2),
      I1 => \icmp_ln895_73_reg_5143[0]_i_1_n_0\,
      I2 => max_bin_r_40_V(2),
      I3 => p_3_in,
      I4 => \icmp_ln895_105_reg_5391[0]_i_1_n_0\,
      I5 => select_ln432_73_fu_3172_p3(2),
      O => select_ln450_25_fu_3380_p3(2)
    );
\select_ln450_25_reg_5396[2]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"20202F20"
    )
        port map (
      I0 => max_bin_r_24_V(2),
      I1 => \icmp_ln895_24_reg_4863[0]_i_1_n_0\,
      I2 => \icmp_ln895_89_reg_5263[0]_i_1_n_0\,
      I3 => max_bin_r_56_V(2),
      I4 => \icmp_ln895_56_reg_5023[0]_i_1_n_0\,
      O => select_ln432_73_fu_3172_p3(2)
    );
\select_ln450_25_reg_5396[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"88B8FFFF88B80000"
    )
        port map (
      I0 => max_bin_r_8_V(3),
      I1 => \icmp_ln895_73_reg_5143[0]_i_1_n_0\,
      I2 => max_bin_r_40_V(3),
      I3 => p_3_in,
      I4 => \icmp_ln895_105_reg_5391[0]_i_1_n_0\,
      I5 => select_ln432_73_fu_3172_p3(3),
      O => select_ln450_25_fu_3380_p3(3)
    );
\select_ln450_25_reg_5396[3]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"20202F20"
    )
        port map (
      I0 => max_bin_r_24_V(3),
      I1 => \icmp_ln895_24_reg_4863[0]_i_1_n_0\,
      I2 => \icmp_ln895_89_reg_5263[0]_i_1_n_0\,
      I3 => max_bin_r_56_V(3),
      I4 => \icmp_ln895_56_reg_5023[0]_i_1_n_0\,
      O => select_ln432_73_fu_3172_p3(3)
    );
\select_ln450_25_reg_5396[4]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"88B8FFFF88B80000"
    )
        port map (
      I0 => max_bin_r_8_V(4),
      I1 => \icmp_ln895_73_reg_5143[0]_i_1_n_0\,
      I2 => max_bin_r_40_V(4),
      I3 => p_3_in,
      I4 => \icmp_ln895_105_reg_5391[0]_i_1_n_0\,
      I5 => select_ln432_73_fu_3172_p3(4),
      O => select_ln450_25_fu_3380_p3(4)
    );
\select_ln450_25_reg_5396[4]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"20202F20"
    )
        port map (
      I0 => max_bin_r_24_V(4),
      I1 => \icmp_ln895_24_reg_4863[0]_i_1_n_0\,
      I2 => \icmp_ln895_89_reg_5263[0]_i_1_n_0\,
      I3 => max_bin_r_56_V(4),
      I4 => \icmp_ln895_56_reg_5023[0]_i_1_n_0\,
      O => select_ln432_73_fu_3172_p3(4)
    );
\select_ln450_25_reg_5396[5]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"88B8FFFF88B80000"
    )
        port map (
      I0 => max_bin_r_8_V(5),
      I1 => \icmp_ln895_73_reg_5143[0]_i_1_n_0\,
      I2 => max_bin_r_40_V(5),
      I3 => p_3_in,
      I4 => \icmp_ln895_105_reg_5391[0]_i_1_n_0\,
      I5 => select_ln432_73_fu_3172_p3(5),
      O => select_ln450_25_fu_3380_p3(5)
    );
\select_ln450_25_reg_5396[5]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"20202F20"
    )
        port map (
      I0 => max_bin_r_24_V(5),
      I1 => \icmp_ln895_24_reg_4863[0]_i_1_n_0\,
      I2 => \icmp_ln895_89_reg_5263[0]_i_1_n_0\,
      I3 => max_bin_r_56_V(5),
      I4 => \icmp_ln895_56_reg_5023[0]_i_1_n_0\,
      O => select_ln432_73_fu_3172_p3(5)
    );
\select_ln450_25_reg_5396[6]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000200000000"
    )
        port map (
      I0 => \icmp_ln895_105_reg_5391[0]_i_1_n_0\,
      I1 => max_bin_count_8_V(2),
      I2 => max_bin_count_8_V(3),
      I3 => max_bin_count_8_V(1),
      I4 => max_bin_count_8_V(0),
      I5 => \icmp_ln895_73_reg_5143[0]_i_1_n_0\,
      O => \select_ln450_25_reg_5396[6]_i_1_n_0\
    );
\select_ln450_25_reg_5396[6]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"88B8FFFF88B80000"
    )
        port map (
      I0 => max_bin_r_8_V(6),
      I1 => \icmp_ln895_73_reg_5143[0]_i_1_n_0\,
      I2 => max_bin_r_40_V(6),
      I3 => p_3_in,
      I4 => \icmp_ln895_105_reg_5391[0]_i_1_n_0\,
      I5 => select_ln432_73_fu_3172_p3(6),
      O => select_ln450_25_fu_3380_p3(6)
    );
\select_ln450_25_reg_5396[6]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"20202F20"
    )
        port map (
      I0 => max_bin_r_24_V(6),
      I1 => \icmp_ln895_24_reg_4863[0]_i_1_n_0\,
      I2 => \icmp_ln895_89_reg_5263[0]_i_1_n_0\,
      I3 => max_bin_r_56_V(6),
      I4 => \icmp_ln895_56_reg_5023[0]_i_1_n_0\,
      O => select_ln432_73_fu_3172_p3(6)
    );
\select_ln450_25_reg_5396_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => select_ln450_25_fu_3380_p3(0),
      Q => \select_ln450_25_reg_5396_reg_n_0_[0]\,
      R => \select_ln450_25_reg_5396[6]_i_1_n_0\
    );
\select_ln450_25_reg_5396_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => select_ln450_25_fu_3380_p3(1),
      Q => \select_ln450_25_reg_5396_reg_n_0_[1]\,
      R => \select_ln450_25_reg_5396[6]_i_1_n_0\
    );
\select_ln450_25_reg_5396_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => select_ln450_25_fu_3380_p3(2),
      Q => \select_ln450_25_reg_5396_reg_n_0_[2]\,
      R => \select_ln450_25_reg_5396[6]_i_1_n_0\
    );
\select_ln450_25_reg_5396_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => select_ln450_25_fu_3380_p3(3),
      Q => \select_ln450_25_reg_5396_reg_n_0_[3]\,
      R => \select_ln450_25_reg_5396[6]_i_1_n_0\
    );
\select_ln450_25_reg_5396_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => select_ln450_25_fu_3380_p3(4),
      Q => \select_ln450_25_reg_5396_reg_n_0_[4]\,
      R => \select_ln450_25_reg_5396[6]_i_1_n_0\
    );
\select_ln450_25_reg_5396_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => select_ln450_25_fu_3380_p3(5),
      Q => \select_ln450_25_reg_5396_reg_n_0_[5]\,
      R => \select_ln450_25_reg_5396[6]_i_1_n_0\
    );
\select_ln450_25_reg_5396_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => select_ln450_25_fu_3380_p3(6),
      Q => \select_ln450_25_reg_5396_reg_n_0_[6]\,
      R => \select_ln450_25_reg_5396[6]_i_1_n_0\
    );
\select_ln450_26_reg_5401[0]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"ACACFF00"
    )
        port map (
      I0 => max_bin_count_8_V(0),
      I1 => max_bin_count_40_V(0),
      I2 => \icmp_ln895_73_reg_5143[0]_i_1_n_0\,
      I3 => select_ln432_74_fu_3180_p3(0),
      I4 => \icmp_ln895_105_reg_5391[0]_i_1_n_0\,
      O => select_ln450_26_fu_3388_p3(0)
    );
\select_ln450_26_reg_5401[0]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"ACAACCAC"
    )
        port map (
      I0 => max_bin_count_24_V(0),
      I1 => max_bin_count_56_V(0),
      I2 => \icmp_ln895_89_reg_5263[0]_i_2_n_0\,
      I3 => max_bin_count_56_V(3),
      I4 => max_bin_count_24_V(3),
      O => select_ln432_74_fu_3180_p3(0)
    );
\select_ln450_26_reg_5401[1]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"ACAACCAC"
    )
        port map (
      I0 => select_ln432_26_fu_2908_p3(1),
      I1 => select_ln432_74_fu_3180_p3(1),
      I2 => \select_ln450_26_reg_5401[1]_i_4_n_0\,
      I3 => select_ln432_74_fu_3180_p3(3),
      I4 => select_ln432_26_fu_2908_p3(3),
      O => select_ln450_26_fu_3388_p3(1)
    );
\select_ln450_26_reg_5401[1]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"ACAACCAC"
    )
        port map (
      I0 => max_bin_count_8_V(1),
      I1 => max_bin_count_40_V(1),
      I2 => \icmp_ln895_73_reg_5143[0]_i_2_n_0\,
      I3 => max_bin_count_40_V(3),
      I4 => max_bin_count_8_V(3),
      O => select_ln432_26_fu_2908_p3(1)
    );
\select_ln450_26_reg_5401[1]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"ACAACCAC"
    )
        port map (
      I0 => max_bin_count_24_V(1),
      I1 => max_bin_count_56_V(1),
      I2 => \icmp_ln895_89_reg_5263[0]_i_2_n_0\,
      I3 => max_bin_count_56_V(3),
      I4 => max_bin_count_24_V(3),
      O => select_ln432_74_fu_3180_p3(1)
    );
\select_ln450_26_reg_5401[1]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"2F02FFFF00002F02"
    )
        port map (
      I0 => select_ln432_26_fu_2908_p3(0),
      I1 => select_ln432_74_fu_3180_p3(0),
      I2 => select_ln432_74_fu_3180_p3(1),
      I3 => select_ln432_26_fu_2908_p3(1),
      I4 => select_ln432_74_fu_3180_p3(2),
      I5 => select_ln432_26_fu_2908_p3(2),
      O => \select_ln450_26_reg_5401[1]_i_4_n_0\
    );
\select_ln450_26_reg_5401[1]_i_5\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => max_bin_count_8_V(3),
      I1 => max_bin_count_40_V(3),
      I2 => \icmp_ln895_73_reg_5143[0]_i_1_n_0\,
      O => select_ln432_26_fu_2908_p3(3)
    );
\select_ln450_26_reg_5401[1]_i_6\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"ACAACCAC"
    )
        port map (
      I0 => max_bin_count_8_V(0),
      I1 => max_bin_count_40_V(0),
      I2 => \icmp_ln895_73_reg_5143[0]_i_2_n_0\,
      I3 => max_bin_count_40_V(3),
      I4 => max_bin_count_8_V(3),
      O => select_ln432_26_fu_2908_p3(0)
    );
\select_ln450_26_reg_5401[2]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"ACACFF00"
    )
        port map (
      I0 => max_bin_count_8_V(2),
      I1 => max_bin_count_40_V(2),
      I2 => \icmp_ln895_73_reg_5143[0]_i_1_n_0\,
      I3 => select_ln432_74_fu_3180_p3(2),
      I4 => \icmp_ln895_105_reg_5391[0]_i_1_n_0\,
      O => select_ln450_26_fu_3388_p3(2)
    );
\select_ln450_26_reg_5401[2]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"ACAACCAC"
    )
        port map (
      I0 => max_bin_count_24_V(2),
      I1 => max_bin_count_56_V(2),
      I2 => \icmp_ln895_89_reg_5263[0]_i_2_n_0\,
      I3 => max_bin_count_56_V(3),
      I4 => max_bin_count_24_V(3),
      O => select_ln432_74_fu_3180_p3(2)
    );
\select_ln450_26_reg_5401[3]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"ACACFF00"
    )
        port map (
      I0 => max_bin_count_8_V(3),
      I1 => max_bin_count_40_V(3),
      I2 => \icmp_ln895_73_reg_5143[0]_i_1_n_0\,
      I3 => select_ln432_74_fu_3180_p3(3),
      I4 => \icmp_ln895_105_reg_5391[0]_i_1_n_0\,
      O => select_ln450_26_fu_3388_p3(3)
    );
\select_ln450_26_reg_5401[3]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => max_bin_count_24_V(3),
      I1 => max_bin_count_56_V(3),
      I2 => \icmp_ln895_89_reg_5263[0]_i_1_n_0\,
      O => select_ln432_74_fu_3180_p3(3)
    );
\select_ln450_26_reg_5401_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => select_ln450_26_fu_3388_p3(0),
      Q => select_ln450_26_reg_5401(0),
      R => '0'
    );
\select_ln450_26_reg_5401_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => select_ln450_26_fu_3388_p3(1),
      Q => select_ln450_26_reg_5401(1),
      R => '0'
    );
\select_ln450_26_reg_5401_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => select_ln450_26_fu_3388_p3(2),
      Q => select_ln450_26_reg_5401(2),
      R => '0'
    );
\select_ln450_26_reg_5401_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => select_ln450_26_fu_3388_p3(3),
      Q => select_ln450_26_reg_5401(3),
      R => '0'
    );
\select_ln450_28_reg_5411[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"88B8FFFF88B80000"
    )
        port map (
      I0 => max_bin_r_9_V(0),
      I1 => \icmp_ln895_74_reg_5148[0]_i_1_n_0\,
      I2 => max_bin_r_41_V(0),
      I3 => \icmp_ln895_41_reg_4948[0]_i_1_n_0\,
      I4 => \icmp_ln895_106_reg_5406[0]_i_1_n_0\,
      I5 => select_ln432_76_fu_3189_p3(0),
      O => select_ln450_28_fu_3397_p3(0)
    );
\select_ln450_28_reg_5411[0]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"20202F20"
    )
        port map (
      I0 => max_bin_r_25_V(0),
      I1 => \icmp_ln895_25_reg_4868[0]_i_1_n_0\,
      I2 => \icmp_ln895_90_reg_5268[0]_i_1_n_0\,
      I3 => max_bin_r_57_V(0),
      I4 => \icmp_ln895_57_reg_5028[0]_i_1_n_0\,
      O => select_ln432_76_fu_3189_p3(0)
    );
\select_ln450_28_reg_5411[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"88B8FFFF88B80000"
    )
        port map (
      I0 => max_bin_r_9_V(1),
      I1 => \icmp_ln895_74_reg_5148[0]_i_1_n_0\,
      I2 => max_bin_r_41_V(1),
      I3 => \icmp_ln895_41_reg_4948[0]_i_1_n_0\,
      I4 => \icmp_ln895_106_reg_5406[0]_i_1_n_0\,
      I5 => select_ln432_76_fu_3189_p3(1),
      O => select_ln450_28_fu_3397_p3(1)
    );
\select_ln450_28_reg_5411[1]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"20202F20"
    )
        port map (
      I0 => max_bin_r_25_V(1),
      I1 => \icmp_ln895_25_reg_4868[0]_i_1_n_0\,
      I2 => \icmp_ln895_90_reg_5268[0]_i_1_n_0\,
      I3 => max_bin_r_57_V(1),
      I4 => \icmp_ln895_57_reg_5028[0]_i_1_n_0\,
      O => select_ln432_76_fu_3189_p3(1)
    );
\select_ln450_28_reg_5411[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"88B8FFFF88B80000"
    )
        port map (
      I0 => max_bin_r_9_V(2),
      I1 => \icmp_ln895_74_reg_5148[0]_i_1_n_0\,
      I2 => max_bin_r_41_V(2),
      I3 => \icmp_ln895_41_reg_4948[0]_i_1_n_0\,
      I4 => \icmp_ln895_106_reg_5406[0]_i_1_n_0\,
      I5 => select_ln432_76_fu_3189_p3(2),
      O => select_ln450_28_fu_3397_p3(2)
    );
\select_ln450_28_reg_5411[2]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"20202F20"
    )
        port map (
      I0 => max_bin_r_25_V(2),
      I1 => \icmp_ln895_25_reg_4868[0]_i_1_n_0\,
      I2 => \icmp_ln895_90_reg_5268[0]_i_1_n_0\,
      I3 => max_bin_r_57_V(2),
      I4 => \icmp_ln895_57_reg_5028[0]_i_1_n_0\,
      O => select_ln432_76_fu_3189_p3(2)
    );
\select_ln450_28_reg_5411[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"88B8FFFF88B80000"
    )
        port map (
      I0 => max_bin_r_9_V(3),
      I1 => \icmp_ln895_74_reg_5148[0]_i_1_n_0\,
      I2 => max_bin_r_41_V(3),
      I3 => \icmp_ln895_41_reg_4948[0]_i_1_n_0\,
      I4 => \icmp_ln895_106_reg_5406[0]_i_1_n_0\,
      I5 => select_ln432_76_fu_3189_p3(3),
      O => select_ln450_28_fu_3397_p3(3)
    );
\select_ln450_28_reg_5411[3]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"20202F20"
    )
        port map (
      I0 => max_bin_r_25_V(3),
      I1 => \icmp_ln895_25_reg_4868[0]_i_1_n_0\,
      I2 => \icmp_ln895_90_reg_5268[0]_i_1_n_0\,
      I3 => max_bin_r_57_V(3),
      I4 => \icmp_ln895_57_reg_5028[0]_i_1_n_0\,
      O => select_ln432_76_fu_3189_p3(3)
    );
\select_ln450_28_reg_5411[4]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"88B8FFFF88B80000"
    )
        port map (
      I0 => max_bin_r_9_V(4),
      I1 => \icmp_ln895_74_reg_5148[0]_i_1_n_0\,
      I2 => max_bin_r_41_V(4),
      I3 => \icmp_ln895_41_reg_4948[0]_i_1_n_0\,
      I4 => \icmp_ln895_106_reg_5406[0]_i_1_n_0\,
      I5 => select_ln432_76_fu_3189_p3(4),
      O => select_ln450_28_fu_3397_p3(4)
    );
\select_ln450_28_reg_5411[4]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"20202F20"
    )
        port map (
      I0 => max_bin_r_25_V(4),
      I1 => \icmp_ln895_25_reg_4868[0]_i_1_n_0\,
      I2 => \icmp_ln895_90_reg_5268[0]_i_1_n_0\,
      I3 => max_bin_r_57_V(4),
      I4 => \icmp_ln895_57_reg_5028[0]_i_1_n_0\,
      O => select_ln432_76_fu_3189_p3(4)
    );
\select_ln450_28_reg_5411[5]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"88B8FFFF88B80000"
    )
        port map (
      I0 => max_bin_r_9_V(5),
      I1 => \icmp_ln895_74_reg_5148[0]_i_1_n_0\,
      I2 => max_bin_r_41_V(5),
      I3 => \icmp_ln895_41_reg_4948[0]_i_1_n_0\,
      I4 => \icmp_ln895_106_reg_5406[0]_i_1_n_0\,
      I5 => select_ln432_76_fu_3189_p3(5),
      O => select_ln450_28_fu_3397_p3(5)
    );
\select_ln450_28_reg_5411[5]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"20202F20"
    )
        port map (
      I0 => max_bin_r_25_V(5),
      I1 => \icmp_ln895_25_reg_4868[0]_i_1_n_0\,
      I2 => \icmp_ln895_90_reg_5268[0]_i_1_n_0\,
      I3 => max_bin_r_57_V(5),
      I4 => \icmp_ln895_57_reg_5028[0]_i_1_n_0\,
      O => select_ln432_76_fu_3189_p3(5)
    );
\select_ln450_28_reg_5411[6]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000200000000"
    )
        port map (
      I0 => \icmp_ln895_106_reg_5406[0]_i_1_n_0\,
      I1 => max_bin_count_9_V(2),
      I2 => max_bin_count_9_V(3),
      I3 => max_bin_count_9_V(1),
      I4 => max_bin_count_9_V(0),
      I5 => \icmp_ln895_74_reg_5148[0]_i_1_n_0\,
      O => \select_ln450_28_reg_5411[6]_i_1_n_0\
    );
\select_ln450_28_reg_5411[6]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"88B8FFFF88B80000"
    )
        port map (
      I0 => max_bin_r_9_V(6),
      I1 => \icmp_ln895_74_reg_5148[0]_i_1_n_0\,
      I2 => max_bin_r_41_V(6),
      I3 => \icmp_ln895_41_reg_4948[0]_i_1_n_0\,
      I4 => \icmp_ln895_106_reg_5406[0]_i_1_n_0\,
      I5 => select_ln432_76_fu_3189_p3(6),
      O => select_ln450_28_fu_3397_p3(6)
    );
\select_ln450_28_reg_5411[6]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"20202F20"
    )
        port map (
      I0 => max_bin_r_25_V(6),
      I1 => \icmp_ln895_25_reg_4868[0]_i_1_n_0\,
      I2 => \icmp_ln895_90_reg_5268[0]_i_1_n_0\,
      I3 => max_bin_r_57_V(6),
      I4 => \icmp_ln895_57_reg_5028[0]_i_1_n_0\,
      O => select_ln432_76_fu_3189_p3(6)
    );
\select_ln450_28_reg_5411_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => select_ln450_28_fu_3397_p3(0),
      Q => \select_ln450_28_reg_5411_reg_n_0_[0]\,
      R => \select_ln450_28_reg_5411[6]_i_1_n_0\
    );
\select_ln450_28_reg_5411_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => select_ln450_28_fu_3397_p3(1),
      Q => \select_ln450_28_reg_5411_reg_n_0_[1]\,
      R => \select_ln450_28_reg_5411[6]_i_1_n_0\
    );
\select_ln450_28_reg_5411_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => select_ln450_28_fu_3397_p3(2),
      Q => \select_ln450_28_reg_5411_reg_n_0_[2]\,
      R => \select_ln450_28_reg_5411[6]_i_1_n_0\
    );
\select_ln450_28_reg_5411_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => select_ln450_28_fu_3397_p3(3),
      Q => \select_ln450_28_reg_5411_reg_n_0_[3]\,
      R => \select_ln450_28_reg_5411[6]_i_1_n_0\
    );
\select_ln450_28_reg_5411_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => select_ln450_28_fu_3397_p3(4),
      Q => \select_ln450_28_reg_5411_reg_n_0_[4]\,
      R => \select_ln450_28_reg_5411[6]_i_1_n_0\
    );
\select_ln450_28_reg_5411_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => select_ln450_28_fu_3397_p3(5),
      Q => \select_ln450_28_reg_5411_reg_n_0_[5]\,
      R => \select_ln450_28_reg_5411[6]_i_1_n_0\
    );
\select_ln450_28_reg_5411_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => select_ln450_28_fu_3397_p3(6),
      Q => \select_ln450_28_reg_5411_reg_n_0_[6]\,
      R => \select_ln450_28_reg_5411[6]_i_1_n_0\
    );
\select_ln450_29_reg_5416[0]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"ACACFF00"
    )
        port map (
      I0 => max_bin_count_9_V(0),
      I1 => max_bin_count_41_V(0),
      I2 => \icmp_ln895_74_reg_5148[0]_i_1_n_0\,
      I3 => select_ln432_77_fu_3197_p3(0),
      I4 => \icmp_ln895_106_reg_5406[0]_i_1_n_0\,
      O => select_ln450_29_fu_3405_p3(0)
    );
\select_ln450_29_reg_5416[0]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"ACAACCAC"
    )
        port map (
      I0 => max_bin_count_25_V(0),
      I1 => max_bin_count_57_V(0),
      I2 => \icmp_ln895_90_reg_5268[0]_i_2_n_0\,
      I3 => max_bin_count_57_V(3),
      I4 => max_bin_count_25_V(3),
      O => select_ln432_77_fu_3197_p3(0)
    );
\select_ln450_29_reg_5416[1]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"ACAACCAC"
    )
        port map (
      I0 => select_ln432_29_fu_2925_p3(1),
      I1 => select_ln432_77_fu_3197_p3(1),
      I2 => \select_ln450_29_reg_5416[1]_i_4_n_0\,
      I3 => select_ln432_77_fu_3197_p3(3),
      I4 => select_ln432_29_fu_2925_p3(3),
      O => select_ln450_29_fu_3405_p3(1)
    );
\select_ln450_29_reg_5416[1]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"ACAACCAC"
    )
        port map (
      I0 => max_bin_count_9_V(1),
      I1 => max_bin_count_41_V(1),
      I2 => \icmp_ln895_74_reg_5148[0]_i_2_n_0\,
      I3 => max_bin_count_41_V(3),
      I4 => max_bin_count_9_V(3),
      O => select_ln432_29_fu_2925_p3(1)
    );
\select_ln450_29_reg_5416[1]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"ACAACCAC"
    )
        port map (
      I0 => max_bin_count_25_V(1),
      I1 => max_bin_count_57_V(1),
      I2 => \icmp_ln895_90_reg_5268[0]_i_2_n_0\,
      I3 => max_bin_count_57_V(3),
      I4 => max_bin_count_25_V(3),
      O => select_ln432_77_fu_3197_p3(1)
    );
\select_ln450_29_reg_5416[1]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"2F02FFFF00002F02"
    )
        port map (
      I0 => select_ln432_29_fu_2925_p3(0),
      I1 => select_ln432_77_fu_3197_p3(0),
      I2 => select_ln432_77_fu_3197_p3(1),
      I3 => select_ln432_29_fu_2925_p3(1),
      I4 => select_ln432_77_fu_3197_p3(2),
      I5 => select_ln432_29_fu_2925_p3(2),
      O => \select_ln450_29_reg_5416[1]_i_4_n_0\
    );
\select_ln450_29_reg_5416[1]_i_5\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => max_bin_count_9_V(3),
      I1 => max_bin_count_41_V(3),
      I2 => \icmp_ln895_74_reg_5148[0]_i_1_n_0\,
      O => select_ln432_29_fu_2925_p3(3)
    );
\select_ln450_29_reg_5416[1]_i_6\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"ACAACCAC"
    )
        port map (
      I0 => max_bin_count_9_V(0),
      I1 => max_bin_count_41_V(0),
      I2 => \icmp_ln895_74_reg_5148[0]_i_2_n_0\,
      I3 => max_bin_count_41_V(3),
      I4 => max_bin_count_9_V(3),
      O => select_ln432_29_fu_2925_p3(0)
    );
\select_ln450_29_reg_5416[2]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"ACACFF00"
    )
        port map (
      I0 => max_bin_count_9_V(2),
      I1 => max_bin_count_41_V(2),
      I2 => \icmp_ln895_74_reg_5148[0]_i_1_n_0\,
      I3 => select_ln432_77_fu_3197_p3(2),
      I4 => \icmp_ln895_106_reg_5406[0]_i_1_n_0\,
      O => select_ln450_29_fu_3405_p3(2)
    );
\select_ln450_29_reg_5416[2]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"ACAACCAC"
    )
        port map (
      I0 => max_bin_count_25_V(2),
      I1 => max_bin_count_57_V(2),
      I2 => \icmp_ln895_90_reg_5268[0]_i_2_n_0\,
      I3 => max_bin_count_57_V(3),
      I4 => max_bin_count_25_V(3),
      O => select_ln432_77_fu_3197_p3(2)
    );
\select_ln450_29_reg_5416[3]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"ACACFF00"
    )
        port map (
      I0 => max_bin_count_9_V(3),
      I1 => max_bin_count_41_V(3),
      I2 => \icmp_ln895_74_reg_5148[0]_i_1_n_0\,
      I3 => select_ln432_77_fu_3197_p3(3),
      I4 => \icmp_ln895_106_reg_5406[0]_i_1_n_0\,
      O => select_ln450_29_fu_3405_p3(3)
    );
\select_ln450_29_reg_5416[3]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => max_bin_count_25_V(3),
      I1 => max_bin_count_57_V(3),
      I2 => \icmp_ln895_90_reg_5268[0]_i_1_n_0\,
      O => select_ln432_77_fu_3197_p3(3)
    );
\select_ln450_29_reg_5416_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => select_ln450_29_fu_3405_p3(0),
      Q => select_ln450_29_reg_5416(0),
      R => '0'
    );
\select_ln450_29_reg_5416_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => select_ln450_29_fu_3405_p3(1),
      Q => select_ln450_29_reg_5416(1),
      R => '0'
    );
\select_ln450_29_reg_5416_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => select_ln450_29_fu_3405_p3(2),
      Q => select_ln450_29_reg_5416(2),
      R => '0'
    );
\select_ln450_29_reg_5416_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => select_ln450_29_fu_3405_p3(3),
      Q => select_ln450_29_reg_5416(3),
      R => '0'
    );
\select_ln450_2_reg_5309[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0F0FE10FE10FF00"
    )
        port map (
      I0 => max_bin_count_48_V(3),
      I1 => max_bin_count_16_V(3),
      I2 => select_ln432_2_fu_2772_p3(0),
      I3 => select_ln432_50_fu_3044_p3(0),
      I4 => \select_ln450_2_reg_5309[1]_i_4_n_0\,
      I5 => select_ln432_2_fu_2772_p3(3),
      O => select_ln450_2_fu_3308_p3(0)
    );
\select_ln450_2_reg_5309[0]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"ACAACCAC"
    )
        port map (
      I0 => max_bin_count_0_V(0),
      I1 => max_bin_count_32_V(0),
      I2 => \icmp_ln895_65_reg_5063[0]_i_2_n_0\,
      I3 => max_bin_count_32_V(3),
      I4 => max_bin_count_0_V(3),
      O => select_ln432_2_fu_2772_p3(0)
    );
\select_ln450_2_reg_5309[0]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"ACAACCAC"
    )
        port map (
      I0 => max_bin_count_16_V(0),
      I1 => max_bin_count_48_V(0),
      I2 => \select_ln432_49_reg_5188[6]_i_3_n_0\,
      I3 => max_bin_count_48_V(3),
      I4 => max_bin_count_16_V(3),
      O => select_ln432_50_fu_3044_p3(0)
    );
\select_ln450_2_reg_5309[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0F0FE10FE10FF00"
    )
        port map (
      I0 => max_bin_count_48_V(3),
      I1 => max_bin_count_16_V(3),
      I2 => select_ln432_2_fu_2772_p3(1),
      I3 => select_ln432_50_fu_3044_p3(1),
      I4 => \select_ln450_2_reg_5309[1]_i_4_n_0\,
      I5 => select_ln432_2_fu_2772_p3(3),
      O => select_ln450_2_fu_3308_p3(1)
    );
\select_ln450_2_reg_5309[1]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"ACAACCAC"
    )
        port map (
      I0 => max_bin_count_0_V(1),
      I1 => max_bin_count_32_V(1),
      I2 => \icmp_ln895_65_reg_5063[0]_i_2_n_0\,
      I3 => max_bin_count_32_V(3),
      I4 => max_bin_count_0_V(3),
      O => select_ln432_2_fu_2772_p3(1)
    );
\select_ln450_2_reg_5309[1]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"ACAACCAC"
    )
        port map (
      I0 => max_bin_count_16_V(1),
      I1 => max_bin_count_48_V(1),
      I2 => \select_ln432_49_reg_5188[6]_i_3_n_0\,
      I3 => max_bin_count_48_V(3),
      I4 => max_bin_count_16_V(3),
      O => select_ln432_50_fu_3044_p3(1)
    );
\select_ln450_2_reg_5309[1]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"2F02FFFF00002F02"
    )
        port map (
      I0 => select_ln432_2_fu_2772_p3(0),
      I1 => select_ln432_50_fu_3044_p3(0),
      I2 => select_ln432_50_fu_3044_p3(1),
      I3 => select_ln432_2_fu_2772_p3(1),
      I4 => select_ln432_50_fu_3044_p3(2),
      I5 => select_ln432_2_fu_2772_p3(2),
      O => \select_ln450_2_reg_5309[1]_i_4_n_0\
    );
\select_ln450_2_reg_5309[1]_i_5\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => max_bin_count_0_V(3),
      I1 => max_bin_count_32_V(3),
      I2 => \icmp_ln895_65_reg_5063[0]_i_1_n_0\,
      O => select_ln432_2_fu_2772_p3(3)
    );
\select_ln450_2_reg_5309[2]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"ACACFF00"
    )
        port map (
      I0 => max_bin_count_0_V(2),
      I1 => max_bin_count_32_V(2),
      I2 => \icmp_ln895_65_reg_5063[0]_i_1_n_0\,
      I3 => select_ln432_50_fu_3044_p3(2),
      I4 => \icmp_ln895_97_reg_5303[0]_i_1_n_0\,
      O => select_ln450_2_fu_3308_p3(2)
    );
\select_ln450_2_reg_5309[2]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"ACAACCAC"
    )
        port map (
      I0 => max_bin_count_16_V(2),
      I1 => max_bin_count_48_V(2),
      I2 => \select_ln432_49_reg_5188[6]_i_3_n_0\,
      I3 => max_bin_count_48_V(3),
      I4 => max_bin_count_16_V(3),
      O => select_ln432_50_fu_3044_p3(2)
    );
\select_ln450_2_reg_5309[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0F0FF00EEEEEEEE"
    )
        port map (
      I0 => max_bin_count_48_V(3),
      I1 => max_bin_count_16_V(3),
      I2 => max_bin_count_0_V(3),
      I3 => max_bin_count_32_V(3),
      I4 => \icmp_ln895_65_reg_5063[0]_i_1_n_0\,
      I5 => \icmp_ln895_97_reg_5303[0]_i_1_n_0\,
      O => select_ln450_2_fu_3308_p3(3)
    );
\select_ln450_2_reg_5309_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => select_ln450_2_fu_3308_p3(0),
      Q => select_ln450_2_reg_5309(0),
      R => '0'
    );
\select_ln450_2_reg_5309_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => select_ln450_2_fu_3308_p3(1),
      Q => select_ln450_2_reg_5309(1),
      R => '0'
    );
\select_ln450_2_reg_5309_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => select_ln450_2_fu_3308_p3(2),
      Q => select_ln450_2_reg_5309(2),
      R => '0'
    );
\select_ln450_2_reg_5309_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => select_ln450_2_fu_3308_p3(3),
      Q => select_ln450_2_reg_5309(3),
      R => '0'
    );
\select_ln450_31_reg_5426[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"88B8FFFF88B80000"
    )
        port map (
      I0 => max_bin_r_10_V(0),
      I1 => \icmp_ln895_75_reg_5153[0]_i_1_n_0\,
      I2 => max_bin_r_42_V(0),
      I3 => \icmp_ln895_42_reg_4953[0]_i_1_n_0\,
      I4 => \icmp_ln895_107_reg_5421[0]_i_1_n_0\,
      I5 => select_ln432_79_fu_3206_p3(0),
      O => select_ln450_31_fu_3414_p3(0)
    );
\select_ln450_31_reg_5426[0]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"20202F20"
    )
        port map (
      I0 => max_bin_r_26_V(0),
      I1 => \icmp_ln895_26_reg_4873[0]_i_1_n_0\,
      I2 => \icmp_ln895_91_reg_5273[0]_i_1_n_0\,
      I3 => max_bin_r_58_V(0),
      I4 => \icmp_ln895_58_reg_5033[0]_i_1_n_0\,
      O => select_ln432_79_fu_3206_p3(0)
    );
\select_ln450_31_reg_5426[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"88B8FFFF88B80000"
    )
        port map (
      I0 => max_bin_r_10_V(1),
      I1 => \icmp_ln895_75_reg_5153[0]_i_1_n_0\,
      I2 => max_bin_r_42_V(1),
      I3 => \icmp_ln895_42_reg_4953[0]_i_1_n_0\,
      I4 => \icmp_ln895_107_reg_5421[0]_i_1_n_0\,
      I5 => select_ln432_79_fu_3206_p3(1),
      O => select_ln450_31_fu_3414_p3(1)
    );
\select_ln450_31_reg_5426[1]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"20202F20"
    )
        port map (
      I0 => max_bin_r_26_V(1),
      I1 => \icmp_ln895_26_reg_4873[0]_i_1_n_0\,
      I2 => \icmp_ln895_91_reg_5273[0]_i_1_n_0\,
      I3 => max_bin_r_58_V(1),
      I4 => \icmp_ln895_58_reg_5033[0]_i_1_n_0\,
      O => select_ln432_79_fu_3206_p3(1)
    );
\select_ln450_31_reg_5426[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"88B8FFFF88B80000"
    )
        port map (
      I0 => max_bin_r_10_V(2),
      I1 => \icmp_ln895_75_reg_5153[0]_i_1_n_0\,
      I2 => max_bin_r_42_V(2),
      I3 => \icmp_ln895_42_reg_4953[0]_i_1_n_0\,
      I4 => \icmp_ln895_107_reg_5421[0]_i_1_n_0\,
      I5 => select_ln432_79_fu_3206_p3(2),
      O => select_ln450_31_fu_3414_p3(2)
    );
\select_ln450_31_reg_5426[2]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"20202F20"
    )
        port map (
      I0 => max_bin_r_26_V(2),
      I1 => \icmp_ln895_26_reg_4873[0]_i_1_n_0\,
      I2 => \icmp_ln895_91_reg_5273[0]_i_1_n_0\,
      I3 => max_bin_r_58_V(2),
      I4 => \icmp_ln895_58_reg_5033[0]_i_1_n_0\,
      O => select_ln432_79_fu_3206_p3(2)
    );
\select_ln450_31_reg_5426[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"88B8FFFF88B80000"
    )
        port map (
      I0 => max_bin_r_10_V(3),
      I1 => \icmp_ln895_75_reg_5153[0]_i_1_n_0\,
      I2 => max_bin_r_42_V(3),
      I3 => \icmp_ln895_42_reg_4953[0]_i_1_n_0\,
      I4 => \icmp_ln895_107_reg_5421[0]_i_1_n_0\,
      I5 => select_ln432_79_fu_3206_p3(3),
      O => select_ln450_31_fu_3414_p3(3)
    );
\select_ln450_31_reg_5426[3]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"20202F20"
    )
        port map (
      I0 => max_bin_r_26_V(3),
      I1 => \icmp_ln895_26_reg_4873[0]_i_1_n_0\,
      I2 => \icmp_ln895_91_reg_5273[0]_i_1_n_0\,
      I3 => max_bin_r_58_V(3),
      I4 => \icmp_ln895_58_reg_5033[0]_i_1_n_0\,
      O => select_ln432_79_fu_3206_p3(3)
    );
\select_ln450_31_reg_5426[4]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"88B8FFFF88B80000"
    )
        port map (
      I0 => max_bin_r_10_V(4),
      I1 => \icmp_ln895_75_reg_5153[0]_i_1_n_0\,
      I2 => max_bin_r_42_V(4),
      I3 => \icmp_ln895_42_reg_4953[0]_i_1_n_0\,
      I4 => \icmp_ln895_107_reg_5421[0]_i_1_n_0\,
      I5 => select_ln432_79_fu_3206_p3(4),
      O => select_ln450_31_fu_3414_p3(4)
    );
\select_ln450_31_reg_5426[4]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"20202F20"
    )
        port map (
      I0 => max_bin_r_26_V(4),
      I1 => \icmp_ln895_26_reg_4873[0]_i_1_n_0\,
      I2 => \icmp_ln895_91_reg_5273[0]_i_1_n_0\,
      I3 => max_bin_r_58_V(4),
      I4 => \icmp_ln895_58_reg_5033[0]_i_1_n_0\,
      O => select_ln432_79_fu_3206_p3(4)
    );
\select_ln450_31_reg_5426[5]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"88B8FFFF88B80000"
    )
        port map (
      I0 => max_bin_r_10_V(5),
      I1 => \icmp_ln895_75_reg_5153[0]_i_1_n_0\,
      I2 => max_bin_r_42_V(5),
      I3 => \icmp_ln895_42_reg_4953[0]_i_1_n_0\,
      I4 => \icmp_ln895_107_reg_5421[0]_i_1_n_0\,
      I5 => select_ln432_79_fu_3206_p3(5),
      O => select_ln450_31_fu_3414_p3(5)
    );
\select_ln450_31_reg_5426[5]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"20202F20"
    )
        port map (
      I0 => max_bin_r_26_V(5),
      I1 => \icmp_ln895_26_reg_4873[0]_i_1_n_0\,
      I2 => \icmp_ln895_91_reg_5273[0]_i_1_n_0\,
      I3 => max_bin_r_58_V(5),
      I4 => \icmp_ln895_58_reg_5033[0]_i_1_n_0\,
      O => select_ln432_79_fu_3206_p3(5)
    );
\select_ln450_31_reg_5426[6]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000200000000"
    )
        port map (
      I0 => \icmp_ln895_107_reg_5421[0]_i_1_n_0\,
      I1 => max_bin_count_10_V(2),
      I2 => max_bin_count_10_V(3),
      I3 => max_bin_count_10_V(1),
      I4 => max_bin_count_10_V(0),
      I5 => \icmp_ln895_75_reg_5153[0]_i_1_n_0\,
      O => \select_ln450_31_reg_5426[6]_i_1_n_0\
    );
\select_ln450_31_reg_5426[6]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"88B8FFFF88B80000"
    )
        port map (
      I0 => max_bin_r_10_V(6),
      I1 => \icmp_ln895_75_reg_5153[0]_i_1_n_0\,
      I2 => max_bin_r_42_V(6),
      I3 => \icmp_ln895_42_reg_4953[0]_i_1_n_0\,
      I4 => \icmp_ln895_107_reg_5421[0]_i_1_n_0\,
      I5 => select_ln432_79_fu_3206_p3(6),
      O => select_ln450_31_fu_3414_p3(6)
    );
\select_ln450_31_reg_5426[6]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"20202F20"
    )
        port map (
      I0 => max_bin_r_26_V(6),
      I1 => \icmp_ln895_26_reg_4873[0]_i_1_n_0\,
      I2 => \icmp_ln895_91_reg_5273[0]_i_1_n_0\,
      I3 => max_bin_r_58_V(6),
      I4 => \icmp_ln895_58_reg_5033[0]_i_1_n_0\,
      O => select_ln432_79_fu_3206_p3(6)
    );
\select_ln450_31_reg_5426_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => select_ln450_31_fu_3414_p3(0),
      Q => \select_ln450_31_reg_5426_reg_n_0_[0]\,
      R => \select_ln450_31_reg_5426[6]_i_1_n_0\
    );
\select_ln450_31_reg_5426_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => select_ln450_31_fu_3414_p3(1),
      Q => \select_ln450_31_reg_5426_reg_n_0_[1]\,
      R => \select_ln450_31_reg_5426[6]_i_1_n_0\
    );
\select_ln450_31_reg_5426_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => select_ln450_31_fu_3414_p3(2),
      Q => \select_ln450_31_reg_5426_reg_n_0_[2]\,
      R => \select_ln450_31_reg_5426[6]_i_1_n_0\
    );
\select_ln450_31_reg_5426_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => select_ln450_31_fu_3414_p3(3),
      Q => \select_ln450_31_reg_5426_reg_n_0_[3]\,
      R => \select_ln450_31_reg_5426[6]_i_1_n_0\
    );
\select_ln450_31_reg_5426_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => select_ln450_31_fu_3414_p3(4),
      Q => \select_ln450_31_reg_5426_reg_n_0_[4]\,
      R => \select_ln450_31_reg_5426[6]_i_1_n_0\
    );
\select_ln450_31_reg_5426_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => select_ln450_31_fu_3414_p3(5),
      Q => \select_ln450_31_reg_5426_reg_n_0_[5]\,
      R => \select_ln450_31_reg_5426[6]_i_1_n_0\
    );
\select_ln450_31_reg_5426_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => select_ln450_31_fu_3414_p3(6),
      Q => \select_ln450_31_reg_5426_reg_n_0_[6]\,
      R => \select_ln450_31_reg_5426[6]_i_1_n_0\
    );
\select_ln450_32_reg_5431[0]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"ACACFF00"
    )
        port map (
      I0 => max_bin_count_10_V(0),
      I1 => max_bin_count_42_V(0),
      I2 => \icmp_ln895_75_reg_5153[0]_i_1_n_0\,
      I3 => select_ln432_80_fu_3214_p3(0),
      I4 => \icmp_ln895_107_reg_5421[0]_i_1_n_0\,
      O => select_ln450_32_fu_3422_p3(0)
    );
\select_ln450_32_reg_5431[0]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"ACAACCAC"
    )
        port map (
      I0 => max_bin_count_26_V(0),
      I1 => max_bin_count_58_V(0),
      I2 => \icmp_ln895_91_reg_5273[0]_i_2_n_0\,
      I3 => max_bin_count_58_V(3),
      I4 => max_bin_count_26_V(3),
      O => select_ln432_80_fu_3214_p3(0)
    );
\select_ln450_32_reg_5431[1]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"ACAACCAC"
    )
        port map (
      I0 => select_ln432_32_fu_2942_p3(1),
      I1 => select_ln432_80_fu_3214_p3(1),
      I2 => \select_ln450_32_reg_5431[1]_i_4_n_0\,
      I3 => select_ln432_80_fu_3214_p3(3),
      I4 => select_ln432_32_fu_2942_p3(3),
      O => select_ln450_32_fu_3422_p3(1)
    );
\select_ln450_32_reg_5431[1]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"ACAACCAC"
    )
        port map (
      I0 => max_bin_count_10_V(1),
      I1 => max_bin_count_42_V(1),
      I2 => \icmp_ln895_75_reg_5153[0]_i_2_n_0\,
      I3 => max_bin_count_42_V(3),
      I4 => max_bin_count_10_V(3),
      O => select_ln432_32_fu_2942_p3(1)
    );
\select_ln450_32_reg_5431[1]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"ACAACCAC"
    )
        port map (
      I0 => max_bin_count_26_V(1),
      I1 => max_bin_count_58_V(1),
      I2 => \icmp_ln895_91_reg_5273[0]_i_2_n_0\,
      I3 => max_bin_count_58_V(3),
      I4 => max_bin_count_26_V(3),
      O => select_ln432_80_fu_3214_p3(1)
    );
\select_ln450_32_reg_5431[1]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"2F02FFFF00002F02"
    )
        port map (
      I0 => select_ln432_32_fu_2942_p3(0),
      I1 => select_ln432_80_fu_3214_p3(0),
      I2 => select_ln432_80_fu_3214_p3(1),
      I3 => select_ln432_32_fu_2942_p3(1),
      I4 => select_ln432_80_fu_3214_p3(2),
      I5 => select_ln432_32_fu_2942_p3(2),
      O => \select_ln450_32_reg_5431[1]_i_4_n_0\
    );
\select_ln450_32_reg_5431[1]_i_5\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => max_bin_count_10_V(3),
      I1 => max_bin_count_42_V(3),
      I2 => \icmp_ln895_75_reg_5153[0]_i_1_n_0\,
      O => select_ln432_32_fu_2942_p3(3)
    );
\select_ln450_32_reg_5431[1]_i_6\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"ACAACCAC"
    )
        port map (
      I0 => max_bin_count_10_V(0),
      I1 => max_bin_count_42_V(0),
      I2 => \icmp_ln895_75_reg_5153[0]_i_2_n_0\,
      I3 => max_bin_count_42_V(3),
      I4 => max_bin_count_10_V(3),
      O => select_ln432_32_fu_2942_p3(0)
    );
\select_ln450_32_reg_5431[2]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"ACACFF00"
    )
        port map (
      I0 => max_bin_count_10_V(2),
      I1 => max_bin_count_42_V(2),
      I2 => \icmp_ln895_75_reg_5153[0]_i_1_n_0\,
      I3 => select_ln432_80_fu_3214_p3(2),
      I4 => \icmp_ln895_107_reg_5421[0]_i_1_n_0\,
      O => select_ln450_32_fu_3422_p3(2)
    );
\select_ln450_32_reg_5431[2]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"ACAACCAC"
    )
        port map (
      I0 => max_bin_count_26_V(2),
      I1 => max_bin_count_58_V(2),
      I2 => \icmp_ln895_91_reg_5273[0]_i_2_n_0\,
      I3 => max_bin_count_58_V(3),
      I4 => max_bin_count_26_V(3),
      O => select_ln432_80_fu_3214_p3(2)
    );
\select_ln450_32_reg_5431[3]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"ACACFF00"
    )
        port map (
      I0 => max_bin_count_10_V(3),
      I1 => max_bin_count_42_V(3),
      I2 => \icmp_ln895_75_reg_5153[0]_i_1_n_0\,
      I3 => select_ln432_80_fu_3214_p3(3),
      I4 => \icmp_ln895_107_reg_5421[0]_i_1_n_0\,
      O => select_ln450_32_fu_3422_p3(3)
    );
\select_ln450_32_reg_5431[3]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => max_bin_count_26_V(3),
      I1 => max_bin_count_58_V(3),
      I2 => \icmp_ln895_91_reg_5273[0]_i_1_n_0\,
      O => select_ln432_80_fu_3214_p3(3)
    );
\select_ln450_32_reg_5431_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => select_ln450_32_fu_3422_p3(0),
      Q => select_ln450_32_reg_5431(0),
      R => '0'
    );
\select_ln450_32_reg_5431_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => select_ln450_32_fu_3422_p3(1),
      Q => select_ln450_32_reg_5431(1),
      R => '0'
    );
\select_ln450_32_reg_5431_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => select_ln450_32_fu_3422_p3(2),
      Q => select_ln450_32_reg_5431(2),
      R => '0'
    );
\select_ln450_32_reg_5431_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => select_ln450_32_fu_3422_p3(3),
      Q => select_ln450_32_reg_5431(3),
      R => '0'
    );
\select_ln450_34_reg_5441[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"88B8FFFF88B80000"
    )
        port map (
      I0 => max_bin_r_11_V(0),
      I1 => \icmp_ln895_76_reg_5158[0]_i_1_n_0\,
      I2 => max_bin_r_43_V(0),
      I3 => \icmp_ln895_43_reg_4958[0]_i_1_n_0\,
      I4 => \icmp_ln895_108_reg_5436[0]_i_1_n_0\,
      I5 => select_ln432_82_fu_3223_p3(0),
      O => select_ln450_34_fu_3431_p3(0)
    );
\select_ln450_34_reg_5441[0]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"20202F20"
    )
        port map (
      I0 => max_bin_r_27_V(0),
      I1 => \icmp_ln895_27_reg_4878[0]_i_1_n_0\,
      I2 => \icmp_ln895_92_reg_5278[0]_i_1_n_0\,
      I3 => max_bin_r_59_V(0),
      I4 => \icmp_ln895_59_reg_5038[0]_i_1_n_0\,
      O => select_ln432_82_fu_3223_p3(0)
    );
\select_ln450_34_reg_5441[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"88B8FFFF88B80000"
    )
        port map (
      I0 => max_bin_r_11_V(1),
      I1 => \icmp_ln895_76_reg_5158[0]_i_1_n_0\,
      I2 => max_bin_r_43_V(1),
      I3 => \icmp_ln895_43_reg_4958[0]_i_1_n_0\,
      I4 => \icmp_ln895_108_reg_5436[0]_i_1_n_0\,
      I5 => select_ln432_82_fu_3223_p3(1),
      O => select_ln450_34_fu_3431_p3(1)
    );
\select_ln450_34_reg_5441[1]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"20202F20"
    )
        port map (
      I0 => max_bin_r_27_V(1),
      I1 => \icmp_ln895_27_reg_4878[0]_i_1_n_0\,
      I2 => \icmp_ln895_92_reg_5278[0]_i_1_n_0\,
      I3 => max_bin_r_59_V(1),
      I4 => \icmp_ln895_59_reg_5038[0]_i_1_n_0\,
      O => select_ln432_82_fu_3223_p3(1)
    );
\select_ln450_34_reg_5441[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"88B8FFFF88B80000"
    )
        port map (
      I0 => max_bin_r_11_V(2),
      I1 => \icmp_ln895_76_reg_5158[0]_i_1_n_0\,
      I2 => max_bin_r_43_V(2),
      I3 => \icmp_ln895_43_reg_4958[0]_i_1_n_0\,
      I4 => \icmp_ln895_108_reg_5436[0]_i_1_n_0\,
      I5 => select_ln432_82_fu_3223_p3(2),
      O => select_ln450_34_fu_3431_p3(2)
    );
\select_ln450_34_reg_5441[2]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"20202F20"
    )
        port map (
      I0 => max_bin_r_27_V(2),
      I1 => \icmp_ln895_27_reg_4878[0]_i_1_n_0\,
      I2 => \icmp_ln895_92_reg_5278[0]_i_1_n_0\,
      I3 => max_bin_r_59_V(2),
      I4 => \icmp_ln895_59_reg_5038[0]_i_1_n_0\,
      O => select_ln432_82_fu_3223_p3(2)
    );
\select_ln450_34_reg_5441[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"88B8FFFF88B80000"
    )
        port map (
      I0 => max_bin_r_11_V(3),
      I1 => \icmp_ln895_76_reg_5158[0]_i_1_n_0\,
      I2 => max_bin_r_43_V(3),
      I3 => \icmp_ln895_43_reg_4958[0]_i_1_n_0\,
      I4 => \icmp_ln895_108_reg_5436[0]_i_1_n_0\,
      I5 => select_ln432_82_fu_3223_p3(3),
      O => select_ln450_34_fu_3431_p3(3)
    );
\select_ln450_34_reg_5441[3]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"20202F20"
    )
        port map (
      I0 => max_bin_r_27_V(3),
      I1 => \icmp_ln895_27_reg_4878[0]_i_1_n_0\,
      I2 => \icmp_ln895_92_reg_5278[0]_i_1_n_0\,
      I3 => max_bin_r_59_V(3),
      I4 => \icmp_ln895_59_reg_5038[0]_i_1_n_0\,
      O => select_ln432_82_fu_3223_p3(3)
    );
\select_ln450_34_reg_5441[4]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"88B8FFFF88B80000"
    )
        port map (
      I0 => max_bin_r_11_V(4),
      I1 => \icmp_ln895_76_reg_5158[0]_i_1_n_0\,
      I2 => max_bin_r_43_V(4),
      I3 => \icmp_ln895_43_reg_4958[0]_i_1_n_0\,
      I4 => \icmp_ln895_108_reg_5436[0]_i_1_n_0\,
      I5 => select_ln432_82_fu_3223_p3(4),
      O => select_ln450_34_fu_3431_p3(4)
    );
\select_ln450_34_reg_5441[4]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"20202F20"
    )
        port map (
      I0 => max_bin_r_27_V(4),
      I1 => \icmp_ln895_27_reg_4878[0]_i_1_n_0\,
      I2 => \icmp_ln895_92_reg_5278[0]_i_1_n_0\,
      I3 => max_bin_r_59_V(4),
      I4 => \icmp_ln895_59_reg_5038[0]_i_1_n_0\,
      O => select_ln432_82_fu_3223_p3(4)
    );
\select_ln450_34_reg_5441[5]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"88B8FFFF88B80000"
    )
        port map (
      I0 => max_bin_r_11_V(5),
      I1 => \icmp_ln895_76_reg_5158[0]_i_1_n_0\,
      I2 => max_bin_r_43_V(5),
      I3 => \icmp_ln895_43_reg_4958[0]_i_1_n_0\,
      I4 => \icmp_ln895_108_reg_5436[0]_i_1_n_0\,
      I5 => select_ln432_82_fu_3223_p3(5),
      O => select_ln450_34_fu_3431_p3(5)
    );
\select_ln450_34_reg_5441[5]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"20202F20"
    )
        port map (
      I0 => max_bin_r_27_V(5),
      I1 => \icmp_ln895_27_reg_4878[0]_i_1_n_0\,
      I2 => \icmp_ln895_92_reg_5278[0]_i_1_n_0\,
      I3 => max_bin_r_59_V(5),
      I4 => \icmp_ln895_59_reg_5038[0]_i_1_n_0\,
      O => select_ln432_82_fu_3223_p3(5)
    );
\select_ln450_34_reg_5441[6]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000200000000"
    )
        port map (
      I0 => \icmp_ln895_108_reg_5436[0]_i_1_n_0\,
      I1 => max_bin_count_11_V(2),
      I2 => max_bin_count_11_V(3),
      I3 => max_bin_count_11_V(1),
      I4 => max_bin_count_11_V(0),
      I5 => \icmp_ln895_76_reg_5158[0]_i_1_n_0\,
      O => \select_ln450_34_reg_5441[6]_i_1_n_0\
    );
\select_ln450_34_reg_5441[6]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"88B8FFFF88B80000"
    )
        port map (
      I0 => max_bin_r_11_V(6),
      I1 => \icmp_ln895_76_reg_5158[0]_i_1_n_0\,
      I2 => max_bin_r_43_V(6),
      I3 => \icmp_ln895_43_reg_4958[0]_i_1_n_0\,
      I4 => \icmp_ln895_108_reg_5436[0]_i_1_n_0\,
      I5 => select_ln432_82_fu_3223_p3(6),
      O => select_ln450_34_fu_3431_p3(6)
    );
\select_ln450_34_reg_5441[6]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"20202F20"
    )
        port map (
      I0 => max_bin_r_27_V(6),
      I1 => \icmp_ln895_27_reg_4878[0]_i_1_n_0\,
      I2 => \icmp_ln895_92_reg_5278[0]_i_1_n_0\,
      I3 => max_bin_r_59_V(6),
      I4 => \icmp_ln895_59_reg_5038[0]_i_1_n_0\,
      O => select_ln432_82_fu_3223_p3(6)
    );
\select_ln450_34_reg_5441_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => select_ln450_34_fu_3431_p3(0),
      Q => \select_ln450_34_reg_5441_reg_n_0_[0]\,
      R => \select_ln450_34_reg_5441[6]_i_1_n_0\
    );
\select_ln450_34_reg_5441_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => select_ln450_34_fu_3431_p3(1),
      Q => \select_ln450_34_reg_5441_reg_n_0_[1]\,
      R => \select_ln450_34_reg_5441[6]_i_1_n_0\
    );
\select_ln450_34_reg_5441_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => select_ln450_34_fu_3431_p3(2),
      Q => \select_ln450_34_reg_5441_reg_n_0_[2]\,
      R => \select_ln450_34_reg_5441[6]_i_1_n_0\
    );
\select_ln450_34_reg_5441_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => select_ln450_34_fu_3431_p3(3),
      Q => \select_ln450_34_reg_5441_reg_n_0_[3]\,
      R => \select_ln450_34_reg_5441[6]_i_1_n_0\
    );
\select_ln450_34_reg_5441_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => select_ln450_34_fu_3431_p3(4),
      Q => \select_ln450_34_reg_5441_reg_n_0_[4]\,
      R => \select_ln450_34_reg_5441[6]_i_1_n_0\
    );
\select_ln450_34_reg_5441_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => select_ln450_34_fu_3431_p3(5),
      Q => \select_ln450_34_reg_5441_reg_n_0_[5]\,
      R => \select_ln450_34_reg_5441[6]_i_1_n_0\
    );
\select_ln450_34_reg_5441_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => select_ln450_34_fu_3431_p3(6),
      Q => \select_ln450_34_reg_5441_reg_n_0_[6]\,
      R => \select_ln450_34_reg_5441[6]_i_1_n_0\
    );
\select_ln450_35_reg_5446[0]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"ACACFF00"
    )
        port map (
      I0 => max_bin_count_11_V(0),
      I1 => max_bin_count_43_V(0),
      I2 => \icmp_ln895_76_reg_5158[0]_i_1_n_0\,
      I3 => select_ln432_83_fu_3231_p3(0),
      I4 => \icmp_ln895_108_reg_5436[0]_i_1_n_0\,
      O => select_ln450_35_fu_3439_p3(0)
    );
\select_ln450_35_reg_5446[0]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"ACAACCAC"
    )
        port map (
      I0 => max_bin_count_27_V(0),
      I1 => max_bin_count_59_V(0),
      I2 => \icmp_ln895_92_reg_5278[0]_i_2_n_0\,
      I3 => max_bin_count_59_V(3),
      I4 => max_bin_count_27_V(3),
      O => select_ln432_83_fu_3231_p3(0)
    );
\select_ln450_35_reg_5446[1]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"ACAACCAC"
    )
        port map (
      I0 => select_ln432_35_fu_2959_p3(1),
      I1 => select_ln432_83_fu_3231_p3(1),
      I2 => \select_ln450_35_reg_5446[1]_i_4_n_0\,
      I3 => select_ln432_83_fu_3231_p3(3),
      I4 => select_ln432_35_fu_2959_p3(3),
      O => select_ln450_35_fu_3439_p3(1)
    );
\select_ln450_35_reg_5446[1]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"ACAACCAC"
    )
        port map (
      I0 => max_bin_count_11_V(1),
      I1 => max_bin_count_43_V(1),
      I2 => \icmp_ln895_76_reg_5158[0]_i_2_n_0\,
      I3 => max_bin_count_43_V(3),
      I4 => max_bin_count_11_V(3),
      O => select_ln432_35_fu_2959_p3(1)
    );
\select_ln450_35_reg_5446[1]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"ACAACCAC"
    )
        port map (
      I0 => max_bin_count_27_V(1),
      I1 => max_bin_count_59_V(1),
      I2 => \icmp_ln895_92_reg_5278[0]_i_2_n_0\,
      I3 => max_bin_count_59_V(3),
      I4 => max_bin_count_27_V(3),
      O => select_ln432_83_fu_3231_p3(1)
    );
\select_ln450_35_reg_5446[1]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"2F02FFFF00002F02"
    )
        port map (
      I0 => select_ln432_35_fu_2959_p3(0),
      I1 => select_ln432_83_fu_3231_p3(0),
      I2 => select_ln432_83_fu_3231_p3(1),
      I3 => select_ln432_35_fu_2959_p3(1),
      I4 => select_ln432_83_fu_3231_p3(2),
      I5 => select_ln432_35_fu_2959_p3(2),
      O => \select_ln450_35_reg_5446[1]_i_4_n_0\
    );
\select_ln450_35_reg_5446[1]_i_5\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => max_bin_count_11_V(3),
      I1 => max_bin_count_43_V(3),
      I2 => \icmp_ln895_76_reg_5158[0]_i_1_n_0\,
      O => select_ln432_35_fu_2959_p3(3)
    );
\select_ln450_35_reg_5446[1]_i_6\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"ACAACCAC"
    )
        port map (
      I0 => max_bin_count_11_V(0),
      I1 => max_bin_count_43_V(0),
      I2 => \icmp_ln895_76_reg_5158[0]_i_2_n_0\,
      I3 => max_bin_count_43_V(3),
      I4 => max_bin_count_11_V(3),
      O => select_ln432_35_fu_2959_p3(0)
    );
\select_ln450_35_reg_5446[2]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"ACACFF00"
    )
        port map (
      I0 => max_bin_count_11_V(2),
      I1 => max_bin_count_43_V(2),
      I2 => \icmp_ln895_76_reg_5158[0]_i_1_n_0\,
      I3 => select_ln432_83_fu_3231_p3(2),
      I4 => \icmp_ln895_108_reg_5436[0]_i_1_n_0\,
      O => select_ln450_35_fu_3439_p3(2)
    );
\select_ln450_35_reg_5446[2]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"ACAACCAC"
    )
        port map (
      I0 => max_bin_count_27_V(2),
      I1 => max_bin_count_59_V(2),
      I2 => \icmp_ln895_92_reg_5278[0]_i_2_n_0\,
      I3 => max_bin_count_59_V(3),
      I4 => max_bin_count_27_V(3),
      O => select_ln432_83_fu_3231_p3(2)
    );
\select_ln450_35_reg_5446[3]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"ACACFF00"
    )
        port map (
      I0 => max_bin_count_11_V(3),
      I1 => max_bin_count_43_V(3),
      I2 => \icmp_ln895_76_reg_5158[0]_i_1_n_0\,
      I3 => select_ln432_83_fu_3231_p3(3),
      I4 => \icmp_ln895_108_reg_5436[0]_i_1_n_0\,
      O => select_ln450_35_fu_3439_p3(3)
    );
\select_ln450_35_reg_5446[3]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => max_bin_count_27_V(3),
      I1 => max_bin_count_59_V(3),
      I2 => \icmp_ln895_92_reg_5278[0]_i_1_n_0\,
      O => select_ln432_83_fu_3231_p3(3)
    );
\select_ln450_35_reg_5446_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => select_ln450_35_fu_3439_p3(0),
      Q => select_ln450_35_reg_5446(0),
      R => '0'
    );
\select_ln450_35_reg_5446_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => select_ln450_35_fu_3439_p3(1),
      Q => select_ln450_35_reg_5446(1),
      R => '0'
    );
\select_ln450_35_reg_5446_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => select_ln450_35_fu_3439_p3(2),
      Q => select_ln450_35_reg_5446(2),
      R => '0'
    );
\select_ln450_35_reg_5446_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => select_ln450_35_fu_3439_p3(3),
      Q => select_ln450_35_reg_5446(3),
      R => '0'
    );
\select_ln450_37_reg_5456[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"88B8FFFF88B80000"
    )
        port map (
      I0 => max_bin_r_12_V(0),
      I1 => \icmp_ln895_77_reg_5163[0]_i_1_n_0\,
      I2 => max_bin_r_44_V(0),
      I3 => \icmp_ln895_44_reg_4963[0]_i_1_n_0\,
      I4 => \icmp_ln895_109_reg_5451[0]_i_1_n_0\,
      I5 => select_ln432_85_fu_3240_p3(0),
      O => select_ln450_37_fu_3448_p3(0)
    );
\select_ln450_37_reg_5456[0]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"20202F20"
    )
        port map (
      I0 => max_bin_r_28_V(0),
      I1 => \icmp_ln895_28_reg_4883[0]_i_1_n_0\,
      I2 => \icmp_ln895_93_reg_5283[0]_i_1_n_0\,
      I3 => max_bin_r_60_V(0),
      I4 => \icmp_ln895_60_reg_5043[0]_i_1_n_0\,
      O => select_ln432_85_fu_3240_p3(0)
    );
\select_ln450_37_reg_5456[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"88B8FFFF88B80000"
    )
        port map (
      I0 => max_bin_r_12_V(1),
      I1 => \icmp_ln895_77_reg_5163[0]_i_1_n_0\,
      I2 => max_bin_r_44_V(1),
      I3 => \icmp_ln895_44_reg_4963[0]_i_1_n_0\,
      I4 => \icmp_ln895_109_reg_5451[0]_i_1_n_0\,
      I5 => select_ln432_85_fu_3240_p3(1),
      O => select_ln450_37_fu_3448_p3(1)
    );
\select_ln450_37_reg_5456[1]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"20202F20"
    )
        port map (
      I0 => max_bin_r_28_V(1),
      I1 => \icmp_ln895_28_reg_4883[0]_i_1_n_0\,
      I2 => \icmp_ln895_93_reg_5283[0]_i_1_n_0\,
      I3 => max_bin_r_60_V(1),
      I4 => \icmp_ln895_60_reg_5043[0]_i_1_n_0\,
      O => select_ln432_85_fu_3240_p3(1)
    );
\select_ln450_37_reg_5456[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"88B8FFFF88B80000"
    )
        port map (
      I0 => max_bin_r_12_V(2),
      I1 => \icmp_ln895_77_reg_5163[0]_i_1_n_0\,
      I2 => max_bin_r_44_V(2),
      I3 => \icmp_ln895_44_reg_4963[0]_i_1_n_0\,
      I4 => \icmp_ln895_109_reg_5451[0]_i_1_n_0\,
      I5 => select_ln432_85_fu_3240_p3(2),
      O => select_ln450_37_fu_3448_p3(2)
    );
\select_ln450_37_reg_5456[2]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"20202F20"
    )
        port map (
      I0 => max_bin_r_28_V(2),
      I1 => \icmp_ln895_28_reg_4883[0]_i_1_n_0\,
      I2 => \icmp_ln895_93_reg_5283[0]_i_1_n_0\,
      I3 => max_bin_r_60_V(2),
      I4 => \icmp_ln895_60_reg_5043[0]_i_1_n_0\,
      O => select_ln432_85_fu_3240_p3(2)
    );
\select_ln450_37_reg_5456[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"88B8FFFF88B80000"
    )
        port map (
      I0 => max_bin_r_12_V(3),
      I1 => \icmp_ln895_77_reg_5163[0]_i_1_n_0\,
      I2 => max_bin_r_44_V(3),
      I3 => \icmp_ln895_44_reg_4963[0]_i_1_n_0\,
      I4 => \icmp_ln895_109_reg_5451[0]_i_1_n_0\,
      I5 => select_ln432_85_fu_3240_p3(3),
      O => select_ln450_37_fu_3448_p3(3)
    );
\select_ln450_37_reg_5456[3]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"20202F20"
    )
        port map (
      I0 => max_bin_r_28_V(3),
      I1 => \icmp_ln895_28_reg_4883[0]_i_1_n_0\,
      I2 => \icmp_ln895_93_reg_5283[0]_i_1_n_0\,
      I3 => max_bin_r_60_V(3),
      I4 => \icmp_ln895_60_reg_5043[0]_i_1_n_0\,
      O => select_ln432_85_fu_3240_p3(3)
    );
\select_ln450_37_reg_5456[4]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"88B8FFFF88B80000"
    )
        port map (
      I0 => max_bin_r_12_V(4),
      I1 => \icmp_ln895_77_reg_5163[0]_i_1_n_0\,
      I2 => max_bin_r_44_V(4),
      I3 => \icmp_ln895_44_reg_4963[0]_i_1_n_0\,
      I4 => \icmp_ln895_109_reg_5451[0]_i_1_n_0\,
      I5 => select_ln432_85_fu_3240_p3(4),
      O => select_ln450_37_fu_3448_p3(4)
    );
\select_ln450_37_reg_5456[4]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"20202F20"
    )
        port map (
      I0 => max_bin_r_28_V(4),
      I1 => \icmp_ln895_28_reg_4883[0]_i_1_n_0\,
      I2 => \icmp_ln895_93_reg_5283[0]_i_1_n_0\,
      I3 => max_bin_r_60_V(4),
      I4 => \icmp_ln895_60_reg_5043[0]_i_1_n_0\,
      O => select_ln432_85_fu_3240_p3(4)
    );
\select_ln450_37_reg_5456[5]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"88B8FFFF88B80000"
    )
        port map (
      I0 => max_bin_r_12_V(5),
      I1 => \icmp_ln895_77_reg_5163[0]_i_1_n_0\,
      I2 => max_bin_r_44_V(5),
      I3 => \icmp_ln895_44_reg_4963[0]_i_1_n_0\,
      I4 => \icmp_ln895_109_reg_5451[0]_i_1_n_0\,
      I5 => select_ln432_85_fu_3240_p3(5),
      O => select_ln450_37_fu_3448_p3(5)
    );
\select_ln450_37_reg_5456[5]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"20202F20"
    )
        port map (
      I0 => max_bin_r_28_V(5),
      I1 => \icmp_ln895_28_reg_4883[0]_i_1_n_0\,
      I2 => \icmp_ln895_93_reg_5283[0]_i_1_n_0\,
      I3 => max_bin_r_60_V(5),
      I4 => \icmp_ln895_60_reg_5043[0]_i_1_n_0\,
      O => select_ln432_85_fu_3240_p3(5)
    );
\select_ln450_37_reg_5456[6]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000200000000"
    )
        port map (
      I0 => \icmp_ln895_109_reg_5451[0]_i_1_n_0\,
      I1 => max_bin_count_12_V(2),
      I2 => max_bin_count_12_V(3),
      I3 => max_bin_count_12_V(1),
      I4 => max_bin_count_12_V(0),
      I5 => \icmp_ln895_77_reg_5163[0]_i_1_n_0\,
      O => \select_ln450_37_reg_5456[6]_i_1_n_0\
    );
\select_ln450_37_reg_5456[6]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"88B8FFFF88B80000"
    )
        port map (
      I0 => max_bin_r_12_V(6),
      I1 => \icmp_ln895_77_reg_5163[0]_i_1_n_0\,
      I2 => max_bin_r_44_V(6),
      I3 => \icmp_ln895_44_reg_4963[0]_i_1_n_0\,
      I4 => \icmp_ln895_109_reg_5451[0]_i_1_n_0\,
      I5 => select_ln432_85_fu_3240_p3(6),
      O => select_ln450_37_fu_3448_p3(6)
    );
\select_ln450_37_reg_5456[6]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"20202F20"
    )
        port map (
      I0 => max_bin_r_28_V(6),
      I1 => \icmp_ln895_28_reg_4883[0]_i_1_n_0\,
      I2 => \icmp_ln895_93_reg_5283[0]_i_1_n_0\,
      I3 => max_bin_r_60_V(6),
      I4 => \icmp_ln895_60_reg_5043[0]_i_1_n_0\,
      O => select_ln432_85_fu_3240_p3(6)
    );
\select_ln450_37_reg_5456_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => select_ln450_37_fu_3448_p3(0),
      Q => \select_ln450_37_reg_5456_reg_n_0_[0]\,
      R => \select_ln450_37_reg_5456[6]_i_1_n_0\
    );
\select_ln450_37_reg_5456_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => select_ln450_37_fu_3448_p3(1),
      Q => \select_ln450_37_reg_5456_reg_n_0_[1]\,
      R => \select_ln450_37_reg_5456[6]_i_1_n_0\
    );
\select_ln450_37_reg_5456_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => select_ln450_37_fu_3448_p3(2),
      Q => \select_ln450_37_reg_5456_reg_n_0_[2]\,
      R => \select_ln450_37_reg_5456[6]_i_1_n_0\
    );
\select_ln450_37_reg_5456_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => select_ln450_37_fu_3448_p3(3),
      Q => \select_ln450_37_reg_5456_reg_n_0_[3]\,
      R => \select_ln450_37_reg_5456[6]_i_1_n_0\
    );
\select_ln450_37_reg_5456_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => select_ln450_37_fu_3448_p3(4),
      Q => \select_ln450_37_reg_5456_reg_n_0_[4]\,
      R => \select_ln450_37_reg_5456[6]_i_1_n_0\
    );
\select_ln450_37_reg_5456_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => select_ln450_37_fu_3448_p3(5),
      Q => \select_ln450_37_reg_5456_reg_n_0_[5]\,
      R => \select_ln450_37_reg_5456[6]_i_1_n_0\
    );
\select_ln450_37_reg_5456_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => select_ln450_37_fu_3448_p3(6),
      Q => \select_ln450_37_reg_5456_reg_n_0_[6]\,
      R => \select_ln450_37_reg_5456[6]_i_1_n_0\
    );
\select_ln450_38_reg_5461[0]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"ACACFF00"
    )
        port map (
      I0 => max_bin_count_12_V(0),
      I1 => max_bin_count_44_V(0),
      I2 => \icmp_ln895_77_reg_5163[0]_i_1_n_0\,
      I3 => select_ln432_86_fu_3248_p3(0),
      I4 => \icmp_ln895_109_reg_5451[0]_i_1_n_0\,
      O => select_ln450_38_fu_3456_p3(0)
    );
\select_ln450_38_reg_5461[0]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"ACAACCAC"
    )
        port map (
      I0 => max_bin_count_28_V(0),
      I1 => max_bin_count_60_V(0),
      I2 => \icmp_ln895_93_reg_5283[0]_i_2_n_0\,
      I3 => max_bin_count_60_V(3),
      I4 => max_bin_count_28_V(3),
      O => select_ln432_86_fu_3248_p3(0)
    );
\select_ln450_38_reg_5461[1]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"ACAACCAC"
    )
        port map (
      I0 => select_ln432_38_fu_2976_p3(1),
      I1 => select_ln432_86_fu_3248_p3(1),
      I2 => \select_ln450_38_reg_5461[1]_i_4_n_0\,
      I3 => select_ln432_86_fu_3248_p3(3),
      I4 => select_ln432_38_fu_2976_p3(3),
      O => select_ln450_38_fu_3456_p3(1)
    );
\select_ln450_38_reg_5461[1]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"ACAACCAC"
    )
        port map (
      I0 => max_bin_count_12_V(1),
      I1 => max_bin_count_44_V(1),
      I2 => \icmp_ln895_77_reg_5163[0]_i_2_n_0\,
      I3 => max_bin_count_44_V(3),
      I4 => max_bin_count_12_V(3),
      O => select_ln432_38_fu_2976_p3(1)
    );
\select_ln450_38_reg_5461[1]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"ACAACCAC"
    )
        port map (
      I0 => max_bin_count_28_V(1),
      I1 => max_bin_count_60_V(1),
      I2 => \icmp_ln895_93_reg_5283[0]_i_2_n_0\,
      I3 => max_bin_count_60_V(3),
      I4 => max_bin_count_28_V(3),
      O => select_ln432_86_fu_3248_p3(1)
    );
\select_ln450_38_reg_5461[1]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"2F02FFFF00002F02"
    )
        port map (
      I0 => select_ln432_38_fu_2976_p3(0),
      I1 => select_ln432_86_fu_3248_p3(0),
      I2 => select_ln432_86_fu_3248_p3(1),
      I3 => select_ln432_38_fu_2976_p3(1),
      I4 => select_ln432_86_fu_3248_p3(2),
      I5 => select_ln432_38_fu_2976_p3(2),
      O => \select_ln450_38_reg_5461[1]_i_4_n_0\
    );
\select_ln450_38_reg_5461[1]_i_5\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => max_bin_count_12_V(3),
      I1 => max_bin_count_44_V(3),
      I2 => \icmp_ln895_77_reg_5163[0]_i_1_n_0\,
      O => select_ln432_38_fu_2976_p3(3)
    );
\select_ln450_38_reg_5461[1]_i_6\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"ACAACCAC"
    )
        port map (
      I0 => max_bin_count_12_V(0),
      I1 => max_bin_count_44_V(0),
      I2 => \icmp_ln895_77_reg_5163[0]_i_2_n_0\,
      I3 => max_bin_count_44_V(3),
      I4 => max_bin_count_12_V(3),
      O => select_ln432_38_fu_2976_p3(0)
    );
\select_ln450_38_reg_5461[2]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"ACACFF00"
    )
        port map (
      I0 => max_bin_count_12_V(2),
      I1 => max_bin_count_44_V(2),
      I2 => \icmp_ln895_77_reg_5163[0]_i_1_n_0\,
      I3 => select_ln432_86_fu_3248_p3(2),
      I4 => \icmp_ln895_109_reg_5451[0]_i_1_n_0\,
      O => select_ln450_38_fu_3456_p3(2)
    );
\select_ln450_38_reg_5461[2]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"ACAACCAC"
    )
        port map (
      I0 => max_bin_count_28_V(2),
      I1 => max_bin_count_60_V(2),
      I2 => \icmp_ln895_93_reg_5283[0]_i_2_n_0\,
      I3 => max_bin_count_60_V(3),
      I4 => max_bin_count_28_V(3),
      O => select_ln432_86_fu_3248_p3(2)
    );
\select_ln450_38_reg_5461[3]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"ACACFF00"
    )
        port map (
      I0 => max_bin_count_12_V(3),
      I1 => max_bin_count_44_V(3),
      I2 => \icmp_ln895_77_reg_5163[0]_i_1_n_0\,
      I3 => select_ln432_86_fu_3248_p3(3),
      I4 => \icmp_ln895_109_reg_5451[0]_i_1_n_0\,
      O => select_ln450_38_fu_3456_p3(3)
    );
\select_ln450_38_reg_5461[3]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => max_bin_count_28_V(3),
      I1 => max_bin_count_60_V(3),
      I2 => \icmp_ln895_93_reg_5283[0]_i_1_n_0\,
      O => select_ln432_86_fu_3248_p3(3)
    );
\select_ln450_38_reg_5461_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => select_ln450_38_fu_3456_p3(0),
      Q => select_ln450_38_reg_5461(0),
      R => '0'
    );
\select_ln450_38_reg_5461_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => select_ln450_38_fu_3456_p3(1),
      Q => select_ln450_38_reg_5461(1),
      R => '0'
    );
\select_ln450_38_reg_5461_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => select_ln450_38_fu_3456_p3(2),
      Q => select_ln450_38_reg_5461(2),
      R => '0'
    );
\select_ln450_38_reg_5461_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => select_ln450_38_fu_3456_p3(3),
      Q => select_ln450_38_reg_5461(3),
      R => '0'
    );
\select_ln450_40_reg_5471[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"88B8FFFF88B80000"
    )
        port map (
      I0 => max_bin_r_13_V(0),
      I1 => \icmp_ln895_78_reg_5168[0]_i_1_n_0\,
      I2 => max_bin_r_45_V(0),
      I3 => \icmp_ln895_45_reg_4968[0]_i_1_n_0\,
      I4 => \icmp_ln895_110_reg_5466[0]_i_1_n_0\,
      I5 => select_ln432_88_fu_3257_p3(0),
      O => select_ln450_40_fu_3465_p3(0)
    );
\select_ln450_40_reg_5471[0]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"20202F20"
    )
        port map (
      I0 => max_bin_r_29_V(0),
      I1 => \icmp_ln895_29_reg_4888[0]_i_1_n_0\,
      I2 => \icmp_ln895_94_reg_5288[0]_i_1_n_0\,
      I3 => max_bin_r_61_V(0),
      I4 => \icmp_ln895_61_reg_5048[0]_i_1_n_0\,
      O => select_ln432_88_fu_3257_p3(0)
    );
\select_ln450_40_reg_5471[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"88B8FFFF88B80000"
    )
        port map (
      I0 => max_bin_r_13_V(1),
      I1 => \icmp_ln895_78_reg_5168[0]_i_1_n_0\,
      I2 => max_bin_r_45_V(1),
      I3 => \icmp_ln895_45_reg_4968[0]_i_1_n_0\,
      I4 => \icmp_ln895_110_reg_5466[0]_i_1_n_0\,
      I5 => select_ln432_88_fu_3257_p3(1),
      O => select_ln450_40_fu_3465_p3(1)
    );
\select_ln450_40_reg_5471[1]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"20202F20"
    )
        port map (
      I0 => max_bin_r_29_V(1),
      I1 => \icmp_ln895_29_reg_4888[0]_i_1_n_0\,
      I2 => \icmp_ln895_94_reg_5288[0]_i_1_n_0\,
      I3 => max_bin_r_61_V(1),
      I4 => \icmp_ln895_61_reg_5048[0]_i_1_n_0\,
      O => select_ln432_88_fu_3257_p3(1)
    );
\select_ln450_40_reg_5471[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"88B8FFFF88B80000"
    )
        port map (
      I0 => max_bin_r_13_V(2),
      I1 => \icmp_ln895_78_reg_5168[0]_i_1_n_0\,
      I2 => max_bin_r_45_V(2),
      I3 => \icmp_ln895_45_reg_4968[0]_i_1_n_0\,
      I4 => \icmp_ln895_110_reg_5466[0]_i_1_n_0\,
      I5 => select_ln432_88_fu_3257_p3(2),
      O => select_ln450_40_fu_3465_p3(2)
    );
\select_ln450_40_reg_5471[2]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"20202F20"
    )
        port map (
      I0 => max_bin_r_29_V(2),
      I1 => \icmp_ln895_29_reg_4888[0]_i_1_n_0\,
      I2 => \icmp_ln895_94_reg_5288[0]_i_1_n_0\,
      I3 => max_bin_r_61_V(2),
      I4 => \icmp_ln895_61_reg_5048[0]_i_1_n_0\,
      O => select_ln432_88_fu_3257_p3(2)
    );
\select_ln450_40_reg_5471[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"88B8FFFF88B80000"
    )
        port map (
      I0 => max_bin_r_13_V(3),
      I1 => \icmp_ln895_78_reg_5168[0]_i_1_n_0\,
      I2 => max_bin_r_45_V(3),
      I3 => \icmp_ln895_45_reg_4968[0]_i_1_n_0\,
      I4 => \icmp_ln895_110_reg_5466[0]_i_1_n_0\,
      I5 => select_ln432_88_fu_3257_p3(3),
      O => select_ln450_40_fu_3465_p3(3)
    );
\select_ln450_40_reg_5471[3]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"20202F20"
    )
        port map (
      I0 => max_bin_r_29_V(3),
      I1 => \icmp_ln895_29_reg_4888[0]_i_1_n_0\,
      I2 => \icmp_ln895_94_reg_5288[0]_i_1_n_0\,
      I3 => max_bin_r_61_V(3),
      I4 => \icmp_ln895_61_reg_5048[0]_i_1_n_0\,
      O => select_ln432_88_fu_3257_p3(3)
    );
\select_ln450_40_reg_5471[4]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"88B8FFFF88B80000"
    )
        port map (
      I0 => max_bin_r_13_V(4),
      I1 => \icmp_ln895_78_reg_5168[0]_i_1_n_0\,
      I2 => max_bin_r_45_V(4),
      I3 => \icmp_ln895_45_reg_4968[0]_i_1_n_0\,
      I4 => \icmp_ln895_110_reg_5466[0]_i_1_n_0\,
      I5 => select_ln432_88_fu_3257_p3(4),
      O => select_ln450_40_fu_3465_p3(4)
    );
\select_ln450_40_reg_5471[4]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"20202F20"
    )
        port map (
      I0 => max_bin_r_29_V(4),
      I1 => \icmp_ln895_29_reg_4888[0]_i_1_n_0\,
      I2 => \icmp_ln895_94_reg_5288[0]_i_1_n_0\,
      I3 => max_bin_r_61_V(4),
      I4 => \icmp_ln895_61_reg_5048[0]_i_1_n_0\,
      O => select_ln432_88_fu_3257_p3(4)
    );
\select_ln450_40_reg_5471[5]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"88B8FFFF88B80000"
    )
        port map (
      I0 => max_bin_r_13_V(5),
      I1 => \icmp_ln895_78_reg_5168[0]_i_1_n_0\,
      I2 => max_bin_r_45_V(5),
      I3 => \icmp_ln895_45_reg_4968[0]_i_1_n_0\,
      I4 => \icmp_ln895_110_reg_5466[0]_i_1_n_0\,
      I5 => select_ln432_88_fu_3257_p3(5),
      O => select_ln450_40_fu_3465_p3(5)
    );
\select_ln450_40_reg_5471[5]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"20202F20"
    )
        port map (
      I0 => max_bin_r_29_V(5),
      I1 => \icmp_ln895_29_reg_4888[0]_i_1_n_0\,
      I2 => \icmp_ln895_94_reg_5288[0]_i_1_n_0\,
      I3 => max_bin_r_61_V(5),
      I4 => \icmp_ln895_61_reg_5048[0]_i_1_n_0\,
      O => select_ln432_88_fu_3257_p3(5)
    );
\select_ln450_40_reg_5471[6]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000200000000"
    )
        port map (
      I0 => \icmp_ln895_110_reg_5466[0]_i_1_n_0\,
      I1 => max_bin_count_13_V(2),
      I2 => max_bin_count_13_V(3),
      I3 => max_bin_count_13_V(1),
      I4 => max_bin_count_13_V(0),
      I5 => \icmp_ln895_78_reg_5168[0]_i_1_n_0\,
      O => \select_ln450_40_reg_5471[6]_i_1_n_0\
    );
\select_ln450_40_reg_5471[6]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"88B8FFFF88B80000"
    )
        port map (
      I0 => max_bin_r_13_V(6),
      I1 => \icmp_ln895_78_reg_5168[0]_i_1_n_0\,
      I2 => max_bin_r_45_V(6),
      I3 => \icmp_ln895_45_reg_4968[0]_i_1_n_0\,
      I4 => \icmp_ln895_110_reg_5466[0]_i_1_n_0\,
      I5 => select_ln432_88_fu_3257_p3(6),
      O => select_ln450_40_fu_3465_p3(6)
    );
\select_ln450_40_reg_5471[6]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"20202F20"
    )
        port map (
      I0 => max_bin_r_29_V(6),
      I1 => \icmp_ln895_29_reg_4888[0]_i_1_n_0\,
      I2 => \icmp_ln895_94_reg_5288[0]_i_1_n_0\,
      I3 => max_bin_r_61_V(6),
      I4 => \icmp_ln895_61_reg_5048[0]_i_1_n_0\,
      O => select_ln432_88_fu_3257_p3(6)
    );
\select_ln450_40_reg_5471_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => select_ln450_40_fu_3465_p3(0),
      Q => \select_ln450_40_reg_5471_reg_n_0_[0]\,
      R => \select_ln450_40_reg_5471[6]_i_1_n_0\
    );
\select_ln450_40_reg_5471_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => select_ln450_40_fu_3465_p3(1),
      Q => \select_ln450_40_reg_5471_reg_n_0_[1]\,
      R => \select_ln450_40_reg_5471[6]_i_1_n_0\
    );
\select_ln450_40_reg_5471_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => select_ln450_40_fu_3465_p3(2),
      Q => \select_ln450_40_reg_5471_reg_n_0_[2]\,
      R => \select_ln450_40_reg_5471[6]_i_1_n_0\
    );
\select_ln450_40_reg_5471_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => select_ln450_40_fu_3465_p3(3),
      Q => \select_ln450_40_reg_5471_reg_n_0_[3]\,
      R => \select_ln450_40_reg_5471[6]_i_1_n_0\
    );
\select_ln450_40_reg_5471_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => select_ln450_40_fu_3465_p3(4),
      Q => \select_ln450_40_reg_5471_reg_n_0_[4]\,
      R => \select_ln450_40_reg_5471[6]_i_1_n_0\
    );
\select_ln450_40_reg_5471_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => select_ln450_40_fu_3465_p3(5),
      Q => \select_ln450_40_reg_5471_reg_n_0_[5]\,
      R => \select_ln450_40_reg_5471[6]_i_1_n_0\
    );
\select_ln450_40_reg_5471_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => select_ln450_40_fu_3465_p3(6),
      Q => \select_ln450_40_reg_5471_reg_n_0_[6]\,
      R => \select_ln450_40_reg_5471[6]_i_1_n_0\
    );
\select_ln450_41_reg_5476[0]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"ACACFF00"
    )
        port map (
      I0 => max_bin_count_13_V(0),
      I1 => max_bin_count_45_V(0),
      I2 => \icmp_ln895_78_reg_5168[0]_i_1_n_0\,
      I3 => select_ln432_89_fu_3265_p3(0),
      I4 => \icmp_ln895_110_reg_5466[0]_i_1_n_0\,
      O => select_ln450_41_fu_3473_p3(0)
    );
\select_ln450_41_reg_5476[0]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"ACAACCAC"
    )
        port map (
      I0 => max_bin_count_29_V(0),
      I1 => max_bin_count_61_V(0),
      I2 => \icmp_ln895_94_reg_5288[0]_i_2_n_0\,
      I3 => max_bin_count_61_V(3),
      I4 => max_bin_count_29_V(3),
      O => select_ln432_89_fu_3265_p3(0)
    );
\select_ln450_41_reg_5476[1]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"ACAACCAC"
    )
        port map (
      I0 => select_ln432_41_fu_2993_p3(1),
      I1 => select_ln432_89_fu_3265_p3(1),
      I2 => \select_ln450_41_reg_5476[1]_i_4_n_0\,
      I3 => select_ln432_89_fu_3265_p3(3),
      I4 => select_ln432_41_fu_2993_p3(3),
      O => select_ln450_41_fu_3473_p3(1)
    );
\select_ln450_41_reg_5476[1]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"ACAACCAC"
    )
        port map (
      I0 => max_bin_count_13_V(1),
      I1 => max_bin_count_45_V(1),
      I2 => \icmp_ln895_78_reg_5168[0]_i_2_n_0\,
      I3 => max_bin_count_45_V(3),
      I4 => max_bin_count_13_V(3),
      O => select_ln432_41_fu_2993_p3(1)
    );
\select_ln450_41_reg_5476[1]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"ACAACCAC"
    )
        port map (
      I0 => max_bin_count_29_V(1),
      I1 => max_bin_count_61_V(1),
      I2 => \icmp_ln895_94_reg_5288[0]_i_2_n_0\,
      I3 => max_bin_count_61_V(3),
      I4 => max_bin_count_29_V(3),
      O => select_ln432_89_fu_3265_p3(1)
    );
\select_ln450_41_reg_5476[1]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"2F02FFFF00002F02"
    )
        port map (
      I0 => select_ln432_41_fu_2993_p3(0),
      I1 => select_ln432_89_fu_3265_p3(0),
      I2 => select_ln432_89_fu_3265_p3(1),
      I3 => select_ln432_41_fu_2993_p3(1),
      I4 => select_ln432_89_fu_3265_p3(2),
      I5 => select_ln432_41_fu_2993_p3(2),
      O => \select_ln450_41_reg_5476[1]_i_4_n_0\
    );
\select_ln450_41_reg_5476[1]_i_5\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => max_bin_count_13_V(3),
      I1 => max_bin_count_45_V(3),
      I2 => \icmp_ln895_78_reg_5168[0]_i_1_n_0\,
      O => select_ln432_41_fu_2993_p3(3)
    );
\select_ln450_41_reg_5476[1]_i_6\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"ACAACCAC"
    )
        port map (
      I0 => max_bin_count_13_V(0),
      I1 => max_bin_count_45_V(0),
      I2 => \icmp_ln895_78_reg_5168[0]_i_2_n_0\,
      I3 => max_bin_count_45_V(3),
      I4 => max_bin_count_13_V(3),
      O => select_ln432_41_fu_2993_p3(0)
    );
\select_ln450_41_reg_5476[2]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"ACACFF00"
    )
        port map (
      I0 => max_bin_count_13_V(2),
      I1 => max_bin_count_45_V(2),
      I2 => \icmp_ln895_78_reg_5168[0]_i_1_n_0\,
      I3 => select_ln432_89_fu_3265_p3(2),
      I4 => \icmp_ln895_110_reg_5466[0]_i_1_n_0\,
      O => select_ln450_41_fu_3473_p3(2)
    );
\select_ln450_41_reg_5476[2]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"ACAACCAC"
    )
        port map (
      I0 => max_bin_count_29_V(2),
      I1 => max_bin_count_61_V(2),
      I2 => \icmp_ln895_94_reg_5288[0]_i_2_n_0\,
      I3 => max_bin_count_61_V(3),
      I4 => max_bin_count_29_V(3),
      O => select_ln432_89_fu_3265_p3(2)
    );
\select_ln450_41_reg_5476[3]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"ACACFF00"
    )
        port map (
      I0 => max_bin_count_13_V(3),
      I1 => max_bin_count_45_V(3),
      I2 => \icmp_ln895_78_reg_5168[0]_i_1_n_0\,
      I3 => select_ln432_89_fu_3265_p3(3),
      I4 => \icmp_ln895_110_reg_5466[0]_i_1_n_0\,
      O => select_ln450_41_fu_3473_p3(3)
    );
\select_ln450_41_reg_5476[3]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => max_bin_count_29_V(3),
      I1 => max_bin_count_61_V(3),
      I2 => \icmp_ln895_94_reg_5288[0]_i_1_n_0\,
      O => select_ln432_89_fu_3265_p3(3)
    );
\select_ln450_41_reg_5476_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => select_ln450_41_fu_3473_p3(0),
      Q => select_ln450_41_reg_5476(0),
      R => '0'
    );
\select_ln450_41_reg_5476_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => select_ln450_41_fu_3473_p3(1),
      Q => select_ln450_41_reg_5476(1),
      R => '0'
    );
\select_ln450_41_reg_5476_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => select_ln450_41_fu_3473_p3(2),
      Q => select_ln450_41_reg_5476(2),
      R => '0'
    );
\select_ln450_41_reg_5476_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => select_ln450_41_fu_3473_p3(3),
      Q => select_ln450_41_reg_5476(3),
      R => '0'
    );
\select_ln450_43_reg_5486[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"88B8FFFF88B80000"
    )
        port map (
      I0 => max_bin_r_14_V(0),
      I1 => \icmp_ln895_79_reg_5173[0]_i_1_n_0\,
      I2 => max_bin_r_46_V(0),
      I3 => \icmp_ln895_46_reg_4973[0]_i_1_n_0\,
      I4 => \icmp_ln895_111_reg_5481[0]_i_1_n_0\,
      I5 => select_ln432_91_fu_3274_p3(0),
      O => select_ln450_43_fu_3482_p3(0)
    );
\select_ln450_43_reg_5486[0]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"20202F20"
    )
        port map (
      I0 => max_bin_r_30_V(0),
      I1 => \icmp_ln895_30_reg_4893[0]_i_1_n_0\,
      I2 => \icmp_ln895_95_reg_5293[0]_i_1_n_0\,
      I3 => max_bin_r_62_V(0),
      I4 => \icmp_ln895_62_reg_5053[0]_i_1_n_0\,
      O => select_ln432_91_fu_3274_p3(0)
    );
\select_ln450_43_reg_5486[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"88B8FFFF88B80000"
    )
        port map (
      I0 => max_bin_r_14_V(1),
      I1 => \icmp_ln895_79_reg_5173[0]_i_1_n_0\,
      I2 => max_bin_r_46_V(1),
      I3 => \icmp_ln895_46_reg_4973[0]_i_1_n_0\,
      I4 => \icmp_ln895_111_reg_5481[0]_i_1_n_0\,
      I5 => select_ln432_91_fu_3274_p3(1),
      O => select_ln450_43_fu_3482_p3(1)
    );
\select_ln450_43_reg_5486[1]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"20202F20"
    )
        port map (
      I0 => max_bin_r_30_V(1),
      I1 => \icmp_ln895_30_reg_4893[0]_i_1_n_0\,
      I2 => \icmp_ln895_95_reg_5293[0]_i_1_n_0\,
      I3 => max_bin_r_62_V(1),
      I4 => \icmp_ln895_62_reg_5053[0]_i_1_n_0\,
      O => select_ln432_91_fu_3274_p3(1)
    );
\select_ln450_43_reg_5486[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"88B8FFFF88B80000"
    )
        port map (
      I0 => max_bin_r_14_V(2),
      I1 => \icmp_ln895_79_reg_5173[0]_i_1_n_0\,
      I2 => max_bin_r_46_V(2),
      I3 => \icmp_ln895_46_reg_4973[0]_i_1_n_0\,
      I4 => \icmp_ln895_111_reg_5481[0]_i_1_n_0\,
      I5 => select_ln432_91_fu_3274_p3(2),
      O => select_ln450_43_fu_3482_p3(2)
    );
\select_ln450_43_reg_5486[2]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"20202F20"
    )
        port map (
      I0 => max_bin_r_30_V(2),
      I1 => \icmp_ln895_30_reg_4893[0]_i_1_n_0\,
      I2 => \icmp_ln895_95_reg_5293[0]_i_1_n_0\,
      I3 => max_bin_r_62_V(2),
      I4 => \icmp_ln895_62_reg_5053[0]_i_1_n_0\,
      O => select_ln432_91_fu_3274_p3(2)
    );
\select_ln450_43_reg_5486[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"88B8FFFF88B80000"
    )
        port map (
      I0 => max_bin_r_14_V(3),
      I1 => \icmp_ln895_79_reg_5173[0]_i_1_n_0\,
      I2 => max_bin_r_46_V(3),
      I3 => \icmp_ln895_46_reg_4973[0]_i_1_n_0\,
      I4 => \icmp_ln895_111_reg_5481[0]_i_1_n_0\,
      I5 => select_ln432_91_fu_3274_p3(3),
      O => select_ln450_43_fu_3482_p3(3)
    );
\select_ln450_43_reg_5486[3]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"20202F20"
    )
        port map (
      I0 => max_bin_r_30_V(3),
      I1 => \icmp_ln895_30_reg_4893[0]_i_1_n_0\,
      I2 => \icmp_ln895_95_reg_5293[0]_i_1_n_0\,
      I3 => max_bin_r_62_V(3),
      I4 => \icmp_ln895_62_reg_5053[0]_i_1_n_0\,
      O => select_ln432_91_fu_3274_p3(3)
    );
\select_ln450_43_reg_5486[4]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"88B8FFFF88B80000"
    )
        port map (
      I0 => max_bin_r_14_V(4),
      I1 => \icmp_ln895_79_reg_5173[0]_i_1_n_0\,
      I2 => max_bin_r_46_V(4),
      I3 => \icmp_ln895_46_reg_4973[0]_i_1_n_0\,
      I4 => \icmp_ln895_111_reg_5481[0]_i_1_n_0\,
      I5 => select_ln432_91_fu_3274_p3(4),
      O => select_ln450_43_fu_3482_p3(4)
    );
\select_ln450_43_reg_5486[4]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"20202F20"
    )
        port map (
      I0 => max_bin_r_30_V(4),
      I1 => \icmp_ln895_30_reg_4893[0]_i_1_n_0\,
      I2 => \icmp_ln895_95_reg_5293[0]_i_1_n_0\,
      I3 => max_bin_r_62_V(4),
      I4 => \icmp_ln895_62_reg_5053[0]_i_1_n_0\,
      O => select_ln432_91_fu_3274_p3(4)
    );
\select_ln450_43_reg_5486[5]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"88B8FFFF88B80000"
    )
        port map (
      I0 => max_bin_r_14_V(5),
      I1 => \icmp_ln895_79_reg_5173[0]_i_1_n_0\,
      I2 => max_bin_r_46_V(5),
      I3 => \icmp_ln895_46_reg_4973[0]_i_1_n_0\,
      I4 => \icmp_ln895_111_reg_5481[0]_i_1_n_0\,
      I5 => select_ln432_91_fu_3274_p3(5),
      O => select_ln450_43_fu_3482_p3(5)
    );
\select_ln450_43_reg_5486[5]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"20202F20"
    )
        port map (
      I0 => max_bin_r_30_V(5),
      I1 => \icmp_ln895_30_reg_4893[0]_i_1_n_0\,
      I2 => \icmp_ln895_95_reg_5293[0]_i_1_n_0\,
      I3 => max_bin_r_62_V(5),
      I4 => \icmp_ln895_62_reg_5053[0]_i_1_n_0\,
      O => select_ln432_91_fu_3274_p3(5)
    );
\select_ln450_43_reg_5486[6]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000200000000"
    )
        port map (
      I0 => \icmp_ln895_111_reg_5481[0]_i_1_n_0\,
      I1 => max_bin_count_14_V(2),
      I2 => max_bin_count_14_V(3),
      I3 => max_bin_count_14_V(1),
      I4 => max_bin_count_14_V(0),
      I5 => \icmp_ln895_79_reg_5173[0]_i_1_n_0\,
      O => \select_ln450_43_reg_5486[6]_i_1_n_0\
    );
\select_ln450_43_reg_5486[6]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"88B8FFFF88B80000"
    )
        port map (
      I0 => max_bin_r_14_V(6),
      I1 => \icmp_ln895_79_reg_5173[0]_i_1_n_0\,
      I2 => max_bin_r_46_V(6),
      I3 => \icmp_ln895_46_reg_4973[0]_i_1_n_0\,
      I4 => \icmp_ln895_111_reg_5481[0]_i_1_n_0\,
      I5 => select_ln432_91_fu_3274_p3(6),
      O => select_ln450_43_fu_3482_p3(6)
    );
\select_ln450_43_reg_5486[6]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"20202F20"
    )
        port map (
      I0 => max_bin_r_30_V(6),
      I1 => \icmp_ln895_30_reg_4893[0]_i_1_n_0\,
      I2 => \icmp_ln895_95_reg_5293[0]_i_1_n_0\,
      I3 => max_bin_r_62_V(6),
      I4 => \icmp_ln895_62_reg_5053[0]_i_1_n_0\,
      O => select_ln432_91_fu_3274_p3(6)
    );
\select_ln450_43_reg_5486_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => select_ln450_43_fu_3482_p3(0),
      Q => \select_ln450_43_reg_5486_reg_n_0_[0]\,
      R => \select_ln450_43_reg_5486[6]_i_1_n_0\
    );
\select_ln450_43_reg_5486_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => select_ln450_43_fu_3482_p3(1),
      Q => \select_ln450_43_reg_5486_reg_n_0_[1]\,
      R => \select_ln450_43_reg_5486[6]_i_1_n_0\
    );
\select_ln450_43_reg_5486_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => select_ln450_43_fu_3482_p3(2),
      Q => \select_ln450_43_reg_5486_reg_n_0_[2]\,
      R => \select_ln450_43_reg_5486[6]_i_1_n_0\
    );
\select_ln450_43_reg_5486_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => select_ln450_43_fu_3482_p3(3),
      Q => \select_ln450_43_reg_5486_reg_n_0_[3]\,
      R => \select_ln450_43_reg_5486[6]_i_1_n_0\
    );
\select_ln450_43_reg_5486_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => select_ln450_43_fu_3482_p3(4),
      Q => \select_ln450_43_reg_5486_reg_n_0_[4]\,
      R => \select_ln450_43_reg_5486[6]_i_1_n_0\
    );
\select_ln450_43_reg_5486_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => select_ln450_43_fu_3482_p3(5),
      Q => \select_ln450_43_reg_5486_reg_n_0_[5]\,
      R => \select_ln450_43_reg_5486[6]_i_1_n_0\
    );
\select_ln450_43_reg_5486_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => select_ln450_43_fu_3482_p3(6),
      Q => \select_ln450_43_reg_5486_reg_n_0_[6]\,
      R => \select_ln450_43_reg_5486[6]_i_1_n_0\
    );
\select_ln450_44_reg_5491[0]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"ACACFF00"
    )
        port map (
      I0 => max_bin_count_14_V(0),
      I1 => max_bin_count_46_V(0),
      I2 => \icmp_ln895_79_reg_5173[0]_i_1_n_0\,
      I3 => select_ln432_92_fu_3282_p3(0),
      I4 => \icmp_ln895_111_reg_5481[0]_i_1_n_0\,
      O => select_ln450_44_fu_3490_p3(0)
    );
\select_ln450_44_reg_5491[0]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"ACAACCAC"
    )
        port map (
      I0 => max_bin_count_30_V(0),
      I1 => max_bin_count_62_V(0),
      I2 => \icmp_ln895_95_reg_5293[0]_i_2_n_0\,
      I3 => max_bin_count_62_V(3),
      I4 => max_bin_count_30_V(3),
      O => select_ln432_92_fu_3282_p3(0)
    );
\select_ln450_44_reg_5491[1]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"ACAACCAC"
    )
        port map (
      I0 => select_ln432_44_fu_3010_p3(1),
      I1 => select_ln432_92_fu_3282_p3(1),
      I2 => \select_ln450_44_reg_5491[1]_i_4_n_0\,
      I3 => select_ln432_92_fu_3282_p3(3),
      I4 => select_ln432_44_fu_3010_p3(3),
      O => select_ln450_44_fu_3490_p3(1)
    );
\select_ln450_44_reg_5491[1]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"ACAACCAC"
    )
        port map (
      I0 => max_bin_count_14_V(1),
      I1 => max_bin_count_46_V(1),
      I2 => \icmp_ln895_79_reg_5173[0]_i_2_n_0\,
      I3 => max_bin_count_46_V(3),
      I4 => max_bin_count_14_V(3),
      O => select_ln432_44_fu_3010_p3(1)
    );
\select_ln450_44_reg_5491[1]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"ACAACCAC"
    )
        port map (
      I0 => max_bin_count_30_V(1),
      I1 => max_bin_count_62_V(1),
      I2 => \icmp_ln895_95_reg_5293[0]_i_2_n_0\,
      I3 => max_bin_count_62_V(3),
      I4 => max_bin_count_30_V(3),
      O => select_ln432_92_fu_3282_p3(1)
    );
\select_ln450_44_reg_5491[1]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"2F02FFFF00002F02"
    )
        port map (
      I0 => select_ln432_44_fu_3010_p3(0),
      I1 => select_ln432_92_fu_3282_p3(0),
      I2 => select_ln432_92_fu_3282_p3(1),
      I3 => select_ln432_44_fu_3010_p3(1),
      I4 => select_ln432_92_fu_3282_p3(2),
      I5 => select_ln432_44_fu_3010_p3(2),
      O => \select_ln450_44_reg_5491[1]_i_4_n_0\
    );
\select_ln450_44_reg_5491[1]_i_5\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => max_bin_count_14_V(3),
      I1 => max_bin_count_46_V(3),
      I2 => \icmp_ln895_79_reg_5173[0]_i_1_n_0\,
      O => select_ln432_44_fu_3010_p3(3)
    );
\select_ln450_44_reg_5491[1]_i_6\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"ACAACCAC"
    )
        port map (
      I0 => max_bin_count_14_V(0),
      I1 => max_bin_count_46_V(0),
      I2 => \icmp_ln895_79_reg_5173[0]_i_2_n_0\,
      I3 => max_bin_count_46_V(3),
      I4 => max_bin_count_14_V(3),
      O => select_ln432_44_fu_3010_p3(0)
    );
\select_ln450_44_reg_5491[2]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"ACACFF00"
    )
        port map (
      I0 => max_bin_count_14_V(2),
      I1 => max_bin_count_46_V(2),
      I2 => \icmp_ln895_79_reg_5173[0]_i_1_n_0\,
      I3 => select_ln432_92_fu_3282_p3(2),
      I4 => \icmp_ln895_111_reg_5481[0]_i_1_n_0\,
      O => select_ln450_44_fu_3490_p3(2)
    );
\select_ln450_44_reg_5491[2]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"ACAACCAC"
    )
        port map (
      I0 => max_bin_count_30_V(2),
      I1 => max_bin_count_62_V(2),
      I2 => \icmp_ln895_95_reg_5293[0]_i_2_n_0\,
      I3 => max_bin_count_62_V(3),
      I4 => max_bin_count_30_V(3),
      O => select_ln432_92_fu_3282_p3(2)
    );
\select_ln450_44_reg_5491[3]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"ACACFF00"
    )
        port map (
      I0 => max_bin_count_14_V(3),
      I1 => max_bin_count_46_V(3),
      I2 => \icmp_ln895_79_reg_5173[0]_i_1_n_0\,
      I3 => select_ln432_92_fu_3282_p3(3),
      I4 => \icmp_ln895_111_reg_5481[0]_i_1_n_0\,
      O => select_ln450_44_fu_3490_p3(3)
    );
\select_ln450_44_reg_5491[3]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => max_bin_count_30_V(3),
      I1 => max_bin_count_62_V(3),
      I2 => \icmp_ln895_95_reg_5293[0]_i_1_n_0\,
      O => select_ln432_92_fu_3282_p3(3)
    );
\select_ln450_44_reg_5491_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => select_ln450_44_fu_3490_p3(0),
      Q => select_ln450_44_reg_5491(0),
      R => '0'
    );
\select_ln450_44_reg_5491_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => select_ln450_44_fu_3490_p3(1),
      Q => select_ln450_44_reg_5491(1),
      R => '0'
    );
\select_ln450_44_reg_5491_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => select_ln450_44_fu_3490_p3(2),
      Q => select_ln450_44_reg_5491(2),
      R => '0'
    );
\select_ln450_44_reg_5491_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => select_ln450_44_fu_3490_p3(3),
      Q => select_ln450_44_reg_5491(3),
      R => '0'
    );
\select_ln450_46_reg_5501[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"88B8FFFF88B80000"
    )
        port map (
      I0 => max_bin_r_15_V(0),
      I1 => \icmp_ln895_80_reg_5178[0]_i_1_n_0\,
      I2 => max_bin_r_47_V(0),
      I3 => \icmp_ln895_47_reg_4978[0]_i_1_n_0\,
      I4 => \icmp_ln895_112_reg_5496[0]_i_1_n_0\,
      I5 => select_ln432_94_fu_3291_p3(0),
      O => select_ln450_46_fu_3499_p3(0)
    );
\select_ln450_46_reg_5501[0]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"20202F20"
    )
        port map (
      I0 => max_bin_r_31_V(0),
      I1 => \icmp_ln895_31_reg_4898[0]_i_1_n_0\,
      I2 => \icmp_ln895_96_reg_5298[0]_i_1_n_0\,
      I3 => max_bin_r_63_V(0),
      I4 => \icmp_ln895_63_reg_5058[0]_i_1_n_0\,
      O => select_ln432_94_fu_3291_p3(0)
    );
\select_ln450_46_reg_5501[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"88B8FFFF88B80000"
    )
        port map (
      I0 => max_bin_r_15_V(1),
      I1 => \icmp_ln895_80_reg_5178[0]_i_1_n_0\,
      I2 => max_bin_r_47_V(1),
      I3 => \icmp_ln895_47_reg_4978[0]_i_1_n_0\,
      I4 => \icmp_ln895_112_reg_5496[0]_i_1_n_0\,
      I5 => select_ln432_94_fu_3291_p3(1),
      O => select_ln450_46_fu_3499_p3(1)
    );
\select_ln450_46_reg_5501[1]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"20202F20"
    )
        port map (
      I0 => max_bin_r_31_V(1),
      I1 => \icmp_ln895_31_reg_4898[0]_i_1_n_0\,
      I2 => \icmp_ln895_96_reg_5298[0]_i_1_n_0\,
      I3 => max_bin_r_63_V(1),
      I4 => \icmp_ln895_63_reg_5058[0]_i_1_n_0\,
      O => select_ln432_94_fu_3291_p3(1)
    );
\select_ln450_46_reg_5501[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"88B8FFFF88B80000"
    )
        port map (
      I0 => max_bin_r_15_V(2),
      I1 => \icmp_ln895_80_reg_5178[0]_i_1_n_0\,
      I2 => max_bin_r_47_V(2),
      I3 => \icmp_ln895_47_reg_4978[0]_i_1_n_0\,
      I4 => \icmp_ln895_112_reg_5496[0]_i_1_n_0\,
      I5 => select_ln432_94_fu_3291_p3(2),
      O => select_ln450_46_fu_3499_p3(2)
    );
\select_ln450_46_reg_5501[2]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"20202F20"
    )
        port map (
      I0 => max_bin_r_31_V(2),
      I1 => \icmp_ln895_31_reg_4898[0]_i_1_n_0\,
      I2 => \icmp_ln895_96_reg_5298[0]_i_1_n_0\,
      I3 => max_bin_r_63_V(2),
      I4 => \icmp_ln895_63_reg_5058[0]_i_1_n_0\,
      O => select_ln432_94_fu_3291_p3(2)
    );
\select_ln450_46_reg_5501[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"88B8FFFF88B80000"
    )
        port map (
      I0 => max_bin_r_15_V(3),
      I1 => \icmp_ln895_80_reg_5178[0]_i_1_n_0\,
      I2 => max_bin_r_47_V(3),
      I3 => \icmp_ln895_47_reg_4978[0]_i_1_n_0\,
      I4 => \icmp_ln895_112_reg_5496[0]_i_1_n_0\,
      I5 => select_ln432_94_fu_3291_p3(3),
      O => select_ln450_46_fu_3499_p3(3)
    );
\select_ln450_46_reg_5501[3]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"20202F20"
    )
        port map (
      I0 => max_bin_r_31_V(3),
      I1 => \icmp_ln895_31_reg_4898[0]_i_1_n_0\,
      I2 => \icmp_ln895_96_reg_5298[0]_i_1_n_0\,
      I3 => max_bin_r_63_V(3),
      I4 => \icmp_ln895_63_reg_5058[0]_i_1_n_0\,
      O => select_ln432_94_fu_3291_p3(3)
    );
\select_ln450_46_reg_5501[4]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"88B8FFFF88B80000"
    )
        port map (
      I0 => max_bin_r_15_V(4),
      I1 => \icmp_ln895_80_reg_5178[0]_i_1_n_0\,
      I2 => max_bin_r_47_V(4),
      I3 => \icmp_ln895_47_reg_4978[0]_i_1_n_0\,
      I4 => \icmp_ln895_112_reg_5496[0]_i_1_n_0\,
      I5 => select_ln432_94_fu_3291_p3(4),
      O => select_ln450_46_fu_3499_p3(4)
    );
\select_ln450_46_reg_5501[4]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"20202F20"
    )
        port map (
      I0 => max_bin_r_31_V(4),
      I1 => \icmp_ln895_31_reg_4898[0]_i_1_n_0\,
      I2 => \icmp_ln895_96_reg_5298[0]_i_1_n_0\,
      I3 => max_bin_r_63_V(4),
      I4 => \icmp_ln895_63_reg_5058[0]_i_1_n_0\,
      O => select_ln432_94_fu_3291_p3(4)
    );
\select_ln450_46_reg_5501[5]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"88B8FFFF88B80000"
    )
        port map (
      I0 => max_bin_r_15_V(5),
      I1 => \icmp_ln895_80_reg_5178[0]_i_1_n_0\,
      I2 => max_bin_r_47_V(5),
      I3 => \icmp_ln895_47_reg_4978[0]_i_1_n_0\,
      I4 => \icmp_ln895_112_reg_5496[0]_i_1_n_0\,
      I5 => select_ln432_94_fu_3291_p3(5),
      O => select_ln450_46_fu_3499_p3(5)
    );
\select_ln450_46_reg_5501[5]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"20202F20"
    )
        port map (
      I0 => max_bin_r_31_V(5),
      I1 => \icmp_ln895_31_reg_4898[0]_i_1_n_0\,
      I2 => \icmp_ln895_96_reg_5298[0]_i_1_n_0\,
      I3 => max_bin_r_63_V(5),
      I4 => \icmp_ln895_63_reg_5058[0]_i_1_n_0\,
      O => select_ln432_94_fu_3291_p3(5)
    );
\select_ln450_46_reg_5501[6]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000200000000"
    )
        port map (
      I0 => \icmp_ln895_112_reg_5496[0]_i_1_n_0\,
      I1 => max_bin_count_15_V(2),
      I2 => max_bin_count_15_V(3),
      I3 => max_bin_count_15_V(1),
      I4 => max_bin_count_15_V(0),
      I5 => \icmp_ln895_80_reg_5178[0]_i_1_n_0\,
      O => \select_ln450_46_reg_5501[6]_i_1_n_0\
    );
\select_ln450_46_reg_5501[6]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"88B8FFFF88B80000"
    )
        port map (
      I0 => max_bin_r_15_V(6),
      I1 => \icmp_ln895_80_reg_5178[0]_i_1_n_0\,
      I2 => max_bin_r_47_V(6),
      I3 => \icmp_ln895_47_reg_4978[0]_i_1_n_0\,
      I4 => \icmp_ln895_112_reg_5496[0]_i_1_n_0\,
      I5 => select_ln432_94_fu_3291_p3(6),
      O => select_ln450_46_fu_3499_p3(6)
    );
\select_ln450_46_reg_5501[6]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"20202F20"
    )
        port map (
      I0 => max_bin_r_31_V(6),
      I1 => \icmp_ln895_31_reg_4898[0]_i_1_n_0\,
      I2 => \icmp_ln895_96_reg_5298[0]_i_1_n_0\,
      I3 => max_bin_r_63_V(6),
      I4 => \icmp_ln895_63_reg_5058[0]_i_1_n_0\,
      O => select_ln432_94_fu_3291_p3(6)
    );
\select_ln450_46_reg_5501_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => select_ln450_46_fu_3499_p3(0),
      Q => \select_ln450_46_reg_5501_reg_n_0_[0]\,
      R => \select_ln450_46_reg_5501[6]_i_1_n_0\
    );
\select_ln450_46_reg_5501_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => select_ln450_46_fu_3499_p3(1),
      Q => \select_ln450_46_reg_5501_reg_n_0_[1]\,
      R => \select_ln450_46_reg_5501[6]_i_1_n_0\
    );
\select_ln450_46_reg_5501_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => select_ln450_46_fu_3499_p3(2),
      Q => \select_ln450_46_reg_5501_reg_n_0_[2]\,
      R => \select_ln450_46_reg_5501[6]_i_1_n_0\
    );
\select_ln450_46_reg_5501_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => select_ln450_46_fu_3499_p3(3),
      Q => \select_ln450_46_reg_5501_reg_n_0_[3]\,
      R => \select_ln450_46_reg_5501[6]_i_1_n_0\
    );
\select_ln450_46_reg_5501_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => select_ln450_46_fu_3499_p3(4),
      Q => \select_ln450_46_reg_5501_reg_n_0_[4]\,
      R => \select_ln450_46_reg_5501[6]_i_1_n_0\
    );
\select_ln450_46_reg_5501_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => select_ln450_46_fu_3499_p3(5),
      Q => \select_ln450_46_reg_5501_reg_n_0_[5]\,
      R => \select_ln450_46_reg_5501[6]_i_1_n_0\
    );
\select_ln450_46_reg_5501_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => select_ln450_46_fu_3499_p3(6),
      Q => \select_ln450_46_reg_5501_reg_n_0_[6]\,
      R => \select_ln450_46_reg_5501[6]_i_1_n_0\
    );
\select_ln450_47_reg_5506[0]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"ACACFF00"
    )
        port map (
      I0 => max_bin_count_15_V(0),
      I1 => max_bin_count_47_V(0),
      I2 => \icmp_ln895_80_reg_5178[0]_i_1_n_0\,
      I3 => select_ln432_95_fu_3299_p3(0),
      I4 => \icmp_ln895_112_reg_5496[0]_i_1_n_0\,
      O => select_ln450_47_fu_3507_p3(0)
    );
\select_ln450_47_reg_5506[0]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"ACAACCAC"
    )
        port map (
      I0 => max_bin_count_31_V(0),
      I1 => max_bin_count_63_V(0),
      I2 => \icmp_ln895_96_reg_5298[0]_i_2_n_0\,
      I3 => max_bin_count_63_V(3),
      I4 => max_bin_count_31_V(3),
      O => select_ln432_95_fu_3299_p3(0)
    );
\select_ln450_47_reg_5506[1]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"ACAACCAC"
    )
        port map (
      I0 => select_ln432_47_fu_3027_p3(1),
      I1 => select_ln432_95_fu_3299_p3(1),
      I2 => \select_ln450_47_reg_5506[1]_i_4_n_0\,
      I3 => select_ln432_95_fu_3299_p3(3),
      I4 => select_ln432_47_fu_3027_p3(3),
      O => select_ln450_47_fu_3507_p3(1)
    );
\select_ln450_47_reg_5506[1]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"ACAACCAC"
    )
        port map (
      I0 => max_bin_count_15_V(1),
      I1 => max_bin_count_47_V(1),
      I2 => \icmp_ln895_80_reg_5178[0]_i_2_n_0\,
      I3 => max_bin_count_47_V(3),
      I4 => max_bin_count_15_V(3),
      O => select_ln432_47_fu_3027_p3(1)
    );
\select_ln450_47_reg_5506[1]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"ACAACCAC"
    )
        port map (
      I0 => max_bin_count_31_V(1),
      I1 => max_bin_count_63_V(1),
      I2 => \icmp_ln895_96_reg_5298[0]_i_2_n_0\,
      I3 => max_bin_count_63_V(3),
      I4 => max_bin_count_31_V(3),
      O => select_ln432_95_fu_3299_p3(1)
    );
\select_ln450_47_reg_5506[1]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"2F02FFFF00002F02"
    )
        port map (
      I0 => select_ln432_47_fu_3027_p3(0),
      I1 => select_ln432_95_fu_3299_p3(0),
      I2 => select_ln432_95_fu_3299_p3(1),
      I3 => select_ln432_47_fu_3027_p3(1),
      I4 => select_ln432_95_fu_3299_p3(2),
      I5 => select_ln432_47_fu_3027_p3(2),
      O => \select_ln450_47_reg_5506[1]_i_4_n_0\
    );
\select_ln450_47_reg_5506[1]_i_5\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => max_bin_count_15_V(3),
      I1 => max_bin_count_47_V(3),
      I2 => \icmp_ln895_80_reg_5178[0]_i_1_n_0\,
      O => select_ln432_47_fu_3027_p3(3)
    );
\select_ln450_47_reg_5506[1]_i_6\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"ACAACCAC"
    )
        port map (
      I0 => max_bin_count_15_V(0),
      I1 => max_bin_count_47_V(0),
      I2 => \icmp_ln895_80_reg_5178[0]_i_2_n_0\,
      I3 => max_bin_count_47_V(3),
      I4 => max_bin_count_15_V(3),
      O => select_ln432_47_fu_3027_p3(0)
    );
\select_ln450_47_reg_5506[2]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"ACACFF00"
    )
        port map (
      I0 => max_bin_count_15_V(2),
      I1 => max_bin_count_47_V(2),
      I2 => \icmp_ln895_80_reg_5178[0]_i_1_n_0\,
      I3 => select_ln432_95_fu_3299_p3(2),
      I4 => \icmp_ln895_112_reg_5496[0]_i_1_n_0\,
      O => select_ln450_47_fu_3507_p3(2)
    );
\select_ln450_47_reg_5506[2]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"ACAACCAC"
    )
        port map (
      I0 => max_bin_count_31_V(2),
      I1 => max_bin_count_63_V(2),
      I2 => \icmp_ln895_96_reg_5298[0]_i_2_n_0\,
      I3 => max_bin_count_63_V(3),
      I4 => max_bin_count_31_V(3),
      O => select_ln432_95_fu_3299_p3(2)
    );
\select_ln450_47_reg_5506[3]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"ACACFF00"
    )
        port map (
      I0 => max_bin_count_15_V(3),
      I1 => max_bin_count_47_V(3),
      I2 => \icmp_ln895_80_reg_5178[0]_i_1_n_0\,
      I3 => select_ln432_95_fu_3299_p3(3),
      I4 => \icmp_ln895_112_reg_5496[0]_i_1_n_0\,
      O => select_ln450_47_fu_3507_p3(3)
    );
\select_ln450_47_reg_5506[3]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => max_bin_count_31_V(3),
      I1 => max_bin_count_63_V(3),
      I2 => \icmp_ln895_96_reg_5298[0]_i_1_n_0\,
      O => select_ln432_95_fu_3299_p3(3)
    );
\select_ln450_47_reg_5506_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => select_ln450_47_fu_3507_p3(0),
      Q => select_ln450_47_reg_5506(0),
      R => '0'
    );
\select_ln450_47_reg_5506_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => select_ln450_47_fu_3507_p3(1),
      Q => select_ln450_47_reg_5506(1),
      R => '0'
    );
\select_ln450_47_reg_5506_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => select_ln450_47_fu_3507_p3(2),
      Q => select_ln450_47_reg_5506(2),
      R => '0'
    );
\select_ln450_47_reg_5506_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => select_ln450_47_fu_3507_p3(3),
      Q => select_ln450_47_reg_5506(3),
      R => '0'
    );
\select_ln450_5_reg_5320[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0F0FE10FE10FF00"
    )
        port map (
      I0 => max_bin_count_49_V(3),
      I1 => max_bin_count_17_V(3),
      I2 => select_ln432_5_fu_2789_p3(0),
      I3 => select_ln432_53_fu_3061_p3(0),
      I4 => \select_ln450_5_reg_5320[1]_i_4_n_0\,
      I5 => select_ln432_5_fu_2789_p3(3),
      O => select_ln450_5_fu_3317_p3(0)
    );
\select_ln450_5_reg_5320[0]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"ACAACCAC"
    )
        port map (
      I0 => max_bin_count_1_V(0),
      I1 => max_bin_count_33_V(0),
      I2 => \icmp_ln895_66_reg_5073[0]_i_2_n_0\,
      I3 => max_bin_count_33_V(3),
      I4 => max_bin_count_1_V(3),
      O => select_ln432_5_fu_2789_p3(0)
    );
\select_ln450_5_reg_5320[0]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"ACAACCAC"
    )
        port map (
      I0 => max_bin_count_17_V(0),
      I1 => max_bin_count_49_V(0),
      I2 => \select_ln432_52_reg_5198[6]_i_3_n_0\,
      I3 => max_bin_count_49_V(3),
      I4 => max_bin_count_17_V(3),
      O => select_ln432_53_fu_3061_p3(0)
    );
\select_ln450_5_reg_5320[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0F0FE10FE10FF00"
    )
        port map (
      I0 => max_bin_count_49_V(3),
      I1 => max_bin_count_17_V(3),
      I2 => select_ln432_5_fu_2789_p3(1),
      I3 => select_ln432_53_fu_3061_p3(1),
      I4 => \select_ln450_5_reg_5320[1]_i_4_n_0\,
      I5 => select_ln432_5_fu_2789_p3(3),
      O => select_ln450_5_fu_3317_p3(1)
    );
\select_ln450_5_reg_5320[1]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"ACAACCAC"
    )
        port map (
      I0 => max_bin_count_1_V(1),
      I1 => max_bin_count_33_V(1),
      I2 => \icmp_ln895_66_reg_5073[0]_i_2_n_0\,
      I3 => max_bin_count_33_V(3),
      I4 => max_bin_count_1_V(3),
      O => select_ln432_5_fu_2789_p3(1)
    );
\select_ln450_5_reg_5320[1]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"ACAACCAC"
    )
        port map (
      I0 => max_bin_count_17_V(1),
      I1 => max_bin_count_49_V(1),
      I2 => \select_ln432_52_reg_5198[6]_i_3_n_0\,
      I3 => max_bin_count_49_V(3),
      I4 => max_bin_count_17_V(3),
      O => select_ln432_53_fu_3061_p3(1)
    );
\select_ln450_5_reg_5320[1]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"2F02FFFF00002F02"
    )
        port map (
      I0 => select_ln432_5_fu_2789_p3(0),
      I1 => select_ln432_53_fu_3061_p3(0),
      I2 => select_ln432_53_fu_3061_p3(1),
      I3 => select_ln432_5_fu_2789_p3(1),
      I4 => select_ln432_53_fu_3061_p3(2),
      I5 => select_ln432_5_fu_2789_p3(2),
      O => \select_ln450_5_reg_5320[1]_i_4_n_0\
    );
\select_ln450_5_reg_5320[1]_i_5\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => max_bin_count_1_V(3),
      I1 => max_bin_count_33_V(3),
      I2 => \icmp_ln895_66_reg_5073[0]_i_1_n_0\,
      O => select_ln432_5_fu_2789_p3(3)
    );
\select_ln450_5_reg_5320[2]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"ACACFF00"
    )
        port map (
      I0 => max_bin_count_1_V(2),
      I1 => max_bin_count_33_V(2),
      I2 => \icmp_ln895_66_reg_5073[0]_i_1_n_0\,
      I3 => select_ln432_53_fu_3061_p3(2),
      I4 => \icmp_ln895_98_reg_5314[0]_i_1_n_0\,
      O => select_ln450_5_fu_3317_p3(2)
    );
\select_ln450_5_reg_5320[2]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"ACAACCAC"
    )
        port map (
      I0 => max_bin_count_17_V(2),
      I1 => max_bin_count_49_V(2),
      I2 => \select_ln432_52_reg_5198[6]_i_3_n_0\,
      I3 => max_bin_count_49_V(3),
      I4 => max_bin_count_17_V(3),
      O => select_ln432_53_fu_3061_p3(2)
    );
\select_ln450_5_reg_5320[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0F0FF00EEEEEEEE"
    )
        port map (
      I0 => max_bin_count_49_V(3),
      I1 => max_bin_count_17_V(3),
      I2 => max_bin_count_1_V(3),
      I3 => max_bin_count_33_V(3),
      I4 => \icmp_ln895_66_reg_5073[0]_i_1_n_0\,
      I5 => \icmp_ln895_98_reg_5314[0]_i_1_n_0\,
      O => select_ln450_5_fu_3317_p3(3)
    );
\select_ln450_5_reg_5320_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => select_ln450_5_fu_3317_p3(0),
      Q => select_ln450_5_reg_5320(0),
      R => '0'
    );
\select_ln450_5_reg_5320_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => select_ln450_5_fu_3317_p3(1),
      Q => select_ln450_5_reg_5320(1),
      R => '0'
    );
\select_ln450_5_reg_5320_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => select_ln450_5_fu_3317_p3(2),
      Q => select_ln450_5_reg_5320(2),
      R => '0'
    );
\select_ln450_5_reg_5320_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => select_ln450_5_fu_3317_p3(3),
      Q => select_ln450_5_reg_5320(3),
      R => '0'
    );
\select_ln450_8_reg_5331[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0F0FE10FE10FF00"
    )
        port map (
      I0 => max_bin_count_50_V(3),
      I1 => max_bin_count_18_V(3),
      I2 => select_ln432_8_fu_2806_p3(0),
      I3 => select_ln432_56_fu_3078_p3(0),
      I4 => \select_ln450_8_reg_5331[1]_i_4_n_0\,
      I5 => select_ln432_8_fu_2806_p3(3),
      O => select_ln450_8_fu_3326_p3(0)
    );
\select_ln450_8_reg_5331[0]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"ACAACCAC"
    )
        port map (
      I0 => max_bin_count_2_V(0),
      I1 => max_bin_count_34_V(0),
      I2 => \icmp_ln895_67_reg_5083[0]_i_2_n_0\,
      I3 => max_bin_count_34_V(3),
      I4 => max_bin_count_2_V(3),
      O => select_ln432_8_fu_2806_p3(0)
    );
\select_ln450_8_reg_5331[0]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"ACAACCAC"
    )
        port map (
      I0 => max_bin_count_18_V(0),
      I1 => max_bin_count_50_V(0),
      I2 => \select_ln432_55_reg_5208[6]_i_3_n_0\,
      I3 => max_bin_count_50_V(3),
      I4 => max_bin_count_18_V(3),
      O => select_ln432_56_fu_3078_p3(0)
    );
\select_ln450_8_reg_5331[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0F0FE10FE10FF00"
    )
        port map (
      I0 => max_bin_count_50_V(3),
      I1 => max_bin_count_18_V(3),
      I2 => select_ln432_8_fu_2806_p3(1),
      I3 => select_ln432_56_fu_3078_p3(1),
      I4 => \select_ln450_8_reg_5331[1]_i_4_n_0\,
      I5 => select_ln432_8_fu_2806_p3(3),
      O => select_ln450_8_fu_3326_p3(1)
    );
\select_ln450_8_reg_5331[1]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"ACAACCAC"
    )
        port map (
      I0 => max_bin_count_2_V(1),
      I1 => max_bin_count_34_V(1),
      I2 => \icmp_ln895_67_reg_5083[0]_i_2_n_0\,
      I3 => max_bin_count_34_V(3),
      I4 => max_bin_count_2_V(3),
      O => select_ln432_8_fu_2806_p3(1)
    );
\select_ln450_8_reg_5331[1]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"ACAACCAC"
    )
        port map (
      I0 => max_bin_count_18_V(1),
      I1 => max_bin_count_50_V(1),
      I2 => \select_ln432_55_reg_5208[6]_i_3_n_0\,
      I3 => max_bin_count_50_V(3),
      I4 => max_bin_count_18_V(3),
      O => select_ln432_56_fu_3078_p3(1)
    );
\select_ln450_8_reg_5331[1]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"2F02FFFF00002F02"
    )
        port map (
      I0 => select_ln432_8_fu_2806_p3(0),
      I1 => select_ln432_56_fu_3078_p3(0),
      I2 => select_ln432_56_fu_3078_p3(1),
      I3 => select_ln432_8_fu_2806_p3(1),
      I4 => select_ln432_56_fu_3078_p3(2),
      I5 => select_ln432_8_fu_2806_p3(2),
      O => \select_ln450_8_reg_5331[1]_i_4_n_0\
    );
\select_ln450_8_reg_5331[1]_i_5\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => max_bin_count_2_V(3),
      I1 => max_bin_count_34_V(3),
      I2 => \icmp_ln895_67_reg_5083[0]_i_1_n_0\,
      O => select_ln432_8_fu_2806_p3(3)
    );
\select_ln450_8_reg_5331[2]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"ACACFF00"
    )
        port map (
      I0 => max_bin_count_2_V(2),
      I1 => max_bin_count_34_V(2),
      I2 => \icmp_ln895_67_reg_5083[0]_i_1_n_0\,
      I3 => select_ln432_56_fu_3078_p3(2),
      I4 => \icmp_ln895_99_reg_5325[0]_i_1_n_0\,
      O => select_ln450_8_fu_3326_p3(2)
    );
\select_ln450_8_reg_5331[2]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"ACAACCAC"
    )
        port map (
      I0 => max_bin_count_18_V(2),
      I1 => max_bin_count_50_V(2),
      I2 => \select_ln432_55_reg_5208[6]_i_3_n_0\,
      I3 => max_bin_count_50_V(3),
      I4 => max_bin_count_18_V(3),
      O => select_ln432_56_fu_3078_p3(2)
    );
\select_ln450_8_reg_5331[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0F0FF00EEEEEEEE"
    )
        port map (
      I0 => max_bin_count_50_V(3),
      I1 => max_bin_count_18_V(3),
      I2 => max_bin_count_2_V(3),
      I3 => max_bin_count_34_V(3),
      I4 => \icmp_ln895_67_reg_5083[0]_i_1_n_0\,
      I5 => \icmp_ln895_99_reg_5325[0]_i_1_n_0\,
      O => select_ln450_8_fu_3326_p3(3)
    );
\select_ln450_8_reg_5331_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => select_ln450_8_fu_3326_p3(0),
      Q => select_ln450_8_reg_5331(0),
      R => '0'
    );
\select_ln450_8_reg_5331_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => select_ln450_8_fu_3326_p3(1),
      Q => select_ln450_8_reg_5331(1),
      R => '0'
    );
\select_ln450_8_reg_5331_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => select_ln450_8_fu_3326_p3(2),
      Q => select_ln450_8_reg_5331(2),
      R => '0'
    );
\select_ln450_8_reg_5331_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => select_ln450_8_fu_3326_p3(3),
      Q => select_ln450_8_reg_5331(3),
      R => '0'
    );
\select_ln486_6_reg_5572[2]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \select_ln486_6_reg_5572[6]_i_4_n_0\,
      O => select_ln486_6_fu_4542_p3(2)
    );
\select_ln486_6_reg_5572[3]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"47"
    )
        port map (
      I0 => icmp_ln895_115_reg_5525,
      I1 => \select_ln486_6_reg_5572[6]_i_4_n_0\,
      I2 => icmp_ln895_119_reg_5553,
      O => select_ln486_6_fu_4542_p3(3)
    );
\select_ln486_6_reg_5572[4]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"47FF4700"
    )
        port map (
      I0 => icmp_ln895_99_reg_5325,
      I1 => icmp_ln895_115_reg_5525,
      I2 => icmp_ln895_107_reg_5421,
      I3 => \select_ln486_6_reg_5572[6]_i_4_n_0\,
      I4 => \select_ln486_6_reg_5572[4]_i_2_n_0\,
      O => select_ln486_6_fu_4542_p3(4)
    );
\select_ln486_6_reg_5572[4]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"47"
    )
        port map (
      I0 => icmp_ln895_103_reg_5369,
      I1 => icmp_ln895_119_reg_5553,
      I2 => icmp_ln895_111_reg_5481,
      O => \select_ln486_6_reg_5572[4]_i_2_n_0\
    );
\select_ln486_6_reg_5572[5]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"470047FF"
    )
        port map (
      I0 => icmp_ln895_71_reg_5123,
      I1 => icmp_ln895_103_reg_5369,
      I2 => icmp_ln895_87_reg_5243,
      I3 => icmp_ln895_119_reg_5553,
      I4 => \select_ln486_6_reg_5572[5]_i_4_n_0\,
      O => \select_ln486_6_reg_5572[5]_i_2_n_0\
    );
\select_ln486_6_reg_5572[5]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"1DFF1D00"
    )
        port map (
      I0 => icmp_ln895_83_reg_5203,
      I1 => icmp_ln895_99_reg_5325,
      I2 => icmp_ln895_67_reg_5083,
      I3 => icmp_ln895_115_reg_5525,
      I4 => \select_ln486_6_reg_5572[5]_i_5_n_0\,
      O => \select_ln486_6_reg_5572[5]_i_3_n_0\
    );
\select_ln486_6_reg_5572[5]_i_4\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => icmp_ln895_79_reg_5173,
      I1 => icmp_ln895_111_reg_5481,
      I2 => icmp_ln895_95_reg_5293,
      O => \select_ln486_6_reg_5572[5]_i_4_n_0\
    );
\select_ln486_6_reg_5572[5]_i_5\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"47"
    )
        port map (
      I0 => icmp_ln895_75_reg_5153,
      I1 => icmp_ln895_107_reg_5421,
      I2 => icmp_ln895_91_reg_5273,
      O => \select_ln486_6_reg_5572[5]_i_5_n_0\
    );
\select_ln486_6_reg_5572[6]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8FFB800"
    )
        port map (
      I0 => \select_ln486_6_reg_5572[6]_i_2_n_0\,
      I1 => icmp_ln895_115_reg_5525,
      I2 => \select_ln486_6_reg_5572[6]_i_3_n_0\,
      I3 => \select_ln486_6_reg_5572[6]_i_4_n_0\,
      I4 => \select_ln486_6_reg_5572_reg[6]_i_5_n_0\,
      O => select_ln486_6_fu_4542_p3(6)
    );
\select_ln486_6_reg_5572[6]_i_10\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => select_ln450_8_reg_5331(2),
      I1 => select_ln450_32_reg_5431(2),
      I2 => icmp_ln895_115_reg_5525,
      O => select_ln468_8_fu_4391_p3(2)
    );
\select_ln486_6_reg_5572[6]_i_11\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => select_ln450_20_reg_5375(3),
      I1 => select_ln450_44_reg_5491(3),
      I2 => icmp_ln895_119_reg_5553,
      O => select_ln468_20_fu_4467_p3(3)
    );
\select_ln486_6_reg_5572[6]_i_12\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => select_ln450_8_reg_5331(3),
      I1 => select_ln450_32_reg_5431(3),
      I2 => icmp_ln895_115_reg_5525,
      O => select_ln468_8_fu_4391_p3(3)
    );
\select_ln486_6_reg_5572[6]_i_13\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8FFB800"
    )
        port map (
      I0 => icmp_ln895_14_reg_4813,
      I1 => icmp_ln895_79_reg_5173,
      I2 => icmp_ln895_46_reg_4973,
      I3 => icmp_ln895_111_reg_5481,
      I4 => \select_ln486_6_reg_5572[6]_i_16_n_0\,
      O => p_0_out(6)
    );
\select_ln486_6_reg_5572[6]_i_14\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8FFB800"
    )
        port map (
      I0 => icmp_ln895_64_reg_4773,
      I1 => icmp_ln895_71_reg_5123,
      I2 => icmp_ln895_38_reg_4933,
      I3 => icmp_ln895_103_reg_5369,
      I4 => \select_ln486_6_reg_5572[6]_i_17_n_0\,
      O => \select_ln486_6_reg_5572[6]_i_14_n_0\
    );
\select_ln486_6_reg_5572[6]_i_15\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => select_ln450_8_reg_5331(1),
      I1 => select_ln450_32_reg_5431(1),
      I2 => icmp_ln895_115_reg_5525,
      O => select_ln468_8_fu_4391_p3(1)
    );
\select_ln486_6_reg_5572[6]_i_16\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => icmp_ln895_30_reg_4893,
      I1 => icmp_ln895_95_reg_5293,
      I2 => icmp_ln895_62_reg_5053,
      O => \select_ln486_6_reg_5572[6]_i_16_n_0\
    );
\select_ln486_6_reg_5572[6]_i_17\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => icmp_ln895_22_reg_4853,
      I1 => icmp_ln895_87_reg_5243,
      I2 => icmp_ln895_54_reg_5013,
      O => \select_ln486_6_reg_5572[6]_i_17_n_0\
    );
\select_ln486_6_reg_5572[6]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8FFB800"
    )
        port map (
      I0 => icmp_ln895_2_reg_4753,
      I1 => icmp_ln895_67_reg_5083,
      I2 => icmp_ln895_34_reg_4913,
      I3 => icmp_ln895_99_reg_5325,
      I4 => \select_ln486_6_reg_5572[6]_i_6_n_0\,
      O => \select_ln486_6_reg_5572[6]_i_2_n_0\
    );
\select_ln486_6_reg_5572[6]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8FFB800"
    )
        port map (
      I0 => icmp_ln895_10_reg_4793,
      I1 => icmp_ln895_75_reg_5153,
      I2 => icmp_ln895_42_reg_4953,
      I3 => icmp_ln895_107_reg_5421,
      I4 => \select_ln486_6_reg_5572[6]_i_7_n_0\,
      O => \select_ln486_6_reg_5572[6]_i_3_n_0\
    );
\select_ln486_6_reg_5572[6]_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B2FF00B2"
    )
        port map (
      I0 => \select_ln486_6_reg_5572[6]_i_8_n_0\,
      I1 => select_ln468_20_fu_4467_p3(2),
      I2 => select_ln468_8_fu_4391_p3(2),
      I3 => select_ln468_20_fu_4467_p3(3),
      I4 => select_ln468_8_fu_4391_p3(3),
      O => \select_ln486_6_reg_5572[6]_i_4_n_0\
    );
\select_ln486_6_reg_5572[6]_i_6\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => icmp_ln895_18_reg_4833,
      I1 => icmp_ln895_83_reg_5203,
      I2 => icmp_ln895_50_reg_4993,
      O => \select_ln486_6_reg_5572[6]_i_6_n_0\
    );
\select_ln486_6_reg_5572[6]_i_7\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => icmp_ln895_26_reg_4873,
      I1 => icmp_ln895_91_reg_5273,
      I2 => icmp_ln895_58_reg_5033,
      O => \select_ln486_6_reg_5572[6]_i_7_n_0\
    );
\select_ln486_6_reg_5572[6]_i_8\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00E4FFFF000000E4"
    )
        port map (
      I0 => icmp_ln895_115_reg_5525,
      I1 => select_ln450_32_reg_5431(0),
      I2 => select_ln450_8_reg_5331(0),
      I3 => select_ln468_20_fu_4467_p3(0),
      I4 => select_ln468_20_fu_4467_p3(1),
      I5 => select_ln468_8_fu_4391_p3(1),
      O => \select_ln486_6_reg_5572[6]_i_8_n_0\
    );
\select_ln486_6_reg_5572[6]_i_9\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => select_ln450_20_reg_5375(2),
      I1 => select_ln450_44_reg_5491(2),
      I2 => icmp_ln895_119_reg_5553,
      O => select_ln468_20_fu_4467_p3(2)
    );
\select_ln486_6_reg_5572_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => select_ln486_6_fu_4542_p3(2),
      Q => select_ln486_6_reg_5572(2),
      R => '0'
    );
\select_ln486_6_reg_5572_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => select_ln486_6_fu_4542_p3(3),
      Q => select_ln486_6_reg_5572(3),
      R => '0'
    );
\select_ln486_6_reg_5572_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => select_ln486_6_fu_4542_p3(4),
      Q => select_ln486_6_reg_5572(4),
      R => '0'
    );
\select_ln486_6_reg_5572_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => select_ln486_6_fu_4542_p3(5),
      Q => select_ln486_6_reg_5572(5),
      R => '0'
    );
\select_ln486_6_reg_5572_reg[5]_i_1\: unisim.vcomponents.MUXF7
     port map (
      I0 => \select_ln486_6_reg_5572[5]_i_2_n_0\,
      I1 => \select_ln486_6_reg_5572[5]_i_3_n_0\,
      O => select_ln486_6_fu_4542_p3(5),
      S => \select_ln486_6_reg_5572[6]_i_4_n_0\
    );
\select_ln486_6_reg_5572_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => select_ln486_6_fu_4542_p3(6),
      Q => select_ln486_6_reg_5572(6),
      R => '0'
    );
\select_ln486_6_reg_5572_reg[6]_i_5\: unisim.vcomponents.MUXF7
     port map (
      I0 => p_0_out(6),
      I1 => \select_ln486_6_reg_5572[6]_i_14_n_0\,
      O => \select_ln486_6_reg_5572_reg[6]_i_5_n_0\,
      S => icmp_ln895_119_reg_5553
    );
\select_ln486_reg_5567[2]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \select_ln486_reg_5567[6]_i_4_n_0\,
      O => select_ln486_fu_4492_p3(2)
    );
\select_ln486_reg_5567[3]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"47"
    )
        port map (
      I0 => icmp_ln895_113_reg_5511,
      I1 => \select_ln486_reg_5567[6]_i_4_n_0\,
      I2 => icmp_ln895_117_reg_5539,
      O => select_ln486_fu_4492_p3(3)
    );
\select_ln486_reg_5567[4]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"47FF4700"
    )
        port map (
      I0 => icmp_ln895_97_reg_5303,
      I1 => icmp_ln895_113_reg_5511,
      I2 => icmp_ln895_105_reg_5391,
      I3 => \select_ln486_reg_5567[6]_i_4_n_0\,
      I4 => \select_ln486_reg_5567[4]_i_2_n_0\,
      O => select_ln486_fu_4492_p3(4)
    );
\select_ln486_reg_5567[4]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"47"
    )
        port map (
      I0 => icmp_ln895_101_reg_5347,
      I1 => icmp_ln895_117_reg_5539,
      I2 => icmp_ln895_109_reg_5451,
      O => \select_ln486_reg_5567[4]_i_2_n_0\
    );
\select_ln486_reg_5567[5]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"1DFF1D00"
    )
        port map (
      I0 => icmp_ln895_85_reg_5223,
      I1 => icmp_ln895_101_reg_5347,
      I2 => icmp_ln895_69_reg_5103,
      I3 => icmp_ln895_117_reg_5539,
      I4 => \select_ln486_reg_5567[5]_i_4_n_0\,
      O => \select_ln486_reg_5567[5]_i_2_n_0\
    );
\select_ln486_reg_5567[5]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"47FF4700"
    )
        port map (
      I0 => icmp_ln895_65_reg_5063,
      I1 => icmp_ln895_97_reg_5303,
      I2 => icmp_ln895_81_reg_5183,
      I3 => icmp_ln895_113_reg_5511,
      I4 => \select_ln486_reg_5567[5]_i_5_n_0\,
      O => \select_ln486_reg_5567[5]_i_3_n_0\
    );
\select_ln486_reg_5567[5]_i_4\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"47"
    )
        port map (
      I0 => icmp_ln895_77_reg_5163,
      I1 => icmp_ln895_109_reg_5451,
      I2 => icmp_ln895_93_reg_5283,
      O => \select_ln486_reg_5567[5]_i_4_n_0\
    );
\select_ln486_reg_5567[5]_i_5\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"47"
    )
        port map (
      I0 => icmp_ln895_73_reg_5143,
      I1 => icmp_ln895_105_reg_5391,
      I2 => icmp_ln895_89_reg_5263,
      O => \select_ln486_reg_5567[5]_i_5_n_0\
    );
\select_ln486_reg_5567[6]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8FFB800"
    )
        port map (
      I0 => select_ln450_fu_4188_p3(6),
      I1 => icmp_ln895_113_reg_5511,
      I2 => \select_ln486_reg_5567[6]_i_3_n_0\,
      I3 => \select_ln486_reg_5567[6]_i_4_n_0\,
      I4 => \select_ln486_reg_5567_reg[6]_i_5_n_0\,
      O => select_ln486_fu_4492_p3(6)
    );
\select_ln486_reg_5567[6]_i_10\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => select_ln450_2_reg_5309(2),
      I1 => select_ln450_26_reg_5401(2),
      I2 => icmp_ln895_113_reg_5511,
      O => select_ln468_2_fu_4353_p3(2)
    );
\select_ln486_reg_5567[6]_i_11\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => select_ln450_14_reg_5353(3),
      I1 => select_ln450_38_reg_5461(3),
      I2 => icmp_ln895_117_reg_5539,
      O => select_ln468_14_fu_4429_p3(3)
    );
\select_ln486_reg_5567[6]_i_12\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => select_ln450_2_reg_5309(3),
      I1 => select_ln450_26_reg_5401(3),
      I2 => icmp_ln895_113_reg_5511,
      O => select_ln468_2_fu_4353_p3(3)
    );
\select_ln486_reg_5567[6]_i_13\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8FFB800"
    )
        port map (
      I0 => icmp_ln895_12_reg_4803,
      I1 => icmp_ln895_77_reg_5163,
      I2 => icmp_ln895_44_reg_4963,
      I3 => icmp_ln895_109_reg_5451,
      I4 => \select_ln486_reg_5567[6]_i_16_n_0\,
      O => \select_ln486_reg_5567[6]_i_13_n_0\
    );
\select_ln486_reg_5567[6]_i_14\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8FFB800"
    )
        port map (
      I0 => icmp_ln895_4_reg_4763,
      I1 => icmp_ln895_69_reg_5103,
      I2 => icmp_ln895_36_reg_4923,
      I3 => icmp_ln895_101_reg_5347,
      I4 => \select_ln486_reg_5567[6]_i_17_n_0\,
      O => \select_ln486_reg_5567[6]_i_14_n_0\
    );
\select_ln486_reg_5567[6]_i_15\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => select_ln450_2_reg_5309(1),
      I1 => select_ln450_26_reg_5401(1),
      I2 => icmp_ln895_113_reg_5511,
      O => select_ln468_2_fu_4353_p3(1)
    );
\select_ln486_reg_5567[6]_i_16\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => icmp_ln895_28_reg_4883,
      I1 => icmp_ln895_93_reg_5283,
      I2 => icmp_ln895_60_reg_5043,
      O => \select_ln486_reg_5567[6]_i_16_n_0\
    );
\select_ln486_reg_5567[6]_i_17\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => icmp_ln895_20_reg_4843,
      I1 => icmp_ln895_85_reg_5223,
      I2 => icmp_ln895_52_reg_5003,
      O => \select_ln486_reg_5567[6]_i_17_n_0\
    );
\select_ln486_reg_5567[6]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8FFB800"
    )
        port map (
      I0 => icmp_ln895_reg_4743,
      I1 => icmp_ln895_65_reg_5063,
      I2 => icmp_ln895_32_reg_4903,
      I3 => icmp_ln895_97_reg_5303,
      I4 => \select_ln486_reg_5567[6]_i_6_n_0\,
      O => select_ln450_fu_4188_p3(6)
    );
\select_ln486_reg_5567[6]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8FFB800"
    )
        port map (
      I0 => icmp_ln895_8_reg_4783,
      I1 => icmp_ln895_73_reg_5143,
      I2 => icmp_ln895_40_reg_4943,
      I3 => icmp_ln895_105_reg_5391,
      I4 => \select_ln486_reg_5567[6]_i_7_n_0\,
      O => \select_ln486_reg_5567[6]_i_3_n_0\
    );
\select_ln486_reg_5567[6]_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B2FF00B2"
    )
        port map (
      I0 => \select_ln486_reg_5567[6]_i_8_n_0\,
      I1 => select_ln468_14_fu_4429_p3(2),
      I2 => select_ln468_2_fu_4353_p3(2),
      I3 => select_ln468_14_fu_4429_p3(3),
      I4 => select_ln468_2_fu_4353_p3(3),
      O => \select_ln486_reg_5567[6]_i_4_n_0\
    );
\select_ln486_reg_5567[6]_i_6\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => icmp_ln895_16_reg_4823,
      I1 => icmp_ln895_81_reg_5183,
      I2 => icmp_ln895_48_reg_4983,
      O => \select_ln486_reg_5567[6]_i_6_n_0\
    );
\select_ln486_reg_5567[6]_i_7\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => icmp_ln895_24_reg_4863,
      I1 => icmp_ln895_89_reg_5263,
      I2 => icmp_ln895_56_reg_5023,
      O => \select_ln486_reg_5567[6]_i_7_n_0\
    );
\select_ln486_reg_5567[6]_i_8\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00E4FFFF000000E4"
    )
        port map (
      I0 => icmp_ln895_113_reg_5511,
      I1 => select_ln450_26_reg_5401(0),
      I2 => select_ln450_2_reg_5309(0),
      I3 => select_ln468_14_fu_4429_p3(0),
      I4 => select_ln468_14_fu_4429_p3(1),
      I5 => select_ln468_2_fu_4353_p3(1),
      O => \select_ln486_reg_5567[6]_i_8_n_0\
    );
\select_ln486_reg_5567[6]_i_9\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => select_ln450_14_reg_5353(2),
      I1 => select_ln450_38_reg_5461(2),
      I2 => icmp_ln895_117_reg_5539,
      O => select_ln468_14_fu_4429_p3(2)
    );
\select_ln486_reg_5567_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => select_ln486_fu_4492_p3(2),
      Q => select_ln486_reg_5567(2),
      R => '0'
    );
\select_ln486_reg_5567_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => select_ln486_fu_4492_p3(3),
      Q => select_ln486_reg_5567(3),
      R => '0'
    );
\select_ln486_reg_5567_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => select_ln486_fu_4492_p3(4),
      Q => select_ln486_reg_5567(4),
      R => '0'
    );
\select_ln486_reg_5567_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => select_ln486_fu_4492_p3(5),
      Q => select_ln486_reg_5567(5),
      R => '0'
    );
\select_ln486_reg_5567_reg[5]_i_1\: unisim.vcomponents.MUXF7
     port map (
      I0 => \select_ln486_reg_5567[5]_i_2_n_0\,
      I1 => \select_ln486_reg_5567[5]_i_3_n_0\,
      O => select_ln486_fu_4492_p3(5),
      S => \select_ln486_reg_5567[6]_i_4_n_0\
    );
\select_ln486_reg_5567_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => select_ln486_fu_4492_p3(6),
      Q => select_ln486_reg_5567(6),
      R => '0'
    );
\select_ln486_reg_5567_reg[6]_i_5\: unisim.vcomponents.MUXF7
     port map (
      I0 => \select_ln486_reg_5567[6]_i_13_n_0\,
      I1 => \select_ln486_reg_5567[6]_i_14_n_0\,
      O => \select_ln486_reg_5567_reg[6]_i_5_n_0\,
      S => icmp_ln895_117_reg_5539
    );
\slcvec_angle_polar_o_reg_4738_pp0_iter1_reg_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => slcvec_angle_polar_o_reg_4738(0),
      Q => slcvec_angle_polar_o_reg_4738_pp0_iter1_reg(0),
      R => '0'
    );
\slcvec_angle_polar_o_reg_4738_pp0_iter1_reg_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => slcvec_angle_polar_o_reg_4738(10),
      Q => slcvec_angle_polar_o_reg_4738_pp0_iter1_reg(10),
      R => '0'
    );
\slcvec_angle_polar_o_reg_4738_pp0_iter1_reg_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => slcvec_angle_polar_o_reg_4738(11),
      Q => slcvec_angle_polar_o_reg_4738_pp0_iter1_reg(11),
      R => '0'
    );
\slcvec_angle_polar_o_reg_4738_pp0_iter1_reg_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => slcvec_angle_polar_o_reg_4738(12),
      Q => slcvec_angle_polar_o_reg_4738_pp0_iter1_reg(12),
      R => '0'
    );
\slcvec_angle_polar_o_reg_4738_pp0_iter1_reg_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => slcvec_angle_polar_o_reg_4738(13),
      Q => slcvec_angle_polar_o_reg_4738_pp0_iter1_reg(13),
      R => '0'
    );
\slcvec_angle_polar_o_reg_4738_pp0_iter1_reg_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => slcvec_angle_polar_o_reg_4738(1),
      Q => slcvec_angle_polar_o_reg_4738_pp0_iter1_reg(1),
      R => '0'
    );
\slcvec_angle_polar_o_reg_4738_pp0_iter1_reg_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => slcvec_angle_polar_o_reg_4738(2),
      Q => slcvec_angle_polar_o_reg_4738_pp0_iter1_reg(2),
      R => '0'
    );
\slcvec_angle_polar_o_reg_4738_pp0_iter1_reg_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => slcvec_angle_polar_o_reg_4738(3),
      Q => slcvec_angle_polar_o_reg_4738_pp0_iter1_reg(3),
      R => '0'
    );
\slcvec_angle_polar_o_reg_4738_pp0_iter1_reg_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => slcvec_angle_polar_o_reg_4738(4),
      Q => slcvec_angle_polar_o_reg_4738_pp0_iter1_reg(4),
      R => '0'
    );
\slcvec_angle_polar_o_reg_4738_pp0_iter1_reg_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => slcvec_angle_polar_o_reg_4738(5),
      Q => slcvec_angle_polar_o_reg_4738_pp0_iter1_reg(5),
      R => '0'
    );
\slcvec_angle_polar_o_reg_4738_pp0_iter1_reg_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => slcvec_angle_polar_o_reg_4738(6),
      Q => slcvec_angle_polar_o_reg_4738_pp0_iter1_reg(6),
      R => '0'
    );
\slcvec_angle_polar_o_reg_4738_pp0_iter1_reg_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => slcvec_angle_polar_o_reg_4738(7),
      Q => slcvec_angle_polar_o_reg_4738_pp0_iter1_reg(7),
      R => '0'
    );
\slcvec_angle_polar_o_reg_4738_pp0_iter1_reg_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => slcvec_angle_polar_o_reg_4738(8),
      Q => slcvec_angle_polar_o_reg_4738_pp0_iter1_reg(8),
      R => '0'
    );
\slcvec_angle_polar_o_reg_4738_pp0_iter1_reg_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => slcvec_angle_polar_o_reg_4738(9),
      Q => slcvec_angle_polar_o_reg_4738_pp0_iter1_reg(9),
      R => '0'
    );
\slcvec_angle_polar_o_reg_4738_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => slcvec_angle_polar_offset_mrad_V(0),
      Q => slcvec_angle_polar_o_reg_4738(0),
      R => '0'
    );
\slcvec_angle_polar_o_reg_4738_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => slcvec_angle_polar_offset_mrad_V(10),
      Q => slcvec_angle_polar_o_reg_4738(10),
      R => '0'
    );
\slcvec_angle_polar_o_reg_4738_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => slcvec_angle_polar_offset_mrad_V(11),
      Q => slcvec_angle_polar_o_reg_4738(11),
      R => '0'
    );
\slcvec_angle_polar_o_reg_4738_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => slcvec_angle_polar_offset_mrad_V(12),
      Q => slcvec_angle_polar_o_reg_4738(12),
      R => '0'
    );
\slcvec_angle_polar_o_reg_4738_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => slcvec_angle_polar_offset_mrad_V(13),
      Q => slcvec_angle_polar_o_reg_4738(13),
      R => '0'
    );
\slcvec_angle_polar_o_reg_4738_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => slcvec_angle_polar_offset_mrad_V(1),
      Q => slcvec_angle_polar_o_reg_4738(1),
      R => '0'
    );
\slcvec_angle_polar_o_reg_4738_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => slcvec_angle_polar_offset_mrad_V(2),
      Q => slcvec_angle_polar_o_reg_4738(2),
      R => '0'
    );
\slcvec_angle_polar_o_reg_4738_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => slcvec_angle_polar_offset_mrad_V(3),
      Q => slcvec_angle_polar_o_reg_4738(3),
      R => '0'
    );
\slcvec_angle_polar_o_reg_4738_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => slcvec_angle_polar_offset_mrad_V(4),
      Q => slcvec_angle_polar_o_reg_4738(4),
      R => '0'
    );
\slcvec_angle_polar_o_reg_4738_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => slcvec_angle_polar_offset_mrad_V(5),
      Q => slcvec_angle_polar_o_reg_4738(5),
      R => '0'
    );
\slcvec_angle_polar_o_reg_4738_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => slcvec_angle_polar_offset_mrad_V(6),
      Q => slcvec_angle_polar_o_reg_4738(6),
      R => '0'
    );
\slcvec_angle_polar_o_reg_4738_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => slcvec_angle_polar_offset_mrad_V(7),
      Q => slcvec_angle_polar_o_reg_4738(7),
      R => '0'
    );
\slcvec_angle_polar_o_reg_4738_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => slcvec_angle_polar_offset_mrad_V(8),
      Q => slcvec_angle_polar_o_reg_4738(8),
      R => '0'
    );
\slcvec_angle_polar_o_reg_4738_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => slcvec_angle_polar_offset_mrad_V(9),
      Q => slcvec_angle_polar_o_reg_4738(9),
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity hls_find_max_bin is
  port (
    hls_LT_theta_global_V_ap_vld : out STD_LOGIC;
    hls_LT_r_global_V_ap_vld : out STD_LOGIC;
    hls_LT_theta_V_ap_vld : out STD_LOGIC;
    hls_LT_r_V_ap_vld : out STD_LOGIC;
    res_max_bin_count_V_ap_vld : out STD_LOGIC;
    res_max_bin_theta_V_ap_vld : out STD_LOGIC;
    res_max_bin_r_V_ap_vld : out STD_LOGIC;
    ap_clk : in STD_LOGIC;
    ap_rst : in STD_LOGIC;
    ap_start : in STD_LOGIC;
    ap_done : out STD_LOGIC;
    ap_idle : out STD_LOGIC;
    ap_ready : out STD_LOGIC;
    slcvec_angle_polar_offset_mrad_V : in STD_LOGIC_VECTOR ( 13 downto 0 );
    roi_seed_r_V : in STD_LOGIC_VECTOR ( 21 downto 0 );
    max_bin_count_0_V : in STD_LOGIC_VECTOR ( 3 downto 0 );
    max_bin_count_1_V : in STD_LOGIC_VECTOR ( 3 downto 0 );
    max_bin_count_2_V : in STD_LOGIC_VECTOR ( 3 downto 0 );
    max_bin_count_3_V : in STD_LOGIC_VECTOR ( 3 downto 0 );
    max_bin_count_4_V : in STD_LOGIC_VECTOR ( 3 downto 0 );
    max_bin_count_5_V : in STD_LOGIC_VECTOR ( 3 downto 0 );
    max_bin_count_6_V : in STD_LOGIC_VECTOR ( 3 downto 0 );
    max_bin_count_7_V : in STD_LOGIC_VECTOR ( 3 downto 0 );
    max_bin_count_8_V : in STD_LOGIC_VECTOR ( 3 downto 0 );
    max_bin_count_9_V : in STD_LOGIC_VECTOR ( 3 downto 0 );
    max_bin_count_10_V : in STD_LOGIC_VECTOR ( 3 downto 0 );
    max_bin_count_11_V : in STD_LOGIC_VECTOR ( 3 downto 0 );
    max_bin_count_12_V : in STD_LOGIC_VECTOR ( 3 downto 0 );
    max_bin_count_13_V : in STD_LOGIC_VECTOR ( 3 downto 0 );
    max_bin_count_14_V : in STD_LOGIC_VECTOR ( 3 downto 0 );
    max_bin_count_15_V : in STD_LOGIC_VECTOR ( 3 downto 0 );
    max_bin_count_16_V : in STD_LOGIC_VECTOR ( 3 downto 0 );
    max_bin_count_17_V : in STD_LOGIC_VECTOR ( 3 downto 0 );
    max_bin_count_18_V : in STD_LOGIC_VECTOR ( 3 downto 0 );
    max_bin_count_19_V : in STD_LOGIC_VECTOR ( 3 downto 0 );
    max_bin_count_20_V : in STD_LOGIC_VECTOR ( 3 downto 0 );
    max_bin_count_21_V : in STD_LOGIC_VECTOR ( 3 downto 0 );
    max_bin_count_22_V : in STD_LOGIC_VECTOR ( 3 downto 0 );
    max_bin_count_23_V : in STD_LOGIC_VECTOR ( 3 downto 0 );
    max_bin_count_24_V : in STD_LOGIC_VECTOR ( 3 downto 0 );
    max_bin_count_25_V : in STD_LOGIC_VECTOR ( 3 downto 0 );
    max_bin_count_26_V : in STD_LOGIC_VECTOR ( 3 downto 0 );
    max_bin_count_27_V : in STD_LOGIC_VECTOR ( 3 downto 0 );
    max_bin_count_28_V : in STD_LOGIC_VECTOR ( 3 downto 0 );
    max_bin_count_29_V : in STD_LOGIC_VECTOR ( 3 downto 0 );
    max_bin_count_30_V : in STD_LOGIC_VECTOR ( 3 downto 0 );
    max_bin_count_31_V : in STD_LOGIC_VECTOR ( 3 downto 0 );
    max_bin_count_32_V : in STD_LOGIC_VECTOR ( 3 downto 0 );
    max_bin_count_33_V : in STD_LOGIC_VECTOR ( 3 downto 0 );
    max_bin_count_34_V : in STD_LOGIC_VECTOR ( 3 downto 0 );
    max_bin_count_35_V : in STD_LOGIC_VECTOR ( 3 downto 0 );
    max_bin_count_36_V : in STD_LOGIC_VECTOR ( 3 downto 0 );
    max_bin_count_37_V : in STD_LOGIC_VECTOR ( 3 downto 0 );
    max_bin_count_38_V : in STD_LOGIC_VECTOR ( 3 downto 0 );
    max_bin_count_39_V : in STD_LOGIC_VECTOR ( 3 downto 0 );
    max_bin_count_40_V : in STD_LOGIC_VECTOR ( 3 downto 0 );
    max_bin_count_41_V : in STD_LOGIC_VECTOR ( 3 downto 0 );
    max_bin_count_42_V : in STD_LOGIC_VECTOR ( 3 downto 0 );
    max_bin_count_43_V : in STD_LOGIC_VECTOR ( 3 downto 0 );
    max_bin_count_44_V : in STD_LOGIC_VECTOR ( 3 downto 0 );
    max_bin_count_45_V : in STD_LOGIC_VECTOR ( 3 downto 0 );
    max_bin_count_46_V : in STD_LOGIC_VECTOR ( 3 downto 0 );
    max_bin_count_47_V : in STD_LOGIC_VECTOR ( 3 downto 0 );
    max_bin_count_48_V : in STD_LOGIC_VECTOR ( 3 downto 0 );
    max_bin_count_49_V : in STD_LOGIC_VECTOR ( 3 downto 0 );
    max_bin_count_50_V : in STD_LOGIC_VECTOR ( 3 downto 0 );
    max_bin_count_51_V : in STD_LOGIC_VECTOR ( 3 downto 0 );
    max_bin_count_52_V : in STD_LOGIC_VECTOR ( 3 downto 0 );
    max_bin_count_53_V : in STD_LOGIC_VECTOR ( 3 downto 0 );
    max_bin_count_54_V : in STD_LOGIC_VECTOR ( 3 downto 0 );
    max_bin_count_55_V : in STD_LOGIC_VECTOR ( 3 downto 0 );
    max_bin_count_56_V : in STD_LOGIC_VECTOR ( 3 downto 0 );
    max_bin_count_57_V : in STD_LOGIC_VECTOR ( 3 downto 0 );
    max_bin_count_58_V : in STD_LOGIC_VECTOR ( 3 downto 0 );
    max_bin_count_59_V : in STD_LOGIC_VECTOR ( 3 downto 0 );
    max_bin_count_60_V : in STD_LOGIC_VECTOR ( 3 downto 0 );
    max_bin_count_61_V : in STD_LOGIC_VECTOR ( 3 downto 0 );
    max_bin_count_62_V : in STD_LOGIC_VECTOR ( 3 downto 0 );
    max_bin_count_63_V : in STD_LOGIC_VECTOR ( 3 downto 0 );
    max_bin_r_0_V : in STD_LOGIC_VECTOR ( 6 downto 0 );
    max_bin_r_1_V : in STD_LOGIC_VECTOR ( 6 downto 0 );
    max_bin_r_2_V : in STD_LOGIC_VECTOR ( 6 downto 0 );
    max_bin_r_3_V : in STD_LOGIC_VECTOR ( 6 downto 0 );
    max_bin_r_4_V : in STD_LOGIC_VECTOR ( 6 downto 0 );
    max_bin_r_5_V : in STD_LOGIC_VECTOR ( 6 downto 0 );
    max_bin_r_6_V : in STD_LOGIC_VECTOR ( 6 downto 0 );
    max_bin_r_7_V : in STD_LOGIC_VECTOR ( 6 downto 0 );
    max_bin_r_8_V : in STD_LOGIC_VECTOR ( 6 downto 0 );
    max_bin_r_9_V : in STD_LOGIC_VECTOR ( 6 downto 0 );
    max_bin_r_10_V : in STD_LOGIC_VECTOR ( 6 downto 0 );
    max_bin_r_11_V : in STD_LOGIC_VECTOR ( 6 downto 0 );
    max_bin_r_12_V : in STD_LOGIC_VECTOR ( 6 downto 0 );
    max_bin_r_13_V : in STD_LOGIC_VECTOR ( 6 downto 0 );
    max_bin_r_14_V : in STD_LOGIC_VECTOR ( 6 downto 0 );
    max_bin_r_15_V : in STD_LOGIC_VECTOR ( 6 downto 0 );
    max_bin_r_16_V : in STD_LOGIC_VECTOR ( 6 downto 0 );
    max_bin_r_17_V : in STD_LOGIC_VECTOR ( 6 downto 0 );
    max_bin_r_18_V : in STD_LOGIC_VECTOR ( 6 downto 0 );
    max_bin_r_19_V : in STD_LOGIC_VECTOR ( 6 downto 0 );
    max_bin_r_20_V : in STD_LOGIC_VECTOR ( 6 downto 0 );
    max_bin_r_21_V : in STD_LOGIC_VECTOR ( 6 downto 0 );
    max_bin_r_22_V : in STD_LOGIC_VECTOR ( 6 downto 0 );
    max_bin_r_23_V : in STD_LOGIC_VECTOR ( 6 downto 0 );
    max_bin_r_24_V : in STD_LOGIC_VECTOR ( 6 downto 0 );
    max_bin_r_25_V : in STD_LOGIC_VECTOR ( 6 downto 0 );
    max_bin_r_26_V : in STD_LOGIC_VECTOR ( 6 downto 0 );
    max_bin_r_27_V : in STD_LOGIC_VECTOR ( 6 downto 0 );
    max_bin_r_28_V : in STD_LOGIC_VECTOR ( 6 downto 0 );
    max_bin_r_29_V : in STD_LOGIC_VECTOR ( 6 downto 0 );
    max_bin_r_30_V : in STD_LOGIC_VECTOR ( 6 downto 0 );
    max_bin_r_31_V : in STD_LOGIC_VECTOR ( 6 downto 0 );
    max_bin_r_32_V : in STD_LOGIC_VECTOR ( 6 downto 0 );
    max_bin_r_33_V : in STD_LOGIC_VECTOR ( 6 downto 0 );
    max_bin_r_34_V : in STD_LOGIC_VECTOR ( 6 downto 0 );
    max_bin_r_35_V : in STD_LOGIC_VECTOR ( 6 downto 0 );
    max_bin_r_36_V : in STD_LOGIC_VECTOR ( 6 downto 0 );
    max_bin_r_37_V : in STD_LOGIC_VECTOR ( 6 downto 0 );
    max_bin_r_38_V : in STD_LOGIC_VECTOR ( 6 downto 0 );
    max_bin_r_39_V : in STD_LOGIC_VECTOR ( 6 downto 0 );
    max_bin_r_40_V : in STD_LOGIC_VECTOR ( 6 downto 0 );
    max_bin_r_41_V : in STD_LOGIC_VECTOR ( 6 downto 0 );
    max_bin_r_42_V : in STD_LOGIC_VECTOR ( 6 downto 0 );
    max_bin_r_43_V : in STD_LOGIC_VECTOR ( 6 downto 0 );
    max_bin_r_44_V : in STD_LOGIC_VECTOR ( 6 downto 0 );
    max_bin_r_45_V : in STD_LOGIC_VECTOR ( 6 downto 0 );
    max_bin_r_46_V : in STD_LOGIC_VECTOR ( 6 downto 0 );
    max_bin_r_47_V : in STD_LOGIC_VECTOR ( 6 downto 0 );
    max_bin_r_48_V : in STD_LOGIC_VECTOR ( 6 downto 0 );
    max_bin_r_49_V : in STD_LOGIC_VECTOR ( 6 downto 0 );
    max_bin_r_50_V : in STD_LOGIC_VECTOR ( 6 downto 0 );
    max_bin_r_51_V : in STD_LOGIC_VECTOR ( 6 downto 0 );
    max_bin_r_52_V : in STD_LOGIC_VECTOR ( 6 downto 0 );
    max_bin_r_53_V : in STD_LOGIC_VECTOR ( 6 downto 0 );
    max_bin_r_54_V : in STD_LOGIC_VECTOR ( 6 downto 0 );
    max_bin_r_55_V : in STD_LOGIC_VECTOR ( 6 downto 0 );
    max_bin_r_56_V : in STD_LOGIC_VECTOR ( 6 downto 0 );
    max_bin_r_57_V : in STD_LOGIC_VECTOR ( 6 downto 0 );
    max_bin_r_58_V : in STD_LOGIC_VECTOR ( 6 downto 0 );
    max_bin_r_59_V : in STD_LOGIC_VECTOR ( 6 downto 0 );
    max_bin_r_60_V : in STD_LOGIC_VECTOR ( 6 downto 0 );
    max_bin_r_61_V : in STD_LOGIC_VECTOR ( 6 downto 0 );
    max_bin_r_62_V : in STD_LOGIC_VECTOR ( 6 downto 0 );
    max_bin_r_63_V : in STD_LOGIC_VECTOR ( 6 downto 0 );
    hls_LT_theta_global_V : out STD_LOGIC_VECTOR ( 13 downto 0 );
    hls_LT_r_global_V : out STD_LOGIC_VECTOR ( 21 downto 0 );
    hls_LT_theta_V : out STD_LOGIC_VECTOR ( 13 downto 0 );
    hls_LT_r_V : out STD_LOGIC_VECTOR ( 21 downto 0 );
    res_max_bin_count_V : out STD_LOGIC_VECTOR ( 3 downto 0 );
    res_max_bin_theta_V : out STD_LOGIC_VECTOR ( 6 downto 0 );
    res_max_bin_r_V : out STD_LOGIC_VECTOR ( 6 downto 0 )
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of hls_find_max_bin : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of hls_find_max_bin : entity is "hls_find_max_bin,find_max_bin,{}";
  attribute downgradeipidentifiedwarnings : string;
  attribute downgradeipidentifiedwarnings of hls_find_max_bin : entity is "yes";
  attribute ip_definition_source : string;
  attribute ip_definition_source of hls_find_max_bin : entity is "HLS";
  attribute x_core_info : string;
  attribute x_core_info of hls_find_max_bin : entity is "find_max_bin,Vivado 2019.2.1";
end hls_find_max_bin;

architecture STRUCTURE of hls_find_max_bin is
  attribute x_interface_info : string;
  attribute x_interface_info of ap_clk : signal is "xilinx.com:signal:clock:1.0 ap_clk CLK";
  attribute x_interface_parameter : string;
  attribute x_interface_parameter of ap_clk : signal is "XIL_INTERFACENAME ap_clk, ASSOCIATED_RESET ap_rst, FREQ_HZ 100000000, PHASE 0.000, INSERT_VIP 0";
  attribute x_interface_info of ap_done : signal is "xilinx.com:interface:acc_handshake:1.0 ap_ctrl done";
  attribute x_interface_info of ap_idle : signal is "xilinx.com:interface:acc_handshake:1.0 ap_ctrl idle";
  attribute x_interface_info of ap_ready : signal is "xilinx.com:interface:acc_handshake:1.0 ap_ctrl ready";
  attribute x_interface_info of ap_rst : signal is "xilinx.com:signal:reset:1.0 ap_rst RST";
  attribute x_interface_parameter of ap_rst : signal is "XIL_INTERFACENAME ap_rst, POLARITY ACTIVE_HIGH, INSERT_VIP 0";
  attribute x_interface_info of ap_start : signal is "xilinx.com:interface:acc_handshake:1.0 ap_ctrl start";
  attribute x_interface_info of hls_LT_r_V : signal is "xilinx.com:signal:data:1.0 hls_LT_r_V DATA";
  attribute x_interface_parameter of hls_LT_r_V : signal is "XIL_INTERFACENAME hls_LT_r_V, LAYERED_METADATA undef";
  attribute x_interface_info of hls_LT_r_global_V : signal is "xilinx.com:signal:data:1.0 hls_LT_r_global_V DATA";
  attribute x_interface_parameter of hls_LT_r_global_V : signal is "XIL_INTERFACENAME hls_LT_r_global_V, LAYERED_METADATA undef";
  attribute x_interface_info of hls_LT_theta_V : signal is "xilinx.com:signal:data:1.0 hls_LT_theta_V DATA";
  attribute x_interface_parameter of hls_LT_theta_V : signal is "XIL_INTERFACENAME hls_LT_theta_V, LAYERED_METADATA undef";
  attribute x_interface_info of hls_LT_theta_global_V : signal is "xilinx.com:signal:data:1.0 hls_LT_theta_global_V DATA";
  attribute x_interface_parameter of hls_LT_theta_global_V : signal is "XIL_INTERFACENAME hls_LT_theta_global_V, LAYERED_METADATA undef";
  attribute x_interface_info of max_bin_count_0_V : signal is "xilinx.com:signal:data:1.0 max_bin_count_0_V DATA";
  attribute x_interface_parameter of max_bin_count_0_V : signal is "XIL_INTERFACENAME max_bin_count_0_V, LAYERED_METADATA undef";
  attribute x_interface_info of max_bin_count_10_V : signal is "xilinx.com:signal:data:1.0 max_bin_count_10_V DATA";
  attribute x_interface_parameter of max_bin_count_10_V : signal is "XIL_INTERFACENAME max_bin_count_10_V, LAYERED_METADATA undef";
  attribute x_interface_info of max_bin_count_11_V : signal is "xilinx.com:signal:data:1.0 max_bin_count_11_V DATA";
  attribute x_interface_parameter of max_bin_count_11_V : signal is "XIL_INTERFACENAME max_bin_count_11_V, LAYERED_METADATA undef";
  attribute x_interface_info of max_bin_count_12_V : signal is "xilinx.com:signal:data:1.0 max_bin_count_12_V DATA";
  attribute x_interface_parameter of max_bin_count_12_V : signal is "XIL_INTERFACENAME max_bin_count_12_V, LAYERED_METADATA undef";
  attribute x_interface_info of max_bin_count_13_V : signal is "xilinx.com:signal:data:1.0 max_bin_count_13_V DATA";
  attribute x_interface_parameter of max_bin_count_13_V : signal is "XIL_INTERFACENAME max_bin_count_13_V, LAYERED_METADATA undef";
  attribute x_interface_info of max_bin_count_14_V : signal is "xilinx.com:signal:data:1.0 max_bin_count_14_V DATA";
  attribute x_interface_parameter of max_bin_count_14_V : signal is "XIL_INTERFACENAME max_bin_count_14_V, LAYERED_METADATA undef";
  attribute x_interface_info of max_bin_count_15_V : signal is "xilinx.com:signal:data:1.0 max_bin_count_15_V DATA";
  attribute x_interface_parameter of max_bin_count_15_V : signal is "XIL_INTERFACENAME max_bin_count_15_V, LAYERED_METADATA undef";
  attribute x_interface_info of max_bin_count_16_V : signal is "xilinx.com:signal:data:1.0 max_bin_count_16_V DATA";
  attribute x_interface_parameter of max_bin_count_16_V : signal is "XIL_INTERFACENAME max_bin_count_16_V, LAYERED_METADATA undef";
  attribute x_interface_info of max_bin_count_17_V : signal is "xilinx.com:signal:data:1.0 max_bin_count_17_V DATA";
  attribute x_interface_parameter of max_bin_count_17_V : signal is "XIL_INTERFACENAME max_bin_count_17_V, LAYERED_METADATA undef";
  attribute x_interface_info of max_bin_count_18_V : signal is "xilinx.com:signal:data:1.0 max_bin_count_18_V DATA";
  attribute x_interface_parameter of max_bin_count_18_V : signal is "XIL_INTERFACENAME max_bin_count_18_V, LAYERED_METADATA undef";
  attribute x_interface_info of max_bin_count_19_V : signal is "xilinx.com:signal:data:1.0 max_bin_count_19_V DATA";
  attribute x_interface_parameter of max_bin_count_19_V : signal is "XIL_INTERFACENAME max_bin_count_19_V, LAYERED_METADATA undef";
  attribute x_interface_info of max_bin_count_1_V : signal is "xilinx.com:signal:data:1.0 max_bin_count_1_V DATA";
  attribute x_interface_parameter of max_bin_count_1_V : signal is "XIL_INTERFACENAME max_bin_count_1_V, LAYERED_METADATA undef";
  attribute x_interface_info of max_bin_count_20_V : signal is "xilinx.com:signal:data:1.0 max_bin_count_20_V DATA";
  attribute x_interface_parameter of max_bin_count_20_V : signal is "XIL_INTERFACENAME max_bin_count_20_V, LAYERED_METADATA undef";
  attribute x_interface_info of max_bin_count_21_V : signal is "xilinx.com:signal:data:1.0 max_bin_count_21_V DATA";
  attribute x_interface_parameter of max_bin_count_21_V : signal is "XIL_INTERFACENAME max_bin_count_21_V, LAYERED_METADATA undef";
  attribute x_interface_info of max_bin_count_22_V : signal is "xilinx.com:signal:data:1.0 max_bin_count_22_V DATA";
  attribute x_interface_parameter of max_bin_count_22_V : signal is "XIL_INTERFACENAME max_bin_count_22_V, LAYERED_METADATA undef";
  attribute x_interface_info of max_bin_count_23_V : signal is "xilinx.com:signal:data:1.0 max_bin_count_23_V DATA";
  attribute x_interface_parameter of max_bin_count_23_V : signal is "XIL_INTERFACENAME max_bin_count_23_V, LAYERED_METADATA undef";
  attribute x_interface_info of max_bin_count_24_V : signal is "xilinx.com:signal:data:1.0 max_bin_count_24_V DATA";
  attribute x_interface_parameter of max_bin_count_24_V : signal is "XIL_INTERFACENAME max_bin_count_24_V, LAYERED_METADATA undef";
  attribute x_interface_info of max_bin_count_25_V : signal is "xilinx.com:signal:data:1.0 max_bin_count_25_V DATA";
  attribute x_interface_parameter of max_bin_count_25_V : signal is "XIL_INTERFACENAME max_bin_count_25_V, LAYERED_METADATA undef";
  attribute x_interface_info of max_bin_count_26_V : signal is "xilinx.com:signal:data:1.0 max_bin_count_26_V DATA";
  attribute x_interface_parameter of max_bin_count_26_V : signal is "XIL_INTERFACENAME max_bin_count_26_V, LAYERED_METADATA undef";
  attribute x_interface_info of max_bin_count_27_V : signal is "xilinx.com:signal:data:1.0 max_bin_count_27_V DATA";
  attribute x_interface_parameter of max_bin_count_27_V : signal is "XIL_INTERFACENAME max_bin_count_27_V, LAYERED_METADATA undef";
  attribute x_interface_info of max_bin_count_28_V : signal is "xilinx.com:signal:data:1.0 max_bin_count_28_V DATA";
  attribute x_interface_parameter of max_bin_count_28_V : signal is "XIL_INTERFACENAME max_bin_count_28_V, LAYERED_METADATA undef";
  attribute x_interface_info of max_bin_count_29_V : signal is "xilinx.com:signal:data:1.0 max_bin_count_29_V DATA";
  attribute x_interface_parameter of max_bin_count_29_V : signal is "XIL_INTERFACENAME max_bin_count_29_V, LAYERED_METADATA undef";
  attribute x_interface_info of max_bin_count_2_V : signal is "xilinx.com:signal:data:1.0 max_bin_count_2_V DATA";
  attribute x_interface_parameter of max_bin_count_2_V : signal is "XIL_INTERFACENAME max_bin_count_2_V, LAYERED_METADATA undef";
  attribute x_interface_info of max_bin_count_30_V : signal is "xilinx.com:signal:data:1.0 max_bin_count_30_V DATA";
  attribute x_interface_parameter of max_bin_count_30_V : signal is "XIL_INTERFACENAME max_bin_count_30_V, LAYERED_METADATA undef";
  attribute x_interface_info of max_bin_count_31_V : signal is "xilinx.com:signal:data:1.0 max_bin_count_31_V DATA";
  attribute x_interface_parameter of max_bin_count_31_V : signal is "XIL_INTERFACENAME max_bin_count_31_V, LAYERED_METADATA undef";
  attribute x_interface_info of max_bin_count_32_V : signal is "xilinx.com:signal:data:1.0 max_bin_count_32_V DATA";
  attribute x_interface_parameter of max_bin_count_32_V : signal is "XIL_INTERFACENAME max_bin_count_32_V, LAYERED_METADATA undef";
  attribute x_interface_info of max_bin_count_33_V : signal is "xilinx.com:signal:data:1.0 max_bin_count_33_V DATA";
  attribute x_interface_parameter of max_bin_count_33_V : signal is "XIL_INTERFACENAME max_bin_count_33_V, LAYERED_METADATA undef";
  attribute x_interface_info of max_bin_count_34_V : signal is "xilinx.com:signal:data:1.0 max_bin_count_34_V DATA";
  attribute x_interface_parameter of max_bin_count_34_V : signal is "XIL_INTERFACENAME max_bin_count_34_V, LAYERED_METADATA undef";
  attribute x_interface_info of max_bin_count_35_V : signal is "xilinx.com:signal:data:1.0 max_bin_count_35_V DATA";
  attribute x_interface_parameter of max_bin_count_35_V : signal is "XIL_INTERFACENAME max_bin_count_35_V, LAYERED_METADATA undef";
  attribute x_interface_info of max_bin_count_36_V : signal is "xilinx.com:signal:data:1.0 max_bin_count_36_V DATA";
  attribute x_interface_parameter of max_bin_count_36_V : signal is "XIL_INTERFACENAME max_bin_count_36_V, LAYERED_METADATA undef";
  attribute x_interface_info of max_bin_count_37_V : signal is "xilinx.com:signal:data:1.0 max_bin_count_37_V DATA";
  attribute x_interface_parameter of max_bin_count_37_V : signal is "XIL_INTERFACENAME max_bin_count_37_V, LAYERED_METADATA undef";
  attribute x_interface_info of max_bin_count_38_V : signal is "xilinx.com:signal:data:1.0 max_bin_count_38_V DATA";
  attribute x_interface_parameter of max_bin_count_38_V : signal is "XIL_INTERFACENAME max_bin_count_38_V, LAYERED_METADATA undef";
  attribute x_interface_info of max_bin_count_39_V : signal is "xilinx.com:signal:data:1.0 max_bin_count_39_V DATA";
  attribute x_interface_parameter of max_bin_count_39_V : signal is "XIL_INTERFACENAME max_bin_count_39_V, LAYERED_METADATA undef";
  attribute x_interface_info of max_bin_count_3_V : signal is "xilinx.com:signal:data:1.0 max_bin_count_3_V DATA";
  attribute x_interface_parameter of max_bin_count_3_V : signal is "XIL_INTERFACENAME max_bin_count_3_V, LAYERED_METADATA undef";
  attribute x_interface_info of max_bin_count_40_V : signal is "xilinx.com:signal:data:1.0 max_bin_count_40_V DATA";
  attribute x_interface_parameter of max_bin_count_40_V : signal is "XIL_INTERFACENAME max_bin_count_40_V, LAYERED_METADATA undef";
  attribute x_interface_info of max_bin_count_41_V : signal is "xilinx.com:signal:data:1.0 max_bin_count_41_V DATA";
  attribute x_interface_parameter of max_bin_count_41_V : signal is "XIL_INTERFACENAME max_bin_count_41_V, LAYERED_METADATA undef";
  attribute x_interface_info of max_bin_count_42_V : signal is "xilinx.com:signal:data:1.0 max_bin_count_42_V DATA";
  attribute x_interface_parameter of max_bin_count_42_V : signal is "XIL_INTERFACENAME max_bin_count_42_V, LAYERED_METADATA undef";
  attribute x_interface_info of max_bin_count_43_V : signal is "xilinx.com:signal:data:1.0 max_bin_count_43_V DATA";
  attribute x_interface_parameter of max_bin_count_43_V : signal is "XIL_INTERFACENAME max_bin_count_43_V, LAYERED_METADATA undef";
  attribute x_interface_info of max_bin_count_44_V : signal is "xilinx.com:signal:data:1.0 max_bin_count_44_V DATA";
  attribute x_interface_parameter of max_bin_count_44_V : signal is "XIL_INTERFACENAME max_bin_count_44_V, LAYERED_METADATA undef";
  attribute x_interface_info of max_bin_count_45_V : signal is "xilinx.com:signal:data:1.0 max_bin_count_45_V DATA";
  attribute x_interface_parameter of max_bin_count_45_V : signal is "XIL_INTERFACENAME max_bin_count_45_V, LAYERED_METADATA undef";
  attribute x_interface_info of max_bin_count_46_V : signal is "xilinx.com:signal:data:1.0 max_bin_count_46_V DATA";
  attribute x_interface_parameter of max_bin_count_46_V : signal is "XIL_INTERFACENAME max_bin_count_46_V, LAYERED_METADATA undef";
  attribute x_interface_info of max_bin_count_47_V : signal is "xilinx.com:signal:data:1.0 max_bin_count_47_V DATA";
  attribute x_interface_parameter of max_bin_count_47_V : signal is "XIL_INTERFACENAME max_bin_count_47_V, LAYERED_METADATA undef";
  attribute x_interface_info of max_bin_count_48_V : signal is "xilinx.com:signal:data:1.0 max_bin_count_48_V DATA";
  attribute x_interface_parameter of max_bin_count_48_V : signal is "XIL_INTERFACENAME max_bin_count_48_V, LAYERED_METADATA undef";
  attribute x_interface_info of max_bin_count_49_V : signal is "xilinx.com:signal:data:1.0 max_bin_count_49_V DATA";
  attribute x_interface_parameter of max_bin_count_49_V : signal is "XIL_INTERFACENAME max_bin_count_49_V, LAYERED_METADATA undef";
  attribute x_interface_info of max_bin_count_4_V : signal is "xilinx.com:signal:data:1.0 max_bin_count_4_V DATA";
  attribute x_interface_parameter of max_bin_count_4_V : signal is "XIL_INTERFACENAME max_bin_count_4_V, LAYERED_METADATA undef";
  attribute x_interface_info of max_bin_count_50_V : signal is "xilinx.com:signal:data:1.0 max_bin_count_50_V DATA";
  attribute x_interface_parameter of max_bin_count_50_V : signal is "XIL_INTERFACENAME max_bin_count_50_V, LAYERED_METADATA undef";
  attribute x_interface_info of max_bin_count_51_V : signal is "xilinx.com:signal:data:1.0 max_bin_count_51_V DATA";
  attribute x_interface_parameter of max_bin_count_51_V : signal is "XIL_INTERFACENAME max_bin_count_51_V, LAYERED_METADATA undef";
  attribute x_interface_info of max_bin_count_52_V : signal is "xilinx.com:signal:data:1.0 max_bin_count_52_V DATA";
  attribute x_interface_parameter of max_bin_count_52_V : signal is "XIL_INTERFACENAME max_bin_count_52_V, LAYERED_METADATA undef";
  attribute x_interface_info of max_bin_count_53_V : signal is "xilinx.com:signal:data:1.0 max_bin_count_53_V DATA";
  attribute x_interface_parameter of max_bin_count_53_V : signal is "XIL_INTERFACENAME max_bin_count_53_V, LAYERED_METADATA undef";
  attribute x_interface_info of max_bin_count_54_V : signal is "xilinx.com:signal:data:1.0 max_bin_count_54_V DATA";
  attribute x_interface_parameter of max_bin_count_54_V : signal is "XIL_INTERFACENAME max_bin_count_54_V, LAYERED_METADATA undef";
  attribute x_interface_info of max_bin_count_55_V : signal is "xilinx.com:signal:data:1.0 max_bin_count_55_V DATA";
  attribute x_interface_parameter of max_bin_count_55_V : signal is "XIL_INTERFACENAME max_bin_count_55_V, LAYERED_METADATA undef";
  attribute x_interface_info of max_bin_count_56_V : signal is "xilinx.com:signal:data:1.0 max_bin_count_56_V DATA";
  attribute x_interface_parameter of max_bin_count_56_V : signal is "XIL_INTERFACENAME max_bin_count_56_V, LAYERED_METADATA undef";
  attribute x_interface_info of max_bin_count_57_V : signal is "xilinx.com:signal:data:1.0 max_bin_count_57_V DATA";
  attribute x_interface_parameter of max_bin_count_57_V : signal is "XIL_INTERFACENAME max_bin_count_57_V, LAYERED_METADATA undef";
  attribute x_interface_info of max_bin_count_58_V : signal is "xilinx.com:signal:data:1.0 max_bin_count_58_V DATA";
  attribute x_interface_parameter of max_bin_count_58_V : signal is "XIL_INTERFACENAME max_bin_count_58_V, LAYERED_METADATA undef";
  attribute x_interface_info of max_bin_count_59_V : signal is "xilinx.com:signal:data:1.0 max_bin_count_59_V DATA";
  attribute x_interface_parameter of max_bin_count_59_V : signal is "XIL_INTERFACENAME max_bin_count_59_V, LAYERED_METADATA undef";
  attribute x_interface_info of max_bin_count_5_V : signal is "xilinx.com:signal:data:1.0 max_bin_count_5_V DATA";
  attribute x_interface_parameter of max_bin_count_5_V : signal is "XIL_INTERFACENAME max_bin_count_5_V, LAYERED_METADATA undef";
  attribute x_interface_info of max_bin_count_60_V : signal is "xilinx.com:signal:data:1.0 max_bin_count_60_V DATA";
  attribute x_interface_parameter of max_bin_count_60_V : signal is "XIL_INTERFACENAME max_bin_count_60_V, LAYERED_METADATA undef";
  attribute x_interface_info of max_bin_count_61_V : signal is "xilinx.com:signal:data:1.0 max_bin_count_61_V DATA";
  attribute x_interface_parameter of max_bin_count_61_V : signal is "XIL_INTERFACENAME max_bin_count_61_V, LAYERED_METADATA undef";
  attribute x_interface_info of max_bin_count_62_V : signal is "xilinx.com:signal:data:1.0 max_bin_count_62_V DATA";
  attribute x_interface_parameter of max_bin_count_62_V : signal is "XIL_INTERFACENAME max_bin_count_62_V, LAYERED_METADATA undef";
  attribute x_interface_info of max_bin_count_63_V : signal is "xilinx.com:signal:data:1.0 max_bin_count_63_V DATA";
  attribute x_interface_parameter of max_bin_count_63_V : signal is "XIL_INTERFACENAME max_bin_count_63_V, LAYERED_METADATA undef";
  attribute x_interface_info of max_bin_count_6_V : signal is "xilinx.com:signal:data:1.0 max_bin_count_6_V DATA";
  attribute x_interface_parameter of max_bin_count_6_V : signal is "XIL_INTERFACENAME max_bin_count_6_V, LAYERED_METADATA undef";
  attribute x_interface_info of max_bin_count_7_V : signal is "xilinx.com:signal:data:1.0 max_bin_count_7_V DATA";
  attribute x_interface_parameter of max_bin_count_7_V : signal is "XIL_INTERFACENAME max_bin_count_7_V, LAYERED_METADATA undef";
  attribute x_interface_info of max_bin_count_8_V : signal is "xilinx.com:signal:data:1.0 max_bin_count_8_V DATA";
  attribute x_interface_parameter of max_bin_count_8_V : signal is "XIL_INTERFACENAME max_bin_count_8_V, LAYERED_METADATA undef";
  attribute x_interface_info of max_bin_count_9_V : signal is "xilinx.com:signal:data:1.0 max_bin_count_9_V DATA";
  attribute x_interface_parameter of max_bin_count_9_V : signal is "XIL_INTERFACENAME max_bin_count_9_V, LAYERED_METADATA undef";
  attribute x_interface_info of max_bin_r_0_V : signal is "xilinx.com:signal:data:1.0 max_bin_r_0_V DATA";
  attribute x_interface_parameter of max_bin_r_0_V : signal is "XIL_INTERFACENAME max_bin_r_0_V, LAYERED_METADATA undef";
  attribute x_interface_info of max_bin_r_10_V : signal is "xilinx.com:signal:data:1.0 max_bin_r_10_V DATA";
  attribute x_interface_parameter of max_bin_r_10_V : signal is "XIL_INTERFACENAME max_bin_r_10_V, LAYERED_METADATA undef";
  attribute x_interface_info of max_bin_r_11_V : signal is "xilinx.com:signal:data:1.0 max_bin_r_11_V DATA";
  attribute x_interface_parameter of max_bin_r_11_V : signal is "XIL_INTERFACENAME max_bin_r_11_V, LAYERED_METADATA undef";
  attribute x_interface_info of max_bin_r_12_V : signal is "xilinx.com:signal:data:1.0 max_bin_r_12_V DATA";
  attribute x_interface_parameter of max_bin_r_12_V : signal is "XIL_INTERFACENAME max_bin_r_12_V, LAYERED_METADATA undef";
  attribute x_interface_info of max_bin_r_13_V : signal is "xilinx.com:signal:data:1.0 max_bin_r_13_V DATA";
  attribute x_interface_parameter of max_bin_r_13_V : signal is "XIL_INTERFACENAME max_bin_r_13_V, LAYERED_METADATA undef";
  attribute x_interface_info of max_bin_r_14_V : signal is "xilinx.com:signal:data:1.0 max_bin_r_14_V DATA";
  attribute x_interface_parameter of max_bin_r_14_V : signal is "XIL_INTERFACENAME max_bin_r_14_V, LAYERED_METADATA undef";
  attribute x_interface_info of max_bin_r_15_V : signal is "xilinx.com:signal:data:1.0 max_bin_r_15_V DATA";
  attribute x_interface_parameter of max_bin_r_15_V : signal is "XIL_INTERFACENAME max_bin_r_15_V, LAYERED_METADATA undef";
  attribute x_interface_info of max_bin_r_16_V : signal is "xilinx.com:signal:data:1.0 max_bin_r_16_V DATA";
  attribute x_interface_parameter of max_bin_r_16_V : signal is "XIL_INTERFACENAME max_bin_r_16_V, LAYERED_METADATA undef";
  attribute x_interface_info of max_bin_r_17_V : signal is "xilinx.com:signal:data:1.0 max_bin_r_17_V DATA";
  attribute x_interface_parameter of max_bin_r_17_V : signal is "XIL_INTERFACENAME max_bin_r_17_V, LAYERED_METADATA undef";
  attribute x_interface_info of max_bin_r_18_V : signal is "xilinx.com:signal:data:1.0 max_bin_r_18_V DATA";
  attribute x_interface_parameter of max_bin_r_18_V : signal is "XIL_INTERFACENAME max_bin_r_18_V, LAYERED_METADATA undef";
  attribute x_interface_info of max_bin_r_19_V : signal is "xilinx.com:signal:data:1.0 max_bin_r_19_V DATA";
  attribute x_interface_parameter of max_bin_r_19_V : signal is "XIL_INTERFACENAME max_bin_r_19_V, LAYERED_METADATA undef";
  attribute x_interface_info of max_bin_r_1_V : signal is "xilinx.com:signal:data:1.0 max_bin_r_1_V DATA";
  attribute x_interface_parameter of max_bin_r_1_V : signal is "XIL_INTERFACENAME max_bin_r_1_V, LAYERED_METADATA undef";
  attribute x_interface_info of max_bin_r_20_V : signal is "xilinx.com:signal:data:1.0 max_bin_r_20_V DATA";
  attribute x_interface_parameter of max_bin_r_20_V : signal is "XIL_INTERFACENAME max_bin_r_20_V, LAYERED_METADATA undef";
  attribute x_interface_info of max_bin_r_21_V : signal is "xilinx.com:signal:data:1.0 max_bin_r_21_V DATA";
  attribute x_interface_parameter of max_bin_r_21_V : signal is "XIL_INTERFACENAME max_bin_r_21_V, LAYERED_METADATA undef";
  attribute x_interface_info of max_bin_r_22_V : signal is "xilinx.com:signal:data:1.0 max_bin_r_22_V DATA";
  attribute x_interface_parameter of max_bin_r_22_V : signal is "XIL_INTERFACENAME max_bin_r_22_V, LAYERED_METADATA undef";
  attribute x_interface_info of max_bin_r_23_V : signal is "xilinx.com:signal:data:1.0 max_bin_r_23_V DATA";
  attribute x_interface_parameter of max_bin_r_23_V : signal is "XIL_INTERFACENAME max_bin_r_23_V, LAYERED_METADATA undef";
  attribute x_interface_info of max_bin_r_24_V : signal is "xilinx.com:signal:data:1.0 max_bin_r_24_V DATA";
  attribute x_interface_parameter of max_bin_r_24_V : signal is "XIL_INTERFACENAME max_bin_r_24_V, LAYERED_METADATA undef";
  attribute x_interface_info of max_bin_r_25_V : signal is "xilinx.com:signal:data:1.0 max_bin_r_25_V DATA";
  attribute x_interface_parameter of max_bin_r_25_V : signal is "XIL_INTERFACENAME max_bin_r_25_V, LAYERED_METADATA undef";
  attribute x_interface_info of max_bin_r_26_V : signal is "xilinx.com:signal:data:1.0 max_bin_r_26_V DATA";
  attribute x_interface_parameter of max_bin_r_26_V : signal is "XIL_INTERFACENAME max_bin_r_26_V, LAYERED_METADATA undef";
  attribute x_interface_info of max_bin_r_27_V : signal is "xilinx.com:signal:data:1.0 max_bin_r_27_V DATA";
  attribute x_interface_parameter of max_bin_r_27_V : signal is "XIL_INTERFACENAME max_bin_r_27_V, LAYERED_METADATA undef";
  attribute x_interface_info of max_bin_r_28_V : signal is "xilinx.com:signal:data:1.0 max_bin_r_28_V DATA";
  attribute x_interface_parameter of max_bin_r_28_V : signal is "XIL_INTERFACENAME max_bin_r_28_V, LAYERED_METADATA undef";
  attribute x_interface_info of max_bin_r_29_V : signal is "xilinx.com:signal:data:1.0 max_bin_r_29_V DATA";
  attribute x_interface_parameter of max_bin_r_29_V : signal is "XIL_INTERFACENAME max_bin_r_29_V, LAYERED_METADATA undef";
  attribute x_interface_info of max_bin_r_2_V : signal is "xilinx.com:signal:data:1.0 max_bin_r_2_V DATA";
  attribute x_interface_parameter of max_bin_r_2_V : signal is "XIL_INTERFACENAME max_bin_r_2_V, LAYERED_METADATA undef";
  attribute x_interface_info of max_bin_r_30_V : signal is "xilinx.com:signal:data:1.0 max_bin_r_30_V DATA";
  attribute x_interface_parameter of max_bin_r_30_V : signal is "XIL_INTERFACENAME max_bin_r_30_V, LAYERED_METADATA undef";
  attribute x_interface_info of max_bin_r_31_V : signal is "xilinx.com:signal:data:1.0 max_bin_r_31_V DATA";
  attribute x_interface_parameter of max_bin_r_31_V : signal is "XIL_INTERFACENAME max_bin_r_31_V, LAYERED_METADATA undef";
  attribute x_interface_info of max_bin_r_32_V : signal is "xilinx.com:signal:data:1.0 max_bin_r_32_V DATA";
  attribute x_interface_parameter of max_bin_r_32_V : signal is "XIL_INTERFACENAME max_bin_r_32_V, LAYERED_METADATA undef";
  attribute x_interface_info of max_bin_r_33_V : signal is "xilinx.com:signal:data:1.0 max_bin_r_33_V DATA";
  attribute x_interface_parameter of max_bin_r_33_V : signal is "XIL_INTERFACENAME max_bin_r_33_V, LAYERED_METADATA undef";
  attribute x_interface_info of max_bin_r_34_V : signal is "xilinx.com:signal:data:1.0 max_bin_r_34_V DATA";
  attribute x_interface_parameter of max_bin_r_34_V : signal is "XIL_INTERFACENAME max_bin_r_34_V, LAYERED_METADATA undef";
  attribute x_interface_info of max_bin_r_35_V : signal is "xilinx.com:signal:data:1.0 max_bin_r_35_V DATA";
  attribute x_interface_parameter of max_bin_r_35_V : signal is "XIL_INTERFACENAME max_bin_r_35_V, LAYERED_METADATA undef";
  attribute x_interface_info of max_bin_r_36_V : signal is "xilinx.com:signal:data:1.0 max_bin_r_36_V DATA";
  attribute x_interface_parameter of max_bin_r_36_V : signal is "XIL_INTERFACENAME max_bin_r_36_V, LAYERED_METADATA undef";
  attribute x_interface_info of max_bin_r_37_V : signal is "xilinx.com:signal:data:1.0 max_bin_r_37_V DATA";
  attribute x_interface_parameter of max_bin_r_37_V : signal is "XIL_INTERFACENAME max_bin_r_37_V, LAYERED_METADATA undef";
  attribute x_interface_info of max_bin_r_38_V : signal is "xilinx.com:signal:data:1.0 max_bin_r_38_V DATA";
  attribute x_interface_parameter of max_bin_r_38_V : signal is "XIL_INTERFACENAME max_bin_r_38_V, LAYERED_METADATA undef";
  attribute x_interface_info of max_bin_r_39_V : signal is "xilinx.com:signal:data:1.0 max_bin_r_39_V DATA";
  attribute x_interface_parameter of max_bin_r_39_V : signal is "XIL_INTERFACENAME max_bin_r_39_V, LAYERED_METADATA undef";
  attribute x_interface_info of max_bin_r_3_V : signal is "xilinx.com:signal:data:1.0 max_bin_r_3_V DATA";
  attribute x_interface_parameter of max_bin_r_3_V : signal is "XIL_INTERFACENAME max_bin_r_3_V, LAYERED_METADATA undef";
  attribute x_interface_info of max_bin_r_40_V : signal is "xilinx.com:signal:data:1.0 max_bin_r_40_V DATA";
  attribute x_interface_parameter of max_bin_r_40_V : signal is "XIL_INTERFACENAME max_bin_r_40_V, LAYERED_METADATA undef";
  attribute x_interface_info of max_bin_r_41_V : signal is "xilinx.com:signal:data:1.0 max_bin_r_41_V DATA";
  attribute x_interface_parameter of max_bin_r_41_V : signal is "XIL_INTERFACENAME max_bin_r_41_V, LAYERED_METADATA undef";
  attribute x_interface_info of max_bin_r_42_V : signal is "xilinx.com:signal:data:1.0 max_bin_r_42_V DATA";
  attribute x_interface_parameter of max_bin_r_42_V : signal is "XIL_INTERFACENAME max_bin_r_42_V, LAYERED_METADATA undef";
  attribute x_interface_info of max_bin_r_43_V : signal is "xilinx.com:signal:data:1.0 max_bin_r_43_V DATA";
  attribute x_interface_parameter of max_bin_r_43_V : signal is "XIL_INTERFACENAME max_bin_r_43_V, LAYERED_METADATA undef";
  attribute x_interface_info of max_bin_r_44_V : signal is "xilinx.com:signal:data:1.0 max_bin_r_44_V DATA";
  attribute x_interface_parameter of max_bin_r_44_V : signal is "XIL_INTERFACENAME max_bin_r_44_V, LAYERED_METADATA undef";
  attribute x_interface_info of max_bin_r_45_V : signal is "xilinx.com:signal:data:1.0 max_bin_r_45_V DATA";
  attribute x_interface_parameter of max_bin_r_45_V : signal is "XIL_INTERFACENAME max_bin_r_45_V, LAYERED_METADATA undef";
  attribute x_interface_info of max_bin_r_46_V : signal is "xilinx.com:signal:data:1.0 max_bin_r_46_V DATA";
  attribute x_interface_parameter of max_bin_r_46_V : signal is "XIL_INTERFACENAME max_bin_r_46_V, LAYERED_METADATA undef";
  attribute x_interface_info of max_bin_r_47_V : signal is "xilinx.com:signal:data:1.0 max_bin_r_47_V DATA";
  attribute x_interface_parameter of max_bin_r_47_V : signal is "XIL_INTERFACENAME max_bin_r_47_V, LAYERED_METADATA undef";
  attribute x_interface_info of max_bin_r_48_V : signal is "xilinx.com:signal:data:1.0 max_bin_r_48_V DATA";
  attribute x_interface_parameter of max_bin_r_48_V : signal is "XIL_INTERFACENAME max_bin_r_48_V, LAYERED_METADATA undef";
  attribute x_interface_info of max_bin_r_49_V : signal is "xilinx.com:signal:data:1.0 max_bin_r_49_V DATA";
  attribute x_interface_parameter of max_bin_r_49_V : signal is "XIL_INTERFACENAME max_bin_r_49_V, LAYERED_METADATA undef";
  attribute x_interface_info of max_bin_r_4_V : signal is "xilinx.com:signal:data:1.0 max_bin_r_4_V DATA";
  attribute x_interface_parameter of max_bin_r_4_V : signal is "XIL_INTERFACENAME max_bin_r_4_V, LAYERED_METADATA undef";
  attribute x_interface_info of max_bin_r_50_V : signal is "xilinx.com:signal:data:1.0 max_bin_r_50_V DATA";
  attribute x_interface_parameter of max_bin_r_50_V : signal is "XIL_INTERFACENAME max_bin_r_50_V, LAYERED_METADATA undef";
  attribute x_interface_info of max_bin_r_51_V : signal is "xilinx.com:signal:data:1.0 max_bin_r_51_V DATA";
  attribute x_interface_parameter of max_bin_r_51_V : signal is "XIL_INTERFACENAME max_bin_r_51_V, LAYERED_METADATA undef";
  attribute x_interface_info of max_bin_r_52_V : signal is "xilinx.com:signal:data:1.0 max_bin_r_52_V DATA";
  attribute x_interface_parameter of max_bin_r_52_V : signal is "XIL_INTERFACENAME max_bin_r_52_V, LAYERED_METADATA undef";
  attribute x_interface_info of max_bin_r_53_V : signal is "xilinx.com:signal:data:1.0 max_bin_r_53_V DATA";
  attribute x_interface_parameter of max_bin_r_53_V : signal is "XIL_INTERFACENAME max_bin_r_53_V, LAYERED_METADATA undef";
  attribute x_interface_info of max_bin_r_54_V : signal is "xilinx.com:signal:data:1.0 max_bin_r_54_V DATA";
  attribute x_interface_parameter of max_bin_r_54_V : signal is "XIL_INTERFACENAME max_bin_r_54_V, LAYERED_METADATA undef";
  attribute x_interface_info of max_bin_r_55_V : signal is "xilinx.com:signal:data:1.0 max_bin_r_55_V DATA";
  attribute x_interface_parameter of max_bin_r_55_V : signal is "XIL_INTERFACENAME max_bin_r_55_V, LAYERED_METADATA undef";
  attribute x_interface_info of max_bin_r_56_V : signal is "xilinx.com:signal:data:1.0 max_bin_r_56_V DATA";
  attribute x_interface_parameter of max_bin_r_56_V : signal is "XIL_INTERFACENAME max_bin_r_56_V, LAYERED_METADATA undef";
  attribute x_interface_info of max_bin_r_57_V : signal is "xilinx.com:signal:data:1.0 max_bin_r_57_V DATA";
  attribute x_interface_parameter of max_bin_r_57_V : signal is "XIL_INTERFACENAME max_bin_r_57_V, LAYERED_METADATA undef";
  attribute x_interface_info of max_bin_r_58_V : signal is "xilinx.com:signal:data:1.0 max_bin_r_58_V DATA";
  attribute x_interface_parameter of max_bin_r_58_V : signal is "XIL_INTERFACENAME max_bin_r_58_V, LAYERED_METADATA undef";
  attribute x_interface_info of max_bin_r_59_V : signal is "xilinx.com:signal:data:1.0 max_bin_r_59_V DATA";
  attribute x_interface_parameter of max_bin_r_59_V : signal is "XIL_INTERFACENAME max_bin_r_59_V, LAYERED_METADATA undef";
  attribute x_interface_info of max_bin_r_5_V : signal is "xilinx.com:signal:data:1.0 max_bin_r_5_V DATA";
  attribute x_interface_parameter of max_bin_r_5_V : signal is "XIL_INTERFACENAME max_bin_r_5_V, LAYERED_METADATA undef";
  attribute x_interface_info of max_bin_r_60_V : signal is "xilinx.com:signal:data:1.0 max_bin_r_60_V DATA";
  attribute x_interface_parameter of max_bin_r_60_V : signal is "XIL_INTERFACENAME max_bin_r_60_V, LAYERED_METADATA undef";
  attribute x_interface_info of max_bin_r_61_V : signal is "xilinx.com:signal:data:1.0 max_bin_r_61_V DATA";
  attribute x_interface_parameter of max_bin_r_61_V : signal is "XIL_INTERFACENAME max_bin_r_61_V, LAYERED_METADATA undef";
  attribute x_interface_info of max_bin_r_62_V : signal is "xilinx.com:signal:data:1.0 max_bin_r_62_V DATA";
  attribute x_interface_parameter of max_bin_r_62_V : signal is "XIL_INTERFACENAME max_bin_r_62_V, LAYERED_METADATA undef";
  attribute x_interface_info of max_bin_r_63_V : signal is "xilinx.com:signal:data:1.0 max_bin_r_63_V DATA";
  attribute x_interface_parameter of max_bin_r_63_V : signal is "XIL_INTERFACENAME max_bin_r_63_V, LAYERED_METADATA undef";
  attribute x_interface_info of max_bin_r_6_V : signal is "xilinx.com:signal:data:1.0 max_bin_r_6_V DATA";
  attribute x_interface_parameter of max_bin_r_6_V : signal is "XIL_INTERFACENAME max_bin_r_6_V, LAYERED_METADATA undef";
  attribute x_interface_info of max_bin_r_7_V : signal is "xilinx.com:signal:data:1.0 max_bin_r_7_V DATA";
  attribute x_interface_parameter of max_bin_r_7_V : signal is "XIL_INTERFACENAME max_bin_r_7_V, LAYERED_METADATA undef";
  attribute x_interface_info of max_bin_r_8_V : signal is "xilinx.com:signal:data:1.0 max_bin_r_8_V DATA";
  attribute x_interface_parameter of max_bin_r_8_V : signal is "XIL_INTERFACENAME max_bin_r_8_V, LAYERED_METADATA undef";
  attribute x_interface_info of max_bin_r_9_V : signal is "xilinx.com:signal:data:1.0 max_bin_r_9_V DATA";
  attribute x_interface_parameter of max_bin_r_9_V : signal is "XIL_INTERFACENAME max_bin_r_9_V, LAYERED_METADATA undef";
  attribute x_interface_info of res_max_bin_count_V : signal is "xilinx.com:signal:data:1.0 res_max_bin_count_V DATA";
  attribute x_interface_parameter of res_max_bin_count_V : signal is "XIL_INTERFACENAME res_max_bin_count_V, LAYERED_METADATA undef";
  attribute x_interface_info of res_max_bin_r_V : signal is "xilinx.com:signal:data:1.0 res_max_bin_r_V DATA";
  attribute x_interface_parameter of res_max_bin_r_V : signal is "XIL_INTERFACENAME res_max_bin_r_V, LAYERED_METADATA undef";
  attribute x_interface_info of res_max_bin_theta_V : signal is "xilinx.com:signal:data:1.0 res_max_bin_theta_V DATA";
  attribute x_interface_parameter of res_max_bin_theta_V : signal is "XIL_INTERFACENAME res_max_bin_theta_V, LAYERED_METADATA undef";
  attribute x_interface_info of roi_seed_r_V : signal is "xilinx.com:signal:data:1.0 roi_seed_r_V DATA";
  attribute x_interface_parameter of roi_seed_r_V : signal is "XIL_INTERFACENAME roi_seed_r_V, LAYERED_METADATA undef";
  attribute x_interface_info of slcvec_angle_polar_offset_mrad_V : signal is "xilinx.com:signal:data:1.0 slcvec_angle_polar_offset_mrad_V DATA";
  attribute x_interface_parameter of slcvec_angle_polar_offset_mrad_V : signal is "XIL_INTERFACENAME slcvec_angle_polar_offset_mrad_V, LAYERED_METADATA undef";
begin
U0: entity work.hls_find_max_bin_find_max_bin
     port map (
      ap_clk => ap_clk,
      ap_done => ap_done,
      ap_idle => ap_idle,
      ap_ready => ap_ready,
      ap_rst => ap_rst,
      ap_start => ap_start,
      hls_LT_r_V(21 downto 0) => hls_LT_r_V(21 downto 0),
      hls_LT_r_V_ap_vld => hls_LT_r_V_ap_vld,
      hls_LT_r_global_V(21 downto 0) => hls_LT_r_global_V(21 downto 0),
      hls_LT_r_global_V_ap_vld => hls_LT_r_global_V_ap_vld,
      hls_LT_theta_V(13 downto 0) => hls_LT_theta_V(13 downto 0),
      hls_LT_theta_V_ap_vld => hls_LT_theta_V_ap_vld,
      hls_LT_theta_global_V(13 downto 0) => hls_LT_theta_global_V(13 downto 0),
      hls_LT_theta_global_V_ap_vld => hls_LT_theta_global_V_ap_vld,
      max_bin_count_0_V(3 downto 0) => max_bin_count_0_V(3 downto 0),
      max_bin_count_10_V(3 downto 0) => max_bin_count_10_V(3 downto 0),
      max_bin_count_11_V(3 downto 0) => max_bin_count_11_V(3 downto 0),
      max_bin_count_12_V(3 downto 0) => max_bin_count_12_V(3 downto 0),
      max_bin_count_13_V(3 downto 0) => max_bin_count_13_V(3 downto 0),
      max_bin_count_14_V(3 downto 0) => max_bin_count_14_V(3 downto 0),
      max_bin_count_15_V(3 downto 0) => max_bin_count_15_V(3 downto 0),
      max_bin_count_16_V(3 downto 0) => max_bin_count_16_V(3 downto 0),
      max_bin_count_17_V(3 downto 0) => max_bin_count_17_V(3 downto 0),
      max_bin_count_18_V(3 downto 0) => max_bin_count_18_V(3 downto 0),
      max_bin_count_19_V(3 downto 0) => max_bin_count_19_V(3 downto 0),
      max_bin_count_1_V(3 downto 0) => max_bin_count_1_V(3 downto 0),
      max_bin_count_20_V(3 downto 0) => max_bin_count_20_V(3 downto 0),
      max_bin_count_21_V(3 downto 0) => max_bin_count_21_V(3 downto 0),
      max_bin_count_22_V(3 downto 0) => max_bin_count_22_V(3 downto 0),
      max_bin_count_23_V(3 downto 0) => max_bin_count_23_V(3 downto 0),
      max_bin_count_24_V(3 downto 0) => max_bin_count_24_V(3 downto 0),
      max_bin_count_25_V(3 downto 0) => max_bin_count_25_V(3 downto 0),
      max_bin_count_26_V(3 downto 0) => max_bin_count_26_V(3 downto 0),
      max_bin_count_27_V(3 downto 0) => max_bin_count_27_V(3 downto 0),
      max_bin_count_28_V(3 downto 0) => max_bin_count_28_V(3 downto 0),
      max_bin_count_29_V(3 downto 0) => max_bin_count_29_V(3 downto 0),
      max_bin_count_2_V(3 downto 0) => max_bin_count_2_V(3 downto 0),
      max_bin_count_30_V(3 downto 0) => max_bin_count_30_V(3 downto 0),
      max_bin_count_31_V(3 downto 0) => max_bin_count_31_V(3 downto 0),
      max_bin_count_32_V(3 downto 0) => max_bin_count_32_V(3 downto 0),
      max_bin_count_33_V(3 downto 0) => max_bin_count_33_V(3 downto 0),
      max_bin_count_34_V(3 downto 0) => max_bin_count_34_V(3 downto 0),
      max_bin_count_35_V(3 downto 0) => max_bin_count_35_V(3 downto 0),
      max_bin_count_36_V(3 downto 0) => max_bin_count_36_V(3 downto 0),
      max_bin_count_37_V(3 downto 0) => max_bin_count_37_V(3 downto 0),
      max_bin_count_38_V(3 downto 0) => max_bin_count_38_V(3 downto 0),
      max_bin_count_39_V(3 downto 0) => max_bin_count_39_V(3 downto 0),
      max_bin_count_3_V(3 downto 0) => max_bin_count_3_V(3 downto 0),
      max_bin_count_40_V(3 downto 0) => max_bin_count_40_V(3 downto 0),
      max_bin_count_41_V(3 downto 0) => max_bin_count_41_V(3 downto 0),
      max_bin_count_42_V(3 downto 0) => max_bin_count_42_V(3 downto 0),
      max_bin_count_43_V(3 downto 0) => max_bin_count_43_V(3 downto 0),
      max_bin_count_44_V(3 downto 0) => max_bin_count_44_V(3 downto 0),
      max_bin_count_45_V(3 downto 0) => max_bin_count_45_V(3 downto 0),
      max_bin_count_46_V(3 downto 0) => max_bin_count_46_V(3 downto 0),
      max_bin_count_47_V(3 downto 0) => max_bin_count_47_V(3 downto 0),
      max_bin_count_48_V(3 downto 0) => max_bin_count_48_V(3 downto 0),
      max_bin_count_49_V(3 downto 0) => max_bin_count_49_V(3 downto 0),
      max_bin_count_4_V(3 downto 0) => max_bin_count_4_V(3 downto 0),
      max_bin_count_50_V(3 downto 0) => max_bin_count_50_V(3 downto 0),
      max_bin_count_51_V(3 downto 0) => max_bin_count_51_V(3 downto 0),
      max_bin_count_52_V(3 downto 0) => max_bin_count_52_V(3 downto 0),
      max_bin_count_53_V(3 downto 0) => max_bin_count_53_V(3 downto 0),
      max_bin_count_54_V(3 downto 0) => max_bin_count_54_V(3 downto 0),
      max_bin_count_55_V(3 downto 0) => max_bin_count_55_V(3 downto 0),
      max_bin_count_56_V(3 downto 0) => max_bin_count_56_V(3 downto 0),
      max_bin_count_57_V(3 downto 0) => max_bin_count_57_V(3 downto 0),
      max_bin_count_58_V(3 downto 0) => max_bin_count_58_V(3 downto 0),
      max_bin_count_59_V(3 downto 0) => max_bin_count_59_V(3 downto 0),
      max_bin_count_5_V(3 downto 0) => max_bin_count_5_V(3 downto 0),
      max_bin_count_60_V(3 downto 0) => max_bin_count_60_V(3 downto 0),
      max_bin_count_61_V(3 downto 0) => max_bin_count_61_V(3 downto 0),
      max_bin_count_62_V(3 downto 0) => max_bin_count_62_V(3 downto 0),
      max_bin_count_63_V(3 downto 0) => max_bin_count_63_V(3 downto 0),
      max_bin_count_6_V(3 downto 0) => max_bin_count_6_V(3 downto 0),
      max_bin_count_7_V(3 downto 0) => max_bin_count_7_V(3 downto 0),
      max_bin_count_8_V(3 downto 0) => max_bin_count_8_V(3 downto 0),
      max_bin_count_9_V(3 downto 0) => max_bin_count_9_V(3 downto 0),
      max_bin_r_0_V(6 downto 0) => max_bin_r_0_V(6 downto 0),
      max_bin_r_10_V(6 downto 0) => max_bin_r_10_V(6 downto 0),
      max_bin_r_11_V(6 downto 0) => max_bin_r_11_V(6 downto 0),
      max_bin_r_12_V(6 downto 0) => max_bin_r_12_V(6 downto 0),
      max_bin_r_13_V(6 downto 0) => max_bin_r_13_V(6 downto 0),
      max_bin_r_14_V(6 downto 0) => max_bin_r_14_V(6 downto 0),
      max_bin_r_15_V(6 downto 0) => max_bin_r_15_V(6 downto 0),
      max_bin_r_16_V(6 downto 0) => max_bin_r_16_V(6 downto 0),
      max_bin_r_17_V(6 downto 0) => max_bin_r_17_V(6 downto 0),
      max_bin_r_18_V(6 downto 0) => max_bin_r_18_V(6 downto 0),
      max_bin_r_19_V(6 downto 0) => max_bin_r_19_V(6 downto 0),
      max_bin_r_1_V(6 downto 0) => max_bin_r_1_V(6 downto 0),
      max_bin_r_20_V(6 downto 0) => max_bin_r_20_V(6 downto 0),
      max_bin_r_21_V(6 downto 0) => max_bin_r_21_V(6 downto 0),
      max_bin_r_22_V(6 downto 0) => max_bin_r_22_V(6 downto 0),
      max_bin_r_23_V(6 downto 0) => max_bin_r_23_V(6 downto 0),
      max_bin_r_24_V(6 downto 0) => max_bin_r_24_V(6 downto 0),
      max_bin_r_25_V(6 downto 0) => max_bin_r_25_V(6 downto 0),
      max_bin_r_26_V(6 downto 0) => max_bin_r_26_V(6 downto 0),
      max_bin_r_27_V(6 downto 0) => max_bin_r_27_V(6 downto 0),
      max_bin_r_28_V(6 downto 0) => max_bin_r_28_V(6 downto 0),
      max_bin_r_29_V(6 downto 0) => max_bin_r_29_V(6 downto 0),
      max_bin_r_2_V(6 downto 0) => max_bin_r_2_V(6 downto 0),
      max_bin_r_30_V(6 downto 0) => max_bin_r_30_V(6 downto 0),
      max_bin_r_31_V(6 downto 0) => max_bin_r_31_V(6 downto 0),
      max_bin_r_32_V(6 downto 0) => max_bin_r_32_V(6 downto 0),
      max_bin_r_33_V(6 downto 0) => max_bin_r_33_V(6 downto 0),
      max_bin_r_34_V(6 downto 0) => max_bin_r_34_V(6 downto 0),
      max_bin_r_35_V(6 downto 0) => max_bin_r_35_V(6 downto 0),
      max_bin_r_36_V(6 downto 0) => max_bin_r_36_V(6 downto 0),
      max_bin_r_37_V(6 downto 0) => max_bin_r_37_V(6 downto 0),
      max_bin_r_38_V(6 downto 0) => max_bin_r_38_V(6 downto 0),
      max_bin_r_39_V(6 downto 0) => max_bin_r_39_V(6 downto 0),
      max_bin_r_3_V(6 downto 0) => max_bin_r_3_V(6 downto 0),
      max_bin_r_40_V(6 downto 0) => max_bin_r_40_V(6 downto 0),
      max_bin_r_41_V(6 downto 0) => max_bin_r_41_V(6 downto 0),
      max_bin_r_42_V(6 downto 0) => max_bin_r_42_V(6 downto 0),
      max_bin_r_43_V(6 downto 0) => max_bin_r_43_V(6 downto 0),
      max_bin_r_44_V(6 downto 0) => max_bin_r_44_V(6 downto 0),
      max_bin_r_45_V(6 downto 0) => max_bin_r_45_V(6 downto 0),
      max_bin_r_46_V(6 downto 0) => max_bin_r_46_V(6 downto 0),
      max_bin_r_47_V(6 downto 0) => max_bin_r_47_V(6 downto 0),
      max_bin_r_48_V(6 downto 0) => max_bin_r_48_V(6 downto 0),
      max_bin_r_49_V(6 downto 0) => max_bin_r_49_V(6 downto 0),
      max_bin_r_4_V(6 downto 0) => max_bin_r_4_V(6 downto 0),
      max_bin_r_50_V(6 downto 0) => max_bin_r_50_V(6 downto 0),
      max_bin_r_51_V(6 downto 0) => max_bin_r_51_V(6 downto 0),
      max_bin_r_52_V(6 downto 0) => max_bin_r_52_V(6 downto 0),
      max_bin_r_53_V(6 downto 0) => max_bin_r_53_V(6 downto 0),
      max_bin_r_54_V(6 downto 0) => max_bin_r_54_V(6 downto 0),
      max_bin_r_55_V(6 downto 0) => max_bin_r_55_V(6 downto 0),
      max_bin_r_56_V(6 downto 0) => max_bin_r_56_V(6 downto 0),
      max_bin_r_57_V(6 downto 0) => max_bin_r_57_V(6 downto 0),
      max_bin_r_58_V(6 downto 0) => max_bin_r_58_V(6 downto 0),
      max_bin_r_59_V(6 downto 0) => max_bin_r_59_V(6 downto 0),
      max_bin_r_5_V(6 downto 0) => max_bin_r_5_V(6 downto 0),
      max_bin_r_60_V(6 downto 0) => max_bin_r_60_V(6 downto 0),
      max_bin_r_61_V(6 downto 0) => max_bin_r_61_V(6 downto 0),
      max_bin_r_62_V(6 downto 0) => max_bin_r_62_V(6 downto 0),
      max_bin_r_63_V(6 downto 0) => max_bin_r_63_V(6 downto 0),
      max_bin_r_6_V(6 downto 0) => max_bin_r_6_V(6 downto 0),
      max_bin_r_7_V(6 downto 0) => max_bin_r_7_V(6 downto 0),
      max_bin_r_8_V(6 downto 0) => max_bin_r_8_V(6 downto 0),
      max_bin_r_9_V(6 downto 0) => max_bin_r_9_V(6 downto 0),
      res_max_bin_count_V(3 downto 0) => res_max_bin_count_V(3 downto 0),
      res_max_bin_count_V_ap_vld => res_max_bin_count_V_ap_vld,
      res_max_bin_r_V(6 downto 0) => res_max_bin_r_V(6 downto 0),
      res_max_bin_r_V_ap_vld => res_max_bin_r_V_ap_vld,
      res_max_bin_theta_V(6 downto 0) => res_max_bin_theta_V(6 downto 0),
      res_max_bin_theta_V_ap_vld => res_max_bin_theta_V_ap_vld,
      roi_seed_r_V(21 downto 0) => roi_seed_r_V(21 downto 0),
      slcvec_angle_polar_offset_mrad_V(13 downto 0) => slcvec_angle_polar_offset_mrad_V(13 downto 0)
    );
end STRUCTURE;

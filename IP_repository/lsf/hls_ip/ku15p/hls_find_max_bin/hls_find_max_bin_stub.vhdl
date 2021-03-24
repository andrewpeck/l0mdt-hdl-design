-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2019.2.1 (lin64) Build 2729669 Thu Dec  5 04:48:12 MST 2019
-- Date        : Sat Mar 20 09:19:39 2021
-- Host        : uciatlaslab.ps.uci.edu running 64-bit CentOS Linux release 7.9.2009 (Core)
-- Command     : write_vhdl -force -mode synth_stub
--               /home/psundara/L0MDT/psundara/l0mdt-hdl-design/UserLogic/lsf/IP/ku15p/hls_find_max_bin/hls_find_max_bin_stub.vhdl
-- Design      : hls_find_max_bin
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xcku15p-ffva1760-2-e
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity hls_find_max_bin is
  Port (
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

end hls_find_max_bin;

architecture stub of hls_find_max_bin is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "hls_LT_theta_global_V_ap_vld,hls_LT_r_global_V_ap_vld,hls_LT_theta_V_ap_vld,hls_LT_r_V_ap_vld,res_max_bin_count_V_ap_vld,res_max_bin_theta_V_ap_vld,res_max_bin_r_V_ap_vld,ap_clk,ap_rst,ap_start,ap_done,ap_idle,ap_ready,slcvec_angle_polar_offset_mrad_V[13:0],roi_seed_r_V[21:0],max_bin_count_0_V[3:0],max_bin_count_1_V[3:0],max_bin_count_2_V[3:0],max_bin_count_3_V[3:0],max_bin_count_4_V[3:0],max_bin_count_5_V[3:0],max_bin_count_6_V[3:0],max_bin_count_7_V[3:0],max_bin_count_8_V[3:0],max_bin_count_9_V[3:0],max_bin_count_10_V[3:0],max_bin_count_11_V[3:0],max_bin_count_12_V[3:0],max_bin_count_13_V[3:0],max_bin_count_14_V[3:0],max_bin_count_15_V[3:0],max_bin_count_16_V[3:0],max_bin_count_17_V[3:0],max_bin_count_18_V[3:0],max_bin_count_19_V[3:0],max_bin_count_20_V[3:0],max_bin_count_21_V[3:0],max_bin_count_22_V[3:0],max_bin_count_23_V[3:0],max_bin_count_24_V[3:0],max_bin_count_25_V[3:0],max_bin_count_26_V[3:0],max_bin_count_27_V[3:0],max_bin_count_28_V[3:0],max_bin_count_29_V[3:0],max_bin_count_30_V[3:0],max_bin_count_31_V[3:0],max_bin_count_32_V[3:0],max_bin_count_33_V[3:0],max_bin_count_34_V[3:0],max_bin_count_35_V[3:0],max_bin_count_36_V[3:0],max_bin_count_37_V[3:0],max_bin_count_38_V[3:0],max_bin_count_39_V[3:0],max_bin_count_40_V[3:0],max_bin_count_41_V[3:0],max_bin_count_42_V[3:0],max_bin_count_43_V[3:0],max_bin_count_44_V[3:0],max_bin_count_45_V[3:0],max_bin_count_46_V[3:0],max_bin_count_47_V[3:0],max_bin_count_48_V[3:0],max_bin_count_49_V[3:0],max_bin_count_50_V[3:0],max_bin_count_51_V[3:0],max_bin_count_52_V[3:0],max_bin_count_53_V[3:0],max_bin_count_54_V[3:0],max_bin_count_55_V[3:0],max_bin_count_56_V[3:0],max_bin_count_57_V[3:0],max_bin_count_58_V[3:0],max_bin_count_59_V[3:0],max_bin_count_60_V[3:0],max_bin_count_61_V[3:0],max_bin_count_62_V[3:0],max_bin_count_63_V[3:0],max_bin_r_0_V[6:0],max_bin_r_1_V[6:0],max_bin_r_2_V[6:0],max_bin_r_3_V[6:0],max_bin_r_4_V[6:0],max_bin_r_5_V[6:0],max_bin_r_6_V[6:0],max_bin_r_7_V[6:0],max_bin_r_8_V[6:0],max_bin_r_9_V[6:0],max_bin_r_10_V[6:0],max_bin_r_11_V[6:0],max_bin_r_12_V[6:0],max_bin_r_13_V[6:0],max_bin_r_14_V[6:0],max_bin_r_15_V[6:0],max_bin_r_16_V[6:0],max_bin_r_17_V[6:0],max_bin_r_18_V[6:0],max_bin_r_19_V[6:0],max_bin_r_20_V[6:0],max_bin_r_21_V[6:0],max_bin_r_22_V[6:0],max_bin_r_23_V[6:0],max_bin_r_24_V[6:0],max_bin_r_25_V[6:0],max_bin_r_26_V[6:0],max_bin_r_27_V[6:0],max_bin_r_28_V[6:0],max_bin_r_29_V[6:0],max_bin_r_30_V[6:0],max_bin_r_31_V[6:0],max_bin_r_32_V[6:0],max_bin_r_33_V[6:0],max_bin_r_34_V[6:0],max_bin_r_35_V[6:0],max_bin_r_36_V[6:0],max_bin_r_37_V[6:0],max_bin_r_38_V[6:0],max_bin_r_39_V[6:0],max_bin_r_40_V[6:0],max_bin_r_41_V[6:0],max_bin_r_42_V[6:0],max_bin_r_43_V[6:0],max_bin_r_44_V[6:0],max_bin_r_45_V[6:0],max_bin_r_46_V[6:0],max_bin_r_47_V[6:0],max_bin_r_48_V[6:0],max_bin_r_49_V[6:0],max_bin_r_50_V[6:0],max_bin_r_51_V[6:0],max_bin_r_52_V[6:0],max_bin_r_53_V[6:0],max_bin_r_54_V[6:0],max_bin_r_55_V[6:0],max_bin_r_56_V[6:0],max_bin_r_57_V[6:0],max_bin_r_58_V[6:0],max_bin_r_59_V[6:0],max_bin_r_60_V[6:0],max_bin_r_61_V[6:0],max_bin_r_62_V[6:0],max_bin_r_63_V[6:0],hls_LT_theta_global_V[13:0],hls_LT_r_global_V[21:0],hls_LT_theta_V[13:0],hls_LT_r_V[21:0],res_max_bin_count_V[3:0],res_max_bin_theta_V[6:0],res_max_bin_r_V[6:0]";
attribute x_core_info : string;
attribute x_core_info of stub : architecture is "find_max_bin,Vivado 2019.2.1";
begin
end;

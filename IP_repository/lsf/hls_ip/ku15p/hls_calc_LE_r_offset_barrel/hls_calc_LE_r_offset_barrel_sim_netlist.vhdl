-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2019.2.1 (lin64) Build 2729669 Thu Dec  5 04:48:12 MST 2019
-- Date        : Sat Mar 20 09:28:30 2021
-- Host        : uciatlaslab.ps.uci.edu running 64-bit CentOS Linux release 7.9.2009 (Core)
-- Command     : write_vhdl -force -mode funcsim
--               /home/psundara/L0MDT/psundara/l0mdt-hdl-design/UserLogic/lsf/IP/ku15p/hls_calc_LE_r_offset_barrel/hls_calc_LE_r_offset_barrel_sim_netlist.vhdl
-- Design      : hls_calc_LE_r_offset_barrel
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xcku15p-ffva1760-2-e
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity hls_calc_LE_r_offset_barrel_calc_LE_r_offset_barrel is
  port (
    ap_clk : in STD_LOGIC;
    ap_rst : in STD_LOGIC;
    ap_start : in STD_LOGIC;
    ap_done : out STD_LOGIC;
    ap_idle : out STD_LOGIC;
    ap_ready : out STD_LOGIC;
    hw_sin_val_V : in STD_LOGIC_VECTOR ( 17 downto 0 );
    hw_cos_val_V : in STD_LOGIC_VECTOR ( 17 downto 0 );
    roi_seed_r_V : out STD_LOGIC_VECTOR ( 21 downto 0 );
    hewindow_pos_ref_V : in STD_LOGIC_VECTOR ( 17 downto 0 );
    hewindow_pos_V : in STD_LOGIC_VECTOR ( 13 downto 0 );
    slcvec_pos_V : in STD_LOGIC_VECTOR ( 13 downto 0 );
    slcvec_pos_ref_V : in STD_LOGIC_VECTOR ( 17 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of hls_calc_LE_r_offset_barrel_calc_LE_r_offset_barrel : entity is "calc_LE_r_offset_barrel";
end hls_calc_LE_r_offset_barrel_calc_LE_r_offset_barrel;

architecture STRUCTURE of hls_calc_LE_r_offset_barrel_calc_LE_r_offset_barrel is
  signal RESIZE0 : STD_LOGIC;
  signal \^ap_done\ : STD_LOGIC;
  signal ap_enable_reg_pp0_iter1 : STD_LOGIC;
  signal ap_enable_reg_pp0_iter2 : STD_LOGIC;
  signal ap_enable_reg_pp0_iter3 : STD_LOGIC;
  signal ap_enable_reg_pp0_iter4 : STD_LOGIC;
  signal ap_enable_reg_pp0_iter5 : STD_LOGIC;
  signal ap_enable_reg_pp0_iter6 : STD_LOGIC;
  signal ap_idle_INST_0_i_1_n_0 : STD_LOGIC;
  signal \^ap_start\ : STD_LOGIC;
  signal hewindow_pos_V_0_data_reg : STD_LOGIC_VECTOR ( 9 downto 0 );
  signal hewindow_pos_ref_V_0_data_reg : STD_LOGIC_VECTOR ( 12 downto 0 );
  signal hw_cos_val_V_0_data_reg : STD_LOGIC_VECTOR ( 17 downto 0 );
  signal hw_cos_val_V_read_reg_208 : STD_LOGIC_VECTOR ( 17 downto 0 );
  signal hw_sin_val_V_0_data_reg : STD_LOGIC_VECTOR ( 17 downto 0 );
  signal r_V_4_reg_248_reg_i_10_n_0 : STD_LOGIC;
  signal r_V_4_reg_248_reg_i_11_n_0 : STD_LOGIC;
  signal r_V_4_reg_248_reg_i_12_n_0 : STD_LOGIC;
  signal r_V_4_reg_248_reg_i_13_n_0 : STD_LOGIC;
  signal r_V_4_reg_248_reg_i_14_n_0 : STD_LOGIC;
  signal r_V_4_reg_248_reg_i_15_n_0 : STD_LOGIC;
  signal r_V_4_reg_248_reg_i_1_n_4 : STD_LOGIC;
  signal r_V_4_reg_248_reg_i_1_n_5 : STD_LOGIC;
  signal r_V_4_reg_248_reg_i_1_n_6 : STD_LOGIC;
  signal r_V_4_reg_248_reg_i_1_n_7 : STD_LOGIC;
  signal r_V_4_reg_248_reg_i_2_n_0 : STD_LOGIC;
  signal r_V_4_reg_248_reg_i_2_n_1 : STD_LOGIC;
  signal r_V_4_reg_248_reg_i_2_n_2 : STD_LOGIC;
  signal r_V_4_reg_248_reg_i_2_n_3 : STD_LOGIC;
  signal r_V_4_reg_248_reg_i_2_n_4 : STD_LOGIC;
  signal r_V_4_reg_248_reg_i_2_n_5 : STD_LOGIC;
  signal r_V_4_reg_248_reg_i_2_n_6 : STD_LOGIC;
  signal r_V_4_reg_248_reg_i_2_n_7 : STD_LOGIC;
  signal r_V_4_reg_248_reg_i_3_n_0 : STD_LOGIC;
  signal r_V_4_reg_248_reg_i_4_n_0 : STD_LOGIC;
  signal r_V_4_reg_248_reg_i_5_n_0 : STD_LOGIC;
  signal r_V_4_reg_248_reg_i_6_n_0 : STD_LOGIC;
  signal r_V_4_reg_248_reg_i_7_n_0 : STD_LOGIC;
  signal r_V_4_reg_248_reg_i_8_n_0 : STD_LOGIC;
  signal r_V_4_reg_248_reg_i_9_n_0 : STD_LOGIC;
  signal r_V_4_reg_248_reg_n_106 : STD_LOGIC;
  signal r_V_4_reg_248_reg_n_107 : STD_LOGIC;
  signal r_V_4_reg_248_reg_n_108 : STD_LOGIC;
  signal r_V_4_reg_248_reg_n_109 : STD_LOGIC;
  signal r_V_4_reg_248_reg_n_110 : STD_LOGIC;
  signal r_V_4_reg_248_reg_n_111 : STD_LOGIC;
  signal r_V_4_reg_248_reg_n_112 : STD_LOGIC;
  signal r_V_4_reg_248_reg_n_113 : STD_LOGIC;
  signal r_V_4_reg_248_reg_n_114 : STD_LOGIC;
  signal r_V_4_reg_248_reg_n_115 : STD_LOGIC;
  signal r_V_4_reg_248_reg_n_116 : STD_LOGIC;
  signal r_V_4_reg_248_reg_n_117 : STD_LOGIC;
  signal r_V_4_reg_248_reg_n_118 : STD_LOGIC;
  signal r_V_4_reg_248_reg_n_119 : STD_LOGIC;
  signal r_V_4_reg_248_reg_n_120 : STD_LOGIC;
  signal r_V_4_reg_248_reg_n_121 : STD_LOGIC;
  signal r_V_4_reg_248_reg_n_122 : STD_LOGIC;
  signal r_V_4_reg_248_reg_n_123 : STD_LOGIC;
  signal r_V_4_reg_248_reg_n_124 : STD_LOGIC;
  signal r_V_4_reg_248_reg_n_125 : STD_LOGIC;
  signal r_V_4_reg_248_reg_n_126 : STD_LOGIC;
  signal r_V_4_reg_248_reg_n_127 : STD_LOGIC;
  signal r_V_4_reg_248_reg_n_128 : STD_LOGIC;
  signal r_V_4_reg_248_reg_n_129 : STD_LOGIC;
  signal r_V_4_reg_248_reg_n_130 : STD_LOGIC;
  signal r_V_4_reg_248_reg_n_131 : STD_LOGIC;
  signal r_V_4_reg_248_reg_n_132 : STD_LOGIC;
  signal r_V_4_reg_248_reg_n_133 : STD_LOGIC;
  signal r_V_4_reg_248_reg_n_134 : STD_LOGIC;
  signal r_V_4_reg_248_reg_n_135 : STD_LOGIC;
  signal r_V_4_reg_248_reg_n_136 : STD_LOGIC;
  signal r_V_4_reg_248_reg_n_137 : STD_LOGIC;
  signal r_V_4_reg_248_reg_n_138 : STD_LOGIC;
  signal r_V_4_reg_248_reg_n_139 : STD_LOGIC;
  signal r_V_4_reg_248_reg_n_140 : STD_LOGIC;
  signal r_V_4_reg_248_reg_n_141 : STD_LOGIC;
  signal r_V_4_reg_248_reg_n_142 : STD_LOGIC;
  signal r_V_4_reg_248_reg_n_143 : STD_LOGIC;
  signal r_V_4_reg_248_reg_n_144 : STD_LOGIC;
  signal r_V_4_reg_248_reg_n_145 : STD_LOGIC;
  signal r_V_4_reg_248_reg_n_146 : STD_LOGIC;
  signal r_V_4_reg_248_reg_n_147 : STD_LOGIC;
  signal r_V_4_reg_248_reg_n_148 : STD_LOGIC;
  signal r_V_4_reg_248_reg_n_149 : STD_LOGIC;
  signal r_V_4_reg_248_reg_n_150 : STD_LOGIC;
  signal r_V_4_reg_248_reg_n_151 : STD_LOGIC;
  signal r_V_4_reg_248_reg_n_152 : STD_LOGIC;
  signal r_V_4_reg_248_reg_n_153 : STD_LOGIC;
  signal ret_V_reg_253_reg_n_100 : STD_LOGIC;
  signal ret_V_reg_253_reg_n_101 : STD_LOGIC;
  signal ret_V_reg_253_reg_n_102 : STD_LOGIC;
  signal ret_V_reg_253_reg_n_103 : STD_LOGIC;
  signal ret_V_reg_253_reg_n_104 : STD_LOGIC;
  signal ret_V_reg_253_reg_n_105 : STD_LOGIC;
  signal ret_V_reg_253_reg_n_72 : STD_LOGIC;
  signal ret_V_reg_253_reg_n_73 : STD_LOGIC;
  signal ret_V_reg_253_reg_n_74 : STD_LOGIC;
  signal ret_V_reg_253_reg_n_75 : STD_LOGIC;
  signal ret_V_reg_253_reg_n_76 : STD_LOGIC;
  signal ret_V_reg_253_reg_n_77 : STD_LOGIC;
  signal ret_V_reg_253_reg_n_78 : STD_LOGIC;
  signal ret_V_reg_253_reg_n_79 : STD_LOGIC;
  signal ret_V_reg_253_reg_n_80 : STD_LOGIC;
  signal ret_V_reg_253_reg_n_81 : STD_LOGIC;
  signal ret_V_reg_253_reg_n_82 : STD_LOGIC;
  signal ret_V_reg_253_reg_n_83 : STD_LOGIC;
  signal ret_V_reg_253_reg_n_84 : STD_LOGIC;
  signal ret_V_reg_253_reg_n_85 : STD_LOGIC;
  signal ret_V_reg_253_reg_n_86 : STD_LOGIC;
  signal ret_V_reg_253_reg_n_87 : STD_LOGIC;
  signal ret_V_reg_253_reg_n_88 : STD_LOGIC;
  signal ret_V_reg_253_reg_n_89 : STD_LOGIC;
  signal ret_V_reg_253_reg_n_90 : STD_LOGIC;
  signal ret_V_reg_253_reg_n_91 : STD_LOGIC;
  signal ret_V_reg_253_reg_n_92 : STD_LOGIC;
  signal ret_V_reg_253_reg_n_93 : STD_LOGIC;
  signal ret_V_reg_253_reg_n_94 : STD_LOGIC;
  signal ret_V_reg_253_reg_n_95 : STD_LOGIC;
  signal ret_V_reg_253_reg_n_96 : STD_LOGIC;
  signal ret_V_reg_253_reg_n_97 : STD_LOGIC;
  signal ret_V_reg_253_reg_n_98 : STD_LOGIC;
  signal ret_V_reg_253_reg_n_99 : STD_LOGIC;
  signal \^roi_seed_r_v\ : STD_LOGIC_VECTOR ( 20 downto 0 );
  signal roi_seed_r_V_1_data_reg1 : STD_LOGIC;
  signal \roi_seed_r_V_1_data_reg[10]_i_2_n_0\ : STD_LOGIC;
  signal \roi_seed_r_V_1_data_reg[21]_i_2_n_0\ : STD_LOGIC;
  signal \roi_seed_r_V_1_data_reg[21]_i_3_n_0\ : STD_LOGIC;
  signal \roi_seed_r_V_1_data_reg[21]_i_4_n_0\ : STD_LOGIC;
  signal \roi_seed_r_V_1_data_reg[21]_i_5_n_0\ : STD_LOGIC;
  signal \roi_seed_r_V_1_data_reg[21]_i_6_n_0\ : STD_LOGIC;
  signal \roi_seed_r_V_1_data_reg[21]_i_7_n_0\ : STD_LOGIC;
  signal \roi_seed_r_V_1_data_reg[21]_i_8_n_0\ : STD_LOGIC;
  signal \roi_seed_r_V_1_data_reg_reg[10]_i_1_n_0\ : STD_LOGIC;
  signal \roi_seed_r_V_1_data_reg_reg[10]_i_1_n_1\ : STD_LOGIC;
  signal \roi_seed_r_V_1_data_reg_reg[10]_i_1_n_10\ : STD_LOGIC;
  signal \roi_seed_r_V_1_data_reg_reg[10]_i_1_n_11\ : STD_LOGIC;
  signal \roi_seed_r_V_1_data_reg_reg[10]_i_1_n_12\ : STD_LOGIC;
  signal \roi_seed_r_V_1_data_reg_reg[10]_i_1_n_13\ : STD_LOGIC;
  signal \roi_seed_r_V_1_data_reg_reg[10]_i_1_n_14\ : STD_LOGIC;
  signal \roi_seed_r_V_1_data_reg_reg[10]_i_1_n_15\ : STD_LOGIC;
  signal \roi_seed_r_V_1_data_reg_reg[10]_i_1_n_2\ : STD_LOGIC;
  signal \roi_seed_r_V_1_data_reg_reg[10]_i_1_n_3\ : STD_LOGIC;
  signal \roi_seed_r_V_1_data_reg_reg[10]_i_1_n_4\ : STD_LOGIC;
  signal \roi_seed_r_V_1_data_reg_reg[10]_i_1_n_5\ : STD_LOGIC;
  signal \roi_seed_r_V_1_data_reg_reg[10]_i_1_n_6\ : STD_LOGIC;
  signal \roi_seed_r_V_1_data_reg_reg[10]_i_1_n_7\ : STD_LOGIC;
  signal \roi_seed_r_V_1_data_reg_reg[10]_i_1_n_8\ : STD_LOGIC;
  signal \roi_seed_r_V_1_data_reg_reg[10]_i_1_n_9\ : STD_LOGIC;
  signal \roi_seed_r_V_1_data_reg_reg[21]_i_1_n_10\ : STD_LOGIC;
  signal \roi_seed_r_V_1_data_reg_reg[21]_i_1_n_11\ : STD_LOGIC;
  signal \roi_seed_r_V_1_data_reg_reg[21]_i_1_n_12\ : STD_LOGIC;
  signal \roi_seed_r_V_1_data_reg_reg[21]_i_1_n_13\ : STD_LOGIC;
  signal \roi_seed_r_V_1_data_reg_reg[21]_i_1_n_14\ : STD_LOGIC;
  signal \roi_seed_r_V_1_data_reg_reg[21]_i_1_n_15\ : STD_LOGIC;
  signal \roi_seed_r_V_1_data_reg_reg[21]_i_1_n_2\ : STD_LOGIC;
  signal \roi_seed_r_V_1_data_reg_reg[21]_i_1_n_3\ : STD_LOGIC;
  signal \roi_seed_r_V_1_data_reg_reg[21]_i_1_n_4\ : STD_LOGIC;
  signal \roi_seed_r_V_1_data_reg_reg[21]_i_1_n_5\ : STD_LOGIC;
  signal \roi_seed_r_V_1_data_reg_reg[21]_i_1_n_6\ : STD_LOGIC;
  signal \roi_seed_r_V_1_data_reg_reg[21]_i_1_n_7\ : STD_LOGIC;
  signal shl_ln_fu_103_p3 : STD_LOGIC_VECTOR ( 12 downto 3 );
  signal slcvec_pos_ref_V_0_data_reg : STD_LOGIC_VECTOR ( 12 downto 0 );
  signal sub_ln731_1_fu_137_p21_out : STD_LOGIC_VECTOR ( 12 downto 0 );
  signal sub_ln731_fu_123_p20_out : STD_LOGIC_VECTOR ( 12 downto 3 );
  signal sub_ln731_reg_218 : STD_LOGIC_VECTOR ( 12 downto 3 );
  signal \sub_ln731_reg_218[10]_i_10_n_0\ : STD_LOGIC;
  signal \sub_ln731_reg_218[10]_i_11_n_0\ : STD_LOGIC;
  signal \sub_ln731_reg_218[10]_i_12_n_0\ : STD_LOGIC;
  signal \sub_ln731_reg_218[10]_i_13_n_0\ : STD_LOGIC;
  signal \sub_ln731_reg_218[10]_i_14_n_0\ : STD_LOGIC;
  signal \sub_ln731_reg_218[10]_i_15_n_0\ : STD_LOGIC;
  signal \sub_ln731_reg_218[10]_i_16_n_0\ : STD_LOGIC;
  signal \sub_ln731_reg_218[10]_i_2_n_0\ : STD_LOGIC;
  signal \sub_ln731_reg_218[10]_i_3_n_0\ : STD_LOGIC;
  signal \sub_ln731_reg_218[10]_i_4_n_0\ : STD_LOGIC;
  signal \sub_ln731_reg_218[10]_i_5_n_0\ : STD_LOGIC;
  signal \sub_ln731_reg_218[10]_i_6_n_0\ : STD_LOGIC;
  signal \sub_ln731_reg_218[10]_i_7_n_0\ : STD_LOGIC;
  signal \sub_ln731_reg_218[10]_i_8_n_0\ : STD_LOGIC;
  signal \sub_ln731_reg_218[10]_i_9_n_0\ : STD_LOGIC;
  signal \sub_ln731_reg_218[12]_i_2_n_0\ : STD_LOGIC;
  signal \sub_ln731_reg_218[12]_i_3_n_0\ : STD_LOGIC;
  signal \sub_ln731_reg_218[12]_i_4_n_0\ : STD_LOGIC;
  signal \sub_ln731_reg_218_reg[10]_i_1_n_0\ : STD_LOGIC;
  signal \sub_ln731_reg_218_reg[10]_i_1_n_1\ : STD_LOGIC;
  signal \sub_ln731_reg_218_reg[10]_i_1_n_2\ : STD_LOGIC;
  signal \sub_ln731_reg_218_reg[10]_i_1_n_3\ : STD_LOGIC;
  signal \sub_ln731_reg_218_reg[10]_i_1_n_4\ : STD_LOGIC;
  signal \sub_ln731_reg_218_reg[10]_i_1_n_5\ : STD_LOGIC;
  signal \sub_ln731_reg_218_reg[10]_i_1_n_6\ : STD_LOGIC;
  signal \sub_ln731_reg_218_reg[10]_i_1_n_7\ : STD_LOGIC;
  signal \sub_ln731_reg_218_reg[12]_i_1_n_7\ : STD_LOGIC;
  signal NLW_r_V_4_reg_248_reg_CARRYCASCOUT_UNCONNECTED : STD_LOGIC;
  signal NLW_r_V_4_reg_248_reg_MULTSIGNOUT_UNCONNECTED : STD_LOGIC;
  signal NLW_r_V_4_reg_248_reg_OVERFLOW_UNCONNECTED : STD_LOGIC;
  signal NLW_r_V_4_reg_248_reg_PATTERNBDETECT_UNCONNECTED : STD_LOGIC;
  signal NLW_r_V_4_reg_248_reg_PATTERNDETECT_UNCONNECTED : STD_LOGIC;
  signal NLW_r_V_4_reg_248_reg_UNDERFLOW_UNCONNECTED : STD_LOGIC;
  signal NLW_r_V_4_reg_248_reg_ACOUT_UNCONNECTED : STD_LOGIC_VECTOR ( 29 downto 0 );
  signal NLW_r_V_4_reg_248_reg_BCOUT_UNCONNECTED : STD_LOGIC_VECTOR ( 17 downto 0 );
  signal NLW_r_V_4_reg_248_reg_CARRYOUT_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_r_V_4_reg_248_reg_P_UNCONNECTED : STD_LOGIC_VECTOR ( 47 downto 0 );
  signal NLW_r_V_4_reg_248_reg_XOROUT_UNCONNECTED : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal NLW_r_V_4_reg_248_reg_i_1_CO_UNCONNECTED : STD_LOGIC_VECTOR ( 7 downto 4 );
  signal NLW_r_V_4_reg_248_reg_i_1_O_UNCONNECTED : STD_LOGIC_VECTOR ( 7 downto 5 );
  signal NLW_ret_V_reg_253_reg_CARRYCASCOUT_UNCONNECTED : STD_LOGIC;
  signal NLW_ret_V_reg_253_reg_MULTSIGNOUT_UNCONNECTED : STD_LOGIC;
  signal NLW_ret_V_reg_253_reg_OVERFLOW_UNCONNECTED : STD_LOGIC;
  signal NLW_ret_V_reg_253_reg_PATTERNBDETECT_UNCONNECTED : STD_LOGIC;
  signal NLW_ret_V_reg_253_reg_PATTERNDETECT_UNCONNECTED : STD_LOGIC;
  signal NLW_ret_V_reg_253_reg_UNDERFLOW_UNCONNECTED : STD_LOGIC;
  signal NLW_ret_V_reg_253_reg_ACOUT_UNCONNECTED : STD_LOGIC_VECTOR ( 29 downto 0 );
  signal NLW_ret_V_reg_253_reg_BCOUT_UNCONNECTED : STD_LOGIC_VECTOR ( 17 downto 0 );
  signal NLW_ret_V_reg_253_reg_CARRYOUT_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_ret_V_reg_253_reg_P_UNCONNECTED : STD_LOGIC_VECTOR ( 47 downto 34 );
  signal NLW_ret_V_reg_253_reg_PCOUT_UNCONNECTED : STD_LOGIC_VECTOR ( 47 downto 0 );
  signal NLW_ret_V_reg_253_reg_XOROUT_UNCONNECTED : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \NLW_roi_seed_r_V_1_data_reg_reg[21]_i_1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 6 );
  signal \NLW_roi_seed_r_V_1_data_reg_reg[21]_i_1_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 to 7 );
  signal \NLW_sub_ln731_reg_218_reg[12]_i_1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 1 );
  signal \NLW_sub_ln731_reg_218_reg[12]_i_1_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 2 );
begin
  \^ap_start\ <= ap_start;
  ap_done <= \^ap_done\;
  ap_ready <= \^ap_start\;
  roi_seed_r_V(21) <= \^roi_seed_r_v\(20);
  roi_seed_r_V(20) <= \^roi_seed_r_v\(20);
  roi_seed_r_V(19) <= \^roi_seed_r_v\(20);
  roi_seed_r_V(18) <= \^roi_seed_r_v\(20);
  roi_seed_r_V(17) <= \^roi_seed_r_v\(20);
  roi_seed_r_V(16 downto 0) <= \^roi_seed_r_v\(16 downto 0);
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
      Q => ap_enable_reg_pp0_iter3,
      R => ap_rst
    );
ap_enable_reg_pp0_iter4_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => '1',
      D => ap_enable_reg_pp0_iter3,
      Q => ap_enable_reg_pp0_iter4,
      R => ap_rst
    );
ap_enable_reg_pp0_iter5_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => '1',
      D => ap_enable_reg_pp0_iter4,
      Q => ap_enable_reg_pp0_iter5,
      R => ap_rst
    );
ap_enable_reg_pp0_iter6_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => '1',
      D => ap_enable_reg_pp0_iter5,
      Q => ap_enable_reg_pp0_iter6,
      R => ap_rst
    );
ap_enable_reg_pp0_iter7_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => '1',
      D => ap_enable_reg_pp0_iter6,
      Q => \^ap_done\,
      R => ap_rst
    );
ap_idle_INST_0: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000001"
    )
        port map (
      I0 => \^ap_done\,
      I1 => ap_enable_reg_pp0_iter5,
      I2 => ap_enable_reg_pp0_iter6,
      I3 => \^ap_start\,
      I4 => ap_idle_INST_0_i_1_n_0,
      O => ap_idle
    );
ap_idle_INST_0_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => ap_enable_reg_pp0_iter3,
      I1 => ap_enable_reg_pp0_iter2,
      I2 => ap_enable_reg_pp0_iter1,
      I3 => ap_enable_reg_pp0_iter4,
      O => ap_idle_INST_0_i_1_n_0
    );
\hewindow_pos_V_0_data_reg_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => roi_seed_r_V_1_data_reg1,
      D => hewindow_pos_V(0),
      Q => hewindow_pos_V_0_data_reg(0),
      R => '0'
    );
\hewindow_pos_V_0_data_reg_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => roi_seed_r_V_1_data_reg1,
      D => hewindow_pos_V(1),
      Q => hewindow_pos_V_0_data_reg(1),
      R => '0'
    );
\hewindow_pos_V_0_data_reg_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => roi_seed_r_V_1_data_reg1,
      D => hewindow_pos_V(2),
      Q => hewindow_pos_V_0_data_reg(2),
      R => '0'
    );
\hewindow_pos_V_0_data_reg_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => roi_seed_r_V_1_data_reg1,
      D => hewindow_pos_V(3),
      Q => hewindow_pos_V_0_data_reg(3),
      R => '0'
    );
\hewindow_pos_V_0_data_reg_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => roi_seed_r_V_1_data_reg1,
      D => hewindow_pos_V(4),
      Q => hewindow_pos_V_0_data_reg(4),
      R => '0'
    );
\hewindow_pos_V_0_data_reg_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => roi_seed_r_V_1_data_reg1,
      D => hewindow_pos_V(5),
      Q => hewindow_pos_V_0_data_reg(5),
      R => '0'
    );
\hewindow_pos_V_0_data_reg_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => roi_seed_r_V_1_data_reg1,
      D => hewindow_pos_V(6),
      Q => hewindow_pos_V_0_data_reg(6),
      R => '0'
    );
\hewindow_pos_V_0_data_reg_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => roi_seed_r_V_1_data_reg1,
      D => hewindow_pos_V(7),
      Q => hewindow_pos_V_0_data_reg(7),
      R => '0'
    );
\hewindow_pos_V_0_data_reg_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => roi_seed_r_V_1_data_reg1,
      D => hewindow_pos_V(8),
      Q => hewindow_pos_V_0_data_reg(8),
      R => '0'
    );
\hewindow_pos_V_0_data_reg_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => roi_seed_r_V_1_data_reg1,
      D => hewindow_pos_V(9),
      Q => hewindow_pos_V_0_data_reg(9),
      R => '0'
    );
\hewindow_pos_ref_V_0_data_reg_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => roi_seed_r_V_1_data_reg1,
      D => hewindow_pos_ref_V(0),
      Q => hewindow_pos_ref_V_0_data_reg(0),
      R => '0'
    );
\hewindow_pos_ref_V_0_data_reg_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => roi_seed_r_V_1_data_reg1,
      D => hewindow_pos_ref_V(10),
      Q => hewindow_pos_ref_V_0_data_reg(10),
      R => '0'
    );
\hewindow_pos_ref_V_0_data_reg_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => roi_seed_r_V_1_data_reg1,
      D => hewindow_pos_ref_V(11),
      Q => hewindow_pos_ref_V_0_data_reg(11),
      R => '0'
    );
\hewindow_pos_ref_V_0_data_reg_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => roi_seed_r_V_1_data_reg1,
      D => hewindow_pos_ref_V(12),
      Q => hewindow_pos_ref_V_0_data_reg(12),
      R => '0'
    );
\hewindow_pos_ref_V_0_data_reg_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => roi_seed_r_V_1_data_reg1,
      D => hewindow_pos_ref_V(1),
      Q => hewindow_pos_ref_V_0_data_reg(1),
      R => '0'
    );
\hewindow_pos_ref_V_0_data_reg_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => roi_seed_r_V_1_data_reg1,
      D => hewindow_pos_ref_V(2),
      Q => hewindow_pos_ref_V_0_data_reg(2),
      R => '0'
    );
\hewindow_pos_ref_V_0_data_reg_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => roi_seed_r_V_1_data_reg1,
      D => hewindow_pos_ref_V(3),
      Q => hewindow_pos_ref_V_0_data_reg(3),
      R => '0'
    );
\hewindow_pos_ref_V_0_data_reg_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => roi_seed_r_V_1_data_reg1,
      D => hewindow_pos_ref_V(4),
      Q => hewindow_pos_ref_V_0_data_reg(4),
      R => '0'
    );
\hewindow_pos_ref_V_0_data_reg_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => roi_seed_r_V_1_data_reg1,
      D => hewindow_pos_ref_V(5),
      Q => hewindow_pos_ref_V_0_data_reg(5),
      R => '0'
    );
\hewindow_pos_ref_V_0_data_reg_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => roi_seed_r_V_1_data_reg1,
      D => hewindow_pos_ref_V(6),
      Q => hewindow_pos_ref_V_0_data_reg(6),
      R => '0'
    );
\hewindow_pos_ref_V_0_data_reg_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => roi_seed_r_V_1_data_reg1,
      D => hewindow_pos_ref_V(7),
      Q => hewindow_pos_ref_V_0_data_reg(7),
      R => '0'
    );
\hewindow_pos_ref_V_0_data_reg_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => roi_seed_r_V_1_data_reg1,
      D => hewindow_pos_ref_V(8),
      Q => hewindow_pos_ref_V_0_data_reg(8),
      R => '0'
    );
\hewindow_pos_ref_V_0_data_reg_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => roi_seed_r_V_1_data_reg1,
      D => hewindow_pos_ref_V(9),
      Q => hewindow_pos_ref_V_0_data_reg(9),
      R => '0'
    );
\hw_cos_val_V_0_data_reg_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => roi_seed_r_V_1_data_reg1,
      D => hw_cos_val_V(0),
      Q => hw_cos_val_V_0_data_reg(0),
      R => '0'
    );
\hw_cos_val_V_0_data_reg_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => roi_seed_r_V_1_data_reg1,
      D => hw_cos_val_V(10),
      Q => hw_cos_val_V_0_data_reg(10),
      R => '0'
    );
\hw_cos_val_V_0_data_reg_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => roi_seed_r_V_1_data_reg1,
      D => hw_cos_val_V(11),
      Q => hw_cos_val_V_0_data_reg(11),
      R => '0'
    );
\hw_cos_val_V_0_data_reg_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => roi_seed_r_V_1_data_reg1,
      D => hw_cos_val_V(12),
      Q => hw_cos_val_V_0_data_reg(12),
      R => '0'
    );
\hw_cos_val_V_0_data_reg_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => roi_seed_r_V_1_data_reg1,
      D => hw_cos_val_V(13),
      Q => hw_cos_val_V_0_data_reg(13),
      R => '0'
    );
\hw_cos_val_V_0_data_reg_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => roi_seed_r_V_1_data_reg1,
      D => hw_cos_val_V(14),
      Q => hw_cos_val_V_0_data_reg(14),
      R => '0'
    );
\hw_cos_val_V_0_data_reg_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => roi_seed_r_V_1_data_reg1,
      D => hw_cos_val_V(15),
      Q => hw_cos_val_V_0_data_reg(15),
      R => '0'
    );
\hw_cos_val_V_0_data_reg_reg[16]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => roi_seed_r_V_1_data_reg1,
      D => hw_cos_val_V(16),
      Q => hw_cos_val_V_0_data_reg(16),
      R => '0'
    );
\hw_cos_val_V_0_data_reg_reg[17]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => roi_seed_r_V_1_data_reg1,
      D => hw_cos_val_V(17),
      Q => hw_cos_val_V_0_data_reg(17),
      R => '0'
    );
\hw_cos_val_V_0_data_reg_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => roi_seed_r_V_1_data_reg1,
      D => hw_cos_val_V(1),
      Q => hw_cos_val_V_0_data_reg(1),
      R => '0'
    );
\hw_cos_val_V_0_data_reg_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => roi_seed_r_V_1_data_reg1,
      D => hw_cos_val_V(2),
      Q => hw_cos_val_V_0_data_reg(2),
      R => '0'
    );
\hw_cos_val_V_0_data_reg_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => roi_seed_r_V_1_data_reg1,
      D => hw_cos_val_V(3),
      Q => hw_cos_val_V_0_data_reg(3),
      R => '0'
    );
\hw_cos_val_V_0_data_reg_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => roi_seed_r_V_1_data_reg1,
      D => hw_cos_val_V(4),
      Q => hw_cos_val_V_0_data_reg(4),
      R => '0'
    );
\hw_cos_val_V_0_data_reg_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => roi_seed_r_V_1_data_reg1,
      D => hw_cos_val_V(5),
      Q => hw_cos_val_V_0_data_reg(5),
      R => '0'
    );
\hw_cos_val_V_0_data_reg_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => roi_seed_r_V_1_data_reg1,
      D => hw_cos_val_V(6),
      Q => hw_cos_val_V_0_data_reg(6),
      R => '0'
    );
\hw_cos_val_V_0_data_reg_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => roi_seed_r_V_1_data_reg1,
      D => hw_cos_val_V(7),
      Q => hw_cos_val_V_0_data_reg(7),
      R => '0'
    );
\hw_cos_val_V_0_data_reg_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => roi_seed_r_V_1_data_reg1,
      D => hw_cos_val_V(8),
      Q => hw_cos_val_V_0_data_reg(8),
      R => '0'
    );
\hw_cos_val_V_0_data_reg_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => roi_seed_r_V_1_data_reg1,
      D => hw_cos_val_V(9),
      Q => hw_cos_val_V_0_data_reg(9),
      R => '0'
    );
\hw_cos_val_V_read_reg_208_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => hw_cos_val_V_0_data_reg(0),
      Q => hw_cos_val_V_read_reg_208(0),
      R => '0'
    );
\hw_cos_val_V_read_reg_208_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => hw_cos_val_V_0_data_reg(10),
      Q => hw_cos_val_V_read_reg_208(10),
      R => '0'
    );
\hw_cos_val_V_read_reg_208_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => hw_cos_val_V_0_data_reg(11),
      Q => hw_cos_val_V_read_reg_208(11),
      R => '0'
    );
\hw_cos_val_V_read_reg_208_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => hw_cos_val_V_0_data_reg(12),
      Q => hw_cos_val_V_read_reg_208(12),
      R => '0'
    );
\hw_cos_val_V_read_reg_208_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => hw_cos_val_V_0_data_reg(13),
      Q => hw_cos_val_V_read_reg_208(13),
      R => '0'
    );
\hw_cos_val_V_read_reg_208_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => hw_cos_val_V_0_data_reg(14),
      Q => hw_cos_val_V_read_reg_208(14),
      R => '0'
    );
\hw_cos_val_V_read_reg_208_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => hw_cos_val_V_0_data_reg(15),
      Q => hw_cos_val_V_read_reg_208(15),
      R => '0'
    );
\hw_cos_val_V_read_reg_208_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => hw_cos_val_V_0_data_reg(16),
      Q => hw_cos_val_V_read_reg_208(16),
      R => '0'
    );
\hw_cos_val_V_read_reg_208_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => hw_cos_val_V_0_data_reg(17),
      Q => hw_cos_val_V_read_reg_208(17),
      R => '0'
    );
\hw_cos_val_V_read_reg_208_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => hw_cos_val_V_0_data_reg(1),
      Q => hw_cos_val_V_read_reg_208(1),
      R => '0'
    );
\hw_cos_val_V_read_reg_208_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => hw_cos_val_V_0_data_reg(2),
      Q => hw_cos_val_V_read_reg_208(2),
      R => '0'
    );
\hw_cos_val_V_read_reg_208_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => hw_cos_val_V_0_data_reg(3),
      Q => hw_cos_val_V_read_reg_208(3),
      R => '0'
    );
\hw_cos_val_V_read_reg_208_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => hw_cos_val_V_0_data_reg(4),
      Q => hw_cos_val_V_read_reg_208(4),
      R => '0'
    );
\hw_cos_val_V_read_reg_208_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => hw_cos_val_V_0_data_reg(5),
      Q => hw_cos_val_V_read_reg_208(5),
      R => '0'
    );
\hw_cos_val_V_read_reg_208_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => hw_cos_val_V_0_data_reg(6),
      Q => hw_cos_val_V_read_reg_208(6),
      R => '0'
    );
\hw_cos_val_V_read_reg_208_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => hw_cos_val_V_0_data_reg(7),
      Q => hw_cos_val_V_read_reg_208(7),
      R => '0'
    );
\hw_cos_val_V_read_reg_208_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => hw_cos_val_V_0_data_reg(8),
      Q => hw_cos_val_V_read_reg_208(8),
      R => '0'
    );
\hw_cos_val_V_read_reg_208_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => hw_cos_val_V_0_data_reg(9),
      Q => hw_cos_val_V_read_reg_208(9),
      R => '0'
    );
\hw_sin_val_V_0_data_reg[17]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFFFE"
    )
        port map (
      I0 => ap_idle_INST_0_i_1_n_0,
      I1 => \^ap_start\,
      I2 => ap_enable_reg_pp0_iter6,
      I3 => ap_enable_reg_pp0_iter5,
      I4 => \^ap_done\,
      O => roi_seed_r_V_1_data_reg1
    );
\hw_sin_val_V_0_data_reg_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => roi_seed_r_V_1_data_reg1,
      D => hw_sin_val_V(0),
      Q => hw_sin_val_V_0_data_reg(0),
      R => '0'
    );
\hw_sin_val_V_0_data_reg_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => roi_seed_r_V_1_data_reg1,
      D => hw_sin_val_V(10),
      Q => hw_sin_val_V_0_data_reg(10),
      R => '0'
    );
\hw_sin_val_V_0_data_reg_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => roi_seed_r_V_1_data_reg1,
      D => hw_sin_val_V(11),
      Q => hw_sin_val_V_0_data_reg(11),
      R => '0'
    );
\hw_sin_val_V_0_data_reg_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => roi_seed_r_V_1_data_reg1,
      D => hw_sin_val_V(12),
      Q => hw_sin_val_V_0_data_reg(12),
      R => '0'
    );
\hw_sin_val_V_0_data_reg_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => roi_seed_r_V_1_data_reg1,
      D => hw_sin_val_V(13),
      Q => hw_sin_val_V_0_data_reg(13),
      R => '0'
    );
\hw_sin_val_V_0_data_reg_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => roi_seed_r_V_1_data_reg1,
      D => hw_sin_val_V(14),
      Q => hw_sin_val_V_0_data_reg(14),
      R => '0'
    );
\hw_sin_val_V_0_data_reg_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => roi_seed_r_V_1_data_reg1,
      D => hw_sin_val_V(15),
      Q => hw_sin_val_V_0_data_reg(15),
      R => '0'
    );
\hw_sin_val_V_0_data_reg_reg[16]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => roi_seed_r_V_1_data_reg1,
      D => hw_sin_val_V(16),
      Q => hw_sin_val_V_0_data_reg(16),
      R => '0'
    );
\hw_sin_val_V_0_data_reg_reg[17]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => roi_seed_r_V_1_data_reg1,
      D => hw_sin_val_V(17),
      Q => hw_sin_val_V_0_data_reg(17),
      R => '0'
    );
\hw_sin_val_V_0_data_reg_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => roi_seed_r_V_1_data_reg1,
      D => hw_sin_val_V(1),
      Q => hw_sin_val_V_0_data_reg(1),
      R => '0'
    );
\hw_sin_val_V_0_data_reg_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => roi_seed_r_V_1_data_reg1,
      D => hw_sin_val_V(2),
      Q => hw_sin_val_V_0_data_reg(2),
      R => '0'
    );
\hw_sin_val_V_0_data_reg_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => roi_seed_r_V_1_data_reg1,
      D => hw_sin_val_V(3),
      Q => hw_sin_val_V_0_data_reg(3),
      R => '0'
    );
\hw_sin_val_V_0_data_reg_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => roi_seed_r_V_1_data_reg1,
      D => hw_sin_val_V(4),
      Q => hw_sin_val_V_0_data_reg(4),
      R => '0'
    );
\hw_sin_val_V_0_data_reg_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => roi_seed_r_V_1_data_reg1,
      D => hw_sin_val_V(5),
      Q => hw_sin_val_V_0_data_reg(5),
      R => '0'
    );
\hw_sin_val_V_0_data_reg_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => roi_seed_r_V_1_data_reg1,
      D => hw_sin_val_V(6),
      Q => hw_sin_val_V_0_data_reg(6),
      R => '0'
    );
\hw_sin_val_V_0_data_reg_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => roi_seed_r_V_1_data_reg1,
      D => hw_sin_val_V(7),
      Q => hw_sin_val_V_0_data_reg(7),
      R => '0'
    );
\hw_sin_val_V_0_data_reg_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => roi_seed_r_V_1_data_reg1,
      D => hw_sin_val_V(8),
      Q => hw_sin_val_V_0_data_reg(8),
      R => '0'
    );
\hw_sin_val_V_0_data_reg_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => roi_seed_r_V_1_data_reg1,
      D => hw_sin_val_V(9),
      Q => hw_sin_val_V_0_data_reg(9),
      R => '0'
    );
r_V_4_reg_248_reg: unisim.vcomponents.DSP48E2
    generic map(
      ACASCREG => 2,
      ADREG => 1,
      ALUMODEREG => 0,
      AMULTSEL => "A",
      AREG => 2,
      AUTORESET_PATDET => "NO_RESET",
      AUTORESET_PRIORITY => "RESET",
      A_INPUT => "DIRECT",
      BCASCREG => 2,
      BMULTSEL => "B",
      BREG => 2,
      B_INPUT => "DIRECT",
      CARRYINREG => 0,
      CARRYINSELREG => 0,
      CREG => 1,
      DREG => 1,
      INMODEREG => 0,
      MASK => X"3FFFFFFFFFFF",
      MREG => 1,
      OPMODEREG => 0,
      PATTERN => X"000000000000",
      PREADDINSEL => "A",
      PREG => 1,
      RND => X"000000000000",
      SEL_MASK => "MASK",
      SEL_PATTERN => "PATTERN",
      USE_MULT => "MULTIPLY",
      USE_PATTERN_DETECT => "NO_PATDET",
      USE_SIMD => "ONE48",
      USE_WIDEXOR => "FALSE",
      XORSIMD => "XOR24_48_96"
    )
        port map (
      A(29) => hw_sin_val_V_0_data_reg(17),
      A(28) => hw_sin_val_V_0_data_reg(17),
      A(27) => hw_sin_val_V_0_data_reg(17),
      A(26) => hw_sin_val_V_0_data_reg(17),
      A(25) => hw_sin_val_V_0_data_reg(17),
      A(24) => hw_sin_val_V_0_data_reg(17),
      A(23) => hw_sin_val_V_0_data_reg(17),
      A(22) => hw_sin_val_V_0_data_reg(17),
      A(21) => hw_sin_val_V_0_data_reg(17),
      A(20) => hw_sin_val_V_0_data_reg(17),
      A(19) => hw_sin_val_V_0_data_reg(17),
      A(18) => hw_sin_val_V_0_data_reg(17),
      A(17 downto 0) => hw_sin_val_V_0_data_reg(17 downto 0),
      ACIN(29 downto 0) => B"000000000000000000000000000000",
      ACOUT(29 downto 0) => NLW_r_V_4_reg_248_reg_ACOUT_UNCONNECTED(29 downto 0),
      ALUMODE(3 downto 0) => B"0000",
      B(17) => sub_ln731_1_fu_137_p21_out(12),
      B(16) => sub_ln731_1_fu_137_p21_out(12),
      B(15) => sub_ln731_1_fu_137_p21_out(12),
      B(14 downto 2) => sub_ln731_1_fu_137_p21_out(12 downto 0),
      B(1 downto 0) => B"00",
      BCIN(17 downto 0) => B"000000000000000000",
      BCOUT(17 downto 0) => NLW_r_V_4_reg_248_reg_BCOUT_UNCONNECTED(17 downto 0),
      C(47 downto 0) => B"000000000000000000000000000000000000000000000000",
      CARRYCASCIN => '0',
      CARRYCASCOUT => NLW_r_V_4_reg_248_reg_CARRYCASCOUT_UNCONNECTED,
      CARRYIN => '0',
      CARRYINSEL(2 downto 0) => B"000",
      CARRYOUT(3 downto 0) => NLW_r_V_4_reg_248_reg_CARRYOUT_UNCONNECTED(3 downto 0),
      CEA1 => '1',
      CEA2 => '1',
      CEAD => '0',
      CEALUMODE => '0',
      CEB1 => '1',
      CEB2 => '1',
      CEC => '0',
      CECARRYIN => '0',
      CECTRL => '0',
      CED => '0',
      CEINMODE => '0',
      CEM => '1',
      CEP => '1',
      CLK => ap_clk,
      D(26 downto 0) => B"000000000000000000000000000",
      INMODE(4 downto 0) => B"00000",
      MULTSIGNIN => '0',
      MULTSIGNOUT => NLW_r_V_4_reg_248_reg_MULTSIGNOUT_UNCONNECTED,
      OPMODE(8 downto 0) => B"000000101",
      OVERFLOW => NLW_r_V_4_reg_248_reg_OVERFLOW_UNCONNECTED,
      P(47 downto 0) => NLW_r_V_4_reg_248_reg_P_UNCONNECTED(47 downto 0),
      PATTERNBDETECT => NLW_r_V_4_reg_248_reg_PATTERNBDETECT_UNCONNECTED,
      PATTERNDETECT => NLW_r_V_4_reg_248_reg_PATTERNDETECT_UNCONNECTED,
      PCIN(47 downto 0) => B"000000000000000000000000000000000000000000000000",
      PCOUT(47) => r_V_4_reg_248_reg_n_106,
      PCOUT(46) => r_V_4_reg_248_reg_n_107,
      PCOUT(45) => r_V_4_reg_248_reg_n_108,
      PCOUT(44) => r_V_4_reg_248_reg_n_109,
      PCOUT(43) => r_V_4_reg_248_reg_n_110,
      PCOUT(42) => r_V_4_reg_248_reg_n_111,
      PCOUT(41) => r_V_4_reg_248_reg_n_112,
      PCOUT(40) => r_V_4_reg_248_reg_n_113,
      PCOUT(39) => r_V_4_reg_248_reg_n_114,
      PCOUT(38) => r_V_4_reg_248_reg_n_115,
      PCOUT(37) => r_V_4_reg_248_reg_n_116,
      PCOUT(36) => r_V_4_reg_248_reg_n_117,
      PCOUT(35) => r_V_4_reg_248_reg_n_118,
      PCOUT(34) => r_V_4_reg_248_reg_n_119,
      PCOUT(33) => r_V_4_reg_248_reg_n_120,
      PCOUT(32) => r_V_4_reg_248_reg_n_121,
      PCOUT(31) => r_V_4_reg_248_reg_n_122,
      PCOUT(30) => r_V_4_reg_248_reg_n_123,
      PCOUT(29) => r_V_4_reg_248_reg_n_124,
      PCOUT(28) => r_V_4_reg_248_reg_n_125,
      PCOUT(27) => r_V_4_reg_248_reg_n_126,
      PCOUT(26) => r_V_4_reg_248_reg_n_127,
      PCOUT(25) => r_V_4_reg_248_reg_n_128,
      PCOUT(24) => r_V_4_reg_248_reg_n_129,
      PCOUT(23) => r_V_4_reg_248_reg_n_130,
      PCOUT(22) => r_V_4_reg_248_reg_n_131,
      PCOUT(21) => r_V_4_reg_248_reg_n_132,
      PCOUT(20) => r_V_4_reg_248_reg_n_133,
      PCOUT(19) => r_V_4_reg_248_reg_n_134,
      PCOUT(18) => r_V_4_reg_248_reg_n_135,
      PCOUT(17) => r_V_4_reg_248_reg_n_136,
      PCOUT(16) => r_V_4_reg_248_reg_n_137,
      PCOUT(15) => r_V_4_reg_248_reg_n_138,
      PCOUT(14) => r_V_4_reg_248_reg_n_139,
      PCOUT(13) => r_V_4_reg_248_reg_n_140,
      PCOUT(12) => r_V_4_reg_248_reg_n_141,
      PCOUT(11) => r_V_4_reg_248_reg_n_142,
      PCOUT(10) => r_V_4_reg_248_reg_n_143,
      PCOUT(9) => r_V_4_reg_248_reg_n_144,
      PCOUT(8) => r_V_4_reg_248_reg_n_145,
      PCOUT(7) => r_V_4_reg_248_reg_n_146,
      PCOUT(6) => r_V_4_reg_248_reg_n_147,
      PCOUT(5) => r_V_4_reg_248_reg_n_148,
      PCOUT(4) => r_V_4_reg_248_reg_n_149,
      PCOUT(3) => r_V_4_reg_248_reg_n_150,
      PCOUT(2) => r_V_4_reg_248_reg_n_151,
      PCOUT(1) => r_V_4_reg_248_reg_n_152,
      PCOUT(0) => r_V_4_reg_248_reg_n_153,
      RSTA => '0',
      RSTALLCARRYIN => '0',
      RSTALUMODE => '0',
      RSTB => '0',
      RSTC => '0',
      RSTCTRL => '0',
      RSTD => '0',
      RSTINMODE => '0',
      RSTM => '0',
      RSTP => '0',
      UNDERFLOW => NLW_r_V_4_reg_248_reg_UNDERFLOW_UNCONNECTED,
      XOROUT(7 downto 0) => NLW_r_V_4_reg_248_reg_XOROUT_UNCONNECTED(7 downto 0)
    );
r_V_4_reg_248_reg_i_1: unisim.vcomponents.CARRY8
     port map (
      CI => r_V_4_reg_248_reg_i_2_n_0,
      CI_TOP => '0',
      CO(7 downto 4) => NLW_r_V_4_reg_248_reg_i_1_CO_UNCONNECTED(7 downto 4),
      CO(3) => r_V_4_reg_248_reg_i_1_n_4,
      CO(2) => r_V_4_reg_248_reg_i_1_n_5,
      CO(1) => r_V_4_reg_248_reg_i_1_n_6,
      CO(0) => r_V_4_reg_248_reg_i_1_n_7,
      DI(7 downto 4) => B"0000",
      DI(3 downto 0) => slcvec_pos_ref_V_0_data_reg(11 downto 8),
      O(7 downto 5) => NLW_r_V_4_reg_248_reg_i_1_O_UNCONNECTED(7 downto 5),
      O(4 downto 0) => sub_ln731_1_fu_137_p21_out(12 downto 8),
      S(7 downto 5) => B"000",
      S(4) => r_V_4_reg_248_reg_i_3_n_0,
      S(3) => r_V_4_reg_248_reg_i_4_n_0,
      S(2) => r_V_4_reg_248_reg_i_5_n_0,
      S(1) => r_V_4_reg_248_reg_i_6_n_0,
      S(0) => r_V_4_reg_248_reg_i_7_n_0
    );
r_V_4_reg_248_reg_i_10: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => slcvec_pos_ref_V_0_data_reg(5),
      I1 => hewindow_pos_ref_V_0_data_reg(5),
      O => r_V_4_reg_248_reg_i_10_n_0
    );
r_V_4_reg_248_reg_i_11: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => slcvec_pos_ref_V_0_data_reg(4),
      I1 => hewindow_pos_ref_V_0_data_reg(4),
      O => r_V_4_reg_248_reg_i_11_n_0
    );
r_V_4_reg_248_reg_i_12: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => slcvec_pos_ref_V_0_data_reg(3),
      I1 => hewindow_pos_ref_V_0_data_reg(3),
      O => r_V_4_reg_248_reg_i_12_n_0
    );
r_V_4_reg_248_reg_i_13: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => slcvec_pos_ref_V_0_data_reg(2),
      I1 => hewindow_pos_ref_V_0_data_reg(2),
      O => r_V_4_reg_248_reg_i_13_n_0
    );
r_V_4_reg_248_reg_i_14: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => slcvec_pos_ref_V_0_data_reg(1),
      I1 => hewindow_pos_ref_V_0_data_reg(1),
      O => r_V_4_reg_248_reg_i_14_n_0
    );
r_V_4_reg_248_reg_i_15: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => slcvec_pos_ref_V_0_data_reg(0),
      I1 => hewindow_pos_ref_V_0_data_reg(0),
      O => r_V_4_reg_248_reg_i_15_n_0
    );
r_V_4_reg_248_reg_i_2: unisim.vcomponents.CARRY8
     port map (
      CI => '1',
      CI_TOP => '0',
      CO(7) => r_V_4_reg_248_reg_i_2_n_0,
      CO(6) => r_V_4_reg_248_reg_i_2_n_1,
      CO(5) => r_V_4_reg_248_reg_i_2_n_2,
      CO(4) => r_V_4_reg_248_reg_i_2_n_3,
      CO(3) => r_V_4_reg_248_reg_i_2_n_4,
      CO(2) => r_V_4_reg_248_reg_i_2_n_5,
      CO(1) => r_V_4_reg_248_reg_i_2_n_6,
      CO(0) => r_V_4_reg_248_reg_i_2_n_7,
      DI(7 downto 0) => slcvec_pos_ref_V_0_data_reg(7 downto 0),
      O(7 downto 0) => sub_ln731_1_fu_137_p21_out(7 downto 0),
      S(7) => r_V_4_reg_248_reg_i_8_n_0,
      S(6) => r_V_4_reg_248_reg_i_9_n_0,
      S(5) => r_V_4_reg_248_reg_i_10_n_0,
      S(4) => r_V_4_reg_248_reg_i_11_n_0,
      S(3) => r_V_4_reg_248_reg_i_12_n_0,
      S(2) => r_V_4_reg_248_reg_i_13_n_0,
      S(1) => r_V_4_reg_248_reg_i_14_n_0,
      S(0) => r_V_4_reg_248_reg_i_15_n_0
    );
r_V_4_reg_248_reg_i_3: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => slcvec_pos_ref_V_0_data_reg(12),
      I1 => hewindow_pos_ref_V_0_data_reg(12),
      O => r_V_4_reg_248_reg_i_3_n_0
    );
r_V_4_reg_248_reg_i_4: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => slcvec_pos_ref_V_0_data_reg(11),
      I1 => hewindow_pos_ref_V_0_data_reg(11),
      O => r_V_4_reg_248_reg_i_4_n_0
    );
r_V_4_reg_248_reg_i_5: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => slcvec_pos_ref_V_0_data_reg(10),
      I1 => hewindow_pos_ref_V_0_data_reg(10),
      O => r_V_4_reg_248_reg_i_5_n_0
    );
r_V_4_reg_248_reg_i_6: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => slcvec_pos_ref_V_0_data_reg(9),
      I1 => hewindow_pos_ref_V_0_data_reg(9),
      O => r_V_4_reg_248_reg_i_6_n_0
    );
r_V_4_reg_248_reg_i_7: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => slcvec_pos_ref_V_0_data_reg(8),
      I1 => hewindow_pos_ref_V_0_data_reg(8),
      O => r_V_4_reg_248_reg_i_7_n_0
    );
r_V_4_reg_248_reg_i_8: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => slcvec_pos_ref_V_0_data_reg(7),
      I1 => hewindow_pos_ref_V_0_data_reg(7),
      O => r_V_4_reg_248_reg_i_8_n_0
    );
r_V_4_reg_248_reg_i_9: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => slcvec_pos_ref_V_0_data_reg(6),
      I1 => hewindow_pos_ref_V_0_data_reg(6),
      O => r_V_4_reg_248_reg_i_9_n_0
    );
ret_V_reg_253_reg: unisim.vcomponents.DSP48E2
    generic map(
      ACASCREG => 2,
      ADREG => 1,
      ALUMODEREG => 0,
      AMULTSEL => "A",
      AREG => 2,
      AUTORESET_PATDET => "NO_RESET",
      AUTORESET_PRIORITY => "RESET",
      A_INPUT => "DIRECT",
      BCASCREG => 2,
      BMULTSEL => "B",
      BREG => 2,
      B_INPUT => "DIRECT",
      CARRYINREG => 0,
      CARRYINSELREG => 0,
      CREG => 1,
      DREG => 1,
      INMODEREG => 0,
      MASK => X"3FFFFFFFFFFF",
      MREG => 1,
      OPMODEREG => 0,
      PATTERN => X"000000000000",
      PREADDINSEL => "A",
      PREG => 1,
      RND => X"000000000000",
      SEL_MASK => "MASK",
      SEL_PATTERN => "PATTERN",
      USE_MULT => "MULTIPLY",
      USE_PATTERN_DETECT => "NO_PATDET",
      USE_SIMD => "ONE48",
      USE_WIDEXOR => "FALSE",
      XORSIMD => "XOR24_48_96"
    )
        port map (
      A(29) => hw_cos_val_V_read_reg_208(17),
      A(28) => hw_cos_val_V_read_reg_208(17),
      A(27) => hw_cos_val_V_read_reg_208(17),
      A(26) => hw_cos_val_V_read_reg_208(17),
      A(25) => hw_cos_val_V_read_reg_208(17),
      A(24) => hw_cos_val_V_read_reg_208(17),
      A(23) => hw_cos_val_V_read_reg_208(17),
      A(22) => hw_cos_val_V_read_reg_208(17),
      A(21) => hw_cos_val_V_read_reg_208(17),
      A(20) => hw_cos_val_V_read_reg_208(17),
      A(19) => hw_cos_val_V_read_reg_208(17),
      A(18) => hw_cos_val_V_read_reg_208(17),
      A(17 downto 0) => hw_cos_val_V_read_reg_208(17 downto 0),
      ACIN(29 downto 0) => B"000000000000000000000000000000",
      ACOUT(29 downto 0) => NLW_ret_V_reg_253_reg_ACOUT_UNCONNECTED(29 downto 0),
      ALUMODE(3 downto 0) => B"0000",
      B(17) => sub_ln731_reg_218(12),
      B(16) => sub_ln731_reg_218(12),
      B(15) => sub_ln731_reg_218(12),
      B(14 downto 5) => sub_ln731_reg_218(12 downto 3),
      B(4 downto 0) => B"00000",
      BCIN(17 downto 0) => B"000000000000000000",
      BCOUT(17 downto 0) => NLW_ret_V_reg_253_reg_BCOUT_UNCONNECTED(17 downto 0),
      C(47 downto 0) => B"000000000000000000000000000000000000000000000000",
      CARRYCASCIN => '0',
      CARRYCASCOUT => NLW_ret_V_reg_253_reg_CARRYCASCOUT_UNCONNECTED,
      CARRYIN => '0',
      CARRYINSEL(2 downto 0) => B"000",
      CARRYOUT(3 downto 0) => NLW_ret_V_reg_253_reg_CARRYOUT_UNCONNECTED(3 downto 0),
      CEA1 => '1',
      CEA2 => '1',
      CEAD => '0',
      CEALUMODE => '0',
      CEB1 => '1',
      CEB2 => '1',
      CEC => '0',
      CECARRYIN => '0',
      CECTRL => '0',
      CED => '0',
      CEINMODE => '0',
      CEM => '1',
      CEP => ap_enable_reg_pp0_iter5,
      CLK => ap_clk,
      D(26 downto 0) => B"000000000000000000000000000",
      INMODE(4 downto 0) => B"00000",
      MULTSIGNIN => '0',
      MULTSIGNOUT => NLW_ret_V_reg_253_reg_MULTSIGNOUT_UNCONNECTED,
      OPMODE(8 downto 0) => B"000010101",
      OVERFLOW => NLW_ret_V_reg_253_reg_OVERFLOW_UNCONNECTED,
      P(47 downto 34) => NLW_ret_V_reg_253_reg_P_UNCONNECTED(47 downto 34),
      P(33) => ret_V_reg_253_reg_n_72,
      P(32) => ret_V_reg_253_reg_n_73,
      P(31) => ret_V_reg_253_reg_n_74,
      P(30) => ret_V_reg_253_reg_n_75,
      P(29) => ret_V_reg_253_reg_n_76,
      P(28) => ret_V_reg_253_reg_n_77,
      P(27) => ret_V_reg_253_reg_n_78,
      P(26) => ret_V_reg_253_reg_n_79,
      P(25) => ret_V_reg_253_reg_n_80,
      P(24) => ret_V_reg_253_reg_n_81,
      P(23) => ret_V_reg_253_reg_n_82,
      P(22) => ret_V_reg_253_reg_n_83,
      P(21) => ret_V_reg_253_reg_n_84,
      P(20) => ret_V_reg_253_reg_n_85,
      P(19) => ret_V_reg_253_reg_n_86,
      P(18) => ret_V_reg_253_reg_n_87,
      P(17) => ret_V_reg_253_reg_n_88,
      P(16) => ret_V_reg_253_reg_n_89,
      P(15) => ret_V_reg_253_reg_n_90,
      P(14) => ret_V_reg_253_reg_n_91,
      P(13) => ret_V_reg_253_reg_n_92,
      P(12) => ret_V_reg_253_reg_n_93,
      P(11) => ret_V_reg_253_reg_n_94,
      P(10) => ret_V_reg_253_reg_n_95,
      P(9) => ret_V_reg_253_reg_n_96,
      P(8) => ret_V_reg_253_reg_n_97,
      P(7) => ret_V_reg_253_reg_n_98,
      P(6) => ret_V_reg_253_reg_n_99,
      P(5) => ret_V_reg_253_reg_n_100,
      P(4) => ret_V_reg_253_reg_n_101,
      P(3) => ret_V_reg_253_reg_n_102,
      P(2) => ret_V_reg_253_reg_n_103,
      P(1) => ret_V_reg_253_reg_n_104,
      P(0) => ret_V_reg_253_reg_n_105,
      PATTERNBDETECT => NLW_ret_V_reg_253_reg_PATTERNBDETECT_UNCONNECTED,
      PATTERNDETECT => NLW_ret_V_reg_253_reg_PATTERNDETECT_UNCONNECTED,
      PCIN(47) => r_V_4_reg_248_reg_n_106,
      PCIN(46) => r_V_4_reg_248_reg_n_107,
      PCIN(45) => r_V_4_reg_248_reg_n_108,
      PCIN(44) => r_V_4_reg_248_reg_n_109,
      PCIN(43) => r_V_4_reg_248_reg_n_110,
      PCIN(42) => r_V_4_reg_248_reg_n_111,
      PCIN(41) => r_V_4_reg_248_reg_n_112,
      PCIN(40) => r_V_4_reg_248_reg_n_113,
      PCIN(39) => r_V_4_reg_248_reg_n_114,
      PCIN(38) => r_V_4_reg_248_reg_n_115,
      PCIN(37) => r_V_4_reg_248_reg_n_116,
      PCIN(36) => r_V_4_reg_248_reg_n_117,
      PCIN(35) => r_V_4_reg_248_reg_n_118,
      PCIN(34) => r_V_4_reg_248_reg_n_119,
      PCIN(33) => r_V_4_reg_248_reg_n_120,
      PCIN(32) => r_V_4_reg_248_reg_n_121,
      PCIN(31) => r_V_4_reg_248_reg_n_122,
      PCIN(30) => r_V_4_reg_248_reg_n_123,
      PCIN(29) => r_V_4_reg_248_reg_n_124,
      PCIN(28) => r_V_4_reg_248_reg_n_125,
      PCIN(27) => r_V_4_reg_248_reg_n_126,
      PCIN(26) => r_V_4_reg_248_reg_n_127,
      PCIN(25) => r_V_4_reg_248_reg_n_128,
      PCIN(24) => r_V_4_reg_248_reg_n_129,
      PCIN(23) => r_V_4_reg_248_reg_n_130,
      PCIN(22) => r_V_4_reg_248_reg_n_131,
      PCIN(21) => r_V_4_reg_248_reg_n_132,
      PCIN(20) => r_V_4_reg_248_reg_n_133,
      PCIN(19) => r_V_4_reg_248_reg_n_134,
      PCIN(18) => r_V_4_reg_248_reg_n_135,
      PCIN(17) => r_V_4_reg_248_reg_n_136,
      PCIN(16) => r_V_4_reg_248_reg_n_137,
      PCIN(15) => r_V_4_reg_248_reg_n_138,
      PCIN(14) => r_V_4_reg_248_reg_n_139,
      PCIN(13) => r_V_4_reg_248_reg_n_140,
      PCIN(12) => r_V_4_reg_248_reg_n_141,
      PCIN(11) => r_V_4_reg_248_reg_n_142,
      PCIN(10) => r_V_4_reg_248_reg_n_143,
      PCIN(9) => r_V_4_reg_248_reg_n_144,
      PCIN(8) => r_V_4_reg_248_reg_n_145,
      PCIN(7) => r_V_4_reg_248_reg_n_146,
      PCIN(6) => r_V_4_reg_248_reg_n_147,
      PCIN(5) => r_V_4_reg_248_reg_n_148,
      PCIN(4) => r_V_4_reg_248_reg_n_149,
      PCIN(3) => r_V_4_reg_248_reg_n_150,
      PCIN(2) => r_V_4_reg_248_reg_n_151,
      PCIN(1) => r_V_4_reg_248_reg_n_152,
      PCIN(0) => r_V_4_reg_248_reg_n_153,
      PCOUT(47 downto 0) => NLW_ret_V_reg_253_reg_PCOUT_UNCONNECTED(47 downto 0),
      RSTA => '0',
      RSTALLCARRYIN => '0',
      RSTALUMODE => '0',
      RSTB => '0',
      RSTC => '0',
      RSTCTRL => '0',
      RSTD => '0',
      RSTINMODE => '0',
      RSTM => '0',
      RSTP => '0',
      UNDERFLOW => NLW_ret_V_reg_253_reg_UNDERFLOW_UNCONNECTED,
      XOROUT(7 downto 0) => NLW_ret_V_reg_253_reg_XOROUT_UNCONNECTED(7 downto 0)
    );
\roi_seed_r_V_1_data_reg[10]_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => ret_V_reg_253_reg_n_85,
      O => \roi_seed_r_V_1_data_reg[10]_i_2_n_0\
    );
\roi_seed_r_V_1_data_reg[21]_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => ret_V_reg_253_reg_n_72,
      O => \roi_seed_r_V_1_data_reg[21]_i_2_n_0\
    );
\roi_seed_r_V_1_data_reg[21]_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => ret_V_reg_253_reg_n_73,
      O => \roi_seed_r_V_1_data_reg[21]_i_3_n_0\
    );
\roi_seed_r_V_1_data_reg[21]_i_4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => ret_V_reg_253_reg_n_74,
      O => \roi_seed_r_V_1_data_reg[21]_i_4_n_0\
    );
\roi_seed_r_V_1_data_reg[21]_i_5\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => ret_V_reg_253_reg_n_75,
      O => \roi_seed_r_V_1_data_reg[21]_i_5_n_0\
    );
\roi_seed_r_V_1_data_reg[21]_i_6\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => ret_V_reg_253_reg_n_76,
      O => \roi_seed_r_V_1_data_reg[21]_i_6_n_0\
    );
\roi_seed_r_V_1_data_reg[21]_i_7\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => ret_V_reg_253_reg_n_77,
      O => \roi_seed_r_V_1_data_reg[21]_i_7_n_0\
    );
\roi_seed_r_V_1_data_reg[21]_i_8\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => ret_V_reg_253_reg_n_78,
      O => \roi_seed_r_V_1_data_reg[21]_i_8_n_0\
    );
\roi_seed_r_V_1_data_reg_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => ap_enable_reg_pp0_iter6,
      D => ret_V_reg_253_reg_n_89,
      Q => \^roi_seed_r_v\(0),
      R => '0'
    );
\roi_seed_r_V_1_data_reg_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => ap_enable_reg_pp0_iter6,
      D => \roi_seed_r_V_1_data_reg_reg[10]_i_1_n_8\,
      Q => \^roi_seed_r_v\(10),
      R => '0'
    );
\roi_seed_r_V_1_data_reg_reg[10]_i_1\: unisim.vcomponents.CARRY8
     port map (
      CI => '0',
      CI_TOP => '0',
      CO(7) => \roi_seed_r_V_1_data_reg_reg[10]_i_1_n_0\,
      CO(6) => \roi_seed_r_V_1_data_reg_reg[10]_i_1_n_1\,
      CO(5) => \roi_seed_r_V_1_data_reg_reg[10]_i_1_n_2\,
      CO(4) => \roi_seed_r_V_1_data_reg_reg[10]_i_1_n_3\,
      CO(3) => \roi_seed_r_V_1_data_reg_reg[10]_i_1_n_4\,
      CO(2) => \roi_seed_r_V_1_data_reg_reg[10]_i_1_n_5\,
      CO(1) => \roi_seed_r_V_1_data_reg_reg[10]_i_1_n_6\,
      CO(0) => \roi_seed_r_V_1_data_reg_reg[10]_i_1_n_7\,
      DI(7 downto 2) => B"000000",
      DI(1) => ret_V_reg_253_reg_n_85,
      DI(0) => '0',
      O(7) => \roi_seed_r_V_1_data_reg_reg[10]_i_1_n_8\,
      O(6) => \roi_seed_r_V_1_data_reg_reg[10]_i_1_n_9\,
      O(5) => \roi_seed_r_V_1_data_reg_reg[10]_i_1_n_10\,
      O(4) => \roi_seed_r_V_1_data_reg_reg[10]_i_1_n_11\,
      O(3) => \roi_seed_r_V_1_data_reg_reg[10]_i_1_n_12\,
      O(2) => \roi_seed_r_V_1_data_reg_reg[10]_i_1_n_13\,
      O(1) => \roi_seed_r_V_1_data_reg_reg[10]_i_1_n_14\,
      O(0) => \roi_seed_r_V_1_data_reg_reg[10]_i_1_n_15\,
      S(7) => ret_V_reg_253_reg_n_79,
      S(6) => ret_V_reg_253_reg_n_80,
      S(5) => ret_V_reg_253_reg_n_81,
      S(4) => ret_V_reg_253_reg_n_82,
      S(3) => ret_V_reg_253_reg_n_83,
      S(2) => ret_V_reg_253_reg_n_84,
      S(1) => \roi_seed_r_V_1_data_reg[10]_i_2_n_0\,
      S(0) => ret_V_reg_253_reg_n_86
    );
\roi_seed_r_V_1_data_reg_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => ap_enable_reg_pp0_iter6,
      D => \roi_seed_r_V_1_data_reg_reg[21]_i_1_n_15\,
      Q => \^roi_seed_r_v\(11),
      R => '0'
    );
\roi_seed_r_V_1_data_reg_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => ap_enable_reg_pp0_iter6,
      D => \roi_seed_r_V_1_data_reg_reg[21]_i_1_n_14\,
      Q => \^roi_seed_r_v\(12),
      R => '0'
    );
\roi_seed_r_V_1_data_reg_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => ap_enable_reg_pp0_iter6,
      D => \roi_seed_r_V_1_data_reg_reg[21]_i_1_n_13\,
      Q => \^roi_seed_r_v\(13),
      R => '0'
    );
\roi_seed_r_V_1_data_reg_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => ap_enable_reg_pp0_iter6,
      D => \roi_seed_r_V_1_data_reg_reg[21]_i_1_n_12\,
      Q => \^roi_seed_r_v\(14),
      R => '0'
    );
\roi_seed_r_V_1_data_reg_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => ap_enable_reg_pp0_iter6,
      D => \roi_seed_r_V_1_data_reg_reg[21]_i_1_n_11\,
      Q => \^roi_seed_r_v\(15),
      R => '0'
    );
\roi_seed_r_V_1_data_reg_reg[16]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => ap_enable_reg_pp0_iter6,
      D => \roi_seed_r_V_1_data_reg_reg[21]_i_1_n_10\,
      Q => \^roi_seed_r_v\(16),
      R => '0'
    );
\roi_seed_r_V_1_data_reg_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => ap_enable_reg_pp0_iter6,
      D => ret_V_reg_253_reg_n_88,
      Q => \^roi_seed_r_v\(1),
      R => '0'
    );
\roi_seed_r_V_1_data_reg_reg[21]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => ap_enable_reg_pp0_iter6,
      D => RESIZE0,
      Q => \^roi_seed_r_v\(20),
      R => '0'
    );
\roi_seed_r_V_1_data_reg_reg[21]_i_1\: unisim.vcomponents.CARRY8
     port map (
      CI => \roi_seed_r_V_1_data_reg_reg[10]_i_1_n_0\,
      CI_TOP => '0',
      CO(7 downto 6) => \NLW_roi_seed_r_V_1_data_reg_reg[21]_i_1_CO_UNCONNECTED\(7 downto 6),
      CO(5) => \roi_seed_r_V_1_data_reg_reg[21]_i_1_n_2\,
      CO(4) => \roi_seed_r_V_1_data_reg_reg[21]_i_1_n_3\,
      CO(3) => \roi_seed_r_V_1_data_reg_reg[21]_i_1_n_4\,
      CO(2) => \roi_seed_r_V_1_data_reg_reg[21]_i_1_n_5\,
      CO(1) => \roi_seed_r_V_1_data_reg_reg[21]_i_1_n_6\,
      CO(0) => \roi_seed_r_V_1_data_reg_reg[21]_i_1_n_7\,
      DI(7 downto 6) => B"00",
      DI(5) => ret_V_reg_253_reg_n_73,
      DI(4) => ret_V_reg_253_reg_n_74,
      DI(3) => ret_V_reg_253_reg_n_75,
      DI(2) => ret_V_reg_253_reg_n_76,
      DI(1) => ret_V_reg_253_reg_n_77,
      DI(0) => ret_V_reg_253_reg_n_78,
      O(7) => \NLW_roi_seed_r_V_1_data_reg_reg[21]_i_1_O_UNCONNECTED\(7),
      O(6) => RESIZE0,
      O(5) => \roi_seed_r_V_1_data_reg_reg[21]_i_1_n_10\,
      O(4) => \roi_seed_r_V_1_data_reg_reg[21]_i_1_n_11\,
      O(3) => \roi_seed_r_V_1_data_reg_reg[21]_i_1_n_12\,
      O(2) => \roi_seed_r_V_1_data_reg_reg[21]_i_1_n_13\,
      O(1) => \roi_seed_r_V_1_data_reg_reg[21]_i_1_n_14\,
      O(0) => \roi_seed_r_V_1_data_reg_reg[21]_i_1_n_15\,
      S(7) => '0',
      S(6) => \roi_seed_r_V_1_data_reg[21]_i_2_n_0\,
      S(5) => \roi_seed_r_V_1_data_reg[21]_i_3_n_0\,
      S(4) => \roi_seed_r_V_1_data_reg[21]_i_4_n_0\,
      S(3) => \roi_seed_r_V_1_data_reg[21]_i_5_n_0\,
      S(2) => \roi_seed_r_V_1_data_reg[21]_i_6_n_0\,
      S(1) => \roi_seed_r_V_1_data_reg[21]_i_7_n_0\,
      S(0) => \roi_seed_r_V_1_data_reg[21]_i_8_n_0\
    );
\roi_seed_r_V_1_data_reg_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => ap_enable_reg_pp0_iter6,
      D => ret_V_reg_253_reg_n_87,
      Q => \^roi_seed_r_v\(2),
      R => '0'
    );
\roi_seed_r_V_1_data_reg_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => ap_enable_reg_pp0_iter6,
      D => \roi_seed_r_V_1_data_reg_reg[10]_i_1_n_15\,
      Q => \^roi_seed_r_v\(3),
      R => '0'
    );
\roi_seed_r_V_1_data_reg_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => ap_enable_reg_pp0_iter6,
      D => \roi_seed_r_V_1_data_reg_reg[10]_i_1_n_14\,
      Q => \^roi_seed_r_v\(4),
      R => '0'
    );
\roi_seed_r_V_1_data_reg_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => ap_enable_reg_pp0_iter6,
      D => \roi_seed_r_V_1_data_reg_reg[10]_i_1_n_13\,
      Q => \^roi_seed_r_v\(5),
      R => '0'
    );
\roi_seed_r_V_1_data_reg_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => ap_enable_reg_pp0_iter6,
      D => \roi_seed_r_V_1_data_reg_reg[10]_i_1_n_12\,
      Q => \^roi_seed_r_v\(6),
      R => '0'
    );
\roi_seed_r_V_1_data_reg_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => ap_enable_reg_pp0_iter6,
      D => \roi_seed_r_V_1_data_reg_reg[10]_i_1_n_11\,
      Q => \^roi_seed_r_v\(7),
      R => '0'
    );
\roi_seed_r_V_1_data_reg_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => ap_enable_reg_pp0_iter6,
      D => \roi_seed_r_V_1_data_reg_reg[10]_i_1_n_10\,
      Q => \^roi_seed_r_v\(8),
      R => '0'
    );
\roi_seed_r_V_1_data_reg_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => ap_enable_reg_pp0_iter6,
      D => \roi_seed_r_V_1_data_reg_reg[10]_i_1_n_9\,
      Q => \^roi_seed_r_v\(9),
      R => '0'
    );
\slcvec_pos_V_0_data_reg_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => roi_seed_r_V_1_data_reg1,
      D => slcvec_pos_V(0),
      Q => shl_ln_fu_103_p3(3),
      R => '0'
    );
\slcvec_pos_V_0_data_reg_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => roi_seed_r_V_1_data_reg1,
      D => slcvec_pos_V(1),
      Q => shl_ln_fu_103_p3(4),
      R => '0'
    );
\slcvec_pos_V_0_data_reg_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => roi_seed_r_V_1_data_reg1,
      D => slcvec_pos_V(2),
      Q => shl_ln_fu_103_p3(5),
      R => '0'
    );
\slcvec_pos_V_0_data_reg_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => roi_seed_r_V_1_data_reg1,
      D => slcvec_pos_V(3),
      Q => shl_ln_fu_103_p3(6),
      R => '0'
    );
\slcvec_pos_V_0_data_reg_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => roi_seed_r_V_1_data_reg1,
      D => slcvec_pos_V(4),
      Q => shl_ln_fu_103_p3(7),
      R => '0'
    );
\slcvec_pos_V_0_data_reg_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => roi_seed_r_V_1_data_reg1,
      D => slcvec_pos_V(5),
      Q => shl_ln_fu_103_p3(8),
      R => '0'
    );
\slcvec_pos_V_0_data_reg_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => roi_seed_r_V_1_data_reg1,
      D => slcvec_pos_V(6),
      Q => shl_ln_fu_103_p3(9),
      R => '0'
    );
\slcvec_pos_V_0_data_reg_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => roi_seed_r_V_1_data_reg1,
      D => slcvec_pos_V(7),
      Q => shl_ln_fu_103_p3(10),
      R => '0'
    );
\slcvec_pos_V_0_data_reg_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => roi_seed_r_V_1_data_reg1,
      D => slcvec_pos_V(8),
      Q => shl_ln_fu_103_p3(11),
      R => '0'
    );
\slcvec_pos_V_0_data_reg_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => roi_seed_r_V_1_data_reg1,
      D => slcvec_pos_V(9),
      Q => shl_ln_fu_103_p3(12),
      R => '0'
    );
\slcvec_pos_ref_V_0_data_reg_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => roi_seed_r_V_1_data_reg1,
      D => slcvec_pos_ref_V(0),
      Q => slcvec_pos_ref_V_0_data_reg(0),
      R => '0'
    );
\slcvec_pos_ref_V_0_data_reg_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => roi_seed_r_V_1_data_reg1,
      D => slcvec_pos_ref_V(10),
      Q => slcvec_pos_ref_V_0_data_reg(10),
      R => '0'
    );
\slcvec_pos_ref_V_0_data_reg_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => roi_seed_r_V_1_data_reg1,
      D => slcvec_pos_ref_V(11),
      Q => slcvec_pos_ref_V_0_data_reg(11),
      R => '0'
    );
\slcvec_pos_ref_V_0_data_reg_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => roi_seed_r_V_1_data_reg1,
      D => slcvec_pos_ref_V(12),
      Q => slcvec_pos_ref_V_0_data_reg(12),
      R => '0'
    );
\slcvec_pos_ref_V_0_data_reg_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => roi_seed_r_V_1_data_reg1,
      D => slcvec_pos_ref_V(1),
      Q => slcvec_pos_ref_V_0_data_reg(1),
      R => '0'
    );
\slcvec_pos_ref_V_0_data_reg_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => roi_seed_r_V_1_data_reg1,
      D => slcvec_pos_ref_V(2),
      Q => slcvec_pos_ref_V_0_data_reg(2),
      R => '0'
    );
\slcvec_pos_ref_V_0_data_reg_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => roi_seed_r_V_1_data_reg1,
      D => slcvec_pos_ref_V(3),
      Q => slcvec_pos_ref_V_0_data_reg(3),
      R => '0'
    );
\slcvec_pos_ref_V_0_data_reg_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => roi_seed_r_V_1_data_reg1,
      D => slcvec_pos_ref_V(4),
      Q => slcvec_pos_ref_V_0_data_reg(4),
      R => '0'
    );
\slcvec_pos_ref_V_0_data_reg_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => roi_seed_r_V_1_data_reg1,
      D => slcvec_pos_ref_V(5),
      Q => slcvec_pos_ref_V_0_data_reg(5),
      R => '0'
    );
\slcvec_pos_ref_V_0_data_reg_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => roi_seed_r_V_1_data_reg1,
      D => slcvec_pos_ref_V(6),
      Q => slcvec_pos_ref_V_0_data_reg(6),
      R => '0'
    );
\slcvec_pos_ref_V_0_data_reg_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => roi_seed_r_V_1_data_reg1,
      D => slcvec_pos_ref_V(7),
      Q => slcvec_pos_ref_V_0_data_reg(7),
      R => '0'
    );
\slcvec_pos_ref_V_0_data_reg_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => roi_seed_r_V_1_data_reg1,
      D => slcvec_pos_ref_V(8),
      Q => slcvec_pos_ref_V_0_data_reg(8),
      R => '0'
    );
\slcvec_pos_ref_V_0_data_reg_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => roi_seed_r_V_1_data_reg1,
      D => slcvec_pos_ref_V(9),
      Q => slcvec_pos_ref_V_0_data_reg(9),
      R => '0'
    );
\sub_ln731_reg_218[10]_i_10\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"B44B"
    )
        port map (
      I0 => hewindow_pos_V_0_data_reg(5),
      I1 => shl_ln_fu_103_p3(8),
      I2 => hewindow_pos_V_0_data_reg(6),
      I3 => shl_ln_fu_103_p3(9),
      O => \sub_ln731_reg_218[10]_i_10_n_0\
    );
\sub_ln731_reg_218[10]_i_11\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"B44B"
    )
        port map (
      I0 => hewindow_pos_V_0_data_reg(4),
      I1 => shl_ln_fu_103_p3(7),
      I2 => hewindow_pos_V_0_data_reg(5),
      I3 => shl_ln_fu_103_p3(8),
      O => \sub_ln731_reg_218[10]_i_11_n_0\
    );
\sub_ln731_reg_218[10]_i_12\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"B44B"
    )
        port map (
      I0 => hewindow_pos_V_0_data_reg(3),
      I1 => shl_ln_fu_103_p3(6),
      I2 => hewindow_pos_V_0_data_reg(4),
      I3 => shl_ln_fu_103_p3(7),
      O => \sub_ln731_reg_218[10]_i_12_n_0\
    );
\sub_ln731_reg_218[10]_i_13\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"B44B"
    )
        port map (
      I0 => hewindow_pos_V_0_data_reg(2),
      I1 => shl_ln_fu_103_p3(5),
      I2 => hewindow_pos_V_0_data_reg(3),
      I3 => shl_ln_fu_103_p3(6),
      O => \sub_ln731_reg_218[10]_i_13_n_0\
    );
\sub_ln731_reg_218[10]_i_14\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"B44B"
    )
        port map (
      I0 => hewindow_pos_V_0_data_reg(1),
      I1 => shl_ln_fu_103_p3(4),
      I2 => hewindow_pos_V_0_data_reg(2),
      I3 => shl_ln_fu_103_p3(5),
      O => \sub_ln731_reg_218[10]_i_14_n_0\
    );
\sub_ln731_reg_218[10]_i_15\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2DD2"
    )
        port map (
      I0 => hewindow_pos_V_0_data_reg(0),
      I1 => shl_ln_fu_103_p3(3),
      I2 => hewindow_pos_V_0_data_reg(1),
      I3 => shl_ln_fu_103_p3(4),
      O => \sub_ln731_reg_218[10]_i_15_n_0\
    );
\sub_ln731_reg_218[10]_i_16\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => shl_ln_fu_103_p3(3),
      I1 => hewindow_pos_V_0_data_reg(0),
      O => \sub_ln731_reg_218[10]_i_16_n_0\
    );
\sub_ln731_reg_218[10]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => shl_ln_fu_103_p3(9),
      I1 => hewindow_pos_V_0_data_reg(6),
      O => \sub_ln731_reg_218[10]_i_2_n_0\
    );
\sub_ln731_reg_218[10]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => shl_ln_fu_103_p3(8),
      I1 => hewindow_pos_V_0_data_reg(5),
      O => \sub_ln731_reg_218[10]_i_3_n_0\
    );
\sub_ln731_reg_218[10]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => shl_ln_fu_103_p3(7),
      I1 => hewindow_pos_V_0_data_reg(4),
      O => \sub_ln731_reg_218[10]_i_4_n_0\
    );
\sub_ln731_reg_218[10]_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => shl_ln_fu_103_p3(6),
      I1 => hewindow_pos_V_0_data_reg(3),
      O => \sub_ln731_reg_218[10]_i_5_n_0\
    );
\sub_ln731_reg_218[10]_i_6\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => shl_ln_fu_103_p3(5),
      I1 => hewindow_pos_V_0_data_reg(2),
      O => \sub_ln731_reg_218[10]_i_6_n_0\
    );
\sub_ln731_reg_218[10]_i_7\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => shl_ln_fu_103_p3(4),
      I1 => hewindow_pos_V_0_data_reg(1),
      O => \sub_ln731_reg_218[10]_i_7_n_0\
    );
\sub_ln731_reg_218[10]_i_8\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"B"
    )
        port map (
      I0 => shl_ln_fu_103_p3(3),
      I1 => hewindow_pos_V_0_data_reg(0),
      O => \sub_ln731_reg_218[10]_i_8_n_0\
    );
\sub_ln731_reg_218[10]_i_9\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"B44B"
    )
        port map (
      I0 => hewindow_pos_V_0_data_reg(6),
      I1 => shl_ln_fu_103_p3(9),
      I2 => hewindow_pos_V_0_data_reg(7),
      I3 => shl_ln_fu_103_p3(10),
      O => \sub_ln731_reg_218[10]_i_9_n_0\
    );
\sub_ln731_reg_218[12]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => shl_ln_fu_103_p3(10),
      I1 => hewindow_pos_V_0_data_reg(7),
      O => \sub_ln731_reg_218[12]_i_2_n_0\
    );
\sub_ln731_reg_218[12]_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"B44B"
    )
        port map (
      I0 => hewindow_pos_V_0_data_reg(8),
      I1 => shl_ln_fu_103_p3(11),
      I2 => hewindow_pos_V_0_data_reg(9),
      I3 => shl_ln_fu_103_p3(12),
      O => \sub_ln731_reg_218[12]_i_3_n_0\
    );
\sub_ln731_reg_218[12]_i_4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"B44B"
    )
        port map (
      I0 => hewindow_pos_V_0_data_reg(7),
      I1 => shl_ln_fu_103_p3(10),
      I2 => hewindow_pos_V_0_data_reg(8),
      I3 => shl_ln_fu_103_p3(11),
      O => \sub_ln731_reg_218[12]_i_4_n_0\
    );
\sub_ln731_reg_218_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => sub_ln731_fu_123_p20_out(10),
      Q => sub_ln731_reg_218(10),
      R => '0'
    );
\sub_ln731_reg_218_reg[10]_i_1\: unisim.vcomponents.CARRY8
     port map (
      CI => '0',
      CI_TOP => '0',
      CO(7) => \sub_ln731_reg_218_reg[10]_i_1_n_0\,
      CO(6) => \sub_ln731_reg_218_reg[10]_i_1_n_1\,
      CO(5) => \sub_ln731_reg_218_reg[10]_i_1_n_2\,
      CO(4) => \sub_ln731_reg_218_reg[10]_i_1_n_3\,
      CO(3) => \sub_ln731_reg_218_reg[10]_i_1_n_4\,
      CO(2) => \sub_ln731_reg_218_reg[10]_i_1_n_5\,
      CO(1) => \sub_ln731_reg_218_reg[10]_i_1_n_6\,
      CO(0) => \sub_ln731_reg_218_reg[10]_i_1_n_7\,
      DI(7) => \sub_ln731_reg_218[10]_i_2_n_0\,
      DI(6) => \sub_ln731_reg_218[10]_i_3_n_0\,
      DI(5) => \sub_ln731_reg_218[10]_i_4_n_0\,
      DI(4) => \sub_ln731_reg_218[10]_i_5_n_0\,
      DI(3) => \sub_ln731_reg_218[10]_i_6_n_0\,
      DI(2) => \sub_ln731_reg_218[10]_i_7_n_0\,
      DI(1) => \sub_ln731_reg_218[10]_i_8_n_0\,
      DI(0) => '0',
      O(7 downto 0) => sub_ln731_fu_123_p20_out(10 downto 3),
      S(7) => \sub_ln731_reg_218[10]_i_9_n_0\,
      S(6) => \sub_ln731_reg_218[10]_i_10_n_0\,
      S(5) => \sub_ln731_reg_218[10]_i_11_n_0\,
      S(4) => \sub_ln731_reg_218[10]_i_12_n_0\,
      S(3) => \sub_ln731_reg_218[10]_i_13_n_0\,
      S(2) => \sub_ln731_reg_218[10]_i_14_n_0\,
      S(1) => \sub_ln731_reg_218[10]_i_15_n_0\,
      S(0) => \sub_ln731_reg_218[10]_i_16_n_0\
    );
\sub_ln731_reg_218_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => sub_ln731_fu_123_p20_out(11),
      Q => sub_ln731_reg_218(11),
      R => '0'
    );
\sub_ln731_reg_218_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => sub_ln731_fu_123_p20_out(12),
      Q => sub_ln731_reg_218(12),
      R => '0'
    );
\sub_ln731_reg_218_reg[12]_i_1\: unisim.vcomponents.CARRY8
     port map (
      CI => \sub_ln731_reg_218_reg[10]_i_1_n_0\,
      CI_TOP => '0',
      CO(7 downto 1) => \NLW_sub_ln731_reg_218_reg[12]_i_1_CO_UNCONNECTED\(7 downto 1),
      CO(0) => \sub_ln731_reg_218_reg[12]_i_1_n_7\,
      DI(7 downto 1) => B"0000000",
      DI(0) => \sub_ln731_reg_218[12]_i_2_n_0\,
      O(7 downto 2) => \NLW_sub_ln731_reg_218_reg[12]_i_1_O_UNCONNECTED\(7 downto 2),
      O(1 downto 0) => sub_ln731_fu_123_p20_out(12 downto 11),
      S(7 downto 2) => B"000000",
      S(1) => \sub_ln731_reg_218[12]_i_3_n_0\,
      S(0) => \sub_ln731_reg_218[12]_i_4_n_0\
    );
\sub_ln731_reg_218_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => sub_ln731_fu_123_p20_out(3),
      Q => sub_ln731_reg_218(3),
      R => '0'
    );
\sub_ln731_reg_218_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => sub_ln731_fu_123_p20_out(4),
      Q => sub_ln731_reg_218(4),
      R => '0'
    );
\sub_ln731_reg_218_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => sub_ln731_fu_123_p20_out(5),
      Q => sub_ln731_reg_218(5),
      R => '0'
    );
\sub_ln731_reg_218_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => sub_ln731_fu_123_p20_out(6),
      Q => sub_ln731_reg_218(6),
      R => '0'
    );
\sub_ln731_reg_218_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => sub_ln731_fu_123_p20_out(7),
      Q => sub_ln731_reg_218(7),
      R => '0'
    );
\sub_ln731_reg_218_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => sub_ln731_fu_123_p20_out(8),
      Q => sub_ln731_reg_218(8),
      R => '0'
    );
\sub_ln731_reg_218_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => sub_ln731_fu_123_p20_out(9),
      Q => sub_ln731_reg_218(9),
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity hls_calc_LE_r_offset_barrel is
  port (
    ap_clk : in STD_LOGIC;
    ap_rst : in STD_LOGIC;
    ap_start : in STD_LOGIC;
    ap_done : out STD_LOGIC;
    ap_idle : out STD_LOGIC;
    ap_ready : out STD_LOGIC;
    hw_sin_val_V : in STD_LOGIC_VECTOR ( 17 downto 0 );
    hw_cos_val_V : in STD_LOGIC_VECTOR ( 17 downto 0 );
    roi_seed_r_V : out STD_LOGIC_VECTOR ( 21 downto 0 );
    hewindow_pos_ref_V : in STD_LOGIC_VECTOR ( 17 downto 0 );
    hewindow_pos_V : in STD_LOGIC_VECTOR ( 13 downto 0 );
    slcvec_pos_V : in STD_LOGIC_VECTOR ( 13 downto 0 );
    slcvec_pos_ref_V : in STD_LOGIC_VECTOR ( 17 downto 0 )
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of hls_calc_LE_r_offset_barrel : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of hls_calc_LE_r_offset_barrel : entity is "hls_calc_LE_r_offset_barrel,calc_LE_r_offset_barrel,{}";
  attribute downgradeipidentifiedwarnings : string;
  attribute downgradeipidentifiedwarnings of hls_calc_LE_r_offset_barrel : entity is "yes";
  attribute ip_definition_source : string;
  attribute ip_definition_source of hls_calc_LE_r_offset_barrel : entity is "HLS";
  attribute x_core_info : string;
  attribute x_core_info of hls_calc_LE_r_offset_barrel : entity is "calc_LE_r_offset_barrel,Vivado 2019.2.1";
end hls_calc_LE_r_offset_barrel;

architecture STRUCTURE of hls_calc_LE_r_offset_barrel is
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
  attribute x_interface_info of hewindow_pos_V : signal is "xilinx.com:signal:data:1.0 hewindow_pos_V DATA";
  attribute x_interface_parameter of hewindow_pos_V : signal is "XIL_INTERFACENAME hewindow_pos_V, LAYERED_METADATA undef";
  attribute x_interface_info of hewindow_pos_ref_V : signal is "xilinx.com:signal:data:1.0 hewindow_pos_ref_V DATA";
  attribute x_interface_parameter of hewindow_pos_ref_V : signal is "XIL_INTERFACENAME hewindow_pos_ref_V, LAYERED_METADATA undef";
  attribute x_interface_info of hw_cos_val_V : signal is "xilinx.com:signal:data:1.0 hw_cos_val_V DATA";
  attribute x_interface_parameter of hw_cos_val_V : signal is "XIL_INTERFACENAME hw_cos_val_V, LAYERED_METADATA undef";
  attribute x_interface_info of hw_sin_val_V : signal is "xilinx.com:signal:data:1.0 hw_sin_val_V DATA";
  attribute x_interface_parameter of hw_sin_val_V : signal is "XIL_INTERFACENAME hw_sin_val_V, LAYERED_METADATA undef";
  attribute x_interface_info of roi_seed_r_V : signal is "xilinx.com:signal:data:1.0 roi_seed_r_V DATA";
  attribute x_interface_parameter of roi_seed_r_V : signal is "XIL_INTERFACENAME roi_seed_r_V, LAYERED_METADATA undef";
  attribute x_interface_info of slcvec_pos_V : signal is "xilinx.com:signal:data:1.0 slcvec_pos_V DATA";
  attribute x_interface_parameter of slcvec_pos_V : signal is "XIL_INTERFACENAME slcvec_pos_V, LAYERED_METADATA undef";
  attribute x_interface_info of slcvec_pos_ref_V : signal is "xilinx.com:signal:data:1.0 slcvec_pos_ref_V DATA";
  attribute x_interface_parameter of slcvec_pos_ref_V : signal is "XIL_INTERFACENAME slcvec_pos_ref_V, LAYERED_METADATA undef";
begin
U0: entity work.hls_calc_LE_r_offset_barrel_calc_LE_r_offset_barrel
     port map (
      ap_clk => ap_clk,
      ap_done => ap_done,
      ap_idle => ap_idle,
      ap_ready => ap_ready,
      ap_rst => ap_rst,
      ap_start => ap_start,
      hewindow_pos_V(13 downto 0) => hewindow_pos_V(13 downto 0),
      hewindow_pos_ref_V(17 downto 0) => hewindow_pos_ref_V(17 downto 0),
      hw_cos_val_V(17 downto 0) => hw_cos_val_V(17 downto 0),
      hw_sin_val_V(17 downto 0) => hw_sin_val_V(17 downto 0),
      roi_seed_r_V(21 downto 0) => roi_seed_r_V(21 downto 0),
      slcvec_pos_V(13 downto 0) => slcvec_pos_V(13 downto 0),
      slcvec_pos_ref_V(17 downto 0) => slcvec_pos_ref_V(17 downto 0)
    );
end STRUCTURE;

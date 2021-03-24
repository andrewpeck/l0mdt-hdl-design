-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2019.2.1 (lin64) Build 2729669 Thu Dec  5 04:48:12 MST 2019
-- Date        : Sat Mar 20 09:19:18 2021
-- Host        : uciatlaslab.ps.uci.edu running 64-bit CentOS Linux release 7.9.2009 (Core)
-- Command     : write_vhdl -force -mode funcsim
--               /home/psundara/L0MDT/psundara/l0mdt-hdl-design/UserLogic/lsf/IP/ku15p/hls_get_rom_addr/hls_get_rom_addr_sim_netlist.vhdl
-- Design      : hls_get_rom_addr
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xcku15p-ffva1760-2-e
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity hls_get_rom_addr_get_rom_addr is
  port (
    ap_clk : in STD_LOGIC;
    ap_rst : in STD_LOGIC;
    ap_start : in STD_LOGIC;
    ap_done : out STD_LOGIC;
    ap_idle : out STD_LOGIC;
    ap_ready : out STD_LOGIC;
    theta_for_lut_V : in STD_LOGIC_VECTOR ( 13 downto 0 );
    rom_index_V : out STD_LOGIC_VECTOR ( 2 downto 0 );
    lut_start_addr_V : out STD_LOGIC_VECTOR ( 11 downto 0 );
    lbins0_gbl1_V : in STD_LOGIC_VECTOR ( 0 to 0 );
    slcvec_offset_angle_int_V : in STD_LOGIC_VECTOR ( 10 downto 0 );
    slcvec_angle_polar_offset_mrad_V : out STD_LOGIC_VECTOR ( 13 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of hls_get_rom_addr_get_rom_addr : entity is "get_rom_addr";
end hls_get_rom_addr_get_rom_addr;

architecture STRUCTURE of hls_get_rom_addr_get_rom_addr is
  signal \<const0>\ : STD_LOGIC;
  signal \^ap_done\ : STD_LOGIC;
  signal ap_enable_reg_pp0_iter1 : STD_LOGIC;
  signal ap_enable_reg_pp0_iter2 : STD_LOGIC;
  signal ap_phi_reg_pp0_iter2_p_Val2_2_reg_111 : STD_LOGIC_VECTOR ( 13 downto 1 );
  signal \ap_phi_reg_pp0_iter2_p_Val2_2_reg_111[10]_i_1_n_0\ : STD_LOGIC;
  signal \ap_phi_reg_pp0_iter2_p_Val2_2_reg_111[10]_i_2_n_0\ : STD_LOGIC;
  signal \ap_phi_reg_pp0_iter2_p_Val2_2_reg_111[11]_i_1_n_0\ : STD_LOGIC;
  signal \ap_phi_reg_pp0_iter2_p_Val2_2_reg_111[12]_i_1_n_0\ : STD_LOGIC;
  signal \ap_phi_reg_pp0_iter2_p_Val2_2_reg_111[13]_i_1_n_0\ : STD_LOGIC;
  signal \ap_phi_reg_pp0_iter2_p_Val2_2_reg_111[13]_i_2_n_0\ : STD_LOGIC;
  signal \ap_phi_reg_pp0_iter2_p_Val2_2_reg_111[1]_i_1_n_0\ : STD_LOGIC;
  signal \ap_phi_reg_pp0_iter2_p_Val2_2_reg_111[2]_i_1_n_0\ : STD_LOGIC;
  signal \ap_phi_reg_pp0_iter2_p_Val2_2_reg_111[3]_i_1_n_0\ : STD_LOGIC;
  signal \ap_phi_reg_pp0_iter2_p_Val2_2_reg_111[4]_i_1_n_0\ : STD_LOGIC;
  signal \ap_phi_reg_pp0_iter2_p_Val2_2_reg_111[5]_i_1_n_0\ : STD_LOGIC;
  signal \ap_phi_reg_pp0_iter2_p_Val2_2_reg_111[6]_i_1_n_0\ : STD_LOGIC;
  signal \ap_phi_reg_pp0_iter2_p_Val2_2_reg_111[7]_i_1_n_0\ : STD_LOGIC;
  signal \ap_phi_reg_pp0_iter2_p_Val2_2_reg_111[8]_i_1_n_0\ : STD_LOGIC;
  signal \ap_phi_reg_pp0_iter2_p_Val2_2_reg_111[8]_i_2_n_0\ : STD_LOGIC;
  signal \ap_phi_reg_pp0_iter2_p_Val2_2_reg_111[9]_i_1_n_0\ : STD_LOGIC;
  signal \^ap_start\ : STD_LOGIC;
  signal lbins0_gbl1_V_0_data_reg : STD_LOGIC;
  signal lbins0_gbl1_V_read_reg_194 : STD_LOGIC;
  signal \^lut_start_addr_v\ : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal lut_start_addr_V_1_data_reg1 : STD_LOGIC;
  signal \lut_start_addr_V_1_data_reg[10]_i_1_n_0\ : STD_LOGIC;
  signal \lut_start_addr_V_1_data_reg[11]_i_1_n_0\ : STD_LOGIC;
  signal \lut_start_addr_V_1_data_reg[11]_i_2_n_0\ : STD_LOGIC;
  signal \lut_start_addr_V_1_data_reg[11]_i_3_n_0\ : STD_LOGIC;
  signal \lut_start_addr_V_1_data_reg[3]_i_1_n_0\ : STD_LOGIC;
  signal \lut_start_addr_V_1_data_reg[4]_i_1_n_0\ : STD_LOGIC;
  signal \lut_start_addr_V_1_data_reg[5]_i_1_n_0\ : STD_LOGIC;
  signal \lut_start_addr_V_1_data_reg[6]_i_1_n_0\ : STD_LOGIC;
  signal \lut_start_addr_V_1_data_reg[7]_i_1_n_0\ : STD_LOGIC;
  signal \lut_start_addr_V_1_data_reg[8]_i_1_n_0\ : STD_LOGIC;
  signal \lut_start_addr_V_1_data_reg[8]_i_2_n_0\ : STD_LOGIC;
  signal \lut_start_addr_V_1_data_reg[8]_i_3_n_0\ : STD_LOGIC;
  signal \lut_start_addr_V_1_data_reg[9]_i_1_n_0\ : STD_LOGIC;
  signal \lut_start_addr_V_1_data_reg[9]_i_2_n_0\ : STD_LOGIC;
  signal p_0_in : STD_LOGIC_VECTOR ( 13 downto 2 );
  signal p_Val2_s_fu_120_p3 : STD_LOGIC_VECTOR ( 13 downto 3 );
  signal ret_V_1_fu_166_p2 : STD_LOGIC_VECTOR ( 4 to 4 );
  signal \rom_index_V_1_data_reg[1]_i_1_n_0\ : STD_LOGIC;
  signal \rom_index_V_1_data_reg[2]_i_1_n_0\ : STD_LOGIC;
  signal slcvec_angle_polar_o_reg_2030 : STD_LOGIC;
  signal \^slcvec_angle_polar_offset_mrad_v\ : STD_LOGIC_VECTOR ( 13 downto 1 );
  signal slcvec_angle_polar_offset_mrad_V_1_data_reg : STD_LOGIC_VECTOR ( 13 downto 2 );
  signal slcvec_angle_polar_offset_mrad_V_1_data_reg1 : STD_LOGIC;
  signal theta_for_lut_V_0_data_reg : STD_LOGIC_VECTOR ( 13 downto 1 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \ap_phi_reg_pp0_iter2_p_Val2_2_reg_111[11]_i_1\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \ap_phi_reg_pp0_iter2_p_Val2_2_reg_111[12]_i_1\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \ap_phi_reg_pp0_iter2_p_Val2_2_reg_111[13]_i_1\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \ap_phi_reg_pp0_iter2_p_Val2_2_reg_111[2]_i_1\ : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of \ap_phi_reg_pp0_iter2_p_Val2_2_reg_111[3]_i_1\ : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of \ap_phi_reg_pp0_iter2_p_Val2_2_reg_111[4]_i_1\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \ap_phi_reg_pp0_iter2_p_Val2_2_reg_111[8]_i_2\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \lut_start_addr_V_1_data_reg[10]_i_1\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \lut_start_addr_V_1_data_reg[11]_i_1\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \lut_start_addr_V_1_data_reg[3]_i_1\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \lut_start_addr_V_1_data_reg[6]_i_1\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \lut_start_addr_V_1_data_reg[7]_i_1\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \rom_index_V_1_data_reg[0]_i_1\ : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of \rom_index_V_1_data_reg[1]_i_1\ : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of \rom_index_V_1_data_reg[2]_i_1\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \slcvec_angle_polar_o_reg_203[11]_i_1\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \slcvec_angle_polar_o_reg_203[12]_i_1\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \slcvec_angle_polar_o_reg_203[13]_i_2\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \slcvec_angle_polar_o_reg_203[3]_i_1\ : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of \slcvec_angle_polar_o_reg_203[4]_i_1\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \slcvec_angle_polar_o_reg_203[5]_i_1\ : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of \slcvec_angle_polar_o_reg_203[6]_i_1\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \slcvec_angle_polar_o_reg_203[8]_i_1\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \slcvec_angle_polar_o_reg_203[9]_i_1\ : label is "soft_lutpair4";
begin
  \^ap_start\ <= ap_start;
  ap_done <= \^ap_done\;
  ap_ready <= \^ap_start\;
  lut_start_addr_V(11 downto 0) <= \^lut_start_addr_v\(11 downto 0);
  rom_index_V(2 downto 0) <= \^lut_start_addr_v\(2 downto 0);
  slcvec_angle_polar_offset_mrad_V(13 downto 1) <= \^slcvec_angle_polar_offset_mrad_v\(13 downto 1);
  slcvec_angle_polar_offset_mrad_V(0) <= \<const0>\;
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
      I0 => \^ap_done\,
      I1 => ap_enable_reg_pp0_iter2,
      I2 => \^ap_start\,
      I3 => ap_enable_reg_pp0_iter1,
      O => ap_idle
    );
\ap_phi_reg_pp0_iter2_p_Val2_2_reg_111[10]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"B8B8B88BB88BB88B"
    )
        port map (
      I0 => theta_for_lut_V_0_data_reg(10),
      I1 => lbins0_gbl1_V_0_data_reg,
      I2 => p_Val2_s_fu_120_p3(11),
      I3 => p_Val2_s_fu_120_p3(10),
      I4 => \ap_phi_reg_pp0_iter2_p_Val2_2_reg_111[10]_i_2_n_0\,
      I5 => p_Val2_s_fu_120_p3(9),
      O => \ap_phi_reg_pp0_iter2_p_Val2_2_reg_111[10]_i_1_n_0\
    );
\ap_phi_reg_pp0_iter2_p_Val2_2_reg_111[10]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFEA"
    )
        port map (
      I0 => p_Val2_s_fu_120_p3(7),
      I1 => p_Val2_s_fu_120_p3(4),
      I2 => p_Val2_s_fu_120_p3(3),
      I3 => p_Val2_s_fu_120_p3(5),
      I4 => p_Val2_s_fu_120_p3(6),
      I5 => p_Val2_s_fu_120_p3(8),
      O => \ap_phi_reg_pp0_iter2_p_Val2_2_reg_111[10]_i_2_n_0\
    );
\ap_phi_reg_pp0_iter2_p_Val2_2_reg_111[11]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8BB8"
    )
        port map (
      I0 => theta_for_lut_V_0_data_reg(11),
      I1 => lbins0_gbl1_V_0_data_reg,
      I2 => \ap_phi_reg_pp0_iter2_p_Val2_2_reg_111[13]_i_2_n_0\,
      I3 => p_Val2_s_fu_120_p3(12),
      O => \ap_phi_reg_pp0_iter2_p_Val2_2_reg_111[11]_i_1_n_0\
    );
\ap_phi_reg_pp0_iter2_p_Val2_2_reg_111[12]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"8BB8B8B8"
    )
        port map (
      I0 => theta_for_lut_V_0_data_reg(12),
      I1 => lbins0_gbl1_V_0_data_reg,
      I2 => p_Val2_s_fu_120_p3(13),
      I3 => p_Val2_s_fu_120_p3(12),
      I4 => \ap_phi_reg_pp0_iter2_p_Val2_2_reg_111[13]_i_2_n_0\,
      O => \ap_phi_reg_pp0_iter2_p_Val2_2_reg_111[12]_i_1_n_0\
    );
\ap_phi_reg_pp0_iter2_p_Val2_2_reg_111[13]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"8BBBBBBB"
    )
        port map (
      I0 => theta_for_lut_V_0_data_reg(13),
      I1 => lbins0_gbl1_V_0_data_reg,
      I2 => p_Val2_s_fu_120_p3(13),
      I3 => p_Val2_s_fu_120_p3(12),
      I4 => \ap_phi_reg_pp0_iter2_p_Val2_2_reg_111[13]_i_2_n_0\,
      O => \ap_phi_reg_pp0_iter2_p_Val2_2_reg_111[13]_i_1_n_0\
    );
\ap_phi_reg_pp0_iter2_p_Val2_2_reg_111[13]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFAAA8"
    )
        port map (
      I0 => p_Val2_s_fu_120_p3(9),
      I1 => p_Val2_s_fu_120_p3(8),
      I2 => \ap_phi_reg_pp0_iter2_p_Val2_2_reg_111[8]_i_2_n_0\,
      I3 => p_Val2_s_fu_120_p3(7),
      I4 => p_Val2_s_fu_120_p3(10),
      I5 => p_Val2_s_fu_120_p3(11),
      O => \ap_phi_reg_pp0_iter2_p_Val2_2_reg_111[13]_i_2_n_0\
    );
\ap_phi_reg_pp0_iter2_p_Val2_2_reg_111[1]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"CFAA"
    )
        port map (
      I0 => ap_phi_reg_pp0_iter2_p_Val2_2_reg_111(1),
      I1 => theta_for_lut_V_0_data_reg(1),
      I2 => lbins0_gbl1_V_0_data_reg,
      I3 => ap_enable_reg_pp0_iter1,
      O => \ap_phi_reg_pp0_iter2_p_Val2_2_reg_111[1]_i_1_n_0\
    );
\ap_phi_reg_pp0_iter2_p_Val2_2_reg_111[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"8B"
    )
        port map (
      I0 => theta_for_lut_V_0_data_reg(2),
      I1 => lbins0_gbl1_V_0_data_reg,
      I2 => p_Val2_s_fu_120_p3(3),
      O => \ap_phi_reg_pp0_iter2_p_Val2_2_reg_111[2]_i_1_n_0\
    );
\ap_phi_reg_pp0_iter2_p_Val2_2_reg_111[3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8BB8"
    )
        port map (
      I0 => theta_for_lut_V_0_data_reg(3),
      I1 => lbins0_gbl1_V_0_data_reg,
      I2 => p_Val2_s_fu_120_p3(4),
      I3 => p_Val2_s_fu_120_p3(3),
      O => \ap_phi_reg_pp0_iter2_p_Val2_2_reg_111[3]_i_1_n_0\
    );
\ap_phi_reg_pp0_iter2_p_Val2_2_reg_111[4]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8888BBB"
    )
        port map (
      I0 => theta_for_lut_V_0_data_reg(4),
      I1 => lbins0_gbl1_V_0_data_reg,
      I2 => p_Val2_s_fu_120_p3(3),
      I3 => p_Val2_s_fu_120_p3(4),
      I4 => p_Val2_s_fu_120_p3(5),
      O => \ap_phi_reg_pp0_iter2_p_Val2_2_reg_111[4]_i_1_n_0\
    );
\ap_phi_reg_pp0_iter2_p_Val2_2_reg_111[5]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"B8B8B88BB88BB88B"
    )
        port map (
      I0 => theta_for_lut_V_0_data_reg(5),
      I1 => lbins0_gbl1_V_0_data_reg,
      I2 => p_Val2_s_fu_120_p3(6),
      I3 => p_Val2_s_fu_120_p3(5),
      I4 => p_Val2_s_fu_120_p3(3),
      I5 => p_Val2_s_fu_120_p3(4),
      O => \ap_phi_reg_pp0_iter2_p_Val2_2_reg_111[5]_i_1_n_0\
    );
\ap_phi_reg_pp0_iter2_p_Val2_2_reg_111[6]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"B88B"
    )
        port map (
      I0 => theta_for_lut_V_0_data_reg(6),
      I1 => lbins0_gbl1_V_0_data_reg,
      I2 => \ap_phi_reg_pp0_iter2_p_Val2_2_reg_111[8]_i_2_n_0\,
      I3 => p_Val2_s_fu_120_p3(7),
      O => \ap_phi_reg_pp0_iter2_p_Val2_2_reg_111[6]_i_1_n_0\
    );
\ap_phi_reg_pp0_iter2_p_Val2_2_reg_111[7]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"BBB8888B"
    )
        port map (
      I0 => theta_for_lut_V_0_data_reg(7),
      I1 => lbins0_gbl1_V_0_data_reg,
      I2 => p_Val2_s_fu_120_p3(7),
      I3 => \ap_phi_reg_pp0_iter2_p_Val2_2_reg_111[8]_i_2_n_0\,
      I4 => p_Val2_s_fu_120_p3(8),
      O => \ap_phi_reg_pp0_iter2_p_Val2_2_reg_111[7]_i_1_n_0\
    );
\ap_phi_reg_pp0_iter2_p_Val2_2_reg_111[8]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8B8B8B8B8B8B8BB8"
    )
        port map (
      I0 => theta_for_lut_V_0_data_reg(8),
      I1 => lbins0_gbl1_V_0_data_reg,
      I2 => p_Val2_s_fu_120_p3(9),
      I3 => p_Val2_s_fu_120_p3(8),
      I4 => \ap_phi_reg_pp0_iter2_p_Val2_2_reg_111[8]_i_2_n_0\,
      I5 => p_Val2_s_fu_120_p3(7),
      O => \ap_phi_reg_pp0_iter2_p_Val2_2_reg_111[8]_i_1_n_0\
    );
\ap_phi_reg_pp0_iter2_p_Val2_2_reg_111[8]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFF8"
    )
        port map (
      I0 => p_Val2_s_fu_120_p3(4),
      I1 => p_Val2_s_fu_120_p3(3),
      I2 => p_Val2_s_fu_120_p3(5),
      I3 => p_Val2_s_fu_120_p3(6),
      O => \ap_phi_reg_pp0_iter2_p_Val2_2_reg_111[8]_i_2_n_0\
    );
\ap_phi_reg_pp0_iter2_p_Val2_2_reg_111[9]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8888BBB"
    )
        port map (
      I0 => theta_for_lut_V_0_data_reg(9),
      I1 => lbins0_gbl1_V_0_data_reg,
      I2 => \ap_phi_reg_pp0_iter2_p_Val2_2_reg_111[10]_i_2_n_0\,
      I3 => p_Val2_s_fu_120_p3(9),
      I4 => p_Val2_s_fu_120_p3(10),
      O => \ap_phi_reg_pp0_iter2_p_Val2_2_reg_111[9]_i_1_n_0\
    );
\ap_phi_reg_pp0_iter2_p_Val2_2_reg_111_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_enable_reg_pp0_iter1,
      D => \ap_phi_reg_pp0_iter2_p_Val2_2_reg_111[10]_i_1_n_0\,
      Q => ap_phi_reg_pp0_iter2_p_Val2_2_reg_111(10),
      R => '0'
    );
\ap_phi_reg_pp0_iter2_p_Val2_2_reg_111_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_enable_reg_pp0_iter1,
      D => \ap_phi_reg_pp0_iter2_p_Val2_2_reg_111[11]_i_1_n_0\,
      Q => ap_phi_reg_pp0_iter2_p_Val2_2_reg_111(11),
      R => '0'
    );
\ap_phi_reg_pp0_iter2_p_Val2_2_reg_111_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_enable_reg_pp0_iter1,
      D => \ap_phi_reg_pp0_iter2_p_Val2_2_reg_111[12]_i_1_n_0\,
      Q => ap_phi_reg_pp0_iter2_p_Val2_2_reg_111(12),
      R => '0'
    );
\ap_phi_reg_pp0_iter2_p_Val2_2_reg_111_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_enable_reg_pp0_iter1,
      D => \ap_phi_reg_pp0_iter2_p_Val2_2_reg_111[13]_i_1_n_0\,
      Q => ap_phi_reg_pp0_iter2_p_Val2_2_reg_111(13),
      R => '0'
    );
\ap_phi_reg_pp0_iter2_p_Val2_2_reg_111_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => \ap_phi_reg_pp0_iter2_p_Val2_2_reg_111[1]_i_1_n_0\,
      Q => ap_phi_reg_pp0_iter2_p_Val2_2_reg_111(1),
      R => '0'
    );
\ap_phi_reg_pp0_iter2_p_Val2_2_reg_111_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_enable_reg_pp0_iter1,
      D => \ap_phi_reg_pp0_iter2_p_Val2_2_reg_111[2]_i_1_n_0\,
      Q => ap_phi_reg_pp0_iter2_p_Val2_2_reg_111(2),
      R => '0'
    );
\ap_phi_reg_pp0_iter2_p_Val2_2_reg_111_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_enable_reg_pp0_iter1,
      D => \ap_phi_reg_pp0_iter2_p_Val2_2_reg_111[3]_i_1_n_0\,
      Q => ap_phi_reg_pp0_iter2_p_Val2_2_reg_111(3),
      R => '0'
    );
\ap_phi_reg_pp0_iter2_p_Val2_2_reg_111_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_enable_reg_pp0_iter1,
      D => \ap_phi_reg_pp0_iter2_p_Val2_2_reg_111[4]_i_1_n_0\,
      Q => ap_phi_reg_pp0_iter2_p_Val2_2_reg_111(4),
      R => '0'
    );
\ap_phi_reg_pp0_iter2_p_Val2_2_reg_111_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_enable_reg_pp0_iter1,
      D => \ap_phi_reg_pp0_iter2_p_Val2_2_reg_111[5]_i_1_n_0\,
      Q => ap_phi_reg_pp0_iter2_p_Val2_2_reg_111(5),
      R => '0'
    );
\ap_phi_reg_pp0_iter2_p_Val2_2_reg_111_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_enable_reg_pp0_iter1,
      D => \ap_phi_reg_pp0_iter2_p_Val2_2_reg_111[6]_i_1_n_0\,
      Q => ap_phi_reg_pp0_iter2_p_Val2_2_reg_111(6),
      R => '0'
    );
\ap_phi_reg_pp0_iter2_p_Val2_2_reg_111_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_enable_reg_pp0_iter1,
      D => \ap_phi_reg_pp0_iter2_p_Val2_2_reg_111[7]_i_1_n_0\,
      Q => ap_phi_reg_pp0_iter2_p_Val2_2_reg_111(7),
      R => '0'
    );
\ap_phi_reg_pp0_iter2_p_Val2_2_reg_111_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_enable_reg_pp0_iter1,
      D => \ap_phi_reg_pp0_iter2_p_Val2_2_reg_111[8]_i_1_n_0\,
      Q => ap_phi_reg_pp0_iter2_p_Val2_2_reg_111(8),
      R => '0'
    );
\ap_phi_reg_pp0_iter2_p_Val2_2_reg_111_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_enable_reg_pp0_iter1,
      D => \ap_phi_reg_pp0_iter2_p_Val2_2_reg_111[9]_i_1_n_0\,
      Q => ap_phi_reg_pp0_iter2_p_Val2_2_reg_111(9),
      R => '0'
    );
\lbins0_gbl1_V_0_data_reg[0]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => ap_enable_reg_pp0_iter1,
      I1 => \^ap_start\,
      I2 => ap_enable_reg_pp0_iter2,
      I3 => \^ap_done\,
      O => lut_start_addr_V_1_data_reg1
    );
\lbins0_gbl1_V_0_data_reg_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => lut_start_addr_V_1_data_reg1,
      D => lbins0_gbl1_V(0),
      Q => lbins0_gbl1_V_0_data_reg,
      R => '0'
    );
\lbins0_gbl1_V_read_reg_194_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => lbins0_gbl1_V_0_data_reg,
      Q => lbins0_gbl1_V_read_reg_194,
      R => '0'
    );
\lut_start_addr_V_1_data_reg[10]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"C993"
    )
        port map (
      I0 => \lut_start_addr_V_1_data_reg[11]_i_2_n_0\,
      I1 => ap_phi_reg_pp0_iter2_p_Val2_2_reg_111(12),
      I2 => \lut_start_addr_V_1_data_reg[11]_i_3_n_0\,
      I3 => ap_phi_reg_pp0_iter2_p_Val2_2_reg_111(11),
      O => \lut_start_addr_V_1_data_reg[10]_i_1_n_0\
    );
\lut_start_addr_V_1_data_reg[11]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"3333366C"
    )
        port map (
      I0 => \lut_start_addr_V_1_data_reg[11]_i_2_n_0\,
      I1 => ap_phi_reg_pp0_iter2_p_Val2_2_reg_111(13),
      I2 => ap_phi_reg_pp0_iter2_p_Val2_2_reg_111(11),
      I3 => \lut_start_addr_V_1_data_reg[11]_i_3_n_0\,
      I4 => ap_phi_reg_pp0_iter2_p_Val2_2_reg_111(12),
      O => \lut_start_addr_V_1_data_reg[11]_i_1_n_0\
    );
\lut_start_addr_V_1_data_reg[11]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"C8C0C08000000003"
    )
        port map (
      I0 => \lut_start_addr_V_1_data_reg[8]_i_2_n_0\,
      I1 => ap_phi_reg_pp0_iter2_p_Val2_2_reg_111(10),
      I2 => ap_phi_reg_pp0_iter2_p_Val2_2_reg_111(8),
      I3 => \lut_start_addr_V_1_data_reg[8]_i_3_n_0\,
      I4 => ap_phi_reg_pp0_iter2_p_Val2_2_reg_111(7),
      I5 => ap_phi_reg_pp0_iter2_p_Val2_2_reg_111(9),
      O => \lut_start_addr_V_1_data_reg[11]_i_2_n_0\
    );
\lut_start_addr_V_1_data_reg[11]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFFFE"
    )
        port map (
      I0 => ap_phi_reg_pp0_iter2_p_Val2_2_reg_111(9),
      I1 => ap_phi_reg_pp0_iter2_p_Val2_2_reg_111(7),
      I2 => \lut_start_addr_V_1_data_reg[8]_i_3_n_0\,
      I3 => ap_phi_reg_pp0_iter2_p_Val2_2_reg_111(8),
      I4 => ap_phi_reg_pp0_iter2_p_Val2_2_reg_111(10),
      O => \lut_start_addr_V_1_data_reg[11]_i_3_n_0\
    );
\lut_start_addr_V_1_data_reg[3]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"5666AAAA"
    )
        port map (
      I0 => ap_phi_reg_pp0_iter2_p_Val2_2_reg_111(5),
      I1 => ap_phi_reg_pp0_iter2_p_Val2_2_reg_111(3),
      I2 => ap_phi_reg_pp0_iter2_p_Val2_2_reg_111(1),
      I3 => ap_phi_reg_pp0_iter2_p_Val2_2_reg_111(2),
      I4 => ap_phi_reg_pp0_iter2_p_Val2_2_reg_111(4),
      O => \lut_start_addr_V_1_data_reg[3]_i_1_n_0\
    );
\lut_start_addr_V_1_data_reg[4]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"66666AAAAAAAAAAA"
    )
        port map (
      I0 => ap_phi_reg_pp0_iter2_p_Val2_2_reg_111(6),
      I1 => ap_phi_reg_pp0_iter2_p_Val2_2_reg_111(4),
      I2 => ap_phi_reg_pp0_iter2_p_Val2_2_reg_111(2),
      I3 => ap_phi_reg_pp0_iter2_p_Val2_2_reg_111(1),
      I4 => ap_phi_reg_pp0_iter2_p_Val2_2_reg_111(3),
      I5 => ap_phi_reg_pp0_iter2_p_Val2_2_reg_111(5),
      O => \lut_start_addr_V_1_data_reg[4]_i_1_n_0\
    );
\lut_start_addr_V_1_data_reg[5]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"69"
    )
        port map (
      I0 => \lut_start_addr_V_1_data_reg[8]_i_2_n_0\,
      I1 => ap_phi_reg_pp0_iter2_p_Val2_2_reg_111(7),
      I2 => \lut_start_addr_V_1_data_reg[8]_i_3_n_0\,
      O => \lut_start_addr_V_1_data_reg[5]_i_1_n_0\
    );
\lut_start_addr_V_1_data_reg[6]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9336"
    )
        port map (
      I0 => \lut_start_addr_V_1_data_reg[8]_i_2_n_0\,
      I1 => ap_phi_reg_pp0_iter2_p_Val2_2_reg_111(8),
      I2 => \lut_start_addr_V_1_data_reg[8]_i_3_n_0\,
      I3 => ap_phi_reg_pp0_iter2_p_Val2_2_reg_111(7),
      O => \lut_start_addr_V_1_data_reg[6]_i_1_n_0\
    );
\lut_start_addr_V_1_data_reg[7]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"33366CCC"
    )
        port map (
      I0 => \lut_start_addr_V_1_data_reg[8]_i_2_n_0\,
      I1 => ap_phi_reg_pp0_iter2_p_Val2_2_reg_111(9),
      I2 => ap_phi_reg_pp0_iter2_p_Val2_2_reg_111(7),
      I3 => \lut_start_addr_V_1_data_reg[8]_i_3_n_0\,
      I4 => ap_phi_reg_pp0_iter2_p_Val2_2_reg_111(8),
      O => \lut_start_addr_V_1_data_reg[7]_i_1_n_0\
    );
\lut_start_addr_V_1_data_reg[8]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"363C3C6CCCCCCCCC"
    )
        port map (
      I0 => \lut_start_addr_V_1_data_reg[8]_i_2_n_0\,
      I1 => ap_phi_reg_pp0_iter2_p_Val2_2_reg_111(10),
      I2 => ap_phi_reg_pp0_iter2_p_Val2_2_reg_111(8),
      I3 => \lut_start_addr_V_1_data_reg[8]_i_3_n_0\,
      I4 => ap_phi_reg_pp0_iter2_p_Val2_2_reg_111(7),
      I5 => ap_phi_reg_pp0_iter2_p_Val2_2_reg_111(9),
      O => \lut_start_addr_V_1_data_reg[8]_i_1_n_0\
    );
\lut_start_addr_V_1_data_reg[8]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8888800000000001"
    )
        port map (
      I0 => ap_phi_reg_pp0_iter2_p_Val2_2_reg_111(6),
      I1 => ap_phi_reg_pp0_iter2_p_Val2_2_reg_111(4),
      I2 => ap_phi_reg_pp0_iter2_p_Val2_2_reg_111(2),
      I3 => ap_phi_reg_pp0_iter2_p_Val2_2_reg_111(1),
      I4 => ap_phi_reg_pp0_iter2_p_Val2_2_reg_111(3),
      I5 => ap_phi_reg_pp0_iter2_p_Val2_2_reg_111(5),
      O => \lut_start_addr_V_1_data_reg[8]_i_2_n_0\
    );
\lut_start_addr_V_1_data_reg[8]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
        port map (
      I0 => ap_phi_reg_pp0_iter2_p_Val2_2_reg_111(5),
      I1 => ap_phi_reg_pp0_iter2_p_Val2_2_reg_111(3),
      I2 => ap_phi_reg_pp0_iter2_p_Val2_2_reg_111(1),
      I3 => ap_phi_reg_pp0_iter2_p_Val2_2_reg_111(2),
      I4 => ap_phi_reg_pp0_iter2_p_Val2_2_reg_111(4),
      I5 => ap_phi_reg_pp0_iter2_p_Val2_2_reg_111(6),
      O => \lut_start_addr_V_1_data_reg[8]_i_3_n_0\
    );
\lut_start_addr_V_1_data_reg[9]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \lut_start_addr_V_1_data_reg[11]_i_2_n_0\,
      I1 => \lut_start_addr_V_1_data_reg[9]_i_2_n_0\,
      O => \lut_start_addr_V_1_data_reg[9]_i_1_n_0\
    );
\lut_start_addr_V_1_data_reg[9]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000001FFFFFFFE"
    )
        port map (
      I0 => ap_phi_reg_pp0_iter2_p_Val2_2_reg_111(10),
      I1 => ap_phi_reg_pp0_iter2_p_Val2_2_reg_111(8),
      I2 => \lut_start_addr_V_1_data_reg[8]_i_3_n_0\,
      I3 => ap_phi_reg_pp0_iter2_p_Val2_2_reg_111(7),
      I4 => ap_phi_reg_pp0_iter2_p_Val2_2_reg_111(9),
      I5 => ap_phi_reg_pp0_iter2_p_Val2_2_reg_111(11),
      O => \lut_start_addr_V_1_data_reg[9]_i_2_n_0\
    );
\lut_start_addr_V_1_data_reg_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => ap_enable_reg_pp0_iter2,
      D => \lut_start_addr_V_1_data_reg[10]_i_1_n_0\,
      Q => \^lut_start_addr_v\(10),
      R => '0'
    );
\lut_start_addr_V_1_data_reg_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => ap_enable_reg_pp0_iter2,
      D => \lut_start_addr_V_1_data_reg[11]_i_1_n_0\,
      Q => \^lut_start_addr_v\(11),
      R => '0'
    );
\lut_start_addr_V_1_data_reg_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => ap_enable_reg_pp0_iter2,
      D => \lut_start_addr_V_1_data_reg[3]_i_1_n_0\,
      Q => \^lut_start_addr_v\(3),
      R => '0'
    );
\lut_start_addr_V_1_data_reg_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => ap_enable_reg_pp0_iter2,
      D => \lut_start_addr_V_1_data_reg[4]_i_1_n_0\,
      Q => \^lut_start_addr_v\(4),
      R => '0'
    );
\lut_start_addr_V_1_data_reg_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => ap_enable_reg_pp0_iter2,
      D => \lut_start_addr_V_1_data_reg[5]_i_1_n_0\,
      Q => \^lut_start_addr_v\(5),
      R => '0'
    );
\lut_start_addr_V_1_data_reg_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => ap_enable_reg_pp0_iter2,
      D => \lut_start_addr_V_1_data_reg[6]_i_1_n_0\,
      Q => \^lut_start_addr_v\(6),
      R => '0'
    );
\lut_start_addr_V_1_data_reg_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => ap_enable_reg_pp0_iter2,
      D => \lut_start_addr_V_1_data_reg[7]_i_1_n_0\,
      Q => \^lut_start_addr_v\(7),
      R => '0'
    );
\lut_start_addr_V_1_data_reg_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => ap_enable_reg_pp0_iter2,
      D => \lut_start_addr_V_1_data_reg[8]_i_1_n_0\,
      Q => \^lut_start_addr_v\(8),
      R => '0'
    );
\lut_start_addr_V_1_data_reg_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => ap_enable_reg_pp0_iter2,
      D => \lut_start_addr_V_1_data_reg[9]_i_1_n_0\,
      Q => \^lut_start_addr_v\(9),
      R => '0'
    );
\rom_index_V_1_data_reg[0]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => ap_phi_reg_pp0_iter2_p_Val2_2_reg_111(1),
      I1 => ap_phi_reg_pp0_iter2_p_Val2_2_reg_111(2),
      O => ret_V_1_fu_166_p2(4)
    );
\rom_index_V_1_data_reg[1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"95"
    )
        port map (
      I0 => ap_phi_reg_pp0_iter2_p_Val2_2_reg_111(3),
      I1 => ap_phi_reg_pp0_iter2_p_Val2_2_reg_111(1),
      I2 => ap_phi_reg_pp0_iter2_p_Val2_2_reg_111(2),
      O => \rom_index_V_1_data_reg[1]_i_1_n_0\
    );
\rom_index_V_1_data_reg[2]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"556A"
    )
        port map (
      I0 => ap_phi_reg_pp0_iter2_p_Val2_2_reg_111(4),
      I1 => ap_phi_reg_pp0_iter2_p_Val2_2_reg_111(2),
      I2 => ap_phi_reg_pp0_iter2_p_Val2_2_reg_111(1),
      I3 => ap_phi_reg_pp0_iter2_p_Val2_2_reg_111(3),
      O => \rom_index_V_1_data_reg[2]_i_1_n_0\
    );
\rom_index_V_1_data_reg_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => ap_enable_reg_pp0_iter2,
      D => ret_V_1_fu_166_p2(4),
      Q => \^lut_start_addr_v\(0),
      R => '0'
    );
\rom_index_V_1_data_reg_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => ap_enable_reg_pp0_iter2,
      D => \rom_index_V_1_data_reg[1]_i_1_n_0\,
      Q => \^lut_start_addr_v\(1),
      R => '0'
    );
\rom_index_V_1_data_reg_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => ap_enable_reg_pp0_iter2,
      D => \rom_index_V_1_data_reg[2]_i_1_n_0\,
      Q => \^lut_start_addr_v\(2),
      R => '0'
    );
\slcvec_angle_polar_o_reg_203[10]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAAAA999999999"
    )
        port map (
      I0 => p_Val2_s_fu_120_p3(11),
      I1 => p_Val2_s_fu_120_p3(10),
      I2 => p_Val2_s_fu_120_p3(7),
      I3 => \ap_phi_reg_pp0_iter2_p_Val2_2_reg_111[8]_i_2_n_0\,
      I4 => p_Val2_s_fu_120_p3(8),
      I5 => p_Val2_s_fu_120_p3(9),
      O => p_0_in(10)
    );
\slcvec_angle_polar_o_reg_203[11]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \ap_phi_reg_pp0_iter2_p_Val2_2_reg_111[13]_i_2_n_0\,
      I1 => p_Val2_s_fu_120_p3(12),
      O => p_0_in(11)
    );
\slcvec_angle_polar_o_reg_203[12]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"6A"
    )
        port map (
      I0 => p_Val2_s_fu_120_p3(13),
      I1 => p_Val2_s_fu_120_p3(12),
      I2 => \ap_phi_reg_pp0_iter2_p_Val2_2_reg_111[13]_i_2_n_0\,
      O => p_0_in(12)
    );
\slcvec_angle_polar_o_reg_203[13]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => lbins0_gbl1_V_0_data_reg,
      O => slcvec_angle_polar_o_reg_2030
    );
\slcvec_angle_polar_o_reg_203[13]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"7F"
    )
        port map (
      I0 => p_Val2_s_fu_120_p3(13),
      I1 => p_Val2_s_fu_120_p3(12),
      I2 => \ap_phi_reg_pp0_iter2_p_Val2_2_reg_111[13]_i_2_n_0\,
      O => p_0_in(13)
    );
\slcvec_angle_polar_o_reg_203[2]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => p_Val2_s_fu_120_p3(3),
      O => p_0_in(2)
    );
\slcvec_angle_polar_o_reg_203[3]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => p_Val2_s_fu_120_p3(4),
      I1 => p_Val2_s_fu_120_p3(3),
      O => p_0_in(3)
    );
\slcvec_angle_polar_o_reg_203[4]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"87"
    )
        port map (
      I0 => p_Val2_s_fu_120_p3(3),
      I1 => p_Val2_s_fu_120_p3(4),
      I2 => p_Val2_s_fu_120_p3(5),
      O => p_0_in(4)
    );
\slcvec_angle_polar_o_reg_203[5]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"A999"
    )
        port map (
      I0 => p_Val2_s_fu_120_p3(6),
      I1 => p_Val2_s_fu_120_p3(5),
      I2 => p_Val2_s_fu_120_p3(3),
      I3 => p_Val2_s_fu_120_p3(4),
      O => p_0_in(5)
    );
\slcvec_angle_polar_o_reg_203[6]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FEEE0111"
    )
        port map (
      I0 => p_Val2_s_fu_120_p3(6),
      I1 => p_Val2_s_fu_120_p3(5),
      I2 => p_Val2_s_fu_120_p3(3),
      I3 => p_Val2_s_fu_120_p3(4),
      I4 => p_Val2_s_fu_120_p3(7),
      O => p_0_in(6)
    );
\slcvec_angle_polar_o_reg_203[7]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFEA00000015"
    )
        port map (
      I0 => p_Val2_s_fu_120_p3(7),
      I1 => p_Val2_s_fu_120_p3(4),
      I2 => p_Val2_s_fu_120_p3(3),
      I3 => p_Val2_s_fu_120_p3(5),
      I4 => p_Val2_s_fu_120_p3(6),
      I5 => p_Val2_s_fu_120_p3(8),
      O => p_0_in(7)
    );
\slcvec_angle_polar_o_reg_203[8]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"5556"
    )
        port map (
      I0 => p_Val2_s_fu_120_p3(9),
      I1 => p_Val2_s_fu_120_p3(8),
      I2 => \ap_phi_reg_pp0_iter2_p_Val2_2_reg_111[8]_i_2_n_0\,
      I3 => p_Val2_s_fu_120_p3(7),
      O => p_0_in(8)
    );
\slcvec_angle_polar_o_reg_203[9]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FE0001FF"
    )
        port map (
      I0 => p_Val2_s_fu_120_p3(7),
      I1 => \ap_phi_reg_pp0_iter2_p_Val2_2_reg_111[8]_i_2_n_0\,
      I2 => p_Val2_s_fu_120_p3(8),
      I3 => p_Val2_s_fu_120_p3(9),
      I4 => p_Val2_s_fu_120_p3(10),
      O => p_0_in(9)
    );
\slcvec_angle_polar_o_reg_203_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => slcvec_angle_polar_o_reg_2030,
      D => p_0_in(10),
      Q => slcvec_angle_polar_offset_mrad_V_1_data_reg(10),
      R => '0'
    );
\slcvec_angle_polar_o_reg_203_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => slcvec_angle_polar_o_reg_2030,
      D => p_0_in(11),
      Q => slcvec_angle_polar_offset_mrad_V_1_data_reg(11),
      R => '0'
    );
\slcvec_angle_polar_o_reg_203_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => slcvec_angle_polar_o_reg_2030,
      D => p_0_in(12),
      Q => slcvec_angle_polar_offset_mrad_V_1_data_reg(12),
      R => '0'
    );
\slcvec_angle_polar_o_reg_203_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => slcvec_angle_polar_o_reg_2030,
      D => p_0_in(13),
      Q => slcvec_angle_polar_offset_mrad_V_1_data_reg(13),
      R => '0'
    );
\slcvec_angle_polar_o_reg_203_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => slcvec_angle_polar_o_reg_2030,
      D => p_0_in(2),
      Q => slcvec_angle_polar_offset_mrad_V_1_data_reg(2),
      R => '0'
    );
\slcvec_angle_polar_o_reg_203_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => slcvec_angle_polar_o_reg_2030,
      D => p_0_in(3),
      Q => slcvec_angle_polar_offset_mrad_V_1_data_reg(3),
      R => '0'
    );
\slcvec_angle_polar_o_reg_203_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => slcvec_angle_polar_o_reg_2030,
      D => p_0_in(4),
      Q => slcvec_angle_polar_offset_mrad_V_1_data_reg(4),
      R => '0'
    );
\slcvec_angle_polar_o_reg_203_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => slcvec_angle_polar_o_reg_2030,
      D => p_0_in(5),
      Q => slcvec_angle_polar_offset_mrad_V_1_data_reg(5),
      R => '0'
    );
\slcvec_angle_polar_o_reg_203_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => slcvec_angle_polar_o_reg_2030,
      D => p_0_in(6),
      Q => slcvec_angle_polar_offset_mrad_V_1_data_reg(6),
      R => '0'
    );
\slcvec_angle_polar_o_reg_203_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => slcvec_angle_polar_o_reg_2030,
      D => p_0_in(7),
      Q => slcvec_angle_polar_offset_mrad_V_1_data_reg(7),
      R => '0'
    );
\slcvec_angle_polar_o_reg_203_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => slcvec_angle_polar_o_reg_2030,
      D => p_0_in(8),
      Q => slcvec_angle_polar_offset_mrad_V_1_data_reg(8),
      R => '0'
    );
\slcvec_angle_polar_o_reg_203_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => slcvec_angle_polar_o_reg_2030,
      D => p_0_in(9),
      Q => slcvec_angle_polar_offset_mrad_V_1_data_reg(9),
      R => '0'
    );
\slcvec_angle_polar_offset_mrad_V_1_data_reg[13]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => ap_enable_reg_pp0_iter2,
      I1 => lbins0_gbl1_V_read_reg_194,
      O => slcvec_angle_polar_offset_mrad_V_1_data_reg1
    );
\slcvec_angle_polar_offset_mrad_V_1_data_reg_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => slcvec_angle_polar_offset_mrad_V_1_data_reg1,
      D => slcvec_angle_polar_offset_mrad_V_1_data_reg(10),
      Q => \^slcvec_angle_polar_offset_mrad_v\(10),
      R => '0'
    );
\slcvec_angle_polar_offset_mrad_V_1_data_reg_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => slcvec_angle_polar_offset_mrad_V_1_data_reg1,
      D => slcvec_angle_polar_offset_mrad_V_1_data_reg(11),
      Q => \^slcvec_angle_polar_offset_mrad_v\(11),
      R => '0'
    );
\slcvec_angle_polar_offset_mrad_V_1_data_reg_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => slcvec_angle_polar_offset_mrad_V_1_data_reg1,
      D => slcvec_angle_polar_offset_mrad_V_1_data_reg(12),
      Q => \^slcvec_angle_polar_offset_mrad_v\(12),
      R => '0'
    );
\slcvec_angle_polar_offset_mrad_V_1_data_reg_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => slcvec_angle_polar_offset_mrad_V_1_data_reg1,
      D => slcvec_angle_polar_offset_mrad_V_1_data_reg(13),
      Q => \^slcvec_angle_polar_offset_mrad_v\(13),
      R => '0'
    );
\slcvec_angle_polar_offset_mrad_V_1_data_reg_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => slcvec_angle_polar_offset_mrad_V_1_data_reg1,
      D => '1',
      Q => \^slcvec_angle_polar_offset_mrad_v\(1),
      R => '0'
    );
\slcvec_angle_polar_offset_mrad_V_1_data_reg_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => slcvec_angle_polar_offset_mrad_V_1_data_reg1,
      D => slcvec_angle_polar_offset_mrad_V_1_data_reg(2),
      Q => \^slcvec_angle_polar_offset_mrad_v\(2),
      R => '0'
    );
\slcvec_angle_polar_offset_mrad_V_1_data_reg_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => slcvec_angle_polar_offset_mrad_V_1_data_reg1,
      D => slcvec_angle_polar_offset_mrad_V_1_data_reg(3),
      Q => \^slcvec_angle_polar_offset_mrad_v\(3),
      R => '0'
    );
\slcvec_angle_polar_offset_mrad_V_1_data_reg_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => slcvec_angle_polar_offset_mrad_V_1_data_reg1,
      D => slcvec_angle_polar_offset_mrad_V_1_data_reg(4),
      Q => \^slcvec_angle_polar_offset_mrad_v\(4),
      R => '0'
    );
\slcvec_angle_polar_offset_mrad_V_1_data_reg_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => slcvec_angle_polar_offset_mrad_V_1_data_reg1,
      D => slcvec_angle_polar_offset_mrad_V_1_data_reg(5),
      Q => \^slcvec_angle_polar_offset_mrad_v\(5),
      R => '0'
    );
\slcvec_angle_polar_offset_mrad_V_1_data_reg_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => slcvec_angle_polar_offset_mrad_V_1_data_reg1,
      D => slcvec_angle_polar_offset_mrad_V_1_data_reg(6),
      Q => \^slcvec_angle_polar_offset_mrad_v\(6),
      R => '0'
    );
\slcvec_angle_polar_offset_mrad_V_1_data_reg_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => slcvec_angle_polar_offset_mrad_V_1_data_reg1,
      D => slcvec_angle_polar_offset_mrad_V_1_data_reg(7),
      Q => \^slcvec_angle_polar_offset_mrad_v\(7),
      R => '0'
    );
\slcvec_angle_polar_offset_mrad_V_1_data_reg_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => slcvec_angle_polar_offset_mrad_V_1_data_reg1,
      D => slcvec_angle_polar_offset_mrad_V_1_data_reg(8),
      Q => \^slcvec_angle_polar_offset_mrad_v\(8),
      R => '0'
    );
\slcvec_angle_polar_offset_mrad_V_1_data_reg_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => slcvec_angle_polar_offset_mrad_V_1_data_reg1,
      D => slcvec_angle_polar_offset_mrad_V_1_data_reg(9),
      Q => \^slcvec_angle_polar_offset_mrad_v\(9),
      R => '0'
    );
\slcvec_offset_angle_int_V_0_data_reg_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => lut_start_addr_V_1_data_reg1,
      D => slcvec_offset_angle_int_V(0),
      Q => p_Val2_s_fu_120_p3(3),
      R => '0'
    );
\slcvec_offset_angle_int_V_0_data_reg_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => lut_start_addr_V_1_data_reg1,
      D => slcvec_offset_angle_int_V(10),
      Q => p_Val2_s_fu_120_p3(13),
      R => '0'
    );
\slcvec_offset_angle_int_V_0_data_reg_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => lut_start_addr_V_1_data_reg1,
      D => slcvec_offset_angle_int_V(1),
      Q => p_Val2_s_fu_120_p3(4),
      R => '0'
    );
\slcvec_offset_angle_int_V_0_data_reg_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => lut_start_addr_V_1_data_reg1,
      D => slcvec_offset_angle_int_V(2),
      Q => p_Val2_s_fu_120_p3(5),
      R => '0'
    );
\slcvec_offset_angle_int_V_0_data_reg_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => lut_start_addr_V_1_data_reg1,
      D => slcvec_offset_angle_int_V(3),
      Q => p_Val2_s_fu_120_p3(6),
      R => '0'
    );
\slcvec_offset_angle_int_V_0_data_reg_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => lut_start_addr_V_1_data_reg1,
      D => slcvec_offset_angle_int_V(4),
      Q => p_Val2_s_fu_120_p3(7),
      R => '0'
    );
\slcvec_offset_angle_int_V_0_data_reg_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => lut_start_addr_V_1_data_reg1,
      D => slcvec_offset_angle_int_V(5),
      Q => p_Val2_s_fu_120_p3(8),
      R => '0'
    );
\slcvec_offset_angle_int_V_0_data_reg_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => lut_start_addr_V_1_data_reg1,
      D => slcvec_offset_angle_int_V(6),
      Q => p_Val2_s_fu_120_p3(9),
      R => '0'
    );
\slcvec_offset_angle_int_V_0_data_reg_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => lut_start_addr_V_1_data_reg1,
      D => slcvec_offset_angle_int_V(7),
      Q => p_Val2_s_fu_120_p3(10),
      R => '0'
    );
\slcvec_offset_angle_int_V_0_data_reg_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => lut_start_addr_V_1_data_reg1,
      D => slcvec_offset_angle_int_V(8),
      Q => p_Val2_s_fu_120_p3(11),
      R => '0'
    );
\slcvec_offset_angle_int_V_0_data_reg_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => lut_start_addr_V_1_data_reg1,
      D => slcvec_offset_angle_int_V(9),
      Q => p_Val2_s_fu_120_p3(12),
      R => '0'
    );
\theta_for_lut_V_0_data_reg_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => lut_start_addr_V_1_data_reg1,
      D => theta_for_lut_V(10),
      Q => theta_for_lut_V_0_data_reg(10),
      R => '0'
    );
\theta_for_lut_V_0_data_reg_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => lut_start_addr_V_1_data_reg1,
      D => theta_for_lut_V(11),
      Q => theta_for_lut_V_0_data_reg(11),
      R => '0'
    );
\theta_for_lut_V_0_data_reg_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => lut_start_addr_V_1_data_reg1,
      D => theta_for_lut_V(12),
      Q => theta_for_lut_V_0_data_reg(12),
      R => '0'
    );
\theta_for_lut_V_0_data_reg_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => lut_start_addr_V_1_data_reg1,
      D => theta_for_lut_V(13),
      Q => theta_for_lut_V_0_data_reg(13),
      R => '0'
    );
\theta_for_lut_V_0_data_reg_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => lut_start_addr_V_1_data_reg1,
      D => theta_for_lut_V(1),
      Q => theta_for_lut_V_0_data_reg(1),
      R => '0'
    );
\theta_for_lut_V_0_data_reg_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => lut_start_addr_V_1_data_reg1,
      D => theta_for_lut_V(2),
      Q => theta_for_lut_V_0_data_reg(2),
      R => '0'
    );
\theta_for_lut_V_0_data_reg_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => lut_start_addr_V_1_data_reg1,
      D => theta_for_lut_V(3),
      Q => theta_for_lut_V_0_data_reg(3),
      R => '0'
    );
\theta_for_lut_V_0_data_reg_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => lut_start_addr_V_1_data_reg1,
      D => theta_for_lut_V(4),
      Q => theta_for_lut_V_0_data_reg(4),
      R => '0'
    );
\theta_for_lut_V_0_data_reg_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => lut_start_addr_V_1_data_reg1,
      D => theta_for_lut_V(5),
      Q => theta_for_lut_V_0_data_reg(5),
      R => '0'
    );
\theta_for_lut_V_0_data_reg_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => lut_start_addr_V_1_data_reg1,
      D => theta_for_lut_V(6),
      Q => theta_for_lut_V_0_data_reg(6),
      R => '0'
    );
\theta_for_lut_V_0_data_reg_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => lut_start_addr_V_1_data_reg1,
      D => theta_for_lut_V(7),
      Q => theta_for_lut_V_0_data_reg(7),
      R => '0'
    );
\theta_for_lut_V_0_data_reg_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => lut_start_addr_V_1_data_reg1,
      D => theta_for_lut_V(8),
      Q => theta_for_lut_V_0_data_reg(8),
      R => '0'
    );
\theta_for_lut_V_0_data_reg_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => lut_start_addr_V_1_data_reg1,
      D => theta_for_lut_V(9),
      Q => theta_for_lut_V_0_data_reg(9),
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity hls_get_rom_addr is
  port (
    ap_clk : in STD_LOGIC;
    ap_rst : in STD_LOGIC;
    ap_start : in STD_LOGIC;
    ap_done : out STD_LOGIC;
    ap_idle : out STD_LOGIC;
    ap_ready : out STD_LOGIC;
    theta_for_lut_V : in STD_LOGIC_VECTOR ( 13 downto 0 );
    rom_index_V : out STD_LOGIC_VECTOR ( 2 downto 0 );
    lut_start_addr_V : out STD_LOGIC_VECTOR ( 11 downto 0 );
    lbins0_gbl1_V : in STD_LOGIC_VECTOR ( 0 to 0 );
    slcvec_offset_angle_int_V : in STD_LOGIC_VECTOR ( 10 downto 0 );
    slcvec_angle_polar_offset_mrad_V : out STD_LOGIC_VECTOR ( 13 downto 0 )
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of hls_get_rom_addr : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of hls_get_rom_addr : entity is "hls_get_rom_addr,get_rom_addr,{}";
  attribute downgradeipidentifiedwarnings : string;
  attribute downgradeipidentifiedwarnings of hls_get_rom_addr : entity is "yes";
  attribute ip_definition_source : string;
  attribute ip_definition_source of hls_get_rom_addr : entity is "HLS";
  attribute x_core_info : string;
  attribute x_core_info of hls_get_rom_addr : entity is "get_rom_addr,Vivado 2019.2.1";
end hls_get_rom_addr;

architecture STRUCTURE of hls_get_rom_addr is
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
  attribute x_interface_info of lbins0_gbl1_V : signal is "xilinx.com:signal:data:1.0 lbins0_gbl1_V DATA";
  attribute x_interface_parameter of lbins0_gbl1_V : signal is "XIL_INTERFACENAME lbins0_gbl1_V, LAYERED_METADATA undef";
  attribute x_interface_info of lut_start_addr_V : signal is "xilinx.com:signal:data:1.0 lut_start_addr_V DATA";
  attribute x_interface_parameter of lut_start_addr_V : signal is "XIL_INTERFACENAME lut_start_addr_V, LAYERED_METADATA undef";
  attribute x_interface_info of rom_index_V : signal is "xilinx.com:signal:data:1.0 rom_index_V DATA";
  attribute x_interface_parameter of rom_index_V : signal is "XIL_INTERFACENAME rom_index_V, LAYERED_METADATA undef";
  attribute x_interface_info of slcvec_angle_polar_offset_mrad_V : signal is "xilinx.com:signal:data:1.0 slcvec_angle_polar_offset_mrad_V DATA";
  attribute x_interface_parameter of slcvec_angle_polar_offset_mrad_V : signal is "XIL_INTERFACENAME slcvec_angle_polar_offset_mrad_V, LAYERED_METADATA undef";
  attribute x_interface_info of slcvec_offset_angle_int_V : signal is "xilinx.com:signal:data:1.0 slcvec_offset_angle_int_V DATA";
  attribute x_interface_parameter of slcvec_offset_angle_int_V : signal is "XIL_INTERFACENAME slcvec_offset_angle_int_V, LAYERED_METADATA undef";
  attribute x_interface_info of theta_for_lut_V : signal is "xilinx.com:signal:data:1.0 theta_for_lut_V DATA";
  attribute x_interface_parameter of theta_for_lut_V : signal is "XIL_INTERFACENAME theta_for_lut_V, LAYERED_METADATA undef";
begin
U0: entity work.hls_get_rom_addr_get_rom_addr
     port map (
      ap_clk => ap_clk,
      ap_done => ap_done,
      ap_idle => ap_idle,
      ap_ready => ap_ready,
      ap_rst => ap_rst,
      ap_start => ap_start,
      lbins0_gbl1_V(0) => lbins0_gbl1_V(0),
      lut_start_addr_V(11 downto 0) => lut_start_addr_V(11 downto 0),
      rom_index_V(2 downto 0) => rom_index_V(2 downto 0),
      slcvec_angle_polar_offset_mrad_V(13 downto 0) => slcvec_angle_polar_offset_mrad_V(13 downto 0),
      slcvec_offset_angle_int_V(10 downto 0) => slcvec_offset_angle_int_V(10 downto 0),
      theta_for_lut_V(13 downto 0) => theta_for_lut_V(13 downto 0)
    );
end STRUCTURE;

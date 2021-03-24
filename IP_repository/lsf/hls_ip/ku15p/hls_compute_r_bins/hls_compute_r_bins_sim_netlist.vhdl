-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2019.2.1 (lin64) Build 2729669 Thu Dec  5 04:48:12 MST 2019
-- Date        : Sat Mar 20 09:19:21 2021
-- Host        : uciatlaslab.ps.uci.edu running 64-bit CentOS Linux release 7.9.2009 (Core)
-- Command     : write_vhdl -force -mode funcsim
--               /home/psundara/L0MDT/psundara/l0mdt-hdl-design/UserLogic/lsf/IP/ku15p/hls_compute_r_bins/hls_compute_r_bins_sim_netlist.vhdl
-- Design      : hls_compute_r_bins
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xcku15p-ffva1760-2-e
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity hls_compute_r_bins_xil_defaultlib_ibuf is
  port (
    ap_enable_reg_pp0_iter0 : out STD_LOGIC;
    mdt_r_offset_V_TREADY : out STD_LOGIC;
    Q : out STD_LOGIC_VECTOR ( 0 to 0 );
    D : out STD_LOGIC_VECTOR ( 12 downto 0 );
    ap_start : in STD_LOGIC;
    ap_enable_reg_pp0_iter0_reg_reg : in STD_LOGIC_VECTOR ( 0 to 0 );
    ap_enable_reg_pp0_iter0_reg : in STD_LOGIC;
    \ireg_reg[24]_0\ : in STD_LOGIC_VECTOR ( 12 downto 0 );
    ap_rst_n : in STD_LOGIC;
    \ireg_reg[0]_0\ : in STD_LOGIC;
    \ireg_reg[0]_1\ : in STD_LOGIC_VECTOR ( 0 to 0 );
    \ireg_reg[0]_2\ : in STD_LOGIC;
    \ireg_reg[24]_1\ : in STD_LOGIC_VECTOR ( 0 to 0 );
    ap_clk : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of hls_compute_r_bins_xil_defaultlib_ibuf : entity is "xil_defaultlib_ibuf";
end hls_compute_r_bins_xil_defaultlib_ibuf;

architecture STRUCTURE of hls_compute_r_bins_xil_defaultlib_ibuf is
  signal \^q\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \^ap_enable_reg_pp0_iter0\ : STD_LOGIC;
  signal ireg01_out : STD_LOGIC;
  signal \ireg_reg_n_0_[0]\ : STD_LOGIC;
  signal \ireg_reg_n_0_[10]\ : STD_LOGIC;
  signal \ireg_reg_n_0_[11]\ : STD_LOGIC;
  signal \ireg_reg_n_0_[1]\ : STD_LOGIC;
  signal \ireg_reg_n_0_[2]\ : STD_LOGIC;
  signal \ireg_reg_n_0_[3]\ : STD_LOGIC;
  signal \ireg_reg_n_0_[4]\ : STD_LOGIC;
  signal \ireg_reg_n_0_[5]\ : STD_LOGIC;
  signal \ireg_reg_n_0_[6]\ : STD_LOGIC;
  signal \ireg_reg_n_0_[7]\ : STD_LOGIC;
  signal \ireg_reg_n_0_[8]\ : STD_LOGIC;
  signal \ireg_reg_n_0_[9]\ : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of mdt_r_offset_V_TREADY_INST_0 : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \odata_int[0]_i_1\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \odata_int[10]_i_1\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \odata_int[11]_i_1\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \odata_int[1]_i_1\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \odata_int[24]_i_2\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \odata_int[2]_i_1\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \odata_int[3]_i_1\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \odata_int[4]_i_1\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \odata_int[5]_i_1\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \odata_int[6]_i_1__0\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \odata_int[7]_i_1\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \odata_int[8]_i_1\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \odata_int[9]_i_1\ : label is "soft_lutpair2";
begin
  Q(0) <= \^q\(0);
  ap_enable_reg_pp0_iter0 <= \^ap_enable_reg_pp0_iter0\;
ap_enable_reg_pp0_iter1_i_2: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ap_start,
      I1 => ap_enable_reg_pp0_iter0_reg_reg(0),
      I2 => ap_enable_reg_pp0_iter0_reg,
      O => \^ap_enable_reg_pp0_iter0\
    );
\ireg[24]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"40005050"
    )
        port map (
      I0 => \^q\(0),
      I1 => \ireg_reg[0]_0\,
      I2 => \ireg_reg[0]_1\(0),
      I3 => \ireg_reg[0]_2\,
      I4 => \^ap_enable_reg_pp0_iter0\,
      O => ireg01_out
    );
\ireg_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => ireg01_out,
      D => \ireg_reg[24]_0\(0),
      Q => \ireg_reg_n_0_[0]\,
      R => \ireg_reg[24]_1\(0)
    );
\ireg_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => ireg01_out,
      D => \ireg_reg[24]_0\(10),
      Q => \ireg_reg_n_0_[10]\,
      R => \ireg_reg[24]_1\(0)
    );
\ireg_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => ireg01_out,
      D => \ireg_reg[24]_0\(11),
      Q => \ireg_reg_n_0_[11]\,
      R => \ireg_reg[24]_1\(0)
    );
\ireg_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => ireg01_out,
      D => \ireg_reg[24]_0\(1),
      Q => \ireg_reg_n_0_[1]\,
      R => \ireg_reg[24]_1\(0)
    );
\ireg_reg[24]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => ireg01_out,
      D => \ireg_reg[24]_0\(12),
      Q => \^q\(0),
      R => \ireg_reg[24]_1\(0)
    );
\ireg_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => ireg01_out,
      D => \ireg_reg[24]_0\(2),
      Q => \ireg_reg_n_0_[2]\,
      R => \ireg_reg[24]_1\(0)
    );
\ireg_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => ireg01_out,
      D => \ireg_reg[24]_0\(3),
      Q => \ireg_reg_n_0_[3]\,
      R => \ireg_reg[24]_1\(0)
    );
\ireg_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => ireg01_out,
      D => \ireg_reg[24]_0\(4),
      Q => \ireg_reg_n_0_[4]\,
      R => \ireg_reg[24]_1\(0)
    );
\ireg_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => ireg01_out,
      D => \ireg_reg[24]_0\(5),
      Q => \ireg_reg_n_0_[5]\,
      R => \ireg_reg[24]_1\(0)
    );
\ireg_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => ireg01_out,
      D => \ireg_reg[24]_0\(6),
      Q => \ireg_reg_n_0_[6]\,
      R => \ireg_reg[24]_1\(0)
    );
\ireg_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => ireg01_out,
      D => \ireg_reg[24]_0\(7),
      Q => \ireg_reg_n_0_[7]\,
      R => \ireg_reg[24]_1\(0)
    );
\ireg_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => ireg01_out,
      D => \ireg_reg[24]_0\(8),
      Q => \ireg_reg_n_0_[8]\,
      R => \ireg_reg[24]_1\(0)
    );
\ireg_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => ireg01_out,
      D => \ireg_reg[24]_0\(9),
      Q => \ireg_reg_n_0_[9]\,
      R => \ireg_reg[24]_1\(0)
    );
mdt_r_offset_V_TREADY_INST_0: unisim.vcomponents.LUT3
    generic map(
      INIT => X"20"
    )
        port map (
      I0 => \ireg_reg[24]_0\(12),
      I1 => \^q\(0),
      I2 => ap_rst_n,
      O => mdt_r_offset_V_TREADY
    );
\odata_int[0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"E2"
    )
        port map (
      I0 => \ireg_reg[24]_0\(0),
      I1 => \^q\(0),
      I2 => \ireg_reg_n_0_[0]\,
      O => D(0)
    );
\odata_int[10]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"E2"
    )
        port map (
      I0 => \ireg_reg[24]_0\(10),
      I1 => \^q\(0),
      I2 => \ireg_reg_n_0_[10]\,
      O => D(10)
    );
\odata_int[11]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"E2"
    )
        port map (
      I0 => \ireg_reg[24]_0\(11),
      I1 => \^q\(0),
      I2 => \ireg_reg_n_0_[11]\,
      O => D(11)
    );
\odata_int[1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"E2"
    )
        port map (
      I0 => \ireg_reg[24]_0\(1),
      I1 => \^q\(0),
      I2 => \ireg_reg_n_0_[1]\,
      O => D(1)
    );
\odata_int[24]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => \^q\(0),
      I1 => \ireg_reg[24]_0\(12),
      O => D(12)
    );
\odata_int[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"E2"
    )
        port map (
      I0 => \ireg_reg[24]_0\(2),
      I1 => \^q\(0),
      I2 => \ireg_reg_n_0_[2]\,
      O => D(2)
    );
\odata_int[3]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"E2"
    )
        port map (
      I0 => \ireg_reg[24]_0\(3),
      I1 => \^q\(0),
      I2 => \ireg_reg_n_0_[3]\,
      O => D(3)
    );
\odata_int[4]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"E2"
    )
        port map (
      I0 => \ireg_reg[24]_0\(4),
      I1 => \^q\(0),
      I2 => \ireg_reg_n_0_[4]\,
      O => D(4)
    );
\odata_int[5]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"E2"
    )
        port map (
      I0 => \ireg_reg[24]_0\(5),
      I1 => \^q\(0),
      I2 => \ireg_reg_n_0_[5]\,
      O => D(5)
    );
\odata_int[6]_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"E2"
    )
        port map (
      I0 => \ireg_reg[24]_0\(6),
      I1 => \^q\(0),
      I2 => \ireg_reg_n_0_[6]\,
      O => D(6)
    );
\odata_int[7]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"E2"
    )
        port map (
      I0 => \ireg_reg[24]_0\(7),
      I1 => \^q\(0),
      I2 => \ireg_reg_n_0_[7]\,
      O => D(7)
    );
\odata_int[8]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"E2"
    )
        port map (
      I0 => \ireg_reg[24]_0\(8),
      I1 => \^q\(0),
      I2 => \ireg_reg_n_0_[8]\,
      O => D(8)
    );
\odata_int[9]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"E2"
    )
        port map (
      I0 => \ireg_reg[24]_0\(9),
      I1 => \^q\(0),
      I2 => \ireg_reg_n_0_[9]\,
      O => D(9)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity \hls_compute_r_bins_xil_defaultlib_ibuf__parameterized0\ is
  port (
    D : out STD_LOGIC_VECTOR ( 1 downto 0 );
    ap_enable_reg_pp0_iter2_reg : out STD_LOGIC;
    count : out STD_LOGIC_VECTOR ( 0 to 0 );
    \ap_CS_fsm_reg[1]\ : out STD_LOGIC;
    ap_enable_reg_pp0_iter1_reg : out STD_LOGIC;
    \ireg_reg[8]_0\ : out STD_LOGIC;
    CEM : out STD_LOGIC;
    ap_done : out STD_LOGIC;
    ap_ready : out STD_LOGIC;
    \ireg_reg[8]_1\ : out STD_LOGIC_VECTOR ( 0 to 0 );
    \ireg_reg[8]_2\ : out STD_LOGIC_VECTOR ( 7 downto 0 );
    add_ln1353_1_fu_138_p2 : out STD_LOGIC_VECTOR ( 6 downto 0 );
    \odata_int_reg[24]\ : out STD_LOGIC_VECTOR ( 0 to 0 );
    \odata_int_reg[24]_0\ : out STD_LOGIC_VECTOR ( 0 to 0 );
    Q : in STD_LOGIC_VECTOR ( 1 downto 0 );
    ap_start : in STD_LOGIC;
    ap_enable_reg_pp0_iter2 : in STD_LOGIC;
    ap_enable_reg_pp0_iter1 : in STD_LOGIC;
    r_bin_V_TREADY : in STD_LOGIC;
    \count_reg[1]\ : in STD_LOGIC;
    \count_reg[1]_0\ : in STD_LOGIC;
    \ireg_reg[8]_3\ : in STD_LOGIC;
    \count_reg[0]\ : in STD_LOGIC;
    ap_enable_reg_pp0_iter0_reg : in STD_LOGIC;
    \odata_int_reg[0]\ : in STD_LOGIC_VECTOR ( 0 to 0 );
    ap_enable_reg_pp0_iter0 : in STD_LOGIC;
    \ap_CS_fsm_reg[0]\ : in STD_LOGIC;
    ap_rst_n : in STD_LOGIC;
    P : in STD_LOGIC_VECTOR ( 11 downto 0 );
    \odata_int_reg[6]_i_4_0\ : in STD_LOGIC_VECTOR ( 11 downto 0 );
    \odata_int_reg[6]_i_4_1\ : in STD_LOGIC_VECTOR ( 11 downto 0 );
    \odata_int_reg[6]\ : in STD_LOGIC_VECTOR ( 6 downto 0 );
    \ireg_reg[0]_0\ : in STD_LOGIC_VECTOR ( 0 to 0 );
    \ireg_reg[24]\ : in STD_LOGIC_VECTOR ( 0 to 0 );
    SR : in STD_LOGIC_VECTOR ( 0 to 0 );
    ap_clk : in STD_LOGIC;
    \ireg_reg[6]_0\ : in STD_LOGIC_VECTOR ( 6 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of \hls_compute_r_bins_xil_defaultlib_ibuf__parameterized0\ : entity is "xil_defaultlib_ibuf";
end \hls_compute_r_bins_xil_defaultlib_ibuf__parameterized0\;

architecture STRUCTURE of \hls_compute_r_bins_xil_defaultlib_ibuf__parameterized0\ is
  signal \^add_ln1353_1_fu_138_p2\ : STD_LOGIC_VECTOR ( 6 downto 0 );
  signal \ap_CS_fsm[1]_i_2_n_0\ : STD_LOGIC;
  signal \^ap_cs_fsm_reg[1]\ : STD_LOGIC;
  signal ap_done_INST_0_i_2_n_0 : STD_LOGIC;
  signal ap_done_INST_0_i_4_n_0 : STD_LOGIC;
  signal \^ap_enable_reg_pp0_iter2_reg\ : STD_LOGIC;
  signal \count[1]_i_2_n_0\ : STD_LOGIC;
  signal ireg01_out : STD_LOGIC;
  signal \^ireg_reg[8]_0\ : STD_LOGIC;
  signal \^ireg_reg[8]_1\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \ireg_reg_n_0_[0]\ : STD_LOGIC;
  signal \ireg_reg_n_0_[1]\ : STD_LOGIC;
  signal \ireg_reg_n_0_[2]\ : STD_LOGIC;
  signal \ireg_reg_n_0_[3]\ : STD_LOGIC;
  signal \ireg_reg_n_0_[4]\ : STD_LOGIC;
  signal \ireg_reg_n_0_[5]\ : STD_LOGIC;
  signal \ireg_reg_n_0_[6]\ : STD_LOGIC;
  signal \odata_int[2]_i_10_n_0\ : STD_LOGIC;
  signal \odata_int[2]_i_11_n_0\ : STD_LOGIC;
  signal \odata_int[2]_i_12_n_0\ : STD_LOGIC;
  signal \odata_int[2]_i_13_n_0\ : STD_LOGIC;
  signal \odata_int[2]_i_14_n_0\ : STD_LOGIC;
  signal \odata_int[2]_i_15_n_0\ : STD_LOGIC;
  signal \odata_int[2]_i_16_n_0\ : STD_LOGIC;
  signal \odata_int[2]_i_17_n_0\ : STD_LOGIC;
  signal \odata_int[2]_i_3_n_0\ : STD_LOGIC;
  signal \odata_int[2]_i_4_n_0\ : STD_LOGIC;
  signal \odata_int[2]_i_5_n_0\ : STD_LOGIC;
  signal \odata_int[2]_i_6_n_0\ : STD_LOGIC;
  signal \odata_int[2]_i_7_n_0\ : STD_LOGIC;
  signal \odata_int[2]_i_8_n_0\ : STD_LOGIC;
  signal \odata_int[2]_i_9_n_0\ : STD_LOGIC;
  signal \odata_int[6]_i_10_n_0\ : STD_LOGIC;
  signal \odata_int[6]_i_11_n_0\ : STD_LOGIC;
  signal \odata_int[6]_i_12_n_0\ : STD_LOGIC;
  signal \odata_int[6]_i_6_n_0\ : STD_LOGIC;
  signal \odata_int[6]_i_7_n_0\ : STD_LOGIC;
  signal \odata_int[6]_i_8_n_0\ : STD_LOGIC;
  signal \odata_int[6]_i_9_n_0\ : STD_LOGIC;
  signal \odata_int_reg[2]_i_2_n_0\ : STD_LOGIC;
  signal \odata_int_reg[2]_i_2_n_1\ : STD_LOGIC;
  signal \odata_int_reg[2]_i_2_n_2\ : STD_LOGIC;
  signal \odata_int_reg[2]_i_2_n_3\ : STD_LOGIC;
  signal \odata_int_reg[2]_i_2_n_4\ : STD_LOGIC;
  signal \odata_int_reg[2]_i_2_n_5\ : STD_LOGIC;
  signal \odata_int_reg[2]_i_2_n_6\ : STD_LOGIC;
  signal \odata_int_reg[2]_i_2_n_7\ : STD_LOGIC;
  signal \odata_int_reg[6]_i_4_n_5\ : STD_LOGIC;
  signal \odata_int_reg[6]_i_4_n_6\ : STD_LOGIC;
  signal \odata_int_reg[6]_i_4_n_7\ : STD_LOGIC;
  signal vld_in : STD_LOGIC;
  signal \NLW_odata_int_reg[2]_i_2_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal \NLW_odata_int_reg[6]_i_4_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 3 );
  signal \NLW_odata_int_reg[6]_i_4_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 4 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of ap_done_INST_0 : label is "soft_lutpair14";
  attribute SOFT_HLUTNM of ap_done_INST_0_i_2 : label is "soft_lutpair13";
  attribute SOFT_HLUTNM of ap_done_INST_0_i_4 : label is "soft_lutpair13";
  attribute SOFT_HLUTNM of ap_enable_reg_pp0_iter1_i_1 : label is "soft_lutpair12";
  attribute SOFT_HLUTNM of ap_ready_INST_0 : label is "soft_lutpair14";
  attribute SOFT_HLUTNM of \count[1]_i_2\ : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of \ireg[24]_i_3\ : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of \ireg[8]_i_3\ : label is "soft_lutpair15";
  attribute SOFT_HLUTNM of \odata_int[24]_i_1\ : label is "soft_lutpair12";
  attribute SOFT_HLUTNM of \odata_int[8]_i_1__0\ : label is "soft_lutpair15";
begin
  add_ln1353_1_fu_138_p2(6 downto 0) <= \^add_ln1353_1_fu_138_p2\(6 downto 0);
  \ap_CS_fsm_reg[1]\ <= \^ap_cs_fsm_reg[1]\;
  ap_enable_reg_pp0_iter2_reg <= \^ap_enable_reg_pp0_iter2_reg\;
  \ireg_reg[8]_0\ <= \^ireg_reg[8]_0\;
  \ireg_reg[8]_1\(0) <= \^ireg_reg[8]_1\(0);
\ap_CS_fsm[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FF01FF01FF010000"
    )
        port map (
      I0 => ap_enable_reg_pp0_iter1,
      I1 => ap_enable_reg_pp0_iter2,
      I2 => ap_start,
      I3 => \^ap_enable_reg_pp0_iter2_reg\,
      I4 => \ap_CS_fsm[1]_i_2_n_0\,
      I5 => Q(0),
      O => D(0)
    );
\ap_CS_fsm[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"1F1F1F1F1F1F1F11"
    )
        port map (
      I0 => Q(0),
      I1 => \ap_CS_fsm[1]_i_2_n_0\,
      I2 => \^ap_enable_reg_pp0_iter2_reg\,
      I3 => ap_start,
      I4 => ap_enable_reg_pp0_iter2,
      I5 => ap_enable_reg_pp0_iter1,
      O => D(1)
    );
\ap_CS_fsm[1]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"223F223F0000223F"
    )
        port map (
      I0 => \ap_CS_fsm_reg[0]\,
      I1 => \^ireg_reg[8]_0\,
      I2 => ap_enable_reg_pp0_iter1,
      I3 => ap_enable_reg_pp0_iter2,
      I4 => ap_enable_reg_pp0_iter0,
      I5 => \odata_int_reg[0]\(0),
      O => \ap_CS_fsm[1]_i_2_n_0\
    );
ap_done_INST_0: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => ap_enable_reg_pp0_iter2,
      I1 => \^ap_cs_fsm_reg[1]\,
      O => ap_done
    );
ap_done_INST_0_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"75FF7575FFFFFFFF"
    )
        port map (
      I0 => Q(1),
      I1 => \odata_int_reg[0]\(0),
      I2 => ap_enable_reg_pp0_iter0,
      I3 => ap_done_INST_0_i_2_n_0,
      I4 => \^ireg_reg[8]_0\,
      I5 => ap_done_INST_0_i_4_n_0,
      O => \^ap_cs_fsm_reg[1]\
    );
ap_done_INST_0_i_2: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => ap_enable_reg_pp0_iter2,
      I1 => ap_enable_reg_pp0_iter1,
      O => ap_done_INST_0_i_2_n_0
    );
ap_done_INST_0_i_3: unisim.vcomponents.LUT2
    generic map(
      INIT => X"B"
    )
        port map (
      I0 => \^ireg_reg[8]_1\(0),
      I1 => ap_rst_n,
      O => \^ireg_reg[8]_0\
    );
ap_done_INST_0_i_4: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8FFF"
    )
        port map (
      I0 => r_bin_V_TREADY,
      I1 => \count_reg[1]_0\,
      I2 => \count_reg[1]\,
      I3 => ap_enable_reg_pp0_iter2,
      O => ap_done_INST_0_i_4_n_0
    );
ap_enable_reg_pp0_iter1_i_1: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^ap_cs_fsm_reg[1]\,
      O => CEM
    );
ap_ready_INST_0: unisim.vcomponents.LUT4
    generic map(
      INIT => X"00E2"
    )
        port map (
      I0 => ap_enable_reg_pp0_iter0_reg,
      I1 => Q(0),
      I2 => ap_start,
      I3 => \^ap_cs_fsm_reg[1]\,
      O => ap_ready
    );
\count[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF444F0000"
    )
        port map (
      I0 => \^ap_cs_fsm_reg[1]\,
      I1 => ap_enable_reg_pp0_iter1,
      I2 => \ireg_reg[8]_3\,
      I3 => \^ireg_reg[8]_0\,
      I4 => \count_reg[1]_0\,
      I5 => \count_reg[0]\,
      O => ap_enable_reg_pp0_iter1_reg
    );
\count[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFB0FFFFFF00FFFF"
    )
        port map (
      I0 => \^ap_cs_fsm_reg[1]\,
      I1 => ap_enable_reg_pp0_iter1,
      I2 => \count[1]_i_2_n_0\,
      I3 => r_bin_V_TREADY,
      I4 => \count_reg[1]\,
      I5 => \count_reg[1]_0\,
      O => count(0)
    );
\count[1]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"BFBFFFBF"
    )
        port map (
      I0 => \^ireg_reg[8]_0\,
      I1 => ap_enable_reg_pp0_iter2,
      I2 => Q(0),
      I3 => ap_start,
      I4 => \odata_int_reg[0]\(0),
      O => \count[1]_i_2_n_0\
    );
\ireg[24]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7F330000FFFFFFFF"
    )
        port map (
      I0 => \^ap_enable_reg_pp0_iter2_reg\,
      I1 => \odata_int_reg[0]\(0),
      I2 => \^ap_cs_fsm_reg[1]\,
      I3 => ap_enable_reg_pp0_iter0,
      I4 => \ireg_reg[24]\(0),
      I5 => ap_rst_n,
      O => \odata_int_reg[24]_0\(0)
    );
\ireg[24]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"88F8FFFF"
    )
        port map (
      I0 => ap_enable_reg_pp0_iter2,
      I1 => \^ireg_reg[8]_0\,
      I2 => ap_start,
      I3 => \odata_int_reg[0]\(0),
      I4 => Q(0),
      O => \^ap_enable_reg_pp0_iter2_reg\
    );
\ireg[8]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"04"
    )
        port map (
      I0 => \^ireg_reg[8]_1\(0),
      I1 => \ireg_reg[0]_0\(0),
      I2 => r_bin_V_TREADY,
      O => ireg01_out
    );
\ireg[8]_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"4F"
    )
        port map (
      I0 => \^ap_cs_fsm_reg[1]\,
      I1 => ap_enable_reg_pp0_iter1,
      I2 => \ireg_reg[8]_3\,
      O => vld_in
    );
\ireg_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => ireg01_out,
      D => \ireg_reg[6]_0\(0),
      Q => \ireg_reg_n_0_[0]\,
      R => SR(0)
    );
\ireg_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => ireg01_out,
      D => \ireg_reg[6]_0\(1),
      Q => \ireg_reg_n_0_[1]\,
      R => SR(0)
    );
\ireg_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => ireg01_out,
      D => \ireg_reg[6]_0\(2),
      Q => \ireg_reg_n_0_[2]\,
      R => SR(0)
    );
\ireg_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => ireg01_out,
      D => \ireg_reg[6]_0\(3),
      Q => \ireg_reg_n_0_[3]\,
      R => SR(0)
    );
\ireg_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => ireg01_out,
      D => \ireg_reg[6]_0\(4),
      Q => \ireg_reg_n_0_[4]\,
      R => SR(0)
    );
\ireg_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => ireg01_out,
      D => \ireg_reg[6]_0\(5),
      Q => \ireg_reg_n_0_[5]\,
      R => SR(0)
    );
\ireg_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => ireg01_out,
      D => \ireg_reg[6]_0\(6),
      Q => \ireg_reg_n_0_[6]\,
      R => SR(0)
    );
\ireg_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => ireg01_out,
      D => vld_in,
      Q => \^ireg_reg[8]_1\(0),
      R => SR(0)
    );
\odata_int[0]_i_1__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8BBB888"
    )
        port map (
      I0 => \ireg_reg_n_0_[0]\,
      I1 => \^ireg_reg[8]_1\(0),
      I2 => \^add_ln1353_1_fu_138_p2\(0),
      I3 => \ireg_reg[8]_3\,
      I4 => \odata_int_reg[6]\(0),
      O => \ireg_reg[8]_2\(0)
    );
\odata_int[1]_i_1__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8BBB888"
    )
        port map (
      I0 => \ireg_reg_n_0_[1]\,
      I1 => \^ireg_reg[8]_1\(0),
      I2 => \^add_ln1353_1_fu_138_p2\(1),
      I3 => \ireg_reg[8]_3\,
      I4 => \odata_int_reg[6]\(1),
      O => \ireg_reg[8]_2\(1)
    );
\odata_int[24]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2FAF"
    )
        port map (
      I0 => ap_enable_reg_pp0_iter0,
      I1 => \^ap_cs_fsm_reg[1]\,
      I2 => \odata_int_reg[0]\(0),
      I3 => \^ap_enable_reg_pp0_iter2_reg\,
      O => \odata_int_reg[24]\(0)
    );
\odata_int[2]_i_10\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"17E8E817E81717E8"
    )
        port map (
      I0 => \odata_int_reg[6]_i_4_1\(6),
      I1 => \odata_int_reg[6]_i_4_0\(6),
      I2 => P(6),
      I3 => P(7),
      I4 => \odata_int_reg[6]_i_4_0\(7),
      I5 => \odata_int_reg[6]_i_4_1\(7),
      O => \odata_int[2]_i_10_n_0\
    );
\odata_int[2]_i_11\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"17E8E817E81717E8"
    )
        port map (
      I0 => \odata_int_reg[6]_i_4_1\(5),
      I1 => \odata_int_reg[6]_i_4_0\(5),
      I2 => P(5),
      I3 => P(6),
      I4 => \odata_int_reg[6]_i_4_0\(6),
      I5 => \odata_int_reg[6]_i_4_1\(6),
      O => \odata_int[2]_i_11_n_0\
    );
\odata_int[2]_i_12\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"17E8E817E81717E8"
    )
        port map (
      I0 => \odata_int_reg[6]_i_4_1\(4),
      I1 => \odata_int_reg[6]_i_4_0\(4),
      I2 => P(4),
      I3 => P(5),
      I4 => \odata_int_reg[6]_i_4_0\(5),
      I5 => \odata_int_reg[6]_i_4_1\(5),
      O => \odata_int[2]_i_12_n_0\
    );
\odata_int[2]_i_13\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"17E8E817E81717E8"
    )
        port map (
      I0 => \odata_int_reg[6]_i_4_1\(3),
      I1 => \odata_int_reg[6]_i_4_0\(3),
      I2 => P(3),
      I3 => P(4),
      I4 => \odata_int_reg[6]_i_4_0\(4),
      I5 => \odata_int_reg[6]_i_4_1\(4),
      O => \odata_int[2]_i_13_n_0\
    );
\odata_int[2]_i_14\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"17E8E817E81717E8"
    )
        port map (
      I0 => \odata_int_reg[6]_i_4_1\(2),
      I1 => \odata_int_reg[6]_i_4_0\(2),
      I2 => P(2),
      I3 => P(3),
      I4 => \odata_int_reg[6]_i_4_0\(3),
      I5 => \odata_int_reg[6]_i_4_1\(3),
      O => \odata_int[2]_i_14_n_0\
    );
\odata_int[2]_i_15\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"17E8E817E81717E8"
    )
        port map (
      I0 => \odata_int_reg[6]_i_4_1\(1),
      I1 => \odata_int_reg[6]_i_4_0\(1),
      I2 => P(1),
      I3 => P(2),
      I4 => \odata_int_reg[6]_i_4_0\(2),
      I5 => \odata_int_reg[6]_i_4_1\(2),
      O => \odata_int[2]_i_15_n_0\
    );
\odata_int[2]_i_16\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"17E8E817E81717E8"
    )
        port map (
      I0 => \odata_int_reg[6]_i_4_1\(0),
      I1 => \odata_int_reg[6]_i_4_0\(0),
      I2 => P(0),
      I3 => P(1),
      I4 => \odata_int_reg[6]_i_4_0\(1),
      I5 => \odata_int_reg[6]_i_4_1\(1),
      O => \odata_int[2]_i_16_n_0\
    );
\odata_int[2]_i_17\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"96"
    )
        port map (
      I0 => \odata_int_reg[6]_i_4_1\(0),
      I1 => \odata_int_reg[6]_i_4_0\(0),
      I2 => P(0),
      O => \odata_int[2]_i_17_n_0\
    );
\odata_int[2]_i_1__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8BBB888"
    )
        port map (
      I0 => \ireg_reg_n_0_[2]\,
      I1 => \^ireg_reg[8]_1\(0),
      I2 => \^add_ln1353_1_fu_138_p2\(2),
      I3 => \ireg_reg[8]_3\,
      I4 => \odata_int_reg[6]\(2),
      O => \ireg_reg[8]_2\(2)
    );
\odata_int[2]_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"E8"
    )
        port map (
      I0 => P(6),
      I1 => \odata_int_reg[6]_i_4_0\(6),
      I2 => \odata_int_reg[6]_i_4_1\(6),
      O => \odata_int[2]_i_3_n_0\
    );
\odata_int[2]_i_4\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"E8"
    )
        port map (
      I0 => P(5),
      I1 => \odata_int_reg[6]_i_4_0\(5),
      I2 => \odata_int_reg[6]_i_4_1\(5),
      O => \odata_int[2]_i_4_n_0\
    );
\odata_int[2]_i_5\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"E8"
    )
        port map (
      I0 => P(4),
      I1 => \odata_int_reg[6]_i_4_0\(4),
      I2 => \odata_int_reg[6]_i_4_1\(4),
      O => \odata_int[2]_i_5_n_0\
    );
\odata_int[2]_i_6\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"E8"
    )
        port map (
      I0 => P(3),
      I1 => \odata_int_reg[6]_i_4_0\(3),
      I2 => \odata_int_reg[6]_i_4_1\(3),
      O => \odata_int[2]_i_6_n_0\
    );
\odata_int[2]_i_7\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"E8"
    )
        port map (
      I0 => P(2),
      I1 => \odata_int_reg[6]_i_4_0\(2),
      I2 => \odata_int_reg[6]_i_4_1\(2),
      O => \odata_int[2]_i_7_n_0\
    );
\odata_int[2]_i_8\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"E8"
    )
        port map (
      I0 => P(1),
      I1 => \odata_int_reg[6]_i_4_0\(1),
      I2 => \odata_int_reg[6]_i_4_1\(1),
      O => \odata_int[2]_i_8_n_0\
    );
\odata_int[2]_i_9\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"E8"
    )
        port map (
      I0 => P(0),
      I1 => \odata_int_reg[6]_i_4_0\(0),
      I2 => \odata_int_reg[6]_i_4_1\(0),
      O => \odata_int[2]_i_9_n_0\
    );
\odata_int[3]_i_1__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8BBB888"
    )
        port map (
      I0 => \ireg_reg_n_0_[3]\,
      I1 => \^ireg_reg[8]_1\(0),
      I2 => \^add_ln1353_1_fu_138_p2\(3),
      I3 => \ireg_reg[8]_3\,
      I4 => \odata_int_reg[6]\(3),
      O => \ireg_reg[8]_2\(3)
    );
\odata_int[4]_i_1__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8BBB888"
    )
        port map (
      I0 => \ireg_reg_n_0_[4]\,
      I1 => \^ireg_reg[8]_1\(0),
      I2 => \^add_ln1353_1_fu_138_p2\(4),
      I3 => \ireg_reg[8]_3\,
      I4 => \odata_int_reg[6]\(4),
      O => \ireg_reg[8]_2\(4)
    );
\odata_int[5]_i_1__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8BBB888"
    )
        port map (
      I0 => \ireg_reg_n_0_[5]\,
      I1 => \^ireg_reg[8]_1\(0),
      I2 => \^add_ln1353_1_fu_138_p2\(5),
      I3 => \ireg_reg[8]_3\,
      I4 => \odata_int_reg[6]\(5),
      O => \ireg_reg[8]_2\(5)
    );
\odata_int[6]_i_10\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"17E8E817E81717E8"
    )
        port map (
      I0 => \odata_int_reg[6]_i_4_1\(9),
      I1 => \odata_int_reg[6]_i_4_0\(9),
      I2 => P(9),
      I3 => P(10),
      I4 => \odata_int_reg[6]_i_4_0\(10),
      I5 => \odata_int_reg[6]_i_4_1\(10),
      O => \odata_int[6]_i_10_n_0\
    );
\odata_int[6]_i_11\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"17E8E817E81717E8"
    )
        port map (
      I0 => \odata_int_reg[6]_i_4_1\(8),
      I1 => \odata_int_reg[6]_i_4_0\(8),
      I2 => P(8),
      I3 => P(9),
      I4 => \odata_int_reg[6]_i_4_0\(9),
      I5 => \odata_int_reg[6]_i_4_1\(9),
      O => \odata_int[6]_i_11_n_0\
    );
\odata_int[6]_i_12\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"17E8E817E81717E8"
    )
        port map (
      I0 => \odata_int_reg[6]_i_4_1\(7),
      I1 => \odata_int_reg[6]_i_4_0\(7),
      I2 => P(7),
      I3 => P(8),
      I4 => \odata_int_reg[6]_i_4_0\(8),
      I5 => \odata_int_reg[6]_i_4_1\(8),
      O => \odata_int[6]_i_12_n_0\
    );
\odata_int[6]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8BBB888"
    )
        port map (
      I0 => \ireg_reg_n_0_[6]\,
      I1 => \^ireg_reg[8]_1\(0),
      I2 => \^add_ln1353_1_fu_138_p2\(6),
      I3 => \ireg_reg[8]_3\,
      I4 => \odata_int_reg[6]\(6),
      O => \ireg_reg[8]_2\(6)
    );
\odata_int[6]_i_6\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"E8"
    )
        port map (
      I0 => P(9),
      I1 => \odata_int_reg[6]_i_4_0\(9),
      I2 => \odata_int_reg[6]_i_4_1\(9),
      O => \odata_int[6]_i_6_n_0\
    );
\odata_int[6]_i_7\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"E8"
    )
        port map (
      I0 => P(8),
      I1 => \odata_int_reg[6]_i_4_0\(8),
      I2 => \odata_int_reg[6]_i_4_1\(8),
      O => \odata_int[6]_i_7_n_0\
    );
\odata_int[6]_i_8\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"E8"
    )
        port map (
      I0 => P(7),
      I1 => \odata_int_reg[6]_i_4_0\(7),
      I2 => \odata_int_reg[6]_i_4_1\(7),
      O => \odata_int[6]_i_8_n_0\
    );
\odata_int[6]_i_9\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"17E8E817E81717E8"
    )
        port map (
      I0 => \odata_int_reg[6]_i_4_1\(10),
      I1 => \odata_int_reg[6]_i_4_0\(10),
      I2 => P(10),
      I3 => P(11),
      I4 => \odata_int_reg[6]_i_4_0\(11),
      I5 => \odata_int_reg[6]_i_4_1\(11),
      O => \odata_int[6]_i_9_n_0\
    );
\odata_int[8]_i_1__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"BBFB"
    )
        port map (
      I0 => \^ireg_reg[8]_1\(0),
      I1 => \ireg_reg[8]_3\,
      I2 => ap_enable_reg_pp0_iter1,
      I3 => \^ap_cs_fsm_reg[1]\,
      O => \ireg_reg[8]_2\(7)
    );
\odata_int_reg[2]_i_2\: unisim.vcomponents.CARRY8
     port map (
      CI => '0',
      CI_TOP => '0',
      CO(7) => \odata_int_reg[2]_i_2_n_0\,
      CO(6) => \odata_int_reg[2]_i_2_n_1\,
      CO(5) => \odata_int_reg[2]_i_2_n_2\,
      CO(4) => \odata_int_reg[2]_i_2_n_3\,
      CO(3) => \odata_int_reg[2]_i_2_n_4\,
      CO(2) => \odata_int_reg[2]_i_2_n_5\,
      CO(1) => \odata_int_reg[2]_i_2_n_6\,
      CO(0) => \odata_int_reg[2]_i_2_n_7\,
      DI(7) => \odata_int[2]_i_3_n_0\,
      DI(6) => \odata_int[2]_i_4_n_0\,
      DI(5) => \odata_int[2]_i_5_n_0\,
      DI(4) => \odata_int[2]_i_6_n_0\,
      DI(3) => \odata_int[2]_i_7_n_0\,
      DI(2) => \odata_int[2]_i_8_n_0\,
      DI(1) => \odata_int[2]_i_9_n_0\,
      DI(0) => '0',
      O(7 downto 5) => \^add_ln1353_1_fu_138_p2\(2 downto 0),
      O(4 downto 0) => \NLW_odata_int_reg[2]_i_2_O_UNCONNECTED\(4 downto 0),
      S(7) => \odata_int[2]_i_10_n_0\,
      S(6) => \odata_int[2]_i_11_n_0\,
      S(5) => \odata_int[2]_i_12_n_0\,
      S(4) => \odata_int[2]_i_13_n_0\,
      S(3) => \odata_int[2]_i_14_n_0\,
      S(2) => \odata_int[2]_i_15_n_0\,
      S(1) => \odata_int[2]_i_16_n_0\,
      S(0) => \odata_int[2]_i_17_n_0\
    );
\odata_int_reg[6]_i_4\: unisim.vcomponents.CARRY8
     port map (
      CI => \odata_int_reg[2]_i_2_n_0\,
      CI_TOP => '0',
      CO(7 downto 3) => \NLW_odata_int_reg[6]_i_4_CO_UNCONNECTED\(7 downto 3),
      CO(2) => \odata_int_reg[6]_i_4_n_5\,
      CO(1) => \odata_int_reg[6]_i_4_n_6\,
      CO(0) => \odata_int_reg[6]_i_4_n_7\,
      DI(7 downto 3) => B"00000",
      DI(2) => \odata_int[6]_i_6_n_0\,
      DI(1) => \odata_int[6]_i_7_n_0\,
      DI(0) => \odata_int[6]_i_8_n_0\,
      O(7 downto 4) => \NLW_odata_int_reg[6]_i_4_O_UNCONNECTED\(7 downto 4),
      O(3 downto 0) => \^add_ln1353_1_fu_138_p2\(6 downto 3),
      S(7 downto 4) => B"0000",
      S(3) => \odata_int[6]_i_9_n_0\,
      S(2) => \odata_int[6]_i_10_n_0\,
      S(1) => \odata_int[6]_i_11_n_0\,
      S(0) => \odata_int[6]_i_12_n_0\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity hls_compute_r_bins_xil_defaultlib_obuf is
  port (
    D : out STD_LOGIC_VECTOR ( 6 downto 0 );
    \odata_int_reg[24]_0\ : out STD_LOGIC;
    SR : out STD_LOGIC_VECTOR ( 0 to 0 );
    E : out STD_LOGIC_VECTOR ( 0 to 0 );
    \odata_int_reg[24]_1\ : out STD_LOGIC_VECTOR ( 12 downto 0 );
    add_ln1353_1_fu_138_p2 : in STD_LOGIC_VECTOR ( 6 downto 0 );
    Q : in STD_LOGIC_VECTOR ( 6 downto 0 );
    ap_rst_n : in STD_LOGIC;
    \trunc_ln1353_reg_194_pp0_iter1_reg_reg[0]\ : in STD_LOGIC_VECTOR ( 0 to 0 );
    ap_start : in STD_LOGIC;
    \trunc_ln1353_reg_194_pp0_iter1_reg_reg[0]_0\ : in STD_LOGIC;
    ap_enable_reg_pp0_iter2 : in STD_LOGIC;
    \odata_int_reg[0]_0\ : in STD_LOGIC_VECTOR ( 0 to 0 );
    \odata_int_reg[24]_2\ : in STD_LOGIC_VECTOR ( 12 downto 0 );
    ap_clk : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of hls_compute_r_bins_xil_defaultlib_obuf : entity is "xil_defaultlib_obuf";
end hls_compute_r_bins_xil_defaultlib_obuf;

architecture STRUCTURE of hls_compute_r_bins_xil_defaultlib_obuf is
  signal \^sr\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \^odata_int_reg[24]_0\ : STD_LOGIC;
  signal \^odata_int_reg[24]_1\ : STD_LOGIC_VECTOR ( 12 downto 0 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \ireg[0]_i_1\ : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of \ireg[2]_i_1\ : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of \ireg[3]_i_1\ : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of \ireg[4]_i_1\ : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of \ireg[5]_i_1\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \ireg[6]_i_1\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \odata_int[6]_i_5\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of ret_V_1_reg_219_reg_i_2 : label is "soft_lutpair7";
begin
  SR(0) <= \^sr\(0);
  \odata_int_reg[24]_0\ <= \^odata_int_reg[24]_0\;
  \odata_int_reg[24]_1\(12 downto 0) <= \^odata_int_reg[24]_1\(12 downto 0);
\ireg[0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => add_ln1353_1_fu_138_p2(0),
      I1 => \^odata_int_reg[24]_0\,
      I2 => Q(0),
      O => D(0)
    );
\ireg[1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => add_ln1353_1_fu_138_p2(1),
      I1 => \^odata_int_reg[24]_0\,
      I2 => Q(1),
      O => D(1)
    );
\ireg[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => add_ln1353_1_fu_138_p2(2),
      I1 => \^odata_int_reg[24]_0\,
      I2 => Q(2),
      O => D(2)
    );
\ireg[3]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => add_ln1353_1_fu_138_p2(3),
      I1 => \^odata_int_reg[24]_0\,
      I2 => Q(3),
      O => D(3)
    );
\ireg[4]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => add_ln1353_1_fu_138_p2(4),
      I1 => \^odata_int_reg[24]_0\,
      I2 => Q(4),
      O => D(4)
    );
\ireg[5]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => add_ln1353_1_fu_138_p2(5),
      I1 => \^odata_int_reg[24]_0\,
      I2 => Q(5),
      O => D(5)
    );
\ireg[6]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => add_ln1353_1_fu_138_p2(6),
      I1 => \^odata_int_reg[24]_0\,
      I2 => Q(6),
      O => D(6)
    );
\odata_int[6]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => ap_rst_n,
      O => \^sr\(0)
    );
\odata_int[6]_i_5\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"4FFF"
    )
        port map (
      I0 => \^odata_int_reg[24]_1\(12),
      I1 => ap_start,
      I2 => \trunc_ln1353_reg_194_pp0_iter1_reg_reg[0]\(0),
      I3 => ap_enable_reg_pp0_iter2,
      O => \^odata_int_reg[24]_0\
    );
\odata_int_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => \odata_int_reg[0]_0\(0),
      D => \odata_int_reg[24]_2\(0),
      Q => \^odata_int_reg[24]_1\(0),
      R => \^sr\(0)
    );
\odata_int_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => \odata_int_reg[0]_0\(0),
      D => \odata_int_reg[24]_2\(10),
      Q => \^odata_int_reg[24]_1\(10),
      R => \^sr\(0)
    );
\odata_int_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => \odata_int_reg[0]_0\(0),
      D => \odata_int_reg[24]_2\(11),
      Q => \^odata_int_reg[24]_1\(11),
      R => \^sr\(0)
    );
\odata_int_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => \odata_int_reg[0]_0\(0),
      D => \odata_int_reg[24]_2\(1),
      Q => \^odata_int_reg[24]_1\(1),
      R => \^sr\(0)
    );
\odata_int_reg[24]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => \odata_int_reg[0]_0\(0),
      D => \odata_int_reg[24]_2\(12),
      Q => \^odata_int_reg[24]_1\(12),
      R => \^sr\(0)
    );
\odata_int_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => \odata_int_reg[0]_0\(0),
      D => \odata_int_reg[24]_2\(2),
      Q => \^odata_int_reg[24]_1\(2),
      R => \^sr\(0)
    );
\odata_int_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => \odata_int_reg[0]_0\(0),
      D => \odata_int_reg[24]_2\(3),
      Q => \^odata_int_reg[24]_1\(3),
      R => \^sr\(0)
    );
\odata_int_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => \odata_int_reg[0]_0\(0),
      D => \odata_int_reg[24]_2\(4),
      Q => \^odata_int_reg[24]_1\(4),
      R => \^sr\(0)
    );
\odata_int_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => \odata_int_reg[0]_0\(0),
      D => \odata_int_reg[24]_2\(5),
      Q => \^odata_int_reg[24]_1\(5),
      R => \^sr\(0)
    );
\odata_int_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => \odata_int_reg[0]_0\(0),
      D => \odata_int_reg[24]_2\(6),
      Q => \^odata_int_reg[24]_1\(6),
      R => \^sr\(0)
    );
\odata_int_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => \odata_int_reg[0]_0\(0),
      D => \odata_int_reg[24]_2\(7),
      Q => \^odata_int_reg[24]_1\(7),
      R => \^sr\(0)
    );
\odata_int_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => \odata_int_reg[0]_0\(0),
      D => \odata_int_reg[24]_2\(8),
      Q => \^odata_int_reg[24]_1\(8),
      R => \^sr\(0)
    );
\odata_int_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => \odata_int_reg[0]_0\(0),
      D => \odata_int_reg[24]_2\(9),
      Q => \^odata_int_reg[24]_1\(9),
      R => \^sr\(0)
    );
ret_V_1_reg_219_reg_i_2: unisim.vcomponents.LUT5
    generic map(
      INIT => X"008A8A8A"
    )
        port map (
      I0 => \trunc_ln1353_reg_194_pp0_iter1_reg_reg[0]\(0),
      I1 => \^odata_int_reg[24]_1\(12),
      I2 => ap_start,
      I3 => \trunc_ln1353_reg_194_pp0_iter1_reg_reg[0]_0\,
      I4 => ap_enable_reg_pp0_iter2,
      O => E(0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity \hls_compute_r_bins_xil_defaultlib_obuf__parameterized0\ is
  port (
    Q : out STD_LOGIC_VECTOR ( 7 downto 0 );
    SR : out STD_LOGIC_VECTOR ( 0 to 0 );
    r_bin_V_TREADY : in STD_LOGIC;
    \ireg_reg[0]\ : in STD_LOGIC_VECTOR ( 0 to 0 );
    ap_rst_n : in STD_LOGIC;
    \odata_int_reg[0]_0\ : in STD_LOGIC_VECTOR ( 0 to 0 );
    D : in STD_LOGIC_VECTOR ( 7 downto 0 );
    ap_clk : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of \hls_compute_r_bins_xil_defaultlib_obuf__parameterized0\ : entity is "xil_defaultlib_obuf";
end \hls_compute_r_bins_xil_defaultlib_obuf__parameterized0\;

architecture STRUCTURE of \hls_compute_r_bins_xil_defaultlib_obuf__parameterized0\ is
  signal \^q\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \odata_int[6]_i_2_n_0\ : STD_LOGIC;
begin
  Q(7 downto 0) <= \^q\(7 downto 0);
\ireg[8]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"D0FF"
    )
        port map (
      I0 => \^q\(7),
      I1 => r_bin_V_TREADY,
      I2 => \ireg_reg[0]\(0),
      I3 => ap_rst_n,
      O => SR(0)
    );
\odata_int[6]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"B"
    )
        port map (
      I0 => r_bin_V_TREADY,
      I1 => \^q\(7),
      O => \odata_int[6]_i_2_n_0\
    );
\odata_int_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => \odata_int[6]_i_2_n_0\,
      D => D(0),
      Q => \^q\(0),
      R => \odata_int_reg[0]_0\(0)
    );
\odata_int_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => \odata_int[6]_i_2_n_0\,
      D => D(1),
      Q => \^q\(1),
      R => \odata_int_reg[0]_0\(0)
    );
\odata_int_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => \odata_int[6]_i_2_n_0\,
      D => D(2),
      Q => \^q\(2),
      R => \odata_int_reg[0]_0\(0)
    );
\odata_int_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => \odata_int[6]_i_2_n_0\,
      D => D(3),
      Q => \^q\(3),
      R => \odata_int_reg[0]_0\(0)
    );
\odata_int_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => \odata_int[6]_i_2_n_0\,
      D => D(4),
      Q => \^q\(4),
      R => \odata_int_reg[0]_0\(0)
    );
\odata_int_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => \odata_int[6]_i_2_n_0\,
      D => D(5),
      Q => \^q\(5),
      R => \odata_int_reg[0]_0\(0)
    );
\odata_int_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => \odata_int[6]_i_2_n_0\,
      D => D(6),
      Q => \^q\(6),
      R => \odata_int_reg[0]_0\(0)
    );
\odata_int_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => \odata_int[6]_i_2_n_0\,
      D => D(7),
      Q => \^q\(7),
      R => \odata_int_reg[0]_0\(0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity hls_compute_r_bins_regslice_both is
  port (
    D : out STD_LOGIC_VECTOR ( 6 downto 0 );
    \odata_int_reg[24]\ : out STD_LOGIC;
    ap_enable_reg_pp0_iter0 : out STD_LOGIC;
    SR : out STD_LOGIC_VECTOR ( 0 to 0 );
    mdt_r_offset_V_TREADY : out STD_LOGIC;
    \ireg_reg[24]\ : out STD_LOGIC_VECTOR ( 0 to 0 );
    \odata_int_reg[24]_0\ : out STD_LOGIC_VECTOR ( 12 downto 0 );
    E : out STD_LOGIC_VECTOR ( 0 to 0 );
    add_ln1353_1_fu_138_p2 : in STD_LOGIC_VECTOR ( 6 downto 0 );
    Q : in STD_LOGIC_VECTOR ( 6 downto 0 );
    ap_start : in STD_LOGIC;
    \trunc_ln1353_reg_194_pp0_iter1_reg_reg[0]\ : in STD_LOGIC_VECTOR ( 0 to 0 );
    ap_enable_reg_pp0_iter0_reg : in STD_LOGIC;
    ap_rst_n : in STD_LOGIC;
    \ireg_reg[24]_0\ : in STD_LOGIC_VECTOR ( 12 downto 0 );
    \ireg_reg[0]\ : in STD_LOGIC;
    \ireg_reg[0]_0\ : in STD_LOGIC;
    \trunc_ln1353_reg_194_pp0_iter1_reg_reg[0]_0\ : in STD_LOGIC;
    ap_enable_reg_pp0_iter2 : in STD_LOGIC;
    \ireg_reg[24]_1\ : in STD_LOGIC_VECTOR ( 0 to 0 );
    ap_clk : in STD_LOGIC;
    \odata_int_reg[0]\ : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of hls_compute_r_bins_regslice_both : entity is "regslice_both";
end hls_compute_r_bins_regslice_both;

architecture STRUCTURE of hls_compute_r_bins_regslice_both is
  signal cdata : STD_LOGIC_VECTOR ( 24 downto 0 );
  signal \^odata_int_reg[24]_0\ : STD_LOGIC_VECTOR ( 12 downto 0 );
begin
  \odata_int_reg[24]_0\(12 downto 0) <= \^odata_int_reg[24]_0\(12 downto 0);
ibuf_inst: entity work.hls_compute_r_bins_xil_defaultlib_ibuf
     port map (
      D(12) => cdata(24),
      D(11 downto 0) => cdata(11 downto 0),
      Q(0) => \ireg_reg[24]\(0),
      ap_clk => ap_clk,
      ap_enable_reg_pp0_iter0 => ap_enable_reg_pp0_iter0,
      ap_enable_reg_pp0_iter0_reg => ap_enable_reg_pp0_iter0_reg,
      ap_enable_reg_pp0_iter0_reg_reg(0) => \trunc_ln1353_reg_194_pp0_iter1_reg_reg[0]\(0),
      ap_rst_n => ap_rst_n,
      ap_start => ap_start,
      \ireg_reg[0]_0\ => \ireg_reg[0]\,
      \ireg_reg[0]_1\(0) => \^odata_int_reg[24]_0\(12),
      \ireg_reg[0]_2\ => \ireg_reg[0]_0\,
      \ireg_reg[24]_0\(12 downto 0) => \ireg_reg[24]_0\(12 downto 0),
      \ireg_reg[24]_1\(0) => \ireg_reg[24]_1\(0),
      mdt_r_offset_V_TREADY => mdt_r_offset_V_TREADY
    );
obuf_inst: entity work.hls_compute_r_bins_xil_defaultlib_obuf
     port map (
      D(6 downto 0) => D(6 downto 0),
      E(0) => E(0),
      Q(6 downto 0) => Q(6 downto 0),
      SR(0) => SR(0),
      add_ln1353_1_fu_138_p2(6 downto 0) => add_ln1353_1_fu_138_p2(6 downto 0),
      ap_clk => ap_clk,
      ap_enable_reg_pp0_iter2 => ap_enable_reg_pp0_iter2,
      ap_rst_n => ap_rst_n,
      ap_start => ap_start,
      \odata_int_reg[0]_0\(0) => \odata_int_reg[0]\(0),
      \odata_int_reg[24]_0\ => \odata_int_reg[24]\,
      \odata_int_reg[24]_1\(12 downto 0) => \^odata_int_reg[24]_0\(12 downto 0),
      \odata_int_reg[24]_2\(12) => cdata(24),
      \odata_int_reg[24]_2\(11 downto 0) => cdata(11 downto 0),
      \trunc_ln1353_reg_194_pp0_iter1_reg_reg[0]\(0) => \trunc_ln1353_reg_194_pp0_iter1_reg_reg[0]\(0),
      \trunc_ln1353_reg_194_pp0_iter1_reg_reg[0]_0\ => \trunc_ln1353_reg_194_pp0_iter1_reg_reg[0]_0\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity \hls_compute_r_bins_regslice_both__parameterized1\ is
  port (
    D : out STD_LOGIC_VECTOR ( 1 downto 0 );
    ap_enable_reg_pp0_iter2_reg : out STD_LOGIC;
    \ap_CS_fsm_reg[1]\ : out STD_LOGIC;
    \ireg_reg[8]\ : out STD_LOGIC;
    CEM : out STD_LOGIC;
    ap_done : out STD_LOGIC;
    ap_ready : out STD_LOGIC;
    add_ln1353_1_fu_138_p2 : out STD_LOGIC_VECTOR ( 6 downto 0 );
    \odata_int_reg[24]\ : out STD_LOGIC_VECTOR ( 0 to 0 );
    \odata_int_reg[8]\ : out STD_LOGIC_VECTOR ( 7 downto 0 );
    \odata_int_reg[24]_0\ : out STD_LOGIC_VECTOR ( 0 to 0 );
    SR : in STD_LOGIC_VECTOR ( 0 to 0 );
    ap_clk : in STD_LOGIC;
    Q : in STD_LOGIC_VECTOR ( 1 downto 0 );
    ap_start : in STD_LOGIC;
    ap_enable_reg_pp0_iter2 : in STD_LOGIC;
    ap_enable_reg_pp0_iter1 : in STD_LOGIC;
    r_bin_V_TREADY : in STD_LOGIC;
    \ireg_reg[8]_0\ : in STD_LOGIC;
    ap_enable_reg_pp0_iter0_reg : in STD_LOGIC;
    \odata_int_reg[0]\ : in STD_LOGIC_VECTOR ( 0 to 0 );
    ap_enable_reg_pp0_iter0 : in STD_LOGIC;
    ap_rst_n : in STD_LOGIC;
    P : in STD_LOGIC_VECTOR ( 11 downto 0 );
    \odata_int_reg[6]_i_4\ : in STD_LOGIC_VECTOR ( 11 downto 0 );
    \odata_int_reg[6]_i_4_0\ : in STD_LOGIC_VECTOR ( 11 downto 0 );
    \odata_int_reg[6]\ : in STD_LOGIC_VECTOR ( 6 downto 0 );
    \ireg_reg[24]\ : in STD_LOGIC_VECTOR ( 0 to 0 );
    \ireg_reg[6]\ : in STD_LOGIC_VECTOR ( 6 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of \hls_compute_r_bins_regslice_both__parameterized1\ : entity is "regslice_both";
end \hls_compute_r_bins_regslice_both__parameterized1\;

architecture STRUCTURE of \hls_compute_r_bins_regslice_both__parameterized1\ is
  signal \ap_CS_fsm[1]_i_3_n_0\ : STD_LOGIC;
  signal count : STD_LOGIC_VECTOR ( 1 to 1 );
  signal \count[0]_i_2_n_0\ : STD_LOGIC;
  signal \count_reg_n_0_[0]\ : STD_LOGIC;
  signal \count_reg_n_0_[1]\ : STD_LOGIC;
  signal ibuf_inst_n_11 : STD_LOGIC;
  signal ibuf_inst_n_12 : STD_LOGIC;
  signal ibuf_inst_n_13 : STD_LOGIC;
  signal ibuf_inst_n_14 : STD_LOGIC;
  signal ibuf_inst_n_15 : STD_LOGIC;
  signal ibuf_inst_n_16 : STD_LOGIC;
  signal ibuf_inst_n_17 : STD_LOGIC;
  signal ibuf_inst_n_18 : STD_LOGIC;
  signal ibuf_inst_n_5 : STD_LOGIC;
  signal obuf_inst_n_8 : STD_LOGIC;
  signal \^odata_int_reg[8]\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal p_0_in : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \ap_CS_fsm[1]_i_3\ : label is "soft_lutpair16";
  attribute SOFT_HLUTNM of \count[0]_i_2\ : label is "soft_lutpair16";
begin
  \odata_int_reg[8]\(7 downto 0) <= \^odata_int_reg[8]\(7 downto 0);
\ap_CS_fsm[1]_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"D5"
    )
        port map (
      I0 => \count_reg_n_0_[0]\,
      I1 => \count_reg_n_0_[1]\,
      I2 => r_bin_V_TREADY,
      O => \ap_CS_fsm[1]_i_3_n_0\
    );
\count[0]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2A00"
    )
        port map (
      I0 => ap_rst_n,
      I1 => r_bin_V_TREADY,
      I2 => \count_reg_n_0_[1]\,
      I3 => \count_reg_n_0_[0]\,
      O => \count[0]_i_2_n_0\
    );
\count_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => ibuf_inst_n_5,
      Q => \count_reg_n_0_[0]\,
      R => '0'
    );
\count_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => count(1),
      Q => \count_reg_n_0_[1]\,
      R => SR(0)
    );
ibuf_inst: entity work.\hls_compute_r_bins_xil_defaultlib_ibuf__parameterized0\
     port map (
      CEM => CEM,
      D(1 downto 0) => D(1 downto 0),
      P(11 downto 0) => P(11 downto 0),
      Q(1 downto 0) => Q(1 downto 0),
      SR(0) => obuf_inst_n_8,
      add_ln1353_1_fu_138_p2(6 downto 0) => add_ln1353_1_fu_138_p2(6 downto 0),
      \ap_CS_fsm_reg[0]\ => \ap_CS_fsm[1]_i_3_n_0\,
      \ap_CS_fsm_reg[1]\ => \ap_CS_fsm_reg[1]\,
      ap_clk => ap_clk,
      ap_done => ap_done,
      ap_enable_reg_pp0_iter0 => ap_enable_reg_pp0_iter0,
      ap_enable_reg_pp0_iter0_reg => ap_enable_reg_pp0_iter0_reg,
      ap_enable_reg_pp0_iter1 => ap_enable_reg_pp0_iter1,
      ap_enable_reg_pp0_iter1_reg => ibuf_inst_n_5,
      ap_enable_reg_pp0_iter2 => ap_enable_reg_pp0_iter2,
      ap_enable_reg_pp0_iter2_reg => ap_enable_reg_pp0_iter2_reg,
      ap_ready => ap_ready,
      ap_rst_n => ap_rst_n,
      ap_start => ap_start,
      count(0) => count(1),
      \count_reg[0]\ => \count[0]_i_2_n_0\,
      \count_reg[1]\ => \count_reg_n_0_[0]\,
      \count_reg[1]_0\ => \count_reg_n_0_[1]\,
      \ireg_reg[0]_0\(0) => \^odata_int_reg[8]\(7),
      \ireg_reg[24]\(0) => \ireg_reg[24]\(0),
      \ireg_reg[6]_0\(6 downto 0) => \ireg_reg[6]\(6 downto 0),
      \ireg_reg[8]_0\ => \ireg_reg[8]\,
      \ireg_reg[8]_1\(0) => p_0_in,
      \ireg_reg[8]_2\(7) => ibuf_inst_n_11,
      \ireg_reg[8]_2\(6) => ibuf_inst_n_12,
      \ireg_reg[8]_2\(5) => ibuf_inst_n_13,
      \ireg_reg[8]_2\(4) => ibuf_inst_n_14,
      \ireg_reg[8]_2\(3) => ibuf_inst_n_15,
      \ireg_reg[8]_2\(2) => ibuf_inst_n_16,
      \ireg_reg[8]_2\(1) => ibuf_inst_n_17,
      \ireg_reg[8]_2\(0) => ibuf_inst_n_18,
      \ireg_reg[8]_3\ => \ireg_reg[8]_0\,
      \odata_int_reg[0]\(0) => \odata_int_reg[0]\(0),
      \odata_int_reg[24]\(0) => \odata_int_reg[24]\(0),
      \odata_int_reg[24]_0\(0) => \odata_int_reg[24]_0\(0),
      \odata_int_reg[6]\(6 downto 0) => \odata_int_reg[6]\(6 downto 0),
      \odata_int_reg[6]_i_4_0\(11 downto 0) => \odata_int_reg[6]_i_4\(11 downto 0),
      \odata_int_reg[6]_i_4_1\(11 downto 0) => \odata_int_reg[6]_i_4_0\(11 downto 0),
      r_bin_V_TREADY => r_bin_V_TREADY
    );
obuf_inst: entity work.\hls_compute_r_bins_xil_defaultlib_obuf__parameterized0\
     port map (
      D(7) => ibuf_inst_n_11,
      D(6) => ibuf_inst_n_12,
      D(5) => ibuf_inst_n_13,
      D(4) => ibuf_inst_n_14,
      D(3) => ibuf_inst_n_15,
      D(2) => ibuf_inst_n_16,
      D(1) => ibuf_inst_n_17,
      D(0) => ibuf_inst_n_18,
      Q(7 downto 0) => \^odata_int_reg[8]\(7 downto 0),
      SR(0) => obuf_inst_n_8,
      ap_clk => ap_clk,
      ap_rst_n => ap_rst_n,
      \ireg_reg[0]\(0) => p_0_in,
      \odata_int_reg[0]_0\(0) => SR(0),
      r_bin_V_TREADY => r_bin_V_TREADY
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity hls_compute_r_bins_compute_r_bins is
  port (
    ap_clk : in STD_LOGIC;
    ap_rst_n : in STD_LOGIC;
    ap_start : in STD_LOGIC;
    ap_done : out STD_LOGIC;
    ap_idle : out STD_LOGIC;
    ap_ready : out STD_LOGIC;
    mdt_r_offset_V_TVALID : in STD_LOGIC;
    r_bin_V_TREADY : in STD_LOGIC;
    mdt_localx_V : in STD_LOGIC_VECTOR ( 14 downto 0 );
    mdt_localy_V : in STD_LOGIC_VECTOR ( 14 downto 0 );
    mdt_r_offset_V_TDATA : in STD_LOGIC_VECTOR ( 23 downto 0 );
    mdt_r_offset_V_TREADY : out STD_LOGIC;
    hw_sin_val_V : in STD_LOGIC_VECTOR ( 17 downto 0 );
    hw_cos_val_V : in STD_LOGIC_VECTOR ( 17 downto 0 );
    r_bin_V_TDATA : out STD_LOGIC_VECTOR ( 7 downto 0 );
    r_bin_V_TVALID : out STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of hls_compute_r_bins_compute_r_bins : entity is "compute_r_bins";
end hls_compute_r_bins_compute_r_bins;

architecture STRUCTURE of hls_compute_r_bins_compute_r_bins is
  signal \<const0>\ : STD_LOGIC;
  signal add_ln1353_1_fu_138_p2 : STD_LOGIC_VECTOR ( 11 downto 5 );
  signal add_ln1353_3_fu_163_p2 : STD_LOGIC_VECTOR ( 11 downto 5 );
  signal ap_CS_fsm_pp0_stage1 : STD_LOGIC;
  signal \ap_CS_fsm_reg_n_0_[0]\ : STD_LOGIC;
  signal ap_NS_fsm : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal ap_enable_reg_pp0_iter0 : STD_LOGIC;
  signal ap_enable_reg_pp0_iter0_reg : STD_LOGIC;
  signal ap_enable_reg_pp0_iter1 : STD_LOGIC;
  signal ap_enable_reg_pp0_iter10 : STD_LOGIC;
  signal ap_enable_reg_pp0_iter2 : STD_LOGIC;
  signal ap_rst : STD_LOGIC;
  signal data_in : STD_LOGIC_VECTOR ( 6 downto 0 );
  signal \ibuf_inst/p_0_in\ : STD_LOGIC;
  signal \^r_bin_v_tdata\ : STD_LOGIC_VECTOR ( 6 downto 0 );
  signal regslice_both_mdt_r_offset_V_U_n_13 : STD_LOGIC;
  signal regslice_both_mdt_r_offset_V_U_n_14 : STD_LOGIC;
  signal regslice_both_mdt_r_offset_V_U_n_15 : STD_LOGIC;
  signal regslice_both_mdt_r_offset_V_U_n_16 : STD_LOGIC;
  signal regslice_both_mdt_r_offset_V_U_n_17 : STD_LOGIC;
  signal regslice_both_mdt_r_offset_V_U_n_18 : STD_LOGIC;
  signal regslice_both_mdt_r_offset_V_U_n_19 : STD_LOGIC;
  signal regslice_both_mdt_r_offset_V_U_n_20 : STD_LOGIC;
  signal regslice_both_mdt_r_offset_V_U_n_21 : STD_LOGIC;
  signal regslice_both_mdt_r_offset_V_U_n_22 : STD_LOGIC;
  signal regslice_both_mdt_r_offset_V_U_n_23 : STD_LOGIC;
  signal regslice_both_mdt_r_offset_V_U_n_24 : STD_LOGIC;
  signal regslice_both_mdt_r_offset_V_U_n_7 : STD_LOGIC;
  signal regslice_both_r_bin_V_U_n_15 : STD_LOGIC;
  signal regslice_both_r_bin_V_U_n_2 : STD_LOGIC;
  signal regslice_both_r_bin_V_U_n_24 : STD_LOGIC;
  signal regslice_both_r_bin_V_U_n_3 : STD_LOGIC;
  signal regslice_both_r_bin_V_U_n_4 : STD_LOGIC;
  signal ret_V_1_reg_2190 : STD_LOGIC;
  signal ret_V_1_reg_219_reg_i_1_n_0 : STD_LOGIC;
  signal ret_V_1_reg_219_reg_n_100 : STD_LOGIC;
  signal ret_V_1_reg_219_reg_n_101 : STD_LOGIC;
  signal ret_V_1_reg_219_reg_n_102 : STD_LOGIC;
  signal ret_V_1_reg_219_reg_n_103 : STD_LOGIC;
  signal ret_V_1_reg_219_reg_n_104 : STD_LOGIC;
  signal ret_V_1_reg_219_reg_n_105 : STD_LOGIC;
  signal ret_V_1_reg_219_reg_n_90 : STD_LOGIC;
  signal ret_V_1_reg_219_reg_n_91 : STD_LOGIC;
  signal ret_V_1_reg_219_reg_n_92 : STD_LOGIC;
  signal ret_V_1_reg_219_reg_n_93 : STD_LOGIC;
  signal ret_V_1_reg_219_reg_n_94 : STD_LOGIC;
  signal ret_V_1_reg_219_reg_n_95 : STD_LOGIC;
  signal ret_V_1_reg_219_reg_n_96 : STD_LOGIC;
  signal ret_V_1_reg_219_reg_n_97 : STD_LOGIC;
  signal ret_V_1_reg_219_reg_n_98 : STD_LOGIC;
  signal ret_V_1_reg_219_reg_n_99 : STD_LOGIC;
  signal ret_V_reg_209_reg_n_100 : STD_LOGIC;
  signal ret_V_reg_209_reg_n_101 : STD_LOGIC;
  signal ret_V_reg_209_reg_n_102 : STD_LOGIC;
  signal ret_V_reg_209_reg_n_103 : STD_LOGIC;
  signal ret_V_reg_209_reg_n_104 : STD_LOGIC;
  signal ret_V_reg_209_reg_n_105 : STD_LOGIC;
  signal ret_V_reg_209_reg_n_90 : STD_LOGIC;
  signal ret_V_reg_209_reg_n_91 : STD_LOGIC;
  signal ret_V_reg_209_reg_n_92 : STD_LOGIC;
  signal ret_V_reg_209_reg_n_93 : STD_LOGIC;
  signal ret_V_reg_209_reg_n_94 : STD_LOGIC;
  signal ret_V_reg_209_reg_n_95 : STD_LOGIC;
  signal ret_V_reg_209_reg_n_96 : STD_LOGIC;
  signal ret_V_reg_209_reg_n_97 : STD_LOGIC;
  signal ret_V_reg_209_reg_n_98 : STD_LOGIC;
  signal ret_V_reg_209_reg_n_99 : STD_LOGIC;
  signal tmp_fu_124_p4 : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal trunc_ln1353_1_reg_214 : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal trunc_ln1353_reg_194 : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal trunc_ln1353_reg_194_pp0_iter1_reg : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal \trunc_ln1503_1_reg_235[2]_i_10_n_0\ : STD_LOGIC;
  signal \trunc_ln1503_1_reg_235[2]_i_11_n_0\ : STD_LOGIC;
  signal \trunc_ln1503_1_reg_235[2]_i_12_n_0\ : STD_LOGIC;
  signal \trunc_ln1503_1_reg_235[2]_i_13_n_0\ : STD_LOGIC;
  signal \trunc_ln1503_1_reg_235[2]_i_14_n_0\ : STD_LOGIC;
  signal \trunc_ln1503_1_reg_235[2]_i_15_n_0\ : STD_LOGIC;
  signal \trunc_ln1503_1_reg_235[2]_i_16_n_0\ : STD_LOGIC;
  signal \trunc_ln1503_1_reg_235[2]_i_2_n_0\ : STD_LOGIC;
  signal \trunc_ln1503_1_reg_235[2]_i_3_n_0\ : STD_LOGIC;
  signal \trunc_ln1503_1_reg_235[2]_i_4_n_0\ : STD_LOGIC;
  signal \trunc_ln1503_1_reg_235[2]_i_5_n_0\ : STD_LOGIC;
  signal \trunc_ln1503_1_reg_235[2]_i_6_n_0\ : STD_LOGIC;
  signal \trunc_ln1503_1_reg_235[2]_i_7_n_0\ : STD_LOGIC;
  signal \trunc_ln1503_1_reg_235[2]_i_8_n_0\ : STD_LOGIC;
  signal \trunc_ln1503_1_reg_235[2]_i_9_n_0\ : STD_LOGIC;
  signal \trunc_ln1503_1_reg_235[6]_i_2_n_0\ : STD_LOGIC;
  signal \trunc_ln1503_1_reg_235[6]_i_3_n_0\ : STD_LOGIC;
  signal \trunc_ln1503_1_reg_235[6]_i_4_n_0\ : STD_LOGIC;
  signal \trunc_ln1503_1_reg_235[6]_i_5_n_0\ : STD_LOGIC;
  signal \trunc_ln1503_1_reg_235[6]_i_6_n_0\ : STD_LOGIC;
  signal \trunc_ln1503_1_reg_235[6]_i_7_n_0\ : STD_LOGIC;
  signal \trunc_ln1503_1_reg_235[6]_i_8_n_0\ : STD_LOGIC;
  signal \trunc_ln1503_1_reg_235_reg[2]_i_1_n_0\ : STD_LOGIC;
  signal \trunc_ln1503_1_reg_235_reg[2]_i_1_n_1\ : STD_LOGIC;
  signal \trunc_ln1503_1_reg_235_reg[2]_i_1_n_2\ : STD_LOGIC;
  signal \trunc_ln1503_1_reg_235_reg[2]_i_1_n_3\ : STD_LOGIC;
  signal \trunc_ln1503_1_reg_235_reg[2]_i_1_n_4\ : STD_LOGIC;
  signal \trunc_ln1503_1_reg_235_reg[2]_i_1_n_5\ : STD_LOGIC;
  signal \trunc_ln1503_1_reg_235_reg[2]_i_1_n_6\ : STD_LOGIC;
  signal \trunc_ln1503_1_reg_235_reg[2]_i_1_n_7\ : STD_LOGIC;
  signal \trunc_ln1503_1_reg_235_reg[6]_i_1_n_5\ : STD_LOGIC;
  signal \trunc_ln1503_1_reg_235_reg[6]_i_1_n_6\ : STD_LOGIC;
  signal \trunc_ln1503_1_reg_235_reg[6]_i_1_n_7\ : STD_LOGIC;
  signal \trunc_ln1503_1_reg_235_reg_n_0_[0]\ : STD_LOGIC;
  signal \trunc_ln1503_1_reg_235_reg_n_0_[1]\ : STD_LOGIC;
  signal \trunc_ln1503_1_reg_235_reg_n_0_[2]\ : STD_LOGIC;
  signal \trunc_ln1503_1_reg_235_reg_n_0_[3]\ : STD_LOGIC;
  signal \trunc_ln1503_1_reg_235_reg_n_0_[4]\ : STD_LOGIC;
  signal \trunc_ln1503_1_reg_235_reg_n_0_[5]\ : STD_LOGIC;
  signal \trunc_ln1503_1_reg_235_reg_n_0_[6]\ : STD_LOGIC;
  signal vld_out : STD_LOGIC;
  signal zext_ln215_1_cast_reg_224 : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal NLW_ret_V_1_reg_219_reg_CARRYCASCOUT_UNCONNECTED : STD_LOGIC;
  signal NLW_ret_V_1_reg_219_reg_MULTSIGNOUT_UNCONNECTED : STD_LOGIC;
  signal NLW_ret_V_1_reg_219_reg_OVERFLOW_UNCONNECTED : STD_LOGIC;
  signal NLW_ret_V_1_reg_219_reg_PATTERNBDETECT_UNCONNECTED : STD_LOGIC;
  signal NLW_ret_V_1_reg_219_reg_PATTERNDETECT_UNCONNECTED : STD_LOGIC;
  signal NLW_ret_V_1_reg_219_reg_UNDERFLOW_UNCONNECTED : STD_LOGIC;
  signal NLW_ret_V_1_reg_219_reg_ACOUT_UNCONNECTED : STD_LOGIC_VECTOR ( 29 downto 0 );
  signal NLW_ret_V_1_reg_219_reg_BCOUT_UNCONNECTED : STD_LOGIC_VECTOR ( 17 downto 0 );
  signal NLW_ret_V_1_reg_219_reg_CARRYOUT_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_ret_V_1_reg_219_reg_P_UNCONNECTED : STD_LOGIC_VECTOR ( 47 downto 28 );
  signal NLW_ret_V_1_reg_219_reg_PCOUT_UNCONNECTED : STD_LOGIC_VECTOR ( 47 downto 0 );
  signal NLW_ret_V_1_reg_219_reg_XOROUT_UNCONNECTED : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal NLW_ret_V_reg_209_reg_CARRYCASCOUT_UNCONNECTED : STD_LOGIC;
  signal NLW_ret_V_reg_209_reg_MULTSIGNOUT_UNCONNECTED : STD_LOGIC;
  signal NLW_ret_V_reg_209_reg_OVERFLOW_UNCONNECTED : STD_LOGIC;
  signal NLW_ret_V_reg_209_reg_PATTERNBDETECT_UNCONNECTED : STD_LOGIC;
  signal NLW_ret_V_reg_209_reg_PATTERNDETECT_UNCONNECTED : STD_LOGIC;
  signal NLW_ret_V_reg_209_reg_UNDERFLOW_UNCONNECTED : STD_LOGIC;
  signal NLW_ret_V_reg_209_reg_ACOUT_UNCONNECTED : STD_LOGIC_VECTOR ( 29 downto 0 );
  signal NLW_ret_V_reg_209_reg_BCOUT_UNCONNECTED : STD_LOGIC_VECTOR ( 17 downto 0 );
  signal NLW_ret_V_reg_209_reg_CARRYOUT_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_ret_V_reg_209_reg_P_UNCONNECTED : STD_LOGIC_VECTOR ( 47 downto 28 );
  signal NLW_ret_V_reg_209_reg_PCOUT_UNCONNECTED : STD_LOGIC_VECTOR ( 47 downto 0 );
  signal NLW_ret_V_reg_209_reg_XOROUT_UNCONNECTED : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \NLW_trunc_ln1503_1_reg_235_reg[2]_i_1_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal \NLW_trunc_ln1503_1_reg_235_reg[6]_i_1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 3 );
  signal \NLW_trunc_ln1503_1_reg_235_reg[6]_i_1_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 4 );
  attribute FSM_ENCODING : string;
  attribute FSM_ENCODING of \ap_CS_fsm_reg[0]\ : label is "none";
  attribute FSM_ENCODING of \ap_CS_fsm_reg[1]\ : label is "none";
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of ap_idle_INST_0 : label is "soft_lutpair17";
  attribute SOFT_HLUTNM of ret_V_1_reg_219_reg_i_1 : label is "soft_lutpair17";
begin
  r_bin_V_TDATA(7) <= \<const0>\;
  r_bin_V_TDATA(6 downto 0) <= \^r_bin_v_tdata\(6 downto 0);
GND: unisim.vcomponents.GND
     port map (
      G => \<const0>\
    );
\ap_CS_fsm_reg[0]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => ap_clk,
      CE => '1',
      D => ap_NS_fsm(0),
      Q => \ap_CS_fsm_reg_n_0_[0]\,
      S => ap_rst
    );
\ap_CS_fsm_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => '1',
      D => ap_NS_fsm(1),
      Q => ap_CS_fsm_pp0_stage1,
      R => ap_rst
    );
ap_enable_reg_pp0_iter0_reg_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => '1',
      D => ap_enable_reg_pp0_iter0,
      Q => ap_enable_reg_pp0_iter0_reg,
      R => ap_rst
    );
ap_enable_reg_pp0_iter1_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => ap_enable_reg_pp0_iter10,
      D => ap_enable_reg_pp0_iter0,
      Q => ap_enable_reg_pp0_iter1,
      R => ap_rst
    );
ap_enable_reg_pp0_iter2_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => ap_enable_reg_pp0_iter10,
      D => ap_enable_reg_pp0_iter1,
      Q => ap_enable_reg_pp0_iter2,
      R => ap_rst
    );
ap_idle_INST_0: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0004"
    )
        port map (
      I0 => ap_start,
      I1 => \ap_CS_fsm_reg_n_0_[0]\,
      I2 => ap_enable_reg_pp0_iter1,
      I3 => ap_enable_reg_pp0_iter2,
      O => ap_idle
    );
regslice_both_mdt_r_offset_V_U: entity work.hls_compute_r_bins_regslice_both
     port map (
      D(6 downto 0) => data_in(6 downto 0),
      E(0) => ret_V_1_reg_2190,
      Q(6) => \trunc_ln1503_1_reg_235_reg_n_0_[6]\,
      Q(5) => \trunc_ln1503_1_reg_235_reg_n_0_[5]\,
      Q(4) => \trunc_ln1503_1_reg_235_reg_n_0_[4]\,
      Q(3) => \trunc_ln1503_1_reg_235_reg_n_0_[3]\,
      Q(2) => \trunc_ln1503_1_reg_235_reg_n_0_[2]\,
      Q(1) => \trunc_ln1503_1_reg_235_reg_n_0_[1]\,
      Q(0) => \trunc_ln1503_1_reg_235_reg_n_0_[0]\,
      SR(0) => ap_rst,
      add_ln1353_1_fu_138_p2(6 downto 0) => add_ln1353_1_fu_138_p2(11 downto 5),
      ap_clk => ap_clk,
      ap_enable_reg_pp0_iter0 => ap_enable_reg_pp0_iter0,
      ap_enable_reg_pp0_iter0_reg => ap_enable_reg_pp0_iter0_reg,
      ap_enable_reg_pp0_iter2 => ap_enable_reg_pp0_iter2,
      ap_rst_n => ap_rst_n,
      ap_start => ap_start,
      \ireg_reg[0]\ => regslice_both_r_bin_V_U_n_2,
      \ireg_reg[0]_0\ => regslice_both_r_bin_V_U_n_3,
      \ireg_reg[24]\(0) => \ibuf_inst/p_0_in\,
      \ireg_reg[24]_0\(12) => mdt_r_offset_V_TVALID,
      \ireg_reg[24]_0\(11 downto 0) => mdt_r_offset_V_TDATA(11 downto 0),
      \ireg_reg[24]_1\(0) => regslice_both_r_bin_V_U_n_24,
      mdt_r_offset_V_TREADY => mdt_r_offset_V_TREADY,
      \odata_int_reg[0]\(0) => regslice_both_r_bin_V_U_n_15,
      \odata_int_reg[24]\ => regslice_both_mdt_r_offset_V_U_n_7,
      \odata_int_reg[24]_0\(12) => vld_out,
      \odata_int_reg[24]_0\(11) => regslice_both_mdt_r_offset_V_U_n_13,
      \odata_int_reg[24]_0\(10) => regslice_both_mdt_r_offset_V_U_n_14,
      \odata_int_reg[24]_0\(9) => regslice_both_mdt_r_offset_V_U_n_15,
      \odata_int_reg[24]_0\(8) => regslice_both_mdt_r_offset_V_U_n_16,
      \odata_int_reg[24]_0\(7) => regslice_both_mdt_r_offset_V_U_n_17,
      \odata_int_reg[24]_0\(6) => regslice_both_mdt_r_offset_V_U_n_18,
      \odata_int_reg[24]_0\(5) => regslice_both_mdt_r_offset_V_U_n_19,
      \odata_int_reg[24]_0\(4) => regslice_both_mdt_r_offset_V_U_n_20,
      \odata_int_reg[24]_0\(3) => regslice_both_mdt_r_offset_V_U_n_21,
      \odata_int_reg[24]_0\(2) => regslice_both_mdt_r_offset_V_U_n_22,
      \odata_int_reg[24]_0\(1) => regslice_both_mdt_r_offset_V_U_n_23,
      \odata_int_reg[24]_0\(0) => regslice_both_mdt_r_offset_V_U_n_24,
      \trunc_ln1353_reg_194_pp0_iter1_reg_reg[0]\(0) => \ap_CS_fsm_reg_n_0_[0]\,
      \trunc_ln1353_reg_194_pp0_iter1_reg_reg[0]_0\ => regslice_both_r_bin_V_U_n_4
    );
regslice_both_r_bin_V_U: entity work.\hls_compute_r_bins_regslice_both__parameterized1\
     port map (
      CEM => ap_enable_reg_pp0_iter10,
      D(1 downto 0) => ap_NS_fsm(1 downto 0),
      P(11 downto 0) => tmp_fu_124_p4(11 downto 0),
      Q(1) => ap_CS_fsm_pp0_stage1,
      Q(0) => \ap_CS_fsm_reg_n_0_[0]\,
      SR(0) => ap_rst,
      add_ln1353_1_fu_138_p2(6 downto 0) => add_ln1353_1_fu_138_p2(11 downto 5),
      \ap_CS_fsm_reg[1]\ => regslice_both_r_bin_V_U_n_3,
      ap_clk => ap_clk,
      ap_done => ap_done,
      ap_enable_reg_pp0_iter0 => ap_enable_reg_pp0_iter0,
      ap_enable_reg_pp0_iter0_reg => ap_enable_reg_pp0_iter0_reg,
      ap_enable_reg_pp0_iter1 => ap_enable_reg_pp0_iter1,
      ap_enable_reg_pp0_iter2 => ap_enable_reg_pp0_iter2,
      ap_enable_reg_pp0_iter2_reg => regslice_both_r_bin_V_U_n_2,
      ap_ready => ap_ready,
      ap_rst_n => ap_rst_n,
      ap_start => ap_start,
      \ireg_reg[24]\(0) => \ibuf_inst/p_0_in\,
      \ireg_reg[6]\(6 downto 0) => data_in(6 downto 0),
      \ireg_reg[8]\ => regslice_both_r_bin_V_U_n_4,
      \ireg_reg[8]_0\ => regslice_both_mdt_r_offset_V_U_n_7,
      \odata_int_reg[0]\(0) => vld_out,
      \odata_int_reg[24]\(0) => regslice_both_r_bin_V_U_n_15,
      \odata_int_reg[24]_0\(0) => regslice_both_r_bin_V_U_n_24,
      \odata_int_reg[6]\(6) => \trunc_ln1503_1_reg_235_reg_n_0_[6]\,
      \odata_int_reg[6]\(5) => \trunc_ln1503_1_reg_235_reg_n_0_[5]\,
      \odata_int_reg[6]\(4) => \trunc_ln1503_1_reg_235_reg_n_0_[4]\,
      \odata_int_reg[6]\(3) => \trunc_ln1503_1_reg_235_reg_n_0_[3]\,
      \odata_int_reg[6]\(2) => \trunc_ln1503_1_reg_235_reg_n_0_[2]\,
      \odata_int_reg[6]\(1) => \trunc_ln1503_1_reg_235_reg_n_0_[1]\,
      \odata_int_reg[6]\(0) => \trunc_ln1503_1_reg_235_reg_n_0_[0]\,
      \odata_int_reg[6]_i_4\(11 downto 0) => zext_ln215_1_cast_reg_224(11 downto 0),
      \odata_int_reg[6]_i_4_0\(11 downto 0) => trunc_ln1353_reg_194_pp0_iter1_reg(11 downto 0),
      \odata_int_reg[8]\(7) => r_bin_V_TVALID,
      \odata_int_reg[8]\(6 downto 0) => \^r_bin_v_tdata\(6 downto 0),
      r_bin_V_TREADY => r_bin_V_TREADY
    );
ret_V_1_reg_219_reg: unisim.vcomponents.DSP48E2
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
      CREG => 0,
      DREG => 1,
      INMODEREG => 0,
      MASK => X"3FFFFFFFFFFF",
      MREG => 0,
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
      A(29) => hw_sin_val_V(17),
      A(28) => hw_sin_val_V(17),
      A(27) => hw_sin_val_V(17),
      A(26) => hw_sin_val_V(17),
      A(25) => hw_sin_val_V(17),
      A(24) => hw_sin_val_V(17),
      A(23) => hw_sin_val_V(17),
      A(22) => hw_sin_val_V(17),
      A(21) => hw_sin_val_V(17),
      A(20) => hw_sin_val_V(17),
      A(19) => hw_sin_val_V(17),
      A(18) => hw_sin_val_V(17),
      A(17 downto 0) => hw_sin_val_V(17 downto 0),
      ACIN(29 downto 0) => B"000000000000000000000000000000",
      ACOUT(29 downto 0) => NLW_ret_V_1_reg_219_reg_ACOUT_UNCONNECTED(29 downto 0),
      ALUMODE(3 downto 0) => B"0000",
      B(17) => mdt_localy_V(14),
      B(16) => mdt_localy_V(14),
      B(15) => mdt_localy_V(14),
      B(14 downto 0) => mdt_localy_V(14 downto 0),
      BCIN(17 downto 0) => B"000000000000000000",
      BCOUT(17 downto 0) => NLW_ret_V_1_reg_219_reg_BCOUT_UNCONNECTED(17 downto 0),
      C(47 downto 0) => B"000000000000000000000000000000000000000000000000",
      CARRYCASCIN => '0',
      CARRYCASCOUT => NLW_ret_V_1_reg_219_reg_CARRYCASCOUT_UNCONNECTED,
      CARRYIN => '0',
      CARRYINSEL(2 downto 0) => B"000",
      CARRYOUT(3 downto 0) => NLW_ret_V_1_reg_219_reg_CARRYOUT_UNCONNECTED(3 downto 0),
      CEA1 => ret_V_1_reg_219_reg_i_1_n_0,
      CEA2 => ap_enable_reg_pp0_iter10,
      CEAD => '0',
      CEALUMODE => '0',
      CEB1 => ret_V_1_reg_219_reg_i_1_n_0,
      CEB2 => ap_enable_reg_pp0_iter10,
      CEC => '0',
      CECARRYIN => '0',
      CECTRL => '0',
      CED => '0',
      CEINMODE => '0',
      CEM => '0',
      CEP => ret_V_1_reg_2190,
      CLK => ap_clk,
      D(26 downto 0) => B"000000000000000000000000000",
      INMODE(4 downto 0) => B"00000",
      MULTSIGNIN => '0',
      MULTSIGNOUT => NLW_ret_V_1_reg_219_reg_MULTSIGNOUT_UNCONNECTED,
      OPMODE(8 downto 0) => B"000000101",
      OVERFLOW => NLW_ret_V_1_reg_219_reg_OVERFLOW_UNCONNECTED,
      P(47 downto 28) => NLW_ret_V_1_reg_219_reg_P_UNCONNECTED(47 downto 28),
      P(27 downto 16) => tmp_fu_124_p4(11 downto 0),
      P(15) => ret_V_1_reg_219_reg_n_90,
      P(14) => ret_V_1_reg_219_reg_n_91,
      P(13) => ret_V_1_reg_219_reg_n_92,
      P(12) => ret_V_1_reg_219_reg_n_93,
      P(11) => ret_V_1_reg_219_reg_n_94,
      P(10) => ret_V_1_reg_219_reg_n_95,
      P(9) => ret_V_1_reg_219_reg_n_96,
      P(8) => ret_V_1_reg_219_reg_n_97,
      P(7) => ret_V_1_reg_219_reg_n_98,
      P(6) => ret_V_1_reg_219_reg_n_99,
      P(5) => ret_V_1_reg_219_reg_n_100,
      P(4) => ret_V_1_reg_219_reg_n_101,
      P(3) => ret_V_1_reg_219_reg_n_102,
      P(2) => ret_V_1_reg_219_reg_n_103,
      P(1) => ret_V_1_reg_219_reg_n_104,
      P(0) => ret_V_1_reg_219_reg_n_105,
      PATTERNBDETECT => NLW_ret_V_1_reg_219_reg_PATTERNBDETECT_UNCONNECTED,
      PATTERNDETECT => NLW_ret_V_1_reg_219_reg_PATTERNDETECT_UNCONNECTED,
      PCIN(47 downto 0) => B"000000000000000000000000000000000000000000000000",
      PCOUT(47 downto 0) => NLW_ret_V_1_reg_219_reg_PCOUT_UNCONNECTED(47 downto 0),
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
      UNDERFLOW => NLW_ret_V_1_reg_219_reg_UNDERFLOW_UNCONNECTED,
      XOROUT(7 downto 0) => NLW_ret_V_1_reg_219_reg_XOROUT_UNCONNECTED(7 downto 0)
    );
ret_V_1_reg_219_reg_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFEF"
    )
        port map (
      I0 => ap_enable_reg_pp0_iter2,
      I1 => ap_enable_reg_pp0_iter1,
      I2 => \ap_CS_fsm_reg_n_0_[0]\,
      I3 => ap_start,
      O => ret_V_1_reg_219_reg_i_1_n_0
    );
ret_V_reg_209_reg: unisim.vcomponents.DSP48E2
    generic map(
      ACASCREG => 1,
      ADREG => 1,
      ALUMODEREG => 0,
      AMULTSEL => "A",
      AREG => 1,
      AUTORESET_PATDET => "NO_RESET",
      AUTORESET_PRIORITY => "RESET",
      A_INPUT => "DIRECT",
      BCASCREG => 1,
      BMULTSEL => "B",
      BREG => 1,
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
      A(29) => hw_cos_val_V(17),
      A(28) => hw_cos_val_V(17),
      A(27) => hw_cos_val_V(17),
      A(26) => hw_cos_val_V(17),
      A(25) => hw_cos_val_V(17),
      A(24) => hw_cos_val_V(17),
      A(23) => hw_cos_val_V(17),
      A(22) => hw_cos_val_V(17),
      A(21) => hw_cos_val_V(17),
      A(20) => hw_cos_val_V(17),
      A(19) => hw_cos_val_V(17),
      A(18) => hw_cos_val_V(17),
      A(17 downto 0) => hw_cos_val_V(17 downto 0),
      ACIN(29 downto 0) => B"000000000000000000000000000000",
      ACOUT(29 downto 0) => NLW_ret_V_reg_209_reg_ACOUT_UNCONNECTED(29 downto 0),
      ALUMODE(3 downto 0) => B"0000",
      B(17) => mdt_localx_V(14),
      B(16) => mdt_localx_V(14),
      B(15) => mdt_localx_V(14),
      B(14 downto 0) => mdt_localx_V(14 downto 0),
      BCIN(17 downto 0) => B"000000000000000000",
      BCOUT(17 downto 0) => NLW_ret_V_reg_209_reg_BCOUT_UNCONNECTED(17 downto 0),
      C(47 downto 0) => B"000000000000000000000000000000000000000000000000",
      CARRYCASCIN => '0',
      CARRYCASCOUT => NLW_ret_V_reg_209_reg_CARRYCASCOUT_UNCONNECTED,
      CARRYIN => '0',
      CARRYINSEL(2 downto 0) => B"000",
      CARRYOUT(3 downto 0) => NLW_ret_V_reg_209_reg_CARRYOUT_UNCONNECTED(3 downto 0),
      CEA1 => '0',
      CEA2 => ret_V_1_reg_219_reg_i_1_n_0,
      CEAD => '0',
      CEALUMODE => '0',
      CEB1 => '0',
      CEB2 => ret_V_1_reg_219_reg_i_1_n_0,
      CEC => '0',
      CECARRYIN => '0',
      CECTRL => '0',
      CED => '0',
      CEINMODE => '0',
      CEM => ap_enable_reg_pp0_iter10,
      CEP => ret_V_1_reg_2190,
      CLK => ap_clk,
      D(26 downto 0) => B"000000000000000000000000000",
      INMODE(4 downto 0) => B"00000",
      MULTSIGNIN => '0',
      MULTSIGNOUT => NLW_ret_V_reg_209_reg_MULTSIGNOUT_UNCONNECTED,
      OPMODE(8 downto 0) => B"000000101",
      OVERFLOW => NLW_ret_V_reg_209_reg_OVERFLOW_UNCONNECTED,
      P(47 downto 28) => NLW_ret_V_reg_209_reg_P_UNCONNECTED(47 downto 28),
      P(27 downto 16) => zext_ln215_1_cast_reg_224(11 downto 0),
      P(15) => ret_V_reg_209_reg_n_90,
      P(14) => ret_V_reg_209_reg_n_91,
      P(13) => ret_V_reg_209_reg_n_92,
      P(12) => ret_V_reg_209_reg_n_93,
      P(11) => ret_V_reg_209_reg_n_94,
      P(10) => ret_V_reg_209_reg_n_95,
      P(9) => ret_V_reg_209_reg_n_96,
      P(8) => ret_V_reg_209_reg_n_97,
      P(7) => ret_V_reg_209_reg_n_98,
      P(6) => ret_V_reg_209_reg_n_99,
      P(5) => ret_V_reg_209_reg_n_100,
      P(4) => ret_V_reg_209_reg_n_101,
      P(3) => ret_V_reg_209_reg_n_102,
      P(2) => ret_V_reg_209_reg_n_103,
      P(1) => ret_V_reg_209_reg_n_104,
      P(0) => ret_V_reg_209_reg_n_105,
      PATTERNBDETECT => NLW_ret_V_reg_209_reg_PATTERNBDETECT_UNCONNECTED,
      PATTERNDETECT => NLW_ret_V_reg_209_reg_PATTERNDETECT_UNCONNECTED,
      PCIN(47 downto 0) => B"000000000000000000000000000000000000000000000000",
      PCOUT(47 downto 0) => NLW_ret_V_reg_209_reg_PCOUT_UNCONNECTED(47 downto 0),
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
      UNDERFLOW => NLW_ret_V_reg_209_reg_UNDERFLOW_UNCONNECTED,
      XOROUT(7 downto 0) => NLW_ret_V_reg_209_reg_XOROUT_UNCONNECTED(7 downto 0)
    );
\trunc_ln1353_1_reg_214_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_enable_reg_pp0_iter10,
      D => regslice_both_mdt_r_offset_V_U_n_24,
      Q => trunc_ln1353_1_reg_214(0),
      R => '0'
    );
\trunc_ln1353_1_reg_214_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_enable_reg_pp0_iter10,
      D => regslice_both_mdt_r_offset_V_U_n_14,
      Q => trunc_ln1353_1_reg_214(10),
      R => '0'
    );
\trunc_ln1353_1_reg_214_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_enable_reg_pp0_iter10,
      D => regslice_both_mdt_r_offset_V_U_n_13,
      Q => trunc_ln1353_1_reg_214(11),
      R => '0'
    );
\trunc_ln1353_1_reg_214_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_enable_reg_pp0_iter10,
      D => regslice_both_mdt_r_offset_V_U_n_23,
      Q => trunc_ln1353_1_reg_214(1),
      R => '0'
    );
\trunc_ln1353_1_reg_214_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_enable_reg_pp0_iter10,
      D => regslice_both_mdt_r_offset_V_U_n_22,
      Q => trunc_ln1353_1_reg_214(2),
      R => '0'
    );
\trunc_ln1353_1_reg_214_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_enable_reg_pp0_iter10,
      D => regslice_both_mdt_r_offset_V_U_n_21,
      Q => trunc_ln1353_1_reg_214(3),
      R => '0'
    );
\trunc_ln1353_1_reg_214_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_enable_reg_pp0_iter10,
      D => regslice_both_mdt_r_offset_V_U_n_20,
      Q => trunc_ln1353_1_reg_214(4),
      R => '0'
    );
\trunc_ln1353_1_reg_214_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_enable_reg_pp0_iter10,
      D => regslice_both_mdt_r_offset_V_U_n_19,
      Q => trunc_ln1353_1_reg_214(5),
      R => '0'
    );
\trunc_ln1353_1_reg_214_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_enable_reg_pp0_iter10,
      D => regslice_both_mdt_r_offset_V_U_n_18,
      Q => trunc_ln1353_1_reg_214(6),
      R => '0'
    );
\trunc_ln1353_1_reg_214_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_enable_reg_pp0_iter10,
      D => regslice_both_mdt_r_offset_V_U_n_17,
      Q => trunc_ln1353_1_reg_214(7),
      R => '0'
    );
\trunc_ln1353_1_reg_214_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_enable_reg_pp0_iter10,
      D => regslice_both_mdt_r_offset_V_U_n_16,
      Q => trunc_ln1353_1_reg_214(8),
      R => '0'
    );
\trunc_ln1353_1_reg_214_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_enable_reg_pp0_iter10,
      D => regslice_both_mdt_r_offset_V_U_n_15,
      Q => trunc_ln1353_1_reg_214(9),
      R => '0'
    );
\trunc_ln1353_reg_194_pp0_iter1_reg_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ret_V_1_reg_2190,
      D => trunc_ln1353_reg_194(0),
      Q => trunc_ln1353_reg_194_pp0_iter1_reg(0),
      R => '0'
    );
\trunc_ln1353_reg_194_pp0_iter1_reg_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ret_V_1_reg_2190,
      D => trunc_ln1353_reg_194(10),
      Q => trunc_ln1353_reg_194_pp0_iter1_reg(10),
      R => '0'
    );
\trunc_ln1353_reg_194_pp0_iter1_reg_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ret_V_1_reg_2190,
      D => trunc_ln1353_reg_194(11),
      Q => trunc_ln1353_reg_194_pp0_iter1_reg(11),
      R => '0'
    );
\trunc_ln1353_reg_194_pp0_iter1_reg_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ret_V_1_reg_2190,
      D => trunc_ln1353_reg_194(1),
      Q => trunc_ln1353_reg_194_pp0_iter1_reg(1),
      R => '0'
    );
\trunc_ln1353_reg_194_pp0_iter1_reg_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ret_V_1_reg_2190,
      D => trunc_ln1353_reg_194(2),
      Q => trunc_ln1353_reg_194_pp0_iter1_reg(2),
      R => '0'
    );
\trunc_ln1353_reg_194_pp0_iter1_reg_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ret_V_1_reg_2190,
      D => trunc_ln1353_reg_194(3),
      Q => trunc_ln1353_reg_194_pp0_iter1_reg(3),
      R => '0'
    );
\trunc_ln1353_reg_194_pp0_iter1_reg_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ret_V_1_reg_2190,
      D => trunc_ln1353_reg_194(4),
      Q => trunc_ln1353_reg_194_pp0_iter1_reg(4),
      R => '0'
    );
\trunc_ln1353_reg_194_pp0_iter1_reg_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ret_V_1_reg_2190,
      D => trunc_ln1353_reg_194(5),
      Q => trunc_ln1353_reg_194_pp0_iter1_reg(5),
      R => '0'
    );
\trunc_ln1353_reg_194_pp0_iter1_reg_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ret_V_1_reg_2190,
      D => trunc_ln1353_reg_194(6),
      Q => trunc_ln1353_reg_194_pp0_iter1_reg(6),
      R => '0'
    );
\trunc_ln1353_reg_194_pp0_iter1_reg_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ret_V_1_reg_2190,
      D => trunc_ln1353_reg_194(7),
      Q => trunc_ln1353_reg_194_pp0_iter1_reg(7),
      R => '0'
    );
\trunc_ln1353_reg_194_pp0_iter1_reg_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ret_V_1_reg_2190,
      D => trunc_ln1353_reg_194(8),
      Q => trunc_ln1353_reg_194_pp0_iter1_reg(8),
      R => '0'
    );
\trunc_ln1353_reg_194_pp0_iter1_reg_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ret_V_1_reg_2190,
      D => trunc_ln1353_reg_194(9),
      Q => trunc_ln1353_reg_194_pp0_iter1_reg(9),
      R => '0'
    );
\trunc_ln1353_reg_194_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ret_V_1_reg_2190,
      D => regslice_both_mdt_r_offset_V_U_n_24,
      Q => trunc_ln1353_reg_194(0),
      R => '0'
    );
\trunc_ln1353_reg_194_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ret_V_1_reg_2190,
      D => regslice_both_mdt_r_offset_V_U_n_14,
      Q => trunc_ln1353_reg_194(10),
      R => '0'
    );
\trunc_ln1353_reg_194_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ret_V_1_reg_2190,
      D => regslice_both_mdt_r_offset_V_U_n_13,
      Q => trunc_ln1353_reg_194(11),
      R => '0'
    );
\trunc_ln1353_reg_194_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ret_V_1_reg_2190,
      D => regslice_both_mdt_r_offset_V_U_n_23,
      Q => trunc_ln1353_reg_194(1),
      R => '0'
    );
\trunc_ln1353_reg_194_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ret_V_1_reg_2190,
      D => regslice_both_mdt_r_offset_V_U_n_22,
      Q => trunc_ln1353_reg_194(2),
      R => '0'
    );
\trunc_ln1353_reg_194_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ret_V_1_reg_2190,
      D => regslice_both_mdt_r_offset_V_U_n_21,
      Q => trunc_ln1353_reg_194(3),
      R => '0'
    );
\trunc_ln1353_reg_194_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ret_V_1_reg_2190,
      D => regslice_both_mdt_r_offset_V_U_n_20,
      Q => trunc_ln1353_reg_194(4),
      R => '0'
    );
\trunc_ln1353_reg_194_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ret_V_1_reg_2190,
      D => regslice_both_mdt_r_offset_V_U_n_19,
      Q => trunc_ln1353_reg_194(5),
      R => '0'
    );
\trunc_ln1353_reg_194_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ret_V_1_reg_2190,
      D => regslice_both_mdt_r_offset_V_U_n_18,
      Q => trunc_ln1353_reg_194(6),
      R => '0'
    );
\trunc_ln1353_reg_194_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ret_V_1_reg_2190,
      D => regslice_both_mdt_r_offset_V_U_n_17,
      Q => trunc_ln1353_reg_194(7),
      R => '0'
    );
\trunc_ln1353_reg_194_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ret_V_1_reg_2190,
      D => regslice_both_mdt_r_offset_V_U_n_16,
      Q => trunc_ln1353_reg_194(8),
      R => '0'
    );
\trunc_ln1353_reg_194_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ret_V_1_reg_2190,
      D => regslice_both_mdt_r_offset_V_U_n_15,
      Q => trunc_ln1353_reg_194(9),
      R => '0'
    );
\trunc_ln1503_1_reg_235[2]_i_10\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"17E8E817E81717E8"
    )
        port map (
      I0 => tmp_fu_124_p4(5),
      I1 => zext_ln215_1_cast_reg_224(5),
      I2 => trunc_ln1353_1_reg_214(5),
      I3 => tmp_fu_124_p4(6),
      I4 => zext_ln215_1_cast_reg_224(6),
      I5 => trunc_ln1353_1_reg_214(6),
      O => \trunc_ln1503_1_reg_235[2]_i_10_n_0\
    );
\trunc_ln1503_1_reg_235[2]_i_11\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"17E8E817E81717E8"
    )
        port map (
      I0 => tmp_fu_124_p4(4),
      I1 => zext_ln215_1_cast_reg_224(4),
      I2 => trunc_ln1353_1_reg_214(4),
      I3 => tmp_fu_124_p4(5),
      I4 => zext_ln215_1_cast_reg_224(5),
      I5 => trunc_ln1353_1_reg_214(5),
      O => \trunc_ln1503_1_reg_235[2]_i_11_n_0\
    );
\trunc_ln1503_1_reg_235[2]_i_12\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"17E8E817E81717E8"
    )
        port map (
      I0 => tmp_fu_124_p4(3),
      I1 => zext_ln215_1_cast_reg_224(3),
      I2 => trunc_ln1353_1_reg_214(3),
      I3 => tmp_fu_124_p4(4),
      I4 => zext_ln215_1_cast_reg_224(4),
      I5 => trunc_ln1353_1_reg_214(4),
      O => \trunc_ln1503_1_reg_235[2]_i_12_n_0\
    );
\trunc_ln1503_1_reg_235[2]_i_13\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"17E8E817E81717E8"
    )
        port map (
      I0 => tmp_fu_124_p4(2),
      I1 => zext_ln215_1_cast_reg_224(2),
      I2 => trunc_ln1353_1_reg_214(2),
      I3 => tmp_fu_124_p4(3),
      I4 => zext_ln215_1_cast_reg_224(3),
      I5 => trunc_ln1353_1_reg_214(3),
      O => \trunc_ln1503_1_reg_235[2]_i_13_n_0\
    );
\trunc_ln1503_1_reg_235[2]_i_14\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"17E8E817E81717E8"
    )
        port map (
      I0 => tmp_fu_124_p4(1),
      I1 => zext_ln215_1_cast_reg_224(1),
      I2 => trunc_ln1353_1_reg_214(1),
      I3 => tmp_fu_124_p4(2),
      I4 => zext_ln215_1_cast_reg_224(2),
      I5 => trunc_ln1353_1_reg_214(2),
      O => \trunc_ln1503_1_reg_235[2]_i_14_n_0\
    );
\trunc_ln1503_1_reg_235[2]_i_15\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"17E8E817E81717E8"
    )
        port map (
      I0 => tmp_fu_124_p4(0),
      I1 => zext_ln215_1_cast_reg_224(0),
      I2 => trunc_ln1353_1_reg_214(0),
      I3 => tmp_fu_124_p4(1),
      I4 => zext_ln215_1_cast_reg_224(1),
      I5 => trunc_ln1353_1_reg_214(1),
      O => \trunc_ln1503_1_reg_235[2]_i_15_n_0\
    );
\trunc_ln1503_1_reg_235[2]_i_16\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"96"
    )
        port map (
      I0 => trunc_ln1353_1_reg_214(0),
      I1 => zext_ln215_1_cast_reg_224(0),
      I2 => tmp_fu_124_p4(0),
      O => \trunc_ln1503_1_reg_235[2]_i_16_n_0\
    );
\trunc_ln1503_1_reg_235[2]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"E8"
    )
        port map (
      I0 => trunc_ln1353_1_reg_214(6),
      I1 => zext_ln215_1_cast_reg_224(6),
      I2 => tmp_fu_124_p4(6),
      O => \trunc_ln1503_1_reg_235[2]_i_2_n_0\
    );
\trunc_ln1503_1_reg_235[2]_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"E8"
    )
        port map (
      I0 => trunc_ln1353_1_reg_214(5),
      I1 => zext_ln215_1_cast_reg_224(5),
      I2 => tmp_fu_124_p4(5),
      O => \trunc_ln1503_1_reg_235[2]_i_3_n_0\
    );
\trunc_ln1503_1_reg_235[2]_i_4\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"E8"
    )
        port map (
      I0 => trunc_ln1353_1_reg_214(4),
      I1 => zext_ln215_1_cast_reg_224(4),
      I2 => tmp_fu_124_p4(4),
      O => \trunc_ln1503_1_reg_235[2]_i_4_n_0\
    );
\trunc_ln1503_1_reg_235[2]_i_5\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"E8"
    )
        port map (
      I0 => trunc_ln1353_1_reg_214(3),
      I1 => zext_ln215_1_cast_reg_224(3),
      I2 => tmp_fu_124_p4(3),
      O => \trunc_ln1503_1_reg_235[2]_i_5_n_0\
    );
\trunc_ln1503_1_reg_235[2]_i_6\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"E8"
    )
        port map (
      I0 => trunc_ln1353_1_reg_214(2),
      I1 => zext_ln215_1_cast_reg_224(2),
      I2 => tmp_fu_124_p4(2),
      O => \trunc_ln1503_1_reg_235[2]_i_6_n_0\
    );
\trunc_ln1503_1_reg_235[2]_i_7\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"E8"
    )
        port map (
      I0 => trunc_ln1353_1_reg_214(1),
      I1 => zext_ln215_1_cast_reg_224(1),
      I2 => tmp_fu_124_p4(1),
      O => \trunc_ln1503_1_reg_235[2]_i_7_n_0\
    );
\trunc_ln1503_1_reg_235[2]_i_8\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"E8"
    )
        port map (
      I0 => trunc_ln1353_1_reg_214(0),
      I1 => zext_ln215_1_cast_reg_224(0),
      I2 => tmp_fu_124_p4(0),
      O => \trunc_ln1503_1_reg_235[2]_i_8_n_0\
    );
\trunc_ln1503_1_reg_235[2]_i_9\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"17E8E817E81717E8"
    )
        port map (
      I0 => tmp_fu_124_p4(6),
      I1 => zext_ln215_1_cast_reg_224(6),
      I2 => trunc_ln1353_1_reg_214(6),
      I3 => tmp_fu_124_p4(7),
      I4 => zext_ln215_1_cast_reg_224(7),
      I5 => trunc_ln1353_1_reg_214(7),
      O => \trunc_ln1503_1_reg_235[2]_i_9_n_0\
    );
\trunc_ln1503_1_reg_235[6]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"E8"
    )
        port map (
      I0 => trunc_ln1353_1_reg_214(9),
      I1 => zext_ln215_1_cast_reg_224(9),
      I2 => tmp_fu_124_p4(9),
      O => \trunc_ln1503_1_reg_235[6]_i_2_n_0\
    );
\trunc_ln1503_1_reg_235[6]_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"E8"
    )
        port map (
      I0 => trunc_ln1353_1_reg_214(8),
      I1 => zext_ln215_1_cast_reg_224(8),
      I2 => tmp_fu_124_p4(8),
      O => \trunc_ln1503_1_reg_235[6]_i_3_n_0\
    );
\trunc_ln1503_1_reg_235[6]_i_4\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"E8"
    )
        port map (
      I0 => trunc_ln1353_1_reg_214(7),
      I1 => zext_ln215_1_cast_reg_224(7),
      I2 => tmp_fu_124_p4(7),
      O => \trunc_ln1503_1_reg_235[6]_i_4_n_0\
    );
\trunc_ln1503_1_reg_235[6]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"17E8E817E81717E8"
    )
        port map (
      I0 => trunc_ln1353_1_reg_214(10),
      I1 => zext_ln215_1_cast_reg_224(10),
      I2 => tmp_fu_124_p4(10),
      I3 => tmp_fu_124_p4(11),
      I4 => zext_ln215_1_cast_reg_224(11),
      I5 => trunc_ln1353_1_reg_214(11),
      O => \trunc_ln1503_1_reg_235[6]_i_5_n_0\
    );
\trunc_ln1503_1_reg_235[6]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"17E8E817E81717E8"
    )
        port map (
      I0 => tmp_fu_124_p4(9),
      I1 => zext_ln215_1_cast_reg_224(9),
      I2 => trunc_ln1353_1_reg_214(9),
      I3 => tmp_fu_124_p4(10),
      I4 => zext_ln215_1_cast_reg_224(10),
      I5 => trunc_ln1353_1_reg_214(10),
      O => \trunc_ln1503_1_reg_235[6]_i_6_n_0\
    );
\trunc_ln1503_1_reg_235[6]_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"17E8E817E81717E8"
    )
        port map (
      I0 => tmp_fu_124_p4(8),
      I1 => zext_ln215_1_cast_reg_224(8),
      I2 => trunc_ln1353_1_reg_214(8),
      I3 => tmp_fu_124_p4(9),
      I4 => zext_ln215_1_cast_reg_224(9),
      I5 => trunc_ln1353_1_reg_214(9),
      O => \trunc_ln1503_1_reg_235[6]_i_7_n_0\
    );
\trunc_ln1503_1_reg_235[6]_i_8\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"17E8E817E81717E8"
    )
        port map (
      I0 => tmp_fu_124_p4(7),
      I1 => zext_ln215_1_cast_reg_224(7),
      I2 => trunc_ln1353_1_reg_214(7),
      I3 => tmp_fu_124_p4(8),
      I4 => zext_ln215_1_cast_reg_224(8),
      I5 => trunc_ln1353_1_reg_214(8),
      O => \trunc_ln1503_1_reg_235[6]_i_8_n_0\
    );
\trunc_ln1503_1_reg_235_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_enable_reg_pp0_iter10,
      D => add_ln1353_3_fu_163_p2(5),
      Q => \trunc_ln1503_1_reg_235_reg_n_0_[0]\,
      R => '0'
    );
\trunc_ln1503_1_reg_235_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_enable_reg_pp0_iter10,
      D => add_ln1353_3_fu_163_p2(6),
      Q => \trunc_ln1503_1_reg_235_reg_n_0_[1]\,
      R => '0'
    );
\trunc_ln1503_1_reg_235_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_enable_reg_pp0_iter10,
      D => add_ln1353_3_fu_163_p2(7),
      Q => \trunc_ln1503_1_reg_235_reg_n_0_[2]\,
      R => '0'
    );
\trunc_ln1503_1_reg_235_reg[2]_i_1\: unisim.vcomponents.CARRY8
     port map (
      CI => '0',
      CI_TOP => '0',
      CO(7) => \trunc_ln1503_1_reg_235_reg[2]_i_1_n_0\,
      CO(6) => \trunc_ln1503_1_reg_235_reg[2]_i_1_n_1\,
      CO(5) => \trunc_ln1503_1_reg_235_reg[2]_i_1_n_2\,
      CO(4) => \trunc_ln1503_1_reg_235_reg[2]_i_1_n_3\,
      CO(3) => \trunc_ln1503_1_reg_235_reg[2]_i_1_n_4\,
      CO(2) => \trunc_ln1503_1_reg_235_reg[2]_i_1_n_5\,
      CO(1) => \trunc_ln1503_1_reg_235_reg[2]_i_1_n_6\,
      CO(0) => \trunc_ln1503_1_reg_235_reg[2]_i_1_n_7\,
      DI(7) => \trunc_ln1503_1_reg_235[2]_i_2_n_0\,
      DI(6) => \trunc_ln1503_1_reg_235[2]_i_3_n_0\,
      DI(5) => \trunc_ln1503_1_reg_235[2]_i_4_n_0\,
      DI(4) => \trunc_ln1503_1_reg_235[2]_i_5_n_0\,
      DI(3) => \trunc_ln1503_1_reg_235[2]_i_6_n_0\,
      DI(2) => \trunc_ln1503_1_reg_235[2]_i_7_n_0\,
      DI(1) => \trunc_ln1503_1_reg_235[2]_i_8_n_0\,
      DI(0) => '0',
      O(7 downto 5) => add_ln1353_3_fu_163_p2(7 downto 5),
      O(4 downto 0) => \NLW_trunc_ln1503_1_reg_235_reg[2]_i_1_O_UNCONNECTED\(4 downto 0),
      S(7) => \trunc_ln1503_1_reg_235[2]_i_9_n_0\,
      S(6) => \trunc_ln1503_1_reg_235[2]_i_10_n_0\,
      S(5) => \trunc_ln1503_1_reg_235[2]_i_11_n_0\,
      S(4) => \trunc_ln1503_1_reg_235[2]_i_12_n_0\,
      S(3) => \trunc_ln1503_1_reg_235[2]_i_13_n_0\,
      S(2) => \trunc_ln1503_1_reg_235[2]_i_14_n_0\,
      S(1) => \trunc_ln1503_1_reg_235[2]_i_15_n_0\,
      S(0) => \trunc_ln1503_1_reg_235[2]_i_16_n_0\
    );
\trunc_ln1503_1_reg_235_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_enable_reg_pp0_iter10,
      D => add_ln1353_3_fu_163_p2(8),
      Q => \trunc_ln1503_1_reg_235_reg_n_0_[3]\,
      R => '0'
    );
\trunc_ln1503_1_reg_235_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_enable_reg_pp0_iter10,
      D => add_ln1353_3_fu_163_p2(9),
      Q => \trunc_ln1503_1_reg_235_reg_n_0_[4]\,
      R => '0'
    );
\trunc_ln1503_1_reg_235_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_enable_reg_pp0_iter10,
      D => add_ln1353_3_fu_163_p2(10),
      Q => \trunc_ln1503_1_reg_235_reg_n_0_[5]\,
      R => '0'
    );
\trunc_ln1503_1_reg_235_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_enable_reg_pp0_iter10,
      D => add_ln1353_3_fu_163_p2(11),
      Q => \trunc_ln1503_1_reg_235_reg_n_0_[6]\,
      R => '0'
    );
\trunc_ln1503_1_reg_235_reg[6]_i_1\: unisim.vcomponents.CARRY8
     port map (
      CI => \trunc_ln1503_1_reg_235_reg[2]_i_1_n_0\,
      CI_TOP => '0',
      CO(7 downto 3) => \NLW_trunc_ln1503_1_reg_235_reg[6]_i_1_CO_UNCONNECTED\(7 downto 3),
      CO(2) => \trunc_ln1503_1_reg_235_reg[6]_i_1_n_5\,
      CO(1) => \trunc_ln1503_1_reg_235_reg[6]_i_1_n_6\,
      CO(0) => \trunc_ln1503_1_reg_235_reg[6]_i_1_n_7\,
      DI(7 downto 3) => B"00000",
      DI(2) => \trunc_ln1503_1_reg_235[6]_i_2_n_0\,
      DI(1) => \trunc_ln1503_1_reg_235[6]_i_3_n_0\,
      DI(0) => \trunc_ln1503_1_reg_235[6]_i_4_n_0\,
      O(7 downto 4) => \NLW_trunc_ln1503_1_reg_235_reg[6]_i_1_O_UNCONNECTED\(7 downto 4),
      O(3 downto 0) => add_ln1353_3_fu_163_p2(11 downto 8),
      S(7 downto 4) => B"0000",
      S(3) => \trunc_ln1503_1_reg_235[6]_i_5_n_0\,
      S(2) => \trunc_ln1503_1_reg_235[6]_i_6_n_0\,
      S(1) => \trunc_ln1503_1_reg_235[6]_i_7_n_0\,
      S(0) => \trunc_ln1503_1_reg_235[6]_i_8_n_0\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity hls_compute_r_bins is
  port (
    ap_clk : in STD_LOGIC;
    ap_rst_n : in STD_LOGIC;
    ap_start : in STD_LOGIC;
    ap_done : out STD_LOGIC;
    ap_idle : out STD_LOGIC;
    ap_ready : out STD_LOGIC;
    mdt_r_offset_V_TVALID : in STD_LOGIC;
    mdt_r_offset_V_TREADY : out STD_LOGIC;
    mdt_r_offset_V_TDATA : in STD_LOGIC_VECTOR ( 23 downto 0 );
    r_bin_V_TVALID : out STD_LOGIC;
    r_bin_V_TREADY : in STD_LOGIC;
    r_bin_V_TDATA : out STD_LOGIC_VECTOR ( 7 downto 0 );
    mdt_localx_V : in STD_LOGIC_VECTOR ( 14 downto 0 );
    mdt_localy_V : in STD_LOGIC_VECTOR ( 14 downto 0 );
    hw_sin_val_V : in STD_LOGIC_VECTOR ( 17 downto 0 );
    hw_cos_val_V : in STD_LOGIC_VECTOR ( 17 downto 0 )
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of hls_compute_r_bins : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of hls_compute_r_bins : entity is "hls_compute_r_bins,compute_r_bins,{}";
  attribute downgradeipidentifiedwarnings : string;
  attribute downgradeipidentifiedwarnings of hls_compute_r_bins : entity is "yes";
  attribute ip_definition_source : string;
  attribute ip_definition_source of hls_compute_r_bins : entity is "HLS";
  attribute x_core_info : string;
  attribute x_core_info of hls_compute_r_bins : entity is "compute_r_bins,Vivado 2019.2.1";
end hls_compute_r_bins;

architecture STRUCTURE of hls_compute_r_bins is
  attribute x_interface_info : string;
  attribute x_interface_info of ap_clk : signal is "xilinx.com:signal:clock:1.0 ap_clk CLK";
  attribute x_interface_parameter : string;
  attribute x_interface_parameter of ap_clk : signal is "XIL_INTERFACENAME ap_clk, ASSOCIATED_BUSIF mdt_r_offset_V:r_bin_V, ASSOCIATED_RESET ap_rst_n, FREQ_HZ 100000000, PHASE 0.000, INSERT_VIP 0";
  attribute x_interface_info of ap_done : signal is "xilinx.com:interface:acc_handshake:1.0 ap_ctrl done";
  attribute x_interface_info of ap_idle : signal is "xilinx.com:interface:acc_handshake:1.0 ap_ctrl idle";
  attribute x_interface_info of ap_ready : signal is "xilinx.com:interface:acc_handshake:1.0 ap_ctrl ready";
  attribute x_interface_info of ap_rst_n : signal is "xilinx.com:signal:reset:1.0 ap_rst_n RST";
  attribute x_interface_parameter of ap_rst_n : signal is "XIL_INTERFACENAME ap_rst_n, POLARITY ACTIVE_LOW, INSERT_VIP 0";
  attribute x_interface_info of ap_start : signal is "xilinx.com:interface:acc_handshake:1.0 ap_ctrl start";
  attribute x_interface_info of mdt_r_offset_V_TREADY : signal is "xilinx.com:interface:axis:1.0 mdt_r_offset_V TREADY";
  attribute x_interface_info of mdt_r_offset_V_TVALID : signal is "xilinx.com:interface:axis:1.0 mdt_r_offset_V TVALID";
  attribute x_interface_parameter of mdt_r_offset_V_TVALID : signal is "XIL_INTERFACENAME mdt_r_offset_V, TDATA_NUM_BYTES 3, TUSER_WIDTH 0, TDEST_WIDTH 0, TID_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 0, FREQ_HZ 100000000, PHASE 0.000, INSERT_VIP 0";
  attribute x_interface_info of r_bin_V_TREADY : signal is "xilinx.com:interface:axis:1.0 r_bin_V TREADY";
  attribute x_interface_info of r_bin_V_TVALID : signal is "xilinx.com:interface:axis:1.0 r_bin_V TVALID";
  attribute x_interface_parameter of r_bin_V_TVALID : signal is "XIL_INTERFACENAME r_bin_V, TDATA_NUM_BYTES 1, TUSER_WIDTH 0, TDEST_WIDTH 0, TID_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 0, FREQ_HZ 100000000, PHASE 0.000, INSERT_VIP 0";
  attribute x_interface_info of hw_cos_val_V : signal is "xilinx.com:signal:data:1.0 hw_cos_val_V DATA";
  attribute x_interface_parameter of hw_cos_val_V : signal is "XIL_INTERFACENAME hw_cos_val_V, LAYERED_METADATA undef";
  attribute x_interface_info of hw_sin_val_V : signal is "xilinx.com:signal:data:1.0 hw_sin_val_V DATA";
  attribute x_interface_parameter of hw_sin_val_V : signal is "XIL_INTERFACENAME hw_sin_val_V, LAYERED_METADATA undef";
  attribute x_interface_info of mdt_localx_V : signal is "xilinx.com:signal:data:1.0 mdt_localx_V DATA";
  attribute x_interface_parameter of mdt_localx_V : signal is "XIL_INTERFACENAME mdt_localx_V, LAYERED_METADATA undef";
  attribute x_interface_info of mdt_localy_V : signal is "xilinx.com:signal:data:1.0 mdt_localy_V DATA";
  attribute x_interface_parameter of mdt_localy_V : signal is "XIL_INTERFACENAME mdt_localy_V, LAYERED_METADATA undef";
  attribute x_interface_info of mdt_r_offset_V_TDATA : signal is "xilinx.com:interface:axis:1.0 mdt_r_offset_V TDATA";
  attribute x_interface_info of r_bin_V_TDATA : signal is "xilinx.com:interface:axis:1.0 r_bin_V TDATA";
begin
U0: entity work.hls_compute_r_bins_compute_r_bins
     port map (
      ap_clk => ap_clk,
      ap_done => ap_done,
      ap_idle => ap_idle,
      ap_ready => ap_ready,
      ap_rst_n => ap_rst_n,
      ap_start => ap_start,
      hw_cos_val_V(17 downto 0) => hw_cos_val_V(17 downto 0),
      hw_sin_val_V(17 downto 0) => hw_sin_val_V(17 downto 0),
      mdt_localx_V(14 downto 0) => mdt_localx_V(14 downto 0),
      mdt_localy_V(14 downto 0) => mdt_localy_V(14 downto 0),
      mdt_r_offset_V_TDATA(23 downto 0) => mdt_r_offset_V_TDATA(23 downto 0),
      mdt_r_offset_V_TREADY => mdt_r_offset_V_TREADY,
      mdt_r_offset_V_TVALID => mdt_r_offset_V_TVALID,
      r_bin_V_TDATA(7 downto 0) => r_bin_V_TDATA(7 downto 0),
      r_bin_V_TREADY => r_bin_V_TREADY,
      r_bin_V_TVALID => r_bin_V_TVALID
    );
end STRUCTURE;

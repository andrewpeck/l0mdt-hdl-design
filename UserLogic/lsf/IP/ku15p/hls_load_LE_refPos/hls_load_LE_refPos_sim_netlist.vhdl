-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2019.2.1 (lin64) Build 2729669 Thu Dec  5 04:48:12 MST 2019
-- Date        : Mon Mar 29 15:39:10 2021
-- Host        : atlas126a running 64-bit openSUSE Tumbleweed
-- Command     : write_vhdl -force -mode funcsim
--               /mnt/atlas126a/scratch/dcieri/Firmware/l0mdt-hdl-design/UserLogic/lsf/IP/ku15p/hls_load_LE_refPos/hls_load_LE_refPos_sim_netlist.vhdl
-- Design      : hls_load_LE_refPos
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xcku15p-ffva1760-2-e
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity hls_load_LE_refPos_load_LE_refPos is
  port (
    ap_clk : in STD_LOGIC;
    ap_rst : in STD_LOGIC;
    ap_start : in STD_LOGIC;
    ap_done : out STD_LOGIC;
    ap_idle : out STD_LOGIC;
    ap_ready : out STD_LOGIC;
    mdtid_V : in STD_LOGIC_VECTOR ( 8 downto 0 );
    slcvec_pos_ref_V : out STD_LOGIC_VECTOR ( 17 downto 0 );
    hewindow_pos_ref_V : out STD_LOGIC_VECTOR ( 17 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of hls_load_LE_refPos_load_LE_refPos : entity is "load_LE_refPos";
end hls_load_LE_refPos_load_LE_refPos;

architecture STRUCTURE of hls_load_LE_refPos_load_LE_refPos is
  signal \<const0>\ : STD_LOGIC;
  signal \^ap_done\ : STD_LOGIC;
  signal ap_enable_reg_pp0_iter1 : STD_LOGIC;
  signal \^ap_start\ : STD_LOGIC;
  signal \^hewindow_pos_ref_v\ : STD_LOGIC_VECTOR ( 16 downto 1 );
  signal q0_reg_i_12_n_0 : STD_LOGIC;
  signal q0_reg_i_2_n_0 : STD_LOGIC;
  signal q0_reg_i_3_n_0 : STD_LOGIC;
  signal q0_reg_i_4_n_0 : STD_LOGIC;
  signal q0_reg_i_5_n_0 : STD_LOGIC;
  signal q0_reg_i_6_n_0 : STD_LOGIC;
  signal q0_reg_i_7_n_0 : STD_LOGIC;
  signal q0_reg_i_8_n_0 : STD_LOGIC;
  signal q0_reg_i_9_n_0 : STD_LOGIC;
  signal ret_V_3_fu_118_p2 : STD_LOGIC_VECTOR ( 9 to 9 );
  signal ret_V_fu_95_p2 : STD_LOGIC_VECTOR ( 9 downto 0 );
  signal \^slcvec_pos_ref_v\ : STD_LOGIC_VECTOR ( 16 downto 1 );
  signal NLW_q0_reg_CASDOUTA_UNCONNECTED : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal NLW_q0_reg_CASDOUTB_UNCONNECTED : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal NLW_q0_reg_CASDOUTPA_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_q0_reg_CASDOUTPB_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_q0_reg_DOUTADOUT_UNCONNECTED : STD_LOGIC_VECTOR ( 15 downto 13 );
  signal NLW_q0_reg_DOUTBDOUT_UNCONNECTED : STD_LOGIC_VECTOR ( 15 downto 13 );
  signal NLW_q0_reg_DOUTPADOUTP_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_q0_reg_DOUTPBDOUTP_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute \MEM.PORTA.DATA_BIT_LAYOUT\ : string;
  attribute \MEM.PORTA.DATA_BIT_LAYOUT\ of q0_reg : label is "p0_d13";
  attribute METHODOLOGY_DRC_VIOS : string;
  attribute METHODOLOGY_DRC_VIOS of q0_reg : label is "";
  attribute OPT_MODIFIED : string;
  attribute OPT_MODIFIED of q0_reg : label is "MLO";
  attribute RDADDR_COLLISION_HWCONFIG : string;
  attribute RDADDR_COLLISION_HWCONFIG of q0_reg : label is "PERFORMANCE";
  attribute RTL_RAM_BITS : integer;
  attribute RTL_RAM_BITS of q0_reg : label is 13312;
  attribute RTL_RAM_NAME : string;
  attribute RTL_RAM_NAME of q0_reg : label is "q0";
  attribute bram_addr_begin : integer;
  attribute bram_addr_begin of q0_reg : label is 0;
  attribute bram_addr_end : integer;
  attribute bram_addr_end of q0_reg : label is 1023;
  attribute bram_slice_begin : integer;
  attribute bram_slice_begin of q0_reg : label is 0;
  attribute bram_slice_end : integer;
  attribute bram_slice_end of q0_reg : label is 12;
  attribute ram_addr_begin : integer;
  attribute ram_addr_begin of q0_reg : label is 0;
  attribute ram_addr_end : integer;
  attribute ram_addr_end of q0_reg : label is 1023;
  attribute ram_offset : integer;
  attribute ram_offset of q0_reg : label is 0;
  attribute ram_slice_begin : integer;
  attribute ram_slice_begin of q0_reg : label is 0;
  attribute ram_slice_end : integer;
  attribute ram_slice_end of q0_reg : label is 12;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of q0_reg_i_1 : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of q0_reg_i_11 : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of q0_reg_i_2 : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of q0_reg_i_3 : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of q0_reg_i_6 : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of q0_reg_i_7 : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of q0_reg_i_8 : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of q0_reg_i_9 : label is "soft_lutpair3";
begin
  \^ap_start\ <= ap_start;
  ap_done <= \^ap_done\;
  ap_ready <= \^ap_start\;
  hewindow_pos_ref_V(17) <= \<const0>\;
  hewindow_pos_ref_V(16 downto 14) <= \^hewindow_pos_ref_v\(16 downto 14);
  hewindow_pos_ref_V(13 downto 12) <= \^hewindow_pos_ref_v\(16 downto 15);
  hewindow_pos_ref_V(11 downto 7) <= \^hewindow_pos_ref_v\(11 downto 7);
  hewindow_pos_ref_V(6) <= \^hewindow_pos_ref_v\(16);
  hewindow_pos_ref_V(5 downto 1) <= \^hewindow_pos_ref_v\(5 downto 1);
  hewindow_pos_ref_V(0) <= \^hewindow_pos_ref_v\(1);
  slcvec_pos_ref_V(17) <= \<const0>\;
  slcvec_pos_ref_V(16 downto 14) <= \^slcvec_pos_ref_v\(16 downto 14);
  slcvec_pos_ref_V(13 downto 12) <= \^slcvec_pos_ref_v\(16 downto 15);
  slcvec_pos_ref_V(11 downto 7) <= \^slcvec_pos_ref_v\(11 downto 7);
  slcvec_pos_ref_V(6) <= \^slcvec_pos_ref_v\(16);
  slcvec_pos_ref_V(5 downto 1) <= \^slcvec_pos_ref_v\(5 downto 1);
  slcvec_pos_ref_V(0) <= \^slcvec_pos_ref_v\(1);
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
      Q => \^ap_done\,
      R => ap_rst
    );
ap_idle_INST_0: unisim.vcomponents.LUT3
    generic map(
      INIT => X"01"
    )
        port map (
      I0 => ap_enable_reg_pp0_iter1,
      I1 => \^ap_done\,
      I2 => \^ap_start\,
      O => ap_idle
    );
q0_reg: unisim.vcomponents.RAMB18E2
    generic map(
      CASCADE_ORDER_A => "NONE",
      CASCADE_ORDER_B => "NONE",
      CLOCK_DOMAINS => "COMMON",
      DOA_REG => 1,
      DOB_REG => 1,
      ENADDRENA => "FALSE",
      ENADDRENB => "FALSE",
      INITP_00 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_01 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_02 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_03 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_04 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_05 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_06 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_07 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_00 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_01 => X"000000000000000000000000000000000000000012B312B312B312B312B312B3",
      INIT_02 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_03 => X"00000000000000000000000000000000000000001BCB1BCB1BCB1BCB1BCB1BCB",
      INIT_04 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_05 => X"0000000000000000000000000000000000000000062F062F062F062F062F062F",
      INIT_06 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_07 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_08 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_09 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_10 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_11 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_12 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_13 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_14 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_15 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_16 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_17 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_18 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_19 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_20 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_21 => X"0000000000000000000000000000000000000000112F112F112F112F112F112F",
      INIT_22 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_23 => X"000000000000000000000000000000000000000019E919E919E919E919E919E9",
      INIT_24 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_25 => X"0000000000000000000000000000000000000000044D044D044D044D044D044D",
      INIT_26 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_27 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_28 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_29 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_30 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_31 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_32 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_33 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_34 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_35 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_36 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_37 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_38 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_39 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_A => B"00" & X"0000",
      INIT_B => B"00" & X"0000",
      INIT_FILE => "NONE",
      RDADDRCHANGEA => "FALSE",
      RDADDRCHANGEB => "FALSE",
      READ_WIDTH_A => 18,
      READ_WIDTH_B => 18,
      RSTREG_PRIORITY_A => "RSTREG",
      RSTREG_PRIORITY_B => "RSTREG",
      SIM_COLLISION_CHECK => "ALL",
      SLEEP_ASYNC => "FALSE",
      SRVAL_A => B"00" & X"0000",
      SRVAL_B => B"00" & X"0000",
      WRITE_MODE_A => "WRITE_FIRST",
      WRITE_MODE_B => "WRITE_FIRST",
      WRITE_WIDTH_A => 18,
      WRITE_WIDTH_B => 0
    )
        port map (
      ADDRARDADDR(13) => ret_V_fu_95_p2(9),
      ADDRARDADDR(12) => q0_reg_i_2_n_0,
      ADDRARDADDR(11) => q0_reg_i_3_n_0,
      ADDRARDADDR(10) => q0_reg_i_4_n_0,
      ADDRARDADDR(9) => q0_reg_i_5_n_0,
      ADDRARDADDR(8) => q0_reg_i_6_n_0,
      ADDRARDADDR(7) => q0_reg_i_7_n_0,
      ADDRARDADDR(6) => q0_reg_i_8_n_0,
      ADDRARDADDR(5) => q0_reg_i_9_n_0,
      ADDRARDADDR(4) => ret_V_fu_95_p2(0),
      ADDRARDADDR(3 downto 0) => B"0000",
      ADDRBWRADDR(13) => ret_V_3_fu_118_p2(9),
      ADDRBWRADDR(12) => q0_reg_i_2_n_0,
      ADDRBWRADDR(11) => q0_reg_i_3_n_0,
      ADDRBWRADDR(10) => q0_reg_i_4_n_0,
      ADDRBWRADDR(9) => q0_reg_i_5_n_0,
      ADDRBWRADDR(8) => q0_reg_i_6_n_0,
      ADDRBWRADDR(7) => q0_reg_i_7_n_0,
      ADDRBWRADDR(6) => q0_reg_i_8_n_0,
      ADDRBWRADDR(5) => q0_reg_i_9_n_0,
      ADDRBWRADDR(4) => ret_V_fu_95_p2(0),
      ADDRBWRADDR(3 downto 0) => B"0000",
      ADDRENA => '0',
      ADDRENB => '0',
      CASDIMUXA => '0',
      CASDIMUXB => '0',
      CASDINA(15 downto 0) => B"0000000000000000",
      CASDINB(15 downto 0) => B"0000000000000000",
      CASDINPA(1 downto 0) => B"00",
      CASDINPB(1 downto 0) => B"00",
      CASDOMUXA => '0',
      CASDOMUXB => '0',
      CASDOMUXEN_A => '1',
      CASDOMUXEN_B => '1',
      CASDOUTA(15 downto 0) => NLW_q0_reg_CASDOUTA_UNCONNECTED(15 downto 0),
      CASDOUTB(15 downto 0) => NLW_q0_reg_CASDOUTB_UNCONNECTED(15 downto 0),
      CASDOUTPA(1 downto 0) => NLW_q0_reg_CASDOUTPA_UNCONNECTED(1 downto 0),
      CASDOUTPB(1 downto 0) => NLW_q0_reg_CASDOUTPB_UNCONNECTED(1 downto 0),
      CASOREGIMUXA => '0',
      CASOREGIMUXB => '0',
      CASOREGIMUXEN_A => '1',
      CASOREGIMUXEN_B => '1',
      CLKARDCLK => ap_clk,
      CLKBWRCLK => ap_clk,
      DINADIN(15 downto 0) => B"0001111111111111",
      DINBDIN(15 downto 0) => B"1111111111111111",
      DINPADINP(1 downto 0) => B"00",
      DINPBDINP(1 downto 0) => B"11",
      DOUTADOUT(15 downto 13) => NLW_q0_reg_DOUTADOUT_UNCONNECTED(15 downto 13),
      DOUTADOUT(12 downto 11) => \^slcvec_pos_ref_v\(15 downto 14),
      DOUTADOUT(10) => \^slcvec_pos_ref_v\(16),
      DOUTADOUT(9 downto 5) => \^slcvec_pos_ref_v\(11 downto 7),
      DOUTADOUT(4 downto 0) => \^slcvec_pos_ref_v\(5 downto 1),
      DOUTBDOUT(15 downto 13) => NLW_q0_reg_DOUTBDOUT_UNCONNECTED(15 downto 13),
      DOUTBDOUT(12 downto 11) => \^hewindow_pos_ref_v\(15 downto 14),
      DOUTBDOUT(10) => \^hewindow_pos_ref_v\(16),
      DOUTBDOUT(9 downto 5) => \^hewindow_pos_ref_v\(11 downto 7),
      DOUTBDOUT(4 downto 0) => \^hewindow_pos_ref_v\(5 downto 1),
      DOUTPADOUTP(1 downto 0) => NLW_q0_reg_DOUTPADOUTP_UNCONNECTED(1 downto 0),
      DOUTPBDOUTP(1 downto 0) => NLW_q0_reg_DOUTPBDOUTP_UNCONNECTED(1 downto 0),
      ENARDEN => \^ap_start\,
      ENBWREN => \^ap_start\,
      REGCEAREGCE => ap_enable_reg_pp0_iter1,
      REGCEB => ap_enable_reg_pp0_iter1,
      RSTRAMARSTRAM => '0',
      RSTRAMB => '0',
      RSTREGARSTREG => '0',
      RSTREGB => '0',
      SLEEP => '0',
      WEA(1 downto 0) => B"00",
      WEBWE(3 downto 0) => B"0000"
    );
q0_reg_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0001"
    )
        port map (
      I0 => mdtid_V(8),
      I1 => mdtid_V(6),
      I2 => q0_reg_i_12_n_0,
      I3 => mdtid_V(7),
      O => ret_V_fu_95_p2(9)
    );
q0_reg_i_10: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => mdtid_V(0),
      O => ret_V_fu_95_p2(0)
    );
q0_reg_i_11: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => mdtid_V(7),
      I1 => q0_reg_i_12_n_0,
      I2 => mdtid_V(6),
      I3 => mdtid_V(8),
      O => ret_V_3_fu_118_p2(9)
    );
q0_reg_i_12: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
        port map (
      I0 => mdtid_V(4),
      I1 => mdtid_V(2),
      I2 => mdtid_V(0),
      I3 => mdtid_V(1),
      I4 => mdtid_V(3),
      I5 => mdtid_V(5),
      O => q0_reg_i_12_n_0
    );
q0_reg_i_2: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FE01"
    )
        port map (
      I0 => mdtid_V(7),
      I1 => q0_reg_i_12_n_0,
      I2 => mdtid_V(6),
      I3 => mdtid_V(8),
      O => q0_reg_i_2_n_0
    );
q0_reg_i_3: unisim.vcomponents.LUT3
    generic map(
      INIT => X"E1"
    )
        port map (
      I0 => mdtid_V(6),
      I1 => q0_reg_i_12_n_0,
      I2 => mdtid_V(7),
      O => q0_reg_i_3_n_0
    );
q0_reg_i_4: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => q0_reg_i_12_n_0,
      I1 => mdtid_V(6),
      O => q0_reg_i_4_n_0
    );
q0_reg_i_5: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFE00000001"
    )
        port map (
      I0 => mdtid_V(4),
      I1 => mdtid_V(2),
      I2 => mdtid_V(0),
      I3 => mdtid_V(1),
      I4 => mdtid_V(3),
      I5 => mdtid_V(5),
      O => q0_reg_i_5_n_0
    );
q0_reg_i_6: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFE0001"
    )
        port map (
      I0 => mdtid_V(3),
      I1 => mdtid_V(1),
      I2 => mdtid_V(0),
      I3 => mdtid_V(2),
      I4 => mdtid_V(4),
      O => q0_reg_i_6_n_0
    );
q0_reg_i_7: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FE01"
    )
        port map (
      I0 => mdtid_V(2),
      I1 => mdtid_V(0),
      I2 => mdtid_V(1),
      I3 => mdtid_V(3),
      O => q0_reg_i_7_n_0
    );
q0_reg_i_8: unisim.vcomponents.LUT3
    generic map(
      INIT => X"E1"
    )
        port map (
      I0 => mdtid_V(1),
      I1 => mdtid_V(0),
      I2 => mdtid_V(2),
      O => q0_reg_i_8_n_0
    );
q0_reg_i_9: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => mdtid_V(0),
      I1 => mdtid_V(1),
      O => q0_reg_i_9_n_0
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity hls_load_LE_refPos is
  port (
    ap_clk : in STD_LOGIC;
    ap_rst : in STD_LOGIC;
    ap_start : in STD_LOGIC;
    ap_done : out STD_LOGIC;
    ap_idle : out STD_LOGIC;
    ap_ready : out STD_LOGIC;
    mdtid_V : in STD_LOGIC_VECTOR ( 8 downto 0 );
    slcvec_pos_ref_V : out STD_LOGIC_VECTOR ( 17 downto 0 );
    hewindow_pos_ref_V : out STD_LOGIC_VECTOR ( 17 downto 0 )
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of hls_load_LE_refPos : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of hls_load_LE_refPos : entity is "hls_load_LE_refPos,load_LE_refPos,{}";
  attribute downgradeipidentifiedwarnings : string;
  attribute downgradeipidentifiedwarnings of hls_load_LE_refPos : entity is "yes";
  attribute ip_definition_source : string;
  attribute ip_definition_source of hls_load_LE_refPos : entity is "HLS";
  attribute x_core_info : string;
  attribute x_core_info of hls_load_LE_refPos : entity is "load_LE_refPos,Vivado 2019.2.1";
end hls_load_LE_refPos;

architecture STRUCTURE of hls_load_LE_refPos is
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
  attribute x_interface_info of hewindow_pos_ref_V : signal is "xilinx.com:signal:data:1.0 hewindow_pos_ref_V DATA";
  attribute x_interface_parameter of hewindow_pos_ref_V : signal is "XIL_INTERFACENAME hewindow_pos_ref_V, LAYERED_METADATA undef";
  attribute x_interface_info of mdtid_V : signal is "xilinx.com:signal:data:1.0 mdtid_V DATA";
  attribute x_interface_parameter of mdtid_V : signal is "XIL_INTERFACENAME mdtid_V, LAYERED_METADATA undef";
  attribute x_interface_info of slcvec_pos_ref_V : signal is "xilinx.com:signal:data:1.0 slcvec_pos_ref_V DATA";
  attribute x_interface_parameter of slcvec_pos_ref_V : signal is "XIL_INTERFACENAME slcvec_pos_ref_V, LAYERED_METADATA undef";
begin
U0: entity work.hls_load_LE_refPos_load_LE_refPos
     port map (
      ap_clk => ap_clk,
      ap_done => ap_done,
      ap_idle => ap_idle,
      ap_ready => ap_ready,
      ap_rst => ap_rst,
      ap_start => ap_start,
      hewindow_pos_ref_V(17 downto 0) => hewindow_pos_ref_V(17 downto 0),
      mdtid_V(8 downto 0) => mdtid_V(8 downto 0),
      slcvec_pos_ref_V(17 downto 0) => slcvec_pos_ref_V(17 downto 0)
    );
end STRUCTURE;

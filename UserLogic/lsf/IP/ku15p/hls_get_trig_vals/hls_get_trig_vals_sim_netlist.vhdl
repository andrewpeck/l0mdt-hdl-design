-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2019.2.1 (lin64) Build 2729669 Thu Dec  5 04:48:12 MST 2019
-- Date        : Mon Mar 29 15:39:03 2021
-- Host        : atlas126a running 64-bit openSUSE Tumbleweed
-- Command     : write_vhdl -force -mode funcsim
--               /mnt/atlas126a/scratch/dcieri/Firmware/l0mdt-hdl-design/UserLogic/lsf/IP/ku15p/hls_get_trig_vals/hls_get_trig_vals_sim_netlist.vhdl
-- Design      : hls_get_trig_vals
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xcku15p-ffva1760-2-e
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity hls_get_trig_vals_get_trig_vals_lutbkb_rom is
  port (
    hw_trig_vals_0_V : out STD_LOGIC_VECTOR ( 35 downto 0 );
    hw_trig_vals_8_V : out STD_LOGIC_VECTOR ( 35 downto 0 );
    ap_clk : in STD_LOGIC;
    ce1 : in STD_LOGIC;
    ap_enable_reg_pp0_iter3 : in STD_LOGIC;
    add_ln1353_reg_1512 : in STD_LOGIC_VECTOR ( 12 downto 0 );
    tmp_1_reg_1529 : in STD_LOGIC_VECTOR ( 7 downto 0 );
    icmp_ln895_1_reg_1524 : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of hls_get_trig_vals_get_trig_vals_lutbkb_rom : entity is "get_trig_vals_lutbkb_rom";
end hls_get_trig_vals_get_trig_vals_lutbkb_rom;

architecture STRUCTURE of hls_get_trig_vals_get_trig_vals_lutbkb_rom is
  signal q0_reg_i_10_n_0 : STD_LOGIC;
  signal q0_reg_i_11_n_0 : STD_LOGIC;
  signal q0_reg_i_12_n_0 : STD_LOGIC;
  signal q0_reg_i_13_n_0 : STD_LOGIC;
  signal q0_reg_i_9_n_0 : STD_LOGIC;
  signal q1_reg_i_1_n_0 : STD_LOGIC;
  signal q1_reg_i_2_n_0 : STD_LOGIC;
  signal q1_reg_i_3_n_0 : STD_LOGIC;
  signal q1_reg_i_4_n_0 : STD_LOGIC;
  signal q1_reg_i_5_n_0 : STD_LOGIC;
  signal q1_reg_i_6_n_0 : STD_LOGIC;
  signal q1_reg_i_7_n_0 : STD_LOGIC;
  signal q1_reg_i_8_n_0 : STD_LOGIC;
  signal q1_reg_i_9_n_0 : STD_LOGIC;
  signal sel : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal NLW_q0_reg_CASDOUTA_UNCONNECTED : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal NLW_q0_reg_CASDOUTB_UNCONNECTED : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal NLW_q0_reg_CASDOUTPA_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_q0_reg_CASDOUTPB_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_q1_reg_CASDOUTA_UNCONNECTED : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal NLW_q1_reg_CASDOUTB_UNCONNECTED : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal NLW_q1_reg_CASDOUTPA_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_q1_reg_CASDOUTPB_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute \MEM.PORTA.DATA_BIT_LAYOUT\ : string;
  attribute \MEM.PORTA.DATA_BIT_LAYOUT\ of q0_reg : label is "p2_d16";
  attribute \MEM.PORTB.DATA_BIT_LAYOUT\ : string;
  attribute \MEM.PORTB.DATA_BIT_LAYOUT\ of q0_reg : label is "p2_d16";
  attribute METHODOLOGY_DRC_VIOS : string;
  attribute METHODOLOGY_DRC_VIOS of q0_reg : label is "";
  attribute OPT_MODIFIED : string;
  attribute OPT_MODIFIED of q0_reg : label is "MLO";
  attribute RDADDR_COLLISION_HWCONFIG : string;
  attribute RDADDR_COLLISION_HWCONFIG of q0_reg : label is "DELAYED_WRITE";
  attribute RTL_RAM_BITS : integer;
  attribute RTL_RAM_BITS of q0_reg : label is 9216;
  attribute RTL_RAM_NAME : string;
  attribute RTL_RAM_NAME of q0_reg : label is "lut_tables_0_U/get_trig_vals_lutbkb_rom_U/q0";
  attribute bram_addr_begin : integer;
  attribute bram_addr_begin of q0_reg : label is 0;
  attribute bram_addr_end : integer;
  attribute bram_addr_end of q0_reg : label is 255;
  attribute bram_slice_begin : integer;
  attribute bram_slice_begin of q0_reg : label is 0;
  attribute bram_slice_end : integer;
  attribute bram_slice_end of q0_reg : label is 17;
  attribute ram_addr_begin : integer;
  attribute ram_addr_begin of q0_reg : label is 0;
  attribute ram_addr_end : integer;
  attribute ram_addr_end of q0_reg : label is 255;
  attribute ram_ext_slice_begin : integer;
  attribute ram_ext_slice_begin of q0_reg : label is 18;
  attribute ram_ext_slice_end : integer;
  attribute ram_ext_slice_end of q0_reg : label is 35;
  attribute ram_offset : integer;
  attribute ram_offset of q0_reg : label is 0;
  attribute ram_slice_begin : integer;
  attribute ram_slice_begin of q0_reg : label is 0;
  attribute ram_slice_end : integer;
  attribute ram_slice_end of q0_reg : label is 17;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of q0_reg_i_10 : label is "soft_lutpair2";
  attribute \MEM.PORTA.DATA_BIT_LAYOUT\ of q1_reg : label is "p2_d16";
  attribute \MEM.PORTB.DATA_BIT_LAYOUT\ of q1_reg : label is "p2_d16";
  attribute METHODOLOGY_DRC_VIOS of q1_reg : label is "";
  attribute OPT_MODIFIED of q1_reg : label is "MLO";
  attribute RDADDR_COLLISION_HWCONFIG of q1_reg : label is "DELAYED_WRITE";
  attribute RTL_RAM_BITS of q1_reg : label is 9216;
  attribute RTL_RAM_NAME of q1_reg : label is "lut_tables_0_U/get_trig_vals_lutbkb_rom_U/q1";
  attribute bram_addr_begin of q1_reg : label is 0;
  attribute bram_addr_end of q1_reg : label is 255;
  attribute bram_slice_begin of q1_reg : label is 0;
  attribute bram_slice_end of q1_reg : label is 17;
  attribute ram_addr_begin of q1_reg : label is 0;
  attribute ram_addr_end of q1_reg : label is 255;
  attribute ram_ext_slice_begin of q1_reg : label is 18;
  attribute ram_ext_slice_end of q1_reg : label is 35;
  attribute ram_offset of q1_reg : label is 0;
  attribute ram_slice_begin of q1_reg : label is 0;
  attribute ram_slice_end of q1_reg : label is 17;
  attribute SOFT_HLUTNM of q1_reg_i_4 : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of q1_reg_i_5 : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of q1_reg_i_6 : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of q1_reg_i_7 : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of q1_reg_i_9 : label is "soft_lutpair0";
begin
q0_reg: unisim.vcomponents.RAMB18E2
    generic map(
      CASCADE_ORDER_A => "NONE",
      CASCADE_ORDER_B => "NONE",
      CLOCK_DOMAINS => "COMMON",
      DOA_REG => 1,
      DOB_REG => 1,
      ENADDRENA => "FALSE",
      ENADDRENB => "FALSE",
      INITP_00 => X"AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA",
      INITP_01 => X"000000000000000000000000000003FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEAAA",
      INITP_02 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_03 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_04 => X"55555555555555555555555555555000000000000000000000000000000000FF",
      INITP_05 => X"0000000000000000000000000000015555555555555555555555555555555555",
      INITP_06 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_07 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_00 => X"020801AE015E011500D5009E006E004700290013000500000003000E0022003E",
      INIT_01 => X"0C030B250A50098208BD0801074C06A005FC056004CD044203BF034502D30269",
      INIT_02 => X"1E2A1CCB1B751A2618DF17A1166A153B141512F611DF10D10FCB0ECC0DD60CE8",
      INIT_03 => X"38303657348532BA30F72F3C2D882BDC2A37289A2705257823F2227420FE1F90",
      INIT_04 => X"59AB575E551752D850A04E6F4C464A23480745F343E641E03FE13DEA3BFA3A12",
      INIT_05 => X"820C7F557CA479FA775674B972226F926D086A8568086592632360BB5E595BFE",
      INIT_06 => X"B0ABAD96AA86A77CA477A1799E809B8C989F95B892D68FFA8D258A55878C84C9",
      INIT_07 => X"E4C5E15EDDFCDA9FD746D3F3D0A4CD5ACA16C6D6C39BC066BD36BA0BB6E6B3C5",
      INIT_08 => X"1D8019D61630128D0EEF0B5407BE042B009DFD13F98DF60BF28EEF15EBA0E830",
      INIT_09 => X"59EF561152364E5E4A8846B642E63F1A3B51378B33C830092C4D289424DF212E",
      INIT_0A => X"9915951391138D158918851E81267D2F793B7549715A6D6C6981659961B35DD0",
      INIT_0B => X"D9E9D5D4D1C0CDADC99AC589C178BD68B95AB54CB140AD35A92CA524A11D9D18",
      INIT_0C => X"00000000000000000000000000000000000000000000EE59EA42E62BE214DDFE",
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
      INIT_20 => X"2D90297C256721511D3B1925150E10F70CDF08C704AF0097FC7FF867F450F038",
      INIT_21 => X"6E416A40663E623B5E355A2E5626521C4E114A0545F741E83DD939C835B631A3",
      INIT_22 => X"AD24A948A56AA1899DA599BF95D691EA8DFD8A0D861A82267E2F7A36763C723F",
      INIT_23 => X"E933E58CE1E1DE33DA81D6CBD312CF56CB96C7D3C40CC042BC76B8A6B4D3B0FD",
      INIT_24 => X"21721E0F1AA8173C13CB10560CDC095E05DC0255FECAFB3BF7A8F410F075ECD6",
      INIT_25 => X"54F651E64ECF4BB44893456C42413F103BD9389E355E32182ECD2B7E282924D0",
      INIT_26 => X"82E880367D7E7AC077FC753272616F8A6CAE69CB66E363F461005E065B075801",
      INIT_27 => X"AA86A83FA5F1A39CA1409EDD9C749A03978C950F928A90008D6E8AD688388593",
      INIT_28 => X"CB2DC959C77EC59CC3B2C1C1BFC9BDC9BBC2B9B4B79EB581B35DB132AF00ACC7",
      INIT_29 => X"E452E2FAE19AE032DEC3DD4BDBCCDA45D8B7D720D582D3DCD22FD07ACEBDCCF9",
      INIT_2A => X"F58CF4B5F3D7F2EFF200F109F009EF01EDF2ECDAEBBAEA92E962E82AE6EAE5A2",
      INIT_2B => X"FE94FE42FDE8FD85FD1AFCA6FC2AFBA6FB1AFA85F9E8F943F895F7DFF721F65B",
      INIT_2C => X"00000000000000000000000000000000000000000000FFB2FF89FF59FF20FEDE",
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
      WRITE_WIDTH_B => 18
    )
        port map (
      ADDRARDADDR(13 downto 12) => B"00",
      ADDRARDADDR(11 downto 4) => sel(7 downto 0),
      ADDRARDADDR(3 downto 0) => B"0000",
      ADDRBWRADDR(13 downto 12) => B"10",
      ADDRBWRADDR(11 downto 4) => sel(7 downto 0),
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
      DINADIN(15 downto 0) => B"1111111111111111",
      DINBDIN(15 downto 0) => B"1111111111111111",
      DINPADINP(1 downto 0) => B"11",
      DINPBDINP(1 downto 0) => B"11",
      DOUTADOUT(15 downto 0) => hw_trig_vals_0_V(15 downto 0),
      DOUTBDOUT(15 downto 0) => hw_trig_vals_0_V(33 downto 18),
      DOUTPADOUTP(1 downto 0) => hw_trig_vals_0_V(17 downto 16),
      DOUTPBDOUTP(1 downto 0) => hw_trig_vals_0_V(35 downto 34),
      ENARDEN => ce1,
      ENBWREN => ce1,
      REGCEAREGCE => ap_enable_reg_pp0_iter3,
      REGCEB => ap_enable_reg_pp0_iter3,
      RSTRAMARSTRAM => '0',
      RSTRAMB => '0',
      RSTREGARSTREG => '0',
      RSTREGB => '0',
      SLEEP => '0',
      WEA(1 downto 0) => B"00",
      WEBWE(3 downto 0) => B"0000"
    );
q0_reg_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7777777F88888880"
    )
        port map (
      I0 => add_ln1353_reg_1512(9),
      I1 => q0_reg_i_9_n_0,
      I2 => q0_reg_i_10_n_0,
      I3 => add_ln1353_reg_1512(8),
      I4 => q0_reg_i_11_n_0,
      I5 => add_ln1353_reg_1512(10),
      O => sel(7)
    );
q0_reg_i_10: unisim.vcomponents.LUT3
    generic map(
      INIT => X"E0"
    )
        port map (
      I0 => add_ln1353_reg_1512(4),
      I1 => add_ln1353_reg_1512(3),
      I2 => add_ln1353_reg_1512(5),
      O => q0_reg_i_10_n_0
    );
q0_reg_i_11: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => add_ln1353_reg_1512(7),
      I1 => add_ln1353_reg_1512(6),
      O => q0_reg_i_11_n_0
    );
q0_reg_i_12: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFEFEFE"
    )
        port map (
      I0 => add_ln1353_reg_1512(7),
      I1 => add_ln1353_reg_1512(6),
      I2 => add_ln1353_reg_1512(8),
      I3 => add_ln1353_reg_1512(4),
      I4 => add_ln1353_reg_1512(5),
      O => q0_reg_i_12_n_0
    );
q0_reg_i_13: unisim.vcomponents.LUT5
    generic map(
      INIT => X"88888880"
    )
        port map (
      I0 => add_ln1353_reg_1512(3),
      I1 => add_ln1353_reg_1512(5),
      I2 => add_ln1353_reg_1512(1),
      I3 => add_ln1353_reg_1512(2),
      I4 => add_ln1353_reg_1512(0),
      O => q0_reg_i_13_n_0
    );
q0_reg_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0001FFFFFFFE0000"
    )
        port map (
      I0 => add_ln1353_reg_1512(7),
      I1 => add_ln1353_reg_1512(6),
      I2 => add_ln1353_reg_1512(8),
      I3 => q0_reg_i_10_n_0,
      I4 => q0_reg_i_9_n_0,
      I5 => add_ln1353_reg_1512(9),
      O => sel(6)
    );
q0_reg_i_3: unisim.vcomponents.LUT6
    generic map(
      INIT => X"EEEAFFFF11150000"
    )
        port map (
      I0 => q0_reg_i_11_n_0,
      I1 => add_ln1353_reg_1512(5),
      I2 => add_ln1353_reg_1512(3),
      I3 => add_ln1353_reg_1512(4),
      I4 => q0_reg_i_9_n_0,
      I5 => add_ln1353_reg_1512(8),
      O => sel(5)
    );
q0_reg_i_4: unisim.vcomponents.LUT6
    generic map(
      INIT => X"A9A9A999AAAAAAAA"
    )
        port map (
      I0 => add_ln1353_reg_1512(7),
      I1 => add_ln1353_reg_1512(6),
      I2 => add_ln1353_reg_1512(5),
      I3 => add_ln1353_reg_1512(3),
      I4 => add_ln1353_reg_1512(4),
      I5 => q0_reg_i_9_n_0,
      O => sel(4)
    );
q0_reg_i_5: unisim.vcomponents.LUT5
    generic map(
      INIT => X"9995AAAA"
    )
        port map (
      I0 => add_ln1353_reg_1512(6),
      I1 => add_ln1353_reg_1512(5),
      I2 => add_ln1353_reg_1512(3),
      I3 => add_ln1353_reg_1512(4),
      I4 => q0_reg_i_9_n_0,
      O => sel(3)
    );
q0_reg_i_6: unisim.vcomponents.LUT4
    generic map(
      INIT => X"57A8"
    )
        port map (
      I0 => q0_reg_i_9_n_0,
      I1 => add_ln1353_reg_1512(3),
      I2 => add_ln1353_reg_1512(4),
      I3 => add_ln1353_reg_1512(5),
      O => sel(2)
    );
q0_reg_i_7: unisim.vcomponents.LUT3
    generic map(
      INIT => X"9C"
    )
        port map (
      I0 => add_ln1353_reg_1512(3),
      I1 => add_ln1353_reg_1512(4),
      I2 => q0_reg_i_9_n_0,
      O => sel(1)
    );
q0_reg_i_8: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => q0_reg_i_9_n_0,
      I1 => add_ln1353_reg_1512(3),
      O => sel(0)
    );
q0_reg_i_9: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFEEEEEEEEEEEEE"
    )
        port map (
      I0 => add_ln1353_reg_1512(12),
      I1 => add_ln1353_reg_1512(11),
      I2 => q0_reg_i_12_n_0,
      I3 => q0_reg_i_13_n_0,
      I4 => add_ln1353_reg_1512(9),
      I5 => add_ln1353_reg_1512(10),
      O => q0_reg_i_9_n_0
    );
q1_reg: unisim.vcomponents.RAMB18E2
    generic map(
      CASCADE_ORDER_A => "NONE",
      CASCADE_ORDER_B => "NONE",
      CLOCK_DOMAINS => "COMMON",
      DOA_REG => 1,
      DOB_REG => 1,
      ENADDRENA => "FALSE",
      ENADDRENB => "FALSE",
      INITP_00 => X"AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA",
      INITP_01 => X"000000000000000000000000000003FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEAAA",
      INITP_02 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_03 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_04 => X"55555555555555555555555555555000000000000000000000000000000000FF",
      INITP_05 => X"0000000000000000000000000000015555555555555555555555555555555555",
      INITP_06 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_07 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_00 => X"020801AE015E011500D5009E006E004700290013000500000003000E0022003E",
      INIT_01 => X"0C030B250A50098208BD0801074C06A005FC056004CD044203BF034502D30269",
      INIT_02 => X"1E2A1CCB1B751A2618DF17A1166A153B141512F611DF10D10FCB0ECC0DD60CE8",
      INIT_03 => X"38303657348532BA30F72F3C2D882BDC2A37289A2705257823F2227420FE1F90",
      INIT_04 => X"59AB575E551752D850A04E6F4C464A23480745F343E641E03FE13DEA3BFA3A12",
      INIT_05 => X"820C7F557CA479FA775674B972226F926D086A8568086592632360BB5E595BFE",
      INIT_06 => X"B0ABAD96AA86A77CA477A1799E809B8C989F95B892D68FFA8D258A55878C84C9",
      INIT_07 => X"E4C5E15EDDFCDA9FD746D3F3D0A4CD5ACA16C6D6C39BC066BD36BA0BB6E6B3C5",
      INIT_08 => X"1D8019D61630128D0EEF0B5407BE042B009DFD13F98DF60BF28EEF15EBA0E830",
      INIT_09 => X"59EF561152364E5E4A8846B642E63F1A3B51378B33C830092C4D289424DF212E",
      INIT_0A => X"9915951391138D158918851E81267D2F793B7549715A6D6C6981659961B35DD0",
      INIT_0B => X"D9E9D5D4D1C0CDADC99AC589C178BD68B95AB54CB140AD35A92CA524A11D9D18",
      INIT_0C => X"00000000000000000000000000000000000000000000EE59EA42E62BE214DDFE",
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
      INIT_20 => X"2D90297C256721511D3B1925150E10F70CDF08C704AF0097FC7FF867F450F038",
      INIT_21 => X"6E416A40663E623B5E355A2E5626521C4E114A0545F741E83DD939C835B631A3",
      INIT_22 => X"AD24A948A56AA1899DA599BF95D691EA8DFD8A0D861A82267E2F7A36763C723F",
      INIT_23 => X"E933E58CE1E1DE33DA81D6CBD312CF56CB96C7D3C40CC042BC76B8A6B4D3B0FD",
      INIT_24 => X"21721E0F1AA8173C13CB10560CDC095E05DC0255FECAFB3BF7A8F410F075ECD6",
      INIT_25 => X"54F651E64ECF4BB44893456C42413F103BD9389E355E32182ECD2B7E282924D0",
      INIT_26 => X"82E880367D7E7AC077FC753272616F8A6CAE69CB66E363F461005E065B075801",
      INIT_27 => X"AA86A83FA5F1A39CA1409EDD9C749A03978C950F928A90008D6E8AD688388593",
      INIT_28 => X"CB2DC959C77EC59CC3B2C1C1BFC9BDC9BBC2B9B4B79EB581B35DB132AF00ACC7",
      INIT_29 => X"E452E2FAE19AE032DEC3DD4BDBCCDA45D8B7D720D582D3DCD22FD07ACEBDCCF9",
      INIT_2A => X"F58CF4B5F3D7F2EFF200F109F009EF01EDF2ECDAEBBAEA92E962E82AE6EAE5A2",
      INIT_2B => X"FE94FE42FDE8FD85FD1AFCA6FC2AFBA6FB1AFA85F9E8F943F895F7DFF721F65B",
      INIT_2C => X"00000000000000000000000000000000000000000000FFB2FF89FF59FF20FEDE",
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
      WRITE_WIDTH_B => 18
    )
        port map (
      ADDRARDADDR(13 downto 12) => B"00",
      ADDRARDADDR(11) => q1_reg_i_1_n_0,
      ADDRARDADDR(10) => q1_reg_i_2_n_0,
      ADDRARDADDR(9) => q1_reg_i_3_n_0,
      ADDRARDADDR(8) => q1_reg_i_4_n_0,
      ADDRARDADDR(7) => q1_reg_i_5_n_0,
      ADDRARDADDR(6) => q1_reg_i_6_n_0,
      ADDRARDADDR(5) => q1_reg_i_7_n_0,
      ADDRARDADDR(4) => q1_reg_i_8_n_0,
      ADDRARDADDR(3 downto 0) => B"0000",
      ADDRBWRADDR(13 downto 12) => B"10",
      ADDRBWRADDR(11) => q1_reg_i_1_n_0,
      ADDRBWRADDR(10) => q1_reg_i_2_n_0,
      ADDRBWRADDR(9) => q1_reg_i_3_n_0,
      ADDRBWRADDR(8) => q1_reg_i_4_n_0,
      ADDRBWRADDR(7) => q1_reg_i_5_n_0,
      ADDRBWRADDR(6) => q1_reg_i_6_n_0,
      ADDRBWRADDR(5) => q1_reg_i_7_n_0,
      ADDRBWRADDR(4) => q1_reg_i_8_n_0,
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
      CASDOUTA(15 downto 0) => NLW_q1_reg_CASDOUTA_UNCONNECTED(15 downto 0),
      CASDOUTB(15 downto 0) => NLW_q1_reg_CASDOUTB_UNCONNECTED(15 downto 0),
      CASDOUTPA(1 downto 0) => NLW_q1_reg_CASDOUTPA_UNCONNECTED(1 downto 0),
      CASDOUTPB(1 downto 0) => NLW_q1_reg_CASDOUTPB_UNCONNECTED(1 downto 0),
      CASOREGIMUXA => '0',
      CASOREGIMUXB => '0',
      CASOREGIMUXEN_A => '1',
      CASOREGIMUXEN_B => '1',
      CLKARDCLK => ap_clk,
      CLKBWRCLK => ap_clk,
      DINADIN(15 downto 0) => B"1111111111111111",
      DINBDIN(15 downto 0) => B"1111111111111111",
      DINPADINP(1 downto 0) => B"11",
      DINPBDINP(1 downto 0) => B"11",
      DOUTADOUT(15 downto 0) => hw_trig_vals_8_V(15 downto 0),
      DOUTBDOUT(15 downto 0) => hw_trig_vals_8_V(33 downto 18),
      DOUTPADOUTP(1 downto 0) => hw_trig_vals_8_V(17 downto 16),
      DOUTPBDOUTP(1 downto 0) => hw_trig_vals_8_V(35 downto 34),
      ENARDEN => ce1,
      ENBWREN => ce1,
      REGCEAREGCE => ap_enable_reg_pp0_iter3,
      REGCEB => ap_enable_reg_pp0_iter3,
      RSTRAMARSTRAM => '0',
      RSTRAMB => '0',
      RSTREGARSTREG => '0',
      RSTREGB => '0',
      SLEEP => '0',
      WEA(1 downto 0) => B"00",
      WEBWE(3 downto 0) => B"0000"
    );
q1_reg_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"03FFAAAAFC00AAAA"
    )
        port map (
      I0 => tmp_1_reg_1529(7),
      I1 => add_ln1353_reg_1512(8),
      I2 => q1_reg_i_9_n_0,
      I3 => add_ln1353_reg_1512(9),
      I4 => icmp_ln895_1_reg_1524,
      I5 => add_ln1353_reg_1512(10),
      O => q1_reg_i_1_n_0
    );
q1_reg_i_2: unisim.vcomponents.LUT5
    generic map(
      INIT => X"03AAFCAA"
    )
        port map (
      I0 => tmp_1_reg_1529(6),
      I1 => q1_reg_i_9_n_0,
      I2 => add_ln1353_reg_1512(8),
      I3 => icmp_ln895_1_reg_1524,
      I4 => add_ln1353_reg_1512(9),
      O => q1_reg_i_2_n_0
    );
q1_reg_i_3: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFCAAAA0003AAAA"
    )
        port map (
      I0 => tmp_1_reg_1529(5),
      I1 => add_ln1353_reg_1512(6),
      I2 => add_ln1353_reg_1512(7),
      I3 => add_ln1353_reg_1512(5),
      I4 => icmp_ln895_1_reg_1524,
      I5 => add_ln1353_reg_1512(8),
      O => q1_reg_i_3_n_0
    );
q1_reg_i_4: unisim.vcomponents.LUT5
    generic map(
      INIT => X"F0C3AAAA"
    )
        port map (
      I0 => tmp_1_reg_1529(4),
      I1 => add_ln1353_reg_1512(6),
      I2 => add_ln1353_reg_1512(7),
      I3 => add_ln1353_reg_1512(5),
      I4 => icmp_ln895_1_reg_1524,
      O => q1_reg_i_4_n_0
    );
q1_reg_i_5: unisim.vcomponents.LUT4
    generic map(
      INIT => X"E22E"
    )
        port map (
      I0 => tmp_1_reg_1529(3),
      I1 => icmp_ln895_1_reg_1524,
      I2 => add_ln1353_reg_1512(5),
      I3 => add_ln1353_reg_1512(6),
      O => q1_reg_i_5_n_0
    );
q1_reg_i_6: unisim.vcomponents.LUT3
    generic map(
      INIT => X"74"
    )
        port map (
      I0 => add_ln1353_reg_1512(5),
      I1 => icmp_ln895_1_reg_1524,
      I2 => tmp_1_reg_1529(2),
      O => q1_reg_i_6_n_0
    );
q1_reg_i_7: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => add_ln1353_reg_1512(4),
      I1 => icmp_ln895_1_reg_1524,
      I2 => tmp_1_reg_1529(1),
      O => q1_reg_i_7_n_0
    );
q1_reg_i_8: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => add_ln1353_reg_1512(3),
      I1 => icmp_ln895_1_reg_1524,
      I2 => tmp_1_reg_1529(0),
      O => q1_reg_i_8_n_0
    );
q1_reg_i_9: unisim.vcomponents.LUT3
    generic map(
      INIT => X"FE"
    )
        port map (
      I0 => add_ln1353_reg_1512(6),
      I1 => add_ln1353_reg_1512(7),
      I2 => add_ln1353_reg_1512(5),
      O => q1_reg_i_9_n_0
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity hls_get_trig_vals_get_trig_vals_lutcud_rom is
  port (
    hw_trig_vals_1_V : out STD_LOGIC_VECTOR ( 35 downto 0 );
    hw_trig_vals_9_V : out STD_LOGIC_VECTOR ( 35 downto 0 );
    ap_clk : in STD_LOGIC;
    ce1 : in STD_LOGIC;
    ap_enable_reg_pp0_iter3 : in STD_LOGIC;
    add_ln1353_2_reg_1534 : in STD_LOGIC_VECTOR ( 12 downto 0 );
    tmp_3_reg_1551 : in STD_LOGIC_VECTOR ( 7 downto 0 );
    icmp_ln895_9_reg_1546 : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of hls_get_trig_vals_get_trig_vals_lutcud_rom : entity is "get_trig_vals_lutcud_rom";
end hls_get_trig_vals_get_trig_vals_lutcud_rom;

architecture STRUCTURE of hls_get_trig_vals_get_trig_vals_lutcud_rom is
  signal \q0_reg_i_10__0_n_0\ : STD_LOGIC;
  signal \q0_reg_i_11__0_n_0\ : STD_LOGIC;
  signal \q0_reg_i_12__0_n_0\ : STD_LOGIC;
  signal \q0_reg_i_13__0_n_0\ : STD_LOGIC;
  signal \q0_reg_i_1__0_n_0\ : STD_LOGIC;
  signal \q0_reg_i_2__0_n_0\ : STD_LOGIC;
  signal \q0_reg_i_3__0_n_0\ : STD_LOGIC;
  signal \q0_reg_i_4__0_n_0\ : STD_LOGIC;
  signal \q0_reg_i_5__0_n_0\ : STD_LOGIC;
  signal \q0_reg_i_6__0_n_0\ : STD_LOGIC;
  signal \q0_reg_i_7__0_n_0\ : STD_LOGIC;
  signal \q0_reg_i_8__0_n_0\ : STD_LOGIC;
  signal \q0_reg_i_9__0_n_0\ : STD_LOGIC;
  signal \q1_reg_i_1__0_n_0\ : STD_LOGIC;
  signal \q1_reg_i_2__0_n_0\ : STD_LOGIC;
  signal \q1_reg_i_3__0_n_0\ : STD_LOGIC;
  signal \q1_reg_i_4__0_n_0\ : STD_LOGIC;
  signal \q1_reg_i_5__0_n_0\ : STD_LOGIC;
  signal \q1_reg_i_6__0_n_0\ : STD_LOGIC;
  signal \q1_reg_i_7__0_n_0\ : STD_LOGIC;
  signal \q1_reg_i_8__0_n_0\ : STD_LOGIC;
  signal \q1_reg_i_9__0_n_0\ : STD_LOGIC;
  signal NLW_q0_reg_CASDOUTA_UNCONNECTED : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal NLW_q0_reg_CASDOUTB_UNCONNECTED : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal NLW_q0_reg_CASDOUTPA_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_q0_reg_CASDOUTPB_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_q1_reg_CASDOUTA_UNCONNECTED : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal NLW_q1_reg_CASDOUTB_UNCONNECTED : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal NLW_q1_reg_CASDOUTPA_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_q1_reg_CASDOUTPB_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute \MEM.PORTA.DATA_BIT_LAYOUT\ : string;
  attribute \MEM.PORTA.DATA_BIT_LAYOUT\ of q0_reg : label is "p2_d16";
  attribute \MEM.PORTB.DATA_BIT_LAYOUT\ : string;
  attribute \MEM.PORTB.DATA_BIT_LAYOUT\ of q0_reg : label is "p2_d16";
  attribute METHODOLOGY_DRC_VIOS : string;
  attribute METHODOLOGY_DRC_VIOS of q0_reg : label is "";
  attribute OPT_MODIFIED : string;
  attribute OPT_MODIFIED of q0_reg : label is "MLO";
  attribute RDADDR_COLLISION_HWCONFIG : string;
  attribute RDADDR_COLLISION_HWCONFIG of q0_reg : label is "DELAYED_WRITE";
  attribute RTL_RAM_BITS : integer;
  attribute RTL_RAM_BITS of q0_reg : label is 9216;
  attribute RTL_RAM_NAME : string;
  attribute RTL_RAM_NAME of q0_reg : label is "lut_tables_1_U/get_trig_vals_lutcud_rom_U/q0";
  attribute bram_addr_begin : integer;
  attribute bram_addr_begin of q0_reg : label is 0;
  attribute bram_addr_end : integer;
  attribute bram_addr_end of q0_reg : label is 255;
  attribute bram_slice_begin : integer;
  attribute bram_slice_begin of q0_reg : label is 0;
  attribute bram_slice_end : integer;
  attribute bram_slice_end of q0_reg : label is 17;
  attribute ram_addr_begin : integer;
  attribute ram_addr_begin of q0_reg : label is 0;
  attribute ram_addr_end : integer;
  attribute ram_addr_end of q0_reg : label is 255;
  attribute ram_ext_slice_begin : integer;
  attribute ram_ext_slice_begin of q0_reg : label is 18;
  attribute ram_ext_slice_end : integer;
  attribute ram_ext_slice_end of q0_reg : label is 35;
  attribute ram_offset : integer;
  attribute ram_offset of q0_reg : label is 0;
  attribute ram_slice_begin : integer;
  attribute ram_slice_begin of q0_reg : label is 0;
  attribute ram_slice_end : integer;
  attribute ram_slice_end of q0_reg : label is 17;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \q0_reg_i_10__0\ : label is "soft_lutpair5";
  attribute \MEM.PORTA.DATA_BIT_LAYOUT\ of q1_reg : label is "p2_d16";
  attribute \MEM.PORTB.DATA_BIT_LAYOUT\ of q1_reg : label is "p2_d16";
  attribute METHODOLOGY_DRC_VIOS of q1_reg : label is "";
  attribute OPT_MODIFIED of q1_reg : label is "MLO";
  attribute RDADDR_COLLISION_HWCONFIG of q1_reg : label is "DELAYED_WRITE";
  attribute RTL_RAM_BITS of q1_reg : label is 9216;
  attribute RTL_RAM_NAME of q1_reg : label is "lut_tables_1_U/get_trig_vals_lutcud_rom_U/q1";
  attribute bram_addr_begin of q1_reg : label is 0;
  attribute bram_addr_end of q1_reg : label is 255;
  attribute bram_slice_begin of q1_reg : label is 0;
  attribute bram_slice_end of q1_reg : label is 17;
  attribute ram_addr_begin of q1_reg : label is 0;
  attribute ram_addr_end of q1_reg : label is 255;
  attribute ram_ext_slice_begin of q1_reg : label is 18;
  attribute ram_ext_slice_end of q1_reg : label is 35;
  attribute ram_offset of q1_reg : label is 0;
  attribute ram_slice_begin of q1_reg : label is 0;
  attribute ram_slice_end of q1_reg : label is 17;
  attribute SOFT_HLUTNM of \q1_reg_i_4__0\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \q1_reg_i_5__0\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \q1_reg_i_6__0\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \q1_reg_i_7__0\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \q1_reg_i_9__0\ : label is "soft_lutpair3";
begin
q0_reg: unisim.vcomponents.RAMB18E2
    generic map(
      CASCADE_ORDER_A => "NONE",
      CASCADE_ORDER_B => "NONE",
      CLOCK_DOMAINS => "COMMON",
      DOA_REG => 1,
      DOB_REG => 1,
      ENADDRENA => "FALSE",
      ENADDRENB => "FALSE",
      INITP_00 => X"AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA",
      INITP_01 => X"000000000000000000000000000003FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEAAA",
      INITP_02 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_03 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_04 => X"55555555555555555555555555555000000000000000000000000000000000FF",
      INITP_05 => X"0000000000000000000000000000015555555555555555555555555555555555",
      INITP_06 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_07 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_00 => X"021301B90167011E00DD00A40074004C002C0015000600000002000C001F003A",
      INIT_01 => X"0C1F0B400A6A099C08D60818076206B50610057304DF045303CF035402E10276",
      INIT_02 => X"1E561CF61B9F1A4F190817C81690156114391319120210F20FEB0EEC0DF50D06",
      INIT_03 => X"386C369234BF32F3312F2F732DBE2C112A6B28CD273725A9242222A3212C1FBD",
      INIT_04 => X"59F557A75560532050E74EB54C8A4A67484A46354427422040213E283C383A4E",
      INIT_05 => X"82637FAB7CFA7A4F77AB750C72756FE46D596AD5685865E1637161085EA55C49",
      INIT_06 => X"B10EADF8AAE8A7DDA4D8A1D89EDE9BEB98FC9614933290558D7F8AAF87E58521",
      INIT_07 => X"E532E1CBDE68DB0AD7B1D45DD10ECDC3CA7EC73EC402C0CCBD9CBA70B74AB429",
      INIT_08 => X"1DF61A4B16A413020F630BC70830049D010EFD84F9FDF67BF2FDEF84EC0FE89E",
      INIT_09 => X"5A6B568D52B14ED84B03473043603F933BCA3803344030802CC4290B255621A4",
      INIT_0A => X"9995959391938D948998859D81A57DAE79BA75C871D86DEA69FF661662305E4C",
      INIT_0B => X"DA6CD657D243CE2FCA1DC60BC1FABDEAB9DCB5CEB1C2ADB7A9ADA5A5A19E9D99",
      INIT_0C => X"00000000000000000000000000000000000000000000EEDCEAC5E6AEE297DE81",
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
      INIT_20 => X"2E1229FE25EA21D41DBE19A81591117A0D62094A0532011AFD02F8EAF4D3F0BB",
      INIT_21 => X"6EC16AC066BF62BB5EB65AAF56A7529E4E934A864679426A3E5B3A4A36383226",
      INIT_22 => X"AD9FA9C4A5E6A2059E229A3B965392688E7A8A8B869982A47EAE7AB676BB72BF",
      INIT_23 => X"E9A7E601E257DEA9DAF7D742D38ACFCECC0EC84BC485C0BCBCEFB920B54DB178",
      INIT_24 => X"21DE1E7C1B1517A9143910C50D4B09CE064C02C6FF3BFBADF81AF483F0E9ED4A",
      INIT_25 => X"555852484F334C1848F745D242A63F763C41390635C632812F372BE82894253C",
      INIT_26 => X"833D808D7DD67B187855758B72BB6FE66D0A6A2867406453615F5E665B675862",
      INIT_27 => X"AACFA889A63BA3E7A18C9F2A9CC19A5297DC955F92DB90518DC18B2A888C85E8",
      INIT_28 => X"CB67C994C7BAC5D9C3F0C200C008BE09BC03B9F6B7E1B5C5B3A2B178AF47AD0E",
      INIT_29 => X"E47CE325E1C6E060DEF1DD7BDBFDDA77D8E9D753D5B6D411D265D0B1CEF5CD31",
      INIT_2A => X"F5A6F4D1F3F3F30DF21EF128F029EF23EE14ECFDEBDEEAB7E988E851E712E5CB",
      INIT_2B => X"FE9EFE4DFDF3FD92FD28FCB5FC3AFBB7FB2CFA98F9FCF958F8ABF7F6F739F674",
      INIT_2C => X"00000000000000000000000000000000000000000000FFB6FF8FFF5FFF27FEE7",
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
      WRITE_WIDTH_B => 18
    )
        port map (
      ADDRARDADDR(13 downto 12) => B"00",
      ADDRARDADDR(11) => \q0_reg_i_1__0_n_0\,
      ADDRARDADDR(10) => \q0_reg_i_2__0_n_0\,
      ADDRARDADDR(9) => \q0_reg_i_3__0_n_0\,
      ADDRARDADDR(8) => \q0_reg_i_4__0_n_0\,
      ADDRARDADDR(7) => \q0_reg_i_5__0_n_0\,
      ADDRARDADDR(6) => \q0_reg_i_6__0_n_0\,
      ADDRARDADDR(5) => \q0_reg_i_7__0_n_0\,
      ADDRARDADDR(4) => \q0_reg_i_8__0_n_0\,
      ADDRARDADDR(3 downto 0) => B"0000",
      ADDRBWRADDR(13 downto 12) => B"10",
      ADDRBWRADDR(11) => \q0_reg_i_1__0_n_0\,
      ADDRBWRADDR(10) => \q0_reg_i_2__0_n_0\,
      ADDRBWRADDR(9) => \q0_reg_i_3__0_n_0\,
      ADDRBWRADDR(8) => \q0_reg_i_4__0_n_0\,
      ADDRBWRADDR(7) => \q0_reg_i_5__0_n_0\,
      ADDRBWRADDR(6) => \q0_reg_i_6__0_n_0\,
      ADDRBWRADDR(5) => \q0_reg_i_7__0_n_0\,
      ADDRBWRADDR(4) => \q0_reg_i_8__0_n_0\,
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
      DINADIN(15 downto 0) => B"1111111111111111",
      DINBDIN(15 downto 0) => B"1111111111111111",
      DINPADINP(1 downto 0) => B"11",
      DINPBDINP(1 downto 0) => B"11",
      DOUTADOUT(15 downto 0) => hw_trig_vals_1_V(15 downto 0),
      DOUTBDOUT(15 downto 0) => hw_trig_vals_1_V(33 downto 18),
      DOUTPADOUTP(1 downto 0) => hw_trig_vals_1_V(17 downto 16),
      DOUTPBDOUTP(1 downto 0) => hw_trig_vals_1_V(35 downto 34),
      ENARDEN => ce1,
      ENBWREN => ce1,
      REGCEAREGCE => ap_enable_reg_pp0_iter3,
      REGCEB => ap_enable_reg_pp0_iter3,
      RSTRAMARSTRAM => '0',
      RSTRAMB => '0',
      RSTREGARSTREG => '0',
      RSTREGB => '0',
      SLEEP => '0',
      WEA(1 downto 0) => B"00",
      WEBWE(3 downto 0) => B"0000"
    );
\q0_reg_i_10__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"E0"
    )
        port map (
      I0 => add_ln1353_2_reg_1534(4),
      I1 => add_ln1353_2_reg_1534(3),
      I2 => add_ln1353_2_reg_1534(5),
      O => \q0_reg_i_10__0_n_0\
    );
\q0_reg_i_11__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => add_ln1353_2_reg_1534(7),
      I1 => add_ln1353_2_reg_1534(6),
      O => \q0_reg_i_11__0_n_0\
    );
\q0_reg_i_12__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFEFEFE"
    )
        port map (
      I0 => add_ln1353_2_reg_1534(7),
      I1 => add_ln1353_2_reg_1534(6),
      I2 => add_ln1353_2_reg_1534(8),
      I3 => add_ln1353_2_reg_1534(4),
      I4 => add_ln1353_2_reg_1534(5),
      O => \q0_reg_i_12__0_n_0\
    );
\q0_reg_i_13__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"88888880"
    )
        port map (
      I0 => add_ln1353_2_reg_1534(3),
      I1 => add_ln1353_2_reg_1534(5),
      I2 => add_ln1353_2_reg_1534(1),
      I3 => add_ln1353_2_reg_1534(2),
      I4 => add_ln1353_2_reg_1534(0),
      O => \q0_reg_i_13__0_n_0\
    );
\q0_reg_i_1__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7777777F88888880"
    )
        port map (
      I0 => add_ln1353_2_reg_1534(9),
      I1 => \q0_reg_i_9__0_n_0\,
      I2 => \q0_reg_i_10__0_n_0\,
      I3 => add_ln1353_2_reg_1534(8),
      I4 => \q0_reg_i_11__0_n_0\,
      I5 => add_ln1353_2_reg_1534(10),
      O => \q0_reg_i_1__0_n_0\
    );
\q0_reg_i_2__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0001FFFFFFFE0000"
    )
        port map (
      I0 => add_ln1353_2_reg_1534(7),
      I1 => add_ln1353_2_reg_1534(6),
      I2 => add_ln1353_2_reg_1534(8),
      I3 => \q0_reg_i_10__0_n_0\,
      I4 => \q0_reg_i_9__0_n_0\,
      I5 => add_ln1353_2_reg_1534(9),
      O => \q0_reg_i_2__0_n_0\
    );
\q0_reg_i_3__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"EEEAFFFF11150000"
    )
        port map (
      I0 => \q0_reg_i_11__0_n_0\,
      I1 => add_ln1353_2_reg_1534(5),
      I2 => add_ln1353_2_reg_1534(3),
      I3 => add_ln1353_2_reg_1534(4),
      I4 => \q0_reg_i_9__0_n_0\,
      I5 => add_ln1353_2_reg_1534(8),
      O => \q0_reg_i_3__0_n_0\
    );
\q0_reg_i_4__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"A9A9A999AAAAAAAA"
    )
        port map (
      I0 => add_ln1353_2_reg_1534(7),
      I1 => add_ln1353_2_reg_1534(6),
      I2 => add_ln1353_2_reg_1534(5),
      I3 => add_ln1353_2_reg_1534(3),
      I4 => add_ln1353_2_reg_1534(4),
      I5 => \q0_reg_i_9__0_n_0\,
      O => \q0_reg_i_4__0_n_0\
    );
\q0_reg_i_5__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"9995AAAA"
    )
        port map (
      I0 => add_ln1353_2_reg_1534(6),
      I1 => add_ln1353_2_reg_1534(5),
      I2 => add_ln1353_2_reg_1534(3),
      I3 => add_ln1353_2_reg_1534(4),
      I4 => \q0_reg_i_9__0_n_0\,
      O => \q0_reg_i_5__0_n_0\
    );
\q0_reg_i_6__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"57A8"
    )
        port map (
      I0 => \q0_reg_i_9__0_n_0\,
      I1 => add_ln1353_2_reg_1534(3),
      I2 => add_ln1353_2_reg_1534(4),
      I3 => add_ln1353_2_reg_1534(5),
      O => \q0_reg_i_6__0_n_0\
    );
\q0_reg_i_7__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"9C"
    )
        port map (
      I0 => add_ln1353_2_reg_1534(3),
      I1 => add_ln1353_2_reg_1534(4),
      I2 => \q0_reg_i_9__0_n_0\,
      O => \q0_reg_i_7__0_n_0\
    );
\q0_reg_i_8__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \q0_reg_i_9__0_n_0\,
      I1 => add_ln1353_2_reg_1534(3),
      O => \q0_reg_i_8__0_n_0\
    );
\q0_reg_i_9__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFEEEEEEEEEEEEE"
    )
        port map (
      I0 => add_ln1353_2_reg_1534(12),
      I1 => add_ln1353_2_reg_1534(11),
      I2 => \q0_reg_i_12__0_n_0\,
      I3 => \q0_reg_i_13__0_n_0\,
      I4 => add_ln1353_2_reg_1534(9),
      I5 => add_ln1353_2_reg_1534(10),
      O => \q0_reg_i_9__0_n_0\
    );
q1_reg: unisim.vcomponents.RAMB18E2
    generic map(
      CASCADE_ORDER_A => "NONE",
      CASCADE_ORDER_B => "NONE",
      CLOCK_DOMAINS => "COMMON",
      DOA_REG => 1,
      DOB_REG => 1,
      ENADDRENA => "FALSE",
      ENADDRENB => "FALSE",
      INITP_00 => X"AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA",
      INITP_01 => X"000000000000000000000000000003FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEAAA",
      INITP_02 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_03 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_04 => X"55555555555555555555555555555000000000000000000000000000000000FF",
      INITP_05 => X"0000000000000000000000000000015555555555555555555555555555555555",
      INITP_06 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_07 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_00 => X"021301B90167011E00DD00A40074004C002C0015000600000002000C001F003A",
      INIT_01 => X"0C1F0B400A6A099C08D60818076206B50610057304DF045303CF035402E10276",
      INIT_02 => X"1E561CF61B9F1A4F190817C81690156114391319120210F20FEB0EEC0DF50D06",
      INIT_03 => X"386C369234BF32F3312F2F732DBE2C112A6B28CD273725A9242222A3212C1FBD",
      INIT_04 => X"59F557A75560532050E74EB54C8A4A67484A46354427422040213E283C383A4E",
      INIT_05 => X"82637FAB7CFA7A4F77AB750C72756FE46D596AD5685865E1637161085EA55C49",
      INIT_06 => X"B10EADF8AAE8A7DDA4D8A1D89EDE9BEB98FC9614933290558D7F8AAF87E58521",
      INIT_07 => X"E532E1CBDE68DB0AD7B1D45DD10ECDC3CA7EC73EC402C0CCBD9CBA70B74AB429",
      INIT_08 => X"1DF61A4B16A413020F630BC70830049D010EFD84F9FDF67BF2FDEF84EC0FE89E",
      INIT_09 => X"5A6B568D52B14ED84B03473043603F933BCA3803344030802CC4290B255621A4",
      INIT_0A => X"9995959391938D948998859D81A57DAE79BA75C871D86DEA69FF661662305E4C",
      INIT_0B => X"DA6CD657D243CE2FCA1DC60BC1FABDEAB9DCB5CEB1C2ADB7A9ADA5A5A19E9D99",
      INIT_0C => X"00000000000000000000000000000000000000000000EEDCEAC5E6AEE297DE81",
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
      INIT_20 => X"2E1229FE25EA21D41DBE19A81591117A0D62094A0532011AFD02F8EAF4D3F0BB",
      INIT_21 => X"6EC16AC066BF62BB5EB65AAF56A7529E4E934A864679426A3E5B3A4A36383226",
      INIT_22 => X"AD9FA9C4A5E6A2059E229A3B965392688E7A8A8B869982A47EAE7AB676BB72BF",
      INIT_23 => X"E9A7E601E257DEA9DAF7D742D38ACFCECC0EC84BC485C0BCBCEFB920B54DB178",
      INIT_24 => X"21DE1E7C1B1517A9143910C50D4B09CE064C02C6FF3BFBADF81AF483F0E9ED4A",
      INIT_25 => X"555852484F334C1848F745D242A63F763C41390635C632812F372BE82894253C",
      INIT_26 => X"833D808D7DD67B187855758B72BB6FE66D0A6A2867406453615F5E665B675862",
      INIT_27 => X"AACFA889A63BA3E7A18C9F2A9CC19A5297DC955F92DB90518DC18B2A888C85E8",
      INIT_28 => X"CB67C994C7BAC5D9C3F0C200C008BE09BC03B9F6B7E1B5C5B3A2B178AF47AD0E",
      INIT_29 => X"E47CE325E1C6E060DEF1DD7BDBFDDA77D8E9D753D5B6D411D265D0B1CEF5CD31",
      INIT_2A => X"F5A6F4D1F3F3F30DF21EF128F029EF23EE14ECFDEBDEEAB7E988E851E712E5CB",
      INIT_2B => X"FE9EFE4DFDF3FD92FD28FCB5FC3AFBB7FB2CFA98F9FCF958F8ABF7F6F739F674",
      INIT_2C => X"00000000000000000000000000000000000000000000FFB6FF8FFF5FFF27FEE7",
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
      WRITE_WIDTH_B => 18
    )
        port map (
      ADDRARDADDR(13 downto 12) => B"00",
      ADDRARDADDR(11) => \q1_reg_i_1__0_n_0\,
      ADDRARDADDR(10) => \q1_reg_i_2__0_n_0\,
      ADDRARDADDR(9) => \q1_reg_i_3__0_n_0\,
      ADDRARDADDR(8) => \q1_reg_i_4__0_n_0\,
      ADDRARDADDR(7) => \q1_reg_i_5__0_n_0\,
      ADDRARDADDR(6) => \q1_reg_i_6__0_n_0\,
      ADDRARDADDR(5) => \q1_reg_i_7__0_n_0\,
      ADDRARDADDR(4) => \q1_reg_i_8__0_n_0\,
      ADDRARDADDR(3 downto 0) => B"0000",
      ADDRBWRADDR(13 downto 12) => B"10",
      ADDRBWRADDR(11) => \q1_reg_i_1__0_n_0\,
      ADDRBWRADDR(10) => \q1_reg_i_2__0_n_0\,
      ADDRBWRADDR(9) => \q1_reg_i_3__0_n_0\,
      ADDRBWRADDR(8) => \q1_reg_i_4__0_n_0\,
      ADDRBWRADDR(7) => \q1_reg_i_5__0_n_0\,
      ADDRBWRADDR(6) => \q1_reg_i_6__0_n_0\,
      ADDRBWRADDR(5) => \q1_reg_i_7__0_n_0\,
      ADDRBWRADDR(4) => \q1_reg_i_8__0_n_0\,
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
      CASDOUTA(15 downto 0) => NLW_q1_reg_CASDOUTA_UNCONNECTED(15 downto 0),
      CASDOUTB(15 downto 0) => NLW_q1_reg_CASDOUTB_UNCONNECTED(15 downto 0),
      CASDOUTPA(1 downto 0) => NLW_q1_reg_CASDOUTPA_UNCONNECTED(1 downto 0),
      CASDOUTPB(1 downto 0) => NLW_q1_reg_CASDOUTPB_UNCONNECTED(1 downto 0),
      CASOREGIMUXA => '0',
      CASOREGIMUXB => '0',
      CASOREGIMUXEN_A => '1',
      CASOREGIMUXEN_B => '1',
      CLKARDCLK => ap_clk,
      CLKBWRCLK => ap_clk,
      DINADIN(15 downto 0) => B"1111111111111111",
      DINBDIN(15 downto 0) => B"1111111111111111",
      DINPADINP(1 downto 0) => B"11",
      DINPBDINP(1 downto 0) => B"11",
      DOUTADOUT(15 downto 0) => hw_trig_vals_9_V(15 downto 0),
      DOUTBDOUT(15 downto 0) => hw_trig_vals_9_V(33 downto 18),
      DOUTPADOUTP(1 downto 0) => hw_trig_vals_9_V(17 downto 16),
      DOUTPBDOUTP(1 downto 0) => hw_trig_vals_9_V(35 downto 34),
      ENARDEN => ce1,
      ENBWREN => ce1,
      REGCEAREGCE => ap_enable_reg_pp0_iter3,
      REGCEB => ap_enable_reg_pp0_iter3,
      RSTRAMARSTRAM => '0',
      RSTRAMB => '0',
      RSTREGARSTREG => '0',
      RSTREGB => '0',
      SLEEP => '0',
      WEA(1 downto 0) => B"00",
      WEBWE(3 downto 0) => B"0000"
    );
\q1_reg_i_1__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"03FFAAAAFC00AAAA"
    )
        port map (
      I0 => tmp_3_reg_1551(7),
      I1 => add_ln1353_2_reg_1534(8),
      I2 => \q1_reg_i_9__0_n_0\,
      I3 => add_ln1353_2_reg_1534(9),
      I4 => icmp_ln895_9_reg_1546,
      I5 => add_ln1353_2_reg_1534(10),
      O => \q1_reg_i_1__0_n_0\
    );
\q1_reg_i_2__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"03AAFCAA"
    )
        port map (
      I0 => tmp_3_reg_1551(6),
      I1 => \q1_reg_i_9__0_n_0\,
      I2 => add_ln1353_2_reg_1534(8),
      I3 => icmp_ln895_9_reg_1546,
      I4 => add_ln1353_2_reg_1534(9),
      O => \q1_reg_i_2__0_n_0\
    );
\q1_reg_i_3__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFCAAAA0003AAAA"
    )
        port map (
      I0 => tmp_3_reg_1551(5),
      I1 => add_ln1353_2_reg_1534(6),
      I2 => add_ln1353_2_reg_1534(7),
      I3 => add_ln1353_2_reg_1534(5),
      I4 => icmp_ln895_9_reg_1546,
      I5 => add_ln1353_2_reg_1534(8),
      O => \q1_reg_i_3__0_n_0\
    );
\q1_reg_i_4__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"F0C3AAAA"
    )
        port map (
      I0 => tmp_3_reg_1551(4),
      I1 => add_ln1353_2_reg_1534(6),
      I2 => add_ln1353_2_reg_1534(7),
      I3 => add_ln1353_2_reg_1534(5),
      I4 => icmp_ln895_9_reg_1546,
      O => \q1_reg_i_4__0_n_0\
    );
\q1_reg_i_5__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"E22E"
    )
        port map (
      I0 => tmp_3_reg_1551(3),
      I1 => icmp_ln895_9_reg_1546,
      I2 => add_ln1353_2_reg_1534(5),
      I3 => add_ln1353_2_reg_1534(6),
      O => \q1_reg_i_5__0_n_0\
    );
\q1_reg_i_6__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"74"
    )
        port map (
      I0 => add_ln1353_2_reg_1534(5),
      I1 => icmp_ln895_9_reg_1546,
      I2 => tmp_3_reg_1551(2),
      O => \q1_reg_i_6__0_n_0\
    );
\q1_reg_i_7__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => add_ln1353_2_reg_1534(4),
      I1 => icmp_ln895_9_reg_1546,
      I2 => tmp_3_reg_1551(1),
      O => \q1_reg_i_7__0_n_0\
    );
\q1_reg_i_8__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => add_ln1353_2_reg_1534(3),
      I1 => icmp_ln895_9_reg_1546,
      I2 => tmp_3_reg_1551(0),
      O => \q1_reg_i_8__0_n_0\
    );
\q1_reg_i_9__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"FE"
    )
        port map (
      I0 => add_ln1353_2_reg_1534(6),
      I1 => add_ln1353_2_reg_1534(7),
      I2 => add_ln1353_2_reg_1534(5),
      O => \q1_reg_i_9__0_n_0\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity hls_get_trig_vals_get_trig_vals_lutdEe_rom is
  port (
    hw_trig_vals_2_V : out STD_LOGIC_VECTOR ( 35 downto 0 );
    hw_trig_vals_10_V : out STD_LOGIC_VECTOR ( 35 downto 0 );
    ap_clk : in STD_LOGIC;
    ce1 : in STD_LOGIC;
    ap_enable_reg_pp0_iter3 : in STD_LOGIC;
    add_ln1353_4_reg_1556 : in STD_LOGIC_VECTOR ( 11 downto 0 );
    tmp_5_reg_1573 : in STD_LOGIC_VECTOR ( 7 downto 0 );
    icmp_ln895_10_reg_1568 : in STD_LOGIC;
    add_ln1353_reg_1512 : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of hls_get_trig_vals_get_trig_vals_lutdEe_rom : entity is "get_trig_vals_lutdEe_rom";
end hls_get_trig_vals_get_trig_vals_lutdEe_rom;

architecture STRUCTURE of hls_get_trig_vals_get_trig_vals_lutdEe_rom is
  signal \q0_reg_i_10__1_n_0\ : STD_LOGIC;
  signal \q0_reg_i_11__1_n_0\ : STD_LOGIC;
  signal \q0_reg_i_12__1_n_0\ : STD_LOGIC;
  signal \q0_reg_i_13__1_n_0\ : STD_LOGIC;
  signal \q0_reg_i_1__1_n_0\ : STD_LOGIC;
  signal \q0_reg_i_2__1_n_0\ : STD_LOGIC;
  signal \q0_reg_i_3__1_n_0\ : STD_LOGIC;
  signal \q0_reg_i_4__1_n_0\ : STD_LOGIC;
  signal \q0_reg_i_5__1_n_0\ : STD_LOGIC;
  signal \q0_reg_i_6__1_n_0\ : STD_LOGIC;
  signal \q0_reg_i_7__1_n_0\ : STD_LOGIC;
  signal \q0_reg_i_8__1_n_0\ : STD_LOGIC;
  signal \q0_reg_i_9__1_n_0\ : STD_LOGIC;
  signal \q1_reg_i_1__1_n_0\ : STD_LOGIC;
  signal \q1_reg_i_2__1_n_0\ : STD_LOGIC;
  signal \q1_reg_i_3__1_n_0\ : STD_LOGIC;
  signal \q1_reg_i_4__1_n_0\ : STD_LOGIC;
  signal \q1_reg_i_5__1_n_0\ : STD_LOGIC;
  signal \q1_reg_i_6__1_n_0\ : STD_LOGIC;
  signal \q1_reg_i_7__1_n_0\ : STD_LOGIC;
  signal \q1_reg_i_8__1_n_0\ : STD_LOGIC;
  signal \q1_reg_i_9__1_n_0\ : STD_LOGIC;
  signal NLW_q0_reg_CASDOUTA_UNCONNECTED : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal NLW_q0_reg_CASDOUTB_UNCONNECTED : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal NLW_q0_reg_CASDOUTPA_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_q0_reg_CASDOUTPB_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_q1_reg_CASDOUTA_UNCONNECTED : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal NLW_q1_reg_CASDOUTB_UNCONNECTED : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal NLW_q1_reg_CASDOUTPA_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_q1_reg_CASDOUTPB_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute \MEM.PORTA.DATA_BIT_LAYOUT\ : string;
  attribute \MEM.PORTA.DATA_BIT_LAYOUT\ of q0_reg : label is "p2_d16";
  attribute \MEM.PORTB.DATA_BIT_LAYOUT\ : string;
  attribute \MEM.PORTB.DATA_BIT_LAYOUT\ of q0_reg : label is "p2_d16";
  attribute METHODOLOGY_DRC_VIOS : string;
  attribute METHODOLOGY_DRC_VIOS of q0_reg : label is "";
  attribute OPT_MODIFIED : string;
  attribute OPT_MODIFIED of q0_reg : label is "MLO";
  attribute RDADDR_COLLISION_HWCONFIG : string;
  attribute RDADDR_COLLISION_HWCONFIG of q0_reg : label is "DELAYED_WRITE";
  attribute RTL_RAM_BITS : integer;
  attribute RTL_RAM_BITS of q0_reg : label is 9216;
  attribute RTL_RAM_NAME : string;
  attribute RTL_RAM_NAME of q0_reg : label is "lut_tables_2_U/get_trig_vals_lutdEe_rom_U/q0";
  attribute bram_addr_begin : integer;
  attribute bram_addr_begin of q0_reg : label is 0;
  attribute bram_addr_end : integer;
  attribute bram_addr_end of q0_reg : label is 255;
  attribute bram_slice_begin : integer;
  attribute bram_slice_begin of q0_reg : label is 0;
  attribute bram_slice_end : integer;
  attribute bram_slice_end of q0_reg : label is 17;
  attribute ram_addr_begin : integer;
  attribute ram_addr_begin of q0_reg : label is 0;
  attribute ram_addr_end : integer;
  attribute ram_addr_end of q0_reg : label is 255;
  attribute ram_ext_slice_begin : integer;
  attribute ram_ext_slice_begin of q0_reg : label is 18;
  attribute ram_ext_slice_end : integer;
  attribute ram_ext_slice_end of q0_reg : label is 35;
  attribute ram_offset : integer;
  attribute ram_offset of q0_reg : label is 0;
  attribute ram_slice_begin : integer;
  attribute ram_slice_begin of q0_reg : label is 0;
  attribute ram_slice_end : integer;
  attribute ram_slice_end of q0_reg : label is 17;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \q0_reg_i_10__1\ : label is "soft_lutpair8";
  attribute \MEM.PORTA.DATA_BIT_LAYOUT\ of q1_reg : label is "p2_d16";
  attribute \MEM.PORTB.DATA_BIT_LAYOUT\ of q1_reg : label is "p2_d16";
  attribute METHODOLOGY_DRC_VIOS of q1_reg : label is "";
  attribute OPT_MODIFIED of q1_reg : label is "MLO";
  attribute RDADDR_COLLISION_HWCONFIG of q1_reg : label is "DELAYED_WRITE";
  attribute RTL_RAM_BITS of q1_reg : label is 9216;
  attribute RTL_RAM_NAME of q1_reg : label is "lut_tables_2_U/get_trig_vals_lutdEe_rom_U/q1";
  attribute bram_addr_begin of q1_reg : label is 0;
  attribute bram_addr_end of q1_reg : label is 255;
  attribute bram_slice_begin of q1_reg : label is 0;
  attribute bram_slice_end of q1_reg : label is 17;
  attribute ram_addr_begin of q1_reg : label is 0;
  attribute ram_addr_end of q1_reg : label is 255;
  attribute ram_ext_slice_begin of q1_reg : label is 18;
  attribute ram_ext_slice_end of q1_reg : label is 35;
  attribute ram_offset of q1_reg : label is 0;
  attribute ram_slice_begin of q1_reg : label is 0;
  attribute ram_slice_end of q1_reg : label is 17;
  attribute SOFT_HLUTNM of \q1_reg_i_4__1\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \q1_reg_i_5__1\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \q1_reg_i_6__1\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \q1_reg_i_7__1\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \q1_reg_i_9__1\ : label is "soft_lutpair6";
begin
q0_reg: unisim.vcomponents.RAMB18E2
    generic map(
      CASCADE_ORDER_A => "NONE",
      CASCADE_ORDER_B => "NONE",
      CLOCK_DOMAINS => "COMMON",
      DOA_REG => 1,
      DOB_REG => 1,
      ENADDRENA => "FALSE",
      ENADDRENB => "FALSE",
      INITP_00 => X"AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA",
      INITP_01 => X"000000000000000000000000000003FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEAAA",
      INITP_02 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_03 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_04 => X"55555555555555555555555555555000000000000000000000000000000000FF",
      INITP_05 => X"0000000000000000000000000000015555555555555555555555555555555555",
      INITP_06 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_07 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_00 => X"021F01C40171012700E500AB0079005000300018000800000001000A001C0036",
      INIT_01 => X"0C3B0B5C0A8409B508EE082F077906CA0624058704F1046403DF036302EF0283",
      INIT_02 => X"1E821D221BC91A79193017EF16B71586145D133D12241114100B0F0B0E130D23",
      INIT_03 => X"38A836CD34F9332C31672FAA2DF42C462A9F2901276A25DA245322D3215B1FEB",
      INIT_04 => X"5A3F57F055A85368512E4EFB4CCF4AAB488D46774468426140603E673C753A8B",
      INIT_05 => X"82BA80027D507AA477FF756072C770356DAA6B2568A7662F63BE61545EF15C94",
      INIT_06 => X"B171AE5AAB49A83EA538A2389F3D9C49995A9671938E90B18DDA8B09883E8579",
      INIT_07 => X"E59FE237DED4DB76D81CD4C7D177CE2CCAE6C7A5C46AC133BE01BAD5B7AEB48D",
      INIT_08 => X"1E6B1AC0171913760FD60C3B08A305100180FDF5FA6EF6EBF36DEFF3EC7DE90C",
      INIT_09 => X"5AE75708532C4F534B7D47AA43DA400D3C43387C34B830F82D3B298225CC221A",
      INIT_0A => X"9A15961392138E148A17861D82247E2D7A38764672556E686A7C669362AC5EC8",
      INIT_0B => X"DAEED6D9D2C5CEB2CA9FC68DC27CBE6CBA5DB650B243AE38AA2EA626A21F9E19",
      INIT_0C => X"00000000000000000000000000000000000000000000EF5FEB47E730E31ADF04",
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
      INIT_20 => X"2E952A81266C22571E411A2A161411FC0DE509CD05B5019DFD85F96DF556F13E",
      INIT_21 => X"6F406B41673F633C5F375B305728531F4F144B0846FB42EC3EDD3ACC36BB32A8",
      INIT_22 => X"AE1AAA3FA662A2819E9E9AB896D092E58EF88B09871783237F2D7B35773B733E",
      INIT_23 => X"EA1CE676E2CCDF1FDB6ED7B9D401D045CC86C8C4C4FEC135BD69B99AB5C8B1F3",
      INIT_24 => X"224A1EE81B82181714A711330DBB0A3E06BD0337FFADFC1FF88DF4F7F15CEDBE",
      INIT_25 => X"55B952AA4F964C7B495C4637430C3FDC3CA7396D362E32EA2FA02C5228FF25A7",
      INIT_26 => X"839380E37E2D7B7078AE75E5731670416D666A85679D64B161BE5EC55BC758C3",
      INIT_27 => X"AB17A8D2A685A432A1D89F779D0F9AA0982B95AF932C90A38E138B7D88E0863D",
      INIT_28 => X"CBA0C9CFC7F6C615C42EC23EC048BE4ABC44BA38B824B609B3E7B1BEAF8DAD56",
      INIT_29 => X"E4A6E350E1F3E08DDF1FDDAADC2DDAA8D91BD787D5EAD446D29BD0E8CF2DCD6A",
      INIT_2A => X"F5C1F4ECF40FF32AF23DF147F04AEF44EE36ED20EC02EADCE9AEE878E73AE5F4",
      INIT_2B => X"FEA8FE58FDFFFD9EFD35FCC4FC4AFBC8FB3EFAABFA10F96DF8C1F80DF751F68D",
      INIT_2C => X"00000000000000000000000000000000000000000000FFBAFF94FF66FF2FFEEF",
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
      WRITE_WIDTH_B => 18
    )
        port map (
      ADDRARDADDR(13 downto 12) => B"00",
      ADDRARDADDR(11) => \q0_reg_i_1__1_n_0\,
      ADDRARDADDR(10) => \q0_reg_i_2__1_n_0\,
      ADDRARDADDR(9) => \q0_reg_i_3__1_n_0\,
      ADDRARDADDR(8) => \q0_reg_i_4__1_n_0\,
      ADDRARDADDR(7) => \q0_reg_i_5__1_n_0\,
      ADDRARDADDR(6) => \q0_reg_i_6__1_n_0\,
      ADDRARDADDR(5) => \q0_reg_i_7__1_n_0\,
      ADDRARDADDR(4) => \q0_reg_i_8__1_n_0\,
      ADDRARDADDR(3 downto 0) => B"0000",
      ADDRBWRADDR(13 downto 12) => B"10",
      ADDRBWRADDR(11) => \q0_reg_i_1__1_n_0\,
      ADDRBWRADDR(10) => \q0_reg_i_2__1_n_0\,
      ADDRBWRADDR(9) => \q0_reg_i_3__1_n_0\,
      ADDRBWRADDR(8) => \q0_reg_i_4__1_n_0\,
      ADDRBWRADDR(7) => \q0_reg_i_5__1_n_0\,
      ADDRBWRADDR(6) => \q0_reg_i_6__1_n_0\,
      ADDRBWRADDR(5) => \q0_reg_i_7__1_n_0\,
      ADDRBWRADDR(4) => \q0_reg_i_8__1_n_0\,
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
      DINADIN(15 downto 0) => B"1111111111111111",
      DINBDIN(15 downto 0) => B"1111111111111111",
      DINPADINP(1 downto 0) => B"11",
      DINPBDINP(1 downto 0) => B"11",
      DOUTADOUT(15 downto 0) => hw_trig_vals_2_V(15 downto 0),
      DOUTBDOUT(15 downto 0) => hw_trig_vals_2_V(33 downto 18),
      DOUTPADOUTP(1 downto 0) => hw_trig_vals_2_V(17 downto 16),
      DOUTPBDOUTP(1 downto 0) => hw_trig_vals_2_V(35 downto 34),
      ENARDEN => ce1,
      ENBWREN => ce1,
      REGCEAREGCE => ap_enable_reg_pp0_iter3,
      REGCEB => ap_enable_reg_pp0_iter3,
      RSTRAMARSTRAM => '0',
      RSTRAMB => '0',
      RSTREGARSTREG => '0',
      RSTREGB => '0',
      SLEEP => '0',
      WEA(1 downto 0) => B"00",
      WEBWE(3 downto 0) => B"0000"
    );
\q0_reg_i_10__1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"E0"
    )
        port map (
      I0 => add_ln1353_4_reg_1556(3),
      I1 => add_ln1353_4_reg_1556(2),
      I2 => add_ln1353_4_reg_1556(4),
      O => \q0_reg_i_10__1_n_0\
    );
\q0_reg_i_11__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => add_ln1353_4_reg_1556(6),
      I1 => add_ln1353_4_reg_1556(5),
      O => \q0_reg_i_11__1_n_0\
    );
\q0_reg_i_12__1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFEFEFE"
    )
        port map (
      I0 => add_ln1353_4_reg_1556(6),
      I1 => add_ln1353_4_reg_1556(5),
      I2 => add_ln1353_4_reg_1556(7),
      I3 => add_ln1353_4_reg_1556(3),
      I4 => add_ln1353_4_reg_1556(4),
      O => \q0_reg_i_12__1_n_0\
    );
\q0_reg_i_13__1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"88888880"
    )
        port map (
      I0 => add_ln1353_4_reg_1556(2),
      I1 => add_ln1353_4_reg_1556(4),
      I2 => add_ln1353_4_reg_1556(0),
      I3 => add_ln1353_4_reg_1556(1),
      I4 => add_ln1353_reg_1512(0),
      O => \q0_reg_i_13__1_n_0\
    );
\q0_reg_i_1__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7777777F88888880"
    )
        port map (
      I0 => add_ln1353_4_reg_1556(8),
      I1 => \q0_reg_i_9__1_n_0\,
      I2 => \q0_reg_i_10__1_n_0\,
      I3 => add_ln1353_4_reg_1556(7),
      I4 => \q0_reg_i_11__1_n_0\,
      I5 => add_ln1353_4_reg_1556(9),
      O => \q0_reg_i_1__1_n_0\
    );
\q0_reg_i_2__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0001FFFFFFFE0000"
    )
        port map (
      I0 => add_ln1353_4_reg_1556(6),
      I1 => add_ln1353_4_reg_1556(5),
      I2 => add_ln1353_4_reg_1556(7),
      I3 => \q0_reg_i_10__1_n_0\,
      I4 => \q0_reg_i_9__1_n_0\,
      I5 => add_ln1353_4_reg_1556(8),
      O => \q0_reg_i_2__1_n_0\
    );
\q0_reg_i_3__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"EEEAFFFF11150000"
    )
        port map (
      I0 => \q0_reg_i_11__1_n_0\,
      I1 => add_ln1353_4_reg_1556(4),
      I2 => add_ln1353_4_reg_1556(2),
      I3 => add_ln1353_4_reg_1556(3),
      I4 => \q0_reg_i_9__1_n_0\,
      I5 => add_ln1353_4_reg_1556(7),
      O => \q0_reg_i_3__1_n_0\
    );
\q0_reg_i_4__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"A9A9A999AAAAAAAA"
    )
        port map (
      I0 => add_ln1353_4_reg_1556(6),
      I1 => add_ln1353_4_reg_1556(5),
      I2 => add_ln1353_4_reg_1556(4),
      I3 => add_ln1353_4_reg_1556(2),
      I4 => add_ln1353_4_reg_1556(3),
      I5 => \q0_reg_i_9__1_n_0\,
      O => \q0_reg_i_4__1_n_0\
    );
\q0_reg_i_5__1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"9995AAAA"
    )
        port map (
      I0 => add_ln1353_4_reg_1556(5),
      I1 => add_ln1353_4_reg_1556(4),
      I2 => add_ln1353_4_reg_1556(2),
      I3 => add_ln1353_4_reg_1556(3),
      I4 => \q0_reg_i_9__1_n_0\,
      O => \q0_reg_i_5__1_n_0\
    );
\q0_reg_i_6__1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"57A8"
    )
        port map (
      I0 => \q0_reg_i_9__1_n_0\,
      I1 => add_ln1353_4_reg_1556(2),
      I2 => add_ln1353_4_reg_1556(3),
      I3 => add_ln1353_4_reg_1556(4),
      O => \q0_reg_i_6__1_n_0\
    );
\q0_reg_i_7__1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"9C"
    )
        port map (
      I0 => add_ln1353_4_reg_1556(2),
      I1 => add_ln1353_4_reg_1556(3),
      I2 => \q0_reg_i_9__1_n_0\,
      O => \q0_reg_i_7__1_n_0\
    );
\q0_reg_i_8__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \q0_reg_i_9__1_n_0\,
      I1 => add_ln1353_4_reg_1556(2),
      O => \q0_reg_i_8__1_n_0\
    );
\q0_reg_i_9__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFEEEEEEEEEEEEE"
    )
        port map (
      I0 => add_ln1353_4_reg_1556(11),
      I1 => add_ln1353_4_reg_1556(10),
      I2 => \q0_reg_i_12__1_n_0\,
      I3 => \q0_reg_i_13__1_n_0\,
      I4 => add_ln1353_4_reg_1556(8),
      I5 => add_ln1353_4_reg_1556(9),
      O => \q0_reg_i_9__1_n_0\
    );
q1_reg: unisim.vcomponents.RAMB18E2
    generic map(
      CASCADE_ORDER_A => "NONE",
      CASCADE_ORDER_B => "NONE",
      CLOCK_DOMAINS => "COMMON",
      DOA_REG => 1,
      DOB_REG => 1,
      ENADDRENA => "FALSE",
      ENADDRENB => "FALSE",
      INITP_00 => X"AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA",
      INITP_01 => X"000000000000000000000000000003FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEAAA",
      INITP_02 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_03 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_04 => X"55555555555555555555555555555000000000000000000000000000000000FF",
      INITP_05 => X"0000000000000000000000000000015555555555555555555555555555555555",
      INITP_06 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_07 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_00 => X"021F01C40171012700E500AB0079005000300018000800000001000A001C0036",
      INIT_01 => X"0C3B0B5C0A8409B508EE082F077906CA0624058704F1046403DF036302EF0283",
      INIT_02 => X"1E821D221BC91A79193017EF16B71586145D133D12241114100B0F0B0E130D23",
      INIT_03 => X"38A836CD34F9332C31672FAA2DF42C462A9F2901276A25DA245322D3215B1FEB",
      INIT_04 => X"5A3F57F055A85368512E4EFB4CCF4AAB488D46774468426140603E673C753A8B",
      INIT_05 => X"82BA80027D507AA477FF756072C770356DAA6B2568A7662F63BE61545EF15C94",
      INIT_06 => X"B171AE5AAB49A83EA538A2389F3D9C49995A9671938E90B18DDA8B09883E8579",
      INIT_07 => X"E59FE237DED4DB76D81CD4C7D177CE2CCAE6C7A5C46AC133BE01BAD5B7AEB48D",
      INIT_08 => X"1E6B1AC0171913760FD60C3B08A305100180FDF5FA6EF6EBF36DEFF3EC7DE90C",
      INIT_09 => X"5AE75708532C4F534B7D47AA43DA400D3C43387C34B830F82D3B298225CC221A",
      INIT_0A => X"9A15961392138E148A17861D82247E2D7A38764672556E686A7C669362AC5EC8",
      INIT_0B => X"DAEED6D9D2C5CEB2CA9FC68DC27CBE6CBA5DB650B243AE38AA2EA626A21F9E19",
      INIT_0C => X"00000000000000000000000000000000000000000000EF5FEB47E730E31ADF04",
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
      INIT_20 => X"2E952A81266C22571E411A2A161411FC0DE509CD05B5019DFD85F96DF556F13E",
      INIT_21 => X"6F406B41673F633C5F375B305728531F4F144B0846FB42EC3EDD3ACC36BB32A8",
      INIT_22 => X"AE1AAA3FA662A2819E9E9AB896D092E58EF88B09871783237F2D7B35773B733E",
      INIT_23 => X"EA1CE676E2CCDF1FDB6ED7B9D401D045CC86C8C4C4FEC135BD69B99AB5C8B1F3",
      INIT_24 => X"224A1EE81B82181714A711330DBB0A3E06BD0337FFADFC1FF88DF4F7F15CEDBE",
      INIT_25 => X"55B952AA4F964C7B495C4637430C3FDC3CA7396D362E32EA2FA02C5228FF25A7",
      INIT_26 => X"839380E37E2D7B7078AE75E5731670416D666A85679D64B161BE5EC55BC758C3",
      INIT_27 => X"AB17A8D2A685A432A1D89F779D0F9AA0982B95AF932C90A38E138B7D88E0863D",
      INIT_28 => X"CBA0C9CFC7F6C615C42EC23EC048BE4ABC44BA38B824B609B3E7B1BEAF8DAD56",
      INIT_29 => X"E4A6E350E1F3E08DDF1FDDAADC2DDAA8D91BD787D5EAD446D29BD0E8CF2DCD6A",
      INIT_2A => X"F5C1F4ECF40FF32AF23DF147F04AEF44EE36ED20EC02EADCE9AEE878E73AE5F4",
      INIT_2B => X"FEA8FE58FDFFFD9EFD35FCC4FC4AFBC8FB3EFAABFA10F96DF8C1F80DF751F68D",
      INIT_2C => X"00000000000000000000000000000000000000000000FFBAFF94FF66FF2FFEEF",
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
      WRITE_WIDTH_B => 18
    )
        port map (
      ADDRARDADDR(13 downto 12) => B"00",
      ADDRARDADDR(11) => \q1_reg_i_1__1_n_0\,
      ADDRARDADDR(10) => \q1_reg_i_2__1_n_0\,
      ADDRARDADDR(9) => \q1_reg_i_3__1_n_0\,
      ADDRARDADDR(8) => \q1_reg_i_4__1_n_0\,
      ADDRARDADDR(7) => \q1_reg_i_5__1_n_0\,
      ADDRARDADDR(6) => \q1_reg_i_6__1_n_0\,
      ADDRARDADDR(5) => \q1_reg_i_7__1_n_0\,
      ADDRARDADDR(4) => \q1_reg_i_8__1_n_0\,
      ADDRARDADDR(3 downto 0) => B"0000",
      ADDRBWRADDR(13 downto 12) => B"10",
      ADDRBWRADDR(11) => \q1_reg_i_1__1_n_0\,
      ADDRBWRADDR(10) => \q1_reg_i_2__1_n_0\,
      ADDRBWRADDR(9) => \q1_reg_i_3__1_n_0\,
      ADDRBWRADDR(8) => \q1_reg_i_4__1_n_0\,
      ADDRBWRADDR(7) => \q1_reg_i_5__1_n_0\,
      ADDRBWRADDR(6) => \q1_reg_i_6__1_n_0\,
      ADDRBWRADDR(5) => \q1_reg_i_7__1_n_0\,
      ADDRBWRADDR(4) => \q1_reg_i_8__1_n_0\,
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
      CASDOUTA(15 downto 0) => NLW_q1_reg_CASDOUTA_UNCONNECTED(15 downto 0),
      CASDOUTB(15 downto 0) => NLW_q1_reg_CASDOUTB_UNCONNECTED(15 downto 0),
      CASDOUTPA(1 downto 0) => NLW_q1_reg_CASDOUTPA_UNCONNECTED(1 downto 0),
      CASDOUTPB(1 downto 0) => NLW_q1_reg_CASDOUTPB_UNCONNECTED(1 downto 0),
      CASOREGIMUXA => '0',
      CASOREGIMUXB => '0',
      CASOREGIMUXEN_A => '1',
      CASOREGIMUXEN_B => '1',
      CLKARDCLK => ap_clk,
      CLKBWRCLK => ap_clk,
      DINADIN(15 downto 0) => B"1111111111111111",
      DINBDIN(15 downto 0) => B"1111111111111111",
      DINPADINP(1 downto 0) => B"11",
      DINPBDINP(1 downto 0) => B"11",
      DOUTADOUT(15 downto 0) => hw_trig_vals_10_V(15 downto 0),
      DOUTBDOUT(15 downto 0) => hw_trig_vals_10_V(33 downto 18),
      DOUTPADOUTP(1 downto 0) => hw_trig_vals_10_V(17 downto 16),
      DOUTPBDOUTP(1 downto 0) => hw_trig_vals_10_V(35 downto 34),
      ENARDEN => ce1,
      ENBWREN => ce1,
      REGCEAREGCE => ap_enable_reg_pp0_iter3,
      REGCEB => ap_enable_reg_pp0_iter3,
      RSTRAMARSTRAM => '0',
      RSTRAMB => '0',
      RSTREGARSTREG => '0',
      RSTREGB => '0',
      SLEEP => '0',
      WEA(1 downto 0) => B"00",
      WEBWE(3 downto 0) => B"0000"
    );
\q1_reg_i_1__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"03FFAAAAFC00AAAA"
    )
        port map (
      I0 => tmp_5_reg_1573(7),
      I1 => add_ln1353_4_reg_1556(7),
      I2 => \q1_reg_i_9__1_n_0\,
      I3 => add_ln1353_4_reg_1556(8),
      I4 => icmp_ln895_10_reg_1568,
      I5 => add_ln1353_4_reg_1556(9),
      O => \q1_reg_i_1__1_n_0\
    );
\q1_reg_i_2__1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"03AAFCAA"
    )
        port map (
      I0 => tmp_5_reg_1573(6),
      I1 => \q1_reg_i_9__1_n_0\,
      I2 => add_ln1353_4_reg_1556(7),
      I3 => icmp_ln895_10_reg_1568,
      I4 => add_ln1353_4_reg_1556(8),
      O => \q1_reg_i_2__1_n_0\
    );
\q1_reg_i_3__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFCAAAA0003AAAA"
    )
        port map (
      I0 => tmp_5_reg_1573(5),
      I1 => add_ln1353_4_reg_1556(5),
      I2 => add_ln1353_4_reg_1556(6),
      I3 => add_ln1353_4_reg_1556(4),
      I4 => icmp_ln895_10_reg_1568,
      I5 => add_ln1353_4_reg_1556(7),
      O => \q1_reg_i_3__1_n_0\
    );
\q1_reg_i_4__1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"F0C3AAAA"
    )
        port map (
      I0 => tmp_5_reg_1573(4),
      I1 => add_ln1353_4_reg_1556(5),
      I2 => add_ln1353_4_reg_1556(6),
      I3 => add_ln1353_4_reg_1556(4),
      I4 => icmp_ln895_10_reg_1568,
      O => \q1_reg_i_4__1_n_0\
    );
\q1_reg_i_5__1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"E22E"
    )
        port map (
      I0 => tmp_5_reg_1573(3),
      I1 => icmp_ln895_10_reg_1568,
      I2 => add_ln1353_4_reg_1556(4),
      I3 => add_ln1353_4_reg_1556(5),
      O => \q1_reg_i_5__1_n_0\
    );
\q1_reg_i_6__1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"74"
    )
        port map (
      I0 => add_ln1353_4_reg_1556(4),
      I1 => icmp_ln895_10_reg_1568,
      I2 => tmp_5_reg_1573(2),
      O => \q1_reg_i_6__1_n_0\
    );
\q1_reg_i_7__1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => add_ln1353_4_reg_1556(3),
      I1 => icmp_ln895_10_reg_1568,
      I2 => tmp_5_reg_1573(1),
      O => \q1_reg_i_7__1_n_0\
    );
\q1_reg_i_8__1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => add_ln1353_4_reg_1556(2),
      I1 => icmp_ln895_10_reg_1568,
      I2 => tmp_5_reg_1573(0),
      O => \q1_reg_i_8__1_n_0\
    );
\q1_reg_i_9__1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"FE"
    )
        port map (
      I0 => add_ln1353_4_reg_1556(5),
      I1 => add_ln1353_4_reg_1556(6),
      I2 => add_ln1353_4_reg_1556(4),
      O => \q1_reg_i_9__1_n_0\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity hls_get_trig_vals_get_trig_vals_luteOg_rom is
  port (
    hw_trig_vals_3_V : out STD_LOGIC_VECTOR ( 35 downto 0 );
    hw_trig_vals_11_V : out STD_LOGIC_VECTOR ( 35 downto 0 );
    ap_clk : in STD_LOGIC;
    ce1 : in STD_LOGIC;
    ap_enable_reg_pp0_iter3 : in STD_LOGIC;
    add_ln1353_6_reg_1578 : in STD_LOGIC_VECTOR ( 11 downto 0 );
    tmp_7_reg_1595 : in STD_LOGIC_VECTOR ( 7 downto 0 );
    icmp_ln895_11_reg_1590 : in STD_LOGIC;
    add_ln1353_2_reg_1534 : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of hls_get_trig_vals_get_trig_vals_luteOg_rom : entity is "get_trig_vals_luteOg_rom";
end hls_get_trig_vals_get_trig_vals_luteOg_rom;

architecture STRUCTURE of hls_get_trig_vals_get_trig_vals_luteOg_rom is
  signal \q0_reg_i_10__2_n_0\ : STD_LOGIC;
  signal \q0_reg_i_11__2_n_0\ : STD_LOGIC;
  signal \q0_reg_i_12__2_n_0\ : STD_LOGIC;
  signal \q0_reg_i_13__2_n_0\ : STD_LOGIC;
  signal \q0_reg_i_1__2_n_0\ : STD_LOGIC;
  signal \q0_reg_i_2__2_n_0\ : STD_LOGIC;
  signal \q0_reg_i_3__2_n_0\ : STD_LOGIC;
  signal \q0_reg_i_4__2_n_0\ : STD_LOGIC;
  signal \q0_reg_i_5__2_n_0\ : STD_LOGIC;
  signal \q0_reg_i_6__2_n_0\ : STD_LOGIC;
  signal \q0_reg_i_7__2_n_0\ : STD_LOGIC;
  signal \q0_reg_i_8__2_n_0\ : STD_LOGIC;
  signal \q0_reg_i_9__2_n_0\ : STD_LOGIC;
  signal \q1_reg_i_1__2_n_0\ : STD_LOGIC;
  signal \q1_reg_i_2__2_n_0\ : STD_LOGIC;
  signal \q1_reg_i_3__2_n_0\ : STD_LOGIC;
  signal \q1_reg_i_4__2_n_0\ : STD_LOGIC;
  signal \q1_reg_i_5__2_n_0\ : STD_LOGIC;
  signal \q1_reg_i_6__2_n_0\ : STD_LOGIC;
  signal \q1_reg_i_7__2_n_0\ : STD_LOGIC;
  signal \q1_reg_i_8__2_n_0\ : STD_LOGIC;
  signal \q1_reg_i_9__2_n_0\ : STD_LOGIC;
  signal NLW_q0_reg_CASDOUTA_UNCONNECTED : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal NLW_q0_reg_CASDOUTB_UNCONNECTED : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal NLW_q0_reg_CASDOUTPA_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_q0_reg_CASDOUTPB_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_q1_reg_CASDOUTA_UNCONNECTED : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal NLW_q1_reg_CASDOUTB_UNCONNECTED : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal NLW_q1_reg_CASDOUTPA_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_q1_reg_CASDOUTPB_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute \MEM.PORTA.DATA_BIT_LAYOUT\ : string;
  attribute \MEM.PORTA.DATA_BIT_LAYOUT\ of q0_reg : label is "p2_d16";
  attribute \MEM.PORTB.DATA_BIT_LAYOUT\ : string;
  attribute \MEM.PORTB.DATA_BIT_LAYOUT\ of q0_reg : label is "p2_d16";
  attribute METHODOLOGY_DRC_VIOS : string;
  attribute METHODOLOGY_DRC_VIOS of q0_reg : label is "";
  attribute OPT_MODIFIED : string;
  attribute OPT_MODIFIED of q0_reg : label is "MLO";
  attribute RDADDR_COLLISION_HWCONFIG : string;
  attribute RDADDR_COLLISION_HWCONFIG of q0_reg : label is "DELAYED_WRITE";
  attribute RTL_RAM_BITS : integer;
  attribute RTL_RAM_BITS of q0_reg : label is 9216;
  attribute RTL_RAM_NAME : string;
  attribute RTL_RAM_NAME of q0_reg : label is "lut_tables_3_U/get_trig_vals_luteOg_rom_U/q0";
  attribute bram_addr_begin : integer;
  attribute bram_addr_begin of q0_reg : label is 0;
  attribute bram_addr_end : integer;
  attribute bram_addr_end of q0_reg : label is 255;
  attribute bram_slice_begin : integer;
  attribute bram_slice_begin of q0_reg : label is 0;
  attribute bram_slice_end : integer;
  attribute bram_slice_end of q0_reg : label is 17;
  attribute ram_addr_begin : integer;
  attribute ram_addr_begin of q0_reg : label is 0;
  attribute ram_addr_end : integer;
  attribute ram_addr_end of q0_reg : label is 255;
  attribute ram_ext_slice_begin : integer;
  attribute ram_ext_slice_begin of q0_reg : label is 18;
  attribute ram_ext_slice_end : integer;
  attribute ram_ext_slice_end of q0_reg : label is 35;
  attribute ram_offset : integer;
  attribute ram_offset of q0_reg : label is 0;
  attribute ram_slice_begin : integer;
  attribute ram_slice_begin of q0_reg : label is 0;
  attribute ram_slice_end : integer;
  attribute ram_slice_end of q0_reg : label is 17;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \q0_reg_i_10__2\ : label is "soft_lutpair11";
  attribute \MEM.PORTA.DATA_BIT_LAYOUT\ of q1_reg : label is "p2_d16";
  attribute \MEM.PORTB.DATA_BIT_LAYOUT\ of q1_reg : label is "p2_d16";
  attribute METHODOLOGY_DRC_VIOS of q1_reg : label is "";
  attribute OPT_MODIFIED of q1_reg : label is "MLO";
  attribute RDADDR_COLLISION_HWCONFIG of q1_reg : label is "DELAYED_WRITE";
  attribute RTL_RAM_BITS of q1_reg : label is 9216;
  attribute RTL_RAM_NAME of q1_reg : label is "lut_tables_3_U/get_trig_vals_luteOg_rom_U/q1";
  attribute bram_addr_begin of q1_reg : label is 0;
  attribute bram_addr_end of q1_reg : label is 255;
  attribute bram_slice_begin of q1_reg : label is 0;
  attribute bram_slice_end of q1_reg : label is 17;
  attribute ram_addr_begin of q1_reg : label is 0;
  attribute ram_addr_end of q1_reg : label is 255;
  attribute ram_ext_slice_begin of q1_reg : label is 18;
  attribute ram_ext_slice_end of q1_reg : label is 35;
  attribute ram_offset of q1_reg : label is 0;
  attribute ram_slice_begin of q1_reg : label is 0;
  attribute ram_slice_end of q1_reg : label is 17;
  attribute SOFT_HLUTNM of \q1_reg_i_4__2\ : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of \q1_reg_i_5__2\ : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of \q1_reg_i_6__2\ : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of \q1_reg_i_7__2\ : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of \q1_reg_i_9__2\ : label is "soft_lutpair9";
begin
q0_reg: unisim.vcomponents.RAMB18E2
    generic map(
      CASCADE_ORDER_A => "NONE",
      CASCADE_ORDER_B => "NONE",
      CLOCK_DOMAINS => "COMMON",
      DOA_REG => 1,
      DOB_REG => 1,
      ENADDRENA => "FALSE",
      ENADDRENB => "FALSE",
      INITP_00 => X"AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA",
      INITP_01 => X"000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEAAA",
      INITP_02 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_03 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_04 => X"55555555555555555555555555555400000000000000000000000000000000FF",
      INITP_05 => X"0000000000000000000000000000005555555555555555555555555555555555",
      INITP_06 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_07 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_00 => X"022B01CF017B013000EC00B2007F00550033001A000900010000000900190032",
      INIT_01 => X"0C580B770A9F09CE09060847078F06E00639059A0503047503EF037202FD0290",
      INIT_02 => X"1EAF1D4E1BF41AA21959181716DD15AC1482136012471135102C0F2B0E320D41",
      INIT_03 => X"38E4370835333365319F2FE12E2A2C7B2AD42934279C260C2483230221892018",
      INIT_04 => X"5A89583A55F153AF51754F414D144AEF48D146BA44AA42A140A03EA63CB33AC8",
      INIT_05 => X"831280597DA67AF9785375B3731A70876DFB6B7568F6667E640C61A15F3D5CE0",
      INIT_06 => X"B1D4AEBDABABA89FA598A2989F9C9CA799B796CE93EA910C8E348B62889785D1",
      INIT_07 => X"E60DE2A4DF40DBE1D887D532D1E1CE95CB4FC80DC4D1C199BE67BB3BB813B4F1",
      INIT_08 => X"1EE11B35178E13EA104A0CAE0916058201F2FE66FADEF75BF3DCF062ECEBE97A",
      INIT_09 => X"5B63578453A84FCE4BF84824445440863CBC38F5353131702DB329F926432290",
      INIT_0A => X"9A96969392938E948A97869C82A37EAC7AB776C472D36EE56AF9671063295F45",
      INIT_0B => X"DB71D75CD348CF34CB21C70FC2FEBEEEBADFB6D1B2C5AEB9AAAFA6A7A2A09E9A",
      INIT_0C => X"000000000000000000000000000000000000000000000000EBCAE7B3E39DDF87",
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
      INIT_20 => X"2F172B0326EF22DA1EC41AAD1697127F0E680A5006380220FE08F9F0F5D9F1C1",
      INIT_21 => X"6FC06BC167BF63BC5FB75BB157A953A04F954B8A477C436E3F5F3B4E373D332B",
      INIT_22 => X"AE96AABBA6DEA2FD9F1B9B35974D93638F768B87879583A27FAC7BB477BA73BE",
      INIT_23 => X"EA90E6EBE342DF95DBE4D830D478D0BDCCFEC93CC577C1AEBDE3BA14B642B26D",
      INIT_24 => X"22B61F551BEF1885151611A20E2A0AAE072D03A8001EFC91F8FFF56AF1D0EE32",
      INIT_25 => X"561B530C4FF84CDF49C0469B437240433D0E39D536963353300A2CBC296A2612",
      INIT_26 => X"83E9813A7E847BC87906763E7370709C6DC16AE167FB650F621C5F255C275924",
      INIT_27 => X"AB5FA91BA6CFA47DA2239FC39D5C9AEE987A95FF937D90F48E658BD089348692",
      INIT_28 => X"CBDACA09C831C652C46BC27DC087BE8ABC85BA7AB867B64DB42CB203AFD4AD9D",
      INIT_29 => X"E4D1E37CE21FE0BADF4EDDD9DC5DDAD9D94DD7B9D61ED47BD2D1D11ECF64CDA3",
      INIT_2A => X"F5DBF507F42BF347F25BF166F06AEF65EE58ED44EC27EB02E9D5E8A0E763E61E",
      INIT_2B => X"FEB1FE62FE0BFDABFD43FCD2FC5AFBD9FB4FFABEFA24F982F8D7F824F769F6A6",
      INIT_2C => X"000000000000000000000000000000000000000000000000FF99FF6CFF36FEF8",
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
      WRITE_WIDTH_B => 18
    )
        port map (
      ADDRARDADDR(13 downto 12) => B"00",
      ADDRARDADDR(11) => \q0_reg_i_1__2_n_0\,
      ADDRARDADDR(10) => \q0_reg_i_2__2_n_0\,
      ADDRARDADDR(9) => \q0_reg_i_3__2_n_0\,
      ADDRARDADDR(8) => \q0_reg_i_4__2_n_0\,
      ADDRARDADDR(7) => \q0_reg_i_5__2_n_0\,
      ADDRARDADDR(6) => \q0_reg_i_6__2_n_0\,
      ADDRARDADDR(5) => \q0_reg_i_7__2_n_0\,
      ADDRARDADDR(4) => \q0_reg_i_8__2_n_0\,
      ADDRARDADDR(3 downto 0) => B"0000",
      ADDRBWRADDR(13 downto 12) => B"10",
      ADDRBWRADDR(11) => \q0_reg_i_1__2_n_0\,
      ADDRBWRADDR(10) => \q0_reg_i_2__2_n_0\,
      ADDRBWRADDR(9) => \q0_reg_i_3__2_n_0\,
      ADDRBWRADDR(8) => \q0_reg_i_4__2_n_0\,
      ADDRBWRADDR(7) => \q0_reg_i_5__2_n_0\,
      ADDRBWRADDR(6) => \q0_reg_i_6__2_n_0\,
      ADDRBWRADDR(5) => \q0_reg_i_7__2_n_0\,
      ADDRBWRADDR(4) => \q0_reg_i_8__2_n_0\,
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
      DINADIN(15 downto 0) => B"1111111111111111",
      DINBDIN(15 downto 0) => B"1111111111111111",
      DINPADINP(1 downto 0) => B"11",
      DINPBDINP(1 downto 0) => B"11",
      DOUTADOUT(15 downto 0) => hw_trig_vals_3_V(15 downto 0),
      DOUTBDOUT(15 downto 0) => hw_trig_vals_3_V(33 downto 18),
      DOUTPADOUTP(1 downto 0) => hw_trig_vals_3_V(17 downto 16),
      DOUTPBDOUTP(1 downto 0) => hw_trig_vals_3_V(35 downto 34),
      ENARDEN => ce1,
      ENBWREN => ce1,
      REGCEAREGCE => ap_enable_reg_pp0_iter3,
      REGCEB => ap_enable_reg_pp0_iter3,
      RSTRAMARSTRAM => '0',
      RSTRAMB => '0',
      RSTREGARSTREG => '0',
      RSTREGB => '0',
      SLEEP => '0',
      WEA(1 downto 0) => B"00",
      WEBWE(3 downto 0) => B"0000"
    );
\q0_reg_i_10__2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"E0"
    )
        port map (
      I0 => add_ln1353_6_reg_1578(3),
      I1 => add_ln1353_6_reg_1578(2),
      I2 => add_ln1353_6_reg_1578(4),
      O => \q0_reg_i_10__2_n_0\
    );
\q0_reg_i_11__2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => add_ln1353_6_reg_1578(6),
      I1 => add_ln1353_6_reg_1578(5),
      O => \q0_reg_i_11__2_n_0\
    );
\q0_reg_i_12__2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFEFEFE"
    )
        port map (
      I0 => add_ln1353_6_reg_1578(6),
      I1 => add_ln1353_6_reg_1578(5),
      I2 => add_ln1353_6_reg_1578(7),
      I3 => add_ln1353_6_reg_1578(3),
      I4 => add_ln1353_6_reg_1578(4),
      O => \q0_reg_i_12__2_n_0\
    );
\q0_reg_i_13__2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"88888880"
    )
        port map (
      I0 => add_ln1353_6_reg_1578(2),
      I1 => add_ln1353_6_reg_1578(4),
      I2 => add_ln1353_6_reg_1578(0),
      I3 => add_ln1353_6_reg_1578(1),
      I4 => add_ln1353_2_reg_1534(0),
      O => \q0_reg_i_13__2_n_0\
    );
\q0_reg_i_1__2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7777777F88888880"
    )
        port map (
      I0 => add_ln1353_6_reg_1578(8),
      I1 => \q0_reg_i_9__2_n_0\,
      I2 => \q0_reg_i_10__2_n_0\,
      I3 => add_ln1353_6_reg_1578(7),
      I4 => \q0_reg_i_11__2_n_0\,
      I5 => add_ln1353_6_reg_1578(9),
      O => \q0_reg_i_1__2_n_0\
    );
\q0_reg_i_2__2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0001FFFFFFFE0000"
    )
        port map (
      I0 => add_ln1353_6_reg_1578(6),
      I1 => add_ln1353_6_reg_1578(5),
      I2 => add_ln1353_6_reg_1578(7),
      I3 => \q0_reg_i_10__2_n_0\,
      I4 => \q0_reg_i_9__2_n_0\,
      I5 => add_ln1353_6_reg_1578(8),
      O => \q0_reg_i_2__2_n_0\
    );
\q0_reg_i_3__2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"EEEAFFFF11150000"
    )
        port map (
      I0 => \q0_reg_i_11__2_n_0\,
      I1 => add_ln1353_6_reg_1578(4),
      I2 => add_ln1353_6_reg_1578(2),
      I3 => add_ln1353_6_reg_1578(3),
      I4 => \q0_reg_i_9__2_n_0\,
      I5 => add_ln1353_6_reg_1578(7),
      O => \q0_reg_i_3__2_n_0\
    );
\q0_reg_i_4__2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"A9A9A999AAAAAAAA"
    )
        port map (
      I0 => add_ln1353_6_reg_1578(6),
      I1 => add_ln1353_6_reg_1578(5),
      I2 => add_ln1353_6_reg_1578(4),
      I3 => add_ln1353_6_reg_1578(2),
      I4 => add_ln1353_6_reg_1578(3),
      I5 => \q0_reg_i_9__2_n_0\,
      O => \q0_reg_i_4__2_n_0\
    );
\q0_reg_i_5__2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"9995AAAA"
    )
        port map (
      I0 => add_ln1353_6_reg_1578(5),
      I1 => add_ln1353_6_reg_1578(4),
      I2 => add_ln1353_6_reg_1578(2),
      I3 => add_ln1353_6_reg_1578(3),
      I4 => \q0_reg_i_9__2_n_0\,
      O => \q0_reg_i_5__2_n_0\
    );
\q0_reg_i_6__2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"57A8"
    )
        port map (
      I0 => \q0_reg_i_9__2_n_0\,
      I1 => add_ln1353_6_reg_1578(2),
      I2 => add_ln1353_6_reg_1578(3),
      I3 => add_ln1353_6_reg_1578(4),
      O => \q0_reg_i_6__2_n_0\
    );
\q0_reg_i_7__2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"9C"
    )
        port map (
      I0 => add_ln1353_6_reg_1578(2),
      I1 => add_ln1353_6_reg_1578(3),
      I2 => \q0_reg_i_9__2_n_0\,
      O => \q0_reg_i_7__2_n_0\
    );
\q0_reg_i_8__2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \q0_reg_i_9__2_n_0\,
      I1 => add_ln1353_6_reg_1578(2),
      O => \q0_reg_i_8__2_n_0\
    );
\q0_reg_i_9__2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFEEEEEEEEEEEEE"
    )
        port map (
      I0 => add_ln1353_6_reg_1578(11),
      I1 => add_ln1353_6_reg_1578(10),
      I2 => \q0_reg_i_12__2_n_0\,
      I3 => \q0_reg_i_13__2_n_0\,
      I4 => add_ln1353_6_reg_1578(8),
      I5 => add_ln1353_6_reg_1578(9),
      O => \q0_reg_i_9__2_n_0\
    );
q1_reg: unisim.vcomponents.RAMB18E2
    generic map(
      CASCADE_ORDER_A => "NONE",
      CASCADE_ORDER_B => "NONE",
      CLOCK_DOMAINS => "COMMON",
      DOA_REG => 1,
      DOB_REG => 1,
      ENADDRENA => "FALSE",
      ENADDRENB => "FALSE",
      INITP_00 => X"AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA",
      INITP_01 => X"000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEAAA",
      INITP_02 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_03 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_04 => X"55555555555555555555555555555400000000000000000000000000000000FF",
      INITP_05 => X"0000000000000000000000000000005555555555555555555555555555555555",
      INITP_06 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_07 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_00 => X"022B01CF017B013000EC00B2007F00550033001A000900010000000900190032",
      INIT_01 => X"0C580B770A9F09CE09060847078F06E00639059A0503047503EF037202FD0290",
      INIT_02 => X"1EAF1D4E1BF41AA21959181716DD15AC1482136012471135102C0F2B0E320D41",
      INIT_03 => X"38E4370835333365319F2FE12E2A2C7B2AD42934279C260C2483230221892018",
      INIT_04 => X"5A89583A55F153AF51754F414D144AEF48D146BA44AA42A140A03EA63CB33AC8",
      INIT_05 => X"831280597DA67AF9785375B3731A70876DFB6B7568F6667E640C61A15F3D5CE0",
      INIT_06 => X"B1D4AEBDABABA89FA598A2989F9C9CA799B796CE93EA910C8E348B62889785D1",
      INIT_07 => X"E60DE2A4DF40DBE1D887D532D1E1CE95CB4FC80DC4D1C199BE67BB3BB813B4F1",
      INIT_08 => X"1EE11B35178E13EA104A0CAE0916058201F2FE66FADEF75BF3DCF062ECEBE97A",
      INIT_09 => X"5B63578453A84FCE4BF84824445440863CBC38F5353131702DB329F926432290",
      INIT_0A => X"9A96969392938E948A97869C82A37EAC7AB776C472D36EE56AF9671063295F45",
      INIT_0B => X"DB71D75CD348CF34CB21C70FC2FEBEEEBADFB6D1B2C5AEB9AAAFA6A7A2A09E9A",
      INIT_0C => X"000000000000000000000000000000000000000000000000EBCAE7B3E39DDF87",
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
      INIT_20 => X"2F172B0326EF22DA1EC41AAD1697127F0E680A5006380220FE08F9F0F5D9F1C1",
      INIT_21 => X"6FC06BC167BF63BC5FB75BB157A953A04F954B8A477C436E3F5F3B4E373D332B",
      INIT_22 => X"AE96AABBA6DEA2FD9F1B9B35974D93638F768B87879583A27FAC7BB477BA73BE",
      INIT_23 => X"EA90E6EBE342DF95DBE4D830D478D0BDCCFEC93CC577C1AEBDE3BA14B642B26D",
      INIT_24 => X"22B61F551BEF1885151611A20E2A0AAE072D03A8001EFC91F8FFF56AF1D0EE32",
      INIT_25 => X"561B530C4FF84CDF49C0469B437240433D0E39D536963353300A2CBC296A2612",
      INIT_26 => X"83E9813A7E847BC87906763E7370709C6DC16AE167FB650F621C5F255C275924",
      INIT_27 => X"AB5FA91BA6CFA47DA2239FC39D5C9AEE987A95FF937D90F48E658BD089348692",
      INIT_28 => X"CBDACA09C831C652C46BC27DC087BE8ABC85BA7AB867B64DB42CB203AFD4AD9D",
      INIT_29 => X"E4D1E37CE21FE0BADF4EDDD9DC5DDAD9D94DD7B9D61ED47BD2D1D11ECF64CDA3",
      INIT_2A => X"F5DBF507F42BF347F25BF166F06AEF65EE58ED44EC27EB02E9D5E8A0E763E61E",
      INIT_2B => X"FEB1FE62FE0BFDABFD43FCD2FC5AFBD9FB4FFABEFA24F982F8D7F824F769F6A6",
      INIT_2C => X"000000000000000000000000000000000000000000000000FF99FF6CFF36FEF8",
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
      WRITE_WIDTH_B => 18
    )
        port map (
      ADDRARDADDR(13 downto 12) => B"00",
      ADDRARDADDR(11) => \q1_reg_i_1__2_n_0\,
      ADDRARDADDR(10) => \q1_reg_i_2__2_n_0\,
      ADDRARDADDR(9) => \q1_reg_i_3__2_n_0\,
      ADDRARDADDR(8) => \q1_reg_i_4__2_n_0\,
      ADDRARDADDR(7) => \q1_reg_i_5__2_n_0\,
      ADDRARDADDR(6) => \q1_reg_i_6__2_n_0\,
      ADDRARDADDR(5) => \q1_reg_i_7__2_n_0\,
      ADDRARDADDR(4) => \q1_reg_i_8__2_n_0\,
      ADDRARDADDR(3 downto 0) => B"0000",
      ADDRBWRADDR(13 downto 12) => B"10",
      ADDRBWRADDR(11) => \q1_reg_i_1__2_n_0\,
      ADDRBWRADDR(10) => \q1_reg_i_2__2_n_0\,
      ADDRBWRADDR(9) => \q1_reg_i_3__2_n_0\,
      ADDRBWRADDR(8) => \q1_reg_i_4__2_n_0\,
      ADDRBWRADDR(7) => \q1_reg_i_5__2_n_0\,
      ADDRBWRADDR(6) => \q1_reg_i_6__2_n_0\,
      ADDRBWRADDR(5) => \q1_reg_i_7__2_n_0\,
      ADDRBWRADDR(4) => \q1_reg_i_8__2_n_0\,
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
      CASDOUTA(15 downto 0) => NLW_q1_reg_CASDOUTA_UNCONNECTED(15 downto 0),
      CASDOUTB(15 downto 0) => NLW_q1_reg_CASDOUTB_UNCONNECTED(15 downto 0),
      CASDOUTPA(1 downto 0) => NLW_q1_reg_CASDOUTPA_UNCONNECTED(1 downto 0),
      CASDOUTPB(1 downto 0) => NLW_q1_reg_CASDOUTPB_UNCONNECTED(1 downto 0),
      CASOREGIMUXA => '0',
      CASOREGIMUXB => '0',
      CASOREGIMUXEN_A => '1',
      CASOREGIMUXEN_B => '1',
      CLKARDCLK => ap_clk,
      CLKBWRCLK => ap_clk,
      DINADIN(15 downto 0) => B"1111111111111111",
      DINBDIN(15 downto 0) => B"1111111111111111",
      DINPADINP(1 downto 0) => B"11",
      DINPBDINP(1 downto 0) => B"11",
      DOUTADOUT(15 downto 0) => hw_trig_vals_11_V(15 downto 0),
      DOUTBDOUT(15 downto 0) => hw_trig_vals_11_V(33 downto 18),
      DOUTPADOUTP(1 downto 0) => hw_trig_vals_11_V(17 downto 16),
      DOUTPBDOUTP(1 downto 0) => hw_trig_vals_11_V(35 downto 34),
      ENARDEN => ce1,
      ENBWREN => ce1,
      REGCEAREGCE => ap_enable_reg_pp0_iter3,
      REGCEB => ap_enable_reg_pp0_iter3,
      RSTRAMARSTRAM => '0',
      RSTRAMB => '0',
      RSTREGARSTREG => '0',
      RSTREGB => '0',
      SLEEP => '0',
      WEA(1 downto 0) => B"00",
      WEBWE(3 downto 0) => B"0000"
    );
\q1_reg_i_1__2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"03FFAAAAFC00AAAA"
    )
        port map (
      I0 => tmp_7_reg_1595(7),
      I1 => add_ln1353_6_reg_1578(7),
      I2 => \q1_reg_i_9__2_n_0\,
      I3 => add_ln1353_6_reg_1578(8),
      I4 => icmp_ln895_11_reg_1590,
      I5 => add_ln1353_6_reg_1578(9),
      O => \q1_reg_i_1__2_n_0\
    );
\q1_reg_i_2__2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"03AAFCAA"
    )
        port map (
      I0 => tmp_7_reg_1595(6),
      I1 => \q1_reg_i_9__2_n_0\,
      I2 => add_ln1353_6_reg_1578(7),
      I3 => icmp_ln895_11_reg_1590,
      I4 => add_ln1353_6_reg_1578(8),
      O => \q1_reg_i_2__2_n_0\
    );
\q1_reg_i_3__2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFCAAAA0003AAAA"
    )
        port map (
      I0 => tmp_7_reg_1595(5),
      I1 => add_ln1353_6_reg_1578(5),
      I2 => add_ln1353_6_reg_1578(6),
      I3 => add_ln1353_6_reg_1578(4),
      I4 => icmp_ln895_11_reg_1590,
      I5 => add_ln1353_6_reg_1578(7),
      O => \q1_reg_i_3__2_n_0\
    );
\q1_reg_i_4__2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"F0C3AAAA"
    )
        port map (
      I0 => tmp_7_reg_1595(4),
      I1 => add_ln1353_6_reg_1578(5),
      I2 => add_ln1353_6_reg_1578(6),
      I3 => add_ln1353_6_reg_1578(4),
      I4 => icmp_ln895_11_reg_1590,
      O => \q1_reg_i_4__2_n_0\
    );
\q1_reg_i_5__2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"E22E"
    )
        port map (
      I0 => tmp_7_reg_1595(3),
      I1 => icmp_ln895_11_reg_1590,
      I2 => add_ln1353_6_reg_1578(4),
      I3 => add_ln1353_6_reg_1578(5),
      O => \q1_reg_i_5__2_n_0\
    );
\q1_reg_i_6__2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"74"
    )
        port map (
      I0 => add_ln1353_6_reg_1578(4),
      I1 => icmp_ln895_11_reg_1590,
      I2 => tmp_7_reg_1595(2),
      O => \q1_reg_i_6__2_n_0\
    );
\q1_reg_i_7__2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => add_ln1353_6_reg_1578(3),
      I1 => icmp_ln895_11_reg_1590,
      I2 => tmp_7_reg_1595(1),
      O => \q1_reg_i_7__2_n_0\
    );
\q1_reg_i_8__2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => add_ln1353_6_reg_1578(2),
      I1 => icmp_ln895_11_reg_1590,
      I2 => tmp_7_reg_1595(0),
      O => \q1_reg_i_8__2_n_0\
    );
\q1_reg_i_9__2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"FE"
    )
        port map (
      I0 => add_ln1353_6_reg_1578(5),
      I1 => add_ln1353_6_reg_1578(6),
      I2 => add_ln1353_6_reg_1578(4),
      O => \q1_reg_i_9__2_n_0\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity hls_get_trig_vals_get_trig_vals_lutfYi_rom is
  port (
    hw_trig_vals_4_V : out STD_LOGIC_VECTOR ( 35 downto 0 );
    hw_trig_vals_12_V : out STD_LOGIC_VECTOR ( 35 downto 0 );
    ap_clk : in STD_LOGIC;
    ce1 : in STD_LOGIC;
    ap_enable_reg_pp0_iter3 : in STD_LOGIC;
    add_ln1353_8_reg_1484_pp0_iter1_reg : in STD_LOGIC_VECTOR ( 12 downto 0 );
    tmp_9_reg_1605 : in STD_LOGIC_VECTOR ( 7 downto 0 );
    icmp_ln895_12_reg_1600 : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of hls_get_trig_vals_get_trig_vals_lutfYi_rom : entity is "get_trig_vals_lutfYi_rom";
end hls_get_trig_vals_get_trig_vals_lutfYi_rom;

architecture STRUCTURE of hls_get_trig_vals_get_trig_vals_lutfYi_rom is
  signal \q0_reg_i_10__3_n_0\ : STD_LOGIC;
  signal \q0_reg_i_11__3_n_0\ : STD_LOGIC;
  signal \q0_reg_i_12__3_n_0\ : STD_LOGIC;
  signal \q0_reg_i_13__3_n_0\ : STD_LOGIC;
  signal \q0_reg_i_1__3_n_0\ : STD_LOGIC;
  signal \q0_reg_i_2__3_n_0\ : STD_LOGIC;
  signal \q0_reg_i_3__3_n_0\ : STD_LOGIC;
  signal \q0_reg_i_4__3_n_0\ : STD_LOGIC;
  signal \q0_reg_i_5__3_n_0\ : STD_LOGIC;
  signal \q0_reg_i_6__3_n_0\ : STD_LOGIC;
  signal \q0_reg_i_7__3_n_0\ : STD_LOGIC;
  signal \q0_reg_i_8__3_n_0\ : STD_LOGIC;
  signal \q0_reg_i_9__3_n_0\ : STD_LOGIC;
  signal \q1_reg_i_1__3_n_0\ : STD_LOGIC;
  signal \q1_reg_i_2__3_n_0\ : STD_LOGIC;
  signal \q1_reg_i_3__3_n_0\ : STD_LOGIC;
  signal \q1_reg_i_4__3_n_0\ : STD_LOGIC;
  signal \q1_reg_i_5__3_n_0\ : STD_LOGIC;
  signal \q1_reg_i_6__3_n_0\ : STD_LOGIC;
  signal \q1_reg_i_7__3_n_0\ : STD_LOGIC;
  signal \q1_reg_i_8__3_n_0\ : STD_LOGIC;
  signal \q1_reg_i_9__3_n_0\ : STD_LOGIC;
  signal NLW_q0_reg_CASDOUTA_UNCONNECTED : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal NLW_q0_reg_CASDOUTB_UNCONNECTED : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal NLW_q0_reg_CASDOUTPA_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_q0_reg_CASDOUTPB_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_q1_reg_CASDOUTA_UNCONNECTED : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal NLW_q1_reg_CASDOUTB_UNCONNECTED : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal NLW_q1_reg_CASDOUTPA_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_q1_reg_CASDOUTPB_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute \MEM.PORTA.DATA_BIT_LAYOUT\ : string;
  attribute \MEM.PORTA.DATA_BIT_LAYOUT\ of q0_reg : label is "p2_d16";
  attribute \MEM.PORTB.DATA_BIT_LAYOUT\ : string;
  attribute \MEM.PORTB.DATA_BIT_LAYOUT\ of q0_reg : label is "p2_d16";
  attribute METHODOLOGY_DRC_VIOS : string;
  attribute METHODOLOGY_DRC_VIOS of q0_reg : label is "";
  attribute OPT_MODIFIED : string;
  attribute OPT_MODIFIED of q0_reg : label is "MLO";
  attribute RDADDR_COLLISION_HWCONFIG : string;
  attribute RDADDR_COLLISION_HWCONFIG of q0_reg : label is "DELAYED_WRITE";
  attribute RTL_RAM_BITS : integer;
  attribute RTL_RAM_BITS of q0_reg : label is 9216;
  attribute RTL_RAM_NAME : string;
  attribute RTL_RAM_NAME of q0_reg : label is "lut_tables_4_U/get_trig_vals_lutfYi_rom_U/q0";
  attribute bram_addr_begin : integer;
  attribute bram_addr_begin of q0_reg : label is 0;
  attribute bram_addr_end : integer;
  attribute bram_addr_end of q0_reg : label is 255;
  attribute bram_slice_begin : integer;
  attribute bram_slice_begin of q0_reg : label is 0;
  attribute bram_slice_end : integer;
  attribute bram_slice_end of q0_reg : label is 17;
  attribute ram_addr_begin : integer;
  attribute ram_addr_begin of q0_reg : label is 0;
  attribute ram_addr_end : integer;
  attribute ram_addr_end of q0_reg : label is 255;
  attribute ram_ext_slice_begin : integer;
  attribute ram_ext_slice_begin of q0_reg : label is 18;
  attribute ram_ext_slice_end : integer;
  attribute ram_ext_slice_end of q0_reg : label is 35;
  attribute ram_offset : integer;
  attribute ram_offset of q0_reg : label is 0;
  attribute ram_slice_begin : integer;
  attribute ram_slice_begin of q0_reg : label is 0;
  attribute ram_slice_end : integer;
  attribute ram_slice_end of q0_reg : label is 17;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \q0_reg_i_10__3\ : label is "soft_lutpair14";
  attribute \MEM.PORTA.DATA_BIT_LAYOUT\ of q1_reg : label is "p2_d16";
  attribute \MEM.PORTB.DATA_BIT_LAYOUT\ of q1_reg : label is "p2_d16";
  attribute METHODOLOGY_DRC_VIOS of q1_reg : label is "";
  attribute OPT_MODIFIED of q1_reg : label is "MLO";
  attribute RDADDR_COLLISION_HWCONFIG of q1_reg : label is "DELAYED_WRITE";
  attribute RTL_RAM_BITS of q1_reg : label is 9216;
  attribute RTL_RAM_NAME of q1_reg : label is "lut_tables_4_U/get_trig_vals_lutfYi_rom_U/q1";
  attribute bram_addr_begin of q1_reg : label is 0;
  attribute bram_addr_end of q1_reg : label is 255;
  attribute bram_slice_begin of q1_reg : label is 0;
  attribute bram_slice_end of q1_reg : label is 17;
  attribute ram_addr_begin of q1_reg : label is 0;
  attribute ram_addr_end of q1_reg : label is 255;
  attribute ram_ext_slice_begin of q1_reg : label is 18;
  attribute ram_ext_slice_end of q1_reg : label is 35;
  attribute ram_offset of q1_reg : label is 0;
  attribute ram_slice_begin of q1_reg : label is 0;
  attribute ram_slice_end of q1_reg : label is 17;
  attribute SOFT_HLUTNM of \q1_reg_i_4__3\ : label is "soft_lutpair12";
  attribute SOFT_HLUTNM of \q1_reg_i_5__3\ : label is "soft_lutpair13";
  attribute SOFT_HLUTNM of \q1_reg_i_6__3\ : label is "soft_lutpair13";
  attribute SOFT_HLUTNM of \q1_reg_i_7__3\ : label is "soft_lutpair14";
  attribute SOFT_HLUTNM of \q1_reg_i_9__3\ : label is "soft_lutpair12";
begin
q0_reg: unisim.vcomponents.RAMB18E2
    generic map(
      CASCADE_ORDER_A => "NONE",
      CASCADE_ORDER_B => "NONE",
      CLOCK_DOMAINS => "COMMON",
      DOA_REG => 1,
      DOB_REG => 1,
      ENADDRENA => "FALSE",
      ENADDRENB => "FALSE",
      INITP_00 => X"AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA",
      INITP_01 => X"000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEAAA",
      INITP_02 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_03 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_04 => X"55555555555555555555555555555400000000000000000000000000000000FF",
      INITP_05 => X"0000000000000000000000000000005555555555555555555555555555555555",
      INITP_06 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_07 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_00 => X"023701DA0185013800F400B80085005A0037001D000B0001000000070017002F",
      INIT_01 => X"0C740B930AB909E8091F085E07A506F5064D05AD0516048704000381030B029D",
      INIT_02 => X"1EDC1D791C1F1ACC1982183F170415D214A71384126A1157104D0F4A0E500D5E",
      INIT_03 => X"39203743356D339F31D830182E612CB12B08296827CF263D24B4233221B82046",
      INIT_04 => X"5AD45883563A53F751BC4F874D5A4B33491446FC44EB42E240E03EE53CF13B05",
      INIT_05 => X"836980AF7DFC7B4E78A87607736D70D96E4C6BC6694666CD645A61EE5F895D2B",
      INIT_06 => X"B237AF1FAC0DA900A5F9A2F79FFB9D059A15972B944691678E8F8BBC88F08629",
      INIT_07 => X"E67AE311DFADDC4DD8F2D59CD24BCEFFCBB7C875C538C200BECDBBA0B878B555",
      INIT_08 => X"1F571BAB1803145E10BE0D21098905F40264FED7FB4FF7CBF44CF0D1ED5AE9E8",
      INIT_09 => X"5BDF5800542350494C72489E44CE41003D35396D35A931E82E2A2A7026B92306",
      INIT_0A => X"9B16971493138F148B16871B83227F2A7B35774273516F636B77678D63A65FC1",
      INIT_0B => X"DBF4D7DFD3CACFB6CBA3C791C380BF70BB61B753B346AF3BAB31A728A3209F1B",
      INIT_0C => X"000000000000000000000000000000000000000000000000EC4DE836E420E009",
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
      INIT_20 => X"2F9A2B862771235C1F461B30171913020EEB0AD306BB02A3FE8BFA73F65CF244",
      INIT_21 => X"70406C41683F643D60385C32582A542150174C0B47FE43F03FE13BD037BF33AD",
      INIT_22 => X"AF11AB36A759A37A9F979BB297CA93E08FF48C0588148420802B7C337839743E",
      INIT_23 => X"EB05E760E3B7E00BDC5AD8A7D4EFD135CD76C9B5C5F0C228BE5CBA8EB6BDB2E8",
      INIT_24 => X"23221FC11C5C18F2158412110E990B1E079D04190090FD03F972F5DCF243EEA6",
      INIT_25 => X"567C536F505B4D424A24470043D740A93D753A3C36FE33BB30732D2629D4267D",
      INIT_26 => X"843E81907EDB7C20795F769873CA70F76E1D6B3D6858656C627B5F845C875985",
      INIT_27 => X"ABA7A964A719A4C7A26FA0109DA99B3C98C9964E93CD91468EB88C23898886E6",
      INIT_28 => X"CC14CA44C86DC68EC4A8C2BBC0C6BECABCC6BABCB8AAB690B470B249B01AADE4",
      INIT_29 => X"E4FBE3A7E24BE0E7DF7CDE08DC8DDB0AD97FD7ECD652D4B0D306D155CF9CCDDC",
      INIT_2A => X"F5F5F522F447F364F279F185F08AEF86EE7AED67EC4BEB27E9FBE8C7E78BE647",
      INIT_2B => X"FEBAFE6CFE16FDB7FD50FCE1FC69FBE9FB61FAD0FA38F996F8EDF83BF781F6BF",
      INIT_2C => X"000000000000000000000000000000000000000000000000FF9EFF72FF3DFF00",
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
      WRITE_WIDTH_B => 18
    )
        port map (
      ADDRARDADDR(13 downto 12) => B"00",
      ADDRARDADDR(11) => \q0_reg_i_1__3_n_0\,
      ADDRARDADDR(10) => \q0_reg_i_2__3_n_0\,
      ADDRARDADDR(9) => \q0_reg_i_3__3_n_0\,
      ADDRARDADDR(8) => \q0_reg_i_4__3_n_0\,
      ADDRARDADDR(7) => \q0_reg_i_5__3_n_0\,
      ADDRARDADDR(6) => \q0_reg_i_6__3_n_0\,
      ADDRARDADDR(5) => \q0_reg_i_7__3_n_0\,
      ADDRARDADDR(4) => \q0_reg_i_8__3_n_0\,
      ADDRARDADDR(3 downto 0) => B"0000",
      ADDRBWRADDR(13 downto 12) => B"10",
      ADDRBWRADDR(11) => \q0_reg_i_1__3_n_0\,
      ADDRBWRADDR(10) => \q0_reg_i_2__3_n_0\,
      ADDRBWRADDR(9) => \q0_reg_i_3__3_n_0\,
      ADDRBWRADDR(8) => \q0_reg_i_4__3_n_0\,
      ADDRBWRADDR(7) => \q0_reg_i_5__3_n_0\,
      ADDRBWRADDR(6) => \q0_reg_i_6__3_n_0\,
      ADDRBWRADDR(5) => \q0_reg_i_7__3_n_0\,
      ADDRBWRADDR(4) => \q0_reg_i_8__3_n_0\,
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
      DINADIN(15 downto 0) => B"1111111111111111",
      DINBDIN(15 downto 0) => B"1111111111111111",
      DINPADINP(1 downto 0) => B"11",
      DINPBDINP(1 downto 0) => B"11",
      DOUTADOUT(15 downto 0) => hw_trig_vals_4_V(15 downto 0),
      DOUTBDOUT(15 downto 0) => hw_trig_vals_4_V(33 downto 18),
      DOUTPADOUTP(1 downto 0) => hw_trig_vals_4_V(17 downto 16),
      DOUTPBDOUTP(1 downto 0) => hw_trig_vals_4_V(35 downto 34),
      ENARDEN => ce1,
      ENBWREN => ce1,
      REGCEAREGCE => ap_enable_reg_pp0_iter3,
      REGCEB => ap_enable_reg_pp0_iter3,
      RSTRAMARSTRAM => '0',
      RSTRAMB => '0',
      RSTREGARSTREG => '0',
      RSTREGB => '0',
      SLEEP => '0',
      WEA(1 downto 0) => B"00",
      WEBWE(3 downto 0) => B"0000"
    );
\q0_reg_i_10__3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"E0"
    )
        port map (
      I0 => add_ln1353_8_reg_1484_pp0_iter1_reg(4),
      I1 => add_ln1353_8_reg_1484_pp0_iter1_reg(3),
      I2 => add_ln1353_8_reg_1484_pp0_iter1_reg(5),
      O => \q0_reg_i_10__3_n_0\
    );
\q0_reg_i_11__3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => add_ln1353_8_reg_1484_pp0_iter1_reg(7),
      I1 => add_ln1353_8_reg_1484_pp0_iter1_reg(6),
      O => \q0_reg_i_11__3_n_0\
    );
\q0_reg_i_12__3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFEFEFE"
    )
        port map (
      I0 => add_ln1353_8_reg_1484_pp0_iter1_reg(7),
      I1 => add_ln1353_8_reg_1484_pp0_iter1_reg(6),
      I2 => add_ln1353_8_reg_1484_pp0_iter1_reg(8),
      I3 => add_ln1353_8_reg_1484_pp0_iter1_reg(4),
      I4 => add_ln1353_8_reg_1484_pp0_iter1_reg(5),
      O => \q0_reg_i_12__3_n_0\
    );
\q0_reg_i_13__3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"88888880"
    )
        port map (
      I0 => add_ln1353_8_reg_1484_pp0_iter1_reg(3),
      I1 => add_ln1353_8_reg_1484_pp0_iter1_reg(5),
      I2 => add_ln1353_8_reg_1484_pp0_iter1_reg(1),
      I3 => add_ln1353_8_reg_1484_pp0_iter1_reg(2),
      I4 => add_ln1353_8_reg_1484_pp0_iter1_reg(0),
      O => \q0_reg_i_13__3_n_0\
    );
\q0_reg_i_1__3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7777777F88888880"
    )
        port map (
      I0 => add_ln1353_8_reg_1484_pp0_iter1_reg(9),
      I1 => \q0_reg_i_9__3_n_0\,
      I2 => \q0_reg_i_10__3_n_0\,
      I3 => add_ln1353_8_reg_1484_pp0_iter1_reg(8),
      I4 => \q0_reg_i_11__3_n_0\,
      I5 => add_ln1353_8_reg_1484_pp0_iter1_reg(10),
      O => \q0_reg_i_1__3_n_0\
    );
\q0_reg_i_2__3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0001FFFFFFFE0000"
    )
        port map (
      I0 => add_ln1353_8_reg_1484_pp0_iter1_reg(7),
      I1 => add_ln1353_8_reg_1484_pp0_iter1_reg(6),
      I2 => add_ln1353_8_reg_1484_pp0_iter1_reg(8),
      I3 => \q0_reg_i_10__3_n_0\,
      I4 => \q0_reg_i_9__3_n_0\,
      I5 => add_ln1353_8_reg_1484_pp0_iter1_reg(9),
      O => \q0_reg_i_2__3_n_0\
    );
\q0_reg_i_3__3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"EEEAFFFF11150000"
    )
        port map (
      I0 => \q0_reg_i_11__3_n_0\,
      I1 => add_ln1353_8_reg_1484_pp0_iter1_reg(5),
      I2 => add_ln1353_8_reg_1484_pp0_iter1_reg(3),
      I3 => add_ln1353_8_reg_1484_pp0_iter1_reg(4),
      I4 => \q0_reg_i_9__3_n_0\,
      I5 => add_ln1353_8_reg_1484_pp0_iter1_reg(8),
      O => \q0_reg_i_3__3_n_0\
    );
\q0_reg_i_4__3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"A9A9A999AAAAAAAA"
    )
        port map (
      I0 => add_ln1353_8_reg_1484_pp0_iter1_reg(7),
      I1 => add_ln1353_8_reg_1484_pp0_iter1_reg(6),
      I2 => add_ln1353_8_reg_1484_pp0_iter1_reg(5),
      I3 => add_ln1353_8_reg_1484_pp0_iter1_reg(3),
      I4 => add_ln1353_8_reg_1484_pp0_iter1_reg(4),
      I5 => \q0_reg_i_9__3_n_0\,
      O => \q0_reg_i_4__3_n_0\
    );
\q0_reg_i_5__3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"9995AAAA"
    )
        port map (
      I0 => add_ln1353_8_reg_1484_pp0_iter1_reg(6),
      I1 => add_ln1353_8_reg_1484_pp0_iter1_reg(5),
      I2 => add_ln1353_8_reg_1484_pp0_iter1_reg(3),
      I3 => add_ln1353_8_reg_1484_pp0_iter1_reg(4),
      I4 => \q0_reg_i_9__3_n_0\,
      O => \q0_reg_i_5__3_n_0\
    );
\q0_reg_i_6__3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"57A8"
    )
        port map (
      I0 => \q0_reg_i_9__3_n_0\,
      I1 => add_ln1353_8_reg_1484_pp0_iter1_reg(3),
      I2 => add_ln1353_8_reg_1484_pp0_iter1_reg(4),
      I3 => add_ln1353_8_reg_1484_pp0_iter1_reg(5),
      O => \q0_reg_i_6__3_n_0\
    );
\q0_reg_i_7__3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"9C"
    )
        port map (
      I0 => add_ln1353_8_reg_1484_pp0_iter1_reg(3),
      I1 => add_ln1353_8_reg_1484_pp0_iter1_reg(4),
      I2 => \q0_reg_i_9__3_n_0\,
      O => \q0_reg_i_7__3_n_0\
    );
\q0_reg_i_8__3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \q0_reg_i_9__3_n_0\,
      I1 => add_ln1353_8_reg_1484_pp0_iter1_reg(3),
      O => \q0_reg_i_8__3_n_0\
    );
\q0_reg_i_9__3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFEEEEEEEEEEEEE"
    )
        port map (
      I0 => add_ln1353_8_reg_1484_pp0_iter1_reg(12),
      I1 => add_ln1353_8_reg_1484_pp0_iter1_reg(11),
      I2 => \q0_reg_i_12__3_n_0\,
      I3 => \q0_reg_i_13__3_n_0\,
      I4 => add_ln1353_8_reg_1484_pp0_iter1_reg(9),
      I5 => add_ln1353_8_reg_1484_pp0_iter1_reg(10),
      O => \q0_reg_i_9__3_n_0\
    );
q1_reg: unisim.vcomponents.RAMB18E2
    generic map(
      CASCADE_ORDER_A => "NONE",
      CASCADE_ORDER_B => "NONE",
      CLOCK_DOMAINS => "COMMON",
      DOA_REG => 1,
      DOB_REG => 1,
      ENADDRENA => "FALSE",
      ENADDRENB => "FALSE",
      INITP_00 => X"AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA",
      INITP_01 => X"000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEAAA",
      INITP_02 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_03 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_04 => X"55555555555555555555555555555400000000000000000000000000000000FF",
      INITP_05 => X"0000000000000000000000000000005555555555555555555555555555555555",
      INITP_06 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_07 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_00 => X"023701DA0185013800F400B80085005A0037001D000B0001000000070017002F",
      INIT_01 => X"0C740B930AB909E8091F085E07A506F5064D05AD0516048704000381030B029D",
      INIT_02 => X"1EDC1D791C1F1ACC1982183F170415D214A71384126A1157104D0F4A0E500D5E",
      INIT_03 => X"39203743356D339F31D830182E612CB12B08296827CF263D24B4233221B82046",
      INIT_04 => X"5AD45883563A53F751BC4F874D5A4B33491446FC44EB42E240E03EE53CF13B05",
      INIT_05 => X"836980AF7DFC7B4E78A87607736D70D96E4C6BC6694666CD645A61EE5F895D2B",
      INIT_06 => X"B237AF1FAC0DA900A5F9A2F79FFB9D059A15972B944691678E8F8BBC88F08629",
      INIT_07 => X"E67AE311DFADDC4DD8F2D59CD24BCEFFCBB7C875C538C200BECDBBA0B878B555",
      INIT_08 => X"1F571BAB1803145E10BE0D21098905F40264FED7FB4FF7CBF44CF0D1ED5AE9E8",
      INIT_09 => X"5BDF5800542350494C72489E44CE41003D35396D35A931E82E2A2A7026B92306",
      INIT_0A => X"9B16971493138F148B16871B83227F2A7B35774273516F636B77678D63A65FC1",
      INIT_0B => X"DBF4D7DFD3CACFB6CBA3C791C380BF70BB61B753B346AF3BAB31A728A3209F1B",
      INIT_0C => X"000000000000000000000000000000000000000000000000EC4DE836E420E009",
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
      INIT_20 => X"2F9A2B862771235C1F461B30171913020EEB0AD306BB02A3FE8BFA73F65CF244",
      INIT_21 => X"70406C41683F643D60385C32582A542150174C0B47FE43F03FE13BD037BF33AD",
      INIT_22 => X"AF11AB36A759A37A9F979BB297CA93E08FF48C0588148420802B7C337839743E",
      INIT_23 => X"EB05E760E3B7E00BDC5AD8A7D4EFD135CD76C9B5C5F0C228BE5CBA8EB6BDB2E8",
      INIT_24 => X"23221FC11C5C18F2158412110E990B1E079D04190090FD03F972F5DCF243EEA6",
      INIT_25 => X"567C536F505B4D424A24470043D740A93D753A3C36FE33BB30732D2629D4267D",
      INIT_26 => X"843E81907EDB7C20795F769873CA70F76E1D6B3D6858656C627B5F845C875985",
      INIT_27 => X"ABA7A964A719A4C7A26FA0109DA99B3C98C9964E93CD91468EB88C23898886E6",
      INIT_28 => X"CC14CA44C86DC68EC4A8C2BBC0C6BECABCC6BABCB8AAB690B470B249B01AADE4",
      INIT_29 => X"E4FBE3A7E24BE0E7DF7CDE08DC8DDB0AD97FD7ECD652D4B0D306D155CF9CCDDC",
      INIT_2A => X"F5F5F522F447F364F279F185F08AEF86EE7AED67EC4BEB27E9FBE8C7E78BE647",
      INIT_2B => X"FEBAFE6CFE16FDB7FD50FCE1FC69FBE9FB61FAD0FA38F996F8EDF83BF781F6BF",
      INIT_2C => X"000000000000000000000000000000000000000000000000FF9EFF72FF3DFF00",
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
      WRITE_WIDTH_B => 18
    )
        port map (
      ADDRARDADDR(13 downto 12) => B"00",
      ADDRARDADDR(11) => \q1_reg_i_1__3_n_0\,
      ADDRARDADDR(10) => \q1_reg_i_2__3_n_0\,
      ADDRARDADDR(9) => \q1_reg_i_3__3_n_0\,
      ADDRARDADDR(8) => \q1_reg_i_4__3_n_0\,
      ADDRARDADDR(7) => \q1_reg_i_5__3_n_0\,
      ADDRARDADDR(6) => \q1_reg_i_6__3_n_0\,
      ADDRARDADDR(5) => \q1_reg_i_7__3_n_0\,
      ADDRARDADDR(4) => \q1_reg_i_8__3_n_0\,
      ADDRARDADDR(3 downto 0) => B"0000",
      ADDRBWRADDR(13 downto 12) => B"10",
      ADDRBWRADDR(11) => \q1_reg_i_1__3_n_0\,
      ADDRBWRADDR(10) => \q1_reg_i_2__3_n_0\,
      ADDRBWRADDR(9) => \q1_reg_i_3__3_n_0\,
      ADDRBWRADDR(8) => \q1_reg_i_4__3_n_0\,
      ADDRBWRADDR(7) => \q1_reg_i_5__3_n_0\,
      ADDRBWRADDR(6) => \q1_reg_i_6__3_n_0\,
      ADDRBWRADDR(5) => \q1_reg_i_7__3_n_0\,
      ADDRBWRADDR(4) => \q1_reg_i_8__3_n_0\,
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
      CASDOUTA(15 downto 0) => NLW_q1_reg_CASDOUTA_UNCONNECTED(15 downto 0),
      CASDOUTB(15 downto 0) => NLW_q1_reg_CASDOUTB_UNCONNECTED(15 downto 0),
      CASDOUTPA(1 downto 0) => NLW_q1_reg_CASDOUTPA_UNCONNECTED(1 downto 0),
      CASDOUTPB(1 downto 0) => NLW_q1_reg_CASDOUTPB_UNCONNECTED(1 downto 0),
      CASOREGIMUXA => '0',
      CASOREGIMUXB => '0',
      CASOREGIMUXEN_A => '1',
      CASOREGIMUXEN_B => '1',
      CLKARDCLK => ap_clk,
      CLKBWRCLK => ap_clk,
      DINADIN(15 downto 0) => B"1111111111111111",
      DINBDIN(15 downto 0) => B"1111111111111111",
      DINPADINP(1 downto 0) => B"11",
      DINPBDINP(1 downto 0) => B"11",
      DOUTADOUT(15 downto 0) => hw_trig_vals_12_V(15 downto 0),
      DOUTBDOUT(15 downto 0) => hw_trig_vals_12_V(33 downto 18),
      DOUTPADOUTP(1 downto 0) => hw_trig_vals_12_V(17 downto 16),
      DOUTPBDOUTP(1 downto 0) => hw_trig_vals_12_V(35 downto 34),
      ENARDEN => ce1,
      ENBWREN => ce1,
      REGCEAREGCE => ap_enable_reg_pp0_iter3,
      REGCEB => ap_enable_reg_pp0_iter3,
      RSTRAMARSTRAM => '0',
      RSTRAMB => '0',
      RSTREGARSTREG => '0',
      RSTREGB => '0',
      SLEEP => '0',
      WEA(1 downto 0) => B"00",
      WEBWE(3 downto 0) => B"0000"
    );
\q1_reg_i_1__3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"03FFAAAAFC00AAAA"
    )
        port map (
      I0 => tmp_9_reg_1605(7),
      I1 => add_ln1353_8_reg_1484_pp0_iter1_reg(8),
      I2 => \q1_reg_i_9__3_n_0\,
      I3 => add_ln1353_8_reg_1484_pp0_iter1_reg(9),
      I4 => icmp_ln895_12_reg_1600,
      I5 => add_ln1353_8_reg_1484_pp0_iter1_reg(10),
      O => \q1_reg_i_1__3_n_0\
    );
\q1_reg_i_2__3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"03AAFCAA"
    )
        port map (
      I0 => tmp_9_reg_1605(6),
      I1 => \q1_reg_i_9__3_n_0\,
      I2 => add_ln1353_8_reg_1484_pp0_iter1_reg(8),
      I3 => icmp_ln895_12_reg_1600,
      I4 => add_ln1353_8_reg_1484_pp0_iter1_reg(9),
      O => \q1_reg_i_2__3_n_0\
    );
\q1_reg_i_3__3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFCAAAA0003AAAA"
    )
        port map (
      I0 => tmp_9_reg_1605(5),
      I1 => add_ln1353_8_reg_1484_pp0_iter1_reg(6),
      I2 => add_ln1353_8_reg_1484_pp0_iter1_reg(7),
      I3 => add_ln1353_8_reg_1484_pp0_iter1_reg(5),
      I4 => icmp_ln895_12_reg_1600,
      I5 => add_ln1353_8_reg_1484_pp0_iter1_reg(8),
      O => \q1_reg_i_3__3_n_0\
    );
\q1_reg_i_4__3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"F0C3AAAA"
    )
        port map (
      I0 => tmp_9_reg_1605(4),
      I1 => add_ln1353_8_reg_1484_pp0_iter1_reg(6),
      I2 => add_ln1353_8_reg_1484_pp0_iter1_reg(7),
      I3 => add_ln1353_8_reg_1484_pp0_iter1_reg(5),
      I4 => icmp_ln895_12_reg_1600,
      O => \q1_reg_i_4__3_n_0\
    );
\q1_reg_i_5__3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"E22E"
    )
        port map (
      I0 => tmp_9_reg_1605(3),
      I1 => icmp_ln895_12_reg_1600,
      I2 => add_ln1353_8_reg_1484_pp0_iter1_reg(5),
      I3 => add_ln1353_8_reg_1484_pp0_iter1_reg(6),
      O => \q1_reg_i_5__3_n_0\
    );
\q1_reg_i_6__3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"74"
    )
        port map (
      I0 => add_ln1353_8_reg_1484_pp0_iter1_reg(5),
      I1 => icmp_ln895_12_reg_1600,
      I2 => tmp_9_reg_1605(2),
      O => \q1_reg_i_6__3_n_0\
    );
\q1_reg_i_7__3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => add_ln1353_8_reg_1484_pp0_iter1_reg(4),
      I1 => icmp_ln895_12_reg_1600,
      I2 => tmp_9_reg_1605(1),
      O => \q1_reg_i_7__3_n_0\
    );
\q1_reg_i_8__3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => add_ln1353_8_reg_1484_pp0_iter1_reg(3),
      I1 => icmp_ln895_12_reg_1600,
      I2 => tmp_9_reg_1605(0),
      O => \q1_reg_i_8__3_n_0\
    );
\q1_reg_i_9__3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"FE"
    )
        port map (
      I0 => add_ln1353_8_reg_1484_pp0_iter1_reg(6),
      I1 => add_ln1353_8_reg_1484_pp0_iter1_reg(7),
      I2 => add_ln1353_8_reg_1484_pp0_iter1_reg(5),
      O => \q1_reg_i_9__3_n_0\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity hls_get_trig_vals_get_trig_vals_lutg8j_rom is
  port (
    hw_trig_vals_5_V : out STD_LOGIC_VECTOR ( 35 downto 0 );
    hw_trig_vals_13_V : out STD_LOGIC_VECTOR ( 35 downto 0 );
    ap_clk : in STD_LOGIC;
    ce1 : in STD_LOGIC;
    ap_enable_reg_pp0_iter3 : in STD_LOGIC;
    add_ln1353_10_reg_1610 : in STD_LOGIC_VECTOR ( 10 downto 0 );
    tmp_11_reg_1627 : in STD_LOGIC_VECTOR ( 7 downto 0 );
    icmp_ln895_13_reg_1622 : in STD_LOGIC;
    add_ln1353_2_reg_1534 : in STD_LOGIC_VECTOR ( 1 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of hls_get_trig_vals_get_trig_vals_lutg8j_rom : entity is "get_trig_vals_lutg8j_rom";
end hls_get_trig_vals_get_trig_vals_lutg8j_rom;

architecture STRUCTURE of hls_get_trig_vals_get_trig_vals_lutg8j_rom is
  signal \q0_reg_i_10__4_n_0\ : STD_LOGIC;
  signal \q0_reg_i_11__4_n_0\ : STD_LOGIC;
  signal \q0_reg_i_12__4_n_0\ : STD_LOGIC;
  signal \q0_reg_i_13__4_n_0\ : STD_LOGIC;
  signal \q0_reg_i_1__4_n_0\ : STD_LOGIC;
  signal \q0_reg_i_2__4_n_0\ : STD_LOGIC;
  signal \q0_reg_i_3__4_n_0\ : STD_LOGIC;
  signal \q0_reg_i_4__4_n_0\ : STD_LOGIC;
  signal \q0_reg_i_5__4_n_0\ : STD_LOGIC;
  signal \q0_reg_i_6__4_n_0\ : STD_LOGIC;
  signal \q0_reg_i_7__4_n_0\ : STD_LOGIC;
  signal \q0_reg_i_8__4_n_0\ : STD_LOGIC;
  signal \q0_reg_i_9__4_n_0\ : STD_LOGIC;
  signal \q1_reg_i_1__4_n_0\ : STD_LOGIC;
  signal \q1_reg_i_2__4_n_0\ : STD_LOGIC;
  signal \q1_reg_i_3__4_n_0\ : STD_LOGIC;
  signal \q1_reg_i_4__4_n_0\ : STD_LOGIC;
  signal \q1_reg_i_5__4_n_0\ : STD_LOGIC;
  signal \q1_reg_i_6__4_n_0\ : STD_LOGIC;
  signal \q1_reg_i_7__4_n_0\ : STD_LOGIC;
  signal \q1_reg_i_8__4_n_0\ : STD_LOGIC;
  signal \q1_reg_i_9__4_n_0\ : STD_LOGIC;
  signal NLW_q0_reg_CASDOUTA_UNCONNECTED : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal NLW_q0_reg_CASDOUTB_UNCONNECTED : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal NLW_q0_reg_CASDOUTPA_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_q0_reg_CASDOUTPB_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_q1_reg_CASDOUTA_UNCONNECTED : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal NLW_q1_reg_CASDOUTB_UNCONNECTED : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal NLW_q1_reg_CASDOUTPA_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_q1_reg_CASDOUTPB_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute \MEM.PORTA.DATA_BIT_LAYOUT\ : string;
  attribute \MEM.PORTA.DATA_BIT_LAYOUT\ of q0_reg : label is "p2_d16";
  attribute \MEM.PORTB.DATA_BIT_LAYOUT\ : string;
  attribute \MEM.PORTB.DATA_BIT_LAYOUT\ of q0_reg : label is "p2_d16";
  attribute METHODOLOGY_DRC_VIOS : string;
  attribute METHODOLOGY_DRC_VIOS of q0_reg : label is "";
  attribute OPT_MODIFIED : string;
  attribute OPT_MODIFIED of q0_reg : label is "MLO";
  attribute RDADDR_COLLISION_HWCONFIG : string;
  attribute RDADDR_COLLISION_HWCONFIG of q0_reg : label is "DELAYED_WRITE";
  attribute RTL_RAM_BITS : integer;
  attribute RTL_RAM_BITS of q0_reg : label is 9216;
  attribute RTL_RAM_NAME : string;
  attribute RTL_RAM_NAME of q0_reg : label is "lut_tables_5_U/get_trig_vals_lutg8j_rom_U/q0";
  attribute bram_addr_begin : integer;
  attribute bram_addr_begin of q0_reg : label is 0;
  attribute bram_addr_end : integer;
  attribute bram_addr_end of q0_reg : label is 255;
  attribute bram_slice_begin : integer;
  attribute bram_slice_begin of q0_reg : label is 0;
  attribute bram_slice_end : integer;
  attribute bram_slice_end of q0_reg : label is 17;
  attribute ram_addr_begin : integer;
  attribute ram_addr_begin of q0_reg : label is 0;
  attribute ram_addr_end : integer;
  attribute ram_addr_end of q0_reg : label is 255;
  attribute ram_ext_slice_begin : integer;
  attribute ram_ext_slice_begin of q0_reg : label is 18;
  attribute ram_ext_slice_end : integer;
  attribute ram_ext_slice_end of q0_reg : label is 35;
  attribute ram_offset : integer;
  attribute ram_offset of q0_reg : label is 0;
  attribute ram_slice_begin : integer;
  attribute ram_slice_begin of q0_reg : label is 0;
  attribute ram_slice_end : integer;
  attribute ram_slice_end of q0_reg : label is 17;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \q0_reg_i_10__4\ : label is "soft_lutpair17";
  attribute \MEM.PORTA.DATA_BIT_LAYOUT\ of q1_reg : label is "p2_d16";
  attribute \MEM.PORTB.DATA_BIT_LAYOUT\ of q1_reg : label is "p2_d16";
  attribute METHODOLOGY_DRC_VIOS of q1_reg : label is "";
  attribute OPT_MODIFIED of q1_reg : label is "MLO";
  attribute RDADDR_COLLISION_HWCONFIG of q1_reg : label is "DELAYED_WRITE";
  attribute RTL_RAM_BITS of q1_reg : label is 9216;
  attribute RTL_RAM_NAME of q1_reg : label is "lut_tables_5_U/get_trig_vals_lutg8j_rom_U/q1";
  attribute bram_addr_begin of q1_reg : label is 0;
  attribute bram_addr_end of q1_reg : label is 255;
  attribute bram_slice_begin of q1_reg : label is 0;
  attribute bram_slice_end of q1_reg : label is 17;
  attribute ram_addr_begin of q1_reg : label is 0;
  attribute ram_addr_end of q1_reg : label is 255;
  attribute ram_ext_slice_begin of q1_reg : label is 18;
  attribute ram_ext_slice_end of q1_reg : label is 35;
  attribute ram_offset of q1_reg : label is 0;
  attribute ram_slice_begin of q1_reg : label is 0;
  attribute ram_slice_end of q1_reg : label is 17;
  attribute SOFT_HLUTNM of \q1_reg_i_4__4\ : label is "soft_lutpair15";
  attribute SOFT_HLUTNM of \q1_reg_i_5__4\ : label is "soft_lutpair16";
  attribute SOFT_HLUTNM of \q1_reg_i_6__4\ : label is "soft_lutpair16";
  attribute SOFT_HLUTNM of \q1_reg_i_7__4\ : label is "soft_lutpair17";
  attribute SOFT_HLUTNM of \q1_reg_i_9__4\ : label is "soft_lutpair15";
begin
q0_reg: unisim.vcomponents.RAMB18E2
    generic map(
      CASCADE_ORDER_A => "NONE",
      CASCADE_ORDER_B => "NONE",
      CLOCK_DOMAINS => "COMMON",
      DOA_REG => 1,
      DOB_REG => 1,
      ENADDRENA => "FALSE",
      ENADDRENB => "FALSE",
      INITP_00 => X"AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA",
      INITP_01 => X"000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEAAA",
      INITP_02 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_03 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_04 => X"55555555555555555555555555555400000000000000000000000000000000FF",
      INITP_05 => X"0000000000000000000000000000005555555555555555555555555555555555",
      INITP_06 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_07 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_00 => X"024301E5018F014200FC00BF008B005F003B0020000D0002000000060014002B",
      INIT_01 => X"0C910BAF0AD40A020938087607BC070B066205C10528049804100390031902AA",
      INIT_02 => X"1F091DA51C4A1AF619AA1867172B15F714CC13A8128D1179106E0F6A0E6F0D7C",
      INIT_03 => X"395C377E35A733D8321030502E972CE62B3D299B2801266F24E5236221E72074",
      INIT_04 => X"5B1E58CD5682543F52034FCD4D9F4B784958473F452D4323411F3F243D2F3B42",
      INIT_05 => X"83C181067E527BA478FC765B73C0712B6E9D6C166995671B64A8623B5FD55D76",
      INIT_06 => X"B29BAF82AC6FA961A65AA357A05B9D649A73978894A291C38EEA8C1689498682",
      INIT_07 => X"E6E8E37EE019DCB9D95DD607D2B5CF68CC20C8DDC59FC267BF33BC05B8DCB5B9",
      INIT_08 => X"1FCC1C20187714D311320D9509FB066602D5FF49FBC0F83CF4BBF140EDC9EA56",
      INIT_09 => X"5C5B587B549F50C44CED4919454741793DAE39E6362132602EA22AE72730237C",
      INIT_0A => X"9B97979493938F938B96879A83A17FA97BB477C073CF6FE06BF4680A6422603E",
      INIT_0B => X"DC76D861D44DD039CC26C814C402BFF2BBE3B7D5B3C8AFBCABB2A7A9A3A19F9B",
      INIT_0C => X"000000000000000000000000000000000000000000000000ECD0E8B9E4A2E08C",
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
      INIT_20 => X"301C2C0827F423DF1FC91BB3179C13850F6E0B56073E0326FF0EFAF6F6DFF2C7",
      INIT_21 => X"70C06CC168C064BD60B95CB358AB54A350984C8D4880447240633C523841342F",
      INIT_22 => X"AF8CABB2A7D5A3F6A0149C2F9847945E90718C838892849F80AA7CB278B974BD",
      INIT_23 => X"EB79E7D5E42CE080DCD1D91DD566D1ACCDEECA2DC669C2A1BED6BB08B737B363",
      INIT_24 => X"238D202E1CC9196015F2127F0F090B8D080E048A0101FD75F9E4F64FF2B7EF1A",
      INIT_25 => X"56DE53D150BE4DA64A884765443D410F3DDC3AA43766342430DD2D902A3F26E8",
      INIT_26 => X"849381E67F327C7879B776F1742471516E786B9A68B565CA62DA5FE35CE759E5",
      INIT_27 => X"ABEFA9ADA763A512A2BAA05C9DF79B8A9918969E941E91978F0A8C7689DC873B",
      INIT_28 => X"CC4DCA7EC8A8C6CAC4E5C2F9C105BF0ABD07BAFDB8ECB6D4B4B4B28EB060AE2B",
      INIT_29 => X"E525E3D2E277E114DFA9DE37DCBDDB3BD9B1D81FD686D4E5D33CD18CCFD4CE14",
      INIT_2A => X"F60EF53DF463F381F297F1A4F0AAEFA7EE9CED8AEC6FEB4CEA21E8EEE7B3E670",
      INIT_2B => X"FEC3FE77FE21FDC4FD5EFCEFFC79FBFAFB73FAE3FA4BF9ABF903F852F799F6D8",
      INIT_2C => X"000000000000000000000000000000000000000000000000FFA3FF78FF44FF08",
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
      WRITE_WIDTH_B => 18
    )
        port map (
      ADDRARDADDR(13 downto 12) => B"00",
      ADDRARDADDR(11) => \q0_reg_i_1__4_n_0\,
      ADDRARDADDR(10) => \q0_reg_i_2__4_n_0\,
      ADDRARDADDR(9) => \q0_reg_i_3__4_n_0\,
      ADDRARDADDR(8) => \q0_reg_i_4__4_n_0\,
      ADDRARDADDR(7) => \q0_reg_i_5__4_n_0\,
      ADDRARDADDR(6) => \q0_reg_i_6__4_n_0\,
      ADDRARDADDR(5) => \q0_reg_i_7__4_n_0\,
      ADDRARDADDR(4) => \q0_reg_i_8__4_n_0\,
      ADDRARDADDR(3 downto 0) => B"0000",
      ADDRBWRADDR(13 downto 12) => B"10",
      ADDRBWRADDR(11) => \q0_reg_i_1__4_n_0\,
      ADDRBWRADDR(10) => \q0_reg_i_2__4_n_0\,
      ADDRBWRADDR(9) => \q0_reg_i_3__4_n_0\,
      ADDRBWRADDR(8) => \q0_reg_i_4__4_n_0\,
      ADDRBWRADDR(7) => \q0_reg_i_5__4_n_0\,
      ADDRBWRADDR(6) => \q0_reg_i_6__4_n_0\,
      ADDRBWRADDR(5) => \q0_reg_i_7__4_n_0\,
      ADDRBWRADDR(4) => \q0_reg_i_8__4_n_0\,
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
      DINADIN(15 downto 0) => B"1111111111111111",
      DINBDIN(15 downto 0) => B"1111111111111111",
      DINPADINP(1 downto 0) => B"11",
      DINPBDINP(1 downto 0) => B"11",
      DOUTADOUT(15 downto 0) => hw_trig_vals_5_V(15 downto 0),
      DOUTBDOUT(15 downto 0) => hw_trig_vals_5_V(33 downto 18),
      DOUTPADOUTP(1 downto 0) => hw_trig_vals_5_V(17 downto 16),
      DOUTPBDOUTP(1 downto 0) => hw_trig_vals_5_V(35 downto 34),
      ENARDEN => ce1,
      ENBWREN => ce1,
      REGCEAREGCE => ap_enable_reg_pp0_iter3,
      REGCEB => ap_enable_reg_pp0_iter3,
      RSTRAMARSTRAM => '0',
      RSTRAMB => '0',
      RSTREGARSTREG => '0',
      RSTREGB => '0',
      SLEEP => '0',
      WEA(1 downto 0) => B"00",
      WEBWE(3 downto 0) => B"0000"
    );
\q0_reg_i_10__4\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"E0"
    )
        port map (
      I0 => add_ln1353_10_reg_1610(2),
      I1 => add_ln1353_10_reg_1610(1),
      I2 => add_ln1353_10_reg_1610(3),
      O => \q0_reg_i_10__4_n_0\
    );
\q0_reg_i_11__4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => add_ln1353_10_reg_1610(5),
      I1 => add_ln1353_10_reg_1610(4),
      O => \q0_reg_i_11__4_n_0\
    );
\q0_reg_i_12__4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFEFEFE"
    )
        port map (
      I0 => add_ln1353_10_reg_1610(5),
      I1 => add_ln1353_10_reg_1610(4),
      I2 => add_ln1353_10_reg_1610(6),
      I3 => add_ln1353_10_reg_1610(2),
      I4 => add_ln1353_10_reg_1610(3),
      O => \q0_reg_i_12__4_n_0\
    );
\q0_reg_i_13__4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"88888880"
    )
        port map (
      I0 => add_ln1353_10_reg_1610(1),
      I1 => add_ln1353_10_reg_1610(3),
      I2 => add_ln1353_2_reg_1534(1),
      I3 => add_ln1353_10_reg_1610(0),
      I4 => add_ln1353_2_reg_1534(0),
      O => \q0_reg_i_13__4_n_0\
    );
\q0_reg_i_1__4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7777777F88888880"
    )
        port map (
      I0 => add_ln1353_10_reg_1610(7),
      I1 => \q0_reg_i_9__4_n_0\,
      I2 => \q0_reg_i_10__4_n_0\,
      I3 => add_ln1353_10_reg_1610(6),
      I4 => \q0_reg_i_11__4_n_0\,
      I5 => add_ln1353_10_reg_1610(8),
      O => \q0_reg_i_1__4_n_0\
    );
\q0_reg_i_2__4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0001FFFFFFFE0000"
    )
        port map (
      I0 => add_ln1353_10_reg_1610(5),
      I1 => add_ln1353_10_reg_1610(4),
      I2 => add_ln1353_10_reg_1610(6),
      I3 => \q0_reg_i_10__4_n_0\,
      I4 => \q0_reg_i_9__4_n_0\,
      I5 => add_ln1353_10_reg_1610(7),
      O => \q0_reg_i_2__4_n_0\
    );
\q0_reg_i_3__4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"EEEAFFFF11150000"
    )
        port map (
      I0 => \q0_reg_i_11__4_n_0\,
      I1 => add_ln1353_10_reg_1610(3),
      I2 => add_ln1353_10_reg_1610(1),
      I3 => add_ln1353_10_reg_1610(2),
      I4 => \q0_reg_i_9__4_n_0\,
      I5 => add_ln1353_10_reg_1610(6),
      O => \q0_reg_i_3__4_n_0\
    );
\q0_reg_i_4__4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"A9A9A999AAAAAAAA"
    )
        port map (
      I0 => add_ln1353_10_reg_1610(5),
      I1 => add_ln1353_10_reg_1610(4),
      I2 => add_ln1353_10_reg_1610(3),
      I3 => add_ln1353_10_reg_1610(1),
      I4 => add_ln1353_10_reg_1610(2),
      I5 => \q0_reg_i_9__4_n_0\,
      O => \q0_reg_i_4__4_n_0\
    );
\q0_reg_i_5__4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"9995AAAA"
    )
        port map (
      I0 => add_ln1353_10_reg_1610(4),
      I1 => add_ln1353_10_reg_1610(3),
      I2 => add_ln1353_10_reg_1610(1),
      I3 => add_ln1353_10_reg_1610(2),
      I4 => \q0_reg_i_9__4_n_0\,
      O => \q0_reg_i_5__4_n_0\
    );
\q0_reg_i_6__4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"57A8"
    )
        port map (
      I0 => \q0_reg_i_9__4_n_0\,
      I1 => add_ln1353_10_reg_1610(1),
      I2 => add_ln1353_10_reg_1610(2),
      I3 => add_ln1353_10_reg_1610(3),
      O => \q0_reg_i_6__4_n_0\
    );
\q0_reg_i_7__4\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"9C"
    )
        port map (
      I0 => add_ln1353_10_reg_1610(1),
      I1 => add_ln1353_10_reg_1610(2),
      I2 => \q0_reg_i_9__4_n_0\,
      O => \q0_reg_i_7__4_n_0\
    );
\q0_reg_i_8__4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \q0_reg_i_9__4_n_0\,
      I1 => add_ln1353_10_reg_1610(1),
      O => \q0_reg_i_8__4_n_0\
    );
\q0_reg_i_9__4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFEEEEEEEEEEEEE"
    )
        port map (
      I0 => add_ln1353_10_reg_1610(10),
      I1 => add_ln1353_10_reg_1610(9),
      I2 => \q0_reg_i_12__4_n_0\,
      I3 => \q0_reg_i_13__4_n_0\,
      I4 => add_ln1353_10_reg_1610(7),
      I5 => add_ln1353_10_reg_1610(8),
      O => \q0_reg_i_9__4_n_0\
    );
q1_reg: unisim.vcomponents.RAMB18E2
    generic map(
      CASCADE_ORDER_A => "NONE",
      CASCADE_ORDER_B => "NONE",
      CLOCK_DOMAINS => "COMMON",
      DOA_REG => 1,
      DOB_REG => 1,
      ENADDRENA => "FALSE",
      ENADDRENB => "FALSE",
      INITP_00 => X"AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA",
      INITP_01 => X"000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEAAA",
      INITP_02 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_03 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_04 => X"55555555555555555555555555555400000000000000000000000000000000FF",
      INITP_05 => X"0000000000000000000000000000005555555555555555555555555555555555",
      INITP_06 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_07 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_00 => X"024301E5018F014200FC00BF008B005F003B0020000D0002000000060014002B",
      INIT_01 => X"0C910BAF0AD40A020938087607BC070B066205C10528049804100390031902AA",
      INIT_02 => X"1F091DA51C4A1AF619AA1867172B15F714CC13A8128D1179106E0F6A0E6F0D7C",
      INIT_03 => X"395C377E35A733D8321030502E972CE62B3D299B2801266F24E5236221E72074",
      INIT_04 => X"5B1E58CD5682543F52034FCD4D9F4B784958473F452D4323411F3F243D2F3B42",
      INIT_05 => X"83C181067E527BA478FC765B73C0712B6E9D6C166995671B64A8623B5FD55D76",
      INIT_06 => X"B29BAF82AC6FA961A65AA357A05B9D649A73978894A291C38EEA8C1689498682",
      INIT_07 => X"E6E8E37EE019DCB9D95DD607D2B5CF68CC20C8DDC59FC267BF33BC05B8DCB5B9",
      INIT_08 => X"1FCC1C20187714D311320D9509FB066602D5FF49FBC0F83CF4BBF140EDC9EA56",
      INIT_09 => X"5C5B587B549F50C44CED4919454741793DAE39E6362132602EA22AE72730237C",
      INIT_0A => X"9B97979493938F938B96879A83A17FA97BB477C073CF6FE06BF4680A6422603E",
      INIT_0B => X"DC76D861D44DD039CC26C814C402BFF2BBE3B7D5B3C8AFBCABB2A7A9A3A19F9B",
      INIT_0C => X"000000000000000000000000000000000000000000000000ECD0E8B9E4A2E08C",
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
      INIT_20 => X"301C2C0827F423DF1FC91BB3179C13850F6E0B56073E0326FF0EFAF6F6DFF2C7",
      INIT_21 => X"70C06CC168C064BD60B95CB358AB54A350984C8D4880447240633C523841342F",
      INIT_22 => X"AF8CABB2A7D5A3F6A0149C2F9847945E90718C838892849F80AA7CB278B974BD",
      INIT_23 => X"EB79E7D5E42CE080DCD1D91DD566D1ACCDEECA2DC669C2A1BED6BB08B737B363",
      INIT_24 => X"238D202E1CC9196015F2127F0F090B8D080E048A0101FD75F9E4F64FF2B7EF1A",
      INIT_25 => X"56DE53D150BE4DA64A884765443D410F3DDC3AA43766342430DD2D902A3F26E8",
      INIT_26 => X"849381E67F327C7879B776F1742471516E786B9A68B565CA62DA5FE35CE759E5",
      INIT_27 => X"ABEFA9ADA763A512A2BAA05C9DF79B8A9918969E941E91978F0A8C7689DC873B",
      INIT_28 => X"CC4DCA7EC8A8C6CAC4E5C2F9C105BF0ABD07BAFDB8ECB6D4B4B4B28EB060AE2B",
      INIT_29 => X"E525E3D2E277E114DFA9DE37DCBDDB3BD9B1D81FD686D4E5D33CD18CCFD4CE14",
      INIT_2A => X"F60EF53DF463F381F297F1A4F0AAEFA7EE9CED8AEC6FEB4CEA21E8EEE7B3E670",
      INIT_2B => X"FEC3FE77FE21FDC4FD5EFCEFFC79FBFAFB73FAE3FA4BF9ABF903F852F799F6D8",
      INIT_2C => X"000000000000000000000000000000000000000000000000FFA3FF78FF44FF08",
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
      WRITE_WIDTH_B => 18
    )
        port map (
      ADDRARDADDR(13 downto 12) => B"00",
      ADDRARDADDR(11) => \q1_reg_i_1__4_n_0\,
      ADDRARDADDR(10) => \q1_reg_i_2__4_n_0\,
      ADDRARDADDR(9) => \q1_reg_i_3__4_n_0\,
      ADDRARDADDR(8) => \q1_reg_i_4__4_n_0\,
      ADDRARDADDR(7) => \q1_reg_i_5__4_n_0\,
      ADDRARDADDR(6) => \q1_reg_i_6__4_n_0\,
      ADDRARDADDR(5) => \q1_reg_i_7__4_n_0\,
      ADDRARDADDR(4) => \q1_reg_i_8__4_n_0\,
      ADDRARDADDR(3 downto 0) => B"0000",
      ADDRBWRADDR(13 downto 12) => B"10",
      ADDRBWRADDR(11) => \q1_reg_i_1__4_n_0\,
      ADDRBWRADDR(10) => \q1_reg_i_2__4_n_0\,
      ADDRBWRADDR(9) => \q1_reg_i_3__4_n_0\,
      ADDRBWRADDR(8) => \q1_reg_i_4__4_n_0\,
      ADDRBWRADDR(7) => \q1_reg_i_5__4_n_0\,
      ADDRBWRADDR(6) => \q1_reg_i_6__4_n_0\,
      ADDRBWRADDR(5) => \q1_reg_i_7__4_n_0\,
      ADDRBWRADDR(4) => \q1_reg_i_8__4_n_0\,
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
      CASDOUTA(15 downto 0) => NLW_q1_reg_CASDOUTA_UNCONNECTED(15 downto 0),
      CASDOUTB(15 downto 0) => NLW_q1_reg_CASDOUTB_UNCONNECTED(15 downto 0),
      CASDOUTPA(1 downto 0) => NLW_q1_reg_CASDOUTPA_UNCONNECTED(1 downto 0),
      CASDOUTPB(1 downto 0) => NLW_q1_reg_CASDOUTPB_UNCONNECTED(1 downto 0),
      CASOREGIMUXA => '0',
      CASOREGIMUXB => '0',
      CASOREGIMUXEN_A => '1',
      CASOREGIMUXEN_B => '1',
      CLKARDCLK => ap_clk,
      CLKBWRCLK => ap_clk,
      DINADIN(15 downto 0) => B"1111111111111111",
      DINBDIN(15 downto 0) => B"1111111111111111",
      DINPADINP(1 downto 0) => B"11",
      DINPBDINP(1 downto 0) => B"11",
      DOUTADOUT(15 downto 0) => hw_trig_vals_13_V(15 downto 0),
      DOUTBDOUT(15 downto 0) => hw_trig_vals_13_V(33 downto 18),
      DOUTPADOUTP(1 downto 0) => hw_trig_vals_13_V(17 downto 16),
      DOUTPBDOUTP(1 downto 0) => hw_trig_vals_13_V(35 downto 34),
      ENARDEN => ce1,
      ENBWREN => ce1,
      REGCEAREGCE => ap_enable_reg_pp0_iter3,
      REGCEB => ap_enable_reg_pp0_iter3,
      RSTRAMARSTRAM => '0',
      RSTRAMB => '0',
      RSTREGARSTREG => '0',
      RSTREGB => '0',
      SLEEP => '0',
      WEA(1 downto 0) => B"00",
      WEBWE(3 downto 0) => B"0000"
    );
\q1_reg_i_1__4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"03FFAAAAFC00AAAA"
    )
        port map (
      I0 => tmp_11_reg_1627(7),
      I1 => add_ln1353_10_reg_1610(6),
      I2 => \q1_reg_i_9__4_n_0\,
      I3 => add_ln1353_10_reg_1610(7),
      I4 => icmp_ln895_13_reg_1622,
      I5 => add_ln1353_10_reg_1610(8),
      O => \q1_reg_i_1__4_n_0\
    );
\q1_reg_i_2__4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"03AAFCAA"
    )
        port map (
      I0 => tmp_11_reg_1627(6),
      I1 => \q1_reg_i_9__4_n_0\,
      I2 => add_ln1353_10_reg_1610(6),
      I3 => icmp_ln895_13_reg_1622,
      I4 => add_ln1353_10_reg_1610(7),
      O => \q1_reg_i_2__4_n_0\
    );
\q1_reg_i_3__4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFCAAAA0003AAAA"
    )
        port map (
      I0 => tmp_11_reg_1627(5),
      I1 => add_ln1353_10_reg_1610(4),
      I2 => add_ln1353_10_reg_1610(5),
      I3 => add_ln1353_10_reg_1610(3),
      I4 => icmp_ln895_13_reg_1622,
      I5 => add_ln1353_10_reg_1610(6),
      O => \q1_reg_i_3__4_n_0\
    );
\q1_reg_i_4__4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"F0C3AAAA"
    )
        port map (
      I0 => tmp_11_reg_1627(4),
      I1 => add_ln1353_10_reg_1610(4),
      I2 => add_ln1353_10_reg_1610(5),
      I3 => add_ln1353_10_reg_1610(3),
      I4 => icmp_ln895_13_reg_1622,
      O => \q1_reg_i_4__4_n_0\
    );
\q1_reg_i_5__4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"E22E"
    )
        port map (
      I0 => tmp_11_reg_1627(3),
      I1 => icmp_ln895_13_reg_1622,
      I2 => add_ln1353_10_reg_1610(3),
      I3 => add_ln1353_10_reg_1610(4),
      O => \q1_reg_i_5__4_n_0\
    );
\q1_reg_i_6__4\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"74"
    )
        port map (
      I0 => add_ln1353_10_reg_1610(3),
      I1 => icmp_ln895_13_reg_1622,
      I2 => tmp_11_reg_1627(2),
      O => \q1_reg_i_6__4_n_0\
    );
\q1_reg_i_7__4\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => add_ln1353_10_reg_1610(2),
      I1 => icmp_ln895_13_reg_1622,
      I2 => tmp_11_reg_1627(1),
      O => \q1_reg_i_7__4_n_0\
    );
\q1_reg_i_8__4\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => add_ln1353_10_reg_1610(1),
      I1 => icmp_ln895_13_reg_1622,
      I2 => tmp_11_reg_1627(0),
      O => \q1_reg_i_8__4_n_0\
    );
\q1_reg_i_9__4\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"FE"
    )
        port map (
      I0 => add_ln1353_10_reg_1610(4),
      I1 => add_ln1353_10_reg_1610(5),
      I2 => add_ln1353_10_reg_1610(3),
      O => \q1_reg_i_9__4_n_0\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity hls_get_trig_vals_get_trig_vals_luthbi_rom is
  port (
    hw_trig_vals_6_V : out STD_LOGIC_VECTOR ( 35 downto 0 );
    hw_trig_vals_14_V : out STD_LOGIC_VECTOR ( 35 downto 0 );
    ap_clk : in STD_LOGIC;
    ce1 : in STD_LOGIC;
    ap_enable_reg_pp0_iter3 : in STD_LOGIC;
    add_ln1353_12_reg_1632 : in STD_LOGIC_VECTOR ( 10 downto 0 );
    tmp_13_reg_1649 : in STD_LOGIC_VECTOR ( 7 downto 0 );
    icmp_ln895_14_reg_1644 : in STD_LOGIC;
    add_ln1353_4_reg_1556 : in STD_LOGIC_VECTOR ( 0 to 0 );
    add_ln1353_reg_1512 : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of hls_get_trig_vals_get_trig_vals_luthbi_rom : entity is "get_trig_vals_luthbi_rom";
end hls_get_trig_vals_get_trig_vals_luthbi_rom;

architecture STRUCTURE of hls_get_trig_vals_get_trig_vals_luthbi_rom is
  signal \q0_reg_i_10__5_n_0\ : STD_LOGIC;
  signal \q0_reg_i_11__5_n_0\ : STD_LOGIC;
  signal \q0_reg_i_12__5_n_0\ : STD_LOGIC;
  signal \q0_reg_i_13__5_n_0\ : STD_LOGIC;
  signal \q0_reg_i_1__5_n_0\ : STD_LOGIC;
  signal \q0_reg_i_2__5_n_0\ : STD_LOGIC;
  signal \q0_reg_i_3__5_n_0\ : STD_LOGIC;
  signal \q0_reg_i_4__5_n_0\ : STD_LOGIC;
  signal \q0_reg_i_5__5_n_0\ : STD_LOGIC;
  signal \q0_reg_i_6__5_n_0\ : STD_LOGIC;
  signal \q0_reg_i_7__5_n_0\ : STD_LOGIC;
  signal \q0_reg_i_8__5_n_0\ : STD_LOGIC;
  signal \q0_reg_i_9__5_n_0\ : STD_LOGIC;
  signal \q1_reg_i_1__5_n_0\ : STD_LOGIC;
  signal \q1_reg_i_2__5_n_0\ : STD_LOGIC;
  signal \q1_reg_i_3__5_n_0\ : STD_LOGIC;
  signal \q1_reg_i_4__5_n_0\ : STD_LOGIC;
  signal \q1_reg_i_5__5_n_0\ : STD_LOGIC;
  signal \q1_reg_i_6__5_n_0\ : STD_LOGIC;
  signal \q1_reg_i_7__5_n_0\ : STD_LOGIC;
  signal \q1_reg_i_8__5_n_0\ : STD_LOGIC;
  signal \q1_reg_i_9__5_n_0\ : STD_LOGIC;
  signal NLW_q0_reg_CASDOUTA_UNCONNECTED : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal NLW_q0_reg_CASDOUTB_UNCONNECTED : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal NLW_q0_reg_CASDOUTPA_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_q0_reg_CASDOUTPB_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_q1_reg_CASDOUTA_UNCONNECTED : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal NLW_q1_reg_CASDOUTB_UNCONNECTED : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal NLW_q1_reg_CASDOUTPA_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_q1_reg_CASDOUTPB_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute \MEM.PORTA.DATA_BIT_LAYOUT\ : string;
  attribute \MEM.PORTA.DATA_BIT_LAYOUT\ of q0_reg : label is "p2_d16";
  attribute \MEM.PORTB.DATA_BIT_LAYOUT\ : string;
  attribute \MEM.PORTB.DATA_BIT_LAYOUT\ of q0_reg : label is "p2_d16";
  attribute METHODOLOGY_DRC_VIOS : string;
  attribute METHODOLOGY_DRC_VIOS of q0_reg : label is "";
  attribute OPT_MODIFIED : string;
  attribute OPT_MODIFIED of q0_reg : label is "MLO";
  attribute RDADDR_COLLISION_HWCONFIG : string;
  attribute RDADDR_COLLISION_HWCONFIG of q0_reg : label is "DELAYED_WRITE";
  attribute RTL_RAM_BITS : integer;
  attribute RTL_RAM_BITS of q0_reg : label is 9216;
  attribute RTL_RAM_NAME : string;
  attribute RTL_RAM_NAME of q0_reg : label is "lut_tables_6_U/get_trig_vals_luthbi_rom_U/q0";
  attribute bram_addr_begin : integer;
  attribute bram_addr_begin of q0_reg : label is 0;
  attribute bram_addr_end : integer;
  attribute bram_addr_end of q0_reg : label is 255;
  attribute bram_slice_begin : integer;
  attribute bram_slice_begin of q0_reg : label is 0;
  attribute bram_slice_end : integer;
  attribute bram_slice_end of q0_reg : label is 17;
  attribute ram_addr_begin : integer;
  attribute ram_addr_begin of q0_reg : label is 0;
  attribute ram_addr_end : integer;
  attribute ram_addr_end of q0_reg : label is 255;
  attribute ram_ext_slice_begin : integer;
  attribute ram_ext_slice_begin of q0_reg : label is 18;
  attribute ram_ext_slice_end : integer;
  attribute ram_ext_slice_end of q0_reg : label is 35;
  attribute ram_offset : integer;
  attribute ram_offset of q0_reg : label is 0;
  attribute ram_slice_begin : integer;
  attribute ram_slice_begin of q0_reg : label is 0;
  attribute ram_slice_end : integer;
  attribute ram_slice_end of q0_reg : label is 17;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \q0_reg_i_10__5\ : label is "soft_lutpair20";
  attribute \MEM.PORTA.DATA_BIT_LAYOUT\ of q1_reg : label is "p2_d16";
  attribute \MEM.PORTB.DATA_BIT_LAYOUT\ of q1_reg : label is "p2_d16";
  attribute METHODOLOGY_DRC_VIOS of q1_reg : label is "";
  attribute OPT_MODIFIED of q1_reg : label is "MLO";
  attribute RDADDR_COLLISION_HWCONFIG of q1_reg : label is "DELAYED_WRITE";
  attribute RTL_RAM_BITS of q1_reg : label is 9216;
  attribute RTL_RAM_NAME of q1_reg : label is "lut_tables_6_U/get_trig_vals_luthbi_rom_U/q1";
  attribute bram_addr_begin of q1_reg : label is 0;
  attribute bram_addr_end of q1_reg : label is 255;
  attribute bram_slice_begin of q1_reg : label is 0;
  attribute bram_slice_end of q1_reg : label is 17;
  attribute ram_addr_begin of q1_reg : label is 0;
  attribute ram_addr_end of q1_reg : label is 255;
  attribute ram_ext_slice_begin of q1_reg : label is 18;
  attribute ram_ext_slice_end of q1_reg : label is 35;
  attribute ram_offset of q1_reg : label is 0;
  attribute ram_slice_begin of q1_reg : label is 0;
  attribute ram_slice_end of q1_reg : label is 17;
  attribute SOFT_HLUTNM of \q1_reg_i_4__5\ : label is "soft_lutpair18";
  attribute SOFT_HLUTNM of \q1_reg_i_5__5\ : label is "soft_lutpair19";
  attribute SOFT_HLUTNM of \q1_reg_i_6__5\ : label is "soft_lutpair19";
  attribute SOFT_HLUTNM of \q1_reg_i_7__5\ : label is "soft_lutpair20";
  attribute SOFT_HLUTNM of \q1_reg_i_9__5\ : label is "soft_lutpair18";
begin
q0_reg: unisim.vcomponents.RAMB18E2
    generic map(
      CASCADE_ORDER_A => "NONE",
      CASCADE_ORDER_B => "NONE",
      CLOCK_DOMAINS => "COMMON",
      DOA_REG => 1,
      DOB_REG => 1,
      ENADDRENA => "FALSE",
      ENADDRENB => "FALSE",
      INITP_00 => X"AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA",
      INITP_01 => X"000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEAAA",
      INITP_02 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_03 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_04 => X"55555555555555555555555555555400000000000000000000000000000000FF",
      INITP_05 => X"0000000000000000000000000000005555555555555555555555555555555555",
      INITP_06 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_07 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_00 => X"025001F1019A014B010500C700910064003F0023000F00030000000500120028",
      INIT_01 => X"0CAE0BCA0AEF0A1C0950088E07D30720067605D4053B04AA042103A0032802B8",
      INIT_02 => X"1F361DD11C751B2019D4188F1752161D14F113CC12B0119B108F0F8A0E8E0D9A",
      INIT_03 => X"399937B935E23411324930882ECE2D1C2B7229CF283426A125152392221620A2",
      INIT_04 => X"5B69591756CB5487524A50134DE44BBC499B4781456F4363415F3F633D6D3B7F",
      INIT_05 => X"8419815D7EA87BF9795176AF7413717E6EEF6C6769E5676A64F6628960225DC2",
      INIT_06 => X"B2FEAFE5ACD1A9C3A6BAA3B7A0BA9DC29AD197E594FF921F8F448C7089A286DA",
      INIT_07 => X"E755E3EBE085DD24D9C8D671D31FCFD1CC89C945C607C2CEBF9ABC6BB941B61D",
      INIT_08 => X"20421C9518EC154711A50E080A6E06D90347FFBAFC31F8ACF52BF1AFEE37EAC4",
      INIT_09 => X"5CD758F7551A51404D68499345C141F33E273A5F369A32D82F192B5E27A723F3",
      INIT_0A => X"9C179814941390138C16881A842080287C32783F744D705E6C716887649F60BA",
      INIT_0B => X"DCF9D8E4D4CFD0BBCCA8C896C484C074BC65B856B449B03DAC33A82AA422A01C",
      INIT_0C => X"000000000000000000000000000000000000000000000000ED53E93CE525E10F",
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
      INIT_20 => X"309F2C8B28772462204C1C36181F14080FF10BD907C103A9FF91FB79F762F34A",
      INIT_21 => X"71406D416940653D61395D34592C5524511A4D0E490144F440E53CD538C334B1",
      INIT_22 => X"B007AC2DA851A472A0909CAC98C594DB90EF8D018910851D81287D317938753D",
      INIT_23 => X"EBEDE849E4A2E0F6DD47D994D5DED224CE66CAA5C6E1C31ABF50BB82B7B1B3DD",
      INIT_24 => X"23F9209A1D3619CD166012EE0F780BFD087E04FA0172FDE7FA56F6C2F32AEF8E",
      INIT_25 => X"573F543351214E094AEC47CA44A241753E433B0B37CE348D31462DFA2AA92754",
      INIT_26 => X"84E9823C7F897CCF7A10774A747E71AC6ED46BF669126628633860425D475A46",
      INIT_27 => X"AC37A9F5A7ACA55CA306A0A89E449BD8996696EE946E91E88F5C8CC98A2F878F",
      INIT_28 => X"CC86CAB9C8E3C707C522C337C144BF4ABD48BB3FB92FB717B4F9B2D3B0A6AE72",
      INIT_29 => X"E54EE3FCE2A3E141DFD7DE66DCECDB6BD9E2D852D6B9D519D372D1C2D00BCE4C",
      INIT_2A => X"F628F557F47EF39DF2B4F1C3F0C9EFC8EEBEEDACEC92EB70EA46E914E7DAE698",
      INIT_2B => X"FECCFE81FE2CFDD0FD6BFCFEFC88FC0AFB84FAF5FA5FF9BFF918F868F7B0F6F0",
      INIT_2C => X"000000000000000000000000000000000000000000000000FFA8FF7EFF4BFF10",
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
      WRITE_WIDTH_B => 18
    )
        port map (
      ADDRARDADDR(13 downto 12) => B"00",
      ADDRARDADDR(11) => \q0_reg_i_1__5_n_0\,
      ADDRARDADDR(10) => \q0_reg_i_2__5_n_0\,
      ADDRARDADDR(9) => \q0_reg_i_3__5_n_0\,
      ADDRARDADDR(8) => \q0_reg_i_4__5_n_0\,
      ADDRARDADDR(7) => \q0_reg_i_5__5_n_0\,
      ADDRARDADDR(6) => \q0_reg_i_6__5_n_0\,
      ADDRARDADDR(5) => \q0_reg_i_7__5_n_0\,
      ADDRARDADDR(4) => \q0_reg_i_8__5_n_0\,
      ADDRARDADDR(3 downto 0) => B"0000",
      ADDRBWRADDR(13 downto 12) => B"10",
      ADDRBWRADDR(11) => \q0_reg_i_1__5_n_0\,
      ADDRBWRADDR(10) => \q0_reg_i_2__5_n_0\,
      ADDRBWRADDR(9) => \q0_reg_i_3__5_n_0\,
      ADDRBWRADDR(8) => \q0_reg_i_4__5_n_0\,
      ADDRBWRADDR(7) => \q0_reg_i_5__5_n_0\,
      ADDRBWRADDR(6) => \q0_reg_i_6__5_n_0\,
      ADDRBWRADDR(5) => \q0_reg_i_7__5_n_0\,
      ADDRBWRADDR(4) => \q0_reg_i_8__5_n_0\,
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
      DINADIN(15 downto 0) => B"1111111111111111",
      DINBDIN(15 downto 0) => B"1111111111111111",
      DINPADINP(1 downto 0) => B"11",
      DINPBDINP(1 downto 0) => B"11",
      DOUTADOUT(15 downto 0) => hw_trig_vals_6_V(15 downto 0),
      DOUTBDOUT(15 downto 0) => hw_trig_vals_6_V(33 downto 18),
      DOUTPADOUTP(1 downto 0) => hw_trig_vals_6_V(17 downto 16),
      DOUTPBDOUTP(1 downto 0) => hw_trig_vals_6_V(35 downto 34),
      ENARDEN => ce1,
      ENBWREN => ce1,
      REGCEAREGCE => ap_enable_reg_pp0_iter3,
      REGCEB => ap_enable_reg_pp0_iter3,
      RSTRAMARSTRAM => '0',
      RSTRAMB => '0',
      RSTREGARSTREG => '0',
      RSTREGB => '0',
      SLEEP => '0',
      WEA(1 downto 0) => B"00",
      WEBWE(3 downto 0) => B"0000"
    );
\q0_reg_i_10__5\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"E0"
    )
        port map (
      I0 => add_ln1353_12_reg_1632(2),
      I1 => add_ln1353_12_reg_1632(1),
      I2 => add_ln1353_12_reg_1632(3),
      O => \q0_reg_i_10__5_n_0\
    );
\q0_reg_i_11__5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => add_ln1353_12_reg_1632(5),
      I1 => add_ln1353_12_reg_1632(4),
      O => \q0_reg_i_11__5_n_0\
    );
\q0_reg_i_12__5\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFEFEFE"
    )
        port map (
      I0 => add_ln1353_12_reg_1632(5),
      I1 => add_ln1353_12_reg_1632(4),
      I2 => add_ln1353_12_reg_1632(6),
      I3 => add_ln1353_12_reg_1632(2),
      I4 => add_ln1353_12_reg_1632(3),
      O => \q0_reg_i_12__5_n_0\
    );
\q0_reg_i_13__5\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"88888880"
    )
        port map (
      I0 => add_ln1353_12_reg_1632(1),
      I1 => add_ln1353_12_reg_1632(3),
      I2 => add_ln1353_4_reg_1556(0),
      I3 => add_ln1353_12_reg_1632(0),
      I4 => add_ln1353_reg_1512(0),
      O => \q0_reg_i_13__5_n_0\
    );
\q0_reg_i_1__5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7777777F88888880"
    )
        port map (
      I0 => add_ln1353_12_reg_1632(7),
      I1 => \q0_reg_i_9__5_n_0\,
      I2 => \q0_reg_i_10__5_n_0\,
      I3 => add_ln1353_12_reg_1632(6),
      I4 => \q0_reg_i_11__5_n_0\,
      I5 => add_ln1353_12_reg_1632(8),
      O => \q0_reg_i_1__5_n_0\
    );
\q0_reg_i_2__5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0001FFFFFFFE0000"
    )
        port map (
      I0 => add_ln1353_12_reg_1632(5),
      I1 => add_ln1353_12_reg_1632(4),
      I2 => add_ln1353_12_reg_1632(6),
      I3 => \q0_reg_i_10__5_n_0\,
      I4 => \q0_reg_i_9__5_n_0\,
      I5 => add_ln1353_12_reg_1632(7),
      O => \q0_reg_i_2__5_n_0\
    );
\q0_reg_i_3__5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"EEEAFFFF11150000"
    )
        port map (
      I0 => \q0_reg_i_11__5_n_0\,
      I1 => add_ln1353_12_reg_1632(3),
      I2 => add_ln1353_12_reg_1632(1),
      I3 => add_ln1353_12_reg_1632(2),
      I4 => \q0_reg_i_9__5_n_0\,
      I5 => add_ln1353_12_reg_1632(6),
      O => \q0_reg_i_3__5_n_0\
    );
\q0_reg_i_4__5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"A9A9A999AAAAAAAA"
    )
        port map (
      I0 => add_ln1353_12_reg_1632(5),
      I1 => add_ln1353_12_reg_1632(4),
      I2 => add_ln1353_12_reg_1632(3),
      I3 => add_ln1353_12_reg_1632(1),
      I4 => add_ln1353_12_reg_1632(2),
      I5 => \q0_reg_i_9__5_n_0\,
      O => \q0_reg_i_4__5_n_0\
    );
\q0_reg_i_5__5\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"9995AAAA"
    )
        port map (
      I0 => add_ln1353_12_reg_1632(4),
      I1 => add_ln1353_12_reg_1632(3),
      I2 => add_ln1353_12_reg_1632(1),
      I3 => add_ln1353_12_reg_1632(2),
      I4 => \q0_reg_i_9__5_n_0\,
      O => \q0_reg_i_5__5_n_0\
    );
\q0_reg_i_6__5\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"57A8"
    )
        port map (
      I0 => \q0_reg_i_9__5_n_0\,
      I1 => add_ln1353_12_reg_1632(1),
      I2 => add_ln1353_12_reg_1632(2),
      I3 => add_ln1353_12_reg_1632(3),
      O => \q0_reg_i_6__5_n_0\
    );
\q0_reg_i_7__5\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"9C"
    )
        port map (
      I0 => add_ln1353_12_reg_1632(1),
      I1 => add_ln1353_12_reg_1632(2),
      I2 => \q0_reg_i_9__5_n_0\,
      O => \q0_reg_i_7__5_n_0\
    );
\q0_reg_i_8__5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \q0_reg_i_9__5_n_0\,
      I1 => add_ln1353_12_reg_1632(1),
      O => \q0_reg_i_8__5_n_0\
    );
\q0_reg_i_9__5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFEEEEEEEEEEEEE"
    )
        port map (
      I0 => add_ln1353_12_reg_1632(10),
      I1 => add_ln1353_12_reg_1632(9),
      I2 => \q0_reg_i_12__5_n_0\,
      I3 => \q0_reg_i_13__5_n_0\,
      I4 => add_ln1353_12_reg_1632(7),
      I5 => add_ln1353_12_reg_1632(8),
      O => \q0_reg_i_9__5_n_0\
    );
q1_reg: unisim.vcomponents.RAMB18E2
    generic map(
      CASCADE_ORDER_A => "NONE",
      CASCADE_ORDER_B => "NONE",
      CLOCK_DOMAINS => "COMMON",
      DOA_REG => 1,
      DOB_REG => 1,
      ENADDRENA => "FALSE",
      ENADDRENB => "FALSE",
      INITP_00 => X"AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA",
      INITP_01 => X"000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEAAA",
      INITP_02 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_03 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_04 => X"55555555555555555555555555555400000000000000000000000000000000FF",
      INITP_05 => X"0000000000000000000000000000005555555555555555555555555555555555",
      INITP_06 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_07 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_00 => X"025001F1019A014B010500C700910064003F0023000F00030000000500120028",
      INIT_01 => X"0CAE0BCA0AEF0A1C0950088E07D30720067605D4053B04AA042103A0032802B8",
      INIT_02 => X"1F361DD11C751B2019D4188F1752161D14F113CC12B0119B108F0F8A0E8E0D9A",
      INIT_03 => X"399937B935E23411324930882ECE2D1C2B7229CF283426A125152392221620A2",
      INIT_04 => X"5B69591756CB5487524A50134DE44BBC499B4781456F4363415F3F633D6D3B7F",
      INIT_05 => X"8419815D7EA87BF9795176AF7413717E6EEF6C6769E5676A64F6628960225DC2",
      INIT_06 => X"B2FEAFE5ACD1A9C3A6BAA3B7A0BA9DC29AD197E594FF921F8F448C7089A286DA",
      INIT_07 => X"E755E3EBE085DD24D9C8D671D31FCFD1CC89C945C607C2CEBF9ABC6BB941B61D",
      INIT_08 => X"20421C9518EC154711A50E080A6E06D90347FFBAFC31F8ACF52BF1AFEE37EAC4",
      INIT_09 => X"5CD758F7551A51404D68499345C141F33E273A5F369A32D82F192B5E27A723F3",
      INIT_0A => X"9C179814941390138C16881A842080287C32783F744D705E6C716887649F60BA",
      INIT_0B => X"DCF9D8E4D4CFD0BBCCA8C896C484C074BC65B856B449B03DAC33A82AA422A01C",
      INIT_0C => X"000000000000000000000000000000000000000000000000ED53E93CE525E10F",
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
      INIT_20 => X"309F2C8B28772462204C1C36181F14080FF10BD907C103A9FF91FB79F762F34A",
      INIT_21 => X"71406D416940653D61395D34592C5524511A4D0E490144F440E53CD538C334B1",
      INIT_22 => X"B007AC2DA851A472A0909CAC98C594DB90EF8D018910851D81287D317938753D",
      INIT_23 => X"EBEDE849E4A2E0F6DD47D994D5DED224CE66CAA5C6E1C31ABF50BB82B7B1B3DD",
      INIT_24 => X"23F9209A1D3619CD166012EE0F780BFD087E04FA0172FDE7FA56F6C2F32AEF8E",
      INIT_25 => X"573F543351214E094AEC47CA44A241753E433B0B37CE348D31462DFA2AA92754",
      INIT_26 => X"84E9823C7F897CCF7A10774A747E71AC6ED46BF669126628633860425D475A46",
      INIT_27 => X"AC37A9F5A7ACA55CA306A0A89E449BD8996696EE946E91E88F5C8CC98A2F878F",
      INIT_28 => X"CC86CAB9C8E3C707C522C337C144BF4ABD48BB3FB92FB717B4F9B2D3B0A6AE72",
      INIT_29 => X"E54EE3FCE2A3E141DFD7DE66DCECDB6BD9E2D852D6B9D519D372D1C2D00BCE4C",
      INIT_2A => X"F628F557F47EF39DF2B4F1C3F0C9EFC8EEBEEDACEC92EB70EA46E914E7DAE698",
      INIT_2B => X"FECCFE81FE2CFDD0FD6BFCFEFC88FC0AFB84FAF5FA5FF9BFF918F868F7B0F6F0",
      INIT_2C => X"000000000000000000000000000000000000000000000000FFA8FF7EFF4BFF10",
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
      WRITE_WIDTH_B => 18
    )
        port map (
      ADDRARDADDR(13 downto 12) => B"00",
      ADDRARDADDR(11) => \q1_reg_i_1__5_n_0\,
      ADDRARDADDR(10) => \q1_reg_i_2__5_n_0\,
      ADDRARDADDR(9) => \q1_reg_i_3__5_n_0\,
      ADDRARDADDR(8) => \q1_reg_i_4__5_n_0\,
      ADDRARDADDR(7) => \q1_reg_i_5__5_n_0\,
      ADDRARDADDR(6) => \q1_reg_i_6__5_n_0\,
      ADDRARDADDR(5) => \q1_reg_i_7__5_n_0\,
      ADDRARDADDR(4) => \q1_reg_i_8__5_n_0\,
      ADDRARDADDR(3 downto 0) => B"0000",
      ADDRBWRADDR(13 downto 12) => B"10",
      ADDRBWRADDR(11) => \q1_reg_i_1__5_n_0\,
      ADDRBWRADDR(10) => \q1_reg_i_2__5_n_0\,
      ADDRBWRADDR(9) => \q1_reg_i_3__5_n_0\,
      ADDRBWRADDR(8) => \q1_reg_i_4__5_n_0\,
      ADDRBWRADDR(7) => \q1_reg_i_5__5_n_0\,
      ADDRBWRADDR(6) => \q1_reg_i_6__5_n_0\,
      ADDRBWRADDR(5) => \q1_reg_i_7__5_n_0\,
      ADDRBWRADDR(4) => \q1_reg_i_8__5_n_0\,
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
      CASDOUTA(15 downto 0) => NLW_q1_reg_CASDOUTA_UNCONNECTED(15 downto 0),
      CASDOUTB(15 downto 0) => NLW_q1_reg_CASDOUTB_UNCONNECTED(15 downto 0),
      CASDOUTPA(1 downto 0) => NLW_q1_reg_CASDOUTPA_UNCONNECTED(1 downto 0),
      CASDOUTPB(1 downto 0) => NLW_q1_reg_CASDOUTPB_UNCONNECTED(1 downto 0),
      CASOREGIMUXA => '0',
      CASOREGIMUXB => '0',
      CASOREGIMUXEN_A => '1',
      CASOREGIMUXEN_B => '1',
      CLKARDCLK => ap_clk,
      CLKBWRCLK => ap_clk,
      DINADIN(15 downto 0) => B"1111111111111111",
      DINBDIN(15 downto 0) => B"1111111111111111",
      DINPADINP(1 downto 0) => B"11",
      DINPBDINP(1 downto 0) => B"11",
      DOUTADOUT(15 downto 0) => hw_trig_vals_14_V(15 downto 0),
      DOUTBDOUT(15 downto 0) => hw_trig_vals_14_V(33 downto 18),
      DOUTPADOUTP(1 downto 0) => hw_trig_vals_14_V(17 downto 16),
      DOUTPBDOUTP(1 downto 0) => hw_trig_vals_14_V(35 downto 34),
      ENARDEN => ce1,
      ENBWREN => ce1,
      REGCEAREGCE => ap_enable_reg_pp0_iter3,
      REGCEB => ap_enable_reg_pp0_iter3,
      RSTRAMARSTRAM => '0',
      RSTRAMB => '0',
      RSTREGARSTREG => '0',
      RSTREGB => '0',
      SLEEP => '0',
      WEA(1 downto 0) => B"00",
      WEBWE(3 downto 0) => B"0000"
    );
\q1_reg_i_1__5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"03FFAAAAFC00AAAA"
    )
        port map (
      I0 => tmp_13_reg_1649(7),
      I1 => add_ln1353_12_reg_1632(6),
      I2 => \q1_reg_i_9__5_n_0\,
      I3 => add_ln1353_12_reg_1632(7),
      I4 => icmp_ln895_14_reg_1644,
      I5 => add_ln1353_12_reg_1632(8),
      O => \q1_reg_i_1__5_n_0\
    );
\q1_reg_i_2__5\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"03AAFCAA"
    )
        port map (
      I0 => tmp_13_reg_1649(6),
      I1 => \q1_reg_i_9__5_n_0\,
      I2 => add_ln1353_12_reg_1632(6),
      I3 => icmp_ln895_14_reg_1644,
      I4 => add_ln1353_12_reg_1632(7),
      O => \q1_reg_i_2__5_n_0\
    );
\q1_reg_i_3__5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFCAAAA0003AAAA"
    )
        port map (
      I0 => tmp_13_reg_1649(5),
      I1 => add_ln1353_12_reg_1632(4),
      I2 => add_ln1353_12_reg_1632(5),
      I3 => add_ln1353_12_reg_1632(3),
      I4 => icmp_ln895_14_reg_1644,
      I5 => add_ln1353_12_reg_1632(6),
      O => \q1_reg_i_3__5_n_0\
    );
\q1_reg_i_4__5\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"F0C3AAAA"
    )
        port map (
      I0 => tmp_13_reg_1649(4),
      I1 => add_ln1353_12_reg_1632(4),
      I2 => add_ln1353_12_reg_1632(5),
      I3 => add_ln1353_12_reg_1632(3),
      I4 => icmp_ln895_14_reg_1644,
      O => \q1_reg_i_4__5_n_0\
    );
\q1_reg_i_5__5\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"E22E"
    )
        port map (
      I0 => tmp_13_reg_1649(3),
      I1 => icmp_ln895_14_reg_1644,
      I2 => add_ln1353_12_reg_1632(3),
      I3 => add_ln1353_12_reg_1632(4),
      O => \q1_reg_i_5__5_n_0\
    );
\q1_reg_i_6__5\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"74"
    )
        port map (
      I0 => add_ln1353_12_reg_1632(3),
      I1 => icmp_ln895_14_reg_1644,
      I2 => tmp_13_reg_1649(2),
      O => \q1_reg_i_6__5_n_0\
    );
\q1_reg_i_7__5\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => add_ln1353_12_reg_1632(2),
      I1 => icmp_ln895_14_reg_1644,
      I2 => tmp_13_reg_1649(1),
      O => \q1_reg_i_7__5_n_0\
    );
\q1_reg_i_8__5\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => add_ln1353_12_reg_1632(1),
      I1 => icmp_ln895_14_reg_1644,
      I2 => tmp_13_reg_1649(0),
      O => \q1_reg_i_8__5_n_0\
    );
\q1_reg_i_9__5\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"FE"
    )
        port map (
      I0 => add_ln1353_12_reg_1632(4),
      I1 => add_ln1353_12_reg_1632(5),
      I2 => add_ln1353_12_reg_1632(3),
      O => \q1_reg_i_9__5_n_0\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity hls_get_trig_vals_get_trig_vals_lutibs_rom is
  port (
    hw_trig_vals_7_V : out STD_LOGIC_VECTOR ( 35 downto 0 );
    hw_trig_vals_15_V : out STD_LOGIC_VECTOR ( 35 downto 0 );
    ap_clk : in STD_LOGIC;
    ce1 : in STD_LOGIC;
    ap_enable_reg_pp0_iter3 : in STD_LOGIC;
    add_ln1353_14_reg_1654 : in STD_LOGIC_VECTOR ( 10 downto 0 );
    tmp_15_reg_1671 : in STD_LOGIC_VECTOR ( 7 downto 0 );
    icmp_ln895_15_reg_1666 : in STD_LOGIC;
    add_ln1353_6_reg_1578 : in STD_LOGIC_VECTOR ( 0 to 0 );
    add_ln1353_2_reg_1534 : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of hls_get_trig_vals_get_trig_vals_lutibs_rom : entity is "get_trig_vals_lutibs_rom";
end hls_get_trig_vals_get_trig_vals_lutibs_rom;

architecture STRUCTURE of hls_get_trig_vals_get_trig_vals_lutibs_rom is
  signal \q0_reg_i_10__6_n_0\ : STD_LOGIC;
  signal \q0_reg_i_11__6_n_0\ : STD_LOGIC;
  signal \q0_reg_i_12__6_n_0\ : STD_LOGIC;
  signal \q0_reg_i_13__6_n_0\ : STD_LOGIC;
  signal \q0_reg_i_1__6_n_0\ : STD_LOGIC;
  signal \q0_reg_i_2__6_n_0\ : STD_LOGIC;
  signal \q0_reg_i_3__6_n_0\ : STD_LOGIC;
  signal \q0_reg_i_4__6_n_0\ : STD_LOGIC;
  signal \q0_reg_i_5__6_n_0\ : STD_LOGIC;
  signal \q0_reg_i_6__6_n_0\ : STD_LOGIC;
  signal \q0_reg_i_7__6_n_0\ : STD_LOGIC;
  signal \q0_reg_i_8__6_n_0\ : STD_LOGIC;
  signal \q0_reg_i_9__6_n_0\ : STD_LOGIC;
  signal \q1_reg_i_1__6_n_0\ : STD_LOGIC;
  signal \q1_reg_i_2__6_n_0\ : STD_LOGIC;
  signal \q1_reg_i_3__6_n_0\ : STD_LOGIC;
  signal \q1_reg_i_4__6_n_0\ : STD_LOGIC;
  signal \q1_reg_i_5__6_n_0\ : STD_LOGIC;
  signal \q1_reg_i_6__6_n_0\ : STD_LOGIC;
  signal \q1_reg_i_7__6_n_0\ : STD_LOGIC;
  signal \q1_reg_i_8__6_n_0\ : STD_LOGIC;
  signal \q1_reg_i_9__6_n_0\ : STD_LOGIC;
  signal NLW_q0_reg_CASDOUTA_UNCONNECTED : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal NLW_q0_reg_CASDOUTB_UNCONNECTED : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal NLW_q0_reg_CASDOUTPA_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_q0_reg_CASDOUTPB_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_q1_reg_CASDOUTA_UNCONNECTED : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal NLW_q1_reg_CASDOUTB_UNCONNECTED : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal NLW_q1_reg_CASDOUTPA_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_q1_reg_CASDOUTPB_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute \MEM.PORTA.DATA_BIT_LAYOUT\ : string;
  attribute \MEM.PORTA.DATA_BIT_LAYOUT\ of q0_reg : label is "p2_d16";
  attribute \MEM.PORTB.DATA_BIT_LAYOUT\ : string;
  attribute \MEM.PORTB.DATA_BIT_LAYOUT\ of q0_reg : label is "p2_d16";
  attribute METHODOLOGY_DRC_VIOS : string;
  attribute METHODOLOGY_DRC_VIOS of q0_reg : label is "";
  attribute OPT_MODIFIED : string;
  attribute OPT_MODIFIED of q0_reg : label is "MLO";
  attribute RDADDR_COLLISION_HWCONFIG : string;
  attribute RDADDR_COLLISION_HWCONFIG of q0_reg : label is "DELAYED_WRITE";
  attribute RTL_RAM_BITS : integer;
  attribute RTL_RAM_BITS of q0_reg : label is 9216;
  attribute RTL_RAM_NAME : string;
  attribute RTL_RAM_NAME of q0_reg : label is "lut_tables_7_U/get_trig_vals_lutibs_rom_U/q0";
  attribute bram_addr_begin : integer;
  attribute bram_addr_begin of q0_reg : label is 0;
  attribute bram_addr_end : integer;
  attribute bram_addr_end of q0_reg : label is 255;
  attribute bram_slice_begin : integer;
  attribute bram_slice_begin of q0_reg : label is 0;
  attribute bram_slice_end : integer;
  attribute bram_slice_end of q0_reg : label is 17;
  attribute ram_addr_begin : integer;
  attribute ram_addr_begin of q0_reg : label is 0;
  attribute ram_addr_end : integer;
  attribute ram_addr_end of q0_reg : label is 255;
  attribute ram_ext_slice_begin : integer;
  attribute ram_ext_slice_begin of q0_reg : label is 18;
  attribute ram_ext_slice_end : integer;
  attribute ram_ext_slice_end of q0_reg : label is 35;
  attribute ram_offset : integer;
  attribute ram_offset of q0_reg : label is 0;
  attribute ram_slice_begin : integer;
  attribute ram_slice_begin of q0_reg : label is 0;
  attribute ram_slice_end : integer;
  attribute ram_slice_end of q0_reg : label is 17;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \q0_reg_i_10__6\ : label is "soft_lutpair23";
  attribute \MEM.PORTA.DATA_BIT_LAYOUT\ of q1_reg : label is "p2_d16";
  attribute \MEM.PORTB.DATA_BIT_LAYOUT\ of q1_reg : label is "p2_d16";
  attribute METHODOLOGY_DRC_VIOS of q1_reg : label is "";
  attribute OPT_MODIFIED of q1_reg : label is "MLO";
  attribute RDADDR_COLLISION_HWCONFIG of q1_reg : label is "DELAYED_WRITE";
  attribute RTL_RAM_BITS of q1_reg : label is 9216;
  attribute RTL_RAM_NAME of q1_reg : label is "lut_tables_7_U/get_trig_vals_lutibs_rom_U/q1";
  attribute bram_addr_begin of q1_reg : label is 0;
  attribute bram_addr_end of q1_reg : label is 255;
  attribute bram_slice_begin of q1_reg : label is 0;
  attribute bram_slice_end of q1_reg : label is 17;
  attribute ram_addr_begin of q1_reg : label is 0;
  attribute ram_addr_end of q1_reg : label is 255;
  attribute ram_ext_slice_begin of q1_reg : label is 18;
  attribute ram_ext_slice_end of q1_reg : label is 35;
  attribute ram_offset of q1_reg : label is 0;
  attribute ram_slice_begin of q1_reg : label is 0;
  attribute ram_slice_end of q1_reg : label is 17;
  attribute SOFT_HLUTNM of \q1_reg_i_4__6\ : label is "soft_lutpair21";
  attribute SOFT_HLUTNM of \q1_reg_i_5__6\ : label is "soft_lutpair22";
  attribute SOFT_HLUTNM of \q1_reg_i_6__6\ : label is "soft_lutpair22";
  attribute SOFT_HLUTNM of \q1_reg_i_7__6\ : label is "soft_lutpair23";
  attribute SOFT_HLUTNM of \q1_reg_i_9__6\ : label is "soft_lutpair21";
begin
q0_reg: unisim.vcomponents.RAMB18E2
    generic map(
      CASCADE_ORDER_A => "NONE",
      CASCADE_ORDER_B => "NONE",
      CLOCK_DOMAINS => "COMMON",
      DOA_REG => 1,
      DOB_REG => 1,
      ENADDRENA => "FALSE",
      ENADDRENB => "FALSE",
      INITP_00 => X"AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA",
      INITP_01 => X"000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAAA",
      INITP_02 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_03 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_04 => X"555555555555555555555555555554000000000000000000000000000000003F",
      INITP_05 => X"0000000000000000000000000000005555555555555555555555555555555555",
      INITP_06 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_07 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_00 => X"025C01FC01A40154010D00CE0097006900430026001100040000000400100025",
      INIT_01 => X"0CCB0BE60B0A0A36096908A507EA0736068B05E8054E04BB043103B0033602C5",
      INIT_02 => X"1F631DFD1CA01B4A19FD18B717791644151613F012D311BD10B00FAA0EAD0DB8",
      INIT_03 => X"39D537F5361C344B328130BF2F052D522BA72A03286726D3254623C2224520D0",
      INIT_04 => X"5BB45961571454CF5291505A4E2A4C0149DF47C445B143A441A03FA23DAC3BBD",
      INIT_05 => X"847181B47EFE7C4F79A57702746671D06F406CB76A3567B9654462D6606E5E0E",
      INIT_06 => X"B362B048AD33AA24A71BA417A1199E219B2E9842955B927A8F9F8CCB89FC8733",
      INIT_07 => X"E7C3E458E0F2DD90DA34D6DCD389D03BCCF1C9ADC66EC334C000BCD0B9A6B681",
      INIT_08 => X"20B81D0B196115BB12190E7B0AE1074B03B9002BFCA2F91CF59BF21EEEA6EB32",
      INIT_09 => X"5D545973559651BB4DE34A0E463C426C3EA13AD8371233502F912BD5281D2469",
      INIT_0A => X"9C989894949390938C958899849F80A77CB178BD74CB70DC6CEF6904651C6137",
      INIT_0B => X"DD7CD966D552D13ECD2AC918C507C0F6BCE7B8D8B4CBB0BFACB4A8ABA4A3A09D",
      INIT_0C => X"000000000000000000000000000000000000000000000000EDD6E9BFE5A8E192",
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
      INIT_20 => X"31212D0D28F924E420CF1CB918A2148B10740C5C0844042C0014FBFCF7E5F3CD",
      INIT_21 => X"71BF6DC169C065BE61BA5DB459AD55A5519B4D904983457541673D5739463534",
      INIT_22 => X"B082ACA9A8CDA4EEA10C9D2899429558916D8D7F898E859C81A77DB079B775BC",
      INIT_23 => X"EC62E8BEE517E16CDDBDDA0AD655D29BCEDECB1EC75AC393BFC9BBFCB82BB458",
      INIT_24 => X"246521061DA31A3A16CE135C0FE70C6C08EE056B01E4FE58FAC9F735F39DF001",
      INIT_25 => X"57A0549451834E6C4B50482E450741DB3EA93B72383634F531AF2E642B1427BE",
      INIT_26 => X"853E82927FE07D277A6877A374D872076F2F6C52696F6685639660A15DA75AA6",
      INIT_27 => X"AC7FAA3EA7F6A5A7A351A0F49E919C2699B5973D94BF92398FAE8D1B8A8387E4",
      INIT_28 => X"CCBFCAF3C91EC743C55FC375C183BF89BD89BB80B971B75BB53DB318B0ECAEB9",
      INIT_29 => X"E578E427E2CEE16DE005DE94DD1CDB9CDA14D884D6EDD54ED3A7D1F8D042CE85",
      INIT_2A => X"F641F572F49AF3BAF2D2F1E2F0E9EFE9EEE0EDCFECB6EB95EA6CE93BE802E6C1",
      INIT_2B => X"FED5FE8BFE37FDDCFD78FD0CFC97FC1AFB95FB08FA72F9D4F92DF87FF7C8F709",
      INIT_2C => X"000000000000000000000000000000000000000000000000FFADFF84FF52FF18",
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
      WRITE_WIDTH_B => 18
    )
        port map (
      ADDRARDADDR(13 downto 12) => B"00",
      ADDRARDADDR(11) => \q0_reg_i_1__6_n_0\,
      ADDRARDADDR(10) => \q0_reg_i_2__6_n_0\,
      ADDRARDADDR(9) => \q0_reg_i_3__6_n_0\,
      ADDRARDADDR(8) => \q0_reg_i_4__6_n_0\,
      ADDRARDADDR(7) => \q0_reg_i_5__6_n_0\,
      ADDRARDADDR(6) => \q0_reg_i_6__6_n_0\,
      ADDRARDADDR(5) => \q0_reg_i_7__6_n_0\,
      ADDRARDADDR(4) => \q0_reg_i_8__6_n_0\,
      ADDRARDADDR(3 downto 0) => B"0000",
      ADDRBWRADDR(13 downto 12) => B"10",
      ADDRBWRADDR(11) => \q0_reg_i_1__6_n_0\,
      ADDRBWRADDR(10) => \q0_reg_i_2__6_n_0\,
      ADDRBWRADDR(9) => \q0_reg_i_3__6_n_0\,
      ADDRBWRADDR(8) => \q0_reg_i_4__6_n_0\,
      ADDRBWRADDR(7) => \q0_reg_i_5__6_n_0\,
      ADDRBWRADDR(6) => \q0_reg_i_6__6_n_0\,
      ADDRBWRADDR(5) => \q0_reg_i_7__6_n_0\,
      ADDRBWRADDR(4) => \q0_reg_i_8__6_n_0\,
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
      DINADIN(15 downto 0) => B"1111111111111111",
      DINBDIN(15 downto 0) => B"1111111111111111",
      DINPADINP(1 downto 0) => B"11",
      DINPBDINP(1 downto 0) => B"11",
      DOUTADOUT(15 downto 0) => hw_trig_vals_7_V(15 downto 0),
      DOUTBDOUT(15 downto 0) => hw_trig_vals_7_V(33 downto 18),
      DOUTPADOUTP(1 downto 0) => hw_trig_vals_7_V(17 downto 16),
      DOUTPBDOUTP(1 downto 0) => hw_trig_vals_7_V(35 downto 34),
      ENARDEN => ce1,
      ENBWREN => ce1,
      REGCEAREGCE => ap_enable_reg_pp0_iter3,
      REGCEB => ap_enable_reg_pp0_iter3,
      RSTRAMARSTRAM => '0',
      RSTRAMB => '0',
      RSTREGARSTREG => '0',
      RSTREGB => '0',
      SLEEP => '0',
      WEA(1 downto 0) => B"00",
      WEBWE(3 downto 0) => B"0000"
    );
\q0_reg_i_10__6\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"E0"
    )
        port map (
      I0 => add_ln1353_14_reg_1654(2),
      I1 => add_ln1353_14_reg_1654(1),
      I2 => add_ln1353_14_reg_1654(3),
      O => \q0_reg_i_10__6_n_0\
    );
\q0_reg_i_11__6\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => add_ln1353_14_reg_1654(5),
      I1 => add_ln1353_14_reg_1654(4),
      O => \q0_reg_i_11__6_n_0\
    );
\q0_reg_i_12__6\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFEFEFE"
    )
        port map (
      I0 => add_ln1353_14_reg_1654(5),
      I1 => add_ln1353_14_reg_1654(4),
      I2 => add_ln1353_14_reg_1654(6),
      I3 => add_ln1353_14_reg_1654(2),
      I4 => add_ln1353_14_reg_1654(3),
      O => \q0_reg_i_12__6_n_0\
    );
\q0_reg_i_13__6\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"88888880"
    )
        port map (
      I0 => add_ln1353_14_reg_1654(1),
      I1 => add_ln1353_14_reg_1654(3),
      I2 => add_ln1353_6_reg_1578(0),
      I3 => add_ln1353_14_reg_1654(0),
      I4 => add_ln1353_2_reg_1534(0),
      O => \q0_reg_i_13__6_n_0\
    );
\q0_reg_i_1__6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7777777F88888880"
    )
        port map (
      I0 => add_ln1353_14_reg_1654(7),
      I1 => \q0_reg_i_9__6_n_0\,
      I2 => \q0_reg_i_10__6_n_0\,
      I3 => add_ln1353_14_reg_1654(6),
      I4 => \q0_reg_i_11__6_n_0\,
      I5 => add_ln1353_14_reg_1654(8),
      O => \q0_reg_i_1__6_n_0\
    );
\q0_reg_i_2__6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0001FFFFFFFE0000"
    )
        port map (
      I0 => add_ln1353_14_reg_1654(5),
      I1 => add_ln1353_14_reg_1654(4),
      I2 => add_ln1353_14_reg_1654(6),
      I3 => \q0_reg_i_10__6_n_0\,
      I4 => \q0_reg_i_9__6_n_0\,
      I5 => add_ln1353_14_reg_1654(7),
      O => \q0_reg_i_2__6_n_0\
    );
\q0_reg_i_3__6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"EEEAFFFF11150000"
    )
        port map (
      I0 => \q0_reg_i_11__6_n_0\,
      I1 => add_ln1353_14_reg_1654(3),
      I2 => add_ln1353_14_reg_1654(1),
      I3 => add_ln1353_14_reg_1654(2),
      I4 => \q0_reg_i_9__6_n_0\,
      I5 => add_ln1353_14_reg_1654(6),
      O => \q0_reg_i_3__6_n_0\
    );
\q0_reg_i_4__6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"A9A9A999AAAAAAAA"
    )
        port map (
      I0 => add_ln1353_14_reg_1654(5),
      I1 => add_ln1353_14_reg_1654(4),
      I2 => add_ln1353_14_reg_1654(3),
      I3 => add_ln1353_14_reg_1654(1),
      I4 => add_ln1353_14_reg_1654(2),
      I5 => \q0_reg_i_9__6_n_0\,
      O => \q0_reg_i_4__6_n_0\
    );
\q0_reg_i_5__6\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"9995AAAA"
    )
        port map (
      I0 => add_ln1353_14_reg_1654(4),
      I1 => add_ln1353_14_reg_1654(3),
      I2 => add_ln1353_14_reg_1654(1),
      I3 => add_ln1353_14_reg_1654(2),
      I4 => \q0_reg_i_9__6_n_0\,
      O => \q0_reg_i_5__6_n_0\
    );
\q0_reg_i_6__6\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"57A8"
    )
        port map (
      I0 => \q0_reg_i_9__6_n_0\,
      I1 => add_ln1353_14_reg_1654(1),
      I2 => add_ln1353_14_reg_1654(2),
      I3 => add_ln1353_14_reg_1654(3),
      O => \q0_reg_i_6__6_n_0\
    );
\q0_reg_i_7__6\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"9C"
    )
        port map (
      I0 => add_ln1353_14_reg_1654(1),
      I1 => add_ln1353_14_reg_1654(2),
      I2 => \q0_reg_i_9__6_n_0\,
      O => \q0_reg_i_7__6_n_0\
    );
\q0_reg_i_8__6\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \q0_reg_i_9__6_n_0\,
      I1 => add_ln1353_14_reg_1654(1),
      O => \q0_reg_i_8__6_n_0\
    );
\q0_reg_i_9__6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFEEEEEEEEEEEEE"
    )
        port map (
      I0 => add_ln1353_14_reg_1654(10),
      I1 => add_ln1353_14_reg_1654(9),
      I2 => \q0_reg_i_12__6_n_0\,
      I3 => \q0_reg_i_13__6_n_0\,
      I4 => add_ln1353_14_reg_1654(7),
      I5 => add_ln1353_14_reg_1654(8),
      O => \q0_reg_i_9__6_n_0\
    );
q1_reg: unisim.vcomponents.RAMB18E2
    generic map(
      CASCADE_ORDER_A => "NONE",
      CASCADE_ORDER_B => "NONE",
      CLOCK_DOMAINS => "COMMON",
      DOA_REG => 1,
      DOB_REG => 1,
      ENADDRENA => "FALSE",
      ENADDRENB => "FALSE",
      INITP_00 => X"AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA",
      INITP_01 => X"000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAAA",
      INITP_02 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_03 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_04 => X"555555555555555555555555555554000000000000000000000000000000003F",
      INITP_05 => X"0000000000000000000000000000005555555555555555555555555555555555",
      INITP_06 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_07 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_00 => X"025C01FC01A40154010D00CE0097006900430026001100040000000400100025",
      INIT_01 => X"0CCB0BE60B0A0A36096908A507EA0736068B05E8054E04BB043103B0033602C5",
      INIT_02 => X"1F631DFD1CA01B4A19FD18B717791644151613F012D311BD10B00FAA0EAD0DB8",
      INIT_03 => X"39D537F5361C344B328130BF2F052D522BA72A03286726D3254623C2224520D0",
      INIT_04 => X"5BB45961571454CF5291505A4E2A4C0149DF47C445B143A441A03FA23DAC3BBD",
      INIT_05 => X"847181B47EFE7C4F79A57702746671D06F406CB76A3567B9654462D6606E5E0E",
      INIT_06 => X"B362B048AD33AA24A71BA417A1199E219B2E9842955B927A8F9F8CCB89FC8733",
      INIT_07 => X"E7C3E458E0F2DD90DA34D6DCD389D03BCCF1C9ADC66EC334C000BCD0B9A6B681",
      INIT_08 => X"20B81D0B196115BB12190E7B0AE1074B03B9002BFCA2F91CF59BF21EEEA6EB32",
      INIT_09 => X"5D545973559651BB4DE34A0E463C426C3EA13AD8371233502F912BD5281D2469",
      INIT_0A => X"9C989894949390938C958899849F80A77CB178BD74CB70DC6CEF6904651C6137",
      INIT_0B => X"DD7CD966D552D13ECD2AC918C507C0F6BCE7B8D8B4CBB0BFACB4A8ABA4A3A09D",
      INIT_0C => X"000000000000000000000000000000000000000000000000EDD6E9BFE5A8E192",
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
      INIT_20 => X"31212D0D28F924E420CF1CB918A2148B10740C5C0844042C0014FBFCF7E5F3CD",
      INIT_21 => X"71BF6DC169C065BE61BA5DB459AD55A5519B4D904983457541673D5739463534",
      INIT_22 => X"B082ACA9A8CDA4EEA10C9D2899429558916D8D7F898E859C81A77DB079B775BC",
      INIT_23 => X"EC62E8BEE517E16CDDBDDA0AD655D29BCEDECB1EC75AC393BFC9BBFCB82BB458",
      INIT_24 => X"246521061DA31A3A16CE135C0FE70C6C08EE056B01E4FE58FAC9F735F39DF001",
      INIT_25 => X"57A0549451834E6C4B50482E450741DB3EA93B72383634F531AF2E642B1427BE",
      INIT_26 => X"853E82927FE07D277A6877A374D872076F2F6C52696F6685639660A15DA75AA6",
      INIT_27 => X"AC7FAA3EA7F6A5A7A351A0F49E919C2699B5973D94BF92398FAE8D1B8A8387E4",
      INIT_28 => X"CCBFCAF3C91EC743C55FC375C183BF89BD89BB80B971B75BB53DB318B0ECAEB9",
      INIT_29 => X"E578E427E2CEE16DE005DE94DD1CDB9CDA14D884D6EDD54ED3A7D1F8D042CE85",
      INIT_2A => X"F641F572F49AF3BAF2D2F1E2F0E9EFE9EEE0EDCFECB6EB95EA6CE93BE802E6C1",
      INIT_2B => X"FED5FE8BFE37FDDCFD78FD0CFC97FC1AFB95FB08FA72F9D4F92DF87FF7C8F709",
      INIT_2C => X"000000000000000000000000000000000000000000000000FFADFF84FF52FF18",
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
      WRITE_WIDTH_B => 18
    )
        port map (
      ADDRARDADDR(13 downto 12) => B"00",
      ADDRARDADDR(11) => \q1_reg_i_1__6_n_0\,
      ADDRARDADDR(10) => \q1_reg_i_2__6_n_0\,
      ADDRARDADDR(9) => \q1_reg_i_3__6_n_0\,
      ADDRARDADDR(8) => \q1_reg_i_4__6_n_0\,
      ADDRARDADDR(7) => \q1_reg_i_5__6_n_0\,
      ADDRARDADDR(6) => \q1_reg_i_6__6_n_0\,
      ADDRARDADDR(5) => \q1_reg_i_7__6_n_0\,
      ADDRARDADDR(4) => \q1_reg_i_8__6_n_0\,
      ADDRARDADDR(3 downto 0) => B"0000",
      ADDRBWRADDR(13 downto 12) => B"10",
      ADDRBWRADDR(11) => \q1_reg_i_1__6_n_0\,
      ADDRBWRADDR(10) => \q1_reg_i_2__6_n_0\,
      ADDRBWRADDR(9) => \q1_reg_i_3__6_n_0\,
      ADDRBWRADDR(8) => \q1_reg_i_4__6_n_0\,
      ADDRBWRADDR(7) => \q1_reg_i_5__6_n_0\,
      ADDRBWRADDR(6) => \q1_reg_i_6__6_n_0\,
      ADDRBWRADDR(5) => \q1_reg_i_7__6_n_0\,
      ADDRBWRADDR(4) => \q1_reg_i_8__6_n_0\,
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
      CASDOUTA(15 downto 0) => NLW_q1_reg_CASDOUTA_UNCONNECTED(15 downto 0),
      CASDOUTB(15 downto 0) => NLW_q1_reg_CASDOUTB_UNCONNECTED(15 downto 0),
      CASDOUTPA(1 downto 0) => NLW_q1_reg_CASDOUTPA_UNCONNECTED(1 downto 0),
      CASDOUTPB(1 downto 0) => NLW_q1_reg_CASDOUTPB_UNCONNECTED(1 downto 0),
      CASOREGIMUXA => '0',
      CASOREGIMUXB => '0',
      CASOREGIMUXEN_A => '1',
      CASOREGIMUXEN_B => '1',
      CLKARDCLK => ap_clk,
      CLKBWRCLK => ap_clk,
      DINADIN(15 downto 0) => B"1111111111111111",
      DINBDIN(15 downto 0) => B"1111111111111111",
      DINPADINP(1 downto 0) => B"11",
      DINPBDINP(1 downto 0) => B"11",
      DOUTADOUT(15 downto 0) => hw_trig_vals_15_V(15 downto 0),
      DOUTBDOUT(15 downto 0) => hw_trig_vals_15_V(33 downto 18),
      DOUTPADOUTP(1 downto 0) => hw_trig_vals_15_V(17 downto 16),
      DOUTPBDOUTP(1 downto 0) => hw_trig_vals_15_V(35 downto 34),
      ENARDEN => ce1,
      ENBWREN => ce1,
      REGCEAREGCE => ap_enable_reg_pp0_iter3,
      REGCEB => ap_enable_reg_pp0_iter3,
      RSTRAMARSTRAM => '0',
      RSTRAMB => '0',
      RSTREGARSTREG => '0',
      RSTREGB => '0',
      SLEEP => '0',
      WEA(1 downto 0) => B"00",
      WEBWE(3 downto 0) => B"0000"
    );
\q1_reg_i_1__6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"03FFAAAAFC00AAAA"
    )
        port map (
      I0 => tmp_15_reg_1671(7),
      I1 => add_ln1353_14_reg_1654(6),
      I2 => \q1_reg_i_9__6_n_0\,
      I3 => add_ln1353_14_reg_1654(7),
      I4 => icmp_ln895_15_reg_1666,
      I5 => add_ln1353_14_reg_1654(8),
      O => \q1_reg_i_1__6_n_0\
    );
\q1_reg_i_2__6\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"03AAFCAA"
    )
        port map (
      I0 => tmp_15_reg_1671(6),
      I1 => \q1_reg_i_9__6_n_0\,
      I2 => add_ln1353_14_reg_1654(6),
      I3 => icmp_ln895_15_reg_1666,
      I4 => add_ln1353_14_reg_1654(7),
      O => \q1_reg_i_2__6_n_0\
    );
\q1_reg_i_3__6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFCAAAA0003AAAA"
    )
        port map (
      I0 => tmp_15_reg_1671(5),
      I1 => add_ln1353_14_reg_1654(4),
      I2 => add_ln1353_14_reg_1654(5),
      I3 => add_ln1353_14_reg_1654(3),
      I4 => icmp_ln895_15_reg_1666,
      I5 => add_ln1353_14_reg_1654(6),
      O => \q1_reg_i_3__6_n_0\
    );
\q1_reg_i_4__6\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"F0C3AAAA"
    )
        port map (
      I0 => tmp_15_reg_1671(4),
      I1 => add_ln1353_14_reg_1654(4),
      I2 => add_ln1353_14_reg_1654(5),
      I3 => add_ln1353_14_reg_1654(3),
      I4 => icmp_ln895_15_reg_1666,
      O => \q1_reg_i_4__6_n_0\
    );
\q1_reg_i_5__6\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"E22E"
    )
        port map (
      I0 => tmp_15_reg_1671(3),
      I1 => icmp_ln895_15_reg_1666,
      I2 => add_ln1353_14_reg_1654(3),
      I3 => add_ln1353_14_reg_1654(4),
      O => \q1_reg_i_5__6_n_0\
    );
\q1_reg_i_6__6\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"74"
    )
        port map (
      I0 => add_ln1353_14_reg_1654(3),
      I1 => icmp_ln895_15_reg_1666,
      I2 => tmp_15_reg_1671(2),
      O => \q1_reg_i_6__6_n_0\
    );
\q1_reg_i_7__6\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => add_ln1353_14_reg_1654(2),
      I1 => icmp_ln895_15_reg_1666,
      I2 => tmp_15_reg_1671(1),
      O => \q1_reg_i_7__6_n_0\
    );
\q1_reg_i_8__6\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => add_ln1353_14_reg_1654(1),
      I1 => icmp_ln895_15_reg_1666,
      I2 => tmp_15_reg_1671(0),
      O => \q1_reg_i_8__6_n_0\
    );
\q1_reg_i_9__6\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"FE"
    )
        port map (
      I0 => add_ln1353_14_reg_1654(4),
      I1 => add_ln1353_14_reg_1654(5),
      I2 => add_ln1353_14_reg_1654(3),
      O => \q1_reg_i_9__6_n_0\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity hls_get_trig_vals_get_trig_vals_lutbkb is
  port (
    hw_trig_vals_0_V : out STD_LOGIC_VECTOR ( 35 downto 0 );
    hw_trig_vals_8_V : out STD_LOGIC_VECTOR ( 35 downto 0 );
    ap_clk : in STD_LOGIC;
    ce1 : in STD_LOGIC;
    ap_enable_reg_pp0_iter3 : in STD_LOGIC;
    add_ln1353_reg_1512 : in STD_LOGIC_VECTOR ( 12 downto 0 );
    tmp_1_reg_1529 : in STD_LOGIC_VECTOR ( 7 downto 0 );
    icmp_ln895_1_reg_1524 : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of hls_get_trig_vals_get_trig_vals_lutbkb : entity is "get_trig_vals_lutbkb";
end hls_get_trig_vals_get_trig_vals_lutbkb;

architecture STRUCTURE of hls_get_trig_vals_get_trig_vals_lutbkb is
begin
get_trig_vals_lutbkb_rom_U: entity work.hls_get_trig_vals_get_trig_vals_lutbkb_rom
     port map (
      add_ln1353_reg_1512(12 downto 0) => add_ln1353_reg_1512(12 downto 0),
      ap_clk => ap_clk,
      ap_enable_reg_pp0_iter3 => ap_enable_reg_pp0_iter3,
      ce1 => ce1,
      hw_trig_vals_0_V(35 downto 0) => hw_trig_vals_0_V(35 downto 0),
      hw_trig_vals_8_V(35 downto 0) => hw_trig_vals_8_V(35 downto 0),
      icmp_ln895_1_reg_1524 => icmp_ln895_1_reg_1524,
      tmp_1_reg_1529(7 downto 0) => tmp_1_reg_1529(7 downto 0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity hls_get_trig_vals_get_trig_vals_lutcud is
  port (
    hw_trig_vals_1_V : out STD_LOGIC_VECTOR ( 35 downto 0 );
    hw_trig_vals_9_V : out STD_LOGIC_VECTOR ( 35 downto 0 );
    ap_clk : in STD_LOGIC;
    ce1 : in STD_LOGIC;
    ap_enable_reg_pp0_iter3 : in STD_LOGIC;
    add_ln1353_2_reg_1534 : in STD_LOGIC_VECTOR ( 12 downto 0 );
    tmp_3_reg_1551 : in STD_LOGIC_VECTOR ( 7 downto 0 );
    icmp_ln895_9_reg_1546 : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of hls_get_trig_vals_get_trig_vals_lutcud : entity is "get_trig_vals_lutcud";
end hls_get_trig_vals_get_trig_vals_lutcud;

architecture STRUCTURE of hls_get_trig_vals_get_trig_vals_lutcud is
begin
get_trig_vals_lutcud_rom_U: entity work.hls_get_trig_vals_get_trig_vals_lutcud_rom
     port map (
      add_ln1353_2_reg_1534(12 downto 0) => add_ln1353_2_reg_1534(12 downto 0),
      ap_clk => ap_clk,
      ap_enable_reg_pp0_iter3 => ap_enable_reg_pp0_iter3,
      ce1 => ce1,
      hw_trig_vals_1_V(35 downto 0) => hw_trig_vals_1_V(35 downto 0),
      hw_trig_vals_9_V(35 downto 0) => hw_trig_vals_9_V(35 downto 0),
      icmp_ln895_9_reg_1546 => icmp_ln895_9_reg_1546,
      tmp_3_reg_1551(7 downto 0) => tmp_3_reg_1551(7 downto 0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity hls_get_trig_vals_get_trig_vals_lutdEe is
  port (
    hw_trig_vals_2_V : out STD_LOGIC_VECTOR ( 35 downto 0 );
    hw_trig_vals_10_V : out STD_LOGIC_VECTOR ( 35 downto 0 );
    ap_clk : in STD_LOGIC;
    ce1 : in STD_LOGIC;
    ap_enable_reg_pp0_iter3 : in STD_LOGIC;
    add_ln1353_4_reg_1556 : in STD_LOGIC_VECTOR ( 11 downto 0 );
    tmp_5_reg_1573 : in STD_LOGIC_VECTOR ( 7 downto 0 );
    icmp_ln895_10_reg_1568 : in STD_LOGIC;
    add_ln1353_reg_1512 : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of hls_get_trig_vals_get_trig_vals_lutdEe : entity is "get_trig_vals_lutdEe";
end hls_get_trig_vals_get_trig_vals_lutdEe;

architecture STRUCTURE of hls_get_trig_vals_get_trig_vals_lutdEe is
begin
get_trig_vals_lutdEe_rom_U: entity work.hls_get_trig_vals_get_trig_vals_lutdEe_rom
     port map (
      add_ln1353_4_reg_1556(11 downto 0) => add_ln1353_4_reg_1556(11 downto 0),
      add_ln1353_reg_1512(0) => add_ln1353_reg_1512(0),
      ap_clk => ap_clk,
      ap_enable_reg_pp0_iter3 => ap_enable_reg_pp0_iter3,
      ce1 => ce1,
      hw_trig_vals_10_V(35 downto 0) => hw_trig_vals_10_V(35 downto 0),
      hw_trig_vals_2_V(35 downto 0) => hw_trig_vals_2_V(35 downto 0),
      icmp_ln895_10_reg_1568 => icmp_ln895_10_reg_1568,
      tmp_5_reg_1573(7 downto 0) => tmp_5_reg_1573(7 downto 0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity hls_get_trig_vals_get_trig_vals_luteOg is
  port (
    hw_trig_vals_3_V : out STD_LOGIC_VECTOR ( 35 downto 0 );
    hw_trig_vals_11_V : out STD_LOGIC_VECTOR ( 35 downto 0 );
    ap_clk : in STD_LOGIC;
    ce1 : in STD_LOGIC;
    ap_enable_reg_pp0_iter3 : in STD_LOGIC;
    add_ln1353_6_reg_1578 : in STD_LOGIC_VECTOR ( 11 downto 0 );
    tmp_7_reg_1595 : in STD_LOGIC_VECTOR ( 7 downto 0 );
    icmp_ln895_11_reg_1590 : in STD_LOGIC;
    add_ln1353_2_reg_1534 : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of hls_get_trig_vals_get_trig_vals_luteOg : entity is "get_trig_vals_luteOg";
end hls_get_trig_vals_get_trig_vals_luteOg;

architecture STRUCTURE of hls_get_trig_vals_get_trig_vals_luteOg is
begin
get_trig_vals_luteOg_rom_U: entity work.hls_get_trig_vals_get_trig_vals_luteOg_rom
     port map (
      add_ln1353_2_reg_1534(0) => add_ln1353_2_reg_1534(0),
      add_ln1353_6_reg_1578(11 downto 0) => add_ln1353_6_reg_1578(11 downto 0),
      ap_clk => ap_clk,
      ap_enable_reg_pp0_iter3 => ap_enable_reg_pp0_iter3,
      ce1 => ce1,
      hw_trig_vals_11_V(35 downto 0) => hw_trig_vals_11_V(35 downto 0),
      hw_trig_vals_3_V(35 downto 0) => hw_trig_vals_3_V(35 downto 0),
      icmp_ln895_11_reg_1590 => icmp_ln895_11_reg_1590,
      tmp_7_reg_1595(7 downto 0) => tmp_7_reg_1595(7 downto 0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity hls_get_trig_vals_get_trig_vals_lutfYi is
  port (
    hw_trig_vals_4_V : out STD_LOGIC_VECTOR ( 35 downto 0 );
    hw_trig_vals_12_V : out STD_LOGIC_VECTOR ( 35 downto 0 );
    ap_clk : in STD_LOGIC;
    ce1 : in STD_LOGIC;
    ap_enable_reg_pp0_iter3 : in STD_LOGIC;
    add_ln1353_8_reg_1484_pp0_iter1_reg : in STD_LOGIC_VECTOR ( 12 downto 0 );
    tmp_9_reg_1605 : in STD_LOGIC_VECTOR ( 7 downto 0 );
    icmp_ln895_12_reg_1600 : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of hls_get_trig_vals_get_trig_vals_lutfYi : entity is "get_trig_vals_lutfYi";
end hls_get_trig_vals_get_trig_vals_lutfYi;

architecture STRUCTURE of hls_get_trig_vals_get_trig_vals_lutfYi is
begin
get_trig_vals_lutfYi_rom_U: entity work.hls_get_trig_vals_get_trig_vals_lutfYi_rom
     port map (
      add_ln1353_8_reg_1484_pp0_iter1_reg(12 downto 0) => add_ln1353_8_reg_1484_pp0_iter1_reg(12 downto 0),
      ap_clk => ap_clk,
      ap_enable_reg_pp0_iter3 => ap_enable_reg_pp0_iter3,
      ce1 => ce1,
      hw_trig_vals_12_V(35 downto 0) => hw_trig_vals_12_V(35 downto 0),
      hw_trig_vals_4_V(35 downto 0) => hw_trig_vals_4_V(35 downto 0),
      icmp_ln895_12_reg_1600 => icmp_ln895_12_reg_1600,
      tmp_9_reg_1605(7 downto 0) => tmp_9_reg_1605(7 downto 0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity hls_get_trig_vals_get_trig_vals_lutg8j is
  port (
    hw_trig_vals_5_V : out STD_LOGIC_VECTOR ( 35 downto 0 );
    hw_trig_vals_13_V : out STD_LOGIC_VECTOR ( 35 downto 0 );
    ap_clk : in STD_LOGIC;
    ce1 : in STD_LOGIC;
    ap_enable_reg_pp0_iter3 : in STD_LOGIC;
    add_ln1353_10_reg_1610 : in STD_LOGIC_VECTOR ( 10 downto 0 );
    tmp_11_reg_1627 : in STD_LOGIC_VECTOR ( 7 downto 0 );
    icmp_ln895_13_reg_1622 : in STD_LOGIC;
    add_ln1353_2_reg_1534 : in STD_LOGIC_VECTOR ( 1 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of hls_get_trig_vals_get_trig_vals_lutg8j : entity is "get_trig_vals_lutg8j";
end hls_get_trig_vals_get_trig_vals_lutg8j;

architecture STRUCTURE of hls_get_trig_vals_get_trig_vals_lutg8j is
begin
get_trig_vals_lutg8j_rom_U: entity work.hls_get_trig_vals_get_trig_vals_lutg8j_rom
     port map (
      add_ln1353_10_reg_1610(10 downto 0) => add_ln1353_10_reg_1610(10 downto 0),
      add_ln1353_2_reg_1534(1 downto 0) => add_ln1353_2_reg_1534(1 downto 0),
      ap_clk => ap_clk,
      ap_enable_reg_pp0_iter3 => ap_enable_reg_pp0_iter3,
      ce1 => ce1,
      hw_trig_vals_13_V(35 downto 0) => hw_trig_vals_13_V(35 downto 0),
      hw_trig_vals_5_V(35 downto 0) => hw_trig_vals_5_V(35 downto 0),
      icmp_ln895_13_reg_1622 => icmp_ln895_13_reg_1622,
      tmp_11_reg_1627(7 downto 0) => tmp_11_reg_1627(7 downto 0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity hls_get_trig_vals_get_trig_vals_luthbi is
  port (
    hw_trig_vals_6_V : out STD_LOGIC_VECTOR ( 35 downto 0 );
    hw_trig_vals_14_V : out STD_LOGIC_VECTOR ( 35 downto 0 );
    ap_clk : in STD_LOGIC;
    ce1 : in STD_LOGIC;
    ap_enable_reg_pp0_iter3 : in STD_LOGIC;
    add_ln1353_12_reg_1632 : in STD_LOGIC_VECTOR ( 10 downto 0 );
    tmp_13_reg_1649 : in STD_LOGIC_VECTOR ( 7 downto 0 );
    icmp_ln895_14_reg_1644 : in STD_LOGIC;
    add_ln1353_4_reg_1556 : in STD_LOGIC_VECTOR ( 0 to 0 );
    add_ln1353_reg_1512 : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of hls_get_trig_vals_get_trig_vals_luthbi : entity is "get_trig_vals_luthbi";
end hls_get_trig_vals_get_trig_vals_luthbi;

architecture STRUCTURE of hls_get_trig_vals_get_trig_vals_luthbi is
begin
get_trig_vals_luthbi_rom_U: entity work.hls_get_trig_vals_get_trig_vals_luthbi_rom
     port map (
      add_ln1353_12_reg_1632(10 downto 0) => add_ln1353_12_reg_1632(10 downto 0),
      add_ln1353_4_reg_1556(0) => add_ln1353_4_reg_1556(0),
      add_ln1353_reg_1512(0) => add_ln1353_reg_1512(0),
      ap_clk => ap_clk,
      ap_enable_reg_pp0_iter3 => ap_enable_reg_pp0_iter3,
      ce1 => ce1,
      hw_trig_vals_14_V(35 downto 0) => hw_trig_vals_14_V(35 downto 0),
      hw_trig_vals_6_V(35 downto 0) => hw_trig_vals_6_V(35 downto 0),
      icmp_ln895_14_reg_1644 => icmp_ln895_14_reg_1644,
      tmp_13_reg_1649(7 downto 0) => tmp_13_reg_1649(7 downto 0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity hls_get_trig_vals_get_trig_vals_lutibs is
  port (
    hw_trig_vals_7_V : out STD_LOGIC_VECTOR ( 35 downto 0 );
    hw_trig_vals_15_V : out STD_LOGIC_VECTOR ( 35 downto 0 );
    ap_clk : in STD_LOGIC;
    ce1 : in STD_LOGIC;
    ap_enable_reg_pp0_iter3 : in STD_LOGIC;
    add_ln1353_14_reg_1654 : in STD_LOGIC_VECTOR ( 10 downto 0 );
    tmp_15_reg_1671 : in STD_LOGIC_VECTOR ( 7 downto 0 );
    icmp_ln895_15_reg_1666 : in STD_LOGIC;
    add_ln1353_6_reg_1578 : in STD_LOGIC_VECTOR ( 0 to 0 );
    add_ln1353_2_reg_1534 : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of hls_get_trig_vals_get_trig_vals_lutibs : entity is "get_trig_vals_lutibs";
end hls_get_trig_vals_get_trig_vals_lutibs;

architecture STRUCTURE of hls_get_trig_vals_get_trig_vals_lutibs is
begin
get_trig_vals_lutibs_rom_U: entity work.hls_get_trig_vals_get_trig_vals_lutibs_rom
     port map (
      add_ln1353_14_reg_1654(10 downto 0) => add_ln1353_14_reg_1654(10 downto 0),
      add_ln1353_2_reg_1534(0) => add_ln1353_2_reg_1534(0),
      add_ln1353_6_reg_1578(0) => add_ln1353_6_reg_1578(0),
      ap_clk => ap_clk,
      ap_enable_reg_pp0_iter3 => ap_enable_reg_pp0_iter3,
      ce1 => ce1,
      hw_trig_vals_15_V(35 downto 0) => hw_trig_vals_15_V(35 downto 0),
      hw_trig_vals_7_V(35 downto 0) => hw_trig_vals_7_V(35 downto 0),
      icmp_ln895_15_reg_1666 => icmp_ln895_15_reg_1666,
      tmp_15_reg_1671(7 downto 0) => tmp_15_reg_1671(7 downto 0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity hls_get_trig_vals_get_trig_vals is
  port (
    ap_clk : in STD_LOGIC;
    ap_rst : in STD_LOGIC;
    ap_start : in STD_LOGIC;
    ap_done : out STD_LOGIC;
    ap_idle : out STD_LOGIC;
    ap_ready : out STD_LOGIC;
    hw_trig_vals_0_V : out STD_LOGIC_VECTOR ( 35 downto 0 );
    hw_trig_vals_1_V : out STD_LOGIC_VECTOR ( 35 downto 0 );
    hw_trig_vals_2_V : out STD_LOGIC_VECTOR ( 35 downto 0 );
    hw_trig_vals_3_V : out STD_LOGIC_VECTOR ( 35 downto 0 );
    hw_trig_vals_4_V : out STD_LOGIC_VECTOR ( 35 downto 0 );
    hw_trig_vals_5_V : out STD_LOGIC_VECTOR ( 35 downto 0 );
    hw_trig_vals_6_V : out STD_LOGIC_VECTOR ( 35 downto 0 );
    hw_trig_vals_7_V : out STD_LOGIC_VECTOR ( 35 downto 0 );
    hw_trig_vals_8_V : out STD_LOGIC_VECTOR ( 35 downto 0 );
    hw_trig_vals_9_V : out STD_LOGIC_VECTOR ( 35 downto 0 );
    hw_trig_vals_10_V : out STD_LOGIC_VECTOR ( 35 downto 0 );
    hw_trig_vals_11_V : out STD_LOGIC_VECTOR ( 35 downto 0 );
    hw_trig_vals_12_V : out STD_LOGIC_VECTOR ( 35 downto 0 );
    hw_trig_vals_13_V : out STD_LOGIC_VECTOR ( 35 downto 0 );
    hw_trig_vals_14_V : out STD_LOGIC_VECTOR ( 35 downto 0 );
    hw_trig_vals_15_V : out STD_LOGIC_VECTOR ( 35 downto 0 );
    rom_idx_V : in STD_LOGIC_VECTOR ( 2 downto 0 );
    lut_start_addr_V : in STD_LOGIC_VECTOR ( 11 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of hls_get_trig_vals_get_trig_vals : entity is "get_trig_vals";
end hls_get_trig_vals_get_trig_vals;

architecture STRUCTURE of hls_get_trig_vals_get_trig_vals is
  signal add_ln1353_10_fu_744_p2 : STD_LOGIC_VECTOR ( 11 downto 2 );
  signal add_ln1353_10_reg_1610 : STD_LOGIC_VECTOR ( 12 downto 2 );
  signal \add_ln1353_10_reg_1610[11]_i_2_n_0\ : STD_LOGIC;
  signal \add_ln1353_10_reg_1610[12]_i_1_n_0\ : STD_LOGIC;
  signal add_ln1353_11_fu_759_p2 : STD_LOGIC_VECTOR ( 10 downto 3 );
  signal add_ln1353_12_fu_784_p2 : STD_LOGIC_VECTOR ( 11 downto 2 );
  signal add_ln1353_12_reg_1632 : STD_LOGIC_VECTOR ( 12 downto 2 );
  signal \add_ln1353_12_reg_1632[11]_i_2_n_0\ : STD_LOGIC;
  signal \add_ln1353_12_reg_1632[12]_i_1_n_0\ : STD_LOGIC;
  signal add_ln1353_13_fu_799_p2 : STD_LOGIC_VECTOR ( 10 downto 3 );
  signal add_ln1353_14_fu_824_p2 : STD_LOGIC_VECTOR ( 11 downto 2 );
  signal add_ln1353_14_reg_1654 : STD_LOGIC_VECTOR ( 12 downto 2 );
  signal \add_ln1353_14_reg_1654[11]_i_2_n_0\ : STD_LOGIC;
  signal \add_ln1353_14_reg_1654[12]_i_1_n_0\ : STD_LOGIC;
  signal add_ln1353_15_fu_839_p2 : STD_LOGIC_VECTOR ( 10 downto 3 );
  signal add_ln1353_1_fu_578_p2 : STD_LOGIC_VECTOR ( 10 downto 3 );
  signal add_ln1353_2_fu_603_p2 : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal add_ln1353_2_reg_1534 : STD_LOGIC_VECTOR ( 12 downto 0 );
  signal \add_ln1353_2_reg_1534[11]_i_2_n_0\ : STD_LOGIC;
  signal \add_ln1353_2_reg_1534[12]_i_1_n_0\ : STD_LOGIC;
  signal add_ln1353_3_fu_618_p2 : STD_LOGIC_VECTOR ( 10 downto 3 );
  signal add_ln1353_4_fu_643_p2 : STD_LOGIC_VECTOR ( 11 downto 1 );
  signal add_ln1353_4_reg_1556 : STD_LOGIC_VECTOR ( 12 downto 1 );
  signal \add_ln1353_4_reg_1556[11]_i_2_n_0\ : STD_LOGIC;
  signal \add_ln1353_4_reg_1556[12]_i_1_n_0\ : STD_LOGIC;
  signal add_ln1353_5_fu_658_p2 : STD_LOGIC_VECTOR ( 10 downto 3 );
  signal add_ln1353_6_fu_683_p2 : STD_LOGIC_VECTOR ( 11 downto 1 );
  signal add_ln1353_6_reg_1578 : STD_LOGIC_VECTOR ( 12 downto 1 );
  signal \add_ln1353_6_reg_1578[11]_i_2_n_0\ : STD_LOGIC;
  signal \add_ln1353_6_reg_1578[12]_i_1_n_0\ : STD_LOGIC;
  signal add_ln1353_7_fu_698_p2 : STD_LOGIC_VECTOR ( 10 downto 3 );
  signal add_ln1353_8_fu_514_p2 : STD_LOGIC_VECTOR ( 12 downto 0 );
  signal add_ln1353_8_reg_1484 : STD_LOGIC_VECTOR ( 12 downto 0 );
  signal \add_ln1353_8_reg_1484[11]_i_2_n_0\ : STD_LOGIC;
  signal \add_ln1353_8_reg_1484[12]_i_2_n_0\ : STD_LOGIC;
  signal \add_ln1353_8_reg_1484[12]_i_3_n_0\ : STD_LOGIC;
  signal \add_ln1353_8_reg_1484[7]_i_2_n_0\ : STD_LOGIC;
  signal \add_ln1353_8_reg_1484[8]_i_2_n_0\ : STD_LOGIC;
  signal add_ln1353_8_reg_1484_pp0_iter1_reg : STD_LOGIC_VECTOR ( 12 downto 0 );
  signal add_ln1353_9_fu_720_p2 : STD_LOGIC_VECTOR ( 10 downto 3 );
  signal add_ln1353_reg_1512 : STD_LOGIC_VECTOR ( 12 downto 0 );
  signal \add_ln1353_reg_1512[0]_i_1_n_0\ : STD_LOGIC;
  signal \add_ln1353_reg_1512[11]_i_1_n_0\ : STD_LOGIC;
  signal \add_ln1353_reg_1512[11]_i_2_n_0\ : STD_LOGIC;
  signal \add_ln1353_reg_1512[12]_i_1_n_0\ : STD_LOGIC;
  signal \add_ln1353_reg_1512[12]_i_2_n_0\ : STD_LOGIC;
  signal \add_ln1353_reg_1512[1]_i_1_n_0\ : STD_LOGIC;
  signal \add_ln1353_reg_1512[2]_i_1_n_0\ : STD_LOGIC;
  signal add_ln647_1_fu_484_p2 : STD_LOGIC_VECTOR ( 2 downto 1 );
  signal add_ln647_1_reg_1474 : STD_LOGIC_VECTOR ( 2 downto 1 );
  signal add_ln647_2_reg_1479 : STD_LOGIC_VECTOR ( 2 downto 1 );
  signal add_ln647_3_fu_534_p2 : STD_LOGIC_VECTOR ( 2 to 2 );
  signal add_ln647_3_reg_1497 : STD_LOGIC_VECTOR ( 2 to 2 );
  signal add_ln647_4_fu_544_p2 : STD_LOGIC_VECTOR ( 2 to 2 );
  signal add_ln647_4_reg_1502 : STD_LOGIC_VECTOR ( 2 to 2 );
  signal add_ln647_5_fu_554_p2 : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal add_ln647_5_reg_1507 : STD_LOGIC_VECTOR ( 2 to 2 );
  signal add_ln647_fu_474_p2 : STD_LOGIC_VECTOR ( 2 to 2 );
  signal add_ln647_reg_1469 : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \^ap_done\ : STD_LOGIC;
  signal ap_enable_reg_pp0_iter1 : STD_LOGIC;
  signal ap_enable_reg_pp0_iter2 : STD_LOGIC;
  signal ap_enable_reg_pp0_iter3 : STD_LOGIC;
  signal \^ap_start\ : STD_LOGIC;
  signal icmp_ln895_10_fu_664_p2 : STD_LOGIC;
  signal icmp_ln895_10_reg_1568 : STD_LOGIC;
  signal \icmp_ln895_10_reg_1568[0]_i_2_n_0\ : STD_LOGIC;
  signal \icmp_ln895_10_reg_1568[0]_i_3_n_0\ : STD_LOGIC;
  signal \icmp_ln895_10_reg_1568[0]_i_4_n_0\ : STD_LOGIC;
  signal \icmp_ln895_10_reg_1568[0]_i_5_n_0\ : STD_LOGIC;
  signal \icmp_ln895_10_reg_1568[0]_i_6_n_0\ : STD_LOGIC;
  signal icmp_ln895_11_fu_704_p2 : STD_LOGIC;
  signal icmp_ln895_11_reg_1590 : STD_LOGIC;
  signal \icmp_ln895_11_reg_1590[0]_i_2_n_0\ : STD_LOGIC;
  signal \icmp_ln895_11_reg_1590[0]_i_3_n_0\ : STD_LOGIC;
  signal \icmp_ln895_11_reg_1590[0]_i_4_n_0\ : STD_LOGIC;
  signal \icmp_ln895_11_reg_1590[0]_i_5_n_0\ : STD_LOGIC;
  signal \icmp_ln895_11_reg_1590[0]_i_6_n_0\ : STD_LOGIC;
  signal icmp_ln895_12_fu_725_p2 : STD_LOGIC;
  signal icmp_ln895_12_reg_1600 : STD_LOGIC;
  signal \icmp_ln895_12_reg_1600[0]_i_2_n_0\ : STD_LOGIC;
  signal \icmp_ln895_12_reg_1600[0]_i_3_n_0\ : STD_LOGIC;
  signal \icmp_ln895_12_reg_1600[0]_i_4_n_0\ : STD_LOGIC;
  signal icmp_ln895_13_fu_765_p2 : STD_LOGIC;
  signal icmp_ln895_13_reg_1622 : STD_LOGIC;
  signal \icmp_ln895_13_reg_1622[0]_i_2_n_0\ : STD_LOGIC;
  signal \icmp_ln895_13_reg_1622[0]_i_3_n_0\ : STD_LOGIC;
  signal \icmp_ln895_13_reg_1622[0]_i_4_n_0\ : STD_LOGIC;
  signal \icmp_ln895_13_reg_1622[0]_i_5_n_0\ : STD_LOGIC;
  signal \icmp_ln895_13_reg_1622[0]_i_6_n_0\ : STD_LOGIC;
  signal icmp_ln895_14_fu_805_p2 : STD_LOGIC;
  signal icmp_ln895_14_reg_1644 : STD_LOGIC;
  signal \icmp_ln895_14_reg_1644[0]_i_2_n_0\ : STD_LOGIC;
  signal \icmp_ln895_14_reg_1644[0]_i_3_n_0\ : STD_LOGIC;
  signal \icmp_ln895_14_reg_1644[0]_i_4_n_0\ : STD_LOGIC;
  signal \icmp_ln895_14_reg_1644[0]_i_5_n_0\ : STD_LOGIC;
  signal \icmp_ln895_14_reg_1644[0]_i_6_n_0\ : STD_LOGIC;
  signal icmp_ln895_15_fu_845_p2 : STD_LOGIC;
  signal icmp_ln895_15_reg_1666 : STD_LOGIC;
  signal \icmp_ln895_15_reg_1666[0]_i_2_n_0\ : STD_LOGIC;
  signal \icmp_ln895_15_reg_1666[0]_i_3_n_0\ : STD_LOGIC;
  signal \icmp_ln895_15_reg_1666[0]_i_4_n_0\ : STD_LOGIC;
  signal \icmp_ln895_15_reg_1666[0]_i_5_n_0\ : STD_LOGIC;
  signal \icmp_ln895_15_reg_1666[0]_i_6_n_0\ : STD_LOGIC;
  signal icmp_ln895_1_fu_584_p2 : STD_LOGIC;
  signal icmp_ln895_1_reg_1524 : STD_LOGIC;
  signal \icmp_ln895_1_reg_1524[0]_i_2_n_0\ : STD_LOGIC;
  signal \icmp_ln895_1_reg_1524[0]_i_3_n_0\ : STD_LOGIC;
  signal \icmp_ln895_1_reg_1524[0]_i_4_n_0\ : STD_LOGIC;
  signal \icmp_ln895_1_reg_1524[0]_i_5_n_0\ : STD_LOGIC;
  signal \icmp_ln895_1_reg_1524[0]_i_6_n_0\ : STD_LOGIC;
  signal \icmp_ln895_1_reg_1524[0]_i_7_n_0\ : STD_LOGIC;
  signal \icmp_ln895_1_reg_1524[0]_i_8_n_0\ : STD_LOGIC;
  signal icmp_ln895_9_fu_624_p2 : STD_LOGIC;
  signal icmp_ln895_9_reg_1546 : STD_LOGIC;
  signal \icmp_ln895_9_reg_1546[0]_i_2_n_0\ : STD_LOGIC;
  signal \icmp_ln895_9_reg_1546[0]_i_3_n_0\ : STD_LOGIC;
  signal \icmp_ln895_9_reg_1546[0]_i_4_n_0\ : STD_LOGIC;
  signal \icmp_ln895_9_reg_1546[0]_i_5_n_0\ : STD_LOGIC;
  signal \icmp_ln895_9_reg_1546[0]_i_6_n_0\ : STD_LOGIC;
  signal p_0_in : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal ret_V_fu_456_p2 : STD_LOGIC_VECTOR ( 2 downto 1 );
  signal tmp_11_reg_1627 : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \tmp_11_reg_1627[6]_i_2_n_0\ : STD_LOGIC;
  signal \tmp_11_reg_1627[7]_i_2_n_0\ : STD_LOGIC;
  signal tmp_13_reg_1649 : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \tmp_13_reg_1649[6]_i_2_n_0\ : STD_LOGIC;
  signal \tmp_13_reg_1649[7]_i_2_n_0\ : STD_LOGIC;
  signal tmp_15_reg_1671 : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \tmp_15_reg_1671[6]_i_2_n_0\ : STD_LOGIC;
  signal \tmp_15_reg_1671[7]_i_2_n_0\ : STD_LOGIC;
  signal tmp_1_reg_1529 : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \tmp_1_reg_1529[0]_i_2_n_0\ : STD_LOGIC;
  signal \tmp_1_reg_1529[6]_i_2_n_0\ : STD_LOGIC;
  signal \tmp_1_reg_1529[6]_i_3_n_0\ : STD_LOGIC;
  signal \tmp_1_reg_1529[6]_i_4_n_0\ : STD_LOGIC;
  signal \tmp_1_reg_1529[7]_i_2_n_0\ : STD_LOGIC;
  signal tmp_3_reg_1551 : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \tmp_3_reg_1551[6]_i_2_n_0\ : STD_LOGIC;
  signal \tmp_3_reg_1551[7]_i_2_n_0\ : STD_LOGIC;
  signal tmp_5_reg_1573 : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \tmp_5_reg_1573[6]_i_2_n_0\ : STD_LOGIC;
  signal \tmp_5_reg_1573[7]_i_2_n_0\ : STD_LOGIC;
  signal tmp_7_reg_1595 : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \tmp_7_reg_1595[6]_i_2_n_0\ : STD_LOGIC;
  signal \tmp_7_reg_1595[7]_i_2_n_0\ : STD_LOGIC;
  signal tmp_9_reg_1605 : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \tmp_9_reg_1605[7]_i_2_n_0\ : STD_LOGIC;
  signal trunc_ln647_reg_1464 : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal zext_ln215_reg_1453 : STD_LOGIC_VECTOR ( 11 downto 0 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \add_ln1353_10_reg_1610[10]_i_1\ : label is "soft_lutpair27";
  attribute SOFT_HLUTNM of \add_ln1353_10_reg_1610[11]_i_2\ : label is "soft_lutpair26";
  attribute SOFT_HLUTNM of \add_ln1353_10_reg_1610[12]_i_1\ : label is "soft_lutpair73";
  attribute SOFT_HLUTNM of \add_ln1353_10_reg_1610[3]_i_1\ : label is "soft_lutpair88";
  attribute SOFT_HLUTNM of \add_ln1353_10_reg_1610[4]_i_1\ : label is "soft_lutpair68";
  attribute SOFT_HLUTNM of \add_ln1353_10_reg_1610[5]_i_1\ : label is "soft_lutpair32";
  attribute SOFT_HLUTNM of \add_ln1353_10_reg_1610[6]_i_1\ : label is "soft_lutpair45";
  attribute SOFT_HLUTNM of \add_ln1353_10_reg_1610[8]_i_1\ : label is "soft_lutpair64";
  attribute SOFT_HLUTNM of \add_ln1353_10_reg_1610[9]_i_1\ : label is "soft_lutpair27";
  attribute SOFT_HLUTNM of \add_ln1353_12_reg_1632[10]_i_1\ : label is "soft_lutpair25";
  attribute SOFT_HLUTNM of \add_ln1353_12_reg_1632[11]_i_2\ : label is "soft_lutpair30";
  attribute SOFT_HLUTNM of \add_ln1353_12_reg_1632[12]_i_1\ : label is "soft_lutpair78";
  attribute SOFT_HLUTNM of \add_ln1353_12_reg_1632[4]_i_1\ : label is "soft_lutpair74";
  attribute SOFT_HLUTNM of \add_ln1353_12_reg_1632[5]_i_1\ : label is "soft_lutpair42";
  attribute SOFT_HLUTNM of \add_ln1353_12_reg_1632[6]_i_1\ : label is "soft_lutpair55";
  attribute SOFT_HLUTNM of \add_ln1353_12_reg_1632[8]_i_1\ : label is "soft_lutpair75";
  attribute SOFT_HLUTNM of \add_ln1353_12_reg_1632[9]_i_1\ : label is "soft_lutpair25";
  attribute SOFT_HLUTNM of \add_ln1353_14_reg_1654[10]_i_1\ : label is "soft_lutpair28";
  attribute SOFT_HLUTNM of \add_ln1353_14_reg_1654[11]_i_2\ : label is "soft_lutpair39";
  attribute SOFT_HLUTNM of \add_ln1353_14_reg_1654[12]_i_1\ : label is "soft_lutpair70";
  attribute SOFT_HLUTNM of \add_ln1353_14_reg_1654[3]_i_1\ : label is "soft_lutpair89";
  attribute SOFT_HLUTNM of \add_ln1353_14_reg_1654[4]_i_1\ : label is "soft_lutpair65";
  attribute SOFT_HLUTNM of \add_ln1353_14_reg_1654[5]_i_1\ : label is "soft_lutpair40";
  attribute SOFT_HLUTNM of \add_ln1353_14_reg_1654[6]_i_1\ : label is "soft_lutpair46";
  attribute SOFT_HLUTNM of \add_ln1353_14_reg_1654[8]_i_1\ : label is "soft_lutpair69";
  attribute SOFT_HLUTNM of \add_ln1353_14_reg_1654[9]_i_1\ : label is "soft_lutpair28";
  attribute SOFT_HLUTNM of \add_ln1353_2_reg_1534[10]_i_1\ : label is "soft_lutpair38";
  attribute SOFT_HLUTNM of \add_ln1353_2_reg_1534[11]_i_2\ : label is "soft_lutpair37";
  attribute SOFT_HLUTNM of \add_ln1353_2_reg_1534[12]_i_1\ : label is "soft_lutpair78";
  attribute SOFT_HLUTNM of \add_ln1353_2_reg_1534[1]_i_1\ : label is "soft_lutpair56";
  attribute SOFT_HLUTNM of \add_ln1353_2_reg_1534[3]_i_1\ : label is "soft_lutpair87";
  attribute SOFT_HLUTNM of \add_ln1353_2_reg_1534[4]_i_1\ : label is "soft_lutpair72";
  attribute SOFT_HLUTNM of \add_ln1353_2_reg_1534[5]_i_1\ : label is "soft_lutpair44";
  attribute SOFT_HLUTNM of \add_ln1353_2_reg_1534[6]_i_1\ : label is "soft_lutpair49";
  attribute SOFT_HLUTNM of \add_ln1353_2_reg_1534[8]_i_1\ : label is "soft_lutpair75";
  attribute SOFT_HLUTNM of \add_ln1353_2_reg_1534[9]_i_1\ : label is "soft_lutpair38";
  attribute SOFT_HLUTNM of \add_ln1353_4_reg_1556[10]_i_1\ : label is "soft_lutpair31";
  attribute SOFT_HLUTNM of \add_ln1353_4_reg_1556[11]_i_2\ : label is "soft_lutpair29";
  attribute SOFT_HLUTNM of \add_ln1353_4_reg_1556[12]_i_1\ : label is "soft_lutpair80";
  attribute SOFT_HLUTNM of \add_ln1353_4_reg_1556[1]_i_1\ : label is "soft_lutpair57";
  attribute SOFT_HLUTNM of \add_ln1353_4_reg_1556[4]_i_1\ : label is "soft_lutpair67";
  attribute SOFT_HLUTNM of \add_ln1353_4_reg_1556[5]_i_1\ : label is "soft_lutpair41";
  attribute SOFT_HLUTNM of \add_ln1353_4_reg_1556[6]_i_1\ : label is "soft_lutpair52";
  attribute SOFT_HLUTNM of \add_ln1353_4_reg_1556[8]_i_1\ : label is "soft_lutpair76";
  attribute SOFT_HLUTNM of \add_ln1353_4_reg_1556[9]_i_1\ : label is "soft_lutpair31";
  attribute SOFT_HLUTNM of \add_ln1353_6_reg_1578[10]_i_1\ : label is "soft_lutpair24";
  attribute SOFT_HLUTNM of \add_ln1353_6_reg_1578[11]_i_2\ : label is "soft_lutpair35";
  attribute SOFT_HLUTNM of \add_ln1353_6_reg_1578[12]_i_1\ : label is "soft_lutpair73";
  attribute SOFT_HLUTNM of \add_ln1353_6_reg_1578[1]_i_1\ : label is "soft_lutpair56";
  attribute SOFT_HLUTNM of \add_ln1353_6_reg_1578[3]_i_1\ : label is "soft_lutpair90";
  attribute SOFT_HLUTNM of \add_ln1353_6_reg_1578[4]_i_1\ : label is "soft_lutpair77";
  attribute SOFT_HLUTNM of \add_ln1353_6_reg_1578[5]_i_1\ : label is "soft_lutpair43";
  attribute SOFT_HLUTNM of \add_ln1353_6_reg_1578[6]_i_1\ : label is "soft_lutpair50";
  attribute SOFT_HLUTNM of \add_ln1353_6_reg_1578[8]_i_1\ : label is "soft_lutpair69";
  attribute SOFT_HLUTNM of \add_ln1353_6_reg_1578[9]_i_1\ : label is "soft_lutpair24";
  attribute SOFT_HLUTNM of \add_ln1353_8_reg_1484[0]_i_1\ : label is "soft_lutpair58";
  attribute SOFT_HLUTNM of \add_ln1353_8_reg_1484[10]_i_1\ : label is "soft_lutpair51";
  attribute SOFT_HLUTNM of \add_ln1353_8_reg_1484[1]_i_1\ : label is "soft_lutpair58";
  attribute SOFT_HLUTNM of \add_ln1353_8_reg_1484[3]_i_1\ : label is "soft_lutpair63";
  attribute SOFT_HLUTNM of \add_ln1353_8_reg_1484[4]_i_1\ : label is "soft_lutpair53";
  attribute SOFT_HLUTNM of \add_ln1353_8_reg_1484[5]_i_1\ : label is "soft_lutpair53";
  attribute SOFT_HLUTNM of \add_ln1353_8_reg_1484[7]_i_2\ : label is "soft_lutpair48";
  attribute SOFT_HLUTNM of \add_ln1353_8_reg_1484[8]_i_1\ : label is "soft_lutpair63";
  attribute SOFT_HLUTNM of \add_ln1353_8_reg_1484[8]_i_2\ : label is "soft_lutpair48";
  attribute SOFT_HLUTNM of \add_ln1353_8_reg_1484[9]_i_1\ : label is "soft_lutpair51";
  attribute SOFT_HLUTNM of \add_ln1353_reg_1512[0]_i_1\ : label is "soft_lutpair85";
  attribute SOFT_HLUTNM of \add_ln1353_reg_1512[10]_i_1\ : label is "soft_lutpair33";
  attribute SOFT_HLUTNM of \add_ln1353_reg_1512[11]_i_2\ : label is "soft_lutpair36";
  attribute SOFT_HLUTNM of \add_ln1353_reg_1512[12]_i_2\ : label is "soft_lutpair70";
  attribute SOFT_HLUTNM of \add_ln1353_reg_1512[1]_i_1\ : label is "soft_lutpair57";
  attribute SOFT_HLUTNM of \add_ln1353_reg_1512[4]_i_1\ : label is "soft_lutpair71";
  attribute SOFT_HLUTNM of \add_ln1353_reg_1512[5]_i_1\ : label is "soft_lutpair34";
  attribute SOFT_HLUTNM of \add_ln1353_reg_1512[6]_i_1\ : label is "soft_lutpair47";
  attribute SOFT_HLUTNM of \add_ln1353_reg_1512[8]_i_1\ : label is "soft_lutpair64";
  attribute SOFT_HLUTNM of \add_ln1353_reg_1512[9]_i_1\ : label is "soft_lutpair33";
  attribute SOFT_HLUTNM of \add_ln647_1_reg_1474[1]_i_1\ : label is "soft_lutpair82";
  attribute SOFT_HLUTNM of \add_ln647_1_reg_1474[2]_i_1\ : label is "soft_lutpair82";
  attribute SOFT_HLUTNM of \add_ln647_3_reg_1497[2]_i_1\ : label is "soft_lutpair83";
  attribute SOFT_HLUTNM of \add_ln647_4_reg_1502[2]_i_1\ : label is "soft_lutpair81";
  attribute SOFT_HLUTNM of \add_ln647_reg_1469[0]_i_1\ : label is "soft_lutpair86";
  attribute SOFT_HLUTNM of \add_ln647_reg_1469[2]_i_1\ : label is "soft_lutpair83";
  attribute SOFT_HLUTNM of \icmp_ln895_10_reg_1568[0]_i_4\ : label is "soft_lutpair41";
  attribute SOFT_HLUTNM of \icmp_ln895_11_reg_1590[0]_i_4\ : label is "soft_lutpair43";
  attribute SOFT_HLUTNM of \icmp_ln895_12_reg_1600[0]_i_4\ : label is "soft_lutpair79";
  attribute SOFT_HLUTNM of \icmp_ln895_13_reg_1622[0]_i_4\ : label is "soft_lutpair32";
  attribute SOFT_HLUTNM of \icmp_ln895_14_reg_1644[0]_i_4\ : label is "soft_lutpair42";
  attribute SOFT_HLUTNM of \icmp_ln895_15_reg_1666[0]_i_4\ : label is "soft_lutpair40";
  attribute SOFT_HLUTNM of \icmp_ln895_1_reg_1524[0]_i_4\ : label is "soft_lutpair34";
  attribute SOFT_HLUTNM of \icmp_ln895_1_reg_1524[0]_i_6\ : label is "soft_lutpair59";
  attribute SOFT_HLUTNM of \icmp_ln895_1_reg_1524[0]_i_8\ : label is "soft_lutpair80";
  attribute SOFT_HLUTNM of \icmp_ln895_9_reg_1546[0]_i_4\ : label is "soft_lutpair44";
  attribute SOFT_HLUTNM of \tmp_11_reg_1627[0]_i_1\ : label is "soft_lutpair88";
  attribute SOFT_HLUTNM of \tmp_11_reg_1627[1]_i_1\ : label is "soft_lutpair68";
  attribute SOFT_HLUTNM of \tmp_11_reg_1627[2]_i_1\ : label is "soft_lutpair45";
  attribute SOFT_HLUTNM of \tmp_11_reg_1627[3]_i_1\ : label is "soft_lutpair26";
  attribute SOFT_HLUTNM of \tmp_11_reg_1627[7]_i_1\ : label is "soft_lutpair61";
  attribute SOFT_HLUTNM of \tmp_13_reg_1649[1]_i_1\ : label is "soft_lutpair74";
  attribute SOFT_HLUTNM of \tmp_13_reg_1649[2]_i_1\ : label is "soft_lutpair55";
  attribute SOFT_HLUTNM of \tmp_13_reg_1649[3]_i_1\ : label is "soft_lutpair30";
  attribute SOFT_HLUTNM of \tmp_13_reg_1649[7]_i_1\ : label is "soft_lutpair62";
  attribute SOFT_HLUTNM of \tmp_15_reg_1671[0]_i_1\ : label is "soft_lutpair89";
  attribute SOFT_HLUTNM of \tmp_15_reg_1671[1]_i_1\ : label is "soft_lutpair65";
  attribute SOFT_HLUTNM of \tmp_15_reg_1671[2]_i_1\ : label is "soft_lutpair46";
  attribute SOFT_HLUTNM of \tmp_15_reg_1671[3]_i_1\ : label is "soft_lutpair39";
  attribute SOFT_HLUTNM of \tmp_15_reg_1671[7]_i_1\ : label is "soft_lutpair60";
  attribute SOFT_HLUTNM of \tmp_1_reg_1529[0]_i_2\ : label is "soft_lutpair85";
  attribute SOFT_HLUTNM of \tmp_1_reg_1529[1]_i_1\ : label is "soft_lutpair71";
  attribute SOFT_HLUTNM of \tmp_1_reg_1529[2]_i_1\ : label is "soft_lutpair47";
  attribute SOFT_HLUTNM of \tmp_1_reg_1529[3]_i_1\ : label is "soft_lutpair36";
  attribute SOFT_HLUTNM of \tmp_1_reg_1529[6]_i_4\ : label is "soft_lutpair76";
  attribute SOFT_HLUTNM of \tmp_1_reg_1529[7]_i_1\ : label is "soft_lutpair59";
  attribute SOFT_HLUTNM of \tmp_3_reg_1551[0]_i_1\ : label is "soft_lutpair87";
  attribute SOFT_HLUTNM of \tmp_3_reg_1551[1]_i_1\ : label is "soft_lutpair72";
  attribute SOFT_HLUTNM of \tmp_3_reg_1551[2]_i_1\ : label is "soft_lutpair49";
  attribute SOFT_HLUTNM of \tmp_3_reg_1551[3]_i_1\ : label is "soft_lutpair37";
  attribute SOFT_HLUTNM of \tmp_3_reg_1551[7]_i_1\ : label is "soft_lutpair61";
  attribute SOFT_HLUTNM of \tmp_5_reg_1573[1]_i_1\ : label is "soft_lutpair67";
  attribute SOFT_HLUTNM of \tmp_5_reg_1573[2]_i_1\ : label is "soft_lutpair52";
  attribute SOFT_HLUTNM of \tmp_5_reg_1573[3]_i_1\ : label is "soft_lutpair29";
  attribute SOFT_HLUTNM of \tmp_5_reg_1573[7]_i_1\ : label is "soft_lutpair62";
  attribute SOFT_HLUTNM of \tmp_7_reg_1595[0]_i_1\ : label is "soft_lutpair90";
  attribute SOFT_HLUTNM of \tmp_7_reg_1595[1]_i_1\ : label is "soft_lutpair77";
  attribute SOFT_HLUTNM of \tmp_7_reg_1595[2]_i_1\ : label is "soft_lutpair50";
  attribute SOFT_HLUTNM of \tmp_7_reg_1595[3]_i_1\ : label is "soft_lutpair35";
  attribute SOFT_HLUTNM of \tmp_7_reg_1595[7]_i_1\ : label is "soft_lutpair60";
  attribute SOFT_HLUTNM of \tmp_9_reg_1605[0]_i_1\ : label is "soft_lutpair84";
  attribute SOFT_HLUTNM of \tmp_9_reg_1605[1]_i_1\ : label is "soft_lutpair84";
  attribute SOFT_HLUTNM of \tmp_9_reg_1605[2]_i_1\ : label is "soft_lutpair79";
  attribute SOFT_HLUTNM of \tmp_9_reg_1605[3]_i_1\ : label is "soft_lutpair54";
  attribute SOFT_HLUTNM of \tmp_9_reg_1605[4]_i_1\ : label is "soft_lutpair54";
  attribute SOFT_HLUTNM of \tmp_9_reg_1605[6]_i_1\ : label is "soft_lutpair66";
  attribute SOFT_HLUTNM of \tmp_9_reg_1605[7]_i_1\ : label is "soft_lutpair66";
  attribute SOFT_HLUTNM of \trunc_ln647_reg_1464[1]_i_1\ : label is "soft_lutpair86";
  attribute SOFT_HLUTNM of \trunc_ln647_reg_1464[2]_i_1\ : label is "soft_lutpair81";
begin
  \^ap_start\ <= ap_start;
  ap_done <= \^ap_done\;
  ap_ready <= \^ap_start\;
\add_ln1353_10_reg_1610[10]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7FFF8000"
    )
        port map (
      I0 => zext_ln215_reg_1453(9),
      I1 => zext_ln215_reg_1453(7),
      I2 => zext_ln215_reg_1453(8),
      I3 => \add_ln1353_10_reg_1610[11]_i_2_n_0\,
      I4 => zext_ln215_reg_1453(10),
      O => add_ln1353_10_fu_744_p2(10)
    );
\add_ln1353_10_reg_1610[11]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7FFFFFFF80000000"
    )
        port map (
      I0 => zext_ln215_reg_1453(9),
      I1 => zext_ln215_reg_1453(10),
      I2 => zext_ln215_reg_1453(7),
      I3 => zext_ln215_reg_1453(8),
      I4 => \add_ln1353_10_reg_1610[11]_i_2_n_0\,
      I5 => zext_ln215_reg_1453(11),
      O => add_ln1353_10_fu_744_p2(11)
    );
\add_ln1353_10_reg_1610[11]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"80000000"
    )
        port map (
      I0 => zext_ln215_reg_1453(5),
      I1 => zext_ln215_reg_1453(6),
      I2 => \tmp_11_reg_1627[6]_i_2_n_0\,
      I3 => zext_ln215_reg_1453(4),
      I4 => zext_ln215_reg_1453(3),
      O => \add_ln1353_10_reg_1610[11]_i_2_n_0\
    );
\add_ln1353_10_reg_1610[12]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"80"
    )
        port map (
      I0 => zext_ln215_reg_1453(7),
      I1 => zext_ln215_reg_1453(8),
      I2 => \add_ln1353_10_reg_1610[11]_i_2_n_0\,
      O => \add_ln1353_10_reg_1610[12]_i_1_n_0\
    );
\add_ln1353_10_reg_1610[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9999966696666666"
    )
        port map (
      I0 => zext_ln215_reg_1453(2),
      I1 => add_ln647_3_reg_1497(2),
      I2 => add_ln647_reg_1469(0),
      I3 => zext_ln215_reg_1453(0),
      I4 => zext_ln215_reg_1453(1),
      I5 => add_ln647_reg_1469(1),
      O => add_ln1353_10_fu_744_p2(2)
    );
\add_ln1353_10_reg_1610[3]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \tmp_11_reg_1627[6]_i_2_n_0\,
      I1 => zext_ln215_reg_1453(3),
      O => add_ln1353_10_fu_744_p2(3)
    );
\add_ln1353_10_reg_1610[4]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"78"
    )
        port map (
      I0 => zext_ln215_reg_1453(3),
      I1 => \tmp_11_reg_1627[6]_i_2_n_0\,
      I2 => zext_ln215_reg_1453(4),
      O => add_ln1353_10_fu_744_p2(4)
    );
\add_ln1353_10_reg_1610[5]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7F80"
    )
        port map (
      I0 => \tmp_11_reg_1627[6]_i_2_n_0\,
      I1 => zext_ln215_reg_1453(4),
      I2 => zext_ln215_reg_1453(3),
      I3 => zext_ln215_reg_1453(5),
      O => add_ln1353_10_fu_744_p2(5)
    );
\add_ln1353_10_reg_1610[6]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7FFF8000"
    )
        port map (
      I0 => zext_ln215_reg_1453(5),
      I1 => zext_ln215_reg_1453(3),
      I2 => zext_ln215_reg_1453(4),
      I3 => \tmp_11_reg_1627[6]_i_2_n_0\,
      I4 => zext_ln215_reg_1453(6),
      O => add_ln1353_10_fu_744_p2(6)
    );
\add_ln1353_10_reg_1610[7]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7FFFFFFF80000000"
    )
        port map (
      I0 => zext_ln215_reg_1453(3),
      I1 => zext_ln215_reg_1453(4),
      I2 => \tmp_11_reg_1627[6]_i_2_n_0\,
      I3 => zext_ln215_reg_1453(6),
      I4 => zext_ln215_reg_1453(5),
      I5 => zext_ln215_reg_1453(7),
      O => add_ln1353_10_fu_744_p2(7)
    );
\add_ln1353_10_reg_1610[8]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"78"
    )
        port map (
      I0 => zext_ln215_reg_1453(7),
      I1 => \add_ln1353_10_reg_1610[11]_i_2_n_0\,
      I2 => zext_ln215_reg_1453(8),
      O => add_ln1353_10_fu_744_p2(8)
    );
\add_ln1353_10_reg_1610[9]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7F80"
    )
        port map (
      I0 => \add_ln1353_10_reg_1610[11]_i_2_n_0\,
      I1 => zext_ln215_reg_1453(8),
      I2 => zext_ln215_reg_1453(7),
      I3 => zext_ln215_reg_1453(9),
      O => add_ln1353_10_fu_744_p2(9)
    );
\add_ln1353_10_reg_1610_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => add_ln1353_10_fu_744_p2(10),
      Q => add_ln1353_10_reg_1610(10),
      R => '0'
    );
\add_ln1353_10_reg_1610_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => add_ln1353_10_fu_744_p2(11),
      Q => add_ln1353_10_reg_1610(11),
      R => '0'
    );
\add_ln1353_10_reg_1610_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => \add_ln1353_10_reg_1610[12]_i_1_n_0\,
      Q => add_ln1353_10_reg_1610(12),
      R => \add_ln1353_reg_1512[12]_i_1_n_0\
    );
\add_ln1353_10_reg_1610_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => add_ln1353_10_fu_744_p2(2),
      Q => add_ln1353_10_reg_1610(2),
      R => '0'
    );
\add_ln1353_10_reg_1610_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => add_ln1353_10_fu_744_p2(3),
      Q => add_ln1353_10_reg_1610(3),
      R => '0'
    );
\add_ln1353_10_reg_1610_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => add_ln1353_10_fu_744_p2(4),
      Q => add_ln1353_10_reg_1610(4),
      R => '0'
    );
\add_ln1353_10_reg_1610_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => add_ln1353_10_fu_744_p2(5),
      Q => add_ln1353_10_reg_1610(5),
      R => '0'
    );
\add_ln1353_10_reg_1610_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => add_ln1353_10_fu_744_p2(6),
      Q => add_ln1353_10_reg_1610(6),
      R => '0'
    );
\add_ln1353_10_reg_1610_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => add_ln1353_10_fu_744_p2(7),
      Q => add_ln1353_10_reg_1610(7),
      R => '0'
    );
\add_ln1353_10_reg_1610_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => add_ln1353_10_fu_744_p2(8),
      Q => add_ln1353_10_reg_1610(8),
      R => '0'
    );
\add_ln1353_10_reg_1610_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => add_ln1353_10_fu_744_p2(9),
      Q => add_ln1353_10_reg_1610(9),
      R => '0'
    );
\add_ln1353_12_reg_1632[10]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7FFF8000"
    )
        port map (
      I0 => zext_ln215_reg_1453(9),
      I1 => zext_ln215_reg_1453(7),
      I2 => zext_ln215_reg_1453(8),
      I3 => \add_ln1353_12_reg_1632[11]_i_2_n_0\,
      I4 => zext_ln215_reg_1453(10),
      O => add_ln1353_12_fu_784_p2(10)
    );
\add_ln1353_12_reg_1632[11]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7FFFFFFF80000000"
    )
        port map (
      I0 => zext_ln215_reg_1453(9),
      I1 => zext_ln215_reg_1453(10),
      I2 => zext_ln215_reg_1453(7),
      I3 => zext_ln215_reg_1453(8),
      I4 => \add_ln1353_12_reg_1632[11]_i_2_n_0\,
      I5 => zext_ln215_reg_1453(11),
      O => add_ln1353_12_fu_784_p2(11)
    );
\add_ln1353_12_reg_1632[11]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"80000000"
    )
        port map (
      I0 => zext_ln215_reg_1453(5),
      I1 => zext_ln215_reg_1453(6),
      I2 => \tmp_13_reg_1649[6]_i_2_n_0\,
      I3 => zext_ln215_reg_1453(4),
      I4 => zext_ln215_reg_1453(3),
      O => \add_ln1353_12_reg_1632[11]_i_2_n_0\
    );
\add_ln1353_12_reg_1632[12]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"80"
    )
        port map (
      I0 => zext_ln215_reg_1453(7),
      I1 => zext_ln215_reg_1453(8),
      I2 => \add_ln1353_12_reg_1632[11]_i_2_n_0\,
      O => \add_ln1353_12_reg_1632[12]_i_1_n_0\
    );
\add_ln1353_12_reg_1632[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9996969696666666"
    )
        port map (
      I0 => zext_ln215_reg_1453(2),
      I1 => add_ln647_4_reg_1502(2),
      I2 => zext_ln215_reg_1453(1),
      I3 => trunc_ln647_reg_1464(0),
      I4 => zext_ln215_reg_1453(0),
      I5 => add_ln647_1_reg_1474(1),
      O => add_ln1353_12_fu_784_p2(2)
    );
\add_ln1353_12_reg_1632[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"001717FFFFE8E800"
    )
        port map (
      I0 => zext_ln215_reg_1453(1),
      I1 => \tmp_1_reg_1529[0]_i_2_n_0\,
      I2 => add_ln647_1_reg_1474(1),
      I3 => zext_ln215_reg_1453(2),
      I4 => add_ln647_4_reg_1502(2),
      I5 => zext_ln215_reg_1453(3),
      O => add_ln1353_12_fu_784_p2(3)
    );
\add_ln1353_12_reg_1632[4]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"78"
    )
        port map (
      I0 => zext_ln215_reg_1453(3),
      I1 => \tmp_13_reg_1649[6]_i_2_n_0\,
      I2 => zext_ln215_reg_1453(4),
      O => add_ln1353_12_fu_784_p2(4)
    );
\add_ln1353_12_reg_1632[5]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7F80"
    )
        port map (
      I0 => \tmp_13_reg_1649[6]_i_2_n_0\,
      I1 => zext_ln215_reg_1453(4),
      I2 => zext_ln215_reg_1453(3),
      I3 => zext_ln215_reg_1453(5),
      O => add_ln1353_12_fu_784_p2(5)
    );
\add_ln1353_12_reg_1632[6]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7FFF8000"
    )
        port map (
      I0 => zext_ln215_reg_1453(5),
      I1 => zext_ln215_reg_1453(3),
      I2 => zext_ln215_reg_1453(4),
      I3 => \tmp_13_reg_1649[6]_i_2_n_0\,
      I4 => zext_ln215_reg_1453(6),
      O => add_ln1353_12_fu_784_p2(6)
    );
\add_ln1353_12_reg_1632[7]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7FFFFFFF80000000"
    )
        port map (
      I0 => zext_ln215_reg_1453(3),
      I1 => zext_ln215_reg_1453(4),
      I2 => \tmp_13_reg_1649[6]_i_2_n_0\,
      I3 => zext_ln215_reg_1453(6),
      I4 => zext_ln215_reg_1453(5),
      I5 => zext_ln215_reg_1453(7),
      O => add_ln1353_12_fu_784_p2(7)
    );
\add_ln1353_12_reg_1632[8]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"78"
    )
        port map (
      I0 => zext_ln215_reg_1453(7),
      I1 => \add_ln1353_12_reg_1632[11]_i_2_n_0\,
      I2 => zext_ln215_reg_1453(8),
      O => add_ln1353_12_fu_784_p2(8)
    );
\add_ln1353_12_reg_1632[9]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7F80"
    )
        port map (
      I0 => \add_ln1353_12_reg_1632[11]_i_2_n_0\,
      I1 => zext_ln215_reg_1453(8),
      I2 => zext_ln215_reg_1453(7),
      I3 => zext_ln215_reg_1453(9),
      O => add_ln1353_12_fu_784_p2(9)
    );
\add_ln1353_12_reg_1632_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => add_ln1353_12_fu_784_p2(10),
      Q => add_ln1353_12_reg_1632(10),
      R => '0'
    );
\add_ln1353_12_reg_1632_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => add_ln1353_12_fu_784_p2(11),
      Q => add_ln1353_12_reg_1632(11),
      R => '0'
    );
\add_ln1353_12_reg_1632_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => \add_ln1353_12_reg_1632[12]_i_1_n_0\,
      Q => add_ln1353_12_reg_1632(12),
      R => \add_ln1353_reg_1512[12]_i_1_n_0\
    );
\add_ln1353_12_reg_1632_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => add_ln1353_12_fu_784_p2(2),
      Q => add_ln1353_12_reg_1632(2),
      R => '0'
    );
\add_ln1353_12_reg_1632_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => add_ln1353_12_fu_784_p2(3),
      Q => add_ln1353_12_reg_1632(3),
      R => '0'
    );
\add_ln1353_12_reg_1632_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => add_ln1353_12_fu_784_p2(4),
      Q => add_ln1353_12_reg_1632(4),
      R => '0'
    );
\add_ln1353_12_reg_1632_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => add_ln1353_12_fu_784_p2(5),
      Q => add_ln1353_12_reg_1632(5),
      R => '0'
    );
\add_ln1353_12_reg_1632_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => add_ln1353_12_fu_784_p2(6),
      Q => add_ln1353_12_reg_1632(6),
      R => '0'
    );
\add_ln1353_12_reg_1632_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => add_ln1353_12_fu_784_p2(7),
      Q => add_ln1353_12_reg_1632(7),
      R => '0'
    );
\add_ln1353_12_reg_1632_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => add_ln1353_12_fu_784_p2(8),
      Q => add_ln1353_12_reg_1632(8),
      R => '0'
    );
\add_ln1353_12_reg_1632_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => add_ln1353_12_fu_784_p2(9),
      Q => add_ln1353_12_reg_1632(9),
      R => '0'
    );
\add_ln1353_14_reg_1654[10]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7FFF8000"
    )
        port map (
      I0 => zext_ln215_reg_1453(9),
      I1 => zext_ln215_reg_1453(7),
      I2 => zext_ln215_reg_1453(8),
      I3 => \add_ln1353_14_reg_1654[11]_i_2_n_0\,
      I4 => zext_ln215_reg_1453(10),
      O => add_ln1353_14_fu_824_p2(10)
    );
\add_ln1353_14_reg_1654[11]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7FFFFFFF80000000"
    )
        port map (
      I0 => zext_ln215_reg_1453(9),
      I1 => zext_ln215_reg_1453(10),
      I2 => zext_ln215_reg_1453(7),
      I3 => zext_ln215_reg_1453(8),
      I4 => \add_ln1353_14_reg_1654[11]_i_2_n_0\,
      I5 => zext_ln215_reg_1453(11),
      O => add_ln1353_14_fu_824_p2(11)
    );
\add_ln1353_14_reg_1654[11]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"80000000"
    )
        port map (
      I0 => zext_ln215_reg_1453(5),
      I1 => zext_ln215_reg_1453(6),
      I2 => \tmp_15_reg_1671[6]_i_2_n_0\,
      I3 => zext_ln215_reg_1453(4),
      I4 => zext_ln215_reg_1453(3),
      O => \add_ln1353_14_reg_1654[11]_i_2_n_0\
    );
\add_ln1353_14_reg_1654[12]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"80"
    )
        port map (
      I0 => zext_ln215_reg_1453(7),
      I1 => zext_ln215_reg_1453(8),
      I2 => \add_ln1353_14_reg_1654[11]_i_2_n_0\,
      O => \add_ln1353_14_reg_1654[12]_i_1_n_0\
    );
\add_ln1353_14_reg_1654[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9999966696666666"
    )
        port map (
      I0 => zext_ln215_reg_1453(2),
      I1 => add_ln647_5_reg_1507(2),
      I2 => add_ln647_reg_1469(0),
      I3 => zext_ln215_reg_1453(0),
      I4 => zext_ln215_reg_1453(1),
      I5 => add_ln647_2_reg_1479(1),
      O => add_ln1353_14_fu_824_p2(2)
    );
\add_ln1353_14_reg_1654[3]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \tmp_15_reg_1671[6]_i_2_n_0\,
      I1 => zext_ln215_reg_1453(3),
      O => add_ln1353_14_fu_824_p2(3)
    );
\add_ln1353_14_reg_1654[4]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"78"
    )
        port map (
      I0 => zext_ln215_reg_1453(3),
      I1 => \tmp_15_reg_1671[6]_i_2_n_0\,
      I2 => zext_ln215_reg_1453(4),
      O => add_ln1353_14_fu_824_p2(4)
    );
\add_ln1353_14_reg_1654[5]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7F80"
    )
        port map (
      I0 => \tmp_15_reg_1671[6]_i_2_n_0\,
      I1 => zext_ln215_reg_1453(4),
      I2 => zext_ln215_reg_1453(3),
      I3 => zext_ln215_reg_1453(5),
      O => add_ln1353_14_fu_824_p2(5)
    );
\add_ln1353_14_reg_1654[6]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7FFF8000"
    )
        port map (
      I0 => zext_ln215_reg_1453(5),
      I1 => zext_ln215_reg_1453(3),
      I2 => zext_ln215_reg_1453(4),
      I3 => \tmp_15_reg_1671[6]_i_2_n_0\,
      I4 => zext_ln215_reg_1453(6),
      O => add_ln1353_14_fu_824_p2(6)
    );
\add_ln1353_14_reg_1654[7]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7FFFFFFF80000000"
    )
        port map (
      I0 => zext_ln215_reg_1453(3),
      I1 => zext_ln215_reg_1453(4),
      I2 => \tmp_15_reg_1671[6]_i_2_n_0\,
      I3 => zext_ln215_reg_1453(6),
      I4 => zext_ln215_reg_1453(5),
      I5 => zext_ln215_reg_1453(7),
      O => add_ln1353_14_fu_824_p2(7)
    );
\add_ln1353_14_reg_1654[8]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"78"
    )
        port map (
      I0 => zext_ln215_reg_1453(7),
      I1 => \add_ln1353_14_reg_1654[11]_i_2_n_0\,
      I2 => zext_ln215_reg_1453(8),
      O => add_ln1353_14_fu_824_p2(8)
    );
\add_ln1353_14_reg_1654[9]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7F80"
    )
        port map (
      I0 => \add_ln1353_14_reg_1654[11]_i_2_n_0\,
      I1 => zext_ln215_reg_1453(8),
      I2 => zext_ln215_reg_1453(7),
      I3 => zext_ln215_reg_1453(9),
      O => add_ln1353_14_fu_824_p2(9)
    );
\add_ln1353_14_reg_1654_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => add_ln1353_14_fu_824_p2(10),
      Q => add_ln1353_14_reg_1654(10),
      R => '0'
    );
\add_ln1353_14_reg_1654_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => add_ln1353_14_fu_824_p2(11),
      Q => add_ln1353_14_reg_1654(11),
      R => '0'
    );
\add_ln1353_14_reg_1654_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => \add_ln1353_14_reg_1654[12]_i_1_n_0\,
      Q => add_ln1353_14_reg_1654(12),
      R => \add_ln1353_reg_1512[12]_i_1_n_0\
    );
\add_ln1353_14_reg_1654_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => add_ln1353_14_fu_824_p2(2),
      Q => add_ln1353_14_reg_1654(2),
      R => '0'
    );
\add_ln1353_14_reg_1654_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => add_ln1353_14_fu_824_p2(3),
      Q => add_ln1353_14_reg_1654(3),
      R => '0'
    );
\add_ln1353_14_reg_1654_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => add_ln1353_14_fu_824_p2(4),
      Q => add_ln1353_14_reg_1654(4),
      R => '0'
    );
\add_ln1353_14_reg_1654_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => add_ln1353_14_fu_824_p2(5),
      Q => add_ln1353_14_reg_1654(5),
      R => '0'
    );
\add_ln1353_14_reg_1654_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => add_ln1353_14_fu_824_p2(6),
      Q => add_ln1353_14_reg_1654(6),
      R => '0'
    );
\add_ln1353_14_reg_1654_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => add_ln1353_14_fu_824_p2(7),
      Q => add_ln1353_14_reg_1654(7),
      R => '0'
    );
\add_ln1353_14_reg_1654_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => add_ln1353_14_fu_824_p2(8),
      Q => add_ln1353_14_reg_1654(8),
      R => '0'
    );
\add_ln1353_14_reg_1654_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => add_ln1353_14_fu_824_p2(9),
      Q => add_ln1353_14_reg_1654(9),
      R => '0'
    );
\add_ln1353_2_reg_1534[0]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => add_ln647_reg_1469(0),
      I1 => zext_ln215_reg_1453(0),
      O => add_ln1353_2_fu_603_p2(0)
    );
\add_ln1353_2_reg_1534[10]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7FFF8000"
    )
        port map (
      I0 => zext_ln215_reg_1453(9),
      I1 => zext_ln215_reg_1453(7),
      I2 => zext_ln215_reg_1453(8),
      I3 => \add_ln1353_2_reg_1534[11]_i_2_n_0\,
      I4 => zext_ln215_reg_1453(10),
      O => add_ln1353_2_fu_603_p2(10)
    );
\add_ln1353_2_reg_1534[11]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7FFFFFFF80000000"
    )
        port map (
      I0 => zext_ln215_reg_1453(9),
      I1 => zext_ln215_reg_1453(10),
      I2 => zext_ln215_reg_1453(7),
      I3 => zext_ln215_reg_1453(8),
      I4 => \add_ln1353_2_reg_1534[11]_i_2_n_0\,
      I5 => zext_ln215_reg_1453(11),
      O => add_ln1353_2_fu_603_p2(11)
    );
\add_ln1353_2_reg_1534[11]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"80000000"
    )
        port map (
      I0 => zext_ln215_reg_1453(5),
      I1 => zext_ln215_reg_1453(6),
      I2 => \tmp_3_reg_1551[6]_i_2_n_0\,
      I3 => zext_ln215_reg_1453(4),
      I4 => zext_ln215_reg_1453(3),
      O => \add_ln1353_2_reg_1534[11]_i_2_n_0\
    );
\add_ln1353_2_reg_1534[12]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"80"
    )
        port map (
      I0 => zext_ln215_reg_1453(7),
      I1 => zext_ln215_reg_1453(8),
      I2 => \add_ln1353_2_reg_1534[11]_i_2_n_0\,
      O => \add_ln1353_2_reg_1534[12]_i_1_n_0\
    );
\add_ln1353_2_reg_1534[1]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"956A"
    )
        port map (
      I0 => add_ln647_reg_1469(1),
      I1 => add_ln647_reg_1469(0),
      I2 => zext_ln215_reg_1453(0),
      I3 => zext_ln215_reg_1453(1),
      O => add_ln1353_2_fu_603_p2(1)
    );
\add_ln1353_2_reg_1534[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9999966696666666"
    )
        port map (
      I0 => zext_ln215_reg_1453(2),
      I1 => add_ln647_reg_1469(2),
      I2 => add_ln647_reg_1469(0),
      I3 => zext_ln215_reg_1453(0),
      I4 => zext_ln215_reg_1453(1),
      I5 => add_ln647_reg_1469(1),
      O => add_ln1353_2_fu_603_p2(2)
    );
\add_ln1353_2_reg_1534[3]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \tmp_3_reg_1551[6]_i_2_n_0\,
      I1 => zext_ln215_reg_1453(3),
      O => add_ln1353_2_fu_603_p2(3)
    );
\add_ln1353_2_reg_1534[4]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"78"
    )
        port map (
      I0 => zext_ln215_reg_1453(3),
      I1 => \tmp_3_reg_1551[6]_i_2_n_0\,
      I2 => zext_ln215_reg_1453(4),
      O => add_ln1353_2_fu_603_p2(4)
    );
\add_ln1353_2_reg_1534[5]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7F80"
    )
        port map (
      I0 => \tmp_3_reg_1551[6]_i_2_n_0\,
      I1 => zext_ln215_reg_1453(4),
      I2 => zext_ln215_reg_1453(3),
      I3 => zext_ln215_reg_1453(5),
      O => add_ln1353_2_fu_603_p2(5)
    );
\add_ln1353_2_reg_1534[6]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7FFF8000"
    )
        port map (
      I0 => zext_ln215_reg_1453(5),
      I1 => zext_ln215_reg_1453(3),
      I2 => zext_ln215_reg_1453(4),
      I3 => \tmp_3_reg_1551[6]_i_2_n_0\,
      I4 => zext_ln215_reg_1453(6),
      O => add_ln1353_2_fu_603_p2(6)
    );
\add_ln1353_2_reg_1534[7]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7FFFFFFF80000000"
    )
        port map (
      I0 => zext_ln215_reg_1453(3),
      I1 => zext_ln215_reg_1453(4),
      I2 => \tmp_3_reg_1551[6]_i_2_n_0\,
      I3 => zext_ln215_reg_1453(6),
      I4 => zext_ln215_reg_1453(5),
      I5 => zext_ln215_reg_1453(7),
      O => add_ln1353_2_fu_603_p2(7)
    );
\add_ln1353_2_reg_1534[8]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"78"
    )
        port map (
      I0 => zext_ln215_reg_1453(7),
      I1 => \add_ln1353_2_reg_1534[11]_i_2_n_0\,
      I2 => zext_ln215_reg_1453(8),
      O => add_ln1353_2_fu_603_p2(8)
    );
\add_ln1353_2_reg_1534[9]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7F80"
    )
        port map (
      I0 => \add_ln1353_2_reg_1534[11]_i_2_n_0\,
      I1 => zext_ln215_reg_1453(8),
      I2 => zext_ln215_reg_1453(7),
      I3 => zext_ln215_reg_1453(9),
      O => add_ln1353_2_fu_603_p2(9)
    );
\add_ln1353_2_reg_1534_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => add_ln1353_2_fu_603_p2(0),
      Q => add_ln1353_2_reg_1534(0),
      R => '0'
    );
\add_ln1353_2_reg_1534_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => add_ln1353_2_fu_603_p2(10),
      Q => add_ln1353_2_reg_1534(10),
      R => '0'
    );
\add_ln1353_2_reg_1534_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => add_ln1353_2_fu_603_p2(11),
      Q => add_ln1353_2_reg_1534(11),
      R => '0'
    );
\add_ln1353_2_reg_1534_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => \add_ln1353_2_reg_1534[12]_i_1_n_0\,
      Q => add_ln1353_2_reg_1534(12),
      R => \add_ln1353_reg_1512[12]_i_1_n_0\
    );
\add_ln1353_2_reg_1534_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => add_ln1353_2_fu_603_p2(1),
      Q => add_ln1353_2_reg_1534(1),
      R => '0'
    );
\add_ln1353_2_reg_1534_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => add_ln1353_2_fu_603_p2(2),
      Q => add_ln1353_2_reg_1534(2),
      R => '0'
    );
\add_ln1353_2_reg_1534_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => add_ln1353_2_fu_603_p2(3),
      Q => add_ln1353_2_reg_1534(3),
      R => '0'
    );
\add_ln1353_2_reg_1534_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => add_ln1353_2_fu_603_p2(4),
      Q => add_ln1353_2_reg_1534(4),
      R => '0'
    );
\add_ln1353_2_reg_1534_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => add_ln1353_2_fu_603_p2(5),
      Q => add_ln1353_2_reg_1534(5),
      R => '0'
    );
\add_ln1353_2_reg_1534_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => add_ln1353_2_fu_603_p2(6),
      Q => add_ln1353_2_reg_1534(6),
      R => '0'
    );
\add_ln1353_2_reg_1534_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => add_ln1353_2_fu_603_p2(7),
      Q => add_ln1353_2_reg_1534(7),
      R => '0'
    );
\add_ln1353_2_reg_1534_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => add_ln1353_2_fu_603_p2(8),
      Q => add_ln1353_2_reg_1534(8),
      R => '0'
    );
\add_ln1353_2_reg_1534_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => add_ln1353_2_fu_603_p2(9),
      Q => add_ln1353_2_reg_1534(9),
      R => '0'
    );
\add_ln1353_4_reg_1556[10]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7FFF8000"
    )
        port map (
      I0 => zext_ln215_reg_1453(9),
      I1 => zext_ln215_reg_1453(7),
      I2 => zext_ln215_reg_1453(8),
      I3 => \add_ln1353_4_reg_1556[11]_i_2_n_0\,
      I4 => zext_ln215_reg_1453(10),
      O => add_ln1353_4_fu_643_p2(10)
    );
\add_ln1353_4_reg_1556[11]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7FFFFFFF80000000"
    )
        port map (
      I0 => zext_ln215_reg_1453(9),
      I1 => zext_ln215_reg_1453(10),
      I2 => zext_ln215_reg_1453(7),
      I3 => zext_ln215_reg_1453(8),
      I4 => \add_ln1353_4_reg_1556[11]_i_2_n_0\,
      I5 => zext_ln215_reg_1453(11),
      O => add_ln1353_4_fu_643_p2(11)
    );
\add_ln1353_4_reg_1556[11]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"80000000"
    )
        port map (
      I0 => zext_ln215_reg_1453(5),
      I1 => zext_ln215_reg_1453(6),
      I2 => \tmp_5_reg_1573[6]_i_2_n_0\,
      I3 => zext_ln215_reg_1453(4),
      I4 => zext_ln215_reg_1453(3),
      O => \add_ln1353_4_reg_1556[11]_i_2_n_0\
    );
\add_ln1353_4_reg_1556[12]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"80"
    )
        port map (
      I0 => zext_ln215_reg_1453(7),
      I1 => zext_ln215_reg_1453(8),
      I2 => \add_ln1353_4_reg_1556[11]_i_2_n_0\,
      O => \add_ln1353_4_reg_1556[12]_i_1_n_0\
    );
\add_ln1353_4_reg_1556[1]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9666"
    )
        port map (
      I0 => zext_ln215_reg_1453(1),
      I1 => add_ln647_1_reg_1474(1),
      I2 => trunc_ln647_reg_1464(0),
      I3 => zext_ln215_reg_1453(0),
      O => add_ln1353_4_fu_643_p2(1)
    );
\add_ln1353_4_reg_1556[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9996969696666666"
    )
        port map (
      I0 => zext_ln215_reg_1453(2),
      I1 => add_ln647_1_reg_1474(2),
      I2 => zext_ln215_reg_1453(1),
      I3 => trunc_ln647_reg_1464(0),
      I4 => zext_ln215_reg_1453(0),
      I5 => add_ln647_1_reg_1474(1),
      O => add_ln1353_4_fu_643_p2(2)
    );
\add_ln1353_4_reg_1556[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"001717FFFFE8E800"
    )
        port map (
      I0 => zext_ln215_reg_1453(1),
      I1 => \tmp_1_reg_1529[0]_i_2_n_0\,
      I2 => add_ln647_1_reg_1474(1),
      I3 => zext_ln215_reg_1453(2),
      I4 => add_ln647_1_reg_1474(2),
      I5 => zext_ln215_reg_1453(3),
      O => add_ln1353_4_fu_643_p2(3)
    );
\add_ln1353_4_reg_1556[4]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"78"
    )
        port map (
      I0 => zext_ln215_reg_1453(3),
      I1 => \tmp_5_reg_1573[6]_i_2_n_0\,
      I2 => zext_ln215_reg_1453(4),
      O => add_ln1353_4_fu_643_p2(4)
    );
\add_ln1353_4_reg_1556[5]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7F80"
    )
        port map (
      I0 => \tmp_5_reg_1573[6]_i_2_n_0\,
      I1 => zext_ln215_reg_1453(4),
      I2 => zext_ln215_reg_1453(3),
      I3 => zext_ln215_reg_1453(5),
      O => add_ln1353_4_fu_643_p2(5)
    );
\add_ln1353_4_reg_1556[6]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7FFF8000"
    )
        port map (
      I0 => zext_ln215_reg_1453(5),
      I1 => zext_ln215_reg_1453(3),
      I2 => zext_ln215_reg_1453(4),
      I3 => \tmp_5_reg_1573[6]_i_2_n_0\,
      I4 => zext_ln215_reg_1453(6),
      O => add_ln1353_4_fu_643_p2(6)
    );
\add_ln1353_4_reg_1556[7]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7FFFFFFF80000000"
    )
        port map (
      I0 => zext_ln215_reg_1453(3),
      I1 => zext_ln215_reg_1453(4),
      I2 => \tmp_5_reg_1573[6]_i_2_n_0\,
      I3 => zext_ln215_reg_1453(6),
      I4 => zext_ln215_reg_1453(5),
      I5 => zext_ln215_reg_1453(7),
      O => add_ln1353_4_fu_643_p2(7)
    );
\add_ln1353_4_reg_1556[8]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"78"
    )
        port map (
      I0 => zext_ln215_reg_1453(7),
      I1 => \add_ln1353_4_reg_1556[11]_i_2_n_0\,
      I2 => zext_ln215_reg_1453(8),
      O => add_ln1353_4_fu_643_p2(8)
    );
\add_ln1353_4_reg_1556[9]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7F80"
    )
        port map (
      I0 => \add_ln1353_4_reg_1556[11]_i_2_n_0\,
      I1 => zext_ln215_reg_1453(8),
      I2 => zext_ln215_reg_1453(7),
      I3 => zext_ln215_reg_1453(9),
      O => add_ln1353_4_fu_643_p2(9)
    );
\add_ln1353_4_reg_1556_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => add_ln1353_4_fu_643_p2(10),
      Q => add_ln1353_4_reg_1556(10),
      R => '0'
    );
\add_ln1353_4_reg_1556_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => add_ln1353_4_fu_643_p2(11),
      Q => add_ln1353_4_reg_1556(11),
      R => '0'
    );
\add_ln1353_4_reg_1556_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => \add_ln1353_4_reg_1556[12]_i_1_n_0\,
      Q => add_ln1353_4_reg_1556(12),
      R => \add_ln1353_reg_1512[12]_i_1_n_0\
    );
\add_ln1353_4_reg_1556_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => add_ln1353_4_fu_643_p2(1),
      Q => add_ln1353_4_reg_1556(1),
      R => '0'
    );
\add_ln1353_4_reg_1556_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => add_ln1353_4_fu_643_p2(2),
      Q => add_ln1353_4_reg_1556(2),
      R => '0'
    );
\add_ln1353_4_reg_1556_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => add_ln1353_4_fu_643_p2(3),
      Q => add_ln1353_4_reg_1556(3),
      R => '0'
    );
\add_ln1353_4_reg_1556_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => add_ln1353_4_fu_643_p2(4),
      Q => add_ln1353_4_reg_1556(4),
      R => '0'
    );
\add_ln1353_4_reg_1556_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => add_ln1353_4_fu_643_p2(5),
      Q => add_ln1353_4_reg_1556(5),
      R => '0'
    );
\add_ln1353_4_reg_1556_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => add_ln1353_4_fu_643_p2(6),
      Q => add_ln1353_4_reg_1556(6),
      R => '0'
    );
\add_ln1353_4_reg_1556_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => add_ln1353_4_fu_643_p2(7),
      Q => add_ln1353_4_reg_1556(7),
      R => '0'
    );
\add_ln1353_4_reg_1556_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => add_ln1353_4_fu_643_p2(8),
      Q => add_ln1353_4_reg_1556(8),
      R => '0'
    );
\add_ln1353_4_reg_1556_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => add_ln1353_4_fu_643_p2(9),
      Q => add_ln1353_4_reg_1556(9),
      R => '0'
    );
\add_ln1353_6_reg_1578[10]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7FFF8000"
    )
        port map (
      I0 => zext_ln215_reg_1453(9),
      I1 => zext_ln215_reg_1453(7),
      I2 => zext_ln215_reg_1453(8),
      I3 => \add_ln1353_6_reg_1578[11]_i_2_n_0\,
      I4 => zext_ln215_reg_1453(10),
      O => add_ln1353_6_fu_683_p2(10)
    );
\add_ln1353_6_reg_1578[11]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7FFFFFFF80000000"
    )
        port map (
      I0 => zext_ln215_reg_1453(9),
      I1 => zext_ln215_reg_1453(10),
      I2 => zext_ln215_reg_1453(7),
      I3 => zext_ln215_reg_1453(8),
      I4 => \add_ln1353_6_reg_1578[11]_i_2_n_0\,
      I5 => zext_ln215_reg_1453(11),
      O => add_ln1353_6_fu_683_p2(11)
    );
\add_ln1353_6_reg_1578[11]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"80000000"
    )
        port map (
      I0 => zext_ln215_reg_1453(5),
      I1 => zext_ln215_reg_1453(6),
      I2 => \tmp_7_reg_1595[6]_i_2_n_0\,
      I3 => zext_ln215_reg_1453(4),
      I4 => zext_ln215_reg_1453(3),
      O => \add_ln1353_6_reg_1578[11]_i_2_n_0\
    );
\add_ln1353_6_reg_1578[12]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"80"
    )
        port map (
      I0 => zext_ln215_reg_1453(7),
      I1 => zext_ln215_reg_1453(8),
      I2 => \add_ln1353_6_reg_1578[11]_i_2_n_0\,
      O => \add_ln1353_6_reg_1578[12]_i_1_n_0\
    );
\add_ln1353_6_reg_1578[1]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"956A"
    )
        port map (
      I0 => add_ln647_2_reg_1479(1),
      I1 => add_ln647_reg_1469(0),
      I2 => zext_ln215_reg_1453(0),
      I3 => zext_ln215_reg_1453(1),
      O => add_ln1353_6_fu_683_p2(1)
    );
\add_ln1353_6_reg_1578[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9999966696666666"
    )
        port map (
      I0 => zext_ln215_reg_1453(2),
      I1 => add_ln647_2_reg_1479(2),
      I2 => add_ln647_reg_1469(0),
      I3 => zext_ln215_reg_1453(0),
      I4 => zext_ln215_reg_1453(1),
      I5 => add_ln647_2_reg_1479(1),
      O => add_ln1353_6_fu_683_p2(2)
    );
\add_ln1353_6_reg_1578[3]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \tmp_7_reg_1595[6]_i_2_n_0\,
      I1 => zext_ln215_reg_1453(3),
      O => add_ln1353_6_fu_683_p2(3)
    );
\add_ln1353_6_reg_1578[4]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"78"
    )
        port map (
      I0 => zext_ln215_reg_1453(3),
      I1 => \tmp_7_reg_1595[6]_i_2_n_0\,
      I2 => zext_ln215_reg_1453(4),
      O => add_ln1353_6_fu_683_p2(4)
    );
\add_ln1353_6_reg_1578[5]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7F80"
    )
        port map (
      I0 => \tmp_7_reg_1595[6]_i_2_n_0\,
      I1 => zext_ln215_reg_1453(4),
      I2 => zext_ln215_reg_1453(3),
      I3 => zext_ln215_reg_1453(5),
      O => add_ln1353_6_fu_683_p2(5)
    );
\add_ln1353_6_reg_1578[6]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7FFF8000"
    )
        port map (
      I0 => zext_ln215_reg_1453(5),
      I1 => zext_ln215_reg_1453(3),
      I2 => zext_ln215_reg_1453(4),
      I3 => \tmp_7_reg_1595[6]_i_2_n_0\,
      I4 => zext_ln215_reg_1453(6),
      O => add_ln1353_6_fu_683_p2(6)
    );
\add_ln1353_6_reg_1578[7]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7FFFFFFF80000000"
    )
        port map (
      I0 => zext_ln215_reg_1453(3),
      I1 => zext_ln215_reg_1453(4),
      I2 => \tmp_7_reg_1595[6]_i_2_n_0\,
      I3 => zext_ln215_reg_1453(6),
      I4 => zext_ln215_reg_1453(5),
      I5 => zext_ln215_reg_1453(7),
      O => add_ln1353_6_fu_683_p2(7)
    );
\add_ln1353_6_reg_1578[8]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"78"
    )
        port map (
      I0 => zext_ln215_reg_1453(7),
      I1 => \add_ln1353_6_reg_1578[11]_i_2_n_0\,
      I2 => zext_ln215_reg_1453(8),
      O => add_ln1353_6_fu_683_p2(8)
    );
\add_ln1353_6_reg_1578[9]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7F80"
    )
        port map (
      I0 => \add_ln1353_6_reg_1578[11]_i_2_n_0\,
      I1 => zext_ln215_reg_1453(8),
      I2 => zext_ln215_reg_1453(7),
      I3 => zext_ln215_reg_1453(9),
      O => add_ln1353_6_fu_683_p2(9)
    );
\add_ln1353_6_reg_1578_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => add_ln1353_6_fu_683_p2(10),
      Q => add_ln1353_6_reg_1578(10),
      R => '0'
    );
\add_ln1353_6_reg_1578_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => add_ln1353_6_fu_683_p2(11),
      Q => add_ln1353_6_reg_1578(11),
      R => '0'
    );
\add_ln1353_6_reg_1578_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => \add_ln1353_6_reg_1578[12]_i_1_n_0\,
      Q => add_ln1353_6_reg_1578(12),
      R => \add_ln1353_reg_1512[12]_i_1_n_0\
    );
\add_ln1353_6_reg_1578_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => add_ln1353_6_fu_683_p2(1),
      Q => add_ln1353_6_reg_1578(1),
      R => '0'
    );
\add_ln1353_6_reg_1578_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => add_ln1353_6_fu_683_p2(2),
      Q => add_ln1353_6_reg_1578(2),
      R => '0'
    );
\add_ln1353_6_reg_1578_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => add_ln1353_6_fu_683_p2(3),
      Q => add_ln1353_6_reg_1578(3),
      R => '0'
    );
\add_ln1353_6_reg_1578_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => add_ln1353_6_fu_683_p2(4),
      Q => add_ln1353_6_reg_1578(4),
      R => '0'
    );
\add_ln1353_6_reg_1578_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => add_ln1353_6_fu_683_p2(5),
      Q => add_ln1353_6_reg_1578(5),
      R => '0'
    );
\add_ln1353_6_reg_1578_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => add_ln1353_6_fu_683_p2(6),
      Q => add_ln1353_6_reg_1578(6),
      R => '0'
    );
\add_ln1353_6_reg_1578_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => add_ln1353_6_fu_683_p2(7),
      Q => add_ln1353_6_reg_1578(7),
      R => '0'
    );
\add_ln1353_6_reg_1578_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => add_ln1353_6_fu_683_p2(8),
      Q => add_ln1353_6_reg_1578(8),
      R => '0'
    );
\add_ln1353_6_reg_1578_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => add_ln1353_6_fu_683_p2(9),
      Q => add_ln1353_6_reg_1578(9),
      R => '0'
    );
\add_ln1353_8_reg_1484[0]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => rom_idx_V(0),
      I1 => lut_start_addr_V(0),
      O => add_ln1353_8_fu_514_p2(0)
    );
\add_ln1353_8_reg_1484[10]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"F0CAF0F0"
    )
        port map (
      I0 => \add_ln1353_8_reg_1484[12]_i_2_n_0\,
      I1 => \add_ln1353_8_reg_1484[11]_i_2_n_0\,
      I2 => lut_start_addr_V(10),
      I3 => \add_ln1353_8_reg_1484[12]_i_3_n_0\,
      I4 => lut_start_addr_V(9),
      O => add_ln1353_8_fu_514_p2(10)
    );
\add_ln1353_8_reg_1484[11]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0F0CAF0F0F0F0F0"
    )
        port map (
      I0 => \add_ln1353_8_reg_1484[12]_i_2_n_0\,
      I1 => \add_ln1353_8_reg_1484[11]_i_2_n_0\,
      I2 => lut_start_addr_V(11),
      I3 => lut_start_addr_V(9),
      I4 => \add_ln1353_8_reg_1484[12]_i_3_n_0\,
      I5 => lut_start_addr_V(10),
      O => add_ln1353_8_fu_514_p2(11)
    );
\add_ln1353_8_reg_1484[11]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"000F7510751FFFFF"
    )
        port map (
      I0 => lut_start_addr_V(1),
      I1 => lut_start_addr_V(0),
      I2 => rom_idx_V(0),
      I3 => rom_idx_V(1),
      I4 => rom_idx_V(2),
      I5 => lut_start_addr_V(2),
      O => \add_ln1353_8_reg_1484[11]_i_2_n_0\
    );
\add_ln1353_8_reg_1484[12]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00800000"
    )
        port map (
      I0 => lut_start_addr_V(11),
      I1 => \add_ln1353_8_reg_1484[12]_i_2_n_0\,
      I2 => lut_start_addr_V(10),
      I3 => \add_ln1353_8_reg_1484[12]_i_3_n_0\,
      I4 => lut_start_addr_V(9),
      O => add_ln1353_8_fu_514_p2(12)
    );
\add_ln1353_8_reg_1484[12]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"E8FCC0E8FC30C030"
    )
        port map (
      I0 => lut_start_addr_V(0),
      I1 => rom_idx_V(2),
      I2 => lut_start_addr_V(2),
      I3 => rom_idx_V(1),
      I4 => lut_start_addr_V(1),
      I5 => rom_idx_V(0),
      O => \add_ln1353_8_reg_1484[12]_i_2_n_0\
    );
\add_ln1353_8_reg_1484[12]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7FFFFFFFFFFFFFFF"
    )
        port map (
      I0 => lut_start_addr_V(7),
      I1 => lut_start_addr_V(5),
      I2 => lut_start_addr_V(3),
      I3 => lut_start_addr_V(4),
      I4 => lut_start_addr_V(6),
      I5 => lut_start_addr_V(8),
      O => \add_ln1353_8_reg_1484[12]_i_3_n_0\
    );
\add_ln1353_8_reg_1484[1]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"659A"
    )
        port map (
      I0 => lut_start_addr_V(1),
      I1 => lut_start_addr_V(0),
      I2 => rom_idx_V(0),
      I3 => rom_idx_V(1),
      O => add_ln1353_8_fu_514_p2(1)
    );
\add_ln1353_8_reg_1484[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9666969699969999"
    )
        port map (
      I0 => lut_start_addr_V(2),
      I1 => rom_idx_V(2),
      I2 => lut_start_addr_V(1),
      I3 => lut_start_addr_V(0),
      I4 => rom_idx_V(0),
      I5 => rom_idx_V(1),
      O => add_ln1353_8_fu_514_p2(2)
    );
\add_ln1353_8_reg_1484[3]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \add_ln1353_8_reg_1484[11]_i_2_n_0\,
      I1 => lut_start_addr_V(3),
      I2 => \add_ln1353_8_reg_1484[12]_i_2_n_0\,
      O => add_ln1353_8_fu_514_p2(3)
    );
\add_ln1353_8_reg_1484[4]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F858"
    )
        port map (
      I0 => lut_start_addr_V(3),
      I1 => \add_ln1353_8_reg_1484[12]_i_2_n_0\,
      I2 => lut_start_addr_V(4),
      I3 => \add_ln1353_8_reg_1484[11]_i_2_n_0\,
      O => add_ln1353_8_fu_514_p2(4)
    );
\add_ln1353_8_reg_1484[5]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FF807780"
    )
        port map (
      I0 => lut_start_addr_V(3),
      I1 => lut_start_addr_V(4),
      I2 => \add_ln1353_8_reg_1484[12]_i_2_n_0\,
      I3 => lut_start_addr_V(5),
      I4 => \add_ln1353_8_reg_1484[11]_i_2_n_0\,
      O => add_ln1353_8_fu_514_p2(5)
    );
\add_ln1353_8_reg_1484[6]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFF80007F7F8000"
    )
        port map (
      I0 => lut_start_addr_V(4),
      I1 => lut_start_addr_V(3),
      I2 => lut_start_addr_V(5),
      I3 => \add_ln1353_8_reg_1484[12]_i_2_n_0\,
      I4 => lut_start_addr_V(6),
      I5 => \add_ln1353_8_reg_1484[11]_i_2_n_0\,
      O => add_ln1353_8_fu_514_p2(6)
    );
\add_ln1353_8_reg_1484[7]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F4A4"
    )
        port map (
      I0 => \add_ln1353_8_reg_1484[7]_i_2_n_0\,
      I1 => \add_ln1353_8_reg_1484[12]_i_2_n_0\,
      I2 => lut_start_addr_V(7),
      I3 => \add_ln1353_8_reg_1484[11]_i_2_n_0\,
      O => add_ln1353_8_fu_514_p2(7)
    );
\add_ln1353_8_reg_1484[7]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7FFF"
    )
        port map (
      I0 => lut_start_addr_V(5),
      I1 => lut_start_addr_V(3),
      I2 => lut_start_addr_V(4),
      I3 => lut_start_addr_V(6),
      O => \add_ln1353_8_reg_1484[7]_i_2_n_0\
    );
\add_ln1353_8_reg_1484[8]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F0CA"
    )
        port map (
      I0 => \add_ln1353_8_reg_1484[12]_i_2_n_0\,
      I1 => \add_ln1353_8_reg_1484[11]_i_2_n_0\,
      I2 => lut_start_addr_V(8),
      I3 => \add_ln1353_8_reg_1484[8]_i_2_n_0\,
      O => add_ln1353_8_fu_514_p2(8)
    );
\add_ln1353_8_reg_1484[8]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7FFFFFFF"
    )
        port map (
      I0 => lut_start_addr_V(6),
      I1 => lut_start_addr_V(4),
      I2 => lut_start_addr_V(3),
      I3 => lut_start_addr_V(5),
      I4 => lut_start_addr_V(7),
      O => \add_ln1353_8_reg_1484[8]_i_2_n_0\
    );
\add_ln1353_8_reg_1484[9]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F0CA"
    )
        port map (
      I0 => \add_ln1353_8_reg_1484[12]_i_2_n_0\,
      I1 => \add_ln1353_8_reg_1484[11]_i_2_n_0\,
      I2 => lut_start_addr_V(9),
      I3 => \add_ln1353_8_reg_1484[12]_i_3_n_0\,
      O => add_ln1353_8_fu_514_p2(9)
    );
\add_ln1353_8_reg_1484_pp0_iter1_reg_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => add_ln1353_8_reg_1484(0),
      Q => add_ln1353_8_reg_1484_pp0_iter1_reg(0),
      R => '0'
    );
\add_ln1353_8_reg_1484_pp0_iter1_reg_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => add_ln1353_8_reg_1484(10),
      Q => add_ln1353_8_reg_1484_pp0_iter1_reg(10),
      R => '0'
    );
\add_ln1353_8_reg_1484_pp0_iter1_reg_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => add_ln1353_8_reg_1484(11),
      Q => add_ln1353_8_reg_1484_pp0_iter1_reg(11),
      R => '0'
    );
\add_ln1353_8_reg_1484_pp0_iter1_reg_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => add_ln1353_8_reg_1484(12),
      Q => add_ln1353_8_reg_1484_pp0_iter1_reg(12),
      R => '0'
    );
\add_ln1353_8_reg_1484_pp0_iter1_reg_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => add_ln1353_8_reg_1484(1),
      Q => add_ln1353_8_reg_1484_pp0_iter1_reg(1),
      R => '0'
    );
\add_ln1353_8_reg_1484_pp0_iter1_reg_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => add_ln1353_8_reg_1484(2),
      Q => add_ln1353_8_reg_1484_pp0_iter1_reg(2),
      R => '0'
    );
\add_ln1353_8_reg_1484_pp0_iter1_reg_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => add_ln1353_8_reg_1484(3),
      Q => add_ln1353_8_reg_1484_pp0_iter1_reg(3),
      R => '0'
    );
\add_ln1353_8_reg_1484_pp0_iter1_reg_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => add_ln1353_8_reg_1484(4),
      Q => add_ln1353_8_reg_1484_pp0_iter1_reg(4),
      R => '0'
    );
\add_ln1353_8_reg_1484_pp0_iter1_reg_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => add_ln1353_8_reg_1484(5),
      Q => add_ln1353_8_reg_1484_pp0_iter1_reg(5),
      R => '0'
    );
\add_ln1353_8_reg_1484_pp0_iter1_reg_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => add_ln1353_8_reg_1484(6),
      Q => add_ln1353_8_reg_1484_pp0_iter1_reg(6),
      R => '0'
    );
\add_ln1353_8_reg_1484_pp0_iter1_reg_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => add_ln1353_8_reg_1484(7),
      Q => add_ln1353_8_reg_1484_pp0_iter1_reg(7),
      R => '0'
    );
\add_ln1353_8_reg_1484_pp0_iter1_reg_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => add_ln1353_8_reg_1484(8),
      Q => add_ln1353_8_reg_1484_pp0_iter1_reg(8),
      R => '0'
    );
\add_ln1353_8_reg_1484_pp0_iter1_reg_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => add_ln1353_8_reg_1484(9),
      Q => add_ln1353_8_reg_1484_pp0_iter1_reg(9),
      R => '0'
    );
\add_ln1353_8_reg_1484_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => add_ln1353_8_fu_514_p2(0),
      Q => add_ln1353_8_reg_1484(0),
      R => '0'
    );
\add_ln1353_8_reg_1484_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => add_ln1353_8_fu_514_p2(10),
      Q => add_ln1353_8_reg_1484(10),
      R => '0'
    );
\add_ln1353_8_reg_1484_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => add_ln1353_8_fu_514_p2(11),
      Q => add_ln1353_8_reg_1484(11),
      R => '0'
    );
\add_ln1353_8_reg_1484_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => add_ln1353_8_fu_514_p2(12),
      Q => add_ln1353_8_reg_1484(12),
      R => '0'
    );
\add_ln1353_8_reg_1484_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => add_ln1353_8_fu_514_p2(1),
      Q => add_ln1353_8_reg_1484(1),
      R => '0'
    );
\add_ln1353_8_reg_1484_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => add_ln1353_8_fu_514_p2(2),
      Q => add_ln1353_8_reg_1484(2),
      R => '0'
    );
\add_ln1353_8_reg_1484_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => add_ln1353_8_fu_514_p2(3),
      Q => add_ln1353_8_reg_1484(3),
      R => '0'
    );
\add_ln1353_8_reg_1484_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => add_ln1353_8_fu_514_p2(4),
      Q => add_ln1353_8_reg_1484(4),
      R => '0'
    );
\add_ln1353_8_reg_1484_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => add_ln1353_8_fu_514_p2(5),
      Q => add_ln1353_8_reg_1484(5),
      R => '0'
    );
\add_ln1353_8_reg_1484_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => add_ln1353_8_fu_514_p2(6),
      Q => add_ln1353_8_reg_1484(6),
      R => '0'
    );
\add_ln1353_8_reg_1484_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => add_ln1353_8_fu_514_p2(7),
      Q => add_ln1353_8_reg_1484(7),
      R => '0'
    );
\add_ln1353_8_reg_1484_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => add_ln1353_8_fu_514_p2(8),
      Q => add_ln1353_8_reg_1484(8),
      R => '0'
    );
\add_ln1353_8_reg_1484_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => add_ln1353_8_fu_514_p2(9),
      Q => add_ln1353_8_reg_1484(9),
      R => '0'
    );
\add_ln1353_reg_1512[0]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => trunc_ln647_reg_1464(0),
      I1 => zext_ln215_reg_1453(0),
      O => \add_ln1353_reg_1512[0]_i_1_n_0\
    );
\add_ln1353_reg_1512[10]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7FFF8000"
    )
        port map (
      I0 => zext_ln215_reg_1453(9),
      I1 => zext_ln215_reg_1453(7),
      I2 => zext_ln215_reg_1453(8),
      I3 => \add_ln1353_reg_1512[11]_i_2_n_0\,
      I4 => zext_ln215_reg_1453(10),
      O => p_0_in(7)
    );
\add_ln1353_reg_1512[11]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7FFFFFFF80000000"
    )
        port map (
      I0 => zext_ln215_reg_1453(9),
      I1 => zext_ln215_reg_1453(10),
      I2 => zext_ln215_reg_1453(7),
      I3 => zext_ln215_reg_1453(8),
      I4 => \add_ln1353_reg_1512[11]_i_2_n_0\,
      I5 => zext_ln215_reg_1453(11),
      O => \add_ln1353_reg_1512[11]_i_1_n_0\
    );
\add_ln1353_reg_1512[11]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"80000000"
    )
        port map (
      I0 => zext_ln215_reg_1453(5),
      I1 => zext_ln215_reg_1453(6),
      I2 => \tmp_1_reg_1529[6]_i_2_n_0\,
      I3 => zext_ln215_reg_1453(4),
      I4 => zext_ln215_reg_1453(3),
      O => \add_ln1353_reg_1512[11]_i_2_n_0\
    );
\add_ln1353_reg_1512[12]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"7F"
    )
        port map (
      I0 => zext_ln215_reg_1453(9),
      I1 => zext_ln215_reg_1453(10),
      I2 => zext_ln215_reg_1453(11),
      O => \add_ln1353_reg_1512[12]_i_1_n_0\
    );
\add_ln1353_reg_1512[12]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"80"
    )
        port map (
      I0 => zext_ln215_reg_1453(7),
      I1 => zext_ln215_reg_1453(8),
      I2 => \add_ln1353_reg_1512[11]_i_2_n_0\,
      O => \add_ln1353_reg_1512[12]_i_2_n_0\
    );
\add_ln1353_reg_1512[1]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9666"
    )
        port map (
      I0 => zext_ln215_reg_1453(1),
      I1 => trunc_ln647_reg_1464(1),
      I2 => trunc_ln647_reg_1464(0),
      I3 => zext_ln215_reg_1453(0),
      O => \add_ln1353_reg_1512[1]_i_1_n_0\
    );
\add_ln1353_reg_1512[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9996969696666666"
    )
        port map (
      I0 => zext_ln215_reg_1453(2),
      I1 => trunc_ln647_reg_1464(2),
      I2 => zext_ln215_reg_1453(1),
      I3 => trunc_ln647_reg_1464(0),
      I4 => zext_ln215_reg_1453(0),
      I5 => trunc_ln647_reg_1464(1),
      O => \add_ln1353_reg_1512[2]_i_1_n_0\
    );
\add_ln1353_reg_1512[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"11171777EEE8E888"
    )
        port map (
      I0 => trunc_ln647_reg_1464(2),
      I1 => zext_ln215_reg_1453(2),
      I2 => trunc_ln647_reg_1464(1),
      I3 => \tmp_1_reg_1529[0]_i_2_n_0\,
      I4 => zext_ln215_reg_1453(1),
      I5 => zext_ln215_reg_1453(3),
      O => p_0_in(0)
    );
\add_ln1353_reg_1512[4]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"78"
    )
        port map (
      I0 => zext_ln215_reg_1453(3),
      I1 => \tmp_1_reg_1529[6]_i_2_n_0\,
      I2 => zext_ln215_reg_1453(4),
      O => p_0_in(1)
    );
\add_ln1353_reg_1512[5]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7F80"
    )
        port map (
      I0 => \tmp_1_reg_1529[6]_i_2_n_0\,
      I1 => zext_ln215_reg_1453(4),
      I2 => zext_ln215_reg_1453(3),
      I3 => zext_ln215_reg_1453(5),
      O => p_0_in(2)
    );
\add_ln1353_reg_1512[6]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7FFF8000"
    )
        port map (
      I0 => zext_ln215_reg_1453(5),
      I1 => zext_ln215_reg_1453(3),
      I2 => zext_ln215_reg_1453(4),
      I3 => \tmp_1_reg_1529[6]_i_2_n_0\,
      I4 => zext_ln215_reg_1453(6),
      O => p_0_in(3)
    );
\add_ln1353_reg_1512[7]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7FFFFFFF80000000"
    )
        port map (
      I0 => zext_ln215_reg_1453(3),
      I1 => zext_ln215_reg_1453(4),
      I2 => \tmp_1_reg_1529[6]_i_2_n_0\,
      I3 => zext_ln215_reg_1453(6),
      I4 => zext_ln215_reg_1453(5),
      I5 => zext_ln215_reg_1453(7),
      O => p_0_in(4)
    );
\add_ln1353_reg_1512[8]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"78"
    )
        port map (
      I0 => zext_ln215_reg_1453(7),
      I1 => \add_ln1353_reg_1512[11]_i_2_n_0\,
      I2 => zext_ln215_reg_1453(8),
      O => p_0_in(5)
    );
\add_ln1353_reg_1512[9]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7F80"
    )
        port map (
      I0 => \add_ln1353_reg_1512[11]_i_2_n_0\,
      I1 => zext_ln215_reg_1453(8),
      I2 => zext_ln215_reg_1453(7),
      I3 => zext_ln215_reg_1453(9),
      O => p_0_in(6)
    );
\add_ln1353_reg_1512_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => \add_ln1353_reg_1512[0]_i_1_n_0\,
      Q => add_ln1353_reg_1512(0),
      R => '0'
    );
\add_ln1353_reg_1512_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => p_0_in(7),
      Q => add_ln1353_reg_1512(10),
      R => '0'
    );
\add_ln1353_reg_1512_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => \add_ln1353_reg_1512[11]_i_1_n_0\,
      Q => add_ln1353_reg_1512(11),
      R => '0'
    );
\add_ln1353_reg_1512_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => \add_ln1353_reg_1512[12]_i_2_n_0\,
      Q => add_ln1353_reg_1512(12),
      R => \add_ln1353_reg_1512[12]_i_1_n_0\
    );
\add_ln1353_reg_1512_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => \add_ln1353_reg_1512[1]_i_1_n_0\,
      Q => add_ln1353_reg_1512(1),
      R => '0'
    );
\add_ln1353_reg_1512_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => \add_ln1353_reg_1512[2]_i_1_n_0\,
      Q => add_ln1353_reg_1512(2),
      R => '0'
    );
\add_ln1353_reg_1512_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => p_0_in(0),
      Q => add_ln1353_reg_1512(3),
      R => '0'
    );
\add_ln1353_reg_1512_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => p_0_in(1),
      Q => add_ln1353_reg_1512(4),
      R => '0'
    );
\add_ln1353_reg_1512_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => p_0_in(2),
      Q => add_ln1353_reg_1512(5),
      R => '0'
    );
\add_ln1353_reg_1512_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => p_0_in(3),
      Q => add_ln1353_reg_1512(6),
      R => '0'
    );
\add_ln1353_reg_1512_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => p_0_in(4),
      Q => add_ln1353_reg_1512(7),
      R => '0'
    );
\add_ln1353_reg_1512_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => p_0_in(5),
      Q => add_ln1353_reg_1512(8),
      R => '0'
    );
\add_ln1353_reg_1512_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => p_0_in(6),
      Q => add_ln1353_reg_1512(9),
      R => '0'
    );
\add_ln647_1_reg_1474[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => rom_idx_V(1),
      I1 => rom_idx_V(0),
      O => add_ln647_1_fu_484_p2(1)
    );
\add_ln647_1_reg_1474[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"78"
    )
        port map (
      I0 => rom_idx_V(1),
      I1 => rom_idx_V(0),
      I2 => rom_idx_V(2),
      O => add_ln647_1_fu_484_p2(2)
    );
\add_ln647_1_reg_1474_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => add_ln647_1_fu_484_p2(1),
      Q => add_ln647_1_reg_1474(1),
      R => '0'
    );
\add_ln647_1_reg_1474_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => add_ln647_1_fu_484_p2(2),
      Q => add_ln647_1_reg_1474(2),
      R => '0'
    );
\add_ln647_2_reg_1479[1]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => rom_idx_V(1),
      O => add_ln647_5_fu_554_p2(1)
    );
\add_ln647_2_reg_1479_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => add_ln647_5_fu_554_p2(1),
      Q => add_ln647_2_reg_1479(1),
      R => '0'
    );
\add_ln647_2_reg_1479_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => rom_idx_V(2),
      Q => add_ln647_2_reg_1479(2),
      R => '0'
    );
\add_ln647_3_reg_1497[2]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => rom_idx_V(2),
      I1 => rom_idx_V(1),
      O => add_ln647_3_fu_534_p2(2)
    );
\add_ln647_3_reg_1497_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => add_ln647_3_fu_534_p2(2),
      Q => add_ln647_3_reg_1497(2),
      R => '0'
    );
\add_ln647_4_reg_1502[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"95"
    )
        port map (
      I0 => rom_idx_V(2),
      I1 => rom_idx_V(0),
      I2 => rom_idx_V(1),
      O => add_ln647_4_fu_544_p2(2)
    );
\add_ln647_4_reg_1502_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => add_ln647_4_fu_544_p2(2),
      Q => add_ln647_4_reg_1502(2),
      R => '0'
    );
\add_ln647_5_reg_1507[2]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => rom_idx_V(2),
      O => add_ln647_5_fu_554_p2(2)
    );
\add_ln647_5_reg_1507_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => add_ln647_5_fu_554_p2(2),
      Q => add_ln647_5_reg_1507(2),
      R => '0'
    );
\add_ln647_reg_1469[0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => rom_idx_V(0),
      O => add_ln647_5_fu_554_p2(0)
    );
\add_ln647_reg_1469[2]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => rom_idx_V(1),
      I1 => rom_idx_V(2),
      O => add_ln647_fu_474_p2(2)
    );
\add_ln647_reg_1469_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => add_ln647_5_fu_554_p2(0),
      Q => add_ln647_reg_1469(0),
      R => '0'
    );
\add_ln647_reg_1469_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => rom_idx_V(1),
      Q => add_ln647_reg_1469(1),
      R => '0'
    );
\add_ln647_reg_1469_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => add_ln647_fu_474_p2(2),
      Q => add_ln647_reg_1469(2),
      R => '0'
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
      Q => \^ap_done\,
      R => ap_rst
    );
ap_idle_INST_0: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000001"
    )
        port map (
      I0 => ap_enable_reg_pp0_iter1,
      I1 => ap_enable_reg_pp0_iter2,
      I2 => \^ap_done\,
      I3 => \^ap_start\,
      I4 => ap_enable_reg_pp0_iter3,
      O => ap_idle
    );
\icmp_ln895_10_reg_1568[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFEEEEEEEEEEEEE"
    )
        port map (
      I0 => zext_ln215_reg_1453(11),
      I1 => \icmp_ln895_10_reg_1568[0]_i_2_n_0\,
      I2 => \icmp_ln895_10_reg_1568[0]_i_3_n_0\,
      I3 => \icmp_ln895_10_reg_1568[0]_i_4_n_0\,
      I4 => add_ln1353_5_fu_658_p2(9),
      I5 => \icmp_ln895_10_reg_1568[0]_i_5_n_0\,
      O => icmp_ln895_10_fu_664_p2
    );
\icmp_ln895_10_reg_1568[0]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"2000200020000000"
    )
        port map (
      I0 => \icmp_ln895_1_reg_1524[0]_i_6_n_0\,
      I1 => \tmp_1_reg_1529[6]_i_4_n_0\,
      I2 => zext_ln215_reg_1453(4),
      I3 => zext_ln215_reg_1453(5),
      I4 => zext_ln215_reg_1453(3),
      I5 => \tmp_5_reg_1573[6]_i_2_n_0\,
      O => \icmp_ln895_10_reg_1568[0]_i_2_n_0\
    );
\icmp_ln895_10_reg_1568[0]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"777FFFFFFFFFEEEA"
    )
        port map (
      I0 => zext_ln215_reg_1453(8),
      I1 => \tmp_1_reg_1529[6]_i_3_n_0\,
      I2 => zext_ln215_reg_1453(3),
      I3 => \tmp_5_reg_1573[6]_i_2_n_0\,
      I4 => zext_ln215_reg_1453(7),
      I5 => zext_ln215_reg_1453(6),
      O => \icmp_ln895_10_reg_1568[0]_i_3_n_0\
    );
\icmp_ln895_10_reg_1568[0]_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"333E8000"
    )
        port map (
      I0 => \icmp_ln895_10_reg_1568[0]_i_6_n_0\,
      I1 => zext_ln215_reg_1453(4),
      I2 => \tmp_5_reg_1573[6]_i_2_n_0\,
      I3 => zext_ln215_reg_1453(3),
      I4 => zext_ln215_reg_1453(5),
      O => \icmp_ln895_10_reg_1568[0]_i_4_n_0\
    );
\icmp_ln895_10_reg_1568[0]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF00005400"
    )
        port map (
      I0 => \icmp_ln895_1_reg_1524[0]_i_8_n_0\,
      I1 => \tmp_5_reg_1573[6]_i_2_n_0\,
      I2 => zext_ln215_reg_1453(3),
      I3 => \tmp_1_reg_1529[6]_i_3_n_0\,
      I4 => \tmp_1_reg_1529[6]_i_4_n_0\,
      I5 => zext_ln215_reg_1453(10),
      O => \icmp_ln895_10_reg_1568[0]_i_5_n_0\
    );
\icmp_ln895_10_reg_1568[0]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFF99FFF9FFFFFF6"
    )
        port map (
      I0 => add_ln647_1_reg_1474(2),
      I1 => zext_ln215_reg_1453(2),
      I2 => trunc_ln647_reg_1464(0),
      I3 => zext_ln215_reg_1453(0),
      I4 => zext_ln215_reg_1453(1),
      I5 => add_ln647_1_reg_1474(1),
      O => \icmp_ln895_10_reg_1568[0]_i_6_n_0\
    );
\icmp_ln895_10_reg_1568_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => icmp_ln895_10_fu_664_p2,
      Q => icmp_ln895_10_reg_1568,
      R => '0'
    );
\icmp_ln895_11_reg_1590[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFEEEEEEEEEEEEE"
    )
        port map (
      I0 => zext_ln215_reg_1453(11),
      I1 => \icmp_ln895_11_reg_1590[0]_i_2_n_0\,
      I2 => \icmp_ln895_11_reg_1590[0]_i_3_n_0\,
      I3 => \icmp_ln895_11_reg_1590[0]_i_4_n_0\,
      I4 => add_ln1353_7_fu_698_p2(9),
      I5 => \icmp_ln895_11_reg_1590[0]_i_5_n_0\,
      O => icmp_ln895_11_fu_704_p2
    );
\icmp_ln895_11_reg_1590[0]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"2000200020000000"
    )
        port map (
      I0 => \icmp_ln895_1_reg_1524[0]_i_6_n_0\,
      I1 => \tmp_1_reg_1529[6]_i_4_n_0\,
      I2 => zext_ln215_reg_1453(4),
      I3 => zext_ln215_reg_1453(5),
      I4 => zext_ln215_reg_1453(3),
      I5 => \tmp_7_reg_1595[6]_i_2_n_0\,
      O => \icmp_ln895_11_reg_1590[0]_i_2_n_0\
    );
\icmp_ln895_11_reg_1590[0]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"777FFFFFFFFFEEEA"
    )
        port map (
      I0 => zext_ln215_reg_1453(8),
      I1 => \tmp_1_reg_1529[6]_i_3_n_0\,
      I2 => zext_ln215_reg_1453(3),
      I3 => \tmp_7_reg_1595[6]_i_2_n_0\,
      I4 => zext_ln215_reg_1453(7),
      I5 => zext_ln215_reg_1453(6),
      O => \icmp_ln895_11_reg_1590[0]_i_3_n_0\
    );
\icmp_ln895_11_reg_1590[0]_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"333E8000"
    )
        port map (
      I0 => \icmp_ln895_11_reg_1590[0]_i_6_n_0\,
      I1 => zext_ln215_reg_1453(4),
      I2 => \tmp_7_reg_1595[6]_i_2_n_0\,
      I3 => zext_ln215_reg_1453(3),
      I4 => zext_ln215_reg_1453(5),
      O => \icmp_ln895_11_reg_1590[0]_i_4_n_0\
    );
\icmp_ln895_11_reg_1590[0]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF00005400"
    )
        port map (
      I0 => \icmp_ln895_1_reg_1524[0]_i_8_n_0\,
      I1 => \tmp_7_reg_1595[6]_i_2_n_0\,
      I2 => zext_ln215_reg_1453(3),
      I3 => \tmp_1_reg_1529[6]_i_3_n_0\,
      I4 => \tmp_1_reg_1529[6]_i_4_n_0\,
      I5 => zext_ln215_reg_1453(10),
      O => \icmp_ln895_11_reg_1590[0]_i_5_n_0\
    );
\icmp_ln895_11_reg_1590[0]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFF99FFF9FFFFFF6"
    )
        port map (
      I0 => add_ln647_2_reg_1479(2),
      I1 => zext_ln215_reg_1453(2),
      I2 => add_ln647_reg_1469(0),
      I3 => zext_ln215_reg_1453(0),
      I4 => add_ln647_2_reg_1479(1),
      I5 => zext_ln215_reg_1453(1),
      O => \icmp_ln895_11_reg_1590[0]_i_6_n_0\
    );
\icmp_ln895_11_reg_1590_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => icmp_ln895_11_fu_704_p2,
      Q => icmp_ln895_11_reg_1590,
      R => '0'
    );
\icmp_ln895_12_reg_1600[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"3FFFFFFFFFFFE800"
    )
        port map (
      I0 => \icmp_ln895_12_reg_1600[0]_i_2_n_0\,
      I1 => \tmp_9_reg_1605[7]_i_2_n_0\,
      I2 => add_ln1353_8_reg_1484(9),
      I3 => add_ln1353_8_reg_1484(10),
      I4 => add_ln1353_8_reg_1484(11),
      I5 => add_ln1353_8_reg_1484(12),
      O => icmp_ln895_12_fu_725_p2
    );
\icmp_ln895_12_reg_1600[0]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"BFFFFFFE"
    )
        port map (
      I0 => \icmp_ln895_12_reg_1600[0]_i_3_n_0\,
      I1 => add_ln1353_8_reg_1484(6),
      I2 => \icmp_ln895_12_reg_1600[0]_i_4_n_0\,
      I3 => add_ln1353_8_reg_1484(7),
      I4 => add_ln1353_8_reg_1484(8),
      O => \icmp_ln895_12_reg_1600[0]_i_2_n_0\
    );
\icmp_ln895_12_reg_1600[0]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000AAAAAAAAAAA8"
    )
        port map (
      I0 => add_ln1353_8_reg_1484(5),
      I1 => add_ln1353_8_reg_1484(2),
      I2 => add_ln1353_8_reg_1484(0),
      I3 => add_ln1353_8_reg_1484(1),
      I4 => add_ln1353_8_reg_1484(3),
      I5 => add_ln1353_8_reg_1484(4),
      O => \icmp_ln895_12_reg_1600[0]_i_3_n_0\
    );
\icmp_ln895_12_reg_1600[0]_i_4\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"80"
    )
        port map (
      I0 => add_ln1353_8_reg_1484(5),
      I1 => add_ln1353_8_reg_1484(3),
      I2 => add_ln1353_8_reg_1484(4),
      O => \icmp_ln895_12_reg_1600[0]_i_4_n_0\
    );
\icmp_ln895_12_reg_1600_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => icmp_ln895_12_fu_725_p2,
      Q => icmp_ln895_12_reg_1600,
      R => '0'
    );
\icmp_ln895_13_reg_1622[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFEEEEEEEEEEEEE"
    )
        port map (
      I0 => zext_ln215_reg_1453(11),
      I1 => \icmp_ln895_13_reg_1622[0]_i_2_n_0\,
      I2 => \icmp_ln895_13_reg_1622[0]_i_3_n_0\,
      I3 => \icmp_ln895_13_reg_1622[0]_i_4_n_0\,
      I4 => add_ln1353_11_fu_759_p2(9),
      I5 => \icmp_ln895_13_reg_1622[0]_i_5_n_0\,
      O => icmp_ln895_13_fu_765_p2
    );
\icmp_ln895_13_reg_1622[0]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"2000200020000000"
    )
        port map (
      I0 => \icmp_ln895_1_reg_1524[0]_i_6_n_0\,
      I1 => \tmp_1_reg_1529[6]_i_4_n_0\,
      I2 => zext_ln215_reg_1453(4),
      I3 => zext_ln215_reg_1453(5),
      I4 => zext_ln215_reg_1453(3),
      I5 => \tmp_11_reg_1627[6]_i_2_n_0\,
      O => \icmp_ln895_13_reg_1622[0]_i_2_n_0\
    );
\icmp_ln895_13_reg_1622[0]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"777FFFFFFFFFEEEA"
    )
        port map (
      I0 => zext_ln215_reg_1453(8),
      I1 => \tmp_1_reg_1529[6]_i_3_n_0\,
      I2 => zext_ln215_reg_1453(3),
      I3 => \tmp_11_reg_1627[6]_i_2_n_0\,
      I4 => zext_ln215_reg_1453(7),
      I5 => zext_ln215_reg_1453(6),
      O => \icmp_ln895_13_reg_1622[0]_i_3_n_0\
    );
\icmp_ln895_13_reg_1622[0]_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"333E8000"
    )
        port map (
      I0 => \icmp_ln895_13_reg_1622[0]_i_6_n_0\,
      I1 => zext_ln215_reg_1453(4),
      I2 => \tmp_11_reg_1627[6]_i_2_n_0\,
      I3 => zext_ln215_reg_1453(3),
      I4 => zext_ln215_reg_1453(5),
      O => \icmp_ln895_13_reg_1622[0]_i_4_n_0\
    );
\icmp_ln895_13_reg_1622[0]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF00005400"
    )
        port map (
      I0 => \icmp_ln895_1_reg_1524[0]_i_8_n_0\,
      I1 => \tmp_11_reg_1627[6]_i_2_n_0\,
      I2 => zext_ln215_reg_1453(3),
      I3 => \tmp_1_reg_1529[6]_i_3_n_0\,
      I4 => \tmp_1_reg_1529[6]_i_4_n_0\,
      I5 => zext_ln215_reg_1453(10),
      O => \icmp_ln895_13_reg_1622[0]_i_5_n_0\
    );
\icmp_ln895_13_reg_1622[0]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFF99FFF9FFFFFF6"
    )
        port map (
      I0 => add_ln647_3_reg_1497(2),
      I1 => zext_ln215_reg_1453(2),
      I2 => add_ln647_reg_1469(0),
      I3 => zext_ln215_reg_1453(0),
      I4 => add_ln647_reg_1469(1),
      I5 => zext_ln215_reg_1453(1),
      O => \icmp_ln895_13_reg_1622[0]_i_6_n_0\
    );
\icmp_ln895_13_reg_1622_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => icmp_ln895_13_fu_765_p2,
      Q => icmp_ln895_13_reg_1622,
      R => '0'
    );
\icmp_ln895_14_reg_1644[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFEEEEEEEEEEEEE"
    )
        port map (
      I0 => zext_ln215_reg_1453(11),
      I1 => \icmp_ln895_14_reg_1644[0]_i_2_n_0\,
      I2 => \icmp_ln895_14_reg_1644[0]_i_3_n_0\,
      I3 => \icmp_ln895_14_reg_1644[0]_i_4_n_0\,
      I4 => add_ln1353_13_fu_799_p2(9),
      I5 => \icmp_ln895_14_reg_1644[0]_i_5_n_0\,
      O => icmp_ln895_14_fu_805_p2
    );
\icmp_ln895_14_reg_1644[0]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"2000200020000000"
    )
        port map (
      I0 => \icmp_ln895_1_reg_1524[0]_i_6_n_0\,
      I1 => \tmp_1_reg_1529[6]_i_4_n_0\,
      I2 => zext_ln215_reg_1453(4),
      I3 => zext_ln215_reg_1453(5),
      I4 => zext_ln215_reg_1453(3),
      I5 => \tmp_13_reg_1649[6]_i_2_n_0\,
      O => \icmp_ln895_14_reg_1644[0]_i_2_n_0\
    );
\icmp_ln895_14_reg_1644[0]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"777FFFFFFFFFEEEA"
    )
        port map (
      I0 => zext_ln215_reg_1453(8),
      I1 => \tmp_1_reg_1529[6]_i_3_n_0\,
      I2 => zext_ln215_reg_1453(3),
      I3 => \tmp_13_reg_1649[6]_i_2_n_0\,
      I4 => zext_ln215_reg_1453(7),
      I5 => zext_ln215_reg_1453(6),
      O => \icmp_ln895_14_reg_1644[0]_i_3_n_0\
    );
\icmp_ln895_14_reg_1644[0]_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"333E8000"
    )
        port map (
      I0 => \icmp_ln895_14_reg_1644[0]_i_6_n_0\,
      I1 => zext_ln215_reg_1453(4),
      I2 => \tmp_13_reg_1649[6]_i_2_n_0\,
      I3 => zext_ln215_reg_1453(3),
      I4 => zext_ln215_reg_1453(5),
      O => \icmp_ln895_14_reg_1644[0]_i_4_n_0\
    );
\icmp_ln895_14_reg_1644[0]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF00005400"
    )
        port map (
      I0 => \icmp_ln895_1_reg_1524[0]_i_8_n_0\,
      I1 => \tmp_13_reg_1649[6]_i_2_n_0\,
      I2 => zext_ln215_reg_1453(3),
      I3 => \tmp_1_reg_1529[6]_i_3_n_0\,
      I4 => \tmp_1_reg_1529[6]_i_4_n_0\,
      I5 => zext_ln215_reg_1453(10),
      O => \icmp_ln895_14_reg_1644[0]_i_5_n_0\
    );
\icmp_ln895_14_reg_1644[0]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFF99FFF9FFFFFF6"
    )
        port map (
      I0 => add_ln647_4_reg_1502(2),
      I1 => zext_ln215_reg_1453(2),
      I2 => trunc_ln647_reg_1464(0),
      I3 => zext_ln215_reg_1453(0),
      I4 => zext_ln215_reg_1453(1),
      I5 => add_ln647_1_reg_1474(1),
      O => \icmp_ln895_14_reg_1644[0]_i_6_n_0\
    );
\icmp_ln895_14_reg_1644_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => icmp_ln895_14_fu_805_p2,
      Q => icmp_ln895_14_reg_1644,
      R => '0'
    );
\icmp_ln895_15_reg_1666[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFEEEEEEEEEEEEE"
    )
        port map (
      I0 => zext_ln215_reg_1453(11),
      I1 => \icmp_ln895_15_reg_1666[0]_i_2_n_0\,
      I2 => \icmp_ln895_15_reg_1666[0]_i_3_n_0\,
      I3 => \icmp_ln895_15_reg_1666[0]_i_4_n_0\,
      I4 => add_ln1353_15_fu_839_p2(9),
      I5 => \icmp_ln895_15_reg_1666[0]_i_5_n_0\,
      O => icmp_ln895_15_fu_845_p2
    );
\icmp_ln895_15_reg_1666[0]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"2000200020000000"
    )
        port map (
      I0 => \icmp_ln895_1_reg_1524[0]_i_6_n_0\,
      I1 => \tmp_1_reg_1529[6]_i_4_n_0\,
      I2 => zext_ln215_reg_1453(4),
      I3 => zext_ln215_reg_1453(5),
      I4 => zext_ln215_reg_1453(3),
      I5 => \tmp_15_reg_1671[6]_i_2_n_0\,
      O => \icmp_ln895_15_reg_1666[0]_i_2_n_0\
    );
\icmp_ln895_15_reg_1666[0]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"777FFFFFFFFFEEEA"
    )
        port map (
      I0 => zext_ln215_reg_1453(8),
      I1 => \tmp_1_reg_1529[6]_i_3_n_0\,
      I2 => zext_ln215_reg_1453(3),
      I3 => \tmp_15_reg_1671[6]_i_2_n_0\,
      I4 => zext_ln215_reg_1453(7),
      I5 => zext_ln215_reg_1453(6),
      O => \icmp_ln895_15_reg_1666[0]_i_3_n_0\
    );
\icmp_ln895_15_reg_1666[0]_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"333E8000"
    )
        port map (
      I0 => \icmp_ln895_15_reg_1666[0]_i_6_n_0\,
      I1 => zext_ln215_reg_1453(4),
      I2 => \tmp_15_reg_1671[6]_i_2_n_0\,
      I3 => zext_ln215_reg_1453(3),
      I4 => zext_ln215_reg_1453(5),
      O => \icmp_ln895_15_reg_1666[0]_i_4_n_0\
    );
\icmp_ln895_15_reg_1666[0]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF00005400"
    )
        port map (
      I0 => \icmp_ln895_1_reg_1524[0]_i_8_n_0\,
      I1 => \tmp_15_reg_1671[6]_i_2_n_0\,
      I2 => zext_ln215_reg_1453(3),
      I3 => \tmp_1_reg_1529[6]_i_3_n_0\,
      I4 => \tmp_1_reg_1529[6]_i_4_n_0\,
      I5 => zext_ln215_reg_1453(10),
      O => \icmp_ln895_15_reg_1666[0]_i_5_n_0\
    );
\icmp_ln895_15_reg_1666[0]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFF99FFF9FFFFFF6"
    )
        port map (
      I0 => add_ln647_5_reg_1507(2),
      I1 => zext_ln215_reg_1453(2),
      I2 => add_ln647_reg_1469(0),
      I3 => zext_ln215_reg_1453(0),
      I4 => add_ln647_2_reg_1479(1),
      I5 => zext_ln215_reg_1453(1),
      O => \icmp_ln895_15_reg_1666[0]_i_6_n_0\
    );
\icmp_ln895_15_reg_1666_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => icmp_ln895_15_fu_845_p2,
      Q => icmp_ln895_15_reg_1666,
      R => '0'
    );
\icmp_ln895_1_reg_1524[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFEEEEEEEEEEEEE"
    )
        port map (
      I0 => zext_ln215_reg_1453(11),
      I1 => \icmp_ln895_1_reg_1524[0]_i_2_n_0\,
      I2 => \icmp_ln895_1_reg_1524[0]_i_3_n_0\,
      I3 => \icmp_ln895_1_reg_1524[0]_i_4_n_0\,
      I4 => add_ln1353_1_fu_578_p2(9),
      I5 => \icmp_ln895_1_reg_1524[0]_i_5_n_0\,
      O => icmp_ln895_1_fu_584_p2
    );
\icmp_ln895_1_reg_1524[0]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"2000200020000000"
    )
        port map (
      I0 => \icmp_ln895_1_reg_1524[0]_i_6_n_0\,
      I1 => \tmp_1_reg_1529[6]_i_4_n_0\,
      I2 => zext_ln215_reg_1453(4),
      I3 => zext_ln215_reg_1453(5),
      I4 => zext_ln215_reg_1453(3),
      I5 => \tmp_1_reg_1529[6]_i_2_n_0\,
      O => \icmp_ln895_1_reg_1524[0]_i_2_n_0\
    );
\icmp_ln895_1_reg_1524[0]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"777FFFFFFFFFEEEA"
    )
        port map (
      I0 => zext_ln215_reg_1453(8),
      I1 => \tmp_1_reg_1529[6]_i_3_n_0\,
      I2 => zext_ln215_reg_1453(3),
      I3 => \tmp_1_reg_1529[6]_i_2_n_0\,
      I4 => zext_ln215_reg_1453(7),
      I5 => zext_ln215_reg_1453(6),
      O => \icmp_ln895_1_reg_1524[0]_i_3_n_0\
    );
\icmp_ln895_1_reg_1524[0]_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"333E8000"
    )
        port map (
      I0 => \icmp_ln895_1_reg_1524[0]_i_7_n_0\,
      I1 => zext_ln215_reg_1453(4),
      I2 => \tmp_1_reg_1529[6]_i_2_n_0\,
      I3 => zext_ln215_reg_1453(3),
      I4 => zext_ln215_reg_1453(5),
      O => \icmp_ln895_1_reg_1524[0]_i_4_n_0\
    );
\icmp_ln895_1_reg_1524[0]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF00005400"
    )
        port map (
      I0 => \icmp_ln895_1_reg_1524[0]_i_8_n_0\,
      I1 => \tmp_1_reg_1529[6]_i_2_n_0\,
      I2 => zext_ln215_reg_1453(3),
      I3 => \tmp_1_reg_1529[6]_i_3_n_0\,
      I4 => \tmp_1_reg_1529[6]_i_4_n_0\,
      I5 => zext_ln215_reg_1453(10),
      O => \icmp_ln895_1_reg_1524[0]_i_5_n_0\
    );
\icmp_ln895_1_reg_1524[0]_i_6\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"80"
    )
        port map (
      I0 => zext_ln215_reg_1453(10),
      I1 => zext_ln215_reg_1453(8),
      I2 => zext_ln215_reg_1453(9),
      O => \icmp_ln895_1_reg_1524[0]_i_6_n_0\
    );
\icmp_ln895_1_reg_1524[0]_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFEBD7FBD7FFFFE"
    )
        port map (
      I0 => trunc_ln647_reg_1464(1),
      I1 => zext_ln215_reg_1453(0),
      I2 => trunc_ln647_reg_1464(0),
      I3 => zext_ln215_reg_1453(1),
      I4 => trunc_ln647_reg_1464(2),
      I5 => zext_ln215_reg_1453(2),
      O => \icmp_ln895_1_reg_1524[0]_i_7_n_0\
    );
\icmp_ln895_1_reg_1524[0]_i_8\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"7"
    )
        port map (
      I0 => zext_ln215_reg_1453(9),
      I1 => zext_ln215_reg_1453(8),
      O => \icmp_ln895_1_reg_1524[0]_i_8_n_0\
    );
\icmp_ln895_1_reg_1524_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => icmp_ln895_1_fu_584_p2,
      Q => icmp_ln895_1_reg_1524,
      R => '0'
    );
\icmp_ln895_9_reg_1546[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFEEEEEEEEEEEEE"
    )
        port map (
      I0 => zext_ln215_reg_1453(11),
      I1 => \icmp_ln895_9_reg_1546[0]_i_2_n_0\,
      I2 => \icmp_ln895_9_reg_1546[0]_i_3_n_0\,
      I3 => \icmp_ln895_9_reg_1546[0]_i_4_n_0\,
      I4 => add_ln1353_3_fu_618_p2(9),
      I5 => \icmp_ln895_9_reg_1546[0]_i_5_n_0\,
      O => icmp_ln895_9_fu_624_p2
    );
\icmp_ln895_9_reg_1546[0]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"2000200020000000"
    )
        port map (
      I0 => \icmp_ln895_1_reg_1524[0]_i_6_n_0\,
      I1 => \tmp_1_reg_1529[6]_i_4_n_0\,
      I2 => zext_ln215_reg_1453(4),
      I3 => zext_ln215_reg_1453(5),
      I4 => zext_ln215_reg_1453(3),
      I5 => \tmp_3_reg_1551[6]_i_2_n_0\,
      O => \icmp_ln895_9_reg_1546[0]_i_2_n_0\
    );
\icmp_ln895_9_reg_1546[0]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"777FFFFFFFFFEEEA"
    )
        port map (
      I0 => zext_ln215_reg_1453(8),
      I1 => \tmp_1_reg_1529[6]_i_3_n_0\,
      I2 => zext_ln215_reg_1453(3),
      I3 => \tmp_3_reg_1551[6]_i_2_n_0\,
      I4 => zext_ln215_reg_1453(7),
      I5 => zext_ln215_reg_1453(6),
      O => \icmp_ln895_9_reg_1546[0]_i_3_n_0\
    );
\icmp_ln895_9_reg_1546[0]_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"333E8000"
    )
        port map (
      I0 => \icmp_ln895_9_reg_1546[0]_i_6_n_0\,
      I1 => zext_ln215_reg_1453(4),
      I2 => \tmp_3_reg_1551[6]_i_2_n_0\,
      I3 => zext_ln215_reg_1453(3),
      I4 => zext_ln215_reg_1453(5),
      O => \icmp_ln895_9_reg_1546[0]_i_4_n_0\
    );
\icmp_ln895_9_reg_1546[0]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF00005400"
    )
        port map (
      I0 => \icmp_ln895_1_reg_1524[0]_i_8_n_0\,
      I1 => \tmp_3_reg_1551[6]_i_2_n_0\,
      I2 => zext_ln215_reg_1453(3),
      I3 => \tmp_1_reg_1529[6]_i_3_n_0\,
      I4 => \tmp_1_reg_1529[6]_i_4_n_0\,
      I5 => zext_ln215_reg_1453(10),
      O => \icmp_ln895_9_reg_1546[0]_i_5_n_0\
    );
\icmp_ln895_9_reg_1546[0]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFF99FFF9FFFFFF6"
    )
        port map (
      I0 => add_ln647_reg_1469(2),
      I1 => zext_ln215_reg_1453(2),
      I2 => add_ln647_reg_1469(0),
      I3 => zext_ln215_reg_1453(0),
      I4 => add_ln647_reg_1469(1),
      I5 => zext_ln215_reg_1453(1),
      O => \icmp_ln895_9_reg_1546[0]_i_6_n_0\
    );
\icmp_ln895_9_reg_1546_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => icmp_ln895_9_fu_624_p2,
      Q => icmp_ln895_9_reg_1546,
      R => '0'
    );
lut_tables_0_U: entity work.hls_get_trig_vals_get_trig_vals_lutbkb
     port map (
      add_ln1353_reg_1512(12 downto 0) => add_ln1353_reg_1512(12 downto 0),
      ap_clk => ap_clk,
      ap_enable_reg_pp0_iter3 => ap_enable_reg_pp0_iter3,
      ce1 => ap_enable_reg_pp0_iter2,
      hw_trig_vals_0_V(35 downto 0) => hw_trig_vals_0_V(35 downto 0),
      hw_trig_vals_8_V(35 downto 0) => hw_trig_vals_8_V(35 downto 0),
      icmp_ln895_1_reg_1524 => icmp_ln895_1_reg_1524,
      tmp_1_reg_1529(7 downto 0) => tmp_1_reg_1529(7 downto 0)
    );
lut_tables_1_U: entity work.hls_get_trig_vals_get_trig_vals_lutcud
     port map (
      add_ln1353_2_reg_1534(12 downto 0) => add_ln1353_2_reg_1534(12 downto 0),
      ap_clk => ap_clk,
      ap_enable_reg_pp0_iter3 => ap_enable_reg_pp0_iter3,
      ce1 => ap_enable_reg_pp0_iter2,
      hw_trig_vals_1_V(35 downto 0) => hw_trig_vals_1_V(35 downto 0),
      hw_trig_vals_9_V(35 downto 0) => hw_trig_vals_9_V(35 downto 0),
      icmp_ln895_9_reg_1546 => icmp_ln895_9_reg_1546,
      tmp_3_reg_1551(7 downto 0) => tmp_3_reg_1551(7 downto 0)
    );
lut_tables_2_U: entity work.hls_get_trig_vals_get_trig_vals_lutdEe
     port map (
      add_ln1353_4_reg_1556(11 downto 0) => add_ln1353_4_reg_1556(12 downto 1),
      add_ln1353_reg_1512(0) => add_ln1353_reg_1512(0),
      ap_clk => ap_clk,
      ap_enable_reg_pp0_iter3 => ap_enable_reg_pp0_iter3,
      ce1 => ap_enable_reg_pp0_iter2,
      hw_trig_vals_10_V(35 downto 0) => hw_trig_vals_10_V(35 downto 0),
      hw_trig_vals_2_V(35 downto 0) => hw_trig_vals_2_V(35 downto 0),
      icmp_ln895_10_reg_1568 => icmp_ln895_10_reg_1568,
      tmp_5_reg_1573(7 downto 0) => tmp_5_reg_1573(7 downto 0)
    );
lut_tables_3_U: entity work.hls_get_trig_vals_get_trig_vals_luteOg
     port map (
      add_ln1353_2_reg_1534(0) => add_ln1353_2_reg_1534(0),
      add_ln1353_6_reg_1578(11 downto 0) => add_ln1353_6_reg_1578(12 downto 1),
      ap_clk => ap_clk,
      ap_enable_reg_pp0_iter3 => ap_enable_reg_pp0_iter3,
      ce1 => ap_enable_reg_pp0_iter2,
      hw_trig_vals_11_V(35 downto 0) => hw_trig_vals_11_V(35 downto 0),
      hw_trig_vals_3_V(35 downto 0) => hw_trig_vals_3_V(35 downto 0),
      icmp_ln895_11_reg_1590 => icmp_ln895_11_reg_1590,
      tmp_7_reg_1595(7 downto 0) => tmp_7_reg_1595(7 downto 0)
    );
lut_tables_4_U: entity work.hls_get_trig_vals_get_trig_vals_lutfYi
     port map (
      add_ln1353_8_reg_1484_pp0_iter1_reg(12 downto 0) => add_ln1353_8_reg_1484_pp0_iter1_reg(12 downto 0),
      ap_clk => ap_clk,
      ap_enable_reg_pp0_iter3 => ap_enable_reg_pp0_iter3,
      ce1 => ap_enable_reg_pp0_iter2,
      hw_trig_vals_12_V(35 downto 0) => hw_trig_vals_12_V(35 downto 0),
      hw_trig_vals_4_V(35 downto 0) => hw_trig_vals_4_V(35 downto 0),
      icmp_ln895_12_reg_1600 => icmp_ln895_12_reg_1600,
      tmp_9_reg_1605(7 downto 0) => tmp_9_reg_1605(7 downto 0)
    );
lut_tables_5_U: entity work.hls_get_trig_vals_get_trig_vals_lutg8j
     port map (
      add_ln1353_10_reg_1610(10 downto 0) => add_ln1353_10_reg_1610(12 downto 2),
      add_ln1353_2_reg_1534(1 downto 0) => add_ln1353_2_reg_1534(1 downto 0),
      ap_clk => ap_clk,
      ap_enable_reg_pp0_iter3 => ap_enable_reg_pp0_iter3,
      ce1 => ap_enable_reg_pp0_iter2,
      hw_trig_vals_13_V(35 downto 0) => hw_trig_vals_13_V(35 downto 0),
      hw_trig_vals_5_V(35 downto 0) => hw_trig_vals_5_V(35 downto 0),
      icmp_ln895_13_reg_1622 => icmp_ln895_13_reg_1622,
      tmp_11_reg_1627(7 downto 0) => tmp_11_reg_1627(7 downto 0)
    );
lut_tables_6_U: entity work.hls_get_trig_vals_get_trig_vals_luthbi
     port map (
      add_ln1353_12_reg_1632(10 downto 0) => add_ln1353_12_reg_1632(12 downto 2),
      add_ln1353_4_reg_1556(0) => add_ln1353_4_reg_1556(1),
      add_ln1353_reg_1512(0) => add_ln1353_reg_1512(0),
      ap_clk => ap_clk,
      ap_enable_reg_pp0_iter3 => ap_enable_reg_pp0_iter3,
      ce1 => ap_enable_reg_pp0_iter2,
      hw_trig_vals_14_V(35 downto 0) => hw_trig_vals_14_V(35 downto 0),
      hw_trig_vals_6_V(35 downto 0) => hw_trig_vals_6_V(35 downto 0),
      icmp_ln895_14_reg_1644 => icmp_ln895_14_reg_1644,
      tmp_13_reg_1649(7 downto 0) => tmp_13_reg_1649(7 downto 0)
    );
lut_tables_7_U: entity work.hls_get_trig_vals_get_trig_vals_lutibs
     port map (
      add_ln1353_14_reg_1654(10 downto 0) => add_ln1353_14_reg_1654(12 downto 2),
      add_ln1353_2_reg_1534(0) => add_ln1353_2_reg_1534(0),
      add_ln1353_6_reg_1578(0) => add_ln1353_6_reg_1578(1),
      ap_clk => ap_clk,
      ap_enable_reg_pp0_iter3 => ap_enable_reg_pp0_iter3,
      ce1 => ap_enable_reg_pp0_iter2,
      hw_trig_vals_15_V(35 downto 0) => hw_trig_vals_15_V(35 downto 0),
      hw_trig_vals_7_V(35 downto 0) => hw_trig_vals_7_V(35 downto 0),
      icmp_ln895_15_reg_1666 => icmp_ln895_15_reg_1666,
      tmp_15_reg_1671(7 downto 0) => tmp_15_reg_1671(7 downto 0)
    );
\tmp_11_reg_1627[0]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => zext_ln215_reg_1453(3),
      I1 => \tmp_11_reg_1627[6]_i_2_n_0\,
      O => add_ln1353_11_fu_759_p2(3)
    );
\tmp_11_reg_1627[1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"1E"
    )
        port map (
      I0 => zext_ln215_reg_1453(3),
      I1 => \tmp_11_reg_1627[6]_i_2_n_0\,
      I2 => zext_ln215_reg_1453(4),
      O => add_ln1353_11_fu_759_p2(4)
    );
\tmp_11_reg_1627[2]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"57A8"
    )
        port map (
      I0 => zext_ln215_reg_1453(4),
      I1 => \tmp_11_reg_1627[6]_i_2_n_0\,
      I2 => zext_ln215_reg_1453(3),
      I3 => zext_ln215_reg_1453(5),
      O => add_ln1353_11_fu_759_p2(5)
    );
\tmp_11_reg_1627[3]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"1FFFE000"
    )
        port map (
      I0 => \tmp_11_reg_1627[6]_i_2_n_0\,
      I1 => zext_ln215_reg_1453(3),
      I2 => zext_ln215_reg_1453(5),
      I3 => zext_ln215_reg_1453(4),
      I4 => zext_ln215_reg_1453(6),
      O => add_ln1353_11_fu_759_p2(6)
    );
\tmp_11_reg_1627[4]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7F7F7FFF80808000"
    )
        port map (
      I0 => zext_ln215_reg_1453(6),
      I1 => zext_ln215_reg_1453(4),
      I2 => zext_ln215_reg_1453(5),
      I3 => zext_ln215_reg_1453(3),
      I4 => \tmp_11_reg_1627[6]_i_2_n_0\,
      I5 => zext_ln215_reg_1453(7),
      O => add_ln1353_11_fu_759_p2(7)
    );
\tmp_11_reg_1627[5]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BFBFBFFF40404000"
    )
        port map (
      I0 => \tmp_1_reg_1529[6]_i_4_n_0\,
      I1 => zext_ln215_reg_1453(4),
      I2 => zext_ln215_reg_1453(5),
      I3 => zext_ln215_reg_1453(3),
      I4 => \tmp_11_reg_1627[6]_i_2_n_0\,
      I5 => zext_ln215_reg_1453(8),
      O => add_ln1353_11_fu_759_p2(8)
    );
\tmp_11_reg_1627[6]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFF57FF0000A800"
    )
        port map (
      I0 => zext_ln215_reg_1453(8),
      I1 => \tmp_11_reg_1627[6]_i_2_n_0\,
      I2 => zext_ln215_reg_1453(3),
      I3 => \tmp_1_reg_1529[6]_i_3_n_0\,
      I4 => \tmp_1_reg_1529[6]_i_4_n_0\,
      I5 => zext_ln215_reg_1453(9),
      O => add_ln1353_11_fu_759_p2(9)
    );
\tmp_11_reg_1627[6]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"EEE8E888E888E888"
    )
        port map (
      I0 => add_ln647_3_reg_1497(2),
      I1 => zext_ln215_reg_1453(2),
      I2 => add_ln647_reg_1469(1),
      I3 => zext_ln215_reg_1453(1),
      I4 => zext_ln215_reg_1453(0),
      I5 => add_ln647_reg_1469(0),
      O => \tmp_11_reg_1627[6]_i_2_n_0\
    );
\tmp_11_reg_1627[7]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7F80"
    )
        port map (
      I0 => zext_ln215_reg_1453(8),
      I1 => zext_ln215_reg_1453(9),
      I2 => \tmp_11_reg_1627[7]_i_2_n_0\,
      I3 => zext_ln215_reg_1453(10),
      O => add_ln1353_11_fu_759_p2(10)
    );
\tmp_11_reg_1627[7]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"E000000000000000"
    )
        port map (
      I0 => \tmp_11_reg_1627[6]_i_2_n_0\,
      I1 => zext_ln215_reg_1453(3),
      I2 => zext_ln215_reg_1453(5),
      I3 => zext_ln215_reg_1453(4),
      I4 => zext_ln215_reg_1453(6),
      I5 => zext_ln215_reg_1453(7),
      O => \tmp_11_reg_1627[7]_i_2_n_0\
    );
\tmp_11_reg_1627_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => add_ln1353_11_fu_759_p2(3),
      Q => tmp_11_reg_1627(0),
      R => '0'
    );
\tmp_11_reg_1627_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => add_ln1353_11_fu_759_p2(4),
      Q => tmp_11_reg_1627(1),
      R => '0'
    );
\tmp_11_reg_1627_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => add_ln1353_11_fu_759_p2(5),
      Q => tmp_11_reg_1627(2),
      R => '0'
    );
\tmp_11_reg_1627_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => add_ln1353_11_fu_759_p2(6),
      Q => tmp_11_reg_1627(3),
      R => '0'
    );
\tmp_11_reg_1627_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => add_ln1353_11_fu_759_p2(7),
      Q => tmp_11_reg_1627(4),
      R => '0'
    );
\tmp_11_reg_1627_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => add_ln1353_11_fu_759_p2(8),
      Q => tmp_11_reg_1627(5),
      R => '0'
    );
\tmp_11_reg_1627_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => add_ln1353_11_fu_759_p2(9),
      Q => tmp_11_reg_1627(6),
      R => '0'
    );
\tmp_11_reg_1627_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => add_ln1353_11_fu_759_p2(10),
      Q => tmp_11_reg_1627(7),
      R => '0'
    );
\tmp_13_reg_1649[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"A9A9A995A9959595"
    )
        port map (
      I0 => zext_ln215_reg_1453(3),
      I1 => add_ln647_4_reg_1502(2),
      I2 => zext_ln215_reg_1453(2),
      I3 => add_ln647_1_reg_1474(1),
      I4 => \tmp_1_reg_1529[0]_i_2_n_0\,
      I5 => zext_ln215_reg_1453(1),
      O => add_ln1353_13_fu_799_p2(3)
    );
\tmp_13_reg_1649[1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"1E"
    )
        port map (
      I0 => zext_ln215_reg_1453(3),
      I1 => \tmp_13_reg_1649[6]_i_2_n_0\,
      I2 => zext_ln215_reg_1453(4),
      O => add_ln1353_13_fu_799_p2(4)
    );
\tmp_13_reg_1649[2]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"57A8"
    )
        port map (
      I0 => zext_ln215_reg_1453(4),
      I1 => \tmp_13_reg_1649[6]_i_2_n_0\,
      I2 => zext_ln215_reg_1453(3),
      I3 => zext_ln215_reg_1453(5),
      O => add_ln1353_13_fu_799_p2(5)
    );
\tmp_13_reg_1649[3]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"1FFFE000"
    )
        port map (
      I0 => \tmp_13_reg_1649[6]_i_2_n_0\,
      I1 => zext_ln215_reg_1453(3),
      I2 => zext_ln215_reg_1453(5),
      I3 => zext_ln215_reg_1453(4),
      I4 => zext_ln215_reg_1453(6),
      O => add_ln1353_13_fu_799_p2(6)
    );
\tmp_13_reg_1649[4]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7F7F7FFF80808000"
    )
        port map (
      I0 => zext_ln215_reg_1453(6),
      I1 => zext_ln215_reg_1453(4),
      I2 => zext_ln215_reg_1453(5),
      I3 => zext_ln215_reg_1453(3),
      I4 => \tmp_13_reg_1649[6]_i_2_n_0\,
      I5 => zext_ln215_reg_1453(7),
      O => add_ln1353_13_fu_799_p2(7)
    );
\tmp_13_reg_1649[5]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BFBFBFFF40404000"
    )
        port map (
      I0 => \tmp_1_reg_1529[6]_i_4_n_0\,
      I1 => zext_ln215_reg_1453(4),
      I2 => zext_ln215_reg_1453(5),
      I3 => zext_ln215_reg_1453(3),
      I4 => \tmp_13_reg_1649[6]_i_2_n_0\,
      I5 => zext_ln215_reg_1453(8),
      O => add_ln1353_13_fu_799_p2(8)
    );
\tmp_13_reg_1649[6]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFF57FF0000A800"
    )
        port map (
      I0 => zext_ln215_reg_1453(8),
      I1 => \tmp_13_reg_1649[6]_i_2_n_0\,
      I2 => zext_ln215_reg_1453(3),
      I3 => \tmp_1_reg_1529[6]_i_3_n_0\,
      I4 => \tmp_1_reg_1529[6]_i_4_n_0\,
      I5 => zext_ln215_reg_1453(9),
      O => add_ln1353_13_fu_799_p2(9)
    );
\tmp_13_reg_1649[6]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"EEE8E8E8E8888888"
    )
        port map (
      I0 => add_ln647_4_reg_1502(2),
      I1 => zext_ln215_reg_1453(2),
      I2 => add_ln647_1_reg_1474(1),
      I3 => zext_ln215_reg_1453(0),
      I4 => trunc_ln647_reg_1464(0),
      I5 => zext_ln215_reg_1453(1),
      O => \tmp_13_reg_1649[6]_i_2_n_0\
    );
\tmp_13_reg_1649[7]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7F80"
    )
        port map (
      I0 => zext_ln215_reg_1453(8),
      I1 => zext_ln215_reg_1453(9),
      I2 => \tmp_13_reg_1649[7]_i_2_n_0\,
      I3 => zext_ln215_reg_1453(10),
      O => add_ln1353_13_fu_799_p2(10)
    );
\tmp_13_reg_1649[7]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"E000000000000000"
    )
        port map (
      I0 => \tmp_13_reg_1649[6]_i_2_n_0\,
      I1 => zext_ln215_reg_1453(3),
      I2 => zext_ln215_reg_1453(5),
      I3 => zext_ln215_reg_1453(4),
      I4 => zext_ln215_reg_1453(6),
      I5 => zext_ln215_reg_1453(7),
      O => \tmp_13_reg_1649[7]_i_2_n_0\
    );
\tmp_13_reg_1649_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => add_ln1353_13_fu_799_p2(3),
      Q => tmp_13_reg_1649(0),
      R => '0'
    );
\tmp_13_reg_1649_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => add_ln1353_13_fu_799_p2(4),
      Q => tmp_13_reg_1649(1),
      R => '0'
    );
\tmp_13_reg_1649_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => add_ln1353_13_fu_799_p2(5),
      Q => tmp_13_reg_1649(2),
      R => '0'
    );
\tmp_13_reg_1649_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => add_ln1353_13_fu_799_p2(6),
      Q => tmp_13_reg_1649(3),
      R => '0'
    );
\tmp_13_reg_1649_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => add_ln1353_13_fu_799_p2(7),
      Q => tmp_13_reg_1649(4),
      R => '0'
    );
\tmp_13_reg_1649_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => add_ln1353_13_fu_799_p2(8),
      Q => tmp_13_reg_1649(5),
      R => '0'
    );
\tmp_13_reg_1649_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => add_ln1353_13_fu_799_p2(9),
      Q => tmp_13_reg_1649(6),
      R => '0'
    );
\tmp_13_reg_1649_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => add_ln1353_13_fu_799_p2(10),
      Q => tmp_13_reg_1649(7),
      R => '0'
    );
\tmp_15_reg_1671[0]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => zext_ln215_reg_1453(3),
      I1 => \tmp_15_reg_1671[6]_i_2_n_0\,
      O => add_ln1353_15_fu_839_p2(3)
    );
\tmp_15_reg_1671[1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"1E"
    )
        port map (
      I0 => zext_ln215_reg_1453(3),
      I1 => \tmp_15_reg_1671[6]_i_2_n_0\,
      I2 => zext_ln215_reg_1453(4),
      O => add_ln1353_15_fu_839_p2(4)
    );
\tmp_15_reg_1671[2]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"57A8"
    )
        port map (
      I0 => zext_ln215_reg_1453(4),
      I1 => \tmp_15_reg_1671[6]_i_2_n_0\,
      I2 => zext_ln215_reg_1453(3),
      I3 => zext_ln215_reg_1453(5),
      O => add_ln1353_15_fu_839_p2(5)
    );
\tmp_15_reg_1671[3]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"1FFFE000"
    )
        port map (
      I0 => \tmp_15_reg_1671[6]_i_2_n_0\,
      I1 => zext_ln215_reg_1453(3),
      I2 => zext_ln215_reg_1453(5),
      I3 => zext_ln215_reg_1453(4),
      I4 => zext_ln215_reg_1453(6),
      O => add_ln1353_15_fu_839_p2(6)
    );
\tmp_15_reg_1671[4]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7F7F7FFF80808000"
    )
        port map (
      I0 => zext_ln215_reg_1453(6),
      I1 => zext_ln215_reg_1453(4),
      I2 => zext_ln215_reg_1453(5),
      I3 => zext_ln215_reg_1453(3),
      I4 => \tmp_15_reg_1671[6]_i_2_n_0\,
      I5 => zext_ln215_reg_1453(7),
      O => add_ln1353_15_fu_839_p2(7)
    );
\tmp_15_reg_1671[5]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BFBFBFFF40404000"
    )
        port map (
      I0 => \tmp_1_reg_1529[6]_i_4_n_0\,
      I1 => zext_ln215_reg_1453(4),
      I2 => zext_ln215_reg_1453(5),
      I3 => zext_ln215_reg_1453(3),
      I4 => \tmp_15_reg_1671[6]_i_2_n_0\,
      I5 => zext_ln215_reg_1453(8),
      O => add_ln1353_15_fu_839_p2(8)
    );
\tmp_15_reg_1671[6]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFF57FF0000A800"
    )
        port map (
      I0 => zext_ln215_reg_1453(8),
      I1 => \tmp_15_reg_1671[6]_i_2_n_0\,
      I2 => zext_ln215_reg_1453(3),
      I3 => \tmp_1_reg_1529[6]_i_3_n_0\,
      I4 => \tmp_1_reg_1529[6]_i_4_n_0\,
      I5 => zext_ln215_reg_1453(9),
      O => add_ln1353_15_fu_839_p2(9)
    );
\tmp_15_reg_1671[6]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"EEE8E888E888E888"
    )
        port map (
      I0 => add_ln647_5_reg_1507(2),
      I1 => zext_ln215_reg_1453(2),
      I2 => add_ln647_2_reg_1479(1),
      I3 => zext_ln215_reg_1453(1),
      I4 => zext_ln215_reg_1453(0),
      I5 => add_ln647_reg_1469(0),
      O => \tmp_15_reg_1671[6]_i_2_n_0\
    );
\tmp_15_reg_1671[7]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7F80"
    )
        port map (
      I0 => zext_ln215_reg_1453(8),
      I1 => zext_ln215_reg_1453(9),
      I2 => \tmp_15_reg_1671[7]_i_2_n_0\,
      I3 => zext_ln215_reg_1453(10),
      O => add_ln1353_15_fu_839_p2(10)
    );
\tmp_15_reg_1671[7]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"E000000000000000"
    )
        port map (
      I0 => \tmp_15_reg_1671[6]_i_2_n_0\,
      I1 => zext_ln215_reg_1453(3),
      I2 => zext_ln215_reg_1453(5),
      I3 => zext_ln215_reg_1453(4),
      I4 => zext_ln215_reg_1453(6),
      I5 => zext_ln215_reg_1453(7),
      O => \tmp_15_reg_1671[7]_i_2_n_0\
    );
\tmp_15_reg_1671_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => add_ln1353_15_fu_839_p2(3),
      Q => tmp_15_reg_1671(0),
      R => '0'
    );
\tmp_15_reg_1671_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => add_ln1353_15_fu_839_p2(4),
      Q => tmp_15_reg_1671(1),
      R => '0'
    );
\tmp_15_reg_1671_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => add_ln1353_15_fu_839_p2(5),
      Q => tmp_15_reg_1671(2),
      R => '0'
    );
\tmp_15_reg_1671_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => add_ln1353_15_fu_839_p2(6),
      Q => tmp_15_reg_1671(3),
      R => '0'
    );
\tmp_15_reg_1671_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => add_ln1353_15_fu_839_p2(7),
      Q => tmp_15_reg_1671(4),
      R => '0'
    );
\tmp_15_reg_1671_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => add_ln1353_15_fu_839_p2(8),
      Q => tmp_15_reg_1671(5),
      R => '0'
    );
\tmp_15_reg_1671_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => add_ln1353_15_fu_839_p2(9),
      Q => tmp_15_reg_1671(6),
      R => '0'
    );
\tmp_15_reg_1671_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => add_ln1353_15_fu_839_p2(10),
      Q => tmp_15_reg_1671(7),
      R => '0'
    );
\tmp_1_reg_1529[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAA995A9955555"
    )
        port map (
      I0 => zext_ln215_reg_1453(3),
      I1 => zext_ln215_reg_1453(1),
      I2 => \tmp_1_reg_1529[0]_i_2_n_0\,
      I3 => trunc_ln647_reg_1464(1),
      I4 => zext_ln215_reg_1453(2),
      I5 => trunc_ln647_reg_1464(2),
      O => add_ln1353_1_fu_578_p2(3)
    );
\tmp_1_reg_1529[0]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => zext_ln215_reg_1453(0),
      I1 => trunc_ln647_reg_1464(0),
      O => \tmp_1_reg_1529[0]_i_2_n_0\
    );
\tmp_1_reg_1529[1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"1E"
    )
        port map (
      I0 => zext_ln215_reg_1453(3),
      I1 => \tmp_1_reg_1529[6]_i_2_n_0\,
      I2 => zext_ln215_reg_1453(4),
      O => add_ln1353_1_fu_578_p2(4)
    );
\tmp_1_reg_1529[2]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"57A8"
    )
        port map (
      I0 => zext_ln215_reg_1453(4),
      I1 => \tmp_1_reg_1529[6]_i_2_n_0\,
      I2 => zext_ln215_reg_1453(3),
      I3 => zext_ln215_reg_1453(5),
      O => add_ln1353_1_fu_578_p2(5)
    );
\tmp_1_reg_1529[3]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"1FFFE000"
    )
        port map (
      I0 => \tmp_1_reg_1529[6]_i_2_n_0\,
      I1 => zext_ln215_reg_1453(3),
      I2 => zext_ln215_reg_1453(5),
      I3 => zext_ln215_reg_1453(4),
      I4 => zext_ln215_reg_1453(6),
      O => add_ln1353_1_fu_578_p2(6)
    );
\tmp_1_reg_1529[4]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7F7F7FFF80808000"
    )
        port map (
      I0 => zext_ln215_reg_1453(6),
      I1 => zext_ln215_reg_1453(4),
      I2 => zext_ln215_reg_1453(5),
      I3 => zext_ln215_reg_1453(3),
      I4 => \tmp_1_reg_1529[6]_i_2_n_0\,
      I5 => zext_ln215_reg_1453(7),
      O => add_ln1353_1_fu_578_p2(7)
    );
\tmp_1_reg_1529[5]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BFBFBFFF40404000"
    )
        port map (
      I0 => \tmp_1_reg_1529[6]_i_4_n_0\,
      I1 => zext_ln215_reg_1453(4),
      I2 => zext_ln215_reg_1453(5),
      I3 => zext_ln215_reg_1453(3),
      I4 => \tmp_1_reg_1529[6]_i_2_n_0\,
      I5 => zext_ln215_reg_1453(8),
      O => add_ln1353_1_fu_578_p2(8)
    );
\tmp_1_reg_1529[6]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFF57FF0000A800"
    )
        port map (
      I0 => zext_ln215_reg_1453(8),
      I1 => \tmp_1_reg_1529[6]_i_2_n_0\,
      I2 => zext_ln215_reg_1453(3),
      I3 => \tmp_1_reg_1529[6]_i_3_n_0\,
      I4 => \tmp_1_reg_1529[6]_i_4_n_0\,
      I5 => zext_ln215_reg_1453(9),
      O => add_ln1353_1_fu_578_p2(9)
    );
\tmp_1_reg_1529[6]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFEA80EA800000"
    )
        port map (
      I0 => zext_ln215_reg_1453(1),
      I1 => trunc_ln647_reg_1464(0),
      I2 => zext_ln215_reg_1453(0),
      I3 => trunc_ln647_reg_1464(1),
      I4 => zext_ln215_reg_1453(2),
      I5 => trunc_ln647_reg_1464(2),
      O => \tmp_1_reg_1529[6]_i_2_n_0\
    );
\tmp_1_reg_1529[6]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => zext_ln215_reg_1453(5),
      I1 => zext_ln215_reg_1453(4),
      O => \tmp_1_reg_1529[6]_i_3_n_0\
    );
\tmp_1_reg_1529[6]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"7"
    )
        port map (
      I0 => zext_ln215_reg_1453(7),
      I1 => zext_ln215_reg_1453(6),
      O => \tmp_1_reg_1529[6]_i_4_n_0\
    );
\tmp_1_reg_1529[7]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7F80"
    )
        port map (
      I0 => zext_ln215_reg_1453(8),
      I1 => zext_ln215_reg_1453(9),
      I2 => \tmp_1_reg_1529[7]_i_2_n_0\,
      I3 => zext_ln215_reg_1453(10),
      O => add_ln1353_1_fu_578_p2(10)
    );
\tmp_1_reg_1529[7]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"E000000000000000"
    )
        port map (
      I0 => \tmp_1_reg_1529[6]_i_2_n_0\,
      I1 => zext_ln215_reg_1453(3),
      I2 => zext_ln215_reg_1453(5),
      I3 => zext_ln215_reg_1453(4),
      I4 => zext_ln215_reg_1453(6),
      I5 => zext_ln215_reg_1453(7),
      O => \tmp_1_reg_1529[7]_i_2_n_0\
    );
\tmp_1_reg_1529_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => add_ln1353_1_fu_578_p2(3),
      Q => tmp_1_reg_1529(0),
      R => '0'
    );
\tmp_1_reg_1529_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => add_ln1353_1_fu_578_p2(4),
      Q => tmp_1_reg_1529(1),
      R => '0'
    );
\tmp_1_reg_1529_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => add_ln1353_1_fu_578_p2(5),
      Q => tmp_1_reg_1529(2),
      R => '0'
    );
\tmp_1_reg_1529_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => add_ln1353_1_fu_578_p2(6),
      Q => tmp_1_reg_1529(3),
      R => '0'
    );
\tmp_1_reg_1529_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => add_ln1353_1_fu_578_p2(7),
      Q => tmp_1_reg_1529(4),
      R => '0'
    );
\tmp_1_reg_1529_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => add_ln1353_1_fu_578_p2(8),
      Q => tmp_1_reg_1529(5),
      R => '0'
    );
\tmp_1_reg_1529_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => add_ln1353_1_fu_578_p2(9),
      Q => tmp_1_reg_1529(6),
      R => '0'
    );
\tmp_1_reg_1529_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => add_ln1353_1_fu_578_p2(10),
      Q => tmp_1_reg_1529(7),
      R => '0'
    );
\tmp_3_reg_1551[0]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => zext_ln215_reg_1453(3),
      I1 => \tmp_3_reg_1551[6]_i_2_n_0\,
      O => add_ln1353_3_fu_618_p2(3)
    );
\tmp_3_reg_1551[1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"1E"
    )
        port map (
      I0 => zext_ln215_reg_1453(3),
      I1 => \tmp_3_reg_1551[6]_i_2_n_0\,
      I2 => zext_ln215_reg_1453(4),
      O => add_ln1353_3_fu_618_p2(4)
    );
\tmp_3_reg_1551[2]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"57A8"
    )
        port map (
      I0 => zext_ln215_reg_1453(4),
      I1 => \tmp_3_reg_1551[6]_i_2_n_0\,
      I2 => zext_ln215_reg_1453(3),
      I3 => zext_ln215_reg_1453(5),
      O => add_ln1353_3_fu_618_p2(5)
    );
\tmp_3_reg_1551[3]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"1FFFE000"
    )
        port map (
      I0 => \tmp_3_reg_1551[6]_i_2_n_0\,
      I1 => zext_ln215_reg_1453(3),
      I2 => zext_ln215_reg_1453(5),
      I3 => zext_ln215_reg_1453(4),
      I4 => zext_ln215_reg_1453(6),
      O => add_ln1353_3_fu_618_p2(6)
    );
\tmp_3_reg_1551[4]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7F7F7FFF80808000"
    )
        port map (
      I0 => zext_ln215_reg_1453(6),
      I1 => zext_ln215_reg_1453(4),
      I2 => zext_ln215_reg_1453(5),
      I3 => zext_ln215_reg_1453(3),
      I4 => \tmp_3_reg_1551[6]_i_2_n_0\,
      I5 => zext_ln215_reg_1453(7),
      O => add_ln1353_3_fu_618_p2(7)
    );
\tmp_3_reg_1551[5]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BFBFBFFF40404000"
    )
        port map (
      I0 => \tmp_1_reg_1529[6]_i_4_n_0\,
      I1 => zext_ln215_reg_1453(4),
      I2 => zext_ln215_reg_1453(5),
      I3 => zext_ln215_reg_1453(3),
      I4 => \tmp_3_reg_1551[6]_i_2_n_0\,
      I5 => zext_ln215_reg_1453(8),
      O => add_ln1353_3_fu_618_p2(8)
    );
\tmp_3_reg_1551[6]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFF57FF0000A800"
    )
        port map (
      I0 => zext_ln215_reg_1453(8),
      I1 => \tmp_3_reg_1551[6]_i_2_n_0\,
      I2 => zext_ln215_reg_1453(3),
      I3 => \tmp_1_reg_1529[6]_i_3_n_0\,
      I4 => \tmp_1_reg_1529[6]_i_4_n_0\,
      I5 => zext_ln215_reg_1453(9),
      O => add_ln1353_3_fu_618_p2(9)
    );
\tmp_3_reg_1551[6]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"EEE8E888E888E888"
    )
        port map (
      I0 => add_ln647_reg_1469(2),
      I1 => zext_ln215_reg_1453(2),
      I2 => add_ln647_reg_1469(1),
      I3 => zext_ln215_reg_1453(1),
      I4 => zext_ln215_reg_1453(0),
      I5 => add_ln647_reg_1469(0),
      O => \tmp_3_reg_1551[6]_i_2_n_0\
    );
\tmp_3_reg_1551[7]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7F80"
    )
        port map (
      I0 => zext_ln215_reg_1453(8),
      I1 => zext_ln215_reg_1453(9),
      I2 => \tmp_3_reg_1551[7]_i_2_n_0\,
      I3 => zext_ln215_reg_1453(10),
      O => add_ln1353_3_fu_618_p2(10)
    );
\tmp_3_reg_1551[7]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"E000000000000000"
    )
        port map (
      I0 => \tmp_3_reg_1551[6]_i_2_n_0\,
      I1 => zext_ln215_reg_1453(3),
      I2 => zext_ln215_reg_1453(5),
      I3 => zext_ln215_reg_1453(4),
      I4 => zext_ln215_reg_1453(6),
      I5 => zext_ln215_reg_1453(7),
      O => \tmp_3_reg_1551[7]_i_2_n_0\
    );
\tmp_3_reg_1551_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => add_ln1353_3_fu_618_p2(3),
      Q => tmp_3_reg_1551(0),
      R => '0'
    );
\tmp_3_reg_1551_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => add_ln1353_3_fu_618_p2(4),
      Q => tmp_3_reg_1551(1),
      R => '0'
    );
\tmp_3_reg_1551_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => add_ln1353_3_fu_618_p2(5),
      Q => tmp_3_reg_1551(2),
      R => '0'
    );
\tmp_3_reg_1551_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => add_ln1353_3_fu_618_p2(6),
      Q => tmp_3_reg_1551(3),
      R => '0'
    );
\tmp_3_reg_1551_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => add_ln1353_3_fu_618_p2(7),
      Q => tmp_3_reg_1551(4),
      R => '0'
    );
\tmp_3_reg_1551_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => add_ln1353_3_fu_618_p2(8),
      Q => tmp_3_reg_1551(5),
      R => '0'
    );
\tmp_3_reg_1551_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => add_ln1353_3_fu_618_p2(9),
      Q => tmp_3_reg_1551(6),
      R => '0'
    );
\tmp_3_reg_1551_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => add_ln1353_3_fu_618_p2(10),
      Q => tmp_3_reg_1551(7),
      R => '0'
    );
\tmp_5_reg_1573[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"A9A9A995A9959595"
    )
        port map (
      I0 => zext_ln215_reg_1453(3),
      I1 => add_ln647_1_reg_1474(2),
      I2 => zext_ln215_reg_1453(2),
      I3 => add_ln647_1_reg_1474(1),
      I4 => \tmp_1_reg_1529[0]_i_2_n_0\,
      I5 => zext_ln215_reg_1453(1),
      O => add_ln1353_5_fu_658_p2(3)
    );
\tmp_5_reg_1573[1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"1E"
    )
        port map (
      I0 => zext_ln215_reg_1453(3),
      I1 => \tmp_5_reg_1573[6]_i_2_n_0\,
      I2 => zext_ln215_reg_1453(4),
      O => add_ln1353_5_fu_658_p2(4)
    );
\tmp_5_reg_1573[2]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"57A8"
    )
        port map (
      I0 => zext_ln215_reg_1453(4),
      I1 => \tmp_5_reg_1573[6]_i_2_n_0\,
      I2 => zext_ln215_reg_1453(3),
      I3 => zext_ln215_reg_1453(5),
      O => add_ln1353_5_fu_658_p2(5)
    );
\tmp_5_reg_1573[3]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"1FFFE000"
    )
        port map (
      I0 => \tmp_5_reg_1573[6]_i_2_n_0\,
      I1 => zext_ln215_reg_1453(3),
      I2 => zext_ln215_reg_1453(5),
      I3 => zext_ln215_reg_1453(4),
      I4 => zext_ln215_reg_1453(6),
      O => add_ln1353_5_fu_658_p2(6)
    );
\tmp_5_reg_1573[4]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7F7F7FFF80808000"
    )
        port map (
      I0 => zext_ln215_reg_1453(6),
      I1 => zext_ln215_reg_1453(4),
      I2 => zext_ln215_reg_1453(5),
      I3 => zext_ln215_reg_1453(3),
      I4 => \tmp_5_reg_1573[6]_i_2_n_0\,
      I5 => zext_ln215_reg_1453(7),
      O => add_ln1353_5_fu_658_p2(7)
    );
\tmp_5_reg_1573[5]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BFBFBFFF40404000"
    )
        port map (
      I0 => \tmp_1_reg_1529[6]_i_4_n_0\,
      I1 => zext_ln215_reg_1453(4),
      I2 => zext_ln215_reg_1453(5),
      I3 => zext_ln215_reg_1453(3),
      I4 => \tmp_5_reg_1573[6]_i_2_n_0\,
      I5 => zext_ln215_reg_1453(8),
      O => add_ln1353_5_fu_658_p2(8)
    );
\tmp_5_reg_1573[6]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFF57FF0000A800"
    )
        port map (
      I0 => zext_ln215_reg_1453(8),
      I1 => \tmp_5_reg_1573[6]_i_2_n_0\,
      I2 => zext_ln215_reg_1453(3),
      I3 => \tmp_1_reg_1529[6]_i_3_n_0\,
      I4 => \tmp_1_reg_1529[6]_i_4_n_0\,
      I5 => zext_ln215_reg_1453(9),
      O => add_ln1353_5_fu_658_p2(9)
    );
\tmp_5_reg_1573[6]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"EEE8E8E8E8888888"
    )
        port map (
      I0 => add_ln647_1_reg_1474(2),
      I1 => zext_ln215_reg_1453(2),
      I2 => add_ln647_1_reg_1474(1),
      I3 => zext_ln215_reg_1453(0),
      I4 => trunc_ln647_reg_1464(0),
      I5 => zext_ln215_reg_1453(1),
      O => \tmp_5_reg_1573[6]_i_2_n_0\
    );
\tmp_5_reg_1573[7]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7F80"
    )
        port map (
      I0 => zext_ln215_reg_1453(8),
      I1 => zext_ln215_reg_1453(9),
      I2 => \tmp_5_reg_1573[7]_i_2_n_0\,
      I3 => zext_ln215_reg_1453(10),
      O => add_ln1353_5_fu_658_p2(10)
    );
\tmp_5_reg_1573[7]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"E000000000000000"
    )
        port map (
      I0 => \tmp_5_reg_1573[6]_i_2_n_0\,
      I1 => zext_ln215_reg_1453(3),
      I2 => zext_ln215_reg_1453(5),
      I3 => zext_ln215_reg_1453(4),
      I4 => zext_ln215_reg_1453(6),
      I5 => zext_ln215_reg_1453(7),
      O => \tmp_5_reg_1573[7]_i_2_n_0\
    );
\tmp_5_reg_1573_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => add_ln1353_5_fu_658_p2(3),
      Q => tmp_5_reg_1573(0),
      R => '0'
    );
\tmp_5_reg_1573_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => add_ln1353_5_fu_658_p2(4),
      Q => tmp_5_reg_1573(1),
      R => '0'
    );
\tmp_5_reg_1573_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => add_ln1353_5_fu_658_p2(5),
      Q => tmp_5_reg_1573(2),
      R => '0'
    );
\tmp_5_reg_1573_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => add_ln1353_5_fu_658_p2(6),
      Q => tmp_5_reg_1573(3),
      R => '0'
    );
\tmp_5_reg_1573_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => add_ln1353_5_fu_658_p2(7),
      Q => tmp_5_reg_1573(4),
      R => '0'
    );
\tmp_5_reg_1573_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => add_ln1353_5_fu_658_p2(8),
      Q => tmp_5_reg_1573(5),
      R => '0'
    );
\tmp_5_reg_1573_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => add_ln1353_5_fu_658_p2(9),
      Q => tmp_5_reg_1573(6),
      R => '0'
    );
\tmp_5_reg_1573_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => add_ln1353_5_fu_658_p2(10),
      Q => tmp_5_reg_1573(7),
      R => '0'
    );
\tmp_7_reg_1595[0]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => zext_ln215_reg_1453(3),
      I1 => \tmp_7_reg_1595[6]_i_2_n_0\,
      O => add_ln1353_7_fu_698_p2(3)
    );
\tmp_7_reg_1595[1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"1E"
    )
        port map (
      I0 => zext_ln215_reg_1453(3),
      I1 => \tmp_7_reg_1595[6]_i_2_n_0\,
      I2 => zext_ln215_reg_1453(4),
      O => add_ln1353_7_fu_698_p2(4)
    );
\tmp_7_reg_1595[2]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"57A8"
    )
        port map (
      I0 => zext_ln215_reg_1453(4),
      I1 => \tmp_7_reg_1595[6]_i_2_n_0\,
      I2 => zext_ln215_reg_1453(3),
      I3 => zext_ln215_reg_1453(5),
      O => add_ln1353_7_fu_698_p2(5)
    );
\tmp_7_reg_1595[3]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"1FFFE000"
    )
        port map (
      I0 => \tmp_7_reg_1595[6]_i_2_n_0\,
      I1 => zext_ln215_reg_1453(3),
      I2 => zext_ln215_reg_1453(5),
      I3 => zext_ln215_reg_1453(4),
      I4 => zext_ln215_reg_1453(6),
      O => add_ln1353_7_fu_698_p2(6)
    );
\tmp_7_reg_1595[4]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7F7F7FFF80808000"
    )
        port map (
      I0 => zext_ln215_reg_1453(6),
      I1 => zext_ln215_reg_1453(4),
      I2 => zext_ln215_reg_1453(5),
      I3 => zext_ln215_reg_1453(3),
      I4 => \tmp_7_reg_1595[6]_i_2_n_0\,
      I5 => zext_ln215_reg_1453(7),
      O => add_ln1353_7_fu_698_p2(7)
    );
\tmp_7_reg_1595[5]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BFBFBFFF40404000"
    )
        port map (
      I0 => \tmp_1_reg_1529[6]_i_4_n_0\,
      I1 => zext_ln215_reg_1453(4),
      I2 => zext_ln215_reg_1453(5),
      I3 => zext_ln215_reg_1453(3),
      I4 => \tmp_7_reg_1595[6]_i_2_n_0\,
      I5 => zext_ln215_reg_1453(8),
      O => add_ln1353_7_fu_698_p2(8)
    );
\tmp_7_reg_1595[6]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFF57FF0000A800"
    )
        port map (
      I0 => zext_ln215_reg_1453(8),
      I1 => \tmp_7_reg_1595[6]_i_2_n_0\,
      I2 => zext_ln215_reg_1453(3),
      I3 => \tmp_1_reg_1529[6]_i_3_n_0\,
      I4 => \tmp_1_reg_1529[6]_i_4_n_0\,
      I5 => zext_ln215_reg_1453(9),
      O => add_ln1353_7_fu_698_p2(9)
    );
\tmp_7_reg_1595[6]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"EEE8E888E888E888"
    )
        port map (
      I0 => add_ln647_2_reg_1479(2),
      I1 => zext_ln215_reg_1453(2),
      I2 => add_ln647_2_reg_1479(1),
      I3 => zext_ln215_reg_1453(1),
      I4 => zext_ln215_reg_1453(0),
      I5 => add_ln647_reg_1469(0),
      O => \tmp_7_reg_1595[6]_i_2_n_0\
    );
\tmp_7_reg_1595[7]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7F80"
    )
        port map (
      I0 => zext_ln215_reg_1453(8),
      I1 => zext_ln215_reg_1453(9),
      I2 => \tmp_7_reg_1595[7]_i_2_n_0\,
      I3 => zext_ln215_reg_1453(10),
      O => add_ln1353_7_fu_698_p2(10)
    );
\tmp_7_reg_1595[7]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"E000000000000000"
    )
        port map (
      I0 => \tmp_7_reg_1595[6]_i_2_n_0\,
      I1 => zext_ln215_reg_1453(3),
      I2 => zext_ln215_reg_1453(5),
      I3 => zext_ln215_reg_1453(4),
      I4 => zext_ln215_reg_1453(6),
      I5 => zext_ln215_reg_1453(7),
      O => \tmp_7_reg_1595[7]_i_2_n_0\
    );
\tmp_7_reg_1595_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => add_ln1353_7_fu_698_p2(3),
      Q => tmp_7_reg_1595(0),
      R => '0'
    );
\tmp_7_reg_1595_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => add_ln1353_7_fu_698_p2(4),
      Q => tmp_7_reg_1595(1),
      R => '0'
    );
\tmp_7_reg_1595_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => add_ln1353_7_fu_698_p2(5),
      Q => tmp_7_reg_1595(2),
      R => '0'
    );
\tmp_7_reg_1595_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => add_ln1353_7_fu_698_p2(6),
      Q => tmp_7_reg_1595(3),
      R => '0'
    );
\tmp_7_reg_1595_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => add_ln1353_7_fu_698_p2(7),
      Q => tmp_7_reg_1595(4),
      R => '0'
    );
\tmp_7_reg_1595_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => add_ln1353_7_fu_698_p2(8),
      Q => tmp_7_reg_1595(5),
      R => '0'
    );
\tmp_7_reg_1595_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => add_ln1353_7_fu_698_p2(9),
      Q => tmp_7_reg_1595(6),
      R => '0'
    );
\tmp_7_reg_1595_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => add_ln1353_7_fu_698_p2(10),
      Q => tmp_7_reg_1595(7),
      R => '0'
    );
\tmp_9_reg_1605[0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => add_ln1353_8_reg_1484(3),
      O => add_ln1353_9_fu_720_p2(3)
    );
\tmp_9_reg_1605[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => add_ln1353_8_reg_1484(3),
      I1 => add_ln1353_8_reg_1484(4),
      O => add_ln1353_9_fu_720_p2(4)
    );
\tmp_9_reg_1605[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"78"
    )
        port map (
      I0 => add_ln1353_8_reg_1484(3),
      I1 => add_ln1353_8_reg_1484(4),
      I2 => add_ln1353_8_reg_1484(5),
      O => add_ln1353_9_fu_720_p2(5)
    );
\tmp_9_reg_1605[3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7F80"
    )
        port map (
      I0 => add_ln1353_8_reg_1484(4),
      I1 => add_ln1353_8_reg_1484(3),
      I2 => add_ln1353_8_reg_1484(5),
      I3 => add_ln1353_8_reg_1484(6),
      O => add_ln1353_9_fu_720_p2(6)
    );
\tmp_9_reg_1605[4]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7FFF8000"
    )
        port map (
      I0 => add_ln1353_8_reg_1484(5),
      I1 => add_ln1353_8_reg_1484(3),
      I2 => add_ln1353_8_reg_1484(4),
      I3 => add_ln1353_8_reg_1484(6),
      I4 => add_ln1353_8_reg_1484(7),
      O => add_ln1353_9_fu_720_p2(7)
    );
\tmp_9_reg_1605[5]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7FFFFFFF80000000"
    )
        port map (
      I0 => add_ln1353_8_reg_1484(6),
      I1 => add_ln1353_8_reg_1484(4),
      I2 => add_ln1353_8_reg_1484(3),
      I3 => add_ln1353_8_reg_1484(5),
      I4 => add_ln1353_8_reg_1484(7),
      I5 => add_ln1353_8_reg_1484(8),
      O => add_ln1353_9_fu_720_p2(8)
    );
\tmp_9_reg_1605[6]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \tmp_9_reg_1605[7]_i_2_n_0\,
      I1 => add_ln1353_8_reg_1484(9),
      O => add_ln1353_9_fu_720_p2(9)
    );
\tmp_9_reg_1605[7]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"78"
    )
        port map (
      I0 => \tmp_9_reg_1605[7]_i_2_n_0\,
      I1 => add_ln1353_8_reg_1484(9),
      I2 => add_ln1353_8_reg_1484(10),
      O => add_ln1353_9_fu_720_p2(10)
    );
\tmp_9_reg_1605[7]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8000000000000000"
    )
        port map (
      I0 => add_ln1353_8_reg_1484(8),
      I1 => add_ln1353_8_reg_1484(6),
      I2 => add_ln1353_8_reg_1484(4),
      I3 => add_ln1353_8_reg_1484(3),
      I4 => add_ln1353_8_reg_1484(5),
      I5 => add_ln1353_8_reg_1484(7),
      O => \tmp_9_reg_1605[7]_i_2_n_0\
    );
\tmp_9_reg_1605_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => add_ln1353_9_fu_720_p2(3),
      Q => tmp_9_reg_1605(0),
      R => '0'
    );
\tmp_9_reg_1605_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => add_ln1353_9_fu_720_p2(4),
      Q => tmp_9_reg_1605(1),
      R => '0'
    );
\tmp_9_reg_1605_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => add_ln1353_9_fu_720_p2(5),
      Q => tmp_9_reg_1605(2),
      R => '0'
    );
\tmp_9_reg_1605_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => add_ln1353_9_fu_720_p2(6),
      Q => tmp_9_reg_1605(3),
      R => '0'
    );
\tmp_9_reg_1605_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => add_ln1353_9_fu_720_p2(7),
      Q => tmp_9_reg_1605(4),
      R => '0'
    );
\tmp_9_reg_1605_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => add_ln1353_9_fu_720_p2(8),
      Q => tmp_9_reg_1605(5),
      R => '0'
    );
\tmp_9_reg_1605_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => add_ln1353_9_fu_720_p2(9),
      Q => tmp_9_reg_1605(6),
      R => '0'
    );
\tmp_9_reg_1605_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => add_ln1353_9_fu_720_p2(10),
      Q => tmp_9_reg_1605(7),
      R => '0'
    );
\trunc_ln647_reg_1464[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => rom_idx_V(0),
      I1 => rom_idx_V(1),
      O => ret_V_fu_456_p2(1)
    );
\trunc_ln647_reg_1464[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"1E"
    )
        port map (
      I0 => rom_idx_V(1),
      I1 => rom_idx_V(0),
      I2 => rom_idx_V(2),
      O => ret_V_fu_456_p2(2)
    );
\trunc_ln647_reg_1464_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => rom_idx_V(0),
      Q => trunc_ln647_reg_1464(0),
      R => '0'
    );
\trunc_ln647_reg_1464_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => ret_V_fu_456_p2(1),
      Q => trunc_ln647_reg_1464(1),
      R => '0'
    );
\trunc_ln647_reg_1464_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => ret_V_fu_456_p2(2),
      Q => trunc_ln647_reg_1464(2),
      R => '0'
    );
\zext_ln215_reg_1453_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => lut_start_addr_V(0),
      Q => zext_ln215_reg_1453(0),
      R => '0'
    );
\zext_ln215_reg_1453_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => lut_start_addr_V(10),
      Q => zext_ln215_reg_1453(10),
      R => '0'
    );
\zext_ln215_reg_1453_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => lut_start_addr_V(11),
      Q => zext_ln215_reg_1453(11),
      R => '0'
    );
\zext_ln215_reg_1453_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => lut_start_addr_V(1),
      Q => zext_ln215_reg_1453(1),
      R => '0'
    );
\zext_ln215_reg_1453_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => lut_start_addr_V(2),
      Q => zext_ln215_reg_1453(2),
      R => '0'
    );
\zext_ln215_reg_1453_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => lut_start_addr_V(3),
      Q => zext_ln215_reg_1453(3),
      R => '0'
    );
\zext_ln215_reg_1453_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => lut_start_addr_V(4),
      Q => zext_ln215_reg_1453(4),
      R => '0'
    );
\zext_ln215_reg_1453_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => lut_start_addr_V(5),
      Q => zext_ln215_reg_1453(5),
      R => '0'
    );
\zext_ln215_reg_1453_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => lut_start_addr_V(6),
      Q => zext_ln215_reg_1453(6),
      R => '0'
    );
\zext_ln215_reg_1453_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => lut_start_addr_V(7),
      Q => zext_ln215_reg_1453(7),
      R => '0'
    );
\zext_ln215_reg_1453_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => lut_start_addr_V(8),
      Q => zext_ln215_reg_1453(8),
      R => '0'
    );
\zext_ln215_reg_1453_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => lut_start_addr_V(9),
      Q => zext_ln215_reg_1453(9),
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity hls_get_trig_vals is
  port (
    ap_clk : in STD_LOGIC;
    ap_rst : in STD_LOGIC;
    ap_start : in STD_LOGIC;
    ap_done : out STD_LOGIC;
    ap_idle : out STD_LOGIC;
    ap_ready : out STD_LOGIC;
    hw_trig_vals_0_V : out STD_LOGIC_VECTOR ( 35 downto 0 );
    hw_trig_vals_1_V : out STD_LOGIC_VECTOR ( 35 downto 0 );
    hw_trig_vals_2_V : out STD_LOGIC_VECTOR ( 35 downto 0 );
    hw_trig_vals_3_V : out STD_LOGIC_VECTOR ( 35 downto 0 );
    hw_trig_vals_4_V : out STD_LOGIC_VECTOR ( 35 downto 0 );
    hw_trig_vals_5_V : out STD_LOGIC_VECTOR ( 35 downto 0 );
    hw_trig_vals_6_V : out STD_LOGIC_VECTOR ( 35 downto 0 );
    hw_trig_vals_7_V : out STD_LOGIC_VECTOR ( 35 downto 0 );
    hw_trig_vals_8_V : out STD_LOGIC_VECTOR ( 35 downto 0 );
    hw_trig_vals_9_V : out STD_LOGIC_VECTOR ( 35 downto 0 );
    hw_trig_vals_10_V : out STD_LOGIC_VECTOR ( 35 downto 0 );
    hw_trig_vals_11_V : out STD_LOGIC_VECTOR ( 35 downto 0 );
    hw_trig_vals_12_V : out STD_LOGIC_VECTOR ( 35 downto 0 );
    hw_trig_vals_13_V : out STD_LOGIC_VECTOR ( 35 downto 0 );
    hw_trig_vals_14_V : out STD_LOGIC_VECTOR ( 35 downto 0 );
    hw_trig_vals_15_V : out STD_LOGIC_VECTOR ( 35 downto 0 );
    rom_idx_V : in STD_LOGIC_VECTOR ( 2 downto 0 );
    lut_start_addr_V : in STD_LOGIC_VECTOR ( 11 downto 0 )
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of hls_get_trig_vals : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of hls_get_trig_vals : entity is "hls_get_trig_vals,get_trig_vals,{}";
  attribute downgradeipidentifiedwarnings : string;
  attribute downgradeipidentifiedwarnings of hls_get_trig_vals : entity is "yes";
  attribute ip_definition_source : string;
  attribute ip_definition_source of hls_get_trig_vals : entity is "HLS";
  attribute x_core_info : string;
  attribute x_core_info of hls_get_trig_vals : entity is "get_trig_vals,Vivado 2019.2.1";
end hls_get_trig_vals;

architecture STRUCTURE of hls_get_trig_vals is
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
  attribute x_interface_info of hw_trig_vals_0_V : signal is "xilinx.com:signal:data:1.0 hw_trig_vals_0_V DATA";
  attribute x_interface_parameter of hw_trig_vals_0_V : signal is "XIL_INTERFACENAME hw_trig_vals_0_V, LAYERED_METADATA undef";
  attribute x_interface_info of hw_trig_vals_10_V : signal is "xilinx.com:signal:data:1.0 hw_trig_vals_10_V DATA";
  attribute x_interface_parameter of hw_trig_vals_10_V : signal is "XIL_INTERFACENAME hw_trig_vals_10_V, LAYERED_METADATA undef";
  attribute x_interface_info of hw_trig_vals_11_V : signal is "xilinx.com:signal:data:1.0 hw_trig_vals_11_V DATA";
  attribute x_interface_parameter of hw_trig_vals_11_V : signal is "XIL_INTERFACENAME hw_trig_vals_11_V, LAYERED_METADATA undef";
  attribute x_interface_info of hw_trig_vals_12_V : signal is "xilinx.com:signal:data:1.0 hw_trig_vals_12_V DATA";
  attribute x_interface_parameter of hw_trig_vals_12_V : signal is "XIL_INTERFACENAME hw_trig_vals_12_V, LAYERED_METADATA undef";
  attribute x_interface_info of hw_trig_vals_13_V : signal is "xilinx.com:signal:data:1.0 hw_trig_vals_13_V DATA";
  attribute x_interface_parameter of hw_trig_vals_13_V : signal is "XIL_INTERFACENAME hw_trig_vals_13_V, LAYERED_METADATA undef";
  attribute x_interface_info of hw_trig_vals_14_V : signal is "xilinx.com:signal:data:1.0 hw_trig_vals_14_V DATA";
  attribute x_interface_parameter of hw_trig_vals_14_V : signal is "XIL_INTERFACENAME hw_trig_vals_14_V, LAYERED_METADATA undef";
  attribute x_interface_info of hw_trig_vals_15_V : signal is "xilinx.com:signal:data:1.0 hw_trig_vals_15_V DATA";
  attribute x_interface_parameter of hw_trig_vals_15_V : signal is "XIL_INTERFACENAME hw_trig_vals_15_V, LAYERED_METADATA undef";
  attribute x_interface_info of hw_trig_vals_1_V : signal is "xilinx.com:signal:data:1.0 hw_trig_vals_1_V DATA";
  attribute x_interface_parameter of hw_trig_vals_1_V : signal is "XIL_INTERFACENAME hw_trig_vals_1_V, LAYERED_METADATA undef";
  attribute x_interface_info of hw_trig_vals_2_V : signal is "xilinx.com:signal:data:1.0 hw_trig_vals_2_V DATA";
  attribute x_interface_parameter of hw_trig_vals_2_V : signal is "XIL_INTERFACENAME hw_trig_vals_2_V, LAYERED_METADATA undef";
  attribute x_interface_info of hw_trig_vals_3_V : signal is "xilinx.com:signal:data:1.0 hw_trig_vals_3_V DATA";
  attribute x_interface_parameter of hw_trig_vals_3_V : signal is "XIL_INTERFACENAME hw_trig_vals_3_V, LAYERED_METADATA undef";
  attribute x_interface_info of hw_trig_vals_4_V : signal is "xilinx.com:signal:data:1.0 hw_trig_vals_4_V DATA";
  attribute x_interface_parameter of hw_trig_vals_4_V : signal is "XIL_INTERFACENAME hw_trig_vals_4_V, LAYERED_METADATA undef";
  attribute x_interface_info of hw_trig_vals_5_V : signal is "xilinx.com:signal:data:1.0 hw_trig_vals_5_V DATA";
  attribute x_interface_parameter of hw_trig_vals_5_V : signal is "XIL_INTERFACENAME hw_trig_vals_5_V, LAYERED_METADATA undef";
  attribute x_interface_info of hw_trig_vals_6_V : signal is "xilinx.com:signal:data:1.0 hw_trig_vals_6_V DATA";
  attribute x_interface_parameter of hw_trig_vals_6_V : signal is "XIL_INTERFACENAME hw_trig_vals_6_V, LAYERED_METADATA undef";
  attribute x_interface_info of hw_trig_vals_7_V : signal is "xilinx.com:signal:data:1.0 hw_trig_vals_7_V DATA";
  attribute x_interface_parameter of hw_trig_vals_7_V : signal is "XIL_INTERFACENAME hw_trig_vals_7_V, LAYERED_METADATA undef";
  attribute x_interface_info of hw_trig_vals_8_V : signal is "xilinx.com:signal:data:1.0 hw_trig_vals_8_V DATA";
  attribute x_interface_parameter of hw_trig_vals_8_V : signal is "XIL_INTERFACENAME hw_trig_vals_8_V, LAYERED_METADATA undef";
  attribute x_interface_info of hw_trig_vals_9_V : signal is "xilinx.com:signal:data:1.0 hw_trig_vals_9_V DATA";
  attribute x_interface_parameter of hw_trig_vals_9_V : signal is "XIL_INTERFACENAME hw_trig_vals_9_V, LAYERED_METADATA undef";
  attribute x_interface_info of lut_start_addr_V : signal is "xilinx.com:signal:data:1.0 lut_start_addr_V DATA";
  attribute x_interface_parameter of lut_start_addr_V : signal is "XIL_INTERFACENAME lut_start_addr_V, LAYERED_METADATA undef";
  attribute x_interface_info of rom_idx_V : signal is "xilinx.com:signal:data:1.0 rom_idx_V DATA";
  attribute x_interface_parameter of rom_idx_V : signal is "XIL_INTERFACENAME rom_idx_V, LAYERED_METADATA undef";
begin
U0: entity work.hls_get_trig_vals_get_trig_vals
     port map (
      ap_clk => ap_clk,
      ap_done => ap_done,
      ap_idle => ap_idle,
      ap_ready => ap_ready,
      ap_rst => ap_rst,
      ap_start => ap_start,
      hw_trig_vals_0_V(35 downto 0) => hw_trig_vals_0_V(35 downto 0),
      hw_trig_vals_10_V(35 downto 0) => hw_trig_vals_10_V(35 downto 0),
      hw_trig_vals_11_V(35 downto 0) => hw_trig_vals_11_V(35 downto 0),
      hw_trig_vals_12_V(35 downto 0) => hw_trig_vals_12_V(35 downto 0),
      hw_trig_vals_13_V(35 downto 0) => hw_trig_vals_13_V(35 downto 0),
      hw_trig_vals_14_V(35 downto 0) => hw_trig_vals_14_V(35 downto 0),
      hw_trig_vals_15_V(35 downto 0) => hw_trig_vals_15_V(35 downto 0),
      hw_trig_vals_1_V(35 downto 0) => hw_trig_vals_1_V(35 downto 0),
      hw_trig_vals_2_V(35 downto 0) => hw_trig_vals_2_V(35 downto 0),
      hw_trig_vals_3_V(35 downto 0) => hw_trig_vals_3_V(35 downto 0),
      hw_trig_vals_4_V(35 downto 0) => hw_trig_vals_4_V(35 downto 0),
      hw_trig_vals_5_V(35 downto 0) => hw_trig_vals_5_V(35 downto 0),
      hw_trig_vals_6_V(35 downto 0) => hw_trig_vals_6_V(35 downto 0),
      hw_trig_vals_7_V(35 downto 0) => hw_trig_vals_7_V(35 downto 0),
      hw_trig_vals_8_V(35 downto 0) => hw_trig_vals_8_V(35 downto 0),
      hw_trig_vals_9_V(35 downto 0) => hw_trig_vals_9_V(35 downto 0),
      lut_start_addr_V(11 downto 0) => lut_start_addr_V(11 downto 0),
      rom_idx_V(2 downto 0) => rom_idx_V(2 downto 0)
    );
end STRUCTURE;

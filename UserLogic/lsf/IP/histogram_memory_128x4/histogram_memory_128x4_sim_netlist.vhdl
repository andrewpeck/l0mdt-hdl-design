-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2019.2.1 (lin64) Build 2729669 Thu Dec  5 04:48:12 MST 2019
-- Date        : Mon Mar 29 15:39:10 2021
-- Host        : atlas126a running 64-bit openSUSE Tumbleweed
-- Command     : write_vhdl -force -mode funcsim
--               /mnt/atlas126a/scratch/dcieri/Firmware/l0mdt-hdl-design/UserLogic/lsf/IP/histogram_memory_128x4/histogram_memory_128x4_sim_netlist.vhdl
-- Design      : histogram_memory_128x4
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xcku15p-ffva1760-2-e
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity histogram_memory_128x4_sdpram is
  port (
    qdpo : out STD_LOGIC_VECTOR ( 3 downto 0 );
    we : in STD_LOGIC;
    a : in STD_LOGIC_VECTOR ( 6 downto 0 );
    clk : in STD_LOGIC;
    d : in STD_LOGIC_VECTOR ( 3 downto 0 );
    dpra : in STD_LOGIC_VECTOR ( 6 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of histogram_memory_128x4_sdpram : entity is "sdpram";
end histogram_memory_128x4_sdpram;

architecture STRUCTURE of histogram_memory_128x4_sdpram is
  signal qsdpo_int : STD_LOGIC_VECTOR ( 3 downto 0 );
  attribute RTL_KEEP : string;
  attribute RTL_KEEP of qsdpo_int : signal is "true";
  signal ram_reg_0_63_0_3_i_1_n_0 : STD_LOGIC;
  signal ram_reg_0_63_0_3_n_0 : STD_LOGIC;
  signal ram_reg_0_63_0_3_n_1 : STD_LOGIC;
  signal ram_reg_0_63_0_3_n_2 : STD_LOGIC;
  signal ram_reg_0_63_0_3_n_3 : STD_LOGIC;
  signal ram_reg_64_127_0_3_i_1_n_0 : STD_LOGIC;
  signal ram_reg_64_127_0_3_n_0 : STD_LOGIC;
  signal ram_reg_64_127_0_3_n_1 : STD_LOGIC;
  signal ram_reg_64_127_0_3_n_2 : STD_LOGIC;
  signal ram_reg_64_127_0_3_n_3 : STD_LOGIC;
  signal sdpo_int : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_ram_reg_0_63_0_3_DOE_UNCONNECTED : STD_LOGIC;
  signal NLW_ram_reg_0_63_0_3_DOF_UNCONNECTED : STD_LOGIC;
  signal NLW_ram_reg_0_63_0_3_DOG_UNCONNECTED : STD_LOGIC;
  signal NLW_ram_reg_0_63_0_3_DOH_UNCONNECTED : STD_LOGIC;
  signal NLW_ram_reg_64_127_0_3_DOE_UNCONNECTED : STD_LOGIC;
  signal NLW_ram_reg_64_127_0_3_DOF_UNCONNECTED : STD_LOGIC;
  signal NLW_ram_reg_64_127_0_3_DOG_UNCONNECTED : STD_LOGIC;
  signal NLW_ram_reg_64_127_0_3_DOH_UNCONNECTED : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \qsdpo_int[0]_i_1\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \qsdpo_int[1]_i_1\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \qsdpo_int[2]_i_1\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \qsdpo_int[3]_i_1\ : label is "soft_lutpair1";
  attribute KEEP : string;
  attribute KEEP of \qsdpo_int_reg[0]\ : label is "yes";
  attribute equivalent_register_removal : string;
  attribute equivalent_register_removal of \qsdpo_int_reg[0]\ : label is "no";
  attribute KEEP of \qsdpo_int_reg[1]\ : label is "yes";
  attribute equivalent_register_removal of \qsdpo_int_reg[1]\ : label is "no";
  attribute KEEP of \qsdpo_int_reg[2]\ : label is "yes";
  attribute equivalent_register_removal of \qsdpo_int_reg[2]\ : label is "no";
  attribute KEEP of \qsdpo_int_reg[3]\ : label is "yes";
  attribute equivalent_register_removal of \qsdpo_int_reg[3]\ : label is "no";
  attribute METHODOLOGY_DRC_VIOS : string;
  attribute METHODOLOGY_DRC_VIOS of ram_reg_0_63_0_3 : label is "";
  attribute RTL_RAM_BITS : integer;
  attribute RTL_RAM_BITS of ram_reg_0_63_0_3 : label is 512;
  attribute RTL_RAM_NAME : string;
  attribute RTL_RAM_NAME of ram_reg_0_63_0_3 : label is "synth_options.dist_mem_inst/gen_sdp_ram.sdpram_inst/ram";
  attribute ram_addr_begin : integer;
  attribute ram_addr_begin of ram_reg_0_63_0_3 : label is 0;
  attribute ram_addr_end : integer;
  attribute ram_addr_end of ram_reg_0_63_0_3 : label is 63;
  attribute ram_offset : integer;
  attribute ram_offset of ram_reg_0_63_0_3 : label is 0;
  attribute ram_slice_begin : integer;
  attribute ram_slice_begin of ram_reg_0_63_0_3 : label is 0;
  attribute ram_slice_end : integer;
  attribute ram_slice_end of ram_reg_0_63_0_3 : label is 3;
  attribute METHODOLOGY_DRC_VIOS of ram_reg_64_127_0_3 : label is "";
  attribute RTL_RAM_BITS of ram_reg_64_127_0_3 : label is 512;
  attribute RTL_RAM_NAME of ram_reg_64_127_0_3 : label is "synth_options.dist_mem_inst/gen_sdp_ram.sdpram_inst/ram";
  attribute ram_addr_begin of ram_reg_64_127_0_3 : label is 64;
  attribute ram_addr_end of ram_reg_64_127_0_3 : label is 127;
  attribute ram_offset of ram_reg_64_127_0_3 : label is 0;
  attribute ram_slice_begin of ram_reg_64_127_0_3 : label is 0;
  attribute ram_slice_end of ram_reg_64_127_0_3 : label is 3;
begin
  qdpo(3 downto 0) <= qsdpo_int(3 downto 0);
\qsdpo_int[0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ram_reg_64_127_0_3_n_0,
      I1 => dpra(6),
      I2 => ram_reg_0_63_0_3_n_0,
      O => sdpo_int(0)
    );
\qsdpo_int[1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ram_reg_64_127_0_3_n_1,
      I1 => dpra(6),
      I2 => ram_reg_0_63_0_3_n_1,
      O => sdpo_int(1)
    );
\qsdpo_int[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ram_reg_64_127_0_3_n_2,
      I1 => dpra(6),
      I2 => ram_reg_0_63_0_3_n_2,
      O => sdpo_int(2)
    );
\qsdpo_int[3]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ram_reg_64_127_0_3_n_3,
      I1 => dpra(6),
      I2 => ram_reg_0_63_0_3_n_3,
      O => sdpo_int(3)
    );
\qsdpo_int_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => sdpo_int(0),
      Q => qsdpo_int(0),
      R => '0'
    );
\qsdpo_int_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => sdpo_int(1),
      Q => qsdpo_int(1),
      R => '0'
    );
\qsdpo_int_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => sdpo_int(2),
      Q => qsdpo_int(2),
      R => '0'
    );
\qsdpo_int_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => sdpo_int(3),
      Q => qsdpo_int(3),
      R => '0'
    );
ram_reg_0_63_0_3: unisim.vcomponents.RAM64M8
    generic map(
      INIT_A => X"0000000000000000",
      INIT_B => X"0000000000000000",
      INIT_C => X"0000000000000000",
      INIT_D => X"0000000000000000",
      INIT_E => X"0000000000000000",
      INIT_F => X"0000000000000000",
      INIT_G => X"0000000000000000",
      INIT_H => X"0000000000000000"
    )
        port map (
      ADDRA(5 downto 0) => dpra(5 downto 0),
      ADDRB(5 downto 0) => dpra(5 downto 0),
      ADDRC(5 downto 0) => dpra(5 downto 0),
      ADDRD(5 downto 0) => dpra(5 downto 0),
      ADDRE(5 downto 0) => dpra(5 downto 0),
      ADDRF(5 downto 0) => dpra(5 downto 0),
      ADDRG(5 downto 0) => dpra(5 downto 0),
      ADDRH(5 downto 0) => a(5 downto 0),
      DIA => d(0),
      DIB => d(1),
      DIC => d(2),
      DID => d(3),
      DIE => '0',
      DIF => '0',
      DIG => '0',
      DIH => '0',
      DOA => ram_reg_0_63_0_3_n_0,
      DOB => ram_reg_0_63_0_3_n_1,
      DOC => ram_reg_0_63_0_3_n_2,
      DOD => ram_reg_0_63_0_3_n_3,
      DOE => NLW_ram_reg_0_63_0_3_DOE_UNCONNECTED,
      DOF => NLW_ram_reg_0_63_0_3_DOF_UNCONNECTED,
      DOG => NLW_ram_reg_0_63_0_3_DOG_UNCONNECTED,
      DOH => NLW_ram_reg_0_63_0_3_DOH_UNCONNECTED,
      WCLK => clk,
      WE => ram_reg_0_63_0_3_i_1_n_0
    );
ram_reg_0_63_0_3_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => we,
      I1 => a(6),
      O => ram_reg_0_63_0_3_i_1_n_0
    );
ram_reg_64_127_0_3: unisim.vcomponents.RAM64M8
    generic map(
      INIT_A => X"0000000000000000",
      INIT_B => X"0000000000000000",
      INIT_C => X"0000000000000000",
      INIT_D => X"0000000000000000",
      INIT_E => X"0000000000000000",
      INIT_F => X"0000000000000000",
      INIT_G => X"0000000000000000",
      INIT_H => X"0000000000000000"
    )
        port map (
      ADDRA(5 downto 0) => dpra(5 downto 0),
      ADDRB(5 downto 0) => dpra(5 downto 0),
      ADDRC(5 downto 0) => dpra(5 downto 0),
      ADDRD(5 downto 0) => dpra(5 downto 0),
      ADDRE(5 downto 0) => dpra(5 downto 0),
      ADDRF(5 downto 0) => dpra(5 downto 0),
      ADDRG(5 downto 0) => dpra(5 downto 0),
      ADDRH(5 downto 0) => a(5 downto 0),
      DIA => d(0),
      DIB => d(1),
      DIC => d(2),
      DID => d(3),
      DIE => '0',
      DIF => '0',
      DIG => '0',
      DIH => '0',
      DOA => ram_reg_64_127_0_3_n_0,
      DOB => ram_reg_64_127_0_3_n_1,
      DOC => ram_reg_64_127_0_3_n_2,
      DOD => ram_reg_64_127_0_3_n_3,
      DOE => NLW_ram_reg_64_127_0_3_DOE_UNCONNECTED,
      DOF => NLW_ram_reg_64_127_0_3_DOF_UNCONNECTED,
      DOG => NLW_ram_reg_64_127_0_3_DOG_UNCONNECTED,
      DOH => NLW_ram_reg_64_127_0_3_DOH_UNCONNECTED,
      WCLK => clk,
      WE => ram_reg_64_127_0_3_i_1_n_0
    );
ram_reg_64_127_0_3_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => we,
      I1 => a(6),
      O => ram_reg_64_127_0_3_i_1_n_0
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity histogram_memory_128x4_dist_mem_gen_v8_0_13_synth is
  port (
    qdpo : out STD_LOGIC_VECTOR ( 3 downto 0 );
    we : in STD_LOGIC;
    a : in STD_LOGIC_VECTOR ( 6 downto 0 );
    clk : in STD_LOGIC;
    d : in STD_LOGIC_VECTOR ( 3 downto 0 );
    dpra : in STD_LOGIC_VECTOR ( 6 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of histogram_memory_128x4_dist_mem_gen_v8_0_13_synth : entity is "dist_mem_gen_v8_0_13_synth";
end histogram_memory_128x4_dist_mem_gen_v8_0_13_synth;

architecture STRUCTURE of histogram_memory_128x4_dist_mem_gen_v8_0_13_synth is
begin
\gen_sdp_ram.sdpram_inst\: entity work.histogram_memory_128x4_sdpram
     port map (
      a(6 downto 0) => a(6 downto 0),
      clk => clk,
      d(3 downto 0) => d(3 downto 0),
      dpra(6 downto 0) => dpra(6 downto 0),
      qdpo(3 downto 0) => qdpo(3 downto 0),
      we => we
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity histogram_memory_128x4_dist_mem_gen_v8_0_13 is
  port (
    a : in STD_LOGIC_VECTOR ( 6 downto 0 );
    d : in STD_LOGIC_VECTOR ( 3 downto 0 );
    dpra : in STD_LOGIC_VECTOR ( 6 downto 0 );
    clk : in STD_LOGIC;
    we : in STD_LOGIC;
    i_ce : in STD_LOGIC;
    qspo_ce : in STD_LOGIC;
    qdpo_ce : in STD_LOGIC;
    qdpo_clk : in STD_LOGIC;
    qspo_rst : in STD_LOGIC;
    qdpo_rst : in STD_LOGIC;
    qspo_srst : in STD_LOGIC;
    qdpo_srst : in STD_LOGIC;
    spo : out STD_LOGIC_VECTOR ( 3 downto 0 );
    dpo : out STD_LOGIC_VECTOR ( 3 downto 0 );
    qspo : out STD_LOGIC_VECTOR ( 3 downto 0 );
    qdpo : out STD_LOGIC_VECTOR ( 3 downto 0 )
  );
  attribute C_ADDR_WIDTH : integer;
  attribute C_ADDR_WIDTH of histogram_memory_128x4_dist_mem_gen_v8_0_13 : entity is 7;
  attribute C_DEFAULT_DATA : string;
  attribute C_DEFAULT_DATA of histogram_memory_128x4_dist_mem_gen_v8_0_13 : entity is "0";
  attribute C_DEPTH : integer;
  attribute C_DEPTH of histogram_memory_128x4_dist_mem_gen_v8_0_13 : entity is 128;
  attribute C_ELABORATION_DIR : string;
  attribute C_ELABORATION_DIR of histogram_memory_128x4_dist_mem_gen_v8_0_13 : entity is "./";
  attribute C_FAMILY : string;
  attribute C_FAMILY of histogram_memory_128x4_dist_mem_gen_v8_0_13 : entity is "kintexuplus";
  attribute C_HAS_CLK : integer;
  attribute C_HAS_CLK of histogram_memory_128x4_dist_mem_gen_v8_0_13 : entity is 1;
  attribute C_HAS_D : integer;
  attribute C_HAS_D of histogram_memory_128x4_dist_mem_gen_v8_0_13 : entity is 1;
  attribute C_HAS_DPO : integer;
  attribute C_HAS_DPO of histogram_memory_128x4_dist_mem_gen_v8_0_13 : entity is 0;
  attribute C_HAS_DPRA : integer;
  attribute C_HAS_DPRA of histogram_memory_128x4_dist_mem_gen_v8_0_13 : entity is 1;
  attribute C_HAS_I_CE : integer;
  attribute C_HAS_I_CE of histogram_memory_128x4_dist_mem_gen_v8_0_13 : entity is 0;
  attribute C_HAS_QDPO : integer;
  attribute C_HAS_QDPO of histogram_memory_128x4_dist_mem_gen_v8_0_13 : entity is 1;
  attribute C_HAS_QDPO_CE : integer;
  attribute C_HAS_QDPO_CE of histogram_memory_128x4_dist_mem_gen_v8_0_13 : entity is 0;
  attribute C_HAS_QDPO_CLK : integer;
  attribute C_HAS_QDPO_CLK of histogram_memory_128x4_dist_mem_gen_v8_0_13 : entity is 0;
  attribute C_HAS_QDPO_RST : integer;
  attribute C_HAS_QDPO_RST of histogram_memory_128x4_dist_mem_gen_v8_0_13 : entity is 0;
  attribute C_HAS_QDPO_SRST : integer;
  attribute C_HAS_QDPO_SRST of histogram_memory_128x4_dist_mem_gen_v8_0_13 : entity is 0;
  attribute C_HAS_QSPO : integer;
  attribute C_HAS_QSPO of histogram_memory_128x4_dist_mem_gen_v8_0_13 : entity is 0;
  attribute C_HAS_QSPO_CE : integer;
  attribute C_HAS_QSPO_CE of histogram_memory_128x4_dist_mem_gen_v8_0_13 : entity is 0;
  attribute C_HAS_QSPO_RST : integer;
  attribute C_HAS_QSPO_RST of histogram_memory_128x4_dist_mem_gen_v8_0_13 : entity is 0;
  attribute C_HAS_QSPO_SRST : integer;
  attribute C_HAS_QSPO_SRST of histogram_memory_128x4_dist_mem_gen_v8_0_13 : entity is 0;
  attribute C_HAS_SPO : integer;
  attribute C_HAS_SPO of histogram_memory_128x4_dist_mem_gen_v8_0_13 : entity is 0;
  attribute C_HAS_WE : integer;
  attribute C_HAS_WE of histogram_memory_128x4_dist_mem_gen_v8_0_13 : entity is 1;
  attribute C_MEM_INIT_FILE : string;
  attribute C_MEM_INIT_FILE of histogram_memory_128x4_dist_mem_gen_v8_0_13 : entity is "no_coe_file_loaded";
  attribute C_MEM_TYPE : integer;
  attribute C_MEM_TYPE of histogram_memory_128x4_dist_mem_gen_v8_0_13 : entity is 4;
  attribute C_PARSER_TYPE : integer;
  attribute C_PARSER_TYPE of histogram_memory_128x4_dist_mem_gen_v8_0_13 : entity is 1;
  attribute C_PIPELINE_STAGES : integer;
  attribute C_PIPELINE_STAGES of histogram_memory_128x4_dist_mem_gen_v8_0_13 : entity is 0;
  attribute C_QCE_JOINED : integer;
  attribute C_QCE_JOINED of histogram_memory_128x4_dist_mem_gen_v8_0_13 : entity is 0;
  attribute C_QUALIFY_WE : integer;
  attribute C_QUALIFY_WE of histogram_memory_128x4_dist_mem_gen_v8_0_13 : entity is 0;
  attribute C_READ_MIF : integer;
  attribute C_READ_MIF of histogram_memory_128x4_dist_mem_gen_v8_0_13 : entity is 0;
  attribute C_REG_A_D_INPUTS : integer;
  attribute C_REG_A_D_INPUTS of histogram_memory_128x4_dist_mem_gen_v8_0_13 : entity is 0;
  attribute C_REG_DPRA_INPUT : integer;
  attribute C_REG_DPRA_INPUT of histogram_memory_128x4_dist_mem_gen_v8_0_13 : entity is 0;
  attribute C_SYNC_ENABLE : integer;
  attribute C_SYNC_ENABLE of histogram_memory_128x4_dist_mem_gen_v8_0_13 : entity is 1;
  attribute C_WIDTH : integer;
  attribute C_WIDTH of histogram_memory_128x4_dist_mem_gen_v8_0_13 : entity is 4;
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of histogram_memory_128x4_dist_mem_gen_v8_0_13 : entity is "dist_mem_gen_v8_0_13";
end histogram_memory_128x4_dist_mem_gen_v8_0_13;

architecture STRUCTURE of histogram_memory_128x4_dist_mem_gen_v8_0_13 is
  signal \<const0>\ : STD_LOGIC;
begin
  dpo(3) <= \<const0>\;
  dpo(2) <= \<const0>\;
  dpo(1) <= \<const0>\;
  dpo(0) <= \<const0>\;
  qspo(3) <= \<const0>\;
  qspo(2) <= \<const0>\;
  qspo(1) <= \<const0>\;
  qspo(0) <= \<const0>\;
  spo(3) <= \<const0>\;
  spo(2) <= \<const0>\;
  spo(1) <= \<const0>\;
  spo(0) <= \<const0>\;
GND: unisim.vcomponents.GND
     port map (
      G => \<const0>\
    );
\synth_options.dist_mem_inst\: entity work.histogram_memory_128x4_dist_mem_gen_v8_0_13_synth
     port map (
      a(6 downto 0) => a(6 downto 0),
      clk => clk,
      d(3 downto 0) => d(3 downto 0),
      dpra(6 downto 0) => dpra(6 downto 0),
      qdpo(3 downto 0) => qdpo(3 downto 0),
      we => we
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity histogram_memory_128x4 is
  port (
    a : in STD_LOGIC_VECTOR ( 6 downto 0 );
    d : in STD_LOGIC_VECTOR ( 3 downto 0 );
    dpra : in STD_LOGIC_VECTOR ( 6 downto 0 );
    clk : in STD_LOGIC;
    we : in STD_LOGIC;
    qdpo : out STD_LOGIC_VECTOR ( 3 downto 0 )
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of histogram_memory_128x4 : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of histogram_memory_128x4 : entity is "histogram_memory_128x4,dist_mem_gen_v8_0_13,{}";
  attribute downgradeipidentifiedwarnings : string;
  attribute downgradeipidentifiedwarnings of histogram_memory_128x4 : entity is "yes";
  attribute x_core_info : string;
  attribute x_core_info of histogram_memory_128x4 : entity is "dist_mem_gen_v8_0_13,Vivado 2019.2.1";
end histogram_memory_128x4;

architecture STRUCTURE of histogram_memory_128x4 is
  signal NLW_U0_dpo_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_U0_qspo_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_U0_spo_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  attribute C_FAMILY : string;
  attribute C_FAMILY of U0 : label is "kintexuplus";
  attribute C_HAS_CLK : integer;
  attribute C_HAS_CLK of U0 : label is 1;
  attribute C_HAS_D : integer;
  attribute C_HAS_D of U0 : label is 1;
  attribute C_HAS_DPO : integer;
  attribute C_HAS_DPO of U0 : label is 0;
  attribute C_HAS_DPRA : integer;
  attribute C_HAS_DPRA of U0 : label is 1;
  attribute C_HAS_QDPO : integer;
  attribute C_HAS_QDPO of U0 : label is 1;
  attribute C_HAS_QDPO_CE : integer;
  attribute C_HAS_QDPO_CE of U0 : label is 0;
  attribute C_HAS_QDPO_CLK : integer;
  attribute C_HAS_QDPO_CLK of U0 : label is 0;
  attribute C_HAS_QDPO_RST : integer;
  attribute C_HAS_QDPO_RST of U0 : label is 0;
  attribute C_HAS_QDPO_SRST : integer;
  attribute C_HAS_QDPO_SRST of U0 : label is 0;
  attribute C_HAS_QSPO : integer;
  attribute C_HAS_QSPO of U0 : label is 0;
  attribute C_HAS_QSPO_RST : integer;
  attribute C_HAS_QSPO_RST of U0 : label is 0;
  attribute C_HAS_QSPO_SRST : integer;
  attribute C_HAS_QSPO_SRST of U0 : label is 0;
  attribute C_HAS_SPO : integer;
  attribute C_HAS_SPO of U0 : label is 0;
  attribute C_HAS_WE : integer;
  attribute C_HAS_WE of U0 : label is 1;
  attribute C_MEM_TYPE : integer;
  attribute C_MEM_TYPE of U0 : label is 4;
  attribute C_REG_DPRA_INPUT : integer;
  attribute C_REG_DPRA_INPUT of U0 : label is 0;
  attribute c_addr_width : integer;
  attribute c_addr_width of U0 : label is 7;
  attribute c_default_data : string;
  attribute c_default_data of U0 : label is "0";
  attribute c_depth : integer;
  attribute c_depth of U0 : label is 128;
  attribute c_elaboration_dir : string;
  attribute c_elaboration_dir of U0 : label is "./";
  attribute c_has_i_ce : integer;
  attribute c_has_i_ce of U0 : label is 0;
  attribute c_has_qspo_ce : integer;
  attribute c_has_qspo_ce of U0 : label is 0;
  attribute c_mem_init_file : string;
  attribute c_mem_init_file of U0 : label is "no_coe_file_loaded";
  attribute c_parser_type : integer;
  attribute c_parser_type of U0 : label is 1;
  attribute c_pipeline_stages : integer;
  attribute c_pipeline_stages of U0 : label is 0;
  attribute c_qce_joined : integer;
  attribute c_qce_joined of U0 : label is 0;
  attribute c_qualify_we : integer;
  attribute c_qualify_we of U0 : label is 0;
  attribute c_read_mif : integer;
  attribute c_read_mif of U0 : label is 0;
  attribute c_reg_a_d_inputs : integer;
  attribute c_reg_a_d_inputs of U0 : label is 0;
  attribute c_sync_enable : integer;
  attribute c_sync_enable of U0 : label is 1;
  attribute c_width : integer;
  attribute c_width of U0 : label is 4;
begin
U0: entity work.histogram_memory_128x4_dist_mem_gen_v8_0_13
     port map (
      a(6 downto 0) => a(6 downto 0),
      clk => clk,
      d(3 downto 0) => d(3 downto 0),
      dpo(3 downto 0) => NLW_U0_dpo_UNCONNECTED(3 downto 0),
      dpra(6 downto 0) => dpra(6 downto 0),
      i_ce => '1',
      qdpo(3 downto 0) => qdpo(3 downto 0),
      qdpo_ce => '1',
      qdpo_clk => '0',
      qdpo_rst => '0',
      qdpo_srst => '0',
      qspo(3 downto 0) => NLW_U0_qspo_UNCONNECTED(3 downto 0),
      qspo_ce => '1',
      qspo_rst => '0',
      qspo_srst => '0',
      spo(3 downto 0) => NLW_U0_spo_UNCONNECTED(3 downto 0),
      we => we
    );
end STRUCTURE;

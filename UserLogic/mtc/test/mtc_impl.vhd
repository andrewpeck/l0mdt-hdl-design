--Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2020.2 (lin64) Build 3064766 Wed Nov 18 09:12:47 MST 2020
--Date        : Fri Nov  5 11:06:17 2021
--Host        : uclhc-2.ps.uci.edu running 64-bit CentOS Linux release 7.9.2009 (Core)
--Command     : generate_target mtc_impl.bd
--Design      : mtc_impl
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity mtc_impl is
  port (
    FIFO_READ_empty : out STD_LOGIC;
    FIFO_READ_rd_data : out STD_LOGIC_VECTOR ( 127 downto 0 );
    FIFO_READ_rd_en : in STD_LOGIC;
    FIFO_WRITE_full : out STD_LOGIC;
    FIFO_WRITE_wr_data : in STD_LOGIC_VECTOR ( 63 downto 0 );
    FIFO_WRITE_wr_en : in STD_LOGIC;
    clk : in STD_LOGIC;
    rst : in STD_LOGIC_VECTOR ( 7 downto 0 )
  );
  attribute CORE_GENERATION_INFO : string;
  attribute CORE_GENERATION_INFO of mtc_impl : entity is "mtc_impl,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=mtc_impl,x_ipVersion=1.00.a,x_ipLanguage=VHDL,numBlks=14,numReposBlks=14,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=1,numPkgbdBlks=0,bdsource=USER,synth_mode=OOC_per_IP}";
  attribute HW_HANDOFF : string;
  attribute HW_HANDOFF of mtc_impl : entity is "mtc_impl.hwdef";
end mtc_impl;

architecture STRUCTURE of mtc_impl is
  component mtc_impl_fifo_generator_0_0 is
  port (
    clk : in STD_LOGIC;
    srst : in STD_LOGIC;
    din : in STD_LOGIC_VECTOR ( 1023 downto 0 );
    wr_en : in STD_LOGIC;
    rd_en : in STD_LOGIC;
    dout : out STD_LOGIC_VECTOR ( 127 downto 0 );
    full : out STD_LOGIC;
    empty : out STD_LOGIC;
    wr_rst_busy : out STD_LOGIC;
    rd_rst_busy : out STD_LOGIC
  );
  end component mtc_impl_fifo_generator_0_0;
  component mtc_impl_xlslice_0_0 is
  port (
    Din : in STD_LOGIC_VECTOR ( 577 downto 0 );
    Dout : out STD_LOGIC_VECTOR ( 0 to 0 )
  );
  end component mtc_impl_xlslice_0_0;
  component mtc_impl_fifo_generator_1_0 is
  port (
    clk : in STD_LOGIC;
    srst : in STD_LOGIC;
    din : in STD_LOGIC_VECTOR ( 63 downto 0 );
    wr_en : in STD_LOGIC;
    rd_en : in STD_LOGIC;
    dout : out STD_LOGIC_VECTOR ( 511 downto 0 );
    full : out STD_LOGIC;
    empty : out STD_LOGIC;
    wr_rst_busy : out STD_LOGIC;
    rd_rst_busy : out STD_LOGIC
  );
  end component mtc_impl_fifo_generator_1_0;
  component mtc_impl_xlslice_0_1 is
  port (
    Din : in STD_LOGIC_VECTOR ( 511 downto 0 );
    Dout : out STD_LOGIC_VECTOR ( 161 downto 0 )
  );
  end component mtc_impl_xlslice_0_1;
  component mtc_impl_xlslice_1_0 is
  port (
    Din : in STD_LOGIC_VECTOR ( 511 downto 0 );
    Dout : out STD_LOGIC_VECTOR ( 338 downto 0 )
  );
  end component mtc_impl_xlslice_1_0;
  component mtc_impl_c_shift_ram_0_0 is
  port (
    D : in STD_LOGIC_VECTOR ( 15 downto 0 );
    CLK : in STD_LOGIC;
    Q : out STD_LOGIC_VECTOR ( 15 downto 0 )
  );
  end component mtc_impl_c_shift_ram_0_0;
  component mtc_impl_xlslice_1_1 is
  port (
    Din : in STD_LOGIC_VECTOR ( 161 downto 0 );
    Dout : out STD_LOGIC_VECTOR ( 53 downto 0 )
  );
  end component mtc_impl_xlslice_1_1;
  component mtc_impl_xlslice_3_0 is
  port (
    Din : in STD_LOGIC_VECTOR ( 161 downto 0 );
    Dout : out STD_LOGIC_VECTOR ( 53 downto 0 )
  );
  end component mtc_impl_xlslice_3_0;
  component mtc_impl_xlslice_4_0 is
  port (
    Din : in STD_LOGIC_VECTOR ( 161 downto 0 );
    Dout : out STD_LOGIC_VECTOR ( 53 downto 0 )
  );
  end component mtc_impl_xlslice_4_0;
  component mtc_impl_xlconcat_0_0 is
  port (
    In0 : in STD_LOGIC_VECTOR ( 192 downto 0 );
    In1 : in STD_LOGIC_VECTOR ( 192 downto 0 );
    In2 : in STD_LOGIC_VECTOR ( 192 downto 0 );
    dout : out STD_LOGIC_VECTOR ( 578 downto 0 )
  );
  end component mtc_impl_xlconcat_0_0;
  component mtc_impl_xlslice_2_0 is
  port (
    Din : in STD_LOGIC_VECTOR ( 338 downto 0 );
    Dout : out STD_LOGIC_VECTOR ( 112 downto 0 )
  );
  end component mtc_impl_xlslice_2_0;
  component mtc_impl_xlslice_6_0 is
  port (
    Din : in STD_LOGIC_VECTOR ( 338 downto 0 );
    Dout : out STD_LOGIC_VECTOR ( 112 downto 0 )
  );
  end component mtc_impl_xlslice_6_0;
  component mtc_impl_xlslice_7_0 is
  port (
    Din : in STD_LOGIC_VECTOR ( 338 downto 0 );
    Dout : out STD_LOGIC_VECTOR ( 112 downto 0 )
  );
  end component mtc_impl_xlslice_7_0;
  component mtc_impl_mtc_bd_impl_0_0 is
  port (
    clock : in STD_LOGIC;
    rst : in STD_LOGIC;
    srst : in STD_LOGIC;
    ptcalc_0 : in STD_LOGIC_VECTOR ( 53 downto 0 );
    ptcalc_1 : in STD_LOGIC_VECTOR ( 53 downto 0 );
    ptcalc_2 : in STD_LOGIC_VECTOR ( 53 downto 0 );
    sl0 : in STD_LOGIC_VECTOR ( 112 downto 0 );
    sl1 : in STD_LOGIC_VECTOR ( 112 downto 0 );
    sl2 : in STD_LOGIC_VECTOR ( 112 downto 0 );
    mtc0 : out STD_LOGIC_VECTOR ( 192 downto 0 );
    mtc1 : out STD_LOGIC_VECTOR ( 192 downto 0 );
    mtc2 : out STD_LOGIC_VECTOR ( 192 downto 0 )
  );
  end component mtc_impl_mtc_bd_impl_0_0;
  signal FIFO_READ_1_EMPTY : STD_LOGIC;
  signal FIFO_READ_1_RD_DATA : STD_LOGIC_VECTOR ( 127 downto 0 );
  signal FIFO_READ_1_RD_EN : STD_LOGIC;
  signal FIFO_WRITE_1_FULL : STD_LOGIC;
  signal FIFO_WRITE_1_WR_DATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal FIFO_WRITE_1_WR_EN : STD_LOGIC;
  signal Net : STD_LOGIC;
  signal c_shift_ram_0_Q : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal fifo_generator_1_dout : STD_LOGIC_VECTOR ( 511 downto 0 );
  signal mtc_bd_impl_0_mtc : STD_LOGIC_VECTOR ( 578 downto 0 );
  signal mtc_bd_impl_0_mtc0 : STD_LOGIC_VECTOR ( 192 downto 0 );
  signal mtc_bd_impl_0_mtc1 : STD_LOGIC_VECTOR ( 192 downto 0 );
  signal mtc_bd_impl_0_mtc2 : STD_LOGIC_VECTOR ( 192 downto 0 );
  signal rst_1 : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal xlslice_0_Dout : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xlslice_1_Dout : STD_LOGIC_VECTOR ( 161 downto 0 );
  signal xlslice_2_Dout : STD_LOGIC_VECTOR ( 338 downto 0 );
  signal xlslice_3_Dout : STD_LOGIC_VECTOR ( 53 downto 0 );
  signal xlslice_4_Dout : STD_LOGIC_VECTOR ( 53 downto 0 );
  signal xlslice_5_Dout : STD_LOGIC_VECTOR ( 53 downto 0 );
  signal xlslice_6_Dout : STD_LOGIC_VECTOR ( 112 downto 0 );
  signal xlslice_7_Dout : STD_LOGIC_VECTOR ( 112 downto 0 );
  signal xlslice_8_Dout : STD_LOGIC_VECTOR ( 112 downto 0 );
  signal NLW_fifo_generator_0_full_UNCONNECTED : STD_LOGIC;
  signal NLW_fifo_generator_0_rd_rst_busy_UNCONNECTED : STD_LOGIC;
  signal NLW_fifo_generator_0_wr_rst_busy_UNCONNECTED : STD_LOGIC;
  signal NLW_fifo_generator_1_empty_UNCONNECTED : STD_LOGIC;
  signal NLW_fifo_generator_1_rd_rst_busy_UNCONNECTED : STD_LOGIC;
  signal NLW_fifo_generator_1_wr_rst_busy_UNCONNECTED : STD_LOGIC;
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of FIFO_READ_empty : signal is "xilinx.com:interface:fifo_read:1.0 FIFO_READ EMPTY";
  attribute X_INTERFACE_INFO of FIFO_READ_rd_en : signal is "xilinx.com:interface:fifo_read:1.0 FIFO_READ RD_EN";
  attribute X_INTERFACE_INFO of FIFO_WRITE_full : signal is "xilinx.com:interface:fifo_write:1.0 FIFO_WRITE FULL";
  attribute X_INTERFACE_INFO of FIFO_WRITE_wr_en : signal is "xilinx.com:interface:fifo_write:1.0 FIFO_WRITE WR_EN";
  attribute X_INTERFACE_INFO of clk : signal is "xilinx.com:signal:clock:1.0 CLK.CLK CLK";
  attribute X_INTERFACE_PARAMETER : string;
  attribute X_INTERFACE_PARAMETER of clk : signal is "XIL_INTERFACENAME CLK.CLK, ASSOCIATED_RESET rst, CLK_DOMAIN mtc_impl_clk, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.000";
  attribute X_INTERFACE_INFO of FIFO_READ_rd_data : signal is "xilinx.com:interface:fifo_read:1.0 FIFO_READ RD_DATA";
  attribute X_INTERFACE_INFO of FIFO_WRITE_wr_data : signal is "xilinx.com:interface:fifo_write:1.0 FIFO_WRITE WR_DATA";
begin
  FIFO_READ_1_RD_EN <= FIFO_READ_rd_en;
  FIFO_READ_empty <= FIFO_READ_1_EMPTY;
  FIFO_READ_rd_data(127 downto 0) <= FIFO_READ_1_RD_DATA(127 downto 0);
  FIFO_WRITE_1_WR_DATA(63 downto 0) <= FIFO_WRITE_wr_data(63 downto 0);
  FIFO_WRITE_1_WR_EN <= FIFO_WRITE_wr_en;
  FIFO_WRITE_full <= FIFO_WRITE_1_FULL;
  Net <= clk;
  rst_1(7 downto 0) <= rst(7 downto 0);
c_shift_ram_0: component mtc_impl_c_shift_ram_0_0
     port map (
      CLK => Net,
      D(15 downto 8) => B"00000000",
      D(7 downto 0) => rst_1(7 downto 0),
      Q(15 downto 0) => c_shift_ram_0_Q(15 downto 0)
    );
fifo_generator_0: component mtc_impl_fifo_generator_0_0
     port map (
      clk => Net,
      din(1023 downto 579) => B"0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
      din(578 downto 0) => mtc_bd_impl_0_mtc(578 downto 0),
      dout(127 downto 0) => FIFO_READ_1_RD_DATA(127 downto 0),
      empty => FIFO_READ_1_EMPTY,
      full => NLW_fifo_generator_0_full_UNCONNECTED,
      rd_en => FIFO_READ_1_RD_EN,
      rd_rst_busy => NLW_fifo_generator_0_rd_rst_busy_UNCONNECTED,
      srst => rst_1(0),
      wr_en => xlslice_0_Dout(0),
      wr_rst_busy => NLW_fifo_generator_0_wr_rst_busy_UNCONNECTED
    );
fifo_generator_1: component mtc_impl_fifo_generator_1_0
     port map (
      clk => Net,
      din(63 downto 0) => FIFO_WRITE_1_WR_DATA(63 downto 0),
      dout(511 downto 0) => fifo_generator_1_dout(511 downto 0),
      empty => NLW_fifo_generator_1_empty_UNCONNECTED,
      full => FIFO_WRITE_1_FULL,
      rd_en => c_shift_ram_0_Q(0),
      rd_rst_busy => NLW_fifo_generator_1_rd_rst_busy_UNCONNECTED,
      srst => rst_1(0),
      wr_en => FIFO_WRITE_1_WR_EN,
      wr_rst_busy => NLW_fifo_generator_1_wr_rst_busy_UNCONNECTED
    );
mtc_bd_impl_0: component mtc_impl_mtc_bd_impl_0_0
     port map (
      clock => Net,
      mtc0(192 downto 0) => mtc_bd_impl_0_mtc0(192 downto 0),
      mtc1(192 downto 0) => mtc_bd_impl_0_mtc1(192 downto 0),
      mtc2(192 downto 0) => mtc_bd_impl_0_mtc2(192 downto 0),
      ptcalc_0(53 downto 0) => xlslice_3_Dout(53 downto 0),
      ptcalc_1(53 downto 0) => xlslice_4_Dout(53 downto 0),
      ptcalc_2(53 downto 0) => xlslice_5_Dout(53 downto 0),
      rst => rst_1(0),
      sl0(112 downto 0) => xlslice_6_Dout(112 downto 0),
      sl1(112 downto 0) => xlslice_7_Dout(112 downto 0),
      sl2(112 downto 0) => xlslice_8_Dout(112 downto 0),
      srst => rst_1(0)
    );
xlconcat_0: component mtc_impl_xlconcat_0_0
     port map (
      In0(192 downto 0) => mtc_bd_impl_0_mtc0(192 downto 0),
      In1(192 downto 0) => mtc_bd_impl_0_mtc1(192 downto 0),
      In2(192 downto 0) => mtc_bd_impl_0_mtc2(192 downto 0),
      dout(578 downto 0) => mtc_bd_impl_0_mtc(578 downto 0)
    );
xlslice_0: component mtc_impl_xlslice_0_0
     port map (
      Din(577 downto 0) => mtc_bd_impl_0_mtc(577 downto 0),
      Dout(0) => xlslice_0_Dout(0)
    );
xlslice_1: component mtc_impl_xlslice_0_1
     port map (
      Din(511 downto 0) => fifo_generator_1_dout(511 downto 0),
      Dout(161 downto 0) => xlslice_1_Dout(161 downto 0)
    );
xlslice_2: component mtc_impl_xlslice_1_0
     port map (
      Din(511 downto 0) => fifo_generator_1_dout(511 downto 0),
      Dout(338 downto 0) => xlslice_2_Dout(338 downto 0)
    );
xlslice_3: component mtc_impl_xlslice_1_1
     port map (
      Din(161 downto 0) => xlslice_1_Dout(161 downto 0),
      Dout(53 downto 0) => xlslice_3_Dout(53 downto 0)
    );
xlslice_4: component mtc_impl_xlslice_3_0
     port map (
      Din(161 downto 0) => xlslice_1_Dout(161 downto 0),
      Dout(53 downto 0) => xlslice_4_Dout(53 downto 0)
    );
xlslice_5: component mtc_impl_xlslice_4_0
     port map (
      Din(161 downto 0) => xlslice_1_Dout(161 downto 0),
      Dout(53 downto 0) => xlslice_5_Dout(53 downto 0)
    );
xlslice_6: component mtc_impl_xlslice_2_0
     port map (
      Din(338 downto 0) => xlslice_2_Dout(338 downto 0),
      Dout(112 downto 0) => xlslice_6_Dout(112 downto 0)
    );
xlslice_7: component mtc_impl_xlslice_6_0
     port map (
      Din(338 downto 0) => xlslice_2_Dout(338 downto 0),
      Dout(112 downto 0) => xlslice_7_Dout(112 downto 0)
    );
xlslice_8: component mtc_impl_xlslice_7_0
     port map (
      Din(338 downto 0) => xlslice_2_Dout(338 downto 0),
      Dout(112 downto 0) => xlslice_8_Dout(112 downto 0)
    );
end STRUCTURE;

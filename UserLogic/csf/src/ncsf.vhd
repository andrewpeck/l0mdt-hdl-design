----------------------------------------------------------------------------------
-- Company: Max-Planck-Institut fuer Physik - Munich
-- Engineer: Davide Cieri - davide.cieri@cern.ch
--
-- Create Date: 02/08/2019 11:31:09 AM
-- Design Name: Compact Segment Finder
-- Module Name: csf_top - Behavioral
-- Project Name:
-- Target Devices:
-- Tool Versions: 2018.3
-- Description: Compact Segment Finder top module
--
-- Dependencies: csf_pkg
--
-- Revision:
-- Revision 19.10.18
-- Additional Comments:
--
----------------------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
USE ieee.math_real.ALL;

LIBRARY shared_lib;
USE shared_lib.common_ieee_pkg.ALL;
USE shared_lib.l0mdt_constants_pkg.ALL;
USE shared_lib.l0mdt_dataformats_pkg.ALL;
USE shared_lib.common_constants_pkg.ALL;
USE shared_lib.common_types_pkg.ALL;

LIBRARY csf_lib;
USE csf_lib.csf_pkg.ALL;
USE csf_lib.csf_custom_pkg.ALL;
ENTITY csf IS
  GENERIC (
    IS_ENDCAP : INTEGER := 0;
    MDT_STATION : INTEGER := 0; -- Station 0: Inner, 1: Middle, 2: Outer
    SPYBUFFER_EN : INTEGER := 0;
    SPYHIT_MEM_WIDTH : INTEGER := 10;
    SPYHIT_EL_MEM_WIDTH : INTEGER := 10;
    SPYSLC_MEM_WIDTH : INTEGER := 10;
    SPYSLC_EL_MEM_WIDTH : INTEGER := 10;
    SPYSEG_MEM_WIDTH : INTEGER := 10;
    SPYSEG_EL_MEM_WIDTH : INTEGER := 10;
    SPY_META_DATA_WIDTH : INTEGER := 8
  );
  PORT (
    clk : IN STD_LOGIC;
    i_seed : IN heg2sfslc_rvt;
    i_mdt_hit : IN heg2sfhit_rvt;
    i_eof : IN STD_LOGIC;
    i_rst : IN STD_LOGIC;
    o_seg : OUT sf2ptcalc_rvt;
    --SpuBuffer -- TODO - This block has been moved to FM block - Can be removed here
    spy_clock : IN STD_LOGIC;
    -- Hit Spybuffer
    i_spyhit_fc_we : IN STD_LOGIC;
    i_spyhit_fc_re : IN STD_LOGIC;
    i_spyhit_freeze : IN STD_LOGIC;
    i_spyhit_playback : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
    i_spyhit_pb_we : IN STD_LOGIC;
    i_spyhit_pb_wdata : IN heg2sfhit_rvt;
    i_spyhit_re : IN STD_LOGIC; --this should be enable signal in
    --new Spybuffer interface
    i_spyhit_meta_we : IN STD_LOGIC;
    i_spyhit_addr : IN STD_LOGIC_VECTOR(SPYHIT_MEM_WIDTH - 1 DOWNTO 0);
    i_spyhit_meta_addr : IN STD_LOGIC_VECTOR(SPYHIT_EL_MEM_WIDTH - 1 DOWNTO 0);
    o_spyhit_data : OUT heg2sfhit_rvt;
    o_spyhit_meta_rdata : OUT STD_LOGIC_VECTOR(SPY_META_DATA_WIDTH - 1 DOWNTO 0);
    i_spyhit_meta_wdata : IN STD_LOGIC_VECTOR(SPY_META_DATA_WIDTH - 1 DOWNTO 0);
    o_spyhit_af : OUT STD_LOGIC;
    o_spyhit_empty : OUT STD_LOGIC;

    -- SLC Spybuffer
    i_spyslc_fc_we : IN STD_LOGIC;
    i_spyslc_fc_re : IN STD_LOGIC;
    i_spyslc_freeze : IN STD_LOGIC;
    i_spyslc_playback : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
    i_spyslc_pb_we : IN STD_LOGIC;
    i_spyslc_pb_wdata : IN heg2sfslc_rvt;
    i_spyslc_re : IN STD_LOGIC; --this should be enable signal in
    --new Spybuffer interface
    i_spyslc_addr : IN STD_LOGIC_VECTOR(SPYSLC_MEM_WIDTH - 1 DOWNTO 0);
    i_spyslc_meta_we : IN STD_LOGIC;
    i_spyslc_meta_addr : IN STD_LOGIC_VECTOR(SPYSLC_EL_MEM_WIDTH - 1 DOWNTO 0);
    o_spyslc_data : OUT heg2sfslc_rvt;
    o_spyslc_meta_rdata : OUT STD_LOGIC_VECTOR(SPY_META_DATA_WIDTH - 1 DOWNTO 0);
    i_spyslc_meta_wdata : IN STD_LOGIC_VECTOR(SPY_META_DATA_WIDTH - 1 DOWNTO 0);
    o_spyslc_af : OUT STD_LOGIC;
    o_spyslc_empty : OUT STD_LOGIC;

    -- Segment Spybuffer
    i_spyseg_fc_we : IN STD_LOGIC;
    i_spyseg_fc_re : IN STD_LOGIC;
    i_spyseg_freeze : IN STD_LOGIC;
    i_spyseg_playback : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
    i_spyseg_pb_we : IN STD_LOGIC;
    i_spyseg_pb_wdata : IN sf2ptcalc_rvt;
    i_spyseg_re : IN STD_LOGIC; --this should be enable signal in
    --new Spybuffer interface
    i_spyseg_addr : IN STD_LOGIC_VECTOR(SPYSEG_MEM_WIDTH - 1 DOWNTO 0);
    i_spyseg_meta_addr : IN STD_LOGIC_VECTOR(SPYSEG_EL_MEM_WIDTH - 1 DOWNTO 0);
    i_spyseg_meta_we : IN STD_LOGIC;
    o_spyseg_data : OUT sf2ptcalc_rvt;
    o_spyseg_meta_rdata : OUT STD_LOGIC_VECTOR(SPY_META_DATA_WIDTH - 1 DOWNTO 0);
    i_spyseg_meta_wdata : IN STD_LOGIC_VECTOR(SPY_META_DATA_WIDTH - 1 DOWNTO 0);
    o_spyseg_af : OUT STD_LOGIC;
    o_spyseg_empty : OUT STD_LOGIC
  );
END ENTITY csf;

ARCHITECTURE behavioral OF csf IS

  -- Input RoI
  SIGNAL seed_i : heg2sfslc_rt;
  SIGNAL seed : heg2sfslc_rvt;
  SIGNAL csf_seed : heg2sfslc_rvt;

  -- Input signals
  SIGNAL csf_mdt_hit : heg2sfhit_rvt;
  SIGNAL mdt_hit : heg2sfhit_rt;
  SIGNAL mdt_hits : heg2sfhit_bus_avt (1 DOWNTO 0);
  SIGNAL eof : STD_LOGIC;

  -- Clustering signals
  SIGNAL cluster_hits : csf_hit_a_avt(CSF_MAX_CLUSTERS - 1 DOWNTO 0);
  SIGNAL fitter_en : STD_LOGIC_VECTOR(CSF_MAX_CLUSTERS - 1 DOWNTO 0);

  -- Fitters Signals
  SIGNAL sums : csf_sums_a_avt(CSF_MAX_CLUSTERS - 1 DOWNTO 0);
  SIGNAL locseg : csf_locseg_rvt;

  ---- Coordinate transformation
  SIGNAL coord_seed : heg2sfslc_rvt;

  -- Output signal
  SIGNAL output_segment : csf_locseg_rvt;
  SIGNAL out_seg : csf_locseg_rt;
  SIGNAL globseg : sf2ptcalc_rvt;

  -- Components
  --component spybuffer is
  --  generic (
  --    DATA_WIDTH_A    : integer := 64;
  --    DATA_WIDTH_B    : integer := 64;
  --    SPY_MEM_WIDTH_A : integer := 10;
  --    SPY_MEM_WIDTH_B : integer := 10;
  --    FC_FIFO_WIDTH   : integer := 3;
  --    EL_MEM_SIZE     : integer := 16;
  --    EL_MEM_WIDTH    : integer := 4;
  --    PASSTHROUGH     : integer := 1;
  --    SPY_META_DATA_WIDTH : integer :=7
  --  );
  --  port (
  --    rclock                : in    std_logic;
  --    wclock                : in    std_logic;
  --    rresetbar             : in    std_logic;
  --    wresetbar             : in    std_logic;
  --    write_data            : in    std_logic_vector(DATA_WIDTH_A - 1 downto 0);
  --    write_enable          : in    std_logic;
  --    read_enable           : in    std_logic;
  --    read_data             : out   std_logic_vector(DATA_WIDTH_A - 1 downto 0);

  --    spy_clock             : in    std_logic;
  --    freeze                : in    std_logic;
  --    playback              : in    std_logic_vector(1 downto 0);
  --    spy_addr              : in    std_logic_vector(SPY_MEM_WIDTH_B - 1 downto 0);
  --    spy_write_enable      : in    std_logic;
  --    spy_write_data        : in    std_logic_vector(DATA_WIDTH_B - 1 downto 0);
  --    spy_en                : in    std_logic;
  --    spy_data              : out   std_logic_vector(DATA_WIDTH_B - 1 downto 0);

  --    spy_clock_meta        : in    std_logic;
  --    spy_meta_en           : in    std_logic;
  --    spy_meta_addr         : in    std_logic_vector(EL_MEM_WIDTH  - 1 downto 0);
  --    spy_meta_read_data    : out   std_logic_vector(SPY_META_DATA_WIDTH -1     downto 0);
  --    spy_meta_write_data   : in    std_logic_vector(SPY_META_DATA_WIDTH -1     downto 0);
  --    spy_meta_wen          : in    std_logic;

  --    almost_full           : out   std_logic;
  --    empty                 : out   std_logic;

  --    dbg_spy_meta_write_addr : out   std_logic_vector(EL_MEM_WIDTH  - 1 downto 0);
  --    dbg_spy_write_addr      : out   std_logic_vector(SPY_MEM_WIDTH_A - 1 downto 0);
  --    dbg_spy_meta_read_data  : out   std_logic_vector(SPY_META_DATA_WIDTH - 1 downto 0)
  --  );
  --end component spybuffer;

BEGIN
  -- SpyBuffers Generate

  ----spybuffer_generate : IF SPYBUFFER_EN = 1 GENERATE

  ----  hit_spybuffer : component spybuffer
  ----    generic map (
  ----      DATA_WIDTH_A    => HEG2SFHIT_LEN,
  ----      DATA_WIDTH_B    => HEG2SFHIT_LEN,
  ----      SPY_MEM_WIDTH_A => SPYHIT_MEM_WIDTH,
  ----      SPY_MEM_WIDTH_B => SPYHIT_MEM_WIDTH,
  ----      FC_FIFO_WIDTH   => 4,
  ----      EL_MEM_SIZE     => 16,
  ----      EL_MEM_WIDTH    => SPYHIT_EL_MEM_WIDTH,
  ----      PASSTHROUGH     => 1,
  ----      SPY_META_DATA_WIDTH => SPY_META_DATA_WIDTH
  ----    )
  ----    port map (
  ----      rclock                => clk,
  ----      wclock                => clk,
  ----      rresetbar             => not i_rst,
  ----      wresetbar             => not i_rst,
  ----      write_data            => i_mdt_hit,
  ----      write_enable          => i_spyhit_fc_we,
  ----      read_data             => csf_mdt_hit,
  ----      read_enable           => i_spyhit_fc_re,
  ----      almost_full           => o_spyhit_af,
  ----      empty                 => o_spyhit_empty,
  ----      spy_clock             => spy_clock,
  ----      freeze                => i_spyhit_freeze,
  ----      playback              => i_spyhit_playback,
  ----      spy_addr              => i_spyhit_addr,
  ----      spy_write_enable      => i_spyhit_pb_we,
  ----      spy_write_data        => i_spyhit_pb_wdata,
  ----      spy_en                => i_spyhit_re, 
  ----      spy_data              => o_spyhit_data,
  ----      spy_clock_meta        => spy_clock,
  ----      spy_meta_en           => '0',
  ----      spy_meta_addr         => i_spyhit_meta_addr,
  ----      spy_meta_read_data    => o_spyhit_meta_rdata,
  ----      spy_meta_write_data   => i_spyhit_meta_wdata,
  ----      spy_meta_wen          => i_spyhit_meta_we

  ----    );

  ----  slc_spybuffer : component spybuffer
  ----    generic map (
  ----      DATA_WIDTH_A    => HEG2SFSLC_LEN,
  ----      DATA_WIDTH_B    => HEG2SFSLC_LEN,
  ----      SPY_MEM_WIDTH_A => SPYSLC_MEM_WIDTH,
  ----      SPY_MEM_WIDTH_B => SPYSLC_MEM_WIDTH,
  ----      FC_FIFO_WIDTH   => 4,
  ----      EL_MEM_SIZE     => 16,
  ----      EL_MEM_WIDTH    => SPYSLC_EL_MEM_WIDTH,
  ----      PASSTHROUGH     => 1,
  ----      SPY_META_DATA_WIDTH => SPY_META_DATA_WIDTH
  ----    )
  ----    port map (
  ----      rclock                => clk,
  ----      wclock                => clk,
  ----      rresetbar             => not i_rst,
  ----      wresetbar             => not i_rst,
  ----      write_data            => i_seed,
  ----      write_enable          => i_spyslc_fc_we,
  ----      read_data             => csf_seed,
  ----      read_enable           => i_spyslc_fc_re,
  ----      almost_full           => o_spyslc_af,
  ----      empty                 => o_spyslc_empty,
  ----      freeze                => i_spyslc_freeze,
  ----      playback              => i_spyslc_playback,
  ----      spy_clock             => spy_clock,
  ----      spy_addr              => i_spyslc_addr,
  ----      spy_write_enable      => i_spyslc_pb_we,
  ----      spy_write_data        => i_spyslc_pb_wdata,
  ----      spy_en                => i_spyslc_re,
  ----      spy_data              => o_spyslc_data,
  ----      spy_clock_meta        => spy_clock,
  ----     	spy_meta_en           => '0',   
  ----      spy_meta_addr         => i_spyslc_meta_addr,
  ----      spy_meta_read_data    => o_spyslc_meta_rdata,
  ----      spy_meta_write_data   => i_spyslc_meta_wdata,
  ----      spy_meta_wen          => i_spyslc_meta_we
  ----    );

  ----  seg_spybuffer : component spybuffer
  ----    generic map (
  ----      DATA_WIDTH_A    => SF2PTCALC_LEN,
  ----      DATA_WIDTH_B    => SF2PTCALC_LEN,
  ----      SPY_MEM_WIDTH_A => SPYSEG_MEM_WIDTH,
  ----      SPY_MEM_WIDTH_B => SPYSEG_MEM_WIDTH,
  ----      FC_FIFO_WIDTH   => 4,
  ----      EL_MEM_SIZE     => 16,
  ----      EL_MEM_WIDTH    => SPYSEG_EL_MEM_WIDTH,
  ----      PASSTHROUGH     => 1,
  ----      SPY_META_DATA_WIDTH => SPY_META_DATA_WIDTH
  ----    )
  ----    port map (
  ----      rclock                => clk,
  ----      wclock                => clk,
  ----      rresetbar             => not i_rst,
  ----      wresetbar             => not i_rst,
  ----      write_data            => globseg,
  ----      write_enable          => i_spyseg_fc_we,
  ----      read_data             => o_seg,
  ----      read_enable           => i_spyseg_fc_re,
  ----      almost_full           => o_spyseg_af,
  ----      empty                 => o_spyseg_empty,
  ----      freeze                => i_spyseg_freeze,
  ----      playback              => i_spyseg_playback,
  ----      spy_clock             => spy_clock,
  ----      spy_addr              => i_spyseg_addr,
  ----      spy_write_enable      => i_spyseg_pb_we,
  ----      spy_write_data        => i_spyseg_pb_wdata,
  ----      spy_en                => i_spyseg_re,
  ----      spy_data              => o_spyseg_data,
  ----      spy_clock_meta        => spy_clock,
  ----     	spy_meta_en           => '0',
  ----      spy_meta_addr         => i_spyseg_meta_addr,
  ----      spy_meta_read_data    => o_spyseg_meta_rdata,
  ----      spy_meta_write_data   => i_spyseg_meta_wdata,
  ----      spy_meta_wen          => i_spyseg_meta_we

  ----    );

  seed_i <= structify(i_seed);
  o_seg <= globseg;

  -- Clustering

  Cluster : ENTITY csf_lib.csf_clustering
    GENERIC MAP(
      MAX_HITS_PER_CLUSTER => real(CSF_MAXHITS_SEG),
      MAX_CLUSTERS => CSF_MAX_CLUSTERS
    )
    PORT MAP(
      clk => clk,
      i_mdthit => i_mdt_hit,
      i_seed => i_seed,
      i_eof => i_eof,
      o_cluster_hits => cluster_hits,
      o_fitter_en => fitter_en
    );
  SUMMING : FOR i IN 0 TO CSF_MAX_CLUSTERS - 1 GENERATE
  BEGIN
    CSF_SUM : ENTITY csf_lib.ncsf_sums
      PORT MAP(
        clk => clk,
        i_hit => cluster_hits(i),
        i_fit_en => fitter_en(i),
        o_sums => sums(i)
      );
  END GENERATE SUMMING;

  Fitter : ENTITY csf_lib.ncsf_fit
    PORT MAP(
      clk => clk,
      i_sums => sums,
      o_seg => locseg
    );

  ---- Coordinate transformation
  coordtransform : ENTITY csf_lib.seg_coord_transform
    GENERIC MAP(
      IS_ENDCAP => IS_ENDCAP,
      MDT_STATION => MDT_STATION
    )
    PORT MAP(
      clk => clk,
      i_locseg => locseg,
      i_seed => coord_seed,
      o_globseg => o_seg
    );
  csf_proc : PROCESS (clk) IS
  BEGIN

    IF (clk'event AND clk = '1') THEN

      IF (seed_i.data_valid = '1') THEN
        seed <= i_seed;
      END IF;

      IF i_eof = '1' THEN
        coord_seed <= seed;
      END IF;

      -- Reset the Chi2 and Output
      IF (i_rst = '1') THEN
        seed <= (OTHERS => '0');
      END IF;
    END IF;

  END PROCESS csf_proc;

END ARCHITECTURE behavioral;
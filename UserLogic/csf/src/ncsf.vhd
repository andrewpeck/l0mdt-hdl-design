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

library ieee;
  use ieee.std_logic_1164.ALL;
  use ieee.numeric_std.ALL;
  use ieee.math_real.ALL;

library shared_lib;
  use shared_lib.common_ieee_pkg.ALL;
  use shared_lib.l0mdt_constants_pkg.ALL;
  use shared_lib.l0mdt_dataformats_pkg.ALL;
  use shared_lib.common_constants_pkg.ALL;
  use shared_lib.common_types_pkg.ALL;

library csf_lib;
  use csf_lib.csf_pkg.ALL;
  use csf_lib.csf_custom_pkg.ALL;

  
entity csf is
  generic (
    IS_ENDCAP           : integer := 0;
    MDT_STATION         : integer := 0; -- Station 0: Inner, 1: Middle, 2: Outer
    SPYBUFFER_EN        : integer := 0;
    SPYHIT_MEM_WIDTH    : integer := 10;
    SPYHIT_EL_MEM_WIDTH : integer := 10;
    SPYSLC_MEM_WIDTH    : integer := 10;
    SPYSLC_EL_MEM_WIDTH : integer := 10;
    SPYSEG_MEM_WIDTH    : integer := 10;
    SPYSEG_EL_MEM_WIDTH : integer := 10;
    SPY_META_DATA_WIDTH : integer := 8
  );
  port (
    clk       : in    std_logic;
    i_seed    : in    heg2sfslc_rvt;
    i_mdt_hit : in    heg2sfhit_rvt;
    i_eof     : in    std_logic;
    i_rst     : in    std_logic;
    o_seg     : out   sf2ptcalc_rvt

    ----SpuBuffer -- TODO - This block has been moved to FM block - Can be removed here
    --spy_clock           : in    std_logic;
    ---- Hit Spybuffer
    --i_spyhit_fc_we      : in    std_logic;
    --i_spyhit_fc_re      : in    std_logic;
    --i_spyhit_freeze     : in    std_logic;
    --i_spyhit_playback   : in    std_logic_vector(1 downto 0);
    --i_spyhit_pb_we      : in    std_logic;
    --i_spyhit_pb_wdata   : in    heg2sfhit_rvt;
    --i_spyhit_re         : in    std_logic; --this should be enable signal in
    --                                       --new Spybuffer interface
    --i_spyhit_meta_we    : in    std_logic;
    --i_spyhit_addr       : in    std_logic_vector(SPYHIT_MEM_WIDTH - 1 downto 0);
    --i_spyhit_meta_addr  : in   std_logic_vector(SPYHIT_EL_MEM_WIDTH - 1 downto 0);
    --o_spyhit_data       : out   heg2sfhit_rvt;
    --o_spyhit_meta_rdata : out   std_logic_vector( SPY_META_DATA_WIDTH - 1 downto 0);
    --i_spyhit_meta_wdata : in    std_logic_vector( SPY_META_DATA_WIDTH - 1 downto 0);
    --o_spyhit_af         : out   std_logic;
    --o_spyhit_empty      : out   std_logic;

    ---- SLC Spybuffer
    --i_spyslc_fc_we      : in    std_logic;
    --i_spyslc_fc_re      : in    std_logic;
    --i_spyslc_freeze     : in    std_logic;
    --i_spyslc_playback   : in    std_logic_vector(1 downto 0);
    --i_spyslc_pb_we      : in    std_logic;
    --i_spyslc_pb_wdata   : in    heg2sfslc_rvt;
    --i_spyslc_re         : in    std_logic; --this should be enable signal in
    --                                       --new Spybuffer interface
    --i_spyslc_addr       : in    std_logic_vector(SPYSLC_MEM_WIDTH - 1 downto 0);
    --i_spyslc_meta_we    : in    std_logic;
    --i_spyslc_meta_addr  : in    std_logic_vector(SPYSLC_EL_MEM_WIDTH - 1 downto 0);
    --o_spyslc_data       : out   heg2sfslc_rvt;
    --o_spyslc_meta_rdata : out   std_logic_vector( SPY_META_DATA_WIDTH -1 downto 0);
    --i_spyslc_meta_wdata : in    std_logic_vector( SPY_META_DATA_WIDTH -1 downto 0);
    --o_spyslc_af         : out   std_logic;
    --o_spyslc_empty      : out   std_logic;

    ---- Segment Spybuffer
    --i_spyseg_fc_we      : in    std_logic;
    --i_spyseg_fc_re      : in    std_logic;
    --i_spyseg_freeze     : in    std_logic;
    --i_spyseg_playback   : in    std_logic_vector(1 downto 0);
    --i_spyseg_pb_we      : in    std_logic;
    --i_spyseg_pb_wdata   : in    sf2ptcalc_rvt;
    --i_spyseg_re         : in    std_logic; --this should be enable signal in
    --                                       --new Spybuffer interface
    --i_spyseg_addr       : in    std_logic_vector(SPYSEG_MEM_WIDTH - 1 downto 0);
    --i_spyseg_meta_addr  : in    std_logic_vector(SPYSEG_EL_MEM_WIDTH - 1 downto 0);
    --i_spyseg_meta_we    : in    std_logic;
    --o_spyseg_data       : out   sf2ptcalc_rvt;
    --o_spyseg_meta_rdata : out   std_logic_vector( SPY_META_DATA_WIDTH - 1 downto 0);
    --i_spyseg_meta_wdata : in    std_logic_vector( SPY_META_DATA_WIDTH - 1 downto 0);
    --o_spyseg_af         : out   std_logic;
    --o_spyseg_empty      : out   std_logic
  );
end entity csf;

architecture behavioral of csf is

  -- Input RoI
  signal seed_i   : heg2sfslc_rt;
  signal seed     : heg2sfslc_rvt;
  signal csf_seed : heg2sfslc_rvt;

  -- Input signals
  signal csf_mdt_hit : heg2sfhit_rvt;
  signal mdt_hit     : heg2sfhit_rt;
  signal mdt_hits    : heg2sfhit_bus_avt (1 downto 0);
  signal eof         : std_logic;

  -- Clustering signals
  signal cluster_hits : csf_hit_a_avt(CSF_MAX_CLUSTERS-1 DOWNTO 0);
  signal fitter_en : std_logic_vector(CSF_MAX_CLUSTERS-1 DOWNTO 0);

  -- Fitters Signals
  signal sums    : csf_sums_a_avt(CSF_MAX_CLUSTERS-1 downto 0);
  signal locseg  : csf_locseg_rvt;

  ---- Coordinate transformation
  signal coord_seed     : heg2sfslc_rvt;

  -- Output signal
  signal output_segment : csf_locseg_rvt;
  signal out_seg        : csf_locseg_rt;
  signal globseg        : sf2ptcalc_rvt;

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

begin




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

  --  mdt_hit <= structify(csf_mdt_hit);
  --  seed_i  <= structify(csf_seed);

  --ELSE GENERATE
  --  mdt_hit <= structify(i_mdt_hit);
    seed_i  <= structify(i_seed);
    o_seg   <= globseg;
  --end generate spybuffer_generate;


  -- Clustering

  Cluster : entity csf_lib.csf_clustering
    generic map (
      MAX_HITS_PER_CLUSTER => real(CSF_MAXHITS_SEG),
      MAX_CLUSTERS => CSF_MAX_CLUSTERS  
    )
    port map (
      clk => clk,
      i_mdthit => i_mdt_hit,
      i_seed => i_seed,
      i_eof => i_eof,
      o_cluster_hits => cluster_hits,
      o_fitter_en => fitter_en
    );

 
  SUMMING : FOR i IN 0 to CSF_MAX_CLUSTERS - 1 GENERATE
    BEGIN
      CSF_SUM : entity csf_lib.ncsf_sums
      port map (
        clk => clk,
        i_hit => cluster_hits(i),
        i_fit_en => fitter_en(i),
        o_sums => sums(i)
      );
  end generate SUMMING;

  Fitter : entity csf_lib.ncsf_fit
  port map(
    clk => clk,
    i_sums => sums,
    o_seg => locseg
  );

  ---- Coordinate transformation
  coordtransform : entity csf_lib.seg_coord_transform
    generic map (
      IS_ENDCAP => IS_ENDCAP,
      MDT_STATION => MDT_STATION
    )
    port map (
      clk       => clk,
      i_locseg  => locseg,
      i_seed    => coord_seed,
      o_globseg => o_seg
    );


  csf_proc : process (clk) is
  begin

    if (clk'event and clk = '1') then

      if (seed_i.data_valid = '1') then
        seed <= i_seed;
      end if;

      if i_eof = '1' then
        coord_seed <= seed;
      end if;

      -- Reset the Chi2 and Output
      if (i_rst = '1') then
        seed <= (OTHERS => '0');
      end if;
    end if;

  end process csf_proc;

end architecture behavioral;

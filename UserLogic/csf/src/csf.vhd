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
    SPYBUFFER_EN        : integer := 0;
    SPYHIT_MEM_WIDTH    : integer := 10;
    SPYHIT_EL_MEM_WIDTH : integer := 10;
    SPYSLC_MEM_WIDTH    : integer := 10;
    SPYSLC_EL_MEM_WIDTH : integer := 10;
    SPYSEG_MEM_WIDTH    : integer := 10;
    SPYSEG_EL_MEM_WIDTH : integer := 10
  );
  port (
    clk       : in    std_logic;
    i_seed    : in    heg2sfslc_rvt;
    i_mdt_hit : in    heg2sfhit_rvt;
    i_eof     : in    std_logic;
    i_rst     : in    std_logic;
    o_seg     : out   sf2ptcalc_rvt;

    -- Hit Spybuffer
    i_spyhit_fc_we      : in    std_logic;
    i_spyhit_fc_re      : in    std_logic;
    i_spyhit_freeze     : in    std_logic;
    i_spyhit_playback   : in    std_logic_vector(1 downto 0);
    i_spyhit_pb_we      : in    std_logic;
    i_spyhit_pb_wdata   : in    heg2sfhit_rvt;
    i_spyhit_re         : in    std_logic;
    i_spyhit_meta_we    : in    std_logic;
    i_spyhit_addr       : in    std_logic_vector(SPYHIT_MEM_WIDTH - 1 downto 0);
    i_spyhit_meta_addr  : in   std_logic_vector(SPYHIT_EL_MEM_WIDTH - 1 downto 0);
    o_spyhit_data       : out   heg2sfhit_rvt;
    o_spyhit_meta_rdata : out   std_logic_vector(SPYHIT_MEM_WIDTH downto 0);
    i_spyhit_meta_wdata : in    std_logic_vector(SPYHIT_MEM_WIDTH downto 0);
    o_spyhit_af         : out   std_logic;
    o_spyhit_empty      : out   std_logic;

    -- SLC Spybuffer
    i_spyslc_fc_we      : in    std_logic;
    i_spyslc_fc_re      : in    std_logic;
    i_spyslc_freeze     : in    std_logic;
    i_spyslc_playback   : in    std_logic_vector(1 downto 0);
    i_spyslc_pb_we      : in    std_logic;
    i_spyslc_pb_wdata   : in    heg2sfslc_rvt;
    i_spyslc_re         : in    std_logic;
    i_spyslc_addr       : in    std_logic_vector(SPYSLC_MEM_WIDTH - 1 downto 0);
    i_spyslc_meta_we    : in    std_logic;
    i_spyslc_meta_addr  : in    std_logic_vector(SPYSLC_EL_MEM_WIDTH - 1 downto 0);
    o_spyslc_data       : out   heg2sfslc_rvt;
    o_spyslc_meta_rdata : out   std_logic_vector(SPYSLC_MEM_WIDTH downto 0);
    i_spyslc_meta_wdata : in    std_logic_vector(SPYSLC_MEM_WIDTH downto 0);
    o_spyslc_af         : out   std_logic;
    o_spyslc_empty      : out   std_logic;

    -- Segment Spybuffer
    i_spyseg_fc_we      : in    std_logic;
    i_spyseg_fc_re      : in    std_logic;
    i_spyseg_freeze     : in    std_logic;
    i_spyseg_playback   : in    std_logic_vector(1 downto 0);
    i_spyseg_pb_we      : in    std_logic;
    i_spyseg_pb_wdata   : in    sf2ptcalc_rvt;
    i_spyseg_re         : in    std_logic;
    i_spyseg_addr       : in    std_logic_vector(SPYSEG_MEM_WIDTH - 1 downto 0);
    i_spyseg_meta_addr  : in    std_logic_vector(SPYSEG_EL_MEM_WIDTH - 1 downto 0);
    i_spyseg_meta_we    : in    std_logic;
    o_spyseg_data       : out   sf2ptcalc_rvt;
    o_spyseg_meta_rdata : out   std_logic_vector(SPYSEG_MEM_WIDTH downto 0);
    i_spyseg_meta_wdata : in    std_logic_vector(SPYSEG_MEM_WIDTH downto 0);
    o_spyseg_af         : out   std_logic;
    o_spyseg_empty      : out   std_logic
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

  -- Histogram signals
  signal histo_hit_max0, histo_hit_max1 : csf_hit_a_avt(1 downto 0);

  -- Fitters Signals

  type t_mfit is ARRAY (NATURAL RANGE <>) OF signed(CSF_SEG_M_LEN - 1 downto 0);

  type t_bfit is ARRAY (NATURAL RANGE <>) OF signed(CSF_SEG_B_LEN - 1 downto 0);

  type t_nhit is ARRAY (NATURAL RANGE <>)
    OF unsigned(CSF_MAXHITS_SEG_LEN - 1 downto 0);

  signal fit_hit_histo0, fit_hit_histo1 : csf_hit_a_avt(NUM_FITTERS - 1 downto 0);
  signal mfits                          : t_mfit(NUM_FITTERS - 1 downto 0);
  signal bfits                          : t_bfit(NUM_FITTERS - 1 downto 0);
  signal fit_valids                     : std_logic_vector(NUM_FITTERS - 1 downto 0);
  signal nhits                          : t_nhit(NUM_FITTERS - 1 downto 0);

  -- Chi2 Signals
  signal chi2_segs : csf_locseg_a_avt(NUM_FITTERS - 1 downto 0);
  signal rst_chi2  : std_logic;

  -- Output signal
  signal output_segment : csf_locseg_rvt;
  signal out_seg        : csf_locseg_rt;
  signal globseg        : sf2ptcalc_rvt;

  -- Components
  component spybuffer is
    generic (
      DATA_WIDTH_A    : integer := 64;
      DATA_WIDTH_B    : integer := 64;
      SPY_MEM_WIDTH_A : integer := 7;
      SPY_MEM_WIDTH_B : integer := 7;
      FC_FIFO_WIDTH   : integer := 3;
      EL_MEM_SIZE     : integer := 16;
      EL_MEM_WIDTH_A  : integer := 4;
      EL_MEM_WIDTH_B  : integer := 4;
      PASSTHROUGH     : integer := 1
    );
    port (
      rclock                : in    std_logic;
      wclock                : in    std_logic;
      rresetbar             : in    std_logic;
      wresetbar             : in    std_logic;
      write_data            : in    std_logic_vector(DATA_WIDTH_A - 1 downto 0);
      write_enable          : in    std_logic;
      read_enable           : in    std_logic;
      read_data             : out   std_logic_vector(DATA_WIDTH_A - 1 downto 0);
      freeze                : in    std_logic;
      playback              : in    std_logic_vector(1 downto 0);

      spy_addr              : in    std_logic_vector(SPY_MEM_WIDTH_B - 1 downto 0);
      spy_write_enable      : in    std_logic;
      spy_write_data        : in    std_logic_vector(DATA_WIDTH_B - 1 downto 0);
      spy_read_enable       : in    std_logic;
      spy_data              : out   std_logic_vector(DATA_WIDTH_B - 1 downto 0);

      spy_meta_addr         : in    std_logic_vector(EL_MEM_WIDTH_B  - 1 downto 0);
      spy_meta_read_data    : out   std_logic_vector(SPY_MEM_WIDTH_B     downto 0);
      spy_meta_write_data   : in    std_logic_vector(SPY_MEM_WIDTH_B     downto 0);
      spy_meta_wen          : in    std_logic;

      almost_full           : out   std_logic;
      empty                 : out   std_logic

    );
  end component spybuffer;

  component csf_histogram is
    generic (
      MAX_HITS_PER_BIN : real := 8.0
    );
    port (
      clk          : in    std_logic;
      i_mdthit     : in    heg2sfhit_rvt;
      i_seed       : in    heg2sfslc_rvt;
      i_eof        : in    std_logic;
      o_histo_hit0 : out   csf_hit_rvt;
      o_histo_hit1 : out   csf_hit_rvt
    );
  end component csf_histogram;

  component csf_fitter is
    port (
      clk         : in    std_logic;
      i_hit1      : in    csf_hit_rvt;
      i_hit2      : in    csf_hit_rvt;
      o_mfit      : out   signed(CSF_SEG_M_LEN - 1 downto 0);
      o_bfit      : out   signed(CSF_SEG_B_LEN - 1 downto 0);
      o_fit_valid : out   std_logic;
      o_nhits     : out   unsigned(CSF_MAXHITS_SEG_LEN - 1 downto 0)
    );
  end component csf_fitter;

  component csf_chi2 is
    port (
      clk         : in    std_logic;
      i_hit1      : in    csf_hit_rvt;
      i_hit2      : in    csf_hit_rvt;
      i_mfit      : in    signed(CSF_SEG_M_LEN - 1 downto 0);
      i_bfit      : in    signed(CSF_SEG_B_LEN - 1 downto 0);
      i_nhits     : in    unsigned(CSF_MAXHITS_SEG_LEN - 1 downto 0);
      i_fit_valid : in    std_logic;
      o_seg       : out   csf_locseg_rvt
    );
  end component csf_chi2;

  component csf_chi2_comparison is
    port (
      clk        : in    std_logic;
      i_segments : in    csf_locseg_a_avt(NUM_FITTERS - 1 downto 0);
      o_segment  : out   csf_locseg_rvt
    );
  end component csf_chi2_comparison;

  component seg_coord_transform is
    generic (
      IS_ENDCAP : integer
    );
    port (
      clk       : in    std_logic;
      i_locseg  : in    csf_locseg_rvt;
      i_seed    : in    heg2sfslc_rvt;
      o_globseg : out   sf2ptcalc_rvt
    );
  end component seg_coord_transform;

begin

  -- SpyBuffers Generate

  spybuffer_generate : IF SPYBUFFER_EN = 1 GENERATE

    hit_spybuffer : component spybuffer
      generic map (
        DATA_WIDTH_A    => HEG2SFHIT_LEN,
        DATA_WIDTH_B    => HEG2SFHIT_LEN,
        SPY_MEM_WIDTH_A => SPYHIT_MEM_WIDTH,
        SPY_MEM_WIDTH_B => SPYHIT_MEM_WIDTH,
        FC_FIFO_WIDTH   => 4,
        EL_MEM_SIZE     => 16,
        EL_MEM_WIDTH_A  => SPYHIT_EL_MEM_WIDTH,
        EL_MEM_WIDTH_B  => SPYHIT_EL_MEM_WIDTH,
        PASSTHROUGH     => 1
      )
      port map (
        rclock                => clk,
        wclock                => clk,
        rresetbar             => not i_rst,
        wresetbar             => not i_rst,
        write_data            => i_mdt_hit,
        write_enable          => i_spyhit_fc_we,
        read_data             => csf_mdt_hit,
        read_enable           => i_spyhit_fc_re,
        almost_full           => o_spyhit_af,
        empty                 => o_spyhit_empty,
        freeze                => i_spyhit_freeze,
        playback              => i_spyhit_playback,

        spy_addr              => i_spyhit_addr,
        spy_write_enable      => i_spyhit_pb_we,
        spy_write_data        => i_spyhit_pb_wdata,
        spy_read_enable       => i_spyhit_re,
        spy_data              => o_spyhit_data,

        spy_meta_addr         => i_spyhit_meta_addr,
        spy_meta_read_data    => o_spyhit_meta_rdata,
        spy_meta_write_data   => i_spyhit_meta_wdata,
        spy_meta_wen          => i_spyhit_meta_we

      );

    slc_spybuffer : component spybuffer
      generic map (
        DATA_WIDTH_A    => HEG2SFSLC_LEN,
        DATA_WIDTH_B    => HEG2SFSLC_LEN,
        SPY_MEM_WIDTH_A => SPYSLC_MEM_WIDTH,
        SPY_MEM_WIDTH_B => SPYSLC_MEM_WIDTH,
        FC_FIFO_WIDTH   => 4,
        EL_MEM_SIZE     => 16,
        EL_MEM_WIDTH_A  => SPYSLC_EL_MEM_WIDTH,
        EL_MEM_WIDTH_B  => SPYSLC_EL_MEM_WIDTH,
        PASSTHROUGH     => 1
      )
      port map (
        rclock                => clk,
        wclock                => clk,
        rresetbar             => not i_rst,
        wresetbar             => not i_rst,
        write_data            => i_seed,
        write_enable          => i_spyslc_fc_we,
        read_data             => csf_seed,
        read_enable           => i_spyslc_fc_re,
        almost_full           => o_spyslc_af,
        empty                 => o_spyslc_empty,
        freeze                => i_spyslc_freeze,
        playback              => i_spyslc_playback,

        spy_addr              => i_spyslc_addr,
        spy_write_enable      => i_spyslc_pb_we,
        spy_write_data        => i_spyslc_pb_wdata,
        spy_read_enable       => i_spyslc_re,
        spy_data              => o_spyslc_data,

        spy_meta_addr         => i_spyslc_meta_addr,
        spy_meta_read_data    => o_spyslc_meta_rdata,
        spy_meta_write_data   => i_spyslc_meta_wdata,
        spy_meta_wen          => i_spyslc_meta_we


      );

    seg_spybuffer : component spybuffer
      generic map (
        DATA_WIDTH_A    => SF2PTCALC_LEN,
        DATA_WIDTH_B    => SF2PTCALC_LEN,
        SPY_MEM_WIDTH_A => SPYSEG_MEM_WIDTH,
        SPY_MEM_WIDTH_B => SPYSEG_MEM_WIDTH,
        FC_FIFO_WIDTH   => 4,
        EL_MEM_SIZE     => 16,
        EL_MEM_WIDTH_A  => SPYSEG_EL_MEM_WIDTH,
        EL_MEM_WIDTH_B  => SPYSEG_EL_MEM_WIDTH,
        PASSTHROUGH     => 1
      )
      port map (
        rclock                => clk,
        wclock                => clk,
        rresetbar             => not i_rst,
        wresetbar             => not i_rst,
        write_data            => globseg,
        write_enable          => i_spyseg_fc_we,
        read_data             => o_seg,
        read_enable           => i_spyseg_fc_re,
        almost_full           => o_spyseg_af,
        empty                 => o_spyseg_empty,
        freeze                => i_spyseg_freeze,
        playback              => i_spyseg_playback,

        spy_addr              => i_spyseg_addr,
        spy_write_enable      => i_spyseg_pb_we,
        spy_write_data        => i_spyseg_pb_wdata,
        spy_read_enable       => i_spyseg_re,
        spy_data              => o_spyseg_data,

        spy_meta_addr         => i_spyseg_meta_addr,
        spy_meta_read_data    => o_spyseg_meta_rdata,
        spy_meta_write_data   => i_spyseg_meta_wdata,
        spy_meta_wen          => i_spyseg_meta_we

      );

    mdt_hit <= structify(csf_mdt_hit);
    seed_i  <= structify(csf_seed);

  ELSE GENERATE
    mdt_hit <= structify(i_mdt_hit);
    seed_i  <= structify(i_seed);
    o_seg   <= globseg;
  end generate spybuffer_generate;

  -- Barrel Case

  b_e_generate : IF IS_ENDCAP = 0 GENERATE
    -- Histograms (1 per multilayer)

    histograms : FOR k IN 1 downto 0 GENERATE
    BEGIN

      histogram : component csf_histogram
        port map (
          clk          => clk,
          i_mdthit     => mdt_hits(k),
          i_seed       => i_seed,
          i_eof        => i_eof,
          o_histo_hit0 => histo_hit_max0(k),
          o_histo_hit1 => histo_hit_max1(k)
        );

    end generate histograms;

    -- Route hits from Histogram to Fitters
    fit_hit_histo0(0) <= histo_hit_max0(0);
    fit_hit_histo0(1) <= histo_hit_max1(0);
    fit_hit_histo0(2) <= histo_hit_max0(0);
    fit_hit_histo0(3) <= histo_hit_max1(0);

    fit_hit_histo1(0) <= histo_hit_max0(1);
    fit_hit_histo1(1) <= histo_hit_max0(1);
    fit_hit_histo1(2) <= histo_hit_max1(1);
    fit_hit_histo1(3) <= histo_hit_max1(1);

    -- Fitters + Chi2

    fitters : FOR i IN 0 to NUM_FITTERS - 1 GENERATE
    BEGIN

      fitter0 : component csf_fitter
        port map (
          clk         => clk,
          i_hit1      => fit_hit_histo0(i),
          i_hit2      => fit_hit_histo1(i),
          o_mfit      => mfits(i),
          o_bfit      => bfits(i),
          o_fit_valid => fit_valids(i),
          o_nhits     => nhits(i)
        );

      chi2 : component csf_chi2
        port map (
          clk         => clk,
          i_hit1      => fit_hit_histo0(i),
          i_hit2      => fit_hit_histo1(i),
          i_mfit      => mfits(i),
          i_bfit      => bfits(i),
          i_nhits     => nhits(i),
          i_fit_valid => fit_valids(i),
          o_seg       => chi2_segs(i)
        );

    end generate fitters;

    ELSE
        GENERATE
    -- Endcap
    histogram : component csf_histogram
      generic map (
        MAX_HITS_PER_BIN => 16.0
      )
      port map (
        clk          => clk,
        i_mdthit     => i_mdt_hit,
        i_seed       => i_seed,
        i_eof        => i_eof,
        o_histo_hit0 => fit_hit_histo0(0),
        o_histo_hit1 => fit_hit_histo0(1)
      );

    fitters : FOR i IN 0 to NUM_FITTERS / 2 - 1 GENERATE
    BEGIN

      fitter0 : component csf_fitter
        port map (
          clk         => clk,
          i_hit1      => fit_hit_histo0(i),
          i_hit2      => fit_hit_histo1(i),
          o_mfit      => mfits(i),
          o_bfit      => bfits(i),
          o_fit_valid => fit_valids(i),
          o_nhits     => nhits(i)
        );

      chi2 : component csf_chi2
        port map (
          clk         => clk,
          i_hit1      => fit_hit_histo0(i),
          i_hit2      => fit_hit_histo1(i),
          i_mfit      => mfits(i),
          i_bfit      => bfits(i),
          i_nhits     => nhits(i),
          i_fit_valid => fit_valids(i),
          o_seg       => chi2_segs(i)
        );

    end generate fitters;

  end generate b_e_generate;

  -- Chi2 comparator
  chi2compare : component csf_chi2_comparison
    port map (
      clk        => clk,
      i_segments => chi2_segs,
      o_segment  => output_segment
    );

  -- Coordinate tranformation
  coordtransform : component seg_coord_transform
    generic map (
      IS_ENDCAP => IS_ENDCAP
    )
    port map (
      clk       => clk,
      i_locseg  => output_segment,
      i_seed    => seed,
      o_globseg => globseg
    );

  out_seg <= structify(output_segment);

  csf_proc : process (clk) is
  begin

    if (clk'event and clk = '1') then
      mdt_hits                                   <= (OTHERS => (OTHERS => '0'));
      mdt_hits(stdlogic_integer(mdt_hit.mlayer)) <= i_mdt_hit;
      rst_chi2                                   <= '0';

      if (seed_i.data_valid = '1') then
        seed <= i_seed;
      end if;

      -- Reset the Chi2 and Output
      if (i_rst = '1') then
        seed <= (OTHERS => '0');
      end if;
    end if;

  end process csf_proc;

end architecture behavioral;

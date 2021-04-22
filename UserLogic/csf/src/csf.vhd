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
    is_endcap : integer := 0
  );
  port (
    clk       : in    std_logic;
    i_seed    : in    heg2sfslc_rvt;
    i_mdt_hit : in    heg2sfhit_rvt;
    i_eof     : in    std_logic;
    i_rst     : in    std_logic;
    o_seg     : out   sf2ptcalc_rvt
  );
end entity csf;

architecture behavioral of csf is

  -- Input RoI
  signal seed_i : heg2sfslc_rt;
  signal seed   : heg2sfslc_rvt;

  -- Input signals
  signal mdt_hit  : heg2sfhit_rt;
  signal mdt_hits : heg2sfhit_bus_avt (1 downto 0);
  signal eof      : std_logic;

  -- Histogram signals
  signal histo_hit_max0, histo_hit_max1 : csf_hit_a_avt(1 downto 0);

  -- Fitters Signals

  type t_mfit is ARRAY (NATURAL RANGE <>) OF signed(CSF_SEG_M_LEN - 1 downto 0);

  type t_bfit is ARRAY (NATURAL RANGE <>) OF signed(CSF_SEG_B_LEN - 1 downto 0);

  type t_nhit is ARRAY (NATURAL RANGE <>)
    OF unsigned(CSF_MAXHITS_SEG_LEN - 1 downto 0);

  signal fit_hit_histo0, fit_hit_histo1 : csf_hit_a_avt(NUM_FITTERS - 1 downto 0);

  signal mfits      : t_mfit(NUM_FITTERS - 1 downto 0);
  signal bfits      : t_bfit(NUM_FITTERS - 1 downto 0);
  signal fit_valids : std_logic_vector(NUM_FITTERS - 1 downto 0;
  signal nhits      : t_nhit(NUM_FITTERS - 1 downto 0);

  -- Chi2 Signals
  signal chi2_segs : csf_locseg_a_avt(NUM_FITTERS - 1 downto 0);
  signal rst_chi2  : std_logic;

  -- Output signal
  signal output_segment : csf_locseg_rvt;
  signal out_seg        : csf_locseg_rt;

begin

  -- Barrel Case

  b_e_generate : IF is_endcap = 0 GENERATE
    -- Histograms (1 per multilayer)

    histograms : FOR k IN 1 downto 0 GENERATE
    BEGIN

      histogram : entity csf_lib.csf_histogram
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

      fitter0 : entity csf_lib.csf_fitter
        port map (
          clk         => clk,
          i_hit1      => fit_hit_histo0(i),
          i_hit2      => fit_hit_histo1(i),
          o_mfit      => mfits(i),
          o_bfit      => bfits(i),
          o_fit_valid => fit_valids(i),
          o_nhits     => nhits(i)
        );

      chi2 : entity csf_lib.csf_chi2
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
    histogram : entity csf_lib.csf_histogram
      generic map (
        max_hits_per_bin => 16.0
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

      fitter0 : entity csf_lib.csf_fitter
        port map (
          clk         => clk,
          i_hit1      => fit_hit_histo0(i),
          i_hit2      => fit_hit_histo1(i),
          o_mfit      => mfits(i),
          o_bfit      => bfits(i),
          o_fit_valid => fit_valids(i),
          o_nhits     => nhits(i)
        );

      chi2 : entity csf_lib.csf_chi2
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
  chi2compare : entity csf_lib.csf_chi2_comparison
    port map (
      clk        => clk,
      i_segments => chi2_segs,
      o_segment  => output_segment
    );

  -- Coordinate tranformation
  coordtransform : entity csf_lib.seg_coord_transform
    generic map (
      is_endcap => is_endcap
    )
    port map (
      clk       => clk,
      i_locseg  => output_segment,
      i_seed    => seed,
      o_globseg => o_seg
    );

  out_seg <= structify(output_segment);

  csf_proc : process (clk) is
  begin

    mdt_hit <= structify(i_mdt_hit);
    seed_i  <= structify(i_seed);

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

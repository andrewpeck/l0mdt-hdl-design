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
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

library shared_lib;
use shared_lib.common_ieee_pkg.all;
use shared_lib.l0mdt_constants_pkg.all;
use shared_lib.l0mdt_dataformats_pkg.all;
use shared_lib.common_constants_pkg.all;
use shared_lib.common_types_pkg.all;

library csf_lib;
use csf_lib.csf_pkg.all;
use csf_lib.csf_custom_pkg.all;

library ctrl_lib;
use ctrl_lib.HPS_CTRL.all;

entity csf is
  generic (
    IS_ENDCAP   : integer := 0;
    MDT_STATION : integer := 0 -- Station 0: Inner, 1: Middle, 2: Outer
  );
  port (
    clk     : in std_logic;
    rst     : in std_logic;
    glob_en : in std_logic;
    -- control
    i_ctrl_v : in std_logic_vector; --  HPS_CSF_CSF_CTRL_t;
    o_mon_v  : out std_logic_vector;
    -- Data
    i_seed    : in heg2sfslc_vt;
    i_mdt_hit : in heg2sfhit_vt;
    i_eof     : in std_logic;
    o_seg     : out sf2ptcalc_vt
  );
end entity csf;

architecture behavioral of csf is

  -- Input RoI
  signal seed_i   : heg2sfslc_rt;
  signal seed     : heg2sfslc_vt;
  signal csf_seed : heg2sfslc_vt;

  -- Input signals
  signal csf_mdt_hit : heg2sfhit_vt;
  signal mdt_hit     : heg2sfhit_rt;
  signal mdt_hits    : heg2sfhit_avt (1 downto 0);
  signal eof         : std_logic;

  -- Histogram signals
  signal histo_hit_max0, histo_hit_max1 : csf_hit_avt(1 downto 0);

  -- Fitters Signals

  type t_mfit is array (natural range <>) of signed(CSF_SEG_M_LEN - 1 downto 0);

  type t_bfit is array (natural range <>) of signed(CSF_SEG_B_LEN - 1 downto 0);

  type t_nhit is array (natural range <>)
  of unsigned(CSF_MAXHITS_SEG_LEN - 1 downto 0);

  signal fit_hit_histo0, fit_hit_histo1 : csf_hit_avt(NUM_FITTERS - 1 downto 0);
  signal mfits                          : t_mfit(NUM_FITTERS - 1 downto 0);
  signal bfits                          : t_bfit(NUM_FITTERS - 1 downto 0);
  signal fit_valids                     : std_logic_vector(NUM_FITTERS - 1 downto 0);
  signal nhits                          : t_nhit(NUM_FITTERS - 1 downto 0);

  -- Chi2 Signals
  signal chi2_segs : csf_locseg_avt(NUM_FITTERS - 1 downto 0);
  signal rst_chi2  : std_logic;

  -- Coordinate transformation
  signal coord_seed : heg2sfslc_vt;

  -- Output signal
  signal output_segment : csf_locseg_vt;
  signal out_seg        : csf_locseg_rt;
  signal globseg        : sf2ptcalc_vt;

  component csf_histogram is
    generic (
      MAX_HITS_PER_BIN : real := 8.0
    );
    port (
      clk          : in std_logic;
      i_mdthit     : in heg2sfhit_vt;
      i_seed       : in heg2sfslc_vt;
      i_eof        : in std_logic;
      o_histo_hit0 : out csf_hit_vt;
      o_histo_hit1 : out csf_hit_vt
    );
  end component csf_histogram;

  component csf_fitter is
    port (
      clk         : in std_logic;
      i_hit1      : in csf_hit_vt;
      i_hit2      : in csf_hit_vt;
      o_mfit      : out signed(CSF_SEG_M_LEN - 1 downto 0);
      o_bfit      : out signed(CSF_SEG_B_LEN - 1 downto 0);
      o_fit_valid : out std_logic;
      o_nhits     : out unsigned(CSF_MAXHITS_SEG_LEN - 1 downto 0)
    );
  end component csf_fitter;

  component csf_chi2 is
    port (
      clk         : in std_logic;
      i_hit1      : in csf_hit_vt;
      i_hit2      : in csf_hit_vt;
      i_mfit      : in signed(CSF_SEG_M_LEN - 1 downto 0);
      i_bfit      : in signed(CSF_SEG_B_LEN - 1 downto 0);
      i_nhits     : in unsigned(CSF_MAXHITS_SEG_LEN - 1 downto 0);
      i_fit_valid : in std_logic;
      o_seg       : out csf_locseg_vt
    );
  end component csf_chi2;

  component csf_chi2_comparison is
    port (
      clk        : in std_logic;
      i_segments : in csf_locseg_avt(NUM_FITTERS - 1 downto 0);
      o_segment  : out csf_locseg_vt
    );
  end component csf_chi2_comparison;

  component seg_coord_transform is
    generic (
      IS_ENDCAP   : integer;
      MDT_STATION : integer
    );
    port (
      clk       : in std_logic;
      i_locseg  : in csf_locseg_vt;
      i_seed    : in heg2sfslc_vt;
      o_globseg : out sf2ptcalc_vt
    );
  end component seg_coord_transform;

begin

  mdt_hit <= convert(i_mdt_hit, mdt_hit);
  seed_i  <= convert(i_seed, seed_i);
  o_seg   <= globseg;

  -- Barrel Case

  b_e_generate : if IS_ENDCAP = 0 generate
    -- Histograms (1 per multilayer)

    histograms : for k in 1 downto 0 generate
    begin

      histogram : component csf_histogram
        port map(
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

      fitters : for i in 0 to NUM_FITTERS - 1 generate
      begin

        fitter0 : component csf_fitter
          port map(
            clk         => clk,
            i_hit1      => fit_hit_histo0(i),
            i_hit2      => fit_hit_histo1(i),
            o_mfit      => mfits(i),
            o_bfit      => bfits(i),
            o_fit_valid => fit_valids(i),
            o_nhits     => nhits(i)
          );

          chi2 : component csf_chi2
            port map(
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

        else
          generate
            -- Endcap
            histogram : component csf_histogram
              generic map(
                MAX_HITS_PER_BIN => 16.0
              )
              port map(
                clk          => clk,
                i_mdthit     => i_mdt_hit,
                i_seed       => i_seed,
                i_eof        => i_eof,
                o_histo_hit0 => fit_hit_histo0(0),
                o_histo_hit1 => fit_hit_histo0(1)
              );

              fitters : for i in 0 to NUM_FITTERS / 2 - 1 generate
              begin

                fitter0 : component csf_fitter
                  port map(
                    clk         => clk,
                    i_hit1      => fit_hit_histo0(i),
                    i_hit2      => fit_hit_histo1(i),
                    o_mfit      => mfits(i),
                    o_bfit      => bfits(i),
                    o_fit_valid => fit_valids(i),
                    o_nhits     => nhits(i)
                  );

                  chi2 : component csf_chi2
                    port map(
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
                  port map(
                    clk        => clk,
                    i_segments => chi2_segs,
                    o_segment  => output_segment
                  );

                  -- Coordinate transformation
                  coordtransform : component seg_coord_transform
                    generic map(
                      IS_ENDCAP   => IS_ENDCAP,
                      MDT_STATION => MDT_STATION
                    )
                    port map(
                      clk       => clk,
                      i_locseg  => output_segment,
                      i_seed    => coord_seed,
                      o_globseg => globseg
                    );

                    out_seg <= convert(output_segment, out_seg);

                    csf_proc : process (clk) is
                    begin

                      if (clk'event and clk = '1') then
                        mdt_hits                                   <= (others => (others => '0'));
                        mdt_hits(stdlogic_integer(mdt_hit.mlayer)) <= i_mdt_hit;
                        rst_chi2                                   <= '0';

                        if (seed_i.data_valid = '1') then
                          seed <= i_seed;
                        end if;

                        if i_eof = '1' then
                          coord_seed <= seed;
                        end if;

                        -- Reset the Chi2 and Output
                        if (rst = '1') then
                          seed <= (others => '0');
                        end if;
                      end if;

                    end process csf_proc;

                  end architecture behavioral;

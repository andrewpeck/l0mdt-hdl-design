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
use shared_lib.config_pkg.all;
use shared_lib.common_types_pkg.all;
use shared_lib.common_constants_pkg.all;

library csf_lib;
use csf_lib.csf_pkg.all;
use csf_lib.custom_types_csf_pkg.all;

entity csf is
    generic(
        -- Project flavour (0: Barrel, 1: Endcap)
        FLAVOUR  : integer := 0
    );
    Port (
        clk       : in std_logic;
        i_seed    : in ucm_csf_seed_rvt;
        i_mdt_hit : in hp_hit_data_rvt;
        i_eof     : in std_logic;
        i_rst     : in std_logic;
        o_seg     : out sf_seg_data_barrel_rvt
    );
end csf;

architecture Behavioral of csf is
    -- Input RoI
    signal seed_i : ucm_csf_seed_rt;
    signal seed : ucm_csf_seed_rvt;

    -- Input signals
    signal mdt_hit  : hp_hit_data_rt;
    signal mdt_hits : hp_hit_data_a_avt (1 downto 0)
        := (others => (others => '0'));
    signal eof      : std_logic := '0';

    -- Histogram signals
    signal histo_hit_max0, histo_hit_max1   : csf_hit_a_avt(1 downto 0)
        := (others => (others => '0'));

    -- Fitters Signals
    type t_mfit is array (natural range <> ) of signed(CSF_SEG_M_LEN-1 downto 0);
    type t_bfit is array (natural range <> ) of signed(CSF_SEG_B_LEN-1 downto 0);
    type t_nhit is array (natural range <> )
        of unsigned(CSF_MAXHITS_SEG_LEN-1 downto 0);

    signal fit_hit_histo0, fit_hit_histo1 :
        csf_hit_a_avt(NUM_FITTERS-1 downto 0)
        := (others => (others => '0'));

    signal mfits   : t_mfit(NUM_FITTERS-1 downto 0)
        := (others => (others => '0'));
    signal bfits   : t_bfit(NUM_FITTERS-1 downto 0)
        := (others => (others => '0'));
    signal fit_valids : std_logic_vector(NUM_FITTERS-1 downto 0)
        := (others => '0');
    signal nhits : t_nhit(NUM_FITTERS-1 downto 0);

    -- Chi2 Signals
    signal chi2_segs : csf_locseg_a_avt(NUM_FITTERS-1 downto 0)
        := (others => (others => '0'));
    signal rst_chi2 : std_logic := '0';

    -- Output signal
    signal output_segment : csf_locseg_rvt
        := (others => '0');
    signal out_seg : csf_locseg_rt;

begin

    
    -- Histograms (1 per multilayer)
    Histograms: for k in 1 downto 0 generate
    begin
        Histogram : entity csf_lib.csf_histogram
        port map(
        clk           => clk,
        i_mdthit      => mdt_hits(k),
        i_seed        => i_seed,
        i_eof         => i_eof,
        o_histo_hit0  => histo_hit_max0(k),
        o_histo_hit1  => histo_hit_max1(k)
        );
    end generate;

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
    Fitters : for i in 0 to NUM_FITTERS-1 generate
    begin
        Fitter0 : entity csf_lib.csf_fitter
        port map(
            clk            => clk,
            i_hit1         => fit_hit_histo0(i),
            i_hit2         => fit_hit_histo1(i),
            o_mfit         => mfits(i),
            o_bfit         => bfits(i),
            o_fit_valid    => fit_valids(i),
            o_nhits        => nhits(i)
        );

        chi2 : entity csf_lib.csf_chi2
        Port map(
            clk            => clk,
            i_hit1         => fit_hit_histo0(i),
            i_hit2         => fit_hit_histo1(i),
            i_mfit         => mfits(i),
            i_bfit         => bfits(i),
            i_nhits        => nhits(i),
            i_fit_valid    => fit_valids(i),
            i_rst          => rst_chi2,
            o_seg          => chi2_segs(i)
        );
    end generate ;

    -- Chi2 comparator
    Chi2Compare : entity csf_lib.csf_chi2_comparison
    Port map(
        clk                => clk,
        i_segments         => chi2_segs,
        o_segment          => output_segment
    );

    -- Coordinate tranformation
    CoordTransform: entity csf_lib.seg_coord_transform
    generic map(
        FLAVOUR => FLAVOUR
    )
    port map (
        clk                => clk,
        i_locseg           => output_segment,
        i_seed             => seed,
        o_globseg          => o_seg
    );
    
    out_seg <= structify(output_segment);

    CSF_proc : process(clk)
begin
    mdt_hit <= structify(i_mdt_hit);
    seed_i <= structify(i_seed);



    if rising_edge(clk) then

        mdt_hits <= (others => (others => '0'));
        mdt_hits(stdlogic_integer(mdt_hit.multilayer)) <= i_mdt_hit;
        rst_chi2 <= '0';

        if seed_i.data_valid = '1' then
            seed <= i_seed;
        end if;

        -- Reset the Chi2 and Output
        if out_seg.valid = '1' and out_seg.ndof /= 0 then
            rst_chi2 <= '1';
        elsif i_rst = '1' then
            seed <= (others => '0');
        end if;
    end if;
end process;

end Behavioral;

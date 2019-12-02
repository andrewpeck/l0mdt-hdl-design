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


library IEEE, csf_lib;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;
use ieee.math_real.all;
use csf_lib.csf_pkg.all;

entity csf is
    generic(
        DataWidth : integer := 64
        );
    port (
        clk       : in  std_logic;
        i_seed    : in  t_seed;
        i_mdt_hit : in  t_mdt_hit;
        o_seg     : out t_locseg;
        i_rst     : in  std_logic
        );
end csf;

architecture Behavioral of csf is
    -- Input RoI
    signal seed : t_seed := null_seed;

    -- Histogram signals
    type t_mdt_hits is array (natural range <>) of t_mdt_hit;
    type t_histo_hits is array (natural range <>) of t_histo_hit;

    signal mdt_hits                       : t_mdt_hits (1 downto 0) := (others => null_mdt_hit);
    signal eof                            : std_logic               := '0';
    signal histo_hit_max0, histo_hit_max1 : t_histo_hits(1 downto 0)
        := (others => (null_histo_hit));


    -- Fitters Signals
    type t_mfit is array (natural range <>) of signed(mfit_width-1 downto 0);
    type t_bfit is array (natural range <>) of signed(bfit_width-1 downto 0);
    type t_nhit is array (natural range <>) of unsigned(num_hits_width-1 downto 0);

    signal fit_hit_histo0, fit_hit_histo1 : t_histo_hits(num_fitters-1 downto 0)
        := (others => (null_histo_hit));

    signal mfits : t_mfit(num_fitters-1 downto 0)
        := (others => (others => '0'));
    signal bfits : t_bfit(num_fitters-1 downto 0)
        := (others => (others => '0'));
    signal fit_valids : std_logic_vector(num_fitters-1 downto 0)
        := (others => '0');
    signal nhits : t_nhit(num_fitters-1 downto 0);

    -- Chi2 Signals
    signal chi2_segs : t_locsegs(num_fitters-1 downto 0)
        := (others => null_locseg);
    signal rst_chi2 : std_logic := '0';

    -- Output signal
    signal output_segment, final_seg : t_locseg := null_locseg;


begin

    -- Histograms (1 per multilayer)
    Histograms : for k in 1 downto 0 generate
    begin
        Histogram : entity csf_lib.csf_histogram
            port map(
                clk          => clk,
                i_mdthit     => mdt_hits(k),
                i_seed       => i_seed,
                i_eof        => eof,
                o_histo_hit0 => histo_hit_max0(k),
                o_histo_hit1 => histo_hit_max1(k)
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
    Fitters : for i in 0 to num_fitters-1 generate
    begin
        Fitter0 : entity csf_lib.csf_fitter
            port map(
                clk         => clk,
                i_hit1      => fit_hit_histo0(i),
                i_hit2      => fit_hit_histo1(i),
                o_mfit      => mfits(i),
                o_bfit      => bfits(i),
                o_fit_valid => fit_valids(i),
                o_nhits     => nhits(i)
                );

        chi2 : entity csf_lib.csf_chi2
            port map(
                clk         => clk,
                i_hit1      => fit_hit_histo0(i),
                i_hit2      => fit_hit_histo1(i),
                i_mfit      => mfits(i),
                i_bfit      => bfits(i),
                i_nhits     => nhits(i),
                i_fit_valid => fit_valids(i),
                i_rst       => rst_chi2,
                o_seg       => chi2_segs(i)
                );
    end generate;

    -- Chi2 comparator
    Chi2Compare : entity csf_lib.csf_chi2_comparison
        port map(
            clk        => clk,
            i_segments => chi2_segs,
            o_segment  => output_segment
            );

    o_seg <= final_seg;

    CSF_proc : process(clk)
    begin
        if rising_edge(clk) then

            mdt_hits                                         <= (others => null_mdt_hit);
            mdt_hits(stdlogic_integer(i_mdt_hit.multilayer)) <= i_mdt_hit;
            eof                                              <= i_mdt_hit.eof;
            rst_chi2                                         <= '0';

            if i_seed.valid = '1' then
                seed <= i_seed;
            end if;


            -- Reset the Chi2 and Output
            if output_segment.valid = '1' and (output_segment.ndof /= 0) then
                rst_chi2      <= '1';
                final_seg     <= output_segment;
                final_seg.eta <= seed.eta;
                final_seg.phi <= seed.phi;
            elsif i_rst = '1' then
                final_seg <= null_locseg;
                seed      <= null_seed;

            end if;

        end if;
    end process;

end Behavioral;

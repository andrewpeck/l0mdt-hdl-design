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
        IS_ENDCAP : INTEGER := 0
    );
    PORT (
        clk : IN STD_LOGIC;
        i_seed : IN heg2sfslc_rvt;
        i_mdt_hit : IN heg2sfhit_rvt;
        i_eof : IN STD_LOGIC;
        i_rst : IN STD_LOGIC;
        o_seg : OUT sf2ptcalc_rvt
    );
END csf;

ARCHITECTURE Behavioral OF csf IS
    -- Input RoI
    SIGNAL seed_i : heg2sfslc_rt;
    SIGNAL seed : heg2sfslc_rvt;

    -- Input signals
    SIGNAL mdt_hit : heg2sfhit_rt;
    SIGNAL mdt_hits : heg2sfhit_bus_avt (1 DOWNTO 0) := (OTHERS => (OTHERS => '0'));
    SIGNAL eof : STD_LOGIC := '0';

    -- Histogram signals
    SIGNAL histo_hit_max0, histo_hit_max1 : csf_hit_a_avt(1 DOWNTO 0)
    := (OTHERS => (OTHERS => '0'));

    -- Fitters Signals
    TYPE t_mfit IS ARRAY (NATURAL RANGE <>) OF signed(CSF_SEG_M_LEN - 1 DOWNTO 0);
    TYPE t_bfit IS ARRAY (NATURAL RANGE <>) OF signed(CSF_SEG_B_LEN - 1 DOWNTO 0);
    TYPE t_nhit IS ARRAY (NATURAL RANGE <>)
    OF unsigned(CSF_MAXHITS_SEG_LEN - 1 DOWNTO 0);

    SIGNAL fit_hit_histo0, fit_hit_histo1 :
    csf_hit_a_avt(NUM_FITTERS - 1 DOWNTO 0)
    := (OTHERS => (OTHERS => '0'));

    SIGNAL mfits : t_mfit(NUM_FITTERS - 1 DOWNTO 0)
    := (OTHERS => (OTHERS => '0'));
    SIGNAL bfits : t_bfit(NUM_FITTERS - 1 DOWNTO 0)
    := (OTHERS => (OTHERS => '0'));
    SIGNAL fit_valids : STD_LOGIC_VECTOR(NUM_FITTERS - 1 DOWNTO 0)
    := (OTHERS => '0');
    SIGNAL nhits : t_nhit(NUM_FITTERS - 1 DOWNTO 0);

    -- Chi2 Signals
    SIGNAL chi2_segs : csf_locseg_a_avt(NUM_FITTERS - 1 DOWNTO 0)
    := (OTHERS => (OTHERS => '0'));
    SIGNAL rst_chi2 : STD_LOGIC := '0';

    -- Output signal
    SIGNAL output_segment : csf_locseg_rvt
    := (OTHERS => '0');
    SIGNAL out_seg : csf_locseg_rt;

BEGIN
    -- Barrel Case
    B_E_generate : IF IS_ENDCAP = 0 GENERATE
        -- Histograms (1 per multilayer)
        Histograms : FOR k IN 1 DOWNTO 0 GENERATE
        BEGIN
            Histogram : ENTITY csf_lib.csf_histogram
                PORT MAP(
                    clk => clk,
                    i_mdthit => mdt_hits(k),
                    i_seed => i_seed,
                    i_eof => i_eof,
                    o_histo_hit0 => histo_hit_max0(k),
                    o_histo_hit1 => histo_hit_max1(k)
                );
        END GENERATE;

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
        Fitters : FOR i IN 0 TO NUM_FITTERS - 1 GENERATE
        BEGIN
            Fitter0 : ENTITY csf_lib.csf_fitter
                PORT MAP(
                    clk => clk,
                    i_hit1 => fit_hit_histo0(i),
                    i_hit2 => fit_hit_histo1(i),
                    o_mfit => mfits(i),
                    o_bfit => bfits(i),
                    o_fit_valid => fit_valids(i),
                    o_nhits => nhits(i)
                );

            chi2 : ENTITY csf_lib.csf_chi2
                PORT MAP(
                    clk => clk,
                    i_hit1 => fit_hit_histo0(i),
                    i_hit2 => fit_hit_histo1(i),
                    i_mfit => mfits(i),
                    i_bfit => bfits(i),
                    i_nhits => nhits(i),
                    i_fit_valid => fit_valids(i),
                    o_seg => chi2_segs(i)
                );
        END GENERATE;
    ELSE
        GENERATE
            -- Endcap
            Histogram : ENTITY csf_lib.csf_histogram
                GENERIC MAP(
                    MAX_HITS_PER_BIN => 16.0
                )
                PORT MAP(
                    clk => clk,
                    i_mdthit => i_mdt_hit,
                    i_seed => i_seed,
                    i_eof => i_eof,
                    o_histo_hit0 => fit_hit_histo0(0),
                    o_histo_hit1 => fit_hit_histo0(1)
                );

            Fitters : FOR i IN 0 TO NUM_FITTERS/2 - 1 GENERATE
            BEGIN
                Fitter0 : ENTITY csf_lib.csf_fitter
                    PORT MAP(
                        clk => clk,
                        i_hit1 => fit_hit_histo0(i),
                        i_hit2 => fit_hit_histo1(i),
                        o_mfit => mfits(i),
                        o_bfit => bfits(i),
                        o_fit_valid => fit_valids(i),
                        o_nhits => nhits(i)
                    );

                chi2 : ENTITY csf_lib.csf_chi2
                    PORT MAP(
                        clk => clk,
                        i_hit1 => fit_hit_histo0(i),
                        i_hit2 => fit_hit_histo1(i),
                        i_mfit => mfits(i),
                        i_bfit => bfits(i),
                        i_nhits => nhits(i),
                        i_fit_valid => fit_valids(i),
                        o_seg => chi2_segs(i)
                    );
            END GENERATE;
        END GENERATE B_E_generate;

        -- Chi2 comparator
        Chi2Compare : ENTITY csf_lib.csf_chi2_comparison
            PORT MAP(
                clk => clk,
                i_segments => chi2_segs,
                o_segment => output_segment
            );

        -- Coordinate tranformation
        CoordTransform : ENTITY csf_lib.seg_coord_transform
            GENERIC MAP(
                IS_ENDCAP => IS_ENDCAP
            )
            PORT MAP(
                clk => clk,
                i_locseg => output_segment,
                i_seed => seed,
                o_globseg => o_seg
            );

        out_seg <= structify(output_segment);

        CSF_proc : PROCESS (clk)
        BEGIN
            mdt_hit <= structify(i_mdt_hit);
            seed_i <= structify(i_seed);

            IF rising_edge(clk) THEN

                mdt_hits <= (OTHERS => (OTHERS => '0'));
                mdt_hits(stdlogic_integer(mdt_hit.mlayer)) <= i_mdt_hit;
                rst_chi2 <= '0';

                IF seed_i.data_valid = '1' THEN
                    seed <= i_seed;
                END IF;

                -- Reset the Chi2 and Output
                IF i_rst = '1' THEN
                    seed <= (OTHERS => '0');
                END IF;
            END IF;
        END PROCESS;

    END Behavioral;
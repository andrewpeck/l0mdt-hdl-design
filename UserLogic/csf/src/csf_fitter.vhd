----------------------------------------------------------------------------------
-- Company: Max Planck Institut For Physics Munich
-- Engineer: Davide Cieri
--
-- Create Date: 02/12/2019 12:09:26 PM
-- Design Name: Compact Segment Finder
-- Module Name: csf_fitter - Behavioral
-- Project Name: ATLAS L0MDT Trigger
-- Target Devices: xcvu5p-flvb2104-2-e
-- Tool Versions: Vivado 2018.2
-- Description:
--
-- Dependencies:
--
-- Revision:
-- Revision 0.01 - File Created
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

-- library ieee, csf_lib, shared_lib;
-- use ieee.std_logic_1164.all;
-- use ieee.numeric_std.all;
-- use ieee.math_real.all;
-- use csf_lib.csf_pkg.all;
-- use csf_lib.custom_types_csf_pkg.all;
-- use shared_lib.custom_types_davide_pkg.all;

ENTITY csf_fitter IS
    PORT (
        clk : IN STD_LOGIC;
        i_hit1 : IN csf_hit_rvt;
        i_hit2 : IN csf_hit_rvt;
        o_mfit : OUT signed(CSF_SEG_M_LEN - 1 DOWNTO 0);
        o_bfit : OUT signed(CSF_SEG_B_LEN - 1 DOWNTO 0);
        o_fit_valid : OUT STD_LOGIC;
        o_nhits : OUT unsigned(CSF_MAXHITS_SEG_LEN - 1 DOWNTO 0)
    );
END csf_fitter;

ARCHITECTURE Behavioral OF csf_fitter IS
    -- Hits signals shifted
    SIGNAL hit1, hit2 : csf_hit_rt;
    SIGNAL hit1_s, hit2_s : csf_hit_rt;

    -- Signal declaring last hits from Histograms
    SIGNAL finalhit : STD_LOGIC := '0';

    -- Summation signal widths
    CONSTANT SUM_YZ_LEN : INTEGER := CSF_MAXHITS_SEG_LEN + MDT_LOCAL_Y_LEN * 2;
    CONSTANT SUM_Y_LEN : INTEGER := CSF_MAXHITS_SEG_LEN + MDT_LOCAL_Y_LEN;
    CONSTANT SUM_X_LEN : INTEGER := CSF_MAXHITS_SEG_LEN + MDT_LOCAL_X_LEN;
    CONSTANT SUM_X2_LEN : INTEGER := CSF_MAXHITS_SEG_LEN + MDT_LOCAL_X_LEN * 2;

    -- Summation signals
    SIGNAL dsp_SumXY, dsp_SumXY_s : unsigned(SUM_YZ_LEN - 1 DOWNTO 0)
    := (OTHERS => '0');
    SIGNAL dsp_SumY, dsp_SumY_s : unsigned(SUM_Y_LEN - 1 DOWNTO 0)
    := (OTHERS => '0');
    SIGNAL dsp_SumX, dsp_SumX_s : unsigned(SUM_X_LEN - 1 DOWNTO 0)
    := (OTHERS => '0');
    SIGNAL dsp_SumX2, dsp_SumX2_s : unsigned(SUM_X2_LEN - 1 DOWNTO 0)
    := (OTHERS => '0');
    SIGNAL dsp_nhits, dsp_nhits_s : unsigned(CSF_MAXHITS_SEG_LEN - 1 DOWNTO 0)
    := (OTHERS => '0');

    -- Numerator/Denominator widths
    CONSTANT NSUM_YZ_LEN : INTEGER := SUM_YZ_LEN + CSF_MAXHITS_SEG_LEN;
    CONSTANT SUM_Y_SUM_X_LEN : INTEGER := SUM_Y_LEN + SUM_X_LEN;
    CONSTANT SUM_Y_SUM_X2_LEN : INTEGER := SUM_Y_LEN + SUM_X2_LEN;
    CONSTANT SUM_XZ_SUM_X_LEN : INTEGER := SUM_YZ_LEN + SUM_X_LEN;
    CONSTANT SUM_X_SUM_X_LEN : INTEGER := SUM_X_LEN * 2;
    CONSTANT NSUM_X2_LEN : INTEGER := CSF_MAXHITS_SEG_LEN + SUM_X2_LEN;
    CONSTANT NUM_M_LEN : INTEGER := NSUM_YZ_LEN + 1;
    CONSTANT NUM_B_LEN : INTEGER := SUM_Y_SUM_X2_LEN + 1;
    CONSTANT DEN_LEN : INTEGER := NSUM_X2_LEN;

    -- Numerator/Denominator constants
    CONSTANT SHIFT_NUM_M : INTEGER := 15;
    CONSTANT SHIFT_NUM_B : INTEGER := 25;
    CONSTANT SHIFT_DEN : INTEGER := 18;
    CONSTANT RECIPROCAL_LEN : INTEGER := 22;
    CONSTANT B_OVER_Z_MULTI_LEN : INTEGER
    := INTEGER(log2(CSF_SEG_B_MULT/HEG2SFHIT_LOCALX_MULT));

    -- Numerator/Denominator signals
    SIGNAL dsp_NSumXY, dsp_NSumXY_s, dsp_NSumXY_ss
    : unsigned(NSUM_YZ_LEN - 1 DOWNTO 0) := (OTHERS => '0');
    SIGNAL dsp_SumYSumX, dsp_SumYSumX_s, dsp_SumYSumX_ss
    : unsigned(SUM_Y_SUM_X_LEN - 1 DOWNTO 0) := (OTHERS => '0');
    SIGNAL dsp_SumYSumX2, dsp_SumYSumX2_s, dsp_SumYSumX2_ss
    : unsigned(SUM_Y_SUM_X2_LEN - 1 DOWNTO 0) := (OTHERS => '0');
    SIGNAL dsp_SumXYSumX, dsp_SumXYSumX_s, dsp_SumXYSumX_ss
    : unsigned(SUM_XZ_SUM_X_LEN - 1 DOWNTO 0) := (OTHERS => '0');
    SIGNAL dsp_NSumX2, dsp_NSumX2_s, dsp_NSumX2_ss
    : unsigned(NSUM_X2_LEN - 1 DOWNTO 0) := (OTHERS => '0');
    SIGNAL dsp_SumXSumX, dsp_SumXSumX_s, dsp_SumXSumX_ss
    : unsigned(SUM_X_SUM_X_LEN - 1 DOWNTO 0) := (OTHERS => '0');

    SIGNAL numerator_m : signed(NUM_M_LEN - 1 DOWNTO 0) := (OTHERS => '0');
    SIGNAL numerator_b : signed(NUM_B_LEN - 1 DOWNTO 0) := (OTHERS => '0');
    SIGNAL denominator : unsigned(DEN_LEN - 1 DOWNTO 0) := (OTHERS => '0');
    SIGNAL numerator_m_red, numerator_m_red_s,
    numerator_m_red_ss, numerator_m_red_sss :
    signed(NUM_M_LEN - SHIFT_NUM_M - 1 DOWNTO 0) := (OTHERS => '0');
    SIGNAL numerator_b_red, numerator_b_red_s,
    numerator_b_red_ss, numerator_b_red_sss :
    signed(NUM_B_LEN - SHIFT_NUM_B - 1 DOWNTO 0) := (OTHERS => '0');
    SIGNAL denominator_red : unsigned(DEN_LEN - SHIFT_DEN - 1 DOWNTO 0)
    := (OTHERS => '0');
    SIGNAL reciprocal_addr : STD_LOGIC_VECTOR(DEN_LEN - SHIFT_DEN - 1 DOWNTO 0)
    := (OTHERS => '0');
    SIGNAL reciprocal_den, reciprocal_den_s : signed(RECIPROCAL_LEN DOWNTO 0)
    := (OTHERS => '0');
    TYPE t_reciprocalROM IS ARRAY (NATURAL RANGE <>) OF
    STD_LOGIC_VECTOR(RECIPROCAL_LEN - 1 DOWNTO 0);
    
    FUNCTION reciprocalROM RETURN t_reciprocalROM IS
        VARIABLE temp : t_reciprocalROM(2 ** (DEN_LEN - SHIFT_DEN) - 1 DOWNTO 0)
        := (OTHERS => (OTHERS => '0'));
    BEGIN
        FOR k IN 2 ** 16 - 1 DOWNTO 0 LOOP
            temp(k) := STD_LOGIC_VECTOR(to_unsigned(
            INTEGER(floor(
            ((2.0 ** RECIPROCAL_LEN)) / (real(k) + 0.5)
            )), RECIPROCAL_LEN));
        END LOOP;
        RETURN temp;
    END FUNCTION;

    -- Fit result widths
    CONSTANT MFIT_FULL_LEN : INTEGER := NUM_M_LEN - SHIFT_NUM_M + RECIPROCAL_LEN + 1;
    CONSTANT BFIT_FULL_LEN : INTEGER := NUM_B_LEN - SHIFT_NUM_B + RECIPROCAL_LEN + 1;

    -- Fit result signals
    SIGNAL mfit_full, mfit_full_s : signed(MFIT_FULL_LEN - 1 DOWNTO 0)
    := (OTHERS => '0');
    SIGNAL bfit_full, bfit_full_s : signed(BFIT_FULL_LEN - 1 DOWNTO 0)
    := (OTHERS => '0');

    -- DSP valid signals
    SIGNAL dsp_start, dsp_start_s : STD_LOGIC := '0';
    SIGNAL counter : INTEGER := 0;
    SIGNAL startCounter : STD_LOGIC := '0';
    SIGNAL dv0, dv1, dv2, dv3, dv4, dv5, dv6, dv7, dv8, dv9 : STD_LOGIC := '0';
    SIGNAL event_valid : STD_LOGIC := '0';

BEGIN

    hit1 <= structify(i_hit1);
    hit2 <= structify(i_hit2);

    Fitter : PROCESS (clk)
    BEGIN
        IF rising_edge(clk) THEN
            hit1_s <= hit1;
            hit2_s <= hit2;
            dsp_start <= '0';
            finalhit <= hit1.valid OR hit2.valid;

            IF hit1.valid = '1' OR hit2.valid = '1' THEN
                event_valid <= '1';
            END IF;

            IF (hit1_s.valid = '1' OR hit2_s.valid = '1')
                AND event_valid = '1' THEN
                dsp_SumXY <= dsp_SumXY + hit1_s.x * hit1_s.y +
                    hit2_s.x * hit2_s.y;
                dsp_SumY <= dsp_SumY + hit1_s.y + hit2_s.y;
                dsp_SumX <= dsp_SumX + hit1_s.x + hit2_s.x;
                dsp_SumX2 <= dsp_SumX2 + hit1_s.x * hit1_s.x + hit2_s.x * hit2_s.x;
                dsp_nhits <= dsp_nhits + stdlogic_integer(hit1_s.valid) +
                    stdlogic_integer(hit2_s.valid);
                startCounter <= '1';
            END IF;

            IF startCounter = '1' THEN
                counter <= counter + 1;
                IF counter = 8 THEN
                    dsp_start <= '1';
                    startCounter <= '0';
                    counter <= 0;
                END IF;
            END IF;

            -- Clock 0
            --dv0 <= dsp_start;
            dsp_NSumXY <= dsp_nhits * dsp_SumXY;
            dsp_SumYSumX <= dsp_SumY * dsp_SumX;
            dsp_SumYSumX2 <= dsp_SumY * dsp_SumX2;
            dsp_SumXYSumX <= dsp_SumXY * dsp_SumX;
            dsp_NSumX2 <= dsp_nhits * dsp_SumX2;
            dsp_SumXSumX <= dsp_SumX * dsp_SumX;
            --end if;

            -- Clock 1
            dv1 <= dsp_start;
            dsp_NSumXY_s <= dsp_NSumXY;
            dsp_SumYSumX_s <= dsp_SumYSumX;
            dsp_SumYSumX2_s <= dsp_SumYSumX2;
            dsp_SumXYSumX_s <= dsp_SumXYSumX;
            dsp_NSumX2_s <= dsp_NSumX2;
            dsp_SumXSumX_s <= dsp_SumXSumX;

            -- Clock 2
            dv2 <= dv1;
            dsp_NSumXY_ss <= dsp_NSumXY_s;
            dsp_SumYSumX_ss <= dsp_SumYSumX_s;
            dsp_SumYSumX2_ss <= dsp_SumYSumX2_s;
            dsp_SumXYSumX_ss <= dsp_SumXYSumX_s;
            dsp_NSumX2_ss <= dsp_NSumX2_s;
            dsp_SumXSumX_ss <= dsp_SumXSumX_s;

            -- Clock 3
            dv3 <= dv2;
            numerator_m <= signed('0' & dsp_NSumXY_ss) - signed('0' & dsp_SumYSumX_ss);
            numerator_b <= signed('0' & dsp_SumYSumX2_ss) - signed('0' & dsp_SumXYSumX_ss);
            denominator <= dsp_NSumX2_ss - dsp_SumXSumX_ss;

            -- Clock 4
            dv4 <= dv3;
            numerator_m_red <= resize(shift_right(numerator_m, SHIFT_NUM_M),
                NUM_M_LEN - SHIFT_NUM_M);
            numerator_b_red <= resize(shift_right(numerator_b, SHIFT_NUM_B),
                NUM_B_LEN - SHIFT_NUM_B);
            denominator_red <= resize(shift_right(denominator, SHIFT_DEN),
                DEN_LEN - SHIFT_DEN);
            -- Clock 5
            dv5 <= dv4;
            reciprocal_addr <= STD_LOGIC_VECTOR(denominator_red);
            numerator_b_red_s <= numerator_b_red;
            numerator_m_red_s <= numerator_m_red;

            -- Clock 6
            dv6 <= dv5;
            reciprocal_den <= signed('0' &
                reciprocalROM(to_integer(unsigned(reciprocal_addr))));
            numerator_b_red_ss <= numerator_b_red_s;
            numerator_m_red_ss <= numerator_m_red_s;

            --Clock 7
            dv7 <= dv6;
            numerator_b_red_sss <= numerator_b_red_ss;
            numerator_m_red_sss <= numerator_m_red_ss;
            reciprocal_den_s <= reciprocal_den;

            --Clock 8
            dv8 <= dv7;
            mfit_full <= numerator_m_red_sss * signed(reciprocal_den_s);
            bfit_full <= numerator_b_red_sss * signed(reciprocal_den_s);

            --Clock 9
            dv9 <= dv8;
            mfit_full_s <= mfit_full;
            bfit_full_s <= bfit_full;

            o_fit_valid <= dv9;
            o_mfit <=
                resize(
                shift_right(
                mfit_full_s,
                RECIPROCAL_LEN + SHIFT_DEN - SHIFT_NUM_M - MFIT_MULTI_LEN
                ),
                CSF_SEG_M_LEN);

            o_bfit <=
                resize(
                shift_right(
                bfit_full_s,
                RECIPROCAL_LEN + SHIFT_DEN - SHIFT_NUM_B - B_OVER_Z_MULTI_LEN
                ),
                CSF_SEG_B_LEN);
            o_nhits <= dsp_nhits;

            -- Reset
            IF dv9 = '1' THEN
                dsp_SumXY <= (OTHERS => '0');
                dsp_SumY <= (OTHERS => '0');
                dsp_SumX <= (OTHERS => '0');
                dsp_SumX2 <= (OTHERS => '0');
                dsp_nhits <= (OTHERS => '0');
                event_valid <= '0';
            END IF;

        END IF;
    END PROCESS; -- Fitter
END Behavioral;
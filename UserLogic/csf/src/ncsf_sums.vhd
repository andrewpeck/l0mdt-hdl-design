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

ENTITY ncsf_sums IS
    PORT (
        clk : IN STD_LOGIC;
        i_rst : IN STD_LOGIC;
        i_hit : IN csf_hit_vt;
        i_fit_en : in STD_LOGIC;
        o_sums : OUT csf_sums_vt
    );
END ncsf_sums;

ARCHITECTURE Behavioral OF ncsf_sums IS
    -- Hits signals shifted
    SIGNAL hit : csf_hit_rt;

    -- Summation signals
    SIGNAL dsp_SumXY, dsp_SumXY_s : unsigned(SUM_XY_LEN - 1 DOWNTO 0)
    := (OTHERS => '0');
    SIGNAL dsp_SumY, dsp_SumY_s : unsigned(SUM_Y_LEN - 1 DOWNTO 0)
    := (OTHERS => '0');
    SIGNAL dsp_SumX, dsp_SumX_s : unsigned(SUM_X_LEN - 1 DOWNTO 0)
    := (OTHERS => '0');
    SIGNAL dsp_SumX2, dsp_SumX2_s : unsigned(SUM_X2_LEN - 1 DOWNTO 0)
    := (OTHERS => '0');
    SIGNAL dsp_nhits, dsp_nhits_s : unsigned(CSF_MAXHITS_SEG_LEN - 1 DOWNTO 0)
    := (OTHERS => '0');
    SIGNAL sums : csf_sums_rt;


BEGIN

    hit <= convert(i_hit,hit);
    o_sums <= convert(sums,o_sums);

    Summing : PROCESS (clk)
    BEGIN
        IF rising_edge(clk) THEN
            sums <= zero(sums);

            IF (hit.valid = '1')
                THEN
                dsp_SumXY <= dsp_SumXY + hit.x * hit.y;
                dsp_SumY <= dsp_SumY + hit.y;
                dsp_SumX <= dsp_SumX + hit.x;
                dsp_SumX2 <= dsp_SumX2 + hit.x * hit.x;
                dsp_nhits <= dsp_nhits + 1;
            END IF;

            IF i_fit_en = '1' THEN
                sums.valid <= '1';
                sums.x <= dsp_SumX;
                sums.xy <= dsp_SumXY;
                sums.y <= dsp_SumY;
                sums.x2 <= dsp_SumX2;
                sums.n <= dsp_nhits;
                dsp_SumXY <= (others => '0');
                dsp_SumX <= (others => '0');
                dsp_sumY <= (others => '0');
                dsp_SumX2 <= (others => '0');
                dsp_nhits <= (others => '0');
            END IF;

            IF i_rst = '1' THEN
                dsp_SumXY <= (others => '0');
                dsp_SumX <= (others => '0');
                dsp_sumY <= (others => '0');
                dsp_SumX2 <= (others => '0');
                dsp_nhits <= (others => '0');
            END IF;

        END IF;
    END PROCESS; -- Summing
END Behavioral;
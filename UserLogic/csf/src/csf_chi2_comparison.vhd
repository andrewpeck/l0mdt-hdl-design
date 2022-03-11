----------------------------------------------------------------------------------
-- Company: Max-Planck-Institut fuer Physik - Munich
-- Engineer: Davide Cieri - davide.cieri@cern.ch
--
-- Create Date: 18/10/2019 11:31:09 AM
-- Design Name: Compact Segment Finder
-- Module Name: csf_chi2_comparison - Behavioral
-- Project Name:
-- Target Devices:
-- Tool Versions: 2018.3
-- Description: Compare the chi2 values of 4 segments and returns the segment with the lowest
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

-- library IEEE, csf_lib;
-- use IEEE.STD_LOGIC_1164.ALL;
-- use IEEE.NUMERIC_STD.ALL;
-- use ieee.math_real.all;
-- use csf_lib.csf_pkg.all;
-- use csf_lib.custom_types_csf_pkg.all;
ENTITY csf_chi2_comparison IS
    PORT (
        clk : IN STD_LOGIC;
        i_segments : IN csf_locseg_avt(NUM_FITTERS - 1 DOWNTO 0);
        o_segment : OUT csf_locseg_vt
    );
END csf_chi2_comparison;

ARCHITECTURE Behavioral OF csf_chi2_comparison IS
    SIGNAL segments : csf_locseg_art(NUM_FITTERS - 1 DOWNTO 0);
    -- Signal to store best local segments
    SIGNAL segment_0, segment_1, output_segment : csf_locseg_rt;
    -- Signal Data Valid signals
    SIGNAL dv0, dv1 : STD_LOGIC := '0';
BEGIN
    SEG_GEN : FOR x IN NUM_FITTERS - 1 DOWNTO 0 GENERATE
        segments(x) <= structify(i_segments(x),segments(x));
    END GENERATE SEG_GEN;

    o_segment <= vectorify(output_segment,o_segment);

    CHI2_COMPARE : PROCESS (clk)
    BEGIN
        IF rising_edge(clk) THEN
            -- clock 0
            IF segments(0).valid = '1' AND segments(1).valid = '1' THEN
                dv0 <= '1';
                IF segments(0).chi2 <= segments(1).chi2 THEN
                    segment_0 <= segments(0);
                ELSE
                    segment_0 <= segments(1);
                END IF;
            ELSIF segments(0).valid = '1' THEN
                dv0 <= '1';
                segment_0 <= segments(0);
            ELSIF segments(1).valid = '1' THEN
                dv0 <= '1';
                segment_0 <= segments(1);
            ELSE
                dv0 <= '0';
                segment_0 <= nullify(segment_0);
            END IF;

            IF segments(2).valid = '1' AND segments(3).valid = '1' THEN
                dv1 <= '1';
                IF segments(2).chi2 <= segments(3).chi2 THEN
                    segment_1 <= segments(2);
                ELSE
                    segment_1 <= segments(3);
                END IF;
            ELSIF segments(2).valid = '1' THEN
                dv1 <= '1';
                segment_1 <= segments(2);
            ELSIF segments(3).valid = '1' THEN
                dv1 <= '1';
                segment_1 <= segments(3);
            ELSE
                dv1 <= '0';
                segment_1 <= nullify(segment_1);
            END IF;

            -- clock 1
            IF dv0 = '1' AND dv1 = '1' THEN
                IF segment_0.chi2 <= segment_1.chi2 THEN
                    output_segment <= segment_0;
                ELSE
                    output_segment <= segment_1;
                END IF;
            ELSIF dv0 = '1' THEN
                output_segment <= segment_0;
            ELSIF dv1 = '1' THEN
                output_segment <= segment_1;
            ELSE
                output_segment <= nullify(output_segment);
            END IF;
        END IF;
    END PROCESS;

END Behavioral;
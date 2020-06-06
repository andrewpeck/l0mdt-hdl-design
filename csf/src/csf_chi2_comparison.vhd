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

-- library IEEE, csf_lib;
-- use IEEE.STD_LOGIC_1164.ALL;
-- use IEEE.NUMERIC_STD.ALL;
-- use ieee.math_real.all;
-- use csf_lib.csf_pkg.all;
-- use csf_lib.custom_types_csf_pkg.all;


entity csf_chi2_comparison is
  Port (
    clk         : in std_logic;
    i_segments  : in csf_locseg_a_avt(NUM_FITTERS-1 downto 0);
    o_segment   : out csf_locseg_rvt
  );
end csf_chi2_comparison;

architecture Behavioral of csf_chi2_comparison is
    signal segments : csf_locseg_a_at(NUM_FITTERS-1 downto 0);
    -- Signal to store best local segments
    signal segment_0, segment_1, output_segment: csf_locseg_rt;
    -- Signal Data Valid signals
    signal dv0, dv1 : std_logic := '0';
begin
    SEG_GEN : for x in NUM_FITTERS-1 downto 0 generate
        segments(x) <= structify(i_segments(x));
    end generate SEG_GEN;

    o_segment <= vectorify(output_segment);

    CHI2_COMPARE : process(clk)
    begin
        if rising_edge(clk) then
            -- clock 0
            if segments(0).valid = '1' and segments(1).valid = '1' then
                dv0 <= '1';
                if segments(0).chi2 <= segments(1).chi2 then
                    segment_0 <= segments(0);
                else
                    segment_0 <= segments(1);
                end if;
            elsif segments(0).valid = '1' then
                dv0 <= '1';
                segment_0 <= segments(0);
            elsif segments(1).valid = '1' then
                dv0 <= '1';
                segment_0 <= segments(1);
            else
                dv0 <= '0';
                segment_0 <= nullify(segment_0);
            end if;

            if segments(2).valid = '1' and segments(3).valid = '1' then
                dv1 <= '1';
                if segments(2).chi2 <= segments(3).chi2 then
                    segment_1 <= segments(2);
                else
                    segment_1 <= segments(3);
                end if;
            elsif segments(2).valid = '1' then
                dv1 <= '1';
                segment_1 <= segments(2);
            elsif segments(3).valid = '1' then
                dv1 <= '1';
                segment_1 <= segments(3);
            else
                dv1 <= '0';
                segment_1 <= nullify(segment_1);
            end if;

            -- clock 1
            if dv0 = '1' and dv1 = '1' then
                if segment_0.chi2 <= segment_1.chi2 then
                    output_segment <= segment_0;
                else
                    output_segment <= segment_1;
                end if;
            elsif dv0 = '1' then
                output_segment <= segment_0;
            elsif dv1 = '1' then
                output_segment <= segment_1;
            else
                output_segment <= nullify(output_segment);
            end if;
        end if;
    end process;

end Behavioral;

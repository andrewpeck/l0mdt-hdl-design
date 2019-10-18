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


library IEEE, csf_lib;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use ieee.math_real.all;
use csf_lib.csf_pkg.all;


entity csf_chi2_comparison is
  Generic(
    DataWidth : integer := 64
  );
  Port ( 
    clk         : in std_logic;
    i_segments  : in t_locsegs(num_fitters-1 downto 0);
    o_segment   : out t_locseg
  );
end csf_chi2_comparison;

architecture Behavioral of csf_chi2_comparison is
    -- Signal to store best local segments
    signal segment_0, segment_1 : t_locseg := null_locseg;
    -- Signal Data Valid signals
    signal dv0, dv1 : std_logic := '0';
begin

	Chi2_Compare : process(clk)
    begin
        if rising_edge(clk) then
            -- clock 0
            if i_segments(0).valid = '1' and i_segments(1).valid = '1' then
                dv0 <= '1';
                if i_segments(0).chi2 <= i_segments(1).chi2 then
                    segment_0 <= i_segments(0);
                else 
                    segment_0 <= i_segments(1);
                end if;
            elsif i_segments(0).valid = '1' then
                dv0 <= '1';
                segment_0 <= i_segments(0);
            elsif i_segments(1).valid = '1' then
                dv0 <= '1';
                segment_0 <= i_segments(1);
            else
                dv0 <= '0';
                segment_0 <= null_locseg;
            end if;

            if i_segments(2).valid = '1' and i_segments(3).valid = '1' then
                dv1 <= '1';
                if i_segments(2).chi2 <= i_segments(3).chi2 then
                    segment_1 <= i_segments(2);
                else 
                    segment_1 <= i_segments(3);
                end if;
            elsif i_segments(2).valid = '1' then
                dv1 <= '1';
                segment_1 <= i_segments(2);
            elsif i_segments(3).valid = '1' then
                dv1 <= '1';
                segment_1 <= i_segments(3);
            else
                dv1 <= '0';
                segment_1 <= null_locseg;
            end if;

            -- clock 1
            if dv0 = '1' and dv1 = '1' then
                if segment_0.chi2 <= segment_1.chi2 then
                    o_segment <= segment_0;
                else 
                    o_segment <= segment_1;
                end if;
            elsif dv0 = '1' then
                o_segment <= segment_0;
            elsif dv1 = '1' then
                o_segment <= segment_1;
            else
                o_segment <= null_locseg;
            end if;
        end if;
    end process;

end Behavioral;

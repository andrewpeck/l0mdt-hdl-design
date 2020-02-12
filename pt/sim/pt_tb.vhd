----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/11/2019 01:23:38 PM
-- Design Name: 
-- Module Name: pt_tb - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
library pt_lib;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use pt_lib.pt_pkg.all;


entity pt_tb is
--  Port ( );
end pt_tb;

architecture Behavioral of pt_tb is
    signal clk : std_logic := '0';
    signal seg0, seg1, seg2 : t_globalseg := null_globalseg;

    signal pt : unsigned(pt_width-1 downto 0) := (others => '0');
    signal pt_valid, rst : std_logic := '0';
    constant CLK_period : time := 4.0 ns;

begin

    top_pt : entity work.top_pt
    Port map(
        clk  => clk,
        i_segment_BI => seg0,
        i_segment_BM => seg1,
        i_segment_BO => seg2,
        i_rst        => rst,
        o_pt_online  => pt,
        o_pt_valid   => pt_valid
    );

    CLK_process :process
    begin
        CLK <= '0';
        wait for CLK_period/2;
        CLK <= '1';
        wait for CLK_period/2;
    end process;

    --    Z[0] 38629 Z[1] 55024 Z[2] 69986
    --    R[0] 315875 R[1] 455239 R[2] 615130

    Pulse : process
    begin
        wait for clk_period*5;
        seg0 <= ('1', to_signed(-73748, z_glob_width), to_unsigned(72558, r_glob_width), (others => '0'), (others => '0'), (others => '0'), to_unsigned(2,chamber_id_width));
        seg1 <= ('1', to_signed(-129356, z_glob_width), to_unsigned(127829, r_glob_width), (others => '0'), (others => '0'), (others => '0'), to_unsigned(2,chamber_id_width));
        seg2 <= ('1', to_signed(-167976, z_glob_width), to_unsigned(166870, r_glob_width), (others => '0'), (others => '0'), (others => '0'), to_unsigned(2,chamber_id_width));
        wait for clk_period;
        seg0 <= null_globalseg;
        seg1 <= null_globalseg;
        seg2 <= null_globalseg;
        
        wait;

    end process;


end Behavioral;

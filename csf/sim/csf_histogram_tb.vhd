----------------------------------------------------------------------------------
-- Company: Max-Planck-Institute for Physics, Munich
-- Engineer: Davide Cieri
-- 
-- Create Date: 02/11/2019 01:23:38 PM
-- Design Name: CSF
-- Module Name: csf_histogram_tb - Behavioral
-- Project Name: MDTTP
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
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use work.csf_pkg.all;


entity csf_histogram_tb is
--  Port ( );
end csf_histogram_tb;

architecture Behavioral of csf_histogram_tb is
    signal clk          : std_logic := '0';
    signal mdt_hit      : t_mdt_hit := null_mdt_hit;
    signal header_valid : std_logic := '0';
    signal seed         : t_seed := null_seed;
    signal eof          :  std_logic := '0';
    signal outputHit1   : t_histo_hit := null_histo_hit;
    signal outputHit2   : t_histo_hit := null_histo_hit;
    constant CLK_period : time := 4.0 ns;

begin

    csf_histogram : entity work.csf_histogram
    Port map(
        clk         => clk,
        i_mdthit    => mdt_hit,
        i_seed      => seed,
        i_eof       => eof,
        o_histo_hit0  => outputHit1,
        o_histo_hit1  => outputHit2
    );

    CLK_process :process
    begin
        CLK <= '0';
        wait for CLK_period/2;
        CLK <= '1';
        wait for CLK_period/2;
    end process;

    Pulse : process
    begin
        wait for clk_period*5;
        seed.valid <= '1';
        seed.mbar <= to_signed(1145,mbar_width);
        wait for clk_period;
        seed <= null_seed;
        wait for clk_period*5;
        mdt_hit <= ('1', to_signed(-959, z_width), to_unsigned(880, x_width), '0', to_unsigned(91, r_width), (others => '0'));
        wait for clk_period;
        mdt_hit <= ('1', to_signed(-719, z_width), to_unsigned(1296, x_width), '0', to_unsigned(209, r_width), (others => '0'));
        wait for clk_period;
        mdt_hit <= ('1', to_signed(-238, z_width), to_unsigned(1296, x_width), '0', to_unsigned(404, r_width), (others => '0'));
        wait for clk_period;
        mdt_hit <= ('1', to_signed(-479, z_width), to_unsigned(1712, x_width), '0', to_unsigned(342, r_width), (others => '0'));
        wait for clk_period;
        mdt_hit <= ('1', to_signed(2, z_width), to_unsigned(1712, x_width), '0', to_unsigned(141, r_width), (others => '0'));
        wait for clk_period;
        mdt_hit <= ('1', to_signed(242, z_width), to_unsigned(2128, x_width), '0', to_unsigned(168, r_width), (others => '0'));
        wait for clk_period;
        mdt_hit <= null_mdt_hit;
        wait for clk_period*5;
        eof <= '1';
        wait for clk_period;
        eof <= '0';
        wait;

    end process;


end Behavioral;

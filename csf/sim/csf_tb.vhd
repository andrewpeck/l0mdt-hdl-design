----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/11/2019 01:23:38 PM
-- Design Name: 
-- Module Name: csf_histogram_tb - Behavioral
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


library IEEE, csf_lib, pt_lib;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use csf_lib.csf_pkg.all;
use pt_lib.pt_pkg.all;

entity csf_tb is
--  Port ( );
end csf_tb;

architecture Behavioral of csf_tb is
    signal clk : std_logic := '0';
    signal seed : t_seed := null_seed;
    signal mdt_hit : t_mdt_hit := null_mdt_hit;
    signal seg : t_globalseg := null_globalseg;
    constant clk_period : time := 4.0 ns;
    signal eof          :  std_logic := '0';
    signal rst : std_logic := '0';
begin

    csftop : entity work.top_csf
    Port map(
        clk       => clk,
        i_seed    => seed,
        i_mdt_hit => mdt_hit,
        i_eof     => eof,
        o_seg     => seg,
        i_rst     => rst
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

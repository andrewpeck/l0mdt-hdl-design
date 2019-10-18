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


library IEEE, csf_lib;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use csf_lib.csf_pkg.all;

entity csf_tb is
--  Port ( );
end csf_tb;

architecture Behavioral of csf_tb is
	signal clk : std_logic := '0';
    signal seed : t_seed := null_seed;
    signal hit : t_mdt_hit := null_mdt_hit;
    signal seg : t_locseg := null_locseg;
    constant clk_period : time := 4.0 ns;

begin

	csf_top : entity work.csf
	Port map(
		clk       => clk,
		i_seed    => seed,
        i_mdt_hit => hit,
        o_seg     => seg
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
        seed <= ('1', to_unsigned(1112, mbar_width));
        wait for clk_period;
        seed <= null_seed;
        hit <= ('1', to_signed(3737, z_width), to_unsigned(8514, x_width), '0', to_unsigned(745, r_width), '0' );
        wait for clk_period;
        hit <= ('1', to_signed(5659, z_width), to_unsigned(8514, x_width), '0', to_unsigned(560, r_width), '0' );
        wait for clk_period;
        hit <= ('1', to_signed(7581, z_width), to_unsigned(10852, x_width), '1', to_unsigned(137, r_width), '0' );
        wait for clk_period;
        hit <= ('1', to_signed(8543, z_width), to_unsigned(12517, x_width), '1', to_unsigned(455, r_width), '0' );
        wait for clk_period;
        hit <= ('1', to_signed(10465, z_width), to_unsigned(12517, x_width), '1', to_unsigned(859, r_width), '0' );
        wait for clk_period;
        hit <= ('1', to_signed(11426, z_width), to_unsigned(14182, x_width), '1', to_unsigned(271, r_width), '0' );
        wait for clk_period;
        hit <= ('1', to_signed(12387, z_width), to_unsigned(15846, x_width), '1', to_unsigned(301, r_width), '0' );
        wait for clk_period;
        hit <= ('1', to_signed(-359, z_width), to_unsigned(3520, x_width), '0', to_unsigned(188, r_width), '0' );
        wait for clk_period;
        hit <= ('1', to_signed(602, z_width), to_unsigned(5185, x_width), '0', to_unsigned(410, r_width), '1' );
        wait for clk_period;
        hit <= null_mdt_hit;
    	wait;

    end process;


end Behavioral;

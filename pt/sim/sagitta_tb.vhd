----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/11/2019 01:23:38 PM
-- Design Name: 
-- Module Name: sagitta_tb - Behavioral
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
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;
use work.csf_pkg.all;
use work.pt_pkg.all;


entity sagitta_tb is
--  Port ( );
end sagitta_tb;

architecture Behavioral of sagitta_tb is
    signal clk              : std_logic                        := '0';
    signal seg0, seg1, seg2 : t_globalseg                      := null_globalseg;
    signal start            : std_logic                        := '0';
    signal sagitta          : signed(sagitta_width-1 downto 0) := (others => '0');
    signal dv_sagitta       : std_logic                        := '0';

begin

    sagitta_calculator : entity work.sagitta_calculator
        port map(
            clk        => clk,
            start      => start,
            seg0       => seg0,
            seg1       => seg1,
            seg2       => seg2,
            sagitta    => sagitta,
            dv_sagitta => dv_sagitta
            );

    CLK_process : process
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
        start <= '1';
        seg0  <= ('1', to_signed(38629, z_glob_width), to_unsigned(315875, r_glob_width), (others => '0'), (others => '0'), (others => '0'));
        seg1  <= ('1', to_signed(55024, z_glob_width), to_unsigned(455239, r_glob_width), (others => '0'), (others => '0'), (others => '0'));
        seg2  <= ('1', to_signed(69986, z_glob_width), to_unsigned(615130, r_glob_width), (others => '0'), (others => '0'), (others => '0'));
        wait for clk_period;
        start <= '0';
        seg0  <= null_globalseg;
        seg1  <= null_globalseg;
        seg2  <= null_globalseg;

        wait;

    end process;


end Behavioral;

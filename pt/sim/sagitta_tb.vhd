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


library IEEE, pt_lib;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use pt_lib.pt_pkg.all;


entity sagitta_tb is
--  Port ( );
end sagitta_tb;

architecture Behavioral of sagitta_tb is
    signal clk : std_logic := '0';
    signal seg0, seg1, seg2 : t_globalseg := null_globalseg;
    signal start : std_logic := '0';
    signal inv_sagitta   : unsigned(inv_sagitta_width-1 downto 0) := (others => '0');
    signal dv_sagitta      :  std_logic := '0';
    constant CLK_period : time := 4.0 ns;
begin

    sagitta_calculator : entity pt_lib.sagitta_calculator
    Port map(
        clk  => clk,
        seg0  => seg0,
        seg1      => seg1,
        seg2       => seg2,
        inv_sagitta  => inv_sagitta,
        dv_sagitta  => dv_sagitta
    );

    CLK_process :process
    begin
        CLK <= '0';
        wait for CLK_period/2;
        CLK <= '1';
        wait for CLK_period/2;
    end process;

    --Z[0] -294992 Z[1] -517424 Z[2] -671907
    --R[0] 290236 R[1] 511322 R[2] 667484

    Pulse : process
    begin
        wait for clk_period*5;
        start <= '1';
        seg0 <= ('1', to_signed(-73748, z_glob_width), to_unsigned(72558, r_glob_width), (others => '0'), (others => '0'), (others => '0'));
        seg1 <= ('1', to_signed(-129356, z_glob_width), to_unsigned(127829, r_glob_width), (others => '0'), (others => '0'), (others => '0'));
        seg2 <= ('1', to_signed(-167976, z_glob_width), to_unsigned(166870, r_glob_width), (others => '0'), (others => '0'), (others => '0'));
        wait for clk_period;
        start <= '0';
        seg0 <= null_globalseg;
        seg1 <= null_globalseg;
        seg2 <= null_globalseg;
        
        wait;

    end process;


end Behavioral;

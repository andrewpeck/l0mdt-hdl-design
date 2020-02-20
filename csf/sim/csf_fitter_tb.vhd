----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/13/2019 10:45:43 AM
-- Design Name: 
-- Module Name: csf_fitter_tb - Behavioral
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
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use work.csf_pkg.all;


entity csf_fitter_tb is
--  Port ( );
end csf_fitter_tb;

architecture Behavioral of csf_fitter_tb is
    signal clk : std_logic := '0';
    signal hit1, hit2 : t_histo_hit := null_histo_hit;
    signal mfit : signed(mfit_width-1 downto 0) := (others => '0');
    signal bfit : signed(bfit_width-1 downto 0) := (others => '0');
    signal fit_valid : std_logic := '0';
    signal nhits : unsigned(num_hits_width-1 downto 0) := (others => '0');
    signal CLK_period : time := 2.77777 ns;
begin

    csf_fitter : entity work.csf_fitter
    Port map( 
        clk         => clk      ,
        i_hit1      => hit1     ,
        i_hit2      => hit2     ,
        o_mfit      => mfit      ,
        o_bfit      => bfit      ,
        o_fit_valid => fit_valid,
        o_nhits     => nhits
    );

    CLK_process :process
    begin
        CLK <= '0';
        wait for CLK_period/2;
        CLK <= '1';
        wait for CLK_period/2;
    end process;

    --hit z 1059 x 1992
    --hit z 1321 x 2230
    --hit z -121 x 914
    --hit z 219 x 1221
    --hit z 1872 x 2738
    --hit z 2212 x 3046
    --hit z 2472 x 3286
    --hit z 2811 x 3594
    --hit z 3148 x 3907
    --Sum_zx 47600413 Sum_z 14993 Sum_x 22928 Sum_x2 67021242
    --full num_m 84644213 num_b -8.653278796e+10 den 77497994
    --shift num_m 2583.136383 num_b-322.3597555 den 73.90784645
    -- digi rec 57065
    --digitised m 1.098144531 int 4498
    --digitised b -70.3125 int -1125


    Pulse : process
    begin
        wait for clk_period*5;
        hit1 <= ('1', to_signed(1059, z_width), to_unsigned(1992, x_width));
        hit2 <= ('1', to_signed(1872, z_width), to_unsigned(2738, x_width));
        wait for clk_period;
        hit1 <= ('1', to_signed(1321, z_width), to_unsigned(2230, x_width));
        hit2 <= ('1', to_signed(2212, z_width), to_unsigned(3046, x_width));
        wait for clk_period;
        hit1 <= ('1', to_signed(-121, z_width), to_unsigned(914, x_width));
        hit2 <= ('1', to_signed(2472, z_width), to_unsigned(3286, x_width));
        wait for clk_period;
        hit1 <= ('1', to_signed(219, z_width), to_unsigned(1221, x_width));
        hit2 <= ('1', to_signed(2811, z_width), to_unsigned(3594, x_width));
        wait for clk_period;
        hit1 <= null_histo_hit;
        hit2 <= ('1', to_signed(3148, z_width), to_unsigned(3907, x_width));
        wait for clk_period;
        hit2 <= null_histo_hit;

        wait;

    end process;

end Behavioral;

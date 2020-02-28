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

    --layerId 3 driftRadius 372 bplus 29 bminus 12 x 2128 z 934 isOnSegment 1
    --layerId 3 driftRadius 280 bplus 42 bminus 29 x 2128 z 1415 isOnSegment 1
    --layerId 4 driftRadius 69 bplus 32 bminus 29 x 2713 z 1895 isOnSegment 1
    --layerId 5 driftRadius 227 bplus 29 bminus 19 x 3129 z 2136 isOnSegment 1
    --
    --
    --layerId 5 driftRadius 429 bplus 49 bminus 29 x 3129 z 2616 isOnSegment 1
    --layerId 6 driftRadius 135 bplus 36 bminus 29 x 3545 z 2856 isOnSegment 1
    --
    --layerId 7 driftRadius 151 bplus 29 bminus 22 x 3962 z 3097 isOnSegment 1
    --layerId 0 driftRadius 94 bplus 33 bminus 29 x 880 z -90 isOnSegment 1
    --layerId 1 driftRadius 205 bplus 29 bminus 19 x 1296 z 150 isOnSegment 1


    Pulse : process
    begin
        wait for clk_period*5;
        seed.valid <= '1';
        seed.mbar <= to_signed(1112,mbar_width);
        seed.z    <= to_signed(-76906, z_roi_width);
        seed.r    <= to_unsigned(71019, r_roi_width);
        
        wait for clk_period;
        seed <= null_seed;
        wait for clk_period*5;

        mdt_hit <= ('1', to_signed(934, z_width), to_unsigned(2128, x_width), '0', to_unsigned(372, r_width), (others => '0'));
        wait for clk_period;
        mdt_hit <= ('1', to_signed(1415, z_width), to_unsigned(2128, x_width), '0', to_unsigned(280, r_width), (others => '0'));
        wait for clk_period;
        mdt_hit <= ('1', to_signed(1895, z_width), to_unsigned(2713, x_width), '1', to_unsigned(69, r_width), (others => '0'));
        wait for clk_period;
        mdt_hit <= ('1', to_signed(2136, z_width), to_unsigned(3129, x_width), '1', to_unsigned(227, r_width), (others => '0'));
        wait for clk_period;
        mdt_hit <= ('1', to_signed(2616, z_width), to_unsigned(3129, x_width), '1', to_unsigned(429, r_width), (others => '0'));
        wait for clk_period;
        mdt_hit <= ('1', to_signed(2856, z_width), to_unsigned(3545, x_width), '1', to_unsigned(135, r_width), (others => '0'));
        wait for clk_period;
        mdt_hit <= ('1', to_signed(3097, z_width), to_unsigned(3962, x_width), '1' , to_unsigned(151, r_width), (others => '0'));
        wait for clk_period;
        mdt_hit <= ('1', to_signed(-90, z_width), to_unsigned(880, x_width), '0', to_unsigned(94, r_width), (others => '0'));
        wait for clk_period;
        mdt_hit <= ('1', to_signed(150, z_width), to_unsigned(1296, x_width), '0', to_unsigned(205, r_width), (others => '0'));

        wait for clk_period;
        mdt_hit <= null_mdt_hit;
        wait for clk_period*5;
        eof <= '1';
        wait for clk_period;
        eof <= '0';
        wait;

    end process;


end Behavioral;

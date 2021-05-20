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
LIBRARY IEEE, csf_lib, pt_lib;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;
USE csf_lib.csf_pkg.ALL;
USE pt_lib.pt_pkg.ALL;

ENTITY csf_tb IS
    --  Port ( );
END csf_tb;

ARCHITECTURE Behavioral OF csf_tb IS
    SIGNAL clk : STD_LOGIC := '0';
    SIGNAL seed : t_seed := null_seed;
    SIGNAL mdt_hit : t_mdt_hit := null_mdt_hit;
    SIGNAL seg : t_globalseg := null_globalseg;
    CONSTANT clk_period : TIME := 4.0 ns;
    SIGNAL eof : STD_LOGIC := '0';
    SIGNAL rst : STD_LOGIC := '0';
BEGIN

    csftop : ENTITY work.top_csf
        PORT MAP(
            clk => clk,
            i_seed => seed,
            i_mdt_hit => mdt_hit,
            i_eof => eof,
            o_seg => seg,
            i_rst => rst
        );

    CLK_process : PROCESS
    BEGIN
        CLK <= '0';
        WAIT FOR CLK_period/2;
        CLK <= '1';
        WAIT FOR CLK_period/2;
    END PROCESS;

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
    Pulse : PROCESS
    BEGIN
        WAIT FOR clk_period * 5;
        seed.valid <= '1';
        seed.mbar <= to_signed(1112, mbar_width);
        seed.z <= to_signed(-76906, z_roi_width);
        seed.r <= to_unsigned(71019, r_roi_width);

        WAIT FOR clk_period;
        seed <= null_seed;
        WAIT FOR clk_period * 5;

        mdt_hit <= ('1', to_signed(934, z_width), to_unsigned(2128, x_width), '0', to_unsigned(372, r_width), (OTHERS => '0'));
        WAIT FOR clk_period;
        mdt_hit <= ('1', to_signed(1415, z_width), to_unsigned(2128, x_width), '0', to_unsigned(280, r_width), (OTHERS => '0'));
        WAIT FOR clk_period;
        mdt_hit <= ('1', to_signed(1895, z_width), to_unsigned(2713, x_width), '1', to_unsigned(69, r_width), (OTHERS => '0'));
        WAIT FOR clk_period;
        mdt_hit <= ('1', to_signed(2136, z_width), to_unsigned(3129, x_width), '1', to_unsigned(227, r_width), (OTHERS => '0'));
        WAIT FOR clk_period;
        mdt_hit <= ('1', to_signed(2616, z_width), to_unsigned(3129, x_width), '1', to_unsigned(429, r_width), (OTHERS => '0'));
        WAIT FOR clk_period;
        mdt_hit <= ('1', to_signed(2856, z_width), to_unsigned(3545, x_width), '1', to_unsigned(135, r_width), (OTHERS => '0'));
        WAIT FOR clk_period;
        mdt_hit <= ('1', to_signed(3097, z_width), to_unsigned(3962, x_width), '1', to_unsigned(151, r_width), (OTHERS => '0'));
        WAIT FOR clk_period;
        mdt_hit <= ('1', to_signed(-90, z_width), to_unsigned(880, x_width), '0', to_unsigned(94, r_width), (OTHERS => '0'));
        WAIT FOR clk_period;
        mdt_hit <= ('1', to_signed(150, z_width), to_unsigned(1296, x_width), '0', to_unsigned(205, r_width), (OTHERS => '0'));

        WAIT FOR clk_period;
        mdt_hit <= null_mdt_hit;
        WAIT FOR clk_period * 5;
        eof <= '1';
        WAIT FOR clk_period;
        eof <= '0';
        WAIT;

    END PROCESS;
END Behavioral;
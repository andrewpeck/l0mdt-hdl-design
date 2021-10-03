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
library ieee;
  use ieee.std_logic_1164.ALL;
  use ieee.numeric_std.ALL;

library shared_lib;
  use shared_lib.common_ieee_pkg.ALL;
  use shared_lib.l0mdt_constants_pkg.ALL;
  use shared_lib.l0mdt_dataformats_pkg.ALL;
  use shared_lib.common_constants_pkg.ALL;
  use shared_lib.common_types_pkg.ALL;
  use shared_lib.config_pkg.ALL;
  use shared_lib.detector_param_pkg.ALL;

library csf_lib;
  use csf_lib.csf_pkg.ALL;
  use csf_lib.csf_custom_pkg.ALL;

library project_lib;
  
ENTITY csf_tb IS
    --  Port ( );
END csf_tb;

ARCHITECTURE Behavioral OF csf_tb IS
    SIGNAL clk : STD_LOGIC := '0';
    SIGNAL seed : heg2sfslc_rt;
    SIGNAL mdt_hit : heg2sfhit_rt;
    CONSTANT clk_period : TIME := 4.0 ns;
    SIGNAL eof : STD_LOGIC := '0';
    SIGNAL rst : STD_LOGIC := '0';
    signal v_seg : sf2ptcalc_rvt;
    signal seg : sf2ptcalc_rt;
BEGIN

    reader : ENTITY project_lib.csf_tb_reader
    generic map (
        IN_HIT_FILE => "csf_Barrel.csv"
    )
    port map(
        clk => clk,
        rst => rst,
        enable => 1,
        o_seed => seed,
        o_mdt_hit => mdt_hit,
        o_eof => eof
    );

    --csftop : ENTITY work.top_csf
    --    PORT MAP(
    --        clk => clk,
    --        i_seed => seed,
    --        i_mdt_hit => mdt_hit,
    --        i_eof => eof,
    --        o_seg => seg,
    --        i_rst => rst
    --    );

    writer : ENTITY project_lib.csf_tb_writer
    generic map (
        OUT_FILE => "out_csf.csv"
    )
    port map(
        clk => clk,
        rst => rst,
        enable => 1,
        segment => seg
    );


    CLK_process : PROCESS
    BEGIN
        CLK <= '0';
        WAIT FOR CLK_period/2;
        CLK <= '1';
        WAIT FOR CLK_period/2;
    END PROCESS;

    CSF : ENTITY csf_lib.csf
        port map (
            clk => clk,
            i_seed => vectorify(seed),
            i_mdt_hit => vectorify(mdt_hit),
            i_eof => eof,
            i_rst => rst,
            o_seg => v_seg,

            --SpuBuffer
            spy_clock           => clk,
            -- Hit Spybuffer
            i_spyhit_fc_we      => '0',
            i_spyhit_fc_re      => '0',
            i_spyhit_freeze     => '0',
            i_spyhit_playback   => (others => '0'),
            i_spyhit_pb_we      => '0',
            i_spyhit_pb_wdata   => (others => '0'),
            i_spyhit_re         => '0',
            i_spyhit_meta_we    => '0',
            i_spyhit_addr       => (others => '0'),
            i_spyhit_meta_addr  => (others => '0'),
            i_spyhit_meta_wdata => (others => '0'),

            -- SLC Spybuffer
            i_spyslc_fc_we      => '0',
            i_spyslc_fc_re      => '0',
            i_spyslc_freeze     => '0',
            i_spyslc_playback   => (others => '0'),
            i_spyslc_pb_we      => '0',
            i_spyslc_pb_wdata   => (others => '0'),
            i_spyslc_re         => '0',
            i_spyslc_addr       => (others => '0'),
            i_spyslc_meta_we    => '0',
            i_spyslc_meta_addr  => (others => '0'),
            i_spyslc_meta_wdata => (others => '0'),

            -- Segment Spybuffer
            i_spyseg_fc_we      => '0',
            i_spyseg_fc_re      => '0',
            i_spyseg_freeze     => '0',
            i_spyseg_playback   => (others => '0'),
            i_spyseg_pb_we      => '0',
            i_spyseg_pb_wdata   => (others => '0'),
            i_spyseg_re         => '0',
            i_spyseg_addr       => (others => '0'),
            i_spyseg_meta_addr  => (others => '0'),
            i_spyseg_meta_we    => '0',
            i_spyseg_meta_wdata => (others => '0')
    );

    seg <= structify(v_seg);

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
    --Pulse : PROCESS
    --BEGIN
    --    WAIT FOR clk_period * 5;
    --    seed.valid <= '1';
    --    seed.mbar <= to_signed(1112, mbar_width);
    --    seed.z <= to_signed(-76906, z_roi_width);
    --    seed.r <= to_unsigned(71019, r_roi_width);

    --    WAIT FOR clk_period;
    --    seed <= null_seed;
    --    WAIT FOR clk_period * 5;

    --    mdt_hit <= ('1', to_signed(934, z_width), to_unsigned(2128, x_width), '0', to_unsigned(372, r_width), (OTHERS => '0'));
    --    WAIT FOR clk_period;
    --    mdt_hit <= ('1', to_signed(1415, z_width), to_unsigned(2128, x_width), '0', to_unsigned(280, r_width), (OTHERS => '0'));
    --    WAIT FOR clk_period;
    --    mdt_hit <= ('1', to_signed(1895, z_width), to_unsigned(2713, x_width), '1', to_unsigned(69, r_width), (OTHERS => '0'));
    --    WAIT FOR clk_period;
    --    mdt_hit <= ('1', to_signed(2136, z_width), to_unsigned(3129, x_width), '1', to_unsigned(227, r_width), (OTHERS => '0'));
    --    WAIT FOR clk_period;
    --    mdt_hit <= ('1', to_signed(2616, z_width), to_unsigned(3129, x_width), '1', to_unsigned(429, r_width), (OTHERS => '0'));
    --    WAIT FOR clk_period;
    --    mdt_hit <= ('1', to_signed(2856, z_width), to_unsigned(3545, x_width), '1', to_unsigned(135, r_width), (OTHERS => '0'));
    --    WAIT FOR clk_period;
    --    mdt_hit <= ('1', to_signed(3097, z_width), to_unsigned(3962, x_width), '1', to_unsigned(151, r_width), (OTHERS => '0'));
    --    WAIT FOR clk_period;
    --    mdt_hit <= ('1', to_signed(-90, z_width), to_unsigned(880, x_width), '0', to_unsigned(94, r_width), (OTHERS => '0'));
    --    WAIT FOR clk_period;
    --    mdt_hit <= ('1', to_signed(150, z_width), to_unsigned(1296, x_width), '0', to_unsigned(205, r_width), (OTHERS => '0'));

    --    WAIT FOR clk_period;
    --    mdt_hit <= null_mdt_hit;
    --    WAIT FOR clk_period * 5;
    --    eof <= '1';
    --    WAIT FOR clk_period;
    --    eof <= '0';
    --    WAIT;

    --END PROCESS;
    
END Behavioral;
----------------------------------------------------------------------------------
-- Company: Max-Planck-Institut fuer Physik Munich
-- Engineer: Davide Cieri
-- 
-- Create Date: 09/10/2020
-- Design Name: 
-- Module Name: seg_coord_tb - Behavioral
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
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
USE ieee.math_real.ALL;

LIBRARY shared_lib;
USE shared_lib.common_ieee_pkg.ALL;
USE shared_lib.l0mdt_constants_pkg.ALL;
USE shared_lib.l0mdt_dataformats_pkg.ALL;
USE shared_lib.common_constants_pkg.ALL;
USE shared_lib.common_types_pkg.ALL;

LIBRARY csf_lib;
USE csf_lib.csf_pkg.ALL;
USE csf_lib.csf_custom_pkg.ALL;

ENTITY seg_coord_tb IS
    --  Port ( );
END seg_coord_tb;

ARCHITECTURE Behavioral OF seg_coord_tb IS
    SIGNAL clk : STD_LOGIC := '0';
    SIGNAL i_locseg : csf_locseg_vt := (OTHERS => '0');
    SIGNAL i_seed : heg2sfslc_vt := (OTHERS => '0');
    SIGNAL locseg : csf_locseg_rt;
    SIGNAL seed : heg2sfslc_rt;
    SIGNAL o_globseg : sf2ptcalc_vt := (OTHERS => '0');
    CONSTANT CLK_period : TIME := 2.77777 ns;
BEGIN

    seg_coord : ENTITY work.seg_coord_transform
        PORT MAP(
            clk => clk,
            i_locseg => i_locseg,
            i_seed => i_seed,
            o_globseg => o_globseg
        );

    CLK_process : PROCESS
    BEGIN
        CLK <= '0';
        WAIT FOR CLK_period/2;
        CLK <= '1';
        WAIT FOR CLK_period/2;
    END PROCESS;

    i_locseg <= convert(locseg);
    i_seed <= convert(seed);

    --    *** DIGI Local Seg *** 
    --y_digi: 2489.0000000000
    --m_digi: 1560.0000000000
    --y_ext_digi: 2489.0000000000
    --mx: 0.0000000000
    --y0_digi: 2489.0000000000
    --theta_digi: 241.3583979149

    --*** DIGI Global Seg ***
    --x_cmb_digi: 596.0000000000
    --y_cmb_digi: -248.0000000000
    --z_cmb_digi: 255.0000000000
    --x_glob_digi: 596.0000000000
    --y_glob_digi: -248.0000000000
    --z_glob_digi: 33884.5000000000
    --r_glob_digi: 645.5385348684

    Pulse : PROCESS
    BEGIN
        seed <= nullify(seed);
        locseg <= nullify(locseg);
        WAIT FOR clk_period * 5;
        seed.hewindow_pos <= to_unsigned(255, UCM2HPS_VEC_POS_LEN);
        seed.data_valid <= '1';
        WAIT FOR clk_period * 5;
        locseg.valid <= '1';
        locseg.b <= to_signed(2489, CSF_SEG_B_LEN);
        locseg.m <= to_signed(1560, CSF_SEG_M_LEN);
        WAIT FOR clk_period;
        locseg <= nullify(locseg);
        seed <= nullify(seed);
        WAIT;
    END PROCESS;
END Behavioral;
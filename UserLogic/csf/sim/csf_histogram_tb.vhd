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
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

LIBRARY shared_lib;
USE shared_lib.common_ieee_pkg.ALL;
USE shared_lib.l0mdt_constants_pkg.ALL;
USE shared_lib.l0mdt_dataformats_pkg.ALL;
USE shared_lib.common_constants_pkg.ALL;
USE shared_lib.common_types_pkg.ALL;

LIBRARY csf_lib;
USE csf_lib.csf_pkg.ALL;
USE csf_lib.csf_custom_pkg.ALL;

ENTITY csf_histogram_tb IS
    --  Port ( );
END csf_histogram_tb;

ARCHITECTURE Behavioral OF csf_histogram_tb IS
    SIGNAL clk : STD_LOGIC := '0';
    SIGNAL mdt_hit : heg2sfhit_rvt := (OTHERS => '0');
    SIGNAL seed : heg2sfslc_rvt := (OTHERS => '0');
    SIGNAL eof : STD_LOGIC := '0';
    SIGNAL outputHit1 : csf_hit_rvt := (OTHERS => '0');
    SIGNAL outputHit2 : csf_hit_rvt := (OTHERS => '0');

    SIGNAL mdt_hit_t : heg2sfhit_rt;
    SIGNAL seed_t : heg2sfslc_rt;

    CONSTANT CLK_period : TIME := 4.0 ns;

BEGIN

    csf_histogram : ENTITY work.csf_histogram
        PORT MAP(
            clk => clk,
            i_mdthit => mdt_hit,
            i_seed => seed,
            i_eof => eof,
            o_histo_hit0 => outputHit1,
            o_histo_hit1 => outputHit2
        );

    CLK_process : PROCESS
    BEGIN
        CLK <= '0';
        WAIT FOR CLK_period/2;
        CLK <= '1';
        WAIT FOR CLK_period/2;
    END PROCESS;

    seed <= vectorify(seed_t);
    mdt_hit <= vectorify(mdt_hit_t);

    Pulse : PROCESS
    BEGIN
        WAIT FOR clk_period * 5;
        seed_t.data_valid <= '1';
        seed_t.vec_ang <= to_unsigned(1114, UCM_VEC_ANG_LEN);
        WAIT FOR clk_period;
        seed_t <= nullify(seed_t);
        WAIT FOR clk_period * 5;
        mdt_hit_t <= ('1', '0', to_unsigned(2978, HEG2SFHIT_LOCALX_LEN), to_unsigned(9256, HEG2SFHIT_LOCALY_LEN), to_unsigned(372, HEG2SFHIT_RADIUS_LEN));
        WAIT FOR clk_period;
        mdt_hit_t <= ('1', '0', to_unsigned(2978, HEG2SFHIT_LOCALX_LEN), to_unsigned(10218, HEG2SFHIT_LOCALY_LEN), to_unsigned(280, HEG2SFHIT_RADIUS_LEN));
        WAIT FOR clk_period;
        mdt_hit_t <= ('1', '0', to_unsigned(481, HEG2SFHIT_LOCALX_LEN), to_unsigned(7208, HEG2SFHIT_LOCALY_LEN), to_unsigned(94, HEG2SFHIT_RADIUS_LEN));
        WAIT FOR clk_period;
        mdt_hit_t <= ('1', '0', to_unsigned(1313, HEG2SFHIT_LOCALX_LEN), to_unsigned(7689, HEG2SFHIT_LOCALY_LEN), to_unsigned(205, HEG2SFHIT_RADIUS_LEN));
        WAIT FOR clk_period;
        mdt_hit_t <= nullify(mdt_hit_t);
        WAIT FOR clk_period * 5;
        eof <= '1';
        WAIT FOR clk_period;
        eof <= '0';
        WAIT;

    END PROCESS;
END Behavioral;
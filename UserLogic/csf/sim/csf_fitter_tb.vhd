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
ENTITY csf_fitter_tb IS
    --  Port ( );
END csf_fitter_tb;

ARCHITECTURE Behavioral OF csf_fitter_tb IS
    SIGNAL clk : STD_LOGIC := '0';
    SIGNAL hit1, hit2 : csf_hit_rvt := (OTHERS => '0');
    SIGNAL hit1_t, hit2_t : csf_hit_rt;
    SIGNAL mfit : signed(CSF_SEG_M_LEN - 1 DOWNTO 0) := (OTHERS => '0');
    SIGNAL bfit : signed(CSF_SEG_B_LEN - 1 DOWNTO 0) := (OTHERS => '0');
    SIGNAL fit_valid : STD_LOGIC := '0';
    SIGNAL nhits : unsigned(CSF_MAXHITS_SEG_LEN - 1 DOWNTO 0) := (OTHERS => '0');
    SIGNAL CLK_period : TIME := 2.77777 ns;
    SIGNAL seg : csf_locseg_rvt := (OTHERS => '0');

BEGIN

    csf_fitter : ENTITY work.csf_fitter
        PORT MAP(
            clk => clk,
            i_hit1 => hit1,
            i_hit2 => hit2,
            o_mfit => mfit,
            o_bfit => bfit,
            o_fit_valid => fit_valid,
            o_nhits => nhits
        );

    csf_chi2 : ENTITY work.csf_chi2
        PORT MAP(
            clk => clk,
            i_hit1 => hit1,
            i_hit2 => hit2,
            i_mfit => mfit,
            i_bfit => bfit,
            i_nhits => nhits,
            i_fit_valid => fit_valid,
            i_rst => '0',
            o_seg => seg
        );
    CLK_process : PROCESS
    BEGIN
        CLK <= '0';
        WAIT FOR CLK_period/2;
        CLK <= '1';
        WAIT FOR CLK_period/2;
    END PROCESS;

    --y: 2549 x: 318
    --y: 3104 x: 772
    --y: 15752 x: 12960
    --y: 16269 x: 13456
    --y: 16956 x: 14058

    hit1 <= vectorify(hit1_t);
    hit2 <= vectorify(hit2_t);

    Pulse : PROCESS
    BEGIN
        WAIT FOR clk_period * 5;
        hit1_t <= ('1', to_unsigned(318, MDT_LOCAL_X_LEN), to_unsigned(2549, MDT_LOCAL_Y_LEN));
        hit2_t <= ('1', to_unsigned(12960, MDT_LOCAL_X_LEN), to_unsigned(15752, MDT_LOCAL_Y_LEN));
        WAIT FOR clk_period;
        hit1_t <= ('1', to_unsigned(772, MDT_LOCAL_X_LEN), to_unsigned(3104, MDT_LOCAL_Y_LEN));
        hit2_t <= ('1', to_unsigned(13456, MDT_LOCAL_X_LEN), to_unsigned(16269, MDT_LOCAL_Y_LEN));
        WAIT FOR clk_period;
        hit1_t <= nullify(hit1_t);
        hit2_t <= ('1', to_unsigned(14058, MDT_LOCAL_X_LEN), to_unsigned(16956, MDT_LOCAL_Y_LEN));
        WAIT FOR clk_period;
        hit2_t <= nullify(hit2_t);
        WAIT;

    END PROCESS;

END Behavioral;
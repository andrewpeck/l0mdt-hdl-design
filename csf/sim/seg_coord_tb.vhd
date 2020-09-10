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
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

library shared_lib;
use shared_lib.common_ieee_pkg.all;
use shared_lib.l0mdt_constants_pkg.all;
use shared_lib.l0mdt_dataformats_pkg.all;
use shared_lib.common_constants_pkg.all;
use shared_lib.common_types_pkg.all;

library csf_lib;
use csf_lib.csf_pkg.all;
use csf_lib.csf_custom_pkg.all;

entity seg_coord_tb is
--  Port ( );
end seg_coord_tb;

architecture Behavioral of seg_coord_tb is
    signal clk : std_logic := '0';
    signal i_locseg : csf_locseg_rvt := (others => '0');
    signal i_seed : heg2sfslc_rvt := (others => '0');
    signal locseg : csf_locseg_rt;
    signal seed : heg2sfslc_rt;
    signal o_globseg : sf2ptcalc_rvt := (others => '0');
    constant CLK_period : time := 2.77777 ns;


begin

    seg_coord : entity work.seg_coord_transform
    port map(
      clk         => clk,
      i_locseg    => i_locseg,
      i_seed      => i_seed,
      o_globseg   => o_globseg
    );

    CLK_process :process
    begin
        CLK <= '0';
        wait for CLK_period/2;
        CLK <= '1';
        wait for CLK_period/2;
    end process;

    i_locseg <= vectorify(locseg);
    i_seed <= vectorify(seed);

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

    Pulse : process
    begin
        seed <= nullify(seed);
        locseg <= nullify(locseg);
        wait for clk_period*5;
        seed.hewindow_pos <= to_unsigned(255, UCM2HPS_VEC_POS_LEN);
        seed.data_valid <= '1';
        wait for clk_period*5;
        locseg.valid <= '1';
        locseg.b <= to_signed(2489, CSF_SEG_B_LEN);
        locseg.m <= to_signed(1560, CSF_SEG_M_LEN);
        wait for clk_period;
        locseg <= nullify(locseg);
        seed <= nullify(seed);
        wait;
    end process;
end Behavioral;
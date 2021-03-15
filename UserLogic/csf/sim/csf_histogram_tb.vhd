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


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

library shared_lib;
use shared_lib.common_ieee_pkg.all;
use shared_lib.l0mdt_constants_pkg.all;
use shared_lib.l0mdt_dataformats_pkg.all;
use shared_lib.common_constants_pkg.all;
use shared_lib.common_types_pkg.all;

library csf_lib;
use csf_lib.csf_pkg.all;
use csf_lib.csf_custom_pkg.all;

entity csf_histogram_tb is
--  Port ( );
end csf_histogram_tb;

architecture Behavioral of csf_histogram_tb is
    signal clk          : std_logic := '0';
    signal mdt_hit      : heg2sfhit_rvt := (others => '0');
    signal seed         : heg2sfslc_rvt := (others => '0');
    signal eof          : std_logic := '0';
    signal outputHit1   : csf_hit_rvt := (others => '0');
    signal outputHit2   : csf_hit_rvt := (others => '0');

    signal mdt_hit_t : heg2sfhit_rt;
    signal seed_t : heg2sfslc_rt;

    constant CLK_period : time := 4.0 ns;

begin

    csf_histogram : entity work.csf_histogram
    Port map(
        clk         => clk,
        i_mdthit    => mdt_hit,
        i_seed      => seed,
        i_eof       => eof,
        o_histo_hit0  => outputHit1,
        o_histo_hit1  => outputHit2
    );

    CLK_process :process
    begin
        CLK <= '0';
        wait for CLK_period/2;
        CLK <= '1';
        wait for CLK_period/2;
    end process;

    seed <= vectorify(seed_t);
    mdt_hit <= vectorify(mdt_hit_t);

    Pulse : process
    begin
        wait for clk_period*5;
        seed_t.data_valid <= '1';
        seed_t.vec_ang <= to_unsigned(1114,UCM_VEC_ANG_LEN);
        wait for clk_period;
        seed_t <= nullify(seed_t);
        wait for clk_period*5;
        mdt_hit_t <= ('1', '0', to_unsigned(2978, HEG2SFHIT_LOCALX_LEN), to_unsigned(9256, HEG2SFHIT_LOCALY_LEN),  to_unsigned(372, HEG2SFHIT_RADIUS_LEN));
        wait for clk_period;
        mdt_hit_t <= ('1', '0', to_unsigned(2978, HEG2SFHIT_LOCALX_LEN), to_unsigned(10218, HEG2SFHIT_LOCALY_LEN), to_unsigned(280, HEG2SFHIT_RADIUS_LEN));
        wait for clk_period;
        mdt_hit_t <= ('1', '0', to_unsigned(481, HEG2SFHIT_LOCALX_LEN), to_unsigned(7208, HEG2SFHIT_LOCALY_LEN), to_unsigned(94, HEG2SFHIT_RADIUS_LEN));
        wait for clk_period;
        mdt_hit_t <= ('1', '0', to_unsigned(1313, HEG2SFHIT_LOCALX_LEN), to_unsigned(7689, HEG2SFHIT_LOCALY_LEN), to_unsigned(205, HEG2SFHIT_RADIUS_LEN));
        wait for clk_period;
        mdt_hit_t <= nullify(mdt_hit_t);
        wait for clk_period*5;
        eof <= '1';
        wait for clk_period;
        eof <= '0';
        wait;

    end process;


end Behavioral;

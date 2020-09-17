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


entity csf_fitter_tb is
--  Port ( );
end csf_fitter_tb;

architecture Behavioral of csf_fitter_tb is
    signal clk : std_logic := '0';
    signal hit1, hit2 : csf_hit_rvt := (others => '0');
    signal hit1_t, hit2_t : csf_hit_rt;
    signal mfit : signed(CSF_SEG_M_LEN-1 downto 0) := (others => '0');
    signal bfit : signed(CSF_SEG_B_LEN-1 downto 0) := (others => '0');
    signal fit_valid : std_logic := '0';
    signal nhits : unsigned(CSF_MAXHITS_SEG_LEN-1 downto 0) := (others => '0');
    signal CLK_period : time := 2.77777 ns;
    signal seg :csf_locseg_rvt := (others => '0');

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

    csf_chi2 : entity work.csf_chi2
    port map(
        clk        => clk,
        i_hit1     => hit1,
        i_hit2     => hit2,
        i_mfit     => mfit,
        i_bfit     => bfit,
        i_nhits    => nhits,
        i_fit_valid  => fit_valid,
        i_rst      => '0',
        o_seg      => seg
    );


    CLK_process :process
    begin
        CLK <= '0';
        wait for CLK_period/2;
        CLK <= '1';
        wait for CLK_period/2;
    end process;

    --y: 2549 x: 318
    --y: 3104 x: 772
    --y: 15752 x: 12960
    --y: 16269 x: 13456
    --y: 16956 x: 14058

    hit1 <= vectorify(hit1_t);
    hit2 <= vectorify(hit2_t);

    Pulse : process
    begin
        wait for clk_period*5;
        hit1_t <= ('1', to_unsigned(318, MDT_LOCAL_X_LEN), to_unsigned(2549, MDT_LOCAL_Y_LEN));
        hit2_t <= ('1', to_unsigned(12960, MDT_LOCAL_X_LEN), to_unsigned(15752, MDT_LOCAL_Y_LEN));
        wait for clk_period;
        hit1_t <= ('1', to_unsigned(772, MDT_LOCAL_X_LEN), to_unsigned(3104, MDT_LOCAL_Y_LEN));
        hit2_t <= ('1', to_unsigned(13456, MDT_LOCAL_X_LEN), to_unsigned(16269, MDT_LOCAL_Y_LEN));
        wait for clk_period;
        hit1_t <= nullify(hit1_t);
        hit2_t <= ('1', to_unsigned(14058, MDT_LOCAL_X_LEN), to_unsigned(16956, MDT_LOCAL_Y_LEN));
        wait for clk_period;
        hit2_t <= nullify(hit2_t);


        wait;

    end process;

end Behavioral;

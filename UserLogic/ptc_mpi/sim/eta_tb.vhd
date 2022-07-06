----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/11/2019 01:23:38 PM
-- Design Name: 
-- Module Name: eta_tb - Behavioral
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
use shared_lib.config_pkg.all;

library ptc_lib;
use ptc_lib.pt_pkg.all;
use ptc_lib.pt_params_pkg.all;

entity eta_tb is
--  Port ( );
end eta_tb;

architecture Behavioral of eta_tb is
    signal clk : std_logic := '0';
    signal i_seg : sf2ptcalc_vt;
    signal seg: sf2ptcalc_rt;
    signal o_eta   : signed(PTCALC2MTC_MDT_ETA_LEN-1 downto 0);
    signal o_dv_eta  :  std_logic := '0';
    constant CLK_period : time := 4.0 ns;
begin

    eta: entity ptc_mp_lib.eta_calculator
    port map(
        clk              => clk,
        i_seg            => i_seg,
        o_eta            => o_eta,
        o_dv_eta         => o_dv_eta
    );

    CLK_process :process
    begin
        CLK <= '0';
        wait for CLK_period/2;
        CLK <= '1';
        wait for CLK_period/2;
    end process;

    i_seg <= convert(seg);

    --=== Eta Calculation ===
    --zdigi -39160.0000 rdigi 38046.0000
    --z2 1533505600.0000 z_red -306.0000
    --mag2 11.0000 mag 424.0000
    --m_plus_z 118.0000 m_minus_z 730.0000
    --log_plus 7728.0000 log_minus 9591.0000
    --eta_digi -1863.0000 eta -0.9097
    
    Pulse : process
    begin
        wait for clk_period*5;
        seg.segpos <= to_unsigned(39160, SF2PTCALC_SEGPOS_LEN);
        seg.data_valid <= '1';

        wait for clk_period;
        seg <= zero(seg);
        wait;
        --assert (dv_sagitta = '1' and inv_sagitta = 3820) report "Correct Sagitta evaluated" severity NOTE ;
        --assert (dv_sagitta = '1' and inv_sagitta /= 3820) report "Wrong Sagitta evaluated" severity Error ;


    end process;


end Behavioral;

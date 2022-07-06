----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/11/2019 01:23:38 PM
-- Design Name: 
-- Module Name: sagitta_tb - Behavioral
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

entity sagitta_tb is
--  Port ( );
end sagitta_tb;

architecture Behavioral of sagitta_tb is
    signal clk : std_logic := '0';
    signal i_seg0, i_seg1, i_seg2 : sf2ptcalc_vt;
    signal seg0, seg1, seg2 : sf2ptcalc_rt;
    signal o_inv_s   : unsigned(INV_S_LEN-1 downto 0);
    signal o_dv_s      :  std_logic := '0';
    constant CLK_period : time := 4.0 ns;
begin

    sagitta_calculator : entity ptc_lib.sagitta_calculator
    port map(
        clk           => clk,
        i_seg0        => i_seg0,
        i_seg1        => i_seg1,
        i_seg2        => i_seg2,
        o_inv_s       => o_inv_s,
        o_dv_s        => o_dv_s
    );

    CLK_process :process
    begin
        CLK <= '0';
        wait for CLK_period/2;
        CLK <= '1';
        wait for CLK_period/2;
    end process;

    i_seg0 <= convert(seg0);
    i_seg1 <= convert(seg1);
    i_seg2 <= convert(seg2);

--    ***** MPI_TrackFitter DIGI debug ***********
--TVector3 A 3D physics vector (x,y,z)=(3362.936764,3362.935708,-4894.147499) (rho,theta,phi)=(6824.321211,135.820708,44.999991)
--TVector3 A 3D physics vector (x,y,z)=(4877.934340,4877.932809,-7083.292512) (rho,theta,phi)=(9887.441768,135.757464,44.999991)
--TVector3 A 3D physics vector (x,y,z)=(6547.413628,6547.411572,-9454.095179) (rho,theta,phi)=(13233.183259,135.595961,44.999991)
--Z[0] -4894.1475 Z[1] -7083.2925 Z[2] -9454.0952
--R[0] 4755.9100 R[1] 6898.4398 R[2] 9259.4397
--m_m_sagitta -1.0125 sagitta 13.8955 inv_sagitta 0.0720
--Z[0] 39153.0000 Z[1] 56666.0000 Z[2] 75632.0000
--R[0] 38047.0000 R[1] 55187.0000 R[2] 74075.0000
--delta_z_20 36479.0000 delta_z_10 17513.0000 delta_r_20 562.0000 delta_r_10 17140.0000
--rec_den_m 233.0000 m_sagitta_full 8703597568.0000 m_mult_delta_z_10 17933312.0000 m_sagitta 1037.0000 sqrt_m 1457.0000 den_sagitta -156.0000 rec_sagitta -27.0000 inv_sagitta_full -39339.0000 m_inv_sagitta -77.0000 sagitta -107.0000
    
    Pulse : process
    begin
        seg0 <= zero(seg0);
        seg1 <= zero(seg1);
        seg2 <= zero(seg2);
        wait for clk_period*5;
        seg0.segpos <= to_unsigned(39153, SF2PTCALC_SEGPOS_LEN);
        seg1.segpos <= to_unsigned(56666, SF2PTCALC_SEGPOS_LEN);
        seg2.segpos <= to_unsigned(75632, SF2PTCALC_SEGPOS_LEN);
        seg0.segangle <= to_unsigned(5136, SF2PTCALC_SEGANGLE_LEN);

        seg1.segangle <= to_unsigned(5216, SF2PTCALC_SEGANGLE_LEN);
        seg0.data_valid <= '1';
        seg1.data_valid <= '1';
        seg2.data_valid <= '0';


        wait for clk_period;
        seg0 <= zero(seg0);
        seg1 <= zero(seg1);
        seg2 <= zero(seg2);
        wait;
        --assert (dv_sagitta = '1' and inv_sagitta = 3820) report "Correct Sagitta evaluated" severity NOTE ;
        --assert (dv_sagitta = '1' and inv_sagitta /= 3820) report "Wrong Sagitta evaluated" severity Error ;


    end process;


end Behavioral;

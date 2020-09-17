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
    signal i_seg0, i_seg1, i_seg2 : sf2ptcalc_rvt;
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

    i_seg0 <= vectorify(seg0);
    i_seg1 <= vectorify(seg1);
    i_seg2 <= vectorify(seg2);

-- ComboId 03L_I4_M4_O4
--    Z[0] 30702.0000 Z[1] 44193.0000 Z[2] 58813.0000
--R[0] 38046.0000 R[1] 55186.0000 R[2] 74075.0000
--delta_z_20 28111.0000 delta_z_10 13491.0000 delta_r_20 562.0000 delta_r_10 17140.0000
--rec_den_m 3728.0000 m_sagitta_full 1717007286272.0000 m_mult_delta_z_10 221036544.0000 m_sagitta 12792.0000 sqrt_m 20786.0000 den_sagitta -14.0000 rec_sagitta -155345.0000 inv_sagitta_full -3229001170.0000 m_inv_sagitta -12318.0000 sagitta -86.0000


  --    type sf2ptcalc_rt is record
  --  data_valid : std_logic;
  --  muid : slc_muid_rt;
  --  segpos : unsigned(SF2PTCALC_SEGPOS_LEN-1 downto 0);
  --  segangle : unsigned(SF2PTCALC_SEGANGLE_LEN-1 downto 0);
  --  segquality : std_logic;
  --  mdtid : vec_mdtid_rt;
  --end record sf2ptcalc_rt;
    
    Pulse : process
    begin
        wait for clk_period*5;
        seg0.segpos <= to_unsigned(30702, SF2PTCALC_SEGPOS_LEN);
        seg1.segpos <= to_unsigned(44193, SF2PTCALC_SEGPOS_LEN);
        seg2.segpos <= to_unsigned(58813, SF2PTCALC_SEGPOS_LEN);
        seg0.data_valid <= '1';
        seg1.data_valid <= '1';
        seg2.data_valid <= '1';


        wait for clk_period;
        seg0 <= nullify(seg0);
        seg1 <= nullify(seg1);
        seg2 <= nullify(seg2);
        wait;
        --assert (dv_sagitta = '1' and inv_sagitta = 3820) report "Correct Sagitta evaluated" severity NOTE ;
        --assert (dv_sagitta = '1' and inv_sagitta /= 3820) report "Wrong Sagitta evaluated" severity Error ;


    end process;


end Behavioral;

----------------------------------------------------------------------------------
-- Company: Max-Planck-Institut fuer Physik, Munich
-- Engineer: Davide Cieri
-- 
-- Create Date: 02/11/2019 01:23:38 PM
-- Design Name: 
-- Module Name: pt_tb - Behavioral
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

entity pt_tb is
--  Port ( );
end pt_tb;

architecture Behavioral of pt_tb is
    signal clk : std_logic := '0';
    signal seg_I, seg_M, seg_O : sf2ptcalc_rt;
    signal i_segment_I, i_segment_M, i_segment_O : sf2ptcalc_rvt := (others => '0');
    signal i_SLC : pl2ptcalc_rvt := (others => '0');
    signal slc : pl2ptcalc_rt;
    signal o_mtc : ptcalc2mtc_rvt := (others => '0');
    signal rst : std_logic := '0';
    constant CLK_period : time := 4.0 ns;

begin
    
    pt : entity ptc_lib.pt
    Port map(
        clk  => clk,
        i_segment_I => i_segment_I,
        i_segment_M => i_segment_M,
        i_segment_O => i_segment_O,
        i_SLC       => i_SLC,
        i_rst       => rst,
        o_mtc       => o_mtc
    );

    CLK_process :process
    begin
        CLK <= '0';
        wait for CLK_period/2;
        CLK <= '1';
        wait for CLK_period/2;
    end process;

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
--sagitta float -13.3750 invsagitta float -0.0752
-- == 3-station method ==
--ComboId 03BL_I5_M5_O5
--phiSectorCenter 0.7854 phi 0.7854
--a0 2.0599 a1 531.7054 b0 4.4427 b1 5.1689 b2 -183.4191 c0 15.9731 c1 -18.6350
--s -0.0752 phi 0.2302 eta -0.9018
--pt_s 42.0416 pt_phi 4.0881 pt_et
--Floating point pt: 46.9612
-- == 3-station method ==
--ComboId 03BL_I5_M5_O5
--float a0 2.0599 a1 531.7054
--float b0 4.4427 b1 5.1689 b2 -183.4191
--float c0 15.9731 c1 -18.6350
--sagitta -0.0752 phimod 0.2302 eta -0.9018
--=== Eta Calculation ===
--z_float 4864.0000 r_float 4755.9100
--mag 6802.7330
--eta_digi 1837.0000 eta 0.8970
--s_digi 77.0000 a0 4.0000 a1 1063.0000 pt_s 83.0000 float 41.5000
--INV_SAGITTA_MULT 1024.0000 MTC_PT_MULTI 2.0000 MTC_PHI_MULTI 256.0000
--phi_digi 58.0000 b0 71.0000 b1 83.0000 b2 -2935.0000 pt_phi -61.0000 float -3.8125
--eta_digi 1837.0000 c0 256.0000 c1 -298.0000 pt_eta -12.0000 float -0.7500
--Digitised pt: 92.0000
--Float pt 46.0000
--mpi_pt DIGI 46.0000
--muon pt 46.3214

    i_SLC <= vectorify(slc);
    i_segment_I <= vectorify(seg_I);
    i_segment_M <= vectorify(seg_M);
    i_segment_O <= vectorify(seg_O);

    --Z[0] -39160.0000 Z[1] -56670.0000 Z[2] -75641.0000


    Pulse : process
    begin
        slc <= nullify(slc);
        seg_I <= nullify(seg_I);
        seg_M <= nullify(seg_M);
        seg_O <= nullify(seg_O);
        wait for clk_period*5;
        slc.data_valid <= '1';
        slc.phimod <= to_signed(58,UCM2PL_PHIMOD_LEN);
        wait for clk_period;
        slc <= nullify(slc);
        wait for clk_period*10;
        seg_I.data_valid <= '1';
        seg_I.segpos <= to_unsigned(39153, SF2PTCALC_SEGPOS_LEN);
        seg_I.mdtid.chamber_ieta <= to_unsigned(5, VEC_MDTID_CHAMBER_IETA_LEN);

        seg_M.data_valid <= '1';
        seg_M.segpos <= to_unsigned(56666, SF2PTCALC_SEGPOS_LEN);
        seg_M.mdtid.chamber_ieta <= to_unsigned(5, VEC_MDTID_CHAMBER_IETA_LEN);

        seg_O.data_valid <= '1';
        seg_O.segpos <= to_unsigned(75632, SF2PTCALC_SEGPOS_LEN);
        seg_O.mdtid.chamber_ieta <= to_unsigned(5, VEC_MDTID_CHAMBER_IETA_LEN);
        wait for clk_period;
        seg_I <= nullify(seg_I);
        seg_M <= nullify(seg_M);
        seg_O <= nullify(seg_O);
        
        wait;

    end process;


end Behavioral;

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

    --   ***** MPI_TrackFitter DIGI debug ***********
    --TVector3 A 3D physics vector (x,y,z)=(3362.875000,3362.875000,-4894.937500) (rho,theta,phi)=(6824.827445,135.825852,45.000000)
    --TVector3 A 3D physics vector (x,y,z)=(4877.875000,4877.875000,-7083.750000) (rho,theta,phi)=(9887.711722,135.759658,45.000000)
    --TVector3 A 3D physics vector (x,y,z)=(6547.375000,6547.375000,-9455.062500) (rho,theta,phi)=(13233.837148,135.599056,45.000000)
    --Z[0] -4894.9375 Z[1] -7083.7500 Z[2] -9455.0625
    --R[0] 4755.8234 R[1] 6898.3570 R[2] 9259.3865
    --m_m_sagitta -1.0126 sagitta 13.6110 inv_sagitta 0.0735
    --Z[0] 39159.0000 Z[1] 56670.0000 Z[2] 75640.0000
    --R[0] 38046.0000 R[1] 55186.0000 R[2] 74075.0000
    --delta_z_20 36481.0000 delta_z_10 17511.0000 delta_r_20 562.0000 delta_r_10 17140.0000
    --rec_den_m 3728.0000 m_sagitta_full 2228243136512.0000 m_mult_delta_z_10 286900224.0000 m_sagitta 16601.0000 sqrt_m 23324.0000 den_sagitta -18.0000 rec_sagitta -119838.0000 inv_sagitta_full -2795101512.0000 m_inv_sagitta -10663.0000 sagitta -99.0000
    --sagitta float -12.3750 invsagitta float -0.0814
    -- == 3-station method ==
    --ComboId 03L_I5_M5_O5
    --phiSectorCenter 0.7854 phi 0.7854
    --a0 3.3105 a1 478.9977 b0 1.3043 b1 4.7233 b2 -186.1890 c0 5.2262 c1 -4.5117
    --s -0.0814 phi 0.2302 eta -0.9019
    --pt_s 42.2780 pt_phi 7.4758 pt_eta -1.1570
    --Floating point pt: 48.5968
    -- == 3-station method ==
    --ComboId 03L_I5_M5_O5
    --float a0 3.3105 a1 478.9977
    --float b0 1.3043 b1 4.7233 b2 -186.1890
    --float c0 5.2262 c1 -4.5117
    --sagitta -0.0814 phimod 0.2302 eta -0.9019
    --=== Eta Calculation ===
    --zdigi 39159.0000 rdigi 38046.0000
    --z2 1533427281.0000 z_red 305.0000
    --mag2 11.0000 mag 424.0000
    --m_plus_z 729.0000 m_minus_z 119.0000
    --log_plus 9589.0000 log_minus 7737.0000
    --eta_digi 1852.0000 eta 0.9043
    --s_digi 10663.0000 a0 7.0000 a1 958.0000 pt_s 84.0000 float 42.0000
    --INV_SAGITTA_MULT 131072.0000 MTC_PT_MULTI 2.0000 MTC_PHI_MULTI 256.0000
    --phi_digi 58.0000 b0 21.0000 b1 76.0000 b2 -2979.0000 pt_phi -115.0000 float -7.1875
    --eta_digi 1852.0000 c0 84.0000 c1 -72.0000 pt_eta 18.0000 float 1.1250
    --Digitised pt: 96.0000
    --Float pt 48.0000
    --mpi_pt DIGI 48.0000
    --muon pt 46.3214

    i_SLC <= vectorify(slc);
    i_segment_I <= vectorify(seg_I);
    i_segment_M <= vectorify(seg_M);
    i_segment_O <= vectorify(seg_O);

    --Z[0] -39160.0000 Z[1] -56670.0000 Z[2] -75641.0000


    Pulse : process
    begin
        slc <= nullify(slc);
        wait for clk_period*5;
        slc.data_valid <= '1';
        slc.phimod <= to_signed(58,UCM2PL_PHIMOD_LEN);
        wait for clk_period;
        slc <= nullify(slc);
        wait for clk_period*10;
        seg_I.data_valid <= '1';
        seg_I.segpos <= to_unsigned(39159, SF2PTCALC_SEGPOS_LEN);
        seg_I.mdtid.chamber_ieta <= to_unsigned(5, VEC_MDTID_CHAMBER_IETA_LEN);

        seg_M.data_valid <= '1';
        seg_M.segpos <= to_unsigned(56670, SF2PTCALC_SEGPOS_LEN);
        seg_M.mdtid.chamber_ieta <= to_unsigned(5, VEC_MDTID_CHAMBER_IETA_LEN);

        seg_O.data_valid <= '1';
        seg_O.segpos <= to_unsigned(75640, SF2PTCALC_SEGPOS_LEN);
        seg_O.mdtid.chamber_ieta <= to_unsigned(5, VEC_MDTID_CHAMBER_IETA_LEN);
        wait for clk_period;
        seg_I <= nullify(seg_I);
        seg_M <= nullify(seg_M);
        seg_O <= nullify(seg_O);
        
        wait;

    end process;


end Behavioral;

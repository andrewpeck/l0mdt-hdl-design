--------------------------------------------------------------------------------
-- UMass , Physics Department
-- Project: src
-- File: ult_ucm.vhd
-- Module: <<moduleName>>
-- File PATH: /ult_ucm.vhd
-- -----
-- File Created: Thursday, 15th February 2024 9:45:20 am
-- Author: Guillermo Loustau de Linares (guillermo.ldl@cern.ch)
-- -----
-- Last Modified: Thursday, 15th February 2024 1:42:27 pm
-- Modified By: Guillermo Loustau de Linares (guillermo.ldl@cern.ch>)
-- -----
-- HISTORY:
--------------------------------------------------------------------------------

library ieee;
  use ieee.std_logic_1164.all;
  use ieee.numeric_std.all;

library shared_lib;
  use shared_lib.common_ieee_pkg.all;
  use shared_lib.l0mdt_constants_pkg.all;
  use shared_lib.l0mdt_dataformats_pkg.all;
  use shared_lib.common_constants_pkg.all;
  use shared_lib.common_types_pkg.all;
  use shared_lib.config_pkg.all;
 
library ucm_lib;
  use ucm_lib.ucm_pkg.all;

library ctrl_lib;
  use ctrl_lib.UCM_CTRL.all;

library fm_lib;
  use fm_lib.fm_types.all;

library ult_lib;
  use ult_lib.ult_pkg.all;

entity ult_ucm is
  port (
    -- pipeline clock and control
    clock_and_control : in l0mdt_control_rt;
    ttc_commands      : in l0mdt_ttc_rt;
    i_ull_super_globa_v : in ull_super_globa_vt;

    ctrl_v              : in  std_logic_vector;--UCM_CTRL_t;
    mon_v               : out std_logic_vector;--UCM_MON_t;
    -- Sector Logic Candidates
    i_slc_data_mainA_av     : in slc_rx_avt(2 downto 0);
    i_slc_data_mainB_av     : in slc_rx_avt(2 downto 0);
    i_slc_data_neighborA_v : in slc_rx_vt;
    i_slc_data_neighborB_v : in slc_rx_vt;
    -- Sector Logic Candidates Out of X-point Switch
    o_uCM2hps_inn_av        : out ucm2hps_avt(c_NUM_THREADS -1 downto 0);
    o_uCM2hps_mid_av        : out ucm2hps_avt(c_NUM_THREADS -1 downto 0);
    o_uCM2hps_out_av        : out ucm2hps_avt(c_NUM_THREADS -1 downto 0);
    o_uCM2hps_ext_av        : out ucm2hps_avt(c_NUM_THREADS -1 downto 0);
    -- pipeline
    o_uCM2pl_av             : out ucm2pl_avt(c_MAX_NUM_SL -1 downto 0);

    --Fast Monitoring
    o_ucm_fm_mon_v      : out std_logic_vector;
    i_ucm_fm_slc_rx_pb_v : in slc_rx_avt(2 downto 0);

    o_sump_b : out std_logic

    );
end entity ult_ucm;

architecture beh of ult_ucm is
  signal i_ull_super_globa_r : ull_super_globa_rt;
  signal glob_en : std_logic;
  signal glob_rst : std_logic;
  signal glob_freezer : std_logic;

  signal ucm_fm_mon_r              : fm_ucm_mon_data;
  signal slc_data_mainA_av     : slc_rx_avt(2 downto 0);
begin

  i_ull_super_globa_r <= convert(i_ull_super_globa_v,i_ull_super_globa_r);
  glob_en <= i_ull_super_globa_r.global_ena;
  glob_rst <= clock_and_control.rst or i_ull_super_globa_r.global_rst;
  glob_freezer <= i_ull_super_globa_r.global_freeze;


  ucm_gen : if c_UCM_ENABLED = '1' generate  
  
    UCM : entity ucm_lib.ucm
      port map(
        clk                     => clock_and_control.clk,
        rst                     => clock_and_control.rst,
        glob_en                 => glob_en,
        ttc_commands            => ttc_commands, 
        -- configuration, control & Monitoring
        ctrl_v                    => ctrl_v,
        mon_v                     => mon_v,
        -- SLc in
        i_slc_data_mainA_av     => slc_data_mainA_av, --i_slc_data_mainA_av,
        i_slc_data_mainB_av     => i_slc_data_mainB_av,
        i_slc_data_neighborA_v  => i_slc_data_neighborA_v,
        i_slc_data_neighborB_v  => i_slc_data_neighborB_v,
        -- pam out
        -- o_uCM2hps_pam_ar       => o_uCM2hps_pam_ar,
        o_uCM2hps_inn_av        => o_uCM2hps_inn_av,
        o_uCM2hps_mid_av        => o_uCM2hps_mid_av,
        o_uCM2hps_out_av        => o_uCM2hps_out_av,
        o_uCM2hps_ext_av        => o_uCM2hps_ext_av,
        -- MDT hit
        o_uCM2pl_av             => o_uCM2pl_av
      );
    -- end generate;

    

    FM_CTRL_GEN : if c_FM_ENABLED generate
      --FM Monitoting
      slc_data_mainA_av <= i_ucm_fm_slc_rx_pb_v;
      o_ucm_fm_mon_v <= convert(ucm_fm_mon_r, o_ucm_fm_mon_v);
        
      -- SL Candidates
      FM_SL_CANDIDATES: for I in 0 to 2  generate
        ucm_fm_mon_r.fm_ucm_slc_rx_mon(I).fm_data    <= (mon_dw_max-1 downto  slc_rx_rt'w => '0') & i_slc_data_mainA_av(I);
        ucm_fm_mon_r.fm_ucm_slc_rx_mon(I).fm_vld   <=  i_slc_data_mainA_av(I)( slc_rx_rt'w-1);
      end generate;
      --UCM2HPS
      FM_UCM2HPS_INN: for I in 0 to c_NUM_THREADS - 1 generate
        ucm_fm_mon_r.fm_ucm2hps.fm_ucm2hps_inn(I).fm_data <= (mon_dw_max-1 downto  ucm2hps_rt'w => '0') & o_uCM2hps_inn_av(I);
        ucm_fm_mon_r.fm_ucm2hps.fm_ucm2hps_inn(I).fm_vld   <= o_uCM2hps_inn_av(I)( ucm2hps_rt'w -1) ;
      end generate;

      FM_UCM2HPS_MID: for I in 0 to c_NUM_THREADS - 1 generate
        ucm_fm_mon_r.fm_ucm2hps.fm_ucm2hps_mid(I).fm_data <= (mon_dw_max-1 downto  ucm2hps_rt'w => '0') & o_uCM2hps_mid_av(I);
        ucm_fm_mon_r.fm_ucm2hps.fm_ucm2hps_mid(I).fm_vld   <= o_uCM2hps_mid_av(I)( ucm2hps_rt'w -1) ;
      end generate;

      FM_UCM2HPS_OUT: for I in 0 to c_NUM_THREADS - 1 generate
        ucm_fm_mon_r.fm_ucm2hps.fm_ucm2hps_out(I).fm_data <= (mon_dw_max-1 downto  ucm2hps_rt'w => '0') & o_uCM2hps_out_av(I);
        ucm_fm_mon_r.fm_ucm2hps.fm_ucm2hps_out(I).fm_vld   <= o_uCM2hps_out_av(I)( ucm2hps_rt'w -1) ;
      end generate;

      FM_UCM2PL: for I in 0 to c_MAX_NUM_SL - 1 generate
        ucm_fm_mon_r.fm_ucm2pl_mon(I).fm_data <= (mon_dw_max-1 downto  ucm2pl_rt'w => '0') & o_ucm2pl_av(I);
        ucm_fm_mon_r.fm_ucm2pl_mon(I).fm_vld   <=o_ucm2pl_av(I)(ucm2pl_rt'w-1);
      end generate;
    else generate
      slc_data_mainA_av <= i_slc_data_mainA_av;
      
    end generate;

  else generate

    -- ucm_mon_v <= (ucm_mon_v'length - 1 downto 0 => '0');

    sump_ucm : entity ult_lib.ucm_sump
      port map (
        clk                     => clock_and_control.clk,
        rst                     => clock_and_control.rst,
        glob_en                 => glob_en,
        ttc_commands            => ttc_commands, 
        -- configuration, control & Monitoring
        ctrl_v                  => ctrl_v,
        mon_v                   => mon_v,
        -- SLc in
        i_slc_data_mainA_av     => slc_data_mainA_av, --i_slc_data_mainA_av,
        i_slc_data_mainB_av     => i_slc_data_mainB_av,
        i_slc_data_neighborA_v  => i_slc_data_neighborA_v,
        i_slc_data_neighborB_v  => i_slc_data_neighborB_v,
        -- pam out
        -- o_uCM2hps_pam_ar       => o_uCM2hps_pam_ar,
        o_uCM2hps_inn_av        => o_uCM2hps_inn_av,
        o_uCM2hps_mid_av        => o_uCM2hps_mid_av,
        o_uCM2hps_out_av        => o_uCM2hps_out_av,
        o_uCM2hps_ext_av        => o_uCM2hps_ext_av,
        -- MDT hit
        o_uCM2pl_av             => o_uCM2pl_av,
        o_sump_b                => o_sump_b

      );

  end generate;
  
end architecture beh;

--------------------------------------------------------------------------------
--  UMass , Physics Department
--  Guillermo Loustau de Linares
--  guillermo.ldl@cern.ch
--------------------------------------------------------------------------------
--  Project: ATLAS L0MDT Trigger 
--  Module: User Logic Candidate Manager macro-block
--  Description:
--
--------------------------------------------------------------------------------
--  Revisions:
--      
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
use fm_lib.fm_common_types.all;

entity candidate_manager is
  port (
      -- pipeline clock and control
      clock_and_control : in l0mdt_control_rt;
      ttc_commands      : in l0mdt_ttc_rt;
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
      o_ucm2hps_fm_mon_v : out std_logic_vector
      );
end entity candidate_manager;

architecture beh of candidate_manager is
  signal glob_en : std_logic;
  signal ucm_fm_mon  : fm_ucm_fm_mon_data;
  signal ucm2hps_fm_mon : fm_ucm2hps_station_mon( 0 to stations_n-1);
begin

  glob_en <= '1';

 
  -- UCM : if c_UCM_ENABLED = '1' generate
  
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
      i_slc_data_mainA_av     => i_slc_data_mainA_av,
      i_slc_data_mainB_av     => i_slc_data_mainB_av,
      i_slc_data_neighborA_v => i_slc_data_neighborA_v,
      i_slc_data_neighborB_v => i_slc_data_neighborB_v,
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

  --FM Monitoting
    o_ucm_fm_mon_v <= convert(ucm_fm_mon, o_ucm_fm_mon_v);
  o_ucm2hps_fm_mon_v <= convert(ucm2hps_fm_mon, o_ucm2hps_fm_mon_v);
  -- SL Candidates
  FM_SL_CANDIDATES: for I in 0 to 2  generate
  ucm_fm_mon.fm_ucm_slc_rx_mon(I).fm_data    <= (mon_dw_max-1 downto  slc_rx_rt'w => '0') & i_slc_data_mainA_av(I);
  ucm_fm_mon.fm_ucm_slc_rx_mon(I).fm_vld   <=  i_slc_data_mainA_av(I)( slc_rx_rt'w-1);
  end generate;
  --UCM2HPS
  FM_UCM2HPS_INN: for I in 0 to c_NUM_THREADS - 1 generate
   ucm2hps_fm_mon(FM_INN)(I).fm_data <= (mon_dw_max-1 downto  ucm2hps_rt'w => '0') & o_uCM2hps_inn_av(I);
    ucm2hps_fm_mon(FM_INN)(I).fm_vld   <= o_uCM2hps_inn_av(I)( ucm2hps_rt'w -1) ;
    end generate;

     FM_UCM2HPS_MID: for I in 0 to c_NUM_THREADS - 1 generate
    ucm2hps_fm_mon(FM_MID)(I).fm_data <= (mon_dw_max-1 downto  ucm2hps_rt'w => '0') & o_uCM2hps_mid_av(I);
    ucm2hps_fm_mon(FM_MID)(I).fm_vld   <= o_uCM2hps_mid_av(I)( ucm2hps_rt'w -1) ;
    end generate;

      FM_UCM2HPS_OUT: for I in 0 to c_NUM_THREADS - 1 generate
    ucm2hps_fm_mon(FM_OUT)(I).fm_data <= (mon_dw_max-1 downto  ucm2hps_rt'w => '0') & o_uCM2hps_out_av(I);
    ucm2hps_fm_mon(FM_OUT)(I).fm_vld   <= o_uCM2hps_out_av(I)( ucm2hps_rt'w -1) ;
    end generate;

    FM_UCM2PL: for I in 0 to c_MAX_NUM_SL - 1 generate
      ucm_fm_mon.fm_ucm2pl_mon(I).fm_data <= (mon_dw_max-1 downto  ucm2pl_rt'w => '0') & o_ucm2pl_av(I);
      ucm_fm_mon.fm_ucm2pl_mon(I).fm_vld   <=o_ucm2pl_av(I)(ucm2pl_rt'w-1);
      end generate;
  
end architecture beh;

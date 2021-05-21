--------------------------------------------------------------------------------
--  UMass , Physics Department
--  Guillermo Loustau de Linares
--  gloustau@cern.ch
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

entity candidate_manager is
  port (
      -- pipeline clock and control
      clock_and_control : in l0mdt_control_rt;
      ttc_commands      : in l0mdt_ttc_rt;
      ctrl              : in  UCM_CTRL_t;
      mon               : out UCM_MON_t;
      -- Sector Logic Candidates
      i_slc_data_mainA_av     : in slc_rx_bus_avt(2 downto 0);
      i_slc_data_mainB_av     : in slc_rx_bus_avt(2 downto 0);
      i_slc_data_neighborA_v : in slc_rx_rvt;
      i_slc_data_neighborB_v : in slc_rx_rvt;
      -- Sector Logic Candidates Out of X-point Switch
      o_uCM2hps_inn_av        : out ucm2hps_bus_avt(c_NUM_THREADS -1 downto 0);
      o_uCM2hps_mid_av        : out ucm2hps_bus_avt(c_NUM_THREADS -1 downto 0);
      o_uCM2hps_out_av        : out ucm2hps_bus_avt(c_NUM_THREADS -1 downto 0);
      o_uCM2hps_ext_av        : out ucm2hps_bus_avt(c_NUM_THREADS -1 downto 0);
      -- pipeline
      o_uCM2pl_av             : out ucm2pl_bus_avt(c_MAX_NUM_SL -1 downto 0)
      );
end entity candidate_manager;

architecture beh of candidate_manager is
  signal glob_en : std_logic;
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
      ctrl                    => ctrl,
      mon                     => mon,
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
  
  
end architecture beh;

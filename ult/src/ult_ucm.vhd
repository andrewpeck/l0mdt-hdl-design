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

entity candidate_manager is
  port (
      -- pipeline clock
      clock_and_control : in l0mdt_control_rt;
      -- ttc
      ttc_commands : in l0mdt_ttc_rt;
      -- Sector Logic Candidates
      i_slc_data_mainA_av     : in slc_rx_data_avt(2 downto 0);
      i_slc_data_mainB_av     : in slc_rx_data_avt(2 downto 0);
      i_slc_data_neightborA_v : in slc_rx_data_rvt;
      i_slc_data_neightborB_v : in slc_rx_data_rvt;
      -- Sector Logic Candidates Out of X-point Switch
      o_uCM2hps_inn_av        : out ucm2hps_avt(c_NUM_THREADS -1 downto 0);
      o_uCM2hps_mid_av        : out ucm2hps_avt(c_NUM_THREADS -1 downto 0);
      o_uCM2hps_out_av        : out ucm2hps_avt(c_NUM_THREADS -1 downto 0);
      o_uCM2hps_ext_av        : out ucm2hps_avt(c_NUM_THREADS -1 downto 0);
      -- pipeline
      o_uCM2pl_av             : out ucm2pl_avt(c_MAX_NUM_SL -1 downto 0)
      );
end entity candidate_manager;

architecture beh of candidate_manager is
  signal glob_en : std_logic;
begin
  
  UCM : entity ucm_lib.ucm
  port map(
    clk                     => clock_and_control.clk,
    rst                     => clock_and_control.rst,
    glob_en                 => glob_en,
    -- configuration, control & Monitoring
    -- SLc in
    i_slc_data_mainA_av     => i_slc_data_mainA_av,
    i_slc_data_mainB_av     => i_slc_data_mainB_av,
    i_slc_data_neightborA_v => i_slc_data_neightborA_v,
    i_slc_data_neightborB_v => i_slc_data_neightborB_v,
    -- pam out
    -- o_uCM2hps_pam_ar       => o_uCM2hps_pam_ar,
    o_uCM2hps_inn_av        => o_uCM2hps_inn_av,
    o_uCM2hps_mid_av        => o_uCM2hps_mid_av,
    o_uCM2hps_out_av        => o_uCM2hps_out_av,
    o_uCM2hps_ext_av        => o_uCM2hps_ext_av,
    -- MDT hit
    o_uCM2pl_av             => o_uCM2pl_av
  );
  
  
end architecture beh;
--------------------------------------------------------------------------------
--  UMass , Physics Department
--  Guillermo Loustau de Linares
--  gloustau@cern.ch
--------------------------------------------------------------------------------
--  Project: ATLAS L0MDT Trigger 
--  Module: Muon Candidate Manager
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
use shared_lib.cfg_pkg.all;
use shared_lib.common_pkg.all;
library ucm_lib;
use ucm_lib.ucm_pkg.all;

entity ucm_tb is
  -- TB, no ports
end entity ucm_tb;

architecture beh of ucm_tb is
  
  signal clk : std_logic := '0';
  signal reset : std_logic := '0';
  
begin
  
  UCM : entity work.top_ucm
  port map(
    clk                 => clk,
    Reset_b             => Reset_b,
    glob_en             => glob_en,
    -- configuration, control & Monitoring
    -- SLc in
    i_slc_data_av          => i_slc_data_av,
    -- pam out
    o_uCM2hps_pam_ar       => o_uCM2hps_pam_ar,
    o_uCM2hps_data_av      => o_uCM2hps_data_av,
    -- MDT hit
    o_uCM2pl_av            => o_uCM2pl_av
  );
  
  
end architecture beh;
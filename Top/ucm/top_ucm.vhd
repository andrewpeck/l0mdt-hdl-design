--------------------------------------------------------------------------------
--  UMass , Physics Department
--  Guillermo Loustau de Linares
--  gloustau@cern.ch
--------------------------------------------------------------------------------
--  Project: ATLAS L0MDT Trigger 
--  Module: 
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
use shared_lib.config_pkg.all;
use shared_lib.common_pkg.all;
library ucm_lib;
use ucm_lib.ucm_pkg.all;


entity top_ucm is
  port (
    clk                 : in std_logic;
    Reset_b             : in std_logic;
    glob_en             : in std_logic;
    -- configuration, control & Monitoring
    -- SLc in
    i_slc_data_av          : in slc_rx_data_avt(MAX_NUM_SL -1 downto 0);
    -- to hps
    -- o_uCM2hps_pam_ar       : out ucm2heg_pam_art(MAX_NUM_HEG -1 downto 0);
    o_uCM2hps_data_av      : out ucm2hps_aavt(MAX_NUM_HPS -1 downto 0);
    -- pipeline
    o_uCM2pl_vav            : out pipeline_vavt
  );
end entity top_ucm;

architecture beh of top_ucm is

begin

  UCM : entity ucm_lib.ucm
  port map(
    clk                 => clk,
    Reset_b             => Reset_b,
    glob_en             => glob_en,
    -- configuration, control & Monitoring
    -- SLc in
    i_slc_data_av          => i_slc_data_av,
    -- pam out
    -- o_uCM2hps_pam_ar       => o_uCM2hps_pam_ar,
    o_uCM2hps_data_av      => o_uCM2hps_data_av,
    -- MDT hit
    o_uCM2pl_vav            => o_uCM2pl_vav
  );

end beh;
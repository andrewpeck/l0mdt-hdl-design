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
    -- o_uCM2hps_pam_ar       : out ucm2heg_pam_art(NUM_THREADS -1 downto 0);
    o_uCM2hps_inn_av      : out ucm2hps_avt(NUM_THREADS -1 downto 0);
    o_uCM2hps_mid_av      : out ucm2hps_avt(NUM_THREADS -1 downto 0);
    o_uCM2hps_out_av      : out ucm2hps_avt(NUM_THREADS -1 downto 0);
    o_uCM2hps_ext_av      : out ucm2hps_avt(NUM_THREADS -1 downto 0);
    -- pipeline
    o_uCM2pl_av            : out pipelines_avt(MAX_NUM_SL -1 downto 0)
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
    i_slc_data_av         => i_slc_data_av,
    -- pam out
    -- o_uCM2hps_pam_ar       => o_uCM2hps_pam_ar,
    o_uCM2hps_inn_av      => o_uCM2hps_inn_av,
    o_uCM2hps_mid_av      => o_uCM2hps_mid_av,
    o_uCM2hps_out_av      => o_uCM2hps_out_av,
    o_uCM2hps_ext_av      => o_uCM2hps_ext_av,
    -- MDT hit
    o_uCM2pl_av           => o_uCM2pl_av
  );

end beh;
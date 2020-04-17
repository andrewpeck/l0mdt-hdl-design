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
use shared_lib.cfg_pkg.all;
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
    i_slc_data          : in slprepro_Data_astdst(MAX_NUM_SL -1 downto 0);
    -- pam out
    o_uCM2hps_pam       : out ucm2heg_pam_art(MAX_NUM_HEG -1 downto 0);
    o_uCM2hps_data      : out ucm2hps_slc_astdst(MAX_NUM_HPS -1 downto 0);
    -- MDT hit
    o_uCM2pl            : out ucm_pl_data_astdst(MAX_NUM_SL -1 downto 0)
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
    i_slc_data          => i_slc_data,
    -- pam out
    o_uCM2hps_pam       => o_uCM2hps_pam,
    o_uCM2hps_data      => o_uCM2hps_data,
    -- MDT hit
    o_uCM2pl            => o_uCM2pl
  );

end beh;
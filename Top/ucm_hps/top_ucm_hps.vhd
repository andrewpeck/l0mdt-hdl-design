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

library ucm_hps_lib;
-- use ucm_hps_lib.ucm_hps.all;
library ucm_lib;
use ucm_lib.ucm_pkg.all;
library hp_lib;
use hp_lib.hp_pkg.all;
library heg_lib;
use heg_lib.heg_pkg.all;
library hps_lib;
use hps_lib.hps_pkg.all;


entity top_ucm_hps is
  port (
    clk                 : in std_logic;
    Reset_b             : in std_logic;
    glob_en             : in std_logic;
    -- configuration, control & Monitoring
    -- SLc
    i_slc_data_av       : in slc_rx_data_avt(MAX_NUM_SL -1 downto 0);
    -- MDT hit
    i_mdt_tar_av        : in tar2hps_aavt(MAX_NUM_HPS -1 downto 0);
    -- to pt calc
    o_sf2pt_av          : out sf2pt_aavt(MAX_NUM_HPS -1 downto 0);
    -- pipeline
    o_uCM2pl_vav        : out pipelines_avt
  );
end entity top_ucm_hps;

architecture beh of top_ucm_hps is

begin

  TOP : entity ucm_hps_lib.ucm_hps
  port map(
    clk                 => clk,
    Reset_b             => Reset_b,
    glob_en             => glob_en,
    -- configuration, control & Monitoring
    -- SLc in
    i_slc_data_av       => i_slc_data_av,
    -- MDT hit
    i_mdt_tar_av        => i_mdt_tar_av,
    -- to pt calc
    o_sf2pt_av          => o_sf2pt_av,
    -- MDT hit
    o_uCM2pl_vav        => o_uCM2pl_vav
  );


end beh;